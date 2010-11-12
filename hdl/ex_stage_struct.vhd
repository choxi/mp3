-- VHDL Entity ece411.EX_STAGE.interface
--
-- Created:
--          by - tkalbar2.stdt (gllnx16.ews.illinois.edu)
--          at - 07:23:57 11/12/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY EX_STAGE IS
   PORT( 
      ALUop_EX        : IN     LC3b_ALUop;
      ALUout_MEM      : IN     LC3b_word;
      AdjSel_EX       : IN     std_logic;
      BaseSel_EX      : IN     std_logic;
      FUMux1_sel      : IN     std_logic;
      FUMux2_sel      : IN     std_logic;
      FUTypeWB1       : IN     std_logic;
      FUTypeWB2       : IN     std_logic;
      FUTypeWB_DR     : IN     std_logic;
      ImmSel_EX       : IN     std_logic;
      JSRSel_EX       : IN     std_logic;
      LEAMuxSel_EX    : IN     std_logic;
      PC_EX           : IN     lc3b_word;
      SR1_data_EX     : IN     lc3b_word;
      SR2_data_EX     : IN     lc3b_word;
      STR_data_EX     : IN     lc3b_word;
      STR_dataout_sel : IN     std_logic;
      SextSel_EX      : IN     std_logic;
      WriteData       : IN     LC3b_word;
      ZextSel_EX      : IN     std_logic;
      adj_imm5_EX     : IN     lc3b_word;
      adj_offset11_EX : IN     lc3b_word;
      adj_offset6_EX  : IN     lc3b_word;
      adj_offset9_EX  : IN     lc3b_word;
      sext_offset6_EX : IN     lc3b_word;
      zext8_EX        : IN     lc3b_word;
      ALUout_EX       : OUT    lc3b_word;
      PCout_EX        : OUT    lc3b_word;
      STR_dataout_EX  : OUT    lc3b_word;
      address_EX      : OUT    lc3b_word
   );

-- Declarations

END EX_STAGE ;

--
-- VHDL Architecture ece411.EX_STAGE.struct
--
-- Created:
--          by - tkalbar2.stdt (gllnx16.ews.illinois.edu)
--          at - 07:23:57 11/12/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF EX_STAGE IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALUout        : LC3b_word;
   SIGNAL B             : LC3b_word;
   SIGNAL F             : LC3b_word;
   SIGNAL F1            : LC3b_word;
   SIGNAL F2            : LC3b_word;
   SIGNAL FUMux1out     : LC3b_word;
   SIGNAL FUMux2out     : LC3b_word;
   SIGNAL FUTypeMux1out : LC3b_word;
   SIGNAL FUTypeMux2out : LC3b_word;
   SIGNAL baseMuxout    : LC3b_word;
   SIGNAL immMuxout     : LC3b_word;
   SIGNAL offset6Muxout : LC3b_word;

   -- Implicit buffer signal declarations
   SIGNAL address_EX_internal : lc3b_word;


   -- Component Declarations
   COMPONENT ALU
   PORT (
      A      : IN     LC3b_word ;
      ALUop  : IN     LC3b_aluop ;
      B      : IN     LC3b_word ;
      ALUout : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Adder
   PORT (
      A : IN     lc3b_word ;
      B : IN     lc3b_word ;
      F : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ALU USE ENTITY ece411.ALU;
   FOR ALL : Adder USE ENTITY ece411.Adder;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   PCout_EX <= PC_EX;


   -- Instance port mappings.
   aALU : ALU
      PORT MAP (
         A      => FUMux1out,
         ALUop  => ALUop_EX,
         B      => immMuxout,
         ALUout => ALUout
      );
   aAdder : Adder
      PORT MAP (
         A => F2,
         B => baseMuxout,
         F => address_EX_internal
      );
   FUMux1 : WordMux2
      PORT MAP (
         A   => SR1_data_EX,
         B   => FUTypeMux1out,
         Sel => FUMux1_sel,
         F   => FUMux1out
      );
   FUMux2 : WordMux2
      PORT MAP (
         A   => SR2_data_EX,
         B   => FUTypeMux2out,
         Sel => FUMux2_sel,
         F   => FUMux2out
      );
   FUTypeMux1 : WordMux2
      PORT MAP (
         A   => ALUout_MEM,
         B   => WriteData,
         Sel => FUTypeWB1,
         F   => FUTypeMux1out
      );
   FUTypeMux2 : WordMux2
      PORT MAP (
         A   => ALUout_MEM,
         B   => WriteData,
         Sel => FUTypeWB2,
         F   => FUTypeMux2out
      );
   FUTypeMuxDR : WordMux2
      PORT MAP (
         A   => ALUout_MEM,
         B   => WriteData,
         Sel => FUTypeWB_DR,
         F   => B
      );
   JSRmux : WordMux2
      PORT MAP (
         A   => adj_offset9_EX,
         B   => adj_offset11_EX,
         Sel => JSRSel_EX,
         F   => F
      );
   LEAMux : WordMux2
      PORT MAP (
         A   => ALUout,
         B   => address_EX_internal,
         Sel => LEAMuxSel_EX,
         F   => ALUout_EX
      );
   STR_dataout_mux : WordMux2
      PORT MAP (
         A   => STR_data_EX,
         B   => B,
         Sel => STR_dataout_sel,
         F   => STR_dataout_EX
      );
   adjmux : WordMux2
      PORT MAP (
         A   => sext_offset6_EX,
         B   => adj_offset6_EX,
         Sel => AdjSel_EX,
         F   => offset6Muxout
      );
   basemux : WordMux2
      PORT MAP (
         A   => FUMux1out,
         B   => PC_EX,
         Sel => BaseSel_EX,
         F   => baseMuxout
      );
   immMux : WordMux2
      PORT MAP (
         A   => FUMux2out,
         B   => adj_imm5_EX,
         Sel => ImmSel_EX,
         F   => immMuxout
      );
   sextmux : WordMux2
      PORT MAP (
         A   => offset6Muxout,
         B   => F,
         Sel => SextSel_EX,
         F   => F1
      );
   zextmux : WordMux2
      PORT MAP (
         A   => F1,
         B   => zext8_EX,
         Sel => ZextSel_EX,
         F   => F2
      );

   -- Implicit buffered output assignments
   address_EX <= address_EX_internal;

END struct;
