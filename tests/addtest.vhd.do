echo "--- Executing initialization force file for addtest.vhd ---"

echo "Setting clock period to 50 ns, starting at 50 ns."
force /clk 0  0
force /clk 0 25 -r 50
force /clk 1 50 -r 50

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5

-- echo "Initializing the processor."
-- force /start_h 0 @0
-- force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
-- force /start_h 0 @ 100

echo "Done initializing processor, loading addtest.vhd program code."
run 5
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(0) X"61"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(1) X"12"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(2) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(3) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(4) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(5) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(6) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(7) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(8) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(9) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(10) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(11) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(12) X"FA"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(13) X"0F"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(14) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(15) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(16) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(17) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(18) X"00"
change /mp3_cpu/DRAM_magic/vhdl_memory/mem(19) X"00"
run 5
echo "Done loading addtest.vhd program code."
