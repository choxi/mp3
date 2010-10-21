--
-- VHDL Architecture ece411.line_joiner.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx29.ews.illinois.edu)
--          at - 01:18:46 10/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY line_joiner IS
   PORT( 
      bk0   : IN     lc3b_word;
      bk1   : IN     lc3b_word;
      bk2   : IN     lc3b_word;
      bk3   : IN     lc3b_word;
      bk4   : IN     lc3b_word;
      bk5   : IN     lc3b_word;
      bk6   : IN     lc3b_word;
      bk7   : IN     lc3b_word;
      oword : OUT    lc3b_oword
   );

-- Declarations

END line_joiner ;

--
ARCHITECTURE untitled OF line_joiner IS
BEGIN
  oword <= (bk7 & bk6 & bk5 & bk4 & bk3 & bk2 & bk1 & bk0);
END ARCHITECTURE untitled;

