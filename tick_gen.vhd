-- Dieses Modul erzeugt periodische Tick-Signale im Millisekunden-Takt aus dem 50-MHz-Systemtakt.

library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;
entity tick_gen is
  generic(G_CLK_HZ:natural:=50_000_000);
  port(clk,rst: in std_logic; tick_1ms: out std_logic);
end; 
architecture rtl of tick_gen is
  constant C_DIV:natural:=G_CLK_HZ/1000; signal cnt: unsigned(31 downto 0):=(others=>'0');
begin
  process(clk) begin
    if rising_edge(clk) then
      if rst='1' then cnt<=(others=>'0'); tick_1ms<='0';
      else
        if cnt=to_unsigned(C_DIV-1,cnt'length) then cnt<=(others=>'0'); tick_1ms<='1';
        else cnt<=cnt+1; tick_1ms<='0'; end if;
      end if;
    end if;
  end process;
end;

