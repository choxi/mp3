echo "--- Executing initialization force file for btest.vhd ---"

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

echo "Done initializing processor, loading btest.vhd program code."
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(0) X"7F"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(1) X"12"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(2) X"BF"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(3) X"14"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(4) X"14"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(5) X"2C"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(6) X"15"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(7) X"2E"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(8) X"14"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(9) X"22"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(10) X"15"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(11) X"24"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(12) X"16"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(13) X"3C"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(14) X"17"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(15) X"3E"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(16) X"0B"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(17) X"6A"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(18) X"FF"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(19) X"0F"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(20) X"0D"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(21) X"60"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(22) X"FF"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(23) X"FF"
run 5
echo "Done loading btest.vhd program code."
