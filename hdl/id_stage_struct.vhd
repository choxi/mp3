-- VHDL Entity ece411.ID_STAGE.interface
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

ENTITY ID_STAGE IS
   PORT( 
      DR              : IN     lc3b_reg;
      DestReg         : IN     lc3b_reg;
      JSRSel_ID       : IN     std_logic;
      RESET_L         : IN     std_logic;
      RegWrite        : IN     std_logic;
      SR1             : IN     lc3b_reg;
      SR2             : IN     lc3b_reg;
      WriteData       : IN     LC3b_word;
      ZextSel_ID      : IN     std_logic;
      imm5            : IN     lc3b_imm5;
      offset11        : IN     LC3b_offset11;
      offset6         : IN     lc3b_index6;
      offset9         : IN     lc3b_offset9;
      trap8           : IN     LC3b_trapvect8;
      DR_ID           : OUT    lc3b_reg;
      SR1_data_ID     : OUT    LC3b_word;
      SR2_data_ID     : OUT    lc3b_word;
      STR_data_ID     : OUT    lc3b_word;
      adj_offset11_ID : OUT    LC3b_word;
      adj_offset6_ID  : OUT    lc3b_word;
      adj_offset9_ID  : OUT    lc3b_word;
      sext_imm5_ID    : OUT    lc3b_word;
      sext_offset6_ID : OUT    lc3b_word;
      zext8_ID        : OUT    LC3b_word
   );

-- Declarations

END ID_STAGE ;

--
-- VHDL Architecture ece411.ID_STAGE.struct
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

ARCHITECTURE struct OF ID_STAGE IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL R7     : lc3b_reg;
   SIGNAL RegOut : lc3b_reg;
   SIGNAL s      : std_logic;


   -- Component Declarations
   COMPONENT ADJ11
   PORT (
      offset11 : IN     LC3b_offset11 ;
      ADJ11out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ6
   PORT (
      index6  : IN     LC3b_index6 ;
      ADJ6out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      offset9 : IN     LC3b_offset9 ;
      ADJ9out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT RegFile
   PORT (
      DR       : IN     LC3b_reg ;
      DEST     : IN     LC3b_reg ;
      DataIn   : IN     LC3b_word ;
      RESET_L  : IN     std_logic ;
      RegWrite : IN     std_logic ;
      SrcA     : IN     LC3b_reg ;
      SrcB     : IN     LC3b_reg ;
      --clk      : IN     std_logic;
      RFAout   : OUT    LC3b_word ;
      RFBout   : OUT    LC3b_word ;
      RFDout   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT RegMux
   PORT (
      RegA   : IN     lc3b_reg ;
      RegB   : IN     lc3b_reg ;
      Sel    : IN     std_logic ;
      RegOut : OUT    lc3b_reg 
   );
   END COMPONENT;
   COMPONENT SEXT5
   PORT (
      imm5    : IN     LC3b_imm5 ;
      imm5ext : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SEXT6
   PORT (
      imm6    : IN     LC3b_index6 ;
      imm6ext : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ZEXT8
   PORT (
      trap8    : IN     LC3b_trapvect8 ;
      zext8out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT or2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADJ11 USE ENTITY ece411.ADJ11;
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : RegFile USE ENTITY ece411.RegFile;
   FOR ALL : RegMux USE ENTITY ece411.RegMux;
   FOR ALL : SEXT5 USE ENTITY ece411.SEXT5;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   FOR ALL : ZEXT8 USE ENTITY ece411.ZEXT8;
   FOR ALL : or2 USE ENTITY ece411.or2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   R7 <= "111"; 
   DR_ID <= RegOut;                                      


   -- Instance port mappings.
   U_0 : ADJ11
      PORT MAP (
         offset11 => offset11,
         ADJ11out => adj_offset11_ID
      );
   aADJ6 : ADJ6
      PORT MAP (
         index6  => offset6,
         ADJ6out => adj_offset6_ID
      );
   aADJ9 : ADJ9
      PORT MAP (
         offset9 => offset9,
         ADJ9out => adj_offset9_ID
      );
   aRegFile : RegFile
      PORT MAP (
         DR       => RegOut,
         DEST     => DestReg,
         DataIn   => WriteData,
         RESET_L  => RESET_L,
         RegWrite => RegWrite,
         SrcA     => SR1,
         SrcB     => SR2,
         RFAout   => SR1_data_ID,
         RFBout   => SR2_data_ID,
         RFDout   => STR_data_ID
      );
   U_1 : RegMux
      PORT MAP (
         RegA   => DR,
         RegB   => R7,
         Sel    => s,
         RegOut => RegOut
      );
   aSEXT5 : SEXT5
      PORT MAP (
         imm5    => imm5,
         imm5ext => sext_imm5_ID
      );
   aSEXT6 : SEXT6
      PORT MAP (
         imm6    => offset6,
         imm6ext => sext_offset6_ID
      );
   U_2 : ZEXT8
      PORT MAP (
         trap8    => trap8,
         zext8out => zext8_ID
      );
   U_3 : or2
      PORT MAP (
         a => ZextSel_ID,
         b => JSRSel_ID,
         s => s
      );

END struct;
