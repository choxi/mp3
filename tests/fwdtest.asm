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
; Cache Line 0x10
	NOP
	NOP
	ADD    R4, R3, 1
	STR    R4, R1, TheData
	LDR    R5, R1, TheData
	NOP
	NOP
	NOP
; Cache Line 0x20
	NOP
	NOP
	NOP
	LDR   R5, R1, TheData
	ADD   R0, R5, 4	
	NOP
HALT:   BRnzp HALT
; Cache Line 0x30
TheData:
	NOP
	DATA2   4x0032 ;0x32
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
