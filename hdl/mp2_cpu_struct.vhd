-- VHDL Entity ece411.mp2_CPU.symbol
--
-- Created:
--          by - tkalbar2.stdt (eelnx12.ews.illinois.edu)
--          at - 20:12:03 10/17/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp2_CPU IS
   PORT( 
      RESET_L : IN     std_logic;
      START_H : IN     std_logic;
      clk     : IN     std_logic
   );

-- Declarations

END mp2_CPU ;

--
-- VHDL Architecture ece411.mp2_CPU.struct
--
-- Created:
--          by - tkalbar2.stdt (eelnx12.ews.illinois.edu)
--          at - 20:12:03 10/17/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mp2_CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDRESS       : LC3b_word;
   SIGNAL ALUMuxSel     : std_logic;
   SIGNAL ALUop         : LC3b_aluop;
   SIGNAL CheckN        : std_logic;
   SIGNAL CheckP        : std_logic;
   SIGNAL CheckZ        : std_logic;
   SIGNAL DATAIN        : LC3b_word;
   SIGNAL DATAOUT       : LC3b_word;
   SIGNAL IMM6MuxSel    : std_logic;
   SIGNAL JMPSelMux     : std_logic;
   SIGNAL JSRSel        : std_logic;
   SIGNAL LDBSelMux     : std_logic;
   SIGNAL LEAMuxSel     : std_logic;
   SIGNAL LSB           : std_logic;
   SIGNAL LoadIR        : std_logic;
   SIGNAL LoadMAR       : std_logic;
   SIGNAL LoadMDR       : std_logic;
   SIGNAL LoadNZP       : std_logic;
   SIGNAL LoadPC        : std_logic;
   SIGNAL MARMuxSel     : std_logic;
   SIGNAL MDRBusSel     : std_logic;
   SIGNAL MDRMuxSel     : std_logic;
   SIGNAL MREAD_L       : std_logic;
   SIGNAL MRESP_H       : std_logic;
   SIGNAL MWRITEH_L     : std_logic;
   SIGNAL MWRITEL_L     : std_logic;
   SIGNAL Opcode        : LC3b_opcode;
   SIGNAL PCMDRMuxSel   : std_logic;
   SIGNAL PCMuxSel      : std_logic;
   SIGNAL PCTOREGMuxSel : std_logic;
   SIGNAL R7MuxSel      : std_logic;
   SIGNAL RFMuxSel      : std_logic;
   SIGNAL RegWrite      : std_logic;
   SIGNAL SEXTMuxSel    : std_logic;
   SIGNAL STBSelMux     : std_logic;
   SIGNAL StoreSR       : std_logic;
   SIGNAL TRAPMuxSel    : std_logic;
   SIGNAL a             : std_logic;
   SIGNAL bit11         : std_logic;
   SIGNAL d             : std_logic;
   SIGNAL n             : std_logic;
   SIGNAL p             : std_logic;
   SIGNAL z             : std_logic;


   -- Component Declarations
   COMPONENT Control
   PORT (
      CheckN        : IN     std_logic ;
      CheckP        : IN     std_logic ;
      CheckZ        : IN     std_logic ;
      LSB           : IN     std_logic ;
      MRESP_H       : IN     std_logic ;
      Opcode        : IN     LC3b_opcode ;
      RESET_L       : IN     std_logic ;
      START_H       : IN     std_logic ;
      a             : IN     std_logic ;
      bit11         : IN     std_logic ;
      clk           : IN     std_logic ;
      d             : IN     std_logic ;
      n             : IN     std_logic ;
      p             : IN     std_logic ;
      z             : IN     std_logic ;
      ALUMuxSel     : OUT    std_logic ;
      ALUop         : OUT    LC3b_aluop ;
      IMM6MuxSel    : OUT    std_logic ;
      JMPSelMux     : OUT    std_logic ;
      JSRSel        : OUT    std_logic ;
      LDBSelMux     : OUT    std_logic ;
      LEAMuxSel     : OUT    std_logic ;
      LoadIR        : OUT    std_logic ;
      LoadMAR       : OUT    std_logic ;
      LoadMDR       : OUT    std_logic ;
      LoadNZP       : OUT    std_logic ;
      LoadPC        : OUT    std_logic ;
      MARMuxSel     : OUT    std_logic ;
      MDRBusSel     : OUT    std_logic ;
      MDRMuxSel     : OUT    std_logic ;
      MREAD_L       : OUT    std_logic ;
      MWRITEH_L     : OUT    std_logic ;
      MWRITEL_L     : OUT    std_logic ;
      PCMDRMuxSel   : OUT    std_logic ;
      PCMuxSel      : OUT    std_logic ;
      PCTOREGMuxSel : OUT    std_logic ;
      R7MuxSel      : OUT    std_logic ;
      RFMuxSel      : OUT    std_logic ;
      RegWrite      : OUT    std_logic ;
      SEXTMuxSel    : OUT    std_logic ;
      STBSelMux     : OUT    std_logic ;
      StoreSR       : OUT    std_logic ;
      TRAPMuxSel    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Datapath
   PORT (
      ALUMuxSel     : IN     std_logic ;
      ALUop         : IN     LC3b_aluop ;
      DATAIN        : IN     LC3b_word ;
      IMM6MuxSel    : IN     std_logic ;
      JMPSelMux     : IN     std_logic ;
      JSRSel        : IN     std_logic ;
      LDBSelMux     : IN     std_logic ;
      LEAMuxSel     : IN     std_logic ;
      LoadIR        : IN     std_logic ;
      LoadMAR       : IN     std_logic ;
      LoadMDR       : IN     std_logic ;
      LoadNZP       : IN     std_logic ;
      LoadPC        : IN     std_logic ;
      MARMuxSel     : IN     std_logic ;
      MDRBusSel     : IN     std_logic ;
      MDRMuxSel     : IN     std_logic ;
      PCMDRMuxSel   : IN     std_logic ;
      PCMuxSel      : IN     std_logic ;
      PCTOREGMuxSel : IN     std_logic ;
      R7MuxSel      : IN     std_logic ;
      RESET_L       : IN     std_logic ;
      RFMuxSel      : IN     std_logic ;
      RegWrite      : IN     std_logic ;
      SEXTMuxSel    : IN     std_logic ;
      STBSelMux     : IN     std_logic ;
      StoreSR       : IN     std_logic ;
      TRAPMuxSel    : IN     std_logic ;
      clk           : IN     std_logic ;
      ADDRESS       : OUT    LC3b_word ;
      CheckN        : OUT    std_logic ;
      CheckP        : OUT    std_logic ;
      CheckZ        : OUT    std_logic ;
      DATAOUT       : OUT    LC3b_word ;
      LSB           : OUT    std_logic ;
      Opcode        : OUT    LC3b_opcode ;
      a             : OUT    std_logic ;
      bit11         : OUT    std_logic ;
      d             : OUT    std_logic ;
      n             : OUT    std_logic ;
      p             : OUT    std_logic ;
      z             : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Memory
   PORT (
      ADDRESS   : IN     LC3b_word ;
      DATAOUT   : IN     LC3b_word ;
      MREAD_L   : IN     std_logic ;
      MWRITEH_L : IN     std_logic ;
      MWRITEL_L : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      clk       : IN     std_logic ;
      DATAIN    : OUT    LC3b_word ;
      MRESP_H   : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Control USE ENTITY ece411.Control;
   FOR ALL : Datapath USE ENTITY ece411.Datapath;
   FOR ALL : Memory USE ENTITY ece411.Memory;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   ControlUnit : Control
      PORT MAP (
         CheckN        => CheckN,
         CheckP        => CheckP,
         CheckZ        => CheckZ,
         LSB           => LSB,
         MRESP_H       => MRESP_H,
         Opcode        => Opcode,
         RESET_L       => RESET_L,
         START_H       => START_H,
         a             => a,
         bit11         => bit11,
         clk           => clk,
         d             => d,
         n             => n,
         p             => p,
         z             => z,
         ALUMuxSel     => ALUMuxSel,
         ALUop         => ALUop,
         IMM6MuxSel    => IMM6MuxSel,
         JMPSelMux     => JMPSelMux,
         JSRSel        => JSRSel,
         LDBSelMux     => LDBSelMux,
         LEAMuxSel     => LEAMuxSel,
         LoadIR        => LoadIR,
         LoadMAR       => LoadMAR,
         LoadMDR       => LoadMDR,
         LoadNZP       => LoadNZP,
         LoadPC        => LoadPC,
         MARMuxSel     => MARMuxSel,
         MDRBusSel     => MDRBusSel,
         MDRMuxSel     => MDRMuxSel,
         MREAD_L       => MREAD_L,
         MWRITEH_L     => MWRITEH_L,
         MWRITEL_L     => MWRITEL_L,
         PCMDRMuxSel   => PCMDRMuxSel,
         PCMuxSel      => PCMuxSel,
         PCTOREGMuxSel => PCTOREGMuxSel,
         R7MuxSel      => R7MuxSel,
         RFMuxSel      => RFMuxSel,
         RegWrite      => RegWrite,
         SEXTMuxSel    => SEXTMuxSel,
         STBSelMux     => STBSelMux,
         StoreSR       => StoreSR,
         TRAPMuxSel    => TRAPMuxSel
      );
   theDatapath : Datapath
      PORT MAP (
         ALUMuxSel     => ALUMuxSel,
         ALUop         => ALUop,
         DATAIN        => DATAIN,
         IMM6MuxSel    => IMM6MuxSel,
         JMPSelMux     => JMPSelMux,
         JSRSel        => JSRSel,
         LDBSelMux     => LDBSelMux,
         LEAMuxSel     => LEAMuxSel,
         LoadIR        => LoadIR,
         LoadMAR       => LoadMAR,
         LoadMDR       => LoadMDR,
         LoadNZP       => LoadNZP,
         LoadPC        => LoadPC,
         MARMuxSel     => MARMuxSel,
         MDRBusSel     => MDRBusSel,
         MDRMuxSel     => MDRMuxSel,
         PCMDRMuxSel   => PCMDRMuxSel,
         PCMuxSel      => PCMuxSel,
         PCTOREGMuxSel => PCTOREGMuxSel,
         R7MuxSel      => R7MuxSel,
         RESET_L       => RESET_L,
         RFMuxSel      => RFMuxSel,
         RegWrite      => RegWrite,
         SEXTMuxSel    => SEXTMuxSel,
         STBSelMux     => STBSelMux,
         StoreSR       => StoreSR,
         TRAPMuxSel    => TRAPMuxSel,
         clk           => clk,
         ADDRESS       => ADDRESS,
         CheckN        => CheckN,
         CheckP        => CheckP,
         CheckZ        => CheckZ,
         DATAOUT       => DATAOUT,
         LSB           => LSB,
         Opcode        => Opcode,
         a             => a,
         bit11         => bit11,
         d             => d,
         n             => n,
         p             => p,
         z             => z
      );
   DRAM : Memory
      PORT MAP (
         ADDRESS   => ADDRESS,
         DATAOUT   => DATAOUT,
         MREAD_L   => MREAD_L,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         RESET_L   => RESET_L,
         clk       => clk,
         DATAIN    => DATAIN,
         MRESP_H   => MRESP_H
      );

END struct;
