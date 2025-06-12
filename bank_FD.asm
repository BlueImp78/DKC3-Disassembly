;PPU settings?
DATA_FD0000:
	dw DATA_FD0400
	dw DATA_FD042D
	dw DATA_FD042F
	dw DATA_FD0431
	dw DATA_FD0433
	dw DATA_FD0435
	dw DATA_FD0437
	dw DATA_FD0439
	dw DATA_FD043B
	dw DATA_FD0452
	dw DATA_FD0469
	dw DATA_FD0480
	dw DATA_FD0497
	dw DATA_FD04AE
	dw DATA_FD04C5
	dw DATA_FD04DC
	dw DATA_FD04F3
	dw DATA_FD050A
	dw DATA_FD0521
	dw DATA_FD0538
	dw DATA_FD054F
	dw DATA_FD0566
	dw DATA_FD057C
	dw DATA_FD0593
	dw DATA_FD0595
	dw DATA_FD0597
	dw DATA_FD0599
	dw DATA_FD05B0
	dw DATA_FD05C7
	dw DATA_FD05DE
	dw DATA_FD05FF
	dw DATA_FD0616
	dw DATA_FD062D
	dw DATA_FD0649
	dw DATA_FD0660
	dw DATA_FD067C
	dw DATA_FD0698
	dw DATA_FD06AF
	dw DATA_FD06E5
	dw DATA_FD071B
	dw DATA_FD0751
	dw DATA_FD078C
	dw DATA_FD07C2
	dw DATA_FD07F8
	dw DATA_FD082E
	dw DATA_FD0864
	dw DATA_FD0895
	dw DATA_FD08CB
	dw DATA_FD08FC
	dw DATA_FD0932
	dw DATA_FD096A
	dw DATA_FD09AA
	dw DATA_FD09DB
	dw DATA_FD0A0C
	dw DATA_FD0A43
	dw DATA_FD0A7A
	dw DATA_FD0AB1
	dw DATA_FD0AE2
	dw DATA_FD0B13
	dw DATA_FD0B44
	dw DATA_FD0B75
	dw DATA_FD0BA6
	dw DATA_FD0BD7
	dw DATA_FD0C0D
	dw DATA_FD0C3E
	dw DATA_FD0C6F
	dw DATA_FD0CA0
	dw DATA_FD0CD1
	dw DATA_FD0D02
	dw DATA_FD0D33
	dw DATA_FD0D64
	dw DATA_FD0D95
	dw DATA_FD0DC6
	dw DATA_FD0DF7
	dw DATA_FD0E2F
	dw DATA_FD0E60
	dw DATA_FD0E98
	dw DATA_FD0EBB
	dw DATA_FD0ED4
	dw DATA_FD0ED6
	dw DATA_FD0ED8
	dw DATA_FD0EF1
	dw DATA_FD0F0A
	dw DATA_FD0F23
	dw DATA_FD0F3C
	dw DATA_FD0F55
	dw DATA_FD0F6E
	dw DATA_FD0F87
	dw DATA_FD0FA0
	dw DATA_FD0FB9
	dw DATA_FD0FD2
	dw DATA_FD0FEB
	dw DATA_FD1004
	dw DATA_FD101D
	dw DATA_FD1036
	dw DATA_FD104F
	dw DATA_FD1068
	dw DATA_FD1081
	dw DATA_FD109A
	dw DATA_FD10B3
	dw DATA_FD10CC
	dw DATA_FD10E5
	dw DATA_FD10FE
	dw DATA_FD1117
	dw DATA_FD1130
	dw DATA_FD1149
	dw DATA_FD1162
	dw DATA_FD117B
	dw DATA_FD1194
	dw DATA_FD11AD
	dw DATA_FD11C6
	dw DATA_FD11DF
	dw DATA_FD11F8
	dw DATA_FD1211
	dw DATA_FD122A
	dw DATA_FD1243
	dw DATA_FD125C
	dw DATA_FD1275
	dw DATA_FD128E
	dw DATA_FD12A7
	dw DATA_FD12C0
	dw DATA_FD12D9
	dw DATA_FD12F2
	dw DATA_FD130B
	dw DATA_FD1324
	dw DATA_FD133D
	dw DATA_FD1356
	dw DATA_FD136F
	dw DATA_FD1388
	dw DATA_FD13A1
	dw DATA_FD13BA
	dw DATA_FD13D3
	dw DATA_FD13EC
	dw DATA_FD1405
	dw DATA_FD141E
	dw DATA_FD1437
	dw DATA_FD1450
	dw DATA_FD1469
	dw DATA_FD1482
	dw DATA_FD149B
	dw DATA_FD14B4
	dw DATA_FD14CD
	dw DATA_FD14E6
	dw DATA_FD14FF
	dw DATA_FD1518
	dw DATA_FD1531
	dw DATA_FD154A
	dw DATA_FD1563
	dw DATA_FD157C
	dw DATA_FD1595
	dw DATA_FD15AE
	dw DATA_FD15C7
	dw DATA_FD15E0
	dw DATA_FD15F9
	dw DATA_FD1612
	dw DATA_FD162B
	dw DATA_FD1644
	dw DATA_FD165D
	dw DATA_FD1676
	dw DATA_FD168F
	dw DATA_FD16A8
	dw !null_pointer

padbyte $00 : pad $FD0400

DATA_FD0400:
	dw $0001 : db $1E : dw DATA_FD198D : db $00,$0A,$00 : dw $0002 : db $00 : dw $0000,$0010 : db $00 : dw $0150,$086D
	db $00,$90,$07,$00,$06
	db $00,$65,$03,$00,$07
	db $02,$65,$03,$40,$03
	db $00,$40,$09,$AD,$01
	db $FF
	dw $FFFF
	dw $FFFF

DATA_FD042D:
	dw $0000

DATA_FD042F:
	dw $0000

DATA_FD0431:
	dw $0000

DATA_FD0433:
	dw $0000

DATA_FD0435:
	dw $0000

DATA_FD0437:
	dw $0000

DATA_FD0439:
	dw $0000

DATA_FD043B:
	dw $0004 : db $00 : dw DATA_FD1AAB : db $00,$2C,$01 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0180,$0160
	db $FF
	dw $FFFF

DATA_FD0452:
	dw $0004 : db $00 : dw DATA_FD1AA0 : db $00,$0A,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0140,$086C
	db $FF
	dw $FFFF

DATA_FD0469:
	dw $0004 : db $00 : dw DATA_FD1AC1 : db $01,$08,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0128,$02AD
	db $FF
	dw $FFFF

DATA_FD0480:
	dw $0004 : db $00 : dw DATA_FD1ACC : db $00,$33,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $070F,$05A3
	db $FF
	dw $FFFF

DATA_FD0497:
	dw $0004 : db $00 : dw DATA_FD1AC1 : db $00,$08,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0160,$00CD
	db $FF
	dw $FFFF

DATA_FD04AE:
	dw $0004 : db $00 : dw DATA_FD1AA0 : db $01,$0A,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $05B0,$056D
	db $FF
	dw $FFFF

DATA_FD04C5:
	dw $0004 : db $00 : dw DATA_FD1AB6 : db $01,$48,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0140,$086C
	db $FF
	dw $FFFF

DATA_FD04DC:
	dw $0004 : db $00 : dw DATA_FD1AD7 : db $00,$48,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0140,$086C
	db $FF
	dw $FFFF

DATA_FD04F3:
	dw $0004 : db $00 : dw DATA_FD1AE2 : db $00,$05,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0140,$086C
	db $FF
	dw $FFFF

DATA_FD050A:
	dw $0004 : db $00 : dw DATA_FD1AD7 : db $00,$48,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0140,$086C
	db $FF
	dw $FFFF

DATA_FD0521:
	dw $0001 : db $00 : dw DATA_FD1AED : db $02,$01,$00 : dw $001D : db $00 : dw $0000,$0000 : db $00 : dw $0A20,$0290
	db $FF
	dw $FFFF

DATA_FD0538:
	dw $0004 : db $00 : dw DATA_FD1AF8 : db $00,$43,$00 : dw $0000 : db $00 : dw $0000,$0000 : db $00 : dw $01DF,$0259
	db $FF
	dw $FFFF

DATA_FD054F:
	dw $0001 : db $10 : dw DATA_FD19CF : db $08,$73,$02 : dw $0C00 : db $00 : dw $0000,$0420 : db $00 : dw $0FD0,$01E1
	db $FF
	dw $FFFF

DATA_FD0566:
	dw $0004 : db $00 : dw DATA_FD1AC1 : db $02,$65,$00 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $3000,$01CD
	db $FF
	db $FF

DATA_FD057C:
	dw $0004 : db $00 : dw DATA_FD1ACC : db $00,$6B,$01 : dw $000B : db $00 : dw $0000,$0000 : db $00 : dw $0790,$0215
	db $FF
	dw $FFFF

DATA_FD0593:
	dw $0000

DATA_FD0595:
	dw $0000

DATA_FD0597:
	dw $0000

DATA_FD0599:
	dw $0006 : db $00 : dw DATA_FD1909 : db $00,$4A,$00 : dw $0000 : db $00 : dw $0000,$2000 : db $00 : dw $0140,$0240
	db $FF
	dw $FFFF

DATA_FD05B0:
	dw $0006 : db $00 : dw DATA_FD1909 : db $01,$4A,$00 : dw $0000 : db $00 : dw $0000,$2000 : db $00 : dw $01A0,$02A0
	db $FF
	dw $FFFF

DATA_FD05C7:
	dw $0006 : db $00 : dw DATA_FD1909 : db $02,$4A,$00 : dw $0000 : db $00 : dw $0000,$2000 : db $00 : dw $0120,$0320
	db $FF
	dw $FFFF

DATA_FD05DE:
	dw $0003 : db $1F : dw DATA_FD19AE : db $03,$7F,$00 : dw $0000 : db $05 : dw $0000,$0800 : db $00 : dw $0138,$018D
	db $00,$C0,$01,$10,$02
	db $00,$60,$02,$AD,$02
	db $FF
	dw $FFFF

DATA_FD05FF:
	dw $0003 : db $0C : dw DATA_FD1A11 : db $02,$7E,$00 : dw $0001 : db $00 : dw $0000,$0800 : db $00 : dw $01DF,$0259
	db $FF
	dw $FFFF

DATA_FD0616:
	dw $0003 : db $28 : dw DATA_FD1A69 : db $06,$76,$01 : dw $0006 : db $04 : dw $0006,$0920 : db $00 : dw $0140,$0135
	db $FF
	dw $FFFF

DATA_FD062D:
	dw $0003 : db $28 : dw DATA_FD1A74 : db $08,$80,$00 : dw $0000 : db $00 : dw $0000,$0800 : db $00 : dw $01A0,$0200
	db $00,$A0,$01,$59,$02
	db $FF
	dw $FFFF

DATA_FD0649:
	dw $0003 : db $0C : dw DATA_FD19E5 : db $00,$22,$00 : dw $0000 : db $02 : dw $0000,$0800 : db $00 : dw $0180,$0135
	db $FF
	dw $FFFF

DATA_FD0660:
	dw $0003 : db $1F : dw DATA_FD1940 : db $00,$60,$01 : dw $0006 : db $00 : dw $0000,$0840 : db $00 : dw $01C0,$0185
	db $00,$10,$02,$41,$02
	db $FF
	dw $FFFF

DATA_FD067C:
	dw $0003 : db $27 : dw DATA_FD1A7F : db $00,$43,$00 : dw $001F : db $13 : dw $0000,$0D00 : db $00 : dw $01DF,$0259
	db $00,$DF,$01,$59,$02
	db $FF
	dw $FFFF

DATA_FD0698:
	dw $0003 : db $1A : dw DATA_FD1A8A : db $00,$5F,$05 : dw $001F : db $14 : dw $0000,$0800 : db $00 : dw $01DF,$0259
	db $FF
	dw $FFFF

DATA_FD06AF:
	dw $0001 : db $0F : dw DATA_FD19F0 : db $00,$01,$02 : dw $0004 : db $00 : dw $0000,$000A : db $00 : dw $0140,$0229
	db $00,$00,$0D,$F8,$01
	db $40,$70,$08,$78,$01
	db $40,$50,$12,$88,$01
	db $00,$80,$18,$00,$02
	db $00,$00,$08,$09,$02
	db $FF
	dw $0250,$0351,$FFFF
	dw $FFFF

DATA_FD06E5:
	dw $0001 : db $0F : dw DATA_FD19F0 : db $01,$62,$02 : dw $0003 : db $00 : dw $0000,$000A : db $00 : dw $0150,$0269
	db $00,$70,$12,$28,$02
	db $40,$B0,$0B,$D0,$01
	db $40,$50,$18,$A8,$01
	db $00,$90,$26,$28,$02
	db $00,$80,$06,$00,$02
	db $FF
	dw $0268,$0369,$FFFF
	dw $FFFF

DATA_FD071B:
	dw $0001 : db $0F : dw DATA_FD19F0 : db $02,$63,$02 : dw $0003 : db $00 : dw $0000,$0000 : db $00 : dw $013C,$0269
	db $00,$00,$10,$60,$02
	db $00,$48,$0E,$D4,$02
	db $00,$F0,$18,$30,$02
	db $00,$80,$1F,$00,$02
	db $00,$B0,$16,$D8,$02
	db $FF
	dw $0254,$0355,$FFFF
	dw $FFFF

DATA_FD0751:
	dw $0001 : db $0E : dw DATA_FD198D : db $00,$72,$00 : dw $0002 : db $00 : dw $0000,$1841 : db $00 : dw $0130,$086D
	db $00,$ED,$07,$E4,$05
	db $40,$65,$03,$08,$07
	db $42,$60,$03,$38,$03
	db $00,$60,$0A,$48,$08
	db $00,$80,$01,$6D,$08
	db $00,$10,$03,$8D,$07
	db $FF
	dw $0252,$0353,$FFFF
	dw $FFFF

DATA_FD078C:
	dw $0001 : db $0E : dw DATA_FD198D : db $01,$0A,$00 : dw $0002 : db $03 : dw $0000,$0841 : db $00 : dw $0130,$0B4D
	db $00,$30,$06,$B0,$06
	db $40,$40,$03,$78,$08
	db $40,$90,$08,$C0,$06
	db $00,$00,$0A,$20,$0B
	db $00,$70,$02,$CD,$08
	db $FF
	dw $0258,$0359,$FFFF
	dw $FFFF

DATA_FD07C2:
	dw $0001 : db $0E : dw DATA_FD1998 : db $02,$11,$00 : dw $0402 : db $08 : dw $0000,$1000 : db $00 : dw $0130,$08CD
	db $00,$B0,$04,$A0,$04
	db $40,$D8,$05,$60,$04
	db $40,$30,$04,$E0,$07
	db $00,$20,$0A,$A5,$08
	db $00,$90,$05,$0C,$05
	db $FF
	dw $025E,$035F,$FFFF
	dw $FFFF

DATA_FD07F8:
	dw $0001 : db $17 : dw DATA_FD19DA : db $00,$08,$00 : dw $0000 : db $00 : dw $0000,$0000 : db $00 : dw $0130,$01CD
	db $00,$50,$12,$70,$01
	db $40,$30,$0F,$9C,$01
	db $40,$40,$1C,$10,$01
	db $00,$C0,$23,$80,$01
	db $00,$90,$1A,$CD,$01
	db $FF
	dw $0256,$0357,$FFFF
	dw $FFFF

DATA_FD082E:
	dw $0001 : db $17 : dw DATA_FD19DA : db $01,$64,$00 : dw $0000 : db $00 : dw $0006,$0000 : db $00 : dw $0130,$02AD
	db $00,$30,$18,$78,$01
	db $40,$40,$02,$00,$02
	db $40,$80,$26,$38,$01
	db $00,$D0,$2A,$ED,$01
	db $00,$00,$28,$6D,$02
	db $FF
	dw $0280,$0381,$FFFF
	dw $FFFF

DATA_FD0864:
	dw $0001 : db $07 : dw DATA_FD19DA : db $02,$65,$00 : dw $0000 : db $0C : dw $000C,$0000 : db $00 : dw $0130,$018D
	db $00,$18,$26,$68,$01
	db $40,$D8,$02,$00,$01
	db $40,$08,$3A,$00,$01
	db $00,$20,$3F,$8D,$02
	db $FF
	dw $027A,$037B,$FFFF
	dw $FFFF

DATA_FD0895:
	dw $0001 : db $0B : dw DATA_FD19FB : db $01,$67,$04 : dw $0010 : db $87 : dw $0000,$1000 : db $00 : dw $0180,$1995
	db $00,$40,$03,$C0,$0F
	db $00,$50,$02,$00,$12
	db $00,$B8,$01,$48,$05
	db $00,$08,$03,$15,$02
	db $00,$40,$01,$60,$03
	db $FF
	dw $0272,$0373,$FFFF
	dw $FFFF

DATA_FD08CB:
	dw $0001 : db $0B : dw DATA_FD1A06 : db $03,$66,$00 : dw $0011 : db $12 : dw $0000,$1480 : db $00 : dw $0180,$20B5
	db $00,$F0,$01,$D8,$11
	db $00,$70,$03,$64,$16
	db $00,$70,$03,$68,$04
	db $00,$08,$03,$6D,$01
	db $FF
	dw $0260,$0361,$FFFF
	dw $FFFF

DATA_FD08FC:
	dw $0001 : db $0B : dw DATA_FD1A06 : db $00,$07,$00 : dw $0001 : db $12 : dw $0000,$0081 : db $00 : dw $0180,$20B5
	db $00,$90,$02,$00,$12
	db $00,$90,$02,$A0,$11
	db $00,$10,$03,$30,$02
	db $00,$08,$03,$6D,$02
	db $00,$00,$03,$B5,$11
	db $FF
	dw $025A,$035B,$FFFF
	dw $FFFF

DATA_FD0932:
	dw $0001 : db $0B : dw DATA_FD1A06 : db $0D,$68,$00 : dw $0801 : db $12 : dw $0000,$0201 : db $00 : dw $01C0,$1E95
	db $00,$7D,$03,$10,$10
	db $00,$B8,$03,$C0,$19
	db $00,$28,$01,$40,$0F
	db $00,$48,$03,$40,$09
	db $00,$60,$03,$B5,$01
	db $FF
	dw $0297,$0398,$0496,$FFFF
	dw $FFFF

DATA_FD096A:
	dw $0001 : db $07 : dw DATA_FD19B9 : db $00,$24,$02 : dw $000E : db $06 : dw $0000,$0000 : db $00 : dw $0118,$01D1
	db $00,$E0,$15,$8A,$02
	db $40,$D0,$0E,$48,$01
	db $40,$80,$21,$48,$01
	db $00,$30,$2B,$D9,$01
	db $00,$18,$01,$D1,$01
	db $00,$48,$27,$E1,$01
	db $00,$20,$05,$01,$02
	db $FF
	dw $025C,$035D,$FFFF
	dw $FFFF

DATA_FD09AA:
	dw $0001 : db $10 : dw DATA_FD19C4 : db $07,$49,$02 : dw $0000 : db $0E : dw $0000,$0400 : db $00 : dw $0120,$01E1
	db $00,$60,$15,$B0,$01
	db $40,$40,$0E,$60,$01
	db $40,$B0,$22,$60,$01
	db $00,$40,$2C,$01,$02
	db $FF
	dw $0262,$0363,$FFFF
	dw $FFFF

DATA_FD09DB:
	dw $0001 : db $10 : dw DATA_FD19B9 : db $08,$73,$02 : dw $0C00 : db $00 : dw $0000,$0420 : db $00 : dw $0120,$01C9
	db $00,$70,$17,$98,$01
	db $40,$30,$0C,$48,$01
	db $40,$F0,$21,$88,$01
	db $00,$90,$2E,$99,$01
	db $FF
	dw $0290,$0391,$FFFF
	dw $FFFF

DATA_FD0A0C:
	dw $0001 : db $06 : dw DATA_FD191F : db $00,$2C,$01 : dw $0006 : db $00 : dw $0000,$0200 : db $00 : dw $0140,$0740
	db $02,$35,$02,$60,$06
	db $00,$A0,$06,$E0,$07
	db $00,$40,$04,$90,$01
	db $00,$90,$09,$40,$07
	db $FF
	dw $0264,$0365,$0000,$0000,$001A,$FFFF
	dw $FFFF

DATA_FD0A43:
	dw $0001 : db $06 : dw DATA_FD191F : db $07,$61,$01 : dw $0006 : db $10 : dw $0000,$0000 : db $00 : dw $0140,$01A0
	db $00,$30,$06,$18,$05
	db $02,$20,$08,$00,$03
	db $00,$80,$09,$60,$07
	db $00,$60,$0A,$C0,$07
	db $FF
	dw $026C,$036D,$0000,$0000,$001B,$FFFF
	dw $FFFF

DATA_FD0A7A:
	dw $0001 : db $06 : dw DATA_FD192A : db $01,$48,$01 : dw $0006 : db $00 : dw $0000,$0000 : db $00 : dw $0130,$0200
	db $00,$A0,$03,$00,$0F
	db $00,$70,$03,$28,$0D
	db $02,$90,$01,$E0,$1D
	db $00,$60,$02,$70,$20
	db $FF
	dw $0286,$0387,$0000,$0000,$001C,$FFFF
	dw $FFFF

DATA_FD0AB1:
	dw $0001 : db $0A : dw DATA_FD1A53 : db $00,$02,$00 : dw $0013 : db $04 : dw $0000,$0000 : db $00 : dw $0120,$206D
	db $02,$50,$04,$50,$10
	db $42,$50,$04,$A0,$0F
	db $42,$50,$04,$A8,$02
	db $00,$20,$04,$ED,$01
	db $FF
	dw $0266,$0367,$FFFF
	dw $FFFF

DATA_FD0AE2:
	dw $0001 : db $0A : dw DATA_FD1A5E : db $00,$75,$00 : dw $000D : db $04 : dw $0002,$0220 : db $00 : dw $0120,$08CD
	db $02,$74,$03,$00,$07
	db $02,$40,$08,$E0,$06
	db $00,$10,$06,$C0,$05
	db $00,$40,$0A,$CD,$01
	db $FF
	dw $026A,$036B,$FFFF
	dw $FFFF

DATA_FD0B13:
	dw $0001 : db $0A : dw DATA_FD1A5E : db $07,$74,$00 : dw $000D : db $04 : dw $000C,$0000 : db $00 : dw $0120,$0B4D
	db $00,$00,$06,$D0,$07
	db $40,$28,$04,$E0,$08
	db $40,$50,$08,$F0,$03
	db $00,$60,$0A,$CD,$01
	db $FF
	dw $027C,$037D,$FFFF
	dw $FFFF

DATA_FD0B44:
	dw $0001 : db $08 : dw DATA_FD1977 : db $00,$46,$00 : dw $0002 : db $00 : dw $0000,$0002 : db $00 : dw $0120,$0BD9
	db $00,$40,$04,$70,$05
	db $40,$00,$07,$A1,$07
	db $42,$A0,$08,$01,$04
	db $02,$A0,$0A,$99,$02
	db $FF
	dw $026E,$036F,$FFFF
	dw $FFFF

DATA_FD0B75:
	dw $0001 : db $08 : dw DATA_FD1977 : db $01,$78,$00 : dw $0002 : db $00 : dw $0000,$0002 : db $00 : dw $0120,$0BF9
	db $02,$00,$03,$50,$07
	db $02,$A0,$04,$F0,$08
	db $00,$60,$03,$50,$02
	db $00,$C0,$0A,$19,$02
	db $FF
	dw $0274,$0375,$FFFF
	dw $FFFF

DATA_FD0BA6:
	dw $0001 : db $26 : dw DATA_FD1977 : db $02,$77,$00 : dw $0002 : db $00 : dw $0000,$0000 : db $00 : dw $0130,$07F9
	db $00,$40,$06,$70,$05
	db $00,$40,$05,$00,$07
	db $00,$68,$01,$34,$03
	db $00,$B0,$0A,$59,$03
	db $FF
	dw $027E,$037F,$FFFF
	dw $FFFF

DATA_FD0BD7:
	dw $0001 : db $19 : dw DATA_FD1A48 : db $00,$3E,$01 : dw $0012 : db $00 : dw $0000,$0210 : db $00 : dw $0120,$0B91
	db $00,$10,$07,$40,$0B
	db $00,$10,$07,$E0,$0A
	db $02,$AA,$07,$20,$08
	db $00,$70,$0A,$F9,$01
	db $02,$20,$09,$F9,$01
	db $FF
	dw $0276,$0377,$FFFF
	dw $FFFF

DATA_FD0C0D:
	dw $0001 : db $19 : dw DATA_FD1A32 : db $00,$3D,$01 : dw $000C : db $00 : dw $0000,$0200 : db $00 : dw $0190,$0148
	db $00,$D0,$07,$A0,$06
	db $00,$40,$01,$E0,$04
	db $00,$78,$08,$80,$02
	db $00,$00,$0B,$D9,$01
	db $FF
	dw $0295,$0394,$FFFF
	dw $FFFF

DATA_FD0C3E:
	dw $0001 : db $07 : dw DATA_FD1A27 : db $00,$28,$00 : dw $0000 : db $0C : dw $0000,$0040 : db $02 : dw $0270,$01D9
	db $00,$50,$1F,$50,$02
	db $40,$60,$14,$D0,$01
	db $40,$30,$38,$C0,$01
	db $00,$80,$43,$D9,$01
	db $FF
	dw $0270,$0371,$FFFF
	dw $FFFF

DATA_FD0C6F:
	dw $0001 : db $21 : dw DATA_FD194B : db $00,$6A,$03 : dw $000F : db $00 : dw $0000,$1003 : db $00 : dw $0138,$1C29
	db $00,$18,$03,$A0,$0F
	db $00,$30,$03,$E8,$17
	db $00,$30,$01,$68,$0A
	db $00,$40,$03,$39,$03
	db $FF
	dw $0278,$0379,$FFFF
	dw $FFFF

DATA_FD0CA0:
	dw $0001 : db $21 : dw DATA_FD1956 : db $02,$33,$04 : dw $0016 : db $8A : dw $0000,$1080 : db $00 : dw $02AF,$1FC0
	db $00,$75,$02,$90,$12
	db $40,$F0,$01,$90,$14
	db $00,$40,$03,$30,$07
	db $00,$50,$03,$F9,$01
	db $FF
	dw $0284,$0385,$FFFF
	dw $FFFF

DATA_FD0CD1:
	dw $0001 : db $21 : dw DATA_FD1961 : db $00,$6B,$03 : dw $000F : db $00 : dw $0000,$0002 : db $00 : dw $0138,$0C61
	db $00,$90,$06,$3C,$08
	db $02,$80,$09,$D8,$09
	db $00,$60,$0A,$08,$02
	db $00,$80,$0A,$D9,$02
	db $FF
	dw $028A,$038B,$FFFF
	dw $FFFF

DATA_FD0D02:
	dw $0001 : db $1E : dw DATA_FD18F3 : db $00,$6E,$00 : dw $0002 : db $00 : dw $0000,$0210 : db $00 : dw $0140,$03F0
	db $00,$60,$07,$90,$05
	db $00,$00,$0B,$D0,$03
	db $00,$43,$0B,$98,$0B
	db $00,$A0,$0B,$31,$0C
	db $FF
	dw $0282,$0383,$FFFF
	dw $FFFF

DATA_FD0D33:
	dw $0001 : db $29 : dw DATA_FD1909 : db $04,$6F,$02 : dw $1402 : db $00 : dw $0000,$0000 : db $00 : dw $0130,$0189
	db $00,$BC,$12,$F8,$02
	db $00,$E0,$18,$50,$03
	db $00,$10,$1E,$00,$03
	db $00,$B0,$20,$4D,$03
	db $FF
	dw $0288,$0389,$FFFF
	dw $FFFF

DATA_FD0D64:
	dw $0001 : db $1E : dw DATA_FD18F3 : db $01,$70,$00 : dw $0002 : db $00 : dw $0000,$0000 : db $00 : dw $0150,$0A69
	db $00,$A8,$06,$D0,$05
	db $00,$E4,$02,$90,$05
	db $00,$A0,$06,$90,$02
	db $00,$10,$0A,$2D,$02
	db $FF
	dw $028E,$038F,$FFFF
	dw $FFFF

DATA_FD0D95:
	dw $0001 : db $1D : dw DATA_FD196C : db $00,$79,$00 : dw $0000 : db $00 : dw $0000,$000A : db $00 : dw $0120,$028D
	db $00,$A8,$11,$CC,$01
	db $40,$A8,$11,$58,$01
	db $40,$D8,$1D,$68,$01
	db $00,$40,$27,$AD,$01
	db $FF
	dw $028C,$038D,$FFFF
	dw $FFFF

DATA_FD0DC6:
	dw $0001 : db $1D : dw DATA_FD196C : db $01,$7A,$00 : dw $0014 : db $00 : dw $0000,$000E : db $00 : dw $0120,$028D
	db $00,$C0,$16,$65,$01
	db $40,$10,$0F,$40,$01
	db $40,$70,$20,$00,$01
	db $00,$60,$2E,$0D,$02
	db $FF
	dw $0292,$0393,$FFFF
	dw $FFFF

DATA_FD0DF7:
	dw $0001 : db $07 : dw DATA_FD196C : db $02,$45,$00 : dw $0000 : db $00 : dw $0000,$0000 : db $00 : dw $0120,$028D
	db $00,$20,$01,$8D,$02
	db $40,$00,$02,$A8,$01
	db $40,$18,$37,$08,$01
	db $40,$F0,$01,$A8,$01
	db $00,$30,$39,$CD,$01
	db $FF
	dw $02A0,$039F,$049E,$FFFF
	dw $FFFF

DATA_FD0E2F:
	dw $0001 : db $21 : dw DATA_FD194B : db $01,$6C,$03 : dw $001B : db $11 : dw $0000,$0002 : db $00 : dw $0190,$1F09
	db $00,$50,$01,$00,$11
	db $00,$E0,$01,$E0,$1C
	db $00,$50,$01,$20,$07
	db $00,$40,$03,$18,$02
	db $FF
	dw $0299,$039A,$FFFF
	dw $FFFF


DATA_FD0E60:
	dw $0001 : db $1E : dw DATA_FD18FE : db $05,$4A,$00 : dw $0002 : db $00 : dw $0000,$0000 : db $00 : dw $0140,$03B0
	db $00,$60,$11,$20,$03
	db $00,$00,$10,$40,$03
	db $00,$C8,$16,$C0,$02
	db $00,$60,$20,$80,$03
	db $00,$30,$20,$F1,$03
	db $FF
	dw $029B,$039D,$049C,$FFFF
	dw $FFFF

DATA_FD0E98:
	dw $0001 : db $1C : dw DATA_FD194B : db $03,$6D,$01 : dw $001C : db $00 : dw $0000,$0800 : db $00 : dw $0120,$0999
	db $00,$60,$02,$18,$1A
	db $00,$F0,$02,$99,$02
	db $FF
	dw $FFFF
	dw $FFFF

DATA_FD0EBB:
	dw $0005 : db $49 : dw DATA_FD1A95 : db $00,$05,$00 : dw $0000 : db $01 : dw $0000,$0000 : db $00 : dw $0120,$01D8
	db $FF
	dw $FFFF
	dw $FFFF

DATA_FD0ED4:
	dw $0000

DATA_FD0ED6:
	dw $0000

DATA_FD0ED8:
	dw $0002,$5003 : db $03 : dw DATA_FD19F0 : db $03,$01,$00 : dw $0000 : db $00 : dw $0000,$000A
	db $00,$10,$01,$E9,$01
	db $FF
	dw $FFFF

DATA_FD0EF1:
	dw $0002,$1504 : db $03 : dw DATA_FD19F0 : db $04,$01,$00 : dw $0000 : db $00 : dw $0000,$000A
	db $00,$28,$01,$69,$02
	db $FF
	dw $FFFF

DATA_FD0F0A:
	dw $0002,$6003 : db $01 : dw DATA_FD19A3 : db $04,$72,$00 : dw $0000 : db $00 : dw $0000,$0840
	db $02,$00,$03,$AD,$01
	db $FF
	dw $FFFF

DATA_FD0F23:
	dw $0002,$0101 : db $01 : dw DATA_FD19A3 : db $05,$72,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$40,$01,$AD,$01
	db $FF
	dw $FFFF

DATA_FD0F3C:
	dw $0002,$3003 : db $03 : dw DATA_FD19F0 : db $05,$63,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$20,$01,$E0,$02
	db $FF
	dw $FFFF

DATA_FD0F55:
	dw $0002,$0402 : db $03 : dw DATA_FD19F0 : db $06,$63,$00 : dw $0000 : db $00 : dw $0000,$000A
	db $00,$35,$01,$F0,$01
	db $FF
	dw $FFFF

DATA_FD0F6E:
	dw $0002,$0402 : db $03 : dw DATA_FD19DA : db $03,$08,$00 : dw $0000 : db $00 : dw $0002,$0000
	db $00,$20,$01,$CD,$01
	db $FF
	dw $FFFF

DATA_FD0F87:
	dw $0002,$0101 : db $03 : dw DATA_FD19DA : db $04,$08,$00 : dw $0000 : db $00 : dw $0004,$0000
	db $00,$30,$01,$CD,$01
	db $FF
	dw $FFFF

DATA_FD0FA0:
	dw $0002,$2003 : db $01 : dw DATA_FD19A3 : db $06,$0A,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$50,$01,$AD,$01
	db $FF
	dw $FFFF

DATA_FD0FB9:
	dw $0002,$1504 : db $01 : dw DATA_FD19A3 : db $06,$0A,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$50,$01,$AD,$01
	db $FF
	dw $FFFF

DATA_FD0FD2:
	dw $0002,$0101 : db $02 : dw DATA_FD1A06 : db $04,$07,$00 : dw $0000 : db $00 : dw $0000,$0001
	db $00,$90,$01,$15,$04
	db $FF
	dw $FFFF

DATA_FD0FEB:
	dw $0002,$1504 : db $02 : dw DATA_FD1A06 : db $05,$07,$00 : dw $0000 : db $00 : dw $0000,$0001
	db $00,$90,$01,$75,$03
	db $FF
	dw $FFFF

DATA_FD1004:
	dw $0002,$1504 : db $03 : dw DATA_FD19B9 : db $01,$24,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$58,$01,$48,$02
	db $FF
	dw $FFFF

DATA_FD101D:
	dw $0002,$0402 : db $03 : dw DATA_FD19B9 : db $02,$24,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$20,$01,$21,$02
	db $FF
	dw $FFFF

DATA_FD1036:
	dw $0002,$0402 : db $01 : dw DATA_FD1998 : db $07,$11,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$40,$01,$ED,$01
	db $FF
	dw $FFFF

DATA_FD104F:
	dw $0002,$0101 : db $01 : dw DATA_FD1998 : db $08,$11,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$40,$01,$AD,$01
	db $FF
	dw $FFFF

DATA_FD1068:
	dw $0002,$1504 : db $02 : dw DATA_FD1A06 : db $06,$66,$00 : dw $0000 : db $00 : dw $0000,$0600
	db $00,$50,$01,$F9,$02
	db $FF
	dw $FFFF

DATA_FD1081:
	dw $0002,$3003 : db $02 : dw DATA_FD1A06 : db $07,$66,$00 : dw $0000 : db $00 : dw $0000,$0400
	db $00,$90,$01,$B5,$02
	db $FF
	dw $FFFF

DATA_FD109A:
	dw $0002,$0702 : db $03 : dw DATA_FD19B9 : db $03,$49,$00 : dw $0000 : db $00 : dw $0000,$0400
	db $00,$20,$01,$21,$02
	db $FF
	dw $FFFF

DATA_FD10B3:
	dw $0002,$1504 : db $03 : dw DATA_FD19B9 : db $04,$49,$00 : dw $0000 : db $0F : dw $0000,$0400
	db $00,$10,$01,$E1,$01
	db $FF
	dw $FFFF

DATA_FD10CC:
	dw $0002,$0101 : db $03 : dw DATA_FD191F : db $01,$2C,$01 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$20,$01,$F0,$01
	db $FF
	dw $FFFF

DATA_FD10E5:
	dw $0002,$0A02 : db $03 : dw DATA_FD191F : db $02,$2C,$01 : dw $0000 : db $00 : dw $0000,$0200
	db $00,$90,$01,$B8,$03
	db $FF
	dw $FFFF

DATA_FD10FE:
	dw $0002,$2003 : db $02 : dw DATA_FD1A5E : db $01,$02,$00 : dw $0000 : db $00 : dw $000A,$0000
	db $00,$20,$01,$51,$04
	db $FF
	dw $FFFF

DATA_FD1117:
	dw $0002,$6003 : db $02 : dw DATA_FD1A5E : db $02,$02,$00 : dw $0013 : db $00 : dw $0004,$0000
	db $00,$20,$01,$55,$02
	db $FF
	dw $FFFF

DATA_FD1130:
	dw $0002,$1504 : db $03 : dw DATA_FD19F0 : db $07,$62,$00 : dw $0000 : db $00 : dw $0000,$000A
	db $00,$20,$01,$69,$02
	db $FF
	dw $FFFF

DATA_FD1149:
	dw $0002,$0101 : db $03 : dw DATA_FD19F0 : db $08,$62,$00 : dw $0000 : db $00 : dw $0000,$000A
	db $00,$20,$01,$69,$02
	db $FF
	dw $FFFF

DATA_FD1162:
	dw $0002,$7003 : db $02 : dw DATA_FD1A5E : db $02,$75,$00 : dw $0000 : db $00 : dw $000E,$0000
	db $00,$30,$01,$55,$02
	db $FF
	dw $FFFF

DATA_FD117B:
	dw $0002,$0702 : db $02 : dw DATA_FD1A5E : db $03,$75,$00 : dw $0000 : db $00 : dw $0008,$0000
	db $00,$30,$01,$55,$02
	db $FF
	dw $FFFF

DATA_FD1194:
	dw $0002,$1504 : db $03 : dw DATA_FD191F : db $03,$61,$01 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$3A,$01,$D5,$01
	db $FF
	dw $FFFF

DATA_FD11AD:
	dw $0002,$0A02 : db $03 : dw DATA_FD191F : db $04,$61,$01 : dw $0006 : db $10 : dw $0000,$0000
	db $00,$00,$03,$F0,$02
	db $FF
	dw $FFFF

DATA_FD11C6:
	dw $0002,$0A02 : db $01 : dw DATA_FD1977 : db $04,$46,$00 : dw $0000 : db $00 : dw $0000,$0200
	db $00,$20,$01,$F9,$01
	db $FF
	dw $FFFF

DATA_FD11DF:
	dw $0002,$1504 : db $01 : dw DATA_FD1977 : db $05,$46,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$20,$01,$F9,$01
	db $FF
	dw $FFFF

DATA_FD11F8:
	dw $0002,$0602 : db $03 : dw DATA_FD1A27 : db $01,$28,$00 : dw $0000 : db $0C : dw $0000,$0000
	db $00,$30,$01,$B9,$01
	db $FF
	dw $FFFF

DATA_FD1211:
	dw $0002,$2003 : db $03 : dw DATA_FD1A27 : db $02,$28,$00 : dw $0000 : db $0C : dw $0000,$0000
	db $00,$70,$01,$90,$02
	db $FF
	dw $FFFF

DATA_FD122A:
	dw $0002,$0101 : db $02 : dw DATA_FD19FB : db $08,$67,$04 : dw $0010 : db $87 : dw $0000,$0000
	db $00,$90,$01,$35,$04
	db $FF
	dw $FFFF

DATA_FD1243:
	dw $0002,$1504 : db $02 : dw DATA_FD19FB : db $09,$67,$04 : dw $0010 : db $87 : dw $0000,$0000
	db $00,$90,$01,$90,$07
	db $FF
	dw $FFFF

DATA_FD125C:
	dw $0002,$0101 : db $01 : dw DATA_FD1977 : db $03,$78,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$40,$01,$D9,$01
	db $FF
	dw $FFFF

DATA_FD1275:
	dw $0002,$0101 : db $01 : dw DATA_FD1977 : db $07,$78,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $02,$F0,$02,$79,$02
	db $FF
	dw $FFFF

DATA_FD128E:
	dw $0002,$8003 : db $03 : dw DATA_FD1A48 : db $01,$3E,$00 : dw $0000 : db $00 : dw $0000,$0010
	db $00,$40,$01,$D9,$01
	db $FF
	dw $FFFF

DATA_FD12A7:
	dw $0002,$0A02 : db $03 : dw DATA_FD1A48 : db $02,$3E,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$20,$01,$60,$04
	db $FF
	dw $FFFF

DATA_FD12C0:
	dw $0002,$3003 : db $02 : dw DATA_FD1961 : db $01,$6A,$00 : dw $000F : db $00 : dw $0000,$0002
	db $00,$50,$01,$90,$01
	db $FF
	dw $FFFF

DATA_FD12D9:
	dw $0002,$0101 : db $02 : dw DATA_FD1961 : db $02,$6A,$00 : dw $000F : db $00 : dw $0000,$0002
	db $00,$50,$01,$D0,$02
	db $FF
	dw $FFFF

DATA_FD12F2:
	dw $0002,$0302 : db $03 : dw DATA_FD19DA : db $07,$65,$00 : dw $0000 : db $0C : dw $000E,$0000
	db $00,$10,$01,$ED,$01
	db $FF
	dw $FFFF

DATA_FD130B:
	dw $0002,$5003 : db $03 : dw DATA_FD19DA : db $08,$65,$00 : dw $0000 : db $00 : dw $0010,$0000
	db $00,$20,$01,$8D,$01
	db $FF
	dw $FFFF

DATA_FD1324:
	dw $0002,$1504 : db $02 : dw DATA_FD1A5E : db $04,$74,$00 : dw $0000 : db $0D : dw $0010,$0000
	db $00,$10,$01,$AD,$01
	db $FF
	dw $FFFF

DATA_FD133D:
	dw $0002,$0101 : db $02 : dw DATA_FD1A5E : db $05,$74,$00 : dw $0000 : db $0D : dw $0012,$0000
	db $00,$10,$01,$ED,$03
	db $FF
	dw $FFFF

DATA_FD1356:
	dw $0002,$1504 : db $01 : dw DATA_FD1977 : db $05,$77,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$10,$01,$F9,$01
	db $FF
	dw $FFFF

DATA_FD136F:
	dw $0002,$0A05 : db $01 : dw DATA_FD1982 : db $06,$77,$01 : dw $000B : db $00 : dw $0000,$0000
	db $00,$60,$01,$99,$03
	db $FF
	dw $FFFF

DATA_FD1388:
	dw $0002,$0101 : db $03 : dw DATA_FD19DA : db $05,$64,$00 : dw $0000 : db $00 : dw $0008,$0000
	db $00,$20,$01,$2D,$02
	db $FF
	dw $FFFF

DATA_FD13A1:
	dw $0002,$3003 : db $03 : dw DATA_FD19DA : db $06,$64,$00 : dw $0000 : db $00 : dw $000A,$0000
	db $00,$60,$01,$0D,$02
	db $FF
	dw $FFFF

DATA_FD13BA:
	dw $0002,$0702 : db $01 : dw DATA_FD18FE : db $03,$6E,$00 : dw $0000 : db $00 : dw $0000,$0210
	db $00,$40,$01,$D1,$02
	db $FF
	dw $FFFF

DATA_FD13D3:
	dw $0002,$4003 : db $01 : dw DATA_FD18FE : db $08,$6E,$00 : dw $0000 : db $00 : dw $0000,$0010
	db $00,$28,$01,$62,$02
	db $FF
	dw $FFFF

DATA_FD13EC:
	dw $0002,$0101 : db $02 : dw DATA_FD1961 : db $03,$33,$04 : dw $000F : db $8A : dw $0001,$0080
	db $00,$8F,$01,$E0,$04
	db $FF
	dw $FFFF

DATA_FD1405:
	dw $0002,$0101 : db $02 : dw DATA_FD1961 : db $03,$33,$04 : dw $000F : db $8A : dw $0002,$0080
	db $00,$8F,$01,$10,$05
	db $FF
	dw $FFFF

DATA_FD141E:
	dw $0002,$9003 : db $03 : dw DATA_FD1935 : db $05,$48,$01 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$40,$01,$60,$02
	db $FF
	dw $FFFF

DATA_FD1437:
	dw $0002,$4003 : db $03 : dw DATA_FD1935 : db $06,$48,$01 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$D0,$01,$D0,$02
	db $FF
	dw $FFFF

DATA_FD1450:
	dw $0002,$2003 : db $01 : dw DATA_FD1909 : db $06,$6F,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$20,$01,$F8,$01
	db $FF
	dw $FFFF

DATA_FD1469:
	dw $0002,$1504 : db $01 : dw DATA_FD18FE : db $07,$6F,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$B0,$01,$29,$02
	db $FF
	dw $FFFF

DATA_FD1482:
	dw $0002,$0101 : db $02 : dw DATA_FD1961 : db $04,$6B,$00 : dw $000F : db $00 : dw $0000,$0002
	db $00,$50,$01,$90,$01
	db $FF
	dw $FFFF

DATA_FD149B:
	dw $0002,$1504 : db $02 : dw DATA_FD1961 : db $05,$6B,$00 : dw $000F : db $00 : dw $0000,$0002
	db $00,$3F,$01,$B8,$01
	db $FF
	dw $FFFF

DATA_FD14B4:
	dw $0002,$3003 : db $02 : dw DATA_FD196C : db $03,$79,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$30,$01,$AD,$01
	db $FF
	dw $FFFF

DATA_FD14CD:
	dw $0002,$1504 : db $02 : dw DATA_FD196C : db $04,$79,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$58,$01,$AD,$01
	db $FF
	dw $FFFF

DATA_FD14E6:
	dw $0002,$5003 : db $01 : dw DATA_FD18FE : db $08,$70,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$30,$01,$69,$02
	db $FF
	dw $FFFF

DATA_FD14FF:
	dw $0002,$0101 : db $01 : dw DATA_FD18FE : db $09,$70,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$50,$01,$F1,$01
	db $FF
	dw $FFFF

DATA_FD1518:
	dw $0002,$0101 : db $03 : dw DATA_FD19B9 : db $06,$73,$00 : dw $0000 : db $00 : dw $0000,$0400
	db $00,$20,$01,$21,$02
	db $FF
	dw $FFFF

DATA_FD1531:
	dw $0002,$1003 : db $03 : dw DATA_FD19B9 : db $05,$73,$00 : dw $0000 : db $00 : dw $0000,$0400
	db $00,$20,$01,$21,$02
	db $FF
	dw $FFFF

DATA_FD154A:
	dw $0002,$3003 : db $02 : dw DATA_FD196C : db $05,$7A,$00 : dw $0000 : db $00 : dw $0000,$000E
	db $00,$18,$01,$0D,$02
	db $FF
	dw $FFFF

DATA_FD1563:
	dw $0002,$1504 : db $02 : dw DATA_FD196C : db $06,$7A,$00 : dw $0000 : db $00 : dw $0000,$000E
	db $00,$20,$01,$4D,$02
	db $FF
	dw $FFFF

DATA_FD157C:
	dw $0002,$3003 : db $03 : dw DATA_FD1A3D : db $03,$3D,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$20,$02,$80,$01
	db $FF
	dw $FFFF

DATA_FD1595:
	dw $0002,$0902 : db $03 : dw DATA_FD1A3D : db $04,$3D,$00 : dw $0000 : db $00 : dw $0000,$0200
	db $02,$E0,$03,$80,$02
	db $FF
	dw $FFFF

DATA_FD15AE:
	dw $0002,$2003 : db $02 : dw DATA_FD1A06 : db $0A,$68,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$60,$01,$59,$02
	db $FF
	dw $FFFF

DATA_FD15C7:
	dw $0002,$0101 : db $02 : dw DATA_FD1A06 : db $0B,$68,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$38,$01,$D7,$02
	db $FF
	dw $FFFF

DATA_FD15E0:
	dw $0002,$1504 : db $02 : dw DATA_FD1A06 : db $0C,$68,$00 : dw $0000 : db $00 : dw $0000,$0000
	db $00,$40,$01,$C0,$02
	db $FF
	dw $FFFF

DATA_FD15F9:
	dw $0002,$1504 : db $02 : dw DATA_FD1961 : db $06,$6C,$00 : dw $000F : db $00 : dw $0000,$0000
	db $00,$60,$01,$F9,$01
	db $FF
	dw $FFFF

DATA_FD1612:
	dw $0002,$0502 : db $02 : dw DATA_FD1961 : db $07,$6C,$00 : dw $001B : db $00 : dw $0000,$0000
	db $00,$70,$01,$15,$03
	db $FF
	dw $FFFF

DATA_FD162B:
	dw $0002,$4003 : db $01 : dw DATA_FD18FE : db $0A,$4A,$00 : dw $000B : db $00 : dw $0000,$0000
	db $00,$50,$01,$F1,$01
	db $FF
	dw $FFFF

DATA_FD1644:
	dw $0002,$1504 : db $01 : dw DATA_FD18FE : db $0B,$4A,$00 : dw $000B : db $00 : dw $0000,$0000
	db $00,$50,$01,$B1,$01
	db $FF
	dw $FFFF

DATA_FD165D:
	dw $0002,$0101 : db $01 : dw DATA_FD18FE : db $0C,$4A,$00 : dw $000B : db $00 : dw $0000,$0000
	db $00,$40,$01,$B1,$01
	db $FF
	dw $FFFF

DATA_FD1676:
	dw $0002,$1504 : db $02 : dw DATA_FD196C : db $07,$45,$00 : dw $0000 : db $00 : dw $0000,$0200
	db $00,$20,$01,$4D,$02
	db $FF
	dw $FFFF

DATA_FD168F:
	dw $0002,$1504 : db $02 : dw DATA_FD196C : db $07,$45,$00 : dw $0000 : db $00 : dw $0000,$0200
	db $00,$20,$01,$4D,$02
	db $FF
	dw $FFFF

DATA_FD16A8:
	dw $0002,$1504 : db $02 : dw DATA_FD196C : db $08,$45,$00 : dw $0000 : db $00 : dw $0000,$0200
	db $00,$58,$01,$48,$02
	db $FF
	dw $FFFF

DATA_FD16C1:
	dw DATA_FD16CF,DATA_FD1723,DATA_FD17C7,DATA_FD17C9,DATA_FD17D7,DATA_FD17D9,DATA_FD1779

DATA_FD16CF:
	dw $01A0,DATA_FD16E1
	dw $025F,DATA_FD16F5
	dw $0320,DATA_FD1707
	dw $03DF,DATA_FD1715
	dw $FFFF

DATA_FD16E1:
	dw $1814,$1414,$1294,$0F94,$0894,$0694,$0614,$0514
	dw $0194,$0000

DATA_FD16F5:
	dw $1814,$13D4,$1254,$0E94,$0854,$0654,$0514,$0194
	dw $0000

DATA_FD1707:
	dw $1D94,$1014,$0E14,$0754,$0514,$01D4,$0000

DATA_FD1715:
	dw $1014,$0E14,$0794,$0514,$0314,$01D4,$0000

DATA_FD1723:
	dw $0180,DATA_FD1745
	dw $02FF,DATA_FD1749
	dw $0440,DATA_FD1755
	dw $057F,DATA_FD1757
	dw $06C0,DATA_FD175B
	dw $07BF,DATA_FD1765
	dw $0880,DATA_FD1771
	dw $09FF,DATA_FD1775
	dw $FFFF

DATA_FD1745:
	dw $08B4,$0000

DATA_FD1749:
	dw $08B4,$0734,$05F4,$03B4,$0234,$0000

DATA_FD1755:
	dw $0000

DATA_FD1757:
	dw $05B4,$0000

DATA_FD175B:
	dw $0874,$06F4,$0434,$01F4,$0000

DATA_FD1765:
	dw $0874,$06F4,$0574,$0474,$01F4,$0000

DATA_FD1771:
	dw $0734,$0000

DATA_FD1775:
	dw $0874,$0000

DATA_FD1779:
	dw $0200,DATA_FD179B
	dw $02FF,DATA_FD17A1
	dw $0440,DATA_FD17A7
	dw $05BF,DATA_FD17AB
	dw $0680,DATA_FD17AF
	dw $077F,DATA_FD17B5
	dw $0840,DATA_FD17B9
	dw $09BF,DATA_FD17C1
	dw $FFFF

DATA_FD179B:
	dw $0AF4,$0874,$0000

DATA_FD17A1:
	dw $0AF4,$0834,$0000

DATA_FD17A7:
	dw $0834,$0000

DATA_FD17AB:
	dw $0834,$0000

DATA_FD17AF:
	dw $0634,$04F4,$0000

DATA_FD17B5:
	dw $04B4,$0000

DATA_FD17B9:
	dw $09F4,$02B4,$0174,$0000

DATA_FD17C1:
	dw $0A34,$02B4,$0000

DATA_FD17C7:
	dw $FFFF

DATA_FD17C9:
	dw $0160,DATA_FD17D3
	dw $01DF,DATA_FD17D5
	dw $FFFF

DATA_FD17D3:
	dw $0000

DATA_FD17D5:
	dw $0000

DATA_FD17D7:
	dw $FFFF

DATA_FD17D9:
	dw $FFFF

DATA_FD17DB:
	db $80,$38,$9C,$08,$54,$44,$0C,$08,$A0,$60,$88,$08,$55,$45,$0C,$08
	db $C0,$40,$A8,$08,$55,$45,$0C,$08,$80,$38,$94,$08,$55,$45,$0C,$08
	db $A0,$38,$94,$08,$55,$45,$0C,$08,$A0,$60,$70,$08,$66,$55,$0C,$08
	db $A0,$60,$84,$08,$54,$44,$0C,$08,$A0,$60,$84,$08,$53,$43,$10,$08
	db $A0,$60,$84,$08,$53,$43,$10,$08,$C0,$40,$9C,$38,$58,$45,$04,$08
	db $C0,$40,$78,$38,$45,$46,$0C,$08,$80,$80,$78,$38,$45,$46,$0C,$08
	db $B0,$50,$84,$08,$54,$44,$0C,$08,$B0,$50,$80,$08,$54,$44,$0C,$08
	db $A0,$68,$9C,$08,$54,$44,$0C,$08,$A0,$60,$90,$08,$54,$44,$0C,$08
	db $90,$70,$CC,$08,$55,$45,$0C,$08,$A0,$60,$A0,$08,$55,$45,$0C,$08
	db $C0,$40,$B0,$08,$54,$44,$0C,$08,$B0,$50,$A0,$08,$54,$44,$0C,$08
	db $70,$25,$9C,$08,$54,$44,$0C,$08,$C0,$40,$A0,$38,$45,$46,$0C,$08
	db $A0,$60,$B0,$08,$54,$64,$0C,$08,$A0,$48,$A0,$08,$53,$43,$0C,$08
	db $80,$28,$84,$08,$53,$43,$10,$08,$C0,$40,$A0,$08,$55,$45,$0C,$08
	db $A0,$40,$84,$08,$53,$43,$10,$08,$A0,$60,$B0,$A0,$54,$44,$0C,$08
	db $A0,$60,$90,$08,$55,$45,$0C,$08,$70,$60,$80,$08,$54,$44,$0C,$08
	db $C0,$40,$A8,$08,$55,$44,$0C,$0C,$B0,$50,$A8,$08,$55,$44,$0C,$0C

DATA_FD18DB:
	db $07,$08,$0A,$09,$02,$08,$0A,$09,$07,$08,$15,$09,$17,$08,$0A,$09
	db $18,$08,$0A,$09,$19,$1A,$0A,$09

DATA_FD18F3:
	db $00,$00,$00,$01,$01,$01,$02,$02,$00,$00,$00

DATA_FD18FE:
	db $00,$00,$00,$01,$01,$01,$09,$09,$12,$00,$00

DATA_FD1909:
	db $14,$14,$00,$01,$01,$01,$09,$09,$12,$00,$00

UNK_FD1914:
	db $0C,$0C,$00,$01,$02,$02,$03,$03,$01,$02,$00

DATA_FD191F:
	db $0C,$0C,$00,$01,$02,$02,$16,$16,$0F,$02,$00

DATA_FD192A:
	db $13,$13,$00,$01,$13,$13,$1E,$1E,$01,$02,$90

DATA_FD1935:
	db $13,$13,$00,$01,$13,$13,$22,$22,$0F,$02,$90

DATA_FD1940:
	db $0B,$0B,$00,$01,$1B,$19,$14,$14,$01,$00,$00

DATA_FD194B:
	db $00,$00,$00,$01,$03,$03,$04,$04,$02,$00,$00

DATA_FD1956:
	db $00,$00,$00,$01,$03,$03,$04,$04,$02,$00,$00

DATA_FD1961:
	db $00,$00,$00,$01,$03,$03,$18,$18,$11,$00,$00

DATA_FD196C:
	db $00,$00,$00,$01,$04,$04,$05,$05,$03,$00,$00

DATA_FD1977:
	db $00,$00,$00,$01,$05,$05,$06,$06,$04,$00,$00

DATA_FD1982:
	db $00,$00,$00,$03,$05,$05,$06,$06,$04,$00,$00

DATA_FD198D:
	db $0D,$0D,$00,$01,$06,$06,$07,$07,$05,$00,$00

DATA_FD1998:
	db $05,$05,$00,$01,$0E,$0E,$11,$11,$05,$00,$A0

DATA_FD19A3:
	db $00,$00,$00,$01,$06,$06,$07,$07,$05,$00,$00

DATA_FD19AE:
	db $0A,$0A,$00,$01,$1A,$18,$13,$13,$05,$04,$00

DATA_FD19B9:
	db $09,$09,$00,$01,$07,$07,$08,$08,$06,$80,$00

DATA_FD19C4:
	db $09,$09,$00,$01,$07,$07,$08,$08,$06,$80,$A0

DATA_FD19CF:
	db $09,$09,$00,$05,$07,$07,$08,$08,$06,$80,$00

DATA_FD19DA:
	db $06,$06,$00,$01,$09,$09,$0A,$0A,$08,$22,$04

DATA_FD19E5:
	db $08,$08,$00,$00,$12,$12,$12,$12,$0D,$01,$00

DATA_FD19F0:
	db $01,$01,$00,$01,$0A,$0A,$01,$01,$09,$00,$01

DATA_FD19FB:
	db $02,$02,$00,$01,$0B,$0B,$0B,$0B,$0A,$04,$00

DATA_FD1A06:
	db $07,$07,$00,$01,$0B,$0B,$0B,$0B,$0A,$04,$00

DATA_FD1A11:
	db $04,$04,$00,$01,$19,$17,$10,$10,$14,$02,$00

UNK_FD1A1C:
	db $00,$00,$00,$01,$0C,$0C,$0C,$0C,$0B,$00,$00

DATA_FD1A27:
	db $00,$00,$00,$01,$0C,$0C,$15,$15,$0E,$00,$00

DATA_FD1A32:
	db $0F,$0F,$00,$01,$0C,$0C,$19,$19,$07,$00,$00

DATA_FD1A3D:
	db $0F,$0F,$00,$01,$0C,$0C,$23,$23,$0B,$00,$00

DATA_FD1A48:
	db $10,$10,$00,$01,$0C,$0C,$1A,$1A,$0B,$00,$08

DATA_FD1A53:
	db $0E,$0E,$00,$01,$0D,$0D,$0D,$0D,$0C,$06,$02

DATA_FD1A5E:
	db $0E,$0E,$00,$01,$0D,$0D,$17,$17,$10,$06,$02

DATA_FD1A69:
	db $0E,$0E,$00,$01,$0D,$0D,$1B,$1B,$10,$06,$02

DATA_FD1A74:
	db $12,$12,$00,$07,$1D,$1B,$1D,$1D,$04,$02,$00

DATA_FD1A7F:
	db $11,$11,$00,$06,$1C,$1A,$1C,$1C,$0D,$03,$00

DATA_FD1A8A:
	db $18,$18,$00,$08,$14,$14,$21,$21,$13,$03,$00

DATA_FD1A95:
	db $03,$03,$00,$00,$17,$15,$0E,$0E,$0D,$01,$00

DATA_FD1AA0:
	db $00,$00,$00,$02,$06,$06,$07,$07,$05,$00,$40

DATA_FD1AAB:
	db $0C,$0C,$00,$02,$02,$02,$16,$16,$0F,$02,$40

DATA_FD1AB6:
	db $13,$13,$00,$02,$13,$13,$1E,$1E,$01,$02,$D0

DATA_FD1AC1:
	db $06,$06,$00,$02,$09,$09,$0A,$0A,$08,$22,$44

DATA_FD1ACC:
	db $00,$00,$00,$02,$03,$03,$18,$18,$11,$00,$40

DATA_FD1AD7:
	db $15,$15,$00,$00,$17,$15,$1F,$1F,$0D,$09,$00

DATA_FD1AE2:
	db $16,$16,$00,$02,$3B,$32,$1F,$1F,$0D,$01,$40

DATA_FD1AED:
	db $17,$17,$00,$04,$3D,$0A,$20,$20,$09,$01,$00

DATA_FD1AF8:
	db $00,$00,$00,$02,$1C,$33,$00,$24,$0D,$03,$40


;VRAM payloads
DATA_FD1B03:
	dw DATA_FD1B8B-DATA_FD1B03
	dw DATA_FD1BB9-DATA_FD1B03
	dw DATA_FD1BD6-DATA_FD1B03
	dw DATA_FD1BEC-DATA_FD1B03
	dw DATA_FD1C17-DATA_FD1B03
	dw DATA_FD1C50-DATA_FD1B03
	dw DATA_FD1C74-DATA_FD1B03
	dw DATA_FD1C8A-DATA_FD1B03
	dw DATA_FD1BA1-DATA_FD1B03
	dw DATA_FD1CBC-DATA_FD1B03
	dw DATA_FD1CD2-DATA_FD1B03
	dw DATA_FD1D04-DATA_FD1B03
	dw DATA_FD1DCD-DATA_FD1B03
	dw DATA_FD1DEA-DATA_FD1B03
	dw DATA_FD1E15-DATA_FD1B03
	dw DATA_FD1E32-DATA_FD1B03
	dw DATA_FD1E4F-DATA_FD1B03
	dw DATA_FD1E6C-DATA_FD1B03
	dw DATA_FD290D-DATA_FD1B03
	dw DATA_FD292A-DATA_FD1B03
	dw DATA_FD1E89-DATA_FD1B03
	dw DATA_FD1BA9-DATA_FD1B03
	dw DATA_FD1BB1-DATA_FD1B03
	dw DATA_FD1EE5-DATA_FD1B03
	dw DATA_FD1B03-DATA_FD1B03
	dw DATA_FD1F09-DATA_FD1B03
	dw DATA_FD1D28-DATA_FD1B03
	dw DATA_FD1D4C-DATA_FD1B03
	dw DATA_FD1D70-DATA_FD1B03
	dw DATA_FD1DA9-DATA_FD1B03
	dw DATA_FD1F34-DATA_FD1B03
	dw DATA_FD1FCA-DATA_FD1B03
	dw DATA_FD2053-DATA_FD1B03
	dw DATA_FD210D-DATA_FD1B03
	dw DATA_FD21FB-DATA_FD1B03
	dw DATA_FD224D-DATA_FD1B03
	dw DATA_FD2278-DATA_FD1B03
	dw DATA_FD22DC-DATA_FD1B03
	dw DATA_FD2320-DATA_FD1B03
	dw DATA_FD2352-DATA_FD1B03
	dw DATA_FD24C0-DATA_FD1B03
	dw DATA_FD24E4-DATA_FD1B03
	dw DATA_FD2516-DATA_FD1B03
	dw DATA_FD2548-DATA_FD1B03
	dw DATA_FD256C-DATA_FD1B03
	dw DATA_FD2582-DATA_FD1B03
	dw DATA_FD265B-DATA_FD1B03
	dw DATA_FD26B4-DATA_FD1B03
	dw DATA_FD26E6-DATA_FD1B03
	dw DATA_FD2718-DATA_FD1B03
	dw DATA_FD2758-DATA_FD1B03
	dw DATA_FD276E-DATA_FD1B03
	dw DATA_FD2784-DATA_FD1B03
	dw DATA_FD279A-DATA_FD1B03
	dw DATA_FD27A9-DATA_FD1B03
	dw DATA_FD27B8-DATA_FD1B03
	dw DATA_FD27FF-DATA_FD1B03
	dw DATA_FD2823-DATA_FD1B03
	dw DATA_FD2839-DATA_FD1B03
	dw DATA_FD2841-DATA_FD1B03
	dw DATA_FD285E-DATA_FD1B03
	dw DATA_FD2866-DATA_FD1B03
	dw DATA_FD289F-DATA_FD1B03
	dw DATA_FD28AE-DATA_FD1B03
	dw DATA_FD28BD-DATA_FD1B03
	dw DATA_FD28BD-DATA_FD1B03
	dw DATA_FD28E1-DATA_FD1B03
	dw DATA_FD28FE-DATA_FD1B03

DATA_FD1B8B:
	db ((DATA_FFEE00>>16)&$3F)|$00 : dw DATA_FFEE00,$1C40,$0100
	db ((DATA_FFE380>>16)&$3F)|$00 : dw DATA_FFE380,$1CC0,$0280
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1E00,$0400
	db $00

DATA_FD1BA1:
	db ((DATA_FFDF80>>16)&$3F)|$00 : dw DATA_FFDF80,$1E00,$0400
	db $00

DATA_FD1BA9:
	db ((DATA_FFDB80>>16)&$3F)|$00 : dw DATA_FFDB80,$1E00,$0400
	db $00

DATA_FD1BB1:
	db ((DATA_FDE415>>16)&$3F)|$00 : dw DATA_FDE415,$1E00,$0400
	db $00

DATA_FD1BB9:
	db ((DATA_E08E80>>16)&$3F)|$00 : dw DATA_E08E80,$A000,$6EA0
	db ((DATA_F2587C>>16)&$3F)|$00 : dw DATA_F2587C,$F000,$319C
	db ((DATA_F275D5>>16)&$3F)|$40 : dw DATA_F275D5,$EC00,$0800
	db ((DATA_E8A874>>16)&$3F)|$00 : dw DATA_E8A874,$D750,$1160
	db $00

DATA_FD1BD6:
	db ((DATA_E15058>>16)&$3F)|$00 : dw DATA_E15058,$A000,$71C0
	db ((DATA_E9F346>>16)&$3F)|$00 : dw DATA_E9F346,$F400,$0800
	db ((DATA_E9F818>>16)&$3F)|$00 : dw DATA_E9F818,$5000,$0C70
	db $00

DATA_FD1BEC:
	db ((DATA_FFEF00>>16)&$3F)|$00 : dw DATA_FFEF00,$1C40,$00C0
	db ((DATA_E21914>>16)&$3F)|$00 : dw DATA_E21914,$A000,$6800
	db ((DATA_EA3387>>16)&$3F)|$00 : dw DATA_EA3387,$F000,$0EF0
	db ((DATA_EA426A>>16)&$3F)|$00 : dw DATA_EA426A,$E000,$1FC0
	db ((DATA_EA5B53>>16)&$3F)|$40 : dw DATA_EA5B53,$DC00,$0800
	db ((DATA_EA5F1C>>16)&$3F)|$00 : dw DATA_EA5F1C,$D400,$1000
	db $00

DATA_FD1C17:
	db ((DATA_E2D9E8>>16)&$3F)|$00 : dw DATA_E2D9E8,$A000,$7800
	db ((DATA_F2275C>>16)&$3F)|$00 : dw DATA_F2275C,$E000,$2000
	db ((DATA_F24170>>16)&$3F)|$00 : dw DATA_F24170,$FC00,$0800
	db ((DATA_F2470A>>16)&$3F)|$00 : dw DATA_F2470A,$F000,$1000
	db ((DATA_F25437>>16)&$3F)|$40 : dw DATA_F25437,$F800,$0800
	db ((DATA_EBC052>>16)&$3F)|$00 : dw DATA_EBC052,$2010,$0140
	db ((DATA_EBC052>>16)&$3F)|$00 : dw DATA_EBC052,$20B0,$0140
	db ((DATA_EBC052>>16)&$3F)|$00 : dw DATA_EBC052,$2150,$0080
	db $00

DATA_FD1C50:
	db ((DATA_E38D56>>16)&$3F)|$00 : dw DATA_E38D56,$A000,$71C0
	db ((DATA_E9B0BD>>16)&$3F)|$40 : dw DATA_E9B0BD,$F400,$0800
	db ((DATA_E9B6C0>>16)&$3F)|$00 : dw DATA_E9B6C0,$D8E0,$0C80
	db ((DATA_EC576C>>16)&$3F)|$00 : dw DATA_EC576C,$6000,$1F60
	db ((DATA_EC4F6C>>16)&$3F)|$00 : dw DATA_EC4F6C,$7000,$0800
	db $00

DATA_FD1C74:
	db ((DATA_E43549>>16)&$3F)|$00 : dw DATA_E43549,$A000,$71C0
	db ((DATA_DDFE8F>>16)&$3F)|$00 : dw DATA_DDFE8F,$DA50,$2280
	db ((DATA_DDF873>>16)&$3F)|$00 : dw DATA_DDF873,$F400,$0800
	db $00

DATA_FD1C8A:
	db ((DATA_E4D25F>>16)&$3F)|$00 : dw DATA_E4D25F,$A000,$71C0
	db ((DATA_E88388>>16)&$3F)|$40 : dw DATA_E88388,$F5C0,$0480
	db ((DATA_E88388>>16)&$3F)|$40 : dw DATA_E88388,$F1C0,$0480
	db ((DATA_E8861B>>16)&$3F)|$00 : dw DATA_E8861B,$D040,$1F80
	db ((DATA_E8A412>>16)&$3F)|$00 : dw DATA_E8A412,$EC00,$0680
	db ((DATA_E8A634>>16)&$3F)|$00 : dw DATA_E8A634,$6880,$0240
	db ((DATA_E8A874>>16)&$3F)|$00 : dw DATA_E8A874,$DF50,$1160
	db $00

DATA_FD1CBC:
	db ((DATA_F70000>>16)&$3F)|$00 : dw DATA_F70000,$D8A0,$2EC0
	db ((DATA_E5F598>>16)&$3F)|$00 : dw DATA_E5F598,$A000,$6E00
	db ((DATA_F6254B>>16)&$3F)|$00 : dw DATA_F6254B,$7400,$0700
	db $00

DATA_FD1CD2:
	db ((DATA_E54C41>>16)&$3F)|$00 : dw DATA_E54C41,$A000,$5960
	db ((DATA_E5968A>>16)&$3F)|$00 : dw DATA_E5968A,$D000,$3220
	db ((DATA_E591C9>>16)&$3F)|$40 : dw DATA_E591C9,$F000,$0740
	db ((DATA_E594A2>>16)&$3F)|$00 : dw DATA_E594A2,$F420,$0180
	db ((DATA_E59533>>16)&$3F)|$00 : dw DATA_E59533,$F6A0,$02C0
	db ((DATA_DCFF76>>16)&$3F)|$00 : dw DATA_DCFF76,$E910,$05E0
	db ((DATA_DCFECD>>16)&$3F)|$40 : dw DATA_DCFECD,$ECC0,$0180
	db $00

DATA_FD1D04:
	db ((DATA_E69DCF>>16)&$3F)|$00 : dw DATA_E69DCF,$A000,$6C00
	db ((DATA_E717A6>>16)&$3F)|$00 : dw DATA_E717A6,$D5F0,$2420
	db ((DATA_E6FCEA>>16)&$3F)|$00 : dw DATA_E6FCEA,$FC00,$0800
	db ((DATA_E703F1>>16)&$3F)|$00 : dw DATA_E703F1,$F000,$0EE0
	db ((DATA_E712B8>>16)&$3F)|$40 : dw DATA_E712B8,$F7A0,$08C0
	db $00

DATA_FD1D28:
	db ((DATA_E43549>>16)&$3F)|$00 : dw DATA_E43549,$A000,$71C0
	db ((DATA_E99AB2>>16)&$3F)|$40 : dw DATA_E99AB2,$F000,$0540
	db ((DATA_E99BFB>>16)&$3F)|$00 : dw DATA_E99BFB,$DF20,$21C0
	db ((DATA_E9B0BD>>16)&$3F)|$40 : dw DATA_E9B0BD,$F400,$0800
	db ((DATA_E9B6C0>>16)&$3F)|$00 : dw DATA_E9B6C0,$D8E0,$0C80
	db $00

DATA_FD1D4C:
	db ((DATA_E15058>>16)&$3F)|$00 : dw DATA_E15058,$A000,$71C0
	db ((DATA_E9BEAE>>16)&$3F)|$40 : dw DATA_E9BEAE,$F000,$0600
	db ((DATA_E9BFBC>>16)&$3F)|$00 : dw DATA_E9BFBC,$E000,$1BE0
	db ((DATA_E9F346>>16)&$3F)|$00 : dw DATA_E9F346,$F400,$0800
	db ((DATA_E9F818>>16)&$3F)|$00 : dw DATA_E9F818,$5000,$0C70
	db $00

DATA_FD1D70:
	db ((DATA_E8BDEC>>16)&$3F)|$00 : dw DATA_E8BDEC,$A000,$8000
	db ((DATA_E9E146>>16)&$3F)|$00 : dw DATA_E9E146,$6000,$1200
	db ((DATA_EC475C>>16)&$3F)|$00 : dw DATA_EC475C,$6BB0,$08A0
	db ((DATA_EC451C>>16)&$3F)|$00 : dw DATA_EC451C,$7D00,$0240
	db ((DATA_E8B5AE>>16)&$3F)|$40 : dw DATA_E8B5AE,$F000,$0800
	db ((DATA_E8B989>>16)&$3F)|$40 : dw DATA_E8B989,$F400,$0800
	db ((DATA_E9DD86>>16)&$3F)|$00 : dw DATA_E9DD86,$7800,$03E0
	db ((DATA_F45CC0>>16)&$3F)|$00 : dw DATA_F45CC0,$7E40,$0280
	db $00

DATA_FD1DA9:
	db ((DATA_E38D56>>16)&$3F)|$00 : dw DATA_E38D56,$A000,$71C0
	db ((DATA_E9B0BD>>16)&$3F)|$40 : dw DATA_E9B0BD,$EC00,$0800
	db ((DATA_E9B6C0>>16)&$3F)|$00 : dw DATA_E9B6C0,$D8E0,$0C80
	db ((DATA_E9E146>>16)&$3F)|$00 : dw DATA_E9E146,$6000,$1200
	db ((DATA_E9DD86>>16)&$3F)|$00 : dw DATA_E9DD86,$7000,$03E0
	db $00

DATA_FD1DCD:
	db ((DATA_E7588E>>16)&$3F)|$00 : dw DATA_E7588E,$A000,$7C00
	db ((DATA_EA68F2>>16)&$3F)|$00 : dw DATA_EA68F2,$E000,$1D20
	db ((DATA_EA6712>>16)&$3F)|$00 : dw DATA_EA6712,$DEC0,$0280
	db ((DATA_EA68CB>>16)&$3F)|$40 : dw DATA_EA68CB,$F000,$00C0
	db $00

DATA_FD1DEA:
	db ((DATA_E7F2F2>>16)&$3F)|$00 : dw DATA_E7F2F2,$A000,$71C0
	db ((DATA_EA160B>>16)&$3F)|$00 : dw DATA_EA160B,$4F00,$1900
	db ((DATA_EA0C0C>>16)&$3F)|$40 : dw DATA_EA0C0C,$F800,$0800
	db ((DATA_EA0C0C>>16)&$3F)|$40 : dw DATA_EA0C0C,$FC00,$0800
	db ((DATA_EA1349>>16)&$3F)|$00 : dw DATA_EA1349,$FD00,$0300
	db ((DATA_EA21AB>>16)&$3F)|$00 : dw DATA_EA21AB,$DA90,$1AE0
	db $00

DATA_FD1E15:
	db ((DATA_E43549>>16)&$3F)|$00 : dw DATA_E43549,$A000,$71C0
	db ((DATA_DDFE8F>>16)&$3F)|$00 : dw DATA_DDFE8F,$DA50,$2280
	db ((DATA_DF04D4>>16)&$3F)|$00 : dw DATA_DF04D4,$6B90,$08D0
	db ((DATA_DDF873>>16)&$3F)|$00 : dw DATA_DDF873,$F400,$0800
	db $00

DATA_FD1E32:
	db ((DATA_DFFE80>>16)&$3F)|$40 : dw DATA_DFFE80,$EC00,$0700
	db ((DATA_CBFE6D>>16)&$3F)|$00 : dw DATA_CBFE6D,$A000,$5C00
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$0000,$0CA0
	db ((DATA_ECA5A9>>16)&$3F)|$00 : dw DATA_ECA5A9,$F120,$0300
	db $00

DATA_FD1E4F:
	db ((DATA_DFFE80>>16)&$3F)|$40 : dw DATA_DFFE80,$EC00,$0700
	db ((DATA_CBFE6D>>16)&$3F)|$00 : dw DATA_CBFE6D,$A000,$5C00
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$0000,$0CA0
	db ((DATA_ECA690>>16)&$3F)|$00 : dw DATA_ECA690,$F100,$0380
	db $00

DATA_FD1E6C:
	db ((DATA_DFFE80>>16)&$3F)|$40 : dw DATA_DFFE80,$EC00,$0700
	db ((DATA_CBFE6D>>16)&$3F)|$00 : dw DATA_CBFE6D,$A000,$5C00
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$0000,$0CA0
	db ((DATA_ECA7A7>>16)&$3F)|$00 : dw DATA_ECA7A7,$F100,$0380
	db $00

DATA_FD1E89:
	db ((DATA_EBDC2A>>16)&$3F)|$00 : dw DATA_EBDC2A,$A000,$73E0
	db ((DATA_EBD1D2>>16)&$3F)|$00 : dw DATA_EBD1D2,$D9E8,$0C30
	db ((DATA_F45F40>>16)&$3F)|$00 : dw DATA_F45F40,$6000,$1800
	db ((DATA_EC7D0C>>16)&$3F)|$00 : dw DATA_EC7D0C,$6C00,$0040
	db ((DATA_EC3EB2>>16)&$3F)|$00 : dw DATA_EC3EB2,$F000,$0800
	db ((DATA_EC3825>>16)&$3F)|$00 : dw DATA_EC3825,$F400,$0800
	db ((DATA_EC7CCC>>16)&$3F)|$00 : dw DATA_EC7CCC,$6C20,$0040
	db ((DATA_F45CC0>>16)&$3F)|$00 : dw DATA_F45CC0,$6D60,$01C0
	db ((DATA_F45CC0>>16)&$3F)|$00 : dw DATA_F45CC0,$6E20,$01C0
	db ((DATA_EBD052>>16)&$3F)|$00 : dw DATA_EBD052,$7AE0,$00C0
	db (((DATA_EBD052+$C0)>>16)&$3F)|$00 : dw DATA_EBD052+$C0,$7EE0,$00C0
	db ((DATA_EBCD52>>16)&$3F)|$00 : dw DATA_EBCD52,$78C0,$0300
	db ((DATA_EBCA52>>16)&$3F)|$00 : dw DATA_EBCA52,$7CC0,$0300
	db $00

DATA_FD1EE5:
	db ((DATA_C8FE75>>16)&$3F)|$00 : dw DATA_C8FE75,$A000,$3980
	db ((DATA_CA0000>>16)&$3F)|$00 : dw DATA_CA0000,$C000,$01A0
	db ((DATA_E8640C>>16)&$3F)|$40 : dw DATA_E8640C,$F800,$0780
	db ((DATA_E866E0>>16)&$3F)|$40 : dw DATA_E866E0,$FC00,$0780
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$6000,$0640
	db $00

DATA_FD1F09:
	db ((DATA_E69DCF>>16)&$3F)|$00 : dw DATA_E69DCF,$A000,$6C00
	db ((DATA_E98D12>>16)&$3F)|$00 : dw DATA_E98D12,$55F0,$0DA0
	db ((DATA_E98550>>16)&$3F)|$00 : dw DATA_E98550,$650E,$008A
	db (((DATA_E98550+$8A)>>16)&$3F)|$00 : dw DATA_E98550+$8A,$656C,$01CE
	db ((DATA_E6FCEA>>16)&$3F)|$00 : dw DATA_E6FCEA,$FC00,$0800
	db ((DATA_E703F1>>16)&$3F)|$00 : dw DATA_E703F1,$F000,$0EE0
	db $00

DATA_FD1F34:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_FFEA00>>16)&$3F)|$00 : dw DATA_FFEA00,$1E00,$0400
	db ((DATA_FD1F4A>>16)&$3F)|$00 : dw DATA_FD1F4A,$6000,$0080
	db $00

DATA_FD1F4A:					; Note: Uncompressed graphics (Perhaps a border for something?)
	incbin "data/unknown_or_unused/tiles/unknown_tiles_FD1F4A.bin"

DATA_FD1FCA:
	db ((DATA_E87AA3>>16)&$3F)|$40 : dw DATA_E87AA3,$FC00,$0700
	db ((DATA_CDFED2>>16)&$3F)|$00 : dw DATA_CDFED2,$A000,$4E20
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_FC0000>>16)&$3F)|$00 : dw DATA_FC0000,$5000,$0F00
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$6000,$0650
	db ((DATA_FD2023>>16)&$3F)|$00 : dw DATA_FD2023,$6E68,$0010
	db ((DATA_FD2033>>16)&$3F)|$00 : dw DATA_FD2033,$6E70,$0020
	db ((DATA_FC0F00>>16)&$3F)|$00 : dw DATA_FC0F00,$6E80,$0300
	db $00


	db $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00

	padbyte $FF : pad $FD2023

DATA_FD2023:
	incbin "data/screens/tiledata/funky_rentals_layer3_menu_mask_tiledata.bin"

DATA_FD2033:
	incbin "data/screens/tiledata/funky_rentals_layer1_menu_mask_tiledata.bin"

DATA_FD2053:
	db ((DATA_FFE380>>16)&$3F)|$00 : dw DATA_FFE380,$1CC0,$0280
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1A00,$0400
	db (((DATA_FC2A40+$60)>>16)&$3F)|$00 : dw DATA_FC2A40+$60,$1EA0,$0020
	db (((DATA_FC2A40+$40)>>16)&$3F)|$00 : dw DATA_FC2A40+$40,$1EB0,$0020
	db ((DATA_FC2A40>>16)&$3F)|$00 : dw DATA_FC2A40,$1EC0,$0040
	db ((DATA_FD20BD>>16)&$3F)|$00 : dw DATA_FD20BD,$1EE0,$0020
	db ((DATA_FD20BD>>16)&$3F)|$00 : dw DATA_FD20BD,$1EF0,$0020
	db ((DATA_FD20BD>>16)&$3F)|$00 : dw DATA_FD20BD,$1FE0,$0020
	db ((DATA_FD20BD>>16)&$3F)|$00 : dw DATA_FD20BD,$1FF0,$0020
	db ((DATA_E87D26>>16)&$3F)|$40 : dw DATA_E87D26,$EC00,$0700
	db ((DATA_CEFD21>>16)&$3F)|$00 : dw DATA_CEFD21,$A000,$5240
	db ((DATA_FC0000>>16)&$3F)|$00 : dw DATA_FC0000,$5000,$0F00
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$6000,$0650
	db ((DATA_FD20DD>>16)&$3F)|$00 : dw DATA_FD20DD,$6BF8,$0010
	db ((DATA_FD20ED>>16)&$3F)|$00 : dw DATA_FD20ED,$5BE0,$0020
	db $00

DATA_FD20BD:
	incbin "data/screens/tiledata/swanky_sideshow_layer1_menu_mask_tiledata.bin"

DATA_FD20DD:
	incbin "data/screens/tiledata/swanky_sideshow_layer3_menu_mask_tiledata.bin"

DATA_FD20ED:
	incbin "data/screens/tiledata/swanky_sideshow_text_bg_tiledata.bin"

DATA_FD210D:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_FC1B40>>16)&$3F)|$00 : dw DATA_FC1B40,$0640,$0160
	db ((DATA_FD217B>>16)&$3F)|$00 : dw DATA_FD217B,$06F0,$0020
	db (((DATA_FD217B+$20)>>16)&$3F)|$00 : dw DATA_FD217B+$20,$0700,$0020
	db (((DATA_FD217B+$40)>>16)&$3F)|$00 : dw DATA_FD217B+$40,$0710,$0020
	db ((DATA_FD215B>>16)&$3F)|$00 : dw DATA_FD215B,$1FF0,$0020
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$6000,$06A0
	db ((DATA_EA0488>>16)&$3F)|$40 : dw DATA_EA0488,$F800,$0700
	db ((DATA_D3FE2A>>16)&$3F)|$00 : dw DATA_D3FE2A,$A000,$32A0
	db ((DATA_EA0730>>16)&$3F)|$40 : dw DATA_EA0730,$F400,$0140
	db ((DATA_EA077B>>16)&$3F)|$00 : dw DATA_EA077B,$D000,$0820
	db $00

DATA_FD215B:
	incbin "data/screens/objects/NameEntryBackground.bin"

DATA_FD217B:
	incbin "data/screens/objects/FileSelectNumbers.bin"


;bear house payload
DATA_FD21FB:
	db ((DATA_FC1B40>>16)&$3F)|$00 : dw DATA_FC1B40,$0200,$03E0 	
	db ((DATA_FFE380>>16)&$3F)|$00 : dw DATA_FFE380,$1CC0,$0280 	;hud font
	db ((DATA_FD222D>>16)&$3F)|$00 : dw DATA_FD222D,$1FF0,$0020
	db ((DATA_FB0000>>16)&$3F)|$00 : dw DATA_FB0000,$A000,$7FE0     
	db ((DATA_FB6897>>16)&$3F)|$00 : dw DATA_FB6897,$E800,$14A0  	;font related
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$6000,$0650 	;text
	db ((DATA_E9305A>>16)&$3F)|$40 : dw DATA_E9305A,$F400,$0740
	db $00

DATA_FD222D:
	incbin "data/screens/objects/DialogueSelectionArrow.bin"

DATA_FD224D:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_E867D8>>16)&$3F)|$40 : dw DATA_E867D8,$EC00,$0700
	db ((DATA_C6FEFE>>16)&$3F)|$00 : dw DATA_C6FEFE,$A000,$51C0
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F400,$0800
	db ((DATA_F35E23>>16)&$3F)|$00 : dw DATA_F35E23,$7920,$0200
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db $00


;main map payload
DATA_FD2278:
	db ((DATA_FC21A0>>16)&$3F)|$00 : dw DATA_FC21A0,$0000,$0120
	db ((DATA_FC22C0>>16)&$3F)|$00 : dw DATA_FC22C0,$0090,$0480
	db ((DATA_FC22C0>>16)&$3F)|$00 : dw DATA_FC22C0,$02D0,$0480
	db ((DATA_FC2740>>16)&$3F)|$00 : dw DATA_FC2740,$0510,$0300
	db ((DATA_FD229C>>16)&$3F)|$00 : dw DATA_FD229C,$0690,$0040
	db $00

DATA_FD229C:					; Note: Uncompressed graphics (It's loaded on the main map)
	incbin "data/unknown_or_unused/tiles/unknown_tiles_FD229C.bin"

DATA_FD22DC:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_E877CC>>16)&$3F)|$40 : dw DATA_E877CC,$FC00,$0700
	db ((DATA_C7FD8A>>16)&$3F)|$00 : dw DATA_C7FD8A,$A000,$5720
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$6000,$0650
	db ((DATA_FD2300>>16)&$3F)|$00 : dw DATA_FD2300,$5900,$0020
	db $00

DATA_FD2300:
	incbin "data/screens/tiledata/wrinkly_save_cave_text_bg_tiledata.bin"

DATA_FD2320:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_D1FF7D>>16)&$3F)|$00 : dw DATA_D1FF7D,$F000,$0690
	db ((DATA_E8734F>>16)&$3F)|$00 : dw DATA_E8734F,$EC00,$0700
	db ((DATA_CAFDB5>>16)&$3F)|$00 : dw DATA_CAFDB5,$A000,$57C0
	db ((DATA_E86B7F>>16)&$3F)|$40 : dw DATA_E86B7F,$FC00,$0800
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F800,$0800
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db $00

DATA_FD2352:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_FD24A0>>16)&$3F)|$00 : dw DATA_FD24A0,$1E50,$0020
	db ((DATA_FD23A0>>16)&$3F)|$00 : dw DATA_FD23A0,$1EE0,$0040
	db (((DATA_FD23A0+$40)>>16)&$3F)|$00 : dw DATA_FD23A0+$40,$1FE0,$0040
	db (((DATA_FD23A0+$80)>>16)&$3F)|$00 : dw DATA_FD23A0+$80,$1EC0,$0040
	db (((DATA_FD23A0+$C0)>>16)&$3F)|$00 : dw DATA_FD23A0+$C0,$1FC0,$0040
	db ((DATA_EB069C>>16)&$3F)|$00 : dw DATA_EB069C,$1E60,$00C0
	db (((DATA_EB069C+$C0)>>16)&$3F)|$00 : dw DATA_EB069C+$C0,$1F60,$00C0
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$86B0,$08E0
	db ((DATA_F21DA4>>16)&$3F)|$00 : dw DATA_F21DA4,$E000,$1540
	db ((DATA_F50000>>16)&$3F)|$00 : dw DATA_F50000,$A000,$7FC0
	db $00

DATA_FD23A0:
	incbin "data/world_maps/objects/GyrocopterShadow.bin"

DATA_FD24A0:
	incbin "data/world_maps/objects/CollectableFlower.bin"

DATA_FD24C0:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_DFFE80>>16)&$3F)|$40 : dw DATA_DFFE80,$FC00,$0700
	db ((DATA_CBFE6D>>16)&$3F)|$00 : dw DATA_CBFE6D,$A000,$52E0
	db ((DATA_E92913>>16)&$3F)|$00 : dw DATA_E92913,$7800,$0700
	db ((DATA_E93013>>16)&$3F)|$00 : dw DATA_E93013,$E000,$0200
	db $00

DATA_FD24E4:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_E86F2B>>16)&$3F)|$40 : dw DATA_E86F2B,$EC00,$0700
	db ((DATA_CFFF7E>>16)&$3F)|$00 : dw DATA_CFFF7E,$A000,$5760
	db ((DATA_E871D7>>16)&$3F)|$40 : dw DATA_E871D7,$F000,$0700
	db ((DATA_D0FE01>>16)&$3F)|$00 : dw DATA_D0FE01,$E000,$06B0
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F400,$0800
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db $00

DATA_FD2516:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_D2FF14>>16)&$3F)|$00 : dw DATA_D2FF14,$A000,$2FA0
	db ((DATA_FC0000>>16)&$3F)|$00 : dw DATA_FC0000,$5000,$0F00
	db ((DATA_EA0B39>>16)&$3F)|$00 : dw DATA_EA0B39,$E000,$01A0
	db ((DATA_EA0A88>>16)&$3F)|$00 : dw DATA_EA0A88,$ECC0,$0240
	db ((DATA_EA0A88>>16)&$3F)|$00 : dw DATA_EA0A88,$EE40,$0240
	db ((DATA_E88052>>16)&$3F)|$40 : dw DATA_E88052,$FC00,$0700
	db $00

DATA_FD2548:
	db ((DATA_FFE380>>16)&$3F)|$00 : dw DATA_FFE380,$1CC0,$0280
	db ((DATA_F82E96>>16)&$3F)|$00 : dw DATA_F82E96,$A000,$5D60
	db ((DATA_EA9AD9>>16)&$3F)|$40 : dw DATA_EA9AD9,$FC00,$0700
	db ((DATA_EB0486>>16)&$3F)|$40 : dw DATA_EB0486,$F800,$0140
	db ((DATA_EB04B0>>16)&$3F)|$00 : dw DATA_EB04B0,$D000,$01E0
	db $00

DATA_FD256C:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_EA9DCC>>16)&$3F)|$00 : dw DATA_EA9DCC,$A000,$0DA0
	db ((DATA_EA9CD8>>16)&$3F)|$40 : dw DATA_EA9CD8,$FC00,$0700
	db $00

DATA_FD2582:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_F666BB>>16)&$3F)|$40 : dw DATA_F666BB,$F000,$0700
	db ((DATA_F6688A>>16)&$3F)|$00 : dw DATA_F6688A,$E000,$0B60
	db ((DATA_EAFEAB>>16)&$3F)|$40 : dw DATA_EAFEAB,$EC00,$0700
	db ((DATA_C4F05F>>16)&$3F)|$00 : dw DATA_C4F05F,$A000,$4D80
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F400,$0700
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db ((DATA_FD25BB>>16)&$3F)|$00 : dw DATA_FD25BB,$1F90,$00A0
	db $00

DATA_FD25BB:
	incbin "data/world_maps/objects/CottenTopCoveRockBarrier.bin"

DATA_FD265B:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_F66EE1>>16)&$3F)|$00 : dw DATA_F66EE1,$F000,$0700
	db ((DATA_F67029>>16)&$3F)|$00 : dw DATA_F67029,$E000,$04D0
	db ((DATA_EA93BD>>16)&$3F)|$40 : dw DATA_EA93BD,$EC00,$0700
	db ((DATA_D4FFD7>>16)&$3F)|$00 : dw DATA_D4FFD7,$A000,$5B80
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F400,$0700
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db ((DATA_FD2694>>16)&$3F)|$00 : dw DATA_FD2694,$5470,$0020
	db $00

DATA_FD2694:
	incbin "data/world_maps/tiledata/sky_high_secret_rope_tiledata.bin"

DATA_FD26B4:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_F672D8>>16)&$3F)|$40 : dw DATA_F672D8,$F000,$0700
	db ((DATA_F673D5>>16)&$3F)|$00 : dw DATA_F673D5,$E000,$0490
	db ((DATA_F72353>>16)&$3F)|$40 : dw DATA_F72353,$EC00,$0700
	db ((DATA_F7266A>>16)&$3F)|$00 : dw DATA_F7266A,$A000,$5860
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F400,$0800
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db $00

DATA_FD26E6:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_EB017D>>16)&$3F)|$40 : dw DATA_EB017D,$EC00,$0700
	db ((DATA_C1FC3C>>16)&$3F)|$00 : dw DATA_C1FC3C,$A000,$4E80
	db ((DATA_F676E3>>16)&$3F)|$40 : dw DATA_F676E3,$F000,$0700
	db ((DATA_F67816>>16)&$3F)|$00 : dw DATA_F67816,$E000,$0400
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F400,$0800
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db $00

DATA_FD2718:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_EB069C>>16)&$3F)|$00 : dw DATA_EB069C,$1EA0,$00C0
	db (((DATA_EB069C+$C0)>>16)&$3F)|$00 : dw DATA_EB069C+$C0,$1FA0,$00C0
	db ((DATA_F67A94>>16)&$3F)|$00 : dw DATA_F67A94,$F000,$0700
	db ((DATA_F67B9A>>16)&$3F)|$00 : dw DATA_F67B9A,$E000,$0310
	db ((DATA_EA9638>>16)&$3F)|$40 : dw DATA_EA9638,$EC00,$0700
	db ((DATA_DBFE0E>>16)&$3F)|$00 : dw DATA_DBFE0E,$A000,$5440
	db ((DATA_EB081C>>16)&$3F)|$00 : dw DATA_EB081C,$F400,$0700
	db ((DATA_EB0B39>>16)&$3F)|$00 : dw DATA_EB0B39,$D000,$08E0
	db $00

DATA_FD2758:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_EAA8DC>>16)&$3F)|$00 : dw DATA_EAA8DC,$A000,$0DA0
	db ((DATA_EAA818>>16)&$3F)|$40 : dw DATA_EAA818,$FC00,$0700
	db $00

DATA_FD276E:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_EAB4DE>>16)&$3F)|$00 : dw DATA_EAB4DE,$A000,$0F80
	db ((DATA_EAB3E9>>16)&$3F)|$40 : dw DATA_EAB3E9,$FC00,$0700
	db $00

DATA_FD2784:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_EA8675>>16)&$3F)|$00 : dw DATA_EA8675,$A000,$1120
	db ((DATA_EA858A>>16)&$3F)|$40 : dw DATA_EA858A,$FC00,$0700
	db $00

DATA_FD279A:
	db ((DATA_EAC294>>16)&$3F)|$00 : dw DATA_EAC294,$B000,$5120
	db ((DATA_EAC190>>16)&$3F)|$40 : dw DATA_EAC190,$F800,$0700
	db $00

DATA_FD27A9:
	db ((DATA_E9342E>>16)&$3F)|$00 : dw DATA_E9342E,$D780,$1760
	db ((DATA_E9339E>>16)&$3F)|$40 : dw DATA_E9339E,$F440,$0300
	db $00

DATA_FD27B8:
	db ((DATA_FC14A0>>16)&$3F)|$00 : dw DATA_FC14A0,$6000,$0650
	db ((DATA_F47B15>>16)&$3F)|$00 : dw DATA_F47B15,$EC30,$0780
	db ((DATA_EBB852>>16)&$3F)|$00 : dw DATA_EBB852,$0000,$0800
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_EB069C>>16)&$3F)|$00 : dw DATA_EB069C,$1EA0,$00C0
	db (((DATA_EB069C+$C0)>>16)&$3F)|$00 : dw DATA_EB069C+$C0,$1FA0,$00C0
	db ((DATA_F31B38>>16)&$3F)|$40 : dw DATA_F31B38,$F400,$0700
	db ((DATA_F31DED>>16)&$3F)|$00 : dw DATA_F31DED,$A000,$3F80
	db ((DATA_EB81FF>>16)&$3F)|$40 : dw DATA_EB81FF,$F800,$0840
	db ((DATA_EB8538>>16)&$3F)|$00 : dw DATA_EB8538,$C000,$3C60
	db $00

DATA_FD27FF:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_F3480A>>16)&$3F)|$40 : dw DATA_F3480A,$EC00,$0700
	db ((DATA_F34FAD>>16)&$3F)|$00 : dw DATA_F34FAD,$A000,$10E0
	db ((DATA_E9339E>>16)&$3F)|$40 : dw DATA_E9339E,$F0C0,$0300
	db ((DATA_E9342E>>16)&$3F)|$00 : dw DATA_E9342E,$E000,$1760
	db $00

DATA_FD2823:
	db ((DATA_FFE600>>16)&$3F)|$00 : dw DATA_FFE600,$1C00,$0400
	db ((DATA_F34C21>>16)&$3F)|$00 : dw DATA_F34C21,$EC00,$0700
	db ((DATA_F34FAD>>16)&$3F)|$00 : dw DATA_F34FAD,$A000,$10E0
	db $00

DATA_FD2839:
	db ((DATA_F80000>>16)&$3F)|$00 : dw DATA_F80000,$A000,$34A0
	db $00

DATA_FD2841:
	db ((DATA_C8FE75>>16)&$3F)|$00 : dw DATA_C8FE75,$A000,$3980
	db ((DATA_E8640C>>16)&$3F)|$40 : dw DATA_E8640C,$E000,$0380
	db ((DATA_CA0000>>16)&$3F)|$00 : dw DATA_CA0000,$C000,$01A0
	db ((DATA_E866E0>>16)&$3F)|$40 : dw DATA_E866E0,$E400,$03C0
	db $00

DATA_FD285E:
	db ((DATA_EB1BC4>>16)&$3F)|$00 : dw DATA_EB1BC4,$A000,$7B80
	db $00

DATA_FD2866:
	db ((DATA_EBAABA>>16)&$3F)|$40 : dw DATA_EBAABA,$F900,$0700
	db ((DATA_EBAB57>>16)&$3F)|$00 : dw DATA_EBAB57,$A000,$1000
	db ((DATA_E5968A>>16)&$3F)|$00 : dw DATA_E5968A,$D000,$3220
	db ((DATA_E591C9>>16)&$3F)|$40 : dw DATA_E591C9,$F000,$0740
	db ((DATA_E594A2>>16)&$3F)|$00 : dw DATA_E594A2,$F420,$0180
	db ((DATA_E59533>>16)&$3F)|$00 : dw DATA_E59533,$F6A0,$02C0
	db ((DATA_DCFF76>>16)&$3F)|$00 : dw DATA_DCFF76,$E910,$05E0
	db ((DATA_DCFECD>>16)&$3F)|$40 : dw DATA_DCFECD,$ECC0,$0180
	db $00

DATA_FD289F:
	db ((DATA_EC7D4C>>16)&$3F)|$40 : dw DATA_EC7D4C,$FC00,$0700
	db ((DATA_EC7E00>>16)&$3F)|$00 : dw DATA_EC7E00,$A000,$0D20
	db $00

DATA_FD28AE:
	db ((DATA_EC9B78>>16)&$3F)|$40 : dw DATA_EC9B78,$FC00,$0700
	db ((DATA_EC9C32>>16)&$3F)|$00 : dw DATA_EC9C32,$A000,$0C20
	db $00

DATA_FD28BD:
	db ((DATA_F30200>>16)&$3F)|$00 : dw DATA_F30200,$A000,$4000
	db ((DATA_F30000>>16)&$3F)|$40 : dw DATA_F30000,$F800,$0600
	db ((DATA_F316F0>>16)&$3F)|$00 : dw DATA_F316F0,$F000,$0800
	db ((DATA_F60B11>>16)&$3F)|$00 : dw DATA_F60B11,$C000,$5C00
	db ((DATA_F621E6>>16)&$3F)|$40 : dw DATA_F621E6,$FC00,$0800
	db $00

DATA_FD28E1:
	db ((DATA_CCFE3D>>16)&$3F)|$00 : dw DATA_CCFE3D,$A000,$4FE0
	db ((DATA_E87581>>16)&$3F)|$40 : dw DATA_E87581,$FC00,$0800
	db ((DATA_E9342E>>16)&$3F)|$00 : dw DATA_E9342E,$D000,$1760
	db ((DATA_E9339E>>16)&$3F)|$40 : dw DATA_E9339E,$F400,$0300
	db $00

DATA_FD28FE:
	db ((DATA_E98030>>16)&$3F)|$00 : dw DATA_E98030,$0000,$0520
	db ((DATA_E97FB0>>16)&$3F)|$00 : dw DATA_E97FB0,$21A0,$0080
	db $00

DATA_FD290D:
	db ((DATA_E945BC>>16)&$3F)|$40 : dw DATA_E945BC,$FC00,$0700
	db ((DATA_E94782>>16)&$3F)|$40 : dw DATA_E94782,$F4E0,$0200
	db ((DATA_E9481D>>16)&$3F)|$00 : dw DATA_E9481D,$A000,$50A0
	db ((DATA_F70000>>16)&$3F)|$00 : dw DATA_F70000,$C8A0,$2EC0
	db $00

DATA_FD292A:
	db ((DATA_E15058>>16)&$3F)|$00 : dw DATA_E15058,$A000,$71C0
	db ((DATA_E9F346>>16)&$3F)|$00 : dw DATA_E9F346,$F400,$0800
	db ((DATA_E9F818>>16)&$3F)|$00 : dw DATA_E9F818,$5000,$0C70
	db ((DATA_EB13B3>>16)&$3F)|$40 : dw DATA_EB13B3,$F000,$0600
	db ((DATA_EB14E2>>16)&$3F)|$00 : dw DATA_EB14E2,$E000,$1020
	db $00

DATA_FD294E:
	dw $0000
	dw DATA_FD29C0-DATA_FD294E
	dw DATA_FD29E6-DATA_FD294E
	dw DATA_FD2A0C-DATA_FD294E
	dw DATA_FD2A32-DATA_FD294E
	dw DATA_FD2A52-DATA_FD294E
	dw DATA_FD2A78-DATA_FD294E
	dw DATA_FD2A9E-DATA_FD294E
	dw DATA_FD294E-DATA_FD294E
	dw DATA_FD2AC0-DATA_FD294E
	dw DATA_FD2AED-DATA_FD294E
	dw DATA_FD2B1A-DATA_FD294E
	dw DATA_FD2B4D-DATA_FD294E
	dw DATA_FD2B7D-DATA_FD294E
	dw DATA_FD2BA3-DATA_FD294E
	dw DATA_FD2BCF-DATA_FD294E
	dw DATA_FD2BCF-DATA_FD294E
	dw DATA_FD2BCF-DATA_FD294E
	dw DATA_FD3181-DATA_FD294E
	dw DATA_FD319D-DATA_FD294E
	dw DATA_FD31D5-DATA_FD294E
	dw DATA_FD2BF7-DATA_FD294E
	dw DATA_FD2C24-DATA_FD294E
	dw DATA_FD2C51-DATA_FD294E
	dw DATA_FD2C89-DATA_FD294E
	dw DATA_FD2CB5-DATA_FD294E
	dw DATA_FD2CDE-DATA_FD294E
	dw DATA_FD2D10-DATA_FD294E
	dw DATA_FD2D3C-DATA_FD294E
	dw DATA_FD2D66-DATA_FD294E
	dw DATA_FD2D91-DATA_FD294E
	dw DATA_FD2DBF-DATA_FD294E
	dw DATA_FD2DDE-DATA_FD294E
	dw DATA_FD2E0E-DATA_FD294E
	dw DATA_FD2E37-DATA_FD294E
	dw DATA_FD2E67-DATA_FD294E
	dw DATA_FD2E91-DATA_FD294E
	dw DATA_FD2EB8-DATA_FD294E
	dw DATA_FD2EE2-DATA_FD294E
	dw DATA_FD2F04-DATA_FD294E
	dw DATA_FD2F2D-DATA_FD294E
	dw DATA_FD2F55-DATA_FD294E
	dw DATA_FD2F79-DATA_FD294E
	dw DATA_FD2F94-DATA_FD294E
	dw DATA_FD2FBD-DATA_FD294E
	dw DATA_FD2FE6-DATA_FD294E
	dw DATA_FD300F-DATA_FD294E
	dw DATA_FD3038-DATA_FD294E
	dw DATA_FD3067-DATA_FD294E
	dw DATA_FD308A-DATA_FD294E
	dw DATA_FD30AD-DATA_FD294E
	dw DATA_FD30CD-DATA_FD294E
	dw DATA_FD30F1-DATA_FD294E
	dw DATA_FD310B-DATA_FD294E
	dw DATA_FD3123-DATA_FD294E
	dw DATA_FD314C-DATA_FD294E
	dw DATA_FD3167-DATA_FD294E

DATA_FD29C0:
	db $05,$21,$09,$07,$A1,$61,$6C,$09,$21,$68,$0B,$A1,$72,$05,$01,$21
	db $00,$2C,$A1,$13,$00,$30,$21,$00,$31,$21,$82,$33,$21,$00,$32,$21
	db $E1,$15,$21,$80,$00,$00

DATA_FD29E6:
	db $05,$21,$01,$07,$A1,$70,$79,$09,$21,$74,$0B,$A1,$26,$05,$01,$21
	db $00,$2C,$A1,$00,$16,$30,$21,$02,$31,$21,$20,$33,$21,$00,$32,$21
	db $86,$15,$21,$80,$00,$00

DATA_FD2A0C:
	db $05,$21,$09,$07,$A1,$79,$56,$09,$21,$5C,$0B,$A1,$62,$07,$01,$21
	db $00,$2C,$A1,$15,$02,$30,$21,$02,$31,$21,$20,$33,$21,$00,$32,$21
	db $00,$15,$21,$80,$00,$00

DATA_FD2A32:
	db $05,$21,$09,$07,$A1,$59,$7C,$09,$21,$78,$0B,$A1,$62,$07,$01,$21
	db $00,$2C,$A1,$17,$00,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2A52:
	db $05,$21,$09,$07,$A1,$79,$70,$09,$21,$74,$0B,$A1,$62,$05,$01,$21
	db $00,$2C,$A1,$15,$02,$30,$21,$02,$31,$21,$20,$33,$21,$00,$32,$21
	db $00,$15,$21,$80,$00,$00

DATA_FD2A78:
	db $05,$21,$09,$07,$A1,$79,$74,$09,$21,$5C,$0B,$A1,$52,$06,$01,$21
	db $00,$2C,$A1,$13,$00,$30,$21,$00,$31,$21,$00,$33,$21,$00,$32,$21
	db $00,$15,$21,$80,$00,$00

DATA_FD2A9E:
	db $05,$21,$09,$07,$A1,$79,$71,$09,$21,$6A,$2E,$21,$04,$24,$21,$03
	db $0B,$A1,$22,$05,$01,$21,$00,$30,$21,$02,$31,$21,$64,$15,$21,$80
	db $00,$00

DATA_FD2AC0:
	db $05,$21,$09,$07,$A1,$74,$79,$09,$21,$70,$0B,$A1,$25,$02,$01,$21
	db $00,$2C,$A1,$13,$06,$2E,$A1,$00,$04,$24,$21,$0A,$30,$21,$02,$31
	db $21,$21,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2AED:
	db $05,$21,$01,$07,$A1,$72,$79,$09,$21,$6C,$0B,$A1,$25,$06,$01,$21
	db $00,$2C,$A1,$15,$02,$2E,$A1,$00,$00,$25,$21,$30,$30,$21,$02,$31
	db $21,$25,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2B1A:
	db $05,$21,$01,$07,$A1,$69,$78,$09,$21,$7C,$0B,$A1,$52,$07,$01,$21
	db $00,$2C,$A1,$17,$00,$2E,$21,$06,$25,$21,$A0,$23,$A1,$A0,$0A,$30
	db $21,$20,$31,$21,$22,$33,$21,$00,$32,$21,$44,$32,$21,$24,$15,$21
	db $80,$00,$00

DATA_FD2B4D:
	db $05,$21,$09,$07,$A1,$79,$74,$09,$21,$70,$0B,$A1,$62,$05,$01,$21
	db $00,$2C,$A1,$11,$00,$2E,$A1,$04,$04,$24,$21,$0A,$2A,$21,$30,$30
	db $21,$00,$31,$21,$00,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2B7D:
	db $05,$21,$09,$07,$A1,$69,$71,$09,$21,$78,$0B,$A1,$52,$04,$01,$21
	db $00,$2C,$A1,$17,$15,$30,$21,$02,$31,$21,$62,$33,$21,$00,$32,$21
	db $E0,$15,$21,$80,$00,$00

DATA_FD2BA3:
	db $05,$21,$09,$07,$A1,$79,$74,$09,$21,$70,$0B,$A1,$52,$06,$01,$21
	db $00,$2C,$A1,$04,$13,$2E,$21,$04,$24,$21,$03,$30,$21,$02,$31,$21
	db $24,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2BCF:
	db $05,$21,$09,$07,$21,$6C,$09,$21,$70,$0B,$A1,$02,$00,$01,$21,$00
	db $2C,$A1,$05,$00,$30,$21,$00,$31,$21,$81,$33,$21,$00,$32,$21,$E6
	db $15,$21,$80,$00,$21,$0F,$00,$00

DATA_FD2BF7:
	db $05,$21,$09,$07,$A1,$7C,$78,$09,$21,$74,$0B,$A1,$24,$06,$01,$21
	db $00,$2C,$A1,$13,$00,$2E,$A1,$00,$00,$25,$21,$00,$30,$21,$00,$31
	db $21,$00,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2C24:
	db $05,$21,$09,$07,$A1,$60,$64,$09,$21,$7C,$0B,$A1,$52,$07,$01,$21
	db $00,$2C,$A1,$17,$02,$2E,$A1,$00,$00,$25,$21,$00,$30,$21,$02,$31
	db $21,$21,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2C51:
	db $05,$21,$01,$07,$A1,$62,$69,$09,$21,$7C,$0B,$A1,$25,$07,$01,$21
	db $00,$2C,$A1,$17,$06,$2E,$21,$05,$25,$21,$A0,$23,$A1,$0A,$0A,$26
	db $A1,$00,$08,$28,$A1,$F7,$FF,$30,$21,$22,$31,$21,$21,$33,$21,$00
	db $32,$21,$E4,$15,$21,$80,$00,$00

DATA_FD2C89:
	db $05,$21,$01,$07,$A1,$79,$70,$09,$21,$74,$0B,$A1,$52,$05,$01,$21
	db $00,$2C,$A1,$17,$00,$2E,$21,$02,$23,$21,$30,$30,$21,$00,$31,$21
	db $00,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2CB5:
	db $05,$21,$01,$07,$A1,$70,$79,$09,$21,$74,$0B,$A1,$26,$05,$01,$21
	db $00,$2C,$A1,$00,$17,$2F,$21,$01,$23,$21,$03,$30,$21,$02,$31,$21
	db $20,$33,$21,$00,$15,$21,$80,$00,$00

DATA_FD2CDE:
	db $05,$21,$01,$07,$A1,$78,$71,$09,$21,$7C,$0B,$A1,$26,$06,$01,$21
	db $00,$23,$21,$03,$24,$21,$0C,$2E,$21,$05,$2F,$21,$02,$2C,$A1,$17
	db $00,$30,$21,$10,$31,$21,$01,$33,$21,$00,$32,$21,$00,$15,$21,$80
	db $00,$00

DATA_FD2D10:
	db $05,$21,$09,$07,$A1,$71,$79,$09,$21,$6C,$0B,$A1,$26,$05,$01,$21
	db $00,$2C,$A1,$17,$00,$30,$21,$10,$31,$21,$37,$25,$21,$A0,$2B,$21
	db $08,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2D3C:
	db $00,$21,$80,$05,$21,$09,$07,$A1,$70,$71,$09,$21,$72,$0B,$A1,$66
	db $06,$01,$21,$00,$2C,$A1,$11,$11,$23,$A1,$00,$00,$25,$21,$00,$33
	db $21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD2D66:
	db $05,$21,$09,$07,$A1,$7C,$76,$09,$21,$70,$0B,$A1,$52,$06,$23,$21
	db $30,$2F,$21,$02,$2B,$21,$00,$25,$21,$00,$30,$21,$02,$33,$21,$00
	db $32,$21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2D91:
	db $05,$21,$09,$07,$A1,$6C,$75,$09,$21,$70,$0B,$A1,$52,$06,$23,$21
	db $30,$25,$21,$08,$2C,$A1,$17,$06,$2E,$A1,$12,$12,$28,$A1,$80,$C0
	db $33,$21,$00,$32,$21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2DBF:
	db $05,$21,$09,$07,$A1,$74,$78,$09,$21,$7C,$0B,$A1,$25,$06,$25,$21
	db $20,$33,$21,$00,$32,$21,$E4,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2DDE:
	db $05,$21,$09,$07,$A1,$6C,$75,$09,$21,$70,$0B,$A1,$52,$06,$01,$21
	db $00,$23,$21,$00,$2C,$A1,$02,$00,$2E,$A1,$00,$00,$30,$21,$00,$31
	db $21,$02,$33,$21,$00,$32,$21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2E0E:
	db $05,$21,$09,$07,$A1,$74,$78,$09,$21,$7C,$0B,$A1,$62,$06,$23,$21
	db $30,$25,$21,$30,$26,$A1,$00,$FF,$30,$21,$20,$33,$21,$00,$32,$21
	db $E7,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2E37:
	db $05,$21,$09,$07,$A1,$6C,$74,$09,$21,$70,$0B,$A1,$52,$06,$23,$21
	db $C0,$25,$21,$02,$2C,$A1,$02,$11,$2E,$A1,$13,$11,$30,$21,$02,$31
	db $21,$22,$33,$21,$00,$32,$21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2E67:
	db $05,$21,$09,$07,$A1,$7C,$74,$09,$21,$70,$0B,$A1,$52,$06,$23,$21
	db $30,$25,$21,$80,$2C,$A1,$17,$04,$2E,$A1,$00,$02,$33,$21,$00,$32
	db $21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2E91:
	db $05,$21,$09,$07,$A1,$7C,$78,$09,$21,$6C,$0B,$A1,$52,$07,$23,$21
	db $02,$2C,$A1,$13,$04,$30,$A1,$02,$92,$33,$21,$00,$32,$21,$E0,$00
	db $21,$80,$15,$21,$80,$00,$00

DATA_FD2EB8:
	db $05,$21,$09,$07,$A1,$79,$6C,$09,$21,$71,$0B,$A1,$02,$06,$2C,$A1
	db $13,$04,$30,$A1,$02,$02,$33,$21,$00,$32,$21,$20,$32,$21,$46,$32
	db $21,$88,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2EE2:
	db $05,$21,$09,$07,$A1,$7C,$75,$0B,$21,$62,$2C,$A1,$11,$02,$30,$21
	db $02,$31,$21,$91,$33,$21,$00,$32,$21,$E0,$00,$21,$80,$15,$21,$80
	db $00,$00

DATA_FD2F04:
	db $05,$21,$09,$07,$A1,$6C,$74,$09,$21,$70,$0B,$A1,$52,$06,$2C,$A1
	db $13,$04,$30,$21,$02,$31,$21,$22,$33,$21,$00,$32,$21,$45,$32,$21
	db $8A,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2F2D:
	db $05,$21,$09,$07,$A1,$7C,$74,$09,$21,$6E,$0B,$A1,$52,$06,$2C,$21
	db $05,$2D,$21,$16,$23,$21,$30,$2F,$21,$02,$33,$21,$00,$32,$21,$E0
	db $00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2F55:
	db $05,$21,$09,$07,$A1,$78,$7C,$0B,$21,$25,$2C,$21,$13,$2D,$21,$03
	db $30,$21,$02,$31,$21,$10,$33,$21,$00,$32,$21,$E0,$00,$21,$80,$15
	db $21,$80,$00,$00

DATA_FD2F79:
	db $05,$21,$09,$07,$A1,$7C,$78,$0B,$21,$32,$2C,$21,$13,$33,$21,$00
	db $32,$21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2F94:
	db $05,$21,$09,$07,$A1,$6C,$74,$09,$21,$70,$0B,$A1,$52,$06,$2C,$A1
	db $02,$15,$30,$21,$02,$31,$21,$22,$33,$21,$00,$32,$21,$45,$32,$21
	db $8A,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2FBD:
	db $05,$21,$09,$07,$A1,$6C,$74,$09,$21,$70,$0B,$A1,$52,$06,$2C,$A1
	db $13,$04,$30,$21,$02,$31,$21,$22,$33,$21,$00,$32,$21,$45,$32,$21
	db $8A,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD2FE6:
	db $05,$21,$09,$07,$A1,$6C,$74,$09,$21,$70,$0B,$A1,$52,$06,$2C,$A1
	db $13,$04,$30,$21,$02,$31,$21,$22,$33,$21,$00,$32,$21,$45,$32,$21
	db $8A,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD300F:
	db $05,$21,$09,$07,$A1,$6C,$74,$09,$21,$70,$0B,$A1,$52,$06,$2C,$A1
	db $02,$05,$30,$21,$02,$31,$21,$22,$33,$21,$00,$32,$21,$45,$32,$21
	db $8A,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD3038:
	db $05,$21,$09,$07,$A1,$6C,$74,$09,$21,$70,$0B,$A1,$52,$06,$2C,$A1
	db $13,$04,$2E,$21,$10,$25,$21,$02,$30,$21,$02,$31,$21,$22,$33,$21
	db $00,$32,$21,$45,$32,$21,$8A,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD3067:
	db $05,$21,$09,$07,$A1,$74,$7A,$09,$21,$70,$0B,$A1,$42,$06,$2C,$A1
	db $17,$02,$31,$21,$11,$33,$21,$00,$32,$21,$E0,$00,$21,$80,$15,$21
	db $80,$00,$00

DATA_FD308A:
	db $05,$21,$09,$07,$21,$70,$08,$21,$6C,$0B,$21,$26,$2C,$21,$13,$30
	db $21,$00,$31,$21,$00,$33,$21,$00,$32,$21,$E0,$00,$21,$80,$15,$21
	db $80,$00,$00

DATA_FD30AD:
	db $05,$21,$09,$07,$21,$60,$08,$21,$64,$0B,$21,$42,$2C,$21,$13,$30
	db $21,$00,$31,$21,$00,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD30CD:
	db $05,$21,$09,$08,$21,$71,$09,$21,$78,$0B,$A1,$26,$05,$01,$21,$00
	db $2C,$21,$12,$30,$21,$10,$31,$21,$37,$33,$21,$00,$32,$21,$00,$15
	db $21,$80,$00,$00

DATA_FD30F1:
	db $05,$21,$09,$07,$21,$7C,$0B,$21,$02,$2C,$21,$11,$33,$21,$00,$32
	db $21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD310B:
	db $05,$21,$07,$01,$21,$02,$2C,$A1,$10,$00,$33,$21,$00,$32,$21,$E0
	db $15,$21,$80,$00,$21,$80,$00,$00

DATA_FD3123:
	db $05,$21,$09,$07,$A1,$78,$7C,$09,$21,$74,$0B,$A1,$42,$07,$01,$21
	db $00,$2C,$A1,$17,$00,$30,$21,$00,$31,$21,$82,$33,$21,$00,$32,$21
	db $E6,$15,$21,$80,$00,$21,$80,$00,$00

DATA_FD314C:
	db $05,$21,$01,$07,$A1,$76,$7C,$0B,$21,$25,$2C,$21,$13,$33,$21,$00
	db $32,$21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD3167:
	db $05,$21,$01,$07,$21,$20,$0B,$21,$00,$2C,$21,$01,$33,$21,$00,$32
	db $21,$E0,$00,$21,$80,$15,$21,$80,$00,$00

DATA_FD3181:
	db $05,$21,$02,$07,$A1,$7C,$74,$0B,$21,$22,$01,$21,$00,$2C,$A1,$13
	db $00,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

DATA_FD319D:
	db $05,$21,$01,$07,$A1,$70,$79,$09,$21,$74,$0B,$A1,$26,$05,$01,$21
	db $00,$2C,$A1,$01,$16,$26,$21,$40,$27,$21,$C0,$2E,$21,$01,$23,$21
	db $03,$30,$21,$02,$31,$21,$A1,$33,$21,$00,$32,$21,$94,$32,$21,$5F
	db $32,$21,$3F,$15,$21,$80,$00,$00

DATA_FD31D5:
	db $05,$21,$09,$07,$A1,$71,$6C,$09,$21,$79,$0B,$A1,$62,$05,$01,$21
	db $00,$2C,$A1,$16,$11,$23,$21,$30,$2F,$21,$02,$30,$21,$02,$31,$21
	db $05,$33,$21,$00,$32,$21,$00,$15,$21,$80,$00,$00

;Sprite palettes
DATA_FD3201:
	dw !null_pointer
	dw DATA_FD341B
	dw DATA_FD34CF
	dw DATA_FD341B
	dw DATA_FD34CF
	dw DATA_FD39D9
	dw DATA_FD3A15
	dw DATA_FD434B
	dw DATA_FD430F
	dw DATA_FD4387
	dw DATA_FD43C3
	dw DATA_FD341B
	dw DATA_FD34CF
	dw DATA_FD388F
	dw DATA_FD38AD
	dw DATA_FD38CB
	dw DATA_FD3871
	dw DATA_FD3B05
	dw DATA_FD3A8D
	dw DATA_FD3673
	dw DATA_FD3691
	dw DATA_FD42F1
	dw DATA_FD35BF
	dw DATA_FD35DD
	dw DATA_FD3619
	dw DATA_FD35FB
	dw DATA_FD3655
	dw DATA_FD3AE7
	dw DATA_FD3AAB
	dw DATA_FD3AC9
	dw DATA_FD3637
	dw DATA_FD54A7
	dw DATA_FD441D
	dw DATA_FD43FF
	dw DATA_FD3BD7
	dw DATA_FD3B7D
	dw DATA_FD38E9
	dw DATA_FD4747
	dw DATA_FD3943
	dw DATA_FD397F
	dw DATA_FD399D
	dw DATA_FD39BB
	dw DATA_FD3A51
	dw DATA_FD3A6F
	dw DATA_FD3B41
	dw DATA_FD3B41
	dw DATA_FD3709
	dw DATA_FD3B23
	dw DATA_FD546B
	dw DATA_FD5489
	dw DATA_FD3961
	dw DATA_FD35A1
	dw DATA_FD3583
	dw DATA_FD54C5
	dw DATA_FD3907
	dw DATA_FD3925
	dw DATA_FD443B
	dw DATA_FD3745
	dw DATA_FD3565
	dw DATA_FD4177
	dw DATA_FD4459
	dw DATA_FD4477
	dw DATA_FD4495
	dw DATA_FD4729
	dw DATA_FD4585
	dw DATA_FD3FF1
	dw DATA_FD3FD3
	dw DATA_FD44B3
	dw DATA_FD44D1
	dw DATA_FD44EF
	dw DATA_FD450D
	dw DATA_FD452B
	dw DATA_FD4549
	dw DATA_FD4567
	dw DATA_FD45A3
	dw DATA_FD45C1
	dw DATA_FD45DF
	dw DATA_FD36AF
	dw DATA_FD3BF5
	dw DATA_FD37F9
	dw DATA_FD3C13
	dw DATA_FD3C31
	dw DATA_FD3C4F
	dw DATA_FD3C6D
	dw DATA_FD3C8B
	dw DATA_FD3763
	dw DATA_FD3CA9
	dw DATA_FD36CD
	dw DATA_FD36EB
	dw DATA_FD3CC7
	dw DATA_FD3CE5
	dw DATA_FD3D03
	dw DATA_FD3D21
	dw DATA_FD3D3F
	dw DATA_FD3D5D
	dw DATA_FD45FD
	dw DATA_FD461B
	dw DATA_FD37BD
	dw DATA_FD4639
	dw DATA_FD3D7B
	dw DATA_FD3D99
	dw DATA_FD3781
	dw DATA_FD379F
	dw DATA_FD3DB7
	dw DATA_FD3DD5
	dw DATA_FD3DF3
	dw DATA_FD3E11
	dw DATA_FD3E2F
	dw DATA_FD4657
	dw DATA_FD3E4D
	dw DATA_FD3E6B
	dw DATA_FD3E89
	dw DATA_FD4675
	dw DATA_FD3B5F
	dw DATA_FD3817
	dw DATA_FD3835
	dw DATA_FD3853
	dw DATA_FD400F
	dw DATA_FD402D
	dw DATA_FD3EA7
	dw DATA_FD46B1
	dw DATA_FD46CF
	dw DATA_FD46ED
	dw DATA_FD3727
	dw DATA_FD3EC5
	dw DATA_FD37DB
	dw DATA_FD470B
	dw DATA_FD3EE3
	dw DATA_FD3F01
	dw DATA_FD3F1F
	dw DATA_FD404B
	dw DATA_FD3F3D
	dw DATA_FD3F5B
	dw DATA_FD3F79
	dw DATA_FD3F97
	dw DATA_FD3FB5
	dw DATA_FD4069
	dw DATA_FD4087
	dw DATA_FD40A5
	dw DATA_FD40C3
	dw DATA_FD4857+$02
	dw DATA_FD40E1
	dw DATA_FD4877
	dw DATA_FD40FF
	dw DATA_FD4837+$02
	dw DATA_FD4387
	dw DATA_FD4895
	dw DATA_FD48B3
	dw DATA_FD4857
	dw DATA_FD4837
	dw DATA_FD4FBB
	dw DATA_FD4967
	dw DATA_FD490D
	dw DATA_FD48D1
	dw DATA_FD48EF
	dw DATA_FD4949
	dw DATA_FD4985
	dw DATA_FD49A3
	dw DATA_FD49C1
	dw DATA_FD4A57
	dw DATA_FD4D09
	dw DATA_FD413B
	dw DATA_FD4C19
	dw DATA_FD4E17
	dw DATA_FD4E35
	dw DATA_FD4E53
	dw DATA_FD4E71
	dw DATA_FD4E8F
	dw DATA_FD4EAD
	dw DATA_FD4DBD
	dw DATA_FD4DDB
	dw DATA_FD4A1B
	dw DATA_FD4A39
	dw DATA_FD4A75
	dw DATA_FD4A93
	dw DATA_FD4AB1
	dw DATA_FD411D
	dw DATA_FD49FD
	dw DATA_FD4ACF
	dw DATA_FD4AED
	dw DATA_FD4B0B
	dw DATA_FD4B29
	dw DATA_FD4B47
	dw DATA_FD4B65
	dw DATA_FD4B83
	dw DATA_FD4BA1
	dw DATA_FD4BBF
	dw DATA_FD4BDD
	dw DATA_FD4BFB
	dw DATA_FD4C37
	dw DATA_FD4C55
	dw DATA_FD4C73
	dw DATA_FD4C91
	dw DATA_FD4CAF
	dw DATA_FD4CCD
	dw DATA_FD4CEB
	dw DATA_FD4D27
	dw DATA_FD492B
	dw DATA_FD4D63
	dw DATA_FD4D81
	dw DATA_FD3B9B
	dw DATA_FD341B
	dw DATA_FD4ECB
	dw DATA_FD4EE9
	dw DATA_FD4D9F
	dw DATA_FD3BB9
	dw DATA_FD4F07
	dw DATA_FD4F25
	dw DATA_FD4F43
	dw DATA_FD4F61
	dw DATA_FD4F7F
	dw DATA_FD4F9D
	dw DATA_FD4DF9
	dw DATA_FD4FD9
	dw DATA_FD5015
	dw DATA_FD5033
	dw DATA_FD5051
	dw DATA_FD4FF7
	dw DATA_FD508D
	dw DATA_FD50AB
	dw DATA_FD50C9
	dw DATA_FD506F
	dw DATA_FD50E7
	dw DATA_FD5105
	dw DATA_FD5123
	dw DATA_FD4159
	dw DATA_FD5141
	dw DATA_FD5213
	dw DATA_FD515F
	dw DATA_FD517D
	dw DATA_FD51B9
	dw DATA_FD51D7
	dw DATA_FD51F5
	dw DATA_FD5231
	dw DATA_FD524F
	dw DATA_FD526D
	dw DATA_FD528B
	dw DATA_FD52A9
	dw DATA_FD52C7
	dw DATA_FD52E5
	dw DATA_FD5303
	dw DATA_FD5321
	dw DATA_FD533F
	dw DATA_FD535D
	dw DATA_FD537B
	dw DATA_FD5399
	dw DATA_FD53B7
	dw DATA_FD53D5
	dw DATA_FD53F3
	dw DATA_FD4195
	dw DATA_FD41B3
	dw DATA_FD41B7
	dw DATA_FD41BB
	dw DATA_FD41BF
	dw DATA_FD41C3
	dw DATA_FD5411
	dw DATA_FD542F
	dw DATA_FD544D
	dw DATA_FD4765
	dw DATA_FD4783
	dw DATA_FD47A1
	dw DATA_FD47BF
	dw DATA_FD47DD
	dw DATA_FD4819
	dw DATA_FD47FB
	dw DATA_FD38CB
	dw DATA_FD42D3
	dw DATA_FD42B5
	dw DATA_FD4297


DATA_FD341B:
	incbin "data/palettes/Sprite_Dixie_Active.bin"
	incbin "data/palettes/Sprite_Dixie_InActive.bin"
	incbin "data/palettes/Sprite_Dixie_P2Active.bin"
	incbin "data/palettes/Sprite_Dixie_P2InActive.bin"
	incbin "data/palettes/Sprite_Dixie_Invincible.bin"
	incbin "data/palettes/Sprite_Dixie_Zapped.bin"

DATA_FD34CF:
	incbin "data/palettes/Sprite_Kiddy_Active.bin"
	incbin "data/palettes/Sprite_Kiddy_InActive.bin"
	incbin "data/palettes/Sprite_Kiddy_P2Active.bin"
	incbin "data/palettes/Sprite_Kiddy_P2InActive.bin"
	incbin "data/palettes/Sprite_Kiddy_Invincible.bin"

DATA_FD3565:
	incbin "data/palettes/Sprite_Kiddy_Zapped.bin"					; Note: Also used by K. Rool when he is zapped.

DATA_FD3583:
	incbin "data/palettes/Sprite_DonkeyKong.bin"

DATA_FD35A1:
	incbin "data/palettes/Sprite_DiddyKong.bin"

DATA_FD35BF:
	incbin "data/palettes/Sprite_Ellie.bin"

DATA_FD35DD:
	incbin "data/palettes/Sprite_Enguarde.bin"

DATA_FD35FB:
	incbin "data/palettes/Sprite_Squitter.bin"

DATA_FD3619:
	incbin "data/palettes/Sprite_GreenSquawks.bin"

DATA_FD3637:
	incbin "data/palettes/Sprite_PurpleSquawks.bin"

DATA_FD3655:
	incbin "data/palettes/Sprite_Parry.bin"

DATA_FD3673:
	incbin "data/palettes/Sprite_RedBuzz.bin"

DATA_FD3691:
	incbin "data/palettes/Sprite_GreenBuzz.bin"

DATA_FD36AF:
	incbin "data/palettes/Sprite_ReKoil.bin"

DATA_FD36CD:
	incbin "data/palettes/Sprite_Koin.bin"

DATA_FD36EB:
	incbin "data/palettes/Sprite_Sneek.bin"

DATA_FD3709:
	incbin "data/palettes/Sprite_RedKoco.bin"

DATA_FD3727:
	incbin "data/palettes/Sprite_GreenKoco.bin"

DATA_FD3745:
	incbin "data/palettes/Sprite_GleaminBream.bin"

DATA_FD3763:
	incbin "data/palettes/Sprite_BountyBass.bin"

DATA_FD3781:
	incbin "data/palettes/Sprite_GreenLurchin.bin"

DATA_FD379F:
	incbin "data/palettes/Sprite_PurpleLurchin.bin"

DATA_FD37BD:
	incbin "data/palettes/Sprite_RedKnikKnak.bin"

DATA_FD37DB:
	incbin "data/palettes/Sprite_YellowKnikKnak.bin"

DATA_FD37F9:
	incbin "data/palettes/Sprite_BootyBird.bin"

DATA_FD3817:
	incbin "data/palettes/Sprite_Bazuka.bin"

DATA_FD3835:
	incbin "data/palettes/Sprite_PurpleNid.bin"

DATA_FD3853:
	incbin "data/palettes/Sprite_Kopter.bin"

DATA_FD3871:
	incbin "data/palettes/Sprite_NoAnimalBuddySign.bin"

DATA_FD388F:
	incbin "data/palettes/Sprite_WarningSign.bin"

DATA_FD38AD:
	incbin "data/palettes/Sprite_NoKrosshairSign.bin"

DATA_FD38CB:
	incbin "data/palettes/Sprite_HUDNumbers.bin"

DATA_FD38E9:
	incbin "data/palettes/Sprite_GreenBananas.bin"

DATA_FD3907:
	incbin "data/palettes/Sprite_ChristmasPresents.bin"

DATA_FD3925:
	incbin "data/palettes/Sprite_ChristmasOrnaments.bin"

DATA_FD3943:
	incbin "data/palettes/Sprite_MillPlatform.bin"

DATA_FD3961:
	incbin "data/palettes/Sprite_FactoryPlatform.bin"

DATA_FD397F:
	incbin "data/palettes/Sprite_RedExtraLifeBalloon.bin"

DATA_FD399D:
	incbin "data/palettes/Sprite_GreenExtraLifeBalloon.bin"

DATA_FD39BB:
	incbin "data/palettes/Sprite_BlueExtraLifeBalloon.bin"

DATA_FD39D9:
	incbin "data/palettes/Sprite_PinkFlag.bin"
	incbin "data/palettes/Sprite_PurpleFlag.bin"

DATA_FD3A15:
	incbin "data/palettes/Sprite_BlueFlag.bin"
	incbin "data/palettes/Sprite_GreenFlag.bin"

DATA_FD3A51:
	incbin "data/palettes/Sprite_LevelEndFlagpole.bin"

DATA_FD3A6F:
	incbin "data/palettes/Sprite_WhiteFlag.bin"

DATA_FD3A8D:
	incbin "data/palettes/Sprite_WaterfallBarrel.bin"

DATA_FD3AAB:
	incbin "data/palettes/Sprite_Barrel.bin"

DATA_FD3AC9:
	incbin "data/palettes/Sprite_SteelKeg.bin"

DATA_FD3AE7:
	incbin "data/palettes/Sprite_Rocket.bin"

DATA_FD3B05:
	incbin "data/palettes/Sprite_RocketFire.bin"

DATA_FD3B23:
	incbin "data/palettes/Sprite_RoastedBuzz.bin"

DATA_FD3B41:
	incbin "data/palettes/Sprite_FuelTank.bin"

DATA_FD3B5F:
	incbin "data/palettes/Sprite_FireAndExplosions.bin"

DATA_FD3B7D:
	incbin "data/palettes/Sprite_GoldCoins.bin"

DATA_FD3B9B:
	incbin "data/palettes/Sprite_BearCoin.bin"

DATA_FD3BB9:												; Note: Also used by the Karate Cranky trophy base
	incbin "data/palettes/Sprite_SaveScreenBonusBCoin.bin"

DATA_FD3BD7:
	incbin "data/palettes/Sprite_WaterSplash.bin"

DATA_FD3BF5:
	incbin "data/palettes/Sprite_Klasp.bin"

DATA_FD3C13:
	incbin "data/palettes/Sprite_KuffNKlout.bin"

DATA_FD3C31:
	incbin "data/palettes/Sprite_Bleak.bin"

DATA_FD3C4F:
	incbin "data/palettes/Sprite_Lemguin.bin"

DATA_FD3C6D:
	incbin "data/palettes/Sprite_Kobble.bin"

DATA_FD3C8B:
	incbin "data/palettes/Sprite_RedNibbla.bin"

DATA_FD3CA9:
	incbin "data/palettes/Sprite_Minkey.bin"

DATA_FD3CC7:
	incbin "data/palettes/Sprite_Skidda.bin"

DATA_FD3CE5:
	incbin "data/palettes/Sprite_BananaBirds.bin"

DATA_FD3D03:
	incbin "data/palettes/Sprite_Knocka.bin"

DATA_FD3D21:										; Note: Unused
	incbin "data/palettes/Sprite_Kracka.bin"

DATA_FD3D3F:
	incbin "data/palettes/Sprite_GreenBarrel.bin"

DATA_FD3D5D:										; Note: Unused
	incbin "data/palettes/Sprite_RedTNTBarrel.bin"

DATA_FD3D7B:
	incbin "data/palettes/Sprite_Krimp.bin"

DATA_FD3D99:
	incbin "data/palettes/Sprite_BarbosEyesAndMouth.bin"

DATA_FD3DB7:
	incbin "data/palettes/Sprite_Bristles.bin"

DATA_FD3DD5:
	incbin "data/palettes/Sprite_BarbosSpikeProjectiles.bin"

DATA_FD3DF3:
	incbin "data/palettes/Sprite_Krumple.bin"

DATA_FD3E11:
	incbin "data/palettes/Sprite_PurpleSeashellMissle.bin"

DATA_FD3E2F:
	incbin "data/palettes/Sprite_Swoopy.bin"

DATA_FD3E4D:
	incbin "data/palettes/Sprite_Kuchuka.bin"

DATA_FD3E6B:
	incbin "data/palettes/Sprite_Bazza.bin"

DATA_FD3E89:										; Note: Unused
	incbin "data/palettes/Sprite_PurpleBarrel.bin"

DATA_FD3EA7:
	incbin "data/palettes/Sprite_KarbinesFireball.bin"

DATA_FD3EC5:
	incbin "data/palettes/Sprite_YellowNid.bin"

DATA_FD3EE3:
	incbin "data/palettes/Sprite_Karbine.bin"

DATA_FD3F01:
	incbin "data/palettes/Sprite_Koindozer.bin"

DATA_FD3F1F:
	incbin "data/palettes/Sprite_KRool.bin"

DATA_FD3F3D:
	incbin "data/palettes/Sprite_ElectricNode.bin"

DATA_FD3F5B:
	incbin "data/palettes/Sprite_CraneThatCarriesKAOS.bin"

DATA_FD3F79:
	incbin "data/palettes/Sprite_KnautilusFireballShooter.bin"

DATA_FD3F97:
	incbin "data/palettes/Sprite_KastleKaosBGElements.bin"

DATA_FD3FB5:
	incbin "data/palettes/Sprite_KRoolCurtain.bin"

DATA_FD3FD3:
	incbin "data/palettes/Sprite_ElectricSparkBall.bin"

DATA_FD3FF1:
	incbin "data/palettes/Sprite_SquirtsEyelids.bin"

DATA_FD400F:
	incbin "data/palettes/Sprite_SquirtsMouth.bin"

DATA_FD402D:
	incbin "data/palettes/Sprite_SquirtsEyeballs.bin"

DATA_FD404B:
	incbin "data/palettes/Sprite_YellowSeashellMissle.bin"

DATA_FD4069:
	incbin "data/palettes/Sprite_BlueNibbla.bin"

DATA_FD4087:
	incbin "data/palettes/Sprite_BluishPurpleNibbla.bin"

DATA_FD40A5:
	incbin "data/palettes/Sprite_ReddishPurpleNibbla.bin"

DATA_FD40C3:
	incbin "data/palettes/Sprite_BrightRedNibbla.bin"

DATA_FD40E1:
	incbin "data/palettes/Sprite_FunkyKong.bin"

DATA_FD40FF:
	incbin "data/palettes/Sprite_SwankyKong.bin"

DATA_FD411D:
	incbin "data/palettes/Sprite_FunkysKongsBandanaAndBelt.bin"

DATA_FD413B:
	incbin "data/palettes/Sprite_WrinklyKong.bin"

DATA_FD4159:
	incbin "data/palettes/Sprite_SittingWrinklyKong.bin"

DATA_FD4177:
	incbin "data/palettes/Sprite_CrankyKong.bin"

DATA_FD4195:
	incbin "data/palettes/Sprite_SwankyKongsBarrelInEnding.bin"

DATA_FD41B3:
	incbin "data/palettes/Sprite_KAOSPurpleText.bin"

DATA_FD41B7:
	incbin "data/palettes/Sprite_DixieYellowText.bin"

DATA_FD41BB:
	incbin "data/palettes/Sprite_DonkeyKongLightOrangeText.bin"

DATA_FD41BF:
	incbin "data/palettes/Sprite_DiddyKongOrangeText.bin"

DATA_FD41C3:
	incbin "data/palettes/Sprite_CrankyKongWhiteText.bin"

DATA_FD41C7:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

DATA_FD41D7:
	db $00,$00,$21,$00,$21,$00,$21,$00,$22,$00,$22,$00,$22,$00,$43,$00
	db $43,$00,$43,$00,$44

DATA_FD41EC:
	db $00,$44,$00,$44,$00,$65,$00,$65,$00,$65,$00,$66,$00,$66,$00,$66
	db $00,$87,$00,$87,$00,$87,$00,$A9,$00,$A9,$00,$A9,$00,$AA,$00,$AA
	db $00,$AA,$00,$CB,$00,$CB,$00,$CB,$00,$CC,$00,$CC,$00,$CC,$00,$ED
	db $00,$ED,$00,$ED,$00,$EE,$00,$EE,$00,$EE,$00,$0F,$01,$0F,$01,$0F
	db $01,$30,$01,$30,$01,$30,$01,$51,$05,$51,$05,$51,$05,$72,$09,$72
	db $09,$72,$09,$93,$0D,$93,$0D,$93,$0D,$B4,$15,$B4,$15,$B4,$15,$D5
	db $19,$D5,$19,$D5,$19,$F6,$1D,$F6,$1D,$F6,$1D,$17,$22,$17,$22,$17
	db $22,$38,$26,$38,$26,$38,$26,$59,$2A,$59,$2A,$59,$2A,$7A,$2E,$7A
	db $2E,$7A,$2E,$9B,$32,$9B,$32,$9B,$32,$BC,$3A,$BC,$3A,$BC,$3A,$DD
	db $3E,$DD,$3E,$DD,$3E,$FE,$42,$FE,$42,$FE,$42,$1F,$47,$1F,$47,$1F
	db $47,$3F,$4B,$3F,$4B,$3F,$4B,$3F,$4B,$3F,$4B

DATA_FD4297:
	incbin "data/palettes/Sprite_Unknown1.bin"

DATA_FD42B5:
	incbin "data/palettes/Sprite_Unknown2.bin"

DATA_FD42D3:										; Note: A varient of HUDNumbers, but with darker whites
	incbin "data/palettes/Sprite_Unknown3.bin"

DATA_FD42F1:
	incbin "data/palettes/Sprite_GhostBarrel.bin"

DATA_FD430F:
	incbin "data/palettes/Sprite_Kiddy_TargetShoot.bin"
	incbin "data/palettes/Sprite_Kiddy_P2TargetShoot.bin"

DATA_FD434B:
	incbin "data/palettes/Sprite_Dixie_TargetShoot.bin"
	incbin "data/palettes/Sprite_Dixie_P2TargetShoot.bin"

DATA_FD4387:
	incbin "data/palettes/Sprite_MapDixieAndKiddy_P1.bin"
	incbin "data/palettes/Sprite_MapDixieAndKiddy_P2.bin"

DATA_FD43C3:
	incbin "data/palettes/Sprite_PinkAndBlueMapFlags.bin"
	incbin "data/palettes/Sprite_PurpleAndGreenMapFlags.bin"

DATA_FD43FF:
	incbin "data/palettes/Sprite_Toboggan.bin"

DATA_FD441D:
	incbin "data/palettes/Sprite_LargePipe.bin"

DATA_FD443B:
	incbin "data/palettes/Sprite_HeadToHeadDots.bin"

DATA_FD4459:
	incbin "data/palettes/Sprite_Unknown4.bin"

DATA_FD4477:
	incbin "data/palettes/Sprite_TargetShootTargets.bin"

DATA_FD4495:										; Note: A varient of HUDNumbers, but with blueish white colors
	incbin "data/palettes/Sprite_Unknown5.bin"

DATA_FD44B3:
	incbin "data/palettes/Sprite_PinkTimerNumbers.bin"

DATA_FD44D1:										; Note: A varient of HUDNumbers, but with light green instead of white colors
	incbin "data/palettes/Sprite_Unknown6.bin"

DATA_FD44EF:
	incbin "data/palettes/Sprite_RedText.bin"

DATA_FD450D:
	incbin "data/palettes/Sprite_BlueText.bin"

DATA_FD452B:
	incbin "data/palettes/Sprite_SneekWheel.bin"

DATA_FD4549:
	incbin "data/palettes/Sprite_RightWallMetalDoor.bin"

DATA_FD4567:
	incbin "data/palettes/Sprite_LeftWallMetalDoor.bin"

DATA_FD4585:
	incbin "data/palettes/Sprite_ArichLegs.bin"

DATA_FD45A3:
	incbin "data/palettes/Sprite_ArichFace.bin"

DATA_FD45C1:
	incbin "data/palettes/Sprite_ArichBouncingSpit.bin"

DATA_FD45DF:
	incbin "data/palettes/Sprite_Unknown7.bin"

DATA_FD45FD:
	incbin "data/palettes/Sprite_BelchasTeeth.bin"

DATA_FD461B:
	incbin "data/palettes/Sprite_SideOfBelchasMouth.bin"

DATA_FD4639:
	incbin "data/palettes/Sprite_BelchasEye.bin"

DATA_FD4657:
	incbin "data/palettes/Sprite_SquirtsWaterStream.bin"

DATA_FD4675:
	incbin "data/palettes/Sprite_BuzzSwarm.bin"

DATA_FD46B1:
	incbin "data/palettes/Sprite_KAOSLaserHead.bin"

DATA_FD46CF:
	incbin "data/palettes/Sprite_KAOSSkullHead.bin"

DATA_FD46ED:
	incbin "data/palettes/Sprite_KAOSCylinderHead.bin"

DATA_FD470B:
	incbin "data/palettes/Sprite_KAOSBoxingGlove.bin"

DATA_FD4729:
	incbin "data/palettes/Sprite_HeadToHeadCharacterHeads.bin"

DATA_FD4747:
	incbin "data/palettes/Sprite_BarrelShield.bin"

DATA_FD4765:
	incbin "data/palettes/Sprite_RotatingCylinderPegs.bin"

DATA_FD4783:
	incbin "data/palettes/Sprite_RotatingCylinderBlueKeys.bin"

DATA_FD47A1:
	incbin "data/palettes/Sprite_RotatingCylinderGreenKeys.bin"

DATA_FD47BF:
	incbin "data/palettes/Sprite_RotatingCylinderRedKeys.bin"

DATA_FD47DD:
	incbin "data/palettes/Sprite_RotatingCylinderYellowKeys.bin"

DATA_FD47FB:
	incbin "data/palettes/Sprite_RotatingCylinderCrank.bin"

DATA_FD4819:
	incbin "data/palettes/Sprite_RareLogo.bin"

DATA_FD4837:												; Note: Unused?
	incbin "data/palettes/Sprite_DKC2MapDiddyDixieTextAndLevelIcons.bin"

DATA_FD4857:
	incbin "data/palettes/Sprite_Unknown8.bin"

DATA_FD4877:
	incbin "data/palettes/Sprite_FunkysRentalsPool.bin"

DATA_FD4895:
	incbin "data/palettes/Sprite_MotorBoat.bin"

DATA_FD48B3:
	incbin "data/palettes/Sprite_Hovercraft.bin"

DATA_FD48D1:
	incbin "data/palettes/Sprite_BleaksHouseFace.bin"

DATA_FD48EF:
	incbin "data/palettes/Sprite_CottonTopCoveWaterfalls.bin"

DATA_FD490D:
	incbin "data/palettes/Sprite_GlacialGrottoCover.bin"

DATA_FD492B:
	incbin "data/palettes/Sprite_SmugglersCoveCover.bin"

DATA_FD4949:
	incbin "data/palettes/Sprite_KMapFlags.bin"

DATA_FD4967:
	incbin "data/palettes/Sprite_WrinklysSaveCave.bin"

DATA_FD4985:									; Note: Unused
	incbin "data/palettes/Sprite_ArichAmbushFace.bin"

DATA_FD49A3:
	incbin "data/palettes/Sprite_BrashsCabinSmoke.bin"

DATA_FD49C1:
	incbin "data/palettes/Sprite_ArichsHoardCover.bin"

DATA_FD49FD:
	incbin "data/palettes/Sprite_DoubleTroubleSign.bin"

DATA_FD4A1B:
	incbin "data/palettes/Sprite_Bazaar.bin"

DATA_FD4A39:
	incbin "data/palettes/Sprite_BazaarsAccessories.bin"

DATA_FD4A57:
	incbin "data/palettes/Sprite_Bramble.bin"

DATA_FD4A75:
	incbin "data/palettes/Sprite_BramblesAccessories.bin"

DATA_FD4A93:
	incbin "data/palettes/Sprite_Brash.bin"

DATA_FD4AB1:
	incbin "data/palettes/Sprite_Blunder.bin"

DATA_FD4ACF:
	incbin "data/palettes/Sprite_BlizzardsAccessories.bin"

DATA_FD4AED:
	incbin "data/palettes/Sprite_BrashsAccessories.bin"

DATA_FD4B0B:
	incbin "data/palettes/Sprite_BlundersAccessories.bin"

DATA_FD4B29:
	incbin "data/palettes/Sprite_Bazooka.bin"

DATA_FD4B47:
	incbin "data/palettes/Sprite_Boomer.bin"

DATA_FD4B65:
	incbin "data/palettes/Sprite_Baffle.bin"

DATA_FD4B83:
	incbin "data/palettes/Sprite_Barnacle.bin"

DATA_FD4BA1:
	incbin "data/palettes/Sprite_Barter.bin"

DATA_FD4BBF:
	incbin "data/palettes/Sprite_Benny.bin"

DATA_FD4BDD:
	incbin "data/palettes/Sprite_Bjorn.bin"

DATA_FD4BFB:
	incbin "data/palettes/Sprite_Blue.bin"

DATA_FD4C19:
	incbin "data/palettes/Sprite_Blizzard.bin"

DATA_FD4C37:
	incbin "data/palettes/Sprite_BazookasAccessories.bin"

DATA_FD4C55:
	incbin "data/palettes/Sprite_BoomersAccessories.bin"

DATA_FD4C73:
	incbin "data/palettes/Sprite_BafflesAccessories.bin"

DATA_FD4C91:
	incbin "data/palettes/Sprite_BarnaclesAccessories.bin"

DATA_FD4CAF:
	incbin "data/palettes/Sprite_BartersAccessories.bin"

DATA_FD4CCD:
	incbin "data/palettes/Sprite_BennysAccessories.bin"

DATA_FD4CEB:
	incbin "data/palettes/Sprite_BjornsAccessories.bin"

DATA_FD4D09:
	incbin "data/palettes/Sprite_BoomersFan.bin"

DATA_FD4D27:
	incbin "data/palettes/Sprite_Unknown9.bin"

DATA_FD4D63:
	incbin "data/palettes/Sprite_FileSelectOptionsText.bin"

DATA_FD4D81:
	incbin "data/palettes/Sprite_FileSelectDigitalDisplayText.bin"

DATA_FD4D9F:
	incbin "data/palettes/Sprite_BrashesCabinDigitalDisplay.bin"

DATA_FD4DBD:
	incbin "data/palettes/Sprite_MainMapWaterFallByCottonTopCove.bin"

DATA_FD4DDB:
	incbin "data/palettes/Sprite_MainMapWideWaterfalls.bin"

DATA_FD4DF9:
	incbin "data/palettes/Sprite_Nintendo64.bin"

DATA_FD4E17:
	incbin "data/palettes/Sprite_GameOverBlocks_G.bin"

DATA_FD4E35:
	incbin "data/palettes/Sprite_GameOverBlocks_AM.bin"

DATA_FD4E53:
	incbin "data/palettes/Sprite_GameOverBlocks_E.bin"

DATA_FD4E71:
	incbin "data/palettes/Sprite_GameOverBlocks_O.bin"

DATA_FD4E8F:
	incbin "data/palettes/Sprite_GameOverBlocks_V.bin"

DATA_FD4EAD:
	incbin "data/palettes/Sprite_GameOverBlocks_ER.bin"

DATA_FD4ECB:											; Note: Looks sort of like the invincibility palette for Dixie
	incbin "data/palettes/Sprite_Unknown10.bin"

DATA_FD4EE9:											; Note: Looks sort of like the invincibility palette for Kiddy
	incbin "data/palettes/Sprite_Unknown11.bin"

DATA_FD4F07:
	incbin "data/palettes/Sprite_BramblesVase.bin"

DATA_FD4F25:
	incbin "data/palettes/Sprite_AreaNameFont.bin"

DATA_FD4F43:
	incbin "data/palettes/Sprite_UsedInventoryItems1.bin"

DATA_FD4F61:
	incbin "data/palettes/Sprite_UsedInventoryItems2.bin"

DATA_FD4F7F:
	incbin "data/palettes/Sprite_MainMapRocksAndWaterTrails.bin"

DATA_FD4F9D:
	incbin "data/palettes/Sprite_Gyrocopter.bin"

DATA_FD4FBB:
	incbin "data/palettes/Sprite_TurboSki.bin"

DATA_FD4FD9:
	incbin "data/palettes/Sprite_P2AreaNameFont.bin"

DATA_FD4FF7:
	incbin "data/palettes/Sprite_BlueCrystal.bin"

DATA_FD5015:
	incbin "data/palettes/Sprite_GreenCrystal.bin"

DATA_FD5033:
	incbin "data/palettes/Sprite_RedCrystal.bin"

DATA_FD5051:
	incbin "data/palettes/Sprite_YellowCrystal.bin"

DATA_FD506F:
	incbin "data/palettes/Sprite_GlowingBlueCrystal.bin"

DATA_FD508D:
	incbin "data/palettes/Sprite_GlowingGreenCrystal.bin"

DATA_FD50AB:
	incbin "data/palettes/Sprite_GlowingRedCrystal.bin"

DATA_FD50C9:
	incbin "data/palettes/Sprite_GlowingYellowCrystal.bin"

DATA_FD50E7:
	incbin "data/palettes/Sprite_MusicTestNotes.bin"

DATA_FD5105:
	incbin "data/palettes/Sprite_Unknown12.bin"

DATA_FD5123:
	incbin "data/palettes/Sprite_MusicTestSign.bin"

DATA_FD5141:
	incbin "data/palettes/Sprite_BountyBayCover.bin"

DATA_FD515F:
	incbin "data/palettes/Sprite_CrystalShards.bin"

DATA_FD517D:
	incbin "data/palettes/Sprite_KremwoodForestLog.bin"

DATA_FD51B9:
	incbin "data/palettes/Sprite_MapCannon.bin"

DATA_FD51D7:
	incbin "data/palettes/Sprite_Chairlifts.bin"

DATA_FD51F5:
	incbin "data/palettes/Sprite_BoomersFuse.bin"

DATA_FD5213:
	incbin "data/palettes/Sprite_SewerStockpileCover.bin"

DATA_FD5231:
	incbin "data/palettes/Sprite_SkyHighSecretRock.bin"

DATA_FD524F:
	incbin "data/palettes/Sprite_Rockpile.bin"

DATA_FD526D:
	incbin "data/palettes/Sprite_ClifftopCacheCover.bin"

DATA_FD528B:
	incbin "data/palettes/Sprite_RazorRidgePipeAndWhirlpool.bin"

DATA_FD52A9:
	incbin "data/palettes/Sprite_Krosshair.bin"

DATA_FD52C7:
	incbin "data/palettes/Sprite_Knautilus.bin"

DATA_FD52E5:
	incbin "data/palettes/Sprite_KremtoaBridge.bin"

DATA_FD5303:
	incbin "data/palettes/Sprite_BananaBirdQueenHead.bin"

DATA_FD5321:
	incbin "data/palettes/Sprite_MapKRool.bin"

DATA_FD533F:
	incbin "data/palettes/Sprite_KRoolsEyes.bin"

DATA_FD535D:
	incbin "data/palettes/Sprite_GiantBananaBirdQueenEgg.bin"

DATA_FD537B:
	incbin "data/palettes/Sprite_RedGemInBananaBirdQueenBarrier.bin"

DATA_FD5399:
	incbin "data/palettes/Sprite_LightsOnBananaBirdQueenBarrier.bin"

DATA_FD53B7:
	incbin "data/palettes/Sprite_KRoolHead.bin"

DATA_FD53D5:
	incbin "data/palettes/Sprite_MapBananaBirdQueen.bin"

DATA_FD53F3:
	incbin "data/palettes/Sprite_FunkyKongDrivingBoat.bin"

DATA_FD5411:
	incbin "data/palettes/Sprite_KarateCrankyTrophy.bin"

DATA_FD542F:
	incbin "data/palettes/Sprite_PhotoEdges.bin"

DATA_FD544D:
	incbin "data/palettes/Sprite_PhotoAlbumSectionNames.bin"

DATA_FD546B:
	incbin "data/palettes/Sprite_Unknown13.bin"

DATA_FD5489:
	incbin "data/palettes/Sprite_KongFusedCliffsFire.bin"

DATA_FD54A7:
	incbin "data/palettes/Sprite_LavaSmoke.bin"


;unused platform ("KPlat") palette?
DATA_FD54C5:
	incbin "data/palettes/Sprite_Unknown14.bin"

DATA_FD54E3:
	db $7B,$7C,$71,$7D,$7C,$5F

;Level/Screen palettes
DATA_FD54E9:
	dw DATA_FD55F1
	dw DATA_FD5601
	dw DATA_FD5701
	dw DATA_FD8461
	dw DATA_FD8561
	dw DATA_FD5B01
	dw DATA_FD5C01
	dw DATA_FD5D01
	dw DATA_FD5FC1
	dw DATA_FD7421
	dw DATA_FD60C1
	dw DATA_FD6401
	dw DATA_FD6501
	dw DATA_FD6601
	dw DATA_FD6701
	dw DATA_FD6801
	dw DATA_FD5FA1
	dw DATA_FD6901
	dw DATA_FD6A01
	dw DATA_FD6B01
	dw DATA_FD6C01
	dw DATA_FD6D01
	dw DATA_FD6E01
	dw DATA_FD6F01
	dw DATA_FD7001
	dw DATA_FD7101
	dw DATA_FD7201
	dw DATA_FD7301
	dw DATA_FD7421+$02
	dw DATA_FD7521
	dw DATA_FD7701
	dw DATA_FD55F9
	dw DATA_FD7681
	dw DATA_FD7621
	dw DATA_FD7801
	dw DATA_FD7901
	dw DATA_FD7921
	dw DATA_FD7D21
	dw DATA_FD7D41
	dw DATA_FD62C1
	dw DATA_FD7E61
	dw DATA_FD7E41
	dw DATA_FD8161
	dw DATA_FD8161
	dw DATA_FD8161
	dw DATA_FD7661
	dw DATA_FD8361
	dw DATA_FD8641
	dw DATA_FD7401
	dw DATA_FD8741
	dw DATA_FD8BE1
	dw DATA_FD91F9
	dw DATA_FD8B01
	dw DATA_FD8941
	dw DATA_FD8861
	dw DATA_FD8A21
	dw DATA_FD8841
	dw DATA_FD8CE1
	dw DATA_FD8DE1
	dw DATA_FD8EE1
	dw DATA_FD8FF9
	dw DATA_FD8061
	dw DATA_FD7F61
	dw DATA_FD8FD9
	dw DATA_FD8FD9+$08
	dw DATA_FD8FD9+$10
	dw DATA_FD8FD9+$18
	dw DATA_FD97F9
	dw DATA_FD98F9
	dw DATA_FD9A39
	dw DATA_FD9E39
	dw DATA_FDA239
	dw DATA_FD8261
	dw DATA_FD7A21
	dw DATA_FDA339
	dw DATA_FD90F9
	dw DATA_FDB739
	dw DATA_FDA839
	dw DATA_FDA879
	dw DATA_FDAE99
	dw DATA_FDAE99
	dw DATA_FDAF79
	dw DATA_FDB059
	dw DATA_FDA999
	dw DATA_FDAC99
	dw DATA_FDAB99
	dw DATA_FDAA99
	dw DATA_FDAD99
	dw DATA_FDA899
	dw DATA_FDB139
	dw DATA_FDB239
	dw DATA_FDB339
	dw DATA_FDB439
	dw DATA_FDB539
	dw DATA_FDB639
	dw DATA_FD9939
	dw DATA_FDB799
	dw DATA_FDB899
	dw DATA_FDB999
	dw DATA_FDBA99
	dw DATA_FDBB99
	dw DATA_FDBC99
	dw DATA_FDBD99
	dw DATA_FDBE79
	dw DATA_FDBF79
	dw DATA_FD76E1
	dw DATA_FD94F9
	dw DATA_FD93F9
	dw DATA_FD95F9
	dw DATA_FD96F9
	dw DATA_FDA439
	dw DATA_FDA539
	dw DATA_FDA639
	dw DATA_FDA739
	dw DATA_FD61C1
	dw DATA_FD7B21
	dw DATA_FD5801
	dw DATA_FD5901
	dw DATA_FD5A01
	dw DATA_FD9F39
	dw DATA_FDA039
	dw DATA_FD9B39
	dw DATA_FD9C39
	dw DATA_FD9D39
	dw DATA_FD92F9
	dw DATA_FD5DE1
	dw DATA_FD5EC1
	dw DATA_FD6301
	dw DATA_FDA139
	dw DATA_FD7C21
	dw DATA_FDC059
	dw DATA_FDC159

DATA_FD55F1:
	dw $318C,$0000,$1084,$2108

DATA_FD55F9:
	incbin "data/palettes/Layer3_ErrorScreenText.bin"

DATA_FD5601:
	incbin "data/palettes/FGBG_LakesideLimbo.bin"

DATA_FD5701:
	incbin "data/palettes/FGBG_RocketBarrelRide.bin"

DATA_FD5801:
	incbin "data/palettes/FGBG_BarrelDropBounce.bin"

DATA_FD5901:
	incbin "data/palettes/FGBG_TrackerBarrelTrek.bin"

DATA_FD5A01:
	incbin "data/palettes/FGBG_SquirtsShowdown.bin"

DATA_FD5B01:
	incbin "data/palettes/FGBG_SwankysSideshowInTent.bin"

DATA_FD5C01:
	incbin "data/palettes/FGBG_Unknown1.bin"

DATA_FD5D01:
	incbin "data/palettes/FGBG_BarrelShieldBustUp.bin"

DATA_FD5DE1:
	incbin "data/palettes/FGBG_SwoopySalvo_Volcanic.bin"

DATA_FD5EC1:
	incbin "data/palettes/FGBG_ArichsAmbush.bin"

DATA_FD5FA1:
	incbin "data/palettes/Layer1_ArichBody.bin"

DATA_FD5FC1:
	incbin "data/palettes/FGBG_SkiddasRow.bin"

DATA_FD60C1:
	incbin "data/palettes/FGBG_SquealsOnWheels.bin"

DATA_FD61C1:
	incbin "data/palettes/FGBG_DoorstopDash.bin"

DATA_FD62C1:
	incbin "data/palettes/Layer2_Belcha.bin"

DATA_FD6301:
	incbin "data/palettes/FGBG_BelchasBarn.bin"

DATA_FD6401:
	incbin "data/palettes/FGBG_WrinklysSaveCave1.bin"

DATA_FD6501:
	incbin "data/palettes/FGBG_WrinklysSaveCave2.bin"

DATA_FD6601:
	incbin "data/palettes/FGBG_WrinklysSaveCave3.bin"

DATA_FD6701:
	incbin "data/palettes/FGBG_WrinklysSaveCave4.bin"

DATA_FD6801:
	incbin "data/palettes/FGBG_KremwoodForest.bin"

DATA_FD6901:
	incbin "data/palettes/FGBG_MurkyMill.bin"

DATA_FD6A01:									; Note: Also the palette for Barter's Swap Shop, Baffle's Code Room, Bazooka's Barracks
	incbin "data/palettes/FGBG_BazaarsGeneralStore.bin"

DATA_FD6B01:
	incbin "data/palettes/FGBG_K3.bin"

DATA_FD6C01:
	incbin "data/palettes/FGBG_BlizzardsBaseCamp.bin"

DATA_FD6D01:
	incbin "data/palettes/FGBG_BlundersBooth.bin"

DATA_FD6E01:									; Note: Also the palette for Boomer's Bomb Shelter (Normal Palette)
	incbin "data/palettes/FGBG_BramblesBungalow.bin"

DATA_FD6F01:
	incbin "data/palettes/FGBG_BarnaclesIsland.bin"

DATA_FD7001:
	incbin "data/palettes/FGBG_BrashsCabin.bin"

DATA_FD7101:
	incbin "data/palettes/FGBG_BluesBeachHut.bin"

DATA_FD7201:									; Note: Also the palette for Bjorns Chairlifts
	incbin "data/palettes/FGBG_BennysChairlifts.bin"

DATA_FD7301:
	incbin "data/palettes/FGBG_BoomersBombShelter_Volcanic.bin"

DATA_FD7401:
	incbin "data/palettes/FGBG_MainMapLargeClouds.bin"

DATA_FD7421:
	incbin "data/palettes/FGBG_MainMap.bin"

DATA_FD7521:
	incbin "data/palettes/FGBG_GameOverScreen.bin"

DATA_FD7621:
	incbin "data/palettes/FGBG_RareLogo.bin"

DATA_FD7661:
	incbin "data/palettes/Layer3_Credits.bin"

DATA_FD7681:
	incbin "data/palettes/FGBG_NintendoPresentsScreen.bin"

DATA_FD76E1:
	incbin "data/palettes/FGBG_JapaneseTitleScreenLogo.bin"

DATA_FD7701:
	incbin "data/palettes/FGBG_TitleScreen.bin"

DATA_FD7801:
	incbin "data/palettes/FGBG_BleaksHouse.bin"

DATA_FD7901:
	incbin "data/palettes/FGBG_CopyrightScreen.bin"

DATA_FD7921:
	incbin "data/palettes/FGBG_RiversideRace.bin"

DATA_FD7A21:
	incbin "data/palettes/FGBG_LightningLookOut_Normal.bin"

DATA_FD7B21:
	incbin "data/palettes/FGBG_BobbingBarrelBrawl.bin"

DATA_FD7C21:
	incbin "data/palettes/FGBG_LightningLookOut_LightningFlash.bin"

DATA_FD7D21:
	incbin "data/palettes/FGBG_Unknown2.bin"

DATA_FD7D41:
	incbin "data/palettes/FGBG_LakeOrangatanga.bin"

DATA_FD7E41:
	incbin "data/palettes/Layer3_BelchasBarn.bin"

DATA_FD7E61:
	incbin "data/palettes/FGBG_DemolitionDrainPipe.bin"

DATA_FD7F61:
	incbin "data/palettes/FGBG_LowGLabyrinth.bin"

DATA_FD8061:
	incbin "data/palettes/FGBG_PoisonousPipeline.bin"

DATA_FD8161:
	incbin "data/palettes/FGBG_BazzasBlockade.bin"

DATA_FD8261:
	incbin "data/palettes/FGBG_FloodlitFish.bin"

DATA_FD8361:
	incbin "data/palettes/FGBG_TVScreen.bin"

DATA_FD8461:
	incbin "data/palettes/FGBG_SwankysSideshowOutside.bin"

DATA_FD8561:
	incbin "data/palettes/FGBG_FunkysRentals.bin"

DATA_FD8641:
	incbin "data/palettes/FGBG_FileSelectScreen.bin"

DATA_FD8741:
	incbin "data/palettes/FGBG_BananaBirdCave.bin"

DATA_FD8841:
	incbin "data/palettes/Layer2_BonusRoomIntroScreen.bin"

DATA_FD8861:
	incbin "data/palettes/Layer1_Player1CollectXXStarsScreen.bin"

DATA_FD8941:
	incbin "data/palettes/Layer1_Player1BashTheBaddiesScreen.bin"

DATA_FD8A21:
	incbin "data/palettes/Layer1_Player1GrabXXBananasScreen.bin"

DATA_FD8B01:
	incbin "data/palettes/Layer1_Player1FindTheCoinScreen.bin"

DATA_FD8BE1:
	incbin "data/palettes/FGBG_CottonTopCove.bin"

DATA_FD8CE1:
	incbin "data/palettes/FGBG_Mekanos.bin"

DATA_FD8DE1:
	incbin "data/palettes/FGBG_RazorRidge.bin"

DATA_FD8EE1:
	incbin "data/palettes/FGBG_KAOSKore.bin"

DATA_FD8FD9:
	incbin "data/palettes/FGBG_AnimatedKAOSKoreColors.bin"

DATA_FD8FF9:
	incbin "data/palettes/FGBG_Kremtoa_Normal.bin"

DATA_FD90F9:
	incbin "data/palettes/FGBG_Kremtoa_Volcanic.bin"

DATA_FD91F9:
	incbin "data/palettes/FGBG_KongFusedCliffs.bin"

DATA_FD92F9:														; Note: Also the Rocket Rush volcanic palette
	incbin "data/palettes/FGBG_CrissKrossCliffs_Volcanic.bin"

DATA_FD93F9:
	incbin "data/palettes/FGBG_RopeyRumpus.bin"

DATA_FD94F9:
	incbin "data/palettes/FGBG_KreviceKreepers.bin"

DATA_FD95F9:
	incbin "data/palettes/FGBG_CrissKrossCliffs_Normal.bin"

DATA_FD96F9:
	incbin "data/palettes/FGBG_RocketRush_Normal.bin"

DATA_FD97F9:
	incbin "data/palettes/FGBG_KastleKAOS.bin"

DATA_FD98F9:
	incbin "data/palettes/Layer1_KAOS.bin"

DATA_FD9939:
	incbin "data/palettes/FGBG_Knautilus.bin"

DATA_FD9A39:
	incbin "data/palettes/FGBG_StampedeSprint_Normal.bin"

DATA_FD9B39:
	incbin "data/palettes/FGBG_KoindozerKlamber.bin"

DATA_FD9C39:
	incbin "data/palettes/FGBG_KonveyorRopeKlash.bin"

DATA_FD9D39:
	incbin "data/palettes/FGBG_StampedeSprint_Volcanic.bin"

DATA_FD9E39:
	incbin "data/palettes/FGBG_FireballFrenzy.bin"

DATA_FD9F39:
	incbin "data/palettes/FGBG_KrackshotKroc.bin"

DATA_FDA039:
	incbin "data/palettes/FGBG_BlazingBazukas.bin"

DATA_FDA139:
	incbin "data/palettes/FGBG_KAOSKarnage.bin"

DATA_FDA239:
	incbin "data/palettes/FGBG_BananaBirdQueenScreen.bin"

DATA_FDA339:
	incbin "data/palettes/FGBG_TyrantTwinTussle_Normal.bin"

DATA_FDA439:
	incbin "data/palettes/FGBG_BuzzerBarrage.bin"

DATA_FDA539:
	incbin "data/palettes/FGBG_PotHolePanic.bin"

DATA_FDA639:
	incbin "data/palettes/FGBG_CreepyCaverns.bin"

DATA_FDA739:
	incbin "data/palettes/FGBG_TyrantTwinTussle_Volcanic.bin"

DATA_FDA839:
	incbin "data/palettes/FGBG_PhotoAlbumCover.bin"

DATA_FDA879:
	incbin "data/palettes/FGBG_PhotoAlbumSection.bin"

DATA_FDA899:
	incbin "data/palettes/Layer2_BaffleAndBoomerPhotos.bin"

DATA_FDA999:
	incbin "data/palettes/Layer2_BazaarAndBarnaclePhotos.bin"

DATA_FDAA99:
	incbin "data/palettes/Layer2_BlizzardAndBramblePhotos.bin"

DATA_FDAB99:
	incbin "data/palettes/Layer2_BlueAndBazookaPhotos.bin"

DATA_FDAC99:
	incbin "data/palettes/Layer2_BrashAndBlunderPhotos.bin"

DATA_FDAD99:
	incbin "data/palettes/Layer2_BennyBjornAndBarterPhotos.bin"

DATA_FDAE99:																; Note: Also the palette for the player 2 Find the coin screen.
	incbin "data/palettes/Layer1_Player2BashTheBaddiesScreen.bin"

DATA_FDAF79:
	incbin "data/palettes/Layer1_Player2CollectXXStarsScreen.bin"

DATA_FDB059:
	incbin "data/palettes/Layer1_Player2GrabXXBananasScreen.bin"

DATA_FDB139:
	incbin "data/palettes/Layer2_BelchaPhoto.bin"

DATA_FDB239:
	incbin "data/palettes/Layer2_ArichPhoto.bin"

DATA_FDB339:
	incbin "data/palettes/Layer2_SquirtPhoto.bin"

DATA_FDB439:
	incbin "data/palettes/Layer2_KAOSPhoto.bin"

DATA_FDB539:
	incbin "data/palettes/Layer2_BleakPhoto.bin"

DATA_FDB639:
	incbin "data/palettes/Layer2_BarbosPhoto.bin"

DATA_FDB739:
	incbin "data/palettes/Layer2_KRoolInHovercraft.bin"

DATA_FDB799:
	incbin "data/palettes/FGBG_BarbossBarrier.bin"

DATA_FDB899:
	incbin "data/palettes/FGBG_FishFoodFrenzy.bin"

DATA_FDB999:
	incbin "data/palettes/FGBG_KreepingKlasps.bin"

DATA_FDBA99:
	incbin "data/palettes/FGBG_TidalTrouble.bin"

DATA_FDBB99:
	incbin "data/palettes/FGBG_LemguinLunge.bin"

DATA_FDBC99:
	incbin "data/palettes/FGBG_TearawayToboggan.bin"

DATA_FDBD99:
	incbin "data/palettes/FGBG_SpringinSpiders.bin"

DATA_FDBE79:
	incbin "data/palettes/FGBG_RipsawRage.bin"

DATA_FDBF79:
	incbin "data/palettes/FGBG_SwoopySalvo_Normal.bin"

DATA_FDC059:
	incbin "data/palettes/FGBG_P1WinsScreen.bin"

DATA_FDC159:
	incbin "data/palettes/FGBG_P2WinsScreen.bin"

;Camera placement data
DATA_FDC259:
	dw DATA_FDC3F9-DATA_FDC259
	dw DATA_FDC3F9-DATA_FDC259
	dw DATA_FDC403-DATA_FDC259
	dw DATA_FDC408-DATA_FDC259
	dw DATA_FDC40D-DATA_FDC259
	dw DATA_FDC417-DATA_FDC259
	dw DATA_FDC421-DATA_FDC259
	dw DATA_FDC426-DATA_FDC259
	dw DATA_FDC426-DATA_FDC259
	dw DATA_FDC449-DATA_FDC259
	dw DATA_FDC471-DATA_FDC259
	dw DATA_FDC48F-DATA_FDC259
	dw DATA_FDC4C6-DATA_FDC259
	dw DATA_FDC4D5-DATA_FDC259
	dw DATA_FDC4EE-DATA_FDC259
	dw DATA_FDC4F3-DATA_FDC259
	dw DATA_FDC4F3-DATA_FDC259
	dw DATA_FDC4F3-DATA_FDC259
	dw DATA_FDC4F3-DATA_FDC259
	dw DATA_FDC4F3-DATA_FDC259
	dw DATA_FDC4F8-DATA_FDC259
	dw DATA_FDC5D4-DATA_FDC259
	dw DATA_FDC5DE-DATA_FDC259
	dw DATA_FDC5E8-DATA_FDC259
	dw DATA_FDC5E8-DATA_FDC259
	dw DATA_FDC5E8-DATA_FDC259
	dw DATA_FDC5E8-DATA_FDC259
	dw DATA_FDC5FC-DATA_FDC259
	dw DATA_FDC610-DATA_FDC259
	dw DATA_FDC61A-DATA_FDC259
	dw DATA_FDC624-DATA_FDC259
	dw DATA_FDC629-DATA_FDC259
	dw DATA_FDC62E-DATA_FDC259
	dw DATA_FDC633-DATA_FDC259
	dw DATA_FDC633-DATA_FDC259
	dw DATA_FDC647-DATA_FDC259
	dw DATA_FDC651-DATA_FDC259
	dw DATA_FDC656-DATA_FDC259
	dw DATA_FDC6B0-DATA_FDC259
	dw DATA_FDC70A-DATA_FDC259
	dw DATA_FDC750-DATA_FDC259
	dw DATA_FDC7FF-DATA_FDC259
	dw DATA_FDC90D-DATA_FDC259
	dw DATA_FDC9BC-DATA_FDC259
	dw DATA_FDCA7F-DATA_FDC259
	dw DATA_FDCB4C-DATA_FDC259
	dw DATA_FDCC78-DATA_FDC259
	dw DATA_FDCCCD-DATA_FDC259
	dw DATA_FDCD68-DATA_FDC259
	dw DATA_FDCDEA-DATA_FDC259
	dw DATA_FDCE94-DATA_FDC259
	dw DATA_FDCF48-DATA_FDC259
	dw DATA_FDCFE8-DATA_FDC259
	dw DATA_FDD0C4-DATA_FDC259
	dw DATA_FDD155-DATA_FDC259
	dw DATA_FDD204-DATA_FDC259
	dw DATA_FDD2AE-DATA_FDC259
	dw DATA_FDD2DB-DATA_FDC259
	dw DATA_FDD2FE-DATA_FDC259
	dw DATA_FDD326-DATA_FDC259
	dw DATA_FDD3F8-DATA_FDC259
	dw DATA_FDD4D4-DATA_FDC259
	dw DATA_FDD59C-DATA_FDC259
	dw DATA_FDD6C8-DATA_FDC259
	dw DATA_FDD7B3-DATA_FDC259
	dw DATA_FDD8EE-DATA_FDC259
	dw DATA_FDD99D-DATA_FDC259
	dw DATA_FDD9E3-DATA_FDC259
	dw DATA_FDDA60-DATA_FDC259
	dw DATA_FDDBAA-DATA_FDC259
	dw DATA_FDDCA9-DATA_FDC259
	dw DATA_FDDDA8-DATA_FDC259
	dw DATA_FDDE70-DATA_FDC259
	dw DATA_FDDF06-DATA_FDC259
	dw DATA_FDDFC4-DATA_FDC259
	dw DATA_FDE064-DATA_FDC259
	dw DATA_FDE122-DATA_FDC259
	dw DATA_FDE1EF-DATA_FDC259
	dw DATA_FDE1EF-DATA_FDC259
	dw DATA_FDE1EF-DATA_FDC259
	dw DATA_FDE1EF-DATA_FDC259
	dw DATA_FDE1F4-DATA_FDC259
	dw DATA_FDE1F9-DATA_FDC259
	dw DATA_FDE1FE-DATA_FDC259
	dw DATA_FDE203-DATA_FDC259
	dw DATA_FDE208-DATA_FDC259
	dw DATA_FDE20D-DATA_FDC259
	dw DATA_FDE212-DATA_FDC259
	dw DATA_FDE21C-DATA_FDC259
	dw DATA_FDE221-DATA_FDC259
	dw DATA_FDE226-DATA_FDC259
	dw DATA_FDE22B-DATA_FDC259
	dw DATA_FDE230-DATA_FDC259
	dw DATA_FDE235-DATA_FDC259
	dw DATA_FDE23A-DATA_FDC259
	dw DATA_FDE244-DATA_FDC259
	dw DATA_FDE249-DATA_FDC259
	dw DATA_FDE24E-DATA_FDC259
	dw DATA_FDE253-DATA_FDC259
	dw DATA_FDE258-DATA_FDC259
	dw DATA_FDE25D-DATA_FDC259
	dw DATA_FDE267-DATA_FDC259
	dw DATA_FDE26C-DATA_FDC259
	dw DATA_FDE271-DATA_FDC259
	dw DATA_FDE276-DATA_FDC259
	dw DATA_FDE27B-DATA_FDC259
	dw DATA_FDE280-DATA_FDC259
	dw DATA_FDE285-DATA_FDC259
	dw DATA_FDE28A-DATA_FDC259
	dw DATA_FDE28F-DATA_FDC259
	dw DATA_FDE29E-DATA_FDC259
	dw DATA_FDE2A3-DATA_FDC259
	dw DATA_FDE2A8-DATA_FDC259
	dw DATA_FDE2CB-DATA_FDC259
	dw DATA_FDE2E9-DATA_FDC259
	dw DATA_FDE2F3-DATA_FDC259
	dw DATA_FDE2F8-DATA_FDC259
	dw DATA_FDE2FD-DATA_FDC259
	dw DATA_FDE302-DATA_FDC259
	dw DATA_FDE307-DATA_FDC259
	dw DATA_FDE31B-DATA_FDC259
	dw DATA_FDE320-DATA_FDC259
	dw DATA_FDE32A-DATA_FDC259
	dw DATA_FDE32F-DATA_FDC259
	dw DATA_FDE339-DATA_FDC259
	dw DATA_FDE33E-DATA_FDC259
	dw DATA_FDE343-DATA_FDC259
	dw DATA_FDE348-DATA_FDC259
	dw DATA_FDE357-DATA_FDC259
	dw DATA_FDE366-DATA_FDC259
	dw DATA_FDE36B-DATA_FDC259
	dw DATA_FDE370-DATA_FDC259
	dw DATA_FDE375-DATA_FDC259
	dw DATA_FDE37F-DATA_FDC259
	dw DATA_FDE384-DATA_FDC259
	dw DATA_FDE389-DATA_FDC259
	dw DATA_FDE393-DATA_FDC259
	dw DATA_FDE398-DATA_FDC259
	dw DATA_FDE3A2-DATA_FDC259
	dw DATA_FDE3A7-DATA_FDC259
	dw DATA_FDE3AC-DATA_FDC259
	dw DATA_FDE3B1-DATA_FDC259
	dw DATA_FDE3B6-DATA_FDC259
	dw DATA_FDE3BB-DATA_FDC259
	dw DATA_FDE3C0-DATA_FDC259
	dw DATA_FDE3C5-DATA_FDC259
	dw DATA_FDE3CA-DATA_FDC259
	dw DATA_FDE3CF-DATA_FDC259
	dw DATA_FDE3D4-DATA_FDC259
	dw DATA_FDE3D9-DATA_FDC259
	dw DATA_FDE3DE-DATA_FDC259
	dw DATA_FDE3E3-DATA_FDC259
	dw DATA_FDE3E8-DATA_FDC259
	dw DATA_FDE3ED-DATA_FDC259
	dw DATA_FDE3F2-DATA_FDC259
	dw DATA_FDE3F7-DATA_FDC259
	dw DATA_FDE3FC-DATA_FDC259
	dw DATA_FDE401-DATA_FDC259
	dw DATA_FDE406-DATA_FDC259
	dw DATA_FDE40B-DATA_FDC259
	dw DATA_FDE410-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259	;From here on it points to a sprite graphic instead
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259
	dw DATA_FDE415-DATA_FDC259

DATA_FDC3F9:
	db $04,$00,$04,$07,$12
	db $70,$81,$04,$02,$0E

DATA_FDC403:
	db $A0,$80,$04,$26,$0E

DATA_FDC408:
	db $00,$C0,$02,$30,$1C

DATA_FDC40D:
	db $00,$E0,$02,$30,$1B
	db $91,$E1,$00,$17,$02

DATA_FDC417:
	db $00,$E0,$02,$30,$1B
	db $91,$01,$00,$17,$09

DATA_FDC421:
	db $00,$00,$00,$30,$32

DATA_FDC426:
	db $40,$E0,$01,$10,$0E
	db $60,$00,$0C,$10,$0E
	db $30,$E3,$17,$22,$0E
	db $A0,$C3,$11,$10,$0E
	db $40,$86,$05,$18,$0E
	db $40,$07,$17,$10,$0E
	db $C0,$0A,$06,$38,$0E

DATA_FDC449:
	db $80,$01,$04,$10,$0E
	db $D0,$61,$09,$27,$0E
	db $F0,$82,$1B,$10,$0E
	db $E0,$86,$1B,$23,$0E
	db $40,$47,$13,$6F,$0E
	db $94,$4B,$1B,$14,$0E
	db $10,$CD,$08,$10,$0E
	db $D0,$AD,$1A,$10,$13

DATA_FDC471:
	db $50,$84,$8F,$0C,$3A
	db $60,$0C,$CE,$1D,$37
	db $F0,$98,$CF,$35,$3A
	db $80,$AF,$ED,$62,$36
	db $C0,$BF,$66,$83,$28
	db $90,$D0,$65,$A5,$26

DATA_FDC48F:
	db $00,$80,$2B,$1E,$0E
	db $30,$C1,$22,$1C,$12
	db $60,$02,$10,$10,$0E
	db $B0,$22,$1F,$10,$0E
	db $50,$84,$2B,$47,$0E
	db $20,$46,$17,$1E,$0E
	db $E0,$C7,$25,$3C,$0E
	db $10,$49,$15,$22,$0E
	db $20,$8D,$03,$10,$0E
	db $C0,$AD,$1A,$25,$0E
	db $F0,$F1,$04,$10,$0E

DATA_FDC4C6:
	db $40,$05,$60,$0E,$1B
	db $60,$32,$05,$6D,$25
	db $80,$3A,$00,$80,$1B

DATA_FDC4D5:
	db $C0,$46,$10,$10,$0E
	db $D0,$68,$0E,$18,$0E
	db $70,$8A,$1C,$10,$0E
	db $60,$0B,$0F,$10,$0E
	db $90,$10,$8C,$1F,$0E

DATA_FDC4EE:
	db $B0,$12,$40,$D9,$01

DATA_FDC4F3:
	db $A0,$82,$20,$09,$1C

DATA_FDC4F8:
	db $04,$80,$A4,$03,$24
	db $E4,$01,$E6,$08,$29
	db $84,$84,$A4,$0C,$3E
	db $64,$86,$C4,$0F,$24
	db $F4,$87,$24,$12,$24
	db $24,$89,$45,$14,$29
	db $34,$0A,$A9,$1A,$3E
	db $64,$0D,$87,$1D,$29
	db $D4,$0E,$69,$23,$3E
	db $C4,$91,$66,$25,$28
	db $C4,$92,$68,$27,$3E
	db $C4,$13,$85,$2B,$3E
	db $D4,$95,$64,$2E,$25
	db $44,$97,$88,$35,$3E
	db $D4,$9A,$A4,$39,$29
	db $E4,$9C,$C4,$3B,$24
	db $F4,$1D,$C5,$3D,$25
	db $F4,$9E,$C6,$3F,$29
	db $F4,$1F,$A9,$45,$3E
	db $E4,$A2,$A4,$48,$29
	db $64,$A4,$E4,$4D,$24
	db $04,$A7,$44,$56,$29
	db $34,$AB,$44,$58,$24
	db $34,$AC,$46,$5A,$28
	db $34,$AD,$E8,$61,$3E
	db $04,$31,$07,$64,$29
	db $14,$B2,$C8,$6A,$3E
	db $74,$B5,$C8,$75,$3E
	db $F4,$BA,$49,$78,$3E
	db $34,$3C,$C7,$7A,$3E
	db $74,$BD,$A4,$7D,$29
	db $E4,$3E,$05,$81,$25
	db $94,$40,$06,$83,$28
	db $94,$C1,$E8,$89,$3D
	db $04,$C5,$46,$8C,$29
	db $34,$C6,$E6,$8E,$29
	db $84,$47,$08,$98,$3D
	db $14,$CC,$24,$9B,$29
	db $A4,$CD,$A4,$A0,$25
	db $64,$D0,$04,$A5,$24
	db $94,$D2,$05,$A7,$29
	db $94,$D3,$67,$AF,$3E
	db $C4,$D7,$65,$B4,$29
	db $40,$DA,$64,$B8,$26

DATA_FDC5D4:
	db $B4,$5D,$10,$11,$AC
	db $C0,$5F,$1D,$16,$E0

DATA_FDC5DE:
	db $A1,$48,$01,$5D,$FF
	db $40,$E9,$22,$26,$2A

DATA_FDC5E8:
	db $34,$C0,$81,$84,$18
	db $54,$C2,$81,$06,$11
	db $54,$C3,$C1,$88,$18
	db $70,$C4,$E1,$0A,$11

DATA_FDC5FC:
	db $04,$C0,$E0,$83,$0F
	db $F4,$40,$E8,$06,$1F
	db $05,$C2,$E0,$06,$10
	db $80,$C3,$E0,$88,$17

DATA_FDC610:
	db $01,$C0,$E0,$08,$14
	db $00,$40,$AA,$04,$27

DATA_FDC61A:
	db $00,$20,$04,$58,$0E
	db $31,$00,$00,$14,$13

DATA_FDC624:
	db $00,$00,$E0,$D3,$02

DATA_FDC629:
	db $00,$00,$00,$18,$1A

DATA_FDC62E:
	db $40,$80,$01,$20,$16

DATA_FDC633:
	db $11,$20,$42,$C8,$06
	db $91,$10,$40,$D7,$81
	db $91,$F0,$40,$37,$84
	db $90,$68,$43,$37,$09

DATA_FDC647:
	db $10,$00,$C0,$07,$1B
	db $80,$60,$E1,$74,$04

DATA_FDC651:
	db $00,$00,$E0,$07,$1C

DATA_FDC656:
	db $04,$00,$68,$05,$35
	db $C4,$82,$C8,$0A,$35
	db $74,$05,$6D,$0F,$35
	db $C4,$87,$A7,$1C,$35
	db $64,$8E,$67,$23,$35
	db $C4,$11,$A7,$26,$29
	db $64,$13,$49,$31,$35
	db $B4,$98,$E7,$33,$35
	db $04,$9A,$EE,$39,$3E
	db $04,$1D,$8D,$3C,$35
	db $54,$9E,$67,$41,$3E
	db $C4,$A0,$C8,$45,$3E
	db $F4,$22,$CA,$4C,$35
	db $74,$26,$2A,$53,$35
	db $A4,$29,$CB,$57,$35
	db $F4,$2B,$6B,$5A,$35
	db $44,$AD,$08,$5D,$2C
	db $90,$AE,$69,$61,$2E

DATA_FDC6B0:
	db $04,$00,$CC,$03,$33
	db $F4,$01,$AA,$08,$33
	db $64,$04,$6D,$23,$3E
	db $C4,$11,$68,$28,$3E
	db $44,$14,$0D,$2D,$3E
	db $94,$16,$88,$2F,$7E
	db $D4,$97,$A8,$42,$3E
	db $64,$21,$8D,$45,$7E
	db $D4,$22,$0D,$49,$3E
	db $94,$24,$2D,$50,$3E
	db $24,$28,$C8,$5B,$3E
	db $F4,$AD,$0A,$61,$35
	db $94,$30,$6D,$73,$3E
	db $C4,$39,$2B,$82,$3E
	db $24,$41,$2D,$8F,$3E
	db $A4,$47,$0D,$92,$3E
	db $14,$C9,$C8,$94,$39
	db $70,$CA,$67,$9A,$2A

DATA_FDC70A:
	db $04,$00,$4C,$06,$35
	db $34,$83,$AA,$08,$35
	db $64,$04,$ED,$0B,$35
	db $04,$86,$91,$10,$3E
	db $54,$88,$89,$14,$3E
	db $54,$8A,$F1,$1C,$3E
	db $84,$0E,$AD,$20,$35
	db $64,$10,$ED,$30,$3E
	db $84,$98,$8B,$36,$3E
	db $54,$9B,$91,$52,$3E
	db $54,$29,$0A,$66,$3E
	db $14,$B3,$F1,$75,$3E
	db $04,$3B,$8D,$78,$35
	db $50,$3C,$6B,$7C,$31

DATA_FDC750:
	db $08,$A0,$03,$10,$36
	db $14,$A0,$1B,$94,$0E
	db $24,$80,$15,$09,$0F
	db $B4,$81,$16,$13,$15
	db $05,$A2,$03,$0B,$1A
	db $04,$A2,$08,$1E,$11
	db $B4,$A3,$03,$03,$0E
	db $E4,$63,$17,$00,$0F
	db $E1,$A4,$00,$10,$0A
	db $E4,$A4,$03,$16,$10
	db $E8,$A4,$08,$10,$36
	db $E8,$A4,$12,$10,$38
	db $E0,$A6,$08,$20,$0E
	db $E4,$A6,$0D,$13,$0E
	db $E4,$C6,$12,$60,$0C
	db $E4,$A6,$17,$00,$0E
	db $40,$47,$03,$2A,$0E
	db $E4,$A7,$17,$2D,$0E
	db $E5,$28,$00,$2D,$0B
	db $14,$A9,$0C,$15,$18
	db $54,$AA,$1B,$19,$0E
	db $65,$AB,$0D,$18,$0D
	db $75,$0B,$91,$17,$00
	db $B2,$AB,$17,$2F,$12
	db $B4,$2C,$00,$0F,$11
	db $B4,$0C,$08,$1A,$1A
	db $E0,$AC,$1B,$1C,$05
	db $E1,$AD,$0D,$10,$1B
	db $E0,$CD,$12,$10,$0C
	db $A4,$2E,$00,$10,$0E
	db $54,$2F,$09,$04,$11
	db $91,$10,$0A,$19,$02
	db $A1,$30,$00,$10,$41
	db $21,$11,$0C,$10,$6F
	db $20,$B1,$1B,$1D,$0E

DATA_FDC7FF:
	db $04,$80,$18,$04,$0E
	db $14,$20,$27,$1C,$0E
	db $45,$00,$0A,$29,$17
	db $24,$A1,$0E,$16,$1A
	db $45,$81,$19,$1B,$0D
	db $44,$E1,$1C,$1B,$0C
	db $D4,$22,$27,$23,$12
	db $84,$23,$0F,$13,$1E
	db $D4,$A3,$07,$1C,$2A
	db $F4,$03,$1C,$00,$0C
	db $76,$A4,$16,$13,$1D
	db $F4,$04,$1C,$0B,$13
	db $B4,$25,$0F,$00,$1E
	db $04,$26,$27,$1C,$0E
	db $95,$A6,$07,$1D,$0E
	db $A5,$A6,$15,$0C,$16
	db $A5,$C6,$1C,$17,$0D
	db $B5,$26,$0E,$16,$1E
	db $C5,$06,$02,$10,$0F
	db $C1,$A6,$85,$0F,$02
	db $C1,$26,$8B,$10,$0A
	db $C2,$A6,$93,$12,$02
	db $C1,$26,$9A,$10,$07
	db $C1,$26,$A0,$10,$02
	db $C5,$26,$22,$10,$1A
	db $64,$A8,$15,$1A,$0E
	db $C4,$28,$00,$14,$1E
	db $C4,$28,$22,$1F,$16
	db $C4,$28,$27,$1D,$0E
	db $18,$29,$0E,$3C,$16
	db $14,$A9,$1C,$07,$1C
	db $64,$A9,$07,$1A,$16
	db $84,$AA,$1C,$24,$19
	db $04,$0B,$02,$00,$12
	db $08,$AB,$13,$1C,$26
	db $94,$2B,$27,$22,$12
	db $B4,$2B,$23,$15,$0E
	db $00,$0C,$02,$10,$3B
	db $C0,$0D,$13,$10,$0E
	db $C4,$AD,$16,$03,$0E
	db $C4,$AD,$1C,$00,$0F
	db $D5,$AD,$0B,$2B,$0F
	db $D4,$4D,$0F,$1F,$0D
	db $04,$2E,$21,$0C,$1E
	db $B0,$2E,$27,$40,$0E
	db $C4,$AE,$1A,$0C,$21
	db $F4,$AE,$16,$00,$0E
	db $C4,$2F,$22,$00,$16
	db $F0,$AF,$16,$29,$0A
	db $84,$B0,$1C,$01,$11
	db $C1,$70,$0F,$1C,$2C
	db $C0,$30,$22,$1D,$0E
	db $80,$B1,$0B,$10,$0F
	db $91,$B1,$1C,$10,$1E

DATA_FDC90D:
	db $20,$A0,$1C,$20,$0E
	db $25,$A1,$00,$10,$0E
	db $21,$21,$04,$10,$B6
	db $24,$A3,$00,$21,$0E
	db $44,$23,$16,$10,$15
	db $85,$23,$06,$31,$15
	db $84,$83,$0A,$10,$23
	db $41,$25,$16,$01,$1A
	db $44,$25,$1B,$5C,$0E
	db $84,$25,$0D,$07,$0E
	db $34,$A6,$00,$20,$11
	db $65,$26,$16,$10,$1A
	db $F4,$26,$0D,$24,$11
	db $94,$27,$06,$3A,$19
	db $64,$28,$16,$15,$0E
	db $34,$A9,$00,$66,$0E
	db $34,$2A,$0D,$0D,$0E
	db $B4,$2A,$16,$0F,$0E
	db $04,$2C,$0D,$05,$26
	db $04,$8C,$1B,$09,$13
	db $34,$2C,$06,$07,$13
	db $A4,$2C,$16,$15,$14
	db $58,$8D,$0F,$19,$13
	db $65,$0D,$0C,$18,$0E
	db $94,$0D,$1C,$0A,$17
	db $A4,$2D,$06,$15,$11
	db $F4,$2E,$16,$0D,$12
	db $30,$2F,$1D,$38,$0E
	db $E5,$0F,$0C,$0E,$15
	db $E0,$6F,$10,$0D,$0C
	db $F4,$2F,$06,$11,$0E
	db $91,$B0,$00,$27,$11
	db $C4,$30,$16,$00,$0E
	db $C0,$11,$0C,$10,$5F
	db $00,$92,$04,$10,$1B

DATA_FDC9BC:
	db $04,$00,$E1,$01,$1D
	db $04,$01,$21,$04,$1D
	db $24,$02,$26,$07,$27
	db $A4,$03,$23,$0A,$27
	db $24,$05,$E0,$0E,$1E
	db $84,$87,$82,$11,$20
	db $D4,$88,$23,$16,$22
	db $24,$8B,$62,$1A,$20
	db $44,$8D,$A1,$1C,$1E
	db $64,$8E,$A2,$1E,$20
	db $64,$0F,$A6,$22,$27
	db $64,$11,$C3,$28,$21
	db $74,$14,$03,$2F,$23
	db $94,$97,$01,$31,$1E
	db $94,$18,$C3,$33,$28
	db $F4,$99,$C8,$35,$2C
	db $F4,$9A,$CA,$39,$31
	db $F4,$9C,$69,$3E,$2E
	db $44,$1F,$03,$44,$6E
	db $14,$22,$23,$46,$21
	db $24,$23,$20,$4D,$1D
	db $A4,$A6,$21,$4F,$1E
	db $A4,$27,$C4,$53,$23
	db $F4,$A9,$E3,$55,$21
	db $04,$2B,$E5,$57,$2B
	db $04,$AC,$E6,$59,$2D
	db $04,$2D,$C9,$62,$2D
	db $74,$31,$E5,$64,$25
	db $84,$32,$61,$67,$1D
	db $C4,$B3,$40,$6C,$20
	db $34,$36,$A1,$6E,$1D
	db $64,$37,$84,$74,$26
	db $54,$3A,$E0,$79,$1D
	db $04,$3D,$01,$7D,$1D
	db $94,$3E,$21,$81,$21
	db $A4,$C0,$26,$85,$2B
	db $A4,$42,$48,$87,$2B
	db $B4,$C3,$84,$89,$29
	db $D0,$C4,$61,$8E,$1E

DATA_FDCA7F:
	db $04,$80,$EE,$04,$38
	db $84,$02,$F0,$08,$3B
	db $84,$84,$2D,$0D,$36
	db $A4,$86,$D0,$11,$3C
	db $F4,$88,$EE,$16,$38
	db $84,$8B,$0C,$1B,$34
	db $94,$0D,$0A,$1D,$2D
	db $94,$8E,$2C,$20,$34
	db $24,$10,$AE,$25,$37
	db $E4,$92,$4C,$2B,$3A
	db $B4,$95,$AE,$2D,$38
	db $E4,$96,$AC,$2F,$34
	db $E4,$17,$CB,$31,$31
	db $F4,$98,$AE,$35,$3A
	db $E4,$9A,$EF,$39,$3A
	db $04,$1D,$90,$3E,$3D
	db $54,$9F,$4E,$42,$39
	db $34,$21,$AB,$46,$31
	db $64,$23,$49,$4E,$2D
	db $34,$27,$8A,$58,$30
	db $54,$2C,$45,$5B,$2C
	db $B4,$AD,$E3,$5D,$22
	db $04,$2F,$A6,$60,$2C
	db $64,$30,$8A,$65,$30
	db $D4,$B2,$E8,$69,$2C
	db $04,$35,$6A,$6F,$30
	db $C4,$37,$68,$71,$2B
	db $C4,$38,$C8,$77,$2B
	db $F4,$BB,$46,$7C,$28
	db $34,$BE,$C7,$83,$2B
	db $F4,$C1,$C9,$85,$2E
	db $F4,$42,$0C,$8A,$33
	db $14,$C5,$C7,$8C,$2C
	db $74,$46,$E3,$91,$26
	db $04,$C9,$84,$94,$24
	db $54,$CA,$E3,$96,$22
	db $84,$4B,$07,$99,$2A
	db $94,$4C,$AB,$9C,$31
	db $64,$4E,$6E,$9F,$38
	db $C4,$CF,$82,$A5,$78
	db $D0,$D2,$E2,$AA,$20

DATA_FDCB4C:
	db $04,$00,$00,$34,$A0
	db $44,$04,$04,$21,$EC
	db $54,$07,$20,$32,$EC
	db $74,$0B,$1C,$00,$DC
	db $74,$0C,$18,$10,$CC
	db $74,$0E,$1F,$0D,$E8
	db $44,$10,$19,$00,$D0
	db $44,$11,$15,$24,$C0
	db $84,$14,$0D,$00,$A0
	db $84,$15,$04,$00,$7C
	db $84,$16,$09,$10,$BC
	db $84,$18,$14,$00,$BC
	db $84,$19,$0D,$40,$A0
	db $84,$1E,$05,$05,$80
	db $D4,$1F,$05,$21,$CC
	db $E4,$22,$18,$00,$CC
	db $E4,$23,$12,$00,$B4
	db $E4,$24,$0D,$00,$A0
	db $E4,$25,$09,$00,$90
	db $E4,$26,$0B,$0C,$98
	db $A4,$28,$0D,$0E,$BC
	db $84,$2A,$14,$1B,$BC
	db $34,$2D,$0E,$01,$A4
	db $44,$2E,$06,$00,$84
	db $44,$2F,$0C,$14,$AC
	db $84,$31,$08,$1D,$B8
	db $54,$34,$13,$62,$B8
	db $74,$3B,$0E,$08,$A4
	db $F4,$3C,$0E,$00,$DC
	db $F4,$3D,$17,$00,$DC
	db $F4,$3E,$1C,$0A,$DC
	db $94,$40,$11,$0F,$DC
	db $84,$42,$0D,$21,$B4
	db $94,$45,$12,$1D,$DC
	db $64,$48,$0B,$00,$98
	db $64,$49,$03,$06,$78
	db $C4,$4A,$08,$00,$98
	db $C4,$4B,$14,$00,$BC
	db $C4,$4C,$0B,$04,$BC
	db $04,$4E,$0B,$19,$98
	db $94,$50,$14,$31,$BC
	db $A4,$54,$11,$24,$C4
	db $E4,$57,$1C,$15,$DC
	db $34,$5A,$12,$00,$BC
	db $34,$5B,$0D,$04,$A0
	db $74,$5C,$0C,$04,$9C
	db $B4,$5D,$0C,$00,$9C
	db $B4,$5E,$14,$00,$BC
	db $B4,$5F,$17,$30,$C8
	db $B4,$63,$17,$37,$C8
	db $24,$68,$15,$04,$C0
	db $64,$69,$13,$53,$B8
	db $94,$6F,$00,$45,$B8
	db $E4,$74,$11,$01,$BC
	db $F4,$75,$1C,$14,$DC
	db $34,$78,$14,$00,$BC
	db $34,$79,$0C,$27,$9C
	db $A4,$7C,$11,$00,$D0
	db $A4,$7D,$19,$10,$D0
	db $A0,$7F,$11,$2A,$B0

DATA_FDCC78:
	db $01,$20,$E2,$CA,$08
	db $01,$08,$E6,$7A,$10
	db $01,$B0,$E9,$3A,$18
	db $09,$28,$14,$98,$2C
	db $81,$00,$A0,$FA,$02
	db $81,$80,$E1,$3A,$04
	db $81,$68,$E4,$0A,$0C
	db $81,$40,$E8,$5A,$13
	db $81,$A0,$F0,$EA,$23
	db $82,$F8,$F1,$4B,$28
	db $B1,$50,$F6,$EA,$2F
	db $B0,$F8,$57,$B5,$32
	db $D1,$21,$EC,$6A,$1A
	db $D1,$39,$ED,$EB,$1E
	db $D1,$79,$EF,$3A,$21
	db $10,$2C,$F4,$5A,$29
	db $11,$8C,$F5,$9A,$2C

DATA_FDCCCD:
	db $09,$70,$E9,$C3,$17
	db $01,$E8,$EB,$AA,$18
	db $82,$50,$E3,$1A,$08
	db $82,$10,$E4,$74,$0C
	db $84,$40,$E6,$33,$0E
	db $81,$58,$EC,$6A,$1D
	db $81,$00,$F0,$7A,$22
	db $81,$40,$F1,$04,$28
	db $84,$08,$F4,$46,$2A
	db $8A,$08,$F6,$F4,$32
	db $84,$80,$F9,$C3,$34
	db $A0,$D0,$FE,$BA,$3F
	db $F1,$01,$A0,$BA,$01
	db $F1,$E1,$E0,$CA,$02
	db $F1,$59,$FC,$AA,$3C
	db $01,$42,$E6,$4A,$0F
	db $01,$72,$E9,$6A,$16
	db $01,$3A,$EB,$C7,$17
	db $01,$82,$F9,$2A,$36
	db $21,$C2,$E2,$9A,$06
	db $82,$0A,$76,$1B,$2F
	db $81,$BA,$F8,$FA,$32
	db $90,$92,$57,$D7,$30
	db $81,$6B,$E1,$7A,$05
	db $80,$13,$E4,$DA,$09
	db $81,$AB,$E7,$DA,$12
	db $81,$BB,$EE,$FA,$1F
	db $81,$0B,$F4,$0A,$2C
	db $81,$1B,$FB,$AA,$38
	db $81,$5B,$FE,$9A,$3D
	db $C1,$93,$77,$6B,$31

DATA_FDCD68:
	db $09,$30,$40,$C5,$03
	db $81,$E8,$E1,$64,$0C
	db $84,$38,$86,$26,$0E
	db $88,$B8,$E8,$44,$1C
	db $85,$88,$F5,$A4,$34
	db $81,$58,$DA,$97,$36
	db $94,$C8,$E7,$44,$11
	db $B4,$08,$3F,$C5,$3F
	db $14,$FA,$F2,$A6,$A7
	db $11,$52,$FB,$4A,$38
	db $28,$5A,$10,$E7,$23
	db $84,$7A,$E7,$16,$13
	db $84,$FA,$0C,$47,$1C
	db $84,$7A,$F4,$B6,$2C
	db $A4,$E2,$3E,$B7,$3F
	db $B5,$42,$40,$67,$02
	db $B0,$3A,$A1,$CA,$03
	db $51,$0B,$E6,$DA,$0E
	db $80,$73,$E7,$CA,$12
	db $81,$7B,$F3,$DA,$2C
	db $80,$73,$F6,$CA,$AD
	db $91,$4B,$ED,$9A,$22
	db $91,$53,$F1,$EA,$26
	db $91,$2B,$FC,$AA,$3D
	db $A0,$DB,$FE,$4A,$3F
	db $B1,$53,$40,$6B,$02

DATA_FDCDEA:
	db $25,$68,$2D,$C5,$1C
	db $21,$68,$EE,$0B,$1E
	db $C1,$70,$A0,$6B,$02
	db $C1,$38,$E1,$4B,$03
	db $C1,$50,$E2,$5B,$06
	db $C1,$30,$C3,$78,$08
	db $C1,$60,$E8,$7B,$12
	db $C1,$40,$69,$95,$14
	db $C1,$50,$CA,$78,$16
	db $C1,$08,$EF,$FB,$20
	db $C1,$F0,$F0,$4B,$23
	db $C1,$A8,$D1,$08,$25
	db $C2,$68,$D4,$D8,$2A
	db $C0,$70,$55,$B4,$2B
	db $C8,$68,$78,$05,$37
	db $E0,$00,$BD,$B8,$3B
	db $41,$02,$A0,$DB,$00
	db $41,$72,$F5,$AB,$2C
	db $41,$42,$FC,$FB,$39
	db $51,$AA,$E1,$9B,$04
	db $51,$42,$C4,$88,$0A
	db $51,$4A,$E5,$4B,$0C
	db $51,$82,$E7,$BB,$10
	db $51,$42,$EB,$3B,$18
	db $51,$82,$F0,$DB,$21
	db $51,$8A,$D2,$C8,$28
	db $A1,$52,$ED,$CB,$1C
	db $C1,$4A,$F8,$4B,$32
	db $C4,$CA,$FA,$27,$37
	db $01,$2C,$E6,$FB,$0E
	db $01,$24,$EC,$9B,$1A
	db $01,$5C,$F6,$8B,$30
	db $00,$2C,$F9,$FB,$33
	db $01,$DC,$FA,$7B,$38

DATA_FDCE94:
	db $04,$00,$29,$03,$2D
	db $A4,$81,$A7,$0A,$2A
	db $64,$05,$86,$0F,$27
	db $D4,$87,$87,$13,$2A
	db $D4,$09,$49,$19,$3E
	db $B4,$8C,$C8,$1B,$2C
	db $F4,$0D,$06,$20,$27
	db $14,$10,$07,$22,$29
	db $14,$91,$25,$26,$26
	db $24,$93,$C8,$29,$2C
	db $F8,$94,$88,$2F,$3E
	db $D5,$97,$04,$3D,$25
	db $D4,$17,$13,$3D,$3E
	db $94,$1E,$08,$43,$2E
	db $94,$A1,$69,$45,$2E
	db $C4,$A2,$64,$48,$2B
	db $44,$A4,$E8,$4A,$2E
	db $84,$25,$69,$51,$3E
	db $C4,$28,$73,$58,$3E
	db $F4,$A9,$64,$58,$24
	db $44,$AC,$04,$5C,$3E
	db $14,$AE,$E8,$5E,$2C
	db $84,$2F,$87,$65,$29
	db $D4,$B2,$E8,$67,$2C
	db $04,$B4,$A8,$6C,$3E
	db $65,$B6,$46,$6F,$29
	db $A4,$36,$55,$6F,$3D
	db $B8,$37,$06,$77,$3D
	db $95,$BB,$A4,$87,$28
	db $90,$BB,$B4,$87,$3E
	db $E4,$C3,$C5,$8E,$28
	db $74,$C7,$25,$93,$3E
	db $A0,$C9,$13,$A1,$3E
	db $75,$CA,$05,$A1,$26
	db $94,$D0,$E4,$A6,$24
	db $80,$D3,$E5,$AA,$26

DATA_FDCF48:
	db $04,$80,$E4,$01,$24
	db $04,$81,$84,$06,$25
	db $54,$83,$C4,$0C,$24
	db $74,$86,$04,$0F,$28
	db $94,$87,$C4,$12,$24
	db $74,$89,$C4,$1A,$24
	db $74,$0D,$C7,$20,$35
	db $74,$10,$47,$24,$29
	db $34,$12,$05,$2A,$25
	db $14,$95,$E4,$2D,$24
	db $04,$97,$E5,$30,$26
	db $84,$18,$E6,$34,$3B
	db $84,$1A,$06,$3E,$36
	db $14,$1F,$05,$41,$29
	db $94,$A0,$04,$43,$24
	db $94,$21,$85,$48,$25
	db $54,$A4,$E4,$4E,$24
	db $84,$A7,$04,$5A,$29
	db $14,$AD,$24,$5C,$24
	db $24,$2E,$A5,$5E,$25
	db $64,$2F,$07,$63,$29
	db $94,$31,$C6,$69,$36
	db $F4,$B4,$24,$78,$28
	db $24,$BC,$64,$7A,$24
	db $44,$BD,$E6,$7E,$28
	db $84,$3F,$C6,$86,$37
	db $74,$C3,$E4,$89,$29
	db $04,$C5,$E4,$8B,$24
	db $04,$C6,$24,$8E,$29
	db $24,$C7,$A5,$9B,$35
	db $E4,$CD,$24,$9F,$29
	db $A0,$CF,$E4,$AE,$24

DATA_FDCFE8:
	db $04,$80,$A4,$03,$24
	db $E4,$01,$E6,$08,$29
	db $84,$84,$A4,$0C,$3E
	db $64,$86,$C4,$0F,$24
	db $F4,$87,$24,$12,$24
	db $24,$89,$45,$14,$29
	db $34,$0A,$A9,$1A,$3E
	db $64,$0D,$87,$1D,$29
	db $D4,$0E,$69,$23,$3E
	db $C4,$91,$66,$25,$28
	db $C4,$92,$68,$27,$3E
	db $C4,$13,$85,$2B,$3E
	db $D4,$95,$64,$2E,$25
	db $44,$97,$88,$35,$3E
	db $D4,$9A,$A4,$39,$29
	db $E4,$9C,$C4,$3B,$24
	db $F4,$1D,$C5,$3D,$25
	db $F4,$9E,$C6,$3F,$29
	db $F4,$1F,$A9,$45,$3E
	db $E4,$A2,$A4,$48,$29
	db $64,$A4,$E4,$4D,$24
	db $04,$A7,$44,$56,$29
	db $34,$AB,$44,$58,$24
	db $34,$AC,$46,$5A,$28
	db $34,$AD,$E8,$61,$3E
	db $04,$31,$07,$64,$29
	db $14,$B2,$C8,$6A,$3E
	db $74,$B5,$C8,$75,$3E
	db $F4,$BA,$49,$78,$3E
	db $34,$3C,$C7,$7A,$3E
	db $74,$BD,$A4,$7D,$29
	db $E4,$3E,$A5,$7F,$25
	db $E4,$BF,$A6,$81,$28
	db $E4,$C0,$E8,$89,$3D
	db $04,$C5,$46,$8C,$29
	db $34,$C6,$E6,$8E,$29
	db $84,$47,$08,$98,$3D
	db $14,$CC,$24,$9B,$29
	db $A4,$CD,$A4,$A0,$25
	db $64,$D0,$04,$A5,$24
	db $94,$D2,$05,$A7,$29
	db $94,$D3,$67,$AF,$3E
	db $C4,$D7,$65,$B4,$29
	db $40,$DA,$64,$B8,$26

DATA_FDD0C4:
	db $34,$C0,$16,$10,$24
	db $42,$00,$00,$38,$0E
	db $61,$80,$03,$10,$4A
	db $65,$80,$0E,$29,$0E
	db $C0,$00,$12,$22,$17
	db $34,$E2,$17,$41,$1B
	db $75,$C2,$0B,$08,$08
	db $A4,$82,$03,$10,$2A
	db $F4,$C3,$0B,$10,$10
	db $05,$A4,$0F,$46,$13
	db $01,$C4,$13,$44,$10
	db $A4,$E4,$05,$1F,$15
	db $04,$05,$00,$19,$1A
	db $F4,$C5,$0A,$1B,$16
	db $40,$87,$17,$10,$1A
	db $94,$07,$00,$10,$40
	db $A4,$E8,$09,$10,$1B
	db $61,$89,$0F,$10,$33
	db $70,$A9,$17,$36,$19
	db $94,$09,$00,$05,$0E
	db $A1,$EA,$09,$23,$18
	db $E1,$0A,$00,$12,$10
	db $E4,$CA,$03,$27,$1E
	db $D1,$AB,$0E,$10,$3A
	db $E8,$4D,$0C,$11,$64
	db $54,$CE,$03,$0B,$1A
	db $F0,$2F,$0C,$11,$0F
	db $F0,$8F,$16,$10,$12
	db $01,$30,$04,$10,$32

DATA_FDD155:
	db $04,$00,$00,$10,$16
	db $88,$60,$06,$10,$37
	db $99,$20,$0F,$10,$4C
	db $94,$60,$1A,$13,$0E
	db $04,$02,$01,$19,$0E
	db $84,$62,$06,$12,$16
	db $84,$02,$0B,$3C,$12
	db $91,$02,$10,$31,$08
	db $90,$E2,$15,$03,$0E
	db $C4,$82,$19,$10,$15
	db $D4,$C3,$12,$55,$17
	db $94,$04,$00,$15,$16
	db $A4,$C4,$05,$16,$1B
	db $C4,$84,$1A,$33,$10
	db $E4,$E6,$01,$00,$10
	db $04,$47,$06,$56,$17
	db $44,$07,$0B,$05,$14
	db $E4,$E7,$01,$14,$10
	db $94,$08,$0B,$3C,$2A
	db $F4,$C8,$18,$26,$1D
	db $24,$6A,$01,$11,$0E
	db $24,$0A,$13,$10,$1D
	db $24,$0C,$13,$27,$0E
	db $34,$0C,$00,$23,$1E
	db $54,$6C,$19,$14,$18
	db $54,$ED,$0D,$14,$13
	db $68,$AD,$06,$10,$2B
	db $94,$CE,$16,$0B,$26
	db $64,$8F,$01,$09,$0E
	db $60,$AF,$06,$08,$0E
	db $64,$4F,$0A,$09,$0E
	db $94,$EF,$0D,$10,$38
	db $40,$70,$18,$24,$19
	db $F0,$90,$01,$10,$54
	db $90,$51,$11,$05,$0E

DATA_FDD204:
	db $05,$18,$20,$B7,$02
	db $02,$60,$51,$96,$25
	db $01,$D0,$D2,$D2,$29
	db $04,$F0,$14,$C6,$2B
	db $01,$20,$DC,$9B,$3B
	db $14,$F0,$A6,$65,$10
	db $61,$F8,$41,$46,$07
	db $84,$80,$CC,$47,$1C
	db $A1,$D0,$9D,$38,$3E
	db $C1,$98,$CB,$FB,$18
	db $F0,$20,$9F,$E8,$3F
	db $04,$A9,$A3,$15,$09
	db $01,$F1,$D5,$9A,$2D
	db $01,$D1,$D6,$2A,$31
	db $24,$99,$C4,$07,$0C
	db $35,$11,$C6,$D7,$0D
	db $51,$61,$21,$E7,$03
	db $80,$D1,$D2,$BB,$29
	db $81,$11,$79,$D8,$33
	db $D5,$49,$A8,$17,$13
	db $D1,$91,$89,$87,$15
	db $D1,$C9,$CA,$29,$17
	db $41,$9A,$78,$18,$32
	db $41,$F2,$79,$38,$38
	db $E4,$B2,$C3,$17,$09
	db $E4,$FA,$A6,$67,$10
	db $11,$33,$D5,$DA,$2B
	db $81,$9B,$CE,$EB,$1E
	db $A0,$1B,$20,$E9,$01
	db $E0,$23,$C7,$FB,$12
	db $F1,$B3,$C3,$0B,$0C
	db $F0,$0B,$C6,$2B,$0E
	db $F1,$3B,$CD,$2B,$1D
	db $F1,$7B,$CF,$9B,$25

DATA_FDD2AE:
	db $09,$00,$E0,$49,$03
	db $02,$A8,$E1,$7D,$1B
	db $09,$C0,$ED,$29,$26
	db $01,$18,$53,$88,$2F
	db $00,$C8,$F7,$7D,$3F
	db $01,$05,$E0,$6D,$02
	db $01,$3D,$E1,$4D,$83
	db $01,$C5,$ED,$3D,$9D
	db $00,$A5,$EE,$2D,$26

DATA_FDD2DB:
	db $04,$00,$00,$19,$4C
	db $04,$C0,$14,$19,$5C
	db $85,$20,$11,$11,$0F
	db $92,$02,$00,$FF,$4C
	db $95,$42,$0B,$B5,$3E
	db $90,$C2,$14,$FF,$5C
	db $E1,$4E,$8B,$3A,$3E

DATA_FDD2FE:
	db $04,$E0,$20,$F8,$3E
	db $A5,$80,$15,$1A,$4D
	db $29,$01,$00,$12,$9E
	db $46,$03,$00,$D8,$3A
	db $49,$03,$09,$C4,$B1
	db $80,$10,$09,$0E,$86
	db $80,$B0,$1B,$24,$68
	db $C0,$91,$00,$10,$10

DATA_FDD326:
	db $04,$20,$02,$10,$21
	db $04,$A0,$27,$10,$15
	db $55,$21,$10,$11,$76
	db $64,$A1,$20,$40,$25
	db $04,$22,$02,$18,$29
	db $04,$A2,$27,$0F,$0E
	db $64,$23,$10,$08,$19
	db $F4,$A3,$27,$2A,$14
	db $44,$84,$18,$1C,$2A
	db $84,$24,$02,$1C,$31
	db $E1,$24,$10,$54,$0E
	db $64,$A6,$20,$2E,$15
	db $04,$87,$18,$12,$22
	db $48,$27,$02,$1C,$39
	db $94,$A7,$27,$03,$0E
	db $C4,$A8,$26,$06,$16
	db $24,$A9,$13,$10,$51
	db $06,$2A,$01,$0D,$25
	db $04,$8A,$07,$04,$16
	db $24,$AA,$26,$07,$0D
	db $44,$AA,$20,$10,$0E
	db $24,$0B,$1C,$0C,$0E
	db $35,$0B,$1A,$0B,$02
	db $45,$8B,$07,$10,$2A
	db $44,$8B,$0E,$27,$26
	db $94,$AB,$26,$1B,$1D
	db $D4,$2B,$01,$01,$11
	db $44,$AC,$20,$11,$16
	db $E4,$2C,$01,$09,$19
	db $E4,$AC,$18,$0B,$29
	db $40,$AD,$07,$05,$0E
	db $44,$AE,$27,$0D,$15
	db $54,$8E,$21,$0C,$1F
	db $74,$2E,$02,$1C,$11
	db $90,$AE,$18,$3F,$19
	db $B4,$8E,$0B,$00,$26
	db $B8,$2F,$0A,$0D,$31
	db $14,$90,$22,$06,$3E
	db $30,$31,$02,$19,$19
	db $70,$91,$22,$12,$37
	db $80,$31,$0A,$10,$0E
	db $81,$B1,$0E,$10,$42

DATA_FDD3F8:
	db $05,$80,$1C,$36,$12
	db $08,$60,$29,$1A,$15
	db $55,$80,$06,$13,$10
	db $84,$80,$20,$50,$13
	db $A5,$80,$26,$10,$09
	db $C4,$40,$0A,$2A,$4A
	db $84,$81,$17,$1E,$0E
	db $85,$C2,$05,$0E,$16
	db $A5,$82,$26,$20,$14
	db $A0,$C2,$2A,$18,$0A
	db $64,$84,$04,$0F,$18
	db $60,$84,$11,$2E,$10
	db $65,$84,$17,$10,$3A
	db $A4,$85,$26,$0A,$2C
	db $15,$06,$0E,$14,$0E
	db $54,$86,$05,$34,$20
	db $65,$86,$17,$0F,$0F
	db $78,$26,$1B,$0E,$0B
	db $84,$66,$1E,$08,$1D
	db $44,$07,$29,$4F,$18
	db $04,$88,$20,$05,$14
	db $54,$08,$0E,$27,$2C
	db $55,$88,$17,$19,$16
	db $50,$08,$1C,$0C,$04
	db $54,$29,$21,$03,$0F
	db $88,$2A,$1C,$0E,$37
	db $94,$8A,$07,$12,$10
	db $E4,$8A,$17,$27,$10
	db $C4,$6B,$11,$00,$11
	db $60,$2C,$1C,$2E,$0E
	db $64,$6C,$20,$1E,$11
	db $B4,$8C,$07,$11,$28
	db $C4,$AC,$10,$08,$17
	db $32,$CD,$24,$4E,$0E
	db $34,$4D,$28,$06,$0E
	db $44,$0E,$10,$01,$0E
	db $54,$6E,$14,$11,$29
	db $90,$4E,$28,$38,$16
	db $C4,$8E,$01,$2B,$58
	db $44,$6F,$20,$08,$0E
	db $51,$0F,$0F,$34,$16
	db $60,$90,$13,$29,$40
	db $C1,$90,$20,$15,$14
	db $70,$92,$01,$09,$10

DATA_FDD4D4:
	db $04,$20,$06,$00,$0E
	db $04,$20,$19,$0B,$16
	db $45,$E0,$0F,$10,$1E
	db $44,$60,$15,$37,$0D
	db $01,$81,$00,$14,$12
	db $05,$81,$04,$27,$1B
	db $94,$A1,$1E,$4A,$0E
	db $A4,$A1,$09,$10,$23
	db $B1,$21,$19,$10,$1E
	db $44,$E2,$0F,$30,$0D
	db $95,$43,$00,$51,$0E
	db $A4,$23,$0B,$19,$17
	db $70,$04,$06,$15,$0F
	db $B5,$64,$15,$16,$11
	db $C1,$C4,$03,$10,$04
	db $F4,$44,$19,$12,$0E
	db $34,$26,$0B,$28,$0E
	db $44,$26,$0F,$26,$1B
	db $14,$87,$15,$0F,$25
	db $34,$07,$1D,$09,$1B
	db $C4,$08,$1D,$08,$0E
	db $04,$89,$18,$20,$0F
	db $A4,$69,$00,$3D,$15
	db $A4,$E9,$0F,$1B,$0E
	db $B4,$29,$0B,$26,$17
	db $44,$0A,$1D,$14,$13
	db $04,$4C,$18,$2A,$0E
	db $54,$0C,$10,$23,$1C
	db $84,$0C,$1E,$0C,$13
	db $14,$2D,$0B,$26,$0E
	db $40,$CE,$06,$4C,$0E
	db $44,$0E,$1D,$10,$1B
	db $71,$6E,$00,$1F,$0E
	db $61,$EF,$03,$10,$09
	db $84,$EF,$10,$04,$1E
	db $A2,$4F,$18,$1A,$18
	db $40,$10,$1D,$10,$0B
	db $71,$30,$0B,$29,$17
	db $C0,$B0,$12,$24,$0E
	db $01,$D2,$0F,$10,$09

DATA_FDD59C:
	db $04,$80,$05,$10,$0E
	db $04,$80,$27,$15,$0E
	db $31,$00,$14,$10,$0F
	db $41,$20,$1B,$10,$0E
	db $85,$80,$10,$10,$0E
	db $81,$A0,$17,$11,$0E
	db $84,$A0,$1E,$10,$0E
	db $04,$42,$04,$07,$18
	db $54,$E2,$26,$03,$0E
	db $84,$02,$0F,$14,$1A
	db $84,$22,$1F,$00,$0E
	db $C8,$02,$16,$08,$2D
	db $74,$63,$02,$10,$1F
	db $81,$83,$1F,$0D,$0E
	db $81,$03,$23,$10,$0F
	db $80,$A3,$26,$10,$0B
	db $44,$C4,$15,$01,$0D
	db $44,$04,$1A,$1D,$1A
	db $C4,$24,$11,$00,$0E
	db $54,$65,$15,$00,$0D
	db $75,$65,$02,$11,$0E
	db $A1,$E5,$05,$38,$0E
	db $C1,$65,$11,$10,$0E
	db $50,$E6,$14,$22,$0E
	db $11,$87,$1B,$13,$0E
	db $21,$67,$24,$10,$10
	db $84,$27,$02,$00,$0E
	db $84,$67,$09,$11,$0E
	db $81,$07,$1F,$10,$1D
	db $A4,$27,$28,$11,$14
	db $84,$08,$02,$0F,$0E
	db $C1,$28,$00,$04,$01
	db $95,$89,$09,$0A,$0E
	db $95,$09,$0D,$3A,$0D
	db $B4,$89,$25,$07,$29
	db $74,$4A,$02,$02,$0E
	db $94,$6A,$10,$10,$6F
	db $20,$EB,$28,$24,$0E
	db $30,$8B,$09,$1F,$0D
	db $71,$0B,$06,$10,$0E
	db $81,$0B,$27,$04,$01
	db $95,$8B,$02,$13,$0E
	db $90,$EC,$1B,$10,$13
	db $D2,$8C,$21,$2A,$0E
	db $D1,$0C,$25,$09,$11
	db $A6,$8D,$10,$28,$0E
	db $A1,$0D,$14,$10,$0E
	db $A2,$8D,$17,$56,$0E
	db $C4,$8D,$01,$04,$16
	db $34,$AE,$0C,$05,$0E
	db $74,$0E,$25,$10,$2E
	db $B4,$0E,$1C,$10,$12
	db $00,$0F,$01,$40,$0E
	db $84,$EF,$0C,$0A,$0E
	db $71,$10,$14,$11,$0E
	db $71,$10,$29,$29,$0E
	db $B4,$10,$1B,$05,$1A
	db $C0,$90,$2C,$04,$01
	db $21,$F1,$0C,$10,$2B
	db $01,$12,$1B,$10,$62

DATA_FDD6C8:
	db $05,$00,$0A,$2B,$0E
	db $04,$A0,$0D,$06,$0E
	db $54,$E0,$00,$10,$27
	db $64,$81,$0D,$15,$12
	db $54,$62,$04,$06,$10
	db $E8,$E2,$1A,$10,$2B
	db $B4,$03,$05,$33,$0E
	db $B4,$23,$0A,$00,$0D
	db $B4,$43,$0E,$00,$0E
	db $21,$84,$01,$10,$0E
	db $64,$84,$14,$3C,$0E
	db $B4,$A4,$08,$10,$1D
	db $B4,$C4,$0E,$00,$0E
	db $E4,$84,$1A,$04,$12
	db $E4,$04,$1F,$04,$10
	db $21,$85,$12,$10,$02
	db $B1,$05,$0F,$21,$0E
	db $24,$06,$1A,$14,$0E
	db $24,$86,$1F,$44,$0E
	db $B4,$06,$0A,$07,$0F
	db $E4,$47,$04,$00,$11
	db $24,$48,$09,$07,$10
	db $64,$88,$19,$04,$10
	db $E4,$08,$04,$1D,$0E
	db $24,$09,$11,$10,$2A
	db $21,$C9,$1D,$10,$00
	db $94,$69,$08,$01,$13
	db $A4,$09,$19,$11,$0E
	db $52,$8A,$00,$29,$0E
	db $A4,$6A,$08,$01,$0E
	db $24,$0B,$11,$0C,$0E
	db $64,$0B,$1F,$04,$0E
	db $B0,$0B,$04,$13,$2B
	db $B4,$8B,$18,$03,$10
	db $A4,$8C,$1E,$34,$0E
	db $E0,$0C,$11,$10,$46
	db $F4,$8D,$08,$07,$28
	db $64,$8E,$00,$1D,$2A
	db $61,$8F,$08,$38,$0E
	db $75,$0F,$0E,$10,$36
	db $74,$8F,$16,$19,$0E
	db $E4,$70,$1D,$02,$13
	db $35,$91,$00,$1B,$32
	db $70,$11,$0E,$17,$0E
	db $F1,$11,$0C,$0F,$02
	db $00,$92,$16,$0E,$46
	db $E0,$93,$00,$02,$0E

DATA_FDD7B3:
	db $08,$00,$00,$10,$EC
	db $00,$02,$03,$10,$78
	db $04,$02,$20,$38,$EC
	db $84,$06,$1B,$00,$D8
	db $84,$07,$18,$08,$CC
	db $04,$09,$13,$00,$B8
	db $04,$0A,$10,$30,$AC
	db $04,$0E,$14,$00,$C0
	db $04,$0F,$19,$00,$D0
	db $04,$10,$1D,$00,$E0
	db $04,$11,$20,$20,$EC
	db $04,$14,$1B,$00,$D8
	db $04,$15,$18,$38,$CC
	db $84,$19,$13,$00,$B8
	db $84,$1A,$10,$20,$AC
	db $84,$1D,$13,$00,$B8
	db $84,$1E,$18,$10,$CC
	db $84,$20,$13,$00,$B8
	db $84,$21,$10,$1F,$AC
	db $74,$24,$13,$01,$B8
	db $84,$25,$19,$38,$CC
	db $04,$2A,$1B,$00,$D8
	db $04,$2B,$20,$2E,$EC
	db $E4,$2E,$1C,$00,$DC
	db $E4,$2F,$18,$32,$CC
	db $04,$34,$1C,$00,$DC
	db $04,$35,$20,$30,$EC
	db $04,$39,$1B,$00,$D8
	db $04,$3A,$18,$20,$CC
	db $04,$3D,$1B,$00,$D8
	db $04,$3E,$20,$32,$EC
	db $24,$42,$1B,$00,$D8
	db $24,$43,$18,$00,$CC
	db $24,$44,$13,$00,$B8
	db $24,$45,$10,$0E,$AC
	db $04,$47,$13,$00,$B8
	db $04,$48,$18,$00,$CC
	db $04,$49,$1A,$18,$DC
	db $84,$4B,$15,$00,$C0
	db $84,$4C,$11,$00,$B0
	db $84,$4D,$11,$38,$BC
	db $04,$52,$13,$00,$C0
	db $04,$53,$19,$58,$DC
	db $84,$59,$1C,$00,$DC
	db $84,$5A,$20,$0C,$EC
	db $44,$5C,$1C,$00,$DC
	db $44,$5D,$18,$00,$CC
	db $44,$5E,$18,$64,$DC
	db $84,$65,$1B,$00,$D8
	db $84,$66,$20,$00,$EC
	db $84,$67,$21,$14,$F8
	db $C4,$69,$09,$1C,$F4
	db $84,$6C,$1B,$00,$D8
	db $84,$6D,$18,$10,$CC
	db $84,$6F,$1B,$00,$D8
	db $84,$70,$21,$34,$F0
	db $C4,$74,$21,$7C,$F8
	db $84,$7D,$1B,$00,$D8
	db $84,$7E,$18,$00,$CC
	db $84,$7F,$1D,$00,$E0
	db $84,$80,$21,$08,$F0
	db $21,$81,$04,$3E,$7C
	db $00,$82,$20,$0F,$F8

DATA_FDD8EE:
	db $06,$A0,$E7,$F7,$10
	db $01,$80,$E8,$A3,$15
	db $01,$D8,$EA,$67,$17
	db $01,$B8,$EB,$73,$19
	db $01,$C0,$CC,$6B,$1C
	db $01,$88,$AF,$56,$20
	db $04,$30,$D0,$E6,$21
	db $01,$E8,$F2,$F3,$27
	db $01,$00,$D4,$AA,$29
	db $01,$E0,$D6,$A5,$2E
	db $01,$58,$F7,$3B,$31
	db $01,$88,$79,$B3,$34
	db $04,$60,$7A,$B3,$36
	db $15,$10,$D1,$C4,$25
	db $44,$60,$22,$55,$08
	db $51,$D8,$60,$B6,$04
	db $82,$58,$A0,$AA,$01
	db $C1,$D9,$D4,$0A,$2B
	db $C1,$89,$F5,$EB,$2C
	db $C0,$61,$9A,$B7,$36
	db $D2,$A1,$F8,$1B,$33
	db $D1,$91,$99,$B7,$34
	db $11,$52,$CC,$7B,$19
	db $30,$82,$E8,$2B,$14
	db $41,$2A,$EA,$AB,$15
	db $61,$9A,$44,$FA,$0B
	db $70,$72,$F1,$CB,$25
	db $A1,$8A,$E2,$2B,$09
	db $C1,$02,$E6,$BB,$0E
	db $71,$3B,$AE,$EB,$21
	db $80,$DB,$E0,$BB,$04
	db $F1,$7B,$F6,$AB,$2E
	db $01,$64,$E7,$FB,$10
	db $01,$FC,$F0,$DB,$22
	db $00,$94,$F9,$AB,$34

DATA_FDD99D:
	db $61,$28,$E0,$CB,$02
	db $B1,$60,$EA,$29,$18
	db $01,$01,$E2,$E9,$0C
	db $01,$79,$E6,$FB,$10
	db $01,$81,$F1,$A9,$31
	db $31,$81,$E8,$E9,$11
	db $B1,$19,$EC,$09,$19
	db $C0,$D9,$F8,$39,$3E
	db $E1,$F9,$E8,$B9,$14
	db $51,$6A,$81,$F8,$03
	db $61,$A2,$2D,$19,$1E
	db $61,$12,$EF,$BB,$21
	db $61,$E2,$B0,$F8,$22
	db $A1,$8A,$2C,$39,$1B

DATA_FDD9E3:
	db $14,$A0,$29,$20,$19
	db $44,$20,$08,$31,$49
	db $D4,$00,$1E,$14,$3A
	db $14,$03,$1E,$2E,$78
	db $59,$24,$08,$3A,$81
	db $50,$04,$1A,$10,$0A
	db $F8,$26,$1B,$32,$8F
	db $49,$47,$01,$51,$10
	db $45,$07,$05,$0B,$0B
	db $F5,$28,$05,$36,$25
	db $F4,$08,$11,$23,$2A
	db $14,$AB,$1A,$06,$28
	db $18,$8B,$21,$42,$5C
	db $25,$0C,$11,$24,$2A
	db $62,$8C,$0B,$52,$1E
	db $74,$0C,$18,$1F,$3D
	db $51,$4D,$01,$0A,$09
	db $55,$2D,$04,$37,$2D
	db $61,$0F,$11,$22,$12
	db $60,$4F,$1A,$22,$1A
	db $71,$0F,$15,$21,$1C
	db $31,$70,$23,$1D,$0E
	db $30,$D0,$2A,$2D,$12
	db $91,$F0,$26,$17,$11
	db $C0,$31,$04,$14,$15

DATA_FDDA60:
	db $00,$00,$08,$19,$13
	db $15,$E0,$1C,$1D,$16
	db $75,$60,$01,$12,$27
	db $84,$60,$21,$10,$46
	db $41,$61,$0E,$3C,$11
	db $44,$41,$12,$10,$22
	db $84,$E2,$26,$18,$0E
	db $94,$62,$01,$02,$0F
	db $E4,$22,$1C,$00,$15
	db $44,$63,$13,$0B,$19
	db $85,$63,$09,$10,$1A
	db $B4,$63,$01,$00,$1D
	db $E4,$E3,$1C,$14,$24
	db $B4,$64,$02,$03,$15
	db $F4,$64,$13,$02,$0E
	db $04,$05,$25,$08,$1D
	db $84,$65,$09,$00,$0F
	db $E4,$65,$02,$0F,$12
	db $14,$A6,$0F,$05,$2C
	db $24,$A6,$18,$0A,$30
	db $84,$66,$09,$0C,$16
	db $84,$06,$25,$07,$19
	db $65,$47,$10,$12,$0E
	db $B4,$C7,$13,$0D,$0A
	db $C4,$A7,$18,$00,$18
	db $D4,$87,$00,$0B,$24
	db $F4,$C7,$25,$00,$13
	db $44,$48,$0A,$09,$1A
	db $C1,$A8,$17,$0F,$28
	db $C4,$68,$1E,$11,$12
	db $F1,$C8,$25,$10,$10
	db $20,$89,$29,$2C,$10
	db $84,$89,$00,$00,$16
	db $84,$69,$12,$06,$12
	db $D4,$69,$08,$04,$1E
	db $84,$8A,$00,$11,$22
	db $D4,$6A,$18,$0C,$42
	db $E4,$6A,$0F,$0A,$2D
	db $05,$EB,$25,$2E,$0F
	db $14,$6B,$08,$16,$11
	db $84,$6C,$0F,$00,$1E
	db $94,$8C,$00,$08,$15
	db $94,$6C,$18,$00,$0E
	db $74,$6D,$08,$00,$1D
	db $84,$6D,$0F,$00,$0E
	db $91,$6D,$13,$76,$0E
	db $94,$6D,$18,$16,$19
	db $14,$EE,$01,$10,$0E
	db $74,$4E,$0A,$00,$0E
	db $81,$6E,$0F,$2A,$12
	db $E4,$EE,$25,$10,$34
	db $78,$6F,$07,$0D,$25
	db $F4,$6F,$18,$06,$16
	db $14,$70,$01,$00,$0E
	db $E4,$10,$2A,$03,$10
	db $12,$71,$01,$37,$0E
	db $41,$F1,$04,$10,$16
	db $40,$71,$09,$24,$0E
	db $51,$71,$18,$19,$17
	db $54,$11,$1D,$1A,$1C
	db $18,$F2,$24,$0F,$38
	db $31,$72,$0D,$2C,$22
	db $50,$F3,$04,$09,$08
	db $F0,$F3,$16,$10,$4D
	db $01,$F4,$A4,$08,$1A
	db $00,$F4,$29,$10,$0E

DATA_FDDBAA:
	db $04,$80,$C6,$05,$26
	db $11,$00,$00,$84,$0C
	db $F4,$82,$C6,$87,$1A
	db $F4,$03,$C0,$0B,$1B
	db $F4,$C5,$86,$0F,$1B
	db $D4,$C7,$E4,$14,$1B
	db $84,$CA,$E4,$16,$17
	db $84,$CB,$E4,$1B,$27
	db $04,$CE,$E1,$9F,$16
	db $45,$CE,$0B,$20,$31
	db $44,$CE,$78,$28,$3F
	db $04,$10,$E0,$A5,$10
	db $19,$D0,$28,$22,$31
	db $24,$D1,$E8,$A5,$1E
	db $20,$11,$30,$26,$2F
	db $00,$D3,$61,$AA,$1D
	db $42,$14,$51,$B0,$2F
	db $40,$14,$78,$2C,$3F
	db $54,$16,$18,$B1,$3C
	db $94,$18,$77,$33,$3F
	db $C4,$D9,$6E,$37,$3F
	db $C4,$DB,$F4,$3A,$3B
	db $84,$5D,$D6,$3D,$3F
	db $04,$DE,$EA,$BD,$27
	db $F4,$DE,$D8,$40,$3F
	db $04,$DF,$0A,$41,$2F
	db $70,$60,$D8,$44,$3F
	db $95,$E0,$0A,$46,$30
	db $14,$E3,$2C,$4C,$27
	db $21,$E4,$02,$4C,$19
	db $24,$66,$2B,$CE,$25
	db $24,$67,$06,$52,$21
	db $14,$E9,$06,$56,$21
	db $14,$EB,$06,$58,$1D
	db $14,$EC,$02,$5A,$1B
	db $14,$ED,$02,$5C,$17
	db $14,$EE,$02,$5E,$15
	db $F8,$EE,$ED,$64,$38
	db $14,$EF,$E0,$61,$15
	db $01,$B1,$C2,$64,$1B
	db $85,$32,$24,$6D,$19
	db $85,$F2,$2C,$67,$2A
	db $80,$72,$35,$68,$38
	db $A1,$33,$ED,$69,$2A
	db $A4,$F6,$45,$EF,$21
	db $B4,$F7,$E7,$F1,$21
	db $04,$F9,$E7,$74,$25
	db $84,$FA,$0B,$79,$25
	db $95,$FA,$01,$79,$17
	db $94,$3C,$49,$7B,$23
	db $B0,$7D,$E1,$FF,$26

DATA_FDDCA9:
	db $01,$60,$06,$27,$0E
	db $04,$E0,$09,$19,$21
	db $05,$C0,$10,$36,$17
	db $34,$E0,$22,$2D,$13
	db $54,$E1,$17,$20,$0E
	db $85,$E1,$02,$10,$0E
	db $81,$61,$15,$10,$06
	db $94,$62,$0B,$02,$17
	db $84,$E3,$00,$2D,$23
	db $B4,$63,$08,$1D,$2F
	db $04,$E4,$22,$04,$10
	db $54,$E4,$17,$10,$36
	db $64,$E4,$11,$0E,$0E
	db $44,$E5,$20,$10,$1F
	db $44,$E6,$11,$10,$20
	db $54,$C6,$1B,$00,$13
	db $84,$66,$08,$01,$16
	db $44,$E7,$22,$00,$18
	db $54,$E7,$01,$06,$17
	db $54,$E7,$19,$0F,$1F
	db $94,$67,$09,$00,$16
	db $44,$E8,$12,$16,$18
	db $44,$E8,$23,$14,$0E
	db $94,$68,$0A,$13,$1A
	db $B4,$C8,$00,$00,$20
	db $44,$E9,$19,$00,$12
	db $B4,$C9,$00,$4B,$0E
	db $44,$EA,$17,$17,$23
	db $84,$EA,$1F,$10,$2E
	db $A4,$CA,$11,$06,$17
	db $C4,$AA,$04,$10,$48
	db $04,$EC,$12,$03,$0E
	db $84,$EC,$1F,$10,$17
	db $B4,$EC,$19,$00,$0F
	db $C4,$AC,$04,$10,$38
	db $34,$0D,$0E,$19,$35
	db $B4,$ED,$19,$02,$12
	db $84,$EE,$20,$08,$17
	db $C4,$EE,$09,$0B,$0E
	db $D8,$EE,$16,$07,$34
	db $65,$CF,$00,$0F,$1B
	db $60,$EF,$05,$1E,$0E
	db $C4,$EF,$11,$0C,$0E
	db $04,$10,$22,$00,$15
	db $40,$F0,$16,$10,$10
	db $44,$F0,$1B,$00,$0E
	db $74,$F0,$09,$01,$16
	db $00,$11,$23,$18,$0D
	db $41,$F1,$1B,$10,$2B
	db $50,$D1,$01,$10,$10
	db $80,$F1,$0A,$10,$4E

DATA_FDDDA8:
	db $04,$00,$CE,$04,$37
	db $74,$02,$F0,$0A,$3B
	db $84,$85,$8D,$0E,$36
	db $54,$07,$B0,$18,$3B
	db $64,$0C,$AE,$1A,$37
	db $64,$0D,$AC,$1C,$33
	db $64,$0E,$CC,$24,$3B
	db $74,$12,$0E,$2B,$37
	db $94,$15,$4C,$2E,$33
	db $34,$17,$66,$32,$33
	db $44,$19,$04,$36,$23
	db $14,$9B,$A5,$45,$2F
	db $E4,$22,$E8,$48,$2F
	db $84,$A4,$A6,$4B,$28
	db $E4,$25,$E8,$4D,$2E
	db $04,$27,$E2,$4F,$2E
	db $04,$28,$E2,$51,$20
	db $04,$A9,$E3,$53,$28
	db $04,$2A,$E6,$55,$27
	db $04,$2B,$E8,$57,$30
	db $04,$AC,$2A,$5F,$30
	db $A4,$AF,$68,$61,$30
	db $C4,$30,$C6,$63,$33
	db $F4,$31,$C4,$65,$33
	db $F4,$32,$C4,$67,$2B
	db $F4,$B3,$E0,$69,$1C
	db $04,$B5,$E0,$6B,$2B
	db $04,$36,$E2,$6D,$28
	db $04,$B7,$E3,$6F,$28
	db $04,$B8,$E5,$71,$28
	db $04,$B9,$26,$74,$28
	db $24,$3A,$20,$77,$28
	db $A4,$3B,$20,$79,$1B
	db $A4,$3C,$22,$7B,$1F
	db $A4,$BD,$43,$7D,$27
	db $B4,$3E,$80,$87,$27
	db $D4,$43,$C3,$89,$27
	db $F4,$C4,$64,$90,$2E
	db $44,$C8,$A2,$92,$27
	db $60,$49,$E1,$9A,$1D

DATA_FDDE70:
	db $04,$00,$0E,$03,$37
	db $94,$01,$0D,$05,$35
	db $94,$02,$8C,$13,$33
	db $D4,$89,$8D,$15,$3B
	db $D4,$0A,$B0,$24,$3B
	db $64,$12,$2C,$27,$38
	db $A4,$13,$EA,$2D,$2F
	db $04,$17,$04,$30,$2E
	db $14,$18,$04,$32,$27
	db $14,$19,$44,$38,$34
	db $34,$1C,$82,$3A,$2B
	db $54,$1D,$E4,$42,$2B
	db $84,$A1,$03,$45,$2B
	db $94,$22,$00,$47,$22
	db $94,$23,$40,$50,$1B
	db $34,$28,$80,$53,$23
	db $D4,$29,$C0,$55,$1B
	db $F4,$2A,$C2,$57,$1F
	db $F4,$2B,$C2,$61,$1F
	db $F4,$30,$A2,$68,$27
	db $64,$B4,$42,$6F,$20
	db $B4,$B7,$40,$71,$1C
	db $B4,$38,$00,$77,$1B
	db $94,$3B,$00,$7E,$23
	db $14,$3F,$02,$80,$23
	db $14,$40,$C4,$89,$23
	db $F4,$44,$84,$92,$2E
	db $54,$49,$62,$A1,$1F
	db $C4,$50,$E2,$B3,$2F
	db $00,$DA,$E4,$B7,$27

DATA_FDDF06:
	db $04,$80,$2A,$03,$38
	db $A4,$81,$2A,$05,$30
	db $A4,$82,$AB,$09,$32
	db $E4,$04,$CC,$0E,$3B
	db $74,$07,$CC,$12,$3B
	db $74,$89,$0C,$1C,$3C
	db $14,$8E,$EC,$1F,$3E
	db $04,$10,$CC,$28,$7E
	db $74,$14,$AA,$2E,$2F
	db $64,$97,$88,$34,$2C
	db $54,$9A,$68,$3A,$77
	db $44,$1D,$EC,$40,$37
	db $84,$20,$2B,$43,$30
	db $A4,$21,$8C,$4A,$33
	db $54,$A5,$48,$4F,$2C
	db $B4,$A7,$24,$53,$24
	db $A4,$29,$E5,$5B,$6E
	db $04,$AE,$E9,$5D,$2E
	db $04,$AF,$66,$62,$28
	db $44,$B1,$42,$69,$20
	db $B4,$B4,$22,$72,$6F
	db $24,$39,$2A,$74,$2F
	db $24,$3A,$A3,$7D,$6F
	db $E4,$3E,$A3,$7F,$21
	db $E4,$3F,$E0,$86,$1B
	db $84,$C3,$81,$8A,$1F
	db $54,$45,$44,$96,$23
	db $34,$4B,$46,$9A,$27
	db $34,$4D,$C8,$A1,$2B
	db $F4,$50,$60,$AB,$6B
	db $C4,$55,$40,$AE,$1B
	db $34,$D7,$C2,$B8,$20
	db $74,$5C,$E4,$BC,$23
	db $84,$5E,$66,$C2,$27
	db $44,$61,$02,$CE,$1F
	db $14,$67,$61,$D2,$1D
	db $44,$E9,$40,$DA,$1C
	db $30,$6D,$62,$E3,$1F

DATA_FDDFC4:
	db $01,$A0,$C3,$4B,$09
	db $01,$A8,$E4,$E7,$0A
	db $01,$78,$C5,$BB,$0C
	db $01,$E8,$EB,$BB,$1C
	db $01,$60,$EF,$77,$20
	db $05,$70,$F4,$77,$2A
	db $01,$40,$F5,$47,$2D
	db $01,$A0,$F7,$37,$32
	db $35,$A8,$E7,$C7,$14
	db $81,$C0,$F0,$7B,$24
	db $91,$60,$C6,$4B,$0F
	db $D1,$50,$FD,$F7,$3C
	db $25,$01,$F3,$B7,$27
	db $21,$61,$BB,$B9,$38
	db $85,$61,$00,$47,$03
	db $91,$A9,$81,$9B,$04
	db $F1,$E1,$D3,$D7,$28
	db $01,$52,$82,$3B,$06
	db $01,$22,$E3,$37,$07
	db $01,$6A,$EA,$C7,$17
	db $01,$62,$EE,$B7,$1E
	db $01,$42,$F0,$77,$21
	db $01,$42,$F2,$F7,$25
	db $01,$AA,$F6,$37,$2F
	db $01,$22,$F9,$B7,$33
	db $01,$E2,$B9,$B9,$35
	db $01,$E2,$FA,$B7,$36
	db $01,$62,$FC,$97,$3A
	db $00,$82,$FE,$D7,$3D
	db $90,$2B,$E0,$7B,$02
	db $00,$84,$A8,$BB,$12
	db $00,$0C,$F3,$7B,$2A

DATA_FDE064:
	db $04,$C0,$EF,$03,$30
	db $04,$C2,$0F,$08,$2D
	db $14,$C4,$0F,$8A,$30
	db $14,$85,$11,$0C,$35
	db $14,$C6,$D3,$10,$35
	db $74,$C8,$C9,$12,$35
	db $74,$C9,$09,$96,$30
	db $14,$0B,$92,$1D,$35
	db $D8,$CE,$86,$21,$31
	db $D4,$D0,$06,$29,$1B
	db $D4,$D0,$10,$29,$2F
	db $94,$D4,$C6,$2C,$2D
	db $74,$D6,$2F,$AF,$30
	db $A4,$97,$31,$B3,$30
	db $A4,$D9,$AF,$B5,$30
	db $B2,$99,$E1,$BD,$10
	db $41,$9A,$48,$BA,$1E
	db $E4,$9A,$6F,$BA,$2C
	db $44,$9D,$88,$BD,$2C
	db $D4,$DE,$CD,$BF,$2C
	db $F4,$1F,$CC,$42,$29
	db $74,$E1,$2B,$C7,$26
	db $A4,$E3,$2B,$4C,$29
	db $24,$26,$AE,$52,$2D
	db $81,$E7,$E3,$58,$15
	db $64,$E9,$6A,$55,$29
	db $C4,$EA,$8B,$58,$29
	db $54,$2C,$8E,$5A,$2D
	db $54,$ED,$ED,$63,$2D
	db $08,$F2,$A7,$E6,$35
	db $64,$F3,$E7,$6E,$1F
	db $64,$F3,$B0,$E8,$35
	db $64,$F4,$F0,$6C,$31
	db $84,$F6,$F0,$6E,$35
	db $84,$F7,$87,$72,$35
	db $54,$F9,$0E,$F5,$32
	db $94,$3A,$6F,$7B,$2D
	db $C0,$BD,$F1,$FF,$30

DATA_FDE122:
	db $01,$D8,$07,$B5,$11
	db $01,$B8,$4E,$F5,$1F
	db $01,$00,$F0,$D3,$21
	db $01,$F0,$30,$F4,$23
	db $01,$00,$F2,$53,$25
	db $01,$B0,$B2,$16,$29
	db $11,$90,$F4,$24,$2E
	db $11,$18,$17,$14,$2F
	db $15,$90,$77,$36,$31
	db $21,$E0,$A8,$94,$12
	db $21,$50,$29,$34,$1B
	db $41,$40,$62,$F8,$06
	db $81,$A0,$4D,$65,$1D
	db $A1,$88,$C0,$B9,$02
	db $11,$61,$C1,$99,$03
	db $31,$D1,$41,$76,$04
	db $41,$A1,$D8,$BB,$32
	db $61,$81,$C3,$79,$08
	db $91,$B9,$E4,$DB,$0C
	db $91,$71,$46,$F8,$0D
	db $91,$01,$E7,$9B,$0F
	db $01,$42,$E4,$6A,$09
	db $41,$62,$59,$9A,$33
	db $B1,$D2,$E7,$9B,$10
	db $C1,$8A,$EA,$AB,$19
	db $C1,$02,$D1,$F9,$22
	db $C1,$82,$F1,$4B,$25
	db $D1,$DA,$0C,$5A,$1D
	db $D1,$9A,$CF,$FA,$21
	db $E1,$B2,$AE,$29,$1F
	db $10,$D3,$19,$CA,$35
	db $41,$9B,$F4,$5B,$2B
	db $41,$B3,$75,$4A,$2C
	db $41,$2B,$F6,$5B,$2E
	db $41,$A3,$F7,$3B,$31
	db $51,$4B,$E9,$2B,$14
	db $51,$1B,$8A,$0A,$15
	db $71,$AB,$F2,$6B,$26
	db $D1,$53,$E8,$8B,$12
	db $01,$3C,$F3,$2B,$29
	db $01,$34,$F7,$3B,$2F

DATA_FDE1EF:
	db $00,$00,$E7,$05,$35

DATA_FDE1F4:
	db $00,$80,$4B,$04,$32

DATA_FDE1F9:
	db $50,$00,$00,$32,$0E

DATA_FDE1FE:
	db $10,$00,$00,$62,$0E

DATA_FDE203:
	db $00,$80,$51,$07,$3E

DATA_FDE208:
	db $00,$80,$EE,$09,$3E

DATA_FDE20D:
	db $00,$80,$C5,$0B,$2B

DATA_FDE212:
	db $04,$00,$62,$0A,$1F
	db $40,$05,$65,$0E,$25

DATA_FDE21C:
	db $10,$00,$00,$3E,$0E

DATA_FDE221:
	db $10,$00,$00,$3E,$0E

DATA_FDE226:
	db $D0,$00,$C0,$B7,$06

DATA_FDE22B:
	db $80,$30,$E1,$64,$05

DATA_FDE230:
	db $60,$80,$6C,$06,$34

DATA_FDE235:
	db $00,$80,$E8,$09,$2C

DATA_FDE23A:
	db $14,$00,$01,$02,$0E
	db $30,$01,$00,$18,$16

DATA_FDE244:
	db $10,$00,$00,$4A,$0E

DATA_FDE249:
	db $80,$10,$E0,$64,$04

DATA_FDE24E:
	db $80,$40,$C0,$B7,$03

DATA_FDE253:
	db $00,$00,$CB,$0C,$36

DATA_FDE258:
	db $00,$80,$E7,$04,$2A

DATA_FDE25D:
	db $04,$60,$01,$33,$0E
	db $30,$24,$00,$10,$18

DATA_FDE267:
	db $20,$00,$01,$10,$49

DATA_FDE26C:
	db $00,$00,$00,$20,$66

DATA_FDE271:
	db $00,$00,$00,$50,$2A

DATA_FDE276:
	db $40,$80,$6B,$05,$3E

DATA_FDE27B:
	db $10,$80,$EB,$0E,$3E

DATA_FDE280:
	db $00,$00,$00,$50,$2A

DATA_FDE285:
	db $00,$20,$00,$40,$25

DATA_FDE28A:
	db $20,$40,$00,$10,$0E

DATA_FDE28F:
	db $11,$E0,$04,$38,$0E
	db $41,$21,$00,$10,$18
	db $40,$61,$08,$11,$12

DATA_FDE29E:
	db $00,$20,$01,$4F,$0E

DATA_FDE2A3:
	db $30,$60,$00,$17,$14

DATA_FDE2A8:
	db $04,$00,$00,$18,$6C
	db $84,$02,$05,$04,$80
	db $C4,$03,$09,$00,$90
	db $C4,$04,$0E,$2D,$A4
	db $94,$08,$08,$13,$8C
	db $C4,$0A,$0E,$01,$A4
	db $D0,$0B,$10,$13,$AC

DATA_FDE2CB:
	db $04,$00,$00,$10,$CC
	db $04,$02,$00,$0A,$6C
	db $A4,$03,$05,$01,$80
	db $B4,$04,$08,$33,$8C
	db $E4,$08,$03,$00,$78
	db $E0,$09,$00,$2A,$6C

DATA_FDE2E9:
	db $81,$18,$C0,$37,$05
	db $A0,$A0,$C2,$F7,$06

DATA_FDE2F3:
	db $80,$10,$E0,$E4,$0D

DATA_FDE2F8:
	db $80,$00,$00,$48,$1D

DATA_FDE2FD:
	db $40,$20,$00,$29,$25

DATA_FDE302:
	db $10,$80,$00,$31,$0E

DATA_FDE307:
	db $04,$00,$00,$0C,$6A
	db $C1,$01,$00,$0F,$0E
	db $D1,$81,$03,$0E,$0F
	db $20,$22,$07,$10,$2D

DATA_FDE31B:
	db $00,$00,$00,$44,$0E

DATA_FDE320:
	db $01,$00,$00,$2C,$0E
	db $00,$80,$03,$18,$16

DATA_FDE32A:
	db $00,$80,$E6,$03,$28

DATA_FDE32F:
	db $04,$00,$60,$04,$2E
	db $40,$82,$E9,$21,$2E

DATA_FDE339:
	db $00,$00,$00,$20,$0E

DATA_FDE33E:
	db $00,$00,$00,$1C,$5E

DATA_FDE343:
	db $00,$00,$00,$1C,$16

DATA_FDE348:
	db $00,$80,$07,$50,$0E
	db $31,$80,$00,$4A,$0E
	db $E1,$01,$04,$10,$0E

DATA_FDE357:
	db $04,$00,$EA,$01,$2F
	db $04,$81,$2B,$06,$32
	db $20,$03,$68,$0C,$2B

DATA_FDE366:
	db $00,$00,$66,$0B,$27

DATA_FDE36B:
	db $00,$C0,$E0,$89,$23

DATA_FDE370:
	db $00,$00,$E0,$04,$1A

DATA_FDE375:
	db $21,$00,$00,$1A,$0E
	db $20,$80,$03,$10,$5E

DATA_FDE37F:
	db $50,$00,$00,$14,$7A

DATA_FDE384:
	db $10,$20,$00,$2E,$2C

DATA_FDE389:
	db $14,$20,$00,$2B,$30
	db $C0,$03,$03,$13,$19

DATA_FDE393:
	db $00,$80,$61,$05,$12

DATA_FDE398:
	db $04,$00,$E0,$81,$0A
	db $00,$01,$E0,$05,$14

DATA_FDE3A2:
	db $00,$00,$00,$60,$0E

DATA_FDE3A7:
	db $20,$00,$01,$14,$0E

DATA_FDE3AC:
	db $00,$00,$00,$0A,$1B

DATA_FDE3B1:
	db $80,$00,$80,$07,$1B

DATA_FDE3B6:
	db $00,$40,$E0,$04,$1A

DATA_FDE3BB:
	db $00,$40,$E2,$0F,$12

DATA_FDE3C0:
	db $00,$80,$69,$08,$3E

DATA_FDE3C5:
	db $00,$80,$69,$08,$3E

DATA_FDE3CA:
	db $00,$80,$E5,$05,$26

DATA_FDE3CF:
	db $00,$00,$E4,$05,$2F

DATA_FDE3D4:
	db $30,$A0,$00,$34,$28

DATA_FDE3D9:
	db $30,$A0,$00,$4D,$28

DATA_FDE3DE:
	db $40,$08,$60,$D4,$02

DATA_FDE3E3:
	db $40,$08,$60,$F4,$03

DATA_FDE3E8:
	db $20,$A0,$20,$C4,$03

DATA_FDE3ED:
	db $00,$80,$01,$20,$13

DATA_FDE3F2:
	db $00,$00,$00,$20,$42

DATA_FDE3F7:
	db $00,$C0,$E3,$0D,$15

DATA_FDE3FC:
	db $00,$C0,$E1,$08,$11

DATA_FDE401:
	db $00,$C0,$E1,$11,$11

DATA_FDE406:
	db $00,$80,$E6,$03,$2D

DATA_FDE40B:
	db $00,$00,$E7,$03,$2D

DATA_FDE410:
	db $90,$00,$69,$07,$2D

DATA_FDE415:
	incbin "data/levels/objects/CollectableOrnament.bin"