--
-- VHDL Architecture ece411.ADJ11.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx19.ews.illinois.edu)
--          at - 22:39:30 09/16/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ11 IS
   PORT( 
      offset11 : IN     LC3b_offset11;
      ADJ11out : OUT    LC3b_word
   );

-- Declarations

END ADJ11 ;

--
ARCHITECTURE untitled OF ADJ11 IS
BEGIN
  ADJ11OUT <= offset11(10) & offset11(10) & offset11(10) & offset11(10) & offset11 & '0' AFTER DELAY_MUX2;

END ARCHITECTURE untitled;

