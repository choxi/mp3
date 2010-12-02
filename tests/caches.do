onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group DataCache
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/clk
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/al1_controller/current_state
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/mread_l
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/mwriteh_l
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/mwritel_l
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/reset_l
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/address
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/cachedatain
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/cachedataout
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/pmdataout
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/pmdatain
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/pmresp_h
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/mresp_h
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/pmaddress
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/pmread_l
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/pmwrite_l
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/dirty
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/miss
add wave -noupdate -group InstructionCache
add wave -noupdate -group InstructionCache -format Literal -height 16 /mp3_cpu/memory/instrcache/al1_controller/current_state
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/clk
add wave -noupdate -group InstructionCache -format Literal -height 16 /mp3_cpu/memory/instrcache/address
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/mread_l
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/mwriteh_l
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/mwritel_l
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/reset_l
add wave -noupdate -group InstructionCache -format Literal -height 16 /mp3_cpu/memory/instrcache/cachedatain
add wave -noupdate -group InstructionCache -format Literal -height 16 /mp3_cpu/memory/instrcache/cachedataout
add wave -noupdate -group InstructionCache -format Literal -height 16 /mp3_cpu/memory/instrcache/pmdataout
add wave -noupdate -group InstructionCache -format Literal -height 16 /mp3_cpu/memory/instrcache/pmdatain
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/pmresp_h
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/mresp_h
add wave -noupdate -group InstructionCache -format Literal -height 16 /mp3_cpu/memory/instrcache/pmaddress
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/pmread_l
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/pmwrite_l
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/dirty
add wave -noupdate -group InstructionCache -format Logic -height 16 /mp3_cpu/memory/instrcache/miss
add wave -noupdate -group L2Cache
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/clk
add wave -noupdate -group L2Cache -format Literal -height 16 /mp3_cpu/memory/al2_cache/al2_controller/current_state
add wave -noupdate -group L2Cache -format Literal -height 16 /mp3_cpu/memory/al2_cache/address
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/mread_l
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/mwriteh_l
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/mwritel_l
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/reset_l
add wave -noupdate -group L2Cache -format Literal -height 16 /mp3_cpu/memory/al2_cache/cachedatain
add wave -noupdate -group L2Cache -format Literal -height 16 /mp3_cpu/memory/al2_cache/cachedataout
add wave -noupdate -group L2Cache -format Literal -height 16 /mp3_cpu/memory/al2_cache/pmdataout
add wave -noupdate -group L2Cache -format Literal -height 16 /mp3_cpu/memory/al2_cache/pmdatain
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/pmresp_h
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/mresp_h
add wave -noupdate -group L2Cache -format Literal -height 16 /mp3_cpu/memory/al2_cache/pmaddress
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/pmread_l
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/pmwrite_l
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/all_access
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/dirty
add wave -noupdate -group L2Cache -format Logic -height 16 /mp3_cpu/memory/al2_cache/miss
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 300
configure wave -valuecolwidth 42
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {8488 ns}
