-- VHDL Entity ece411.ArbiterControl.symbol
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 20:44:34 11/10/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ArbiterControl IS
   PORT( 
      PMRESP_H : IN     std_logic;
      RESET_L  : IN     std_logic;
      accessD  : IN     std_logic;
      accessI  : IN     std_logic;
      DRESP_H  : OUT    std_logic;
      IRESP_H  : OUT    std_logic;
      state    : OUT    std_logic
   );

-- Declarations

END ArbiterControl ;

--
-- VHDL Architecture ece411.ArbiterControl.struct
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 20:44:34 11/10/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF ArbiterControl IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL NOT_PMRESP_H : std_logic;
   SIGNAL NOT_missD    : std_logic;
   SIGNAL NOT_state    : std_logic;
   SIGNAL pre_state    : std_logic;
   SIGNAL s            : std_logic;
   SIGNAL s1           : std_logic;
   SIGNAL s2           : std_logic;
   SIGNAL s3           : std_logic;

   -- Implicit buffer signal declarations
   SIGNAL state_internal : std_logic;


   -- Component Declarations
   COMPONENT RESETTER
   PORT (
      PMRESP_H  : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      pre_state : IN     std_logic ;
      state     : OUT    std_logic 
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
   FOR ALL : RESETTER USE ENTITY ece411.RESETTER;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   FOR ALL : or4 USE ENTITY ece411.or4;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aRESETTER : RESETTER
      PORT MAP (
         PMRESP_H  => PMRESP_H,
         RESET_L   => RESET_L,
         pre_state => pre_state,
         state     => state_internal
      );
   U_0 : and2
      PORT MAP (
         a => NOT_state,
         b => PMRESP_H,
         s => DRESP_H
      );
   U_1 : and2
      PORT MAP (
         a => accessI,
         b => state_internal,
         s => s1
      );
   U_2 : and2
      PORT MAP (
         a => NOT_missD,
         b => NOT_PMRESP_H,
         s => s
      );
   U_3 : and2
      PORT MAP (
         a => NOT_missD,
         b => state_internal,
         s => s2
      );
   U_7 : and2
      PORT MAP (
         a => PMRESP_H,
         b => state_internal,
         s => s3
      );
   U_8 : and2
      PORT MAP (
         a => state_internal,
         b => PMRESP_H,
         s => IRESP_H
      );
   U_4 : mynot
      PORT MAP (
         a => PMRESP_H,
         s => NOT_PMRESP_H
      );
   U_5 : mynot
      PORT MAP (
         a => accessD,
         s => NOT_missD
      );
   U_9 : mynot
      PORT MAP (
         a => state_internal,
         s => NOT_state
      );
   U_6 : or4
      PORT MAP (
         A => s,
         B => s1,
         C => s2,
         D => s3,
         F => pre_state
      );

   -- Implicit buffered output assignments
   state <= state_internal;

END struct;
