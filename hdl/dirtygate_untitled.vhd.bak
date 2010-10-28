--
-- VHDL Architecture ece411.dirtygate.untitled
--
-- Created:
--          by - tkalbar2.stdt (linux1.ews.illinois.edu)
--          at - 02:48:52 10/04/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY dirtygate IS
   PORT( 
      clk   : IN     std_logic;
      dclk  : IN     std_logic;
      dgate : OUT    std_logic
   );

-- Declarations

END dirtygate ;

--
ARCHITECTURE untitled OF dirtygate IS
BEGIN
  dgate <= (NOT(clk) OR dclk);
END ARCHITECTURE untitled;

