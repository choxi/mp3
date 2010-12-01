-- VHDL Entity ece411.Memory3.symbol
--
-- Created:
--          by - tkalbar2.stdt (gllnx19.ews.illinois.edu)
--          at - 03:58:52 11/30/10
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
--          by - tkalbar2.stdt (gllnx19.ews.illinois.edu)
--          at - 03:58:52 11/30/10
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
   SIGNAL PMADDRESS   : LC3b_word;
   SIGNAL PMADDRESSD  : LC3b_word;
   SIGNAL PMADDRESSI  : LC3b_word;
   SIGNAL PMREAD_L    : std_logic;
   SIGNAL PMREAD_LD   : std_logic;
   SIGNAL PMREAD_LI   : std_logic;
   SIGNAL PMRESP_H    : std_logic;
   SIGNAL PMWRITE_L   : std_logic;
   SIGNAL PMWRITE_LD  : std_logic;
   SIGNAL cachedatain : LC3b_word;
   SIGNAL pmdatain    : lc3b_oword;
   SIGNAL pmdatainD   : LC3b_oword;
   SIGNAL pmdataout   : lc3b_oword;
   SIGNAL pmdataoutD  : LC3b_oword;
   SIGNAL pmdataoutI  : LC3b_oword;
   SIGNAL pmresp_hD   : std_logic;
   SIGNAL pmresp_hI   : std_logic;


   -- Component Declarations
   COMPONENT Arbiter
   PORT (
      ADDRESSD  : IN     lc3b_word ;
      ADDRESSI  : IN     lc3b_word ;
      PMRESP_H  : IN     std_logic ;
      READ_LD   : IN     std_logic ;
      READ_LI   : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      WRITE_LD  : IN     std_logic ;
      datainD   : IN     lc3b_oword ;
      pmdataout : IN     lc3b_oword ;
      PMADDRESS : OUT    LC3b_word ;
      PMREAD_L  : OUT    std_logic ;
      PMWRITE_L : OUT    std_logic ;
      RESP_HD   : OUT    std_logic ;
      RESP_HI   : OUT    std_logic ;
      dataoutD  : OUT    lc3b_oword ;
      dataoutI  : OUT    lc3b_oword ;
      pmdatain  : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT L1_Cache
   PORT (
      ADDRESS      : IN     LC3b_word ;
      MREAD_L      : IN     std_logic ;
      MWRITEH_L    : IN     std_logic ;
      MWRITEL_L    : IN     std_logic ;
      RESET_L      : IN     std_logic ;
      cachedatain  : IN     LC3b_word ;
      clk          : IN     std_logic ;
      pmdataout    : IN     LC3b_oword ;
      pmresp_h     : IN     std_logic ;
      MRESP_H      : OUT    std_logic ;
      PMADDRESS    : OUT    LC3b_word ;
      PMREAD_L     : OUT    std_logic ;
      PMWRITE_L    : OUT    std_logic ;
      cachedataout : OUT    LC3b_word ;
      pmdatain     : OUT    LC3b_oword 
   );
   END COMPONENT;
   COMPONENT Physical_Memory
   PORT (
      PMADDRESS : IN     LC3b_word ;
      pmdatain  : IN     LC3b_oword ;
      pmdataout : OUT    LC3b_oword ;
      PMWRITE_L : IN     std_logic ;
      PMREAD_L  : IN     std_logic ;
      pmresp_h  : OUT    std_logic ;
      RESET_L   : IN     std_logic ;
      clk       : IN     std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Arbiter USE ENTITY ece411.Arbiter;
   FOR ALL : L1_Cache USE ENTITY ece411.L1_Cache;
   FOR ALL : Physical_Memory USE ENTITY ece411.Physical_Memory;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   cachedatain <= (OTHERS => 'X');
   MWRITEH_L <= '1';
   MWRITEL_L <= '1';                                       


   -- Instance port mappings.
   aArbiter : Arbiter
      PORT MAP (
         ADDRESSD  => PMADDRESSD,
         ADDRESSI  => PMADDRESSI,
         PMRESP_H  => PMRESP_H,
         READ_LD   => PMREAD_LD,
         READ_LI   => PMREAD_LI,
         RESET_L   => RESET_L,
         WRITE_LD  => PMWRITE_LD,
         datainD   => pmdatainD,
         pmdataout => pmdataout,
         PMADDRESS => PMADDRESS,
         PMREAD_L  => PMREAD_L,
         PMWRITE_L => PMWRITE_L,
         RESP_HD   => pmresp_hD,
         RESP_HI   => pmresp_hI,
         dataoutD  => pmdataoutD,
         dataoutI  => pmdataoutI,
         pmdatain  => pmdatain
      );
   DataCache : L1_Cache
      PORT MAP (
         ADDRESS      => D_ADDRESS,
         MREAD_L      => D_MREAD_L,
         MWRITEH_L    => D_MWRITEH_L,
         MWRITEL_L    => D_MWRITEL_L,
         RESET_L      => RESET_L,
         cachedatain  => D_DATAIN,
         clk          => clk,
         pmdataout    => pmdataoutD,
         pmresp_h     => pmresp_hD,
         MRESP_H      => D_MRESP_H,
         PMADDRESS    => PMADDRESSD,
         PMREAD_L     => PMREAD_LD,
         PMWRITE_L    => PMWRITE_LD,
         cachedataout => D_DATAOUT,
         pmdatain     => pmdatainD
      );
   InstrCache : L1_Cache
      PORT MAP (
         ADDRESS      => I_ADDRESS,
         MREAD_L      => I_MREAD_L,
         MWRITEH_L    => MWRITEH_L,
         MWRITEL_L    => MWRITEL_L,
         RESET_L      => RESET_L,
         cachedatain  => cachedatain,
         clk          => clk,
         pmdataout    => pmdataoutI,
         pmresp_h     => pmresp_hI,
         MRESP_H      => I_MRESP_H,
         PMADDRESS    => PMADDRESSI,
         PMREAD_L     => PMREAD_LI,
         PMWRITE_L    => OPEN,
         cachedataout => I_DATAOUT,
         pmdatain     => OPEN
      );
   DRAM : Physical_Memory
      PORT MAP (
         PMADDRESS => PMADDRESS,
         pmdatain  => pmdatain,
         pmdataout => pmdataout,
         PMWRITE_L => PMWRITE_L,
         PMREAD_L  => PMREAD_L,
         pmresp_h  => PMRESP_H,
         RESET_L   => RESET_L,
         clk       => clk
      );

END struct;
