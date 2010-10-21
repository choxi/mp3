--
-- VHDL Architecture ece411.wordmux_c.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:31:14 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY wordmux_c IS
   PORT( 
      databig : IN     lc3b_oword;
      offset  : IN     lc3b_coffset;
      waydata : OUT    lc3b_word
   );

-- Declarations

END wordmux_c ;

--
ARCHITECTURE untitled OF wordmux_c IS
signal Sel: std_logic_vector (2 downto 0);

BEGIN
  Sel <= offset(3 downto 1);
--signal Sel := offset(4 downto 1);
  PROCESS (databig, offset, Sel)
    variable state : LC3b_word;
  BEGIN
    case Sel is
      when "000" =>
        state := databig(15 downto 0);
      when "001" =>
        state := databig(31 downto 16);
      when "010" =>
        state := databig(47 downto 32);
      when "011" =>
        state := databig(63 downto 48);
      when "100" =>
        state := databig(79 downto 64);
      when "101" =>
        state := databig(95 downto 80);
      when "110" =>
        state := databig(111 downto 96);
      when "111" =>
        state := databig(127 downto 112);     
      when others =>
        state := (OTHERS => 'X');
    end case;
    waydata <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

