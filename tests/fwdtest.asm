ORIGIN 0
SEGMENT CodeSegment:

fwdTest:
	ADD	R1, R1, 2
	LDR	R2, R1, TheData 
	NOP		
	ADD	R3, R2, 1
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	ADD    R4, R3, 1
	STR    R4, R1, TheData
	LDR    R5, R1, TheData
TheData:
	NOP
	DATA2   4x0032
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
