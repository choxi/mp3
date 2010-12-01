--
-- VHDL Architecture ece411.Encoder8to3.untitled
--
-- Created:
--          by - cjpark3.stdt (eelnx37.ews.illinois.edu)
--          at - 21:10:09 11/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Encoder8to3 IS
   PORT( 
      prehit0   : IN     std_logic;
      prehit1   : IN     std_logic;
      prehit2   : IN     std_logic;
      prehit3   : IN     std_logic;
      prehit4   : IN     std_logic;
      prehit5   : IN     std_logic;
      prehit6   : IN     std_logic;
      prehit7   : IN     std_logic;
      prehitSel : OUT    std_logic_vector (2 DOWNTO 0)
   );

-- Declarations

END Encoder8to3 ;

--
ARCHITECTURE untitled OF Encoder8to3 IS
BEGIN
  PROCESS (prehit0, prehit1, prehit2, prehit3, prehit4, prehit5, prehit6, prehit7)
    variable prehitout : std_logic_vector(2 downto 0);
    variable prehits : std_logic_vector(7 downto 0);
  BEGIN
    prehits := prehit7&prehit6&prehit5&prehit4&prehit3&prehit2&prehit1&prehit0;
    case prehits is
    when "00000001" =>
      prehitout := "000";
    when "00000010" =>
      prehitout := "001";
    when "00000100" =>
      prehitout := "010";
    when "00001000" =>
      prehitout := "011";
    when "00010000" =>
      prehitout := "100";
    when "00100000" =>
      prehitout := "101";
    when "01000000" =>
      prehitout := "110";
    when "10000000" =>
      prehitout := "111";
    when others =>
      prehitout := "XXX";
    end case;
    prehitSel <= prehitout after DELAY_ENCODE8;
  END PROCESS;
  
END ARCHITECTURE untitled;

