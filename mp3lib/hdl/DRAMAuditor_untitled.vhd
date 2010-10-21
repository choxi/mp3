--
-- VHDL Architecture ece411.DRAMAuditor.untitled
--
-- Created:
--          by - anbrown2.stdt (eelnx6.ews.illinois.edu)
--          at - 13:20:49 08/25/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DRAMAuditor IS
   PORT( 
      ADDRESS   : IN     LC3b_word;
      MREAD_L   : IN     std_logic;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic
   );

-- Declarations

END DRAMAuditor ;

--
ARCHITECTURE untitled OF DRAMAuditor IS
BEGIN
  PROCESS (RESET_L, MREAD_L, MWRITEH_L, MWRITEL_L, RESET_L)
  	VARIABLE INT_OLD_ADDRESS : INTEGER;
	  VARIABLE INT_ADDRESS : INTEGER;
  BEGIN
	  INT_ADDRESS := TO_INTEGER(UNSIGNED('0' & ADDRESS(11 DOWNTO 1) & '0'));
    IF (RESET_L = 'U') AND (MREAD_L = 'U') AND (MWRITEH_L = 'U') AND (MWRITEL_L = 'U') THEN
      -- resetting
      ASSERT TRUE;
    ELSIF ((INT_ADDRESS >= 0) AND (INT_ADDRESS <= 4095)) THEN
      IF (MWRITEH_L'EVENT AND (MWRITEH_L = '0') AND (MWRITEL_L'LAST_VALUE /= '1')) THEN
        ASSERT FALSE
        REPORT "MEMORY WRITE HI-LO TIMING ERROR"
        SEVERITY FAILURE;
      END IF;
    
      IF (MWRITEL_L'EVENT AND (MWRITEL_L = '0') AND (MWRITEH_L'LAST_VALUE /= '1')) THEN
        ASSERT FALSE 
        REPORT "MEMORY WRITE LO-HI TIMING ERROR"
        SEVERITY FAILURE;
        END IF;
    
      IF (MWRITEL_L'EVENT AND (MWRITEL_L'LAST_VALUE = '0') AND (INT_ADDRESS /= INT_OLD_ADDRESS)) THEN
        ASSERT FALSE 
        REPORT "MEMORY WRITE LO TIMING ERROR"
        SEVERITY FAILURE;
      END IF;
    
      IF (MWRITEH_L'EVENT AND (MWRITEH_L'LAST_VALUE = '0') AND (INT_ADDRESS /= INT_OLD_ADDRESS)) THEN
        ASSERT FALSE 
        REPORT "MEMORY WRITE HI TIMING ERROR"
        SEVERITY FAILURE;
      END IF;
    
      IF (MREAD_L'EVENT AND (MREAD_L'LAST_VALUE = '0') AND (INT_ADDRESS /= INT_OLD_ADDRESS)) THEN
        ASSERT FALSE 
        REPORT "MEMORY READ TIMING ERROR"
        SEVERITY FAILURE;
      END IF;
    
      IF (MREAD_L = '0' AND MWRITEL_L = '1' AND MWRITEH_L = '1') THEN
        INT_OLD_ADDRESS := INT_ADDRESS;
      ELSIF ((MWRITEL_L = '0' OR MWRITEH_L = '0') AND MREAD_L = '1') THEN
        INT_OLD_ADDRESS := INT_ADDRESS;
      ELSIF (RESET_L'event AND ((RESET_L = '0') OR (RESET_L = '1'))) THEN
        -- reset_l signal going inactive
        ASSERT TRUE;
      ELSIF (MREAD_L'event AND ((MREAD_L = '1') AND (MREAD_L'LAST_VALUE = '0'))) THEN
        -- read_l signal going inactive
        ASSERT TRUE;
      ELSIF (MWRITEL_L'event AND ((MWRITEL_L = '1') AND (MWRITEL_L'LAST_VALUE = '0'))) THEN
        -- read_l signal going inactive
        ASSERT TRUE;
      ELSIF (MWRITEH_L'event AND ((MWRITEH_L = '1') AND (MWRITEH_L'LAST_VALUE = '0'))) THEN
        -- read_l signal going inactive
        ASSERT TRUE;
      ELSE
        ASSERT FALSE 
        REPORT "MEMORY WRITE"
        SEVERITY FAILURE;
        END IF;
    ELSE
      ASSERT FALSE
      REPORT "INVALID ADDRESS"
      SEVERITY FAILURE;
    END IF;
  END PROCESS;
END ARCHITECTURE untitled;

