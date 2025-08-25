-- ============================================================================
-- Testbench: tb_elevator_golden.vhd
-- Zweck: Vergleich Algorithmisches Modell (ALGO) vs. RT-Implementierung (RT)
-- - Gemeinsame Stimuli für beide Modelle
-- - Vergleich der Ausgänge an definierten Synchronpunkten (RT-Zustände)
-- - Vollständige Tests UC1..UC13
-- - Angepasst für expliziten Tür-Schließzustand DOOR_CLOSE="111"
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.hex_pkg.all;

entity tb_elevator_golden is
end entity;

architecture sim of tb_elevator_golden is

  ---------------------------------------------------------------------------
  -- Grundsignale und Takt
  ---------------------------------------------------------------------------
  constant Tclk   : time := 20 ns;       -- 50 MHz Systemtakt
  signal   clk    : std_logic := '0';
  signal   rst    : std_logic := '0';

  -- Hilfszähler für Waveform (zur Orientierung)
  signal clk_count  : integer := 0;      -- Taktzähler
  signal tick_count : integer := 0;      -- ms-Tick-Zähler

  ---------------------------------------------------------------------------
  -- Gemeinsame Tastensignale (Impulse, active-high)
  ---------------------------------------------------------------------------
  signal k0_p, k1_p, k2_p, k3_p : std_logic := '0';

  -- Vektor für ALGO-Modell (KEY(3 downto 0))
  signal key_algo : std_logic_vector(3 downto 0) := (others=>'0');

  -- Beschleunigter 1ms-Tick (für RT)
  signal tick_1ms : std_logic := '0';

  ---------------------------------------------------------------------------
  -- Ausgänge ALGO (Referenzmodell)
  ---------------------------------------------------------------------------
  signal a_h0,a_h1,a_h5,a_h6,a_h7 : std_logic_vector(6 downto 0);
  signal a_ledr,a_ledg,a_ledy     : std_logic;
  signal a_sdbg                   : std_logic_vector(2 downto 0);

  ---------------------------------------------------------------------------
  -- Ausgänge RT (Implementierung)
  ---------------------------------------------------------------------------
  signal r_h0,r_h1,r_h5,r_h6,r_h7 : std_logic_vector(6 downto 0);
  signal r_ledr,r_ledg,r_ledy     : std_logic;
  signal r_sdbg                   : std_logic_vector(2 downto 0);

  ---------------------------------------------------------------------------
  -- Simulationsparameter (stark verkürzt für TB)
  ---------------------------------------------------------------------------
  constant DOOR_MS_SIM   : natural := 1; -- 1 "ms" Türzeit (statt 3000 ms)
  constant TRAVEL_MS_SIM : natural := 1; -- 1 "ms" pro Etage (statt 3000 ms)

  ---------------------------------------------------------------------------
  -- Hilfsfunktion: 7-Segment ? Integer
  ---------------------------------------------------------------------------
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
      when "0111111" => return -1; -- '-'
      when others    => return -2; -- ungültig
    end case;
  end function;

  -- Monitor-Signale (Integer-Ansicht für ALGO/RT)
  signal d_hex0_a,d_hex1_a,d_hex5_a,d_hex6_a,d_hex7_a : integer := -2;
  signal d_hex0_r,d_hex1_r,d_hex5_r,d_hex6_r,d_hex7_r : integer := -2;

  ---------------------------------------------------------------------------
  -- Zustands-Kodierung (Debug-Ausgänge RT)
  ---------------------------------------------------------------------------
  constant ST_IDLE  : std_logic_vector(2 downto 0) := "000";
  constant ST_CALL  : std_logic_vector(2 downto 0) := "001";
  constant ST_ENTRY : std_logic_vector(2 downto 0) := "010";
  constant ST_PIN   : std_logic_vector(2 downto 0) := "011";
  constant ST_READY : std_logic_vector(2 downto 0) := "100";
  constant ST_MOVE  : std_logic_vector(2 downto 0) := "101";
  constant ST_EXIT  : std_logic_vector(2 downto 0) := "110";
  constant ST_CLOSE : std_logic_vector(2 downto 0) := "111"; -- NEU: Tür-Schließen

  ---------------------------------------------------------------------------
  -- Flags für Use-Cases (zur Markierung im Waveform)
  ---------------------------------------------------------------------------
  signal uc1_flag, uc2_flag, uc3_flag, uc4_flag, uc5_flag : std_logic := '0';
  signal uc6_flag, uc7_flag, uc8_flag, uc9_flag, uc10_flag: std_logic := '0';
  signal uc11_flag,uc12_flag,uc13_flag                    : std_logic := '0';

  ---------------------------------------------------------------------------
  -- Hilfsprozeduren
  ---------------------------------------------------------------------------

  -- Erzeugt einen Tastendruck-Puls (1 Takt lang, mit Pause)
  procedure pulse(signal s: inout std_logic; signal clk_i: in std_logic) is
  begin 
    s <= '1'; 
    wait until rising_edge(clk_i); 
    s <= '0';
    wait until rising_edge(clk_i);  -- Pause -> klar erkennbare Pulse
  end procedure;

  -- Wartet N "ms" via Tick (nur für RT relevant)
  procedure wait_ms(n: integer; signal tick: in std_logic) is
  begin
    for i in 1 to n loop 
      wait until rising_edge(tick); 
    end loop; 
  end procedure;

  -- Wartet auf einen RT-Zustand (mit Timeout), dann vergleicht Outputs
  procedure wait_rt_and_compare(
    constant st : std_logic_vector(2 downto 0);
    signal clk_i   : in std_logic;
    signal sdbg_rt : in std_logic_vector(2 downto 0)) is
    variable guard : integer := 0;
  begin
    loop
      wait until rising_edge(clk_i);
      exit when sdbg_rt = st;
      guard := guard + 1;
      if guard > 200000 then
        assert false report "Timeout beim Warten auf RT-Zustand" severity failure;
        exit;
      end if;
    end loop;
    -- Vergleich ALGO vs RT am Synchronpunkt
    assert d_hex0_a = d_hex0_r report "Mismatch HEX0" severity warning;
    assert d_hex1_a = d_hex1_r report "Mismatch HEX1" severity warning;
    assert d_hex5_a = d_hex5_r report "Mismatch HEX5" severity warning;
    assert d_hex6_a = d_hex6_r report "Mismatch HEX6" severity warning;
    assert d_hex7_a = d_hex7_r report "Mismatch HEX7" severity warning;
    assert a_ledr   = r_ledr   report "Mismatch LED Rot" severity warning;
    assert a_ledg   = r_ledg   report "Mismatch LED Grün" severity warning;
    assert a_ledy   = r_ledy   report "Mismatch LED Gelb" severity warning;
  end procedure;

  -- PIN korrekt = "07": SELECT ? 7x NEXT ? ENTER
  procedure enter_pin_07(
    signal k0: inout std_logic;  -- NEXT 
    signal k1: inout std_logic;  -- SELECT
    signal k2: inout std_logic;  -- ENTER
    signal clk_i: in std_logic
  ) is
  begin
    pulse(k1, clk_i);                  -- SELECT (rechts)
    for i in 1 to 7 loop 
      pulse(k0, clk_i);                -- NEXT (7x)
    end loop;
    pulse(k2, clk_i);                  -- ENTER
  end procedure;

  -- PIN falsch: 1x NEXT, dann ENTER (ergibt "10") 
  procedure enter_pin_wrong(
    signal k0: inout std_logic;  -- NEXT
    signal k2: inout std_logic;  -- ENTER
    signal clk_i: in std_logic
  ) is
  begin 
    pulse(k0, clk_i); 
    pulse(k2, clk_i); 
  end procedure;
  
  -- Synchroner Reset
  procedure to_idle(signal rst_o: inout std_logic; signal clk_i: in std_logic) is
  begin 
    rst_o <= '1'; 
    wait until rising_edge(clk_i); 
    rst_o <= '0'; 
  end procedure;

  -- Setzt/ löscht UC-Flag (nur zur Waveform-Markierung)
  procedure uc_begin(signal f: inout std_logic; signal clk_i: in std_logic) is
  begin wait until rising_edge(clk_i); f <= '1'; end procedure;

  procedure uc_end(signal f: inout std_logic; signal clk_i: in std_logic) is
  begin wait until rising_edge(clk_i); f <= '0'; end procedure;

begin
  ---------------------------------------------------------------------------
  -- Takterzeugung + Zähler
  ---------------------------------------------------------------------------
  clk <= not clk after Tclk/2;

  process(clk)
  begin
    if rising_edge(clk) then
      clk_count <= clk_count + 1;
    end if;
  end process;

  process(tick_1ms)
  begin
    if rising_edge(tick_1ms) then
      tick_count <= tick_count + 1;
    end if;
  end process;

  ---------------------------------------------------------------------------
  -- KEY-Vektor für ALGO  (Mapping)
  ---------------------------------------------------------------------------
  key_algo <= (3 => k3_p, 2 => k2_p, 1 => k1_p, 0 => k0_p);

  ---------------------------------------------------------------------------
  -- Beschleunigter Tick: 1 "ms" = 10 Takte bei 10 kHz
  ---------------------------------------------------------------------------
  u_tick: entity work.tick_gen
    generic map ( G_CLK_HZ => 10_000 )
    port map    ( clk => clk, rst => rst, tick_1ms => tick_1ms );

  ---------------------------------------------------------------------------
  -- DUT: Algorithmisches Modell (Referenz)
  ---------------------------------------------------------------------------
  dut_algo: entity work.elevator_fsm_algo
    port map (
      clk        => clk, 
      reset      => rst, 
      key        => key_algo,
      led_red    => a_ledr, 
      led_green  => a_ledg, 
      led_yellow => a_ledy,
      hex0       => a_h0, 
      hex1       => a_h1, 
      hex5       => a_h5, 
      hex6       => a_h6, 
      hex7       => a_h7,
      state_dbg  => a_sdbg );

  ---------------------------------------------------------------------------
  -- DUT: RT-Implementierung
  ---------------------------------------------------------------------------
  dut_rt: entity work.elevator_fsm_rt
    generic map ( 
      G_DOOR_MS             => DOOR_MS_SIM, 
      G_TRAVEL_MS_PER_FLOOR => TRAVEL_MS_SIM )
    port map (
      clk => clk, 
      rst => rst,
      k0_p => k0_p, 
      k1_p => k1_p, 
      k2_p => k2_p, 
      k3_p => k3_p,
      led_red => r_ledr, 
      led_green => r_ledg, 
      led_yellow => r_ledy,
      hex0 => r_h0, 
      hex1 => r_h1, 
      hex5 => r_h5, 
      hex6 => r_h6, 
      hex7 => r_h7,
      state_dbg => r_sdbg, 
      tick_1ms => tick_1ms );

  ---------------------------------------------------------------------------
  -- Monitore: HEX (als Integer sichtbar)
  ---------------------------------------------------------------------------
  d_hex0_a <= seg7_to_int(a_h0);  d_hex1_a <= seg7_to_int(a_h1);
  d_hex5_a <= seg7_to_int(a_h5);  d_hex6_a <= seg7_to_int(a_h6);
  d_hex7_a <= seg7_to_int(a_h7);

  d_hex0_r <= seg7_to_int(r_h0);  d_hex1_r <= seg7_to_int(r_h1);
  d_hex5_r <= seg7_to_int(r_h5);  d_hex6_r <= seg7_to_int(r_h6);
  d_hex7_r <= seg7_to_int(r_h7);

  ---------------------------------------------------------------------------
  -- Stimuli: Use-Cases UC1..UC13
  ---------------------------------------------------------------------------
  stim: process
  begin
    report "[TB] Initial-Reset" severity note;
    to_idle(rst, clk);
    wait_rt_and_compare(ST_IDLE, clk, r_sdbg);

    -- UC1: Ruf gleiche Etage ? PIN_ENTRY
    uc_begin(uc1_flag, clk);
    pulse(k0_p, clk);
    wait_rt_and_compare(ST_ENTRY, clk, r_sdbg);
    wait_rt_and_compare(ST_PIN,   clk, r_sdbg);
    uc_end(uc1_flag, clk);

    -- UC2: PIN falsch ? zurück zu ENTRY ? erneut PIN_ENTRY
    uc_begin(uc2_flag, clk);
    enter_pin_wrong(k0_p, k2_p, clk);
    wait_rt_and_compare(ST_ENTRY, clk, r_sdbg);
    wait_rt_and_compare(ST_PIN,   clk, r_sdbg);
    uc_end(uc2_flag, clk);

    -- UC3: PIN korrekt (?07?) ? DOOR_CLOSE ? READY_SELECT
    uc_begin(uc3_flag, clk);
    enter_pin_07(k0_p, k1_p, k2_p, clk);
    wait_rt_and_compare(ST_CLOSE, clk, r_sdbg); -- Tür schließen (111)
    wait_rt_and_compare(ST_READY, clk, r_sdbg);
    uc_end(uc3_flag, clk);

    -- UC4: Ziel = aktuelle Etage ? Anzeige ?E? 1 Zyklus, keine Fahrt
    uc_begin(uc4_flag, clk);
    pulse(k0_p, clk); 
    wait until rising_edge(clk); 
    pulse(k3_p, clk);           -- Confirm
    wait until rising_edge(clk);
    assert d_hex5_a = 14 and d_hex5_r = 14 report "UC4: 'E' erwartet" severity warning;
    wait until rising_edge(clk);
    assert d_hex5_a = -1 and d_hex5_r = -1 report "UC4: '-' erwartet" severity warning;
    wait_rt_and_compare(ST_READY, clk, r_sdbg);
    uc_end(uc4_flag, clk);

    -- UC5: Ziel ? aktuelle Etage ? MOVING ? EXIT ? DOOR_CLOSE ? IDLE
    uc_begin(uc5_flag, clk);
    pulse(k2_p, clk); wait until rising_edge(clk); 
    pulse(k3_p, clk);
    wait_rt_and_compare(ST_MOVE, clk, r_sdbg);
    wait_rt_and_compare(ST_EXIT, clk, r_sdbg);
    wait_rt_and_compare(ST_CLOSE, clk, r_sdbg); -- Tür schließen am Ziel
    wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    uc_end(uc5_flag, clk);

    -- UC6: Ruf andere Etage ? CALL_MOVING ? ENTRY ? PIN_ENTRY
    uc_begin(uc6_flag, clk);
    wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    pulse(k1_p, clk);
    wait_rt_and_compare(ST_CALL,  clk, r_sdbg);
    wait_rt_and_compare(ST_ENTRY, clk, r_sdbg);
    wait_rt_and_compare(ST_PIN,   clk, r_sdbg);
    uc_end(uc6_flag, clk);


    -- UC7: PIN korrekt ? DOOR_CLOSE ? READY_SELECT
    uc_begin(uc7_flag, clk);
    enter_pin_07(k0_p, k1_p, k2_p, clk);
    wait_rt_and_compare(ST_CLOSE, clk, r_sdbg);
    wait_rt_and_compare(ST_READY, clk, r_sdbg);
    uc_end(uc7_flag, clk);

    -- UC8: Reset in IDLE
    uc_begin(uc8_flag, clk);
    to_idle(rst, clk);
    wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    uc_end(uc8_flag, clk);

    -- UC9: Reset in PIN_ENTRY
    uc_begin(uc9_flag, clk);
    pulse(k0_p, clk);
    wait_rt_and_compare(ST_ENTRY, clk, r_sdbg);
    wait_rt_and_compare(ST_PIN,   clk, r_sdbg);
    to_idle(rst, clk);
    wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    uc_end(uc9_flag, clk);

    -- UC10: PIN-Logik mit Zähl-Wrap 0..9 in beiden Stellen
    uc_begin(uc10_flag, clk);
    to_idle(rst, clk); wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    pulse(k0_p, clk); 
    wait_rt_and_compare(ST_ENTRY, clk, r_sdbg);
    wait_rt_and_compare(ST_PIN, clk, r_sdbg);
    for i in 1 to 10 loop pulse(k0_p, clk); end loop;
    pulse(k1_p, clk);
    for i in 1 to 10 loop pulse(k0_p, clk); end loop;
    pulse(k1_p, clk);
    enter_pin_07(k0_p, k1_p, k2_p, clk);
    wait_rt_and_compare(ST_CLOSE, clk, r_sdbg); -- Tür schließen vor READY
    wait_rt_and_compare(ST_READY, clk, r_sdbg);
    uc_end(uc10_flag, clk);

    -- UC11: PIN korrekt ? READY ? Reset ? IDLE
    uc_begin(uc11_flag, clk);
    wait_rt_and_compare(ST_READY, clk, r_sdbg);
    to_idle(rst, clk);
    wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    uc_end(uc11_flag, clk);

    -- UC12: Busy-Anzeige auf HEX7
    uc_begin(uc12_flag, clk);
    assert d_hex7_r = 0 report "UC12: HEX7=0 in IDLE erwartet" severity warning;
    pulse(k1_p, clk); wait until rising_edge(clk);
    assert d_hex7_r = 1 report "UC12: HEX7=1 außerhalb IDLE erwartet" severity warning;
    uc_end(uc12_flag, clk);

    -- UC13: End-to-End-Test
    uc_begin(uc13_flag, clk);
    to_idle(rst, clk); wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    pulse(k2_p, clk);
    wait_rt_and_compare(ST_CALL, clk, r_sdbg);
    wait_rt_and_compare(ST_ENTRY, clk, r_sdbg);
    wait_rt_and_compare(ST_PIN, clk, r_sdbg);
    enter_pin_07(k0_p, k1_p, k2_p, clk);
    wait_rt_and_compare(ST_CLOSE, clk, r_sdbg);  -- Tür schließen vor READY
    wait_rt_and_compare(ST_READY, clk, r_sdbg);
    pulse(k0_p, clk); wait until rising_edge(clk); pulse(k3_p, clk);
    wait_rt_and_compare(ST_MOVE, clk, r_sdbg);
    wait_rt_and_compare(ST_EXIT, clk, r_sdbg);
    wait_rt_and_compare(ST_CLOSE, clk, r_sdbg);  -- Tür schließen am Ziel
    wait_rt_and_compare(ST_IDLE, clk, r_sdbg);
    uc_end(uc13_flag, clk);

    -- Ende der Testsequenz
    report "[TB] Alle Use-Cases abgeschlossen (Golden Model)" severity note;
    assert false report "TB-Golden beendet." severity failure;
  end process;

end architecture;

