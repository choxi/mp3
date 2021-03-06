--
-- VHDL Architecture ece411.MEM_WB.untitled
--
-- Created:
--          by - cjpark3.ece411_G2 (eelnx29.ews.illinois.edu)
--          at - 21:54:35 10/19/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEM_WB IS
   PORT( 
      ALUMemSel_MEM : IN     std_logic;
      ALUout_MEM    : IN     LC3b_word;
      DR_MEM        : IN     lc3b_reg;
      Opcode_MEM    : IN     lc3b_opcode;
      RESET_L       : IN     std_logic;
      RegWrite_MEM  : IN     std_logic;
      SetCC_MEM     : IN     std_logic;
      JSRSel_MEM    : IN     std_logic;
      clk           : IN     std_logic;
      PC_MEM        : IN     lc3b_word;
      dataout_MEM   : IN     lc3b_word;
      load_latch    : IN     std_logic;
      ALUMemSel_WB  : OUT    std_logic;
      ALUout_WB     : OUT    lc3b_word;
      DestReg       : OUT    lc3b_reg;
      Opcode_WB     : OUT    lc3b_opcode;
      RegWrite      : OUT    std_logic;
      SetCC_WB      : OUT    std_logic;
      PC_WB         : OUT    lc3b_word;
      dataout_WB    : OUT    lc3b_word;
      JSRSel_WB     : OUT    std_logic;
      nzp_mem       : IN     lc3b_nzp;
      nzp_wb        : OUT    lc3b_nzp;
      ZextSel_MEM   : IN     std_logic;
      ZextSel_WB    : OUT    std_logic
   );

-- Declarations

END MEM_WB ;

--
ARCHITECTURE untitled OF MEM_WB IS

      SIGNAL Reg_RegWrite         :  std_logic;
      SIGNAL Reg_ALUMemSel_WB     :  std_logic;
      SIGNAL Reg_SetCC_WB         :  std_logic;
      
      SIGNAL Reg_JSRSel_WB        :  std_logic;
      
      SIGNAL Reg_PC_WB            :  lc3b_word;
      SIGNAL Reg_dataout_WB       :  lc3b_word;
      SIGNAL Reg_ALUout_WB        :  lc3b_word;
      SIGNAL Reg_DestReg          :  lc3b_reg;
      SIGNAL Reg_Opcode_WB        :  lc3b_opcode;
      SIGNAL Reg_nzp_wb           :  lc3b_nzp;
      SIGNAL Reg_ZextSel_WB       :  std_logic;
BEGIN
  
  READ_REG : PROCESS(
	Reg_RegWrite      ,
	Reg_ALUMemSel_WB  ,
	Reg_SetCC_WB      ,
	Reg_JSRSel_WB     ,
	Reg_PC_WB         ,
	Reg_dataout_WB    ,
	Reg_ALUout_WB     ,
	Reg_DestReg       ,
	Reg_Opcode_WB     ,
	Reg_nzp_wb,
	Reg_ZextSel_WB  
  )
  BEGIN
	  RegWrite     <=  Reg_RegWrite      	  after delay_reg;
    ALUMemSel_WB <=  Reg_ALUMemSel_WB     after delay_reg;
    SetCC_WB     <=  Reg_SetCC_WB         after delay_reg;
    JSRSel_WB    <=  Reg_JSRSel_WB        after delay_reg;

    PC_WB        <=  Reg_PC_WB            after delay_reg;
    dataout_WB   <=  Reg_dataout_WB       after delay_reg;
    ALUout_WB    <=  Reg_ALUout_WB        after delay_reg;
    DestReg      <=  Reg_DestReg          after delay_reg;
    Opcode_WB    <=  Reg_Opcode_WB        after delay_reg;
    nzp_wb       <=  Reg_nzp_wb           after delay_reg;
    ZextSel_WB   <=  Reg_ZextSel_Wb       after delay_reg;
  END PROCESS READ_REG;

-- does CLK belong in the sensitivity list? Yes. 
  WRITE_REG : PROCESS(CLK ,RESET_L, LOAD_LATCH)
  
  BEGIN
    IF (RESET_L = '0') THEN
		  Reg_RegWrite   			       <=   '0';
      Reg_ALUMemSel_WB         <=   '0';
      Reg_SetCC_WB             <=   '0';
      Reg_JSRSel_WB            <=   '0';

      Reg_PC_WB                <=   "0000000000000000";
      Reg_dataout_WB           <=   "0000000000000000";
      Reg_ALUout_WB            <=   "0000000000000000";
      Reg_DestReg              <=   "000";
      Reg_Opcode_WB            <=   "0000";
      Reg_nzp_wb               <=   "000";
      Reg_ZextSel_WB           <=   '0';
    END IF;
    IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') AND (Reg_ZextSel_WB = '1') AND (LOAD_LATCH = '1')) THEN
      Reg_RegWrite   			       <=   '0';
      Reg_ALUMemSel_WB         <=   '0';
      Reg_SetCC_WB             <=   '0';
      Reg_JSRSel_WB            <=   '0';

      Reg_PC_WB                <=   "0000000000000000";
      Reg_dataout_WB           <=   "0000000000000000";
      Reg_ALUout_WB            <=   "0000000000000000";
      Reg_DestReg              <=   "000";
      Reg_Opcode_WB            <=   "0000";
      Reg_nzp_wb               <=   "000";
      Reg_ZextSel_WB           <=   '0';      
    ELSIF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0') AND (LOAD_LATCH = '1')) THEN
		  Reg_RegWrite   	   <=   RegWrite_MEM  ;
      Reg_ALUMemSel_WB   <=   ALUMemSel_MEM	;
      Reg_SetCC_WB       <=   SetCC_MEM    	;
      Reg_JSRSel_WB      <=   JSRSel_MEM    ;

      Reg_PC_WB          <=   PC_MEM        ;
      Reg_dataout_WB     <=   dataout_MEM  	;
      Reg_ALUout_WB      <=   ALUout_MEM   	;
      Reg_DestReg        <=   DR_MEM			     ;
      Reg_Opcode_WB      <=   Opcode_MEM    ;
      Reg_nzp_WB         <=   nzp_MEM    ;
      Reg_ZextSel_WB     <=   ZextSel_MEM;
	 END IF;
  END PROCESS WRITE_REG;
END ARCHITECTURE untitled;
