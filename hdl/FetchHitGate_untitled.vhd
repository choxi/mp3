--
-- VHDL Architecture ece411.FetchHitGate.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 03:00:57 11/09/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY FetchHitGate IS
   PORT( 
      clk : IN     std_logic;
      fetch_gate : OUT std_logic
   );

-- Declarations

END FetchHitGate ;

--
ARCHITECTURE untitled OF FetchHitGate IS
BEGIN
  fetch_gate <= ((clk) OR NOT(clk'delayed(31ns)));
END ARCHITECTURE untitled;

