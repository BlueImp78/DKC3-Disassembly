player_interaction_table:
	dw player_interaction_00		;00
	dw player_interaction_01		;01
	dw player_interaction_02		;02
	dw player_interaction_03		;03
	dw player_interaction_04		;04
	dw player_interaction_05		;05
	dw player_interaction_06		;06
	dw player_interaction_07		;07
	dw player_interaction_08		;08
	dw player_interaction_09		;09
	dw player_interaction_0A		;0A
	dw player_interaction_0B		;0B
	dw player_interaction_0C		;0C
	dw player_interaction_0D		;0D
	dw player_interaction_0E		;0E
	dw player_interaction_0F		;0F
	dw player_interaction_10		;10
	dw player_interaction_11		;11
	dw player_interaction_12		;12
	dw player_interaction_13		;13
	dw player_interaction_14		;14
	dw player_interaction_15		;15
	dw player_interaction_16		;16
	dw player_interaction_17		;17
	dw player_interaction_18		;18
	dw player_interaction_19		;19
	dw player_interaction_1A		;1A
	dw player_interaction_1B		;1B
	dw player_interaction_1C		;1C
	dw player_interaction_1D		;1D
	dw player_interaction_1E		;1E
	dw player_interaction_1F		;1F
	dw player_interaction_20		;20
	dw player_interaction_21		;21
	dw player_interaction_22		;22
	dw player_interaction_23		;23
	dw player_interaction_24		;24
	dw player_interaction_25		;25
	dw player_interaction_26		;26
	dw player_interaction_27		;27
	dw player_interaction_28		;28
	dw player_interaction_29		;29
	dw player_interaction_2A		;2A
	dw player_interaction_2B		;2B
	dw player_interaction_2C		;2C

CODE_B8805A:
	JMP CODE_B89C62				;$B8805A

CODE_B8805D:
	JMP CODE_B89CBD				;$B8805D

CODE_B88060:
	JMP CODE_B8E198				;$B88060

CODE_B88063:
	JMP CODE_B8E369				;$B88063

CODE_B88066:
	JMP CODE_B8E3A3				;$B88066

CODE_B88069:
	JMP CODE_B882B6				;$B88069

process_player_interactions:
	JMP process_player_interaction_direct	;$B8806C

CODE_B8806F:
	JMP CODE_B89EC6				;$B8806F

CODE_B88072:
	JMP CODE_B89EFB				;$B88072

CODE_B88075:
	JMP CODE_B8E15A				;$B88075

CODE_B88078:
	JMP CODE_B8E179				;$B88078

CODE_B8807B:
	JMP CODE_B8E22A				;$B8807B

CODE_B8807E:
	JMP CODE_B8837A				;$B8807E

CODE_B88081:
	JMP CODE_B880DB				;$B88081

CODE_B88084:
	JMP CODE_B880CE				;$B88084

CODE_B88087:
	JMP CODE_B880C0				;$B88087

CODE_B8808A:
	JMP CODE_B880F1				;$B8808A

CODE_B8808D:
	JMP CODE_B880FA				;$B8808D

CODE_B88090:
	JMP CODE_B8810B				;$B88090

CODE_B88093:
	JMP CODE_B8906D				;$B88093

CODE_B88096:
	JMP CODE_B8E587				;$B88096

CODE_B88099:
	JMP CODE_B8E5B3				;$B88099

CODE_B8809C:
	JMP CODE_B8EF54				;$B8809C

CODE_B8809F:
	JMP CODE_B89C4C				;$B8809F

CODE_B880A2:
	JMP CODE_B8EFE7				;$B880A2

CODE_B880A5:
	JMP CODE_B8E25D				;$B880A5

CODE_B880A8:
	JMP CODE_B88368				;$B880A8

CODE_B880AB:
	JMP CODE_B88A97				;$B880AB

CODE_B880AE:
	JMP CODE_B8E5A6				;$B880AE

CODE_B880B1:
	JMP CODE_B8C91E				;$B880B1

CODE_B880B4:
	JMP CODE_B88307				;$B880B4

CODE_B880B7:
	JMP CODE_B8831A				;$B880B7

CODE_B880BA:
	JMP CODE_B8813B				;$B880BA

CODE_B880BD:
	JMP CODE_B8821D				;$B880BD

CODE_B880C0:
	SEP.b #$20				;$B880C0
	EOR.b #$FF				;$B880C2
	SEC					;$B880C4
	ADC.w $18D3				;$B880C5
	STA.w $18D3				;$B880C8
	REP.b #$20				;$B880CB
	RTL					;$B880CD

CODE_B880CE:
	SEP.b #$20				;$B880CE
	PHA					;$B880D0
	CLC					;$B880D1
	ADC.w $18D3				;$B880D2
	STA.w $18D3				;$B880D5
	PLA					;$B880D8
	REP.b #$20				;$B880D9
CODE_B880DB:
	CLC					;$B880DB
	ADC.w $05D5				;$B880DC
	STA.w $05D5				;$B880DF
	LDA.w $18D5				;$B880E2
	BNE.b CODE_B880EA			;$B880E5
	STZ.w $18D9				;$B880E7
CODE_B880EA:
	LDA.w #$0078				;$B880EA
	STA.w $18D5				;$B880ED
	RTL					;$B880F0

CODE_B880F1:
	LDA.w #$2000				;$B880F1
	TSB.w $05AF				;$B880F4
	BEQ.b CODE_B880FA			;$B880F7
	RTL					;$B880F9

CODE_B880FA:
	DEC.w $05D5				;$B880FA
	LDA.w #$0078				;$B880FD
	STA.w $18D5				;$B88100
	SEP.b #$20				;$B88103
	INC.w $18D4				;$B88105
	REP.b #$20				;$B88108
	RTL					;$B8810A

CODE_B8810B:
	LDA.w #$8000				;$B8810B
	TSB.w $044A				;$B8810E
	BNE.b CODE_B88136			;$B88111
	LDA.w $075C				;$B88113
	AND.w #$00FF				;$B88116
	CMP.w #$0003				;$B88119
	BEQ.b CODE_B8812A			;$B8811C
	LDA.w #$0005				;$B8811E
	JSL.l CODE_B2800F			;$B88121
	JSL.l CODE_B880F1			;$B88125
	RTL					;$B88129

CODE_B8812A:
	LDA.w #$0002				;$B8812A
	JSL.l CODE_B2800F			;$B8812D
	JSL.l CODE_B880F1			;$B88131
	RTL					;$B88135

CODE_B88136:
	JSL.l CODE_B880F1			;$B88136
	RTL					;$B8813A

CODE_B8813B:
	LDA.b $28,x				;$B8813B
	AND.w #$1010 				;$B8813D / Check if on a standable sprite
	BEQ.b CODE_B88180 			;$B88140 / If not, branch
	LDA.w $0777 				;$B88142 / Get level properties?
	AND.w #$0400 				;$B88145 / Check bit 4 and 8
	BEQ.b CODE_B88163 			;$B88148 / If not set branch
	LDA.b $16,x 				;$B8814A / Else get Y position	
	SEC					;$B8814C
	SBC.w $1883				;$B8814D
	CMP.w #$0010				;$B88150
	BCC.b CODE_B88163			;$B88153
	STZ.b $30,x				;$B88155
	LDA.b $2A,x				;$B88157
	CMP.w #$8000				;$B88159
	ROR					;$B8815C
	CMP.w #$8000				;$B8815D
	ROR					;$B88160
	STA.b $2A,x				;$B88161
CODE_B88163:
	LDY.b $4C,x 				;$B88163 / Get index to platform sprite in sprite that is on it
	CPY.w $0503 				;$B88165 
	BNE.b CODE_B8816D 			;$B88168
	JMP.w CODE_B881CB 			;$B8816A

CODE_B8816D:
	LDA.w $0000,y 				;$B8816D / Get id of standable sprite	
	CMP.w #!sprite_steel_keg  		;$B88170 / Check if its the steel keg
	BNE.b CODE_B88180 			;$B88173 / If not, branch	
	LDA.w $0038,y 				;$B88175 / Else get steel keg state	
	CMP.w #$0005				;$B88178
	BNE.b CODE_B88180			;$B8817B
	JMP.w CODE_B881DF			;$B8817D

CODE_B88180:
	LDA.w current_held_sprite		;$B88180
	BNE.b CODE_B881A6			;$B88183
	LDA.w #$0001				;$B88185
	STA.b $38,x				;$B88188
	LDA.w #$000B				;$B8818A
	JSL.l set_anim_handle_kiddy 		;$B8818D / Set kong anim	
	LDY current_kong_control_variables	;$B88191
	LDA.w $0006,y				;$B88193
	AND.w #$0004				;$B88196
	BEQ.b CODE_B881A2			;$B88199
	LDX.b current_sprite			;$B8819B
	LDA.w #$0200				;$B8819D
	STA.b $44,x				;$B881A0
CODE_B881A2:
	JSR.w CODE_B8E2DD			;$B881A2
	RTL					;$B881A5

CODE_B881A6:
	CMP.w follower_kong_sprite		;$B881A6
	BEQ.b CODE_B881BB			;$B881A9
	LDA.w #$0010				;$B881AB
	STA.b $38,x				;$B881AE
	LDA.w #$0026				;$B881B0
	JSL.l set_anim_handle_kiddy		;$B881B3
	JSR.w CODE_B8E2DD			;$B881B7
	RTL					;$B881BA

CODE_B881BB:
	LDA.w #$003F				;$B881BB
	STA.b $38,x				;$B881BE
	LDA.w #$002B				;$B881C0
	JSL.l set_anim_handle_kiddy		;$B881C3
	JSR.w CODE_B8E2DD			;$B881C7
	RTL					;$B881CA

CODE_B881CB:
	JSL.l CODE_B89C01			;$B881CB
	LDA.w #$0052				;$B881CF
	STA.b $38,x				;$B881D2
	LDA.w #$0036				;$B881D4
	JSL.l set_anim_handle_kiddy		;$B881D7
	JSR.w CODE_B8E2DD			;$B881DB
	RTL					;$B881DE

CODE_B881DF:
	LDA.w current_held_sprite		;$B881DF
	CMP.w follower_kong_sprite		;$B881E2
	BEQ.b CODE_B881FB			;$B881E5
	JSL.l CODE_B89C01			;$B881E7
	LDA.w #$0057				;$B881EB
	STA.b $38,x				;$B881EE
	LDA.w #$0006				;$B881F0
	JSL.l set_anim_handle_kiddy		;$B881F3
	JSR.w CODE_B8E2DD			;$B881F7
	RTL					;$B881FA

CODE_B881FB:
	JSR.w CODE_B89071			;$B881FB
	JSL.l CODE_B8E179			;$B881FE
	JSL.l CODE_B8E198			;$B88202
	LDA.b $2E,x				;$B88206
	CMP.w #$8000				;$B88208
	ROR.b $2E,x				;$B8820B
	LDA.w #$0031				;$B8820D
	JSL.l set_anim_handle_kiddy		;$B88210
	LDA.w #$0044				;$B88214
	STA.b $38,x				;$B88217
	JSR.w CODE_B8E2DD			;$B88219
	RTL					;$B8821C

CODE_B8821D:
	LDA.b $28,x				;$B8821D
	AND.w #$1010				;$B8821F
	BEQ.b CODE_B88280			;$B88222
	LDA.w $0777				;$B88224
	AND.w #$0400				;$B88227
	BEQ.b CODE_B88245			;$B8822A
	LDA.b $16,x				;$B8822C
	SEC					;$B8822E
	SBC.w $1883				;$B8822F
	CMP.w #$0010				;$B88232
	BCC.b CODE_B88245			;$B88235
	STZ.b $30,x				;$B88237
	LDA.b $2A,x				;$B88239
	CMP.w #$8000				;$B8823B
	ROR					;$B8823E
	CMP.w #$8000				;$B8823F
	ROR					;$B88242
	STA.b $2A,x				;$B88243
CODE_B88245:
	LDY.b $4C,x				;$B88245
	LDA.w $0000,y				;$B88247
	CMP.w #$02D4				;$B8824A
	BNE.b CODE_B88280			;$B8824D
	LDA.w $0038,y				;$B8824F
	CMP.w #$0005				;$B88252
	BNE.b CODE_B88280			;$B88255
	JSR.w CODE_B89071			;$B88257
	LDA.b $2E,x				;$B8825A
	CMP.w #$8000				;$B8825C
	ROR.b $2E,x				;$B8825F
	JSL.l CODE_B8E179			;$B88261
	JSL.l CODE_B8E198			;$B88265
	LDA.w #$0005				;$B88269
	JSL.l set_anim_handle_animal_and_kiddy	;$B8826C
	LDY.b current_animal_type		;$B88270
	LDA.w #$0024				;$B88272
	CPY.w #!sprite_ellie			;$B88275
	BEQ.b CODE_B8827D			;$B88278
	LDA.w #$0068				;$B8827A
CODE_B8827D:
	STA.b $38,x				;$B8827D
	RTL					;$B8827F

CODE_B88280:
	LDA.w #$0067				;$B88280
	LDY.b current_animal_type		;$B88283
	CPY.w #!sprite_squitter			;$B88285
	BEQ.b CODE_B88295			;$B88288
	LDA.w #$0023				;$B8828A
	LDY.w current_held_sprite		;$B8828D
	BEQ.b CODE_B88295			;$B88290
	LDA.w #$0026				;$B88292
CODE_B88295:
	STA.b $38,x				;$B88295
	LDA.w #$0007				;$B88297
	JSL.l set_anim_handle_animal_and_kiddy	;$B8829A
	RTL					;$B8829E

CODE_B8829F:
	EOR.b $0E,x				;$B8829F
	AND.w #$FFBF				;$B882A1
	EOR.b $0E,x				;$B882A4
	STA.b $0E,x				;$B882A6
	RTS					;$B882A8

CODE_B882A9:
	EOR.w $000E,y				;$B882A9
	AND.w #$FFBF				;$B882AC
	EOR.w $000E,y				;$B882AF
	STA.w $000E,y				;$B882B2
	RTS					;$B882B5

CODE_B882B6:
	CMP.w $17C6				;$B882B6
	BCC.b CODE_B882E4			;$B882B9
	BEQ.b CODE_B882E4			;$B882BB
	CMP.w #$002B				;$B882BD
	BCS.b CODE_B882DA			;$B882C0
	PHX					;$B882C2
	PHA					;$B882C3
	LDX.w active_kong_sprite		;$B882C4
	LDA.b $38,x				;$B882C7
	ASL					;$B882C9
CODE_B882CA:
	ASL					;$B882CA
	TAX					;$B882CB
	LDA.l kong_state_flags,x		;$B882CC
	AND.w #$0001				;$B882D0
	CMP.w #$0001				;$B882D3
	PLA					;$B882D6
	PLX					;$B882D7
	BCS.b CODE_B882E4			;$B882D8
CODE_B882DA:
	STA.w $17C6				;$B882DA
	LDA.b current_sprite			;$B882DD
	STA.w $17C8				;$B882DF
	CLC					;$B882E2
	RTL					;$B882E3

CODE_B882E4:
	SEC					;$B882E4
	RTL					;$B882E5

process_player_interaction_direct:
	LDA $05AF				;$B882E6
	AND #$0001				;$B882E9
	BEQ .get_and_process_interaction	;$B882EC
	LDA screen_brightness			;$B882EE
	BNE .get_and_process_interaction	;$B882F1
	JMP player_interaction_2C		;$B882F3

.get_and_process_interaction:
	PHK					;$B882F6
	PLB					;$B882F7
	LDA $17C6				;$B882F8
	BNE .process_interaction		;$B882FB
	RTL					;$B882FD

.process_interaction:
	STZ $17C6				;$B882FE
	DEC					;$B88301
	ASL					;$B88302
	TAX					;$B88303
	JMP (player_interaction_table,x)	;$B88304

CODE_B88307:
	LDX.w active_kong_sprite		;$B88307
	LDA.b $38,x				;$B8830A
	ASL					;$B8830C
	ASL					;$B8830D
	TAX					;$B8830E
	LDA.l kong_state_flags,x		;$B8830F
	AND.w #$0008				;$B88313
	CMP.w #$0001				;$B88316
	RTL					;$B88319

CODE_B8831A:
	PHX					;$B8831A
	LDX.b $78				;$B8831B
	CPX.w follower_kong_sprite		;$B8831D
	BNE.b CODE_B88333			;$B88320
	LDA.b $38,x				;$B88322
	ASL					;$B88324
	ASL					;$B88325
	TAX					;$B88326
	LDA.l kong_state_flags,x		;$B88327
	AND.w #$0080				;$B8832B
	BNE.b CODE_B88333			;$B8832E
	CLC					;$B88330
	PLX					;$B88331
	RTL					;$B88332

CODE_B88333:
	SEC					;$B88333
	PLX					;$B88334
	RTL					;$B88335

player_interaction_2C:
	JSL.l CODE_BB85C7			;$B88336
	RTL					;$B8833A

player_interaction_2A:
	RTL					;$B8833B

player_interaction_26:
	LDA.w #$0007				;$B8833C
	LDY.w #$0100				;$B8833F
	JSL.l enable_timestop			;$B88342
	LDA.w #$0002				;$B88346
	JSL.l CODE_B2800F			;$B88349
	JSL.l CODE_B88352			;$B8834D
	RTL					;$B88351

CODE_B88352:
	LDX.w active_kong_sprite		;$B88352
	LDA.w #$001F				;$B88355
	STA.b $38,x				;$B88358
	LDA.w #$004B				;$B8835A
	STA.b $5C,x				;$B8835D
	LDX.w follower_kong_sprite		;$B8835F
	LDA.w #$0006				;$B88362
	STA.b $38,x				;$B88365
	RTL					;$B88367

CODE_B88368:
	LDX.w active_kong_sprite		;$B88368
	LDA.w #$001F				;$B8836B
	STA.b $38,x				;$B8836E
	STZ.b $5C,x				;$B88370
	LDX.w follower_kong_sprite		;$B88372
	LDA.w #$0006				;$B88375
	STA.b $38,x				;$B88378
CODE_B8837A:
	LDA.w #$0001				;$B8837A
	TSB.w $05AF				;$B8837D
	BNE.b CODE_B88389			;$B88380
	LDA.w #$820F				;$B88382
	JSL.l CODE_808024			;$B88385
CODE_B88389:
	RTL					;$B88389

player_interaction_27:
	LDX.w $1B63				;$B8838A
	BNE.b CODE_B883D9			;$B8838D
	JSR.w CODE_B898AB			;$B8838F
	JSL.l CODE_B89C01			;$B88392
	LDA.w #$0003				;$B88396
	JSL.l CODE_B2800F			;$B88399
	JSL.l CODE_B89C4C			;$B8839D
	JSR.w CODE_B8F285			;$B883A1
	LDA.w #$0001				;$B883A4
	STA.w $195D				;$B883A7
	LDA.w $17CA				;$B883AA
	AND.w #$4000				;$B883AD
	BEQ.b CODE_B883C4			;$B883B0
	ORA.b $1E,x				;$B883B2
	STA.b $1E,x				;$B883B4
	LDA.w $196D				;$B883B6
	CLC					;$B883B9
	ADC.w #$0010				;$B883BA
	STA.w $195F				;$B883BD
	JSR.w CODE_B88417			;$B883C0
	RTL					;$B883C3

CODE_B883C4:
	LDA.b $1E,x				;$B883C4
	AND.w #$BFFF				;$B883C6
	STA.b $1E,x				;$B883C9
	LDA.w $196D				;$B883CB
	CLC					;$B883CE
	ADC.w #$00F0				;$B883CF
	STA.w $195F				;$B883D2
	JSR.w CODE_B88417			;$B883D5
	RTL					;$B883D8

CODE_B883D9:
	LDA.w #$0003				;$B883D9
	JSL.l CODE_B2800F			;$B883DC
	LDX.w active_kong_sprite		;$B883E0
	LDA.w #$005C				;$B883E3
	STA.b $38,x				;$B883E6
	RTL					;$B883E8

CODE_B883E9:
	JSL.l CODE_B89C4C			;$B883E9
	LDX.b current_sprite			;$B883ED
	LDA.w #$0054				;$B883EF
	STA.b $38,x				;$B883F2
	LDA.w #$0037				;$B883F4
	JSL.l set_anim_handle_kiddy		;$B883F7
	STZ.w $1929				;$B883FB
	LDA.w #$0020				;$B883FE
	STA.w $192B				;$B88401
	JSL.l CODE_B89C3C			;$B88404
	LDA.w #$0055				;$B88408
	STA.b $38,x				;$B8840B
	STZ.b $2A,x				;$B8840D
	STZ.b $30,x				;$B8840F
	LDA.w #$0100				;$B88411
	STA.b $2E,x				;$B88414
	RTS					;$B88416

CODE_B88417:
	LDA.w $05B1				;$B88417
	AND.w #$0004				;$B8841A
	BNE.b CODE_B883E9			;$B8841D
	LDX.b current_sprite			;$B8841F
	LDA.w #$0200				;$B88421
	BIT.b $1E,x				;$B88424
	BVC.b CODE_B8842C			;$B88426
	EOR.w #$FFFF				;$B88428
	INC					;$B8842B
CODE_B8842C:
	STA.b $5E,x				;$B8842C
	JSR.w check_sprite_underwater		;$B8842E
	CMP.w #$0001				;$B88431
	BCS.b CODE_B8845C			;$B88434
	LDA.b $28,x				;$B88436
	AND.w #$0001				;$B88438
	BNE.b CODE_B8845C			;$B8843B
	LDA.b current_animal_type		;$B8843D
	CMP.w #!sprite_squawks			;$B8843F
	BEQ.b CODE_B8845C			;$B88442
	JSL.l CODE_B8E198			;$B88444
	JSL.l CODE_B8E179			;$B88448
	JSL.l CODE_B9A595			;$B8844C
	LDX.b current_sprite			;$B88450
	LDA.w #$001A				;$B88452
	STA.b $38,x				;$B88455
	STZ.b $30,x				;$B88457
	STZ.b $2A,x				;$B88459
	RTS					;$B8845B

CODE_B8845C:
	LDX.b current_sprite			;$B8845C
	LDA.w $075C				;$B8845E
	LDY.w #$0000				;$B88461
	CMP.w #$0002				;$B88464
	BNE.b CODE_B8846C			;$B88467
	LDY.w #$0078				;$B88469
CODE_B8846C:
	STY.b $60,x				;$B8846C
	LDA.b current_animal_type		;$B8846E
	BNE.b CODE_B884A5			;$B88470
	JSR.w check_sprite_underwater		;$B88472
	CMP.w #$0001				;$B88475
	BCS.b CODE_B88496			;$B88478
	LDA.w #$001B				;$B8847A
	STA.b $38,x				;$B8847D
	STZ.b $5A,x				;$B8847F
	LDA.w #$0039				;$B88481
	JSL.l set_anim_handle_kiddy		;$B88484
	LDA.w #$001F				;$B88488
	LDX.w #$0002				;$B8848B
	LDY.w #$0000				;$B8848E
	JSL.l CODE_B8F028			;$B88491
	RTS					;$B88495

CODE_B88496:
	LDA.w #$001E				;$B88496
	STA.b $38,x				;$B88499
	STZ.b $5A,x				;$B8849B
	LDA.w #$003A				;$B8849D
	JSL.l set_anim_handle_kiddy		;$B884A0
	RTS					;$B884A4

CODE_B884A5:
	LDY.w #$001E				;$B884A5
	CMP.w #!sprite_squawks			;$B884A8
	BEQ.b CODE_B884B5			;$B884AB
	CMP.w #!sprite_enguarde			;$B884AD
	BEQ.b CODE_B884B5			;$B884B0
	LDY.w #$001B				;$B884B2
CODE_B884B5:
	STY.b $38,x				;$B884B5
	STZ.b $5A,x				;$B884B7
	LDA.w #$000A				;$B884B9
	JSL.l set_anim_handle_animal_and_kiddy	;$B884BC
	RTS					;$B884C0

player_interaction_1C:
	JSR.w CODE_B898AB			;$B884C1
	JSL.l CODE_B89C01			;$B884C4
	JSL.l CODE_B89C4C			;$B884C8
	LDA.w $17CA				;$B884CC
	STA.w $195B				;$B884CF
	LDA.w #$0001				;$B884D2
	STA.w $195D				;$B884D5
	LDA.w $17CC				;$B884D8
	STA.w $195F				;$B884DB
	LDA.w $17CE				;$B884DE
	STA.w $1961				;$B884E1
	LDA.w $195F				;$B884E4
	SEC					;$B884E7
	SBC.b $12,x				;$B884E8
	LSR					;$B884EA
	EOR.b $1E,x				;$B884EB
	AND.w #$4000				;$B884ED
	EOR.b $1E,x				;$B884F0
	STA.b $1E,x				;$B884F2
	JSR.w CODE_B88417			;$B884F4
	RTL					;$B884F7

player_interaction_2B:
	JSL.l CODE_B89C4C			;$B884F8
	LDX.b current_sprite			;$B884FC
	LDA.w #$C000				;$B884FE
	STA.b $26,x				;$B88501
	STZ.b $24,x				;$B88503
	STZ.b $20,x				;$B88505
	LDA.w #$0100				;$B88507
	STA.b $3A,x				;$B8850A
	LDA.w #$0003				;$B8850C
	STA.w timestop_flags			;$B8850F
	LDA.w #$0020				;$B88512
	STA.b $38,x				;$B88515
	LDA.w #$0078				;$B88517
	STA.b $5C,x				;$B8851A
	LDA.w #$0044				;$B8851C
	JSL.l CODE_B8E22A			;$B8851F
	BCS.b CODE_B88529			;$B88523
	JSL.l CODE_B8810B			;$B88525
CODE_B88529:
	RTL					;$B88529

player_interaction_1D:
	LDA.w #$0001				;$B8852A
	JSR.w CODE_B8E24E			;$B8852D
	BEQ.b CODE_B88533			;$B88530
	RTL					;$B88532

CODE_B88533:
	STZ.w $04AA				;$B88533
	STZ.w $04AE				;$B88536
	LDX.w $17C8				;$B88539
	STX.b current_mount			;$B8853C
	STX.b current_sprite			;$B8853E
	LDA.b $00,x				;$B88540
	STA.b current_animal_type		;$B88542
	LDA.w #$0001				;$B88544
	STA.b $38,x				;$B88547
	LDA.w #$0000				;$B88549
	JSL.l set_riding_kong_anim_handle_kiddy	;$B8854C
	LDA.w #$0708				;$B88550
	JSL.l CODE_B28018			;$B88553
CODE_B88557:
	LDA.b current_animal_type		;$B88557
	SEC					;$B88559
	SBC.w #!animal_sprite_type_range_start 	;$B8855A
	STA.b $3E				;$B8855D
	LDY.w #$0010				;$B8855F
	LDA.w current_kong			;$B88562
	BEQ.b CODE_B8856B			;$B88565
	TYA					;$B88567
	LDY.w #$0000				;$B88568
CODE_B8856B:
	CLC					;$B8856B
	ADC.b $3E				;$B8856C
	TAX					;$B8856E
	TYA					;$B8856F
	CLC					;$B88570
	ADC.b $3E				;$B88571
	TAY					;$B88573
	LDA.l DATA_B88783,x			;$B88574
	STA.w $1885				;$B88578
	STA.w $188D				;$B8857B
	LDA.l DATA_B88783+$02,x			;$B8857E
	STA.w $1889				;$B88582
	STA.w $188F				;$B88585
	TYX					;$B88588
	LDA.l DATA_B88783,x			;$B88589
	SEC					;$B8858D
	SBC.w $1885				;$B8858E
	STA.w $1887				;$B88591
	LDA.l DATA_B88783+$02,x			;$B88594
	SEC					;$B88598
	SBC.w $1889				;$B88599
	STA.w $188B				;$B8859C
	LDX.b current_mount			;$B8859F
	LDA.w #$00E6				;$B885A1
	JSR.w CODE_B8829F			;$B885A4
	JSL.l CODE_B89C4C			;$B885A7
	JSR.w CODE_B88643			;$B885AB
	LDA.w #$0000				;$B885AE
	JSL.l set_anim_handle_animal_and_kiddy	;$B885B1
	JSR.w CODE_B88721			;$B885B5
	LDA.b current_animal_type		;$B885B8
	SEC					;$B885BA
	SBC.w #!animal_sprite_type_range_start 	;$B885BB
	LSR					;$B885BE
	TAX					;$B885BF
	JSR.w (DATA_B885CD,x)			;$B885C0
	LDX.b current_mount			;$B885C3
	JSR.w CODE_B8E78F			;$B885C5
	JSL.l CODE_B7D7FB			;$B885C8
	RTL					;$B885CC

DATA_B885CD:
	dw CODE_B885D5
	dw CODE_B885F8
	dw CODE_B8860B
	dw CODE_B8863A

CODE_B885D5:
	LDX.w active_kong_sprite		;$B885D5
	LDA.w #$0023				;$B885D8
	STA.b $38,x				;$B885DB
	STZ.w $1891				;$B885DD
	LDX.w $17C8				;$B885E0
	LDA.w #$FFC0				;$B885E3
	LDY.w current_kong			;$B885E6
	BEQ.b CODE_B885EE			;$B885E9
	LDA.w #$FFA0				;$B885EB
CODE_B885EE:
	CLC					;$B885EE
	ADC.b $16,x				;$B885EF
	STA.w $187D				;$B885F1
	STA.w $187F				;$B885F4
	RTS					;$B885F7

CODE_B885F8:
	LDX.w active_kong_sprite		;$B885F8
	LDA.w #$002D				;$B885FB
	STA.b $38,x				;$B885FE
	LDA.b $2E,x				;$B88600
	BPL.b CODE_B88607			;$B88602
	LDA.w #$0000				;$B88604
CODE_B88607:
	LSR					;$B88607
	STA.b $2E,x				;$B88608
	RTS					;$B8860A

CODE_B8860B:
	LDX.w active_kong_sprite		;$B8860B
	LDA.w #$0063				;$B8860E
	STA.b $38,x				;$B88611
	STZ.b $2A,x				;$B88613
	STZ.b $30,x				;$B88615
	LDA.w #$FF00				;$B88617
	STA.b $2E,x				;$B8861A
	LDA.w $05AF				;$B8861C
	BIT.w #$4000				;$B8861F
	BEQ.b CODE_B88639			;$B88622
	LDX.w follower_kong_sprite		;$B88624
	LDA.w #$0033				;$B88627
	STA.b $38,x				;$B8862A
	LDA.w #$0001				;$B8862C
	LDX.w #$0064				;$B8862F
	LDY.w #$0000				;$B88632
	JSL.l CODE_B8F028			;$B88635
CODE_B88639:
	RTS					;$B88639

CODE_B8863A:
	LDX.w active_kong_sprite		;$B8863A
	LDA.w #$0067				;$B8863D
	STA.b $38,x				;$B88640
	RTS					;$B88642

CODE_B88643:
	STZ.b $30,x				;$B88643
	LDA.b $2A,x				;$B88645
	CMP.w #$8000				;$B88647
	ROR					;$B8864A
	CMP.w #$8000				;$B8864B
	ROR					;$B8864E
	STA.b $2A,x				;$B8864F
	STZ.b $34,x				;$B88651
	LDA.b $2E,x				;$B88653
	CMP.w #$8000				;$B88655
	ROR					;$B88658
	CMP.w #$8000				;$B88659
	ROR					;$B8865C
	STA.b $2E,x				;$B8865D
	RTS					;$B8865F

player_interaction_21:
	LDX.b current_mount			;$B88660
	BNE.b CODE_B88665			;$B88662
	RTL					;$B88664

CODE_B88665:
	PHX					;$B88665
	JSL.l player_interaction_1E		;$B88666
	LDX.w active_kong_sprite		;$B8866A
	STZ.b $2E,x				;$B8866D
	PLX					;$B8866F
	STX.b current_sprite			;$B88670
	LDA.w #$011D				;$B88672
	JSL.l set_sprite_animation		;$B88675
	LDA.w #$0005				;$B88679
	STA.b $38,x				;$B8867C
	LDA.b $1E,x				;$B8867E
	ORA.w #$3000				;$B88680
	STA.b $1E,x				;$B88683
	JSR.w CODE_B88643			;$B88685
	LDA.w #$FC00				;$B88688
	STA.b $34,x				;$B8868B
	LDA.w #$0035				;$B8868D
	STA.b $5A,x				;$B88690
	RTL					;$B88692

player_interaction_1E:
	LDA.b current_mount			;$B88693
	BNE.b CODE_B88698			;$B88695
	RTL					;$B88697

CODE_B88698:
	LDY.w #$003C				;$B88698
	LDA.b current_animal_type		;$B8869B
	CMP.w #!sprite_enguarde			;$B8869D
	BEQ.b CODE_B886B0			;$B886A0
	LDA.w player_active_held		;$B886A2
	EOR.w #$0800				;$B886A5
	AND.w #$0800				;$B886A8
	BNE.b CODE_B886B0			;$B886AB
	LDY.w #$000F				;$B886AD
CODE_B886B0:
	STY.w $1899				;$B886B0
	LDX.b current_mount			;$B886B3
	LDY.w active_kong_sprite		;$B886B5
	LDA.w $0016,y				;$B886B8
	SEC					;$B886BB
	SBC.w #$0010				;$B886BC
	STA.b $16,x				;$B886BF
	JSL.l CODE_B9E021			;$B886C1
	JSR.w CODE_B88721			;$B886C5
	LDX.b current_mount			;$B886C8
	STX.b current_sprite			;$B886CA
	LDA.w #$00D0				;$B886CC
	JSR.w CODE_B8829F			;$B886CF
	LDA.w #$0002				;$B886D2
	STA.b $38,x				;$B886D5
	LDY.w #$0008				;$B886D7
	JSR.w CODE_B89C2C			;$B886DA
	JSL.l set_sprite_animation		;$B886DD
	STZ.b $30,x				;$B886E1
	STZ.b $2A,x				;$B886E3
	LDA.w #$004A				;$B886E5
	STA.b $5A,x				;$B886E8
	JSL.l CODE_B89C4C			;$B886EA
	JSR.w CODE_B88643			;$B886EE
	LDX.b current_mount			;$B886F1
	LDY.w #$000A				;$B886F3
	JSR.w CODE_B89C2C			;$B886F6
	LDX.b current_sprite			;$B886F9
	STA.b $2E,x				;$B886FB
	JSL.l CODE_B8E15A			;$B886FD
	JSL.l CODE_B8E198			;$B88701
	LDY current_kong_control_variables	;$B88705
	LDA.b active_frame_counter		;$B88707
	STA.w $0012,y				;$B88709
	LDA.w #$0009				;$B8870C
	JSL.l set_anim_handle_kiddy		;$B8870F
	LDA.w #$0002				;$B88713
	STA.b $38,x				;$B88716
	STZ.b current_animal_type		;$B88718
	STZ.b current_mount			;$B8871A
	JSL.l CODE_B7D7FB			;$B8871C
	RTL					;$B88720

CODE_B88721:
	LDX.w active_kong_sprite		;$B88721
	LDY.b current_mount			;$B88724
	LDA.b $1E,x				;$B88726
	PHA					;$B88728
	EOR.w $001E,y				;$B88729
	AND.w #$3FFF				;$B8872C
	EOR.b $1E,x				;$B8872F
	STA.b $1E,x				;$B88731
	PLA					;$B88733
	STA.w $001E,y				;$B88734
	LDA.b $22,x				;$B88737
	PHA					;$B88739
	LDA.w $0022,y				;$B8873A
	STA.b $22,x				;$B8873D
	PLA					;$B8873F
	STA.w $0022,y				;$B88740
	LDA.w $0010,y				;$B88743
	PHA					;$B88746
	LDA.b $10,x				;$B88747
	STA.w $0010,y				;$B88749
	PLA					;$B8874C
	STA.b $10,x				;$B8874D
	LDA.w $0012,y				;$B8874F
	PHA					;$B88752
	LDA.b $12,x				;$B88753
	STA.w $0012,y				;$B88755
	PLA					;$B88758
	STA.b $12,x				;$B88759
	LDA.w $0014,y				;$B8875B
	PHA					;$B8875E
	LDA.b $14,x				;$B8875F
	STA.w $0014,y				;$B88761
	PLA					;$B88764
	STA.b $14,x				;$B88765
	LDA.w $0016,y				;$B88767
	PHA					;$B8876A
	LDA.b $16,x				;$B8876B
	STA.w $0016,y				;$B8876D
	PLA					;$B88770
	STA.b $16,x				;$B88771
	LDA.w $0018,y				;$B88773
	STA.b $18,x				;$B88776
	LDA.w $001A,y				;$B88778
	STA.b $1A,x				;$B8877B
	LDA.w $0028,y				;$B8877D
	STA.b $28,x				;$B88780
	RTS					;$B88782

DATA_B88783:
	dw $0002,$FFED,$0005,$FFFF,$FFF9,$0018,$0000,$0000
	dw $0000,$FFEF,$FFF7,$0006,$FFF9,$000E,$0000,$0000

player_interaction_1F:
	LDA.w #$001C				;$B887A3
	LDY.w #$0014				;$B887A6
	JSL.l enable_timestop			;$B887A9
	LDA.b parry_index			;$B887AD
	STA.b current_sprite			;$B887AF
	JSL.l CODE_B888D9			;$B887B1
	LDY.w #$004A				;$B887B5
	JSL.l CODE_BB8585			;$B887B8
	LDY.w #$004C				;$B887BC
	JSL.l CODE_BB8585			;$B887BF
	LDX.b parry_index			;$B887C3
	JSL.l CODE_BB85E8			;$B887C5
	STZ.b parry_index			;$B887C9
	RTL					;$B887CB

player_interaction_20:
	LDA.b current_mount			;$B887CC
	BNE.b CODE_B887D5			;$B887CE
	LDA.b current_animal_type		;$B887D0
	BNE.b CODE_B887E8			;$B887D2
	RTL					;$B887D4

CODE_B887D5:
	JSL.l CODE_B89C01			;$B887D5
	JSR.w CODE_B88721			;$B887D9
	LDX.b current_mount			;$B887DC
	JSL.l CODE_BB85E8			;$B887DE
	JSR.w CODE_B88860			;$B887E2
	JMP.w CODE_B888B0			;$B887E5

CODE_B887E8:
	JSL.l CODE_B89C01			;$B887E8
	LDX.w $189B				;$B887EC
	BEQ.b CODE_B887F5			;$B887EF
	JSL.l CODE_BB85E8			;$B887F1
CODE_B887F5:
	JSL.l CODE_B89C3C			;$B887F5
	JSL.l CODE_BB85EE			;$B887F9
	LDX.w active_kong_sprite		;$B887FD
	LDA.w #$0002				;$B88800
	JSL.l CODE_BB85A0			;$B88803
	LDA.w current_kong			;$B88807
	BNE.b CODE_B88823			;$B8880A
	LDY.w follower_kong_sprite		;$B8880C
	LDA.b $1E,x				;$B8880F
	EOR.w $001E,y				;$B88811
	AND.w #$0E00				;$B88814
	PHA					;$B88817
	EOR.w $001E,y				;$B88818
	STA.w $001E,y				;$B8881B
	PLA					;$B8881E
	EOR.b $1E,x				;$B8881F
	STA.b $1E,x				;$B88821
CODE_B88823:
	JSL.l CODE_BB85FD			;$B88823
	LDX.w #aux_sprite_slot			;$B88827
	LDY.w active_kong_sprite		;$B8882A
	LDA.w $0016,y				;$B8882D
	SEC					;$B88830
	SBC.w #$0010				;$B88831
	STA.b $16,x				;$B88834
	LDA.w $0012,y				;$B88836
	STA.b $12,x				;$B88839
	JSL.l CODE_B9E021			;$B8883B
	LDY.w active_kong_sprite		;$B8883F
	LDA.b $12,x				;$B88842
	STA.w $0012,y				;$B88844
	LDA.b $16,x				;$B88847
	STA.w $0016,y				;$B88849
	LDY.w follower_kong_sprite		;$B8884C
	STA.w $0016,y				;$B8884F
	LDA.b $12,x				;$B88852
	STA.w $0012,y				;$B88854
	JSR.w CODE_B88860			;$B88857
	JSR.w CODE_B88888			;$B8885A
	JMP.w CODE_B888B0			;$B8885D

CODE_B88860:
	JSL.l CODE_B89C4C			;$B88860
	JSR.w CODE_B88643			;$B88864
	LDA.w #$FC00				;$B88867
	STA.b $2E,x				;$B8886A
	JSL.l CODE_B8E15A			;$B8886C
	JSL.l CODE_B8E198			;$B88870
	LDY current_kong_control_variables	;$B88874
	LDA.b active_frame_counter		;$B88876
	STA.w $0012,y				;$B88878
	LDA.w #$0009				;$B8887B
	JSL.l set_anim_handle_kiddy		;$B8887E
	LDA.w #$0002				;$B88882
	STA.b $38,x				;$B88885
	RTS					;$B88887

CODE_B88888:
	LDA.w $05AF				;$B88888
	AND.w #$4000				;$B8888B
	BEQ.b CODE_B888AF			;$B8888E
	JSL.l CODE_B89C3C			;$B88890
	LDA.w #$0033				;$B88894
	STA.b $38,x				;$B88897
	LDA.w #$0001				;$B88899
	LDX.w #$0037				;$B8889C
	LDY.w #$0000				;$B8889F
	JSL.l CODE_B8F028			;$B888A2
	LDX.b current_sprite			;$B888A6
	LDA.w #$0037				;$B888A8
	JSL.l set_anim_handle_kiddy		;$B888AB
CODE_B888AF:
	RTS					;$B888AF

CODE_B888B0:
	STZ.b current_animal_type		;$B888B0
	STZ.b current_mount			;$B888B2
	LDA.w #$001C				;$B888B4
	LDY.w #$0014				;$B888B7
	JSL.l enable_timestop			;$B888BA
	LDA.w active_kong_sprite		;$B888BE
	STA.b current_sprite			;$B888C1
	JSR.w CODE_B8C607			;$B888C3
	JSL.l CODE_B888D9			;$B888C6
	LDY.w #$004A				;$B888CA
	JSL.l CODE_BB8585			;$B888CD
	LDY.w #$004C				;$B888D1
	JSL.l CODE_BB8585			;$B888D4
	RTL					;$B888D8

CODE_B888D9:
	LDA.w $17CA				;$B888D9
	BPL.b CODE_B888E0			;$B888DC
	CLC					;$B888DE
	RTL					;$B888DF

CODE_B888E0:
	CMP.w #$0004				;$B888E0
	BCS.b CODE_B888F3			;$B888E3
	TAX					;$B888E5
	LDA.l DATA_B88970,x			;$B888E6
	AND.w $05D7				;$B888EA
	BEQ.b CODE_B888F2			;$B888ED
	LDX.w #$0004				;$B888EF
CODE_B888F2:
	TXA					;$B888F2
CODE_B888F3:
	STA.w $17CA				;$B888F3
	LDY.w #$006E				;$B888F6
	JSL.l CODE_BB8585			;$B888F9
	LDA.w $17CA				;$B888FD
	CMP.w #$0011				;$B88900
	BNE.b CODE_B88918			;$B88903
	LDX.b alternate_sprite			;$B88905
	JSL.l CODE_BB85EB			;$B88907
	LDA.w $18F7				;$B8890B
	AND.w #$01E0				;$B8890E
	ORA.b $1E,x				;$B88911
	STA.b $1E,x				;$B88913
	LDA.w #$0011				;$B88915
CODE_B88918:
	LDY.b alternate_sprite			;$B88918
	ASL					;$B8891A
	ADC.w $17CA				;$B8891B
	ASL					;$B8891E
	TAX					;$B8891F
	LDA.l DATA_FF257C+$04,x			;$B88920
	STA.w $005C,y				;$B88924
	LDA.l DATA_FF257C+$02,x			;$B88927
	STA.w $0040,y				;$B8892B
	LDA.l DATA_FF257C,x			;$B8892E
	CMP.w #$0100				;$B88932
	BCC.b CODE_B8893D			;$B88935
	JSL.l CODE_BB8609			;$B88937
	BRA.b CODE_B88950			;$B8893B

CODE_B8893D:
	TAY					;$B8893D
	JSL.l CODE_BB859A			;$B8893E
	LDX.b alternate_sprite			;$B88942
	EOR.b $1E,x				;$B88944
	AND.w #$0E00				;$B88946
	EOR.b $1E,x				;$B88949
	AND.w #$BFFF				;$B8894B
	STA.b $1E,x				;$B8894E
CODE_B88950:
	LDX.b alternate_sprite			;$B88950
	LDA.b $40,x				;$B88952
	JSL.l set_alt_sprite_animation		;$B88954
	LDX.b alternate_sprite			;$B88958
	LDA.w $17CC				;$B8895A
	STA.b $62,x				;$B8895D
	LDA.w $17CE				;$B8895F
	STA.b $64,x				;$B88962
	LDA.w $17D0				;$B88964
	STA.b $66,x				;$B88967
	LDA.w $17D2				;$B88969
	STA.b $6A,x				;$B8896C
	CLC					;$B8896E
	RTL					;$B8896F

DATA_B88970:
	db $01,$02,$04,$08,$10,$20,$40,$80

player_interaction_19:
	JSL.l CODE_B89C01			;$B88978
	LDX.w $17C8				;$B8897C
	STX.b current_sprite			;$B8897F
	LDA.w $17CA				;$B88981
	STA.w $1867				;$B88984
	LDA.w $17CC				;$B88987
	STA.w $1869				;$B8898A
	LDY.w #$000C				;$B8898D
	JSL.l CODE_BB8585			;$B88990
	LDX.w active_kong_sprite		;$B88994
	LDA.w #$001C				;$B88997
	STA.b $38,x				;$B8899A
	LDA.b $3A,x				;$B8899C
	STA.w $1B55				;$B8899E
	STZ.b $3A,x				;$B889A1
	STZ.b $3C,x				;$B889A3
	STZ.b $2A,x				;$B889A5
	STZ.b $30,x				;$B889A7
	STZ.b $2E,x				;$B889A9
	STZ.b $28,x				;$B889AB
	STZ.b $4A,x				;$B889AD
	JSR.w CODE_B88A0A			;$B889AF
	LDX.w $1B63				;$B889B2
	BEQ.b CODE_B889D2			;$B889B5
	LDA.b $46,x				;$B889B7
	ORA.w #$0002				;$B889B9
	STA.b $46,x				;$B889BC
	STZ.b $5E,x				;$B889BE
	STZ.b $60,x				;$B889C0
	STZ.w $1B63				;$B889C2
	LDA.w #$0001				;$B889C5
	LDX.w #$0037				;$B889C8
	LDY.w #$0000				;$B889CB
	JSL.l CODE_B8F028			;$B889CE
CODE_B889D2:
	LDA.w $05AF				;$B889D2
	AND.w #$4000				;$B889D5
	BEQ.b CODE_B889F5			;$B889D8
	LDA.b current_animal_type		;$B889DA
	BEQ.b CODE_B889E2			;$B889DC
	LDA.b current_mount			;$B889DE
	BEQ.b CODE_B889F5			;$B889E0
CODE_B889E2:
	LDX.w follower_kong_sprite		;$B889E2
	LDA.w #$0034				;$B889E5
	STA.b $38,x				;$B889E8
	LDX.w active_kong_sprite		;$B889EA
	LDY.w follower_kong_sprite		;$B889ED
	JSR.w CODE_B8EC88			;$B889F0
	BRA.b CODE_B889F5			;$B889F3

CODE_B889F5:
	LDX.w $17C8				;$B889F5
	STX.b current_sprite			;$B889F8
	JMP.w CODE_B889FD			;$B889FA

CODE_B889FD:
	LDA.w $17D2				;$B889FD
	STA.b $1A				;$B88A00
	LDA.w $17D4				;$B88A02
	STA.b $1C				;$B88A05
	JMP.w [$001A]				;$B88A07

CODE_B88A0A:
	LDX.w active_kong_sprite		;$B88A0A
	STZ.b $24,x				;$B88A0D
	STZ.b $20,x				;$B88A0F
	LDA.w #$C000				;$B88A11
	ORA.b $26,x				;$B88A14
	STA.b $26,x				;$B88A16
	LDX.b current_mount			;$B88A18
	BEQ.b CODE_B88A22			;$B88A1A
	STZ.b $24,x				;$B88A1C
	STZ.b $20,x				;$B88A1E
	STZ.b $44,x				;$B88A20
CODE_B88A22:
	RTS					;$B88A22

player_interaction_18:
	JSL.l CODE_B89C01			;$B88A23
	LDX.w $17C8				;$B88A27
	STX.b current_sprite			;$B88A2A
	LDA.w $17CA				;$B88A2C
	STA.w $1867				;$B88A2F
	LDA.w $17CC				;$B88A32
	STA.w $1869				;$B88A35
	LDY.w #$000C				;$B88A38
	JSL.l CODE_BB8585			;$B88A3B
	LDX.w follower_kong_sprite		;$B88A3F
	LDA.w #$0035				;$B88A42
	STA.b $38,x				;$B88A45
	STZ.b $3A,x				;$B88A47
	LDA.w $17C8				;$B88A49
	STA.b $5C,x				;$B88A4C
	STZ.b $3C,x				;$B88A4E
	STZ.b $2A,x				;$B88A50
	STZ.b $30,x				;$B88A52
	STZ.b $2E,x				;$B88A54
	STZ.b $28,x				;$B88A56
	STZ.b $4A,x				;$B88A58
	LDA.w #$C000				;$B88A5A
	STA.b $26,x				;$B88A5D
	STZ.b $24,x				;$B88A5F
	STZ.b $20,x				;$B88A61
	JSL.l CODE_B89C4C			;$B88A63
	LDA.w #$004E				;$B88A67
	STA.b $38,x				;$B88A6A
	LDA.b $3A,x				;$B88A6C
	STA.w $1B55				;$B88A6E
	LDA.w #$0100				;$B88A71
	STA.b $3A,x				;$B88A74
	LDA.w #$0037				;$B88A76
	JSL.l set_anim_handle_kiddy		;$B88A79
	STZ.w $1929				;$B88A7D
	LDA.w #$0010				;$B88A80
	STA.w $192B				;$B88A83
	LDY.w active_kong_sprite		;$B88A86
	LDX.w follower_kong_sprite		;$B88A89
	JSR.w CODE_B8EC88			;$B88A8C
	LDX.w $17C8				;$B88A8F
	STX.b current_sprite			;$B88A92
	JMP.w CODE_B889FD			;$B88A94

CODE_B88A97:
	LDX.w active_kong_sprite		;$B88A97
	LDA.w #$001C				;$B88A9A
	STA.b $38,x				;$B88A9D
	LDA.b $3A,x				;$B88A9F
	STA.w $1B55				;$B88AA1
	STZ.b $3A,x				;$B88AA4
	STZ.b $3C,x				;$B88AA6
	STZ.b $2A,x				;$B88AA8
	STZ.b $30,x				;$B88AAA
	STZ.b $2E,x				;$B88AAC
	STZ.b $28,x				;$B88AAE
	STZ.b $4A,x				;$B88AB0
	JSR.w CODE_B88A0A			;$B88AB2
	LDA.w $05AF				;$B88AB5
	AND.w #$4000				;$B88AB8
	BEQ.b CODE_B88AD3			;$B88ABB
	LDA.b current_animal_type		;$B88ABD
	BEQ.b CODE_B88AC5			;$B88ABF
	LDA.b current_mount			;$B88AC1
	BEQ.b CODE_B88AD3			;$B88AC3
CODE_B88AC5:
	LDX.w follower_kong_sprite		;$B88AC5
	STZ.b $5C,x				;$B88AC8
	LDA.w #$0035				;$B88ACA
	STA.b $38,x				;$B88ACD
	STZ.b $24,x				;$B88ACF
	STZ.b $20,x				;$B88AD1
CODE_B88AD3:
	RTL					;$B88AD3

player_interaction_1A:
	JSR.w CODE_B88D13			;$B88AD4
	LDX.w $17C8				;$B88AD7
	LDY.w active_kong_sprite		;$B88ADA
	LDA.w $0030,y				;$B88ADD
	STA.w $0060,y				;$B88AE0
	LDA.b $18,x				;$B88AE3
	STA.w $005C,y				;$B88AE5
	LDA.b $1A,x				;$B88AE8
	STA.w $005E,y				;$B88AEA
	LDA.b $06,x				;$B88AED
	STA.w $0064,y				;$B88AEF
	LDA.b $4C,x				;$B88AF2
	STA.w $0062,y				;$B88AF4
	AND.w #$00FF				;$B88AF7
	BEQ.b CODE_B88B06			;$B88AFA
	LDA.w #$0003				;$B88AFC
	LDY.w #$0280				;$B88AFF
	JSL.l enable_timestop			;$B88B02
CODE_B88B06:
	LDA.w $17C8				;$B88B06
	STA.b current_sprite			;$B88B09
	LDY.w #$0078				;$B88B0B
	JSL.l CODE_BB8585			;$B88B0E
	LDX.b current_sprite			;$B88B12
	LDY.b alternate_sprite			;$B88B14
	LDA.b $49,x				;$B88B16
	PHA					;$B88B18
	JSL.l CODE_B9E009			;$B88B19
	STA.b $1A				;$B88B1D
	ASL					;$B88B1F
	CLC					;$B88B20
	ADC.b $1A				;$B88B21
	CMP.w #$8000				;$B88B23
	ROR					;$B88B26
	EOR.w #$FFFF				;$B88B27
	INC					;$B88B2A
	STA.w $002A,y				;$B88B2B
	JSR.w CODE_B88B5F			;$B88B2E
	CLC					;$B88B31
	ADC.w $0012,y				;$B88B32
	STA.w $0012,y				;$B88B35
	PLA					;$B88B38
	JSL.l CODE_B9E00C			;$B88B39
	STA.b $1A				;$B88B3D
	ASL					;$B88B3F
	CLC					;$B88B40
	ADC.b $1A				;$B88B41
	CMP.w #$8000				;$B88B43
	ROR					;$B88B46
	STA.w $002E,y				;$B88B47
	JSR.w CODE_B88B5F			;$B88B4A
	CLC					;$B88B4D
	ADC.w $0016,y				;$B88B4E
	STA.w $0016,y				;$B88B51
	LDA.w #$060D				;$B88B54
	JSL.l queue_sound_effect		;$B88B57
	JSR.w CODE_B88BD8			;$B88B5B
	RTL					;$B88B5E

CODE_B88B5F:
	CLC					;$B88B5F
	ADC.w #$0180				;$B88B60
	LSR					;$B88B63
	LSR					;$B88B64
	LSR					;$B88B65
	LSR					;$B88B66
	AND.w #$00FF				;$B88B67
	SEC					;$B88B6A
	SBC.w #$0018				;$B88B6B
	RTS					;$B88B6E

player_interaction_1B:
	LDX.w $17C8				;$B88B6F
	LDA.b $06,x				;$B88B72
	STA.b $6A				;$B88B74
	LDX.w active_kong_sprite		;$B88B76
	LDY.w #$0006				;$B88B79
	LDA.b [$6A],y				;$B88B7C
	STA.b $60,x				;$B88B7E
	STA.b $30,x				;$B88B80
	STZ.b $2A,x				;$B88B82
	LDY.w #$0008				;$B88B84
	LDA.b [$6A],y				;$B88B87
	STA.b $2E,x				;$B88B89
	LDY.w #$000A				;$B88B8B
	LDA.b [$6A],y				;$B88B8E
	STA.b $5C,x				;$B88B90
	LDY.w #$000C				;$B88B92
	LDA.b [$6A],y				;$B88B95
	STA.b $5E,x				;$B88B97
	LDA.w #$0000				;$B88B99
	STA.w $0062,y				;$B88B9C
	LDA.w #$0000				;$B88B9F
	STA.w $0064,y				;$B88BA2
	LDA.w $17C8				;$B88BA5
	STA.b current_sprite			;$B88BA8
	LDY.w #$0078				;$B88BAA
	JSL.l CODE_BB8585			;$B88BAD
	LDY.b alternate_sprite			;$B88BB1
	LDA.w $0016,y				;$B88BB3
	SEC					;$B88BB6
	SBC.w #$0028				;$B88BB7
	STA.w $0016,y				;$B88BBA
	LDX.w active_kong_sprite		;$B88BBD
	LDA.b $16,x				;$B88BC0
	SEC					;$B88BC2
	SBC.w #$0020				;$B88BC3
	STA.b $16,x				;$B88BC6
	LDX.w follower_kong_sprite		;$B88BC8
	STA.b $16,x				;$B88BCB
	LDA.w #$060D				;$B88BCD
	JSL.l queue_sound_effect		;$B88BD0
	JSR.w CODE_B88BD8			;$B88BD4
	RTL					;$B88BD7

CODE_B88BD8:
	JSL.l CODE_B89C4C			;$B88BD8
	LDA.b $16,x				;$B88BDC
	STA.w $187D				;$B88BDE
	JSL.l CODE_B8E198			;$B88BE1
	JSL.l CODE_B8E179			;$B88BE5
	LDY current_kong_control_variables	;$B88BE9
	LDA.w $0016,y				;$B88BEB
	BNE.b CODE_B88BF6			;$B88BEE
	LDA.w #$0100				;$B88BF0
	TRB.w $1B55				;$B88BF3
CODE_B88BF6:
	LDX.b current_sprite			;$B88BF6
	LDA.b $62,x				;$B88BF8
	AND.w #$00FF				;$B88BFA
	BNE.b CODE_B88C04			;$B88BFD
	LDA.w $1B55				;$B88BFF
	STA.b $3A,x				;$B88C02
CODE_B88C04:
	LDA.w #$001D				;$B88C04
	STA.b $38,x				;$B88C07
	LDA.b $26,x				;$B88C09
	AND.w #$3FFF				;$B88C0B
	STA.b $26,x				;$B88C0E
	LDA.b $63,x				;$B88C10
	AND.w #$00FF				;$B88C12
	BEQ.b CODE_B88C1E			;$B88C15
	JSR.w CODE_B88CBD			;$B88C17
	JSL.l CODE_B7D7FB			;$B88C1A
CODE_B88C1E:
	LDX.b current_sprite			;$B88C1E
	LDA.b $16,x				;$B88C20
	CMP.w $050F				;$B88C22
	BCC.b CODE_B88C2D			;$B88C25
	STZ.w $04AA				;$B88C27
	STZ.w $04AE				;$B88C2A
CODE_B88C2D:
	LDA.b current_animal_type		;$B88C2D
	BNE.b CODE_B88C4C			;$B88C2F
	LDX.w active_kong_sprite		;$B88C31
	LDY.w follower_kong_sprite		;$B88C34
	LDA.w #$00D8				;$B88C37
	JSR.w CODE_B882A9			;$B88C3A
	LDA.w #$00E4				;$B88C3D
	JSR.w CODE_B8829F			;$B88C40
	LDA.w #$0037				;$B88C43
	JSL.l set_anim_handle_kiddy		;$B88C46
	BRA.b CODE_B88C76			;$B88C4A

CODE_B88C4C:
	SEC					;$B88C4C
	SBC.w #!animal_sprite_type_range_start 	;$B88C4D
	TAX					;$B88C50
	BEQ.b CODE_B88C5E			;$B88C51
	CMP.w #$000C				;$B88C53
	BEQ.b CODE_B88C5E			;$B88C56
	STZ.w $04AA				;$B88C58
	STZ.w $04AE				;$B88C5B
CODE_B88C5E:
	PHX					;$B88C5E
	LDA.l DATA_B88CAD,x			;$B88C5F
	JSL.l set_anim_handle_animal_and_kiddy	;$B88C63
	PLX					;$B88C67
	LDA.b current_mount			;$B88C68
	BEQ.b CODE_B88CAC			;$B88C6A
	STA.b current_sprite			;$B88C6C
	LDA.l DATA_B88CAD+$02,x			;$B88C6E
	JSL.l set_riding_kong_anim_handle_kiddy	;$B88C72
CODE_B88C76:
	LDA.w $05AF				;$B88C76
	AND.w #$4000				;$B88C79
	BEQ.b CODE_B88CAC			;$B88C7C
	JSL.l CODE_B89C3C			;$B88C7E
	LDY.w active_kong_sprite		;$B88C82
	LDA.w $0012,y				;$B88C85
	STA.b $12,x				;$B88C88
	LDA.w $0016,y				;$B88C8A
	STA.b $16,x				;$B88C8D
	STZ.b $26,x				;$B88C8F
	LDA.w #$0033				;$B88C91
	STA.b $38,x				;$B88C94
	LDA.w #$0001				;$B88C96
	LDX.w #$0037				;$B88C99
	LDY.w #$0000				;$B88C9C
	JSL.l CODE_B8F028			;$B88C9F
	LDX.b current_sprite			;$B88CA3
	LDA.w #$0037				;$B88CA5
	JSL.l set_anim_handle_kiddy		;$B88CA8
CODE_B88CAC:
	RTS					;$B88CAC

DATA_B88CAD:
	dw $0005,$0000,$0000,$0000,$0000,$0000,$0005,$0000

CODE_B88CBD:
	PHA					;$B88CBD
	LDA.b current_animal_type		;$B88CBE
	BEQ.b CODE_B88CC6			;$B88CC0
	LDA.b current_mount			;$B88CC2
	BEQ.b CODE_B88CDF			;$B88CC4
CODE_B88CC6:
	LDX.w follower_kong_sprite		;$B88CC6
	LDA.w #$0001				;$B88CC9
	JSL.l CODE_BB85A0			;$B88CCC
	LDX.w follower_kong_sprite		;$B88CD0
	JSL.l CODE_BB85EB			;$B88CD3
	LDX.b current_mount			;$B88CD7
	BEQ.b CODE_B88CDF			;$B88CD9
	JSL.l CODE_BB85E8			;$B88CDB
CODE_B88CDF:
	LDX.w follower_kong_sprite		;$B88CDF
	JSR.w CODE_B89F20			;$B88CE2
	LDA.b $01,S				;$B88CE5
	ASL					;$B88CE7
	ASL					;$B88CE8
	ADC.w #$0230				;$B88CE9
	STA.b current_animal_type		;$B88CEC
	STZ.b current_mount			;$B88CEE
	LDX.w active_kong_sprite		;$B88CF0
	PLA					;$B88CF3
	CLC					;$B88CF4
	ADC.w #$0015				;$B88CF5
	CMP.w #$0018				;$B88CF8
	BNE.b CODE_B88D0A			;$B88CFB
	TAY					;$B88CFD
	LDA.w $0777				;$B88CFE
	AND.w #$0010				;$B88D01
	BEQ.b CODE_B88D09			;$B88D04
	LDY.w #$001E				;$B88D06
CODE_B88D09:
	TYA					;$B88D09
CODE_B88D0A:
	JSL.l CODE_BB85A0			;$B88D0A
	JSL.l CODE_B8ED11			;$B88D0E
	RTS					;$B88D12

CODE_B88D13:
	LDX.w $17C8				;$B88D13
	LDA.b $36,x				;$B88D16
	AND.w #$FF00				;$B88D18
	STA.b $1A				;$B88D1B
	LDY.w active_kong_sprite		;$B88D1D
	LDA.b $49,x				;$B88D20
	JSL.l CODE_B9E009			;$B88D22
	JSR.w CODE_B88D72			;$B88D26
	EOR.w #$FFFF				;$B88D29
	INC					;$B88D2C
	STA.w $002A,y				;$B88D2D
	STA.w $0030,y				;$B88D30
	BMI.b CODE_B88D56			;$B88D33
	BNE.b CODE_B88D4E			;$B88D35
	LDA.w player_active_held		;$B88D37
	BIT.w #$0200				;$B88D3A
	BNE.b CODE_B88D56			;$B88D3D
	BIT.w #$0100				;$B88D3F
	BNE.b CODE_B88D4E			;$B88D42
	LDX.w $17C8				;$B88D44
	LDA.b $06,x				;$B88D47
	AND.w #$0001				;$B88D49
	BNE.b CODE_B88D56			;$B88D4C
CODE_B88D4E:
	LDA.w $001E,y				;$B88D4E
	AND.w #$BFFF				;$B88D51
	BRA.b CODE_B88D5C			;$B88D54

CODE_B88D56:
	LDA.w $001E,y				;$B88D56
	ORA.w #$4000				;$B88D59
CODE_B88D5C:
	STA.w $001E,y				;$B88D5C
	LDX.w $17C8				;$B88D5F
	LDA.b $49,x				;$B88D62
	JSL.l CODE_B9E00C			;$B88D64
	JSR.w CODE_B88D72			;$B88D68
	STA.w $002E,y				;$B88D6B
	STA.w $0034,y				;$B88D6E
	RTS					;$B88D71

CODE_B88D72:
	BPL.b CODE_B88D88			;$B88D72
	EOR.w #$FFFF				;$B88D74
	INC					;$B88D77
	ORA.b $1A				;$B88D78
	STA.w CPU.multiply_A			;$B88D7A
	LDA.w CPU.multiply_result		;$B88D7D
	LDA.w CPU.multiply_result		;$B88D80
	EOR.w #$FFFF				;$B88D83
	INC					;$B88D86
	RTS					;$B88D87

CODE_B88D88:
	ORA.b $1A				;$B88D88
	STA.w CPU.multiply_A			;$B88D8A
	LDA.w CPU.multiply_result		;$B88D8D
	LDA.w CPU.multiply_result		;$B88D90
	RTS					;$B88D93

player_interaction_0A:
	JSL.l CODE_B89C4C			;$B88D94
	LDA.w #$0010				;$B88D98
	STA.b $5E,x				;$B88D9B
	STZ.b $2A,x				;$B88D9D
	BRA.b CODE_B88DA7			;$B88D9F

player_interaction_08:
	JSL.l CODE_B89C4C			;$B88DA1
	STZ.b $5E,x				;$B88DA5
CODE_B88DA7:
	LDA.w #$0008				;$B88DA7
	STA.b $38,x				;$B88DAA
	LDA.w $17CC				;$B88DAC
	CLC					;$B88DAF
	ADC.w #$0028				;$B88DB0
	STA.b $16,x				;$B88DB3
	LDA.w $17CA				;$B88DB5
	STA.b $12,x				;$B88DB8
	LDA.w #$0016				;$B88DBA
	JSL.l set_anim_handle_kiddy		;$B88DBD
	STZ.b $2E,x				;$B88DC1
	STZ.b $34,x				;$B88DC3
	STZ.b $36,x				;$B88DC5
	JSR.w CODE_B8E2DD			;$B88DC7
	LDA.w #$0020				;$B88DCA
	TSB.w $05AF				;$B88DCD
	LDA.w #$2000				;$B88DD0
	TSB.w $0474				;$B88DD3
	LDA.w #$7000				;$B88DD6
	STA.w $04AC				;$B88DD9
	RTL					;$B88DDC

player_interaction_06:
	JSL.l CODE_B89C4C			;$B88DDD
	LDA.w #$0014				;$B88DE1
	STA.b $38,x				;$B88DE4
	LDA.w $17CE				;$B88DE6
	STA.b $4C,x				;$B88DE9
	LDA.w $17CC				;$B88DEB
	CLC					;$B88DEE
	ADC.w #$002A				;$B88DEF
	STA.b $16,x				;$B88DF2
	LDA.w $17CA				;$B88DF4
	STA.b $12,x				;$B88DF7
	STZ.b $2A,x				;$B88DF9
	STZ.b $30,x				;$B88DFB
	STZ.b $2E,x				;$B88DFD
	STZ.b $34,x				;$B88DFF
	LDA.w #$0016				;$B88E01
	JSL.l set_anim_handle_kiddy		;$B88E04
	JSR.w CODE_B8E2DD			;$B88E08
	LDA.w #$0020				;$B88E0B
	TSB.w $05AF				;$B88E0E
	LDA.w #$2000				;$B88E11
	TSB.w $0474				;$B88E14
	LDA.w #$7000				;$B88E17
	STA.w $04AC				;$B88E1A
	RTL					;$B88E1D

player_interaction_0B:
	JSL.l CODE_B89C4C			;$B88E1E
	CPY.w #$1480				;$B88E22
	BNE.b CODE_B88E31			;$B88E25
	LDA.w $17CC				;$B88E27
	SEC					;$B88E2A
	SBC.w #$0008				;$B88E2B
	STA.w $17CC				;$B88E2E
CODE_B88E31:
	LDA.w #$0010				;$B88E31
	STA.b $5E,x				;$B88E34
	STZ.b $2E,x				;$B88E36
	BRA.b CODE_B88E40			;$B88E38

player_interaction_09:
	JSL.l CODE_B89C4C			;$B88E3A
	STZ.b $5E,x				;$B88E3E
CODE_B88E40:
	LDA.w #$000B				;$B88E40
	STA.b $38,x				;$B88E43
	LDA.w $17CA				;$B88E45
	STA.b $12,x				;$B88E48
	LDA.w $17CC				;$B88E4A
	STA.b $16,x				;$B88E4D
	LDA.w #$001B				;$B88E4F
	JSL.l set_anim_handle_kiddy		;$B88E52
	STZ.b $2E,x				;$B88E56
	STZ.b $34,x				;$B88E58
	STZ.b $58,x				;$B88E5A
	STZ.b $26,x				;$B88E5C
	LDA.w #$0020				;$B88E5E
	TSB.w $05AF				;$B88E61
	LDA.w #$2000				;$B88E64
	TSB.w $0474				;$B88E67
	LDA.w #$8000				;$B88E6A
	STA.w $04A6				;$B88E6D
	STA.w $04A8				;$B88E70
	STZ.w $04AA				;$B88E73
	STZ.w $04AE				;$B88E76
	LDA.w #$AC00				;$B88E79
	STA.w $04AC				;$B88E7C
	RTL					;$B88E7F

player_interaction_07:
	JSL.l CODE_B89C4C			;$B88E80
	LDY.w $17C8				;$B88E84
	STY.b $4C,x				;$B88E87
	LDA.w $0000,y				;$B88E89
	CMP.w #$0124				;$B88E8C
	BEQ.b CODE_B88EB7			;$B88E8F
	LDA.w $17CA				;$B88E91
	STA.b $4E,x				;$B88E94
	LDA.w $17CC				;$B88E96
	STA.b $50,x				;$B88E99
	JSR.w CODE_B8A7CB			;$B88E9B
	LDX.b current_sprite			;$B88E9E
	LDA.b $3E				;$B88EA0
	STA.b $12,x				;$B88EA2
	LDA.b $3A				;$B88EA4
	CMP.b $16,x				;$B88EA6
	BCS.b CODE_B88EB0			;$B88EA8
	LDA.b $3C				;$B88EAA
	CMP.b $16,x				;$B88EAC
	BCS.b CODE_B88EB2			;$B88EAE
CODE_B88EB0:
	STA.b $16,x				;$B88EB0
CODE_B88EB2:
	LDA.w #$0016				;$B88EB2
	BRA.b CODE_B88EDD			;$B88EB5

CODE_B88EB7:
	TYX					;$B88EB7
	JSL.l CODE_BEC02A			;$B88EB8
	LDX.b current_sprite			;$B88EBC
	STZ.b $3A,x				;$B88EBE
	LDY.b $4C,x				;$B88EC0
	LDA.b $D8				;$B88EC2
	CLC					;$B88EC4
	ADC.w #$0003				;$B88EC5
	STA.b $12,x				;$B88EC8
	LDA.b $DA				;$B88ECA
	CLC					;$B88ECC
	ADC.w #$006A				;$B88ECD
	SEC					;$B88ED0
	SBC.w $0046,y				;$B88ED1
	STA.b $16,x				;$B88ED4
	STZ.b $1A,x				;$B88ED6
	LDA.w #$0022				;$B88ED8
	BRA.b CODE_B88EDD			;$B88EDB

CODE_B88EDD:
	STA.b $38,x				;$B88EDD
	STZ.b $2A,x				;$B88EDF
	STZ.b $30,x				;$B88EE1
	STZ.b $2E,x				;$B88EE3
	STZ.b $34,x				;$B88EE5
	LDA.w #$001B				;$B88EE7
	JSL.l set_anim_handle_kiddy		;$B88EEA
	LDA.w #$0020				;$B88EEE
	TSB.w $05AF				;$B88EF1
	LDA.w #$2000				;$B88EF4
	TSB.w $0474				;$B88EF7
	LDA.w #$8000				;$B88EFA
	STA.w $04A6				;$B88EFD
	STA.w $04A8				;$B88F00
	STZ.w $04AA				;$B88F03
	STZ.w $04AE				;$B88F06
	LDA.w #$AC00				;$B88F09
	STA.w $04AC				;$B88F0C
	RTL					;$B88F0F

player_interaction_0C:
	LDA.w #$0020				;$B88F10
	TRB.w $05AF				;$B88F13
	BEQ.b CODE_B88F2E			;$B88F16
	JSL.l CODE_B89C4C			;$B88F18
	LDA.w #$001A				;$B88F1C
	JSL.l set_anim_handle_kiddy		;$B88F1F
	JSR.w CODE_B8E2DD			;$B88F23
	JSL.l CODE_B8E198			;$B88F26
	JSL.l CODE_B8E15A			;$B88F2A
CODE_B88F2E:
	RTL					;$B88F2E

player_interaction_0E:
	LDX.w $17C8				;$B88F2F
	CPX.w active_kong_sprite		;$B88F32
	BEQ.b CODE_B88F44			;$B88F35
	LDA.w $17CA				;$B88F37
	STA.b $2A,x				;$B88F3A
	STZ.b $30,x				;$B88F3C
	LDA.w $17CC				;$B88F3E
	STA.b $2E,x				;$B88F41
CODE_B88F43:
	RTL					;$B88F43

CODE_B88F44:
	JSR.w CODE_B89243			;$B88F44
	LDA.b $4A,x				;$B88F47
	AND.w #$0001				;$B88F49
	BNE.b CODE_B88F43			;$B88F4C
	LDA.w $17CA				;$B88F4E
	STA.b $2A,x				;$B88F51
	STZ.b $30,x				;$B88F53
	LDA.w $17CC				;$B88F55
	STA.b $2E,x				;$B88F58
	STZ.w $04AA				;$B88F5A
	STZ.w $04AE				;$B88F5D
	JSL.l CODE_B8E15A			;$B88F60
	JSL.l CODE_B8E198			;$B88F64
	LDY.b current_kong_control_variables	;$B88F68
	LDA.b active_frame_counter		;$B88F6A
	STA.w $0012,y				;$B88F6C
	LDA.b current_animal_type		;$B88F6F
	BNE.b CODE_B88FA1			;$B88F71
	LDA.w current_held_sprite		;$B88F73
	BNE.b CODE_B88F84			;$B88F76
	LDA.w #$0002				;$B88F78
	STA.b $38,x				;$B88F7B
	LDA.w #$0009				;$B88F7D
	JML.l set_anim_handle_kiddy		;$B88F80

CODE_B88F84:
	CMP.w follower_kong_sprite		;$B88F84
	BEQ.b CODE_B88F95			;$B88F87
	LDA.w #$0011				;$B88F89
	STA.b $38,x				;$B88F8C
	LDA.w #$0025				;$B88F8E
	JML.l set_anim_handle_kiddy		;$B88F91

CODE_B88F95:
	LDA.w #$0044				;$B88F95
	STA.b $38,x				;$B88F98
	LDA.w #$0030				;$B88F9A
	JML.l set_anim_handle_kiddy		;$B88F9D

CODE_B88FA1:
	LDA.w #$0068				;$B88FA1
	LDY.b current_animal_type		;$B88FA4
	CPY.w #!sprite_squitter			;$B88FA6
	BEQ.b CODE_B88FAE			;$B88FA9
	LDA.w #$0024				;$B88FAB
CODE_B88FAE:
	STA.b $38,x				;$B88FAE
	LDA.w #$0005				;$B88FB0
	JML.l set_anim_handle_animal_and_kiddy	;$B88FB3

player_interaction_0D:
	STZ.w $04AA				;$B88FB7
	STZ.w $04AE				;$B88FBA
	LDA.w #$001C				;$B88FBD
	LDY.w #$0002				;$B88FC0
	JSL.l enable_timestop			;$B88FC3
	JSL.l CODE_B89C4C			;$B88FC7
	LDA.w $17CA				;$B88FCB
	STA.b $2E,x				;$B88FCE
	JSL.l CODE_B8E179			;$B88FD0
	JSL.l CODE_B8E198			;$B88FD4
	LDA.w current_held_sprite		;$B88FD8
	CMP.w follower_kong_sprite		;$B88FDB
	BEQ.b CODE_B88FF4			;$B88FDE
	JSL.l CODE_B89C01			;$B88FE0
	LDA.w #$000D				;$B88FE4
	JSL.l set_anim_handle_kiddy		;$B88FE7
	LDA.w #$000F				;$B88FEB
	STA.b $38,x				;$B88FEE
	JSR.w CODE_B89243			;$B88FF0
	RTL					;$B88FF3

CODE_B88FF4:
	LDA.w #$0031				;$B88FF4
	JSL.l set_anim_handle_kiddy		;$B88FF7
	LDA.w #$0044				;$B88FFB
	STA.b $38,x				;$B88FFE
	RTL					;$B89000

player_interaction_10:
	STZ.w $04AA				;$B89001
	STZ.w $04AE				;$B89004
	LDA.w #$001C				;$B89007
	LDY.w #$0002				;$B8900A
	JSL.l enable_timestop			;$B8900D
	JSL.l CODE_B89C4C			;$B89011
	JSR.w CODE_B89071			;$B89015
	JSL.l CODE_B8E179			;$B89018
	JSL.l CODE_B8E198			;$B8901C
	LDA.w current_held_sprite		;$B89020
	CMP.w follower_kong_sprite		;$B89023
	BEQ.b CODE_B8903D			;$B89026
	LDA.b current_animal_type		;$B89028
	BNE.b CODE_B8904A			;$B8902A
	JSL.l CODE_B89C01			;$B8902C
	LDA.w #$000D				;$B89030
	JSL.l set_anim_handle_kiddy		;$B89033
	LDA.w #$000F				;$B89037
	STA.b $38,x				;$B8903A
	RTL					;$B8903C

CODE_B8903D:
	LDA.w #$0031				;$B8903D
	JSL.l set_anim_handle_kiddy		;$B89040
	LDA.w #$0044				;$B89044
	STA.b $38,x				;$B89047
	RTL					;$B89049

CODE_B8904A:
	JSL.l CODE_B89C01			;$B8904A
	LDA.w $1957				;$B8904E
	AND.w #$4000				;$B89051
	BNE.b CODE_B8906C			;$B89054
	LDA.w #$0005				;$B89056
	JSL.l set_anim_handle_animal_and_kiddy	;$B89059
	LDY.b current_animal_type		;$B8905D
	LDA.w #$0024				;$B8905F
	CPY.w #!sprite_ellie			;$B89062
	BEQ.b CODE_B8906A			;$B89065
	LDA.w #$0068				;$B89067
CODE_B8906A:
	STA.b $38,x				;$B8906A
CODE_B8906C:
	RTL					;$B8906C

CODE_B8906D:
	JSR.w CODE_B89071			;$B8906D
	RTL					;$B89070

CODE_B89071:
	LDX.b current_sprite			;$B89071
	LDA.b current_animal_type		;$B89073
	BNE.b CODE_B89087			;$B89075
	LDA.w current_held_sprite		;$B89077
	CMP.w follower_kong_sprite		;$B8907A
	BEQ.b CODE_B89092			;$B8907D
	LDY.w #$0030				;$B8907F
	LDA.b [$6A],y				;$B89082
	STA.b $2E,x				;$B89084
	RTS					;$B89086

CODE_B89087:
	SEC					;$B89087
	SBC.w #$00E0				;$B89088
	ASL					;$B8908B
	TAY					;$B8908C
	LDA.b [$6A],y				;$B8908D
	STA.b $2E,x				;$B8908F
	RTS					;$B89091

CODE_B89092:
	LDY.w #$0048				;$B89092
	LDA.b [$6A],y				;$B89095
	STA.b $2E,x				;$B89097
	RTS					;$B89099

player_interaction_11:
	LDA.w #$001C				;$B8909A
	LDY.w #$0002				;$B8909D
	JSL.l enable_timestop			;$B890A0
	LDA.b current_animal_type		;$B890A4
	BNE.b CODE_B890F1			;$B890A6
	JSL.l CODE_B89C4C			;$B890A8
	LDY.b current_kong_control_variables	;$B890AC
	LDA.w $0004,y				;$B890AE
	AND.w #$4000				;$B890B1
	BEQ.b CODE_B890F1			;$B890B4
	LDA.b $4A,x				;$B890B6
	AND.w #$3800				;$B890B8
	CMP.w #$1000				;$B890BB
	BNE.b CODE_B890F1			;$B890BE
	LDA.w $000E,y				;$B890C0
	CLC					;$B890C3
	ADC.w #$0100				;$B890C4
	CMP.w #$0680				;$B890C7
	BMI.b CODE_B890CF			;$B890CA
	LDA.w #$0680				;$B890CC
CODE_B890CF:
	STA.w $000E,y				;$B890CF
	JSR.w CODE_B8E2B4			;$B890D2
	LDY.w #$0168				;$B890D5
	LDA.b [$6A],y				;$B890D8
	LDY.b current_kong_control_variables	;$B890DA
	STA.w $0026,y				;$B890DC
	LDX.b current_sprite			;$B890DF
	LDA.w #$0001				;$B890E1
	STA.b $2E,x				;$B890E4
	LDA.w #$000E				;$B890E6
	STA.b $38,x				;$B890E9
	LDA.w #$0001				;$B890EB
	TSB.w $1957				;$B890EE
CODE_B890F1:
	RTL					;$B890F1

player_interaction_13:
	JSL.l CODE_B89C3C			;$B890F2
	LDA.b $38,x				;$B890F6
	CMP.w #$004A				;$B890F8
	BNE.b CODE_B89103			;$B890FB
	STX.w $17C8				;$B890FD
	JMP.w player_interaction_22		;$B89100

CODE_B89103:
	JSR.w CODE_B8B946			;$B89103
	RTL					;$B89106

player_interaction_14:
	JSL.l CODE_B89C3C			;$B89107
	JSR.w CODE_B8B946			;$B8910B
	RTL					;$B8910E

player_interaction_12:
	LDA.w $1957				;$B8910F
	AND.w #$4000				;$B89112
	BEQ.b CODE_B8911A			;$B89115
CODE_B89117:
	JMP.w player_interaction_10		;$B89117

CODE_B8911A:
	LDA.w #$2000				;$B8911A
	TSB.w $1957				;$B8911D
	BEQ.b CODE_B89144			;$B89120
	LDA.w $0777				;$B89122
	AND.w #$0800				;$B89125
	BNE.b CODE_B89144			;$B89128
	LDX.w active_kong_sprite		;$B8912A
	LDA.b $16,x				;$B8912D
	CMP.w $050F				;$B8912F
	BCS.b CODE_B89144			;$B89132
	LDA.b current_animal_type		;$B89134
	CMP.w #!sprite_squawks			;$B89136
	BEQ.b CODE_B89143			;$B89139
	LDA.w #$0018				;$B8913B
	JSR.w CODE_B8C5C7			;$B8913E
	BRA.b CODE_B89117			;$B89141

CODE_B89143:
	RTL					;$B89143

CODE_B89144:
	STZ.w $04AA				;$B89144
	STZ.w $04AE				;$B89147
	JSL.l CODE_B89C4C			;$B8914A
	LDA.w #$001C				;$B8914E
	LDY.w #$0002				;$B89151
	JSL.l enable_timestop			;$B89154
	LDA.w #$0008				;$B89158
	JSR.w CODE_B8C5C7			;$B8915B
	LDX.b current_sprite			;$B8915E
	LDA.b $38,x				;$B89160
	CMP.w #$003C				;$B89162
	BNE.b CODE_B8916A			;$B89165
	BRL CODE_B89235				;$B89167

CODE_B8916A:
	LDA.w current_held_sprite		;$B8916A
	CMP.w follower_kong_sprite		;$B8916D
	BEQ.b CODE_B891B0			;$B89170
	LDA.b current_animal_type		;$B89172
	BNE.b CODE_B891E3			;$B89174
	JSL.l CODE_B89C01			;$B89176
	JSL.l CODE_B8E179			;$B8917A
	JSL.l CODE_B8E198			;$B8917E
	JSR.w CODE_B89243			;$B89182
	LDA.w $17CA				;$B89185
	STA.b $2A,x				;$B89188
	STZ.b $30,x				;$B8918A
	LDA.w $17CC				;$B8918C
	STA.b $2E,x				;$B8918F
	LDA.w $17CE				;$B89191
	BEQ.b CODE_B891A3			;$B89194
	LSR					;$B89196
	EOR.w #$4000				;$B89197
	EOR.b $1E,x				;$B8919A
	AND.w #$4000				;$B8919C
	EOR.b $1E,x				;$B8919F
	STA.b $1E,x				;$B891A1
CODE_B891A3:
	LDA.w #$000C				;$B891A3
	JSL.l set_anim_handle_kiddy		;$B891A6
	LDA.w #$0021				;$B891AA
	STA.b $38,x				;$B891AD
	RTL					;$B891AF

CODE_B891B0:
	JSL.l CODE_B8E179			;$B891B0
	JSL.l CODE_B8E198			;$B891B4
	LDA.w $17CA				;$B891B8
	STA.b $2A,x				;$B891BB
	STZ.b $30,x				;$B891BD
	LDA.w $17CC				;$B891BF
	STA.b $2E,x				;$B891C2
	LDA.w $17CE				;$B891C4
	BEQ.b CODE_B891D6			;$B891C7
	LSR					;$B891C9
	EOR.w #$4000				;$B891CA
	EOR.b $1E,x				;$B891CD
	AND.w #$4000				;$B891CF
	EOR.b $1E,x				;$B891D2
	STA.b $1E,x				;$B891D4
CODE_B891D6:
	LDA.w #$0031				;$B891D6
	JSL.l set_anim_handle_kiddy		;$B891D9
	LDA.w #$0044				;$B891DD
	STA.b $38,x				;$B891E0
	RTL					;$B891E2

CODE_B891E3:
	CMP.w #!sprite_enguarde			;$B891E3
	BEQ.b CODE_B89213			;$B891E6
	JSL.l CODE_B89C01			;$B891E8
	JSL.l CODE_B8E179			;$B891EC
	JSL.l CODE_B8E198			;$B891F0
	LDA.w $17CA				;$B891F4
	STA.b $2A,x				;$B891F7
	STZ.b $30,x				;$B891F9
	LDA.w $17CC				;$B891FB
	STA.b $2E,x				;$B891FE
	LDA.w $17CE				;$B89200
	BEQ.b CODE_B89212			;$B89203
	LSR					;$B89205
	EOR.w #$4000				;$B89206
	EOR.b $1E,x				;$B89209
	AND.w #$4000				;$B8920B
	EOR.b $1E,x				;$B8920E
	STA.b $1E,x				;$B89210
CODE_B89212:
	RTL					;$B89212

CODE_B89213:
	LDA.w $17CA				;$B89213
	STA.b $2A,x				;$B89216
	STA.b $30,x				;$B89218
	LDA.b $2E,x				;$B8921A
	EOR.w #$FFFF				;$B8921C
	INC					;$B8921F
	CMP.w #$8000				;$B89220
	ROR					;$B89223
	STA.b $2E,x				;$B89224
	STZ.b $34,x				;$B89226
	LDA.w #$0031				;$B89228
	STA.b $38,x				;$B8922B
	LDA.w #$0007				;$B8922D
	JSL.l set_anim_handle_animal_and_kiddy	;$B89230
	RTL					;$B89234

CODE_B89235:
	LDA.w #$0100				;$B89235
	BIT.w $17CA				;$B89238
	BPL.b CODE_B89240			;$B8923B
	LDA.w #$FF00				;$B8923D
CODE_B89240:
	STA.b $2A,x				;$B89240
	RTL					;$B89242

CODE_B89243:
	JSL.l CODE_B89C3C			;$B89243
	LDA.b $38,x				;$B89247
	CMP.w #$004D				;$B89249
	BNE.b CODE_B89251			;$B8924C
	JSR.w CODE_B8B946			;$B8924E
CODE_B89251:
	JSL.l CODE_B89C4C			;$B89251
	RTS					;$B89255

player_interaction_0F:
	JSL.l CODE_B89C3C			;$B89256
	LDX.b current_sprite			;$B8925A
	LDA.w #$004C				;$B8925C
	STA.b $38,x				;$B8925F
	STZ.w $1929				;$B89261
	LDA.w #$0014				;$B89264
	STA.w $192B				;$B89267
	RTL					;$B8926A

player_interaction_25:
	LDA.w $075C				;$B8926B
	AND.w #$00FF				;$B8926E
	CMP.w #$0002				;$B89271
	BNE.b CODE_B89279			;$B89274
	JMP.w player_interaction_26		;$B89276

CODE_B89279:
	JSL.l CODE_B89C4C			;$B89279
	JSR.w CODE_B8F285			;$B8927D
	STZ.b $26,x				;$B89280
	STZ.b $24,x				;$B89282
	STZ.b $20,x				;$B89284
	LDA.w #$000D				;$B89286
	STA.b $38,x				;$B89289
	JSR.w CODE_B89422			;$B8928B
	LDA.w #$001F				;$B8928E
	JSL.l set_anim_handle_kiddy		;$B89291
	LDA.w $05AF				;$B89295
	AND.w #$4000				;$B89298
	BEQ.b CODE_B892D2			;$B8929B
	JSL.l CODE_B89C3C			;$B8929D
	LDY.w active_kong_sprite		;$B892A1
	LDA.w $0012,y				;$B892A4
	STA.b $12,x				;$B892A7
	LDA.w $0016,y				;$B892A9
	STA.b $16,x				;$B892AC
	STZ.b $26,x				;$B892AE
	STZ.b $24,x				;$B892B0
	STZ.b $20,x				;$B892B2
	LDA.w $001E,y				;$B892B4
	EOR.b $1E,x				;$B892B7
	AND.w #$4000				;$B892B9
	EOR.w #$4000				;$B892BC
	EOR.b $1E,x				;$B892BF
	STA.b $1E,x				;$B892C1
	LDA.w #$000D				;$B892C3
	STA.b $38,x				;$B892C6
	JSR.w CODE_B89422			;$B892C8
	LDA.w #$001F				;$B892CB
	JSL.l set_anim_handle_kiddy		;$B892CE
CODE_B892D2:
	LDA.w #$0003				;$B892D2
	LDY.w #$00F0				;$B892D5
	JSL.l enable_timestop			;$B892D8
	RTL					;$B892DC

player_interaction_24:
	LDA.w $075C				;$B892DD
	CMP.w #$0002				;$B892E0
	BNE.b CODE_B892E8			;$B892E3
	JMP.w player_interaction_26		;$B892E5

CODE_B892E8:
	LDA.w $17C8				;$B892E8
	CMP.w active_kong_sprite		;$B892EB
	BEQ.b CODE_B892F9			;$B892EE
	LDA.w #$8000				;$B892F0
	TSB.w $1927				;$B892F3
	JMP.w CODE_B89461			;$B892F6

CODE_B892F9:
	LDA.w #$8000				;$B892F9
	TSB.w $1957				;$B892FC
	JMP.w CODE_B89318			;$B892FF

player_interaction_22:
	LDA.w $075C				;$B89302
	CMP.w #$0002				;$B89305
	BNE.b CODE_B8930D			;$B89308
	JMP.w player_interaction_26		;$B8930A

CODE_B8930D:
	LDA.w $17C8				;$B8930D
	CMP.w active_kong_sprite		;$B89310
	BEQ.b CODE_B89318			;$B89313
	JMP.w CODE_B89461			;$B89315

CODE_B89318:
	LDA.w $1B63				;$B89318
	BEQ.b CODE_B89320			;$B8931B
	JMP.w CODE_B89687			;$B8931D

CODE_B89320:
	JSL.l CODE_B89C01			;$B89320
	JSR.w CODE_B8E2DD			;$B89324
	LDA.w #$0020				;$B89327
	TRB.w $05AF				;$B8932A
	JSL.l CODE_B89C4C			;$B8932D
	JSR.w CODE_B8F285			;$B89331
	LDA.b current_animal_type		;$B89334
	BEQ.b CODE_B89342			;$B89336
	LDA.b current_mount			;$B89338
	BEQ.b CODE_B8933F			;$B8933A
	JMP.w CODE_B894A1			;$B8933C

CODE_B8933F:
	JMP.w CODE_B895FA			;$B8933F

CODE_B89342:
	LDA.w #$4000				;$B89342
	TRB.w $05AF				;$B89345
	BNE.b CODE_B89364			;$B89348
	LDA.w #$000D				;$B8934A
	STA.b $38,x				;$B8934D
	JSR.w CODE_B89422			;$B8934F
	LDA.w #$001F				;$B89352
	JSL.l set_anim_handle_kiddy		;$B89355
	LDA.w #$0003				;$B89359
	LDY.w #$01E0				;$B8935C
	JSL.l enable_timestop			;$B8935F
	RTL					;$B89363

CODE_B89364:
	LDA.w #$0007				;$B89364
	LDY.w #$00F0				;$B89367
	JSL.l enable_timestop			;$B8936A
	LDX.w active_kong_sprite		;$B8936E
	LDA.b $12,x				;$B89371
	STA.w $1931				;$B89373
	LDA.b $16,x				;$B89376
	STA.w $1935				;$B89378
	LDA.b $2A,x				;$B8937B
	STA.w $1939				;$B8937D
	STZ.b $2A,x				;$B89380
	STZ.b $30,x				;$B89382
	STZ.b $3A,x				;$B89384
	JSL.l CODE_B8E179			;$B89386
	JSL.l CODE_B8E198			;$B8938A
	LDX.b current_sprite			;$B8938E
	LDA.b $1E,x				;$B89390
	AND.w #$BFFF				;$B89392
	STA.b $1E,x				;$B89395
	LDY.w #$00B8				;$B89397
	LDA.b [$6A],y				;$B8939A
	STA.b $2E,x				;$B8939C
	LDA.w #$0036				;$B8939E
	STA.b $38,x				;$B893A1
	LDA.w #$0021				;$B893A3
	JSL.l set_anim_handle_kiddy		;$B893A6
	JSL.l CODE_B89C3C			;$B893AA
	JSR.w CODE_B8F285			;$B893AE
	LDA.w #$0039				;$B893B1
	STA.b $38,x				;$B893B4
	LDA.w #$002D				;$B893B6
	STA.b $5C,x				;$B893B9
	LDA.w #$0100				;$B893BB
	STA.b $3A,x				;$B893BE
	LDX.w active_kong_sprite		;$B893C0
	LDY.w follower_kong_sprite		;$B893C3
	LDA.b $12,x				;$B893C6
	SEC					;$B893C8
	SBC.w $0012,y				;$B893C9
	PHA					;$B893CC
	LSR					;$B893CD
	EOR.w $001E,y				;$B893CE
	AND.w #$4000				;$B893D1
	EOR.w $001E,y				;$B893D4
	STA.w $001E,y				;$B893D7
	PLA					;$B893DA
	BPL.b CODE_B893E7			;$B893DB
	CMP.w #$FEE0				;$B893DD
	BCS.b CODE_B893F8			;$B893E0
	LDA.w #$FEE0				;$B893E2
	BRA.b CODE_B893EF			;$B893E5

CODE_B893E7:
	CMP.w #$0120				;$B893E7
	BCC.b CODE_B893F8			;$B893EA
	LDA.w #$0120				;$B893EC
CODE_B893EF:
	EOR.w #$FFFF				;$B893EF
	SEC					;$B893F2
	ADC.b $12,x				;$B893F3
	STA.w $0012,y				;$B893F5
CODE_B893F8:
	LDA.w $0016,y				;$B893F8
	SEC					;$B893FB
	SBC.b $16,x				;$B893FC
	BPL.b CODE_B8940A			;$B893FE
	CMP.w #$FF00				;$B89400
	BCS.b CODE_B89418			;$B89403
	LDA.w #$FF00				;$B89405
	BRA.b CODE_B89412			;$B89408

CODE_B8940A:
	CMP.w #$0100				;$B8940A
	BCC.b CODE_B89418			;$B8940D
	LDA.w #$0100				;$B8940F
CODE_B89412:
	CLC					;$B89412
	ADC.b $16,x				;$B89413
	STA.w $0016,y				;$B89415
CODE_B89418:
	LDX.w active_kong_sprite		;$B89418
	LDY.w follower_kong_sprite		;$B8941B
	JSR.w CODE_B8EC88			;$B8941E
	RTL					;$B89421

CODE_B89422:
	JSL.l CODE_B8E198			;$B89422
	LDY.w #$00E8				;$B89426
	LDA.b [$6A],y				;$B89429
	LDY.b current_kong_control_variables	;$B8942B
	STA.w $0008,y				;$B8942D
	LDY.w #$00F0				;$B89430
	LDA.b [$6A],y				;$B89433
	LDX.b current_sprite			;$B89435
	STA.b $2E,x				;$B89437
	LDA.w #$0100				;$B89439
	BIT.b $1E,x				;$B8943C
	BVS.b CODE_B89444			;$B8943E
	EOR.w #$FFFF				;$B89440
	INC					;$B89443
CODE_B89444:
	STA.b $2A,x				;$B89444
	STA.b $30,x				;$B89446
	LDA.w #$0100				;$B89448
	STA.b $3A,x				;$B8944B
	LDA.w $0775				;$B8944D
	AND.w #$0004				;$B89450
	BNE.b CODE_B89460			;$B89453
	LDA.b current_animal_type		;$B89455
	BEQ.b CODE_B89460			;$B89457
	LDA.b $1E,x				;$B89459
	ORA.w #$3000				;$B8945B
	STA.b $1E,x				;$B8945E
CODE_B89460:
	RTS					;$B89460

CODE_B89461:
	LDA.w $075C				;$B89461
	CMP.w #$0002				;$B89464
	BNE.b CODE_B8946C			;$B89467
	JMP.w player_interaction_26		;$B89469

CODE_B8946C:
	LDA.w #$4000				;$B8946C
	TRB.w $05AF				;$B8946F
	JSL.l CODE_B89C3C			;$B89472
	STZ.b $2A,x				;$B89476
	STZ.b $30,x				;$B89478
	STZ.b $3A,x				;$B8947A
	JSL.l CODE_B8E179			;$B8947C
	JSL.l CODE_B8E198			;$B89480
	LDX.b current_sprite			;$B89484
	LDA.b $1E,x				;$B89486
	AND.w #$BFFF				;$B89488
	STA.b $1E,x				;$B8948B
	LDY.w #$00B8				;$B8948D
	LDA.b [$6A],y				;$B89490
	STA.b $2E,x				;$B89492
	LDA.w #$0036				;$B89494
	STA.b $38,x				;$B89497
	LDA.w #$0021				;$B89499
	JSL.l set_anim_handle_kiddy		;$B8949C
	RTL					;$B894A0

CODE_B894A1:
	LDA.b current_animal_type		;$B894A1
	CMP.w #!sprite_squawks			;$B894A3
	BNE.b CODE_B894AB			;$B894A6
	JMP.w CODE_B8952E			;$B894A8

CODE_B894AB:
	LDA.w #$0080				;$B894AB
	LDY.w #$0014				;$B894AE
	JSL.l enable_timestop			;$B894B1
	LDA.w #$003C				;$B894B5
	STA.w $1899				;$B894B8
	JSR.w CODE_B8C5A0			;$B894BB
	LDX.b current_mount			;$B894BE
	LDY.w active_kong_sprite		;$B894C0
	LDA.w $0016,y				;$B894C3
	SEC					;$B894C6
	SBC.w #$0010				;$B894C7
	STA.b $16,x				;$B894CA
	JSL.l CODE_B9E021			;$B894CC
	JSR.w CODE_B88721			;$B894D0
	LDX.b current_mount			;$B894D3
	STX.b current_sprite			;$B894D5
	LDA.w #$00D0				;$B894D7
	JSR.w CODE_B8829F			;$B894DA
	LDA.w #$0003				;$B894DD
	STA.b $38,x				;$B894E0
	LDY.w #$0008				;$B894E2
	JSR.w CODE_B89C2C			;$B894E5
	INC					;$B894E8
	JSL.l set_sprite_animation		;$B894E9
	STZ.b $34,x				;$B894ED
	STZ.b $2E,x				;$B894EF
	LDA.w #$004A				;$B894F1
	STA.b $5A,x				;$B894F4
	JSL.l CODE_B89C4C			;$B894F6
	LDX.b current_mount			;$B894FA
	LDY.w #$000A				;$B894FC
	JSR.w CODE_B89C2C			;$B894FF
	LDX.b current_sprite			;$B89502
	STA.b $2E,x				;$B89504
	STZ.b $2A,x				;$B89506
	STZ.b $30,x				;$B89508
	JSL.l CODE_B8E15A			;$B8950A
	JSL.l CODE_B8E198			;$B8950E
	LDY current_kong_control_variables	;$B89512
	LDA.b active_frame_counter		;$B89514
	STA.w $0012,y				;$B89516
	LDA.w #$0009				;$B89519
	JSL.l set_anim_handle_kiddy		;$B8951C
	LDA.w #$0002				;$B89520
	STA.b $38,x				;$B89523
	STZ.b current_animal_type		;$B89525
	STZ.b current_mount			;$B89527
	JSL.l CODE_B7D7FB			;$B89529
	RTL					;$B8952D

CODE_B8952E:
	LDA.w #$4000				;$B8952E
	TRB.w $05AF				;$B89531
	BNE.b CODE_B89585			;$B89534
	LDA.w #$0003				;$B89536
	LDY.w #$00F0				;$B89539
	JSL.l enable_timestop			;$B8953C
	LDA.w #$0012				;$B89540
	JSL.l CODE_BFF006			;$B89543
	JSR.w CODE_B88721			;$B89547
	LDX.b current_mount			;$B8954A
	STX.b current_sprite			;$B8954C
	LDA.w #$00D0				;$B8954E
	JSR.w CODE_B8829F			;$B89551
	LDA.w #$0002				;$B89554
	STA.b $38,x				;$B89557
	LDY.w #$0008				;$B89559
	JSR.w CODE_B89C2C			;$B8955C
	JSL.l set_sprite_animation		;$B8955F
	STZ.b $30,x				;$B89563
	STZ.b $2A,x				;$B89565
	STZ.b $5A,x				;$B89567
	JSL.l CODE_B89C4C			;$B89569
	LDA.w #$005E				;$B8956D
	STA.b $38,x				;$B89570
	STZ.b $2A,x				;$B89572
	STZ.b $30,x				;$B89574
	JSR.w CODE_B895E0			;$B89576
	LDA.w #$001F				;$B89579
	JSL.l set_anim_handle_kiddy		;$B8957C
	STZ.b current_animal_type		;$B89580
	STZ.b current_mount			;$B89582
	RTL					;$B89584

CODE_B89585:
	LDA.w #$0080				;$B89585
	LDY.w #$0014				;$B89588
	JSL.l enable_timestop			;$B8958B
	LDA.w #$0012				;$B8958F
	JSL.l CODE_BFF006			;$B89592
	JSR.w CODE_B88721			;$B89596
	JSL.l CODE_B89C5C			;$B89599
	JSL.l CODE_BB85FD			;$B8959D
	JSL.l CODE_B89C3C			;$B895A1
	LDA.w #$005E				;$B895A5
	STA.b $38,x				;$B895A8
	STZ.b $2A,x				;$B895AA
	STZ.b $30,x				;$B895AC
	JSR.w CODE_B895E0			;$B895AE
	LDA.w #$0023				;$B895B1
	JSL.l set_anim_handle_kiddy		;$B895B4
	LDA.w #$0000				;$B895B8
	JSL.l set_riding_kong_anim_handle_kiddy	;$B895BB
	JSL.l CODE_B89C4C			;$B895BF
	JSL.l CODE_B88557			;$B895C3
	JSR.w CODE_B8C5A0			;$B895C7
	LDA.w current_game_mode			;$B895CA
	CMP.w #!gamemode_2_player_team		;$B895CD
	BNE.b CODE_B895DF			;$B895D0
	LDX.w active_kong_sprite		;$B895D2
	LDA.b $38,x				;$B895D5
	STA.w $189D				;$B895D7
	LDA.w #$005B				;$B895DA
	STA.b $38,x				;$B895DD
CODE_B895DF:
	RTL					;$B895DF

CODE_B895E0:
	LDX current_kong_control_variables	;$B895E0
	LDY.w #$00E8				;$B895E2
	LDA.b [$6A],y				;$B895E5
	STA.b $08,x				;$B895E7
	LDY.w #$0008				;$B895E9
	LDA.b [$6A],y				;$B895EC
	STA.b $0A,x				;$B895EE
	LDY.w #$00F0				;$B895F0
	LDA.b [$6A],y				;$B895F3
	LDX.b current_sprite			;$B895F5
	STA.b $2E,x				;$B895F7
	RTS					;$B895F9

CODE_B895FA:
	LDA.w #$4000				;$B895FA
	TRB.w $05AF				;$B895FD
	BEQ.b CODE_B8965E			;$B89600
	LDA.w #$001F				;$B89602
	LDY.w #$0014				;$B89605
	JSL.l enable_timestop			;$B89608
	LDX.w active_kong_sprite		;$B8960C
	LDY.w follower_kong_sprite		;$B8960F
	LDA.w #$002F				;$B89612
	STA.b $1A				;$B89615
CODE_B89617:
	LDA.b $0E,x				;$B89617
	PHA					;$B89619
	LDA.w $000E,y				;$B8961A
	STA.b $0E,x				;$B8961D
	PLA					;$B8961F
	STA.w $000E,y				;$B89620
	INY					;$B89623
	INY					;$B89624
	INX					;$B89625
	INX					;$B89626
	DEC.b $1A				;$B89627
	BPL.b CODE_B89617			;$B89629
	JSL.l CODE_B89C5C			;$B8962B
	JSL.l CODE_B89C4C			;$B8962F
	LDA.w #$0008				;$B89633
	JSL.l set_anim_handle_animal_and_kiddy	;$B89636
	JSR.w CODE_B8C5A0			;$B8963A
	LDA.w #$0100				;$B8963D
	STA.b $3A,x				;$B89640
	LDA.w current_game_mode			;$B89642
	CMP.w #!gamemode_2_player_team		;$B89645
	BNE.b CODE_B8965D			;$B89648
	LDX.w active_kong_sprite		;$B8964A
	LDA.b $38,x				;$B8964D
	STA.w $189D				;$B8964F
	LDA.w #$005B				;$B89652
	STA.b $38,x				;$B89655
	LDA.w #$0018				;$B89657
	TRB.w timestop_flags			;$B8965A
CODE_B8965D:
	RTL					;$B8965D

CODE_B8965E:
	LDX.b current_sprite			;$B8965E
	STZ.b $28,x				;$B89660
	LDA.w #$0032				;$B89662
	STA.b $38,x				;$B89665
	LDA.w #$0009				;$B89667
	JSL.l set_anim_handle_animal_and_kiddy	;$B8966A
	LDA.w #$0003				;$B8966E
	LDY.w #$00F0				;$B89671
	JSL.l enable_timestop			;$B89674
	JSR.w CODE_B89422			;$B89678
	RTL					;$B8967B

player_interaction_23:
	LDA.w $075C				;$B8967C
	CMP.w #$0002				;$B8967F
	BNE.b CODE_B89687			;$B89682
	JMP.w player_interaction_26		;$B89684

CODE_B89687:
	LDY.w $1B63				;$B89687
	BEQ.b CODE_B89695			;$B8968A
	LDA.w $0046,y				;$B8968C
	ORA.w #$0008				;$B8968F
	STA.w $0046,y				;$B89692
CODE_B89695:
	LDA.w #$4000				;$B89695
	TRB.w $05AF				;$B89698
	BNE.b CODE_B896B4			;$B8969B
	JSL.l CODE_B89C4C			;$B8969D
	LDA.w #$000D				;$B896A1
	STA.b $38,x				;$B896A4
	JSR.w CODE_B89422			;$B896A6
	LDA.w #$001F				;$B896A9
	JSL.l set_anim_handle_kiddy		;$B896AC
	STZ.w $1B63				;$B896B0
	RTL					;$B896B3

CODE_B896B4:
	JSL.l CODE_B89C5C			;$B896B4
	JSL.l CODE_B89C3C			;$B896B8
	STZ.b $2A,x				;$B896BC
	STZ.b $30,x				;$B896BE
	STZ.b $3A,x				;$B896C0
	JSL.l CODE_B8E179			;$B896C2
	JSL.l CODE_B8E198			;$B896C6
	LDX.b current_sprite			;$B896CA
	LDA.b $1E,x				;$B896CC
	AND.w #$BFFF				;$B896CE
	STA.b $1E,x				;$B896D1
	LDY.w #$00B8				;$B896D3
	LDA.b [$6A],y				;$B896D6
	STA.b $2E,x				;$B896D8
	LDA.w #$0036				;$B896DA
	STA.b $38,x				;$B896DD
	LDA.w #$0021				;$B896DF
	JSL.l set_anim_handle_kiddy		;$B896E2
	JSL.l CODE_B89C4C			;$B896E6
	LDA.w #$003B				;$B896EA
	JSL.l set_anim_handle_kiddy		;$B896ED
	LDA.w #$0058				;$B896F1
	LDY.w current_game_mode			;$B896F4
	CPY.w #!gamemode_2_player_team		;$B896F7
	BNE.b CODE_B89702			;$B896FA
	STA.w $189D				;$B896FC
	LDA.w #$005B				;$B896FF
CODE_B89702:
	STA.b $38,x				;$B89702
	STZ.b $2A,x				;$B89704
	LDA.w #$0100				;$B89706
	STA.b $2E,x				;$B89709
	LDY.w $1B63				;$B8970B
	LDA.w $0016,y				;$B8970E
	DEC					;$B89711
	STA.b $16,x				;$B89712
	JSR.w CODE_B8C5A0			;$B89714
	LDA.b $26,x				;$B89717
	ORA.w #$C000				;$B89719
	STA.b $26,x				;$B8971C
	JSL.l CODE_BB85FD			;$B8971E
	LDA.w #$0007				;$B89722
	LDY.w #$002D				;$B89725
	JSL.l enable_timestop			;$B89728
	RTL					;$B8972C

player_interaction_00:
	JSR.w CODE_B8DD20			;$B8972D
	BCS.b CODE_B8979B			;$B89730
	LDA.w #$0007				;$B89732
	LDY.w #$00F0				;$B89735
	JSL.l enable_timestop			;$B89738
	LDA.w follower_kong_sprite		;$B8973C
	STA.w current_held_sprite		;$B8973F
	STZ.w $186D				;$B89742
	STZ.w $186F				;$B89745
	LDA.w #$0001				;$B89748
	STA.w $1871				;$B8974B
	JSL.l CODE_B89C4C			;$B8974E
	LDA.w #$003D				;$B89752
	STA.b $38,x				;$B89755
	STZ.b $2A,x				;$B89757
	STZ.b $30,x				;$B89759
	LDA.w $0006,y				;$B8975B
	AND.w #$FFFB				;$B8975E
	STA.w $0006,y				;$B89761
	LDA.w #$002A				;$B89764
	JSL.l set_anim_handle_kiddy		;$B89767
	JSL.l CODE_B89C3C			;$B8976B
	LDA.w #$003E				;$B8976F
	STA.b $38,x				;$B89772
	LDA.w #$FFE6				;$B89774
	CPX.w $0503				;$B89777
	BEQ.b CODE_B8977F			;$B8977A
	LDA.w #$FFE0				;$B8977C
CODE_B8977F:
	STA.l $000032				;$B8977F
	LDA.w #$001F				;$B89783
	LDX.w #$0037				;$B89786
	LDY.w #$0000				;$B89789
	JSL.l CODE_B8F02A			;$B8978C
	LDX.b current_sprite			;$B89790
	STZ.b $3A,x				;$B89792
	LDA.w #$0037				;$B89794
	JSL.l set_anim_handle_kiddy		;$B89797
CODE_B8979B:
	RTL					;$B8979B

player_interaction_02:
	LDA.w #$0011				;$B8979C
	JSR.w CODE_B8E24E			;$B8979F
	BNE.b CODE_B897F0			;$B897A2
	LDA.w current_held_sprite		;$B897A4
	BNE.b CODE_B897F5			;$B897A7
	LDA.w follower_kong_sprite		;$B897A9
	STA.w current_held_sprite		;$B897AC
	STZ.w $186D				;$B897AF
	STZ.w $186F				;$B897B2
	LDA.w #$0001				;$B897B5
	STA.w $1871				;$B897B8
	JSL.l CODE_B89C4C			;$B897BB
	LDA.w #$0043				;$B897BF
	STA.b $38,x				;$B897C2
	LDA.w $0006,y				;$B897C4
	AND.w #$FFFB				;$B897C7
	STA.w $0006,y				;$B897CA
	LDA.w #$0031				;$B897CD
	JSL.l set_anim_handle_kiddy		;$B897D0
	JSL.l CODE_B8E198			;$B897D4
	JSL.l CODE_B8E15A			;$B897D8
	JSL.l CODE_B89C3C			;$B897DC
	LDA.w #$0040				;$B897E0
	STA.b $38,x				;$B897E3
	STZ.b $3A,x				;$B897E5
	JSL.l disable_timestop			;$B897E7
	JSL.l CODE_B8EFE7			;$B897EB
	RTL					;$B897EF

CODE_B897F0:
	AND.w #$0001				;$B897F0
	BNE.b CODE_B89811			;$B897F3
CODE_B897F5:
	JSL.l CODE_B89C3C			;$B897F5
	LDA.w #$0033				;$B897F9
	STA.b $38,x				;$B897FC
	LDA.w #$0004				;$B897FE
	LDX.w #$0002				;$B89801
	LDY.w #$0000				;$B89804
	JSL.l CODE_B8F028			;$B89807
	LDA.w #$0010				;$B8980B
	TRB.w $1927				;$B8980E
CODE_B89811:
	RTL					;$B89811

player_interaction_01:
	LDA.w #$0011				;$B89812
	JSR.w CODE_B8E24E			;$B89815
	BNE.b CODE_B89859			;$B89818
	LDA.w current_held_sprite		;$B8981A
	BNE.b CODE_B89859			;$B8981D
	LDA.w follower_kong_sprite		;$B8981F
	STA.w current_held_sprite		;$B89822
	STZ.w $186D				;$B89825
	STZ.w $186F				;$B89828
	LDA.w #$0001				;$B8982B
	STA.w $1871				;$B8982E
	JSL.l CODE_B89C4C			;$B89831
	LDA.w #$0043				;$B89835
	STA.b $38,x				;$B89838
	LDA.w $0006,y				;$B8983A
	AND.w #$FFFB				;$B8983D
	STA.w $0006,y				;$B89840
	LDA.w #$0031				;$B89843
	JSL.l set_anim_handle_kiddy		;$B89846
	JSL.l CODE_B89C3C			;$B8984A
	STZ.b $3A,x				;$B8984E
	LDA.w #$0040				;$B89850
	STA.b $38,x				;$B89853
	JSL.l CODE_B8EFE7			;$B89855
CODE_B89859:
	RTL					;$B89859

player_interaction_03:
	LDA.w #$0001				;$B8985A
	JSR.w CODE_B8E24E			;$B8985D
	BNE.b CODE_B898AA			;$B89860
	STZ.w current_held_sprite		;$B89862
	JSL.l CODE_B89C4C			;$B89865
	LDA.w #$0041				;$B89869
	STA.b $38,x				;$B8986C
	LDA.w #$002E				;$B8986E
	JSL.l set_anim_handle_kiddy		;$B89871
	JSL.l CODE_B89C3C			;$B89875
	JSL.l CODE_B8E1EF			;$B89879
	JSL.l CODE_B8E1E4			;$B8987D
	STZ.b $2A,x				;$B89881
	STZ.b $30,x				;$B89883
	LDA.w #$FB00				;$B89885
	STA.b $2E,x				;$B89888
	LDA.w #$FFF0				;$B8988A
	CPX.w $0503				;$B8988D
	BEQ.b CODE_B89895			;$B89890
	LDA.w #$FFE8				;$B89892
CODE_B89895:
	LDY.w active_kong_sprite		;$B89895
	CLC					;$B89898
	ADC.w $0016,y				;$B89899
	STA.b $16,x				;$B8989C
	LDA.w #$0042				;$B8989E
	STA.b $38,x				;$B898A1
	LDA.w #$0037				;$B898A3
	JSL.l set_anim_handle_kiddy		;$B898A6
CODE_B898AA:
	RTL					;$B898AA

CODE_B898AB:
	LDX.w follower_kong_sprite		;$B898AB
	CPX.w current_held_sprite		;$B898AE
	BEQ.b CODE_B898C5			;$B898B1
	LDA.b $38,x				;$B898B3
	ASL					;$B898B5
	ASL					;$B898B6
	TAX					;$B898B7
	LDA.l kong_state_flags,x		;$B898B8
	AND.w #$0180				;$B898BC
	BNE.b CODE_B898C5			;$B898BF
	LDX.w active_kong_sprite		;$B898C1
	RTS					;$B898C4

CODE_B898C5:
	STZ.w current_held_sprite		;$B898C5
	LDX.w follower_kong_sprite		;$B898C8
	LDA.w #$0033				;$B898CB
	STA.b $38,x				;$B898CE
	LDA.w #$00D8				;$B898D0
	JSR.w CODE_B8829F			;$B898D3
	LDA.w #$001F				;$B898D6
	LDX.w #$0037				;$B898D9
	LDY.w #$0000				;$B898DC
	JSL.l CODE_B8F028			;$B898DF
	LDX.w active_kong_sprite		;$B898E3
	LDA.w #$00E4				;$B898E6
	JSR.w CODE_B8829F			;$B898E9
	RTS					;$B898EC

player_interaction_17:
	JSR.w CODE_B898AB			;$B898ED
	LDX.w $17CC				;$B898F0
	JSL.l CODE_B89C37			;$B898F3
	JSL.l CODE_B89C01			;$B898F7
	STZ.w $04AA				;$B898FB
	STZ.w $04AE				;$B898FE
	LDX.b current_sprite			;$B89901
	LDA.w $17CA				;$B89903
	STA.b $5C,x				;$B89906
	LDA.w #$003B				;$B89908
	JSL.l set_anim_handle_kiddy		;$B8990B
	LDX.b current_sprite			;$B8990F
	CPX.w active_kong_sprite		;$B89911
	BEQ.b CODE_B8993E			;$B89914
	LDA.w #$0059				;$B89916
	STA.b $38,x				;$B89919
	LDA.b $3A,x				;$B8991B
	AND.w #$0010				;$B8991D
	BEQ.b CODE_B8993D			;$B89920
	JSL.l CODE_B89C4C			;$B89922
	LDX.b current_sprite			;$B89926
	LDA.w #$004E				;$B89928
	STA.b $38,x				;$B8992B
	LDA.w #$0037				;$B8992D
	JSL.l set_anim_handle_kiddy		;$B89930
	STZ.w $1929				;$B89934
	LDA.w #$0020				;$B89937
	STA.w $192B				;$B8993A
CODE_B8993D:
	RTL					;$B8993D

CODE_B8993E:
	LDA.w #$0058				;$B8993E
	STA.b $38,x				;$B89941
	LDA.w $05AF				;$B89943
	AND.w #$4000				;$B89946
	BEQ.b CODE_B8995E			;$B89949
	JSL.l CODE_B89C3C			;$B8994B
	LDA.b $38,x				;$B8994F
	CMP.w #$0059				;$B89951
	BEQ.b CODE_B8995E			;$B89954
	LDA.w #$0000				;$B89956
	STA.b $3A,x				;$B89959
	JSR.w CODE_B8B946			;$B8995B
CODE_B8995E:
	RTL					;$B8995E

player_interaction_15:
	JSL.l CODE_B89C4C			;$B8995F
	JSL.l CODE_B89C01			;$B89963
	LDX.b current_sprite			;$B89967
	LDA.w #$0060				;$B89969
	STA.b $38,x				;$B8996C
	LDA.w #$0055				;$B8996E
	JSL.l set_anim_handle_kiddy		;$B89971
	LDX.b current_sprite			;$B89975
	LDY.w #$0288				;$B89977
	LDA.b [$6A],y				;$B8997A
	STA.b $2E,x				;$B8997C
	STZ.b $2A,x				;$B8997E
	STZ.b $30,x				;$B89980
	LDA.w #$000A				;$B89982
	STA.b $5C,x				;$B89985
	LDA.w $17CA				;$B89987
	STA.b $5E,x				;$B8998A
	STZ.b $5A,x				;$B8998C
	LDA.w #$0014				;$B8998E
	JSR.w CODE_B8C5C7			;$B89991
	RTL					;$B89994

player_interaction_16:
	JSL.l CODE_B89C4C			;$B89995
	LDA.w #$0056				;$B89999
	JSL.l set_anim_handle_kiddy		;$B8999C
	LDA.w #$8000				;$B899A0
	STA.w $04A6				;$B899A3
	STA.w $04A8				;$B899A6
	STZ.w $04AA				;$B899A9
	LDA.w #$4000				;$B899AC
	TSB.w $1957				;$B899AF
	RTL					;$B899B2

player_interaction_05:
	LDA.w #$0002				;$B899B3
	BIT.w $05B1				;$B899B6
	BNE.b CODE_B89A12			;$B899B9
	LDX.w follower_kong_sprite		;$B899BB
	LDA.b $16,x				;$B899BE
	CMP.w $050F				;$B899C0
	BCC.b CODE_B89A12			;$B899C3
	LDA.w #$0020				;$B899C5
	STA.w $1929				;$B899C8
	JSL.l CODE_B89C4C			;$B899CB
	LDY.w follower_kong_sprite		;$B899CF
	JSR.w CODE_B89A13			;$B899D2
	LDA.b $12,x				;$B899D5
	STA.w $1931				;$B899D7
	LDA.b $16,x				;$B899DA
	STA.w $1935				;$B899DC
	LDA.w #$006E				;$B899DF
	STA.b $38,x				;$B899E2
	LDA.w #$0028				;$B899E4
	JSL.l set_anim_handle_kiddy		;$B899E7
	JSL.l CODE_B89C3C			;$B899EB
	LDY.w active_kong_sprite		;$B899EF
	JSR.w CODE_B89A13			;$B899F2
	LDA.w #$006F				;$B899F5
	STA.b $38,x				;$B899F8
	LDA.w #$0028				;$B899FA
	JSL.l set_anim_handle_kiddy		;$B899FD
	LDA.w #$0707				;$B89A01
	JSL.l CODE_B28018			;$B89A04
	LDA.w #$0007				;$B89A08
	LDY.w #$0078				;$B89A0B
	JSL.l enable_timestop			;$B89A0E
CODE_B89A12:
	RTL					;$B89A12

CODE_B89A13:
	LDA.w $0012,y				;$B89A13
	SEC					;$B89A16
	SBC.b $12,x				;$B89A17
	ASL					;$B89A19
	ASL					;$B89A1A
	ASL					;$B89A1B
	STA.b $2A,x				;$B89A1C
	STZ.b $30,x				;$B89A1E
	LDA.w $0016,y				;$B89A20
	SEC					;$B89A23
	SBC.b $16,x				;$B89A24
	ASL					;$B89A26
	ASL					;$B89A27
	ASL					;$B89A28
	STA.b $2E,x				;$B89A29
	RTS					;$B89A2B

player_interaction_04:
	LDX.w active_kong_sprite		;$B89A2C
	LDY.w follower_kong_sprite		;$B89A2F
	LDA.b $12,x				;$B89A32
	STA.b $88				;$B89A34
	LDA.b $16,x				;$B89A36
	STA.b $8A				;$B89A38
	CPY.w $0503				;$B89A3A
	BEQ.b CODE_B89A65			;$B89A3D
	LDA.w $0012,y				;$B89A3F
	CMP.b $12,x				;$B89A42
	LDA.w #$0024				;$B89A44
	BCS.b CODE_B89A4C			;$B89A47
	LDA.w #$FFDC				;$B89A49
CODE_B89A4C:
	STA.b $5E				;$B89A4C
	JSR.w CODE_B89B7B			;$B89A4E
	BCS.b CODE_B89A64			;$B89A51
	LDX.w active_kong_sprite		;$B89A53
	LDA.b $16,x				;$B89A56
	SEC					;$B89A58
	SBC.b $8A				;$B89A59
	CLC					;$B89A5B
	ADC.w #$0010				;$B89A5C
	CMP.w #$0020				;$B89A5F
	BCC.b CODE_B89AAC			;$B89A62
CODE_B89A64:
	RTL					;$B89A64

CODE_B89A65:
	LDA.w $0012,y				;$B89A65
	CMP.b $12,x				;$B89A68
	LDA.w #$001C				;$B89A6A
	BCS.b CODE_B89A72			;$B89A6D
	LDA.w #$FFE4				;$B89A6F
CODE_B89A72:
	STA.b $5E				;$B89A72
	JSR.w CODE_B89B7B			;$B89A74
	BCS.b CODE_B89AA3			;$B89A77
	LDA.b $88				;$B89A79
	STA.b $3A				;$B89A7B
	LDA.b $8A				;$B89A7D
	STA.b $3C				;$B89A7F
	LDA.w #$000D				;$B89A81
	BIT.b $60				;$B89A84
	BPL.b CODE_B89A8B			;$B89A86
	LDA.w #$FFF3				;$B89A88
CODE_B89A8B:
	STA.b $5E				;$B89A8B
	JSR.w CODE_B89B7B			;$B89A8D
	BCS.b CODE_B89AA3			;$B89A90
	LDX.w active_kong_sprite		;$B89A92
	LDA.b $16,x				;$B89A95
	SEC					;$B89A97
	SBC.b $3C				;$B89A98
	CLC					;$B89A9A
	ADC.w #$0010				;$B89A9B
	CMP.w #$0020				;$B89A9E
	BCC.b CODE_B89AA4			;$B89AA1
CODE_B89AA3:
	RTL					;$B89AA3

CODE_B89AA4:
	LDA.b $3A				;$B89AA4
	STA.b $88				;$B89AA6
	LDA.b $3C				;$B89AA8
	STA.b $8A				;$B89AAA
CODE_B89AAC:
	LDX.w follower_kong_sprite		;$B89AAC
	LDA.b $88				;$B89AAF
	STA.w $1933				;$B89AB1
	STA.b $12,x				;$B89AB4
	LDA.b $8A				;$B89AB6
	STA.w $1937				;$B89AB8
	STA.b $16,x				;$B89ABB
	STZ.b $26,x				;$B89ABD
	LDX.w active_kong_sprite		;$B89ABF
	LDY.w $04FB				;$B89AC2
	LDA.b $12,x				;$B89AC5
	STA.w $1931				;$B89AC7
	LDA.b $16,x				;$B89ACA
	STA.w $1935				;$B89ACC
	STZ.b $26,x				;$B89ACF
	STZ.b $14,x				;$B89AD1
	LDA.w $0016,y				;$B89AD3
	PHA					;$B89AD6
	JSL.l CODE_B89C5C			;$B89AD7
	PLA					;$B89ADB
	LDY.w $04FB				;$B89ADC
	STA.w $0016,y				;$B89ADF
	LDX.w active_kong_sprite		;$B89AE2
	LDY.w follower_kong_sprite		;$B89AE5
	LDA.w $0012,y				;$B89AE8
	SEC					;$B89AEB
	SBC.b $12,x				;$B89AEC
	LSR					;$B89AEE
	EOR.b $1E,x				;$B89AEF
	AND.w #$4000				;$B89AF1
	EOR.b $1E,x				;$B89AF4
	STA.b $1E,x				;$B89AF6
	LDA.w $0018,y				;$B89AF8
	STA.b $18,x				;$B89AFB
	LDA.w $001A,y				;$B89AFD
	STA.b $1A,x				;$B89B00
	LDA.w $1931				;$B89B02
	SEC					;$B89B05
	SBC.w $1933				;$B89B06
	BIT.b $1E,x				;$B89B09
	BVC.b CODE_B89B11			;$B89B0B
	EOR.w #$FFFF				;$B89B0D
	INC					;$B89B10
CODE_B89B11:
	STA.w $186D				;$B89B11
	LDA.w $1935				;$B89B14
	SEC					;$B89B17
	SBC.w $1937				;$B89B18
	STA.w $186F				;$B89B1B
	LDA.w #$FFFF				;$B89B1E
	STA.w $1871				;$B89B21
	LDA.w follower_kong_sprite		;$B89B24
	STA.w current_held_sprite		;$B89B27
	JSL.l CODE_B89C3C			;$B89B2A
	LDA.w #$0062				;$B89B2E
	STA.b $38,x				;$B89B31
	LDA.w #$0000				;$B89B33
	CPX.w $0503				;$B89B36
	BNE.b CODE_B89B3E			;$B89B39
	LDA.w #$0003				;$B89B3B
CODE_B89B3E:
	STA.b $5A,x				;$B89B3E
	STZ.b $2A,x				;$B89B40
	STZ.b $30,x				;$B89B42
	STZ.b $2E,x				;$B89B44
	LDA.w #$003E				;$B89B46
	JSL.l set_anim_handle_kiddy		;$B89B49
	JSL.l CODE_B89C4C			;$B89B4D
	LDA.w #$0061				;$B89B51
	STA.b $38,x				;$B89B54
	STZ.b $5A,x				;$B89B56
	STZ.b $2A,x				;$B89B58
	STZ.b $30,x				;$B89B5A
	STZ.b $2E,x				;$B89B5C
	LDA.w #$003C				;$B89B5E
	JSL.l set_anim_handle_kiddy		;$B89B61
	JSL.l CODE_BB85FD			;$B89B65
	LDA.w #$0707				;$B89B69
	JSL.l CODE_B28018			;$B89B6C
	LDA.w #$0007				;$B89B70
	LDY.w #$0078				;$B89B73
	JSL.l enable_timestop			;$B89B76
	RTL					;$B89B7A

CODE_B89B7B:
	LDA.b $5E				;$B89B7B
	BPL.b CODE_B89B8C			;$B89B7D
	EOR.w #$FFFF				;$B89B7F
	INC					;$B89B82
	STA.b $5E				;$B89B83
	LDA.w #$FFFF				;$B89B85
	STA.b $60				;$B89B88
	BRA.b CODE_B89B91			;$B89B8A

CODE_B89B8C:
	LDA.w #$0001				;$B89B8C
	STA.b $60				;$B89B8F
CODE_B89B91:
	LDA.b $8A				;$B89B91
	STA.b $1C				;$B89B93
	LDA.b $88				;$B89B95
	CLC					;$B89B97
	ADC.b $60				;$B89B98
	STA.b $88				;$B89B9A
	JSL.l CODE_B8C94F			;$B89B9C
	CMP.w #$0000				;$B89BA0
	BMI.b CODE_B89BC1			;$B89BA3
	EOR.w #$FFFF				;$B89BA5
	SEC					;$B89BA8
	ADC.w #$6300				;$B89BA9
	TAY					;$B89BAC
	SEC					;$B89BAD
	SBC.b $8A				;$B89BAE
	CLC					;$B89BB0
	ADC.w #$0008				;$B89BB1
	CMP.w #$0010				;$B89BB4
	BCS.b CODE_B89BC1			;$B89BB7
	STY.b $8A				;$B89BB9
	DEC.b $5E				;$B89BBB
	BNE.b CODE_B89B91			;$B89BBD
	CLC					;$B89BBF
	RTS					;$B89BC0

CODE_B89BC1:
	SEC					;$B89BC1
	RTS					;$B89BC2

player_interaction_29:
	LDA.w $05B1				;$B89BC3
	AND.w #$0004				;$B89BC6
	BNE.b CODE_B89BE6			;$B89BC9
	JSR.w CODE_B898AB			;$B89BCB
	JSL.l CODE_B89C01			;$B89BCE
	JSL.l CODE_B89C4C			;$B89BD2
	LDA.w #$0070				;$B89BD6
	STA.b $38,x				;$B89BD9
	LDA.w parent_level_number		;$B89BDB
	SEC					;$B89BDE
	SBC.w #$001D				;$B89BDF
	JSR.w CODE_B8F39B			;$B89BE2
	RTL					;$B89BE5

CODE_B89BE6:
	JSR.w CODE_B883E9			;$B89BE6
	RTL					;$B89BE9

player_interaction_28:
	JSR.w CODE_B898AB			;$B89BEA
	JSL.l CODE_B89C01			;$B89BED
	JSL.l CODE_B89C4C			;$B89BF1
	LDA.w #$0070				;$B89BF5
	STA.b $38,x				;$B89BF8
	LDA.w $17CA				;$B89BFA
	JSR.w CODE_B8F39B			;$B89BFD
	RTL					;$B89C00

CODE_B89C01:
	LDA.w current_held_sprite		;$B89C01
	BNE.b CODE_B89C08			;$B89C04
	CLC					;$B89C06
	RTL					;$B89C07

CODE_B89C08:
	PHX					;$B89C08
	TAX					;$B89C09
	LDA.w #$0002				;$B89C0A
	STA.b $3C,x				;$B89C0D
	LDA.w #$0100				;$B89C0F
	BIT.b $1E,x				;$B89C12
	BVC.b CODE_B89C1A			;$B89C14
	EOR.w #$FFFF				;$B89C16
	INC					;$B89C19
CODE_B89C1A:
	STA.b $2A,x				;$B89C1A
	STA.b $30,x				;$B89C1C
	LDA.w #$0400				;$B89C1E
	STA.b $2E,x				;$B89C21
	JSL.l CODE_B9E021			;$B89C23
	STZ.w current_held_sprite		;$B89C27
	PLX					;$B89C2A
	RTL					;$B89C2B

CODE_B89C2C:
	LDA.b $06,x				;$B89C2C
	STA.b $42				;$B89C2E
	LDA.b $6C				;$B89C30
	STA.b $44				;$B89C32
	LDA.b [$42],y				;$B89C34
	RTS					;$B89C36

CODE_B89C37:
	CPX.w active_kong_sprite		;$B89C37
	BEQ.b CODE_B89C4C			;$B89C3A
CODE_B89C3C:
	LDA.w $04FF				;$B89C3C
	STA.b current_kong_control_variables	;$B89C3F
	TAY					;$B89C41
	LDX.w follower_kong_sprite		;$B89C42
	STX.b current_sprite			;$B89C45
	LDA.b $06,x				;$B89C47
	STA.b $6A				;$B89C49
	RTL					;$B89C4B

CODE_B89C4C:
	LDA.w $04FB				;$B89C4C
	STA.b current_kong_control_variables	;$B89C4F
	TAY					;$B89C51
	LDX.w active_kong_sprite		;$B89C52
	STX.b current_sprite			;$B89C55
	LDA.b $06,x				;$B89C57
	STA.b $6A				;$B89C59
	RTL					;$B89C5B

CODE_B89C5C:
	LDA.w current_kong			;$B89C5C
	EOR.w #$0001				;$B89C5F
CODE_B89C62:
	STA.w current_kong			;$B89C62
	INC					;$B89C65
	STA.w $05B3				;$B89C66
	DEC					;$B89C69
	BNE.b CODE_B89C86			;$B89C6A
	LDA.w #$0878				;$B89C6C
	STA.w active_kong_sprite		;$B89C6F
	LDA.w #$1480				;$B89C72
	STA.w $04FB				;$B89C75
	LDA.w #$08E6				;$B89C78
	STA.w follower_kong_sprite		;$B89C7B
	LDA.w #$14D2				;$B89C7E
	STA.w $04FF				;$B89C81
	BRA.b CODE_B89C9E			;$B89C84

CODE_B89C86:
	LDA.w #$08E6				;$B89C86
	STA.w active_kong_sprite		;$B89C89
	LDA.w #$14D2				;$B89C8C
	STA.w $04FB				;$B89C8F
	LDA.w #$0878				;$B89C92
	STA.w follower_kong_sprite		;$B89C95
	LDA.w #$1480				;$B89C98
	STA.w $04FF				;$B89C9B
CODE_B89C9E:
	PHX					;$B89C9E
	LDX.w active_kong_sprite		;$B89C9F
	LDA.w #$00BC				;$B89CA2
	STA.b $3A,x				;$B89CA5
	LDA.w #$00E4				;$B89CA7
	JSR.w CODE_B8829F			;$B89CAA
	LDX.w follower_kong_sprite		;$B89CAD
	LDA.w #$0000				;$B89CB0
	STA.b $3A,x				;$B89CB3
	LDA.w #$00D8				;$B89CB5
	JSR.w CODE_B8829F			;$B89CB8
	PLX					;$B89CBB
	RTL					;$B89CBC

CODE_B89CBD:
	LDA.w #dixie_control_variables		;$B89CBD
	STA.b current_kong_control_variables	;$B89CC0
	LDA.w $0767				;$B89CC2
	AND.w #$00FF				;$B89CC5
	DEC					;$B89CC8
	ASL					;$B89CC9
	ADC.w current_kong			;$B89CCA
	ASL					;$B89CCD
	TAX					;$B89CCE
	LDA.l DATA_B89E43,x			;$B89CCF
	TAY					;$B89CD3
	JSL.l CODE_BB8585			;$B89CD4
	LDX.b alternate_sprite			;$B89CD8
	STX.b current_sprite			;$B89CDA
	STX.w $0501				;$B89CDC
	JSR.w CODE_B89E83			;$B89CDF
	LDA.b $5C,x				;$B89CE2
	JSL.l set_anim_handle_kiddy		;$B89CE4
	LDA.l dixie_kong_constants		;$B89CE8
	STA.w $1488				;$B89CEC
	LDA.l dixie_kong_constants+$08		;$B89CEF
	STA.w $148A				;$B89CF3
	LDA.w $0775				;$B89CF6
	AND.w #$0800				;$B89CF9
	BEQ.b CODE_B89D01			;$B89CFC
	LDA.w #$0004				;$B89CFE
CODE_B89D01:
	CLC					;$B89D01
	ADC.b $06,x				;$B89D02
	STA.b $06,x				;$B89D04
	LDA.w #$14D2				;$B89D06
	STA current_kong_control_variables	;$B89D09
	LDA.w $0767				;$B89D0B
	AND.w #$00FF				;$B89D0E
	DEC					;$B89D11
	ASL					;$B89D12
	ADC.w current_kong			;$B89D13
	ASL					;$B89D16
	TAX					;$B89D17
	LDA.l DATA_B89E63,x			;$B89D18
	TAY					;$B89D1C
	JSL.l CODE_BB8585			;$B89D1D
	LDX.b alternate_sprite			;$B89D21
	STX.b current_sprite			;$B89D23
	STX.w $0503				;$B89D25
	JSR.w CODE_B89E83			;$B89D28
	LDA.b $5C,x				;$B89D2B
	JSL.l set_anim_handle_kiddy		;$B89D2D
	LDA.l kiddy_kong_constants		;$B89D31
	STA.w $14DA				;$B89D35
	LDA.l kiddy_kong_constants+$08		;$B89D38
	STA.w $14DC				;$B89D3C
	LDA.w $0775				;$B89D3F
	AND.w #$0800				;$B89D42
	BEQ.b CODE_B89D4A			;$B89D45
	LDA.w #$0004				;$B89D47
CODE_B89D4A:
	CLC					;$B89D4A
	ADC.b $06,x				;$B89D4B
	STA.b $06,x				;$B89D4D
	LDA.w current_kong			;$B89D4F
	JSL.l CODE_B89C62			;$B89D52
	JSR.w CODE_B89EAC			;$B89D56
	LDX.w follower_kong_sprite		;$B89D59
	LDA.w #$0000				;$B89D5C
	STA.b $3A,x				;$B89D5F
	LDA.w #$00D8				;$B89D61
	STA.b $0E,x				;$B89D64
	LDX.w active_kong_sprite		;$B89D66
	LDA.w #$00BC				;$B89D69
	STA.b $3A,x				;$B89D6C
	LDA.w #$00E4				;$B89D6E
	STA.b $0E,x				;$B89D71
	LDA.b current_animal_type		;$B89D73
	BNE.b CODE_B89DCA			;$B89D75
	LDA.b parry_index			;$B89D77
	BNE.b CODE_B89DAC			;$B89D79
CODE_B89D7B:
	LDX.w follower_kong_sprite		;$B89D7B
	LDA.w $05AF				;$B89D7E
	AND.w #$4000				;$B89D81
	BEQ.b CODE_B89DA8			;$B89D84
	LDA.w #$0020				;$B89D86
	BIT.b $1E,x				;$B89D89
	BVS.b CODE_B89D91			;$B89D8B
	EOR.w #$FFFF				;$B89D8D
	INC					;$B89D90
CODE_B89D91:
	ADC.b $12,x				;$B89D91
	STA.b $12,x				;$B89D93
	LDA.w #$0033				;$B89D95
	STA.b $38,x				;$B89D98
	LDA.w #$001F				;$B89D9A
	LDX.w #$0001				;$B89D9D
	LDY.w #$0000				;$B89DA0
	JSL.l CODE_B8F028			;$B89DA3
	RTL					;$B89DA7

CODE_B89DA8:
	JSR.w CODE_B89F20			;$B89DA8
	RTL					;$B89DAB

CODE_B89DAC:
	LDA.w #$0244				;$B89DAC
	JSR.w CODE_B8EF45			;$B89DAF
	LDX.w active_kong_sprite		;$B89DB2
	LDY.b alternate_sprite			;$B89DB5
	LDA.b $12,x				;$B89DB7
	STA.w $0012,y				;$B89DB9
	LDA.b $16,x				;$B89DBC
	SEC					;$B89DBE
	SBC.w $0064,y				;$B89DBF
	STA.w $0016,y				;$B89DC2
	JSR.w CODE_B8EC88			;$B89DC5
	BRA.b CODE_B89D7B			;$B89DC8

CODE_B89DCA:
	LDA.b current_mount			;$B89DCA
	BEQ.b CODE_B89E05			;$B89DCC
	LDA.b current_animal_type		;$B89DCE
	JSR.w CODE_B8EF45			;$B89DD0
	LDX.b alternate_sprite			;$B89DD3
	STX.b current_mount			;$B89DD5
	STX.b current_sprite			;$B89DD7
	LDY.w active_kong_sprite		;$B89DD9
	LDA.w $0012,y				;$B89DDC
	STA.b $12,x				;$B89DDF
	LDA.w $0016,y				;$B89DE1
	STA.b $16,x				;$B89DE4
	LDA.w $001E,y				;$B89DE6
	EOR.b $1E,x				;$B89DE9
	AND.w #$F000				;$B89DEB
	EOR.b $1E,x				;$B89DEE
	STA.b $1E,x				;$B89DF0
	LDA.w #$0001				;$B89DF2
	STA.b $38,x				;$B89DF5
	LDA.w #$0000				;$B89DF7
	JSL.l set_riding_kong_anim_handle_kiddy	;$B89DFA
	JSL.l CODE_B88557			;$B89DFE
	BRL CODE_B89D7B				;$B89E02

CODE_B89E05:
	JSL.l CODE_B89C4C			;$B89E05
	LDA.b current_animal_type		;$B89E09
	STZ.b current_animal_type		;$B89E0B
	SEC					;$B89E0D
	SBC.w #$0230				;$B89E0E
	LSR					;$B89E11
	LSR					;$B89E12
	JSR.w CODE_B88CBD			;$B89E13
	JSL.l CODE_B7D7FB			;$B89E16
	LDA.b current_animal_type		;$B89E1A
	SEC					;$B89E1C
	SBC.w #!animal_sprite_type_range_start 	;$B89E1D
	TAX					;$B89E20
	LDA.l DATA_B89E33,x			;$B89E21
	LDY.b current_sprite			;$B89E25
	STA.w $0038,y				;$B89E27
	LDA.l DATA_B89E33+$02,x			;$B89E2A
	JSL.l set_anim_handle_animal_and_kiddy	;$B89E2E
	RTL					;$B89E32

DATA_B89E33:
	dw $0024
	dw $0005
	dw $002D
	dw $0000
	dw $0063
	dw $0000
	dw $0068
	dw $0005

DATA_B89E43:
	dw $0002
	dw $0002
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0002
	dw $0002
	dw $0002
	dw $0002
	dw $0002
	dw $0002
	dw $0002
	dw $0002


DATA_B89E63:
	dw $0004
	dw $0004
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0004
	dw $0004
	dw $0004
	dw $0004
	dw $0004
	dw $0004
	dw $0004
	dw $0004


CODE_B89E83:
	LDA.w $0775				;$B89E83
	AND.w #$0002				;$B89E86
	BEQ.b CODE_B89E92			;$B89E89
	LDA.b $1E,x				;$B89E8B
	ORA.w #$3000				;$B89E8D
	STA.b $1E,x				;$B89E90
CODE_B89E92:
	LDA.w $077B				;$B89E92
	STA.b $12,x				;$B89E95
	LDA.w $077D				;$B89E97
	STA.b $16,x				;$B89E9A
	LDA.w $0792				;$B89E9C
	AND.w #$0002				;$B89E9F
	BEQ.b CODE_B89EAB			;$B89EA2
	LDA.b $1E,x				;$B89EA4
	ORA.w #$4000				;$B89EA6
	STA.b $1E,x				;$B89EA9
CODE_B89EAB:
	RTS					;$B89EAB

CODE_B89EAC:
	LDA.w $0792				;$B89EAC
	AND.w #$0002				;$B89EAF
	BNE.b CODE_B89EB5			;$B89EB2
	RTS					;$B89EB4

CODE_B89EB5:
	LDX.w active_kong_sprite		;$B89EB5
	JSR.w CODE_B89EBE			;$B89EB8
	LDX.w follower_kong_sprite		;$B89EBB
CODE_B89EBE:
	LDA.b $1E,x				;$B89EBE
	ORA.w #$4000				;$B89EC0
	STA.b $1E,x				;$B89EC3
	RTS					;$B89EC5

CODE_B89EC6:
	LDA.w #dixie_control_variables		;$B89EC6
	STA.b current_kong_control_variables	;$B89EC9
	LDY.w #$01F4				;$B89ECB
	JSL.l CODE_BB8585			;$B89ECE
	LDA.l dixie_kong_constants		;$B89ED2
	STA.w $1488				;$B89ED6
	LDA.l dixie_kong_constants+$08		;$B89ED9
	STA.w $148A				;$B89EDD
	LDA.w #kiddy_control_variables		;$B89EE0
	STA.b current_kong_control_variables	;$B89EE3
	LDY.w #$01F2				;$B89EE5
	JSL.l CODE_BB8585			;$B89EE8
	LDA.l kiddy_kong_constants		;$B89EEC
	STA.w $14DA				;$B89EF0
	LDA.l kiddy_kong_constants+$08		;$B89EF3
	STA.w $14DC				;$B89EF7
	RTL					;$B89EFA

CODE_B89EFB:
	LDA.w #dixie_control_variables		;$B89EFB
	STA.b current_kong_control_variables	;$B89EFE
	LDY.w #$01F8				;$B89F00
	JSL.l CODE_BB8585			;$B89F03
	LDX.b alternate_sprite			;$B89F07
	STX.w $0501				;$B89F09
	LDA.w #kiddy_control_variables		;$B89F0C
	STA.b current_kong_control_variables	;$B89F0F
	LDY.w #$01FA				;$B89F11
	JSL.l CODE_BB8585			;$B89F14
	LDX.b alternate_sprite			;$B89F18
	STX.w $0503				;$B89F1A
	RTL					;$B89F1D

CODE_B89F1E:
	LDX.b current_sprite			;$B89F1E
CODE_B89F20:
	LDA.w #$0006				;$B89F20
	STA.b $38,x				;$B89F23
	STZ.b $24,x				;$B89F25
	STZ.b $20,x				;$B89F27
	STZ.b $3A,x				;$B89F29
	RTS					;$B89F2B

dixie_kong_main:
	LDX #dixie_control_variables		;$B89F2C
	LDY #kiddy_control_variables		;$B89F2F
	BRA kong_state_handler			;$B89F32

kiddy_kong_main:
	LDX #kiddy_control_variables		;$B89F34
	LDY #dixie_control_variables		;$B89F37
kong_state_handler:
	STX current_kong_control_variables	;$B89F3A
	STY alternate_kong_control_variables	;$B89F3C
	LDY current_sprite			;$B89F3E
	LDA $0006,y				;$B89F40
	STA current_sprite_constants		;$B89F43
	PHK					;$B89F45
	PLB					;$B89F46
	LDA $0038,y				;$B89F47
	ASL					;$B89F4A
	ASL					;$B89F4B
	TAX					;$B89F4C
	JMP (kong_state_table,x)		;$B89F4D

CODE_B89F50:
	LDA.w #$0003				;$B89F50
	JSL.l interpolate_x_speed		;$B89F53
	LDA.w #$0003				;$B89F57
	JSL.l interpolate_y_speed		;$B89F5A
	JSR.w check_sprite_underwater		;$B89F5E
	BNE.b CODE_B89F69			;$B89F61
	LDA.b $2E,x				;$B89F63
	BPL.b CODE_B89F69			;$B89F65
	STZ.b $2E,x				;$B89F67
CODE_B89F69:
	JSR.w CODE_B8A0F7			;$B89F69
	JSR.w CODE_B8E0FE			;$B89F6C
	JSL.l process_sprite_animation		;$B89F6F
	BRL CODE_B89FC6				;$B89F73

CODE_B89F76:
	JSR.w CODE_B8A035			;$B89F76
	LDA.w #$0003				;$B89F79
	JSL.l interpolate_x_speed		;$B89F7C
	JSR.w check_sprite_underwater		;$B89F80
	BNE.b CODE_B89FA1			;$B89F83
	LDA.b $28,x				;$B89F85
	AND.w #$0101				;$B89F87
	BEQ.b CODE_B89F9B			;$B89F8A
	JSL.l CODE_B8E198			;$B89F8C
	JSL.l CODE_B8E179			;$B89F90
	JSL.l CODE_B9A595			;$B89F94
	BRL CODE_B89FC6				;$B89F98

CODE_B89F9B:
	LDA.b $2E,x				;$B89F9B
	BPL.b CODE_B89FA1			;$B89F9D
	STZ.b $2E,x				;$B89F9F
CODE_B89FA1:
	JSR.w CODE_B8A0F7			;$B89FA1
	JSR.w CODE_B8E0FE			;$B89FA4
	JSL.l process_sprite_animation		;$B89FA7
	BRL CODE_B89FC6				;$B89FAB

CODE_B89FAE:
	JSR.w CODE_B8A035			;$B89FAE
CODE_B89FB1:
	JSR.w CODE_B8A04C			;$B89FB1
CODE_B89FB4:
	JSL.l CODE_B9E018			;$B89FB4
	JSL.l CODE_B9E006			;$B89FB8
CODE_B89FBC:
	JSR.w CODE_B8E0FE			;$B89FBC
	JSR.w CODE_B8C4F8			;$B89FBF
	JSL.l process_sprite_animation		;$B89FC2
CODE_B89FC6:
	JSL.l CODE_BCE2D4			;$B89FC6
	RTS					;$B89FCA

CODE_B89FCB:
	LDA.w timestop_flags			;$B89FCB
	AND.w #$0004				;$B89FCE
	BNE.b CODE_B89FE4			;$B89FD1
	LDX.b current_sprite			;$B89FD3
	STZ.b $2A,x				;$B89FD5
	LDA.b $28,x				;$B89FD7
	AND.w #$1011				;$B89FD9
	BNE.b CODE_B89FE0			;$B89FDC
	STZ.b $2E,x				;$B89FDE
CODE_B89FE0:
	JSL.l CODE_B9E006			;$B89FE0
CODE_B89FE4:
	JSL.l process_sprite_animation		;$B89FE4
	JSL.l CODE_BCE2D4			;$B89FE8
	RTS					;$B89FEC

CODE_B89FED:
	JSR.w CODE_B8A035			;$B89FED
	JSR.w CODE_B8A04C			;$B89FF0
	JSL.l CODE_B9E018			;$B89FF3
	JSL.l CODE_B9E006			;$B89FF7
	JSR.w CODE_B8C5D9			;$B89FFB
	JSL.l process_sprite_animation		;$B89FFE
	RTS					;$B8A002

CODE_B8A003:
	JSR.w CODE_B8A04C			;$B8A003
	JSR.w CODE_B8E1FB			;$B8A006
	JSR.w CODE_B8C5D9			;$B8A009
	JSL.l process_sprite_animation		;$B8A00C
	RTS					;$B8A010

CODE_B8A011:
	JSR.w CODE_B8A035			;$B8A011
	JSR.w CODE_B8A04C			;$B8A014
	JSL.l CODE_B9E018			;$B8A017
	JSL.l CODE_B9E006			;$B8A01B
	JSR.w CODE_B8C5D9			;$B8A01F
	JSL.l process_anim_preserve_state	;$B8A022
	RTS					;$B8A026

CODE_B8A027:
	JSR.w CODE_B8A04C			;$B8A027
	JSR.w CODE_B8E1FB			;$B8A02A
	JSR.w CODE_B8C5D9			;$B8A02D
	JSL.l process_anim_preserve_state	;$B8A030
	RTS					;$B8A034

CODE_B8A035:
	LDX.b current_sprite			;$B8A035
	LDY.b current_kong_control_variables	;$B8A037
	LDA.w $0008,y				;$B8A039
	CLC					;$B8A03C
	ADC.b $2E,x				;$B8A03D
	BMI.b CODE_B8A049			;$B8A03F
	CMP.w $000A,y				;$B8A041
	BCC.b CODE_B8A049			;$B8A044
	LDA.w $000A,y				;$B8A046
CODE_B8A049:
	STA.b $2E,x				;$B8A049
	RTS					;$B8A04B

CODE_B8A04C:
	LDX.b current_sprite			;$B8A04C
	LDY.w #$00C8				;$B8A04E
	LDA.b $28,x				;$B8A051
	AND.w #$0101				;$B8A053
	BEQ.b CODE_B8A06E			;$B8A056
	LDA.w $0775				;$B8A058
	BIT.w #$0040				;$B8A05B
	BEQ.b CODE_B8A063			;$B8A05E
	LDY.w #$00D8				;$B8A060
CODE_B8A063:
	BIT.w #$0020				;$B8A063
	BEQ.b CODE_B8A06E			;$B8A066
	TYA					;$B8A068
	CLC					;$B8A069
	ADC.w #$0008				;$B8A06A
	TAY					;$B8A06D
CODE_B8A06E:
	LDA.b [$6A],y				;$B8A06E
	JSL.l interpolate_x_speed		;$B8A070
	RTS					;$B8A074

CODE_B8A075:
	JSR.w CODE_B8A0C5			;$B8A075
	STZ.b $3C,x				;$B8A078
	JSR.w CODE_B8C5D9			;$B8A07A
	LDX.b current_sprite			;$B8A07D
	CPX.w active_kong_sprite		;$B8A07F
	BNE.b CODE_B8A09B			;$B8A082
	LDA.b $16,x				;$B8A084
	CMP.w $050F				;$B8A086
	BCS.b CODE_B8A095			;$B8A089
	LDA.b $28,x				;$B8A08B
	AND.w #$0101				;$B8A08D
	CMP.w #$0101				;$B8A090
	BNE.b CODE_B8A09B			;$B8A093
CODE_B8A095:
	LDA.w #$2000				;$B8A095
	TRB.w $1957				;$B8A098
CODE_B8A09B:
	JSR.w CODE_B8A0A7			;$B8A09B
	LDX.b current_kong_control_variables	;$B8A09E
	STZ.b $28,x				;$B8A0A0
	STZ.b $2E,x				;$B8A0A2
	JML [$04F5]				;$B8A0A4

CODE_B8A0A7:
	LDA.w $0775				;$B8A0A7
	AND.w #$0004				;$B8A0AA
	BEQ.b CODE_B8A0C4			;$B8A0AD
	LDA.b current_sprite			;$B8A0AF
	SEC					;$B8A0B1
	SBC.w active_kong_sprite		;$B8A0B2
	BEQ.b CODE_B8A0BA			;$B8A0B5
	LDA.w #$8000				;$B8A0B7
CODE_B8A0BA:
	STA.w $18B5				;$B8A0BA
	PHK					;$B8A0BD
	%return(CODE_B8A0C4)			;$B8A0BE
	JMP.w [$18B1]				;$B8A0C1

CODE_B8A0C4:
	RTS					;$B8A0C4

CODE_B8A0C5:
	LDX.b current_sprite			;$B8A0C5
	CPX.w active_kong_sprite		;$B8A0C7
	BNE.b CODE_B8A0F6			;$B8A0CA
	LDA.b $2E,x				;$B8A0CC
	BMI.b CODE_B8A0E2			;$B8A0CE
	LDA.b $28,x				;$B8A0D0
	AND.w #$0101				;$B8A0D2
	BEQ.b CODE_B8A0F6			;$B8A0D5
	CMP.w #$0001				;$B8A0D7
	BNE.b CODE_B8A0E2			;$B8A0DA
	LDA.w $187D				;$B8A0DC
	STA.w $1883				;$B8A0DF
CODE_B8A0E2:
	LDA.b $16,x				;$B8A0E2
	STA.w $187D				;$B8A0E4
	LDY.b current_animal_type		;$B8A0E7
	BEQ.b CODE_B8A0EE			;$B8A0E9
	STA.w $187F				;$B8A0EB
CODE_B8A0EE:
	LDY.w current_held_sprite		;$B8A0EE
	BEQ.b CODE_B8A0F6			;$B8A0F1
	STA.w $1881				;$B8A0F3
CODE_B8A0F6:
	RTS					;$B8A0F6

CODE_B8A0F7:
	LDA.w $0507				;$B8A0F7
	BNE.b CODE_B8A101			;$B8A0FA
	JSL.l CODE_B9E006			;$B8A0FC
	RTS					;$B8A100

CODE_B8A101:
	LDY.b current_animal_type		;$B8A101
	BEQ.b CODE_B8A14D			;$B8A103
	LDX.b current_sprite			;$B8A105
	LDA.b $2A,x				;$B8A107
	BMI.b CODE_B8A138			;$B8A109
	BNE.b CODE_B8A111			;$B8A10B
	BIT.b $1E,x				;$B8A10D
	BVS.b CODE_B8A138			;$B8A10F
CODE_B8A111:
	PHA					;$B8A111
	SEC					;$B8A112
	SBC.w #$0200				;$B8A113
	BPL.b CODE_B8A11B			;$B8A116
	LDA.w #$0000				;$B8A118
CODE_B8A11B:
	LSR					;$B8A11B
	EOR.w #$FFFF				;$B8A11C
	SEC					;$B8A11F
	ADC.w $0507				;$B8A120
	CMP.w #$8000				;$B8A123
	ROR					;$B8A126
	CMP.w #$8000				;$B8A127
	ROR					;$B8A12A
	CLC					;$B8A12B
	ADC.b $2A,x				;$B8A12C
	STA.b $2A,x				;$B8A12E
	JSL.l CODE_B9E006			;$B8A130
	PLA					;$B8A134
	STA.b $2A,x				;$B8A135
	RTS					;$B8A137

CODE_B8A138:
	LDA.b $2A,x				;$B8A138
	PHA					;$B8A13A
	ASL					;$B8A13B
	ADC.w $0507				;$B8A13C
	CMP.w #$8000				;$B8A13F
	ROR					;$B8A142
	STA.b $2A,x				;$B8A143
	JSL.l CODE_B9E006			;$B8A145
	PLA					;$B8A149
	STA.b $2A,x				;$B8A14A
	RTS					;$B8A14C

CODE_B8A14D:
	LDX.b current_sprite			;$B8A14D
	LDA.b $2A,x				;$B8A14F
	BMI.b CODE_B8A182			;$B8A151
	PHA					;$B8A153
	SEC					;$B8A154
	LDY.w #$0240				;$B8A155
	SBC.b [$6A],y				;$B8A158
	BPL.b CODE_B8A161			;$B8A15A
	LDA.w #$0000				;$B8A15C
	BRA.b CODE_B8A16D			;$B8A15F

CODE_B8A161:
	LSR					;$B8A161
	CPX.w $0503				;$B8A162
	BEQ.b CODE_B8A16D			;$B8A165
	STA.b $1A				;$B8A167
	LSR					;$B8A169
	CLC					;$B8A16A
	ADC.b $1A				;$B8A16B
CODE_B8A16D:
	LSR					;$B8A16D
	EOR.w #$FFFF				;$B8A16E
	SEC					;$B8A171
	ADC.w $0507				;$B8A172
	CLC					;$B8A175
	ADC.b $2A,x				;$B8A176
	STA.b $2A,x				;$B8A178
	JSL.l CODE_B9E006			;$B8A17A
	PLA					;$B8A17E
	STA.b $2A,x				;$B8A17F
	RTS					;$B8A181

CODE_B8A182:
	PHA					;$B8A182
	CLC					;$B8A183
	ADC.w $0507				;$B8A184
	STA.b $2A,x				;$B8A187
	JSL.l CODE_B9E006			;$B8A189
	PLA					;$B8A18D
	STA.b $2A,x				;$B8A18E
	RTS					;$B8A190

kong_state_table:
%offset(kong_state_flags, 2)
	dw kong_state_00, $0001			;00
	dw kong_state_01, $0000			;01
	dw kong_state_02, $0000			;02
	dw kong_state_03, $0000			;03
	dw kong_state_03, $0000			;04
	dw kong_state_05, $0000			;05
	dw kong_state_06, $0000			;06
	dw kong_state_07, $0000			;07
	dw kong_state_08, $0010			;08
	dw kong_state_09, $0010			;09
	dw kong_state_0A, $0010			;0A
	dw kong_state_0B, $0010			;0B
	dw kong_state_0C, $0010			;0C
	dw kong_state_0D, $0005			;0D
	dw kong_state_03, $0000			;0E
	dw kong_state_0F, $0000			;0F
	dw kong_state_10, $0000			;10
	dw kong_state_11, $0000			;11
	dw kong_state_12, $0000			;12
	dw kong_state_13, $0000			;13
	dw kong_state_14, $0010			;14
	dw kong_state_15, $0010			;15
	dw kong_state_16, $0010			;16
	dw kong_state_17, $0010			;17
	dw kong_state_18, $0010			;18
	dw kong_state_19, $0000			;19
	dw kong_state_1A, $0001			;1A
	dw kong_state_1B, $0001			;1B
	dw kong_state_1C, $0000			;1C
	dw kong_state_1D, $0000			;1D
	dw kong_state_1E, $0001			;1E
	dw kong_state_1F, $0001			;1F
	dw kong_state_20, $0001			;20
	dw kong_state_21, $0000			;21
	dw kong_state_22, $0001			;22
	dw kong_state_23, $0010			;23
	dw kong_state_24, $0010			;24
	dw kong_state_25, $0010			;25
	dw kong_state_26, $0010			;26
	dw kong_state_27, $0010			;27
	dw kong_state_28, $0010			;28
	dw kong_state_29, $0010			;29
	dw kong_state_2A, $0010			;2A
	dw kong_state_2B, $0010			;2B
	dw kong_state_2C, $0010			;2C
	dw kong_state_2D, $0010			;2D
	dw kong_state_2E, $0010			;2E
	dw kong_state_2F, $0010			;2F
	dw kong_state_30, $0010			;30
	dw kong_state_31, $0010			;31
	dw kong_state_32, $0005			;32
	dw kong_state_33, $0020			;33
	dw kong_state_34, $0000			;34
	dw kong_state_35, $0000			;35
	dw kong_state_36, $0005			;36
	dw kong_state_37, $0000			;37
	dw kong_state_38, $0000			;38
	dw kong_state_39, $0000			;39
	dw kong_state_3A, $0000			;3A
	dw kong_state_3B, $0000			;3B
	dw kong_state_3C, $0000			;3C
	dw kong_state_3D, $0000			;3D
	dw kong_state_3E, $0000			;3E
	dw kong_state_3F, $0000			;3F
	dw kong_state_40, $0000			;40
	dw kong_state_41, $0000			;41
	dw kong_state_42, $0000			;42
	dw kong_state_43, $0000			;43
	dw kong_state_44, $0000			;44
	dw kong_state_45, $0000			;45
	dw kong_state_46, $0000			;46
	dw kong_state_47, $0100			;47
	dw kong_state_48, $0002			;48
	dw kong_state_49, $0080			;49
	dw kong_state_4A, $0100			;4A
	dw kong_state_4B, $0000			;4B
	dw kong_state_4C, $0100			;4C
	dw kong_state_4D, $0000			;4D
	dw kong_state_4E, $0000			;4E
	dw kong_state_4F, $0080			;4F
	dw kong_state_50, $0100			;50
	dw kong_state_51, $0000			;51
	dw kong_state_52, $0000			;52
	dw kong_state_53, $0000			;53
	dw kong_state_54, $0000			;54
	dw kong_state_55, $0000			;55
	dw kong_state_56, $0000			;56
	dw kong_state_52, $0000			;57
	dw kong_state_58, $0000			;58
	dw kong_state_59, $0000			;59
	dw kong_state_5A, $0000			;5A
	dw kong_state_5B, $0000			;5B
	dw kong_state_5C, $0041			;5C
	dw kong_state_5D, $0041			;5D
	dw kong_state_5E, $0000			;5E
	dw kong_state_5F, $0000			;5F
	dw kong_state_60, $0010			;60
	dw kong_state_61, $0000			;61
	dw kong_state_62, $0000			;62
	dw kong_state_63, $0010			;63
	dw kong_state_64, $0010			;64
	dw kong_state_65, $0010			;65
	dw kong_state_66, $0010			;66
	dw kong_state_67, $0010			;67
	dw kong_state_68, $0010			;68
	dw kong_state_69, $0010			;69
	dw kong_state_6A, $0000			;6A
	dw kong_state_6B, $0010			;6B
	dw kong_state_6C, $0010			;6C
	dw kong_state_6D, $0010			;6D
	dw kong_state_6E, $0000			;6E
	dw kong_state_6F, $0000			;6F
	dw kong_state_70, $0009			;70
	dw kong_state_71, $0009			;71
	dw kong_state_72, $0009			;72
	dw kong_state_73, $0009			;73
	dw kong_state_74, $0009			;74
	dw kong_state_75, $0009			;75
	dw kong_state_76, $0009			;76
	dw kong_state_77, $0009			;77

get_kong_state_flags:
	LDX active_kong_sprite			;$B8A371
	LDA sprite.state,x			;$B8A374
	ASL					;$B8A376
	ASL					;$B8A377
	TAX					;$B8A378
	LDA.l kong_state_flags,x		;$B8A379
	RTS					;$B8A37D

kong_state_00:
	LDX.b current_sprite			;$B8A37E
	LDA.w player_1_pressed			;$B8A380
	AND.w #$1000				;$B8A383
	BNE.b CODE_B8A38F			;$B8A386
	JSL.l CODE_B8E3A3			;$B8A388
	JMP.w CODE_B8A075			;$B8A38C

CODE_B8A38F:
	JSL.l CODE_B9A595			;$B8A38F
	LDA.w #$0200				;$B8A393
	TRB.w $059B				;$B8A396
	JMP.w CODE_B8A075			;$B8A399

kong_state_01:
	LDA.w #$0002				;$B8A39C
	JSR.w CODE_B8CC29			;$B8A39F
	JSR.w CODE_B8CBB2			;$B8A3A2
	JSR.w CODE_B89FAE			;$B8A3A5
	JSR.w CODE_B8C681			;$B8A3A8
	JMP.w CODE_B8A075			;$B8A3AB

kong_state_02:
	LDA.w #$0003				;$B8A3AE
	JSR.w CODE_B8CC29			;$B8A3B1
	JSR.w CODE_B8E0AE			;$B8A3B4
	JSR.w CODE_B8E0BF			;$B8A3B7
	JSR.w CODE_B89FAE			;$B8A3BA
	JSR.w CODE_B8C681			;$B8A3BD
	JSR.w CODE_B8C75A			;$B8A3C0
	JMP.w CODE_B8A075			;$B8A3C3

kong_state_03:
	LDA.w #$0004				;$B8A3C6
	JSR.w CODE_B8CC29			;$B8A3C9
	JSR.w CODE_B8E0AE			;$B8A3CC
	JSR.w CODE_B8A3F2			;$B8A3CF
	JSR.w CODE_B89FB1			;$B8A3D2
	LDX.b current_sprite			;$B8A3D5
	LDA.b $28,x				;$B8A3D7
	AND.w #$0303				;$B8A3D9
	BEQ.b CODE_B8A3EC			;$B8A3DC
	LDA.b $1C,x				;$B8A3DE
	AND.w #$0007				;$B8A3E0
	CMP.b $AC				;$B8A3E3
	BCC.b CODE_B8A3EC			;$B8A3E5
	LDA.w #$0100				;$B8A3E7
	STA.b $2E,x				;$B8A3EA
CODE_B8A3EC:
	JSR.w CODE_B8C681			;$B8A3EC
	JMP.w CODE_B8A075			;$B8A3EF

CODE_B8A3F2:
	LDX.b current_kong_control_variables	;$B8A3F2
	LDA.b active_frame_counter		;$B8A3F4
	SEC					;$B8A3F6
	SBC.b $10,x				;$B8A3F7
	CMP.b $26,x				;$B8A3F9
	BCS.b CODE_B8A406			;$B8A3FB
	LDX.b current_sprite			;$B8A3FD
	LDA.b $2A,x				;$B8A3FF
	BEQ.b CODE_B8A436			;$B8A401
	STZ.b $2E,x				;$B8A403
	RTS					;$B8A405

CODE_B8A406:
	LDX.b current_sprite			;$B8A406
	LDA.b $1C,x				;$B8A408
	AND.w #$0007				;$B8A40A
	CMP.b $AC				;$B8A40D
	BEQ.b CODE_B8A427			;$B8A40F
	LDA.b $18,x				;$B8A411
	BMI.b CODE_B8A41D			;$B8A413
	SEC					;$B8A415
	SBC.b $16,x				;$B8A416
	CMP.w #$0004				;$B8A418
	BCC.b CODE_B8A436			;$B8A41B
CODE_B8A41D:
	LDA.b $28,x				;$B8A41D
	AND.w #$0101				;$B8A41F
	CMP.w #$0100				;$B8A422
	BNE.b CODE_B8A436			;$B8A425
CODE_B8A427:
	LDY.w #$0168				;$B8A427
	LDA.b [$6A],y				;$B8A42A
	LDY current_kong_control_variables	;$B8A42C
	STA.w $0026,y				;$B8A42E
	LDA.b active_frame_counter		;$B8A431
	STA.w $0010,y				;$B8A433
CODE_B8A436:
	JSR.w CODE_B8A035			;$B8A436
	RTS					;$B8A439

kong_state_05:
	LDA.w #$0004				;$B8A43A
	JSR.w CODE_B8CC29			;$B8A43D
	JSR.w CODE_B8E0AE			;$B8A440
	JSR.w CODE_B89FAE			;$B8A443
	JSR.w CODE_B8C681			;$B8A446
	JMP.w CODE_B8A075			;$B8A449

kong_state_06:
	JMP.w CODE_B8A075			;$B8A44C

kong_state_07:
	JMP.w kong_state_02			;$B8A44F

kong_state_08:
	LDA.w #$0004				;$B8A452
	TSB.w $05AF				;$B8A455
	JSR.w CODE_B8A532			;$B8A458
	LDA.w #$0006				;$B8A45B
	JSR.w CODE_B8CC29			;$B8A45E
	LDA.b $38,x				;$B8A461
	CMP.w #$0008				;$B8A463
	BNE.b CODE_B8A482			;$B8A466
	JSR.w CODE_B8E0AE			;$B8A468
	JSR.w CODE_B8A493			;$B8A46B
	BCC.b CODE_B8A488			;$B8A46E
	LDA.w #$000B				;$B8A470
	JSL.l interpolate_x_speed		;$B8A473
	LDX.b current_sprite			;$B8A477
	LDA.w #$0028				;$B8A479
	STA.b $1A,x				;$B8A47C
	JSL.l process_sprite_animation		;$B8A47E
CODE_B8A482:
	JSR.w CODE_B89FC6			;$B8A482
	JMP.w CODE_B8A075			;$B8A485

CODE_B8A488:
	LDA.w #$0009				;$B8A488
	STA.b $38,x				;$B8A48B
	JSR.w CODE_B89FC6			;$B8A48D
	JMP.w CODE_B8A075			;$B8A490

CODE_B8A493:
	JSR.w CODE_B8A4C9			;$B8A493
	JSR.w CODE_B8C959			;$B8A496
	LDA.b $1C,x				;$B8A499
	ORA.w #$0800				;$B8A49B
	STA.b $1C,x				;$B8A49E
	LDY.w #$FFFF				;$B8A4A0
	LDA.b $3A				;$B8A4A3
	CMP.b $12,x				;$B8A4A5
	BCS.b CODE_B8A4B4			;$B8A4A7
	LDY.w #$0001				;$B8A4A9
	LDA.b $3C				;$B8A4AC
	CMP.b $12,x				;$B8A4AE
	BCC.b CODE_B8A4B4			;$B8A4B0
CODE_B8A4B2:
	SEC					;$B8A4B2
	RTS					;$B8A4B3

CODE_B8A4B4:
	BEQ.b CODE_B8A4B2			;$B8A4B4
	STY.b $5C,x				;$B8A4B6
	STA.b $12,x				;$B8A4B8
	STZ.b $10,x				;$B8A4BA
	STZ.w $0507				;$B8A4BC
	LDA.b $36,x				;$B8A4BF
	BNE.b CODE_B8A4B2			;$B8A4C1
	STZ.b $30,x				;$B8A4C3
	STZ.b $2A,x				;$B8A4C5
	CLC					;$B8A4C7
	RTS					;$B8A4C8

CODE_B8A4C9:
	LDA.w $0777				;$B8A4C9
	AND.w #$0004				;$B8A4CC
	BEQ.b CODE_B8A50F			;$B8A4CF
	LDX.w #$0002				;$B8A4D1
	LDA level_number			;$B8A4D4
	CMP #!level_konveyor_rope_klash_bonus_1	;$B8A4D6
	BEQ.b CODE_B8A4E3			;$B8A4D9
	LDX.w #$0000				;$B8A4DB
	BCC.b CODE_B8A4E3			;$B8A4DE
	LDX.w #$0004				;$B8A4E0
CODE_B8A4E3:
	LDA.l DATA_FFB3E1,x			;$B8A4E3
	TAX					;$B8A4E7
	LDY.b current_sprite			;$B8A4E8
	BRA.b CODE_B8A4F2			;$B8A4EA

CODE_B8A4EC:
	TXA					;$B8A4EC
	CLC					;$B8A4ED
	ADC.w #$0006				;$B8A4EE
	TAX					;$B8A4F1
CODE_B8A4F2:
	LDA.l DATA_FFB3E7&$FF0000,x		;$B8A4F2
	CMP.w $0016,y				;$B8A4F6
	BCC.b CODE_B8A4EC			;$B8A4F9
	BNE.b CODE_B8A50C			;$B8A4FB
	LDA.w $0012,y				;$B8A4FD
	CMP.l (DATA_FFB3E7&$FF0000)+$02,x	;$B8A500
	BCC.b CODE_B8A4EC			;$B8A504
	LDA.l (DATA_FFB3E7&$FF0000)+$04,x	;$B8A506
	BRA.b CODE_B8A50F			;$B8A50A

CODE_B8A50C:
	LDA.w #$0000				;$B8A50C
CODE_B8A50F:
	LDX.b current_sprite			;$B8A50F
	STA.b $36,x				;$B8A511
	STA.w $0507				;$B8A513
	LDA.b $12,x				;$B8A516
	STA.b $54,x				;$B8A518
	STZ.b $3E				;$B8A51A
	LDA.b $2A,x				;$B8A51C
	BPL.b CODE_B8A522			;$B8A51E
	DEC.b $3E				;$B8A520
CODE_B8A522:
	CLC					;$B8A522
	ADC.b $11,x				;$B8A523
	STA.b $11,x				;$B8A525
	SEP.b #$20				;$B8A527
	LDA.b $3E				;$B8A529
	ADC.b $13,x				;$B8A52B
	STA.b $13,x				;$B8A52D
	REP.b #$20				;$B8A52F
	RTS					;$B8A531

CODE_B8A532:
	LDX.b current_sprite			;$B8A532
	LDA.b $5E,x				;$B8A534
	BEQ.b CODE_B8A53A			;$B8A536
	DEC.b $5E,x				;$B8A538
CODE_B8A53A:
	RTS					;$B8A53A

kong_state_09:
	LDA.w #$0004				;$B8A53B
	TSB.w $05AF				;$B8A53E
	JSR.w CODE_B8A532			;$B8A541
	LDA.w #$0009				;$B8A544
	JSR.w CODE_B8CC29			;$B8A547
	LDA.b $38,x				;$B8A54A
	CMP.w #$0009				;$B8A54C
	BNE.b CODE_B8A56A			;$B8A54F
	JSR.w CODE_B8A493			;$B8A551
	LDA.b $30,x				;$B8A554
	BNE.b CODE_B8A571			;$B8A556
	LDA.w #$000B				;$B8A558
	JSL.l interpolate_x_speed		;$B8A55B
	LDX.b current_sprite			;$B8A55F
	LDA.w #$0028				;$B8A561
	STA.b $1A,x				;$B8A564
	JSL.l process_sprite_animation		;$B8A566
CODE_B8A56A:
	JSR.w CODE_B89FC6			;$B8A56A
	JMP.w CODE_B8A075			;$B8A56D

CODE_B8A570:
	RTS					;$B8A570

CODE_B8A571:
	LDA.w #$0008				;$B8A571
	STA.b $38,x				;$B8A574
	JSL.l process_sprite_animation		;$B8A576
	BRA.b CODE_B8A56A			;$B8A57A

kong_state_0A:
	LDA.w #$0003				;$B8A57C
	JSR.w CODE_B8CC29			;$B8A57F
	JSR.w CODE_B8E0AE			;$B8A582
	JSR.w CODE_B8E0BF			;$B8A585
	JSR.w CODE_B89FB1			;$B8A588
	JSR.w CODE_B8C681			;$B8A58B
	JMP.w CODE_B8A075			;$B8A58E

kong_state_0B:
	LDA.w #$0004				;$B8A591
	TSB.w $05AF				;$B8A594
	LDA.w #$0001				;$B8A597
	TSB.w $1927				;$B8A59A
	JSR.w CODE_B8A532			;$B8A59D
	LDA.w #$0007				;$B8A5A0
	JSR.w CODE_B8CC29			;$B8A5A3
	LDA.b $38,x				;$B8A5A6
	CMP.w #$000B				;$B8A5A8
	BNE.b CODE_B8A5C1			;$B8A5AB
	JSR.w CODE_B8A5D2			;$B8A5AD
	LDX.b current_sprite			;$B8A5B0
	BCS.b CODE_B8A5B8			;$B8A5B2
	LDA.b $34,x				;$B8A5B4
	BEQ.b CODE_B8A5C7			;$B8A5B6
CODE_B8A5B8:
	LDA.w #$0028				;$B8A5B8
	STA.b $1A,x				;$B8A5BB
	JSL.l process_sprite_animation		;$B8A5BD
CODE_B8A5C1:
	JSR.w CODE_B89FC6			;$B8A5C1
	JMP.w CODE_B8A075			;$B8A5C4

CODE_B8A5C7:
	LDA.w #$000C				;$B8A5C7
	STA.b $38,x				;$B8A5CA
	JSR.w CODE_B89FC6			;$B8A5CC
	JMP.w CODE_B8A075			;$B8A5CF

CODE_B8A5D2:
	LDA.w #$000B				;$B8A5D2
	JSL.l interpolate_y_speed		;$B8A5D5
	LDA.b $14,x				;$B8A5D9
	STA.w $1935				;$B8A5DB
	LDA.b $16,x				;$B8A5DE
	STA.w $1937				;$B8A5E0
	JSR.w CODE_B8E0E4			;$B8A5E3
	JSR.w CODE_B8CA0D			;$B8A5E6
	LDA.b $A2				;$B8A5E9
	STA.b $1C,x				;$B8A5EB
	BCS.b CODE_B8A5FC			;$B8A5ED
	LDA.b $3A				;$B8A5EF
	BEQ.b CODE_B8A5FE			;$B8A5F1
	LDY.w #$FFFF				;$B8A5F3
	CMP.b $16,x				;$B8A5F6
	BCC.b CODE_B8A5FC			;$B8A5F8
	BNE.b CODE_B8A609			;$B8A5FA
CODE_B8A5FC:
	SEC					;$B8A5FC
	RTS					;$B8A5FD

CODE_B8A5FE:
	LDA.b $3C				;$B8A5FE
	BEQ.b CODE_B8A5FC			;$B8A600
	LDY.w #$0001				;$B8A602
	CMP.b $16,x				;$B8A605
	BCS.b CODE_B8A5FC			;$B8A607
CODE_B8A609:
	STY.b $5C,x				;$B8A609
	STA.b $16,x				;$B8A60B
	STZ.b $14,x				;$B8A60D
	STZ.b $34,x				;$B8A60F
	CLC					;$B8A611
	RTS					;$B8A612

kong_state_0C:
	LDA.w #$0004				;$B8A613
	TSB.w $05AF				;$B8A616
	JSR.w CODE_B8A532			;$B8A619
	LDA.w #$0008				;$B8A61C
	JSR.w CODE_B8CC29			;$B8A61F
	LDA.b $38,x				;$B8A622
	CMP.w #$000C				;$B8A624
	BNE.b CODE_B8A63F			;$B8A627
	LDX.b current_sprite			;$B8A629
	LDA.b $34,x				;$B8A62B
	BEQ.b CODE_B8A645			;$B8A62D
	ORA.b $5C,x				;$B8A62F
	BPL.b CODE_B8A656			;$B8A631
	LDA.w #$000B				;$B8A633
	STA.b $38,x				;$B8A636
	LDA.w #$001C				;$B8A638
	JSL.l set_anim_handle_kiddy		;$B8A63B
CODE_B8A63F:
	JSR.w CODE_B89FC6			;$B8A63F
	JMP.w CODE_B8A075			;$B8A642

CODE_B8A645:
	LDA.w #$000B				;$B8A645
	JSL.l interpolate_y_speed		;$B8A648
	JSL.l process_sprite_animation		;$B8A64C
	JSR.w CODE_B89FC6			;$B8A650
	JMP.w CODE_B8A075			;$B8A653

CODE_B8A656:
	JSR.w CODE_B8CBCB			;$B8A656
	STZ.b $2A,x				;$B8A659
	STZ.b $30,x				;$B8A65B
	LDA.w #$0010				;$B8A65D
	STA.w $1955				;$B8A660
	JSR.w CODE_B89FC6			;$B8A663
	JMP.w CODE_B8A075			;$B8A666

kong_state_0D:
	LDA.w #$002B				;$B8A669
	JSL.l CODE_B882B6			;$B8A66C
	JSR.w CODE_B89FAE			;$B8A670
	JMP.w CODE_B8A075			;$B8A673

kong_state_0F:
	LDA.w #$0003				;$B8A676
	JSR.w CODE_B8CC29			;$B8A679
	JSR.w CODE_B8E0AE			;$B8A67C
	JSR.w CODE_B8E0BF			;$B8A67F
	JSR.w CODE_B89FAE			;$B8A682
	JSR.w CODE_B8C75A			;$B8A685
	JSR.w CODE_B8C681			;$B8A688
	JMP.w CODE_B8A075			;$B8A68B

kong_state_10:
	LDA.w #$000A				;$B8A68E
	JSR.w CODE_B8CC29			;$B8A691
	JSR.w CODE_B89FAE			;$B8A694
	LDX.b current_sprite			;$B8A697
	LDA.b $38,x				;$B8A699
	CMP.w #$0010				;$B8A69B
	BNE.b CODE_B8A6A3			;$B8A69E
	JSR.w CODE_B8C681			;$B8A6A0
CODE_B8A6A3:
	JMP.w CODE_B8A075			;$B8A6A3

kong_state_11:
	LDA.w #$000B				;$B8A6A6
	JSR.w CODE_B8CC29			;$B8A6A9
	JSR.w CODE_B8E0AE			;$B8A6AC
	JSR.w CODE_B8E0BF			;$B8A6AF
	JSR.w CODE_B89FAE			;$B8A6B2
	JSR.w CODE_B8C681			;$B8A6B5
	JMP.w CODE_B8A075			;$B8A6B8

kong_state_12:
	LDA.w #$0001				;$B8A6BB
	JSR.w CODE_B8CC29			;$B8A6BE
	JSR.w CODE_B89FAE			;$B8A6C1
	JMP.w CODE_B8A075			;$B8A6C4

kong_state_13:
	LDA.w #$0001				;$B8A6C7
	JSR.w CODE_B8CC29			;$B8A6CA
	LDA.w current_held_sprite		;$B8A6CD
	BEQ.b CODE_B8A6E5			;$B8A6D0
	LDX.b current_sprite			;$B8A6D2
	LDA.b $28,x				;$B8A6D4
	AND.w #$0010				;$B8A6D6
	BNE.b CODE_B8A6E5			;$B8A6D9
	JSL.l process_sprite_animation		;$B8A6DB
	JSR.w CODE_B89FC6			;$B8A6DF
	JMP.w CODE_B8A075			;$B8A6E2

CODE_B8A6E5:
	JSR.w CODE_B89FAE			;$B8A6E5
	JMP.w CODE_B8A075			;$B8A6E8

kong_state_14:
	LDA.w #$0002				;$B8A6EB
	TSB.w $1927				;$B8A6EE
	LDA.w #$000C				;$B8A6F1
	JSR.w CODE_B8CC29			;$B8A6F4
	LDA.b $38,x				;$B8A6F7
	CMP.w #$0014				;$B8A6F9
	BNE.b CODE_B8A71E			;$B8A6FC
	LDY.b $4C,x				;$B8A6FE
	LDA.w #$0040				;$B8A700
	ORA.w $003C,y				;$B8A703
	STA.w $003C,y				;$B8A706
	TYX					;$B8A709
	JSL.l CODE_BEC02A			;$B8A70A
	LDX.b current_sprite			;$B8A70E
	LDA.b $DA				;$B8A710
	CLC					;$B8A712
	ADC.w #$002A				;$B8A713
	STA.b $16,x				;$B8A716
	STZ.b $1A,x				;$B8A718
	JSL.l process_sprite_animation		;$B8A71A
CODE_B8A71E:
	JSR.w CODE_B89FC6			;$B8A71E
	JMP.w CODE_B8A075			;$B8A721

kong_state_15:
	LDA.w #$0004				;$B8A724
	TSB.w $05AF				;$B8A727
	JMP.w CODE_B8A075			;$B8A72A

kong_state_16:
	LDA.w #$0004				;$B8A72D
	TSB.w $05AF				;$B8A730
	LDA.w #$0007				;$B8A733
	JSR.w CODE_B8CC29			;$B8A736
	LDA.b $38,x				;$B8A739
	CMP.w #$0016				;$B8A73B
	BNE.b CODE_B8A752			;$B8A73E
	JSR.w CODE_B8A763			;$B8A740
	BCS.b CODE_B8A749			;$B8A743
	LDA.b $34,x				;$B8A745
	BEQ.b CODE_B8A758			;$B8A747
CODE_B8A749:
	LDA.w #$0028				;$B8A749
	STA.b $1A,x				;$B8A74C
	JSL.l process_sprite_animation		;$B8A74E
CODE_B8A752:
	JSR.w CODE_B89FC6			;$B8A752
	JMP.w CODE_B8A075			;$B8A755

CODE_B8A758:
	LDA.w #$0017				;$B8A758
	STA.b $38,x				;$B8A75B
	JSR.w CODE_B89FC6			;$B8A75D
	JMP.w CODE_B8A075			;$B8A760

CODE_B8A763:
	LDA.w #$000B				;$B8A763
	JSL.l interpolate_y_speed		;$B8A766
	LDA.b $14,x				;$B8A76A
	STA.w $1935				;$B8A76C
	LDA.b $16,x				;$B8A76F
	STA.w $1937				;$B8A771
	JSR.w CODE_B8E0E4			;$B8A774
	JSR.w CODE_B8A7CB			;$B8A777
	LDX.b current_sprite			;$B8A77A
	CMP.b $16,x				;$B8A77C
	BCC.b CODE_B8A7B0			;$B8A77E
	LDA.w #$1000				;$B8A780
	STA.b $1C,x				;$B8A783
	LDA.b $3E				;$B8A785
	STA.b $12,x				;$B8A787
	LDY.w #$FFFF				;$B8A789
	LDA.b $3A				;$B8A78C
	CMP.b $16,x				;$B8A78E
	BCS.b CODE_B8A7B0			;$B8A790
	LDA.w current_kong			;$B8A792
	BEQ.b CODE_B8A79B			;$B8A795
	LDA.w #$000D				;$B8A797
	CLC					;$B8A79A
CODE_B8A79B:
	ADC.w #$0020				;$B8A79B
	CLC					;$B8A79E
	ADC.w $1973				;$B8A79F
	CMP.b $16,x				;$B8A7A2
	BCS.b CODE_B8A7BA			;$B8A7A4
	LDY.w #$0001				;$B8A7A6
	LDA.b $3C				;$B8A7A9
	CMP.b $16,x				;$B8A7AB
	BCC.b CODE_B8A7B0			;$B8A7AD
	RTS					;$B8A7AF

CODE_B8A7B0:
	STY.b $5C,x				;$B8A7B0
	STA.b $16,x				;$B8A7B2
	STZ.b $14,x				;$B8A7B4
	STZ.b $34,x				;$B8A7B6
	CLC					;$B8A7B8
	RTS					;$B8A7B9

CODE_B8A7BA:
	STY.b $5C,x				;$B8A7BA
	INC					;$B8A7BC
	STA.b $16,x				;$B8A7BD
	STZ.b $14,x				;$B8A7BF
	LDA.b $34,x				;$B8A7C1
	CMP.w #$8000				;$B8A7C3
	ROR					;$B8A7C6
	STA.b $34,x				;$B8A7C7
	SEC					;$B8A7C9
	RTS					;$B8A7CA

CODE_B8A7CB:
	LDY.b current_sprite			;$B8A7CB
	LDA.w $004E,y				;$B8A7CD
	STA.b $42				;$B8A7D0
	LDA.w $0050,y				;$B8A7D2
	STA.b $44				;$B8A7D5
	LDX.b $4C,y				;$B8A7D7
	LDA.b $12,x				;$B8A7D9
	CLC					;$B8A7DB
	ADC.w #$0003				;$B8A7DC
	STA.b $3E				;$B8A7DF
	PHK					;$B8A7E1
	%return(CODE_B8A7E8)			;$B8A7E2
	JMP.w [$0042]				;$B8A7E5

CODE_B8A7E8:
	LDA.w #$0028				;$B8A7E8
	LDY.b current_kong_control_variables	;$B8A7EB
	CPY.w #dixie_control_variables		;$B8A7ED
	BEQ.b CODE_B8A7F5			;$B8A7F0
	LDA.w #$0035				;$B8A7F2
CODE_B8A7F5:
	CLC					;$B8A7F5
	ADC.b $DA				;$B8A7F6
	STA.b $3A				;$B8A7F8
	LDA.b $DE				;$B8A7FA
	SEC					;$B8A7FC
	SBC.w #$0008				;$B8A7FD
	STA.b $3C				;$B8A800
	LDA.b $DE				;$B8A802
	RTS					;$B8A804

kong_state_17:
	LDA.w #$0004				;$B8A805
	TSB.w $05AF				;$B8A808
	LDA.w #$0008				;$B8A80B
	JSR.w CODE_B8CC29			;$B8A80E
	LDA.b $38,x				;$B8A811
	CMP.w #$0017				;$B8A813
	BNE.b CODE_B8A835			;$B8A816
	JSR.w CODE_B8A7CB			;$B8A818
	LDX.b current_sprite			;$B8A81B
	CMP.b $16,x				;$B8A81D
	BCC.b CODE_B8A84C			;$B8A81F
	LDA.b $34,x				;$B8A821
	BEQ.b CODE_B8A83B			;$B8A823
	ORA.b $5C,x				;$B8A825
	BPL.b CODE_B8A84C			;$B8A827
	LDA.w #$0016				;$B8A829
	STA.b $38,x				;$B8A82C
	LDA.w #$001C				;$B8A82E
	JSL.l set_anim_handle_kiddy		;$B8A831
CODE_B8A835:
	JSR.w CODE_B89FC6			;$B8A835
	JMP.w CODE_B8A075			;$B8A838

CODE_B8A83B:
	LDA.w #$000B				;$B8A83B
	JSL.l interpolate_y_speed		;$B8A83E
	JSL.l process_sprite_animation		;$B8A842
	JSR.w CODE_B89FC6			;$B8A846
	JMP.w CODE_B8A075			;$B8A849

CODE_B8A84C:
	JSR.w CODE_B8CBCB			;$B8A84C
	STZ.b $2A,x				;$B8A84F
	STZ.b $30,x				;$B8A851
	LDA.w #$0010				;$B8A853
	STA.w $1955				;$B8A856
	JSR.w CODE_B89FC6			;$B8A859
	JMP.w CODE_B8A075			;$B8A85C

kong_state_18:
	LDA.w #$000D				;$B8A85F
	JSR.w CODE_B8CC29			;$B8A862
	LDX.b current_sprite			;$B8A865
	LDA.b $38,x				;$B8A867
	CMP.w #$0018				;$B8A869
	BNE.b CODE_B8A871			;$B8A86C
	JSR.w CODE_B89F76			;$B8A86E
CODE_B8A871:
	JMP.w CODE_B8A075			;$B8A871

kong_state_19:
	LDA.w $005C,y				;$B8A874
	ASL					;$B8A877
	TAX					;$B8A878
	JMP.w (.sub_state_table,x)		;$B8A879

.sub_state_table:
	dw .sub_state_0   
	dw .sub_state_1
	dw .sub_state_2
	dw .sub_state_1   ;03

.sub_state_0:
	LDA.w #$0001				;$B8A87C
	JSR.w CODE_B8CC29			;$B8A87F
	LDY.w #$01F8				;$B8A882
#CODE_B8A88D:
	LDX.b current_sprite			;$B8A885
	LDA.w $050F				;$B8A887
	CMP.b $16,x				;$B8A88A
	BCS.b CODE_B8A8A9			;$B8A88C
	LDA.b $30,x				;$B8A88E
	CMP.w #$8000				;$B8A890
	ROR					;$B8A893
	BMI.b CODE_B8A8A2			;$B8A894
	EOR.w #$FFFF				;$B8A896
	INC					;$B8A899
#CODE_B8A8A2:
	CLC					;$B8A89A
	ADC.b [$6A],y				;$B8A89B
	STA.b $2E,x				;$B8A89D
	INC.b $5C,x				;$B8A89F
#CODE_B8A8A9:
	JSR.w CODE_B89FAE			;$B8A8A1
	JSR.w CODE_B8A8D2			;$B8A8A4
	JMP.w CODE_B8A075			;$B8A8A7

.sub_state_1:
	LDA.w #$000E				;$B8A8AA
	JSR.w CODE_B8CC29			;$B8A8AD
	JSR.w CODE_B89FAE			;$B8A8B0
	JSR.w CODE_B8A8D2			;$B8A8B3
	JSR.w CODE_B8C681			;$B8A8B6
	JSR.w CODE_B8C75A			;$B8A8B9
	JMP.w CODE_B8A075			;$B8A8BC

.sub_state_2:
	LDA.w #$0001				;$B8A8BF
	JSR.w CODE_B8CC29			;$B8A8C2
	LDY.w #$0200				;$B8A8C5
	BRA.b CODE_B8A88D			;$B8A8C8

#CODE_B8A8D2:
	LDX.b current_sprite			;$B8A8CA
	BIT.b $2E,x				;$B8A8CC
	BPL.b CODE_B8A8DF			;$B8A8CE
	LDA.w $050F				;$B8A8D0
	CMP.b $16,x				;$B8A8D3
	BCC.b CODE_B8A8DF			;$B8A8D5
#CODE_B8A8DF:
	RTS					;$B8A8D7

;bounce code ends here

kong_state_1A:
	LDA.w $0028,y				;$B8A8E0
	AND.w #$0001				;$B8A8E3
	BNE.b CODE_B8A8FD			;$B8A8E6
	LDA.w $0016,y				;$B8A8E8
	SEC					;$B8A8EB
	SBC.w $1973				;$B8A8EC
	CMP.w #$0120				;$B8A8EF
	BCS.b CODE_B8A8FD			;$B8A8F2
	JSR.w CODE_B8A011			;$B8A8F4
	JSR.w CODE_B8E0FE			;$B8A8F7
	JMP.w CODE_B8A075			;$B8A8FA

CODE_B8A8FD:
	JSR.w CODE_B8845C			;$B8A8FD
	JMP.w CODE_B8A075			;$B8A900

kong_state_1B:
	LDA.w #$0001				;$B8A903
	TSB.w $1927				;$B8A906
	TYX					;$B8A909
	LDA.b $5A,x				;$B8A90A
	BNE.b CODE_B8A938			;$B8A90C
	LDA.b $60,x				;$B8A90E
	BEQ.b CODE_B8A91B			;$B8A910
	DEC.b $60,x				;$B8A912
	JSL.l process_anim_preserve_state	;$B8A914
	JMP.w CODE_B8A075			;$B8A918

CODE_B8A91B:
	JSR.w CODE_B8A9DE			;$B8A91B
	BCS.b CODE_B8A92F			;$B8A91E
	JSR.w CODE_B8A011			;$B8A920
	LDX.b current_sprite			;$B8A923
	LDA.b $28,x				;$B8A925
	AND.w #$0002				;$B8A927
	BNE.b CODE_B8A92F			;$B8A92A
	JMP.w CODE_B8A075			;$B8A92C

CODE_B8A92F:
	INC.b $5A,x				;$B8A92F
	JSL.l CODE_B8837A			;$B8A931
	JMP.w CODE_B8A075			;$B8A935

CODE_B8A938:
	LDA.b $5E,x				;$B8A938
	CMP.w #$8000				;$B8A93A
	ROR					;$B8A93D
	CMP.w #$8000				;$B8A93E
	ROR					;$B8A941
	STA.b $30,x				;$B8A942
	STA.b $2A,x				;$B8A944
	STZ.b $2E,x				;$B8A946
	JSR.w CODE_B8E1FB			;$B8A948
	JSR.w CODE_B8C5D9			;$B8A94B
	JSL.l process_anim_preserve_state	;$B8A94E
	JMP.w CODE_B8A075			;$B8A952

kong_state_1E:
	LDA.w #$0001				;$B8A955
	TSB.w $1927				;$B8A958
	TYX					;$B8A95B
	LDA.b $5A,x				;$B8A95C
	BNE.b CODE_B8A938			;$B8A95E
	LDA.b $60,x				;$B8A960
	BEQ.b CODE_B8A96D			;$B8A962
	DEC.b $60,x				;$B8A964
	JSL.l process_anim_preserve_state	;$B8A966
	JMP.w CODE_B8A075			;$B8A96A

CODE_B8A96D:
	JSR.w CODE_B8A9AF			;$B8A96D
	BCS.b CODE_B8A982			;$B8A970
	LDA.b $5E,x				;$B8A972
	CMP.w #$8000				;$B8A974
	ROR					;$B8A977
	CMP.w #$8000				;$B8A978
	ROR					;$B8A97B
	STA.b $2A,x				;$B8A97C
	STA.b $30,x				;$B8A97E
	BRA.b CODE_B8A9A0			;$B8A980

CODE_B8A982:
	LDA.b $1E,x				;$B8A982
	AND.w #$CFFF				;$B8A984
	ORA.w #$2000				;$B8A987
	STA.b $1E,x				;$B8A98A
	LDY.w follower_kong_sprite		;$B8A98C
	LDA.w $001E,y				;$B8A98F
	AND.w #$CFFF				;$B8A992
	ORA.w #$2000				;$B8A995
	STA.w $001E,y				;$B8A998
	JSR.w CODE_B8A9DE			;$B8A99B
	BCS.b CODE_B8A9A6			;$B8A99E
CODE_B8A9A0:
	JSR.w CODE_B8A027			;$B8A9A0
	JMP.w CODE_B8A075			;$B8A9A3

CODE_B8A9A6:
	INC.b $5A,x				;$B8A9A6
	JSL.l CODE_B8837A			;$B8A9A8
	JMP.w CODE_B8A075			;$B8A9AC

CODE_B8A9AF:
	LDX.b current_sprite			;$B8A9AF
	LDA.w $195D				;$B8A9B1
	BEQ.b CODE_B8A9DA			;$B8A9B4
	LDA.w $1961				;$B8A9B6
	SEC					;$B8A9B9
	SBC.b $16,x				;$B8A9BA
	BEQ.b CODE_B8A9DA			;$B8A9BC
	BPL.b CODE_B8A9CA			;$B8A9BE
	CMP.w #$FFFE				;$B8A9C0
	BCS.b CODE_B8A9D2			;$B8A9C3
	LDA.w #$FFFE				;$B8A9C5
	BRA.b CODE_B8A9D2			;$B8A9C8

CODE_B8A9CA:
	CMP.w #$0002				;$B8A9CA
	BCC.b CODE_B8A9D2			;$B8A9CD
	LDA.w #$0002				;$B8A9CF
CODE_B8A9D2:
	XBA					;$B8A9D2
	AND.w #$FF00				;$B8A9D3
	STA.b $2E,x				;$B8A9D6
	CLC					;$B8A9D8
	RTS					;$B8A9D9

CODE_B8A9DA:
	STZ.b $2E,x				;$B8A9DA
	SEC					;$B8A9DC
	RTS					;$B8A9DD

CODE_B8A9DE:
	LDA.b $5E,x				;$B8A9DE
	STA.b $30,x				;$B8A9E0
	STA.b $2A,x				;$B8A9E2
	LDA.b $12,x				;$B8A9E4
	SEC					;$B8A9E6
	SBC.w $196D				;$B8A9E7
	CMP.w #$0008				;$B8A9EA
	BCC.b CODE_B8AA05			;$B8A9ED
	CMP.w #$00F8				;$B8A9EF
	BCS.b CODE_B8AA05			;$B8A9F2
	LDA.w $195D				;$B8A9F4
	BEQ.b CODE_B8AA03			;$B8A9F7
	LDA.w $195F				;$B8A9F9
	SEC					;$B8A9FC
	SBC.b $12,x				;$B8A9FD
	EOR.b $2A,x				;$B8A9FF
	BMI.b CODE_B8AA05			;$B8AA01
CODE_B8AA03:
	CLC					;$B8AA03
	RTS					;$B8AA04

CODE_B8AA05:
	SEC					;$B8AA05
	RTS					;$B8AA06

kong_state_1C:
	LDA.w #$0001				;$B8AA07
	TSB.w $1927				;$B8AA0A
	LDA.w #$0002				;$B8AA0D
	TSB.w $05AF				;$B8AA10
	LDA.w #$0001				;$B8AA13
	JSR.w CODE_B8CC29			;$B8AA16
	LDX.b current_sprite			;$B8AA19
	STZ.b $28,x				;$B8AA1B
	LDA.w #$0001				;$B8AA1D
	STA.b $1A,x				;$B8AA20
	STZ.b $36,x				;$B8AA22
	LDX.b parry_index			;$B8AA24
	BEQ.b CODE_B8AA2C			;$B8AA26
	JSL.l CODE_BCE2F2			;$B8AA28
CODE_B8AA2C:
	JMP.w CODE_B8A075			;$B8AA2C

kong_state_1D:
	LDA.w #$0002				;$B8AA2F
	TSB.w $1927				;$B8AA32
	LDX.w $0501				;$B8AA35
	LDA.b $06,x				;$B8AA38
	STA.b $6A				;$B8AA3A
	LDY current_kong_control_variables	;$B8AA3C
	LDA.w $0006,y				;$B8AA3E
	ORA.w #$0004				;$B8AA41
	STA.w $0006,y				;$B8AA44
	LDA.w #$C000				;$B8AA47
	TSB.w $0474				;$B8AA4A
	LDX.b current_sprite			;$B8AA4D
	LDA.w #$0001				;$B8AA4F
	DEC.b $5E,x				;$B8AA52
	BPL.b CODE_B8AA5D			;$B8AA54
	STZ.b $5E,x				;$B8AA56
	STZ.b $64,x				;$B8AA58
	LDA.w #$000F				;$B8AA5A
CODE_B8AA5D:
	JSR.w CODE_B8CC29			;$B8AA5D
	LDA.b $62,x				;$B8AA60
	AND.w #$00FF				;$B8AA62
	BEQ.b CODE_B8AA90			;$B8AA65
	LDY.w #$0002				;$B8AA67
	STY.w $0533				;$B8AA6A
	DEC.b $5C,x				;$B8AA6D
	BPL.b CODE_B8AA78			;$B8AA6F
	STA.w $195B				;$B8AA71
	JSL.l CODE_B88368			;$B8AA74
CODE_B8AA78:
	JSR.w CODE_B8E1FB			;$B8AA78
	JSL.l process_sprite_animation		;$B8AA7B
	LDX.w active_kong_sprite		;$B8AA7F
	STZ.b $3A,x				;$B8AA82
	LDX.w follower_kong_sprite		;$B8AA84
	STZ.b $3A,x				;$B8AA87
	JSL.l CODE_BCE2D4			;$B8AA89
	JMP.w CODE_B8A075			;$B8AA8D

CODE_B8AA90:
	LDA.b current_animal_type		;$B8AA90
	BEQ.b CODE_B8AAA1			;$B8AA92
	CMP.w #!sprite_ellie			;$B8AA94
	BEQ.b CODE_B8AAA1			;$B8AA97
	CMP.w #!sprite_squitter			;$B8AA99
	BEQ.b CODE_B8AAA1			;$B8AA9C
	JMP.w CODE_B8AB23			;$B8AA9E

CODE_B8AAA1:
	DEC.b $5C,x				;$B8AAA1
	BPL.b CODE_B8AAB6			;$B8AAA3
	STZ.b $5C,x				;$B8AAA5
	STZ.b $60,x				;$B8AAA7
	LDY.w #$0170				;$B8AAA9
	LDA.b [$6A],y				;$B8AAAC
	LDY.b current_kong_control_variables	;$B8AAAE
	STA.w $0008,y				;$B8AAB0
	JSR.w CODE_B8A035			;$B8AAB3
CODE_B8AAB6:
	LDA.w #$0002				;$B8AAB6
	LDY.b $5E,x				;$B8AAB9
	BNE.b CODE_B8AAD6			;$B8AABB
	LDA.b $64,x				;$B8AABD
	AND.w #$0002				;$B8AABF
	CMP.w #$0001				;$B8AAC2
	LDA.w #$000D				;$B8AAC5
	BCS.b CODE_B8AAD6			;$B8AAC8
	LDA.w #$0002				;$B8AACA
	LDY.b $30,x				;$B8AACD
	BEQ.b CODE_B8AAD6			;$B8AACF
	LDY.w #$0178				;$B8AAD1
	LDA.b [$6A],y				;$B8AAD4
CODE_B8AAD6:
	JSL.l interpolate_x_speed		;$B8AAD6
	JSL.l process_sprite_animation		;$B8AADA
	LDA.b $64,x				;$B8AADE
	AND.w #$0200				;$B8AAE0
	BNE.b CODE_B8AB19			;$B8AAE3
	JSL.l CODE_B9E018			;$B8AAE5
	JSL.l CODE_B9E006			;$B8AAE9
	JSR.w CODE_B8E0FE			;$B8AAED
	JSR.w CODE_B8C4F8			;$B8AAF0
	LDA.b $2E,x				;$B8AAF3
	BMI.b CODE_B8AAFF			;$B8AAF5
	JSR.w CODE_B8C75A			;$B8AAF7
	JSR.w CODE_B8C681			;$B8AAFA
	BCS.b CODE_B8AB12			;$B8AAFD
CODE_B8AAFF:
	LDX.b current_sprite			;$B8AAFF
	LDA.b $28,x				;$B8AB01
	AND.w #$0303				;$B8AB03
	BEQ.b CODE_B8AB12			;$B8AB06
	STZ.w $04AA				;$B8AB08
	STZ.w $04AE				;$B8AB0B
	JSL.l CODE_B9A595			;$B8AB0E
CODE_B8AB12:
	JSL.l CODE_BCE2D4			;$B8AB12
	JMP.w CODE_B8A075			;$B8AB16

CODE_B8AB19:
	JSR.w CODE_B8E1FB			;$B8AB19
	JSL.l CODE_BCE2D4			;$B8AB1C
	JMP.w CODE_B8A075			;$B8AB20

CODE_B8AB23:
	DEC.b $5C,x				;$B8AB23
	BPL.b CODE_B8AB41			;$B8AB25
	STZ.b $5C,x				;$B8AB27
	STZ.b $60,x				;$B8AB29
	STZ.b $34,x				;$B8AB2B
	LDY.w #$0178				;$B8AB2D
	LDA.b [$6A],y				;$B8AB30
	JSL.l interpolate_y_speed		;$B8AB32
	LDA.w #$0002				;$B8AB36
	LDY.b $5E,x				;$B8AB39
	BNE.b CODE_B8AB46			;$B8AB3B
	LDY.b $30,x				;$B8AB3D
	BEQ.b CODE_B8AB46			;$B8AB3F
CODE_B8AB41:
	LDY.w #$0178				;$B8AB41
	LDA.b [$6A],y				;$B8AB44
CODE_B8AB46:
	JSL.l interpolate_x_speed		;$B8AB46
	JSL.l process_sprite_animation		;$B8AB4A
	LDA.b $64,x				;$B8AB4E
	AND.w #$0200				;$B8AB50
	BNE.b CODE_B8AB76			;$B8AB53
	JSL.l CODE_B9E018			;$B8AB55
	JSL.l CODE_B9E006			;$B8AB59
	JSR.w CODE_B8E0FE			;$B8AB5D
	LDA.b $28,x				;$B8AB60
	AND.w #$0303				;$B8AB62
	BNE.b CODE_B8AB6B			;$B8AB65
	LDA.b $5E,x				;$B8AB67
	BNE.b CODE_B8AB6F			;$B8AB69
CODE_B8AB6B:
	JSL.l CODE_B9A598			;$B8AB6B
CODE_B8AB6F:
	JSL.l CODE_BCE2D4			;$B8AB6F
	JMP.w CODE_B8A075			;$B8AB73

CODE_B8AB76:
	JSR.w CODE_B8E1FB			;$B8AB76
	JSL.l CODE_BCE2D4			;$B8AB79
	JMP.w CODE_B8A075			;$B8AB7D

kong_state_1F:
	LDA.w $075C				;$B8AB80
	CMP.w #$0002				;$B8AB83
	BNE.b CODE_B8AB91			;$B8AB86
	TYX					;$B8AB88
	DEC.b $5C,x				;$B8AB89
	BNE.b CODE_B8AB91			;$B8AB8B
	JSL.l CODE_B8837A			;$B8AB8D
CODE_B8AB91:
	JSR.w CODE_B8E1FA			;$B8AB91
	JMP.w CODE_B8A075			;$B8AB94

kong_state_20:
	LDA.w #$0004				;$B8AB97
	TSB.w $05AF				;$B8AB9A
	JSR.w CODE_B8E1FA			;$B8AB9D
	LDX.b current_sprite			;$B8ABA0
	DEC.b $5C,x				;$B8ABA2
	BNE.b CODE_B8ABB0			;$B8ABA4
	JSL.l CODE_B88368			;$B8ABA6
	LDA.w #$FFFF				;$B8ABAA
	STA.w $195B				;$B8ABAD
CODE_B8ABB0:
	JMP.w CODE_B8A075			;$B8ABB0

kong_state_21:
	LDA.w #$0001				;$B8ABB3
	JSR.w CODE_B8CC29			;$B8ABB6
	JSR.w CODE_B8A035			;$B8ABB9
	LDA.w #$0003				;$B8ABBC
	JSL.l interpolate_x_speed		;$B8ABBF
	JSR.w CODE_B89FB4			;$B8ABC3
	JSR.w CODE_B8C75A			;$B8ABC6
	JSR.w CODE_B8C681			;$B8ABC9
	JMP.w CODE_B8A075			;$B8ABCC

kong_state_22:
	LDA.w #$0001				;$B8ABCF
	TSB.w $1927				;$B8ABD2
	LDX.b current_sprite			;$B8ABD5
	LDY.b $4C,x				;$B8ABD7
	LDA.w #$0040				;$B8ABD9
	ORA.w $003C,y				;$B8ABDC
	STA.w $003C,y				;$B8ABDF
	TYX					;$B8ABE2
	JSL.l CODE_BEC02A			;$B8ABE3
	LDX.b current_sprite			;$B8ABE7
	LDY.b $4C,x				;$B8ABE9
	LDA.b $D8				;$B8ABEB
	CLC					;$B8ABED
	ADC.w #$0003				;$B8ABEE
	STA.b $12,x				;$B8ABF1
	LDA.b $DA				;$B8ABF3
	CLC					;$B8ABF5
	ADC.w #$006A				;$B8ABF6
	SEC					;$B8ABF9
	SBC.w $0046,y				;$B8ABFA
	STA.b $16,x				;$B8ABFD
	STZ.b $1A,x				;$B8ABFF
	LDA.w $001E,y				;$B8AC01
	EOR.w #$4000				;$B8AC04
	ASL					;$B8AC07
	STA.b $30,x				;$B8AC08
	LDA.w $0046,y				;$B8AC0A
	BNE.b CODE_B8AC1F			;$B8AC0D
	LDA.w $05AF				;$B8AC0F
	AND.w #$4000				;$B8AC12
	BEQ.b CODE_B8AC1F			;$B8AC15
	LDX.w follower_kong_sprite		;$B8AC17
	LDA.w #$005F				;$B8AC1A
	STA.b $38,x				;$B8AC1D
CODE_B8AC1F:
	JSL.l process_sprite_animation		;$B8AC1F
	JSR.w CODE_B89FC6			;$B8AC23
	JMP.w CODE_B8A075			;$B8AC26

kong_state_23:
	LDA.w #$0010				;$B8AC29
	JSR.w CODE_B8CC29			;$B8AC2C
	JSR.w CODE_B8CBB2			;$B8AC2F
	JSR.w CODE_B89FAE			;$B8AC32
	JSR.w CODE_B8C681			;$B8AC35
	JSR.w CODE_B8AD5C			;$B8AC38
	JMP.w CODE_B8A075			;$B8AC3B

kong_state_24:
	LDA.w #$0011				;$B8AC3E
	JSR.w CODE_B8CC29			;$B8AC41
	JSR.w CODE_B8E0AE			;$B8AC44
	JSR.w CODE_B8E0BF			;$B8AC47
	JSR.w CODE_B89FAE			;$B8AC4A
	JSR.w CODE_B8C681			;$B8AC4D
	JSR.w CODE_B8AD5C			;$B8AC50
	JMP.w CODE_B8A075			;$B8AC53

kong_state_25:
	LDA.w #$0015				;$B8AC56
	JSR.w CODE_B8CC29			;$B8AC59
	LDA.b $38,x				;$B8AC5C
	CMP.w #$0025				;$B8AC5E
	BNE.b CODE_B8AC75			;$B8AC61
	JSR.w CODE_B8E0AE			;$B8AC63
	LDA.b current_mount			;$B8AC66
	CMP.w #$0001				;$B8AC68
	JSL.l CODE_B8E5B3			;$B8AC6B
	JSR.w CODE_B8AC78			;$B8AC6F
	JSR.w CODE_B89FAE			;$B8AC72
CODE_B8AC75:
	JMP.w CODE_B8A075			;$B8AC75

CODE_B8AC78:
	LDA.w $0777				;$B8AC78
	AND.w #$0020				;$B8AC7B
	BEQ.b CODE_B8AC93			;$B8AC7E
	LDA.b active_frame_counter		;$B8AC80
	AND.w #$0007				;$B8AC82
	BNE.b CODE_B8AC93			;$B8AC85
	LDA.w $1891				;$B8AC87
	INC					;$B8AC8A
	CMP.w #$0008				;$B8AC8B
	BCS.b CODE_B8AC93			;$B8AC8E
	STA.w $1891				;$B8AC90
CODE_B8AC93:
	RTS					;$B8AC93

kong_state_26:
	LDA.w #$0012				;$B8AC94
	JSR.w CODE_B8CC29			;$B8AC97
	JSR.w CODE_B8CBB2			;$B8AC9A
	JSR.w CODE_B89FAE			;$B8AC9D
	JSR.w CODE_B8C681			;$B8ACA0
	JSR.w CODE_B8AD5C			;$B8ACA3
	JMP.w CODE_B8A075			;$B8ACA6

kong_state_27:
	LDA.w #$0013				;$B8ACA9
	JSR.w CODE_B8CC29			;$B8ACAC
	JSR.w CODE_B8E0AE			;$B8ACAF
	JSR.w CODE_B8E0BF			;$B8ACB2
	JSR.w CODE_B89FAE			;$B8ACB5
	JSR.w CODE_B8C681			;$B8ACB8
	JSR.w CODE_B8AD5C			;$B8ACBB
	JMP.w CODE_B8A075			;$B8ACBE

kong_state_28:
	LDA.w #$0001				;$B8ACC1
	JSR.w CODE_B8CC29			;$B8ACC4
	JSR.w CODE_B8CBB2			;$B8ACC7
	JSR.w CODE_B89FAE			;$B8ACCA
	JSR.w CODE_B8C681			;$B8ACCD
	JSR.w CODE_B8AD5C			;$B8ACD0
	JMP.w CODE_B8A075			;$B8ACD3

kong_state_29:
	LDA.w current_held_sprite		;$B8ACD6
	BEQ.b CODE_B8ACF1			;$B8ACD9
	LDX.b current_sprite			;$B8ACDB
	LDA.b $28,x				;$B8ACDD
	AND.w #$0010				;$B8ACDF
	BNE.b CODE_B8ACF1			;$B8ACE2
	JSL.l process_sprite_animation		;$B8ACE4
	JSR.w CODE_B89FC6			;$B8ACE8
	JSR.w CODE_B8AD5C			;$B8ACEB
	JMP.w CODE_B8A075			;$B8ACEE

CODE_B8ACF1:
	JSR.w CODE_B89FAE			;$B8ACF1
	JSR.w CODE_B8AD5C			;$B8ACF4
	JMP.w CODE_B8A075			;$B8ACF7

kong_state_2A:
	LDA.w #$0014				;$B8ACFA
	JSR.w CODE_B8CC29			;$B8ACFD
	JSR.w CODE_B8C663			;$B8AD00
	JSR.w CODE_B8CBB2			;$B8AD03
	JSR.w CODE_B89FAE			;$B8AD06
	JSR.w CODE_B8C681			;$B8AD09
	JSR.w CODE_B8AD5C			;$B8AD0C
	JMP.w CODE_B8A075			;$B8AD0F

kong_state_2B:
	LDA.w #$0014				;$B8AD12
	JSR.w CODE_B8CC29			;$B8AD15
	LDX.b current_sprite			;$B8AD18
	STZ.b $30,x				;$B8AD1A
	JSR.w CODE_B8CBB2			;$B8AD1C
	JSR.w CODE_B89FAE			;$B8AD1F
	JSR.w CODE_B8C681			;$B8AD22
	JMP.w CODE_B8A075			;$B8AD25

kong_state_2C:
	LDA.w #$0010				;$B8AD28
	JSR.w CODE_B8CC29			;$B8AD2B
	JSR.w CODE_B8CBB2			;$B8AD2E
	JSR.w CODE_B89FAE			;$B8AD31
	JSR.w CODE_B8C681			;$B8AD34
	JMP.w CODE_B8A075			;$B8AD37

kong_state_2D:
	LDA.w $003C,y				;$B8AD3A
	CMP.w #$0080				;$B8AD3D
	BNE.b CODE_B8AD4D			;$B8AD40
	TYX					;$B8AD42
	STZ.b $3C,x				;$B8AD43
	JSR.w CODE_B8ADF5			;$B8AD45
	BCC.b CODE_B8AD4D			;$B8AD48
	JMP.w CODE_B8A075			;$B8AD4A

CODE_B8AD4D:
	LDA.w #$0016				;$B8AD4D
	JSR.w CODE_B8CC29			;$B8AD50
	JSR.w CODE_B89F50			;$B8AD53
	JSR.w CODE_B8ADD8			;$B8AD56
	JMP.w CODE_B8A075			;$B8AD59

CODE_B8AD5C:
	LDA.w parent_level_number		;$B8AD5C
	CMP.w #!level_murky_mill		;$B8AD5F
	BNE.b CODE_B8ADC3			;$B8AD62
	LDX.b current_sprite			;$B8AD64
	LDA.b $4A,x				;$B8AD66
	AND.w #$0700				;$B8AD68
	CMP.w #$0200				;$B8AD6B
	BNE.b CODE_B8ADC3			;$B8AD6E
	LDA.b $3C,x				;$B8AD70
	CMP.w #$0080				;$B8AD72
	BNE.b CODE_B8ADC0			;$B8AD75
	STZ.b $3C,x				;$B8AD77
	LDY.b $3E,x				;$B8AD79
	LDA.w $0000,y				;$B8AD7B
	CMP.w #$02F8				;$B8AD7E
	BNE.b CODE_B8ADC3			;$B8AD81
	LDA.w $18A1				;$B8AD83
	CLC					;$B8AD86
	ADC.w #$00E0				;$B8AD87
	CMP.w #$01C0				;$B8AD8A
	BCS.b CODE_B8ADC3			;$B8AD8D
	LDA.w $0012,y				;$B8AD8F
	CMP.w $18A7				;$B8AD92
	BCC.b CODE_B8ADC3			;$B8AD95
	CMP.w $18A9				;$B8AD97
	BCS.b CODE_B8ADC3			;$B8AD9A
	LDA.b $12,x				;$B8AD9C
	CMP.w $18A7				;$B8AD9E
	BCC.b CODE_B8ADC3			;$B8ADA1
	CMP.w $18A9				;$B8ADA3
	BCS.b CODE_B8ADC3			;$B8ADA6
	LDA.w #$0016				;$B8ADA8
	JSL.l CODE_B882B6			;$B8ADAB
	SEC					;$B8ADAF
	LDY.b $3E,x				;$B8ADB0
	LDA.w $0012,y				;$B8ADB2
	SEC					;$B8ADB5
	SBC.b $12,x				;$B8ADB6
	LSR					;$B8ADB8
	AND.w #$4000				;$B8ADB9
	STA.w $17CA				;$B8ADBC
	RTS					;$B8ADBF

CODE_B8ADC0:
	JSR.w CODE_B8ADC5			;$B8ADC0
CODE_B8ADC3:
	CLC					;$B8ADC3
	RTS					;$B8ADC4

CODE_B8ADC5:
	LDX.b current_sprite			;$B8ADC5
	LDA.w #$000B				;$B8ADC7
	JSL.l CODE_BCE2EF			;$B8ADCA
	LDX.b current_sprite			;$B8ADCE
	LDA.b $4A,x				;$B8ADD0
	ORA.w #$4000				;$B8ADD2
	STA.b $4A,x				;$B8ADD5
	RTS					;$B8ADD7

CODE_B8ADD8:
	LDX.b current_sprite			;$B8ADD8
	LDA.b $4A,x				;$B8ADDA
	AND.w #$3F00				;$B8ADDC
	CMP.w #$1300				;$B8ADDF
	BEQ.b CODE_B8ADF4			;$B8ADE2
	LDA.w #$000C				;$B8ADE4
	JSL.l CODE_BCE2EF			;$B8ADE7
	LDX.b current_sprite			;$B8ADEB
	LDA.b $4A,x				;$B8ADED
	ORA.w #$4000				;$B8ADEF
	STA.b $4A,x				;$B8ADF2
CODE_B8ADF4:
	RTS					;$B8ADF4

CODE_B8ADF5:
	LDX.b current_sprite			;$B8ADF5
	LDA.b $4A,x				;$B8ADF7
	AND.w #$3F00				;$B8ADF9
	CMP.w #$1300				;$B8ADFC
	BNE.b CODE_B8AE09			;$B8ADFF
	LDA.w #$0001				;$B8AE01
	TSB.w $1957				;$B8AE04
	CLC					;$B8AE07
	RTS					;$B8AE08

CODE_B8AE09:
	LDA.w #$0004				;$B8AE09
	JSL.l set_anim_handle_animal_and_kiddy	;$B8AE0C
	LDX.b current_sprite			;$B8AE10
	STZ.b $2E,x				;$B8AE12
	JSR.w CODE_B8E0AE			;$B8AE14
	SEC					;$B8AE17
	RTS					;$B8AE18

kong_state_2E:
	LDA.w #$0016				;$B8AE19
	JSR.w CODE_B8CC29			;$B8AE1C
	LDA.w #$0010				;$B8AE1F
	JSL.l CODE_BCE2CE			;$B8AE22
	JSR.w CODE_B89F50			;$B8AE26
	JMP.w CODE_B8A075			;$B8AE29

kong_state_2F:
	LDA.w $003C,y				;$B8AE2C
	CMP.w #$0080				;$B8AE2F
	BNE.b CODE_B8AE3F			;$B8AE32
	TYX					;$B8AE34
	STZ.b $3C,x				;$B8AE35
	JSR.w CODE_B8ADF5			;$B8AE37
	BCC.b CODE_B8AE3F			;$B8AE3A
	JMP.w CODE_B8A075			;$B8AE3C

CODE_B8AE3F:
	LDA.w #$0001				;$B8AE3F
	JSR.w CODE_B8CC29			;$B8AE42
	JSR.w CODE_B89F50			;$B8AE45
	JSR.w CODE_B8ADD8			;$B8AE48
	JMP.w CODE_B8A075			;$B8AE4B

kong_state_30:
	LDA.w #$0017				;$B8AE4E
	JSR.w CODE_B8CC29			;$B8AE51
	LDX.b current_sprite			;$B8AE54
	LDA.b $5C,x				;$B8AE56
	STA.b $2A,x				;$B8AE58
	STA.b $30,x				;$B8AE5A
	LDA.w #$0010				;$B8AE5C
	JSL.l CODE_BCE2CE			;$B8AE5F
	JSR.w CODE_B89F50			;$B8AE63
	LDX.b current_sprite			;$B8AE66
	LDA.b $28,x				;$B8AE68
	AND.w #$0202				;$B8AE6A
	CMP.w #$0202				;$B8AE6D
	BNE.b CODE_B8AE7E			;$B8AE70
	LDA.w #$002D				;$B8AE72
	STA.b $38,x				;$B8AE75
	LDA.w #$0000				;$B8AE77
	JSL.l set_anim_handle_animal_and_kiddy	;$B8AE7A
CODE_B8AE7E:
	JMP.w CODE_B8A075			;$B8AE7E

kong_state_31:
	LDA.w #$0001				;$B8AE81
	JSR.w CODE_B8CC29			;$B8AE84
	LDA.w #$0004				;$B8AE87
	JSL.l interpolate_x_speed		;$B8AE8A
	JSR.w CODE_B89F50			;$B8AE8E
	JMP.w CODE_B8A075			;$B8AE91

kong_state_32:
	LDA.w #$002B				;$B8AE94
	JSL.l CODE_B882B6			;$B8AE97
	JSR.w CODE_B8A035			;$B8AE9B
	JSR.w CODE_B8A04C			;$B8AE9E
	JSL.l CODE_B9E018			;$B8AEA1
	JSR.w CODE_B8E1FB			;$B8AEA5
	JSR.w CODE_B8E0FE			;$B8AEA8
	JSR.w CODE_B8C4F8			;$B8AEAB
	JSL.l process_sprite_animation		;$B8AEAE
	JMP.w CODE_B8A075			;$B8AEB2

kong_state_33:
	LDA.w $003A,y				;$B8AEB5
	AND.w #$FFFB				;$B8AEB8
	STA.w $003A,y				;$B8AEBB
	LDX.w active_kong_sprite		;$B8AEBE
	LDA.b $29,x				;$B8AEC1
	AND.w #$0010				;$B8AEC3
	BEQ.b CODE_B8AECE			;$B8AEC6
	LDA.w #$0002				;$B8AEC8
	TSB.w $1927				;$B8AECB
CODE_B8AECE:
	JSR.w CODE_B8F0E0			;$B8AECE
	JSR.w CODE_B8F1A2			;$B8AED1
	JSL.l process_sprite_animation		;$B8AED4
	JMP.w CODE_B8A075			;$B8AED8

kong_state_34:
	JSR.w CODE_B8F0E0			;$B8AEDB
	JSR.w CODE_B8F1A2			;$B8AEDE
	JSL.l process_sprite_animation		;$B8AEE1
	LDA.w $1925				;$B8AEE5
	INC					;$B8AEE8
	INC					;$B8AEE9
	AND.w #$003F				;$B8AEEA
	CMP.w $1923				;$B8AEED
	BNE.b CODE_B8AF0E			;$B8AEF0
	LDX.w active_kong_sprite		;$B8AEF2
	LDA.b $38,x				;$B8AEF5
	CMP.w #$001C				;$B8AEF7
	BEQ.b CODE_B8AF01			;$B8AEFA
	CMP.w #$003C				;$B8AEFC
	BNE.b CODE_B8AF0E			;$B8AEFF
CODE_B8AF01:
	LDX.b current_sprite			;$B8AF01
	STZ.b $24,x				;$B8AF03
	STZ.b $20,x				;$B8AF05
	STZ.b $5C,x				;$B8AF07
	LDA.w #$0035				;$B8AF09
	STA.b $38,x				;$B8AF0C
CODE_B8AF0E:
	JMP.w CODE_B8A075			;$B8AF0E

kong_state_35:
	LDX.b current_sprite			;$B8AF11
	LDY.b $5C,x				;$B8AF13
	BNE.b CODE_B8AF1A			;$B8AF15
	LDY.w follower_kong_sprite		;$B8AF17
CODE_B8AF1A:
	LDA.w $0012,y				;$B8AF1A
	STA.b $12,x				;$B8AF1D
	LDA.w $0016,y				;$B8AF1F
	STA.b $16,x				;$B8AF22
	JMP.w CODE_B8A09B			;$B8AF24

kong_state_36:
	LDA.w #$0002				;$B8AF27
	TSB.w $05AF				;$B8AF2A
	LDA.w #$0000				;$B8AF2D
	JSR.w CODE_B8CC29			;$B8AF30
	LDX.b current_sprite			;$B8AF33
	STZ.b $60,x				;$B8AF35
	JSR.w CODE_B89FED			;$B8AF37
	JMP.w CODE_B8A075			;$B8AF3A

kong_state_37:
	LDA.w #$0002				;$B8AF3D
	TSB.w $05AF				;$B8AF40
	JSL.l CODE_BBAB29			;$B8AF43
	BCC.b CODE_B8AF4F			;$B8AF47
	JSR.w CODE_B89F1E			;$B8AF49
	JMP.w CODE_B8A09B			;$B8AF4C

CODE_B8AF4F:
	LDX.b current_sprite			;$B8AF4F
	INC.b $60,x				;$B8AF51
	STZ.b $3A,x				;$B8AF53
	LDA.b $28,x				;$B8AF55
	AND.w #$0203				;$B8AF57
	CMP.w #$0003				;$B8AF5A
	BNE.b CODE_B8AF64			;$B8AF5D
	LDA.w #$F800				;$B8AF5F
	STA.b $2E,x				;$B8AF62
CODE_B8AF64:
	LDA.b $60,x				;$B8AF64
	ASL					;$B8AF66
	ASL					;$B8AF67
	ASL					;$B8AF68
	CMP.w #$0600				;$B8AF69
	BCC.b CODE_B8AF71			;$B8AF6C
	LDA.w #$0600				;$B8AF6E
CODE_B8AF71:
	STA.b $2A,x				;$B8AF71
	STA.b $30,x				;$B8AF73
	JSL.l CODE_B9E006			;$B8AF75
	LDY.w #$00C0				;$B8AF79
	LDA.b [$6A],y				;$B8AF7C
	STA.b $2A,x				;$B8AF7E
	STA.b $30,x				;$B8AF80
	JSR.w CODE_B89FED			;$B8AF82
	LDX.b current_sprite			;$B8AF85
	LDA.b $5E,x				;$B8AF87
	SEC					;$B8AF89
	SBC.b $12,x				;$B8AF8A
	CLC					;$B8AF8C
	ADC.w #$0004				;$B8AF8D
	CMP.w #$0008				;$B8AF90
	BCC.b CODE_B8AF9E			;$B8AF93
	STZ.b $5C,x				;$B8AF95
	LDA.b $12,x				;$B8AF97
	STA.b $5E,x				;$B8AF99
	JMP.w CODE_B8A09B			;$B8AF9B

CODE_B8AF9E:
	INC.b $5C,x				;$B8AF9E
	LDA.b $5C,x				;$B8AFA0
	CMP.w #$0008				;$B8AFA2
	BCS.b CODE_B8AFAA			;$B8AFA5
	JMP.w CODE_B8A09B			;$B8AFA7

CODE_B8AFAA:
	STZ.b $2E,x				;$B8AFAA
	STZ.b $2A,x				;$B8AFAC
	STZ.b $30,x				;$B8AFAE
	LDA.w #$0038				;$B8AFB0
	STA.b $38,x				;$B8AFB3
	LDA.w #$0022				;$B8AFB5
	JSL.l set_anim_handle_kiddy		;$B8AFB8
	JMP.w CODE_B8A09B			;$B8AFBC

kong_state_38:
	JSL.l CODE_BBAB29			;$B8AFBF
	BCS.b CODE_B8AFD2			;$B8AFC3
	JSR.w CODE_B8E1FB			;$B8AFC5
	JSR.w CODE_B8C5D9			;$B8AFC8
	JSL.l process_sprite_animation		;$B8AFCB
	JMP.w CODE_B8A09B			;$B8AFCF

CODE_B8AFD2:
	JSR.w CODE_B89F1E			;$B8AFD2
	JML [$04F5]				;$B8AFD5

kong_state_39:
	TYX					;$B8AFD8
	DEC.b $5C,x				;$B8AFD9
	BPL.b CODE_B8AFEC			;$B8AFDB
	LDA.w #$003A				;$B8AFDD
	STA.b $38,x				;$B8AFE0
	JSR.w CODE_B8C5A0			;$B8AFE2
	LDA.w #$007E				;$B8AFE5
	JSL.l set_anim_handle_kiddy		;$B8AFE8
CODE_B8AFEC:
	JML [$04F5]				;$B8AFEC

kong_state_3A:
	TYX					;$B8AFEF
	STZ.b $3A,x				;$B8AFF0
	JSR.w CODE_B8B086			;$B8AFF2
	BMI.b CODE_B8B004			;$B8AFF5
	JSR.w CODE_B8E0CA			;$B8AFF7
	JSR.w CODE_B8E0E4			;$B8AFFA
	JSL.l process_sprite_animation		;$B8AFFD
	JML [$04F5]				;$B8B001

CODE_B8B004:
	JSL.l disable_timestop			;$B8B004
	LDA.w #$4000				;$B8B008
	TRB.w $05AF				;$B8B00B
	LDX.b current_sprite			;$B8B00E
	LDA.w #$8000				;$B8B010
	STA.b $10,x				;$B8B013
	STA.b $14,x				;$B8B015
	LDY.w active_kong_sprite		;$B8B017
	LDA.b $0E,x				;$B8B01A
	PHA					;$B8B01C
	LDA.w $000E,y				;$B8B01D
	STA.b $0E,x				;$B8B020
	PLA					;$B8B022
	STA.w $000E,y				;$B8B023
	JSL.l CODE_B89C5C			;$B8B026
	JSL.l CODE_BB85FD			;$B8B02A
	JSR.w CODE_B8C5A0			;$B8B02E
	JSL.l CODE_B8E15A			;$B8B031
	JSL.l CODE_B8E198			;$B8B035
	LDY.b current_kong_control_variables	;$B8B039
	LDA.b active_frame_counter		;$B8B03B
	STA.w $0012,y				;$B8B03D
	LDA.w #$0008				;$B8B040
	JSL.l set_anim_handle_kiddy		;$B8B043
	LDX.b current_sprite			;$B8B047
	LDA.w #$0002				;$B8B049
	STA.b $38,x				;$B8B04C
	LDX.w active_kong_sprite		;$B8B04E
	LDA.w $1939				;$B8B051
	STA.b $2A,x				;$B8B054
	LDA.w #$F600				;$B8B056
	STA.b $2E,x				;$B8B059
	JSR.w check_sprite_underwater		;$B8B05B
	CMP.w #$0002				;$B8B05E
	BNE.b CODE_B8B06A			;$B8B061
	LDX.b current_sprite			;$B8B063
	LDA.w #$FE00				;$B8B065
	STA.b $2E,x				;$B8B068
CODE_B8B06A:
	LDA.w current_game_mode			;$B8B06A
	CMP.w #!gamemode_2_player_team		;$B8B06D
	BNE.b CODE_B8B083			;$B8B070
	LDA.w #$005A				;$B8B072
	STA.b $38,x				;$B8B075
	STZ.b $64,x				;$B8B077
	LDA.w #$0007				;$B8B079
	LDY.w #$0000				;$B8B07C
	JSL.l enable_timestop			;$B8B07F
CODE_B8B083:
	JMP.w CODE_B8A09B			;$B8B083

CODE_B8B086:
	LDX.b current_sprite			;$B8B086
	LDY.w #$0002				;$B8B088
	LDA.w $1931				;$B8B08B
	SEC					;$B8B08E
	SBC.b $12,x				;$B8B08F
	JSR.w CODE_B8B0A3			;$B8B091
	STA.b $2A,x				;$B8B094
	LDA.w $1935				;$B8B096
	SEC					;$B8B099
	SBC.b $16,x				;$B8B09A
	JSR.w CODE_B8B0A3			;$B8B09C
	STA.b $2E,x				;$B8B09F
	DEY					;$B8B0A1
	RTS					;$B8B0A2

CODE_B8B0A3:
	BEQ.b CODE_B8B0D1			;$B8B0A3
	BPL.b CODE_B8B0B3			;$B8B0A5
	EOR.w #$FFFF				;$B8B0A7
	INC					;$B8B0AA
	JSR.w CODE_B8B0B3			;$B8B0AB
	EOR.w #$FFFF				;$B8B0AE
	INC					;$B8B0B1
	RTS					;$B8B0B2

CODE_B8B0B3:
	CMP.w #$0080				;$B8B0B3
	BCS.b CODE_B8B0C7			;$B8B0B6
	CMP.w #$0004				;$B8B0B8
	BCC.b CODE_B8B0CF			;$B8B0BB
	ASL					;$B8B0BD
	ASL					;$B8B0BE
	ASL					;$B8B0BF
	ASL					;$B8B0C0
	CMP.w #$0300				;$B8B0C1
	BCC.b CODE_B8B0CB			;$B8B0C4
	RTS					;$B8B0C6

CODE_B8B0C7:
	LDA.w #$4000				;$B8B0C7
	RTS					;$B8B0CA

CODE_B8B0CB:
	LDA.w #$0300				;$B8B0CB
	RTS					;$B8B0CE

CODE_B8B0CF:
	XBA					;$B8B0CF
	RTS					;$B8B0D0

CODE_B8B0D1:
	DEY					;$B8B0D1
	RTS					;$B8B0D2

kong_state_3B:
	JSR.w CODE_B8F0E0			;$B8B0D3
	JSR.w CODE_B8F1A2			;$B8B0D6
	JSL.l process_sprite_animation		;$B8B0D9
	LDX.b current_sprite			;$B8B0DD
	DEC.b $5C,x				;$B8B0DF
	BEQ.b CODE_B8B100			;$B8B0E1
	LDA.b $60,x				;$B8B0E3
	CLC					;$B8B0E5
	ADC.b $62,x				;$B8B0E6
	STA.b $60,x				;$B8B0E8
	CLC					;$B8B0EA
	ADC.b $5E,x				;$B8B0EB
	STA.b $5E,x				;$B8B0ED
	AND.w #$FF00				;$B8B0EF
	BPL.b CODE_B8B0F7			;$B8B0F2
	ORA.w #$00FF				;$B8B0F4
CODE_B8B0F7:
	XBA					;$B8B0F7
	CLC					;$B8B0F8
	ADC.b $16,x				;$B8B0F9
	STA.b $16,x				;$B8B0FB
	JMP.w CODE_B8A075			;$B8B0FD

CODE_B8B100:
	LDY.b current_sprite			;$B8B100
	LDX.w active_kong_sprite		;$B8B102
	JSR.w CODE_B8EC88			;$B8B105
	LDA.w #$0033				;$B8B108
	STA.w $0038,y				;$B8B10B
	JSL.l disable_timestop			;$B8B10E
	JMP.w CODE_B8A075			;$B8B112

kong_state_3C:
	LDA.w $0474				;$B8B115
	AND.w #$BFFF				;$B8B118
	ORA.w #$A000				;$B8B11B
	STA.w $0474				;$B8B11E
	LDA.w $005A,y				;$B8B121
	ASL					;$B8B124
	TAX					;$B8B125
	JMP.w (DATA_B8B129,x)			;$B8B126

DATA_B8B129:
	dw CODE_B8B137
	dw CODE_B8B15C
	dw CODE_B8B16B
	dw CODE_B8B1AD
	dw CODE_B8B1C8
	dw CODE_B8B203
	dw CODE_B8B229

CODE_B8B137:
	LDA.l CODE_B9B73F			;$B8B137
	STA.w $0024,y				;$B8B13B
	LDA.w #$00BC				;$B8B13E
	STA.w $003A,y				;$B8B141
	LDX.b current_sprite			;$B8B144
	STZ.b $30,x				;$B8B146
	STZ.b $2A,x				;$B8B148
	LDA.w #$0180				;$B8B14A
	STA.b $2E,x				;$B8B14D
	INC.b $5A,x				;$B8B14F
	LDA.b active_frame_counter		;$B8B151
	STA.b $5E,x				;$B8B153
	LDA.b $2E,x				;$B8B155
	STA.b $60,x				;$B8B157
	JSR.w CODE_B8B30E			;$B8B159
CODE_B8B15C:
	LDA.w #$0001				;$B8B15C
	TSB.w $1927				;$B8B15F
	LDA.w #$0002				;$B8B162
	TSB.w $05AF				;$B8B165
	JMP.w CODE_B8A075			;$B8B168

CODE_B8B16B:
	LDA.w $0060,y				;$B8B16B
	AND.w $002E,y				;$B8B16E
	BPL.b CODE_B8B17F			;$B8B171
	LDA.w #$8000				;$B8B173
	TSB.w $194F				;$B8B176
	LDA.w #$00B8				;$B8B179
	STA.w $003A,y				;$B8B17C
CODE_B8B17F:
	LDX.b $5C,y				;$B8B17F
	LDA.b $5E,x				;$B8B181
	ORA.b $62,x				;$B8B183
	ORA.b $66,x				;$B8B185
	BNE.b CODE_B8B192			;$B8B187
	TYX					;$B8B189
	INC.b $5A,x				;$B8B18A
	LDA.w #$8000				;$B8B18C
	TRB.w $194F				;$B8B18F
CODE_B8B192:
	LDA.w #$0001				;$B8B192
	JSR.w CODE_B8CC29			;$B8B195
	JSR.w CODE_B8B461			;$B8B198
	JSR.w CODE_B8B30E			;$B8B19B
	JSR.w CODE_B8A035			;$B8B19E
	JSR.w CODE_B8B3CE			;$B8B1A1
	JSR.w CODE_B8B32D			;$B8B1A4
	JSR.w CODE_B89FC6			;$B8B1A7
	JMP.w CODE_B8A075			;$B8B1AA

CODE_B8B1AD:
	LDA.w #$0018				;$B8B1AD
	JSR.w CODE_B8CC29			;$B8B1B0
	JSR.w CODE_B8B461			;$B8B1B3
	JSR.w CODE_B8B30E			;$B8B1B6
	JSR.w CODE_B8A035			;$B8B1B9
	JSR.w CODE_B8B3CE			;$B8B1BC
	JSR.w CODE_B8B32D			;$B8B1BF
	JSR.w CODE_B89FC6			;$B8B1C2
	JMP.w CODE_B8A075			;$B8B1C5

CODE_B8B1C8:
	LDA.w #$0018				;$B8B1C8
	JSR.w CODE_B8CC29			;$B8B1CB
	JSR.w CODE_B8DE74			;$B8B1CE
	JSR.w CODE_B8B461			;$B8B1D1
	JSR.w CODE_B8B30E			;$B8B1D4
	JSR.w CODE_B8A035			;$B8B1D7
	JSR.w CODE_B8B3CE			;$B8B1DA
	LDX.b current_sprite			;$B8B1DD
	LDA.w #$1880				;$B8B1DF
	CMP.b $16,x				;$B8B1E2
	BCS.b CODE_B8B1EF			;$B8B1E4
	LDA.w #$02E0				;$B8B1E6
	CMP.b $12,x				;$B8B1E9
	BCC.b CODE_B8B1EF			;$B8B1EB
	STA.b $12,x				;$B8B1ED
CODE_B8B1EF:
	JSR.w CODE_B8B32D			;$B8B1EF
	JSR.w CODE_B89FC6			;$B8B1F2
	LDX.b current_sprite			;$B8B1F5
	LDA.b $16,x				;$B8B1F7
	CMP.w #$0360				;$B8B1F9
	BCS.b CODE_B8B200			;$B8B1FC
	INC.b $5A,x				;$B8B1FE
CODE_B8B200:
	JMP.w CODE_B8A075			;$B8B200

CODE_B8B203:
	LDA.w #$00B8				;$B8B203
	STA.w $003A,y				;$B8B206
	LDA.w #$0001				;$B8B209
	JSR.w CODE_B8CC29			;$B8B20C
	LDA.w #$0100				;$B8B20F
	CMP.w $18E9				;$B8B212
	BCC.b CODE_B8B21A			;$B8B215
	STA.w $18E9				;$B8B217
CODE_B8B21A:
	JSR.w CODE_B8B235			;$B8B21A
	JSR.w CODE_B8B3CE			;$B8B21D
	JSR.w CODE_B8B32D			;$B8B220
	JSR.w CODE_B89FC6			;$B8B223
	JMP.w CODE_B8A075			;$B8B226

CODE_B8B229:
	LDA.w #$0001				;$B8B229
	JSR.w CODE_B8CC29			;$B8B22C
	JSR.w CODE_B89FC6			;$B8B22F
	JMP.w CODE_B8A075			;$B8B232

CODE_B8B235:
	LDX.b current_sprite			;$B8B235
	LDA.b $2E,x				;$B8B237
	BMI.b CODE_B8B276			;$B8B239
	JSR.w CODE_B8DE36			;$B8B23B
	JSR.w CODE_B8DE55			;$B8B23E
	LDA.b $2E,x				;$B8B241
	CLC					;$B8B243
	ADC.w #$0008				;$B8B244
	CMP.w #$0080				;$B8B247
	BCC.b CODE_B8B24F			;$B8B24A
	LDA.w #$0080				;$B8B24C
CODE_B8B24F:
	STA.b $2E,x				;$B8B24F
	LDA.b $16,x				;$B8B251
	CMP.w #$02C0				;$B8B253
	BNE.b CODE_B8B275			;$B8B256
	STZ.b $2A,x				;$B8B258
	STZ.b $2E,x				;$B8B25A
	INC.b $5A,x				;$B8B25C
	LDY.b $5C,x				;$B8B25E
	LDA.w #$0005				;$B8B260
	STA.w $0038,y				;$B8B263
	LDA.w #$000F				;$B8B266
	STA.w $006A,y				;$B8B269
	LDA.w #$0001				;$B8B26C
	STA.w $18E9				;$B8B26F
	STZ.w $18EB				;$B8B272
CODE_B8B275:
	RTS					;$B8B275

CODE_B8B276:
	LDY.w #$0010				;$B8B276
	JSL.l CODE_BEC045			;$B8B279
	CLC					;$B8B27D
	ADC.w #$02A0				;$B8B27E
	CMP.b $16,x				;$B8B281
	BCC.b CODE_B8B294			;$B8B283
	TYA					;$B8B285
	ADC.b $2E,x				;$B8B286
	STA.b $2E,x				;$B8B288
	LDY.b $5C,x				;$B8B28A
	LDA.w #$0000				;$B8B28C
	STA.w $005E,y				;$B8B28F
	BRA.b CODE_B8B297			;$B8B292

CODE_B8B294:
	JSR.w CODE_B8DE74			;$B8B294
CODE_B8B297:
	LDA.w #$0210				;$B8B297
	SEC					;$B8B29A
	SBC.b $12,x				;$B8B29B
	STA.b $3E				;$B8B29D
	BNE.b CODE_B8B2AF			;$B8B29F
	LDA.b $2A,x				;$B8B2A1
	CLC					;$B8B2A3
	ADC.w #$0080				;$B8B2A4
	CMP.w #$0100				;$B8B2A7
	BCS.b CODE_B8B2AF			;$B8B2AA
	STZ.b $2A,x				;$B8B2AC
	RTS					;$B8B2AE

CODE_B8B2AF:
	LDA.b $2A,x				;$B8B2AF
	BNE.b CODE_B8B2B9			;$B8B2B1
	BIT.b $3E				;$B8B2B3
	BPL.b CODE_B8B2B9			;$B8B2B5
	DEC.b $2A,x				;$B8B2B7
CODE_B8B2B9:
	LDA.w #$000C				;$B8B2B9
	BIT.b $2A,x				;$B8B2BC
	BMI.b CODE_B8B2C3			;$B8B2BE
	LDA.w #$FFF4				;$B8B2C0
CODE_B8B2C3:
	STA.b $40				;$B8B2C3
	LDA.b $2A,x				;$B8B2C5
	EOR.b $3E				;$B8B2C7
	BMI.b CODE_B8B2E9			;$B8B2C9
	LDA.b $3E				;$B8B2CB
	BPL.b CODE_B8B2D5			;$B8B2CD
	EOR.w #$FFFF				;$B8B2CF
	INC					;$B8B2D2
	STA.b $3E				;$B8B2D3
CODE_B8B2D5:
	LDA.b $2A,x				;$B8B2D5
	LDY.b $40				;$B8B2D7
	JSL.l CODE_BEC045			;$B8B2D9
	CMP.b $3E				;$B8B2DD
	BCS.b CODE_B8B2E9			;$B8B2DF
	LDA.b $40				;$B8B2E1
	EOR.w #$FFFF				;$B8B2E3
	INC					;$B8B2E6
	STA.b $40				;$B8B2E7
CODE_B8B2E9:
	LDA.b $2A,x				;$B8B2E9
	CLC					;$B8B2EB
	ADC.b $40				;$B8B2EC
	BPL.b CODE_B8B2FA			;$B8B2EE
	CMP.w #$FF00				;$B8B2F0
	BCS.b CODE_B8B302			;$B8B2F3
	LDA.w #$FF00				;$B8B2F5
	BRA.b CODE_B8B302			;$B8B2F8

CODE_B8B2FA:
	CMP.w #$0100				;$B8B2FA
	BCC.b CODE_B8B302			;$B8B2FD
	LDA.w #$0100				;$B8B2FF
CODE_B8B302:
	STA.b $2A,x				;$B8B302
	BIT.b $40				;$B8B304
	BMI.b CODE_B8B30B			;$B8B306
	JMP.w CODE_B8DE36			;$B8B308

CODE_B8B30B:
	JMP.w CODE_B8DE55			;$B8B30B

CODE_B8B30E:
	LDX.b current_kong_control_variables	;$B8B30E
	LDY.w #$0190				;$B8B310
	LDA.b [$6A],y				;$B8B313
	STA.b $0A,x				;$B8B315
	LDY.w #$01A0				;$B8B317
	LDA.w $18EB				;$B8B31A
	XBA					;$B8B31D
	CLC					;$B8B31E
	ADC.w $18E9				;$B8B31F
	DEC					;$B8B322
	BNE.b CODE_B8B328			;$B8B323
	LDY.w #$01A8				;$B8B325
CODE_B8B328:
	LDA.b [$6A],y				;$B8B328
	STA.b $08,x				;$B8B32A
	RTS					;$B8B32C

CODE_B8B32D:
	LDX.b current_sprite			;$B8B32D
	LDA.b $2A,x				;$B8B32F
	BPL.b CODE_B8B337			;$B8B331
	EOR.w #$FFFF				;$B8B333
	INC					;$B8B336
CODE_B8B337:
	ASL					;$B8B337
	ASL					;$B8B338
	ASL					;$B8B339
	ASL					;$B8B33A
	XBA					;$B8B33B
	SEP.b #$20				;$B8B33C
	STA.w CPU.multiply_A			;$B8B33E
	LDA.b #$20				;$B8B341
	STA.w CPU.multiply_B			;$B8B343
	REP.b #$20				;$B8B346
	LDA.w $04A8				;$B8B348
	LSR					;$B8B34B
	STA.b $1A				;$B8B34C
	LDA.w CPU.multiply_result		;$B8B34E
	ASL					;$B8B351
	ASL					;$B8B352
	ASL					;$B8B353
	AND.w #$FF00				;$B8B354
	CMP.w #$3000				;$B8B357
	BCC.b CODE_B8B35F			;$B8B35A
	LDA.w #$3000				;$B8B35C
CODE_B8B35F:
	BIT.b $2A,x				;$B8B35F
	BMI.b CODE_B8B367			;$B8B361
	EOR.w #$FFFF				;$B8B363
	INC					;$B8B366
CODE_B8B367:
	CLC					;$B8B367
	ADC.w #$4000				;$B8B368
	SEC					;$B8B36B
	SBC.b $1A				;$B8B36C
	STA.w $04AA				;$B8B36E
	LDA.b $2E,x				;$B8B371
	CLC					;$B8B373
	ADC.w #$0040				;$B8B374
	CMP.w #$0080				;$B8B377
	BCC.b CODE_B8B38B			;$B8B37A
	AND.w #$8000				;$B8B37C
	EOR.b $60,x				;$B8B37F
	BPL.b CODE_B8B38B			;$B8B381
	EOR.b $60,x				;$B8B383
	STA.b $60,x				;$B8B385
	LDA.b active_frame_counter		;$B8B387
	STA.b $5E,x				;$B8B389
CODE_B8B38B:
	LDA.b $5E,x				;$B8B38B
	SEC					;$B8B38D
	SBC.b active_frame_counter		;$B8B38E
	CMP.w #$000F				;$B8B390
	BCC.b CODE_B8B3CD			;$B8B393
	LDA.b $60,x				;$B8B395
	BPL.b CODE_B8B3AE			;$B8B397
	LDA.w $04AE				;$B8B399
	CLC					;$B8B39C
	ADC.w #$0040				;$B8B39D
	BMI.b CODE_B8B3AA			;$B8B3A0
	CMP.w #$2000				;$B8B3A2
	BCC.b CODE_B8B3AA			;$B8B3A5
	LDA.w #$2000				;$B8B3A7
CODE_B8B3AA:
	STA.w $04AE				;$B8B3AA
	RTS					;$B8B3AD

CODE_B8B3AE:
	LDA.b $28,x				;$B8B3AE
	LSR					;$B8B3B0
	LDA.w #$E800				;$B8B3B1
	BCC.b CODE_B8B3B9			;$B8B3B4
	LDA.w #$FFFF				;$B8B3B6
CODE_B8B3B9:
	STA.b $3E				;$B8B3B9
	LDA.w $04AE				;$B8B3BB
	SEC					;$B8B3BE
	SBC.w #$0040				;$B8B3BF
	BPL.b CODE_B8B3CA			;$B8B3C2
	CMP.b $3E				;$B8B3C4
	BCS.b CODE_B8B3CA			;$B8B3C6
	LDA.b $3E				;$B8B3C8
CODE_B8B3CA:
	STA.w $04AE				;$B8B3CA
CODE_B8B3CD:
	RTS					;$B8B3CD

CODE_B8B3CE:
	LDX.b current_sprite			;$B8B3CE
	LDA.b $2E,x				;$B8B3D0
	PHA					;$B8B3D2
	JSL.l CODE_B9E006			;$B8B3D3
	LDX.b current_sprite			;$B8B3D7
	PLA					;$B8B3D9
	CMP.b $2E,x				;$B8B3DA
	BNE.b CODE_B8B3DF			;$B8B3DC
	RTS					;$B8B3DE

CODE_B8B3DF:
	STA.b $3E				;$B8B3DF
	LDA.b $1A,x				;$B8B3E1
	CMP.w #$0040				;$B8B3E3
	BCS.b CODE_B8B405			;$B8B3E6
	LDA.b $3E				;$B8B3E8
	BMI.b CODE_B8B402			;$B8B3EA
	LDY.w #$0198				;$B8B3EC
	CMP.b [$6A],y				;$B8B3EF
	BCS.b CODE_B8B41F			;$B8B3F1
	LDY.b $36,x				;$B8B3F3
	BEQ.b CODE_B8B3FA			;$B8B3F5
	LDA.w #$0000				;$B8B3F7
CODE_B8B3FA:
	CMP.w #$0180				;$B8B3FA
	BCC.b CODE_B8B402			;$B8B3FD
	LDA.w #$0180				;$B8B3FF
CODE_B8B402:
	STA.b $2E,x				;$B8B402
	RTS					;$B8B404

CODE_B8B405:
	LDA.b $3E				;$B8B405
	BPL.b CODE_B8B41C			;$B8B407
	LDY.w #$01B8				;$B8B409
	CMP.b [$6A],y				;$B8B40C
	BCC.b CODE_B8B41F			;$B8B40E
	EOR.w #$FFFF				;$B8B410
	LSR					;$B8B413
	CMP.w #$0100				;$B8B414
	BCS.b CODE_B8B41C			;$B8B417
	LDA.w #$0100				;$B8B419
CODE_B8B41C:
	STA.b $2E,x				;$B8B41C
	RTS					;$B8B41E

CODE_B8B41F:
	STZ.w $18E9				;$B8B41F
	STZ.w $18EB				;$B8B422
	LDX.b current_sprite			;$B8B425
	PHX					;$B8B427
	LDA.b $5C,x				;$B8B428
	STA.b current_sprite			;$B8B42A
	JSL.l delete_sprite_handle_deallocation	;$B8B42C
	INC.b $00,x				;$B8B430
	LDA.b $5C,x				;$B8B432
	TAX					;$B8B434
	JSL.l CODE_BB85E8			;$B8B435
	LDA.b $60,x				;$B8B439
	TAX					;$B8B43B
	JSL.l CODE_BB85E8			;$B8B43C
	LDA.b $64,x				;$B8B440
	TAX					;$B8B442
	JSL.l CODE_BB85E8			;$B8B443
	LDA.b $68,x				;$B8B447
	TAX					;$B8B449
	JSL.l CODE_BB85E8			;$B8B44A
	PHX					;$B8B44E
	JSL.l CODE_BEC030			;$B8B44F
	PLX					;$B8B453
	STZ.b $00,x				;$B8B454
	PLX					;$B8B456
	STX.b current_sprite			;$B8B457
	LDA.w #$0026				;$B8B459
	JSL.l CODE_B882B6			;$B8B45C
	RTS					;$B8B460

CODE_B8B461:
	LDY.b current_sprite			;$B8B461
	LDX.b $5C,y				;$B8B463
	LDA.b $5E,x				;$B8B465
	BEQ.b CODE_B8B482			;$B8B467
	LDX.b current_sprite			;$B8B469
	LDA.b $2E,x				;$B8B46B
	CLC					;$B8B46D
	LDY.w #$01C0				;$B8B46E
	ADC.b [$6A],y				;$B8B471
	BPL.b CODE_B8B47E			;$B8B473
	LDY.w #$01B0				;$B8B475
	CMP.b [$6A],y				;$B8B478
	BCS.b CODE_B8B47E			;$B8B47A
	LDA.b [$6A],y				;$B8B47C
CODE_B8B47E:
	STA.b $2E,x				;$B8B47E
	BRA.b CODE_B8B4B3			;$B8B480

CODE_B8B482:
	LDY.w #$0188				;$B8B482
	LDA.b [$6A],y				;$B8B485
	STA.b $3E				;$B8B487
	LDY.b current_sprite			;$B8B489
	LDA.w $002E,y				;$B8B48B
	SEC					;$B8B48E
	SBC.b $3E				;$B8B48F
	BMI.b CODE_B8B4B3			;$B8B491
	LDA.b $62,x				;$B8B493
	BEQ.b CODE_B8B49C			;$B8B495
	LDY.w #$01C8				;$B8B497
	LDA.b [$6A],y				;$B8B49A
CODE_B8B49C:
	LDY.b $66,x				;$B8B49C
	BEQ.b CODE_B8B4A6			;$B8B49E
	CLC					;$B8B4A0
	LDY.w #$01C8				;$B8B4A1
	ADC.b [$6A],y				;$B8B4A4
CODE_B8B4A6:
	LDX.b current_sprite			;$B8B4A6
	CLC					;$B8B4A8
	ADC.b $2E,x				;$B8B4A9
	CMP.b $3E				;$B8B4AB
	BCS.b CODE_B8B4B1			;$B8B4AD
	LDA.b $3E				;$B8B4AF
CODE_B8B4B1:
	STA.b $2E,x				;$B8B4B1
CODE_B8B4B3:
	LDY.b current_sprite			;$B8B4B3
	LDX.b $5C,y				;$B8B4B5
	LDA.w #$0006				;$B8B4B7
	LDY.b $5E,x				;$B8B4BA
	BEQ.b CODE_B8B4C2			;$B8B4BC
	CLC					;$B8B4BE
	ADC.w #$0015				;$B8B4BF
CODE_B8B4C2:
	LDY.b $62,x				;$B8B4C2
	BEQ.b CODE_B8B4CA			;$B8B4C4
	CLC					;$B8B4C6
	ADC.w #$0010				;$B8B4C7
CODE_B8B4CA:
	LDY.b $66,x				;$B8B4CA
	BEQ.b CODE_B8B4D2			;$B8B4CC
	CLC					;$B8B4CE
	ADC.w #$0010				;$B8B4CF
CODE_B8B4D2:
	PHA					;$B8B4D2
	LDA.w $18E9				;$B8B4D3
	SEC					;$B8B4D6
	SBC.b $01,S				;$B8B4D7
	BCC.b CODE_B8B4DD			;$B8B4D9
	BNE.b CODE_B8B4E6			;$B8B4DB
CODE_B8B4DD:
	STZ.b $5E,x				;$B8B4DD
	STZ.b $62,x				;$B8B4DF
	STZ.b $66,x				;$B8B4E1
	LDA.w #$0001				;$B8B4E3
CODE_B8B4E6:
	STA.w $18E9				;$B8B4E6
	PLA					;$B8B4E9
	JSR.w CODE_B8B585			;$B8B4EA
	LDY.b current_sprite			;$B8B4ED
	LDX.b $5C,y				;$B8B4EF
	LDA.b $66,x				;$B8B4F1
	BEQ.b CODE_B8B505			;$B8B4F3
	LDA.b $62,x				;$B8B4F5
	BNE.b CODE_B8B511			;$B8B4F7
	TYX					;$B8B4F9
	LDY.w #$01D0				;$B8B4FA
	LDA.b [$6A],y				;$B8B4FD
	EOR.w #$FFFF				;$B8B4FF
	INC					;$B8B502
	BRA.b CODE_B8B514			;$B8B503

CODE_B8B505:
	LDA.b $62,x				;$B8B505
	BEQ.b CODE_B8B511			;$B8B507
	TYX					;$B8B509
	LDY.w #$01D0				;$B8B50A
	LDA.b [$6A],y				;$B8B50D
	BRA.b CODE_B8B514			;$B8B50F

CODE_B8B511:
	LDA.w #$0000				;$B8B511
CODE_B8B514:
	STA.b $3E				;$B8B514
	LDX.b current_sprite			;$B8B516
	LDA.b $3E				;$B8B518
	ORA.b $1C				;$B8B51A
	BEQ.b CODE_B8B558			;$B8B51C
	LDA.b $2A,x				;$B8B51E
	CLC					;$B8B520
	ADC.b $3E				;$B8B521
	STA.b $2A,x				;$B8B523
	LDA.b $1A				;$B8B525
	SEC					;$B8B527
	SBC.b $2A,x				;$B8B528
	BEQ.b CODE_B8B568			;$B8B52A
	BMI.b CODE_B8B545			;$B8B52C
	LDA.b $2A,x				;$B8B52E
	AND.b $1A				;$B8B530
	BMI.b CODE_B8B568			;$B8B532
	LDA.b $2A,x				;$B8B534
	CLC					;$B8B536
	ADC.b $1C				;$B8B537
	STA.b $2A,x				;$B8B539
	BCC.b CODE_B8B568			;$B8B53B
CODE_B8B53D:
	LDA.b $1A				;$B8B53D
	BNE.b CODE_B8B568			;$B8B53F
	STA.b $2A,x				;$B8B541
	BRA.b CODE_B8B568			;$B8B543

CODE_B8B545:
	LDA.b $1A				;$B8B545
	BEQ.b CODE_B8B54D			;$B8B547
	ORA.b $2A,x				;$B8B549
	BPL.b CODE_B8B568			;$B8B54B
CODE_B8B54D:
	LDA.b $2A,x				;$B8B54D
	SEC					;$B8B54F
	SBC.b $1C				;$B8B550
	STA.b $2A,x				;$B8B552
	BCC.b CODE_B8B53D			;$B8B554
	BRA.b CODE_B8B568			;$B8B556

CODE_B8B558:
	LDA.b $2A,x				;$B8B558
	BEQ.b CODE_B8B564			;$B8B55A
	BPL.b CODE_B8B561			;$B8B55C
	INC					;$B8B55E
	BRA.b CODE_B8B566			;$B8B55F

CODE_B8B561:
	DEC					;$B8B561
	BRA.b CODE_B8B566			;$B8B562

CODE_B8B564:
	LDA.b $2A,x				;$B8B564
CODE_B8B566:
	STA.b $2A,x				;$B8B566
CODE_B8B568:
	LDA.b $2A,x				;$B8B568
	BPL.b CODE_B8B57B			;$B8B56A
	LDA.w #$0001				;$B8B56C
	LDY.w #$01D8				;$B8B56F
	SBC.b [$6A],y				;$B8B572
	CMP.b $2A,x				;$B8B574
	BCC.b CODE_B8B584			;$B8B576
CODE_B8B578:
	STA.b $2A,x				;$B8B578
	RTS					;$B8B57A

CODE_B8B57B:
	LDY.w #$01D8				;$B8B57B
	LDA.b [$6A],y				;$B8B57E
	CMP.b $2A,x				;$B8B580
	BCC.b CODE_B8B578			;$B8B582
CODE_B8B584:
	RTS					;$B8B584

CODE_B8B585:
	LDX.b current_sprite			;$B8B585
	LDA.b $28,x				;$B8B587
	LSR					;$B8B589
	BNE.b CODE_B8B591			;$B8B58A
	STZ.b $1A				;$B8B58C
	STZ.b $1C				;$B8B58E
	RTS					;$B8B590

CODE_B8B591:
	LDA.b $1C,x				;$B8B591
	AND.w #$0007				;$B8B593
	TXY					;$B8B596
	ASL					;$B8B597
	ASL					;$B8B598
	TAX					;$B8B599
	LDA.l DATA_B8B5B5,x			;$B8B59A
	STA.b $1A				;$B8B59E
	LDA.l DATA_B8B5B5+$02,x			;$B8B5A0
	STA.b $1C				;$B8B5A4
	LDX.b current_sprite			;$B8B5A6
	BIT.b $1C,x				;$B8B5A8
	BPL.b CODE_B8B5B4			;$B8B5AA
	LDA.b $1A				;$B8B5AC
	EOR.w #$FFFF				;$B8B5AE
	INC					;$B8B5B1
	STA.b $1A				;$B8B5B2
CODE_B8B5B4:
	RTS					;$B8B5B4

DATA_B8B5B5:
	dw $0000,$0002,$FFE0,$0004,$FFC0,$0008,$FFA0,$000C
	dw $FF80,$0010,$FF00,$0020,$FF00,$0020,$FF00,$0020

kong_state_3D:
	LDA.w #$0002				;$B8B5D5
	TSB.w $05AF				;$B8B5D8
	JSR.w CODE_B89FCB			;$B8B5DB
	LDY.w follower_kong_sprite		;$B8B5DE
	LDA.w $0038,y				;$B8B5E1
	CMP.w #$0040				;$B8B5E4
	BNE.b CODE_B8B5ED			;$B8B5E7
	JSL.l CODE_B8EFE7			;$B8B5E9
CODE_B8B5ED:
	JMP.w CODE_B8A075			;$B8B5ED

kong_state_3E:
	LDA.w #$0002				;$B8B5F0
	TSB.w $1927				;$B8B5F3
	JSR.w CODE_B8F0E0			;$B8B5F6
	LDA.w $1925				;$B8B5F9
	INC					;$B8B5FC
	INC					;$B8B5FD
	AND.w #$003F				;$B8B5FE
	CMP.w $1923				;$B8B601
	BNE.b CODE_B8B60D			;$B8B604
	LDX.b current_sprite			;$B8B606
	LDA.w #$0040				;$B8B608
	STA.b $38,x				;$B8B60B
CODE_B8B60D:
	JSL.l process_sprite_animation		;$B8B60D
	JMP.w CODE_B8A075			;$B8B611

kong_state_3F:
	LDA.w #$0019				;$B8B614
	JSR.w CODE_B8CC29			;$B8B617
	JSR.w CODE_B8CBB2			;$B8B61A
	JSR.w CODE_B89FAE			;$B8B61D
	JSL.l CODE_B8EFE7			;$B8B620
	JMP.w CODE_B8A075			;$B8B624

kong_state_40:
	JMP.w CODE_B8A09B			;$B8B627

kong_state_41:
	JSR.w CODE_B89FCB			;$B8B62A
	JMP.w CODE_B8A075			;$B8B62D

kong_state_42:
	JSR.w CODE_B8A035			;$B8B630
	JSR.w CODE_B8E1FB			;$B8B633
	BIT.b $2E,x				;$B8B636
	BMI.b CODE_B8B64A			;$B8B638
	LDA.w #$00D8				;$B8B63A
	JSR.w CODE_B8829F			;$B8B63D
	LDY.w active_kong_sprite		;$B8B640
	LDA.b $16,x				;$B8B643
	CMP.w $0016,y				;$B8B645
	BCS.b CODE_B8B654			;$B8B648
CODE_B8B64A:
	JSR.w CODE_B8C5D9			;$B8B64A
	JSL.l process_anim_preserve_state	;$B8B64D
	JMP.w CODE_B8A075			;$B8B651

CODE_B8B654:
	JSL.l CODE_B89C4C			;$B8B654
	JSL.l CODE_B9A595			;$B8B658
	JSL.l CODE_B89C3C			;$B8B65C
	LDA.w #$0033				;$B8B660
	STA.b $38,x				;$B8B663
	LDA.w #$00D8				;$B8B665
	JSR.w CODE_B8829F			;$B8B668
	LDA.w #$001F				;$B8B66B
	LDX.w #$0002				;$B8B66E
	LDY.w #$0000				;$B8B671
	JSL.l CODE_B8F028			;$B8B674
	JMP.w CODE_B8A075			;$B8B678

kong_state_43:
	LDA.w #$001A				;$B8B67B
	JSR.w CODE_B8CC29			;$B8B67E
	JSR.w CODE_B8E0AE			;$B8B681
	JSR.w CODE_B8E0BF			;$B8B684
	JSR.w CODE_B89FAE			;$B8B687
	JSL.l CODE_B8EFE7			;$B8B68A
	JSR.w CODE_B8C681			;$B8B68E
	JMP.w CODE_B8A075			;$B8B691

kong_state_44:
	LDA.w #$001B				;$B8B694
	JSR.w CODE_B8CC29			;$B8B697
	JSR.w CODE_B8E0AE			;$B8B69A
	JSR.w CODE_B8E0BF			;$B8B69D
	JSR.w CODE_B89FAE			;$B8B6A0
	JSL.l CODE_B8EFE7			;$B8B6A3
	JSR.w CODE_B8C681			;$B8B6A7
	JMP.w CODE_B8A075			;$B8B6AA

kong_state_45:
	LDA.w #$001C				;$B8B6AD
	JSR.w CODE_B8CC29			;$B8B6B0
	JSR.w CODE_B89FCB			;$B8B6B3
	JSL.l CODE_B8EFE7			;$B8B6B6
	JSR.w CODE_B89FC6			;$B8B6BA
	JMP.w CODE_B8A075			;$B8B6BD

kong_state_46:
	LDA.w #$001C				;$B8B6C0
	JSR.w CODE_B8CC29			;$B8B6C3
	JSR.w CODE_B89FAE			;$B8B6C6
	JMP.w CODE_B8A075			;$B8B6C9

kong_state_47:
	JSL.l CODE_B8E179			;$B8B6CC
	JSL.l CODE_B8E198			;$B8B6D0
	JSR.w CODE_B8A035			;$B8B6D4
	LDA.w #$0003				;$B8B6D7
	JSL.l interpolate_x_speed		;$B8B6DA
	JSL.l CODE_B9E006			;$B8B6DE
	JSL.l process_sprite_animation		;$B8B6E2
	LDA.w #$0006				;$B8B6E6
	JSL.l CODE_BCE2CE			;$B8B6E9
	JSL.l CODE_BCE2D7			;$B8B6ED
	LDX.b current_sprite			;$B8B6F1
	LDA.b $28,x				;$B8B6F3
	AND.w #$0101				;$B8B6F5
	BNE.b CODE_B8B70D			;$B8B6F8
	JSR.w CODE_B8B729			;$B8B6FA
	JSR.w check_sprite_underwater		;$B8B6FD
	CMP.w #$0002				;$B8B700
	BEQ.b CODE_B8B723			;$B8B703
	JSR.w CODE_B8B74F			;$B8B705
	BCS.b CODE_B8B723			;$B8B708
CODE_B8B70A:
	JMP.w CODE_B8A09B			;$B8B70A

CODE_B8B70D:
	JSR.w CODE_B8C56B			;$B8B70D
	BCC.b CODE_B8B70A			;$B8B710
	LDA.w #$0034				;$B8B712
	JSL.l set_anim_handle_kiddy		;$B8B715
	LDA.w #$004A				;$B8B719
	STA.b $38,x				;$B8B71C
	STZ.b $2A,x				;$B8B71E
	JMP.w CODE_B8A09B			;$B8B720

CODE_B8B723:
	JSR.w CODE_B8B946			;$B8B723
	JMP.w CODE_B8A09B			;$B8B726

CODE_B8B729:
	LDX.b current_sprite			;$B8B729
	LDA.w $196D				;$B8B72B
	CLC					;$B8B72E
	ADC.w #$0010				;$B8B72F
	CMP.b $12,x				;$B8B732
	BCC.b CODE_B8B741			;$B8B734
	STA.b $12,x				;$B8B736
	BIT.b $2A,x				;$B8B738
	BPL.b CODE_B8B74E			;$B8B73A
CODE_B8B73C:
	STZ.b $2A,x				;$B8B73C
	STZ.b $30,x				;$B8B73E
	RTS					;$B8B740

CODE_B8B741:
	ADC.w #$00E0				;$B8B741
	CMP.b $12,x				;$B8B744
	BCS.b CODE_B8B74E			;$B8B746
	STA.b $12,x				;$B8B748
	BIT.b $2A,x				;$B8B74A
	BPL.b CODE_B8B73C			;$B8B74C
CODE_B8B74E:
	RTS					;$B8B74E

CODE_B8B74F:
	LDX.b current_sprite			;$B8B74F
	LDA.b $16,x				;$B8B751
	SEC					;$B8B753
	SBC.w $1973				;$B8B754
	BCC.b CODE_B8B75C			;$B8B757
	CMP.w #$0100				;$B8B759
CODE_B8B75C:
	RTS					;$B8B75C

kong_state_48:
	LDA.w #$0002				;$B8B75D
	TSB.w $05AF				;$B8B760
	LDA.w #$0000				;$B8B763
	JSR.w CODE_B8CC29			;$B8B766
	JSR.w CODE_B89FCB			;$B8B769
	JMP.w CODE_B8A075			;$B8B76C

kong_state_49:
	JSL.l CODE_B8E198			;$B8B76F
	LDY.w #$0078				;$B8B773
	LDA.b [$6A],y				;$B8B776
	LDY.b current_kong_control_variables	;$B8B778
	STA.w $0008,y				;$B8B77A
	JSR.w CODE_B8A035			;$B8B77D
	LDX.b current_sprite			;$B8B780
	LDY.w $04FB				;$B8B782
	LDA.w $0004,y				;$B8B785
	AND.w #$0300				;$B8B788
	BEQ.b CODE_B8B79F			;$B8B78B
	LDY.w #$0068				;$B8B78D
	BIT.w #$0100				;$B8B790
	BNE.b CODE_B8B79D			;$B8B793
	LDA.b [$6A],y				;$B8B795
	EOR.w #$FFFF				;$B8B797
	INC					;$B8B79A
	BRA.b CODE_B8B79F			;$B8B79B

CODE_B8B79D:
	LDA.b [$6A],y				;$B8B79D
CODE_B8B79F:
	STA.b $30,x				;$B8B79F
	LDY.w #$0080				;$B8B7A1
	LDA.b [$6A],y				;$B8B7A4
	JSL.l interpolate_x_speed		;$B8B7A6
	JSR.w CODE_B8B729			;$B8B7AA
	JSL.l CODE_B9E006			;$B8B7AD
	JSL.l process_sprite_animation		;$B8B7B1
	LDA.w #$0006				;$B8B7B5
	JSL.l CODE_BCE2CE			;$B8B7B8
	JSL.l CODE_BCE2D7			;$B8B7BC
	LDX.b current_sprite			;$B8B7C0
	LDA.b $2E,x				;$B8B7C2
	BMI.b CODE_B8B7EC			;$B8B7C4
	JSR.w CODE_B8CB19			;$B8B7C6
	BCC.b CODE_B8B7CE			;$B8B7C9
	BRL CODE_B8B86F				;$B8B7CB

CODE_B8B7CE:
	JSR.w CODE_B8B89D			;$B8B7CE
	BCC.b CODE_B8B809			;$B8B7D1
	LDX.b current_sprite			;$B8B7D3
	LDA.b $28,x				;$B8B7D5
	AND.w #$0101				;$B8B7D7
	CMP.w #$0101				;$B8B7DA
	BEQ.b CODE_B8B813			;$B8B7DD
	JSR.w check_sprite_underwater		;$B8B7DF
	CMP.w #$0002				;$B8B7E2
	BEQ.b CODE_B8B85D			;$B8B7E5
	JSR.w CODE_B8B74F			;$B8B7E7
	BCS.b CODE_B8B85D			;$B8B7EA
CODE_B8B7EC:
	LDA.w $0775				;$B8B7EC
	BIT.w #$0004				;$B8B7EF
	BNE.b CODE_B8B7F7			;$B8B7F2
CODE_B8B7F4:
	JML [$04F5]				;$B8B7F4

CODE_B8B7F7:
	BIT.w #$0200				;$B8B7F7
	BEQ.b CODE_B8B806			;$B8B7FA
	LDX.w active_kong_sprite		;$B8B7FC
	LDA.b $0E,x				;$B8B7FF
	AND.w #$0040				;$B8B801
	BNE.b CODE_B8B7F4			;$B8B804
CODE_B8B806:
	JMP.w CODE_B8A09B			;$B8B806

CODE_B8B809:
	LDA.w #$0002				;$B8B809
	JSL.l CODE_B882B6			;$B8B80C
	JMP.w CODE_B8B7EC			;$B8B810

CODE_B8B813:
	JSR.w CODE_B8C56B			;$B8B813
	BCC.b CODE_B8B7EC			;$B8B816
	JSL.l CODE_B89C4C			;$B8B818
	LDX.b current_sprite			;$B8B81C
	LDA.w #$004E				;$B8B81E
	STA.b $38,x				;$B8B821
	LDA.w #$0100				;$B8B823
	STA.b $3A,x				;$B8B826
	LDA.w #$0037				;$B8B828
	JSL.l set_anim_handle_kiddy		;$B8B82B
	STZ.w $1929				;$B8B82F
	LDA.w #$0020				;$B8B832
	STA.w $192B				;$B8B835
	LDY.w active_kong_sprite		;$B8B838
	LDX.w follower_kong_sprite		;$B8B83B
	LDA.b $1A,x				;$B8B83E
	STA.w $001A,y				;$B8B840
	JSR.w CODE_B8EC88			;$B8B843
	JSL.l CODE_B89C3C			;$B8B846
	LDA.w #$004D				;$B8B84A
	STA.b $38,x				;$B8B84D
	STZ.b $2A,x				;$B8B84F
	STZ.b $30,x				;$B8B851
	LDA.w #$0001				;$B8B853
	JSL.l set_anim_handle_kiddy		;$B8B856
	JMP.w CODE_B8B7EC			;$B8B85A

CODE_B8B85D:
	JSL.l CODE_B89C4C			;$B8B85D
	JSL.l CODE_B9A595			;$B8B861
	JSL.l CODE_B89C3C			;$B8B865
	JSR.w CODE_B8B946			;$B8B869
	JMP.w CODE_B8B7EC			;$B8B86C

CODE_B8B86F:
	JSL.l CODE_B89C4C			;$B8B86F
	LDX.b current_sprite			;$B8B873
	LDA.w #$004E				;$B8B875
	STA.b $38,x				;$B8B878
	LDA.w #$0037				;$B8B87A
	JSL.l set_anim_handle_kiddy		;$B8B87D
	STZ.w $1929				;$B8B881
	LDA.w #$0020				;$B8B884
	STA.w $192B				;$B8B887
	JSL.l CODE_B89C3C			;$B8B88A
	LDA.w #$0053				;$B8B88E
	STA.b $38,x				;$B8B891
	LDA.w #$0016				;$B8B893
	JSL.l set_anim_handle_kiddy		;$B8B896
	JML [$04F5]				;$B8B89A

CODE_B8B89D:
	LDX.w follower_kong_sprite		;$B8B89D
	LDY.w active_kong_sprite		;$B8B8A0
	LDA.w $0012,y				;$B8B8A3
	SEC					;$B8B8A6
	SBC.b $12,x				;$B8B8A7
	CLC					;$B8B8A9
	ADC.w #$0018				;$B8B8AA
	CMP.w #$0030				;$B8B8AD
	BCS.b CODE_B8B8BF			;$B8B8B0
	LDA.w $0016,y				;$B8B8B2
	SEC					;$B8B8B5
	SBC.b $16,x				;$B8B8B6
	CLC					;$B8B8B8
	ADC.w #$0020				;$B8B8B9
	CMP.w #$0040				;$B8B8BC
CODE_B8B8BF:
	RTS					;$B8B8BF

kong_state_4A:
	JSR.w CODE_B8A035			;$B8B8C0
	LDA.w #$0007				;$B8B8C3
	JSL.l interpolate_x_speed		;$B8B8C6
	JSL.l CODE_B9E018			;$B8B8CA
	JSL.l CODE_B9E006			;$B8B8CE
	JSL.l process_sprite_animation		;$B8B8D2
	JSR.w CODE_B8C56B			;$B8B8D6
	BCC.b CODE_B8B8F9			;$B8B8D9
	JSL.l CODE_BCE2D7			;$B8B8DB
	JSR.w check_sprite_underwater		;$B8B8DF
	CMP.w #$0002				;$B8B8E2
	BEQ.b CODE_B8B8FC			;$B8B8E5
	JSR.w CODE_B8B923			;$B8B8E7
	BCC.b CODE_B8B8FC			;$B8B8EA
	LDX.b current_sprite			;$B8B8EC
	LDA.b $16,x				;$B8B8EE
	SEC					;$B8B8F0
	SBC.w $1973				;$B8B8F1
	CMP.w #$0120				;$B8B8F4
	BCS.b CODE_B8B902			;$B8B8F7
CODE_B8B8F9:
	JMP.w CODE_B8A09B			;$B8B8F9

CODE_B8B8FC:
	JSR.w CODE_B8B946			;$B8B8FC
	JMP.w CODE_B8A09B			;$B8B8FF

CODE_B8B902:
	LDA.b $28,x				;$B8B902
	AND.w #$0101				;$B8B904
	BEQ.b CODE_B8B917			;$B8B907
	LDA.w $04BE				;$B8B909
	CLC					;$B8B90C
	ADC.w #$0120				;$B8B90D
	CMP.b $16,x				;$B8B910
	BCC.b CODE_B8B917			;$B8B912
	JMP.w CODE_B8A09B			;$B8B914

CODE_B8B917:
	LDA.w #$4000				;$B8B917
	TRB.w $05AF				;$B8B91A
	JSR.w CODE_B89F1E			;$B8B91D
	JML [$04F5]				;$B8B920

CODE_B8B923:
	LDX.w follower_kong_sprite		;$B8B923
	LDY.w active_kong_sprite		;$B8B926
	LDA.w $0012,y				;$B8B929
	SEC					;$B8B92C
	SBC.b $12,x				;$B8B92D
	CLC					;$B8B92F
	ADC.w #$0010				;$B8B930
	CMP.w #$0020				;$B8B933
	BCS.b CODE_B8B945			;$B8B936
	LDA.w $0016,y				;$B8B938
	SEC					;$B8B93B
	SBC.b $16,x				;$B8B93C
	CLC					;$B8B93E
	ADC.w #$0020				;$B8B93F
	CMP.w #$0040				;$B8B942
CODE_B8B945:
	RTS					;$B8B945

CODE_B8B946:
	LDX.b current_sprite			;$B8B946
	LDA.w #$004B				;$B8B948
	STA.b $38,x				;$B8B94B
	LDA.w $196D				;$B8B94D
	SEC					;$B8B950
	SBC.w #$0010				;$B8B951
	CMP.b $12,x				;$B8B954
	BCS.b CODE_B8B95F			;$B8B956
	ADC.w #$0120				;$B8B958
	CMP.b $12,x				;$B8B95B
	BCS.b CODE_B8B961			;$B8B95D
CODE_B8B95F:
	STA.b $12,x				;$B8B95F
CODE_B8B961:
	LDA.w #$00D8				;$B8B961
	JSR.w CODE_B8829F			;$B8B964
	LDA.w #$001F				;$B8B967
	LDX.w #$0037				;$B8B96A
	LDY.w #$0000				;$B8B96D
	JSL.l CODE_B8F028			;$B8B970
	LDA.w #$0037				;$B8B974
	JSL.l set_anim_handle_kiddy		;$B8B977
	RTS					;$B8B97B

kong_state_4B:
	LDA.w #$0002				;$B8B97C
	TSB.w $1927				;$B8B97F
	JSR.w CODE_B8F0E0			;$B8B982
	JSL.l process_anim_preserve_state	;$B8B985
	LDA.w $1925				;$B8B989
	INC					;$B8B98C
	INC					;$B8B98D
	AND.w #$003F				;$B8B98E
	CMP.w $1923				;$B8B991
	BNE.b CODE_B8B99B			;$B8B994
	LDA.w #$0033				;$B8B996
	STA.b $38,x				;$B8B999
CODE_B8B99B:
	LDA.w $0775				;$B8B99B
	AND.w #$0200				;$B8B99E
	BNE.b CODE_B8B9A6			;$B8B9A1
	JMP.w CODE_B8A09B			;$B8B9A3

CODE_B8B9A6:
	LDY.w active_kong_sprite		;$B8B9A6
	LDA.w $000E,y				;$B8B9A9
	EOR.b $0E,x				;$B8B9AC
	LDY.w #$A000				;$B8B9AE
	AND.w #$0040				;$B8B9B1
	BEQ.b CODE_B8B9B9			;$B8B9B4
	LDY.w #$E000				;$B8B9B6
CODE_B8B9B9:
	STY.w $18B5				;$B8B9B9
	PHK					;$B8B9BC
	%return(CODE_B8B9C3)			;$B8B9BD
	JMP.w [$18B1]				;$B8B9C0

CODE_B8B9C3:
	JML [$04F5]				;$B8B9C3

kong_state_4C:
	JSR.w CODE_B8B9DF			;$B8B9C6
	JSR.w CODE_B8B9FB			;$B8B9C9
	BCS.b CODE_B8B9D5			;$B8B9CC
	JSL.l process_sprite_animation		;$B8B9CE
	JMP.w CODE_B8A09B			;$B8B9D2

CODE_B8B9D5:
	LDA.w #$0003				;$B8B9D5
	JSL.l CODE_B882B6			;$B8B9D8
	JMP.w CODE_B8A09B			;$B8B9DC

CODE_B8B9DF:
	LDX.b current_sprite			;$B8B9DF
	LDA.w #$FFE6				;$B8B9E1
	CPX.w $0503				;$B8B9E4
	BEQ.b CODE_B8B9EC			;$B8B9E7
	LDA.w #$FFE0				;$B8B9E9
CODE_B8B9EC:
	STA.w $1921				;$B8B9EC
	STZ.w $191F				;$B8B9EF
	RTS					;$B8B9F2

CODE_B8B9F3:
	LDX.w active_kong_sprite		;$B8B9F3
	LDY.w follower_kong_sprite		;$B8B9F6
	BRA.b CODE_B8BA01			;$B8B9F9

CODE_B8B9FB:
	LDX.w follower_kong_sprite		;$B8B9FB
	LDY.w active_kong_sprite		;$B8B9FE
CODE_B8BA01:
	LDA.w $1929				;$B8BA01
	BNE.b CODE_B8BA15			;$B8BA04
	LDA.b $12,x				;$B8BA06
	STA.w $192D				;$B8BA08
	LDA.b $16,x				;$B8BA0B
	STA.w $192F				;$B8BA0D
	INC.w $1929				;$B8BA10
	CLC					;$B8BA13
	RTS					;$B8BA14

CODE_B8BA15:
	CMP.w $192B				;$B8BA15
	BCS.b CODE_B8BA47			;$B8BA18
	LDA.w $0012,y				;$B8BA1A
	CLC					;$B8BA1D
	ADC.w $191F				;$B8BA1E
	SEC					;$B8BA21
	SBC.w $192D				;$B8BA22
	JSR.w CODE_B8BA5B			;$B8BA25
	CLC					;$B8BA28
	ADC.w $192D				;$B8BA29
	STA.b $12,x				;$B8BA2C
	LDA.w $0016,y				;$B8BA2E
	CLC					;$B8BA31
	ADC.w $1921				;$B8BA32
	SEC					;$B8BA35
	SBC.w $192F				;$B8BA36
	JSR.w CODE_B8BA5B			;$B8BA39
	CLC					;$B8BA3C
	ADC.w $192F				;$B8BA3D
	STA.b $16,x				;$B8BA40
	INC.w $1929				;$B8BA42
	CLC					;$B8BA45
	RTS					;$B8BA46

CODE_B8BA47:
	LDA.w $0012,y				;$B8BA47
	CLC					;$B8BA4A
	ADC.w $191F				;$B8BA4B
	STA.b $12,x				;$B8BA4E
	LDA.w $0016,y				;$B8BA50
	CLC					;$B8BA53
	ADC.w $1921				;$B8BA54
	STA.b $16,x				;$B8BA57
	SEC					;$B8BA59
	RTS					;$B8BA5A

CODE_B8BA5B:
	PHX					;$B8BA5B
	PHY					;$B8BA5C
	LDX.w $1929				;$B8BA5D
	LDY.w $192B				;$B8BA60
	JSL.l CODE_B8BA6A			;$B8BA63
	PLY					;$B8BA67
	PLX					;$B8BA68
	RTS					;$B8BA69

CODE_B8BA6A:
	AND.w #$FFFF				;$B8BA6A
	BPL.b CODE_B8BA7C			;$B8BA6D
	EOR.w #$FFFF				;$B8BA6F
	INC					;$B8BA72
	JSL.l CODE_B8BA7C			;$B8BA73
	EOR.w #$FFFF				;$B8BA77
	INC					;$B8BA7A
	RTL					;$B8BA7B

CODE_B8BA7C:
	SEP.b #$10				;$B8BA7C
	PHY					;$B8BA7E
	LDY.b #$00				;$B8BA7F
CODE_B8BA81:
	CMP.w #$0100				;$B8BA81
	BCC.b CODE_B8BA8A			;$B8BA84
	LSR					;$B8BA86
	INY					;$B8BA87
	BRA.b CODE_B8BA81			;$B8BA88

CODE_B8BA8A:
	SEP.b #$20				;$B8BA8A
	STA.w CPU.multiply_A			;$B8BA8C
	STX.w CPU.multiply_B			;$B8BA8F
	PLX					;$B8BA92
	NOP					;$B8BA93
	REP.b #$20				;$B8BA94
	LDA.w CPU.multiply_result		;$B8BA96
	STA.w CPU.dividen_low			;$B8BA99
	STX.w CPU.divisor			;$B8BA9C
	LDA.b ($00)				;$B8BA9F
	LDA.b ($00)				;$B8BAA1
	LDA.b $00				;$B8BAA3
	LDA.w CPU.divide_result			;$B8BAA5
	DEY					;$B8BAA8
	BMI.b CODE_B8BAAF			;$B8BAA9
CODE_B8BAAB:
	ASL					;$B8BAAB
	DEY					;$B8BAAC
	BPL.b CODE_B8BAAB			;$B8BAAD
CODE_B8BAAF:
	REP.b #$10				;$B8BAAF
	RTL					;$B8BAB1

kong_state_4D:
	JSR.w CODE_B89FAE			;$B8BAB2
	JMP.w CODE_B8A09B			;$B8BAB5

kong_state_4E:
	LDA.w #$FFFC				;$B8BAB8
	LDX.w follower_kong_sprite		;$B8BABB
	LDY.b $38,x				;$B8BABE
	CPY.w #$0053				;$B8BAC0
	BNE.b CODE_B8BAC8			;$B8BAC3
	LDA.w #$FFEC				;$B8BAC5
CODE_B8BAC8:
	STA.w $1921				;$B8BAC8
	STZ.w $191F				;$B8BACB
	JSR.w CODE_B8B9F3			;$B8BACE
	BCS.b CODE_B8BB01			;$B8BAD1
	JSL.l process_anim_preserve_state	;$B8BAD3
	LDA.w $0775				;$B8BAD7
	BIT.w #$0004				;$B8BADA
	BEQ.b CODE_B8BAFE			;$B8BADD
	BIT.w #$0200				;$B8BADF
	BEQ.b CODE_B8BAF4			;$B8BAE2
	LDX.w active_kong_sprite		;$B8BAE4
	LDY.w follower_kong_sprite		;$B8BAE7
	LDA.b $0E,x				;$B8BAEA
	EOR.w $000E,y				;$B8BAEC
	AND.w #$0040				;$B8BAEF
	BEQ.b CODE_B8BAFE			;$B8BAF2
CODE_B8BAF4:
	STZ.w $18B5				;$B8BAF4
	PHK					;$B8BAF7
	%return(CODE_B8BAFE)			;$B8BAF8
	JMP.w [$18B1]				;$B8BAFB

CODE_B8BAFE:
	JML [$04F5]				;$B8BAFE

CODE_B8BB01:
	LDX.b current_sprite			;$B8BB01
	LDY.w follower_kong_sprite		;$B8BB03
	LDA.w $0038,y				;$B8BB06
	CMP.w #$0059				;$B8BB09
	BEQ.b CODE_B8BB42			;$B8BB0C
	CMP.w #$0053				;$B8BB0E
	BEQ.b CODE_B8BB77			;$B8BB11
	CMP.w #$0035				;$B8BB13
	BNE.b CODE_B8BB1B			;$B8BB16
	BRL CODE_B8BBCC				;$B8BB18

CODE_B8BB1B:
	LDA.w #$001F				;$B8BB1B
	LDX.w #$0002				;$B8BB1E
	LDY.w #$0000				;$B8BB21
	JSL.l CODE_B8F028			;$B8BB24
	LDX.b current_sprite			;$B8BB28
	LDY.w follower_kong_sprite		;$B8BB2A
	LDA.w #$0033				;$B8BB2D
	STA.w $0038,y				;$B8BB30
	LDA.w #$0000				;$B8BB33
	STA.w $003A,y				;$B8BB36
	LDA.w $0028,y				;$B8BB39
	AND.w #$FFEF				;$B8BB3C
	STA.w $0028,y				;$B8BB3F
CODE_B8BB42:
	LDA.w #$00D8				;$B8BB42
	JSR.w CODE_B882A9			;$B8BB45
	LDA.w #$00E4				;$B8BB48
	JSR.w CODE_B8829F			;$B8BB4B
	STZ.b $2A,x				;$B8BB4E
	STZ.b $30,x				;$B8BB50
	LDA.w #$00BC				;$B8BB52
	STA.b $3A,x				;$B8BB55
	LDA.w $0012,y				;$B8BB57
	STA.b $12,x				;$B8BB5A
	LDA.w $0054,y				;$B8BB5C
	STA.b $54,x				;$B8BB5F
	LDA.w $0016,y				;$B8BB61
	STA.b $16,x				;$B8BB64
	LDA.w $0056,y				;$B8BB66
	STA.b $56,x				;$B8BB69
	LDA.w $0028,y				;$B8BB6B
	STA.b $28,x				;$B8BB6E
	JSL.l CODE_B9A595			;$B8BB70
	JMP.w CODE_B8A09B			;$B8BB74

CODE_B8BB77:
	LDX.w active_kong_sprite		;$B8BB77
	LDY.w follower_kong_sprite		;$B8BB7A
	LDA.w $0012,y				;$B8BB7D
	STA.b $12,x				;$B8BB80
	LDA.w $0016,y				;$B8BB82
	STA.b $16,x				;$B8BB85
	LDA.w $004C,y				;$B8BB87
	STA.b $4C,x				;$B8BB8A
	LDA.w #$0014				;$B8BB8C
	STA.b $38,x				;$B8BB8F
	STZ.b $2A,x				;$B8BB91
	STZ.b $30,x				;$B8BB93
	STZ.b $2E,x				;$B8BB95
	STZ.b $34,x				;$B8BB97
	LDA.w #$0016				;$B8BB99
	JSL.l set_anim_handle_kiddy		;$B8BB9C
	JSR.w CODE_B8E2DD			;$B8BBA0
	LDA.w #$0020				;$B8BBA3
	TSB.w $05AF				;$B8BBA6
	LDA.w #$2000				;$B8BBA9
	TSB.w $0474				;$B8BBAC
	LDA.w #$7000				;$B8BBAF
	STA.w $04AC				;$B8BBB2
	LDY.w follower_kong_sprite		;$B8BBB5
	LDA.w #$0033				;$B8BBB8
	STA.w $0038,y				;$B8BBBB
	LDA.w #$0001				;$B8BBBE
	LDX.w #$0016				;$B8BBC1
	LDY.w #$0000				;$B8BBC4
	JSL.l CODE_B8F028			;$B8BBC7
	RTL					;$B8BBCB

CODE_B8BBCC:
	LDX.w active_kong_sprite		;$B8BBCC
	LDA.w #$001C				;$B8BBCF
	STA.b $38,x				;$B8BBD2
	STZ.b $3C,x				;$B8BBD4
	STZ.b $2A,x				;$B8BBD6
	STZ.b $30,x				;$B8BBD8
	STZ.b $2E,x				;$B8BBDA
	STZ.b $28,x				;$B8BBDC
	STZ.b $4A,x				;$B8BBDE
	JSR.w CODE_B88A0A			;$B8BBE0
	RTL					;$B8BBE3

kong_state_4F:
	JSL.l CODE_B8E198			;$B8BBE4
	LDY.w #$0078				;$B8BBE8
	LDA.b [$6A],y				;$B8BBEB
	LDY.b current_kong_control_variables	;$B8BBED
	LDX.b current_sprite			;$B8BBEF
	BIT.b $2E,x				;$B8BBF1
	BMI.b CODE_B8BBF6			;$B8BBF3
	ASL					;$B8BBF5
CODE_B8BBF6:
	STA.w $0008,y				;$B8BBF6
	JSR.w CODE_B8A035			;$B8BBF9
	LDX.b current_sprite			;$B8BBFC
	LDY.w $04FB				;$B8BBFE
	LDA.w $0004,y				;$B8BC01
	AND.w #$0300				;$B8BC04
	BEQ.b CODE_B8BC1B			;$B8BC07
	LDY.w #$0068				;$B8BC09
	BIT.w #$0100				;$B8BC0C
	BNE.b CODE_B8BC19			;$B8BC0F
	LDA.b [$6A],y				;$B8BC11
	EOR.w #$FFFF				;$B8BC13
	INC					;$B8BC16
	BRA.b CODE_B8BC1B			;$B8BC17

CODE_B8BC19:
	LDA.b [$6A],y				;$B8BC19
CODE_B8BC1B:
	STA.b $30,x				;$B8BC1B
	LDY.w #$0080				;$B8BC1D
	LDA.b [$6A],y				;$B8BC20
	JSL.l interpolate_x_speed		;$B8BC22
	LDX.b current_sprite			;$B8BC26
	CPX.w $0503				;$B8BC28
	BNE.b CODE_B8BC3F			;$B8BC2B
	LDA.b $2E,x				;$B8BC2D
	BMI.b CODE_B8BC3F			;$B8BC2F
	LDA.b $2A,x				;$B8BC31
	CMP.w #$8000				;$B8BC33
	ROR.b $2A,x				;$B8BC36
	LDA.b $4A,x				;$B8BC38
	ORA.w #$0000				;$B8BC3A
	STA.b $4A,x				;$B8BC3D
CODE_B8BC3F:
	JSL.l process_sprite_animation		;$B8BC3F
	JSR.w CODE_B8B729			;$B8BC43
	JSL.l CODE_B9E006			;$B8BC46
	LDA.w #$0006				;$B8BC4A
	JSL.l CODE_BCE2CE			;$B8BC4D
	JSL.l CODE_BCE2D7			;$B8BC51
	LDX.b current_sprite			;$B8BC55
	LDA.b $2E,x				;$B8BC57
	BMI.b CODE_B8BC81			;$B8BC59
	JSR.w CODE_B8CB19			;$B8BC5B
	BCC.b CODE_B8BC63			;$B8BC5E
	BRL CODE_B8BCD8				;$B8BC60

CODE_B8BC63:
	JSR.w CODE_B8BD06			;$B8BC63
	BCC.b CODE_B8BCCE			;$B8BC66
	LDX.b current_sprite			;$B8BC68
	LDA.b $28,x				;$B8BC6A
	AND.w #$0101				;$B8BC6C
	CMP.w #$0101				;$B8BC6F
	BEQ.b CODE_B8BC9E			;$B8BC72
	JSR.w check_sprite_underwater		;$B8BC74
	CMP.w #$0002				;$B8BC77
	BEQ.b CODE_B8BCBC			;$B8BC7A
	JSR.w CODE_B8B74F			;$B8BC7C
	BCS.b CODE_B8BCBC			;$B8BC7F
CODE_B8BC81:
	LDA.w $0775				;$B8BC81
	BIT.w #$0004				;$B8BC84
	BNE.b CODE_B8BC8C			;$B8BC87
CODE_B8BC89:
	JML [$04F5]				;$B8BC89

CODE_B8BC8C:
	BIT.w #$0200				;$B8BC8C
	BEQ.b CODE_B8BC9B			;$B8BC8F
	LDX.w active_kong_sprite		;$B8BC91
	LDA.b $0E,x				;$B8BC94
	AND.w #$0040				;$B8BC96
	BNE.b CODE_B8BC89			;$B8BC99
CODE_B8BC9B:
	JMP.w CODE_B8A09B			;$B8BC9B

CODE_B8BC9E:
	JSR.w CODE_B8C56B			;$B8BC9E
	BCC.b CODE_B8BC81			;$B8BCA1
	LDA.w #$0800				;$B8BCA3
	JSL.l CODE_B7E48C			;$B8BCA6
	JSL.l CODE_B89C4C			;$B8BCAA
	JSL.l CODE_B9A595			;$B8BCAE
	JSL.l CODE_B89C3C			;$B8BCB2
	JSR.w CODE_B8B946			;$B8BCB6
	JMP.w CODE_B8BC81			;$B8BCB9

CODE_B8BCBC:
	JSL.l CODE_B89C4C			;$B8BCBC
	JSL.l CODE_B9A595			;$B8BCC0
	JSL.l CODE_B89C3C			;$B8BCC4
	JSR.w CODE_B8B946			;$B8BCC8
	JMP.w CODE_B8BC81			;$B8BCCB

CODE_B8BCCE:
	LDA.w #$0002				;$B8BCCE
	JSL.l CODE_B882B6			;$B8BCD1
	JMP.w CODE_B8BC81			;$B8BCD5

CODE_B8BCD8:
	JSL.l CODE_B89C4C			;$B8BCD8
	LDX.b current_sprite			;$B8BCDC
	LDA.w #$004E				;$B8BCDE
	STA.b $38,x				;$B8BCE1
	LDA.w #$0037				;$B8BCE3
	JSL.l set_anim_handle_kiddy		;$B8BCE6
	STZ.w $1929				;$B8BCEA
	LDA.w #$0020				;$B8BCED
	STA.w $192B				;$B8BCF0
	JSL.l CODE_B89C3C			;$B8BCF3
	LDA.w #$0053				;$B8BCF7
	STA.b $38,x				;$B8BCFA
	LDA.w #$0016				;$B8BCFC
	JSL.l set_anim_handle_kiddy		;$B8BCFF
	JML [$04F5]				;$B8BD03

CODE_B8BD06:
	LDX.w follower_kong_sprite		;$B8BD06
	LDY.w active_kong_sprite		;$B8BD09
	LDA.w $0012,y				;$B8BD0C
	SEC					;$B8BD0F
	SBC.b $12,x				;$B8BD10
	CLC					;$B8BD12
	ADC.w #$0018				;$B8BD13
	CMP.w #$0030				;$B8BD16
	BCS.b CODE_B8BD28			;$B8BD19
	LDA.w $0016,y				;$B8BD1B
	SEC					;$B8BD1E
	SBC.b $16,x				;$B8BD1F
	CLC					;$B8BD21
	ADC.w #$0020				;$B8BD22
	CMP.w #$0040				;$B8BD25
CODE_B8BD28:
	RTS					;$B8BD28

kong_state_50:
	JSL.l CODE_B8E179			;$B8BD29
	JSL.l CODE_B8E198			;$B8BD2D
	JSR.w CODE_B8A035			;$B8BD31
	LDA.w #$0003				;$B8BD34
	JSL.l interpolate_x_speed		;$B8BD37
	JSL.l CODE_B9E006			;$B8BD3B
	JSL.l process_sprite_animation		;$B8BD3F
	LDA.w #$0006				;$B8BD43
	JSL.l CODE_BCE2CE			;$B8BD46
	JSL.l CODE_BCE2D7			;$B8BD4A
	LDX.b current_sprite			;$B8BD4E
	LDA.b $28,x				;$B8BD50
	AND.w #$0303				;$B8BD52
	BNE.b CODE_B8BD6D			;$B8BD55
	JSR.w CODE_B8B729			;$B8BD57
	JSR.w check_sprite_underwater		;$B8BD5A
	CMP.w #$0002				;$B8BD5D
	BEQ.b CODE_B8BD67			;$B8BD60
	JSR.w CODE_B8B74F			;$B8BD62
	BCC.b CODE_B8BD6A			;$B8BD65
CODE_B8BD67:
	JSR.w CODE_B8B946			;$B8BD67
CODE_B8BD6A:
	JMP.w CODE_B8A09B			;$B8BD6A

CODE_B8BD6D:
	JSR.w CODE_B8C56B			;$B8BD6D
	BCC.b CODE_B8BD6A			;$B8BD70
	LDX.b current_sprite			;$B8BD72
	LDA.b $28,x				;$B8BD74
	AND.w #$0002				;$B8BD76
	BEQ.b CODE_B8BD82			;$B8BD79
	LDA.b $1E,x				;$B8BD7B
	EOR.w #$4000				;$B8BD7D
	STA.b $1E,x				;$B8BD80
CODE_B8BD82:
	LDY.w #$0088				;$B8BD82
	LDA.b [$6A],y				;$B8BD85
	BIT.b $1E,x				;$B8BD87
	BVC.b CODE_B8BD8F			;$B8BD89
	EOR.w #$FFFF				;$B8BD8B
	INC					;$B8BD8E
CODE_B8BD8F:
	STA.b $2A,x				;$B8BD8F
	STA.b $30,x				;$B8BD91
	LDY.w #$0090				;$B8BD93
	LDA.b [$6A],y				;$B8BD96
	STA.b $5C,x				;$B8BD98
	LDA.w #$0051				;$B8BD9A
	STA.b $38,x				;$B8BD9D
	LDA.w #$0036				;$B8BD9F
	JSL.l set_anim_handle_kiddy		;$B8BDA2
	LDX.b current_sprite			;$B8BDA6
	LDA.b $12,x				;$B8BDA8
	STA.b $2C,x				;$B8BDAA
	STA.b $54,x				;$B8BDAC
	LDA.b $16,x				;$B8BDAE
	CLC					;$B8BDB0
	ADC.w #$0004				;$B8BDB1
	STA.b $32,x				;$B8BDB4
	SEC					;$B8BDB6
	SBC.w #$0008				;$B8BDB7
	STA.b $56,x				;$B8BDBA
	STZ.b $58,x				;$B8BDBC
	JSL.l CODE_B8E179			;$B8BDBE
	JSL.l CODE_B8E198			;$B8BDC2
	LDA.b active_frame_counter		;$B8BDC6
	STA.w $0010,y				;$B8BDC8
	LDA.w #$0000				;$B8BDCB
	STA.w $0026,y				;$B8BDCE
	JSR.w CODE_B8B729			;$B8BDD1
	JMP.w CODE_B8A09B			;$B8BDD4

kong_state_51:
	TYX					;$B8BDD7
	DEC.b $5C,x				;$B8BDD8
	BNE.b CODE_B8BDDE			;$B8BDDA
	STZ.b $30,x				;$B8BDDC
CODE_B8BDDE:
	JSR.w CODE_B8BE76			;$B8BDDE
	JSR.w CODE_B8C56B			;$B8BDE1
	BCC.b CODE_B8BE13			;$B8BDE4
	JSR.w CODE_B8E0FE			;$B8BDE6
	JSL.l process_sprite_animation		;$B8BDE9
	LDA.b $2A,x				;$B8BDED
	BEQ.b CODE_B8BE16			;$B8BDEF
	JSR.w CODE_B8B729			;$B8BDF1
	JSR.w CODE_B8B74F			;$B8BDF4
	BCS.b CODE_B8BE1E			;$B8BDF7
	JSR.w check_sprite_underwater		;$B8BDF9
	CMP.w #$0002				;$B8BDFC
	BEQ.b CODE_B8BE1E			;$B8BDFF
	LDA.w #$0006				;$B8BE01
	JSL.l CODE_BCE2CE			;$B8BE04
	JSL.l CODE_BCE2D7			;$B8BE08
	LDA.w #CODE_B8BE24			;$B8BE0C
	JSL.l CODE_BB85D6			;$B8BE0F
CODE_B8BE13:
	JMP.w CODE_B8A09B			;$B8BE13

CODE_B8BE16:
	LDA.w #$004A				;$B8BE16
	STA.b $38,x				;$B8BE19
	JMP.w CODE_B8A09B			;$B8BE1B

CODE_B8BE1E:
	JSR.w CODE_B8B946			;$B8BE1E
	JMP.w CODE_B8A09B			;$B8BE21

CODE_B8BE24:
	LDY.w active_kong_sprite		;$B8BE24
	LDA.w $003A,y				;$B8BE27
	AND.w #$0004				;$B8BE2A
	BEQ.b CODE_B8BE75			;$B8BE2D
	LDX.b current_sprite			;$B8BE2F
	LDA.b $16,x				;$B8BE31
	SEC					;$B8BE33
	SBC.w $0016,y				;$B8BE34
	CMP.w #$0018				;$B8BE37
	BCS.b CODE_B8BE75			;$B8BE3A
	CMP.w #$0008				;$B8BE3C
	BCC.b CODE_B8BE75			;$B8BE3F
	LDA.b $12,x				;$B8BE41
	SEC					;$B8BE43
	SBC.w $0012,y				;$B8BE44
	CLC					;$B8BE47
	ADC.w #$0010				;$B8BE48
	CMP.w #$0020				;$B8BE4B
	BCS.b CODE_B8BE75			;$B8BE4E
	LDA.b $12,x				;$B8BE50
	SEC					;$B8BE52
	SBC.w #$0008				;$B8BE53
	STA.b $D0				;$B8BE56
	CLC					;$B8BE58
	ADC.w #$0010				;$B8BE59
	STA.b $D4				;$B8BE5C
	LDA.b $16,x				;$B8BE5E
	STA.b $D6				;$B8BE60
	SEC					;$B8BE62
	SBC.w #$0018				;$B8BE63
	STA.b $D2				;$B8BE66
	STY.b $78				;$B8BE68
	JSL.l CODE_BEC042			;$B8BE6A
	BMI.b CODE_B8BE75			;$B8BE6E
	LDA.w #$001E				;$B8BE70
	STA.b $5C,x				;$B8BE73
CODE_B8BE75:
	RTL					;$B8BE75

CODE_B8BE76:
	LDX.b current_sprite			;$B8BE76
	LDA.b $12,x				;$B8BE78
	STA.b $54,x				;$B8BE7A
	LDA.b $16,x				;$B8BE7C
	STA.b $56,x				;$B8BE7E
	LDA.b $2C,x				;$B8BE80
	STA.b $12,x				;$B8BE82
	LDA.b $32,x				;$B8BE84
	STA.b $16,x				;$B8BE86
	JSR.w CODE_B8A3F2			;$B8BE88
	JSR.w CODE_B8A04C			;$B8BE8B
	JSL.l CODE_B9E018			;$B8BE8E
	JSL.l CODE_B9E006			;$B8BE92
	JSR.w CODE_B8BEE8			;$B8BE96
	LDX.b current_sprite			;$B8BE99
	LDA.b $2C,x				;$B8BE9B
	LDY.b $12,x				;$B8BE9D
	STA.b $12,x				;$B8BE9F
	STY.b $2C,x				;$B8BEA1
	LDA.b $32,x				;$B8BEA3
	LDY.b $16,x				;$B8BEA5
	STA.b $16,x				;$B8BEA7
	STY.b $32,x				;$B8BEA9
	RTS					;$B8BEAB

kong_state_52:
	LDA.w $0028,y				;$B8BEAC
	AND.w #$0010				;$B8BEAF
	BEQ.b CODE_B8BED5			;$B8BEB2
	LDA.w $004E,y				;$B8BEB4
	CLC					;$B8BEB7
	ADC.w $0050,y				;$B8BEB8
	LSR					;$B8BEBB
	SEC					;$B8BEBC
	SBC.w $0012,y				;$B8BEBD
	STA.w $0052,y				;$B8BEC0
	LDA.w #$0021				;$B8BEC3
	JSR.w CODE_B8CC29			;$B8BEC6
	JSR.w CODE_B8CBB2			;$B8BEC9
	JSR.w CODE_B89FAE			;$B8BECC
	JSR.w CODE_B8C681			;$B8BECF
	JMP.w CODE_B8A075			;$B8BED2

CODE_B8BED5:
	LDA.w #$0021				;$B8BED5
	JSR.w CODE_B8CC29			;$B8BED8
	JSL.l CODE_B9A595			;$B8BEDB
	JSR.w CODE_B89FAE			;$B8BEDF
	JSR.w CODE_B8C681			;$B8BEE2
	JMP.w CODE_B8A075			;$B8BEE5

CODE_B8BEE8:
	LDX.b current_sprite			;$B8BEE8
	LDA.b $28,x				;$B8BEEA
	AND.w #$0002				;$B8BEEC
	BEQ.b CODE_B8BF18			;$B8BEEF
	LDA.b $1E,x				;$B8BEF1
	EOR.w #$4000				;$B8BEF3
	STA.b $1E,x				;$B8BEF6
	LDA.b $1E,x				;$B8BEF8
	ASL					;$B8BEFA
	EOR.b $B0				;$B8BEFB
	ASL					;$B8BEFD
	LDA.b $B0				;$B8BEFE
	BCC.b CODE_B8BF06			;$B8BF00
	EOR.w #$FFFF				;$B8BF02
	INC					;$B8BF05
CODE_B8BF06:
	STA.b $2A,x				;$B8BF06
	LDA.b $1E,x				;$B8BF08
	ASL					;$B8BF0A
	EOR.b $AE				;$B8BF0B
	ASL					;$B8BF0D
	LDA.b $AE				;$B8BF0E
	BCC.b CODE_B8BF16			;$B8BF10
	EOR.w #$FFFF				;$B8BF12
	INC					;$B8BF15
CODE_B8BF16:
	STA.b $30,x				;$B8BF16
CODE_B8BF18:
	RTS					;$B8BF18

kong_state_53:
	JSL.l process_anim_preserve_state	;$B8BF19
	JMP.w CODE_B8A09B			;$B8BF1D

kong_state_54:
	STZ.w $1921				;$B8BF20
	STZ.w $191F				;$B8BF23
	JSR.w CODE_B8B9F3			;$B8BF26
	BCS.b CODE_B8BF59			;$B8BF29
	JSL.l process_anim_preserve_state	;$B8BF2B
	LDA.w $0775				;$B8BF2F
	BIT.w #$0004				;$B8BF32
	BEQ.b CODE_B8BF56			;$B8BF35
	BIT.w #$0200				;$B8BF37
	BEQ.b CODE_B8BF4C			;$B8BF3A
	LDX.w active_kong_sprite		;$B8BF3C
	LDY.w follower_kong_sprite		;$B8BF3F
	LDA.b $0E,x				;$B8BF42
	EOR.w $000E,y				;$B8BF44
	AND.w #$0040				;$B8BF47
	BEQ.b CODE_B8BF56			;$B8BF4A
CODE_B8BF4C:
	STZ.w $18B5				;$B8BF4C
	PHK					;$B8BF4F
	%return(CODE_B8BF56)			;$B8BF50
	JMP.w [$18B1]				;$B8BF53

CODE_B8BF56:
	JML [$04F5]				;$B8BF56

CODE_B8BF59:
	LDY.w follower_kong_sprite		;$B8BF59
	LDA.w $0028,y				;$B8BF5C
	STA.b $28,x				;$B8BF5F
	LDA.w #$0004				;$B8BF61
	TRB.w $05B1				;$B8BF64
	LDA level_number			;$B8BF67
	CMP.w #!boss_level_type_range_start	;$B8BF69
	BCC.b CODE_B8BF79			;$B8BF6C
	CMP.w #!boss_level_type_range_end	;$B8BF6E
	BCS.b CODE_B8BF79			;$B8BF71
	JSL.l player_interaction_29		;$B8BF73
	BRA.b CODE_B8BF7C			;$B8BF77

CODE_B8BF79:
	JSR.w CODE_B88417			;$B8BF79
CODE_B8BF7C:
	LDA.w #$0001				;$B8BF7C
	LDX.w #$0002				;$B8BF7F
	LDY.w #$0000				;$B8BF82
	JSL.l CODE_B8F028			;$B8BF85
	LDX.b current_sprite			;$B8BF89
	LDY.w follower_kong_sprite		;$B8BF8B
	LDA.w #$0033				;$B8BF8E
	STA.w $0038,y				;$B8BF91
	JML [$04F5]				;$B8BF94

kong_state_55:
	TYX					;$B8BF97
	STZ.b $2A,x				;$B8BF98
	LDA.b $16,x				;$B8BF9A
	CMP.w $050F				;$B8BF9C
	BCC.b CODE_B8BFA6			;$B8BF9F
	LDA.w #$0100				;$B8BFA1
	STA.b $2E,x				;$B8BFA4
CODE_B8BFA6:
	JSR.w CODE_B8A035			;$B8BFA6
	JSL.l CODE_B9E006			;$B8BFA9
	JSL.l process_anim_preserve_state	;$B8BFAD
	JML [$04F5]				;$B8BFB1

kong_state_56:
	JML [$04F5]				;$B8BFB4

kong_state_58:
	LDA.w #$0002				;$B8BFB7
	TSB.w $1927				;$B8BFBA
	LDA.w #$0002				;$B8BFBD
	TSB.w $05AF				;$B8BFC0
	LDA.w #$0001				;$B8BFC3
	JSR.w CODE_B8CC29			;$B8BFC6
	JSL.l process_sprite_animation		;$B8BFC9
	JSR.w CODE_B89FC6			;$B8BFCD
	JMP.w CODE_B8A075			;$B8BFD0

kong_state_59:
	JSL.l process_sprite_animation		;$B8BFD3
	JMP.w CODE_B8A09B			;$B8BFD7

kong_state_5A:
	LDA.w #$0025				;$B8BFDA
	JSR.w CODE_B8CC29			;$B8BFDD
	BCS.b CODE_B8BFE5			;$B8BFE0
	JMP.w CODE_B8BFFC			;$B8BFE2

CODE_B8BFE5:
	JSR.w CODE_B8C687			;$B8BFE5
	BCS.b CODE_B8BFF3			;$B8BFE8
	LDA.b current_animal_type		;$B8BFEA
	BNE.b CODE_B8BFF6			;$B8BFEC
	LDA.w #$0002				;$B8BFEE
	STA.b $38,x				;$B8BFF1
CODE_B8BFF3:
	JMP.w CODE_B8A075			;$B8BFF3

CODE_B8BFF6:
	JSR.w CODE_B8CBCB			;$B8BFF6
	JMP.w CODE_B8A075			;$B8BFF9

CODE_B8BFFC:
	LDA.w #$0100				;$B8BFFC
	TSB.w $05AF				;$B8BFFF
	DEC.b active_frame_counter		;$B8C002
	LDA.w #$0002				;$B8C004
	STA.w timestop_timer			;$B8C007
	INC.b $64,x				;$B8C00A
	LDA.b $64,x				;$B8C00C
	AND.w #$001F				;$B8C00E
	BEQ.b CODE_B8C023			;$B8C011
	CMP.w #$0010				;$B8C013
	BEQ.b CODE_B8C01B			;$B8C016
	JML [$04F5]				;$B8C018

CODE_B8C01B:
	LDA.w #$C000				;$B8C01B
	STA.b $26,x				;$B8C01E
	JML [$04F5]				;$B8C020

CODE_B8C023:
	STZ.b $26,x				;$B8C023
	LDA.w parent_level_number		;$B8C025
	CMP.w #!level_murky_mill		;$B8C028
	BEQ.b CODE_B8C034			;$B8C02B
	LDA.w #$062D				;$B8C02D
	JSL.l CODE_B28018			;$B8C030
CODE_B8C034:
	JML [$04F5]				;$B8C034

kong_state_5B:
	LDA.w #$0025				;$B8C037
	JSR.w CODE_B8CC29			;$B8C03A
	BCS.b CODE_B8C042			;$B8C03D
	JMP.w CODE_B8BFFC			;$B8C03F

CODE_B8C042:
	LDA.w $189D				;$B8C042
	STA.b $38,x				;$B8C045
	JMP.w CODE_B8A075			;$B8C047

kong_state_5C:
	LDX.w $1B63				;$B8C04A
	BEQ.b CODE_B8C051			;$B8C04D
	STZ.b $2E,x				;$B8C04F
CODE_B8C051:
	LDA.w $0012,y				;$B8C051
	SEC					;$B8C054
	SBC.w $196D				;$B8C055
	CMP.w #$0100				;$B8C058
	BCC.b CODE_B8C067			;$B8C05B
	LDA.w #$005D				;$B8C05D
	STA.w $0038,y				;$B8C060
	JSL.l CODE_B8837A			;$B8C063
CODE_B8C067:
	JSL.l process_sprite_animation		;$B8C067
	JMP.w CODE_B8A075			;$B8C06B

kong_state_5D:
	LDX.w $1B63				;$B8C06E
	BEQ.b CODE_B8C075			;$B8C071
	STZ.b $2E,x				;$B8C073
CODE_B8C075:
	JSL.l process_sprite_animation		;$B8C075
	JMP.w CODE_B8A075			;$B8C079

kong_state_5E:
	LDA.w #$0001				;$B8C07C
	JSR.w CODE_B8CC29			;$B8C07F
	JSR.w CODE_B8A035			;$B8C082
	JSR.w CODE_B8A04C			;$B8C085
	JSL.l CODE_B9E018			;$B8C088
	JSR.w CODE_B8E1FB			;$B8C08C
	LDX.b current_sprite			;$B8C08F
	STZ.b $28,x				;$B8C091
	JSR.w CODE_B8C4F8			;$B8C093
	JSL.l process_sprite_animation		;$B8C096
	JMP.w CODE_B8A075			;$B8C09A

kong_state_5F:
	JSL.l process_sprite_animation		;$B8C09D
	JMP.w CODE_B8A09B			;$B8C0A1

kong_state_60:
	LDA.w #$0001				;$B8C0A4
	JSR.w CODE_B8CC29			;$B8C0A7
	LDX.b current_sprite			;$B8C0AA
	LDA.b $12,x				;$B8C0AC
	CMP.w $18A7				;$B8C0AE
	BCC.b CODE_B8C0C1			;$B8C0B1
	CMP.w $18A9				;$B8C0B3
	BCS.b CODE_B8C0C1			;$B8C0B6
CODE_B8C0B8:
	JSR.w CODE_B8A035			;$B8C0B8
	JSR.w CODE_B89FB4			;$B8C0BB
	JMP.w CODE_B8A075			;$B8C0BE

CODE_B8C0C1:
	LDA.b $5A,x				;$B8C0C1
	BEQ.b CODE_B8C0B8			;$B8C0C3
	DEC.b $5C,x				;$B8C0C5
	BPL.b CODE_B8C0B8			;$B8C0C7
	LDA.w #$0023				;$B8C0C9
	STA.b $38,x				;$B8C0CC
	JSR.w CODE_B89FAE			;$B8C0CE
	JMP.w CODE_B8A075			;$B8C0D1

kong_state_61:
	LDA.w $005A,y				;$B8C0D4
	ASL					;$B8C0D7
	TAX					;$B8C0D8
	JMP.w (DATA_B8C0DC,x)			;$B8C0D9

DATA_B8C0DC:
	dw CODE_B8C0E2
	dw CODE_B8C11F
	dw CODE_B8C143

CODE_B8C0E2:
	JSL.l process_sprite_animation		;$B8C0E2
	JSL.l CODE_B8EFE7			;$B8C0E6
	LDX.b current_sprite			;$B8C0EA
	LDA.b $5A,x				;$B8C0EC
	BNE.b CODE_B8C0F3			;$B8C0EE
	JMP.w CODE_B8A075			;$B8C0F0

CODE_B8C0F3:
	LDA.w #$0014				;$B8C0F3
	STA.b $5C,x				;$B8C0F6
	LDA.w $1931				;$B8C0F8
	SEC					;$B8C0FB
	SBC.w $1933				;$B8C0FC
	AND.w #$00FF				;$B8C0FF
	XBA					;$B8C102
	LDY.b $5C,x				;$B8C103
	JSR.w CODE_B8C232			;$B8C105
	STA.b $2A,x				;$B8C108
	LDA.w $1935				;$B8C10A
	SEC					;$B8C10D
	SBC.w $1937				;$B8C10E
	AND.w #$00FF				;$B8C111
	XBA					;$B8C114
	LDY.b $5C,x				;$B8C115
	JSR.w CODE_B8C232			;$B8C117
	STA.b $2E,x				;$B8C11A
	JMP.w CODE_B8A075			;$B8C11C

CODE_B8C11F:
	JSR.w CODE_B8E1FB			;$B8C11F
	DEC.b $5C,x				;$B8C122
	BEQ.b CODE_B8C12D			;$B8C124
	JSL.l process_sprite_animation		;$B8C126
	JMP.w CODE_B8A075			;$B8C12A

CODE_B8C12D:
	LDA.w $1931				;$B8C12D
	STA.b $12,x				;$B8C130
	LDA.w $1935				;$B8C132
	STA.b $16,x				;$B8C135
	INC.b $5A,x				;$B8C137
	LDA.w #$003D				;$B8C139
	JSL.l set_anim_handle_kiddy		;$B8C13C
	JMP.w CODE_B8A075			;$B8C140

CODE_B8C143:
	LDX.w follower_kong_sprite		;$B8C143
	LDA.b $38,x				;$B8C146
	CMP.w #$0033				;$B8C148
	BNE.b CODE_B8C153			;$B8C14B
	JSR.w CODE_B8C15A			;$B8C14D
	JMP.w CODE_B8A075			;$B8C150

CODE_B8C153:
	JSL.l process_sprite_animation		;$B8C153
	JMP.w CODE_B8A075			;$B8C157

CODE_B8C15A:
	LDX.b current_sprite			;$B8C15A
	LDA.w #$00E4				;$B8C15C
	STA.b $0E,x				;$B8C15F
	LDA.w #$0100				;$B8C161
	STA.b $2E,x				;$B8C164
	STZ.b $2A,x				;$B8C166
	LDA.w #$8000				;$B8C168
	STA.b $10,x				;$B8C16B
	STA.b $14,x				;$B8C16D
	LDA.w #$0101				;$B8C16F
	STA.b $28,x				;$B8C172
	JSL.l CODE_B9E006			;$B8C174
	JSL.l CODE_B9A595			;$B8C178
	JSL.l disable_timestop			;$B8C17C
	RTS					;$B8C180

kong_state_62:
	LDA.w $005A,y				;$B8C181
	ASL					;$B8C184
	TAX					;$B8C185
	JMP.w (DATA_B8C189,x)			;$B8C186

DATA_B8C189:
	dw CODE_B8C195
	dw CODE_B8C1A8
	dw CODE_B8C1C9
	dw CODE_B8C1E8
	dw CODE_B8C21D
	dw CODE_B8C1C9

CODE_B8C195:
	LDA.w current_held_sprite		;$B8C195
	BNE.b CODE_B8C1A5			;$B8C198
	TYX					;$B8C19A
	INC.b $5A,x				;$B8C19B
	JSL.l CODE_B8E198			;$B8C19D
	JSL.l CODE_B8E179			;$B8C1A1
CODE_B8C1A5:
	JMP.w CODE_B8A075			;$B8C1A5

CODE_B8C1A8:
	JSR.w CODE_B8A035			;$B8C1A8
	JSR.w CODE_B8C932			;$B8C1AB
	LDX.b current_sprite			;$B8C1AE
	CMP.b $16,x				;$B8C1B0
	BCS.b CODE_B8C1BE			;$B8C1B2
	JSR.w CODE_B8E1FB			;$B8C1B4
	JSL.l process_sprite_animation		;$B8C1B7
	JMP.w CODE_B8A075			;$B8C1BB

CODE_B8C1BE:
	JSL.l CODE_B9E006			;$B8C1BE
	JSL.l process_sprite_animation		;$B8C1C2
	JMP.w CODE_B8A075			;$B8C1C6

CODE_B8C1C9:
	LDA.w #$0033				;$B8C1C9
	STA.w $0038,y				;$B8C1CC
	LDA.w #$001F				;$B8C1CF
	LDX.w #$0002				;$B8C1D2
	LDY.w #$0000				;$B8C1D5
	JSL.l CODE_B8F028			;$B8C1D8
	LDX.b current_sprite			;$B8C1DC
	LDA.w #$0002				;$B8C1DE
	JSL.l set_anim_handle_kiddy		;$B8C1E1
	JMP.w CODE_B8A075			;$B8C1E5

CODE_B8C1E8:
	LDA.w current_held_sprite		;$B8C1E8
	BNE.b CODE_B8C216			;$B8C1EB
	TYX					;$B8C1ED
	INC.b $5A,x				;$B8C1EE
	LDA.w #$0014				;$B8C1F0
	STA.b $5C,x				;$B8C1F3
	LDA.w $1933				;$B8C1F5
	SEC					;$B8C1F8
	SBC.w $1931				;$B8C1F9
	AND.w #$00FF				;$B8C1FC
	XBA					;$B8C1FF
	LDY.b $5C,x				;$B8C200
	JSR.w CODE_B8C232			;$B8C202
	STA.b $2A,x				;$B8C205
	LDY.w #$0180				;$B8C207
	LDA.b [$6A],y				;$B8C20A
	STA.b $2E,x				;$B8C20C
	JSL.l CODE_B8E198			;$B8C20E
	JSL.l CODE_B8E179			;$B8C212
CODE_B8C216:
	JSL.l process_sprite_animation		;$B8C216
	JMP.w CODE_B8A075			;$B8C21A

CODE_B8C21D:
	TYX					;$B8C21D
	DEC.b $5C,x				;$B8C21E
	BPL.b CODE_B8C224			;$B8C220
	STZ.b $2A,x				;$B8C222
CODE_B8C224:
	JSR.w CODE_B8A035			;$B8C224
	JSL.l CODE_B9E006			;$B8C227
	JSL.l process_sprite_animation		;$B8C22B
	JMP.w CODE_B8A075			;$B8C22F

CODE_B8C232:
	CMP.w #$8000				;$B8C232
	BCC.b CODE_B8C252			;$B8C235
	EOR.w #$FFFF				;$B8C237
	INC					;$B8C23A
	STA.w CPU.dividen_low			;$B8C23B
	SEP.b #$20				;$B8C23E
	TYA					;$B8C240
	STA.w CPU.divisor			;$B8C241
	REP.b #$20				;$B8C244
	LDA.b [$00]				;$B8C246
	LDA.b ($00)				;$B8C248
	LDA.w CPU.divide_result			;$B8C24A
	EOR.w #$FFFF				;$B8C24D
	INC					;$B8C250
	RTS					;$B8C251

CODE_B8C252:
	STA.w CPU.dividen_low			;$B8C252
	SEP.b #$20				;$B8C255
	TYA					;$B8C257
	STA.w CPU.divisor			;$B8C258
	REP.b #$20				;$B8C25B
	LDA.b [$00]				;$B8C25D
	LDA.b ($00)				;$B8C25F
	LDA.w CPU.divide_result			;$B8C261
	RTS					;$B8C264

kong_state_63:
	LDA.w #$0001				;$B8C265
	TSB.w $1927				;$B8C268
	LDA.w #$001D				;$B8C26B
	JSR.w CODE_B8CC29			;$B8C26E
	JSR.w CODE_B8C33A			;$B8C271
	LDX.b current_sprite			;$B8C274
	LDA.b $16,x				;$B8C276
	CLC					;$B8C278
	ADC.w #$0010				;$B8C279
	CMP.w $050F				;$B8C27C
	BCC.b CODE_B8C288			;$B8C27F
	LDA.w #$0022				;$B8C281
	JSL.l CODE_B882B6			;$B8C284
CODE_B8C288:
	JMP.w CODE_B8A075			;$B8C288

kong_state_64:
	LDA.w $005A,y				;$B8C28B
	BEQ.b CODE_B8C292			;$B8C28E
	BRA.b CODE_B8C2F9			;$B8C290

CODE_B8C292:
	LDA.w #$0011				;$B8C292
	TYX					;$B8C295
	BIT.b $1E,x				;$B8C296
	BVC.b CODE_B8C29D			;$B8C298
	LDA.w #$FFEF				;$B8C29A
CODE_B8C29D:
	STA.w $191F				;$B8C29D
	LDA.w #$FFDC				;$B8C2A0
	STA.w $1921				;$B8C2A3
	LDX.b current_sprite			;$B8C2A6
	LDY.w current_held_sprite		;$B8C2A8
	JSR.w CODE_B8BA01			;$B8C2AB
	PHP					;$B8C2AE
	LDA.w $0012,y				;$B8C2AF
	SEC					;$B8C2B2
	SBC.b $12,x				;$B8C2B3
	BIT.b $1E,x				;$B8C2B5
	BVC.b CODE_B8C2BD			;$B8C2B7
	EOR.w #$FFFF				;$B8C2B9
	INC					;$B8C2BC
CODE_B8C2BD:
	STA.w $186D				;$B8C2BD
	LDA.w $0016,y				;$B8C2C0
	SEC					;$B8C2C3
	SBC.b $16,x				;$B8C2C4
	STA.w $186F				;$B8C2C6
	PLP					;$B8C2C9
	BCC.b CODE_B8C2EC			;$B8C2CA
	LDA.b $12,x				;$B8C2CC
	STA.w $081C				;$B8C2CE
	LDA.b $16,x				;$B8C2D1
	STA.w $0820				;$B8C2D3
	STY.w active_kong_sprite		;$B8C2D6
	LDX.w #aux_sprite_slot			;$B8C2D9
	JSL.l CODE_B9E021			;$B8C2DC
	LDX.b current_sprite			;$B8C2E0
	STX.w active_kong_sprite		;$B8C2E2
	LDA.w $081C				;$B8C2E5
	STA.b $5C,x				;$B8C2E8
	INC.b $5A,x				;$B8C2EA
CODE_B8C2EC:
	LDA.w #$0001				;$B8C2EC
	JSR.w CODE_B8CC29			;$B8C2EF
	JSL.l process_sprite_animation		;$B8C2F2
	JMP.w CODE_B8A075			;$B8C2F6

CODE_B8C2F9:
	TYX					;$B8C2F9
	LDA.b $5C,x				;$B8C2FA
	CMP.b $12,x				;$B8C2FC
	BEQ.b CODE_B8C315			;$B8C2FE
	BCC.b CODE_B8C306			;$B8C300
	INC.b $12,x				;$B8C302
	BRA.b CODE_B8C308			;$B8C304

CODE_B8C306:
	DEC.b $12,x				;$B8C306
CODE_B8C308:
	LDA.w #$0001				;$B8C308
	JSR.w CODE_B8CC29			;$B8C30B
	JSL.l process_sprite_animation		;$B8C30E
	JMP.w CODE_B8A075			;$B8C312

CODE_B8C315:
	LDX.b current_sprite			;$B8C315
	LDA.w #$0065				;$B8C317
	STA.b $38,x				;$B8C31A
	LDA.w #$001E				;$B8C31C
	JSR.w CODE_B8CC29			;$B8C31F
	JSR.w CODE_B8C33A			;$B8C322
	JMP.w CODE_B8A075			;$B8C325

kong_state_65:
	LDA.w #$001E				;$B8C328
	JSR.w CODE_B8CC29			;$B8C32B
	JSR.w CODE_B8C33A			;$B8C32E
	JMP.w CODE_B8A075			;$B8C331

kong_state_66:
	JSR.w CODE_B8C33A			;$B8C334
	JMP.w CODE_B8A075			;$B8C337

CODE_B8C33A:
	LDA.w #$2000				;$B8C33A
	TSB.w $0474				;$B8C33D
	JSR.w CODE_B8C369			;$B8C340
	JSR.w CODE_B8C383			;$B8C343
	JSR.w CODE_B8A035			;$B8C346
	LDY.w #$0002				;$B8C349
	LDA.w $0775				;$B8C34C
	AND.w #$0800				;$B8C34F
	BEQ.b CODE_B8C355			;$B8C352
	INY					;$B8C354
CODE_B8C355:
	TYA					;$B8C355
	JSL.l interpolate_x_speed		;$B8C356
	JSL.l CODE_B9E018			;$B8C35A
	JSL.l CODE_B9E006			;$B8C35E
	JSR.w CODE_B8C392			;$B8C362
	JSR.w CODE_B89FBC			;$B8C365
	RTS					;$B8C368

CODE_B8C369:
	LDX.b current_sprite			;$B8C369
	LDA.b $4A,x				;$B8C36B
	AND.w #$0008				;$B8C36D
	BNE.b CODE_B8C382			;$B8C370
	LDA.b $44,x				;$B8C372
	SEC					;$B8C374
	SBC.w #$000C				;$B8C375
	CMP.w #$0140				;$B8C378
	BPL.b CODE_B8C380			;$B8C37B
	LDA.w #$0140				;$B8C37D
CODE_B8C380:
	STA.b $44,x				;$B8C380
CODE_B8C382:
	RTS					;$B8C382

CODE_B8C383:
	LDX.b current_sprite			;$B8C383
	LDA.b $16,x				;$B8C385
	CMP.w #$0120				;$B8C387
	BCS.b CODE_B8C391			;$B8C38A
	LDA.w #$0010				;$B8C38C
	STA.b $2E,x				;$B8C38F
CODE_B8C391:
	RTS					;$B8C391

CODE_B8C392:
	LDX.b current_sprite			;$B8C392
	LDA.b $2E,x				;$B8C394
	BMI.b CODE_B8C3D5			;$B8C396
	LDA.b $A0				;$B8C398
	AND.w #$1800				;$B8C39A
	BNE.b CODE_B8C3F9			;$B8C39D
	LDY.w #$0024				;$B8C39F
	LDA.w current_held_sprite		;$B8C3A2
	ORA.b current_mount			;$B8C3A5
	BNE.b CODE_B8C3AC			;$B8C3A7
	LDY.w #$0008				;$B8C3A9
CODE_B8C3AC:
	STY.b $1A				;$B8C3AC
	LDA.b $1A,x				;$B8C3AE
	BPL.b CODE_B8C3C3			;$B8C3B0
	LDA.w $050F				;$B8C3B2
	BMI.b CODE_B8C3F9			;$B8C3B5
	CLC					;$B8C3B7
	ADC.w #$0020				;$B8C3B8
	SEC					;$B8C3BB
	SBC.b $16,x				;$B8C3BC
	BPL.b CODE_B8C3C3			;$B8C3BE
	LDA.w #$0000				;$B8C3C0
CODE_B8C3C3:
	CMP.b $1A				;$B8C3C3
	BCS.b CODE_B8C3F9			;$B8C3C5
	LDA.w #$FF00				;$B8C3C7
	LDY.b $F8				;$B8C3CA
	BEQ.b CODE_B8C3D1			;$B8C3CC
	LDA.w #$FF40				;$B8C3CE
CODE_B8C3D1:
	STA.b $2E,x				;$B8C3D1
	BRA.b CODE_B8C3F9			;$B8C3D3

CODE_B8C3D5:
	LDA.b $1A,x				;$B8C3D5
	BPL.b CODE_B8C3F9			;$B8C3D7
	CMP.w #$8050				;$B8C3D9
	BEQ.b CODE_B8C3F9			;$B8C3DC
	LDA.b $A0				;$B8C3DE
	AND.w #$4000				;$B8C3E0
	BNE.b CODE_B8C3F9			;$B8C3E3
	LDA.b $2E,x				;$B8C3E5
	EOR.w #$FFFF				;$B8C3E7
	INC					;$B8C3EA
	CLC					;$B8C3EB
	ADC.w #$0020				;$B8C3EC
	CMP.w #$0800				;$B8C3EF
	BCC.b CODE_B8C3F7			;$B8C3F2
	LDA.w #$0800				;$B8C3F4
CODE_B8C3F7:
	STA.b $2E,x				;$B8C3F7
CODE_B8C3F9:
	RTS					;$B8C3F9

kong_state_67:
	LDA.w #$001F				;$B8C3FA
	JSR.w CODE_B8CC29			;$B8C3FD
	JSR.w CODE_B8CBB2			;$B8C400
	JSR.w CODE_B89FAE			;$B8C403
	JSR.w CODE_B8C681			;$B8C406
	JMP.w CODE_B8A075			;$B8C409

kong_state_68:
	LDA.w #$0020				;$B8C40C
	JSR.w CODE_B8CC29			;$B8C40F
	JSR.w CODE_B8E0AE			;$B8C412
	JSR.w CODE_B8E0BF			;$B8C415
	JSR.w CODE_B89FAE			;$B8C418
	JSR.w CODE_B8C681			;$B8C41B
	JMP.w CODE_B8A075			;$B8C41E

kong_state_69:
	LDA.w #$0011				;$B8C421
	JSR.w CODE_B8CC29			;$B8C424
	JSR.w CODE_B8E0BF			;$B8C427
	JSR.w CODE_B89FAE			;$B8C42A
	JSR.w CODE_B8C681			;$B8C42D
	JMP.w CODE_B8A075			;$B8C430

kong_state_6A:
	LDA.w #$0022				;$B8C433
	JSR.w CODE_B8CC29			;$B8C436
	JSR.w CODE_B89FAE			;$B8C439
	JSR.w CODE_B8C681			;$B8C43C
	JMP.w CODE_B8A075			;$B8C43F

kong_state_6B:
	LDA.w #$0001				;$B8C442
	JSR.w CODE_B8CC29			;$B8C445
	JSR.w CODE_B8A035			;$B8C448
	JSR.w CODE_B89FB4			;$B8C44B
	JMP.w CODE_B8A075			;$B8C44E

kong_state_6C:
	LDA.w #$0023				;$B8C451
	JSR.w CODE_B8CC29			;$B8C454
	JSR.w CODE_B89FAE			;$B8C457
	JMP.w CODE_B8A075			;$B8C45A

kong_state_6D:
	LDA.w #$0024				;$B8C45D
	JSR.w CODE_B8CC29			;$B8C460
	JSR.w CODE_B89FAE			;$B8C463
	JMP.w CODE_B8A075			;$B8C466

kong_state_6E:
	JSR.w CODE_B8E1FB			;$B8C469
	JSL.l process_sprite_animation		;$B8C46C
	JSR.w CODE_B8C483			;$B8C470
	JMP.w CODE_B8A075			;$B8C473

kong_state_6F:
	JSR.w CODE_B8E1FB			;$B8C476
	JSL.l process_sprite_animation		;$B8C479
	JSR.w CODE_B8C483			;$B8C47D
	JMP.w CODE_B8A09B			;$B8C480

CODE_B8C483:
	LDX.b current_sprite			;$B8C483
	LDA.b $00,x				;$B8C485
	CMP.w #!sprite_kiddy_kong		;$B8C487
	BNE.b CODE_B8C4F7			;$B8C48A
	DEC.w $1929				;$B8C48C
	BNE.b CODE_B8C4F7			;$B8C48F
	LDY.w $04FB				;$B8C491
	LDA.w #$0000				;$B8C494
	STA.w $0014,y				;$B8C497
	LDA.w $0016,y				;$B8C49A
	PHA					;$B8C49D
	JSL.l CODE_B89C5C			;$B8C49E
	LDY.w $04FB				;$B8C4A2
	PLA					;$B8C4A5
	STA.w $0016,y				;$B8C4A6
	LDA.w #$0000				;$B8C4A9
	STA.w $0014,y				;$B8C4AC
	JSL.l CODE_B89C4C			;$B8C4AF
	JSR.w CODE_B8C6BF			;$B8C4B3
	STZ.b $26,x				;$B8C4B6
	STZ.b $2A,x				;$B8C4B8
	STZ.b $2E,x				;$B8C4BA
	LDA.w $1931				;$B8C4BC
	STA.b $12,x				;$B8C4BF
	LDA.w $1935				;$B8C4C1
	STA.b $16,x				;$B8C4C4
	LDA.w #$00E4				;$B8C4C6
	STA.b $0E,x				;$B8C4C9
	JSL.l CODE_B89C3C			;$B8C4CB
	LDA.w #$0033				;$B8C4CF
	STA.b $38,x				;$B8C4D2
	STZ.b $26,x				;$B8C4D4
	LDA.w #$00D8				;$B8C4D6
	STA.b $0E,x				;$B8C4D9
	LDX.w active_kong_sprite		;$B8C4DB
	LDY.b $1E,x				;$B8C4DE
	LDA.w #$001F				;$B8C4E0
	LDX.w #$0028				;$B8C4E3
	JSL.l CODE_B8F028			;$B8C4E6
	JSL.l CODE_BB85FD			;$B8C4EA
	JSL.l disable_timestop			;$B8C4EE
	LDX.w $0503				;$B8C4F2
	STX.b current_sprite			;$B8C4F5
CODE_B8C4F7:
	RTS					;$B8C4F7

CODE_B8C4F8:
	LDX.b current_sprite			;$B8C4F8
	LDA.b $16,x				;$B8C4FA
	SEC					;$B8C4FC
	SBC.w $1973				;$B8C4FD
	CMP.w #$0120				;$B8C500
	BPL.b CODE_B8C535			;$B8C503
	LDA.b $1C,x				;$B8C505
	AND.w #$0100				;$B8C507
	BEQ.b CODE_B8C534			;$B8C50A
	LDA.b $28,x				;$B8C50C
	AND.w #$1001				;$B8C50E
	CMP.w #$0001				;$B8C511
	BNE.b CODE_B8C534			;$B8C514
	LDA.b $3A,x				;$B8C516
	AND.w #$0100				;$B8C518
	BNE.b CODE_B8C534			;$B8C51B
	LDA.w #$0023				;$B8C51D
	JSL.l CODE_B882B6			;$B8C520
	BCS.b CODE_B8C534			;$B8C524
	LDA.w #$0768				;$B8C526
	JSL.l queue_sound_effect		;$B8C529
	LDY.w #$0074				;$B8C52D
	JSL.l CODE_BB8585			;$B8C530
CODE_B8C534:
	RTS					;$B8C534

CODE_B8C535:
	CPX.w follower_kong_sprite		;$B8C535
	BEQ.b CODE_B8C567			;$B8C538
	LDA.b $38,x				;$B8C53A
	CMP.w #$001D				;$B8C53C
	BNE.b CODE_B8C549			;$B8C53F
	LDA.b $62,x				;$B8C541
	AND.w #$00FF				;$B8C543
	BEQ.b CODE_B8C549			;$B8C546
	RTS					;$B8C548

CODE_B8C549:
	LDA.w $075C				;$B8C549
	CMP.w #$0002				;$B8C54C
	BNE.b CODE_B8C55F			;$B8C54F
	LDA.w #$0027				;$B8C551
	JSL.l CODE_B882B6			;$B8C554
	LDA.w #$0003				;$B8C558
	STA.w timestop_flags			;$B8C55B
	RTS					;$B8C55E

CODE_B8C55F:
	LDA.w #$002C				;$B8C55F
	JSL.l CODE_B882B6			;$B8C562
	RTS					;$B8C566

CODE_B8C567:
	JSR.w CODE_B89F20			;$B8C567
	RTS					;$B8C56A

CODE_B8C56B:
	LDX.b current_sprite			;$B8C56B
	LDA.b $1C,x				;$B8C56D
	AND.w #$0100				;$B8C56F
	BEQ.b CODE_B8C59E			;$B8C572
	LDA.b $28,x				;$B8C574
	AND.w #$1001				;$B8C576
	CMP.w #$0001				;$B8C579
	BNE.b CODE_B8C59E			;$B8C57C
	LDA.b $3A,x				;$B8C57E
	AND.w #$0100				;$B8C580
	BNE.b CODE_B8C59E			;$B8C583
	LDA.w #$0023				;$B8C585
	JSL.l CODE_B882B6			;$B8C588
	BCS.b CODE_B8C59E			;$B8C58C
	LDA.w #$0768				;$B8C58E
	JSL.l queue_sound_effect		;$B8C591
	LDY.w #$0074				;$B8C595
	JSL.l CODE_BB8585			;$B8C598
	CLC					;$B8C59C
	RTS					;$B8C59D

CODE_B8C59E:
	SEC					;$B8C59E
	RTS					;$B8C59F

CODE_B8C5A0:
	LDX.b current_sprite			;$B8C5A0
	LDY.b current_kong_control_variables	;$B8C5A2
	LDA.w #$01BC				;$B8C5A4
	STA.b $3A,x				;$B8C5A7
	LDA.b $F8				;$B8C5A9
	BNE.b CODE_B8C5BA			;$B8C5AB
	LDA.w #$0060				;$B8C5AD
	STA.w $0014,y				;$B8C5B0
	LDA.w #$0070				;$B8C5B3
	STA.w $0016,y				;$B8C5B6
	RTS					;$B8C5B9

CODE_B8C5BA:
	LDA.w #$0090				;$B8C5BA
	STA.w $0014,y				;$B8C5BD
	LDA.w #$00A8				;$B8C5C0
	STA.w $0016,y				;$B8C5C3
	RTS					;$B8C5C6

CODE_B8C5C7:
	LDY.b current_kong_control_variables	;$B8C5C7
	CMP.w $0016,y				;$B8C5C9
	BMI.b CODE_B8C5D8			;$B8C5CC
	STA.w $0016,y				;$B8C5CE
	LDX.b current_sprite			;$B8C5D1
	LDA.w #$01BC				;$B8C5D3
	STA.b $3A,x				;$B8C5D6
CODE_B8C5D8:
	RTS					;$B8C5D8

CODE_B8C5D9:
	JSR.w CODE_B8C616			;$B8C5D9
	JSR.w CODE_B8C647			;$B8C5DC
	LDA.w $0014,y				;$B8C5DF
	BEQ.b CODE_B8C606			;$B8C5E2
	DEC					;$B8C5E4
	STA.w $0014,y				;$B8C5E5
	BEQ.b CODE_B8C5FA			;$B8C5E8
	LDA.b active_frame_counter		;$B8C5EA
	AND.w #$0002				;$B8C5EC
	BNE.b CODE_B8C5FA			;$B8C5EF
	LDA.b $26,x				;$B8C5F1
	ORA.w #$C000				;$B8C5F3
	STA.b $26,x				;$B8C5F6
	BRA.b CODE_B8C606			;$B8C5F8

CODE_B8C5FA:
	LDA.b $26,x				;$B8C5FA
	AND.w #$3FFF				;$B8C5FC
	BEQ.b CODE_B8C604			;$B8C5FF
	ORA.w #$8000				;$B8C601
CODE_B8C604:
	STA.b $26,x				;$B8C604
CODE_B8C606:
	RTS					;$B8C606

CODE_B8C607:
	LDX.b current_sprite			;$B8C607
	LDA.b $26,x				;$B8C609
	AND.w #$3FFF				;$B8C60B
	BEQ.b CODE_B8C613			;$B8C60E
	ORA.w #$8000				;$B8C610
CODE_B8C613:
	STA.b $26,x				;$B8C613
	RTS					;$B8C615

CODE_B8C616:
	LDX.b current_sprite			;$B8C616
	CPX.w active_kong_sprite		;$B8C618
	BNE.b CODE_B8C646			;$B8C61B
	LDA.b $CA				;$B8C61D
	BEQ.b CODE_B8C646			;$B8C61F
	LDA.w #$0509				;$B8C621
	JSL.l CODE_B28024			;$B8C624
	DEC.b $CA				;$B8C628
	LDA.b $CA				;$B8C62A
	AND.w #$0002				;$B8C62C
	BNE.b CODE_B8C63C			;$B8C62F
	LDA.w #$0080				;$B8C631
	TRB.w $1959				;$B8C634
	JSL.l CODE_BB8600			;$B8C637
	RTS					;$B8C63B

CODE_B8C63C:
	LDA.w #$0080				;$B8C63C
	TSB.w $1959				;$B8C63F
	JSL.l CODE_BB8600			;$B8C642
CODE_B8C646:
	RTS					;$B8C646

CODE_B8C647:
	LDX.b current_sprite			;$B8C647
	LDY.b current_kong_control_variables	;$B8C649
	LDA.w $0016,y				;$B8C64B
	BEQ.b CODE_B8C662			;$B8C64E
	DEC					;$B8C650
	STA.w $0016,y				;$B8C651
	BEQ.b CODE_B8C65D			;$B8C654
	LDA.w #$01BC				;$B8C656
	STA.b $3A,x				;$B8C659
	BRA.b CODE_B8C662			;$B8C65B

CODE_B8C65D:
	LDA.w #$00BC				;$B8C65D
	STA.b $3A,x				;$B8C660
CODE_B8C662:
	RTS					;$B8C662

CODE_B8C663:
	LDY.w $1879				;$B8C663
	BEQ.b CODE_B8C680			;$B8C666
	LDX.b current_sprite			;$B8C668
	LDA.b $12,x				;$B8C66A
	CMP.w $0012,y				;$B8C66C
	BCC.b CODE_B8C676			;$B8C66F
	LDA.w #$0200				;$B8C671
	BRA.b CODE_B8C679			;$B8C674

CODE_B8C676:
	LDA.w #$FE00				;$B8C676
CODE_B8C679:
	CLC					;$B8C679
	ADC.w $0036,y				;$B8C67A
	STA.w $0036,y				;$B8C67D
CODE_B8C680:
	RTS					;$B8C680

CODE_B8C681:
	JSR.w CODE_B8C687			;$B8C681
	BCS.b CODE_B8C686			;$B8C684
CODE_B8C686:
	RTS					;$B8C686

CODE_B8C687:
	LDA.w $050F				;$B8C687
	BMI.b CODE_B8C694			;$B8C68A
	JSR.w check_sprite_underwater		;$B8C68C
	CMP.w #$0001				;$B8C68F
	BCS.b CODE_B8C696			;$B8C692
CODE_B8C694:
	CLC					;$B8C694
	RTS					;$B8C695

CODE_B8C696:
	BNE.b CODE_B8C69F			;$B8C696
	LDA.b current_animal_type		;$B8C698
	CMP.w #!sprite_ellie			;$B8C69A
	BNE.b CODE_B8C694			;$B8C69D
CODE_B8C69F:
	LDA.b $38,x				;$B8C69F
	CMP.w #$0024				;$B8C6A1
	BEQ.b CODE_B8C6AB			;$B8C6A4
	CMP.w #$0069				;$B8C6A6
	BNE.b CODE_B8C6B3			;$B8C6A9
CODE_B8C6AB:
	LDA.b $2E,x				;$B8C6AB
	CLC					;$B8C6AD
	ADC.w #$0400				;$B8C6AE
	BMI.b CODE_B8C694			;$B8C6B1
CODE_B8C6B3:
	JSR.w CODE_B898AB			;$B8C6B3
	JSL.l CODE_B89C01			;$B8C6B6
	JSR.w CODE_B8C6BF			;$B8C6BA
	SEC					;$B8C6BD
	RTS					;$B8C6BE

CODE_B8C6BF:
	STZ.w $04AA				;$B8C6BF
	STZ.w $04AE				;$B8C6C2
	LDA.b current_animal_type		;$B8C6C5
	BNE.b CODE_B8C6DB			;$B8C6C7
	JSR.w CODE_B8C6DE			;$B8C6C9
	LDX.b current_sprite			;$B8C6CC
	LDA.w #$0018				;$B8C6CE
	STA.b $38,x				;$B8C6D1
	LDA.w #$0028				;$B8C6D3
	JSL.l set_anim_handle_kiddy		;$B8C6D6
	RTS					;$B8C6DA

CODE_B8C6DB:
	JMP.w CODE_B8C6F3			;$B8C6DB

CODE_B8C6DE:
	LDY.w #$0228				;$B8C6DE
	LDA.b [$6A],y				;$B8C6E1
	LDY.b current_kong_control_variables	;$B8C6E3
	STA.w $0008,y				;$B8C6E5
	LDY.w #$0230				;$B8C6E8
	LDA.b [$6A],y				;$B8C6EB
	LDY.b current_kong_control_variables	;$B8C6ED
	STA.w $000A,y				;$B8C6EF
	RTS					;$B8C6F2

CODE_B8C6F3:
	LDX.b current_sprite			;$B8C6F3
	LDA.b $3A,x				;$B8C6F5
	AND.w #$FFFB				;$B8C6F7
	STA.b $3A,x				;$B8C6FA
	LDA.w #$0025				;$B8C6FC
	STA.b $38,x				;$B8C6FF
	LDA.w #$000B				;$B8C701
	JSL.l set_anim_handle_animal_and_kiddy	;$B8C704
	LDX current_kong_control_variables	;$B8C708
	STZ.b $08,x				;$B8C70A
	LDX.b current_sprite			;$B8C70C
	STZ.b $30,x				;$B8C70E
	STZ.b $2E,x				;$B8C710
	LDA.w $050F				;$B8C712
	CLC					;$B8C715
	ADC.w #$0014				;$B8C716
	CMP.b $16,x				;$B8C719
	BCC.b CODE_B8C72F			;$B8C71B
	STA.b $16,x				;$B8C71D
	LDA.w $04AD				;$B8C71F
	AND.w #$00FF				;$B8C722
	EOR.w #$FFFF				;$B8C725
	SEC					;$B8C728
	ADC.w $050F				;$B8C729
	STA.w $04A2				;$B8C72C
CODE_B8C72F:
	LDX.w #$0000				;$B8C72F
	LDY.w $187D				;$B8C732
	JSL.l CODE_B8E587			;$B8C735
	RTS					;$B8C739

check_sprite_underwater:
	LDX current_sprite			;$B8C73A
	LDA $050F				;$B8C73C
	BMI .no_water				;$B8C73F
	SEC					;$B8C741
	SBC sprite.y_position,x			;$B8C742
	CMP #$FFEC				;$B8C744
	BMI .in_water				;$B8C747
	CMP #$FFF8				;$B8C749
	BPL .no_water				;$B8C74C
	LDA #$0001				;$B8C74E
	RTS					;$B8C751

.no_water:
	LDA.w #$0000				;$B8C752
	RTS					;$B8C755

.in_water:
	LDA.w #$0002				;$B8C756
	RTS					;$B8C759

CODE_B8C75A:
	LDA.w $1955				;$B8C75A
	BEQ.b CODE_B8C764			;$B8C75D
	DEC.w $1955				;$B8C75F
	BRA.b CODE_B8C78C			;$B8C762

CODE_B8C764:
	JSR.w CODE_B8C911			;$B8C764
	BCS.b CODE_B8C78C			;$B8C767
	LDA.w $0777				;$B8C769
	AND.w #$0003				;$B8C76C
	BEQ.b CODE_B8C776			;$B8C76F
	JSR.w CODE_B8C874			;$B8C771
	BCS.b CODE_B8C78C			;$B8C774
CODE_B8C776:
	LDY current_kong_control_variables	;$B8C776
	LDA.w $0028,y				;$B8C778
	BEQ.b CODE_B8C78C			;$B8C77B
	JSR.w CODE_B8C793			;$B8C77D
	BCS.b CODE_B8C78C			;$B8C780
	LDY current_kong_control_variables	;$B8C782
	LDA.w $002E,y				;$B8C784
	BEQ.b CODE_B8C78C			;$B8C787
	JSR.w CODE_B8C793			;$B8C789
CODE_B8C78C:
	LDX current_kong_control_variables	;$B8C78C
	STZ.b $28,x				;$B8C78E
	STZ.b $2E,x				;$B8C790
	RTS					;$B8C792

CODE_B8C793:
	STA.b $78				;$B8C793
	TAX					;$B8C795
	LDA.w $002A,y				;$B8C796
	STA.b $42				;$B8C799
	LDA.w $002C,y				;$B8C79B
	STA.b $44				;$B8C79E
	PHK					;$B8C7A0
	%return(CODE_B8C7A7)			;$B8C7A1
	JMP.w [$0042]				;$B8C7A4

CODE_B8C7A7:
	LDA.b $DE				;$B8C7A7
	SEC					;$B8C7A9
	SBC.b $DA				;$B8C7AA
	CMP.w #$0008				;$B8C7AC
	BCC.b CODE_B8C7B4			;$B8C7AF
	JMP.w CODE_B8C817			;$B8C7B1

CODE_B8C7B4:
	LDX.b current_sprite			;$B8C7B4
	LDA.b $16,x				;$B8C7B6
	SEC					;$B8C7B8
	SBC.w #$0018				;$B8C7B9
	CMP.b $DA				;$B8C7BC
	BCC.b CODE_B8C815			;$B8C7BE
	SBC.w #$0014				;$B8C7C0
	CMP.b $DE				;$B8C7C3
	BCS.b CODE_B8C815			;$B8C7C5
	LDA.b $12,x				;$B8C7C7
	STA.b $3E				;$B8C7C9
	LDA.b $D8				;$B8C7CB
	SEC					;$B8C7CD
	SBC.b $3E				;$B8C7CE
	BCC.b CODE_B8C7E1			;$B8C7D0
	CMP.w #$0004				;$B8C7D2
	BCC.b CODE_B8C7DB			;$B8C7D5
	BIT.b $1E,x				;$B8C7D7
	BVS.b CODE_B8C815			;$B8C7D9
CODE_B8C7DB:
	LDA.b $D8				;$B8C7DB
	STA.b $3E				;$B8C7DD
	BRA.b CODE_B8C7F5			;$B8C7DF

CODE_B8C7E1:
	LDA.b $DC				;$B8C7E1
	SEC					;$B8C7E3
	SBC.b $3E				;$B8C7E4
	BCS.b CODE_B8C7F5			;$B8C7E6
	CMP.w #$FFFC				;$B8C7E8
	BCS.b CODE_B8C7F1			;$B8C7EB
	BIT.b $1E,x				;$B8C7ED
	BVC.b CODE_B8C815			;$B8C7EF
CODE_B8C7F1:
	LDA.b $DC				;$B8C7F1
	STA.b $3E				;$B8C7F3
CODE_B8C7F5:
	LDA.w #$0007				;$B8C7F5
	JSL.l CODE_B882B6			;$B8C7F8
	BCS.b CODE_B8C815			;$B8C7FC
	LDA.b $3E				;$B8C7FE
	LDA.b $D8				;$B8C800
	CLC					;$B8C802
	ADC.b $DC				;$B8C803
	LSR					;$B8C805
	STA.w $17CA				;$B8C806
	LDA.b $DA				;$B8C809
	STA.w $17CC				;$B8C80B
	LDA.b $78				;$B8C80E
	STA.w $17CE				;$B8C810
	SEC					;$B8C813
	RTS					;$B8C814

CODE_B8C815:
	CLC					;$B8C815
	RTS					;$B8C816

CODE_B8C817:
	LDX.b current_sprite			;$B8C817
	LDA.b $16,x				;$B8C819
	SEC					;$B8C81B
	SBC.w #$0018				;$B8C81C
	CMP.b $DA				;$B8C81F
	BCC.b CODE_B8C872			;$B8C821
	SBC.w #$0014				;$B8C823
	CMP.b $DE				;$B8C826
	BCS.b CODE_B8C872			;$B8C828
	LDA.b $12,x				;$B8C82A
	STA.b $3E				;$B8C82C
	LDA.b $D8				;$B8C82E
	SEC					;$B8C830
	SBC.b $3E				;$B8C831
	BCC.b CODE_B8C844			;$B8C833
	CMP.w #$0004				;$B8C835
	BCC.b CODE_B8C83E			;$B8C838
	BIT.b $1E,x				;$B8C83A
	BVS.b CODE_B8C872			;$B8C83C
CODE_B8C83E:
	LDA.b $D8				;$B8C83E
	STA.b $3E				;$B8C840
	BRA.b CODE_B8C858			;$B8C842

CODE_B8C844:
	LDA.b $DC				;$B8C844
	SEC					;$B8C846
	SBC.b $3E				;$B8C847
	BCS.b CODE_B8C858			;$B8C849
	CMP.w #$FFFC				;$B8C84B
	BCS.b CODE_B8C854			;$B8C84E
	BIT.b $1E,x				;$B8C850
	BVC.b CODE_B8C872			;$B8C852
CODE_B8C854:
	LDA.b $DC				;$B8C854
	STA.b $3E				;$B8C856
CODE_B8C858:
	LDA.w #$0008				;$B8C858
	JSL.l CODE_B882B6			;$B8C85B
	BCS.b CODE_B8C872			;$B8C85F
	LDA.b $42				;$B8C861
	STA.w $17CA				;$B8C863
	LDA.b $44				;$B8C866
	STA.w $17CC				;$B8C868
	LDA.b $78				;$B8C86B
	STA.w $17C8				;$B8C86D
	SEC					;$B8C870
	RTS					;$B8C871

CODE_B8C872:
	CLC					;$B8C872
	RTS					;$B8C873

CODE_B8C874:
	LDA.w $0777				;$B8C874
	AND.w #$0002				;$B8C877
	BEQ.b CODE_B8C8CA			;$B8C87A
	JSR.w CODE_B8C990			;$B8C87C
	BCS.b CODE_B8C8CA			;$B8C87F
	LDA.b $12,x				;$B8C881
	STA.b $3E				;$B8C883
	LDA.b $3A				;$B8C885
	SEC					;$B8C887
	SBC.b $3E				;$B8C888
	BCC.b CODE_B8C89B			;$B8C88A
	CMP.w #$0004				;$B8C88C
	BCC.b CODE_B8C895			;$B8C88F
	BIT.b $1E,x				;$B8C891
	BVS.b CODE_B8C8CA			;$B8C893
CODE_B8C895:
	LDA.b $3A				;$B8C895
	STA.b $3E				;$B8C897
	BRA.b CODE_B8C8AF			;$B8C899

CODE_B8C89B:
	LDA.b $3C				;$B8C89B
	SEC					;$B8C89D
	SBC.b $3E				;$B8C89E
	BCS.b CODE_B8C8AF			;$B8C8A0
	CMP.w #$FFFC				;$B8C8A2
	BCS.b CODE_B8C8AB			;$B8C8A5
	BIT.b $1E,x				;$B8C8A7
	BVC.b CODE_B8C8CA			;$B8C8A9
CODE_B8C8AB:
	LDA.b $3C				;$B8C8AB
	STA.b $3E				;$B8C8AD
CODE_B8C8AF:
	LDA.w #$0009				;$B8C8AF
	JSL.l CODE_B882B6			;$B8C8B2
	BCS.b CODE_B8C8C8			;$B8C8B6
	LDA.b $3E				;$B8C8B8
	STA.w $17CA				;$B8C8BA
	LDA.b $40				;$B8C8BD
	STA.w $17CC				;$B8C8BF
	LDA.b $A2				;$B8C8C2
	STA.b $1C,x				;$B8C8C4
	SEC					;$B8C8C6
	RTS					;$B8C8C7

CODE_B8C8C8:
	CLC					;$B8C8C8
	RTS					;$B8C8C9

CODE_B8C8CA:
	JSR.w CODE_B8CA3C			;$B8C8CA
CODE_B8C8CD:
	BCS.b CODE_B8C8FA			;$B8C8CD
	LDA.b $3C				;$B8C8CF
	BEQ.b CODE_B8C90F			;$B8C8D1
	LDA.b $3A				;$B8C8D3
	BEQ.b CODE_B8C8E3			;$B8C8D5
	SEC					;$B8C8D7
	SBC.w #$0020				;$B8C8D8
	CMP.b $16,x				;$B8C8DB
	BCS.b CODE_B8C90F			;$B8C8DD
	LDA.b $3A				;$B8C8DF
	BRA.b CODE_B8C8F8			;$B8C8E1

CODE_B8C8E3:
	LDA.w #$000C				;$B8C8E3
	BIT.b $2E,x				;$B8C8E6
	BPL.b CODE_B8C8ED			;$B8C8E8
	LDA.w #$0000				;$B8C8EA
CODE_B8C8ED:
	CLC					;$B8C8ED
	ADC.b $3C				;$B8C8EE
	CMP.b $16,x				;$B8C8F0
	BCC.b CODE_B8C90F			;$B8C8F2
	LDA.b $3C				;$B8C8F4
	BRA.b CODE_B8C8F8			;$B8C8F6

CODE_B8C8F8:
	STA.b $40				;$B8C8F8
CODE_B8C8FA:
	LDA.w #$000A				;$B8C8FA
	JSL.l CODE_B882B6			;$B8C8FD
	BCS.b CODE_B8C90F			;$B8C901
	LDA.b $3E				;$B8C903
	STA.w $17CA				;$B8C905
	LDA.b $40				;$B8C908
	STA.w $17CC				;$B8C90A
	SEC					;$B8C90D
	RTS					;$B8C90E

CODE_B8C90F:
	CLC					;$B8C90F
	RTS					;$B8C910

CODE_B8C911:
	LDA.b current_animal_type		;$B8C911
	BNE.b CODE_B8C91C			;$B8C913
	LDA.w current_held_sprite		;$B8C915
	BNE.b CODE_B8C91C			;$B8C918
	CLC					;$B8C91A
	RTS					;$B8C91B

CODE_B8C91C:
	SEC					;$B8C91C
	RTS					;$B8C91D

CODE_B8C91E:
	JSL.l CODE_B8C94F			;$B8C91E
	JSR.w CODE_B8C936			;$B8C922
	RTL					;$B8C925

CODE_B8C926:
	JSL.l CODE_B8C94F			;$B8C926
	BRA.b CODE_B8C936			;$B8C92A

CODE_B8C92C:
	JSL.l CODE_B8C94B			;$B8C92C
	BRA.b CODE_B8C936			;$B8C930

CODE_B8C932:
	JSL.l CODE_B8C949			;$B8C932
CODE_B8C936:
	CMP.w #$0000				;$B8C936
	BMI.b CODE_B8C944			;$B8C939
	EOR.w #$FFFF				;$B8C93B
	SEC					;$B8C93E
	ADC.w #$6300				;$B8C93F
	CLC					;$B8C942
	RTS					;$B8C943

CODE_B8C944:
	LDA.w #$7F00				;$B8C944
	SEC					;$B8C947
	RTS					;$B8C948

CODE_B8C949:
	LDA.b $16,x				;$B8C949
CODE_B8C94B:
	STA.b $1C				;$B8C94B
	LDA.b $12,x				;$B8C94D
CODE_B8C94F:
	SEC					;$B8C94F
	SBC.w #$0100				;$B8C950
	STA.b $1A				;$B8C953
	JML.l CODE_B7C766			;$B8C955

CODE_B8C959:
	LDX.b current_sprite			;$B8C959
	LDA.b $16,x				;$B8C95B
	SEC					;$B8C95D
	SBC.w #$0028				;$B8C95E
	STA.b $3E				;$B8C961
	JSR.w CODE_B8C92C			;$B8C963
	STA.b $40				;$B8C966
	LDA.b $A2				;$B8C968
	BIT.w #$0800				;$B8C96A
	BEQ.b CODE_B8C97D			;$B8C96D
	AND.b $A0				;$B8C96F
	BNE.b CODE_B8C97B			;$B8C971
	LDA.b $3E				;$B8C973
	AND.w #$FFE0				;$B8C975
	INC					;$B8C978
	STA.b $40				;$B8C979
CODE_B8C97B:
	BRA.b CODE_B8C9C7			;$B8C97B

CODE_B8C97D:
	LDA.b $54,x				;$B8C97D
	AND.w #$FFF0				;$B8C97F
	CLC					;$B8C982
	ADC.w $0519				;$B8C983
	STA.b $3A				;$B8C986
	CLC					;$B8C988
	ADC.w $051B				;$B8C989
	STA.b $3C				;$B8C98C
	CLC					;$B8C98E
	RTS					;$B8C98F

CODE_B8C990:
	LDX.b current_sprite			;$B8C990
	LDA.b $16,x				;$B8C992
	SEC					;$B8C994
	SBC.w #$0028				;$B8C995
	STA.b $3E				;$B8C998
	JSR.w CODE_B8C92C			;$B8C99A
	STA.b $40				;$B8C99D
	LDA.w #$0800				;$B8C99F
	AND.b $A2				;$B8C9A2
	BEQ.b CODE_B8C9C5			;$B8C9A4
	AND.b $A0				;$B8C9A6
	BNE.b CODE_B8C9B2			;$B8C9A8
	LDA.b $3E				;$B8C9AA
	AND.w #$FFE0				;$B8C9AC
	INC					;$B8C9AF
	STA.b $40				;$B8C9B0
CODE_B8C9B2:
	LDA.b $40				;$B8C9B2
	CLC					;$B8C9B4
	ADC.w #$0028				;$B8C9B5
	CMP.b $16,x				;$B8C9B8
	BEQ.b CODE_B8C9C7			;$B8C9BA
	ROR.b $1A				;$B8C9BC
	CMP.b $56,x				;$B8C9BE
	ROR					;$B8C9C0
	EOR.b $1A				;$B8C9C1
	BMI.b CODE_B8C9C7			;$B8C9C3
CODE_B8C9C5:
	SEC					;$B8C9C5
	RTS					;$B8C9C6

CODE_B8C9C7:
	LDA.b $12,x				;$B8C9C7
	AND.w #$FFF0				;$B8C9C9
	CLC					;$B8C9CC
	ADC.w $0519				;$B8C9CD
	STA.b $3A				;$B8C9D0
	CLC					;$B8C9D2
	ADC.w $051B				;$B8C9D3
	STA.b $3C				;$B8C9D6
	LDA.b $3A				;$B8C9D8
	SEC					;$B8C9DA
	SBC.w #$0010				;$B8C9DB
	JSR.w CODE_B8CA00			;$B8C9DE
	BEQ.b CODE_B8C9EB			;$B8C9E1
	LDA.b $3A				;$B8C9E3
	SEC					;$B8C9E5
	SBC.w #$0010				;$B8C9E6
	STA.b $3A				;$B8C9E9
CODE_B8C9EB:
	LDA.b $3C				;$B8C9EB
	CLC					;$B8C9ED
	ADC.w #$0010				;$B8C9EE
	JSR.w CODE_B8CA00			;$B8C9F1
	BEQ.b CODE_B8C9FE			;$B8C9F4
	LDA.b $3C				;$B8C9F6
	CLC					;$B8C9F8
	ADC.w #$0010				;$B8C9F9
	STA.b $3C				;$B8C9FC
CODE_B8C9FE:
	CLC					;$B8C9FE
	RTS					;$B8C9FF

CODE_B8CA00:
	LDY.b $40				;$B8CA00
	STY.b $1C				;$B8CA02
	JSR.w CODE_B8C926			;$B8CA04
	LDA.b $A2				;$B8CA07
	AND.w #$0800				;$B8CA09
	RTS					;$B8CA0C

CODE_B8CA0D:
	LDX.b current_sprite			;$B8CA0D
	LDA.b $12,x				;$B8CA0F
	STA.b $3E				;$B8CA11
	JSR.w CODE_B8CA55			;$B8CA13
	BCS.b CODE_B8CA3B			;$B8CA16
	LDA.b $3A				;$B8CA18
	ORA.b $3C				;$B8CA1A
	BNE.b CODE_B8CA3B			;$B8CA1C
	LDA.b $40				;$B8CA1E
	INC					;$B8CA20
	STA.b $3A				;$B8CA21
	LDA.w #$0028				;$B8CA23
	LDY current_kong_control_variables	;$B8CA26
	CPY.w #$1480				;$B8CA28
	BEQ.b CODE_B8CA30			;$B8CA2B
	LDA.w #$0035				;$B8CA2D
CODE_B8CA30:
	CLC					;$B8CA30
	ADC.b $3A				;$B8CA31
	STA.b $3A				;$B8CA33
	LDA.w #$FFFF				;$B8CA35
	STA.b $3C				;$B8CA38
	CLC					;$B8CA3A
CODE_B8CA3B:
	RTS					;$B8CA3B

CODE_B8CA3C:
	LDA.w $0777				;$B8CA3C
	AND.w #$0001				;$B8CA3F
	BEQ.b CODE_B8CA81			;$B8CA42
	LDX.b current_sprite			;$B8CA44
	LDA.w #$0004				;$B8CA46
	BIT.b $1E,x				;$B8CA49
	BVS.b CODE_B8CA50			;$B8CA4B
	LDA.w #$0008				;$B8CA4D
CODE_B8CA50:
	CLC					;$B8CA50
	ADC.b $12,x				;$B8CA51
	STA.b $3E				;$B8CA53
CODE_B8CA55:
	LDA.w #$FFD8				;$B8CA55
	LDY current_kong_control_variables	;$B8CA58
	CPY.w #$1480				;$B8CA5A
	BEQ.b CODE_B8CA62			;$B8CA5D
	LDA.w #$FFCB				;$B8CA5F
CODE_B8CA62:
	CLC					;$B8CA62
	ADC.b $16,x				;$B8CA63
	STA.b $40				;$B8CA65
	STA.b $1C				;$B8CA67
	LDA.b $3E				;$B8CA69
	AND.w #$FFF0				;$B8CA6B
	ORA.w #$0003				;$B8CA6E
	STA.b $3E				;$B8CA71
	JSR.w CODE_B8C926			;$B8CA73
	STA.b $3A				;$B8CA76
	LDA.b $A0				;$B8CA78
	ORA.b $A2				;$B8CA7A
	AND.w #$1000				;$B8CA7C
	BNE.b CODE_B8CA87			;$B8CA7F
CODE_B8CA81:
	STZ.b $3A				;$B8CA81
	STZ.b $3C				;$B8CA83
	CLC					;$B8CA85
	RTS					;$B8CA86

CODE_B8CA87:
	AND.b $A0				;$B8CA87
	BEQ.b CODE_B8CA99			;$B8CA89
	LDA.b $40				;$B8CA8B
	SEC					;$B8CA8D
	SBC.b $3A				;$B8CA8E
	BCC.b CODE_B8CAE7			;$B8CA90
	CMP.w #$0020				;$B8CA92
	BCC.b CODE_B8CAE7			;$B8CA95
	BCS.b CODE_B8CAB7			;$B8CA97
CODE_B8CA99:
	LDA.b $40				;$B8CA99
	AND.w #$FFE0				;$B8CA9B
	SEC					;$B8CA9E
	SBC.w #$001F				;$B8CA9F
	JSR.w CODE_B8CB00			;$B8CAA2
	BNE.b CODE_B8CAB1			;$B8CAA5
	LDA.b $40				;$B8CAA7
	CLC					;$B8CAA9
	ADC.w #$0020				;$B8CAAA
	STA.b $3A				;$B8CAAD
	BRA.b CODE_B8CAE7			;$B8CAAF

CODE_B8CAB1:
	LDA.b $40				;$B8CAB1
	STA.b $3A				;$B8CAB3
	BRA.b CODE_B8CAE7			;$B8CAB5

CODE_B8CAB7:
	LDA.b $16,x				;$B8CAB7
	CLC					;$B8CAB9
	ADC.w #$0008				;$B8CABA
	JSR.w CODE_B8CB00			;$B8CABD
	BNE.b CODE_B8CADE			;$B8CAC0
	LDA.w #$000F				;$B8CAC2
	TSB.b $40				;$B8CAC5
CODE_B8CAC7:
	LDA.b $40				;$B8CAC7
	SEC					;$B8CAC9
	SBC.w #$0010				;$B8CACA
	JSR.w CODE_B8CB00			;$B8CACD
	BEQ.b CODE_B8CAC7			;$B8CAD0
	STZ.b $3A				;$B8CAD2
	LDA.b $40				;$B8CAD4
	SEC					;$B8CAD6
	SBC.w #$0007				;$B8CAD7
	STA.b $3C				;$B8CADA
	CLC					;$B8CADC
	RTS					;$B8CADD

CODE_B8CADE:
	STZ.b $3A				;$B8CADE
	LDA.w #$FFFF				;$B8CAE0
	STA.b $3C				;$B8CAE3
	SEC					;$B8CAE5
	RTS					;$B8CAE6

CODE_B8CAE7:
	LDA.w #$0028				;$B8CAE7
	LDY current_kong_control_variables	;$B8CAEA
	CPY.w #$1480				;$B8CAEC
	BEQ.b CODE_B8CAF4			;$B8CAEF
	LDA.w #$0035				;$B8CAF1
CODE_B8CAF4:
	CLC					;$B8CAF4
	ADC.b $3A				;$B8CAF5
	STA.b $3A				;$B8CAF7
	LDA.w #$FFFF				;$B8CAF9
	STA.b $3C				;$B8CAFC
	CLC					;$B8CAFE
	RTS					;$B8CAFF

CODE_B8CB00:
	LDY.b $A2				;$B8CB00
	STY.b $A8				;$B8CB02
	STA.b $40				;$B8CB04
	STA.b $1C				;$B8CB06
	LDA.b $3E				;$B8CB08
	JSR.w CODE_B8C926			;$B8CB0A
	STA.b $3A				;$B8CB0D
	LDA.b $A2				;$B8CB0F
	LDY.b $A8				;$B8CB11
	STY.b $A2				;$B8CB13
	AND.w #$1000				;$B8CB15
	RTS					;$B8CB18

CODE_B8CB19:
	CLC					;$B8CB19
	LDY current_kong_control_variables	;$B8CB1A
	LDA.w $0028,y				;$B8CB1C
	BEQ.b CODE_B8CB30			;$B8CB1F
	JSR.w CODE_B8CB37			;$B8CB21
	BCS.b CODE_B8CB30			;$B8CB24
	LDY current_kong_control_variables	;$B8CB26
	LDA.w $002E,y				;$B8CB28
	BEQ.b CODE_B8CB30			;$B8CB2B
	JSR.w CODE_B8CB37			;$B8CB2D
CODE_B8CB30:
	LDX current_kong_control_variables	;$B8CB30
	STZ.b $28,x				;$B8CB32
	STZ.b $2E,x				;$B8CB34
	RTS					;$B8CB36

CODE_B8CB37:
	STA.b $78				;$B8CB37
	TAX					;$B8CB39
	LDA.w $002A,y				;$B8CB3A
	STA.b $42				;$B8CB3D
	LDA.w $002C,y				;$B8CB3F
	STA.b $44				;$B8CB42
	PHK					;$B8CB44
	%return(CODE_B8CB4B)			;$B8CB45
	JMP.w [$0042]				;$B8CB48

CODE_B8CB4B:
	LDA.b $DE				;$B8CB4B
	SEC					;$B8CB4D
	SBC.b $DA				;$B8CB4E
	CMP.w #$0008				;$B8CB50
	BCS.b CODE_B8CB98			;$B8CB53
	LDX.b current_sprite			;$B8CB55
	LDA.b $16,x				;$B8CB57
	SEC					;$B8CB59
	SBC.w #$0018				;$B8CB5A
	CMP.b $DA				;$B8CB5D
	BCC.b CODE_B8CB98			;$B8CB5F
	SBC.w #$0014				;$B8CB61
	CMP.b $DE				;$B8CB64
	BCS.b CODE_B8CB98			;$B8CB66
	LDA.b $12,x				;$B8CB68
	STA.b $3E				;$B8CB6A
	LDA.b $D8				;$B8CB6C
	SEC					;$B8CB6E
	SBC.b $3E				;$B8CB6F
	BCC.b CODE_B8CB82			;$B8CB71
	CMP.w #$0004				;$B8CB73
	BCC.b CODE_B8CB7C			;$B8CB76
	BIT.b $1E,x				;$B8CB78
	BVS.b CODE_B8CB98			;$B8CB7A
CODE_B8CB7C:
	LDA.b $D8				;$B8CB7C
	STA.b $3E				;$B8CB7E
	BRA.b CODE_B8CB9A			;$B8CB80

CODE_B8CB82:
	LDA.b $DC				;$B8CB82
	SEC					;$B8CB84
	SBC.b $3E				;$B8CB85
	BCS.b CODE_B8CB9A			;$B8CB87
	CMP.w #$FFFC				;$B8CB89
	BCS.b CODE_B8CB92			;$B8CB8C
	BIT.b $1E,x				;$B8CB8E
	BVC.b CODE_B8CB98			;$B8CB90
CODE_B8CB92:
	LDA.b $DC				;$B8CB92
	STA.b $3E				;$B8CB94
	BRA.b CODE_B8CB9A			;$B8CB96

CODE_B8CB98:
	CLC					;$B8CB98
	RTS					;$B8CB99

CODE_B8CB9A:
	LDX.b current_sprite			;$B8CB9A
	LDA.b $D8				;$B8CB9C
	CLC					;$B8CB9E
	ADC.b $DC				;$B8CB9F
	LSR					;$B8CBA1
	STA.b $12,x				;$B8CBA2
	LDA.b $DA				;$B8CBA4
	CLC					;$B8CBA6
	ADC.w #$002A				;$B8CBA7
	STA.b $16,x				;$B8CBAA
	LDA.b $78				;$B8CBAC
	STA.b $4C,x				;$B8CBAE
	SEC					;$B8CBB0
	RTS					;$B8CBB1

CODE_B8CBB2:
	LDX.b current_sprite			;$B8CBB2
	LDA.b $4A,x				;$B8CBB4
	AND.w #$0001				;$B8CBB6
	BEQ.b CODE_B8CBBC			;$B8CBB9
	RTS					;$B8CBBB

CODE_B8CBBC:
	LDA.b $18,x				;$B8CBBC
	BMI.b CODE_B8CBCB			;$B8CBBE
	SEC					;$B8CBC0
	SBC.b $16,x				;$B8CBC1
	BCC.b CODE_B8CBCA			;$B8CBC3
	CMP.w #$0004				;$B8CBC5
	BCS.b CODE_B8CBCB			;$B8CBC8
CODE_B8CBCA:
	RTS					;$B8CBCA

CODE_B8CBCB:
	JSL.l CODE_B8E198			;$B8CBCB
	JSL.l CODE_B8E15A			;$B8CBCF
	LDA.b current_animal_type		;$B8CBD3
	BNE.b CODE_B8CBF5			;$B8CBD5
	LDA.w current_held_sprite		;$B8CBD7
	CMP.w follower_kong_sprite		;$B8CBDA
	BEQ.b CODE_B8CC13			;$B8CBDD
	LDX.b current_sprite			;$B8CBDF
	LDA.w #$0002				;$B8CBE1
	STA.b $38,x				;$B8CBE4
	LDA.w #$0100				;$B8CBE6
	STA.b $2E,x				;$B8CBE9
	STZ.b $34,x				;$B8CBEB
	LDA.w #$000C				;$B8CBED
	JSL.l set_anim_handle_kiddy		;$B8CBF0
	RTS					;$B8CBF4

CODE_B8CBF5:
	LDX.b current_sprite			;$B8CBF5
	LDY.w #$0024				;$B8CBF7
	CMP.w #!sprite_ellie			;$B8CBFA
	BEQ.b CODE_B8CC02			;$B8CBFD
	LDY.w #$0068				;$B8CBFF
CODE_B8CC02:
	STY.b $38,x				;$B8CC02
	LDA.w #$0100				;$B8CC04
	STA.b $2E,x				;$B8CC07
	STZ.b $34,x				;$B8CC09
	LDA.w #$0006				;$B8CC0B
	JSL.l set_anim_handle_animal_and_kiddy	;$B8CC0E
	RTS					;$B8CC12

CODE_B8CC13:
	LDX.b current_sprite			;$B8CC13
	LDA.w #$0044				;$B8CC15
	STA.b $38,x				;$B8CC18
	LDA.w #$0100				;$B8CC1A
	STA.b $2E,x				;$B8CC1D
	STZ.b $34,x				;$B8CC1F
	LDA.w #$0031				;$B8CC21
	JSL.l set_anim_handle_kiddy		;$B8CC24
	RTS					;$B8CC28

CODE_B8CC29:
	ASL					;$B8CC29
	STA.w $04DE				;$B8CC2A
	LDA.w #$0001				;$B8CC2D
	TRB.w $05B1				;$B8CC30
	LDX.b current_sprite			;$B8CC33
	CPX.w active_kong_sprite		;$B8CC35
	BNE.b CODE_B8CC4C			;$B8CC38
	LDA.w screen_brightness			;$B8CC3A
	BMI.b CODE_B8CC4C			;$B8CC3D
	CMP.w #$0100				;$B8CC3F
	BCC.b CODE_B8CC4E			;$B8CC42
	AND.w #$00FF				;$B8CC44
	CMP.w #$0004				;$B8CC47
	BCS.b CODE_B8CC4E			;$B8CC4A
CODE_B8CC4C:
	CLC					;$B8CC4C
	RTS					;$B8CC4D

CODE_B8CC4E:
	LDA.w player_active_pressed		;$B8CC4E
	STA.w $04E2				;$B8CC51
	LDA.w player_active_held		;$B8CC54
	STA.w $04E0				;$B8CC57
	LDY current_kong_control_variables	;$B8CC5A
	LDA.w $04E0				;$B8CC5C
	STA.w $0004,y				;$B8CC5F
	LDA.w $04E2				;$B8CC62
	STA.w $0002,y				;$B8CC65
	JSR.w CODE_B8CCEC			;$B8CC68
	JSR.w CODE_B8CD13			;$B8CC6B
	JSR.w CODE_B8CD2C			;$B8CC6E
	JSR.w CODE_B8CD45			;$B8CC71
	JSR.w CODE_B8CD56			;$B8CC74
	LDA.w $04E0				;$B8CC77
	BIT.w #$0080				;$B8CC7A
	BEQ.b CODE_B8CC8B			;$B8CC7D
	LDX.w $04DE				;$B8CC7F
	%return(CODE_B8CC88)			;$B8CC82
	JMP.w (a_action_table,x)		;$B8CC85

CODE_B8CC88:
	LDA.w $04E0				;$B8CC88
CODE_B8CC8B:
	BIT.w #$0040				;$B8CC8B
	BEQ.b CODE_B8CC9C			;$B8CC8E
	LDX.w $04DE				;$B8CC90
	%return(CODE_B8CC99)			;$B8CC93
	JMP.w (x_action_table,x)		;$B8CC96

CODE_B8CC99:
	LDA.w $04E0				;$B8CC99
CODE_B8CC9C:
	BIT.w #$0020				;$B8CC9C
	BEQ.b CODE_B8CCAD			;$B8CC9F
	LDX.w $04DE				;$B8CCA1
	%return(CODE_B8CCAA)			;$B8CCA4
	JMP.w (l_action_table,x)		;$B8CCA7

CODE_B8CCAA:
	LDA.w $04E0				;$B8CCAA
CODE_B8CCAD:
	BIT.w #$0010				;$B8CCAD
	BEQ.b CODE_B8CCBE			;$B8CCB0
	LDX.w $04DE				;$B8CCB2
	%return(CODE_B8CCBB)			;$B8CCB5
	JMP.w (r_action_table,x)		;$B8CCB8

CODE_B8CCBB:
	LDA.w $04E0				;$B8CCBB
CODE_B8CCBE:
	BIT.w #$2000				;$B8CCBE
	BEQ.b CODE_B8CCCF			;$B8CCC1
	LDX.w $04DE				;$B8CCC3
	%return(CODE_B8CCCC)			;$B8CCC6
	JMP.w (select_action_table,x)		;$B8CCC9

CODE_B8CCCC:
	LDA.w $04E0				;$B8CCCC
CODE_B8CCCF:
	BIT.w #$1000				;$B8CCCF
	BEQ.b CODE_B8CCE0			;$B8CCD2
	LDX.w $04DE				;$B8CCD4
	%return(CODE_B8CCDD)			;$B8CCD7
	JMP.w (start_action_table,x)		;$B8CCDA

CODE_B8CCDD:
	LDA.w $04E0				;$B8CCDD
CODE_B8CCE0:
	LDX.b current_sprite			;$B8CCE0
	LDA.w $05B1				;$B8CCE2
	AND.w #$0001				;$B8CCE5
	CMP.w #$0001				;$B8CCE8
	RTS					;$B8CCEB

CODE_B8CCEC:
	LDX current_kong_control_variables	;$B8CCEC
	LDA.b $18,x				;$B8CCEE
	EOR.b $04,x				;$B8CCF0
	AND.w #$4000				;$B8CCF2
	BNE.b CODE_B8CCF8			;$B8CCF5
	RTS					;$B8CCF7

CODE_B8CCF8:
	LDA.b $04,x				;$B8CCF8
CODE_B8CCFA:
	STA.b $18,x				;$B8CCFA
	AND.w #$4000				;$B8CCFC
	BEQ.b CODE_B8CD0A			;$B8CCFF
	LDA.b $1A,x				;$B8CD01
	STA.b $1C,x				;$B8CD03
	LDA.b active_frame_counter		;$B8CD05
	STA.b $1A,x				;$B8CD07
	RTS					;$B8CD09

CODE_B8CD0A:
	LDA.b $1E,x				;$B8CD0A
	STA.b $20,x				;$B8CD0C
	LDA.b active_frame_counter		;$B8CD0E
	STA.b $1E,x				;$B8CD10
	RTS					;$B8CD12

CODE_B8CD13:
	LDX.w $04DE				;$B8CD13
	LDA.w $04E0				;$B8CD16
	AND.w #$0300				;$B8CD19
	BNE.b CODE_B8CD21			;$B8CD1C
	JMP.w (no_left_right_action_table,x)	;$B8CD1E

CODE_B8CD21:
	AND.w #$0100				;$B8CD21
	BNE.b CODE_B8CD29			;$B8CD24
	JMP.w (left_action_table,x)		;$B8CD26

CODE_B8CD29:
	JMP.w (right_action_table,x)		;$B8CD29

;shit
CODE_B8CD2C:
	LDX.w $04DE				;$B8CD2C
	LDA.w $04E0				;$B8CD2F
	AND.w #$0C00				;$B8CD32
	BNE.b CODE_B8CD3A			;$B8CD35
	JMP.w (no_up_down_action_table,x)	;$B8CD37

CODE_B8CD3A:
	AND.w #$0400				;$B8CD3A
	BNE.b CODE_B8CD42			;$B8CD3D
	JMP.w (up_action_table,x)		;$B8CD3F

CODE_B8CD42:
	JMP.w (down_action_table,x)		;$B8CD42

CODE_B8CD45:
	LDX.w $04DE				;$B8CD45
	LDA.w $04E0				;$B8CD48
	AND.w #$8000				;$B8CD4B
	BNE.b CODE_B8CD53			;$B8CD4E
	JMP.w (no_b_action_table,x)		;$B8CD50

CODE_B8CD53:
	JMP.w (b_action_table,x)		;$B8CD53

CODE_B8CD56:
	LDX.w $04DE				;$B8CD56
	LDA.w $04E0				;$B8CD59
	AND.w #$4000				;$B8CD5C
	BNE.b CODE_B8CD64			;$B8CD5F
	JMP.w (no_y_action_table,x)		;$B8CD61

CODE_B8CD64:
	JMP.w (y_action_table,x)		;$B8CD64


left_action_table:
	dw no_action
	dw no_action
	dw walk_left_action
	dw walk_left_action
	dw roll_left_action
	dw no_action
	dw horizontal_rope_move_left_action
	dw vertical_rope_turn_left_action
	dw vertical_rope_turn_left_action
	dw CODE_B8D51E				;move left at end of horizontal rope
	dw walk_left_action
	dw walk_left_action
	dw no_action
	dw swim_left_action
	dw CODE_B8D5C3
	dw shot_from_cannon_move_left_action
	dw walk_left_action
	dw walk_left_action
	dw walk_left_action
	dw walk_left_action
	dw no_action
	dw move_ellie_left_in_water_action
	dw move_enguarde_left_action
	dw CODE_B8D435
	dw CODE_B8DE36
	dw walk_left_action
	dw walk_left_action
	dw walk_left_action
	dw no_action
	dw move_squawks_left_action
	dw move_squawks_left_action
	dw walk_left_action
	dw walk_left_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

right_action_table:
	dw no_action
	dw no_action
	dw CODE_B8D448
	dw CODE_B8D448
	dw CODE_B8D49D
	dw no_action
	dw CODE_B8D52D
	dw CODE_B8D566
	dw CODE_B8D566
	dw CODE_B8D535
	dw CODE_B8D448
	dw CODE_B8D448
	dw no_action
	dw CODE_B8D450
	dw CODE_B8D5D1
	dw CODE_B8D60E
	dw CODE_B8D448
	dw CODE_B8D448
	dw CODE_B8D448
	dw CODE_B8D448
	dw no_action
	dw CODE_B8D469
	dw CODE_B8D482
	dw CODE_B8D48A
	dw CODE_B8DE55
	dw CODE_B8D448
	dw CODE_B8D448
	dw CODE_B8D448
	dw no_action
	dw CODE_B8DE9F
	dw CODE_B8DE9F
	dw CODE_B8D448
	dw CODE_B8D448
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

up_action_table:
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D2EF
	dw CODE_B8D30C
	dw CODE_B8D329
	dw CODE_B8D2EF
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D338
	dw no_action
	dw CODE_B8DE1F
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DEC6
	dw CODE_B8DEC6
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D620
	dw no_action
	dw no_action
	dw no_action

down_action_table:
	dw no_action
	dw no_action
	dw CODE_B8D340
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D2EF
	dw CODE_B8D359
	dw CODE_B8D395
	dw CODE_B8D2EF
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D3A4
	dw CODE_B8D3AF
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D3BA
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DECF
	dw CODE_B8DECF
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

a_action_table:
	dw no_action
	dw no_action
	dw CODE_B8DCED
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DD50
	dw CODE_B8DD82
	dw CODE_B8DD82
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DD31
	dw no_action
	dw no_action
	dw CODE_B8DCED
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DFF5
	dw CODE_B8DFF5
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

b_action_table:
	dw no_action
	dw no_action
	dw CODE_B8D65E
	dw CODE_B8D795
	dw CODE_B8D65E
	dw CODE_B8D65E
	dw CODE_B8D7A5
	dw CODE_B8D7DB
	dw CODE_B8D7EC
	dw CODE_B8D7A5
	dw CODE_B8D65E
	dw CODE_B8D795
	dw CODE_B8D7A5
	dw CODE_B8D86E
	dw CODE_B8D8D7
	dw no_action
	dw CODE_B8D65E
	dw CODE_B8D795
	dw CODE_B8D65E
	dw CODE_B8D795
	dw CODE_B8D65E
	dw CODE_B8D910
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D65E
	dw CODE_B8D795
	dw CODE_B8D795
	dw CODE_B8D795
	dw CODE_B8DED8
	dw CODE_B8DED8
	dw CODE_B8D65E
	dw CODE_B8D795
	dw CODE_B8D65E
	dw CODE_B8D65E
	dw CODE_B8D65E
	dw CODE_B8D795
	dw no_action

x_action_table:
	dw no_action
	dw no_action_2
	dw no_action_2
	dw no_action_2
	dw no_action
	dw no_action
	dw no_action_2
	dw no_action_2
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action_2
	dw no_action
	dw no_action
	dw CODE_B8D229
	dw CODE_B8D229
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D23A
	dw CODE_B8D229
	dw no_action
	dw no_action
	dw no_action_2
	dw no_action_2
	dw no_action_2
	dw no_action
	dw no_action_2
	dw no_action
	dw CODE_B8D229
	dw CODE_B8D229
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

y_action_table:
	dw no_action
	dw no_action
	dw CODE_B8D9A0
	dw CODE_B8D9E9
	dw CODE_B8D9A0
	dw CODE_B8D9A0
	dw CODE_B8DA33
	dw CODE_B8DC59
	dw CODE_B8DC59
	dw CODE_B8DA33
	dw CODE_B8DA33
	dw CODE_B8DA33
	dw CODE_B8D9A0
	dw CODE_B8DA33
	dw CODE_B8DA33 		;0E
	dw no_action
	dw CODE_B8D97C
	dw CODE_B8DA33
	dw CODE_B8DA33
	dw CODE_B8DA33
	dw CODE_B8D97C
	dw CODE_B8DA33
	dw CODE_B8D95A
	dw no_action
	dw no_action
	dw CODE_B8DA37
	dw CODE_B8DA37
	dw CODE_B8DA37
	dw no_action
	dw CODE_B8DF20
	dw CODE_B8DA33
	dw CODE_B8DF90
	dw CODE_B8DF90
	dw no_action
	dw CODE_B8D9A0
	dw no_action
	dw no_action
	dw CODE_B8D298

l_action_table:
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DDFC
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DE36
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DFF5
	dw CODE_B8DFF5
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

r_action_table:
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DD6D
	dw CODE_B8DDA3
	dw CODE_B8DDA3
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DE55
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DFF5
	dw CODE_B8DFF5
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

start_action_table:
	dw no_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw pause_game_action
	dw CODE_B8D28F

select_action_table:
	dw no_action
	dw no_action
	dw CODE_B8D2C0
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D2C0
	dw CODE_B8D2C0
	dw CODE_B8D2C0
	dw CODE_B8D2C0
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D2BB
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action

no_left_right_action_table:
	dw no_action
	dw no_action
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw no_action
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5DF
	dw CODE_B8D619
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw no_action
	dw no_action
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw no_action
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw CODE_B8D5BE
	dw no_action
	dw no_action
	dw no_action

no_up_down_action_table:
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D628
	dw CODE_B8D63E
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D659
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DEC6
	dw CODE_B8DEC6
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D620
	dw no_action
	dw no_action
	dw no_action

no_b_action_table:
	dw no_action 		;00
	dw no_action		;01
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw no_action
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw no_action
	dw CODE_B8D971 		;0E
	dw no_action
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw no_action
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw CODE_B8D96C
	dw no_action

no_y_action_table:
	dw no_action
	dw no_action
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC89
	dw CODE_B8DC89
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw no_action
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DCBB
	dw CODE_B8DCBB
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw no_action
	dw no_action
	dw no_action
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw no_action
	dw CODE_B8DC77
	dw CODE_B8DF5E
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw CODE_B8DC77
	dw no_action
	dw no_action
	dw no_action

no_action:
	RTS					;$B8D227

no_action_2:
	RTS					;$B8D228

CODE_B8D229:
	LDA.b current_mount			;$B8D229
	BEQ.b CODE_B8D239			;$B8D22B
	JSR.w CODE_B8D247			;$B8D22D
	BEQ.b CODE_B8D239			;$B8D230
	LDA.w #$001F				;$B8D232
	JSL.l CODE_B882B6			;$B8D235
CODE_B8D239:
	RTS					;$B8D239

CODE_B8D23A:
	LDX.b current_sprite			;$B8D23A
	LDA.b $62,x				;$B8D23C
	CMP.w #$0003				;$B8D23E
	BCS.b CODE_B8D229			;$B8D241
	JSR.w CODE_B8D247			;$B8D243
	RTS					;$B8D246

CODE_B8D247:
	LDX.b current_sprite			;$B8D247
	LDA.w $04E2				;$B8D249
	AND.w #$0040				;$B8D24C
	BEQ.b CODE_B8D25C			;$B8D24F
	LDY current_kong_control_variables	;$B8D251
	LDA.b active_frame_counter		;$B8D253
	STA.w $0024,y				;$B8D255
CODE_B8D258:
	LDA.w #$8000				;$B8D258
	RTS					;$B8D25B

CODE_B8D25C:
	LDY current_kong_control_variables	;$B8D25C
	LDA.b active_frame_counter		;$B8D25E
	SEC					;$B8D260
	SBC.w $0024,y				;$B8D261
	CMP.w #$0010				;$B8D264
	BCC.b CODE_B8D258			;$B8D267
	LDA.w #$0000				;$B8D269
	RTS					;$B8D26C

pause_game_action:
	LDA.w $04E2				;$B8D26D
	BIT.w #$1000				;$B8D270
	BNE.b .toggle_pause			;$B8D273
	RTS					;$B8D275

.toggle_pause:
	LDA screen_brightness			;$B8D276
	BEQ ..return				;$B8D279
	CMP #$0100				;$B8D27B
	BCS ..return				;$B8D27E
	LDA #$2000				;$B8D280
	BIT $05AF				;$B8D283
	BNE ..return				;$B8D286
	LDA #$0010				;$B8D288
	TSB $05B1				;$B8D28B
..return:
	RTS					;$B8D28E

CODE_B8D28F:
	LDA.w player_active_pressed		;$B8D28F
	AND.w #$1000				;$B8D292
	BNE.b CODE_B8D2A1			;$B8D295
	RTS					;$B8D297

CODE_B8D298:
	LDA.w player_active_pressed		;$B8D298
	AND.w #$4000				;$B8D29B
	BNE.b CODE_B8D2A1			;$B8D29E
	RTS					;$B8D2A0

CODE_B8D2A1:
	LDX.b current_sprite			;$B8D2A1
	LDA.b $64,x				;$B8D2A3
	CMP.w #$0020				;$B8D2A5
	BCC.b CODE_B8D2BA			;$B8D2A8
	LDA.w #$0001				;$B8D2AA
	TSB.w $05B1				;$B8D2AD
	LDA.w #$0100				;$B8D2B0
	TRB.w $05AF				;$B8D2B3
	JSL.l disable_timestop			;$B8D2B6
CODE_B8D2BA:
	RTS					;$B8D2BA

CODE_B8D2BB:
	LDA.w #$0006				;$B8D2BB
	BRA.b CODE_B8D2C3			;$B8D2BE

CODE_B8D2C0:
	LDA.w #$0005				;$B8D2C0
CODE_B8D2C3:
	STA.b $3A				;$B8D2C3
	LDA.w #$2000				;$B8D2C5
	TRB.w player_active_pressed		;$B8D2C8
	BEQ.b CODE_B8D2ED			;$B8D2CB
	LDA.w $05AF				;$B8D2CD
	AND.w #$4000				;$B8D2D0
	BEQ.b CODE_B8D2EE			;$B8D2D3
	LDY.w follower_kong_sprite		;$B8D2D5
	LDA.w $0038,y				;$B8D2D8
	ASL					;$B8D2DB
	ASL					;$B8D2DC
	TAX					;$B8D2DD
	LDA.l kong_state_flags,x		;$B8D2DE
	AND.w #$0020				;$B8D2E2
	BEQ.b CODE_B8D2ED			;$B8D2E5
	LDA.b $3A				;$B8D2E7
	JSL.l CODE_B882B6			;$B8D2E9
CODE_B8D2ED:
	RTS					;$B8D2ED

CODE_B8D2EE:
	RTS					;$B8D2EE

CODE_B8D2EF:
	LDA.w $0777				;$B8D2EF
	AND.w #$0001				;$B8D2F2
	BEQ.b CODE_B8D30B			;$B8D2F5
	LDX.b current_sprite			;$B8D2F7
	LDA.b $5E,x				;$B8D2F9
	BNE.b CODE_B8D30B			;$B8D2FB
	JSR.w CODE_B8CA3C			;$B8D2FD
	JSR.w CODE_B8C8CD			;$B8D300
	BCC.b CODE_B8D30B			;$B8D303
	LDA.w #$000C				;$B8D305
	STA.w $17C6				;$B8D308
CODE_B8D30B:
	RTS					;$B8D30B

CODE_B8D30C:
	LDX.b current_sprite			;$B8D30C
	LDY current_kong_control_variables	;$B8D30E
	LDA.w $0006,y				;$B8D310
	LDY.w #$0118				;$B8D313
	AND.w #$0004				;$B8D316
	BNE.b CODE_B8D31E			;$B8D319
	LDY.w #$0110				;$B8D31B
CODE_B8D31E:
	LDA.b [$6A],y				;$B8D31E
	STA.b $34,x				;$B8D320
	LDA.w #$0080				;$B8D322
	JSR.w CODE_B8D376			;$B8D325
	RTS					;$B8D328

CODE_B8D329:
	LDA.w $04E2				;$B8D329
	AND.w #$0800				;$B8D32C
	BNE.b CODE_B8D30C			;$B8D32F
	LDX.b current_sprite			;$B8D331
	BIT.b $5C,x				;$B8D333
	BPL.b CODE_B8D30C			;$B8D335
	RTS					;$B8D337

CODE_B8D338:
	LDX.b current_sprite			;$B8D338
	LDA.w #$FD00				;$B8D33A
	STA.b $34,x				;$B8D33D
	RTS					;$B8D33F

CODE_B8D340:
	LDX.b current_sprite			;$B8D340
	LDA.b $28,x				;$B8D342
	AND.w #$1001				;$B8D344
	BNE.b CODE_B8D34A			;$B8D347
	RTS					;$B8D349

CODE_B8D34A:
	STZ.b $30,x				;$B8D34A
	LDA.w #$006A				;$B8D34C
	STA.b $38,x				;$B8D34F
	LDA.w #$0007				;$B8D351
	JSL.l set_anim_handle_kiddy		;$B8D354
	RTS					;$B8D358

CODE_B8D359:
	LDX.b current_sprite			;$B8D359
	LDY current_kong_control_variables	;$B8D35B
	LDA.w $0006,y				;$B8D35D
	LDY.w #$0128				;$B8D360
	AND.w #$0004				;$B8D363
	BNE.b CODE_B8D36B			;$B8D366
	LDY.w #$0120				;$B8D368
CODE_B8D36B:
	LDA.b [$6A],y				;$B8D36B
	STA.b $34,x				;$B8D36D
	LDA.w #$FF80				;$B8D36F
	JSR.w CODE_B8D376			;$B8D372
	RTS					;$B8D375

CODE_B8D376:
	BMI.b CODE_B8D385			;$B8D376
	CLC					;$B8D378
	ADC.w $04AE				;$B8D379
	BMI.b CODE_B8D381			;$B8D37C
	LDA.w #$0000				;$B8D37E
CODE_B8D381:
	STA.w $04AE				;$B8D381
	RTS					;$B8D384

CODE_B8D385:
	CLC					;$B8D385
	ADC.w $04AE				;$B8D386
	CMP.w #$D800				;$B8D389
	BCS.b CODE_B8D391			;$B8D38C
	LDA.w #$D800				;$B8D38E
CODE_B8D391:
	STA.w $04AE				;$B8D391
	RTS					;$B8D394

CODE_B8D395:
	LDX.b current_sprite			;$B8D395
	LDA.b $5C,x				;$B8D397
	BMI.b CODE_B8D359			;$B8D399
	LDA.w $04E2				;$B8D39B
	AND.w #$0400				;$B8D39E
	BNE.b CODE_B8D359			;$B8D3A1
	RTS					;$B8D3A3

CODE_B8D3A4:
	LDY.w #$0238				;$B8D3A4
	LDA.b [$6A],y				;$B8D3A7
	LDY current_kong_control_variables	;$B8D3A9
	STA.w $000A,y				;$B8D3AB
	RTS					;$B8D3AE

CODE_B8D3AF:
	LDY.w #$0208				;$B8D3AF
	LDA.b [$6A],y				;$B8D3B2
	LDY current_kong_control_variables	;$B8D3B4
	STA.w $0008,y				;$B8D3B6
	RTS					;$B8D3B9

CODE_B8D3BA:
	LDX.b current_sprite			;$B8D3BA
	LDA.w #$0300				;$B8D3BC
	STA.b $34,x				;$B8D3BF
	RTS					;$B8D3C1

walk_left_action:
	LDX.b current_sprite			;$B8D3C2
	JSR.w CODE_B8D4C2			;$B8D3C4
	EOR.w #$FFFF				;$B8D3C7
	INC					;$B8D3CA
	STA.b $30,x				;$B8D3CB
	RTS					;$B8D3CD

roll_left_action:
	LDX.b current_sprite			;$B8D3CE
	LDA.b $1C,x				;$B8D3D0
	AND.w #$0007				;$B8D3D2
	CMP.b $AC				;$B8D3D5
	BMI.b CODE_B8D3E1			;$B8D3D7
	LDA.b $28,x				;$B8D3D9
	AND.w #$0001				;$B8D3DB
	BEQ.b CODE_B8D3E1			;$B8D3DE
	RTS					;$B8D3E0

CODE_B8D3E1:
	LDA.b $1E,x				;$B8D3E1
	ORA.w #$4000				;$B8D3E3
	STA.b $1E,x				;$B8D3E6
	LDA.b $30,x				;$B8D3E8
	BMI.b CODE_B8D3F2			;$B8D3EA
	EOR.w #$FFFF				;$B8D3EC
	INC					;$B8D3EF
	STA.b $30,x				;$B8D3F0
CODE_B8D3F2:
	RTS					;$B8D3F2

swim_left_action:
	LDY current_kong_control_variables	;$B8D3F3
	LDA.w $0006,y				;$B8D3F5
	AND.w #$0004				;$B8D3F8
	BNE.b CODE_B8D402			;$B8D3FB
	LDY.w #$0240				;$B8D3FD
	BRA.b CODE_B8D405			;$B8D400

CODE_B8D402:
	LDY.w #$0248				;$B8D402
CODE_B8D405:
	LDA.b [$6A],y				;$B8D405
	EOR.w #$FFFF				;$B8D407
	INC					;$B8D40A
	LDX.b current_sprite			;$B8D40B
	STA.b $30,x				;$B8D40D
	RTS					;$B8D40F

move_ellie_left_in_water_action:
	LDY current_kong_control_variables	;$B8D410
	LDA.w $0006,y				;$B8D412
	AND.w #$0004				;$B8D415
	BNE.b CODE_B8D41F			;$B8D418
	LDY.w #$0270				;$B8D41A
	BRA.b CODE_B8D422			;$B8D41D

CODE_B8D41F:
	LDY.w #$0278				;$B8D41F
CODE_B8D422:
	LDA.b [$6A],y				;$B8D422
	EOR.w #$FFFF				;$B8D424
	INC					;$B8D427
	LDX.b current_sprite			;$B8D428
	STA.b $30,x				;$B8D42A
	RTS					;$B8D42C

move_enguarde_left_action:
	LDX.b current_sprite			;$B8D42D
	LDA.w #$FE00				;$B8D42F
	STA.b $30,x				;$B8D432
	RTS					;$B8D434

CODE_B8D435:
	LDX.b current_sprite			;$B8D435
	LDA.b $2A,x				;$B8D437
	BMI.b CODE_B8D447			;$B8D439
	LDA.w #$002D				;$B8D43B
	STA.b $38,x				;$B8D43E
	LDA.w #$0000				;$B8D440
	JSL.l set_anim_handle_animal_and_kiddy	;$B8D443
CODE_B8D447:
	RTS					;$B8D447

CODE_B8D448:
	LDX.b current_sprite			;$B8D448
	JSR.w CODE_B8D4C2			;$B8D44A
	STA.b $30,x				;$B8D44D
	RTS					;$B8D44F

CODE_B8D450:
	LDY current_kong_control_variables	;$B8D450
	LDA.w $0006,y				;$B8D452
	AND.w #$0004				;$B8D455
	BNE.b CODE_B8D45F			;$B8D458
	LDY.w #$0240				;$B8D45A
	BRA.b CODE_B8D462			;$B8D45D

CODE_B8D45F:
	LDY.w #$0248				;$B8D45F
CODE_B8D462:
	LDA.b [$6A],y				;$B8D462
	LDX.b current_sprite			;$B8D464
	STA.b $30,x				;$B8D466
	RTS					;$B8D468

CODE_B8D469:
	LDY current_kong_control_variables	;$B8D469
	LDA.w $0006,y				;$B8D46B
	AND.w #$0004				;$B8D46E
	BNE.b CODE_B8D478			;$B8D471
	LDY.w #$0270				;$B8D473
	BRA.b CODE_B8D47B			;$B8D476

CODE_B8D478:
	LDY.w #$0278				;$B8D478
CODE_B8D47B:
	LDA.b [$6A],y				;$B8D47B
	LDX.b current_sprite			;$B8D47D
	STA.b $30,x				;$B8D47F
	RTS					;$B8D481

CODE_B8D482:
	LDX.b current_sprite			;$B8D482
	LDA.w #$0200				;$B8D484
	STA.b $30,x				;$B8D487
	RTS					;$B8D489

CODE_B8D48A:
	LDX.b current_sprite			;$B8D48A
	LDA.b $2A,x				;$B8D48C
	BPL.b CODE_B8D49C			;$B8D48E
	LDA.w #$002D				;$B8D490
	STA.b $38,x				;$B8D493
	LDA.w #$0000				;$B8D495
	JSL.l set_anim_handle_animal_and_kiddy	;$B8D498
CODE_B8D49C:
	RTS					;$B8D49C

CODE_B8D49D:
	LDX.b current_sprite			;$B8D49D
	LDA.b $1C,x				;$B8D49F
	AND.w #$0007				;$B8D4A1
	CMP.b $AC				;$B8D4A4
	BMI.b CODE_B8D4B0			;$B8D4A6
	LDA.b $28,x				;$B8D4A8
	AND.w #$0001				;$B8D4AA
	BEQ.b CODE_B8D4B0			;$B8D4AD
	RTS					;$B8D4AF

CODE_B8D4B0:
	LDA.b $1E,x				;$B8D4B0
	AND.w #$BFFF				;$B8D4B2
	STA.b $1E,x				;$B8D4B5
	LDA.b $30,x				;$B8D4B7
	BPL.b CODE_B8D4C1			;$B8D4B9
	EOR.w #$FFFF				;$B8D4BB
	INC					;$B8D4BE
	STA.b $30,x				;$B8D4BF
CODE_B8D4C1:
	RTS					;$B8D4C1

CODE_B8D4C2:
	LDA.w current_held_sprite		;$B8D4C2
	BNE.b CODE_B8D4E4			;$B8D4C5
	LDY current_kong_control_variables	;$B8D4C7
	LDA.w $0006,y				;$B8D4C9
	AND.w #$0004				;$B8D4CC
	BNE.b CODE_B8D4FF			;$B8D4CF
	LDA.b current_animal_type		;$B8D4D1
	BNE.b CODE_B8D4DB			;$B8D4D3
	LDY.w #$00A0				;$B8D4D5
	LDA.b [$6A],y				;$B8D4D8
	RTS					;$B8D4DA

CODE_B8D4DB:
	SEC					;$B8D4DB
	SBC.w #$00D0				;$B8D4DC
	ASL					;$B8D4DF
	TAY					;$B8D4E0
	LDA.b [$6A],y				;$B8D4E1
	RTS					;$B8D4E3

CODE_B8D4E4:
	CMP.w follower_kong_sprite		;$B8D4E4
	BEQ.b CODE_B8D4F9			;$B8D4E7
	LDA.b current_animal_type		;$B8D4E9
	BNE.b CODE_B8D4F3			;$B8D4EB
	LDY.w #$00A8				;$B8D4ED
	LDA.b [$6A],y				;$B8D4F0
	RTS					;$B8D4F2

CODE_B8D4F3:
	LDY.w #$0308				;$B8D4F3
	LDA.b [$6A],y				;$B8D4F6
	RTS					;$B8D4F8

CODE_B8D4F9:
	LDY.w #$0050				;$B8D4F9
	LDA.b [$6A],y				;$B8D4FC
	RTS					;$B8D4FE

CODE_B8D4FF:
	LDA.b current_animal_type		;$B8D4FF
	BNE.b CODE_B8D509			;$B8D501
	LDY.w #$00B0				;$B8D503
	LDA.b [$6A],y				;$B8D506
	RTS					;$B8D508

CODE_B8D509:
	SEC					;$B8D509
	SBC.w #$00C0				;$B8D50A
	ASL					;$B8D50D
	TAY					;$B8D50E
	LDA.b [$6A],y				;$B8D50F
	RTS					;$B8D511

horizontal_rope_move_left_action:
	LDX.b current_sprite			;$B8D512
	JSR.w CODE_B8D544			;$B8D514
	EOR.w #$FFFF				;$B8D517
	INC					;$B8D51A
	STA.b $30,x				;$B8D51B
	RTS					;$B8D51D

CODE_B8D51E:
	LDA.w $04E2				;$B8D51E
	AND.w #$0200				;$B8D521
	BNE.b horizontal_rope_move_left_action	;$B8D524
	LDX.b current_sprite			;$B8D526
	BIT.b $5C,x				;$B8D528
	BPL.b horizontal_rope_move_left_action	;$B8D52A
	RTS					;$B8D52C

CODE_B8D52D:
	LDX.b current_sprite			;$B8D52D
	JSR.w CODE_B8D544			;$B8D52F
	STA.b $30,x				;$B8D532
	RTS					;$B8D534

CODE_B8D535:
	LDA.w $04E2				;$B8D535
	AND.w #$0100				;$B8D538
	BNE.b CODE_B8D52D			;$B8D53B
	LDX.b current_sprite			;$B8D53D
	BIT.b $5C,x				;$B8D53F
	BMI.b CODE_B8D52D			;$B8D541
	RTS					;$B8D543

CODE_B8D544:
	LDX.b current_sprite			;$B8D544
	LDY current_kong_control_variables	;$B8D546
	LDA.w $0006,y				;$B8D548
	AND.w #$0004				;$B8D54B
	BNE.b CODE_B8D556			;$B8D54E
	LDY.w #$0100				;$B8D550
	LDA.b [$6A],y				;$B8D553
	RTS					;$B8D555

CODE_B8D556:
	LDY.w #$0108				;$B8D556
	LDA.b [$6A],y				;$B8D559
	RTS					;$B8D55B

vertical_rope_turn_left_action:
	LDX.b current_sprite			;$B8D55C
	LDA.w #$FF80				;$B8D55E
	LDY.w #$FFFC				;$B8D561
	BRA.b CODE_B8D56E			;$B8D564

CODE_B8D566:
	LDX.b current_sprite			;$B8D566
	LDA.w #$0080				;$B8D568
	LDY.w #$0004				;$B8D56B
CODE_B8D56E:
	STA.b $30,x				;$B8D56E
	LDA.w $0777				;$B8D570
	AND.w #$0002				;$B8D573
	BEQ.b CODE_B8D5BD			;$B8D576
	LDA.b $5E,x				;$B8D578
	BNE.b CODE_B8D5BD			;$B8D57A
	LDA.b $16,x				;$B8D57C
	SEC					;$B8D57E
	SBC.w #$0028				;$B8D57F
	STA.b $40				;$B8D582
	STA.b $1C				;$B8D584
	TYA					;$B8D586
	CLC					;$B8D587
	ADC.b $12,x				;$B8D588
	STA.b $3E				;$B8D58A
	JSR.w CODE_B8C926			;$B8D58C
	STA.b $3A				;$B8D58F
	LDA.b $A2				;$B8D591
	AND.w #$0800				;$B8D593
	BEQ.b CODE_B8D5BD			;$B8D596
	LDA.b $40				;$B8D598
	SEC					;$B8D59A
	SBC.b $3A				;$B8D59B
	CLC					;$B8D59D
	ADC.w #$0008				;$B8D59E
	CMP.w #$0010				;$B8D5A1
	BCS.b CODE_B8D5BD			;$B8D5A4
	LDA.w #$000B				;$B8D5A6
	JSL.l CODE_B882B6			;$B8D5A9
	BCS.b CODE_B8D5BD			;$B8D5AD
	LDA.b $3A				;$B8D5AF
	STA.w $17CC				;$B8D5B1
	LDA.b $3E				;$B8D5B4
	STA.w $17CA				;$B8D5B6
	LDA.b $A2				;$B8D5B9
	STA.b $1C,x				;$B8D5BB
CODE_B8D5BD:
	RTS					;$B8D5BD

CODE_B8D5BE:
	LDX.b current_sprite			;$B8D5BE
	STZ.b $30,x				;$B8D5C0
	RTS					;$B8D5C2

CODE_B8D5C3:
	LDX.b current_sprite			;$B8D5C3
	LDY.w #$01F0				;$B8D5C5
	BIT.b $1E,x				;$B8D5C8
	BVS.b CODE_B8D5E4			;$B8D5CA
	LDY.w #$01E0				;$B8D5CC
	BRA.b CODE_B8D5E4			;$B8D5CF

CODE_B8D5D1:
	LDX.b current_sprite			;$B8D5D1
	LDY.w #$01F0				;$B8D5D3
	BIT.b $1E,x				;$B8D5D6
	BVC.b CODE_B8D5E4			;$B8D5D8
	LDY.w #$01E0				;$B8D5DA
	BRA.b CODE_B8D5E4			;$B8D5DD

CODE_B8D5DF:
	LDX.b current_sprite			;$B8D5DF
	LDY.w #$01E8				;$B8D5E1
CODE_B8D5E4:
	LDA.w $04E0				;$B8D5E4
	AND.w #$4000				;$B8D5E7
	CMP.w #$0001				;$B8D5EA
	LDA.b [$6A],y				;$B8D5ED
	BCS.b CODE_B8D5F2			;$B8D5EF
	LSR					;$B8D5F1
CODE_B8D5F2:
	LDX.b current_sprite			;$B8D5F2
	BIT.b $1E,x				;$B8D5F4
	BVC.b CODE_B8D5FC			;$B8D5F6
	EOR.w #$FFFF				;$B8D5F8
	INC					;$B8D5FB
CODE_B8D5FC:
	STA.b $30,x				;$B8D5FC
	RTS					;$B8D5FE

shot_from_cannon_move_left_action:
	LDX.b current_sprite			;$B8D5FF
	JSR.w CODE_B8D4C2			;$B8D601
	EOR.w #$FFFF				;$B8D604
	INC					;$B8D607
	CLC					;$B8D608
	ADC.b $60,x				;$B8D609
	STA.b $30,x				;$B8D60B
	RTS					;$B8D60D

CODE_B8D60E:
	LDX.b current_sprite			;$B8D60E
	JSR.w CODE_B8D4C2			;$B8D610
	CLC					;$B8D613
	ADC.b $60,x				;$B8D614
	STA.b $30,x				;$B8D616
	RTS					;$B8D618

CODE_B8D619:
	LDX.b current_sprite			;$B8D619
	LDA.b $60,x				;$B8D61B
	STA.b $30,x				;$B8D61D
	RTS					;$B8D61F

CODE_B8D620:
	LDX.b current_sprite			;$B8D620
	LDA.w #$0001				;$B8D622
	STA.b $38,x				;$B8D625
	RTS					;$B8D627

CODE_B8D628:
	LDA.w $04E0				;$B8D628
	AND.w #$8000				;$B8D62B
	BEQ.b CODE_B8D633			;$B8D62E
	JMP.w CODE_B8D30C			;$B8D630

CODE_B8D633:
	LDX.b current_sprite			;$B8D633
	STZ.b $34,x				;$B8D635
	LDA.w #$0080				;$B8D637
	JSR.w CODE_B8D376			;$B8D63A
	RTS					;$B8D63D

CODE_B8D63E:
	LDA.w $04E2				;$B8D63E
	AND.w #$8000				;$B8D641
	BEQ.b CODE_B8D649			;$B8D644
	JMP.w CODE_B8D30C			;$B8D646

CODE_B8D649:
	LDX.b current_sprite			;$B8D649
	STZ.b $34,x				;$B8D64B
	RTS					;$B8D64D

CODE_B8D64E:
	LDY.w #$0230				;$B8D64E
	LDA.b [$6A],y				;$B8D651
	LDY current_kong_control_variables	;$B8D653
	STA.w $000A,y				;$B8D655
	RTS					;$B8D658

CODE_B8D659:
	LDX.b current_sprite			;$B8D659
	STZ.b $34,x				;$B8D65B
	RTS					;$B8D65D

CODE_B8D65E:
	LDX.b current_sprite			;$B8D65E
	LDA.w $04E2				;$B8D660
	AND.w #$8000				;$B8D663
	BEQ.b CODE_B8D671			;$B8D666
	LDY current_kong_control_variables	;$B8D668
	LDA.b active_frame_counter		;$B8D66A
	STA.w $0022,y				;$B8D66C
	BRA.b CODE_B8D67E			;$B8D66F

CODE_B8D671:
	LDY current_kong_control_variables	;$B8D671
	LDA.b active_frame_counter		;$B8D673
	SEC					;$B8D675
	SBC.w $0022,y				;$B8D676
	CMP.w #$0010				;$B8D679
	BPL.b CODE_B8D6B8			;$B8D67C
CODE_B8D67E:
	LDA.b $4A,x				;$B8D67E
	AND.w #$0001				;$B8D680
	BNE.b CODE_B8D6B8			;$B8D683
	LDA.b $28,x				;$B8D685
	AND.w #$1010				;$B8D687
	BNE.b CODE_B8D695			;$B8D68A
	LDA.b $1C,x				;$B8D68C
	AND.w #$0007				;$B8D68E
	CMP.b $AC				;$B8D691
	BPL.b CODE_B8D6B8			;$B8D693
CODE_B8D695:
	LDA.w current_held_sprite		;$B8D695
	BEQ.b CODE_B8D6B9			;$B8D698
	CMP.w follower_kong_sprite		;$B8D69A
	BEQ.b CODE_B8D6B9			;$B8D69D
	LDA.w $1877				;$B8D69F
	AND.w #$BFFF				;$B8D6A2
	CMP.w #$000F				;$B8D6A5
	BCC.b CODE_B8D6AF			;$B8D6A8
	JSR.w CODE_B8D75D			;$B8D6AA
	BRA.b CODE_B8D6B9			;$B8D6AD

CODE_B8D6AF:
	LDY current_kong_control_variables	;$B8D6AF
	LDA.w $0022,y				;$B8D6B1
	INC					;$B8D6B4
	STA.w $0022,y				;$B8D6B5
CODE_B8D6B8:
	RTS					;$B8D6B8

CODE_B8D6B9:
	LDA.w current_held_sprite 		;$B8D6B9 / get object carried by kong
	ORA.b current_animal_type		;$B8D6BC
	BNE.b CODE_B8D6F9			;$B8D6BE
	LDA.w $050F 				;$B8D6C0 / get water y position	
	BMI.b CODE_B8D6F9 			;$B8D6C3 / if level has no water, branch and do something lol	
	SEC					;$B8D6C5
	SBC.w #$0018 				;$B8D6C6 / get a distance from the kong	
	CMP.b $16,x				;$B8D6C9
	BCS.b CODE_B8D6F9 			;$B8D6CB / if not within distance, branch and do something lol
	LDA.b $00,x 				;$B8D6CD / get sprite ID
	CMP.w #!sprite_kiddy_kong 		;$B8D6CF / check if its Kiddy
	BNE.b CODE_B8D6F9 			;$B8D6D2 / if not, branch and do something lol
	LDA.b $4A,x				;$B8D6D4
	AND.w #$1000				;$B8D6D6
	BEQ.b CODE_B8D6F9			;$B8D6D9
	JSL.l CODE_B8E15A			;$B8D6DB
	JSL.l CODE_B8E198			;$B8D6DF
	LDY current_kong_control_variables 	;$B8D6E3 / get pointer to kong control variables
	LDA.b active_frame_counter		;$B8D6E5
	STA.w $0012,y				;$B8D6E7
	LDA.w #$0019 				;$B8D6EA / set water bounce behavior
	STA.b $38,x				;$B8D6ED
	STZ.b $5C,x				;$B8D6EF
	LDA.w #$000F 				;$B8D6F1
	JSL.l set_anim_handle_kiddy 		;$B8D6F4 / Set roll animation
	RTS 					;$B8D6F8

CODE_B8D6F9:
	JSL.l CODE_B8E15A			;$B8D6F9
	JSL.l CODE_B8E198			;$B8D6FD
	LDY current_kong_control_variables	;$B8D701
	LDA.b active_frame_counter		;$B8D703
	STA.w $0012,y				;$B8D705
	LDA.b current_animal_type		;$B8D708
	BNE.b CODE_B8D72E			;$B8D70A
	LDA.w current_held_sprite		;$B8D70C
	BNE.b CODE_B8D719			;$B8D70F
	LDA.w #$0008				;$B8D711
	JSL.l set_anim_handle_kiddy		;$B8D714
	RTS					;$B8D718

CODE_B8D719:
	CMP.w follower_kong_sprite		;$B8D719
	BEQ.b CODE_B8D726			;$B8D71C
	LDA.w #$0024				;$B8D71E
	JSL.l set_anim_handle_kiddy		;$B8D721
	RTS					;$B8D725

CODE_B8D726:
	LDA.w #$002F				;$B8D726
	JSL.l set_anim_handle_kiddy		;$B8D729
	RTS					;$B8D72D

CODE_B8D72E:
	LDX.b current_sprite			;$B8D72E
	LDA.b $38,x				;$B8D730
	CMP.w #$002C				;$B8D732
	BEQ.b CODE_B8D744			;$B8D735
	CMP.w #$006C				;$B8D737
	BEQ.b CODE_B8D755			;$B8D73A
	LDA.w #$0004				;$B8D73C
	JSL.l set_anim_handle_animal_and_kiddy	;$B8D73F
	RTS					;$B8D743

CODE_B8D744:
	LDA.w #$0004				;$B8D744
	JSL.l set_anim_handle_animal_and_kiddy	;$B8D747
	LDA.w player_active_held		;$B8D74B
	AND.w #$0010				;$B8D74E
	TSB.w $04E2				;$B8D751
	RTS					;$B8D754

CODE_B8D755:
	LDA.w #$0058				;$B8D755
	JSL.l set_sprite_animation		;$B8D758
	RTS					;$B8D75C

CODE_B8D75D:
	LDA.w #$4000				;$B8D75D
	TSB.w $1877				;$B8D760
	LDA.b current_animal_type		;$B8D763
	BNE.b CODE_B8D77A			;$B8D765
	LDA.w current_kong			;$B8D767
	BNE.b CODE_B8D773			;$B8D76A
	LDA.w #$0001				;$B8D76C
	STA.w $1871				;$B8D76F
	RTS					;$B8D772

CODE_B8D773:
	LDA.w #$FFFF				;$B8D773
	STA.w $1871				;$B8D776
	RTS					;$B8D779

CODE_B8D77A:
	LDA.w #$0001				;$B8D77A
	STA.w $1871				;$B8D77D
	LDY.w current_held_sprite		;$B8D780
	LDA.b $1E,x				;$B8D783
	EOR.w $001E,y				;$B8D785
	AND.w #$4000				;$B8D788
	EOR.w $001E,y				;$B8D78B
	EOR.w #$4000				;$B8D78E
	STA.w $001E,y				;$B8D791
	RTS					;$B8D794

CODE_B8D795:
	LDA.w $04E2				;$B8D795
	AND.w #$8000				;$B8D798
	BEQ.b CODE_B8D7A4			;$B8D79B
	LDY current_kong_control_variables	;$B8D79D
	LDA.b active_frame_counter		;$B8D79F
	STA.w $0022,y				;$B8D7A1
CODE_B8D7A4:
	RTS					;$B8D7A4

CODE_B8D7A5:
	LDA.w $04E2				;$B8D7A5
	AND.w #$8000				;$B8D7A8
	BNE.b CODE_B8D7AE			;$B8D7AB
	RTS					;$B8D7AD

CODE_B8D7AE:
	LDY.w #$001A				;$B8D7AE
	LDA.w $04E0				;$B8D7B1
	AND.w #$0400				;$B8D7B4
	BNE.b CODE_B8D7BC			;$B8D7B7
	LDY.w #$0019				;$B8D7B9
CODE_B8D7BC:
	LDX.b current_sprite			;$B8D7BC
	TYA					;$B8D7BE
	JSL.l set_anim_handle_kiddy		;$B8D7BF
	JSR.w CODE_B8E2DD			;$B8D7C3
	LDA.w #$0020				;$B8D7C6
	TRB.w $05AF				;$B8D7C9
	JSL.l CODE_B8E198			;$B8D7CC
	JSL.l CODE_B8E15A			;$B8D7D0
	LDA.w #$0001				;$B8D7D4
	TSB.w $05B1				;$B8D7D7
	RTS					;$B8D7DA

CODE_B8D7DB:
	LDA.w $04E2				;$B8D7DB
	AND.w #$8000				;$B8D7DE
	BEQ.b CODE_B8D7EB			;$B8D7E1
	LDA.w $04E0				;$B8D7E3
	AND.w #$0300				;$B8D7E6
	BNE.b CODE_B8D82F			;$B8D7E9
CODE_B8D7EB:
	RTS					;$B8D7EB

CODE_B8D7EC:
	LDA.w $04E2				;$B8D7EC
	AND.w #$8000				;$B8D7EF
	BEQ.b CODE_B8D82E			;$B8D7F2
	LDA.w $04E0				;$B8D7F4
	AND.w #$0300				;$B8D7F7
	BNE.b CODE_B8D82F			;$B8D7FA
	LDA.w $04E0				;$B8D7FC
	AND.w #$0C00				;$B8D7FF
	BEQ.b CODE_B8D82E			;$B8D802
	LDX.b current_sprite			;$B8D804
	CMP.w #$0400				;$B8D806
	BEQ.b CODE_B8D814			;$B8D809
	LDA.b $5C,x				;$B8D80B
	BPL.b CODE_B8D82E			;$B8D80D
	LDA.w #$0000				;$B8D80F
	BRA.b CODE_B8D83E			;$B8D812

CODE_B8D814:
	LDA.b $5C,x				;$B8D814
	BMI.b CODE_B8D82E			;$B8D816
	STZ.b $2A,x				;$B8D818
	STZ.b $30,x				;$B8D81A
	LDA.w #$0008				;$B8D81C
	STA.w $1955				;$B8D81F
	JSR.w CODE_B8E2DD			;$B8D822
	LDA.w #$0020				;$B8D825
	TRB.w $05AF				;$B8D828
	JSR.w CODE_B8CBCB			;$B8D82B
CODE_B8D82E:
	RTS					;$B8D82E

CODE_B8D82F:
	CMP.w #$0100				;$B8D82F
	BEQ.b CODE_B8D839			;$B8D832
	LDA.w #$FD80				;$B8D834
	BRA.b CODE_B8D83E			;$B8D837

CODE_B8D839:
	LDA.w #$0280				;$B8D839
	BRA.b CODE_B8D83E			;$B8D83C

CODE_B8D83E:
	LDX.b current_sprite			;$B8D83E
	STA.b $2A,x				;$B8D840
	STA.b $30,x				;$B8D842
	LDA.w #$0008				;$B8D844
	STA.w $1955				;$B8D847
	LDA.w #$0008				;$B8D84A
	STA.b $38,x				;$B8D84D
	LDA.w #$001E				;$B8D84F
	JSL.l set_anim_handle_kiddy		;$B8D852
	JSR.w CODE_B8E2DD			;$B8D856
	LDA.w #$0020				;$B8D859
	TRB.w $05AF				;$B8D85C
	JSL.l CODE_B8E198			;$B8D85F
	JSL.l CODE_B8E15A			;$B8D863
	LDA.w #$0001				;$B8D867
	TSB.w $05B1				;$B8D86A
	RTS					;$B8D86D

CODE_B8D86E:
	LDA.w $04E2				;$B8D86E
	AND.w #$8000				;$B8D871
	BNE.b CODE_B8D877			;$B8D874
	RTS					;$B8D876

CODE_B8D877:
	JSR.w check_sprite_underwater		;$B8D877
	CMP.w #$0002				;$B8D87A
	BCC.b CODE_B8D8AF			;$B8D87D
	LDA.w #$076C				;$B8D87F
	JSL.l queue_sound_effect		;$B8D882
	LDY.w #$0210				;$B8D886
	LDA.w $04E0				;$B8D889
	AND.w #$0C00				;$B8D88C
	BEQ.b CODE_B8D8A0			;$B8D88F
	AND.w #$0800				;$B8D891
	BNE.b CODE_B8D89B			;$B8D894
	LDY.w #$0220				;$B8D896
	BRA.b CODE_B8D8A3			;$B8D899

CODE_B8D89B:
	LDY.w #$0218				;$B8D89B
	BRA.b CODE_B8D8A3			;$B8D89E

CODE_B8D8A0:
	LDY.w #$0210				;$B8D8A0
CODE_B8D8A3:
	LDX.b current_sprite			;$B8D8A3
	LDA.b [$6A],y				;$B8D8A5
	STA.b $2E,x				;$B8D8A7
	LDA.w #$0200				;$B8D8A9
	STA.b $44,x				;$B8D8AC
	RTS					;$B8D8AE

CODE_B8D8AF:
	LDX.b current_sprite			;$B8D8AF
	LDA.w #$0002				;$B8D8B1
	STA.b $38,x				;$B8D8B4
	LDA.w #$000E				;$B8D8B6
	JSL.l set_anim_handle_kiddy		;$B8D8B9
	JSR.w CODE_B89071			;$B8D8BD
	LDA.b $2E,x				;$B8D8C0
	CLC					;$B8D8C2
	ADC.w #$0100				;$B8D8C3
	STA.b $2E,x				;$B8D8C6
	JSL.l CODE_B8E198			;$B8D8C8
	JSL.l CODE_B8E15A			;$B8D8CC
	LDA.w #$0001				;$B8D8D0
	TSB.w $05B1				;$B8D8D3
	RTS					;$B8D8D6

CODE_B8D8D7:
	LDX.b current_sprite			;$B8D8D7
	LDA.w $04E2				;$B8D8D9
	AND.w #$8000				;$B8D8DC
	BEQ.b CODE_B8D8EA			;$B8D8DF
	LDY current_kong_control_variables	;$B8D8E1
	LDA.b active_frame_counter		;$B8D8E3
	STA.w $0022,y				;$B8D8E5
	BRA.b CODE_B8D8F7			;$B8D8E8

CODE_B8D8EA:
	LDY current_kong_control_variables	;$B8D8EA
	LDA.b active_frame_counter		;$B8D8EC
	SEC					;$B8D8EE
	SBC.w $0022,y				;$B8D8EF
	CMP.w #$0010				;$B8D8F2
	BPL.b CODE_B8D90F			;$B8D8F5
CODE_B8D8F7:
	LDA.b $5C,x				;$B8D8F7
	CMP.w #$0003				;$B8D8F9
	BCS.b CODE_B8D90F			;$B8D8FC
	LDA.b $2E,x				;$B8D8FE
	BMI.b CODE_B8D90F			;$B8D900
	LDA.w $050F				;$B8D902
	SEC					;$B8D905
	SBC.w #$0010				;$B8D906
	CMP.b $16,x				;$B8D909
	BCS.b CODE_B8D90F			;$B8D90B
	INC.b $5C,x				;$B8D90D
CODE_B8D90F:
	RTS					;$B8D90F

CODE_B8D910:
	LDA.w $04E2				;$B8D910
	AND.w #$8000				;$B8D913
	BNE.b CODE_B8D919			;$B8D916
CODE_B8D918:
	RTS					;$B8D918

CODE_B8D919:
	LDX.b current_sprite			;$B8D919
	LDA.b $4A,x				;$B8D91B
	AND.w #$0001				;$B8D91D
	BNE.b CODE_B8D918			;$B8D920
	LDA.b $62,x				;$B8D922
	BEQ.b CODE_B8D918			;$B8D924
	LDA.w $050F				;$B8D926
	CLC					;$B8D929
	ADC.w #$0024				;$B8D92A
	CMP.b $16,x				;$B8D92D
	BCC.b CODE_B8D918			;$B8D92F
	LDA.b $3A,x				;$B8D931
	ORA.w #$0004				;$B8D933
	STA.b $3A,x				;$B8D936
	LDA.w #$0024				;$B8D938
	STA.b $38,x				;$B8D93B
	LDA.w #$0005				;$B8D93D
	JSL.l set_anim_handle_animal_and_kiddy	;$B8D940
	LDY.w #$0280				;$B8D944
	LDA.b [$6A],y				;$B8D947
	STA.b $2E,x				;$B8D949
	JSL.l CODE_B8E198			;$B8D94B
	JSL.l CODE_B8E15A			;$B8D94F
	LDA.w #$0001				;$B8D953
	TSB.w $05B1				;$B8D956
	RTS					;$B8D959

CODE_B8D95A:
	LDA.w $04E2				;$B8D95A
	AND.w #$C000				;$B8D95D
	BEQ.b CODE_B8D96B			;$B8D960
	EOR.w $04E2				;$B8D962
	STA.w $04E2				;$B8D965
	JSR.w CODE_B8ADF5			;$B8D968
CODE_B8D96B:
	RTS					;$B8D96B

CODE_B8D96C:
	JSL.l CODE_B8E179			;$B8D96C
	RTS					;$B8D970

CODE_B8D971:
	LDA.w player_active_held		;$B8D971
	AND.w #$0400				;$B8D974
	BEQ.b CODE_B8D96C			;$B8D977
	JMP.w CODE_B8D3AF			;$B8D979

CODE_B8D97C:
	LDA.b current_animal_type		;$B8D97C
	SEC					;$B8D97E
	SBC.w #!animal_sprite_type_range_start 	;$B8D97F
	LSR					;$B8D982
	TAX					;$B8D983
	JMP.w (DATA_B8D987,x)			;$B8D984

DATA_B8D987:
	dw CODE_B8D98F
	dw CODE_B8DA33
	dw CODE_B8DA33
	dw CODE_B8DA33

CODE_B8D98F:
	JSR.w CODE_B8DA4F			;$B8D98F
	JSR.w CODE_B8DA83			;$B8D992
	BCS.b CODE_B8D99F			;$B8D995
	JSR.w CODE_B8DB56			;$B8D997
	BCC.b CODE_B8D99F			;$B8D99A
	JSR.w CODE_B8DBBC			;$B8D99C
CODE_B8D99F:
	RTS					;$B8D99F

CODE_B8D9A0:
	JSR.w CODE_B8DA4F			;$B8D9A0
	JSR.w CODE_B8DA6D			;$B8D9A3
	BCS.b CODE_B8D9CD			;$B8D9A6
	LDX.b current_sprite			;$B8D9A8
	LDA.b $4A,x				;$B8D9AA
	AND.w #$0002				;$B8D9AC
	BNE.b CODE_B8D9CD			;$B8D9AF
	LDA.b $16,x				;$B8D9B1
	SEC					;$B8D9B3
	SBC.b $18,x				;$B8D9B4
	BMI.b CODE_B8D9CD			;$B8D9B6
	LDA.w $04E2				;$B8D9B8
	AND.w #$4000				;$B8D9BB
	BNE.b CODE_B8D9CE			;$B8D9BE
	LDY current_kong_control_variables	;$B8D9C0
	LDA.b active_frame_counter		;$B8D9C2
	SEC					;$B8D9C4
	SBC.w $001A,y				;$B8D9C5
	CMP.w #$000C				;$B8D9C8
	BMI.b CODE_B8D9CE			;$B8D9CB
CODE_B8D9CD:
	RTS					;$B8D9CD

CODE_B8D9CE:
	JSL.l CODE_B8E271			;$B8D9CE
	LDY current_kong_control_variables	;$B8D9D2
	LDA.w $001A,y				;$B8D9D4
	STA.w $0010,y				;$B8D9D7
	LDX.b current_sprite			;$B8D9DA
	LDA.w #$0001				;$B8D9DC
	STA.b $2E,x				;$B8D9DF
	LDA.w #$0005				;$B8D9E1
	JSL.l set_anim_handle_kiddy		;$B8D9E4
	RTS					;$B8D9E8

CODE_B8D9E9:
	JSR.w CODE_B8DA4F			;$B8D9E9
	LDY current_kong_control_variables	;$B8D9EC
	CPY.w #dixie_control_variables		;$B8D9EE
	BNE.b CODE_B8DA32			;$B8D9F1
	LDX.b current_sprite			;$B8D9F3
	LDA.b $38,x				;$B8D9F5
	CMP.w #$0002				;$B8D9F7
	BNE.b CODE_B8DA32			;$B8D9FA
	LDA.b $2E,x				;$B8D9FC
	BMI.b CODE_B8DA32			;$B8D9FE
	LDA.b $18,x				;$B8DA00
	SEC					;$B8DA02
	SBC.b $16,x				;$B8DA03
	BMI.b CODE_B8DA0C			;$B8DA05
	CMP.w #$0018				;$B8DA07
	BCC.b CODE_B8DA32			;$B8DA0A
CODE_B8DA0C:
	LDA.b active_frame_counter		;$B8DA0C
	SEC					;$B8DA0E
	SBC.w $001A,y				;$B8DA0F
	CMP.w #$0010				;$B8DA12
	BCS.b CODE_B8DA32			;$B8DA15
	LDA.w #$000A				;$B8DA17
	CMP.b $40,x				;$B8DA1A
	BEQ.b CODE_B8DA32			;$B8DA1C
	JSL.l set_sprite_animation		;$B8DA1E
	LDY.w #$0038				;$B8DA22
	LDA.b [$6A],y				;$B8DA25
	STA.b $2E,x				;$B8DA27
	LDX current_kong_control_variables	;$B8DA29
	LDY.w #$0040				;$B8DA2B
	LDA.b [$6A],y				;$B8DA2E
	STA.b $0A,x				;$B8DA30
CODE_B8DA32:
	RTS					;$B8DA32

CODE_B8DA33:
	JSR.w CODE_B8DA4F			;$B8DA33
	RTS					;$B8DA36

CODE_B8DA37:
	LDA.w $04E2				;$B8DA37
	AND.w #$4000				;$B8DA3A
	BNE.b CODE_B8DA40			;$B8DA3D
	RTS					;$B8DA3F

CODE_B8DA40:
	LDX.b current_sprite			;$B8DA40
	LDA.w #$0045				;$B8DA42
	STA.b $38,x				;$B8DA45
	LDA.w #$0032				;$B8DA47
	JSL.l set_anim_handle_kiddy		;$B8DA4A
	RTS					;$B8DA4E

CODE_B8DA4F:
	LDY current_kong_control_variables	;$B8DA4F
	LDA.w $0004,y				;$B8DA51
	AND.w #$0300				;$B8DA54
	BEQ.b CODE_B8DA63			;$B8DA57
	LDA.w $0006,y				;$B8DA59
	ORA.w #$0004				;$B8DA5C
	STA.w $0006,y				;$B8DA5F
	RTS					;$B8DA62

CODE_B8DA63:
	LDA.w $0006,y				;$B8DA63
	AND.w #$FFFB				;$B8DA66
	STA.w $0006,y				;$B8DA69
	RTS					;$B8DA6C

CODE_B8DA6D:
	LDY.w #$0001				;$B8DA6D
	JSR.w CODE_B8DA99			;$B8DA70
	BCC.b CODE_B8DA82			;$B8DA73
	LDA.w #$0010				;$B8DA75
	STA.b $38,x				;$B8DA78
	LDA.w #$0010				;$B8DA7A
	JSL.l set_anim_handle_kiddy		;$B8DA7D
	SEC					;$B8DA81
CODE_B8DA82:
	RTS					;$B8DA82

CODE_B8DA83:
	LDY.w #$000E				;$B8DA83
	JSR.w CODE_B8DA99			;$B8DA86
	BCC.b CODE_B8DA98			;$B8DA89
	LDA.w #$0026				;$B8DA8B
	STA.b $38,x				;$B8DA8E
	LDA.w #$0010				;$B8DA90
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DA93
	SEC					;$B8DA97
CODE_B8DA98:
	RTS					;$B8DA98

CODE_B8DA99:									; Note: Related to picking up a barrel.
	LDX.b current_sprite			;$B8DA99
	LDA.b $28,x				;$B8DA9B
	LSR					;$B8DA9D
	BCC.b CODE_B8DABE			;$B8DA9E
	TYA					;$B8DAA0
	JSL.l CODE_BCE43C			;$B8DAA1
	LDA.w #$0001				;$B8DAA5
	JSL.l CODE_BCE75E			;$B8DAA8
	BCC.b CODE_B8DABE			;$B8DAAC
CODE_B8DAAE:
	LDY.b $78				;$B8DAAE
	LDA.w $0028,y				;$B8DAB0
	AND.w #$0101				;$B8DAB3
	BNE.b CODE_B8DABF			;$B8DAB6
	JSL.l CODE_BCE779			;$B8DAB8
	BCS.b CODE_B8DAAE			;$B8DABC
CODE_B8DABE:
	RTS					;$B8DABE

CODE_B8DABF:
	STY.w current_held_sprite		;$B8DABF
	STZ.w $1877				;$B8DAC2
	LDX.b current_sprite			;$B8DAC5
	LDA.w #$0001				;$B8DAC7
	STA.w $003C,y				;$B8DACA
	STX.b $3E,y				;$B8DACD
	LDA.w $003A,y				;$B8DACF
	STA.w $1875				;$B8DAD2
	AND.w #$FFFA				;$B8DAD5
	ORA.w #$0020				;$B8DAD8
	STA.w $003A,y				;$B8DADB
	LDA.w $000E,y				;$B8DADE
	STA.w $1873				;$B8DAE1
	LDA.w $0012,y				;$B8DAE4
	SEC					;$B8DAE7
	SBC.b $12,x				;$B8DAE8
	BIT.b $1E,x				;$B8DAEA
	BVC.b CODE_B8DAF2			;$B8DAEC
	EOR.w #$FFFF				;$B8DAEE
	INC					;$B8DAF1
CODE_B8DAF2:
	STA.w $186D				;$B8DAF2
	LDA.w $0016,y				;$B8DAF5
	SEC					;$B8DAF8
	SBC.b $16,x				;$B8DAF9
	STA.w $186F				;$B8DAFB
	LDA.w #$FFFF				;$B8DAFE
	STA.w $1871				;$B8DB01
	LDA.w $04E0				;$B8DB04
	AND.w #$1300				;$B8DB07
	STA.w $04E0				;$B8DB0A
	SEC					;$B8DB0D
	RTS					;$B8DB0E

CODE_B8DB0F:
	LDA.w #$000F				;$B8DB0F
	JSL.l CODE_BCE43C			;$B8DB12
	LDA.w #$0001				;$B8DB16
	JSL.l CODE_BCE75E			;$B8DB19
	BCC.b CODE_B8DB39			;$B8DB1D
CODE_B8DB1F:
	LDY.b $78				;$B8DB1F
	LDA.w $0028,y				;$B8DB21
	AND.w #$0101				;$B8DB24
	BEQ.b CODE_B8DB33			;$B8DB27
	LDA.b $D6				;$B8DB29
	SEC					;$B8DB2B
	SBC.b $DA				;$B8DB2C
	CMP.w #$0008				;$B8DB2E
	BCC.b CODE_B8DB3A			;$B8DB31
CODE_B8DB33:
	JSL.l CODE_BCE779			;$B8DB33
	BCS.b CODE_B8DB1F			;$B8DB37
CODE_B8DB39:
	RTS					;$B8DB39

CODE_B8DB3A:
	JSR.w CODE_B8DABF			;$B8DB3A
	LDA.w #$0064				;$B8DB3D
	STA.b $38,x				;$B8DB40
	STZ.b $5A,x				;$B8DB42
	LDA.w #$0005				;$B8DB44
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DB47
	STZ.w $1929				;$B8DB4B
	LDA.w #$000F				;$B8DB4E
	STA.w $192B				;$B8DB51
	SEC					;$B8DB54
	RTS					;$B8DB55

CODE_B8DB56:
	LDX.b current_sprite			;$B8DB56
	LDA.b $30,x				;$B8DB58
	BNE.b CODE_B8DB69			;$B8DB5A
	LDA.w $187B				;$B8DB5C
	CMP.w #$001E				;$B8DB5F
	BCC.b CODE_B8DB6C			;$B8DB62
	LDA.b $28,x				;$B8DB64
	LSR					;$B8DB66
	BCS.b CODE_B8DB76			;$B8DB67
CODE_B8DB69:
	STZ.w $187B				;$B8DB69
CODE_B8DB6C:
	INC.w $187B				;$B8DB6C
CODE_B8DB6F:
	STZ.w $1879				;$B8DB6F
	LDX.b current_sprite			;$B8DB72
	CLC					;$B8DB74
	RTS					;$B8DB75

CODE_B8DB76:
	STZ.b $1A				;$B8DB76
	LDA.w #$000D				;$B8DB78
	JSL.l CODE_BCE43C			;$B8DB7B
	LDA.w #$C000				;$B8DB7F
	JSL.l CODE_BCE75E			;$B8DB82
	BCC.b CODE_B8DB6F			;$B8DB86
CODE_B8DB88:
	LDY.b $78				;$B8DB88
	LDA.w $0012,y				;$B8DB8A
	LDX.b $1A				;$B8DB8D
	BEQ.b CODE_B8DBA1			;$B8DB8F
	LDX.b current_sprite			;$B8DB91
	BIT.b $1E,x				;$B8DB93
	BVC.b CODE_B8DB9D			;$B8DB95
	CMP.b $1C				;$B8DB97
	BCS.b CODE_B8DBA1			;$B8DB99
	BRA.b CODE_B8DBA5			;$B8DB9B

CODE_B8DB9D:
	CMP.b $1C				;$B8DB9D
	BCS.b CODE_B8DBA5			;$B8DB9F
CODE_B8DBA1:
	STY.b $1A				;$B8DBA1
	STA.b $1C				;$B8DBA3
CODE_B8DBA5:
	JSL.l CODE_BCE779			;$B8DBA5
	BCS.b CODE_B8DB88			;$B8DBA9
	LDY.b $1A				;$B8DBAB
	LDA.w $003A,y				;$B8DBAD
	AND.w #$8000				;$B8DBB0
	BEQ.b CODE_B8DB6F			;$B8DBB3
	LDX.b current_sprite			;$B8DBB5
	STY.w $1879				;$B8DBB7
	SEC					;$B8DBBA
	RTS					;$B8DBBB

CODE_B8DBBC:
	LDA.b $4A,x				;$B8DBBC
	AND.w #$0010				;$B8DBBE
	BNE.b CODE_B8DBD7			;$B8DBC1
	LDA.w $0775				;$B8DBC3
	AND.w #$0100				;$B8DBC6
	BNE.b CODE_B8DBD8			;$B8DBC9
CODE_B8DBCB:
	LDA.w #$002A				;$B8DBCB
	STA.b $38,x				;$B8DBCE
	LDA.w #$000C				;$B8DBD0
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DBD3
CODE_B8DBD7:
	RTS					;$B8DBD7

CODE_B8DBD8:
	LDY.w $1879				;$B8DBD8
	LDA.w $0012,y				;$B8DBDB
	SEC					;$B8DBDE
	SBC.b $12,x				;$B8DBDF
	LDY.w #$0020				;$B8DBE1
	BCS.b CODE_B8DBED			;$B8DBE4
	LDY.w #$FFE0				;$B8DBE6
	EOR.w #$FFFF				;$B8DBE9
	INC					;$B8DBEC
CODE_B8DBED:
	CLC					;$B8DBED
	ADC.w #$001F				;$B8DBEE
	LSR					;$B8DBF1
	LSR					;$B8DBF2
	LSR					;$B8DBF3
	LSR					;$B8DBF4
	LSR					;$B8DBF5
	STA.b $3E				;$B8DBF6
	STY.b $40				;$B8DBF8
	LDA.b $12,x				;$B8DBFA
	SEC					;$B8DBFC
	SBC.w #$0100				;$B8DBFD
	STA.b $2E				;$B8DC00
	LDA.b $16,x				;$B8DC02
	SEC					;$B8DC04
	SBC.w #$0014				;$B8DC05
	STA.b $30				;$B8DC08
	LDA.b $18,x				;$B8DC0A
	STA.b $32				;$B8DC0C
	SEC					;$B8DC0E
	SBC.w #$002C				;$B8DC0F
	STA.b $34				;$B8DC12
CODE_B8DC14:
	DEC.b $3E				;$B8DC14
	BMI.b CODE_B8DBCB			;$B8DC16
	BNE.b CODE_B8DC26			;$B8DC18
	LDY.w $1879				;$B8DC1A
	LDA.w $0012,y				;$B8DC1D
	SEC					;$B8DC20
	SBC.w #$0100				;$B8DC21
	BRA.b CODE_B8DC2D			;$B8DC24

CODE_B8DC26:
	LDA.b $2E				;$B8DC26
	CLC					;$B8DC28
	ADC.b $40				;$B8DC29
	STA.b $2E				;$B8DC2B
CODE_B8DC2D:
	STA.b $1A				;$B8DC2D
	LDA.b $30				;$B8DC2F
	STA.b $1C				;$B8DC31
	JSL.l CODE_B7C766			;$B8DC33
	CMP.w #$0000				;$B8DC37
	BMI.b CODE_B8DBCB			;$B8DC3A
	EOR.w #$FFFF				;$B8DC3C
	ADC.w #$6300				;$B8DC3F
	CMP.b $34				;$B8DC42
	BCC.b CODE_B8DC55			;$B8DC44
	LDY.b $32				;$B8DC46
	STA.b $32				;$B8DC48
	TYA					;$B8DC4A
	SEC					;$B8DC4B
	SBC.b $32				;$B8DC4C
	BCC.b CODE_B8DC56			;$B8DC4E
	CMP.w #$0020				;$B8DC50
	BCC.b CODE_B8DC14			;$B8DC53
CODE_B8DC55:
	RTS					;$B8DC55

CODE_B8DC56:
	BRL CODE_B8DBCB				;$B8DC56

CODE_B8DC59:
	LDY current_kong_control_variables	;$B8DC59
	LDA.w $0004,y				;$B8DC5B
	AND.w #$0C00				;$B8DC5E
	BEQ.b CODE_B8DC6D			;$B8DC61
	LDA.w $0006,y				;$B8DC63
	ORA.w #$0004				;$B8DC66
	STA.w $0006,y				;$B8DC69
	RTS					;$B8DC6C

CODE_B8DC6D:
	LDA.w $0006,y				;$B8DC6D
	AND.w #$FFFB				;$B8DC70
	STA.w $0006,y				;$B8DC73
	RTS					;$B8DC76

CODE_B8DC77:
	LDY current_kong_control_variables	;$B8DC77
	LDA.w $0006,y				;$B8DC79
	AND.w #$FFFB				;$B8DC7C
	STA.w $0006,y				;$B8DC7F
	STZ.w $1879				;$B8DC82
	STZ.w $187B				;$B8DC85
	RTS					;$B8DC88

CODE_B8DC89:
	LDX.b current_sprite			;$B8DC89
	LDA.b $4A,x				;$B8DC8B
	AND.w #$0004				;$B8DC8D
	BNE.b CODE_B8DCAD			;$B8DC90
	LDA.w $04E0				;$B8DC92
	AND.w #$0400				;$B8DC95
	BEQ.b CODE_B8DCAE			;$B8DC98
	LDA.b $28,x				;$B8DC9A
	AND.w #$0001				;$B8DC9C
	BEQ.b CODE_B8DCAE			;$B8DC9F
	LDA.w #$0012				;$B8DCA1
	STA.b $38,x				;$B8DCA4
	LDA.w #$0014				;$B8DCA6
	JSL.l set_anim_handle_kiddy		;$B8DCA9
CODE_B8DCAD:
	RTS					;$B8DCAD

CODE_B8DCAE:
	LDA.w #$0013				;$B8DCAE
	STA.b $38,x				;$B8DCB1
	LDA.w #$0015				;$B8DCB3
	JSL.l set_anim_handle_kiddy		;$B8DCB6
	RTS					;$B8DCBA

CODE_B8DCBB:
	LDX.b current_sprite			;$B8DCBB
	LDA.b $4A,x				;$B8DCBD
	AND.w #$0004				;$B8DCBF
	BNE.b CODE_B8DCDF			;$B8DCC2
	LDA.w $04E0				;$B8DCC4
	AND.w #$0400				;$B8DCC7
	BEQ.b CODE_B8DCE0			;$B8DCCA
	LDA.b $28,x				;$B8DCCC
	AND.w #$0001				;$B8DCCE
	BEQ.b CODE_B8DCE0			;$B8DCD1
	LDA.w #$0028				;$B8DCD3
	STA.b $38,x				;$B8DCD6
	LDA.w #$0011				;$B8DCD8
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DCDB
CODE_B8DCDF:
	RTS					;$B8DCDF

CODE_B8DCE0:
	LDA.w #$0029				;$B8DCE0
	STA.b $38,x				;$B8DCE3
	LDA.w #$0012				;$B8DCE5
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DCE8
	RTS					;$B8DCEC

CODE_B8DCED:
	LDA.w $04E2				;$B8DCED
	AND.w #$0080				;$B8DCF0
	BEQ.b CODE_B8DCFF			;$B8DCF3
	LDA.w current_held_sprite		;$B8DCF5
	BEQ.b CODE_B8DD08			;$B8DCF8
	CMP.w follower_kong_sprite		;$B8DCFA
	BEQ.b CODE_B8DD00			;$B8DCFD
CODE_B8DCFF:
	RTS					;$B8DCFF

CODE_B8DD00:
	LDA.w #$0004				;$B8DD00
	JSL.l CODE_B882B6			;$B8DD03
	RTS					;$B8DD07

CODE_B8DD08:
	LDY.w follower_kong_sprite		;$B8DD08
	LDA.w $0038,y				;$B8DD0B
	CMP.w #$0033				;$B8DD0E
	BNE.b CODE_B8DCFF			;$B8DD11
	JSR.w CODE_B8DD20			;$B8DD13
	BCS.b CODE_B8DCFF			;$B8DD16
	LDA.w #$0001				;$B8DD18
	JSL.l CODE_B882B6			;$B8DD1B
	RTS					;$B8DD1F

CODE_B8DD20:
	LDA.w $05AF				;$B8DD20
	AND.w #$4000				;$B8DD23
	BEQ.b CODE_B8DD2F			;$B8DD26
	LDA.w current_held_sprite		;$B8DD28
	BNE.b CODE_B8DD2F			;$B8DD2B
	CLC					;$B8DD2D
	RTS					;$B8DD2E

CODE_B8DD2F:
	SEC					;$B8DD2F
	RTS					;$B8DD30

CODE_B8DD31:
	LDA.w $04E2				;$B8DD31
	AND.w #$0080				;$B8DD34
	BEQ.b CODE_B8DD4F			;$B8DD37
	LDX.b current_sprite			;$B8DD39
	STZ.b $30,x				;$B8DD3B
	STZ.b $2A,x				;$B8DD3D
	STZ.b $34,x				;$B8DD3F
	STZ.b $2E,x				;$B8DD41
	LDA.w #$002F				;$B8DD43
	STA.b $38,x				;$B8DD46
	LDA.w #$0005				;$B8DD48
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DD4B
CODE_B8DD4F:
	RTS					;$B8DD4F

CODE_B8DD50:
	BIT.w #$0010				;$B8DD50
	BNE.b CODE_B8DD6C			;$B8DD53
	LDA.b current_animal_type		;$B8DD55
	CMP.w #!sprite_ellie			;$B8DD57
	BNE.b CODE_B8DD6C			;$B8DD5A
	LDA.w $04E2				;$B8DD5C
	AND.w #$0080				;$B8DD5F
	BEQ.b CODE_B8DD6C			;$B8DD62
	LDA.w $04E0				;$B8DD64
	AND.w #$0400				;$B8DD67
	BEQ.b CODE_B8DDB1			;$B8DD6A
CODE_B8DD6C:
	RTS					;$B8DD6C

CODE_B8DD6D:
	BIT.w #$0080				;$B8DD6D
	BNE.b CODE_B8DD81			;$B8DD70
	LDA.b current_animal_type		;$B8DD72
	CMP.w #!sprite_ellie			;$B8DD74
	BNE.b CODE_B8DD81			;$B8DD77
	LDA.w $04E2				;$B8DD79
	AND.w #$0010				;$B8DD7C
	BNE.b CODE_B8DDB1			;$B8DD7F
CODE_B8DD81:
	RTS					;$B8DD81

CODE_B8DD82:
	BIT.w #$0010				;$B8DD82
	BNE.b CODE_B8DDA2			;$B8DD85
	LDA.w $04E2				;$B8DD87
	AND.w #$0080				;$B8DD8A
	BEQ.b CODE_B8DDA2			;$B8DD8D
	LDX.b current_sprite			;$B8DD8F
	LDA.b $28,x				;$B8DD91
	AND.w #$0101				;$B8DD93
	BEQ.b CODE_B8DDB1			;$B8DD96
	LDA.w $04E0				;$B8DD98
	AND.w #$0400				;$B8DD9B
	BNE.b CODE_B8DE05			;$B8DD9E
	BEQ.b CODE_B8DDB1			;$B8DDA0
CODE_B8DDA2:
	RTS					;$B8DDA2

CODE_B8DDA3:
	BIT.w #$0080				;$B8DDA3
	BNE.b CODE_B8DDB0			;$B8DDA6
	LDA.w $04E2				;$B8DDA8
	AND.w #$0010				;$B8DDAB
	BNE.b CODE_B8DDB1			;$B8DDAE
CODE_B8DDB0:
	RTS					;$B8DDB0

CODE_B8DDB1:
	LDX.b current_sprite			;$B8DDB1
	LDA.b $4A,x				;$B8DDB3
	AND.w #$0020				;$B8DDB5
	BNE.b CODE_B8DDF5			;$B8DDB8
	LDA.b $28,x				;$B8DDBA
	AND.w #$0001				;$B8DDBC
	BEQ.b CODE_B8DDE2			;$B8DDBF
	LDY current_kong_control_variables	;$B8DDC1
	LDA.w #$0046				;$B8DDC3
	CMP.w $0000,y				;$B8DDC6
	BEQ.b CODE_B8DDDF			;$B8DDC9
	LDA.b $16,x				;$B8DDCB
	CMP.w $050F				;$B8DDCD
	BCS.b CODE_B8DDE2			;$B8DDD0
	LDA.w #$002C				;$B8DDD2
	STA.b $38,x				;$B8DDD5
	LDA.w #$000E				;$B8DDD7
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DDDA
	RTS					;$B8DDDE

CODE_B8DDDF:
	JSR.w CODE_B89071			;$B8DDDF
CODE_B8DDE2:
	STZ.w $04AA				;$B8DDE2
	STZ.w $04AE				;$B8DDE5
	LDA.w #$0069				;$B8DDE8
	STA.b $38,x				;$B8DDEB
	LDA.w #$000F				;$B8DDED
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DDF0
	RTS					;$B8DDF4

CODE_B8DDF5:
	LDA.w #$0001				;$B8DDF5
	TSB.w $1957				;$B8DDF8
	RTS					;$B8DDFB

CODE_B8DDFC:
	LDA.w $04E2				;$B8DDFC
	AND.w #$0020				;$B8DDFF
	BNE.b CODE_B8DE05			;$B8DE02
	RTS					;$B8DE04

CODE_B8DE05:
	LDX.b current_sprite			;$B8DE05
	LDA.b $4A,x				;$B8DE07
	AND.w #$0010				;$B8DE09
	BNE.b CODE_B8DE1E			;$B8DE0C
	STZ.b $30,x				;$B8DE0E
	STZ.b $2A,x				;$B8DE10
	LDA.w #$002B				;$B8DE12
	STA.b $38,x				;$B8DE15
	LDA.w #$000D				;$B8DE17
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DE1A
CODE_B8DE1E:
	RTS					;$B8DE1E

CODE_B8DE1F:
	LDA.w $04E0				;$B8DE1F
	AND.w #$0200				;$B8DE22
	BNE.b CODE_B8DE2A			;$B8DE25
	JSR.w CODE_B8DE36			;$B8DE27
CODE_B8DE2A:
	LDA.w $04E0				;$B8DE2A
	AND.w #$0100				;$B8DE2D
	BNE.b CODE_B8DE35			;$B8DE30
	JSR.w CODE_B8DE55			;$B8DE32
CODE_B8DE35:
	RTS					;$B8DE35

CODE_B8DE36:
	LDA.w $18E9				;$B8DE36
	DEC					;$B8DE39
	BEQ.b CODE_B8DE54			;$B8DE3A
	LDX.b current_sprite			;$B8DE3C
	LDY.b $5C,x				;$B8DE3E
	LDA.w $0062,y				;$B8DE40
	INC					;$B8DE43
	CMP.w #$001E				;$B8DE44
	BCC.b CODE_B8DE51			;$B8DE47
	LDA.w #$001E				;$B8DE49
	CMP.w $0062,y				;$B8DE4C
	BCC.b CODE_B8DE54			;$B8DE4F
CODE_B8DE51:
	STA.w $0062,y				;$B8DE51
CODE_B8DE54:
	RTS					;$B8DE54

CODE_B8DE55:
	LDA.w $18E9				;$B8DE55
	DEC					;$B8DE58
	BEQ.b CODE_B8DE73			;$B8DE59
	LDX.b current_sprite			;$B8DE5B
	LDY.b $5C,x				;$B8DE5D
	LDA.w $0066,y				;$B8DE5F
	INC					;$B8DE62
	CMP.w #$001E				;$B8DE63
	BCC.b CODE_B8DE70			;$B8DE66
	LDA.w #$001E				;$B8DE68
	CMP.w $0066,y				;$B8DE6B
	BCC.b CODE_B8DE73			;$B8DE6E
CODE_B8DE70:
	STA.w $0066,y				;$B8DE70
CODE_B8DE73:
	RTS					;$B8DE73

CODE_B8DE74:
	LDA.w $18E9				;$B8DE74
	DEC					;$B8DE77
	BEQ.b CODE_B8DE92			;$B8DE78
	LDX.b current_sprite			;$B8DE7A
	LDY.b $5C,x				;$B8DE7C
	LDA.w $005E,y				;$B8DE7E
	INC					;$B8DE81
	CMP.w #$001E				;$B8DE82
	BCC.b CODE_B8DE8F			;$B8DE85
	LDA.w #$001E				;$B8DE87
	CMP.w $005E,y				;$B8DE8A
	BCC.b CODE_B8DE92			;$B8DE8D
CODE_B8DE8F:
	STA.w $005E,y				;$B8DE8F
CODE_B8DE92:
	RTS					;$B8DE92

move_squawks_left_action:
	JSR.w CODE_B8DEA7			;$B8DE93
	EOR.w #$FFFF				;$B8DE96
	INC					;$B8DE99
	LDX.b current_sprite			;$B8DE9A
	STA.b $30,x				;$B8DE9C
	RTS					;$B8DE9E

CODE_B8DE9F:
	JSR.w CODE_B8DEA7			;$B8DE9F
	LDX.b current_sprite			;$B8DEA2
	STA.b $30,x				;$B8DEA4
	RTS					;$B8DEA6

CODE_B8DEA7:
	LDY.w #$0320				;$B8DEA7
	LDA.w current_held_sprite		;$B8DEAA
	ORA.b current_mount			;$B8DEAD
	BEQ.b CODE_B8DEB4			;$B8DEAF
	LDY.w #$0350				;$B8DEB1
CODE_B8DEB4:
	LDX current_kong_control_variables	;$B8DEB4
	LDA.b $06,x				;$B8DEB6
	AND.w #$0004				;$B8DEB8
	BEQ.b CODE_B8DEC3			;$B8DEBB
	TYA					;$B8DEBD
	CLC					;$B8DEBE
	ADC.w #$0008				;$B8DEBF
	TAY					;$B8DEC2
CODE_B8DEC3:
	LDA.b [$6A],y				;$B8DEC3
	RTS					;$B8DEC5

CODE_B8DEC6:
	JSL.l CODE_B8E1BE			;$B8DEC6
	JSL.l CODE_B8E15A			;$B8DECA
	RTS					;$B8DECE

CODE_B8DECF:
	JSL.l CODE_B8E198			;$B8DECF
	JSL.l CODE_B8E179			;$B8DED3
	RTS					;$B8DED7

CODE_B8DED8:
	LDA.w $04E2				;$B8DED8
	AND.w #$8000				;$B8DEDB
	BEQ.b CODE_B8DF1F			;$B8DEDE
	LDX.b current_sprite			;$B8DEE0
	LDY.w #$0360				;$B8DEE2
	LDA.b current_mount			;$B8DEE5
	BNE.b CODE_B8DEEC			;$B8DEE7
	LDY.w #$0330				;$B8DEE9
CODE_B8DEEC:
	LDA.w $04E0				;$B8DEEC
	AND.w #$0800				;$B8DEEF
	BEQ.b CODE_B8DEFD			;$B8DEF2
	TYA					;$B8DEF4
	CLC					;$B8DEF5
	ADC.w #$0008				;$B8DEF6
	TAY					;$B8DEF9
	LDA.w #$0100				;$B8DEFA
CODE_B8DEFD:
	STA.b $1A				;$B8DEFD
	LDA.b [$6A],y				;$B8DEFF
	STA.b $2E,x				;$B8DF01
	LDA.b $4A,x				;$B8DF03
	AND.w #$0008				;$B8DF05
	BNE.b CODE_B8DF18			;$B8DF08
	LDA.w #$0340				;$B8DF0A
	LDY.b $F8				;$B8DF0D
	BEQ.b CODE_B8DF14			;$B8DF0F
	LDA.w #$0200				;$B8DF11
CODE_B8DF14:
	ADC.b $1A				;$B8DF14
	STA.b $44,x				;$B8DF16
CODE_B8DF18:
	LDA.w #$0727				;$B8DF18
	JSL.l queue_sound_effect		;$B8DF1B
CODE_B8DF1F:
	RTS					;$B8DF1F

CODE_B8DF20:
	JSR.w CODE_B8DA4F			;$B8DF20
	LDA.w $0777				;$B8DF23
	AND.w #$0010				;$B8DF26
	BEQ.b CODE_B8DF35			;$B8DF29
	LDA.w current_held_sprite		;$B8DF2B
	BNE.b CODE_B8DF5D			;$B8DF2E
	JSR.w CODE_B8DB0F			;$B8DF30
	BRA.b CODE_B8DF5D			;$B8DF33

CODE_B8DF35:
	LDA.w $04E2				;$B8DF35
	AND.w #$4000				;$B8DF38
	BEQ.b CODE_B8DF5D			;$B8DF3B
	LDA.w current_held_sprite		;$B8DF3D
	BNE.b CODE_B8DF5D			;$B8DF40
	LDX.b current_sprite			;$B8DF42
	LDY current_kong_control_variables	;$B8DF44
	LDA.w #$0069				;$B8DF46
	CMP.w $0000,y				;$B8DF49
	BEQ.b CODE_B8DF57			;$B8DF4C
	LDA.w #$0004				;$B8DF4E
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DF51
	BRA.b CODE_B8DF5D			;$B8DF55

CODE_B8DF57:
	LDA.w #$0001				;$B8DF57
	TSB.w $1957				;$B8DF5A
CODE_B8DF5D:
	RTS					;$B8DF5D

CODE_B8DF5E:
	LDX.b current_sprite			;$B8DF5E
	LDA.b $4A,x				;$B8DF60
	AND.w #$0004				;$B8DF62
	BNE.b CODE_B8DF82			;$B8DF65
	LDA.w $04E0				;$B8DF67
	AND.w #$0400				;$B8DF6A
	BEQ.b CODE_B8DF83			;$B8DF6D
	LDA.b $1A,x				;$B8DF6F
	CMP.w #$0038				;$B8DF71
	BCS.b CODE_B8DF83			;$B8DF74
	LDA.w #$0066				;$B8DF76
	STA.b $38,x				;$B8DF79
	LDA.w #$0007				;$B8DF7B
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DF7E
CODE_B8DF82:
	RTS					;$B8DF82

CODE_B8DF83:
	LDA.w #$0066				;$B8DF83
	STA.b $38,x				;$B8DF86
	LDA.w #$000B				;$B8DF88
	JSL.l set_anim_handle_animal_and_kiddy	;$B8DF8B
	RTS					;$B8DF8F

CODE_B8DF90:
	JSR.w CODE_B8DA4F			;$B8DF90
	LDA.w $04E2				;$B8DF93
	AND.w #$4000				;$B8DF96
	BNE.b CODE_B8DF9C			;$B8DF99
	RTS					;$B8DF9B

CODE_B8DF9C:
	LDA.b active_frame_counter		;$B8DF9C
	SEC					;$B8DF9E
	SBC.w $1893				;$B8DF9F
	STA.b $1A				;$B8DFA2
	CMP.w #$0010				;$B8DFA4
	BCC.b CODE_B8DFF4			;$B8DFA7
	LDA.b active_frame_counter		;$B8DFA9
	STA.w $1893				;$B8DFAB
	LDA.w $1897				;$B8DFAE
	CMP.w #$0003				;$B8DFB1
	BCS.b CODE_B8DFF4			;$B8DFB4
	LDY.w #$006A				;$B8DFB6
	JSL.l CODE_BB8585			;$B8DFB9
	BCS.b CODE_B8DFF4			;$B8DFBD
	INC.w $1897				;$B8DFBF
	LDX.b alternate_sprite			;$B8DFC2
	JSL.l CODE_B9E021			;$B8DFC4
	LDA.w #$0400				;$B8DFC8
	LDX.b current_sprite			;$B8DFCB
	BIT.b $1E,x				;$B8DFCD
	BVC.b CODE_B8DFD4			;$B8DFCF
	LDA.w #$FC00				;$B8DFD1
CODE_B8DFD4:
	LDX.b alternate_sprite			;$B8DFD4
	STA.b $2A,x				;$B8DFD6
	LDA.w $04E0				;$B8DFD8
	AND.w #$0C00				;$B8DFDB
	BEQ.b CODE_B8DFED			;$B8DFDE
	LDY.w #$FFEE				;$B8DFE0
	BIT.w #$0800				;$B8DFE3
	BNE.b CODE_B8DFEB			;$B8DFE6
	LDY.w #$0012				;$B8DFE8
CODE_B8DFEB:
	STY.b $62,x				;$B8DFEB
CODE_B8DFED:
	LDA.w #$0722				;$B8DFED
	JSL.l queue_sound_effect		;$B8DFF0
CODE_B8DFF4:
	RTS					;$B8DFF4

CODE_B8DFF5:
	LDA.w $04E2				;$B8DFF5
	AND.w #$00B0				;$B8DFF8
	BNE.b CODE_B8DFFE			;$B8DFFB
	RTS					;$B8DFFD

CODE_B8DFFE:
	TRB.w $04E2				;$B8DFFE
	LDX.b current_sprite			;$B8E001
	STZ.b $30,x				;$B8E003
	STZ.b $2A,x				;$B8E005
	LDA.w #$0002				;$B8E007
	TRB.w $1957				;$B8E00A
	BEQ.b CODE_B8E010			;$B8E00D
	RTS					;$B8E00F

CODE_B8E010:
	LDA.w $1957				;$B8E010
	AND.w #$0004				;$B8E013
	BNE.b CODE_B8E07F			;$B8E016
	LDA.b active_frame_counter		;$B8E018
	SEC					;$B8E01A
	SBC.w $1895				;$B8E01B
	CMP.w #$000C				;$B8E01E
	BCC.b CODE_B8E07F			;$B8E021
	LDA.b active_frame_counter		;$B8E023
	STA.w $1895				;$B8E025
	JSR.w CODE_B8E080			;$B8E028
	CMP.w #$0002				;$B8E02B
	BCC.b CODE_B8E037			;$B8E02E
	LDX.b $1E				;$B8E030
	LDA.w #$0001				;$B8E032
	STA.b $5E,x				;$B8E035
CODE_B8E037:
	LDY.w #$006C				;$B8E037
	JSL.l CODE_BB8585			;$B8E03A
	BCS.b CODE_B8E07F			;$B8E03E
	LDX.b alternate_sprite			;$B8E040
	JSL.l CODE_B9E021			;$B8E042
	LDA.w #$0002				;$B8E046
	TSB.w $1957				;$B8E049
	LDA.w #$0122				;$B8E04C
	JSL.l set_alt_sprite_animation		;$B8E04F
	LDA.w #$0200				;$B8E053
	LDX.b current_sprite			;$B8E056
	BIT.b $1E,x				;$B8E058
	BVC.b CODE_B8E05F			;$B8E05A
	LDA.w #$FE00				;$B8E05C
CODE_B8E05F:
	LDX.b alternate_sprite			;$B8E05F
	STA.b $2A,x				;$B8E061
	LDA.w $04E0				;$B8E063
	AND.w #$0C00				;$B8E066
	BEQ.b CODE_B8E078			;$B8E069
	LDY.w #$FFF2				;$B8E06B
	BIT.w #$0800				;$B8E06E
	BNE.b CODE_B8E076			;$B8E071
	LDY.w #$000E				;$B8E073
CODE_B8E076:
	STY.b $62,x				;$B8E076
CODE_B8E078:
	LDA.w #$0723				;$B8E078
	JSL.l queue_sound_effect		;$B8E07B
CODE_B8E07F:
	RTS					;$B8E07F

CODE_B8E080:
	LDX.w #main_sprite_table		;$B8E080
	STZ.b $1A				;$B8E083
	STZ.b $1C				;$B8E085
	STZ.b $1E				;$B8E087
CODE_B8E089:
	LDA.b sprite.type,x 			;$B8E089
	CMP.w #!sprite_web_platform		;$B8E08B
	BNE.b CODE_B8E0A0			;$B8E08E
	INC.b $1A				;$B8E090
	LDA.b $5E,x				;$B8E092
	BNE.b CODE_B8E0A0			;$B8E094
	LDA.b $5C,x				;$B8E096
	CMP.b $1C				;$B8E098
	BMI.b CODE_B8E0A0			;$B8E09A
	STA.b $1C				;$B8E09C
	STX.b $1E				;$B8E09E
CODE_B8E0A0:
	TXA					;$B8E0A0
	CLC					;$B8E0A1
	ADC.w #sizeof(sprite)			;$B8E0A2
	TAX					;$B8E0A5
	CPX.w #main_sprite_table_end		;$B8E0A6
	BNE.b CODE_B8E089			;$B8E0A9
	LDA.b $1A				;$B8E0AB
	RTS					;$B8E0AD

CODE_B8E0AE:
	LDX.b current_sprite			;$B8E0AE
	LDA.b $30,x				;$B8E0B0
	BEQ.b CODE_B8E0BE			;$B8E0B2
	LSR					;$B8E0B4
	EOR.b $1E,x				;$B8E0B5
	AND.w #$4000				;$B8E0B7
	EOR.b $1E,x				;$B8E0BA
	STA.b $1E,x				;$B8E0BC
CODE_B8E0BE:
	RTS					;$B8E0BE

CODE_B8E0BF:
	LDX.b current_sprite			;$B8E0BF
	LDA.b $2E,x				;$B8E0C1
	BMI.b CODE_B8E0C9			;$B8E0C3
	JSL.l CODE_B8E179			;$B8E0C5
CODE_B8E0C9:
	RTS					;$B8E0C9

CODE_B8E0CA:
	LDX.b current_sprite			;$B8E0CA
	STZ.b $3E				;$B8E0CC
	LDA.b $2A,x				;$B8E0CE
	BPL.b CODE_B8E0D4			;$B8E0D0
	DEC.b $3E				;$B8E0D2
CODE_B8E0D4:
	CLC					;$B8E0D4
	ADC.b $11,x				;$B8E0D5
	STA.b $11,x				;$B8E0D7
	SEP.b #$20				;$B8E0D9
	LDA.b $3E				;$B8E0DB
	ADC.b $13,x				;$B8E0DD
	STA.b $13,x				;$B8E0DF
	REP.b #$20				;$B8E0E1
	RTS					;$B8E0E3

CODE_B8E0E4:
	LDX.b current_sprite			;$B8E0E4
	STZ.b $3E				;$B8E0E6
	LDA.b $2E,x				;$B8E0E8
	BPL.b CODE_B8E0EE			;$B8E0EA
	DEC.b $3E				;$B8E0EC
CODE_B8E0EE:
	CLC					;$B8E0EE
	ADC.b $15,x				;$B8E0EF
	STA.b $15,x				;$B8E0F1
	SEP.b #$20				;$B8E0F3
	LDA.b $3E				;$B8E0F5
	ADC.b $17,x				;$B8E0F7
	STA.b $17,x				;$B8E0F9
	REP.b #$20				;$B8E0FB
	RTS					;$B8E0FD

CODE_B8E0FE:
	PHK					;$B8E0FE
	PLB					;$B8E0FF
	LDX.b current_sprite			;$B8E100
	CPX.w follower_kong_sprite		;$B8E102
	BEQ.b CODE_B8E138			;$B8E105
	LDA level_number			;$B8E107
	CMP.w #!level_springin_spiders_bonus_1	;$B8E109
	BNE.b CODE_B8E122			;$B8E10C
	LDA.w $196D				;$B8E10E
	CLC					;$B8E111
	ADC.w #$0015				;$B8E112
	CMP.b $12,x				;$B8E115
	BCS.b CODE_B8E134			;$B8E117
	ADC.w #$00D6				;$B8E119
	CMP.b $12,x				;$B8E11C
	BCS.b CODE_B8E138			;$B8E11E
	BRA.b CODE_B8E134			;$B8E120

CODE_B8E122:
	LDA.w $196D				;$B8E122
	CLC					;$B8E125
	ADC.w #$0010				;$B8E126
	CMP.b $12,x				;$B8E129
	BCS.b CODE_B8E134			;$B8E12B
	ADC.w #$00E0				;$B8E12D
	CMP.b $12,x				;$B8E130
	BCS.b CODE_B8E138			;$B8E132
CODE_B8E134:
	STA.b $12,x				;$B8E134
	BRA.b CODE_B8E138			;$B8E136

CODE_B8E138:
	LDA.w $05AF				;$B8E138
	AND.w #$2000				;$B8E13B
	BNE.b CODE_B8E159			;$B8E13E
	LDA.b $C6				;$B8E140
	BEQ.b CODE_B8E148			;$B8E142
	CMP.b $16,x				;$B8E144
	BCC.b CODE_B8E150			;$B8E146
CODE_B8E148:
	LDA.b $C8				;$B8E148
	BEQ.b CODE_B8E159			;$B8E14A
	CMP.b $16,x				;$B8E14C
	BCS.b CODE_B8E159			;$B8E14E
CODE_B8E150:
	STA.b $16,x				;$B8E150
	LDA.b $28,x				;$B8E152
	ORA.w #$0001				;$B8E154
	STA.b $28,x				;$B8E157
CODE_B8E159:
	RTS					;$B8E159

CODE_B8E15A:
	LDA.b current_animal_type		;$B8E15A
	BNE.b CODE_B8E169			;$B8E15C
CODE_B8E15E:
	LDY.w #$0010				;$B8E15E
	LDA.b [$6A],y				;$B8E161
	LDY current_kong_control_variables	;$B8E163
	STA.w $0008,y				;$B8E165
	RTL					;$B8E168

CODE_B8E169:
	CMP.w #!sprite_squawks			;$B8E169
	BNE.b CODE_B8E15E			;$B8E16C
	LDY.w #$0310				;$B8E16E
	LDA.b [$6A],y				;$B8E171
	LDY current_kong_control_variables	;$B8E173
	STA.w $0008,y				;$B8E175
	RTL					;$B8E178

CODE_B8E179:
	LDA.b current_animal_type		;$B8E179
	BNE.b CODE_B8E188			;$B8E17B
CODE_B8E17D:
	LDY.w #$0000				;$B8E17D
	LDA.b [$6A],y				;$B8E180
	LDY current_kong_control_variables	;$B8E182
	STA.w $0008,y				;$B8E184
	RTL					;$B8E187

CODE_B8E188:
	CMP.w #!sprite_squawks			;$B8E188
	BNE.b CODE_B8E17D			;$B8E18B
	LDY.w #$0318				;$B8E18D
	LDA.b [$6A],y				;$B8E190
	LDY current_kong_control_variables	;$B8E192
	STA.w $0008,y				;$B8E194
	RTL					;$B8E197

CODE_B8E198:
	LDA.b current_animal_type		;$B8E198
	BNE.b CODE_B8E1A7			;$B8E19A
CODE_B8E19C:
	LDY.w #$0008				;$B8E19C
	LDA.b [$6A],y				;$B8E19F
	LDY current_kong_control_variables	;$B8E1A1
	STA.w $000A,y				;$B8E1A3
	RTL					;$B8E1A6

CODE_B8E1A7:
	CMP.w #!sprite_squawks			;$B8E1A7
	BNE.b CODE_B8E19C			;$B8E1AA
	LDY.w #$0348				;$B8E1AC
	LDA.b current_mount			;$B8E1AF
	BEQ.b CODE_B8E1B6			;$B8E1B1
	LDY.w #$0378				;$B8E1B3
CODE_B8E1B6:
	LDA.b [$6A],y				;$B8E1B6
	LDY current_kong_control_variables	;$B8E1B8
	STA.w $000A,y				;$B8E1BA
	RTL					;$B8E1BD

CODE_B8E1BE:
	LDA.b current_animal_type		;$B8E1BE
	BNE.b CODE_B8E1CD			;$B8E1C0
CODE_B8E1C2:
	LDY.w #$0018				;$B8E1C2
	LDA.b [$6A],y				;$B8E1C5
	LDY current_kong_control_variables	;$B8E1C7
	STA.w $000A,y				;$B8E1C9
	RTL					;$B8E1CC

CODE_B8E1CD:
	CMP.w #!sprite_squawks			;$B8E1CD
	BNE.b CODE_B8E1C2			;$B8E1D0
	LDY.w #$0340				;$B8E1D2
	LDA.b current_mount			;$B8E1D5
	BEQ.b CODE_B8E1DC			;$B8E1D7
	LDY.w #$0370				;$B8E1D9
CODE_B8E1DC:
	LDA.b [$6A],y				;$B8E1DC
	LDY current_kong_control_variables	;$B8E1DE
	STA.w $000A,y				;$B8E1E0
	RTL					;$B8E1E3

CODE_B8E1E4:
	LDY.w #$0020				;$B8E1E4
	LDA.b [$6A],y				;$B8E1E7
	LDY current_kong_control_variables	;$B8E1E9
	STA.w $0008,y				;$B8E1EB
	RTL					;$B8E1EE

CODE_B8E1EF:
	LDY.w #$0028				;$B8E1EF
	LDA.b [$6A],y				;$B8E1F2
	LDY current_kong_control_variables	;$B8E1F4
	STA.w $000A,y				;$B8E1F6
	RTL					;$B8E1F9

CODE_B8E1FA:
	RTS					;$B8E1FA

CODE_B8E1FB:
	LDX.b current_sprite			;$B8E1FB
	LDY.w #$0000				;$B8E1FD
	LDA.b $2A,x				;$B8E200
	BPL.b CODE_B8E205			;$B8E202
	DEY					;$B8E204
CODE_B8E205:
	CLC					;$B8E205
	ADC.b $11,x				;$B8E206
	STA.b $11,x				;$B8E208
	SEP.b #$20				;$B8E20A
	TYA					;$B8E20C
	ADC.b $13,x				;$B8E20D
	STA.b $13,x				;$B8E20F
	REP.b #$20				;$B8E211
	LDY.w #$0000				;$B8E213
	LDA.b $2E,x				;$B8E216
	BPL.b CODE_B8E21B			;$B8E218
	DEY					;$B8E21A
CODE_B8E21B:
	CLC					;$B8E21B
	ADC.b $15,x				;$B8E21C
	STA.b $15,x				;$B8E21E
	SEP.b #$20				;$B8E220
	TYA					;$B8E222
	ADC.b $17,x				;$B8E223
	STA.b $17,x				;$B8E225
	REP.b #$20				;$B8E227
	RTS					;$B8E229

CODE_B8E22A:
	PHY					;$B8E22A
	PHX					;$B8E22B
	PHA					;$B8E22C
	LDY.b $78				;$B8E22D
	LDA.w $0038,y				;$B8E22F
	ASL					;$B8E232
	ASL					;$B8E233
	TAX					;$B8E234
	PLA					;$B8E235
	CPY.w active_kong_sprite		;$B8E236
	BEQ.b CODE_B8E240			;$B8E239
	CPY.w follower_kong_sprite		;$B8E23B
	BNE.b CODE_B8E246			;$B8E23E
CODE_B8E240:
	AND.l kong_state_flags,x		;$B8E240
	BNE.b CODE_B8E24A			;$B8E244
CODE_B8E246:
	CLC					;$B8E246
	PLX					;$B8E247
	PLY					;$B8E248
	RTL					;$B8E249

CODE_B8E24A:
	SEC					;$B8E24A
	PLX					;$B8E24B
	PLY					;$B8E24C
	RTL					;$B8E24D

CODE_B8E24E:
	PHA					;$B8E24E
	LDX.w active_kong_sprite		;$B8E24F
	LDA.b $38,x				;$B8E252
	ASL					;$B8E254
	ASL					;$B8E255
	TAX					;$B8E256
	PLA					;$B8E257
	AND.l kong_state_flags,x		;$B8E258
	RTS					;$B8E25C

CODE_B8E25D:
	LDA.w $05AF				;$B8E25D
	AND.w #$4000				;$B8E260
	BNE.b CODE_B8E26F			;$B8E263
	LDA.w #$0004				;$B8E265
	JSR.w CODE_B8E24E			;$B8E268
	BEQ.b CODE_B8E26F			;$B8E26B
	CLC					;$B8E26D
	RTL					;$B8E26E

CODE_B8E26F:
	SEC					;$B8E26F
	RTL					;$B8E270

CODE_B8E271:
	LDX current_kong_control_variables	;$B8E271
	LDA.w $04E0				;$B8E273
	AND.w #$0300				;$B8E276
	BEQ.b CODE_B8E2A1			;$B8E279
	LDA.b active_frame_counter		;$B8E27B
	SEC					;$B8E27D
	SBC.b $1E,x				;$B8E27E
	BMI.b CODE_B8E299			;$B8E280
	CMP.w #$0014				;$B8E282
	BPL.b CODE_B8E299			;$B8E285
	LDA.b $1E,x				;$B8E287
	SEC					;$B8E289
	SBC.b $1C,x				;$B8E28A
	CMP.w #$0020				;$B8E28C
	BCC.b CODE_B8E299			;$B8E28F
	LDY.w #$0160				;$B8E291
	LDA.w #$0004				;$B8E294
	BRA.b CODE_B8E2A7			;$B8E297

CODE_B8E299:
	LDY.w #$0158				;$B8E299
	LDA.w #$0003				;$B8E29C
	BRA.b CODE_B8E2A7			;$B8E29F

CODE_B8E2A1:
	LDY.w #$0150				;$B8E2A1
	LDA.w #$0003				;$B8E2A4
CODE_B8E2A7:
	LDX.b current_sprite			;$B8E2A7
	STA.b $38,x				;$B8E2A9
	LDA.b [$6A],y				;$B8E2AB
	LDX current_kong_control_variables	;$B8E2AD
	STA.b $0E,x				;$B8E2AF
	STZ.b $26,x				;$B8E2B1
	RTL					;$B8E2B3

CODE_B8E2B4:
	LDY current_kong_control_variables	;$B8E2B4
	LDA.w $000E,y				;$B8E2B6
	BIT.b $1E,x				;$B8E2B9
	BVC.b CODE_B8E2C1			;$B8E2BB
	EOR.w #$FFFF				;$B8E2BD
	INC					;$B8E2C0
CODE_B8E2C1:
	STA.b $30,x				;$B8E2C1
	RTS					;$B8E2C3

CODE_B8E2C4:
	LDA.w #$9000				;$B8E2C4
	STA.w $04AC				;$B8E2C7
	STZ.w $04AA				;$B8E2CA
	LDA.w #$8000				;$B8E2CD
	STA.w $04A6				;$B8E2D0
	STA.w $04A8				;$B8E2D3
	LDA.w #$2000				;$B8E2D6
	TSB.w $0474				;$B8E2D9
	RTS					;$B8E2DC

CODE_B8E2DD:
	LDA.w #$2000				;$B8E2DD
	TRB.w $0474				;$B8E2E0
	JSL.l CODE_B7D7FB			;$B8E2E3
	RTS					;$B8E2E7

unknown_sprite_012C_main:
	LDA.w $059B				;$B8E2E8
	AND.w #$0180				;$B8E2EB
	BEQ.b CODE_B8E2F7			;$B8E2EE
	JSL.l CODE_BBAB52			;$B8E2F0
	JML [$04F5]				;$B8E2F4

CODE_B8E2F7:
	JSL.l CODE_BB85A3			;$B8E2F7
	JML [$04F5]				;$B8E2FB

unknown_sprite_0004_main:
unknown_sprite_0264_main:
	LDA.w $059B				;$B8E2FE
	AND.w #$0180				;$B8E301
	BEQ.b CODE_B8E317			;$B8E304
	JSR.w CODE_B8E334			;$B8E306
	LDX.b current_sprite			;$B8E309
	CPX.w $05A3				;$B8E30B
	BEQ.b CODE_B8E314			;$B8E30E
	JSL.l CODE_BBAB52			;$B8E310
CODE_B8E314:
	JML [$04F5]				;$B8E314

CODE_B8E317:
	JSL.l CODE_BB85A3			;$B8E317
	JML [$04F5]				;$B8E31B

group_spawn_manager_main:
	LDA.w $059B				;$B8E31E
	AND.w #$0180				;$B8E321
	BNE.b sprite_marker_main		;$B8E324
	JSL.l CODE_BB85AF			;$B8E326
	JML [$04F5]				;$B8E32A

sprite_marker_main:
	JSL.l CODE_BB85B2			;$B8E32D
	JML [$04F5]				;$B8E331

CODE_B8E334:
	LDX.b current_sprite			;$B8E334
	LDA.b $26,x				;$B8E336
	AND.w #$C000				;$B8E338
	BEQ.b CODE_B8E343			;$B8E33B
	CMP.w #$C000				;$B8E33D
	BEQ.b CODE_B8E343			;$B8E340
	RTS					;$B8E342

CODE_B8E343:
	CPX.w $05A3				;$B8E343
	BEQ.b CODE_B8E352			;$B8E346
	LDA.w $1D53				;$B8E348
	BEQ.b CODE_B8E361			;$B8E34B
	LDA.w $04A4				;$B8E34D
	BNE.b CODE_B8E361			;$B8E350
CODE_B8E352:
	LDA.b active_frame_counter		;$B8E352
	AND.w #$0003				;$B8E354
	BNE.b CODE_B8E361			;$B8E357
	LDA.b $26,x				;$B8E359
	ORA.w #$C000				;$B8E35B
	STA.b $26,x				;$B8E35E
	RTS					;$B8E360

CODE_B8E361:
	LDA.b $26,x				;$B8E361
	AND.w #$3FFF				;$B8E363
	STA.b $26,x				;$B8E366
	RTS					;$B8E368

CODE_B8E369:
	LDA.w #$0200				;$B8E369
	STA.w $059B				;$B8E36C
	LDX.w active_kong_sprite		;$B8E36F
	STX.b current_sprite			;$B8E372
	LDA.w $04FB				;$B8E374
	STA current_kong_control_variables	;$B8E377
	STZ.b $38,x				;$B8E379
	STZ.b $2A,x				;$B8E37B
	STZ.b $30,x				;$B8E37D
	STZ.b $2E,x				;$B8E37F
	STZ.b $34,x				;$B8E381
	LDA.b $26,x				;$B8E383
	AND.w #$3FFF				;$B8E385
	STA.b $26,x				;$B8E388
	LDA.w #$00BC				;$B8E38A
	STA.b $3A,x				;$B8E38D
	LDA.w player_1_held			;$B8E38F
	AND.w #$0020				;$B8E392
	BNE.b CODE_B8E3A2			;$B8E395
	LDA.b current_animal_type		;$B8E397
	BNE.b CODE_B8E3A2			;$B8E399
	LDA.w #$0001				;$B8E39B
	JSL.l set_anim_handle_kiddy		;$B8E39E
CODE_B8E3A2:
	RTL					;$B8E3A2

CODE_B8E3A3:
	LDA.w player_1_held			;$B8E3A3
	LDY.w #$0002				;$B8E3A6
	BIT.w #$4040				;$B8E3A9
	BEQ.b CODE_B8E3BC			;$B8E3AC
	LDY.w #$0007				;$B8E3AE
	BIT.w #$4000				;$B8E3B1
	BNE.b CODE_B8E3BC			;$B8E3B4
	LDY.w #$0001				;$B8E3B6
	LDA.w player_1_pressed			;$B8E3B9
CODE_B8E3BC:
	STA.b $1C				;$B8E3BC
	LDX.b current_sprite			;$B8E3BE
	LDA.w player_1_held			;$B8E3C0
	AND.w #$8000				;$B8E3C3
	BEQ.b CODE_B8E3FB			;$B8E3C6
	STY.b $1A				;$B8E3C8
	LDA.b $1C				;$B8E3CA
	BIT.w #$0300				;$B8E3CC
	BEQ.b CODE_B8E3E2			;$B8E3CF
	AND.w #$0200				;$B8E3D1
	CMP.w #$0001				;$B8E3D4
	LDA.b $1A				;$B8E3D7
	BCC.b CODE_B8E3DE			;$B8E3D9
	EOR.w #$FFFF				;$B8E3DB
CODE_B8E3DE:
	ADC.b $12,x				;$B8E3DE
	STA.b $12,x				;$B8E3E0
CODE_B8E3E2:
	LDA.b $1C				;$B8E3E2
	BIT.w #$0C00				;$B8E3E4
	BEQ.b CODE_B8E3FA			;$B8E3E7
	AND.w #$0800				;$B8E3E9
	CMP.w #$0001				;$B8E3EC
	LDA.b $1A				;$B8E3EF
	BCC.b CODE_B8E3F6			;$B8E3F1
	EOR.w #$FFFF				;$B8E3F3
CODE_B8E3F6:
	ADC.b $16,x				;$B8E3F6
	STA.b $16,x				;$B8E3F8
CODE_B8E3FA:
	RTL					;$B8E3FA

CODE_B8E3FB:
	TYA					;$B8E3FB
	XBA					;$B8E3FC
	STA.b $1A				;$B8E3FD
	LDA.b $1C				;$B8E3FF
	AND.w #$0300				;$B8E401
	BEQ.b CODE_B8E414			;$B8E404
	AND.w #$0200				;$B8E406
	CMP.w #$0001				;$B8E409
	LDA.b $1A				;$B8E40C
	BCC.b CODE_B8E414			;$B8E40E
	EOR.w #$FFFF				;$B8E410
	INC					;$B8E413
CODE_B8E414:
	STA.b $2A,x				;$B8E414
	LDA.b $1C				;$B8E416
	AND.w #$0C00				;$B8E418
	BEQ.b CODE_B8E42B			;$B8E41B
	AND.w #$0800				;$B8E41D
	CMP.w #$0001				;$B8E420
	LDA.b $1A				;$B8E423
	BCC.b CODE_B8E42B			;$B8E425
	EOR.w #$FFFF				;$B8E427
	INC					;$B8E42A
CODE_B8E42B:
	STA.b $2E,x				;$B8E42B
	JSL.l CODE_B9E006			;$B8E42D
	RTL					;$B8E431

ellie_main:
	JMP.w (DATA_B8E435,x)			;$B8E432

DATA_B8E435:
	dw CODE_B8E441
	dw CODE_B8E468
	dw CODE_B8E472
	dw CODE_B8E477
	dw CODE_B8E47E
	dw CODE_B8E4B5

CODE_B8E441:
	JSR.w CODE_B8E551			;$B8E441
	BCS.b CODE_B8E45B			;$B8E444
	JSR.w CODE_B8E7DF			;$B8E446
	BCS.b CODE_B8E45B			;$B8E449
	JSR.w CODE_B8E522			;$B8E44B
	JSR.w CODE_B8E4D3			;$B8E44E
	BCS.b CODE_B8E45E			;$B8E451
	JSL.l process_sprite_animation		;$B8E453
	JSL.l CODE_BBAB52			;$B8E457
CODE_B8E45B:
	JML [$04F5]				;$B8E45B

CODE_B8E45E:
	LDA.w #$0005				;$B8E45E
	STA.b $38,x				;$B8E461
	STZ.b $30,x				;$B8E463
	JML [$04F5]				;$B8E465

CODE_B8E468:
	JSR.w CODE_B8E78D			;$B8E468
	JSL.l process_sprite_animation		;$B8E46B
	JML [$04F5]				;$B8E46F

CODE_B8E472:
	TYX					;$B8E472
	STZ.b $38,x				;$B8E473
	BRA.b CODE_B8E441			;$B8E475

CODE_B8E477:
	JSL.l process_sprite_animation		;$B8E477
	JML [$04F5]				;$B8E47B

CODE_B8E47E:
	JSR.w CODE_B8E551			;$B8E47E
	BCS.b CODE_B8E49D			;$B8E481
	JSR.w CODE_B8E7DF			;$B8E483
	BCS.b CODE_B8E49D			;$B8E486
	JSL.l process_sprite_animation		;$B8E488
	LDY.w #$000C				;$B8E48C
	LDA.b [$6A],y				;$B8E48F
	JSR.w CODE_B8E4FF			;$B8E491
	JSR.w CODE_B8E4D3			;$B8E494
	BCS.b CODE_B8E4A0			;$B8E497
	JSL.l CODE_BBAB52			;$B8E499
CODE_B8E49D:
	JML [$04F5]				;$B8E49D

CODE_B8E4A0:
	LDX.b current_sprite			;$B8E4A0
	LDA.w #$C0FF				;$B8E4A2
	CMP.b $0C,x				;$B8E4A5
	BCC.b CODE_B8E4AB			;$B8E4A7
	STA.b $0C,x				;$B8E4A9
CODE_B8E4AB:
	LDA.w #$0005				;$B8E4AB
	STA.b $38,x				;$B8E4AE
	STZ.b $30,x				;$B8E4B0
	JML [$04F5]				;$B8E4B2

CODE_B8E4B5:
	JSR.w CODE_B8E551			;$B8E4B5
	BCS.b CODE_B8E4D0			;$B8E4B8
	JSR.w CODE_B8E7DF			;$B8E4BA
	BCS.b CODE_B8E4D0			;$B8E4BD
	JSL.l process_sprite_animation		;$B8E4BF
	CLC					;$B8E4C3
	JSL.l CODE_B8E5B3			;$B8E4C4
	JSL.l process_current_movement		;$B8E4C8
	JSL.l CODE_BBAB52			;$B8E4CC
CODE_B8E4D0:
	JML [$04F5]				;$B8E4D0

CODE_B8E4D3:
	JSR.w check_sprite_underwater		;$B8E4D3
	CLC					;$B8E4D6
	BEQ.b CODE_B8E4FE			;$B8E4D7
	LDX.b current_sprite			;$B8E4D9
	STZ.b $2E,x				;$B8E4DB
	LDA.w #$004B				;$B8E4DD
	STA.b $5A,x				;$B8E4E0
	LDA.w $050F				;$B8E4E2
	CLC					;$B8E4E5
	ADC.w #$0014				;$B8E4E6
	CMP.b $16,x				;$B8E4E9
	BCC.b CODE_B8E4EF			;$B8E4EB
	STA.b $16,x				;$B8E4ED
CODE_B8E4EF:
	LDX.w #$0000				;$B8E4EF
	LDY.w $187F				;$B8E4F2
	JSL.l CODE_B8E587			;$B8E4F5
	JSL.l set_sprite_animation		;$B8E4F9
	SEC					;$B8E4FD
CODE_B8E4FE:
	RTS					;$B8E4FE

CODE_B8E4FF:
	PHA					;$B8E4FF
	JSR.w CODE_B8E522			;$B8E500
	LDA.w #$001D				;$B8E503
	JSL.l process_alternate_movement	;$B8E506
	PLY					;$B8E50A
	LDA.b $30,x				;$B8E50B
	BNE.b CODE_B8E521			;$B8E50D
	LDA.b $1E,x				;$B8E50F
	EOR.w #$4000				;$B8E511
	STA.b $1E,x				;$B8E514
	TYA					;$B8E516
	BIT.b $1E,x				;$B8E517
	BVC.b CODE_B8E51F			;$B8E519
	EOR.w #$FFFF				;$B8E51B
	INC					;$B8E51E
CODE_B8E51F:
	STA.b $30,x				;$B8E51F
CODE_B8E521:
	RTS					;$B8E521

CODE_B8E522:
	LDX.b current_sprite			;$B8E522
	LDA.b $16,x				;$B8E524
	PHA					;$B8E526
	JSL.l process_current_movement		;$B8E527
	PLA					;$B8E52B
	BMI.b CODE_B8E54F			;$B8E52C
	CMP.w $050F				;$B8E52E
	LDA.b $16,x				;$B8E531
	BMI.b CODE_B8E54F			;$B8E533
	ROR.b $3E				;$B8E535
	CMP.w $050F				;$B8E537
	ROR					;$B8E53A
	EOR.b $3E				;$B8E53B
	BPL.b CODE_B8E54F			;$B8E53D
	LDY.w #$0028				;$B8E53F
	JSL.l CODE_BB8585			;$B8E542
	LDA.w #$0766				;$B8E546
	JSL.l queue_sound_effect		;$B8E549
	SEC					;$B8E54D
	RTS					;$B8E54E

CODE_B8E54F:
	CLC					;$B8E54F
	RTS					;$B8E550

CODE_B8E551:
	LDX.b current_sprite			;$B8E551
	LDA.b $3C,x				;$B8E553
	CMP.w #$0003				;$B8E555
	BEQ.b CODE_B8E55C			;$B8E558
	CLC					;$B8E55A
	RTS					;$B8E55B

CODE_B8E55C:
	JSL.l CODE_BB8597			;$B8E55C
	LDX.b current_sprite			;$B8E560
	INC.b $00,x				;$B8E562
	LDA.b $16,x				;$B8E564
	SEC					;$B8E566
	SBC.w #$0018				;$B8E567
	STA.b $16,x				;$B8E56A
	LDY.w #$0048				;$B8E56C
	JSL.l CODE_BB8585			;$B8E56F
	LDY.w #$004A				;$B8E573
	JSL.l CODE_BB8585			;$B8E576
	LDY.w #$004C				;$B8E57A
	JSL.l CODE_BB8585			;$B8E57D
	LDX.b current_sprite			;$B8E581
	STZ.b $00,x				;$B8E583
	SEC					;$B8E585
	RTS					;$B8E586

CODE_B8E587:
	LDA.b $6C				;$B8E587
	STA.b $44				;$B8E589
	LDA.l DATA_FF1C18,x			;$B8E58B
	STA.b $42				;$B8E58F
	LDX.b current_sprite			;$B8E591
	STZ.b $62,x				;$B8E593
	STA.b $64,x				;$B8E595
	STY.b $66,x				;$B8E597
	LDA.b $3A,x				;$B8E599
	AND.w #$7FFF				;$B8E59B
	STA.b $3A,x				;$B8E59E
	LDY.w #$000E				;$B8E5A0
	LDA.b [$42],y				;$B8E5A3
	RTL					;$B8E5A5

CODE_B8E5A6:
	LDA.b $62,x				;$B8E5A6
	CMP.w #$0003				;$B8E5A8
	BCC.b CODE_B8E5B2			;$B8E5AB
	LDA.w #$0005				;$B8E5AD
	STA.b $62,x				;$B8E5B0
CODE_B8E5B2:
	RTL					;$B8E5B2

CODE_B8E5B3:
	LDA.w #$0000				;$B8E5B3
	BCC.b CODE_B8E5BB			;$B8E5B6
	LDA.w #$0010				;$B8E5B8
CODE_B8E5BB:
	STA.b $3A				;$B8E5BB
	LDY.b current_sprite			;$B8E5BD
	LDA.w $0062,y				;$B8E5BF
	ASL					;$B8E5C2
	TAX					;$B8E5C3
	LDA.w $0064,y				;$B8E5C4
	CLC					;$B8E5C7
	ADC.b $3A				;$B8E5C8
	PHB					;$B8E5CA
	%pea_shift_dbr(DATA_FF1C18)		;$B8E5CB
	PLB					;$B8E5CE
	PLB					;$B8E5CF
	JSR.w (DATA_B8E5D5,x)			;$B8E5D0
	PLB					;$B8E5D3
	RTL					;$B8E5D4

DATA_B8E5D5:
	dw CODE_B8E5E1
	dw CODE_B8E618
	dw CODE_B8E642
	dw CODE_B8E670
	dw CODE_B8E6A2
	dw CODE_B8E6D9

CODE_B8E5E1:
	TYX					;$B8E5E1
	TAY					;$B8E5E2
	LDA.l $00050F				;$B8E5E3
	CLC					;$B8E5E7
	ADC.w $0006,y				;$B8E5E8
	SEC					;$B8E5EB
	SBC.b $66,x				;$B8E5EC
	BCC.b CODE_B8E60E			;$B8E5EE
	CMP.w #$0100				;$B8E5F0
	BCC.b CODE_B8E5F8			;$B8E5F3
	LDA.w #$00FF				;$B8E5F5
CODE_B8E5F8:
	SBC.w #$003F				;$B8E5F8
	BCS.b CODE_B8E600			;$B8E5FB
	LDA.w #$0000				;$B8E5FD
CODE_B8E600:
	ASL					;$B8E600
	ADC.w $0002,y				;$B8E601
	STA.b $68,x				;$B8E604
	LDA.w $0000,y				;$B8E606
	STA.b $2E,x				;$B8E609
	INC.b $62,x				;$B8E60B
	RTS					;$B8E60D

CODE_B8E60E:
	STZ.b $2E,x				;$B8E60E
	LDA.w #$0002				;$B8E610
	STA.b $62,x				;$B8E613
	STZ.b $66,x				;$B8E615
	RTS					;$B8E617

CODE_B8E618:
	TYX					;$B8E618
	TAY					;$B8E619
	LDA.b $28,x				;$B8E61A
	AND.w #$0101				;$B8E61C
	CMP.w #$0101				;$B8E61F
	BEQ.b CODE_B8E63D			;$B8E622
	LDA.b $2E,x				;$B8E624
	CLC					;$B8E626
	ADC.b $68,x				;$B8E627
	BPL.b CODE_B8E63A			;$B8E629
	LDA.l $00050F				;$B8E62B
	SEC					;$B8E62F
	ADC.w $0006,y				;$B8E630
	CMP.b $16,x				;$B8E633
	BCC.b CODE_B8E63D			;$B8E635
	LDA.w #$0100				;$B8E637
CODE_B8E63A:
	STA.b $2E,x				;$B8E63A
	RTS					;$B8E63C

CODE_B8E63D:
	INC.b $62,x				;$B8E63D
	STZ.b $2E,x				;$B8E63F
	RTS					;$B8E641

CODE_B8E642:
	TYX					;$B8E642
	TAY					;$B8E643
	LDA.l $00050F				;$B8E644
	CLC					;$B8E648
	ADC.w $0006,y				;$B8E649
	CMP.b $16,x				;$B8E64C
	BCS.b CODE_B8E661			;$B8E64E
	LDA.b $2E,x				;$B8E650
	SEC					;$B8E652
	SBC.w #$0020				;$B8E653
	CMP.w $0004,y				;$B8E656
	BCS.b CODE_B8E65E			;$B8E659
	LDA.w $0004,y				;$B8E65B
CODE_B8E65E:
	STA.b $2E,x				;$B8E65E
	RTS					;$B8E660

CODE_B8E661:
	LDA.b $2E,x				;$B8E661
	CLC					;$B8E663
	ADC.w #$0040				;$B8E664
	STA.b $2E,x				;$B8E667
	BMI.b CODE_B8E66F			;$B8E669
	INC.b $62,x				;$B8E66B
	STZ.b $66,x				;$B8E66D
CODE_B8E66F:
	RTS					;$B8E66F

CODE_B8E670:
	TYX					;$B8E670
	TAY					;$B8E671
	DEC.b $66,x				;$B8E672
	BPL.b CODE_B8E6A1			;$B8E674
	LDA.w $000A,y				;$B8E676
	STA.b $2E,x				;$B8E679
	LDA.w $0009,y				;$B8E67B
	AND.w #$00FF				;$B8E67E
	CLC					;$B8E681
	ADC.l $00050F				;$B8E682
	CLC					;$B8E686
	ADC.w $0006,y				;$B8E687
	CMP.b $16,x				;$B8E68A
	BCS.b CODE_B8E6A1			;$B8E68C
	INC.b $62,x				;$B8E68E
	STZ.b $2E,x				;$B8E690
	JSL.l CODE_808018			;$B8E692
	AND.w #$000F				;$B8E696
	ADC.w $000D,y				;$B8E699
	AND.w #$00FF				;$B8E69C
	STA.b $66,x				;$B8E69F
CODE_B8E6A1:
	RTS					;$B8E6A1

CODE_B8E6A2:
	TYX					;$B8E6A2
	TAY					;$B8E6A3
	DEC.b $66,x				;$B8E6A4
	BPL.b CODE_B8E6D8			;$B8E6A6
	TDC					;$B8E6A8
	SEC					;$B8E6A9
	SBC.w $000A,y				;$B8E6AA
	STA.b $2E,x				;$B8E6AD
	LDA.w $0008,y				;$B8E6AF
	AND.w #$00FF				;$B8E6B2
	EOR.w #$FFFF				;$B8E6B5
	SEC					;$B8E6B8
	ADC.l $00050F				;$B8E6B9
	CLC					;$B8E6BD
	ADC.w $0006,y				;$B8E6BE
	CMP.b $16,x				;$B8E6C1
	BCC.b CODE_B8E6D8			;$B8E6C3
	DEC.b $62,x				;$B8E6C5
	STZ.b $2E,x				;$B8E6C7
	JSL.l CODE_808018			;$B8E6C9
	AND.w #$003F				;$B8E6CD
	ADC.w $000C,y				;$B8E6D0
	AND.w #$00FF				;$B8E6D3
	STA.b $66,x				;$B8E6D6
CODE_B8E6D8:
	RTS					;$B8E6D8

CODE_B8E6D9:
	TYX					;$B8E6D9
	TAY					;$B8E6DA
	LDA.w $000A,y				;$B8E6DB
	ASL					;$B8E6DE
	ASL					;$B8E6DF
	STA.b $2E,x				;$B8E6E0
	LDA.w $0009,y				;$B8E6E2
	AND.w #$00FF				;$B8E6E5
	SEC					;$B8E6E8
	ADC.l $00050F				;$B8E6E9
	SEC					;$B8E6ED
	ADC.w $0006,y				;$B8E6EE
	CMP.b $16,x				;$B8E6F1
	BCS.b CODE_B8E6FE			;$B8E6F3
	DEC.b $62,x				;$B8E6F5
	STZ.b $2E,x				;$B8E6F7
	LDA.w #$0006				;$B8E6F9
	STA.b $66,x				;$B8E6FC
CODE_B8E6FE:
	RTS					;$B8E6FE

ellie_horizontal_water_shot_main:
ellie_diagonal_water_shot_main:
	JSL.l populate_sprite_clipping		;$B8E6FF
	LDA.w $0777				;$B8E703
	AND.w #$0100				;$B8E706
	STA.w $1860				;$B8E709
	LDA.w #$0040				;$B8E70C
	LDY.w #$0010				;$B8E70F
	JSL.l check_sprite_collision		;$B8E712
	BCS.b CODE_B8E735			;$B8E716
	LDA.b $28,x				;$B8E718
	AND.w #$0303				;$B8E71A
	BNE.b CODE_B8E735			;$B8E71D
	LDA.b $16,x				;$B8E71F
	CMP.w $050F				;$B8E721
	BCS.b CODE_B8E735			;$B8E724
	JSL.l process_current_movement		;$B8E726
	JSL.l process_sprite_animation		;$B8E72A
	JSL.l CODE_BBAB46			;$B8E72E
	JML [$04F5]				;$B8E732

CODE_B8E735:
	JSL.l delete_sprite_handle_deallocation	;$B8E735
	JML [$04F5]				;$B8E739

enguarde_main:
	JMP.w (DATA_B8E73F,x)			;$B8E73C

DATA_B8E73F:
	dw CODE_B8E749
	dw CODE_B8E75E
	dw CODE_B8E768
	dw CODE_B8E76D
	dw CODE_B8E774

CODE_B8E749:
	JSR.w CODE_B8E551			;$B8E749
	BCS.b CODE_B8E75B			;$B8E74C
	JSR.w CODE_B8E7DF			;$B8E74E
	BCS.b CODE_B8E75B			;$B8E751
	JSL.l process_sprite_animation		;$B8E753
	JSL.l CODE_BBAB52			;$B8E757
CODE_B8E75B:
	JML [$04F5]				;$B8E75B

CODE_B8E75E:
	JSR.w CODE_B8E78D			;$B8E75E
	JSL.l process_sprite_animation		;$B8E761
	JML [$04F5]				;$B8E765

CODE_B8E768:
	TYX					;$B8E768
	STZ.b $38,x				;$B8E769
	BRA.b CODE_B8E749			;$B8E76B

CODE_B8E76D:
	JSL.l process_sprite_animation		;$B8E76D
	JML [$04F5]				;$B8E771

CODE_B8E774:
	JSR.w CODE_B8E551			;$B8E774
	BCS.b CODE_B8E78A			;$B8E777
	JSR.w CODE_B8E7DF			;$B8E779
	BCS.b CODE_B8E78A			;$B8E77C
	JSL.l process_sprite_animation		;$B8E77E
	LDY.w #$000C				;$B8E782
	LDA.b [$6A],y				;$B8E785
	JSR.w CODE_B8E4FF			;$B8E787
CODE_B8E78A:
	JML [$04F5]				;$B8E78A

CODE_B8E78D:
	LDX.b current_sprite			;$B8E78D
CODE_B8E78F:
	LDY.w active_kong_sprite		;$B8E78F
	LDA.w $001E,y				;$B8E792
	EOR.b $1E,x				;$B8E795
	AND.w #$C000				;$B8E797
	EOR.b $1E,x				;$B8E79A
	STA.b $1E,x				;$B8E79C
	LDA.w $0016,y				;$B8E79E
	CLC					;$B8E7A1
	ADC.w $188F				;$B8E7A2
	STA.b $16,x				;$B8E7A5
	BIT.b $1E,x				;$B8E7A7
	BVS.b CODE_B8E7B5			;$B8E7A9
	LDA.w $0012,y				;$B8E7AB
	CLC					;$B8E7AE
	ADC.w $188D				;$B8E7AF
	STA.b $12,x				;$B8E7B2
	RTS					;$B8E7B4

CODE_B8E7B5:
	LDA.w $0012,y				;$B8E7B5
	SEC					;$B8E7B8
	SBC.w $188D				;$B8E7B9
	STA.b $12,x				;$B8E7BC
	RTS					;$B8E7BE

CODE_B8E7BF:
	LDA.w $05AF				;$B8E7BF
	AND.w #$4000				;$B8E7C2
	BEQ.b CODE_B8E7DE			;$B8E7C5
	LDX.w follower_kong_sprite		;$B8E7C7
	LDY.b current_mount			;$B8E7CA
	LDA.w $0012,y				;$B8E7CC
	CLC					;$B8E7CF
	ADC.w $1887				;$B8E7D0
	STA.b $12,x				;$B8E7D3
	LDA.w $0016,y				;$B8E7D5
	CLC					;$B8E7D8
	ADC.w $188B				;$B8E7D9
	STA.b $16,x				;$B8E7DC
CODE_B8E7DE:
	RTS					;$B8E7DE

CODE_B8E7DF:
	LDA.w $1899				;$B8E7DF
	BNE.b CODE_B8E82A			;$B8E7E2
	LDX.b current_sprite			;$B8E7E4
	LDA.b current_animal_type		;$B8E7E6
	ORA.w current_held_sprite		;$B8E7E8
	BNE.b CODE_B8E82D			;$B8E7EB
	LDA.b $16,x				;$B8E7ED
	SEC					;$B8E7EF
	SBC.w $1973				;$B8E7F0
	CMP.w #$0110				;$B8E7F3
	BCS.b CODE_B8E82D			;$B8E7F6
	LDY.w #$0006				;$B8E7F8
	LDA.b [$6A],y				;$B8E7FB
	CLC					;$B8E7FD
	ADC.w #$0007				;$B8E7FE
	JSL.l CODE_BCE43C			;$B8E801
	LDA.w #$0008				;$B8E805
	JSL.l CODE_BCE5AE			;$B8E808
	BCC.b CODE_B8E82D			;$B8E80C
	JSR.w get_kong_state_flags		;$B8E80E
	AND.w #$0006				;$B8E811
	BNE.b CODE_B8E82D			;$B8E814
	LDY.w #$0006				;$B8E816
	LDA.b [$6A],y				;$B8E819
	ASL					;$B8E81B
	TAX					;$B8E81C
	LDY.b $78				;$B8E81D
	JMP.w (DATA_B8E822,x)			;$B8E81F

DATA_B8E822:
	dw CODE_B8E82F
	dw CODE_B8E856
	dw CODE_B8E870
	dw CODE_B8E837

CODE_B8E82A:
	DEC.w $1899				;$B8E82A
CODE_B8E82D:
	CLC					;$B8E82D
	RTS					;$B8E82E

CODE_B8E82F:
	LDA.w $0517				;$B8E82F
	CMP.w #$0004				;$B8E832
	BCS.b CODE_B8E82D			;$B8E835
CODE_B8E837:
	LDX.b current_sprite			;$B8E837
	LDA.w $002E,y				;$B8E839
	BMI.b CODE_B8E82D			;$B8E83C
	LDA.b $16,x				;$B8E83E
	CMP.w $0016,y				;$B8E840
	BCC.b CODE_B8E82D			;$B8E843
	LDA.w $0028,y				;$B8E845
	AND.w #$0100				;$B8E848
	BNE.b CODE_B8E82D			;$B8E84B
	LDA.w #$001E				;$B8E84D
	JSL.l CODE_B882B6			;$B8E850
	SEC					;$B8E854
	RTS					;$B8E855

CODE_B8E856:
	LDX.b current_sprite			;$B8E856
	LDA.b $16,x				;$B8E858
	CMP.w $0016,y				;$B8E85A
	BCC.b CODE_B8E82D			;$B8E85D
	LDA.w $0028,y				;$B8E85F
	AND.w #$0100				;$B8E862
	BNE.b CODE_B8E82D			;$B8E865
	LDA.w #$001E				;$B8E867
	JSL.l CODE_B882B6			;$B8E86A
	SEC					;$B8E86E
	RTS					;$B8E86F

CODE_B8E870:
	LDA.w $0028,y				;$B8E870
	AND.w #$0101				;$B8E873
	BNE.b CODE_B8E82D			;$B8E876
	LDA.w #$001E				;$B8E878
	JSL.l CODE_B882B6			;$B8E87B
	SEC					;$B8E87F
	RTS					;$B8E880

squawks_main:
	JMP.w (DATA_B8E884,x)			;$B8E881

DATA_B8E884:
	dw CODE_B8E890
	dw CODE_B8E8A5
	dw CODE_B8E8B2
	dw CODE_B8E8B7
	dw CODE_B8E8BE
	dw CODE_B8E8D7

CODE_B8E890:
	JSR.w CODE_B8E551			;$B8E890
	BCS.b CODE_B8E8A2			;$B8E893
	JSR.w CODE_B8E7DF			;$B8E895
	BCS.b CODE_B8E8A2			;$B8E898
	JSL.l process_sprite_animation		;$B8E89A
	JSL.l CODE_BBAB52			;$B8E89E
CODE_B8E8A2:
	JML [$04F5]				;$B8E8A2

CODE_B8E8A5:
	JSR.w CODE_B8E78D			;$B8E8A5
	JSR.w CODE_B8E7BF			;$B8E8A8
	JSL.l process_sprite_animation		;$B8E8AB
	JML [$04F5]				;$B8E8AF

CODE_B8E8B2:
	TYX					;$B8E8B2
	STZ.b $38,x				;$B8E8B3
	BRA.b CODE_B8E890			;$B8E8B5

CODE_B8E8B7:
	JSL.l process_sprite_animation		;$B8E8B7
	JML [$04F5]				;$B8E8BB

CODE_B8E8BE:
	JSR.w CODE_B8E551			;$B8E8BE
	BCS.b CODE_B8E8D4			;$B8E8C1
	JSR.w CODE_B8E7DF			;$B8E8C3
	BCS.b CODE_B8E8D4			;$B8E8C6
	JSL.l process_sprite_animation		;$B8E8C8
	LDY.w #$000C				;$B8E8CC
	LDA.b [$6A],y				;$B8E8CF
	JSR.w CODE_B8E4FF			;$B8E8D1
CODE_B8E8D4:
	JML [$04F5]				;$B8E8D4

CODE_B8E8D7:
	JSL.l process_current_movement		;$B8E8D7
	JSL.l process_sprite_animation		;$B8E8DB
	JSL.l CODE_BBAB46			;$B8E8DF
	JML [$04F5]				;$B8E8E3

squawks_egg_main:
	JMP.w (DATA_B8E8E9,x)			;$B8E8E6

DATA_B8E8E9:
	dw CODE_B8E8ED				;00 (Travel)
	dw CODE_B8E956				;01 (Defeated)

CODE_B8E8ED:
	JSL.l populate_sprite_clipping		;$B8E8ED
	LDA.w #$0040				;$B8E8F1
	LDY.w #$0010				;$B8E8F4
	JSL.l check_sprite_collision		;$B8E8F7
	BCS.b CODE_B8E90C			;$B8E8FB
	LDA.b $28,x				;$B8E8FD
	AND.w #$0303				;$B8E8FF
	BEQ.b CODE_B8E943			;$B8E902
	AND.w #$0202				;$B8E904
	CMP.w #$0001				;$B8E907
	BRA.b CODE_B8E910			;$B8E90A

CODE_B8E90C:
	LDA.b $D2				;$B8E90C
	CMP.b $DA				;$B8E90E
CODE_B8E910:
	LDY.w #$FC00				;$B8E910
	LDA.b $2A,x				;$B8E913
	BCC.b CODE_B8E91E			;$B8E915
	LDY.w #$FE00				;$B8E917
	EOR.w #$FFFF				;$B8E91A
	INC					;$B8E91D
CODE_B8E91E:
	CMP.w #$8000				;$B8E91E
	ROR					;$B8E921
	STA.b $2A,x				;$B8E922
	STY.b $2E,x				;$B8E924
	STZ.b $30,x				;$B8E926
	INC.b $38,x				;$B8E928
	LDA.l DATA_FF1BC0+$08			;$B8E92A
	STA.b $06,x				;$B8E92E
	STA.b $6A				;$B8E930
	LDA.w #$0015				;$B8E932
	STA.b $5A,x				;$B8E935
	LDA.w #$00F4				;$B8E937
	STA.b $0E,x				;$B8E93A
	LDA.b $1E,x				;$B8E93C
	ORA.w #$3000				;$B8E93E
	STA.b $1E,x				;$B8E941
CODE_B8E943:
	LDX.b current_sprite			;$B8E943
	LDA.b $2A,x				;$B8E945
	PHA					;$B8E947
	JSL.l process_current_movement		;$B8E948
	PLA					;$B8E94C
	STA.b $2A,x				;$B8E94D
	JSL.l process_sprite_animation		;$B8E94F
	JMP.w CODE_B8EDC1			;$B8E953

CODE_B8E956:
	JSL.l process_current_movement		;$B8E956
	JSL.l process_sprite_animation		;$B8E95A
	JMP.w CODE_B8EDC1			;$B8E95E

squitter_main:
	JMP.w (DATA_B8E964,x)			;$B8E961

DATA_B8E964:
	dw CODE_B8E96E
	dw CODE_B8E987
	dw CODE_B8E991
	dw CODE_B8E996
	dw CODE_B8E99D

CODE_B8E96E:
	JSR.w CODE_B8E551			;$B8E96E
	BCS.b CODE_B8E984			;$B8E971
	JSR.w CODE_B8E7DF			;$B8E973
	BCS.b CODE_B8E984			;$B8E976
	JSL.l process_current_movement		;$B8E978
	JSL.l process_sprite_animation		;$B8E97C
	JSL.l CODE_BBAB52			;$B8E980
CODE_B8E984:
	JML [$04F5]				;$B8E984

CODE_B8E987:
	JSR.w CODE_B8E78D			;$B8E987
	JSL.l process_sprite_animation		;$B8E98A
	JML [$04F5]				;$B8E98E

CODE_B8E991:
	TYX					;$B8E991
	STZ.b $38,x				;$B8E992
	BRA.b CODE_B8E96E			;$B8E994

CODE_B8E996:
	JSL.l process_sprite_animation		;$B8E996
	JML [$04F5]				;$B8E99A

CODE_B8E99D:
	LDA level_number			;$B8E99D
	CMP.w #!level_creepy_caverns		;$B8E99F
	BNE.b CODE_B8E9B9			;$B8E9A2
	LDA.w $0016,y				;$B8E9A4
	SBC.w #$0400				;$B8E9A7
	CMP.w #$00C0				;$B8E9AA
	BCS.b CODE_B8E9D7			;$B8E9AD
	LDA.w $0012,y				;$B8E9AF
	CMP.w #$0688				;$B8E9B2
	BCS.b CODE_B8E9D7			;$B8E9B5
	BRA.b CODE_B8E9D1			;$B8E9B7

CODE_B8E9B9:
	CMP.w #$0045				;$B8E9B9
	BNE.b CODE_B8E9D7			;$B8E9BC
	LDA.w $0016,y				;$B8E9BE
	SBC.w #$0240				;$B8E9C1
	CMP.w #$00E0				;$B8E9C4
	BCS.b CODE_B8E9D7			;$B8E9C7
	LDA.w $0012,y				;$B8E9C9
	CMP.w #$1F68				;$B8E9CC
	BCC.b CODE_B8E9D7			;$B8E9CF
CODE_B8E9D1:
	LDA.w #$0003				;$B8E9D1
	STA.w $003C,y				;$B8E9D4
CODE_B8E9D7:
	JSR.w CODE_B8E551			;$B8E9D7
	BCS.b CODE_B8E9F1			;$B8E9DA
	JSR.w CODE_B8E7DF			;$B8E9DC
	BCS.b CODE_B8E9F1			;$B8E9DF
	JSL.l process_sprite_animation		;$B8E9E1
	LDY.w #$000C				;$B8E9E5
	LDA.b [$6A],y				;$B8E9E8
	JSR.w CODE_B8E4FF			;$B8E9EA
	JSL.l CODE_BBAB52			;$B8E9ED
CODE_B8E9F1:
	JML [$04F5]				;$B8E9F1

web_shot_main:
	JSL.l populate_sprite_clipping		;$B8E9F4
	LDA.w #$0040				;$B8E9F8
	LDY.w #$1010				;$B8E9FB
	JSL.l check_sprite_collision		;$B8E9FE
	BCS.b CODE_B8EA19			;$B8EA02
	JSR.w CODE_B8EA23			;$B8EA04
	JSR.w CODE_B8EA41			;$B8EA07
	BCS.b CODE_B8EA19			;$B8EA0A
	JSL.l process_sprite_animation		;$B8EA0C
	JSL.l CODE_BBAB46			;$B8EA10
	BCS.b CODE_B8EA1D			;$B8EA14
	JML [$04F5]				;$B8EA16

CODE_B8EA19:
	JSL.l CODE_BB8597			;$B8EA19
CODE_B8EA1D:
	DEC.w $1897				;$B8EA1D
	JML [$04F5]				;$B8EA20

CODE_B8EA23:
	LDX.b current_sprite			;$B8EA23
	LDA.b $2E,x				;$B8EA25
	CLC					;$B8EA27
	ADC.b $62,x				;$B8EA28
	BPL.b CODE_B8EA36			;$B8EA2A
	CMP.w #$FA00				;$B8EA2C
	BCS.b CODE_B8EA3E			;$B8EA2F
	LDA.w #$FA00				;$B8EA31
	BRA.b CODE_B8EA3E			;$B8EA34

CODE_B8EA36:
	CMP.w #$0600				;$B8EA36
	BCC.b CODE_B8EA3E			;$B8EA39
	LDA.w #$0600				;$B8EA3B
CODE_B8EA3E:
	STA.b $2E,x				;$B8EA3E
	RTS					;$B8EA40

CODE_B8EA41:
	LDA.w $050F				;$B8EA41
	PHA					;$B8EA44
	STZ.w $050F				;$B8EA45
	JSL.l CODE_B9E006			;$B8EA48
	PLA					;$B8EA4C
	STA.w $050F				;$B8EA4D
	LDA.b $28,x				;$B8EA50
	BIT.w #$0202				;$B8EA52
	BNE.b CODE_B8EA59			;$B8EA55
	CLC					;$B8EA57
	RTS					;$B8EA58

CODE_B8EA59:
	SEC					;$B8EA59
	RTS					;$B8EA5A

web_platform_main:
	JMP.w (DATA_B8EA5E,x)			;$B8EA5B

DATA_B8EA5E:
	dw CODE_B8EA66
	dw CODE_B8EA91
	dw CODE_B8EAB3
	dw CODE_B8EADA

CODE_B8EA66:
	JSR.w CODE_B8EA23			;$B8EA66
	JSR.w CODE_B8EA41			;$B8EA69
	BCS.b CODE_B8EA84			;$B8EA6C
	JSL.l CODE_BBAB46			;$B8EA6E
	BCS.b CODE_B8EA7B			;$B8EA72
	JSL.l process_sprite_animation		;$B8EA74
	JML [$04F5]				;$B8EA78

CODE_B8EA7B:
	LDA.w #$0006				;$B8EA7B
	TRB.w $1957				;$B8EA7E
	JML [$04F5]				;$B8EA81

CODE_B8EA84:
	LDA.w #$0002				;$B8EA84
	TRB.w $1957				;$B8EA87
	JSL.l process_sprite_animation		;$B8EA8A
	JML [$04F5]				;$B8EA8E

CODE_B8EA91:
	JSL.l process_sprite_animation		;$B8EA91
	LDX.b current_sprite			;$B8EA95
	LDA.b $12,x				;$B8EA97
	STA.b $54,x				;$B8EA99
	STA.b $2C,x				;$B8EA9B
	LDA.b $16,x				;$B8EA9D
	STA.b $56,x				;$B8EA9F
	STA.b $32,x				;$B8EAA1
	STZ.b $58,x				;$B8EAA3
	LDA.w #$00C4				;$B8EAA5
	STA.b $0E,x				;$B8EAA8
	LDA.b active_frame_counter		;$B8EAAA
	STA.b $60,x				;$B8EAAC
	INC.b $38,x				;$B8EAAE
	JML [$04F5]				;$B8EAB0

CODE_B8EAB3:
	TYX					;$B8EAB3
	LDA.b $5E,x				;$B8EAB4
	BNE.b CODE_B8EAC6			;$B8EAB6
	LDA.b active_frame_counter		;$B8EAB8
	SEC					;$B8EABA
	SBC.w $0060,y				;$B8EABB
	CMP.w #$015E				;$B8EABE
	BCC.b CODE_B8EAC6			;$B8EAC1
	TYX					;$B8EAC3
	INC.b $5E,x				;$B8EAC4
CODE_B8EAC6:
	LDA.b $5E,x				;$B8EAC6
	DEC					;$B8EAC8
	BNE.b CODE_B8EADA			;$B8EAC9
	INC.b $5E,x				;$B8EACB
	LDA.w #$0004				;$B8EACD
	TRB.w $1957				;$B8EAD0
	LDA.w #$0123				;$B8EAD3
	JSL.l set_sprite_animation		;$B8EAD6
CODE_B8EADA:
	JSL.l process_sprite_animation		;$B8EADA
	LDA.b $00,x				;$B8EADE
	BEQ.b CODE_B8EAE9			;$B8EAE0
	LDA.w #CODE_B8EAEC			;$B8EAE2
	JSL.l CODE_BB85D6			;$B8EAE5
CODE_B8EAE9:
	JML [$04F5]				;$B8EAE9

CODE_B8EAEC:
	JSL.l CODE_BEC018			;$B8EAEC
	LDX.b current_sprite			;$B8EAF0
	BCC.b CODE_B8EAF6			;$B8EAF2
	STZ.b $5C,x				;$B8EAF4
CODE_B8EAF6:
	ROL					;$B8EAF6
	STA.b $68,x				;$B8EAF7
	LDA.b $5C,x				;$B8EAF9
	BMI.b CODE_B8EAFF			;$B8EAFB
	INC.b $5C,x				;$B8EAFD
CODE_B8EAFF:
	RTL					;$B8EAFF

parry_main:
	JMP.w (DATA_B8EB03,x)			;$B8EB00

DATA_B8EB03:
	dw CODE_B8EB09
	dw CODE_B8EB26
	dw CODE_B8EB83

CODE_B8EB09:
	STY.b parry_index			;$B8EB09
	TYX					;$B8EB0B
	INC.b $38,x				;$B8EB0C
	JSR.w CODE_B8EC24			;$B8EB0E
	LDA.b $1A				;$B8EB11
	STA.b $5C,x				;$B8EB13
	LDA.b $1C				;$B8EB15
	STA.b $5E,x				;$B8EB17
	LDA.b $1E				;$B8EB19
	STA.b $60,x				;$B8EB1B
	LDA.b $20				;$B8EB1D
	STA.b $62,x				;$B8EB1F
	LDA.w #$00F0				;$B8EB21
	STA.b $66,x				;$B8EB24
CODE_B8EB26:
	LDY.b parry_index			;$B8EB26
	BEQ.b CODE_B8EB63			;$B8EB28
	JSR.w CODE_B8EC6A			;$B8EB2A
	JSR.w CODE_B8EBA9			;$B8EB2D
	LDA.w #$0009				;$B8EB30
	JSL.l interpolate_x_speed		;$B8EB33
	LDA.w #$000C				;$B8EB37
	JSL.l interpolate_y_speed		;$B8EB3A
	JSR.w CODE_B8E1FB			;$B8EB3E
	JSL.l process_sprite_animation		;$B8EB41
	JSL.l CODE_BBAB29			;$B8EB45
	LDX.b current_sprite			;$B8EB49
	LDA.w #$00F0				;$B8EB4B
	BCC.b CODE_B8EB55			;$B8EB4E
	LDA.b $66,x				;$B8EB50
	DEC					;$B8EB52
	BMI.b CODE_B8EB5A			;$B8EB53
CODE_B8EB55:
	STA.b $66,x				;$B8EB55
	JML [$04F5]				;$B8EB57

CODE_B8EB5A:
	JSL.l delete_sprite_handle_deallocation	;$B8EB5A
	STZ.b parry_index			;$B8EB5E
	JML [$04F5]				;$B8EB60

CODE_B8EB63:
	LDA.w #$0120				;$B8EB63
	JSL.l set_sprite_animation		;$B8EB66
	JSL.l CODE_B68021			;$B8EB6A
	INC.b $38,x				;$B8EB6E
	LDA.b $1E,x				;$B8EB70
	ORA.w #$3000				;$B8EB72
	STA.b $1E,x				;$B8EB75
	LDA.w #$00F4				;$B8EB77
	STA.b $0E,x				;$B8EB7A
	STZ.b $3A,x				;$B8EB7C
	STZ.b parry_index			;$B8EB7E
	JML [$04F5]				;$B8EB80

CODE_B8EB83:
	JSL.l process_current_movement		;$B8EB83
	JSL.l process_sprite_animation		;$B8EB87
	LDA.l DATA_FF1BC0+$02			;$B8EB8B
	STA.b $06,x				;$B8EB8F
	LDA.w $1973				;$B8EB91
	CLC					;$B8EB94
	ADC.w #$00E0				;$B8EB95
	CMP.b $16,x				;$B8EB98
	BCS.b CODE_B8EBA6			;$B8EB9A
	JSL.l CODE_BBAB29			;$B8EB9C
	BCC.b CODE_B8EBA6			;$B8EBA0
	JSL.l CODE_BB8597			;$B8EBA2
CODE_B8EBA6:
	JML [$04F5]				;$B8EBA6

CODE_B8EBA9:
	LDX.b current_sprite			;$B8EBA9
	LDY.w active_kong_sprite		;$B8EBAB
	JSR.w CODE_B8EC24			;$B8EBAE
	LDA.b $1A				;$B8EBB1
	SEC					;$B8EBB3
	SBC.b $5C,x				;$B8EBB4
	STA.b $2A				;$B8EBB6
	LDA.b $1C				;$B8EBB8
	SBC.b $5E,x				;$B8EBBA
	STA.b $2C				;$B8EBBC
	LDA.b $5C,x				;$B8EBBE
	SEC					;$B8EBC0
	SBC.b $10,x				;$B8EBC1
	STA.b $2E				;$B8EBC3
	LDA.b $5E,x				;$B8EBC5
	SBC.b $12,x				;$B8EBC7
	LDX.w #$0005				;$B8EBC9
	JSR.w CODE_B8EC09			;$B8EBCC
	LDX.b current_sprite			;$B8EBCF
	STA.b $30,x				;$B8EBD1
	LDA.b $1E				;$B8EBD3
	SEC					;$B8EBD5
	SBC.b $60,x				;$B8EBD6
	STA.b $2A				;$B8EBD8
	LDA.b $20				;$B8EBDA
	SBC.b $62,x				;$B8EBDC
	STA.b $2C				;$B8EBDE
	LDA.b $60,x				;$B8EBE0
	SEC					;$B8EBE2
	SBC.b $14,x				;$B8EBE3
	STA.b $2E				;$B8EBE5
	LDA.b $62,x				;$B8EBE7
	SBC.b $16,x				;$B8EBE9
	SEC					;$B8EBEB
	SBC.b $64,x				;$B8EBEC
	LDX.w #$0004				;$B8EBEE
	JSR.w CODE_B8EC09			;$B8EBF1
	LDX.b current_sprite			;$B8EBF4
	STA.b $34,x				;$B8EBF6
	LDA.b $1A				;$B8EBF8
	STA.b $5C,x				;$B8EBFA
	LDA.b $1C				;$B8EBFC
	STA.b $5E,x				;$B8EBFE
	LDA.b $1E				;$B8EC00
	STA.b $60,x				;$B8EC02
	LDA.b $20				;$B8EC04
	STA.b $62,x				;$B8EC06
	RTS					;$B8EC08

CODE_B8EC09:
	CMP.w #$8000				;$B8EC09
	ROR					;$B8EC0C
	ROR.b $2E				;$B8EC0D
	DEX					;$B8EC0F
	BNE.b CODE_B8EC09			;$B8EC10
	STA.b $30				;$B8EC12
	LDA.b $2A				;$B8EC14
	CLC					;$B8EC16
	ADC.b $2E				;$B8EC17
	STA.b $2E				;$B8EC19
	LDA.b $2C				;$B8EC1B
	ADC.b $30				;$B8EC1D
	STA.b $30				;$B8EC1F
	LDA.b $2F				;$B8EC21
	RTS					;$B8EC23

CODE_B8EC24:
	LDY.w active_kong_sprite		;$B8EC24
	LDA.w $0010,y				;$B8EC27
	STA.b $1A				;$B8EC2A
	LDA.w $0012,y				;$B8EC2C
	STA.b $1C				;$B8EC2F
	LDA.w $0014,y				;$B8EC31
	STA.b $1E				;$B8EC34
	LDA.w $0016,y				;$B8EC36
	STA.b $20				;$B8EC39
	LDA level_number			;$B8EC3B
	CMP.w #!level_squeals_on_wheels		;$B8EC3D
	BEQ.b CODE_B8EC53			;$B8EC40
	LDA.w $050F				;$B8EC42
	BMI.b CODE_B8EC52			;$B8EC45
	CLC					;$B8EC47
	ADC.b $64,x				;$B8EC48
	CMP.b $20				;$B8EC4A
	BCS.b CODE_B8EC52			;$B8EC4C
	STZ.b $1E				;$B8EC4E
	STA.b $20				;$B8EC50
CODE_B8EC52:
	RTS					;$B8EC52

CODE_B8EC53:
	LDA.w #$0580				;$B8EC53
	CMP.b $1C				;$B8EC56
	BCC.b CODE_B8EC5E			;$B8EC58
	STZ.b $1A				;$B8EC5A
	STA.b $1C				;$B8EC5C
CODE_B8EC5E:
	LDA.w #$0B38				;$B8EC5E
	CMP.b $20				;$B8EC61
	BCC.b CODE_B8EC69			;$B8EC63
	STZ.b $1E				;$B8EC65
	STA.b $20				;$B8EC67
CODE_B8EC69:
	RTS					;$B8EC69

CODE_B8EC6A:
	LDA.w $076D				;$B8EC6A
	CMP.w #$0002				;$B8EC6D
	BEQ.b CODE_B8EC7E			;$B8EC70
	CMP.w #$0011				;$B8EC72
	BEQ.b CODE_B8EC7E			;$B8EC75
	LDX.w active_kong_sprite		;$B8EC77
	JSR.w CODE_B8EC88			;$B8EC7A
	RTS					;$B8EC7D

CODE_B8EC7E:
	LDA.w $001E,y				;$B8EC7E
	ORA.w #$3000				;$B8EC81
	STA.w $001E,y				;$B8EC84
	RTS					;$B8EC87

CODE_B8EC88:
	LDA.b $1E,x				;$B8EC88
	EOR.w $001E,y				;$B8EC8A
	AND.w #$3000				;$B8EC8D
	EOR.w $001E,y				;$B8EC90
	STA.w $001E,y				;$B8EC93
	LDA.b $0E,x				;$B8EC96
	EOR.w $000E,y				;$B8EC98
	AND.w #$0040				;$B8EC9B
	EOR.w $000E,y				;$B8EC9E
	STA.w $000E,y				;$B8ECA1
	RTS					;$B8ECA4

animal_buddy_icon_main:
	JMP.w (DATA_B8ECA8,x)			;$B8ECA5

DATA_B8ECA8:
	dw CODE_B8ECAE
	dw CODE_B8ECBE
	dw CODE_B8ECDB

CODE_B8ECAE:
	TYX					;$B8ECAE
	DEC.b $5E,x				;$B8ECAF
	BPL.b CODE_B8ECBB			;$B8ECB1
	JSL.l CODE_BBC809			;$B8ECB3
	BPL.b CODE_B8ECBB			;$B8ECB7
	INC.b $38,x				;$B8ECB9
CODE_B8ECBB:
	JML [$04F5]				;$B8ECBB

CODE_B8ECBE:
	LDA.w $05AF				;$B8ECBE
	AND.w #$4000				;$B8ECC1
	BEQ.b CODE_B8ECD0			;$B8ECC4
	LDA.b current_animal_type		;$B8ECC6
	CMP.w $0060,y				;$B8ECC8
	BNE.b CODE_B8ED07			;$B8ECCB
	JML [$04F5]				;$B8ECCD

CODE_B8ECD0:
	TYX					;$B8ECD0
	INC.b $38,x				;$B8ECD1
	LDA.w #$0040				;$B8ECD3
	STA.b $5E,x				;$B8ECD6
	JML [$04F5]				;$B8ECD8

CODE_B8ECDB:
	TYX					;$B8ECDB
	DEC.b $5E,x				;$B8ECDC
	BMI.b CODE_B8ED07			;$B8ECDE
	LDA.b $5E,x				;$B8ECE0
	CMP.w #$000A				;$B8ECE2
	BMI.b CODE_B8ECF3			;$B8ECE5
	CMP.w #$0020				;$B8ECE7
	BMI.b CODE_B8ECFD			;$B8ECEA
	LDA.b active_frame_counter		;$B8ECEC
	AND.w #$0003				;$B8ECEE
	BNE.b CODE_B8ED04			;$B8ECF1
CODE_B8ECF3:
	LDA.b $26,x				;$B8ECF3
	EOR.w #$4000				;$B8ECF5
	STA.b $26,x				;$B8ECF8
	JML [$04F5]				;$B8ECFA

CODE_B8ECFD:
	LDA.b active_frame_counter		;$B8ECFD
	AND.w #$0001				;$B8ECFF
	BEQ.b CODE_B8ECF3			;$B8ED02
CODE_B8ED04:
	JML [$04F5]				;$B8ED04

CODE_B8ED07:
	JSL.l CODE_BB8597			;$B8ED07
	STZ.w $189B				;$B8ED0B
	JML [$04F5]				;$B8ED0E

CODE_B8ED11:
	LDA.w $05AF				;$B8ED11
	AND.w #$4000				;$B8ED14
	BEQ.b CODE_B8ED4A			;$B8ED17
	LDA.b current_animal_type		;$B8ED19
	BEQ.b CODE_B8ED4A			;$B8ED1B
	LDX.w $189B				;$B8ED1D
	BEQ.b CODE_B8ED26			;$B8ED20
	JSL.l CODE_BB85E8			;$B8ED22
CODE_B8ED26:
	LDA.b current_animal_type		;$B8ED26
	SEC					;$B8ED28
	SBC.w #!animal_sprite_type_range_start 	;$B8ED29
	LSR					;$B8ED2C
	ADC.w #$0040				;$B8ED2D
	TAY					;$B8ED30
	JSL.l CODE_BB8585			;$B8ED31
	LDY.b alternate_sprite			;$B8ED35
	STY.w $189B				;$B8ED37
	LDX.b $24,y				;$B8ED3A
	LDA.l DATA_B9B658,x			;$B8ED3C
	STA.w $0024,y				;$B8ED40
	TYX					;$B8ED43
	LDA.b $5C,x				;$B8ED44
	JSL.l CODE_BBC806			;$B8ED46
CODE_B8ED4A:
	RTL					;$B8ED4A

no_animal_buddy_sign_main:
	LDA.w $0006,y				;$B8ED4B
	BEQ.b CODE_B8ED5F			;$B8ED4E
	TYX					;$B8ED50
	STZ.b $06,x				;$B8ED51
	CMP.w $05B7				;$B8ED53
	BEQ.b CODE_B8ED5F			;$B8ED56
	JSL.l delete_sprite_handle_deallocation	;$B8ED58
	JML [$04F5]				;$B8ED5C

CODE_B8ED5F:
	LDA.w $005C,y				;$B8ED5F
	LDX.b parry_index			;$B8ED62
	BEQ.b CODE_B8ED6D			;$B8ED64
	CMP.b $00,x				;$B8ED66
	BNE.b CODE_B8ED6D			;$B8ED68
	JMP.w CODE_B8EDC8			;$B8ED6A

CODE_B8ED6D:
	STA.b $1A				;$B8ED6D
	LDX.w active_kong_sprite		;$B8ED6F
	LDA.b current_animal_type		;$B8ED72
	CMP.b $1A				;$B8ED74
	BEQ.b CODE_B8ED8F			;$B8ED76
	LDX.w #$0954				;$B8ED78
CODE_B8ED7B:
	LDA.b $00,x				;$B8ED7B
	CMP.b $1A				;$B8ED7D
	BEQ.b CODE_B8ED8F			;$B8ED7F
	TXA					;$B8ED81
	CLC					;$B8ED82
	ADC.w #sizeof(sprite)			;$B8ED83
	TAX					;$B8ED86
	CPX.w #main_sprite_table_end		;$B8ED87
	BNE.b CODE_B8ED7B			;$B8ED8A
CODE_B8ED8C:
	JMP.w CODE_B8EDC1			;$B8ED8C

CODE_B8ED8F:
	LDA.w $0016,y				;$B8ED8F
	CLC					;$B8ED92
	ADC.w #$0008				;$B8ED93
	CMP.b $16,x				;$B8ED96
	BMI.b CODE_B8ED8C			;$B8ED98
	LDA.w $0012,y				;$B8ED9A
	SEC					;$B8ED9D
	SBC.b $12,x				;$B8ED9E
	CLC					;$B8EDA0
	ADC.w #$0010				;$B8EDA1
	CMP.w #$0020				;$B8EDA4
	BCS.b CODE_B8ED8C			;$B8EDA7
	LDA.b current_animal_type		;$B8EDA9
	BEQ.b CODE_B8EDBC			;$B8EDAB
	LDA.w #$0021				;$B8EDAD
	JSL.l CODE_B882B6			;$B8EDB0
	BCS.b CODE_B8ED8C			;$B8EDB4
	JSR.w CODE_B8EDF1			;$B8EDB6
	JMP.w CODE_B8EDC1			;$B8EDB9

CODE_B8EDBC:
	LDA.w #$0003				;$B8EDBC
	STA.b $3C,x				;$B8EDBF
CODE_B8EDC1:
	JSL.l CODE_BBAB52			;$B8EDC1
	JML [$04F5]				;$B8EDC5

CODE_B8EDC8:
	LDA.w $0016,y				;$B8EDC8
	CLC					;$B8EDCB
	ADC.w #$0008				;$B8EDCC
	CMP.b $16,x				;$B8EDCF
	BMI.b CODE_B8EDEE			;$B8EDD1
	LDA.w $0012,y				;$B8EDD3
	SEC					;$B8EDD6
	SBC.b $12,x				;$B8EDD7
	CLC					;$B8EDD9
	ADC.w #$0010				;$B8EDDA
	CMP.w #$0020				;$B8EDDD
	BCS.b CODE_B8EDEE			;$B8EDE0
	LDA.w #$0020				;$B8EDE2
	JSL.l CODE_B882B6			;$B8EDE5
	BCS.b CODE_B8EDEE			;$B8EDE9
	JSR.w CODE_B8EDF1			;$B8EDEB
CODE_B8EDEE:
	JMP.w CODE_B8EDC1			;$B8EDEE

CODE_B8EDF1:
	LDA.w #$0429				;$B8EDF1
	JSL.l CODE_B28018			;$B8EDF4
	LDA.w #$052A				;$B8EDF8
	JSL.l CODE_B28018			;$B8EDFB
	LDA.w #$062B				;$B8EDFF
	JSL.l CODE_B28018			;$B8EE02
	LDA.w #$072C				;$B8EE06
	JSL.l CODE_B28018			;$B8EE09
	LDX.w active_kong_sprite		;$B8EE0D
	LDY.b current_sprite			;$B8EE10
	LDA.w $005E,y				;$B8EE12
	STA.w $17CA				;$B8EE15
	LDA.w $0064,y				;$B8EE18
	AND.w #$00FF				;$B8EE1B
	CMP.w #$0080				;$B8EE1E
	BCC.b CODE_B8EE26			;$B8EE21
	ORA.w #$FF00				;$B8EE23
CODE_B8EE26:
	BIT.b $1E,x				;$B8EE26
	BVC.b CODE_B8EE2E			;$B8EE28
	EOR.w #$FFFF				;$B8EE2A
	INC					;$B8EE2D
CODE_B8EE2E:
	CLC					;$B8EE2E
	ADC.w $0012,y				;$B8EE2F
	STA.w $17CC				;$B8EE32
	LDA.w $0064,y				;$B8EE35
	XBA					;$B8EE38
	AND.w #$00FF				;$B8EE39
	CMP.w #$0080				;$B8EE3C
	BCC.b CODE_B8EE45			;$B8EE3F
	ORA.w #$FF00				;$B8EE41
	CLC					;$B8EE44
CODE_B8EE45:
	ADC.w $0016,y				;$B8EE45
	STA.w $17CE				;$B8EE48
	LDA.w $0060,y				;$B8EE4B
	STA.w $17D0				;$B8EE4E
	LDA.w $0062,y				;$B8EE51
	STA.w $17D2				;$B8EE54
	RTS					;$B8EE57

unknown_sprite_025C_main:
	JSL.l process_current_movement		;$B8EE58
	BCS.b CODE_B8EE61			;$B8EE5C
	JML [$04F5]				;$B8EE5E

CODE_B8EE61:
	LDX.b current_sprite			;$B8EE61
	STX.b alternate_sprite			;$B8EE63
	JSL.l CODE_BB859D			;$B8EE65
	LDY.b current_sprite			;$B8EE69
	LDA.w $001E,y				;$B8EE6B
	AND.w #$01E0				;$B8EE6E
	SEC					;$B8EE71
	SBC.w #$01E0				;$B8EE72
	BNE.b CODE_B8EE7A			;$B8EE75
	STA.w $001E,y				;$B8EE77
CODE_B8EE7A:
	LDX.b $5C,y				;$B8EE7A
	LDA.l DATA_FF0040,x			;$B8EE7C
	TAY					;$B8EE80
	JSL.l apply_spawn_script_to_slot	;$B8EE81
	JML [$04F5]				;$B8EE85

animal_buddy_box_main:
	JMP.w (DATA_B8EE8B,x)			;$B8EE88

DATA_B8EE8B:
	dw CODE_B8EE91
	dw CODE_B8EEC1
	dw CODE_B8EF1E

CODE_B8EE91:
	TYX					;$B8EE91
	INC.b $38,x				;$B8EE92
	LDA.w #main_sprite_table		;$B8EE94
CODE_B8EE97:
	TAY					;$B8EE97
	LDA.w sprite.type,y 			;$B8EE98
	CMP.b $5C,x				;$B8EE9B
	BEQ.b CODE_B8EEAD			;$B8EE9D
	TYA					;$B8EE9F
	CLC					;$B8EEA0
	ADC.w #sizeof(sprite)			;$B8EEA1
	CMP.w #main_sprite_table_end		;$B8EEA4
	BCC.b CODE_B8EE97			;$B8EEA7
	STZ.b $60,x				;$B8EEA9
	BRA.b CODE_B8EEC1			;$B8EEAB

CODE_B8EEAD:
	LDA.w #$0001				;$B8EEAD
	STA.b $60,x				;$B8EEB0
	LDA.w $0777				;$B8EEB2
	AND.w #$0200				;$B8EEB5
	BEQ.b CODE_B8EEC1			;$B8EEB8
	JSL.l CODE_BB8597			;$B8EEBA
	JML [$04F5]				;$B8EEBE

CODE_B8EEC1:
	LDA.w #$0038				;$B8EEC1
	JSL.l check_throwable_collision		;$B8EEC4
	BCS.b CODE_B8EEE6			;$B8EEC8
	JSL.l populate_sprite_clipping		;$B8EECA
	LDA.b $5E,x				;$B8EECE
	BEQ.b CODE_B8EEDA			;$B8EED0
	JSL.l CODE_BEC012			;$B8EED2
	BCS.b CODE_B8EEE6			;$B8EED6
	BRA.b CODE_B8EEE3			;$B8EED8

CODE_B8EEDA:
	LDA.w #$08FB				;$B8EEDA
	JSL.l CODE_BEC009			;$B8EEDD
	BCS.b CODE_B8EEE6			;$B8EEE1
CODE_B8EEE3:
	JMP.w CODE_B8EDC1			;$B8EEE3

CODE_B8EEE6:
	LDX.w #$0060				;$B8EEE6
	LDA.l DATA_B9B6E7,x			;$B8EEE9
	LDX.b current_sprite			;$B8EEED
	STA.b $24,x				;$B8EEEF
	INC.b $38,x				;$B8EEF1
	LDA.w #$0004				;$B8EEF3
	STA.b $5E,x				;$B8EEF6
	LDY.w #$0014				;$B8EEF8
	JSL.l CODE_BB8585			;$B8EEFB
	LDA.w #$041D				;$B8EEFF
	JSL.l CODE_B28018			;$B8EF02
	LDA.w #$071E				;$B8EF06
	JSL.l CODE_B28018			;$B8EF09
	LDA.w #$051F				;$B8EF0D
	JSL.l CODE_B28018			;$B8EF10
	LDA.w #$0620				;$B8EF14
	JSL.l CODE_B28018			;$B8EF17
	JML [$04F5]				;$B8EF1B

CODE_B8EF1E:
	TYX					;$B8EF1E
	DEC.b $5E,x				;$B8EF1F
	BPL.b CODE_B8EF42			;$B8EF21
	JSL.l CODE_BB8597			;$B8EF23
	LDA.b $60,x				;$B8EF27
	BNE.b CODE_B8EF42			;$B8EF29
	INC.b $00,x				;$B8EF2B
	LDA.b $5C,x				;$B8EF2D
	JSR.w CODE_B8EF45			;$B8EF2F
	LDX.b current_sprite			;$B8EF32
	STZ.b $00,x				;$B8EF34
	LDY.b alternate_sprite			;$B8EF36
	LDA.b $12,x				;$B8EF38
	STA.w $0012,y				;$B8EF3A
	LDA.b $16,x				;$B8EF3D
	STA.w $0016,y				;$B8EF3F
CODE_B8EF42:
	JML [$04F5]				;$B8EF42

CODE_B8EF45:
	SEC					;$B8EF45
	SBC.w #!animal_sprite_type_range_start 	;$B8EF46
	LSR					;$B8EF49
	CLC					;$B8EF4A
	ADC.w #$0060				;$B8EF4B
	TAY					;$B8EF4E
	JSL.l CODE_BB8585			;$B8EF4F
	RTS					;$B8EF53

CODE_B8EF54:
	LDA.w #$4000				;$B8EF54
	BIT.w $05AF				;$B8EF57
	BNE.b CODE_B8EF64			;$B8EF5A
	JSR.w get_kong_state_flags		;$B8EF5C
	AND.w #$0004				;$B8EF5F
	BEQ.b CODE_B8EF65			;$B8EF62
CODE_B8EF64:
	RTL					;$B8EF64

CODE_B8EF65:
	LDA.w #$4000				;$B8EF65
	TSB.w $05AF				;$B8EF68
	LDA.b current_animal_type		;$B8EF6B
	BEQ.b CODE_B8EF76			;$B8EF6D
	LDA.b current_mount			;$B8EF6F
	BNE.b CODE_B8EF76			;$B8EF71
	JMP.w CODE_B8ED11			;$B8EF73

CODE_B8EF76:
	LDX.b current_sprite			;$B8EF76
	LDY.w follower_kong_sprite		;$B8EF78
	LDA.b $12,x				;$B8EF7B
	STA.w $0012,y				;$B8EF7D
	LDA.b $16,x				;$B8EF80
	STA.w $0016,y				;$B8EF82
	LDA.b $0E,x				;$B8EF85
	AND.w #$0040				;$B8EF87
	ORA.w #$00D8				;$B8EF8A
	STA.w $000E,y				;$B8EF8D
	LDA.b $1E,x				;$B8EF90
	EOR.w $001E,y				;$B8EF92
	AND.w #$3000				;$B8EF95
	EOR.w $001E,y				;$B8EF98
	STA.w $001E,y				;$B8EF9B
	PHX					;$B8EF9E
	JSL.l CODE_B89C3C			;$B8EF9F
	LDA.w #$003B				;$B8EFA3
	STA.b $38,x				;$B8EFA6
	LDA.w #$0020				;$B8EFA8
	LDX.w #$0009				;$B8EFAB
	LDY.w #$0000				;$B8EFAE
	JSL.l CODE_B8F028			;$B8EFB1
	LDX.b current_sprite			;$B8EFB5
	LDA.w #$0009				;$B8EFB7
	JSL.l set_anim_handle_kiddy		;$B8EFBA
	PLX					;$B8EFBE
	STX.b current_sprite			;$B8EFBF
	LDY.w follower_kong_sprite		;$B8EFC1
	LDA.w #$0020				;$B8EFC4
	STA.w $005C,y				;$B8EFC7
	LDA.w #$0000				;$B8EFCA
	STA.w $005E,y				;$B8EFCD
	LDA.w #$FA00				;$B8EFD0
	STA.w $0060,y				;$B8EFD3
	LDA.w #$0060				;$B8EFD6
	STA.w $0062,y				;$B8EFD9
	LDA.w #$000F				;$B8EFDC
	LDY.w #$003C				;$B8EFDF
	JSL.l enable_timestop			;$B8EFE2
	RTL					;$B8EFE6

CODE_B8EFE7:
	LDY.w follower_kong_sprite		;$B8EFE7
	CPY.w current_held_sprite		;$B8EFEA
	BNE.b CODE_B8F01F			;$B8EFED
	LDX.w active_kong_sprite		;$B8EFEF
	LDA.b $0E,x				;$B8EFF2
	CLC					;$B8EFF4
	ADC.w $1871				;$B8EFF5
	STA.w $000E,y				;$B8EFF8
	LDA.b $16,x				;$B8EFFB
	CLC					;$B8EFFD
	ADC.w $186F				;$B8EFFE
	STA.w $0016,y				;$B8F001
	LDA.b $1E,x				;$B8F004
	EOR.w $001E,y				;$B8F006
	AND.w #$7000				;$B8F009
	EOR.w $001E,y				;$B8F00C
	STA.w $001E,y				;$B8F00F
	LDA.b $12,x				;$B8F012
	BIT.b $1E,x				;$B8F014
	BVS.b CODE_B8F020			;$B8F016
	CLC					;$B8F018
	ADC.w $186D				;$B8F019
	STA.w $0012,y				;$B8F01C
CODE_B8F01F:
	RTL					;$B8F01F

CODE_B8F020:
	SEC					;$B8F020
	SBC.w $186D				;$B8F021
	STA.w $0012,y				;$B8F024
	RTL					;$B8F027

CODE_B8F028:
	STZ.b $32				;$B8F028
CODE_B8F02A:
	STA.b $22				;$B8F02A
	STX.b $24				;$B8F02C
	STY.b $26				;$B8F02E
	LDX.w follower_kong_sprite		;$B8F030
	LDA.b $12,x				;$B8F033
	STZ.b $1A				;$B8F035
	STA.b $1C				;$B8F037
	LDA.b $16,x				;$B8F039
	STZ.b $1E				;$B8F03B
	STA.b $20				;$B8F03D
	LDX.w active_kong_sprite		;$B8F03F
	LDA.b $12,x				;$B8F042
	SEC					;$B8F044
	SBC.b $1C				;$B8F045
	JSR.w CODE_B8F0AE			;$B8F047
	STZ.b $28				;$B8F04A
	STY.b $2A				;$B8F04C
	STA.b $29				;$B8F04E
	LDA.b $16,x				;$B8F050
	CLC					;$B8F052
	ADC.b $32				;$B8F053
	SEC					;$B8F055
	SBC.b $20				;$B8F056
	JSR.w CODE_B8F0AE			;$B8F058
	STZ.b $2C				;$B8F05B
	STY.b $2E				;$B8F05D
	STA.b $2D				;$B8F05F
	LDX.w #$0000				;$B8F061
CODE_B8F064:
	LDA.b $1C				;$B8F064
	STA.l $7E4080,x				;$B8F066
	LDA.b $20				;$B8F06A
	STA.l $7E40C0,x				;$B8F06C
	LDA.b $24				;$B8F070
	STA.l $7E4140,x				;$B8F072
	LDA.b $26				;$B8F076
	STA.l $7E4100,x				;$B8F078
	LDA.b $1A				;$B8F07C
	CLC					;$B8F07E
	ADC.b $28				;$B8F07F
	STA.b $1A				;$B8F081
	LDA.b $1C				;$B8F083
	ADC.b $2A				;$B8F085
	STA.b $1C				;$B8F087
	LDA.b $1E				;$B8F089
	CLC					;$B8F08B
	ADC.b $2C				;$B8F08C
	STA.b $1E				;$B8F08E
	LDA.b $20				;$B8F090
	ADC.b $2E				;$B8F092
	STA.b $20				;$B8F094
	TXA					;$B8F096
	INC					;$B8F097
	INC					;$B8F098
	AND.w #$003F				;$B8F099
	TAX					;$B8F09C
	DEC.b $22				;$B8F09D
	BNE.b CODE_B8F064			;$B8F09F
	STA.w $1923				;$B8F0A1
	STZ.w $1925				;$B8F0A4
	LDA.w #$0002				;$B8F0A7
	TSB.w $05AF				;$B8F0AA
	RTL					;$B8F0AD

CODE_B8F0AE:
	BPL.b CODE_B8F0BD			;$B8F0AE
	EOR.w #$FFFF				;$B8F0B0
	INC					;$B8F0B3
	JSR.w CODE_B8F0BD			;$B8F0B4
	EOR.w #$FFFF				;$B8F0B7
	INC					;$B8F0BA
	DEY					;$B8F0BB
	RTS					;$B8F0BC

CODE_B8F0BD:
	CMP.w #$0100				;$B8F0BD
	BCC.b CODE_B8F0C5			;$B8F0C0
	LDA.w #$00FF				;$B8F0C2
CODE_B8F0C5:
	XBA					;$B8F0C5
	STA.w CPU.dividen_low			;$B8F0C6
	SEP.b #$20				;$B8F0C9
	LDA.b $22				;$B8F0CB
	DEC					;$B8F0CD
	STA.w CPU.divisor			;$B8F0CE
	REP.b #$20				;$B8F0D1
	LDA.w CPU.divide_result			;$B8F0D3
	LDA.w CPU.divide_result			;$B8F0D6
	LDY.w #$0000				;$B8F0D9
	LDA.w CPU.divide_result			;$B8F0DC
	RTS					;$B8F0DF

CODE_B8F0E0:
	LDA.w $1925				;$B8F0E0
	AND.w #$003F				;$B8F0E3
	TAX					;$B8F0E6
	LDY.b current_sprite			;$B8F0E7
	LDA.w $0012,y				;$B8F0E9
	STA.w $0054,y				;$B8F0EC
	LDA.w $0016,y				;$B8F0EF
	STA.w $0056,y				;$B8F0F2
	LDA.l $7E4080,x				;$B8F0F5
	STA.w $0012,y				;$B8F0F9
	LDA.l $7E40C0,x				;$B8F0FC
	STA.w $0016,y				;$B8F100
	LDA.l $7E4140,x				;$B8F103
	STA.w $191B				;$B8F107
	LDA.l $7E4100,x				;$B8F10A
	STA.w $191D				;$B8F10E
	LDA.w $1917				;$B8F111
	CMP.w $0012,y				;$B8F114
	BEQ.b CODE_B8F11C			;$B8F117
	JSR.w CODE_B8F179			;$B8F119
CODE_B8F11C:
	LDA.w $1927				;$B8F11C
	AND.w #$0003				;$B8F11F
	BNE.b CODE_B8F150			;$B8F122
	LDX.b current_sprite			;$B8F124
	JSR.w CODE_B8C932			;$B8F126
	BCS.b CODE_B8F168			;$B8F129
	LDX.b current_sprite			;$B8F12B
	SEC					;$B8F12D
	SBC.b $16,x				;$B8F12E
	STA.b $1A,x				;$B8F130
	BNE.b CODE_B8F168			;$B8F132
	LDA.b $A0				;$B8F134
	AND.w #$0007				;$B8F136
	CMP.w #$0005				;$B8F139
	BCS.b CODE_B8F168			;$B8F13C
	LDA.w $1917				;$B8F13E
	SEC					;$B8F141
	SBC.b $12,x				;$B8F142
	BCS.b CODE_B8F14A			;$B8F144
	EOR.w #$FFFF				;$B8F146
	INC					;$B8F149
CODE_B8F14A:
	CMP.w #$001C				;$B8F14A
	BCS.b CODE_B8F168			;$B8F14D
	RTS					;$B8F14F

CODE_B8F150:
	TRB.w $1927				;$B8F150
	AND.w #$0002				;$B8F153
	BEQ.b CODE_B8F168			;$B8F156
	LDA.w $1925				;$B8F158
	INC					;$B8F15B
	INC					;$B8F15C
	AND.w #$003F				;$B8F15D
	CMP.w $1923				;$B8F160
	BEQ.b CODE_B8F178			;$B8F163
	STA.w $1925				;$B8F165
CODE_B8F168:
	LDA.w $1925				;$B8F168
	INC					;$B8F16B
	INC					;$B8F16C
	AND.w #$003F				;$B8F16D
	CMP.w $1923				;$B8F170
	BEQ.b CODE_B8F178			;$B8F173
	STA.w $1925				;$B8F175
CODE_B8F178:
	RTS					;$B8F178

CODE_B8F179:
	LDX.w follower_kong_sprite		;$B8F179
	LDY.w active_kong_sprite		;$B8F17C
	LDA.w $0012,y				;$B8F17F
	SEC					;$B8F182
	SBC.b $12,x				;$B8F183
	ADC.w #$0004				;$B8F185
	CMP.w #$0008				;$B8F188
	BCS.b CODE_B8F192			;$B8F18B
	LDA.w $001E,y				;$B8F18D
	BRA.b CODE_B8F193			;$B8F190

CODE_B8F192:
	LSR					;$B8F192
CODE_B8F193:
	EOR.b $1E,x				;$B8F193
	AND.w #$4000				;$B8F195
	BNE.b CODE_B8F19B			;$B8F198
	RTS					;$B8F19A

CODE_B8F19B:
	LDA.w #$0004				;$B8F19B
	TSB.w $1927				;$B8F19E
	RTS					;$B8F1A1

CODE_B8F1A2:
	LDX.w $191B				;$B8F1A2
	LDA.l DATA_F90000,x			;$B8F1A5
	AND.w #$00FF				;$B8F1A9
	ASL					;$B8F1AC
	TAX					;$B8F1AD
	JMP.w (DATA_B8F1B1,x)			;$B8F1AE

DATA_B8F1B1:
	dw CODE_B8F1C5
	dw CODE_B8F1C5
	dw CODE_B8F1D1
	dw CODE_B8F1DC
	dw CODE_B8F1EE
	dw CODE_B8F1FA
	dw CODE_B8F203
	dw CODE_B8F22A
	dw CODE_B8F233
	dw CODE_B8F23C

CODE_B8F1C5:
	JSR.w CODE_B8F245			;$B8F1C5
	BCS.b CODE_B8F1D0			;$B8F1C8
	LDA.w #$007D				;$B8F1CA
	JMP.w CODE_B8F280			;$B8F1CD

CODE_B8F1D0:
	RTS					;$B8F1D0

CODE_B8F1D1:
	JSR.w CODE_B8F245			;$B8F1D1
	BCS.b CODE_B8F1D0			;$B8F1D4
	LDA.w #$007E				;$B8F1D6
	JMP.w CODE_B8F280			;$B8F1D9

CODE_B8F1DC:
	LDX.b current_sprite			;$B8F1DC
	LDA.b $1A,x				;$B8F1DE
	BEQ.b CODE_B8F1C5			;$B8F1E0
	JSR.w CODE_B8F285			;$B8F1E2
	JSR.w CODE_B8F271			;$B8F1E5
	LDA.w #$0080				;$B8F1E8
	JMP.w CODE_B8F280			;$B8F1EB

CODE_B8F1EE:
	JSR.w CODE_B8F271			;$B8F1EE
	JSR.w CODE_B8F285			;$B8F1F1
	LDA.w #$0081				;$B8F1F4
	JMP.w CODE_B8F280			;$B8F1F7

CODE_B8F1FA:
	JSR.w CODE_B8F271			;$B8F1FA
	LDA.w #$0082				;$B8F1FD
	JMP.w CODE_B8F280			;$B8F200

CODE_B8F203:
	LDY current_kong_control_variables	;$B8F203
	LDA.w $0000,y				;$B8F205
	CMP.w #$001D				;$B8F208
	BEQ.b CODE_B8F229			;$B8F20B
	LDX.b current_sprite			;$B8F20D
	LDA.b $1E,x				;$B8F20F
	EOR.w $191D				;$B8F211
	AND.w #$4000				;$B8F214
	BEQ.b CODE_B8F21E			;$B8F217
	LDA.w #$001D				;$B8F219
	BRA.b CODE_B8F226			;$B8F21C

CODE_B8F21E:
	LDA.w $191B				;$B8F21E
	CMP.w #$001D				;$B8F221
	BEQ.b CODE_B8F229			;$B8F224
CODE_B8F226:
	JMP.w CODE_B8F280			;$B8F226

CODE_B8F229:
	RTS					;$B8F229

CODE_B8F22A:
	JSR.w CODE_B8F271			;$B8F22A
	LDA.w $191B				;$B8F22D
	JMP.w CODE_B8F280			;$B8F230

CODE_B8F233:
	JSR.w CODE_B8F271			;$B8F233
	LDA.w #$0028				;$B8F236
	JMP.w CODE_B8F280			;$B8F239

CODE_B8F23C:
	JSR.w CODE_B8F271			;$B8F23C
	LDA.w #$0083				;$B8F23F
	JMP.w CODE_B8F280			;$B8F242

CODE_B8F245:
	LDA.w #$0004				;$B8F245
	TRB.w $1927				;$B8F248
	BNE.b CODE_B8F269			;$B8F24B
	LDA.w #$0008				;$B8F24D
	TRB.w $1927				;$B8F250
	BNE.b CODE_B8F261			;$B8F253
	LDY current_kong_control_variables	;$B8F255
	LDA.w $0000,y				;$B8F257
	CMP.w #$007F				;$B8F25A
	BEQ.b CODE_B8F26F			;$B8F25D
	CLC					;$B8F25F
	RTS					;$B8F260

CODE_B8F261:
	LDA.w #$0001				;$B8F261
	JSR.w CODE_B8F280			;$B8F264
	SEC					;$B8F267
	RTS					;$B8F268

CODE_B8F269:
	LDA.w #$007F				;$B8F269
	JSR.w CODE_B8F280			;$B8F26C
CODE_B8F26F:
	SEC					;$B8F26F
	RTS					;$B8F270

CODE_B8F271:
	LDX.b current_sprite			;$B8F271
	LDA.w $191D				;$B8F273
	EOR.b $1E,x				;$B8F276
	AND.w #$4000				;$B8F278
	EOR.b $1E,x				;$B8F27B
	STA.b $1E,x				;$B8F27D
	RTS					;$B8F27F

CODE_B8F280:
	JSL.l set_anim_once_handle_kiddy	;$B8F280
	RTS					;$B8F284

CODE_B8F285:
	LDX.b current_sprite			;$B8F285
	LDA.b $26,x				;$B8F287
	AND.w #$CFF0				;$B8F289
	CMP.w #$CFF0				;$B8F28C
	BCS.b CODE_B8F294			;$B8F28F
	AND.w #$4FF0				;$B8F291
CODE_B8F294:
	STA.b $26,x				;$B8F294
	STZ.b $58,x				;$B8F296
	RTS					;$B8F298

stampede_trigger_main:
	JMP.w (DATA_B8F29C,x)			;$B8F299

DATA_B8F29C:
	dw CODE_B8F29E

CODE_B8F29E:
	LDX.w active_kong_sprite		;$B8F29E
	LDA.b $12,x				;$B8F2A1
	CMP.w $0012,y				;$B8F2A3
	BCC.b CODE_B8F2B8			;$B8F2A6
	LDA.w #$0017				;$B8F2A8
	JSL.l CODE_B882B6			;$B8F2AB
	BCS.b CODE_B8F2B8			;$B8F2AF
	JSL.l delete_sprite_handle_deallocation	;$B8F2B1
	JML [$04F5]				;$B8F2B5

CODE_B8F2B8:
	JMP.w CODE_B8EDC1			;$B8F2B8

kong_state_70:
	JSR.w CODE_B8F35B			;$B8F2BB
	JML [$04F5]				;$B8F2BE

kong_state_71:
	JSL.l process_anim_preserve_state	;$B8F2C1
	JSR.w CODE_B8F35B			;$B8F2C5
	JML [$04F5]				;$B8F2C8

kong_state_76:
	JSR.w CODE_B8A035			;$B8F2CB
kong_state_72:
	LDA.w #$000B				;$B8F2CE
	JSL.l interpolate_x_speed		;$B8F2D1
	JSR.w CODE_B8E1FB			;$B8F2D5
	JSL.l process_anim_preserve_state	;$B8F2D8
	JSR.w CODE_B8F35B			;$B8F2DC
	JML [$04F5]				;$B8F2DF

kong_state_73:
	JSR.w CODE_B8A035			;$B8F2E2
	JSR.w CODE_B8A04C			;$B8F2E5
	JSL.l CODE_B9E006			;$B8F2E8
	JSL.l process_anim_preserve_state	;$B8F2EC
	JSR.w CODE_B8F35B			;$B8F2F0
	JML [$04F5]				;$B8F2F3

kong_state_74:
	JSR.w CODE_B8A035			;$B8F2F6
	JSR.w CODE_B8A04C			;$B8F2F9
	LDA.b $12,x				;$B8F2FC
	CMP.w #$02D0				;$B8F2FE
	BCS.b CODE_B8F32F			;$B8F301
	LDA.b $5C,x				;$B8F303
	CMP.b $12,x				;$B8F305
	BCC.b CODE_B8F324			;$B8F307
	LDA.w #$0033				;$B8F309
	STA.b $38,x				;$B8F30C
	LDA.w #$4000				;$B8F30E
	TSB.w $05AF				;$B8F311
	LDA.w #$001F				;$B8F314
	LDX.w #$0002				;$B8F317
	LDY.w #$0000				;$B8F31A
	JSL.l CODE_B8F028			;$B8F31D
	JML [$04F5]				;$B8F321

CODE_B8F324:
	JSL.l CODE_B9E006			;$B8F324
	JSL.l process_anim_preserve_state	;$B8F328
	JML [$04F5]				;$B8F32C

CODE_B8F32F:
	JSR.w CODE_B8E1FB			;$B8F32F
	JSL.l process_anim_preserve_state	;$B8F332
	JML [$04F5]				;$B8F336

kong_state_75:
	LDA.w #$0070				;$B8F339
	STA.w $0038,y				;$B8F33C
	LDA.w $005C,y				;$B8F33F
	JSR.w CODE_B8F39B			;$B8F342
	JML [$04F5]				;$B8F345

kong_state_77:
	LDA.w #$0071				;$B8F348
	STA.w $0038,y				;$B8F34B
	LDA.w #$0040				;$B8F34E
	JSL.l set_anim_once_handle_kiddy	;$B8F351
	JSR.w CODE_B8F35B			;$B8F355
	JML [$04F5]				;$B8F358

CODE_B8F35B:
	LDX.b current_sprite			;$B8F35B
	CPX.w follower_kong_sprite		;$B8F35D
	BEQ.b CODE_B8F39A			;$B8F360
	LDA.w $193F				;$B8F362
	BEQ.b CODE_B8F3A4			;$B8F365
	LDA.w $1941				;$B8F367
	BEQ.b CODE_B8F389			;$B8F36A
	CMP.b $12,x				;$B8F36C
	BEQ.b CODE_B8F37A			;$B8F36E
	ROR.b $3A				;$B8F370
	CMP.w $1943				;$B8F372
	ROR					;$B8F375
	EOR.b $3A				;$B8F376
	BPL.b CODE_B8F39A			;$B8F378
CODE_B8F37A:
	LDA.w $1941				;$B8F37A
	STA.b $12,x				;$B8F37D
	STZ.b $10,x				;$B8F37F
	STZ.b $2A,x				;$B8F381
	STZ.b $36,x				;$B8F383
	STZ.b $30,x				;$B8F385
	BRA.b CODE_B8F3A4			;$B8F387

CODE_B8F389:
	LDA.w $1945				;$B8F389
	BEQ.b CODE_B8F397			;$B8F38C
	LDA.b $1A,x				;$B8F38E
	BNE.b CODE_B8F39A			;$B8F390
	STA.w $1945				;$B8F392
	BRA.b CODE_B8F3A4			;$B8F395

CODE_B8F397:
	DEC.w $193F				;$B8F397
CODE_B8F39A:
	RTS					;$B8F39A

CODE_B8F39B:
	STA.w $193B				;$B8F39B
	STZ.w $193D				;$B8F39E
	STZ.w $193F				;$B8F3A1
CODE_B8F3A4:
	PHK					;$B8F3A4
	PLB					;$B8F3A5
	LDA.w $193B				;$B8F3A6
	ASL					;$B8F3A9
	TAX					;$B8F3AA
	LDA.l DATA_B8F3F5,x			;$B8F3AB
	CLC					;$B8F3AF
	ADC.w $193D				;$B8F3B0
	TAX					;$B8F3B3
	LDA.w $0000,x				;$B8F3B4
	STA.w $193F				;$B8F3B7
	STZ.w $1941				;$B8F3BA
	STZ.w $1945				;$B8F3BD
	JMP.w ($0002,x)				;$B8F3C0

CODE_B8F3C3:
	CLC					;$B8F3C3
	ADC.w $193D				;$B8F3C4
	STA.w $193D				;$B8F3C7
CODE_B8F3CA:
	RTS					;$B8F3CA

CODE_B8F3CB:
	CLC					;$B8F3CB
	ADC.w $193D				;$B8F3CC
	STA.w $193D				;$B8F3CF
	PHK					;$B8F3D2
	PLB					;$B8F3D3
	LDA.w $193B				;$B8F3D4
	ASL					;$B8F3D7
	TAX					;$B8F3D8
	LDA.l DATA_B8F3F5,x			;$B8F3D9
	CLC					;$B8F3DD
	ADC.w $193D				;$B8F3DE
	TAX					;$B8F3E1
	LDA.w $0000,x				;$B8F3E2
	CLC					;$B8F3E5
	ADC.w $193F				;$B8F3E6
	STA.w $193F				;$B8F3E9
	STZ.w $1941				;$B8F3EC
	STZ.w $1945				;$B8F3EF
	JMP.w ($0002,x)				;$B8F3F2

;Those look like kong cutscene data
DATA_B8F3F5:
	dw DATA_B8F413
	dw DATA_B8F439
	dw DATA_B8F45B
	dw DATA_B8F46F
	dw !null_pointer
	dw DATA_B8F4A1
	dw DATA_B8F51F
	dw DATA_B8F57F
	dw DATA_B8F4AD
	dw DATA_B8F4EF
	dw DATA_B8F4FB
	dw DATA_B8F483
	dw DATA_B8F49D
	dw DATA_B8F58F
	dw DATA_B8F5A9

DATA_B8F413:
	dw $0000,CODE_B8F5B9,$0001,CODE_B8F64F,$0001,CODE_B8F66E,$0020,CODE_B8F67A
	dw $0001,CODE_B8F788,$0398,$0001,CODE_B8F712,$0020,CODE_B8F7DE,$0001
	dw CODE_B8F66E,$FFFF,CODE_B8F624

DATA_B8F439:
	dw $0000,CODE_B8F5B9,$0001,CODE_B8F64F,$0001,CODE_B8F66E,$0050,CODE_B8F67A
	dw $0001,CODE_B8F788,$0150,$0001,CODE_B8F712,$0008,CODE_B8F7DE,$FFFF
	dw CODE_B8F624

DATA_B8F45B:
	dw $0000,CODE_B8F5B9,$0001,CODE_B8F64F,$0001,CODE_B8F66E,$0080,CODE_B8F67A
	dw $FFFF,CODE_B8F624

DATA_B8F46F:
	dw $0000,CODE_B8F5B9,$0001,CODE_B8F64F,$0001,CODE_B8F66E,$0080,CODE_B8F67A
	dw $FFFF,CODE_B8F624

DATA_B8F483:
	dw $0000,CODE_B8F5E2,$01A0,$0259,$0000,CODE_B8F9F0,$0001,CODE_B8F67A
	dw $0000,CODE_B8FA09,$0001,$0100,CODE_B8F80B

DATA_B8F49D:
	dw $0020,CODE_B8F80B

DATA_B8F4A1:
	dw $0000,CODE_B8F5B9,$0080,CODE_B8F67A,$FFFF,CODE_B8F624

DATA_B8F4AD:
	dw $0000,CODE_B8F5E2,$00C0,$01CC,$0000,CODE_B8F822,$0014,CODE_B8F9A4
	dw $0018,CODE_B8F9CD,$0000,CODE_B8F842,$0001,CODE_B8F5D3,$0073,$0001
	dw CODE_B8F66E,$0014,CODE_B8F724,$0000,CODE_B8F852,$0001,CODE_B8F788,$01C0
	dw $0000,CODE_B8F9F0,$0001,CODE_B8F67A,$0000,CODE_B8FA09,$0001,$0100
	dw CODE_B8F80B

DATA_B8F4EF:
	dw $0000,CODE_B8F5E2,$01F0,$01D2,$0020,CODE_B8F80B

DATA_B8F4FB:
	dw $0001,CODE_B8F64F,$0001,CODE_B8F66E,$0020,CODE_B8F67A,$0001,CODE_B8F788
	dw $01F0,$0001,CODE_B8F6DB,$0000,CODE_B8F9F0,$0000,CODE_B8FA09,$0001
	dw $0001,CODE_B8F80B

DATA_B8F51F:
	dw $0000,CODE_B8F5B9,$0000,CODE_B8F9FA,$044A,$8000,$0001,CODE_B8F64F
	dw $0001,CODE_B8F66E,$0001,CODE_B8F862,$01A0,$0090,CODE_B8F67A,$0000
	dw CODE_B8F615,$000C,$0000,CODE_B8F5C6,$0001,CODE_B8F788,$01B0,$0001
	dw CODE_B8F6F9,$0000,CODE_B8F9FA,$194F,$8000,$0078,CODE_B8F8B7,$0008
	dw CODE_B8F8C3,$0780,CODE_B8F641,$0001,CODE_B8F8E5,$0372,$01E0,CODE_B8F641
	dw $0050,CODE_B8F8F2,$0030,CODE_B8F91C,$0070,CODE_B8F942,$FFFF,CODE_B8F624

DATA_B8F57F:
	dw $0000,CODE_B8F5B9,$0001,CODE_B8F64F,$0001,CODE_B8F66E,$FFFF,CODE_B8F624

DATA_B8F58F:
	dw $0000,CODE_B8F5E2,$0200,$01C0,$0000,CODE_B8F9F0,$0001,CODE_B8F67A
	dw $0000,CODE_B8FA09,$0001,$0100,CODE_B8F80B

DATA_B8F5A9:
	dw $0000,CODE_B8F5E2,$0200,$01C0,$0001,CODE_B8F67A,$0100,CODE_B8F80B

CODE_B8F5B9:
	LDA.w #$0001				;$B8F5B9
	JSL.l CODE_B2800F			;$B8F5BC
	LDA.w #$0004				;$B8F5C0
	JMP.w CODE_B8F3CB			;$B8F5C3

CODE_B8F5C6:
	LDA.w #!music_baddies_on_parade		;$B8F5C6
	JSL.l play_song				;$B8F5C9
	LDA.w #$0004				;$B8F5CD
	JMP.w CODE_B8F3CB			;$B8F5D0

CODE_B8F5D3:
	LDY.w active_kong_sprite		;$B8F5D3
	LDA.w $0004,x				;$B8F5D6
	STA.w $0038,y				;$B8F5D9
	LDA.w #$0006				;$B8F5DC
	JMP.w CODE_B8F3C3			;$B8F5DF

CODE_B8F5E2:
	LDY.w active_kong_sprite		;$B8F5E2
	LDA.w $0004,x				;$B8F5E5
	STA.w $0012,y				;$B8F5E8
	LDA.w $0006,x				;$B8F5EB
	STA.w $0016,y				;$B8F5EE
	LDY.w follower_kong_sprite		;$B8F5F1
	LDA.w $0004,x				;$B8F5F4
	STA.w $0012,y				;$B8F5F7
	LDA.w $0006,x				;$B8F5FA
	STA.w $0016,y				;$B8F5FD
	PHX					;$B8F600
	LDA.w #$001F				;$B8F601
	LDX.w #$0002				;$B8F604
	LDY.w #$0000				;$B8F607
	JSL.l CODE_B8F028			;$B8F60A
	PLX					;$B8F60E
	LDA.w #$0008				;$B8F60F
	JMP.w CODE_B8F3CB			;$B8F612

CODE_B8F615:
	LDA.w $0004,x				;$B8F615
	JSL.l CODE_BB85E2			;$B8F618
	PHK					;$B8F61C
	PLB					;$B8F61D
	LDA.w #$0006				;$B8F61E
	JMP.w CODE_B8F3CB			;$B8F621

CODE_B8F624:
	STZ.w $195B				;$B8F624
	JSL.l CODE_B8837A			;$B8F627
	RTS					;$B8F62B

CODE_B8F62C:
	LDA.w $05AF				;$B8F62C
	AND.w #$4000				;$B8F62F
	BEQ.b CODE_B8F640			;$B8F632
	LDA.b current_animal_type		;$B8F634
	BNE.b CODE_B8F640			;$B8F636
	LDX.w follower_kong_sprite		;$B8F638
	LDA.w #$0033				;$B8F63B
	STA.b $38,x				;$B8F63E
CODE_B8F640:
	RTS					;$B8F640

CODE_B8F641:
	LDX.w active_kong_sprite		;$B8F641
	LDA.w #$0071				;$B8F644
	STA.b $38,x				;$B8F647
	LDA.w #$0004				;$B8F649
	JMP.w CODE_B8F3C3			;$B8F64C

CODE_B8F64F:
	JSL.l CODE_B89C4C			;$B8F64F
	JSR.w CODE_B898AB			;$B8F653
	JSL.l CODE_B89C01			;$B8F656
	LDA.w #$0073				;$B8F65A
	STA.b $38,x				;$B8F65D
	STZ.b $30,x				;$B8F65F
	STZ.b $2E,x				;$B8F661
	STZ.b $26,x				;$B8F663
	JSR.w CODE_B8F62C			;$B8F665
	LDA.w #$0004				;$B8F668
	JMP.w CODE_B8F3C3			;$B8F66B

CODE_B8F66E:
	LDA.w #$FFFF				;$B8F66E
	STA.w $1945				;$B8F671
	LDA.w #$0004				;$B8F674
	JMP.w CODE_B8F3C3			;$B8F677

CODE_B8F67A:
	JSL.l CODE_B89C4C			;$B8F67A
	JSL.l CODE_B9A598			;$B8F67E
	LDA.w #$0071				;$B8F682
	STA.b $38,x				;$B8F685
	STZ.b $30,x				;$B8F687
	JSR.w CODE_B8F62C			;$B8F689
	LDA.w #$0004				;$B8F68C
	JMP.w CODE_B8F3C3			;$B8F68F

CODE_B8F692:
	LDA.w $05AF				;$B8F692
	AND.w #$4000				;$B8F695
	BEQ.b CODE_B8F6A1			;$B8F698
	JSL.l CODE_B89C3C			;$B8F69A
	JSR.w CODE_B8F6AE			;$B8F69E
CODE_B8F6A1:
	JSL.l CODE_B89C4C			;$B8F6A1
	JSR.w CODE_B8F6AE			;$B8F6A5
	LDA.w #$0004				;$B8F6A8
	JMP.w CODE_B8F3C3			;$B8F6AB

CODE_B8F6AE:
	LDA.w #$0071				;$B8F6AE
	STA.b $38,x				;$B8F6B1
	STZ.b $30,x				;$B8F6B3
	LDA.w #$0001				;$B8F6B5
	JSL.l set_anim_once_handle_kiddy	;$B8F6B8
	RTS					;$B8F6BC

CODE_B8F6BD:
	JSL.l CODE_B89C4C			;$B8F6BD
	BIT.b $1E,x				;$B8F6C1
	BVS.b CODE_B8F6D5			;$B8F6C3
	LDA.w #$0003				;$B8F6C5
	JSL.l set_anim_once_handle_kiddy	;$B8F6C8
	JSR.w CODE_B8F62C			;$B8F6CC
	LDA.w #$0004				;$B8F6CF
	JMP.w CODE_B8F3C3			;$B8F6D2

CODE_B8F6D5:
	LDA.w #$0004				;$B8F6D5
	JMP.w CODE_B8F3CB			;$B8F6D8

CODE_B8F6DB:
	JSL.l CODE_B89C4C			;$B8F6DB
	BIT.b $1E,x				;$B8F6DF
	BVC.b CODE_B8F6F3			;$B8F6E1
	LDA.w #$0003				;$B8F6E3
	JSL.l set_anim_once_handle_kiddy	;$B8F6E6
	JSR.w CODE_B8F62C			;$B8F6EA
	LDA.w #$0004				;$B8F6ED
	JMP.w CODE_B8F3C3			;$B8F6F0

CODE_B8F6F3:
	LDA.w #$0004				;$B8F6F3
	JMP.w CODE_B8F3CB			;$B8F6F6

CODE_B8F6F9:
	JSL.l CODE_B89C4C			;$B8F6F9
	LDA.w #$0040				;$B8F6FD
	JSL.l set_anim_once_handle_kiddy	;$B8F700
	LDX.w follower_kong_sprite		;$B8F704
	LDA.w #$0077				;$B8F707
	STA.b $38,x				;$B8F70A
	LDA.w #$0004				;$B8F70C
	JMP.w CODE_B8F3C3			;$B8F70F

CODE_B8F712:
	JSL.l CODE_B89C4C			;$B8F712
	LDA.w $0006,y				;$B8F716
	AND.w #$FFFB				;$B8F719
	STA.w $0006,y				;$B8F71C
	JSR.w walk_left_action			;$B8F71F
	BRA.b CODE_B8F734			;$B8F722

CODE_B8F724:
	JSL.l CODE_B89C4C			;$B8F724
	LDA.w $0006,y				;$B8F728
	AND.w #$FFFB				;$B8F72B
	STA.w $0006,y				;$B8F72E
	JSR.w CODE_B8D448			;$B8F731
CODE_B8F734:
	LDA.w #$0073				;$B8F734
	STA.b $38,x				;$B8F737
	LDA.w #$0002				;$B8F739
	JSL.l set_anim_once_handle_kiddy	;$B8F73C
	LDX.b current_sprite			;$B8F740
	STZ.b $2E,x				;$B8F742
	JSR.w CODE_B8F62C			;$B8F744
	LDA.w #$0004				;$B8F747
	JMP.w CODE_B8F3C3			;$B8F74A

CODE_B8F74D:
	JSL.l CODE_B89C4C			;$B8F74D
	LDA.w $0006,y				;$B8F751
	ORA.w #$0004				;$B8F754
	STA.w $0006,y				;$B8F757
	JSR.w walk_left_action			;$B8F75A
	BRA.b CODE_B8F76F			;$B8F75D

CODE_B8F75F:
	JSL.l CODE_B89C4C			;$B8F75F
	LDA.w $0006,y				;$B8F763
	ORA.w #$0004				;$B8F766
	STA.w $0006,y				;$B8F769
	JSR.w CODE_B8D448			;$B8F76C
CODE_B8F76F:
	LDA.w #$0073				;$B8F76F
	STA.b $38,x				;$B8F772
	LDA.w #$0004				;$B8F774
	JSL.l set_anim_once_handle_kiddy	;$B8F777
	LDX.b current_sprite			;$B8F77B
	STZ.b $2E,x				;$B8F77D
	JSR.w CODE_B8F62C			;$B8F77F
	LDA.w #$0004				;$B8F782
	JMP.w CODE_B8F3C3			;$B8F785

CODE_B8F788:
	LDY.w $04FB				;$B8F788
	LDA.w $0006,y				;$B8F78B
	AND.w #$FFFB				;$B8F78E
	STA.w $0006,y				;$B8F791
	BRA.b CODE_B8F7A4			;$B8F794

CODE_B8F796:
	LDY.w $04FB				;$B8F796
	LDA.w $0006,y				;$B8F799
	ORA.w #$0004				;$B8F79C
	STA.w $0006,y				;$B8F79F
	BRA.b CODE_B8F7A4			;$B8F7A2

CODE_B8F7A4:
	LDA.w $0004,x				;$B8F7A4
	STA.w $1941				;$B8F7A7
	JSL.l CODE_B89C4C			;$B8F7AA
	LDA.b $12,x				;$B8F7AE
	STA.w $1943				;$B8F7B0
	LDA.w #$0073				;$B8F7B3
	STA.b $38,x				;$B8F7B6
	LDA.w #$0002				;$B8F7B8
	JSL.l set_anim_once_handle_kiddy	;$B8F7BB
	LDX.b current_sprite			;$B8F7BF
	STZ.b $2E,x				;$B8F7C1
	LDA.w $1941				;$B8F7C3
	CMP.w $1943				;$B8F7C6
	BEQ.b CODE_B8F7D8			;$B8F7C9
	BCS.b CODE_B8F7D2			;$B8F7CB
	JSR.w walk_left_action			;$B8F7CD
	BRA.b CODE_B8F7D5			;$B8F7D0

CODE_B8F7D2:
	JSR.w CODE_B8D448			;$B8F7D2
CODE_B8F7D5:
	JSR.w CODE_B8F62C			;$B8F7D5
CODE_B8F7D8:
	LDA.w #$0006				;$B8F7D8
	JMP.w CODE_B8F3C3			;$B8F7DB

CODE_B8F7DE:
	JSL.l CODE_B89C4C			;$B8F7DE
	JSL.l CODE_B8E15A			;$B8F7E2
	BRA.b CODE_B8F7F0			;$B8F7E6

CODE_B8F7E8:
	JSL.l CODE_B89C4C			;$B8F7E8
	JSL.l CODE_B8E15A			;$B8F7EC
CODE_B8F7F0:
	JSL.l CODE_B8E198			;$B8F7F0
	LDA.w #$0008				;$B8F7F4
	JSL.l set_anim_handle_kiddy		;$B8F7F7
	LDX.b current_sprite			;$B8F7FB
	LDA.w #$0073				;$B8F7FD
	STA.b $38,x				;$B8F800
	JSR.w CODE_B8F62C			;$B8F802
	LDA.w #$0004				;$B8F805
	JMP.w CODE_B8F3C3			;$B8F808

CODE_B8F80B:
	JSL.l CODE_B9A595			;$B8F80B
	LDA.w $05AF				;$B8F80F
	AND.w #$4000				;$B8F812
	BEQ.b CODE_B8F81F			;$B8F815
	LDX.w follower_kong_sprite		;$B8F817
	LDA.w #$0033				;$B8F81A
	STA.b $38,x				;$B8F81D
CODE_B8F81F:
	JMP.w CODE_B8F3CA			;$B8F81F

CODE_B8F822:
	LDX.w active_kong_sprite		;$B8F822
	LDA.b $1E,x				;$B8F825
	AND.w #$CFFF				;$B8F827
	ORA.w #$2000				;$B8F82A
	STA.b $1E,x				;$B8F82D
	LDX.w follower_kong_sprite		;$B8F82F
	LDA.b $1E,x				;$B8F832
	AND.w #$CFFF				;$B8F834
	ORA.w #$2000				;$B8F837
	STA.b $1E,x				;$B8F83A
	LDA.w #$0004				;$B8F83C
	JMP.w CODE_B8F3CB			;$B8F83F

CODE_B8F842:
	LDX.w active_kong_sprite		;$B8F842
	LDA.b $1E,x				;$B8F845
	ORA.w #$3000				;$B8F847
	STA.b $1E,x				;$B8F84A
	LDA.w #$0004				;$B8F84C
	JMP.w CODE_B8F3CB			;$B8F84F

CODE_B8F852:
	LDX.w follower_kong_sprite		;$B8F852
	LDA.b $1E,x				;$B8F855
	ORA.w #$3000				;$B8F857
	STA.b $1E,x				;$B8F85A
	LDA.w #$0004				;$B8F85C
	JMP.w CODE_B8F3CB			;$B8F85F

CODE_B8F862:
	LDA.w $05AF				;$B8F862
	AND.w #$4000				;$B8F865
	BEQ.b CODE_B8F870			;$B8F868
	LDA.w #$0006				;$B8F86A
	JMP.w CODE_B8F3CB			;$B8F86D

CODE_B8F870:
	LDA.w $0004,x				;$B8F870
	LDX.w follower_kong_sprite		;$B8F873
	STA.b $5C,x				;$B8F876
	JSL.l CODE_B89C3C			;$B8F878
	LDA.w #$0074				;$B8F87C
	STA.b $38,x				;$B8F87F
	LDA.w #$0300				;$B8F881
	STA.b $12,x				;$B8F884
	LDA.w #$01A0				;$B8F886
	STA.b $16,x				;$B8F889
	LDA.b $1E,x				;$B8F88B
	ORA.w #$4000				;$B8F88D
	STA.b $1E,x				;$B8F890
	LDA.w $0006,y				;$B8F892
	AND.w #$FFFB				;$B8F895
	STA.w $0006,y				;$B8F898
	JSR.w walk_left_action			;$B8F89B
	JSL.l CODE_B8E15A			;$B8F89E
	JSL.l CODE_B8E198			;$B8F8A2
	LDA.w #$0008				;$B8F8A6
	JSL.l set_anim_handle_kiddy		;$B8F8A9
	JSL.l CODE_B89C4C			;$B8F8AD
	LDA.w #$0006				;$B8F8B1
	JMP.w CODE_B8F3CB			;$B8F8B4

CODE_B8F8B7:
	LDA.w #$0006				;$B8F8B7
	STA.w $078F				;$B8F8BA
	LDA.w #$0004				;$B8F8BD
	JMP.w CODE_B8F3C3			;$B8F8C0

CODE_B8F8C3:
	LDY.w #$036C				;$B8F8C3
	JSL.l CODE_BB8585			;$B8F8C6
	LDY.w #$036E				;$B8F8CA
	JSL.l CODE_BB8585			;$B8F8CD
	LDY.w #$035C				;$B8F8D1
	JSL.l CODE_BB85B5			;$B8F8D4
	LDX.b alternate_sprite			;$B8F8D8
	LDA.w #$0005				;$B8F8DA
	STA.b $5C,x				;$B8F8DD
	LDA.w #$0004				;$B8F8DF
	JMP.w CODE_B8F3C3			;$B8F8E2

CODE_B8F8E5:
	LDY.w $0004,x				;$B8F8E5
	JSL.l CODE_BB8585			;$B8F8E8
	LDA.w #$0006				;$B8F8EC
	JMP.w CODE_B8F3C3			;$B8F8EF

CODE_B8F8F2:
	JSL.l CODE_B89C3C			;$B8F8F2
	LDA.w $0006,y				;$B8F8F6
	ORA.w #$0004				;$B8F8F9
	STA.w $0006,y				;$B8F8FC
	JSR.w CODE_B8D448			;$B8F8FF
	STZ.b $2E,x				;$B8F902
	LDA.w #$0002				;$B8F904
	JSL.l set_anim_once_handle_kiddy	;$B8F907
	LDX.b current_sprite			;$B8F90B
	LDA.w #$0072				;$B8F90D
	STA.b $38,x				;$B8F910
	JSL.l CODE_B89C4C			;$B8F912
	LDA.w #$0004				;$B8F916
	JMP.w CODE_B8F3C3			;$B8F919

CODE_B8F91C:
	JSL.l CODE_B89C4C			;$B8F91C
	LDA.w $0006,y				;$B8F920
	AND.w #$FFFB				;$B8F923
	STA.w $0006,y				;$B8F926
	JSR.w walk_left_action			;$B8F929
	STZ.b $2E,x				;$B8F92C
	LDA.w #$0002				;$B8F92E
	JSL.l set_anim_once_handle_kiddy	;$B8F931
	LDX.b current_sprite			;$B8F935
	LDA.w #$0072				;$B8F937
	STA.b $38,x				;$B8F93A
	LDA.w #$0004				;$B8F93C
	JMP.w CODE_B8F3C3			;$B8F93F

CODE_B8F942:
	JSL.l CODE_B89C3C			;$B8F942
	LDA.w #$02B0				;$B8F946
	STA.b $12,x				;$B8F949
	LDA.w #$01E0				;$B8F94B
	STA.b $16,x				;$B8F94E
	LDA.w #$FF40				;$B8F950
	STA.b $2A,x				;$B8F953
	STA.b $30,x				;$B8F955
	LDA.b $1E,x				;$B8F957
	ORA.w #$4000				;$B8F959
	STA.b $1E,x				;$B8F95C
	LDA.w #$003F				;$B8F95E
	JSL.l set_anim_once_handle_kiddy	;$B8F961
	JSR.w CODE_B8F994			;$B8F965
	JSL.l CODE_B89C4C			;$B8F968
	LDA.w #$0160				;$B8F96C
	STA.b $12,x				;$B8F96F
	LDA.w #$01E0				;$B8F971
	STA.b $16,x				;$B8F974
	LDA.w #$00C0				;$B8F976
	STA.b $2A,x				;$B8F979
	STA.b $30,x				;$B8F97B
	LDA.b $1E,x				;$B8F97D
	AND.w #$BFFF				;$B8F97F
	STA.b $1E,x				;$B8F982
	LDA.w #$003F				;$B8F984
	JSL.l set_anim_once_handle_kiddy	;$B8F987
	JSR.w CODE_B8F994			;$B8F98B
	LDA.w #$0004				;$B8F98E
	JMP.w CODE_B8F3C3			;$B8F991

CODE_B8F994:
	LDX.b current_sprite			;$B8F994
	LDA.w #$0007				;$B8F996
	CPX.w $0501				;$B8F999
	BEQ.b CODE_B8F99F			;$B8F99C
	INC					;$B8F99E
CODE_B8F99F:
	JSL.l CODE_BB85A0			;$B8F99F
	RTS					;$B8F9A3

CODE_B8F9A4:
	JSL.l CODE_B89C4C			;$B8F9A4
	LDA.w $0006,y				;$B8F9A8
	ORA.w #$0004				;$B8F9AB
	STA.w $0006,y				;$B8F9AE
	JSR.w CODE_B8D448			;$B8F9B1
	LDA.w #$0004				;$B8F9B4
	JSL.l set_anim_once_handle_kiddy	;$B8F9B7
	LDX.b current_sprite			;$B8F9BB
	LDA.w #$0072				;$B8F9BD
	STA.b $38,x				;$B8F9C0
	STZ.b $2E,x				;$B8F9C2
	JSR.w CODE_B8F62C			;$B8F9C4
	LDA.w #$0004				;$B8F9C7
	JMP.w CODE_B8F3C3			;$B8F9CA

CODE_B8F9CD:
	JSL.l CODE_B89C4C			;$B8F9CD
	JSL.l CODE_B8E179			;$B8F9D1
	JSL.l CODE_B8E198			;$B8F9D5
	LDA.w #$0008				;$B8F9D9
	JSL.l set_anim_handle_kiddy		;$B8F9DC
	LDX.b current_sprite			;$B8F9E0
	LDA.w #$0076				;$B8F9E2
	STA.b $38,x				;$B8F9E5
	JSR.w CODE_B8F62C			;$B8F9E7
	LDA.w #$0004				;$B8F9EA
	JMP.w CODE_B8F3C3			;$B8F9ED

CODE_B8F9F0:
	JSL.l CODE_BCE2D4			;$B8F9F0
	LDA.w #$0004				;$B8F9F4
	JMP.w CODE_B8F3CB			;$B8F9F7

CODE_B8F9FA:
	LDY.w $0004,x				;$B8F9FA
	LDA.w $0006,x				;$B8F9FD
	STA.w $0000,y				;$B8FA00
	LDA.w #$0008				;$B8FA03
	JMP.w CODE_B8F3CB			;$B8FA06

CODE_B8FA09:
	LDA.w $0004,x				;$B8FA09
	AND.w $194F				;$B8FA0C
	BEQ.b CODE_B8FA1A			;$B8FA0F
	TRB.w $194F				;$B8FA11
	LDA.w #$0006				;$B8FA14
	JMP.w CODE_B8F3CB			;$B8FA17

CODE_B8FA1A:
	JMP.w CODE_B8F3CA			;$B8FA1A
