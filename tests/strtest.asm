ORIGIN 0
SEGMENT CodeSegment:

; Should store data into different locations
; then should bring back the correct data from the memory again

testStart:
	LDR	R1, R0, getdat

	STR	R1, R0, dest1
	STR	R2, R0, dest2
	STR	R3, R0, dest3

	LDR	R4, R0, dest1
	LDR	R5, R0, dest2
	LDR	R6, R0, dest3

halt:
	BRnzp	halt

	NOP
	NOP
	NOP

failt0:	DATA2 4xBAD0
failt1:	DATA2 4xBAD1
getdat:	DATA2 4x600D
failt2: DATA2 4xBAD2
failt3:	DATA2 4xBAD3


dest1:	DATA2 4xBAD1
dest2:	DATA2 4xBAD2
dest3:	DATA2 4xBAD3
