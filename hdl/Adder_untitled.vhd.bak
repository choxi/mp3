--
-- VHDL Architecture ece411.Adder.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx11.ews.illinois.edu)
--          at - 23:26:21 10/17/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Adder IS
   PORT( 
      A : IN     lc3b_word;
      B : IN     lc3b_word;
      F : OUT    lc3b_word
   );

-- Declarations

END Adder ;

--
ARCHITECTURE untitled OF Adder IS
BEGIN
  F <= STD_LOGIC_VECTOR(SIGNED(A) + SIGNED(B)) after delay_adder;
END ARCHITECTURE untitled;

