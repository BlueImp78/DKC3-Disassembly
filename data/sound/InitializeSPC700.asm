
arch spc700
base $04D8

CODE_04D8:
	CLRP
	MOV X, #$FF
	MOV SP, X
	INC X
	MOV $F4, X
	INC X
	MOV $E9, X
	MOV A, #$00
	MOV $00, A
	MOV $01, #$D0
CODE_04E9:
	MOV Y, A
CODE_04EA:
	MOV ($00)+y, A
	INC Y
	BNE CODE_04EA
	INC $01
	BNE CODE_04E9
	MOV X, #$FF
	MOV $F2, #$6C
	MOV $F3, X
	MOV $F2, #$7D
	MOV $F3, #$00
	MOV $F2, #$6D
	MOV $F3, X
	MOV $04B7, X
	MOV X, $E9
CODE_050A:
	CMP X, $F4
	BNE CODE_050A
	MOVW YA, $F5
	MOV $F4, X
	INC X
	MOV CODE_0538+$01, A
	MOV CODE_0541+$01, A
	MOV CODE_0538+$02, Y
	MOV CODE_0541+$02, Y
CODE_051F:
	CMP X, $F4
	BNE CODE_051F
	MOVW YA, $F5
	MOV $F4, X
	INC X
	MOV $EA, A
	MOV $EB, Y
	DECW $EA
	BMI CODE_0556
	MOV Y, #$00
CODE_0532:
	CMP X, $F4
	BNE CODE_0532
	MOV A, $F5
CODE_0538:
	MOV $0000+y, A
	MOV A, $F6
	MOV $F4, X
	INC X
	INC Y
CODE_0541:
	MOV $0000+y, A
	INC Y
	BEQ CODE_054E
CODE_0547:
	DECW $EA
	BPL CODE_0532
	JMP CODE_050A

CODE_054E:
	INC CODE_0538+$02
	INC CODE_0541+$02
	BRA CODE_0547

CODE_0556:
	MOV $E9, X
	MOV X, #$00
	JMP (CODE_0538+$01+x)

DATA_055D:
	db $00,$04,$D6

base off
arch 65816
