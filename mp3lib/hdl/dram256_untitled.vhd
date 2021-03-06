-- ADDED TIMING VALIDATION JANUARY 2010
--
-- VHDL ARCHITECTURE ECE411.DRAM256.UNTITLED
--
-- CREATED:
--          BY - HERSTAD.STDT (GLSN23.EWS.UIUC.EDU)
--          AT - 16:54:31 11/04/03
--
-- GENERATED BY MENTOR GRAPHICS' HDL DESIGNER(TM) 2001.5 (BUILD 170)
--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY ECE411;
USE ECE411.LC3B_TYPES.ALL;

ENTITY DRAM256 IS
PORT( 
	ADDRESS  : IN     LC3B_WORD;
	DATAIN   : IN     LC3B_PWORD;
	MREAD_L  : IN     STD_LOGIC;
	MWRITE_L : IN     STD_LOGIC;
	RESET_L  : IN     STD_LOGIC;
	DATAOUT  : OUT    LC3B_PWORD;
	MRESP_H  : OUT    STD_LOGIC
);
-- DECLARATIONS
END DRAM256 ;

ARCHITECTURE UNTITLED OF DRAM256 IS
BEGIN
	-------------------------------------------------------------------
	VHDL_MEMORY : PROCESS (RESET_L, MREAD_L, MWRITE_L) 
	-------------------------------------------------------------------
	VARIABLE MEM : MEMORY_ARRAY_64K;
	VARIABLE INT_OLD_ADDRESS : INTEGER;
	VARIABLE INT_ADDRESS : INTEGER;
	BEGIN
		INT_ADDRESS := TO_INTEGER(UNSIGNED(ADDRESS(15 DOWNTO 5)) * 32);
		IF RESET_L = '0' THEN
			MRESP_H <= '0';
			MYDRAMINIT_64K(MEM);
		ELSE
			IF ((INT_ADDRESS >= 0) AND (INT_ADDRESS <= 65535)) THEN
				IF (MWRITE_L'EVENT AND (MWRITE_L'LAST_VALUE = '0') AND (INT_ADDRESS /= INT_OLD_ADDRESS)) THEN
					ASSERT FALSE 
					REPORT "MEMORY WRITE TIMING ERROR"
					SEVERITY NOTE;
				END IF;
				IF (MREAD_L'EVENT AND (MREAD_L'LAST_VALUE = '0') AND (INT_ADDRESS /= INT_OLD_ADDRESS)) THEN
					ASSERT FALSE 
					REPORT "MEMORY READ TIMING ERROR"
					SEVERITY NOTE;
				END IF;
				IF (MREAD_L = '0' AND MWRITE_L = '1') THEN
					DATAOUT(7 DOWNTO 0) <= MEM(INT_ADDRESS) AFTER DELAY_256B_MEM;             
					DATAOUT(15 DOWNTO 8) <= MEM(INT_ADDRESS + 1) AFTER DELAY_256B_MEM;
					DATAOUT(23 DOWNTO 16) <= MEM(INT_ADDRESS + 2) AFTER DELAY_256B_MEM;
					DATAOUT(31 DOWNTO 24) <= MEM(INT_ADDRESS + 3) AFTER DELAY_256B_MEM;
					DATAOUT(39 DOWNTO 32) <= MEM(INT_ADDRESS + 4) AFTER DELAY_256B_MEM;
					DATAOUT(47 DOWNTO 40) <= MEM(INT_ADDRESS + 5) AFTER DELAY_256B_MEM;
					DATAOUT(55 DOWNTO 48) <= MEM(INT_ADDRESS + 6) AFTER DELAY_256B_MEM;
					DATAOUT(63 DOWNTO 56) <= MEM(INT_ADDRESS + 7) AFTER DELAY_256B_MEM;
					DATAOUT(71 DOWNTO 64) <= MEM(INT_ADDRESS + 8) AFTER DELAY_256B_MEM;
					DATAOUT(79 DOWNTO 72) <= MEM(INT_ADDRESS + 9) AFTER DELAY_256B_MEM;
					DATAOUT(87 DOWNTO 80) <= MEM(INT_ADDRESS + 10) AFTER DELAY_256B_MEM;
					DATAOUT(95 DOWNTO 88) <= MEM(INT_ADDRESS + 11) AFTER DELAY_256B_MEM;
					DATAOUT(103 DOWNTO 96) <= MEM(INT_ADDRESS + 12) AFTER DELAY_256B_MEM;
					DATAOUT(111 DOWNTO 104) <= MEM(INT_ADDRESS + 13) AFTER DELAY_256B_MEM;
					DATAOUT(119 DOWNTO 112) <= MEM(INT_ADDRESS + 14) AFTER DELAY_256B_MEM;
					DATAOUT(127 DOWNTO 120) <= MEM(INT_ADDRESS + 15) AFTER DELAY_256B_MEM;
					DATAOUT(135 DOWNTO 128) <= MEM(INT_ADDRESS + 16) AFTER DELAY_256B_MEM;
					DATAOUT(143 DOWNTO 136) <= MEM(INT_ADDRESS + 17) AFTER DELAY_256B_MEM;
					DATAOUT(151 DOWNTO 144) <= MEM(INT_ADDRESS + 18) AFTER DELAY_256B_MEM;
					DATAOUT(159 DOWNTO 152) <= MEM(INT_ADDRESS + 19) AFTER DELAY_256B_MEM;
					DATAOUT(167 DOWNTO 160) <= MEM(INT_ADDRESS + 20) AFTER DELAY_256B_MEM;
					DATAOUT(175 DOWNTO 168) <= MEM(INT_ADDRESS + 21) AFTER DELAY_256B_MEM;
					DATAOUT(183 DOWNTO 176) <= MEM(INT_ADDRESS + 22) AFTER DELAY_256B_MEM;
					DATAOUT(191 DOWNTO 184) <= MEM(INT_ADDRESS + 23) AFTER DELAY_256B_MEM;
					DATAOUT(199 DOWNTO 192) <= MEM(INT_ADDRESS + 24) AFTER DELAY_256B_MEM;
					DATAOUT(207 DOWNTO 200) <= MEM(INT_ADDRESS + 25) AFTER DELAY_256B_MEM;
					DATAOUT(215 DOWNTO 208) <= MEM(INT_ADDRESS + 26) AFTER DELAY_256B_MEM;
					DATAOUT(223 DOWNTO 216) <= MEM(INT_ADDRESS + 27) AFTER DELAY_256B_MEM;
					DATAOUT(231 DOWNTO 224) <= MEM(INT_ADDRESS + 28) AFTER DELAY_256B_MEM;
					DATAOUT(239 DOWNTO 232) <= MEM(INT_ADDRESS + 29) AFTER DELAY_256B_MEM;
					DATAOUT(247 DOWNTO 240) <= MEM(INT_ADDRESS + 30) AFTER DELAY_256B_MEM;
					DATAOUT(255 DOWNTO 248) <= MEM(INT_ADDRESS + 31) AFTER DELAY_256B_MEM;
					MRESP_H <= '1' AFTER DELAY_256B_MEM, '0' AFTER DELAY_256B_MEM + CLOCK_PERIOD;
				ELSIF (MWRITE_L = '0' AND MREAD_L = '1') THEN
					MEM(INT_ADDRESS) := DATAIN(7 DOWNTO 0);
					MEM(INT_ADDRESS + 1) := DATAIN(15 DOWNTO 8);
					MEM(INT_ADDRESS + 2) := DATAIN(23 DOWNTO 16);
					MEM(INT_ADDRESS + 3) := DATAIN(31 DOWNTO 24);
					MEM(INT_ADDRESS + 4) := DATAIN(39 DOWNTO 32);
					MEM(INT_ADDRESS + 5) := DATAIN(47 DOWNTO 40);
					MEM(INT_ADDRESS + 6) := DATAIN(55 DOWNTO 48);
					MEM(INT_ADDRESS + 7) := DATAIN(63 DOWNTO 56);
					MEM(INT_ADDRESS + 8) := DATAIN(71 DOWNTO 64);
					MEM(INT_ADDRESS + 9) := DATAIN(79 DOWNTO 72);
					MEM(INT_ADDRESS + 10) := DATAIN(87 DOWNTO 80);
					MEM(INT_ADDRESS + 11) := DATAIN(95 DOWNTO 88);
					MEM(INT_ADDRESS + 12) := DATAIN(103 DOWNTO 96);
					MEM(INT_ADDRESS + 13) := DATAIN(111 DOWNTO 104);
					MEM(INT_ADDRESS + 14) := DATAIN(119 DOWNTO 112);
					MEM(INT_ADDRESS + 15) := DATAIN(127 DOWNTO 120);
					MEM(INT_ADDRESS + 16) := DATAIN(135 DOWNTO 128);
					MEM(INT_ADDRESS + 17) := DATAIN(143 DOWNTO 136);
					MEM(INT_ADDRESS + 18) := DATAIN(151 DOWNTO 144);
					MEM(INT_ADDRESS + 19) := DATAIN(159 DOWNTO 152);
					MEM(INT_ADDRESS + 20) := DATAIN(167 DOWNTO 160);
					MEM(INT_ADDRESS + 21) := DATAIN(175 DOWNTO 168);
					MEM(INT_ADDRESS + 22) := DATAIN(183 DOWNTO 176);
					MEM(INT_ADDRESS + 23) := DATAIN(191 DOWNTO 184);
					MEM(INT_ADDRESS + 24) := DATAIN(199 DOWNTO 192);
					MEM(INT_ADDRESS + 25) := DATAIN(207 DOWNTO 200);
					MEM(INT_ADDRESS + 26) := DATAIN(215 DOWNTO 208);
					MEM(INT_ADDRESS + 27) := DATAIN(223 DOWNTO 216);
					MEM(INT_ADDRESS + 28) := DATAIN(231 DOWNTO 224);
					MEM(INT_ADDRESS + 29) := DATAIN(239 DOWNTO 232);
					MEM(INT_ADDRESS + 30) := DATAIN(247 DOWNTO 240);
					MEM(INT_ADDRESS + 31) := DATAIN(255 DOWNTO 248);
					MRESP_H <= '1' AFTER DELAY_256B_MEM, '0' AFTER DELAY_256B_MEM + CLOCK_PERIOD;
				ELSIF (MWRITE_L = '0' AND MREAD_L = '0') THEN
					ASSERT FALSE 
					REPORT "ATTEMPTING TO READ AND WRITE DRAM SIMULTANEOUSLY."
					SEVERITY ERROR;
				END IF;
			ELSE
				ASSERT FALSE
				REPORT "INVALID ADDRESS SENT TO DRAM."
				SEVERITY WARNING;
			END IF;
		END IF;
	END PROCESS VHDL_MEMORY;
END UNTITLED;