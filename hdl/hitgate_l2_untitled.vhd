--
-- VHDL Architecture ece411.hitgate_l2.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx14.ews.illinois.edu)
--          at - 03:39:51 12/02/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY hitgate_l2 IS
   PORT( 
      clk      : IN     std_logic;
      hitclk   : IN     std_logic;
      hit_gate : OUT    std_logic
   );

-- Declarations

END hitgate_l2 ;

--
ARCHITECTURE untitled OF hitgate_l2 IS
BEGIN
  hgate <= (NOT(clk) AND dclk);
END ARCHITECTURE untitled;

