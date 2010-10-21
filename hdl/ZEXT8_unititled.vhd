--
-- VHDL Architecture ece411.ZEXT8.unititled
--
-- Created:
--          by - tkalbar2.stdt (gllnx19.ews.illinois.edu)
--          at - 22:44:54 09/16/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZEXT8 IS
   PORT( 
      trap8    : IN     LC3b_trapvect8;
      zext8out : OUT    LC3b_word
   );

-- Declarations

END ZEXT8 ;

--
ARCHITECTURE unititled OF ZEXT8 IS
BEGIN
  zext8out <= ("0000000" & trap8 & '0') AFTER DELAY_MUX2;
END ARCHITECTURE unititled;

