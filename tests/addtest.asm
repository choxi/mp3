ORIGIN 0
SEGMENT CodeSegment:

; Should see R1 increasing then decreasing back to 0.

testStart:
	ADD	R1, R1, 1
halt:
	NOP
	NOP
	NOP
	NOP
	NOP
	;ADD	R1, R1, 2
	;ADD	R1, R1, 3
	;ADD	R1, R1, 4
	;ADD	R1, R1, 5

	;ADD	R1, R1, -5
	;ADD	R1, R1, -4
	;ADD	R1, R1, -3
	;ADD	R1, R1, -2
	;ADD	R1, R1, -1

;halt:
	BRnzp	halt

	NOP
	NOP
	NOP
