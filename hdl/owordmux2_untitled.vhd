--
-- VHDL Architecture ece411.owordmux2.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx27.ews.illinois.edu)
--          at - 01:49:58 09/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY owordmux2 IS
   PORT( 
      a   : IN     lc3b_oword;
      b   : IN     lc3b_oword;
      Sel : IN     std_logic;
      f   : OUT    lc3b_oword
   );

-- Declarations

END owordmux2 ;

--
ARCHITECTURE untitled OF owordmux2 IS
BEGIN
    PROCESS (a, b, Sel)
      variable state : LC3b_oword;
    BEGIN
      case Sel is
        when '0' =>
          state := a;
        when '1' =>
          state := b;
        when others =>
          state := (OTHERS => 'X');
      end case;
      f <= state after delay_MUX2;
    END PROCESS;
END ARCHITECTURE untitled;

