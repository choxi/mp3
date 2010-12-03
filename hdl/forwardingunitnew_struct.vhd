-- VHDL Entity ece411.ForwardingUnitNew.symbol
--
-- Created:
--          by - tkalbar2.stdt (gllnx25.ews.illinois.edu)
--          at - 21:58:10 12/02/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ForwardingUnitNew IS
   PORT( 
      DR_EX           : IN     lc3b_reg;
      DR_MEM          : IN     lc3b_reg;
      DestReg         : IN     lc3b_reg;
      ImmSel_EX       : IN     std_logic;
      RegWrite        : IN     std_logic;
      RegWrite_MEM    : IN     std_logic;
      SR1_EX          : IN     lc3b_reg;
      SR2_EX          : IN     lc3b_reg;
      Write_EX        : IN     std_logic;
      FUMux1_sel      : OUT    std_logic;
      FUMux2_sel      : OUT    std_logic;
      FUTypeWB1       : OUT    std_logic;
      FUTypeWB2       : OUT    std_logic;
      FUTypeWB_DR     : OUT    std_logic;
      STR_dataout_sel : OUT    std_logic
   );

-- Declarations

END ForwardingUnitNew ;

--
-- VHDL Architecture ece411.ForwardingUnitNew.struct
--
-- Created:
--          by - tkalbar2.stdt (gllnx25.ews.illinois.edu)
--          at - 21:58:11 12/02/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF ForwardingUnitNew IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F   : std_logic;
   SIGNAL F1  : std_logic;
   SIGNAL F2  : std_logic;
   SIGNAL F3  : std_logic;
   SIGNAL F4  : std_logic;
   SIGNAL F5  : std_logic;
   SIGNAL F6  : std_logic;
   SIGNAL F7  : std_logic;
   SIGNAL F8  : std_logic;
   SIGNAL s   : std_logic;
   SIGNAL s1  : std_logic;
   SIGNAL s10 : std_logic;
   SIGNAL s2  : std_logic;
   SIGNAL s3  : std_logic;
   SIGNAL s4  : std_logic;
   SIGNAL s5  : std_logic;
   SIGNAL s6  : std_logic;
   SIGNAL s7  : std_logic;
   SIGNAL s8  : std_logic;
   SIGNAL s9  : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL FUTypeWB1_internal   : std_logic;
   SIGNAL FUTypeWB2_internal   : std_logic;
   SIGNAL FUTypeWB_DR_internal : std_logic;


   -- Component Declarations
   COMPONENT RegComp
   PORT (
      A : IN     lc3b_reg ;
      B : IN     lc3b_reg ;
      F : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT and2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT and3
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      c : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT mynot
   PORT (
      a : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT nand2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
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
   FOR ALL : RegComp USE ENTITY ece411.RegComp;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : and3 USE ENTITY ece411.and3;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   FOR ALL : nand2 USE ENTITY ece411.nand2;
   FOR ALL : or2 USE ENTITY ece411.or2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : RegComp
      PORT MAP (
         A => SR1_EX,
         B => DR_MEM,
         F => F
      );
   U_3 : RegComp
      PORT MAP (
         A => SR1_EX,
         B => DestReg,
         F => F1
      );
   U_7 : RegComp
      PORT MAP (
         A => SR1_EX,
         B => DR_MEM,
         F => F2
      );
   U_9 : RegComp
      PORT MAP (
         A => SR2_EX,
         B => DR_MEM,
         F => F3
      );
   U_12 : RegComp
      PORT MAP (
         A => SR2_EX,
         B => DestReg,
         F => F4
      );
   U_14 : RegComp
      PORT MAP (
         A => SR2_EX,
         B => DR_MEM,
         F => F5
      );
   U_17 : RegComp
      PORT MAP (
         A => DR_MEM,
         B => DR_EX,
         F => F6
      );
   U_19 : RegComp
      PORT MAP (
         A => DestReg,
         B => DR_EX,
         F => F7
      );
   U_22 : RegComp
      PORT MAP (
         A => DR_MEM,
         B => DR_EX,
         F => F8
      );
   U_1 : and2
      PORT MAP (
         a => RegWrite_MEM,
         b => F,
         s => s3
      );
   U_5 : and2
      PORT MAP (
         a => s1,
         b => s2,
         s => FUTypeWB1_internal
      );
   U_16 : and2
      PORT MAP (
         a => s5,
         b => s6,
         s => FUTypeWB2_internal
      );
   U_24 : and2
      PORT MAP (
         a => s9,
         b => s8,
         s => FUTypeWB_DR_internal
      );
   U_26 : and2
      PORT MAP (
         a => RegWrite,
         b => F1,
         s => s1
      );
   U_10 : and3
      PORT MAP (
         a => RegWrite_MEM,
         b => F3,
         c => s,
         s => s4
      );
   U_13 : and3
      PORT MAP (
         a => RegWrite,
         b => F4,
         c => s,
         s => s5
      );
   U_18 : and3
      PORT MAP (
         a => s7,
         b => F6,
         c => RegWrite_MEM,
         s => s10
      );
   U_20 : and3
      PORT MAP (
         a => s7,
         b => F7,
         c => RegWrite,
         s => s9
      );
   U_4 : mynot
      PORT MAP (
         a => ImmSel_EX,
         s => s
      );
   U_21 : mynot
      PORT MAP (
         a => Write_EX,
         s => s7
      );
   U_6 : nand2
      PORT MAP (
         a => RegWrite_MEM,
         b => F2,
         s => s2
      );
   U_15 : nand2
      PORT MAP (
         a => RegWrite_MEM,
         b => F5,
         s => s6
      );
   U_23 : nand2
      PORT MAP (
         a => RegWrite_MEM,
         b => F8,
         s => s8
      );
   U_8 : or2
      PORT MAP (
         a => s3,
         b => FUTypeWB1_internal,
         s => FUMux1_sel
      );
   U_11 : or2
      PORT MAP (
         a => s4,
         b => FUTypeWB2_internal,
         s => FUMux2_sel
      );
   U_25 : or2
      PORT MAP (
         a => s10,
         b => FUTypeWB_DR_internal,
         s => STR_dataout_sel
      );

   -- Implicit buffered output assignments
   FUTypeWB1   <= FUTypeWB1_internal;
   FUTypeWB2   <= FUTypeWB2_internal;
   FUTypeWB_DR <= FUTypeWB_DR_internal;

END struct;
