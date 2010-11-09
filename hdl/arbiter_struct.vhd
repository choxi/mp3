-- VHDL Entity ece411.Arbiter.symbol
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 20:54:26 11/08/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Arbiter IS
   PORT( 
      ADDRESSD  : IN     lc3b_word;
      ADDRESSI  : IN     lc3b_word;
      PMRESP_H  : IN     std_logic;
      READ_LD   : IN     std_logic;
      READ_LI   : IN     std_logic;
      RESET_L   : IN     std_logic;
      WRITE_LD  : IN     std_logic;
      datainD   : IN     lc3b_oword;
      pmdataout : IN     lc3b_oword;
      PMADDRESS : OUT    LC3b_word;
      PMREAD_L  : OUT    std_logic;
      PMWRITE_L : OUT    std_logic;
      RESP_HD   : OUT    std_logic;
      RESP_HI   : OUT    std_logic;
      dataoutD  : OUT    lc3b_oword;
      dataoutI  : OUT    lc3b_oword;
      pmdatain  : OUT    lc3b_oword
   );

-- Declarations

END Arbiter ;

--
-- VHDL Architecture ece411.Arbiter.struct
--
-- Created:
--          by - rchoxi2.stdt (gllnx7.ews.illinois.edu)
--          at - 20:54:26 11/08/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF Arbiter IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL WRITE_LI : std_logic;
   SIGNAL accessD  : std_logic;
   SIGNAL accessI  : std_logic;
   SIGNAL state    : std_logic;


   -- Component Declarations
   COMPONENT ArbiterControl
   PORT (
      PMRESP_H : IN     std_logic ;
      RESET_L  : IN     std_logic ;
      accessD  : IN     std_logic ;
      accessI  : IN     std_logic ;
      DRESP_H  : OUT    std_logic ;
      IRESP_H  : OUT    std_logic ;
      state    : OUT    std_logic 
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
   COMPONENT mux2
   PORT (
      a   : IN     std_logic ;
      b   : IN     std_logic ;
      f   : OUT    std_logic ;
      sel : IN     std_logic 
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ArbiterControl USE ENTITY ece411.ArbiterControl;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : mux2 USE ENTITY ece411.mux2;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   FOR ALL : nand2 USE ENTITY ece411.nand2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   WRITE_LI <= '1';                               

   -- HDL Embedded Text Block 2 eb2
   dataoutI <= pmdataout;
   dataoutD <= pmdataout;
   pmdatain <= datainD;                                  


   -- Instance port mappings.
   aArbiterControl : ArbiterControl
      PORT MAP (
         PMRESP_H => PMRESP_H,
         RESET_L  => RESET_L,
         accessD  => accessD,
         accessI  => accessI,
         DRESP_H  => RESP_HD,
         IRESP_H  => RESP_HI,
         state    => state
      );
   ADDRESS_MUX : WordMux2
      PORT MAP (
         A   => ADDRESSD,
         B   => ADDRESSI,
         Sel => state,
         F   => PMADDRESS
      );
   READ_MUX : mux2
      PORT MAP (
         a   => READ_LD,
         b   => READ_LI,
         f   => PMREAD_L,
         sel => state
      );
   WRITE_MUX : mux2
      PORT MAP (
         a   => WRITE_LD,
         b   => WRITE_LI,
         f   => PMWRITE_L,
         sel => state
      );
   U_0 : mynot
      PORT MAP (
         a => READ_LI,
         s => accessI
      );
   U_1 : nand2
      PORT MAP (
         a => READ_LD,
         b => WRITE_LD,
         s => accessD
      );

END struct;