LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DirtyArray_L2 IS
   PORT( 
      DirtyIn    : IN     std_logic;
      DirtyWrite : IN     std_logic;
      Reset_l    : IN     std_logic;
      index      : IN     lc3b_cindex;
      DirtyOut   : OUT    std_logic
   );

-- Declarations

END DirtyArray_L2 ;

--
ARCHITECTURE untitled OF DirtyArray_L2 IS

	TYPE DirtyArray IS	array (7 downto 0) of std_logic;
	SIGNAL Dirty : DirtyArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromDirtyArray : PROCESS (Dirty, Index)
		--------------------------------------------------------------
    
			VARIABLE DirtyIndex : integer;
			BEGIN
				DirtyIndex := to_integer(unsigned(Index));
				DirtyOut <= Dirty(DirtyIndex) after 25 ns;
		
		END PROCESS ReadFromDirtyArray;
	
		--------------------------------------------------------------
		WriteToDirtyArray : PROCESS (RESET_L, Index, DirtyWrite, DirtyIn)
		-------------------------------------------------------	------	
			VARIABLE DirtyIndex : integer;
			BEGIN
				DirtyIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Dirty(0) <= '0';
				Dirty(1) <= '0';
				Dirty(2) <= '0';
				Dirty(3) <= '0';
				Dirty(4) <= '0';
				Dirty(5) <= '0';
				Dirty(6) <= '0';
				Dirty(7) <= '0';
			END IF;

			IF (DirtyWrite = '1') THEN
				Dirty(DirtyIndex) <= DirtyIn;
			END IF;
		
		END PROCESS WriteToDirtyArray;

END ARCHITECTURE untitled;