ORIGIN 0
SEGMENT CodeSegment:

;Cache Line Boundary
	ADD R1, R1, 1
    BRnzp TEST12 
    NOP
    NOP
T12_Routine:
    LDR R1, R0, T12_Data 
    NOP
    NOP
    BRnzp HALT 

;****************************** Test 12 *********************************
;*************************** Data Hazard *******************************
;Cache Line Boundary 
SEGMENT TEST12:
    ;init regs
    LEA R0, TEST12
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    AND R6, R6, 0
    AND R7, R7, 0

;Cache Line Boundary
    ;start test
    ADD R3, R3, 5 
    TRAP T12_Routine 
    STR R3, R0, T12_Data 
    NOP 
    NOP
    NOP
    BRnzp HALT 


;Cache Line Boundary
    DATA2 4xBADD
T12_Data:
    DATA2 4x0006 
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD 
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

HALT: 
    BRnzp HALT
