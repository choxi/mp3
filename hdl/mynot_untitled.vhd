--
-- VHDL Architecture ece411.mynot.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:10:38 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mynot IS
   PORT( 
      a : IN     std_logic;
      s : OUT    std_logic
   );

-- Declarations

END mynot ;

--
ARCHITECTURE untitled OF mynot IS
BEGIN
  s <= (a XOR '1') after DELAY_LOGIC2;
END ARCHITECTURE untitled;

