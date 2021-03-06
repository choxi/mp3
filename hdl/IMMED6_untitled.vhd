--
-- VHDL Architecture ece411.IMMED6.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx23.ews.illinois.edu)
--          at - 00:11:58 09/15/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT6 IS
   PORT( 
      imm6    : IN     LC3b_index6;
      imm6ext : OUT    LC3b_word
   );

-- Declarations

END SEXT6 ;

--
ARCHITECTURE untitled OF SEXT6 IS
BEGIN
	imm6ext <= (imm6(5) & imm6(5) & imm6(5) & imm6(5) & imm6(5) & imm6(5) & imm6(5) & imm6(5) & imm6(5) & imm6(5) & imm6) AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

