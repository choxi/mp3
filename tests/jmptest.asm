ORIGIN 0
SEGMENT CodeSegment:

testStart:

	LEA	R1, jsrtarget

	JSRR	R1


halt:
	LDR	R6, R0, fail
	BRnzp	halt


jsrtarget:
	LDR	R6, R0, target
	BRnzp jsrtarget

failt0:	DATA2 4xBAD0
failt1:	DATA2 4xBAD1
target:	DATA2 4x600D
failt2: DATA2 4xBAD2
failt3:	DATA2 4xBAD3
fail:		DATA2 4xBADD
