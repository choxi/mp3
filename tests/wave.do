onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/clk
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/reset_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/pcout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/instrout
add wave -noupdate -format Literal -radix hexadecimal -expand /mp3_cpu/datapath/aid_stage/aregfile/ram
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/i_mresp_h
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/d_mresp_h
add wave -noupdate -format Logic /mp3_cpu/datapath/not_access
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/mem_stall
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/i_address
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/i_mread_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/i_dataout
add wave -noupdate -format Literal /mp3_cpu/datapath/aid_stage/offset6
add wave -noupdate -format Literal /mp3_cpu/datapath/aid_stage/offset9
add wave -noupdate -format Literal /mp3_cpu/datapath/aid_stage/adj_offset6_id
add wave -noupdate -format Literal /mp3_cpu/datapath/aid_stage/adj_offset9_id
add wave -noupdate -format Literal /mp3_cpu/datapath/aid_stage/sext_offset6_id
add wave -noupdate -format Literal /mp3_cpu/datapath/aex_stage/adj_offset6_ex
add wave -noupdate -format Literal /mp3_cpu/datapath/aex_stage/adj_offset9_ex
add wave -noupdate -format Literal /mp3_cpu/datapath/aex_stage/sext_offset6_ex
add wave -noupdate -format Literal /mp3_cpu/datapath/aex_stage/address_ex
add wave -noupdate -format Literal /mp3_cpu/datapath/amem_stage/address_mem
add wave -noupdate -color {Slate Blue} -format Literal -radix hexadecimal /mp3_cpu/memory/d_address
add wave -noupdate -color {Slate Blue} -format Logic -radix hexadecimal /mp3_cpu/memory/d_mwrite_l
add wave -noupdate -color {Slate Blue} -format Logic -radix hexadecimal /mp3_cpu/memory/d_mread_l
add wave -noupdate -color {Slate Blue} -format Literal -radix hexadecimal /mp3_cpu/memory/d_dataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/d_datain
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/pmaddressd
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/pmaddressi
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmread_ld
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmread_li
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmwrite_ld
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmwrite_li
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/clk
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/reset_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/pcout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/datapath/instrout
add wave -noupdate -format Literal -radix hexadecimal -expand /mp3_cpu/datapath/aid_stage/aregfile/ram
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/i_mresp_h
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/d_mresp_h
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/datapath/mem_stall
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/i_address
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/i_mread_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/i_dataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/d_address
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/d_mwrite_l
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/d_mread_l
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/d_dataout
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/pmaddressd
add wave -noupdate -format Literal -radix hexadecimal /mp3_cpu/memory/pmaddressi
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmread_ld
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmread_li
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmwrite_ld
add wave -noupdate -format Logic -radix hexadecimal /mp3_cpu/memory/pmwrite_li
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8808 ns} 0}
configure wave -namecolwidth 242
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
WaveRestoreZoom {8723 ns} {9235 ns}
