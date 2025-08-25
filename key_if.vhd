-- Dieses Modul entprellt die Taster (KEYs) und erzeugt saubere Puls-Signale (active-high).

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity key_if is
  generic(G_CLK_HZ:natural:=50_000_000; G_DEBOUNCE_MS:natural:=10);
  port(clk, rst: in std_logic; key_n: in std_logic; key_pulse: out std_logic);
end entity;
architecture rtl of key_if is
  constant C_MAX: natural := G_CLK_HZ/1000*G_DEBOUNCE_MS;
  signal s0,s1,stable,last: std_logic := '0';
  signal cnt: unsigned(31 downto 0) := (others=>'0');
begin
  process(clk) begin if rising_edge(clk) then s0 <= not key_n; s1 <= s0; end if; end process; -- invert+sync
  process(clk)
  begin
    if rising_edge(clk) then
      if rst='1' then stable<='0'; cnt<=(others=>'0');
      else
        if s1=stable then cnt<=(others=>'0');
        elsif cnt=to_unsigned(C_MAX-1,cnt'length) then stable<=s1; cnt<=(others=>'0');
        else cnt<=cnt+1; end if;
      end if;
    end if;
  end process;
  process(clk)
  begin
    if rising_edge(clk) then
      if rst='1' then last<='0'; key_pulse<='0';
      else key_pulse<='0'; if (stable='1' and last='0') then key_pulse<='1'; end if; last<=stable; end if;
    end if;
  end process;
end architecture;

