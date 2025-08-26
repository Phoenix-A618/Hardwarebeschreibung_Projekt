-- ============================================================================
-- elevator_top.vhd
-- Top-Level für das FPGA-Board (DE2-115):
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity elevator_top is
  generic(
    G_CLK_HZ              : natural := 50_000_000; -- Boardtakt (50 MHz)
    G_DEBOUNCE_MS         : natural := 10;         -- Entprellzeit der KEYs
    G_DOOR_MS             : natural := 3000;       -- Tür-Öffnungs-/Schließzeit in ms
    G_TRAVEL_MS_PER_FLOOR : natural := 3000        -- Fahrzeit pro Etage in ms
  );
  port(
    CLOCK_50 : in  std_logic;                      -- 50-MHz-Systemtakt
    KEY      : in  std_logic_vector(3 downto 0);   -- Taster (active-low)
    SW       : in  std_logic_vector(17 downto 0);  -- SW(17) als Reset (active-high)

    -- 7-Segment-Anzeigen (active-low, Reihenfolge g f e d c b a):
    HEX0, HEX1, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0);

    -- Status-LEDs auf dem Board (active-high):
    -- LEDG(0) = Grün, LEDR(0) = Rot; "Gelb" = Rot+Grün gleichzeitig
    -- Zusätzlich: LEDR(17..15) = state_dbg(2..0)
    LEDG    : out std_logic_vector(0 downto 0);
    LEDR    : out std_logic_vector(17 downto 0)
  );
end entity;

architecture rtl of elevator_top is
  -- Interner Reset (von SW(17))
  signal rst : std_logic;

  -- Taster-Impulse (nach Entprellen, 1 Takt breit, active-high)
  signal k0_p, k1_p, k2_p, k3_p : std_logic;

  -- 1-ms-Tick
  signal tick_1ms : std_logic;

  -- FSM-Signale intern
  signal led_red_s, led_green_s, led_yellow_s : std_logic;
  signal state_dbg  : std_logic_vector(2 downto 0);
begin
  -- Reset: SW(17) ist high-aktiv
  rst <= SW(17);

  -- Tick-Generator (1 ms)
  u_tick : entity work.tick_gen
    generic map ( G_CLK_HZ => G_CLK_HZ )
    port map    ( clk => CLOCK_50, rst => rst, tick_1ms => tick_1ms );

  -- Key-Interfaces (active-low KEY ? entprellter 1-Takt-Puls, active-high)
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

  -- RT-FSM
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
      state_dbg => state_dbg,     -- jetzt ans Board weitergegeben
      tick_1ms  => tick_1ms
    );

  -- LED-Mapping (active-high):
  -- - LEDG(0) = Grün ODER Gelb
  -- - LEDR(0) = Rot  ODER Gelb
  -- - LEDR(17..15) = state_dbg(2..0) (MSB..LSB)
  LEDG(0) <= (led_green_s or led_yellow_s);
  LEDR(0) <= (led_red_s   or led_yellow_s);

  LEDR(17) <= state_dbg(2);
  LEDR(16) <= state_dbg(1);
  LEDR(15) <= state_dbg(0);

  -- übrige LEDR-Leitungen auf '0' setzen (nicht benutzt)
  LEDR(14 downto 1) <= (others => '0');

end architecture;
