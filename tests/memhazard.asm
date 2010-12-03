ORIGIN 0
SEGMENT CodeSegment:

fwdTest:
	NOP
	NOP
	NOP
	NOP
	NOP
	LDR R0, R0, TheData
	ADD R1, R1, 2 
	STR R0, R1, TheData 
	LDR R2, R1, TheData
	NOP
	NOP
	NOP
HALT:   BRnzp HALT
TheData:		;ADDRESS = 0x0018(24) 
	DATA2   4x600D
	NOP ;STR should store here
	NOP
	NOP
	NOP
	NOP
	NOP
