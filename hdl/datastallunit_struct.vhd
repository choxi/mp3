-- VHDL Entity ece411.DataStallUnit.symbol
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 00:07:03 11/11/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DataStallUnit IS
   PORT( 
      D_MREAD_L  : IN     std_logic;
      D_MWRITE_L : IN     std_logic;
      D_RESP_H   : IN     std_logic;
      RESET_L    : IN     std_logic;
      clk        : IN     std_logic;
      indirect   : IN     std_logic;
      isSTI      : IN     std_logic;
      STIMuxSel  : OUT    std_logic;
      load_latch : OUT    std_logic;
      state      : OUT    std_logic
   );

-- Declarations

END DataStallUnit ;

--
-- VHDL Architecture ece411.DataStallUnit.struct
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 00:07:03 11/11/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF DataStallUnit IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL load         : std_logic;
   SIGNAL notD_RESP_H  : std_logic;
   SIGNAL notState     : std_logic;
   SIGNAL not_access   : std_logic;
   SIGNAL not_indirect : std_logic;
   SIGNAL nxtState     : std_logic;
   SIGNAL s            : std_logic;
   SIGNAL s1           : std_logic;
   SIGNAL s2           : std_logic;
   SIGNAL s3           : std_logic;
   SIGNAL s4           : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL state_internal : std_logic;


   -- Component Declarations
   COMPONENT Reg1
   PORT (
      Input  : IN     std_logic ;
      RESET  : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      Output : OUT    std_logic 
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
   FOR ALL : Reg1 USE ENTITY ece411.Reg1;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   FOR ALL : or2 USE ENTITY ece411.or2;
   FOR ALL : or4 USE ENTITY ece411.or4;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   load <= '1';                                        


   -- Instance port mappings.
   Q : Reg1
      PORT MAP (
         Input  => nxtState,
         RESET  => RESET_L,
         clk    => clk,
         load   => load,
         Output => state_internal
      );
   U_0 : and2
      PORT MAP (
         a => D_RESP_H,
         b => not_indirect,
         s => s3
      );
   U_2 : and2
      PORT MAP (
         a => not_indirect,
         b => state_internal,
         s => s
      );
   U_6 : and2
      PORT MAP (
         a => state_internal,
         b => notD_RESP_H,
         s => s1
      );
   U_9 : and2
      PORT MAP (
         a => D_RESP_H,
         b => notState,
         s => s2
      );
   U_11 : and2
      PORT MAP (
         a => state_internal,
         b => isSTI,
         s => STIMuxSel
      );
   U_12 : and2
      PORT MAP (
         a => D_MREAD_L,
         b => D_MWRITE_L,
         s => not_access
      );
   U_1 : mynot
      PORT MAP (
         a => indirect,
         s => not_indirect
      );
   U_7 : mynot
      PORT MAP (
         a => state_internal,
         s => notState
      );
   U_8 : mynot
      PORT MAP (
         a => D_RESP_H,
         s => notD_RESP_H
      );
   U_10 : or2
      PORT MAP (
         a => s3,
         b => s2,
         s => s4
      );
   U_13 : or2
      PORT MAP (
         a => s4,
         b => not_access,
         s => load_latch
      );
   U_3 : or4
      PORT MAP (
         A => s3,
         B => s,
         C => s1,
         D => s2,
         F => nxtState
      );

   -- Implicit buffered output assignments
   state <= state_internal;

END struct;