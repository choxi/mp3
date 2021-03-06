-- VHDL Entity ece411.StallUnit.interface
--
-- Created:
--          by - tkalbar2.stdt (eelnx25.ews.illinois.edu)
--          at - 16:05:28 12/03/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StallUnit IS
   PORT( 
      DR_EX        : IN     lc3b_reg;
      D_MREAD_L    : IN     std_logic;
      D_MRESP_H    : IN     std_logic;
      D_MWRITE_L   : IN     std_logic;
      I_MRESP_H    : IN     std_logic;
      RESET_L      : IN     std_logic;
      Read_EX      : IN     std_logic;
      SR1          : IN     lc3b_reg;
      SR2          : IN     lc3b_reg;
      ZextSel_WB   : IN     std_logic;
      brSel        : IN     std_logic;
      clk          : IN     std_logic;
      indirect_MEM : IN     std_logic;
      isSTI_MEM    : IN     std_logic;
      STIMuxSel    : OUT    std_logic;
      accessState  : OUT    std_logic;
      fetch        : OUT    std_logic;
      loadUse      : OUT    std_logic;
      load_latch   : OUT    std_logic
   );

-- Declarations

END StallUnit ;

--
-- VHDL Architecture ece411.StallUnit.struct
--
-- Created:
--          by - tkalbar2.stdt (eelnx25.ews.illinois.edu)
--          at - 16:05:28 12/03/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF StallUnit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F               : std_logic;
   SIGNAL F1              : std_logic;
   SIGNAL F2              : std_logic;
   SIGNAL ZextSel_EX      : std_logic;
   SIGNAL b               : std_logic;
   SIGNAL fetch_gate      : std_logic;
   SIGNAL load_latch_data : std_logic;
   SIGNAL s               : std_logic;
   SIGNAL s1              : std_logic;
   SIGNAL s2              : std_logic;
   SIGNAL s4              : std_logic;
   SIGNAL state           : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL loadUse_internal : std_logic;


   -- Component Declarations
   COMPONENT DataStallUnit
   PORT (
      D_MREAD_L  : IN     std_logic ;
      D_MWRITE_L : IN     std_logic ;
      D_RESP_H   : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      indirect   : IN     std_logic ;
      isSTI      : IN     std_logic ;
      STIMuxSel  : OUT    std_logic ;
      load_latch : OUT    std_logic ;
      state      : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT FetchHitGate
   PORT (
      clk        : IN     std_logic ;
      fetch_gate : OUT    std_logic 
   );
   END COMPONENT;
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
   COMPONENT mynot
   PORT (
      a : IN     std_logic ;
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
   COMPONENT or4
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : IN     std_logic ;
      F : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : DataStallUnit USE ENTITY ece411.DataStallUnit;
   FOR ALL : FetchHitGate USE ENTITY ece411.FetchHitGate;
   FOR ALL : RegComp USE ENTITY ece411.RegComp;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   FOR ALL : or2 USE ENTITY ece411.or2;
   FOR ALL : or4 USE ENTITY ece411.or4;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   accessState <= state;                                   


   -- Instance port mappings.
   U_12 : DataStallUnit
      PORT MAP (
         D_MREAD_L  => D_MREAD_L,
         D_MWRITE_L => D_MWRITE_L,
         D_RESP_H   => D_MRESP_H,
         RESET_L    => RESET_L,
         clk        => clk,
         indirect   => indirect_MEM,
         isSTI      => isSTI_MEM,
         STIMuxSel  => STIMuxSel,
         load_latch => load_latch_data,
         state      => state
      );
   aFetchHitGate : FetchHitGate
      PORT MAP (
         clk        => clk,
         fetch_gate => fetch_gate
      );
   U_4 : RegComp
      PORT MAP (
         A => SR1,
         B => DR_EX,
         F => F
      );
   U_5 : RegComp
      PORT MAP (
         A => DR_EX,
         B => SR2,
         F => F1
      );
   U_0 : and2
      PORT MAP (
         a => load_latch_data,
         b => s,
         s => b
      );
   U_7 : and2
      PORT MAP (
         a => s1,
         b => s2,
         s => loadUse_internal
      );
   U_8 : and2
      PORT MAP (
         a => F2,
         b => I_MRESP_H,
         s => s
      );
   U_13 : and2
      PORT MAP (
         a => load_latch_data,
         b => I_MRESP_H,
         s => load_latch
      );
   U_9 : mynot
      PORT MAP (
         a => loadUse_internal,
         s => s4
      );
   U_11 : mynot
      PORT MAP (
         a => Read_EX,
         s => s2
      );
   U_6 : or2
      PORT MAP (
         a => F,
         b => F1,
         s => s1
      );
   U_10 : or2
      PORT MAP (
         a => fetch_gate,
         b => b,
         s => fetch
      );
   U_1 : or4
      PORT MAP (
         A => s4,
         B => brSel,
         C => ZextSel_WB,
         D => ZextSel_WB,
         F => F2
      );

   -- Implicit buffered output assignments
   loadUse <= loadUse_internal;

END struct;
