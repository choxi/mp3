--
-- VHDL Architecture ece411.addr_splitter.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:17:48 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY addr_splitter IS
   PORT( 
      address : IN     lc3b_word;
      index   : OUT    lc3b_cindex;
      offset  : OUT    lc3b_coffset;
      tag     : OUT    lc3b_tag
   );

-- Declarations

END addr_splitter ;

--
ARCHITECTURE untitled OF addr_splitter IS
BEGIN
    offset <= address(3 DOWNTO 0);
	  index <= address(6 DOWNTO 4);
	  tag <= address(15 DOWNTO 7);
END ARCHITECTURE untitled;

