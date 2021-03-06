LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagArray_L2 IS
   PORT( 
      Reset_l  : IN     std_logic;
      TagIn    : IN     lc3b_tag;
      TagWrite : IN     std_logic;
      index    : IN     lc3b_cindex;
      Tagout   : OUT    lc3b_tag
   );

-- Declarations

END TagArray_L2 ;

--
ARCHITECTURE untitled OF TagArray_L2 IS

	TYPE TagArray IS	array (7 downto 0) of LC3b_tag;
	SIGNAL Tag : TagArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromTagArray : PROCESS (Tag, Index)
		--------------------------------------------------------------
    
			VARIABLE TagIndex : integer;
			BEGIN
				TagIndex := to_integer(unsigned(Index));
				TagOut <= Tag(TagIndex) after 25 ns;
		
		END PROCESS ReadFromTagArray;
	
		--------------------------------------------------------------
		WriteToTagArray : PROCESS (RESET_L, Index, TagWrite, TagIn)
		-------------------------------------------------------	------	
			VARIABLE TagIndex : integer;
			BEGIN
				TagIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				Tag(0) <= (OTHERS => 'X');
				Tag(1) <= (OTHERS => 'X');
				Tag(2) <= (OTHERS => 'X');
				Tag(3) <= (OTHERS => 'X');
				Tag(4) <= (OTHERS => 'X');
				Tag(5) <= (OTHERS => 'X');
				Tag(6) <= (OTHERS => 'X');
				Tag(7) <= (OTHERS => 'X');
			END IF;

			IF (TagWrite = '1') THEN
				Tag(TagIndex) <= TagIn;
			END IF;
		
		END PROCESS WriteToTagArray;

END ARCHITECTURE untitled;


