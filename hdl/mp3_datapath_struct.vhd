-- VHDL Entity ece411.mp3_datapath.symbol
--
-- Created:
--          by - rchoxi2.stdt (gllnx26.ews.illinois.edu)
--          at - 23:05:11 12/02/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp3_datapath IS
   PORT( 
      D_DATAOUT   : IN     LC3b_word;
      D_MRESP_H   : IN     std_logic;
      I_MRESP_H   : IN     std_logic;
      Instrin     : IN     lc3b_word;
      RESET_L     : IN     std_logic;
      clk         : IN     std_logic;
      D_ADDRESS   : OUT    LC3b_word;
      D_DATAIN    : OUT    LC3b_word;
      D_MREAD_L   : OUT    std_logic;
      D_MWRITEH_L : OUT    std_logic;
      D_MWRITEL_L : OUT    std_logic;
      I_MREAD_L   : OUT    std_logic;
      PCout       : OUT    lc3b_word
   );

-- Declarations

END mp3_datapath ;

--
-- VHDL Architecture ece411.mp3_datapath.struct
--
-- Created:
--          by - rchoxi2.stdt (gllnx26.ews.illinois.edu)
--          at - 23:05:12 12/02/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mp3_datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALUMemSel_EX    : std_logic;
   SIGNAL ALUMemSel_ID    : std_logic;
   SIGNAL ALUMemSel_MEM   : std_logic;
   SIGNAL ALUMemSel_WB    : std_logic;
   SIGNAL ALUop_EX        : LC3b_ALUop;
   SIGNAL ALUop_ID        : LC3b_aluop;
   SIGNAL ALUout_EX       : lc3b_word;
   SIGNAL ALUout_MEM      : LC3b_word;
   SIGNAL ALUout_WB       : lc3b_word;
   SIGNAL AdjSel_EX       : std_logic;
   SIGNAL AdjSel_ID       : std_logic;
   SIGNAL AdjSel_MEM      : std_logic;
   SIGNAL BaseSel_EX      : std_logic;
   SIGNAL BaseSel_ID      : std_logic;
   SIGNAL Branch_EX       : std_logic;
   SIGNAL Branch_ID       : std_logic;
   SIGNAL Branch_MEM      : std_logic;
   SIGNAL DR              : lc3b_reg;
   SIGNAL DR_EX           : lc3b_reg;
   SIGNAL DR_ID           : lc3b_reg;
   SIGNAL DR_MEM          : lc3b_reg;
   SIGNAL D_MWRITE_L      : std_logic;
   SIGNAL DestReg         : lc3b_reg;
   SIGNAL FUMux1_sel      : std_logic;
   SIGNAL FUMux2_sel      : std_logic;
   SIGNAL FUTypeWB1       : std_logic;
   SIGNAL FUTypeWB2       : std_logic;
   SIGNAL FUTypeWB_DR     : std_logic;
   SIGNAL ImmSel_EX       : std_logic;
   SIGNAL ImmSel_ID       : std_logic;
   SIGNAL Instrout        : lc3b_word;
   SIGNAL JSRSel_EX       : std_logic;
   SIGNAL JSRSel_ID       : std_logic;
   SIGNAL JSRSel_MEM      : std_logic;
   SIGNAL JSRSel_WB       : std_logic;
   SIGNAL LEAMuxSel_EX    : std_logic;
   SIGNAL LEAMuxSel_ID    : std_logic;
   SIGNAL Opcode_EX       : lc3b_opcode;
   SIGNAL Opcode_ID       : LC3b_opcode;
   SIGNAL Opcode_IF       : lc3b_opcode;
   SIGNAL Opcode_MEM      : lc3b_opcode;
   SIGNAL Opcode_WB       : lc3b_opcode;
   SIGNAL PC_EX           : lc3b_word;
   SIGNAL PC_ID           : lc3b_word;
   SIGNAL PC_IF           : lc3b_word;
   SIGNAL PC_MEM          : lc3b_word;
   SIGNAL PC_WB           : lc3b_word;
   SIGNAL PCout_EX        : lc3b_word;
   SIGNAL Read_EX         : std_logic;
   SIGNAL Read_ID         : std_logic;
   SIGNAL Read_MEM        : std_logic;
   SIGNAL RegNZP          : lc3b_nzp;
   SIGNAL RegWrite        : std_logic;
   SIGNAL RegWrite_EX     : std_logic;
   SIGNAL RegWrite_ID     : std_logic;
   SIGNAL RegWrite_MEM    : std_logic;
   SIGNAL SR1             : lc3b_reg;
   SIGNAL SR1_EX          : lc3b_reg;
   SIGNAL SR1_data_EX     : lc3b_word;
   SIGNAL SR1_data_ID     : LC3b_word;
   SIGNAL SR2             : lc3b_reg;
   SIGNAL SR2_EX          : lc3b_reg;
   SIGNAL SR2_data_EX     : lc3b_word;
   SIGNAL SR2_data_ID     : lc3b_word;
   SIGNAL STIMuxSel       : std_logic;
   SIGNAL STR_data_EX     : lc3b_word;
   SIGNAL STR_data_ID     : lc3b_word;
   SIGNAL STR_data_MEM    : lc3b_word;
   SIGNAL STR_dataout_EX  : lc3b_word;
   SIGNAL STR_dataout_sel : std_logic;
   SIGNAL SetCC_EX        : std_logic;
   SIGNAL SetCC_ID        : std_logic;
   SIGNAL SetCC_MEM       : std_logic;
   SIGNAL SetCC_WB        : std_logic;
   SIGNAL SextSel_EX      : std_logic;
   SIGNAL SextSel_ID      : std_logic;
   SIGNAL WriteData       : LC3b_word;
   SIGNAL Write_EX        : std_logic;
   SIGNAL Write_ID        : std_logic;
   SIGNAL Write_MEM       : std_logic;
   SIGNAL ZextSel_EX      : std_logic;
   SIGNAL ZextSel_ID      : std_logic;
   SIGNAL ZextSel_MEM     : std_logic;
   SIGNAL ZextSel_WB      : std_logic;
   SIGNAL accessState     : std_logic;
   SIGNAL address_EX      : lc3b_word;
   SIGNAL address_MEM     : lc3b_word;
   SIGNAL adj_imm5_EX     : lc3b_word;
   SIGNAL adj_offset11_EX : lc3b_word;
   SIGNAL adj_offset11_ID : LC3b_word;
   SIGNAL adj_offset6_EX  : lc3b_word;
   SIGNAL adj_offset6_ID  : lc3b_word;
   SIGNAL adj_offset9_EX  : lc3b_word;
   SIGNAL adj_offset9_ID  : lc3b_word;
   SIGNAL bit11_ID        : std_logic;
   SIGNAL bit4_ID         : std_logic;
   SIGNAL bit5_ID         : std_logic;
   SIGNAL brSel           : std_logic;
   SIGNAL bubble          : std_logic;
   SIGNAL dataout_MEM     : lc3b_word;
   SIGNAL dataout_WB      : lc3b_word;
   SIGNAL fetch           : std_logic;
   SIGNAL imm5            : lc3b_imm5;
   SIGNAL indirect_EX     : std_logic;
   SIGNAL indirect_ID     : std_logic;
   SIGNAL indirect_MEM    : std_logic;
   SIGNAL isSTI_EX        : std_logic;
   SIGNAL isSTI_ID        : std_logic;
   SIGNAL isSTI_MEM       : std_logic;
   SIGNAL jump_EX         : std_logic;
   SIGNAL jump_ID         : std_logic;
   SIGNAL loadUse         : std_logic;
   SIGNAL load_latch      : std_logic;
   SIGNAL nzp_EX          : lc3b_nzp;
   SIGNAL nzp_ID          : lc3b_nzp;
   SIGNAL nzp_IF          : LC3b_nzp;
   --isBub  : IN     std_logic
   SIGNAL nzp_mem         : lc3b_nzp;
   SIGNAL nzp_wb          : lc3b_nzp;
   SIGNAL offset11        : LC3b_offset11;
   SIGNAL offset6         : lc3b_index6;
   SIGNAL offset9         : lc3b_offset9;
   SIGNAL rw_hit_gate     : std_logic;
   SIGNAL s               : std_logic;
   SIGNAL s1              : std_logic;
   SIGNAL sext_imm5_ID    : lc3b_word;
   SIGNAL sext_offset6_EX : lc3b_word;
   SIGNAL sext_offset6_ID : lc3b_word;
   SIGNAL trap8           : LC3b_trapvect8;
   SIGNAL zext8_EX        : lc3b_word;
   SIGNAL zext8_ID        : LC3b_word;

   -- Implicit buffer signal declarations
   SIGNAL D_MWRITEH_L_internal : std_logic;
   SIGNAL D_MREAD_L_internal   : std_logic;
   SIGNAL D_MWRITEL_L_internal : std_logic;


   -- Component Declarations
   COMPONENT ControlROM
   PORT (
      RESET_L      : IN     std_logic ;
      Clk          : IN     std_logic ;
      Opcode       : IN     LC3b_opcode ;
      Bit4         : IN     std_logic ;
      Bit5         : IN     std_logic ;
      Bit11        : IN     std_logic ;
      AdjSel_ID    : OUT    std_logic ;
      SextSel_ID   : OUT    std_logic ;
      BaseSel_ID   : OUT    std_logic ;
      ImmSel_ID    : OUT    std_logic ;
      ALUop_ID     : OUT    LC3b_aluop ;
      Branch_ID    : OUT    std_logic ;
      Write_ID     : OUT    std_logic ;
      Read_ID      : OUT    std_logic ;
      RegWrite_ID  : OUT    std_logic ;
      ALUMemSel_ID : OUT    std_logic ;
      SetCC_ID     : OUT    std_logic ;
      fetch        : IN     std_logic ;
      LEAMuxSel_ID : OUT    std_logic ;
      indirect_ID  : OUT    std_logic ;
      isSTI_ID     : OUT    std_logic ;
      jump_ID      : OUT    std_logic ;
      JSRSel_ID    : OUT    std_logic ;
      ZextSel_ID   : OUT    std_logic ;
      loadUse      : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT EX_MEM
   PORT (
      ALUMemSel_EX   : IN     std_logic ;
      ALUout_EX      : IN     lc3b_word ;
      Branch_EX      : IN     std_logic ;
      DR_EX          : IN     lc3b_reg ;
      Opcode_EX      : IN     lc3b_opcode ;
      RESET_L        : IN     std_logic ;
      Read_EX        : IN     std_logic ;
      JSRSel_EX      : IN     std_logic ;
      RegWrite_EX    : IN     std_logic ;
      SetCC_EX       : IN     std_logic ;
      Write_EX       : IN     std_logic ;
      PCout_EX       : IN     lc3b_word ;
      address_EX     : IN     lc3b_word ;
      clk            : IN     std_logic ;
      nzp_EX         : IN     lc3b_nzp ;
      ALUMemSel_MEM  : OUT    std_logic ;
      ALUout_MEM     : OUT    LC3b_word ;
      Branch_MEM     : OUT    std_logic ;
      DR_MEM         : OUT    lc3b_reg ;
      Opcode_MEM     : OUT    lc3b_opcode ;
      Read_MEM       : OUT    std_logic ;
      RegWrite_MEM   : OUT    std_logic ;
      STR_data_MEM   : OUT    lc3b_word ;
      SetCC_MEM      : OUT    std_logic ;
      Write_MEM      : OUT    std_logic ;
      address_MEM    : OUT    lc3b_word ;
      nzp_mem        : OUT    lc3b_nzp ;
      STR_dataout_EX : IN     lc3b_word ;
      load_latch     : IN     std_logic ;
      brSel          : IN     std_logic ;
      indirect_EX    : IN     std_logic ;
      isSTI_EX       : IN     std_logic ;
      indirect_MEM   : OUT    std_logic ;
      isSTI_MEM      : OUT    std_logic ;
      PC_MEM         : OUT    lc3b_word ;
      JSRSel_MEM     : OUT    std_logic ;
      AdjSel_EX      : IN     std_logic ;
      AdjSel_MEM     : OUT    std_logic ;
      ZextSel_EX     : IN     std_logic ;
      ZextSel_MEM    : OUT    std_logic ;
      ZextSel_WB     : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT EX_STAGE
   PORT (
      ALUop_EX        : IN     LC3b_ALUop ;
      ALUout_MEM      : IN     LC3b_word ;
      AdjSel_EX       : IN     std_logic ;
      BaseSel_EX      : IN     std_logic ;
      FUMux1_sel      : IN     std_logic ;
      FUMux2_sel      : IN     std_logic ;
      FUTypeWB1       : IN     std_logic ;
      FUTypeWB2       : IN     std_logic ;
      FUTypeWB_DR     : IN     std_logic ;
      ImmSel_EX       : IN     std_logic ;
      JSRSel_EX       : IN     std_logic ;
      LEAMuxSel_EX    : IN     std_logic ;
      PC_EX           : IN     lc3b_word ;
      SR1_data_EX     : IN     lc3b_word ;
      SR2_data_EX     : IN     lc3b_word ;
      STR_data_EX     : IN     lc3b_word ;
      STR_dataout_sel : IN     std_logic ;
      SextSel_EX      : IN     std_logic ;
      WriteData       : IN     LC3b_word ;
      ZextSel_EX      : IN     std_logic ;
      adj_imm5_EX     : IN     lc3b_word ;
      adj_offset11_EX : IN     lc3b_word ;
      adj_offset6_EX  : IN     lc3b_word ;
      adj_offset9_EX  : IN     lc3b_word ;
      sext_offset6_EX : IN     lc3b_word ;
      zext8_EX        : IN     lc3b_word ;
      ALUout_EX       : OUT    lc3b_word ;
      PCout_EX        : OUT    lc3b_word ;
      STR_dataout_EX  : OUT    lc3b_word ;
      address_EX      : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ForwardingUnitNew
   PORT (
      DR_EX           : IN     lc3b_reg ;
      DR_MEM          : IN     lc3b_reg ;
      DestReg         : IN     lc3b_reg ;
      ImmSel_EX       : IN     std_logic ;
      RegWrite        : IN     std_logic ;
      RegWrite_MEM    : IN     std_logic ;
      SR1_EX          : IN     lc3b_reg ;
      SR2_EX          : IN     lc3b_reg ;
      Write_EX        : IN     std_logic ;
      FUMux1_sel      : OUT    std_logic ;
      FUMux2_sel      : OUT    std_logic ;
      FUTypeWB1       : OUT    std_logic ;
      FUTypeWB2       : OUT    std_logic ;
      FUTypeWB_DR     : OUT    std_logic ;
      STR_dataout_sel : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ID_EX
   PORT (
      ALUMemSel_ID    : IN     std_logic ;
      ALUop_ID        : IN     LC3b_aluop ;
      AdjSel_ID       : IN     std_logic ;
      BaseSel_ID      : IN     std_logic ;
      JSRSel_ID       : IN     std_logic ;
      Branch_ID       : IN     std_logic ;
      ImmSel_ID       : IN     std_logic ;
      PC_ID           : IN     lc3b_word ;
      RESET_L         : IN     std_logic ;
      Read_ID         : IN     std_logic ;
      RegWrite_ID     : IN     std_logic ;
      SR1_data_ID     : IN     LC3b_word ;
      SR2_data_ID     : IN     lc3b_word ;
      STR_data_ID     : IN     lc3b_word ;
      SetCC_ID        : IN     std_logic ;
      SextSel_ID      : IN     std_logic ;
      Write_ID        : IN     std_logic ;
      adj_offset6_ID  : IN     lc3b_word ;
      adj_offset9_ID  : IN     lc3b_word ;
      clk             : IN     std_logic ;
      nzp_ID          : IN     lc3b_nzp ;
      sext_imm5_ID    : IN     lc3b_word ;
      sext_offset6_ID : IN     lc3b_word ;
      ALUMemSel_EX    : OUT    std_logic ;
      ALUop_EX        : OUT    LC3b_ALUop ;
      AdjSel_EX       : OUT    std_logic ;
      BaseSel_EX      : OUT    std_logic ;
      Branch_EX       : OUT    std_logic ;
      DR_EX           : OUT    lc3b_reg ;
      ImmSel_EX       : OUT    std_logic ;
      PC_EX           : OUT    lc3b_word ;
      Read_EX         : OUT    std_logic ;
      RegWrite_EX     : OUT    std_logic ;
      SR1_data_EX     : OUT    lc3b_word ;
      SR2_data_EX     : OUT    lc3b_word ;
      STR_data_EX     : OUT    lc3b_word ;
      SetCC_EX        : OUT    std_logic ;
      SextSel_EX      : OUT    std_logic ;
      Write_EX        : OUT    std_logic ;
      adj_imm5_EX     : OUT    lc3b_word ;
      adj_offset6_EX  : OUT    lc3b_word ;
      adj_offset9_EX  : OUT    lc3b_word ;
      adj_offset11_EX : OUT    lc3b_word ;
      nzp_EX          : OUT    lc3b_nzp ;
      sext_offset6_EX : OUT    lc3b_word ;
      Opcode_EX       : OUT    lc3b_opcode ;
      Opcode_ID       : IN     LC3b_opcode ;
      SR1             : IN     lc3b_reg ;
      SR2             : IN     lc3b_reg ;
      SR1_EX          : OUT    lc3b_reg ;
      SR2_EX          : OUT    lc3b_reg ;
      load_latch      : IN     std_logic ;
      LEAMuxSel_ID    : IN     std_logic ;
      LEAMuxSel_EX    : OUT    std_logic ;
      brSel           : IN     std_logic ;
      indirect_ID     : IN     std_logic ;
      isSTI_ID        : IN     std_logic ;
      indirect_EX     : OUT    std_logic ;
      isSTI_EX        : OUT    std_logic ;
      adj_offset11_ID : IN     LC3b_word ;
      JSRSel_EX       : OUT    std_logic ;
      DR_ID           : IN     lc3b_reg ;
      jump_ID         : IN     std_logic ;
      jump_EX         : OUT    std_logic ;
      zext8_ID        : IN     LC3b_word ;
      zext8_EX        : OUT    lc3b_word ;
      ZextSel_EX      : OUT    std_logic ;
      ZextSel_ID      : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT ID_STAGE
   PORT (
      DR              : IN     lc3b_reg ;
      DestReg         : IN     lc3b_reg ;
      JSRSel_ID       : IN     std_logic ;
      RESET_L         : IN     std_logic ;
      RegWrite        : IN     std_logic ;
      SR1             : IN     lc3b_reg ;
      SR2             : IN     lc3b_reg ;
      WriteData       : IN     LC3b_word ;
      ZextSel_ID      : IN     std_logic ;
      imm5            : IN     lc3b_imm5 ;
      offset11        : IN     LC3b_offset11 ;
      offset6         : IN     lc3b_index6 ;
      offset9         : IN     lc3b_offset9 ;
      trap8           : IN     LC3b_trapvect8 ;
      DR_ID           : OUT    lc3b_reg ;
      SR1_data_ID     : OUT    LC3b_word ;
      SR2_data_ID     : OUT    lc3b_word ;
      STR_data_ID     : OUT    lc3b_word ;
      adj_offset11_ID : OUT    LC3b_word ;
      adj_offset6_ID  : OUT    lc3b_word ;
      adj_offset9_ID  : OUT    lc3b_word ;
      sext_imm5_ID    : OUT    lc3b_word ;
      sext_offset6_ID : OUT    lc3b_word ;
      zext8_ID        : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT IF_ID
   PORT (
      Instrout   : IN     lc3b_word ;
      PC_IF      : IN     lc3b_word ;
      clk        : IN     std_logic ;
      DR         : OUT    lc3b_reg ;
      PC_ID      : OUT    lc3b_word ;
      RESET_L    : IN     std_logic ;
      SR1        : OUT    lc3b_reg ;
      SR2        : OUT    lc3b_reg ;
      bit4_ID    : OUT    std_logic ;
      bit5_ID    : OUT    std_logic ;
      bit11_ID   : OUT    std_logic ;
      imm5       : OUT    lc3b_imm5 ;
      nzp_ID     : OUT    lc3b_nzp ;
      offset6    : OUT    lc3b_index6 ;
      offset9    : OUT    lc3b_offset9 ;
      Opcode_ID  : OUT    LC3b_opcode ;
      brSel      : IN     std_logic ;
      offset11   : OUT    LC3b_offset11 ;
      fetch      : IN     std_logic ;
      jump_EX    : IN     std_logic ;
      trap8      : OUT    LC3b_trapvect8 ;
      ZextSel_WB : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT IF_STAGE
   PORT (
      ALUout_EX   : IN     lc3b_word ;
      Instrin     : IN     lc3b_word ;
      RESET_L     : IN     std_logic ;
      ZextSel_WB  : IN     std_logic ;
      address_MEM : IN     lc3b_word ;
      brSel       : IN     std_logic ;
      clk         : IN     std_logic ;
      dataout_WB  : IN     lc3b_word ;
      fetch       : IN     std_logic ;
      jump_EX     : IN     std_logic ;
      Instrout    : OUT    lc3b_word ;
      Opcode_IF   : OUT    lc3b_opcode ;
      PC_IF       : OUT    lc3b_word ;
      PCout       : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MEM_STAGE
   PORT (
      AdjSel_MEM   : IN     std_logic ;
      Branch_MEM   : IN     std_logic ;
      D_DATAOUT    : IN     LC3b_word ;
      D_MRESP_H    : IN     std_logic ;
      RESET_L      : IN     std_logic ;
      Read_MEM     : IN     std_logic ;
      RegNZP       : IN     lc3b_nzp ;
      STIMuxSel    : IN     std_logic ;
      STR_data_MEM : IN     lc3b_word ;
      Write_MEM    : IN     std_logic ;
      accessState  : IN     std_logic ;
      address_MEM  : IN     lc3b_word ;
      clk          : IN     std_logic ;
      nzp_mem      : IN     lc3b_nzp ;
      rw_hit_gate  : IN     std_logic ;
      D_ADDRESS    : OUT    LC3b_word ;
      D_DATAIN     : OUT    LC3b_word ;
      D_MREAD_L    : OUT    std_logic ;
      D_MWRITEH_L  : OUT    std_logic ;
      D_MWRITEL_L  : OUT    std_logic ;
      brSel        : OUT    std_logic ;
      dataout_MEM  : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MEM_WB
   PORT (
      ALUMemSel_MEM : IN     std_logic ;
      ALUout_MEM    : IN     LC3b_word ;
      DR_MEM        : IN     lc3b_reg ;
      Opcode_MEM    : IN     lc3b_opcode ;
      RESET_L       : IN     std_logic ;
      RegWrite_MEM  : IN     std_logic ;
      SetCC_MEM     : IN     std_logic ;
      JSRSel_MEM    : IN     std_logic ;
      clk           : IN     std_logic ;
      PC_MEM        : IN     lc3b_word ;
      dataout_MEM   : IN     lc3b_word ;
      load_latch    : IN     std_logic ;
      ALUMemSel_WB  : OUT    std_logic ;
      ALUout_WB     : OUT    lc3b_word ;
      DestReg       : OUT    lc3b_reg ;
      Opcode_WB     : OUT    lc3b_opcode ;
      RegWrite      : OUT    std_logic ;
      SetCC_WB      : OUT    std_logic ;
      PC_WB         : OUT    lc3b_word ;
      dataout_WB    : OUT    lc3b_word ;
      JSRSel_WB     : OUT    std_logic ;
      nzp_mem       : IN     lc3b_nzp ;
      nzp_wb        : OUT    lc3b_nzp ;
      ZextSel_MEM   : IN     std_logic ;
      ZextSel_WB    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Opcoder
   PORT (
      Opcode : IN     LC3b_opcode ;
      NZP    : IN     LC3b_nzp 
      --isBub  : IN     std_logic
   );
   END COMPONENT;
   COMPONENT RWHitGate
   PORT (
      clk         : IN     std_logic ;
      rw_hit_gate : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT StallUnit
   PORT (
      DR_EX        : IN     lc3b_reg ;
      D_MREAD_L    : IN     std_logic ;
      D_MRESP_H    : IN     std_logic ;
      D_MWRITE_L   : IN     std_logic ;
      I_MRESP_H    : IN     std_logic ;
      RESET_L      : IN     std_logic ;
      Read_EX      : IN     std_logic ;
      SR1          : IN     lc3b_reg ;
      SR2          : IN     lc3b_reg ;
      ZextSel_WB   : IN     std_logic ;
      brSel        : IN     std_logic ;
      clk          : IN     std_logic ;
      indirect_MEM : IN     std_logic ;
      isSTI_MEM    : IN     std_logic ;
      STIMuxSel    : OUT    std_logic ;
      accessState  : OUT    std_logic ;
      fetch        : OUT    std_logic ;
      loadUse      : OUT    std_logic ;
      load_latch   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT WB_STAGE
   PORT (
      ALUMemSel_WB : IN     std_logic ;
      ALUout_WB    : IN     lc3b_word ;
      JSRSel_WB    : IN     std_logic ;
      PC_WB        : IN     lc3b_word ;
      RESET_L      : IN     std_logic ;
      SetCC_WB     : IN     std_logic ;
      ZextSel_WB   : IN     std_logic ;
      dataout_WB   : IN     lc3b_word ;
      RegNZP       : OUT    lc3b_nzp ;
      WriteData    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT and2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT mynot
   PORT (
      a : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ControlROM USE ENTITY ece411.ControlROM;
   FOR ALL : EX_MEM USE ENTITY ece411.EX_MEM;
   FOR ALL : EX_STAGE USE ENTITY ece411.EX_STAGE;
   FOR ALL : ForwardingUnitNew USE ENTITY ece411.ForwardingUnitNew;
   FOR ALL : ID_EX USE ENTITY ece411.ID_EX;
   FOR ALL : ID_STAGE USE ENTITY ece411.ID_STAGE;
   FOR ALL : IF_ID USE ENTITY ece411.IF_ID;
   FOR ALL : IF_STAGE USE ENTITY ece411.IF_STAGE;
   FOR ALL : MEM_STAGE USE ENTITY ece411.MEM_STAGE;
   FOR ALL : MEM_WB USE ENTITY ece411.MEM_WB;
   FOR ALL : Opcoder USE ENTITY ece411.Opcoder;
   FOR ALL : RWHitGate USE ENTITY ece411.RWHitGate;
   FOR ALL : StallUnit USE ENTITY ece411.StallUnit;
   FOR ALL : WB_STAGE USE ENTITY ece411.WB_STAGE;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   I_MREAD_L <= '0';                                     

   -- HDL Embedded Text Block 2 eb2
   nzp_IF <= Instrout(11 DOWNTO 9);                                    


   -- Instance port mappings.
   aControlRom : ControlROM
      PORT MAP (
         RESET_L      => RESET_L,
         Clk          => clk,
         Opcode       => Opcode_ID,
         Bit4         => bit4_ID,
         Bit5         => bit5_ID,
         Bit11        => bit11_ID,
         AdjSel_ID    => AdjSel_ID,
         SextSel_ID   => SextSel_ID,
         BaseSel_ID   => BaseSel_ID,
         ImmSel_ID    => ImmSel_ID,
         ALUop_ID     => ALUop_ID,
         Branch_ID    => Branch_ID,
         Write_ID     => Write_ID,
         Read_ID      => Read_ID,
         RegWrite_ID  => RegWrite_ID,
         ALUMemSel_ID => ALUMemSel_ID,
         SetCC_ID     => SetCC_ID,
         fetch        => bubble,
         LEAMuxSel_ID => LEAMuxSel_ID,
         indirect_ID  => indirect_ID,
         isSTI_ID     => isSTI_ID,
         jump_ID      => jump_ID,
         JSRSel_ID    => JSRSel_ID,
         ZextSel_ID   => ZextSel_ID,
         loadUse      => loadUse
      );
   aEX_MEM : EX_MEM
      PORT MAP (
         ALUMemSel_EX   => ALUMemSel_EX,
         ALUout_EX      => ALUout_EX,
         Branch_EX      => Branch_EX,
         DR_EX          => DR_EX,
         Opcode_EX      => Opcode_EX,
         RESET_L        => RESET_L,
         Read_EX        => Read_EX,
         JSRSel_EX      => JSRSel_EX,
         RegWrite_EX    => RegWrite_EX,
         SetCC_EX       => SetCC_EX,
         Write_EX       => Write_EX,
         PCout_EX       => PCout_EX,
         address_EX     => address_EX,
         clk            => clk,
         nzp_EX         => nzp_EX,
         ALUMemSel_MEM  => ALUMemSel_MEM,
         ALUout_MEM     => ALUout_MEM,
         Branch_MEM     => Branch_MEM,
         DR_MEM         => DR_MEM,
         Opcode_MEM     => Opcode_MEM,
         Read_MEM       => Read_MEM,
         RegWrite_MEM   => RegWrite_MEM,
         STR_data_MEM   => STR_data_MEM,
         SetCC_MEM      => SetCC_MEM,
         Write_MEM      => Write_MEM,
         address_MEM    => address_MEM,
         nzp_mem        => nzp_mem,
         STR_dataout_EX => STR_dataout_EX,
         load_latch     => load_latch,
         brSel          => brSel,
         indirect_EX    => indirect_EX,
         isSTI_EX       => isSTI_EX,
         indirect_MEM   => indirect_MEM,
         isSTI_MEM      => isSTI_MEM,
         PC_MEM         => PC_MEM,
         JSRSel_MEM     => JSRSel_MEM,
         AdjSel_EX      => AdjSel_EX,
         AdjSel_MEM     => AdjSel_MEM,
         ZextSel_EX     => ZextSel_EX,
         ZextSel_MEM    => ZextSel_MEM,
         ZextSel_WB     => ZextSel_WB
      );
   aEX_STAGE : EX_STAGE
      PORT MAP (
         ALUop_EX        => ALUop_EX,
         ALUout_MEM      => ALUout_MEM,
         AdjSel_EX       => AdjSel_EX,
         BaseSel_EX      => BaseSel_EX,
         FUMux1_sel      => FUMux1_sel,
         FUMux2_sel      => FUMux2_sel,
         FUTypeWB1       => FUTypeWB1,
         FUTypeWB2       => FUTypeWB2,
         FUTypeWB_DR     => FUTypeWB_DR,
         ImmSel_EX       => ImmSel_EX,
         JSRSel_EX       => JSRSel_EX,
         LEAMuxSel_EX    => LEAMuxSel_EX,
         PC_EX           => PC_EX,
         SR1_data_EX     => SR1_data_EX,
         SR2_data_EX     => SR2_data_EX,
         STR_data_EX     => STR_data_EX,
         STR_dataout_sel => STR_dataout_sel,
         SextSel_EX      => SextSel_EX,
         WriteData       => WriteData,
         ZextSel_EX      => ZextSel_EX,
         adj_imm5_EX     => adj_imm5_EX,
         adj_offset11_EX => adj_offset11_EX,
         adj_offset6_EX  => adj_offset6_EX,
         adj_offset9_EX  => adj_offset9_EX,
         sext_offset6_EX => sext_offset6_EX,
         zext8_EX        => zext8_EX,
         ALUout_EX       => ALUout_EX,
         PCout_EX        => PCout_EX,
         STR_dataout_EX  => STR_dataout_EX,
         address_EX      => address_EX
      );
   U_4 : ForwardingUnitNew
      PORT MAP (
         DR_EX           => DR_EX,
         DR_MEM          => DR_MEM,
         DestReg         => DestReg,
         ImmSel_EX       => ImmSel_EX,
         RegWrite        => RegWrite,
         RegWrite_MEM    => RegWrite_MEM,
         SR1_EX          => SR1_EX,
         SR2_EX          => SR2_EX,
         Write_EX        => Write_EX,
         FUMux1_sel      => FUMux1_sel,
         FUMux2_sel      => FUMux2_sel,
         FUTypeWB1       => FUTypeWB1,
         FUTypeWB2       => FUTypeWB2,
         FUTypeWB_DR     => STR_dataout_sel,
         STR_dataout_sel => FUTypeWB_DR
      );
   aID_EX : ID_EX
      PORT MAP (
         ALUMemSel_ID    => ALUMemSel_ID,
         ALUop_ID        => ALUop_ID,
         AdjSel_ID       => AdjSel_ID,
         BaseSel_ID      => BaseSel_ID,
         JSRSel_ID       => JSRSel_ID,
         Branch_ID       => Branch_ID,
         ImmSel_ID       => ImmSel_ID,
         PC_ID           => PC_ID,
         RESET_L         => RESET_L,
         Read_ID         => Read_ID,
         RegWrite_ID     => RegWrite_ID,
         SR1_data_ID     => SR1_data_ID,
         SR2_data_ID     => SR2_data_ID,
         STR_data_ID     => STR_data_ID,
         SetCC_ID        => SetCC_ID,
         SextSel_ID      => SextSel_ID,
         Write_ID        => Write_ID,
         adj_offset6_ID  => adj_offset6_ID,
         adj_offset9_ID  => adj_offset9_ID,
         clk             => clk,
         nzp_ID          => nzp_ID,
         sext_imm5_ID    => sext_imm5_ID,
         sext_offset6_ID => sext_offset6_ID,
         ALUMemSel_EX    => ALUMemSel_EX,
         ALUop_EX        => ALUop_EX,
         AdjSel_EX       => AdjSel_EX,
         BaseSel_EX      => BaseSel_EX,
         Branch_EX       => Branch_EX,
         DR_EX           => DR_EX,
         ImmSel_EX       => ImmSel_EX,
         PC_EX           => PC_EX,
         Read_EX         => Read_EX,
         RegWrite_EX     => RegWrite_EX,
         SR1_data_EX     => SR1_data_EX,
         SR2_data_EX     => SR2_data_EX,
         STR_data_EX     => STR_data_EX,
         SetCC_EX        => SetCC_EX,
         SextSel_EX      => SextSel_EX,
         Write_EX        => Write_EX,
         adj_imm5_EX     => adj_imm5_EX,
         adj_offset6_EX  => adj_offset6_EX,
         adj_offset9_EX  => adj_offset9_EX,
         adj_offset11_EX => adj_offset11_EX,
         nzp_EX          => nzp_EX,
         sext_offset6_EX => sext_offset6_EX,
         Opcode_EX       => Opcode_EX,
         Opcode_ID       => Opcode_ID,
         SR1             => SR1,
         SR2             => SR2,
         SR1_EX          => SR1_EX,
         SR2_EX          => SR2_EX,
         load_latch      => load_latch,
         LEAMuxSel_ID    => LEAMuxSel_ID,
         LEAMuxSel_EX    => LEAMuxSel_EX,
         brSel           => brSel,
         indirect_ID     => indirect_ID,
         isSTI_ID        => isSTI_ID,
         indirect_EX     => indirect_EX,
         isSTI_EX        => isSTI_EX,
         adj_offset11_ID => adj_offset11_ID,
         JSRSel_EX       => JSRSel_EX,
         DR_ID           => DR_ID,
         jump_ID         => jump_ID,
         jump_EX         => jump_EX,
         zext8_ID        => zext8_ID,
         zext8_EX        => zext8_EX,
         ZextSel_EX      => ZextSel_EX,
         ZextSel_ID      => ZextSel_ID
      );
   aID_STAGE : ID_STAGE
      PORT MAP (
         DR              => DR,
         DestReg         => DestReg,
         JSRSel_ID       => JSRSel_ID,
         RESET_L         => RESET_L,
         RegWrite        => RegWrite,
         SR1             => SR1,
         SR2             => SR2,
         WriteData       => WriteData,
         ZextSel_ID      => ZextSel_ID,
         imm5            => imm5,
         offset11        => offset11,
         offset6         => offset6,
         offset9         => offset9,
         trap8           => trap8,
         DR_ID           => DR_ID,
         SR1_data_ID     => SR1_data_ID,
         SR2_data_ID     => SR2_data_ID,
         STR_data_ID     => STR_data_ID,
         adj_offset11_ID => adj_offset11_ID,
         adj_offset6_ID  => adj_offset6_ID,
         adj_offset9_ID  => adj_offset9_ID,
         sext_imm5_ID    => sext_imm5_ID,
         sext_offset6_ID => sext_offset6_ID,
         zext8_ID        => zext8_ID
      );
   aIF_ID : IF_ID
      PORT MAP (
         Instrout   => Instrout,
         PC_IF      => PC_IF,
         clk        => clk,
         DR         => DR,
         PC_ID      => PC_ID,
         RESET_L    => RESET_L,
         SR1        => SR1,
         SR2        => SR2,
         bit4_ID    => bit4_ID,
         bit5_ID    => bit5_ID,
         bit11_ID   => bit11_ID,
         imm5       => imm5,
         nzp_ID     => nzp_ID,
         offset6    => offset6,
         offset9    => offset9,
         Opcode_ID  => Opcode_ID,
         brSel      => brSel,
         offset11   => offset11,
         fetch      => fetch,
         jump_EX    => jump_EX,
         trap8      => trap8,
         ZextSel_WB => ZextSel_WB
      );
   aIF_STAGE : IF_STAGE
      PORT MAP (
         ALUout_EX   => ALUout_EX,
         Instrin     => Instrin,
         RESET_L     => RESET_L,
         ZextSel_WB  => ZextSel_WB,
         address_MEM => address_MEM,
         brSel       => brSel,
         clk         => clk,
         dataout_WB  => dataout_WB,
         fetch       => fetch,
         jump_EX     => jump_EX,
         Instrout    => Instrout,
         Opcode_IF   => Opcode_IF,
         PC_IF       => PC_IF,
         PCout       => PCout
      );
   aMEM_STAGE : MEM_STAGE
      PORT MAP (
         AdjSel_MEM   => AdjSel_MEM,
         Branch_MEM   => Branch_MEM,
         D_DATAOUT    => D_DATAOUT,
         D_MRESP_H    => D_MRESP_H,
         RESET_L      => RESET_L,
         Read_MEM     => Read_MEM,
         RegNZP       => RegNZP,
         STIMuxSel    => STIMuxSel,
         STR_data_MEM => STR_data_MEM,
         Write_MEM    => Write_MEM,
         accessState  => accessState,
         address_MEM  => address_MEM,
         clk          => clk,
         nzp_mem      => nzp_mem,
         rw_hit_gate  => rw_hit_gate,
         D_ADDRESS    => D_ADDRESS,
         D_DATAIN     => D_DATAIN,
         D_MREAD_L    => D_MREAD_L_internal,
         D_MWRITEH_L  => D_MWRITEH_L_internal,
         D_MWRITEL_L  => D_MWRITEL_L_internal,
         brSel        => brSel,
         dataout_MEM  => dataout_MEM
      );
   aMEM_WB : MEM_WB
      PORT MAP (
         ALUMemSel_MEM => ALUMemSel_MEM,
         ALUout_MEM    => ALUout_MEM,
         DR_MEM        => DR_MEM,
         Opcode_MEM    => Opcode_MEM,
         RESET_L       => RESET_L,
         RegWrite_MEM  => RegWrite_MEM,
         SetCC_MEM     => SetCC_MEM,
         JSRSel_MEM    => JSRSel_MEM,
         clk           => clk,
         PC_MEM        => PC_MEM,
         dataout_MEM   => dataout_MEM,
         load_latch    => load_latch,
         ALUMemSel_WB  => ALUMemSel_WB,
         ALUout_WB     => ALUout_WB,
         DestReg       => DestReg,
         Opcode_WB     => Opcode_WB,
         RegWrite      => RegWrite,
         SetCC_WB      => SetCC_WB,
         PC_WB         => PC_WB,
         dataout_WB    => dataout_WB,
         JSRSel_WB     => JSRSel_WB,
         nzp_mem       => nzp_mem,
         nzp_wb        => nzp_wb,
         ZextSel_MEM   => ZextSel_MEM,
         ZextSel_WB    => ZextSel_WB
      );
   Op_EX : Opcoder
      PORT MAP (
         Opcode => Opcode_EX,
         NZP    => nzp_EX
      );
   Op_ID : Opcoder
      PORT MAP (
         Opcode => Opcode_ID,
         NZP    => nzp_ID
      );
   Op_IF : Opcoder
      PORT MAP (
         Opcode => Opcode_IF,
         NZP    => nzp_IF
      );
   Op_MEM : Opcoder
      PORT MAP (
         Opcode => Opcode_MEM,
         NZP    => nzp_mem
      );
   Op_WB : Opcoder
      PORT MAP (
         Opcode => Opcode_WB,
         NZP    => nzp_wb
      );
   aRWHitGate : RWHitGate
      PORT MAP (
         clk         => clk,
         rw_hit_gate => rw_hit_gate
      );
   aStallUnit : StallUnit
      PORT MAP (
         DR_EX        => DR_EX,
         D_MREAD_L    => D_MREAD_L_internal,
         D_MRESP_H    => D_MRESP_H,
         D_MWRITE_L   => D_MWRITE_L,
         I_MRESP_H    => I_MRESP_H,
         RESET_L      => RESET_L,
         Read_EX      => Read_EX,
         SR1          => SR1,
         SR2          => SR2,
         ZextSel_WB   => ZextSel_WB,
         brSel        => brSel,
         clk          => clk,
         indirect_MEM => indirect_MEM,
         isSTI_MEM    => isSTI_MEM,
         STIMuxSel    => STIMuxSel,
         accessState  => accessState,
         fetch        => fetch,
         loadUse      => loadUse,
         load_latch   => load_latch
      );
   aWE_STAGE : WB_STAGE
      PORT MAP (
         ALUMemSel_WB => ALUMemSel_WB,
         ALUout_WB    => ALUout_WB,
         JSRSel_WB    => JSRSel_WB,
         PC_WB        => PC_WB,
         RESET_L      => RESET_L,
         SetCC_WB     => SetCC_WB,
         ZextSel_WB   => ZextSel_WB,
         dataout_WB   => dataout_WB,
         RegNZP       => RegNZP,
         WriteData    => WriteData
      );
   U_0 : and2
      PORT MAP (
         a => s,
         b => s1,
         s => bubble
      );
   U_1 : and2
      PORT MAP (
         a => D_MWRITEH_L_internal,
         b => D_MWRITEL_L_internal,
         s => D_MWRITE_L
      );
   U_2 : mynot
      PORT MAP (
         a => jump_EX,
         s => s
      );
   U_3 : mynot
      PORT MAP (
         a => ZextSel_WB,
         s => s1
      );

   -- Implicit buffered output assignments
   D_MWRITEH_L <= D_MWRITEH_L_internal;
   D_MREAD_L   <= D_MREAD_L_internal;
   D_MWRITEL_L <= D_MWRITEL_L_internal;

END struct;
