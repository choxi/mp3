--
-- VHDL Architecture ece411.and2.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:05:06 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY and2 IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      s : OUT    std_logic
   );

-- Declarations

END and2 ;

--
ARCHITECTURE untitled OF and2 IS
BEGIN
  s <= (a AND b) after DELAY_LOGIC2;
END ARCHITECTURE untitled;

