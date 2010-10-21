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
      ALUout_MEM    : IN     lc3b_word;
      DR_MEM        : IN     lc3b_reg;
      RESET_L       : IN     std_logic;
      RegWrite_MEM  : IN     std_logic;
      SetCC_MEM     : IN     std_logic;
      clk           : IN     std_logic;
      dataout_MEM   : IN     lc3b_word;
      ALUMemSel_WB  : OUT    std_logic;
      ALUout_WB     : OUT    lc3b_word;
      DestReg       : OUT    lc3b_reg;
      RegWrite      : OUT    std_logic;
      SetCC_WB      : OUT    std_logic;
      dataout_WB    : OUT    lc3b_word
   );

-- Declarations

END MEM_WB ;

--
ARCHITECTURE untitled OF MEM_WB IS

      SIGNAL Reg_RegWrite         :  std_logic;
      SIGNAL Reg_ALUMemSel_WB     :  std_logic;
      SIGNAL Reg_SetCC_WB         :  std_logic;
      
      SIGNAL Reg_dataout_WB       :  lc3b_word;
      SIGNAL Reg_ALUout_WB        :  lc3b_word;
      SIGNAL Reg_DestReg          :  lc3b_reg;
      
BEGIN
  
  READ_REG : PROCESS(
	Reg_RegWrite      ,
	Reg_ALUMemSel_WB  ,
	Reg_SetCC_WB      ,
	Reg_dataout_WB    ,
	Reg_ALUout_WB     ,
	Reg_DestReg       
  )
  BEGIN
	  RegWrite     <=  Reg_RegWrite      	after delay_reg;
    ALUMemSel_WB <=  Reg_ALUMemSel_WB     after delay_reg;
    SetCC_WB     <=  Reg_SetCC_WB         after delay_reg;
                                                             
    dataout_WB   <=  Reg_dataout_WB       after delay_reg;
    ALUout_WB    <=  Reg_ALUout_WB        after delay_reg;
    DestReg      <=  Reg_DestReg          after delay_reg;
  END PROCESS READ_REG;

-- does CLK belong in the sensitivity list?
  WRITE_REG : PROCESS(
	  CLK            ,
	  RESET_L        
  )
  
  BEGIN
    IF (RESET_L = '0') THEN
		  RegWrite   			   <=   '0';
      ALUMemSel_WB         <=   '0';
      SetCC_WB             <=   '0';
                                                    
      dataout_WB           <=   "0000000000000000";
      ALUout_WB            <=   "0000000000000000";
      DestReg              <=   "000";
    END IF;
    
    IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
		  Reg_RegWrite   	   <=   RegWrite_MEM  ;
      Reg_ALUMemSel_WB   <=   ALUMemSel_MEM	;
      Reg_SetCC_WB       <=   SetCC_MEM    	;
                                      
      Reg_dataout_WB     <=   dataout_MEM  	;
      Reg_ALUout_WB      <=   ALUout_MEM   	;
      Reg_DestReg        <=   DR_MEM			     ;
	 END IF;
  END PROCESS WRITE_REG;
END ARCHITECTURE untitled;
