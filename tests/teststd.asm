ORIGIN 0

SEGMENT 0 CODE:
	ADD R4, R4, 15	;x00
	ADD R5, R5, 7	;	;miss on fetch load index 0 way 0
	ADD R6, R6, 11  ;	;
	LDR R1, R0, l1p ;	;miss, load index 2 way 0
	LDR R2, R0, l2p ;x08;hit
	LDR R3, R0, l3p ;	;hit
	LDR R7, R1, 0 	;	;cache miss, loads line1
	STR R5, R1, 1 	;	;cache hit, stores into line1
	LDR R7, R2, 0 	;x10;cache miss, loads line2
	STR R5, R2, 4 	;	;cache hit, stores into line2
	LDR R7, R1, 0 	;	;cache hit,  sets line2 as LRU
	STR R6, R3, 1 	;	;cache miss, writeback line2, and replace with line3.
						;sets line1 as LRU
	LDR R7, R2, 1 	;x18;cache miss, writeback line1, and replace with line2.
						;sets line3 as LRU 
	STR R6, R3, 5	;	;cache hit, sets line2 as LRU
	LDR R7, R2, 2	;	;cache hit, sets line3 as LRU
	STR R4, R1, 7 	;	;cache miss, writeback line3, and replace with line1.
						;sets line2 as LRU
	LDR R4, R2, 4 	;x20;cache hit,  sets line1 as LRU
	LDR R4, R1, 7 	;	;cache hit, sets line2 as LRU
	STB R5, R1, 3	;

inf:
	BRnzp inf	  	;

l1p:	DATA2 line1 ;	;line1 is at addr(x0040) index 4
l2p:	DATA2 line2 ;x28;line2 is at addr(x00C0) index 4
l3p:	DATA2 line3 ;	;line3 is at addr(x0140) index 4
NOP					;	;filler to remove don't cares
NOP					;	;
NOP					;x30;

SEGMENT 64 line1:
X:	DATA2 4x1111 
NOP				 
NOP				 
NOP
NOP
NOP
NOP
NOP


SEGMENT 128 line2:
Y:	DATA2 4x2222
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line3:
Z:	DATA2 4x3333
NOP
NOP
NOP
NOP
NOP
NOP
NOP
