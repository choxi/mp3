--
-- VHDL Architecture ece411.STB_Logic.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx24.ews.illinois.edu)
--          at - 18:17:31 09/15/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY STB_Logic IS
   PORT( 
      Input_data  : IN     LC3b_word;
      Output_data : OUT    LC3b_word
   );

-- Declarations

END STB_Logic ;

--
ARCHITECTURE untitled OF STB_Logic IS
BEGIN
  Output_data <= (Input_data(7 downto 0) & Input_data(7 downto 0)) AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

