-- VHDL Entity ece411.mp3_cpu.symbol
--
-- Created:
--          by - tkalbar2.stdt (eelnx38.ews.illinois.edu)
--          at - 22:40:31 10/20/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp3_cpu IS
   PORT( 
      RESET_L : IN     std_logic;
      clk     : IN     std_logic
   );

-- Declarations

END mp3_cpu ;

--
-- VHDL Architecture ece411.mp3_cpu.struct
--
-- Created:
--          by - tkalbar2.stdt (eelnx38.ews.illinois.edu)
--          at - 22:40:31 10/20/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mp3_cpu IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALUMemSel_EX    : std_logic;
   SIGNAL ALUMemSel_ID    : std_logic;
   SIGNAL ALUMemSel_MEM   : std_logic;
   SIGNAL ALUMemSel_WB    : std_logic;
   SIGNAL ALUop_EX        : LC3b_ALUop;
   SIGNAL ALUop_ID        : LC3b_aluop;
   SIGNAL ALUout_EX       : lc3b_word;
   SIGNAL ALUout_MEM      : lc3b_word;
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
   SIGNAL D_ADDRESS       : LC3b_word;
   SIGNAL D_DATAIN        : LC3b_word;
   SIGNAL D_DATAOUT       : LC3b_word;
   SIGNAL D_MREAD_L       : std_logic;
   SIGNAL D_MWRITE_L      : std_logic;
   SIGNAL DestReg         : lc3b_reg;
   SIGNAL I_MREAD_L       : std_logic;
   SIGNAL ImmSel_EX       : std_logic;
   SIGNAL ImmSel_ID       : std_logic;
   SIGNAL Instrin         : lc3b_word;
   SIGNAL Instrout        : lc3b_word;
   SIGNAL Opcode          : LC3b_opcode;
   SIGNAL PC_EX           : lc3b_word;
   SIGNAL PC_ID           : lc3b_word;
   SIGNAL PC_IF           : lc3b_word;
   SIGNAL PCout           : lc3b_word;
   SIGNAL Read_EX         : std_logic;
   SIGNAL Read_ID         : std_logic;
   SIGNAL Read_MEM        : std_logic;
   SIGNAL RegNZP          : lc3b_nzp;
   SIGNAL RegWrite        : std_logic;
   SIGNAL RegWrite_EX     : std_logic;
   SIGNAL RegWrite_ID     : std_logic;
   SIGNAL RegWrite_MEM    : std_logic;
   SIGNAL SR1             : lc3b_reg;
   SIGNAL SR1_data_EX     : lc3b_word;
   SIGNAL SR1_data_ID     : lc3b_word;
   SIGNAL SR2             : lc3b_reg;
   SIGNAL SR2_data_EX     : lc3b_word;
   SIGNAL SR2_data_ID     : lc3b_word;
   SIGNAL STR_data_EX     : lc3b_word;
   SIGNAL STR_data_ID     : lc3b_word;
   SIGNAL STR_data_MEM    : lc3b_word;
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
   SIGNAL nzp_EX          : lc3b_nzp;
   SIGNAL nzp_ID          : lc3b_nzp;
   SIGNAL nzp_MEM         : lc3b_nzp;
   SIGNAL offset6         : lc3b_index6;
   SIGNAL offset9         : lc3b_offset9;
   SIGNAL sext_imm5_ID    : lc3b_word;
   SIGNAL sext_offset6_EX : lc3b_word;
   SIGNAL sext_offset6_ID : lc3b_word;


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
      ALUMemSel_EX  : IN     std_logic ;
      ALUout_EX     : IN     lc3b_word ;
      Branch_EX     : IN     std_logic ;
      DR_EX         : IN     lc3b_reg ;
      RESET_L       : IN     std_logic ;
      Read_EX       : IN     std_logic ;
      RegWrite_EX   : IN     std_logic ;
      STR_data_EX   : IN     lc3b_word ;
      SetCC_EX      : IN     std_logic ;
      Write_EX      : IN     std_logic ;
      address_EX    : IN     lc3b_word ;
      clk           : IN     std_logic ;
      nzp_EX        : IN     lc3b_nzp ;
      ALUMemSel_MEM : OUT    std_logic ;
      ALUout_MEM    : OUT    lc3b_word ;
      Branch_MEM    : OUT    std_logic ;
      DR_MEM        : OUT    lc3b_reg ;
      Read_MEM      : OUT    std_logic ;
      RegWrite_MEM  : OUT    std_logic ;
      STR_data_MEM  : OUT    lc3b_word ;
      SetCC_MEM     : OUT    std_logic ;
      Write_MEM     : OUT    std_logic ;
      address_MEM   : OUT    lc3b_word ;
      nzp_MEM       : OUT    lc3b_nzp 
   );
   END COMPONENT;
   COMPONENT EX_STAGE
   PORT (
      ALUop_EX        : IN     LC3b_ALUop ;
      AdjSel_EX       : IN     std_logic ;
      BaseSel_EX      : IN     std_logic ;
      ImmSel_EX       : IN     std_logic ;
      PC_EX           : IN     lc3b_word ;
      SR1_data_EX     : IN     lc3b_word ;
      SR2_data_EX     : IN     lc3b_word ;
      SextSel_EX      : IN     std_logic ;
      adj_imm5_EX     : IN     lc3b_word ;
      adj_offset6_EX  : IN     lc3b_word ;
      adj_offset9_EX  : IN     lc3b_word ;
      sext_offset6_EX : IN     lc3b_word ;
      ALUout_EX       : OUT    lc3b_word ;
      address_EX      : OUT    lc3b_word 
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
      sext_offset6_EX : OUT    lc3b_word 
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
      Instrout : IN     lc3b_word ;
      PC_IF    : IN     lc3b_word ;
      RESET_L  : IN     std_logic ;
      clk      : IN     std_logic ;
      DR       : OUT    lc3b_reg ;
      Opcode   : OUT    LC3b_opcode ;
      PC_ID    : OUT    lc3b_word ;
      SR1      : OUT    lc3b_reg ;
      SR2      : OUT    lc3b_reg ;
      bit4_ID  : OUT    std_logic ;
      bit5_ID  : OUT    std_logic ;
      imm5     : OUT    lc3b_imm5 ;
      nzp_ID   : OUT    lc3b_nzp ;
      offset6  : OUT    lc3b_index6 ;
      offset9  : OUT    lc3b_offset9 
   );
   END COMPONENT;
   COMPONENT IF_STAGE
   PORT (
      Instrin     : IN     lc3b_word ;
      RESET_L     : IN     std_logic ;
      address_MEM : IN     lc3b_word ;
      brSel       : IN     std_logic ;
      clk         : IN     std_logic ;
      Instrout    : OUT    lc3b_word ;
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
      ALUout_MEM    : IN     lc3b_word ;
      DR_MEM        : IN     lc3b_reg ;
      RESET_L       : IN     std_logic ;
      RegWrite_MEM  : IN     std_logic ;
      SetCC_MEM     : IN     std_logic ;
      clk           : IN     std_logic ;
      dataout_MEM   : IN     lc3b_word ;
      ALUMemSel_WB  : OUT    std_logic ;
      ALUout_WB     : OUT    lc3b_word ;
      DestReg       : OUT    lc3b_reg ;
      RegWrite      : OUT    std_logic ;
      SetCC_WB      : OUT    std_logic ;
      dataout_WB    : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MagicMemory
   PORT (
      D_ADDRESS  : IN     LC3b_word ;
      D_DATAIN   : IN     LC3b_word ;
      D_MREAD_L  : IN     std_logic ;
      D_MWRITE_L : IN     std_logic ;
      I_ADDRESS  : IN     LC3b_word ;
      I_MREAD_L  : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      D_DATAOUT  : OUT    LC3b_word ;
      D_MRESP_H  : OUT    std_logic ;
      I_DATAOUT  : OUT    LC3b_word ;
      I_MRESP_H  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT WB_STAGE
   PORT (
      ALUMemSel_WB : IN     std_logic ;
      ALUout_WB    : IN     lc3b_word ;
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
   FOR ALL : ID_EX USE ENTITY ece411.ID_EX;
   FOR ALL : ID_STAGE USE ENTITY ece411.ID_STAGE;
   FOR ALL : IF_ID USE ENTITY ece411.IF_ID;
   FOR ALL : IF_STAGE USE ENTITY ece411.IF_STAGE;
   FOR ALL : MEM_STAGE USE ENTITY ece411.MEM_STAGE;
   FOR ALL : MEM_WB USE ENTITY ece411.MEM_WB;
   FOR ALL : MagicMemory USE ENTITY ece411.MagicMemory;
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
         Opcode       => Opcode,
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
         ALUMemSel_EX  => ALUMemSel_EX,
         ALUout_EX     => ALUout_EX,
         Branch_EX     => Branch_EX,
         DR_EX         => DR_EX,
         RESET_L       => RESET_L,
         Read_EX       => Read_EX,
         RegWrite_EX   => RegWrite_EX,
         STR_data_EX   => STR_data_EX,
         SetCC_EX      => SetCC_EX,
         Write_EX      => Write_EX,
         address_EX    => address_EX,
         clk           => clk,
         nzp_EX        => nzp_EX,
         ALUMemSel_MEM => ALUMemSel_MEM,
         ALUout_MEM    => ALUout_MEM,
         Branch_MEM    => Branch_MEM,
         DR_MEM        => DR_MEM,
         Read_MEM      => Read_MEM,
         RegWrite_MEM  => RegWrite_MEM,
         STR_data_MEM  => STR_data_MEM,
         SetCC_MEM     => SetCC_MEM,
         Write_MEM     => Write_MEM,
         address_MEM   => address_MEM,
         nzp_MEM       => nzp_MEM
      );
   aEX_STAGE : EX_STAGE
      PORT MAP (
         ALUop_EX        => ALUop_EX,
         AdjSel_EX       => AdjSel_EX,
         BaseSel_EX      => BaseSel_EX,
         ImmSel_EX       => ImmSel_EX,
         PC_EX           => PC_EX,
         SR1_data_EX     => SR1_data_EX,
         SR2_data_EX     => SR2_data_EX,
         SextSel_EX      => SextSel_EX,
         adj_imm5_EX     => adj_imm5_EX,
         adj_offset6_EX  => adj_offset6_EX,
         adj_offset9_EX  => adj_offset9_EX,
         sext_offset6_EX => sext_offset6_EX,
         ALUout_EX       => ALUout_EX,
         address_EX      => address_EX
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
         sext_offset6_EX => sext_offset6_EX
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
         Instrout => Instrout,
         PC_IF    => PC_IF,
         RESET_L  => RESET_L,
         clk      => clk,
         DR       => DR,
         Opcode   => Opcode,
         PC_ID    => PC_ID,
         SR1      => SR1,
         SR2      => SR2,
         bit4_ID  => bit4_ID,
         bit5_ID  => bit5_ID,
         imm5     => imm5,
         nzp_ID   => nzp_ID,
         offset6  => offset6,
         offset9  => offset9
      );
   aIF_STAGE : IF_STAGE
      PORT MAP (
         Instrin     => Instrin,
         RESET_L     => RESET_L,
         address_MEM => address_MEM,
         brSel       => brSel,
         clk         => clk,
         Instrout    => Instrout,
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
         D_ADDRESS    => D_ADDRESS,
         D_DATAIN     => D_DATAIN,
         D_MREAD_L    => D_MREAD_L,
         D_MWRITE_L   => D_MWRITE_L,
         brSel        => brSel,
         dataout_MEM  => dataout_MEM
      );
   aMEM_WB : MEM_WB
      PORT MAP (
         ALUMemSel_MEM => ALUMemSel_MEM,
         ALUout_MEM    => ALUout_MEM,
         DR_MEM        => DR_MEM,
         RESET_L       => RESET_L,
         RegWrite_MEM  => RegWrite_MEM,
         SetCC_MEM     => SetCC_MEM,
         clk           => clk,
         dataout_MEM   => dataout_MEM,
         ALUMemSel_WB  => ALUMemSel_WB,
         ALUout_WB     => ALUout_WB,
         DestReg       => DestReg,
         RegWrite      => RegWrite,
         SetCC_WB      => SetCC_WB,
         dataout_WB    => dataout_WB
      );
   DRAM_magic : MagicMemory
      PORT MAP (
         D_ADDRESS  => D_ADDRESS,
         D_DATAIN   => D_DATAIN,
         D_MREAD_L  => D_MREAD_L,
         D_MWRITE_L => D_MWRITE_L,
         I_ADDRESS  => PCout,
         I_MREAD_L  => I_MREAD_L,
         RESET_L    => RESET_L,
         D_DATAOUT  => D_DATAOUT,
         D_MRESP_H  => OPEN,
         I_DATAOUT  => Instrin,
         I_MRESP_H  => OPEN
      );
   aWE_STAGE : WB_STAGE
      PORT MAP (
         ALUMemSel_WB => ALUMemSel_WB,
         ALUout_WB    => ALUout_WB,
         SetCC_WB     => SetCC_WB,
         dataout_WB   => dataout_WB,
         RegNZP       => RegNZP,
         WriteData    => WriteData
      );

END struct;
