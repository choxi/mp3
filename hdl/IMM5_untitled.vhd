--
-- VHDL Architecture ece411.IMM5EXT.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx13.ews.illinois.edu)
--          at - 22:34:55 09/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT5 IS
   PORT( 
      imm5    : IN     LC3b_imm5;
      imm5ext : OUT    LC3b_word
   );

-- Declarations

END SEXT5 ;

--
ARCHITECTURE UNTITLED OF SEXT5 IS
BEGIN
	imm5ext <= (imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5) AFTER DELAY_MUX2;
END UNTITLED;


