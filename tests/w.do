onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color White -format Logic /mp3_cpu/datapath/clk
add wave -noupdate -format Logic /mp3_cpu/memory/datacache/in_idlehit
add wave -noupdate -format Logic /mp3_cpu/memory/datacache/in_load
add wave -noupdate -format Logic /mp3_cpu/memory/datacache/in_writeback
add wave -noupdate -format Logic /mp3_cpu/d_mread_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/amem_stage/dataout_mem
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
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/datacache/pmdataout
add wave -noupdate -color White -format Literal -radix hexadecimal -expand /mp3_cpu/datapath/aid_stage/aregfile/ram
add wave -noupdate -format Literal /mp3_cpu/memory/instrcache/al1_controller/current_state
add wave -noupdate -group DataCache
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/al1_datapath/way0/datawrite
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/al1_datapath/wc_dataout
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/al1_datapath/way0/u_0/data
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/datacache/al1_datapath/way1/datawrite
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/datacache/al1_datapath/way1/u_0/data
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/instrcache/al1_datapath/way0/u_0/datawrite
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/instrcache/al1_datapath/way0/u_0/data
add wave -noupdate -group DataCache -format Logic -height 16 /mp3_cpu/memory/instrcache/al1_datapath/way1/datawrite
add wave -noupdate -group DataCache -format Literal -height 16 /mp3_cpu/memory/instrcache/al1_datapath/way1/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {710 ns} 0}
configure wave -namecolwidth 451
configure wave -valuecolwidth 233
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
WaveRestoreZoom {493 ns} {997 ns}
