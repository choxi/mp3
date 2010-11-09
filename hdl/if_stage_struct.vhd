-- VHDL Entity ece411.IF_STAGE.interface
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 02:16:02 11/09/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IF_STAGE IS
   PORT( 
      Instrin     : IN     lc3b_word;
      RESET_L     : IN     std_logic;
      address_MEM : IN     lc3b_word;
      brSel       : IN     std_logic;
      clk         : IN     std_logic;
      fetch       : IN     std_logic;
      Instrout    : OUT    lc3b_word;
      Opcode_IF   : OUT    lc3b_opcode;
      PC_IF       : OUT    lc3b_word;
      PCout       : OUT    lc3b_word
   );

-- Declarations

END IF_STAGE ;

--
-- VHDL Architecture ece411.IF_STAGE.struct
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 02:16:02 11/09/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF IF_STAGE IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F : LC3b_word;

   -- Implicit buffer signal declarations
   SIGNAL PC_IF_internal : lc3b_word;
   SIGNAL PCout_internal : lc3b_word;


   -- Component Declarations
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
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 2 Instr
   Instrout <= Instrin;  
   Opcode_IF <= Instrin(15 DOWNTO 12);                                     


   -- Instance port mappings.
   PCPlus2 : Plus2
      PORT MAP (
         PCout      => PCout_internal,
         PCPlus2out => PC_IF_internal
      );
   PC : Reg16
      PORT MAP (
         Input  => F,
         RESET  => RESET_L,
         clk    => clk,
         load   => fetch,
         Output => PCout_internal
      );
   brMux : WordMux2
      PORT MAP (
         A   => PC_IF_internal,
         B   => address_MEM,
         Sel => brSel,
         F   => F
      );

   -- Implicit buffered output assignments
   PC_IF <= PC_IF_internal;
   PCout <= PCout_internal;

END struct;
