onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/acontrolrom/reset_l
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/acontrolrom/clk
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/dram_magic/i_address
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/dram_magic/i_mread_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/dram_magic/i_dataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/acontrolrom/opcode
add wave -noupdate -format Literal -radix hexadecimal -expand /mp3_cpu/aid_stage/aregfile/ram
add wave -noupdate -format Logic /mp3_cpu/aid_stage/aregfile/regwrite
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {503 ns} 0}
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
WaveRestoreZoom {0 ns} {196 ns}
