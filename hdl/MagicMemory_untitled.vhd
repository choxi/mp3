--
-- VHDL Architecture ece411.MagicMemory.untitled
--
-- Created:
--          by - tkalbar2.ece411_G2 (eelnx34.ews.illinois.edu)
--          at - 22:00:35 10/19/10
--
-- using Mentor Graphics HDL Designer(TM) 2005.3 (Build 75)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MagicMemory IS
   PORT( 
      D_ADDRESS  : IN     LC3b_word;
      D_DATAIN   : IN     LC3b_oword;
      D_MREAD_L  : IN     std_logic;
      D_MWRITE_L : IN     std_logic;
      I_ADDRESS  : IN     LC3b_word;
      I_MREAD_L  : IN     std_logic;
      RESET_L    : IN     std_logic;
      D_DATAOUT  : OUT    LC3b_oword;
      D_MRESP_H  : OUT    std_logic;
      I_DATAOUT  : OUT    LC3b_oword;
      I_MRESP_H  : OUT    std_logic
   );

-- Declarations

END MagicMemory ;
ARCHITECTURE untitled OF MagicMemory IS
BEGIN

	 --Add I_ADDRESS and D_ADDRESS to sensitivity list if you hard-coded MREAD_L to be 0.
   -------------------------------------------------------------------
   vhdl_memory : PROCESS (RESET_L, I_MREAD_L, D_MREAD_L, D_MWRITE_L, I_ADDRESS, D_ADDRESS) 
   -------------------------------------------------------------------
     VARIABLE mem : memory_array_64k;
     VARIABLE int_i_old_address : integer;
     VARIABLE int_d_old_address : integer;
     VARIABLE int_i_address : integer;
     VARIABLE int_d_address : integer;
   BEGIN
		int_i_address := to_integer(unsigned(I_ADDRESS(15 downto 9) & "0000000"));
   		int_d_address := to_integer(unsigned(D_ADDRESS(15 downto 9) & "0000000")); 
		IF RESET_L = '0' then
			I_MRESP_H <= '0';
			D_MRESP_H <= '0';	
			--myDRAMinit_64k(mem);
		ELSE
			--ERROR CASES checked here
			IF ((int_d_address >= 0) and (int_d_address <= 65535) and (int_i_address >= 0) and (int_i_address <= 65535)) THEN
				IF (D_MWRITE_L'event and (D_MWRITE_L'last_value = '0') and (int_d_address /= int_d_old_address)) THEN
          ASSERT false 
            REPORT "Data Memory WRITE Timing Error"
            SEVERITY note;
        END IF;
        IF (D_MREAD_L'event and (D_MREAD_L'last_value = '0') and (int_d_address /= int_d_old_address)) THEN
          ASSERT false 
            REPORT "Data Memory READ Timing Error"
            SEVERITY note;
        END IF;
        IF (I_MREAD_L'event and (I_MREAD_L'last_value = '0') and (int_i_address /= int_i_old_address)) THEN
          ASSERT false 
            REPORT "Instruction Memory READ Timing Error"
            SEVERITY note;
				END IF;

				--DELAY Latency coded to be 10 ns to simulate a "perfect" cache.
        IF (D_MREAD_L = '0' and D_MWRITE_L = '1') THEN
            D_DATAOUT(7 downto 0) <= mem(int_d_address); -- after delay_16b_mem; --TODO
            D_DATAOUT(15 downto 8) <= mem(int_d_address + 1); -- after delay_16b_mem; --TODO

            D_MRESP_H <= '1'; -- after 10 ns, '0' after 10 ns + clock_period; --TODO

        ELSIF (D_MWRITE_L = '0' and D_MREAD_L = '1') THEN
             
            mem(int_d_address) := D_DATAIN(7 downto 0);
            mem(int_d_address + 1) := D_DATAIN(15 downto 8);
            D_MRESP_H <= '1'; -- after 10 ns, '0' after 10 ns + clock_period; --TODO
           
        ELSIF (D_MWRITE_L = '0' and D_MREAD_L = '0') then
          ASSERT false 
            REPORT "Attempting to read and write DRAM simultaneously."
            SEVERITY error;
        END IF;
        
				--IF (I_MREAD_L = '0') THEN
            I_DATAOUT(7 downto 0) <= mem(int_i_address); -- after delay_16b_mem; --TODO
            I_DATAOUT(15 downto 8) <= mem(int_i_address + 1); -- after delay_16b_mem; --TODO

            I_MRESP_H <= '1';-- after 10 ns, '0' after 10 ns + clock_period;
				--END IF;

      ELSE
        ASSERT false
          REPORT "Invalid address sent to DRAM."
          SEVERITY warning;
      END IF;
    END IF;
  END PROCESS vhdl_memory;

END untitled;

