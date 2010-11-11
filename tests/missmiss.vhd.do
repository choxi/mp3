echo "--- Executing initialization force file for missmiss.vhd ---"

echo "Setting clock period to 50 ns, starting at 50 ns."
force /clk 1  0
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

echo "Done initializing processor, loading missmiss.vhd program code."
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(0) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(1) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(2) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(3) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(4) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(5) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(6) X"22"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(7) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(8) X"09"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(9) X"A2"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(10) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(11) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(12) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(13) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(14) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(15) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(16) X"FF"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(17) X"0F"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(18) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(19) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(20) X"20"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(21) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(22) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(23) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(24) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(25) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(26) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(27) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(28) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(29) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(30) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(31) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(32) X"0D"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(33) X"60"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(34) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(35) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(36) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(37) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(38) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(39) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(40) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(41) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(42) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(43) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(44) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(45) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(46) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(47) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(48) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(49) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(50) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(51) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(52) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(53) X"B4"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(54) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(55) X"B4"
run 5
echo "Done loading missmiss.vhd program code."
