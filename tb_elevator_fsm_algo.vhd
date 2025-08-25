-- ===========================================================
-- Ebene  : Algorithmische Ebene (Behavioral)
-- Datei  : tb_elevator_fsm_algo.vhd
-- Testbench zum Testen von Programmen auf Fehlerbehebungen
-- ===========================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_elevator_fsm_algo is
end entity;

architecture sim of tb_elevator_fsm_algo is
  -- ==== Eingaben / Beobachtung ====
  signal clk        : std_logic := '0';
  signal reset      : std_logic := '0';
  signal key        : std_logic_vector(3 downto 0) := (others => '0'); -- Active-High

  signal led_red    : std_logic;
  signal led_green  : std_logic;
  signal led_yellow : std_logic;
  signal hex0, hex1, hex5, hex6, hex7 : std_logic_vector(6 downto 0);
  signal state_dbg  : std_logic_vector(2 downto 0);

  constant Tclk : time := 20 ns;  -- 50 MHz

  -- 7-Segment Decoder (active-low g f e d c b a) -> Integer
  function seg7_to_int(seg: std_logic_vector(6 downto 0)) return integer is
  begin
    case seg is
      when "1000000" => return 0;
      when "1111001" => return 1;
      when "0100100" => return 2;
      when "0110000" => return 3;
      when "0011001" => return 4;
      when "0010010" => return 5;
      when "0000010" => return 6;
      when "1111000" => return 7;
      when "0000000" => return 8;
      when "0010000" => return 9;
      when "0000110" => return 14; -- 'E'
      when "0111111" => return -1; -- '-' (nur g ON)
      when others    => return -2;
    end case;
  end function;

  -- bequem im Waveform
  signal d_hex0, d_hex1, d_hex5, d_hex6, d_hex7 : integer := -1;

  -- Taktzähler
  signal clk_count : integer := 0;

  -- UC-Marker (dauerhaft je Use Case)  -> UC1..UC13
  signal uc1_flag, uc2_flag, uc3_flag, uc4_flag, uc5_flag,
         uc6_flag, uc7_flag, uc8_flag, uc9_flag, uc10_flag,
         uc11_flag, uc12_flag, uc13_flag : std_logic := '0';

  -- Zustandsname fürs Log
  function state_name(s: std_logic_vector(2 downto 0)) return string is
  begin
    case s is
      when "000" => return "IDLE_LOCKED";
      when "001" => return "CALL_MOVING";
      when "010" => return "DOOR_OPEN_ENTRY";
      when "011" => return "PIN_ENTRY";
      when "100" => return "READY_SELECT";
      when "101" => return "MOVING";
      when "110" => return "DOOR_OPEN_EXIT";
      when others=> return "UNKNOWN";
    end case;
  end function;

  signal prev_state_dbg : std_logic_vector(2 downto 0) := "000";

begin
  -- ==== DUT ====
  dut: entity work.elevator_fsm_algo
    port map (
      clk => clk, reset => reset, key => key,
      led_red => led_red, led_green => led_green, led_yellow => led_yellow,
      hex0 => hex0, hex1 => hex1, hex5 => hex5, hex6 => hex6, hex7 => hex7,
      state_dbg => state_dbg
    );

  -- ==== Takt ====
  clk_proc: process
  begin
    clk <= '0'; wait for Tclk/2;
    clk <= '1'; wait for Tclk/2;
  end process;

  -- ==== Zähler ====
  process(clk) begin
    if rising_edge(clk) then clk_count <= clk_count + 1; end if;
  end process;

  -- ==== State-Logger ====
  log_state: process(clk)
  begin
    if rising_edge(clk) then
      if state_dbg /= prev_state_dbg then
        report "[" & integer'image(clk_count) & " clk] state -> " & state_name(state_dbg);
      end if;
      prev_state_dbg <= state_dbg;
    end if;
  end process;

  -- ==== 7-Seg Monitor ====
  mon: process(hex0,hex1,hex5,hex6,hex7)
  begin
    d_hex0 <= seg7_to_int(hex0);
    d_hex1 <= seg7_to_int(hex1);
    d_hex5 <= seg7_to_int(hex5);
    d_hex6 <= seg7_to_int(hex6);
    d_hex7 <= seg7_to_int(hex7);
  end process;

  -- ==== Stimulus ====
  stim: process
    -- 1-Takt-Puls synchron zum clk (triggert genau 1x)
    procedure pulse_one_clk(signal k: inout std_logic_vector(3 downto 0); constant idx: integer) is
    begin
      wait until rising_edge(clk); wait for Tclk/10;
      k(idx) <= '1';
      wait until rising_edge(clk); wait for Tclk/10;
      k(idx) <= '0';
    end procedure;

    -- PIN korrekt = "07" (SELECT rechts 1x, NEXT 7x, ENTER)
    procedure enter_pin_07(signal k: inout std_logic_vector(3 downto 0)) is
    begin
      pulse_one_clk(k, 1);
      for i in 1 to 7 loop pulse_one_clk(k, 0); end loop;
      pulse_one_clk(k, 2);
    end procedure;

    -- PIN falsch "10" (NEXT links 1x, ENTER)
    procedure enter_pin_wrong(signal k: inout std_logic_vector(3 downto 0)) is
    begin
      pulse_one_clk(k, 0);
      pulse_one_clk(k, 2);
    end procedure;

    procedure confirm is
    begin
      pulse_one_clk(key, 3);
    end procedure;

    -- Reset: 1 Rising-Edge HIGH reicht (synchroner Reset)
    procedure to_idle is
    begin
      reset <= '1';
      wait until rising_edge(clk);
      reset <= '0';
      wait for 2*Tclk;
    end procedure;

    -- UC-Flag: an Flanke setzen/clearen (Bereichsmarker)
    procedure uc_begin(signal f: inout std_logic) is
    begin
      wait until rising_edge(clk);
      f <= '1';
    end procedure;
    procedure uc_end(signal f: inout std_logic) is
    begin
      wait until rising_edge(clk);
      f <= '0';
    end procedure;

    -- (Helfer; robust falls MOVING mehrtaktig)
    procedure wait_enter_state(constant s: std_logic_vector(2 downto 0)) is
    begin
      loop
        wait until rising_edge(clk);
        exit when state_dbg = s;
      end loop;
    end procedure;

    procedure wait_while_state(constant s: std_logic_vector(2 downto 0)) is
      variable guard : integer := 0;
    begin
      while state_dbg = s loop
        wait until rising_edge(clk);
        guard := guard + 1;
        if guard > 1000 then
          assert false report "Guard: wait_while_state timeout" severity failure;
          exit;
        end if;
      end loop;
    end procedure;

  begin
    -- Initial: Reset
    to_idle;

    -- UC1: Ruf von Etage 1 (gleiches Stockwerk) 000->010->011
    uc_begin(uc1_flag);
    report "[" & integer'image(clk_count) & " clk] UC1: Ruf von Etage 1";
    pulse_one_clk(key, 0);
    wait until rising_edge(clk);  -- ENTRY
    wait until rising_edge(clk);  -- PIN
    assert state_dbg = "011" report "UC1: Erwartet PIN_ENTRY" severity warning;
    uc_end(uc1_flag);

    -- UC2: Falscher PIN ("10") -> 1 Takt ENTRY, dann PIN
    uc_begin(uc2_flag);
    report "[" & integer'image(clk_count) & " clk] UC2: Falscher PIN (10)";
    enter_pin_wrong(key);
    wait until rising_edge(clk); assert state_dbg = "010" severity warning;
    wait until rising_edge(clk); assert state_dbg = "011" severity warning;
    uc_end(uc2_flag);

    -- UC3: Richtiger PIN = 07 -> READY_SELECT (100)
    uc_begin(uc3_flag);
    report "[" & integer'image(clk_count) & " clk] UC3: Richtiger PIN = 07";
    enter_pin_07(key);
    wait until rising_edge(clk); assert state_dbg = "100" severity warning;
    uc_end(uc3_flag);

    -- UC4: Ziel = aktuelle Etage -> Confirm -> 'E' genau 1 Takt, dann zurück zu '-'
    uc_begin(uc4_flag);
    report "[" & integer'image(clk_count) & " clk] UC4: Ziel = aktuelle Etage (E für 1 Takt)";

    -- Ziel 1 wählen
    pulse_one_clk(key, 0);                  -- KEY0: Ziel 1
    wait until rising_edge(clk);            -- Auswahl registriert -> HEX5 zeigt "1"

    -- Confirm (1-Takt-Puls)
    confirm;

    -- Nächster Takt: 'E' (14) sichtbar
    wait until rising_edge(clk);
    assert d_hex5 = 14 report "UC4: 'E' (14) 1 Takt nach Confirm erwartet" severity warning;

    -- Danach: zurück zu Strich (10)
    wait until rising_edge(clk);
    assert d_hex5 = 10 report "UC4: Zurück zu '-' (Dash) erwartet" severity warning;

    -- Zustand bleibt READY_SELECT
    assert state_dbg = "100" report "UC4: in READY_SELECT bleiben" severity warning;
    uc_end(uc4_flag);

    -- UC5: Ziel = 3 -> MOVING -> EXIT -> IDLE
    uc_begin(uc5_flag);
    report "[" & integer'image(clk_count) & " clk] UC5: Ziel = 3";
    pulse_one_clk(key, 2); wait until rising_edge(clk);
    confirm;
    wait until rising_edge(clk); assert state_dbg = "101" report "UC5: MOVING" severity warning;
    wait_while_state("101"); -- optional
    assert (state_dbg = "110" or state_dbg = "000")
      report "UC5: erwartet EXIT/IDLE nach MOVING" severity warning;
    if state_dbg = "110" then
      wait until rising_edge(clk);
      assert state_dbg = "000" report "UC5: IDLE erwartet" severity warning;
    end if;
    uc_end(uc5_flag);

    -- UC6: Ruf von Etage 2 (andere Etage) -> CALL->ENTRY->PIN, CF=2
    uc_begin(uc6_flag);
    report "[" & integer'image(clk_count) & " clk] UC6: Ruf von Etage 2";
    pulse_one_clk(key, 1);
    wait until rising_edge(clk); assert state_dbg = "001" severity warning;
    wait until rising_edge(clk); assert state_dbg = "010" severity warning;
    wait until rising_edge(clk); assert (state_dbg = "011" and d_hex6 = 2) severity warning;
    uc_end(uc6_flag);

    -- UC7: Richtiger PIN = 07 nach UC6
    uc_begin(uc7_flag);
    report "[" & integer'image(clk_count) & " clk] UC7: Richtiger PIN = 07";
    enter_pin_07(key);
    wait until rising_edge(clk); assert state_dbg = "100" severity warning;
    uc_end(uc7_flag);

    to_idle;
    wait until rising_edge(clk);                 -- 1 Takt zur Beruhigung
    assert state_dbg = "000" severity warning;

    --UC8: Reset im IDLE
    uc_begin(uc8_flag);
    report "[" & integer'image(clk_count) & " clk] UC8: Reset im IDLE";
    -- Jetzt *im* IDLE einen Test-Reset auslösen
    reset <= '1';
    wait until rising_edge(clk);
    reset <= '0';
    -- Nach dem Reset einen Takt warten und prüfen
    wait until rising_edge(clk);
    assert state_dbg = "000" report "UC8: Nach Reset weiterhin IDLE erwartet" severity warning;
    uc_end(uc8_flag);
    
    -- UC9: Reset während PIN_ENTRY
    uc_begin(uc9_flag);
    report "[" & integer'image(clk_count) & " clk] UC9: Reset während PIN_ENTRY";
    pulse_one_clk(key, 0);                    -- Ruf Etage 1
    wait until rising_edge(clk);              -- ENTRY
    wait until rising_edge(clk);              -- PIN
    reset <= '1'; wait until rising_edge(clk); reset <= '0';
    wait until rising_edge(clk); assert state_dbg = "000" severity warning;
    uc_end(uc9_flag);

    -- UC10: PIN-Navigation: Wrap-Test beider Stellen + PIN=07
    uc_begin(uc10_flag);
    report "[" & integer'image(clk_count) & " clk] UC10: PIN-Navigation Wrap-Test + PIN=07";

    -- zu PIN_ENTRY
    pulse_one_clk(key, 0);
    wait until rising_edge(clk); -- ENTRY
    wait until rising_edge(clk); -- PIN_ENTRY
    assert state_dbg = "011" report "UC10: PIN_ENTRY erwartet" severity warning;

    -- Linke Stelle (hex1) 10x NEXT -> Wrap auf 0
    for i in 1 to 10 loop pulse_one_clk(key, 0); end loop;
    wait until rising_edge(clk);
    assert d_hex1 = 0 report "UC10: Wrap links erwartet (0)" severity warning;

    -- Rechte Stelle (hex0) SELECT + 10x NEXT -> Wrap auf 0
    pulse_one_clk(key, 1);
    for i in 1 to 10 loop pulse_one_clk(key, 0); end loop;
    wait until rising_edge(clk);
    assert d_hex0 = 0 report "UC10: Wrap rechts erwartet (0)" severity warning;

    -- auf 7 und ENTER
    for i in 1 to 7 loop pulse_one_clk(key, 0); end loop;
    pulse_one_clk(key, 2);
    wait until rising_edge(clk);
    assert (state_dbg = "100" and d_hex0 = 7 and d_hex1 = 0)
      report "UC10: READY_SELECT + PIN=07 erwartet" severity warning;
    uc_end(uc10_flag);

    -- UC11: Reset während READY_SELECT
    uc_begin(uc11_flag);
    report "[" & integer'image(clk_count) & " clk] UC11: Reset während READY_SELECT";
    reset <= '1'; wait until rising_edge(clk); reset <= '0';
    wait until rising_edge(clk); assert state_dbg = "000" severity warning;
    uc_end(uc11_flag);

    -- UC12: Busy-Flag (HEX7) prüfen
    uc_begin(uc12_flag);
    report "[" & integer'image(clk_count) & " clk] UC12: Busy-Flag prüfen";
    assert d_hex7 = 0 report "UC12: In IDLE HEX7=0 erwartet" severity warning;
    pulse_one_clk(key, 1); wait until rising_edge(clk);  -- CALL_MOVING
    assert d_hex7 = 1 report "UC12: Ausser IDLE HEX7=1 erwartet" severity warning;
    uc_end(uc12_flag);

    -- UC13: End-to-End: von 3 nach 1 (PIN=07)
    uc_begin(uc13_flag);
    report "[" & integer'image(clk_count) & " clk] UC13: End-to-End von 3 nach 1 (PIN=07)";

    to_idle; assert state_dbg = "000" severity warning;

    pulse_one_clk(key, 2);               -- CALL floor 3
    wait until rising_edge(clk); assert state_dbg = "001" severity warning;
    wait until rising_edge(clk); assert state_dbg = "010" severity warning;
    wait until rising_edge(clk); assert (state_dbg = "011" and d_hex6 = 3) severity warning;

    enter_pin_07(key);
    wait until rising_edge(clk); assert state_dbg = "100" severity warning;

    pulse_one_clk(key, 0);               -- Ziel 1
    wait until rising_edge(clk);
    confirm;                              -- KEY3
    wait until rising_edge(clk); assert state_dbg = "101" severity warning;

    wait_while_state("101");
    assert (state_dbg = "110" and d_hex6 = 1) severity warning;
    wait until rising_edge(clk); assert state_dbg = "000" severity warning;

    uc_end(uc13_flag);

    assert (true = false) report "Simulation abgeschlossen (UC1..UC13)." severity failure;
  end process;

end architecture;
