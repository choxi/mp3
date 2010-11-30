-- VHDL Entity ece411.L1_Cache.symbol
--
-- Created:
--          by - tkalbar2.stdt (gllnx19.ews.illinois.edu)
--          at - 23:41:42 11/29/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L1_Cache IS
   PORT( 
      ADDRESS      : IN     LC3b_word;
      MREAD_L      : IN     std_logic;
      MWRITEH_L    : IN     std_logic;
      MWRITEL_L    : IN     std_logic;
      RESET_L      : IN     std_logic;
      cachedatain  : IN     LC3b_word;
      clk          : IN     std_logic;
      pmdataout    : IN     LC3b_oword;
      pmresp_h     : IN     std_logic;
      MRESP_H      : OUT    std_logic;
      PMADDRESS    : OUT    LC3b_word;
      PMREAD_L     : OUT    std_logic;
      PMWRITE_L    : OUT    std_logic;
      cachedataout : OUT    LC3b_word;
      pmdatain     : OUT    LC3b_oword
   );

-- Declarations

END L1_Cache ;

--
-- VHDL Architecture ece411.L1_Cache.struct
--
-- Created:
--          by - tkalbar2.stdt (gllnx19.ews.illinois.edu)
--          at - 23:41:42 11/29/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF L1_Cache IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL dirty        : std_logic;
   SIGNAL in_idlehit   : std_logic;
   SIGNAL in_load      : std_logic;
   SIGNAL in_writeback : std_logic;
   SIGNAL miss         : std_logic;


   -- Component Declarations
   COMPONENT L1_Controller
   PORT (
      RESET_L      : IN     std_logic ;
      clk          : IN     std_logic ;
      dirty        : IN     std_logic ;
      miss         : IN     std_logic ;
      pmresp_h     : IN     std_logic ;
      PMREAD_L     : OUT    std_logic ;
      PMWRITE_L    : OUT    std_logic ;
      in_idlehit   : OUT    std_logic ;
      in_load      : OUT    std_logic ;
      in_writeback : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT L1_Datapath
   PORT (
      ADDRESS      : IN     LC3b_word ;
      DATAIN       : IN     LC3b_word ;
      MREAD_L      : IN     std_logic ;
      MWRITEH_L    : IN     std_logic ;
      MWRITEL_L    : IN     std_logic ;
      RESET_L      : IN     std_logic ;
      clk          : IN     std_logic ;
      in_idlehit   : IN     std_logic ;
      in_load      : IN     std_logic ;
      in_writeback : IN     std_logic ;
      pmdataout    : IN     LC3b_oword ;
      pmresp_h     : IN     std_logic ;
      DATAOUT      : OUT    LC3b_word ;
      MRESP_H      : OUT    std_logic ;
      PMADDRESS    : OUT    LC3b_word ;
      dirty        : OUT    std_logic ;
      miss         : OUT    std_logic ;
      pmdatain     : OUT    LC3b_oword 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : L1_Controller USE ENTITY ece411.L1_Controller;
   FOR ALL : L1_Datapath USE ENTITY ece411.L1_Datapath;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aL1_Controller : L1_Controller
      PORT MAP (
         RESET_L      => RESET_L,
         clk          => clk,
         dirty        => dirty,
         miss         => miss,
         pmresp_h     => pmresp_h,
         PMREAD_L     => PMREAD_L,
         PMWRITE_L    => PMWRITE_L,
         in_idlehit   => in_idlehit,
         in_load      => in_load,
         in_writeback => in_writeback
      );
   aL1_Datapath : L1_Datapath
      PORT MAP (
         ADDRESS      => ADDRESS,
         DATAIN       => cachedatain,
         MREAD_L      => MREAD_L,
         MWRITEH_L    => MWRITEH_L,
         MWRITEL_L    => MWRITEL_L,
         RESET_L      => RESET_L,
         clk          => clk,
         in_idlehit   => in_idlehit,
         in_load      => in_load,
         in_writeback => in_writeback,
         pmdataout    => pmdataout,
         pmresp_h     => pmresp_h,
         DATAOUT      => cachedataout,
         MRESP_H      => MRESP_H,
         PMADDRESS    => PMADDRESS,
         dirty        => dirty,
         miss         => miss,
         pmdatain     => pmdatain
      );

END struct;
