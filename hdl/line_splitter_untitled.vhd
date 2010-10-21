--
-- VHDL Architecture ece411.line_splitter.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx29.ews.illinois.edu)
--          at - 01:22:45 10/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY line_splitter IS
   PORT( 
      oword : IN     lc3b_oword;
      bk0   : OUT    lc3b_word;
      bk1   : OUT    lc3b_word;
      bk2   : OUT    lc3b_word;
      bk3   : OUT    lc3b_word;
      bk4   : OUT    lc3b_word;
      bk5   : OUT    lc3b_word;
      bk6   : OUT    lc3b_word;
      bk7   : OUT    lc3b_word
   );

-- Declarations

END line_splitter ;

--
ARCHITECTURE untitled OF line_splitter IS
BEGIN
  bk0 <= oword(15 downto 0);
  bk1 <= oword(31 downto 16);
  bk2 <= oword(47 downto 32);
  bk3 <= oword(63 downto 48);
  bk4 <= oword(79 downto 64);
  bk5 <= oword(95 downto 80);
  bk6 <= oword(111 downto 96);
  bk7 <= oword(127 downto 112);
END ARCHITECTURE untitled;

