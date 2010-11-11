ORIGIN 0
SEGMENT CodeSegment:

begTest:
	; Cache Line Boundary 
	NOP
	NOP
	NOP
	ADD R0, R0, 2
	LDI R1, R0,TheData
	NOP;ADD R0, R0, 4
	NOP;STI R1, R0, TheData
	NOP;LDI R2, R0, TheData
	; Cache Line Boundary
HALT:
	BRnzp HALT
TheData:		
	DATA2 4xB4DD  
	DATA2 TheIndirectData  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
TheIndirectData:
	DATA2 4x600D
	; Cache Line Boundary
	DATA2 4xB4DD  
	DATA2 4xB4DD  
	DATA2 4xB4DD  
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
