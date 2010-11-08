--
-- VHDL Architecture ece411.or4.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx16.ews.illinois.edu)
--          at - 22:49:15 11/07/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY or4 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      D : IN     std_logic;
      F : OUT    std_logic
   );

-- Declarations

END or4 ;

--
ARCHITECTURE untitled OF or4 IS

BEGIN
  F <= A OR B OR C OR D after DELAY_LOGIC4;
END ARCHITECTURE untitled;

