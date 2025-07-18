
set_sprite_animation:
	JMP.w CODE_B9A0BA			;$B9A000

set_alt_sprite_animation:
	JMP.w CODE_B9A078			;$B9A003

process_sprite_animation:
	JMP.w CODE_B9A101			;$B9A006

set_anim_handle_kiddy:
	JMP.w set_anim_handle_kiddy_direct	;$B9A009

process_anim_preserve_state:
	JMP.w CODE_B9A0E2			;$B9A00C

set_anim_handle_animal:
	JMP.w CODE_B9A01E			;$B9A00F

set_riding_kong_anim_handle_kiddy:
	JMP.w CODE_B9A035			;$B9A012

set_anim_handle_animal_and_kiddy:
	JMP.w CODE_B9A067			;$B9A015

set_anim_once_handle_kiddy:
	JMP.w CODE_B9A089			;$B9A018

set_inactive_kong_anim_handle_kiddy:
	JMP.w CODE_B9A091			;$B9A01B

CODE_B9A01E:
	STA.b $3E				;$B9A01E
	LDY.b current_sprite			;$B9A020
	LDA.w $0000,y				;$B9A022
	SEC					;$B9A025
	SBC.w #!animal_sprite_type_range_start 	;$B9A026
	LSR					;$B9A029
	TAX					;$B9A02A
	LDA.l DATA_B9B1BB,x			;$B9A02B
	CLC					;$B9A02F
	ADC.b $3E				;$B9A030
	BRL.w CODE_B9A0BA			;$B9A032

CODE_B9A035:
	STA.b $3E				;$B9A035
	LDX.w $04FB				;$B9A037
	STX current_kong_control_variables	;$B9A03A
	LDA.b $00,x				;$B9A03C
	PHX					;$B9A03E
	PHA					;$B9A03F
	LDA.b current_sprite			;$B9A040
	PHA					;$B9A042
	LDY.b current_mount			;$B9A043
	BEQ.b CODE_B9A05D			;$B9A045
	STY.b current_sprite			;$B9A047
	LDA.w $0000,y				;$B9A049
	SEC					;$B9A04C
	SBC.w #!animal_sprite_type_range_start 	;$B9A04D
	LSR					;$B9A050
	TAX					;$B9A051
	LDA.l DATA_B9B1B3,x			;$B9A052
	CLC					;$B9A056
	ADC.b $3E				;$B9A057
	JSL.l set_anim_handle_kiddy_direct	;$B9A059
CODE_B9A05D:
	PLA					;$B9A05D
	STA.b current_sprite			;$B9A05E
	PLA					;$B9A060
	PLX					;$B9A061
	STA.b $00,x				;$B9A062
	LDX.b current_sprite			;$B9A064
	RTL					;$B9A066

CODE_B9A067:
	TAY					;$B9A067
	LDA.b current_animal_type		;$B9A068
	SEC					;$B9A06A
	SBC.w #!animal_sprite_type_range_start 	;$B9A06B
	LSR					;$B9A06E
	TAX					;$B9A06F
	TYA					;$B9A070
	CLC					;$B9A071
	ADC.l DATA_B9B1BB,x			;$B9A072
	BRA.b set_anim_handle_kiddy_direct	;$B9A076

CODE_B9A078:
	LDX.b current_sprite			;$B9A078
	STX.b $6E				;$B9A07A
	LDX.b alternate_sprite			;$B9A07C
	STX.b current_sprite			;$B9A07E
	JSL.l CODE_B9A0BA			;$B9A080
	LDX.b $6E				;$B9A084
	STX.b current_sprite			;$B9A086
	RTL					;$B9A088

CODE_B9A089:
	LDY current_kong_control_variables	;$B9A089
	CMP.w $0000,y				;$B9A08B
	BNE.b set_anim_handle_kiddy_direct	;$B9A08E
	RTL					;$B9A090

CODE_B9A091:
	LDX.b current_sprite			;$B9A091
	LDY current_kong_control_variables	;$B9A093
	PHX					;$B9A095
	PHY					;$B9A096
	LDX.w follower_kong_sprite		;$B9A097
	LDY.w $04FF				;$B9A09A
	STX.b current_sprite			;$B9A09D
	STY current_kong_control_variables	;$B9A09F
	JSL.l set_anim_handle_kiddy_direct	;$B9A0A1
	PLY					;$B9A0A5
	PLX					;$B9A0A6
	STX.b current_sprite			;$B9A0A7
	STY current_kong_control_variables	;$B9A0A9
	RTL					;$B9A0AB

set_anim_handle_kiddy_direct:
	LDY current_kong_control_variables	;$B9A0AC
	STA.w $0000,y				;$B9A0AE
	CPY.w #$1480				;$B9A0B1
	BEQ.b CODE_B9A0BA			;$B9A0B4
	CLC					;$B9A0B6
	ADC.w #$0087				;$B9A0B7
CODE_B9A0BA:
	PHB					;$B9A0BA
	PEA.w animation_scripts_table>>8	;$B9A0BB
	PLB					;$B9A0BE
	PLB					;$B9A0BF
	LDX.b current_sprite			;$B9A0C0
	STA.b $40,x				;$B9A0C2
	ASL					;$B9A0C4
	ASL					;$B9A0C5
	TAY					;$B9A0C6
	LDA.b $4A,x				;$B9A0C7
	AND.w #$8000				;$B9A0C9
	ORA.w animation_flags_table,y		;$B9A0CC
	STA.b $4A,x				;$B9A0CF
	LDA.w animation_scripts_table,y		;$B9A0D1
	STA.b $46,x				;$B9A0D4
	TAY					;$B9A0D6
	LDA.w #$0100				;$B9A0D7
	STA.b $44,x				;$B9A0DA
	STZ.b $42,x				;$B9A0DC
	STZ.b $48,x				;$B9A0DE
	BRA.b CODE_B9A11A			;$B9A0E0

CODE_B9A0E2:
	LDX.b current_sprite			;$B9A0E2
	LDA.b $38,x				;$B9A0E4
	PHA					;$B9A0E6
	JSL.l CODE_B9A101			;$B9A0E7
	PLA					;$B9A0EB
	STA.b $38,x				;$B9A0EC
	RTL					;$B9A0EE

CODE_B9A0EF:
	LDA.b $44,x				;$B9A0EF
	LSR					;$B9A0F1
	LSR					;$B9A0F2
	SEC					;$B9A0F3
	SBC.b $44,x				;$B9A0F4
	CLC					;$B9A0F6
	ADC.b $42,x				;$B9A0F7
	STA.b $42,x				;$B9A0F9
	BEQ.b CODE_B9A112			;$B9A0FB
	BPL.b CODE_B9A13B			;$B9A0FD
	BRA.b CODE_B9A112			;$B9A0FF

CODE_B9A101:
	LDX.b current_sprite			;$B9A101
	LDA.b $F8				;$B9A103
	BNE.b CODE_B9A0EF			;$B9A105
	LDA.b $42,x				;$B9A107
	SEC					;$B9A109
	SBC.b $44,x				;$B9A10A
	STA.b $42,x				;$B9A10C
	BEQ.b CODE_B9A112			;$B9A10E
	BPL.b CODE_B9A13B			;$B9A110
CODE_B9A112:
	PHB					;$B9A112
	PEA.w animation_scripts_table>>8	;$B9A113
	PLB					;$B9A116
	PLB					;$B9A117
	LDY.b $46,x				;$B9A118
CODE_B9A11A:
	DEY					;$B9A11A
	LDA.w $0000,y				;$B9A11B
	BMI.b CODE_B9A14F			;$B9A11E
	INY					;$B9A120
	INY					;$B9A121
	AND.w #$FF00				;$B9A122
	CLC					;$B9A125
	ADC.b $42,x				;$B9A126
	STA.b $42,x				;$B9A128
	BPL.b CODE_B9A130			;$B9A12A
	INY					;$B9A12C
	INY					;$B9A12D
	BRA.b CODE_B9A11A			;$B9A12E

CODE_B9A130:
	LDA.w $0000,y				;$B9A130
	STA.b $24,x				;$B9A133
	INY					;$B9A135
	INY					;$B9A136
	TYA					;$B9A137
	STA.b $46,x				;$B9A138
CODE_B9A13A:
	PLB					;$B9A13A
CODE_B9A13B:
	LDA.b $48,x				;$B9A13B
	BNE.b CODE_B9A140			;$B9A13D
	RTL					;$B9A13F

CODE_B9A140:
	PHB					;$B9A140
	PHK					;$B9A141
	PLB					;$B9A142
	PHX					;$B9A143
	STA.b $42				;$B9A144
	PEA.w CODE_B9A14C-$01			;$B9A146
	JMP.w ($0042)				;$B9A149
CODE_B9A14C:
	PLX					;$B9A14C
	PLB					;$B9A14D
	RTL					;$B9A14E

CODE_B9A14F:
	INY					;$B9A14F
	INY					;$B9A150
	XBA					;$B9A151
	AND.w #$007F				;$B9A152
	ASL					;$B9A155
	TAX					;$B9A156
	JMP.w (DATA_B9A15A,x)			;$B9A157

DATA_B9A15A:					; Info: Animation script opcodes...
	dw CODE_B9A1A0				; $80 - 
	dw CODE_B9A1C0				; $81 - 
	dw CODE_B9A1DE				; $82 - 
	dw CODE_B9A1FD				; $83 - 
	dw CODE_B9A1E7				; $84 - 
	dw CODE_B9A226				; $85 - 
	dw CODE_B9A232				; $86 - 
	dw CODE_B9A247				; $87 - 
	dw CODE_B9A232				; $88 - 
	dw CODE_B9A247				; $89 - 
	dw CODE_B9A257				; $8A - 
	dw CODE_B9A286				; $8B - 
	dw CODE_B9A2B6				; $8C - 
	dw CODE_B9A2CE				; $8D - 
	dw CODE_B9A2DF				; $8E - 
	dw CODE_B9A2F3				; $8F - 
	dw CODE_B9A319				; $90 - 
	dw CODE_B9A33F				; $91 - 
	dw CODE_B9A354				; $92 - 
	dw CODE_B9A393				; $93 - 
	dw CODE_B9A3F8				; $94 - 
	dw CODE_B9A462				; $95 - 
	dw CODE_B9A4A5				; $96 - 
	dw CODE_B9A4E9				; $97 - 
	dw CODE_B9A52F				; $98 - 
	dw CODE_B9A589				; $99 - 
	dw CODE_B9A190				; $9A - 

CODE_B9A190:
	LDX.b current_sprite			;$B9A190
	LDA.b $40,x				;$B9A192
	ASL					;$B9A194
	ASL					;$B9A195
	TAY					;$B9A196
	LDA.w animation_scripts_table,y		;$B9A197
	STA.b $46,x				;$B9A19A
	TAY					;$B9A19C
	BRL.w CODE_B9A11A			;$B9A19D

CODE_B9A1A0:
	LDX.b current_sprite			;$B9A1A0
	LDA.w $0000,y				;$B9A1A2
	STA.b $42				;$B9A1A5
	INY					;$B9A1A7
	INY					;$B9A1A8
	PHB					;$B9A1A9
	PHK					;$B9A1AA
	PLB					;$B9A1AB
	PHY					;$B9A1AC
	JMP.w ($0042)				;$B9A1AD

CODE_B9A1B0:
	PLY					;$B9A1B0
	PLB					;$B9A1B1
	LDX.b current_sprite			;$B9A1B2
	BRL.w CODE_B9A11A			;$B9A1B4

CODE_B9A1B7:
	PLY					;$B9A1B7
	PLB					;$B9A1B8
	LDX.b current_sprite			;$B9A1B9
	STZ.b $42,x				;$B9A1BB
	BRL.w CODE_B9A13A			;$B9A1BD

CODE_B9A1C0:
	LDX.b current_sprite			;$B9A1C0
	LDA.w $0000,y				;$B9A1C2
	STA.b $42				;$B9A1C5
	INY					;$B9A1C7
	INY					;$B9A1C8
	PHY					;$B9A1C9
	PHB					;$B9A1CA
	PHK					;$B9A1CB
	PLB					;$B9A1CC
	PEA.w CODE_B9A1D3-$01			;$B9A1CD
	JMP.w ($0042)				;$B9A1D0
CODE_B9A1D3:
	PLB					;$B9A1D3
	PLY					;$B9A1D4
	BCS.b CODE_B9A1DE			;$B9A1D5
	LDX.b current_sprite			;$B9A1D7
	INY					;$B9A1D9
	INY					;$B9A1DA
	JMP.w CODE_B9A11A			;$B9A1DB

CODE_B9A1DE:
	LDX.b current_sprite			;$B9A1DE
	LDA.w $0000,y				;$B9A1E0
	TAY					;$B9A1E3
	JMP.w CODE_B9A11A			;$B9A1E4

CODE_B9A1E7:
	NOP #3					;$B9A1E7
	LDX.b current_sprite			;$B9A1EA
	LDA.w $0000,y				;$B9A1EC
	STA.b $42				;$B9A1EF
	INY					;$B9A1F1
	INY					;$B9A1F2
	LDA.w $0000,y				;$B9A1F3
	INY					;$B9A1F6
	INY					;$B9A1F7
	STY.b $46,x				;$B9A1F8
	PHY					;$B9A1FA
	BRA.b CODE_B9A209			;$B9A1FB

CODE_B9A1FD:
	LDX.b current_sprite			;$B9A1FD
	LDA.w $0000,y				;$B9A1FF
	STA.b $42				;$B9A202
	INY					;$B9A204
	INY					;$B9A205
	STY.b $46,x				;$B9A206
	PHY					;$B9A208
CODE_B9A209:
	PHB					;$B9A209
	PHK					;$B9A20A
	PLB					;$B9A20B
	PEA.w CODE_B9A212-$01			;$B9A20C
	JMP.w ($0042)				;$B9A20F
CODE_B9A212:
	PLB					;$B9A212
	PLA					;$B9A213
	LDX.b current_sprite			;$B9A214
	CMP.b $46,x				;$B9A216
	BNE.b CODE_B9A21E			;$B9A218
	TAY					;$B9A21A
	JMP.w CODE_B9A11A			;$B9A21B

CODE_B9A21E:
	JMP.w CODE_B9A13A			;$B9A21E

CODE_B9A221:
	STA.b $46,x				;$B9A221
	STA.b $04,S				;$B9A223
	RTS					;$B9A225

CODE_B9A226:
	LDX.b current_sprite			;$B9A226
	LDA.w $0000,y				;$B9A228
	STA.b $48,x				;$B9A22B
	INY					;$B9A22D
	INY					;$B9A22E
	JMP.w CODE_B9A11A			;$B9A22F

CODE_B9A232:
	LDX.b current_sprite			;$B9A232
	LDA.w $0000,y				;$B9A234
	STA.b $42				;$B9A237
	INY					;$B9A239
	INY					;$B9A23A
	PHY					;$B9A23B
	PHB					;$B9A23C
	PHK					;$B9A23D
	PLB					;$B9A23E
	PEA.w CODE_B9A245-$01			;$B9A23F
	JMP.w ($0042)				;$B9A242
CODE_B9A245:
	PLB					;$B9A245
	PLY					;$B9A246
CODE_B9A247:
	LDA.w $0000,y				;$B9A247
	BMI.b CODE_B9A250			;$B9A24A
	PLB					;$B9A24C
	JMP.w CODE_B9A0BA			;$B9A24D

CODE_B9A250:
	AND.w #$7FFF				;$B9A250
	PLB					;$B9A253
	JMP.w set_anim_handle_kiddy_direct	;$B9A254

CODE_B9A257:
	LDX.b current_sprite			;$B9A257
	LDA.w $0000,y				;$B9A259
	XBA					;$B9A25C
	AND.w #$FF00				;$B9A25D
	CLC					;$B9A260
	ADC.b $42,x				;$B9A261
	STA.b $42,x				;$B9A263
	LDA.b $24,x				;$B9A265
	CLC					;$B9A267
	ADC.w #$0005				;$B9A268
	STA.b $24,x				;$B9A26B
	CMP.w $0001,y				;$B9A26D
	BCS.b CODE_B9A27D			;$B9A270
CODE_B9A272:
	LDA.b $42,x				;$B9A272
	BPL.b CODE_B9A27A			;$B9A274
	DEY					;$B9A276
	JMP.w CODE_B9A11A			;$B9A277

CODE_B9A27A:
	JMP.w CODE_B9A13A			;$B9A27A

CODE_B9A27D:
	TYA					;$B9A27D
	ADC.w #$0002				;$B9A27E
	STA.b $46,x				;$B9A281
	TAY					;$B9A283
	BRA.b CODE_B9A272			;$B9A284

CODE_B9A286:
	LDX.b current_sprite			;$B9A286
	LDA.w $0000,y				;$B9A288
	XBA					;$B9A28B
	AND.w #$FF00				;$B9A28C
	CLC					;$B9A28F
	ADC.b $42,x				;$B9A290
	STA.b $42,x				;$B9A292
	LDA.b $24,x				;$B9A294
	SEC					;$B9A296
	SBC.w #$0005				;$B9A297
	STA.b $24,x				;$B9A29A
	DEC					;$B9A29C
	CMP.w $0001,y				;$B9A29D
	BCC.b CODE_B9A2AD			;$B9A2A0
CODE_B9A2A2:
	LDA.b $42,x				;$B9A2A2
	BPL.b CODE_B9A2AA			;$B9A2A4
	DEY					;$B9A2A6
	JMP.w CODE_B9A11A			;$B9A2A7

CODE_B9A2AA:
	JMP.w CODE_B9A13A			;$B9A2AA

CODE_B9A2AD:
	TYA					;$B9A2AD
	ADC.w #$0003				;$B9A2AE
	STA.b $46,x				;$B9A2B1
	TAY					;$B9A2B3
	BRA.b CODE_B9A2A2			;$B9A2B4

CODE_B9A2B6:
	LDA.w $0000,y				;$B9A2B6
	AND.w #$00FF				;$B9A2B9
	CLC					;$B9A2BC
	ADC.b current_sprite			;$B9A2BD
	TAX					;$B9A2BF
	INY					;$B9A2C0
	LDA.w $0000,y				;$B9A2C1
	INY					;$B9A2C4
	INY					;$B9A2C5
	STY.b $00,x				;$B9A2C6
	TAY					;$B9A2C8
	LDX.b current_sprite			;$B9A2C9
	JMP.w CODE_B9A11A			;$B9A2CB

CODE_B9A2CE:
	LDA.w $0000,y				;$B9A2CE
	AND.w #$00FF				;$B9A2D1
	CLC					;$B9A2D4
	ADC.b current_sprite			;$B9A2D5
	TAX					;$B9A2D7
	LDY.b $00,x				;$B9A2D8
	LDX.b current_sprite			;$B9A2DA
	JMP.w CODE_B9A11A			;$B9A2DC

CODE_B9A2DF:
	LDA.w $0000,y				;$B9A2DF
	PHB					;$B9A2E2
	PHK					;$B9A2E3
	PLB					;$B9A2E4
	PHY					;$B9A2E5
	JSL.l CODE_B28012			;$B9A2E6
	PLY					;$B9A2EA
	PLB					;$B9A2EB
	INY					;$B9A2EC
	INY					;$B9A2ED
	LDX.b current_sprite			;$B9A2EE
	JMP.w CODE_B9A11A			;$B9A2F0

CODE_B9A2F3:
	LDX.b current_sprite			;$B9A2F3
	LDA.w $0000,y				;$B9A2F5
	STA.b $58,x				;$B9A2F8
	BEQ.b CODE_B9A305			;$B9A2FA
	LDA.w #$8001				;$B9A2FC
	ORA.b $26,x				;$B9A2FF
	STA.b $26,x				;$B9A301
	BRA.b CODE_B9A314			;$B9A303

CODE_B9A305:
	LDA.b $26,x				;$B9A305
	AND.w #$CFF0				;$B9A307
	CMP.w #$CFF0				;$B9A30A
	BCS.b CODE_B9A312			;$B9A30D
	AND.w #$4FF0				;$B9A30F
CODE_B9A312:
	STA.b $26,x				;$B9A312
CODE_B9A314:
	INY					;$B9A314
	INY					;$B9A315
	JMP.w CODE_B9A11A			;$B9A316

CODE_B9A319:
	LDX.b current_sprite			;$B9A319
	LDA.w $0000,y				;$B9A31B
	AND.w #$00FF				;$B9A31E
	XBA					;$B9A321
	STA.b $42,x				;$B9A322
	LDA.b $4A,x				;$B9A324
	AND.w #$8000				;$B9A326
	BNE.b CODE_B9A330			;$B9A329
	LDA.w $0001,y				;$B9A32B
	BRA.b CODE_B9A333			;$B9A32E

CODE_B9A330:
	LDA.w $0003,y				;$B9A330
CODE_B9A333:
	STA.b $24,x				;$B9A333
	TYA					;$B9A335
	CLC					;$B9A336
	ADC.w #$0005				;$B9A337
	STA.b $46,x				;$B9A33A
	JMP.w CODE_B9A13A			;$B9A33C

CODE_B9A33F:
	LDA.b current_sprite			;$B9A33F
	CLC					;$B9A341
	ADC.w $0000,y				;$B9A342
	TAX					;$B9A345
	LDA.w $0002,y				;$B9A346
	STA.b $00,x				;$B9A349
	INY					;$B9A34B
	INY					;$B9A34C
	INY					;$B9A34D
	INY					;$B9A34E
	LDX.b current_sprite			;$B9A34F
	JMP.w CODE_B9A11A			;$B9A351

CODE_B9A354:
	LDX.b current_sprite			;$B9A354
	LDA.w $0000,y				;$B9A356
	XBA					;$B9A359
	AND.w #$FF00				;$B9A35A
	CLC					;$B9A35D
	ADC.b $42,x				;$B9A35E
	STA.b $42,x				;$B9A360
	LDA.b $4A,x				;$B9A362
	AND.w #$8000				;$B9A364
	BNE.b CODE_B9A36E			;$B9A367
	LDA.w $0001,y				;$B9A369
	BRA.b CODE_B9A371			;$B9A36C

CODE_B9A36E:
	LDA.w $0003,y				;$B9A36E
CODE_B9A371:
	STA.b $42				;$B9A371
	LDA.b $24,x				;$B9A373
	CLC					;$B9A375
	ADC.w #$0005				;$B9A376
	STA.b $24,x				;$B9A379
	CMP.b $42				;$B9A37B
	BCS.b CODE_B9A38A			;$B9A37D
CODE_B9A37F:
	LDA.b $42,x				;$B9A37F
	BPL.b CODE_B9A387			;$B9A381
	DEY					;$B9A383
	JMP.w CODE_B9A11A			;$B9A384

CODE_B9A387:
	JMP.w CODE_B9A13A			;$B9A387

CODE_B9A38A:
	TYA					;$B9A38A
	ADC.w #$0004				;$B9A38B
	STA.b $46,x				;$B9A38E
	TAY					;$B9A390
	BRA.b CODE_B9A37F			;$B9A391

CODE_B9A393:
	JSL.l CODE_808018			;$B9A393
	STA.b $42				;$B9A397
	SEP.b #$20				;$B9A399
	STA.l CPU.multiply_A			;$B9A39B
	LDA.w $0001,y				;$B9A39F
	SEC					;$B9A3A2
	SBC.w $0000,y				;$B9A3A3
	STA.l CPU.multiply_B			;$B9A3A6
	REP.b #$20				;$B9A3AA
	XBA					;$B9A3AC
	NOP					;$B9A3AD
	LDA.l CPU.multiply_result_high		;$B9A3AE
	CLC					;$B9A3B2
	ADC.w $0000,y				;$B9A3B3
	AND.w #$00FF				;$B9A3B6
	LDX.b current_sprite			;$B9A3B9
	XBA					;$B9A3BB
	CLC					;$B9A3BC
	ADC.b $42,x				;$B9A3BD
	STA.b $42,x				;$B9A3BF
	SEP.b #$20				;$B9A3C1
	LDA.b $43				;$B9A3C3
	STA.l CPU.multiply_A			;$B9A3C5
	LDA.w $0004,y				;$B9A3C9
	STA.l CPU.multiply_B			;$B9A3CC
	NOP #4					;$B9A3D0
	LDA.l CPU.multiply_result_high		;$B9A3D4
	STA.l CPU.multiply_A			;$B9A3D8
	LDA.b #$05				;$B9A3DC
	STA.l CPU.multiply_B			;$B9A3DE
	REP.b #$20				;$B9A3E2
	LDA.w $0002,y				;$B9A3E4
	CLC					;$B9A3E7
	ADC.l CPU.multiply_result		;$B9A3E8
	STA.b $24,x				;$B9A3EC
	TYA					;$B9A3EE
	CLC					;$B9A3EF
	ADC.w #$0005				;$B9A3F0
	STA.b $46,x				;$B9A3F3
	JMP.w CODE_B9A13A			;$B9A3F5

CODE_B9A3F8:
	LDX.b current_sprite			;$B9A3F8
	LDA.w $0000,y				;$B9A3FA
	XBA					;$B9A3FD
	AND.w #$FF00				;$B9A3FE
	CLC					;$B9A401
	ADC.b $42,x				;$B9A402
	STA.b $42,x				;$B9A404
	LDA.w $0003,y				;$B9A406
	AND.w #$00FF				;$B9A409
	CLC					;$B9A40C
	ADC.w $0001,y				;$B9A40D
	STA.b $42				;$B9A410
	LDA.b current_sprite			;$B9A412
	CMP.l $0004FD				;$B9A414
	BNE.b CODE_B9A41E			;$B9A418
	LDA.l $0004F9				;$B9A41A
CODE_B9A41E:
	STA.b $44				;$B9A41E
	LDA.w $0004,y				;$B9A420
	AND.w #$00FF				;$B9A423
	CLC					;$B9A426
	ADC.b $44				;$B9A427
	TAX					;$B9A429
	LDA.b $00,x				;$B9A42A
	AND.w $0005,y				;$B9A42C
	AND.w #$00FF				;$B9A42F
	BNE.b CODE_B9A445			;$B9A432
	LDX.b current_sprite			;$B9A434
	LDA.b $24,x				;$B9A436
	SEC					;$B9A438
	SBC.w #$0005				;$B9A439
	CMP.w $0001,y				;$B9A43C
	BCS.b CODE_B9A456			;$B9A43F
	LDA.b $42				;$B9A441
	BRA.b CODE_B9A456			;$B9A443

CODE_B9A445:
	LDX.b current_sprite			;$B9A445
	LDA.b $24,x				;$B9A447
	CLC					;$B9A449
	ADC.w #$0005				;$B9A44A
	CMP.b $42				;$B9A44D
	BCC.b CODE_B9A456			;$B9A44F
	BEQ.b CODE_B9A456			;$B9A451
	LDA.w $0001,y				;$B9A453
CODE_B9A456:
	STA.b $24,x				;$B9A456
	TYA					;$B9A458
	CLC					;$B9A459
	ADC.w #$0006				;$B9A45A
	STA.b $46,x				;$B9A45D
	JMP.w CODE_B9A13A			;$B9A45F

CODE_B9A462:
	LDX.b current_sprite			;$B9A462
	LDA.w $0000,y				;$B9A464
	AND.w #$00FF				;$B9A467
	XBA					;$B9A46A
	CLC					;$B9A46B
	ADC.b $42,x				;$B9A46C
	STA.b $42,x				;$B9A46E
	BPL.b CODE_B9A47B			;$B9A470
	TYA					;$B9A472
	CLC					;$B9A473
	ADC.w #$0007				;$B9A474
	TAY					;$B9A477
	JMP.w CODE_B9A11A			;$B9A478

CODE_B9A47B:
	LDA.w $0001,y				;$B9A47B
	STA.b $24,x				;$B9A47E
	LDA.l $00186B				;$B9A480
	BEQ.b CODE_B9A49B			;$B9A484
	TXA					;$B9A486
	CMP.l $0004F9				;$B9A487
	BNE.b CODE_B9A49B			;$B9A48B
	LDA.w $0003,y				;$B9A48D
	STA.l $00186D				;$B9A490
	LDA.w $0005,y				;$B9A494
	STA.l $00186F				;$B9A497
CODE_B9A49B:
	TYA					;$B9A49B
	CLC					;$B9A49C
	ADC.w #$0007				;$B9A49D
	STA.b $46,x				;$B9A4A0
	JMP.w CODE_B9A13A			;$B9A4A2

CODE_B9A4A5:
	LDX.b current_sprite			;$B9A4A5
	LDA.w $0000,y				;$B9A4A7
	AND.w #$00FF				;$B9A4AA
	XBA					;$B9A4AD
	CLC					;$B9A4AE
	ADC.b $42,x				;$B9A4AF
	STA.b $42,x				;$B9A4B1
	BPL.b CODE_B9A4BE			;$B9A4B3
	TYA					;$B9A4B5
	CLC					;$B9A4B6
	ADC.w #$0009				;$B9A4B7
	TAY					;$B9A4BA
	JMP.w CODE_B9A11A			;$B9A4BB

CODE_B9A4BE:
	LDA.w $0001,y				;$B9A4BE
	STA.b $24,x				;$B9A4C1
	LDA.l $00186B				;$B9A4C3
	BEQ.b CODE_B9A4DF			;$B9A4C7
	TAX					;$B9A4C9
	LDA.w $0003,y				;$B9A4CA
	STA.b $24,x				;$B9A4CD
	LDX.b current_sprite			;$B9A4CF
	LDA.w $0005,y				;$B9A4D1
	STA.l $00186D				;$B9A4D4
	LDA.w $0007,y				;$B9A4D8
	STA.l $00186F				;$B9A4DB
CODE_B9A4DF:
	TYA					;$B9A4DF
	CLC					;$B9A4E0
	ADC.w #$0009				;$B9A4E1
	STA.b $46,x				;$B9A4E4
	JMP.w CODE_B9A13A			;$B9A4E6

CODE_B9A4E9:
	LDX.b current_sprite			;$B9A4E9
	LDA.w $0000,y				;$B9A4EB
	AND.w #$00FF				;$B9A4EE
	XBA					;$B9A4F1
	CLC					;$B9A4F2
	ADC.b $42,x				;$B9A4F3
	STA.b $42,x				;$B9A4F5
	BPL.b CODE_B9A502			;$B9A4F7
	TYA					;$B9A4F9
	CLC					;$B9A4FA
	ADC.w #$0007				;$B9A4FB
	TAY					;$B9A4FE
	JMP.w CODE_B9A11A			;$B9A4FF

CODE_B9A502:
	LDA.w $0001,y				;$B9A502
	STA.b $24,x				;$B9A505
	LDA.l $00007C				;$B9A507
	BEQ.b CODE_B9A525			;$B9A50B
	LDA.w $0003,y				;$B9A50D
	CLC					;$B9A510
	ADC.l $001885				;$B9A511
	STA.l $00188D				;$B9A515
	LDA.w $0005,y				;$B9A519
	CLC					;$B9A51C
	ADC.l $001889				;$B9A51D
	STA.l $00188F				;$B9A521
CODE_B9A525:
	TYA					;$B9A525
	CLC					;$B9A526
	ADC.w #$0007				;$B9A527
	STA.b $46,x				;$B9A52A
	JMP.w CODE_B9A13A			;$B9A52C

CODE_B9A52F:
	LDX.b current_sprite			;$B9A52F
	LDA.w $0000,y				;$B9A531
	AND.w #$00FF				;$B9A534
	XBA					;$B9A537
	CLC					;$B9A538
	ADC.b $42,x				;$B9A539
	STA.b $42,x				;$B9A53B
	BPL.b CODE_B9A548			;$B9A53D
	TYA					;$B9A53F
	CLC					;$B9A540
	ADC.w #$000B				;$B9A541
	TAY					;$B9A544
	JMP.w CODE_B9A11A			;$B9A545

CODE_B9A548:
	LDA.w $0001,y				;$B9A548
	STA.b $24,x				;$B9A54B
	LDA.l $00007C				;$B9A54D
	BEQ.b CODE_B9A56B			;$B9A551
	LDA.w $0003,y				;$B9A553
	CLC					;$B9A556
	ADC.l $001885				;$B9A557
	STA.l $00188D				;$B9A55B
	LDA.w $0005,y				;$B9A55F
	CLC					;$B9A562
	ADC.l $001889				;$B9A563
	STA.l $00188F				;$B9A567
CODE_B9A56B:
	LDA.l $00186B				;$B9A56B
	BEQ.b CODE_B9A57F			;$B9A56F
	LDA.w $0007,y				;$B9A571
	STA.l $00186D				;$B9A574
	LDA.w $0009,y				;$B9A578
	STA.l $00186F				;$B9A57B
CODE_B9A57F:
	TYA					;$B9A57F
	CLC					;$B9A580
	ADC.w #$000B				;$B9A581
	STA.b $46,x				;$B9A584
	JMP.w CODE_B9A13A			;$B9A586

CODE_B9A589:
	PLB					;$B9A589
	LDX.b current_sprite			;$B9A58A
	STZ.b $48,x				;$B9A58C
	JSL.l delete_sprite_handle_deallocation	;$B9A58E
	JMP.w CODE_B9A13B			;$B9A592

CODE_B9A595:
	JMP.w CODE_B9A8A3			;$B9A595

CODE_B9A598:
	JMP.w CODE_B9A6EE			;$B9A598

CODE_B9A59B:
	JSL.l CODE_BFF006			;$B9A59B
	RTS					;$B9A59F

CODE_B9A5A0:
	JSL.l CODE_BFF000			;$B9A5A0
	JSL.l CODE_B28027			;$B9A5A4
	RTS					;$B9A5A8

CODE_B9A5A9:
	LDA.w #$2000				;$B9A5A9
	TRB.w $0474				;$B9A5AC
	JSL.l CODE_B7D7FB			;$B9A5AF
	RTS					;$B9A5B3

CODE_B9A5B4:
	LDA.b $1E,x				;$B9A5B4
	EOR.w #$8000				;$B9A5B6
	STA.b $1E,x				;$B9A5B9
	RTS					;$B9A5BB

CODE_B9A5BC:
	LDA.b $1E,x				;$B9A5BC
	EOR.w #$4000				;$B9A5BE
	STA.b $1E,x				;$B9A5C1
	RTS					;$B9A5C3

CODE_B9A5C4:
	LDX.b current_sprite			;$B9A5C4
	LDA.b $30,x				;$B9A5C6
	BEQ.b CODE_B9A5D4			;$B9A5C8
	LSR					;$B9A5CA
	EOR.b $1E,x				;$B9A5CB
	AND.w #$4000				;$B9A5CD
	EOR.b $1E,x				;$B9A5D0
	STA.b $1E,x				;$B9A5D2
CODE_B9A5D4:
	RTS					;$B9A5D4

CODE_B9A5D5:
	LDA.w #$0100				;$B9A5D5
	STA.b $44,x				;$B9A5D8
	RTS					;$B9A5DA

CODE_B9A5DB:
	STZ.b $2E,x				;$B9A5DB
	RTS					;$B9A5DD

CODE_B9A5DE:
	STZ.b $2A,x				;$B9A5DE
CODE_B9A5E0:
	STZ.b $30,x				;$B9A5E0
	RTS					;$B9A5E2

CODE_B9A5E3:
	STZ.b $2A,x				;$B9A5E3
	RTS					;$B9A5E5

CODE_B9A5E6:
	LDX.b current_sprite			;$B9A5E6
	LDA.b $2A,x				;$B9A5E8
	CMP.w #$8000				;$B9A5EA
	ROR.b $2A,x				;$B9A5ED
	LDA.b $30,x				;$B9A5EF
	CMP.w #$8000				;$B9A5F1
	ROR.b $30,x				;$B9A5F4
	RTS					;$B9A5F6

CODE_B9A5F7:
	LDA.b $06,x				;$B9A5F7
	STA.b $42				;$B9A5F9
	LDA.b $6C				;$B9A5FB
	STA.b $44				;$B9A5FD
	LDA.b [$42],y				;$B9A5FF
	RTS					;$B9A601

CODE_B9A602:
	JSL.l CODE_B88090			;$B9A602
	RTS					;$B9A606

CODE_B9A607:
	STZ.w current_held_sprite		;$B9A607
	RTS					;$B9A60A

CODE_B9A60B:
	INC.b $5A,x				;$B9A60B
	RTS					;$B9A60D

CODE_B9A60E:
	LDA.b $30,x				;$B9A60E
	BEQ.b CODE_B9A61F			;$B9A610
	LSR					;$B9A612
	EOR.b $1E,x				;$B9A613
	AND.w #$4000				;$B9A615
	BEQ.b CODE_B9A61F			;$B9A618
	TYA					;$B9A61A
	JSL.l set_anim_handle_kiddy_direct	;$B9A61B
CODE_B9A61F:
	RTS					;$B9A61F

CODE_B9A620:
	JSL.l CODE_B9A067			;$B9A620
	RTS					;$B9A624

CODE_B9A625:
	LDA.b $30,x				;$B9A625
	BNE.b CODE_B9A639			;$B9A627
	LDA.b $2A,x				;$B9A629
	BNE.b CODE_B9A631			;$B9A62B
	LDA.w #$0000				;$B9A62D
	RTS					;$B9A630

CODE_B9A631:
	LDA.w #$0002				;$B9A631
	RTS					;$B9A634

CODE_B9A635:
	LDA.w #$0004				;$B9A635
	RTS					;$B9A638

CODE_B9A639:
	BPL.b CODE_B9A63F			;$B9A639
	EOR.w #$FFFF				;$B9A63B
	INC					;$B9A63E
CODE_B9A63F:
	STA.b $1A				;$B9A63F
	LDA.b $2A,x				;$B9A641
	BEQ.b CODE_B9A635			;$B9A643
	BPL.b CODE_B9A64B			;$B9A645
	EOR.w #$FFFF				;$B9A647
	INC					;$B9A64A
CODE_B9A64B:
	CMP.b $1A				;$B9A64B
	BCC.b CODE_B9A655			;$B9A64D
	BEQ.b CODE_B9A659			;$B9A64F
	LDA.w #$0006				;$B9A651
	RTS					;$B9A654

CODE_B9A655:
	LDA.w #$0008				;$B9A655
	RTS					;$B9A658

CODE_B9A659:
	LDA.w #$000A				;$B9A659
	RTS					;$B9A65C

CODE_B9A65D:
	LDX.b current_sprite			;$B9A65D
	JSR.w CODE_B9A625			;$B9A65F
	TAX					;$B9A662
	JMP.w (DATA_B9A666,x)			;$B9A663

DATA_B9A666:
	dw CODE_B9A672
	dw CODE_B9A672
	dw CODE_B9A673
	dw CODE_B9A673
	dw CODE_B9A673
	dw CODE_B9A673

CODE_B9A672:
	RTS					;$B9A672

CODE_B9A673:
	LDY current_kong_control_variables	;$B9A673
	LDA.w $0006,y				;$B9A675
	AND.w #$0004				;$B9A678
	BNE.b CODE_B9A680			;$B9A67B
	JMP.w CODE_B9A763			;$B9A67D

CODE_B9A680:
	JMP.w CODE_B9A7D4			;$B9A680

CODE_B9A683:
	LDX.b current_sprite			;$B9A683
	JSR.w CODE_B9A625			;$B9A685
	BEQ.b CODE_B9A69D			;$B9A688
	CMP.w #$0002				;$B9A68A
	BNE.b CODE_B9A69C			;$B9A68D
	LDA.b $2A,x				;$B9A68F
	BPL.b CODE_B9A697			;$B9A691
	EOR.w #$FFFF				;$B9A693
	INC					;$B9A696
CODE_B9A697:
	CMP.w #$0020				;$B9A697
	BCC.b CODE_B9A69D			;$B9A69A
CODE_B9A69C:
	RTS					;$B9A69C

CODE_B9A69D:
	JMP.w CODE_B9A6F2			;$B9A69D

CODE_B9A6A0:
	JSR.w CODE_B9A833			;$B9A6A0
	BCS.b CODE_B9A6C6			;$B9A6A3
	JSR.w CODE_B9A625			;$B9A6A5
	TXY					;$B9A6A8
	TAX					;$B9A6A9
	JMP.w (DATA_B9A6AD,x)			;$B9A6AA

DATA_B9A6AD:
	dw CODE_B9A6C6
	dw CODE_B9A6C6
	dw CODE_B9A6B9
	dw CODE_B9A6B9
	dw CODE_B9A6B9
	dw CODE_B9A6B9

CODE_B9A6B9:
	LDY current_kong_control_variables	;$B9A6B9
	LDA.w $0006,y				;$B9A6BB
	AND.w #$0004				;$B9A6BE
	BEQ.b CODE_B9A6C6			;$B9A6C1
	JMP.w CODE_B9A7D4			;$B9A6C3

CODE_B9A6C6:
	RTS					;$B9A6C6

CODE_B9A6C7:
	JSR.w CODE_B9A833			;$B9A6C7
	BCS.b CODE_B9A6ED			;$B9A6CA
	JSR.w CODE_B9A625			;$B9A6CC
	TXY					;$B9A6CF
	TAX					;$B9A6D0
	JMP.w (DATA_B9A6D4,x)			;$B9A6D1

DATA_B9A6D4:
	dw CODE_B9A6ED
	dw CODE_B9A6ED
	dw CODE_B9A6E0
	dw CODE_B9A6E0
	dw CODE_B9A6E0
	dw CODE_B9A6E0

CODE_B9A6E0:
	LDY current_kong_control_variables	;$B9A6E0
	LDA.w $0006,y				;$B9A6E2
	AND.w #$0004				;$B9A6E5
	BNE.b CODE_B9A6ED			;$B9A6E8
	JMP.w CODE_B9A763			;$B9A6EA

CODE_B9A6ED:
	RTS					;$B9A6ED

CODE_B9A6EE:
	JSR.w CODE_B9A6F2			;$B9A6EE
	RTL					;$B9A6F1

CODE_B9A6F2:
	LDX.b current_sprite			;$B9A6F2
	LDA.b current_animal_type		;$B9A6F4
	BNE.b CODE_B9A729			;$B9A6F6
	LDA.w current_held_sprite		;$B9A6F8
	BNE.b CODE_B9A70A			;$B9A6FB
	LDA.w #$0001				;$B9A6FD
	STA.b $38,x				;$B9A700
	LDA.w #$0001				;$B9A702
	JSL.l set_anim_handle_kiddy_direct	;$B9A705
	RTS					;$B9A709

CODE_B9A70A:
	CMP.w follower_kong_sprite		;$B9A70A
	BEQ.b CODE_B9A71C			;$B9A70D
	LDA.w #$0010				;$B9A70F
	STA.b $38,x				;$B9A712
	LDA.w #$0011				;$B9A714
	JSL.l set_anim_handle_kiddy_direct	;$B9A717
	RTS					;$B9A71B

CODE_B9A71C:
	LDA.w #$003F				;$B9A71C
	STA.b $38,x				;$B9A71F
	LDA.w #$002B				;$B9A721
	JSL.l set_anim_handle_kiddy_direct	;$B9A724
	RTS					;$B9A728

CODE_B9A729:
	LDA.w current_held_sprite		;$B9A729
	BNE.b CODE_B9A746			;$B9A72C
	TXY					;$B9A72E
	LDA.b current_animal_type		;$B9A72F
	SEC					;$B9A731
	SBC.w #!animal_sprite_type_range_start 	;$B9A732
	TAX					;$B9A735
	LDA.l DATA_B9A753,x			;$B9A736
	STA.w $0038,y				;$B9A73A
	LDA.l DATA_B9A753+$02,x			;$B9A73D
	JSL.l CODE_B9A067			;$B9A741
	RTS					;$B9A745

CODE_B9A746:
	LDA.w #$0026				;$B9A746
	STA.b $38,x				;$B9A749
	LDA.w #$0000				;$B9A74B
	JSL.l CODE_B9A067			;$B9A74E
	RTS					;$B9A752

DATA_B9A753:
	dw $0023,$0000,$002D,$0002,$0063,$0000,$0067,$0000

CODE_B9A763:
	LDX.b current_sprite			;$B9A763
	LDA.b current_animal_type		;$B9A765
	BNE.b CODE_B9A79A			;$B9A767
	LDA.w current_held_sprite		;$B9A769
	BNE.b CODE_B9A77B			;$B9A76C
	LDA.w #$0001				;$B9A76E
	STA.b $38,x				;$B9A771
	LDA.w #$0002				;$B9A773
	JSL.l set_anim_handle_kiddy_direct	;$B9A776
	RTS					;$B9A77A

CODE_B9A77B:
	CMP.w follower_kong_sprite		;$B9A77B
	BEQ.b CODE_B9A78D			;$B9A77E
	LDA.w #$0010				;$B9A780
	STA.b $38,x				;$B9A783
	LDA.w #$0012				;$B9A785
	JSL.l set_anim_handle_kiddy_direct	;$B9A788
	RTS					;$B9A78C

CODE_B9A78D:
	LDA.w #$003F				;$B9A78D
	STA.b $38,x				;$B9A790
	LDA.w #$002C				;$B9A792
	JSL.l set_anim_handle_kiddy_direct	;$B9A795
	RTS					;$B9A799

CODE_B9A79A:
	LDA.w current_held_sprite		;$B9A79A
	BNE.b CODE_B9A7B7			;$B9A79D
	TXY					;$B9A79F
	LDA.b current_animal_type		;$B9A7A0
	SEC					;$B9A7A2
	SBC.w #!animal_sprite_type_range_start 	;$B9A7A3
	TAX					;$B9A7A6
	LDA.l DATA_B9A7C4,x			;$B9A7A7
	STA.w $0038,y				;$B9A7AB
	LDA.l DATA_B9A7C4+$02,x			;$B9A7AE
	JSL.l CODE_B9A067			;$B9A7B2
	RTS					;$B9A7B6

CODE_B9A7B7:
	LDA.w #$0026				;$B9A7B7
	STA.b $38,x				;$B9A7BA
	LDA.w #$0001				;$B9A7BC
	JSL.l CODE_B9A067			;$B9A7BF
	RTS					;$B9A7C3

DATA_B9A7C4:
	dw $0023,$0001,$002D,$0002,$0063,$0001,$0067,$0001

CODE_B9A7D4:
	LDX.b current_sprite			;$B9A7D4
	LDA.b current_animal_type		;$B9A7D6
	BNE.b CODE_B9A7F9			;$B9A7D8
	LDA.w current_held_sprite		;$B9A7DA
	BNE.b CODE_B9A7EC			;$B9A7DD
	LDA.w #$0001				;$B9A7DF
	STA.b $38,x				;$B9A7E2
	LDA.w #$0004				;$B9A7E4
	JSL.l set_anim_handle_kiddy_direct	;$B9A7E7
	RTS					;$B9A7EB

CODE_B9A7EC:
	LDA.w #$0010				;$B9A7EC
	STA.b $38,x				;$B9A7EF
	LDA.w #$0012				;$B9A7F1
	JSL.l set_anim_handle_kiddy_direct	;$B9A7F4
	RTS					;$B9A7F8

CODE_B9A7F9:
	LDA.w current_held_sprite		;$B9A7F9
	BNE.b CODE_B9A816			;$B9A7FC
	TXY					;$B9A7FE
	LDA.b current_animal_type		;$B9A7FF
	SEC					;$B9A801
	SBC.w #!animal_sprite_type_range_start 	;$B9A802
	TAX					;$B9A805
	LDA.l DATA_B9A823,x			;$B9A806
	STA.w $0038,y				;$B9A80A
	LDA.l DATA_B9A823+$02,x			;$B9A80D
	JSL.l CODE_B9A067			;$B9A811
	RTS					;$B9A815

CODE_B9A816:
	LDA.w #$0026				;$B9A816
	STA.b $38,x				;$B9A819
	LDA.w #$0002				;$B9A81B
	JSL.l CODE_B9A067			;$B9A81E
	RTS					;$B9A822

DATA_B9A823:
	dw $0023,$0002,$002D,$0002,$0063,$0002,$0067,$0002

CODE_B9A833:
	LDX.b current_sprite			;$B9A833
	LDA.b $30,x				;$B9A835
	BEQ.b CODE_B9A841			;$B9A837
	LSR					;$B9A839
	EOR.b $1E,x				;$B9A83A
	AND.w #$4000				;$B9A83C
	BNE.b CODE_B9A843			;$B9A83F
CODE_B9A841:
	CLC					;$B9A841
	RTS					;$B9A842

CODE_B9A843:
	LDA.b current_animal_type		;$B9A843
	BNE.b CODE_B9A86C			;$B9A845
	LDA.w current_held_sprite		;$B9A847
	BNE.b CODE_B9A855			;$B9A84A
	LDA.w #$0003				;$B9A84C
	JSL.l set_anim_handle_kiddy_direct	;$B9A84F
	SEC					;$B9A853
	RTS					;$B9A854

CODE_B9A855:
	CMP.w follower_kong_sprite		;$B9A855
	BEQ.b CODE_B9A863			;$B9A858
	LDA.w #$0013				;$B9A85A
	JSL.l set_anim_handle_kiddy_direct	;$B9A85D
	SEC					;$B9A861
	RTS					;$B9A862

CODE_B9A863:
	LDA.w #$002D				;$B9A863
	JSL.l set_anim_handle_kiddy_direct	;$B9A866
	SEC					;$B9A86A
	RTS					;$B9A86B

CODE_B9A86C:
	LDA.w current_held_sprite		;$B9A86C
	BNE.b CODE_B9A879			;$B9A86F
	LDA.w #$0003				;$B9A871
	JSL.l CODE_B9A067			;$B9A874
	RTS					;$B9A878

CODE_B9A879:
	LDA.b current_animal_type		;$B9A879
	CMP.w #$023C				;$B9A87B
	BEQ.b CODE_B9A89B			;$B9A87E
	LDX.b current_sprite			;$B9A880
	LDA.b $1E,x				;$B9A882
	EOR.w #$4000				;$B9A884
	STA.b $1E,x				;$B9A887
	LDX.w current_held_sprite		;$B9A889
	LDA.b $1E,x				;$B9A88C
	EOR.w #$4000				;$B9A88E
	STA.b $1E,x				;$B9A891
	LDA.w #$0001				;$B9A893
	JSL.l CODE_B9A067			;$B9A896
	RTS					;$B9A89A

CODE_B9A89B:
	LDA.w #$000C				;$B9A89B
	JSL.l CODE_B9A067			;$B9A89E
	RTS					;$B9A8A2

CODE_B9A8A3:
	JSR.w CODE_B9A8A7			;$B9A8A3
	RTL					;$B9A8A6

CODE_B9A8A7:
	LDX.b current_sprite			;$B9A8A7
	LDA.b $28,x				;$B9A8A9
	AND.w #$0101				;$B9A8AB
	BEQ.b CODE_B9A8D9			;$B9A8AE
CODE_B9A8B0:
	LDX.b current_sprite			;$B9A8B0
	JSR.w CODE_B9A625			;$B9A8B2
	TXY					;$B9A8B5
	TAX					;$B9A8B6
	JMP.w (DATA_B9A8BA,x)			;$B9A8B7

DATA_B9A8BA:
	dw CODE_B9A8C6
	dw CODE_B9A8C9
	dw CODE_B9A8C9
	dw CODE_B9A8C9
	dw CODE_B9A8C9
	dw CODE_B9A8C9

CODE_B9A8C6:
	JMP.w CODE_B9A6F2			;$B9A8C6

CODE_B9A8C9:
	LDY current_kong_control_variables	;$B9A8C9
	LDA.w $0006,y				;$B9A8CB
	AND.w #$0004				;$B9A8CE
	BNE.b CODE_B9A8D6			;$B9A8D1
	JMP.w CODE_B9A763			;$B9A8D3

CODE_B9A8D6:
	JMP.w CODE_B9A7D4			;$B9A8D6

CODE_B9A8D9:
	JSL.l CODE_B88060			;$B9A8D9
	LDA.b current_animal_type		;$B9A8DD
	BNE.b CODE_B9A8F6			;$B9A8DF
	LDA.w current_held_sprite		;$B9A8E1
	CMP.w follower_kong_sprite		;$B9A8E4
	BEQ.b CODE_B9A90F			;$B9A8E7
	LDA.w #$0007				;$B9A8E9
	STA.b $38,x				;$B9A8EC
	LDA.w #$000C				;$B9A8EE
	JSL.l set_anim_handle_kiddy_direct	;$B9A8F1
	RTS					;$B9A8F5

CODE_B9A8F6:
	LDA.w #$0006				;$B9A8F6
	JSL.l CODE_B9A067			;$B9A8F9
	LDX.b current_sprite			;$B9A8FD
	LDY.w #$0024				;$B9A8FF
	LDA.b current_animal_type		;$B9A902
	CMP.w #$0234				;$B9A904
	BEQ.b CODE_B9A90C			;$B9A907
	LDY.w #$0068				;$B9A909
CODE_B9A90C:
	STY.b $38,x				;$B9A90C
	RTS					;$B9A90E

CODE_B9A90F:
	LDX.b current_sprite			;$B9A90F
	LDA.w #$0043				;$B9A911
	STA.b $38,x				;$B9A914
	LDA.w #$0031				;$B9A916
	JSL.l set_anim_handle_kiddy_direct	;$B9A919
	RTS					;$B9A91D

CODE_B9A91E:
	LDA.w $04D6				;$B9A91E
	AND.w #$0800				;$B9A921
CODE_B9A924:
	CMP.w #$0001				;$B9A924
	RTS					;$B9A927

CODE_B9A928:
	LDA.b $28,x				;$B9A928
	AND.w #$1001				;$B9A92A
	CMP.w #$0001				;$B9A92D
	RTS					;$B9A930

CODE_B9A931:
	LDA.b $28,x				;$B9A931
	AND.w #$1001				;$B9A933
	BNE.b CODE_B9A93A			;$B9A936
	SEC					;$B9A938
	RTS					;$B9A939

CODE_B9A93A:
	CLC					;$B9A93A
	RTS					;$B9A93B

CODE_B9A93C:
	LDX.b current_sprite			;$B9A93C
	LDA.b $2A,x				;$B9A93E
	BPL.b CODE_B9A946			;$B9A940
	EOR.w #$FFFF				;$B9A942
	INC					;$B9A945
CODE_B9A946:
	CMP.w #$0201				;$B9A946
	BPL.b CODE_B9A94D			;$B9A949
	CLC					;$B9A94B
	RTS					;$B9A94C

CODE_B9A94D:
	SEC					;$B9A94D
	RTS					;$B9A94E

CODE_B9A94F:
	LDX.b current_sprite			;$B9A94F
	LDA.b $2A,x				;$B9A951
	BPL.b CODE_B9A959			;$B9A953
	EOR.w #$FFFF				;$B9A955
	INC					;$B9A958
CODE_B9A959:
	CMP.w #$00C0				;$B9A959
	BPL.b CODE_B9A960			;$B9A95C
	CLC					;$B9A95E
	RTS					;$B9A95F

CODE_B9A960:
	SEC					;$B9A960
	RTS					;$B9A961

CODE_B9A962:
	LDA.b $2E,x				;$B9A962
	ASL					;$B9A964
	RTS					;$B9A965

CODE_B9A966:
	LDA.b $2E,x				;$B9A966
	EOR.w #$8000				;$B9A968
	ASL					;$B9A96B
	RTS					;$B9A96C

CODE_B9A96D:
	LDA.b $2E,x				;$B9A96D
	CLC					;$B9A96F
	ADC.w #$0100				;$B9A970
	BPL.b CODE_B9A978			;$B9A973
	JMP.w CODE_B9A1B7			;$B9A975

CODE_B9A978:
	JMP.w CODE_B9A1B0			;$B9A978

CODE_B9A97B:
	CPX.w current_held_sprite		;$B9A97B
	BEQ.b CODE_B9A9AD			;$B9A97E
	JMP.w CODE_B9A1B0			;$B9A980

CODE_B9A983:
	LDA.b $28,x				;$B9A983
	AND.w #$0101				;$B9A985
	BNE.b CODE_B9A998			;$B9A988
	LDA.b $16,x				;$B9A98A
	SEC					;$B9A98C
	SBC.l $001973				;$B9A98D
	CMP.w #$00F0				;$B9A991
	BPL.b CODE_B9A998			;$B9A994
	SEC					;$B9A996
	RTS					;$B9A997

CODE_B9A998:
	CLC					;$B9A998
	RTS					;$B9A999

CODE_B9A99A:
	LDA.b $28,x				;$B9A99A
	AND.w #$0101				;$B9A99C
	BNE.b CODE_B9A9B0			;$B9A99F
	LDA.b $16,x				;$B9A9A1
	SEC					;$B9A9A3
	SBC.l $001973				;$B9A9A4
	CMP.w #$00F0				;$B9A9A8
	BPL.b CODE_B9A9B0			;$B9A9AB
CODE_B9A9AD:
	JMP.w CODE_B9A1B7			;$B9A9AD

CODE_B9A9B0:
	JMP.w CODE_B9A1B0			;$B9A9B0

CODE_B9A9B3:
	LDA.b $2E,x				;$B9A9B3
	BPL.b CODE_B9A9B0			;$B9A9B5
	JMP.w CODE_B9A1B7			;$B9A9B7

CODE_B9A9BA:
	LDA.b $2E,x				;$B9A9BA
	BMI.b CODE_B9A9B0			;$B9A9BC
	JMP.w CODE_B9A1B7			;$B9A9BE

CODE_B9A9C1:
	LDA.b $28,x				;$B9A9C1
	AND.w #$0001				;$B9A9C3
	BNE.b CODE_B9A9B0			;$B9A9C6
	JMP.w CODE_B9A1B7			;$B9A9C8

CODE_B9A9CB:
	LDA.b $28,x				;$B9A9CB
	AND.w #$1000				;$B9A9CD
	BNE.b CODE_B9A9B0			;$B9A9D0
	LDA.w $050F				;$B9A9D2
	SEC					;$B9A9D5
	SBC.b $16,x				;$B9A9D6
	CMP.w #$0048				;$B9A9D8
	BCC.b CODE_B9A9B0			;$B9A9DB
	LDA.b $A0				;$B9A9DD
	AND.w #$0800				;$B9A9DF
	BNE.b CODE_B9A9AD			;$B9A9E2
	LDA.b $18,x				;$B9A9E4
	BMI.b CODE_B9A9AD			;$B9A9E6
	SEC					;$B9A9E8
	SBC.b $16,x				;$B9A9E9
	BMI.b CODE_B9A9B0			;$B9A9EB
	CMP.w #$0048				;$B9A9ED
	BMI.b CODE_B9A9B0			;$B9A9F0
	JMP.w CODE_B9A1B7			;$B9A9F2

CODE_B9A9F5:
	LDX.w follower_kong_sprite		;$B9A9F5
	LDA.b $38,x				;$B9A9F8
	CMP.w #$0049				;$B9A9FA
	BEQ.b CODE_B9A9AD			;$B9A9FD
	CMP.w #$004F				;$B9A9FF
	BEQ.b CODE_B9A9AD			;$B9AA02
	JMP.w CODE_B9A1B0			;$B9AA04

CODE_B9AA07:
	LDA.w #$0001				;$B9AA07
	TRB.w $1957				;$B9AA0A
	BNE.b CODE_B9AA10			;$B9AA0D
	RTS					;$B9AA0F

CODE_B9AA10:
	LDA.b $6C,x				;$B9AA10
	STA.b $46,x				;$B9AA12
	RTS					;$B9AA14

CODE_B9AA15:
	LDA.b $52,x				;$B9AA15
	BEQ.b CODE_B9AA23			;$B9AA17
	LSR					;$B9AA19
	EOR.b $1E,x				;$B9AA1A
	AND.w #$4000				;$B9AA1C
	EOR.b $1E,x				;$B9AA1F
	STA.b $1E,x				;$B9AA21
CODE_B9AA23:
	RTS					;$B9AA23

CODE_B9AA24:
	LDA.b $38,x				;$B9AA24
	CMP.w #$006A				;$B9AA26
	BEQ.b CODE_B9AA33			;$B9AA29
	LDA.b $6C,x				;$B9AA2B
	STA.b $46,x				;$B9AA2D
	STZ.b $48,x				;$B9AA2F
	STZ.b $42,x				;$B9AA31
CODE_B9AA33:
	RTS					;$B9AA33

CODE_B9AA34:
	LDA.b $4E				;$B9AA34
	CMP.w #CODE_B38076			;$B9AA36
	BNE.b CODE_B9AA3D			;$B9AA39
	CLC					;$B9AA3B
	RTS					;$B9AA3C

CODE_B9AA3D:
	SEC					;$B9AA3D
	RTS					;$B9AA3E

CODE_B9AA3F:
	LDA.w $05AF				;$B9AA3F
	AND.w #$4000				;$B9AA42
	BEQ.b CODE_B9AA6B			;$B9AA45
	LDA.b $4E				;$B9AA47
	CMP.w #CODE_B38076			;$B9AA49
	BNE.b CODE_B9AA64			;$B9AA4C
	LDA.b $12,x				;$B9AA4E
	SEC					;$B9AA50
	SBC.w $196D				;$B9AA51
	CMP.w #$0100				;$B9AA54
	BCS.b CODE_B9AA6B			;$B9AA57
	LDA.b $16,x				;$B9AA59
	SEC					;$B9AA5B
	SBC.w $1973				;$B9AA5C
	CMP.w #$00F0				;$B9AA5F
	BCS.b CODE_B9AA6B			;$B9AA62
CODE_B9AA64:
	LDA.w #$001A				;$B9AA64
	JSL.l CODE_BFF006			;$B9AA67
CODE_B9AA6B:
	RTS					;$B9AA6B

CODE_B9AA6C:
	LDA.b $4A,x				;$B9AA6C
	AND.w #$FFFD				;$B9AA6E
	STA.b $4A,x				;$B9AA71
	LDA.b $2A,x				;$B9AA73
	CLC					;$B9AA75
	ADC.w #$0100				;$B9AA76
	CMP.w #$0200				;$B9AA79
	BCS.b CODE_B9AA81			;$B9AA7C
	BRL.w CODE_B9A1B0			;$B9AA7E

CODE_B9AA81:
	BRL.w CODE_B9A1B7			;$B9AA81

CODE_B9AA84:
	LDY current_kong_control_variables	;$B9AA84
	LDA.w $000E,y				;$B9AA86
	BIT.b $1E,x				;$B9AA89
	BVC.b CODE_B9AA91			;$B9AA8B
	EOR.w #$FFFF				;$B9AA8D
	INC					;$B9AA90
CODE_B9AA91:
	STA.b $30,x				;$B9AA91
	RTS					;$B9AA93

CODE_B9AA94:
	LDA.b $38,x				;$B9AA94
	CMP.w #$000E				;$B9AA96
	BEQ.b CODE_B9AA9D			;$B9AA99
	CLC					;$B9AA9B
	RTS					;$B9AA9C

CODE_B9AA9D:
	LDA.w #$0003				;$B9AA9D
	STA.b $38,x				;$B9AAA0
	SEC					;$B9AAA2
	RTS					;$B9AAA3

CODE_B9AAA4:
	LDA.b $38,x				;$B9AAA4
	CMP.w #$0004				;$B9AAA6
	BEQ.b CODE_B9AACC			;$B9AAA9
	LDA.b $30,x				;$B9AAAB
	BEQ.b CODE_B9AACC			;$B9AAAD
	LDY current_kong_control_variables	;$B9AAAF
	LDA.w $0004,y				;$B9AAB1
	AND.w #$4000				;$B9AAB4
	BEQ.b CODE_B9AACC			;$B9AAB7
	LDA.w $0010,y				;$B9AAB9
	CMP.w $001A,y				;$B9AABC
	BEQ.b CODE_B9AAEB			;$B9AABF
	LDA.b $00				;$B9AAC1
	SEC					;$B9AAC3
	SBC.w $001A,y				;$B9AAC4
	CMP.w #$0006				;$B9AAC7
	BCS.b CODE_B9AAEB			;$B9AACA
CODE_B9AACC:
	LDA.w $0775				;$B9AACC
	AND.w #$0060				;$B9AACF
	BNE.b CODE_B9AADC			;$B9AAD2
	LDA.b $2A,x				;$B9AAD4
	CMP.w #$8000				;$B9AAD6
	ROR					;$B9AAD9
	STA.b $2A,x				;$B9AADA
CODE_B9AADC:
	STZ.b $30,x				;$B9AADC
	LDA.w #$0005				;$B9AADE
	STA.b $38,x				;$B9AAE1
	LDA.b $4A,x				;$B9AAE3
	AND.w #$EFFF				;$B9AAE5
	STA.b $4A,x				;$B9AAE8
	RTS					;$B9AAEA

CODE_B9AAEB:
	JMP.w CODE_B9A8B0			;$B9AAEB

CODE_B9AAEE:
	LDA.b $28,x				;$B9AAEE
	AND.w #$1001				;$B9AAF0
	BEQ.b CODE_B9AAF9			;$B9AAF3
	LDA.b $6C,x				;$B9AAF5
	STA.b $46,x				;$B9AAF7
CODE_B9AAF9:
	RTS					;$B9AAF9

CODE_B9AAFA:
	LDA.b $28,x				;$B9AAFA
	AND.w #$0101				;$B9AAFC
	BNE.b CODE_B9AB0F			;$B9AAFF
	LDY current_kong_control_variables	;$B9AB01
	LDA.w $0004,y				;$B9AB03
	AND.w #$4000				;$B9AB06
	BEQ.b CODE_B9AB0C			;$B9AB09
	RTS					;$B9AB0B

CODE_B9AB0C:
	JMP.w CODE_B9A8D9			;$B9AB0C

CODE_B9AB0F:
	JMP.w CODE_B9ABD2			;$B9AB0F

CODE_B9AB12:
	LDA.b $24,x				;$B9AB12
	SEC					;$B9AB14
	SBC.w #$0CBC				;$B9AB15
	CMP.w #$0019				;$B9AB18
	BCC.b CODE_B9AB1E			;$B9AB1B
	RTS					;$B9AB1D

CODE_B9AB1E:
	LDA.w #DATA_F9151C			;$B9AB1E
	JMP.w CODE_B9A221			;$B9AB21

CODE_B9AB24:
	LDA.b $28,x				;$B9AB24
	AND.w #$0303				;$B9AB26
	BNE.b CODE_B9AB2C			;$B9AB29
	RTS					;$B9AB2B

CODE_B9AB2C:
	JMP.w CODE_B9A8A7			;$B9AB2C

CODE_B9AB2F:
	LDX.w $18DF				;$B9AB2F
	BEQ.b CODE_B9AB3D			;$B9AB32
	LDA.b $00,x				;$B9AB34
	CMP.w #!sprite_bonus_coin		;$B9AB36
	BNE.b CODE_B9AB3D			;$B9AB39
	CLC					;$B9AB3B
	RTS					;$B9AB3C

CODE_B9AB3D:
	SEC					;$B9AB3D
	RTS					;$B9AB3E

CODE_B9AB3F:
	JSL.l CODE_B88093			;$B9AB3F
	LDA.w current_held_sprite		;$B9AB43
	BNE.b CODE_B9AB51			;$B9AB46
	LDA.w #$0002				;$B9AB48
	STA.b $38,x				;$B9AB4B
	STZ.w $1955				;$B9AB4D
	RTS					;$B9AB50

CODE_B9AB51:
	CMP.w follower_kong_sprite		;$B9AB51
	BEQ.b CODE_B9AB5C			;$B9AB54
	LDA.w #$0011				;$B9AB56
	STA.b $38,x				;$B9AB59
	RTS					;$B9AB5B

CODE_B9AB5C:
	LDA.w #$0044				;$B9AB5C
	STA.b $38,x				;$B9AB5F
	RTS					;$B9AB61

CODE_B9AB62:
	JSL.l CODE_B88093			;$B9AB62
	LDA.w #$0068				;$B9AB66
	LDY.b current_animal_type		;$B9AB69
	CPY.w #$0240				;$B9AB6B
	BEQ.b CODE_B9AB7B			;$B9AB6E
	LDA.w #$0024				;$B9AB70
	LDY.w current_held_sprite		;$B9AB73
	BEQ.b CODE_B9AB7B			;$B9AB76
	LDA.w #$0027				;$B9AB78
CODE_B9AB7B:
	STA.b $38,x				;$B9AB7B
	LDA.w #$0005				;$B9AB7D
	JSL.l CODE_B9A067			;$B9AB80
	RTS					;$B9AB84

CODE_B9AB85:
	LDX.b current_sprite			;$B9AB85
	LDA.w #$FE00				;$B9AB87
	STA.b $2E,x				;$B9AB8A
	LDA.w #$0200				;$B9AB8C
	STA.b $44,x				;$B9AB8F
	LDA.w #$0007				;$B9AB91
	STA.b $38,x				;$B9AB94
	RTS					;$B9AB96

CODE_B9AB97:
	LDA.b $2E,x				;$B9AB97
	BPL.b CODE_B9AB9C			;$B9AB99
	RTS					;$B9AB9B

CODE_B9AB9C:
	LDA.w #$0200				;$B9AB9C
	STA.b $44,x				;$B9AB9F
	RTS					;$B9ABA1

CODE_B9ABA2:
	LDA.b $18,x				;$B9ABA2
	BMI.b CODE_B9ABB2			;$B9ABA4
	SEC					;$B9ABA6
	SBC.b $16,x				;$B9ABA7
	BMI.b CODE_B9ABB9			;$B9ABA9
	BEQ.b CODE_B9ABBF			;$B9ABAB
	CMP.w #$0010				;$B9ABAD
	BMI.b CODE_B9ABB3			;$B9ABB0
CODE_B9ABB2:
	RTS					;$B9ABB2

CODE_B9ABB3:
	LDA.w #$0200				;$B9ABB3
	STA.b $44,x				;$B9ABB6
	RTS					;$B9ABB8

CODE_B9ABB9:
	LDA.w #$0300				;$B9ABB9
	STA.b $44,x				;$B9ABBC
	RTS					;$B9ABBE

CODE_B9ABBF:
	RTS					;$B9ABBF

CODE_B9ABC0:
	LDA.b $28,x				;$B9ABC0
	AND.w #$0101				;$B9ABC2
	BNE.b CODE_B9ABC8			;$B9ABC5
	RTS					;$B9ABC7

CODE_B9ABC8:
	JSL.l CODE_B880BA			;$B9ABC8
	RTS					;$B9ABCC

CODE_B9ABCD:
	JSL.l CODE_B880BD			;$B9ABCD
	RTS					;$B9ABD1

CODE_B9ABD2:
	LDX.b current_sprite			;$B9ABD2
	LDA.b $28,x				;$B9ABD4
	AND.w #$1010				;$B9ABD6
	BEQ.b CODE_B9ABDF			;$B9ABD9
	JSL.l CODE_B880BA			;$B9ABDB
CODE_B9ABDF:
	JSL.l CODE_B88060			;$B9ABDF
	JMP.w CODE_B9A8B0			;$B9ABE3

CODE_B9ABE6:
	JSR.w CODE_B9AC50			;$B9ABE6
	JSL.l CODE_B88075			;$B9ABE9
	JSR.w CODE_B9AB3F			;$B9ABED
	LDA.w #$0008				;$B9ABF0
	STA.w $1955				;$B9ABF3
	RTS					;$B9ABF6

CODE_B9ABF7:
	JSR.w CODE_B9AC50			;$B9ABF7
	JSR.w CODE_B9AB85			;$B9ABFA
	LDA.w #$0010				;$B9ABFD
	STA.w $1955				;$B9AC00
	RTS					;$B9AC03

CODE_B9AC04:
	CPX.w follower_kong_sprite		;$B9AC04
	BEQ.b CODE_B9AC14			;$B9AC07
	LDA.b $30,x				;$B9AC09
	BEQ.b CODE_B9AC14			;$B9AC0B
	LDA.w #$0018				;$B9AC0D
	JSL.l set_anim_handle_kiddy_direct	;$B9AC10
CODE_B9AC14:
	RTS					;$B9AC14

CODE_B9AC15:
	CPX.w follower_kong_sprite		;$B9AC15
	BEQ.b CODE_B9AC30			;$B9AC18
	LDA.b $2A,x				;$B9AC1A
	SEC					;$B9AC1C
	SBC.b $36,x				;$B9AC1D
	BPL.b CODE_B9AC25			;$B9AC1F
	EOR.w #$FFFF				;$B9AC21
	INC					;$B9AC24
CODE_B9AC25:
	LSR					;$B9AC25
	CMP.w #$0100				;$B9AC26
	BCS.b CODE_B9AC2E			;$B9AC29
	LDA.w #$0100				;$B9AC2B
CODE_B9AC2E:
	STA.b $44,x				;$B9AC2E
CODE_B9AC30:
	RTS					;$B9AC30

CODE_B9AC31:
	CPX.w follower_kong_sprite		;$B9AC31
	BEQ.b CODE_B9AC4F			;$B9AC34
	LDA.b $30,x				;$B9AC36
	BNE.b CODE_B9AC4F			;$B9AC38
	LDA.b $2A,x				;$B9AC3A
	SEC					;$B9AC3C
	SBC.b $36,x				;$B9AC3D
	CLC					;$B9AC3F
	ADC.w #$0080				;$B9AC40
	CMP.w #$0100				;$B9AC43
	BCS.b CODE_B9AC4F			;$B9AC46
	LDA.w #$0017				;$B9AC48
	JSL.l set_anim_handle_kiddy_direct	;$B9AC4B
CODE_B9AC4F:
	RTS					;$B9AC4F

CODE_B9AC50:
	LDA.b $38,x				;$B9AC50
	CMP.w #$0009				;$B9AC52
	BEQ.b CODE_B9AC68			;$B9AC55
	LDA.b $36,x				;$B9AC57
	CMP.w #$8000				;$B9AC59
	ROR					;$B9AC5C
	STA.b $36,x				;$B9AC5D
	EOR.w #$FFFF				;$B9AC5F
	SEC					;$B9AC62
	ADC.b $2A,x				;$B9AC63
	STA.b $2A,x				;$B9AC65
	RTS					;$B9AC67

CODE_B9AC68:
	LDY current_kong_control_variables	;$B9AC68
	LDA.w $0006,y				;$B9AC6A
	LDY.w #$0108				;$B9AC6D
	AND.w #$0004				;$B9AC70
	BNE.b CODE_B9AC78			;$B9AC73
	LDY.w #$0100				;$B9AC75
CODE_B9AC78:
	LDA.w $04E0				;$B9AC78
	AND.w #$0300				;$B9AC7B
	BEQ.b CODE_B9AC90			;$B9AC7E
	AND.w #$0100				;$B9AC80
	BNE.b CODE_B9AC8A			;$B9AC83
	SEC					;$B9AC85
	SBC.b [$6A],y				;$B9AC86
	BRA.b CODE_B9AC90			;$B9AC88

CODE_B9AC8A:
	LDA.b [$6A],y				;$B9AC8A
	CMP.w #$8000				;$B9AC8C
	ROR					;$B9AC8F
CODE_B9AC90:
	STA.b $2A,x				;$B9AC90
	STZ.b $36,x				;$B9AC92
	RTS					;$B9AC94

CODE_B9AC95:
	LDA.b $2E,x				;$B9AC95
	CLC					;$B9AC97
	ADC.w #$0400				;$B9AC98
	BMI.b CODE_B9ACA3			;$B9AC9B
	LSR					;$B9AC9D
	LSR					;$B9AC9E
	ADC.b $44,x				;$B9AC9F
	STA.b $44,x				;$B9ACA1
CODE_B9ACA3:
	LDA.b $5E,x				;$B9ACA3
	CMP.w #$0001				;$B9ACA5
	RTS					;$B9ACA8

CODE_B9ACA9:
	CPX.w follower_kong_sprite		;$B9ACA9
	BEQ.b CODE_B9ACBC			;$B9ACAC
	LDA.b $34,x				;$B9ACAE
	BEQ.b CODE_B9ACB9			;$B9ACB0
	LDA.w #$001C				;$B9ACB2
	JSL.l set_anim_handle_kiddy_direct	;$B9ACB5
CODE_B9ACB9:
	JSR.w CODE_B9ACBD			;$B9ACB9
CODE_B9ACBC:
	RTS					;$B9ACBC

CODE_B9ACBD:
	LDA.b $30,x				;$B9ACBD
	BEQ.b CODE_B9ACD0			;$B9ACBF
	LSR					;$B9ACC1
	EOR.b $1E,x				;$B9ACC2
	AND.w #$4000				;$B9ACC4
	BNE.b CODE_B9ACD0			;$B9ACC7
	LDA.w #$001D				;$B9ACC9
	JSL.l set_anim_handle_kiddy_direct	;$B9ACCC
CODE_B9ACD0:
	RTS					;$B9ACD0

CODE_B9ACD1:
	CPX.w follower_kong_sprite		;$B9ACD1
	BEQ.b CODE_B9ACED			;$B9ACD4
	JSR.w CODE_B9ACBD			;$B9ACD6
	LDA.b $2E,x				;$B9ACD9
	BPL.b CODE_B9ACE1			;$B9ACDB
	EOR.w #$FFFF				;$B9ACDD
	INC					;$B9ACE0
CODE_B9ACE1:
	LSR					;$B9ACE1
	CMP.w #$0100				;$B9ACE2
	BCS.b CODE_B9ACEA			;$B9ACE5
	LDA.w #$0100				;$B9ACE7
CODE_B9ACEA:
	STA.b $44,x				;$B9ACEA
	RTS					;$B9ACEC

CODE_B9ACED:
	LDY.w active_kong_sprite		;$B9ACED
	LDA.w $002E,y				;$B9ACF0
	BPL.b CODE_B9ACF9			;$B9ACF3
	EOR.w #$FFFF				;$B9ACF5
	INC					;$B9ACF8
CODE_B9ACF9:
	LSR					;$B9ACF9
	CMP.w #$0100				;$B9ACFA
	BCS.b CODE_B9AD02			;$B9ACFD
	LDA.w #$0100				;$B9ACFF
CODE_B9AD02:
	STA.b $44,x				;$B9AD02
	RTS					;$B9AD04

CODE_B9AD05:
	CPX.w follower_kong_sprite		;$B9AD05
	BEQ.b CODE_B9AD20			;$B9AD08
	LDA.b $34,x				;$B9AD0A
	BNE.b CODE_B9AD20			;$B9AD0C
	LDA.b $2E,x				;$B9AD0E
	CLC					;$B9AD10
	ADC.w #$0040				;$B9AD11
	CMP.w #$0080				;$B9AD14
CODE_B9AD17:
	BCS.b CODE_B9AD20			;$B9AD17
	LDA.w #$001B				;$B9AD19
	JSL.l set_anim_handle_kiddy_direct	;$B9AD1C
CODE_B9AD20:
	RTS					;$B9AD20

CODE_B9AD21:
	LDA.w #$0001				;$B9AD21
	STA.w $1871				;$B9AD24
	RTS					;$B9AD27

CODE_B9AD28:
	LDA.w #$FFFF				;$B9AD28
	STA.w $1871				;$B9AD2B
	RTS					;$B9AD2E

CODE_B9AD2F:
	LDA.w #$4000				;$B9AD2F
	TSB.w $1877				;$B9AD32
	RTS					;$B9AD35

CODE_B9AD36:
	LDA.w current_held_sprite		;$B9AD36
	BEQ.b CODE_B9AD3E			;$B9AD39
	JMP.w CODE_B9A65D			;$B9AD3B

CODE_B9AD3E:
	JMP.w CODE_B9A8A7			;$B9AD3E

CODE_B9AD41:
	LDA.w current_held_sprite		;$B9AD41
	BEQ.b CODE_B9AD69			;$B9AD44
	JSR.w CODE_B9A833			;$B9AD46
	BCS.b CODE_B9AD68			;$B9AD49
	LDA.b $2A,x				;$B9AD4B
	BPL.b CODE_B9AD53			;$B9AD4D
	EOR.w #$FFFF				;$B9AD4F
	INC					;$B9AD52
CODE_B9AD53:
	ASL					;$B9AD53
	STA.b $1A				;$B9AD54
	LDA.w #$00C0				;$B9AD56
	CMP.b $1A				;$B9AD59
	BCS.b CODE_B9AD66			;$B9AD5B
	LDA.w #$0200				;$B9AD5D
	CMP.b $1A				;$B9AD60
	BCC.b CODE_B9AD66			;$B9AD62
	LDA.b $1A				;$B9AD64
CODE_B9AD66:
	STA.b $44,x				;$B9AD66
CODE_B9AD68:
	RTS					;$B9AD68

CODE_B9AD69:
	JMP.w CODE_B9A8A7			;$B9AD69

CODE_B9AD6C:
	LDX.w current_held_sprite		;$B9AD6C
	BEQ.b CODE_B9AD9D			;$B9AD6F
	STZ.b $2A,x				;$B9AD71
	STZ.b $30,x				;$B9AD73
	LDY.w #$000E				;$B9AD75
	JSR.w CODE_B9A5F7			;$B9AD78
	STA.b $38,x				;$B9AD7B
	INY					;$B9AD7D
	INY					;$B9AD7E
	LDA.b [$42],y				;$B9AD7F
	STX.b alternate_sprite			;$B9AD81
	JSL.l CODE_B9A078			;$B9AD83
	LDX.w current_held_sprite		;$B9AD87
	JSL.l CODE_B9E021			;$B9AD8A
	LDY.w current_held_sprite		;$B9AD8E
	LDA.w $0012,y				;$B9AD91
	STA.w $0054,y				;$B9AD94
	LDA.w $0016,y				;$B9AD97
	STA.w $0056,y				;$B9AD9A
CODE_B9AD9D:
	RTS					;$B9AD9D

CODE_B9AD9E:
	LDA.w current_held_sprite		;$B9AD9E
	BEQ.b CODE_B9ADA6			;$B9ADA1
	JMP.w CODE_B9A1B7			;$B9ADA3

CODE_B9ADA6:
	JMP.w CODE_B9A1B0			;$B9ADA6

CODE_B9ADA9:
	RTS					;$B9ADA9

CODE_B9ADAA:
	CPX.w follower_kong_sprite		;$B9ADAA
	BNE.b CODE_B9ADB0			;$B9ADAD
	RTS					;$B9ADAF

CODE_B9ADB0:
	LDA.b $44,x				;$B9ADB0
	SEC					;$B9ADB2
	SBC.w #$0010				;$B9ADB3
	CMP.w #$0100				;$B9ADB6
	BCS.b CODE_B9ADBE			;$B9ADB9
	LDA.w #$0100				;$B9ADBB
CODE_B9ADBE:
	STA.b $44,x				;$B9ADBE
	LDY.w #$0029				;$B9ADC0
	JSR.w CODE_B9A60E			;$B9ADC3
	RTS					;$B9ADC6

CODE_B9ADC7:
	LDA.w current_held_sprite		;$B9ADC7
	BEQ.b CODE_B9ADCF			;$B9ADCA
	JMP.w CODE_B9A65D			;$B9ADCC

CODE_B9ADCF:
	JMP.w CODE_B9A8A7			;$B9ADCF

CODE_B9ADD2:
	LDX.w current_held_sprite		;$B9ADD2
	BEQ.b CODE_B9ADFA			;$B9ADD5
	LDY.w #$0012				;$B9ADD7
	LDA.b current_animal_type		;$B9ADDA
	CMP.w #$023C				;$B9ADDC
	BNE.b CODE_B9ADE4			;$B9ADDF
	LDY.w #$0026				;$B9ADE1
CODE_B9ADE4:
	JSR.w CODE_B9A5F7			;$B9ADE4
	STA.b $38,x				;$B9ADE7
	JSR.w CODE_B9A5E6			;$B9ADE9
	LDA.b $2E,x				;$B9ADEC
	BMI.b CODE_B9ADFA			;$B9ADEE
	CMP.w #$0100				;$B9ADF0
	BCC.b CODE_B9ADFA			;$B9ADF3
	LDA.w #$0100				;$B9ADF5
	STA.b $2E,x				;$B9ADF8
CODE_B9ADFA:
	RTS					;$B9ADFA

CODE_B9ADFB:
	LDX.b current_sprite			;$B9ADFB
	LDA.b $28,x				;$B9ADFD
	AND.w #$0101				;$B9ADFF
	BNE.b CODE_B9AE0B			;$B9AE02
	LDA.b $4A,x				;$B9AE04
	ORA.w #$0800				;$B9AE06
	STA.b $4A,x				;$B9AE09
CODE_B9AE0B:
	LDX.w current_held_sprite		;$B9AE0B
	BNE.b CODE_B9AE11			;$B9AE0E
	RTS					;$B9AE10

CODE_B9AE11:
	LDY.w #$0014				;$B9AE11
	JSR.w CODE_B9A5F7			;$B9AE14
	STA.b $5A,x				;$B9AE17
	INY					;$B9AE19
	INY					;$B9AE1A
	LDA.b [$42],y				;$B9AE1B
	STA.b $38,x				;$B9AE1D
	INY					;$B9AE1F
	INY					;$B9AE20
	LDA.b [$42],y				;$B9AE21
	STX.b alternate_sprite			;$B9AE23
	JSL.l CODE_B9A078			;$B9AE25
	LDX.w current_held_sprite		;$B9AE29
	JSL.l CODE_B9E021			;$B9AE2C
	LDY current_kong_control_variables	;$B9AE30
	LDA.w $0004,y				;$B9AE32
	LDX.b current_animal_type		;$B9AE35
	BEQ.b CODE_B9AE4C			;$B9AE37
	LDX.w #$0250				;$B9AE39
	LDY.w #$0258				;$B9AE3C
	AND.w #$0800				;$B9AE3F
	BEQ.b CODE_B9AE5D			;$B9AE42
	LDX.w #$0260				;$B9AE44
	LDY.w #$0268				;$B9AE47
	BRA.b CODE_B9AE5D			;$B9AE4A

CODE_B9AE4C:
	LDX.w #$0130				;$B9AE4C
	LDY.w #$0138				;$B9AE4F
	AND.w #$0800				;$B9AE52
	BEQ.b CODE_B9AE5D			;$B9AE55
	LDX.w #$0140				;$B9AE57
	LDY.w #$0148				;$B9AE5A
CODE_B9AE5D:
	LDA.b [$6A],y				;$B9AE5D
	LDY.w current_held_sprite		;$B9AE5F
	STA.w $002E,y				;$B9AE62
	TXY					;$B9AE65
	LDA.b [$6A],y				;$B9AE66
	LDX.b current_sprite			;$B9AE68
	LDY.w current_held_sprite		;$B9AE6A
	BIT.b $1E,x				;$B9AE6D
	BVC.b CODE_B9AE75			;$B9AE6F
	EOR.w #$FFFF				;$B9AE71
	INC					;$B9AE74
CODE_B9AE75:
	STA.w $002A,y				;$B9AE75
	STA.w $0030,y				;$B9AE78
	LSR					;$B9AE7B
	EOR.w $001E,y				;$B9AE7C
	AND.w #$4000				;$B9AE7F
	EOR.w $001E,y				;$B9AE82
	STA.w $001E,y				;$B9AE85
	LDA.w $0012,y				;$B9AE88
	STA.w $0054,y				;$B9AE8B
	LDA.w $0016,y				;$B9AE8E
	STA.w $0056,y				;$B9AE91
	LDA.w #$0000				;$B9AE94
	STA.w $0028,y				;$B9AE97
	LDA.w $1875				;$B9AE9A
	AND.w #$FFDE				;$B9AE9D
	STA.w $003A,y				;$B9AEA0
	LDA.w $1873				;$B9AEA3
	STA.w $000E,y				;$B9AEA6
	STZ.w current_held_sprite		;$B9AEA9
	RTS					;$B9AEAC

CODE_B9AEAD:
	LDX.w current_held_sprite		;$B9AEAD
	BEQ.b CODE_B9AEC4			;$B9AEB0
	LDY.w #$0012				;$B9AEB2
	LDA.b current_animal_type		;$B9AEB5
	CMP.w #$023C				;$B9AEB7
	BNE.b CODE_B9AEBF			;$B9AEBA
	LDY.w #$0026				;$B9AEBC
CODE_B9AEBF:
	JSR.w CODE_B9A5F7			;$B9AEBF
	STA.b $38,x				;$B9AEC2
CODE_B9AEC4:
	RTS					;$B9AEC4

CODE_B9AEC5:
	LDX.w current_held_sprite		;$B9AEC5
	BNE.b CODE_B9AECB			;$B9AEC8
	RTS					;$B9AECA

CODE_B9AECB:
	LDY.w #$0028				;$B9AECB
	JSR.w CODE_B9A5F7			;$B9AECE
	STA.b $5A,x				;$B9AED1
	INY					;$B9AED3
	INY					;$B9AED4
	LDA.b [$42],y				;$B9AED5
	STA.b $38,x				;$B9AED7
	INY					;$B9AED9
	INY					;$B9AEDA
	LDA.b [$42],y				;$B9AEDB
	STX.b alternate_sprite			;$B9AEDD
	JSL.l CODE_B9A078			;$B9AEDF
	JSR.w CODE_B9AF4B			;$B9AEE3
	LDX.b current_sprite			;$B9AEE6
	LDY.w current_held_sprite		;$B9AEE8
	LDA.w #$FF80				;$B9AEEB
	STA.w $002E,y				;$B9AEEE
	BIT.b $1E,x				;$B9AEF1
	BVC.b CODE_B9AF05			;$B9AEF3
	LDA.w #$FF00				;$B9AEF5
	CLC					;$B9AEF8
	ADC.b $2A,x				;$B9AEF9
	CMP.w #$FF00				;$B9AEFB
	BCC.b CODE_B9AF13			;$B9AEFE
	LDA.w #$FF00				;$B9AF00
	BRA.b CODE_B9AF13			;$B9AF03

CODE_B9AF05:
	LDA.w #$0100				;$B9AF05
	CLC					;$B9AF08
	ADC.b $2A,x				;$B9AF09
	CMP.w #$0100				;$B9AF0B
	BCS.b CODE_B9AF13			;$B9AF0E
	LDA.w #$0100				;$B9AF10
CODE_B9AF13:
	STA.w $002A,y				;$B9AF13
	STA.w $0030,y				;$B9AF16
	LSR					;$B9AF19
	EOR.w $001E,y				;$B9AF1A
	AND.w #$4000				;$B9AF1D
	EOR.w $001E,y				;$B9AF20
	STA.w $001E,y				;$B9AF23
	LDA.w $0012,y				;$B9AF26
	STA.w $0054,y				;$B9AF29
	LDA.w $0016,y				;$B9AF2C
	STA.w $0056,y				;$B9AF2F
	LDA.w #$0000				;$B9AF32
	STA.w $0028,y				;$B9AF35
	LDA.w $1875				;$B9AF38
	AND.w #$FFDE				;$B9AF3B
	STA.w $003A,y				;$B9AF3E
	LDA.w $1873				;$B9AF41
	STA.w $000E,y				;$B9AF44
	STZ.w current_held_sprite		;$B9AF47
	RTS					;$B9AF4A

CODE_B9AF4B:
	LDX.w current_held_sprite		;$B9AF4B
	LDY.w active_kong_sprite		;$B9AF4E
	LDA.w $0016,y				;$B9AF51
	PHA					;$B9AF54
	LDA.b $16,x				;$B9AF55
	CMP.w $0018,y				;$B9AF57
	BCC.b CODE_B9AF5F			;$B9AF5A
	LDA.w $0018,y				;$B9AF5C
CODE_B9AF5F:
	STA.w $0016,y				;$B9AF5F
	JSL.l CODE_B9E021			;$B9AF62
	PLA					;$B9AF66
	LDY.w active_kong_sprite		;$B9AF67
	STA.w $0016,y				;$B9AF6A
	RTS					;$B9AF6D

CODE_B9AF6E:
	LDX.w current_held_sprite		;$B9AF6E
	BEQ.b CODE_B9AF9B			;$B9AF71
	STZ.b $2A,x				;$B9AF73
	STZ.b $30,x				;$B9AF75
	LDY.w #$0022				;$B9AF77
	JSR.w CODE_B9A5F7			;$B9AF7A
	STA.b $38,x				;$B9AF7D
	INY					;$B9AF7F
	INY					;$B9AF80
	LDA.b [$42],y				;$B9AF81
	STX.b alternate_sprite			;$B9AF83
	JSL.l CODE_B9A078			;$B9AF85
	JSR.w CODE_B9AF4B			;$B9AF89
	LDY.w current_held_sprite		;$B9AF8C
	LDA.w $0012,y				;$B9AF8F
	STA.w $0054,y				;$B9AF92
	LDA.w $0016,y				;$B9AF95
	STA.w $0056,y				;$B9AF98
CODE_B9AF9B:
	RTS					;$B9AF9B

CODE_B9AF9C:
	LDY.w #$000A				;$B9AF9C
	JSL.l CODE_BB8585			;$B9AF9F
	RTS					;$B9AFA3

CODE_B9AFA4:
	LDA.w $075C				;$B9AFA4
	CMP.w #$0003				;$B9AFA7
	BNE.b CODE_B9AFB3			;$B9AFAA
	LDA.w #$0020				;$B9AFAC
	JSL.l CODE_BFF006			;$B9AFAF
CODE_B9AFB3:
	RTS					;$B9AFB3

CODE_B9AFB4:
	LDA.w #$0037				;$B9AFB4
	STA.b $38,x				;$B9AFB7
	STZ.b $2A,x				;$B9AFB9
	STZ.b $30,x				;$B9AFBB
	STZ.b $2E,x				;$B9AFBD
	LDA.b $12,x				;$B9AFBF
	STA.b $5E,x				;$B9AFC1
	STZ.b $5C,x				;$B9AFC3
	LDA.w #$007E				;$B9AFC5
	JSL.l set_anim_handle_kiddy_direct	;$B9AFC8
	RTS					;$B9AFCC

CODE_B9AFCD:
	LDA.w #$F900				;$B9AFCD
	STA.b $2E,x				;$B9AFD0
	LDA.w #$0400				;$B9AFD2
	STA.b $30,x				;$B9AFD5
	RTS					;$B9AFD7

CODE_B9AFD8:
	LDA.b $30,x				;$B9AFD8
	CMP.w #$8000				;$B9AFDA
	ROR.b $30,x				;$B9AFDD
CODE_B9AFDF:
	LDY.w #$00F8				;$B9AFDF
	LDA.b [$6A],y				;$B9AFE2
	STA.b $2E,x				;$B9AFE4
	RTS					;$B9AFE6

CODE_B9AFE7:
	CPX.w active_kong_sprite		;$B9AFE7
	BNE.b CODE_B9AFFF			;$B9AFEA
	LDA.w #$820F				;$B9AFEC
	JSL.l CODE_808024			;$B9AFEF
	LDA.w #$0001				;$B9AFF3
	TSB.w $05AF				;$B9AFF6
	LDA.w #$FFFF				;$B9AFF9
	STA.w $195B				;$B9AFFC
CODE_B9AFFF:
	RTS					;$B9AFFF

CODE_B9B000:
	LDA.w $1957				;$B9B000
	CPX.w active_kong_sprite		;$B9B003
	BEQ.b CODE_B9B00B			;$B9B006
	LDA.w $1927				;$B9B008
CODE_B9B00B:
	EOR.w #$FFFF				;$B9B00B
	AND.w #$8000				;$B9B00E
	CMP.w #$0001				;$B9B011
	RTS					;$B9B014

CODE_B9B015:
	CPX.w active_kong_sprite		;$B9B015
	BEQ.b CODE_B9B02B			;$B9B018
	LDA.w $195A				;$B9B01A
	AND.w #$FFFD				;$B9B01D
	ORA.w #$0001				;$B9B020
	STA.w $195A				;$B9B023
	JSL.l CODE_BB860F			;$B9B026
	RTS					;$B9B02A

CODE_B9B02B:
	LDA.w $1959				;$B9B02B
	AND.w #$FFFD				;$B9B02E
	ORA.w #$0001				;$B9B031
	STA.w $1959				;$B9B034
	JSL.l CODE_BB8600			;$B9B037
	RTS					;$B9B03B

CODE_B9B03C:
	CPX.w active_kong_sprite		;$B9B03C
	BEQ.b CODE_B9B052			;$B9B03F
	LDA.w $195A				;$B9B041
	AND.w #$FFFE				;$B9B044
	ORA.w #$0002				;$B9B047
	STA.w $195A				;$B9B04A
	JSL.l CODE_BB860F			;$B9B04D
	RTS					;$B9B051

CODE_B9B052:
	LDA.w $1959				;$B9B052
	AND.w #$FFFE				;$B9B055
	ORA.w #$0002				;$B9B058
	STA.w $1959				;$B9B05B
	JSL.l CODE_BB8600			;$B9B05E
	RTS					;$B9B062

CODE_B9B063:
	CPX.w active_kong_sprite		;$B9B063
	BEQ.b CODE_B9B079			;$B9B066
	LDA.w #$0003				;$B9B068
	TRB.w $195A				;$B9B06B
	LDA.w #$8000				;$B9B06E
	TRB.w $1927				;$B9B071
	JSL.l CODE_BB860F			;$B9B074
	RTS					;$B9B078

CODE_B9B079:
	LDA.w #$0003				;$B9B079
	TRB.w $195A				;$B9B07C
	LDA.w #$8000				;$B9B07F
	TRB.w $1957				;$B9B082
	JSL.l CODE_BB8600			;$B9B085
	RTS					;$B9B089

CODE_B9B08A:
	LDX.w follower_kong_sprite		;$B9B08A
	LDA.b $38,x				;$B9B08D
	CMP.w #$0040				;$B9B08F
	BNE.b CODE_B9B09F			;$B9B092
	JSL.l CODE_B880A2			;$B9B094
	JSL.l disable_timestop			;$B9B098
	JMP.w CODE_B9A1B0			;$B9B09C

CODE_B9B09F:
	JMP.w CODE_B9A1B7			;$B9B09F

CODE_B9B0A2:
	LDA.b $2E,x				;$B9B0A2
	BMI.b CODE_B9B0BC			;$B9B0A4
	STZ.b $2E,x				;$B9B0A6
	LDA.b $44,x				;$B9B0A8
	SEC					;$B9B0AA
	SBC.w #$0010				;$B9B0AB
	STA.b $44,x				;$B9B0AE
	CMP.w #$0081				;$B9B0B0
	BCS.b CODE_B9B0BC			;$B9B0B3
	LDA.w #DATA_F927FC			;$B9B0B5
	STA.b $46,x				;$B9B0B8
	STZ.b $48,x				;$B9B0BA
CODE_B9B0BC:
	RTS					;$B9B0BC

CODE_B9B0BD:
	LDA.b $30,x				;$B9B0BD
	CMP.w #$0001				;$B9B0BF
	RTS					;$B9B0C2

CODE_B9B0C3:
	LDX.b current_sprite			;$B9B0C3
	LDA.b $28,x				;$B9B0C5
	AND.w #$0101				;$B9B0C7
	BNE.b CODE_B9B0D3			;$B9B0CA
	LDA.b $4A,x				;$B9B0CC
	ORA.w #$0800				;$B9B0CE
	STA.b $4A,x				;$B9B0D1
CODE_B9B0D3:
	LDX.w follower_kong_sprite		;$B9B0D3
	LDA.w #$00D8				;$B9B0D6
	STA.b $0E,x				;$B9B0D9
	LDA.w $04D6				;$B9B0DB
	AND.w #$0800				;$B9B0DE
	BEQ.b CODE_B9B0E6			;$B9B0E1
	JMP.w CODE_B9B150			;$B9B0E3

CODE_B9B0E6:
	LDA.w #$0035				;$B9B0E6
	JSL.l CODE_B9A091			;$B9B0E9
	LDX.w active_kong_sprite		;$B9B0ED
	LDY.w follower_kong_sprite		;$B9B0F0
	LDA.w #$0046				;$B9B0F3
	STA.b $38,x				;$B9B0F6
	LDA.w #$0000				;$B9B0F8
	STA.w $0028,y				;$B9B0FB
	LDA.w $003A,y				;$B9B0FE
	ORA.w #$0024				;$B9B101
	STA.w $003A,y				;$B9B104
	LDX.w current_held_sprite		;$B9B107
	JSL.l CODE_B9E021			;$B9B10A
	STZ.w current_held_sprite		;$B9B10E
	LDY.w #$0060				;$B9B111
	LDA.b [$6A],y				;$B9B114
	LDY.w follower_kong_sprite		;$B9B116
	STA.w $002E,y				;$B9B119
	LDY.w #$0058				;$B9B11C
	LDA.b [$6A],y				;$B9B11F
	LDY.w follower_kong_sprite		;$B9B121
	LDX.b current_sprite			;$B9B124
	BIT.b $1E,x				;$B9B126
	BVC.b CODE_B9B12E			;$B9B128
	EOR.w #$FFFF				;$B9B12A
	INC					;$B9B12D
CODE_B9B12E:
	STA.w $002A,y				;$B9B12E
	CPX.w $0501				;$B9B131
	BEQ.b CODE_B9B143			;$B9B134
	LDA.w #$0047				;$B9B136
	STA.w $0038,y				;$B9B139
	LDA.w #$0000				;$B9B13C
	STA.w $0030,y				;$B9B13F
	RTS					;$B9B142

CODE_B9B143:
	LDA.w #$0050				;$B9B143
	STA.w $0038,y				;$B9B146
	LDA.w $002A,y				;$B9B149
	STA.w $0030,y				;$B9B14C
	RTS					;$B9B14F

CODE_B9B150:
	LDA.w #$0033				;$B9B150
	JSL.l CODE_B9A091			;$B9B153
	LDX.w active_kong_sprite		;$B9B157
	LDY.w follower_kong_sprite		;$B9B15A
	LDA.w #$0048				;$B9B15D
	STA.b $38,x				;$B9B160
	LDA.w #$0049				;$B9B162
	CPX.w $0501				;$B9B165
	BNE.b CODE_B9B16D			;$B9B168
	LDA.w #$004F				;$B9B16A
CODE_B9B16D:
	STA.w $0038,y				;$B9B16D
	LDY.w #$0070				;$B9B170
	LDA.b [$6A],y				;$B9B173
	LDY.w follower_kong_sprite		;$B9B175
	STA.w $002E,y				;$B9B178
	LDA.w #$0000				;$B9B17B
	CPY.w $0501				;$B9B17E
	BEQ.b CODE_B9B193			;$B9B181
	LDY.w #$0068				;$B9B183
	LDA.b [$6A],y				;$B9B186
	LDY.w follower_kong_sprite		;$B9B188
	BIT.b $1E,x				;$B9B18B
	BVC.b CODE_B9B193			;$B9B18D
	EOR.w #$FFFF				;$B9B18F
	INC					;$B9B192
CODE_B9B193:
	STA.w $002A,y				;$B9B193
	LDA.w #$0000				;$B9B196
	STA.w $0030,y				;$B9B199
	STA.w $0028,y				;$B9B19C
	LDA.w $003A,y				;$B9B19F
	ORA.w #$00B4				;$B9B1A2
	STA.w $003A,y				;$B9B1A5
	LDX.w current_held_sprite		;$B9B1A8
	JSL.l CODE_B9E021			;$B9B1AB
	STZ.w current_held_sprite		;$B9B1AF
	RTS					;$B9B1B2

DATA_B9B1B3:
	dw $0041
	dw $0041
	dw $0064
	dw $0041

DATA_B9B1BB:
	dw $0042
	dw $0059
	dw $0065
	dw $0072

CODE_B9B1C7:
	LDX.b current_mount			;$B9B1C7
	BEQ.b CODE_B9B1CB			;$B9B1C9
	JSL.l CODE_B9A035			;$B9B1CB
CODE_B9B1CB:
	RTS					;$B9B1CB

CODE_B9B1CC:
	LDY.w #DATA_F92CE7			;$B9B1CC
	BRA.b CODE_B9B1D4			;$B9B1CF

CODE_B9B1D1:
	LDY.w #DATA_F92C43			;$B9B1D1
CODE_B9B1D4:
	LDA.l $0004F9				;$B9B1D4
	TAX					;$B9B1D8
	LDA.b $30,x				;$B9B1D9
	BEQ.b CODE_B9B1E3			;$B9B1DB
	LDX.b current_sprite			;$B9B1DD
	STY.b $46,x				;$B9B1DF
	STZ.b $48,x				;$B9B1E1
CODE_B9B1E3:
	RTS					;$B9B1E3

CODE_B9B1E4:
	LDA.l $0004F9				;$B9B1E4
	TAX					;$B9B1E8
	LDA.b $30,x				;$B9B1E9
	CMP.w #$0001				;$B9B1EB
	RTS					;$B9B1EE

CODE_B9B1EF:
	LDA.w #$0008				;$B9B1EF
	BIT.b $1E,x				;$B9B1F2
	BVC.b CODE_B9B1F9			;$B9B1F4
	LDA.w #$0007				;$B9B1F6
CODE_B9B1F9:
	JSL.l CODE_BFF006			;$B9B1F9
	RTS					;$B9B1FD

CODE_B9B1FE:
	LDA.w $1957				;$B9B1FE
	AND.w #$4000				;$B9B201
	BNE.b CODE_B9B209			;$B9B204
	JMP.w CODE_B9A6F2			;$B9B206

CODE_B9B209:
	JMP.w CODE_B9B3FD			;$B9B209

CODE_B9B20C:
	LDA.b $2A,x				;$B9B20C
	BPL.b CODE_B9B214			;$B9B20E
	EOR.w #$FFFF				;$B9B210
	INC					;$B9B213
CODE_B9B214:
	CLC					;$B9B214
	ADC.w #$0100				;$B9B215
	STA.b $44,x				;$B9B218
	RTS					;$B9B21A

CODE_B9B21B:
	LDA.w #$0006				;$B9B21B
	JSL.l CODE_BFF009			;$B9B21E
	LDA.w $1879				;$B9B222
	BNE.b CODE_B9B22E			;$B9B225
	LDA.w #DATA_F93167			;$B9B227
	STA.b $46,x				;$B9B22A
	STZ.b $48,x				;$B9B22C
CODE_B9B22E:
	RTS					;$B9B22E

CODE_B9B22F:
	LDA.w $0777				;$B9B22F
	AND.w #$0020				;$B9B232
	BEQ.b CODE_B9B2A4			;$B9B235
	LDA.w $1891				;$B9B237
	CMP.w #$0007				;$B9B23A
	BCS.b CODE_B9B2A4			;$B9B23D
	LDA.w $0775				;$B9B23F
	AND.w #$0200				;$B9B242
	BNE.b CODE_B9B272			;$B9B245
	LDA.w $050F				;$B9B247
	SEC					;$B9B24A
	SBC.b $16,x				;$B9B24B
	CMP.w #$0038				;$B9B24D
	BCS.b CODE_B9B2A4			;$B9B250
	LDA.b $16,x				;$B9B252
	STA.b $1C				;$B9B254
	LDA.w #$0014				;$B9B256
	BIT.b $1E,x				;$B9B259
	BVC.b CODE_B9B260			;$B9B25B
	LDA.w #$FFEC				;$B9B25D
CODE_B9B260:
	CLC					;$B9B260
	ADC.b $12,x				;$B9B261
	JSL.l CODE_B880B1			;$B9B263
	CMP.w $050F				;$B9B267
	BCC.b CODE_B9B2A4			;$B9B26A
	LDA.w #DATA_F93193			;$B9B26C
	STA.b $46,x				;$B9B26F
	RTS					;$B9B271

CODE_B9B272:
	LDA.w #$0020				;$B9B272
	BIT.b $1E,x				;$B9B275
	BVC.b CODE_B9B27C			;$B9B277
	LDA.w #$FFE0				;$B9B279
CODE_B9B27C:
	CLC					;$B9B27C
	ADC.b $12,x				;$B9B27D
	LDY.w #$FFFE				;$B9B27F
CODE_B9B282:
	INY					;$B9B282
	INY					;$B9B283
	CMP.w $18B7,y				;$B9B284
	BCC.b CODE_B9B2A4			;$B9B287
	CMP.w $18C1,y				;$B9B289
	BCS.b CODE_B9B282			;$B9B28C
	LDA.b $1E,x				;$B9B28E
	AND.w #$3000				;$B9B290
	CMP.w #$3000				;$B9B293
	BEQ.b CODE_B9B29E			;$B9B296
	LDA.w #DATA_F93211			;$B9B298
	STA.b $46,x				;$B9B29B
	RTS					;$B9B29D

CODE_B9B29E:
	LDA.w #DATA_F931DC			;$B9B29E
	STA.b $46,x				;$B9B2A1
	RTS					;$B9B2A3

CODE_B9B2A4:
	RTS					;$B9B2A4

CODE_B9B2A5:
	LDA.w #$0006				;$B9B2A5
	JSL.l CODE_BFF009			;$B9B2A8
	LDA.w $04DA				;$B9B2AC
	AND.w #$0300				;$B9B2AF
	BNE.b CODE_B9B2CD			;$B9B2B2
	LDA.w $04D6				;$B9B2B4
	BIT.w #$0020				;$B9B2B7
	BNE.b CODE_B9B2C4			;$B9B2BA
	AND.w #$0480				;$B9B2BC
	CMP.w #$0480				;$B9B2BF
	BNE.b CODE_B9B2CD			;$B9B2C2
CODE_B9B2C4:
	LDA.w $1891				;$B9B2C4
	CMP.w #$0007				;$B9B2C7
	BCS.b CODE_B9B2CD			;$B9B2CA
	RTS					;$B9B2CC

CODE_B9B2CD:
	LDA.b $6C,x				;$B9B2CD
	STA.b $46,x				;$B9B2CF
	STZ.b $48,x				;$B9B2D1
	RTS					;$B9B2D3

CODE_B9B2D4:
	LDA.w $1891				;$B9B2D4
	CMP.w #$0007				;$B9B2D7
	BCS.b CODE_B9B2E6			;$B9B2DA
	INC.w $1891				;$B9B2DC
	LDA.w #$000A				;$B9B2DF
	JSL.l CODE_BFF006			;$B9B2E2
CODE_B9B2E6:
	RTS					;$B9B2E6

CODE_B9B2E7:
	LDA.b $2E,x				;$B9B2E7
	BMI.b CODE_B9B301			;$B9B2E9
	LDA.b $28,x				;$B9B2EB
	AND.w #$0101				;$B9B2ED
	CMP.w #$0101				;$B9B2F0
	BNE.b CODE_B9B301			;$B9B2F3
	LDA.w #$B2FF				;$B9B2F5
	STA.b $48,x				;$B9B2F8
	LDA.w #$002C				;$B9B2FA
	STA.b $38,x				;$B9B2FD
CODE_B9B2FF:
	STZ.b $2A,x				;$B9B2FF
CODE_B9B301:
	LDA.w $04D6				;$B9B301
	AND.w #$0090				;$B9B304
	BNE.b CODE_B9B30B			;$B9B307
	STZ.b $6C,x				;$B9B309
CODE_B9B30B:
	RTS					;$B9B30B

CODE_B9B30C:
	LDA.w $1891				;$B9B30C
	DEC					;$B9B30F
	ASL					;$B9B310
	RTS					;$B9B311

CODE_B9B312:
	CLC					;$B9B312
	LDA.b $30,x				;$B9B313
	BEQ.b CODE_B9B31C			;$B9B315
	LSR					;$B9B317
	EOR.b $1E,x				;$B9B318
	ASL					;$B9B31A
	ASL					;$B9B31B
CODE_B9B31C:
	RTS					;$B9B31C

CODE_B9B31D:
	LDA.w $04D6				;$B9B31D
	AND.w #$0800				;$B9B320
	CMP.w #$0001				;$B9B323
	RTS					;$B9B326

CODE_B9B327:
	LDA.w $1891				;$B9B327
	CMP.w #$0001				;$B9B32A
	BCC.b CODE_B9B334			;$B9B32D
	LDA.b $6C,x				;$B9B32F
	CMP.w #$0001				;$B9B331
CODE_B9B334:
	RTS					;$B9B334

CODE_B9B335:
	LDA.w #$0001				;$B9B335
	TRB.w $1957				;$B9B338
	CLC					;$B9B33B
	BEQ.b CODE_B9B33F			;$B9B33C
	SEC					;$B9B33E
CODE_B9B33F:
	RTS					;$B9B33F

CODE_B9B340:
	LDY.w #$003C				;$B9B340
	JSL.l CODE_BB85B8			;$B9B343
	BCS.b CODE_B9B358			;$B9B347
	DEC.w $1891				;$B9B349
	BPL.b CODE_B9B351			;$B9B34C
	STZ.w $1891				;$B9B34E
CODE_B9B351:
	LDA.w #$0009				;$B9B351
	JSL.l CODE_BFF006			;$B9B354
CODE_B9B358:
	RTS					;$B9B358

CODE_B9B359:
	LDY.w #$003E				;$B9B359
	JSL.l CODE_BB85B8			;$B9B35C
	BCS.b CODE_B9B371			;$B9B360
	DEC.w $1891				;$B9B362
	BPL.b CODE_B9B36A			;$B9B365
	STZ.w $1891				;$B9B367
CODE_B9B36A:
	LDA.w #$0009				;$B9B36A
	JSL.l CODE_BFF006			;$B9B36D
CODE_B9B371:
	RTS					;$B9B371

CODE_B9B372:
	LDA.w #$0001				;$B9B372
	STA.w $1871				;$B9B375
	JSR.w CODE_B9AD2F			;$B9B378
	LDX.w current_held_sprite		;$B9B37B
	LDY.b current_sprite			;$B9B37E
	LDA.w $001E,y				;$B9B380
	EOR.b $1E,x				;$B9B383
	AND.w #$4000				;$B9B385
	EOR.b $1E,x				;$B9B388
	EOR.w #$4000				;$B9B38A
	STA.b $1E,x				;$B9B38D
	LDA.w $004A,y				;$B9B38F
	AND.w #$FFFE				;$B9B392
	STA.w $004A,y				;$B9B395
	RTS					;$B9B398

CODE_B9B399:
	LDA.w #$FFFF				;$B9B399
	STA.w $1871				;$B9B39C
	LDX.w current_held_sprite		;$B9B39F
	LDA.b $1E,x				;$B9B3A2
	AND.w #$BFFF				;$B9B3A4
	STA.b $1E,x				;$B9B3A7
	LDX.b current_sprite			;$B9B3A9
	LDA.b $4A,x				;$B9B3AB
	AND.w #$FFFE				;$B9B3AD
	STA.b $4A,x				;$B9B3B0
	RTS					;$B9B3B2

CODE_B9B3B3:
	LDA.b $1E,x				;$B9B3B3
	EOR.b $5E,x				;$B9B3B5
	AND.w #$4000				;$B9B3B7
	CMP.w #$0001				;$B9B3BA
	RTS					;$B9B3BD

CODE_B9B3BE:
	LDY.w #$0290				;$B9B3BE
	LDA.b [$6A],y				;$B9B3C1
	BIT.b $1E,x				;$B9B3C3
	BVC.b CODE_B9B3CB			;$B9B3C5
	EOR.w #$FFFF				;$B9B3C7
	INC					;$B9B3CA
CODE_B9B3CB:
	STA.b $2A,x				;$B9B3CB
	STZ.b $30,x				;$B9B3CD
	INC.b $5A,x				;$B9B3CF
	RTS					;$B9B3D1

CODE_B9B3D2:
	LDA.b $1A,x				;$B9B3D2
	CMP.w #$0010				;$B9B3D4
	BCS.b CODE_B9B3FA			;$B9B3D7
	LDA.w #$006B				;$B9B3D9
	STA.b $38,x				;$B9B3DC
	STZ.b $2A,x				;$B9B3DE
	STZ.b $5A,x				;$B9B3E0
	JSL.l CODE_B88078			;$B9B3E2
	JSL.l CODE_B88060			;$B9B3E6
	SEP.b #$20				;$B9B3EA
	LDA.b #$10				;$B9B3EC
	STA.w $0473				;$B9B3EE
	REP.b #$20				;$B9B3F1
	JSL.l CODE_B7D7FB			;$B9B3F3
	JMP.w CODE_B9A1B0			;$B9B3F7

CODE_B9B3FA:
	JMP.w CODE_B9A1B7			;$B9B3FA

CODE_B9B3FD:
	LDA.w #$0057				;$B9B3FD
	JSL.l CODE_B9A0BA			;$B9B400
	LDA.w #$006C				;$B9B404
	STA.b $38,x				;$B9B407
	LDY.w #$02A0				;$B9B409
	LDA.b [$6A],y				;$B9B40C
	STA.b $30,x				;$B9B40E
	STA.b $2A,x				;$B9B410
	RTS					;$B9B412

CODE_B9B413:
	LDY.w #$0022				;$B9B413
	JSL.l CODE_BB85B8			;$B9B416
	RTS					;$B9B41A

CODE_B9B41B:
	LDY.w #$0024				;$B9B41B
	JSL.l CODE_BB85B8			;$B9B41E
	RTS					;$B9B422

CODE_B9B423:
	LDA.w #$006D				;$B9B423
	STA.b $38,x				;$B9B426
	LDY.w #$0298				;$B9B428
	LDA.b [$6A],y				;$B9B42B
	STA.b $2E,x				;$B9B42D
	LDA.b $4A,x				;$B9B42F
	AND.w #$FFFE				;$B9B431
	ORA.w #$0800				;$B9B434
	STA.b $4A,x				;$B9B437
	RTS					;$B9B439

CODE_B9B43A:
	LDY.w #$000C				;$B9B43A
	LDA.b [$6A],y				;$B9B43D
	BIT.b $1E,x				;$B9B43F
	BVC.b CODE_B9B447			;$B9B441
	EOR.w #$FFFF				;$B9B443
	INC					;$B9B446
CODE_B9B447:
	STA.b $30,x				;$B9B447
	STA.b $2A,x				;$B9B449
	LDY.w #$000E				;$B9B44B
	LDA.b [$6A],y				;$B9B44E
	STA.b $34,x				;$B9B450
	STA.b $2E,x				;$B9B452
	LDY.w #$0010				;$B9B454
	LDA.b [$6A],y				;$B9B457
	STA.b $5A,x				;$B9B459
	INC.b $38,x				;$B9B45B
	RTS					;$B9B45D

CODE_B9B45E:
	LDA.w #$002E				;$B9B45E
	STA.b $38,x				;$B9B461
	LDA.w #$0400				;$B9B463
	BIT.b $1E,x				;$B9B466
	BVC.b CODE_B9B46E			;$B9B468
	EOR.w #$FFFF				;$B9B46A
	INC					;$B9B46D
CODE_B9B46E:
	STA.b $2A,x				;$B9B46E
	STA.b $30,x				;$B9B470
	RTS					;$B9B472

CODE_B9B473:
	LDA.w #$0001				;$B9B473
	TRB.w $1957				;$B9B476
	BNE.b CODE_B9B47C			;$B9B479
	RTS					;$B9B47B

CODE_B9B47C:
	JSR.w CODE_B9A5C4			;$B9B47C
	LDA.w #$0004				;$B9B47F
	JSL.l CODE_B9A067			;$B9B482
	RTS					;$B9B486

CODE_B9B487:
	LDA.b $30,x				;$B9B487
	BNE.b CODE_B9B497			;$B9B489
	LDY.w $04FB				;$B9B48B
	LDA.w $0004,y				;$B9B48E
	AND.w #$0080				;$B9B491
	BEQ.b CODE_B9B497			;$B9B494
	RTS					;$B9B496

CODE_B9B497:
	JMP.w CODE_B9A6F2			;$B9B497

CODE_B9B49A:
	LDA.b $30,x				;$B9B49A
	BNE.b CODE_B9B4AA			;$B9B49C
	LDY.w $04FB				;$B9B49E
	LDA.w $0004,y				;$B9B4A1
	AND.w #$0080				;$B9B4A4
	BEQ.b CODE_B9B4B2			;$B9B4A7
	RTS					;$B9B4A9

CODE_B9B4AA:
	LDA.w #$0000				;$B9B4AA
	JSL.l CODE_B9A067			;$B9B4AD
	RTS					;$B9B4B1

CODE_B9B4B2:
	LDA.w #$0680				;$B9B4B2
	BIT.b $1E,x				;$B9B4B5
	BVC.b CODE_B9B4BD			;$B9B4B7
	EOR.w #$FFFF				;$B9B4B9
	INC					;$B9B4BC
CODE_B9B4BD:
	STA.b $5C,x				;$B9B4BD
	STA.b $2A,x				;$B9B4BF
	STA.b $30,x				;$B9B4C1
	LDA.w #$0030				;$B9B4C3
	STA.b $38,x				;$B9B4C6
	LDA.w #$0006				;$B9B4C8
	JSL.l CODE_B9A067			;$B9B4CB
	RTS					;$B9B4CF

CODE_B9B4D0:
	LDA.b $2A,x				;$B9B4D0
	CLC					;$B9B4D2
	ADC.w #$0060				;$B9B4D3
	CMP.w #$00C0				;$B9B4D6
	BCS.b CODE_B9B4DE			;$B9B4D9
	JSR.w CODE_B9A6F2			;$B9B4DB
CODE_B9B4DE:
	RTS					;$B9B4DE

CODE_B9B4DF:
	CLC					;$B9B4DF
	LDA.b $30,x				;$B9B4E0
	BEQ.b CODE_B9B4E9			;$B9B4E2
	LSR					;$B9B4E4
	EOR.b $1E,x				;$B9B4E5
	ASL					;$B9B4E7
	ASL					;$B9B4E8
CODE_B9B4E9:
	RTS					;$B9B4E9

CODE_B9B4EA:
	LDY.w #$0012				;$B9B4EA
	JSL.l CODE_BB85B8			;$B9B4ED
	BCS.b CODE_B9B50C			;$B9B4F1
	LDX.b alternate_sprite			;$B9B4F3
	JSL.l CODE_B9E021			;$B9B4F5
	LDX.b alternate_sprite			;$B9B4F9
	LDY.b current_sprite			;$B9B4FB
	LDA.w $002A,y				;$B9B4FD
	CLC					;$B9B500
	ADC.b $2A,x				;$B9B501
	STA.b $2A,x				;$B9B503
	LDA.w #$0011				;$B9B505
	JSL.l CODE_BFF006			;$B9B508
CODE_B9B50C:
	RTS					;$B9B50C

CODE_B9B50D:
	LDA.w #$0001				;$B9B50D
	TRB.w $1957				;$B9B510
	RTS					;$B9B513

CODE_B9B514:
	LDA.w #$0001				;$B9B514
	TRB.w $1957				;$B9B517
	BNE.b CODE_B9B51D			;$B9B51A
	RTS					;$B9B51C

CODE_B9B51D:
	LDA.w #DATA_F93A31			;$B9B51D
	STA.b $46,x				;$B9B520
	STZ.b $48,x				;$B9B522
	RTS					;$B9B524

CODE_B9B525:
	JSR.w CODE_B9A833			;$B9B525
	BCS.b CODE_B9B532			;$B9B528
	LDA.w current_held_sprite		;$B9B52A
	BNE.b CODE_B9B532			;$B9B52D
	JSR.w CODE_B9A6F2			;$B9B52F
CODE_B9B532:
	RTS					;$B9B532

CODE_B9B533:
	LDX.w current_held_sprite		;$B9B533
	LDA.b $1E,x				;$B9B536
	AND.w #$BFFF				;$B9B538
	STA.b $1E,x				;$B9B53B
	LDX.b current_sprite			;$B9B53D
	LDA.b $4A,x				;$B9B53F
	AND.w #$FFFE				;$B9B541
	STA.b $4A,x				;$B9B544
	RTS					;$B9B546

CODE_B9B547:
	LDA.b $2A,x				;$B9B547
	BPL.b CODE_B9B54F			;$B9B549
	EOR.w #$FFFF				;$B9B54B
	INC					;$B9B54E
CODE_B9B54F:
	CMP.w #$0140				;$B9B54F
	BCS.b CODE_B9B557			;$B9B552
	LDA.w #$0140				;$B9B554
CODE_B9B557:
	STA.b $44,x				;$B9B557
	JMP.w CODE_B9A833			;$B9B559

CODE_B9B55C:
	LDA.w $1957				;$B9B55C
	AND.w #$0002				;$B9B55F
	BNE.b CODE_B9B57A			;$B9B562
	LDA.w #DATA_F93EC5			;$B9B564
	STA.b $46,x				;$B9B567
	STZ.b $48,x				;$B9B569
	LDA.w #$0004				;$B9B56B
	TSB.w $1957				;$B9B56E
	STZ.b $2A,x				;$B9B571
	STZ.b $30,x				;$B9B573
	LDA.w #$0001				;$B9B575
	STA.b $38,x				;$B9B578
CODE_B9B57A:
	RTS					;$B9B57A

CODE_B9B57B:
	LDA.w #$0004				;$B9B57B
	TRB.w $1957				;$B9B57E
	RTS					;$B9B581

CODE_B9B582:
	LDA.b $68,x				;$B9B582
	AND.w #$0003				;$B9B584
	CMP.w #$0003				;$B9B587
	BEQ.b CODE_B9B58F			;$B9B58A
	JMP.w CODE_B9A1B7			;$B9B58C

CODE_B9B58F:
	JMP.w CODE_B9A1B0			;$B9B58F

CODE_B9B592:
	LDY.w #$011F				;$B9B592
	JMP.w CODE_B9B867			;$B9B595

;Graphic ID's
DATA_B9B598:
	dw $2549
	dw $0000
	dw $254E
	dw $0000
	dw $2553
	dw $0000
	dw $254E
	dw $0000
	dw $2549
	dw $0000
	dw $254E
	dw $0000
	dw $2553
	dw $0000
	dw $254E
	dw $0000
	dw $24A9
	dw $24AE
	dw $24B3
	dw $24B8
	dw $24BD
	dw $24C2
	dw $24C7
	dw $24CC
	dw $24D1
	dw $24D6
	dw $24DB
	dw $24E0
	dw $24E5
	dw $24EA
	dw $24EF
	dw $24F4
	dw $24F9
	dw $24FE
	dw $2503
	dw $2508
	dw $250D
	dw $2512
	dw $2517
	dw $251C
	dw $2521
	dw $2526
	dw $252B
	dw $2530
	dw $2535
	dw $253A
	dw $253F
	dw $2544
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25CB
	dw $25B2
	dw $0000
	dw $25B7
	dw $0000
	dw $25BC
	dw $0000
	dw $25C1
	dw $0000
	dw $25C6
	dw $0000
	dw $25C1
	dw $0000
	dw $25BC
	dw $0000
	dw $25B7
	dw $0000
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD
	dw $25FD


DATA_B9B658:
	dw $2558
	dw $255D
	dw $2562
	dw $2567
	dw $2206

CODE_B9B662:
	LDA.w #$1135				;$B9B662
	BRA.b CODE_B9B6B4			;$B9B665

CODE_B9B667:
	LDY.b $5C,x				;$B9B667
	LDA.w $0040,y				;$B9B669
	BNE.b CODE_B9B67A			;$B9B66C
	RTS					;$B9B66E

CODE_B9B66F:
	LDY.b $5C,x				;$B9B66F
	LDA.w $0040,y				;$B9B671
	CMP.w #$0006				;$B9B674
	BNE.b CODE_B9B67A			;$B9B677
	RTS					;$B9B679

CODE_B9B67A:
	LDA.w #DATA_F93FE4			;$B9B67A
	STA.b $46,x				;$B9B67D
	STZ.b $42,x				;$B9B67F
	JSR.w CODE_B9B6DC			;$B9B681
	CLC					;$B9B684
	ADC.w #$1135				;$B9B685
	STA.b $24,x				;$B9B688
	RTS					;$B9B68A

CODE_B9B68B:
	LDA.w #$1987				;$B9B68B
	BRA.b CODE_B9B6B4			;$B9B68E

CODE_B9B690:
	LDY.b $5C,x				;$B9B690
	LDA.w $0040,y				;$B9B692
	BNE.b CODE_B9B6A3			;$B9B695
	RTS					;$B9B697

CODE_B9B698:
	LDY.b $5C,x				;$B9B698
	LDA.w $0040,y				;$B9B69A
	CMP.w #$0006				;$B9B69D
	BNE.b CODE_B9B6A3			;$B9B6A0
	RTS					;$B9B6A2

CODE_B9B6A3:
	LDA.w #DATA_F9400A			;$B9B6A3
	STA.b $46,x				;$B9B6A6
	STZ.b $42,x				;$B9B6A8
	JSR.w CODE_B9B6DC			;$B9B6AA
	CLC					;$B9B6AD
	ADC.w #$1987				;$B9B6AE
	STA.b $24,x				;$B9B6B1
	RTS					;$B9B6B3

CODE_B9B6B4:
	STA.b $1E				;$B9B6B4
	JSL.l CODE_808018			;$B9B6B6
	BIT.w #$003F				;$B9B6BA
	BNE.b CODE_B9B6C8			;$B9B6BD
	PLA					;$B9B6BF
	CLC					;$B9B6C0
	ADC.w #$0003				;$B9B6C1
	PHA					;$B9B6C4
	BRL.w CODE_B9A1B0			;$B9B6C5

CODE_B9B6C8:
	XBA					;$B9B6C8
	BIT.w #$003F				;$B9B6C9
	BNE.b CODE_B9B6D1			;$B9B6CC
	BRL.w CODE_B9A1B0			;$B9B6CE

CODE_B9B6D1:
	JSR.w CODE_B9B6DC			;$B9B6D1
	CLC					;$B9B6D4
	ADC.b $1E				;$B9B6D5
	STA.b $24,x				;$B9B6D7
	BRL.w CODE_B9A1B7			;$B9B6D9

CODE_B9B6DC:
	LDY.b $5C,x				;$B9B6DC
	LDA.w $0040,y				;$B9B6DE
	ASL					;$B9B6E1
	ASL					;$B9B6E2
	ADC.w $0040,y				;$B9B6E3
	RTS					;$B9B6E6


;Graphic ID's? Referenced by animal buddy box and floor door
DATA_B9B6E7:
	dw $8005
	dw $2738
	dw $030C
	dw $4286
	dw $3A57
	dw $8050
	dw $420E
	dw $00AA
	dw $43DF
	dw $411E
	dw $414B
	dw $4178
	dw $41CD
	dw $3B0B
	dw $3A70
	dw $0401
	dw $0438
	dw $0492
	dw $049C
	dw $04D8
	dw $0550
	dw $0569
	dw $4295
	dw $429F
	dw $0582
	dw $0537
	dw $0596
	dw $05A0
	dw $43DA
	dw $4376
	dw $3B2E
	dw $0618
	dw $3B33
	dw $402E
	dw $3A89
	dw $43EE
	dw $3DC2
	dw $3D7C
	dw $1BC1
	dw $00A0
	dw $258A
	dw $2977
	dw $226A


DATA_B9B73D:
	dw $22D3

CODE_B9B73F:
	dw $2607
	dw $2684

DATA_B9B743:
	dw $2616
	dw $2981
	dw $256C
	dw $25F8
	dw $28D7
	dw $285A
	dw $2602
	dw $2643
	dw $29F9
	dw $297C
	dw $0249
	dw $3034
	dw $03B1
	dw $0384
	dw $01E0
	dw $3638
	dw $385E
	dw $0640
	dw $351B
	dw $064F
	dw $0654
	dw $36D3
	dw $39DF
	dw $39AD
	dw $8005


DATA_B9B775:
	dw !null_pointer
	dw DATA_B9B78F
	dw DATA_B9B79F
	dw DATA_B9B7AF
	dw DATA_B9B7C0
	dw DATA_B9B7CE
	dw DATA_B9B7D9
	dw DATA_B9B7E4
	dw DATA_B9B7F2
	dw DATA_B9B800
	dw DATA_B9B80E
	dw DATA_B9B819
	dw DATA_B9B827

DATA_B9B78F:
	dw $FDC0 : dl $7F2000 : dw $FDBF
	db $23 : dw $071C
	db $FF : db $20
	db $0D : dw $07CB
	db $00

DATA_B9B79F:
	dw $FDC0 : dl $7F2000 : dw $FDBF
	db $FF : db $23
	db $20 : dw $067C
	db $0D : dw $07CB
	db $00

DATA_B9B7AF:
	dw $FDC0 : dl $7F2000 : dw $FDBF
	db $23 : dw $071C
	db $20 : dw $067C
	db $0D : dw $07CB
	db $00

DATA_B9B7C0:
	dw $FD00 : dl $7F0000 : dw $FCFF
	db $23 : dw $071C
	db $20 : dw $067C
	db $00

DATA_B9B7CE:
	dw $FF86 : dl $7F8000 : dw $FF85
	db $17 : dw $0AB9
	db $00

DATA_B9B7D9:
	dw $FFDB : dl $7F2000 : dw $FFDA
	db $06 : dw $080C
	db $00

DATA_B9B7E4:
	dw $FF4A : dl $7F2000 : dw $FF49
	db $05 : dw $09D3
	db $1E : dw $082A
	db $00

DATA_B9B7F2:
	dw $FF27 : dl $7F2000 : dw $FF26
	db $05 : dw $09D3
	db $25 : dw $08C0
	db $00

DATA_B9B800:
	dw $FF81 : dl $7F2000 : dw $FF80
	db $05 : dw $09D3
	db $13 : dw $0974
	db $00

DATA_B9B80E:
	dw $FFB8 : dl $7F2000 : dw $FFB7
	db $0D : dw $09EC
	db $00

DATA_B9B819:
	dw $FF60 : dl $7F0000 : dw $FF5F
	db $0E : dw $0A2D
	db $0E : dw $0A73
	db $00

DATA_B9B827:
	dw $FF60 : dl $7F0000 : dw $FF5F
	db $FF : db $0E
	db $06 : dw $067C
	db $06 : dw $071C
	db $00

CODE_B9B837:
	LDX.b current_sprite			;$B9B837
	LDA.b $1E,x				;$B9B839
	EOR.w #$8000				;$B9B83B
	STA.b $1E,x				;$B9B83E
	RTS					;$B9B840

CODE_B9B841:
	JSL.l CODE_BBAB46			;$B9B841
	BCC.b CODE_B9B84B			;$B9B845
	STZ.b $48,x				;$B9B847
	INC.b $46,x				;$B9B849
CODE_B9B84B:
	RTS					;$B9B84B

CODE_B9B84C:
	JSL.l delete_sprite_handle_deallocation	;$B9B84C
	STZ.b $48,x				;$B9B850
	INC.b $46,x				;$B9B852
	RTS					;$B9B854

CODE_B9B855:
	JMP.w CODE_B9A1B0			;$B9B855

CODE_B9B858:
	JMP.w CODE_B9A1B7			;$B9B858

CODE_B9B85B:
	LDA.b $2E,x				;$B9B85B
	BPL.b CODE_B9B855			;$B9B85D
	CMP.w #$FE00				;$B9B85F
	BCC.b CODE_B9B858			;$B9B862
	JMP.w CODE_B9A1B0			;$B9B864

CODE_B9B867:
	LDA.b $30,x				;$B9B867
	BEQ.b CODE_B9B878			;$B9B869
	LSR					;$B9B86B
	EOR.b $1E,x				;$B9B86C
	AND.w #$4000				;$B9B86E
	BEQ.b CODE_B9B878			;$B9B871
	TYA					;$B9B873
	JSL.l CODE_B9A0BA			;$B9B874
CODE_B9B878:
	RTS					;$B9B878

CODE_B9B879:
	LDA.b $28,x				;$B9B879
	AND.w #$0001				;$B9B87B
	BEQ.b CODE_B9B858			;$B9B87E
	JMP.w CODE_B9A1B0			;$B9B880

CODE_B9B883:
	LDA.b $2E,x				;$B9B883
	BPL.b CODE_B9B858			;$B9B885
	JMP.w CODE_B9A1B0			;$B9B887

CODE_B9B88A:
	INC.b $38,x				;$B9B88A
	RTS					;$B9B88C

CODE_B9B88D:
	STA.b $1A				;$B9B88D
	LDY.w active_kong_sprite		;$B9B88F
	LDA.w $0012,y				;$B9B892
	SEC					;$B9B895
	SBC.b $12,x				;$B9B896
	CLC					;$B9B898
	ADC.b $68,x				;$B9B899
	CMP.w #$8000				;$B9B89B
	ROR					;$B9B89E
	CMP.b $68,x				;$B9B89F
	BCC.b CODE_B9B8B0			;$B9B8A1
	EOR.b $1E,x				;$B9B8A3
	AND.w #$4000				;$B9B8A5
	BEQ.b CODE_B9B8B0			;$B9B8A8
	LDA.b $1A				;$B9B8AA
	JSL.l CODE_B9A0BA			;$B9B8AC
CODE_B9B8B0:
	RTS					;$B9B8B0

CODE_B9B8B1:
	STA.b $1A				;$B9B8B1
	LDY.w active_kong_sprite		;$B9B8B3
	LDA.w $0012,y				;$B9B8B6
	SEC					;$B9B8B9
	SBC.b $12,x				;$B9B8BA
	CLC					;$B9B8BC
	ADC.w #$0008				;$B9B8BD
	CMP.w #$8000				;$B9B8C0
	ROR					;$B9B8C3
	CMP.w #$0008				;$B9B8C4
	BCC.b CODE_B9B8D4			;$B9B8C7
	EOR.b $1E,x				;$B9B8C9
	ASL					;$B9B8CB
	BPL.b CODE_B9B8D4			;$B9B8CC
	LDA.b $1A				;$B9B8CE
	JSL.l CODE_B9A0BA			;$B9B8D0
CODE_B9B8D4:
	RTS					;$B9B8D4

CODE_B9B8D5:								; Note: Related to the rotating cylinder in the intro.
	LDY.b $5C,x				;$B9B8D5
	LDA.w $0000,y				;$B9B8D7
	BEQ.b CODE_B9B8E7			;$B9B8DA
	LDA.w #$0000				;$B9B8DC
	STA.w $0000,y				;$B9B8DF
	LDA.w #DATA_F94039			;$B9B8E2
	STA.b $46,x				;$B9B8E5
CODE_B9B8E7:
	RTS					;$B9B8E7

CODE_B9B8E8:
	LDA.w #$FFFF				;$B9B8E8
	TRB.w $1600				;$B9B8EB
	BEQ.b CODE_B9B8F2			;$B9B8EE
	CLC					;$B9B8F0
	RTS					;$B9B8F1

CODE_B9B8F2:
	SEC					;$B9B8F2
	RTS					;$B9B8F3

CODE_B9B8F4:
	LDA.w #$F800				;$B9B8F4
	STA.b $2E,x				;$B9B8F7
	LDA.w #$0200				;$B9B8F9
	STA.b $2A,x				;$B9B8FC
	RTS					;$B9B8FE

CODE_B9B8FF:
	LDA.w #$FFFF				;$B9B8FF
	TRB.w $15FE				;$B9B902
	BNE.b CODE_B9B90A			;$B9B905
	JMP.w CODE_B9A1B7			;$B9B907

CODE_B9B90A:
	JMP.w CODE_B9A1B0			;$B9B90A

CODE_B9B90D:
	LDA.w #$0001				;$B9B90D
	STA.w $1602				;$B9B910
	RTS					;$B9B913

CODE_B9B914:
	LDA.w #$0011				;$B9B914
	STA.w PPU.screens			;$B9B917
	LDA.w #$FFF8				;$B9B91A
	STA.w $1989				;$B9B91D
	RTS					;$B9B920

CODE_B9B921:
	LDA.w #$0000				;$B9B921
	STA.b $58,x				;$B9B924
	RTS					;$B9B926

CODE_B9B927:
	LDA.w #$F8FC				;$B9B927
	STA.b $58,x				;$B9B92A
	RTS					;$B9B92C

CODE_B9B92D:
	LDA.w #$F0F8				;$B9B92D
	STA.b $58,x				;$B9B930
	RTS					;$B9B932

CODE_B9B933:
	LDA.l $7EA35A				;$B9B933
	BEQ.b CODE_B9B93E			;$B9B937
	LDA.w #DATA_F9413B			;$B9B939
	STA.b $46,x				;$B9B93C
CODE_B9B93E:
	RTS					;$B9B93E

CODE_B9B93F:
	LDX.w parent_level_number		;$B9B93F
	LDA.l $000632,x				;$B9B942
	AND.w #$001C				;$B9B946
	CMP.w #$001C				;$B9B949
	RTS					;$B9B94C

CODE_B9B94D:
	LDA.b $5E,x				;$B9B94D
	BEQ.b CODE_B9B954			;$B9B94F
	JMP.w CODE_B9A1B0			;$B9B951

CODE_B9B954:
	JMP.w CODE_B9A1B7			;$B9B954

CODE_B9B957:
	LDA.b $1E,x				;$B9B957
	CLC					;$B9B959
	ADC.w #$000E				;$B9B95A
	AND.w #$FFEE				;$B9B95D
	STA.b $1E,x				;$B9B960
	RTS					;$B9B962

CODE_B9B963:
	LDA.b $38,x				;$B9B963
	CMP.w #$0001				;$B9B965
	RTS					;$B9B968

CODE_B9B969:
	LDA.w #$0008				;$B9B969
	LDY.w $04EA				;$B9B96C
	CPY.w #$0002				;$B9B96F
	BEQ.b CODE_B9B97C			;$B9B972
	LDA.w #$0004				;$B9B974
	BCC.b CODE_B9B97C			;$B9B977
	LDA.w #$0010				;$B9B979
CODE_B9B97C:
	LDX.w parent_level_number		;$B9B97C
	AND.w $0632,x				;$B9B97F
	LDX.b current_sprite			;$B9B982
	STA.b $5C,x				;$B9B984
	CMP.w #$0001				;$B9B986
	RTS					;$B9B989

CODE_B9B98A:
	LDA.w $05AF				;$B9B98A
	AND.w #$4000				;$B9B98D
	BNE.b CODE_B9B999			;$B9B990
	LDA.w #$0606				;$B9B992
	JSL.l CODE_B28012			;$B9B995
CODE_B9B999:
	RTS					;$B9B999

CODE_B9B99A:
	LDA.b $26,x				;$B9B99A
	AND.w #$8002				;$B9B99C
	BEQ.b CODE_B9B9AD			;$B9B99F
	RTS					;$B9B9A1

CODE_B9B9A2:
	LDA.b $26,x				;$B9B9A2
	AND.w #$8002				;$B9B9A4
	CMP.w #$8002				;$B9B9A7
	BEQ.b CODE_B9B9AD			;$B9B9AA
	RTS					;$B9B9AC

CODE_B9B9AD:
	LDA.b $26,x				;$B9B9AD
	EOR.w #$8002				;$B9B9AF
	STA.b $26,x				;$B9B9B2
	EOR.b $1E,x				;$B9B9B4
	AND.w #$0E00				;$B9B9B6
	TAY					;$B9B9B9
	EOR.b $26,x				;$B9B9BA
	STA.b $26,x				;$B9B9BC
	TYA					;$B9B9BE
	EOR.b $1E,x				;$B9B9BF
	STA.b $1E,x				;$B9B9C1
	RTS					;$B9B9C3

CODE_B9B9C4:
	INC.w $1877				;$B9B9C4
	BIT.w $1877				;$B9B9C7
	BVC.b CODE_B9B9CF			;$B9B9CA
	JMP.w CODE_B9A1B0			;$B9B9CC

CODE_B9B9CF:
	JMP.w CODE_B9A1B7			;$B9B9CF

CODE_B9B9D2:
	LDA.w #$8000				;$B9B9D2
	STA.w $1877				;$B9B9D5
	RTS					;$B9B9D8

CODE_B9B9D9:
	LDA.b current_animal_type		;$B9B9D9
	CMP.w #$023C				;$B9B9DB
	BEQ.b CODE_B9BA02			;$B9B9DE
	JSL.l CODE_B9E021			;$B9B9E0
	LDA.w $1875				;$B9B9E4
	STA.b $3A,x				;$B9B9E7
	LDA.w $1873				;$B9B9E9
	STA.b $0E,x				;$B9B9EC
	LDY.w #$0006				;$B9B9EE
	LDA.b [$6A],y				;$B9B9F1
	STA.b $38,x				;$B9B9F3
	LDY.w #$0008				;$B9B9F5
	LDA.b [$6A],y				;$B9B9F8
	JSL.l CODE_B9A0BA			;$B9B9FA
	STZ.w current_held_sprite		;$B9B9FE
	RTS					;$B9BA01

CODE_B9BA02:
	JSR.w CODE_B9AF4B			;$B9BA02
	LDA.w $1875				;$B9BA05
	STA.b $3A,x				;$B9BA08
	LDA.w $1873				;$B9BA0A
	STA.b $0E,x				;$B9BA0D
	LDY.w #$0006				;$B9BA0F
	LDA.b [$6A],y				;$B9BA12
	STA.b $38,x				;$B9BA14
	LDY.w #$0008				;$B9BA16
	LDA.b [$6A],y				;$B9BA19
	JSL.l CODE_B9A0BA			;$B9BA1B
	STZ.w current_held_sprite		;$B9BA1F
	RTS					;$B9BA22

CODE_B9BA23:
	LDA.w $050F				;$B9BA23
	STA.b $16,x				;$B9BA26
	RTS					;$B9BA28

CODE_B9BA29:
	LDA.b $5C,x				;$B9BA29
	BEQ.b CODE_B9BA37			;$B9BA2B
	LDA.b $5E,x				;$B9BA2D
	BNE.b CODE_B9BA34			;$B9BA2F
	JMP.w CODE_B9A1B7			;$B9BA31

CODE_B9BA34:
	JMP.w CODE_B9A1B0			;$B9BA34

CODE_B9BA37:
	JSR.w CODE_B9B84C			;$B9BA37
	LDY.b current_sprite			;$B9BA3A
	LDX.b $5C,y				;$B9BA3C
	BEQ.b CODE_B9BA42			;$B9BA3E
	STZ.b $5C,x				;$B9BA40
CODE_B9BA42:
	RTS					;$B9BA42

CODE_B9BA43:
	LDA.b $5E,x				;$B9BA43
	AND.w #$FF00				;$B9BA45
	LSR					;$B9BA48
	LSR					;$B9BA49
	LSR					;$B9BA4A
	LSR					;$B9BA4B
	ADC.w #$0100				;$B9BA4C
	STA.b $44,x				;$B9BA4F
	RTS					;$B9BA51

CODE_B9BA52:
	LDA.b $5E,x				;$B9BA52
	BNE.b CODE_B9BA69			;$B9BA54
	LDA.w #DATA_F947F4			;$B9BA56
	STA.b $46,x				;$B9BA59
	STZ.b $48,x				;$B9BA5B
	RTS					;$B9BA5D

CODE_B9BA5E:
	LDA.b $5E,x				;$B9BA5E
	BEQ.b CODE_B9BA69			;$B9BA60
	LDA.w #$0182				;$B9BA62
	JSL.l CODE_B9A0BA			;$B9BA65
CODE_B9BA69:
	RTS					;$B9BA69

CODE_B9BA6A:
	LDA.b $4A,x				;$B9BA6A
	TAX					;$B9BA6C
	LDA.b $38,x				;$B9BA6D
	CMP.w #$000B				;$B9BA6F
	BEQ.b CODE_B9BA77			;$B9BA72
	JMP.w CODE_B9A1B7			;$B9BA74

CODE_B9BA77:
	JMP.w CODE_B9A1B0			;$B9BA77

CODE_B9BA7A:
	LDY.w active_kong_sprite		;$B9BA7A
	LDA.b $12,x				;$B9BA7D
	SEC					;$B9BA7F
	SBC.w $0012,y				;$B9BA80
	LSR					;$B9BA83
	EOR.b $1E,x				;$B9BA84
	ASL					;$B9BA86
	ASL					;$B9BA87
	RTS					;$B9BA88

CODE_B9BA89:
	LDY.w active_kong_sprite		;$B9BA89
	LDA.b $12,x				;$B9BA8C
	CLC					;$B9BA8E
	ADC.w #$0080				;$B9BA8F
	CMP.w $0012,y				;$B9BA92
	RTS					;$B9BA95

CODE_B9BA96:
	LDY.w #$0136				;$B9BA96
	JMP.w CODE_B9B867			;$B9BA99

CODE_B9BA9C:
	LDY.w #$013F				;$B9BA9C
	JMP.w CODE_B9B867			;$B9BA9F

CODE_B9BAA2:
	LDA.w #$0142				;$B9BAA2
	JMP.w CODE_B9B88D			;$B9BAA5

CODE_B9BAA8:
	LDA.w #$013A				;$B9BAA8
	JMP.w CODE_B9B88D			;$B9BAAB

CODE_B9BAAE:
	LDY.w #$013C				;$B9BAAE
	LDA.w #$0006				;$B9BAB1
	JMP.w CODE_B9BAB7			;$B9BAB4

CODE_B9BAB7:
	STA.w CPU.multiply_A			;$B9BAB7
	LDA.b $5A,x				;$B9BABA
	AND.w #$00FF				;$B9BABC
	CMP.w #$000A				;$B9BABF
	BCC.b CODE_B9BAFF			;$B9BAC2
	CMP.w #$000C				;$B9BAC4
	BCS.b CODE_B9BAFF			;$B9BAC7
	LDA.b $30,x				;$B9BAC9
	BPL.b CODE_B9BAD1			;$B9BACB
	EOR.w #$FFFF				;$B9BACD
	INC					;$B9BAD0
CODE_B9BAD1:
	ASL					;$B9BAD1
	ASL					;$B9BAD2
	XBA					;$B9BAD3
	STA.w CPU.multiply_B			;$B9BAD4
	LDA.b $60,x				;$B9BAD7
	CLC					;$B9BAD9
	ADC.w #$4000				;$B9BADA
	STA.b $3E				;$B9BADD
	LDA.w CPU.multiply_result		;$B9BADF
	XBA					;$B9BAE2
	LSR					;$B9BAE3
	LSR					;$B9BAE4
	BIT.b $30,x				;$B9BAE5
	BPL.b CODE_B9BAED			;$B9BAE7
	EOR.w #$FFFF				;$B9BAE9
	SEC					;$B9BAEC
CODE_B9BAED:
	ADC.b $3E				;$B9BAED
	EOR.b $30,x				;$B9BAEF
	LSR					;$B9BAF1
	EOR.b $1E,x				;$B9BAF2
	AND.w #$4000				;$B9BAF4
	BEQ.b CODE_B9BAFE			;$B9BAF7
	TYA					;$B9BAF9
	JSL.l CODE_B9A0BA			;$B9BAFA
CODE_B9BAFE:
	RTS					;$B9BAFE

CODE_B9BAFF:
	JMP.w CODE_B9B867			;$B9BAFF

CODE_B9BB02:
	LDA.b $1E,x				;$B9BB02
	CLC					;$B9BB04
	ADC.w #$000E				;$B9BB05
	AND.w #$FFEE				;$B9BB08
	STA.b $1E,x				;$B9BB0B
	RTS					;$B9BB0D

CODE_B9BB0E:
	LDA.w #$0080				;$B9BB0E
CODE_B9BB11:
	STA.b $44,x				;$B9BB11
	RTS					;$B9BB13

CODE_B9BB14:
	LDA.w #$0100				;$B9BB14
	BRA.b CODE_B9BB11			;$B9BB17

CODE_B9BB19:
	LDA.w #$0000				;$B9BB19
	BRA.b CODE_B9BB26			;$B9BB1C

CODE_B9BB1E:
	LDA.w #$0004				;$B9BB1E
	BRA.b CODE_B9BB26			;$B9BB21

CODE_B9BB23:
	LDA.w #$0008				;$B9BB23
CODE_B9BB26:
	LDX.b current_sprite			;$B9BB26
	LDY.b $5C,x				;$B9BB28
	BEQ.b CODE_B9BB3D			;$B9BB2A
	STA.w $0058,y				;$B9BB2C
	LDA.b $1E,x				;$B9BB2F
	ASL					;$B9BB31
	BPL.b CODE_B9BB3D			;$B9BB32
	LDA.w $0058,y				;$B9BB34
	EOR.w #$00FF				;$B9BB37
	STA.w $0058,y				;$B9BB3A
CODE_B9BB3D:
	RTS					;$B9BB3D

CODE_B9BB3E:
	LDA.b $1E,x				;$B9BB3E
	AND.w #$EFFF				;$B9BB40
	STA.b $1E,x				;$B9BB43
	RTS					;$B9BB45

CODE_B9BB46:
	LDA.w #$02B4				;$B9BB46
	JMP.w CODE_B9B8B1			;$B9BB49

CODE_B9BB4C:
	STZ.b $58,x				;$B9BB4C
	RTS					;$B9BB4E

CODE_B9BB4F:
	LDA.w #$FE00				;$B9BB4F
	BRA.b CODE_B9BB57			;$B9BB52

CODE_B9BB54:
	LDA.w #$FC00				;$B9BB54
CODE_B9BB57:
	STA.b $58,x				;$B9BB57
	RTS					;$B9BB59

CODE_B9BB5A:
	LDY.w #$02AA				;$B9BB5A
	JMP.w CODE_B9B867			;$B9BB5D

CODE_B9BB60:
	LDY.w #$02C7				;$B9BB60
	JMP.w CODE_B9B867			;$B9BB63

CODE_B9BB66:
	LDY.w #$02BF				;$B9BB66
	JMP.w CODE_B9B867			;$B9BB69

CODE_B9BB6C:
	LDA.w #$0272				;$B9BB6C
	JMP.w CODE_B9B8B1			;$B9BB6F

CODE_B9BB72:
	LDA.w #$0278				;$B9BB72
	JMP.w CODE_B9B8B1			;$B9BB75

CODE_B9BB78:
	LDY.w #$0275				;$B9BB78
	JMP.w CODE_B9B867			;$B9BB7B

CODE_B9BB7E:
	LDA.w #$0038				;$B9BB7E
	JSR.w CODE_B9BC42			;$B9BB81
	LDY.w #$026F				;$B9BB84
	JMP.w CODE_B9B867			;$B9BB87

CODE_B9BB8A:
	LDA.w #$0035				;$B9BB8A
	JSR.w CODE_B9BC42			;$B9BB8D
	LDY.w #$022D				;$B9BB90
	JMP.w CODE_B9B867			;$B9BB93

CODE_B9BB96:
	LDX.b current_sprite			;$B9BB96
	LDA.b $38,x				;$B9BB98
	AND.w #$00FF				;$B9BB9A
	CMP.w #$000C				;$B9BB9D
	BNE.b CODE_B9BBA3			;$B9BBA0
	RTS					;$B9BBA2

CODE_B9BBA3:
	LDY.w #$022C				;$B9BBA3
	JMP.w CODE_B9B867			;$B9BBA6

CODE_B9BBA9:
	LDA.w #$023A				;$B9BBA9
	JMP.w CODE_B9B8B1			;$B9BBAC

CODE_B9BBAF:
	LDY.b $68,x				;$B9BBAF
	LDA.b $1E,x				;$B9BBB1
	AND.w #$4000				;$B9BBB3
	EOR.w $001E,y				;$B9BBB6
	AND.w #$4000				;$B9BBB9
	EOR.w $001E,y				;$B9BBBC
	STA.w $001E,y				;$B9BBBF
	TYX					;$B9BBC2
CODE_B9BBC3:
	STZ.b $26,x				;$B9BBC3
	RTS					;$B9BBC5

CODE_B9BBC6:
	LDY.b $68,x				;$B9BBC6
	TYX					;$B9BBC8
CODE_B9BBC9:
	LDA.w #$C000				;$B9BBC9
	STA.b $26,x				;$B9BBCC
	RTS					;$B9BBCE

CODE_B9BBCF:
	LDX.b current_sprite			;$B9BBCF
	LDA.b $44,x				;$B9BBD1
	CLC					;$B9BBD3
	ADC.w #$000E				;$B9BBD4
	STA.b $44,x				;$B9BBD7
	RTS					;$B9BBD9

CODE_B9BBDA:
	LDX.b current_sprite			;$B9BBDA
	LDA.b $44,x				;$B9BBDC
	SEC					;$B9BBDE
	SBC.w #$0005				;$B9BBDF
	STA.b $44,x				;$B9BBE2
	RTS					;$B9BBE4

CODE_B9BBE5:
	LDA.w #$0058				;$B9BBE5
	BRA.b CODE_B9BC42			;$B9BBE8

CODE_B9BBEA:
	LDA.w #$0000				;$B9BBEA
	BRA.b CODE_B9BC42			;$B9BBED

CODE_B9BBEF:
	LDA.w #$004C				;$B9BBEF
	BRA.b CODE_B9BC42			;$B9BBF2

CODE_B9BBF4:
	LDA.w #$0042				;$B9BBF4
	BRA.b CODE_B9BC42			;$B9BBF7

CODE_B9BBF9:
	LDA.w #$0041				;$B9BBF9
	BRA.b CODE_B9BC42			;$B9BBFC

CODE_B9BBFE:
	LDA.w #$003E				;$B9BBFE
	BRA.b CODE_B9BC42			;$B9BC01

CODE_B9BC03:
	LDA.w #$0039				;$B9BC03
	BRA.b CODE_B9BC42			;$B9BC06

CODE_B9BC08:
	LDA.w #$002C				;$B9BC08
	BRA.b CODE_B9BC42			;$B9BC0B

CODE_B9BC0D:
	LDA.w #$002A				;$B9BC0D
	BRA.b CODE_B9BC42			;$B9BC10

CODE_B9BC12:
	LDA.w #$0029				;$B9BC12
	BRA.b CODE_B9BC42			;$B9BC15

CODE_B9BC17:
	LDA.w #$0027				;$B9BC17
	BRA.b CODE_B9BC42			;$B9BC1A

CODE_B9BC1C:
	LDA.w #$0026				;$B9BC1C
	BRA.b CODE_B9BC42			;$B9BC1F

CODE_B9BC21:
	LDA.w #$0021				;$B9BC21
	BRA.b CODE_B9BC42			;$B9BC24

CODE_B9BC26:
	LDA.w #$0020				;$B9BC26
	BRA.b CODE_B9BC42			;$B9BC29

CODE_B9BC2B:
	LDA.w #$001F				;$B9BC2B
	BRA.b CODE_B9BC42			;$B9BC2E

CODE_B9BC30:
	LDA.w #$0001				;$B9BC30
	BRA.b CODE_B9BC42			;$B9BC33

CODE_B9BC35:
	LDA.w #$000C				;$B9BC35
	BRA.b CODE_B9BC42			;$B9BC38

CODE_B9BC3A:
	LDA.w #$000A				;$B9BC3A
	BRA.b CODE_B9BC42			;$B9BC3D

CODE_B9BC3F:
	LDA.w #$0006				;$B9BC3F
CODE_B9BC42:
	JSL.l CODE_B6F54C			;$B9BC42
	RTS					;$B9BC46

CODE_B9BC47:
	LDA.w #$0007				;$B9BC47
	BRA.b CODE_B9BC42			;$B9BC4A

CODE_B9BC4C:
	LDA.w #$0008				;$B9BC4C
	BRA.b CODE_B9BC42			;$B9BC4F

CODE_B9BC51:
	LDA.w #$0011				;$B9BC51
	BRA.b CODE_B9BC42			;$B9BC54

CODE_B9BC56:
	LDA.w #$0012				;$B9BC56
	BRA.b CODE_B9BC42			;$B9BC59

CODE_B9BC5B:
	LDA.w #$0013				;$B9BC5B
	BRA.b CODE_B9BC42			;$B9BC5E

CODE_B9BC60:
	LDA.w #$0015				;$B9BC60
	BRA.b CODE_B9BC42			;$B9BC63

CODE_B9BC65:
	LDA.w #$0018				;$B9BC65
	BRA.b CODE_B9BC42			;$B9BC68

CODE_B9BC6A:
	LDA.w #$001C				;$B9BC6A
	BRA.b CODE_B9BC42			;$B9BC6D

CODE_B9BC6F:
	LDA.w #$0052				;$B9BC6F
	BRA.b CODE_B9BC42			;$B9BC72

CODE_B9BC74:
	LDA.w #$0053				;$B9BC74
	BRA.b CODE_B9BC42			;$B9BC77

CODE_B9BC79:
	LDX.w $1B6B				;$B9BC79
	LDA.b $2E,x				;$B9BC7C
	EOR.w #$FFFF				;$B9BC7E
	ASL					;$B9BC81
	RTS					;$B9BC82

CODE_B9BC83:
	LDX.w $1B6B				;$B9BC83
	LDA.b $66,x				;$B9BC86
	ASL					;$B9BC88
	ASL					;$B9BC89
	ASL					;$B9BC8A
	ASL					;$B9BC8B
	EOR.w #$FFFF				;$B9BC8C
	INC					;$B9BC8F
	CMP.b $2E,x				;$B9BC90
	BCS.b CODE_B9BC96			;$B9BC92
	SEC					;$B9BC94
	RTS					;$B9BC95

CODE_B9BC96:
	CLC					;$B9BC96
	RTS					;$B9BC97

CODE_B9BC98:
	LDA.w #$002A				;$B9BC98
	BRA.b CODE_B9BCA0			;$B9BC9B

CODE_B9BC9D:
	LDA.w #$001A				;$B9BC9D
CODE_B9BCA0:
	JSL.l CODE_B5F358			;$B9BCA0
	RTS					;$B9BCA4

CODE_B9BCA5:
	LDA.b $38,x				;$B9BCA5
	CMP.w #$000D				;$B9BCA7
	BEQ.b CODE_B9BCB1			;$B9BCAA
	CMP.w #$0011				;$B9BCAC
	BNE.b CODE_B9BCB2			;$B9BCAF
CODE_B9BCB1:
	RTS					;$B9BCB1

CODE_B9BCB2:
	BRA.b CODE_B9BCB7			;$B9BCB2

CODE_B9BCB4:
	STZ.b $38,x				;$B9BCB4
	RTS					;$B9BCB6

CODE_B9BCB7:
	LDA.w #$0080				;$B9BCB7
	STA.b $1A				;$B9BCBA
CODE_B9BCBC:
	LDA.b $2A,x				;$B9BCBC
	JSR.w CODE_B9BD07			;$B9BCBE
	BCC.b CODE_B9BCED			;$B9BCC1
	BPL.b CODE_B9BCCE			;$B9BCC3
	LDA.b $1E,x				;$B9BCC5
	ORA.w #$4000				;$B9BCC7
	STA.b $1E,x				;$B9BCCA
	BRA.b CODE_B9BCD5			;$B9BCCC

CODE_B9BCCE:
	LDA.b $1E,x				;$B9BCCE
	AND.w #$BFFF				;$B9BCD0
	STA.b $1E,x				;$B9BCD3
CODE_B9BCD5:
	LDA.b $2E,x				;$B9BCD5
	JSR.w CODE_B9BD07			;$B9BCD7
	BCC.b CODE_B9BCE3			;$B9BCDA
	BPL.b CODE_B9BCE8			;$B9BCDC
	LDA.w #$0001				;$B9BCDE
	BRA.b CODE_B9BCFB			;$B9BCE1

CODE_B9BCE3:
	LDA.w #$0002				;$B9BCE3
	BRA.b CODE_B9BCFB			;$B9BCE6

CODE_B9BCE8:
	LDA.w #$0003				;$B9BCE8
	BRA.b CODE_B9BCFB			;$B9BCEB

CODE_B9BCED:
	LDA.b $2E,x				;$B9BCED
	BEQ.b CODE_B9BD06			;$B9BCEF
	BPL.b CODE_B9BCF8			;$B9BCF1
	LDA.w #$0000				;$B9BCF3
	BRA.b CODE_B9BCFB			;$B9BCF6

CODE_B9BCF8:
	LDA.w #$0004				;$B9BCF8
CODE_B9BCFB:
	CLC					;$B9BCFB
	ADC.b $3C,x				;$B9BCFC
	CMP.b $40,x				;$B9BCFE
	BEQ.b CODE_B9BD06			;$B9BD00
	JSL.l CODE_B9A0BA			;$B9BD02
CODE_B9BD06:
	RTS					;$B9BD06

CODE_B9BD07:
	TAY					;$B9BD07
	BMI.b CODE_B9BD0E			;$B9BD08
CODE_B9BD0A:
	CMP.b $1A				;$B9BD0A
	TYA					;$B9BD0C
	RTS					;$B9BD0D

CODE_B9BD0E:
	EOR.w #$FFFF				;$B9BD0E
	INC					;$B9BD11
	BRA.b CODE_B9BD0A			;$B9BD12

CODE_B9BD14:
	LDY.b $6C,x				;$B9BD14
	BEQ.b CODE_B9BD32			;$B9BD16
	LDA.w $001E,y				;$B9BD18
	EOR.b $1E,x				;$B9BD1B
	AND.w #$F000				;$B9BD1D
	EOR.b $1E,x				;$B9BD20
	STA.b $1E,x				;$B9BD22
	LDA.w $0050,y				;$B9BD24
	CLC					;$B9BD27
	ADC.b $3C,x				;$B9BD28
	CMP.b $40,x				;$B9BD2A
	BEQ.b CODE_B9BD32			;$B9BD2C
	JSL.l CODE_B9A0BA			;$B9BD2E
CODE_B9BD32:
	RTS					;$B9BD32

CODE_B9BD33:
	LDA.b $38,x				;$B9BD33
	BEQ.b CODE_B9BD7E			;$B9BD35
	CPX.w follower_kong_sprite		;$B9BD37
	BEQ.b CODE_B9BD44			;$B9BD3A
	LDA.w $04D6				;$B9BD3C
	BIT.w #$0F00				;$B9BD3F
	BEQ.b CODE_B9BD75			;$B9BD42
CODE_B9BD44:
	LDA.b $60,x				;$B9BD44
	CMP.w #$0200				;$B9BD46
	BPL.b CODE_B9BD54			;$B9BD49
	LDA.b $1E,x				;$B9BD4B
	AND.w #$BFFF				;$B9BD4D
	STA.b $1E,x				;$B9BD50
	BRA.b CODE_B9BD5B			;$B9BD52

CODE_B9BD54:
	LDA.b $1E,x				;$B9BD54
	ORA.w #$4000				;$B9BD56
	STA.b $1E,x				;$B9BD59
CODE_B9BD5B:
	LDA.b $60,x				;$B9BD5B
	LSR					;$B9BD5D
	LSR					;$B9BD5E
	LSR					;$B9BD5F
	LSR					;$B9BD60
	LSR					;$B9BD61
	LSR					;$B9BD62
	AND.w #$FFFE				;$B9BD63
	TAY					;$B9BD66
	LDA.w DATA_B9BD8B,y			;$B9BD67
	CLC					;$B9BD6A
	ADC.b $3C,x				;$B9BD6B
	CMP.b $40,x				;$B9BD6D
	BEQ.b CODE_B9BD75			;$B9BD6F
	JSL.l CODE_B9A0BA			;$B9BD71
CODE_B9BD75:
	LDA.b $62,x				;$B9BD75
	CLC					;$B9BD77
	ADC.w #$0100				;$B9BD78
	STA.b $44,x				;$B9BD7B
	RTS					;$B9BD7D

CODE_B9BD7E:
	LDA.w #$0313				;$B9BD7E
	STA.b $3C,x				;$B9BD81
	LDA.w #$0040				;$B9BD83
	STA.b $1A				;$B9BD86
	JMP.w CODE_B9BCBC			;$B9BD88

DATA_B9BD8B:
	dw $0000,$0001,$0002,$0003,$0004,$0003,$0002,$0001

CODE_B9BD9B:
	JSL.l CODE_808018			;$B9BD9B
	BIT.w #$0001				;$B9BD9F
	BNE.b CODE_B9BDA6			;$B9BDA2
	CLC					;$B9BDA4
	RTS					;$B9BDA5

CODE_B9BDA6:
	SEC					;$B9BDA6
	RTS					;$B9BDA7

CODE_B9BDA8:
	LDA.b $12,x				;$B9BDA8
	SEC					;$B9BDAA
	SBC.w #$0008				;$B9BDAB
	STA.b $12,x				;$B9BDAE
	RTS					;$B9BDB0

CODE_B9BDB1:
	LDA.b $24,x				;$B9BDB1
	CMP.w #$3AA2				;$B9BDB3
	BCC.b CODE_B9BDBF			;$B9BDB6
	LDA.w #$02E3				;$B9BDB8
	JSL.l CODE_B9A0BA			;$B9BDBB
CODE_B9BDBF:
	RTS					;$B9BDBF

CODE_B9BDC0:
	JSL.l CODE_808018			;$B9BDC0
	AND.w #$0007				;$B9BDC4
	RTS					;$B9BDC7

CODE_B9BDC8:
	LDA.w current_world			;$B9BDC8
	CMP.w #$0008				;$B9BDCB
	BEQ.b CODE_B9BDD6			;$B9BDCE
	LDA.w #$0100				;$B9BDD0
	TRB.w $05FB				;$B9BDD3
CODE_B9BDD6:
	RTS					;$B9BDD6

CODE_B9BDD7:
	LDA.w $062D				;$B9BDD7
	AND.w #$0700				;$B9BDDA
	BEQ.b CODE_B9BE02			;$B9BDDD
	XBA					;$B9BDDF
	DEC					;$B9BDE0
	XBA					;$B9BDE1
	ORA.w #$8000				;$B9BDE2
	STA.w $062D				;$B9BDE5
	LDY.b $68,x				;$B9BDE8
	LDA.w $005E,y				;$B9BDEA
	STA.w $0060,y				;$B9BDED
	LDA.w #$0014				;$B9BDF0
	STA.w $005E,y				;$B9BDF3
	LDA.w #$80A5				;$B9BDF6
	STA.b $24,x				;$B9BDF9
	LDA.w #DATA_F973E3			;$B9BDFB
	STA.b $46,x				;$B9BDFE
	STZ.b $48,x				;$B9BE00
CODE_B9BE02:
	RTS					;$B9BE02

CODE_B9BE03:
	LDY.b $68,x				;$B9BE03
	LDA.w $0060,y				;$B9BE05
	STA.w $005E,y				;$B9BE08
	RTS					;$B9BE0B

CODE_B9BE0C:
	LDY.b $4C,x				;$B9BE0C
	STX.b $5C,y				;$B9BE0E
	RTS					;$B9BE10

CODE_B9BE11:
	LDA.w #$2000				;$B9BE11
	TSB.w $061F				;$B9BE14
	RTS					;$B9BE17

CODE_B9BE18:
	JSL.l CODE_808018			;$B9BE18
	BIT.w #$001F				;$B9BE1C
	BNE.b CODE_B9BE23			;$B9BE1F
	CLC					;$B9BE21
	RTS					;$B9BE22

CODE_B9BE23:
	SEC					;$B9BE23
	RTS					;$B9BE24

CODE_B9BE25:
	LDA.b $5C,x				;$B9BE25
	BEQ.b CODE_B9BE2D			;$B9BE27
	STZ.b $5C,x				;$B9BE29
	CLC					;$B9BE2B
	RTS					;$B9BE2C

CODE_B9BE2D:
	SEC					;$B9BE2D
	RTS					;$B9BE2E

CODE_B9BE2F:
	LDA.w $0604				;$B9BE2F
	AND.w #$00FF				;$B9BE32
	CMP.w #$0005				;$B9BE35
	BNE.b CODE_B9BE43			;$B9BE38
	LDA.w #$0048				;$B9BE3A
	JSL.l CODE_BFF006			;$B9BE3D
	CLC					;$B9BE41
	RTS					;$B9BE42

CODE_B9BE43:
	SEC					;$B9BE43
	RTS					;$B9BE44

CODE_B9BE45:
	LDA.w $0604				;$B9BE45
	AND.w #$00FF				;$B9BE48
	CMP.w #$0005				;$B9BE4B
	BNE.b CODE_B9BE52			;$B9BE4E
	CLC					;$B9BE50
	RTS					;$B9BE51

CODE_B9BE52:
	SEC					;$B9BE52
	RTS					;$B9BE53

CODE_B9BE54:
	LDA.b $1E,x				;$B9BE54
	BIT.w #$4000				;$B9BE56
	BNE.b CODE_B9BE63			;$B9BE59
	LDA.b $16,x				;$B9BE5B
	CLC					;$B9BE5D
	ADC.b $6C,x				;$B9BE5E
	STA.b $16,x				;$B9BE60
	RTS					;$B9BE62

CODE_B9BE63:
	LDA.b $16,x				;$B9BE63
	SEC					;$B9BE65
	SBC.b $6C,x				;$B9BE66
	STA.b $16,x				;$B9BE68
	RTS					;$B9BE6A

CODE_B9BE6B:
	LDY.b $18,x				;$B9BE6B
	LDA.w #$0030				;$B9BE6D
	STA.w $005C,y				;$B9BE70
	RTS					;$B9BE73

CODE_B9BE74:
	LDA.w #$0200				;$B9BE74
	CMP.w $15E8				;$B9BE77
	RTS					;$B9BE7A

CODE_B9BE7B:
	LDA.w #$0100				;$B9BE7B
	STA.w $196D				;$B9BE7E
	STA.w $1973				;$B9BE81
	RTS					;$B9BE84

CODE_B9BE85:
	STA.b $30,x				;$B9BE85
	RTS					;$B9BE87

CODE_B9BE88:
	STA.b $2E,x				;$B9BE88
	RTS					;$B9BE8A

CODE_B9BE8B:
	LDY.w #$03EA				;$B9BE8B
	JSL.l CODE_BB8585			;$B9BE8E
	RTS					;$B9BE92

CODE_B9BE93:
	LDY.w #$03EC				;$B9BE93
	JSL.l CODE_BB8585			;$B9BE96
	RTS					;$B9BE9A

CODE_B9BE9B:
	LDY.w #$03EE				;$B9BE9B
	JSL.l CODE_BB8585			;$B9BE9E
	LDY.b alternate_sprite			;$B9BEA2
	LDX.b current_sprite			;$B9BEA4
	STY.b $5C,x				;$B9BEA6
	RTS					;$B9BEA8

CODE_B9BEA9:
	LDY.b $5C,x				;$B9BEA9
	LDA.b $24,x				;$B9BEAB
	CLC					;$B9BEAD
	ADC.w #$002D				;$B9BEAE
	STA.w $0024,y				;$B9BEB1
	LDA.b $1E,x				;$B9BEB4
	EOR.w $001E,y				;$B9BEB6
	AND.w #$4000				;$B9BEB9
	EOR.w $001E,y				;$B9BEBC
	STA.w $001E,y				;$B9BEBF
	RTS					;$B9BEC2

CODE_B9BEC3:
	LDA.b $2C,x				;$B9BEC3
	INC					;$B9BEC5
	CMP.w #$0020				;$B9BEC6
	BPL.b CODE_B9BECD			;$B9BEC9
	STA.b $2C,x				;$B9BECB
CODE_B9BECD:
	JSL.l CODE_B28021			;$B9BECD
	LDX.b current_sprite			;$B9BED1
	RTS					;$B9BED3

CODE_B9BED4:
	LDY.w #$034E				;$B9BED4
	JSL.l CODE_BB85B8			;$B9BED7
	RTS					;$B9BEDB

CODE_B9BEDC:
	LDA.w $1D35				;$B9BEDC
	CMP.w #$0069				;$B9BEDF
	BEQ.b CODE_B9BEE9			;$B9BEE2
	LDA.w #DATA_F97BC0			;$B9BEE4
	STA.b $46,x				;$B9BEE7
CODE_B9BEE9:
	RTS					;$B9BEE9

CODE_B9BEEA:
	LDY.b $5C,x				;$B9BEEA
	LDA.w #$0000				;$B9BEEC
	STA.w $0044,y				;$B9BEEF
	RTS					;$B9BEF2

CODE_B9BEF3:
	LDY.b $5C,x				;$B9BEF3
	LDA.w #$0100				;$B9BEF5
	STA.w $0044,y				;$B9BEF8
	RTS					;$B9BEFB

CODE_B9BEFC:
	STZ.b $2A,x				;$B9BEFC
	RTS					;$B9BEFE

CODE_B9BEFF:
	LDA.w #$0180				;$B9BEFF
	STA.b $2A,x				;$B9BF02
	RTS					;$B9BF04

CODE_B9BF05:
	STZ.b $3E				;$B9BF05
	LDA.w $1D47				;$B9BF07
	CMP.w #$0002				;$B9BF0A
	BNE.b CODE_B9BF14			;$B9BF0D
	LDA.w #$0008				;$B9BF0F
	STA.b $3E				;$B9BF12
CODE_B9BF14:
	JSL.l CODE_808018			;$B9BF14
	AND.w #$0006				;$B9BF18
	CLC					;$B9BF1B
	ADC.b $3E				;$B9BF1C
	TAY					;$B9BF1E
	LDA.w DATA_B9BF27,y			;$B9BF1F
	STA.b $46,x				;$B9BF22
	STZ.b $48,x				;$B9BF24
	RTS					;$B9BF26

DATA_B9BF27:
	dw DATA_F97CFA
	dw DATA_F97D1E
	dw DATA_F97D1E
	dw DATA_F97D0F
	dw DATA_F97CD6
	dw DATA_F97CFA
	dw DATA_F97CEB
	dw DATA_F97CEB

CODE_B9BF37:
	STZ.b $3E				;$B9BF37
	LDA.w $1D47				;$B9BF39
	CMP.w #$0003				;$B9BF3C
	BNE.b CODE_B9BF46			;$B9BF3F
	LDA.w #$0008				;$B9BF41
	STA.b $3E				;$B9BF44
CODE_B9BF46:
	JSL.l CODE_808018			;$B9BF46
	AND.w #$0006				;$B9BF4A
	CLC					;$B9BF4D
	ADC.b $3E				;$B9BF4E
	TAY					;$B9BF50
	LDA.w DATA_B9BF59,y			;$B9BF51
	STA.b $46,x				;$B9BF54
	STZ.b $48,x				;$B9BF56
	RTS					;$B9BF58

DATA_B9BF59:
	dw DATA_F97DA8
	dw DATA_F97DA8
	dw DATA_F97DA8
	dw DATA_F97D84
	dw DATA_F97D47
	dw DATA_F97D47
	dw DATA_F97D5C
	dw DATA_F97D5C

UNK_B9BF69:
	db $7D,$A8,$7D,$A8,$7D,$84,$7D,$47,$7D,$47,$7D,$5C,$7D,$5C,$7D,$8B
	db $7D,$8B,$7D,$67,$7D,$2A,$7D,$2A,$7D,$3F,$7D,$3F,$7D

CODE_B9BF86:
	STA.b $16,x				;$B9BF86
	RTS					;$B9BF88

CODE_B9BF89:
	LDY.b $18,x				;$B9BF89
	LDA.w #$0030				;$B9BF8B
	STA.w $005C,y				;$B9BF8E
	RTS					;$B9BF91

CODE_B9BF92:
	LDA.w #$0200				;$B9BF92
	CMP.w $15E8				;$B9BF95
	RTS					;$B9BF98

CODE_B9BF99:
	LDA.w #$0100				;$B9BF99
	STA.w $196B				;$B9BF9C
	STA.w $1971				;$B9BF9F
	RTS					;$B9BFA2

CODE_B9BFA3:
	STA.b $30,x				;$B9BFA3
	RTS					;$B9BFA5

CODE_B9BFA6:
	STA.b $2E,x				;$B9BFA6
	RTS					;$B9BFA8

CODE_B9BFA9:
	LDY.w #$03EA				;$B9BFA9
	JSL.l CODE_BB8585			;$B9BFAC
	RTS					;$B9BFB0

CODE_B9BFB1:
	LDY.w #$03EC				;$B9BFB1
	JSL.l CODE_BB8585			;$B9BFB4
	RTS					;$B9BFB8

CODE_B9BFB9:
	LDY.w #$03EE				;$B9BFB9
	JSL.l CODE_BB8585			;$B9BFBC
	LDY.b alternate_sprite			;$B9BFC0
	LDX.b current_sprite			;$B9BFC2
	STY.b $5C,x				;$B9BFC4
	RTS					;$B9BFC6

CODE_B9BFC7:
	LDY.b $5C,x				;$B9BFC7
	LDA.b $24,x				;$B9BFC9
	CLC					;$B9BFCB
	ADC.w #$002D				;$B9BFCC
	STA.w $0024,y				;$B9BFCF
	LDA.b $1E,x				;$B9BFD2
	EOR.w $001E,y				;$B9BFD4
	AND.w #$4000				;$B9BFD7
	EOR.w $001E,y				;$B9BFDA
	STA.w $001E,y				;$B9BFDD
	RTS					;$B9BFE0

CODE_B9BFE1:
	LDA.b $2C,x				;$B9BFE1
	INC					;$B9BFE3
	CMP.w #$0020				;$B9BFE4
	BPL.b CODE_B9BFEB			;$B9BFE7
	STA.b $2C,x				;$B9BFE9
CODE_B9BFEB:
	JSL.l CODE_B28021			;$B9BFEB
	LDX.b current_sprite			;$B9BFEF
	RTS					;$B9BFF1

CODE_B9BFF2:
	LDY.w #$034E				;$B9BFF2
	JSL.l CODE_BB85B8			;$B9BFF5
	RTS					;$B9BFF9

CODE_B9BFFA:
	LDA.w $1D33				;$B9BFFA
	CMP.w #$0069				;$B9BFFD
	BEQ.b CODE_B9C007			;$B9C000
	LDA.w #$7B9F				;$B9C002
	STA.b $46,x				;$B9C005
CODE_B9C007:
	RTS					;$B9C007

CODE_B9C008:
	LDY.b $5C,x				;$B9C008
	LDA.w #$0000				;$B9C00A
	STA.w $0044,y				;$B9C00D
	RTS					;$B9C010

CODE_B9C011:
	LDY.b $5C,x				;$B9C011
	LDA.w #$0100				;$B9C013
	STA.w $0044,y				;$B9C016
	RTS					;$B9C019

CODE_B9C01A:
	STZ.b $2A,x				;$B9C01A
	RTS					;$B9C01C

CODE_B9C01D:
	LDA.w #$0180				;$B9C01D
	STA.b $2A,x				;$B9C020
	RTS					;$B9C022

CODE_B9C023:
	STZ.b $3E				;$B9C023
	LDA.w $1D45				;$B9C025
	CMP.w #$0002				;$B9C028
	BNE.b CODE_B9C032			;$B9C02B
	LDA.w #$0008				;$B9C02D
	STA.b $3E				;$B9C030
CODE_B9C032:
	JSL.l CODE_808018			;$B9C032
	AND.w #$0006				;$B9C036
	CLC					;$B9C039
	ADC.b $3E				;$B9C03A
	TAY					;$B9C03C
	LDA.w DATA_B9C045,y			;$B9C03D
	STA.b $46,x				;$B9C040
	STZ.b $48,x				;$B9C042
	RTS					;$B9C044

DATA_B9C045:
	dw DATA_F97CD9
	dw DATA_F97CFD
	dw DATA_F97CFD
	dw DATA_F97CEE
	dw DATA_F97CB5
	dw DATA_F97CD9
	dw $7CCA		;invalid pointer? look into
	dw $7CCA		;invalid pointer? look into

CODE_B9C055:
	STZ.b $3E				;$B9C055
	LDA.w $1D45				;$B9C057
	CMP.w #$0003				;$B9C05A
	BNE.b CODE_B9C064			;$B9C05D
	LDA.w #$0008				;$B9C05F
	STA.b $3E				;$B9C062
CODE_B9C064:
	JSL.l CODE_808018			;$B9C064
	AND.w #$0006				;$B9C068
	CLC					;$B9C06B
	ADC.b $3E				;$B9C06C
	TAY					;$B9C06E
	LDA.w DATA_B9C077,y			;$B9C06F
	STA.b $46,x				;$B9C072
	STZ.b $48,x				;$B9C074
	RTS					;$B9C076

DATA_B9C077:
	dw DATA_F97D87
	dw DATA_F97D87
	dw DATA_F97D87
	dw $7D63		;invalid pointer? look into
	dw DATA_F97D26
	dw DATA_F97D26
	dw $7D3B		;invalid pointer? look into
	dw $7D3B		;invalid pointer? look into

if !include_garbage_data == 1
check bankcross off
	incbin "data/garbage_data/DKC2_DATA_F9C087.bin"
	incbin "data/garbage_data/DKC1_DATA_F9CD0C.bin"
	incsrc "data/garbage_data/DKC2_CODE_B9D000.asm"
check bankcross full
else
	padbyte $00 : pad $B9E000
endif	

CODE_B9E000:
	JMP.w CODE_B9E02A			;$B9E000

CODE_B9E003:
	JMP.w CODE_B9E02E			;$B9E003

CODE_B9E006:
	JMP.w CODE_B9EEA0			;$B9E006

CODE_B9E009:
	JMP.w CODE_B9F260			;$B9E009

CODE_B9E00C:
	JMP.w CODE_B9F26A			;$B9E00C

CODE_B9E00F:
	JMP.w CODE_B9F4B0			;$B9E00F

CODE_B9E012:
	JMP.w CODE_B9F478			;$B9E012

CODE_B9E015:
	JMP.w CODE_B9F65E			;$B9E015

CODE_B9E018:
	JMP.w CODE_B9F62E			;$B9E018

CODE_B9E01B:
	JMP.w CODE_B9F165			;$B9E01B

CODE_B9E01E:
	JMP.w CODE_B9F163			;$B9E01E

CODE_B9E021:
	JMP.w CODE_B9F7CA			;$B9E021

CODE_B9E024:
	JMP.w CODE_B9EE90			;$B9E024

CODE_B9E027:
	JMP.w CODE_B9F136			;$B9E027

;process_current_movement
CODE_B9E02A:
	LDX.b current_sprite			;$B9E02A
	LDA.b $5A,x				;$B9E02C
;process_alternate_movement
CODE_B9E02E:
	TAY					;$B9E02E
	AND.w #$00FF				;$B9E02F
	ASL					;$B9E032
	TAX					;$B9E033
	TYA					;$B9E034
	XBA					;$B9E035
	AND.w #$00FF				;$B9E036
	ASL					;$B9E039
	LDY.b current_sprite			;$B9E03A
	JSR.w (DATA_B9E042,x)			;$B9E03C
	LDX.b current_sprite			;$B9E03F
	RTL					;$B9E041


;object movement routines
DATA_B9E042:
	dw CODE_B9E0E8			;00					
	dw CODE_B9E0E9			;01
	dw CODE_B9E0EC			;02
	dw CODE_B9E108			;03
	dw CODE_B9E124			;04
	dw CODE_B9E12D			;05
	dw CODE_B9E183			;06
	dw CODE_B9E1DB			;07
	dw CODE_B9E20D			;08
	dw CODE_B9E216			;09
	dw CODE_B9E468			;0A
	dw CODE_B9E48B			;0B
	dw CODE_B9E573			;0C
	dw CODE_B9E5CF			;0D
	dw CODE_B9E5D8			;0E
	dw CODE_B9E626			;0F
	dw CODE_B9E629			;10
	dw CODE_B9E68D			;11
	dw CODE_B9E6A5			;12
	dw CODE_B9E6C2			;13
	dw CODE_B9E7B6			;14
	dw CODE_B9E7DE			;15
	dw CODE_B9E7E8			;16
	dw CODE_B9E853			;17
	dw CODE_B9E86E			;18
	dw CODE_B9E8E1			;19
	dw CODE_B9E91A			;1A
	dw CODE_B9E93A			;1B
	dw CODE_B9E0E8			;1C
	dw CODE_B9E548			;1D
	dw CODE_B9E0E8			;1E
	dw CODE_B9E0E8			;1F
	dw CODE_B9E0E8			;20
	dw CODE_B9E0E8			;21
	dw CODE_B9E0E8			;22
	dw CODE_B9E0E8			;23
	dw CODE_B9E0E8			;24
	dw CODE_B9E0E8			;25
	dw CODE_B9E0E8			;26
	dw CODE_B9E0E8			;27
	dw CODE_B9E0E8			;28
	dw CODE_B9E0E8			;29
	dw CODE_B9E0E8			;2A
	dw CODE_B9E0E8			;2B
	dw CODE_B9E0E8			;2C
	dw CODE_B9E0E8			;2D
	dw CODE_B9E0E8			;2E
	dw CODE_B9E0E8			;2F
	dw CODE_B9E0E8			;30
	dw CODE_B9E0E8			;31
	dw CODE_B9E0E8			;32
	dw CODE_B9E0E8			;33
	dw CODE_B9E0E8			;34
	dw CODE_B9E9A2			;35
	dw CODE_B9E9AB			;36
	dw CODE_B9E9FD			;37
	dw CODE_B9EA8A			;38
	dw CODE_B9EB15			;39
	dw CODE_B9EB21			;3A
	dw CODE_B9EB37			;3B
	dw CODE_B9EB3D			;3C
	dw CODE_B9EB66			;3D
	dw CODE_B9EB98			;3E
	dw CODE_B9EBF2			;3F
	dw CODE_B9EBF8			;40
	dw CODE_B9EC09			;41
	dw CODE_B9EC3C			;42
	dw CODE_B9EC55			;43
	dw CODE_B9ED1A			;44
	dw CODE_B9ED25			;45
	dw CODE_B9ED40			;46
	dw CODE_B9ED5A			;47
	dw CODE_B9ED8A			;48
	dw CODE_B9EDBA			;49
	dw CODE_B9EDC9			;4A
	dw CODE_B9EDD8			;4B
	dw CODE_B9EDE4			;4C
	dw CODE_B9EDE7			;4D
	dw CODE_B9EE06			;4E
	dw CODE_B9EE0D			;4F
	dw CODE_B9EE21			;50
	dw CODE_B9EE2E			;51
	dw CODE_B9EE4C			;52

CODE_B9E0E8:
	RTS					;$B9E0E8

CODE_B9E0E9:
	JSR.w CODE_B9E108			;$B9E0E9
CODE_B9E0EC:
	LDX.w #$0000				;$B9E0EC
	LDA.w $002A,y				;$B9E0EF
	BPL.b CODE_B9E0F5			;$B9E0F2
	DEX					;$B9E0F4
CODE_B9E0F5:
	CLC					;$B9E0F5
	ADC.w $0011,y				;$B9E0F6
	STA.w $0011,y				;$B9E0F9
	SEP.b #$20				;$B9E0FC
	TXA					;$B9E0FE
	ADC.w $0013,y				;$B9E0FF
	STA.w $0013,y				;$B9E102
	REP.b #$20				;$B9E105
	RTS					;$B9E107

CODE_B9E108:
	LDX.w #$0000				;$B9E108
	LDA.w $002E,y				;$B9E10B
	BPL.b CODE_B9E111			;$B9E10E
	DEX					;$B9E110
CODE_B9E111:
	CLC					;$B9E111
	ADC.w $0015,y				;$B9E112
	STA.w $0015,y				;$B9E115
	SEP.b #$20				;$B9E118
	TXA					;$B9E11A
	ADC.w $0017,y				;$B9E11B
	STA.w $0017,y				;$B9E11E
	REP.b #$20				;$B9E121
	RTS					;$B9E123

CODE_B9E124:
	JSR.w CODE_B9E0E9			;$B9E124
	JSR.w CODE_B9EE6E			;$B9E127
	JMP.w CODE_B9EE78			;$B9E12A

CODE_B9E12D:
	LDA.w $005B,y				;$B9E12D
	AND.w #$00FF				;$B9E130
	ASL					;$B9E133
	TAX					;$B9E134
	JSR.w (DATA_B9E13E,x)			;$B9E135
	JSR.w CODE_B9E0EC			;$B9E138
	JMP.w CODE_B9EE6E			;$B9E13B

DATA_B9E13E:
	dw CODE_B9E142
	dw CODE_B9E14E

CODE_B9E142:
	TYX					;$B9E142
	LDA.b $12,x 				;$B9E143 / Get X position
	STA.b $5C,x 				;$B9E145 / Set as home position
	LDA.b $30,x 				;$B9E147 / Get target X velocity
	STA.b $62,x 				;$B9E149 / Set as patrol velocity?
	INC.b $5B,x 				;$B9E14B / Set movement state
	RTS					;$B9E14D

CODE_B9E14E:
	LDA.w $0030,y				;$B9E14E
	BPL.b CODE_B9E173			;$B9E151
	LDA.w $0061,y				;$B9E153
	AND.w #$00FF				;$B9E156
	EOR.w #$FFFF				;$B9E159
	SEC					;$B9E15C
	ADC.w $005C,y				;$B9E15D
	CMP.w $0012,y				;$B9E160
	BCC.b CODE_B9E182			;$B9E163
CODE_B9E165:
	LDA.w $0062,y				;$B9E165
	EOR.w #$FFFF				;$B9E168
	INC					;$B9E16B
	STA.w $0062,y				;$B9E16C
	STA.w $0030,y				;$B9E16F
	RTS					;$B9E172

CODE_B9E173:
	LDA.w $0060,y				;$B9E173
	AND.w #$00FF				;$B9E176
	CLC					;$B9E179
	ADC.w $005C,y				;$B9E17A
	CMP.w $0012,y				;$B9E17D
	BCC.b CODE_B9E165			;$B9E180
CODE_B9E182:
	RTS					;$B9E182

CODE_B9E183:
	LDA.w $005B,y				;$B9E183
	AND.w #$00FF				;$B9E186
	ASL					;$B9E189
	TAX					;$B9E18A
	JSR.w (DATA_B9E194,x)			;$B9E18B
	JSR.w CODE_B9E108			;$B9E18E
	JMP.w CODE_B9EE64			;$B9E191

DATA_B9E194:
	dw CODE_B9E198
	dw CODE_B9E1A4

CODE_B9E198:
	TYX					;$B9E198
	LDA.b $16,x				;$B9E199
	STA.b $5E,x				;$B9E19B
	LDA.b $34,x				;$B9E19D
	STA.b $66,x				;$B9E19F
	INC.b $5B,x				;$B9E1A1
	RTS					;$B9E1A3

CODE_B9E1A4:
	LDA.w $0034,y				;$B9E1A4
	BPL.b CODE_B9E1CB			;$B9E1A7
	LDA.w $0065,y				;$B9E1A9
	AND.w #$00FF				;$B9E1AC
	EOR.w #$FFFF				;$B9E1AF
	SEC					;$B9E1B2
	ADC.w $005E,y				;$B9E1B3
	CMP.w $0016,y				;$B9E1B6
	BEQ.b CODE_B9E1DA			;$B9E1B9
	BCC.b CODE_B9E1DA			;$B9E1BB
CODE_B9E1BD:
	LDA.w $0066,y				;$B9E1BD
	EOR.w #$FFFF				;$B9E1C0
	INC					;$B9E1C3
	STA.w $0066,y				;$B9E1C4
	STA.w $0034,y				;$B9E1C7
	RTS					;$B9E1CA

CODE_B9E1CB:
	LDA.w $0064,y				;$B9E1CB
	AND.w #$00FF				;$B9E1CE
	CLC					;$B9E1D1
	ADC.w $005E,y				;$B9E1D2
	CMP.w $0016,y				;$B9E1D5
	BCC.b CODE_B9E1BD			;$B9E1D8
CODE_B9E1DA:
	RTS					;$B9E1DA

CODE_B9E1DB:
	LDA.w $005B,y				;$B9E1DB
	AND.w #$00FF				;$B9E1DE
	ASL					;$B9E1E1
	TAX					;$B9E1E2
	JSR.w (DATA_B9E1EF,x)			;$B9E1E3
	JSR.w CODE_B9E0E9			;$B9E1E6
	JSR.w CODE_B9EE6E			;$B9E1E9
	JMP.w CODE_B9EE64			;$B9E1EC

DATA_B9E1EF:
	dw CODE_B9E1F3
	dw CODE_B9E207

CODE_B9E1F3:
	TYX					;$B9E1F3
	LDA.b $12,x				;$B9E1F4
	STA.b $5C,x				;$B9E1F6
	LDA.b $16,x				;$B9E1F8
	STA.b $5E,x				;$B9E1FA
	LDA.b $30,x				;$B9E1FC
	STA.b $62,x				;$B9E1FE
	LDA.b $34,x				;$B9E200
	STA.b $66,x				;$B9E202
	INC.b $5B,x				;$B9E204
	RTS					;$B9E206

CODE_B9E207:
	JSR.w CODE_B9E14E			;$B9E207
	JMP.w CODE_B9E1A4			;$B9E20A

CODE_B9E20D:
	JSR.w CODE_B9EE6E			;$B9E20D
	JSR.w CODE_B9E0EC			;$B9E210
	JMP.w CODE_B9E183			;$B9E213

CODE_B9E216:
	TAX					;$B9E216
	JSR.w (DATA_B9E21D,x)			;$B9E217
	JMP.w CODE_B9E0E9			;$B9E21A

DATA_B9E21D:
	dw CODE_B9E221
	dw CODE_B9E230

CODE_B9E221:
	TYX					;$B9E221
	INC.b $5B,x				;$B9E222
	LDA.w #$1919				;$B9E224
	STA.b $64,x				;$B9E227
	STZ.b $66,x				;$B9E229
	STZ.b $58,x				;$B9E22B
	BRL.w CODE_B9E2A8			;$B9E22D

CODE_B9E230:
	TYX					;$B9E230
	LDA.b $5C,x				;$B9E231
	BEQ.b CODE_B9E251			;$B9E233
	LDA.b $60,x				;$B9E235
	BEQ.b CODE_B9E244			;$B9E237
	CMP.b $12,x				;$B9E239
	BEQ.b CODE_B9E2A8			;$B9E23B
	ROR					;$B9E23D
	EOR.b $30,x				;$B9E23E
	BPL.b CODE_B9E2A8			;$B9E240
	BRA.b CODE_B9E251			;$B9E242

CODE_B9E244:
	LDA.b $62,x				;$B9E244
	BEQ.b CODE_B9E251			;$B9E246
	CMP.b $16,x				;$B9E248
	BEQ.b CODE_B9E2A8			;$B9E24A
	ROR					;$B9E24C
	EOR.b $34,x				;$B9E24D
	BPL.b CODE_B9E2A8			;$B9E24F
CODE_B9E251:
	LDX.b current_sprite			;$B9E251
	LDA.b $64,x				;$B9E253
	LDY.b $60,x				;$B9E255
	BEQ.b CODE_B9E25A			;$B9E257
	XBA					;$B9E259
CODE_B9E25A:
	PHA					;$B9E25A
	AND.w #$00FF				;$B9E25B
	JSL.l CODE_B9F4B0			;$B9E25E
	PLA					;$B9E262
	XBA					;$B9E263
	AND.w #$00FF				;$B9E264
	JSL.l CODE_B9F478			;$B9E267
	LDX.b current_sprite			;$B9E26B
	LDA.b $66,x				;$B9E26D
	BEQ.b CODE_B9E29A			;$B9E26F
	SEC					;$B9E271
	SBC.w #$0100				;$B9E272
	STA.b $66,x				;$B9E275
	BCS.b CODE_B9E287			;$B9E277
	SEP.b #$20				;$B9E279
	STA.b $67,x				;$B9E27B
	REP.b #$20				;$B9E27D
	LDA.b $58,x				;$B9E27F
	EOR.w #$FFFF				;$B9E281
	INC					;$B9E284
	STA.b $58,x				;$B9E285
CODE_B9E287:
	LDA.b $60,x				;$B9E287
	BEQ.b CODE_B9E293			;$B9E289
	LDA.b $34,x				;$B9E28B
	CLC					;$B9E28D
	ADC.b $58,x				;$B9E28E
	STA.b $34,x				;$B9E290
	RTS					;$B9E292

CODE_B9E293:
	LDA.b $30,x				;$B9E293
	CLC					;$B9E295
	ADC.b $58,x				;$B9E296
	STA.b $30,x				;$B9E298
CODE_B9E29A:
	RTS					;$B9E29A

CODE_B9E29B:
	LDX.b current_sprite			;$B9E29B
	SEP.b #$20				;$B9E29D
	LDA.b $66,x				;$B9E29F
	LSR					;$B9E2A1
	STA.b $67,x				;$B9E2A2
	REP.b #$20				;$B9E2A4
	BRA.b CODE_B9E251			;$B9E2A6

CODE_B9E2A8:
	PHK					;$B9E2A8
	PLB					;$B9E2A9
	STZ.b $3E				;$B9E2AA
	LDA.b $6C				;$B9E2AC
	STA.b $40				;$B9E2AE
CODE_B9E2B0:
	LDA.b $5C,x				;$B9E2B0
	CMP.b $6A,x				;$B9E2B2
	BNE.b CODE_B9E2C7			;$B9E2B4
	LDA.b $38,x				;$B9E2B6
	ORA.w #$8000				;$B9E2B8
	STA.b $38,x				;$B9E2BB
	STZ.b $5A,x				;$B9E2BD
	STZ.b $5C,x				;$B9E2BF
	LDY.b current_sprite			;$B9E2C1
	RTS					;$B9E2C3

CODE_B9E2C4:
	BRL.w CODE_B9E251			;$B9E2C4

CODE_B9E2C7:
	TAY					;$B9E2C7
	CLC					;$B9E2C8
	ADC.w #$0004				;$B9E2C9
	STA.b $5C,x				;$B9E2CC
	LDA.b [$3E],y				;$B9E2CE
	INY					;$B9E2D0
	INY					;$B9E2D1
	CMP.w #$FFF5				;$B9E2D2
	BCS.b CODE_B9E343			;$B9E2D5
	BIT.b $5E,x				;$B9E2D7
	BMI.b CODE_B9E2F3			;$B9E2D9
	STA.b $60,x				;$B9E2DB
	CMP.w #$0000				;$B9E2DD
	BEQ.b CODE_B9E2E4			;$B9E2E0
	SBC.b $12,x				;$B9E2E2
CODE_B9E2E4:
	STA.b $1A				;$B9E2E4
	LDA.b [$3E],y				;$B9E2E6
	STA.b $62,x				;$B9E2E8
	BEQ.b CODE_B9E2EF			;$B9E2EA
	SEC					;$B9E2EC
	SBC.b $16,x				;$B9E2ED
CODE_B9E2EF:
	STA.b $1C				;$B9E2EF
	BRA.b CODE_B9E303			;$B9E2F1

CODE_B9E2F3:
	STA.b $1A				;$B9E2F3
	CLC					;$B9E2F5
	ADC.b $12,x				;$B9E2F6
	STA.b $60,x				;$B9E2F8
	LDA.b [$3E],y				;$B9E2FA
	STA.b $1C				;$B9E2FC
	CLC					;$B9E2FE
	ADC.b $16,x				;$B9E2FF
	STA.b $62,x				;$B9E301
CODE_B9E303:
	LDA.b $1C				;$B9E303
	BPL.b CODE_B9E30B			;$B9E305
	EOR.w #$FFFF				;$B9E307
	INC					;$B9E30A
CODE_B9E30B:
	STA.b $20				;$B9E30B
	LDA.b $1A				;$B9E30D
	BPL.b CODE_B9E315			;$B9E30F
	EOR.w #$FFFF				;$B9E311
	INC					;$B9E314
CODE_B9E315:
	STA.b $1E				;$B9E315
	CMP.b $20				;$B9E317
	BCC.b CODE_B9E31E			;$B9E319
	BRL.w CODE_B9E3E1			;$B9E31B

CODE_B9E31E:
	STZ.b $60,x				;$B9E31E
	LDA.b $5E,x				;$B9E320
	AND.w #$7FFF				;$B9E322
	BIT.b $1C				;$B9E325
	BPL.b CODE_B9E32D			;$B9E327
	EOR.w #$FFFF				;$B9E329
	INC					;$B9E32C
CODE_B9E32D:
	STA.b $34,x				;$B9E32D
	LDA.b $1E				;$B9E32F
	LDY.b $20				;$B9E331
	JSR.w CODE_B9E406			;$B9E333
	BIT.b $1A				;$B9E336
	BPL.b CODE_B9E33E			;$B9E338
	EOR.w #$FFFF				;$B9E33A
	INC					;$B9E33D
CODE_B9E33E:
	STA.b $30,x				;$B9E33E
	BRL.w CODE_B9E29B			;$B9E340

CODE_B9E343:
	ASL					;$B9E343
	ADC.w #$0015				;$B9E344
	PHX					;$B9E347
	TAX					;$B9E348
	JMP.w (DATA_B9E34C,x)			;$B9E349

DATA_B9E34C:
	dw CODE_B9E362
	dw CODE_B9E375
	dw CODE_B9E37D
	dw CODE_B9E38A
	dw CODE_B9E395
	dw CODE_B9E39D
	dw CODE_B9E3B1
	dw CODE_B9E3C3
	dw CODE_B9E3CB
	dw CODE_B9E3D3
	dw CODE_B9E3DB

CODE_B9E362:
	PLX					;$B9E362
	LDA.b [$3E],y				;$B9E363
	CPX.w follower_kong_sprite		;$B9E365
	BEQ.b CODE_B9E372			;$B9E368
	PHX					;$B9E36A
	PHY					;$B9E36B
	JSL.l CODE_B28012			;$B9E36C
	PLY					;$B9E370
	PLX					;$B9E371
CODE_B9E372:
	BRL.w CODE_B9E2B0			;$B9E372

CODE_B9E375:
	PLX					;$B9E375
	LDA.b [$3E],y				;$B9E376
	STA.b $1C,x				;$B9E378
	BRL.w CODE_B9E2B0			;$B9E37A

CODE_B9E37D:
	PLX					;$B9E37D
	LDA.b $1E,x				;$B9E37E
	AND.w #$CFFF				;$B9E380
	ORA.b [$3E],y				;$B9E383
	STA.b $1E,x				;$B9E385
	BRL.w CODE_B9E2B0			;$B9E387

CODE_B9E38A:
	PLX					;$B9E38A
	LDA.b [$3E],y				;$B9E38B
	CLC					;$B9E38D
	ADC.b $5E,x				;$B9E38E
	STA.b $5E,x				;$B9E390
	BRL.w CODE_B9E2B0			;$B9E392

CODE_B9E395:
	PLX					;$B9E395
	LDA.b [$3E],y				;$B9E396
	STA.b $38,x				;$B9E398
	BRL.w CODE_B9E2B0			;$B9E39A

CODE_B9E39D:
	PLA					;$B9E39D
	CLC					;$B9E39E
	ADC.b [$3E],y				;$B9E39F
	TAX					;$B9E3A1
	INY					;$B9E3A2
	INY					;$B9E3A3
	LDA.b [$3E],y				;$B9E3A4
	STA.b $00,x				;$B9E3A6
	LDX.b current_sprite			;$B9E3A8
	INC.b $5C,x				;$B9E3AA
	INC.b $5C,x				;$B9E3AC
	BRL.w CODE_B9E2B0			;$B9E3AE

CODE_B9E3B1:
	PLX					;$B9E3B1
	LDA.b [$3E],y				;$B9E3B2
	STA.b $66,x				;$B9E3B4
	INY					;$B9E3B6
	INY					;$B9E3B7
	LDA.b [$3E],y				;$B9E3B8
	STA.b $58,x				;$B9E3BA
	INC.b $5C,x				;$B9E3BC
	INC.b $5C,x				;$B9E3BE
	BRL.w CODE_B9E2B0			;$B9E3C0

CODE_B9E3C3:
	PLX					;$B9E3C3
	LDA.b [$3E],y				;$B9E3C4
	STA.b $64,x				;$B9E3C6
	BRL.w CODE_B9E2B0			;$B9E3C8

CODE_B9E3CB:
	PLX					;$B9E3CB
	LDA.b [$3E],y				;$B9E3CC
	STA.b $5C,x				;$B9E3CE
	BRL.w CODE_B9E2B0			;$B9E3D0

CODE_B9E3D3:
	PLX					;$B9E3D3
	LDA.b [$3E],y				;$B9E3D4
	STA.b $5E,x				;$B9E3D6
	BRL.w CODE_B9E2B0			;$B9E3D8

CODE_B9E3DB:
	PLX					;$B9E3DB
	STZ.b $5A,x				;$B9E3DC
	BRL.w CODE_B9E251			;$B9E3DE

CODE_B9E3E1:
	STZ.b $62,x				;$B9E3E1
	LDA.b $5E,x				;$B9E3E3
	AND.w #$7FFF				;$B9E3E5
	BIT.b $1A				;$B9E3E8
	BPL.b CODE_B9E3F0			;$B9E3EA
	EOR.w #$FFFF				;$B9E3EC
	INC					;$B9E3EF
CODE_B9E3F0:
	STA.b $30,x				;$B9E3F0
	LDA.b $20				;$B9E3F2
	LDY.b $1E				;$B9E3F4
	JSR.w CODE_B9E406			;$B9E3F6
	BIT.b $1C				;$B9E3F9
	BPL.b CODE_B9E401			;$B9E3FB
	EOR.w #$FFFF				;$B9E3FD
	INC					;$B9E400
CODE_B9E401:
	STA.b $34,x				;$B9E401
	BRL.w CODE_B9E29B			;$B9E403

CODE_B9E406:
	PHY					;$B9E406
	LDY.w #$0000				;$B9E407
CODE_B9E40A:
	CMP.w #$0100				;$B9E40A
	BCC.b CODE_B9E413			;$B9E40D
	LSR					;$B9E40F
	INY					;$B9E410
	BRA.b CODE_B9E40A			;$B9E411

CODE_B9E413:
	SEP.b #$20				;$B9E413
	STA.w CPU.multiply_A			;$B9E415
	REP.b #$20				;$B9E418
	LDA.b $5E,x				;$B9E41A
	AND.w #$7FFF				;$B9E41C
CODE_B9E41F:
	CMP.w #$0100				;$B9E41F
	BCC.b CODE_B9E428			;$B9E422
	LSR					;$B9E424
	INY					;$B9E425
	BRA.b CODE_B9E41F			;$B9E426

CODE_B9E428:
	SEP.b #$20				;$B9E428
	STA.w CPU.multiply_B			;$B9E42A
	REP.b #$20				;$B9E42D
	NOP #3					;$B9E42F
	LDA.w CPU.multiply_result		;$B9E432
	STA.w CPU.dividen_low			;$B9E435
	PLA					;$B9E438
	BEQ.b CODE_B9E467			;$B9E439
CODE_B9E43B:
	CMP.w #$0100				;$B9E43B
	BCC.b CODE_B9E444			;$B9E43E
	LSR					;$B9E440
	DEY					;$B9E441
	BRA.b CODE_B9E43B			;$B9E442

CODE_B9E444:
	SEP.b #$20				;$B9E444
	STA.w CPU.divisor			;$B9E446
	REP.b #$20				;$B9E449
	NOP #4					;$B9E44B
	TYA					;$B9E44F
	BEQ.b CODE_B9E45C			;$B9E450
	BPL.b CODE_B9E460			;$B9E452
	LDA.w CPU.divide_result			;$B9E454
CODE_B9E457:
	LSR					;$B9E457
	INY					;$B9E458
	BNE.b CODE_B9E457			;$B9E459
	RTS					;$B9E45B

CODE_B9E45C:
	LDA.w CPU.divide_result			;$B9E45C
	RTS					;$B9E45F

CODE_B9E460:
	LDA.w CPU.divide_result			;$B9E460
CODE_B9E463:
	ASL					;$B9E463
	DEY					;$B9E464
	BNE.b CODE_B9E463			;$B9E465
CODE_B9E467:
	RTS					;$B9E467

CODE_B9E468:
	TAX					;$B9E468
	JMP.w (DATA_B9E46C,x)			;$B9E469

DATA_B9E46C:
	dw CODE_B9E470
	dw CODE_B9E47F

CODE_B9E470:
	TYX					;$B9E470
	LDA.b $12,x				;$B9E471
	STA.b $5C,x				;$B9E473
	LDA.b $16,x				;$B9E475
	STA.b $5E,x				;$B9E477
	LDA.b $30,x				;$B9E479
	STA.b $2A,x				;$B9E47B
	INC.b $5B,x				;$B9E47D
CODE_B9E47F:
	LDX.b current_sprite			;$B9E47F
	LDA.b $60,x				;$B9E481
	CLC					;$B9E483
	ADC.b $2A,x				;$B9E484
	STA.b $60,x				;$B9E486
	JMP.w CODE_B9E4EE			;$B9E488

CODE_B9E48B:
	TAX					;$B9E48B
	JMP.w (DATA_B9E48F,x)			;$B9E48C

DATA_B9E48F:
	dw CODE_B9E493
	dw CODE_B9E4A9

CODE_B9E493:
	TYX					;$B9E493
	LDA.b $12,x				;$B9E494
	STA.b $5C,x				;$B9E496
	LDA.b $16,x				;$B9E498
	STA.b $5E,x				;$B9E49A
	LDA.b $30,x				;$B9E49C
	STA.b $2A,x				;$B9E49E
	BPL.b CODE_B9E4A7			;$B9E4A0
	LDA.b $64,x				;$B9E4A2
	XBA					;$B9E4A4
	STA.b $64,x				;$B9E4A5
CODE_B9E4A7:
	INC.b $5B,x				;$B9E4A7
CODE_B9E4A9:
	LDX.b current_sprite			;$B9E4A9
	LDA.b $64,x				;$B9E4AB
	BIT.b $30,x				;$B9E4AD
	BMI.b CODE_B9E4B2			;$B9E4AF
	XBA					;$B9E4B1
CODE_B9E4B2:
	AND.w #$FF00				;$B9E4B2
	STA.b $3E				;$B9E4B5
	LDA.b $60,x				;$B9E4B7
	STA.b $40				;$B9E4B9
	CLC					;$B9E4BB
	ADC.b $2A,x				;$B9E4BC
	STA.b $60,x				;$B9E4BE
	BIT.b $2A,x				;$B9E4C0
	BPL.b CODE_B9E4CF			;$B9E4C2
	LDA.b $3E				;$B9E4C4
	SEC					;$B9E4C6
	SBC.b $40				;$B9E4C7
	CMP.b $2A,x				;$B9E4C9
	BCC.b CODE_B9E4E1			;$B9E4CB
	BRA.b CODE_B9E4D9			;$B9E4CD

CODE_B9E4CF:
	LDA.b $3E				;$B9E4CF
	CLC					;$B9E4D1
	SBC.b $40				;$B9E4D2
	CLC					;$B9E4D4
	ADC.b $2A,x				;$B9E4D5
	BCC.b CODE_B9E4E1			;$B9E4D7
CODE_B9E4D9:
	LDA.b $30,x				;$B9E4D9
	EOR.w #$FFFF				;$B9E4DB
	INC					;$B9E4DE
	STA.b $30,x				;$B9E4DF
CODE_B9E4E1:
	LDA.w #$000A				;$B9E4E1
	JSL.l CODE_B9F4B0			;$B9E4E4
	LDX.b current_sprite			;$B9E4E8
	JSR.w CODE_B9E4EE			;$B9E4EA
	RTS					;$B9E4ED

CODE_B9E4EE:
	PHK					;$B9E4EE
	PLB					;$B9E4EF
	LDA.b $62,x				;$B9E4F0
	AND.w #$FF00				;$B9E4F2
	STA.b $3E				;$B9E4F5
	LDA.b $61,x				;$B9E4F7
	AND.w #$00FF				;$B9E4F9
	STA.b $40				;$B9E4FC
	JSL.l CODE_B9F260			;$B9E4FE
	JSR.w CODE_B9E520			;$B9E502
	LDX.b current_sprite			;$B9E505
	CLC					;$B9E507
	ADC.b $5C,x				;$B9E508
	STA.b $12,x				;$B9E50A
	LDA.b $40				;$B9E50C
	JSL.l CODE_B9F26A			;$B9E50E
	JSR.w CODE_B9E520			;$B9E512
	LDX.b current_sprite			;$B9E515
	EOR.w #$FFFF				;$B9E517
	SEC					;$B9E51A
	ADC.b $5E,x				;$B9E51B
	STA.b $16,x				;$B9E51D
	RTS					;$B9E51F

CODE_B9E520:
	BPL.b CODE_B9E535			;$B9E520
	EOR.w #$FFFF				;$B9E522
	INC					;$B9E525
	ORA.b $3E				;$B9E526
	STA.w CPU.multiply_A			;$B9E528
	LDA.w CPU.multiply_result		;$B9E52B
	LDA.w CPU.multiply_result_high		;$B9E52E
	AND.w #$00FF				;$B9E531
	RTS					;$B9E534

CODE_B9E535:
	ORA.b $3E				;$B9E535
	STA.w CPU.multiply_A			;$B9E537
	LDA.w CPU.multiply_result		;$B9E53A
	LDA.w CPU.multiply_result_high		;$B9E53D
	AND.w #$00FF				;$B9E540
	EOR.w #$FFFF				;$B9E543
	INC					;$B9E546
	RTS					;$B9E547

CODE_B9E548:
	LDX.b current_sprite			;$B9E548
	LDA.w #$0108				;$B9E54A
	CMP.b $12,x				;$B9E54D
	BCS.b CODE_B9E55C			;$B9E54F
	LDA.w $04BC				;$B9E551
	ADC.w #$00F8				;$B9E554
	CMP.b $12,x				;$B9E557
	BCC.b CODE_B9E55C			;$B9E559
	RTS					;$B9E55B

CODE_B9E55C:
	BEQ.b CODE_B9E572			;$B9E55C
	STA.b $12,x				;$B9E55E
	LDA.b $30,x				;$B9E560
	EOR.b $2A,x				;$B9E562
	ASL					;$B9E564
	STZ.b $2A,x				;$B9E565
	BCS.b CODE_B9E572			;$B9E567
	STZ.b $30,x				;$B9E569
	LDA.w #$0002				;$B9E56B
	ORA.b $28,x				;$B9E56E
	STA.b $28,x				;$B9E570
CODE_B9E572:
	RTS					;$B9E572

CODE_B9E573:
	JSR.w CODE_B9E57C			;$B9E573
	JSR.w CODE_B9E0E9			;$B9E576
	JMP.w CODE_B9EE6E			;$B9E579

CODE_B9E57C:
	LDA.w $005B,y				;$B9E57C
	AND.w #$00FF				;$B9E57F
	ASL					;$B9E582
	TAX					;$B9E583
	JSR.w (DATA_B9E588,x)			;$B9E584
	RTS					;$B9E587

DATA_B9E588:
	dw CODE_B9E58C
	dw CODE_B9E598

CODE_B9E58C:
	TYX					;$B9E58C
	LDA.b $12,x				;$B9E58D
	STA.b $62,x				;$B9E58F
	LDA.b $30,x				;$B9E591
	STA.b $66,x				;$B9E593
	INC.b $5B,x				;$B9E595
	RTS					;$B9E597

CODE_B9E598:
	LDA.w $0030,y				;$B9E598
	BPL.b CODE_B9E5BF			;$B9E59B
	LDA.w $0065,y				;$B9E59D
	AND.w #$00FF				;$B9E5A0
	EOR.w #$FFFF				;$B9E5A3
	SEC					;$B9E5A6
	ADC.w $0062,y				;$B9E5A7
	CMP.w $0012,y				;$B9E5AA
	BCC.b CODE_B9E5CE			;$B9E5AD
	BEQ.b CODE_B9E5CE			;$B9E5AF
CODE_B9E5B1:
	LDA.w $0066,y				;$B9E5B1
	EOR.w #$FFFF				;$B9E5B4
	INC					;$B9E5B7
	STA.w $0066,y				;$B9E5B8
	STA.w $0030,y				;$B9E5BB
	RTS					;$B9E5BE

CODE_B9E5BF:
	LDA.w $0064,y				;$B9E5BF
	AND.w #$00FF				;$B9E5C2
	CLC					;$B9E5C5
	ADC.w $0062,y				;$B9E5C6
	CMP.w $0012,y				;$B9E5C9
	BCC.b CODE_B9E5B1			;$B9E5CC
CODE_B9E5CE:
	RTS					;$B9E5CE

CODE_B9E5CF:
	JSR.w CODE_B9EE6E			;$B9E5CF
	JSR.w CODE_B9EE64			;$B9E5D2
	JMP.w CODE_B9E0E9			;$B9E5D5

CODE_B9E5D8:
	TYX					;$B9E5D8
	LDA.b $2C,x				;$B9E5D9
	AND.w #$FF00				;$B9E5DB
	BEQ.b CODE_B9E5FF			;$B9E5DE
	SEP.b #$20				;$B9E5E0
	DEC.b $2D,x				;$B9E5E2
	REP.b #$20				;$B9E5E4
	BNE.b CODE_B9E5F8			;$B9E5E6
	SEP.b #$20				;$B9E5E8
	LDA.b $19,x				;$B9E5EA
	STA.b $2D,x				;$B9E5EC
	REP.b #$20				;$B9E5EE
	LDA.b $1A,x				;$B9E5F0
	EOR.w #$FFFF				;$B9E5F2
	INC					;$B9E5F5
	STA.b $1A,x				;$B9E5F6
CODE_B9E5F8:
	LDA.b $30,x				;$B9E5F8
	CLC					;$B9E5FA
	ADC.b $1A,x				;$B9E5FB
	STA.b $30,x				;$B9E5FD
CODE_B9E5FF:
	LDA.b $2C,x				;$B9E5FF
	AND.w #$00FF				;$B9E601
	BEQ.b CODE_B9E625			;$B9E604
	SEP.b #$20				;$B9E606
	DEC.b $2C,x				;$B9E608
	REP.b #$20				;$B9E60A
	BNE.b CODE_B9E61E			;$B9E60C
	SEP.b #$20				;$B9E60E
	LDA.b $18,x				;$B9E610
	STA.b $2C,x				;$B9E612
	REP.b #$20				;$B9E614
	LDA.b $1C,x				;$B9E616
	EOR.w #$FFFF				;$B9E618
	INC					;$B9E61B
	STA.b $1C,x				;$B9E61C
CODE_B9E61E:
	LDA.b $34,x				;$B9E61E
	CLC					;$B9E620
	ADC.b $1C,x				;$B9E621
	STA.b $34,x				;$B9E623
CODE_B9E625:
	RTS					;$B9E625

CODE_B9E626:
	JMP.w CODE_B9E57C			;$B9E626

CODE_B9E629:
	LDA.w $005B,y				;$B9E629
	AND.w #$00FF				;$B9E62C
	ASL					;$B9E62F
	TAX					;$B9E630
	JMP.w (DATA_B9E634,x)			;$B9E631

DATA_B9E634:
	dw CODE_B9E638
	dw CODE_B9E649

CODE_B9E638:
	LDA.w $0016,y				;$B9E638
	STA.w $005C,y				;$B9E63B
	LDA.w $0034,y				;$B9E63E
	STA.w $0060,y				;$B9E641
	TYX					;$B9E644
	INC.b $5B,x				;$B9E645
	PLA					;$B9E647
	RTL					;$B9E648

CODE_B9E649:
	PLA					;$B9E649
	JSR.w CODE_B9E655			;$B9E64A
	PHP					;$B9E64D
	JSR.w CODE_B9EE64			;$B9E64E
	LDX.b current_sprite			;$B9E651
	PLP					;$B9E653
	RTL					;$B9E654

CODE_B9E655:
	LDA.w $0034,y				;$B9E655
	BPL.b CODE_B9E67C			;$B9E658
	LDA.w $005E,y				;$B9E65A
	XBA					;$B9E65D
	AND.w #$00FF				;$B9E65E
	EOR.w #$FFFF				;$B9E661
	SEC					;$B9E664
	ADC.w $005C,y				;$B9E665
	CMP.w $0016,y				;$B9E668
	BCC.b CODE_B9E68B			;$B9E66B
CODE_B9E66D:
	LDA.w $0060,y				;$B9E66D
	EOR.w #$FFFF				;$B9E670
	INC					;$B9E673
	STA.w $0060,y				;$B9E674
	STA.w $0034,y				;$B9E677
	SEC					;$B9E67A
	RTS					;$B9E67B

CODE_B9E67C:
	LDA.w $005E,y				;$B9E67C
	AND.w #$00FF				;$B9E67F
	CLC					;$B9E682
	ADC.w $005C,y				;$B9E683
	CMP.w $0016,y				;$B9E686
	BCC.b CODE_B9E66D			;$B9E689
CODE_B9E68B:
	CLC					;$B9E68B
	RTS					;$B9E68C

CODE_B9E68D:
	PLA					;$B9E68D
	JSR.w CODE_B9E5CF			;$B9E68E
	LDX.b current_sprite			;$B9E691
	LDA.b $16,x				;$B9E693
	CMP.b $5C,x				;$B9E695
	BCC.b CODE_B9E6A3			;$B9E697
	LDA.b $2E,x				;$B9E699
	EOR.w #$FFFF				;$B9E69B
	INC					;$B9E69E
	STA.b $2E,x				;$B9E69F
	SEC					;$B9E6A1
	RTL					;$B9E6A2

CODE_B9E6A3:
	CLC					;$B9E6A3
	RTL					;$B9E6A4

CODE_B9E6A5:
	PLA					;$B9E6A5
	JSR.w CODE_B9E0EC			;$B9E6A6
	TYX					;$B9E6A9
	LDA.b $30,x				;$B9E6AA
	BMI.b CODE_B9E6B6			;$B9E6AC
	LDA.b $5E,x				;$B9E6AE
	CMP.b $12,x				;$B9E6B0
	BPL.b CODE_B9E6C0			;$B9E6B2
	BRA.b CODE_B9E6BC			;$B9E6B4

CODE_B9E6B6:
	LDA.b $5E,x				;$B9E6B6
	CMP.b $12,x				;$B9E6B8
	BMI.b CODE_B9E6C0			;$B9E6BA
CODE_B9E6BC:
	STA.b $12,x				;$B9E6BC
	SEC					;$B9E6BE
	RTL					;$B9E6BF

CODE_B9E6C0:
	CLC					;$B9E6C0
	RTL					;$B9E6C1

CODE_B9E6C2:
	PLX					;$B9E6C2
	TAX					;$B9E6C3
	BNE.b CODE_B9E6DA			;$B9E6C4
	TYX					;$B9E6C6
	LDY.b $6C,x				;$B9E6C7
	LDA.w $0012,y				;$B9E6C9
	STA.b $62,x				;$B9E6CC
	LDA.w $0016,y				;$B9E6CE
	STA.b $64,x				;$B9E6D1
	JSR.w CODE_B9E711			;$B9E6D3
	INC.b $5B,x				;$B9E6D6
	BRA.b CODE_B9E703			;$B9E6D8

CODE_B9E6DA:
	TYX					;$B9E6DA
	DEC.b $6A,x				;$B9E6DB
	BNE.b CODE_B9E6E1			;$B9E6DD
	SEC					;$B9E6DF
	RTL					;$B9E6E0

CODE_B9E6E1:
	LDY.b $6C,x				;$B9E6E1
	LDA.w $0012,y				;$B9E6E3
	SEC					;$B9E6E6
	SBC.b $62,x				;$B9E6E7
	CLC					;$B9E6E9
	ADC.b $12,x				;$B9E6EA
	STA.b $12,x				;$B9E6EC
	LDA.w $0012,y				;$B9E6EE
	STA.b $62,x				;$B9E6F1
	LDA.w $0016,y				;$B9E6F3
	SEC					;$B9E6F6
	SBC.b $64,x				;$B9E6F7
	CLC					;$B9E6F9
	ADC.b $16,x				;$B9E6FA
	STA.b $16,x				;$B9E6FC
	LDA.w $0016,y				;$B9E6FE
	STA.b $64,x				;$B9E701
CODE_B9E703:
	LDA.b $66,x				;$B9E703
	CLC					;$B9E705
	ADC.b $2E,x				;$B9E706
	STA.b $2E,x				;$B9E708
	TXY					;$B9E70A
	JSR.w CODE_B9E0E9			;$B9E70B
	TYX					;$B9E70E
	CLC					;$B9E70F
	RTL					;$B9E710

CODE_B9E711:
	JSR.w CODE_B9E773			;$B9E711
	TYA					;$B9E714
	SEP.b #$20				;$B9E715
	LDA.b $66,x				;$B9E717
	STA.w CPU.multiply_A			;$B9E719
	TYA					;$B9E71C
	STA.w CPU.multiply_B			;$B9E71D
	REP.b #$20				;$B9E720
	NOP					;$B9E722
	LDA.w CPU.multiply_result		;$B9E723
	LSR					;$B9E726
	EOR.w #$FFFF				;$B9E727
	INC					;$B9E72A
	STA.b $2E,x				;$B9E72B
	LDA.b $64,x				;$B9E72D
	SEC					;$B9E72F
	SBC.b $16,x				;$B9E730
	PHP					;$B9E732
	BPL.b CODE_B9E739			;$B9E733
	EOR.w #$FFFF				;$B9E735
	INC					;$B9E738
CODE_B9E739:
	STA.w CPU.dividen_low			;$B9E739
	SEP.b #$20				;$B9E73C
	LDA.b $6A,x				;$B9E73E
	TAY					;$B9E740
	STA.w CPU.divisor			;$B9E741
	REP.b #$20				;$B9E744
	JSL.l CODE_B58003			;$B9E746
	LDA.w CPU.divide_result			;$B9E74A
	XBA					;$B9E74D
	PHA					;$B9E74E
	LDA.w CPU.divide_remainder		;$B9E74F
	XBA					;$B9E752
	STA.w CPU.dividen_low			;$B9E753
	SEP.b #$20				;$B9E756
	TYA					;$B9E758
	STA.w CPU.divisor			;$B9E759
	REP.b #$20				;$B9E75C
	JSL.l CODE_B58003			;$B9E75E
	PLA					;$B9E762
	ORA.w CPU.divide_result			;$B9E763
	PLP					;$B9E766
	BPL.b CODE_B9E76D			;$B9E767
	EOR.w #$FFFF				;$B9E769
	INC					;$B9E76C
CODE_B9E76D:
	CLC					;$B9E76D
	ADC.b $2E,x				;$B9E76E
	STA.b $2E,x				;$B9E770
	RTS					;$B9E772

CODE_B9E773:
	LDA.b $62,x				;$B9E773
	SEC					;$B9E775
	SBC.b $12,x				;$B9E776
	PHP					;$B9E778
	BPL.b CODE_B9E77F			;$B9E779
	EOR.w #$FFFF				;$B9E77B
	INC					;$B9E77E
CODE_B9E77F:
	STA.w CPU.dividen_low			;$B9E77F
	SEP.b #$20				;$B9E782
	LDA.b $6A,x				;$B9E784
	TAY					;$B9E786
	STA.w CPU.divisor			;$B9E787
	REP.b #$20				;$B9E78A
	JSL.l CODE_B58003			;$B9E78C
	LDA.w CPU.divide_result			;$B9E790
	XBA					;$B9E793
	PHA					;$B9E794
	LDA.w CPU.divide_remainder		;$B9E795
	XBA					;$B9E798
	STA.w CPU.dividen_low			;$B9E799
	SEP.b #$20				;$B9E79C
	TYA					;$B9E79E
	STA.w CPU.divisor			;$B9E79F
	REP.b #$20				;$B9E7A2
	JSL.l CODE_B58003			;$B9E7A4
	PLA					;$B9E7A8
	ORA.w CPU.divide_result			;$B9E7A9
	PLP					;$B9E7AC
	BPL.b CODE_B9E7B3			;$B9E7AD
	EOR.w #$FFFF				;$B9E7AF
	INC					;$B9E7B2
CODE_B9E7B3:
	STA.b $2A,x				;$B9E7B3
	RTS					;$B9E7B5

;movement behavior 14
CODE_B9E7B6:
	PLX					;$B9E7B6
	TAX					;$B9E7B7
	BNE.b CODE_B9E7C0			;$B9E7B8
	TYX					;$B9E7BA
	JSR.w CODE_B9E711			;$B9E7BB
	INC.b $5B,x				;$B9E7BE
CODE_B9E7C0:
	LDX.b current_sprite			;$B9E7C0
	DEC.b $6A,x				;$B9E7C2
	BNE.b CODE_B9E7D0			;$B9E7C4
	LDA.b $62,x				;$B9E7C6
	STA.b $12,x				;$B9E7C8
	LDA.b $64,x				;$B9E7CA
	STA.b $16,x				;$B9E7CC
	SEC					;$B9E7CE
	RTL					;$B9E7CF

CODE_B9E7D0:
	LDA.b $66,x				;$B9E7D0
	CLC					;$B9E7D2
	ADC.b $2E,x				;$B9E7D3
	STA.b $2E,x				;$B9E7D5
	TXY					;$B9E7D7
	JSR.w CODE_B9E0E9			;$B9E7D8
	TYX					;$B9E7DB
	CLC					;$B9E7DC
	RTL					;$B9E7DD

CODE_B9E7DE:
	JSR.w CODE_B9EE6E			;$B9E7DE
	JSR.w CODE_B9EE78			;$B9E7E1
	TXY					;$B9E7E4
	JMP.w CODE_B9E0E9			;$B9E7E5

CODE_B9E7E8:
	TAX					;$B9E7E8
	JMP.w (DATA_B9E7EC,x)			;$B9E7E9

DATA_B9E7EC:
	dw CODE_B9E7F0
	dw CODE_B9E81C

CODE_B9E7F0:
	TYX					;$B9E7F0
	LDA.b $5D,x				;$B9E7F1
	AND.w #$00FF				;$B9E7F3
	JSL.l CODE_B58021			;$B9E7F6
	ASL					;$B9E7FA
	ASL					;$B9E7FB
	ASL					;$B9E7FC
	ASL					;$B9E7FD
	CLC					;$B9E7FE
	ADC.b $16,x				;$B9E7FF
	STA.b $5E,x				;$B9E801
	LDA.b $5C,x				;$B9E803
	AND.w #$00FF				;$B9E805
	JSL.l CODE_B58021			;$B9E808
	ASL					;$B9E80C
	ASL					;$B9E80D
	ASL					;$B9E80E
	ASL					;$B9E80F
	CLC					;$B9E810
	ADC.b $16,x				;$B9E811
	STA.b $5C,x				;$B9E813
	LDA.b $16,x				;$B9E815
	STA.b $60,x				;$B9E817
	INC.b $5B,x				;$B9E819
	RTS					;$B9E81B

CODE_B9E81C:
	TYX					;$B9E81C
	LDA.b $68,x				;$B9E81D
	AND.w #$00FF				;$B9E81F
	BEQ.b CODE_B9E828			;$B9E822
	LDA.b $5E,x				;$B9E824
	BRA.b CODE_B9E82A			;$B9E826

CODE_B9E828:
	LDA.b $5C,x				;$B9E828
CODE_B9E82A:
	STA.b $1A				;$B9E82A
	CMP.b $16,x				;$B9E82C
	BCC.b CODE_B9E846			;$B9E82E
	BEQ.b CODE_B9E846			;$B9E830
	CMP.b $60,x				;$B9E832
	BCC.b CODE_B9E850			;$B9E834
	LDA.b $34,x				;$B9E836
	BPL.b CODE_B9E840			;$B9E838
CODE_B9E83A:
	EOR.w #$FFFF				;$B9E83A
	INC					;$B9E83D
	STA.b $34,x				;$B9E83E
CODE_B9E840:
	JSR.w CODE_B9EE64			;$B9E840
	JMP.w CODE_B9E108			;$B9E843

CODE_B9E846:
	CMP.b $60,x				;$B9E846
	BCS.b CODE_B9E850			;$B9E848
	LDA.b $34,x				;$B9E84A
	BMI.b CODE_B9E840			;$B9E84C
	BRA.b CODE_B9E83A			;$B9E84E

CODE_B9E850:
	STZ.b $2E,x				;$B9E850
	RTS					;$B9E852

CODE_B9E853:
	TAX					;$B9E853
	JMP.w (DATA_B9E857,x)			;$B9E854

DATA_B9E857:
	dw CODE_B9E7F0
	dw CODE_B9E85B

CODE_B9E85B:
	TYX					;$B9E85B
	LDY.w active_kong_sprite		;$B9E85C
	LDA.w $0016,y				;$B9E85F
	CMP.b $16,x				;$B9E862
	BCS.b CODE_B9E86A			;$B9E864
	LDA.b $5E,x				;$B9E866
	BRA.b CODE_B9E82A			;$B9E868

CODE_B9E86A:
	LDA.b $5C,x				;$B9E86A
	BRA.b CODE_B9E82A			;$B9E86C

CODE_B9E86E:
	PLX					;$B9E86E
	TYX					;$B9E86F
	JSR.w CODE_B9E883			;$B9E870
	LDA.b $66,x				;$B9E873
	EOR.w #$FFFF				;$B9E875
	INC					;$B9E878
	STA.b $66,x				;$B9E879
	LDA.w #$0114				;$B9E87B
	STA.b $5A,x				;$B9E87E
	JMP.w CODE_B9E7C0			;$B9E880

CODE_B9E883:
	JSR.w CODE_B9E773			;$B9E883
	TYA					;$B9E886
	SEP.b #$20				;$B9E887
	LDA.b $66,x				;$B9E889
	STA.w CPU.multiply_A			;$B9E88B
	TYA					;$B9E88E
	STA.w CPU.multiply_B			;$B9E88F
	REP.b #$20				;$B9E892
	NOP					;$B9E894
	LDA.w CPU.multiply_result		;$B9E895
	LSR					;$B9E898
	STA.b $2E,x				;$B9E899
	LDA.b $64,x				;$B9E89B
	SEC					;$B9E89D
	SBC.b $16,x				;$B9E89E
	PHP					;$B9E8A0
	BPL.b CODE_B9E8A7			;$B9E8A1
	EOR.w #$FFFF				;$B9E8A3
	INC					;$B9E8A6
CODE_B9E8A7:
	STA.w CPU.dividen_low			;$B9E8A7
	SEP.b #$20				;$B9E8AA
	LDA.b $6A,x				;$B9E8AC
	TAY					;$B9E8AE
	STA.w CPU.divisor			;$B9E8AF
	REP.b #$20				;$B9E8B2
	JSL.l CODE_B58003			;$B9E8B4
	LDA.w CPU.divide_result			;$B9E8B8
	XBA					;$B9E8BB
	PHA					;$B9E8BC
	LDA.w CPU.divide_remainder		;$B9E8BD
	XBA					;$B9E8C0
	STA.w CPU.dividen_low			;$B9E8C1
	SEP.b #$20				;$B9E8C4
	TYA					;$B9E8C6
	STA.w CPU.divisor			;$B9E8C7
	REP.b #$20				;$B9E8CA
	JSL.l CODE_B58003			;$B9E8CC
	PLA					;$B9E8D0
	ORA.w CPU.divide_result			;$B9E8D1
	PLP					;$B9E8D4
	BPL.b CODE_B9E8DB			;$B9E8D5
	EOR.w #$FFFF				;$B9E8D7
	INC					;$B9E8DA
CODE_B9E8DB:
	CLC					;$B9E8DB
	ADC.b $2E,x				;$B9E8DC
	STA.b $2E,x				;$B9E8DE
	RTS					;$B9E8E0

CODE_B9E8E1:
	PLX					;$B9E8E1
	TYX					;$B9E8E2
	LDA.b $64,x				;$B9E8E3
	BIT.b $2A,x				;$B9E8E5
	BPL.b CODE_B9E8EF			;$B9E8E7
	CMP.b $60,x				;$B9E8E9
	BCC.b CODE_B9E8F3			;$B9E8EB
CODE_B9E8ED:
	SEC					;$B9E8ED
	RTL					;$B9E8EE

CODE_B9E8EF:
	CMP.b $60,x				;$B9E8EF
	BCC.b CODE_B9E8ED			;$B9E8F1
CODE_B9E8F3:
	LDA.b $60,x				;$B9E8F3
	CLC					;$B9E8F5
	ADC.b $2A,x				;$B9E8F6
	STA.b $60,x				;$B9E8F8
	LDA.b $62,x				;$B9E8FA
	AND.w #$FF00				;$B9E8FC
	STA.b $3E				;$B9E8FF
	LDA.b $61,x				;$B9E901
	AND.w #$00FF				;$B9E903
	JSL.l CODE_B9F260			;$B9E906
	JSR.w CODE_B9E520			;$B9E90A
	LDX.b current_sprite			;$B9E90D
	CLC					;$B9E90F
	ADC.b $5C,x				;$B9E910
	STA.b $12,x				;$B9E912
	LDA.b $5E,x				;$B9E914
	STA.b $16,x				;$B9E916
	CLC					;$B9E918
	RTL					;$B9E919


;movement behavior 1A
CODE_B9E91A:
	PLX					;$B9E91A
	TAX					;$B9E91B
	BNE.b CODE_B9E924			;$B9E91C
	TYX					;$B9E91E
	JSR.w CODE_B9E711			;$B9E91F
	INC.b $5B,x				;$B9E922
CODE_B9E924:
	LDX.b current_sprite			;$B9E924
	DEC.b $6A,x				;$B9E926
	BNE.b CODE_B9E92C			;$B9E928
	SEC					;$B9E92A
	RTL					;$B9E92B

CODE_B9E92C:
	LDA.b $66,x				;$B9E92C
	CLC					;$B9E92E
	ADC.b $2E,x				;$B9E92F
	STA.b $2E,x				;$B9E931
	TXY					;$B9E933
	JSR.w CODE_B9E0E9			;$B9E934
	TYX					;$B9E937
	CLC					;$B9E938
	RTL					;$B9E939

CODE_B9E93A:
	LDA.w $005B,y				;$B9E93A
	AND.w #$00FF				;$B9E93D
	ASL					;$B9E940
	TAX					;$B9E941
	JSR.w (DATA_B9E94E,x)			;$B9E942
	JSR.w CODE_B9E0E9			;$B9E945
	JSR.w CODE_B9EE6E			;$B9E948
	JMP.w CODE_B9EE64			;$B9E94B

DATA_B9E94E:
	dw CODE_B9E952
	dw CODE_B9E966

CODE_B9E952:
	TYX					;$B9E952
	LDA.b $12,x				;$B9E953
	STA.b $5C,x				;$B9E955
	LDA.b $16,x				;$B9E957
	STA.b $5E,x				;$B9E959
	LDA.b $30,x				;$B9E95B
	STA.b $62,x				;$B9E95D
	LDA.b $34,x				;$B9E95F
	STA.b $66,x				;$B9E961
	INC.b $5B,x				;$B9E963
	RTS					;$B9E965

CODE_B9E966:
	JSR.w CODE_B9E14E			;$B9E966
	LDA.w $0034,y				;$B9E969
	BPL.b CODE_B9E991			;$B9E96C
	LDA.w $0064,y				;$B9E96E
	XBA					;$B9E971
	AND.w #$00FF				;$B9E972
	ASL					;$B9E975
	ASL					;$B9E976
	EOR.w #$FFFF				;$B9E977
	SEC					;$B9E97A
	ADC.w $005E,y				;$B9E97B
	CMP.w $0016,y				;$B9E97E
	BCC.b CODE_B9E9A1			;$B9E981
CODE_B9E983:
	LDA.w $0066,y				;$B9E983
	EOR.w #$FFFF				;$B9E986
	INC					;$B9E989
	STA.w $0066,y				;$B9E98A
	STA.w $0034,y				;$B9E98D
	RTS					;$B9E990

CODE_B9E991:
	LDA.w $0064,y				;$B9E991
	AND.w #$00FF				;$B9E994
	ASL					;$B9E997
	ASL					;$B9E998
	ADC.w $005E,y				;$B9E999
	CMP.w $0016,y				;$B9E99C
	BCC.b CODE_B9E983			;$B9E99F
CODE_B9E9A1:
	RTS					;$B9E9A1

CODE_B9E9A2:
	JSR.w CODE_B9EE6E			;$B9E9A2
	JSR.w CODE_B9EE64			;$B9E9A5
	JMP.w CODE_B9E0E9			;$B9E9A8

CODE_B9E9AB:
	LDA.b [$6A]				;$B9E9AB
	STA.b $1A				;$B9E9AD
	LDX.w active_kong_sprite		;$B9E9AF
	LDA.b $12,x				;$B9E9B2
	SEC					;$B9E9B4
	SBC.w $0012,y				;$B9E9B5
	BPL.b CODE_B9E9CA			;$B9E9B8
	EOR.w #$FFFF				;$B9E9BA
	INC					;$B9E9BD
	CMP.b $1A				;$B9E9BE
	BCC.b CODE_B9E9C4			;$B9E9C0
	LDA.b $1A				;$B9E9C2
CODE_B9E9C4:
	EOR.w #$FFFF				;$B9E9C4
	INC					;$B9E9C7
	BRA.b CODE_B9E9D0			;$B9E9C8

CODE_B9E9CA:
	CMP.b $1A				;$B9E9CA
	BCC.b CODE_B9E9D0			;$B9E9CC
	LDA.b $1A				;$B9E9CE
CODE_B9E9D0:
	ASL					;$B9E9D0
	ASL					;$B9E9D1
	ASL					;$B9E9D2
	STA.w $0030,y				;$B9E9D3
	LDA.b $16,x				;$B9E9D6
	SEC					;$B9E9D8
	SBC.w $0016,y				;$B9E9D9
	BPL.b CODE_B9E9EE			;$B9E9DC
	EOR.w #$FFFF				;$B9E9DE
	INC					;$B9E9E1
	CMP.b $1A				;$B9E9E2
	BCC.b CODE_B9E9E8			;$B9E9E4
	LDA.b $1A				;$B9E9E6
CODE_B9E9E8:
	EOR.w #$FFFF				;$B9E9E8
	INC					;$B9E9EB
	BRA.b CODE_B9E9F4			;$B9E9EC

CODE_B9E9EE:
	CMP.b $1A				;$B9E9EE
	BCC.b CODE_B9E9F4			;$B9E9F0
	LDA.b $1A				;$B9E9F2
CODE_B9E9F4:
	ASL					;$B9E9F4
	ASL					;$B9E9F5
	ASL					;$B9E9F6
	STA.w $0034,y				;$B9E9F7
	JMP.w CODE_B9E5CF			;$B9E9FA

CODE_B9E9FD:
	LDA.w $005B,y				;$B9E9FD
	AND.w #$00FF				;$B9EA00
	ASL					;$B9EA03
	TAX					;$B9EA04
	JSR.w (DATA_B9EA13,x)			;$B9EA05
	BCS.b CODE_B9EA12			;$B9EA08
	LDY.b current_sprite			;$B9EA0A
	JSR.w CODE_B9E0EC			;$B9EA0C
	JMP.w CODE_B9EE6E			;$B9EA0F

CODE_B9EA12:
	RTS					;$B9EA12

DATA_B9EA13:
	dw CODE_B9EA17
	dw CODE_B9EA30

CODE_B9EA17:
	TYX					;$B9EA17
	LDA.b $12,x				;$B9EA18
	STA.b $5C,x				;$B9EA1A
	LDA.b $60,x				;$B9EA1C
	STA.b $5E,x				;$B9EA1E
	STZ.b $68,x				;$B9EA20
	STZ.b $62,x				;$B9EA22
	LDA.b $30,x				;$B9EA24
	EOR.w #$FFFF				;$B9EA26
	INC					;$B9EA29
	STA.b $30,x				;$B9EA2A
	INC.b $5B,x				;$B9EA2C
	CLC					;$B9EA2E
	RTS					;$B9EA2F

CODE_B9EA30:
	TYX					;$B9EA30
	LDA.b $68,x				;$B9EA31
	CMP.b $62,x				;$B9EA33
	BEQ.b CODE_B9EA51			;$B9EA35
	LDA.b $30,x				;$B9EA37
	EOR.w #$FFFF				;$B9EA39
	INC					;$B9EA3C
	STA.b $30,x				;$B9EA3D
	INC.b $42,x				;$B9EA3F
	LDA.w #$0763				;$B9EA41
	JSL.l CODE_B28012			;$B9EA44
	LDA.w #$0565				;$B9EA48
	JSL.l CODE_B28012			;$B9EA4B
	LDA.b $68,x				;$B9EA4F
CODE_B9EA51:
	STA.b $62,x				;$B9EA51
	LDY.b $60,x				;$B9EA53
	LDA.b $68,x				;$B9EA55
	BNE.b CODE_B9EA5C			;$B9EA57
	LDY.w #$0000				;$B9EA59
CODE_B9EA5C:
	STY.b $5E,x				;$B9EA5C
	LDA.b $30,x				;$B9EA5E
	BPL.b CODE_B9EA7D			;$B9EA60
	LDA.b $5E,x				;$B9EA62
	EOR.w #$FFFF				;$B9EA64
	SEC					;$B9EA67
	ADC.b $5C,x				;$B9EA68
	CMP.b $12,x				;$B9EA6A
	BCC.b CODE_B9EA86			;$B9EA6C
CODE_B9EA6E:
	LDA.b $42,x				;$B9EA6E
	BNE.b CODE_B9EA7B			;$B9EA70
	LDA.w #$0764				;$B9EA72
	STA.b $42,x				;$B9EA75
	JSL.l CODE_B28012			;$B9EA77
CODE_B9EA7B:
	SEC					;$B9EA7B
	RTS					;$B9EA7C

CODE_B9EA7D:
	LDA.b $5E,x				;$B9EA7D
	CLC					;$B9EA7F
	ADC.b $5C,x				;$B9EA80
	CMP.b $12,x				;$B9EA82
	BCC.b CODE_B9EA6E			;$B9EA84
CODE_B9EA86:
	STZ.b $42,x				;$B9EA86
	CLC					;$B9EA88
	RTS					;$B9EA89

CODE_B9EA8A:
	LDA.w $005B,y				;$B9EA8A
	AND.w #$00FF				;$B9EA8D
	ASL					;$B9EA90
	TAX					;$B9EA91
	JSR.w (DATA_B9EAA0,x)			;$B9EA92
	BCS.b CODE_B9EA9F			;$B9EA95
	LDY.b current_sprite			;$B9EA97
	JSR.w CODE_B9E108			;$B9EA99
	JMP.w CODE_B9EE64			;$B9EA9C

CODE_B9EA9F:
	RTS					;$B9EA9F

DATA_B9EAA0:
	dw CODE_B9EAA4
	dw CODE_B9EABD

CODE_B9EAA4:
	TYX					;$B9EAA4
	LDA.b $16,x				;$B9EAA5
	STA.b $5C,x				;$B9EAA7
	LDA.b $60,x				;$B9EAA9
	STA.b $5E,x				;$B9EAAB
	STZ.b $68,x				;$B9EAAD
	STZ.b $62,x				;$B9EAAF
	LDA.b $34,x				;$B9EAB1
	EOR.w #$FFFF				;$B9EAB3
	INC					;$B9EAB6
	STA.b $34,x				;$B9EAB7
	INC.b $5B,x				;$B9EAB9
	CLC					;$B9EABB
	RTS					;$B9EABC

CODE_B9EABD:
	TYX					;$B9EABD
	LDA.b $68,x				;$B9EABE
	CMP.b $62,x				;$B9EAC0
	BEQ.b CODE_B9EADC			;$B9EAC2
	LDA.b $34,x				;$B9EAC4
	EOR.w #$FFFF				;$B9EAC6
	INC					;$B9EAC9
	STA.b $34,x				;$B9EACA
	LDA.w #$0763				;$B9EACC
	JSL.l CODE_B28012			;$B9EACF
	LDA.w #$0565				;$B9EAD3
	JSL.l CODE_B28012			;$B9EAD6
	LDA.b $68,x				;$B9EADA
CODE_B9EADC:
	STA.b $62,x				;$B9EADC
	LDY.b $60,x				;$B9EADE
	LDA.b $68,x				;$B9EAE0
	BNE.b CODE_B9EAE7			;$B9EAE2
	LDY.w #$0000				;$B9EAE4
CODE_B9EAE7:
	STY.b $5E,x				;$B9EAE7
	LDA.b $34,x				;$B9EAE9
	BPL.b CODE_B9EB08			;$B9EAEB
	LDA.b $5E,x				;$B9EAED
	EOR.w #$FFFF				;$B9EAEF
	SEC					;$B9EAF2
	ADC.b $5C,x				;$B9EAF3
	CMP.b $16,x				;$B9EAF5
	BCC.b CODE_B9EB11			;$B9EAF7
CODE_B9EAF9:
	LDA.b $42,x				;$B9EAF9
	BNE.b CODE_B9EB06			;$B9EAFB
	LDA.w #$0764				;$B9EAFD
	STA.b $42,x				;$B9EB00
	JSL.l CODE_B28012			;$B9EB02
CODE_B9EB06:
	SEC					;$B9EB06
	RTS					;$B9EB07

CODE_B9EB08:
	LDA.b $5E,x				;$B9EB08
	CLC					;$B9EB0A
	ADC.b $5C,x				;$B9EB0B
	CMP.b $16,x				;$B9EB0D
	BCC.b CODE_B9EAF9			;$B9EB0F
CODE_B9EB11:
	STZ.b $42,x				;$B9EB11
	CLC					;$B9EB13
	RTS					;$B9EB14

CODE_B9EB15:
	JSR.w CODE_B9EE6E			;$B9EB15
	JSR.w CODE_B9EE78			;$B9EB18
	JSR.w CODE_B9E0EC			;$B9EB1B
	JMP.w CODE_B9E183			;$B9EB1E

CODE_B9EB21:
	JSR.w CODE_B9EE78			;$B9EB21
	TXY					;$B9EB24
	JSR.w CODE_B9E108			;$B9EB25
	LDA.w $005E,y				;$B9EB28
	CMP.w $0016,y				;$B9EB2B
	BCS.b CODE_B9EB36			;$B9EB2E
	STA.w $0016,y				;$B9EB30
	TYX					;$B9EB33
	STZ.b $5A,x				;$B9EB34
CODE_B9EB36:
	RTS					;$B9EB36

CODE_B9EB37:
	JSR.w CODE_B9EE64			;$B9EB37
	JMP.w CODE_B9E108			;$B9EB3A

CODE_B9EB3D:
	JSR.w CODE_B9E108			;$B9EB3D
CODE_B9EB40:
	JSR.w CODE_B9EB50			;$B9EB40
	LDA.b $60,x				;$B9EB43
	CMP.b $16,x				;$B9EB45
	BPL.b CODE_B9EB4F			;$B9EB47
	STA.b $16,x				;$B9EB49
	STZ.b $5A,x				;$B9EB4B
	INC.b $38,x				;$B9EB4D
CODE_B9EB4F:
	RTS					;$B9EB4F

CODE_B9EB50:
	TYX					;$B9EB50
	LDY current_kong_control_variables	;$B9EB51
	LDA.w $0008,y				;$B9EB53
	CLC					;$B9EB56
	ADC.b $2E,x				;$B9EB57
	BMI.b CODE_B9EB63			;$B9EB59
	CMP.w $000A,y				;$B9EB5B
	BCC.b CODE_B9EB63			;$B9EB5E
	LDA.w $000A,y				;$B9EB60
CODE_B9EB63:
	STA.b $2E,x				;$B9EB63
	RTS					;$B9EB65

CODE_B9EB66:
	LDA.w $002E,y				;$B9EB66
	CLC					;$B9EB69
	ADC.w #$0100				;$B9EB6A
	STA.w $002E,y				;$B9EB6D
	JSR.w CODE_B9E108			;$B9EB70
	LDA.w $0016,y				;$B9EB73
	CMP.w $006A,y				;$B9EB76
	BMI.b CODE_B9EB94			;$B9EB79
	LDA.w $002E,y				;$B9EB7B
	BMI.b CODE_B9EB91			;$B9EB7E
	LSR					;$B9EB80
	LSR					;$B9EB81
	STA.b $1A				;$B9EB82
	LDA.w $002E,y				;$B9EB84
	SEC					;$B9EB87
	SBC.b $1A				;$B9EB88
	EOR.w #$FFFF				;$B9EB8A
	INC					;$B9EB8D
	STA.w $002E,y				;$B9EB8E
CODE_B9EB91:
	LDA.w $006A,y				;$B9EB91
CODE_B9EB94:
	STA.w $0016,y				;$B9EB94
	RTS					;$B9EB97

CODE_B9EB98:
	TYX					;$B9EB98
	LDA.b $68,x				;$B9EB99
	BEQ.b CODE_B9EBA0			;$B9EB9B
	DEC.b $68,x				;$B9EB9D
	RTS					;$B9EB9F

CODE_B9EBA0:
	LDA.w $005B,y				;$B9EBA0
	AND.w #$00FF				;$B9EBA3
	ASL					;$B9EBA6
	TAX					;$B9EBA7
	JSR.w (DATA_B9EBB1,x)			;$B9EBA8
	JSR.w CODE_B9E108			;$B9EBAB
	JMP.w CODE_B9EE64			;$B9EBAE

DATA_B9EBB1:
	dw CODE_B9E198
	dw CODE_B9EBB5

CODE_B9EBB5:
	LDA.w $0034,y				;$B9EBB5
	BPL.b CODE_B9EBE2			;$B9EBB8
	LDA.w $0065,y				;$B9EBBA
	AND.w #$00FF				;$B9EBBD
	EOR.w #$FFFF				;$B9EBC0
	SEC					;$B9EBC3
	ADC.w $005E,y				;$B9EBC4
	CMP.w $0016,y				;$B9EBC7
	BEQ.b CODE_B9EBF1			;$B9EBCA
	BCC.b CODE_B9EBF1			;$B9EBCC
CODE_B9EBCE:
	LDA.w $0066,y				;$B9EBCE
	EOR.w #$FFFF				;$B9EBD1
	INC					;$B9EBD4
	STA.w $0066,y				;$B9EBD5
	STA.w $0034,y				;$B9EBD8
	LDA.w #$0008				;$B9EBDB
	STA.w $0068,y				;$B9EBDE
	RTS					;$B9EBE1

CODE_B9EBE2:
	LDA.w $0064,y				;$B9EBE2
	AND.w #$00FF				;$B9EBE5
	CLC					;$B9EBE8
	ADC.w $005E,y				;$B9EBE9
	CMP.w $0016,y				;$B9EBEC
	BCC.b CODE_B9EBCE			;$B9EBEF
CODE_B9EBF1:
	RTS					;$B9EBF1

CODE_B9EBF2:
	JSR.w CODE_B9E0E9			;$B9EBF2
	JMP.w CODE_B9EE6E			;$B9EBF5

CODE_B9EBF8:
	JSR.w CODE_B9EE78			;$B9EBF8
CODE_B9EBFB:
	JSR.w CODE_B9EE6E			;$B9EBFB
	JSR.w CODE_B9EC09			;$B9EBFE
	JSR.w CODE_B9E548			;$B9EC01
	JSL.l CODE_B9F65E			;$B9EC04
	RTS					;$B9EC08

CODE_B9EC09:
	LDA.w $050F				;$B9EC09
	BPL.b CODE_B9EC13			;$B9EC0C
CODE_B9EC0E:
	JSL.l CODE_B9EEA0			;$B9EC0E
	RTS					;$B9EC12

CODE_B9EC13:
	LDX.b current_sprite			;$B9EC13
	CLC					;$B9EC15
	ADC.w #$0010				;$B9EC16
	CMP.b $16,x				;$B9EC19
	BCS.b CODE_B9EC0E			;$B9EC1B
	LDA.b $2A,x				;$B9EC1D
	PHA					;$B9EC1F
	ASL					;$B9EC20
	ROR.b $2A,x				;$B9EC21
	ASL					;$B9EC23
	ROR.b $2A,x				;$B9EC24
	LDA.b $2E,x				;$B9EC26
	PHA					;$B9EC28
	ASL					;$B9EC29
	ROR.b $2E,x				;$B9EC2A
	ASL					;$B9EC2C
	ROR.b $2E,x				;$B9EC2D
	JSL.l CODE_B9EEA0			;$B9EC2F
	LDX.b current_sprite			;$B9EC33
	PLA					;$B9EC35
	STA.b $2E,x				;$B9EC36
	PLA					;$B9EC38
	STA.b $2A,x				;$B9EC39
	RTS					;$B9EC3B

CODE_B9EC3C:
	LDA.w $0030,y				;$B9EC3C
	PHA					;$B9EC3F
	JSR.w CODE_B9EBF8			;$B9EC40
	PLY					;$B9EC43
	LDX.b current_sprite			;$B9EC44
	LDA.w #$0002				;$B9EC46
	AND.b $28,x				;$B9EC49
	BEQ.b CODE_B9EC54			;$B9EC4B
	TYA					;$B9EC4D
	EOR.w #$FFFF				;$B9EC4E
	INC					;$B9EC51
	STA.b $30,x				;$B9EC52
CODE_B9EC54:
	RTS					;$B9EC54

CODE_B9EC55:
	TAX					;$B9EC55
	JSR.w (DATA_B9EC5C,x)			;$B9EC56
	JMP.w CODE_B9EBF8			;$B9EC59

DATA_B9EC5C:
	dw CODE_B9EC62
	dw CODE_B9EC72
	dw CODE_B9ECFC

CODE_B9EC62:
	TYX					;$B9EC62
	LDA.b $12,x				;$B9EC63
	STA.b $5C,x				;$B9EC65
	LDA.b $16,x				;$B9EC67
	STA.b $5E,x				;$B9EC69
	LDA.b $30,x				;$B9EC6B
	STA.b $62,x				;$B9EC6D
	INC.b $5B,x				;$B9EC6F
	RTS					;$B9EC71

CODE_B9EC72:
	LDA.w $001C,y				;$B9EC72
	AND.w #$0007				;$B9EC75
	CMP.w #$0006				;$B9EC78
	BEQ.b CODE_B9ECBA			;$B9EC7B
	LDA.w $0028,y				;$B9EC7D
	AND.w #$0002				;$B9EC80
	BNE.b CODE_B9ECBE			;$B9EC83
	LDA.w $0030,y				;$B9EC85
	BPL.b CODE_B9ECAA			;$B9EC88
	LDA.w $0061,y				;$B9EC8A
	AND.w #$00FF				;$B9EC8D
	EOR.w #$FFFF				;$B9EC90
	SEC					;$B9EC93
	ADC.w $005C,y				;$B9EC94
	CMP.w $0012,y				;$B9EC97
	BCC.b CODE_B9ECB9			;$B9EC9A
CODE_B9EC9C:
	LDA.w $0030,y				;$B9EC9C
	EOR.w #$FFFF				;$B9EC9F
	INC					;$B9ECA2
	STA.w $0030,y				;$B9ECA3
	STA.w $0062,y				;$B9ECA6
	RTS					;$B9ECA9

CODE_B9ECAA:
	LDA.w $0060,y				;$B9ECAA
	AND.w #$00FF				;$B9ECAD
	CLC					;$B9ECB0
	ADC.w $005C,y				;$B9ECB1
	CMP.w $0012,y				;$B9ECB4
	BCC.b CODE_B9EC9C			;$B9ECB7
CODE_B9ECB9:
	RTS					;$B9ECB9

CODE_B9ECBA:
	TYX					;$B9ECBA
	INC.b $5B,x				;$B9ECBB
	RTS					;$B9ECBD

CODE_B9ECBE:
	TYX					;$B9ECBE
	LDA.b $60,x				;$B9ECBF
	BIT.b $62,x				;$B9ECC1
	BPL.b CODE_B9ECDF			;$B9ECC3
	AND.w #$FF00				;$B9ECC5
	XBA					;$B9ECC8
	CLC					;$B9ECC9
	ADC.w $0012,y				;$B9ECCA
	CMP.w #$0100				;$B9ECCD
	BCS.b CODE_B9ECD5			;$B9ECD0
	LDA.w #$0100				;$B9ECD2
CODE_B9ECD5:
	STA.w $005C,y				;$B9ECD5
	LDA.w $0062,y				;$B9ECD8
	BPL.b CODE_B9ECF5			;$B9ECDB
	BRA.b CODE_B9ECF1			;$B9ECDD

CODE_B9ECDF:
	AND.w #$00FF				;$B9ECDF
	EOR.w #$FFFF				;$B9ECE2
	SEC					;$B9ECE5
	ADC.w $0012,y				;$B9ECE6
	STA.w $005C,y				;$B9ECE9
	LDA.w $0062,y				;$B9ECEC
	BMI.b CODE_B9ECF5			;$B9ECEF
CODE_B9ECF1:
	EOR.w #$FFFF				;$B9ECF1
	INC					;$B9ECF4
CODE_B9ECF5:
	STA.w $0030,y				;$B9ECF5
	STA.w $0062,y				;$B9ECF8
	RTS					;$B9ECFB

CODE_B9ECFC:
	LDA.w $001C,y				;$B9ECFC
	AND.w #$0007				;$B9ECFF
	CMP.w #$0006				;$B9ED02
	BEQ.b CODE_B9ED19			;$B9ED05
	TYX					;$B9ED07
	LDA.b $62,x				;$B9ED08
	EOR.w #$FFFF				;$B9ED0A
	INC					;$B9ED0D
	STA.b $62,x				;$B9ED0E
	LDA.b $28,x				;$B9ED10
	ORA.w #$0002				;$B9ED12
	STA.b $28,x				;$B9ED15
	DEC.b $5B,x				;$B9ED17
CODE_B9ED19:
	RTS					;$B9ED19

CODE_B9ED1A:
	JSR.w CODE_B9EE6E			;$B9ED1A
	JSR.w CODE_B9EE78			;$B9ED1D
	JSL.l CODE_B9EEA0			;$B9ED20
	RTS					;$B9ED24

CODE_B9ED25:
	PLX					;$B9ED25
	TAX					;$B9ED26
	BNE.b CODE_B9ED2F			;$B9ED27
	TYX					;$B9ED29
	JSR.w CODE_B9E711			;$B9ED2A
	INC.b $5B,x				;$B9ED2D
CODE_B9ED2F:
	LDX.b current_sprite			;$B9ED2F
	LDA.b $66,x				;$B9ED31
	CLC					;$B9ED33
	ADC.b $2E,x				;$B9ED34
	STA.b $2E,x				;$B9ED36
	TXY					;$B9ED38
	JSL.l CODE_B9EEA0			;$B9ED39
	LDX.b current_sprite			;$B9ED3D
	RTL					;$B9ED3F

CODE_B9ED40:
	PLA					;$B9ED40
	JSR.w CODE_B9EE6E			;$B9ED41
	JSL.l CODE_B9EEA0			;$B9ED44
	LDX.b current_sprite			;$B9ED48
	LDA.b $12,x				;$B9ED4A
	CMP.b $62,x				;$B9ED4C
	LDY.b $30,x				;$B9ED4E
	BPL.b CODE_B9ED56			;$B9ED50
	BCC.b CODE_B9ED58			;$B9ED52
CODE_B9ED54:
	CLC					;$B9ED54
	RTL					;$B9ED55

CODE_B9ED56:
	BCC.b CODE_B9ED54			;$B9ED56
CODE_B9ED58:
	SEC					;$B9ED58
	RTL					;$B9ED59

CODE_B9ED5A:
	TYX					;$B9ED5A
	LDY.w active_kong_sprite		;$B9ED5B
	LDA.w $0012,y				;$B9ED5E
	SEC					;$B9ED61
	SBC.b $12,x				;$B9ED62
	EOR.b $1E,x				;$B9ED64
	ASL					;$B9ED66
	BPL.b CODE_B9ED78			;$B9ED67
	LDA.b $1E,x				;$B9ED69
	EOR.b $5E,x				;$B9ED6B
	ASL					;$B9ED6D
	BMI.b CODE_B9ED78			;$B9ED6E
	LDA.b $5E,x				;$B9ED70
	EOR.w #$FFFF				;$B9ED72
	INC					;$B9ED75
	STA.b $5E,x				;$B9ED76
CODE_B9ED78:
	LDA.b $5E,x				;$B9ED78
	STA.b $30,x				;$B9ED7A
	LDA.b $5C,x				;$B9ED7C
	JSL.l CODE_B9F4B0			;$B9ED7E
	JSR.w CODE_B9EE78			;$B9ED82
	JSL.l CODE_B9EEA0			;$B9ED85
	RTS					;$B9ED89

CODE_B9ED8A:
	TYX					;$B9ED8A
	LDY.w active_kong_sprite		;$B9ED8B
	LDA.w $0012,y				;$B9ED8E
	SEC					;$B9ED91
	SBC.b $12,x				;$B9ED92
	EOR.b $1E,x				;$B9ED94
	ASL					;$B9ED96
	BPL.b CODE_B9EDA8			;$B9ED97
	LDA.b $1E,x				;$B9ED99
	EOR.b $66,x				;$B9ED9B
	ASL					;$B9ED9D
	BMI.b CODE_B9EDA8			;$B9ED9E
	LDA.b $66,x				;$B9EDA0
	EOR.w #$FFFF				;$B9EDA2
	INC					;$B9EDA5
	STA.b $66,x				;$B9EDA6
CODE_B9EDA8:
	LDA.b $66,x				;$B9EDA8
	STA.b $30,x				;$B9EDAA
	LDA.b $64,x				;$B9EDAC
	JSL.l CODE_B9F4B0			;$B9EDAE
	JSR.w CODE_B9EE78			;$B9EDB2
	JSL.l CODE_B9EEA0			;$B9EDB5
	RTS					;$B9EDB9

CODE_B9EDBA:
	LDA.w #$0001				;$B9EDBA
	JSL.l CODE_B9F4B0			;$B9EDBD
	JSR.w CODE_B9EE78			;$B9EDC1
	JSL.l CODE_B9EEA0			;$B9EDC4
	RTS					;$B9EDC8

CODE_B9EDC9:
	JSL.l CODE_B9EEA0			;$B9EDC9
	JSR.w CODE_B9EE6E			;$B9EDCD
	JSR.w CODE_B9EE78			;$B9EDD0
	JSL.l CODE_B9F65E			;$B9EDD3
	RTS					;$B9EDD7

CODE_B9EDD8:
	JSL.l CODE_B9EEA0			;$B9EDD8
	JSR.w CODE_B9EE6E			;$B9EDDC
	JSL.l CODE_B9F65E			;$B9EDDF
	RTS					;$B9EDE3

CODE_B9EDE4:
	JSR.w CODE_B9EE78			;$B9EDE4
CODE_B9EDE7:
	JSR.w CODE_B9EE6E			;$B9EDE7
	JSL.l CODE_B9EEA0			;$B9EDEA
	LDY.b current_sprite			;$B9EDEE
	LDA.w $0028,y				;$B9EDF0
	BIT.w #$0002				;$B9EDF3
	BEQ.b CODE_B9EE05			;$B9EDF6
	LDA.w $0062,y				;$B9EDF8
	EOR.w #$FFFF				;$B9EDFB
	INC					;$B9EDFE
	STA.w $0030,y				;$B9EDFF
	STA.w $0062,y				;$B9EE02
CODE_B9EE05:
	RTS					;$B9EE05

CODE_B9EE06:
	TAX					;$B9EE06
	JSR.w (DATA_B9EC5C,x)			;$B9EE07
	JMP.w CODE_B9EBFB			;$B9EE0A

CODE_B9EE0D:
	JSR.w CODE_B9EBF8			;$B9EE0D
	LDA.w $0775				;$B9EE10
	AND.w #$0004				;$B9EE13
	BEQ.b CODE_B9EE20			;$B9EE16
	CLC					;$B9EE18
	PHK					;$B9EE19
	PEA.w CODE_B9EE20-$01			;$B9EE1A
	JMP.w [$18B1]				;$B9EE1D
CODE_B9EE20:
	RTS					;$B9EE20

CODE_B9EE21:
	JSR.w CODE_B9EE64			;$B9EE21
	JSR.w CODE_B9EE6E			;$B9EE24
	JSR.w CODE_B9EC09			;$B9EE27
	JSR.w CODE_B9E548			;$B9EE2A
	RTS					;$B9EE2D

CODE_B9EE2E:
	JSR.w CODE_B9EE78			;$B9EE2E
	JSR.w CODE_B9EE6E			;$B9EE31
	JSR.w CODE_B9EC09			;$B9EE34
	JSL.l CODE_B9F65E			;$B9EE37
	LDA.w $0775				;$B9EE3B
	AND.w #$0004				;$B9EE3E
	BEQ.b CODE_B9EE4B			;$B9EE41
	CLC					;$B9EE43
	PHK					;$B9EE44
	PEA.w CODE_B9EE4B-$01			;$B9EE45
	JMP.w [$18B1]				;$B9EE48
CODE_B9EE4B:
	RTS					;$B9EE4B

CODE_B9EE4C:
	TAX					;$B9EE4C
	JSR.w (DATA_B9EC5C,x)			;$B9EE4D
	JSR.w CODE_B9EBF8			;$B9EE50
	LDA.w $0775				;$B9EE53
	AND.w #$0004				;$B9EE56
	BEQ.b CODE_B9EE63			;$B9EE59
	CLC					;$B9EE5B
	PHK					;$B9EE5C
	PEA.w CODE_B9EE63-$01			;$B9EE5D
	JMP.w [$18B1]				;$B9EE60
CODE_B9EE63:
	RTS					;$B9EE63

CODE_B9EE64:
	LDY.w #$0004				;$B9EE64
	LDA.b [$6A],y				;$B9EE67
	JSL.l CODE_B9F478			;$B9EE69
	RTS					;$B9EE6D

CODE_B9EE6E:
	LDY.w #$0004				;$B9EE6E
	LDA.b [$6A],y				;$B9EE71
	JSL.l CODE_B9F4B0			;$B9EE73
	RTS					;$B9EE77

CODE_B9EE78:
	LDX.b current_sprite			;$B9EE78
	LDY.w #$0000				;$B9EE7A
	LDA.b [$6A],y				;$B9EE7D
	LDY.w #$0002				;$B9EE7F
	CLC					;$B9EE82
	ADC.b $2E,x				;$B9EE83
	BMI.b CODE_B9EE8D			;$B9EE85
	CMP.b [$6A],y				;$B9EE87
	BCC.b CODE_B9EE8D			;$B9EE89
	LDA.b [$6A],y				;$B9EE8B
CODE_B9EE8D:
	STA.b $2E,x				;$B9EE8D
	RTS					;$B9EE8F

CODE_B9EE90:
	LDA.w $050F				;$B9EE90
	PHA					;$B9EE93
	STZ.w $050F				;$B9EE94
	JSL.l CODE_B9EEA0			;$B9EE97
	PLA					;$B9EE9B
	STA.w $050F				;$B9EE9C
	RTL					;$B9EE9F

CODE_B9EEA0:
	PHB					;$B9EEA0
	LDX.b current_sprite			;$B9EEA1
	SEP.b #$20				;$B9EEA3
	LDA.b $28,x				;$B9EEA5
	STA.b $29,x				;$B9EEA7
	LSR					;$B9EEA9
	LSR					;$B9EEAA
	LSR					;$B9EEAB
	LSR					;$B9EEAC
	STA.b $28,x				;$B9EEAD
	REP.b #$20				;$B9EEAF
	LDA.b $12,x				;$B9EEB1
	STA.b $54,x				;$B9EEB3
	LDA.b $16,x				;$B9EEB5
	STA.b $56,x				;$B9EEB7
	LDA.b $29,x				;$B9EEB9
	AND.w #$0004				;$B9EEBB
	BEQ.b CODE_B9EEDF			;$B9EEBE
	JSR.w CODE_B9F1E0			;$B9EEC0
	JSR.w CODE_B9F13A			;$B9EEC3
	STA.b $8A				;$B9EEC6
	SEC					;$B9EEC8
	SBC.b $16,x				;$B9EEC9
	BPL.b CODE_B9EF2E			;$B9EECB
	CMP.w #$FFFD				;$B9EECD
	BPL.b CODE_B9EF2A			;$B9EED0
	LDA.b $A2				;$B9EED2
	AND.w #$4000				;$B9EED4
	BNE.b CODE_B9EF30			;$B9EED7
	JSR.w CODE_B9F181			;$B9EED9
	BRL.w CODE_B9F0A2			;$B9EEDC

CODE_B9EEDF:
	JSR.w CODE_B9F1E0			;$B9EEDF
	STZ.b $A4				;$B9EEE2
	JSR.w CODE_B9F13A			;$B9EEE4
	STA.b $8A				;$B9EEE7
	SEC					;$B9EEE9
	SBC.b $16,x				;$B9EEEA
	BPL.b CODE_B9EF2E			;$B9EEEC
	TAY					;$B9EEEE
	LDA.b $A4				;$B9EEEF
	BEQ.b CODE_B9EF33			;$B9EEF1
	SEC					;$B9EEF3
	SBC.b $56,x				;$B9EEF4
	BCC.b CODE_B9EEFD			;$B9EEF6
	CMP.w #$0010				;$B9EEF8
	BCS.b CODE_B9EF33			;$B9EEFB
CODE_B9EEFD:
	LDA.b $A4				;$B9EEFD
	STA.b $8A				;$B9EEFF
	EOR.w #$FFFF				;$B9EF01
	SEC					;$B9EF04
	ADC.b $16,x				;$B9EF05
	CMP.b $AA				;$B9EF07
	BPL.b CODE_B9EF21			;$B9EF09
CODE_B9EF0B:
	JSR.w CODE_B9F181			;$B9EF0B
	LDA.b $A2				;$B9EF0E
	AND.w #$4100				;$B9EF10
	CMP.w #$0100				;$B9EF13
	BNE.b CODE_B9EF2E			;$B9EF16
	LDA.w #$0080				;$B9EF18
	ORA.b $28,x				;$B9EF1B
	STA.b $28,x				;$B9EF1D
	BRA.b CODE_B9EF87			;$B9EF1F

CODE_B9EF21:
	LDA.b $A6				;$B9EF21
	AND.w #$0007				;$B9EF23
	CMP.b $AC				;$B9EF26
	BPL.b CODE_B9EF0B			;$B9EF28
CODE_B9EF2A:
	LDA.b $8A				;$B9EF2A
	STA.b $16,x				;$B9EF2C
CODE_B9EF2E:
	BRA.b CODE_B9EF87			;$B9EF2E

CODE_B9EF30:
	BRL.w CODE_B9F0A2			;$B9EF30

CODE_B9EF33:
	CPY.b $AA				;$B9EF33
	BPL.b CODE_B9EF77			;$B9EF35
	LDA.b $A2				;$B9EF37
	AND.w #$3800				;$B9EF39
	BNE.b CODE_B9EF30			;$B9EF3C
CODE_B9EF3E:
	LDA.b $2A,x				;$B9EF3E
	AND.w #$8000				;$B9EF40
	EOR.b $A2				;$B9EF43
	BMI.b CODE_B9EF4C			;$B9EF45
	AND.w #$0080				;$B9EF47
	BNE.b CODE_B9EF30			;$B9EF4A
CODE_B9EF4C:
	LDA.b $16,x				;$B9EF4C
	DEC					;$B9EF4E
	JSL.l CODE_B9F165			;$B9EF4F
	LDA.b $2A,x				;$B9EF53
	AND.w #$8000				;$B9EF55
	EOR.b $A2				;$B9EF58
	BMI.b CODE_B9EF61			;$B9EF5A
	AND.w #$0080				;$B9EF5C
	BNE.b CODE_B9EF30			;$B9EF5F
CODE_B9EF61:
	JSR.w CODE_B9F181			;$B9EF61
	LDA.b $A2				;$B9EF64
	AND.w #$4100				;$B9EF66
	CMP.w #$0100				;$B9EF69
	BNE.b CODE_B9EF87			;$B9EF6C
	LDA.w #$0080				;$B9EF6E
	ORA.b $28,x				;$B9EF71
	STA.b $28,x				;$B9EF73
	BRA.b CODE_B9EF87			;$B9EF75

CODE_B9EF77:
	LDA.b $A0				;$B9EF77
	AND.w #$0007				;$B9EF79
	CMP.b $AC				;$B9EF7C
	BPL.b CODE_B9EF3E			;$B9EF7E
	LDA.b $A2				;$B9EF80
	AND.w #$1800				;$B9EF82
	BEQ.b CODE_B9EF2A			;$B9EF85
CODE_B9EF87:
	LDA.b $16,x				;$B9EF87
	PHA					;$B9EF89
	JSR.w CODE_B9F226			;$B9EF8A
	PLA					;$B9EF8D
	CMP.b $16,x				;$B9EF8E
	BNE.b CODE_B9EF95			;$B9EF90
	LDA.b $2E,x				;$B9EF92
	ASL					;$B9EF94
CODE_B9EF95:
	BCC.b CODE_B9F00C			;$B9EF95
	STZ.b $A4				;$B9EF97
	JSR.w CODE_B9F13A			;$B9EF99
	TAY					;$B9EF9C
	BCS.b CODE_B9EFF3			;$B9EF9D
	SEC					;$B9EF9F
	SBC.b $16,x				;$B9EFA0
	BPL.b CODE_B9EFF6			;$B9EFA2
	LDA.b $A2				;$B9EFA4
	AND.w #$4000				;$B9EFA6
	BEQ.b CODE_B9EFB9			;$B9EFA9
	STA.b $1A,x				;$B9EFAB
	STY.b $18,x				;$B9EFAD
	LDA.w #$0004				;$B9EFAF
	ORA.b $28,x				;$B9EFB2
	STA.b $28,x				;$B9EFB4
	BRL.w CODE_B9F119			;$B9EFB6

CODE_B9EFB9:
	LDA.b $A4				;$B9EFB9
	BNE.b CODE_B9EFD2			;$B9EFBB
	STZ.b $A6				;$B9EFBD
	LDA.b $16,x				;$B9EFBF
	CLC					;$B9EFC1
	ADC.w #$001F				;$B9EFC2
	AND.w #$FFE0				;$B9EFC5
	INC					;$B9EFC8
	STA.b $16,x				;$B9EFC9
	JSR.w CODE_B9F13A			;$B9EFCB
	LDA.b $A4				;$B9EFCE
	BEQ.b CODE_B9EFD4			;$B9EFD0
CODE_B9EFD2:
	STA.b $16,x				;$B9EFD2
CODE_B9EFD4:
	STZ.b $2E,x				;$B9EFD4
	STZ.b $34,x				;$B9EFD6
	LDA.w #$7F00				;$B9EFD8
	STA.b $18,x				;$B9EFDB
	LDA.w #$8050				;$B9EFDD
	STA.b $1A,x				;$B9EFE0
	LDA.b $28,x				;$B9EFE2
	ORA.w #$0001				;$B9EFE4
	STA.b $28,x				;$B9EFE7
	LDA.b $A6				;$B9EFE9
	ORA.w #$0008				;$B9EFEB
	STA.b $A0				;$B9EFEE
	BRL.w CODE_B9F119			;$B9EFF0

CODE_B9EFF3:
	LDA.w #$8050				;$B9EFF3
CODE_B9EFF6:
	STA.b $1A,x				;$B9EFF6
	LDA.b $28,x				;$B9EFF8
	AND.w #$1101				;$B9EFFA
	CMP.w #$1101				;$B9EFFD
	BEQ.b CODE_B9F007			;$B9F000
	STY.b $18,x				;$B9F002
	BRL.w CODE_B9F119			;$B9F004

CODE_B9F007:
	STZ.b $1A,x				;$B9F007
	BRL.w CODE_B9F119			;$B9F009

CODE_B9F00C:
	JSR.w CODE_B9F13A			;$B9F00C
	TAY					;$B9F00F
	BCS.b CODE_B9F05B			;$B9F010
	SEC					;$B9F012
	SBC.b $16,x				;$B9F013
	BEQ.b CODE_B9F019			;$B9F015
	BPL.b CODE_B9F060			;$B9F017
CODE_B9F019:
	LDA.b $A2				;$B9F019
	AND.w #$1800				;$B9F01B
	BNE.b CODE_B9F05B			;$B9F01E
	LDA.b $16,x				;$B9F020
	CMP.w $050F				;$B9F022
	BCS.b CODE_B9F048			;$B9F025
	LDA.b $A0				;$B9F027
	AND.w #$0007				;$B9F029
	ASL					;$B9F02C
	TAX					;$B9F02D
	LDA.l DATA_B9F126,x			;$B9F02E
	LDX.b current_sprite			;$B9F032
CODE_B9F034:
	STA.b $2E,x				;$B9F034
	STY.b $16,x				;$B9F036
	STZ.b $14,x				;$B9F038
	STY.b $18,x				;$B9F03A
	STZ.b $1A,x				;$B9F03C
	LDA.w #$0001				;$B9F03E
	ORA.b $28,x				;$B9F041
	STA.b $28,x				;$B9F043
	BRL.w CODE_B9F119			;$B9F045

CODE_B9F048:
	STY.b $18,x				;$B9F048
	EOR.w #$FFFF				;$B9F04A
	ADC.b $18,x				;$B9F04D
	BPL.b CODE_B9F056			;$B9F04F
	LDA.w #$0000				;$B9F051
	BRA.b CODE_B9F034			;$B9F054

CODE_B9F056:
	STA.b $1A,x				;$B9F056
	BRL.w CODE_B9F119			;$B9F058

CODE_B9F05B:
	LDA.w #$8050				;$B9F05B
	BRA.b CODE_B9F081			;$B9F05E

CODE_B9F060:
	STA.b $1A,x				;$B9F060
	LDA.b $A0				;$B9F062
	AND.w #$1800				;$B9F064
	BNE.b CODE_B9F05B			;$B9F067
	LDA.b $28,x				;$B9F069
	AND.w #$1100				;$B9F06B
	BEQ.b CODE_B9F083			;$B9F06E
	LDA.b $A0				;$B9F070
	AND.w #$0007				;$B9F072
	BEQ.b CODE_B9F07A			;$B9F075
	LDA.w #$0003				;$B9F077
CODE_B9F07A:
	INC					;$B9F07A
	CMP.b $1A,x				;$B9F07B
	BCS.b CODE_B9F019			;$B9F07D
	BRA.b CODE_B9F083			;$B9F07F

CODE_B9F081:
	STA.b $1A,x				;$B9F081
CODE_B9F083:
	LDA.b $28,x				;$B9F083
	AND.w #$1101				;$B9F085
	CMP.w #$1101				;$B9F088
	BEQ.b CODE_B9F09E			;$B9F08B
	STY.b $18,x				;$B9F08D
	LDA.b $28,x				;$B9F08F
	AND.w #$1101				;$B9F091
	CMP.w #$0100				;$B9F094
	BNE.b CODE_B9F09C			;$B9F097
	XBA					;$B9F099
	STA.b $2E,x				;$B9F09A
CODE_B9F09C:
	BRA.b CODE_B9F119			;$B9F09C

CODE_B9F09E:
	STZ.b $1A,x				;$B9F09E
	BRA.b CODE_B9F119			;$B9F0A0

CODE_B9F0A2:
	JSR.w CODE_B9F226			;$B9F0A2
	JSR.w CODE_B9F13A			;$B9F0A5
	STA.b $18,x				;$B9F0A8
	BCS.b CODE_B9F0C6			;$B9F0AA
	SEC					;$B9F0AC
	SBC.b $16,x				;$B9F0AD
	STA.b $1A,x				;$B9F0AF
	BPL.b CODE_B9F0C6			;$B9F0B1
	LDA.b $28,x				;$B9F0B3
	ORA.w #$0004				;$B9F0B5
	STA.b $28,x				;$B9F0B8
	LDA.b $A2				;$B9F0BA
	BIT.w #$4000				;$B9F0BC
	BEQ.b CODE_B9F0E1			;$B9F0BF
	AND.w #$1800				;$B9F0C1
	BEQ.b CODE_B9F119			;$B9F0C4
CODE_B9F0C6:
	LDA.b $29,x				;$B9F0C6
	AND.w #$0010				;$B9F0C8
	BNE.b CODE_B9F0D9			;$B9F0CB
	LDA.w #$7F00				;$B9F0CD
	STA.b $18,x				;$B9F0D0
	LDA.w #$8050				;$B9F0D2
	STA.b $1A,x				;$B9F0D5
	BRA.b CODE_B9F119			;$B9F0D7

CODE_B9F0D9:
	LDA.b $16,x				;$B9F0D9
	STA.b $18,x				;$B9F0DB
	STZ.b $1A,x				;$B9F0DD
	BRA.b CODE_B9F119			;$B9F0DF

CODE_B9F0E1:
	LDA.b $28,x				;$B9F0E1
	ORA.w #$0001				;$B9F0E3
	STA.b $28,x				;$B9F0E6
	LDA.b $2E,x				;$B9F0E8
	BMI.b CODE_B9F100			;$B9F0EA
	STZ.b $14,x				;$B9F0EC
	LDA.b $16,x				;$B9F0EE
	AND.w #$FFE0				;$B9F0F0
	STA.b $16,x				;$B9F0F3
	STA.b $18,x				;$B9F0F5
	STZ.b $1A,x				;$B9F0F7
	LDA.w #$0200				;$B9F0F9
	STA.b $2E,x				;$B9F0FC
	BRA.b CODE_B9F119			;$B9F0FE

CODE_B9F100:
	LDA.b $16,x				;$B9F100
	AND.w #$FFE0				;$B9F102
	CLC					;$B9F105
	ADC.w #$0021				;$B9F106
	STA.b $16,x				;$B9F109
	LDA.w #$7F00				;$B9F10B
	STA.b $18,x				;$B9F10E
	LDA.w #$8050				;$B9F110
	STA.b $1A,x				;$B9F113
	STZ.b $2E,x				;$B9F115
	STZ.b $34,x				;$B9F117
CODE_B9F119:
	LDA.b $A2				;$B9F119
	EOR.b $A0				;$B9F11B
	AND.w #$1E00				;$B9F11D
	EOR.b $A0				;$B9F120
	STA.b $1C,x				;$B9F122
	PLB					;$B9F124
	RTL					;$B9F125

DATA_B9F126:
	dw $0300
	dw $0300
	dw $0300
	dw $0400
	dw $0500
	dw $0600
	dw $0800
	dw $0800

CODE_B9F136:
	JSR.w CODE_B9F13A			;$B9F136
	RTL					;$B9F139

CODE_B9F13A:
	JSL.l CODE_B9F163			;$B9F13A
	CMP.w #$0000				;$B9F13E
	BMI.b CODE_B9F15E			;$B9F141
	EOR.w #$FFFF				;$B9F143
	SEC					;$B9F146
	ADC.w #$6300				;$B9F147
	CLC					;$B9F14A
	RTS					;$B9F14B

CODE_B9F14C:
	JSL.l CODE_B9F173			;$B9F14C
	CMP.w #$0000				;$B9F150
	BMI.b CODE_B9F15E			;$B9F153
	EOR.w #$FFFF				;$B9F155
	SEC					;$B9F158
	ADC.w #$6300				;$B9F159
	CLC					;$B9F15C
	RTS					;$B9F15D

CODE_B9F15E:
	LDA.w #$7F00				;$B9F15E
	SEC					;$B9F161
	RTS					;$B9F162

CODE_B9F163:
	LDA.b $16,x				;$B9F163
CODE_B9F165:
	STA.b $1C				;$B9F165
	LDA.b $12,x				;$B9F167
CODE_B9F169:
	SEC					;$B9F169
	SBC.w #$0100				;$B9F16A
	STA.b $1A				;$B9F16D
	JML.l CODE_B7C766			;$B9F16F

CODE_B9F173:
	SEC					;$B9F173
	SBC.w #$0100				;$B9F174
	STA.b $1A				;$B9F177
	LDA.b $16,x				;$B9F179
	STA.b $1C				;$B9F17B
	JML.l CODE_B7C766			;$B9F17D

CODE_B9F181:
	LDA.b $54,x				;$B9F181
	STA.b $12,x				;$B9F183
	STZ.b $10,x				;$B9F185
	LDA.b $30,x				;$B9F187
	STA.b $AE				;$B9F189
	STZ.b $30,x				;$B9F18B
	LDA.b $2A,x				;$B9F18D
	STA.b $B0				;$B9F18F
	STZ.b $2A,x				;$B9F191
	LDA.w #$0002				;$B9F193
	ORA.b $28,x				;$B9F196
	STA.b $28,x				;$B9F198
	AND.w #$1000				;$B9F19A
	BEQ.b CODE_B9F1AD			;$B9F19D
	JSR.w CODE_B9F13A			;$B9F19F
	STA.b $8A				;$B9F1A2
	SEC					;$B9F1A4
	SBC.b $16,x				;$B9F1A5
	BPL.b CODE_B9F1AD			;$B9F1A7
	LDA.b $56,x				;$B9F1A9
	STA.b $16,x				;$B9F1AB
CODE_B9F1AD:
	RTS					;$B9F1AD

CODE_B9F1AE:
	LDX.b current_sprite			;$B9F1AE
	LDY.w #$0000				;$B9F1B0
	LDA.b $2A,x				;$B9F1B3
	BPL.b CODE_B9F1B8			;$B9F1B5
	DEY					;$B9F1B7
CODE_B9F1B8:
	CLC					;$B9F1B8
	ADC.b $11,x				;$B9F1B9
	STA.b $11,x				;$B9F1BB
	TYA					;$B9F1BD
	ADC.b $13,x				;$B9F1BE
	SEP.b #$20				;$B9F1C0
	STA.b $13,x				;$B9F1C2
	REP.b #$20				;$B9F1C4
	RTS					;$B9F1C6

CODE_B9F1C7:
	LDX.b current_sprite			;$B9F1C7
	LDY.w #$0000				;$B9F1C9
	LDA.b $2E,x				;$B9F1CC
	BPL.b CODE_B9F1D1			;$B9F1CE
	DEY					;$B9F1D0
CODE_B9F1D1:
	CLC					;$B9F1D1
	ADC.b $15,x				;$B9F1D2
	STA.b $15,x				;$B9F1D4
	TYA					;$B9F1D6
	ADC.b $17,x				;$B9F1D7
	SEP.b #$20				;$B9F1D9
	STA.b $17,x				;$B9F1DB
	REP.b #$20				;$B9F1DD
	RTS					;$B9F1DF

CODE_B9F1E0:
	LDX.b current_sprite			;$B9F1E0
	LDA.b $29,x				;$B9F1E2
	AND.w #$0010				;$B9F1E4
	BNE.b CODE_B9F200			;$B9F1E7
CODE_B9F1E9:
	LDY.w #$0000				;$B9F1E9
	LDA.b $2A,x				;$B9F1EC
	BPL.b CODE_B9F1F1			;$B9F1EE
	DEY					;$B9F1F0
CODE_B9F1F1:
	CLC					;$B9F1F1
	ADC.b $11,x				;$B9F1F2
	STA.b $11,x				;$B9F1F4
	TYA					;$B9F1F6
	ADC.b $13,x				;$B9F1F7
	SEP.b #$20				;$B9F1F9
	STA.b $13,x				;$B9F1FB
	REP.b #$20				;$B9F1FD
	RTS					;$B9F1FF

CODE_B9F200:
	LDA.b $2E,x				;$B9F200
	BMI.b CODE_B9F1E9			;$B9F202
	LDA.b $18,x				;$B9F204
	STA.b $16,x				;$B9F206
	LDA.b $52,x				;$B9F208
	CLC					;$B9F20A
	ADC.b $12,x				;$B9F20B
	STA.b $12,x				;$B9F20D
	LDY.w #$0000				;$B9F20F
	LDA.b $2A,x				;$B9F212
	BPL.b CODE_B9F217			;$B9F214
	DEY					;$B9F216
CODE_B9F217:
	CLC					;$B9F217
	ADC.b $11,x				;$B9F218
	STA.b $11,x				;$B9F21A
	TYA					;$B9F21C
	ADC.b $13,x				;$B9F21D
	SEP.b #$20				;$B9F21F
	STA.b $13,x				;$B9F221
	REP.b #$20				;$B9F223
	RTS					;$B9F225

CODE_B9F226:
	LDX.b current_sprite			;$B9F226
	LDA.b $29,x				;$B9F228
	AND.w #$0010				;$B9F22A
	BNE.b CODE_B9F246			;$B9F22D
CODE_B9F22F:
	LDY.w #$0000				;$B9F22F
	LDA.b $2E,x				;$B9F232
	BPL.b CODE_B9F237			;$B9F234
	DEY					;$B9F236
CODE_B9F237:
	CLC					;$B9F237
	ADC.b $15,x				;$B9F238
	STA.b $15,x				;$B9F23A
	TYA					;$B9F23C
	ADC.b $17,x				;$B9F23D
	SEP.b #$20				;$B9F23F
	STA.b $17,x				;$B9F241
	REP.b #$20				;$B9F243
	RTS					;$B9F245

CODE_B9F246:
	LDY.b $4C,x				;$B9F246
	LDA.b $2E,x				;$B9F248
	SEC					;$B9F24A
	SBC.w $002E,y				;$B9F24B
	BMI.b CODE_B9F22F			;$B9F24E
	LDA.b $18,x				;$B9F250
	CLC					;$B9F252
	ADC.w #$0003				;$B9F253
	STA.b $16,x				;$B9F256
	STZ.b $1A,x				;$B9F258
	LDA.w #$FFFF				;$B9F25A
	STA.b $14,x				;$B9F25D
	RTS					;$B9F25F

CODE_B9F260:
	AND.w #$00FF				;$B9F260
	ASL					;$B9F263
	TAX					;$B9F264
	LDA.l DATA_B9F278,x			;$B9F265
	RTL					;$B9F269

CODE_B9F26A:
	CLC					;$B9F26A
	ADC.w #$0040				;$B9F26B
	AND.w #$00FF				;$B9F26E
	ASL					;$B9F271
	TAX					;$B9F272
	LDA.l DATA_B9F278,x			;$B9F273
	RTL					;$B9F277

DATA_B9F278:
	dw $0000,$FFFA,$FFF3,$FFED
	dw $FFE7,$FFE1,$FFDB,$FFD4
	dw $FFCE,$FFC8,$FFC2,$FFBC
	dw $FFB6,$FFB0,$FFAA,$FFA4
	dw $FF9E,$FF99,$FF93,$FF8D
	dw $FF88,$FF82,$FF7D,$FF78
	dw $FF72,$FF6D,$FF68,$FF63
	dw $FF5E,$FF59,$FF55,$FF50
	dw $FF4C,$FF47,$FF43,$FF3F
	dw $FF3B,$FF37,$FF33,$FF30
	dw $FF2C,$FF29,$FF25,$FF22
	dw $FF1F,$FF1C,$FF19,$FF17
	dw $FF14,$FF12,$FF10,$FF0E
	dw $FF0C,$FF0A,$FF09,$FF07
	dw $FF06,$FF05,$FF04,$FF03
	dw $FF02,$FF02,$FF01,$FF01
	dw $FF01,$FF01,$FF01,$FF02
	dw $FF02,$FF03,$FF04,$FF05
	dw $FF06,$FF07,$FF09,$FF0A
	dw $FF0C,$FF0E,$FF10,$FF12
	dw $FF14,$FF17,$FF19,$FF1C
	dw $FF1F,$FF22,$FF25,$FF29
	dw $FF2C,$FF30,$FF33,$FF37
	dw $FF3B,$FF3F,$FF43,$FF47
	dw $FF4C,$FF50,$FF55,$FF59
	dw $FF5E,$FF63,$FF68,$FF6D
	dw $FF72,$FF78,$FF7D,$FF82
	dw $FF88,$FF8D,$FF93,$FF99
	dw $FF9E,$FFA4,$FFAA,$FFB0
	dw $FFB6,$FFBC,$FFC2,$FFC8
	dw $FFCE,$FFD4,$FFDB,$FFE1
	dw $FFE7,$FFED,$FFF3,$FFFA
	dw $0000,$0006,$000D,$0013
	dw $0019,$001F,$0025,$002C
	dw $0032,$0038,$003E,$0044
	dw $004A,$0050,$0056,$005C
	dw $0062,$0067,$006D,$0073
	dw $0078,$007E,$0083,$0088
	dw $008E,$0093,$0098,$009D
	dw $00A2,$00A7,$00AB,$00B0
	dw $00B4,$00B9,$00BD,$00C1
	dw $00C5,$00C9,$00CD,$00D0
	dw $00D4,$00D7,$00DB,$00DE
	dw $00E1,$00E4,$00E7,$00E9
	dw $00EC,$00EE,$00F0,$00F2
	dw $00F4,$00F6,$00F7,$00F9
	dw $00FA,$00FB,$00FC,$00FD
	dw $00FE,$00FE,$00FF,$00FF
	dw $00FF,$00FF,$00FF,$00FE
	dw $00FE,$00FD,$00FC,$00FB
	dw $00FA,$00F9,$00F7,$00F6
	dw $00F4,$00F2,$00F0,$00EE
	dw $00EC,$00E9,$00E7,$00E4
	dw $00E1,$00DE,$00DB,$00D7
	dw $00D4,$00D0,$00CD,$00C9
	dw $00C5,$00C1,$00BD,$00B9
	dw $00B4,$00B0,$00AB,$00A7
	dw $00A2,$009D,$0098,$0093
	dw $008E,$0088,$0083,$007E
	dw $0078,$0073,$006D,$0067
	dw $0062,$005C,$0056,$0050
	dw $004A,$0044,$003E,$0038
	dw $0032,$002C,$0025,$001F
	dw $0019,$0013,$000D,$0006

CODE_B9F478:
	ASL					;$B9F478
	TAX					;$B9F479
	LDY.b current_sprite			;$B9F47A
	LDA.w $0034,y				;$B9F47C
	SEC					;$B9F47F
	SBC.w $002E,y				;$B9F480
	BPL.b CODE_B9F49A			;$B9F483
	EOR.w #$FFFF				;$B9F485
	INC					;$B9F488
	JSR.w (DATA_B9F4F0,x)			;$B9F489
	BEQ.b CODE_B9F4A8			;$B9F48C
	EOR.w #$FFFF				;$B9F48E
	SEC					;$B9F491
	ADC.w $002E,y				;$B9F492
	STA.w $002E,y				;$B9F495
	TYX					;$B9F498
	RTL					;$B9F499

CODE_B9F49A:
	JSR.w (DATA_B9F4F0,x)			;$B9F49A
	BEQ.b CODE_B9F4A8			;$B9F49D
	CLC					;$B9F49F
	ADC.w $002E,y				;$B9F4A0
	STA.w $002E,y				;$B9F4A3
	TYX					;$B9F4A6
	RTL					;$B9F4A7

CODE_B9F4A8:
	LDA.w $0034,y				;$B9F4A8
	STA.w $002E,y				;$B9F4AB
	TYX					;$B9F4AE
	RTL					;$B9F4AF

CODE_B9F4B0:
	ASL					;$B9F4B0
	TAX					;$B9F4B1
	LDY.b current_sprite			;$B9F4B2
	LDA.w $0030,y				;$B9F4B4
	CLC					;$B9F4B7
	ADC.w $0036,y				;$B9F4B8
	SEC					;$B9F4BB
	SBC.w $002A,y				;$B9F4BC
	BPL.b CODE_B9F4D6			;$B9F4BF
	EOR.w #$FFFF				;$B9F4C1
	INC					;$B9F4C4
	JSR.w (DATA_B9F4F0,x)			;$B9F4C5
	BEQ.b CODE_B9F4E4			;$B9F4C8
	EOR.w #$FFFF				;$B9F4CA
	SEC					;$B9F4CD
	ADC.w $002A,y				;$B9F4CE
	STA.w $002A,y				;$B9F4D1
	TYX					;$B9F4D4
	RTL					;$B9F4D5

CODE_B9F4D6:
	JSR.w (DATA_B9F4F0,x)			;$B9F4D6
	BEQ.b CODE_B9F4E4			;$B9F4D9
	CLC					;$B9F4DB
	ADC.w $002A,y				;$B9F4DC
	STA.w $002A,y				;$B9F4DF
	TYX					;$B9F4E2
	RTL					;$B9F4E3

CODE_B9F4E4:
	LDA.w $0030,y				;$B9F4E4
	CLC					;$B9F4E7
	ADC.w $0036,y				;$B9F4E8
	STA.w $002A,y				;$B9F4EB
	TYX					;$B9F4EE
	RTL					;$B9F4EF

DATA_B9F4F0:
	dw CODE_B9F57B
	dw CODE_B9F57C
	dw CODE_B9F57D
	dw CODE_B9F57E
	dw CODE_B9F524
	dw CODE_B9F531
	dw CODE_B9F53D
	dw CODE_B9F57F
	dw CODE_B9F54F
	dw CODE_B9F55B
	dw CODE_B9F566
	dw CODE_B9F584
	dw CODE_B9F588
	dw CODE_B9F592
	dw CODE_B9F595
	dw CODE_B9F5A3
	dw CODE_B9F5AC
	dw CODE_B9F5BB
	dw CODE_B9F5BD
	dw CODE_B9F5C7
	dw CODE_B9F5D0
	dw CODE_B9F5DF
	dw CODE_B9F5E7
	dw CODE_B9F5F6
	dw CODE_B9F604
	dw CODE_B9F611

CODE_B9F524:
	LSR					;$B9F524
	LSR					;$B9F525
	LSR					;$B9F526
	LSR					;$B9F527
	LSR					;$B9F528
	STA.b $42				;$B9F529
	LSR					;$B9F52B
	LSR					;$B9F52C
	CLC					;$B9F52D
	ADC.b $42				;$B9F52E
	RTS					;$B9F530

CODE_B9F531:
	LSR					;$B9F531
	LSR					;$B9F532
	LSR					;$B9F533
	LSR					;$B9F534
	LSR					;$B9F535
	STA.b $42				;$B9F536
	LSR					;$B9F538
	CLC					;$B9F539
	ADC.b $42				;$B9F53A
	RTS					;$B9F53C

CODE_B9F53D:
	LSR					;$B9F53D
	LSR					;$B9F53E
	LSR					;$B9F53F
	LSR					;$B9F540
	LSR					;$B9F541
	STA.b $42				;$B9F542
	LSR					;$B9F544
	STA.b $44				;$B9F545
	LSR					;$B9F547
	CLC					;$B9F548
	ADC.b $42				;$B9F549
	CLC					;$B9F54B
	ADC.b $44				;$B9F54C
	RTS					;$B9F54E

CODE_B9F54F:
	LSR					;$B9F54F
	LSR					;$B9F550
	LSR					;$B9F551
	LSR					;$B9F552
	STA.b $42				;$B9F553
	LSR					;$B9F555
	LSR					;$B9F556
	CLC					;$B9F557
	ADC.b $42				;$B9F558
	RTS					;$B9F55A

CODE_B9F55B:
	LSR					;$B9F55B
	LSR					;$B9F55C
	LSR					;$B9F55D
	LSR					;$B9F55E
	STA.b $42				;$B9F55F
	LSR					;$B9F561
	CLC					;$B9F562
	ADC.b $42				;$B9F563
	RTS					;$B9F565

CODE_B9F566:
	LSR					;$B9F566
	LSR					;$B9F567
	LSR					;$B9F568
	LSR					;$B9F569
	STA.b $42				;$B9F56A
	LSR					;$B9F56C
	STA.b $44				;$B9F56D
	LSR					;$B9F56F
	CLC					;$B9F570
	ADC.b $42				;$B9F571
	CLC					;$B9F573
	ADC.b $44				;$B9F574
	RTS					;$B9F576

CODE_B9F577:
	LDA.w #$0000				;$B9F577
	RTS					;$B9F57A

CODE_B9F57B:
	LSR					;$B9F57B
CODE_B9F57C:
	LSR					;$B9F57C
CODE_B9F57D:
	LSR					;$B9F57D
CODE_B9F57E:
	LSR					;$B9F57E
CODE_B9F57F:
	LSR					;$B9F57F
	LSR					;$B9F580
	LSR					;$B9F581
	LSR					;$B9F582
	RTS					;$B9F583

CODE_B9F584:
	LSR					;$B9F584
	LSR					;$B9F585
	LSR					;$B9F586
	RTS					;$B9F587

CODE_B9F588:
	LSR					;$B9F588
	LSR					;$B9F589
	LSR					;$B9F58A
	STA.b $42				;$B9F58B
	LSR					;$B9F58D
	CLC					;$B9F58E
	ADC.b $42				;$B9F58F
	RTS					;$B9F591

CODE_B9F592:
	LSR					;$B9F592
	LSR					;$B9F593
	RTS					;$B9F594

CODE_B9F595:
	LSR					;$B9F595
	LSR					;$B9F596
	STA.b $42				;$B9F597
	LSR					;$B9F599
	LSR					;$B9F59A
	SEC					;$B9F59B
	SBC.b $42				;$B9F59C
	EOR.w #$FFFF				;$B9F59E
	INC					;$B9F5A1
	RTS					;$B9F5A2

CODE_B9F5A3:
	LSR					;$B9F5A3
	LSR					;$B9F5A4
	STA.b $42				;$B9F5A5
	LSR					;$B9F5A7
	CLC					;$B9F5A8
	ADC.b $42				;$B9F5A9
	RTS					;$B9F5AB

CODE_B9F5AC:
	LSR					;$B9F5AC
	LSR					;$B9F5AD
	STA.b $42				;$B9F5AE
	LSR					;$B9F5B0
	STA.b $44				;$B9F5B1
	LSR					;$B9F5B3
	CLC					;$B9F5B4
	ADC.b $44				;$B9F5B5
	CLC					;$B9F5B7
	ADC.b $42				;$B9F5B8
	RTS					;$B9F5BA

CODE_B9F5BB:
	LSR					;$B9F5BB
	RTS					;$B9F5BC

CODE_B9F5BD:
	LSR					;$B9F5BD
	STA.b $42				;$B9F5BE
	LSR					;$B9F5C0
	LSR					;$B9F5C1
	LSR					;$B9F5C2
	CLC					;$B9F5C3
	ADC.b $42				;$B9F5C4
	RTS					;$B9F5C6

CODE_B9F5C7:
	LSR					;$B9F5C7
	STA.b $42				;$B9F5C8
	LSR					;$B9F5CA
	LSR					;$B9F5CB
	CLC					;$B9F5CC
	ADC.b $42				;$B9F5CD
	RTS					;$B9F5CF

CODE_B9F5D0:
	LSR					;$B9F5D0
	STA.b $42				;$B9F5D1
	LSR					;$B9F5D3
	LSR					;$B9F5D4
	STA.b $44				;$B9F5D5
	LSR					;$B9F5D7
	CLC					;$B9F5D8
	ADC.b $42				;$B9F5D9
	CLC					;$B9F5DB
	ADC.b $44				;$B9F5DC
	RTS					;$B9F5DE

CODE_B9F5DF:
	LSR					;$B9F5DF
	STA.b $42				;$B9F5E0
	LSR					;$B9F5E2
	CLC					;$B9F5E3
	ADC.b $42				;$B9F5E4
	RTS					;$B9F5E6

CODE_B9F5E7:
	LSR					;$B9F5E7
	STA.b $42				;$B9F5E8
	LSR					;$B9F5EA
	STA.b $44				;$B9F5EB
	LSR					;$B9F5ED
	LSR					;$B9F5EE
	CLC					;$B9F5EF
	ADC.b $44				;$B9F5F0
	CLC					;$B9F5F2
	ADC.b $42				;$B9F5F3
	RTS					;$B9F5F5

CODE_B9F5F6:
	LSR					;$B9F5F6
	STA.b $42				;$B9F5F7
	LSR					;$B9F5F9
	STA.b $44				;$B9F5FA
	LSR					;$B9F5FC
	CLC					;$B9F5FD
	ADC.b $44				;$B9F5FE
	CLC					;$B9F600
	ADC.b $42				;$B9F601
	RTS					;$B9F603

CODE_B9F604:
	STA.b $42				;$B9F604
	LSR					;$B9F606
	LSR					;$B9F607
	LSR					;$B9F608
	LSR					;$B9F609
	EOR.w #$FFFF				;$B9F60A
	INC					;$B9F60D
	CLC					;$B9F60E
	ADC.b $42				;$B9F60F
CODE_B9F611:
	RTS					;$B9F611

CODE_B9F612:
	LDX.b current_sprite			;$B9F612
	LDA.b $28,x				;$B9F614
	AND.w #$0101				;$B9F616
	CMP.w #$0101				;$B9F619
	BNE.b CODE_B9F62B			;$B9F61C
	LDA.b $16,x				;$B9F61E
	CMP.w #$01A0				;$B9F620
	BCC.b CODE_B9F62B			;$B9F623
	LDA.w $0507				;$B9F625
	STA.b $36,x				;$B9F628
	RTL					;$B9F62A

CODE_B9F62B:
	STZ.b $36,x				;$B9F62B
	RTL					;$B9F62D

CODE_B9F62E:
	LDA.w $0775				;$B9F62E
	AND.w #$0060				;$B9F631
	BNE.b CODE_B9F656			;$B9F634
	LDA.w $0777				;$B9F636
	AND.w #$0080				;$B9F639
	BEQ.b CODE_B9F65E			;$B9F63C
	LDX.b current_sprite			;$B9F63E
	LDA.b $1A,x				;$B9F640
	BNE.b CODE_B9F65B			;$B9F642
	LDA.w parent_level_number		;$B9F644
	CMP.w #!level_kongfused_cliffs		;$B9F647
	BEQ.b CODE_B9F651			;$B9F64A
	LDA.w #DATA_B9F79A			;$B9F64C
	BRA.b CODE_B9F66E			;$B9F64F

CODE_B9F651:
	LDA.w #DATA_B9F73A			;$B9F651
	BRA.b CODE_B9F66E			;$B9F654

CODE_B9F656:
	LDA.w #DATA_B9F76A			;$B9F656
	BRA.b CODE_B9F66E			;$B9F659

CODE_B9F65B:
	STZ.b $36,x				;$B9F65B
	RTL					;$B9F65D

CODE_B9F65E:
	LDA.w $0775				;$B9F65E
	AND.w #$0200				;$B9F661
	BEQ.b CODE_B9F66B			;$B9F664
	LDA.w #DATA_B9F70A			;$B9F666
	BRA.b CODE_B9F66E			;$B9F669

CODE_B9F66B:
	LDA.w #DATA_B9F6DA			;$B9F66B
CODE_B9F66E:
	STA.b $1C				;$B9F66E
	LDA level_number			;$B9F670
	CMP.w #!level_knautilus			;$B9F672
	BEQ.b CODE_B9F612			;$B9F675
	LDX.b current_sprite			;$B9F677
	LDA.b $28,x				;$B9F679
	AND.w #$0011				;$B9F67B
	CMP.w #$0001				;$B9F67E
	BNE.b CODE_B9F6BE			;$B9F681
	LDA.b $1C,x				;$B9F683
	AND.w #$0007				;$B9F685
	STA.b $1A				;$B9F688
	ASL					;$B9F68A
	ADC.b $1A				;$B9F68B
	ASL					;$B9F68D
	ADC.b $1C				;$B9F68E
	TAY					;$B9F690
	PHB					;$B9F691
	PHK					;$B9F692
	PLB					;$B9F693
	LDA.b $1C,x				;$B9F694
	BMI.b CODE_B9F6B0			;$B9F696
	TDC					;$B9F698
	SEC					;$B9F699
	SBC.w $0000,y				;$B9F69A
	STA.b $36,x				;$B9F69D
	LDA.b $2A,x				;$B9F69F
	EOR.w #$FFFF				;$B9F6A1
	INC					;$B9F6A4
	JSR.w CODE_B9F6C1			;$B9F6A5
	EOR.w #$FFFF				;$B9F6A8
	INC					;$B9F6AB
	STA.b $2A,x				;$B9F6AC
	PLB					;$B9F6AE
	RTL					;$B9F6AF

CODE_B9F6B0:
	LDA.w $0000,y				;$B9F6B0
	STA.b $36,x				;$B9F6B3
	LDA.b $2A,x				;$B9F6B5
	JSR.w CODE_B9F6C1			;$B9F6B7
	STA.b $2A,x				;$B9F6BA
	PLB					;$B9F6BC
	RTL					;$B9F6BD

CODE_B9F6BE:
	STZ.b $36,x				;$B9F6BE
	RTL					;$B9F6C0

CODE_B9F6C1:
	STA.b $1A				;$B9F6C1
	LDA.w $0002,y				;$B9F6C3
	BEQ.b CODE_B9F6CC			;$B9F6C6
	CMP.b $1A				;$B9F6C8
	BPL.b CODE_B9F6D9			;$B9F6CA
CODE_B9F6CC:
	LDA.w $0004,y				;$B9F6CC
	BEQ.b CODE_B9F6D7			;$B9F6CF
	CMP.b $1A				;$B9F6D1
	BPL.b CODE_B9F6D7			;$B9F6D3
	BCC.b CODE_B9F6D9			;$B9F6D5
CODE_B9F6D7:
	LDA.b $1A				;$B9F6D7
CODE_B9F6D9:
	RTS					;$B9F6D9

DATA_B9F6DA:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0100
	dw $00C0,$0200,$0100,$00C0,$0200,$0000,$0000,$0000

DATA_B9F70A:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0180
	dw $0100,$0300,$0100,$00C0,$0200,$0000,$0000,$0000

DATA_B9F73A:
	dw $0000,$0000,$0000,$0200,$0180,$0400,$0200,$0180
	dw $0400,$0200,$0180,$0400,$0200,$0180,$0400,$0200
	dw $0180,$0400,$0200,$0180,$0400,$0200,$0180,$0400

DATA_B9F76A:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0100,$0000
	dw $0800,$0180,$0000,$0800,$01F0,$0000,$0800,$0280
	dw $0000,$0400,$0400,$00A0,$0200,$0000,$0000,$0000

DATA_B9F79A:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0100,$0100
	dw $0200,$0100,$0200,$0200,$0200,$0200,$0400,$0200
	dw $0200,$0400,$0200,$0200,$0400,$0000,$0000,$0000

CODE_B9F7CA:
	NOP #4					;$B9F7CA
	STX.b $E0				;$B9F7CE
	LDY.w active_kong_sprite		;$B9F7D0
	LDA.w #$0100				;$B9F7D3
	CMP.b $12,x				;$B9F7D6
	BCS.b CODE_B9F7E3			;$B9F7D8
	ADC.w $04BC				;$B9F7DA
	CMP.b $12,x				;$B9F7DD
	BCC.b CODE_B9F7E3			;$B9F7DF
	LDA.b $12,x				;$B9F7E1
CODE_B9F7E3:
	STA.b $88				;$B9F7E3
	LDA.b $16,x				;$B9F7E5
	CMP.w $0016,y				;$B9F7E7
	BCC.b CODE_B9F7EF			;$B9F7EA
	LDA.w $0016,y				;$B9F7EC
CODE_B9F7EF:
	STA.b $8A				;$B9F7EF
	LDA.b $88				;$B9F7F1
	LDY.b $8A				;$B9F7F3
	STZ.b $A4				;$B9F7F5
	JSR.w CODE_B9F8E9			;$B9F7F7
	BCC.b CODE_B9F82D			;$B9F7FA
	TAY					;$B9F7FC
	LDA.b $A4				;$B9F7FD
	BNE.b CODE_B9F82B			;$B9F7FF
	TYA					;$B9F801
	LDY.w active_kong_sprite		;$B9F802
	SBC.w $0016,y				;$B9F805
	BPL.b CODE_B9F82D			;$B9F808
	CMP.w #$FFF0				;$B9F80A
	BCS.b CODE_B9F82D			;$B9F80D
	LDA.b $8A				;$B9F80F
	AND.w #$FFE0				;$B9F811
	CLC					;$B9F814
	ADC.w #$0021				;$B9F815
	CMP.w $0016,y				;$B9F818
	BCC.b CODE_B9F7EF			;$B9F81B
	BEQ.b CODE_B9F7EF			;$B9F81D
	LDX.b $E0				;$B9F81F
	LDA.b $16,x				;$B9F821
	CMP.w $0016,y				;$B9F823
	BCC.b CODE_B9F82B			;$B9F826
	LDA.w $0016,y				;$B9F828
CODE_B9F82B:
	STA.b $8A				;$B9F82B
CODE_B9F82D:
	LDY.w active_kong_sprite		;$B9F82D
	LDA.w $0012,y				;$B9F830
	STA.b $D0				;$B9F833
	CMP.b $88				;$B9F835
	LDA.w #$FFF8				;$B9F837
	BCS.b CODE_B9F83F			;$B9F83A
	LDA.w #$0008				;$B9F83C
CODE_B9F83F:
	STA.b $D4				;$B9F83F
	STZ.b $D2				;$B9F841
CODE_B9F843:
	LDA.b $D4				;$B9F843
	BEQ.b CODE_B9F870			;$B9F845
	CLC					;$B9F847
	ADC.b $D0				;$B9F848
	STA.b $D0				;$B9F84A
	CMP.b $88				;$B9F84C
	ROR					;$B9F84E
	EOR.b $D4				;$B9F84F
	BPL.b CODE_B9F859			;$B9F851
	LDA.b $88				;$B9F853
	STA.b $D0				;$B9F855
	STZ.b $D4				;$B9F857
CODE_B9F859:
	LDA.b $D0				;$B9F859
	LDY.b $8A				;$B9F85B
	JSR.w CODE_B9F8E9			;$B9F85D
	BCC.b CODE_B9F843			;$B9F860
	SBC.b $8A				;$B9F862
	TAY					;$B9F864
	BPL.b CODE_B9F843			;$B9F865
	INC.b $D2				;$B9F867
	CPY.w #$FFF8				;$B9F869
	BCS.b CODE_B9F843			;$B9F86C
	BRA.b CODE_B9F87F			;$B9F86E

CODE_B9F870:
	LDA.b $D2				;$B9F870
	BNE.b CODE_B9F87F			;$B9F872
	LDX.b $E0				;$B9F874
	LDA.b $88				;$B9F876
	STA.b $12,x				;$B9F878
	LDA.b $8A				;$B9F87A
	STA.b $16,x				;$B9F87C
	RTL					;$B9F87E

CODE_B9F87F:
	LDY.w active_kong_sprite		;$B9F87F
	LDA.w $0012,y				;$B9F882
	STA.b $88				;$B9F885
	CMP.b $D0				;$B9F887
	LDA.w #$0002				;$B9F889
	BCS.b CODE_B9F891			;$B9F88C
	LDA.w #$FFFE				;$B9F88E
CODE_B9F891:
	STA.b $D4				;$B9F891
CODE_B9F893:
	LDA.b $D4				;$B9F893
	BEQ.b CODE_B9F8E0			;$B9F895
	CLC					;$B9F897
	ADC.b $D0				;$B9F898
	STA.b $D0				;$B9F89A
	CMP.b $88				;$B9F89C
	ROR					;$B9F89E
	EOR.b $D4				;$B9F89F
	BPL.b CODE_B9F8A9			;$B9F8A1
	LDA.b $88				;$B9F8A3
	STA.b $D0				;$B9F8A5
	STZ.b $D4				;$B9F8A7
CODE_B9F8A9:
	LDA.b $D0				;$B9F8A9
	LDY.b $8A				;$B9F8AB
	JSR.w CODE_B9F8E9			;$B9F8AD
	BCC.b CODE_B9F8DD			;$B9F8B0
	SBC.b $8A				;$B9F8B2
	TAY					;$B9F8B4
	BPL.b CODE_B9F8D0			;$B9F8B5
	CPY.w #$FFF8				;$B9F8B7
	BCS.b CODE_B9F8D0			;$B9F8BA
	LDA.b $D4				;$B9F8BC
	BNE.b CODE_B9F893			;$B9F8BE
	LDX.b $E0				;$B9F8C0
	LDY.w active_kong_sprite		;$B9F8C2
CODE_B9F8C5:
	LDA.w $0012,y				;$B9F8C5
	STA.b $12,x				;$B9F8C8
	LDA.w $0016,y				;$B9F8CA
	STA.b $16,x				;$B9F8CD
	RTL					;$B9F8CF

CODE_B9F8D0:
	LDX.b $E0				;$B9F8D0
	TYA					;$B9F8D2
	CMP.w #$0008				;$B9F8D3
	BCC.b CODE_B9F8E0			;$B9F8D6
	CMP.w #$FFF8				;$B9F8D8
	BCS.b CODE_B9F8E0			;$B9F8DB
CODE_B9F8DD:
	LDA.w #$0000				;$B9F8DD
CODE_B9F8E0:
	ADC.b $8A				;$B9F8E0
	STA.b $16,x				;$B9F8E2
	LDA.b $D0				;$B9F8E4
	STA.b $12,x				;$B9F8E6
	RTL					;$B9F8E8

CODE_B9F8E9:
	STY.b $1C				;$B9F8E9
	JSL.l CODE_B9F169			;$B9F8EB
	EOR.w #$FFFF				;$B9F8EF
	BPL.b CODE_B9F905			;$B9F8F2
	TAY					;$B9F8F4
	LDA.w #$1800				;$B9F8F5
	AND.b $A0				;$B9F8F8
	AND.b $A2				;$B9F8FA
	BNE.b CODE_B9F905			;$B9F8FC
	TYA					;$B9F8FE
	CLC					;$B9F8FF
	ADC.w #$6301				;$B9F900
	SEC					;$B9F903
	RTS					;$B9F904

CODE_B9F905:
	CLC					;$B9F905
	RTS					;$B9F906
	
; Glitch: The first byte of the bank after this one must be $72 or the game will potentially freeze after taking Kuchuka's picture.
