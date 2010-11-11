--
-- VHDL Architecture ece411.mux2.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx27.ews.illinois.edu)
--          at - 02:30:08 09/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mux2 IS
   PORT( 
      a   : IN     std_logic;
      b   : IN     std_logic;
      f   : OUT    std_logic;
      sel : IN     std_logic
   );

-- Declarations

END mux2 ;

--
ARCHITECTURE untitled OF mux2 IS
BEGIN
  PROCESS (a, b, Sel)
    variable state : std_logic;
  BEGIN
    case Sel is
      when '0' =>
        state := a;
      when '1' =>
        state := b;
      when others =>
        state := 'X';
    end case;
    F <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

