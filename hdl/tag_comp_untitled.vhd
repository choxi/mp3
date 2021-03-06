--
-- VHDL Architecture ece411.tag_comp.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx24.ews.illinois.edu)
--          at - 14:20:47 09/24/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY tag_comp IS
   PORT( 
      tag_addr  : IN     lc3b_tag;
      tag_cache : IN     lc3b_tag;
      equal     : OUT    std_logic
   );

-- Declarations

END tag_comp ;

--
ARCHITECTURE untitled OF tag_comp IS
signal temp_equal : std_logic;
BEGIN
 	vhdl_comp : PROCESS (tag_addr, tag_cache)

 	BEGIN
    if (tag_addr = tag_cache) then
      temp_equal <= '1';
    else
      temp_equal <= '0';
    end if;
  end Process vhdl_comp;
equal <= temp_equal after DELAY_COMPARE;
END ARCHITECTURE untitled;

