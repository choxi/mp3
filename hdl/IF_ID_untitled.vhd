--
-- VHDL Architecture ece411.IF_ID.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx27.ews.illinois.edu)
--          at - 22:48:21 10/18/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IF_ID IS
   PORT( 
      Instrout  : IN     lc3b_word;
      PC_IF     : IN     lc3b_word;
      clk       : IN     std_logic;
      DR        : OUT    lc3b_reg;
      Opcode    : OUT    LC3b_opcode;
      PC_ID     : OUT    lc3b_word;
      RESET_L   : IN     std_logic;
      SR1       : OUT    lc3b_reg;
      SR2       : OUT    lc3b_reg;
      bit4_ID   : OUT    std_logic;
      bit5_ID   : OUT    std_logic;
      imm5      : OUT    lc3b_imm5;
      nzp_ID    : OUT    lc3b_nzp;
      offset6   : OUT    lc3b_index6;
      offset9   : OUT    lc3b_offset9;
      mem_stall : IN     std_logic
   );

-- Declarations

END IF_ID ;

--
ARCHITECTURE untitled OF IF_ID IS
  SIGNAL Reg_DR : lc3b_reg;
  SIGNAL Reg_Opcode : lc3b_opcode;
  SIGNAL Reg_PC_ID : lc3b_word;
  SIGNAL Reg_SR1 : lc3b_reg;
  SIGNAL Reg_SR2 : lc3b_reg;
  SIGNAL Reg_bit4_ID : std_logic;
  SIGNAL Reg_bit5_ID : std_logic;
  SIGNAL Reg_imm5 : lc3b_imm5;
  SIGNAL Reg_nzp_ID : lc3b_nzp;
  SIGNAL Reg_offset6 : lc3b_index6;
  SIGNAL Reg_offset9 : lc3b_offset9;
BEGIN
  READ_REG : PROCESS(Reg_DR, Reg_Opcode, Reg_PC_ID, Reg_SR1, Reg_SR2, Reg_bit4_ID, 
                     Reg_bit5_ID, Reg_imm5, Reg_nzp_ID, Reg_offset6, Reg_offset9)
  BEGIN
    DR <= Reg_DR after delay_reg;
    Opcode <= Reg_Opcode after delay_reg;
    PC_ID <= Reg_PC_ID after delay_reg;
    SR1 <= Reg_SR1 after delay_reg;
    SR2 <= Reg_SR2 after delay_reg;
    bit4_ID <= Reg_bit4_ID after delay_reg;
    bit5_ID <= Reg_bit5_ID after delay_reg;
    imm5 <= Reg_imm5 after delay_reg;
    nzp_ID <= Reg_nzp_ID after delay_reg;
    offset6 <= Reg_offset6 after delay_reg;
    offset9 <= Reg_offset9 after delay_reg;
  END PROCESS READ_REG;
                     
  WRITE_REG : PROCESS(CLK, Instrout, RESET_L, MEM_STALL)
  BEGIN
    IF RESET_L = '0' THEN
      Reg_DR <= "000";
      Reg_Opcode <= "0000";
      Reg_PC_ID <= "0000000000000000";
      Reg_SR1 <= "000";
      Reg_SR2 <= "000";
      Reg_bit4_ID <= '0';
      Reg_bit5_ID <= '0';
      Reg_imm5 <= "00000";
      Reg_nzp_ID <= "000";
      Reg_offset6 <= "000000";
      Reg_offset9 <= "000000000";     
    END IF;
    
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') AND (MEM_STALL = '1')) THEN  
      Reg_DR <= Instrout(11 downto 9);
      Reg_Opcode <= Instrout(15 downto 12);
      Reg_PC_ID <= PC_IF;
      Reg_SR1 <= Instrout(8 downto 6);
      Reg_SR2 <= Instrout(2 downto 0);
      Reg_bit4_ID <= Instrout(4);
      Reg_bit5_ID <= Instrout(5);
      Reg_imm5 <= Instrout(4 downto 0);
      Reg_nzp_ID <= Instrout(11 downto 9);
      Reg_offset6 <= Instrout(5 downto 0);
      Reg_offset9 <= Instrout(8 downto 0);
    END IF;
  END PROCESS WRITE_REG;
END ARCHITECTURE untitled;

