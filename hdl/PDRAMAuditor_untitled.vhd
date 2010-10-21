--
-- VHDL Architecture ece411.PDRAMAuditor.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx27.ews.illinois.edu)
--          at - 02:56:10 09/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY PDRAMAuditor IS
   PORT( 
      PMADDRESS : IN     LC3b_word;
      RESET_L   : IN     std_logic;
      PMREAD_L  : IN     std_logic;
      PMWRITE_L : IN     std_logic
   );

-- Declarations

END PDRAMAuditor ;

--
ARCHITECTURE untitled OF PDRAMAuditor IS
BEGIN
  PROCESS (RESET_L, PMREAD_L, PMWRITE_L, RESET_L)
  	VARIABLE INT_OLD_ADDRESS : INTEGER;
	  VARIABLE INT_ADDRESS : INTEGER;
  BEGIN
	  INT_ADDRESS := TO_INTEGER(UNSIGNED('0' & PMADDRESS(11 DOWNTO 1) & '0'));
    IF (RESET_L = 'U') AND (PMREAD_L = 'U') AND (PMWRITE_L = 'U') THEN
      -- resetting
      ASSERT TRUE;
    ELSIF ((INT_ADDRESS >= 0) AND (INT_ADDRESS <= 4095)) THEN
    
      IF (PMWRITE_L'EVENT AND (PMWRITE_L = '0') AND (PMWRITE_L'DELAYED(1ns) /= '1')) THEN
        ASSERT FALSE
        REPORT "MEMORY WRITE HI-LO TIMING ERROR"
        SEVERITY FAILURE;
      END IF;
    
      IF (PMWRITE_L'EVENT AND (PMWRITE_L'LAST_VALUE = '0') AND (INT_ADDRESS /= INT_OLD_ADDRESS)) THEN
        ASSERT FALSE 
        REPORT "MEMORY WRITE TIMING ERROR"
        SEVERITY NOTE;
      END IF;
    
      IF (PMREAD_L'EVENT AND (PMREAD_L'LAST_VALUE = '0') AND (INT_ADDRESS /= INT_OLD_ADDRESS)) THEN
        ASSERT FALSE 
        REPORT "MEMORY READ TIMING ERROR"
        SEVERITY NOTE;
      END IF;
    
      IF (PMREAD_L = '0' AND PMWRITE_L = '1') THEN
        INT_OLD_ADDRESS := INT_ADDRESS;
      ELSIF (PMWRITE_L = '0' AND PMREAD_L = '1') THEN
        INT_OLD_ADDRESS := INT_ADDRESS;
      ELSIF (RESET_L'event AND ((RESET_L = '0') OR (RESET_L = '1'))) THEN
        ASSERT TRUE;
      ELSIF (PMREAD_L'event AND ((PMREAD_L = '1') AND (PMREAD_L'LAST_VALUE = '0'))) THEN
        ASSERT TRUE;
      ELSIF (PMWRITE_L'event AND ((PMWRITE_L = '1') AND (PMWRITE_L'LAST_VALUE = '0'))) THEN
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



