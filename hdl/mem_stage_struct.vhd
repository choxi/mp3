-- VHDL Entity ece411.MEM_STAGE.interface
--
-- Created:
--          by - rchoxi2.stdt (eelnx28.ews.illinois.edu)
--          at - 23:20:10 10/25/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MEM_STAGE IS
   PORT( 
      Branch_MEM   : IN     std_logic;
      D_DATAOUT    : IN     LC3b_word;
      Read_MEM     : IN     std_logic;
      RegNZP       : IN     lc3b_nzp;
      STR_data_MEM : IN     lc3b_word;
      Write_MEM    : IN     std_logic;
      address_MEM  : IN     lc3b_word;
      nzp_MEM      : IN     lc3b_nzp;
      D_ADDRESS    : OUT    LC3b_word;
      D_DATAIN     : OUT    LC3b_word;
      D_MREAD_L    : OUT    std_logic;
      D_MWRITE_L   : OUT    std_logic;
      brSel        : OUT    std_logic;
      dataout_MEM  : OUT    lc3b_word
   );

-- Declarations

END MEM_STAGE ;

--
-- VHDL Architecture ece411.MEM_STAGE.struct
--
-- Created:
--          by - rchoxi2.stdt (eelnx28.ews.illinois.edu)
--          at - 23:20:11 10/25/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF MEM_STAGE IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL N          : std_logic;
   SIGNAL NZPCompOut : std_logic;
   SIGNAL P          : std_logic;
   SIGNAL RegN       : std_logic;
   SIGNAL RegP       : std_logic;
   SIGNAL RegZ       : std_logic;
   SIGNAL Z          : std_logic;


   -- Component Declarations
   COMPONENT NPZComp
   PORT (
      N          : IN     std_logic ;
      P          : IN     std_logic ;
      RegN       : IN     std_logic ;
      RegP       : IN     std_logic ;
      RegZ       : IN     std_logic ;
      Z          : IN     std_logic ;
      NZPCompOut : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      dest   : IN     LC3b_reg ;
      CheckN : OUT    std_logic ;
      CheckP : OUT    std_logic ;
      CheckZ : OUT    std_logic 
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
   FOR ALL : NPZComp USE ENTITY ece411.NPZComp;
   FOR ALL : NZPsplit USE ENTITY ece411.NZPsplit;
   FOR ALL : and2 USE ENTITY ece411.and2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 through_signals
   D_ADDRESS <= address_MEM;
   dataout_MEM <= D_DATAOUT;
   D_MREAD_L <= Read_MEM;
   D_DATAIN <= STR_data_MEM;
   D_MWRITE_L <= Write_MEM;                                     


   -- Instance port mappings.
   aNZPComp : NPZComp
      PORT MAP (
         N          => N,
         P          => P,
         RegN       => RegN,
         RegP       => RegP,
         RegZ       => RegZ,
         Z          => Z,
         NZPCompOut => NZPCompOut
      );
   aNZPSplit : NZPsplit
      PORT MAP (
         dest   => nzp_MEM,
         CheckN => N,
         CheckP => P,
         CheckZ => Z
      );
   aRegNZPSplit : NZPsplit
      PORT MAP (
         dest   => RegNZP,
         CheckN => RegN,
         CheckP => RegP,
         CheckZ => RegZ
      );
   NZP_AND : and2
      PORT MAP (
         a => Branch_MEM,
         b => NZPCompOut,
         s => brSel
      );

END struct;
