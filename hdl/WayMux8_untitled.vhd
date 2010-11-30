--
-- VHDL Architecture ece411.WayMux8.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx6.ews.illinois.edu)
--          at - 22:05:38 11/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux8 IS
   PORT( 
      A      : IN     lc3b_word;
      B      : IN     lc3b_word;
      C      : IN     lc3b_word;
      D      : IN     lc3b_word;
      E      : IN     lc3b_word;
      F      : IN     lc3b_word;
      G      : IN     lc3b_word;
      H      : IN     lc3b_word;
      Output : OUT    lc3b_word;
      Sel    : IN     lc3b_reg
   );

-- Declarations

END WordMux8 ;

--
ARCHITECTURE untitled OF WordMux8 IS
BEGIN
  PROCESS (A,B,C,D,E,F,G,H,Sel)
    variable state : LC3b_word;
  BEGIN
    case Sel is
      when "000" =>
        state := A;
      when "001" =>
        state := B;
      when "010" =>
        state := C;
      when "011" =>
        state := D;
      when "100" =>
        state := E;
      when "101" =>
        state := F;
      when "110" =>
        state := G;
      when "111" =>
        state := H;     
      when others =>
        state := (OTHERS => 'X');
    end case;
    waydata <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

