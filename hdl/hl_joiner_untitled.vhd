--
-- VHDL Architecture ece411.hl_joiner.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx29.ews.illinois.edu)
--          at - 01:12:46 10/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY hl_joiner IS
   PORT( 
      high_b : IN     lc3b_byte;
      low_b  : IN     lc3b_byte;
      word   : OUT    lc3b_word
   );

-- Declarations

END hl_joiner ;

--
ARCHITECTURE untitled OF hl_joiner IS
BEGIN
  word <= high_b & low_b;
END ARCHITECTURE untitled;

