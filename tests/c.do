onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/acontrolrom/reset_l
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/acontrolrom/clk
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/dram_magic/i_address
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/dram_magic/i_mread_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/dram_magic/i_dataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/acontrolrom/opcode
add wave -noupdate -format Literal -radix hexadecimal -expand /mp3_cpu/aid_stage/aregfile/ram
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/aid_stage/aregfile/regwrite
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/aluout_mem
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/aluout_wb
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/dataout_mem
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/dataout_wb
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/writedata
add wave -noupdate -format Logic /mp3_cpu/awe_stage/setcc_wb
add wave -noupdate -format Logic /mp3_cpu/brsel
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/amem_stage/n
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/amem_stage/z
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/amem_stage/p
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/amem_stage/regn
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/amem_stage/regz
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/amem_stage/regp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {524 ns} 0}
configure wave -namecolwidth 275
configure wave -valuecolwidth 58
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
WaveRestoreZoom {0 ns} {1004 ns}
