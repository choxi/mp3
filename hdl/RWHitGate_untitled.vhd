--
-- VHDL Architecture ece411.RWHitGate.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx28.ews.illinois.edu)
--          at - 01:49:03 10/28/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RWHitGate IS
   PORT( 
      clk         : IN     std_logic;
      rw_hit_gate : OUT    std_logic
   );

-- Declarations

END RWHitGate ;

--
ARCHITECTURE untitled OF RWHitGate IS
BEGIN
  rw_hit_gate <= ((clk) AND NOT(clk'delayed(10ns)));
END ARCHITECTURE untitled;

