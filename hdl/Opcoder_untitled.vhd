--
-- VHDL Architecture ece411.Opcoder.untitled
--
-- Created:
--          by - cjpark3.stdt (eelnx30.ews.illinois.edu)
--          at - 21:30:57 11/02/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Opcoder IS
   PORT( 
      Opcode : IN     LC3b_opcode
   );

-- Declarations

END Opcoder ;

--

ARCHITECTURE untitled OF Opcoder IS

  TYPE STATE_TYPE IS(
    ADD_o,
    AND_o,
    BR_o,
    JMP_o,
    JSR_o,
    LDB_o,
    LDI_o,
    LDR_o,
    LEA_o,
    NOT_o,
    RTI_o,
    SHF_o,
    STB_o,
    STI_o,
    STR_o,
    TRAP_o,
    NOP_o
  );
 
  ATTRIBUTE state_vector : string;
  ATTRIBUTE state_vector OF untitled: Architecture is "current_state";
 
  Signal current_state: STATE_TYPE;

BEGIN
  update_string: process (opcode)
  begin
    if (opcode = "0000") then       current_state <= BR_o;
    elsif (opcode = "0001") then    current_state <= ADD_o;
    elsif (opcode = "0010") then    current_state <= LDB_o;
    elsif (opcode = "0011") then    current_state <= STB_o;
    elsif (opcode = "0100") then    current_state <= JSR_o;
    elsif (opcode = "0101") then    current_state <= AND_o;
    elsif (opcode = "0110") then    current_state <= LDR_o;
    elsif (opcode = "0111") then    current_state <= STR_o;
    elsif (opcode = "1000") then    current_state <= RTI_o;
    elsif (opcode = "1001") then    current_state <= NOT_o;
    elsif (opcode = "1010") then    current_state <= LDI_o;
    elsif (opcode = "1011") then    current_state <= STI_o;
    elsif (opcode = "1100") then    current_state <= JMP_o;
    elsif (opcode = "1101") then    current_state <= SHF_o;
    elsif (opcode = "1110") then    current_state <= LEA_o;
    elsif (opcode = "1111") then    current_state <= TRAP_o;
    else                            current_state <= NOP_o;
    end if;
  end process update_string;
END ARCHITECTURE untitled;
