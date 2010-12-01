--
-- VHDL Architecture ece411.nand2.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:16:24 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY nand2 IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      s : OUT    std_logic
   );

-- Declarations

END nand2 ;

--
ARCHITECTURE untitled OF nand2 IS
BEGIN
  s <= ((a AND b) XOR '1') after DELAY_LOGIC2;
END ARCHITECTURE untitled;

