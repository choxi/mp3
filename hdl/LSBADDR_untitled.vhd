--
-- VHDL Architecture ece411.LSBADDR.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx23.ews.illinois.edu)
--          at - 02:04:25 09/15/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LSBADDR IS
   PORT( 
      Address : IN     LC3b_word;
      LSB     : OUT    std_logic
   );

-- Declarations

END LSBADDR ;

--
ARCHITECTURE untitled OF LSBADDR IS
BEGIN
  LSB <= Address(0);
END ARCHITECTURE untitled;

