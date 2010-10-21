--
-- VHDL Architecture ece411.addr_joiner.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx27.ews.illinois.edu)
--          at - 14:38:02 10/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY addr_joiner IS
   PORT( 
      index   : IN     lc3b_cindex;
      offset  : IN     lc3b_coffset;
      tag     : IN     lc3b_tag;
      address : OUT    lc3b_word
   );

-- Declarations

END addr_joiner ;

--
ARCHITECTURE untitled OF addr_joiner IS
BEGIN
  address <= tag & index & offset;
END ARCHITECTURE untitled;

