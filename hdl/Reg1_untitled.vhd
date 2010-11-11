--
-- VHDL Architecture ece411.Reg1.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 19:33:45 11/10/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Reg1 IS
   PORT( 
      Input  : IN     std_logic;
      RESET  : IN     std_logic;
      clk    : IN     std_logic;
      load   : IN     std_logic;
      Output : OUT    std_logic
   );

-- Declarations

END Reg1 ;

--
ARCHITECTURE untitled OF Reg1 IS
  signal pre_out : std_logic;
BEGIN
  PROCESS (clk, RESET, Input)
  BEGIN
    if (RESET = '0') then
      pre_out <= '1';
    elsif (clk'event and clk = '1') then
      if (load = '1') then
        pre_out <= Input;
      end if;
    end if;
  end process;

  Output <= pre_out after delay_reg;
END ARCHITECTURE untitled;

