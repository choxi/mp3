echo "--- Executing initialization force file for traptest.vhd ---"

echo "Setting clock period to 34 ns, starting at 34 ns."
force /clk 1  0
force /clk 0 17 -r 34
force /clk 1 34 -r 34

echo "Resetting processor for 5 ns."
force /reset_l 0 @0
force /reset_l 1 @5

-- echo "Initializing the processor."
-- force /start_h 0 @0
-- force /start_h 1 @10

-- Test case: lowering start_h should not impact the function of the processor
-- force /start_h 0 @ 100

echo "Done initializing processor, loading traptest.vhd program code."
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(0) X"0A"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(1) X"F0"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(2) X"13"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(3) X"E2"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(4) X"40"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(5) X"C0"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(6) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(7) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(8) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(9) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(10) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(11) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(12) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(13) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(14) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(15) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(16) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(17) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(18) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(19) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(20) X"26"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(21) X"00"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(22) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(23) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(24) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(25) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(26) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(27) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(28) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(29) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(30) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(31) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(32) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(33) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(34) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(35) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(36) X"21"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(37) X"10"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(38) X"2F"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(39) X"19"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(40) X"C0"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(41) X"C1"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(42) X"FF"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(43) X"0F"
run 5
echo "Done loading traptest.vhd program code."
