echo "--- Executing initialization force file for traptest.vhd ---"

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

echo "Done initializing processor, loading traptest.vhd program code."
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(40) X"1E"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(41) X"F0"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(42) X"13"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(43) X"E2"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(44) X"40"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(45) X"C0"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(46) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(47) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(48) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(49) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(50) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(51) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(52) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(53) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(54) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(55) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(56) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(57) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(58) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(59) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(60) X"4E"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(61) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(62) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(63) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(64) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(65) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(66) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(67) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(68) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(69) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(70) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(71) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(72) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(73) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(74) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(75) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(76) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(77) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(78) X"2F"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(79) X"19"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(80) X"C0"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(81) X"C1"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(82) X"FF"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(83) X"0F"
run 5
echo "Done loading traptest.vhd program code."
