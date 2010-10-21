--
-- VHDL Architecture ece411.delaygate.untitled
--
-- Created:
--          by - tkalbar2.stdt (linux1.ews.illinois.edu)
--          at - 02:58:45 10/04/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delaygate IS
   PORT( 
      clk   : IN     std_logic;
      dclk  : IN     std_logic;
      dgate : OUT    std_logic
   );

-- Declarations

END delaygate ;

--
ARCHITECTURE untitled OF delaygate IS
BEGIN
  dgate <= ((NOT(clk)) AND dclk);
END ARCHITECTURE untitled;

