; By Charles Park (cjpark3@illinois.edu)
; 2010-11-12 / ECE 411
ORIGIN 0
SEGMENT CodeSegment:

INIT:
	ADD R1, R1, -1
	ADD R2, R2, -1
	LDB R6, R0, LowByte
	LDB R7, R0, HighByte

	LDB R1, R0, LowByte
	LDB R2, R0, HighByte

	STB R6, R0, LowSByte
	STB R7, R0, HighSByte

DONE:
	BRnzp DONE;				INFINITE LOOOOOOOOOP!!


LowByte: DATA1 4x0D
HighByte: DATA1 4x60
LowSByte: DATA1 4xFF
HighSByte: DATA1 4xFF
