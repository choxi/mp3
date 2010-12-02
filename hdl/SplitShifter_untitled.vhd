--
-- VHDL Architecture ece411.SplitShifter.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx14.ews.illinois.edu)
--          at - 23:05:41 12/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SplitShifter IS
   PORT( 
      SplitIndex : IN     lc3b_reg;
      LRUin      : IN     lc3b_24;
      LRUShiftout     : OUT    lc3b_24
   );

-- Declarations

END SplitShifter ;

--
ARCHITECTURE untitled OF SplitShifter IS
  SIGNAL Pre_output : lc3b_24;
BEGIN
   SHIFT : PROCESS(LRUin, SplitIndex)
     
   BEGIN
     case SplitIndex is
       when "000" =>
         Pre_output <= LRUin;
       when "001" =>
         Pre_output <= LRUin(20 downto 18) & LRUin(23 downto 21) & LRUin(17 downto 0);
       when "010" =>
         Pre_output <= LRUin(17 downto 15) & LRUin(23 downto 18) & LRUin(14 downto 0);
       when "011" =>
         Pre_output <= LRUin(14 downto 12) & LRUin(23 downto 15) & LRUin(11 downto 0);
       when "100" =>
         Pre_output <= LRUin(11 downto 9) & LRUin(23 downto 12) & LRUin(8 downto 0);
       when "101" =>
         Pre_output <= LRUin(8 downto 6) & LRUin(23 downto 9) & LRUin(5 downto 0);
       when "110" =>
         Pre_output <= LRUin(5 downto 3) & LRUin(23 downto 6) & LRUin(2 downto 0);
       when "111" =>
         Pre_output <= LRUin(2 downto 0) & LRUin(23 downto 3);
       when others =>
         Pre_output <= "XXXXXXXXXXXXXXXXXXXXXXXX";
      end case; 
      LRUShiftout <= Pre_output after delay_shifter;
 END PROCESS;
       
   
END ARCHITECTURE untitled;

