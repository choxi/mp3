ORIGIN 0
SEGMENT CodeSegment:

begTest:
	; Cache Line Boundary 
	NOP
	NOP
	NOP
	ADD R0, R0, 2
	LDI R1, R0,TheData
	ADD R5, R5, R5
	STI R1, R7, TheOtherData
	LDI R2, R7, TheOtherData
	; Cache Line Boundary
HALT:
	BRnzp HALT
TheData:		
	DATA2 4xB4DD  
	DATA2 TheIndirectData  
TheOtherData:
	Data2 StoreHere
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	; Cache Line Boundary
TheIndirectData:
	DATA2 4x600D
	DATA2 4xB4DD  
	DATA2 4xB4DD  
StoreHere:
	DATA2 4xB4DD ;STI should store 600D here  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	; Cache Line Boundary
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
