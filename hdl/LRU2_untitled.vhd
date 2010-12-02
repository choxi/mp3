--
-- VHDL Architecture ece411.LRU2.untitled
--
-- Created:
--          by - cjpark3.stdt (eelnx18.ews.illinois.edu)
--          at - 12:57:40 12/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LRU2 IS
-- Declarations
PORT( 
      LRUIn    : IN     lc3b_reg;
      LRUwrite : IN     std_logic;
      index    : IN     lc3b_cindex;
      LRUout   : OUT    lc3b_reg;
      RESET_L  : IN     std_logic
   );

END LRU2 ;

--
ARCHITECTURE untitled OF LRU2 IS
TYPE LRUArray IS	array (7 downto 0) of std_logic_vector(6 downto 0);
	SIGNAL LRU : LRUArray;
  -- LRU is the pseudo state. I'm lining them up 0123456

	BEGIN
		--------------------------------------------------------------
		ReadFromLRUArray : PROCESS (LRU, Index)
		--------------------------------------------------------------
    
			VARIABLE LRUIndex : integer;
			VARIABLE LRUState : std_logic_vector(6 downto 0);
			VARIABLE LINE_C   : integer;
			VARIABLE NEWLRUout: integer;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
				
				LRUState := LRU(LINE_C);
				
				--if (LRUState
				
				LRUState(0) <= NOT LRUState(0);
        if ( LINE_C >= 0 AND LINE_C <= 3 ) then
          LRUState(1) <= NOT LRUState(1);
        end if;
        if ( LINE_C >= 4 AND LINE_C <= 7 ) then
          LRUState(2) <= NOT LRUState(2);
        end if;
        if ( LINE_C = 0 OR LINE_C = 1 ) then
          LRUState(3) <= NOT LRUState(3);
        end if;
        if ( LINE_C = 2 OR LINE_C = 3 ) then
          LRUState(4) <= NOT LRUState(4);
        end if;
        if ( LINE_C = 4 OR LINE_C = 5 ) then
          LRUState(5) <= NOT LRUState(5);
        end if;
        if ( LINE_C = 6 OR LINE_C = 7 ) then
          LRUState(6) <= NOT LRUState(6);
        end if;
				
				LRUOut <= LRU(LRUIndex) after 20 ns;

		END PROCESS ReadFromLRUArray;
	
		--------------------------------------------------------------
		WriteToLRUArray : PROCESS (RESET_L, LRU, LRUWrite, LRUIn)
		-------------------------------------------------------	------	
			VARIABLE LRUIndex : integer;
			BEGIN
				LRUIndex := to_integer(unsigned(Index));
			IF RESET_L = '0' THEN
				LRU(0) <= "0000000";
				LRU(1) <= "0000000";
				LRU(2) <= "0000000";
				LRU(3) <= "0000000";
				LRU(4) <= "0000000";
				LRU(5) <= "0000000";
				LRU(6) <= "0000000";
				LRU(7) <= "0000000";
			END IF;

			IF (LRUWrite = '1') THEN
				LRU(LRUIndex) <= LRUIn;
			END IF;
		
		END PROCESS WriteToLRUArray;
END ARCHITECTURE untitled;

