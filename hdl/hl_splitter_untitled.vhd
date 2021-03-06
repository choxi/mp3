--
-- VHDL Architecture ece411.hl_splitter.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx29.ews.illinois.edu)
--          at - 00:57:48 10/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY hl_splitter IS
   PORT( 
      word   : IN     lc3b_word;
      high_b : OUT    lc3b_byte;
      low_b  : OUT    lc3b_byte
   );

-- Declarations

END hl_splitter ;

--
ARCHITECTURE untitled OF hl_splitter IS
BEGIN
  high_b <= word(15 downto 8);
  low_b <= word(7 downto 0);
END ARCHITECTURE untitled;

