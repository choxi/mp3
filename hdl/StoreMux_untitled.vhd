--
-- VHDL Architecture ece411.StoreMux.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx13.ews.illinois.edu)
--          at - 22:49:08 09/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StoreMux IS
   PORT( 
      SrcA        : IN     LC3b_reg;
      StoreSR     : IN     std_logic;
      dest        : IN     LC3b_reg;
      StoreMuxout : OUT    LC3b_reg
   );

-- Declarations

END StoreMux ;

--
ARCHITECTURE untitled OF StoreMux IS
  BEGIN
    PROCESS (dest, SrcA, StoreSR)
    VARIABLE STATE : LC3B_reg;
    BEGIN
      CASE StoreSR IS
        WHEN '0' =>
          STATE := dest;
        WHEN '1' =>
          STATE := SrcA;  
        WHEN OTHERS =>
          STATE := (OTHERS => 'X');
      END CASE;
    StoreMuxout <= STATE AFTER DELAY_MUX2;
    END PROCESS;
END UNTITLED;

