ORIGIN 0
SEGMENT CodeSegment:

fwdTest:
	NOP
	NOP
	NOP
	NOP
	NOP
	LEA R0, TheData
	ADD R1, R0, R0
	NOP
	NOP
	NOP
	NOP
	NOP
TheData:		;ADDRESS = 0x0018(24) 
	DATA2   4x0032
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
