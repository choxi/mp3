LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ControlROM IS
   PORT(
      RESET_L      : IN     std_logic;
      Clk          : IN     std_logic;
      Opcode       : IN     LC3b_opcode;
      Bit4         : IN     std_logic;
      Bit5         : IN     std_logic;
      AdjSel_ID    : OUT    std_logic;
      SextSel_ID   : OUT    std_logic;
      BaseSel_ID   : OUT    std_logic;
      ImmSel_ID    : OUT    std_logic;
      ALUop_ID     : OUT    LC3b_aluop;
      Branch_ID    : OUT    std_logic;
      Write_ID     : OUT    std_logic;
      Read_ID      : OUT    std_logic;
      RegWrite_ID  : OUT    std_logic;
      ALUMemSel_ID : OUT    std_logic;
      SetCC_ID     : OUT    std_logic
   );

-- Declarations

END ControlROM ;

--

ARCHITECTURE untitled OF ControlROM IS

signal AdjSel    : std_logic;
signal SextSel   : std_logic;
signal BaseSel   : std_logic;
signal ImmSel    : std_logic;
signal ALUop     : LC3b_aluop;
signal Branch    : std_logic;
signal Write     : std_logic;
signal Read      : std_logic;
signal RegWrite  : std_logic;
signal ALUMemSel : std_logic;
signal SetCC     : std_logic;
BEGIN
  --input_word <= opcode & bit5 & bit4; 
  generate_signals : process (opcode, bit5, bit4)
  begin
  
  case opcode is
    when OP_ADD =>
      AdjSel     <= '1';
      SextSel    <= '0';
      BaseSel    <= '0';
      if (bit5 = '1') then
        ImmSel   <= '1';
      else
        ImmSel   <= '0';
      end if;
      ALUop      <= ALU_ADD;
      Branch     <= '0';
      Write      <= '1';
      Read       <= '1';
      RegWrite   <= '1';
      ALUMemSel  <= '0';
      SetCC   	  <= '1';
      
    when OP_AND =>
      AdjSel     <= '1';
      SextSel    <= '0';
      BaseSel    <= '0';
      if (bit5 = '1') then
        ImmSel   <= '1';
      else
        ImmSel   <= '0';
      end if;
      ALUop      <= ALU_AND;
      Branch     <= '0';
      Write      <= '1';
      Read       <= '1';
      RegWrite   <= '1';
      ALUMemSel  <= '0';
      SetCC      <= '1';

    when OP_BR =>
      AdjSel     <= '1';
      SextSel    <= '1';
      BaseSel    <= '1';
      ImmSel     <= '0';
      ALUop      <= ALU_PASS;
      Branch     <= '1';
      Write      <= '1';
      Read       <= '1';
      RegWrite   <= '0';
      ALUMemSel  <= '0';
      SetCC	     <= '0';
      
    when OP_LDR =>
      AdjSel     <= '1';
      SextSel    <= '0';
      BaseSel    <= '0';
      ImmSel     <= '0';
      ALUop      <= ALU_PASS;
      Branch     <= '0';
      Write      <= '1';
      Read       <= '0';
      RegWrite   <= '1';
      ALUMemSel  <= '1';
      SetCC   	  <= '1';
      
    when OP_NOT =>
      AdjSel     <= '1';
      SextSel    <= '0';
      BaseSel    <= '0';
      ImmSel     <= '0';
      ALUop      <= ALU_NOT;
      Branch     <= '0';
      Write      <= '1';
      Read       <= '1';
      RegWrite   <= '1';
      ALUMemSel  <= '0';
      SetCC   	  <= '1'; 
    
    when OP_SHF =>
      AdjSel     <= '1';
      SextSel    <= '0';
      BaseSel    <= '0';
      ImmSel     <= '1';
      if (bit4 = '0') then
        ALUop    <= ALU_SLL;
      elsif (bit5 = '0') then
        ALUop    <= ALU_SRL;
      else
        ALUop    <= ALU_SRA;
      end if;
      ALUop      <= ALU_PASS;
      Branch     <= '0';
      Write      <= '1';
      Read       <= '1';
      RegWrite   <= '1';
      ALUMemSel  <= '0';
      SetCC   	  <= '1';      
    
    when OP_STR =>
      AdjSel     <= '1';
      SextSel    <= '0';
      BaseSel    <= '0';
      ImmSel     <= '0';
      ALUop      <= ALU_PASS;
      Branch     <= '0';
      Write      <= '0';
      Read       <= '1';
      RegWrite   <= '0';
      ALUMemSel  <= '1';
      SetCC   	  <= '1';
      
    when others =>
      AdjSel     <= '1';
      SextSel    <= '0';
      BaseSel    <= '0';
      ImmSel     <= '0';
      ALUop      <= ALU_PASS;
      Branch     <= '1';
      Write      <= '1';
      Read       <= '1';
      RegWrite   <= '0';
      ALUMemSel  <= '0';
      SetCC	     <= '0';
  end case;
  end process;
    AdjSel_ID       <= AdjSel after delay_rom;
    SextSel_ID      <= SextSel after delay_rom;
    BaseSel_ID      <= BaseSel after delay_rom;
    ImmSel_ID       <= ImmSel after delay_rom;
    ALUop_ID        <= ALUop after delay_rom;
    Branch_ID       <= Branch after delay_rom;
    Write_ID        <= Write after delay_rom;
    Read_ID         <= Read after delay_rom;
    RegWrite_ID     <= RegWrite after delay_rom;
    ALUMemSel_ID    <= ALUMemSel after delay_rom;
    SetCC_ID	       <= SetCC after delay_rom;
end untitled; 
