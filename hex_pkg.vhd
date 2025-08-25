-- Dieses Paket enthält Konstanten und Funktionen zur Ansteuerung der 7-Segment-Anzeigen.

library ieee;
use ieee.std_logic_1164.all;

package hex_pkg is
  function digit_to_7seg(d : integer) return std_logic_vector; -- g f e d c b a (active-low)
  constant SEG_E    : std_logic_vector(6 downto 0) := "0000110";
  constant SEG_DASH : std_logic_vector(6 downto 0) := "0111111";
end package;

package body hex_pkg is
  function digit_to_7seg(d : integer) return std_logic_vector is
    variable seg : std_logic_vector(6 downto 0) := (others=>'1');
  begin
    case d is
      when 0 => seg := "1000000"; when 1 => seg := "1111001"; when 2 => seg := "0100100";
      when 3 => seg := "0110000"; when 4 => seg := "0011001"; when 5 => seg := "0010010";
      when 6 => seg := "0000010"; when 7 => seg := "1111000"; when 8 => seg := "0000000";
      when 9 => seg := "0010000"; when others => seg := "1111111";
    end case; return seg;
  end function;
end package body;

