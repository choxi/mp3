ORIGIN 0
SEGMENT CodeSegment:

; Should load data to R1~R5 from destination

testStart:
	NOP
	NOP
	NOP

	JMP	


halt:
	BRnzp	halt

	NOP
	NOP
	NOP

failt0:	DATA2 4xBAD0
failt1:	DATA2 4xBAD1
target:	DATA2 4x600D
failt2: DATA2 4xBAD2
failt3:	DATA2 4xBAD3
