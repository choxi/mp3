--
-- VHDL Architecture ece411.ADJ6.untitled
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

ENTITY ADJ6 IS
   PORT( 
      index6  : IN     LC3b_index6;
      ADJ6out : OUT    LC3b_word
   );

-- Declarations

END ADJ6 ;

--
ARCHITECTURE UNTITLED OF ADJ6 IS
BEGIN
	ADJ6OUT <= INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6 & '0' AFTER DELAY_MUX2;
END UNTITLED;


