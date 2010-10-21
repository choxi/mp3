--
-- VHDL Architecture ece411.decoder38.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx35.ews.illinois.edu)
--          at - 23:36:47 09/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY decoder38 IS
   PORT( 
      offset_d : IN     lc3b_coffset;
      w0       : OUT    std_logic;
      w1       : OUT    std_logic;
      w2       : OUT    std_logic;
      w3       : OUT    std_logic;
      w4       : OUT    std_logic;
      w5       : OUT    std_logic;
      w6       : OUT    std_logic;
      w7       : OUT    std_logic
   );

-- Declarations

END decoder38 ;

--
ARCHITECTURE untitled OF decoder38 IS
BEGIN
  w0 <= (NOT(offset_d(3)) AND NOT(offset_d(2)) AND NOT(offset_d(1))) after DELAY_DECODE;
  w1 <= (NOT(offset_d(3)) AND NOT(offset_d(2)) AND offset_d(1)) after DELAY_DECODE;
  w2 <= (NOT(offset_d(3)) AND offset_d(2) AND NOT(offset_d(1))) after DELAY_DECODE;
  w3 <= (NOT(offset_d(3)) AND offset_d(2) AND offset_d(1)) after DELAY_DECODE;
  w4 <= (offset_d(3) AND NOT(offset_d(2)) AND NOT(offset_d(1))) after DELAY_DECODE;
  w5 <= (offset_d(3) AND NOT(offset_d(2)) AND offset_d(1)) after DELAY_DECODE;
  w6 <= (offset_d(3) AND offset_d(2) AND NOT(offset_d(1))) after DELAY_DECODE;
  w7 <= (offset_d(3) AND offset_d(2) AND offset_d(1)) after DELAY_DECODE;
END ARCHITECTURE untitled;

