--
-- VHDL Architecture ece411.nand3.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:15:32 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY nand3 IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      c : IN     std_logic;
      s : OUT    std_logic
   );

-- Declarations

END nand3 ;

--
ARCHITECTURE untitled OF nand3 IS
BEGIN
  s <= ((a AND b AND c) XOR '1') after DELAY_LOGIC4;
END ARCHITECTURE untitled;

