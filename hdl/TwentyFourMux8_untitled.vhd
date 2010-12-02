--
-- VHDL Architecture ece411.TwentyFourMux8.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx14.ews.illinois.edu)
--          at - 23:42:24 12/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TwentyFourMux8 IS
   PORT( 
      A      : IN     lc3b_24;
      B      : IN     lc3b_24;
      C      : IN     lc3b_24;
      D      : IN     lc3b_24;
      E      : IN     lc3b_24;
      F      : IN     lc3b_24;
      G      : IN     lc3b_24;
      H      : IN     lc3b_24;
      Output : OUT    lc3b_24;
      Sel    : IN     lc3b_reg
   );

-- Declarations

END TwentyFourMux8 ;

--
ARCHITECTURE untitled OF TwentyFourMux8 IS
BEGIN
PROCESS (A,B,C,D,E,F,G,H,Sel)
  variable state : LC3b_24;
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

