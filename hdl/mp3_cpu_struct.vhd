-- VHDL Entity ece411.mp3_CPU.symbol
--
-- Created:
--          by - rchoxi2.stdt (eelnx32.ews.illinois.edu)
--          at - 23:44:02 10/27/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp3_CPU IS
   PORT( 
      RESET_L : IN     std_logic;
      clk     : IN     std_logic
   );

-- Declarations

END mp3_CPU ;

--
-- VHDL Architecture ece411.mp3_CPU.struct
--
-- Created:
--          by - rchoxi2.stdt (eelnx32.ews.illinois.edu)
--          at - 23:44:02 10/27/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF mp3_CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL D_ADDRESS  : LC3b_word;
   SIGNAL D_DATAIN   : LC3b_word;
   SIGNAL D_DATAOUT  : LC3b_word;
   SIGNAL D_MREAD_L  : std_logic;
   SIGNAL D_MRESP_H  : std_logic;
   SIGNAL D_MWRITE_L : std_logic;
   SIGNAL I_DATAOUT  : LC3b_word;
   SIGNAL I_MREAD_L  : std_logic;
   SIGNAL I_MRESP_H  : std_logic;
   SIGNAL PCout      : lc3b_word;


   -- Component Declarations
   COMPONENT Memory3
   PORT (
      D_ADDRESS  : IN     LC3b_word ;
      D_DATAIN   : IN     LC3b_word ;
      D_MREAD_L  : IN     std_logic ;
      D_MWRITE_L : IN     std_logic ;
      I_ADDRESS  : IN     LC3b_word ;
      I_MREAD_L  : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      D_DATAOUT  : OUT    LC3b_word ;
      D_MRESP_H  : OUT    std_logic ;
      I_DATAOUT  : OUT    LC3b_word ;
      I_MRESP_H  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT mp3_datapath
   PORT (
      D_DATAOUT  : IN     LC3b_word ;
      D_MRESP_H  : IN     std_logic ;
      I_MRESP_H  : IN     std_logic ;
      Instrin    : IN     lc3b_word ;
      RESET_L    : IN     std_logic ;
      clk        : IN     std_logic ;
      D_ADDRESS  : OUT    LC3b_word ;
      D_DATAIN   : OUT    LC3b_word ;
      D_MREAD_L  : OUT    std_logic ;
      D_MWRITE_L : OUT    std_logic ;
      I_MREAD_L  : OUT    std_logic ;
      PCout      : OUT    lc3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Memory3 USE ENTITY ece411.Memory3;
   FOR ALL : mp3_datapath USE ENTITY ece411.mp3_datapath;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   memory : Memory3
      PORT MAP (
         D_ADDRESS  => D_ADDRESS,
         D_DATAIN   => D_DATAIN,
         D_MREAD_L  => D_MREAD_L,
         D_MWRITE_L => D_MWRITE_L,
         I_ADDRESS  => PCout,
         I_MREAD_L  => I_MREAD_L,
         RESET_L    => RESET_L,
         clk        => clk,
         D_DATAOUT  => D_DATAOUT,
         D_MRESP_H  => D_MRESP_H,
         I_DATAOUT  => I_DATAOUT,
         I_MRESP_H  => I_MRESP_H
      );
   datapath : mp3_datapath
      PORT MAP (
         D_DATAOUT  => D_DATAOUT,
         D_MRESP_H  => D_MRESP_H,
         I_MRESP_H  => I_MRESP_H,
         Instrin    => I_DATAOUT,
         RESET_L    => RESET_L,
         clk        => clk,
         D_ADDRESS  => D_ADDRESS,
         D_DATAIN   => D_DATAIN,
         D_MREAD_L  => D_MREAD_L,
         D_MWRITE_L => D_MWRITE_L,
         I_MREAD_L  => I_MREAD_L,
         PCout      => PCout
      );

END struct;
