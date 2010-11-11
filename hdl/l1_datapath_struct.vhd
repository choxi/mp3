-- VHDL Entity ece411.L1_Datapath.symbol
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 20:44:36 11/10/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY L1_Datapath IS
   PORT( 
      ADDRESS      : IN     LC3b_word;
      DATAIN       : IN     LC3b_word;
      MREAD_L      : IN     std_logic;
      MWRITEH_L    : IN     std_logic;
      MWRITEL_L    : IN     std_logic;
      RESET_L      : IN     std_logic;
      clk          : IN     std_logic;
      in_idlehit   : IN     std_logic;
      in_load      : IN     std_logic;
      in_writeback : IN     std_logic;
      pmdataout    : IN     LC3b_oword;
      pmresp_h     : IN     std_logic;
      DATAOUT      : OUT    LC3b_word;
      MRESP_H      : OUT    std_logic;
      PMADDRESS    : OUT    LC3b_word;
      dirty        : OUT    std_logic;
      miss         : OUT    std_logic;
      pmdatain     : OUT    LC3b_oword
   );

-- Declarations

END L1_Datapath ;

--
-- VHDL Architecture ece411.L1_Datapath.struct
--
-- Created:
--          by - tkalbar2.stdt (gllnx31.ews.illinois.edu)
--          at - 20:44:37 11/10/10
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY ece411;

ARCHITECTURE struct OF L1_Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL Dirty0       : std_logic;
   SIGNAL Dirty1       : std_logic;
   SIGNAL LRUout       : std_logic;
   SIGNAL LRUout_not   : std_logic;
   SIGNAL address1     : lc3b_word;
   SIGNAL address2     : lc3b_word;
   SIGNAL all_access   : std_logic;
   SIGNAL data0        : lc3b_oword;
   SIGNAL data1        : lc3b_oword;
   SIGNAL datawrite0   : std_logic;
   SIGNAL datawrite1   : std_logic;
   SIGNAL dirty_gate   : std_logic;
   SIGNAL dirtyclk     : std_logic;
   SIGNAL dirtyw0      : std_logic;
   SIGNAL dirtyw1      : std_logic;
   SIGNAL equal0       : std_logic;
   SIGNAL equal1       : std_logic;
   SIGNAL hit          : std_logic;
   SIGNAL hit_gate     : std_logic;
   SIGNAL hitclk       : std_logic;
   SIGNAL index        : lc3b_cindex;
   SIGNAL offset       : lc3b_coffset;
   SIGNAL prehit0      : std_logic;
   SIGNAL prehit1      : std_logic;
   SIGNAL protohit     : std_logic;
   SIGNAL protohit_not : std_logic;
   SIGNAL tag          : lc3b_tag;
   SIGNAL tag0         : lc3b_tag;
   SIGNAL tag1         : lc3b_tag;
   SIGNAL valid0       : std_logic;
   SIGNAL valid1       : std_logic;
   SIGNAL ways_datain  : lc3b_oword;
   SIGNAL wb_address   : LC3b_word;
   SIGNAL wc_datain    : lc3b_oword;
   SIGNAL wc_dataout   : lc3b_oword;
   SIGNAL wdata0       : lc3b_word;
   SIGNAL wdata1       : lc3b_word;
   SIGNAL wr0_onhit    : std_logic;
   SIGNAL wr0_onmiss   : std_logic;
   SIGNAL wr1_onhit    : std_logic;
   SIGNAL wr1_onmiss   : std_logic;
   SIGNAL write_access : std_logic;


   -- Component Declarations
   COMPONENT LRU
   PORT (
      LRUIn    : IN     std_logic ;
      LRUwrite : IN     std_logic ;
      index    : IN     lc3b_cindex ;
      LRUout   : OUT    std_logic ;
      RESET_L  : IN     std_logic 
   );
   END COMPONENT;
   COMPONENT WAY
   PORT (
      DataWrite  : IN     std_logic ;
      Datain     : IN     lc3b_oword ;
      DirtyIn    : IN     std_logic ;
      DirtyWrite : IN     std_logic ;
      RESET_L    : IN     std_logic ;
      TagIn      : IN     lc3b_tag ;
      index      : IN     lc3b_cindex ;
      Data       : OUT    lc3b_oword ;
      Dirty      : OUT    std_logic ;
      Tag        : OUT    lc3b_tag ;
      Valid      : OUT    std_logic 
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
   COMPONENT addr_joiner
   PORT (
      index   : IN     lc3b_cindex ;
      offset  : IN     lc3b_coffset ;
      tag     : IN     lc3b_tag ;
      address : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT addr_splitter
   PORT (
      address : IN     lc3b_word ;
      index   : OUT    lc3b_cindex ;
      offset  : OUT    lc3b_coffset ;
      tag     : OUT    lc3b_tag 
   );
   END COMPONENT;
   COMPONENT and2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT and3
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      c : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT and4
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      c : IN     std_logic ;
      d : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT dirtygate
   PORT (
      clk   : IN     std_logic ;
      dclk  : IN     std_logic ;
      dgate : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT hitgate
   PORT (
      clk   : IN     std_logic ;
      dclk  : IN     std_logic ;
      hgate : OUT    std_logic 
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
   COMPONENT nand3
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      c : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT or2
   PORT (
      a : IN     std_logic ;
      b : IN     std_logic ;
      s : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT owordmux2
   PORT (
      a   : IN     lc3b_oword ;
      b   : IN     lc3b_oword ;
      Sel : IN     std_logic ;
      f   : OUT    lc3b_oword 
   );
   END COMPONENT;
   COMPONENT tag_comp
   PORT (
      tag_addr  : IN     lc3b_tag ;
      tag_cache : IN     lc3b_tag ;
      equal     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT wordmux_c
   PORT (
      databig : IN     lc3b_oword ;
      offset  : IN     lc3b_coffset ;
      waydata : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT write_combiner
   PORT (
      MWH     : IN     std_logic ;
      MWL     : IN     std_logic ;
      dataout : IN     lc3b_word ;
      offset  : IN     lc3b_coffset ;
      oldline : IN     lc3b_oword ;
      newline : OUT    lc3b_oword 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : LRU USE ENTITY ece411.LRU;
   FOR ALL : WAY USE ENTITY ece411.WAY;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : addr_joiner USE ENTITY ece411.addr_joiner;
   FOR ALL : addr_splitter USE ENTITY ece411.addr_splitter;
   FOR ALL : and2 USE ENTITY ece411.and2;
   FOR ALL : and3 USE ENTITY ece411.and3;
   FOR ALL : and4 USE ENTITY ece411.and4;
   FOR ALL : dirtygate USE ENTITY ece411.dirtygate;
   FOR ALL : hitgate USE ENTITY ece411.hitgate;
   FOR ALL : mux2 USE ENTITY ece411.mux2;
   FOR ALL : mynot USE ENTITY ece411.mynot;
   FOR ALL : nand2 USE ENTITY ece411.nand2;
   FOR ALL : nand3 USE ENTITY ece411.nand3;
   FOR ALL : or2 USE ENTITY ece411.or2;
   FOR ALL : owordmux2 USE ENTITY ece411.owordmux2;
   FOR ALL : tag_comp USE ENTITY ece411.tag_comp;
   FOR ALL : wordmux_c USE ENTITY ece411.wordmux_c;
   FOR ALL : write_combiner USE ENTITY ece411.write_combiner;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   MRESP_H <= hit;
   hitclk <= clk'delayed(34 ns);
   dirtyclk <= clk'delayed(4 ns);                                       


   -- Instance port mappings.
   U_4 : LRU
      PORT MAP (
         LRUIn    => prehit0,
         LRUwrite => hit,
         index    => index,
         LRUout   => LRUout,
         RESET_L  => RESET_L
      );
   WAY0 : WAY
      PORT MAP (
         DataWrite  => datawrite0,
         Datain     => ways_datain,
         DirtyIn    => wr0_onhit,
         DirtyWrite => dirtyw0,
         RESET_L    => RESET_L,
         TagIn      => tag,
         index      => index,
         Data       => data0,
         Dirty      => Dirty0,
         Tag        => tag0,
         Valid      => valid0
      );
   WAY1 : WAY
      PORT MAP (
         DataWrite  => datawrite1,
         Datain     => ways_datain,
         DirtyIn    => wr1_onhit,
         DirtyWrite => dirtyw1,
         RESET_L    => RESET_L,
         TagIn      => tag,
         index      => index,
         Data       => data1,
         Dirty      => Dirty1,
         Tag        => tag1,
         Valid      => valid1
      );
   WayMux : WordMux2
      PORT MAP (
         A   => wdata0,
         B   => wdata1,
         Sel => prehit1,
         F   => DATAOUT
      );
   pmaddrMux : WordMux2
      PORT MAP (
         A   => ADDRESS,
         B   => wb_address,
         Sel => in_writeback,
         F   => PMADDRESS
      );
   tagMux : WordMux2
      PORT MAP (
         A   => address2,
         B   => address1,
         Sel => LRUout,
         F   => wb_address
      );
   joinaddr0 : addr_joiner
      PORT MAP (
         index   => index,
         offset  => offset,
         tag     => tag0,
         address => address2
      );
   joinaddr1 : addr_joiner
      PORT MAP (
         index   => index,
         offset  => offset,
         tag     => tag1,
         address => address1
      );
   U_0 : addr_splitter
      PORT MAP (
         address => ADDRESS,
         index   => index,
         offset  => offset,
         tag     => tag
      );
   U_12 : and2
      PORT MAP (
         a => datawrite0,
         b => dirty_gate,
         s => dirtyw0
      );
   U_13 : and2
      PORT MAP (
         a => datawrite1,
         b => dirty_gate,
         s => dirtyw1
      );
   missAND : and2
      PORT MAP (
         a => protohit_not,
         b => all_access,
         s => miss
      );
   prehit0AND : and2
      PORT MAP (
         a => equal0,
         b => valid0,
         s => prehit0
      );
   prehit1AND : and2
      PORT MAP (
         a => equal1,
         b => valid1,
         s => prehit1
      );
   U_5 : and3
      PORT MAP (
         a => write_access,
         b => in_idlehit,
         c => prehit0,
         s => wr0_onhit
      );
   U_7 : and3
      PORT MAP (
         a => write_access,
         b => in_idlehit,
         c => prehit1,
         s => wr1_onhit
      );
   U_9 : and3
      PORT MAP (
         a => LRUout_not,
         b => pmresp_h,
         c => in_load,
         s => wr0_onmiss
      );
   U_10 : and3
      PORT MAP (
         a => LRUout,
         b => pmresp_h,
         c => in_load,
         s => wr1_onmiss
      );
   hitAND : and4
      PORT MAP (
         a => hit_gate,
         b => in_idlehit,
         c => protohit,
         d => all_access,
         s => hit
      );
   dg1 : dirtygate
      PORT MAP (
         clk   => clk,
         dclk  => dirtyclk,
         dgate => dirty_gate
      );
   hg1 : hitgate
      PORT MAP (
         clk   => clk,
         dclk  => hitclk,
         hgate => hit_gate
      );
   dirtyMux : mux2
      PORT MAP (
         a   => Dirty0,
         b   => Dirty1,
         f   => dirty,
         sel => LRUout
      );
   U_6 : mynot
      PORT MAP (
         a => LRUout,
         s => LRUout_not
      );
   U_14 : mynot
      PORT MAP (
         a => protohit,
         s => protohit_not
      );
   U_2 : nand2
      PORT MAP (
         a => MWRITEH_L,
         b => MWRITEL_L,
         s => write_access
      );
   U_3 : nand3
      PORT MAP (
         a => MWRITEL_L,
         b => MWRITEH_L,
         c => MREAD_L,
         s => all_access
      );
   U_8 : or2
      PORT MAP (
         a => wr0_onhit,
         b => wr0_onmiss,
         s => datawrite0
      );
   U_11 : or2
      PORT MAP (
         a => wr1_onhit,
         b => wr1_onmiss,
         s => datawrite1
      );
   protohitOR : or2
      PORT MAP (
         a => prehit1,
         b => prehit0,
         s => protohit
      );
   pmDatainMux : owordmux2
      PORT MAP (
         a   => wc_dataout,
         b   => pmdataout,
         Sel => in_load,
         f   => ways_datain
      );
   pmdatamux : owordmux2
      PORT MAP (
         a   => data0,
         b   => data1,
         Sel => LRUout,
         f   => pmdatain
      );
   pmdatamux1 : owordmux2
      PORT MAP (
         a   => data0,
         b   => data1,
         Sel => prehit1,
         f   => wc_datain
      );
   comp0 : tag_comp
      PORT MAP (
         tag_addr  => tag,
         tag_cache => tag0,
         equal     => equal0
      );
   comp1 : tag_comp
      PORT MAP (
         tag_addr  => tag,
         tag_cache => tag1,
         equal     => equal1
      );
   wmux0 : wordmux_c
      PORT MAP (
         databig => data0,
         offset  => offset,
         waydata => wdata0
      );
   wmux1 : wordmux_c
      PORT MAP (
         databig => data1,
         offset  => offset,
         waydata => wdata1
      );
   U_1 : write_combiner
      PORT MAP (
         MWH     => MWRITEH_L,
         MWL     => MWRITEL_L,
         dataout => DATAIN,
         offset  => offset,
         oldline => wc_datain,
         newline => wc_dataout
      );

END struct;
