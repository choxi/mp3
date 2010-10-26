--
-- VHDL Architecture ece411.EX_MEM.untitled
--
-- Created:
--          by - cjpark3.ece411_G2 (eelnx29.ews.illinois.edu)
--          at - 21:14:02 10/19/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EX_MEM IS
   PORT( 
      ALUMemSel_EX  : IN     std_logic;
      ALUout_EX     : IN     lc3b_word;
      Branch_EX     : IN     std_logic;
      DR_EX         : IN     lc3b_reg;
      RESET_L       : IN     std_logic;
      Read_EX       : IN     std_logic;
      RegWrite_EX   : IN     std_logic;
      STR_data_EX   : IN     lc3b_word;
      SetCC_EX      : IN     std_logic;
      Write_EX      : IN     std_logic;
      address_EX    : IN     lc3b_word;
      clk           : IN     std_logic;
      nzp_EX        : IN     lc3b_nzp;
      ALUMemSel_MEM : OUT    std_logic;
      ALUout_MEM    : OUT    lc3b_word;
      Branch_MEM    : OUT    std_logic;
      DR_MEM        : OUT    lc3b_reg;
      Read_MEM      : OUT    std_logic;
      RegWrite_MEM  : OUT    std_logic;
      STR_data_MEM  : OUT    lc3b_word;
      SetCC_MEM     : OUT    std_logic;
      Write_MEM     : OUT    std_logic;
      address_MEM   : OUT    lc3b_word;
      nzp_MEM       : OUT    lc3b_nzp
   );

-- Declarations

END EX_MEM ;

--
ARCHITECTURE untitled OF EX_MEM IS

      SIGNAL Reg_RegWrite_MEM     :  std_logic;
      SIGNAL Reg_ALUMemSel_MEM    :  std_logic;
      SIGNAL Reg_SetCC_MEM        :  std_logic;
      
      SIGNAL Reg_Branch_MEM       :  std_logic;
      SIGNAL Reg_Write_MEM        :  std_logic;
      SIGNAL Reg_Read_MEM         :  std_logic;
      
      SIGNAL Reg_nzp_MEM          :  lc3b_nzp;
      SIGNAL Reg_address_MEM      :  lc3b_word;
      SIGNAL Reg_ALUout_MEM       :  lc3b_word;
      
      SIGNAL Reg_STR_data_MEM     :  lc3b_word;
      SIGNAL Reg_DR_MEM           :  lc3b_reg;
      
BEGIN
  
  READ_REG : PROCESS (
	Reg_RegWrite_MEM   ,
	Reg_ALUMemSel_MEM  ,
	Reg_SetCC_MEM      ,
	Reg_Branch_MEM     ,
	Reg_Write_MEM      ,
	Reg_Read_MEM       ,
	Reg_nzp_MEM        ,
	Reg_address_MEM    ,
	Reg_ALUout_MEM     ,
	Reg_STR_data_MEM   ,
	Reg_DR_MEM         
  )
  	
  BEGIN
    RegWrite_MEM     <=  Reg_RegWrite_MEM     after delay_reg;
    ALUMemSel_MEM    <=  Reg_ALUMemSel_MEM    after delay_reg;
    SetCC_MEM        <=  Reg_SetCC_MEM        after delay_reg;
    
    Branch_MEM       <=  Reg_Branch_MEM       after delay_reg;
    Write_MEM        <=  Reg_Write_MEM        after delay_reg;
    Read_MEM         <=  Reg_Read_MEM         after delay_reg;
    
    nzp_MEM          <=  Reg_nzp_MEM          after delay_reg;
    address_MEM      <=  Reg_address_MEM      after delay_reg;
    ALUout_MEM       <=  Reg_ALUout_MEM       after delay_reg;
    
    STR_data_MEM     <=  Reg_STR_data_MEM     after delay_reg;
    DR_MEM           <=  Reg_DR_MEM           after delay_reg;
  END PROCESS READ_REG;

-- does CLK belong in the sensitivity list?
  WRITE_REG : PROCESS(
	  CLK            ,
 	  RESET_L        
  )
  
  BEGIN
    IF (RESET_L = '0') THEN
      Reg_RegWrite_MEM     <=   '0';
      Reg_ALUMemSel_MEM    <=   '0';
      Reg_SetCC_MEM        <=   '0';

      Reg_Branch_MEM       <=   '0';
      Reg_Write_MEM        <=   '0';
      Reg_Read_MEM         <=   '0';
      
      Reg_nzp_MEM          <=   "000";
      Reg_address_MEM      <=   "0000000000000000";
      Reg_ALUout_MEM       <=   "0000000000000000";
      
      Reg_STR_data_MEM     <=   "0000000000000000";
      Reg_DR_MEM           <=   "000";
    END IF;
    
    IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN

		  Reg_RegWrite_MEM 		  <=	  RegWrite_EX  ;
      Reg_ALUMemSel_MEM    <=   ALUMemSel_EX ;
      Reg_SetCC_MEM        <=   SetCC_EX     ;
                                                   
      Reg_Branch_MEM       <=   Branch_EX    ;
      Reg_Write_MEM        <=   Write_EX     ;
      Reg_Read_MEM         <=   Read_EX      ;
                                                   
      Reg_nzp_MEM          <=   nzp_EX       ;
      Reg_address_MEM      <=   address_EX       ;
      Reg_ALUout_MEM       <=   ALUout_EX        ;
                                                   
      Reg_STR_data_MEM     <=   STR_data_EX  ;
      Reg_DR_MEM           <=   DR_EX        ;
	 END IF;
  END PROCESS WRITE_REG;
END ARCHITECTURE untitled;
