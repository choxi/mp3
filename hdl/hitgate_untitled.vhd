--
-- VHDL Architecture ece411.hitgate.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx27.ews.illinois.edu)
--          at - 02:04:10 09/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY hitgate IS
   PORT( 
      clk  : IN     std_logic;
      dclk : IN     std_logic;
      hgate : OUT    std_logic
   );

-- Declarations

END hitgate ;

--
ARCHITECTURE untitled OF hitgate IS
BEGIN
  hgate <= (NOT(clk) AND dclk);
END ARCHITECTURE untitled;

