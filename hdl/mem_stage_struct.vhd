-- VHDL Entity ece411.MEM_STAGE.interface
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 23:42:25 11/10/10
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
      D_MRESP_H    : IN     std_logic;
      RESET_L      : IN     std_logic;
      Read_MEM     : IN     std_logic;
      RegNZP       : IN     lc3b_nzp;
      STIMuxSel    : IN     std_logic;
      STR_data_MEM : IN     lc3b_word;
      Write_MEM    : IN     std_logic;
      accessState  : IN     std_logic;
      address_MEM  : IN     lc3b_word;
      clk          : IN     std_logic;
      nzp_MEM      : IN     lc3b_nzp;
      rw_hit_gate  : IN     std_logic;
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
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 23:42:26 11/10/10
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
   SIGNAL A          : LC3b_word;
   SIGNAL N          : std_logic;
   SIGNAL NZPCompOut : std_logic;
   SIGNAL P          : std_logic;
   SIGNAL RegN       : std_logic;
   SIGNAL RegP       : std_logic;
   SIGNAL RegZ       : std_logic;
   SIGNAL STI_Read   : std_logic;
   SIGNAL STI_Write  : std_logic;
   SIGNAL Z          : std_logic;
   SIGNAL f          : std_logic;
   SIGNAL f1         : std_logic;


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
   COMPONENT and2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
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
   COMPONENT or2
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
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : mux2 USE ENTITY ece411.mux2;
   FOR ALL : or2 USE ENTITY ece411.or2;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 through_signals
   dataout_MEM <= D_DATAOUT;
   D_DATAIN <= STR_data_MEM;
                                       

   -- HDL Embedded Text Block 2 STI_signals
   STI_Write <= '1';
   STI_Read <= '0';                                     


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
   U_0 : Reg16
      PORT MAP (
         Input  => D_DATAOUT,
         RESET  => RESET_L,
         clk    => clk,
         load   => D_MRESP_H,
         Output => A
      );
   ADDRMux : WordMux2
      PORT MAP (
         A   => A,
         B   => address_MEM,
         Sel => accessState,
         F   => D_ADDRESS
      );
   NZP_AND : and2
      PORT MAP (
         a => Branch_MEM,
         b => NZPCompOut,
         s => brSel
      );
   ReadMux : mux2
      PORT MAP (
         a   => Read_MEM,
         b   => STI_Read,
         f   => f1,
         sel => STIMuxSel
      );
   WriteMux : mux2
      PORT MAP (
         a   => Write_MEM,
         b   => STI_Write,
         f   => f,
         sel => STIMuxSel
      );
   HG_R : or2
      PORT MAP (
         a => rw_hit_gate,
         b => f1,
         s => D_MREAD_L
      );
   HG_W : or2
      PORT MAP (
         a => f,
         b => rw_hit_gate,
         s => D_MWRITE_L
      );

END struct;
