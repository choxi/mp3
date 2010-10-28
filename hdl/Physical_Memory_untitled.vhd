--
-- VHDL Architecture ece411.Physical_Memory.untitled
--
-- Created:
--          by - anbrown2.stdt (eelnx32.ews.illinois.edu)
--          at - 17:04:02 09/20/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Physical_Memory IS
   PORT( 
      PMADDRESS : IN     LC3b_word;
      pmdatain  : IN     LC3b_oword;
      pmdataout : OUT    LC3b_oword;
      PMWRITE_L : IN     std_logic;
      PMREAD_L  : IN     std_logic;
      pmresp_h  : OUT    std_logic;
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic
   );

-- Declarations

END Physical_Memory ;

--
ARCHITECTURE untitled OF Physical_Memory IS
SIGNAL PRE_PMRESP_H : STD_LOGIC;
SIGNAL PRE_PMDATAOUT : LC3B_OWORD;
BEGIN
	-------------------------------------------------------------------
	VHDL_MEMORY : PROCESS (RESET_L, PMREAD_L, PMWRITE_L) 
	-------------------------------------------------------------------
	VARIABLE MEM : MEMORY_ARRAY_64K;
	VARIABLE INT_ADDRESS : INTEGER;
	VARIABLE INT_OLD_ADDRESS : INTEGER;
	BEGIN
		INT_ADDRESS := TO_INTEGER(UNSIGNED(PMADDRESS(15 DOWNTO 4)) * 16);
		IF RESET_L = '0' THEN
			PRE_PMRESP_H <= '0';
			--MYDRAMINIT_64K(MEM);
		ELSE
			IF ((INT_ADDRESS >= 0) AND (INT_ADDRESS <= 4095)) THEN
				IF (PMREAD_L = '0' AND PMWRITE_L = '1') THEN
					PRE_PMDATAOUT(7   DOWNTO 0  ) <= MEM(INT_ADDRESS);            
					PRE_PMDATAOUT(15  DOWNTO 8  ) <= MEM(INT_ADDRESS + 1 );
					PRE_PMDATAOUT(23  DOWNTO 16 ) <= MEM(INT_ADDRESS + 2 );
					PRE_PMDATAOUT(31  DOWNTO 24 ) <= MEM(INT_ADDRESS + 3 );
					PRE_PMDATAOUT(39  DOWNTO 32 ) <= MEM(INT_ADDRESS + 4 );            
					PRE_PMDATAOUT(47  DOWNTO 40 ) <= MEM(INT_ADDRESS + 5 );
					PRE_PMDATAOUT(55  DOWNTO 48 ) <= MEM(INT_ADDRESS + 6 );
					PRE_PMDATAOUT(63  DOWNTO 56 ) <= MEM(INT_ADDRESS + 7 );
					PRE_PMDATAOUT(71  DOWNTO 64 ) <= MEM(INT_ADDRESS + 8 );            
					PRE_PMDATAOUT(79  DOWNTO 72 ) <= MEM(INT_ADDRESS + 9 );
					PRE_PMDATAOUT(87  DOWNTO 80 ) <= MEM(INT_ADDRESS + 10);
					PRE_PMDATAOUT(95  DOWNTO 88 ) <= MEM(INT_ADDRESS + 11);
					PRE_PMDATAOUT(103 DOWNTO 96 ) <= MEM(INT_ADDRESS + 12);            
					PRE_PMDATAOUT(111 DOWNTO 104) <= MEM(INT_ADDRESS + 13);
					PRE_PMDATAOUT(119 DOWNTO 112) <= MEM(INT_ADDRESS + 14);
					PRE_PMDATAOUT(127 DOWNTO 120) <= MEM(INT_ADDRESS + 15);
					PRE_PMRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				ELSIF (PMWRITE_L = '0' AND PMREAD_L = '1') THEN
					MEM(INT_ADDRESS     ) := PMDATAIN(7   DOWNTO 0  );
					MEM(INT_ADDRESS + 1 ) := PMDATAIN(15  DOWNTO 8  );
					MEM(INT_ADDRESS + 2 ) := PMDATAIN(23  DOWNTO 16 );
					MEM(INT_ADDRESS + 3 ) := PMDATAIN(31  DOWNTO 24 );
					MEM(INT_ADDRESS + 4 ) := PMDATAIN(39  DOWNTO 32 );
					MEM(INT_ADDRESS + 5 ) := PMDATAIN(47  DOWNTO 40 );
					MEM(INT_ADDRESS + 6 ) := PMDATAIN(55  DOWNTO 48 );
					MEM(INT_ADDRESS + 7 ) := PMDATAIN(63  DOWNTO 56 );
					MEM(INT_ADDRESS + 8 ) := PMDATAIN(71  DOWNTO 64 );
					MEM(INT_ADDRESS + 9 ) := PMDATAIN(79  DOWNTO 72 );
					MEM(INT_ADDRESS + 10) := PMDATAIN(87  DOWNTO 80 );
					MEM(INT_ADDRESS + 11) := PMDATAIN(95  DOWNTO 88 );
					MEM(INT_ADDRESS + 12) := PMDATAIN(103 DOWNTO 96 );
					MEM(INT_ADDRESS + 13) := PMDATAIN(111 DOWNTO 104);
					MEM(INT_ADDRESS + 14) := PMDATAIN(119 DOWNTO 112);
					MEM(INT_ADDRESS + 15) := PMDATAIN(127 DOWNTO 120);
					PRE_PMRESP_H <= '1' AFTER 0 NS, '0' AFTER CLOCK_PERIOD;
				END IF;
			END IF;
		END IF;
	END PROCESS VHDL_MEMORY;
  PMRESP_H <= PRE_PMRESP_H'DELAYED(DELAY_MP22_MEM);
  PMDATAOUT <= PRE_PMDATAOUT'DELAYED(DELAY_MP22_MEM);
END ARCHITECTURE untitled;
