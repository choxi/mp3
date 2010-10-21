ORIGIN 0
SEGMENT CodeSegment:

; 600D should be put into R3, R4, R5

testStart:
	LDR	R1, R0, get_l
	LDR	R2, R0, get_h
	ADD	R3, R1, R2
	ADD	R4, R2, R1
	ADD	R5, R1, R2

halt:
	BRnzp	halt

	NOP
	NOP
	NOP

failt0:	DATA2 4xBAD0
failt1:	DATA2 4xBAD1
get_l:	DATA2 4x000D
get_h:	DATA2 4x6000
failt2: DATA2 4xBAD2
failt3:	DATA2 4xBAD3

