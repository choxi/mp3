--
-- VHDL Architecture ece411.ID_EX.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx27.ews.illinois.edu)
--          at - 23:49:43 10/18/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ID_EX IS
   PORT( 
      ALUMemSel_ID    : IN     std_logic;
      ALUop_ID        : IN     LC3b_aluop;
      AdjSel_ID       : IN     std_logic;
      BaseSel_ID      : IN     std_logic;
      Branch_ID       : IN     std_logic;
      DR              : IN     lc3b_reg;
      ImmSel_ID       : IN     std_logic;
      PC_ID           : IN     lc3b_word;
      RESET_L         : IN     std_logic;
      Read_ID         : IN     std_logic;
      RegWrite_ID     : IN     std_logic;
      SR1_data_ID     : IN     lc3b_word;
      SR2_data_ID     : IN     lc3b_word;
      STR_data_ID     : IN     lc3b_word;
      SetCC_ID        : IN     std_logic;
      SextSel_ID      : IN     std_logic;
      Write_ID        : IN     std_logic;
      adj_offset6_ID  : IN     lc3b_word;
      adj_offset9_ID  : IN     lc3b_word;
      clk             : IN     std_logic;
      nzp_ID          : IN     lc3b_nzp;
      sext_imm5_ID    : IN     lc3b_word;
      sext_offset6_ID : IN     lc3b_word;
      ALUMemSel_EX    : OUT    std_logic;
      ALUop_EX        : OUT    LC3b_ALUop;
      AdjSel_EX       : OUT    std_logic;
      BaseSel_EX      : OUT    std_logic;
      Branch_EX       : OUT    std_logic;
      DR_EX           : OUT    lc3b_reg;
      ImmSel_EX       : OUT    std_logic;
      PC_EX           : OUT    lc3b_word;
      Read_EX         : OUT    std_logic;
      RegWrite_EX     : OUT    std_logic;
      SR1_data_EX     : OUT    lc3b_word;
      SR2_data_EX     : OUT    lc3b_word;
      STR_data_EX     : OUT    lc3b_word;
      SetCC_EX        : OUT    std_logic;
      SextSel_EX      : OUT    std_logic;
      Write_EX        : OUT    std_logic;
      adj_imm5_EX     : OUT    lc3b_word;
      adj_offset6_EX  : OUT    lc3b_word;
      adj_offset9_EX  : OUT    lc3b_word;
      nzp_EX          : OUT    lc3b_nzp;
      sext_offset6_EX : OUT    lc3b_word
   );

-- Declarations

END ID_EX ;

--
ARCHITECTURE untitled OF ID_EX IS

      SIGNAL Reg_ALUMemSel_EX    :  std_logic;
      SIGNAL Reg_ALUop_EX        :  lc3b_aluop;
      SIGNAL Reg_AdjSel_EX       :  std_logic;
      SIGNAL Reg_BaseSel_EX      :  std_logic;
      SIGNAL Reg_Branch_EX       :  std_logic;
      SIGNAL Reg_DR_EX           :  lc3b_reg;
      SIGNAL Reg_ImmSel_EX       :  std_logic;
      SIGNAL Reg_PC_EX           :  lc3b_word;
      SIGNAL Reg_Read_EX         :  std_logic;
      SIGNAL Reg_RegWrite_EX     :  std_logic;
      SIGNAL Reg_SR1_data_EX     :  lc3b_word;
      SIGNAL Reg_SR2_data_EX     :  lc3b_word;
      SIGNAL Reg_STR_data_EX     :  lc3b_word;
      SIGNAL Reg_SetCC_EX        :  std_logic;
      SIGNAL Reg_SextSel_EX      :  std_logic;
      SIGNAL Reg_Write_EX        :  std_logic;
      SIGNAL Reg_adj_imm5_EX     :  lc3b_word;
      SIGNAL Reg_adj_offset6_EX  :  lc3b_word;
      SIGNAL Reg_adj_offset9_EX  :  lc3b_word;
      SIGNAL Reg_nzp_EX          :  lc3b_nzp;
      SIGNAL Reg_sext_offset6_EX :  lc3b_word;
      
BEGIN
  
  READ_REG : PROCESS (
	Reg_ALUMemSel_EX    ,
	Reg_ALUop_EX        ,
	Reg_AdjSel_EX       ,
	Reg_BaseSel_EX      ,
	Reg_Branch_EX       ,
	Reg_DR_EX           ,
	Reg_ImmSel_EX       ,
	Reg_PC_EX           ,
	Reg_Read_EX         ,
	Reg_RegWrite_EX     ,
	Reg_SR1_data_EX     ,
	Reg_SR2_data_EX     ,
	Reg_STR_data_EX     ,
	Reg_SetCC_EX        ,
	Reg_SextSel_EX      ,
	Reg_Write_EX        ,
	Reg_adj_imm5_EX     ,
	Reg_adj_offset6_EX  ,
	Reg_adj_offset9_EX  ,
	Reg_nzp_EX          ,
	Reg_sext_offset6_EX 
  )
  BEGIN
    ALUMemSel_EX    <=  Reg_ALUMemSel_EX    after delay_reg;
    ALUop_EX        <=  Reg_ALUop_EX        after delay_reg;
    AdjSel_EX       <=  Reg_AdjSel_EX       after delay_reg;
    BaseSel_EX      <=  Reg_BaseSel_EX      after delay_reg;
    Branch_EX       <=  Reg_Branch_EX       after delay_reg;
    DR_EX           <=  Reg_DR_EX           after delay_reg;
    ImmSel_EX       <=  Reg_ImmSel_EX       after delay_reg;
    PC_EX           <=  Reg_PC_EX           after delay_reg;
    Read_EX         <=  Reg_Read_EX         after delay_reg;
    RegWrite_EX     <=  Reg_RegWrite_EX     after delay_reg;
    SR1_data_EX     <=  Reg_SR1_data_EX     after delay_reg;
    SR2_data_EX     <=  Reg_SR2_data_EX     after delay_reg;
    STR_data_EX     <=  Reg_STR_data_EX     after delay_reg;
    SetCC_EX        <=  Reg_SetCC_EX        after delay_reg;
    SextSel_EX      <=  Reg_SextSel_EX      after delay_reg;
    Write_EX        <=  Reg_Write_EX        after delay_reg;
    adj_imm5_EX     <=  Reg_adj_imm5_EX     after delay_reg;
    adj_offset6_EX  <=  Reg_adj_offset6_EX  after delay_reg;
    adj_offset9_EX  <=  Reg_adj_offset9_EX  after delay_reg;
    nzp_EX          <=  Reg_nzp_EX          after delay_reg;
    sext_offset6_EX <=  Reg_sext_offset6_EX after delay_reg;
  END PROCESS READ_REG;

  WRITE_REG : PROCESS(
	CLK,
	RESET_L
  )
  
  BEGIN
    IF (RESET_L = '0') THEN
      Reg_ALUMemSel_EX    <=   '0';
      Reg_ALUop_EX        <=   "000";
      Reg_AdjSel_EX       <=   '0';
      Reg_BaseSel_EX      <=   '0';
      Reg_Branch_EX       <=   '0';
      Reg_DR_EX           <=   "000";
      Reg_ImmSel_EX       <=   '0';
      Reg_PC_EX           <=   "0000000000000000";
      Reg_Read_EX         <=   '0';
      Reg_RegWrite_EX     <=   '0';
      Reg_SR1_data_EX     <=   "0000000000000000";
      Reg_SR2_data_EX     <=   "0000000000000000";
      Reg_STR_data_EX     <=   "0000000000000000";
      Reg_SetCC_EX        <=   '0';
      Reg_SextSel_EX      <=   '0';
      Reg_Write_EX        <=   '0';
      Reg_adj_imm5_EX     <=   "0000000000000000";
      Reg_adj_offset6_EX  <=   "0000000000000000";
      Reg_adj_offset9_EX  <=   "0000000000000000";
      Reg_nzp_EX          <=   "000";
      Reg_sext_offset6_EX <=   "0000000000000000";
    END IF;
    
    IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
      Reg_ALUMemSel_EX    <=   ALUMemSel_ID    ;
      Reg_ALUop_EX        <=   ALUop_ID        ;
      Reg_AdjSel_EX       <=   AdjSel_ID       ;
      Reg_BaseSel_EX      <=   BaseSel_ID      ;
      Reg_Branch_EX       <=   Branch_ID       ;
      Reg_DR_EX           <=   DR              ;
      Reg_ImmSel_EX       <=   ImmSel_ID       ;
      Reg_PC_EX           <=   PC_ID           ;
      Reg_Read_EX         <=   Read_ID         ;
      Reg_RegWrite_EX     <=   RegWrite_ID     ;
      Reg_SR1_data_EX     <=   SR1_data_ID     ;
      Reg_SR2_data_EX     <=   SR2_data_ID     ;
      Reg_STR_data_EX     <=   STR_data_ID     ;
      Reg_SetCC_EX        <=   SetCC_ID        ;
      Reg_SextSel_EX      <=   SextSel_ID      ;
      Reg_Write_EX        <=   Write_ID        ;
      Reg_adj_imm5_EX     <=   sext_imm5_ID    ;
      Reg_adj_offset6_EX  <=   adj_offset6_ID  ;
      Reg_adj_offset9_EX  <=   adj_offset9_ID  ;
      Reg_nzp_EX          <=   nzp_ID          ;
      Reg_sext_offset6_EX <=   sext_offset6_ID ;
    END IF;
  END PROCESS WRITE_REG;
END ARCHITECTURE untitled;
