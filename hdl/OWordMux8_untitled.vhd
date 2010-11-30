--
-- VHDL Architecture ece411.OWordMux8.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx6.ews.illinois.edu)
--          at - 00:10:29 11/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OWordMux8 IS
   PORT( 
      A      : IN     lc3b_oword;
      B      : IN     lc3b_oword;
      C      : IN     lc3b_oword;
      D      : IN     lc3b_oword;
      E      : IN     lc3b_oword;
      F      : IN     lc3b_oword;
      G      : IN     lc3b_oword;
      H      : IN     lc3b_oword;
      Output : OUT    lc3b_oword;
      Sel    : IN     lc3b_reg
   );

-- Declarations

END OWordMux8 ;

--
ARCHITECTURE untitled OF OWordMux8 IS
BEGIN
PROCESS (A,B,C,D,E,F,G,H,Sel)
  variable state : LC3b_oword;
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
  Output <= state after delay_MUX8;
END PROCESS;
END ARCHITECTURE untitled;

