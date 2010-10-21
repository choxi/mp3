--
-- VHDL Architecture ece411.NPZComp.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx27.ews.illinois.edu)
--          at - 20:18:19 10/18/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NPZComp IS
   PORT( 
      N          : IN     std_logic;
      P          : IN     std_logic;
      RegN       : IN     std_logic;
      RegP       : IN     std_logic;
      RegZ       : IN     std_logic;
      Z          : IN     std_logic;
      NZPCompOut : OUT    std_logic
   );

-- Declarations

END NPZComp ;

--
ARCHITECTURE untitled OF NPZComp IS
BEGIN
  NZPCompOut <= ((N AND RegN) OR (Z AND RegZ) OR (P AND RegP)) after 3ns;
END ARCHITECTURE untitled;