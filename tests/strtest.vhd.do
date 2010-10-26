echo "--- Executing initialization force file for strtest.vhd ---"

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

echo "Done initializing processor, loading strtest.vhd program code."
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(0) X"0D"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(1) X"62"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(2) X"10"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(3) X"72"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(4) X"11"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(5) X"74"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(6) X"12"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(7) X"76"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(8) X"10"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(9) X"68"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(10) X"11"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(11) X"6A"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(12) X"12"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(13) X"6C"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(14) X"FF"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(15) X"0F"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(16) X"00"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(17) X"00"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(18) X"00"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(19) X"00"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(20) X"00"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(21) X"00"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(22) X"D0"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(23) X"BA"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(24) X"D1"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(25) X"BA"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(26) X"0D"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(27) X"60"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(28) X"D2"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(29) X"BA"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(30) X"D3"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(31) X"BA"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(32) X"D1"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(33) X"BA"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(34) X"D2"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(35) X"BA"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(36) X"D3"
change /mp3_cpu/memory/DRAM_magic/vhdl_memory/mem(37) X"BA"
run 5
echo "Done loading strtest.vhd program code."
