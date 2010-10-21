--
-- VHDL Architecture ece411.NZP.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx13.ews.illinois.edu)
--          at - 22:34:35 09/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NZP IS
   PORT( 
      GenCCout : IN     LC3b_cc;
      LoadNZP  : IN     std_logic;
      --clk      : IN     std_logic;
      NZPout   : OUT    LC3b_cc
   );

-- Declarations

END NZP ;

--
ARCHITECTURE UNTITLED OF NZP IS
SIGNAL PRE_NZP : STD_LOGIC_VECTOR (2 DOWNTO 0);
BEGIN
	------------------------------
	VHDL_NZP : PROCESS (GENCCOUT)
	------------------------------
	BEGIN
		--IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADNZP = '1') THEN
				PRE_NZP <= GENCCOUT;
			END IF;
		--END IF;
	END PROCESS VHDL_NZP;
	NZPout <= PRE_NZP AFTER DELAY_REG;
END UNTITLED;

