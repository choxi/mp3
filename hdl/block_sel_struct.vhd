-- VHDL Entity ece411.block_sel.symbol
--
-- Created:
--          by - tkalbar2.ece411_G2 (eelnx34.ews.illinois.edu)
--          at - 23:54:27 10/19/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY block_sel IS
   PORT( 
      MWH          : IN     std_logic;
      MWL          : IN     std_logic;
      blockdatain  : IN     lc3b_word;
      dataout      : IN     lc3b_word;
      sel          : IN     std_logic;
      blockdataout : OUT    lc3b_word
   );

-- Declarations

END block_sel ;

--
-- VHDL Architecture ece411.block_sel.struct
--
-- Created:
--          by - tkalbar2.ece411_G2 (eelnx34.ews.illinois.edu)
--          at - 23:54:27 10/19/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF block_sel IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL F          : LC3b_byte;
   SIGNAL F1         : LC3b_byte;
   SIGNAL high_b_new : lc3b_byte;
   SIGNAL high_b_old : lc3b_byte;
   SIGNAL low_b_new  : lc3b_byte;
   SIGNAL low_b_old  : lc3b_byte;
   SIGNAL s          : std_logic;
   SIGNAL s1         : std_logic;
   SIGNAL s2         : std_logic;
   SIGNAL s3         : std_logic;


   -- Component Declarations
   COMPONENT ByteMux2
   PORT (
      A   : IN     LC3b_byte ;
      B   : IN     LC3b_byte ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_byte 
   );
   END COMPONENT;
   COMPONENT and2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT hl_joiner
   PORT (
      high_b : IN     lc3b_byte ;
      low_b  : IN     lc3b_byte ;
      word   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT hl_splitter
   PORT (
      word   : IN     lc3b_word ;
      high_b : OUT    lc3b_byte ;
      low_b  : OUT    lc3b_byte 
   );
   END COMPONENT;
   COMPONENT mynot
   PORT (
      a : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ByteMux2 USE ENTITY ece411.ByteMux2;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : hl_joiner USE ENTITY ece411.hl_joiner;
   FOR ALL : hl_splitter USE ENTITY ece411.hl_splitter;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_4 : ByteMux2
      PORT MAP (
         A   => high_b_old,
         B   => high_b_new,
         Sel => s3,
         F   => F
      );
   U_5 : ByteMux2
      PORT MAP (
         A   => low_b_old,
         B   => low_b_new,
         Sel => s2,
         F   => F1
      );
   U_2 : and2
      PORT MAP (
         a => sel,
         b => s1,
         s => s2
      );
   U_3 : and2
      PORT MAP (
         a => sel,
         b => s,
         s => s3
      );
   U_6 : hl_joiner
      PORT MAP (
         high_b => F,
         low_b  => F1,
         word   => blockdataout
      );
   fromnew : hl_splitter
      PORT MAP (
         word   => dataout,
         high_b => high_b_new,
         low_b  => low_b_new
      );
   fromold : hl_splitter
      PORT MAP (
         word   => blockdatain,
         high_b => high_b_old,
         low_b  => low_b_old
      );
   U_0 : mynot
      PORT MAP (
         a => MWH,
         s => s
      );
   U_1 : mynot
      PORT MAP (
         a => MWL,
         s => s1
      );

END struct;
