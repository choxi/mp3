--
-- VHDL Architecture ece411.RegMux.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx16.ews.illinois.edu)
--          at - 23:56:34 11/11/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegMux IS
   PORT( 
      RegA   : IN     lc3b_reg;
      RegB   : IN     lc3b_reg;
      Sel    : IN     std_logic;
      RegOut : OUT    lc3b_reg
   );

-- Declarations

END RegMux ;

--
ARCHITECTURE untitled OF RegMux IS
BEGIN
  PROCESS (RegA, RegB, Sel)
    variable state : LC3b_reg;
  BEGIN
    case Sel is
      when '0' =>
        state := RegA;
      when '1' =>
        state := RegB;
      when others =>
        state := (OTHERS => 'X');
    end case;
    RegOut <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

