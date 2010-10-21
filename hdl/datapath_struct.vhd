-- VHDL Entity ece411.Datapath.interface
--
-- Created:
--          by - tkalbar2.stdt (eelnx12.ews.illinois.edu)
--          at - 20:12:02 10/17/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Datapath IS
   PORT( 
      ALUMuxSel     : IN     std_logic;
      ALUop         : IN     LC3b_aluop;
      DATAIN        : IN     LC3b_word;
      IMM6MuxSel    : IN     std_logic;
      JMPSelMux     : IN     std_logic;
      JSRSel        : IN     std_logic;
      LDBSelMux     : IN     std_logic;
      LEAMuxSel     : IN     std_logic;
      LoadIR        : IN     std_logic;
      LoadMAR       : IN     std_logic;
      LoadMDR       : IN     std_logic;
      LoadNZP       : IN     std_logic;
      LoadPC        : IN     std_logic;
      MARMuxSel     : IN     std_logic;
      MDRBusSel     : IN     std_logic;
      MDRMuxSel     : IN     std_logic;
      PCMDRMuxSel   : IN     std_logic;
      PCMuxSel      : IN     std_logic;
      PCTOREGMuxSel : IN     std_logic;
      R7MuxSel      : IN     std_logic;
      RESET_L       : IN     std_logic;
      RFMuxSel      : IN     std_logic;
      RegWrite      : IN     std_logic;
      SEXTMuxSel    : IN     std_logic;
      STBSelMux     : IN     std_logic;
      StoreSR       : IN     std_logic;
      TRAPMuxSel    : IN     std_logic;
      clk           : IN     std_logic;
      ADDRESS       : OUT    LC3b_word;
      CheckN        : OUT    std_logic;
      CheckP        : OUT    std_logic;
      CheckZ        : OUT    std_logic;
      DATAOUT       : OUT    LC3b_word;
      LSB           : OUT    std_logic;
      Opcode        : OUT    LC3b_opcode;
      a             : OUT    std_logic;
      bit11         : OUT    std_logic;
      d             : OUT    std_logic;
      n             : OUT    std_logic;
      p             : OUT    std_logic;
      z             : OUT    std_logic
   );

-- Declarations

END Datapath ;

--
-- VHDL Architecture ece411.Datapath.struct
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

ARCHITECTURE struct OF Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADJ11out     : LC3b_word;
   SIGNAL ADJ6out      : LC3b_word;
   SIGNAL ADJ9out      : LC3b_word;
   SIGNAL ALUMuxout    : LC3b_word;
   SIGNAL ALUout       : LC3b_word;
   SIGNAL BRaddout     : LC3b_word;
   SIGNAL F            : LC3b_word;
   SIGNAL F1           : LC3b_word;
   SIGNAL F10          : LC3b_word;
   SIGNAL F11          : LC3b_word;
   SIGNAL F12          : LC3b_word;
   SIGNAL F2           : LC3b_word;
   SIGNAL F3           : LC3b_word;
   SIGNAL F4           : LC3b_word;
   SIGNAL F5           : LC3b_word;
   SIGNAL F6           : LC3b_word;
   SIGNAL F7           : LC3b_word;
   SIGNAL F8           : LC3b_word;
   SIGNAL F9           : LC3b_word;
   SIGNAL GenCCout     : LC3b_cc;
   SIGNAL IMM          : LC3b_word;
   SIGNAL MDRout       : LC3b_word;
   SIGNAL MarMuxout    : LC3b_word;
   SIGNAL Output_addr  : LC3b_word;
   SIGNAL Output_data  : LC3b_word;
   SIGNAL PCMuxout     : LC3b_word;
   SIGNAL PCPlus2out   : LC3b_word;
   SIGNAL PCout        : LC3b_word;
   SIGNAL R7           : LC3b_reg;
   SIGNAL RFAout       : LC3b_word;
   SIGNAL RFBout       : LC3b_word;
   SIGNAL RFMuxout     : LC3b_word;
   SIGNAL SrcA         : LC3b_reg;
   SIGNAL SrcB         : LC3b_reg;
   SIGNAL StoreMuxout  : LC3b_reg;
   SIGNAL StoreMuxout1 : LC3b_reg;
   SIGNAL dest         : LC3b_reg;
   SIGNAL imm5         : LC3b_imm5;
   SIGNAL imm5ext      : LC3b_word;
   SIGNAL imm6ext      : LC3b_word;
   SIGNAL index6       : LC3b_index6;
   SIGNAL offset11     : LC3b_offset11;
   SIGNAL offset9      : LC3b_offset9;
   SIGNAL trap8        : LC3b_trapvect8;
   SIGNAL zext8out     : LC3b_word;

   -- Implicit buffer signal declarations
   SIGNAL ADDRESS_internal : LC3b_word;
   SIGNAL LSB_internal     : std_logic;
   SIGNAL bit11_internal   : std_logic;


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
   COMPONENT ALU
   PORT (
      ALUMuxout : IN     LC3b_word ;
      ALUop     : IN     LC3b_aluop ;
      RFAout    : IN     LC3b_word ;
      ALUout    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT BRadd
   PORT (
      ADJ9out  : IN     LC3b_word ;
      PCout    : IN     LC3b_word ;
      BRaddout : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT GenCC
   PORT (
      RFMuxout : IN     LC3b_word ;
      GenCCout : OUT    LC3b_cc 
   );
   END COMPONENT;
   COMPONENT IMMED5
   PORT (
      imm5    : IN     LC3b_imm5 ;
      imm5ext : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT IMMED6
   PORT (
      imm6    : IN     LC3b_index6 ;
      imm6ext : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT IR
   PORT (
      LoadIR   : IN     std_logic ;
      MDRout   : IN     LC3b_word ;
      clk      : IN     std_logic ;
      Opcode   : OUT    LC3b_opcode ;
      SrcA     : OUT    LC3b_reg ;
      SrcB     : OUT    LC3b_reg ;
      dest     : OUT    LC3b_reg ;
      index6   : OUT    LC3b_index6 ;
      offset9  : OUT    LC3b_offset9 ;
      offset11 : OUT    LC3b_offset11 ;
      trap8    : OUT    LC3b_trapvect8 ;
      imm5     : OUT    LC3b_imm5 ;
      d        : OUT    std_logic ;
      bit11    : OUT    std_logic ;
      a        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT LDB_Logic
   PORT (
      ADDR_LSB    : IN     std_logic ;
      Input_addr  : IN     LC3b_word ;
      Output_addr : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT LSBADDR
   PORT (
      Address : IN     LC3b_word ;
      LSB     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc ;
      LoadNZP  : IN     std_logic ;
      clk      : IN     std_logic ;
      n        : OUT    std_logic ;
      p        : OUT    std_logic ;
      z        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      dest   : IN     LC3b_reg ;
      CheckN : OUT    std_logic ;
      CheckP : OUT    std_logic ;
      CheckZ : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word ;
      PCPlus2out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT Reg16
   PORT (
      Input  : IN     LC3b_word ;
      RESET  : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      Output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT RegFile
   PORT (
      RESET_L     : IN     std_logic ;
      RFMuxout    : IN     LC3b_word ;
      RegWrite    : IN     std_logic ;
      SrcB        : IN     LC3b_reg ;
      StoreMuxout : IN     LC3b_reg ;
      clk         : IN     std_logic ;
      dest        : IN     LC3b_reg ;
      RFAout      : OUT    LC3b_word ;
      RFBout      : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT STB_Logic
   PORT (
      Input_data  : IN     LC3b_word ;
      Output_data : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT StoreMux
   PORT (
      SrcA        : IN     LC3b_reg ;
      StoreSR     : IN     std_logic ;
      dest        : IN     LC3b_reg ;
      StoreMuxout : OUT    LC3b_reg 
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
   COMPONENT ZEXT8
   PORT (
      trap8    : IN     LC3b_trapvect8 ;
      zext8out : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADJ11 USE ENTITY ece411.ADJ11;
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : ALU USE ENTITY ece411.ALU;
   FOR ALL : BRadd USE ENTITY ece411.BRadd;
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : IMMED5 USE ENTITY ece411.IMMED5;
   FOR ALL : IMMED6 USE ENTITY ece411.IMMED6;
   FOR ALL : IR USE ENTITY ece411.IR;
   FOR ALL : LDB_Logic USE ENTITY ece411.LDB_Logic;
   FOR ALL : LSBADDR USE ENTITY ece411.LSBADDR;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZPsplit USE ENTITY ece411.NZPsplit;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : RegFile USE ENTITY ece411.RegFile;
   FOR ALL : STB_Logic USE ENTITY ece411.STB_Logic;
   FOR ALL : StoreMux USE ENTITY ece411.StoreMux;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : ZEXT8 USE ENTITY ece411.ZEXT8;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- Dataout = MDRout
   DATAOUT <= MDRout;
   R7 <= "111";
                                         


   -- Instance port mappings.
   aADJ11 : ADJ11
      PORT MAP (
         offset11 => offset11,
         ADJ11out => ADJ11out
      );
   aADJ6 : ADJ6
      PORT MAP (
         index6  => index6,
         ADJ6out => ADJ6out
      );
   aADJ9 : ADJ9
      PORT MAP (
         offset9 => offset9,
         ADJ9out => ADJ9out
      );
   aALU : ALU
      PORT MAP (
         ALUMuxout => ALUMuxout,
         ALUop     => ALUop,
         RFAout    => F6,
         ALUout    => ALUout
      );
   aBRadd : BRadd
      PORT MAP (
         ADJ9out  => F11,
         PCout    => PCout,
         BRaddout => BRaddout
      );
   aGenCC : GenCC
      PORT MAP (
         RFMuxout => F2,
         GenCCout => GenCCout
      );
   aIMM5 : IMMED5
      PORT MAP (
         imm5    => imm5,
         imm5ext => imm5ext
      );
   aIMM6 : IMMED6
      PORT MAP (
         imm6    => index6,
         imm6ext => imm6ext
      );
   aIR : IR
      PORT MAP (
         LoadIR   => LoadIR,
         MDRout   => MDRout,
         clk      => clk,
         Opcode   => Opcode,
         SrcA     => SrcA,
         SrcB     => SrcB,
         dest     => dest,
         index6   => index6,
         offset9  => offset9,
         offset11 => offset11,
         trap8    => trap8,
         imm5     => imm5,
         d        => d,
         bit11    => bit11_internal,
         a        => a
      );
   aLDB_Logic : LDB_Logic
      PORT MAP (
         ADDR_LSB    => LSB_internal,
         Input_addr  => F1,
         Output_addr => Output_addr
      );
   aLSBADDR : LSBADDR
      PORT MAP (
         Address => ADDRESS_internal,
         LSB     => LSB_internal
      );
   aNZP : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         clk      => clk,
         n        => n,
         p        => p,
         z        => z
      );
   aNZPsplit : NZPsplit
      PORT MAP (
         dest   => dest,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   aPlus2 : Plus2
      PORT MAP (
         PCout      => PCout,
         PCPlus2out => PCPlus2out
      );
   MAR : Reg16
      PORT MAP (
         Input  => MarMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadMAR,
         Output => ADDRESS_internal
      );
   MDR : Reg16
      PORT MAP (
         Input  => F4,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadMDR,
         Output => MDRout
      );
   PC : Reg16
      PORT MAP (
         Input  => F12,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadPC,
         Output => PCout
      );
   aRegFile : RegFile
      PORT MAP (
         RESET_L     => RESET_L,
         RFMuxout    => RFMuxout,
         RegWrite    => RegWrite,
         SrcB        => SrcB,
         StoreMuxout => StoreMuxout,
         clk         => clk,
         dest        => StoreMuxout1,
         RFAout      => RFAout,
         RFBout      => RFBout
      );
   aSTB_Logic : STB_Logic
      PORT MAP (
         Input_data  => F3,
         Output_data => Output_data
      );
   R7Mux : StoreMux
      PORT MAP (
         SrcA        => R7,
         StoreSR     => R7MuxSel,
         dest        => dest,
         StoreMuxout => StoreMuxout1
      );
   aStoreMux : StoreMux
      PORT MAP (
         SrcA        => SrcA,
         StoreSR     => StoreSR,
         dest        => dest,
         StoreMuxout => StoreMuxout
      );
   ADJMux : WordMux2
      PORT MAP (
         A   => ADJ9out,
         B   => ADJ11out,
         Sel => JSRSel,
         F   => F11
      );
   ALUMux : WordMux2
      PORT MAP (
         A   => RFBout,
         B   => IMM,
         Sel => ALUMuxSel,
         F   => ALUMuxout
      );
   BRMux : WordMux2
      PORT MAP (
         A   => PCPlus2out,
         B   => BRaddout,
         Sel => PCMuxSel,
         F   => PCMuxout
      );
   ByteSelMux : WordMux2
      PORT MAP (
         A   => F1,
         B   => Output_addr,
         Sel => LDBSelMux,
         F   => F2
      );
   ByteSelMux2 : WordMux2
      PORT MAP (
         A   => F3,
         B   => Output_data,
         Sel => STBSelMux,
         F   => F4
      );
   IMMEDMUX : WordMux2
      PORT MAP (
         A   => imm5ext,
         B   => imm6ext,
         Sel => IMM6MuxSel,
         F   => F
      );
   JMPMux : WordMux2
      PORT MAP (
         A   => PCMuxout,
         B   => RFAout,
         Sel => JMPSelMux,
         F   => F8
      );
   JSRRMux : WordMux2
      PORT MAP (
         A   => RFAout,
         B   => BRaddout,
         Sel => bit11_internal,
         F   => F9
      );
   LEASelMux : WordMux2
      PORT MAP (
         A   => RFAout,
         B   => BRaddout,
         Sel => LEAMuxSel,
         F   => F6
      );
   MARMux : WordMux2
      PORT MAP (
         A   => F7,
         B   => F5,
         Sel => MARMuxSel,
         F   => MarMuxout
      );
   MDRMux : WordMux2
      PORT MAP (
         A   => DATAIN,
         B   => ALUout,
         Sel => MDRMuxSel,
         F   => F3
      );
   MDR_ALU_SEL : WordMux2
      PORT MAP (
         A   => ALUout,
         B   => MDRout,
         Sel => MDRBusSel,
         F   => F5
      );
   PCLoadMux : WordMux2
      PORT MAP (
         A   => F8,
         B   => F9,
         Sel => JSRSel,
         F   => F10
      );
   PCMDRMux : WordMux2
      PORT MAP (
         A   => F10,
         B   => MDRout,
         Sel => PCMDRMuxSel,
         F   => F12
      );
   PCTOREGMUX : WordMux2
      PORT MAP (
         A   => F2,
         B   => PCout,
         Sel => PCTOREGMuxSel,
         F   => RFMuxout
      );
   RFMux : WordMux2
      PORT MAP (
         A   => MDRout,
         B   => ALUout,
         Sel => RFMuxSel,
         F   => F1
      );
   SEXTMUX : WordMux2
      PORT MAP (
         A   => ADJ6out,
         B   => F,
         Sel => SEXTMuxSel,
         F   => IMM
      );
   TRAPMux : WordMux2
      PORT MAP (
         A   => PCout,
         B   => zext8out,
         Sel => TRAPMuxSel,
         F   => F7
      );
   U_0 : ZEXT8
      PORT MAP (
         trap8    => trap8,
         zext8out => zext8out
      );

   -- Implicit buffered output assignments
   ADDRESS <= ADDRESS_internal;
   LSB     <= LSB_internal;
   bit11   <= bit11_internal;

END struct;
