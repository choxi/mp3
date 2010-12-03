--
-- VHDL Architecture ece411.LRUVector8.untitled
--
-- Created:
--          by - rchoxi2.stdt (gllnx14.ews.illinois.edu)
--          at - 22:36:39 12/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRUVector8 IS
   PORT( 
      LRUIn    : IN     lc3b_24;
      LRUwrite : IN     std_logic;
      index    : IN     lc3b_cindex;
      LRUout   : OUT    lc3b_24;
      LRUout0  : OUT    lc3b_reg;
      LRUout1  : OUT    lc3b_reg;
      LRUout2  : OUT    lc3b_reg;
      LRUout3  : OUT    lc3b_reg;
      LRUout4  : OUT    lc3b_reg;
      LRUout5  : OUT    lc3b_reg;
      LRUout6  : OUT    lc3b_reg;
      LRUout7  : OUT    lc3b_reg;
      RESET_L  : IN     std_logic
   );

-- Declarations

END LRUVector8 ;

--
ARCHITECTURE untitled OF LRUVector8 IS
	TYPE LRUArray IS	array (7 downto 0) of lc3b_24;
	SIGNAL LRU : LRUArray;

	BEGIN
		--------------------------------------------------------------
		ReadFromLRUArray : PROCESS (LRU, Index)
		--------------------------------------------------------------
    
			VARIABLE LRUIndex : integer;
			VARIABLE PreLRUout : lc3b_24;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
				PreLRUout := LRU(LRUIndex);
				LRUOut <= PreLRUout after 10 ns;
				LRUout7 <= PreLRUout(2 downto 0) after 25ns;
				LRUout6 <= PreLRUout(5 downto 3) after 25ns;
				LRUout5 <= PreLRUout(8 downto 6) after 25ns;
				LRUout4 <= PreLRUout(11 downto 9) after 25ns;
				LRUout3 <= PreLRUout(14 downto 12) after 25ns;
				LRUout2 <= PreLRUout(17 downto 15) after 25ns;
				LRUout1 <= PreLRUout(20 downto 18) after 25ns;
				LRUout0 <= PreLRUout(23 downto 21) after 25ns;
		
		END PROCESS ReadFromLRUArray;
	
		--------------------------------------------------------------
		WriteToLRUArray : PROCESS (RESET_L, LRU, LRUWrite, LRUIn)
		-------------------------------------------------------	------	
			VARIABLE LRUIndex : integer;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				LRU(0) <= "000001010011100101110111";
				LRU(1) <= "000001010011100101110111";
				LRU(2) <= "000001010011100101110111";
				LRU(3) <= "000001010011100101110111";
				LRU(4) <= "000001010011100101110111";
				LRU(5) <= "000001010011100101110111";
				LRU(6) <= "000001010011100101110111";
				LRU(7) <= "000001010011100101110111";
			END IF;

			IF (LRUWrite = '1') THEN
				LRU(LRUIndex) <= LRUIn;
			END IF;
		
		END PROCESS WriteToLRUArray;
END ARCHITECTURE untitled;

