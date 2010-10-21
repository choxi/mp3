--
-- VHDL Architecture ece411.ByteMux2.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx29.ews.illinois.edu)
--          at - 01:05:02 10/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteMux2 IS
   PORT( 
      A   : IN     LC3b_byte;
      B   : IN     LC3b_byte;
      Sel : IN     std_logic;
      F   : OUT    LC3b_byte
   );

-- Declarations

END ByteMux2 ;

--
ARCHITECTURE untitled OF ByteMux2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : LC3b_byte;
  BEGIN
    case Sel is
      when '0' =>
        state := A;
      when '1' =>
        state := B;
      when others =>
        state := (OTHERS => 'X');
    end case;
    F <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

