-- ============================================================================
-- elevator_top.vhd
-- Top-Level für das FPGA-Board (DE2-115):
-- - Bindet Takt/Reset, KEYs (active-low), 7-Segment (active-low) und LEDs an
-- - Entprellt Tasten und erzeugt 1-ms-Tick
-- - Instanziiert den RT-FSM (elevator_fsm_rt) und führt die Ausgänge zusammen
--   LED-Gelb wird durch gleichzeitiges Einschalten von Rot+Grün erzeugt.
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity elevator_top is
  generic(
    G_CLK_HZ              : natural := 50_000_000; -- Boardtakt (50 MHz)
    G_DEBOUNCE_MS         : natural := 10;         -- Entprellzeit der KEYs
    G_DOOR_MS             : natural := 3000;       -- Tür-Öffnungszeit in ms
    G_TRAVEL_MS_PER_FLOOR : natural := 3000        -- Fahrzeit pro Etage in ms
  );
  port(
    CLOCK_50 : in  std_logic;                      -- 50-MHz-Systemtakt
    KEY      : in  std_logic_vector(3 downto 0);   -- Taster (active-low)
    SW       : in  std_logic_vector(17 downto 0);  -- SW(17) als Reset (active-high)

    -- 7-Segment-Anzeigen (active-low, Reihenfolge g f e d c b a):
    HEX0, HEX1, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0);

    -- Status-LEDs auf dem Board (active-high):
    -- LEDG(0) = Grün, LEDR(0) = Rot; "Gelb" = Grün+Rot gleichzeitig
    LEDG    : out std_logic_vector(0 downto 0);
    LEDR    : out std_logic_vector(0 downto 0)
  );
end entity;

architecture rtl of elevator_top is
  -- interner Reset (von SW(17))
  signal rst : std_logic;

  -- Taster-Impulse (nach Entprellen, 1 Takt breit, active-high)
  signal k0_p, k1_p, k2_p, k3_p : std_logic;

  -- 1-ms-Tick
  signal tick_1ms : std_logic;

  -- FSM-Status-LEDs (logisch), werden unten auf Board-LEDs gemappt
  signal led_red_s, led_green_s, led_yellow_s : std_logic;
begin
  -- ========================================================================
  -- Reset-Zuordnung: SW(17) ist der aktive Reset (high-aktiv)
  -- ========================================================================
  rst <= SW(17);

  -- ========================================================================
  -- 1-ms-Tick-Generator aus dem 50-MHz-Systemtakt
  -- ========================================================================
  u_tick : entity work.tick_gen
    generic map ( G_CLK_HZ => G_CLK_HZ )
    port map    ( clk => CLOCK_50, rst => rst, tick_1ms => tick_1ms );

  -- ========================================================================
  -- Tasten-Interface: active-low KEY[n] -> entprellter 1-Takt-Puls (active-high)
  -- ========================================================================
  u_k0 : entity work.key_if
    generic map ( G_CLK_HZ => G_CLK_HZ, G_DEBOUNCE_MS => G_DEBOUNCE_MS )
    port map    ( clk => CLOCK_50, rst => rst, key_n => KEY(0), key_pulse => k0_p );

  u_k1 : entity work.key_if
    generic map ( G_CLK_HZ => G_CLK_HZ, G_DEBOUNCE_MS => G_DEBOUNCE_MS )
    port map    ( clk => CLOCK_50, rst => rst, key_n => KEY(1), key_pulse => k1_p );

  u_k2 : entity work.key_if
    generic map ( G_CLK_HZ => G_CLK_HZ, G_DEBOUNCE_MS => G_DEBOUNCE_MS )
    port map    ( clk => CLOCK_50, rst => rst, key_n => KEY(2), key_pulse => k2_p );

  u_k3 : entity work.key_if
    generic map ( G_CLK_HZ => G_CLK_HZ, G_DEBOUNCE_MS => G_DEBOUNCE_MS )
    port map    ( clk => CLOCK_50, rst => rst, key_n => KEY(3), key_pulse => k3_p );

  -- ========================================================================
  -- RT-FSM (Fahrstuhl-Controller auf Register-Transfer-Ebene)
  --  - erwartet entprellte Tastenpulse und 1-ms-Tick
  --  - liefert Status-LEDs und 7-Segment-Daten (active-low)
  -- ========================================================================
  u_fsm : entity work.elevator_fsm_rt
    generic map (
      G_DOOR_MS             => G_DOOR_MS,
      G_TRAVEL_MS_PER_FLOOR => G_TRAVEL_MS_PER_FLOOR
    )
    port map (
      clk => CLOCK_50, rst => rst,
      k0_p => k0_p, k1_p => k1_p, k2_p => k2_p, k3_p => k3_p,
      led_red => led_red_s, led_green => led_green_s, led_yellow => led_yellow_s,
      hex0 => HEX0, hex1 => HEX1, hex5 => HEX5, hex6 => HEX6, hex7 => HEX7,
      state_dbg => open,        -- optional: unverbunden im Top
      tick_1ms  => tick_1ms
    );

  -- ========================================================================
  -- LED-Zuordnung auf dem Board:
  --  - Grün leuchtet bei GREEN=1 oder YELLOW=1
  --  - Rot  leuchtet bei RED=1   oder YELLOW=1
  --  -> damit entspricht "Gelb" = Rot+Grün gleichzeitig
  -- ========================================================================
  LEDG(0) <= (led_green_s or led_yellow_s);
  LEDR(0) <= (led_red_s   or led_yellow_s);

end architecture;

