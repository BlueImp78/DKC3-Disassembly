 
UNK_B8FA1D:
	db $61,$F6

	LDA.w #$0004
	JMP.w $B8F3F8

CODE_B8FA25:
	JSL.l CODE_BCE2D4
	LDA.w #$0004
	JMP.w $B8F400

CODE_B8FA2F:
	LDY.w $0004,x
	LDA.w $0006,x
	STA.w $0000,y
	LDA.w #$0008
	JMP.w $B8F400

CODE_B8FA3E:
	LDA.w $0004,x
	AND.w $194F
	BEQ.b CODE_B8FA4F
	TRB.w $194F
	LDA.w #$0006
	JMP.w $B8F400

CODE_B8FA4F:
	JMP.w $B8F3FF
