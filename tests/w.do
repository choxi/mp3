onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color White -format Logic /mp3_cpu/datapath/clk
add wave -noupdate -format Literal /mp3_cpu/datapath/op_if/current_state
add wave -noupdate -color {Blue Violet} -format Literal /mp3_cpu/datapath/op_id/current_state
add wave -noupdate -color {Steel Blue} -format Literal /mp3_cpu/datapath/op_ex/current_state
add wave -noupdate -color Gold -format Literal /mp3_cpu/datapath/op_mem/current_state
add wave -noupdate -color {Orange Red} -format Literal /mp3_cpu/datapath/op_wb/current_state
add wave -noupdate -color White -format Literal -radix hexadecimal -expand /mp3_cpu/datapath/aid_stage/aregfile/ram
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/addressd
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/addressi
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/pmresp_h
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/read_ld
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/read_li
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/reset_l
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/write_ld
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/dataind
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/hitd
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/hiti
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/pmdataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/pmaddress
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/pmread_l
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/pmwrite_l
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/resp_hd
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/resp_hi
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/dataoutd
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/dataouti
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/aarbiter/pmdatain
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/write_li
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/aarbiter/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1784 ns} 0}
configure wave -namecolwidth 344
configure wave -valuecolwidth 40
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
WaveRestoreZoom {1602 ns} {2178 ns}
