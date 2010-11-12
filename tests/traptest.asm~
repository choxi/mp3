; By Charles Park (cjpark3@illinois.edu)
; 2010-09-17 / ECE 411
ORIGIN 0
SEGMENT CodeSegment:

INIT:

	TRAP cagey		;0

	LEA R1, DONE		;2
	JMP R1			;4

	ADD R0, R0, 1		;6
	ADD R0, R0, 1		;8
	ADD R0, R0, 1		;A
	ADD R0, R0, 1		;C
	ADD R0, R0, 1		;E
	ADD R0, R0, 1		;10
	ADD R0, R0, 1		;12

cagey:
	DATA2 Weasel	;14

	ADD R0, R0, 1		;16
	ADD R0, R0, 1		;18
	ADD R0, R0, 1		;1A
	ADD R0, R0, 1		;1C
	ADD R0, R0, 1		;1E
	ADD R0, R0, 1		;20
	ADD R0, R0, 1		;22
	ADD R0, R0, 1		;24

Weasel:	ADD R4, R4, 4xF		;26
	RET			;28

DONE:
	BRnzp DONE;		;2A		INFINITE LOOOOOOOOOP!!
