ORIGIN 0
SEGMENT CodeSegment:


;****************************** Test 0 ******************************
;************************** LDI miss/miss ***************************
;Cache Line Boundary 0x00
SEGMENT TEST0:
    ;init regs
    LEA R0, TEST0
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    AND R6, R6, 0
    NOP

;Cache Line Boundary
    ;start test
    ADD R0, R0, 2
    LDI R1, R0, T0_DirectData
    NOP
    NOP
    NOP
    NOP
    NOP
    BRnzp TEST1

;Cache Line Boundary
T0_DirectData:
    DATA2 4xBADD
    DATA2 T0_IndirectData
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

;Cache Line Boundary
T0_IndirectData:
    DATA2 4x600D
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

;****************************** Test 1 ******************************
;*************************** LDI hit/miss ***************************
;Cache Line Boundary 0x40
SEGMENT TEST1:
    ;init regs
    LEA R0, TEST1
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
	NOP
;Cache Line Boundary
    ;start test
    LDR R2, R2, T1_DirectData   
    ADD R0, R0, 2
    LDI R1, R0, T1_DirectData
    NOP
    NOP
    NOP
    NOP
    BRnzp TEST2            

;Cache Line Boundary
T1_DirectData:
    DATA2 4xBADD
    DATA2 T1_IndirectData
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

;Cache Line Boundary
T1_IndirectData:
    DATA2 4x600D
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD
   
;****************************** Test 2 ******************************
;*************************** LDI hit/hit ***************************
;Cache Line Boundary 0x80
SEGMENT TEST2:
    ;init regs
    LEA R0, TEST2
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    NOP

;Cache Line Boundary
    ;start test
    LDR R2, R0, T2_DirectData   
    ADD R0, R0, 2
    LDI R1, R0, T2_DirectData
    NOP
    NOP
    NOP
    NOP
    BRnzp TEST3            

;Cache Line Boundary
T2_DirectData:
    DATA2 4x600D
    DATA2 T2_IndirectData
    DATA2 4xBADD
    DATA2 4xBADD
T2_IndirectData:
    DATA2 4x600D
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

;****************************** Test 3 ******************************
;*************************** LDI miss/hit ***************************
;Cache Line Boundary 0xB0
SEGMENT TEST3:
    ;init regs
    LEA R0, TEST3
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    NOP

;Cache Line Boundary
    ;start test
    ADD R0, R0, 2
    LDI R1, R0, T3_DirectData
    NOP
    NOP
    NOP
    NOP
    NOP
    BRnzp TEST4

;Cache Line Boundary
T3_DirectData:
    DATA2 4xBADD
    DATA2 T3_IndirectData
    DATA2 4xBADD
    DATA2 4xBADD
T3_IndirectData:
    DATA2 4x600D
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

;****************************** Test 4 ******************************
;*************************** JMP - Hazard ***************************
;Cache Line Boundary 0xE0
SEGMENT TEST4:
    ;init regs
    AND R0, R0, 0   
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    NOP

;Cache Line Boundary
    ;start test
    LEA R2, T4_SUCCESS   
    JMP R2   
    BRnzp T4_FAIL   
T4_SUCCESS:   
    ADD R1, R1, 6   ;Fix this, R1 is used for the JMP
    BRnzp TEST5   
T4_FAIL:
    ADD R1, R1, 5   
    NOP
    BRnzp TEST5            

;****************************** Test 5 ******************************
;*************************** JMP - LDR Miss *************************
;Cache Line Boundary 0x100
SEGMENT TEST5:
    ;init regs
    LEA R0, TEST5
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    NOP

;Cache Line Boundary
    ;start test
    LDR R2, R0, T5_SUCCESS_ADDR   
    JMP R2   
    BRnzp T5_FAIL   
    NOP
    NOP
    NOP
    NOP
    NOP

;Cache Line Boundary
T5_SUCCESS_ADDR:
    DATA2 T5_SUCCESS   
    NOP
    NOP
T5_SUCCESS:   
    ADD R1, R1, 6   
    BRnzp TEST6
T5_FAIL:
    ADD R1, R1, 5   
    BRnzp TEST6
    NOP

;****************************** Test 6 ******************************
;******************************* RET ********************************
;Cache Line Boundary 0x130
SEGMENT TEST6:
    ;init regs
    AND R0, R0, 0
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    NOP

;Cache Line Boundary
    ;start test
    LEA R7, T6_SUCCESS    
    RET   
    BRnzp T6_FAIL   
    NOP
T6_SUCCESS:
    ADD R1, R1, 6   
    BRnzp TEST7   
T6_FAIL:
    ADD R1, R1, 5   
    BRnzp TEST7

;****************************** Test 7 ******************************
;**************************** JSR -> RET ****************************
;Cache Line Boundary 0x150
SEGMENT TEST7:
    ;init regs
    AND R0, R0, 0
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    NOP

;Cache Line Boundary
    ;start test
    LEA R2, T7_SUCCESS    
    JSRR R2                    ;Instruction miss
    BRnzp T7_FAIL   
    ADD R1, R1, 6   
    BRnzp TEST8   
    BRnzp T7_FAIL   
    BRnzp T7_FAIL   
    BRnzp T7_FAIL   

;Cache Line Boundary
    NOP    
    NOP
    NOP
T7_SUCCESS:   
    ADD R7, R7, 2                ;RET back to JSRR call + 1 instruction   
    RET
T7_FAIL:
    ADD R1, R1, 5   
    BRnzp TEST8            
    NOP

;****************************** Test 8 *********************************
;************************ Load-Store Hazard ****************************
;Cache Line Boundary 0x180
SEGMENT TEST8:
    ;init regs
    LEA R0, TEST8
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    AND R7, R7, 0

;Cache Line Boundary
    ;start test
    ADD R3, R3, 6    
    LDR R2, R0, T8_Data 
    STR R3, R2, 0 
    NOP    
    LDR R1, R2, 0 
    NOP
    NOP
    BRnzp TEST9 

;Cache Line Boundary 0x1A0
    DATA2 4xBADD
T8_Data:
    DATA2 4x01A8 
    DATA2 4xBADD
    DATA2 4xBADD
T8_OtherData:
    DATA2 4xBADD ;0x1A8
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

;****************************** Test 9 *********************************
;*************************** Data Hazard *******************************
;Cache Line Boundary 0x1B0
SEGMENT TEST9:
    ;init regs
    LEA R0, TEST9
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    AND R7, R7, 0

;Cache Line Boundary
    ;start test
    LDR R4, R0, T9_Data
    ADD R2, R2, R0 
    STR R4, R2, T9_Data  
    NOP
    NOP
    NOP
    LDR R1, R2, T9_Data 
    BRnzp TEST10 

;Cache Line Boundary
    DATA2 4xBADD
T9_Data:
    DATA2 4x600D 
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD 
    DATA2 4xBADD
    DATA2 4xBADD
    DATA2 4xBADD

;****************************** Test 10 *********************************
;*************************** Data Hazard *******************************
;Cache Line Boundary 
SEGMENT TEST10:
    ;init regs
    LEA R0, TEST10
    AND R1, R0, 0
    AND R2, R0, 0
    AND R3, R0, 0
    AND R4, R0, 0
    AND R5, R0, 0
    ADD R6, R6, 1
    AND R7, R7, 0

;Cache Line Boundary
    ;start test
    ADD R7, R7, 3 
    JSR T10_Routine 
    NOP
T10_Routine:
    NOP
    NOP
    NOP
    BRnzp HALT 

HALT: 
    BRnzp HALT
