--
-- VHDL Architecture ece411.Mux8.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx6.ews.illinois.edu)
--          at - 00:18:01 11/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Mux8 IS
   PORT( 
      A      : IN     std_logic;
      B      : IN     std_logic;
      C      : IN     std_logic;
      D      : IN     std_logic;
      E      : IN     std_logic;
      F      : IN     std_logic;
      G      : IN     std_logic;
      H      : IN     std_logic;
      Output : OUT    std_logic;
      Sel    : IN     lc3b_reg
   );

-- Declarations

END Mux8 ;

--
ARCHITECTURE untitled OF Mux8 IS
BEGIN
  PROCESS (A,B,C,D,E,F,G,H,Sel)
    variable state : std_logic;
  BEGIN
    case Sel is
      when "000" =>
        state := A;
      when "001" =>
        state := B;
      when "010" =>
        state := C;
      when "011" =>
        state := D;
      when "100" =>
        state := E;
      when "101" =>
        state := F;
      when "110" =>
        state := G;
      when "111" =>
        state := H;     
      when others =>
        state := (OTHERS => 'X');
    end case;
    Output <= state after delay_MUX8;
  END PROCESS;
END ARCHITECTURE untitled;

