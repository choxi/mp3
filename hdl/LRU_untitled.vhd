LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRU IS
   PORT( 
      LRUIn    : IN     std_logic;
      LRUwrite : IN     std_logic;
      index    : IN     lc3b_cindex;
      LRUout   : OUT    std_logic;
      RESET_L  : IN     std_logic
   );

-- Declarations

END LRU ;

--
ARCHITECTURE untitled OF LRU IS

	TYPE LRUArray IS	array (7 downto 0) of std_logic;
	SIGNAL LRU : LRUArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromLRUArray : PROCESS (LRU, Index)
		--------------------------------------------------------------
    
			VARIABLE LRUIndex : integer;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
				LRUOut <= LRU(LRUIndex) after 10 ns;
		
		END PROCESS ReadFromLRUArray;
	
		--------------------------------------------------------------
		WriteToLRUArray : PROCESS (RESET_L, LRU, LRUWrite, LRUIn)
		-------------------------------------------------------	------	
			VARIABLE LRUIndex : integer;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				LRU(0) <= '0';
				LRU(1) <= '0';
				LRU(2) <= '0';
				LRU(3) <= '0';
				LRU(4) <= '0';
				LRU(5) <= '0';
				LRU(6) <= '0';
				LRU(7) <= '0';
			END IF;

			IF (LRUWrite = '1') THEN
				LRU(LRUIndex) <= LRUIn;
			END IF;
		
		END PROCESS WriteToLRUArray;

END ARCHITECTURE untitled;
