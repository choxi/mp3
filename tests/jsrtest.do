echo "--- Executing initialization force file for jsrtest.vhd ---"

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

echo "Done initializing processor, loading jsrtest.vhd program code."
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(0) X"04"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(1) X"19"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(2) X"02"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(3) X"48"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(4) X"0B"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(5) X"6C"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(6) X"FE"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(7) X"0F"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(8) X"08"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(9) X"6C"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(10) X"FE"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(11) X"0F"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(12) X"D0"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(13) X"BA"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(14) X"D1"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(15) X"BA"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(16) X"0D"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(17) X"60"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(18) X"D2"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(19) X"BA"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(20) X"D3"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(21) X"BA"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(22) X"DD"
change /mp3_cpu/memory/DRAM/vhdl_memory/mem(23) X"BA"
run 5
echo "Done loading jsrtest.vhd program code."
