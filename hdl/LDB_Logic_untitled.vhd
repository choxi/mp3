--
-- VHDL Architecture ece411.LDB_Logic.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx23.ews.illinois.edu)
--          at - 01:30:31 09/15/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LDB_Logic IS
   PORT( 
      ADDR_LSB    : IN     std_logic;
      Input_addr  : IN     LC3b_word;
      Output_addr : OUT    LC3b_word
   );

-- Declarations

END LDB_Logic ;

--
ARCHITECTURE untitled OF LDB_Logic IS
signal Temp_output_addr : LC3b_word;
BEGIN
  LDB_select: PROCESS (ADDR_LSB, Input_addr) 
  BEGIN
    if (ADDR_LSB = '1') then
      Temp_output_addr <= ("00000000" & Input_addr(15 downto 8));
    else
      Temp_output_addr <= ("00000000" & Input_addr(7 downto 0));
    end if; 
  END PROCESS LDB_select;
  Output_addr <= Temp_output_addr AFTER DELAY_MUX2;
END ARCHITECTURE untitled;

