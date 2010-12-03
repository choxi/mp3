-- VHDL Entity ece411.Memory3.symbol
--
-- Created:
--          by - cjpark3.stdt (eelnx29.ews.illinois.edu)
--          at - 16:17:30 12/03/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Memory3 IS
   PORT( 
      D_ADDRESS   : IN     LC3b_word;
      D_DATAIN    : IN     LC3b_word;
      D_MREAD_L   : IN     std_logic;
      D_MWRITEH_L : IN     std_logic;
      D_MWRITEL_L : IN     std_logic;
      I_ADDRESS   : IN     LC3b_word;
      I_MREAD_L   : IN     std_logic;
      RESET_L     : IN     std_logic;
      clk         : IN     std_logic;
      D_DATAOUT   : OUT    LC3b_word;
      D_MRESP_H   : OUT    std_logic;
      I_DATAOUT   : OUT    LC3b_word;
      I_MRESP_H   : OUT    std_logic
   );

-- Declarations

END Memory3 ;

--
-- VHDL Architecture ece411.Memory3.struct
--
-- Created:
--          by - cjpark3.stdt (eelnx29.ews.illinois.edu)
--          at - 16:17:30 12/03/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Memory3 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL MWRITEH_L   : std_logic;
   SIGNAL MWRITEL_L   : std_logic;
   SIGNAL cachedatain : LC3b_word;
   SIGNAL s           : std_logic;


   -- Component Declarations
   COMPONENT MagicMemory
   PORT (
      D_ADDRESS  : IN     LC3b_word ;
      D_DATAIN   : IN     LC3b_word ;
      D_MREAD_L  : IN     std_logic ;
      D_MWRITE_L : IN     std_logic ;
      I_ADDRESS  : IN     LC3b_word ;
      I_MREAD_L  : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      D_DATAOUT  : OUT    LC3b_word ;
      D_MRESP_H  : OUT    std_logic ;
      I_DATAOUT  : OUT    LC3b_word ;
      I_MRESP_H  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT and2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MagicMemory USE ENTITY ece411.MagicMemory;
   FOR ALL : and2 USE ENTITY ece411.and2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   cachedatain <= (OTHERS => 'X');
   MWRITEH_L <= '1';
   MWRITEL_L <= '1';                                       


   -- Instance port mappings.
   U_0 : MagicMemory
      PORT MAP (
         D_ADDRESS  => D_ADDRESS,
         D_DATAIN   => D_DATAIN,
         D_MREAD_L  => D_MREAD_L,
         D_MWRITE_L => s,
         I_ADDRESS  => I_ADDRESS,
         I_MREAD_L  => I_MREAD_L,
         RESET_L    => RESET_L,
         D_DATAOUT  => D_DATAOUT,
         D_MRESP_H  => D_MRESP_H,
         I_DATAOUT  => I_DATAOUT,
         I_MRESP_H  => I_MRESP_H
      );
   U_1 : and2
      PORT MAP (
         a => D_MWRITEH_L,
         b => D_MWRITEL_L,
         s => s
      );

END struct;
