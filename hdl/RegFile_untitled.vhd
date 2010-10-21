--
-- VHDL Architecture ece411.RegFile.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx13.ews.illinois.edu)
--          at - 22:33:11 09/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegFile IS
   PORT( 
      DR       : IN     LC3b_reg;
      DEST     : IN     LC3b_reg;
      DataIn   : IN     LC3b_word;
      RESET_L  : IN     std_logic;
      RegWrite : IN     std_logic;
      SrcA     : IN     LC3b_reg;
      SrcB     : IN     LC3b_reg;
      --clk      : IN     std_logic;
      RFAout   : OUT    LC3b_word;
      RFBout   : OUT    LC3b_word;
      RFDout   : OUT    LC3b_word
   );

-- Declarations

END RegFile ;

--
ARCHITECTURE UNTITLED OF REGFILE IS
TYPE RAMMEMORY IS ARRAY (7 DOWNTO 0) OF LC3B_WORD;
SIGNAL RAM : RAMMEMORY;
BEGIN
	-------------------------------------------------------------------
	VHDL_REGFILE_READ : PROCESS (RAM, SRCA, SRCB, DR)
	-------------------------------------------------------------------
	VARIABLE RADDR1 : INTEGER RANGE 0 TO 7;
	VARIABLE RADDR2 : INTEGER RANGE 0 TO 7;
	VARIABLE RADDR3 : INTEGER RANGE 0 TO 7;
	BEGIN
		--READ FROM REGFILE, THE OUTPUTS ARE VALID AFTER REGFILE_READ DELAY.
		RADDR1 := TO_INTEGER(UNSIGNED('0' & SRCA));
		RADDR2 := TO_INTEGER(UNSIGNED('0' & SRCB));
		RADDR3 := TO_INTEGER(UNSIGNED('0' & DR));
		RFAOUT <= RAM(RADDR1) AFTER DELAY_REGFILE_READ;
		RFBOUT <= RAM(RADDR2) AFTER DELAY_REGFILE_READ;
		RFDOUT <= RAM(RADDR3) AFTER DELAY_REGFILE_READ;
	END PROCESS VHDL_REGFILE_READ;
	-------------------------------------------------------------------
	VHDL_REGFILE_WRITE: PROCESS(DATAIN, REGWRITE, DEST, RESET_L)
	-------------------------------------------------------------------
	VARIABLE WADDR : INTEGER RANGE 0 TO 7;
	BEGIN
		-- ON RESET, CLEAR THE REGISTER FILE CONTENTS
		IF (RESET_L = '0') THEN
			RAM(0) <= "0000000000000000";
			RAM(1) <= "0000000000000000";
			RAM(2) <= "0000000000000000";
			RAM(3) <= "0000000000000000";
			RAM(4) <= "0000000000000000";
			RAM(5) <= "0000000000000000";
			RAM(6) <= "0000000000000000";
			RAM(7) <= "0000000000000000";
		END IF;
		-- WRITE VALUE TO REGISTER FILE ON RISING EDGE OF CLOCK IF REGWRITE ACTIVE
		WADDR := TO_INTEGER(UNSIGNED('0' & DEST));
		--IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
	  IF (REGWRITE = '1') THEN
			RAM(WADDR) <= DATAIN;
		END IF;
		--END IF;
	END PROCESS VHDL_REGFILE_WRITE;
END UNTITLED;

