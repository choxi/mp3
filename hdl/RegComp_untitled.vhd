--
-- VHDL Architecture ece411.RegComp.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 01:50:15 11/09/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegComp IS
   PORT( 
      A : IN     lc3b_reg;
      B : IN     lc3b_reg;
      F : OUT    std_logic
   );

-- Declarations

END RegComp ;

--
ARCHITECTURE untitled OF RegComp IS
  SIGNAL result : std_logic;
BEGIN
  COMPARE : PROCESS (A, B)
  BEGIN
    IF (A = B) THEN
      result <= '1';
    ELSE
      result <= '0';
    END IF;
  END PROCESS;
  F <= result after delay_compare8;  
END ARCHITECTURE untitled;

