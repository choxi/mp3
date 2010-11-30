--
-- VHDL Architecture ece411.or8.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx6.ews.illinois.edu)
--          at - 21:56:09 11/29/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY or8 IS
   PORT( 
      A      : IN     std_logic;
      B      : IN     std_logic;
      C      : IN     std_logic;
      D      : IN     std_logic;
      E      : IN     std_logic;
      F      : IN     std_logic;
      G      : IN     std_logic;
      H      : IN     std_logic;
      Output : OUT    std_logic
   );

-- Declarations

END or8 ;

--
ARCHITECTURE untitled OF or8 IS
BEGIN
  Output <= A OR B OR C OR D OR E OR F OR G OR H after delay_logic8;
END ARCHITECTURE untitled;

