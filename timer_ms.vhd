
-- ============================================================================
-- Modul: timer_ms
-- Funktion: Universeller Millisekunden-Timer basierend auf tick_1ms
-- - Start durch 'start'
-- - Läuft 'duration_ms' Millisekunden
-- - busy=1 während Laufzeit, done=1 genau einen Takt am Ende
-- - Spezialfall: duration_ms=0 -> sofort done=1 (kein Hängenbleiben)
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer_ms is
  port(
    clk, rst    : in  std_logic;                 -- Systemtakt, synchrones Reset
    tick_1ms    : in  std_logic;                 -- 1-ms-Tick (z.B. aus tick_gen)
    start       : in  std_logic;                 -- Startsignal (Flanke)
    duration_ms : in  unsigned(31 downto 0);     -- Dauer in Millisekunden
    busy, done  : out std_logic                  -- Status-Flags
  );
end;

architecture rtl of timer_ms is
  signal run : std_logic := '0';                 -- internes Lauf-Flag
  signal cnt : unsigned(31 downto 0) := (others=>'0'); -- Zähler
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst='1' then
        run  <= '0';
        cnt  <= (others=>'0');
        done <= '0';
      else
        done <= '0';
        if start='1' and run='0' then
          -- Dauer=0 -> sofort fertig
          if duration_ms = 0 then
            run  <= '0';
            cnt  <= (others=>'0');
            done <= '1';
          else
            run <= '1';
            cnt <= (others=>'0');
          end if;
        elsif run='1' and tick_1ms='1' then
          if cnt = duration_ms - 1 then
            run  <= '0';
            done <= '1';
          else
            cnt <= cnt + 1;
          end if;
        end if;
      end if;
    end if;
  end process;

  busy <= run;
end;
