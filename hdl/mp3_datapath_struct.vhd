-- VHDL Entity ece411.mp3_datapath.symbol
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 00:57:06 11/09/10
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
      D_DATAOUT  : IN     LC3b_word;
      D_MRESP_H  : IN     std_logic;
      I_MRESP_H  : IN     std_logic;
      Instrin    : IN     lc3b_word;
      RESET_L    : IN     std_logic;
      clk        : IN     std_logic;
      D_ADDRESS  : OUT    LC3b_word;
      D_DATAIN   : OUT    LC3b_word;
      D_MREAD_L  : OUT    std_logic;
      D_MWRITE_L : OUT    std_logic;
      I_MREAD_L  : OUT    std_logic;
      PCout      : OUT    lc3b_word
   );

-- Declarations

END mp3_datapath ;

--
-- VHDL Architecture ece411.mp3_datapath.struct
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 00:57:06 11/09/10
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
   SIGNAL BaseSel_EX      : std_logic;
   SIGNAL BaseSel_ID      : std_logic;
   SIGNAL Branch_EX       : std_logic;
   SIGNAL Branch_ID       : std_logic;
   SIGNAL Branch_MEM      : std_logic;
   SIGNAL DR              : lc3b_reg;
   SIGNAL DR_EX           : lc3b_reg;
   SIGNAL DR_MEM          : lc3b_reg;
   SIGNAL DestReg         : lc3b_reg;
   SIGNAL FUMux1_sel      : std_logic;
   SIGNAL FUMux2_sel      : std_logic;
   SIGNAL FUTypeWB1       : std_logic;
   SIGNAL FUTypeWB2       : std_logic;
   SIGNAL ImmSel_EX       : std_logic;
   SIGNAL ImmSel_ID       : std_logic;
   SIGNAL Instrout        : lc3b_word;
   SIGNAL Opcode_EX       : lc3b_opcode;
   SIGNAL Opcode_ID       : LC3b_opcode;
   SIGNAL Opcode_IF       : lc3b_opcode;
   SIGNAL Opcode_MEM      : lc3b_opcode;
   SIGNAL Opcode_WB       : lc3b_opcode;
   SIGNAL PC_EX           : lc3b_word;
   SIGNAL PC_ID           : lc3b_word;
   SIGNAL PC_IF           : lc3b_word;
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
   SIGNAL SR1_data_ID     : lc3b_word;
   SIGNAL SR2             : lc3b_reg;
   SIGNAL SR2_EX          : lc3b_reg;
   SIGNAL SR2_data_EX     : lc3b_word;
   SIGNAL SR2_data_ID     : lc3b_word;
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
   SIGNAL WriteData       : lc3b_word;
   SIGNAL Write_EX        : std_logic;
   SIGNAL Write_ID        : std_logic;
   SIGNAL Write_MEM       : std_logic;
   SIGNAL address_EX      : lc3b_word;
   SIGNAL address_MEM     : lc3b_word;
   SIGNAL adj_imm5_EX     : lc3b_word;
   SIGNAL adj_offset6_EX  : lc3b_word;
   SIGNAL adj_offset6_ID  : lc3b_word;
   SIGNAL adj_offset9_EX  : lc3b_word;
   SIGNAL adj_offset9_ID  : lc3b_word;
   SIGNAL bit4_ID         : std_logic;
   SIGNAL bit5_ID         : std_logic;
   SIGNAL brSel           : std_logic;
   SIGNAL dataout_MEM     : lc3b_word;
   SIGNAL dataout_WB      : lc3b_word;
   SIGNAL imm5            : lc3b_imm5;
   SIGNAL mem_stall       : std_logic;
   SIGNAL nzp_EX          : lc3b_nzp;
   SIGNAL nzp_ID          : lc3b_nzp;
   SIGNAL nzp_MEM         : lc3b_nzp;
   SIGNAL offset6         : lc3b_index6;
   SIGNAL offset9         : lc3b_offset9;
   SIGNAL rw_hit_gate     : std_logic;
   SIGNAL sext_imm5_ID    : lc3b_word;
   SIGNAL sext_offset6_EX : lc3b_word;
   SIGNAL sext_offset6_ID : lc3b_word;

   -- Implicit buffer signal declarations
   SIGNAL D_MWRITE_L_internal : std_logic;
   SIGNAL D_MREAD_L_internal  : std_logic;


   -- Component Declarations
   COMPONENT ControlROM
   PORT (
      RESET_L      : IN     std_logic ;
      Clk          : IN     std_logic ;
      Opcode       : IN     LC3b_opcode ;
      Bit4         : IN     std_logic ;
      Bit5         : IN     std_logic ;
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
      SetCC_ID     : OUT    std_logic 
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
      RegWrite_EX    : IN     std_logic ;
      SetCC_EX       : IN     std_logic ;
      Write_EX       : IN     std_logic ;
      address_EX     : IN     lc3b_word ;
      clk            : IN     std_logic ;
      mem_stall      : IN     std_logic ;
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
      nzp_MEM        : OUT    lc3b_nzp ;
      STR_dataout_EX : IN     lc3b_word 
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
      ImmSel_EX       : IN     std_logic ;
      PC_EX           : IN     lc3b_word ;
      SR1_data_EX     : IN     lc3b_word ;
      SR2_data_EX     : IN     lc3b_word ;
      STR_data_EX     : IN     lc3b_word ;
      STR_dataout_sel : IN     std_logic ;
      SextSel_EX      : IN     std_logic ;
      WriteData       : IN     lc3b_word ;
      adj_imm5_EX     : IN     lc3b_word ;
      adj_offset6_EX  : IN     lc3b_word ;
      adj_offset9_EX  : IN     lc3b_word ;
      sext_offset6_EX : IN     lc3b_word ;
      ALUout_EX       : OUT    lc3b_word ;
      STR_dataout_EX  : OUT    lc3b_word ;
      address_EX      : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ForwardingUnit
   PORT (
      DR_MEM          : IN     lc3b_reg ;
      RegWrite_MEM    : IN     std_logic ;
      SR1_EX          : IN     lc3b_reg ;
      SR2_EX          : IN     lc3b_reg ;
      FUMux1_sel      : OUT    std_logic ;
      FUMux2_sel      : OUT    std_logic ;
      FUTypeWB1       : OUT    std_logic ;
      FUTypeWB2       : OUT    std_logic ;
      DestReg         : IN     lc3b_reg ;
      RegWrite        : IN     std_logic ;
      DR_EX           : IN     lc3b_reg ;
      Write_EX        : IN     std_logic ;
      STR_dataout_sel : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ID_EX
   PORT (
      ALUMemSel_ID    : IN     std_logic ;
      ALUop_ID        : IN     LC3b_aluop ;
      AdjSel_ID       : IN     std_logic ;
      BaseSel_ID      : IN     std_logic ;
      Branch_ID       : IN     std_logic ;
      DR              : IN     lc3b_reg ;
      ImmSel_ID       : IN     std_logic ;
      PC_ID           : IN     lc3b_word ;
      RESET_L         : IN     std_logic ;
      Read_ID         : IN     std_logic ;
      RegWrite_ID     : IN     std_logic ;
      SR1_data_ID     : IN     lc3b_word ;
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
      nzp_EX          : OUT    lc3b_nzp ;
      sext_offset6_EX : OUT    lc3b_word ;
      mem_stall       : IN     std_logic ;
      Opcode_EX       : OUT    lc3b_opcode ;
      Opcode_ID       : IN     LC3b_opcode ;
      SR1             : IN     lc3b_reg ;
      SR2             : IN     lc3b_reg ;
      SR1_EX          : OUT    lc3b_reg ;
      SR2_EX          : OUT    lc3b_reg 
   );
   END COMPONENT;
   COMPONENT ID_STAGE
   PORT (
      DR              : IN     lc3b_reg ;
      DestReg         : IN     lc3b_reg ;
      RESET_L         : IN     std_logic ;
      RegWrite        : IN     std_logic ;
      SR1             : IN     lc3b_reg ;
      SR2             : IN     lc3b_reg ;
      WriteData       : IN     lc3b_word ;
      imm5            : IN     lc3b_imm5 ;
      offset6         : IN     lc3b_index6 ;
      offset9         : IN     lc3b_offset9 ;
      SR1_data_ID     : OUT    lc3b_word ;
      SR2_data_ID     : OUT    lc3b_word ;
      STR_data_ID     : OUT    lc3b_word ;
      adj_offset6_ID  : OUT    lc3b_word ;
      adj_offset9_ID  : OUT    lc3b_word ;
      sext_imm5_ID    : OUT    lc3b_word ;
      sext_offset6_ID : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT IF_ID
   PORT (
      Instrout  : IN     lc3b_word ;
      PC_IF     : IN     lc3b_word ;
      clk       : IN     std_logic ;
      DR        : OUT    lc3b_reg ;
      PC_ID     : OUT    lc3b_word ;
      RESET_L   : IN     std_logic ;
      SR1       : OUT    lc3b_reg ;
      SR2       : OUT    lc3b_reg ;
      bit4_ID   : OUT    std_logic ;
      bit5_ID   : OUT    std_logic ;
      imm5      : OUT    lc3b_imm5 ;
      nzp_ID    : OUT    lc3b_nzp ;
      offset6   : OUT    lc3b_index6 ;
      offset9   : OUT    lc3b_offset9 ;
      mem_stall : IN     std_logic ;
      Opcode_ID : OUT    LC3b_opcode 
   );
   END COMPONENT;
   COMPONENT IF_STAGE
   PORT (
      Instrin     : IN     lc3b_word ;
      RESET_L     : IN     std_logic ;
      address_MEM : IN     lc3b_word ;
      brSel       : IN     std_logic ;
      clk         : IN     std_logic ;
      mem_stall   : IN     std_logic ;
      Instrout    : OUT    lc3b_word ;
      Opcode_IF   : OUT    lc3b_opcode ;
      PC_IF       : OUT    lc3b_word ;
      PCout       : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MEM_STAGE
   PORT (
      Branch_MEM   : IN     std_logic ;
      D_DATAOUT    : IN     LC3b_word ;
      Read_MEM     : IN     std_logic ;
      RegNZP       : IN     lc3b_nzp ;
      STR_data_MEM : IN     lc3b_word ;
      Write_MEM    : IN     std_logic ;
      address_MEM  : IN     lc3b_word ;
      nzp_MEM      : IN     lc3b_nzp ;
      rw_hit_gate  : IN     std_logic ;
      D_ADDRESS    : OUT    LC3b_word ;
      D_DATAIN     : OUT    LC3b_word ;
      D_MREAD_L    : OUT    std_logic ;
      D_MWRITE_L   : OUT    std_logic ;
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
      clk           : IN     std_logic ;
      dataout_MEM   : IN     lc3b_word ;
      mem_stall     : IN     std_logic ;
      ALUMemSel_WB  : OUT    std_logic ;
      ALUout_WB     : OUT    lc3b_word ;
      DestReg       : OUT    lc3b_reg ;
      Opcode_WB     : OUT    lc3b_opcode ;
      RegWrite      : OUT    std_logic ;
      SetCC_WB      : OUT    std_logic ;
      dataout_WB    : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT Opcoder
   PORT (
      Opcode : IN     LC3b_opcode 
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
      D_MREAD_L   : IN     std_logic ;
      D_MRESP_H   : IN     std_logic ;
      D_MWRITE_L  : IN     std_logic ;
      I_MRESP_H   : IN     std_logic ;
      Read_EX     : IN     std_logic ;
      RegWrite_ID : IN     std_logic ;
      mem_stall   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT WB_STAGE
   PORT (
      ALUMemSel_WB : IN     std_logic ;
      ALUout_WB    : IN     lc3b_word ;
      RESET_L      : IN     std_logic ;
      SetCC_WB     : IN     std_logic ;
      dataout_WB   : IN     lc3b_word ;
      RegNZP       : OUT    lc3b_nzp ;
      WriteData    : OUT    lc3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ControlROM USE ENTITY ece411.ControlROM;
   FOR ALL : EX_MEM USE ENTITY ece411.EX_MEM;
   FOR ALL : EX_STAGE USE ENTITY ece411.EX_STAGE;
   FOR ALL : ForwardingUnit USE ENTITY ece411.ForwardingUnit;
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
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   I_MREAD_L <= '0';                                     


   -- Instance port mappings.
   aControlRom : ControlROM
      PORT MAP (
         RESET_L      => RESET_L,
         Clk          => clk,
         Opcode       => Opcode_ID,
         Bit4         => bit4_ID,
         Bit5         => bit5_ID,
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
         SetCC_ID     => SetCC_ID
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
         RegWrite_EX    => RegWrite_EX,
         SetCC_EX       => SetCC_EX,
         Write_EX       => Write_EX,
         address_EX     => address_EX,
         clk            => clk,
         mem_stall      => mem_stall,
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
         nzp_MEM        => nzp_MEM,
         STR_dataout_EX => STR_dataout_EX
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
         ImmSel_EX       => ImmSel_EX,
         PC_EX           => PC_EX,
         SR1_data_EX     => SR1_data_EX,
         SR2_data_EX     => SR2_data_EX,
         STR_data_EX     => STR_data_EX,
         STR_dataout_sel => STR_dataout_sel,
         SextSel_EX      => SextSel_EX,
         WriteData       => WriteData,
         adj_imm5_EX     => adj_imm5_EX,
         adj_offset6_EX  => adj_offset6_EX,
         adj_offset9_EX  => adj_offset9_EX,
         sext_offset6_EX => sext_offset6_EX,
         ALUout_EX       => ALUout_EX,
         STR_dataout_EX  => STR_dataout_EX,
         address_EX      => address_EX
      );
   FU : ForwardingUnit
      PORT MAP (
         DR_MEM          => DR_MEM,
         RegWrite_MEM    => RegWrite_MEM,
         SR1_EX          => SR1_EX,
         SR2_EX          => SR2_EX,
         FUMux1_sel      => FUMux1_sel,
         FUMux2_sel      => FUMux2_sel,
         FUTypeWB1       => FUTypeWB1,
         FUTypeWB2       => FUTypeWB2,
         DestReg         => DestReg,
         RegWrite        => RegWrite,
         DR_EX           => DR_EX,
         Write_EX        => Write_EX,
         STR_dataout_sel => STR_dataout_sel
      );
   aID_EX : ID_EX
      PORT MAP (
         ALUMemSel_ID    => ALUMemSel_ID,
         ALUop_ID        => ALUop_ID,
         AdjSel_ID       => AdjSel_ID,
         BaseSel_ID      => BaseSel_ID,
         Branch_ID       => Branch_ID,
         DR              => DR,
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
         nzp_EX          => nzp_EX,
         sext_offset6_EX => sext_offset6_EX,
         mem_stall       => mem_stall,
         Opcode_EX       => Opcode_EX,
         Opcode_ID       => Opcode_ID,
         SR1             => SR1,
         SR2             => SR2,
         SR1_EX          => SR1_EX,
         SR2_EX          => SR2_EX
      );
   aID_STAGE : ID_STAGE
      PORT MAP (
         DR              => DR,
         DestReg         => DestReg,
         RESET_L         => RESET_L,
         RegWrite        => RegWrite,
         SR1             => SR1,
         SR2             => SR2,
         WriteData       => WriteData,
         imm5            => imm5,
         offset6         => offset6,
         offset9         => offset9,
         SR1_data_ID     => SR1_data_ID,
         SR2_data_ID     => SR2_data_ID,
         STR_data_ID     => STR_data_ID,
         adj_offset6_ID  => adj_offset6_ID,
         adj_offset9_ID  => adj_offset9_ID,
         sext_imm5_ID    => sext_imm5_ID,
         sext_offset6_ID => sext_offset6_ID
      );
   aIF_ID : IF_ID
      PORT MAP (
         Instrout  => Instrout,
         PC_IF     => PC_IF,
         clk       => clk,
         DR        => DR,
         PC_ID     => PC_ID,
         RESET_L   => RESET_L,
         SR1       => SR1,
         SR2       => SR2,
         bit4_ID   => bit4_ID,
         bit5_ID   => bit5_ID,
         imm5      => imm5,
         nzp_ID    => nzp_ID,
         offset6   => offset6,
         offset9   => offset9,
         mem_stall => mem_stall,
         Opcode_ID => Opcode_ID
      );
   aIF_STAGE : IF_STAGE
      PORT MAP (
         Instrin     => Instrin,
         RESET_L     => RESET_L,
         address_MEM => address_MEM,
         brSel       => brSel,
         clk         => clk,
         mem_stall   => mem_stall,
         Instrout    => Instrout,
         Opcode_IF   => Opcode_IF,
         PC_IF       => PC_IF,
         PCout       => PCout
      );
   aMEM_STAGE : MEM_STAGE
      PORT MAP (
         Branch_MEM   => Branch_MEM,
         D_DATAOUT    => D_DATAOUT,
         Read_MEM     => Read_MEM,
         RegNZP       => RegNZP,
         STR_data_MEM => STR_data_MEM,
         Write_MEM    => Write_MEM,
         address_MEM  => address_MEM,
         nzp_MEM      => nzp_MEM,
         rw_hit_gate  => rw_hit_gate,
         D_ADDRESS    => D_ADDRESS,
         D_DATAIN     => D_DATAIN,
         D_MREAD_L    => D_MREAD_L_internal,
         D_MWRITE_L   => D_MWRITE_L_internal,
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
         clk           => clk,
         dataout_MEM   => dataout_MEM,
         mem_stall     => mem_stall,
         ALUMemSel_WB  => ALUMemSel_WB,
         ALUout_WB     => ALUout_WB,
         DestReg       => DestReg,
         Opcode_WB     => Opcode_WB,
         RegWrite      => RegWrite,
         SetCC_WB      => SetCC_WB,
         dataout_WB    => dataout_WB
      );
   Op_EX : Opcoder
      PORT MAP (
         Opcode => Opcode_EX
      );
   Op_ID : Opcoder
      PORT MAP (
         Opcode => Opcode_ID
      );
   Op_IF : Opcoder
      PORT MAP (
         Opcode => Opcode_IF
      );
   Op_MEM : Opcoder
      PORT MAP (
         Opcode => Opcode_MEM
      );
   Op_WB : Opcoder
      PORT MAP (
         Opcode => Opcode_WB
      );
   aRWHitGate : RWHitGate
      PORT MAP (
         clk         => clk,
         rw_hit_gate => rw_hit_gate
      );
   aStallUnit : StallUnit
      PORT MAP (
         D_MREAD_L   => D_MREAD_L_internal,
         D_MRESP_H   => D_MRESP_H,
         D_MWRITE_L  => D_MWRITE_L_internal,
         I_MRESP_H   => I_MRESP_H,
         Read_EX     => Read_EX,
         RegWrite_ID => RegWrite_ID,
         mem_stall   => mem_stall
      );
   aWE_STAGE : WB_STAGE
      PORT MAP (
         ALUMemSel_WB => ALUMemSel_WB,
         ALUout_WB    => ALUout_WB,
         RESET_L      => RESET_L,
         SetCC_WB     => SetCC_WB,
         dataout_WB   => dataout_WB,
         RegNZP       => RegNZP,
         WriteData    => WriteData
      );

   -- Implicit buffered output assignments
   D_MWRITE_L <= D_MWRITE_L_internal;
   D_MREAD_L  <= D_MREAD_L_internal;

END struct;
