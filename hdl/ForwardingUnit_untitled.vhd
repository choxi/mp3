--
-- VHDL Architecture ece411.ForwardingUnit.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 22:54:05 11/08/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ForwardingUnit IS
   PORT( 
      DR_MEM       : IN     lc3b_reg;
      RegWrite_MEM : IN     std_logic;
      SR1_EX       : IN     lc3b_reg;
      SR2_EX       : IN     lc3b_reg;
      FUMux1_sel   : OUT    std_logic;
      FUMux2_sel   : OUT    std_logic;
      FUTypeWB1    : OUT    std_logic;
      FUTypeWB2    : OUT    std_logic;
      DestReg      : IN     lc3b_reg;
      RegWrite     : IN     std_logic
   );

-- Declarations

END ForwardingUnit ;

--
ARCHITECTURE untitled OF ForwardingUnit IS
BEGIN
  FORWARD : PROCESS(RegWrite_MEM, DR_MEM, SR1_EX, SR2_EX)
  BEGIN
      IF ((RegWrite_MEM = '1') AND (SR1_EX = DR_MEM)) THEN
        FUMux1_sel <= '1';
        FUTypeWB1 <= '0';
      ELSIF ((RegWrite = '1') AND (SR1_EX = DestReg)
              AND (NOT ((RegWrite_MEM = '1') AND (SR1_EX = DR_MEM))) ) THEN
        FUMux1_sel <= '1';
        FUTypeWB1 <= '1';
      ELSE
        FUMux1_sel <= '0';
        FUTypeWB1 <= '0';
      END IF;
      IF ((RegWrite_MEM = '1') AND (SR2_EX = DR_MEM)) THEN
        FUMux2_sel <= '1';
        FUTypeWB2 <= '0';
      ELSIF ((RegWrite = '1') AND (SR2_EX = DestReg)
              AND (NOT ((RegWrite_MEM = '1') AND (SR2_EX = DR_MEM))) ) THEN
        FUMux2_sel <= '1';
        FUTypeWB2 <= '1';
      ELSE
        FUMux2_sel <= '0';
        FUTypeWB2 <= '0';
      END IF;
  END PROCESS;
END ARCHITECTURE untitled;

