CODE_B38000:
	JMP CODE_B3D87A				;$B38000

CODE_B38003:
	JMP CODE_B3D999				;$B38003

CODE_B38006:
	JMP CODE_B3D843				;$B38006

CODE_B38009:
	JMP CODE_B3D9A9				;$B38009

CODE_B3800C:
	JMP CODE_B3C1ED				;$B3800C

CODE_B3800F:
	JMP CODE_B3DBC7				;$B3800F

DATA_B38012:
	dw CODE_B3E0C6
	dw CODE_B3DC67
	dw CODE_B3E0C6
	dw CODE_B3DC82
	dw CODE_B3DC99
	dw CODE_B3DD20
	dw CODE_B3DD51
	dw CODE_B3E0C6
	dw CODE_B3DC43
	dw CODE_B3DEB6
	dw CODE_B3DEFB
	dw CODE_B3DF2B
	dw CODE_B3E0C6
	dw CODE_B3E0C6
	dw CODE_B3E0C6
	dw CODE_B3DF41
	dw CODE_B3DF41
	dw CODE_B3DF6B
	dw CODE_B3E0C6
	dw CODE_B3E0C6
	dw CODE_B3DECB
	dw CODE_B3DF92
	dw CODE_B3E072
	dw CODE_B3E09E
	dw CODE_B3DF7C

DATA_B38044:
	dw CODE_B3ECB3
	dw CODE_B3ECBF
	dw CODE_B3EECF
	dw CODE_B3ECB3
	dw CODE_B3F071
	dw CODE_B3F1AD
	dw CODE_B3F80F
	dw CODE_B3EFA0
	dw CODE_B3ECB3
	dw CODE_B3EAEB
	dw CODE_B3EAC9
	dw CODE_B3E84E
	dw CODE_B3E834
	dw CODE_B3EA73
	dw CODE_B3EA00
	dw CODE_B3E130
	dw CODE_B3E0E9
	dw CODE_B3E1A7
	dw CODE_B3E233
	dw CODE_B3E83E
	dw CODE_B3E74A
	dw CODE_B3ECB3
	dw CODE_B3ECB3
	dw CODE_B3F929
	dw CODE_B3E5AE

CODE_B38076:
	LDA.b $56				;$B38076
	ASL					;$B38078
	TAX					;$B38079
	JSR.w (DATA_B380AC,x)			;$B3807A
	SEP.b #$20				;$B3807D
	LDA.w CPU.ppu_status			;$B3807F
	REP.b #$20				;$B38082
	BMI.b CODE_B38086			;$B38084
CODE_B38086:
	STZ.w $1560				;$B38086
	STZ.w $155E				;$B38089
	LDA.b $58				;$B3808C
	ASL					;$B3808E
	TAX					;$B3808F
	JMP.w (DATA_B3A62E,x)			;$B38090

CODE_B38093:
	STA.w DMA[$00].source_word		;$B38093
	STY.w DMA[$00].size			;$B38096
	LDA.w #$1801				;$B38099
	STA.w DMA[$00].settings			;$B3809C
	SEP.b #$30				;$B3809F
	STX.w DMA[$00].source_bank		;$B380A1
	LDA.b #$01				;$B380A4
	STA.w CPU.enable_dma			;$B380A6
	REP.b #$30				;$B380A9
	RTS					;$B380AB

DATA_B380AC:
	dw CODE_B3810B
	dw CODE_B3813E
	dw CODE_B383F8
	dw CODE_B38EF6
	dw CODE_B384B5
	dw CODE_B382EC
	dw CODE_B38351
	dw CODE_B39359
	dw CODE_B3939E
	dw CODE_B383F8
	dw CODE_B39BA5
	dw CODE_B38259
	dw CODE_B39781
	dw CODE_B3858F
	dw CODE_B397A2
	dw CODE_B397A2
	dw CODE_B39816
	dw CODE_B39863
	dw CODE_B39E6A
	dw CODE_B39EB1
	dw CODE_B39F19
	dw CODE_B39781
	dw CODE_B38EF6
	dw CODE_B3858F
	dw CODE_B384B5
	dw CODE_B39637
	dw CODE_B39631
	dw CODE_B3853C
	dw CODE_B3A0AD
	dw CODE_B3A237
	dw CODE_B38EFC
	dw CODE_B3A3A4
	dw CODE_B3A3BD
	dw CODE_B3A3EC
	dw CODE_B38EFC
	dw CODE_B39637

CODE_B380F4:
	LDA $04E4				;$B380F4
	STA.w CPU.enable_dma_hdma		;$B380F7
	JSL CODE_B3D843				;$B380FA
	JSL CODE_B7B00F				;$B380FE
	JSL CODE_B7B012				;$B38102
	JSL CODE_80801E				;$B38106
	RTS					;$B3810A

CODE_B3810B:
	JSR CODE_B380F4				;$B3810B
	LDA $196D				;$B3810E
	LSR					;$B38111
	SEP #$20				;$B38112
	STA.w PPU.layer_3_scroll_x		;$B38114
	STZ.w PPU.layer_3_scroll_x		;$B38117
	LDA $196D				;$B3811A
	STA.w PPU.layer_2_scroll_x		;$B3811D
	LDA $196E				;$B38120
	STA.w PPU.layer_2_scroll_x		;$B38123
	LDA $1975				;$B38126
	STA.w PPU.layer_2_scroll_y		;$B38129
	STZ.w PPU.layer_2_scroll_y		;$B3812C
	STZ.w PPU.layer_3_scroll_y		;$B3812F
	STZ.w PPU.layer_3_scroll_y		;$B38132
	LDA screen_brightness			;$B38135
	STA.w PPU.screen			;$B38138
	REP #$20				;$B3813B
	RTS					;$B3813D

CODE_B3813E:
	JSR.w CODE_B380F4			;$B3813E
	JSR.w CODE_B38158			;$B38141
	SEP.b #$20				;$B38144
	LDA.w $1975				;$B38146
	STA.w PPU.layer_2_scroll_y		;$B38149
	STZ.w PPU.layer_2_scroll_y		;$B3814C
	LDA.w screen_brightness			;$B3814F
	STA.w PPU.screen			;$B38152
	REP.b #$20				;$B38155
	RTS					;$B38157

CODE_B38158:
	LDA.w $1975				;$B38158
	LSR					;$B3815B
	SEC					;$B3815C
	SBC.w #$0110				;$B3815D
	STA.w $1B65				;$B38160
	LDA.w $1975				;$B38163
	LSR					;$B38166
	LSR					;$B38167
	LSR					;$B38168
	LSR					;$B38169
	EOR.w #$FFFF				;$B3816A
	SEC					;$B3816D
	ADC.w #$0026				;$B3816E
	SEP.b #$20				;$B38171
	STA.l $7EA492				;$B38173
	SEC					;$B38177
	SBC.b #$03				;$B38178
	STA.l $7EA47E				;$B3817A
	REP.b #$20				;$B3817E
	LDA.w $1975				;$B38180
	LSR					;$B38183
	LSR					;$B38184
	LSR					;$B38185
	LSR					;$B38186
	SEC					;$B38187
	SBC.w #$0018				;$B38188
	ADC.w #$028A				;$B3818B
	SEC					;$B3818E
	SBC.w $1975				;$B3818F
	CMP.w #$00E0				;$B38192
	BCC.b CODE_B3819A			;$B38195
	LDA.w #$00E0				;$B38197
CODE_B3819A:
	LSR					;$B3819A
	SEP.b #$20				;$B3819B
	STA.l $7EA478				;$B3819D
	STA.l $7EA48C				;$B381A1
	ADC.b #$00				;$B381A5
	STA.l $7EA47B				;$B381A7
	STA.l $7EA48F				;$B381AB
	REP.b #$20				;$B381AF
	LDA.w $1975				;$B381B1
	EOR.w #$FFFF				;$B381B4
	SEC					;$B381B7
	ADC.w #$02A8				;$B381B8
	CMP.w #$00E0				;$B381BB
	BCC.b CODE_B381C3			;$B381BE
	LDA.w #$00E0				;$B381C0
CODE_B381C3:
	SEP.b #$20				;$B381C3
	LSR					;$B381C5
	STA.l $7EA15A				;$B381C6
	ADC.b #$00				;$B381CA
	STA.l $7EA15D				;$B381CC
	LDA.w $1B65				;$B381D0
	EOR.b #$FF				;$B381D3
	SEC					;$B381D5
	SBC.b #$28				;$B381D6
	BEQ.b CODE_B381DC			;$B381D8
	BPL.b CODE_B381F1			;$B381DA
CODE_B381DC:
	CLC					;$B381DC
	ADC.b #$38				;$B381DD
	STA.l $7EA20D				;$B381DF
	LDA.b #$01				;$B381E3
	STA.l $7EA20A				;$B381E5
	LDA.b #$BE				;$B381E9
	STA.l $7EA20B				;$B381EB
	BRA.b CODE_B38201			;$B381EF

CODE_B381F1:
	STA.l $7EA20A				;$B381F1
	LDA.b #$38				;$B381F5
	STA.l $7EA20D				;$B381F7
	LDA.b #$BA				;$B381FB
	STA.l $7EA20B				;$B381FD
CODE_B38201:
	LDA.b #$50				;$B38201
	STA.l $7EA210				;$B38203
	REP.b #$20				;$B38207
	LDA.w $196D				;$B38209
	STA.l $7EA44A				;$B3820C
	LDA.w $196D				;$B38210
	LSR					;$B38213
	LSR					;$B38214
	STA.l $7EA52A				;$B38215
	LDA.w $1975				;$B38219
	LSR					;$B3821C
	CLC					;$B3821D
	ADC.w #$00F0				;$B3821E
	STA.l $7EA52C				;$B38221
	STA.l $7EA4BC				;$B38225
	STA.l $7EA4C0				;$B38229
	LDA.b active_frame_counter		;$B3822D
	CLC					;$B3822F
	ADC.w $196D				;$B38230
	LSR					;$B38233
	LSR					;$B38234
	STA.l $7EA4BA				;$B38235
	LDA.b active_frame_counter		;$B38239
	LSR					;$B3823B
	CLC					;$B3823C
	ADC.w $196D				;$B3823D
	LSR					;$B38240
	LSR					;$B38241
	STA.l $7EA4BE				;$B38242
	LDA.w $1B65				;$B38246
	SEC					;$B38249
	SBC.w #$0121				;$B3824A
	SEP.b #$20				;$B3824D
	STA.w PPU.layer_3_scroll_y		;$B3824F
	XBA					;$B38252
	STA.w PPU.layer_3_scroll_y		;$B38253
	REP.b #$20				;$B38256
	RTS					;$B38258

CODE_B38259:
	JSR.w CODE_B380F4			;$B38259
	LDA.w $196D				;$B3825C
	LSR					;$B3825F
	CLC					;$B38260
	ADC.w #$0040				;$B38261
	SEP.b #$20				;$B38264
	STA.w PPU.layer_2_scroll_x		;$B38266
	STZ.w PPU.layer_2_scroll_x		;$B38269
	REP.b #$20				;$B3826C
	STA.l $7EA15B				;$B3826E
	STA.l $7EA160				;$B38272
	LSR					;$B38276
	SEP.b #$20				;$B38277
	STA.w PPU.layer_3_scroll_x		;$B38279
	STZ.w PPU.layer_3_scroll_x		;$B3827C
	LDA.w $196D				;$B3827F
	STA.w PPU.layer_1_scroll_x		;$B38282
	LDA.w $196E				;$B38285
	STA.w PPU.layer_1_scroll_x		;$B38288
	LDA.w $1975				;$B3828B
	STA.w PPU.layer_1_scroll_y		;$B3828E
	STA.w PPU.layer_1_scroll_y		;$B38291
	REP.b #$20				;$B38294
	LDA.w $18A1				;$B38296
	CLC					;$B38299
	ADC.w $196D				;$B3829A
	STA.l $7EA165				;$B3829D
	LDA.w $18A3				;$B382A1
	STA.l $7EA167				;$B382A4
	SEC					;$B382A8
	SBC.w #$001F				;$B382A9
	EOR.w #$FFFF				;$B382AC
	INC					;$B382AF
	CLC					;$B382B0
	ADC.w #$0064				;$B382B1
	SEP.b #$20				;$B382B4
	STA.l $7EA15A				;$B382B6
	STA.l $7EA16A				;$B382BA
	STA.l $7EA170				;$B382BE
	REP.b #$20				;$B382C2
	LDA.w $1975				;$B382C4
	LSR					;$B382C7
	STA.l $7EA15D				;$B382C8
	STA.l $7EA162				;$B382CC
	SEP.b #$20				;$B382D0
	STA.w PPU.layer_2_scroll_y		;$B382D2
	STZ.w PPU.layer_2_scroll_y		;$B382D5
	REP.b #$20				;$B382D8
	LSR					;$B382DA
	SEP.b #$20				;$B382DB
	STA.w PPU.layer_3_scroll_y		;$B382DD
	STZ.w PPU.layer_3_scroll_y		;$B382E0
	LDA.w screen_brightness			;$B382E3
	STA.w PPU.screen			;$B382E6
	REP.b #$20				;$B382E9
	RTS					;$B382EB

CODE_B382EC:
	JSR.w CODE_B380F4			;$B382EC
	REP.b #$20				;$B382EF
	LDA.w $1973				;$B382F1
	SEC					;$B382F4
	SBC.w #$0100				;$B382F5
	LSR					;$B382F8
	LSR					;$B382F9
	LSR					;$B382FA
	SEP.b #$20				;$B382FB
	STA.w PPU.layer_3_scroll_y		;$B382FD
	STZ.w PPU.layer_3_scroll_y		;$B38300
	REP.b #$20				;$B38303
	LDA.w $196D				;$B38305
	LSR					;$B38308
	LSR					;$B38309
	SEP.b #$20				;$B3830A
	STA.w PPU.layer_3_scroll_x		;$B3830C
	STZ.w PPU.layer_3_scroll_x		;$B3830F
	REP.b #$20				;$B38312
	LDA.w $196D				;$B38314
	LSR					;$B38317
	SEP.b #$20				;$B38318
	STA.w PPU.layer_2_scroll_x		;$B3831A
	STZ.w PPU.layer_2_scroll_x		;$B3831D
	REP.b #$20				;$B38320
	LDA.w $1973				;$B38322
	SEC					;$B38325
	SBC.w #$0100				;$B38326
	LSR					;$B38329
	LSR					;$B3832A
	SEP.b #$20				;$B3832B
	STA.w PPU.layer_2_scroll_y		;$B3832D
	STZ.w PPU.layer_2_scroll_y		;$B38330
	LDA.w $196D				;$B38333
	STA.w PPU.layer_1_scroll_x		;$B38336
	LDA.w $196E				;$B38339
	STA.w PPU.layer_1_scroll_x		;$B3833C
	LDA.w $1975				;$B3833F
	STA.w PPU.layer_1_scroll_y		;$B38342
	STZ.w PPU.layer_1_scroll_y		;$B38345
	LDA.w screen_brightness			;$B38348
	STA.w PPU.screen			;$B3834B
	REP.b #$20				;$B3834E
	RTS					;$B38350

CODE_B38351:
	JSR.w CODE_B380F4			;$B38351
	LDX.w $15EC				;$B38354
	BEQ.b CODE_B383A8			;$B38357
	LDA.b $60,x				;$B38359
	BMI.b CODE_B3836D			;$B3835B
	LDY.w #$0000				;$B3835D
	CMP.w #$0060				;$B38360
	BCS.b CODE_B38388			;$B38363
	LDY.w #$001F				;$B38365
	CMP.w #$0020				;$B38368
	BCC.b CODE_B38388			;$B3836B
CODE_B3836D:
	SEP.b #$20				;$B3836D
	LDA.b $5C,x				;$B3836F
	STA.w PPU.cgram_address			;$B38371
	LDX.w #$0000				;$B38374
CODE_B38377:
	LDA.l $7E2F80,x				;$B38377
	STA.w PPU.cgram_write			;$B3837B
	INX					;$B3837E
	CPX.w #$0010				;$B3837F
	BCC.b CODE_B38377			;$B38382
	REP.b #$20				;$B38384
	BRA.b CODE_B383A8			;$B38386

CODE_B38388:
	SEP.b #$20				;$B38388
	LDA.b $5C,x				;$B3838A
	STA.w PPU.cgram_address			;$B3838C
	REP.b #$20				;$B3838F
	LDX.w #$0000				;$B38391
	TYA					;$B38394
	SEP.b #$20				;$B38395
CODE_B38397:
	STA.w PPU.cgram_write			;$B38397
	XBA					;$B3839A
	STA.w PPU.cgram_write			;$B3839B
	XBA					;$B3839E
	INX					;$B3839F
	INX					;$B383A0
	CPX.w #$0010				;$B383A1
	BCC.b CODE_B38397			;$B383A4
	REP.b #$20				;$B383A6
CODE_B383A8:
	LDA.w $196D				;$B383A8
	ASL					;$B383AB
	ADC.w $196D				;$B383AC
	LSR					;$B383AF
	LSR					;$B383B0
	SEP.b #$20				;$B383B1
	STA.w PPU.layer_3_scroll_x		;$B383B3
	STZ.w PPU.layer_3_scroll_x		;$B383B6
	REP.b #$20				;$B383B9
	LDA.w $1975				;$B383BB
	ASL					;$B383BE
	ADC.w $1975				;$B383BF
	LSR					;$B383C2
	LSR					;$B383C3
	SEP.b #$20				;$B383C4
	STA.w PPU.layer_3_scroll_y		;$B383C6
	STZ.w PPU.layer_3_scroll_y		;$B383C9
	REP.b #$20				;$B383CC
	LDA.b active_frame_counter		;$B383CE
	LSR					;$B383D0
	LSR					;$B383D1
	SEP.b #$20				;$B383D2
	STA.w PPU.layer_2_scroll_x		;$B383D4
	STA.w PPU.layer_2_scroll_x		;$B383D7
	LDA.w $196D				;$B383DA
	STA.w PPU.layer_1_scroll_x		;$B383DD
	LDA.w $196E				;$B383E0
	STA.w PPU.layer_1_scroll_x		;$B383E3
	LDA.w $1975				;$B383E6
	STA.w PPU.layer_1_scroll_y		;$B383E9
	STZ.w PPU.layer_1_scroll_y		;$B383EC
	LDA.w screen_brightness			;$B383EF
	STA.w PPU.screen			;$B383F2
	REP.b #$20				;$B383F5
	RTS					;$B383F7

CODE_B383F8:
	JSR.w CODE_B380F4			;$B383F8
	LDA.w $050F				;$B383FB
	CMP.w #$8000				;$B383FE
	BEQ.b CODE_B38475			;$B38401
	LDA.b active_frame_counter		;$B38403
	BIT.w #$0001				;$B38405
	BEQ.b CODE_B38436			;$B38408
	LDX.w #$A15A				;$B3840A
	STX.w HDMA[$01].source_word		;$B3840D
	LDX.w #$A17A				;$B38410
	STX.w HDMA[$02].source_word		;$B38413
	LDX.w #$A16A				;$B38416
	STX.w HDMA[$03].source_word		;$B38419
	LDX.w #$A18A				;$B3841C
	STX.w HDMA[$04].source_word		;$B3841F
	LDX.w #$A19A				;$B38422
	STX.w HDMA[$05].source_word		;$B38425
	LDX.w #$A28A				;$B38428
	STX.w HDMA[$06].source_word		;$B3842B
	LDX.w #$A38A				;$B3842E
	STX.w HDMA[$07].source_word		;$B38431
	BRA.b CODE_B38460			;$B38434

CODE_B38436:
	LDX.w #$A45A				;$B38436
	STX.w HDMA[$01].source_word		;$B38439
	LDX.w #$A47A				;$B3843C
	STX.w HDMA[$02].source_word		;$B3843F
	LDX.w #$A46A				;$B38442
	STX.w HDMA[$03].source_word		;$B38445
	LDX.w #$A48A				;$B38448
	STX.w HDMA[$04].source_word		;$B3844B
	LDX.w #$A49A				;$B3844E
	STX.w HDMA[$05].source_word		;$B38451
	LDX.w #$A58A				;$B38454
	STX.w HDMA[$06].source_word		;$B38457
	LDX.w #$A68A				;$B3845A
	STX.w HDMA[$07].source_word		;$B3845D
CODE_B38460:
	LDA.w $1975				;$B38460
	SEC					;$B38463
	SBC.w $050F				;$B38464
	CLC					;$B38467
	ADC.w #$0020				;$B38468
	SEP.b #$20				;$B3846B
	STA.w PPU.layer_3_scroll_y		;$B3846D
	STZ.w PPU.layer_3_scroll_y		;$B38470
	REP.b #$20				;$B38473
CODE_B38475:
	LDA.w $196D				;$B38475
	LSR					;$B38478
	SEP.b #$20				;$B38479
	STA.w PPU.layer_2_scroll_x		;$B3847B
	STZ.w PPU.layer_2_scroll_x		;$B3847E
	LDA.w $196D				;$B38481
	STA.w PPU.layer_1_scroll_x		;$B38484
	LDA.w $196E				;$B38487
	STA.w PPU.layer_1_scroll_x		;$B3848A
	REP.b #$20				;$B3848D
	LDA.w $1975				;$B3848F
	LSR					;$B38492
	SEP.b #$20				;$B38493
	STA.w PPU.layer_2_scroll_y		;$B38495
	STZ.w PPU.layer_2_scroll_y		;$B38498
	LDA.w $1975				;$B3849B
	STA.w PPU.layer_1_scroll_y		;$B3849E
	STZ.w PPU.layer_1_scroll_y		;$B384A1
	REP.b #$20				;$B384A4
	SEP.b #$20				;$B384A6
	LDA.w screen_brightness			;$B384A8
	STA.w PPU.screen			;$B384AB
	REP.b #$20				;$B384AE
	RTS					;$B384B0

DATA_B384B1:
	dw $4A08
	dw $1880

CODE_B384B5:
	JSR.w CODE_B380F4			;$B384B5
	LDA.w $04C0				;$B384B8
	TAX					;$B384BB
	JSR.w CODE_B38523			;$B384BC
	STA.b $1A				;$B384BF
	LDA.w $1975				;$B384C1
	JSR.w CODE_B38523			;$B384C4
	CLC					;$B384C7
	ADC.w #$011F				;$B384C8
	SEC					;$B384CB
	SBC.b $1A				;$B384CC
	SEP.b #$20				;$B384CE
	STA.w PPU.layer_2_scroll_y		;$B384D0
	XBA					;$B384D3
	STA.w PPU.layer_2_scroll_y		;$B384D4
	REP.b #$20				;$B384D7
	LDA.w $196D				;$B384D9
	LSR					;$B384DC
	LSR					;$B384DD
	SEP.b #$20				;$B384DE
	STA.w PPU.layer_2_scroll_x		;$B384E0
	STZ.w PPU.layer_2_scroll_x		;$B384E3
	REP.b #$20				;$B384E6
	LDA.w $196D				;$B384E8
	LSR					;$B384EB
	SEP.b #$20				;$B384EC
	CLC					;$B384EE
	ADC.b #$80				;$B384EF
	STA.w PPU.layer_3_scroll_x		;$B384F1
	STZ.w PPU.layer_3_scroll_x		;$B384F4
	REP.b #$20				;$B384F7
	LDA.w $1975				;$B384F9
	LSR					;$B384FC
	SEP.b #$20				;$B384FD
	STA.w PPU.layer_3_scroll_y		;$B384FF
	STZ.w PPU.layer_3_scroll_y		;$B38502
	LDA.w $196D				;$B38505
	STA.w PPU.layer_1_scroll_x		;$B38508
	LDA.w $196E				;$B3850B
	STA.w PPU.layer_1_scroll_x		;$B3850E
	LDA.w $1975				;$B38511
	STA.w PPU.layer_1_scroll_y		;$B38514
	STZ.w PPU.layer_1_scroll_y		;$B38517
	LDA.w screen_brightness			;$B3851A
	STA.w PPU.screen			;$B3851D
	REP.b #$20				;$B38520
	RTS					;$B38522

CODE_B38523:
	SEC					;$B38523
	SBC.w #$0100				;$B38524
	CPX.w #$12E0				;$B38527
	BCC.b CODE_B3852D			;$B3852A
	LSR					;$B3852C
CODE_B3852D:
	CPX.w #$09E0				;$B3852D
	BCC.b CODE_B38533			;$B38530
	LSR					;$B38532
CODE_B38533:
	CPX.w #$0560				;$B38533
	BCC.b CODE_B38539			;$B38536
	LSR					;$B38538
CODE_B38539:
	LSR					;$B38539
	LSR					;$B3853A
	RTS					;$B3853B

CODE_B3853C:
	JSL.l CODE_B38609			;$B3853C
	JSR.w CODE_B380F4			;$B38540
	JSR.w CODE_B385EB			;$B38543
	LDA.w $196D				;$B38546
	SEC					;$B38549
	SBC.w #$001C				;$B3854A
	SEP.b #$30				;$B3854D
	STA.w PPU.layer_3_scroll_x		;$B3854F
	XBA					;$B38552
	STA.w PPU.layer_3_scroll_x		;$B38553
	LDA.w $196D				;$B38556
	LDX.w $196E				;$B38559
	STA.w PPU.layer_1_scroll_x		;$B3855C
	STX.w PPU.layer_1_scroll_x		;$B3855F
	STA.w PPU.layer_2_scroll_x		;$B38562
	STX.w PPU.layer_2_scroll_x		;$B38565
	LDA.w $1975				;$B38568
	LDX.w $1976				;$B3856B
	STA.w PPU.layer_1_scroll_y		;$B3856E
	STZ.w PPU.layer_1_scroll_y		;$B38571
	REP.b #$20				;$B38574
	LDA.w $1975				;$B38576
	CLC					;$B38579
	ADC.w #$0030				;$B3857A
	SEP.b #$20				;$B3857D
	STA.w PPU.layer_3_scroll_y		;$B3857F
	XBA					;$B38582
	STA.w PPU.layer_3_scroll_y		;$B38583
	LDA.w screen_brightness			;$B38586
	STA.w PPU.screen			;$B38589
	REP.b #$30				;$B3858C
	RTS					;$B3858E

CODE_B3858F:
	JSL.l CODE_B38609			;$B3858F
	JSR.w CODE_B380F4			;$B38593
	JSR.w CODE_B385EB			;$B38596
	LDA.w $196D				;$B38599
	LSR					;$B3859C
	LSR					;$B3859D
	LSR					;$B3859E
	EOR.w #$FFFF				;$B3859F
	SEC					;$B385A2
	ADC.w $196D				;$B385A3
	SEP.b #$30				;$B385A6
	STA.w PPU.layer_3_scroll_x		;$B385A8
	XBA					;$B385AB
	STA.w PPU.layer_3_scroll_x		;$B385AC
	LDA.w $196D				;$B385AF
	LDX.w $196E				;$B385B2
	STA.w PPU.layer_1_scroll_x		;$B385B5
	STX.w PPU.layer_1_scroll_x		;$B385B8
	STA.w PPU.layer_2_scroll_x		;$B385BB
	STX.w PPU.layer_2_scroll_x		;$B385BE
	REP.b #$30				;$B385C1
	LDA.w $1975				;$B385C3
	LSR					;$B385C6
	LSR					;$B385C7
	LSR					;$B385C8
	EOR.w #$FFFF				;$B385C9
	SEC					;$B385CC
	ADC.w $1975				;$B385CD
	SEP.b #$20				;$B385D0
	STA.w PPU.layer_3_scroll_y		;$B385D2
	XBA					;$B385D5
	STA.w PPU.layer_3_scroll_y		;$B385D6
	LDA.w $1975				;$B385D9
	STA.w PPU.layer_1_scroll_y		;$B385DC
	STZ.w PPU.layer_1_scroll_y		;$B385DF
	LDA.w screen_brightness			;$B385E2
	STA.w PPU.screen			;$B385E5
	REP.b #$20				;$B385E8
	RTS					;$B385EA

CODE_B385EB:
	LDY.w #$A268				;$B385EB
	LDX.w #$A16A				;$B385EE
	LDA.b active_frame_counter		;$B385F1
	BIT.w #$0001				;$B385F3
	BEQ.b CODE_B385FE			;$B385F6
	LDY.w #$A468				;$B385F8
	LDX.w #$A36A				;$B385FB
CODE_B385FE:
	TXA					;$B385FE
	STA.l $7EA15B				;$B385FF
	TYA					;$B38603
	STA.l $7EA15E				;$B38604
	RTS					;$B38608

CODE_B38609:
	LDA.w $196D				;$B38609
	AND.w #$FFF8				;$B3860C
	CMP.w $197D				;$B3860F
	BNE.b CODE_B38615			;$B38612
	RTL					;$B38614

CODE_B38615:
	SEP.b #$20				;$B38615
	LDA.b #$81				;$B38617
	STA.w PPU.vram_control			;$B38619
	REP.b #$20				;$B3861C
	LDA.w $196D				;$B3861E
	LDX.w $1989				;$B38621
	BMI.b CODE_B3862A			;$B38624
	CLC					;$B38626
	ADC.w #$0100				;$B38627
CODE_B3862A:
	STA.b $1A				;$B3862A
	LSR					;$B3862C
	LSR					;$B3862D
	LSR					;$B3862E
	AND.w #$003F				;$B3862F
	BIT.w #$0020				;$B38632
	CLC					;$B38635
	BEQ.b CODE_B3863B			;$B38636
	ADC.w #$03E0				;$B38638
CODE_B3863B:
	ADC.w #$7000				;$B3863B
	STA.w PPU.vram_address			;$B3863E
	LDA.b $1A				;$B38641
	SEC					;$B38643
	SBC.w #$0100				;$B38644
	AND.w #$FFE0				;$B38647
	LSR					;$B3864A
	LSR					;$B3864B
	LSR					;$B3864C
	LSR					;$B3864D
	LSR					;$B3864E
	TAX					;$B3864F
	PHK					;$B38650
	PLB					;$B38651
	TXA					;$B38652
	CLC					;$B38653
	ADC.w $15E4				;$B38654
	STA.b $1E				;$B38657
	LDA.b ($1E)				;$B38659
	AND.w #$FF00				;$B3865B
	BEQ.b CODE_B38671			;$B3865E
	STA.b $1C				;$B38660
	LDA.b $1A				;$B38662
	AND.w #$0018				;$B38664
	ASL					;$B38667
	ASL					;$B38668
	ASL					;$B38669
	SEC					;$B3866A
	SBC.w #$00C0				;$B3866B
	CLC					;$B3866E
	ADC.b $1C				;$B3866F
CODE_B38671:
	CLC					;$B38671
	ADC.w #DATA_B387B6			;$B38672
	STA.w DMA[$07].source_word		;$B38675
	STA.w DMA[$07].unused_2			;$B38678
	LDA.w #$0040				;$B3867B
	STA.w DMA[$07].size			;$B3867E
	LDA.w #$1801				;$B38681
	STA.w DMA[$07].settings			;$B38684
	SEP.b #$20				;$B38687
	LDA.b #DATA_B387B6>>16			;$B38689
	STA.w DMA[$07].source_bank		;$B3868B
	LDA.b #$80				;$B3868E
	STA.w CPU.enable_dma			;$B38690
	LDA.b #$80				;$B38693
	STA.w PPU.vram_control			;$B38695
	REP.b #$20				;$B38698
	RTL					;$B3869A

DATA_B3869B:
	dw DATA_B386AF-$01
	dw DATA_B386CB-$01
	dw DATA_B38719-$01
	dw DATA_B38731-$01
	dw DATA_B3873B-$01
	dw DATA_B3874F-$01
	dw DATA_B3875B-$01
	dw DATA_B38719-$01
	dw DATA_B3874F-$01
	dw DATA_B387AB-$01

DATA_B386AF:
	db $00,$00,$00,$00,$00,$01,$02,$03,$05,$06,$07,$00,$00,$00,$00,$00
	db $00,$01,$02,$03,$05,$06,$07,$00,$00,$00,$00,$00

DATA_B386CB:
	db $00,$00,$00,$00,$01,$02,$03,$05,$06,$02,$03,$05,$06,$02,$03,$04
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$05,$06,$02
	db $03,$05,$06,$07,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02
	db $03,$05,$06,$02,$03,$04,$00,$00,$00,$00,$00,$00,$01,$02,$03,$05
	db $06,$02,$03,$05,$06,$02,$03,$04,$00,$00,$00,$00,$00,$00

DATA_B38719:
	db $00,$00,$00,$01,$02,$03,$05,$06,$02,$03,$05,$06,$02,$03,$05,$06
	db $02,$03,$05,$06,$07,$00,$00,$00

DATA_B38731:
	db $00,$00,$00,$01,$02,$03,$04,$00,$00,$00

DATA_B3873B:
	db $00,$00,$00,$01,$02,$03,$05,$06,$02,$03,$05,$06,$02,$03,$05,$06
	db $07,$00,$00,$00

DATA_B3874F:
	db $00,$00,$00,$01,$02,$03,$05,$06,$07,$00,$00,$00

DATA_B3875B:
	db $00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$05,$06,$02,$03,$04
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$02,$03,$05,$06,$02
	db $03,$05,$06,$02,$03,$04,$00,$00,$00,$00,$00,$00,$01,$02,$03,$05
	db $06,$02,$03,$04,$00,$00,$00,$00,$00,$00,$01,$02,$03,$05,$06,$02
	db $03,$05,$06,$02,$03,$04,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

DATA_B387AB:
	db $00,$00,$00,$01,$02,$03,$05,$06,$07,$00,$00

DATA_B387B6:
	incbin "data/levels/backgrounds/8x8_tilemaps/waterfall_animated_waterfall_8x8_tilemap.bin"

CODE_B38EF6:
	JSR.w CODE_B380F4			;$B38EF6
	JMP.w CODE_B39F34			;$B38EF9

CODE_B38EFC:
	JSR.w CODE_B380F4			;$B38EFC
	LDA.w $15E2				;$B38EFF
	BEQ.b CODE_B38F36			;$B38F02
	STZ.w $15E2				;$B38F04
	LDA.w $15E4				;$B38F07
	ASL					;$B38F0A
	ASL					;$B38F0B
	ASL					;$B38F0C
	ASL					;$B38F0D
	ASL					;$B38F0E
	TAX					;$B38F0F
	SEP.b #$20				;$B38F10
	STZ.w PPU.cgram_address			;$B38F12
	LDA.l DATA_B38F59,x			;$B38F15
	STA.w PPU.cgram_write			;$B38F19
	LDA.l DATA_B38F59+$01,x			;$B38F1C
	STA.w PPU.cgram_write			;$B38F20
	LDA.b #$11				;$B38F23
	STA.w PPU.cgram_address			;$B38F25
	LDY.w #$001E				;$B38F28
CODE_B38F2B:
	LDA.l DATA_B38F59+$02,x			;$B38F2B
	STA.w PPU.cgram_write			;$B38F2F
	INX					;$B38F32
	DEY					;$B38F33
	BNE.b CODE_B38F2B			;$B38F34
CODE_B38F36:
	SEP.b #$20				;$B38F36
	LDA.w $196D				;$B38F38
	SEC					;$B38F3B
	SBC.l $001B77				;$B38F3C
	STA.w PPU.layer_1_scroll_x		;$B38F40
	STZ.w PPU.layer_1_scroll_x		;$B38F43
	LDA.w $1975				;$B38F46
	SEC					;$B38F49
	SBC.l $001B79				;$B38F4A
	STA.w PPU.layer_1_scroll_y		;$B38F4E
	STA.w PPU.layer_1_scroll_y		;$B38F51
	REP.b #$20				;$B38F54
	JMP.w CODE_B39F1C			;$B38F56

DATA_B38F59:
	incbin "data/palettes/Layer1_FloodlitFishLight.bin"

CODE_B39359:
	JSR.w CODE_B380F4			;$B39359
	LDA.w $196D				;$B3935C
	ASL					;$B3935F
	ADC.w $196D				;$B39360
	LSR					;$B39363
	LSR					;$B39364
	SEP.b #$20				;$B39365
	STA.w PPU.layer_2_scroll_x		;$B39367
	STZ.w PPU.layer_2_scroll_x		;$B3936A
	REP.b #$20				;$B3936D
	LDA.w $1975				;$B3936F
	ASL					;$B39372
	ADC.w $1975				;$B39373
	LSR					;$B39376
	LSR					;$B39377
	SEP.b #$20				;$B39378
	STA.w PPU.layer_2_scroll_y		;$B3937A
	STZ.w PPU.layer_2_scroll_y		;$B3937D
	LDA.w $196D				;$B39380
	STA.w PPU.layer_1_scroll_x		;$B39383
	LDA.w $196E				;$B39386
	STA.w PPU.layer_1_scroll_x		;$B39389
	LDA.w $1975				;$B3938C
	STA.w PPU.layer_1_scroll_y		;$B3938F
	STZ.w PPU.layer_1_scroll_y		;$B39392
	LDA.w screen_brightness			;$B39395
	STA.w PPU.screen			;$B39398
	REP.b #$20				;$B3939B
	RTS					;$B3939D

CODE_B3939E:
	LDA.w $04E4				;$B3939E
	STA.w CPU.enable_dma_hdma		;$B393A1
	JSL.l CODE_B3D843			;$B393A4
	JSL.l CODE_B7B8D1			;$B393A8
	JSL.l CODE_B7B00F			;$B393AC
	JSL.l CODE_B7B012			;$B393B0
	JSL.l CODE_80801E			;$B393B4
	LDA.w $15E4				;$B393B8
	BEQ.b CODE_B393C0			;$B393BB
	DEC.w $15E4				;$B393BD
CODE_B393C0:
	LDA.w $1560				;$B393C0
	CLC					;$B393C3
	ADC.w #$0150				;$B393C4
	CMP.b $80				;$B393C7
	BCS.b CODE_B393FA			;$B393C9
	STA.w $1560				;$B393CB
	LDA.l $7EA1BA				;$B393CE
	CMP.w #$0001				;$B393D2
	BNE.b CODE_B393E4			;$B393D5
	LDA.w #$0081				;$B393D7
	LDY.w #$0000				;$B393DA
	LDX.w #$0020				;$B393DD
	JSL.l CODE_BB856D			;$B393E0
CODE_B393E4:
	LDA.l $7EA1BA				;$B393E4
	CMP.w #$0002				;$B393E8
	BNE.b CODE_B393FA			;$B393EB
	LDA.w #$0049				;$B393ED
	LDY.w #$0000				;$B393F0
	LDX.w #$0020				;$B393F3
	JSL.l CODE_BB856D			;$B393F6
CODE_B393FA:
	JSL.l CODE_B39520			;$B393FA
	LDX.w #$6401				;$B393FE
	LDA.w $1C37				;$B39401
	CMP.w #$0268				;$B39404
	BNE.b CODE_B3941D			;$B39407
	LDA.w $15E4				;$B39409
	SEC					;$B3940C
	SBC.w #$0008				;$B3940D
	CMP.w #$0008				;$B39410
	BCS.b CODE_B3941D			;$B39413
	BIT.w #$0005				;$B39415
	BEQ.b CODE_B3941D			;$B39418
	LDX.w #$2401				;$B3941A
CODE_B3941D:
	TXA					;$B3941D
	STA.l $7EA17E				;$B3941E
	LDA.w $196D				;$B39422
	SEC					;$B39425
	SBC.w $1C35				;$B39426
	STA.b $88				;$B39429
	LDA.w #$0000				;$B3942B
	SEC					;$B3942E
	SBC.b $88				;$B3942F
	BPL.b CODE_B39436			;$B39431
	LDA.w #$0000				;$B39433
CODE_B39436:
	CMP.w #$00FF				;$B39436
	BCS.b CODE_B39456			;$B39439
	STA.b $1A				;$B3943B
	LDA.w #$0100				;$B3943D
	SEC					;$B39440
	SBC.b $88				;$B39441
	BMI.b CODE_B39456			;$B39443
	CMP.w #$00FF				;$B39445
	BCC.b CODE_B3944D			;$B39448
	LDA.w #$00FF				;$B3944A
CODE_B3944D:
	SEP.b #$20				;$B3944D
	XBA					;$B3944F
	LDA.b $1A				;$B39450
	REP.b #$20				;$B39452
	BRA.b CODE_B39459			;$B39454

CODE_B39456:
	LDA.w #$00FF				;$B39456
CODE_B39459:
	STA.l $7EA19B				;$B39459
	STA.l $7EA19E				;$B3945D
	LDA.w $1975				;$B39461
	SEC					;$B39464
	SBC.w $1C37				;$B39465
	STA.l $7EA2D8				;$B39468
	LDA.w $196D				;$B3946C
	SEC					;$B3946F
	SBC.w $1C35				;$B39470
	STA.l $7EA2D6				;$B39473
	LDA.w $1973				;$B39477
	STA.l $7EA3D8				;$B3947A
	LDA.w $196D				;$B3947E
	STA.l $7EA3D6				;$B39481
	LDA.w $196D				;$B39485
	LSR					;$B39488
	STA.l $7EA1D6				;$B39489
	LDA.w $1973				;$B3948D
	LSR					;$B39490
	SEC					;$B39491
	SBC.w #$0030				;$B39492
	STA.l $7EA1D8				;$B39495
	LDA.w #$022F				;$B39499
	SEC					;$B3949C
	SBC.w $1973				;$B3949D
	CMP.w #$00FF				;$B394A0
	BCC.b CODE_B394A8			;$B394A3
	LDA.w #$00FF				;$B394A5
CODE_B394A8:
	SEP.b #$20				;$B394A8
	LSR					;$B394AA
	STA.l $7EA4DA				;$B394AB
	STA.l $7EA45A				;$B394AF
	STA.l $7EA15A				;$B394B3
	STA.l $7EA55A				;$B394B7
	STA.l $7EA17A				;$B394BB
	STA.l $7EA19A				;$B394BF
	STA.b $1A				;$B394C3
	PHP					;$B394C5
	ADC.b #$00				;$B394C6
	STA.l $7EA4DD				;$B394C8
	STA.l $7EA45F				;$B394CC
	STA.l $7EA15D				;$B394D0
	STA.l $7EA55D				;$B394D4
	STA.l $7EA17C				;$B394D8
	STA.l $7EA19D				;$B394DC
	LDA.b $1A				;$B394E0
	CLC					;$B394E2
	ADC.b #$18				;$B394E3
	CMP.b #$78				;$B394E5
	BCC.b CODE_B394EB			;$B394E7
	LDA.b #$78				;$B394E9
CODE_B394EB:
	STA.l $7EA35A				;$B394EB
	PLP					;$B394EF
	ADC.b #$00				;$B394F0
	STA.l $7EA35D				;$B394F2
	LDA.w screen_brightness			;$B394F6
	STA.w PPU.screen			;$B394F9
	REP.b #$20				;$B394FC
	RTS					;$B394FE

CODE_B394FF:
	PHB					;$B394FF
	PHK					;$B39500
	PLB					;$B39501
	LDA.b $1A				;$B39502
	PHA					;$B39504
	LDA.b $1C				;$B39505
	PHA					;$B39507
	JSL.l CODE_B39520			;$B39508
	PLA					;$B3950C
	STA.b $1C				;$B3950D
	PLA					;$B3950F
	STA.b $1A				;$B39510
	SEP.b #$20				;$B39512
	LDA.l $0004EC				;$B39514
	STA.l PPU.screen			;$B39518
	REP.b #$20				;$B3951C
	PLB					;$B3951E
	RTL					;$B3951F

CODE_B39520:
	LDA.w $15E4				;$B39520
	LSR					;$B39523
	AND.w #$001F				;$B39524
	CMP.w #$0009				;$B39527
	BCC.b CODE_B3952F			;$B3952A
	LDA.w #$0009				;$B3952C
CODE_B3952F:
	STA.b $1A				;$B3952F
	ASL					;$B39531
	STA.b $1C				;$B39532
	ASL					;$B39534
	ASL					;$B39535
	CLC					;$B39536
	ADC.b $1A				;$B39537
	ADC.b $1C				;$B39539
	ASL					;$B3953B
	TAX					;$B3953C
	SEP.b #$20				;$B3953D
	LDA.b #$05				;$B3953F
	STA.w PPU.cgram_address			;$B39541
	LDY.w #$0016				;$B39544
CODE_B39547:
	LDA.l DATA_B39555,x			;$B39547
	STA.w PPU.cgram_write			;$B3954B
	INX					;$B3954E
	DEY					;$B3954F
	BNE.b CODE_B39547			;$B39550
	REP.b #$20				;$B39552
	RTL					;$B39554

DATA_B39555:
	incbin "data/palettes/Layer3_LightningLookOutLightning.bin"

CODE_B39631:
	JSR.w CODE_B380F4			;$B39631
	JMP.w CODE_B39702			;$B39634

CODE_B39637:
	JSR.w CODE_B380F4			;$B39637
	LDX.w #$0000				;$B3963A
	LDA.w #$00FF				;$B3963D
	STA.w PPU.window_1			;$B39640
	STA.w PPU.window_2			;$B39643
	LDA.w $1973				;$B39646
	SEC					;$B39649
	SBC.w $050F				;$B3964A
	CLC					;$B3964D
	ADC.w #$00F0				;$B3964E
	CMP.w #$0108				;$B39651
	BCS.b CODE_B39680			;$B39654
	LDA.w #$0160				;$B39656
	JSR.w CODE_B39741			;$B39659
	LDA.w #$0360				;$B3965C
	JSR.w CODE_B39741			;$B3965F
	LDA.w #$0660				;$B39662
	JSR.w CODE_B39741			;$B39665
	LDA.w #$0760				;$B39668
	JSR.w CODE_B39741			;$B3966B
	LDA.w #$0860				;$B3966E
	JSR.w CODE_B39741			;$B39671
	LDA.w #$0960				;$B39674
	JSR.w CODE_B39741			;$B39677
	LDA.w #$0A60				;$B3967A
	JSR.w CODE_B39741			;$B3967D
CODE_B39680:
	LDX.w #$0000				;$B39680
	LDA.w $050F				;$B39683
	SEC					;$B39686
	SBC.w $1973				;$B39687
	BPL.b CODE_B3968F			;$B3968A
	LDA.w #$0000				;$B3968C
CODE_B3968F:
	CMP.w #$00F0				;$B3968F
	BCC.b CODE_B39697			;$B39692
	LDA.w #$00E0				;$B39694
CODE_B39697:
	CMP.w #$0080				;$B39697
	BCC.b CODE_B396C0			;$B3969A
	STA.b $1A				;$B3969C
	LDA.w #$007F				;$B3969E
	STA.l $7EA15A,x				;$B396A1
	STA.l $7EA1DA,x				;$B396A5
	LDA.w #$0411				;$B396A9
	STA.l $7EA15B,x				;$B396AC
	LDA.w #$0102				;$B396B0
	STA.l $7EA1DB,x				;$B396B3
	LDX.w #$0003				;$B396B7
	LDA.b $1A				;$B396BA
	SEC					;$B396BC
	SBC.w #$007F				;$B396BD
CODE_B396C0:
	CMP.w #$0000				;$B396C0
	BEQ.b CODE_B396DE			;$B396C3
	STA.l $7EA15A,x				;$B396C5
	STA.l $7EA1DA,x				;$B396C9
	LDA.w #$0411				;$B396CD
	STA.l $7EA15B,x				;$B396D0
	LDA.w #$0102				;$B396D4
	STA.l $7EA1DB,x				;$B396D7
	INX					;$B396DB
	INX					;$B396DC
	INX					;$B396DD
CODE_B396DE:
	LDA.w #$0001				;$B396DE
	STA.l $7EA15A,x				;$B396E1
	STA.l $7EA1DA,x				;$B396E5
	LDA.w #$1117				;$B396E9
	STA.l $7EA15B,x				;$B396EC
	LDA.w #$0602				;$B396F0
	STA.l $7EA1DB,x				;$B396F3
	LDA.w #$0000				;$B396F7
	STA.l $7EA15D,x				;$B396FA
	STA.l $7EA1DD,x				;$B396FE
CODE_B39702:
	LDA.w $1973				;$B39702
	EOR.w #$000F				;$B39705
	AND.w #$000F				;$B39708
	CLC					;$B3970B
	ADC.w #$0081				;$B3970C
	STA.l $7EA4EA				;$B3970F
	LDA.w $1973				;$B39713
	AND.w #$000F				;$B39716
	ASL					;$B39719
	ASL					;$B3971A
	CLC					;$B3971B
	ADC.w #$A51A				;$B3971C
	STA.l $7EA4EB				;$B3971F
	LDA.w $196D				;$B39723
	SEP.b #$20				;$B39726
	STA.w PPU.layer_1_scroll_x		;$B39728
	XBA					;$B3972B
	STA.w PPU.layer_1_scroll_x		;$B3972C
	LDA.w $1975				;$B3972F
	STA.w PPU.layer_1_scroll_y		;$B39732
	STZ.w PPU.layer_1_scroll_y		;$B39735
	LDA.w screen_brightness			;$B39738
	STA.w PPU.screen			;$B3973B
	REP.b #$20				;$B3973E
	RTS					;$B39740

CODE_B39741:
	STA.b $1A				;$B39741
	LDA.b $1A				;$B39743
	SEC					;$B39745
	SBC.w $196D				;$B39746
	CLC					;$B39749
	ADC.w #$005F				;$B3974A
	CMP.w #$015F				;$B3974D
	BCC.b CODE_B39753			;$B39750
	RTS					;$B39752

CODE_B39753:
	LDA.b $1A				;$B39753
	SEC					;$B39755
	SBC.w $196D				;$B39756
	BPL.b CODE_B3975E			;$B39759
	LDA.w #$0000				;$B3975B
CODE_B3975E:
	SEP.b #$20				;$B3975E
	STA.w PPU.window_1_left,x		;$B39760
	REP.b #$20				;$B39763
	LDA.b $1A				;$B39765
	CLC					;$B39767
	ADC.w #$005F				;$B39768
	SEC					;$B3976B
	SBC.w $196D				;$B3976C
	CMP.w #$00FF				;$B3976F
	BCC.b CODE_B39777			;$B39772
	LDA.w #$00FF				;$B39774
CODE_B39777:
	SEP.b #$20				;$B39777
	STA.w PPU.window_1_right,x		;$B39779
	REP.b #$20				;$B3977C
	INX					;$B3977E
	INX					;$B3977F
	RTS					;$B39780

CODE_B39781:
	JSR.w CODE_B380F4			;$B39781
	LDA.w $196D				;$B39784
	SEP.b #$20				;$B39787
	STA.w PPU.layer_1_scroll_x		;$B39789
	XBA					;$B3978C
	STA.w PPU.layer_1_scroll_x		;$B3978D
	LDA.w $1975				;$B39790
	STA.w PPU.layer_1_scroll_y		;$B39793
	STZ.w PPU.layer_1_scroll_y		;$B39796
	LDA.w screen_brightness			;$B39799
	STA.w PPU.screen			;$B3979C
	REP.b #$20				;$B3979F
	RTS					;$B397A1

CODE_B397A2:
	LDA.w $04E4				;$B397A2
	STA.w CPU.enable_dma_hdma		;$B397A5
	JSL.l CODE_B3D843			;$B397A8
	JSL.l CODE_80801E			;$B397AC
	LDA.w #$0004				;$B397B0
	TRB.w $1B7D				;$B397B3
	BEQ.b CODE_B397E9			;$B397B6
	LDX.w #$76E0				;$B397B8
	STX.w PPU.vram_address			;$B397BB
	LDA.w #$7EF5C0				;$B397BE
	STA.w DMA[$00].source_word		;$B397C1
	STA.w DMA[$00].unused_2			;$B397C4
	LDA.w #$0100				;$B397C7
	STA.w DMA[$00].size			;$B397CA
	LDA.w #$1801				;$B397CD
	STA.w DMA[$00].settings			;$B397D0
	SEP.b #$20				;$B397D3
	LDA.b #$7EF5C0>>16			;$B397D5
	STA.w DMA[$00].source_bank		;$B397D7
	LDA.b #$01				;$B397DA
	STA.w CPU.enable_dma			;$B397DC
	REP.b #$20				;$B397DF
	LDA.w #$0017				;$B397E1
	STA.w PPU.screens			;$B397E4
	REP.b #$20				;$B397E7
CODE_B397E9:
	LDA.w #$0032				;$B397E9
	SEP.b #$20				;$B397EC
	STA.w PPU.layer_3_scroll_y		;$B397EE
	STZ.w PPU.layer_3_scroll_y		;$B397F1
	LDA.b #$FB				;$B397F4
	STA.w PPU.layer_1_scroll_x		;$B397F6
	STZ.w PPU.layer_1_scroll_x		;$B397F9
	LDA.b #$02				;$B397FC
	STA.w PPU.layer_1_scroll_y		;$B397FE
	STZ.w PPU.layer_1_scroll_y		;$B39801
	LDA.w screen_brightness			;$B39804
	STA.w PPU.screen			;$B39807
	REP.b #$20				;$B3980A
	LDA.w #$0100				;$B3980C
	STA.w $196D				;$B3980F
	STA.w $1973				;$B39812
	RTS					;$B39815

CODE_B39816:
	JSR.w CODE_B380F4			;$B39816
	LDA.w $196D				;$B39819
	LSR					;$B3981C
	CLC					;$B3981D
	ADC.w #$0040				;$B3981E
	LSR					;$B39821
	SEP.b #$20				;$B39822
	STA.w PPU.layer_3_scroll_x		;$B39824
	STZ.w PPU.layer_3_scroll_x		;$B39827
	LDA.w $196D				;$B3982A
	STA.w PPU.layer_2_scroll_x		;$B3982D
	LDA.w $196E				;$B39830
	STA.w PPU.layer_2_scroll_x		;$B39833
	LDA.w $1975				;$B39836
	STA.w PPU.layer_2_scroll_y		;$B39839
	STA.w PPU.layer_2_scroll_y		;$B3983C
	REP.b #$20				;$B3983F
	LDA.w $1973				;$B39841
	LSR					;$B39844
	LSR					;$B39845
	SEP.b #$20				;$B39846
	STA.w PPU.layer_3_scroll_y		;$B39848
	STZ.w PPU.layer_3_scroll_y		;$B3984B
	LDA.w $1B79				;$B3984E
	STA.w PPU.layer_1_scroll_y		;$B39851
	LDA.w $1B7A				;$B39854
	STA.w PPU.layer_1_scroll_y		;$B39857
	LDA.w screen_brightness			;$B3985A
	STA.w PPU.screen			;$B3985D
	REP.b #$20				;$B39860
	RTS					;$B39862

CODE_B39863:
	JSR.w CODE_B380F4			;$B39863
	LDA.b active_frame_counter		;$B39866
	BIT.w #$0001				;$B39868
	BNE.b CODE_B39887			;$B3986B
	LDX.w #$7EA55A				;$B3986D
	STX.w HDMA[$01].source_word		;$B39870
	LDX.w #$7EA57A				;$B39873
	STX.w HDMA[$02].source_word		;$B39876
	LDX.w #$7EA59A				;$B39879
	STX.w HDMA[$03].source_word		;$B3987C
	LDX.w #$7EA5BA				;$B3987F
	STX.w HDMA[$04].source_word		;$B39882
	BRA.b CODE_B3989F			;$B39885

CODE_B39887:
	LDX.w #$7EA15A				;$B39887
	STX.w HDMA[$01].source_word		;$B3988A
	LDX.w #$7EA17A				;$B3988D
	STX.w HDMA[$02].source_word		;$B39890
	LDX.w #$7EA19A				;$B39893
	STX.w HDMA[$03].source_word		;$B39896
	LDX.w #$7EA1BA				;$B39899
	STX.w HDMA[$04].source_word		;$B3989C
CODE_B3989F:
	LDA.b active_frame_counter		;$B3989F
	LSR					;$B398A1
	LSR					;$B398A2
	STA.b $1A				;$B398A3
	LDA.b active_frame_counter		;$B398A5
	ASL					;$B398A7
	ASL					;$B398A8
	CLC					;$B398A9
	ADC.b $1A				;$B398AA
	AND.w #$01FE				;$B398AC
	TAX					;$B398AF
	LDA.l DATA_B9F278,x			;$B398B0
	CLC					;$B398B4
	ADC.w #$0100				;$B398B5
	LSR					;$B398B8
	LSR					;$B398B9
	LSR					;$B398BA
	LSR					;$B398BB
	LSR					;$B398BC
	STA.b $1A				;$B398BD
	LSR					;$B398BF
	LSR					;$B398C0
	CLC					;$B398C1
	ADC.w #$00FF				;$B398C2
	SEC					;$B398C5
	SBC.w $18A1				;$B398C6
	STA.l $7EA52A				;$B398C9
	STA.l $7EA52C				;$B398CD
	STA.l $7EA52E				;$B398D1
	STA.l $7EA530				;$B398D5
	INC					;$B398D9
	STA.l $7EA532				;$B398DA
	STA.l $7EA534				;$B398DE
	STA.l $7EA536				;$B398E2
	STA.l $7EA538				;$B398E6
	STA.l $7EA542				;$B398EA
	STA.l $7EA544				;$B398EE
	STA.l $7EA546				;$B398F2
	STA.l $7EA548				;$B398F6
	INC					;$B398FA
	STA.l $7EA53A				;$B398FB
	STA.l $7EA53C				;$B398FF
	STA.l $7EA53E				;$B39903
	STA.l $7EA540				;$B39907
	LDA.b active_frame_counter		;$B3990B
	LSR					;$B3990D
	LSR					;$B3990E
	SEC					;$B3990F
	SBC.w $18A1				;$B39910
	AND.w #$000F				;$B39913
	STA.b $1A				;$B39916
	EOR.w #$000F				;$B39918
	CLC					;$B3991B
	ADC.w #$0081				;$B3991C
	SEP.b #$20				;$B3991F
	STA.l $7EA4CA				;$B39921
	REP.b #$20				;$B39925
	LDA.b $1A				;$B39927
	ASL					;$B39929
	CLC					;$B3992A
	ADC.w #$A52A				;$B3992B
	STA.l $7EA4CB				;$B3992E
	LDA.w $189F				;$B39932
	CLC					;$B39935
	ADC.w #$0080				;$B39936
	BPL.b CODE_B3993E			;$B39939
	LDA.w #$0000				;$B3993B
CODE_B3993E:
	CMP.w #$00FF				;$B3993E
	BCC.b CODE_B39946			;$B39941
	LDA.w #$00FF				;$B39943
CODE_B39946:
	SEP.b #$20				;$B39946
	STA.l $7EA1AB				;$B39948
	REP.b #$20				;$B3994C
	LDA.w $189F				;$B3994E
	SEC					;$B39951
	SBC.w #$0080				;$B39952
	BPL.b CODE_B3995A			;$B39955
	LDA.w #$0000				;$B39957
CODE_B3995A:
	CMP.w #$00FF				;$B3995A
	BCC.b CODE_B39962			;$B3995D
	LDA.w #$00FF				;$B3995F
CODE_B39962:
	SEP.b #$20				;$B39962
	STA.l $7EA1AA				;$B39964
	CMP.l $7EA1AB				;$B39968
	BNE.b CODE_B3997A			;$B3996C
	LDA.b #$FF				;$B3996E
	STA.l $7EA1AA				;$B39970
	LDA.b #$00				;$B39974
	STA.l $7EA1AB				;$B39976
CODE_B3997A:
	REP.b #$20				;$B3997A
	LDA.w #$00FF				;$B3997C
	STA.l $7EA1AC				;$B3997F
	LDA.w $196D				;$B39983
	ASL					;$B39986
	ADC.w $196D				;$B39987
	LSR					;$B3998A
	LSR					;$B3998B
	SEP.b #$20				;$B3998C
	STA.w PPU.layer_2_scroll_x		;$B3998E
	STZ.w PPU.layer_2_scroll_x		;$B39991
	REP.b #$20				;$B39994
	LDA.w $1973				;$B39996
	ASL					;$B39999
	ADC.w $1973				;$B3999A
	LSR					;$B3999D
	LSR					;$B3999E
	SEP.b #$20				;$B3999F
	STA.w PPU.layer_2_scroll_y		;$B399A1
	STZ.w PPU.layer_2_scroll_y		;$B399A4
	LDA.w $196D				;$B399A7
	STA.w PPU.layer_1_scroll_x		;$B399AA
	LDA.w $196E				;$B399AD
	STA.w PPU.layer_1_scroll_x		;$B399B0
	LDA.w $1975				;$B399B3
	STA.w PPU.layer_1_scroll_y		;$B399B6
	STZ.w PPU.layer_1_scroll_y		;$B399B9
	LDA.w screen_brightness			;$B399BC
	STA.w PPU.screen			;$B399BF
	REP.b #$20				;$B399C2
	RTS					;$B399C4

DATA_B399C5:
	incbin "data/palettes/Layer1_SnowLevelSky.bin"

CODE_B39BA5:
	JSR.w CODE_B380F4			;$B39BA5
	PHK					;$B39BA8
	PLB					;$B39BA9
	LDA.w $05AF				;$B39BAA
	AND.w #$0040				;$B39BAD
	BNE.b CODE_B39BB5			;$B39BB0
	JSR.w CODE_B39BEA			;$B39BB2
CODE_B39BB5:
	LDA.w $196D				;$B39BB5
	LSR					;$B39BB8
	LSR					;$B39BB9
	SEP.b #$20				;$B39BBA
	STA.w PPU.layer_1_scroll_x		;$B39BBC
	STZ.w PPU.layer_1_scroll_x		;$B39BBF
	LDA.w $196D				;$B39BC2
	STA.w PPU.layer_2_scroll_x		;$B39BC5
	LDA.w $196E				;$B39BC8
	STA.w PPU.layer_2_scroll_x		;$B39BCB
	LDA.w $1975				;$B39BCE
	STA.w PPU.layer_2_scroll_y		;$B39BD1
	STZ.w PPU.layer_2_scroll_y		;$B39BD4
	LDA.l $7EA358				;$B39BD7
	STA.w PPU.layer_3_scroll_y		;$B39BDB
	STZ.w PPU.layer_3_scroll_y		;$B39BDE
	LDA.w screen_brightness			;$B39BE1
	STA.w PPU.screen			;$B39BE4
	REP.b #$20				;$B39BE7
	RTS					;$B39BE9

CODE_B39BEA:
	JSR.w CODE_B39DA5			;$B39BEA
	LDA.w $15E6				;$B39BED
	CMP.w $15E4				;$B39BF0
	BNE.b CODE_B39BF6			;$B39BF3
	RTS					;$B39BF5

CODE_B39BF6:
	LDA.w $15E4				;$B39BF6
	BEQ.b CODE_B39C15			;$B39BF9
	CMP.w #$0001				;$B39BFB
	BNE.b CODE_B39C64			;$B39BFE
	LDA.w $15E6				;$B39C00
	BNE.b CODE_B39C64			;$B39C03
	INC.w $15E2				;$B39C05
	LDA.w $15E2				;$B39C08
	CMP.w #$0100				;$B39C0B
	BEQ.b CODE_B39C61			;$B39C0E
	EOR.w #$00FF				;$B39C10
	BRA.b CODE_B39C20			;$B39C13

CODE_B39C15:
	INC.w $15E2				;$B39C15
	LDA.w $15E2				;$B39C18
	CMP.w #$0100				;$B39C1B
	BEQ.b CODE_B39C61			;$B39C1E
CODE_B39C20:
	LSR					;$B39C20
	LSR					;$B39C21
	LSR					;$B39C22
	LSR					;$B39C23
	ASL					;$B39C24
	STA.b $1A				;$B39C25
	ASL					;$B39C27
	ASL					;$B39C28
	CLC					;$B39C29
	ADC.b $1A				;$B39C2A
	TAX					;$B39C2C
	LDA.w parent_level_number		;$B39C2D
	CMP.w #!level_lemguin_lunge		;$B39C30
	BNE.b CODE_B39C3B			;$B39C33
	TXA					;$B39C35
	CLC					;$B39C36
	ADC.w #$00A0				;$B39C37
	TAX					;$B39C3A
CODE_B39C3B:
	LDA.w parent_level_number		;$B39C3B
	CMP.w #!level_tearaway_toboggan		;$B39C3E
	BNE.b CODE_B39C49			;$B39C41
	TXA					;$B39C43
	CLC					;$B39C44
	ADC.w #$0140				;$B39C45
	TAX					;$B39C48
CODE_B39C49:
	LDY.w #$000A				;$B39C49
	SEP.b #$20				;$B39C4C
	LDA.b #$1B				;$B39C4E
	STA.w PPU.cgram_address			;$B39C50
CODE_B39C53:
	LDA.l DATA_B399C5,x			;$B39C53
	STA.w PPU.cgram_write			;$B39C57
	INX					;$B39C5A
	DEY					;$B39C5B
	BPL.b CODE_B39C53			;$B39C5C
	REP.b #$20				;$B39C5E
	RTS					;$B39C60

CODE_B39C61:
	JMP.w CODE_B39E3F			;$B39C61

CODE_B39C64:
	LDA.w $15E4				;$B39C64
	LDX.w $15E6				;$B39C67
	CMP.w #$0003				;$B39C6A
	BNE.b CODE_B39C74			;$B39C6D
	CPX.w #$0004				;$B39C6F
	BEQ.b CODE_B39C7E			;$B39C72
CODE_B39C74:
	CMP.w #$0004				;$B39C74
	BNE.b CODE_B39CBA			;$B39C77
	CPX.w #$0003				;$B39C79
	BNE.b CODE_B39CBA			;$B39C7C
CODE_B39C7E:
	INC.w $15E2				;$B39C7E
	LDA.w $15E2				;$B39C81
	CMP.w #$00C0				;$B39C84
	BEQ.b CODE_B39CB7			;$B39C87
	CPX.w #$0003				;$B39C89
	BEQ.b CODE_B39C96			;$B39C8C
	SEC					;$B39C8E
	SBC.w #$00C0				;$B39C8F
	EOR.w #$FFFF				;$B39C92
	INC					;$B39C95
CODE_B39C96:
	LSR					;$B39C96
	LSR					;$B39C97
	LSR					;$B39C98
	STA.b $1A				;$B39C99
	SEP.b #$20				;$B39C9B
	LDA.b #$04				;$B39C9D
	STA.w PPU.cgram_address			;$B39C9F
	REP.b #$20				;$B39CA2
	LDA.w #$0008				;$B39CA4
	JSR.w CODE_B39E49			;$B39CA7
	LDA.w #$0010				;$B39CAA
	JSR.w CODE_B39E49			;$B39CAD
	LDA.w #$0018				;$B39CB0
	JSR.w CODE_B39E49			;$B39CB3
	RTS					;$B39CB6

CODE_B39CB7:
	JMP.w CODE_B39E3F			;$B39CB7

CODE_B39CBA:
	LDA.w $15E4				;$B39CBA
	CLC					;$B39CBD
	ADC.w $15E6				;$B39CBE
	CMP.w #$0009				;$B39CC1
	BEQ.b CODE_B39CC9			;$B39CC4
	JMP.w CODE_B39DA4			;$B39CC6

CODE_B39CC9:
	LDA.w $15E4				;$B39CC9
	CMP.w #$0005				;$B39CCC
	BEQ.b CODE_B39CD4			;$B39CCF
	JMP.w CODE_B39D35			;$B39CD1

CODE_B39CD4:
	INC.w $15E2				;$B39CD4
	LDA.w $15E2				;$B39CD7
	CMP.w #$00D8				;$B39CDA
	BNE.b CODE_B39CE2			;$B39CDD
	JMP.w CODE_B39E3F			;$B39CDF

CODE_B39CE2:
	SEC					;$B39CE2
	SBC.w #$0078				;$B39CE3
	BEQ.b CODE_B39CF8			;$B39CE6
	BCC.b CODE_B39D2B			;$B39CE8
	LSR					;$B39CEA
	LSR					;$B39CEB
	LSR					;$B39CEC
	STA.b $1A				;$B39CED
	LDA.w #$000C				;$B39CEF
	SEC					;$B39CF2
	SBC.b $1A				;$B39CF3
	JMP.w CODE_B39D4B			;$B39CF5

CODE_B39CF8:
	LDA.w #$0613				;$B39CF8
	STA.w PPU.screens			;$B39CFB
	LDA.w #$0400				;$B39CFE
	STA.w PPU.window_masks			;$B39D01
	SEP.b #$20				;$B39D04
	LDA.b #$00				;$B39D06
	STA.w PPU.window_layer_logic		;$B39D08
	LDA.b #$01				;$B39D0B
	STA.w PPU.cgram_address			;$B39D0D
	STZ.w PPU.cgram_write			;$B39D10
	STZ.w PPU.cgram_write			;$B39D13
	STZ.w PPU.cgram_write			;$B39D16
	STZ.w PPU.cgram_write			;$B39D19
	STZ.w PPU.cgram_write			;$B39D1C
	STZ.w PPU.cgram_write			;$B39D1F
	REP.b #$20				;$B39D22
	LDA.w #$8004				;$B39D24
	STA.w $15EA				;$B39D27
	RTS					;$B39D2A

CODE_B39D2B:
	SEP.b #$20				;$B39D2B
	LDA.b #$30				;$B39D2D
	STA.w PPU.window_layer_logic		;$B39D2F
	REP.b #$20				;$B39D32
	RTS					;$B39D34

CODE_B39D35:
	INC.w $15E2				;$B39D35
	LDA.w $15E2				;$B39D38
	CMP.w #$00D8				;$B39D3B
	BNE.b CODE_B39D43			;$B39D3E
	JMP.w CODE_B39E3F			;$B39D40

CODE_B39D43:
	CMP.w #$0060				;$B39D43
	BCS.b CODE_B39D69			;$B39D46
	LSR					;$B39D48
	LSR					;$B39D49
	LSR					;$B39D4A
CODE_B39D4B:
	STA.b $1A				;$B39D4B
	SEP.b #$20				;$B39D4D
	LDA.b #$01				;$B39D4F
	STA.w PPU.cgram_address			;$B39D51
	REP.b #$20				;$B39D54
	LDA.w #$0004				;$B39D56
	JSR.w CODE_B39E49			;$B39D59
	LDA.w #$0008				;$B39D5C
	JSR.w CODE_B39E49			;$B39D5F
	LDA.w #$000C				;$B39D62
	JSR.w CODE_B39E49			;$B39D65
	RTS					;$B39D68

CODE_B39D69:
	BNE.b CODE_B39DA4			;$B39D69
	LDA.w #$0217				;$B39D6B
	STA.w PPU.screens			;$B39D6E
	LDA.w #$0007				;$B39D71
	STA.w PPU.window_masks			;$B39D74
	SEP.b #$20				;$B39D77
	LDA.b #$01				;$B39D79
	STA.w PPU.cgram_address			;$B39D7B
	LDA.b #$18				;$B39D7E
	STA.w PPU.cgram_write			;$B39D80
	LDA.b #$63				;$B39D83
	STA.w PPU.cgram_write			;$B39D85
	LDA.b #$9C				;$B39D88
	STA.w PPU.cgram_write			;$B39D8A
	LDA.b #$73				;$B39D8D
	STA.w PPU.cgram_write			;$B39D8F
	LDA.b #$FF				;$B39D92
	STA.w PPU.cgram_write			;$B39D94
	LDA.b #$7F				;$B39D97
	STA.w PPU.cgram_write			;$B39D99
	REP.b #$20				;$B39D9C
	LDA.w #$0004				;$B39D9E
	STA.w $15EA				;$B39DA1
CODE_B39DA4:
	RTS					;$B39DA4

CODE_B39DA5:
	LDA.w $15EC				;$B39DA5
	CMP.w #$00FE				;$B39DA8
	BCC.b CODE_B39DB0			;$B39DAB
	JMP.w CODE_B39E3E			;$B39DAD

CODE_B39DB0:
	CMP.w #$001E				;$B39DB0
	BCC.b CODE_B39DF4			;$B39DB3
	SBC.w #$001C				;$B39DB5
	LSR					;$B39DB8
	SEP.b #$20				;$B39DB9
	STA.l $7EA15A				;$B39DBB
	STA.l $7EA1EA				;$B39DBF
	ADC.b #$00				;$B39DC3
	STA.l $7EA15D				;$B39DC5
	STA.l $7EA1ED				;$B39DC9
	LDA.b #$9D				;$B39DCD
	STA.l $7EA1F0				;$B39DCF
	STA.l $7EA160				;$B39DD3
	REP.b #$20				;$B39DD7
	LDA.w #$A1DE				;$B39DD9
	STA.l $7EA15B				;$B39DDC
	STA.l $7EA15E				;$B39DE0
	LDA.w #$A16A				;$B39DE4
	STA.l $7EA161				;$B39DE7
	LDA.w #$A1FA				;$B39DEB
	STA.l $7EA1F1				;$B39DEE
	BRA.b CODE_B39E3E			;$B39DF2

CODE_B39DF4:
	STA.b $1A				;$B39DF4
	SEP.b #$20				;$B39DF6
	CLC					;$B39DF8
	ADC.b #$81				;$B39DF9
	STA.l $7EA160				;$B39DFB
	STA.l $7EA1F0				;$B39DFF
	LDA.b #$01				;$B39E03
	STA.l $7EA15A				;$B39E05
	STA.l $7EA15D				;$B39E09
	STA.l $7EA1EA				;$B39E0D
	STA.l $7EA1ED				;$B39E11
	REP.b #$20				;$B39E15
	LDA.w #$A1DC				;$B39E17
	STA.l $7EA15B				;$B39E1A
	STA.l $7EA15E				;$B39E1E
	LDA.w #$001C				;$B39E22
	SEC					;$B39E25
	SBC.b $1A				;$B39E26
	STA.b $1A				;$B39E28
	ASL					;$B39E2A
	ASL					;$B39E2B
	CLC					;$B39E2C
	ADC.w #$A16A				;$B39E2D
	STA.l $7EA161				;$B39E30
	LDA.b $1A				;$B39E34
	CLC					;$B39E36
	ADC.w #$A1FA				;$B39E37
	STA.l $7EA1F1				;$B39E3A
CODE_B39E3E:
	RTS					;$B39E3E

CODE_B39E3F:
	LDA.w $15E6				;$B39E3F
	STA.w $15E4				;$B39E42
	STZ.w $15E2				;$B39E45
	RTS					;$B39E48

CODE_B39E49:
	SEC					;$B39E49
	SBC.b $1A				;$B39E4A
	BPL.b CODE_B39E51			;$B39E4C
	LDA.w #$0000				;$B39E4E
CODE_B39E51:
	STA.b $1C				;$B39E51
	ASL					;$B39E53
	ASL					;$B39E54
	XBA					;$B39E55
	TSB.b $1C				;$B39E56
	XBA					;$B39E58
	ASL					;$B39E59
	ASL					;$B39E5A
	ASL					;$B39E5B
	ORA.b $1C				;$B39E5C
	SEP.b #$20				;$B39E5E
	STA.w PPU.cgram_write			;$B39E60
	XBA					;$B39E63
	STA.w PPU.cgram_write			;$B39E64
	REP.b #$20				;$B39E67
	RTS					;$B39E69

CODE_B39E6A:
	LDA.w $04E4				;$B39E6A
	STA.w CPU.enable_dma_hdma		;$B39E6D
	JSL.l CODE_B3D843			;$B39E70
	JSL.l CODE_80801E			;$B39E74
	SEP.b #$20				;$B39E78
	LDA.l $7EA69A				;$B39E7A
	STA.w PPU.cgram_address			;$B39E7E
	LDA.l $7EA69C				;$B39E81
	STA.w PPU.cgram_write			;$B39E85
	LDA.l $7EA69D				;$B39E88
	STA.w PPU.cgram_write			;$B39E8C
	SEP.b #$20				;$B39E8F
	LDA.b #$FF				;$B39E91
	STA.w PPU.layer_1_scroll_y		;$B39E93
	STZ.w PPU.layer_1_scroll_y		;$B39E96
	STA.w PPU.layer_2_scroll_y		;$B39E99
	STZ.w PPU.layer_2_scroll_y		;$B39E9C
	LDA.w screen_brightness			;$B39E9F
	STA.w PPU.screen			;$B39EA2
	REP.b #$20				;$B39EA5
	LDA.w #$0100				;$B39EA7
	STA.w $196D				;$B39EAA
	STA.w $1973				;$B39EAD
	RTS					;$B39EB0

CODE_B39EB1:
	JSR.w CODE_B380F4			;$B39EB1
	LDA.w $196D				;$B39EB4
	ASL					;$B39EB7
	ADC.w $196D				;$B39EB8
	LSR					;$B39EBB
	LSR					;$B39EBC
	SEP.b #$20				;$B39EBD
	STA.w PPU.layer_3_scroll_x		;$B39EBF
	STZ.w PPU.layer_3_scroll_x		;$B39EC2
	REP.b #$20				;$B39EC5
	LDA.b active_frame_counter		;$B39EC7
	ASL					;$B39EC9
	XBA					;$B39ECA
	AND.w #$0200				;$B39ECB
	EOR.w #$0200				;$B39ECE
	CLC					;$B39ED1
	ADC.w #$A17A				;$B39ED2
	STA.w HDMA[$02].source_word		;$B39ED5
	LDA.w $1973				;$B39ED8
	ASL					;$B39EDB
	ADC.w $1973				;$B39EDC
	LSR					;$B39EDF
	LSR					;$B39EE0
	SEP.b #$20				;$B39EE1
	STA.w PPU.layer_3_scroll_y		;$B39EE3
	STZ.w PPU.layer_3_scroll_y		;$B39EE6
	LDA.w $1B77				;$B39EE9
	STA.w PPU.layer_2_scroll_x		;$B39EEC
	STZ.w PPU.layer_2_scroll_x		;$B39EEF
	LDA.w $1B79				;$B39EF2
	STA.w PPU.layer_2_scroll_y		;$B39EF5
	STZ.w PPU.layer_2_scroll_y		;$B39EF8
	LDA.w $196D				;$B39EFB
	STA.w PPU.layer_1_scroll_x		;$B39EFE
	LDA.w $196E				;$B39F01
	STA.w PPU.layer_1_scroll_x		;$B39F04
	LDA.w $1975				;$B39F07
	STA.w PPU.layer_1_scroll_y		;$B39F0A
	STZ.w PPU.layer_1_scroll_y		;$B39F0D
	LDA.w screen_brightness			;$B39F10
	STA.w PPU.screen			;$B39F13
	REP.b #$20				;$B39F16
	RTS					;$B39F18

CODE_B39F19:
	JSR.w CODE_B380F4			;$B39F19
CODE_B39F1C:
	LDA.b active_frame_counter		;$B39F1C
	ASL					;$B39F1E
	XBA					;$B39F1F
	AND.w #$0200				;$B39F20
	EOR.w #$0200				;$B39F23
	CLC					;$B39F26
	ADC.w #$A15A				;$B39F27
	STA.w HDMA[$01].source_word		;$B39F2A
	CLC					;$B39F2D
	ADC.w #$0020				;$B39F2E
	STA.w HDMA[$02].source_word		;$B39F31
CODE_B39F34:
	SEP.b #$20				;$B39F34
	LDA.b global_frame_counter		;$B39F36
	AND.b #$01				;$B39F38
	ASL					;$B39F3A
	ASL					;$B39F3B
	INC					;$B39F3C
	CLC					;$B39F3D
	ADC.b #$08				;$B39F3E
	STA.l $7EA19A				;$B39F40
	REP.b #$20				;$B39F44
	LDA.b active_frame_counter		;$B39F46
	LSR					;$B39F48
	LSR					;$B39F49
	CLC					;$B39F4A
	ADC.w $1975				;$B39F4B
	EOR.w #$000F				;$B39F4E
	AND.w #$000F				;$B39F51
	CLC					;$B39F54
	ADC.w #$0081				;$B39F55
	STA.l $7EA4EA				;$B39F58
	LDA.b active_frame_counter		;$B39F5C
	LSR					;$B39F5E
	LSR					;$B39F5F
	CLC					;$B39F60
	ADC.w $1975				;$B39F61
	AND.w #$000F				;$B39F64
	ASL					;$B39F67
	CLC					;$B39F68
	ADC.w #$A51A				;$B39F69
	STA.l $7EA4EB				;$B39F6C
	LDA.b active_frame_counter		;$B39F70
	EOR.w #$FFFF				;$B39F72
	LSR					;$B39F75
	LSR					;$B39F76
	LSR					;$B39F77
	CLC					;$B39F78
	ADC.w $1975				;$B39F79
	EOR.w #$000F				;$B39F7C
	AND.w #$000F				;$B39F7F
	CLC					;$B39F82
	ADC.w #$0081				;$B39F83
	STA.l $7EA5BA				;$B39F86
	LDA.b active_frame_counter		;$B39F8A
	EOR.w #$FFFF				;$B39F8C
	LSR					;$B39F8F
	LSR					;$B39F90
	LSR					;$B39F91
	CLC					;$B39F92
	ADC.w $1975				;$B39F93
	AND.w #$000F				;$B39F96
	ASL					;$B39F99
	CLC					;$B39F9A
	ADC.w #$A5EA				;$B39F9B
	STA.l $7EA5BB				;$B39F9E
	LDA.b active_frame_counter		;$B39FA2
	LSR					;$B39FA4
	CLC					;$B39FA5
	ADC.w $1975				;$B39FA6
	LSR					;$B39FA9
	STA.b $1A				;$B39FAA
	EOR.w #$000F				;$B39FAC
	AND.w #$000F				;$B39FAF
	CLC					;$B39FB2
	ADC.w #$0081				;$B39FB3
	STA.l $7EA55A				;$B39FB6
	LDA.b $1A				;$B39FBA
	AND.w #$000F				;$B39FBC
	ASL					;$B39FBF
	CLC					;$B39FC0
	ADC.w #$A58A				;$B39FC1
	STA.l $7EA55B				;$B39FC4
	LDA.w $1975				;$B39FC8
	STA.l $7EA5EA				;$B39FCB
	STA.l $7EA5EC				;$B39FCF
	STA.l $7EA5EE				;$B39FD3
	STA.l $7EA5F0				;$B39FD7
	STA.l $7EA5F2				;$B39FDB
	STA.l $7EA5F4				;$B39FDF
	STA.l $7EA5F6				;$B39FE3
	STA.l $7EA5F8				;$B39FE7
	INC					;$B39FEB
	STA.l $7EA5FA				;$B39FEC
	STA.l $7EA5FC				;$B39FF0
	STA.l $7EA5FE				;$B39FF4
	STA.l $7EA600				;$B39FF8
	STA.l $7EA602				;$B39FFC
	STA.l $7EA604				;$B3A000
	STA.l $7EA606				;$B3A004
	STA.l $7EA608				;$B3A008
	LDA.w $196D				;$B3A00C
	STA.l $7EA51A				;$B3A00F
	STA.l $7EA51C				;$B3A013
	STA.l $7EA51E				;$B3A017
	STA.l $7EA520				;$B3A01B
	INC					;$B3A01F
	STA.l $7EA522				;$B3A020
	STA.l $7EA524				;$B3A024
	STA.l $7EA526				;$B3A028
	STA.l $7EA528				;$B3A02C
	STA.l $7EA532				;$B3A030
	STA.l $7EA534				;$B3A034
	STA.l $7EA536				;$B3A038
	STA.l $7EA538				;$B3A03C
	INC					;$B3A040
	STA.l $7EA52A				;$B3A041
	STA.l $7EA52C				;$B3A045
	STA.l $7EA52E				;$B3A049
	STA.l $7EA530				;$B3A04D
	LDA.w $196D				;$B3A051
	LSR					;$B3A054
	STA.l $7EA58A				;$B3A055
	STA.l $7EA58C				;$B3A059
	STA.l $7EA58E				;$B3A05D
	INC					;$B3A061
	STA.l $7EA590				;$B3A062
	STA.l $7EA592				;$B3A066
	STA.l $7EA594				;$B3A06A
	STA.l $7EA5A4				;$B3A06E
	STA.l $7EA5A6				;$B3A072
	STA.l $7EA5A8				;$B3A076
	INC					;$B3A07A
	STA.l $7EA596				;$B3A07B
	STA.l $7EA598				;$B3A07F
	STA.l $7EA5A0				;$B3A083
	STA.l $7EA5A2				;$B3A087
	INC					;$B3A08B
	STA.l $7EA59A				;$B3A08C
	STA.l $7EA59C				;$B3A090
	STA.l $7EA59E				;$B3A094
	LDA.w $1975				;$B3A098
	LSR					;$B3A09B
	SEP.b #$20				;$B3A09C
	STA.w PPU.layer_3_scroll_y		;$B3A09E
	STZ.w PPU.layer_3_scroll_y		;$B3A0A1
	LDA.w screen_brightness			;$B3A0A4
	STA.w PPU.screen			;$B3A0A7
	REP.b #$20				;$B3A0AA
	RTS					;$B3A0AC

CODE_B3A0AD:
	LDA.w $04E4				;$B3A0AD
	STA.w CPU.enable_dma_hdma		;$B3A0B0
	JSL.l CODE_B3D843			;$B3A0B3
	JSL.l CODE_80801E			;$B3A0B7
	JSL.l CODE_80801E			;$B3A0BB
	JSL.l CODE_80801E			;$B3A0BF
	LDA.b active_frame_counter		;$B3A0C3
	EOR.w #$0001				;$B3A0C5
	AND.w #$0001				;$B3A0C8
	BEQ.b CODE_B3A0D0			;$B3A0CB
	LDA.w #$0030				;$B3A0CD
CODE_B3A0D0:
	CLC					;$B3A0D0
	ADC.w #$A19A				;$B3A0D1
	STA.w HDMA[$02].source_word		;$B3A0D4
	LDA.w $15E6				;$B3A0D7
	BNE.b CODE_B3A109			;$B3A0DA
	LDA.w $1B77				;$B3A0DC
	SEP.b #$20				;$B3A0DF
	STA.w PPU.layer_1_scroll_x		;$B3A0E1
	XBA					;$B3A0E4
	STA.w PPU.layer_1_scroll_x		;$B3A0E5
	LDA.w $1B79				;$B3A0E8
	STA.w PPU.layer_1_scroll_y		;$B3A0EB
	STZ.w PPU.layer_1_scroll_y		;$B3A0EE
	LDA.w $196D				;$B3A0F1
	STA.w PPU.layer_2_scroll_x		;$B3A0F4
	LDA.w $196E				;$B3A0F7
	DEC					;$B3A0FA
	STA.w PPU.layer_2_scroll_x		;$B3A0FB
	LDA.w $1975				;$B3A0FE
	STA.w PPU.layer_2_scroll_y		;$B3A101
	STZ.w PPU.layer_2_scroll_y		;$B3A104
	REP.b #$20				;$B3A107
CODE_B3A109:
	LDA.w $15E4				;$B3A109
	CMP.w #$0004				;$B3A10C
	BNE.b CODE_B3A135			;$B3A10F
	SEP.b #$20				;$B3A111
	LDA.b #$17				;$B3A113
	STA.w PPU.main_screen			;$B3A115
	REP.b #$20				;$B3A118
	LDA.w #$0626				;$B3A11A
	STA.w PPU.layer_all_tiledata_base	;$B3A11D
	LDA.w #$7178				;$B3A120
	STA.w PPU.layer_1_2_tilemap_base	;$B3A123
	LDA.w #$0110				;$B3A126
	STA.w PPU.color_math			;$B3A129
	LDA.w #$0C03				;$B3A12C
	STA.w PPU.set_window_layer_all		;$B3A12F
	INC.w $15E4				;$B3A132
CODE_B3A135:
	LDA.w $15E4				;$B3A135
	CMP.w #$0002				;$B3A138
	BNE.b CODE_B3A16A			;$B3A13B
	SEP.b #$20				;$B3A13D
	LDA.b #$15				;$B3A13F
	STA.w PPU.main_screen			;$B3A141
	REP.b #$20				;$B3A144
	LDA.w $04E4				;$B3A146
	EOR.w #$0600				;$B3A149
	STA.w $04E4				;$B3A14C
	LDA.w #$0662				;$B3A14F
	STA.w PPU.layer_all_tiledata_base	;$B3A152
	LDA.w #$7C71				;$B3A155
	STA.w PPU.layer_1_2_tilemap_base	;$B3A158
	LDA.w #$2102				;$B3A15B
	STA.w PPU.color_math			;$B3A15E
	LDA.w #$0C30				;$B3A161
	STA.w PPU.set_window_layer_all		;$B3A164
	INC.w $15E4				;$B3A167
CODE_B3A16A:
	LDA.w #$014B				;$B3A16A
	SEC					;$B3A16D
	SBC.w $196D				;$B3A16E
	BPL.b CODE_B3A176			;$B3A171
	LDA.w #$0000				;$B3A173
CODE_B3A176:
	SEP.b #$20				;$B3A176
	STA.w PPU.window_2_left			;$B3A178
	STA.w PPU.window_1_left			;$B3A17B
	REP.b #$20				;$B3A17E
	LDA.w #$02B4				;$B3A180
	SEC					;$B3A183
	SBC.w $196D				;$B3A184
	CMP.w #$0100				;$B3A187
	BCC.b CODE_B3A18F			;$B3A18A
	LDA.w #$00FF				;$B3A18C
CODE_B3A18F:
	SEP.b #$20				;$B3A18F
	STA.w PPU.window_1_right		;$B3A191
	REP.b #$20				;$B3A194
	LDA.w #$025C				;$B3A196
	SEC					;$B3A199
	SBC.w $196D				;$B3A19A
	CMP.w #$0100				;$B3A19D
	BCC.b CODE_B3A1A5			;$B3A1A0
	LDA.w #$00FF				;$B3A1A2
CODE_B3A1A5:
	SEP.b #$20				;$B3A1A5
	STA.w PPU.window_2_right		;$B3A1A7
	REP.b #$20				;$B3A1AA
	LDA.w $15E4				;$B3A1AC
	CMP.w #$0003				;$B3A1AF
	BNE.b CODE_B3A21E			;$B3A1B2
	SEP.b #$20				;$B3A1B4
	LDA.w $05AF				;$B3A1B6
	BIT.b #$40				;$B3A1B9
	BNE.b CODE_B3A1D8			;$B3A1BB
	LDA.b #$E0				;$B3A1BD
	STA.w PPU.fixed_color			;$B3A1BF
	LDA.w $15E6				;$B3A1C2
	BIT.b #$02				;$B3A1C5
	BEQ.b CODE_B3A1D8			;$B3A1C7
	REP.b #$20				;$B3A1C9
	JSL.l CODE_808018			;$B3A1CB
	SEP.b #$20				;$B3A1CF
	AND.b #$01				;$B3A1D1
	ORA.b #$C0				;$B3A1D3
	STA.w PPU.fixed_color			;$B3A1D5
CODE_B3A1D8:
	LDA.b active_frame_counter		;$B3A1D8
	ASL					;$B3A1DA
	STA.b $1A				;$B3A1DB
	ASL					;$B3A1DD
	ASL					;$B3A1DE
	CLC					;$B3A1DF
	ADC.b $1A				;$B3A1E0
	AND.b #$E0				;$B3A1E2
	SEC					;$B3A1E4
	SBC.b active_frame_counter		;$B3A1E5
	CLC					;$B3A1E7
	ADC.w $196D				;$B3A1E8
	STA.w PPU.layer_2_scroll_x		;$B3A1EB
	STZ.w PPU.layer_2_scroll_x		;$B3A1EE
	LDA.w $15E6				;$B3A1F1
	AND.b #$12				;$B3A1F4
	STA.l $7EA17F				;$B3A1F6
	LDA.w $1975				;$B3A1FA
	SEC					;$B3A1FD
	SBC.b #$0C				;$B3A1FE
	STA.w PPU.layer_2_scroll_y		;$B3A200
	STZ.w PPU.layer_2_scroll_y		;$B3A203
	LDA.w $196D				;$B3A206
	STA.w PPU.layer_1_scroll_x		;$B3A209
	LDA.w $196E				;$B3A20C
	DEC					;$B3A20F
	STA.w PPU.layer_1_scroll_x		;$B3A210
	LDA.w $1975				;$B3A213
	STA.w PPU.layer_1_scroll_y		;$B3A216
	STZ.w PPU.layer_1_scroll_y		;$B3A219
	REP.b #$20				;$B3A21C
CODE_B3A21E:
	SEP.b #$20				;$B3A21E
	LDA.w $196D				;$B3A220
	CLC					;$B3A223
	ADC.l $7EA35A				;$B3A224
	STA.w PPU.layer_3_scroll_x		;$B3A228
	STZ.w PPU.layer_3_scroll_x		;$B3A22B
	LDA.w screen_brightness			;$B3A22E
	STA.w PPU.screen			;$B3A231
	REP.b #$20				;$B3A234
	RTS					;$B3A236

CODE_B3A237:
	JSR.w CODE_B380F4			;$B3A237
	LDA.l $7EA69A				;$B3A23A
	BEQ.b CODE_B3A277			;$B3A23E
	SEP.b #$20				;$B3A240
	STA.w PPU.cgram_address			;$B3A242
	LDA.l $7EA69C				;$B3A245
	STA.w PPU.cgram_write			;$B3A249
	LDA.l $7EA69D				;$B3A24C
	STA.w PPU.cgram_write			;$B3A250
	LDA.l $7EA69E				;$B3A253
	STA.w PPU.cgram_write			;$B3A257
	LDA.l $7EA69F				;$B3A25A
	STA.w PPU.cgram_write			;$B3A25E
	LDA.l $7EA6A0				;$B3A261
	STA.w PPU.cgram_write			;$B3A265
	LDA.l $7EA6A1				;$B3A268
	STA.w PPU.cgram_write			;$B3A26C
	LDA.b #$00				;$B3A26F
	STA.l $7EA69A				;$B3A271
	REP.b #$20				;$B3A275
CODE_B3A277:
	LDX.w #$0060				;$B3A277
	LDA.w $1B79				;$B3A27A
	EOR.w #$FFFF				;$B3A27D
	CMP.w #$0001				;$B3A280
	BMI.b CODE_B3A2B6			;$B3A283
	CMP.w #$0080				;$B3A285
	BCC.b CODE_B3A2A6			;$B3A288
	SBC.w #$007F				;$B3A28A
	CMP.w #$0070				;$B3A28D
	BCC.b CODE_B3A295			;$B3A290
	LDA.w #$0070				;$B3A292
CODE_B3A295:
	STA.l $7EA15A,x				;$B3A295
	LDA.w #$0016				;$B3A299
	STA.l $7EA15B,x				;$B3A29C
	LDX.w #$0062				;$B3A2A0
	LDA.w #$007F				;$B3A2A3
CODE_B3A2A6:
	STA.l $7EA15A,x				;$B3A2A6
	LDA.w #$0016				;$B3A2AA
	STA.l $7EA15B,x				;$B3A2AD
	INX					;$B3A2B1
	INX					;$B3A2B2
	LDA.w #$0000				;$B3A2B3
CODE_B3A2B6:
	CLC					;$B3A2B6
	ADC.w #$0080				;$B3A2B7
	CMP.w #$0001				;$B3A2BA
	BMI.b CODE_B3A2CC			;$B3A2BD
	STA.l $7EA15A,x				;$B3A2BF
	LDA.w #$0017				;$B3A2C3
	STA.l $7EA15B,x				;$B3A2C6
	INX					;$B3A2CA
	INX					;$B3A2CB
CODE_B3A2CC:
	LDA.w #$0001				;$B3A2CC
	STA.l $7EA15A,x				;$B3A2CF
	LDA.w #$0016				;$B3A2D3
	STA.l $7EA15B,x				;$B3A2D6
	LDA.w #$0000				;$B3A2DA
	STA.l $7EA15C,x				;$B3A2DD
	LDA.b active_frame_counter		;$B3A2E1
	BIT.w #$0001				;$B3A2E3
	BNE.b CODE_B3A310			;$B3A2E6
	LDA.w #$A1DA				;$B3A2E8
	STA.l $7EA17E				;$B3A2EB
	LDA.w #$A226				;$B3A2EF
	STA.l $7EA181				;$B3A2F2
	LDA.w #$A27A				;$B3A2F6
	STA.l $7EA18E				;$B3A2F9
	LDA.w #$A2C6				;$B3A2FD
	STA.l $7EA191				;$B3A300
	LDA.w #$A31A				;$B3A304
	STA.l $7EA19E				;$B3A307
	LDA.w #$A3BA				;$B3A30B
	BRA.b CODE_B3A336			;$B3A30E

CODE_B3A310:
	LDA.w #$A45A				;$B3A310
	STA.l $7EA17E				;$B3A313
	LDA.w #$A4A6				;$B3A317
	STA.l $7EA181				;$B3A31A
	LDA.w #$A4FA				;$B3A31E
	STA.l $7EA18E				;$B3A321
	LDA.w #$A546				;$B3A325
	STA.l $7EA191				;$B3A328
	LDA.w #$A59A				;$B3A32C
	STA.l $7EA19E				;$B3A32F
	LDA.w #$A63A				;$B3A333
CODE_B3A336:
	STA.l $7EA1AE				;$B3A336
	LDA.w $15E2				;$B3A33A
	BEQ.b CODE_B3A357			;$B3A33D
	DEC					;$B3A33F
	ASL					;$B3A340
	ASL					;$B3A341
	ASL					;$B3A342
	ASL					;$B3A343
	AND.w #$01FF				;$B3A344
	CLC					;$B3A347
	ADC.w #DATA_B3E322			;$B3A348
	STA.l $7EA16E				;$B3A34B
	CLC					;$B3A34F
	ADC.w #$004E				;$B3A350
	STA.l $7EA171				;$B3A353
CODE_B3A357:
	LDA.w $196D				;$B3A357
	LSR					;$B3A35A
	SEP.b #$20				;$B3A35B
	STA.w PPU.layer_3_scroll_x		;$B3A35D
	STZ.w PPU.layer_3_scroll_x		;$B3A360
	REP.b #$20				;$B3A363
	LDA.w $1975				;$B3A365
	LSR					;$B3A368
	SEP.b #$20				;$B3A369
	STA.w PPU.layer_3_scroll_y		;$B3A36B
	STZ.w PPU.layer_3_scroll_y		;$B3A36E
	LDA.w $1B77				;$B3A371
	STA.w PPU.layer_1_scroll_x		;$B3A374
	LDA.w $1B78				;$B3A377
	STA.w PPU.layer_1_scroll_x		;$B3A37A
	LDA.w $1B79				;$B3A37D
	STA.w PPU.layer_1_scroll_y		;$B3A380
	STZ.w PPU.layer_1_scroll_y		;$B3A383
	LDA.w $196D				;$B3A386
	STA.w PPU.layer_2_scroll_x		;$B3A389
	LDA.w $196E				;$B3A38C
	STA.w PPU.layer_2_scroll_x		;$B3A38F
	LDA.w $1975				;$B3A392
	STA.w PPU.layer_2_scroll_y		;$B3A395
	STZ.w PPU.layer_2_scroll_y		;$B3A398
	LDA.w screen_brightness			;$B3A39B
	STA.w PPU.screen			;$B3A39E
	REP.b #$20				;$B3A3A1
	RTS					;$B3A3A3

CODE_B3A3A4:
	LDA.w $04E4				;$B3A3A4
	STA.w CPU.enable_dma_hdma		;$B3A3A7
	JSL.l CODE_B3D843			;$B3A3AA
	JSL.l CODE_80801E			;$B3A3AE
	SEP.b #$20				;$B3A3B2
	LDA.w screen_brightness			;$B3A3B4
	STA.w PPU.screen			;$B3A3B7
	REP.b #$20				;$B3A3BA
	RTS					;$B3A3BC

CODE_B3A3BD:
	LDA.w $04E4				;$B3A3BD
	STA.w CPU.enable_dma_hdma		;$B3A3C0
	JSL.l CODE_B3D843			;$B3A3C3
	JSL.l CODE_80801E			;$B3A3C7
	JSR.w CODE_B38158			;$B3A3CB
	LDA.w $1C49				;$B3A3CE
	SEP.b #$20				;$B3A3D1
	STA.w PPU.layer_2_scroll_x		;$B3A3D3
	XBA					;$B3A3D6
	STA.w PPU.layer_2_scroll_x		;$B3A3D7
	LDA.w $1C4B				;$B3A3DA
	STA.w PPU.layer_2_scroll_y		;$B3A3DD
	STZ.w PPU.layer_2_scroll_y		;$B3A3E0
	LDA.w screen_brightness			;$B3A3E3
	STA.w PPU.screen			;$B3A3E6
	REP.b #$20				;$B3A3E9
	RTS					;$B3A3EB

CODE_B3A3EC:
	LDA.w $04E4				;$B3A3EC
	STA.w CPU.enable_dma_hdma		;$B3A3EF
	JSL.l CODE_B3D843			;$B3A3F2
	JSL.l CODE_80801E			;$B3A3F6
	JSL.l CODE_80801E			;$B3A3FA
	JSL.l CODE_80801E			;$B3A3FE
	LDA.w timestop_flags			;$B3A402
	BIT.w #$0004				;$B3A405
	BEQ.b CODE_B3A40D			;$B3A408
	JMP.w CODE_B3A5C8			;$B3A40A

CODE_B3A40D:
	LDA.l $7EA220				;$B3A40D
	BIT.w #$0002				;$B3A411
	BNE.b CODE_B3A434			;$B3A414
	LDA.w $15E6				;$B3A416
	BIT.w #$0002				;$B3A419
	BEQ.b CODE_B3A434			;$B3A41C
	BIT.w #$0004				;$B3A41E
	BEQ.b CODE_B3A428			;$B3A421
	LDA.w #$02CC				;$B3A423
	BRA.b CODE_B3A42B			;$B3A426

CODE_B3A428:
	LDA.w #$0133				;$B3A428
CODE_B3A42B:
	STA.l $7EA21C				;$B3A42B
	INC					;$B3A42F
	STA.l $7EA21E				;$B3A430
CODE_B3A434:
	LDA.w $15E6				;$B3A434
	STA.l $7EA220				;$B3A437
	LDA.w #$0008				;$B3A43B
	TRB.w $15E6				;$B3A43E
	LDA.l $7EA21E				;$B3A441
	CMP.l $7EA21C				;$B3A445
	BCC.b CODE_B3A4C4			;$B3A449
	LDA.w #$0008				;$B3A44B
	TSB.w $15E6				;$B3A44E
	LDA.w $15E6				;$B3A451
	BIT.w #$0004				;$B3A454
	BNE.b CODE_B3A471			;$B3A457
	LDA.l $7EA21E				;$B3A459
	CLC					;$B3A45D
	ADC.w $1BF5				;$B3A45E
	CMP.l $7EA21A				;$B3A461
	BCC.b CODE_B3A46B			;$B3A465
	LDA.l $7EA21A				;$B3A467
CODE_B3A46B:
	STA.l $7EA21E				;$B3A46B
	BRA.b CODE_B3A487			;$B3A46F

CODE_B3A471:
	LDA.l $7EA21C				;$B3A471
	SEC					;$B3A475
	SBC.w $1BF5				;$B3A476
	CMP.l $7EA21A				;$B3A479
	BCS.b CODE_B3A483			;$B3A47D
	LDA.l $7EA21A				;$B3A47F
CODE_B3A483:
	STA.l $7EA21C				;$B3A483
CODE_B3A487:
	LDA.w $15E6				;$B3A487
	BIT.w #$0002				;$B3A48A
	BNE.b CODE_B3A4C4			;$B3A48D
	BIT.w #$0004				;$B3A48F
	BNE.b CODE_B3A4AD			;$B3A492
	LDA.l $7EA21C				;$B3A494
	CLC					;$B3A498
	ADC.w $1BF5				;$B3A499
	CMP.l $7EA21A				;$B3A49C
	BCC.b CODE_B3A4A7			;$B3A4A0
	LDA.l $7EA21A				;$B3A4A2
	INC					;$B3A4A6
CODE_B3A4A7:
	STA.l $7EA21C				;$B3A4A7
	BRA.b CODE_B3A4C4			;$B3A4AB

CODE_B3A4AD:
	LDA.l $7EA21E				;$B3A4AD
	SEC					;$B3A4B1
	SBC.w $1BF5				;$B3A4B2
	CMP.l $7EA21A				;$B3A4B5
	BCS.b CODE_B3A4C0			;$B3A4B9
	LDA.l $7EA21A				;$B3A4BB
	DEC					;$B3A4BF
CODE_B3A4C0:
	STA.l $7EA21E				;$B3A4C0
CODE_B3A4C4:
	SEP.b #$20				;$B3A4C4
	LDA.b #$30				;$B3A4C6
	SEC					;$B3A4C8
	SBC.w $1973				;$B3A4C9
	STA.l $7EA23A				;$B3A4CC
	LDA.b #$E0				;$B3A4D0
	STA.w PPU.fixed_color			;$B3A4D2
	REP.b #$20				;$B3A4D5
	LDA.w $05AF				;$B3A4D7
	BIT.w #$0040				;$B3A4DA
	BNE.b CODE_B3A500			;$B3A4DD
	LDA.w $15E6				;$B3A4DF
	AND.w #$0003				;$B3A4E2
	BNE.b CODE_B3A4F1			;$B3A4E5
	LDA.l $7EA21E				;$B3A4E7
	CMP.l $7EA21C				;$B3A4EB
	BCC.b CODE_B3A500			;$B3A4EF
CODE_B3A4F1:
	JSL.l CODE_808018			;$B3A4F1
	SEP.b #$20				;$B3A4F5
	AND.b #$01				;$B3A4F7
	ORA.b #$C0				;$B3A4F9
	STA.w PPU.fixed_color			;$B3A4FB
	REP.b #$20				;$B3A4FE
CODE_B3A500:
	SEP.b #$20				;$B3A500
	LDA.w $15E6				;$B3A502
	AND.b #$10				;$B3A505
	ORA.b #$01				;$B3A507
	STA.w PPU.sub_screen			;$B3A509
	LDA.b #$54				;$B3A50C
	SEC					;$B3A50E
	SBC.w $1973				;$B3A50F
	STA.l $7EA15D				;$B3A512
	STA.l $7EA25D				;$B3A516
	STA.l $7EA1ED				;$B3A51A
	STA.l $7EA26D				;$B3A51E
	REP.b #$20				;$B3A522
	LDA.l $7E9B5C				;$B3A524
	AND.w #$0006				;$B3A528
	LSR					;$B3A52B
	ADC.w $1975				;$B3A52C
	CLC					;$B3A52F
	ADC.w #$000B				;$B3A530
	STA.l $7EA26B				;$B3A533
	STA.l $7EA26E				;$B3A537
	LDA.w $1975				;$B3A53B
	CLC					;$B3A53E
	ADC.w #$0004				;$B3A53F
	STA.l $7EA271				;$B3A542
	LDA.w #$013B				;$B3A546
	SEC					;$B3A549
	SBC.w $196D				;$B3A54A
	BPL.b CODE_B3A552			;$B3A54D
	LDA.w #$0000				;$B3A54F
CODE_B3A552:
	STA.l $7EA1FA				;$B3A552
	LDA.w #$02C4				;$B3A556
	SEC					;$B3A559
	SBC.w $196D				;$B3A55A
	CMP.w #$0100				;$B3A55D
	BCC.b CODE_B3A565			;$B3A560
	LDA.w #$00FF				;$B3A562
CODE_B3A565:
	STA.l $7EA1FB				;$B3A565
	LDA.l $7EA21C				;$B3A569
	SEC					;$B3A56D
	SBC.w $196D				;$B3A56E
	BPL.b CODE_B3A576			;$B3A571
	LDA.w #$0000				;$B3A573
CODE_B3A576:
	CMP.w #$0100				;$B3A576
	BCC.b CODE_B3A584			;$B3A579
	LDA.w #$00FF				;$B3A57B
	STA.l $7EA1FC				;$B3A57E
	BRA.b CODE_B3A5A7			;$B3A582

CODE_B3A584:
	STA.l $7EA1FC				;$B3A584
	LDA.l $7EA21E				;$B3A588
	SEC					;$B3A58C
	SBC.w $196D				;$B3A58D
	BPL.b CODE_B3A59B			;$B3A590
	LDA.w #$00FF				;$B3A592
	STA.l $7EA1FC				;$B3A595
	BRA.b CODE_B3A5A7			;$B3A599

CODE_B3A59B:
	CMP.w #$0100				;$B3A59B
	BCC.b CODE_B3A5A3			;$B3A59E
	LDA.w #$00FF				;$B3A5A0
CODE_B3A5A3:
	STA.l $7EA1FD				;$B3A5A3
CODE_B3A5A7:
	LDA.w $15E6				;$B3A5A7
	BIT.w #$0001				;$B3A5AA
	BNE.b CODE_B3A5B6			;$B3A5AD
	LDA.w #$00FF				;$B3A5AF
	STA.l $7EA1FA				;$B3A5B2
CODE_B3A5B6:
	LDX.w #$A1AD				;$B3A5B6
	LDA.b active_frame_counter		;$B3A5B9
	BIT.w #$0001				;$B3A5BB
	BNE.b CODE_B3A5C3			;$B3A5BE
	LDX.w #$A16D				;$B3A5C0
CODE_B3A5C3:
	TXA					;$B3A5C3
	STA.l $7EA161				;$B3A5C4
CODE_B3A5C8:
	LDA.l $7E995C				;$B3A5C8
	AND.w #$000E				;$B3A5CC
	LSR					;$B3A5CF
	ADC.w $196D				;$B3A5D0
	STA.l $7EA16A				;$B3A5D3
	LDA.b active_frame_counter		;$B3A5D7
	LSR					;$B3A5D9
	CLC					;$B3A5DA
	ADC.w $196D				;$B3A5DB
	SEP.b #$20				;$B3A5DE
	STA.w PPU.layer_3_scroll_x		;$B3A5E0
	XBA					;$B3A5E3
	STA.w PPU.layer_3_scroll_x		;$B3A5E4
	LDA.b active_frame_counter		;$B3A5E7
	ASL					;$B3A5E9
	STA.b $1A				;$B3A5EA
	ASL					;$B3A5EC
	ASL					;$B3A5ED
	CLC					;$B3A5EE
	ADC.b $1A				;$B3A5EF
	AND.b #$E0				;$B3A5F1
	SEC					;$B3A5F3
	SBC.b active_frame_counter		;$B3A5F4
	CLC					;$B3A5F6
	ADC.w $196D				;$B3A5F7
	STA.l $7EA24E				;$B3A5FA
	LDA.w $196D				;$B3A5FE
	CLC					;$B3A601
	ADC.l $7EA254				;$B3A602
	STA.l $7EA24B				;$B3A606
	LDA.w $196D				;$B3A60A
	STA.w PPU.layer_1_scroll_x		;$B3A60D
	LDA.w $196E				;$B3A610
	STA.w PPU.layer_1_scroll_x		;$B3A613
	LDA.w $1975				;$B3A616
	STA.w PPU.layer_2_scroll_y		;$B3A619
	STZ.w PPU.layer_2_scroll_y		;$B3A61C
	STA.w PPU.layer_1_scroll_y		;$B3A61F
	STZ.w PPU.layer_1_scroll_y		;$B3A622
	LDA.w screen_brightness			;$B3A625
	STA.w PPU.screen			;$B3A628
	REP.b #$20				;$B3A62B
	RTS					;$B3A62D

DATA_B3A62E:
	dw CODE_B3A678
	dw CODE_B3A6C1
	dw CODE_B3AC96
	dw CODE_B3B226
	dw CODE_B3B2E8
	dw CODE_B3B340
	dw CODE_B3B402
	dw CODE_B3B555
	dw CODE_B3B934
	dw CODE_B3ACC2
	dw CODE_B3BC48
	dw CODE_B3BF82
	dw CODE_B3C281
	dw CODE_B3C3BF
	dw CODE_B3C48B
	dw CODE_B3C48B
	dw CODE_B3C4B4
	dw CODE_B3C639
	dw CODE_B3CB21
	dw CODE_B3D174
	dw CODE_B3D1A4
	dw CODE_B3C396
	dw CODE_B3B253
	dw CODE_B3C3EB
	dw CODE_B3B314
	dw CODE_B3C243
	dw CODE_B3C23E
	dw CODE_B3C417
	dw CODE_B3CB46
	dw CODE_B3CF8B
	dw CODE_B3B2B4
	dw CODE_B3D552
	dw CODE_B3D571
	dw CODE_B3D5B1
	dw CODE_B3B280
	dw CODE_B3C262
	dw CODE_B3D820

CODE_B3A678:
	JSL CODE_808015				;$B3A678
	JSL sprite_handler			;$B3A67C
	JSL CODE_B7800C				;$B3A680
	JSL CODE_B7800F				;$B3A684
	JSL CODE_808012				;$B3A688
	JSL CODE_808021				;$B3A68C
	JML CODE_808006				;$B3A690

CODE_B3A694:
	DEC $00					;$B3A694
	LDA $05B1				;$B3A696
	AND #$7000				;$B3A699
	BNE CODE_B3A6B9				;$B3A69C
	JSL CODE_808021				;$B3A69E
	LDA screen_brightness			;$B3A6A2
	BEQ CODE_B3A6AB				;$B3A6A5
	JML CODE_808006				;$B3A6A7

CODE_B3A6AB:
	LDA #$0040				;$B3A6AB
	TRB $05AF				;$B3A6AE
	JSL CODE_BB85C7				;$B3A6B1
	JML CODE_808006				;$B3A6B5

CODE_B3A6B9:
	JSL CODE_80804E				;$B3A6B9
	JML CODE_808006				;$B3A6BD

CODE_B3A6C1:
	JSL CODE_808015				;$B3A6C1
	BNE CODE_B3A6F4				;$B3A6C5
	JSR CODE_B3A8E4				;$B3A6C7
	JSR CODE_B3CADC				;$B3A6CA
	JSL CODE_BB8582				;$B3A6CD
	JSL sprite_handler			;$B3A6D1
	JSL CODE_B7B009				;$B3A6D5
	JSR CODE_B3A6F7				;$B3A6D9
	JSL CODE_B7B00C				;$B3A6DC
	JSL CODE_B78000				;$B3A6E0
	JSL CODE_BB85BB				;$B3A6E4
	JSL CODE_808012				;$B3A6E8
	JSL CODE_808021				;$B3A6EC
	JML CODE_808006				;$B3A6F0

CODE_B3A6F4:
	JMP CODE_B3A694				;$B3A6F4

CODE_B3A6F7:
	LDA.w $15E6				;$B3A6F7
	BEQ.b CODE_B3A75E			;$B3A6FA
	DEC					;$B3A6FC
	ASL					;$B3A6FD
	STA.b $1A				;$B3A6FE
	ASL					;$B3A700
	CLC					;$B3A701
	ADC.b $1A				;$B3A702
	TAX					;$B3A704
	LDA.l DATA_B3A7C0+$04,x			;$B3A705
	AND.w #$FF00				;$B3A709
	BEQ.b CODE_B3A75F			;$B3A70C
	LSR					;$B3A70E
	LSR					;$B3A70F
	LSR					;$B3A710
	CLC					;$B3A711
	ADC.w $1967				;$B3A712
	STA.b $1A				;$B3A715
	LDA.b $8E				;$B3A717
	STA.b $1C				;$B3A719
	LDA.w #$0008				;$B3A71B
	STA.b $1D				;$B3A71E
	LDA.l DATA_B3A7C0+$04,x			;$B3A720
	AND.w #$00FF				;$B3A724
	TAY					;$B3A727
	LDA.l DATA_B3A7C0,x			;$B3A728
CODE_B3A72C:
	STA.b $20				;$B3A72C
	JSL.l CODE_B78012			;$B3A72E
	BCS.b CODE_B3A75E			;$B3A732
	LDA.b $1A				;$B3A734
	CLC					;$B3A736
	ADC.w #$0008				;$B3A737
	STA.b $1A				;$B3A73A
	LDA.b $20				;$B3A73C
	CLC					;$B3A73E
	ADC.w #$0020				;$B3A73F
	DEY					;$B3A742
	BNE.b CODE_B3A72C			;$B3A743
	STZ.w $15E6				;$B3A745
	LDA.l DATA_B3A7C0+$02,x			;$B3A748
	CLC					;$B3A74C
	ADC.b $8C				;$B3A74D
	STA.b $1A				;$B3A74F
	LDA.b $8E				;$B3A751
	STA.b $1C				;$B3A753
	LDA.l DATA_B3A7C0+$05,x			;$B3A755
	AND.w #$00FF				;$B3A759
	STA.b [$1A]				;$B3A75C
CODE_B3A75E:
	RTS					;$B3A75E

CODE_B3A75F:
	LDA.w #DATA_B3A874			;$B3A75F
	STA.b $1A				;$B3A762
	LDA.w #DATA_B3A874>>16			;$B3A764
	STA.b $1C				;$B3A767
	LDA.w #$000E				;$B3A769
	STA.b $1D				;$B3A76C
	LDY.w #$0008				;$B3A76E
	LDA.l DATA_B3A7C0,x			;$B3A771
	INC					;$B3A775
CODE_B3A776:
	STA.b $20				;$B3A776
	JSL.l CODE_B78012			;$B3A778
	BCS.b CODE_B3A75E			;$B3A77C
	LDA.b $1A				;$B3A77E
	CLC					;$B3A780
	ADC.w #$000E				;$B3A781
	STA.b $1A				;$B3A784
	LDA.b $20				;$B3A786
	CLC					;$B3A788
	ADC.w #$0020				;$B3A789
	DEY					;$B3A78C
	BNE.b CODE_B3A776			;$B3A78D
	STZ.w $15E6				;$B3A78F
	LDA.l DATA_B3A7C0+$02,x			;$B3A792
	CLC					;$B3A796
	ADC.b $8C				;$B3A797
	STA.b $1A				;$B3A799
	LDA.b $8E				;$B3A79B
	STA.b $1C				;$B3A79D
	LDA.w #$0003				;$B3A79F
	STA.b [$1A]				;$B3A7A2
	INC.b $1A				;$B3A7A4
	INC.b $1A				;$B3A7A6
	INC					;$B3A7A8
	STA.b [$1A]				;$B3A7A9
	LDA.b $1A				;$B3A7AB
	CLC					;$B3A7AD
	ADC.w #$009E				;$B3A7AE
	STA.b $1A				;$B3A7B1
	LDA.w #$0005				;$B3A7B3
	STA.b [$1A]				;$B3A7B6
	INC.b $1A				;$B3A7B8
	INC.b $1A				;$B3A7BA
	INC					;$B3A7BC
	STA.b [$1A]				;$B3A7BD
	RTS					;$B3A7BF

DATA_B3A7C0:
	db $10,$7C,$90,$06,$03,$01,$8C,$79,$76,$01,$03,$01,$14,$7D,$B4,$1E
	db $03,$01,$80,$7D,$16,$24,$03,$01,$88,$5B,$4E,$11,$02,$01,$18,$59
	db $D4,$2B,$02,$01,$9C,$5F,$EE,$0C,$02,$01,$0C,$5C,$70,$12,$02,$01
	db $88,$67,$44,$11,$03,$01,$00,$60,$90,$12,$03,$01,$10,$66,$28,$21
	db $03,$01,$90,$60,$58,$43,$03,$01,$10,$65,$08,$44,$03,$01,$04,$67
	db $A2,$16,$03,$01,$9C,$65,$CE,$38,$03,$01,$10,$63,$2C,$13,$03,$01
	db $88,$60,$B2,$32,$03,$01,$80,$78,$12,$15,$03,$01,$90,$7C,$92,$2C
	db $03,$01,$04,$7F,$2C,$06,$03,$01,$14,$78,$B0,$29,$03,$01,$9C,$7D
	db $F6,$00,$03,$01,$88,$7C,$64,$04,$04,$01,$84,$7B,$D2,$07,$04,$01
	db $94,$7D,$CA,$30,$04,$01,$98,$7D,$CC,$0E,$04,$01,$10,$7C,$28,$02
	db $04,$02,$10,$7D,$A8,$0E,$04,$02,$9C,$7D,$EE,$38,$04,$02,$08,$79
	db $D4,$38,$04,$00

DATA_B3A874:
	dw $1801
	dw $0C02
	dw $1003
	dw $3004
	dw $3805
	dw $3806
	dw $B806
	dw $1008
	dw $1C09
	dw $1C0A
	dw $1C0A
	dw $300B
	dw $380C
	dw $380D
	dw $1C0F
	dw $1C09
	dw $1C0A
	dw $1C0A
	dw $3010
	dw $3811
	dw $3812
	dw $0C14
	dw $1015
	dw $1C0A
	dw $1C0A
	dw $3016
	dw $3017
	dw $3018
	dw $0C19
	dw $1C09
	dw $1C0A
	dw $1C0A
	dw $300B
	dw $381A
	dw $381B
	dw $0C1D
	dw $0C1E
	dw $0C1F
	dw $0C20
	dw $3010
	dw $3821
	dw $3822
	dw $1824
	dw $1823
	dw $1823
	dw $1824
	dw $3825
	dw $3426
	dw $3427
	dw $1029
	dw $1028
	dw $1028
	dw $1029
	dw $302A
	dw $3426
	dw $342B


CODE_B3A8E4:
	PHK					;$B3A8E4
	PLB					;$B3A8E5
	LDA.b active_frame_counter		;$B3A8E6
	LSR					;$B3A8E8
	LSR					;$B3A8E9
	AND.w #$000F				;$B3A8EA
	EOR.w #$000F				;$B3A8ED
	ASL					;$B3A8F0
	CLC					;$B3A8F1
	ADC.w #$A44A				;$B3A8F2
	STA.l $7EA161				;$B3A8F5
	LDX.w #$001E				;$B3A8F9
CODE_B3A8FC:
	LDA.w DATA_B3AC14,x			;$B3A8FC
	CLC					;$B3A8FF
	ADC.w $196D				;$B3A900
	STA.l $7EA44A,x				;$B3A903
	DEX					;$B3A907
	DEX					;$B3A908
	BNE.b CODE_B3A8FC			;$B3A909
	SEP.b #$20				;$B3A90B
	LDA.b active_frame_counter		;$B3A90D
	LSR					;$B3A90F
	LSR					;$B3A910
	AND.b #$0F				;$B3A911
	CLC					;$B3A913
	ADC.b #$81				;$B3A914
	STA.l $7EA160				;$B3A916
	LDA.w $1B65				;$B3A91A
	SEC					;$B3A91D
	SBC.w $1975				;$B3A91E
	SEC					;$B3A921
	SBC.b #$3A				;$B3A922
	STA.l $7EA213				;$B3A924
	LDA.b active_frame_counter		;$B3A928
	LSR					;$B3A92A
	LSR					;$B3A92B
	CLC					;$B3A92C
	ADC.b #$0E				;$B3A92D
	AND.b #$0F				;$B3A92F
	CLC					;$B3A931
	ADC.b #$81				;$B3A932
	STA.l $7EA21C				;$B3A934
	REP.b #$20				;$B3A938
	LDA.b active_frame_counter		;$B3A93A
	LSR					;$B3A93C
	AND.w #$001E				;$B3A93D
	TAY					;$B3A940
	LDX.w #$0000				;$B3A941
CODE_B3A944:
	LDA.w $0507				;$B3A944
	BEQ.b CODE_B3A953			;$B3A947
	LDA.b active_frame_counter		;$B3A949
	ASL					;$B3A94B
	ASL					;$B3A94C
	CLC					;$B3A94D
	ADC.w DATA_B3ABF4,y			;$B3A94E
	BRA.b CODE_B3A959			;$B3A951

CODE_B3A953:
	LDA.w DATA_B3ABF4,y			;$B3A953
	CLC					;$B3A956
	ADC.b active_frame_counter		;$B3A957
CODE_B3A959:
	LSR					;$B3A959
	CLC					;$B3A95A
	ADC.w $196D				;$B3A95B
	STA.l $7EA1DA,x				;$B3A95E
	TYA					;$B3A962
	CLC					;$B3A963
	ADC.w #$0006				;$B3A964
	AND.w #$001E				;$B3A967
	TAY					;$B3A96A
	INX					;$B3A96B
	INX					;$B3A96C
	INX					;$B3A96D
	INX					;$B3A96E
	CPX.w #$0010				;$B3A96F
	BNE.b CODE_B3A944			;$B3A972
	LDA.w $1975				;$B3A974
	CLC					;$B3A977
	ADC.w #$0038				;$B3A978
	STA.l $7EA1DC				;$B3A97B
	STA.l $7EA1E0				;$B3A97F
	STA.l $7EA1E4				;$B3A983
	STA.l $7EA1E8				;$B3A987
	STA.l $7EA404				;$B3A98B
	STA.b $1E				;$B3A98F
	LDY.w #$001E				;$B3A991
	LDX.w #$003C				;$B3A994
CODE_B3A997:
	LDA.w DATA_B3AC14,y			;$B3A997
	CLC					;$B3A99A
	ADC.w $196D				;$B3A99B
	STA.l $7EA40A,x				;$B3A99E
	LDA.b $1E				;$B3A9A2
	STA.l $7EA40C,x				;$B3A9A4
	DEY					;$B3A9A8
	DEY					;$B3A9A9
	DEX					;$B3A9AA
	DEX					;$B3A9AB
	DEX					;$B3A9AC
	DEX					;$B3A9AD
	BPL.b CODE_B3A997			;$B3A9AE
	LDA.w $0507				;$B3A9B0
	BEQ.b CODE_B3A9BA			;$B3A9B3
	LDA.b active_frame_counter		;$B3A9B5
	ASL					;$B3A9B7
	BRA.b CODE_B3A9BD			;$B3A9B8

CODE_B3A9BA:
	LDA.b active_frame_counter		;$B3A9BA
	LSR					;$B3A9BC
CODE_B3A9BD:
	CLC					;$B3A9BD
	ADC.w $196D				;$B3A9BE
	STA.l $7EA402				;$B3A9C1
	SEP.b #$20				;$B3A9C5
	LDA.w $1B65				;$B3A9C7
	EOR.b #$FF				;$B3A9CA
	SEC					;$B3A9CC
	ADC.b #$60				;$B3A9CD
	LSR					;$B3A9CF
	STA.l $7EA49C				;$B3A9D0
	ADC.b #$00				;$B3A9D4
	STA.l $7EA4A1				;$B3A9D6
	LDA.w $1B65				;$B3A9DA
	SEC					;$B3A9DD
	SBC.w $1975				;$B3A9DE
	SEC					;$B3A9E1
	SBC.b #$C2				;$B3A9E2
	STA.l $7EA4A6				;$B3A9E4
	STA.l $7EA46E				;$B3A9E8
	LDA.w $1B65				;$B3A9EC
	EOR.b #$FF				;$B3A9EF
	SEC					;$B3A9F1
	ADC.b #$5B				;$B3A9F2
	STA.b $1A				;$B3A9F4
	LSR					;$B3A9F6
	STA.l $7EA46A				;$B3A9F7
	ADC.b #$00				;$B3A9FB
	STA.l $7EA46C				;$B3A9FD
	LDA.b $1A				;$B3AA01
	INC					;$B3AA03
	STA.l $7EA19A				;$B3AA04
	REP.b #$20				;$B3AA08
	LDX.w #$001E				;$B3AA0A
CODE_B3AA0D:
	LDA.w $196D				;$B3AA0D
	LSR					;$B3AA10
	LSR					;$B3AA11
	CLC					;$B3AA12
	ADC.l DATA_B3AC36,x			;$B3AA13
	STA.l $7EA1EA,x				;$B3AA17
	DEX					;$B3AA1B
	DEX					;$B3AA1C
	BPL.b CODE_B3AA0D			;$B3AA1D
	LDA.b active_frame_counter		;$B3AA1F
	LSR					;$B3AA21
	LSR					;$B3AA22
	AND.w #$000F				;$B3AA23
	STA.b $1A				;$B3AA26
	SEC					;$B3AA28
	ADC.w #$0080				;$B3AA29
	SEP.b #$20				;$B3AA2C
	STA.l $7EA19D				;$B3AA2E
	REP.b #$20				;$B3AA32
	LDA.b $1A				;$B3AA34
	EOR.w #$000F				;$B3AA36
	ASL					;$B3AA39
	CLC					;$B3AA3A
	ADC.w #$A1EA				;$B3AA3B
	STA.l $7EA19E				;$B3AA3E
	TSC					;$B3AA42
	STA.b $22				;$B3AA43
	LDA.b active_frame_counter		;$B3AA45
	LSR					;$B3AA47
	AND.w #$000E				;$B3AA48
	TAY					;$B3AA4B
	LDA.w $0507				;$B3AA4C
	BEQ.b CODE_B3AA5B			;$B3AA4F
	LDA.b active_frame_counter		;$B3AA51
	ASL					;$B3AA53
	CLC					;$B3AA54
	ADC.w $196D				;$B3AA55
	ASL					;$B3AA58
	BRA.b CODE_B3AA62			;$B3AA59

CODE_B3AA5B:
	LDA.w $196D				;$B3AA5B
	ASL					;$B3AA5E
	CLC					;$B3AA5F
	ADC.b active_frame_counter		;$B3AA60
CODE_B3AA62:
	ASL					;$B3AA62
	ASL					;$B3AA63
	ASL					;$B3AA64
	ASL					;$B3AA65
	STA.b $1A				;$B3AA66
	LDA.w $196D				;$B3AA68
	LSR					;$B3AA6B
	LSR					;$B3AA6C
	XBA					;$B3AA6D
	TCS					;$B3AA6E
	XBA					;$B3AA6F
	LDX.w #$0000				;$B3AA70
	CLC					;$B3AA73
CODE_B3AA74:
	ADC.w DATA_B3ABF4,y			;$B3AA74
	STA.l $7EA37A,x				;$B3AA77
	ADC.w DATA_B3AC58,y			;$B3AA7B
	STA.l $7EA37B,x				;$B3AA7E
	ADC.w DATA_B3AC58+$02,y			;$B3AA82
	STA.l $7EA37C,x				;$B3AA85
	ADC.w DATA_B3AC58+$04,y			;$B3AA89
	STA.l $7EA37D,x				;$B3AA8C
	ADC.w DATA_B3AC58+$06,y			;$B3AA90
	STA.l $7EA37E,x				;$B3AA93
	ADC.w DATA_B3AC58+$08,y			;$B3AA97
	STA.l $7EA37F,x				;$B3AA9A
	ADC.w DATA_B3AC58+$0A,y			;$B3AA9E
	STA.l $7EA380,x				;$B3AAA1
	ADC.w DATA_B3AC58+$0C,y			;$B3AAA5
	STA.l $7EA381,x				;$B3AAA8
	ADC.w DATA_B3AC58+$0E,y			;$B3AAAC
	STA.l $7EA382,x				;$B3AAAF
	ADC.w DATA_B3AC58+$10,y			;$B3AAB3
	STA.l $7EA383,x				;$B3AAB6
	ADC.w DATA_B3AC58+$12,y			;$B3AABA
	STA.l $7EA384,x				;$B3AABD
	ADC.w DATA_B3AC58+$14,y			;$B3AAC1
	STA.l $7EA385,x				;$B3AAC4
	ADC.w DATA_B3AC58+$16,y			;$B3AAC8
	STA.l $7EA386,x				;$B3AACB
	ADC.w DATA_B3AC58+$18,y			;$B3AACF
	STA.l $7EA387,x				;$B3AAD2
	ADC.w DATA_B3AC58+$1A,y			;$B3AAD6
	STA.l $7EA388,x				;$B3AAD9
	ADC.w DATA_B3AC58+$1C,y			;$B3AADD
	STA.l $7EA389,x				;$B3AAE0
	TXA					;$B3AAE4
	CLC					;$B3AAE5
	ADC.w #$0010				;$B3AAE6
	TAX					;$B3AAE9
	TSC					;$B3AAEA
	ADC.b $1A				;$B3AAEB
	TCS					;$B3AAED
	XBA					;$B3AAEE
	CPX.w #$0080				;$B3AAEF
	BNE.b CODE_B3AA74			;$B3AAF2
	LDA.b $22				;$B3AAF4
	TCS					;$B3AAF6
	LDA.w $1975				;$B3AAF7
	CLC					;$B3AAFA
	ADC.w #$FE38				;$B3AAFB
	SEC					;$B3AAFE
	SBC.w $1B65				;$B3AAFF
	XBA					;$B3AB02
	STA.w CPU.dividen_low			;$B3AB03
	LDA.w $1B65				;$B3AB06
	SEC					;$B3AB09
	SBC.w $1975				;$B3AB0A
	SEC					;$B3AB0D
	SBC.w #$003A				;$B3AB0E
	AND.w #$007F				;$B3AB11
	STA.w CPU.divisor			;$B3AB14
	LDA.w $196D				;$B3AB17
	LSR					;$B3AB1A
	LSR					;$B3AB1B
	SEP.b #$20				;$B3AB1C
	STA.l $7EA37A				;$B3AB1E
	REP.b #$20				;$B3AB22
	LDA.w $1B65				;$B3AB24
	SEC					;$B3AB27
	SBC.w $1975				;$B3AB28
	SEC					;$B3AB2B
	SBC.w #$003A				;$B3AB2C
	AND.w #$007F				;$B3AB2F
	STA.b $20				;$B3AB32
	LDA.w $1B65				;$B3AB34
	EOR.w #$00FF				;$B3AB37
	SEC					;$B3AB3A
	ADC.w #$0060				;$B3AB3B
	AND.w #$00FF				;$B3AB3E
	CLC					;$B3AB41
	ADC.b $20				;$B3AB42
	SEC					;$B3AB44
	SBC.w #$00E0				;$B3AB45
	BCC.b CODE_B3AB52			;$B3AB48
	EOR.w #$FFFF				;$B3AB4A
	SEC					;$B3AB4D
	ADC.b $20				;$B3AB4E
	STA.b $20				;$B3AB50
CODE_B3AB52:
	LDA.b $20				;$B3AB52
	ASL					;$B3AB54
	ASL					;$B3AB55
	STA.b $20				;$B3AB56
	LDA.w CPU.divide_result			;$B3AB58
	AND.w #$FFFE				;$B3AB5B
	STA.b $1A				;$B3AB5E
	%pea_use_dbr($7E8029)			;$B3AB60
	PLB					;$B3AB63
	TSC					;$B3AB64
	STA.b $22				;$B3AB65
	LDA.w $1B65				;$B3AB67
	AND.w #$01FF				;$B3AB6A
	EOR.w #$FFFF				;$B3AB6D
	INC					;$B3AB70
	STA.b $1C				;$B3AB71
	LDA.w $1B65				;$B3AB73
	XBA					;$B3AB76
	TCS					;$B3AB77
	XBA					;$B3AB78
	LDX.w #$0000				;$B3AB79
	CLC					;$B3AB7C
CODE_B3AB7D:
	STA.w $7EA52C,x				;$B3AB7D
	ADC.b $1C				;$B3AB80
	AND.w #$007F				;$B3AB82
	TAY					;$B3AB85
	LDA.w $7EA37A,y				;$B3AB86
	STA.w $7EA52A,x				;$B3AB89
	TSC					;$B3AB8C
	CLC					;$B3AB8D
	ADC.b $1A				;$B3AB8E
	ADC.w #$0000				;$B3AB90
	TCS					;$B3AB93
	XBA					;$B3AB94
	STA.w $7EA530,x				;$B3AB95
	ADC.b $1C				;$B3AB98
	AND.w #$007F				;$B3AB9A
	TAY					;$B3AB9D
	LDA.w $7EA37B,y				;$B3AB9E
	STA.w $7EA52E,x				;$B3ABA1
	TSC					;$B3ABA4
	CLC					;$B3ABA5
	ADC.b $1A				;$B3ABA6
	ADC.w #$0000				;$B3ABA8
	TCS					;$B3ABAB
	XBA					;$B3ABAC
	STA.w $7EA534,x				;$B3ABAD
	ADC.b $1C				;$B3ABB0
	AND.w #$007F				;$B3ABB2
	TAY					;$B3ABB5
	LDA.w $7EA37C,y				;$B3ABB6
	STA.w $7EA532,x				;$B3ABB9
	TSC					;$B3ABBC
	CLC					;$B3ABBD
	ADC.b $1A				;$B3ABBE
	ADC.w #$0000				;$B3ABC0
	TCS					;$B3ABC3
	XBA					;$B3ABC4
	STA.w $7EA538,x				;$B3ABC5
	ADC.b $1C				;$B3ABC8
	AND.w #$007F				;$B3ABCA
	TAY					;$B3ABCD
	LDA.w $7EA37D,y				;$B3ABCE
	STA.w $7EA536,x				;$B3ABD1
	TSC					;$B3ABD4
	CLC					;$B3ABD5
	ADC.b $1A				;$B3ABD6
	ADC.w #$0000				;$B3ABD8
	LDA.b $1C				;$B3ABDB
	CLC					;$B3ABDD
	ADC.w #$0004				;$B3ABDE
	STA.b $1C				;$B3ABE1
	TXA					;$B3ABE3
	CLC					;$B3ABE4
	ADC.w #$0010				;$B3ABE5
	TAX					;$B3ABE8
	TSC					;$B3ABE9
	XBA					;$B3ABEA
	CPX.b $20				;$B3ABEB
	BCC.b CODE_B3AB7D			;$B3ABED
	LDA.b $22				;$B3ABEF
	TCS					;$B3ABF1
	PLB					;$B3ABF2
	RTS					;$B3ABF3

DATA_B3ABF4:
	dw $0000,$0000,$0001,$0002,$0003,$0003,$0002,$0001
	dw $0000,$0000,$0001,$0002,$0003,$0003,$0002,$0001

DATA_B3AC14:
	dw $0000,$0000,$0000,$0000,$0001,$0001,$0001,$0001
	dw $0002,$0002,$0002,$0002,$0001,$0001,$0001,$0001
	dw $0001

DATA_B3AC36:
	dw $0000,$0000,$0000,$0000,$0001,$0001,$0001,$0001
	dw $0000,$0000,$0000,$0000,$0001,$0001,$0001,$0001
	dw $00FF

DATA_B3AC58:
	dw $0000,$0001,$0001,$0001,$0000,$00FF,$00FF,$00FF
	dw $0000,$0001,$0001,$0001,$0000,$00FF,$00FF,$00FF
	dw $0000,$0001,$0001,$0001,$0000,$00FF,$00FF,$00FF
	dw $0000,$0001,$0001,$0001,$0000,$00FF,$00FF

CODE_B3AC96:
	JSL.l CODE_808015			;$B3AC96
	BNE.b CODE_B3ACBF			;$B3AC9A
	JSL.l CODE_BB8582			;$B3AC9C
	JSL.l sprite_handler			;$B3ACA0
	JSL.l CODE_B7B009			;$B3ACA4
	JSR.w CODE_B3A6F7			;$B3ACA8
	JSL.l CODE_B7C4EA			;$B3ACAB
	JSL.l CODE_B78000			;$B3ACAF
	JSL.l CODE_808012			;$B3ACB3
	JSL.l CODE_808021			;$B3ACB7
	JML.l CODE_808006			;$B3ACBB

CODE_B3ACBF:
	JMP.w CODE_B3A694			;$B3ACBF

CODE_B3ACC2:
	JSL.l CODE_808015			;$B3ACC2
	BNE.b CODE_B3ACF5			;$B3ACC6
	JSL.l CODE_BB8582			;$B3ACC8
	JSL.l sprite_handler			;$B3ACCC
	JSL.l CODE_B7B009			;$B3ACD0
	JSR.w CODE_B3A6F7			;$B3ACD4
	JSL.l CODE_B7BE2C			;$B3ACD7
	JSL.l CODE_B78000			;$B3ACDB
	JSR.w CODE_B3CADC			;$B3ACDF
	JSL.l CODE_BB85BB			;$B3ACE2
	JSL.l CODE_808012			;$B3ACE6
	JSR.w CODE_B3ACF8			;$B3ACEA
	JSL.l CODE_808021			;$B3ACED
	JML.l CODE_808006			;$B3ACF1

CODE_B3ACF5:
	JMP.w CODE_B3A694			;$B3ACF5

CODE_B3ACF8:
	LDA.w $050F				;$B3ACF8
	CMP.w #$8000				;$B3ACFB
	BNE.b CODE_B3AD01			;$B3ACFE
	RTS					;$B3AD00

CODE_B3AD01:
	LDA.b active_frame_counter		;$B3AD01
	AND.w #$0001				;$B3AD03
	BEQ.b CODE_B3AD0B			;$B3AD06
	LDA.w #$0300				;$B3AD08
CODE_B3AD0B:
	STA.b $84				;$B3AD0B
	LDA.w $050F				;$B3AD0D
	SEC					;$B3AD10
	SBC.w $1975				;$B3AD11
	SEC					;$B3AD14
	SBC.w #$0020				;$B3AD15
	LDX.b $84				;$B3AD18
	CMP.w #$0080				;$B3AD1A
	BMI.b CODE_B3AD40			;$B3AD1D
	SEC					;$B3AD1F
	SBC.w #$007F				;$B3AD20
	CMP.w #$007F				;$B3AD23
	BCC.b CODE_B3AD2B			;$B3AD26
	LDA.w #$007F				;$B3AD28
CODE_B3AD2B:
	STA.b $1A				;$B3AD2B
	LDA.w #$007F				;$B3AD2D
	STA.l $7EA15A,x				;$B3AD30
	LDA.w #$0013				;$B3AD34
	STA.l $7EA15B,x				;$B3AD37
	LDA.b $1A				;$B3AD3B
	INX					;$B3AD3D
	INX					;$B3AD3E
	INX					;$B3AD3F
CODE_B3AD40:
	CMP.w #$0001				;$B3AD40
	BMI.b CODE_B3AD57			;$B3AD43
	STA.l $7EA15A,x				;$B3AD45
	LDA.w #$0013				;$B3AD49
	STA.l $7EA15B,x				;$B3AD4C
	LDA.l $7EA15A,x				;$B3AD50
	INX					;$B3AD54
	INX					;$B3AD55
	INX					;$B3AD56
CODE_B3AD57:
	CLC					;$B3AD57
	ADC.w #$0020				;$B3AD58
	CMP.w #$0001				;$B3AD5B
	BMI.b CODE_B3AD76			;$B3AD5E
	CMP.w #$0020				;$B3AD60
	BCC.b CODE_B3AD68			;$B3AD63
	LDA.w #$0020				;$B3AD65
CODE_B3AD68:
	STA.l $7EA15A,x				;$B3AD68
	LDA.w #$1315				;$B3AD6C
	STA.l $7EA15B,x				;$B3AD6F
	INX					;$B3AD73
	INX					;$B3AD74
	INX					;$B3AD75
CODE_B3AD76:
	CLC					;$B3AD76
	ADC.w #$0030				;$B3AD77
	CMP.w #$0001				;$B3AD7A
	BMI.b CODE_B3AD95			;$B3AD7D
	CMP.w #$0030				;$B3AD7F
	BCC.b CODE_B3AD87			;$B3AD82
	LDA.w #$0030				;$B3AD84
CODE_B3AD87:
	STA.l $7EA15A,x				;$B3AD87
	LDA.w #$1304				;$B3AD8B
	STA.l $7EA15B,x				;$B3AD8E
	INX					;$B3AD92
	INX					;$B3AD93
	INX					;$B3AD94
CODE_B3AD95:
	LDA.w #$0001				;$B3AD95
	STA.l $7EA15A,x				;$B3AD98
	LDA.w #$1300				;$B3AD9C
	STA.l $7EA15B,x				;$B3AD9F
	LDA.w #$0000				;$B3ADA3
	STA.l $7EA15D,x				;$B3ADA6
	LDA.w $050F				;$B3ADAA
	SEC					;$B3ADAD
	SBC.w $1975				;$B3ADAE
	SEC					;$B3ADB1
	SBC.w #$0020				;$B3ADB2
	LDX.b $84				;$B3ADB5
	CMP.w #$0080				;$B3ADB7
	BMI.b CODE_B3ADDD			;$B3ADBA
	SEC					;$B3ADBC
	SBC.w #$007F				;$B3ADBD
	CMP.w #$007F				;$B3ADC0
	BCC.b CODE_B3ADC8			;$B3ADC3
	LDA.w #$007F				;$B3ADC5
CODE_B3ADC8:
	STA.b $1A				;$B3ADC8
	LDA.w #$007F				;$B3ADCA
	STA.l $7EA16A,x				;$B3ADCD
	LDA.w #$8200				;$B3ADD1
	STA.l $7EA16B,x				;$B3ADD4
	LDA.b $1A				;$B3ADD8
	INX					;$B3ADDA
	INX					;$B3ADDB
	INX					;$B3ADDC
CODE_B3ADDD:
	CMP.w #$0001				;$B3ADDD
	BMI.b CODE_B3ADF0			;$B3ADE0
	STA.l $7EA16A,x				;$B3ADE2
	LDA.w #$8200				;$B3ADE6
	STA.l $7EA16B,x				;$B3ADE9
	INX					;$B3ADED
	INX					;$B3ADEE
	INX					;$B3ADEF
CODE_B3ADF0:
	LDA.w #$0001				;$B3ADF0
	STA.l $7EA16A,x				;$B3ADF3
	LDA.w #$6402				;$B3ADF7
	STA.l $7EA16B,x				;$B3ADFA
	LDA.w #$0000				;$B3ADFE
	STA.l $7EA16D,x				;$B3AE01
	LDX.b $84				;$B3AE05
	LDA.w $050F				;$B3AE07
	SEC					;$B3AE0A
	SBC.w $1975				;$B3AE0B
	CLC					;$B3AE0E
	ADC.w #$0020				;$B3AE0F
	CMP.w #$0080				;$B3AE12
	BMI.b CODE_B3AE43			;$B3AE15
	SEC					;$B3AE17
	SBC.w #$007F				;$B3AE18
	CMP.w #$007F				;$B3AE1B
	BCC.b CODE_B3AE23			;$B3AE1E
	LDA.w #$007F				;$B3AE20
CODE_B3AE23:
	STA.b $1A				;$B3AE23
	LDA.w #$007F				;$B3AE25
	STA.l $7EA17A,x				;$B3AE28
	LDA.w #$0000				;$B3AE2C
	STA.l $7EA17B,x				;$B3AE2F
	LDA.l DATA_B384B1			;$B3AE33
	STA.l $7EA17D,x				;$B3AE37
	TXA					;$B3AE3B
	CLC					;$B3AE3C
	ADC.w #$0005				;$B3AE3D
	TAX					;$B3AE40
	LDA.b $1A				;$B3AE41
CODE_B3AE43:
	CMP.w #$0001				;$B3AE43
	BMI.b CODE_B3AE61			;$B3AE46
	STA.l $7EA17A,x				;$B3AE48
	LDA.w #$0000				;$B3AE4C
	STA.l $7EA17B,x				;$B3AE4F
	LDA.l DATA_B384B1			;$B3AE53
	STA.l $7EA17D,x				;$B3AE57
	TXA					;$B3AE5B
	CLC					;$B3AE5C
	ADC.w #$0005				;$B3AE5D
	TAX					;$B3AE60
CODE_B3AE61:
	LDA.w #$0001				;$B3AE61
	STA.l $7EA17A,x				;$B3AE64
	LDA.w #$0000				;$B3AE68
	STA.l $7EA17B,x				;$B3AE6B
	LDA.l DATA_B384B1+$02			;$B3AE6F
	STA.l $7EA17D,x				;$B3AE73
	LDA.w #$0000				;$B3AE77
	STA.l $7EA17F,x				;$B3AE7A
	LDA.w #$A1DA				;$B3AE7E
	CLC					;$B3AE81
	ADC.b $84				;$B3AE82
	TAY					;$B3AE84
	LDX.b $84				;$B3AE85
	LDA.w $050F				;$B3AE87
	SEC					;$B3AE8A
	SBC.w $1975				;$B3AE8B
	SEC					;$B3AE8E
	SBC.w #$0020				;$B3AE8F
	CMP.w #$0080				;$B3AE92
	BMI.b CODE_B3AEB6			;$B3AE95
	SEC					;$B3AE97
	SBC.w #$007F				;$B3AE98
	CMP.w #$007F				;$B3AE9B
	BCC.b CODE_B3AEA3			;$B3AE9E
	LDA.w #$007F				;$B3AEA0
CODE_B3AEA3:
	STA.b $1A				;$B3AEA3
	LDA.w #$007F				;$B3AEA5
	STA.l $7EA18A,x				;$B3AEA8
	TYA					;$B3AEAC
	STA.l $7EA18B,x				;$B3AEAD
	LDA.b $1A				;$B3AEB1
	INX					;$B3AEB3
	INX					;$B3AEB4
	INX					;$B3AEB5
CODE_B3AEB6:
	CMP.w #$0001				;$B3AEB6
	BMI.b CODE_B3AECA			;$B3AEB9
	STA.l $7EA18A,x				;$B3AEBB
	TYA					;$B3AEBF
	STA.l $7EA18B,x				;$B3AEC0
	INX					;$B3AEC4
	INX					;$B3AEC5
	INX					;$B3AEC6
	LDA.w #$0000				;$B3AEC7
CODE_B3AECA:
	STA.b $1A				;$B3AECA
	CLC					;$B3AECC
	ADC.w #$00C8				;$B3AECD
	STA.l $7EA18A,x				;$B3AED0
	TYA					;$B3AED4
	SEC					;$B3AED5
	SBC.b $1A				;$B3AED6
	SEC					;$B3AED8
	SBC.b $1A				;$B3AED9
	STA.l $7EA18B,x				;$B3AEDB
	LDA.w #$0000				;$B3AEDF
	STA.l $7EA18D,x				;$B3AEE2
	LDX.b $84				;$B3AEE6
	LDA.w $050F				;$B3AEE8
	SEC					;$B3AEEB
	SBC.w $1975				;$B3AEEC
	CMP.w #$0080				;$B3AEEF
	BMI.b CODE_B3AF18			;$B3AEF2
	SEC					;$B3AEF4
	SBC.w #$007F				;$B3AEF5
	CMP.w #$007F				;$B3AEF8
	BCC.b CODE_B3AF00			;$B3AEFB
	LDA.w #$007F				;$B3AEFD
CODE_B3AF00:
	STA.b $1A				;$B3AF00
	LDA.w #$007F				;$B3AF02
	STA.l $7EA19A,x				;$B3AF05
	LDA.w #$A3BA				;$B3AF09
	CLC					;$B3AF0C
	ADC.b $84				;$B3AF0D
	STA.l $7EA19B,x				;$B3AF0F
	LDA.b $1A				;$B3AF13
	INX					;$B3AF15
	INX					;$B3AF16
	INX					;$B3AF17
CODE_B3AF18:
	CMP.w #$0001				;$B3AF18
	BMI.b CODE_B3AF33			;$B3AF1B
	STA.b $1A				;$B3AF1D
	STA.l $7EA19A,x				;$B3AF1F
	LDA.w #$A3BA				;$B3AF23
	CLC					;$B3AF26
	ADC.b $84				;$B3AF27
	STA.l $7EA19B,x				;$B3AF29
	INX					;$B3AF2D
	INX					;$B3AF2E
	INX					;$B3AF2F
	LDA.w #$0000				;$B3AF30
CODE_B3AF33:
	STA.b $1A				;$B3AF33
	LDA.b active_frame_counter		;$B3AF35
	LSR					;$B3AF37
	LSR					;$B3AF38
	SEC					;$B3AF39
	SBC.b $1A				;$B3AF3A
	AND.w #$000F				;$B3AF3C
	STA.b $1A				;$B3AF3F
	ASL					;$B3AF41
	CLC					;$B3AF42
	ADC.w #$A3BA				;$B3AF43
	CLC					;$B3AF46
	ADC.b $84				;$B3AF47
	STA.l $7EA19B,x				;$B3AF49
	LDA.b $1A				;$B3AF4D
	EOR.w #$008F				;$B3AF4F
	INC					;$B3AF52
	SEP.b #$20				;$B3AF53
	STA.l $7EA19A,x				;$B3AF55
	LDA.b #$90				;$B3AF59
	STA.l $7EA19D,x				;$B3AF5B
	STA.l $7EA1A0,x				;$B3AF5F
	REP.b #$20				;$B3AF63
	LDA.w #$A3BA				;$B3AF65
	CLC					;$B3AF68
	ADC.b $84				;$B3AF69
	STA.l $7EA19E,x				;$B3AF6B
	STA.l $7EA1A1,x				;$B3AF6F
	LDX.b $84				;$B3AF73
	LDA.w $050F				;$B3AF75
	SEC					;$B3AF78
	SBC.w $1975				;$B3AF79
	CMP.w #$0080				;$B3AF7C
	BMI.b CODE_B3AFA5			;$B3AF7F
	SEC					;$B3AF81
	SBC.w #$007F				;$B3AF82
	CMP.w #$007F				;$B3AF85
	BCC.b CODE_B3AF8D			;$B3AF88
	LDA.w #$007F				;$B3AF8A
CODE_B3AF8D:
	STA.b $1A				;$B3AF8D
	LDA.w #$007F				;$B3AF8F
	STA.l $7EA38A,x				;$B3AF92
	LDA.w #$A3FA				;$B3AF96
	CLC					;$B3AF99
	ADC.b $84				;$B3AF9A
	STA.l $7EA38B,x				;$B3AF9C
	LDA.b $1A				;$B3AFA0
	INX					;$B3AFA2
	INX					;$B3AFA3
	INX					;$B3AFA4
CODE_B3AFA5:
	CMP.w #$0001				;$B3AFA5
	BMI.b CODE_B3AFC0			;$B3AFA8
	STA.b $1A				;$B3AFAA
	STA.l $7EA38A,x				;$B3AFAC
	LDA.w #$A3FA				;$B3AFB0
	CLC					;$B3AFB3
	ADC.b $84				;$B3AFB4
	STA.l $7EA38B,x				;$B3AFB6
	INX					;$B3AFBA
	INX					;$B3AFBB
	INX					;$B3AFBC
	LDA.w #$0000				;$B3AFBD
CODE_B3AFC0:
	STA.b $1A				;$B3AFC0
	LDA.b active_frame_counter		;$B3AFC2
	EOR.w #$FFFF				;$B3AFC4
	LSR					;$B3AFC7
	LSR					;$B3AFC8
	LSR					;$B3AFC9
	SEC					;$B3AFCA
	SBC.b $1A				;$B3AFCB
	AND.w #$000F				;$B3AFCD
	STA.b $1A				;$B3AFD0
	ASL					;$B3AFD2
	CLC					;$B3AFD3
	ADC.w #$A3FA				;$B3AFD4
	CLC					;$B3AFD7
	ADC.b $84				;$B3AFD8
	STA.l $7EA38B,x				;$B3AFDA
	LDA.b $1A				;$B3AFDE
	EOR.w #$008F				;$B3AFE0
	INC					;$B3AFE3
	SEP.b #$20				;$B3AFE4
	STA.l $7EA38A,x				;$B3AFE6
	LDA.b #$90				;$B3AFEA
	STA.l $7EA38D,x				;$B3AFEC
	STA.l $7EA390,x				;$B3AFF0
	REP.b #$20				;$B3AFF4
	LDA.w #$A3FA				;$B3AFF6
	CLC					;$B3AFF9
	ADC.b $84				;$B3AFFA
	STA.l $7EA38E,x				;$B3AFFC
	STA.l $7EA391,x				;$B3B000
	LDX.b $84				;$B3B004
	LDA.w $050F				;$B3B006
	SEC					;$B3B009
	SBC.w $1975				;$B3B00A
	SEC					;$B3B00D
	SBC.w #$0020				;$B3B00E
	CMP.w #$0080				;$B3B011
	BMI.b CODE_B3B03A			;$B3B014
	SEC					;$B3B016
	SBC.w #$007F				;$B3B017
	CMP.w #$007F				;$B3B01A
	BCC.b CODE_B3B022			;$B3B01D
	LDA.w #$007F				;$B3B01F
CODE_B3B022:
	STA.b $1A				;$B3B022
	LDA.w #$007F				;$B3B024
	STA.l $7EA28A,x				;$B3B027
	LDA.w #$A3DA				;$B3B02B
	CLC					;$B3B02E
	ADC.b $84				;$B3B02F
	STA.l $7EA28B,x				;$B3B031
	LDA.b $1A				;$B3B035
	INX					;$B3B037
	INX					;$B3B038
	INX					;$B3B039
CODE_B3B03A:
	CMP.w #$0001				;$B3B03A
	BMI.b CODE_B3B055			;$B3B03D
	STA.b $1A				;$B3B03F
	STA.l $7EA28A,x				;$B3B041
	LDA.w #$A3DA				;$B3B045
	CLC					;$B3B048
	ADC.b $84				;$B3B049
	STA.l $7EA28B,x				;$B3B04B
	INX					;$B3B04F
	INX					;$B3B050
	INX					;$B3B051
	LDA.w $1975				;$B3B052
CODE_B3B055:
	LSR					;$B3B055
	STA.b $1A				;$B3B056
	LDA.b active_frame_counter		;$B3B058
	LSR					;$B3B05A
	SEC					;$B3B05B
	SBC.b $1A				;$B3B05C
	AND.w #$000F				;$B3B05E
	STA.b $1A				;$B3B061
	ASL					;$B3B063
	CLC					;$B3B064
	ADC.w #$A3DA				;$B3B065
	CLC					;$B3B068
	ADC.b $84				;$B3B069
	STA.l $7EA28B,x				;$B3B06B
	LDA.b $1A				;$B3B06F
	EOR.w #$008F				;$B3B071
	INC					;$B3B074
	SEP.b #$20				;$B3B075
	STA.l $7EA28A,x				;$B3B077
	LDA.b #$90				;$B3B07B
	STA.l $7EA28D,x				;$B3B07D
	STA.l $7EA290,x				;$B3B081
	REP.b #$20				;$B3B085
	LDA.w #$A3DA				;$B3B087
	CLC					;$B3B08A
	ADC.b $84				;$B3B08B
	STA.l $7EA28E,x				;$B3B08D
	STA.l $7EA291,x				;$B3B091
	LDX.b $84				;$B3B095
	LDA.w $1975				;$B3B097
	STA.l $7EA3FA,x				;$B3B09A
	STA.l $7EA3FC,x				;$B3B09E
	STA.l $7EA3FE,x				;$B3B0A2
	STA.l $7EA400,x				;$B3B0A6
	STA.l $7EA402,x				;$B3B0AA
	STA.l $7EA404,x				;$B3B0AE
	STA.l $7EA406,x				;$B3B0B2
	STA.l $7EA408,x				;$B3B0B6
	INC					;$B3B0BA
	STA.l $7EA40A,x				;$B3B0BB
	STA.l $7EA40C,x				;$B3B0BF
	STA.l $7EA40E,x				;$B3B0C3
	STA.l $7EA410,x				;$B3B0C7
	STA.l $7EA412,x				;$B3B0CB
	STA.l $7EA414,x				;$B3B0CF
	STA.l $7EA416,x				;$B3B0D3
	STA.l $7EA418,x				;$B3B0D7
	LDA.w $196D				;$B3B0DB
	STA.l $7EA3BA,x				;$B3B0DE
	STA.l $7EA3BC,x				;$B3B0E2
	STA.l $7EA3BE,x				;$B3B0E6
	STA.l $7EA3C0,x				;$B3B0EA
	STA.l $7EA3C2,x				;$B3B0EE
	STA.l $7EA3C4,x				;$B3B0F2
	STA.l $7EA3C6,x				;$B3B0F6
	STA.l $7EA3C8,x				;$B3B0FA
	INC					;$B3B0FE
	STA.l $7EA3CA,x				;$B3B0FF
	STA.l $7EA3CC,x				;$B3B103
	STA.l $7EA3CE,x				;$B3B107
	STA.l $7EA3D0,x				;$B3B10B
	STA.l $7EA3D2,x				;$B3B10F
	STA.l $7EA3D4,x				;$B3B113
	STA.l $7EA3D6,x				;$B3B117
	STA.l $7EA3D8,x				;$B3B11B
	LDA.w $196D				;$B3B11F
	LSR					;$B3B122
	STA.l $7EA3DA,x				;$B3B123
	STA.l $7EA3DC,x				;$B3B127
	STA.l $7EA3DE,x				;$B3B12B
	STA.l $7EA3E0,x				;$B3B12F
	STA.l $7EA3E2,x				;$B3B133
	STA.l $7EA3E4,x				;$B3B137
	STA.l $7EA3E6,x				;$B3B13B
	STA.l $7EA3E8,x				;$B3B13F
	INC					;$B3B143
	STA.l $7EA3EA,x				;$B3B144
	STA.l $7EA3EC,x				;$B3B148
	STA.l $7EA3EE,x				;$B3B14C
	STA.l $7EA3F0,x				;$B3B150
	STA.l $7EA3F2,x				;$B3B154
	STA.l $7EA3F4,x				;$B3B158
	STA.l $7EA3F6,x				;$B3B15C
	STA.l $7EA3F8,x				;$B3B160
	LDA level_number			;$B3B164
	CMP.w #!level_pothole_panic		;$B3B166
	BNE.b CODE_B3B174			;$B3B169
	LDA.w $196D				;$B3B16B
	SEC					;$B3B16E
	SBC.w #$1600				;$B3B16F
	BRA.b CODE_B3B17B			;$B3B172

CODE_B3B174:
	LDA.w $196D				;$B3B174
	SEC					;$B3B177
	SBC.w #$0400				;$B3B178
CODE_B3B17B:
	STA.b $1A				;$B3B17B
	EOR.w #$FFFF				;$B3B17D
	STA.b $1C				;$B3B180
	LDA.b active_frame_counter		;$B3B182
	BIT.w #$0001				;$B3B184
	BEQ.b CODE_B3B1A5			;$B3B187
	LDA.b $1A				;$B3B189
	LSR					;$B3B18B
	LSR					;$B3B18C
	CLC					;$B3B18D
	ADC.b $1A				;$B3B18E
	XBA					;$B3B190
	LDX.w #$008E				;$B3B191
CODE_B3B194:
	STA.l $7EA4D9,x				;$B3B194
	ADC.b $1C				;$B3B198
	DEX					;$B3B19A
	BPL.b CODE_B3B194			;$B3B19B
	TXA					;$B3B19D
	CLC					;$B3B19E
	ADC.w #$0380				;$B3B19F
	TAX					;$B3B1A2
	BRA.b CODE_B3B1BF			;$B3B1A3

CODE_B3B1A5:
	LDA.b $1A				;$B3B1A5
	LSR					;$B3B1A7
	LSR					;$B3B1A8
	CLC					;$B3B1A9
	ADC.b $1A				;$B3B1AA
	XBA					;$B3B1AC
	LDX.w #$008E				;$B3B1AD
CODE_B3B1B0:
	STA.l $7EA1D9,x				;$B3B1B0
	ADC.b $1C				;$B3B1B4
	DEX					;$B3B1B6
	BPL.b CODE_B3B1B0			;$B3B1B7
	TXA					;$B3B1B9
	CLC					;$B3B1BA
	ADC.w #$0080				;$B3B1BB
	TAX					;$B3B1BE
CODE_B3B1BF:
	INX					;$B3B1BF
	LDA.b active_frame_counter		;$B3B1C0
	LSR					;$B3B1C2
	AND.w #$000F				;$B3B1C3
	ASL					;$B3B1C6
	STX.b $1A				;$B3B1C7
	CLC					;$B3B1C9
	ADC.b $1A				;$B3B1CA
	SEC					;$B3B1CC
	SBC.w #$0010				;$B3B1CD
	TAX					;$B3B1D0
	LDY.w #$0005				;$B3B1D1
CODE_B3B1D4:
	LDA.l $7EA15A,x				;$B3B1D4
	INC					;$B3B1D8
	STA.l $7EA15A,x				;$B3B1D9
	LDA.l $7EA15C,x				;$B3B1DD
	INC					;$B3B1E1
	STA.l $7EA15C,x				;$B3B1E2
	LDA.l $7EA15E,x				;$B3B1E6
	INC					;$B3B1EA
	STA.l $7EA15E,x				;$B3B1EB
	LDA.l $7EA160,x				;$B3B1EF
	INC					;$B3B1F3
	STA.l $7EA160,x				;$B3B1F4
	LDA.l $7EA162,x				;$B3B1F8
	INC					;$B3B1FC
	STA.l $7EA162,x				;$B3B1FD
	LDA.l $7EA164,x				;$B3B201
	INC					;$B3B205
	STA.l $7EA164,x				;$B3B206
	LDA.l $7EA166,x				;$B3B20A
	INC					;$B3B20E
	STA.l $7EA166,x				;$B3B20F
	LDA.l $7EA168,x				;$B3B213
	INC					;$B3B217
	STA.l $7EA168,x				;$B3B218
	TXA					;$B3B21C
	CLC					;$B3B21D
	ADC.w #$0020				;$B3B21E
	TAX					;$B3B221
	DEY					;$B3B222
	BNE.b CODE_B3B1D4			;$B3B223
	RTS					;$B3B225

CODE_B3B226:
	JSL.l CODE_808015			;$B3B226
	BNE.b CODE_B3B250			;$B3B22A
	JSL.l CODE_BB8582			;$B3B22C
	JSL.l sprite_handler			;$B3B230
	JSL.l CODE_B7B009			;$B3B234
	JSL.l CODE_B7C726			;$B3B238
	JSL.l CODE_B78000			;$B3B23C
	JSL.l CODE_BB85BB			;$B3B240
	JSL.l CODE_808012			;$B3B244
	JSL.l CODE_808021			;$B3B248
	JML.l CODE_808006			;$B3B24C

CODE_B3B250:
	JMP.w CODE_B3A694			;$B3B250

CODE_B3B253:
	JSL.l CODE_808015			;$B3B253
	BNE.b CODE_B3B27D			;$B3B257
	JSL.l CODE_BB8582			;$B3B259
	JSL.l sprite_handler			;$B3B25D
	JSL.l CODE_B7B009			;$B3B261
	JSL.l CODE_B7C2A3			;$B3B265
	JSL.l CODE_B78000			;$B3B269
	JSL.l CODE_BB85BB			;$B3B26D
	JSL.l CODE_808012			;$B3B271
	JSL.l CODE_808021			;$B3B275
	JML.l CODE_808006			;$B3B279

CODE_B3B27D:
	JMP.w CODE_B3A694			;$B3B27D

CODE_B3B280:
	JSL.l CODE_808015			;$B3B280
	BNE.b CODE_B3B2B1			;$B3B284
	JSL.l CODE_BB8582			;$B3B286
	JSL.l sprite_handler			;$B3B28A
	JSL.l CODE_B7B009			;$B3B28E
	JSR.w CODE_B3D1D4			;$B3B292
	JSL.l CODE_B3D257			;$B3B295
	JSL.l CODE_B7C2A3			;$B3B299
	JSL.l CODE_B78000			;$B3B29D
	JSL.l CODE_BB85BB			;$B3B2A1
	JSL.l CODE_808012			;$B3B2A5
	JSL.l CODE_808021			;$B3B2A9
	JML.l CODE_808006			;$B3B2AD

CODE_B3B2B1:
	JMP.w CODE_B3A694			;$B3B2B1

CODE_B3B2B4:
	JSL.l CODE_808015			;$B3B2B4
	BNE.b CODE_B3B2E5			;$B3B2B8
	JSL.l CODE_BB8582			;$B3B2BA
	JSL.l sprite_handler			;$B3B2BE
	JSL.l CODE_B7B009			;$B3B2C2
	JSR.w CODE_B3D1D4			;$B3B2C6
	JSL.l CODE_B3D257			;$B3B2C9
	JSL.l CODE_B7C726			;$B3B2CD
	JSL.l CODE_B78000			;$B3B2D1
	JSL.l CODE_BB85BB			;$B3B2D5
	JSL.l CODE_808012			;$B3B2D9
	JSL.l CODE_808021			;$B3B2DD
	JML.l CODE_808006			;$B3B2E1

CODE_B3B2E5:
	JMP.w CODE_B3A694			;$B3B2E5

CODE_B3B2E8:
	JSL.l CODE_808015			;$B3B2E8
	BNE.b CODE_B3B311			;$B3B2EC
	JSL.l CODE_BB8582			;$B3B2EE
	JSL.l sprite_handler			;$B3B2F2
	JSL.l CODE_B7B009			;$B3B2F6
	JSR.w CODE_B3A6F7			;$B3B2FA
	JSL.l CODE_B7C726			;$B3B2FD
	JSL.l CODE_B78000			;$B3B301
	JSL.l CODE_808012			;$B3B305
	JSL.l CODE_808021			;$B3B309
	JML.l CODE_808006			;$B3B30D

CODE_B3B311:
	JMP.w CODE_B3A694			;$B3B311

CODE_B3B314:
	JSL.l CODE_808015			;$B3B314
	BNE.b CODE_B3B33D			;$B3B318
	JSL.l CODE_BB8582			;$B3B31A
	JSL.l sprite_handler			;$B3B31E
	JSL.l CODE_B7B009			;$B3B322
	JSR.w CODE_B3A6F7			;$B3B326
	JSL.l CODE_B7C2A3			;$B3B329
	JSL.l CODE_B78000			;$B3B32D
	JSL.l CODE_808012			;$B3B331
	JSL.l CODE_808021			;$B3B335
	JML.l CODE_808006			;$B3B339

CODE_B3B33D:
	JMP.w CODE_B3A694			;$B3B33D

CODE_B3B340:
	JSL.l CODE_808015			;$B3B340
	BNE.b CODE_B3B36C			;$B3B344
	JSL.l CODE_BB8582			;$B3B346
	JSL.l sprite_handler			;$B3B34A
	JSL.l CODE_B7B009			;$B3B34E
	JSR.w CODE_B3A6F7			;$B3B352
	JSL.l CODE_B7B00C			;$B3B355
	JSL.l CODE_B78000			;$B3B359
	JSL.l CODE_808012			;$B3B35D
	JSR.w CODE_B3B36F			;$B3B361
	JSL.l CODE_808021			;$B3B364
	JML.l CODE_808006			;$B3B368

CODE_B3B36C:
	JMP.w CODE_B3A694			;$B3B36C

CODE_B3B36F:
	LDA.w parent_level_number		;$B3B36F
	CMP.w #!level_konveyor_rope_klash	;$B3B372
	BEQ.b CODE_B3B378			;$B3B375
	RTS					;$B3B377

CODE_B3B378:
	LDA.b active_frame_counter		;$B3B378
	ASL					;$B3B37A
	ASL					;$B3B37B
	AND.w #$000E				;$B3B37C
	TAX					;$B3B37F
	LDA.l DATA_B3B3F2,x			;$B3B380
	STA.b $1A				;$B3B384
	LDA.w #DATA_EBC052>>16			;$B3B386
	STA.b $1C				;$B3B389
	LDA.w #$0140				;$B3B38B
	STA.b $1D				;$B3B38E
	LDA.w #$2010				;$B3B390
	JSL.l CODE_B78012			;$B3B393
	LDA.b active_frame_counter		;$B3B397
	ASL					;$B3B399
	STA.b $1C				;$B3B39A
	ASL					;$B3B39C
	CLC					;$B3B39D
	ADC.b $1C				;$B3B39E
	AND.w #$000E				;$B3B3A0
	TAX					;$B3B3A3
	LDA.l DATA_B3B3F2,x			;$B3B3A4
	STA.b $1A				;$B3B3A8
	LDA.w #DATA_EBC052>>16			;$B3B3AA
	STA.b $1C				;$B3B3AD
	LDA.w #$0140				;$B3B3AF
	STA.b $1D				;$B3B3B2
	LDA.w #$20B0				;$B3B3B4
	JSL.l CODE_B78012			;$B3B3B7
	LDA.w $0507				;$B3B3BB
	CMP.w #$0400				;$B3B3BE
	BEQ.b CODE_B3B3CE			;$B3B3C1
	LDA.b active_frame_counter		;$B3B3C3
	ASL					;$B3B3C5
	STA.b $1A				;$B3B3C6
	ASL					;$B3B3C8
	CLC					;$B3B3C9
	ADC.b $1A				;$B3B3CA
	BRA.b CODE_B3B3D3			;$B3B3CC

CODE_B3B3CE:
	LDA.b active_frame_counter		;$B3B3CE
	ASL					;$B3B3D0
	ASL					;$B3B3D1
	ASL					;$B3B3D2
CODE_B3B3D3:
	AND.w #$000E				;$B3B3D3
	TAX					;$B3B3D6
	LDA.l DATA_B3B3F2,x			;$B3B3D7
	STA.b $1A				;$B3B3DB
	LDA.w #DATA_EBC052>>16			;$B3B3DD
	STA.b $1C				;$B3B3E0
	LDA.w #$0080				;$B3B3E2
	STA.b $1D				;$B3B3E5
	LDA.w #$2150				;$B3B3E7
	JSL.l CODE_B78012			;$B3B3EA
	STZ.w $0507				;$B3B3EE
	RTS					;$B3B3F1

DATA_B3B3F2:
	dw DATA_EBC052+$0000
	dw DATA_EBC052+$0140
	dw DATA_EBC052+$0280
	dw DATA_EBC052+$03C0
	dw DATA_EBC052+$0500
	dw DATA_EBC052+$0640
	dw DATA_EBC052+$0780
	dw DATA_EBC052+$08C0


CODE_B3B402:
	JSL.l CODE_808015			;$B3B402
	BNE.b CODE_B3B42B			;$B3B406
	JSL.l CODE_BB8582			;$B3B408
	JSL.l sprite_handler			;$B3B40C
	JSL.l CODE_B7B009			;$B3B410
	JSL.l CODE_B7C2A3			;$B3B414
	JSL.l CODE_B78000			;$B3B418
	JSL.l CODE_808012			;$B3B41C
	JSR.w CODE_B3B42E			;$B3B420
	JSL.l CODE_808021			;$B3B423
	JML.l CODE_808006			;$B3B427

CODE_B3B42B:
	JMP.w CODE_B3A694			;$B3B42B

CODE_B3B42E:
	LDA.w $15E6				;$B3B42E
	DEC					;$B3B431
	BPL.b CODE_B3B43A			;$B3B432
	INC.w $15E2				;$B3B434
	LDA.w #$0005				;$B3B437
CODE_B3B43A:
	STA.w $15E6				;$B3B43A
	LDA.w $15E6				;$B3B43D
	BNE.b CODE_B3B476			;$B3B440
	LDA.l $7EA15A				;$B3B442
	DEC					;$B3B446
	BPL.b CODE_B3B454			;$B3B447
	JSL.l CODE_808018			;$B3B449
	AND.w #$001F				;$B3B44D
	CLC					;$B3B450
	ADC.w #$000C				;$B3B451
CODE_B3B454:
	STA.l $7EA15A				;$B3B454
	CMP.w #$0007				;$B3B458
	BCS.b CODE_B3B476			;$B3B45B
	ASL					;$B3B45D
	TAX					;$B3B45E
	LDA.l DATA_B3B519,x			;$B3B45F
	STA.b $1A				;$B3B463
	LDA.w #DATA_F43000>>16			;$B3B465
	STA.b $1C				;$B3B468
	LDA.w #$01C0				;$B3B46A
	STA.b $1D				;$B3B46D
	LDA.w #$2010				;$B3B46F
	JSL.l CODE_B78012			;$B3B472
CODE_B3B476:
	LDA.w $15E6				;$B3B476
	DEC					;$B3B479
	BNE.b CODE_B3B4B0			;$B3B47A
	LDA.l $7EA15C				;$B3B47C
	DEC					;$B3B480
	BPL.b CODE_B3B48E			;$B3B481
	JSL.l CODE_808018			;$B3B483
	AND.w #$001F				;$B3B487
	CLC					;$B3B48A
	ADC.w #$000C				;$B3B48B
CODE_B3B48E:
	STA.l $7EA15C				;$B3B48E
	CMP.w #$0007				;$B3B492
	BCS.b CODE_B3B4B0			;$B3B495
	ASL					;$B3B497
	TAX					;$B3B498
	LDA.l DATA_B3B529,x			;$B3B499
	STA.b $1A				;$B3B49D
	LDA.w #DATA_F43E00>>16			;$B3B49F
	STA.b $1C				;$B3B4A2
	LDA.w #$0100				;$B3B4A4
	STA.b $1D				;$B3B4A7
	LDA.w #$20F0				;$B3B4A9
	JSL.l CODE_B78012			;$B3B4AC
CODE_B3B4B0:
	LDA.w $15E6				;$B3B4B0
	DEC					;$B3B4B3
	DEC					;$B3B4B4
	BNE.b CODE_B3B4EB			;$B3B4B5
	LDA.l $7EA15E				;$B3B4B7
	DEC					;$B3B4BB
	BPL.b CODE_B3B4C9			;$B3B4BC
	JSL.l CODE_808018			;$B3B4BE
	AND.w #$001F				;$B3B4C2
	CLC					;$B3B4C5
	ADC.w #$000C				;$B3B4C6
CODE_B3B4C9:
	STA.l $7EA15E				;$B3B4C9
	CMP.w #$0007				;$B3B4CD
	BCS.b CODE_B3B4EB			;$B3B4D0
	ASL					;$B3B4D2
	TAX					;$B3B4D3
	LDA.l DATA_B3B539,x			;$B3B4D4
	STA.b $1A				;$B3B4D8
	LDA.w #DATA_F44600>>16			;$B3B4DA
	STA.b $1C				;$B3B4DD
	LDA.w #$0200				;$B3B4DF
	STA.b $1D				;$B3B4E2
	LDA.w #$2170				;$B3B4E4
	JSL.l CODE_B78012			;$B3B4E7
CODE_B3B4EB:
	LDA.w $15E6				;$B3B4EB
	DEC					;$B3B4EE
	DEC					;$B3B4EF
	DEC					;$B3B4F0
	BNE.b CODE_B3B518			;$B3B4F1
	LDA.w $15E4				;$B3B4F3
	DEC					;$B3B4F6
	BPL.b CODE_B3B4FC			;$B3B4F7
	LDA.w #$0005				;$B3B4F9
CODE_B3B4FC:
	STA.w $15E4				;$B3B4FC
	ASL					;$B3B4FF
	TAX					;$B3B500
	LDA.l DATA_B3B549,x			;$B3B501
	STA.b $1A				;$B3B505
	LDA.w #DATA_F45600>>16			;$B3B507
	STA.b $1C				;$B3B50A
	LDA.w #$0120				;$B3B50C
	STA.b $1D				;$B3B50F
	LDA.w #$2270				;$B3B511
	JSL.l CODE_B78012			;$B3B514
CODE_B3B518:
	RTS					;$B3B518

DATA_B3B519:
	dw DATA_F43000
	dw DATA_F43000+$0C40
	dw DATA_F43000+$0A80
	dw DATA_F43000+$08C0
	dw DATA_F43000+$0700
	dw DATA_F43000+$0540
	dw DATA_F43000+$0380
	dw DATA_F43000+$01C0

DATA_B3B529:
	dw DATA_F43E00
	dw DATA_F43E00+$0700
	dw DATA_F43E00+$0600
	dw DATA_F43E00+$0500
	dw DATA_F43E00+$0400
	dw DATA_F43E00+$0300
	dw DATA_F43E00+$0200
	dw DATA_F43E00+$0100

DATA_B3B539:
	dw DATA_F44600
	dw DATA_F44600+$0E00
	dw DATA_F44600+$0C00
	dw DATA_F44600+$0A00
	dw DATA_F44600+$0800
	dw DATA_F44600+$0600
	dw DATA_F44600+$0400
	dw DATA_F44600+$0200

DATA_B3B549:
	dw DATA_F45600+$05A0
	dw DATA_F45600+$0480
	dw DATA_F45600+$0360
	dw DATA_F45600+$0240
	dw DATA_F45600+$0120
	dw DATA_F45600

CODE_B3B555:
	JSL.l CODE_808015			;$B3B555
	BNE.b CODE_B3B587			;$B3B559
	LDA.b $CC				;$B3B55B
	STA.b $CE				;$B3B55D
	STZ.b $CC				;$B3B55F
	JSL.l CODE_BB8582			;$B3B561
	JSL.l sprite_handler			;$B3B565
	JSL.l CODE_B7B009			;$B3B569
	JSL.l CODE_B7C2A3			;$B3B56D
	JSR.w CODE_B3B58A			;$B3B571
	JSL.l CODE_B78000			;$B3B574
	JSL.l CODE_808012			;$B3B578
	JSR.w CODE_B3B6D6			;$B3B57C
	JSL.l CODE_808021			;$B3B57F
	JML.l CODE_808006			;$B3B583

CODE_B3B587:
	JMP.w CODE_B3A694			;$B3B587

CODE_B3B58A:
	LDA.w $15E2				;$B3B58A
	BEQ.b CODE_B3B59A			;$B3B58D
	DEC.w $15E2				;$B3B58F
	LDA.w $15E2				;$B3B592
	BIT.w #$0003				;$B3B595
	BEQ.b CODE_B3B59B			;$B3B598
CODE_B3B59A:
	RTS					;$B3B59A

CODE_B3B59B:
	LSR					;$B3B59B
	TAX					;$B3B59C
	LDA.l DATA_B3B646,x			;$B3B59D
	STA.b $1A				;$B3B5A1
	LDA.w #DATA_B3B656>>16			;$B3B5A3
	STA.b $1C				;$B3B5A6
	LDX.w $15E8				;$B3B5A8
	LDA.w #$0010				;$B3B5AB
	STA.b $1D				;$B3B5AE
	LDA.l DATA_B3B61E+$02,x			;$B3B5B0
	JSL.l CODE_B78012			;$B3B5B4
	LDA.w $15E2				;$B3B5B8
	LSR					;$B3B5BB
	TAX					;$B3B5BC
	LDA.l DATA_B3B646,x			;$B3B5BD
	CLC					;$B3B5C1
	ADC.w #$0010				;$B3B5C2
	STA.b $1A				;$B3B5C5
	LDA.w #DATA_B3B656>>16			;$B3B5C7
	STA.b $1C				;$B3B5CA
	LDX.w $15E8				;$B3B5CC
	LDA.w #$0010				;$B3B5CF
	STA.b $1D				;$B3B5D2
	LDA.l DATA_B3B61E+$02,x			;$B3B5D4
	CLC					;$B3B5D8
	ADC.w #$0020				;$B3B5D9
	JSL.l CODE_B78012			;$B3B5DC
	LDX.w $15E8				;$B3B5E0
	LDA.l DATA_B3B61E,x			;$B3B5E3
	CLC					;$B3B5E7
	ADC.b $8C				;$B3B5E8
	STA.b $1A				;$B3B5EA
	LDA.b $8E				;$B3B5EC
	STA.b $1C				;$B3B5EE
	LDA.w $15E2				;$B3B5F0
	CMP.w #$0009				;$B3B5F3
	BCS.b CODE_B3B60F			;$B3B5F6
	CMP.w #$0004				;$B3B5F8
	BCS.b CODE_B3B602			;$B3B5FB
	LDA.w #$0001				;$B3B5FD
	BRA.b CODE_B3B605			;$B3B600

CODE_B3B602:
	LDA.w #$0003				;$B3B602
CODE_B3B605:
	STA.b [$1A]				;$B3B605
	INC.b $1A				;$B3B607
	INC.b $1A				;$B3B609
	INC					;$B3B60B
	STA.b [$1A]				;$B3B60C
	RTS					;$B3B60E

CODE_B3B60F:
	LDA.w #$0000				;$B3B60F
	STA.b [$1A]				;$B3B612
	INC.b $1A				;$B3B614
	INC.b $1A				;$B3B616
	LDA.w #$0000				;$B3B618
	STA.b [$1A]				;$B3B61B
	RTS					;$B3B61D

DATA_B3B61E:
	dw $05DC,$78B8,$0CBC,$7A38,$175C,$7AB8,$1F7C,$7938
	dw $26FC,$7B38,$0792,$7A24,$1466,$7C2C,$20E8,$7E30
	dw $1442,$7C24,$032A,$7EB4

;Mill level trapdoor tilemap pointers
DATA_B3B646:
	dw DATA_B3B656
	dw DATA_B3B676
	dw DATA_B3B696
	dw DATA_B3B6B6
	dw DATA_B3B6B6
	dw DATA_B3B6B6
	dw DATA_B3B696
	dw DATA_B3B676

DATA_B3B656:
	dw $140B
	dw $140C
	dw $140D
	dw $140E
	dw $540E
	dw $540D
	dw $540C
	dw $540B
	dw $140F
	dw $1410
	dw $1411
	dw $1412
	dw $5412
	dw $5411
	dw $5410
	dw $540F


DATA_B3B676:
	dw $140B
	dw $1413
	dw $1414
	dw $1415
	dw $5415
	dw $5414
	dw $5413
	dw $540B
	dw $1416
	dw $1417
	dw $1418
	dw $1419
	dw $5419
	dw $5418
	dw $5417
	dw $5416


DATA_B3B696:
	dw $141A
	dw $141B
	dw $141C
	dw $541C
	dw $141C
	dw $541C
	dw $541B
	dw $541A
	dw $101D
	dw $141E
	dw $101F
	dw $1020
	dw $1020
	dw $501F
	dw $541E
	dw $501D


DATA_B3B6B6:
	dw $1421
	dw $1422
	dw $141C
	dw $541C
	dw $141C
	dw $541C
	dw $5422
	dw $5421
	dw $1023
	dw $1024
	dw $1020
	dw $1020
	dw $1020
	dw $1020
	dw $5024
	dw $5023


CODE_B3B6D6:
	LDA.w $15EA				;$B3B6D6
	BEQ.b CODE_B3B71A			;$B3B6D9
	BIT.w #$0002				;$B3B6DB
	BEQ.b CODE_B3B6FD			;$B3B6DE
	LDA.w #DATA_B3B7F4			;$B3B6E0
	STA.b $1A				;$B3B6E3
	LDA.w #DATA_B3B7F4>>16			;$B3B6E5
	STA.b $1C				;$B3B6E8
	LDA.w #$0140				;$B3B6EA
	STA.b $1D				;$B3B6ED
	LDA.w #$2010				;$B3B6EF
	JSL.l CODE_B78012			;$B3B6F2
	BCS.b CODE_B3B71A			;$B3B6F6
	DEC.w $15EA				;$B3B6F8
	BRA.b CODE_B3B71A			;$B3B6FB

CODE_B3B6FD:
	LDA.w #$7EA15A				;$B3B6FD
	STA.b $1A				;$B3B700
	LDA.w #$7EA15A>>16			;$B3B702
	STA.b $1C				;$B3B705
	LDA.w #$0140				;$B3B707
	STA.b $1D				;$B3B70A
	LDA.w #$2010				;$B3B70C
	JSL.l CODE_B78012			;$B3B70F
	BCS.b CODE_B3B71A			;$B3B713
	DEC.w $15EA				;$B3B715
	BRA.b CODE_B3B71A			;$B3B718

CODE_B3B71A:
	LDA.w $15E6				;$B3B71A
	ASL					;$B3B71D
	ASL					;$B3B71E
	CMP.w $15E4				;$B3B71F
	BNE.b CODE_B3B725			;$B3B722
	RTS					;$B3B724

CODE_B3B725:
	LDA.w $15EA				;$B3B725
	BNE.b CODE_B3B730			;$B3B728
	LDA.w #$0001				;$B3B72A
	STA.w $15EA				;$B3B72D
CODE_B3B730:
	LDA.w $15E6				;$B3B730
	ASL					;$B3B733
	ASL					;$B3B734
	CMP.w $15E4				;$B3B735
	PHK					;$B3B738
	PLB					;$B3B739
	BCC.b CODE_B3B760			;$B3B73A
	JSR.w CODE_B3B79A			;$B3B73C
	LDA.w DATA_B3B7F4,y			;$B3B73F
	STA.l $7EA15A,x				;$B3B742
	LDA.w DATA_B3B804,y			;$B3B746
	STA.l $7EA16A,x				;$B3B749
	LDA.w DATA_B3B894,y			;$B3B74D
	STA.l $7EA1FA,x				;$B3B750
	LDA.w DATA_B3B8A4,y			;$B3B754
	STA.l $7EA20A,x				;$B3B757
	INC.w $15E4				;$B3B75B
	BRA.b CODE_B3B782			;$B3B75E

CODE_B3B760:
	DEC.w $15E4				;$B3B760
	JSR.w CODE_B3B79A			;$B3B763
	LDA.w DATA_B3B7B4,y			;$B3B766
	STA.l $7EA15A,x				;$B3B769
	LDA.w DATA_B3B7C4,y			;$B3B76D
	STA.l $7EA16A,x				;$B3B770
	LDA.w DATA_B3B7D4,y			;$B3B774
	STA.l $7EA1FA,x				;$B3B777
	LDA.w DATA_B3B7E4,y			;$B3B77B
	STA.l $7EA20A,x				;$B3B77E
CODE_B3B782:
	LDA.w $15E6				;$B3B782
	ASL					;$B3B785
	ASL					;$B3B786
	SEC					;$B3B787
	SBC.w $15E4				;$B3B788
	BPL.b CODE_B3B791			;$B3B78B
	EOR.w #$FFFF				;$B3B78D
	INC					;$B3B790
CODE_B3B791:
	CMP.w #$0008				;$B3B791
	BCC.b CODE_B3B799			;$B3B794
	JMP.w CODE_B3B730			;$B3B796

CODE_B3B799:
	RTS					;$B3B799

CODE_B3B79A:
	LDA.w #$0027				;$B3B79A
	SEC					;$B3B79D
	SBC.w $15E4				;$B3B79E
	ASL					;$B3B7A1
	STA.b $1A				;$B3B7A2
	AND.w #$000E				;$B3B7A4
	STA.b $1C				;$B3B7A7
	TAY					;$B3B7A9
	LDA.b $1A				;$B3B7AA
	AND.w #$FFF0				;$B3B7AC
	ASL					;$B3B7AF
	ORA.b $1C				;$B3B7B0
	TAX					;$B3B7B2
	RTS					;$B3B7B3

DATA_B3B7B4:
	dw $7A1D,$7F00,$7F10,$7F10,$7F10,$7F10,$7F10,$7718

DATA_B3B7C4:
	dw $4202,$470F,$470F,$470F,$470F,$470F,$470F,$4707

DATA_B3B7D4:
	dw $58BE,$F806,$F80E,$E81E,$E81E,$F80E,$F80E,$F80E

DATA_B3B7E4:
	dw $4042,$E0F2,$E0F2,$E8E2,$E8E2,$E8F2,$E0F2,$E0F2

DATA_B3B7F4:
	dw $781F,$7807,$7817,$7817,$7817,$7817,$7817,$701F

DATA_B3B804:
	dw $4202,$470F,$470F,$470F,$470F,$470F,$470F,$4707
	dw $781F,$7807,$7817,$7817,$7817,$7817,$7817,$701F
	dw $4202,$470F,$470F,$470F,$470F,$470F,$470F,$4707
	dw $781F,$7807,$7817,$7817,$7817,$7817,$7817,$701F
	dw $4202,$470F,$470F,$470F,$470F,$470F,$470F,$4707
	dw $781F,$7807,$7817,$7817,$7817,$7817,$7817,$701F
	dw $4202,$470F,$470F,$470F,$470F,$470F,$470F,$4707
	dw $781F,$7807,$7817,$7817,$7817,$7817,$7817,$701F
	dw $4202,$470F,$470F,$470F,$470F,$470F,$470F,$4707

DATA_B3B894:
	dw $18FE,$18E6,$18EE,$08FE,$08FE,$18EE,$18EE,$18EE

DATA_B3B8A4:
	dw $4042,$E0F2,$E0F2,$E8E2,$E8E2,$E8F2,$E0F2,$E0F2
	dw $18FE,$18E6,$18EE,$08FE,$08FE,$18EE,$18EE,$18EE
	dw $4042,$E0F2,$E0F2,$E8E2,$E8E2,$E8F2,$E0F2,$E0F2
	dw $18FE,$18E6,$18EE,$08FE,$08FE,$18EE,$18EE,$18EE
	dw $4042,$E0F2,$E0F2,$E8E2,$E8E2,$E8F2,$E0F2,$E0F2
	dw $18FE,$18E6,$18EE,$08FE,$08FE,$18EE,$18EE,$18EE
	dw $4042,$E0F2,$E0F2,$E8E2,$E8E2,$E8F2,$E0F2,$E0F2
	dw $18FE,$18E6,$18EE,$08FE,$08FE,$18EE,$18EE,$18EE
	dw $4042,$E0F2,$E0F2,$E8E2,$E8E2,$E8F2,$E0F2,$E0F2

CODE_B3B934:
	JSL.l CODE_808015			;$B3B934
	BNE.b CODE_B3B96B			;$B3B938
	JSR.w CODE_B3B971			;$B3B93A
	JSR.w CODE_B3CADC			;$B3B93D
	JSL.l CODE_BB8582			;$B3B940
	JSL.l sprite_handler			;$B3B944
	JSL.l CODE_B7B009			;$B3B948
	JSR.w CODE_B3A6F7			;$B3B94C
	JSL.l CODE_B7B75E			;$B3B94F
	JSL.l CODE_B7B00C			;$B3B953
	JSL.l CODE_B78000			;$B3B957
	JSL.l CODE_BB85BB			;$B3B95B
	JSL.l CODE_808012			;$B3B95F
	JSL.l CODE_808021			;$B3B963
	JML.l CODE_808006			;$B3B967

CODE_B3B96B:
	JSR.w CODE_B3B971			;$B3B96B
	JMP.w CODE_B3A694			;$B3B96E

CODE_B3B971:
	LDA.w $15EC				;$B3B971
	BEQ.b CODE_B3B9AC			;$B3B974
	LDA.w $196D				;$B3B976
	SEC					;$B3B979
	SBC.w $1C35				;$B3B97A
	STA.b $88				;$B3B97D
	LDA.w #$0000				;$B3B97F
	SEC					;$B3B982
	SBC.b $88				;$B3B983
	CLC					;$B3B985
	ADC.w #$00A0				;$B3B986
	CMP.w #$0140				;$B3B989
	BCS.b CODE_B3B99D			;$B3B98C
	LDA.w $15E4				;$B3B98E
	CMP.w #$000E				;$B3B991
	BNE.b CODE_B3B99D			;$B3B994
	LDA.w #$0001				;$B3B996
	STA.l $7EA1BA				;$B3B999
CODE_B3B99D:
	LDA.w $15E4				;$B3B99D
	CMP.w #$0008				;$B3B9A0
	BNE.b CODE_B3B9AC			;$B3B9A3
	LDA.w #$0002				;$B3B9A5
	STA.l $7EA1BA				;$B3B9A8
CODE_B3B9AC:
	%pea_use_dbr($7E8029)			;$B3B9AC
	PLB					;$B3B9AF
	LDA.w #$0010				;$B3B9B0
	SEC					;$B3B9B3
	SBC.b active_frame_counter		;$B3B9B4
	AND.w #$003C				;$B3B9B6
	CLC					;$B3B9B9
	ADC.w #$A1DA				;$B3B9BA
	STA.w $7EA161				;$B3B9BD
	STA.w $7EA164				;$B3B9C0
	STA.w $7EA167				;$B3B9C3
	LDA.b active_frame_counter		;$B3B9C6
	EOR.w #$003C				;$B3B9C8
	AND.w #$003C				;$B3B9CB
	CLC					;$B3B9CE
	ADC.w #$A2DA				;$B3B9CF
	STA.w $7EA561				;$B3B9D2
	STA.w $7EA564				;$B3B9D5
	STA.w $7EA567				;$B3B9D8
	LDA.b active_frame_counter		;$B3B9DB
	AND.w #$003C				;$B3B9DD
	CLC					;$B3B9E0
	ADC.w #$A3DA				;$B3B9E1
	LDX.w #$0206				;$B3B9E4
CODE_B3B9E7:
	STA.w $7EA15B,x				;$B3B9E7
	INX					;$B3B9EA
	INX					;$B3B9EB
	INX					;$B3B9EC
	CPX.w #$0224				;$B3B9ED
	BNE.b CODE_B3B9E7			;$B3B9F0
	LDA.w $196D				;$B3B9F2
	STA.w $7EA1DA				;$B3B9F5
	STA.w $7EA1DE				;$B3B9F8
	STA.w $7EA1E2				;$B3B9FB
	STA.w $7EA1FA				;$B3B9FE
	STA.w $7EA1FE				;$B3BA01
	STA.w $7EA202				;$B3BA04
	STA.w $7EA21A				;$B3BA07
	STA.w $7EA21E				;$B3BA0A
	STA.w $7EA222				;$B3BA0D
	STA.w $7EA23A				;$B3BA10
	STA.w $7EA23E				;$B3BA13
	STA.w $7EA242				;$B3BA16
	STA.w $7EA3DA				;$B3BA19
	STA.w $7EA3DE				;$B3BA1C
	STA.w $7EA3E2				;$B3BA1F
	STA.w $7EA3E6				;$B3BA22
	STA.w $7EA3FA				;$B3BA25
	STA.w $7EA3FE				;$B3BA28
	STA.w $7EA402				;$B3BA2B
	STA.w $7EA406				;$B3BA2E
	STA.w $7EA41A				;$B3BA31
	STA.w $7EA41E				;$B3BA34
	STA.w $7EA422				;$B3BA37
	STA.w $7EA426				;$B3BA3A
	STA.w $7EA43A				;$B3BA3D
	STA.w $7EA43E				;$B3BA40
	STA.w $7EA442				;$B3BA43
	STA.w $7EA446				;$B3BA46
	INC					;$B3BA49
	STA.w $7EA1E6				;$B3BA4A
	STA.w $7EA1F6				;$B3BA4D
	STA.w $7EA206				;$B3BA50
	STA.w $7EA216				;$B3BA53
	STA.w $7EA226				;$B3BA56
	STA.w $7EA236				;$B3BA59
	STA.w $7EA246				;$B3BA5C
	STA.w $7EA256				;$B3BA5F
	STA.w $7EA3EA				;$B3BA62
	STA.w $7EA3EE				;$B3BA65
	STA.w $7EA3F2				;$B3BA68
	STA.w $7EA3F6				;$B3BA6B
	STA.w $7EA40A				;$B3BA6E
	STA.w $7EA40E				;$B3BA71
	STA.w $7EA412				;$B3BA74
	STA.w $7EA416				;$B3BA77
	STA.w $7EA42A				;$B3BA7A
	STA.w $7EA42E				;$B3BA7D
	STA.w $7EA432				;$B3BA80
	STA.w $7EA436				;$B3BA83
	STA.w $7EA44A				;$B3BA86
	STA.w $7EA44E				;$B3BA89
	STA.w $7EA452				;$B3BA8C
	STA.w $7EA456				;$B3BA8F
	INC					;$B3BA92
	STA.w $7EA1EA				;$B3BA93
	STA.w $7EA1EE				;$B3BA96
	STA.w $7EA1F2				;$B3BA99
	STA.w $7EA20A				;$B3BA9C
	STA.w $7EA20E				;$B3BA9F
	STA.w $7EA212				;$B3BAA2
	STA.w $7EA22A				;$B3BAA5
	STA.w $7EA22E				;$B3BAA8
	STA.w $7EA232				;$B3BAAB
	STA.w $7EA24A				;$B3BAAE
	STA.w $7EA24E				;$B3BAB1
	STA.w $7EA252				;$B3BAB4
	LDA.b active_frame_counter		;$B3BAB7
	LSR					;$B3BAB9
	LSR					;$B3BABA
	CLC					;$B3BABB
	ADC.w $196D				;$B3BABC
	STA.w $7EA2DA				;$B3BABF
	STA.w $7EA2DE				;$B3BAC2
	STA.w $7EA2E2				;$B3BAC5
	STA.w $7EA2FA				;$B3BAC8
	STA.w $7EA2FE				;$B3BACB
	STA.w $7EA302				;$B3BACE
	STA.w $7EA31A				;$B3BAD1
	STA.w $7EA31E				;$B3BAD4
	STA.w $7EA322				;$B3BAD7
	STA.w $7EA33A				;$B3BADA
	STA.w $7EA33E				;$B3BADD
	STA.w $7EA342				;$B3BAE0
	INC					;$B3BAE3
	STA.w $7EA2E6				;$B3BAE4
	STA.w $7EA2F6				;$B3BAE7
	STA.w $7EA306				;$B3BAEA
	STA.w $7EA316				;$B3BAED
	STA.w $7EA326				;$B3BAF0
	STA.w $7EA336				;$B3BAF3
	STA.w $7EA346				;$B3BAF6
	STA.w $7EA356				;$B3BAF9
	INC					;$B3BAFC
	STA.w $7EA2EA				;$B3BAFD
	STA.w $7EA2EE				;$B3BB00
	STA.w $7EA2F2				;$B3BB03
	STA.w $7EA30A				;$B3BB06
	STA.w $7EA30E				;$B3BB09
	STA.w $7EA312				;$B3BB0C
	STA.w $7EA32A				;$B3BB0F
	STA.w $7EA32E				;$B3BB12
	STA.w $7EA332				;$B3BB15
	STA.w $7EA34A				;$B3BB18
	STA.w $7EA34E				;$B3BB1B
	STA.w $7EA352				;$B3BB1E
	LDA.w $1973				;$B3BB21
	STA.w $7EA2DC				;$B3BB24
	STA.w $7EA2E0				;$B3BB27
	STA.w $7EA2E4				;$B3BB2A
	STA.w $7EA2E8				;$B3BB2D
	STA.w $7EA2EC				;$B3BB30
	STA.w $7EA2F0				;$B3BB33
	STA.w $7EA2F4				;$B3BB36
	STA.w $7EA2F8				;$B3BB39
	STA.w $7EA31C				;$B3BB3C
	STA.w $7EA320				;$B3BB3F
	STA.w $7EA324				;$B3BB42
	STA.w $7EA328				;$B3BB45
	STA.w $7EA32C				;$B3BB48
	STA.w $7EA330				;$B3BB4B
	STA.w $7EA334				;$B3BB4E
	STA.w $7EA338				;$B3BB51
	STA.w $7EA3DC				;$B3BB54
	STA.w $7EA3E0				;$B3BB57
	STA.w $7EA404				;$B3BB5A
	STA.w $7EA408				;$B3BB5D
	STA.w $7EA40C				;$B3BB60
	STA.w $7EA410				;$B3BB63
	STA.w $7EA414				;$B3BB66
	STA.w $7EA418				;$B3BB69
	STA.w $7EA41C				;$B3BB6C
	STA.w $7EA420				;$B3BB6F
	STA.w $7EA444				;$B3BB72
	STA.w $7EA448				;$B3BB75
	STA.w $7EA44C				;$B3BB78
	STA.w $7EA450				;$B3BB7B
	STA.w $7EA454				;$B3BB7E
	STA.w $7EA458				;$B3BB81
	DEC					;$B3BB84
	STA.w $7EA2FC				;$B3BB85
	STA.w $7EA300				;$B3BB88
	STA.w $7EA304				;$B3BB8B
	STA.w $7EA308				;$B3BB8E
	STA.w $7EA30C				;$B3BB91
	STA.w $7EA310				;$B3BB94
	STA.w $7EA314				;$B3BB97
	STA.w $7EA318				;$B3BB9A
	STA.w $7EA33C				;$B3BB9D
	STA.w $7EA340				;$B3BBA0
	STA.w $7EA344				;$B3BBA3
	STA.w $7EA348				;$B3BBA6
	STA.w $7EA34C				;$B3BBA9
	STA.w $7EA350				;$B3BBAC
	STA.w $7EA354				;$B3BBAF
	STA.w $7EA358				;$B3BBB2
	STA.w $7EA3E4				;$B3BBB5
	STA.w $7EA3E8				;$B3BBB8
	STA.w $7EA3EC				;$B3BBBB
	STA.w $7EA3F0				;$B3BBBE
	STA.w $7EA3F4				;$B3BBC1
	STA.w $7EA3F8				;$B3BBC4
	STA.w $7EA3FC				;$B3BBC7
	STA.w $7EA400				;$B3BBCA
	STA.w $7EA424				;$B3BBCD
	STA.w $7EA428				;$B3BBD0
	STA.w $7EA42C				;$B3BBD3
	STA.w $7EA430				;$B3BBD6
	STA.w $7EA434				;$B3BBD9
	STA.w $7EA438				;$B3BBDC
	STA.w $7EA43C				;$B3BBDF
	STA.w $7EA440				;$B3BBE2
	STA.w $7EA1FC				;$B3BBE5
	STA.w $7EA200				;$B3BBE8
	STA.w $7EA204				;$B3BBEB
	STA.w $7EA208				;$B3BBEE
	STA.w $7EA20C				;$B3BBF1
	STA.w $7EA210				;$B3BBF4
	STA.w $7EA214				;$B3BBF7
	STA.w $7EA218				;$B3BBFA
	STA.w $7EA23C				;$B3BBFD
	STA.w $7EA240				;$B3BC00
	STA.w $7EA244				;$B3BC03
	STA.w $7EA248				;$B3BC06
	STA.w $7EA24C				;$B3BC09
	STA.w $7EA250				;$B3BC0C
	STA.w $7EA254				;$B3BC0F
	STA.w $7EA258				;$B3BC12
	DEC					;$B3BC15
	STA.w $7EA1DC				;$B3BC16
	STA.w $7EA1E0				;$B3BC19
	STA.w $7EA1E4				;$B3BC1C
	STA.w $7EA1E8				;$B3BC1F
	STA.w $7EA1EC				;$B3BC22
	STA.w $7EA1F0				;$B3BC25
	STA.w $7EA1F4				;$B3BC28
	STA.w $7EA1F8				;$B3BC2B
	STA.w $7EA21C				;$B3BC2E
	STA.w $7EA220				;$B3BC31
	STA.w $7EA224				;$B3BC34
	STA.w $7EA228				;$B3BC37
	STA.w $7EA22C				;$B3BC3A
	STA.w $7EA230				;$B3BC3D
	STA.w $7EA234				;$B3BC40
	STA.w $7EA238				;$B3BC43
	PLB					;$B3BC46
	RTS					;$B3BC47

CODE_B3BC48:
	JSL.l CODE_808015			;$B3BC48
	BNE.b CODE_B3BC79			;$B3BC4C
	JSL.l CODE_BB8582			;$B3BC4E
	JSL.l sprite_handler			;$B3BC52
	JSL.l CODE_B7B009			;$B3BC56
	LDX.w active_kong_sprite		;$B3BC5A
	LDA.b $12,x				;$B3BC5D
	JSR.w CODE_B3DE89			;$B3BC5F
	JSR.w CODE_B3BC7C			;$B3BC62
	JSL.l CODE_B7B00C			;$B3BC65
	JSL.l CODE_B78000			;$B3BC69
	JSL.l CODE_808012			;$B3BC6D
	JSL.l CODE_808021			;$B3BC71
	JML.l CODE_808006			;$B3BC75

CODE_B3BC79:
	JMP.w CODE_B3A694			;$B3BC79

CODE_B3BC7C:
	LDA.w $15EA				;$B3BC7C
	BEQ.b CODE_B3BCD0			;$B3BC7F
	BPL.b CODE_B3BCB0			;$B3BC81
	LDA.w #$7EA35A				;$B3BC83
	STA.b $1A				;$B3BC86
	LDA.w #$7EA35A>>16			;$B3BC88
	STA.b $1C				;$B3BC8B
	LDA.w #$0200				;$B3BC8D
	STA.b $1D				;$B3BC90
	LDA.w $15EA				;$B3BC92
	DEC					;$B3BC95
	EOR.w #$8073				;$B3BC96
	XBA					;$B3BC99
	JSL.l CODE_B78012			;$B3BC9A
	BCS.b CODE_B3BCD0			;$B3BC9E
	DEC.w $15EA				;$B3BCA0
	LDA.w $15EA				;$B3BCA3
	BIT.w #$0003				;$B3BCA6
	BNE.b CODE_B3BCD0			;$B3BCA9
	STZ.w $15EA				;$B3BCAB
	BRA.b CODE_B3BCD0			;$B3BCAE

CODE_B3BCB0:
	LDA.w #DATA_F6644B			;$B3BCB0
	STA.b $1A				;$B3BCB3
	LDA.w #DATA_F6644B>>16			;$B3BCB5
	STA.b $1C				;$B3BCB8
	LDA.w #$0200				;$B3BCBA
	STA.b $1D				;$B3BCBD
	LDA.w $15EA				;$B3BCBF
	DEC					;$B3BCC2
	EOR.w #$0073				;$B3BCC3
	XBA					;$B3BCC6
	JSL.l CODE_B78012			;$B3BCC7
	BCS.b CODE_B3BCD0			;$B3BCCB
	DEC.w $15EA				;$B3BCCD
CODE_B3BCD0:
	LDA.w $15E6				;$B3BCD0
	CMP.w $15E4				;$B3BCD3
	BNE.b CODE_B3BD0D			;$B3BCD6
	CMP.w $15E8				;$B3BCD8
	BEQ.b CODE_B3BD0D			;$B3BCDB
	BCC.b CODE_B3BD0A			;$B3BCDD
	LDA.w $15E8				;$B3BCDF
	CMP.w #$0001				;$B3BCE2
	BNE.b CODE_B3BCF7			;$B3BCE5
	LDA.w $15E4				;$B3BCE7
	CMP.w #$0002				;$B3BCEA
	BNE.b CODE_B3BCF7			;$B3BCED
	LDA.w #$0003				;$B3BCEF
	STA.w $15E6				;$B3BCF2
	BRA.b CODE_B3BD0D			;$B3BCF5

CODE_B3BCF7:
	DEC.w $15E6				;$B3BCF7
	LDA.w $15E6				;$B3BCFA
	CMP.w #$0002				;$B3BCFD
	BNE.b CODE_B3BD0D			;$B3BD00
	LDA.w #$0001				;$B3BD02
	STA.w $15E6				;$B3BD05
	BRA.b CODE_B3BD0D			;$B3BD08

CODE_B3BD0A:
	INC.w $15E6				;$B3BD0A
CODE_B3BD0D:
	%pea_use_dbr($7E8029)			;$B3BD0D
	PLB					;$B3BD10
	LDA.l $0015E4				;$B3BD11
	CLC					;$B3BD15
	ADC.l $0015E6				;$B3BD16
	CMP.w #$0009				;$B3BD1A
	BEQ.b CODE_B3BD2D			;$B3BD1D
	BCC.b CODE_B3BD4A			;$B3BD1F
CODE_B3BD21:
	LDA.w $1973				;$B3BD21
	STA.l $7EA358				;$B3BD24
	LDA.w $196D				;$B3BD28
	BRA.b CODE_B3BD56			;$B3BD2B

CODE_B3BD2D:
	LDA.l $0015E4				;$B3BD2D
	CMP.w #$0005				;$B3BD31
	BEQ.b CODE_B3BD41			;$B3BD34
	LDA.l $0015E2				;$B3BD36
	CMP.w #$0060				;$B3BD3A
	BCC.b CODE_B3BD4A			;$B3BD3D
	BRA.b CODE_B3BD21			;$B3BD3F

CODE_B3BD41:
	LDA.l $0015E2				;$B3BD41
	CMP.w #$007F				;$B3BD45
	BCC.b CODE_B3BD21			;$B3BD48
CODE_B3BD4A:
	LDA.w #$0000				;$B3BD4A
	STA.l $7EA358				;$B3BD4D
	LDA.w $196D				;$B3BD51
	LSR					;$B3BD54
	LSR					;$B3BD55
CODE_B3BD56:
	STA.b $1E				;$B3BD56
	LDY.w #$0000				;$B3BD58
	LDX.w #$0000				;$B3BD5B
	SEP.b #$20				;$B3BD5E
CODE_B3BD60:
	LDA.w $7EA1FA,y				;$B3BD60
	AND.b #$0A				;$B3BD63
	STA.w $7EA1FA,y				;$B3BD65
	LDA.l DATA_F6664B,x			;$B3BD68
	SEC					;$B3BD6C
	SBC.b $1E				;$B3BD6D
	STA.w $7EA16A,x				;$B3BD6F
	LDA.l DATA_F6664B+$01,x			;$B3BD72
	SEC					;$B3BD76
	SBC.b $1E				;$B3BD77
	STA.w $7EA16B,x				;$B3BD79
	CMP.w $7EA16A,x				;$B3BD7C
	BCS.b CODE_B3BD96			;$B3BD7F
	STA.b $1A				;$B3BD81
	LDA.w $7EA16A,x				;$B3BD83
	STA.w $7EA16B,x				;$B3BD86
	LDA.b $1A				;$B3BD89
	STA.w $7EA16A,x				;$B3BD8B
	LDA.w $7EA1FA,y				;$B3BD8E
	EOR.b #$01				;$B3BD91
	STA.w $7EA1FA,y				;$B3BD93
CODE_B3BD96:
	LDA.l DATA_F6664B+$02,x			;$B3BD96
	BNE.b CODE_B3BDAA			;$B3BD9A
	LDA.b #$FF				;$B3BD9C
	STA.l $7EA16C,x				;$B3BD9E
	LDA.b #$00				;$B3BDA2
	STA.l $7EA16D,x				;$B3BDA4
	BRA.b CODE_B3BDD4			;$B3BDA8

CODE_B3BDAA:
	SEC					;$B3BDAA
	SBC.b $1E				;$B3BDAB
	STA.w $7EA16C,x				;$B3BDAD
	LDA.l DATA_F6664B+$03,x			;$B3BDB0
	SEC					;$B3BDB4
	SBC.b $1E				;$B3BDB5
	STA.w $7EA16D,x				;$B3BDB7
	CMP.w $7EA16C,x				;$B3BDBA
	BCS.b CODE_B3BDD4			;$B3BDBD
	STA.b $1A				;$B3BDBF
	LDA.w $7EA16C,x				;$B3BDC1
	STA.w $7EA16D,x				;$B3BDC4
	LDA.b $1A				;$B3BDC7
	STA.w $7EA16C,x				;$B3BDC9
	LDA.w $7EA1FA,y				;$B3BDCC
	EOR.b #$04				;$B3BDCF
	STA.w $7EA1FA,y				;$B3BDD1
CODE_B3BDD4:
	INY					;$B3BDD4
	INX					;$B3BDD5
	INX					;$B3BDD6
	INX					;$B3BDD7
	INX					;$B3BDD8
	CPX.w #$0070				;$B3BDD9
	BNE.b CODE_B3BD60			;$B3BDDC
	REP.b #$20				;$B3BDDE
	LDY.w #$0000				;$B3BDE0
	LDA.b active_frame_counter		;$B3BDE3
	ASL					;$B3BDE5
	AND.w #$01FE				;$B3BDE6
	TAX					;$B3BDE9
	LDA.b $1E				;$B3BDEA
	ASL					;$B3BDEC
	ASL					;$B3BDED
	CLC					;$B3BDEE
	ADC.w #$0000				;$B3BDEF
	CLC					;$B3BDF2
	ADC.b active_frame_counter		;$B3BDF3
	STA.b $1A				;$B3BDF5
	LDA.b active_frame_counter		;$B3BDF7
	AND.w #$01FE				;$B3BDF9
	TAX					;$B3BDFC
CODE_B3BDFD:
	LDA.l DATA_B9F278,x			;$B3BDFD
	LSR					;$B3BE01
	LSR					;$B3BE02
	LSR					;$B3BE03
	LSR					;$B3BE04
	LSR					;$B3BE05
	CLC					;$B3BE06
	ADC.b $1A				;$B3BE07
	LSR					;$B3BE09
	LSR					;$B3BE0A
	STA.w $7EA22A,y				;$B3BE0B
	TXA					;$B3BE0E
	CLC					;$B3BE0F
	ADC.w #$0008				;$B3BE10
	AND.w #$01FE				;$B3BE13
	TAX					;$B3BE16
	INY					;$B3BE17
	INY					;$B3BE18
	CPY.w #$0080				;$B3BE19
	BNE.b CODE_B3BDFD			;$B3BE1C
	PLB					;$B3BE1E
	LDA.w $15E6				;$B3BE1F
	CLC					;$B3BE22
	ADC.w $15E4				;$B3BE23
	CMP.w #$0007				;$B3BE26
	BCC.b CODE_B3BE4D			;$B3BE29
	LDA.b active_frame_counter		;$B3BE2B
	BIT.w #$0001				;$B3BE2D
	BEQ.b CODE_B3BE4D			;$B3BE30
	AND.w #$000E				;$B3BE32
	TAX					;$B3BE35
	LDA.l DATA_B3BF72,x			;$B3BE36
	STA.b $1A				;$B3BE3A
	LDA.w #DATA_F6344B>>16			;$B3BE3C
	STA.b $1C				;$B3BE3F
	LDA.w #$0200				;$B3BE41
	STA.b $1D				;$B3BE44
	LDA.w #$5700				;$B3BE46
	JSL.l CODE_B78012			;$B3BE49
CODE_B3BE4D:
	LDA.w $15E6				;$B3BE4D
	CLC					;$B3BE50
	ADC.w $15E4				;$B3BE51
	CMP.w #$0003				;$B3BE54
	BCC.b CODE_B3BE89			;$B3BE57
	LDA.w $15E4				;$B3BE59
	CLC					;$B3BE5C
	ADC.w $15E6				;$B3BE5D
	CMP.w #$0009				;$B3BE60
	BEQ.b CODE_B3BE8B			;$B3BE63
	BCS.b CODE_B3BEA5			;$B3BE65
CODE_B3BE67:
	LDA.b active_frame_counter		;$B3BE67
	BIT.w #$0001				;$B3BE69
	BEQ.b CODE_B3BE89			;$B3BE6C
	AND.w #$000E				;$B3BE6E
	TAX					;$B3BE71
	LDA.l DATA_B3BF62,x			;$B3BE72
	STA.b $1A				;$B3BE76
	LDA.w #DATA_F62C4B>>16			;$B3BE78
	STA.b $1C				;$B3BE7B
	LDA.w #$0100				;$B3BE7D
	STA.b $1D				;$B3BE80
	LDA.w #$2000				;$B3BE82
	JSL.l CODE_B78012			;$B3BE85
CODE_B3BE89:
	BRA.b CODE_B3BEC7			;$B3BE89

CODE_B3BE8B:
	LDA.w $15E4				;$B3BE8B
	CMP.w #$0004				;$B3BE8E
	BEQ.b CODE_B3BE9D			;$B3BE91
	LDA.w $15E2				;$B3BE93
	CMP.w #$0078				;$B3BE96
	BCC.b CODE_B3BEA5			;$B3BE99
	BRA.b CODE_B3BE67			;$B3BE9B

CODE_B3BE9D:
	LDA.w $15E2				;$B3BE9D
	CMP.w #$0060				;$B3BEA0
	BCC.b CODE_B3BE67			;$B3BEA3
CODE_B3BEA5:
	LDA.b active_frame_counter		;$B3BEA5
	BIT.w #$0001				;$B3BEA7
	BEQ.b CODE_B3BEC7			;$B3BEAA
	AND.w #$000E				;$B3BEAC
	TAX					;$B3BEAF
	LDA.l DATA_B3BF52,x			;$B3BEB0
	STA.b $1A				;$B3BEB4
	LDA.w #DATA_F6444B>>16			;$B3BEB6
	STA.b $1C				;$B3BEB9
	LDA.w #$0400				;$B3BEBB
	STA.b $1D				;$B3BEBE
	LDA.w #$2000				;$B3BEC0
	JSL.l CODE_B78012			;$B3BEC3
CODE_B3BEC7:
	LDA.w $15E6				;$B3BEC7
	CMP.w $15E4				;$B3BECA
	BNE.b CODE_B3BED0			;$B3BECD
	RTS					;$B3BECF

CODE_B3BED0:
	BCS.b CODE_B3BEDD			;$B3BED0
	CMP.w #$0001				;$B3BED2
	BEQ.b CODE_B3BF12			;$B3BED5
	CMP.w #$0004				;$B3BED7
	BEQ.b CODE_B3BEED			;$B3BEDA
	RTS					;$B3BEDC

CODE_B3BEDD:
	CMP.w #$0002				;$B3BEDD
	BEQ.b CODE_B3BF29			;$B3BEE0
	CMP.w #$0003				;$B3BEE2
	BEQ.b CODE_B3BF00			;$B3BEE5
	CMP.w #$0005				;$B3BEE7
	BEQ.b CODE_B3BEF3			;$B3BEEA
	RTS					;$B3BEEC

CODE_B3BEED:
	LDA.w $15E2				;$B3BEED
	ASL					;$B3BEF0
	BRA.b CODE_B3BF4E			;$B3BEF1

CODE_B3BEF3:
	LDA.w $15E2				;$B3BEF3
	SEC					;$B3BEF6
	SBC.w #$005E				;$B3BEF7
	BPL.b CODE_B3BEFD			;$B3BEFA
	RTS					;$B3BEFC

CODE_B3BEFD:
	ASL					;$B3BEFD
	BRA.b CODE_B3BF4E			;$B3BEFE

CODE_B3BF00:
	INC.w $15E2				;$B3BF00
	LDA.w $15E2				;$B3BF03
	LSR					;$B3BF06
	CLC					;$B3BF07
	ADC.w #$0034				;$B3BF08
	CMP.w #$00FE				;$B3BF0B
	BEQ.b CODE_B3BF3E			;$B3BF0E
	BRA.b CODE_B3BF4E			;$B3BF10

CODE_B3BF12:
	SEP.b #$20				;$B3BF12
	LDA.b #$30				;$B3BF14
	STA.w PPU.window_layer_logic		;$B3BF16
	REP.b #$20				;$B3BF19
	INC.w $15E2				;$B3BF1B
	LDA.w $15E2				;$B3BF1E
	LSR					;$B3BF21
	CMP.w #$00FE				;$B3BF22
	BEQ.b CODE_B3BF3E			;$B3BF25
	BRA.b CODE_B3BF4E			;$B3BF27

CODE_B3BF29:
	SEP.b #$20				;$B3BF29
	LDA.b #$00				;$B3BF2B
	STA.w PPU.window_layer_logic		;$B3BF2D
	REP.b #$20				;$B3BF30
	INC.w $15E2				;$B3BF32
	LDA.w $15E2				;$B3BF35
	LSR					;$B3BF38
	CMP.w #$0034				;$B3BF39
	BNE.b CODE_B3BF4E			;$B3BF3C
CODE_B3BF3E:
	LDA.w $15E6				;$B3BF3E
	STA.w $15E4				;$B3BF41
	STZ.w $15E2				;$B3BF44
	LDA.w #$FFFF				;$B3BF47
	STA.w $15EC				;$B3BF4A
	RTS					;$B3BF4D

CODE_B3BF4E:
	STA.w $15EC				;$B3BF4E
	RTS					;$B3BF51

DATA_B3BF52:
	dw DATA_F6444B
	dw DATA_F6444B+$0400
	dw DATA_F6444B+$0800
	dw DATA_F6444B+$0C00
	dw DATA_F6444B+$1000
	dw DATA_F6444B+$1400
	dw DATA_F6444B+$1800
	dw DATA_F6444B+$1C00

DATA_B3BF62:
	dw DATA_F62C4B
	dw DATA_F62C4B+$0100
	dw DATA_F62C4B+$0200
	dw DATA_F62C4B+$0300
	dw DATA_F62C4B+$0400
	dw DATA_F62C4B+$0500
	dw DATA_F62C4B+$0600
	dw DATA_F62C4B+$0700

DATA_B3BF72:
	dw DATA_F6344B
	dw DATA_F6344B+$0200
	dw DATA_F6344B+$0400
	dw DATA_F6344B+$0600
	dw DATA_F6344B+$0800
	dw DATA_F6344B+$0A00
	dw DATA_F6344B+$0C00
	dw DATA_F6344B+$0E00

CODE_B3BF82:
	JSL.l CODE_808015			;$B3BF82
	BNE.b CODE_B3BFAE			;$B3BF86
	JSR.w CODE_B3C0F4			;$B3BF88
	JSL.l CODE_BB8582			;$B3BF8B
	JSL.l sprite_handler			;$B3BF8F
	JSL.l CODE_B7B009			;$B3BF93
	JSR.w CODE_B3BFB1			;$B3BF97
	JSL.l CODE_B7C726			;$B3BF9A
	JSL.l CODE_B78000			;$B3BF9E
	JSL.l CODE_808012			;$B3BFA2
	JSL.l CODE_808021			;$B3BFA6
	JML.l CODE_808006			;$B3BFAA

CODE_B3BFAE:
	JMP.w CODE_B3A694			;$B3BFAE

CODE_B3BFB1:
	LDA.w $15E4				;$B3BFB1
	BEQ.b CODE_B3C027			;$B3BFB4
	DEC					;$B3BFB6
	ASL					;$B3BFB7
	ASL					;$B3BFB8
	STA.b $22				;$B3BFB9
	CMP.w #$0010				;$B3BFBB
	BEQ.b CODE_B3C028			;$B3BFBE
	LDA.w #DATA_B3C0A4			;$B3BFC0
	STA.b $1A				;$B3BFC3
	LDA.w #DATA_B3C0A4>>16			;$B3BFC5
	STA.b $1C				;$B3BFC8
	LDA.w #$0004				;$B3BFCA
	STA.b $1D				;$B3BFCD
	LDX.b $22				;$B3BFCF
	LDA.l DATA_B3C090,x			;$B3BFD1
	LDX.w #$0008				;$B3BFD5
CODE_B3BFD8:
	STA.b $20				;$B3BFD8
	JSL.l CODE_B78012			;$B3BFDA
	BCS.b CODE_B3C027			;$B3BFDE
	LDA.b $1A				;$B3BFE0
	CLC					;$B3BFE2
	ADC.w #$0004				;$B3BFE3
	STA.b $1A				;$B3BFE6
	LDA.b $20				;$B3BFE8
	CLC					;$B3BFEA
	ADC.w #$0020				;$B3BFEB
	DEX					;$B3BFEE
	BNE.b CODE_B3BFD8			;$B3BFEF
	STZ.w $15E4				;$B3BFF1
	LDX.b $22				;$B3BFF4
	LDA.l DATA_B3C090+$02,x			;$B3BFF6
	CLC					;$B3BFFA
	ADC.b $8C				;$B3BFFB
	STA.b $1A				;$B3BFFD
	LDA.b $8E				;$B3BFFF
	STA.b $1C				;$B3C001
	LDA.w #$0001				;$B3C003
	STA.b [$1A]				;$B3C006
	INC.b $1A				;$B3C008
	INC.b $1A				;$B3C00A
	LDA.w #$0002				;$B3C00C
	STA.b [$1A]				;$B3C00F
	LDA.b $1A				;$B3C011
	CLC					;$B3C013
	ADC.w #$003E				;$B3C014
	STA.b $1A				;$B3C017
	LDA.w #$0003				;$B3C019
	STA.b [$1A]				;$B3C01C
	INC.b $1A				;$B3C01E
	INC.b $1A				;$B3C020
	LDA.w #$0004				;$B3C022
	STA.b [$1A]				;$B3C025
CODE_B3C027:
	RTS					;$B3C027

CODE_B3C028:
	LDA.w #DATA_B3C0C4			;$B3C028
	STA.b $1A				;$B3C02B
	LDA.w #DATA_B3C0C4>>16			;$B3C02D
	STA.b $1C				;$B3C030
	LDA.w #$0006				;$B3C032
	STA.b $1D				;$B3C035
	LDX.b $22				;$B3C037
	LDA.l DATA_B3C090,x			;$B3C039
	LDX.w #$0008				;$B3C03D
CODE_B3C040:
	STA.b $20				;$B3C040
	JSL.l CODE_B78012			;$B3C042
	BCS.b CODE_B3C027			;$B3C046
	LDA.b $1A				;$B3C048
	CLC					;$B3C04A
	ADC.w #$0006				;$B3C04B
	STA.b $1A				;$B3C04E
	LDA.b $20				;$B3C050
	CLC					;$B3C052
	ADC.w #$0020				;$B3C053
	DEX					;$B3C056
	BNE.b CODE_B3C040			;$B3C057
	STZ.w $15E4				;$B3C059
	LDX.b $22				;$B3C05C
	LDA.l DATA_B3C090+$02,x			;$B3C05E
	CLC					;$B3C062
	ADC.b $8C				;$B3C063
	STA.b $1A				;$B3C065
	LDA.b $8E				;$B3C067
	STA.b $1C				;$B3C069
	LDA.w #$0005				;$B3C06B
	STA.b [$1A]				;$B3C06E
	INC.b $1A				;$B3C070
	INC.b $1A				;$B3C072
	LDA.w #$0006				;$B3C074
	STA.b [$1A]				;$B3C077
	LDA.b $1A				;$B3C079
	CLC					;$B3C07B
	ADC.w #$003E				;$B3C07C
	STA.b $1A				;$B3C07F
	LDA.w #$0007				;$B3C081
	STA.b [$1A]				;$B3C084
	INC.b $1A				;$B3C086
	INC.b $1A				;$B3C088
	LDA.w #$0008				;$B3C08A
	STA.b [$1A]				;$B3C08D
	RTS					;$B3C08F

DATA_B3C090:
	dw $6A1A
	dw $271C
	dw $6B1A
	dw $0F9C
	dw $6E0A
	dw $0304
	dw $691A
	dw $149C
	dw $6983
	dw $18D0


DATA_B3C0A4:
	dw $5001
	dw $2802
	dw $5003
	dw $7004
	dw $5405
	dw $7006
	dw $5405
	dw $3000
	dw $5407
	dw $3000
	dw $4C08
	dw $3000
	dw $4C09
	dw $740A
	dw $700B
	dw $300C


DATA_B3C0C4:
	dw $300D
	dw $300E
	dw $1001
	dw $300F
	dw $3004
	dw $1003
	dw $3010
	dw $0000
	dw $1405
	dw $B011
	dw $0000
	dw $1405
	dw $3011
	dw $0000
	dw $1407
	dw $3012
	dw $0000
	dw $0C08
	dw $3013
	dw $340A
	dw $0C09
	dw $3014
	dw $3015
	dw $300B


CODE_B3C0F4:
	LDA.w #$0158				;$B3C0F4
	STA.b $1A				;$B3C0F7
	LDA.w #$0227				;$B3C0F9
	STA.b $1C				;$B3C0FC
	LDA.w #$02D8				;$B3C0FE
	STA.b $1E				;$B3C101
	LDA.w #$03A7				;$B3C103
	STA.b $20				;$B3C106
	LDA level_number			;$B3C108
	CMP.w #!level_swoopy_salvo		;$B3C10A
	BEQ.b CODE_B3C149			;$B3C10D
	CMP.w #!level_swoopy_salvo_bonus_2	;$B3C10F
	BEQ.b CODE_B3C133			;$B3C112
	SEC					;$B3C114
	SBC.w #!level_swoopy_salvo_bonus_3	;$B3C115
	CMP.w #$0003				;$B3C118
	BCS.b CODE_B3C15D			;$B3C11B
	LDA.w #$0078				;$B3C11D
	STA.b $1A				;$B3C120
	LDA.w #$0147				;$B3C122
	STA.b $1C				;$B3C125
	LDA.w #$01F8				;$B3C127
	STA.b $1E				;$B3C12A
	LDA.w #$02C7				;$B3C12C
	STA.b $20				;$B3C12F
	BRA.b CODE_B3C15D			;$B3C131

CODE_B3C133:
	LDA.w #$0058				;$B3C133
	STA.b $1A				;$B3C136
	LDA.w #$0127				;$B3C138
	STA.b $1C				;$B3C13B
	LDA.w #$01F8				;$B3C13D
	STA.b $1E				;$B3C140
	LDA.w #$02C7				;$B3C142
	STA.b $20				;$B3C145
	BRA.b CODE_B3C15D			;$B3C147

CODE_B3C149:
	LDA.w #$0178				;$B3C149
	STA.b $1A				;$B3C14C
	LDA.w #$0247				;$B3C14E
	STA.b $1C				;$B3C151
	LDA.w #$0318				;$B3C153
	STA.b $1E				;$B3C156
	LDA.w #$03E7				;$B3C158
	STA.b $20				;$B3C15B
CODE_B3C15D:
	LDA.b $1A				;$B3C15D
	SEC					;$B3C15F
	SBC.w $196D				;$B3C160
	BPL.b CODE_B3C168			;$B3C163
	LDA.w #$0000				;$B3C165
CODE_B3C168:
	SEP.b #$20				;$B3C168
	STA.w PPU.window_1_left			;$B3C16A
	REP.b #$20				;$B3C16D
	LDA.b $1C				;$B3C16F
	SEC					;$B3C171
	SBC.w $196D				;$B3C172
	BPL.b CODE_B3C17A			;$B3C175
	LDA.w #$0000				;$B3C177
CODE_B3C17A:
	CMP.w #$00FF				;$B3C17A
	BMI.b CODE_B3C182			;$B3C17D
	LDA.w #$00FF				;$B3C17F
CODE_B3C182:
	SEP.b #$20				;$B3C182
	STA.w PPU.window_1_right		;$B3C184
	REP.b #$20				;$B3C187
	LDA.b $1E				;$B3C189
	SEC					;$B3C18B
	SBC.w $196D				;$B3C18C
	BPL.b CODE_B3C194			;$B3C18F
	LDA.w #$0000				;$B3C191
CODE_B3C194:
	CMP.w #$00FF				;$B3C194
	BMI.b CODE_B3C19C			;$B3C197
	LDA.w #$00FF				;$B3C199
CODE_B3C19C:
	SEP.b #$20				;$B3C19C
	STA.w PPU.window_2_left			;$B3C19E
	REP.b #$20				;$B3C1A1
	LDA.b $20				;$B3C1A3
	SEC					;$B3C1A5
	SBC.w $196D				;$B3C1A6
	CMP.w #$00FF				;$B3C1A9
	BMI.b CODE_B3C1B1			;$B3C1AC
	LDA.w #$00FF				;$B3C1AE
CODE_B3C1B1:
	SEP.b #$20				;$B3C1B1
	STA.w PPU.window_2_right		;$B3C1B3
	REP.b #$20				;$B3C1B6
	LDA.w $0760				;$B3C1B8
	AND.w #$007F				;$B3C1BB
	CMP.w #$0007				;$B3C1BE
	BEQ.b CODE_B3C1C4			;$B3C1C1
	RTS					;$B3C1C3

CODE_B3C1C4:
	JSR.w CODE_B3C1F4			;$B3C1C4
	STX.b $1A				;$B3C1C7
	TXA					;$B3C1C9
	SEC					;$B3C1CA
	SBC.w #$00C8				;$B3C1CB
	CMP.w #$000C				;$B3C1CE
	BCS.b CODE_B3C1DA			;$B3C1D1
	LDA.w #$001C				;$B3C1D3
	JSL.l CODE_BFF006			;$B3C1D6
CODE_B3C1DA:
	LDA.b $1A				;$B3C1DA
	SEC					;$B3C1DC
	SBC.w #$01C4				;$B3C1DD
	CMP.w #$000C				;$B3C1E0
	BCS.b CODE_B3C1EC			;$B3C1E3
	LDA.w #$001D				;$B3C1E5
	JSL.l CODE_BFF006			;$B3C1E8
CODE_B3C1EC:
	RTS					;$B3C1EC

CODE_B3C1ED:
	JSR.w CODE_B3C1F4			;$B3C1ED
	JSR.w CODE_B3C1F4			;$B3C1F0
	RTL					;$B3C1F3

CODE_B3C1F4:
	LDA.w $18A5				;$B3C1F4
	STA.w $18A1				;$B3C1F7
	LDA.w $18A7				;$B3C1FA
	STA.w $18A3				;$B3C1FD
	LDA.b active_frame_counter		;$B3C200
	ASL					;$B3C202
	ASL					;$B3C203
	ASL					;$B3C204
	AND.w #$01FE				;$B3C205
	TAX					;$B3C208
	LDA.l DATA_B9F278,x			;$B3C209
	CMP.w #$8000				;$B3C20D
	ROR					;$B3C210
	CMP.w #$8000				;$B3C211
	ROR					;$B3C214
	CMP.w #$8000				;$B3C215
	ROR					;$B3C218
	STA.w $18A5				;$B3C219
	LDA.b active_frame_counter		;$B3C21C
	ASL					;$B3C21E
	ASL					;$B3C21F
	ASL					;$B3C220
	ASL					;$B3C221
	CLC					;$B3C222
	ADC.w #$01A0				;$B3C223
	AND.w #$01FE				;$B3C226
	TAX					;$B3C229
	LDA.l DATA_B9F278,x			;$B3C22A
	LSR					;$B3C22E
	LSR					;$B3C22F
	LSR					;$B3C230
	LSR					;$B3C231
	LSR					;$B3C232
	LSR					;$B3C233
	ADC.w #$001B				;$B3C234
	AND.w #$00FF				;$B3C237
	STA.w $18A7				;$B3C23A
	RTS					;$B3C23D

CODE_B3C23E:
	JSR.w CODE_B3C2C4			;$B3C23E
	BRA.b CODE_B3C281			;$B3C241

CODE_B3C243:
	JSR.w CODE_B3C2C4			;$B3C243
	JSL.l CODE_808015			;$B3C246
	BNE.b CODE_B3C2C1			;$B3C24A
	JSL.l CODE_BB8582			;$B3C24C
	JSL.l sprite_handler			;$B3C250
	JSL.l CODE_B7B009			;$B3C254
	JSL.l CODE_B7C4EA			;$B3C258
	JSL.l CODE_B78000			;$B3C25C
	BRA.b CODE_B3C29B			;$B3C260

CODE_B3C262:
	JSR.w CODE_B3C2C4			;$B3C262
	JSL.l CODE_808015			;$B3C265
	BNE.b CODE_B3C2C1			;$B3C269
	JSL.l CODE_BB8582			;$B3C26B
	JSL.l sprite_handler			;$B3C26F
	JSL.l CODE_B7B009			;$B3C273
	JSL.l CODE_B7C2A3			;$B3C277
	JSL.l CODE_B78000			;$B3C27B
	BRA.b CODE_B3C29B			;$B3C27F

CODE_B3C281:
	JSL.l CODE_808015			;$B3C281
	BNE.b CODE_B3C2C1			;$B3C285
	JSL.l CODE_BB8582			;$B3C287
	JSL.l sprite_handler			;$B3C28B
	JSL.l CODE_B7B009			;$B3C28F
	JSL.l CODE_B7C2A3			;$B3C293
	JSL.l CODE_B78000			;$B3C297
CODE_B3C29B:
	LDA.w $050F				;$B3C29B
	BMI.b CODE_B3C2B5			;$B3C29E
	JSR.w CODE_B3CADC			;$B3C2A0
	JSL.l CODE_BB85BB			;$B3C2A3
	LDA.w $05AF				;$B3C2A7
	BIT.w #$0010				;$B3C2AA
	BEQ.b CODE_B3C2B5			;$B3C2AD
	ORA.w #$0200				;$B3C2AF
	STA.w $05AF				;$B3C2B2
CODE_B3C2B5:
	JSL.l CODE_808012			;$B3C2B5
	JSL.l CODE_808021			;$B3C2B9
	JML.l CODE_808006			;$B3C2BD

CODE_B3C2C1:
	JMP.w CODE_B3A694			;$B3C2C1

CODE_B3C2C4:
	LDA.w $1973				;$B3C2C4
	CLC					;$B3C2C7
	ADC.w #$000C				;$B3C2C8
	STA.l $7EA51C				;$B3C2CB
	STA.l $7EA520				;$B3C2CF
	STA.l $7EA524				;$B3C2D3
	STA.l $7EA528				;$B3C2D7
	STA.l $7EA52C				;$B3C2DB
	STA.l $7EA530				;$B3C2DF
	STA.l $7EA534				;$B3C2E3
	STA.l $7EA538				;$B3C2E7
	STA.l $7EA53C				;$B3C2EB
	STA.l $7EA540				;$B3C2EF
	STA.l $7EA544				;$B3C2F3
	STA.l $7EA548				;$B3C2F7
	STA.l $7EA54C				;$B3C2FB
	STA.l $7EA550				;$B3C2FF
	STA.l $7EA554				;$B3C303
	STA.l $7EA558				;$B3C307
	LDA.b active_frame_counter		;$B3C30B
	LSR					;$B3C30D
	AND.w #$003C				;$B3C30E
	INC					;$B3C311
	INC					;$B3C312
	TAX					;$B3C313
	JSR.w CODE_B3C381			;$B3C314
	JSR.w CODE_B3C381			;$B3C317
	JSR.w CODE_B3C381			;$B3C31A
	JSR.w CODE_B3C381			;$B3C31D
	JSR.w CODE_B3C381			;$B3C320
	JSR.w CODE_B3C381			;$B3C323
	JSR.w CODE_B3C381			;$B3C326
	JSR.w CODE_B3C381			;$B3C329
	LDA.b active_frame_counter		;$B3C32C
	EOR.w #$FFFF				;$B3C32E
	AND.w #$003C				;$B3C331
	TAX					;$B3C334
	LDA.w $196D				;$B3C335
	SBC.w #$0010				;$B3C338
	JSR.w CODE_B3C371			;$B3C33B
	JSR.w CODE_B3C371			;$B3C33E
	JSR.w CODE_B3C371			;$B3C341
	INC					;$B3C344
	JSR.w CODE_B3C371			;$B3C345
	JSR.w CODE_B3C371			;$B3C348
	INC					;$B3C34B
	JSR.w CODE_B3C371			;$B3C34C
	JSR.w CODE_B3C371			;$B3C34F
	JSR.w CODE_B3C371			;$B3C352
	INC					;$B3C355
	JSR.w CODE_B3C371			;$B3C356
	JSR.w CODE_B3C371			;$B3C359
	JSR.w CODE_B3C371			;$B3C35C
	DEC					;$B3C35F
	JSR.w CODE_B3C371			;$B3C360
	JSR.w CODE_B3C371			;$B3C363
	DEC					;$B3C366
	JSR.w CODE_B3C371			;$B3C367
	JSR.w CODE_B3C371			;$B3C36A
	JSR.w CODE_B3C371			;$B3C36D
	RTS					;$B3C370

CODE_B3C371:
	STA.l $7EA51A,x				;$B3C371
	TAY					;$B3C375
	TXA					;$B3C376
	CLC					;$B3C377
	ADC.w #$0004				;$B3C378
	AND.w #$003E				;$B3C37B
	TAX					;$B3C37E
	TYA					;$B3C37F
	RTS					;$B3C380

CODE_B3C381:
	LDA.l $7EA51A,x				;$B3C381
	INC					;$B3C385
	STA.l $7EA51A,x				;$B3C386
	TAY					;$B3C38A
	TXA					;$B3C38B
	CLC					;$B3C38C
	ADC.w #$0004				;$B3C38D
	AND.w #$003E				;$B3C390
	TAX					;$B3C393
	TYA					;$B3C394
	RTS					;$B3C395

CODE_B3C396:
	JSL.l CODE_808015			;$B3C396
	BNE.b CODE_B3C3BC			;$B3C39A
	JSL.l CODE_BB8582			;$B3C39C
	JSL.l sprite_handler			;$B3C3A0
	JSL.l CODE_B7B009			;$B3C3A4
	JSL.l CODE_B7B00C			;$B3C3A8
	JSL.l CODE_B78000			;$B3C3AC
	JSL.l CODE_808012			;$B3C3B0
	JSL.l CODE_808021			;$B3C3B4
	JML.l CODE_808006			;$B3C3B8

CODE_B3C3BC:
	JMP.w CODE_B3A694			;$B3C3BC

CODE_B3C3BF:
	JSL.l CODE_808015			;$B3C3BF
	BNE.b CODE_B3C3E8			;$B3C3C3
	JSL.l CODE_BB8582			;$B3C3C5
	JSL.l sprite_handler			;$B3C3C9
	JSL.l CODE_B7B009			;$B3C3CD
	JSL.l CODE_B7C726			;$B3C3D1
	JSL.l CODE_B78000			;$B3C3D5
	JSL.l CODE_808012			;$B3C3D9
	JSR.w CODE_B3C44B			;$B3C3DD
	JSL.l CODE_808021			;$B3C3E0
	JML.l CODE_808006			;$B3C3E4

CODE_B3C3E8:
	JMP.w CODE_B3A694			;$B3C3E8

CODE_B3C3EB:
	JSL.l CODE_808015			;$B3C3EB
	BNE.b CODE_B3C414			;$B3C3EF
	JSL.l CODE_BB8582			;$B3C3F1
	JSL.l sprite_handler			;$B3C3F5
	JSL.l CODE_B7B009			;$B3C3F9
	JSL.l CODE_B7C2A3			;$B3C3FD
	JSL.l CODE_B78000			;$B3C401
	JSL.l CODE_808012			;$B3C405
	JSR.w CODE_B3C44B			;$B3C409
	JSL.l CODE_808021			;$B3C40C
	JML.l CODE_808006			;$B3C410

CODE_B3C414:
	JMP.w CODE_B3A694			;$B3C414

CODE_B3C417:
	JSL.l CODE_808015			;$B3C417
	BNE.b CODE_B3C448			;$B3C41B
	JSL.l CODE_BB8582			;$B3C41D
	JSL.l sprite_handler			;$B3C421
	JSL.l CODE_B7B009			;$B3C425
	JSL.l CODE_B7C2A3			;$B3C429
	JSL.l CODE_B7800C			;$B3C42D
	JSL.l CODE_B6804E			;$B3C431
	JSL.l CODE_B7801E			;$B3C435
	JSL.l CODE_808012			;$B3C439
	JSR.w CODE_B3C44B			;$B3C43D
	JSL.l CODE_808021			;$B3C440
	JML.l CODE_808006			;$B3C444

CODE_B3C448:
	JMP.w CODE_B3A694			;$B3C448

CODE_B3C44B:
	LDA.w $1973				;$B3C44B
	LSR					;$B3C44E
	LSR					;$B3C44F
	SEC					;$B3C450
	SBC.b active_frame_counter		;$B3C451
	SEC					;$B3C453
	SBC.b active_frame_counter		;$B3C454
	SEC					;$B3C456
	SBC.b active_frame_counter		;$B3C457
	STA.b $1A				;$B3C459
	LDX.w #$0000				;$B3C45B
	LDA.b active_frame_counter		;$B3C45E
	BIT.w #$0001				;$B3C460
	BNE.b CODE_B3C478			;$B3C463
CODE_B3C465:
	LDA.l $7EA56A,x				;$B3C465
	CLC					;$B3C469
	ADC.b $1A				;$B3C46A
	STA.l $7EA36A,x				;$B3C46C
	INX					;$B3C470
	INX					;$B3C471
	CPX.w #$01C0				;$B3C472
	BNE.b CODE_B3C465			;$B3C475
	RTS					;$B3C477

CODE_B3C478:
	LDA.l $7EA56A,x				;$B3C478
	CLC					;$B3C47C
	ADC.b $1A				;$B3C47D
	STA.l $7EA16A,x				;$B3C47F
	INX					;$B3C483
	INX					;$B3C484
	CPX.w #$01C0				;$B3C485
	BNE.b CODE_B3C478			;$B3C488
	RTS					;$B3C48A

CODE_B3C48B:
	JSL.l CODE_808015			;$B3C48B
	BNE.b CODE_B3C4B1			;$B3C48F
	JSL.l CODE_BB8582			;$B3C491
	JSL.l sprite_handler			;$B3C495
	JSL.l CODE_B7800C			;$B3C499
	JSL.l CODE_B6804B			;$B3C49D
	JSL.l CODE_B7800F			;$B3C4A1
	JSL.l CODE_808012			;$B3C4A5
	JSL.l CODE_808021			;$B3C4A9
	JML.l CODE_808006			;$B3C4AD

CODE_B3C4B1:
	JMP.w CODE_B3A694			;$B3C4B1

CODE_B3C4B4:
	JSL.l CODE_808015			;$B3C4B4
	BNE.b CODE_B3C4DD			;$B3C4B8
	JSL.l CODE_BB8582			;$B3C4BA
	JSL.l CODE_B7B009			;$B3C4BE
	JSL.l sprite_handler			;$B3C4C2
	JSL.l CODE_B7C726			;$B3C4C6
	JSL.l CODE_B78000			;$B3C4CA
	JSL.l CODE_808012			;$B3C4CE
	JSR.w CODE_B3C4E0			;$B3C4D2
	JSL.l CODE_808021			;$B3C4D5
	JML.l CODE_808006			;$B3C4D9

CODE_B3C4DD:
	JMP.w CODE_B3A694			;$B3C4DD

CODE_B3C4E0:
	LDA.w #$013F				;$B3C4E0
	SEC					;$B3C4E3
	SBC.w $1B79				;$B3C4E4
	STA.b $1A				;$B3C4E7
	CMP.w #$0002				;$B3C4E9
	BPL.b CODE_B3C51A			;$B3C4EC
	LDA.w #$7801				;$B3C4EE
	STA.l $7EA16A				;$B3C4F1
	LDA.w #$00A3				;$B3C4F5
	STA.l $7EA16C				;$B3C4F8
	LDA.w #$9E01				;$B3C4FC
	STA.l $7EA38A				;$B3C4FF
	LDA.w #$00A4				;$B3C503
	STA.l $7EA38C				;$B3C506
	LDA.w #$2001				;$B3C50A
	STA.l $7EA37A				;$B3C50D
	LDA.w #$0000				;$B3C511
	STA.l $7EA37C				;$B3C514
	BRA.b CODE_B3C587			;$B3C518

CODE_B3C51A:
	CMP.w #$00E0				;$B3C51A
	BCC.b CODE_B3C522			;$B3C51D
	LDA.w #$00E0				;$B3C51F
CODE_B3C522:
	LSR					;$B3C522
	SEP.b #$20				;$B3C523
	STA.l $7EA37A				;$B3C525
	ORA.b #$80				;$B3C529
	STA.l $7EA16A				;$B3C52B
	STA.l $7EA38A				;$B3C52F
	ADC.b #$00				;$B3C533
	STA.l $7EA16D				;$B3C535
	STA.l $7EA38D				;$B3C539
	EOR.b #$80				;$B3C53D
	STA.l $7EA37C				;$B3C53F
	PHA					;$B3C543
	LDA.b #$21				;$B3C544
	STA.l $7EA37B				;$B3C546
	STA.l $7EA37D				;$B3C54A
	PLA					;$B3C54E
	REP.b #$20				;$B3C54F
	ASL					;$B3C551
	EOR.w #$FFFE				;$B3C552
	CLC					;$B3C555
	ADC.w #$A37A				;$B3C556
	STA.l $7EA16E				;$B3C559
	LDA.b $1A				;$B3C55D
	ASL					;$B3C55F
	EOR.w #$FFFE				;$B3C560
	CLC					;$B3C563
	ADC.w #$A37A				;$B3C564
	STA.l $7EA16B				;$B3C567
	LDA.w #$2001				;$B3C56B
	STA.l $7EA37E				;$B3C56E
	LDA.w #$0000				;$B3C572
	STA.l $7EA380				;$B3C575
	LDA.w #$7801				;$B3C579
	STA.l $7EA170				;$B3C57C
	LDA.w #$00A3				;$B3C580
	STA.l $7EA172				;$B3C583
CODE_B3C587:
	LDA.l $7EA388				;$B3C587
	ASL					;$B3C58B
	CLC					;$B3C58C
	STA.b $1C				;$B3C58D
	LDA.b active_frame_counter		;$B3C58F
	LSR					;$B3C591
	CLC					;$B3C592
	ADC.b $1C				;$B3C593
	AND.w #$001F				;$B3C595
	EOR.w #$001F				;$B3C598
	ASL					;$B3C59B
	ASL					;$B3C59C
	CLC					;$B3C59D
	ADC.w #$A39A				;$B3C59E
	STA.l $7EA38B				;$B3C5A1
	ADC.w #$00FC				;$B3C5A5
	STA.l $7EA38E				;$B3C5A8
	LDX.w #$0017				;$B3C5AC
	LDA.w $1B79				;$B3C5AF
	CMP.w #$0100				;$B3C5B2
	BMI.b CODE_B3C5BA			;$B3C5B5
	LDX.w #$0016				;$B3C5B7
CODE_B3C5BA:
	TXA					;$B3C5BA
	STA.l $7EA15B				;$B3C5BB
	LDA.b active_frame_counter		;$B3C5BF
	BIT.w #$0001				;$B3C5C1
	BNE.b CODE_B3C5D8			;$B3C5C4
	LDA.l $7EA388				;$B3C5C6
	CMP.w $1B77				;$B3C5CA
	BEQ.b CODE_B3C5D4			;$B3C5CD
	BPL.b CODE_B3C5D3			;$B3C5CF
	INC					;$B3C5D1
	INC					;$B3C5D2
CODE_B3C5D3:
	DEC					;$B3C5D3
CODE_B3C5D4:
	STA.l $7EA388				;$B3C5D4
CODE_B3C5D8:
	LDA.l $7EA388				;$B3C5D8
	SEC					;$B3C5DC
	SBC.w $1B77				;$B3C5DD
	AND.w #$00FF				;$B3C5E0
	BIT.w #$0080				;$B3C5E3
	BEQ.b CODE_B3C5EB			;$B3C5E6
	ORA.w #$FF00				;$B3C5E8
CODE_B3C5EB:
	STA.b $1A				;$B3C5EB
	LDA.w $1B77				;$B3C5ED
	XBA					;$B3C5F0
	LDX.w #$01FE				;$B3C5F1
	CLC					;$B3C5F4
CODE_B3C5F5:
	STA.l $7EA179,x				;$B3C5F5
	ADC.b $1A				;$B3C5F9
	DEX					;$B3C5FB
	DEX					;$B3C5FC
	STA.l $7EA179,x				;$B3C5FD
	ADC.b $1A				;$B3C601
	DEX					;$B3C603
	DEX					;$B3C604
	BPL.b CODE_B3C5F5			;$B3C605
	LDA.w $1B67				;$B3C607
	CMP.w $1B69				;$B3C60A
	BEQ.b CODE_B3C630			;$B3C60D
	ASL					;$B3C60F
	TAX					;$B3C610
	LDA.l DATA_B3C631,x			;$B3C611
	STA.b $1A				;$B3C615
	LDA.w #(DATA_E98550+$8A)>>16		;$B3C617
	STA.b $1C				;$B3C61A
	LDA.w #$01CE				;$B3C61C
	STA.b $1D				;$B3C61F
	LDA.w #$656C				;$B3C621
	JSL.l CODE_B78012			;$B3C624
	BCS.b CODE_B3C630			;$B3C628
	LDA.w $1B67				;$B3C62A
	STA.w $1B69				;$B3C62D
CODE_B3C630:
	RTS					;$B3C630

DATA_B3C631:
	dw DATA_E98550+$8A
	dw DATA_E98550+$0258
	dw DATA_E98550+$0426
	dw DATA_E98550+$05F4

CODE_B3C639:
	JSL.l CODE_808015			;$B3C639
	BNE.b CODE_B3C668			;$B3C63D
	JSL.l CODE_BB8582			;$B3C63F
	JSL.l sprite_handler			;$B3C643
	JSL.l CODE_B7B009			;$B3C647
	JSR.w CODE_B3C66B			;$B3C64B
	JSR.w CODE_B3C716			;$B3C64E
	JSL.l CODE_B7C2A3			;$B3C651
	JSR.w CODE_B3B58A			;$B3C655
	JSL.l CODE_B78000			;$B3C658
	JSL.l CODE_808012			;$B3C65C
	JSL.l CODE_808021			;$B3C660
	JML.l CODE_808006			;$B3C664

CODE_B3C668:
	JMP.w CODE_B3A694			;$B3C668

CODE_B3C66B:
	PHK					;$B3C66B
	PLB					;$B3C66C
	LDA.w $196D				;$B3C66D
	SEC					;$B3C670
	SBC.w #$0078				;$B3C671
	STA.b $1A				;$B3C674
	CLC					;$B3C676
	ADC.w #$01F0				;$B3C677
	STA.b $1C				;$B3C67A
	LDA.w $1973				;$B3C67C
	SEC					;$B3C67F
	SBC.w #$00B4				;$B3C680
	STA.b $1E				;$B3C683
	CLC					;$B3C685
	ADC.w #$0194				;$B3C686
	STA.b $20				;$B3C689
	LDX.w $18A5				;$B3C68B
	LDA.w DATA_B3C6EA,x			;$B3C68E
	CMP.b $1A				;$B3C691
	BCC.b CODE_B3C6B4			;$B3C693
	CMP.b $1C				;$B3C695
	BCS.b CODE_B3C6B4			;$B3C697
	LDA.w DATA_B3C700,x			;$B3C699
	CMP.b $1E				;$B3C69C
	BCC.b CODE_B3C6B4			;$B3C69E
	CMP.b $20				;$B3C6A0
	BCS.b CODE_B3C6B4			;$B3C6A2
	LDA.b active_frame_counter		;$B3C6A4
	AND.w #$007F				;$B3C6A6
	BNE.b CODE_B3C6D2			;$B3C6A9
	LDA.w #$0566				;$B3C6AB
	JSL.l queue_sound_effect		;$B3C6AE
	BRA.b CODE_B3C6D2			;$B3C6B2

CODE_B3C6B4:
	LDX.w #$FFFE				;$B3C6B4
CODE_B3C6B7:
	LDA.b $1A				;$B3C6B7
CODE_B3C6B9:
	INX					;$B3C6B9
	INX					;$B3C6BA
	CMP.w DATA_B3C6EA,x			;$B3C6BB
	BCS.b CODE_B3C6B9			;$B3C6BE
	LDA.b $1C				;$B3C6C0
	CMP.w DATA_B3C6EA,x			;$B3C6C2
	BCC.b CODE_B3C6D2			;$B3C6C5
	LDA.w DATA_B3C700,x			;$B3C6C7
	CMP.b $1E				;$B3C6CA
	BCC.b CODE_B3C6B7			;$B3C6CC
	CMP.b $20				;$B3C6CE
	BCS.b CODE_B3C6B7			;$B3C6D0
CODE_B3C6D2:
	STX.w $18A5				;$B3C6D2
	LDA.w DATA_B3C6EA,x			;$B3C6D5
	SEC					;$B3C6D8
	SBC.w $196D				;$B3C6D9
	STA.w $189F				;$B3C6DC
	LDA.w DATA_B3C700,x			;$B3C6DF
	SEC					;$B3C6E2
	SBC.w $1973				;$B3C6E3
	STA.w $18A1				;$B3C6E6
	RTS					;$B3C6E9

DATA_B3C6EA:
	dw $0410
	dw $0530
	dw $0620
	dw $0680
	dw $06A0
	dw $06B0
	dw $06E0
	dw $0920
	dw $0990
	dw $09A0
	dw $FF00


DATA_B3C700:
	dw $0460
	dw $06A0
	dw $02A0
	dw $0140
	dw $0460
	dw $07E0
	dw $06A0
	dw $0860
	dw $0420
	dw $02A0
	dw $FF00


CODE_B3C716:
	LDA.b active_frame_counter		;$B3C716
	ASL					;$B3C718
	ASL					;$B3C719
	AND.w #$01FE				;$B3C71A
	TAX					;$B3C71D
	LDA.l DATA_B9F278,x			;$B3C71E
	BPL.b CODE_B3C731			;$B3C722
	EOR.w #$FFFF				;$B3C724
	INC					;$B3C727
	LSR					;$B3C728
	LSR					;$B3C729
	LSR					;$B3C72A
	EOR.w #$FFFF				;$B3C72B
	INC					;$B3C72E
	BRA.b CODE_B3C734			;$B3C72F

CODE_B3C731:
	LSR					;$B3C731
	LSR					;$B3C732
	LSR					;$B3C733
CODE_B3C734:
	STA.b $1A				;$B3C734
	LDY.w $18A5				;$B3C736
	CMP.w #$8000				;$B3C739
	ROR					;$B3C73C
	EOR.w #$FFFF				;$B3C73D
	SEC					;$B3C740
	ADC.w DATA_B3C6EA,y			;$B3C741
	SEC					;$B3C744
	SBC.w #$0058				;$B3C745
	STA.w $18A7				;$B3C748
	CLC					;$B3C74B
	ADC.w #$00B0				;$B3C74C
	STA.w $18A9				;$B3C74F
	LDA.w #$0080				;$B3C752
	SEC					;$B3C755
	SBC.w $189F				;$B3C756
	XBA					;$B3C759
	STA.b $1C				;$B3C75A
	LDA.b active_frame_counter		;$B3C75C
	BIT.w #$0001				;$B3C75E
	BNE.b CODE_B3C77F			;$B3C761
	LDA.l DATA_B9F278,x			;$B3C763
	ASL					;$B3C767
	ASL					;$B3C768
	CLC					;$B3C769
	ADC.b $1C				;$B3C76A
	LDX.w #$0000				;$B3C76C
CODE_B3C76F:
	STA.l $7EA1C9,x				;$B3C76F
	CLC					;$B3C773
	ADC.b $1A				;$B3C774
	INX					;$B3C776
	INX					;$B3C777
	CPX.w #$0174				;$B3C778
	BNE.b CODE_B3C76F			;$B3C77B
	BRA.b CODE_B3C799			;$B3C77D

CODE_B3C77F:
	LDA.l DATA_B9F278,x			;$B3C77F
	ASL					;$B3C783
	ASL					;$B3C784
	CLC					;$B3C785
	ADC.b $1C				;$B3C786
	LDX.w #$0000				;$B3C788
CODE_B3C78B:
	STA.l $7EA349,x				;$B3C78B
	CLC					;$B3C78F
	ADC.b $1A				;$B3C790
	INX					;$B3C792
	INX					;$B3C793
	CPX.w #$0174				;$B3C794
	BNE.b CODE_B3C78B			;$B3C797
CODE_B3C799:
	LDA.b active_frame_counter		;$B3C799
	LSR					;$B3C79B
	LSR					;$B3C79C
	STA.b $1A				;$B3C79D
	LDA.b active_frame_counter		;$B3C79F
	ASL					;$B3C7A1
	ASL					;$B3C7A2
	CLC					;$B3C7A3
	ADC.b $1A				;$B3C7A4
	AND.w #$01FE				;$B3C7A6
	TAX					;$B3C7A9
	LDA.l DATA_B9F278,x			;$B3C7AA
	CLC					;$B3C7AE
	ADC.w #$0100				;$B3C7AF
	LSR					;$B3C7B2
	LSR					;$B3C7B3
	LSR					;$B3C7B4
	LSR					;$B3C7B5
	LSR					;$B3C7B6
	STA.b $1A				;$B3C7B7
	EOR.w #$FFFF				;$B3C7B9
	INC					;$B3C7BC
	STA.w $18A3				;$B3C7BD
	LDA.b active_frame_counter		;$B3C7C0
	AND.w #$0001				;$B3C7C2
	BEQ.b CODE_B3C7CA			;$B3C7C5
	LDA.w #$0400				;$B3C7C7
CODE_B3C7CA:
	TAX					;$B3C7CA
	LDA.w $18A1				;$B3C7CB
	CMP.w #$00E0				;$B3C7CE
	BMI.b CODE_B3C7D6			;$B3C7D1
	LDA.w #$00E0				;$B3C7D3
CODE_B3C7D6:
	CMP.w #$FF4C				;$B3C7D6
	BPL.b CODE_B3C7DE			;$B3C7D9
	LDA.w #$FF4C				;$B3C7DB
CODE_B3C7DE:
	CMP.w #$0001				;$B3C7DE
	BEQ.b CODE_B3C845			;$B3C7E1
	CMP.w #$0002				;$B3C7E3
	BMI.b CODE_B3C7EB			;$B3C7E6
	JMP.w CODE_B3C89F			;$B3C7E8

CODE_B3C7EB:
	STA.b $1A				;$B3C7EB
	EOR.w #$FFFF				;$B3C7ED
	INC					;$B3C7F0
	ASL					;$B3C7F1
	CLC					;$B3C7F2
	ADC.w #$A1CA				;$B3C7F3
	STA.l $7EA1BB,x				;$B3C7F6
	CLC					;$B3C7FA
	ADC.w #$00BA				;$B3C7FB
	STA.l $7EA1BE,x				;$B3C7FE
	SEP.b #$20				;$B3C802
	LDA.b #$FF				;$B3C804
	STA.l $7EA1BA,x				;$B3C806
	STA.l $7EA1BD,x				;$B3C80A
	REP.b #$20				;$B3C80E
	LDA.b $1A				;$B3C810
	CLC					;$B3C812
	ADC.w #$00B8				;$B3C813
	ADC.w $18A3				;$B3C816
	LSR					;$B3C819
	STA.l $7EA19A,x				;$B3C81A
	STA.l $7EA19D,x				;$B3C81E
	LDA.w #$A1AA				;$B3C822
	STA.l $7EA19B,x				;$B3C825
	STA.l $7EA19E,x				;$B3C829
	LDA.w #$0001				;$B3C82D
	STA.l $7EA1A0,x				;$B3C830
	LDA.w #$A1AC				;$B3C834
	STA.l $7EA1A1,x				;$B3C837
	LDA.w #$0000				;$B3C83B
	STA.l $7EA1A3,x				;$B3C83E
	JMP.w CODE_B3C900			;$B3C842

CODE_B3C845:
	STA.l $7EA19A,x				;$B3C845
	STA.l $7EA1BA,x				;$B3C849
	LDA.w #$A1AC				;$B3C84D
	STA.l $7EA19B,x				;$B3C850
	LDA.w #$00B6				;$B3C854
	CLC					;$B3C857
	ADC.w $18A3				;$B3C858
	LSR					;$B3C85B
	STA.l $7EA19D,x				;$B3C85C
	STA.l $7EA1A0,x				;$B3C860
	LDA.w #$A1AA				;$B3C864
	STA.l $7EA19E,x				;$B3C867
	STA.l $7EA1A1,x				;$B3C86B
	LDA.w #$0001				;$B3C86F
	STA.l $7EA1A3,x				;$B3C872
	LDA.w #$A1AC				;$B3C876
	STA.l $7EA1A4,x				;$B3C879
	LDA.w #$0000				;$B3C87D
	STA.l $7EA1A6,x				;$B3C880
	LDA.w #$00FF				;$B3C884
	STA.l $7EA1BD,x				;$B3C887
	STA.l $7EA1C0,x				;$B3C88B
	LDA.w #$A1CA				;$B3C88F
	STA.l $7EA1BE,x				;$B3C892
	LDA.w #$A284				;$B3C896
	STA.l $7EA1C1,x				;$B3C899
	BRA.b CODE_B3C900			;$B3C89D

CODE_B3C89F:
	LSR					;$B3C89F
	STA.l $7EA19A,x				;$B3C8A0
	STA.l $7EA1BA,x				;$B3C8A4
	ADC.w #$0000				;$B3C8A8
	STA.l $7EA19D,x				;$B3C8AB
	STA.l $7EA1BD,x				;$B3C8AF
	LDA.w #$A1AC				;$B3C8B3
	STA.l $7EA19B,x				;$B3C8B6
	STA.l $7EA19E,x				;$B3C8BA
	LDA.w #$00B6				;$B3C8BE
	CLC					;$B3C8C1
	ADC.w $18A3				;$B3C8C2
	LSR					;$B3C8C5
	STA.l $7EA1A0,x				;$B3C8C6
	STA.l $7EA1A3,x				;$B3C8CA
	LDA.w #$A1AA				;$B3C8CE
	STA.l $7EA1A1,x				;$B3C8D1
	STA.l $7EA1A4,x				;$B3C8D5
	LDA.w #$0001				;$B3C8D9
	STA.l $7EA1A6,x				;$B3C8DC
	LDA.w #$A1AC				;$B3C8E0
	STA.l $7EA1A7,x				;$B3C8E3
	LDA.w #$00FF				;$B3C8E7
	STA.l $7EA1C0,x				;$B3C8EA
	STA.l $7EA1C3,x				;$B3C8EE
	LDA.w #$A1CA				;$B3C8F2
	STA.l $7EA1C1,x				;$B3C8F5
	LDA.w #$A2C8				;$B3C8F9
	STA.l $7EA1C4,x				;$B3C8FC
CODE_B3C900:
	LDA.b active_frame_counter		;$B3C900
	BIT.w #$0001				;$B3C902
	BEQ.b CODE_B3C937			;$B3C905
	LDA.l $7EA1BB,x				;$B3C907
	CLC					;$B3C90B
	ADC.w #$0180				;$B3C90C
	STA.l $7EA1BB,x				;$B3C90F
	LDA.l $7EA1BE,x				;$B3C913
	CLC					;$B3C917
	ADC.w #$0180				;$B3C918
	STA.l $7EA1BE,x				;$B3C91B
	LDA.l $7EA1C1,x				;$B3C91F
	CLC					;$B3C923
	ADC.w #$0180				;$B3C924
	STA.l $7EA1C1,x				;$B3C927
	LDA.l $7EA1C4,x				;$B3C92B
	CLC					;$B3C92F
	ADC.w #$0180				;$B3C930
	STA.l $7EA1C4,x				;$B3C933
CODE_B3C937:
	LDA.b active_frame_counter		;$B3C937
	AND.w #$0001				;$B3C939
	BEQ.b CODE_B3C941			;$B3C93C
	LDA.w #$0400				;$B3C93E
CODE_B3C941:
	TAX					;$B3C941
	LDA.b active_frame_counter		;$B3C942
	AND.w #$0001				;$B3C944
	STA.b $1A				;$B3C947
	ASL					;$B3C949
	CLC					;$B3C94A
	ADC.b $1A				;$B3C94B
	CLC					;$B3C94D
	ADC.w $18A1				;$B3C94E
	CLC					;$B3C951
	ADC.w $18A3				;$B3C952
	CMP.w #$00E0				;$B3C955
	BMI.b CODE_B3C95D			;$B3C958
	LDA.w #$00E0				;$B3C95A
CODE_B3C95D:
	CMP.w #$FF4C				;$B3C95D
	BPL.b CODE_B3C965			;$B3C960
	LDA.w #$FF4C				;$B3C962
CODE_B3C965:
	CMP.w #$0000				;$B3C965
	BMI.b CODE_B3C972			;$B3C968
	BNE.b CODE_B3C96F			;$B3C96A
	JMP.w CODE_B3CA84			;$B3C96C

CODE_B3C96F:
	JMP.w CODE_B3CA14			;$B3C96F

CODE_B3C972:
	STA.b $1A				;$B3C972
	CLC					;$B3C974
	ADC.w #$00BA				;$B3C975
	BIT.w #$0080				;$B3C978
	BEQ.b CODE_B3C9D6			;$B3C97B
	INC					;$B3C97D
	SEP.b #$20				;$B3C97E
	STA.l $7EA15D,x				;$B3C980
	STA.l $7EA17D,x				;$B3C984
	LDA.b #$FF				;$B3C988
	STA.l $7EA15A,x				;$B3C98A
	STA.l $7EA17A,x				;$B3C98E
	LDA.b #$86				;$B3C992
	STA.l $7EA160,x				;$B3C994
	STA.l $7EA180,x				;$B3C998
	REP.b #$20				;$B3C99C
	LDA.b $1A				;$B3C99E
	EOR.w #$FFFF				;$B3C9A0
	INC					;$B3C9A3
	ASL					;$B3C9A4
	ASL					;$B3C9A5
	CLC					;$B3C9A6
	ADC.w #DATA_B3F23F			;$B3C9A7
	STA.l $7EA15B,x				;$B3C9AA
	STA.l $7EA161,x				;$B3C9AE
	CLC					;$B3C9B2
	ADC.w #$01FC				;$B3C9B3
	STA.l $7EA15E,x				;$B3C9B6
	ADC.w #$02E8				;$B3C9BA
	STA.l $7EA17E,x				;$B3C9BD
	SEC					;$B3C9C1
	SBC.w #$01FC				;$B3C9C2
	STA.l $7EA17B,x				;$B3C9C5
	STA.l $7EA181,x				;$B3C9C9
	TXA					;$B3C9CD
	CLC					;$B3C9CE
	ADC.w #$0009				;$B3C9CF
	TAX					;$B3C9D2
	JMP.w CODE_B3CAD0			;$B3C9D3

CODE_B3C9D6:
	ORA.w #$0080				;$B3C9D6
	STA.l $7EA15A,x				;$B3C9D9
	STA.l $7EA17A,x				;$B3C9DD
	LDA.w #$0086				;$B3C9E1
	STA.l $7EA15D,x				;$B3C9E4
	STA.l $7EA17D,x				;$B3C9E8
	LDA.b $1A				;$B3C9EC
	EOR.w #$FFFF				;$B3C9EE
	INC					;$B3C9F1
	ASL					;$B3C9F2
	ASL					;$B3C9F3
	CLC					;$B3C9F4
	ADC.w #DATA_B3F23F			;$B3C9F5
	STA.l $7EA15B,x				;$B3C9F8
	STA.l $7EA15E,x				;$B3C9FC
	ADC.w #$02E8				;$B3CA00
	STA.l $7EA17B,x				;$B3CA03
	STA.l $7EA17E,x				;$B3CA07
	TXA					;$B3CA0B
	CLC					;$B3CA0C
	ADC.w #$0006				;$B3CA0D
	TAX					;$B3CA10
	JMP.w CODE_B3CAD0			;$B3CA11

CODE_B3CA14:
	CMP.w #$0007				;$B3CA14
	BCC.b CODE_B3CA67			;$B3CA17
	STA.b $1A				;$B3CA19
	LDA.w #$0086				;$B3CA1B
	STA.l $7EA15A,x				;$B3CA1E
	STA.l $7EA17A,x				;$B3CA22
	LDA.w #DATA_B3F23F			;$B3CA26
	STA.l $7EA15B,x				;$B3CA29
	LDA.w #DATA_B3F527			;$B3CA2D
	STA.l $7EA17B,x				;$B3CA30
	INX					;$B3CA34
	INX					;$B3CA35
	INX					;$B3CA36
	LDA.b $1A				;$B3CA37
	SEC					;$B3CA39
	SBC.w #$0006				;$B3CA3A
	BIT.w #$0080				;$B3CA3D
	BEQ.b CODE_B3CA67			;$B3CA40
	SEP.b #$20				;$B3CA42
	LDA.b #$7F				;$B3CA44
	STA.l $7EA15A,x				;$B3CA46
	STA.l $7EA17A,x				;$B3CA4A
	REP.b #$20				;$B3CA4E
	LDA.w #DATA_B3F23F			;$B3CA50
	STA.l $7EA15B,x				;$B3CA53
	LDA.w #DATA_B3F527			;$B3CA57
	STA.l $7EA17B,x				;$B3CA5A
	LDA.b $1A				;$B3CA5E
	SEC					;$B3CA60
	SBC.w #$0085				;$B3CA61
	INX					;$B3CA64
	INX					;$B3CA65
	INX					;$B3CA66
CODE_B3CA67:
	SEP.b #$20				;$B3CA67
	STA.l $7EA15A,x				;$B3CA69
	STA.l $7EA17A,x				;$B3CA6D
	REP.b #$20				;$B3CA71
	LDA.w #DATA_B3F23F			;$B3CA73
	STA.l $7EA15B,x				;$B3CA76
	LDA.w #DATA_B3F527			;$B3CA7A
	STA.l $7EA17B,x				;$B3CA7D
	INX					;$B3CA81
	INX					;$B3CA82
	INX					;$B3CA83
CODE_B3CA84:
	LDA.w #$86DD				;$B3CA84
	SEP.b #$20				;$B3CA87
	STA.l $7EA15A,x				;$B3CA89
	STA.l $7EA15D,x				;$B3CA8D
	STA.l $7EA17A,x				;$B3CA91
	STA.l $7EA17D,x				;$B3CA95
	XBA					;$B3CA99
	STA.l $7EA160,x				;$B3CA9A
	STA.l $7EA180,x				;$B3CA9E
	REP.b #$20				;$B3CAA2
	LDA.w #DATA_B3F23F			;$B3CAA4
	STA.l $7EA15B,x				;$B3CAA7
	STA.l $7EA161,x				;$B3CAAB
	CLC					;$B3CAAF
	ADC.w #$0174				;$B3CAB0
	STA.l $7EA15E,x				;$B3CAB3
	LDA.w #DATA_B3F527			;$B3CAB7
	STA.l $7EA17B,x				;$B3CABA
	STA.l $7EA181,x				;$B3CABE
	CLC					;$B3CAC2
	ADC.w #$0174				;$B3CAC3
	STA.l $7EA17E,x				;$B3CAC6
	TXA					;$B3CACA
	CLC					;$B3CACB
	ADC.w #$0009				;$B3CACC
	TAX					;$B3CACF
CODE_B3CAD0:
	LDA.w #$0000				;$B3CAD0
	STA.l $7EA15A,x				;$B3CAD3
	STA.l $7EA17A,x				;$B3CAD7
	RTS					;$B3CADB

CODE_B3CADC:
	LDX.w active_kong_sprite		;$B3CADC
	LDA.b $16,x				;$B3CADF
	BMI.b CODE_B3CB20			;$B3CAE1
	CMP.w $050F				;$B3CAE3
	BCC.b CODE_B3CB15			;$B3CAE6
	LDA.w $0517				;$B3CAE8
	INC					;$B3CAEB
	BEQ.b CODE_B3CAF1			;$B3CAEC
	STA.w $0517				;$B3CAEE
CODE_B3CAF1:
	LDA.w #$0010				;$B3CAF1
	TSB.w $05AF				;$B3CAF4
	BNE.b CODE_B3CB20			;$B3CAF7
CODE_B3CAF9:
	LDA.w $0777				;$B3CAF9
	AND.w #$2000				;$B3CAFC
	BNE.b CODE_B3CB0D			;$B3CAFF
	LDX.w active_kong_sprite		;$B3CB01
	STX.b current_sprite			;$B3CB04
	LDY.w #$0028				;$B3CB06
	JSL.l CODE_BB8585			;$B3CB09
CODE_B3CB0D:
	LDA.w #$0766				;$B3CB0D
	JSL.l CODE_B28018			;$B3CB10
	RTS					;$B3CB14

CODE_B3CB15:
	STZ.w $0517				;$B3CB15
	LDA.w #$0010				;$B3CB18
	TRB.w $05AF				;$B3CB1B
	BNE.b CODE_B3CAF9			;$B3CB1E
CODE_B3CB20:
	RTS					;$B3CB20

CODE_B3CB21:
	JSL.l CODE_808015			;$B3CB21
	BNE.b CODE_B3CB43			;$B3CB25
	JSL.l CODE_BB8582			;$B3CB27
	JSL.l sprite_handler			;$B3CB2B
	JSL.l CODE_B7800C			;$B3CB2F
	JSL.l CODE_B7801E			;$B3CB33
	JSL.l CODE_808012			;$B3CB37
	JSL.l CODE_808021			;$B3CB3B
	JML.l CODE_808006			;$B3CB3F

CODE_B3CB43:
	JMP.w CODE_B3A694			;$B3CB43

CODE_B3CB46:
	JSL.l CODE_808015			;$B3CB46
	BNE.b CODE_B3CB73			;$B3CB4A
	JSL.l CODE_B7B009			;$B3CB4C
	JSL.l sprite_handler			;$B3CB50
	JSL.l CODE_B7800C			;$B3CB54
	JSL.l CODE_B7801E			;$B3CB58
	JSL.l CODE_808012			;$B3CB5C
	JSR.w CODE_B3CBF1			;$B3CB60
	LDA.w $15E6				;$B3CB63
	BNE.b CODE_B3CB6B			;$B3CB66
	JSR.w CODE_B3CB76			;$B3CB68
CODE_B3CB6B:
	JSL.l CODE_808021			;$B3CB6B
	JML.l CODE_808006			;$B3CB6F

CODE_B3CB73:
	JMP.w CODE_B3A694			;$B3CB73

CODE_B3CB76:
	LDA.l $7EA162				;$B3CB76
	CMP.l $7EA166				;$B3CB7A
	BEQ.b CODE_B3CB89			;$B3CB7E
	BCC.b CODE_B3CB84			;$B3CB80
	DEC					;$B3CB82
	DEC					;$B3CB83
CODE_B3CB84:
	INC					;$B3CB84
	STA.l $7EA162				;$B3CB85
CODE_B3CB89:
	SEP.b #$20				;$B3CB89
	LDA.l $7EA160				;$B3CB8B
	CLC					;$B3CB8F
	ADC.l $7EA162				;$B3CB90
	STA.l $7EA160				;$B3CB94
	REP.b #$20				;$B3CB98
	BCS.b CODE_B3CBA2			;$B3CB9A
	LDA.l $7EA164				;$B3CB9C
	BEQ.b CODE_B3CBE4			;$B3CBA0
CODE_B3CBA2:
	SEP.b #$20				;$B3CBA2
	LDA.l $7EA161				;$B3CBA4
	INC					;$B3CBA8
	CMP.b #$06				;$B3CBA9
	BNE.b CODE_B3CBAF			;$B3CBAB
	LDA.b #$00				;$B3CBAD
CODE_B3CBAF:
	STA.l $7EA161				;$B3CBAF
	LDA.b #$01				;$B3CBB3
	STA.l $7EA164				;$B3CBB5
	REP.b #$20				;$B3CBB9
	LDA.l $7EA161				;$B3CBBB
	AND.w #$00FF				;$B3CBBF
	ASL					;$B3CBC2
	TAX					;$B3CBC3
	LDA.l DATA_B3CBE5,x			;$B3CBC4
	STA.b $1A				;$B3CBC8
	LDA.w #DATA_E9D786>>16			;$B3CBCA
	STA.b $1C				;$B3CBCD
	LDA.w #$0100				;$B3CBCF
	STA.b $1D				;$B3CBD2
	LDA.w #$6050				;$B3CBD4
	JSL.l CODE_B78012			;$B3CBD7
	BCS.b CODE_B3CBE4			;$B3CBDB
	LDA.w #$0000				;$B3CBDD
	STA.l $7EA164				;$B3CBE0
CODE_B3CBE4:
	RTS					;$B3CBE4

DATA_B3CBE5:
	dw DATA_E9D786
	dw DATA_E9D786+$0100
	dw DATA_E9D786+$0200
	dw DATA_E9D786+$0300
	dw DATA_E9D786+$0400
	dw DATA_E9D786+$0500

CODE_B3CBF1:
	LDA.w #$7EA25A				;$B3CBF1
	STA.w $04F1				;$B3CBF4
	LDA.w #($7EA25A>>16)|$0100		;$B3CBF7
	STA.w $04F3				;$B3CBFA
	JSR.w CODE_B3CF20			;$B3CBFD
	LDA.b active_frame_counter		;$B3CC00
	AND.w #$0007				;$B3CC02
	BNE.b CODE_B3CC10			;$B3CC05
	LDA.l $7EA35A				;$B3CC07
	INC					;$B3CC0B
	STA.l $7EA35A				;$B3CC0C
CODE_B3CC10:
	LDA.b active_frame_counter		;$B3CC10
	AND.w #$0001				;$B3CC12
	BEQ.b CODE_B3CC1A			;$B3CC15
	JMP.w CODE_B3CCDB			;$B3CC17

CODE_B3CC1A:
	LDA.l $7EA35C				;$B3CC1A
	DEC					;$B3CC1E
	BPL.b CODE_B3CC62			;$B3CC1F
CODE_B3CC21:
	JSL.l CODE_808018			;$B3CC21
	AND.w #$0018				;$B3CC25
	BEQ.b CODE_B3CC21			;$B3CC28
	CLC					;$B3CC2A
	ADC.l $7EA35E				;$B3CC2B
	AND.w #$0018				;$B3CC2F
	STA.l $7EA35E				;$B3CC32
	LDA.b $08				;$B3CC36
	CMP.w #$0020				;$B3CC38
	BEQ.b CODE_B3CC57			;$B3CC3B
	LDA.w $15E6				;$B3CC3D
	BIT.w #$0001				;$B3CC40
	BNE.b CODE_B3CC57			;$B3CC43
	LDA.b $02				;$B3CC45
	LDX.w #$0772				;$B3CC47
	BIT.w #$0001				;$B3CC4A
	BEQ.b CODE_B3CC52			;$B3CC4D
	LDX.w #$0771				;$B3CC4F
CODE_B3CC52:
	TXA					;$B3CC52
	JSL.l queue_sound_effect		;$B3CC53
CODE_B3CC57:
	JSL.l CODE_808018			;$B3CC57
	AND.w #$0078				;$B3CC5B
	CLC					;$B3CC5E
	ADC.w #$0008				;$B3CC5F
CODE_B3CC62:
	STA.l $7EA35C				;$B3CC62
	LDA.l $7EA35E				;$B3CC66
	TAX					;$B3CC6A
	PHK					;$B3CC6B
	PLB					;$B3CC6C
	LDA.l $7EA35C				;$B3CC6D
	CMP.w #$0003				;$B3CC71
	BCS.b CODE_B3CCDB			;$B3CC74
	STA.b $1A				;$B3CC76
	LDA.w #$0842				;$B3CC78
	STA.l $7EA1DD				;$B3CC7B
	LDA.w DATA_B3CED4			;$B3CC7F
	LDY.b $1A				;$B3CC82
	CPY.w #$0002				;$B3CC84
	BNE.b CODE_B3CC98			;$B3CC87
	STA.b $1C				;$B3CC89
	LDA.w #$0C63				;$B3CC8B
	STA.l $7EA1DD				;$B3CC8E
	LDA.b $1C				;$B3CC92
	CLC					;$B3CC94
	ADC.w #$0421				;$B3CC95
CODE_B3CC98:
	STA.l $7EA25E				;$B3CC98
	STA.l $7EA266				;$B3CC9C
	STA.l $7EA26E				;$B3CCA0
	STA.l $7EA276				;$B3CCA4
	STA.l $7EA25A				;$B3CCA8
	STA.l $7EA25C				;$B3CCAC
	STA.l $7EA262				;$B3CCB0
	STA.l $7EA264				;$B3CCB4
	STA.l $7EA26A				;$B3CCB8
	STA.l $7EA26C				;$B3CCBC
	STA.l $7EA272				;$B3CCC0
	STA.l $7EA274				;$B3CCC4
	LDA.b $1A				;$B3CCC8
	ASL					;$B3CCCA
	ASL					;$B3CCCB
	TAY					;$B3CCCC
	LDA.w DATA_B3CED4,y			;$B3CCCD
	STA.l $7EA25A,x				;$B3CCD0
	LDA.w DATA_B3CED4+$02,y			;$B3CCD4
	STA.l $7EA25C,x				;$B3CCD7
CODE_B3CCDB:
	LDA.b active_frame_counter		;$B3CCDB
	AND.w #$0001				;$B3CCDD
	BEQ.b CODE_B3CCE5			;$B3CCE0
	LDA.w #$0030				;$B3CCE2
CODE_B3CCE5:
	CLC					;$B3CCE5
	ADC.w #$0020				;$B3CCE6
	STA.b $26				;$B3CCE9
	LDA.w $1B77				;$B3CCEB
	STA.b $88				;$B3CCEE
	LDA.w $1B79				;$B3CCF0
	STA.b $8A				;$B3CCF3
	JSR.w CODE_B3D257			;$B3CCF5
	LDA.l $7EA15A				;$B3CCF8
	BEQ.b CODE_B3CD1D			;$B3CCFC
	LDA.w #DATA_E8B2BC			;$B3CCFE
	STA.b $1A				;$B3CD01
	LDA.w #DATA_E8B2BC>>16			;$B3CD03
	STA.b $1C				;$B3CD06
	LDA.w #$0008				;$B3CD08
	STA.b $1D				;$B3CD0B
	LDY.w #$0006				;$B3CD0D
	LDA.w #$71A3				;$B3CD10
	JSR.w CODE_B3CEBA			;$B3CD13
	LDA.w #$0000				;$B3CD16
	STA.l $7EA15A				;$B3CD19
CODE_B3CD1D:
	LDA.l $7EA15C				;$B3CD1D
	BEQ.b CODE_B3CD6A			;$B3CD21
	CMP.w #$0001				;$B3CD23
	BEQ.b CODE_B3CD49			;$B3CD26
	LDA.w #DATA_E8B2EC			;$B3CD28
	STA.b $1A				;$B3CD2B
	LDA.w #DATA_E8B2EC>>16			;$B3CD2D
	STA.b $1C				;$B3CD30
	LDA.w #$000C				;$B3CD32
	STA.b $1D				;$B3CD35
	LDY.w #$000A				;$B3CD37
	LDA.w #$744C				;$B3CD3A
	JSR.w CODE_B3CEBA			;$B3CD3D
	BCS.b CODE_B3CD6A			;$B3CD40
	LDA.w #$0001				;$B3CD42
	STA.l $7EA15C				;$B3CD45
CODE_B3CD49:
	LDA.w #DATA_E8B364			;$B3CD49
	STA.b $1A				;$B3CD4C
	LDA.w #DATA_E8B364>>16			;$B3CD4E
	STA.b $1C				;$B3CD51
	LDA.w #$0014				;$B3CD53
	STA.b $1D				;$B3CD56
	LDY.w #$000B				;$B3CD58
	LDA.w #$758C				;$B3CD5B
	JSR.w CODE_B3CEBA			;$B3CD5E
	BCS.b CODE_B3CD6A			;$B3CD61
	LDA.w #$0000				;$B3CD63
	STA.l $7EA15C				;$B3CD66
CODE_B3CD6A:
	LDA.l $7EA15E				;$B3CD6A
	BEQ.b CODE_B3CDB7			;$B3CD6E
	CMP.w #$0001				;$B3CD70
	BEQ.b CODE_B3CD96			;$B3CD73
	LDA.w #DATA_E8B440			;$B3CD75
	STA.b $1A				;$B3CD78
	LDA.w #DATA_E8B440>>16			;$B3CD7A
	STA.b $1C				;$B3CD7D
	LDA.w #$0008				;$B3CD7F
	STA.b $1D				;$B3CD82
	LDY.w #$0009				;$B3CD84
	LDA.w #$729C				;$B3CD87
	JSR.w CODE_B3CEBA			;$B3CD8A
	BCS.b CODE_B3CDB7			;$B3CD8D
	LDA.w #$0001				;$B3CD8F
	STA.l $7EA15E				;$B3CD92
CODE_B3CD96:
	LDA.w #DATA_E8B488			;$B3CD96
	STA.b $1A				;$B3CD99
	LDA.w #DATA_E8B488>>16			;$B3CD9B
	STA.b $1C				;$B3CD9E
	LDA.w #$000A				;$B3CDA0
	STA.b $1D				;$B3CDA3
	LDY.w #$0009				;$B3CDA5
	LDA.w #$7680				;$B3CDA8
	JSR.w CODE_B3CEBA			;$B3CDAB
	BCS.b CODE_B3CDB7			;$B3CDAE
	LDA.w #$0000				;$B3CDB0
	STA.l $7EA15E				;$B3CDB3
CODE_B3CDB7:
	LDA.l $7EA168				;$B3CDB7
	BEQ.b CODE_B3CDDC			;$B3CDBB
	LDA.w #DATA_E8B4E2			;$B3CDBD
	STA.b $1A				;$B3CDC0
	LDA.w #DATA_E8B4E2>>16			;$B3CDC2
	STA.b $1C				;$B3CDC5
	LDA.w #$0006				;$B3CDC7
	STA.b $1D				;$B3CDCA
	LDY.w #$000A				;$B3CDCC
	LDA.w #$758C				;$B3CDCF
	JSR.w CODE_B3CEBA			;$B3CDD2
	LDA.w #$0000				;$B3CDD5
	STA.l $7EA168				;$B3CDD8
CODE_B3CDDC:
	LDA.l $7EA16A				;$B3CDDC
	BEQ.b CODE_B3CE29			;$B3CDE0
	CMP.w #$0001				;$B3CDE2
	BEQ.b CODE_B3CE08			;$B3CDE5
	LDA.w #DATA_E8B51E			;$B3CDE7
	STA.b $1A				;$B3CDEA
	LDA.w #DATA_E8B51E>>16			;$B3CDEC
	STA.b $1C				;$B3CDEF
	LDA.w #$0008				;$B3CDF1
	STA.b $1D				;$B3CDF4
	LDY.w #$0008				;$B3CDF6
	LDA.w #$72BC				;$B3CDF9
	JSR.w CODE_B3CEBA			;$B3CDFC
	BCS.b CODE_B3CE29			;$B3CDFF
	LDA.w #$0001				;$B3CE01
	STA.l $7EA16A				;$B3CE04
CODE_B3CE08:
	LDA.w #DATA_E8B55E			;$B3CE08
	STA.b $1A				;$B3CE0B
	LDA.w #DATA_E8B55E>>16			;$B3CE0D
	STA.b $1C				;$B3CE10
	LDA.w #$000A				;$B3CE12
	STA.b $1D				;$B3CE15
	LDY.w #$0008				;$B3CE17
	LDA.w #$76A0				;$B3CE1A
	JSR.w CODE_B3CEBA			;$B3CE1D
	BCS.b CODE_B3CE29			;$B3CE20
	LDA.w #$0000				;$B3CE22
	STA.l $7EA16A				;$B3CE25
CODE_B3CE29:
	LDA.w $15E4				;$B3CE29
	CMP.w #$0001				;$B3CE2C
	BNE.b CODE_B3CE43			;$B3CE2F
	LDA.w #DATA_B3CEE4			;$B3CE31
	STA.w $04F1				;$B3CE34
	LDA.w #(DATA_B3CEE4>>16)|$1100		;$B3CE37
	STA.w $04F3				;$B3CE3A
	JSR.w CODE_B3CF20			;$B3CE3D
	INC.w $15E4				;$B3CE40
CODE_B3CE43:
	LDA.w $15E4				;$B3CE43
	CMP.w #$0005				;$B3CE46
	BNE.b CODE_B3CE5D			;$B3CE49
	LDA.w #DATA_B3CF02			;$B3CE4B
	STA.w $04F1				;$B3CE4E
	LDA.w #(DATA_B3CF02>>16)|$1100		;$B3CE51
	STA.w $04F3				;$B3CE54
	JSR.w CODE_B3CF20			;$B3CE57
	INC.w $15E4				;$B3CE5A
CODE_B3CE5D:
	LDA.w $15E6				;$B3CE5D
	BEQ.b CODE_B3CE7E			;$B3CE60
	LDA.w $15E4				;$B3CE62
	BNE.b CODE_B3CE7E			;$B3CE65
	LDA.w #DATA_F45F40			;$B3CE67
	STA.b $24				;$B3CE6A
	LDA.w #DATA_F45F40>>16			;$B3CE6C
	STA.b $26				;$B3CE6F
	LDA.w #$1740				;$B3CE71
	STA.b $28				;$B3CE74
	LDA.w #$6000				;$B3CE76
	STA.b $2A				;$B3CE79
	JSR.w CODE_B3CF3A			;$B3CE7B
CODE_B3CE7E:
	LDA.w $15E4				;$B3CE7E
	CMP.w #$0006				;$B3CE81
	BNE.b CODE_B3CE9D			;$B3CE84
	LDA.w #DATA_E9E146			;$B3CE86
	STA.b $24				;$B3CE89
	LDA.w #DATA_E9E146>>16			;$B3CE8B
	STA.b $26				;$B3CE8E
	LDA.w #$1740				;$B3CE90
	STA.b $28				;$B3CE93
	LDA.w #$6000				;$B3CE95
	STA.b $2A				;$B3CE98
	JSR.w CODE_B3CF3A			;$B3CE9A
CODE_B3CE9D:
	LDA.w $15E6				;$B3CE9D
	BNE.b CODE_B3CEB9			;$B3CEA0
	LDA.w $15E4				;$B3CEA2
	CMP.w #$0003				;$B3CEA5
	BNE.b CODE_B3CEB9			;$B3CEA8
	LDA.w #$0004				;$B3CEAA
	STA.w $15E4				;$B3CEAD
	LDA.w $04E4				;$B3CEB0
	EOR.w #$0600				;$B3CEB3
	STA.w $04E4				;$B3CEB6
CODE_B3CEB9:
	RTS					;$B3CEB9

CODE_B3CEBA:
	STA.b $22				;$B3CEBA
	JSL.l CODE_B78012			;$B3CEBC
	BCS.b CODE_B3CED3			;$B3CEC0
	LDA.b $1A				;$B3CEC2
	CLC					;$B3CEC4
	ADC.b $1D				;$B3CEC5
	STA.b $1A				;$B3CEC7
	LDA.b $22				;$B3CEC9
	CLC					;$B3CECB
	ADC.w #$0020				;$B3CECC
	DEY					;$B3CECF
	BNE.b CODE_B3CEBA			;$B3CED0
	CLC					;$B3CED2
CODE_B3CED3:
	RTS					;$B3CED3

DATA_B3CED4:
	dw $1462
	dw $1462
	dw $1462
	dw $418B
	dw $418B
	dw $7FFD
	dw $1462
	dw $418B

DATA_B3CEE4:
	dw $0420
	dw $0820
	dw $0840
	dw $0C40
	dw $1060
	dw $1481
	dw $1CA1
	dw $20E2
	dw $2D24
	dw $3586
	dw $41C8
	dw $5247
	dw $62E6
	dw $7366
	dw $7FE5


DATA_B3CF02:
	dw $0000
	dw $0023
	dw $0049
	dw $04AE
	dw $0D14
	dw $115A
	dw $19BF
	dw $2A9F
	dw $031A
	dw $0254
	dw $018D
	dw $0CA4
	dw $1927
	dw $1988
	dw $1DE9


CODE_B3CF20:
	LDA.b $E8				;$B3CF20
	ASL					;$B3CF22
	ASL					;$B3CF23
	TAX					;$B3CF24
	LDA.w $04F1				;$B3CF25
	STA.w $06FC,x				;$B3CF28
	LDA.w $04F3				;$B3CF2B
	STA.w $06FE,x				;$B3CF2E
	LDA.b $E8				;$B3CF31
	INC					;$B3CF33
	AND.w #$000F				;$B3CF34
	STA.b $E8				;$B3CF37
	RTS					;$B3CF39

CODE_B3CF3A:
	LDA.b $80				;$B3CF3A
	SEC					;$B3CF3C
	SBC.w $1560				;$B3CF3D
	SBC.w #$003C				;$B3CF40
	BMI.b CODE_B3CF8A			;$B3CF43
	INC					;$B3CF45
	INC					;$B3CF46
	STA.b $1A				;$B3CF47
	LDA.b $28				;$B3CF49
	SEC					;$B3CF4B
	SBC.w $15E2				;$B3CF4C
	CMP.b $1A				;$B3CF4F
	BMI.b CODE_B3CF58			;$B3CF51
	LDA.b $1A				;$B3CF53
	AND.w #$FFFE				;$B3CF55
CODE_B3CF58:
	STA.b $22				;$B3CF58
	LDA.w $15E2				;$B3CF5A
	CLC					;$B3CF5D
	ADC.b $24				;$B3CF5E
	STA.b $1A				;$B3CF60
	LDA.b $26				;$B3CF62
	STA.b $1C				;$B3CF64
	LDA.b $22				;$B3CF66
	STA.b $1D				;$B3CF68
	LDA.w $15E2				;$B3CF6A
	LSR					;$B3CF6D
	CLC					;$B3CF6E
	ADC.b $2A				;$B3CF6F
	JSL.l CODE_B78012			;$B3CF71
	BCS.b CODE_B3CF8A			;$B3CF75
	LDA.w $15E2				;$B3CF77
	CLC					;$B3CF7A
	ADC.b $22				;$B3CF7B
	STA.w $15E2				;$B3CF7D
	CMP.b $28				;$B3CF80
	BNE.b CODE_B3CF8A			;$B3CF82
	STZ.w $15E2				;$B3CF84
	INC.w $15E4				;$B3CF87
CODE_B3CF8A:
	RTS					;$B3CF8A

CODE_B3CF8B:
	JSL.l CODE_808015			;$B3CF8B
	BNE.b CODE_B3CFBB			;$B3CF8F
	JSL.l CODE_BB8582			;$B3CF91
	JSL.l CODE_B7B009			;$B3CF95
	JSL.l sprite_handler			;$B3CF99
	JSL.l CODE_B7C2A3			;$B3CF9D
	JSL.l CODE_B7800C			;$B3CFA1
	JSL.l CODE_B7801E			;$B3CFA5
	JSL.l CODE_808012			;$B3CFA9
	JSR.w CODE_B3CFBE			;$B3CFAD
	JSR.w CODE_B3CB76			;$B3CFB0
	JSL.l CODE_808021			;$B3CFB3
	JML.l CODE_808006			;$B3CFB7

CODE_B3CFBB:
	JMP.w CODE_B3A694			;$B3CFBB

CODE_B3CFBE:
	LDA.w $15E2				;$B3CFBE
	BNE.b CODE_B3CFC4			;$B3CFC1
	RTS					;$B3CFC3

CODE_B3CFC4:
	DEC.w $15E2				;$B3CFC4
	LDA.w $1BA1				;$B3CFC7
	SEC					;$B3CFCA
	SBC.w $196D				;$B3CFCB
	AND.w #$00FF				;$B3CFCE
	STA.w $15E4				;$B3CFD1
	LDA.w $1BA3				;$B3CFD4
	SEC					;$B3CFD7
	SBC.w $196D				;$B3CFD8
	AND.w #$00FF				;$B3CFDB
	STA.w $15E6				;$B3CFDE
	LDA.w $15E4				;$B3CFE1
	SEC					;$B3CFE4
	SBC.w $15E6				;$B3CFE5
	SEP.b #$20				;$B3CFE8
	STA.w PPU.fixed_point_mul_A		;$B3CFEA
	XBA					;$B3CFED
	STA.w PPU.fixed_point_mul_A		;$B3CFEE
	LDA.b #$2F				;$B3CFF1
	STA.w PPU.fixed_point_mul_B		;$B3CFF3
	REP.b #$20				;$B3CFF6
	LDA.w $15E4				;$B3CFF8
	SEC					;$B3CFFB
	SBC.w $15E6				;$B3CFFC
	STA.b $1A				;$B3CFFF
	CMP.w #$8000				;$B3D001
	ROR					;$B3D004
	CLC					;$B3D005
	ADC.b $1A				;$B3D006
	CLC					;$B3D008
	ADC.w PPU.multiply_result_mid		;$B3D009
	STA.b $1C				;$B3D00C
	LDA.b $1C				;$B3D00E
	CLC					;$B3D010
	ADC.w #$0004				;$B3D011
	STA.b $1A				;$B3D014
	LDA.b active_frame_counter		;$B3D016
	BIT.w #$0001				;$B3D018
	BEQ.b CODE_B3D020			;$B3D01B
	JMP.w CODE_B3D0AE			;$B3D01D

CODE_B3D020:
	LDA.w $15E6				;$B3D020
	SEC					;$B3D023
	SBC.w #$0008				;$B3D024
	XBA					;$B3D027
	LDX.w #$0098				;$B3D028
	CLC					;$B3D02B
CODE_B3D02C:
	ADC.b $1A				;$B3D02C
	STA.l $7EA459,x				;$B3D02E
	DEX					;$B3D032
	BPL.b CODE_B3D02C			;$B3D033
	LDA.b $1C				;$B3D035
	SEC					;$B3D037
	SBC.w #$000E				;$B3D038
	STA.b $1A				;$B3D03B
	LDA.w $15E6				;$B3D03D
	SEC					;$B3D040
	SBC.w $15E4				;$B3D041
	SEP.b #$20				;$B3D044
	STA.w PPU.fixed_point_mul_A		;$B3D046
	XBA					;$B3D049
	STA.w PPU.fixed_point_mul_A		;$B3D04A
	LDA.b #$0D				;$B3D04D
	STA.w PPU.fixed_point_mul_B		;$B3D04F
	REP.b #$20				;$B3D052
	LDA.w $15E6				;$B3D054
	SEC					;$B3D057
	SBC.w $15E4				;$B3D058
	CMP.w #$8000				;$B3D05B
	ROR					;$B3D05E
	CLC					;$B3D05F
	ADC.w PPU.multiply_result_mid		;$B3D060
	CLC					;$B3D063
	ADC.w $15E4				;$B3D064
	XBA					;$B3D067
	STA.b $1E				;$B3D068
	LDX.w #$0054				;$B3D06A
	CLC					;$B3D06D
CODE_B3D06E:
	ADC.b $1A				;$B3D06E
	STA.l $7EA599,x				;$B3D070
	DEX					;$B3D074
	BPL.b CODE_B3D06E			;$B3D075
	LDA.b $1C				;$B3D077
	CLC					;$B3D079
	ADC.w #$000E				;$B3D07A
	STA.b $1A				;$B3D07D
	LDA.b $1E				;$B3D07F
	LDX.w #$0054				;$B3D081
	CLC					;$B3D084
CODE_B3D085:
	ADC.b $1A				;$B3D085
	STA.l $7EA639,x				;$B3D087
	DEX					;$B3D08B
	BPL.b CODE_B3D085			;$B3D08C
	LDA.b $1C				;$B3D08E
	SEC					;$B3D090
	SBC.w #$0005				;$B3D091
	STA.b $1A				;$B3D094
	LDA.w $15E6				;$B3D096
	CLC					;$B3D099
	ADC.w #$0007				;$B3D09A
	XBA					;$B3D09D
	LDX.w #$0098				;$B3D09E
	CLC					;$B3D0A1
CODE_B3D0A2:
	ADC.b $1A				;$B3D0A2
	STA.l $7EA4F9,x				;$B3D0A4
	DEX					;$B3D0A8
	BPL.b CODE_B3D0A2			;$B3D0A9
	JMP.w CODE_B3D139			;$B3D0AB

CODE_B3D0AE:
	LDA.w $15E6				;$B3D0AE
	SEC					;$B3D0B1
	SBC.w #$0008				;$B3D0B2
	XBA					;$B3D0B5
	LDX.w #$0098				;$B3D0B6
	CLC					;$B3D0B9
CODE_B3D0BA:
	ADC.b $1A				;$B3D0BA
	STA.l $7EA1D9,x				;$B3D0BC
	DEX					;$B3D0C0
	BPL.b CODE_B3D0BA			;$B3D0C1
	LDA.b $1C				;$B3D0C3
	SEC					;$B3D0C5
	SBC.w #$000E				;$B3D0C6
	STA.b $1A				;$B3D0C9
	LDA.w $15E6				;$B3D0CB
	SEC					;$B3D0CE
	SBC.w $15E4				;$B3D0CF
	SEP.b #$20				;$B3D0D2
	STA.w PPU.fixed_point_mul_A		;$B3D0D4
	XBA					;$B3D0D7
	STA.w PPU.fixed_point_mul_A		;$B3D0D8
	LDA.b #$0D				;$B3D0DB
	STA.w PPU.fixed_point_mul_B		;$B3D0DD
	REP.b #$20				;$B3D0E0
	LDA.w $15E6				;$B3D0E2
	SEC					;$B3D0E5
	SBC.w $15E4				;$B3D0E6
	CMP.w #$8000				;$B3D0E9
	ROR					;$B3D0EC
	CLC					;$B3D0ED
	ADC.w PPU.multiply_result_mid		;$B3D0EE
	CLC					;$B3D0F1
	ADC.w $15E4				;$B3D0F2
	XBA					;$B3D0F5
	STA.b $1E				;$B3D0F6
	LDX.w #$0054				;$B3D0F8
	CLC					;$B3D0FB
CODE_B3D0FC:
	ADC.b $1A				;$B3D0FC
	STA.l $7EA319,x				;$B3D0FE
	DEX					;$B3D102
	BPL.b CODE_B3D0FC			;$B3D103
	LDA.b $1C				;$B3D105
	CLC					;$B3D107
	ADC.w #$000E				;$B3D108
	STA.b $1A				;$B3D10B
	LDA.b $1E				;$B3D10D
	LDX.w #$0054				;$B3D10F
	CLC					;$B3D112
CODE_B3D113:
	ADC.b $1A				;$B3D113
	STA.l $7EA3B9,x				;$B3D115
	DEX					;$B3D119
	BPL.b CODE_B3D113			;$B3D11A
	LDA.b $1C				;$B3D11C
	SEC					;$B3D11E
	SBC.w #$0005				;$B3D11F
	STA.b $1A				;$B3D122
	LDA.w $15E6				;$B3D124
	CLC					;$B3D127
	ADC.w #$0007				;$B3D128
	XBA					;$B3D12B
	LDX.w #$0098				;$B3D12C
	CLC					;$B3D12F
CODE_B3D130:
	ADC.b $1A				;$B3D130
	STA.l $7EA279,x				;$B3D132
	DEX					;$B3D136
	BPL.b CODE_B3D130			;$B3D137
CODE_B3D139:
	LDA.w $15E6				;$B3D139
	SEC					;$B3D13C
	SBC.w #$0008				;$B3D13D
	STA.l $7EA1CC				;$B3D140
	INC					;$B3D144
	STA.l $7EA1CD				;$B3D145
	INC					;$B3D149
	INC					;$B3D14A
	STA.l $7EA1CE				;$B3D14B
	INC					;$B3D14F
	INC					;$B3D150
	INC					;$B3D151
	STA.l $7EA1CF				;$B3D152
	LDA.w $15E6				;$B3D156
	CLC					;$B3D159
	ADC.w #$0006				;$B3D15A
	STA.l $7EA1D2				;$B3D15D
	DEC					;$B3D161
	STA.l $7EA1D3				;$B3D162
	DEC					;$B3D166
	DEC					;$B3D167
	STA.l $7EA1D4				;$B3D168
	DEC					;$B3D16C
	DEC					;$B3D16D
	DEC					;$B3D16E
	STA.l $7EA1D5				;$B3D16F
	RTS					;$B3D173

CODE_B3D174:
	JSL.l CODE_808015			;$B3D174
	BNE.b CODE_B3D1A1			;$B3D178
	JSL.l CODE_BB8582			;$B3D17A
	JSL.l CODE_B7B009			;$B3D17E
	JSL.l sprite_handler			;$B3D182
	JSL.l CODE_B3D23C			;$B3D186
	JSL.l CODE_B7C2A3			;$B3D18A
	JSR.w CODE_B3B58A			;$B3D18E
	JSL.l CODE_B78000			;$B3D191
	JSL.l CODE_808012			;$B3D195
	JSL.l CODE_808021			;$B3D199
	JML.l CODE_808006			;$B3D19D

CODE_B3D1A1:
	JMP.w CODE_B3A694			;$B3D1A1

CODE_B3D1A4:
	JSL.l CODE_808015			;$B3D1A4
	BNE.b CODE_B3D1D1			;$B3D1A8
	JSL.l CODE_BB8582			;$B3D1AA
	JSL.l CODE_B7B009			;$B3D1AE
	JSL.l sprite_handler			;$B3D1B2
	JSR.w CODE_B3D305			;$B3D1B6
	JSL.l CODE_B7C726			;$B3D1B9
	JSL.l CODE_B78000			;$B3D1BD
	JSL.l CODE_BB85BB			;$B3D1C1
	JSL.l CODE_808012			;$B3D1C5
	JSL.l CODE_808021			;$B3D1C9
	JML.l CODE_808006			;$B3D1CD

CODE_B3D1D1:
	JMP.w CODE_B3A694			;$B3D1D1

CODE_B3D1D4:
	LDA.w $1B6F				;$B3D1D4
	BEQ.b CODE_B3D1E1			;$B3D1D7
	DEC.w $1B6F				;$B3D1D9
	BNE.b CODE_B3D1E1			;$B3D1DC
	STZ.w $15E6				;$B3D1DE
CODE_B3D1E1:
	LDA.w $15E6				;$B3D1E1
	BEQ.b CODE_B3D204			;$B3D1E4
	LDA.w $15E4				;$B3D1E6
	CMP.w #$001F				;$B3D1E9
	BEQ.b CODE_B3D220			;$B3D1EC
	DEC.w $15E8				;$B3D1EE
	LDA.w $15E8				;$B3D1F1
	CMP.w #$0001				;$B3D1F4
	BCC.b CODE_B3D220			;$B3D1F7
	LDA.w #$0001				;$B3D1F9
	STA.w $15E8				;$B3D1FC
	INC.w $15E4				;$B3D1FF
	BRA.b CODE_B3D21D			;$B3D202

CODE_B3D204:
	DEC.w $15E8				;$B3D204
	LDA.w $15E8				;$B3D207
	CMP.w #$0008				;$B3D20A
	BCC.b CODE_B3D220			;$B3D20D
	LDA.w #$0008				;$B3D20F
	STA.w $15E8				;$B3D212
	LDA.w $15E4				;$B3D215
	BEQ.b CODE_B3D220			;$B3D218
	DEC.w $15E4				;$B3D21A
CODE_B3D21D:
	INC.w $15E2				;$B3D21D
CODE_B3D220:
	LDA.w $196D				;$B3D220
	SEC					;$B3D223
	SBC.w $1B77				;$B3D224
	STA.b $88				;$B3D227
	LDA.w $1975				;$B3D229
	SEC					;$B3D22C
	SBC.w $1B79				;$B3D22D
	STA.b $8A				;$B3D230
	LDA.b active_frame_counter		;$B3D232
	ASL					;$B3D234
	XBA					;$B3D235
	AND.w #$0200				;$B3D236
	STA.b $26				;$B3D239
	RTS					;$B3D23B

CODE_B3D23C:
	LDA.w $1B77				;$B3D23C
	SEC					;$B3D23F
	SBC.w #$0100				;$B3D240
	STA.b $88				;$B3D243
	LDA.w $1B79				;$B3D245
	SEC					;$B3D248
	SBC.w #$0100				;$B3D249
	STA.b $8A				;$B3D24C
	LDA.b active_frame_counter		;$B3D24E
	ASL					;$B3D250
	XBA					;$B3D251
	AND.w #$0200				;$B3D252
	STA.b $26				;$B3D255
CODE_B3D257:
	LDX.b $26				;$B3D257
	LDA.w #$0000				;$B3D259
	SEC					;$B3D25C
	SBC.b $88				;$B3D25D
	BPL.b CODE_B3D264			;$B3D25F
	LDA.w #$0000				;$B3D261
CODE_B3D264:
	CMP.w #$00FF				;$B3D264
	BCS.b CODE_B3D284			;$B3D267
	STA.b $1A				;$B3D269
	LDA.w #$0100				;$B3D26B
	SEC					;$B3D26E
	SBC.b $88				;$B3D26F
	BMI.b CODE_B3D284			;$B3D271
	CMP.w #$00FF				;$B3D273
	BCC.b CODE_B3D27B			;$B3D276
	LDA.w #$00FF				;$B3D278
CODE_B3D27B:
	SEP.b #$20				;$B3D27B
	XBA					;$B3D27D
	LDA.b $1A				;$B3D27E
	REP.b #$20				;$B3D280
	BRA.b CODE_B3D287			;$B3D282

CODE_B3D284:
	LDA.w #$00FF				;$B3D284
CODE_B3D287:
	STA.b $1A				;$B3D287
	LDA.w #$FFE0				;$B3D289
	SEC					;$B3D28C
	SBC.b $8A				;$B3D28D
	BPL.b CODE_B3D2D1			;$B3D28F
	CLC					;$B3D291
	ADC.w #$00E0				;$B3D292
	BPL.b CODE_B3D29C			;$B3D295
	LDA.w #$00E0				;$B3D297
	BRA.b CODE_B3D2D1			;$B3D29A

CODE_B3D29C:
	CMP.w #$00E0				;$B3D29C
	BCC.b CODE_B3D2A4			;$B3D29F
	LDA.w #$00E0				;$B3D2A1
CODE_B3D2A4:
	LSR					;$B3D2A4
	INC					;$B3D2A5
	SEP.b #$20				;$B3D2A6
	STA.l $7EA17A,x				;$B3D2A8
	STA.l $7EA17D,x				;$B3D2AC
	LDA.b #$01				;$B3D2B0
	STA.l $7EA180,x				;$B3D2B2
	LDA.b #$00				;$B3D2B6
	STA.l $7EA183,x				;$B3D2B8
	REP.b #$20				;$B3D2BC
	LDA.w #$00FF				;$B3D2BE
	STA.l $7EA181,x				;$B3D2C1
	LDA.b $1A				;$B3D2C5
	STA.l $7EA17B,x				;$B3D2C7
	STA.l $7EA17E,x				;$B3D2CB
	BRA.b CODE_B3D304			;$B3D2CF

CODE_B3D2D1:
	CMP.w #$00E0				;$B3D2D1
	BCC.b CODE_B3D2D9			;$B3D2D4
	LDA.w #$00E0				;$B3D2D6
CODE_B3D2D9:
	LSR					;$B3D2D9
	INC					;$B3D2DA
	SEP.b #$20				;$B3D2DB
	STA.l $7EA17A,x				;$B3D2DD
	STA.l $7EA17D,x				;$B3D2E1
	LDA.b #$01				;$B3D2E5
	STA.l $7EA180,x				;$B3D2E7
	LDA.b #$00				;$B3D2EB
	STA.l $7EA183,x				;$B3D2ED
	REP.b #$20				;$B3D2F1
	LDA.b $1A				;$B3D2F3
	STA.l $7EA181,x				;$B3D2F5
	LDA.w #$00FF				;$B3D2F9
	STA.l $7EA17B,x				;$B3D2FC
	STA.l $7EA17E,x				;$B3D300
CODE_B3D304:
	RTS					;$B3D304

CODE_B3D305:
	LDA.w $1B79				;$B3D305
	STA.b $8A				;$B3D308
	LDA.w $1B77				;$B3D30A
	STA.b $88				;$B3D30D
	LDA.w $1B87				;$B3D30F
	STA.b $5C				;$B3D312
	LDA.w $1BA1				;$B3D314
	STA.b $22				;$B3D317
	LDA.w $1BA5				;$B3D319
	STA.b $24				;$B3D31C
	LDA.w $15E4				;$B3D31E
	BEQ.b CODE_B3D331			;$B3D321
	LDA.b $8A				;$B3D323
	CLC					;$B3D325
	ADC.b $5C				;$B3D326
	STA.b $8A				;$B3D328
	LDA.b $88				;$B3D32A
	SEC					;$B3D32C
	SBC.b $24				;$B3D32D
	STA.b $88				;$B3D32F
CODE_B3D331:
	LDA.b active_frame_counter		;$B3D331
	ASL					;$B3D333
	XBA					;$B3D334
	AND.w #$0200				;$B3D335
	STA.b $26				;$B3D338
	TAX					;$B3D33A
	LDA.w #$0047				;$B3D33B
	SEC					;$B3D33E
	SBC.b $8A				;$B3D33F
	CMP.w #$0001				;$B3D341
	BEQ.b CODE_B3D34A			;$B3D344
	BPL.b CODE_B3D364			;$B3D346
	BRA.b CODE_B3D392			;$B3D348

CODE_B3D34A:
	SEP.b #$20				;$B3D34A
	STA.l $7EA15A,x				;$B3D34C
	REP.b #$20				;$B3D350
	LDA.w #$A1DA				;$B3D352
	CLC					;$B3D355
	ADC.b $26				;$B3D356
	STA.l $7EA15B,x				;$B3D358
	INX					;$B3D35C
	INX					;$B3D35D
	INX					;$B3D35E
	LDA.w #$0000				;$B3D35F
	BRA.b CODE_B3D392			;$B3D362

CODE_B3D364:
	CMP.w #$00E0				;$B3D364
	BCC.b CODE_B3D36C			;$B3D367
	LDA.w #$00E0				;$B3D369
CODE_B3D36C:
	SEP.b #$20				;$B3D36C
	LSR					;$B3D36E
	STA.l $7EA15A,x				;$B3D36F
	ADC.b #$00				;$B3D373
	STA.l $7EA15D,x				;$B3D375
	REP.b #$20				;$B3D379
	LDA.w #$A1DA				;$B3D37B
	CLC					;$B3D37E
	ADC.b $26				;$B3D37F
	STA.l $7EA15B,x				;$B3D381
	STA.l $7EA15E,x				;$B3D385
	TXA					;$B3D389
	CLC					;$B3D38A
	ADC.w #$0006				;$B3D38B
	TAX					;$B3D38E
	LDA.w #$0000				;$B3D38F
CODE_B3D392:
	STA.b $1C				;$B3D392
	CLC					;$B3D394
	ADC.b $5C				;$B3D395
	BEQ.b CODE_B3D3BE			;$B3D397
	BMI.b CODE_B3D3BE			;$B3D399
	SEP.b #$20				;$B3D39B
	ORA.b #$80				;$B3D39D
	STA.l $7EA15A,x				;$B3D39F
	REP.b #$20				;$B3D3A3
	LDA.w #$A1DA				;$B3D3A5
	CLC					;$B3D3A8
	ADC.b $26				;$B3D3A9
	SEC					;$B3D3AB
	SBC.b $1C				;$B3D3AC
	SEC					;$B3D3AE
	SBC.b $1C				;$B3D3AF
	SEC					;$B3D3B1
	SBC.b $1C				;$B3D3B2
	SEC					;$B3D3B4
	SBC.b $1C				;$B3D3B5
	STA.l $7EA15B,x				;$B3D3B7
	INX					;$B3D3BB
	INX					;$B3D3BC
	INX					;$B3D3BD
CODE_B3D3BE:
	SEP.b #$20				;$B3D3BE
	LDA.b #$01				;$B3D3C0
	STA.l $7EA15A,x				;$B3D3C2
	LDA.b #$00				;$B3D3C6
	STA.l $7EA15D,x				;$B3D3C8
	REP.b #$20				;$B3D3CC
	LDA.w #$A2DA				;$B3D3CE
	CLC					;$B3D3D1
	ADC.b $26				;$B3D3D2
	STA.l $7EA15B,x				;$B3D3D4
	LDA.w #$0036				;$B3D3D8
	SEC					;$B3D3DB
	SBC.b $5C				;$B3D3DC
	XBA					;$B3D3DE
	STA.w CPU.dividen_low			;$B3D3DF
	SEP.b #$20				;$B3D3E2
	LDA.b $5C				;$B3D3E4
	STA.w CPU.divisor			;$B3D3E6
	REP.b #$20				;$B3D3E9
	LDA.b $5C				;$B3D3EB
	BNE.b CODE_B3D3F0			;$B3D3ED
	INC					;$B3D3EF
CODE_B3D3F0:
	ASL					;$B3D3F0
	ASL					;$B3D3F1
	CLC					;$B3D3F2
	ADC.b $26				;$B3D3F3
	STA.b $28				;$B3D3F5
	LDX.b $26				;$B3D3F7
	LDA.w CPU.divide_result			;$B3D3F9
	STA.b $1C				;$B3D3FC
	LDA.b $89				;$B3D3FE
CODE_B3D400:
	STA.l $7EA1DB,x				;$B3D400
	CLC					;$B3D404
	ADC.b $1C				;$B3D405
	INX					;$B3D407
	INX					;$B3D408
	INX					;$B3D409
	INX					;$B3D40A
	CPX.b $28				;$B3D40B
	BNE.b CODE_B3D400			;$B3D40D
	LDX.b $26				;$B3D40F
	LDA.w #$0036				;$B3D411
	SEC					;$B3D414
	SBC.b $5C				;$B3D415
	CLC					;$B3D417
	ADC.b $8A				;$B3D418
	STA.l $7EA2DC,x				;$B3D41A
	JSR.w CODE_B3D257			;$B3D41E
	LDA.b $22				;$B3D421
	BPL.b CODE_B3D444			;$B3D423
	EOR.w #$FFFF				;$B3D425
	INC					;$B3D428
	STA.w CPU.dividen_low			;$B3D429
	SEP.b #$20				;$B3D42C
	LDA.b $5C				;$B3D42E
	STA.w CPU.divisor			;$B3D430
	REP.b #$20				;$B3D433
	NOP #6					;$B3D435
	LDA.w CPU.divide_result			;$B3D43B
	EOR.w #$FFFF				;$B3D43E
	INC					;$B3D441
	BRA.b CODE_B3D459			;$B3D442

CODE_B3D444:
	STA.w CPU.dividen_low			;$B3D444
	SEP.b #$20				;$B3D447
	LDA.b $5C				;$B3D449
	STA.w CPU.divisor			;$B3D44B
	REP.b #$20				;$B3D44E
	NOP #6					;$B3D450
	LDA.w CPU.divide_result			;$B3D456
CODE_B3D459:
	STA.b $1A				;$B3D459
	LDX.b $26				;$B3D45B
	LDA.b $87				;$B3D45D
	AND.w #$FF00				;$B3D45F
CODE_B3D462:
	STA.l $7EA1D9,x				;$B3D462
	CLC					;$B3D466
	ADC.b $1A				;$B3D467
	INX					;$B3D469
	INX					;$B3D46A
	INX					;$B3D46B
	INX					;$B3D46C
	CPX.b $28				;$B3D46D
	BNE.b CODE_B3D462			;$B3D46F
	LDA.b $24				;$B3D471
	CLC					;$B3D473
	ADC.b $88				;$B3D474
	LDX.b $26				;$B3D476
	STA.l $7EA2DA,x				;$B3D478
	LDA.w $15E6				;$B3D47C
	SEP.b #$20				;$B3D47F
	STA.w PPU.fixed_point_mul_B		;$B3D481
	REP.b #$20				;$B3D484
	ASL					;$B3D486
	ASL					;$B3D487
	ASL					;$B3D488
	ASL					;$B3D489
	AND.w #$01FF				;$B3D48A
	TAX					;$B3D48D
	LDA.l DATA_B9F278,x			;$B3D48E
	LDX.w $15E2				;$B3D492
	BEQ.b CODE_B3D49B			;$B3D495
	EOR.w #$FFFF				;$B3D497
	INC					;$B3D49A
CODE_B3D49B:
	SEP.b #$20				;$B3D49B
	STA.w PPU.fixed_point_mul_A		;$B3D49D
	XBA					;$B3D4A0
	STA.w PPU.fixed_point_mul_A		;$B3D4A1
	REP.b #$20				;$B3D4A4
	LDA.w PPU.multiply_result_mid		;$B3D4A6
	ASL					;$B3D4A9
	SEP.b #$20				;$B3D4AA
	STA.w PPU.fixed_point_mul_A		;$B3D4AC
	XBA					;$B3D4AF
	STA.w PPU.fixed_point_mul_A		;$B3D4B0
	REP.b #$20				;$B3D4B3
	LDA.b $26				;$B3D4B5
	BEQ.b CODE_B3D4DE			;$B3D4B7
	LDX.w #$0000				;$B3D4B9
CODE_B3D4BC:
	SEP.b #$20				;$B3D4BC
	LDA.l DATA_B3D502,x			;$B3D4BE
	STA.w PPU.fixed_point_mul_B		;$B3D4C2
	REP.b #$20				;$B3D4C5
	LDA.w PPU.multiply_result_mid		;$B3D4C7
	CLC					;$B3D4CA
	ADC.l $7EA3DE,x				;$B3D4CB
	STA.l $7EA3DE,x				;$B3D4CF
	INX					;$B3D4D3
	INX					;$B3D4D4
	INX					;$B3D4D5
	INX					;$B3D4D6
	CPX.w #$0050				;$B3D4D7
	BNE.b CODE_B3D4BC			;$B3D4DA
	BRA.b CODE_B3D501			;$B3D4DC

CODE_B3D4DE:
	LDX.w #$0000				;$B3D4DE
CODE_B3D4E1:
	SEP.b #$20				;$B3D4E1
	LDA.l DATA_B3D502,x			;$B3D4E3
	STA.w PPU.fixed_point_mul_B		;$B3D4E7
	REP.b #$20				;$B3D4EA
	LDA.w PPU.multiply_result_mid		;$B3D4EC
	CLC					;$B3D4EF
	ADC.l $7EA1DE,x				;$B3D4F0
	STA.l $7EA1DE,x				;$B3D4F4
	INX					;$B3D4F8
	INX					;$B3D4F9
	INX					;$B3D4FA
	INX					;$B3D4FB
	CPX.w #$0050				;$B3D4FC
	BNE.b CODE_B3D4E1			;$B3D4FF
CODE_B3D501:
	RTS					;$B3D501

DATA_B3D502:
	dw $0001,$0000,$0002,$0000,$0003,$0000,$0005,$0000
	dw $0008,$0000,$000B,$0000,$000E,$0000,$0011,$0000
	dw $0013,$0000,$0014,$0000,$0014,$0000,$0013,$0000
	dw $0011,$0000,$000E,$0000,$000B,$0000,$0008,$0000
	dw $0005,$0000,$0003,$0000,$0002,$0000,$0001,$0000

CODE_B3D552:
	LDA.w $05AF				;$B3D552
	BIT.w #$0040				;$B3D555
	BNE.b CODE_B3D56E			;$B3D558
	JSL.l sprite_handler			;$B3D55A
	JSL.l CODE_B78000			;$B3D55E
	JSL.l CODE_808012			;$B3D562
	JSL.l CODE_808021			;$B3D566
	JML.l CODE_808006			;$B3D56A

CODE_B3D56E:
	JMP.w CODE_B3A694			;$B3D56E

CODE_B3D571:
	JSL.l CODE_808015			;$B3D571
	JSR.w CODE_B3A8E4			;$B3D575
	JSL.l CODE_B7B009			;$B3D578
	JSL.l sprite_handler			;$B3D57C
	JSL.l CODE_B7800C			;$B3D580
	JSL.l CODE_B7800F			;$B3D584
	JSL.l CODE_808012			;$B3D588
	JSL.l CODE_808021			;$B3D58C
	LDA.w screen_brightness			;$B3D590
	BNE.b CODE_B3D59A			;$B3D593
	CMP.w screen_fade_speed			;$B3D595
	BEQ.b CODE_B3D59E			;$B3D598
CODE_B3D59A:
	JML.l CODE_808006			;$B3D59A

CODE_B3D59E:
	JSL.l CODE_80805D			;$B3D59E
	STZ.b $BA				;$B3D5A2
	LDA.w #CODE_80805A			;$B3D5A4
	LDX.w #CODE_80805A>>16			;$B3D5A7
	JML.l CODE_808003			;$B3D5AA

CODE_B3D5AE:
	JMP.w CODE_B3A694			;$B3D5AE

CODE_B3D5B1:
	JSL.l CODE_808015			;$B3D5B1
	BNE.b CODE_B3D5D9			;$B3D5B5
	JSL.l CODE_B7B009			;$B3D5B7
	JSL.l sprite_handler			;$B3D5BB
	JSL.l CODE_B7800C			;$B3D5BF
	JSL.l CODE_B7801E			;$B3D5C3
	JSL.l CODE_808012			;$B3D5C7
	JSR.w CODE_B3D5DC			;$B3D5CB
	JSR.w CODE_B3D75B			;$B3D5CE
	JSL.l CODE_808021			;$B3D5D1
	JML.l CODE_808006			;$B3D5D5

CODE_B3D5D9:
	JMP.w CODE_B3A694			;$B3D5D9

CODE_B3D5DC:
	LDA.l $7EA254				;$B3D5DC
	CMP.l $7EA252				;$B3D5E0
	BEQ.b CODE_B3D5F6			;$B3D5E4
	BCS.b CODE_B3D5EC			;$B3D5E6
	CLC					;$B3D5E8
	ADC.w #$0008				;$B3D5E9
CODE_B3D5EC:
	SEC					;$B3D5EC
	SBC.w #$0004				;$B3D5ED
	STA.l $7EA254				;$B3D5F0
	BRA.b CODE_B3D625			;$B3D5F4

CODE_B3D5F6:
	LDA.l $7EA256				;$B3D5F6
	DEC					;$B3D5FA
	BNE.b CODE_B3D606			;$B3D5FB
	JSL.l CODE_808018			;$B3D5FD
	AND.w #$0004				;$B3D601
	BRA.b CODE_B3D61D			;$B3D604

CODE_B3D606:
	DEC					;$B3D606
	BNE.b CODE_B3D616			;$B3D607
	JSL.l CODE_808018			;$B3D609
	AND.w #$0004				;$B3D60D
	CLC					;$B3D610
	ADC.w #$001C				;$B3D611
	BRA.b CODE_B3D61D			;$B3D614

CODE_B3D616:
	JSL.l CODE_808018			;$B3D616
	AND.w #$001C				;$B3D61A
CODE_B3D61D:
	CLC					;$B3D61D
	ADC.w #$0070				;$B3D61E
	STA.l $7EA252				;$B3D621
CODE_B3D625:
	LDA.l $7EA214				;$B3D625
	BEQ.b CODE_B3D680			;$B3D629
	AND.w #$0002				;$B3D62B
	BEQ.b CODE_B3D633			;$B3D62E
	LDA.w #$0018				;$B3D630
CODE_B3D633:
	CLC					;$B3D633
	ADC.w #DATA_B3D72B			;$B3D634
	STA.b $1A				;$B3D637
	LDA.w #DATA_B3D72B>>16			;$B3D639
	STA.b $1C				;$B3D63C
	LDA.w #$0006				;$B3D63E
	STA.b $1D				;$B3D641
	LDA.w #$749D				;$B3D643
	JSL.l CODE_B78012			;$B3D646
	LDA.b $1A				;$B3D64A
	CLC					;$B3D64C
	ADC.w #$0006				;$B3D64D
	STA.b $1A				;$B3D650
	LDA.w #$74BD				;$B3D652
	JSL.l CODE_B78012			;$B3D655
	LDA.b $1A				;$B3D659
	CLC					;$B3D65B
	ADC.w #$0006				;$B3D65C
	STA.b $1A				;$B3D65F
	LDA.w #$7080				;$B3D661
	JSL.l CODE_B78012			;$B3D664
	LDA.b $1A				;$B3D668
	CLC					;$B3D66A
	ADC.w #$0006				;$B3D66B
	STA.b $1A				;$B3D66E
	LDA.w #$70A0				;$B3D670
	JSL.l CODE_B78012			;$B3D673
	BCS.b CODE_B3D680			;$B3D677
	LDA.w #$0000				;$B3D679
	STA.l $7EA214				;$B3D67C
CODE_B3D680:
	LDA.l $7EA210				;$B3D680
	DEC					;$B3D684
	BPL.b CODE_B3D6B7			;$B3D685
	LDA.l $7EA20C				;$B3D687
	BPL.b CODE_B3D69A			;$B3D68B
	JSL.l CODE_808018			;$B3D68D
	AND.w #$003F				;$B3D691
	CLC					;$B3D694
	ADC.w #$0020				;$B3D695
	BRA.b CODE_B3D6A8			;$B3D698

CODE_B3D69A:
	JSL.l CODE_808018			;$B3D69A
	AND.w #$003F				;$B3D69E
	CLC					;$B3D6A1
	ADC.w #$0020				;$B3D6A2
	EOR.w #$FFFF				;$B3D6A5
CODE_B3D6A8:
	STA.l $7EA20E				;$B3D6A8
	JSL.l CODE_808018			;$B3D6AC
	AND.w #$007F				;$B3D6B0
	CLC					;$B3D6B3
	ADC.w #$0030				;$B3D6B4
CODE_B3D6B7:
	STA.l $7EA210				;$B3D6B7
	LDA.l $7EA20C				;$B3D6BB
	CMP.l $7EA20E				;$B3D6BF
	BEQ.b CODE_B3D6D3			;$B3D6C3
	BMI.b CODE_B3D6CB			;$B3D6C5
	SEC					;$B3D6C7
	SBC.w #$0002				;$B3D6C8
CODE_B3D6CB:
	CLC					;$B3D6CB
	ADC.w #$0001				;$B3D6CC
	STA.l $7EA20C				;$B3D6CF
CODE_B3D6D3:
	CLC					;$B3D6D3
	ADC.l $7EA20A				;$B3D6D4
	BPL.b CODE_B3D6DE			;$B3D6D8
	CLC					;$B3D6DA
	ADC.w #$0300				;$B3D6DB
CODE_B3D6DE:
	CMP.w #$0300				;$B3D6DE
	BCC.b CODE_B3D6E6			;$B3D6E1
	SBC.w #$0300				;$B3D6E3
CODE_B3D6E6:
	STA.l $7EA20A				;$B3D6E6
	AND.w #$0300				;$B3D6EA
	CMP.l $7EA212				;$B3D6ED
	BEQ.b CODE_B3D724			;$B3D6F1
	STA.l $7EA212				;$B3D6F3
	AND.w #$FF00				;$B3D6F7
	BNE.b CODE_B3D703			;$B3D6FA
	LDA.w #$0468				;$B3D6FC
	JSL.l queue_sound_effect		;$B3D6FF
CODE_B3D703:
	LDA.l $7EA212				;$B3D703
	XBA					;$B3D707
	ASL					;$B3D708
	AND.w #$0006				;$B3D709
	TAX					;$B3D70C
	LDA.l DATA_B3D725,x			;$B3D70D
	STA.b $1A				;$B3D711
	LDA.w #DATA_EC76CC>>16			;$B3D713
	STA.b $1C				;$B3D716
	LDA.w #$0200				;$B3D718
	STA.b $1D				;$B3D71B
	LDA.w #$2000				;$B3D71D
	JSL.l CODE_B78012			;$B3D720
CODE_B3D724:
	RTS					;$B3D724

DATA_B3D725:
	dw DATA_EC76CC
	dw DATA_EC76CC+$0200
	dw DATA_EC76CC+$0400

DATA_B3D72B:
	dw $2810,$2811,$2812,$3C13,$3C14,$3C15,$6812,$6811
	dw $6810,$7C15,$7C14,$7C13,$0810,$0811,$0812,$1C13
	dw $1C14,$1C15,$4812,$4811,$4810,$5C15,$5C14,$5C13

CODE_B3D75B:
	LDA.w $15E4				;$B3D75B
	CLC					;$B3D75E
	ADC.w $15E2				;$B3D75F
	BPL.b CODE_B3D768			;$B3D762
	CLC					;$B3D764
	ADC.w #$2B00				;$B3D765
CODE_B3D768:
	CMP.w #$2B00				;$B3D768
	BCC.b CODE_B3D770			;$B3D76B
	SBC.w #$2B00				;$B3D76D
CODE_B3D770:
	STA.w $15E4				;$B3D770
	LDA.w $15E2				;$B3D773
	CMP.w $15E8				;$B3D776
	BEQ.b CODE_B3D788			;$B3D779
	BMI.b CODE_B3D781			;$B3D77B
	SEC					;$B3D77D
	SBC.w #$0020				;$B3D77E
CODE_B3D781:
	CLC					;$B3D781
	ADC.w #$0010				;$B3D782
	STA.w $15E2				;$B3D785
CODE_B3D788:
	EOR.w #$FFFF				;$B3D788
	INC					;$B3D78B
	STA.w $0507				;$B3D78C
	LDA.w $15E4				;$B3D78F
	XBA					;$B3D792
	AND.w #$00FF				;$B3D793
	CLC					;$B3D796
	ADC.w $196D				;$B3D797
	STA.w CPU.dividen_low			;$B3D79A
	SEP.b #$20				;$B3D79D
	LDA.b #$2B				;$B3D79F
	STA.w CPU.divisor			;$B3D7A1
	REP.b #$20				;$B3D7A4
	NOP #8					;$B3D7A6
	LDA.w CPU.divide_remainder		;$B3D7AE
	SEC					;$B3D7B1
	SBC.w #$0016				;$B3D7B2
	STA.b $1E				;$B3D7B5
	CLC					;$B3D7B7
	ADC.w #$0180				;$B3D7B8
	SEC					;$B3D7BB
	SBC.w $196D				;$B3D7BC
	STA.b $1A				;$B3D7BF
	ASL					;$B3D7C1
	STA.b $1C				;$B3D7C2
	ASL					;$B3D7C4
	CLC					;$B3D7C5
	ADC.b $1C				;$B3D7C6
	CLC					;$B3D7C8
	ADC.b $1A				;$B3D7C9
	JSR.w CODE_B3D80F			;$B3D7CB
	JSR.w CODE_B3D80F			;$B3D7CE
	EOR.w #$FFFF				;$B3D7D1
	AND.w #$FFFE				;$B3D7D4
	STA.b $1A				;$B3D7D7
	LDX.w #$0030				;$B3D7D9
	LDA.b active_frame_counter		;$B3D7DC
	BIT.w #$0001				;$B3D7DE
	BEQ.b CODE_B3D7F9			;$B3D7E1
	LDA.b $1E				;$B3D7E3
	CLC					;$B3D7E5
	ADC.w #$0080				;$B3D7E6
	XBA					;$B3D7E9
	SEC					;$B3D7EA
	SBC.b $1A				;$B3D7EB
CODE_B3D7ED:
	CLC					;$B3D7ED
	ADC.b $1A				;$B3D7EE
	STA.l $7EA16C,x				;$B3D7F0
	DEX					;$B3D7F4
	DEX					;$B3D7F5
	BPL.b CODE_B3D7ED			;$B3D7F6
	RTS					;$B3D7F8

CODE_B3D7F9:
	LDA.b $1E				;$B3D7F9
	CLC					;$B3D7FB
	ADC.w #$0080				;$B3D7FC
	XBA					;$B3D7FF
	SEC					;$B3D800
	SBC.b $1A				;$B3D801
CODE_B3D803:
	CLC					;$B3D803
	ADC.b $1A				;$B3D804
	STA.l $7EA1AC,x				;$B3D806
	DEX					;$B3D80A
	DEX					;$B3D80B
	BPL.b CODE_B3D803			;$B3D80C
	RTS					;$B3D80E

CODE_B3D80F:
	CMP.w #$0000				;$B3D80F
	BPL.b CODE_B3D81E			;$B3D812
	EOR.w #$FFFF				;$B3D814
	INC					;$B3D817
	LSR					;$B3D818
	EOR.w #$FFFF				;$B3D819
	INC					;$B3D81C
	RTS					;$B3D81D

CODE_B3D81E:
	LSR					;$B3D81E
	RTS					;$B3D81F

CODE_B3D820:
	LDA.w $05AF				;$B3D820
	BIT.w #$0040				;$B3D823
	BNE.b CODE_B3D840			;$B3D826
	JSL.l sprite_handler			;$B3D828
	JSL.l CODE_B7B009			;$B3D82C
	JSL.l CODE_B78000			;$B3D830
	JSL.l CODE_808012			;$B3D834
	JSL.l CODE_808021			;$B3D838
	JML.l CODE_808006			;$B3D83C

CODE_B3D840:
	JMP.w CODE_B3A694			;$B3D840

CODE_B3D843:
	LDA.w #$1801				;$B3D843
	STA.w DMA[$00].settings			;$B3D846
	SEP.b #$10				;$B3D849
	LDY.b #$01				;$B3D84B
	LDX.b #$00				;$B3D84D
CODE_B3D84F:
	LDA.w $1568,x				;$B3D84F
	BPL.b CODE_B3D877			;$B3D852
	STA.w DMA[$00].source_bank		;$B3D854
	LDA.w $1562,x				;$B3D857
	STA.w DMA[$00].size			;$B3D85A
	LDA.w $1564,x				;$B3D85D
	STA.w PPU.vram_address			;$B3D860
	LDA.w $1566,x				;$B3D863
	STA.w DMA[$00].source_word		;$B3D866
	STZ.w $1568,x				;$B3D869
	STY.w CPU.enable_dma			;$B3D86C
	TXA					;$B3D86F
	CLC					;$B3D870
	ADC.w #$0008				;$B3D871
	TAX					;$B3D874
	BRA.b CODE_B3D84F			;$B3D875

CODE_B3D877:
	REP.b #$10				;$B3D877
	RTL					;$B3D879

CODE_B3D87A:
	STZ.w $0088				;$B3D87A
	STZ.w $008A				;$B3D87D
	LDA.w $0761				;$B3D880
	ASL					;$B3D883
	TAX					;$B3D884
	JSR.w (DATA_B38012,x)			;$B3D885
	LDA.w $075C				;$B3D888
	CMP.w #$0002				;$B3D88B
	BNE.b CODE_B3D8C2			;$B3D88E
	LDA.w $075E				;$B3D890
	AND.w #$00FF				;$B3D893
	CMP.w #$0003				;$B3D896
	BCC.b CODE_B3D8C2			;$B3D899
	BEQ.b CODE_B3D8AF			;$B3D89B
	CMP.w #$0004				;$B3D89D
	BNE.b CODE_B3D8C2			;$B3D8A0
	LDA.w $053B				;$B3D8A2
	AND.w #$0001				;$B3D8A5
	BEQ.b CODE_B3D8C2			;$B3D8A8
	LDY.w #$0015				;$B3D8AA
	BRA.b CODE_B3D8BD			;$B3D8AD

CODE_B3D8AF:
	LDY.w #$0008				;$B3D8AF
	LDA.w $053B				;$B3D8B2
	AND.w #$0001				;$B3D8B5
	BEQ.b CODE_B3D8BD			;$B3D8B8
	LDY.w #$0016				;$B3D8BA
CODE_B3D8BD:
	TYA					;$B3D8BD
	JSL.l vram_payload_handler_global	;$B3D8BE
CODE_B3D8C2:
	STZ.w $0470				;$B3D8C2
	LDA.w $0775				;$B3D8C5
	AND.w #$0001				;$B3D8C8
	BNE.b CODE_B3D909			;$B3D8CB
	LDA.w $1B5B				;$B3D8CD
	AND.w #$0080				;$B3D8D0
	BNE.b CODE_B3D8F2			;$B3D8D3
	LDA.b $8C				;$B3D8D5
	TAX					;$B3D8D7
	LDA.b $8E				;$B3D8D8
	AND.w #$00FF				;$B3D8DA
	TAY					;$B3D8DD
	LDA.w #$1000				;$B3D8DE
	JSL.l CODE_BB857C			;$B3D8E1
	LDA.w #$1000				;$B3D8E5
	STA.b $8C				;$B3D8E8
	SEP.b #$20				;$B3D8EA
	LDA.b #$7F				;$B3D8EC
	STA.b $8E				;$B3D8EE
	REP.b #$20				;$B3D8F0
CODE_B3D8F2:
	LDA.l $000088				;$B3D8F2
	JSR.w CODE_B3D90A			;$B3D8F6
	JSR.w CODE_B3D9EB			;$B3D8F9
	JSR.w CODE_B3DAD3			;$B3D8FC
	JSR.w CODE_B3D917			;$B3D8FF
	LDA.l $00008A				;$B3D902
	JSR.w CODE_B3D90A			;$B3D906
CODE_B3D909:
	RTL					;$B3D909

CODE_B3D90A:
	BEQ.b CODE_B3D916			;$B3D90A
	PHK					;$B3D90C
	PLB					;$B3D90D
	STA.b $42				;$B3D90E
	LDX.w #$0000				;$B3D910
	JSR.w ($0042,x)				;$B3D913
CODE_B3D916:
	RTS					;$B3D916

CODE_B3D917:
	LDA.w #$0000				;$B3D917
	STA.b $8C				;$B3D91A
	LDA.w #$007F				;$B3D91C
	EOR.b $8E				;$B3D91F
	AND.w #$00FF				;$B3D921
	EOR.b $8E				;$B3D924
	STA.b $8E				;$B3D926
	RTS					;$B3D928

CODE_B3D929:
	TXA					;$B3D929
	LDX.w #$F800				;$B3D92A
	LDY.w #$007F				;$B3D92D
	JSR.w CODE_B3D9F4			;$B3D930
	RTS					;$B3D933

CODE_B3D934:
	LDA.w #$7FF800				;$B3D934
	STA.b $8C				;$B3D937
	LDA.w #$7FF800>>16			;$B3D939
	STA.b $8E				;$B3D93C
	STZ.w $197B				;$B3D93E
	SEP.b #$20				;$B3D941
	LDA.b #$80				;$B3D943
	STA.b $8F				;$B3D945
	REP.b #$20				;$B3D947
	STZ.w $1985				;$B3D949
	STZ.w $1989				;$B3D94C
	STZ.w $196B				;$B3D94F
	STZ.w $196D				;$B3D952
	LDA.w #$00F8				;$B3D955
	STA.w $197D				;$B3D958
	STZ.w $1975				;$B3D95B
	STZ.w $1981				;$B3D95E
	LDA.w #$0008				;$B3D961
	STA.w $1989				;$B3D964
	LDA.w #$0040				;$B3D967
CODE_B3D96A:
	PHA					;$B3D96A
	JSR.w CODE_B3D984			;$B3D96B
	JSL.l CODE_B7B00F			;$B3D96E
	LDA.w #$0008				;$B3D972
	STA.w $1989				;$B3D975
	CLC					;$B3D978
	ADC.w $196D				;$B3D979
	STA.w $196D				;$B3D97C
	PLA					;$B3D97F
	DEC					;$B3D980
	BNE.b CODE_B3D96A			;$B3D981
	RTS					;$B3D983

CODE_B3D984:
	LDA.w $0470				;$B3D984
	AND.w #$000F				;$B3D987
	CMP.w #$0005				;$B3D98A
	BEQ.b CODE_B3D994			;$B3D98D
	JSL.l CODE_B7B015			;$B3D98F
	RTS					;$B3D993

CODE_B3D994:
	JSL.l CODE_B7B018			;$B3D994
	RTS					;$B3D998

CODE_B3D999:
	JSL.l CODE_B7B003			;$B3D999
	LDA.w $0763				;$B3D99D
	ASL					;$B3D9A0
	TAX					;$B3D9A1
	JSR.w (DATA_B38044,x)			;$B3D9A2
	STZ.w $155E				;$B3D9A5
	RTL					;$B3D9A8

CODE_B3D9A9:
	LDA.b $8C				;$B3D9A9
	STA.b $20				;$B3D9AB
	LDA.b $8E				;$B3D9AD
	AND.w #$00FF				;$B3D9AF
	STA.b $22				;$B3D9B2
	LDA.w $1B59				;$B3D9B4
	TAX					;$B3D9B7
	INX					;$B3D9B8
	INX					;$B3D9B9
	INX					;$B3D9BA
	INX					;$B3D9BB
	LDA.w $076F				;$B3D9BC
	ASL					;$B3D9BF
	STA.b $1A				;$B3D9C0
	ASL					;$B3D9C2
	ASL					;$B3D9C3
	CLC					;$B3D9C4
	ADC.b $1A				;$B3D9C5
	STX.b $1C				;$B3D9C7
	CLC					;$B3D9C9
	ADC.b $1C				;$B3D9CA
	TAX					;$B3D9CC
	LDA.l (DATA_B7B06F&$FF0000)+$08,x	;$B3D9CD
	ASL					;$B3D9D1
	ASL					;$B3D9D2
	TAX					;$B3D9D3
	LDA.l DATA_B3DB31,x			;$B3D9D4
	LSR					;$B3D9D8
	LSR					;$B3D9D9
	LSR					;$B3D9DA
	STA.l $0015FA				;$B3D9DB
	LDA.l DATA_B3DB31+$02,x			;$B3D9DF
	LSR					;$B3D9E3
	LSR					;$B3D9E4
	LSR					;$B3D9E5
	STA.l $0015FC				;$B3D9E6
	RTL					;$B3D9EA

CODE_B3D9EB:
	LDA.w $076F				;$B3D9EB
	LDX.w #$0000				;$B3D9EE
	LDY.w #$007F				;$B3D9F1
CODE_B3D9F4:
	PHA					;$B3D9F4
	TXA					;$B3D9F5
	STA.b $84				;$B3D9F6
	TYA					;$B3D9F8
	XBA					;$B3D9F9
	STA.b $86				;$B3D9FA
	LDA.b $8C				;$B3D9FC
	STA.b $20				;$B3D9FE
	LDA.b $8E				;$B3DA00
	AND.w #$00FF				;$B3DA02
	STA.b $22				;$B3DA05
	LDA.w $1B59				;$B3DA07
	TAX					;$B3DA0A
	LDA.l DATA_B7B06F&$FF0000,x		;$B3DA0B
	JSR.w CODE_B3DACD			;$B3DA0F
	STA.b $2E				;$B3DA12
	INX					;$B3DA14
	INX					;$B3DA15
	LDA.l DATA_B7B06F&$FF0000,x		;$B3DA16
	JSR.w CODE_B3DACD			;$B3DA1A
	STA.b $30				;$B3DA1D
	INX					;$B3DA1F
	INX					;$B3DA20
	PLA					;$B3DA21
	ASL					;$B3DA22
	STA.b $1A				;$B3DA23
	ASL					;$B3DA25
	ASL					;$B3DA26
	CLC					;$B3DA27
	ADC.b $1A				;$B3DA28
	STX.b $1C				;$B3DA2A
	CLC					;$B3DA2C
	ADC.b $1C				;$B3DA2D
	TAX					;$B3DA2F
	LDA.l DATA_B7B06F&$FF0000,x		;$B3DA30
	JSR.w CODE_B3DACD			;$B3DA34
	STA.b $3A				;$B3DA37
	LDA.l (DATA_B7B06F&$FF0000)+$04,x	;$B3DA39
	JSR.w CODE_B3DACD			;$B3DA3D
	STA.b $3C				;$B3DA40
	LDA.l (DATA_B7B06F&$FF0000)+$02,x	;$B3DA42
	SEC					;$B3DA46
	SBC.l DATA_B7B06F&$FF0000,x		;$B3DA47
	JSR.w CODE_B3DACD			;$B3DA4B
	STA.b $36				;$B3DA4E
	LDA.l (DATA_B7B06F&$FF0000)+$06,x	;$B3DA50
	SEC					;$B3DA54
	SBC.l (DATA_B7B06F&$FF0000)+$04,x	;$B3DA55
	JSR.w CODE_B3DACD			;$B3DA59
	STA.b $38				;$B3DA5C
	LDA.l (DATA_B7B06F&$FF0000)+$08,x	;$B3DA5E
	STA.w $0470				;$B3DA62
	ASL					;$B3DA65
	TAY					;$B3DA66
	ASL					;$B3DA67
	TAX					;$B3DA68
	LDA.l DATA_B3DB31,x			;$B3DA69
	STA.b $32				;$B3DA6D
	LDA.l DATA_B3DB31+$02,x			;$B3DA6F
	STA.b $34				;$B3DA73
	TYX					;$B3DA75
	JSR.w (DATA_B3DB59,x)			;$B3DA76
	LDA.b $1A				;$B3DA79
	CLC					;$B3DA7B
	ADC.b $20				;$B3DA7C
	STA.b $20				;$B3DA7E
	LDA.b $1C				;$B3DA80
	ADC.b $22				;$B3DA82
	STA.b $22				;$B3DA84
	PHB					;$B3DA86
	LDA.b $86				;$B3DA87
	PHA					;$B3DA89
	PLB					;$B3DA8A
	PLB					;$B3DA8B
	LDA.b $84				;$B3DA8C
	STA.b $24				;$B3DA8E
	TAX					;$B3DA90
	LDY.w #$0000				;$B3DA91
CODE_B3DA94:
	JSR.w CODE_B3DAA3			;$B3DA94
	JSR.w CODE_B3DAB6			;$B3DA97
	JSR.w CODE_B3DAC5			;$B3DA9A
	DEC.b $2C				;$B3DA9D
	BNE.b CODE_B3DA94			;$B3DA9F
	PLB					;$B3DAA1
	RTS					;$B3DAA2

CODE_B3DAA3:
	LDY.w #$0000				;$B3DAA3
	LDX.b $24				;$B3DAA6
CODE_B3DAA8:
	LDA.b [$20],y				;$B3DAA8
	STA.w $0000,x				;$B3DAAA
	INX					;$B3DAAD
	INX					;$B3DAAE
	INY					;$B3DAAF
	INY					;$B3DAB0
	CPY.b $2A				;$B3DAB1
	BNE.b CODE_B3DAA8			;$B3DAB3
	RTS					;$B3DAB5

CODE_B3DAB6:
	LDA.b $26				;$B3DAB6
	CLC					;$B3DAB8
	ADC.b $20				;$B3DAB9
	STA.b $20				;$B3DABB
	LDA.w #$0000				;$B3DABD
	ADC.b $22				;$B3DAC0
	STA.b $22				;$B3DAC2
	RTS					;$B3DAC4

CODE_B3DAC5:
	LDA.b $28				;$B3DAC5
	CLC					;$B3DAC7
	ADC.b $24				;$B3DAC8
	STA.b $24				;$B3DACA
	RTS					;$B3DACC

CODE_B3DACD:
	LSR					;$B3DACD
	LSR					;$B3DACE
	LSR					;$B3DACF
	LSR					;$B3DAD0
	LSR					;$B3DAD1
	RTS					;$B3DAD2

CODE_B3DAD3:
	PHB					;$B3DAD3
	%pea_mask_dbr(wram_base_high)		;$B3DAD4
	PLB					;$B3DAD7
	PLB					;$B3DAD8
	LDA.l $001967				;$B3DAD9
	STA.b $20				;$B3DADD
	LDA.l $00008F				;$B3DADF
	AND.w #$00FF				;$B3DAE3
	STA.b $22				;$B3DAE6
	SEP.b #$20				;$B3DAE8
	LDA.b #$80				;$B3DAEA
	STA.l $00008F				;$B3DAEC
	REP.b #$20				;$B3DAF0
	LDA.l $000024				;$B3DAF2
	TAX					;$B3DAF6
	STA.l $001967				;$B3DAF7
	LDA.l $001B5B				;$B3DAFB
	AND.w #$8000				;$B3DAFF
	BEQ.b CODE_B3DB17			;$B3DB02
	LDY.w #$0000				;$B3DB04
CODE_B3DB07:
	LDA.b [$20],y				;$B3DB07
	INY					;$B3DB09
	INY					;$B3DB0A
	STA.w $0000,x				;$B3DB0B
	INX					;$B3DB0E
	INX					;$B3DB0F
	CPX.w #$A000				;$B3DB10
	BNE.b CODE_B3DB07			;$B3DB13
CODE_B3DB15:
	PLB					;$B3DB15
	RTS					;$B3DB16

CODE_B3DB17:
	PHK					;$B3DB17
	PLB					;$B3DB18
	LDA.l $000020				;$B3DB19
	TAX					;$B3DB1D
	LDA.l $000022				;$B3DB1E
	TAY					;$B3DB22
	LDA.l $001967				;$B3DB23
	SEC					;$B3DB27
	SBC.w #$0000				;$B3DB28
	JSL.l CODE_BB857C			;$B3DB2B
	BRA.b CODE_B3DB15			;$B3DB2F

DATA_B3DB31:
	dw $0200,$0010,$0100,$0020,$0080,$0040,$0040,$0080
	dw $0020,$0100,$0010,$0200,$0060,$0050,$0050,$0060
	dw $0300,$0010,$0060,$0080

DATA_B3DB59:
	dw CODE_B3DB6D
	dw CODE_B3DB6D
	dw CODE_B3DB6D
	dw CODE_B3DB6D
	dw CODE_B3DB9A
	dw CODE_B3DB9A
	dw CODE_B3DB9A
	dw CODE_B3DB9A
	dw CODE_B3DB6D
	dw CODE_B3DB9A

CODE_B3DB6D:
	LDA.b $3A				;$B3DB6D
	LDX.b $30				;$B3DB6F
	JSR.w CODE_B3DBCB			;$B3DB71
	LDA.b $3C				;$B3DB74
	CLC					;$B3DB76
	ADC.b $1A				;$B3DB77
	STA.b $1A				;$B3DB79
	LDA.w #$0000				;$B3DB7B
	ADC.b $1C				;$B3DB7E
	STA.b $1C				;$B3DB80
	ASL.b $1A				;$B3DB82
	ROL.b $1C				;$B3DB84
	LDA.b $38				;$B3DB86
	ASL					;$B3DB88
	STA.b $2A				;$B3DB89
	LDA.b $36				;$B3DB8B
	STA.b $2C				;$B3DB8D
	LDA.b $30				;$B3DB8F
	ASL					;$B3DB91
	STA.b $26				;$B3DB92
	LDA.b $34				;$B3DB94
	ASL					;$B3DB96
	STA.b $28				;$B3DB97
	RTS					;$B3DB99

CODE_B3DB9A:
	LDA.b $3C				;$B3DB9A
	LDX.b $2E				;$B3DB9C
	JSR.w CODE_B3DBCB			;$B3DB9E
	LDA.b $3A				;$B3DBA1
	CLC					;$B3DBA3
	ADC.b $1A				;$B3DBA4
	STA.b $1A				;$B3DBA6
	LDA.w #$0000				;$B3DBA8
	ADC.b $1C				;$B3DBAB
	STA.b $1C				;$B3DBAD
	ASL.b $1A				;$B3DBAF
	ROL.b $1C				;$B3DBB1
	LDA.b $36				;$B3DBB3
	ASL					;$B3DBB5
	STA.b $2A				;$B3DBB6
	LDA.b $38				;$B3DBB8
	STA.b $2C				;$B3DBBA
	LDA.b $2E				;$B3DBBC
	ASL					;$B3DBBE
	STA.b $26				;$B3DBBF
	LDA.b $32				;$B3DBC1
	ASL					;$B3DBC3
	STA.b $28				;$B3DBC4
	RTS					;$B3DBC6

CODE_B3DBC7:
	JSR.w CODE_B3DBCB			;$B3DBC7
	RTL					;$B3DBCA

CODE_B3DBCB:
	STX.b $3E				;$B3DBCB
	STA.b $40				;$B3DBCD
	SEP.b #$20				;$B3DBCF
	LDA.b $3E				;$B3DBD1
	STA.w CPU.multiply_A			;$B3DBD3
	LDA.b $40				;$B3DBD6
	STA.w CPU.multiply_B			;$B3DBD8
	REP.b #$20				;$B3DBDB
	LDA.w CPU.multiply_result		;$B3DBDD
	LDA.w CPU.multiply_result		;$B3DBE0
	STA.b $1A				;$B3DBE3
	STZ.b $1C				;$B3DBE5
	SEP.b #$20				;$B3DBE7
	LDA.b $3F				;$B3DBE9
	STA.w CPU.multiply_A			;$B3DBEB
	LDA.b $40				;$B3DBEE
	STA.w CPU.multiply_B			;$B3DBF0
	REP.b #$20				;$B3DBF3
	LDA.w CPU.multiply_result		;$B3DBF5
	LDA.w CPU.multiply_result		;$B3DBF8
	CLC					;$B3DBFB
	ADC.b $1B				;$B3DBFC
	STA.b $1B				;$B3DBFE
	LDA.w #$0000				;$B3DC00
	ADC.w #$0000				;$B3DC03
	STA.b $1D				;$B3DC06
	SEP.b #$20				;$B3DC08
	LDA.b $3E				;$B3DC0A
	STA.w CPU.multiply_A			;$B3DC0C
	LDA.b $41				;$B3DC0F
	STA.w CPU.multiply_B			;$B3DC11
	REP.b #$20				;$B3DC14
	LDA.w CPU.multiply_result		;$B3DC16
	LDA.w CPU.multiply_result		;$B3DC19
	CLC					;$B3DC1C
	ADC.b $1B				;$B3DC1D
	STA.b $1B				;$B3DC1F
	LDA.w #$0000				;$B3DC21
	ADC.w #$0000				;$B3DC24
	STA.b $1D				;$B3DC27
	SEP.b #$20				;$B3DC29
	LDA.b $3F				;$B3DC2B
	STA.w CPU.multiply_A			;$B3DC2D
	LDA.b $41				;$B3DC30
	STA.w CPU.multiply_B			;$B3DC32
	REP.b #$20				;$B3DC35
	LDA.w CPU.multiply_result		;$B3DC37
	LDA.w CPU.multiply_result		;$B3DC3A
	CLC					;$B3DC3D
	ADC.b $1C				;$B3DC3E
	STA.b $1C				;$B3DC40
	RTS					;$B3DC42

CODE_B3DC43:
	JSR.w CODE_B3E0C6			;$B3DC43
	LDA.w #$7400				;$B3DC46
	STA.w PPU.vram_address			;$B3DC49
	LDY.w #$0000				;$B3DC4C
CODE_B3DC4F:
	TYA					;$B3DC4F
	EOR.w #$0020				;$B3DC50
	TAX					;$B3DC53
	LDA.l DATA_F6254B+$80,x			;$B3DC54
	CLC					;$B3DC58
	ADC.w #$0200				;$B3DC59
	STA.w PPU.vram_write			;$B3DC5C
	INY					;$B3DC5F
	INY					;$B3DC60
	CPY.w #$0200				;$B3DC61
	BNE.b CODE_B3DC4F			;$B3DC64
	RTS					;$B3DC66

CODE_B3DC67:
	LDA.w #$6C00				;$B3DC67
	STA.w PPU.vram_address			;$B3DC6A
	LDX.w #$0400				;$B3DC6D
	LDA.w #$0122				;$B3DC70
CODE_B3DC73:
	STA.w PPU.vram_write			;$B3DC73
	DEX					;$B3DC76
	BNE.b CODE_B3DC73			;$B3DC77
	JSR.w CODE_B3E0C6			;$B3DC79
	LDA.w #$02E0				;$B3DC7C
	STA.b $C8				;$B3DC7F
	RTS					;$B3DC81

CODE_B3DC82:
	LDX.w #main_sprite_table		;$B3DC82
	LDA.w #$0128				;$B3DC85
	JSL.l CODE_BB85C4			;$B3DC88
	LDX.w #$08E6				;$B3DC8C
	LDA.w #$0128				;$B3DC8F
	JSL.l CODE_BB85C4			;$B3DC92
	JMP.w CODE_B3E0C6			;$B3DC96

CODE_B3DC99:
	LDA.w #$6000				;$B3DC99
	STA.w PPU.vram_address			;$B3DC9C
	LDA.w #$005F				;$B3DC9F
	LDX.w #$0800				;$B3DCA2
CODE_B3DCA5:
	STA.w PPU.vram_write			;$B3DCA5
	DEX					;$B3DCA8
	BPL.b CODE_B3DCA5			;$B3DCA9
	LDA.w #$7800				;$B3DCAB
	STA.w PPU.vram_address			;$B3DCAE
	LDA.w #$005F				;$B3DCB1
	LDX.w #$0400				;$B3DCB4
CODE_B3DCB7:
	STA.w PPU.vram_write			;$B3DCB7
	DEX					;$B3DCBA
	BPL.b CODE_B3DCB7			;$B3DCBB
	SEP.b #$20				;$B3DCBD
	LDA.b #$81				;$B3DCBF
	STA.w PPU.vram_control			;$B3DCC1
	REP.b #$20				;$B3DCC4
	LDA.w #$614F				;$B3DCC6
	STA.w PPU.vram_address			;$B3DCC9
	LDX.w #$001E				;$B3DCCC
	LDA.w #$3C60				;$B3DCCF
CODE_B3DCD2:
	STA.w PPU.vram_write			;$B3DCD2
	DEX					;$B3DCD5
	BPL.b CODE_B3DCD2			;$B3DCD6
	SEP.b #$20				;$B3DCD8
	LDA.b #$80				;$B3DCDA
	STA.w PPU.vram_control			;$B3DCDC
	REP.b #$20				;$B3DCDF
	LDA.w #$790D				;$B3DCE1
	STA.w PPU.vram_address			;$B3DCE4
	LDX.w #$01CC				;$B3DCE7
CODE_B3DCEA:
	LDA.l DATA_E98550+$8A,x			;$B3DCEA
	EOR.w #$C000				;$B3DCEE
	STA.w PPU.vram_write			;$B3DCF1
	DEX					;$B3DCF4
	DEX					;$B3DCF5
	BPL.b CODE_B3DCEA			;$B3DCF6
	LDA.w #$7A0D				;$B3DCF8
	STA.w PPU.vram_address			;$B3DCFB
	LDX.w #$0088				;$B3DCFE
CODE_B3DD01:
	LDA.l DATA_E98550,x			;$B3DD01
	EOR.w #$C000				;$B3DD05
	STA.w PPU.vram_write			;$B3DD08
	DEX					;$B3DD0B
	DEX					;$B3DD0C
	BPL.b CODE_B3DD01			;$B3DD0D
	JSR.w CODE_B3E0C6			;$B3DD0F
	LDA.w #$0010				;$B3DD12
	LDX.w #$0004				;$B3DD15
	LDY.w #$0070				;$B3DD18
	JSL.l CODE_BB856D			;$B3DD1B
	RTS					;$B3DD1F

CODE_B3DD20:
	LDA.w #$7000				;$B3DD20
	STA.w PPU.vram_address			;$B3DD23
	LDA.w #$0172				;$B3DD26
	LDX.w #$0400				;$B3DD29
CODE_B3DD2C:
	STA.w PPU.vram_write			;$B3DD2C
	DEX					;$B3DD2F
	BPL.b CODE_B3DD2C			;$B3DD30
	LDA.w #$7000				;$B3DD32
	STA.w PPU.vram_address			;$B3DD35
	LDX.w #$0000				;$B3DD38
CODE_B3DD3B:
	LDA.l DATA_DEFED4+$40,x			;$B3DD3B
	CLC					;$B3DD3F
	ADC.w #$0172				;$B3DD40
	STA.w PPU.vram_write			;$B3DD43
	INX					;$B3DD46
	INX					;$B3DD47
	CPX.w #$05C0				;$B3DD48
	BNE.b CODE_B3DD3B			;$B3DD4B
	JSR.w CODE_B3E0C6			;$B3DD4D
	RTS					;$B3DD50

CODE_B3DD51:
	LDA.w $0775				;$B3DD51
	BIT.w #$0400				;$B3DD54
	BEQ.b CODE_B3DD5F			;$B3DD57
	LDA.w $077B				;$B3DD59
	JSR.w CODE_B3DE89			;$B3DD5C
CODE_B3DD5F:
	LDA.w $15E8				;$B3DD5F
	STA.w $15E6				;$B3DD62
	STA.w $15E4				;$B3DD65
	LDA.w #$7000				;$B3DD68
	STA.w PPU.vram_address			;$B3DD6B
	LDX.w #$0000				;$B3DD6E
CODE_B3DD71:
	TXA					;$B3DD71
	AND.w #$0003				;$B3DD72
	STA.b $1A				;$B3DD75
	TXA					;$B3DD77
	AND.w #$0060				;$B3DD78
	LSR					;$B3DD7B
	LSR					;$B3DD7C
	LSR					;$B3DD7D
	ORA.b $1A				;$B3DD7E
	ORA.w #$2000				;$B3DD80
	STA.w PPU.vram_write			;$B3DD83
	INX					;$B3DD86
	CPX.w #$0400				;$B3DD87
	BNE.b CODE_B3DD71			;$B3DD8A
	JSR.w CODE_B3E0C6			;$B3DD8C
	LDA.w #$2000				;$B3DD8F
	STA.w PPU.vram_address			;$B3DD92
	LDX.w #$0200				;$B3DD95
CODE_B3DD98:
	STZ.w PPU.vram_write			;$B3DD98
	DEX					;$B3DD9B
	BNE.b CODE_B3DD98			;$B3DD9C
	LDA.w $15E8				;$B3DD9E
	CMP.w #$0002				;$B3DDA1
	BNE.b CODE_B3DDB3			;$B3DDA4
	DEC					;$B3DDA6
	STA.w $15E6				;$B3DDA7
	STA.w $15E4				;$B3DDAA
	LDA.w #$0066				;$B3DDAD
	STA.w $15E2				;$B3DDB0
CODE_B3DDB3:
	LDA.w $15E8				;$B3DDB3
	BEQ.b CODE_B3DDE8			;$B3DDB6
	LDX.w #$0096				;$B3DDB8
	LDA.w parent_level_number		;$B3DDBB
	CMP.w #!level_lemguin_lunge		;$B3DDBE
	BNE.b CODE_B3DDC6			;$B3DDC1
	LDX.w #$0136				;$B3DDC3
CODE_B3DDC6:
	LDA.w parent_level_number		;$B3DDC6
	CMP.w #!level_tearaway_toboggan		;$B3DDC9
	BNE.b CODE_B3DDD1			;$B3DDCC
	LDX.w #$01D6				;$B3DDCE
CODE_B3DDD1:
	LDY.w #$000A				;$B3DDD1
	SEP.b #$20				;$B3DDD4
	LDA.b #$1B				;$B3DDD6
	STA.w PPU.cgram_address			;$B3DDD8
CODE_B3DDDB:
	LDA.l DATA_B399C5,x			;$B3DDDB
	STA.w PPU.cgram_write			;$B3DDDF
	INX					;$B3DDE2
	DEY					;$B3DDE3
	BPL.b CODE_B3DDDB			;$B3DDE4
	REP.b #$20				;$B3DDE6
CODE_B3DDE8:
	LDA.w $15E8				;$B3DDE8
	CMP.w #$0004				;$B3DDEB
	BCC.b CODE_B3DE17			;$B3DDEE
	SEP.b #$20				;$B3DDF0
	LDA.b #$04				;$B3DDF2
	STA.w PPU.cgram_address			;$B3DDF4
	LDA.b #$08				;$B3DDF7
	STA.w PPU.cgram_write			;$B3DDF9
	LDA.b #$21				;$B3DDFC
	STA.w PPU.cgram_write			;$B3DDFE
	LDA.b #$10				;$B3DE01
	STA.w PPU.cgram_write			;$B3DE03
	LDA.b #$42				;$B3DE06
	STA.w PPU.cgram_write			;$B3DE08
	LDA.b #$18				;$B3DE0B
	STA.w PPU.cgram_write			;$B3DE0D
	LDA.b #$63				;$B3DE10
	STA.w PPU.cgram_write			;$B3DE12
	REP.b #$20				;$B3DE15
CODE_B3DE17:
	LDA.w $15E8				;$B3DE17
	CMP.w #$0005				;$B3DE1A
	BCC.b CODE_B3DE88			;$B3DE1D
	LDA.w #$0217				;$B3DE1F
	STA.w PPU.screens			;$B3DE22
	LDA.w #$0007				;$B3DE25
	STA.w PPU.window_masks			;$B3DE28
	SEP.b #$20				;$B3DE2B
	LDA.b #$01				;$B3DE2D
	STA.w PPU.cgram_address			;$B3DE2F
	LDA.b #$18				;$B3DE32
	STA.w PPU.cgram_write			;$B3DE34
	LDA.b #$63				;$B3DE37
	STA.w PPU.cgram_write			;$B3DE39
	LDA.b #$9C				;$B3DE3C
	STA.w PPU.cgram_write			;$B3DE3E
	LDA.b #$73				;$B3DE41
	STA.w PPU.cgram_write			;$B3DE43
	LDA.b #$FF				;$B3DE46
	STA.w PPU.cgram_write			;$B3DE48
	LDA.b #$7F				;$B3DE4B
	STA.w PPU.cgram_write			;$B3DE4D
	REP.b #$20				;$B3DE50
	LDA.w #$7000				;$B3DE52
	STA.w PPU.vram_address			;$B3DE55
	LDX.w #DATA_F6644B>>16			;$B3DE58
	LDA.w #DATA_F6644B			;$B3DE5B
	LDY.w #$0200				;$B3DE5E
	JSR.w CODE_B38093			;$B3DE61
	LDX.w #DATA_F6644B>>16			;$B3DE64
	LDA.w #DATA_F6644B			;$B3DE67
	LDY.w #$0200				;$B3DE6A
	JSR.w CODE_B38093			;$B3DE6D
	LDX.w #DATA_F6644B>>16			;$B3DE70
	LDA.w #DATA_F6644B			;$B3DE73
	LDY.w #$0200				;$B3DE76
	JSR.w CODE_B38093			;$B3DE79
	LDX.w #DATA_F6644B>>16			;$B3DE7C
	LDA.w #DATA_F6644B			;$B3DE7F
	LDY.w #$0200				;$B3DE82
	JSR.w CODE_B38093			;$B3DE85
CODE_B3DE88:
	RTS					;$B3DE88

CODE_B3DE89:
	STA.l $000450				;$B3DE89
	LDX.w $0793				;$B3DE8D
	LDA.l DATA_FF9E08,x			;$B3DE90
	STA.b $42				;$B3DE94
	STA.w $15EC				;$B3DE96
	LDA.w #DATA_FF9E1A>>16			;$B3DE99
	STA.b $44				;$B3DE9C
	LDY.w #$FFFE				;$B3DE9E
CODE_B3DEA1:
	INY					;$B3DEA1
	INY					;$B3DEA2
	INY					;$B3DEA3
	LDA.b [$42],y				;$B3DEA4
	CMP.l $000450				;$B3DEA6
	BCC.b CODE_B3DEA1			;$B3DEAA
	DEY					;$B3DEAC
	LDA.b [$42],y				;$B3DEAD
	AND.w #$00FF				;$B3DEAF
	STA.w $15E8				;$B3DEB2
	RTS					;$B3DEB5

CODE_B3DEB6:
	LDA.w #$6800				;$B3DEB6
	STA.w PPU.vram_address			;$B3DEB9
	LDA.w #$01EA				;$B3DEBC
	LDX.w #$0800				;$B3DEBF
CODE_B3DEC2:
	STA.w PPU.vram_write			;$B3DEC2
	DEX					;$B3DEC5
	BNE.b CODE_B3DEC2			;$B3DEC6
	JMP.w CODE_B3E0C6			;$B3DEC8

CODE_B3DECB:
	LDA.w #$6800				;$B3DECB
	STA.w PPU.vram_address			;$B3DECE
	LDA.w #$00EA				;$B3DED1
	LDX.w #$0800				;$B3DED4
CODE_B3DED7:
	STA.w PPU.vram_write			;$B3DED7
	DEX					;$B3DEDA
	BNE.b CODE_B3DED7			;$B3DEDB
	LDA.w #$6800				;$B3DEDD
	STA.w PPU.vram_address			;$B3DEE0
	LDX.w #$0000				;$B3DEE3
CODE_B3DEE6:
	LDA.l DATA_E8A634,x			;$B3DEE6
	SEC					;$B3DEEA
	SBC.w #$0100				;$B3DEEB
	STA.w PPU.vram_write			;$B3DEEE
	INX					;$B3DEF1
	INX					;$B3DEF2
	CPX.w #$0240				;$B3DEF3
	BNE.b CODE_B3DEE6			;$B3DEF6
	JMP.w CODE_B3E0C6			;$B3DEF8

CODE_B3DEFB:
	LDA.w #$7000				;$B3DEFB
	STA.w PPU.vram_address			;$B3DEFE
	LDX.w #$0400				;$B3DF01
	LDA.w #$00F2				;$B3DF04
CODE_B3DF07:
	STA.w PPU.vram_write			;$B3DF07
	DEX					;$B3DF0A
	BNE.b CODE_B3DF07			;$B3DF0B
	JSR.w CODE_B3E0C6			;$B3DF0D
	LDA.w #$0027				;$B3DF10
	LDX.w #$0008				;$B3DF13
	LDY.w #$0060				;$B3DF16
	JSL.l CODE_BB856D			;$B3DF19
	LDA.w #$0029				;$B3DF1D
	LDX.w #$0004				;$B3DF20
	LDY.w #$0000				;$B3DF23
	JSL.l CODE_BB856D			;$B3DF26
	RTS					;$B3DF2A

CODE_B3DF2B:
	LDA.w #$7000				;$B3DF2B
	STA.w PPU.vram_address			;$B3DF2E
	LDX.w #$0400				;$B3DF31
	LDA.w #$00F2				;$B3DF34
CODE_B3DF37:
	STA.w PPU.vram_write			;$B3DF37
	DEX					;$B3DF3A
	BNE.b CODE_B3DF37			;$B3DF3B
	JSR.w CODE_B3E0C6			;$B3DF3D
	RTS					;$B3DF40

CODE_B3DF41:
	LDA.w #$7000				;$B3DF41
	STA.w PPU.vram_address			;$B3DF44
	LDA.w #$01D8				;$B3DF47
	LDX.w #$0400				;$B3DF4A
CODE_B3DF4D:
	STA.w PPU.vram_write			;$B3DF4D
	DEX					;$B3DF50
	BNE.b CODE_B3DF4D			;$B3DF51
	LDX.w #$0000				;$B3DF53
CODE_B3DF56:
	LDA.l DATA_EA7D8A,x			;$B3DF56
	ORA.w #$2000				;$B3DF5A
	STA.w PPU.vram_write			;$B3DF5D
	INX					;$B3DF60
	INX					;$B3DF61
	CPX.w #$0800				;$B3DF62
	BNE.b CODE_B3DF56			;$B3DF65
	JSR.w CODE_B3E0C6			;$B3DF67
	RTS					;$B3DF6A

CODE_B3DF6B:
	JSR.w CODE_B3E0C6			;$B3DF6B
	LDA.w #$0044				;$B3DF6E
	LDX.w #$0008				;$B3DF71
	LDY.w #$0010				;$B3DF74
	JSL.l CODE_BB856D			;$B3DF77
	RTS					;$B3DF7B

CODE_B3DF7C:
	LDA.w #$7800				;$B3DF7C
	STA.w PPU.vram_address			;$B3DF7F
	LDX.w #$0800				;$B3DF82
	LDA.w #$0150				;$B3DF85
CODE_B3DF88:
	STA.w PPU.vram_write			;$B3DF88
	DEX					;$B3DF8B
	BNE.b CODE_B3DF88			;$B3DF8C
	JSR.w CODE_B3E0C6			;$B3DF8E
	RTS					;$B3DF91

CODE_B3DF92:
	STZ.w $196D				;$B3DF92
	STZ.w $1973				;$B3DF95
	LDA.w #$0031				;$B3DF98
	JSL.l set_PPU_registers_global		;$B3DF9B
	STZ.w PPU.screens			;$B3DF9F
	LDA.b $BE				;$B3DFA2
	CMP.w #$0006				;$B3DFA4
	BCS.b CODE_B3DFDB			;$B3DFA7
	LDA.w #$003A				;$B3DFA9
	JSL.l vram_payload_handler_global	;$B3DFAC
	LDA.w #DATA_EB12E2			;$B3DFB0
	LDY.w #DATA_EB12E2>>16			;$B3DFB3
	LDX.w #$0000				;$B3DFB6
	JSL.l CODE_BB85DF			;$B3DFB9
	PHK					;$B3DFBD
	PLB					;$B3DFBE
	LDA.b $BE				;$B3DFBF
	JSR.w CODE_B3DFF8			;$B3DFC1
CODE_B3DFC4:
	LDA.b $BE				;$B3DFC4
	CLC					;$B3DFC6
	ADC.w #$0053				;$B3DFC7
	LDY.w #$0000				;$B3DFCA
	LDX.w #$0020				;$B3DFCD
	JSL.l CODE_BB856D			;$B3DFD0
	LDA.w #$0080				;$B3DFD4
	STA.w $053D				;$B3DFD7
	RTS					;$B3DFDA

CODE_B3DFDB:
	LDA.w #$003C				;$B3DFDB
	JSL.l vram_payload_handler_global	;$B3DFDE
	LDA.w #DATA_EB19BB			;$B3DFE2
	LDY.w #DATA_EB19BB>>16			;$B3DFE5
	LDX.w #$0000				;$B3DFE8
	JSL.l CODE_BB85DF			;$B3DFEB
	PHK					;$B3DFEF
	PLB					;$B3DFF0
	LDA.b $BE				;$B3DFF1
	JSR.w CODE_B3E049			;$B3DFF3
	BRA.b CODE_B3DFC4			;$B3DFF6

CODE_B3DFF8:
	ASL					;$B3DFF8
	TAY					;$B3DFF9
	LDX.w DATA_B3E03D,y			;$B3DFFA
	LDA.w #$0007				;$B3DFFD
	STA.b $1C				;$B3E000
	LDA.w #$0005				;$B3E002
	STA.b $1E				;$B3E005
	LDA.w #$6D46				;$B3E007
	STA.w PPU.vram_address			;$B3E00A
	STA.b $1A				;$B3E00D
	JSR.w CODE_B3E01F			;$B3E00F
	LDA.w #$0007				;$B3E012
	STA.b $1C				;$B3E015
	LDA.w #$6D55				;$B3E017
	STA.w PPU.vram_address			;$B3E01A
	STA.b $1A				;$B3E01D
CODE_B3E01F:
	LDY.b $1E				;$B3E01F
CODE_B3E021:
	LDA.l $7F0000,x				;$B3E021
	STA.w PPU.vram_write			;$B3E025
	INX					;$B3E028
	INX					;$B3E029
	DEY					;$B3E02A
	BNE.b CODE_B3E021			;$B3E02B
	LDA.b $1A				;$B3E02D
	CLC					;$B3E02F
	ADC.w #$0020				;$B3E030
	STA.b $1A				;$B3E033
	STA.w PPU.vram_address			;$B3E035
	DEC.b $1C				;$B3E038
	BNE.b CODE_B3E01F			;$B3E03A
	RTS					;$B3E03C

DATA_B3E03D:
	dw $0000,$008C,$0118,$01A4,$0230,$02BC

CODE_B3E049:
	ASL					;$B3E049
	TAY					;$B3E04A
	LDX.w DATA_B3E064-$0C,y			;$B3E04B
	LDA.w #$000E				;$B3E04E
	STA.b $1C				;$B3E051
	LDA.w #$000C				;$B3E053
	STA.b $1E				;$B3E056
	LDA.w #$6D0A				;$B3E058
	STA.w PPU.vram_address			;$B3E05B
	STA.b $1A				;$B3E05E
	JSR.w CODE_B3E01F			;$B3E060
	RTS					;$B3E063

DATA_B3E064:
	dw $0000,$0150,$02A0,$03F0,$0540,$0690,$0000

CODE_B3E072:
	LDA.w #$FFE0				;$B3E072
	SEP.b #$20				;$B3E075
	STA.w PPU.layer_1_scroll_y		;$B3E077
	XBA					;$B3E07A
	STA.w PPU.layer_1_scroll_y		;$B3E07B
	XBA					;$B3E07E
	STA.w PPU.layer_2_scroll_y		;$B3E07F
	XBA					;$B3E082
	STA.w PPU.layer_2_scroll_y		;$B3E083
	LDA.b #$FB				;$B3E086
	STA.w PPU.layer_1_scroll_x		;$B3E088
	XBA					;$B3E08B
	LDA.b #$FF				;$B3E08C
	STA.w PPU.layer_1_scroll_x		;$B3E08E
	XBA					;$B3E091
	STA.w PPU.layer_2_scroll_x		;$B3E092
	XBA					;$B3E095
	STA.w PPU.layer_2_scroll_x		;$B3E096
	REP.b #$20				;$B3E099
	JMP.w CODE_B3E0C6			;$B3E09B

CODE_B3E09E:
	LDA.w #$6C00				;$B3E09E
	STA.w PPU.vram_address			;$B3E0A1
	LDX.w #$0400				;$B3E0A4
	LDA.w #$0122				;$B3E0A7
CODE_B3E0AA:
	STA.w PPU.vram_write			;$B3E0AA
	DEX					;$B3E0AD
	BNE.b CODE_B3E0AA			;$B3E0AE
	JSR.w CODE_B3E0C6			;$B3E0B0
	LDA.w #$004C				;$B3E0B3
	LDX.w #$000C				;$B3E0B6
	LDY.w #$0050				;$B3E0B9
	JSL.l CODE_BB856D			;$B3E0BC
	LDA.w #$02E0				;$B3E0C0
	STA.b $C8				;$B3E0C3
	RTS					;$B3E0C5

CODE_B3E0C6:
	LDA.w #$0000				;$B3E0C6
	JSL.l vram_payload_handler_global	;$B3E0C9
	LDA.w $0781				;$B3E0CD
	JSL.l vram_payload_handler_global	;$B3E0D0
	LDA.w $077F				;$B3E0D4
	JSL.l set_PPU_registers_global		;$B3E0D7
	LDA.w $1B57				;$B3E0DB
	LDX.w #$0020				;$B3E0DE
	LDY.w #$0000				;$B3E0E1
	JSL.l CODE_BB856D			;$B3E0E4
	RTS					;$B3E0E8

CODE_B3E0E9:
	JSR.w CODE_B3ECB9			;$B3E0E9
	LDX.w #$0000				;$B3E0EC
CODE_B3E0EF:
	LDA.w #$0090				;$B3E0EF
	STA.l $7EA4EA,x				;$B3E0F2
	LDA.w #$A51A				;$B3E0F6
	STA.l $7EA4EB,x				;$B3E0F9
	INX					;$B3E0FD
	INX					;$B3E0FE
	INX					;$B3E0FF
	CPX.w #$002D				;$B3E100
	BNE.b CODE_B3E0EF			;$B3E103
	LDA.w #$1113				;$B3E105
	STA.w PPU.screens			;$B3E108
	LDA.w #$0202				;$B3E10B
	STA.w PPU.color_math			;$B3E10E
	SEP.b #$20				;$B3E111
	LDX.w #$0F43 				;$B3E113
	STX.w HDMA[$03].settings		;$B3E116
	LDX.w #$7EA4EA				;$B3E119
	STX.w HDMA[$03].source_word		;$B3E11C
	LDA.b #$7EA4EA>>16			;$B3E11F
	STA.w HDMA[$03].source_bank		;$B3E121
	STA.w HDMA[$03].indirect_source_bank	;$B3E124
	REP.b #$20				;$B3E127
	LDA.w #$0801				;$B3E129
	STA.w $04E4				;$B3E12C
	RTS					;$B3E12F

CODE_B3E130:
	JSR CODE_B3ECB9				;$B3E130
	LDX #$0000				;$B3E133
CODE_B3E136:
	LDA #$0090				;$B3E136
	STA $7EA4EA,x				;$B3E139
	LDA #$A51A				;$B3E13D
	STA $7EA4EB,x				;$B3E140
	INX					;$B3E144
	INX					;$B3E145
	INX					;$B3E146
	CPX #$002D				;$B3E147
	BNE CODE_B3E136				;$B3E14A
	SEP #$20				;$B3E14C
	LDX #$2C01				;$B3E14E
	STX HDMA[$01].settings			;$B3E151
	LDX #$7EA15A				;$B3E154
	STX HDMA[$01].source_word		;$B3E157
	LDA #$7EA15A>>16			;$B3E15A
	STA HDMA[$01].source_bank		;$B3E15C
	STA HDMA[$01].indirect_source_bank	;$B3E15F
	LDX #$3001				;$B3E162
	STX HDMA[$02].settings			;$B3E165
	LDX #$7EA1DA				;$B3E168
	STX HDMA[$02].source_word		;$B3E16B
	LDA #$7EA1DA>>16			;$B3E16E
	STA HDMA[$02].source_bank		;$B3E170
	STA HDMA[$02].indirect_source_bank	;$B3E173
	LDX #$0F43 				;$B3E176
	STX HDMA[$03].settings			;$B3E179
	LDX #$7EA4EA				;$B3E17C
	STX HDMA[$03].source_word		;$B3E17F
	LDA #$7EA4EA>>16			;$B3E182
	STA HDMA[$03].source_bank		;$B3E184
	STA HDMA[$03].indirect_source_bank	;$B3E187
	LDX #$1143 				;$B3E18A
	STX HDMA[$04].settings			;$B3E18D
	LDX #$7EA4EA				;$B3E190
	STX HDMA[$04].source_word		;$B3E193
	LDA #$7EA4EA>>16			;$B3E196
	STA HDMA[$04].source_bank		;$B3E198
	STA HDMA[$04].indirect_source_bank	;$B3E19B
	REP #$20				;$B3E19E
	LDA #$1E01				;$B3E1A0
	STA $04E4				;$B3E1A3
	RTS					;$B3E1A6

CODE_B3E1A7:
	LDA #$11C0				;$B3E1A7
	STA $80					;$B3E1AA
	LDA #$004C				;$B3E1AC
	STA $7EA17A				;$B3E1AF
	STA $7EA17C				;$B3E1B3
	LDA #$1201				;$B3E1B7
	STA $7EA17E				;$B3E1BA
	LDA #$00C0				;$B3E1BE
	STA $7EA1AA				;$B3E1C1
	LDA #$0080				;$B3E1C5
	STA $7EA1AC				;$B3E1C8
	LDA #$0040				;$B3E1CC
	STA $7EA1C6				;$B3E1CF
	LDA #$0058				;$B3E1D3
	STA $7EA1DA				;$B3E1D6
	LDA #$0001				;$B3E1DA
	STA $7EA1DF				;$B3E1DD
	STA $7EA35C				;$B3E1E1
	LDA #$0842				;$B3E1E5
	STA $7EA1DD				;$B3E1E8
	SEP #$20				;$B3E1EC
	LDX #$2D00 				;$B3E1EE
	STX HDMA[$01].settings			;$B3E1F1
	LDX #$7EA17A				;$B3E1F4
	STX HDMA[$01].source_word		;$B3E1F7
	LDA #$7EA17A>>16			;$B3E1FA
	STA HDMA[$01].source_bank		;$B3E1FC
	STA HDMA[$01].indirect_source_bank	;$B3E1FF
	LDX #$2601				;$B3E202
	STX HDMA[$02].settings			;$B3E205
	LDX #$7EA19A				;$B3E208
	STX HDMA[$02].source_word		;$B3E20B
	LDA #$7EA19A>>16			;$B3E20E
	STA HDMA[$02].source_bank		;$B3E210
	STA HDMA[$02].indirect_source_bank	;$B3E213
	LDX #$2103				;$B3E216
	STX HDMA[$03].settings			;$B3E219
	LDX #$7EA1DA				;$B3E21C
	STX HDMA[$03].source_word		;$B3E21F
	LDA #$7EA1DA>>16			;$B3E222
	STA HDMA[$03].source_bank		;$B3E224
	STA HDMA[$03].indirect_source_bank	;$B3E227
	REP #$20				;$B3E22A
	LDA #$0C01				;$B3E22C
	STA $04E4				;$B3E22F
	RTS					;$B3E232

CODE_B3E233:
	JSR CODE_B3ECB3				;$B3E233
	LDA #$00FF				;$B3E236
	STA $7EA15A				;$B3E239
	STA $7EA15C				;$B3E23D
	LDA #$0020				;$B3E241
	STA $7EA16A				;$B3E244
	LDA #$00CE				;$B3E248
	STA $7EA16D				;$B3E24B
	STA $7EA170				;$B3E24F
	LDA #$0001				;$B3E253
	STA $7EA173				;$B3E256
	LDA #DATA_B3E322			;$B3E25A
	STA $7EA16B				;$B3E25D
	LDA #DATA_B3E322			;$B3E261
	STA $7EA16E				;$B3E264
	LDA #DATA_B3E370			;$B3E268
	STA $7EA171				;$B3E26B
	LDA #DATA_B3E322			;$B3E26F
	STA $7EA174				;$B3E272
	LDX #$000E				;$B3E276
CODE_B3E279:
	LDA.l DATA_B3E57A,x			;$B3E279
	STA $7EA17A,x				;$B3E27D
	LDA.l DATA_B3E57A+$10,x			;$B3E281
	STA $7EA18A,x				;$B3E285
	LDA.l DATA_B3E57A+$20,x			;$B3E289
	STA $7EA19A,x				;$B3E28D
	LDA.l DATA_B3E57A+$2A,x			;$B3E291
	STA $7EA1AA,x				;$B3E295
	DEX					;$B3E299
	DEX					;$B3E29A
	BPL CODE_B3E279				;$B3E29B
	SEP #$20				;$B3E29D
	LDX #$2640				;$B3E29F
	STX HDMA[$01].settings			;$B3E2A2
	LDX #$7EA17A				;$B3E2A5
	STX HDMA[$01].source_word		;$B3E2A8
	LDA #$7EA17A>>16			;$B3E2AB
	STA HDMA[$01].source_bank		;$B3E2AD
	STA HDMA[$01].indirect_source_bank	;$B3E2B0
	LDX #$2740				;$B3E2B3
	STX HDMA[$02].settings			;$B3E2B6
	LDX #$7EA18A				;$B3E2B9
	STX HDMA[$02].source_word		;$B3E2BC
	LDA #$7EA18A>>16			;$B3E2BF
	STA HDMA[$02].source_bank		;$B3E2C1
	STA HDMA[$02].indirect_source_bank	;$B3E2C4
	LDX #$2840				;$B3E2C7
	STX HDMA[$03].settings			;$B3E2CA
	LDX #$7EA19A				;$B3E2CD
	STX HDMA[$03].source_word		;$B3E2D0
	LDA #$7EA19A>>16			;$B3E2D3
	STA HDMA[$03].source_bank		;$B3E2D5
	STA HDMA[$03].indirect_source_bank	;$B3E2D8
	LDX #$2940				;$B3E2DB
	STX HDMA[$04].settings			;$B3E2DE
	LDX #$7EA1AA				;$B3E2E1
	STX HDMA[$04].source_word		;$B3E2E4
	LDA #$7EA1AA>>16			;$B3E2E7
	STA HDMA[$04].source_bank		;$B3E2E9
	STA HDMA[$04].indirect_source_bank	;$B3E2EC
	LDX #$3240				;$B3E2EF
	STX HDMA[$05].settings			;$B3E2F2
	LDX #$7EA16A				;$B3E2F5
	STX HDMA[$05].source_word		;$B3E2F8
	LDA #$7EA16A>>16			;$B3E2FB
	STA HDMA[$05].source_bank		;$B3E2FD
	LDA #DATA_B3E322>>16			;$B3E300
	STA HDMA[$05].indirect_source_bank	;$B3E302
	LDX #$2C00 				;$B3E305
	STX HDMA[$06].settings			;$B3E308
	LDX #$7EA1BA				;$B3E30B
	STX HDMA[$06].source_word		;$B3E30E
	LDA #$7EA1BA>>16			;$B3E311
	STA HDMA[$06].source_bank		;$B3E313
	STA HDMA[$06].indirect_source_bank	;$B3E316
	REP #$20				;$B3E319
	LDA #$7E01				;$B3E31B
	STA $04E4				;$B3E31E
	RTS					;$B3E321

DATA_B3E322:
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0

DATA_B3E370:
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$20,$40,$20,$40,$20,$40
	db $20,$40,$21,$40,$21,$40,$22,$40,$22,$40,$23,$40,$22,$40,$23,$40
	db $23,$40,$23,$40,$23,$40,$23,$40,$23,$40,$24,$40,$24,$40,$25,$40
	db $25,$40,$26,$40,$26,$40,$27,$40,$28,$40,$29,$40,$29,$40,$2A,$40
	db $2B,$40,$2C,$40,$2D,$40,$2E,$40,$2F,$40,$30,$40,$2F,$40,$2F,$40
	db $2F,$40,$2F,$40,$2F,$40,$2F,$40,$2E,$40,$2F,$40,$2E,$40,$2E,$40
	db $2D,$40,$2D,$40,$2D,$40,$2C,$40,$2C,$40,$2C,$40,$2D,$40,$2E,$40
	db $2F,$40,$31,$40,$31,$40,$33,$40,$34,$40,$35,$40,$36,$40,$38,$40
	db $39,$40,$3B,$40,$3C,$40,$3E,$40,$3F,$40,$3F,$40,$3F,$40,$3E,$40
	db $3D,$40,$3D,$41,$3C,$41,$3C,$42,$3B,$42,$3B,$43,$39,$42,$39,$43
	db $38,$43,$37,$43,$36,$43,$35,$43,$34,$43,$35,$44,$36,$44,$38,$45
	db $39,$45,$3B,$46,$3C,$46,$3E,$47,$3F,$48,$3F,$49,$3F,$49,$3F,$4A
	db $3F,$4B,$3F,$4C,$3F,$4D,$3F,$4E,$3F,$4F,$3F,$50,$3F,$4F,$3F,$4F
	db $3F,$4F,$3F,$4F,$3F,$4F,$3F,$4F,$3F,$4E,$3F,$4F,$3F,$4E,$3F,$4E
	db $3F,$4D,$3F,$4D,$3F,$4D,$3E,$4C,$3D,$4C,$3D,$4C,$3F,$4D,$3F,$4E
	db $3F,$4F,$3F,$51,$3F,$51,$3F,$53,$3F,$54,$3F,$55,$3F,$56,$3F,$58
	db $3F,$59,$3F,$5B,$3F,$5C,$3F,$5E,$3F,$5F,$3F,$5F,$3F,$5F,$3F,$5E
	db $3F,$5D,$3F,$5D,$3F,$5C,$3F,$5C,$3F,$5B,$3F,$5B,$3F,$59,$3F,$59
	db $3F,$58,$3F,$57,$3F,$56,$3F,$55,$3F,$54,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0
	db $E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0,$E0

DATA_B3E57A:
	db $20,$5A,$A1,$CC,$DA,$A1,$CC,$26,$A2,$84,$CC,$A1,$01,$5A,$A1,$00
	db $20,$5A,$A1,$CC,$DA,$A2,$CC,$26,$A3,$84,$D2,$A1,$01,$5A,$A1,$00
	db $20,$5A,$A1,$D4,$DA,$A3,$01,$5A,$A1,$00,$20,$5A,$A1,$D4,$DA,$A4
	db $01,$5B,$A1,$00

CODE_B3E5AE:
	LDA #$1180				;$B3E5AE
	STA $80					;$B3E5B1
	LDA #$0060				;$B3E5B3
	STA $7EA15A				;$B3E5B6
	STA $7EA26A				;$B3E5BA
	STA $7EA270				;$B3E5BE
	LDA #$0098				;$B3E5C2
	STA $7EA160				;$B3E5C5
	LDA #$A16A				;$B3E5C9
	STA $7EA15B				;$B3E5CC
	STA $7EA15E				;$B3E5D0
	LDA #$005C				;$B3E5D4
	STA $7EA25A				;$B3E5D7
	LDA #$009C				;$B3E5DB
	STA $7EA260				;$B3E5DE
	LDA #DATA_B3E6D2			;$B3E5E2
	STA $7EA25B				;$B3E5E5
	LDA #DATA_B3E6D6			;$B3E5E9
	STA $7EA25E				;$B3E5EC
	LDA #DATA_B3E6DA			;$B3E5F0
	STA $7EA261				;$B3E5F3
	LDA #$0038				;$B3E5F7
	STA $7EA1EA				;$B3E5FA
	STA $7EA1F0				;$B3E5FE
	LDA #$A1FA				;$B3E602
	STA $7EA1EB				;$B3E605
	STA $7EA1EE				;$B3E609
	LDA #$A1FC				;$B3E60D
	STA $7EA1F1				;$B3E610
	STA $7EA21C				;$B3E614
	LDA #$004C				;$B3E618
	STA $7EA23A				;$B3E61B
	LDA #$0017				;$B3E61F
	STA $7EA23B				;$B3E622
	LDA #$0001				;$B3E626
	STA $7EA23D				;$B3E629
	LDA #$1215				;$B3E62D
	STA $7EA23E				;$B3E630
	LDA #$0030				;$B3E634
	STA $7EA24A				;$B3E637
	LDA #$0001				;$B3E63B
	STA $7EA24D				;$B3E63E
	LDA #$0080				;$B3E642
	STA $7EA254				;$B3E645
	STA $7EA252				;$B3E649
	SEP #$20				;$B3E64D
	LDX #$2143				;$B3E64F
	STX HDMA[$01].settings			;$B3E652
	LDX #$7EA25A				;$B3E655
	STX HDMA[$01].source_word		;$B3E658
	LDA #$7EA25A>>16			;$B3E65B
	STA HDMA[$01].source_bank		;$B3E65D
	LDA #DATA_B3E6D2>>16			;$B3E660
	STA HDMA[$01].indirect_source_bank	;$B3E662
	LDX #$1142				;$B3E665
	STX HDMA[$02].settings			;$B3E668
	LDX #$7EA15A				;$B3E66B
	STX HDMA[$02].source_word		;$B3E66E
	LDA #$7EA15A>>16			;$B3E671
	STA HDMA[$02].source_bank		;$B3E673
	STA HDMA[$02].indirect_source_bank	;$B3E676
	LDX #$2641				;$B3E679
	STX HDMA[$03].settings			;$B3E67C
	LDX #$7EA1EA				;$B3E67F
	STX HDMA[$03].source_word		;$B3E682
	LDA #$7EA1EA>>16			;$B3E685
	STA HDMA[$03].source_bank		;$B3E687
	STA HDMA[$03].indirect_source_bank	;$B3E68A
	LDX #$1202				;$B3E68D
	STX HDMA[$04].settings			;$B3E690
	LDX #$7EA26A				;$B3E693
	STX HDMA[$04].source_word		;$B3E696
	LDA #$7EA26A>>16			;$B3E699
	STA HDMA[$04].source_bank		;$B3E69B
	STA HDMA[$04].indirect_source_bank	;$B3E69E
	LDX #$2C01				;$B3E6A1
	STX HDMA[$05].settings			;$B3E6A4
	LDX #$7EA23A				;$B3E6A7
	STX HDMA[$05].source_word		;$B3E6AA
	LDA #$7EA23A>>16			;$B3E6AD
	STA HDMA[$05].source_bank		;$B3E6AF
	STA HDMA[$05].indirect_source_bank	;$B3E6B2
	LDX #$0F02 				;$B3E6B5
	STX HDMA[$06].settings			;$B3E6B8
	LDX #$7EA24A				;$B3E6BB
	STX HDMA[$06].source_word		;$B3E6BE
	LDA #$7EA24A>>16			;$B3E6C1
	STA HDMA[$06].source_bank		;$B3E6C3
	STA HDMA[$06].indirect_source_bank	;$B3E6C6
	REP #$20				;$B3E6C9
	LDA #$7E01				;$B3E6CB
	STA $04E4				;$B3E6CE
	RTS					;$B3E6D1

DATA_B3E6D2:
	db $00,$00,$49,$00

DATA_B3E6D6:
	db $00,$00,$49,$00

DATA_B3E6DA:
	db $00,$00,$91,$09,$0D,$0D,$4E,$09,$0E,$0E,$C8,$04,$0F,$0F,$A8,$04
	db $00,$00,$92,$09,$0D,$0D,$50,$09,$0E,$0E,$0D,$05,$0F,$0F,$CB,$04
	db $00,$00,$73,$09,$0D,$0D,$30,$05,$0E,$0E,$EE,$04,$0F,$0F,$CB,$04
	db $00,$00,$75,$09,$0D,$0D,$32,$09,$0E,$0E,$0F,$05,$0F,$0F,$CD,$04
	db $00,$00,$76,$0D,$0D,$0D,$33,$09,$0E,$0E,$10,$09,$0F,$0F,$CD,$04
	db $00,$00,$77,$0D,$0D,$0D,$34,$09,$0E,$0E,$11,$05,$0F,$0F,$CF,$04
	db $00,$00,$78,$0D,$0D,$0D,$35,$09,$0E,$0E,$12,$09,$0F,$0F,$CF,$04

CODE_B3E74A:
	JSR CODE_B3ECB9				;$B3E74A
	LDX #$0000				;$B3E74D
CODE_B3E750:
	LDA #$0090				;$B3E750
	STA $7EA19A,x				;$B3E753
	STA $7EA49A,x				;$B3E757
	STA $7EA28A,x				;$B3E75B
	STA $7EA58A,x				;$B3E75F
	STA $7EA38A,x				;$B3E763
	STA $7EA68A,x				;$B3E767
	LDA #$A3BA				;$B3E76B
	STA $7EA19B,x				;$B3E76E
	LDA #$A6BA				;$B3E772
	STA $7EA49B,x				;$B3E775
	LDA #$A3DA				;$B3E779
	STA $7EA28B,x				;$B3E77C
	LDA #$A6DA				;$B3E780
	STA $7EA58B,x				;$B3E783
	LDA #$A3FA				;$B3E787
	STA $7EA38B,x				;$B3E78A
	LDA #$A6FA				;$B3E78E
	STA $7EA68B,x				;$B3E791
	INX					;$B3E795
	INX					;$B3E796
	INX					;$B3E797
	CPX #$0030				;$B3E798
	BNE CODE_B3E750				;$B3E79B
	SEP #$20				;$B3E79D
	LDX #$2C01 				;$B3E79F
	STX HDMA[$01].settings			;$B3E7A2
	LDX #$7EA15A				;$B3E7A5
	STX HDMA[$01].source_word		;$B3E7A8
	LDA #$7EA15A>>16			;$B3E7AB
	STA HDMA[$01].source_bank		;$B3E7AD
	STA HDMA[$01].indirect_source_bank	;$B3E7B0
	LDX #$2103				;$B3E7B3
	STX HDMA[$02].settings			;$B3E7B6
	LDX #$7EA17A				;$B3E7B9
	STX HDMA[$02].source_word		;$B3E7BC
	LDA #$7EA17A>>16			;$B3E7BF
	STA HDMA[$02].source_bank		;$B3E7C1
	STA HDMA[$02].indirect_source_bank	;$B3E7C4
	LDX #$3001				;$B3E7C7
	STX HDMA[$03].settings			;$B3E7CA
	LDX #$7EA16A				;$B3E7CD
	STX HDMA[$03].source_word		;$B3E7D0
	LDA #$7EA16A>>16			;$B3E7D3
	STA HDMA[$03].source_bank		;$B3E7D5
	STA HDMA[$03].indirect_source_bank	;$B3E7D8
	LDX #$1142				;$B3E7DB
	STX HDMA[$04].settings			;$B3E7DE
	LDX #$7EA18A				;$B3E7E1
	STX HDMA[$04].source_word		;$B3E7E4
	LDA #$7EA18A>>16			;$B3E7E7
	STA HDMA[$04].source_bank		;$B3E7E9
	STA HDMA[$04].indirect_source_bank	;$B3E7EC
	LDX #$0D42				;$B3E7EF
	STX HDMA[$05].settings			;$B3E7F2
	LDX #$7EA19A				;$B3E7F5
	STX HDMA[$05].source_word		;$B3E7F8
	LDA #$7EA19A>>16			;$B3E7FB
	STA HDMA[$05].source_bank		;$B3E7FD
	STA HDMA[$05].indirect_source_bank	;$B3E800
	LDX #$0F42				;$B3E803
	STX HDMA[$06].settings			;$B3E806
	LDX #$7EA28A				;$B3E809
	STX HDMA[$06].source_word		;$B3E80C
	LDA #$7EA28A>>16			;$B3E80F
	STA HDMA[$06].source_bank		;$B3E811
	STA HDMA[$06].indirect_source_bank	;$B3E814
	LDX #$0E42				;$B3E817
	STX HDMA[$07].settings			;$B3E81A
	LDX #$7EA38A				;$B3E81D
	STX HDMA[$07].source_word		;$B3E820
	LDA #$7EA38A>>16			;$B3E823
	STA HDMA[$07].source_bank		;$B3E825
	STA HDMA[$07].indirect_source_bank	;$B3E828
	REP #$20				;$B3E82B
	LDA #$FE01				;$B3E82D
	STA $04E4				;$B3E830
	RTS					;$B3E833

CODE_B3E834:
	JSR.w CODE_B3E84E			;$B3E834
	LDA.w #$7801				;$B3E837
	STA.w $04E4				;$B3E83A
	RTS					;$B3E83D

CODE_B3E83E:
	JSR.w CODE_B3E84E			;$B3E83E
	LDA.w #$5C01				;$B3E841
	STA.w $04E4				;$B3E844
	LDA.w #$0001				;$B3E847
	STA.w $15E2				;$B3E84A
	RTS					;$B3E84D

CODE_B3E84E:
	JSR.w CODE_B3ECB9			;$B3E84E
	LDX.w #$0000				;$B3E851
CODE_B3E854:
	LDA.w #$0090				;$B3E854
	STA.l $7EA4EA,x				;$B3E857
	STA.l $7EA5BA,x				;$B3E85B
	LDA.w #$A51A				;$B3E85F
	STA.l $7EA4EB,x				;$B3E862
	LDA.w #$A5EA				;$B3E866
	STA.l $7EA5BB,x				;$B3E869
	INX					;$B3E86D
	INX					;$B3E86E
	INX					;$B3E86F
	CPX.w #$002D				;$B3E870
	BNE.b CODE_B3E854			;$B3E873
	LDX.w #$0000				;$B3E875
CODE_B3E878:
	LDA.w #$0090				;$B3E878
	STA.l $7EA55A,x				;$B3E87B
	LDA.w #$A58A				;$B3E87F
	STA.l $7EA55B,x				;$B3E882
	INX					;$B3E886
	INX					;$B3E887
	INX					;$B3E888
	CPX.w #$002D				;$B3E889
	BNE.b CODE_B3E878			;$B3E88C
	LDA.w parent_level_number		;$B3E88E
	CMP.w #!level_barbos_barrier		;$B3E891
	BEQ.b CODE_B3E8C3			;$B3E894
	CMP.w #!level_fish_food_frenzy		;$B3E896
	BEQ.b CODE_B3E8AF			;$B3E899
	LDX.w #$0000				;$B3E89B
CODE_B3E89E:
	LDA.l DATA_B3E958,x			;$B3E89E
	STA.l $7EA19A,x				;$B3E8A2
	INX					;$B3E8A6
	INX					;$B3E8A7
	CPX.w #$0040				;$B3E8A8
	BNE.b CODE_B3E89E			;$B3E8AB
	BRA.b CODE_B3E8D5			;$B3E8AD

CODE_B3E8AF:
	LDX.w #$0000				;$B3E8AF
CODE_B3E8B2:
	LDA.l DATA_B3E990,x			;$B3E8B2
	STA.l $7EA19A,x				;$B3E8B6
	INX					;$B3E8BA
	INX					;$B3E8BB
	CPX.w #$0040				;$B3E8BC
	BNE.b CODE_B3E8B2			;$B3E8BF
	BRA.b CODE_B3E8D5			;$B3E8C1

CODE_B3E8C3:
	LDX #$0000				;$B3E8C3
CODE_B3E8C6:
	LDA.l DATA_B3E9C8,x			;$B3E8C6
	STA $7EA19A,x				;$B3E8CA
	INX					;$B3E8CE
	INX					;$B3E8CF
	CPX #$0040				;$B3E8D0
	BNE CODE_B3E8C6				;$B3E8D3
CODE_B3E8D5:
	SEP #$20				;$B3E8D5
	LDX #$0D43				;$B3E8D7
	STX HDMA[$01].settings			;$B3E8DA
	LDX #$7EA15A				;$B3E8DD
	STX HDMA[$01].source_word		;$B3E8E0
	LDA #$7EA15A>>16			;$B3E8E3
	STA HDMA[$01].source_bank		;$B3E8E5
	STA HDMA[$01].indirect_source_bank	;$B3E8E8
	LDX #$2601				;$B3E8EB
	STX HDMA[$02].settings			;$B3E8EE
	LDX #$7EA17A				;$B3E8F1
	STX HDMA[$02].source_word		;$B3E8F4
	LDA #$7EA17A>>16			;$B3E8F7
	STA HDMA[$02].source_bank		;$B3E8F9
	STA HDMA[$02].indirect_source_bank	;$B3E8FC
	LDX #$0F42				;$B3E8FF
	STX HDMA[$03].settings			;$B3E902
	LDX #$7EA4EA				;$B3E905
	STX HDMA[$03].source_word		;$B3E908
	LDA #$7EA4EA>>16			;$B3E90B
	STA HDMA[$03].source_bank		;$B3E90D
	STA HDMA[$03].indirect_source_bank	;$B3E910
	LDX #$1142				;$B3E913
	STX HDMA[$04].settings			;$B3E916
	LDX #$7EA55A				;$B3E919
	STX HDMA[$04].source_word		;$B3E91C
	LDA #$7EA55A>>16			;$B3E91F
	STA HDMA[$04].source_bank		;$B3E921
	STA HDMA[$04].indirect_source_bank	;$B3E924
	LDX #$3200				;$B3E927
	STX HDMA[$05].settings			;$B3E92A
	LDX #$7EA19A				;$B3E92D
	STX HDMA[$05].source_word		;$B3E930
	LDA #$7EA19A>>16			;$B3E933
	STA HDMA[$05].source_bank		;$B3E935
	STA HDMA[$05].indirect_source_bank	;$B3E938
	LDX #$1042				;$B3E93B
	STX HDMA[$06].settings			;$B3E93E
	LDX #$7EA5BA				;$B3E941
	STX HDMA[$06].source_word		;$B3E944
	LDA #$7EA5BA>>16			;$B3E947
	STA HDMA[$06].source_bank		;$B3E949
	STA HDMA[$06].indirect_source_bank	;$B3E94C
	REP #$20				;$B3E94F
	LDA #$7E01				;$B3E951
	STA $04E4				;$B3E954
	RTS					;$B3E957

DATA_B3E958:
	dw $9C08,$9B08,$9A08,$9908,$9808,$9708,$9608,$9508
	dw $9408,$9308,$9208,$9108,$9008,$8F08,$8E08,$8D08
	dw $8C08,$8B08,$8A08,$8908,$8808,$8708,$8608,$8508
	dw $8408,$8308,$8208,$8108

DATA_B3E990:
	dw $5C08,$5B08,$5A08,$5908,$5808,$5708,$5608,$5508
	dw $5408,$5308,$5208,$5108,$5008,$4F08,$4E08,$4D08
	dw $4C08,$4B08,$4A08,$4908,$4808,$4708,$4608,$4508
	dw $4408,$4308,$4208,$4108

DATA_B3E9C8:
	dw $3008,$2F08,$2F08,$2E08,$2E08,$2D08,$2D08,$2C08
	dw $2C08,$2B08,$2B08,$2A08,$2A08,$2908,$2908,$2808
	dw $2808,$2708,$2708,$2608,$2608,$2508,$2508,$2408
	dw $2408,$2308,$2308,$2208

CODE_B3EA00:
	JSR CODE_B3ECB9				;$B3EA00
	LDA #$00FF				;$B3EA03
	STA $7EA15A				;$B3EA06
	STA $7EA15D				;$B3EA0A
	LDA #$A16A				;$B3EA0E
	STA $7EA15B				;$B3EA11
	LDA #$A268				;$B3EA15
	STA $7EA15E				;$B3EA18
	LDA #$01C0				;$B3EA1C
	STA $20					;$B3EA1F
	LDA #$0000				;$B3EA21
	STA $1C					;$B3EA24
	LDA $00					;$B3EA26
	ASL					;$B3EA28
	EOR #$FFFF				;$B3EA29
	XBA					;$B3EA2C
	LDX #$0000				;$B3EA2D
CODE_B3EA30:
	STA $7EA569,x				;$B3EA30
	SEC					;$B3EA34
	SBC $1C					;$B3EA35
	STA $24					;$B3EA37
	LDA $1B					;$B3EA39
	CLC					;$B3EA3B
	ADC $20					;$B3EA3C
	STA $1B					;$B3EA3E
	LDA $1D					;$B3EA40
	ADC #$0000				;$B3EA42
	STA $1D					;$B3EA45
	DEC $20					;$B3EA47
	DEC $20					;$B3EA49
	LDA $24					;$B3EA4B
	INX					;$B3EA4D
	INX					;$B3EA4E
	CPX #$01C0				;$B3EA4F
	BNE CODE_B3EA30				;$B3EA52
	SEP #$20				;$B3EA54
	LDX #$1042				;$B3EA56
	STX HDMA[$01].settings			;$B3EA59
	LDX #$7EA15A				;$B3EA5C
	STX HDMA[$01].source_word		;$B3EA5F
	LDA #$7EA15A>>16			;$B3EA62
	STA HDMA[$01].source_bank		;$B3EA64
	STA HDMA[$01].indirect_source_bank	;$B3EA67
	REP #$20				;$B3EA6A
	LDA #$0201				;$B3EA6C
	STA $04E4				;$B3EA6F
	RTS					;$B3EA72

CODE_B3EA73:
	JSR.w CODE_B3ECB9			;$B3EA73
	LDX.w #$0000				;$B3EA76
CODE_B3EA79:
	LDA.l DATA_B3B7B4,x			;$B3EA79
	STA.l $7EA15A,x				;$B3EA7D
	STA.l $7EA17A,x				;$B3EA81
	STA.l $7EA19A,x				;$B3EA85
	STA.l $7EA1BA,x				;$B3EA89
	STA.l $7EA1DA,x				;$B3EA8D
	LDA.l DATA_B3B7D4,x			;$B3EA91
	STA.l $7EA1FA,x				;$B3EA95
	STA.l $7EA21A,x				;$B3EA99
	STA.l $7EA23A,x				;$B3EA9D
	STA.l $7EA25A,x				;$B3EAA1
	STA.l $7EA27A,x				;$B3EAA5
	INX					;$B3EAA9
	INX					;$B3EAAA
	CPX.w #$0020				;$B3EAAB
	BNE.b CODE_B3EA79			;$B3EAAE
	LDA.w #$2010				;$B3EAB0
	STA.w PPU.vram_address			;$B3EAB3
	LDX.w #$7EA15A>>16			;$B3EAB6
	LDA.w #$7EA15A				;$B3EAB9
	LDY.w #$0140				;$B3EABC
	JSR.w CODE_B38093			;$B3EABF
	LDA.w #$0001				;$B3EAC2
	STA.w $04E4				;$B3EAC5
	RTS					;$B3EAC8

CODE_B3EAC9:
	JSR CODE_B3ECB9				;$B3EAC9
	SEP #$20				;$B3EACC
	LDX #$2601				;$B3EACE
	STX HDMA[$02].settings			;$B3EAD1
	LDX #$7EA17A				;$B3EAD4
	STX HDMA[$02].source_word		;$B3EAD7
	LDA #$7EA17A>>16			;$B3EADA
	STA HDMA[$02].source_bank		;$B3EADC
	STA HDMA[$02].indirect_source_bank	;$B3EADF
	REP #$20				;$B3EAE2
	LDA #$0401				;$B3EAE4
	STA $04E4				;$B3EAE7
	RTS					;$B3EAEA

CODE_B3EAEB:
	LDA.w #$12CE				;$B3EAEB
	STA.b $80				;$B3EAEE
	LDA.w #CODE_B394FF			;$B3EAF0
	STA.b $52				;$B3EAF3
	LDA.w #CODE_B394FF>>16			;$B3EAF5
	STA.b $54				;$B3EAF8
	LDA.w #$0090				;$B3EAFA
	STA.l $7EA160				;$B3EAFD
	STA.l $7EA163				;$B3EB01
	STA.l $7EA166				;$B3EB05
	STA.l $7EA560				;$B3EB09
	STA.l $7EA563				;$B3EB0D
	STA.l $7EA566				;$B3EB11
	LDA.w #$0001				;$B3EB15
	STA.l $7EA569				;$B3EB18
	LDA.w #$A2D6				;$B3EB1C
	STA.l $7EA55B				;$B3EB1F
	STA.l $7EA55E				;$B3EB23
	LDA.w #$A2DA				;$B3EB27
	STA.l $7EA56A				;$B3EB2A
	LDA.w #$A1D6				;$B3EB2E
	STA.l $7EA15B				;$B3EB31
	STA.l $7EA15E				;$B3EB35
	LDA.w #$A3D6				;$B3EB39
	STA.l $7EA35B				;$B3EB3C
	STA.l $7EA35E				;$B3EB40
	LDX.w #$0206				;$B3EB44
CODE_B3EB47:
	LDA.w #$0090				;$B3EB47
	STA.l $7EA15A,x				;$B3EB4A
	INX					;$B3EB4E
	INX					;$B3EB4F
	INX					;$B3EB50
	CPX.w #$0224				;$B3EB51
	BNE.b CODE_B3EB47			;$B3EB54
	LDX.w #$0000				;$B3EB56
	LDA.w parent_level_number		;$B3EB59
	CMP.w #!level_bobbing_barrel_brawl	;$B3EB5C
	BEQ.b CODE_B3EB7A			;$B3EB5F
CODE_B3EB61:
	LDA.l DATA_B3EC5F,x			;$B3EB61
	STA.l $7EA45A,x				;$B3EB65
	LDA.l DATA_B3ECA3,x			;$B3EB69
	STA.l $7EA4DA,x				;$B3EB6D
	INX					;$B3EB71
	INX					;$B3EB72
	CPX.w #$0020				;$B3EB73
	BNE.b CODE_B3EB61			;$B3EB76
	BRA.b CODE_B3EB91			;$B3EB78

CODE_B3EB7A:
	LDA.l DATA_B3EC81,x			;$B3EB7A
	STA $7EA45A,x				;$B3EB7E
	LDA.l DATA_B3ECA3,x			;$B3EB82
	STA $7EA4DA,x				;$B3EB86
	INX					;$B3EB8A
	INX					;$B3EB8B
	CPX #$0020				;$B3EB8C
	BNE CODE_B3EB7A				;$B3EB8F
CODE_B3EB91:
	LDA #$2450				;$B3EB91
	STA $7EA17A				;$B3EB94
	LDA #$2450				;$B3EB98
	STA $7EA17C				;$B3EB9B
	LDA #$6401				;$B3EB9F
	STA $7EA17E				;$B3EBA2
	LDA #$0050				;$B3EBA6
	STA $7EA19A				;$B3EBA9
	STA $7EA19D				;$B3EBAD
	LDA #$0001				;$B3EBB1
	STA $7EA1A0				;$B3EBB4
	LDA #$00FF				;$B3EBB8
	STA $7EA19B				;$B3EBBB
	STA $7EA19E				;$B3EBBF
	XBA					;$B3EBC3
	STA $7EA1A1				;$B3EBC4
	SEP #$20				;$B3EBC8
	LDX #$0F43				;$B3EBCA
	STX HDMA[$01].settings			;$B3EBCD
	LDX #$7EA15A				;$B3EBD0
	STX HDMA[$01].source_word		;$B3EBD3
	LDA #$7EA15A>>16			;$B3EBD6
	STA HDMA[$01].source_bank		;$B3EBD8
	STA HDMA[$01].indirect_source_bank	;$B3EBDB
	LDX #$2601				;$B3EBDE
	STX HDMA[$02].settings			;$B3EBE1
	LDX #$7EA19A				;$B3EBE4
	STX HDMA[$02].source_word		;$B3EBE7
	LDA #$7EA19A>>16			;$B3EBEA
	STA HDMA[$02].source_bank		;$B3EBEC
	STA HDMA[$02].indirect_source_bank	;$B3EBEF
	LDX #$3100				;$B3EBF2
	STX HDMA[$03].settings			;$B3EBF5
	LDX #$7EA17A				;$B3EBF8
	STX HDMA[$03].source_word		;$B3EBFB
	LDA #$7EA17A>>16			;$B3EBFE
	STA HDMA[$03].source_bank		;$B3EC00
	STA HDMA[$03].indirect_source_bank	;$B3EC03
	LDX #$1143 				;$B3EC06
	STX HDMA[$04].settings			;$B3EC09
	LDX #$7EA55A				;$B3EC0C
	STX HDMA[$04].source_word		;$B3EC0F
	LDA #$7EA55A>>16			;$B3EC12
	STA HDMA[$04].source_bank		;$B3EC14
	STA HDMA[$04].indirect_source_bank	;$B3EC17
	LDX #$0D43				;$B3EC1A
	STX HDMA[$05].settings			;$B3EC1D
	LDX #$7EA35A				;$B3EC20
	STX HDMA[$05].source_word		;$B3EC23
	LDA #$7EA35A>>16			;$B3EC26
	STA HDMA[$05].source_bank		;$B3EC28
	STA HDMA[$05].indirect_source_bank	;$B3EC2B
	LDX #$2103				;$B3EC2E
	STX HDMA[$06].settings			;$B3EC31
	LDX #$7EA45A				;$B3EC34
	STX HDMA[$06].source_word		;$B3EC37
	LDA #$7EA45A>>16			;$B3EC3A
	STA HDMA[$06].source_bank		;$B3EC3C
	STA HDMA[$06].indirect_source_bank	;$B3EC3F
	LDX #$2C01 				;$B3EC42
	STX HDMA[$07].settings			;$B3EC45
	LDX #$7EA4DA				;$B3EC48
	STX HDMA[$07].source_word		;$B3EC4B
	LDA #$7EA4DA>>16			;$B3EC4E
	STA HDMA[$07].source_bank		;$B3EC50
	STA HDMA[$07].indirect_source_bank	;$B3EC53
	REP #$20				;$B3EC56
	LDA #$FE01				;$B3EC58
	STA $04E4				;$B3EC5B
	RTS					;$B3EC5E

DATA_B3EC5F:
	db $38,$00,$00,$00,$00,$38,$00,$00,$00,$00,$83,$05,$05,$C6,$39,$06
	db $06,$8B,$66,$07,$07,$2C,$6F,$2D,$00,$00,$08,$4A,$01,$00,$00,$80
	db $18,$00

DATA_B3EC81:
	db $38,$00,$00,$00,$00,$38,$00,$00,$00,$00,$83,$05,$05,$86,$3A,$06
	db $06,$4B,$67,$07,$07,$EC,$6F,$2D,$00,$00,$C8,$4A,$01,$00,$00,$80
	db $18,$00

DATA_B3ECA3:
	db $38,$17,$13,$38,$17,$13,$27,$15,$02,$09,$05,$12,$01,$04,$13,$00

CODE_B3ECB3:
	LDA #$0001				;$B3ECB3
	STA $04E4				;$B3ECB6
CODE_B3ECB9:
	LDA #$1200				;$B3ECB9
	STA $80					;$B3ECBC
	RTS					;$B3ECBE

CODE_B3ECBF:
	LDA #$0170				;$B3ECBF
	STA $7E9B5A				;$B3ECC2
	LDA #$1180				;$B3ECC6
	STA $80					;$B3ECC9
	LDX #$000C				;$B3ECCB
CODE_B3ECCE:
	LDA.l DATA_B3EE8D,x			;$B3ECCE
	STA $7EA46A,x				;$B3ECD2
	DEX					;$B3ECD6
	DEX					;$B3ECD7
	BPL CODE_B3ECCE				;$B3ECD8
	LDX #$0012				;$B3ECDA
CODE_B3ECDD:
	LDA.l DATA_B3EE9A,x			;$B3ECDD
	STA $7EA478,x				;$B3ECE1
	DEX					;$B3ECE5
	DEX					;$B3ECE6
	BPL CODE_B3ECDD				;$B3ECE7
	LDX #$000E				;$B3ECE9
CODE_B3ECEC:
	LDA.l DATA_B3EEAA,x			;$B3ECEC
	STA $7EA48C,x				;$B3ECF0
	DEX					;$B3ECF4
	DEX					;$B3ECF5
	BPL CODE_B3ECEC				;$B3ECF6
	LDX #$0014				;$B3ECF8
CODE_B3ECFB:
	LDA.l DATA_B3EEBA,x			;$B3ECFB
	STA $7EA49C,x				;$B3ECFF
	DEX					;$B3ED03
	DEX					;$B3ED04
	BPL CODE_B3ECFB				;$B3ED05
	LDX #$0040				;$B3ED07
	LDA #$005C				;$B3ED0A
	STA $7EA15A,x				;$B3ED0D
	LDA #$A1EA				;$B3ED11
	STA $7EA15B,x				;$B3ED14
	INX					;$B3ED18
	INX					;$B3ED19
	INX					;$B3ED1A
CODE_B3ED1B:
	LDA #$0090				;$B3ED1B
	STA $7EA15A,x				;$B3ED1E
	LDA #$A1EA				;$B3ED22
	STA $7EA15B,x				;$B3ED25
	INX					;$B3ED29
	INX					;$B3ED2A
	INX					;$B3ED2B
	CPX #$0073				;$B3ED2C
	BNE CODE_B3ED1B				;$B3ED2F
	%pea_shift_dbr($80B300)			;$B3ED31
	PLB					;$B3ED34
	LDY #$0000				;$B3ED35
	LDX #$0000				;$B3ED38
CODE_B3ED3B:
	LDA DATA_B3ABF4,y			;$B3ED3B
	STA $7EA40A,x				;$B3ED3E
	LDA #$0000				;$B3ED42
	STA $7EA40C,x				;$B3ED45
	INY					;$B3ED49
	INY					;$B3ED4A
	INX					;$B3ED4B
	INX					;$B3ED4C
	INX					;$B3ED4D
	INX					;$B3ED4E
	CPY #$0020				;$B3ED4F
	BNE CODE_B3ED3B				;$B3ED52
	PLB					;$B3ED54
	LDA #$A44A				;$B3ED55
	STA $7EA15B				;$B3ED58
	STA $7EA15E				;$B3ED5C
	STA $7EA164				;$B3ED60
	STA $7EA167				;$B3ED64
	STA $7EA16A				;$B3ED68
	STA $7EA16D				;$B3ED6C
	STA $7EA170				;$B3ED70
	STA $7EA173				;$B3ED74
	LDA #$A4BA				;$B3ED78
	STA $7EA20B				;$B3ED7B
	LDA #$A4BE				;$B3ED7F
	STA $7EA20E				;$B3ED82
	LDA #$A52A				;$B3ED86
	STA $7EA211				;$B3ED89
	STA $7EA214				;$B3ED8D
	LDA #$A1DA				;$B3ED91
	STA $7EA217				;$B3ED94
	LDA #$A402				;$B3ED98
	STA $7EA21A				;$B3ED9B
	LDA #$A40A				;$B3ED9F
	STA $7EA21D				;$B3EDA2
	STA $7EA220				;$B3EDA6
	STA $7EA223				;$B3EDAA
	STA $7EA226				;$B3EDAE
	STA $7EA229				;$B3EDB2
	SEP #$20				;$B3EDB6
	LDA #$90				;$B3EDB8
	STA $7EA163				;$B3EDBA
	STA $7EA166				;$B3EDBE
	STA $7EA169				;$B3EDC2
	STA $7EA16C				;$B3EDC6
	STA $7EA16F				;$B3EDCA
	STA $7EA172				;$B3EDCE
	STA $7EA21F				;$B3EDD2
	STA $7EA222				;$B3EDD6
	STA $7EA225				;$B3EDDA
	STA $7EA228				;$B3EDDE
	LDA #$00				;$B3EDE2
	STA $7EA175				;$B3EDE4
	STA $7EA22B				;$B3EDE8
	LDA #$84				;$B3EDEC
	STA $7EA216				;$B3EDEE
	LDA #$20				;$B3EDF2
	STA $7EA219				;$B3EDF4
	LDX #$3200				;$B3EDF8
	STX HDMA[$01].settings			;$B3EDFB
	LDX #$7EA46A				;$B3EDFE
	STX HDMA[$01].source_word		;$B3EE01
	LDA #$7EA46A>>16			;$B3EE04
	STA HDMA[$01].source_bank		;$B3EE06
	STA HDMA[$01].indirect_source_bank	;$B3EE09
	LDX #$0F42 				;$B3EE0C
	STX HDMA[$02].settings			;$B3EE0F
	LDX #$7EA15A				;$B3EE12
	STX HDMA[$02].source_word		;$B3EE15
	LDA #$7EA15A>>16			;$B3EE18
	STA HDMA[$02].source_bank		;$B3EE1A
	STA HDMA[$02].indirect_source_bank	;$B3EE1D
	LDX #$1142				;$B3EE20
	STX HDMA[$03].settings			;$B3EE23
	LDX #$7EA19A				;$B3EE26
	STX HDMA[$03].source_word		;$B3EE29
	LDA #$7EA19A>>16			;$B3EE2C
	STA HDMA[$03].source_bank		;$B3EE2E
	STA HDMA[$03].indirect_source_bank	;$B3EE31
	LDX #$2C01 				;$B3EE34
	STX HDMA[$04].settings			;$B3EE37
	LDX #$7EA478				;$B3EE3A
	STX HDMA[$04].source_word		;$B3EE3D
	LDA #$7EA478>>16			;$B3EE40
	STA HDMA[$04].source_bank		;$B3EE42
	STA HDMA[$04].indirect_source_bank	;$B3EE45
	LDX #$3001				;$B3EE48
	STX HDMA[$05].settings			;$B3EE4B
	LDX #$7EA48C				;$B3EE4E
	STX HDMA[$05].source_word		;$B3EE51
	LDA #$7EA48C>>16			;$B3EE54
	STA HDMA[$05].source_bank		;$B3EE56
	STA HDMA[$05].indirect_source_bank	;$B3EE59
	LDX #$2103				;$B3EE5C
	STX HDMA[$06].settings			;$B3EE5F
	LDX #$7EA49C				;$B3EE62
	STX HDMA[$06].source_word		;$B3EE65
	LDA #$7EA49C>>16			;$B3EE68
	STA HDMA[$06].source_bank		;$B3EE6A
	STA HDMA[$06].indirect_source_bank	;$B3EE6D
	LDX #$0D43 				;$B3EE70
	STX HDMA[$07].settings			;$B3EE73
	LDX #$7EA20A				;$B3EE76
	STX HDMA[$07].source_word		;$B3EE79
	LDA #$7EA20A>>16			;$B3EE7C
	STA HDMA[$07].source_bank		;$B3EE7E
	STA HDMA[$07].indirect_source_bank	;$B3EE81
	REP #$20				;$B3EE84
	LDA #$FE01				;$B3EE86
	STA $04E4				;$B3EE89
	RTS					;$B3EE8C

DATA_B3EE8D:
	db $30,$E0,$30,$E0,$7F,$E6,$0E,$E6,$01,$E0,$01,$E0,$00

DATA_B3EE9A:
	db $30,$16,$01,$3F,$16,$01,$13,$13,$06,$13,$01,$16,$01,$00,$13,$00

DATA_B3EEAA:
	db $30,$02,$24,$3F,$02,$24,$10,$02,$21,$10,$02,$21,$01,$02,$20,$00

DATA_B3EEBA:
	db $40,$00,$00,$00,$00,$40,$00,$00,$00,$00,$78,$00,$00,$C6,$18,$01
	db $00,$00,$60,$18,$00

CODE_B3EECF:
	JSR CODE_B3ECB9				;$B3EECF
	LDA #$7864				;$B3EED2
	STA $7EA16A				;$B3EED5
	STA $7EA16C				;$B3EED9
	LDA #$7464				;$B3EEDD
	STA $7EA16E				;$B3EEE0
	LDA #$0006				;$B3EEE4
	STA $7EA171				;$B3EEE7
	STA $7EA176				;$B3EEEB
	LDA #$0004				;$B3EEEF
	STA $7EA17B				;$B3EEF2
	LDA #$2020				;$B3EEF6
	STA.w PPU.color_math			;$B3EEF9
	STA $7EA173				;$B3EEFC
	STA $7EA178				;$B3EF00
	LDA #$2220				;$B3EF04
	STA $7EA17D				;$B3EF07
	LDA #$001F				;$B3EF0B
	STA $7EA167				;$B3EF0E
	LDA #$4464				;$B3EF12
	STA $7EA18A				;$B3EF15
	STA $7EA18C				;$B3EF19
	LDA #$4664				;$B3EF1D
	STA $7EA18E				;$B3EF20
	SEP #$20				;$B3EF24
	LDA #$64				;$B3EF26
	STA $7EA170				;$B3EF28
	STA $7EA175				;$B3EF2C
	STA $7EA17A				;$B3EF30
	STA $7EA15A				;$B3EF34
	STA $7EA15F				;$B3EF38
	LDA #$01				;$B3EF3C
	STA $7EA164				;$B3EF3E
	DEC					;$B3EF42
	STA $7EA169				;$B3EF43
	LDX #$0F03				;$B3EF47
	STX HDMA[$01].settings			;$B3EF4A
	LDX #$7EA15A				;$B3EF4D
	STX HDMA[$01].source_word		;$B3EF50
	LDA #$7EA15A>>16			;$B3EF53
	STA HDMA[$01].source_bank		;$B3EF55
	STA HDMA[$01].indirect_source_bank	;$B3EF58
	LDX #$0800				;$B3EF5B
	STX HDMA[$02].settings			;$B3EF5E
	LDX #$7EA16A				;$B3EF61
	STX HDMA[$02].source_word		;$B3EF64
	LDA #$7EA16A>>16			;$B3EF67
	STA HDMA[$02].source_bank		;$B3EF69
	STA HDMA[$02].indirect_source_bank	;$B3EF6C
	LDX #$2E04				;$B3EF6F
	STX HDMA[$03].settings			;$B3EF72
	LDX #$7EA170				;$B3EF75
	STX HDMA[$03].source_word		;$B3EF78
	LDA #$7EA170>>16			;$B3EF7B
	STA HDMA[$03].source_bank		;$B3EF7D
	STA HDMA[$03].indirect_source_bank	;$B3EF80
	LDX #$3200				;$B3EF83
	STX HDMA[$04].settings			;$B3EF86
	LDX #$7EA18A				;$B3EF89
	STX HDMA[$04].source_word		;$B3EF8C
	LDA #$7EA18A>>16			;$B3EF8F
	STA HDMA[$04].source_bank		;$B3EF91
	STA HDMA[$04].indirect_source_bank	;$B3EF94
	REP #$20				;$B3EF97
	LDA #$1E01				;$B3EF99
	STA $04E4				;$B3EF9C
	RTS					;$B3EF9F

CODE_B3EFA0:
	JSR CODE_B3ECB9				;$B3EFA0
	LDA #$7864				;$B3EFA3
	STA $7EA16A				;$B3EFA6
	STA $7EA16C				;$B3EFAA
	LDA #$7464				;$B3EFAE
	STA $7EA16E				;$B3EFB1
	LDA #$0006				;$B3EFB5
	STA $7EA171				;$B3EFB8
	STA $7EA176				;$B3EFBC
	LDA #$0004				;$B3EFC0
	STA $7EA17B				;$B3EFC3
	LDA #$2020				;$B3EFC7
	STA.w PPU.color_math			;$B3EFCA
	STA $7EA173				;$B3EFCD
	STA $7EA178				;$B3EFD1
	LDA #$2220				;$B3EFD5
	STA $7EA17D				;$B3EFD8
	LDA #$001F				;$B3EFDC
	STA $7EA167				;$B3EFDF
	LDA #$4464				;$B3EFE3
	STA $7EA18A				;$B3EFE6
	STA $7EA18C				;$B3EFEA
	LDA #$4664				;$B3EFEE
	STA $7EA18E				;$B3EFF1
	SEP #$20				;$B3EFF5
	LDA #$64				;$B3EFF7
	STA $7EA170				;$B3EFF9
	STA $7EA175				;$B3EFFD
	STA $7EA17A				;$B3F001
	STA $7EA15A				;$B3F005
	STA $7EA15F				;$B3F009
	LDA #$01				;$B3F00D
	STA $7EA164				;$B3F00F
	DEC					;$B3F013
	STA $7EA169				;$B3F014
	LDX #$0F03				;$B3F018
	STX HDMA[$01].settings			;$B3F01B
	LDX #$7EA15A				;$B3F01E
	STX HDMA[$01].source_word		;$B3F021
	LDA #$7EA15A>>16			;$B3F024
	STA HDMA[$01].source_bank		;$B3F026
	STA HDMA[$01].indirect_source_bank	;$B3F029
	LDX #$0800				;$B3F02C
	STX HDMA[$02].settings			;$B3F02F
	LDX #$7EA16A				;$B3F032
	STX HDMA[$02].source_word		;$B3F035
	LDA #$7EA16A>>16			;$B3F038
	STA HDMA[$02].source_bank		;$B3F03A
	STA HDMA[$02].indirect_source_bank	;$B3F03D
	LDX #$2E04				;$B3F040
	STX HDMA[$03].settings			;$B3F043
	LDX #$7EA170				;$B3F046
	STX HDMA[$03].source_word		;$B3F049
	LDA #$7EA170>>16			;$B3F04C
	STA HDMA[$03].source_bank		;$B3F04E
	STA HDMA[$03].indirect_source_bank	;$B3F051
	LDX #$3200				;$B3F054
	STX HDMA[$04].settings			;$B3F057
	LDX #$7EA18A				;$B3F05A
	STX HDMA[$04].source_word		;$B3F05D
	LDA #$7EA18A>>16			;$B3F060
	STA HDMA[$04].source_bank		;$B3F062
	STA HDMA[$04].indirect_source_bank	;$B3F065
	REP #$20				;$B3F068
	LDA #$0001				;$B3F06A
	STA $04E4				;$B3F06D
	RTS					;$B3F070

CODE_B3F071:
	JSR CODE_B3ECB9				;$B3F071
	LDA #$1617				;$B3F074
	STA $7EA15A				;$B3F077
	LDA #$00C0				;$B3F07B
	STA $7EA16A				;$B3F07E
	LDA #$A27A				;$B3F082
	STA $7EA16B				;$B3F085
	LDA #$00C0				;$B3F089
	STA $7EA16D				;$B3F08C
	LDA #$A2FA				;$B3F090
	STA $7EA16E				;$B3F093
	LDA #$0001				;$B3F097
	STA $7EA170				;$B3F09A
	LDA #$A378				;$B3F09E
	STA $7EA171				;$B3F0A1
	LDA #$0000				;$B3F0A5
	STA $7EA173				;$B3F0A8
	LDA #$2140				;$B3F0AC
	STA $7EA37A				;$B3F0AF
	LDA #$213F				;$B3F0B3
	STA $7EA37C				;$B3F0B6
	LDA #$2001				;$B3F0BA
	STA $7EA37E				;$B3F0BD
	LDA #$0000				;$B3F0C1
	STA $7EA380				;$B3F0C4
	LDA #$00C0				;$B3F0C8
	STA $7EA38A				;$B3F0CB
	LDA #$A39A				;$B3F0CF
	STA $7EA38B				;$B3F0D2
	LDA #$00DF				;$B3F0D6
	STA $7EA38D				;$B3F0D9
	LDA #$A496				;$B3F0DD
	STA $7EA38E				;$B3F0E0
	LDA #$0001				;$B3F0E4
	STA $7EA390				;$B3F0E7
	LDA #$A79A				;$B3F0EB
	STA $7EA391				;$B3F0EE
	LDA #$0000				;$B3F0F2
	STA $7EA393				;$B3F0F5
	PHK					;$B3F0F9
	PLB					;$B3F0FA
	LDX #$03FC				;$B3F0FB
CODE_B3F0FE:
	LDA #$7373				;$B3F0FE
	STA $7EA39A,x				;$B3F101
	TXA					;$B3F105
	LSR					;$B3F106
	LSR					;$B3F107
	AND #$001E				;$B3F108
	TAY					;$B3F10B
	LDA DATA_B3F184,y			;$B3F10C
	STA $7EA39C,x				;$B3F10F
	DEX					;$B3F113
	DEX					;$B3F114
	DEX					;$B3F115
	DEX					;$B3F116
	BPL CODE_B3F0FE				;$B3F117
	LDA #$7373				;$B3F119
	STA $7EA79A				;$B3F11C
	LDA #$3DF4				;$B3F120
	STA $7EA79C				;$B3F123
	SEP #$20				;$B3F127
	LDX #$2C40				;$B3F129
	STX HDMA[$01].settings			;$B3F12C
	LDX #DATA_B3F1A4			;$B3F12F
	STX HDMA[$01].source_word		;$B3F132
	LDA #DATA_B3F1A4>>16			;$B3F135
	STA HDMA[$01].source_bank		;$B3F137
	LDA #$7EA15A>>16			;$B3F13A
	STA HDMA[$01].indirect_source_bank	;$B3F13C
	LDX #$3100				;$B3F13F
	STX HDMA[$02].settings			;$B3F142
	LDX #$7EA37A				;$B3F145
	STX HDMA[$02].source_word		;$B3F148
	LDA #$7EA37A>>16			;$B3F14B
	STA HDMA[$02].source_bank		;$B3F14D
	STA HDMA[$02].indirect_source_bank	;$B3F150
	LDX #$2143				;$B3F153
	STX HDMA[$03].settings			;$B3F156
	LDX #$7EA38A				;$B3F159
	STX HDMA[$03].source_word		;$B3F15C
	LDA #$7EA38A>>16			;$B3F15F
	STA HDMA[$03].source_bank		;$B3F161
	STA HDMA[$03].indirect_source_bank	;$B3F164
	LDX #$0D42 				;$B3F167
	STX HDMA[$04].settings			;$B3F16A
	LDX #$7EA16A				;$B3F16D
	STX HDMA[$04].source_word		;$B3F170
	LDA #$7EA16A>>16			;$B3F173
	STA HDMA[$04].source_bank		;$B3F175
	STA HDMA[$04].indirect_source_bank	;$B3F178
	REP #$20				;$B3F17B
	LDA #$1E01				;$B3F17D
	STA $04E4				;$B3F180
	RTS					;$B3F183

DATA_B3F184:
	db $00,$00,$21,$04,$42,$08,$63,$0C,$84,$10,$A5,$14,$C6,$18,$E7,$1C
	db $08,$21,$E7,$1C,$C6,$18,$A5,$14,$84,$10,$63,$0C,$42,$08,$21,$04


;Missing terminator byte
DATA_B3F1A4:
	db $50 : dw $7EA15A
	db $50 : dw $7EA15A
	db $7F : dw $7EA15B

CODE_B3F1AD:
	JSR CODE_B3ECB9				;$B3F1AD
	STZ $18A5				;$B3F1B0
	LDX #$0000				;$B3F1B3
CODE_B3F1B6:
	LDA #$0090				;$B3F1B6
	STA $7EA4CA,x				;$B3F1B9
	LDA #$A52A				;$B3F1BD
	STA $7EA4CB,x				;$B3F1C0
	INX					;$B3F1C4
	INX					;$B3F1C5
	INX					;$B3F1C6
	CPX #$002A				;$B3F1C7
	BNE CODE_B3F1B6				;$B3F1CA
	SEP #$20				;$B3F1CC
	LDX #$2143				;$B3F1CE
	STX HDMA[$01].settings			;$B3F1D1
	LDX #$7EA15A				;$B3F1D4
	STX HDMA[$01].source_word		;$B3F1D7
	LDA #$7EA15A>>16			;$B3F1DA
	STA HDMA[$01].source_bank		;$B3F1DC
	LDA #DATA_B3F23F>>16			;$B3F1DF
	STA HDMA[$01].indirect_source_bank	;$B3F1E1
	LDX #$2143				;$B3F1E4
	STX HDMA[$02].settings			;$B3F1E7
	LDX #$7EA17A				;$B3F1EA
	STX HDMA[$02].source_word		;$B3F1ED
	LDA #$7EA17A>>16			;$B3F1F0
	STA HDMA[$02].source_bank		;$B3F1F2
	LDA #DATA_B3F527>>16			;$B3F1F5
	STA HDMA[$02].indirect_source_bank	;$B3F1F7
	LDX #$2641				;$B3F1FA
	STX HDMA[$03].settings			;$B3F1FD
	LDX #$7EA19A				;$B3F200
	STX HDMA[$03].source_word		;$B3F203
	LDA #$7EA19A>>16			;$B3F206
	STA HDMA[$03].source_bank		;$B3F208
	STA HDMA[$03].indirect_source_bank	;$B3F20B
	LDX #$1142				;$B3F20E
	STX HDMA[$04].settings			;$B3F211
	LDX #$7EA1BA				;$B3F214
	STX HDMA[$04].source_word		;$B3F217
	LDA #$7EA1BA>>16			;$B3F21A
	STA HDMA[$04].source_bank		;$B3F21C
	STA HDMA[$04].indirect_source_bank	;$B3F21F
	LDX #$1242				;$B3F222
	STX HDMA[$05].settings			;$B3F225
	LDX #$7EA4CA				;$B3F228
	STX HDMA[$05].source_word		;$B3F22B
	LDA #$7EA4CA>>16			;$B3F22E
	STA HDMA[$05].source_bank		;$B3F230
	STA HDMA[$05].indirect_source_bank	;$B3F233
	REP #$20				;$B3F236
	LDA #$3E01				;$B3F238
	STA $04E4				;$B3F23B
	RTS					;$B3F23E

DATA_B3F23F:
	dw $0F0F,$3B9C,$0D0D,$2ED6,$0A0A,$2652,$0707,$1DEF
	dw $0505,$0CE7,$0202,$0463,$0F0F,$377B,$0D0D,$2AB5
	dw $0A0A,$2652,$0707,$1DCE,$0505,$0CE7,$0202,$0463
	dw $0F0F,$375A,$0D0D,$2AB5,$0A0A,$2231,$0707,$1DCE
	dw $0505,$0CE7,$0202,$0463,$0F0F,$3339,$0D0D,$2A94
	dw $0A0A,$2210,$0707,$19AD,$0505,$0CC6,$0202,$0463
	dw $0F0F,$3318,$0D0D,$2673,$0A0A,$2210,$0707,$19AD
	dw $0505,$0CC6,$0202,$0463,$0F0F,$2EF7,$0D0D,$2652
	dw $0A0A,$1DEF,$0707,$198C,$0505,$0CC6,$0202,$0463
	dw $0F0F,$2ED6,$0D0D,$2652,$0A0A,$1DEF,$0707,$198C
	dw $0505,$0CC6,$0202,$0463,$0F0F,$2AB5,$0D0D,$2231
	dw $0A0A,$1DCE,$0707,$156B,$0505,$08A5,$0202,$0442
	dw $0F0F,$2A94,$0D0D,$2210,$0A0A,$19AD,$0707,$156B
	dw $0505,$08A5,$0202,$0442,$0F0F,$2673,$0D0D,$1DEF
	dw $0A0A,$19AD,$0707,$154A,$0505,$08A5,$0202,$0442
	dw $0F0F,$2652,$0D0D,$1DEF,$0A0A,$198C,$0707,$154A
	dw $0505,$08A5,$0202,$0442,$0F0F,$2231,$0D0D,$1DCE
	dw $0A0A,$156B,$0707,$1129,$0505,$0884,$0202,$0442
	dw $0F0F,$2210,$0D0D,$19AD,$0A0A,$156B,$0707,$1129
	dw $0505,$0884,$0202,$0442,$0F0F,$1DEF,$0D0D,$198C
	dw $0A0A,$154A,$0707,$1108,$0505,$0884,$0202,$0442
	dw $0F0F,$1DEF,$0D0D,$198C,$0A0A,$154A,$0707,$1108
	dw $0505,$0884,$0202,$0442,$0F0F,$1DCE,$0D0D,$156B
	dw $0A0A,$1129,$0707,$0CE7,$0505,$0463,$0202,$0021
	dw $0F0F,$19AD,$0D0D,$154A,$0A0A,$1108,$0707,$0CE7
	dw $0505,$0463,$0202,$0021,$0F0F,$198C,$0D0D,$1129
	dw $0A0A,$1108,$0707,$0CC6,$0505,$0463,$0202,$0021
	dw $0F0F,$156B,$0D0D,$1129,$0A0A,$0CE7,$0707,$0CC6
	dw $0505,$0463,$0202,$0021,$0F0F,$154A,$0D0D,$1108
	dw $0A0A,$0CC6,$0707,$08A5,$0505,$0442,$0202,$0021
	dw $0F0F,$1129,$0D0D,$0CE7,$0A0A,$0CC6,$0707,$08A5
	dw $0505,$0442,$0202,$0021,$0F0F,$1108,$0D0D,$0CC6
	dw $0A0A,$08A5,$0707,$0884,$0505,$0442,$0202,$0021
	dw $0F0F,$0CE7,$0D0D,$0CC6,$0A0A,$08A5,$0707,$0884
	dw $0505,$0442,$0202,$0021,$0F0F,$0CC6,$0D0D,$08A5
	dw $0A0A,$0884,$0707,$0463,$0505,$0021,$0202,$0000
	dw $0F0F,$08A5,$0D0D,$0884,$0A0A,$0463,$0707,$0463
	dw $0505,$0021,$0202,$0000,$0F0F,$0884,$0D0D,$0463
	dw $0A0A,$0463,$0707,$0442,$0505,$0021,$0202,$0000
	dw $0F0F,$0463,$0D0D,$0463,$0A0A,$0442,$0707,$0442
	dw $0505,$0021,$0202,$0000,$0F0F,$0442,$0D0D,$0442
	dw $0A0A,$0021,$0707,$0021,$0505,$0000,$0202,$0000
	dw $0F0F,$0021,$0D0D,$0021,$0A0A,$0021,$0707,$0021
	dw $0505,$0000,$0202,$0000,$0F0F,$0000,$0D0D,$0000
	dw $0A0A,$0000,$0707,$0000,$0505,$0000,$0202,$0000
	dw $0F0F,$0000,$0D0D,$0000,$0A0A,$0000,$0707,$0000
	dw $0505,$0000,$0202,$0000

DATA_B3F527:
	dw $0E0E,$375A,$0B0B,$2ED6,$0909,$1DEF,$0606,$156B
	dw $0303,$0CE7,$0101,$0021,$0E0E,$3339,$0B0B,$2AB5
	dw $0909,$1DCE,$0606,$154A,$0303,$0CE7,$0101,$0021
	dw $0E0E,$3318,$0B0B,$2AB5,$0909,$1DCE,$0606,$154A
	dw $0303,$0CE7,$0101,$0021,$0E0E,$2EF7,$0B0B,$2A94
	dw $0909,$19AD,$0606,$154A,$0303,$0CC6,$0101,$0021
	dw $0E0E,$2ED6,$0B0B,$2673,$0909,$19AD,$0606,$1129
	dw $0303,$0CC6,$0101,$0021,$0E0E,$2AB5,$0B0B,$2652
	dw $0909,$198C,$0606,$1129,$0303,$0CC6,$0101,$0021
	dw $0E0E,$2AB5,$0B0B,$2652,$0909,$198C,$0606,$1129
	dw $0303,$0CC6,$0101,$0021,$0E0E,$2A94,$0B0B,$2231
	dw $0909,$156B,$0606,$1108,$0303,$08A5,$0101,$0021
	dw $0E0E,$2673,$0B0B,$2210,$0909,$156B,$0606,$1108
	dw $0303,$08A5,$0101,$0021,$0E0E,$2652,$0B0B,$1DEF
	dw $0909,$154A,$0606,$0CE7,$0303,$08A5,$0101,$0021
	dw $0E0E,$2231,$0B0B,$1DEF,$0909,$154A,$0606,$0CE7
	dw $0303,$08A5,$0101,$0021,$0E0E,$2210,$0B0B,$1DCE
	dw $0909,$1129,$0606,$0CE7,$0303,$0884,$0101,$0021
	dw $0E0E,$1DEF,$0B0B,$19AD,$0909,$1129,$0606,$0CC6
	dw $0303,$0884,$0101,$0021,$0E0E,$1DCE,$0B0B,$198C
	dw $0909,$1108,$0606,$0CC6,$0303,$0884,$0101,$0021
	dw $0E0E,$1DCE,$0B0B,$198C,$0909,$1108,$0606,$0CC6
	dw $0303,$0884,$0101,$0021,$0E0E,$19AD,$0B0B,$156B
	dw $0909,$0CE7,$0606,$08A5,$0303,$0463,$0101,$0000
	dw $0E0E,$198C,$0B0B,$154A,$0909,$0CE7,$0606,$08A5
	dw $0303,$0463,$0101,$0000,$0E0E,$156B,$0B0B,$1129
	dw $0909,$0CC6,$0606,$0884,$0303,$0463,$0101,$0000
	dw $0E0E,$154A,$0B0B,$1129,$0909,$0CC6,$0606,$0884
	dw $0303,$0463,$0101,$0000,$0E0E,$1129,$0B0B,$1108
	dw $0909,$08A5,$0606,$0884,$0303,$0442,$0101,$0000
	dw $0E0E,$1108,$0B0B,$0CE7,$0909,$08A5,$0606,$0463
	dw $0303,$0442,$0101,$0000,$0E0E,$0CE7,$0B0B,$0CC6
	dw $0909,$0884,$0606,$0463,$0303,$0442,$0101,$0000
	dw $0E0E,$0CE7,$0B0B,$0CC6,$0909,$0884,$0606,$0463
	dw $0303,$0442,$0101,$0000,$0E0E,$0CC6,$0B0B,$08A5
	dw $0909,$0463,$0606,$0442,$0303,$0021,$0101,$0000
	dw $0E0E,$08A5,$0B0B,$0884,$0909,$0463,$0606,$0442
	dw $0303,$0021,$0101,$0000,$0E0E,$0884,$0B0B,$0463
	dw $0909,$0442,$0606,$0021,$0303,$0021,$0101,$0000
	dw $0E0E,$0463,$0B0B,$0463,$0909,$0442,$0606,$0021
	dw $0303,$0021,$0101,$0000,$0E0E,$0442,$0B0B,$0442
	dw $0909,$0021,$0606,$0021,$0303,$0000,$0101,$0000
	dw $0E0E,$0021,$0B0B,$0021,$0909,$0021,$0606,$0000
	dw $0303,$0000,$0101,$0000,$0E0E,$0000,$0B0B,$0000
	dw $0909,$0000,$0606,$0000,$0303,$0000,$0101,$0000
	dw $0E0E,$0000,$0B0B,$0000,$0909,$0000,$0606,$0000
	dw $0303,$0000,$0101,$0000

CODE_B3F80F:
	LDA #$1100				;$B3F80F
	STA $80					;$B3F812
	LDA #$007F				;$B3F814
	STA $7EA15A				;$B3F817
	STA $7EA15D				;$B3F81B
	STA $7EA1EA				;$B3F81F
	STA $7EA1ED				;$B3F823
	LDA #$A1DE				;$B3F827
	STA $7EA15B				;$B3F82A
	STA $7EA15E				;$B3F82E
	LDA #$009D				;$B3F832
	STA $7EA160				;$B3F835
	LDA #$A16A				;$B3F839
	STA $7EA161				;$B3F83C
	LDA #$0000				;$B3F840
	STA $7EA163				;$B3F843
	LDA #$FF00				;$B3F847
	STA $7EA1DA				;$B3F84A
	STA $7EA1E4				;$B3F84E
	XBA					;$B3F852
	STA $7EA1DC				;$B3F853
	STA $7EA1DE				;$B3F857
	STA $7EA1E0				;$B3F85B
	STA $7EA1E2				;$B3F85F
	LDA #$009D				;$B3F863
	STA $7EA1F0				;$B3F866
	LDA #$A218				;$B3F86A
	STA $7EA1EB				;$B3F86D
	STA $7EA1EE				;$B3F871
	LDA #$A1FA				;$B3F875
	STA $7EA1F1				;$B3F878
	LDX #$0000				;$B3F87C
	LDA #$000A				;$B3F87F
CODE_B3F882:
	STA $7EA1FA,x				;$B3F882
	INX					;$B3F886
	CPX #$001D				;$B3F887
	BNE CODE_B3F882				;$B3F88A
	LDA #$0000				;$B3F88C
	STA $7EA1FA,x				;$B3F88F
	LDA #$000A				;$B3F893
	STA $7EA1FB,x				;$B3F896
	LDA #$00C0				;$B3F89A
	STA $7EA21A				;$B3F89D
	STA $7EA21D				;$B3F8A1
	STA $7EA220				;$B3F8A5
	STA $7EA223				;$B3F8A9
	LDA #$A22A				;$B3F8AD
	STA $7EA21B				;$B3F8B0
	STA $7EA21E				;$B3F8B4
	STA $7EA221				;$B3F8B8
	STA $7EA224				;$B3F8BC
	LDX #$0000				;$B3F8C0
CODE_B3F8C3:
	TXA					;$B3F8C3
	LSR					;$B3F8C4
	AND #$0003				;$B3F8C5
	STA $1A					;$B3F8C8
	TXA					;$B3F8CA
	LSR					;$B3F8CB
	AND #$0060				;$B3F8CC
	LSR					;$B3F8CF
	LSR					;$B3F8D0
	LSR					;$B3F8D1
	ORA $1A					;$B3F8D2
	ORA #$2000				;$B3F8D4
	STA $7EA35A,x				;$B3F8D7
	INX					;$B3F8DB
	INX					;$B3F8DC
	CPX #$0800				;$B3F8DD
	BNE CODE_B3F8C3				;$B3F8E0
	SEP #$20				;$B3F8E2
	LDX #$2644				;$B3F8E4
	STX HDMA[$01].settings			;$B3F8E7
	LDX #$7EA15A				;$B3F8EA
	STX HDMA[$01].source_word		;$B3F8ED
	LDA #$7EA15A>>16			;$B3F8F0
	STA HDMA[$01].source_bank		;$B3F8F2
	STA HDMA[$01].indirect_source_bank	;$B3F8F5
	LDX #$2440				;$B3F8F8
	STX HDMA[$02].settings			;$B3F8FB
	LDX #$7EA1EA				;$B3F8FE
	STX HDMA[$02].source_word		;$B3F901
	LDA #$7EA1EA>>16			;$B3F904
	STA HDMA[$02].source_bank		;$B3F906
	STA HDMA[$02].indirect_source_bank	;$B3F909
	LDX #$1142				;$B3F90C
	STX HDMA[$03].settings			;$B3F90F
	LDX #$7EA21A				;$B3F912
	STX HDMA[$03].source_word		;$B3F915
	LDA #$7EA21A>>16			;$B3F918
	STA HDMA[$03].source_bank		;$B3F91A
	STA HDMA[$03].indirect_source_bank	;$B3F91D
	REP #$20				;$B3F920
	LDA #$0E01				;$B3F922
	STA $04E4				;$B3F925
	RTS					;$B3F928

CODE_B3F929:
	JSR CODE_B3ECBF				;$B3F929
	LDA #$1300				;$B3F92C
	STA $80					;$B3F92F
	LDA #$0400				;$B3F931
	TRB $04E4				;$B3F934
	RTS					;$B3F937
