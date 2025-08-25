-- ===========================================================
-- Projekt : Elevator Controller with PIN (2 digits)
-- Ebene  : Algorithmische Ebene (Behavioral)
-- Datei  : elevator_fsm_algo.vhd
-- Hinweise:
--   * KEYs werden hier als Active-High interpretiert (gedrückt = '1')
--     -> Für DE2-115 (Active-Low) später in RTL einfach invertieren.
--   * Bewegung ist "immediate jump" (ohne Counter) für schnelle Simulation.
--   * Saubere next_*-Architektur: keine mehrfachen Treiber.
-- ===========================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity elevator_fsm_algo is
  port (
    clk        : in  std_logic;
    reset      : in  std_logic;                     -- synchroner Reset, High aktiv
    key        : in  std_logic_vector(3 downto 0);  -- KEY0..KEY3 (Active-High)

    -- Status-LEDs
    led_red    : out std_logic;  -- Tür offen
    led_green  : out std_logic;  -- bereit / Tür zu
    led_yellow : out std_logic;  -- Bewegung

    -- 7-Seg (active-low segments a..g)
    hex0, hex1, hex5, hex6, hex7 : out std_logic_vector(6 downto 0);

    -- Debug: aktueller Zustand als Zahl (für Waveform)
    state_dbg  : out std_logic_vector(2 downto 0)
  );
end entity;

architecture behavioral of elevator_fsm_algo is

  -- Zustände
  type state_t is (
    IDLE_LOCKED,        -- 0
    CALL_MOVING,        -- 1
    DOOR_OPEN_ENTRY,    -- 2
    PIN_ENTRY,          -- 3
    READY_SELECT,       -- 4
    MOVING,             -- 5
    DOOR_OPEN_EXIT      -- 6
  );
  signal state, next_state : state_t := IDLE_LOCKED;

  -- Etagen
  signal current_floor      : integer range 1 to 3 := 1;
  signal next_current_floor : integer range 1 to 3 := 1;

  signal user_floor         : integer range 1 to 3 := 1;
  signal next_user_floor    : integer range 1 to 3 := 1;

  signal target_floor       : integer range 1 to 3 := 1;
  signal next_target_floor  : integer range 1 to 3 := 1;

  -- PIN (2 Stellen)
  type pin_arr is array (0 to 1) of integer range 0 to 9;
  signal pin_digits         : pin_arr := (0,0);
  signal next_pin_digits    : pin_arr := (0,0);

  signal pin_index          : integer range 0 to 1 := 0;
  signal next_pin_index     : integer range 0 to 1 := 0;

  constant correct_pin      : pin_arr := (0,7); -- "07"

  -- One-shot-Flag für verzögerte 'E'-Anzeige
  signal show_error, next_show_error : std_logic := '0';

  -- Zielauswahl gültig? (für HEX5: Zahl vs. Strich)
  signal target_valid, next_target_valid : std_logic := '0';

  -- 7-Segment Helfer (active-low a..g)
  function digit_to_7seg(d : integer) return std_logic_vector is
    variable seg : std_logic_vector(6 downto 0) := (others => '1');
  begin
    case d is
      when 0 => seg := "1000000";
      when 1 => seg := "1111001";
      when 2 => seg := "0100100";
      when 3 => seg := "0110000";
      when 4 => seg := "0011001";
      when 5 => seg := "0010010";
      when 6 => seg := "0000010";
      when 7 => seg := "1111000";
      when 8 => seg := "0000000";
      when 9 => seg := "0010000";
      when others => seg := "1111111"; -- blank
    end case;
    return seg;
  end function;

  -- Buchstabe 'E' (Error) (active-low), und Strich (nur g)
  constant SEG_E    : std_logic_vector(6 downto 0) := "0000110"; -- a,f,g,e,d ON
  constant SEG_DASH : std_logic_vector(6 downto 0) := "0111111"; -- nur g ON

begin
  -- =========================
  -- Synchronous state/update
  -- =========================
  process(clk)
  begin
    if rising_edge(clk) then
      if reset = '1' then
        state           <= IDLE_LOCKED;
        current_floor   <= 1;
        user_floor      <= 1;
        target_floor    <= 1;
        pin_digits      <= (0,0);
        pin_index       <= 0;
        show_error      <= '0';
        target_valid    <= '0';
      else
        state           <= next_state;
        current_floor   <= next_current_floor;
        user_floor      <= next_user_floor;
        target_floor    <= next_target_floor;
        pin_digits      <= next_pin_digits;
        pin_index       <= next_pin_index;
        show_error      <= next_show_error;
        target_valid    <= next_target_valid;
      end if;
    end if;
  end process;

  -- =========================
  -- Combinational next logic
  -- =========================
  process(state, key,
          current_floor, user_floor, target_floor,
          pin_digits, pin_index, show_error, target_valid)
    variable v_next_state          : state_t;
    variable v_next_current_floor  : integer range 1 to 3;
    variable v_next_user_floor     : integer range 1 to 3;
    variable v_next_target_floor   : integer range 1 to 3;
    variable v_next_pin_digits     : pin_arr;
    variable v_next_pin_index      : integer range 0 to 1;
    variable v_next_show_error     : std_logic;
    variable v_next_target_valid   : std_logic;
  begin
    -- Defaults (Hold)
    v_next_state         := state;
    v_next_current_floor := current_floor;
    v_next_user_floor    := user_floor;
    v_next_target_floor  := target_floor;
    v_next_pin_digits    := pin_digits;
    v_next_pin_index     := pin_index;
    v_next_show_error    := show_error;
    v_next_target_valid  := target_valid;

    -- Default LEDs
    led_red    <= '0';
    led_green  <= '1';
    led_yellow <= '0';

    -- Default 7-seg
    hex0 <= digit_to_7seg(pin_digits(1));
    hex1 <= digit_to_7seg(pin_digits(0));
    hex5 <= SEG_DASH;                          -- Standard: Strich (noch nichts gewählt)
    hex6 <= digit_to_7seg(current_floor);
    hex7 <= digit_to_7seg(0);                  -- busy=0 default

    -- Wenn bereits ein Ziel gewählt wurde, Zahl anzeigen
    if target_valid = '1' then
      hex5 <= digit_to_7seg(target_floor);
    end if;

    -- One-shot 'E' im Takt N+1 nach Confirm bei gleichem Ziel
    if show_error = '1' then
      hex5 <= SEG_E;                -- 1 Takt lang 'E'
      v_next_show_error := '0';     -- Flag automatisch löschen
    end if;

    case state is
      when IDLE_LOCKED =>
        led_green <= '1';
        hex7 <= digit_to_7seg(0);
        
        if key(0) = '1' then
          v_next_user_floor := 1;
          if current_floor = 1 then v_next_state := DOOR_OPEN_ENTRY; else v_next_state := CALL_MOVING; end if;
        elsif key(1) = '1' then
          v_next_user_floor := 2;
          if current_floor = 2 then v_next_state := DOOR_OPEN_ENTRY; else v_next_state := CALL_MOVING; end if;
        elsif key(2) = '1' then
          v_next_user_floor := 3;
          if current_floor = 3 then v_next_state := DOOR_OPEN_ENTRY; else v_next_state := CALL_MOVING; end if;
        end if;

      when CALL_MOVING =>
        led_green  <= '0';
        led_yellow <= '1';
        hex7       <= digit_to_7seg(1); -- busy
        -- Algorithmische Ebene: sofort zur Nutzeretage springen
        v_next_current_floor := v_next_user_floor;
        v_next_state         := DOOR_OPEN_ENTRY;

      when DOOR_OPEN_ENTRY =>
        led_green <= '0';
        led_red   <= '1';
        hex7      <= digit_to_7seg(1);
        v_next_pin_digits := (0,0);
        v_next_pin_index  := 0;
        v_next_state      := PIN_ENTRY;

      when PIN_ENTRY =>
        led_green <= '0';
        led_red   <= '1';
        hex7      <= digit_to_7seg(1);
        -- PIN bedienen
        if key(0) = '1' then
          -- NEXT auf aktuelle Stelle
          if v_next_pin_index = 0 then
            v_next_pin_digits(0) := (pin_digits(0) + 1) mod 10;
          else
            v_next_pin_digits(1) := (pin_digits(1) + 1) mod 10;
          end if;
        elsif key(1) = '1' then
          -- SELECT Stelle wechseln
          if v_next_pin_index = 0 then v_next_pin_index := 1; else v_next_pin_index := 0; end if;
        elsif key(2) = '1' then
          -- ENTER prüfen
          if (pin_digits(0) = correct_pin(0)) and (pin_digits(1) = correct_pin(1)) then
            v_next_state := READY_SELECT;
          else
            -- falscher PIN -> löschen und nochmal
            v_next_pin_digits := (0,0);
            v_next_pin_index  := 0;
            v_next_state      := DOOR_OPEN_ENTRY;
          end if;
        end if;

      when READY_SELECT =>
        led_green <= '1';
        hex7      <= digit_to_7seg(1); -- busy-Flag als "aktiv"

        -- Zielwahl (macht Anzeige gültig)
        if key(0) = '1' then
          v_next_target_floor := 1;
          v_next_target_valid := '1';
        elsif key(1) = '1' then
          v_next_target_floor := 2;
          v_next_target_valid := '1';
        elsif key(2) = '1' then
          v_next_target_floor := 3;
          v_next_target_valid := '1';
        end if;

        -- Bestätigen
        if key(3) = '1' then
          if v_next_target_valid = '1' then
            if v_next_target_floor = current_floor then
              -- gleiches Ziel: 1 Takt 'E', dann zurück zum Strich
              v_next_show_error   := '1';
              v_next_target_valid := '0';
              v_next_state        := READY_SELECT;
            else
              -- anderes Ziel: Fahrt starten, Anzeige des Ziels bleibt bis IDLE
              v_next_state        := MOVING;
            end if;
          else
            -- noch kein Ziel gewählt: ignorieren
            v_next_state          := READY_SELECT;
          end if;
        end if;

      when MOVING =>
        led_green  <= '0';
        led_yellow <= '1';
        hex7       <= digit_to_7seg(1); -- busy
        -- Algorithmische Ebene: sofort zum Ziel springen
        v_next_current_floor := v_next_target_floor;
        v_next_state         := DOOR_OPEN_EXIT;

      when DOOR_OPEN_EXIT =>
        led_green <= '0';
        led_red   <= '1';
        hex7      <= digit_to_7seg(1);
        v_next_pin_digits := (0,0);  -- reset pin, wenn zurück zum Zustand IDLE_LOCKED
        v_next_pin_index  := 0;
        v_next_target_valid := '0';  -- zurück auf Strich in IDLE_LOCKED
        -- Danach zurück zu IDLE (dort wird target_valid -> '0' gesetzt)
        v_next_state := IDLE_LOCKED;

      when others =>
        v_next_state := IDLE_LOCKED;
    end case;

    -- write back
    next_state         <= v_next_state;
    next_current_floor <= v_next_current_floor;
    next_user_floor    <= v_next_user_floor;
    next_target_floor  <= v_next_target_floor;
    next_pin_digits    <= v_next_pin_digits;
    next_pin_index     <= v_next_pin_index;
    next_show_error    <= v_next_show_error;
    next_target_valid  <= v_next_target_valid;
  end process;

  -- Zustand als Zahl (für Waveform)
  with state select
    state_dbg <= "000" when IDLE_LOCKED,
                 "001" when CALL_MOVING,
                 "010" when DOOR_OPEN_ENTRY,
                 "011" when PIN_ENTRY,
                 "100" when READY_SELECT,
                 "101" when MOVING,
                 "110" when DOOR_OPEN_EXIT,
                 "111" when others;

end architecture behavioral;

