-- ============================================================================
-- Modul: elevator_fsm_rt
-- Funktion: RT-Fahrstuhl-Automat mit Tür- und Fahrzeit (Timer), PIN-Logik,
--           LED/HEX-Ausgabe und explizitem Tür-Schließzustand (DOOR_CLOSE).
-- Zustände:
--   000 IDLE_LOCKED      : Ruhe, Tür zu, grün
--   001 CALL_MOVING      : Fahrt zur Nutzeretage
--   010 DOOR_OPEN_ENTRY  : Türöffnung vor PIN-Eingabe (Einsteigen)
--   011 PIN_ENTRY        : PIN-Eingabe
--   100 READY_SELECT     : Zielauswahl nach korrekter PIN
--   101 MOVING           : Fahrt zur Ziel-Etage
--   110 DOOR_OPEN_EXIT   : Türöffnung am Ziel (Aussteigen)
--   111 DOOR_CLOSE       : Tür-Schließen (gemeinsamer Zustand)
-- Übergänge mit Türrücknahme:
--   PIN korrekt: 011 -> 111 (schließen) -> 100
--   Am Ziel   : 110 -> 111 (schließen) -> 000
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.hex_pkg.all;

entity elevator_fsm_rt is
  generic(
    G_DOOR_MS             : natural := 3000;   -- Türzeit (Öffnen/Schließen) in ms
    G_TRAVEL_MS_PER_FLOOR : natural := 3000    -- Fahrzeit pro Etage in ms
  );
  port(
    clk, rst   : in  std_logic;                 -- Systemtakt/Reset
    k0_p, k1_p, k2_p, k3_p : in std_logic;      -- Taster-Impulse (one-shot)
    led_red, led_green, led_yellow : out std_logic;   -- LEDs
    hex0,hex1,hex5,hex6,hex7 : out std_logic_vector(6 downto 0); -- 7-Segment
    state_dbg : out std_logic_vector(2 downto 0);     -- Zustands-Debug
    tick_1ms  : in  std_logic                     -- 1ms-Tick
  );
end;

architecture rtl of elevator_fsm_rt is
  type state_t is (IDLE_LOCKED, CALL_MOVING, DOOR_OPEN_ENTRY, PIN_ENTRY,
                   READY_SELECT, MOVING, DOOR_OPEN_EXIT, DOOR_CLOSE);
  signal s, next_s : state_t := IDLE_LOCKED;

  -- Etagen
  signal current_floor, next_current_floor : integer range 1 to 3 := 1;
  signal user_floor,    next_user_floor    : integer range 1 to 3 := 1;
  signal target_floor,  next_target_floor  : integer range 1 to 3 := 1;

  -- PIN
  type pin_arr is array(0 to 1) of integer range 0 to 9;
  signal pin_digits, next_pin_digits : pin_arr := (0,0);
  signal pin_index,  next_pin_index  : integer range 0 to 1 := 0;
  constant correct_pin : pin_arr := (0,7);

  -- Anzeige-Flags
  signal show_error,   next_show_error   : std_logic := '0';
  signal target_valid, next_target_valid : std_logic := '0';

  -- Ziel des Tür-Schließens:
  --   '1' -> nach Schließen zu READY_SELECT
  --   '0' -> nach Schließen zu IDLE_LOCKED
  signal close_to_ready, next_close_to_ready : std_logic := '0';

  -- Timer
  signal door_start, door_busy, door_done : std_logic := '0';
  signal trav_start, trav_busy, trav_done : std_logic := '0';
  signal trav_ms  : unsigned(31 downto 0) := (others=>'0');
  signal door_ms  : unsigned(31 downto 0) := (others=>'0');
begin
  door_ms <= to_unsigned(G_DOOR_MS, 32);

  u_door: entity work.timer_ms
    port map(clk=>clk, rst=>rst, tick_1ms=>tick_1ms, start=>door_start,
             duration_ms=>door_ms, busy=>door_busy, done=>door_done);

  u_trav: entity work.timer_ms
    port map(clk=>clk, rst=>rst, tick_1ms=>tick_1ms, start=>trav_start,
             duration_ms=>trav_ms, busy=>trav_busy, done=>trav_done);

  -- Register
  process(clk)
  begin
    if rising_edge(clk) then
      if rst='1' then
        s <= IDLE_LOCKED;
        current_floor <= 1; user_floor <= 1; target_floor <= 1;
        pin_digits <= (0,0); pin_index <= 0;
        show_error <= '0'; target_valid <= '0';
        close_to_ready <= '0';
      else
        s <= next_s;
        current_floor <= next_current_floor;
        user_floor    <= next_user_floor;
        target_floor  <= next_target_floor;
        pin_digits    <= next_pin_digits;
        pin_index     <= next_pin_index;
        show_error    <= next_show_error;
        target_valid  <= next_target_valid;
        close_to_ready<= next_close_to_ready;
      end if;
    end if;
  end process;

  -- Next-State & Outputs
  process(s, k0_p,k1_p,k2_p,k3_p,
          current_floor, user_floor, target_floor,
          pin_digits, pin_index, show_error, target_valid, close_to_ready,
          door_busy, door_done, trav_busy, trav_done)
    variable v_next_s              : state_t;
    variable v_next_current_floor  : integer range 1 to 3;
    variable v_next_user_floor     : integer range 1 to 3;
    variable v_next_target_floor   : integer range 1 to 3;
    variable v_next_pin_digits     : pin_arr;
    variable v_next_pin_index      : integer range 0 to 1;
    variable v_next_show_error     : std_logic;
    variable v_next_target_valid   : std_logic;
    variable v_next_close_to_ready : std_logic;
    variable diff : integer;
  begin
    -- Defaults (halten)
    v_next_s             := s;
    v_next_current_floor := current_floor;
    v_next_user_floor    := user_floor;
    v_next_target_floor  := target_floor;
    v_next_pin_digits    := pin_digits;
    v_next_pin_index     := pin_index;
    v_next_show_error    := show_error;
    v_next_target_valid  := target_valid;
    v_next_close_to_ready:= close_to_ready;

    -- Standard-Ausgänge
    led_red   <= '0';
    led_green <= '1';
    led_yellow<= '0';
    hex0 <= digit_to_7seg(v_next_pin_digits(1));
    hex1 <= digit_to_7seg(v_next_pin_digits(0));
    hex5 <= SEG_DASH;
    if v_next_target_valid = '1' then
      hex5 <= digit_to_7seg(v_next_target_floor);
    end if;
    hex6 <= digit_to_7seg(v_next_current_floor);
    hex7 <= digit_to_7seg(1);   -- Busy=1 außerhalb IDLE (gemäß UC12)
                                -- (wenn du Busy=0 nur in IDLE willst, setze unten in IDLE auf 0)
    door_start <= '0';
    trav_start <= '0';
    trav_ms    <= (others=>'0');

    -- "E" one-shot
    if show_error = '1' then
      hex5 <= SEG_E;
      v_next_show_error := '0';
    end if;

    -- Zustandslogik
    case s is
      when IDLE_LOCKED =>
        hex7 <= digit_to_7seg(0);     -- Busy=0 nur in IDLE
        if k0_p='1' then
          v_next_user_floor := 1;
          if v_next_current_floor = 1 then v_next_s := DOOR_OPEN_ENTRY;
          else v_next_s := CALL_MOVING; end if;
        elsif k1_p='1' then
          v_next_user_floor := 2;
          if v_next_current_floor = 2 then v_next_s := DOOR_OPEN_ENTRY;
          else v_next_s := CALL_MOVING; end if;
        elsif k2_p='1' then
          v_next_user_floor := 3;
          if v_next_current_floor = 3 then v_next_s := DOOR_OPEN_ENTRY;
          else v_next_s := CALL_MOVING; end if;
        end if;

      when CALL_MOVING =>
        led_green  <= '0';
        led_yellow <= '1';
        diff := abs(v_next_user_floor - v_next_current_floor);
        if diff = 0 then
          v_next_s := DOOR_OPEN_ENTRY; -- guard
        else
          trav_ms <= to_unsigned(diff*G_TRAVEL_MS_PER_FLOOR, 32);
          if trav_busy='0' and trav_done='0' then trav_start <= '1'; end if;
          if trav_done='1' then
            v_next_current_floor := v_next_user_floor;
            v_next_s := DOOR_OPEN_ENTRY;    -- Tür öffnen für PIN
          end if;
        end if;

      when DOOR_OPEN_ENTRY =>
        -- Tür-Öffnen vor PIN (Einsteigen); LED rot, grün aus
        led_green <= '0';
        led_red   <= '1';
        if door_busy='0' and door_done='0' then door_start <= '1'; end if;
        if door_done='1' then
          v_next_pin_digits := (0,0);
          v_next_pin_index  := 0;
          v_next_s := PIN_ENTRY;
        end if;

      when PIN_ENTRY =>
        -- PIN-Eingabe; LED rot, grün aus
        led_green <= '0';
        led_red   <= '1';
        if k0_p='1' then
          if v_next_pin_index=0 then
            v_next_pin_digits(0) := (v_next_pin_digits(0)+1) mod 10;
          else
            v_next_pin_digits(1) := (v_next_pin_digits(1)+1) mod 10;
          end if;
        elsif k1_p='1' then
          if v_next_pin_index=0 then v_next_pin_index := 1; else v_next_pin_index := 0; end if;
        elsif k2_p='1' then
          if (v_next_pin_digits(0)=correct_pin(0)) and (v_next_pin_digits(1)=correct_pin(1)) then
            -- PIN korrekt: Tür SCHLIESSEN -> DOOR_CLOSE, danach READY
            v_next_close_to_ready := '1';
            v_next_s := DOOR_CLOSE;
          else
            -- PIN falsch: Tür erneut ÖFFNEN (erneute Eingabe)
            v_next_pin_digits := (0,0);
            v_next_pin_index  := 0;
            v_next_s := DOOR_OPEN_ENTRY;
          end if;
        end if;

      when READY_SELECT =>
        -- Zielauswahl; LED grün an
        if k0_p='1' then
          v_next_target_floor := 1; v_next_target_valid := '1';
        elsif k1_p='1' then
          v_next_target_floor := 2; v_next_target_valid := '1';
        elsif k2_p='1' then
          v_next_target_floor := 3; v_next_target_valid := '1';
        end if;
        if k3_p='1' then
          if v_next_target_valid='1' then
            if v_next_target_floor = v_next_current_floor then
              v_next_show_error   := '1';   -- "E" 1 Zyklus
              v_next_target_valid := '0';   -- zurück auf '-'
              v_next_s := READY_SELECT;
            else
              v_next_s := MOVING;
            end if;
          end if;
        end if;

      when MOVING =>
        led_green  <= '0';
        led_yellow <= '1';
        diff := abs(v_next_target_floor - v_next_current_floor);
        if diff = 0 then
          v_next_s := DOOR_OPEN_EXIT;  -- guard
        else
          trav_ms <= to_unsigned(diff*G_TRAVEL_MS_PER_FLOOR, 32);
          if trav_busy='0' and trav_done='0' then trav_start <= '1'; end if;
          if trav_done='1' then
            v_next_current_floor := v_next_target_floor;
            v_next_s := DOOR_OPEN_EXIT; -- am Ziel: Tür ÖFFNEN
          end if;
        end if;

      when DOOR_OPEN_EXIT =>
        -- Tür-Öffnen am Ziel (Aussteigen); LED rot
        led_green <= '0';
        led_red   <= '1';
        v_next_pin_digits := (0,0);
        v_next_pin_index  := 0;
        v_next_target_valid := '0';
        if door_busy='0' and door_done='0' then door_start <= '1'; end if;
        if door_done='1' then
          -- Danach TÜR SCHLIESSEN -> DOOR_CLOSE, Ziel = IDLE
          v_next_close_to_ready := '0';
          v_next_s := DOOR_CLOSE;
        end if;

      when DOOR_CLOSE =>
        -- Gemeinsamer Tür-Schließzustand (nach PIN oder nach Ziel)
        -- LED rot, grün aus
        led_green <= '0';
        led_red   <= '1';
        if door_busy='0' and door_done='0' then door_start <= '1'; end if;
        if door_done='1' then
          if v_next_close_to_ready='1' then
            v_next_close_to_ready := '0';
            v_next_s := READY_SELECT;  -- nach PIN korrekt
          else
            v_next_s := IDLE_LOCKED;   -- nach Ziel
          end if;
        end if;
    end case;

    -- Commit
    next_s             <= v_next_s;
    next_current_floor <= v_next_current_floor;
    next_user_floor    <= v_next_user_floor;
    next_target_floor  <= v_next_target_floor;
    next_pin_digits    <= v_next_pin_digits;
    next_pin_index     <= v_next_pin_index;
    next_show_error    <= v_next_show_error;
    next_target_valid  <= v_next_target_valid;
    next_close_to_ready<= v_next_close_to_ready;
  end process;

  -- Debug-Kodierung (explizit inklusive DOOR_CLOSE="111")
  with s select
    state_dbg <= "000" when IDLE_LOCKED,
                 "001" when CALL_MOVING,
                 "010" when DOOR_OPEN_ENTRY,
                 "011" when PIN_ENTRY,
                 "100" when READY_SELECT,
                 "101" when MOVING,
                 "110" when DOOR_OPEN_EXIT,
                 "111" when DOOR_CLOSE;
end architecture;

