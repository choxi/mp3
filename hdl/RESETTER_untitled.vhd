--
-- VHDL Architecture ece411.RESETTER.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx16.ews.illinois.edu)
--          at - 00:37:59 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RESETTER IS
   PORT( 
      PMRESP_H  : IN     std_logic;
      RESET_L   : IN     std_logic;
      pre_state : IN     std_logic;
      state     : OUT    std_logic
   );

-- Declarations

END RESETTER ;

--
ARCHITECTURE untitled OF RESETTER IS
BEGIN
  doReset: PROCESS  (RESET_L, PMRESP_H, pre_state)
  begin
  if (RESET_L = '0') then
    state <= '1';
  elsif ( (PMRESP_H = '1') OR (PMRESP_H = '0') ) then
    state <= pre_state;
  else  
    state <= '1';
  end if;
  end process;
  
END ARCHITECTURE untitled;

