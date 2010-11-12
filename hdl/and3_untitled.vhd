--
-- VHDL Architecture ece411.and3.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:14:28 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY and3 IS
   PORT( 
      a : IN     std_logic;
      b : IN     std_logic;
      c : IN     std_logic;
      s : OUT    std_logic
   );

-- Declarations

END and3 ;

--
ARCHITECTURE untitled OF and3 IS
BEGIN
  s <= (a AND b AND c) after DELAY_LOGIC4;
END ARCHITECTURE untitled;

