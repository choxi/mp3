onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color White -format Logic /mp3_cpu/datapath/clk
add wave -noupdate -format Logic /mp3_cpu/memory/datacache/in_idlehit
add wave -noupdate -format Logic /mp3_cpu/memory/datacache/in_load
add wave -noupdate -format Logic /mp3_cpu/memory/datacache/in_writeback
add wave -noupdate -format Logic /mp3_cpu/d_mread_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/amem_stage/d_address
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/d_dataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/aif_stage/pc/output
add wave -noupdate -format Logic /mp3_cpu/datapath/astallunit/d_mresp_h
add wave -noupdate -format Logic /mp3_cpu/datapath/astallunit/state
add wave -noupdate -format Logic /mp3_cpu/datapath/astallunit/indirect_mem
add wave -noupdate -format Logic /mp3_cpu/datapath/astallunit/issti_mem
add wave -noupdate -format Literal /mp3_cpu/datapath/op_if/current_state
add wave -noupdate -color {Blue Violet} -format Literal /mp3_cpu/datapath/op_id/current_state
add wave -noupdate -color {Steel Blue} -format Literal /mp3_cpu/datapath/op_ex/current_state
add wave -noupdate -color Gold -format Literal /mp3_cpu/datapath/op_mem/current_state
add wave -noupdate -color {Orange Red} -format Literal /mp3_cpu/datapath/op_wb/current_state
add wave -noupdate -color White -format Literal -radix hexadecimal -expand /mp3_cpu/datapath/aid_stage/aregfile/ram
add wave -noupdate -group DataCache
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/clk
add wave -noupdate -group DataCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/al1_controller/current_state
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/mread_l
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/mwriteh_l
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/mwritel_l
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/reset_l
add wave -noupdate -group DataCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/address
add wave -noupdate -group DataCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/cachedatain
add wave -noupdate -group DataCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/cachedataout
add wave -noupdate -group DataCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/pmdataout
add wave -noupdate -group DataCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/pmdatain
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/pmresp_h
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/mresp_h
add wave -noupdate -group DataCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/pmaddress
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/pmread_l
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/pmwrite_l
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/dirty
add wave -noupdate -group DataCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/datacache/miss
add wave -noupdate -group InstructionCache
add wave -noupdate -group InstructionCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/al1_controller/current_state
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/clk
add wave -noupdate -group InstructionCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/address
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/mread_l
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/mwriteh_l
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/mwritel_l
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/reset_l
add wave -noupdate -group InstructionCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/cachedatain
add wave -noupdate -group InstructionCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/cachedataout
add wave -noupdate -group InstructionCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/pmdataout
add wave -noupdate -group InstructionCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/pmdatain
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/pmresp_h
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/mresp_h
add wave -noupdate -group InstructionCache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/pmaddress
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/pmread_l
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/pmwrite_l
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/dirty
add wave -noupdate -group InstructionCache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/instrcache/miss
add wave -noupdate -expand -group L2Cache
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/clk
add wave -noupdate -group L2Cache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/al2_controller/current_state
add wave -noupdate -group L2Cache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/address
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/mread_l
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/mwriteh_l
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/mwritel_l
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/reset_l
add wave -noupdate -group L2Cache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/cachedatain
add wave -noupdate -group L2Cache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/cachedataout
add wave -noupdate -group L2Cache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/pmdataout
add wave -noupdate -group L2Cache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/pmdatain
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/pmresp_h
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/mresp_h
add wave -noupdate -group L2Cache -format Literal -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/pmaddress
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/pmread_l
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/pmwrite_l
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/all_access
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/dirty
add wave -noupdate -group L2Cache -format Logic -height 16 -radix hexadecimal /mp3_cpu/memory/al2_cache/miss
add wave -noupdate -format Literal /mp3_cpu/memory/al2_cache/al2_datapath/lruout
add wave -noupdate -format Literal -radix binary /mp3_cpu/memory/al2_cache/al2_datapath/index
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite0
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite1
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite2
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite3
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite4
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite5
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite6
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/datawrite7
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin0
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin1
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin2
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin3
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin4
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin5
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin6
add wave -noupdate -format Logic /mp3_cpu/memory/al2_cache/al2_datapath/adatawritelogic/dirtyin7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6745 ns} 0}
configure wave -namecolwidth 419
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
WaveRestoreZoom {6591 ns} {7053 ns}
