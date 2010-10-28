echo "--- Executing initialization force file for mp31.vhd ---"

echo "Setting clock period to 50 ns, starting at 50 ns."
force /clk 0  0
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

echo "Done initializing processor, loading mp31.vhd program code."
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(0) X"12"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(1) X"62"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(2) X"13"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(3) X"64"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(4) X"14"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(5) X"68"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(6) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(7) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(8) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(9) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(10) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(11) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(12) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(13) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(14) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(15) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(16) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(17) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(18) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(19) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(20) X"0D"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(21) X"0E"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(22) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(23) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(24) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(25) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(26) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(27) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(28) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(29) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(30) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(31) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(32) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(33) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(34) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(35) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(36) X"01"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(37) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(38) X"02"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(39) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(40) X"FF"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(41) X"FF"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(42) X"01"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(43) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(44) X"0D"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(45) X"60"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(46) X"DD"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(47) X"BA"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(48) X"42"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(49) X"16"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(50) X"82"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(51) X"5A"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(52) X"7F"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(53) X"9C"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(54) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(55) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(56) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(57) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(58) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(59) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(60) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(61) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(62) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(63) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(64) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(65) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(66) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(67) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(68) X"15"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(69) X"7C"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(70) X"15"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(71) X"6E"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(72) X"44"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(73) X"12"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(74) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(75) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(76) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(77) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(78) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(79) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(80) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(81) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(82) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(83) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(84) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(85) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(86) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(87) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(88) X"18"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(89) X"08"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(90) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(91) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(92) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(93) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(94) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(95) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(96) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(97) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(98) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(99) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(100) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(101) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(102) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(103) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(104) X"E3"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(105) X"0F"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(106) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(107) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(108) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(109) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(110) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(111) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(112) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(113) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(114) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(115) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(116) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(117) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(118) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(119) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(120) X"17"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(121) X"62"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(122) X"FE"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(123) X"0F"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(124) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(125) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(126) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(127) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(128) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(129) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(130) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(131) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(132) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(133) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(134) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(135) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(136) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(137) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(138) X"16"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(139) X"62"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(140) X"FE"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(141) X"0F"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(142) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(143) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(144) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(145) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(146) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(147) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(148) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(149) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(150) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(151) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(152) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(153) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(154) X"00"
change /mp3_cpu/memory/InstrMem/vhdl_memory/mem(155) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(0) X"12"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(1) X"62"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(2) X"13"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(3) X"64"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(4) X"14"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(5) X"68"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(6) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(7) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(8) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(9) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(10) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(11) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(12) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(13) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(14) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(15) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(16) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(17) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(18) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(19) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(20) X"0D"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(21) X"0E"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(22) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(23) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(24) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(25) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(26) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(27) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(28) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(29) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(30) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(31) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(32) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(33) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(34) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(35) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(36) X"01"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(37) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(38) X"02"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(39) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(40) X"FF"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(41) X"FF"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(42) X"01"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(43) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(44) X"0D"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(45) X"60"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(46) X"DD"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(47) X"BA"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(48) X"42"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(49) X"16"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(50) X"82"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(51) X"5A"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(52) X"7F"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(53) X"9C"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(54) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(55) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(56) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(57) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(58) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(59) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(60) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(61) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(62) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(63) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(64) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(65) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(66) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(67) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(68) X"15"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(69) X"7C"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(70) X"15"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(71) X"6E"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(72) X"44"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(73) X"12"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(74) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(75) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(76) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(77) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(78) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(79) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(80) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(81) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(82) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(83) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(84) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(85) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(86) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(87) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(88) X"18"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(89) X"08"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(90) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(91) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(92) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(93) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(94) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(95) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(96) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(97) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(98) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(99) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(100) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(101) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(102) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(103) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(104) X"E3"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(105) X"0F"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(106) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(107) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(108) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(109) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(110) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(111) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(112) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(113) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(114) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(115) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(116) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(117) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(118) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(119) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(120) X"17"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(121) X"62"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(122) X"FE"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(123) X"0F"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(124) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(125) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(126) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(127) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(128) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(129) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(130) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(131) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(132) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(133) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(134) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(135) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(136) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(137) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(138) X"16"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(139) X"62"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(140) X"FE"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(141) X"0F"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(142) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(143) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(144) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(145) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(146) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(147) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(148) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(149) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(150) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(151) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(152) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(153) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(154) X"00"
change /mp3_cpu/memory/DataMem/vhdl_memory/mem(155) X"00"
run 5
echo "Done loading mp31.vhd program code."
