-- VHDL Entity ece411.WB_STAGE.interface
--
-- Created:
--          by - tkalbar2.stdt (eelnx23.ews.illinois.edu)
--          at - 21:37:50 10/20/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WB_STAGE IS
   PORT( 
      ALUMemSel_WB : IN     std_logic;
      ALUout_WB    : IN     lc3b_word;
      SetCC_WB     : IN     std_logic;
      dataout_WB   : IN     lc3b_word;
      RegNZP       : OUT    lc3b_nzp;
      WriteData    : OUT    lc3b_word
   );

-- Declarations

END WB_STAGE ;

--
-- VHDL Architecture ece411.WB_STAGE.struct
--
-- Created:
--          by - tkalbar2.stdt (eelnx23.ews.illinois.edu)
--          at - 21:37:50 10/20/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF WB_STAGE IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL GenCCout : LC3b_cc;

   -- Implicit buffer signal declarations
   SIGNAL WriteData_internal : lc3b_word;


   -- Component Declarations
   COMPONENT GenCC
   PORT (
      GenCCdata : IN     LC3b_word ;
      GenCCout  : OUT    LC3b_cc 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc ;
      LoadNZP  : IN     std_logic ;
      --clk      : IN     std_logic;
      NZPout   : OUT    LC3b_cc 
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
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   aGenCC : GenCC
      PORT MAP (
         GenCCdata => WriteData_internal,
         GenCCout  => GenCCout
      );
   aNZP : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => SetCC_WB,
         NZPout   => RegNZP
      );
   ALUMEMMux : WordMux2
      PORT MAP (
         A   => dataout_WB,
         B   => ALUout_WB,
         Sel => ALUMemSel_WB,
         F   => WriteData_internal
      );

   -- Implicit buffered output assignments
   WriteData <= WriteData_internal;

END struct;
