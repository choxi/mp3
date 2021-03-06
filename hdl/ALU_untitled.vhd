--
-- VHDL Architecture ece411.ALU.untitled
--
-- Created:
--          by - tkalbar2.stdt (eelnx13.ews.illinois.edu)
--          at - 22:36:02 09/01/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ALU IS
   PORT( 
      A         : IN     LC3b_word;
      B         : IN     LC3b_word;
      ALUop     : IN     LC3b_aluop;
      ALUout    : OUT    LC3b_word
   );

-- Declarations

END ALU ;


--
ARCHITECTURE untitled OF ALU IS

BEGIN

	----------------------------------------
	VHDL_ALU : PROCESS (A, B, ALUOP)
	----------------------------------------
	VARIABLE TEMP_ALUOUT : LC3B_WORD;
	variable COUNT: integer;
	BEGIN
		-- CHECK FOR ALU OPERATION TYPE, AND EXECUTE
		CASE ALUOP IS
			WHEN ALU_ADD =>
				TEMP_ALUOUT := STD_LOGIC_VECTOR(SIGNED(A) + SIGNED(B));
			WHEN ALU_AND =>
				TEMP_ALUOUT := (A AND B);
 			WHEN ALU_NOT =>
				TEMP_ALUOUT := (A XOR "1111111111111111");
			WHEN ALU_SLL =>
			  TEMP_ALUOUT := std_logic_vector(unsigned(A) sll to_integer(unsigned(B(3 downto 0))));
			WHEN ALU_SRL =>
			  TEMP_ALUOUT := std_logic_vector(unsigned(A) srl to_integer(unsigned(B(3 downto 0))));
			WHEN ALU_SRA =>
			  COUNT := to_integer(unsigned(B(3 downto 0)));
			  if (B(3 downto 0) = "0000") then
			    TEMP_ALUOUT := A;
			  else
			    TEMP_ALUOUT(15 - COUNT downto 0) := A(15 downto COUNT);
			    TEMP_ALUOUT(15 downto (15 - COUNT + 1)) := (others => A(15));
			  end if;
			WHEN ALU_PASS =>
				TEMP_ALUOUT := (A);
			WHEN OTHERS =>
		END CASE;
	--SET OUTPUT VALUE ALUOUT TO BE THE TEMPORARY VALUE CALCULATED WITHIN THE PROCESS AFTER A DELAY
	ALUOUT <= TEMP_ALUOUT AFTER DELAY_ALU;
	END PROCESS VHDL_ALU;
END untitled;

