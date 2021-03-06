--
-- VHDL Architecture ece411.Valid_Array.untitled
--
-- Created:
--          by - tkalbar2.stdt (gllnx27.ews.illinois.edu)
--          at - 04:28:46 09/30/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Valid_Array_L2 IS
   PORT( 
      Reset_l    : IN     std_logic;
      ValidWrite : IN     std_logic;
      index      : IN     lc3b_cindex;
      ValidOut   : OUT    std_logic
   );

-- Declarations

END Valid_Array_L2 ;

--
ARCHITECTURE untitled OF Valid_Array_L2 IS
TYPE ValidArray IS	array (7 downto 0) of std_logic;
	SIGNAL Valid : ValidArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromValidArray : PROCESS (Valid, Index)
		--------------------------------------------------------------
    
			VARIABLE ValidIndex : integer;
			BEGIN
				ValidIndex := to_integer(unsigned(Index));
				ValidOut <= Valid(ValidIndex) after 25 ns;
		
		END PROCESS ReadFromValidArray;
	
		--------------------------------------------------------------
		WriteToValidArray : PROCESS (RESET_L, Valid, ValidWrite)
		-------------------------------------------------------	------	
			VARIABLE ValidIndex : integer;
			BEGIN
				ValidIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Valid(0) <= '0';
				Valid(1) <= '0';
				Valid(2) <= '0';
				Valid(3) <= '0';
				Valid(4) <= '0';
				Valid(5) <= '0';
				Valid(6) <= '0';
				Valid(7) <= '0';
			ELSIF (ValidWrite = '1') THEN
			  Valid(ValidIndex) <= '1';
			ELSE
			  Valid(ValidIndex) <= Valid(ValidIndex);
			END IF;
		
		END PROCESS WriteToValidArray;
END ARCHITECTURE untitled;

