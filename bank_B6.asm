CODE_B68000:
	JMP.w !null_pointer			;$B68000

CODE_B68003:
	JMP CODE_B6F359				;$B68003

CODE_B68006:
	JMP CODE_B69232				;$B68006

CODE_B68009:
	JMP CODE_B6F3DA				;$B68009

CODE_B6800C:
	JMP CODE_B6F3E7				;$B6800C

CODE_B6800F:
	JMP CODE_B6F3F8				;$B6800F

CODE_B68012:
	JMP CODE_B6F3AB				;$B68012

CODE_B68015:
	JMP CODE_B6840E				;$B68015 platform sprite related?

CODE_B68018:
	JMP.w !null_pointer			;$B68018

CODE_B6801B:
	JMP.w !null_pointer			;$B6801B

CODE_B6801E:
	JMP defeat_sprite_using_anim_global	;$B6801E

CODE_B68021:
	JMP CODE_B680A5				;$B68021

CODE_B68024:
	JMP CODE_B680C9				;$B68024

CODE_B68027:
	JMP.w !null_pointer			;$B68027

CODE_B6802A:
	JMP.w !null_pointer			;$B6802A

CODE_B6802D:
	JMP CODE_B6F2AD				;$B6802D X speed related

CODE_B68030:
	JMP CODE_B6F2C5				;$B68030 Y speed related

CODE_B68033:
	JMP CODE_B6AFB5				;$B68033

CODE_B68036:
	JMP CODE_B6B3C6				;$B68036 Sets an animation

CODE_B68039:
	JMP CODE_B68360				;$B68039 Generic platform sprite routine

CODE_B6803C:
	JMP CODE_B683AF				;$B6803C

CODE_B6803F:
	JMP CODE_B6F1EA				;$B6803F

CODE_B68042:
	JMP CODE_B6F0C6				;$B68042 Sprite palette related

CODE_B68045:
	JMP CODE_B6F532				;$B68045

CODE_B68048:
	JMP CODE_B6F4E0				;$B68048

CODE_B6804B:
	JMP CODE_B6F108				;$B6804B

CODE_B6804E:
	JMP CODE_B6DFF9				;$B6804E

CODE_B68051:
	JMP CODE_B6F186				;$B68051

CODE_B68054:
	JMP CODE_B6F272				;$B68054 Moves sprite in Y to sprite in X


;unknown_sprite_0128_main does nothing...
;...but without it neither the player nor cranky are able to hit the targets in the swanky minigame.
null_sprite_main:
unknown_sprite_0128_main:
	JML [$04F5]				;$B68057


unknown_sprite_0138_main:
barrel_switch_s_main:
return_handle_despawn:
	JSL.l CODE_BBAB52			;$B6805A
	JML [$04F5]				;$B6805E


water_splash_main:
smoke_puff_main:
	JSL.l process_current_movement		;$B68061
fireball_landing_particles_main:
burst_effect_main:
	JSL.l process_sprite_animation		;$B68065
	JMP.w return_handle_despawn		;$B68069


bottom_of_right_ctc_waterfall_main:
bottom_of_ctc_waterfall_main:
	JSL.l process_sprite_animation		;$B6806C
	JML [$04F5]				;$B68070


unknown_sprite_0008_main:
	JSL.l process_sprite_animation		;$B68073
	JML [$04F5]				;$B68077


unknown_sprite_000C_main:
	JSL.l process_sprite_animation		;$B6807A
	JML [$04F5]				;$B6807E


defeat_sprite_using_anim_global:
	JSR defeat_sprite_using_animation	;$B68081
	RTL					;$B68084


defeat_sprite_using_animation:
	JSL set_sprite_animation		;$B68085
	JSL CODE_BB85AC				;$B68089
	LDX current_sprite			;$B6808D
	STZ $08,x				;$B6808F
	LDA #$0005				;$B68091
	STA $0A,x				;$B68094
	LDA $1E,x				;$B68096
	ORA #$3000				;$B68098
	STA $1E,x				;$B6809B
	LDA #$00F4				;$B6809D
	STA $0E,x				;$B680A0
	STZ $3A,x				;$B680A2
	RTS					;$B680A4

CODE_B680A5:
	JSR CODE_B680A9				;$B680A5
	RTL					;$B680A8

CODE_B680A9:
	DEC $051D				;$B680A9
	LDX $78					;$B680AC
	LDA #$0100				;$B680AE
	BIT $1E,x				;$B680B1
	BVC CODE_B680B8				;$B680B3
	LDA #$FF00				;$B680B5
CODE_B680B8:
	LDX current_sprite			;$B680B8
	STA $30,x				;$B680BA
	STA $2A,x				;$B680BC
	LDA #$F800				;$B680BE
	STA $2E,x				;$B680C1
	LDA #$0004				;$B680C3
	STA $5A,x				;$B680C6
	RTS					;$B680C8

CODE_B680C9:
	LDX.b current_sprite			;$B680C9
	LDA.l DATA_FF1BC0+$02			;$B680CB
	STA.b $06,x				;$B680CF
	JSL.l CODE_BBAB29			;$B680D1
	BCC.b CODE_B680DB			;$B680D5
	JSL.l CODE_BB8597			;$B680D7
CODE_B680DB:
	JML [$04F5]				;$B680DB


;Sneek variables:
;	$6A,x   Timer until idle sound effect plays	

sneek_main:
	JMP (.state_table,x)			;$B680DE

.state_table:
	dw .idle
	dw .defeated
	dw .stampede_wait_for_ellie
	dw .dummy

.idle:
	TYX					;$B680E9  \ Get Sneek sprite
	INC sprite.general_purpose_6A,x		;$B680EA   | Increase sound effect timer
	LDA sprite.general_purpose_6A,x		;$B680EC   |
	CMP #$004B				;$B680EE   |
	BNE ..no_sound				;$B680F1   | If timer not done, dont play sound 
	STZ sprite.general_purpose_6A,x		;$B680F3   | Else reset timer
	LDA #$063D				;$B680F5   | 
	JSL queue_sound_effect			;$B680F8  / Queue Sneek idle sound effect
..no_sound:
	LDA #$0038				;$B680FC  \ Get collision flags
	JSL check_throwable_collision		;$B680FF   | Check throwable collision
	BCS ..throwable_collision_happened	;$B68103   |
	JSL populate_sprite_clipping		;$B68105   | Else populate clipping
	LDA #$08A8				;$B68109   | Get collision flags
	JSL CODE_BEC009				;$B6810C   | Check complex player collision
	BCC ..failed_defeat_or_no_collision	;$B68110   |
	CMP #$0002				;$B68112   | Check if we succeeded in defeating him
	BEQ ..defeated_in_kong_collision	;$B68115  / If yes load normal defeat sound and defeat sneek
..failed_defeat_or_no_collision:
	JSL process_sprite_animation		;$B68117  \ Process animation
	JSL process_current_movement		;$B6811B   | Process current movement
	JMP return_handle_despawn		;$B6811F  / Return and handle despawn

..throwable_collision_happened:
	LDA #$063C				;$B68122  \ Get defeated by throwable sound effect
	BRA ..defeat_sprite			;$B68125  /

..defeated_in_kong_collision:
	LDA #$063B				;$B68127  |> Get defeated by kong sound effect
..defeat_sprite:
	JSL queue_sound_effect			;$B6812A  \  Play defeated sound
	LDA #$0137				;$B6812E   |
	JSR defeat_sprite_using_animation	;$B68131   | Set sneek death animation
	JSR CODE_B680A9				;$B68134   | Make him fall offscreen
	INC sprite.state,x			;$B68137   | Set defeated state
	JMP return_handle_despawn		;$B68139  /

.defeated:
	JSL process_current_movement		;$B6813C  \ Process current movement
	JSL process_sprite_animation		;$B68140   | Process animation
	JMP CODE_B680C9				;$B68144  / Return and handle despawn

.stampede_wait_for_ellie:
	LDX active_kong_sprite			;$B68147  \ Get kong sprite
	LDA sprite.state,x			;$B6814A   | Get kong state
	CMP #$006B				;$B6814C   | Check if in state 6B (Ellie scared)
	BEQ ..set_scare_animation		;$B6814F   | If yes set scare Ellie animation
	JSL process_current_movement		;$B68151   | Else process current movement
	JSL process_sprite_animation		;$B68155   | Process animation
	JMP return_handle_despawn		;$B68159  / Return and handle despawn

..set_scare_animation:
	TYX					;$B6815C  \ Get sneek sprite
	INC sprite.state,x			;$B6815D   | Set dummy state
	LDA.b #$0138				;$B6815F   |
	JSL set_sprite_animation		;$B68162   | Set sneek scare Ellie animation
	JMP return_handle_despawn		;$B68166  / Return and handle despawn

.dummy:
	JSL process_sprite_animation		;$B68169  \ Process animation
	JMP return_handle_despawn		;$B6816D  / Return and handle despawn


buzz_main:
	JMP (.state_table,x)			;$B68170  |>

.state_table:
	dw .state_0
	dw .state_1
	dw .defeated
	dw .state_3

.state_0:
	LDA #$0038				;$B6817B  \
	JSL check_throwable_collision		;$B6817E   |
	BCS .CODE_B681AC			;$B68182  /
.CODE_B68184:
	JSL populate_sprite_clipping		;$B68184  \
	LDA #$0000				;$B68188   |
	JSL CODE_BEC009				;$B6818B   |
	BCC .CODE_B68193			;$B6818F   |
	BNE .CODE_B681AC			;$B68191  /
.CODE_B68193:
	JSL process_sprite_animation		;$B68193  \
	JSL process_current_movement		;$B68197   |
	JSR CODE_B68212				;$B6819B   |
	JMP return_handle_despawn		;$B6819E  /

.state_1:
	LDA #$0020				;$B681A1  \
	JSL check_throwable_collision		;$B681A4   |
	BCC .CODE_B68184			;$B681A8   |
	BNE .CODE_B68184			;$B681AA  /
.CODE_B681AC:
	LDA #$013D				;$B681AC  \
	JSR defeat_sprite_using_animation	;$B681AF   |
	JSR CODE_B680A9				;$B681B2   |
	LDA #$0002				;$B681B5   |
	STA sprite.state,x			;$B681B8   |
	JMP return_handle_despawn		;$B681BA  /

.defeated:
	JSL process_current_movement		;$B681BD  \
	JSL process_sprite_animation		;$B681C1   |
	JMP CODE_B680C9				;$B681C5  /

.state_3:
	LDA #$0120				;$B681C8  \
	JSL check_throwable_collision		;$B681CB   |
	BCS .CODE_B681F3			;$B681CF   |
	LDA $18E9				;$B681D1   |
	DEC					;$B681D4   |
	BEQ .CODE_B681E5			;$B681D5   |
	JSL populate_sprite_clipping		;$B681D7   |
	INC $1860				;$B681DB   |
	LDA #$0055				;$B681DE   |
	JSL CODE_BEC009				;$B681E1  /
.CODE_B681E5:
	JSL process_sprite_animation		;$B681E5  \
	JSL process_current_movement		;$B681E9   |
	JSR CODE_B68212				;$B681ED   |
	JMP return_handle_despawn		;$B681F0  /

.CODE_B681F3:
	LDX current_sprite			;$B681F3  \
	LDA #$002F				;$B681F5   |
	JSL CODE_BB85A0				;$B681F8   |
	LDA #$013D				;$B681FC   |
	JSR defeat_sprite_using_animation	;$B681FF   |
	JSR CODE_B680A9				;$B68202   |
	LDA #$FF80				;$B68205   |
	STA sprite.y_speed,x			;$B68208   |
	LDA #$0002				;$B6820A   |
	STA sprite.state,x			;$B6820D   |
	JMP return_handle_despawn		;$B6820F  /

CODE_B68212:
	LDA #$0644				;$B68212  \
	JSL CODE_B28024				;$B68215   |
	LDA #$0545				;$B68219   |
	JSL CODE_B28024				;$B6821C   |
	RTS					;$B68220  /


;Koco variables:
;	$6A,x   Timer that does nothing when it stops. Perhaps would have been for a sound effect.

koco_main:
	JMP (.state_table,x)			;$B68221

.state_table:
	dw .idle
	dw .defeated

.idle:
	JSL populate_sprite_clipping		;$B68228  \
	LDA #$0000				;$B6822C   |
	LDX #$0000				;$B6822F   | Get collision flags
	LDY #$00A0				;$B68232   |
	JSL CODE_BEC024				;$B68235   | Check collision
	BCC ..failed_defeat_or_no_collision	;$B68239   |
	CMP #$0002				;$B6823B   | Check if we succeeded in defeating him
	BEQ ..defeated_in_kong_collision	;$B6823E  / If yes, defeat Koco
..failed_defeat_or_no_collision:
	JSR CODE_B68CF3				;$B68240  \ Else handle Fish Food Frenzy related things
	INC sprite.general_purpose_6A,x		;$B68243   | Increase a timer
	LDA sprite.general_purpose_6A,x		;$B68245   |
	CMP #$004B				;$B68247   | Check if timer is done
	BNE ..return				;$B6824A   | If not, return
	STZ sprite.general_purpose_6A,x		;$B6824C  / Else reset timer
..return:
	JSL process_sprite_animation		;$B6824E  \
	JSL process_current_movement		;$B68252   | Process current movement
	JMP return_handle_despawn		;$B68256  / Return and handle despawn

..defeated_in_kong_collision:
	LDA #$0140				;$B68259  \
	JSR defeat_sprite_using_animation	;$B6825C   | Set Koco defeated animation
	JSR CODE_B680A9				;$B6825F   | Make him fall offscreen
	INC sprite.state,x			;$B68262   | Set defeated state
	JMP return_handle_despawn		;$B68264  / Return and handle despawn

.defeated:
	JSL process_current_movement		;$B68267  \ Process current movement
	JSL process_sprite_animation		;$B6826B   |
	JMP CODE_B680C9				;$B6826F  / Return and handle despawn


mill_platform_main:
	JMP.w (DATA_B68275,x)			;$B68272

DATA_B68275:
	dw CODE_B68283
	dw CODE_B68286
	dw CODE_B68296
	dw CODE_B682AB
	dw CODE_B682E5
	dw CODE_B682FE
	dw CODE_B68313

CODE_B68283:
	JSR.w CODE_B6834B			;$B68283
CODE_B68286:
	JSR.w set_platform_hitbox_position 	;$B68286 / set_standable_hitbox_pos
	JSR.w CODE_B683B3			;$B68289 / set_standable_hitbox_range?
	LDA.w #CODE_B68360			;$B6828C
	JSL.l CODE_BB85D6			;$B6828F
	JMP.w return_handle_despawn		;$B68293

CODE_B68296:
	TYX					;$B68296
	STZ.b $68,x				;$B68297
	JSR.w CODE_B6834B			;$B68299
	LDY.w #$031A				;$B6829C
	JSL.l CODE_BB8585			;$B6829F
	LDY.b alternate_sprite			;$B682A3
	LDX.b current_sprite			;$B682A5
	STX.b $40,y				;$B682A7
	STY.b $40,x				;$B682A9
CODE_B682AB:
	TYX					;$B682AB
	LDA.b $46,x				;$B682AC
	BEQ.b CODE_B682BA			;$B682AE
	BMI.b CODE_B682DA			;$B682B0
	LDY.b $68,x				;$B682B2
	BEQ.b CODE_B682BA			;$B682B4
	STA.b $5A,x				;$B682B6
	STZ.b $46,x				;$B682B8
CODE_B682BA:
	JSR.w set_platform_hitbox_position	;$B682BA
	JSR.w CODE_B683B3			;$B682BD
	JSR.w CODE_B682E8			;$B682C0
	LDA.w #CODE_B68356			;$B682C3
	JSL.l CODE_BB85D6			;$B682C6
	JSL.l CODE_BBAB52			;$B682CA
	BCC.b CODE_B682D7			;$B682CE
	LDA.b $40,x				;$B682D0
	TAX					;$B682D2
	JSL.l CODE_BB85E8			;$B682D3
CODE_B682D7:
	JML [$04F5]				;$B682D7

CODE_B682DA:
	INC.b $46,x				;$B682DA
	BMI.b CODE_B682BA			;$B682DC
	LDA.w #$0009				;$B682DE
	STA.b $5A,x				;$B682E1
	BRA.b CODE_B682BA			;$B682E3

CODE_B682E5:
	JML [$04F5]				;$B682E5

CODE_B682E8:
	LDY.b $40,x				;$B682E8
	LDA.b $12,x				;$B682EA
	STA.w $0012,y				;$B682EC
	LDA.b $16,x				;$B682EF
	STA.w $0016,y				;$B682F1
	SEP.b #$20				;$B682F4
	LDA.b $59,x				;$B682F6
	STA.w $0059,y				;$B682F8
	REP.b #$20				;$B682FB
	RTS					;$B682FD

CODE_B682FE:
	TYX					;$B682FE
	STZ.b $68,x				;$B682FF
	JSR.w CODE_B6834B			;$B68301
	LDY.w #$034C				;$B68304
	JSL.l CODE_BB8585			;$B68307
	LDY.b alternate_sprite			;$B6830B
	LDX.b current_sprite			;$B6830D
	STX.b $40,y				;$B6830F
	STY.b $40,x				;$B68311
CODE_B68313:
	TYX					;$B68313
	LDA.b $46,x				;$B68314
	BEQ.b CODE_B68323			;$B68316
	BMI.b CODE_B68340			;$B68318
	BIT.w $194F				;$B6831A
	BPL.b CODE_B68323			;$B6831D
	STA.b $5A,x				;$B6831F
	STZ.b $46,x				;$B68321
CODE_B68323:
	JSR.w set_platform_hitbox_position	;$B68323
	JSR.w CODE_B682E8			;$B68326
	LDA.w #CODE_B68356			;$B68329
	JSL.l CODE_BB85D6			;$B6832C
	JSL.l CODE_BBAB52			;$B68330
	BCC.b CODE_B6833D			;$B68334
	LDA.b $40,x				;$B68336
	TAX					;$B68338
	JSL.l CODE_BB85E8			;$B68339
CODE_B6833D:
	JML [$04F5]				;$B6833D

CODE_B68340:
	INC.b $46,x				;$B68340
	BMI.b CODE_B68323			;$B68342
	LDA.w #$0009				;$B68344
	STA.b $5A,x				;$B68347
	BRA.b CODE_B68323			;$B68349

CODE_B6834B:
	JSL.l CODE_B6840E			;$B6834B
	STZ.b $6A,x				;$B6834F
	STZ.b $6C,x				;$B68351
	INC.b $38,x				;$B68353
	RTS					;$B68355

CODE_B68356:
	LDX.b current_sprite			;$B68356
	LDA.b $48,x				;$B68358
	JSL.l CODE_BEC01B			;$B6835A
	BRA.b CODE_B68364			;$B6835E

CODE_B68360:
	JSL.l CODE_BEC018			;$B68360
CODE_B68364:
	BCC.b CODE_B6839F			;$B68364
	BEQ.b CODE_B6839E			;$B68366
	LDX.b alternate_sprite			;$B68368 / Get sprite that just landed on platform
	LDA.b $2E,x				;$B6836A
	BMI.b CODE_B683A4			;$B6836C
	LDY.b $00,x 				;$B6836E / Get sprite id	
	LDX.b current_sprite			;$B68370 / Get platform sprite
	LDA.w #$0600				;$B68372
	CPY.w #!sprite_dixie_kong 		;$B68375 / Check if sprite riding platform is dixie
	BEQ.b CODE_B68387			;$B68378
	LDA.w #$0A00				;$B6837A
	CPY.w #!sprite_kiddy_kong 		;$B6837D / Else check if kiddy
	BEQ.b CODE_B68387			;$B68380
	LDA.w #$0800				;$B68382
	BRA.b CODE_B68391			;$B68385

CODE_B68387:
	PHA					;$B68387
	SEP.b #$20				;$B68388
	LDA.b #$01				;$B6838A
	STA.b $68,x 				;$B6838C / Tell platform sprite that a kong is riding it
	REP.b #$20				;$B6838E
	PLA					;$B68390
CODE_B68391:
	CMP.b $6A,x				;$B68391
	BCC.b CODE_B6839E			;$B68393
	STA.b $6A,x				;$B68395
	LDA.w #$0763				;$B68397
	JSL.l queue_sound_effect 		;$B6839A / Play platform sound effect
CODE_B6839E:
	RTL					;$B6839E

CODE_B6839F:
	LDX.b current_sprite			;$B6839F
	STZ.b $68,x				;$B683A1
	RTL					;$B683A3

CODE_B683A4:
	LDX.b current_sprite			;$B683A4
	SEP.b #$20				;$B683A6
	LDA.b #$01				;$B683A8
	STA.b $68,x				;$B683AA
	REP.b #$20				;$B683AC
	RTL					;$B683AE

CODE_B683AF:
	JSR.w CODE_B683B3			;$B683AF
	RTL					;$B683B2

CODE_B683B3:
	LDA.b $6A,x				;$B683B3
	SEC					;$B683B5
	BNE.b CODE_B683E6			;$B683B6
	SBC.b $6C,x				;$B683B8
	BEQ.b CODE_B683E3			;$B683BA
CODE_B683BC:
	CMP.w #$8000				;$B683BC
	ROR					;$B683BF
	CMP.w #$8000				;$B683C0
	ROR					;$B683C3
	CMP.w #$FE00				;$B683C4
	BCS.b CODE_B683CE			;$B683C7
	LDA.w #$FE00				;$B683C9
	BRA.b CODE_B683D6			;$B683CC

CODE_B683CE:
	CMP.w #$FFE0				;$B683CE
	BCC.b CODE_B683D6			;$B683D1
	LDA.w #$FFE0				;$B683D3
CODE_B683D6:
	CLC					;$B683D6
	ADC.b $6C,x				;$B683D7
	STA.b $6C,x				;$B683D9
	CMP.b $6A,x				;$B683DB
	BPL.b CODE_B68408			;$B683DD
	STZ.b $6A,x				;$B683DF
	STZ.b $6C,x				;$B683E1
CODE_B683E3:
	STZ.b $58,x				;$B683E3
	RTS					;$B683E5

CODE_B683E6:
	SBC.b $6C,x				;$B683E6
	BMI.b CODE_B683BC			;$B683E8
	LSR					;$B683EA
	CMP.w #$0300				;$B683EB
	BCC.b CODE_B683F5			;$B683EE
	LDA.w #$0300				;$B683F0
	BRA.b CODE_B683FD			;$B683F3

CODE_B683F5:
	CMP.w #$0040				;$B683F5
	BCS.b CODE_B683FD			;$B683F8
	LDA.w #$0040				;$B683FA
CODE_B683FD:
	CLC					;$B683FD
	ADC.b $6C,x				;$B683FE
	STA.b $6C,x				;$B68400
	CMP.b $6A,x				;$B68402
	BMI.b CODE_B68408			;$B68404
	STZ.b $6A,x				;$B68406
CODE_B68408:
	AND.w #$FF00				;$B68408
	STA.b $58,x				;$B6840B
	RTS					;$B6840D

CODE_B6840E:
	LDX.b current_sprite			;$B6840E
	LDA.b $12,x				;$B68410
	STA.b $54,x				;$B68412
	STA.b $2C,x				;$B68414
	LDA.b $16,x				;$B68416
	STA.b $56,x				;$B68418
	STA.b $32,x				;$B6841A
	LDA.b $26,x				;$B6841C
	AND.w #$C000				;$B6841E
	ORA.w #$8001				;$B68421
	STA.b $26,x				;$B68424
	STZ.b $58,x				;$B68426
	RTL					;$B68428

set_platform_hitbox_position:
	LDX current_sprite			;$B68429
	LDA $12,x				;$B6842B
	STA $54,x				;$B6842D
	LDA $16,x				;$B6842F
	STA $56,x				;$B68431
	LDA $2C,x				;$B68433
	STA $12,x				;$B68435
	LDA $32,x				;$B68437
	STA $16,x				;$B68439
	JSL process_current_movement 		;$B6843B
	LDA $2C,x				;$B6843F
	LDY $12,x				;$B68441
	STA $12,x				;$B68443
	STY $2C,x				;$B68445
	LDA $32,x				;$B68447
	LDY $16,x				;$B68449
	STA $16,x				;$B6844B
	STY $32,x				;$B6844D
	RTS					;$B6844F

CODE_B68450:
	LDX.b current_sprite			;$B68450
	LDA.b $12,x				;$B68452
	PHA					;$B68454
	LDA.b $16,x				;$B68455
	PHA					;$B68457
	LDA.b $2C,x				;$B68458
	STA.b $12,x				;$B6845A
	LDA.b $32,x				;$B6845C
	STA.b $16,x				;$B6845E
	JSL.l process_current_movement		;$B68460
	LDA.b $2C,x				;$B68464
	LDY.b $12,x				;$B68466
	STA.b $12,x				;$B68468
	STY.b $2C,x				;$B6846A
	LDA.b $32,x				;$B6846C
	LDY.b $16,x				;$B6846E
	STA.b $16,x				;$B68470
	STY.b $32,x				;$B68472
	PLA					;$B68474
	STA.b $56,x				;$B68475
	PLA					;$B68477
	STA.b $54,x				;$B68478
	RTS					;$B6847A

buzz_swarm_spawner_main:
	TYX					;$B6847B
	LDY.w active_kong_sprite		;$B6847C
	LDA.b $5C,x				;$B6847F
	SEC					;$B68481
	SBC.w $0012,y				;$B68482
	EOR.b $5E,x				;$B68485
	BPL.b CODE_B684F9			;$B68487
	LDY.w $1B6B				;$B68489
	BEQ.b CODE_B684B6			;$B6848C
	LDA.w $0038,y				;$B6848E
	CMP.w #$0002				;$B68491
	BNE.b CODE_B68504			;$B68494
	LDA.w #$0001				;$B68496
	STA.w $0038,y				;$B68499
	LDA.w $0006,y				;$B6849C
	STA.b $6A				;$B6849F
	LDA.w $1973				;$B684A1
	CMP.w $0016,y				;$B684A4
	BCC.b CODE_B68504			;$B684A7
	LDY.w #$0008				;$B684A9
	LDA.b [$6A],y				;$B684AC
	LDY.w $1B6B				;$B684AE
	STA.w $002E,y				;$B684B1
	BRA.b CODE_B68504			;$B684B4

CODE_B684B6:
	LDY.w #$0082				;$B684B6
	JSL.l CODE_BB8585			;$B684B9
	LDY.b alternate_sprite			;$B684BD
	STY.w $1B6B				;$B684BF
	LDX.b current_sprite			;$B684C2
	LDA.b $5C,x				;$B684C4
	STA.w $0012,y				;$B684C6
	LDA.w $1973				;$B684C9
	STA.w $0016,y				;$B684CC
	LDA.b $4C,x				;$B684CF
	STA.w $0006,y				;$B684D1
	LDA.b $60,x				;$B684D4
	STA.w $0018,y				;$B684D6
	LDA.b $62,x				;$B684D9
	STA.w $006A,y				;$B684DB
	LDA.b $64,x				;$B684DE
	STA.w $0060,y				;$B684E0
	LDA.b $66,x				;$B684E3
	STA.w $005E,y				;$B684E5
	LDA.b $68,x				;$B684E8
	STA.w $006C,y				;$B684EA
	LDA.b $6A,x				;$B684ED
	STA.w $0068,y				;$B684EF
	LDA.b $6C,x				;$B684F2
	STA.w $0064,y				;$B684F4
	BRA.b CODE_B68504			;$B684F7

CODE_B684F9:
	LDY.w $1B6B				;$B684F9
	BEQ.b CODE_B68504			;$B684FC
	LDA.w #$0002				;$B684FE
	STA.w $0038,y				;$B68501
CODE_B68504:
	JMP.w return_handle_despawn		;$B68504

buzz_swarm_main:
	LDA.w #$0562				;$B68507
	JSL.l CODE_B28024			;$B6850A
	JMP.w (DATA_B68511,x)			;$B6850E

DATA_B68511:
	dw CODE_B68517
	dw CODE_B68537
	dw CODE_B685CD

CODE_B68517:
	TYX					;$B68517
	LDY.w #$000A				;$B68518
	LDA.b [$6A],y				;$B6851B
	STA.b $62,x				;$B6851D
	INY					;$B6851F
	INY					;$B68520
	LDA.b [$6A],y				;$B68521
	STA.b $66,x				;$B68523
	INY					;$B68525
	INY					;$B68526
	LDA.b [$6A],y				;$B68527
	STA.b $1A,x				;$B68529
	INY					;$B6852B
	INY					;$B6852C
	LDA.b [$6A],y				;$B6852D
	STA.b $1C,x				;$B6852F
	LDA.b $18,x				;$B68531
	STA.b $2C,x				;$B68533
	INC.b $38,x				;$B68535
CODE_B68537:
	JSR.w CODE_B685ED			;$B68537
	LDY.w active_kong_sprite		;$B6853A
	LDA.w $0012,y				;$B6853D
	CMP.b $6C,x				;$B68540
	BCC.b CODE_B6854D			;$B68542
	CMP.b $68,x				;$B68544
	BCC.b CODE_B6854D			;$B68546
	INC.b $38,x				;$B68548
	JMP.w CODE_B685CD			;$B6854A

CODE_B6854D:
	LDA.w $003A,y				;$B6854D
	BIT.w #$0100				;$B68550
	BNE.b CODE_B68565			;$B68553
	LDA.w $0016,y				;$B68555
	CMP.b $6A,x				;$B68558
	BCC.b CODE_B6857D			;$B6855A
	JSR.w CODE_B6860E			;$B6855C
	JSL.l process_current_movement		;$B6855F
	BRA.b CODE_B685C7			;$B68563

CODE_B68565:
	JSR.w CODE_B6860E			;$B68565
	LDA.b $5E,x				;$B68568
	PHA					;$B6856A
	LDA.w $1973				;$B6856B
	CLC					;$B6856E
	ADC.w #$0010				;$B6856F
	STA.b $5E,x				;$B68572
	JSL.l process_current_movement		;$B68574
	PLA					;$B68578
	STA.b $5E,x				;$B68579
	BRA.b CODE_B685C7			;$B6857B

CODE_B6857D:
	CLC					;$B6857D
	ADC.w #$FFF2				;$B6857E
	CMP.b $16,x				;$B68581
	PHP					;$B68583
	LDY.w #$0008				;$B68584
	LDA.b [$6A],y				;$B68587
	PLP					;$B68589
	BCS.b CODE_B68590			;$B6858A
	EOR.w #$FFFF				;$B6858C
	INC					;$B6858F
CODE_B68590:
	STA.b $34,x				;$B68590
	LDY.w #$000C				;$B68592
	LDA.b [$6A],y				;$B68595
	BIT.b $34,x				;$B68597
	BPL.b CODE_B6859F			;$B68599
	EOR.w #$FFFF				;$B6859B
	INC					;$B6859E
CODE_B6859F:
	STA.b $66,x				;$B6859F
	LDY.w active_kong_sprite		;$B685A1
	LDA.w $0012,y				;$B685A4
	CMP.b $12,x				;$B685A7
	PHP					;$B685A9
	LDY.w #$000A				;$B685AA
	LDA.b [$6A],y				;$B685AD
	PLP					;$B685AF
	BCS.b CODE_B685B6			;$B685B0
	EOR.w #$FFFF				;$B685B2
	INC					;$B685B5
CODE_B685B6:
	STA.b $62,x				;$B685B6
	LDY.w #$0006				;$B685B8
	LDA.b [$6A],y				;$B685BB
	BIT.b $62,x				;$B685BD
	BPL.b CODE_B685C5			;$B685BF
	EOR.w #$FFFF				;$B685C1
	INC					;$B685C4
CODE_B685C5:
	STA.b $30,x				;$B685C5
CODE_B685C7:
	JSR.w CODE_B6861C			;$B685C7
	JMP.w CODE_B685E6			;$B685CA

CODE_B685CD:
	JSR.w CODE_B685ED			;$B685CD
	STZ.b $30,x				;$B685D0
	LDA.w #$FE00				;$B685D2
	STA.b $34,x				;$B685D5
	JSL.l CODE_BBAB46			;$B685D7
	BCC.b CODE_B685E3			;$B685DB
	STZ.w $1B6B				;$B685DD
	JML [$04F5]				;$B685E0

CODE_B685E3:
	JSR.w CODE_B6861C			;$B685E3
CODE_B685E6:
	JSL.l process_sprite_animation		;$B685E6
	JML [$04F5]				;$B685EA

CODE_B685ED:
	JSL.l populate_sprite_clipping		;$B685ED
	LDA.w #$8000				;$B685F1
	JSL.l CODE_BEC009			;$B685F4
	BCC.b CODE_B6860D			;$B685F8
	LDA.l $00185A				;$B685FA
	CMP.w #$0004				;$B685FE
	BNE.b CODE_B6860D			;$B68601
	JSL.l CODE_BEC027			;$B68603
	LDA.b $2E,x				;$B68607
	BMI.b CODE_B6860D			;$B68609
	STZ.b $2E,x				;$B6860B
CODE_B6860D:
	RTS					;$B6860D

CODE_B6860E:
	LDA.w $0012,y				;$B6860E
	STA.b $5C,x				;$B68611
	LDA.b $62,x				;$B68613
	STA.b $30,x				;$B68615
	LDA.b $66,x				;$B68617
	STA.b $34,x				;$B68619
	RTS					;$B6861B

CODE_B6861C:
	LDX.b current_sprite			;$B6861C
	LDA.b $34,x				;$B6861E
	PHA					;$B68620
	LDA.b $30,x				;$B68621
	PHA					;$B68623
	LDA.w #$000E				;$B68624
	JSL.l process_alternate_movement	;$B68627
	LDA.w #$000D				;$B6862B
	JSL.l process_alternate_movement	;$B6862E
	LDX.b current_sprite			;$B68632
	PLA					;$B68634
	STA.b $30,x				;$B68635
	PLA					;$B68637
	STA.b $34,x				;$B68638
	RTS					;$B6863A


;Klasp variables:
;	$60,x	Trigger range (below)
;	$62,x	Trigger range (above)
;	$64,x	X position mirror
;	$6A,x	Time until spawning explosions on contact (4 frames)

klasp_follow_main:
	JMP (.following_klasp_state_table,x)		;$B6863B

.following_klasp_state_table:
	dw .following_klasp_init
	dw .following_klasp_idle
	dw .explode

.following_klasp_init:
	TYX					;$B68644  \ Get Klasp sprite
	INC sprite.state,x			;$B68645   | Set idle state
	LDA sprite.x_position,x			;$B68647   | 
	STA sprite.general_purpose_64,x	;$B68649   | Store mirror of X position
	CLC					;$B6864B   |
	ADC sprite.general_purpose_5C,x		;$B6864C   | Add home X position
	STA sprite.general_purpose_5C,x		;$B6864E   | Update home X position
	LDA sprite.general_purpose_5E,x		;$B68650   |
	CLC					;$B68652   |
	ADC sprite.x_position,x			;$B68653   |
	STA sprite.general_purpose_5E,x		;$B68655   |
	LDA sprite.general_purpose_60,x	;$B68657   |
	CLC					;$B68659   |
	ADC sprite.y_position,x			;$B6865A   |
	STA sprite.general_purpose_60,x	;$B6865C   |
	LDA sprite.general_purpose_62,x		;$B6865E   |
	CLC					;$B68660   |
	ADC sprite.y_position,x			;$B68661   |
	STA sprite.general_purpose_62,x		;$B68663  /
.following_klasp_idle:
	JSR .handle_collision			;$B68665  \ Handle collision
	LDY active_kong_sprite			;$B68668   | Get kong sprite
	LDA.w sprite.y_position,y		;$B6866B   | Get kong Y position
	CMP sprite.general_purpose_60,x	;$B6866E   |
	BCC ..CODE_B686AD			;$B68670   |
	CMP sprite.general_purpose_62,x		;$B68672   |
	BCS ..CODE_B686AD			;$B68674   |
	LDA.w sprite.x_position,y		;$B68676   |
	SEC					;$B68679   |
	SBC sprite.x_position,x			;$B6867A   |
	PHP					;$B6867C   |
	BPL ..CODE_B68683			;$B6867D   |
	EOR #$FFFF				;$B6867F   |
	INC					;$B68682  /
..CODE_B68683:
	CMP #$0008				;$B68683  \
	BCS ..CODE_B6869C			;$B68686   |
	PLP					;$B68688   |
	STZ sprite.max_x_speed,x		;$B68689   | Clear target X speed
	LDA sprite.x_speed,x			;$B6868B   | Get current X speed
	BPL ..CODE_B68693			;$B6868D   |
	EOR #$FFFF				;$B6868F   |
	INC					;$B68692  /
..CODE_B68693:
	CMP #$0040				;$B68693  \
	BCS .CODE_B686C9			;$B68696   |
	STZ sprite.x_speed,x			;$B68698   | Clear current X speed
	BRA .CODE_B686C9			;$B6869A  /

..CODE_B6869C:
	LDX current_sprite			;$B6869C  \
	LDY sprite.general_purpose_66,x		;$B6869E   |
	PLP					;$B686A0   |
	BPL ..CODE_B686A9			;$B686A1   |
	TYA					;$B686A3   |
	EOR #$FFFF				;$B686A4   |
	INC					;$B686A7   |
	TAY					;$B686A8  /
..CODE_B686A9:
	STY sprite.max_x_speed,x		;$B686A9  \ Update target X velocity
	BRA .CODE_B686C9			;$B686AB  /

..CODE_B686AD:
	LDA sprite.x_position,x			;$B686AD  \
	SEC					;$B686AF   |
	SBC sprite.general_purpose_64,x	;$B686B0   |
	BPL ..CODE_B686B8			;$B686B2   |
	EOR #$FFFF				;$B686B4   |
	INC					;$B686B7  /
..CODE_B686B8:
	STA $1C17				;$B686B8  \
	LDA sprite.general_purpose_66,x		;$B686BB   |
	LSR					;$B686BD   |
	LSR					;$B686BE   |
	LSR					;$B686BF   |
	LSR					;$B686C0   |
	LSR					;$B686C1   |
	CMP $1C17				;$B686C2   |
	BCC .CODE_B6870D			;$B686C5   |
	STZ sprite.max_x_speed,x		;$B686C7  /
.CODE_B686C9:
	LDA #$000D				;$B686C9  \
	JSL process_alternate_movement		;$B686CC   | Process alternate movement
	LDA sprite.general_purpose_5C,x		;$B686D0   |
	CMP sprite.x_position,x			;$B686D2   |
	BCS ..CODE_B686E0			;$B686D4   |
	LDA sprite.general_purpose_5E,x		;$B686D6   |
	CMP sprite.x_position,x			;$B686D8   |
	INC					;$B686DA   |
	BCC ..CODE_B686E0			;$B686DB   |
	JMP return_handle_anim_and_despawn	;$B686DD  / Return and handle despawn

..CODE_B686E0:
	STA sprite.x_position,x			;$B686E0  \
	SEC					;$B686E2   |
	SBC sprite.general_purpose_64,x	;$B686E3   |
	EOR sprite.max_x_speed,x		;$B686E5   |
	BMI ..CODE_B686ED			;$B686E7   |
	STZ sprite.max_x_speed,x		;$B686E9   | Clear target X speed
	STZ sprite.x_speed,x			;$B686EB  / Clear current X speed
..CODE_B686ED:
	JMP return_handle_anim_and_despawn	;$B686ED  |> Return and handle despawn

.explode:
	TYX					;$B686F0  \ Get Klasp sprite
	DEC sprite.general_purpose_6A,x		;$B686F1   | Decrease time until explosions
	BNE ..return				;$B686F3   | If not done yet return
	LDA #$060E				;$B686F5   |
	JSL queue_sound_effect			;$B686F8   | Else play explosion sound 1
	LDA #$070F				;$B686FC   |
	JSL queue_sound_effect			;$B686FF   | Play explosion sound 2
	JSL CODE_BB85AC				;$B68703   |
	JMP CODE_B6F27D				;$B68707  / Return and delete Klasp sprite

..return:
	JML [$04F5]				;$B6870A  |>

.CODE_B6870D:
	LDY sprite.general_purpose_66,x		;$B6870D  \
	LDA sprite.x_position,x			;$B6870F   |
	CMP sprite.general_purpose_64,x	;$B68711   |
	BCC ..CODE_B6871B			;$B68713   |
	TYA					;$B68715   |
	EOR #$FFFF				;$B68716   |
	INC					;$B68719   |
	TAY					;$B6871A  /
..CODE_B6871B:
	STY sprite.max_x_speed,x		;$B6871B  \ Update target X speed
	BRA.b .CODE_B686C9			;$B6871D  /

#klasp_auto_move_main:
	JMP (.automoving_klasp_state_table,x)	;$B6871F

.automoving_klasp_state_table:
	dw .automoving_klasp_init
	dw .automoving_klasp_idle
	dw .explode

.automoving_klasp_init:
	TYX					;$B68728  \ Get Klasp sprite
	INC sprite.state,x			;$B68729   | Set state 1
	LDA sprite.max_x_speed,x		;$B6872B   | Get target X speed
	BPL .automoving_klasp_idle		;$B6872D   | If positive, skip flipping
	JSR CODE_B6F29D				;$B6872F  / Else flip Klasp horizontally
.automoving_klasp_idle:
	JSR .handle_collision			;$B68732  \ Handle collision
	JSL process_current_movement		;$B68735   | Process current movement
	JMP return_handle_anim_and_despawn	;$B68739  / Return and handle despawn

.handle_collision:
	LDA #$0018				;$B6873C  \ Get collision flags
	JSL check_throwable_collision		;$B6873F   | Check throwable collision
	BCS ..collision_happened		;$B68743   |
	JSL populate_sprite_clipping		;$B68745   | Else populate clipping
	INC $1860				;$B68749   |
	LDA #$0000				;$B6874C   | Get collision flags (hurt kong always)
	JSL CODE_BEC009				;$B6874F   | Check complex player collision
	BCC ..return				;$B68753  / If no collision happened return
..collision_happened:
	LDA #$0004				;$B68755  \
	STA sprite.general_purpose_6A,x		;$B68758   | Set time before exploding
	LDA #$0002				;$B6875A   |
	STA sprite.state,x			;$B6875D   | Set state 2 (explode)
	LDA #$FFFB				;$B6875F   | Load Y position offset for explosions
	JSR .spawn_explosions			;$B68762  / And spawn them
..return:
	RTS					;$B68765  |> Return

.spawn_explosions:
	PHA					;$B68766  \ Push Y position offset onto stack
	LDY #$013E				;$B68767   |
	JSR ..spawn_and_apply_offset		;$B6876A   | Spawn first explosion
	LDY #$0140				;$B6876D   |
	JSR ..spawn_and_apply_offset		;$B68770   | Spawn second explosion
	LDY #$0142				;$B68773   |
	JSR ..spawn_and_apply_offset		;$B68776   | Spawn third explosion
	PLA					;$B68779   | Retrieve A
	LDX current_sprite			;$B6877A   | Get Klasp sprite
	RTS					;$B6877C  / Return

..spawn_and_apply_offset:
	JSL CODE_BB8585				;$B6877D  \ Spawn the sprite
	LDX alternate_sprite			;$B68781   | Get explosion sprite we just spawned
	LDA $03,s				;$B68783   | Get the Y pos offset we pushed onto the stack
	CLC					;$B68785   |
	ADC sprite.y_position,x			;$B68786   | Add to the explosion's current Y position
	STA sprite.y_position,x			;$B68788   | Update it
	RTS					;$B6878A  / Return


;Defeat sprite setting state, animation, and something else (fly offscreen?)
CODE_B6878B:
	STY sprite.state,x			;$B6878B  \
	PLY					;$B6878D  /
CODE_B6878E:
	JSL defeat_sprite_using_anim_global	;$B6878E  \
	JSL CODE_B680A5				;$B68792   |
	JML CODE_B680C9				;$B68796  /

lemguin_spawner_main:
	JMP (.state_table,x)			;$B6879A  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B687A1  \
	LDA #$0001				;$B687A2   |
	STA sprite.general_purpose_5E,x		;$B687A5   |
	INC sprite.state,x			;$B687A7  /
.idle:
	TYX					;$B687A9  \
	DEC sprite.general_purpose_5E,x		;$B687AA   |
	BNE ..return				;$B687AC   |
	LDA sprite.general_purpose_5C,x		;$B687AE   |
	STA sprite.general_purpose_5E,x		;$B687B0   |
	LDY #$0086				;$B687B2   |
	JSL CODE_BB8585				;$B687B5   |
	BCS ..return				;$B687B9   |
	LDY alternate_sprite			;$B687BB   |
	LDX current_sprite			;$B687BD   |
	LDA sprite.general_purpose_60,x		;$B687BF   |
	STA.w sprite.y_speed,y			;$B687C1   |
	LDA sprite.general_purpose_6A,x		;$B687C4   |
	STA.w sprite.general_purpose_60,y	;$B687C6   |
	LDA sprite.general_purpose_68,x		;$B687C9   |
	BEQ ..CODE_B687D9			;$B687CB   |
	BMI ..CODE_B68810			;$B687CD   |
	LDY active_kong_sprite			;$B687CF   |
	LDA sprite.x_position,x			;$B687D2   |
	CMP.w sprite.x_position,y		;$B687D4   |
	BCC ..CODE_B68810			;$B687D7  /
..CODE_B687D9:
	LDY alternate_sprite			;$B687D9  \
	LDA.w sprite.oam_property,y		;$B687DB   |
	ORA #$4000				;$B687DE   |
	STA.w sprite.oam_property,y		;$B687E1   |
	LDA sprite.general_purpose_64,x		;$B687E4   |
	EOR #$FFFF				;$B687E6   |
	INC					;$B687E9   |
	STA.w sprite.general_purpose_5C,y	;$B687EA   |
	LDA sprite.general_purpose_66,x		;$B687ED   |
	EOR #$FFFF				;$B687EF   |
	INC					;$B687F2  /
..CODE_B687F3:
	STA.w sprite.general_purpose_5E,y	;$B687F3  \
	LDY alternate_sprite			;$B687F6   |
	STA.w sprite.x_speed,y			;$B687F8   |
	STA.w sprite.max_x_speed,y		;$B687FB   |
	REP #$20				;$B687FE   |
	JSL CODE_BBAB29				;$B68800   |
	BCS ..return				;$B68804   |
	LDA #$0032				;$B68806   |
	JSL CODE_BFF006				;$B68809  /
..return:
	JMP return_handle_despawn		;$B6880D  |>

..CODE_B68810:
	LDY alternate_sprite			;$B68810  \
	LDA sprite.general_purpose_64,x		;$B68812   |
	STA.w sprite.general_purpose_5C,y	;$B68814   |
	LDA sprite.general_purpose_66,x		;$B68817   |
	BRA ..CODE_B687F3			;$B68819  /

lemguin_main:
	JMP.w (DATA_B6881E,x)			;$B6881B

DATA_B6881E:
	dw CODE_B68826
	dw CODE_B68833
	dw CODE_B68853
	dw CODE_B688E6

CODE_B68826:
	JSR.w CODE_B68917			;$B68826
	LDA.w #$0015				;$B68829
	JSL.l process_alternate_movement	;$B6882C
	JMP.w CODE_B685E6			;$B68830

CODE_B68833:
	JSR.w CODE_B688E9			;$B68833
	LDA.w #$0044				;$B68836
	JSL.l process_alternate_movement	;$B68839
	LDA.b $28,x				;$B6883D
	BEQ.b CODE_B68850			;$B6883F
	INC.b $38,x				;$B68841
	JSL.l CODE_BBAB29			;$B68843
	BCS.b CODE_B68850			;$B68847
	LDA.w #$0031				;$B68849
	JSL.l CODE_BFF006			;$B6884C
CODE_B68850:
	JMP.w CODE_B685E6			;$B68850

CODE_B68853:
	TYX					;$B68853
	LDA.w $196D				;$B68854
	CLC					;$B68857
	ADC.w #$0140				;$B68858
	CMP.b $12,x				;$B6885B
	BCC.b CODE_B6886C			;$B6885D
	LDA.b $6A,x				;$B6885F
	BNE.b CODE_B6886C			;$B68861
	INC.b $6A,x				;$B68863
	LDA.w #$0031				;$B68865
	JSL.l CODE_BFF006			;$B68868
CODE_B6886C:
	LDA.b $16,x				;$B6886C
	CMP.b $60,x				;$B6886E
	BCC.b CODE_B68875			;$B68870
	JMP.w CODE_B6F27D			;$B68872

CODE_B68875:
	JSR.w CODE_B688E9			;$B68875
	LDY.w #DATA_B68931			;$B68878
	LDA.b $1A,x				;$B6887B
	BEQ.b CODE_B68883			;$B6887D
	LDA.b $2A,x				;$B6887F
	BRA.b CODE_B68892			;$B68881

CODE_B68883:
	LDA.b $1C,x				;$B68883
	BEQ.b CODE_B688E2			;$B68885
	CMP.w #$8000				;$B68887
	BEQ.b CODE_B688E2			;$B6888A
	EOR.b $2A,x				;$B6888C
	BPL.b CODE_B688DE			;$B6888E
	LDA.b $5C,x				;$B68890
CODE_B68892:
	STA.b $30,x				;$B68892
	BPL.b CODE_B68899			;$B68894
	LDY.w #DATA_B6894D			;$B68896
CODE_B68899:
	STY.b $1A				;$B68899
	LDA.b $1C,x				;$B6889B
	ASL					;$B6889D
	BCC.b CODE_B688A4			;$B6889E
	CLC					;$B688A0
	ADC.w #$000E				;$B688A1
CODE_B688A4:
	CLC					;$B688A4
	ADC.b $1A				;$B688A5
	TAY					;$B688A7
	LDA.w $0000,y				;$B688A8
	CMP.w #$2D19				;$B688AB
	BNE.b CODE_B688C3			;$B688AE
	LDA.w #$01B1				;$B688B0
	CMP.b $40,x				;$B688B3
	BNE.b CODE_B688BD			;$B688B5
	JSL.l process_sprite_animation		;$B688B7
	BRA.b CODE_B688C7			;$B688BB

CODE_B688BD:
	JSL.l set_sprite_animation		;$B688BD
	BRA.b CODE_B688C7			;$B688C1

CODE_B688C3:
	STA.b $24,x				;$B688C3
	STZ.b $40,x				;$B688C5
CODE_B688C7:
	JSL.l process_current_movement		;$B688C7
	LDA.b $1C,x				;$B688CB
	AND.w #$000F				;$B688CD
	CMP.w #$0006				;$B688D0
	BNE.b CODE_B688DB			;$B688D3
	LDA.b $56,x				;$B688D5
	STA.b $16,x				;$B688D7
	STZ.b $2E,x				;$B688D9
CODE_B688DB:
	JML [$04F5]				;$B688DB

CODE_B688DE:
	LDA.b $5E,x				;$B688DE
	BRA.b CODE_B68892			;$B688E0

CODE_B688E2:
	LDA.b $2A,x				;$B688E2
	BRA.b CODE_B68892			;$B688E4

CODE_B688E6:
	JMP.w generic_move_and_animate_state	;$B688E6

CODE_B688E9:
	LDA.w #$0038				;$B688E9
	JSL.l check_throwable_collision		;$B688EC
	BCS.b CODE_B68906			;$B688F0
	JSL.l populate_sprite_clipping		;$B688F2
	LDA.w #$0008				;$B688F6
	JSL.l CODE_BEC009			;$B688F9
	BCC.b CODE_B68916			;$B688FD
	BEQ.b CODE_B68916			;$B688FF
CODE_B68901:
	LDA.w #$063B				;$B68901
	BRA.b CODE_B68909			;$B68904

CODE_B68906:
	LDA.w #$063C				;$B68906
CODE_B68909:
	JSL.l queue_sound_effect		;$B68909
	LDY.w #$0003				;$B6890D
	LDA.w #$01B0				;$B68910
	JMP.w CODE_B6878B			;$B68913

CODE_B68916:
	RTS					;$B68916

CODE_B68917:
	LDA.w #$0038				;$B68917
	JSL.l check_throwable_collision		;$B6891A
	BCS.b CODE_B68901			;$B6891E
	JSL.l populate_sprite_clipping		;$B68920
	LDA.w #$08AA				;$B68924
	JSL.l CODE_BEC009			;$B68927
	BCC.b CODE_B68916			;$B6892B
	BEQ.b CODE_B68916			;$B6892D
	BRA.b CODE_B68906			;$B6892F

DATA_B68931:
	dw $2D19
	dw $2D0F
	dw $2D0F
	dw $2D0F
	dw $2D0A
	dw $2D0A
	dw $2D19
	dw $2D19
	dw $2D23
	dw $2D23
	dw $2D32
	dw $2D32
	dw $2D32
	dw $2D19


DATA_B6894D:
	dw $2D19
	dw $2D23
	dw $2D23
	dw $2D23
	dw $2D32
	dw $2D32
	dw $2D19
	dw $2D19
	dw $2D0F
	dw $2D0F
	dw $2D0A
	dw $2D0A
	dw $2D0A
	dw $2D19


nibbla_head_friendly_main:
	PHX					;$B68969
	TYX					;$B6896A
	LDA.b $4C,x				;$B6896B
	BEQ.b CODE_B68979			;$B6896D
	DEC.b $4C,x				;$B6896F
	BNE.b CODE_B68979			;$B68971
	LDA.b $4E,x				;$B68973
	JSL.l CODE_BFF006			;$B68975
CODE_B68979:
	PLX					;$B68979
	STZ.b $1E				;$B6897A
	JMP.w (DATA_B6897F,x)			;$B6897C

DATA_B6897F:
	dw CODE_B68987
	dw CODE_B689BC
	dw CODE_B68A3F
	dw CODE_B68A89

CODE_B68987:
	LDA.w $1B6B				;$B68987
	BEQ.b CODE_B68997			;$B6898A
	JSL.l CODE_BB85A9			;$B6898C
	JSL.l delete_sprite_handle_deallocation	;$B68990
	JML [$04F5]				;$B68994

CODE_B68997:
	TYX					;$B68997
	INC.b $38,x				;$B68998
	LDA.w $05AF				;$B6899A
	STA.w $1B71				;$B6899D
	STX.w $1B6B				;$B689A0
	LDY.w #$00C0				;$B689A3
	JSL.l CODE_BB8585			;$B689A6
	LDY.b current_sprite			;$B689AA
	LDX.b alternate_sprite			;$B689AC
	STX.b $68,y				;$B689AE
	STY.b $5C,x				;$B689B0
	LDA.w $005E,y				;$B689B2
	STA.w $054F				;$B689B5
	JSL.l CODE_B6F6D2			;$B689B8
CODE_B689BC:
	TYX					;$B689BC
	LDA.w $0551				;$B689BD
	CMP.w #$0003				;$B689C0
	BCC.b CODE_B689CD			;$B689C3
	LDA.w #$0003				;$B689C5
	STA.b $38,x				;$B689C8
	JMP.w CODE_B68A89			;$B689CA

CODE_B689CD:
	LDY.w $1B6F				;$B689CD
	BEQ.b CODE_B689F3			;$B689D0
	JSR.w CODE_B68B8B			;$B689D2
	BCC.b CODE_B689DA			;$B689D5
	JMP.w CODE_B68A39			;$B689D7

CODE_B689DA:
	LDY.w $1B6F				;$B689DA
	LDA.w $0012,y				;$B689DD
	STA.w $1C15				;$B689E0
	LDA.w $0016,y				;$B689E3
	STA.w $1C17				;$B689E6
	LDA.w #$0020				;$B689E9
	STA.b $1A				;$B689EC
	LDA.w #$001C				;$B689EE
	BRA.b CODE_B68A1B			;$B689F1

CODE_B689F3:
	LDX.w active_kong_sprite		;$B689F3
	LDA.b $12,x				;$B689F6
	BIT.b $1E,x				;$B689F8
	BVS.b CODE_B68A01			;$B689FA
	ADC.w #$FFCE				;$B689FC
	BRA.b CODE_B68A04			;$B689FF

CODE_B68A01:
	ADC.w #$0032				;$B68A01
CODE_B68A04:
	STA.w $1C15				;$B68A04
	LDA.b $16,x				;$B68A07
	CLC					;$B68A09
	ADC.w #$FFEC				;$B68A0A
	STA.w $1C17				;$B68A0D
	JSR.w CODE_B68BE4			;$B68A10
	LDA.w #$0030				;$B68A13
	STA.b $1A				;$B68A16
	LDA.w #$002A				;$B68A18
CODE_B68A1B:
	STA.b $1C				;$B68A1B
	JSR.w CODE_B68C12			;$B68A1D
	LDA.b $1E				;$B68A20
	CLC					;$B68A22
	ADC.w #$0140				;$B68A23
	JSR.w CODE_B6F2B1			;$B68A26
	LDA.b $1E				;$B68A29
	CLC					;$B68A2B
	ADC.w #$0140				;$B68A2C
	JSR.w CODE_B6F2C9			;$B68A2F
	LDA.w #$0001				;$B68A32
	JSL.l process_alternate_movement	;$B68A35
CODE_B68A39:
	JSR.w CODE_B68BBC			;$B68A39
	JMP.w CODE_B68AE9			;$B68A3C

CODE_B68A3F:
	LDX.w $1B6F				;$B68A3F
	LDA.b $12,x				;$B68A42
	CMP.w $0012,y				;$B68A44
	BCC.b CODE_B68A4D			;$B68A47
	SEC					;$B68A49
	SBC.w #$0000				;$B68A4A
CODE_B68A4D:
	CLC					;$B68A4D
	ADC.w #$0000				;$B68A4E
	STA.w $1C15				;$B68A51
	LDA.b $16,x				;$B68A54
	SEC					;$B68A56
	SBC.w #$000D				;$B68A57
	STA.w $1C17				;$B68A5A
	JSR.w CODE_B68BE4			;$B68A5D
	LDA.w #$0020				;$B68A60
	STA.b $1A				;$B68A63
	LDA.w #$001C				;$B68A65
	STA.b $1C				;$B68A68
	JSR.w CODE_B68C12			;$B68A6A
	LDA.b $1E				;$B68A6D
	CLC					;$B68A6F
	ADC.w #$0100				;$B68A70
	JSR.w CODE_B6F2B1			;$B68A73
	LDA.b $1E				;$B68A76
	CLC					;$B68A78
	ADC.w #$0100				;$B68A79
	JSR.w CODE_B6F2C9			;$B68A7C
	LDA.w #$0001				;$B68A7F
	JSL.l process_alternate_movement	;$B68A82
	JMP.w CODE_B68AE9			;$B68A86

CODE_B68A89:
	LDY.w $1B6F				;$B68A89
	BEQ.b CODE_B68A93			;$B68A8C
	JSR.w CODE_B68B8B			;$B68A8E
	BCS.b CODE_B68AE9			;$B68A91
CODE_B68A93:
	JSL.l populate_sprite_clipping		;$B68A93
	LDY.w #$0300				;$B68A97
	LDA.w #$0000				;$B68A9A
	LDX.w #$0000				;$B68A9D
	JSL.l CODE_BEC024			;$B68AA0
	BCC.b CODE_B68AB6			;$B68AA4
	DEC.w $0551				;$B68AA6
	LDA.w #$0001				;$B68AA9
	STA.b $38,x				;$B68AAC
	LDA.b $5E,x				;$B68AAE
	STA.w $054F				;$B68AB0
	JMP.w CODE_B6C5DC			;$B68AB3

CODE_B68AB6:
	LDY.w active_kong_sprite		;$B68AB6
	LDA.w $0012,y				;$B68AB9
	STA.w $1C15				;$B68ABC
	LDA.w $0016,y				;$B68ABF
	CLC					;$B68AC2
	ADC.w #$FFF6				;$B68AC3
	STA.w $1C17				;$B68AC6
	LDA.w #$0030				;$B68AC9
	STA.b $1A				;$B68ACC
	LDA.w #$0029				;$B68ACE
	STA.b $1C				;$B68AD1
	JSR.w CODE_B68C12			;$B68AD3
	LDA.w #$0400				;$B68AD6
	JSR.w CODE_B6F2B1			;$B68AD9
	LDA.w #$0400				;$B68ADC
	JSR.w CODE_B6F2C9			;$B68ADF
	LDA.w #$0001				;$B68AE2
	JSL.l process_alternate_movement	;$B68AE5
CODE_B68AE9:
	JSR.w CODE_B6C6EA			;$B68AE9
	JSL.l process_sprite_animation		;$B68AEC
	LDX.b current_sprite			;$B68AF0
	STZ.w $1B6F				;$B68AF2
	LDA.w #$0080				;$B68AF5
	CMP.b $12,x				;$B68AF8
	BCC.b CODE_B68B00			;$B68AFA
	STA.b $12,x				;$B68AFC
	STZ.b $2A,x				;$B68AFE
CODE_B68B00:
	LDA.w #$0080				;$B68B00
	CMP.b $16,x				;$B68B03
	BCC.b CODE_B68B0B			;$B68B05
	STA.b $16,x				;$B68B07
	STZ.b $2E,x				;$B68B09
CODE_B68B0B:
	LDA.w $05AF				;$B68B0B
	BIT.w #$4000				;$B68B0E
	BNE.b CODE_B68B34			;$B68B11
	LDA.w #$4000				;$B68B13
	BIT.w $1B71				;$B68B16
	BEQ.b CODE_B68B34			;$B68B19
	DEC.w $0551				;$B68B1B
	BPL.b CODE_B68B23			;$B68B1E
	STZ.w $0551				;$B68B20
CODE_B68B23:
	LDA.b $5E,x				;$B68B23
	STA.w $054F				;$B68B25
	LDA.w #$0003				;$B68B28
	CMP.b $38,x				;$B68B2B
	BNE.b CODE_B68B34			;$B68B2D
	LDA.w #$0001				;$B68B2F
	STA.b $38,x				;$B68B32
CODE_B68B34:
	LDA.w $05AF				;$B68B34
	STA.w $1B71				;$B68B37
	LDA.b $40,x				;$B68B3A
	SEC					;$B68B3C
	SBC.w #$01B9				;$B68B3D
	CMP.w #$01BC				;$B68B40
	BCS.b CODE_B68B57			;$B68B43
	LDA.w $0551				;$B68B45
	CLC					;$B68B48
	ADC.w #$01B9				;$B68B49
	CMP.b $40,x				;$B68B4C
	BEQ.b CODE_B68B57			;$B68B4E
	JSL.l set_sprite_animation		;$B68B50
	JSR.w CODE_B68B5A			;$B68B54
CODE_B68B57:
	JML [$04F5]				;$B68B57

CODE_B68B5A:
	PHB					;$B68B5A
	PHK					;$B68B5B
	PLB					;$B68B5C
	LDA.w $0551				;$B68B5D
	ASL					;$B68B60
	TAX					;$B68B61
	LDA.w DATA_B68B83,x			;$B68B62
	LDX.b current_sprite			;$B68B65
	JSL.l CODE_BB85A0			;$B68B67
	LDX.b current_sprite			;$B68B6B
	LDY.b $68,x				;$B68B6D
	LDA.w $001E,y				;$B68B6F
	AND.w #$01FF				;$B68B72
	STA.b $1A				;$B68B75
	LDA.b $1E,x				;$B68B77
	AND.w #$FE00				;$B68B79
	ORA.b $1A				;$B68B7C
	STA.w $001E,y				;$B68B7E
	PLB					;$B68B81
	RTS					;$B68B82

DATA_B68B83:
	dw $0088
	dw $0089
	dw $008A
	dw $008B

CODE_B68B8B:
	JSL.l CODE_BEC003			;$B68B8B
	BCC.b CODE_B68BBB			;$B68B8F
	LDA.w #$0002				;$B68B91
	STA.b $38,x				;$B68B94
	LDA.b $12,x				;$B68B96
	SEC					;$B68B98
	SBC.w $0012,y				;$B68B99
	LDY.w #$01B5				;$B68B9C
	EOR.b $1E,x				;$B68B9F
	ASL					;$B68BA1
	BPL.b CODE_B68BB3			;$B68BA2
	LDA.w #$01B4				;$B68BA4
	CMP.b $40,x				;$B68BA7
	BNE.b CODE_B68BB0			;$B68BA9
	LDY.w #$01BD				;$B68BAB
	BRA.b CODE_B68BB3			;$B68BAE

CODE_B68BB0:
	LDY.w #$01B3				;$B68BB0
CODE_B68BB3:
	TYA					;$B68BB3
	JSL.l set_sprite_animation		;$B68BB4
	LDX.b current_sprite			;$B68BB8
	SEC					;$B68BBA
CODE_B68BBB:
	RTS					;$B68BBB

CODE_B68BBC:
	LDY.w active_kong_sprite		;$B68BBC
	LDA.w $0038,y				;$B68BBF
	CMP.w #$001C				;$B68BC2
	BEQ.b CODE_B68BE3			;$B68BC5
	CMP.w #$001D				;$B68BC7
	BEQ.b CODE_B68BE3			;$B68BCA
	JSL.l CODE_B7802D			;$B68BCC
	BNE.b CODE_B68BE3			;$B68BD0
	DEC.w $054F				;$B68BD2
	BNE.b CODE_B68BE3			;$B68BD5
	INC.w $0551				;$B68BD7
	LDA.b $5E,x				;$B68BDA
	STA.w $054F				;$B68BDC
	JSL.l CODE_B6F6D2			;$B68BDF
CODE_B68BE3:
	RTS					;$B68BE3

CODE_B68BE4:
	LDX.b current_sprite			;$B68BE4
	SEC					;$B68BE6
	SBC.b $16,x				;$B68BE7
	BPL.b CODE_B68BEF			;$B68BE9
	EOR.w #$FFFF				;$B68BEB
	INC					;$B68BEE
CODE_B68BEF:
	STA.b $1A				;$B68BEF
	LDA.w $1C15				;$B68BF1
	SEC					;$B68BF4
	SBC.b $12,x				;$B68BF5
	BPL.b CODE_B68BFD			;$B68BF7
	EOR.w #$FFFF				;$B68BF9
	INC					;$B68BFC
CODE_B68BFD:
	CMP.b $1A				;$B68BFD
	BCS.b CODE_B68C03			;$B68BFF
	LDA.b $1A				;$B68C01
CODE_B68C03:
	CMP.w #$0080				;$B68C03
	BCC.b CODE_B68C0B			;$B68C06
	LDA.w #$0080				;$B68C08
CODE_B68C0B:
	ASL					;$B68C0B
	ASL					;$B68C0C
	ASL					;$B68C0D
	CLC					;$B68C0E
	STA.b $1E				;$B68C0F
	RTS					;$B68C11

CODE_B68C12:
	STZ.b $30,x				;$B68C12
	LDA.b $12,x				;$B68C14
	CMP.w $1C15				;$B68C16
	LDA.b $2A,x				;$B68C19
	BCC.b CODE_B68C23			;$B68C1B
	SBC.b $1A				;$B68C1D
	DEC.b $30,x				;$B68C1F
	BRA.b CODE_B68C27			;$B68C21

CODE_B68C23:
	ADC.b $1A				;$B68C23
	INC.b $30,x				;$B68C25
CODE_B68C27:
	STA.b $2A,x				;$B68C27
	LDA.b $16,x				;$B68C29
	CMP.w $1C17				;$B68C2B
	LDA.b $2E,x				;$B68C2E
	BCC.b CODE_B68C36			;$B68C30
	SBC.b $1C				;$B68C32
	BRA.b CODE_B68C38			;$B68C34

CODE_B68C36:
	ADC.b $1C				;$B68C36
CODE_B68C38:
	STA.b $2E,x				;$B68C38
	RTS					;$B68C3A

nibbla_body_friendly_main:
	JMP.w CODE_B685E6			;$B68C3B

lurchin_main:
	JMP.w (DATA_B68C41,x)			;$B68C3E

DATA_B68C41:
	dw CODE_B68C4D
	dw CODE_B68C65
	dw CODE_B68C6E
	dw CODE_B68C77
	dw CODE_B68C80
	dw CODE_B68C97

CODE_B68C4D:
	TYX					;$B68C4D
	LDA.b $16,x				;$B68C4E
	STA.b $60,x				;$B68C50
	INC.b $38,x				;$B68C52
	LDA.w #$01C2				;$B68C54
	LDY.b $2E,x				;$B68C57
	BMI.b CODE_B68C5E			;$B68C59
	LDA.w #$01C3				;$B68C5B
CODE_B68C5E:
	JSL.l set_sprite_animation		;$B68C5E
	JSR.w CODE_B68CE0			;$B68C62
CODE_B68C65:
	JSR.w CODE_B68C9A			;$B68C65
	JSR.w CODE_B68CF3			;$B68C68
	JMP.w return_handle_anim_and_despawn	;$B68C6B

CODE_B68C6E:
	TYX					;$B68C6E
	JSR.w CODE_B68CD8			;$B68C6F
	INC.b $38,x				;$B68C72
	JSR.w CODE_B68CED			;$B68C74
CODE_B68C77:
	JSR.w CODE_B68C9A			;$B68C77
	JSR.w CODE_B68CF3			;$B68C7A
	JMP.w return_handle_anim_and_despawn	;$B68C7D

CODE_B68C80:
	JSR.w CODE_B68C9A			;$B68C80
	JSR.w CODE_B68CF3			;$B68C83
	DEC.b $68,x				;$B68C86
	LDA.b $68,x				;$B68C88
	AND.w #$00FF				;$B68C8A
	BNE.b CODE_B68C94			;$B68C8D
	JSR.w CODE_B68CD8			;$B68C8F
	DEC.b $38,x				;$B68C92
CODE_B68C94:
	JML [$04F5]				;$B68C94

CODE_B68C97:
	JMP.w generic_move_and_animate_state	;$B68C97

CODE_B68C9A:
	JSL.l populate_sprite_clipping		;$B68C9A
	LDX.b current_sprite			;$B68C9E
	INC.w $1862				;$B68CA0
	LDY.w #$03A0				;$B68CA3
	LDA.b $24,x				;$B68CA6
	CMP.w #$315B				;$B68CA8
	BCS.b CODE_B68CB0			;$B68CAB
	LDY.w #$0300				;$B68CAD
CODE_B68CB0:
	LDA.w #$0000				;$B68CB0
	LDX.w #$0000				;$B68CB3
	JSL.l CODE_BEC024			;$B68CB6
	BCC.b CODE_B68CD7			;$B68CBA
	CMP.w #$0002				;$B68CBC
	BNE.b CODE_B68CD7			;$B68CBF
	LDA.w #$0651				;$B68CC1
	JSL.l queue_sound_effect		;$B68CC4
	JSL.l CODE_BB85AC			;$B68CC8
	LDX.b current_sprite			;$B68CCC
	LDY.w #$0005				;$B68CCE
	LDA.w #$0249				;$B68CD1
	JMP.w CODE_B6878B			;$B68CD4

CODE_B68CD7:
	RTS					;$B68CD7

CODE_B68CD8:
	LDA.b $68,x				;$B68CD8
	XBA					;$B68CDA
	ORA.b $68,x				;$B68CDB
	STA.b $68,x				;$B68CDD
	RTS					;$B68CDF

CODE_B68CE0:
	LDX.b current_sprite			;$B68CE0
	LDA.b $2E,x				;$B68CE2
CODE_B68CE4:
	BPL.b CODE_B68CEA			;$B68CE4
	EOR.w #$FFFF				;$B68CE6
	INC					;$B68CE9
CODE_B68CEA:
	STA.b $44,x				;$B68CEA
	RTS					;$B68CEC

CODE_B68CED:
	LDX.b current_sprite			;$B68CED
	LDA.b $6A,x				;$B68CEF
	BRA.b CODE_B68CE4			;$B68CF1

CODE_B68CF3:
	LDA.w parent_level_number		;$B68CF3  \ Get current level
	CMP.w #!level_fish_food_frenzy		;$B68CF6   | Check if its fish food frenzy
	BNE.b .return				;$B68CF9   | If not, return
	LDA.b $12,x				;$B68CFB   |
	CLC					;$B68CFD   |
	ADC.w #$FFC4				;$B68CFE   |
	STA.b $1A				;$B68D01   |
	CLC					;$B68D03   |
	ADC.w #$0078				;$B68D04   |
	STA.b $1C				;$B68D07   |
	LDA.b $16,x				;$B68D09   |
	CLC					;$B68D0B   |
	ADC.w #$FFD8				;$B68D0C   |
	STA.b $1E				;$B68D0F   |
	CLC					;$B68D11   |
	ADC.w #$006E				;$B68D12   |
	STA.b $20				;$B68D15   |
	LDY.w $1B6B				;$B68D17   | Get Nibbla sprite
	LDA.w #$001A				;$B68D1A   |
	JSL.l CODE_B6F3AB			;$B68D1D   |
	BCC.b .return				;$B68D21   |
	LDA.w $1B6F				;$B68D23   |
	BNE.b .return				;$B68D26   |
	STX.w $1B6F				;$B68D28   /
.return:
	RTS					;$B68D2B  |>

unknown_sprite_0028_main:
	JSL.l CODE_BBAB46			;$B68D2C
	JML [$04F5]				;$B68D30

unknown_sprite_00D4_main:
	JMP.w (DATA_B68D36,x)			;$B68D33

DATA_B68D36:
	dw CODE_B68D3A
	dw CODE_B68DCC

CODE_B68D3A:
	LDA.w $05CD				;$B68D3A
	STA.w $1B71				;$B68D3D
	LDA.w $1B71				;$B68D40
	BNE.b CODE_B68D48			;$B68D43
	JMP.w CODE_B68DAD			;$B68D45

CODE_B68D48:
	LDA.w $1B71				;$B68D48
	STA.w $1C15				;$B68D4B
CODE_B68D4E:
	LDY.w #$0088				;$B68D4E
	JSL.l CODE_BB85B8			;$B68D51
	LDX.b alternate_sprite			;$B68D55
	LDY.b current_sprite			;$B68D57
	LDA.w $001E,y				;$B68D59
	AND.w #$3FFF				;$B68D5C
	STA.b $6C,x				;$B68D5F
CODE_B68D61:
	LDA.w DATA_B6F48A			;$B68D61
	JSL.l CODE_B58006			;$B68D64
	LDX.b alternate_sprite			;$B68D68
	STA.b $5E,x				;$B68D6A
	JSR.w CODE_B6F348			;$B68D6C
	TYX					;$B68D6F
	BIT.w $1B6B,x				;$B68D70
	BNE.b CODE_B68D61			;$B68D73
	ORA.w $1B6B,y				;$B68D75
	STA.w $1B6B,y				;$B68D78
	LDX.b alternate_sprite			;$B68D7B
	LDA.b $5E,x				;$B68D7D
	ASL					;$B68D7F
	CLC					;$B68D80
	ADC.b $5E,x				;$B68D81
	TAY					;$B68D83
	SEP.b #$20				;$B68D84
	LDA.w DATA_B6F48C,y			;$B68D86
	STA.b $12,x				;$B68D89
	LDA.w DATA_B6F48C+$01,y			;$B68D8B
	STA.b $16,x				;$B68D8E
	LDA.w DATA_B6F48C+$02,y			;$B68D90
	EOR.b $1F,x				;$B68D93
	STA.b $1F,x				;$B68D95
	REP.b #$20				;$B68D97
	JSR.w CODE_B68DD2			;$B68D99
	LDA.b $5C,x				;$B68D9C
	CMP.w #$0087				;$B68D9E
	BCS.b CODE_B68DA8			;$B68DA1
	LDA.w #$0001				;$B68DA3
	STA.b $5C,x				;$B68DA6
CODE_B68DA8:
	DEC.w $1C15				;$B68DA8
	BNE.b CODE_B68D4E			;$B68DAB
CODE_B68DAD:
	LDX.b current_sprite			;$B68DAD
	INC.b $38,x				;$B68DAF
	LDA.w #$0030				;$B68DB1
	STA.w $1B73				;$B68DB4
	LDA.w #$00D0				;$B68DB7
	STA.w $1B75				;$B68DBA
	LDA.w #$0038				;$B68DBD
	STA.w $1B77				;$B68DC0
	LDA.w #$0090				;$B68DC3
	STA.w $1B79				;$B68DC6
	JML [$04F5]				;$B68DC9

CODE_B68DCC:
	JSR.w CODE_B68DE0			;$B68DCC
	JML [$04F5]				;$B68DCF

CODE_B68DD2:
	LDA.w #$00F0				;$B68DD2
	JSL.l CODE_B58006			;$B68DD5
	CLC					;$B68DD9
	ADC.w #$003C				;$B68DDA
	STA.b $5C,x				;$B68DDD
	RTS					;$B68DDF

CODE_B68DE0:
	LDA.w $1B71				;$B68DE0
	BEQ.b CODE_B68E10			;$B68DE3
	LDA.w #$00FF				;$B68DE5
	JSL.l CODE_B58006			;$B68DE8
	CMP.w #$0001				;$B68DEC
	BCS.b CODE_B68DF8			;$B68DEF
	LDA.w #$076B				;$B68DF1
	JSL.l queue_sound_effect		;$B68DF4
CODE_B68DF8:
	LDA.w $1B6F				;$B68DF8
	BEQ.b CODE_B68E10			;$B68DFB
	LDA.w #$00FF				;$B68DFD
	JSL.l CODE_B58006			;$B68E00
	CMP.w #$0004				;$B68E04
	BCS.b CODE_B68E10			;$B68E07
	LDA.w #$0569				;$B68E09
	JSL.l queue_sound_effect		;$B68E0C
CODE_B68E10:
	RTS					;$B68E10

banana_bird_main:
	JMP.w (DATA_B68E14,x)			;$B68E11

DATA_B68E14:
	dw CODE_B68E32
	dw CODE_B68E35
	dw CODE_B68E68
	dw CODE_B68ED8
	dw CODE_B68F6D
	dw CODE_B68F63
	dw CODE_B68F6D
	dw CODE_B68F77
	dw CODE_B68F7C
	dw CODE_B68FB4
	dw CODE_B68FD1
	dw CODE_B68FEB
	dw CODE_B69036
	dw CODE_B6907D
	dw CODE_B6909D

CODE_B68E32:
	TYX					;$B68E32
	INC.b $38,x				;$B68E33
CODE_B68E35:
	TYX					;$B68E35
	LDA.b $5C,x				;$B68E36
	BEQ.b CODE_B68E59			;$B68E38
	DEC.b $5C,x				;$B68E3A
	BNE.b CODE_B68E59			;$B68E3C
	LDA.w $05CD				;$B68E3E
	LSR					;$B68E41
	INC					;$B68E42
	CMP.w $1B6F				;$B68E43
	BCC.b CODE_B68E63			;$B68E46
	LDA.b $5E,x				;$B68E48
	JSR.w CODE_B6F348			;$B68E4A
	EOR.w $1B6B,y				;$B68E4D
	STA.w $1B6B,y				;$B68E50
	INC.w $1B6F				;$B68E53
	JSR.w CODE_B690B7			;$B68E56
CODE_B68E59:
	JSL.l process_sprite_animation		;$B68E59
	JSR.w CODE_B6915B			;$B68E5D
	JML [$04F5]				;$B68E60

CODE_B68E63:
	JSR.w CODE_B68DD2			;$B68E63
	BRA.b CODE_B68E59			;$B68E66

CODE_B68E68:
	TYX					;$B68E68
	DEC.b $5C,x				;$B68E69
	BNE.b CODE_B68ED2			;$B68E6B
	DEC.w $1B6F				;$B68E6D
	LDA.b active_frame_counter		;$B68E70
	STA.w CPU.dividen_low			;$B68E72
	SEP.b #$20				;$B68E75
	LDA.w DATA_B6F48A			;$B68E77
	STA.w CPU.divisor			;$B68E7A
	REP.b #$20				;$B68E7D
	JSL.l stall_cpu_time			;$B68E7F
	LDA.w CPU.divide_remainder		;$B68E83
	STA.b $1A				;$B68E86
	JSR.w CODE_B6F348			;$B68E88
	TYX					;$B68E8B
CODE_B68E8C:
	BIT.w $1B6B,x				;$B68E8C
	BEQ.b CODE_B68EAE			;$B68E8F
	ASL					;$B68E91
	BCC.b CODE_B68E97			;$B68E92
	ROL					;$B68E94
	INX					;$B68E95
	INX					;$B68E96
CODE_B68E97:
	PHA					;$B68E97
	INC.b $1A				;$B68E98
	LDA.b $1A				;$B68E9A
	CMP.w DATA_B6F48A			;$B68E9C
	BCC.b CODE_B68EAB			;$B68E9F
	STZ.b $1A				;$B68EA1
	LDA.w #$0001				;$B68EA3
	STA.b $01,S				;$B68EA6
	LDX.w #$0000				;$B68EA8
CODE_B68EAB:
	PLA					;$B68EAB
	BRA.b CODE_B68E8C			;$B68EAC

CODE_B68EAE:
	ORA.w $1B6B,x				;$B68EAE
	STA.w $1B6B,x				;$B68EB1
	LDX.b current_sprite			;$B68EB4
	INC.b $38,x				;$B68EB6
	LDA.b $1A				;$B68EB8
	STA.b $5E,x				;$B68EBA
	ASL					;$B68EBC
	CLC					;$B68EBD
	ADC.b $1A				;$B68EBE
	TAY					;$B68EC0
	SEP.b #$20				;$B68EC1
	LDA.w DATA_B6F48C,y			;$B68EC3
	STA.b $60,x				;$B68EC6
	LDA.w DATA_B6F48C+$01,y			;$B68EC8
	STA.b $62,x				;$B68ECB
	REP.b #$20				;$B68ECD
	JMP.w CODE_B68EDA			;$B68ECF

CODE_B68ED2:
	JSR.w CODE_B690DD			;$B68ED2
	JML [$04F5]				;$B68ED5

CODE_B68ED8:
	LDX.b current_sprite			;$B68ED8
CODE_B68EDA:
	LDA.w #$0003				;$B68EDA
	STA.w $1C15				;$B68EDD
	STA.w $1C17				;$B68EE0
	TXA					;$B68EE3
	CLC					;$B68EE4
	ADC.w #$0060				;$B68EE5
	TAY					;$B68EE8
	JSR.w CODE_B6F327			;$B68EE9
	BCS.b CODE_B68F04			;$B68EEC
	LDA.w #$0001				;$B68EEE
	STA.b $38,x				;$B68EF1
	STZ.b $2A,x				;$B68EF3
	STZ.b $2E,x				;$B68EF5
	JSR.w CODE_B68DD2			;$B68EF7
	LDA.w #$01C8				;$B68EFA
	JSL.l set_sprite_animation		;$B68EFD
	JMP.w CODE_B68F61			;$B68F01

CODE_B68F04:
	LDA.w #$000A				;$B68F04
	STA.w $1C15				;$B68F07
	LDA.w #$000A				;$B68F0A
	STA.w $1C17				;$B68F0D
	TXA					;$B68F10
	CLC					;$B68F11
	ADC.w #$0060				;$B68F12
	TAY					;$B68F15
	JSR.w CODE_B6F327			;$B68F16
	BCS.b CODE_B68F1B			;$B68F19
CODE_B68F1B:
	LDA.b $12,x				;$B68F1B
	BMI.b CODE_B68F30			;$B68F1D
	CMP.b $60,x				;$B68F1F
	BCC.b CODE_B68F30			;$B68F21
	LDA.b $68,x				;$B68F23
	BMI.b CODE_B68F39			;$B68F25
	JSR.w CODE_B691CC			;$B68F27
	EOR.w #$FFFF				;$B68F2A
	INC					;$B68F2D
	BRA.b CODE_B68F37			;$B68F2E

CODE_B68F30:
	LDA.b $68,x				;$B68F30
	BPL.b CODE_B68F39			;$B68F32
	JSR.w CODE_B691D8			;$B68F34
CODE_B68F37:
	STA.b $68,x				;$B68F37
CODE_B68F39:
	LDA.b $16,x				;$B68F39
	BMI.b CODE_B68F4E			;$B68F3B
	CMP.b $62,x				;$B68F3D
	BCC.b CODE_B68F4E			;$B68F3F
	LDA.b $6A,x				;$B68F41
	BMI.b CODE_B68F57			;$B68F43
	JSR.w CODE_B6920B			;$B68F45
	EOR.w #$FFFF				;$B68F48
	INC					;$B68F4B
	BRA.b CODE_B68F55			;$B68F4C

CODE_B68F4E:
	LDA.b $6A,x				;$B68F4E
	BPL.b CODE_B68F57			;$B68F50
	JSR.w CODE_B6920B			;$B68F52
CODE_B68F55:
	STA.b $6A,x				;$B68F55
CODE_B68F57:
	JSR.w CODE_B691A1			;$B68F57
	LDA.w #$0001				;$B68F5A
	JSL.l process_alternate_movement	;$B68F5D
CODE_B68F61:
	BRA.b CODE_B68F6D			;$B68F61

CODE_B68F63:
	TYX					;$B68F63
	LDA.b $1E,x				;$B68F64
	AND.w #$3FFF				;$B68F66
	STA.b $6C,x				;$B68F69
	INC.b $38,x				;$B68F6B
CODE_B68F6D:
	JSL.l process_sprite_animation		;$B68F6D
	JSR.w CODE_B6915B			;$B68F71
	JML [$04F5]				;$B68F74

CODE_B68F77:
	TYX					;$B68F77
	STZ.b $5C,x				;$B68F78
	BRA.b CODE_B68F6D			;$B68F7A

CODE_B68F7C:
	TYX					;$B68F7C
	INC.b $38,x				;$B68F7D
	JSR.w CODE_B690B7			;$B68F7F
	LDA.w #$FF00				;$B68F82
	STA.b $2A,x				;$B68F85
	STA.b $30,x				;$B68F87
	STZ.b $2E,x				;$B68F89
	LDA.w #$FFF0				;$B68F8B
	STA.b $68,x				;$B68F8E
	LDA.w #$0050				;$B68F90
	STA.w $1B73				;$B68F93
	LDA.w #$00A0				;$B68F96
	STA.w $1B75				;$B68F99
	LDA.w #$0048				;$B68F9C
	STA.w $1B77				;$B68F9F
	LDA.w #$0060				;$B68FA2
	STA.w $1B79				;$B68FA5
	LDA.w #$00C8				;$B68FA8
	STA.b $5C,x				;$B68FAB
	TXY					;$B68FAD
	INC.w $1B6F				;$B68FAE
	INC.w $1B71				;$B68FB1
CODE_B68FB4:
	TYX					;$B68FB4
	DEC.b $5C,x				;$B68FB5
	BNE.b CODE_B68FC8			;$B68FB7
	INC.b $38,x				;$B68FB9
	LDA.w #$0000				;$B68FBB
	STA.b $60,x				;$B68FBE
	LDA.w #$0070				;$B68FC0
	STA.b $62,x				;$B68FC3
	JMP.w CODE_B68EDA			;$B68FC5

CODE_B68FC8:
	JSR.w CODE_B68DE0			;$B68FC8
	JSR.w CODE_B690DD			;$B68FCB
	JML [$04F5]				;$B68FCE

CODE_B68FD1:
	LDA.w $0012,y				;$B68FD1
	BMI.b CODE_B68FDB			;$B68FD4
	CMP.w #$000A				;$B68FD6
	BCS.b CODE_B68FE5			;$B68FD9
CODE_B68FDB:
	JSL.l process_current_movement		;$B68FDB
	JSR.w CODE_B68DE0			;$B68FDF
	JMP.w CODE_B68F6D			;$B68FE2

CODE_B68FE5:
	JSR.w CODE_B68DE0			;$B68FE5
	JMP.w CODE_B68ED8			;$B68FE8

CODE_B68FEB:
	TYX					;$B68FEB
	LDA.b $1E,x				;$B68FEC
	AND.w #$3FFF				;$B68FEE
	STA.b $6C,x				;$B68FF1
	JSR.w CODE_B690B7			;$B68FF3
	LDA.w #$FF00				;$B68FF6
	STA.b $2A,x				;$B68FF9
	STA.b $30,x				;$B68FFB
	STZ.b $2E,x				;$B68FFD
	LDA.w #$FFF0				;$B68FFF
	STA.b $68,x				;$B69002
	LDA.w #$0050				;$B69004
	STA.w $1B73				;$B69007
	LDA.w #$00A0				;$B6900A
	STA.w $1B75				;$B6900D
	LDA.w #$0048				;$B69010
	STA.w $1B77				;$B69013
	LDA.w #$0060				;$B69016
	STA.w $1B79				;$B69019
	LDA.w #$0096				;$B6901C
	STA.b $5C,x				;$B6901F
	INC.w $1B6F				;$B69021
	INC.w $1B71				;$B69024
	LDA.w #$0009				;$B69027
	STA.b $38,x				;$B6902A
	LDA.w #$01C6				;$B6902C
	JSL.l set_sprite_animation		;$B6902F
	JML [$04F5]				;$B69033

CODE_B69036:
	TYX					;$B69036
	LDA.b $1E,x				;$B69037
	AND.w #$3FFF				;$B69039
	STA.b $6C,x				;$B6903C
	JSR.w CODE_B690B7			;$B6903E
	STZ.b $2A,x				;$B69041
	STZ.b $30,x				;$B69043
	LDA.w #$0100				;$B69045
	STA.b $2E,x				;$B69048
	LDA.w #$0010				;$B6904A
	STA.b $68,x				;$B6904D
	LDA.w #$0020				;$B6904F
	STA.b $6A,x				;$B69052
	LDA.w #$0060				;$B69054
	STA.w $1B73				;$B69057
	LDA.w #$00A0				;$B6905A
	STA.w $1B75				;$B6905D
	LDA.w #$0078				;$B69060
	STA.w $1B77				;$B69063
	LDA.w #$0098				;$B69066
	STA.w $1B79				;$B69069
	LDA.w #$0096				;$B6906C
	STA.b $5C,x				;$B6906F
	INC.b $38,x				;$B69071
	LDA.w #$01C6				;$B69073
	JSL.l set_sprite_animation		;$B69076
	JML [$04F5]				;$B6907A

CODE_B6907D:
	TYX					;$B6907D
	DEC.b $5C,x				;$B6907E
	BNE.b CODE_B69097			;$B69080
	INC.b $38,x				;$B69082
	LDA.w #$0080				;$B69084
	STA.b $60,x				;$B69087
	LDA.w #$0000				;$B69089
	STA.b $62,x				;$B6908C
	INC.w $1B6F				;$B6908E
	INC.w $1B71				;$B69091
	JMP.w CODE_B68EDA			;$B69094

CODE_B69097:
	JSR.w CODE_B690DD			;$B69097
	JML [$04F5]				;$B6909A

CODE_B6909D:
	LDA.w $0016,y				;$B6909D
	BMI.b CODE_B690A7			;$B690A0
	CMP.w #$000A				;$B690A2
	BCS.b CODE_B690B1			;$B690A5
CODE_B690A7:
	JSL.l process_current_movement		;$B690A7
	JSR.w CODE_B68DE0			;$B690AB
	JMP.w CODE_B68F6D			;$B690AE

CODE_B690B1:
	JSR.w CODE_B68DE0			;$B690B1
	JMP.w CODE_B68ED8			;$B690B4

CODE_B690B7:
	JSR.w CODE_B691BE			;$B690B7
	LDY.w #$0080				;$B690BA
	LDA.b $1E,x				;$B690BD
	BIT.w #$4000				;$B690BF
	BEQ.b CODE_B690C7			;$B690C2
	LDY.w #$FF80				;$B690C4
CODE_B690C7:
	STY.b $2A,x				;$B690C7
	STY.b $30,x				;$B690C9
	STY.b $66,x				;$B690CB
	JSR.w CODE_B691E4			;$B690CD
	STA.b $68,x				;$B690D0
	JSR.w CODE_B69217			;$B690D2
	STA.b $6A,x				;$B690D5
	LDA.w #$FE00				;$B690D7
	STA.b $2E,x				;$B690DA
	RTS					;$B690DC

CODE_B690DD:
	LDX.b current_sprite			;$B690DD
	LDA.b $12,x				;$B690DF
	CMP.w $1B73				;$B690E1
	BCS.b CODE_B690F4			;$B690E4
	LDA.b $68,x				;$B690E6
	BPL.b CODE_B690F4			;$B690E8
	JSR.w CODE_B691CC			;$B690EA
	STA.b $68,x				;$B690ED
	JSR.w CODE_B691BE			;$B690EF
	STA.b $64,x				;$B690F2
CODE_B690F4:
	LDA.b $12,x				;$B690F4
	CMP.w $1B75				;$B690F6
	BCC.b CODE_B6910D			;$B690F9
	LDA.b $68,x				;$B690FB
	BMI.b CODE_B6910D			;$B690FD
	JSR.w CODE_B691CC			;$B690FF
	EOR.w #$FFFF				;$B69102
	INC					;$B69105
	STA.b $68,x				;$B69106
	JSR.w CODE_B691BE			;$B69108
	STA.b $64,x				;$B6910B
CODE_B6910D:
	LDA.b $16,x				;$B6910D
	CMP.w $1B77				;$B6910F
	BCS.b CODE_B6911E			;$B69112
	LDA.b $6A,x				;$B69114
	BPL.b CODE_B6911E			;$B69116
	EOR.w #$FFFF				;$B69118
	INC					;$B6911B
	STA.b $6A,x				;$B6911C
CODE_B6911E:
	LDA.b $16,x				;$B6911E
	CMP.w $1B79				;$B69120
	BCC.b CODE_B6912F			;$B69123
	LDA.b $6A,x				;$B69125
	BMI.b CODE_B6912F			;$B69127
	EOR.w #$FFFF				;$B69129
	INC					;$B6912C
	STA.b $6A,x				;$B6912D
CODE_B6912F:
	DEC.b $64,x				;$B6912F
	BNE.b CODE_B6913D			;$B69131
	JSR.w CODE_B691E4			;$B69133
	STA.b $68,x				;$B69136
	JSR.w CODE_B691BE			;$B69138
	STA.b $64,x				;$B6913B
CODE_B6913D:
	JSR.w CODE_B691A1			;$B6913D
	LDA.b $66,x				;$B69140
	EOR.b $2A,x				;$B69142
	BPL.b CODE_B6914B			;$B69144
	JSR.w CODE_B69217			;$B69146
	STA.b $6A,x				;$B69149
CODE_B6914B:
	LDA.b $2A,x				;$B6914B
	STA.b $66,x				;$B6914D
	JSL.l process_current_movement		;$B6914F
	JSL.l process_sprite_animation		;$B69153
	JSR.w CODE_B6915B			;$B69157
	RTS					;$B6915A

CODE_B6915B:
	LDX.b current_sprite			;$B6915B
	LDA.b $1E,x				;$B6915D
	AND.w #$C000				;$B6915F
	STA.b $1A				;$B69162
	LDA.b $24,x				;$B69164
	SEC					;$B69166
	SBC.w #$01E0				;$B69167
	STA.w CPU.dividen_low			;$B6916A
	SEP.b #$20				;$B6916D
	LDA.b #$05				;$B6916F
	STA.w CPU.divisor			;$B69171
	REP.b #$20				;$B69174
	JSL.l stall_cpu_time			;$B69176
	LDA.w CPU.divide_result			;$B6917A
	TAY					;$B6917D
	LDA.w DATA_B6918C,y			;$B6917E
	AND.w #$00FF				;$B69181
	CLC					;$B69184
	ADC.b $6C,x				;$B69185
	ORA.b $1A				;$B69187
	STA.b $1E,x				;$B69189
	RTS					;$B6918B

DATA_B6918C:
	db $00,$02,$04,$06,$08,$0A,$0C,$0E,$20,$22,$24,$26,$28,$2A,$2C,$2E
	db $40,$42,$44,$46,$48

CODE_B691A1:
	LDA.b $68,x				;$B691A1
	JSL.l CODE_B58024			;$B691A3
	STA.b $2A,x				;$B691A7
	LDA.w #$0300				;$B691A9
	JSR.w CODE_B6F2B1			;$B691AC
	LDA.b $6A,x				;$B691AF
	JSL.l CODE_B5800F			;$B691B1
	STA.b $2E,x				;$B691B5
	LDA.w #$0140				;$B691B7
	JSR.w CODE_B6F2C9			;$B691BA
	RTS					;$B691BD

CODE_B691BE:
	LDA.w #$0014				;$B691BE
	JSL.l CODE_B58006			;$B691C1
	CLC					;$B691C5
	ADC.w #$0028				;$B691C6
	STA.b $64,x				;$B691C9
	RTS					;$B691CB

CODE_B691CC:
	LDA.w #$000D				;$B691CC
	JSL.l CODE_B58006			;$B691CF
	CLC					;$B691D3
	ADC.w #$002B				;$B691D4
	RTS					;$B691D7

CODE_B691D8:
	LDA.w #$0010				;$B691D8
	JSL.l CODE_B58006			;$B691DB
	CLC					;$B691DF
	ADC.w #$0020				;$B691E0
	RTS					;$B691E3

CODE_B691E4:
	JSR.w CODE_B691CC			;$B691E4
	STA.b $1A				;$B691E7
	LDA.w #$0002				;$B691E9
	JSL.l CODE_B58006			;$B691EC
	CMP.w #$0000				;$B691F0
	BEQ.b CODE_B691FC			;$B691F3
	LDA.b $1A				;$B691F5
	EOR.w #$FFFF				;$B691F7
	INC					;$B691FA
	RTS					;$B691FB

CODE_B691FC:
	LDA.b $1A				;$B691FC
	RTS					;$B691FE

CODE_B691FF:
	LDA.w #$0005				;$B691FF
	JSL.l CODE_B58006			;$B69202
	CLC					;$B69206
	ADC.w #$0005				;$B69207
	RTS					;$B6920A

CODE_B6920B:
	LDA.w #$0010				;$B6920B
	JSL.l CODE_B58006			;$B6920E
	CLC					;$B69212
	ADC.w #$0020				;$B69213
	RTS					;$B69216

CODE_B69217:
	JSR.w CODE_B691FF			;$B69217
	STA.b $1A				;$B6921A
	LDA.w #$0002				;$B6921C
	JSL.l CODE_B58006			;$B6921F
	CMP.w #$0000				;$B69223
	BEQ.b CODE_B6922F			;$B69226
	LDA.b $1A				;$B69228
	EOR.w #$FFFF				;$B6922A
	INC					;$B6922D
	RTS					;$B6922E

CODE_B6922F:
	LDA.b $1A				;$B6922F
	RTS					;$B69231

CODE_B69232:
	LSR					;$B69232
	LSR					;$B69233
	LSR					;$B69234
	LSR					;$B69235
	JSL.l CODE_B58006			;$B69236
	ASL					;$B6923A
	ASL					;$B6923B
	ASL					;$B6923C
	ASL					;$B6923D
	RTL					;$B6923E

door_lever_handle_main:
	JMP.w (DATA_B69242,x)			;$B6923F

DATA_B69242:
	dw CODE_B6925E
	dw CODE_B69295
	dw CODE_B692E8
	dw CODE_B6924A

CODE_B6924A:
	JSR.w CODE_B6F2DD			;$B6924A
	TAX					;$B6924D
	STZ.w $1B6F,x				;$B6924E
	TYX					;$B69251
	LDA.b $12,x				;$B69252
	STA.b $2C,x				;$B69254
	LDA.b $16,x				;$B69256
	STA.b $64,x				;$B69258
	STA.b $32,x				;$B6925A
	STZ.b $38,x				;$B6925C
CODE_B6925E:
	TYX					;$B6925E
	LDA.b $32,x				;$B6925F
	STA.b $16,x				;$B69261
	JSR.w CODE_B69441			;$B69263
	JSR.w CODE_B69301			;$B69266
	BEQ.b CODE_B69287			;$B69269
	INC.b $38,x				;$B6926B
	LDA.w #$066A				;$B6926D
	JSL.l queue_sound_effect		;$B69270
	LDA.w #$076B				;$B69274
	JSL.l queue_sound_effect		;$B69277
	LDA.w #$0390				;$B6927B
	JSR.w CODE_B692F9			;$B6927E
	TYX					;$B69281
	INC.b $6A,x				;$B69282
CODE_B69284:
	JMP.w return_handle_despawn		;$B69284

CODE_B69287:
	LDA.w #$0002				;$B69287
	JSL.l CODE_BEC00F			;$B6928A
	BCC.b CODE_B69293			;$B6928E
	JML [$04F5]				;$B69290

CODE_B69293:
	BRA.b CODE_B69284			;$B69293

CODE_B69295:
	TYX					;$B69295
	LDA.b $32,x				;$B69296
	STA.b $16,x				;$B69298
	JSR.w CODE_B69301			;$B6929A
	BEQ.b CODE_B692C2			;$B6929D
	LDY.b $68,x				;$B6929F
	BEQ.b CODE_B692AF			;$B692A1
	LDA.w #$C000				;$B692A3
	ORA.w $0474				;$B692A6
	STA.w $0474				;$B692A9
	JSR.w CODE_B6930B			;$B692AC
CODE_B692AF:
	LDA.w #$0390				;$B692AF
	JSR.w CODE_B692F9			;$B692B2
	LDA.b $60,x				;$B692B5
	STA.w $0060,y				;$B692B7
	LDX.b current_sprite			;$B692BA
	JSR.w CODE_B69441			;$B692BC
	JMP.w return_handle_despawn		;$B692BF

CODE_B692C2:
	STZ.w $04AA				;$B692C2
	STZ.w $04AE				;$B692C5
	LDA.w #$001E				;$B692C8
	STA.b $5C,x				;$B692CB
	INC.b $38,x				;$B692CD
	LDA.w #$0390				;$B692CF
	JSR.w CODE_B692F9			;$B692D2
	TYX					;$B692D5
	STZ.b $60,x				;$B692D6
	JSL.l CODE_B6F186			;$B692D8
	BCS.b CODE_B692E5			;$B692DC
	LDA.w #$0773				;$B692DE
	JSL.l queue_sound_effect		;$B692E1
CODE_B692E5:
	JMP.w return_handle_despawn		;$B692E5

CODE_B692E8:
	TYX					;$B692E8
	LDA.b $32,x				;$B692E9
	STA.b $16,x				;$B692EB
	DEC.b $5C,x				;$B692ED
	BNE.b CODE_B692F3			;$B692EF
	STZ.b $38,x				;$B692F1
CODE_B692F3:
	JSR.w CODE_B69441			;$B692F3
	JMP.w return_handle_despawn		;$B692F6

CODE_B692F9:
	JSR.w CODE_B6F2E8			;$B692F9
	TYA					;$B692FC
	BNE.b CODE_B69300			;$B692FD
	STP					;$B692FF / Intentional STP

CODE_B69300:
	RTS					;$B69300

CODE_B69301:
	LDX.b current_sprite			;$B69301
	LDA.w #$0040				;$B69303
	AND.b $3C,x				;$B69306
	STZ.b $3C,x				;$B69308
	RTS					;$B6930A

CODE_B6930B:
	STY.b $1C				;$B6930B
	LDA.w $04AC				;$B6930D
	LSR					;$B69310
	STA.b $1A				;$B69311
	LDA.b $1C				;$B69313
	AND.w #$FF00				;$B69315
	CLC					;$B69318
	ADC.w #$3C00				;$B69319
	SEC					;$B6931C
	SBC.b $1A				;$B6931D
	STA.w $04AE				;$B6931F
	LDA.w $04A6				;$B69322
	LSR					;$B69325
	STA.b $1A				;$B69326
	LDA.b $1B				;$B69328
	AND.w #$FF00				;$B6932A
	CLC					;$B6932D
	ADC.w #$4000				;$B6932E
	SEC					;$B69331
	SBC.b $1A				;$B69332
	STA.w $04AA				;$B69334
	RTS					;$B69337

metal_door_lever_controlled_main:
	JMP.w (DATA_B6933B,x)			;$B69338

DATA_B6933B:
	dw CODE_B6933F
	dw CODE_B69350

CODE_B6933F:
	TYX					;$B6933F
	STZ.b $60,x				;$B69340
	STZ.b $66,x				;$B69342
	LDA.b $16,x				;$B69344
	STA.b $5C,x				;$B69346
	LDA.b $0E,x				;$B69348
	STA.b $18,x				;$B6934A
	STZ.b $68,x				;$B6934C
	INC.b $38,x				;$B6934E
CODE_B69350:
	TYX					;$B69350
	LDA.b $6A,x				;$B69351
	BEQ.b CODE_B69364			;$B69353
	JSL.l CODE_B6F186			;$B69355
	BCS.b CODE_B69364			;$B69359
	STZ.b $6A,x				;$B6935B
	LDA.w #$0774				;$B6935D
	JSL.l queue_sound_effect		;$B69360
CODE_B69364:
	JSL.l CODE_BEC048			;$B69364
	LDA.w #$0394				;$B69368
	JSR.w CODE_B692F9			;$B6936B
	LDA.b $60,x				;$B6936E
	BNE.b CODE_B69374			;$B69370
	LDA.b $62,x				;$B69372
CODE_B69374:
	STA.w $005E,y				;$B69374
	STY.b $1A				;$B69377
	SEP.b #$20				;$B69379
	LDA.b $5E,x				;$B6937B
	STA.w CPU.multiply_A			;$B6937D
	REP.b #$20				;$B69380
	JSR.w CODE_B6F2DD			;$B69382
	TAY					;$B69385
	LDA.w $1B6F,y				;$B69386
	SEP.b #$20				;$B69389
	STA.w CPU.multiply_B			;$B6938B
	REP.b #$20				;$B6938E
	NOP					;$B69390
	LDA.w CPU.multiply_result		;$B69391
	XBA					;$B69394
	AND.w #$00FF				;$B69395
	STA.w $1C15				;$B69398
	LDA.b $5C,x				;$B6939B
	SEC					;$B6939D
	SBC.w $1C15				;$B6939E
	STA.b $16,x				;$B693A1
	JSR.w CODE_B6F2DD			;$B693A3
	TAY					;$B693A6
	LDA.b $60,x				;$B693A7
	BEQ.b CODE_B693C7			;$B693A9
	CLC					;$B693AB
	ADC.w $1B6F,y				;$B693AC
	CMP.w #$00FF				;$B693AF
	BCC.b CODE_B693BC			;$B693B2
	LDA.w #$00FF				;$B693B4
	STA.w $1B6F,y				;$B693B7
	BRA.b CODE_B693F3			;$B693BA

CODE_B693BC:
	STA.w $1B6F,y				;$B693BC
	STZ.b $60,x				;$B693BF
	LDA.w #$0001				;$B693C1
	PHA					;$B693C4
	BRA.b CODE_B693ED			;$B693C5

CODE_B693C7:
	LDA.b $66,x				;$B693C7
	AND.w #$00FF				;$B693C9
	CLC					;$B693CC
	ADC.b $64,x				;$B693CD
	STA.b $66,x				;$B693CF
	CMP.w #$0100				;$B693D1
	BCC.b CODE_B693F6			;$B693D4
	LDA.w $1B6F,y				;$B693D6
	SEC					;$B693D9
	SBC.b $62,x				;$B693DA
	BPL.b CODE_B693E6			;$B693DC
	LDA.w #$0000				;$B693DE
	STA.w $1B6F,y				;$B693E1
	BRA.b CODE_B693F3			;$B693E4

CODE_B693E6:
	STA.w $1B6F,y				;$B693E6
CODE_B693E9:
	LDA.w #$0000				;$B693E9
	PHA					;$B693EC
CODE_B693ED:
	LDY.b $1A				;$B693ED
	PLA					;$B693EF
	STA.w $005C,y				;$B693F0
CODE_B693F3:
	JMP.w return_handle_despawn		;$B693F3

CODE_B693F6:
	LDA.w $1B6F,y				;$B693F6
	LDX.b $1A				;$B693F9
	INC.b $60,x				;$B693FB
	BRA.b CODE_B693E9			;$B693FD

door_gear_main:
	JMP.w (DATA_B69402,x)			;$B693FF

DATA_B69402:
	dw CODE_B69406
	dw CODE_B6940D

CODE_B69406:
	TYX					;$B69406
	LDA.b $0E,x				;$B69407
	STA.b $18,x				;$B69409
	INC.b $38,x				;$B6940B
CODE_B6940D:
	TYX					;$B6940D
	LDA.b $60,x				;$B6940E
	BNE.b CODE_B6943A			;$B69410
	JSR.w CODE_B6F2DD			;$B69412
	TAY					;$B69415
	LDA.w $1B6F,y				;$B69416
	BEQ.b CODE_B6943A			;$B69419
	CMP.w #$00FF				;$B6941B
	BEQ.b CODE_B6943A			;$B6941E
	SEP.b #$20				;$B69420
	LDA.b #$40				;$B69422
	STA.w CPU.multiply_A			;$B69424
	LDA.b $5E,x				;$B69427
	STA.w CPU.multiply_B			;$B69429
	REP.b #$20				;$B6942C
	NOP					;$B6942E
	LDA.w CPU.multiply_result		;$B6942F
	STA.b $44,x				;$B69432
	JSL.l process_sprite_animation		;$B69434
	BRA.b CODE_B6943C			;$B69438

CODE_B6943A:
	STZ.b $44,x				;$B6943A
CODE_B6943C:
	STZ.b $60,x				;$B6943C
	JMP.w return_handle_despawn		;$B6943E

CODE_B69441:
	SEP.b #$20				;$B69441
	LDA.b $66,x				;$B69443
	STA.w CPU.multiply_A			;$B69445
	REP.b #$20				;$B69448
	JSR.w CODE_B6F2DD			;$B6944A
	TAY					;$B6944D
	LDA.w $1B6F,y				;$B6944E
	SEP.b #$20				;$B69451
	STA.w CPU.multiply_B			;$B69453
	REP.b #$20				;$B69456
	NOP					;$B69458
	LDA.w CPU.multiply_result_high		;$B69459
	AND.w #$00FF				;$B6945C
	CLC					;$B6945F
	ADC.b $64,x				;$B69460
	STA.b $32,x				;$B69462
	RTS					;$B69464

unknown_sprite_0180_main:
	INC.w $054F				;$B69465
	JSL.l CODE_BB85A9			;$B69468
	JSL.l delete_sprite_no_deallocation	;$B6946C
	JML [$04F5]				;$B69470

squeals_on_wheels_door_handler_main:
	JMP.w (DATA_B69476,x)			;$B69473

DATA_B69476:
	dw CODE_B69482
	dw CODE_B694D3
	dw CODE_B694FC

DATA_B6947C:
	dw $0557,$0563,$056F

CODE_B69482:
	TYX					;$B69482
	STZ.b $1A				;$B69483
	SEC					;$B69485
	LDA.b $5C,x				;$B69486
CODE_B69488:
	ROL.b $1A				;$B69488
	DEC					;$B6948A
	BPL.b CODE_B69488			;$B6948B
	LDA.b $1A				;$B6948D
	BIT.w $1B6D				;$B6948F
	BEQ.b CODE_B6949F			;$B69492
	JSL.l CODE_BB85A9			;$B69494
	JSL.l delete_sprite_no_deallocation	;$B69498
	JML [$04F5]				;$B6949C

CODE_B6949F:
	TSB.w $1B6D				;$B6949F
	INC.b $38,x				;$B694A2
	LDA.w $054F				;$B694A4
	BNE.b CODE_B694D3			;$B694A7
	LDA.b $5C,x				;$B694A9
	ASL					;$B694AB
	TAX					;$B694AC
	STZ.w $0551,x				;$B694AD
	TYX					;$B694B0
	LDA.b $5C,x				;$B694B1
	ASL					;$B694B3
	TAY					;$B694B4
	LDA.w DATA_B6947C,y			;$B694B5
	TAY					;$B694B8
	LDA.b $5E,x				;$B694B9
	STA.w $1C15				;$B694BB
	LDA.w #$0001				;$B694BE
	JSR.w CODE_B694FF			;$B694C1
	LDA.w #$000C				;$B694C4
	SEC					;$B694C7
	SBC.b $5E,x				;$B694C8
	STA.w $1C15				;$B694CA
	LDA.w #$0000				;$B694CD
	JSR.w CODE_B694FF			;$B694D0
CODE_B694D3:
	LDX.b current_sprite			;$B694D3
	JSR.w CODE_B696FC			;$B694D5
	BNE.b CODE_B694FC			;$B694D8
	LDA.b $5C,x				;$B694DA
	CMP.w #$0002				;$B694DC
	BNE.b CODE_B694E7			;$B694DF
	LDY.w #$0020				;$B694E1
	STY.w $18F5				;$B694E4
CODE_B694E7:
	ASL					;$B694E7
	TAY					;$B694E8
	LDA.b $60,x				;$B694E9
	CLC					;$B694EB
	ADC.w $0551,y				;$B694EC
	CMP.w #$00FF				;$B694EF
	BCC.b CODE_B694F9			;$B694F2
	INC.b $38,x				;$B694F4
	LDA.w #$00FF				;$B694F6
CODE_B694F9:
	STA.w $0551,y				;$B694F9
CODE_B694FC:
	JML [$04F5]				;$B694FC

CODE_B694FF:
	SEP.b #$20				;$B694FF
CODE_B69501:
	STA.w $0000,y				;$B69501
	INY					;$B69504
	DEC.w $1C15				;$B69505
	BNE.b CODE_B69501			;$B69508
	REP.b #$20				;$B6950A
	RTS					;$B6950C

sneek_wheel_main:
	LDA.w $0064,y				;$B6950D
	BEQ.b CODE_B69545			;$B69510
	PHY					;$B69512
	PHX					;$B69513
	TYX					;$B69514
	DEC.b $64,x				;$B69515
	BNE.b CODE_B69543			;$B69517
	JSR.w CODE_B6971D			;$B69519
	TYX					;$B6951C
	LDA.w #$0020				;$B6951D
	STA.w $15EA				;$B69520
	SEP.b #$20				;$B69523
	STZ.b $00,x				;$B69525
	REP.b #$20				;$B69527
	LDX.b current_sprite			;$B69529
	JSR.w CODE_B696F5			;$B6952B
	BNE.b CODE_B6953C			;$B6952E
	LDA.w #$0773				;$B69530
	JSL.l queue_sound_effect		;$B69533
	LDA.w #$0772				;$B69537
	BRA.b CODE_B6953F			;$B6953A

CODE_B6953C:
	LDA.w #$0771				;$B6953C
CODE_B6953F:
	JSL.l queue_sound_effect		;$B6953F
CODE_B69543:
	PLX					;$B69543
	PLY					;$B69544
CODE_B69545:
	JMP.w (DATA_B69548,x)			;$B69545

DATA_B69548:
	dw CODE_B69552
	dw CODE_B695F5
	dw CODE_B6962A
	dw CODE_B6963A
	dw CODE_B69646

CODE_B69552:
	JSL.l CODE_B6840E			;$B69552
	LDY.w #$019E				;$B69556
	LDA.w #$0008				;$B69559
	TSB.w $1C33				;$B6955C
	BEQ.b CODE_B69567			;$B6955F
	TRB.w $1C33				;$B69561
	LDY.w #$019F				;$B69564
CODE_B69567:
	TYA					;$B69567
	JSL.l set_sprite_animation		;$B69568
	LDX.b current_sprite			;$B6956C
	JSR.w CODE_B6971D			;$B6956E
	LDA.b $5D,x				;$B69571
	AND.w #$00FF				;$B69573
	CMP.w #$0003				;$B69576
	BEQ.b CODE_B69583			;$B69579
	LDA.w $0000,y				;$B6957B
	AND.w #$00FF				;$B6957E
	BEQ.b CODE_B695EE			;$B69581
CODE_B69583:
	LDY.w #$009C				;$B69583
	JSL.l CODE_BB8585			;$B69586
	LDX.b current_sprite			;$B6958A
	LDY.b alternate_sprite			;$B6958C
	STX.b $5C,y				;$B6958E
	STY.b $5E,x				;$B69590
	INC.b $38,x				;$B69592
	LDA.b $60,x				;$B69594
	LSR					;$B69596
	ROR					;$B69597
	ROR					;$B69598
	EOR.w #$4000				;$B69599
	PHA					;$B6959C
	LDA.b $62,x				;$B6959D
	ASL					;$B6959F
	TAY					;$B695A0
	LDX.w DATA_B6F476,y			;$B695A1
	LDY.b alternate_sprite			;$B695A4
	LDA.w $0002,x				;$B695A6
	STA.w $0044,y				;$B695A9
	LDA.w $0004,x				;$B695AC
	AND.w #$00FF				;$B695AF
	JSL.l CODE_B58021			;$B695B2
	CLC					;$B695B6
	ADC.w $0012,y				;$B695B7
	STA.w $0012,y				;$B695BA
	LDA.w $0005,x				;$B695BD
	AND.w #$00FF				;$B695C0
	JSL.l CODE_B58021			;$B695C3
	CLC					;$B695C7
	ADC.w $0016,y				;$B695C8
	STA.w $0016,y				;$B695CB
	PLA					;$B695CE
	EOR.w $001E,y				;$B695CF
	STA.w $001E,y				;$B695D2
	LDA.w $0006,x				;$B695D5
	STA.w $005E,y				;$B695D8
	LDA.w $0002,x				;$B695DB
	PHA					;$B695DE
	LDA.w $0000,x				;$B695DF
	JSL.l set_alt_sprite_animation		;$B695E2
	LDY.b alternate_sprite			;$B695E6
	PLA					;$B695E8
	STA.w $0044,y				;$B695E9
	BRA.b CODE_B695F5			;$B695EC

CODE_B695EE:
	LDA.w #$0002				;$B695EE
	STA.b $38,x				;$B695F1
	STZ.b $5E,x				;$B695F3
CODE_B695F5:
	JSL.l process_sprite_animation		;$B695F5
	LDA.w #$0024				;$B695F9
	JSL.l CODE_BFF009			;$B695FC
	LDA.w #$0025				;$B69600
	JSL.l CODE_BFF009			;$B69603
CODE_B69607:
	JSL.l CODE_BBAB52			;$B69607
	BCC.b CODE_B69620			;$B6960B
	LDX.b current_sprite			;$B6960D
	LDA.b $5E,x				;$B6960F
	BEQ.b CODE_B6961D			;$B69611
	PHX					;$B69613
	STA.b current_sprite			;$B69614
	JSL.l delete_sprite_handle_deallocation	;$B69616
	PLX					;$B6961A
	STX.b current_sprite			;$B6961B
CODE_B6961D:
	JML [$04F5]				;$B6961D

CODE_B69620:
	LDA.w #CODE_B69668			;$B69620
	JSL.l CODE_BB85D6			;$B69623
	JML [$04F5]				;$B69627

CODE_B6962A:
	JSL.l CODE_BBAB52			;$B6962A
	BCS.b CODE_B69637			;$B6962E
	LDA.w #CODE_B69668			;$B69630
	JSL.l CODE_BB85D6			;$B69633
CODE_B69637:
	JML [$04F5]				;$B69637

CODE_B6963A:
	LDA.w #$0004				;$B6963A
	STA.w $0038,y				;$B6963D
	LDA.w #$001E				;$B69640
	STA.w $0064,y				;$B69643
CODE_B69646:
	TYX					;$B69646
	LDA.b $44,x				;$B69647
	SEC					;$B69649
	SBC.w #$0001				;$B6964A
	CMP.w #$000F				;$B6964D
	BCS.b CODE_B69659			;$B69650
	LDA.w #$0002				;$B69652
	STA.b $38,x				;$B69655
	BRA.b CODE_B69666			;$B69657

CODE_B69659:
	STA.b $44,x				;$B69659
	JSL.l process_sprite_animation		;$B6965B
	LDA.w #$0569				;$B6965F
	JSL.l CODE_B28024			;$B69662
CODE_B69666:
	BRA.b CODE_B69607			;$B69666

CODE_B69668:
	JSL.l CODE_BEC018			;$B69668
	RTL					;$B6966C


sneek_in_wheel_main:
	JMP (.state_table,x)			;$B6966D

.state_table:
	dw .idle
	dw generic_move_and_animate_state

.idle:
	TYX					;$B69674  \ Get wheel sneek sprite
	LDA #$0038				;$B69675   | Get collision flags
	JSL check_throwable_collision		;$B69678   | Check throwable collision
	BCS ..collision_happened		;$B6967C   |
	JMP CODE_B685E6				;$B6967E  / Return and process animation

..collision_happened:
	INC sprite.state,x			;$B69681  \ Set defeated state
	LDA sprite.general_purpose_5E,x		;$B69683   |
	JSR defeat_sprite_using_animation	;$B69685   |
	LDA #$063C				;$B69688   |
	JSL queue_sound_effect			;$B6968B   | Play sneek hurt sound effect
	JSR CODE_B680A9				;$B6968F   | Make him fall offscreen
	LDY sprite.general_purpose_5C,x		;$B69692   |
	LDA #$0003				;$B69694   |
	STA.w sprite.state,y			;$B69697   |
	TYX					;$B6969A   |
	STZ sprite.general_purpose_5E,x		;$B6969B   |
	JMP CODE_B680C9				;$B6969D  / Return and handle despawn

generic_move_and_animate_state:
	JSL process_current_movement		;$B696A0  \ Process current movement
	JSL process_sprite_animation		;$B696A4   |
	JMP CODE_B680C9				;$B696A8  / Return and handle despawn


squeals_on_wheels_tracker_main:
	TYX					;$B696AB
	JSR CODE_B696FC				;$B696AC
	STA $15E6				;$B696AF
	JMP return_handle_despawn		;$B696B2


metal_door_sneek_controlled_main:
	JMP (DATA_B696B8,x)			;$B696B5

DATA_B696B8:
	dw CODE_B696BC
	dw CODE_B696C3

CODE_B696BC:
	TYX					;$B696BC
	LDA.b $16,x				;$B696BD
	STA.b $5C,x				;$B696BF
	INC.b $38,x				;$B696C1
CODE_B696C3:
	TYX					;$B696C3
	SEP.b #$20				;$B696C4
	LDA.b $5E,x				;$B696C6
	STA.w CPU.multiply_A			;$B696C8
	REP.b #$20				;$B696CB
	LDA.b $60,x				;$B696CD
	ASL					;$B696CF
	TAY					;$B696D0
	LDA.w $0551,y				;$B696D1
	SEP.b #$20				;$B696D4
	STA.w CPU.multiply_B			;$B696D6
	REP.b #$20				;$B696D9
	NOP					;$B696DB
	LDA.w CPU.multiply_result		;$B696DC
	XBA					;$B696DF
	AND.w #$00FF				;$B696E0
	STA.w $1C15				;$B696E3
	LDA.b $5C,x				;$B696E6
	SEC					;$B696E8
	SBC.w $1C15				;$B696E9
	STA.b $16,x				;$B696EC
	JSL.l CODE_BEC048			;$B696EE
	JMP.w return_handle_despawn		;$B696F2

CODE_B696F5:
	LDA.b $5D,x				;$B696F5
	AND.w #$00FF				;$B696F7
	BRA.b CODE_B696FE			;$B696FA

CODE_B696FC:
	LDA.b $5C,x				;$B696FC
CODE_B696FE:
	ASL					;$B696FE
	TAY					;$B696FF
	LDA.w DATA_B6947C,y			;$B69700
	TAY					;$B69703
	STZ.b $1C				;$B69704
	SEP.b #$20				;$B69706
	LDA.b #$0C				;$B69708
	STA.b $1A				;$B6970A
CODE_B6970C:
	LDA.w $0000,y				;$B6970C
	BEQ.b CODE_B69713			;$B6970F
	INC.b $1C				;$B69711
CODE_B69713:
	INY					;$B69713
	DEC.b $1A				;$B69714
	BNE.b CODE_B6970C			;$B69716
	REP.b #$20				;$B69718
	LDA.b $1C				;$B6971A
	RTS					;$B6971C

CODE_B6971D:
	LDA.b $5D,x				;$B6971D
	AND.w #$00FF				;$B6971F
	ASL					;$B69722
	TAY					;$B69723
	LDA.w DATA_B6947C,y			;$B69724
	STA.w $1C15				;$B69727
	LDA.b $5C,x				;$B6972A
	AND.w #$00FF				;$B6972C
	CLC					;$B6972F
	ADC.w $1C15				;$B69730
	TAY					;$B69733
	RTS					;$B69734

ripsaw_rage_handler_main:
	LDA level_number			;$B69735
	CMP #!level_ripsaw_rage			;$B69737
	BEQ .main_level				;$B6973A
	JMP CODE_B6979A				;$B6973C

.main_level:
	TYX					;$B6973F
	LDA $5C,x				;$B69740
	BEQ CODE_B69748				;$B69742
	DEC $5C,x				;$B69744
	BRA CODE_B6979A				;$B69746

CODE_B69748:
	LDA active_frame_counter		;$B69748
	ASL					;$B6974A
	CLC					;$B6974B
	ADC active_frame_counter		;$B6974C
	ASL					;$B6974E
	ASL					;$B6974F
	AND #$01F0				;$B69750
	LDY #$00BC				;$B69753
	CMP #$01A0				;$B69756
	BEQ CODE_B69763				;$B69759
	LDY #$00BE				;$B6975B
	CMP #$00A0				;$B6975E
	BNE CODE_B6979A				;$B69761
CODE_B69763:
	STY $1E					;$B69763
	LDA #$0004				;$B69765
	STA $5C,x				;$B69768
	LDA $196D				;$B6976A
	SEC					;$B6976D
	SBC #$0018				;$B6976E
	STA $1A					;$B69771
	ADC #$0130				;$B69773
	STA $1C					;$B69776
	LDY $5E,x				;$B69778
CODE_B6977A:
	LDA $0000,y				;$B6977A
	BMI CODE_B6979A				;$B6977D
	CMP $1A					;$B6977F
	BCC CODE_B69796				;$B69781
	CMP $1C					;$B69783
	BCS CODE_B69796				;$B69785
	PHY					;$B69787
	LDY $1E					;$B69788
	JSL CODE_BB8585				;$B6978A
	PLY					;$B6978E
	LDX alternate_sprite			;$B6978F
	LDA $0000,y				;$B69791
	STA $12,x				;$B69794
CODE_B69796:
	INY					;$B69796
	INY					;$B69797
	BRA.b CODE_B6977A			;$B69798

CODE_B6979A:
	LDY active_kong_sprite			;$B6979A
	LDA $0012,y				;$B6979D
	CMP #$0150				;$B697A0
	BCC CODE_B697B4				;$B697A3
	CMP #$0230				;$B697A5
	BCC CODE_B697B9				;$B697A8
	CMP #$02D0				;$B697AA
	BCC CODE_B697B4				;$B697AD
	CMP #$03B0				;$B697AF
	BCC CODE_B697B9				;$B697B2
CODE_B697B4:
	LDA #$3000				;$B697B4
	BRA CODE_B697BC				;$B697B7

CODE_B697B9:
	LDA #$2000				;$B697B9
CODE_B697BC:
	STA $1D85				;$B697BC
	JML [$04F5]				;$B697BF

;Unreferenced
DATA_B697C2:
	dw $0159
	dw $0218
	dw $02D9
	dw $039B
	dw $FFFF

ripsaw_rage_sawdust_main:
	LDA active_frame_counter		;$B697CC
	ASL					;$B697CE
	CLC					;$B697CF
	ADC active_frame_counter		;$B697D0
	ASL					;$B697D2
	ASL					;$B697D3
	ASL					;$B697D4
	CLC					;$B697D5
	ADC #$01A0				;$B697D6
	AND #$01FE				;$B697D9
	TAX					;$B697DC
	LDA.l DATA_B9F278,x			;$B697DD
	CLC					;$B697E1
	ADC #$0100				;$B697E2
	LSR					;$B697E5
	LSR					;$B697E6
	LSR					;$B697E7
	LSR					;$B697E8
	LSR					;$B697E9
	LSR					;$B697EA
	TYX					;$B697EB
	EOR #$FFFF				;$B697EC
	CLC					;$B697EF
	ADC $1973				;$B697F0
	ADC #$00D2				;$B697F3
	STA sprite.y_position,x			;$B697F6
	JMP.w CODE_B6BF79			;$B697F8

unknown_sprite_03B0_main:
rekoil_main:
	JMP.w (DATA_B697FE,x)			;$B697FB

DATA_B697FE:
	dw CODE_B69814
	dw CODE_B6981D
	dw CODE_B69827
	dw CODE_B6985A
	dw CODE_B6985D
	dw CODE_B6986B
	dw CODE_B69887
	dw CODE_B6988D
	dw CODE_B69893
	dw CODE_B698A6
	dw CODE_B698AC

CODE_B69814:
	TYX					;$B69814
	INC.b $38,x				;$B69815
	JSR.w CODE_B69911			;$B69817
	JML [$04F5]				;$B6981A

CODE_B6981D:
	LDX.b current_sprite			;$B6981D
	JSR.w CODE_B69939			;$B6981F
	LDA.w #$0002				;$B69822
	STA.b $38,x				;$B69825
CODE_B69827:
	JSR.w CODE_B698E1			;$B69827
	JSL.l process_current_movement		;$B6982A
	LDA.b $28,x				;$B6982E
	AND.w #$0101				;$B69830
	CMP.w #$0001				;$B69833
	BNE.b CODE_B69855			;$B69836
	LDA.w #$0001				;$B69838
	STA.b $38,x				;$B6983B
	SEP.b #$20				;$B6983D
	INC.b $29,x				;$B6983F
	STZ.b $5A,x				;$B69841
	DEC.b $5E,x				;$B69843
	BNE.b CODE_B69855			;$B69845
	LDA.b $5F,x				;$B69847
	STA.b $5E,x				;$B69849
	REP.b #$20				;$B6984B
	LDA.b $5C,x				;$B6984D
	EOR.w #$FFFF				;$B6984F
	INC					;$B69852
	STA.b $5C,x				;$B69853
CODE_B69855:
	REP.b #$20				;$B69855
	JMP.w return_handle_anim_and_despawn	;$B69857

CODE_B6985A:
	JMP.w generic_move_and_animate_state	;$B6985A

CODE_B6985D:
	TYX					;$B6985D
	INC.b $38,x				;$B6985E
	LDA.b $12,x				;$B69860
	STA.b $62,x				;$B69862
	LDA.b $16,x				;$B69864
	STA.b $64,x				;$B69866
	JSR.w CODE_B6F284			;$B69868
CODE_B6986B:
	JSR.w CODE_B698E1			;$B6986B
	JSL.l process_current_movement		;$B6986E
	LDA.b $28,x				;$B69872
	AND.w #$0101				;$B69874
	CMP.w #$0001				;$B69877
	BNE.b CODE_B69884			;$B6987A
	SEP.b #$20				;$B6987C
	INC.b $29,x				;$B6987E
	STZ.b $5A,x				;$B69880
	REP.b #$20				;$B69882
CODE_B69884:
	JMP.w return_handle_anim_and_despawn	;$B69884

CODE_B69887:
	TYX					;$B69887
	INC.b $38,x				;$B69888
	JSR.w CODE_B6F284			;$B6988A
CODE_B6988D:
	JSR.w CODE_B698E1			;$B6988D
	JMP.w return_handle_anim_and_despawn	;$B69890

CODE_B69893:
	TYX					;$B69893
	LDY.b $5C,x				;$B69894
	TYA					;$B69896
	EOR.b $1E,x				;$B69897
	ASL					;$B69899
	BPL.b CODE_B698A3			;$B6989A
	TYA					;$B6989C
	EOR.w #$FFFF				;$B6989D
	INC					;$B698A0
	STA.b $5C,x				;$B698A1
CODE_B698A3:
	INC.b $38,x				;$B698A3
	TXY					;$B698A5
CODE_B698A6:
	TYX					;$B698A6
	INC.b $38,x				;$B698A7
	JSR.w CODE_B69939			;$B698A9
CODE_B698AC:
	JSR.w CODE_B698E1			;$B698AC
	JSL.l process_current_movement		;$B698AF
	LDA.b $28,x				;$B698B3
	AND.w #$0101				;$B698B5
	CMP.w #$0001				;$B698B8
	BNE.b CODE_B698C6			;$B698BB
	DEC.b $38,x				;$B698BD
	INC.b $29,x				;$B698BF
	STZ.b $5A,x				;$B698C1
	JMP.w return_handle_anim_and_despawn	;$B698C3

CODE_B698C6:
	LDA.b $28,x				;$B698C6
	BIT.w #$0002				;$B698C8
	BEQ.b CODE_B698DE			;$B698CB
	STZ.b $2A,x				;$B698CD
	LDA.w #$01EE				;$B698CF
	CMP.b $40,x				;$B698D2
	BNE.b CODE_B698DE			;$B698D4
	LDA.b $5C,x				;$B698D6
	EOR.w #$FFFF				;$B698D8
	INC					;$B698DB
	STA.b $5C,x				;$B698DC
CODE_B698DE:
	JMP.w return_handle_anim_and_despawn	;$B698DE

CODE_B698E1:
	LDA.w #$0038				;$B698E1
	JSL.l check_throwable_collision		;$B698E4
	BCS.b CODE_B69907			;$B698E8
	LDA.b $28,x				;$B698EA
	AND.w #$0101				;$B698EC
	BEQ.b CODE_B698F8			;$B698EF
	LDA.b $1C,x				;$B698F1
	BIT.w #$0100				;$B698F3
	BNE.b CODE_B69907			;$B698F6
CODE_B698F8:
	JSL.l populate_sprite_clipping		;$B698F8
	LDA.w #$08A8				;$B698FC
	JSL.l CODE_BEC009			;$B698FF
	BCC.b CODE_B69910			;$B69903
	BEQ.b CODE_B69910			;$B69905
CODE_B69907:
	LDY.w #$0003				;$B69907
	LDA.w #$01F1				;$B6990A
	JMP.w CODE_B6878B			;$B6990D

CODE_B69910:
	RTS					;$B69910

CODE_B69911:
	LDA.b $5C,x				;$B69911
	STA.w CPU.dividen_low			;$B69913
	SEP.b #$20				;$B69916
	LDA.b $5E,x				;$B69918
	STA.b $5F,x				;$B6991A
	STA.w CPU.divisor			;$B6991C
	REP.b #$20				;$B6991F
	JSL.l stall_cpu_time			;$B69921
	LDA.b $1E,x				;$B69925
	ASL					;$B69927
	BPL.b CODE_B69933			;$B69928
	LDA.w CPU.divide_result			;$B6992A
	EOR.w #$FFFF				;$B6992D
	INC					;$B69930
	BRA.b CODE_B69936			;$B69931

CODE_B69933:
	LDA.w CPU.divide_result			;$B69933
CODE_B69936:
	STA.b $5C,x				;$B69936
	RTS					;$B69938

CODE_B69939:
	LDA.b $12,x				;$B69939
	CLC					;$B6993B
	ADC.b $5C,x				;$B6993C
	STA.b $62,x				;$B6993E
	LDA.b $16,x				;$B69940
	STA.b $64,x				;$B69942
	RTS					;$B69944

kuff_n_klout_handler_main:
	STY.w $1C15				;$B69945
	PHX					;$B69948
	LDA.w $000A,y				;$B69949
	XBA					;$B6994C
	AND.w #$001F				;$B6994D
	DEC					;$B69950
	BPL.b CODE_B69997			;$B69951
	JSL.l CODE_BBAB29			;$B69953
	BCC.b CODE_B69997			;$B69957
	LDA.w $005E,y				;$B69959
	BEQ.b CODE_B69966			;$B6995C
	STA.b current_sprite			;$B6995E
	JSL.l CODE_BBAB29			;$B69960
	BCC.b CODE_B69997			;$B69964
CODE_B69966:
	LDY.w $1C15				;$B69966
	LDA.w $0060,y				;$B69969
	BEQ.b CODE_B69976			;$B6996C
	STA.b current_sprite			;$B6996E
	JSL.l CODE_BBAB29			;$B69970
	BCC.b CODE_B69997			;$B69974
CODE_B69976:
	PLX					;$B69976
	LDX.w $1C15				;$B69977
	STX.b current_sprite			;$B6997A
	LDY.b $5E,x				;$B6997C
	BEQ.b CODE_B69983			;$B6997E
	JSR.w CODE_B6F3EB			;$B69980
CODE_B69983:
	LDY.b $60,x				;$B69983
	BEQ.b CODE_B6998A			;$B69985
	JSR.w CODE_B6F3EB			;$B69987
CODE_B6998A:
	LDA.b $5E,x				;$B6998A
	ORA.b $60,x				;$B6998C
	BNE.b CODE_B69994			;$B6998E
	JSL.l CODE_BB85A9			;$B69990
CODE_B69994:
	JMP.w return_handle_despawn		;$B69994

CODE_B69997:
	LDY.w $1C15				;$B69997
	STY.b current_sprite			;$B6999A
	PLX					;$B6999C
	JMP.w (DATA_B699A0,x)			;$B6999D

DATA_B699A0:
	dw CODE_B699BC
	dw CODE_B699CC
	dw CODE_B69A0E
	dw CODE_B69A1F
	dw CODE_B69A22
	dw CODE_B69A52
	dw CODE_B69A64
	dw CODE_B69A7B
	dw CODE_B69AAC
	dw CODE_B69ADD
	dw CODE_B69AF7
	dw CODE_B69B57
	dw CODE_B69B6E
	dw CODE_B69B9B

CODE_B699BC:
	JSR.w CODE_B69CF9			;$B699BC
	JSR.w CODE_B69BBF			;$B699BF
	STZ.b $5C,x				;$B699C2
	JSR.w CODE_B69C11			;$B699C4
	JSR.w CODE_B69C3B			;$B699C7
	STZ.b $38,x				;$B699CA
CODE_B699CC:
	LDX.b current_sprite			;$B699CC
	LDA.b $64,x				;$B699CE
	AND.w #$00FF				;$B699D0
	BNE.b CODE_B699F0			;$B699D3
	JSR.w CODE_B69BB6			;$B699D5
	JSR.w CODE_B69C9B			;$B699D8
	JSR.w CODE_B69BAD			;$B699DB
	JSR.w CODE_B69CA3			;$B699DE
	JSR.w CODE_B69C9B			;$B699E1
	DEC.b $64,x				;$B699E4
	LDA.w #$01FB				;$B699E6
	JSL.l set_alt_sprite_animation		;$B699E9
	JML [$04F5]				;$B699ED

CODE_B699F0:
	JSR.w CODE_B69CA3			;$B699F0
	LDA.w #$01F9				;$B699F3
	JSL.l set_alt_sprite_animation		;$B699F6
	JSR.w CODE_B69C9B			;$B699FA
	JSR.w CODE_B69C91			;$B699FD
	LDA.w #$0000				;$B69A00
	STA.w $002C,y				;$B69A03
	LDA.w #$0002				;$B69A06
	JSR.w CODE_B69BA6			;$B69A09
	DEC.b $64,x				;$B69A0C
CODE_B69A0E:
	JSR.w CODE_B69C54			;$B69A0E
	LDA.w $002C,y				;$B69A11
	BIT.w #$0001				;$B69A14
	BNE.b CODE_B69A1C			;$B69A17
	JML [$04F5]				;$B69A19

CODE_B69A1C:
	JMP.w CODE_B699CC			;$B69A1C

CODE_B69A1F:
	JML [$04F5]				;$B69A1F

CODE_B69A22:
	JSR.w CODE_B69CF9			;$B69A22
	JSR.w CODE_B69CDE			;$B69A25
	LDA.w #$0002				;$B69A28
	STA.b $5C,x				;$B69A2B
	LDA.b $1E,x				;$B69A2D
	ASL					;$B69A2F
	BPL.b CODE_B69A3D			;$B69A30
	JSR.w CODE_B69C5D			;$B69A32
	LDA.b $62,x				;$B69A35
	EOR.w #$FFFF				;$B69A37
	INC					;$B69A3A
	STA.b $62,x				;$B69A3B
CODE_B69A3D:
	LDY.b $5E,x				;$B69A3D
	LDA.w $0012,y				;$B69A3F
	SEC					;$B69A42
	SBC.b $62,x				;$B69A43
	STA.w $0012,y				;$B69A45
	STA.w $0062,y				;$B69A48
	LDY.b $60,x				;$B69A4B
	LDA.b $12,x				;$B69A4D
	STA.w $0062,y				;$B69A4F
CODE_B69A52:
	LDX.b current_sprite			;$B69A52
	LDY.b $5E,x				;$B69A54
	JSR.w CODE_B69C6E			;$B69A56
	LDY.b $60,x				;$B69A59
	JSR.w CODE_B69C6E			;$B69A5B
	LDA.w #$0006				;$B69A5E
	JSR.w CODE_B69BA6			;$B69A61
CODE_B69A64:
	JSR.w CODE_B69C47			;$B69A64
	LDA.w $002C,y				;$B69A67
	BIT.w #$0002				;$B69A6A
	BEQ.b CODE_B69A78			;$B69A6D
	JSR.w CODE_B69C5D			;$B69A6F
	JSR.w CODE_B69C9B			;$B69A72
	JMP.w CODE_B69A52			;$B69A75

CODE_B69A78:
	JML [$04F5]				;$B69A78

CODE_B69A7B:
	JSR.w CODE_B69CF9			;$B69A7B
	JSR.w CODE_B69BBF			;$B69A7E
	STZ.b $5C,x				;$B69A81
	JSR.w CODE_B69C11			;$B69A83
	LDA.b $1E,x				;$B69A86
	ASL					;$B69A88
	BPL.b CODE_B69A8E			;$B69A89
	JSR.w CODE_B69C5D			;$B69A8B
CODE_B69A8E:
	JSR.w CODE_B69C5D			;$B69A8E
	LDA.w #$0800				;$B69A91
	STA.b $38,x				;$B69A94
	JSR.w CODE_B69C3B			;$B69A96
	LDY.b $5E,x				;$B69A99
	LDA.w $0012,y				;$B69A9B
	STA.w $005E,y				;$B69A9E
	LDY.b $60,x				;$B69AA1
	LDA.w $0012,y				;$B69AA3
	STA.w $005E,y				;$B69AA6
	JMP.w CODE_B699CC			;$B69AA9

CODE_B69AAC:
	LDX.b current_sprite			;$B69AAC
	JSR.w CODE_B69C9B			;$B69AAE
	LDY.b $5E,x				;$B69AB1
	JSR.w CODE_B69C6E			;$B69AB3
	LDY.b $60,x				;$B69AB6
	JSR.w CODE_B69C6E			;$B69AB8
	LDY.b $5E,x				;$B69ABB
	LDA.w $005E,y				;$B69ABD
	PHA					;$B69AC0
	LDY.b $60,x				;$B69AC1
	LDA.w $005E,y				;$B69AC3
	PHA					;$B69AC6
	JSR.w CODE_B69C47			;$B69AC7
	PLA					;$B69ACA
	STA.w $0062,y				;$B69ACB
	JSR.w CODE_B69C54			;$B69ACE
	PLA					;$B69AD1
	STA.w $0062,y				;$B69AD2
	LDA.w #$0906				;$B69AD5
	STA.b $38,x				;$B69AD8
	JMP.w CODE_B69A64			;$B69ADA

CODE_B69ADD:
	TYX					;$B69ADD
	JSR.w CODE_B69BB6			;$B69ADE
	JSR.w CODE_B69BAD			;$B69AE1
	JSR.w CODE_B69C9B			;$B69AE4
	JSR.w CODE_B69CA3			;$B69AE7
	JSR.w CODE_B69C9B			;$B69AEA
	DEC.b $64,x				;$B69AED
	LDA.w #$0802				;$B69AEF
	STA.b $38,x				;$B69AF2
	JML [$04F5]				;$B69AF4

CODE_B69AF7:
	JSR.w CODE_B69CF9			;$B69AF7
	JSR.w CODE_B69BBF			;$B69AFA
	STZ.b $5C,x				;$B69AFD
	JSR.w CODE_B69C11			;$B69AFF
	LDA.b $1E,x				;$B69B02
	ASL					;$B69B04
	BPL.b CODE_B69B0A			;$B69B05
	JSR.w CODE_B69C5D			;$B69B07
CODE_B69B0A:
	LDA.w #$0800				;$B69B0A
	STA.b $38,x				;$B69B0D
	JSR.w CODE_B69C3B			;$B69B0F
	LDY.b $5E,x				;$B69B12
	LDA.w $0012,y				;$B69B14
	CLC					;$B69B17
	ADC.b $6C,x				;$B69B18
	STA.w $005E,y				;$B69B1A
	LDY.b $60,x				;$B69B1D
	LDA.w $0012,y				;$B69B1F
	CLC					;$B69B22
	ADC.b $6C,x				;$B69B23
	STA.w $005E,y				;$B69B25
	JSR.w CODE_B69C9B			;$B69B28
	LDY.b $5E,x				;$B69B2B
	JSR.w CODE_B69C6E			;$B69B2D
	LDY.b $60,x				;$B69B30
	JSR.w CODE_B69C6E			;$B69B32
	LDY.b $5E,x				;$B69B35
	LDA.w $005E,y				;$B69B37
	PHA					;$B69B3A
	LDY.b $60,x				;$B69B3B
	LDA.w $005E,y				;$B69B3D
	PHA					;$B69B40
	JSR.w CODE_B69C47			;$B69B41
	PLA					;$B69B44
	STA.w $0062,y				;$B69B45
	JSR.w CODE_B69C54			;$B69B48
	PLA					;$B69B4B
	STA.w $0062,y				;$B69B4C
	LDA.w #$0B06				;$B69B4F
	STA.b $38,x				;$B69B52
	JMP.w CODE_B69A64			;$B69B54

CODE_B69B57:
	TYX					;$B69B57
	JSR.w CODE_B69BB6			;$B69B58
	JSR.w CODE_B69BAD			;$B69B5B
	JSR.w CODE_B69CA3			;$B69B5E
	JSR.w CODE_B69C9B			;$B69B61
	DEC.b $64,x				;$B69B64
	LDA.w #$0C02				;$B69B66
	STA.b $38,x				;$B69B69
	JML [$04F5]				;$B69B6B

CODE_B69B6E:
	TYX					;$B69B6E
	LDY.b $5E,x				;$B69B6F
	JSR.w CODE_B69C6E			;$B69B71
	LDY.b $60,x				;$B69B74
	JSR.w CODE_B69C6E			;$B69B76
	LDY.b $5E,x				;$B69B79
	LDA.w $005E,y				;$B69B7B
	PHA					;$B69B7E
	LDY.b $60,x				;$B69B7F
	LDA.w $005E,y				;$B69B81
	PHA					;$B69B84
	JSR.w CODE_B69C47			;$B69B85
	PLA					;$B69B88
	STA.w $0062,y				;$B69B89
	JSR.w CODE_B69C54			;$B69B8C
	PLA					;$B69B8F
	STA.w $0062,y				;$B69B90
	LDA.w #$0B06				;$B69B93
	STA.b $38,x				;$B69B96
	JMP.w CODE_B69A64			;$B69B98

CODE_B69B9B:
	JSL.l CODE_BB85A9			;$B69B9B
	JSL.l CODE_BB85AC			;$B69B9F
	JMP.w CODE_B6F27D			;$B69BA3

CODE_B69BA6:
	SEP.b #$20				;$B69BA6
	STA.b $38,x				;$B69BA8
	REP.b #$20				;$B69BAA
	RTS					;$B69BAC

CODE_B69BAD:
	LDA.b $66,x				;$B69BAD
	EOR.w #$FFFF				;$B69BAF
	INC					;$B69BB2
	STA.b $66,x				;$B69BB3
	RTS					;$B69BB5

CODE_B69BB6:
	SEP.b #$20				;$B69BB6
	LDA.b $65,x				;$B69BB8
	STA.b $64,x				;$B69BBA
	REP.b #$20				;$B69BBC
	RTS					;$B69BBE

CODE_B69BBF:
	LDA.b $6C,x				;$B69BBF
	STA.w CPU.dividen_low			;$B69BC1
	SEP.b #$20				;$B69BC4
	LDA.b $64,x				;$B69BC6
	STA.b $65,x				;$B69BC8
	STA.w CPU.divisor			;$B69BCA
	REP.b #$20				;$B69BCD
	JSL.l stall_cpu_time			;$B69BCF
	JSR.w CODE_B69CDE			;$B69BD3
	LDY.b $62,x				;$B69BD6
	LDA.b $1E,x				;$B69BD8
	ASL					;$B69BDA
	BPL.b CODE_B69BE6			;$B69BDB
	LDA.w CPU.divide_result			;$B69BDD
	EOR.w #$FFFF				;$B69BE0
	INC					;$B69BE3
	BRA.b CODE_B69BEF			;$B69BE4

CODE_B69BE6:
	TYA					;$B69BE6
	EOR.w #$FFFF				;$B69BE7
	INC					;$B69BEA
	TAY					;$B69BEB
	LDA.w CPU.divide_result			;$B69BEC
CODE_B69BEF:
	ASL					;$B69BEF
	STA.b $62,x				;$B69BF0
	CPY.w #$0000				;$B69BF2
	BEQ.b CODE_B69BFB			;$B69BF5
	STY.b $1A				;$B69BF7
	BRA.b CODE_B69C05			;$B69BF9

CODE_B69BFB:
	CMP.w #$8000				;$B69BFB
	ROR					;$B69BFE
	EOR.w #$FFFF				;$B69BFF
	INC					;$B69C02
	STA.b $1A				;$B69C03
CODE_B69C05:
	LDY.b $5E,x				;$B69C05
	LDA.w $0012,y				;$B69C07
	CLC					;$B69C0A
	ADC.b $1A				;$B69C0B
	STA.w $0012,y				;$B69C0D
	RTS					;$B69C10

CODE_B69C11:
	LDY.b $5E,x				;$B69C11
	LDA.b $66,x				;$B69C13
	SEP.b #$20				;$B69C15
	STA.w $0066,y				;$B69C17
	LDA.b #$01				;$B69C1A
	STA.w $0038,y				;$B69C1C
	LDY.b $60,x				;$B69C1F
	STA.w $0038,y				;$B69C21
	XBA					;$B69C24
	STA.w $0066,y				;$B69C25
	REP.b #$20				;$B69C28
	LDA.b $6A,x				;$B69C2A
	SEP.b #$20				;$B69C2C
	XBA					;$B69C2E
	STA.w $006A,y				;$B69C2F
	LDY.b $5E,x				;$B69C32
	XBA					;$B69C34
	STA.w $006A,y				;$B69C35
	REP.b #$20				;$B69C38
	RTS					;$B69C3A

CODE_B69C3B:
	LDA.b $62,x				;$B69C3B
	STA.b $66,x				;$B69C3D
	LDA.b $12,x				;$B69C3F
	CLC					;$B69C41
	ADC.b $6C,x				;$B69C42
	STA.b $62,x				;$B69C44
	RTS					;$B69C46

CODE_B69C47:
	LDX.b current_sprite			;$B69C47
	LDA.b $5C,x				;$B69C49
CODE_B69C4B:
	CLC					;$B69C4B
	ADC.b current_sprite			;$B69C4C
	TAX					;$B69C4E
	LDY.b $5E,x				;$B69C4F
	LDX.b current_sprite			;$B69C51
	RTS					;$B69C53

CODE_B69C54:
	LDX.b current_sprite			;$B69C54
	LDA.b $5C,x				;$B69C56
	EOR.w #$0002				;$B69C58
	BRA.b CODE_B69C4B			;$B69C5B

CODE_B69C5D:
	LDA.b $6C,x				;$B69C5D
	EOR.w #$FFFF				;$B69C5F
	INC					;$B69C62
	STA.b $6C,x				;$B69C63
	LDA.b $32,x				;$B69C65
	EOR.w #$FFFF				;$B69C67
	INC					;$B69C6A
	STA.b $32,x				;$B69C6B
	RTS					;$B69C6D

CODE_B69C6E:
	LDA.w $0062,y				;$B69C6E
	CLC					;$B69C71
	ADC.b $6C,x				;$B69C72
	STA.w $0062,y				;$B69C74
	LDA.w #$0003				;$B69C77
	STA.w $0038,y				;$B69C7A
	LDA.b $32,x				;$B69C7D
	STA.w $0030,y				;$B69C7F
	STY.b alternate_sprite			;$B69C82
	TYX					;$B69C84
	STZ.b $2C,x				;$B69C85
	STZ.b $2A,x				;$B69C87
	LDA.w #$01FA				;$B69C89
	JSL.l set_alt_sprite_animation		;$B69C8C
	RTS					;$B69C90

CODE_B69C91:
	TXA					;$B69C91
	CLC					;$B69C92
	ADC.b $5C,x				;$B69C93
	TAX					;$B69C95
	LDY.b $5E,x				;$B69C96
	LDX.b current_sprite			;$B69C98
	RTS					;$B69C9A

CODE_B69C9B:
	LDA.b $5C,x				;$B69C9B
	EOR.w #$0002				;$B69C9D
	STA.b $5C,x				;$B69CA0
	RTS					;$B69CA2

CODE_B69CA3:
	JSR.w CODE_B69C91			;$B69CA3
	LDA.w #$0000				;$B69CA6
	STA.w $002C,y				;$B69CA9
	LDA.w #$0002				;$B69CAC
	STA.w $0038,y				;$B69CAF
	LDA.w $0012,y				;$B69CB2
	CLC					;$B69CB5
	ADC.b $66,x				;$B69CB6
	STA.w $0062,y				;$B69CB8
	LDA.w $0016,y				;$B69CBB
	STA.w $0064,y				;$B69CBE
	STY.b alternate_sprite			;$B69CC1
	LDA.b $68,x				;$B69CC3
	STA.w $005C,y				;$B69CC5
	LDA.b $64,x				;$B69CC8
	AND.w #$00FF				;$B69CCA
	CMP.w #$0002				;$B69CCD
	BNE.b CODE_B69CD7			;$B69CD0
	LDA.w #$01F8				;$B69CD2
	BRA.b CODE_B69CDA			;$B69CD5

CODE_B69CD7:
	LDA.w #$01F9				;$B69CD7
CODE_B69CDA:
	STA.w $006C,y				;$B69CDA
	RTS					;$B69CDD

CODE_B69CDE:
	LDY.b $5E,x				;$B69CDE
	LDA.w $001E,y				;$B69CE0
	AND.w #$BFFF				;$B69CE3
	ORA.b $1E,x				;$B69CE6
	STA.w $001E,y				;$B69CE8
	LDY.b $60,x				;$B69CEB
	LDA.w $001E,y				;$B69CED
	AND.w #$BFFF				;$B69CF0
	ORA.b $1E,x				;$B69CF3
	STA.w $001E,y				;$B69CF5
	RTS					;$B69CF8

CODE_B69CF9:
	JSR.w CODE_B69D08			;$B69CF9
	STY.b $5E,x				;$B69CFC
	STX.b $32,y				;$B69CFE
	JSR.w CODE_B69D08			;$B69D00
	STY.b $60,x				;$B69D03
	STX.b $32,y				;$B69D05
	RTS					;$B69D07

CODE_B69D08:
	LDY.w #$00CA				;$B69D08
	JSL.l CODE_BB8585			;$B69D0B
	LDY.b alternate_sprite			;$B69D0F
	LDA.w #$0101				;$B69D11
	STA.w $0028,y				;$B69D14
	LDX.b current_sprite			;$B69D17
	RTS					;$B69D19

kuff_n_klout_main:
	JMP.w (DATA_B69D1D,x)			;$B69D1A

DATA_B69D1D:
	dw CODE_B69D50
	dw CODE_B69D89
	dw CODE_B69D92
	dw CODE_B69DBD
	dw CODE_B69DD5
	dw CODE_B69DFA
	dw CODE_B69E27
	dw CODE_B69E57
	dw CODE_B69E60
	dw CODE_B69E80
	dw CODE_B69EC2

CODE_B69D33:
	LDY.b current_sprite			;$B69D33
	LDX.b $32,y				;$B69D35
	LDA.w #$018C				;$B69D37
	CMP.b $00,x				;$B69D3A
	BNE.b CODE_B69D3F			;$B69D3C
	RTS					;$B69D3E

CODE_B69D3F:
	PLA					;$B69D3F
	JMP.w CODE_B6F27D			;$B69D40

CODE_B69D43:
	JSL.l CODE_BBAB46			;$B69D43
	BCC.b CODE_B69D4D			;$B69D47
	PLA					;$B69D49
	JML [$04F5]				;$B69D4A

CODE_B69D4D:
	LDX.b current_sprite			;$B69D4D
	RTS					;$B69D4F

CODE_B69D50:
	JSR.w CODE_B69D33			;$B69D50
	JSR.w CODE_B69ED8			;$B69D53
	JSL.l process_current_movement		;$B69D56
	LDA.b $28,x				;$B69D5A
	AND.w #$0101				;$B69D5C
	CMP.w #$0001				;$B69D5F
	BNE.b CODE_B69D86			;$B69D62
	INC.b $29,x				;$B69D64
	STZ.b $2C,x				;$B69D66
	LDY.b $32,x				;$B69D68
	LDA.b $64,x				;$B69D6A
	AND.w #$00FF				;$B69D6C
	BEQ.b CODE_B69D78			;$B69D6F
	LDA.b $2C,x				;$B69D71
	ORA.w #$0001				;$B69D73
	STA.b $2C,x				;$B69D76
CODE_B69D78:
	LDA.w #$0001				;$B69D78
	STA.b $38,x				;$B69D7B
	STZ.b $5A,x				;$B69D7D
	LDA.w #$0638				;$B69D7F
	JSL.l queue_sound_effect		;$B69D82
CODE_B69D86:
	JMP.w CODE_B685E6			;$B69D86

CODE_B69D89:
	JSR.w CODE_B69D33			;$B69D89
	JSR.w CODE_B69ED8			;$B69D8C
	JMP.w CODE_B685E6			;$B69D8F

CODE_B69D92:
	JSR.w CODE_B69D33			;$B69D92
	JSR.w CODE_B69ED8			;$B69D95
	LDA.b $40,x				;$B69D98
	CMP.w #$01FB				;$B69D9A
	BEQ.b CODE_B69DAA			;$B69D9D
	CMP.w #$01FD				;$B69D9F
	BEQ.b CODE_B69DAA			;$B69DA2
	LDA.b $5C,x				;$B69DA4
	BEQ.b CODE_B69DAD			;$B69DA6
	DEC.b $5C,x				;$B69DA8
CODE_B69DAA:
	JMP.w CODE_B685E6			;$B69DAA

CODE_B69DAD:
	REP.b #$20				;$B69DAD
	DEC.b $38,x				;$B69DAF
	DEC.b $38,x				;$B69DB1
	LDA.w #$01F6				;$B69DB3
	JSL.l set_sprite_animation		;$B69DB6
	JMP.w CODE_B69D50			;$B69DBA

CODE_B69DBD:
	JSR.w CODE_B69D33			;$B69DBD
	JSR.w CODE_B69ED8			;$B69DC0
	JSL.l process_current_movement		;$B69DC3
	BCC.b CODE_B69DD2			;$B69DC7
	LDA.b $30,x				;$B69DC9
	EOR.w #$FFFF				;$B69DCB
	STA.b $30,x				;$B69DCE
	INC.b $38,x				;$B69DD0
CODE_B69DD2:
	JMP.w CODE_B685E6			;$B69DD2

CODE_B69DD5:
	JSR.w CODE_B69D33			;$B69DD5
	JSR.w CODE_B69ED8			;$B69DD8
	JSL.l process_current_movement		;$B69DDB
	LDA.b $2A,x				;$B69DDF
	EOR.b $30,x				;$B69DE1
	BPL.b CODE_B69DF7			;$B69DE3
	STZ.b $2A,x				;$B69DE5
	STZ.b $30,x				;$B69DE7
	STZ.b $5A,x				;$B69DE9
	LDA.w #$0001				;$B69DEB
	STA.b $38,x				;$B69DEE
	LDA.w #$01FD				;$B69DF0
	JSL.l set_sprite_animation		;$B69DF3
CODE_B69DF7:
	JMP.w CODE_B685E6			;$B69DF7

CODE_B69DFA:
	JSL.l process_current_movement		;$B69DFA
	JSL.l process_sprite_animation		;$B69DFE
	LDX.b current_sprite			;$B69E02
	LDA.l DATA_FF1BC0+$02			;$B69E04
	STA.b $06,x				;$B69E08
	JSL.l CODE_BBAB29			;$B69E0A
	BCC.b CODE_B69E24			;$B69E0E
	LDY.b current_sprite			;$B69E10
	LDX.b $32,y				;$B69E12
	LDY.b $5E,x				;$B69E14
	CPY.b current_sprite			;$B69E16
	BNE.b CODE_B69E1E			;$B69E18
	STZ.b $5E,x				;$B69E1A
	BRA.b CODE_B69E20			;$B69E1C

CODE_B69E1E:
	STZ.b $60,x				;$B69E1E
CODE_B69E20:
	JSL.l CODE_BB8597			;$B69E20
CODE_B69E24:
	JML [$04F5]				;$B69E24

CODE_B69E27:
	JSR.w CODE_B69D43			;$B69E27
	JSR.w CODE_B69F1E			;$B69E2A
	LDA.b $28,x				;$B69E2D
	AND.w #$0001				;$B69E2F
	CMP.w #$0001				;$B69E32
	BEQ.b CODE_B69E44			;$B69E35
	LDA.w #$0008				;$B69E37
	STA.b $38,x				;$B69E3A
	LDA.w #$0200				;$B69E3C
	STA.b $6C,x				;$B69E3F
	JMP.w CODE_B685E6			;$B69E41

CODE_B69E44:
	INC.b $38,x				;$B69E44
	LDA.w #$0200				;$B69E46
	JSL.l set_sprite_animation		;$B69E49
	LDA.w #$0638				;$B69E4D
	JSL.l queue_sound_effect		;$B69E50
	JML [$04F5]				;$B69E54

CODE_B69E57:
	JSR.w CODE_B69D43			;$B69E57
	JSR.w CODE_B69F1E			;$B69E5A
	JMP.w CODE_B685E6			;$B69E5D

CODE_B69E60:
	JSR.w CODE_B69D43			;$B69E60
	JSR.w CODE_B69F1E			;$B69E63
	JSL.l process_current_movement		;$B69E66
	LDA.b $28,x				;$B69E6A
	AND.w #$0101				;$B69E6C
	CMP.w #$0001				;$B69E6F
	BNE.b CODE_B69E7D			;$B69E72
	DEC.b $38,x				;$B69E74
	LDA.w #$0638				;$B69E76
	JSL.l queue_sound_effect		;$B69E79
CODE_B69E7D:
	JMP.w CODE_B685E6			;$B69E7D

CODE_B69E80:
	JSR.w CODE_B69D43			;$B69E80
	INC.b $38,x				;$B69E83
	LDY.w #$0000				;$B69E85
	LDA.w DATA_B69ECF,y			;$B69E88
	STA.b $5E,x				;$B69E8B
	LDA.w DATA_B69ECF+$02,y			;$B69E8D
	AND.w #$00FF				;$B69E90
	STA.b $5C,x				;$B69E93
	STZ.b $2A,x				;$B69E95
	LDY.w active_kong_sprite		;$B69E97
	LDA.w $0012,y				;$B69E9A
	SEC					;$B69E9D
	SBC.b $12,x				;$B69E9E
	EOR.b $1E,x				;$B69EA0
	ASL					;$B69EA2
	BMI.b CODE_B69EAF			;$B69EA3
	LDA.b $5E,x				;$B69EA5
	EOR.w #$FFFF				;$B69EA7
	INC					;$B69EAA
	STA.b $5E,x				;$B69EAB
	DEC.b $2A,x				;$B69EAD
CODE_B69EAF:
	LDA.b $5E,x				;$B69EAF
	STA.b $30,x				;$B69EB1
	LDA.w #$0047				;$B69EB3
	STA.b $5A,x				;$B69EB6
	LDA.w #$0201				;$B69EB8
	JSL.l set_sprite_animation		;$B69EBB
	JML [$04F5]				;$B69EBF

CODE_B69EC2:
	JSR.w CODE_B69D43			;$B69EC2
	JSR.w CODE_B69F1E			;$B69EC5
	JSL.l process_current_movement		;$B69EC8
	JMP.w CODE_B685E6			;$B69ECC

DATA_B69ECF:
	db $00,$03,$03,$00,$03,$03,$00,$03,$03

CODE_B69ED8:
	LDA.w #$0420				;$B69ED8
	JSL.l check_throwable_collision		;$B69EDB
	BCS.b CODE_B69EED			;$B69EDF
	JSL.l populate_sprite_clipping		;$B69EE1
	LDA.w #$0000				;$B69EE5
	JSL.l CODE_BEC009			;$B69EE8
	RTS					;$B69EEC

CODE_B69EED:
	PLA					;$B69EED
	LDA.w #$0005				;$B69EEE
	STA.b $38,x				;$B69EF1
	LDY.b $32,x				;$B69EF3
	LDA.w #$000D				;$B69EF5
	STA.w $0038,y				;$B69EF8
	LDA.w #$0000				;$B69EFB
	LDX.b $5E,y				;$B69EFE
	CPX.b current_sprite			;$B69F00
	BNE.b CODE_B69F08			;$B69F02
	LDX.b $60,y				;$B69F04
	BRA.b CODE_B69F08			;$B69F06

CODE_B69F08:
	TXA					;$B69F08
	BEQ.b CODE_B69F10			;$B69F09
	LDA.w #$0006				;$B69F0B
	STA.b $38,x				;$B69F0E
CODE_B69F10:
	LDA.w #$0659				;$B69F10
	JSL.l queue_sound_effect		;$B69F13
	LDA.w #$01FC				;$B69F17
	JMP.w CODE_B6878E			;$B69F1A

CODE_B69F1D:
	RTS					;$B69F1D

CODE_B69F1E:
	LDA.w #$0420				;$B69F1E
	JSL.l check_throwable_collision		;$B69F21
	BCS.b CODE_B69F33			;$B69F25
	JSL.l populate_sprite_clipping		;$B69F27
	LDA.w #$0000				;$B69F2B
	JSL.l CODE_BEC009			;$B69F2E
	RTS					;$B69F32

CODE_B69F33:
	PLA					;$B69F33
	LDA.w #$0005				;$B69F34
	STA.b $38,x				;$B69F37
	LDA.w #$0659				;$B69F39
	JSL.l queue_sound_effect		;$B69F3C
	LDA.w #$01FC				;$B69F40
	JMP.w CODE_B6878E			;$B69F43

CODE_B69F46:
	RTS					;$B69F46

kobble_and_skidda_main:
	JMP.w (DATA_B69F4A,x)			;$B69F47

DATA_B69F4A:
	dw CODE_B69F52
	dw CODE_B69F5B
	dw CODE_B69F87
	dw CODE_B69F8A

CODE_B69F52:
	TYX					;$B69F52
	JSR.w invert_max_x_speed_if_needed	;$B69F53
	INC.b $38,x				;$B69F56
	JML [$04F5]				;$B69F58

CODE_B69F5B:
	JSR.w CODE_B69F65			;$B69F5B
	JSL.l process_current_movement		;$B69F5E
	JMP.w return_handle_anim_and_despawn	;$B69F62

CODE_B69F65:
	LDA.w #$0038				;$B69F65
	JSL.l check_throwable_collision		;$B69F68
	BCS.b CODE_B69F7E			;$B69F6C
	JSL.l populate_sprite_clipping		;$B69F6E
	LDA.w #$08A8				;$B69F72
	JSL.l CODE_BEC009			;$B69F75
	BCC.b CODE_B69F7D			;$B69F79
	BNE.b CODE_B69F7E			;$B69F7B
CODE_B69F7D:
	RTS					;$B69F7D

CODE_B69F7E:
	LDY.w #$0002				;$B69F7E
	LDA.w #$0205				;$B69F81
	JMP.w CODE_B6878B			;$B69F84

CODE_B69F87:
	JMP.w generic_move_and_animate_state	;$B69F87

CODE_B69F8A:
	TYX					;$B69F8A
	LDA.b $61,x				;$B69F8B
	AND.w #$00FF				;$B69F8D
	SEC					;$B69F90
	SBC.b $12,x				;$B69F91
	EOR.w #$FFFF				;$B69F93
	INC					;$B69F96
	STA.b $64,x				;$B69F97
	LDA.b $60,x				;$B69F99
	AND.w #$00FF				;$B69F9B
	CLC					;$B69F9E
	ADC.b $12,x				;$B69F9F
	STA.b $66,x				;$B69FA1
	SEC					;$B69FA3
	SBC.b $64,x				;$B69FA4
	STA.b $68,x				;$B69FA6
	STZ.b $38,x				;$B69FA8
	BRA.b CODE_B69F52			;$B69FAA


;Minkey variables:
;	$5C,x	attack interval
;	$5E,x	animation speed

minkey_main:
	JMP (.state_table,x)			;$B69FAC

.state_table:
	dw .state_0

.state_0:
	TYX					;$B69FB1  \
	DEC sprite.general_purpose_5C,x		;$B69FB2   |
	LDA sprite.general_purpose_5C,x		;$B69FB4   |
	AND #$00FF				;$B69FB6   |
	BNE CODE_B69FCD				;$B69FB9   |
	LDA sprite.general_purpose_5C,x		;$B69FBB   |
	XBA					;$B69FBD   |
	ORA sprite.general_purpose_5C,x		;$B69FBE   |
	STA sprite.general_purpose_5C,x		;$B69FC0   |
	LDA sprite.general_purpose_5E,x		;$B69FC2   |
	STA sprite.animation_speed,x		;$B69FC4   |
	LDA #$020D				;$B69FC6   |
	JSL set_sprite_animation		;$B69FC9  /
CODE_B69FCD:
	JMP return_handle_anim_and_despawn	;$B69FCD  |>

minkey_acorn_main:
	JMP (.state_table,x)			;$B69FD0

.state_table:
	dw .travel
	dw .break
	dw .init

.init:
	TYX					;$B69FD9  \ Get acorn sprite
	LDA sprite.x_position,x			;$B69FDA   | Get X position
	LDY sprite.max_x_speed,x		;$B69FDC   | Get target X speed
	BPL ..positive_target_x			;$B69FDE   |
	SEC					;$B69FE0   |
	SBC #$0084				;$B69FE1   |
	BRA ..update_x_home_and_state		;$B69FE4  /

..positive_target_x:
	CLC					;$B69FE6  \
	ADC #$0084				;$B69FE7  /
..update_x_home_and_state:
	STA sprite.general_purpose_5C,x		;$B69FEA  \ Update home X position
	STZ sprite.state,x			;$B69FEC  / Set state 0 (travel)
.travel:
	LDX current_sprite			;$B69FEE  \ Get acorn sprite 
	LDA sprite.x_position,x			;$B69FF0   | Get X position
	LDY sprite.max_x_speed,x		;$B69FF2   | Get target X speed
	BPL ..CODE_B69FFC			;$B69FF4   |
	CMP sprite.general_purpose_5C,x		;$B69FF6   |
	BCS ..CODE_B6A000			;$B69FF8   |
	BRA ..CODE_B6A025			;$B69FFA  /

..CODE_B69FFC:
	CMP sprite.general_purpose_5C,x		;$B69FFC  \
	BCS ..CODE_B6A025			;$B69FFE  /
..CODE_B6A000:
	JSL populate_sprite_clipping		;$B6A000  \
	LDA #$0000				;$B6A004   | Get collision flags (hurt always)
	JSL CODE_BEC009				;$B6A007   | Check collision with kong
	BCS ..CODE_B6A025			;$B6A00B   |
	LDA #$0020				;$B6A00D   | 
	LDY #$0000				;$B6A010   | Else get sprite collision flags
	INC $1860				;$B6A013   |
	JSL check_sprite_collision		;$B6A016   | Check sprite collision
	BCC .break				;$B6A01A   |
	LDA #$0026				;$B6A01C   |
	JSL CODE_BFF006				;$B6A01F   | Play acorn hitting barrel sound effect
	BRA ..CODE_B6A02C			;$B6A023  /

..CODE_B6A025:
	LDA #$0027				;$B6A025  \
	JSL CODE_BFF006				;$B6A028  / Play acorn move sound effect
..CODE_B6A02C:
	LDX current_sprite			;$B6A02C  \ Get acorn sprite
	STZ sprite.interaction_flags,x		;$B6A02E   | Clear interaction flags
	LDA sprite.x_speed,x			;$B6A030   | Get current X velocity
	CMP #$8000				;$B6A032   |
	ROR					;$B6A035   |
	EOR #$FFFF				;$B6A036   |
	INC					;$B6A039   |
	STA sprite.x_speed,x			;$B6A03A   | Update current X velocity
	STA sprite.max_x_speed,x		;$B6A03C   | Update target X velocity
	PHP					;$B6A03E   |
	LDA sprite.oam_property,x		;$B6A03F   | Get OAM properties
	AND #$3FFF				;$B6A041   |
	PLP					;$B6A044   |
	BMI ..CODE_B6A04A			;$B6A045   |
	ORA #$8000				;$B6A047  /
..CODE_B6A04A:
	STA sprite.oam_property,x		;$B6A04A  \ Update OAM properties
	INC sprite.state,x			;$B6A04C   | Set state 1 (break)
	LDA #$0210				;$B6A04E   |
	JSL set_sprite_animation		;$B6A051  / Set acorn break animation
.break:
	JSL process_current_movement		;$B6A055  \ Process current movement
	JMP CODE_B6BF79				;$B6A059  / Return and process animation


koin_handler_main:
	JMP.w (DATA_B6A05F,x)			;$B6A05C

DATA_B6A05F:
	dw CODE_B6A065
	dw CODE_B6A0C3
	dw CODE_B6A0DC

CODE_B6A065:
	JSR.w CODE_B6A5DC			;$B6A065
	ASL					;$B6A068
	TAX					;$B6A069
	JMP.w (DATA_B6A06D,x)			;$B6A06A

DATA_B6A06D:
	dw CODE_B6A073
	dw CODE_B6A097
	dw CODE_B6A0B2

CODE_B6A073:
	LDY.w #$00D0				;$B6A073
	JSL.l CODE_BB8585			;$B6A076
	LDX.b current_sprite			;$B6A07A
	LDY.b alternate_sprite			;$B6A07C
	STY.b $5C,x				;$B6A07E
	STX.b $5E,y				;$B6A080
	PHY					;$B6A082
	LDY.w #$00D2				;$B6A083
	JSL.l CODE_BB8585			;$B6A086
	PLX					;$B6A08A
	LDY.b alternate_sprite			;$B6A08B
	STY.b $5C,x				;$B6A08D
	LDX.b current_sprite			;$B6A08F
	STY.b $5E,x				;$B6A091
	STX.b $5C,y				;$B6A093
	BRA.b CODE_B6A0C1			;$B6A095

CODE_B6A097:
	LDY.w #$00D2				;$B6A097
	JSL.l CODE_BB8585			;$B6A09A
	LDX.b current_sprite			;$B6A09E
	LDY.b alternate_sprite			;$B6A0A0
	STY.b $5E,x				;$B6A0A2
	STX.b $5C,y				;$B6A0A4
	TYX					;$B6A0A6
	INC.b $38,x				;$B6A0A7
	LDA.w #$0149				;$B6A0A9
	JSL.l set_alt_sprite_animation		;$B6A0AC
	BRA.b CODE_B6A0C1			;$B6A0B0

CODE_B6A0B2:
	LDY.w #$00D0				;$B6A0B2
	JSL.l CODE_BB8585			;$B6A0B5
	LDX.b current_sprite			;$B6A0B9
	LDY.b alternate_sprite			;$B6A0BB
	STY.b $5C,x				;$B6A0BD
	STX.b $5E,y				;$B6A0BF
CODE_B6A0C1:
	INC.b $38,x				;$B6A0C1
CODE_B6A0C3:
	JSL.l CODE_BBAB52			;$B6A0C3
	BCC.b CODE_B6A0D9			;$B6A0C7
	LDX.b current_sprite			;$B6A0C9
	LDY.b $5C,x				;$B6A0CB
	BEQ.b CODE_B6A0D2			;$B6A0CD
	JSR.w CODE_B6F3EB			;$B6A0CF
CODE_B6A0D2:
	LDY.b $5E,x				;$B6A0D2
	BEQ.b CODE_B6A0D9			;$B6A0D4
	JSR.w CODE_B6F3EB			;$B6A0D6
CODE_B6A0D9:
	JML [$04F5]				;$B6A0D9

CODE_B6A0DC:
	JSL.l CODE_BB85A9			;$B6A0DC
	JSL.l delete_sprite_no_deallocation	;$B6A0E0
	JML [$04F5]				;$B6A0E4


koin_main:
	JMP.w (DATA_B6A0EA,x)			;$B6A0E7

DATA_B6A0EA:
	dw CODE_B6A104
	dw CODE_B6A120
	dw CODE_B6A18E
	dw CODE_B6A191
	dw CODE_B6A19A
	dw CODE_B6A1A8
	dw CODE_B6A1B7
	dw CODE_B6A1C5
	dw CODE_B6A256
	dw CODE_B6A2C1
	dw CODE_B6A34B
	dw CODE_B6A3CA
	dw CODE_B6A429

CODE_B6A104:
	JSL.l CODE_B6840E			;$B6A104
	INC.b $38,x				;$B6A108
	JSR.w CODE_B6F284			;$B6A10A
	LDY.b $5C,x				;$B6A10D
	BEQ.b CODE_B6A11D			;$B6A10F
	TYX					;$B6A111
	JSR.w CODE_B6F284			;$B6A112
	LDX.b current_sprite			;$B6A115
	LDA.w #$2DCD				;$B6A117
	JSR.w CODE_B6A638			;$B6A11A
CODE_B6A11D:
	JML [$04F5]				;$B6A11D

CODE_B6A120:
	JSR.w CODE_B6A4FE			;$B6A120
	SEC					;$B6A123
	JSR.w CODE_B6A651			;$B6A124
	BCS.b CODE_B6A16B			;$B6A127
	CMP.w #$2DEF				;$B6A129
	BCS.b CODE_B6A164			;$B6A12C
	STA.b $1A				;$B6A12E
	JSR.w CODE_B6A587			;$B6A130
	LDA.b $1A				;$B6A133
	CMP.w #$2DCD				;$B6A135
	BNE.b CODE_B6A164			;$B6A138
	LDA.b $40,x				;$B6A13A
	CMP.w #$0211				;$B6A13C
	BEQ.b CODE_B6A14C			;$B6A13F
	CMP.w #$0215				;$B6A141
	BNE.b CODE_B6A155			;$B6A144
	JSL.l process_sprite_animation		;$B6A146
	BRA.b CODE_B6A170			;$B6A14A

CODE_B6A14C:
	JSL.l process_sprite_animation		;$B6A14C
	JSR.w CODE_B6A482			;$B6A150
	BRA.b CODE_B6A170			;$B6A153

CODE_B6A155:
	LDA.w #$0211				;$B6A155
	JSL.l set_sprite_animation		;$B6A158
	JSR.w CODE_B6A482			;$B6A15C
	LDA.w #$2DCD				;$B6A15F
	BRA.b CODE_B6A16D			;$B6A162

CODE_B6A164:
	STA.b $24,x				;$B6A164
	STZ.b $40,x				;$B6A166
	JSR.w CODE_B6A482			;$B6A168
CODE_B6A16B:
	LDA.b $24,x				;$B6A16B
CODE_B6A16D:
	JSR.w CODE_B6A638			;$B6A16D
CODE_B6A170:
	LDA.b $5E,x				;$B6A170
	BNE.b CODE_B6A17A			;$B6A172
	JSL.l CODE_BBAB52			;$B6A174
	BCS.b CODE_B6A17D			;$B6A178
CODE_B6A17A:
	JSR.w CODE_B6A180			;$B6A17A
CODE_B6A17D:
	JML [$04F5]				;$B6A17D

CODE_B6A180:
	JSL.l CODE_B78033			;$B6A180
	BNE.b CODE_B6A18D			;$B6A184
	LDA.w #CODE_B6A48C			;$B6A186
	JSL.l CODE_BB85D6			;$B6A189
CODE_B6A18D:
	RTS					;$B6A18D

CODE_B6A18E:
	JMP.w generic_move_and_animate_state	;$B6A18E

CODE_B6A191:
	JSR.w CODE_B6A4FE			;$B6A191
	JSR.w CODE_B6A180			;$B6A194
	JMP.w CODE_B685E6			;$B6A197

CODE_B6A19A:
	JSL.l process_sprite_animation		;$B6A19A
	LDX.b current_sprite			;$B6A19E
	LDA.b $24,x				;$B6A1A0
	JSR.w CODE_B6A638			;$B6A1A2
	JML [$04F5]				;$B6A1A5

CODE_B6A1A8:
	JSL.l CODE_B6840E			;$B6A1A8
	LDA.w #$0001				;$B6A1AC
	STA.b $38,x				;$B6A1AF
	JSR.w CODE_B6F284			;$B6A1B1
	JML [$04F5]				;$B6A1B4

CODE_B6A1B7:
	TYX					;$B6A1B7
	INC.b $38,x				;$B6A1B8
	JSR.w CODE_B6F284			;$B6A1BA
	JSR.w invert_max_x_speed_if_needed	;$B6A1BD
	LDA.b $12,x				;$B6A1C0
	STA.b $64,x				;$B6A1C2
	TXY					;$B6A1C4
CODE_B6A1C5:
	JSR.w CODE_B6A49F			;$B6A1C5
	LDA.b $61,x				;$B6A1C8
	AND.w #$00FF				;$B6A1CA
	EOR.w #$FFFF				;$B6A1CD
	SEC					;$B6A1D0
	ADC.b $12,x				;$B6A1D1
	STA.b $1A				;$B6A1D3
	LDA.b $60,x				;$B6A1D5
	AND.w #$00FF				;$B6A1D7
	CLC					;$B6A1DA
	ADC.b $12,x				;$B6A1DB
	STA.b $1C				;$B6A1DD
	LDA.b $63,x				;$B6A1DF
	AND.w #$00FF				;$B6A1E1
	EOR.w #$FFFF				;$B6A1E4
	SEC					;$B6A1E7
	ADC.b $16,x				;$B6A1E8
	STA.b $1E				;$B6A1EA
	LDA.b $62,x				;$B6A1EC
	AND.w #$00FF				;$B6A1EE
	CLC					;$B6A1F1
	ADC.b $16,x				;$B6A1F2
	STA.b $20				;$B6A1F4
	LDY.w active_kong_sprite		;$B6A1F6
	LDA.w #$001A				;$B6A1F9
	JSL.l CODE_B6F3AB			;$B6A1FC
	BCC.b CODE_B6A210			;$B6A200
	INC.b $38,x				;$B6A202
CODE_B6A204:
	JSL.l CODE_BBAB52			;$B6A204
	BCS.b CODE_B6A20D			;$B6A208
	JSR.w CODE_B6A42D			;$B6A20A
CODE_B6A20D:
	JML [$04F5]				;$B6A20D

CODE_B6A210:
	SEC					;$B6A210
	JSR.w CODE_B6A651			;$B6A211
	BCS.b CODE_B6A204			;$B6A214
	CMP.w #$2DEF				;$B6A216
	BCS.b CODE_B6A23C			;$B6A219
	CMP.w #$2DCD				;$B6A21B
	BNE.b CODE_B6A23C			;$B6A21E
	LDA.b $40,x				;$B6A220
	CMP.w #$0211				;$B6A222
	BEQ.b CODE_B6A22C			;$B6A225
	CMP.w #$0215				;$B6A227
	BNE.b CODE_B6A24C			;$B6A22A
CODE_B6A22C:
	JSL.l CODE_BBAB52			;$B6A22C
	BCS.b CODE_B6A239			;$B6A230
	JSR.w CODE_B6A42D			;$B6A232
	JSL.l process_sprite_animation		;$B6A235
CODE_B6A239:
	JML [$04F5]				;$B6A239

CODE_B6A23C:
	STA.b $24,x				;$B6A23C
	STZ.b $40,x				;$B6A23E
	JSL.l CODE_BBAB52			;$B6A240
	BCS.b CODE_B6A249			;$B6A244
	JSR.w CODE_B6A42D			;$B6A246
CODE_B6A249:
	JML [$04F5]				;$B6A249

CODE_B6A24C:
	LDA.w #$0211				;$B6A24C
	JSL.l set_sprite_animation		;$B6A24F
	JMP.w CODE_B6A204			;$B6A253

CODE_B6A256:
	JSR.w CODE_B6A49F			;$B6A256
	LDA.w #$0218				;$B6A259
	CMP.b $40,x				;$B6A25C
	BEQ.b CODE_B6A284			;$B6A25E
	LDY.w active_kong_sprite		;$B6A260
	JSL.l CODE_B5801E			;$B6A263
	CMP.b $1A				;$B6A267
	BCC.b CODE_B6A279			;$B6A269
	LDA.b $1A				;$B6A26B
	CMP.w #$001E				;$B6A26D
	BCS.b CODE_B6A279			;$B6A270
	INC.b $38,x				;$B6A272
	INC.b $38,x				;$B6A274
	JMP.w CODE_B6A34B			;$B6A276

CODE_B6A279:
	LDA.w #$0217				;$B6A279
	CMP.b $40,x				;$B6A27C
	BEQ.b CODE_B6A284			;$B6A27E
	JSL.l set_sprite_animation		;$B6A280
CODE_B6A284:
	LDX.b current_sprite			;$B6A284
	JSR.w CODE_B6A443			;$B6A286
	JSL.l process_current_movement		;$B6A289
	JSR.w CODE_B6A45A			;$B6A28D
	BCS.b CODE_B6A2A2			;$B6A290
	JSL.l CODE_BBAB52			;$B6A292
	BCS.b CODE_B6A29F			;$B6A296
	JSR.w CODE_B6A42D			;$B6A298
	JSL.l process_sprite_animation		;$B6A29B
CODE_B6A29F:
	JML [$04F5]				;$B6A29F

CODE_B6A2A2:
	STY.b $12,x				;$B6A2A2
	STZ.b $2A,x				;$B6A2A4
	INC.b $38,x				;$B6A2A6
	SEC					;$B6A2A8
	JSR.w CODE_B6A651			;$B6A2A9
	STA.b $66,x				;$B6A2AC
	LDA.w #$021B				;$B6A2AE
	JSL.l set_sprite_animation		;$B6A2B1
	JSL.l CODE_BBAB52			;$B6A2B5
	BCS.b CODE_B6A2BE			;$B6A2B9
	JSR.w CODE_B6A42D			;$B6A2BB
CODE_B6A2BE:
	JML [$04F5]				;$B6A2BE

CODE_B6A2C1:
	JSR.w CODE_B6A49F			;$B6A2C1
	LDA.b $40,x				;$B6A2C4
	CMP.w #$0219				;$B6A2C6
	BEQ.b CODE_B6A2F8			;$B6A2C9
	CMP.w #$021B				;$B6A2CB
	BEQ.b CODE_B6A2F8			;$B6A2CE
	SEC					;$B6A2D0
	JSR.w CODE_B6A651			;$B6A2D1
	BCS.b CODE_B6A315			;$B6A2D4
	CMP.w #$2DEF				;$B6A2D6
	BCS.b CODE_B6A311			;$B6A2D9
	PHA					;$B6A2DB
	JSR.w CODE_B6A443			;$B6A2DC
	JSR.w CODE_B6A45A			;$B6A2DF
	BCC.b CODE_B6A321			;$B6A2E2
	STZ.b $2A,x				;$B6A2E4
	PLA					;$B6A2E6
	CMP.w #$2DCD				;$B6A2E7
	BNE.b CODE_B6A311			;$B6A2EA
	LDA.b $40,x				;$B6A2EC
	CMP.w #$0211				;$B6A2EE
	BEQ.b CODE_B6A2F8			;$B6A2F1
	CMP.w #$0215				;$B6A2F3
	BNE.b CODE_B6A308			;$B6A2F6
CODE_B6A2F8:
	JSL.l CODE_BBAB52			;$B6A2F8
	BCS.b CODE_B6A305			;$B6A2FC
	JSR.w CODE_B6A42D			;$B6A2FE
	JSL.l process_sprite_animation		;$B6A301
CODE_B6A305:
	JML [$04F5]				;$B6A305

CODE_B6A308:
	LDA.w #$0211				;$B6A308
	JSL.l set_sprite_animation		;$B6A30B
	BRA.b CODE_B6A315			;$B6A30F

CODE_B6A311:
	STA.b $24,x				;$B6A311
	STZ.b $40,x				;$B6A313
CODE_B6A315:
	JSL.l CODE_BBAB52			;$B6A315
	BCS.b CODE_B6A31E			;$B6A319
	JSR.w CODE_B6A42D			;$B6A31B
CODE_B6A31E:
	JML [$04F5]				;$B6A31E

CODE_B6A321:
	PLA					;$B6A321
	LDA.w #$000B				;$B6A322
	STA.b $38,x				;$B6A325
	LDA.w #$021A				;$B6A327
	JSL.l set_sprite_animation		;$B6A32A
	JSL.l CODE_BBAB52			;$B6A32E
	BCS.b CODE_B6A337			;$B6A332
	JSR.w CODE_B6A42D			;$B6A334
CODE_B6A337:
	JML [$04F5]				;$B6A337

CODE_B6A33A:
	LDA.w #$0008				;$B6A33A
	STA.b $38,x				;$B6A33D
	JSL.l CODE_BBAB52			;$B6A33F
	BCS.b CODE_B6A348			;$B6A343
	JSR.w CODE_B6A42D			;$B6A345
CODE_B6A348:
	JML [$04F5]				;$B6A348

CODE_B6A34B:
	JSR.w CODE_B6A49F			;$B6A34B
	LDA.b $40,x				;$B6A34E
	CMP.w #$0219				;$B6A350
	BEQ.b CODE_B6A3B8			;$B6A353
	CMP.w #$021B				;$B6A355
	BEQ.b CODE_B6A3B8			;$B6A358
	LDY.w active_kong_sprite		;$B6A35A
	JSL.l CODE_B5801E			;$B6A35D
	CMP.b $1A				;$B6A361
	BCC.b CODE_B6A36C			;$B6A363
	LDA.b $1A				;$B6A365
	CMP.w #$001E				;$B6A367
	BCC.b CODE_B6A374			;$B6A36A
CODE_B6A36C:
	LDA.w #$0008				;$B6A36C
	STA.b $38,x				;$B6A36F
	JMP.w CODE_B6A279			;$B6A371

CODE_B6A374:
	LDA.b $30,x				;$B6A374
	PHA					;$B6A376
	STZ.b $30,x				;$B6A377
	JSL.l process_current_movement		;$B6A379
	PLA					;$B6A37D
	STA.b $30,x				;$B6A37E
	LDA.b $2A,x				;$B6A380
	BPL.b CODE_B6A388			;$B6A382
	EOR.w #$FFFF				;$B6A384
	INC					;$B6A387
CODE_B6A388:
	CMP.w #$0060				;$B6A388
	BCS.b CODE_B6A3B8			;$B6A38B
	STZ.b $2A,x				;$B6A38D
	CLC					;$B6A38F
	JSR.w CODE_B6A651			;$B6A390
	BCS.b CODE_B6A3AC			;$B6A393
	STA.b $66,x				;$B6A395
	LDA.w #$0219				;$B6A397
	LDY.b $40,x				;$B6A39A
	BEQ.b CODE_B6A3A8			;$B6A39C
	CMP.b $40,x				;$B6A39E
	BEQ.b CODE_B6A3B8			;$B6A3A0
	INC					;$B6A3A2
	INC					;$B6A3A3
	CMP.b $40,x				;$B6A3A4
	BEQ.b CODE_B6A3B8			;$B6A3A6
CODE_B6A3A8:
	JSL.l set_sprite_animation		;$B6A3A8
CODE_B6A3AC:
	JSL.l CODE_BBAB52			;$B6A3AC
	BCS.b CODE_B6A3B5			;$B6A3B0
	JSR.w CODE_B6A42D			;$B6A3B2
CODE_B6A3B5:
	JML [$04F5]				;$B6A3B5

CODE_B6A3B8:
	JSL.l CODE_BBAB52			;$B6A3B8
	BCS.b CODE_B6A3C5			;$B6A3BC
	JSR.w CODE_B6A42D			;$B6A3BE
	JSL.l process_sprite_animation		;$B6A3C1
CODE_B6A3C5:
	JML [$04F5]				;$B6A3C5

CODE_B6A3C8:
	BRA.b CODE_B6A3A8			;$B6A3C8

CODE_B6A3CA:
	JSR.w CODE_B6A49F			;$B6A3CA
	LDA.w #$021A				;$B6A3CD
	CMP.b $40,x				;$B6A3D0
	BEQ.b CODE_B6A419			;$B6A3D2
	LDY.w active_kong_sprite		;$B6A3D4
	JSL.l CODE_B5801E			;$B6A3D7
	LDA.b $1A				;$B6A3DB
	CMP.w #$001E				;$B6A3DD
	BCC.b CODE_B6A3FC			;$B6A3E0
CODE_B6A3E2:
	SEC					;$B6A3E2
	JSR.w CODE_B6A651			;$B6A3E3
	BCS.b CODE_B6A40D			;$B6A3E6
	LDA.b $24,x				;$B6A3E8
	CMP.w #$2DCD				;$B6A3EA
	BNE.b CODE_B6A3F2			;$B6A3ED
	JMP.w CODE_B6A33A			;$B6A3EF

CODE_B6A3F2:
	LDA.w #$021A				;$B6A3F2
	JSL.l set_sprite_animation		;$B6A3F5
	JMP.w return_handle_despawn		;$B6A3F9

CODE_B6A3FC:
	LDA.b $1C				;$B6A3FC
	CMP.w #$0008				;$B6A3FE
	BCC.b CODE_B6A3E2			;$B6A401
	SEC					;$B6A403
	JSR.w CODE_B6A651			;$B6A404
	BCS.b CODE_B6A40D			;$B6A407
	STA.b $24,x				;$B6A409
	STZ.b $40,x				;$B6A40B
CODE_B6A40D:
	JSL.l CODE_BBAB52			;$B6A40D
	BCS.b CODE_B6A416			;$B6A411
	JSR.w CODE_B6A42D			;$B6A413
CODE_B6A416:
	JML [$04F5]				;$B6A416

CODE_B6A419:
	JSL.l CODE_BBAB52			;$B6A419
	BCS.b CODE_B6A426			;$B6A41D
	JSR.w CODE_B6A42D			;$B6A41F
	JSL.l process_sprite_animation		;$B6A422
CODE_B6A426:
	JML [$04F5]				;$B6A426

CODE_B6A429:
	TYX					;$B6A429
	JMP.w CODE_B6A33A			;$B6A42A

CODE_B6A42D:
	LDX.b current_sprite			;$B6A42D
	LDA.b $24,x				;$B6A42F
	CMP.w #$2DF0				;$B6A431
	BCC.b CODE_B6A442			;$B6A434
	CMP.w #$2DF6				;$B6A436
	BCS.b CODE_B6A442			;$B6A439
	JSL.l CODE_B6840E			;$B6A43B
	JSR.w CODE_B6A180			;$B6A43F
CODE_B6A442:
	RTS					;$B6A442

CODE_B6A443:
	LDY.w active_kong_sprite		;$B6A443
	LDA.b $12,x				;$B6A446
	SEC					;$B6A448
	SBC.w $0012,y				;$B6A449
	EOR.b $30,x				;$B6A44C
	ASL					;$B6A44E
	BMI.b CODE_B6A459			;$B6A44F
	LDA.b $30,x				;$B6A451
	EOR.w #$FFFF				;$B6A453
	INC					;$B6A456
	STA.b $30,x				;$B6A457
CODE_B6A459:
	RTS					;$B6A459

CODE_B6A45A:
	LDA.b $30,x				;$B6A45A
	BMI.b CODE_B6A46E			;$B6A45C
	LDA.b $60,x				;$B6A45E
	AND.w #$00FF				;$B6A460
	CLC					;$B6A463
	ADC.b $64,x				;$B6A464
	TAY					;$B6A466
	DEC					;$B6A467
	CMP.b $12,x				;$B6A468
	BCC.b CODE_B6A480			;$B6A46A
	BRA.b CODE_B6A47E			;$B6A46C

CODE_B6A46E:
	LDA.b $61,x				;$B6A46E
	AND.w #$00FF				;$B6A470
	EOR.w #$FFFF				;$B6A473
	SEC					;$B6A476
	ADC.b $64,x				;$B6A477
	TAY					;$B6A479
	CMP.b $12,x				;$B6A47A
	BCS.b CODE_B6A480			;$B6A47C
CODE_B6A47E:
	CLC					;$B6A47E
	RTS					;$B6A47F

CODE_B6A480:
	SEC					;$B6A480
	RTS					;$B6A481

CODE_B6A482:
	LDY.b current_sprite			;$B6A482
	LDX.b $5C,y				;$B6A484
	BEQ.b CODE_B6A48A			;$B6A486
	STZ.b $58,x				;$B6A488
CODE_B6A48A:
	TYX					;$B6A48A
	RTS					;$B6A48B

CODE_B6A48C:
	LDA.w #$001B				;$B6A48C
	JSL.l CODE_BEC01B			;$B6A48F
	BCC.b CODE_B6A49E			;$B6A493
	BEQ.b CODE_B6A49E			;$B6A495
	LDA.w #$0649				;$B6A497
	JSL.l queue_sound_effect		;$B6A49A
CODE_B6A49E:
	RTL					;$B6A49E

CODE_B6A49F:
	LDX.b current_sprite			;$B6A49F
	DEC.b $68,x				;$B6A4A1
	BPL.b CODE_B6A4FE			;$B6A4A3
	INC.b $68,x				;$B6A4A5
	JSL.l populate_sprite_clipping		;$B6A4A7
	LDA.w #$8000				;$B6A4AB
	JSL.l CODE_BEC009			;$B6A4AE
	BCC.b CODE_B6A4FE			;$B6A4B2
	LDA.w #$000F				;$B6A4B4
	JSL.l CODE_B88069			;$B6A4B7
	BCS.b CODE_B6A4FE			;$B6A4BB
	JSL.l CODE_BEC021			;$B6A4BD
	LDA.w #$0664				;$B6A4C1
	JSL.l queue_sound_effect		;$B6A4C4
	LDA.b $2A,x				;$B6A4C8
	BNE.b CODE_B6A4D4			;$B6A4CA
	LDA.b $1E,x				;$B6A4CC
	XBA					;$B6A4CE
	ASL					;$B6A4CF
	JSL.l CODE_B58021			;$B6A4D0
CODE_B6A4D4:
	BPL.b CODE_B6A4E0			;$B6A4D4
	CMP.w #$FB00				;$B6A4D6
	BCC.b CODE_B6A4E8			;$B6A4D9
	LDA.w #$FB00				;$B6A4DB
	BRA.b CODE_B6A4E8			;$B6A4DE

CODE_B6A4E0:
	CMP.w #$0500				;$B6A4E0
	BCS.b CODE_B6A4E8			;$B6A4E3
	LDA.w #$0500				;$B6A4E5
CODE_B6A4E8:
	STA.w $17CA				;$B6A4E8
	LDA.w #$FC00				;$B6A4EB
	STA.w $17CC				;$B6A4EE
	STZ.w $17CE				;$B6A4F1
	LDY.b $78				;$B6A4F4
	STY.w $17C8				;$B6A4F6
	LDA.w #$000A				;$B6A4F9
	STA.b $68,x				;$B6A4FC
CODE_B6A4FE:
	LDA.w #$0400				;$B6A4FE
	JSL.l check_throwable_collision		;$B6A501
	BCC.b CODE_B6A586			;$B6A505
	BNE.b CODE_B6A586			;$B6A507
	LDA.w #$0633				;$B6A509
	JSL.l queue_sound_effect		;$B6A50C
	LDY.b $78				;$B6A510
	LDA.w $0028,y				;$B6A512
	AND.w #$0101				;$B6A515
	CMP.w #$0101				;$B6A518
	BEQ.b CODE_B6A528			;$B6A51B
	LDA.b $16,x				;$B6A51D
	SEC					;$B6A51F
	SBC.w $0016,y				;$B6A520
	CMP.w #$0014				;$B6A523
	BPL.b CODE_B6A586			;$B6A526
CODE_B6A528:
	LDA.b $12,x				;$B6A528
	SEC					;$B6A52A
	SBC.w $0012,y				;$B6A52B
	EOR.b $1E,x				;$B6A52E
	ASL					;$B6A530
	BPL.b CODE_B6A546			;$B6A531
	LDA.b $40,x				;$B6A533
	CMP.w #$0211				;$B6A535
	BEQ.b CODE_B6A586			;$B6A538
	CMP.w #$0215				;$B6A53A
	BEQ.b CODE_B6A586			;$B6A53D
	LDA.b $24,x				;$B6A53F
	CMP.w #$2DE2				;$B6A541
	BCC.b CODE_B6A586			;$B6A544
CODE_B6A546:
	PLA					;$B6A546
	LDA.w #$0002				;$B6A547
	STA.b $38,x				;$B6A54A
	LDY.b $5E,x				;$B6A54C
	BEQ.b CODE_B6A580			;$B6A54E
	LDA.w #$0000				;$B6A550
	STA.w $005C,y				;$B6A553
	JSR.w CODE_B6A5DC			;$B6A556
	BNE.b CODE_B6A578			;$B6A559
	LDY.b $5C,x				;$B6A55B
	STY.b alternate_sprite			;$B6A55D
	LDA.b $1E,x				;$B6A55F
	TYX					;$B6A561
	INC.b $38,x				;$B6A562
	ASL					;$B6A564
	LDY.w #$0213				;$B6A565
	BPL.b CODE_B6A56B			;$B6A568
	INY					;$B6A56A
CODE_B6A56B:
	TYA					;$B6A56B
	JSL.l set_alt_sprite_animation		;$B6A56C
	LDA.w #$0001				;$B6A570
	JSR.w CODE_B6A604			;$B6A573
	BRA.b CODE_B6A580			;$B6A576

CODE_B6A578:
	LDY.b $5E,x				;$B6A578
	LDA.w #$0002				;$B6A57A
	STA.w $0038,y				;$B6A57D
CODE_B6A580:
	LDA.w #$0212				;$B6A580
	JMP.w CODE_B6878E			;$B6A583

CODE_B6A586:
	RTS					;$B6A586

CODE_B6A587:
	LDY.w active_kong_sprite		;$B6A587
	LDA.w $003A,y				;$B6A58A
	BIT.w #$0020				;$B6A58D
	BEQ.b CODE_B6A5A3			;$B6A590
	LDA.b $12,x				;$B6A592
	SEC					;$B6A594
	SBC.w $0012,y				;$B6A595
	BPL.b CODE_B6A59E			;$B6A598
	EOR.w #$FFFF				;$B6A59A
	INC					;$B6A59D
CODE_B6A59E:
	CMP.w #$0024				;$B6A59E
	BCC.b CODE_B6A5A4			;$B6A5A1
CODE_B6A5A3:
	RTS					;$B6A5A3

CODE_B6A5A4:
	LDA.b $16,x				;$B6A5A4
	CLC					;$B6A5A6
	ADC.w #$FFE0				;$B6A5A7
	CMP.w $0016,y				;$B6A5AA
	BCS.b CODE_B6A5A3			;$B6A5AD
	CLC					;$B6A5AF
	ADC.w #$0025				;$B6A5B0
	CMP.w $0016,y				;$B6A5B3
	BCC.b CODE_B6A5A3			;$B6A5B6
	PLA					;$B6A5B8
	LDA.w #$0003				;$B6A5B9
	STA.b $38,x				;$B6A5BC
	LDY.b $5C,x				;$B6A5BE
	BEQ.b CODE_B6A5D2			;$B6A5C0
	LDA.b $1E,x				;$B6A5C2
	ASL					;$B6A5C4
	BPL.b CODE_B6A5CC			;$B6A5C5
	LDA.w #$2E31				;$B6A5C7
	BRA.b CODE_B6A5CF			;$B6A5CA

CODE_B6A5CC:
	LDA.w #$2DFA				;$B6A5CC
CODE_B6A5CF:
	STA.w $0024,y				;$B6A5CF
CODE_B6A5D2:
	LDA.w #$0215				;$B6A5D2
	JSL.l set_sprite_animation		;$B6A5D5
	JML [$04F5]				;$B6A5D9

CODE_B6A5DC:
	LDA.w parent_level_number		;$B6A5DC
	SEC					;$B6A5DF
	SBC.w #$0025				;$B6A5E0  range?
	LSR					;$B6A5E3
	LSR					;$B6A5E4
	TAY					;$B6A5E5
	LDA.w $0697,y				;$B6A5E6
	STA.b $1A				;$B6A5E9
	LDA.w parent_level_number		;$B6A5EB
	SEC					;$B6A5EE
	SBC.w #$0025				;$B6A5EF
	AND.w #$0003				;$B6A5F2
	BEQ.b CODE_B6A5FE			;$B6A5F5
CODE_B6A5F7:
	LSR.b $1A				;$B6A5F7
	LSR.b $1A				;$B6A5F9
	DEC					;$B6A5FB
	BNE.b CODE_B6A5F7			;$B6A5FC
CODE_B6A5FE:
	LDA.b $1A				;$B6A5FE
	AND.w #$0003				;$B6A600
	RTS					;$B6A603

CODE_B6A604:
	STA.b $1A				;$B6A604
	LDA.w #$FFFC				;$B6A606
	STA.b $1C				;$B6A609
	LDA.w parent_level_number		;$B6A60B
	SEC					;$B6A60E
	SBC.w #$0025				;$B6A60F
	LSR					;$B6A612
	LSR					;$B6A613
	TAY					;$B6A614
	LDA.w parent_level_number		;$B6A615
	SEC					;$B6A618
	SBC.w #$0025				;$B6A619
	AND.w #$0003				;$B6A61C
	BEQ.b CODE_B6A62D			;$B6A61F
CODE_B6A621:
	ASL.b $1A				;$B6A621
	ASL.b $1A				;$B6A623
	SEC					;$B6A625
	ROL.b $1C				;$B6A626
	ROL.b $1C				;$B6A628
	DEC					;$B6A62A
	BNE.b CODE_B6A621			;$B6A62B
CODE_B6A62D:
	LDA.w $0697,y				;$B6A62D
	AND.b $1C				;$B6A630
	ORA.b $1A				;$B6A632
	STA.w $0697,y				;$B6A634
	RTS					;$B6A637

CODE_B6A638:
	CLC					;$B6A638
	ADC.w #$002D				;$B6A639
	TAY					;$B6A63C
	LDA.b $1E,x				;$B6A63D
	ASL					;$B6A63F
	BPL.b CODE_B6A648			;$B6A640
	TYA					;$B6A642
	CLC					;$B6A643
	ADC.w #$0037				;$B6A644
	TAY					;$B6A647
CODE_B6A648:
	TYA					;$B6A648
	LDY.b $5C,x				;$B6A649
	BEQ.b CODE_B6A650			;$B6A64B
	STA.w $0024,y				;$B6A64D
CODE_B6A650:
	RTS					;$B6A650

CODE_B6A651:
	PHP					;$B6A651
	LDX.b current_sprite			;$B6A652
	LDY.w active_kong_sprite		;$B6A654
	JSL.l CODE_B5801E			;$B6A657
	LDA.b $1E				;$B6A65B
	CMP.w #$0002				;$B6A65D
	BCC.b CODE_B6A690			;$B6A660
	PLP					;$B6A662
	LDA.w $0012,y				;$B6A663
	SEC					;$B6A666
	SBC.b $12,x				;$B6A667
	BMI.b CODE_B6A685			;$B6A669
	AND.w #$FFF8				;$B6A66B
	BEQ.b CODE_B6A68B			;$B6A66E
CODE_B6A670:
	EOR.b $1E,x				;$B6A670
	ASL					;$B6A672
	BPL.b CODE_B6A68B			;$B6A673
	LDA.w #$0004				;$B6A675
	STA.b $38,x				;$B6A678
	LDA.w #$0216				;$B6A67A
	JSL.l set_sprite_animation		;$B6A67D
	LDX.b current_sprite			;$B6A681
	SEC					;$B6A683
	RTS					;$B6A684

CODE_B6A685:
	ORA.w #$0007				;$B6A685
	INC					;$B6A688
	BNE.b CODE_B6A670			;$B6A689
CODE_B6A68B:
	CLC					;$B6A68B
	LDA.w #$2DCD				;$B6A68C
	RTS					;$B6A68F

CODE_B6A690:
	PLP					;$B6A690
	BCC.b CODE_B6A6C4			;$B6A691
	LDY.b $5C,x				;$B6A693
	CMP.w #$0001				;$B6A695
	BNE.b CODE_B6A6AF			;$B6A698
	CPY.w #$0000				;$B6A69A
	BEQ.b CODE_B6A6A8			;$B6A69D
	LDA.w $001E,y				;$B6A69F
	AND.w #$BFFF				;$B6A6A2
	STA.w $001E,y				;$B6A6A5
CODE_B6A6A8:
	LDA.b $1E,x				;$B6A6A8
	AND.w #$BFFF				;$B6A6AA
	BRA.b CODE_B6A6C2			;$B6A6AD

CODE_B6A6AF:
	CPY.w #$0000				;$B6A6AF
	BEQ.b CODE_B6A6BD			;$B6A6B2
	LDA.w $001E,y				;$B6A6B4
	ORA.w #$4000				;$B6A6B7
	STA.w $001E,y				;$B6A6BA
CODE_B6A6BD:
	LDA.b $1E,x				;$B6A6BD
	ORA.w #$4000				;$B6A6BF
CODE_B6A6C2:
	STA.b $1E,x				;$B6A6C2
CODE_B6A6C4:
	LDA.b $1C				;$B6A6C4
	CMP.b $1A				;$B6A6C6
	BCS.b CODE_B6A6E0			;$B6A6C8
	XBA					;$B6A6CA
	STA.w CPU.dividen_low			;$B6A6CB
	SEP.b #$20				;$B6A6CE
	LDA.b $1A				;$B6A6D0
	STA.w CPU.divisor			;$B6A6D2
	REP.b #$20				;$B6A6D5
	JSL.l stall_cpu_time			;$B6A6D7
	LDY.w #DATA_B6A718			;$B6A6DB
	BRA.b CODE_B6A6F6			;$B6A6DE

CODE_B6A6E0:
	LDA.b $1A				;$B6A6E0
	XBA					;$B6A6E2
	STA.w CPU.dividen_low			;$B6A6E3
	SEP.b #$20				;$B6A6E6
	LDA.b $1C				;$B6A6E8
	STA.w CPU.divisor			;$B6A6EA
	REP.b #$20				;$B6A6ED
	JSL.l stall_cpu_time			;$B6A6EF
	LDY.w #DATA_B6A727			;$B6A6F3
CODE_B6A6F6:
	LDA.w CPU.divide_result			;$B6A6F6
	INC					;$B6A6F9
	CMP.w #$0100				;$B6A6FA
	BCC.b CODE_B6A702			;$B6A6FD
	LDA.w #$00FF				;$B6A6FF
CODE_B6A702:
	STA.b $20				;$B6A702
CODE_B6A704:
	LDA.w $0000,y				;$B6A704
	AND.w #$00FF				;$B6A707
	CMP.b $20				;$B6A70A
	BCC.b CODE_B6A713			;$B6A70C
	LDA.w $0001,y				;$B6A70E
	CLC					;$B6A711
	RTS					;$B6A712

CODE_B6A713:
	INY					;$B6A713
	INY					;$B6A714
	INY					;$B6A715
	BRA.b CODE_B6A704			;$B6A716

DATA_B6A718:
	db $39,$CD,$2D,$72,$D2,$2D,$AB,$D7,$2D,$E4,$DC,$2D,$FF,$E1,$2D

DATA_B6A727:
	db $39,$F5,$2D,$72,$F0,$2D,$AB,$EB,$2D,$E4,$E6,$2D,$FF,$E1,$2D

dk_coin_main:
	JMP.w (DATA_B6A739,x)			;$B6A736

DATA_B6A739:
	dw CODE_B6A73F
	dw CODE_B6A742
	dw CODE_B6A766

CODE_B6A73F:
	JML [$04F5]				;$B6A73F

CODE_B6A742:
	LDY.w active_kong_sprite		;$B6A742
	JSL.l CODE_BEC003			;$B6A745
	BCC.b CODE_B6A763			;$B6A749
	LDY.b $5C,x				;$B6A74B
	LDA.w #$0002				;$B6A74D
	STA.w $0038,y				;$B6A750
	LDA.w #$0002				;$B6A753
	JSR.w CODE_B6A604			;$B6A756
	LDA.w #$0001				;$B6A759
	JSL.l CODE_BBC800			;$B6A75C
	JML [$04F5]				;$B6A760

CODE_B6A763:
	JMP.w CODE_B685E6			;$B6A763

CODE_B6A766:
	JSR.w CODE_B6C70A			;$B6A766
	LDY.w active_kong_sprite		;$B6A769
	JSL.l CODE_BEC003			;$B6A76C
	BCC.b CODE_B6A78B			;$B6A770
	JSL.l CODE_B880B7			;$B6A772
	BCC.b CODE_B6A78B			;$B6A776
	LDA.w #$0002				;$B6A778
	JSR.w CODE_B6A604			;$B6A77B
	LDA.w #$0001				;$B6A77E
	JSL.l CODE_BBC800			;$B6A781
	JSR.w CODE_B6F1A3			;$B6A785
	JML [$04F5]				;$B6A788

CODE_B6A78B:
	JMP.w CODE_B685E6			;$B6A78B

knocka_main:
	JSL.l CODE_BEC036			;$B6A78E
	JMP.w (DATA_B6A795,x)			;$B6A792

DATA_B6A795:
	dw CODE_B6A7D7				;00
	dw CODE_B6A7FF				;01
	dw CODE_B6A810				;02
	dw CODE_B6A827				;03
	dw CODE_B6A838				;04
	dw CODE_B6A899				;05
	dw CODE_B6A8E0				;06
	dw CODE_B6A918				;07
	dw CODE_B6A9A9				;08
	dw CODE_B6A9F4				;09
	dw CODE_B6AA12				;0A
	dw CODE_B6AA22				;0B
	dw CODE_B6A953				;0C
	dw CODE_B6A7B3				;0D
	dw CODE_B6A7C0				;0E

CODE_B6A7B3:
	TYX					;$B6A7B3
	STZ.b $38,x				;$B6A7B4
	LDA.w #$005B				;$B6A7B6
	JSL.l CODE_BB85A0			;$B6A7B9
	JML [$04F5]				;$B6A7BD

CODE_B6A7C0:
	TYX					;$B6A7C0
	DEC.b $68,x				;$B6A7C1
	BNE.b CODE_B6A7D4			;$B6A7C3
	LDA.w #$062E				;$B6A7C5
	JSL.l queue_sound_effect		;$B6A7C8
	JSL.l CODE_BB85AC			;$B6A7CC
	JSL.l delete_sprite_handle_deallocation	;$B6A7D0
CODE_B6A7D4:
	JML [$04F5]				;$B6A7D4

CODE_B6A7D7:
	JSL.l check_if_picked_up_by_kong	;$B6A7D7
	BCS.b CODE_B6A7F3			;$B6A7DB
	LDX.b current_sprite			;$B6A7DD
	DEC.b $62,x				;$B6A7DF
	BNE.b CODE_B6A7EC			;$B6A7E1
	LDA.w #$0005				;$B6A7E3
	STA.b $38,x				;$B6A7E6
	JSL.l CODE_B5802D			;$B6A7E8
CODE_B6A7EC:
	JSL.l process_current_movement		;$B6A7EC
	JMP.w return_handle_anim_and_despawn	;$B6A7F0

CODE_B6A7F3:
	LDX.b current_sprite			;$B6A7F3
	LDA.w #$005D				;$B6A7F5
	JSL.l CODE_BB85A0			;$B6A7F8
	JML [$04F5]				;$B6A7FC

CODE_B6A7FF:
	JSL.l update_held_sprite_position	;$B6A7FF
	JSL.l process_sprite_animation		;$B6A803
	JSL.l CODE_BEC039			;$B6A807
	BCS.b CODE_B6A86C			;$B6A80B
	JML [$04F5]				;$B6A80D

CODE_B6A810:
	TYX					;$B6A810
	LDA.w #$00C8				;$B6A811
	STA.b $62,x				;$B6A814
	JSL.l update_held_sprite_position	;$B6A816
	JSL.l process_sprite_animation		;$B6A81A
	JSL.l CODE_BEC039			;$B6A81E
	BCS.b CODE_B6A86C			;$B6A822
	JML [$04F5]				;$B6A824

CODE_B6A827:
	JSL.l update_held_sprite_position	;$B6A827
	JSL.l process_sprite_animation		;$B6A82B
	JSL.l CODE_BEC039			;$B6A82F
	BCS.b CODE_B6A86C			;$B6A833
	JML [$04F5]				;$B6A835

CODE_B6A838:
	JSL.l CODE_BEC03C			;$B6A838
	BCS.b CODE_B6A86C			;$B6A83C
	LDX.b current_sprite			;$B6A83E
	LDA.b $28,x				;$B6A840
	BIT.w #$0002				;$B6A842
	BNE.b CODE_B6A86C			;$B6A845
	LDA.b $2E,x				;$B6A847
	PHA					;$B6A849
	JSL.l process_current_movement		;$B6A84A
	PLY					;$B6A84E
	LDA.b $28,x				;$B6A84F
	AND.w #$0101				;$B6A851
	CMP.w #$0001				;$B6A854
	BNE.b CODE_B6A869			;$B6A857
	TYA					;$B6A859
	LSR					;$B6A85A
	STA.b $1A				;$B6A85B
	LSR					;$B6A85D
	LSR					;$B6A85E
	LSR					;$B6A85F
	CLC					;$B6A860
	ADC.b $1A				;$B6A861
	EOR.w #$FFFF				;$B6A863
	INC					;$B6A866
	STA.b $2E,x				;$B6A867
CODE_B6A869:
	JMP.w return_handle_anim_and_despawn	;$B6A869

CODE_B6A86C:
	LDX.b current_sprite			;$B6A86C
	CPX.w current_held_sprite		;$B6A86E
	BNE.b CODE_B6A876			;$B6A871
	STZ.w current_held_sprite		;$B6A873
CODE_B6A876:
	LDA.w #$060C				;$B6A876
	JSL.l queue_sound_effect		;$B6A879
	JSL.l CODE_BEC030			;$B6A87D
	LDX.b current_sprite			;$B6A881
	LDA.w #$000E				;$B6A883
	STA.b $38,x				;$B6A886
	LDA.w #$C000				;$B6A888
	STA.b $26,x				;$B6A88B
	LDA.w #$000B				;$B6A88D
	STA.b $68,x				;$B6A890
	JSL.l CODE_BB85AC			;$B6A892
	JML [$04F5]				;$B6A896

CODE_B6A899:
	TYX					;$B6A899
	JSR.w CODE_B6AAB0			;$B6A89A
	BCC.b CODE_B6A8CE			;$B6A89D
	LDA.w #$0006				;$B6A89F
	STA.b $38,x				;$B6A8A2
	LDA.w #$0048				;$B6A8A4
	STA.b $5A,x				;$B6A8A7
	JSL.l CODE_B5802D			;$B6A8A9
	JSR.w CODE_B6F284			;$B6A8AD
	LDY.w #$00E2				;$B6A8B0
	JSL.l CODE_BB8585			;$B6A8B3
	LDX.b alternate_sprite			;$B6A8B7
	LDY.b current_sprite			;$B6A8B9
	STY.b $5C,x				;$B6A8BB
	STX.b $5C,y				;$B6A8BD
	LDA.w $0008,y				;$B6A8BF
	STA.b $5E,x				;$B6A8C2
	JSR.w CODE_B6F284			;$B6A8C4
	LDA.w #$021D				;$B6A8C7
	JSL.l set_sprite_animation		;$B6A8CA
CODE_B6A8CE:
	JSL.l CODE_BBAB52			;$B6A8CE
	BCC.b CODE_B6A8DD			;$B6A8D2
	LDX.b current_sprite			;$B6A8D4
	LDY.b $5C,x				;$B6A8D6
	BEQ.b CODE_B6A8DD			;$B6A8D8
	JSR.w CODE_B6F3EB			;$B6A8DA
CODE_B6A8DD:
	JML [$04F5]				;$B6A8DD

CODE_B6A8E0:
	LDA.w #$0038				;$B6A8E0
	JSL.l check_throwable_collision		;$B6A8E3
	BCS.b CODE_B6A8F9			;$B6A8E7
	JSL.l populate_sprite_clipping		;$B6A8E9
	INC.w $1862				;$B6A8ED
	LDA.w #$0859				;$B6A8F0
	JSL.l CODE_BEC009			;$B6A8F3
	BCC.b CODE_B6A8FC			;$B6A8F7
CODE_B6A8F9:
	JSR.w CODE_B6AA62			;$B6A8F9
CODE_B6A8FC:
	JSL.l CODE_BBAB52			;$B6A8FC
	BCC.b CODE_B6A912			;$B6A900
	LDX.b current_sprite			;$B6A902
	LDY.b $5C,x				;$B6A904
	BEQ.b CODE_B6A90B			;$B6A906
	JSR.w CODE_B6F3EB			;$B6A908
CODE_B6A90B:
	JSL.l CODE_BB85AC			;$B6A90B
	JML [$04F5]				;$B6A90F

CODE_B6A912:
	JSR.w CODE_B6AAE9			;$B6A912
	JML [$04F5]				;$B6A915

CODE_B6A918:
	TYX					;$B6A918
CODE_B6A919:
	STZ.b $2A,x				;$B6A919
	LDY.w active_kong_sprite		;$B6A91B
	LDA.w $0012,y				;$B6A91E
	SEC					;$B6A921
	SBC.b $12,x				;$B6A922
	EOR.b $1E,x				;$B6A924
	ASL					;$B6A926
	BMI.b CODE_B6A938			;$B6A927
	LDA.b $66,x				;$B6A929
	EOR.b $1E,x				;$B6A92B
	ASL					;$B6A92D
	BPL.b CODE_B6A938			;$B6A92E
	LDA.b $66,x				;$B6A930
	EOR.w #$FFFF				;$B6A932
	INC					;$B6A935
	STA.b $66,x				;$B6A936
CODE_B6A938:
	LDA.b $66,x				;$B6A938
	STA.b $30,x				;$B6A93A
	LDA.w #$000C				;$B6A93C
	STA.b $38,x				;$B6A93F
	LDA.b $5C,x				;$B6A941
	STA.b alternate_sprite			;$B6A943
	LDA.w #$0220				;$B6A945
	JSL.l set_alt_sprite_animation		;$B6A948
	LDA.w #$021F				;$B6A94C
	JSL.l set_sprite_animation		;$B6A94F
CODE_B6A953:
	LDA.w #$0038				;$B6A953
	JSL.l check_throwable_collision		;$B6A956
	BCS.b CODE_B6A983			;$B6A95A
	JSL.l populate_sprite_clipping		;$B6A95C
	INC.w $1862				;$B6A960
	LDA.w #$0859				;$B6A963
	JSL.l CODE_BEC009			;$B6A966
	BCC.b CODE_B6A989			;$B6A96A
	CMP.w #$0002				;$B6A96C
	BEQ.b CODE_B6A983			;$B6A96F
	LDA.w #$0637				;$B6A971
	JSL.l queue_sound_effect		;$B6A974
	JSR.w CODE_B6AA3A			;$B6A978
	LDA.w #$0708				;$B6A97B
	STA.b $38,x				;$B6A97E
	JML [$04F5]				;$B6A980

CODE_B6A983:
	JSR.w CODE_B6AA62			;$B6A983
	JML [$04F5]				;$B6A986

CODE_B6A989:
	LDA.b $28,x				;$B6A989
	AND.w #$0002				;$B6A98B
	BEQ.b CODE_B6A99C			;$B6A98E
	LDA.b $66,x				;$B6A990
	STA.b $2A,x				;$B6A992
	JSR.w CODE_B6AA3A			;$B6A994
	LDA.w #$0908				;$B6A997
	STA.b $38,x				;$B6A99A
CODE_B6A99C:
	JSL.l process_current_movement		;$B6A99C
	LDY.b $5C,x				;$B6A9A0
	JSL.l CODE_B6F272			;$B6A9A2
	JMP.w CODE_B6A8FC			;$B6A9A6

CODE_B6A9A9:
	LDA.w #$0038				;$B6A9A9
	JSL.l check_throwable_collision		;$B6A9AC
	BCS.b CODE_B6A9D2			;$B6A9B0
	JSL.l populate_sprite_clipping		;$B6A9B2
	INC.w $1862				;$B6A9B6
	LDA.w #$0859				;$B6A9B9
	JSL.l CODE_BEC009			;$B6A9BC
	BCC.b CODE_B6A9D8			;$B6A9C0
	CMP.w #$0002				;$B6A9C2
	BEQ.b CODE_B6A9D2			;$B6A9C5
	JSR.w CODE_B6AA3A			;$B6A9C7
	LDA.w #$0708				;$B6A9CA
	STA.b $38,x				;$B6A9CD
	JML [$04F5]				;$B6A9CF

CODE_B6A9D2:
	JSR.w CODE_B6AA62			;$B6A9D2
	JML [$04F5]				;$B6A9D5

CODE_B6A9D8:
	LDA.w #$0049				;$B6A9D8
	JSL.l process_alternate_movement	;$B6A9DB
	LDY.b $5C,x				;$B6A9DF
	JSL.l CODE_B6F272			;$B6A9E1
	LDA.b $28,x				;$B6A9E5
	AND.w #$0001				;$B6A9E7
	BEQ.b CODE_B6A9F1			;$B6A9EA
	LDA.b $38,x				;$B6A9EC
	XBA					;$B6A9EE
	STA.b $38,x				;$B6A9EF
CODE_B6A9F1:
	JMP.w CODE_B6A8CE			;$B6A9F1

CODE_B6A9F4:
	TYX					;$B6A9F4
	LDY.w active_kong_sprite		;$B6A9F5
	LDA.w $0018,y				;$B6A9F8
	CMP.b $18,x				;$B6A9FB
	BCS.b CODE_B6AA0A			;$B6A9FD
	JSR.w CODE_B6AAB0			;$B6A9FF
	BCS.b CODE_B6AA0A			;$B6AA02
	JSR.w CODE_B6AA62			;$B6AA04
	JML [$04F5]				;$B6AA07

CODE_B6AA0A:
	LDA.w #$0007				;$B6AA0A
	STA.b $38,x				;$B6AA0D
	JMP.w CODE_B6A919			;$B6AA0F

CODE_B6AA12:
	LDA.w #$0040				;$B6AA12
	JSL.l process_alternate_movement	;$B6AA15
	LDY.b $5C,x				;$B6AA19
	JSL.l CODE_B6F272			;$B6AA1B
	JMP.w CODE_B6A8FC			;$B6AA1F

CODE_B6AA22:
	TYX					;$B6AA22
	STZ.b $2A,x				;$B6AA23
	STZ.b $30,x				;$B6AA25
	STZ.b $38,x				;$B6AA27
	LDA.w #$00C8				;$B6AA29
	STA.b $62,x				;$B6AA2C
	LDA.w #$0040				;$B6AA2E
	STA.b $5A,x				;$B6AA31
	JSL.l CODE_B5802A			;$B6AA33
	JMP.w CODE_B6A7D7			;$B6AA37

CODE_B6AA3A:
	LDA.b $2A,x				;$B6AA3A
	EOR.w #$FFFF				;$B6AA3C
	INC					;$B6AA3F
	STA.b $2A,x				;$B6AA40
	CMP.w #$8000				;$B6AA42
	ROR					;$B6AA45
	STA.b $30,x				;$B6AA46
	LDA.w #$FC00				;$B6AA48
	STA.b $2E,x				;$B6AA4B
	LDA.b $5C,x				;$B6AA4D
	STA.b alternate_sprite			;$B6AA4F
	LDA.w #$0226				;$B6AA51
	JSL.l set_alt_sprite_animation		;$B6AA54
	LDA.w #$0225				;$B6AA58
	JSL.l set_sprite_animation		;$B6AA5B
	LDX.b current_sprite			;$B6AA5F
	RTS					;$B6AA61

CODE_B6AA62:
	LDA.w #$0637				;$B6AA62
	JSL.l queue_sound_effect		;$B6AA65
	LDA.b $38,x				;$B6AA69
	PHA					;$B6AA6B
	LDA.w #$000A				;$B6AA6C
	STA.b $38,x				;$B6AA6F
	STZ.b $30,x				;$B6AA71
	LDY.b $5C,x				;$B6AA73
	LDA.w $0026,y				;$B6AA75
	BEQ.b CODE_B6AA8A			;$B6AA78
	INC.b $38,x				;$B6AA7A
	STZ.b $5C,x				;$B6AA7C
	JSR.w CODE_B6F3EB			;$B6AA7E
	LDA.w #$021C				;$B6AA81
	JSL.l set_sprite_animation		;$B6AA84
	PLA					;$B6AA88
	RTS					;$B6AA89

CODE_B6AA8A:
	STY.b alternate_sprite			;$B6AA8A
	PLA					;$B6AA8C
	CMP.w #$0006				;$B6AA8D
	BNE.b CODE_B6AAA1			;$B6AA90
	LDA.w #$0224				;$B6AA92
	JSL.l set_alt_sprite_animation		;$B6AA95
	LDA.w #$0223				;$B6AA99
	JSL.l set_sprite_animation		;$B6AA9C
	RTS					;$B6AAA0

CODE_B6AAA1:
	LDA.w #$0228				;$B6AAA1
	JSL.l set_alt_sprite_animation		;$B6AAA4
	LDA.w #$0227				;$B6AAA8
	JSL.l set_sprite_animation		;$B6AAAB
	RTS					;$B6AAAF

CODE_B6AAB0:
	LDA.b $5F,x				;$B6AAB0
	AND.w #$00FF				;$B6AAB2
	EOR.w #$FFFF				;$B6AAB5
	SEC					;$B6AAB8
	ADC.b $12,x				;$B6AAB9
	STA.b $1A				;$B6AABB
	LDA.b $5E,x				;$B6AABD
	AND.w #$00FF				;$B6AABF
	CLC					;$B6AAC2
	ADC.b $12,x				;$B6AAC3
	STA.b $1C				;$B6AAC5
	LDA.b $61,x				;$B6AAC7
	AND.w #$00FF				;$B6AAC9
	EOR.w #$FFFF				;$B6AACC
	SEC					;$B6AACF
	ADC.b $16,x				;$B6AAD0
	STA.b $1E				;$B6AAD2
	LDA.b $60,x				;$B6AAD4
	AND.w #$00FF				;$B6AAD6
	CLC					;$B6AAD9
	ADC.b $16,x				;$B6AADA
	STA.b $20				;$B6AADC
	LDY.w active_kong_sprite		;$B6AADE
	LDA.w #$001A				;$B6AAE1
	JSL.l CODE_B6F3AB			;$B6AAE4
	RTS					;$B6AAE8

CODE_B6AAE9:
	JSL.l process_sprite_animation		;$B6AAE9
	LDX.b current_sprite			;$B6AAED
	LDA.b $5C,x				;$B6AAEF
	BEQ.b CODE_B6AAFD			;$B6AAF1
	PHX					;$B6AAF3
	STA.b current_sprite			;$B6AAF4
	JSL.l process_sprite_animation		;$B6AAF6
	PLA					;$B6AAFA
	STA.b current_sprite			;$B6AAFB
CODE_B6AAFD:
	RTS					;$B6AAFD

knocka_limbs_main:
	LDA.w #!sprite_knocka			;$B6AAFE
	JSR.w CODE_B6B22E			;$B6AB01
	JML [$04F5]				;$B6AB04

krimp_main:
	JMP (.state_table,x)			;$B6AB07  |>

.state_table:
	dw .init
	dw .idle
	dw .defeated

.init:
	TYX					;$B6AB10  \  Transfer Krimp sprite to X
	LDA sprite.state,x			;$B6AB11   |
	XBA					;$B6AB13   | Set state 1 (idle) in a really weird way
	STA sprite.state,x			;$B6AB14   |
	JSR invert_max_x_speed_if_needed	;$B6AB16   |
	LDA sprite.max_x_speed,x		;$B6AB19   | Get max X speed
	STA sprite.general_purpose_62,x		;$B6AB1B   | Set as movement behavior max X speed
	JML [$04F5]				;$B6AB1D  / Return

.idle:
	JSR .handle_collision			;$B6AB20  \ Handle Krimp collision
	LDA sprite.x_speed,x			;$B6AB23   | Get current X speed
	BEQ ..return				;$B6AB25   |
	EOR sprite.oam_property,x		;$B6AB27   |
	ASL					;$B6AB29   |
	BMI ..CODE_B6AB33			;$B6AB2A  /
..return:
	JSL process_current_movement		;$B6AB2C  \ Process current movement
	JMP return_handle_anim_and_despawn	;$B6AB30  / Process animation and handle despawn

..CODE_B6AB33:
	LDA #$023C				;$B6AB33  \
	CMP sprite.animation_id,x		;$B6AB36   | Check if Krimp is in the turn around animation
	BEQ ..return_2				;$B6AB38   | If yes, return
	LDA #$0200				;$B6AB3A   |
	STA sprite.animation_speed,x		;$B6AB3D  / Else update animation speed
..return_2:
	JSL process_current_movement		;$B6AB3F  \ Process current movement
	JMP return_handle_anim_and_despawn	;$B6AB43  / Process animation and handle despawn

.defeated:
	JMP generic_move_and_animate_state	;$B6AB46  |>

.handle_collision:
	LDA #$0038				;$B6AB49  \  Get collision flags
	JSL check_throwable_collision		;$B6AB4C   | Check throwable collision
	BCS ..defeat_krimp			;$B6AB50   | If collision happened, defeat Krimp
	JSL populate_sprite_clipping		;$B6AB52   |
	LDA #$0888				;$B6AB56   | Else get player collision flags
	JSL CODE_BEC009				;$B6AB59   | And check for player collision
	BCC ..return				;$B6AB5D   | If no collision, return
	BNE ..defeat_krimp			;$B6AB5F  / Else defeat Krimp if we succeeded in doing so
..return:
	RTS					;$B6AB61  |> Return

..defeat_krimp:
	LDY #$0002				;$B6AB62  \ Load state to set (defeated)
	LDA #$023D				;$B6AB65   | Load animation to play 
	JMP CODE_B6878B				;$B6AB68  / Defeat sprite


bristles_main:
	JMP (DATA_B6AB6E,x)			;$B6AB6B

DATA_B6AB6E:
	dw CODE_B6AB82
	dw CODE_B6AB97
	dw CODE_B6ABD7
	dw CODE_B6ABDA
	dw CODE_B6AC2C
	dw CODE_B6AC44
	dw CODE_B6AC5C
	dw CODE_B6AC8B
	dw CODE_B6ACA0
	dw CODE_B6ACAD

CODE_B6AB82:
	TYX					;$B6AB82
	LDA.b $38,x				;$B6AB83
	XBA					;$B6AB85
	STA.b $38,x				;$B6AB86
	JSR.w invert_max_x_speed_if_needed	;$B6AB88
	LDA.b $30,x				;$B6AB8B
	STA.b $62,x				;$B6AB8D
	LDA.w #$0031				;$B6AB8F
	STA.b $6A,x				;$B6AB92
	JML [$04F5]				;$B6AB94

CODE_B6AB97:
	LDA.w #$0020				;$B6AB97
	JSR.w CODE_B6ACF4			;$B6AB9A
	INC.b $6A,x				;$B6AB9D
	LDA.b $6A,x				;$B6AB9F
	CMP.w #$0032				;$B6ABA1
	BNE.b CODE_B6ABAF			;$B6ABA4
	STZ.b $6A,x				;$B6ABA6
	LDA.w #$0640				;$B6ABA8
	JSL.l queue_sound_effect		;$B6ABAB
CODE_B6ABAF:
	LDA.b $30,x				;$B6ABAF
	BEQ.b CODE_B6ABB8			;$B6ABB1
	EOR.b $1E,x				;$B6ABB3
	ASL					;$B6ABB5
	BMI.b CODE_B6ABBF			;$B6ABB6
CODE_B6ABB8:
	JSL.l process_current_movement		;$B6ABB8
	JMP.w return_handle_anim_and_despawn	;$B6ABBC

CODE_B6ABBF:
	LDA.b $40,x				;$B6ABBF
	CMP.w #$0252				;$B6ABC1
	BEQ.b CODE_B6ABD0			;$B6ABC4
	CMP.w #$0256				;$B6ABC6
	BEQ.b CODE_B6ABD0			;$B6ABC9
	LDA.w #$0180				;$B6ABCB
	STA.b $44,x				;$B6ABCE
CODE_B6ABD0:
	JSL.l process_current_movement		;$B6ABD0
	JMP.w return_handle_anim_and_despawn	;$B6ABD4

CODE_B6ABD7:
	JMP.w generic_move_and_animate_state	;$B6ABD7

CODE_B6ABDA:
	LDA.w #$0641				;$B6ABDA
	JSL.l CODE_B28024			;$B6ABDD
	LDA.w #$0000				;$B6ABE1
	JSR.w CODE_B6ACF4			;$B6ABE4
	LDA.b $30,x				;$B6ABE7
	BEQ.b CODE_B6ABF0			;$B6ABE9
	EOR.b $1E,x				;$B6ABEB
	ASL					;$B6ABED
	BMI.b CODE_B6AC14			;$B6ABEE
CODE_B6ABF0:
	LDA.b $2E,x				;$B6ABF0
	PHA					;$B6ABF2
	JSL.l process_current_movement		;$B6ABF3
	PLY					;$B6ABF7
	LDA.b $28,x				;$B6ABF8
	AND.w #$0101				;$B6ABFA
	CMP.w #$0001				;$B6ABFD
	BNE.b CODE_B6AC11			;$B6AC00
	TYA					;$B6AC02
	LSR					;$B6AC03
	STA.b $1A				;$B6AC04
	LSR					;$B6AC06
	LSR					;$B6AC07
	CLC					;$B6AC08
	ADC.b $1A				;$B6AC09
	EOR.w #$FFFF				;$B6AC0B
	INC					;$B6AC0E
	STA.b $2E,x				;$B6AC0F
CODE_B6AC11:
	JMP.w return_handle_anim_and_despawn	;$B6AC11

CODE_B6AC14:
	LDA.b $40,x				;$B6AC14
	CMP.w #$0254				;$B6AC16
	BEQ.b CODE_B6AC25			;$B6AC19
	CMP.w #$0255				;$B6AC1B
	BEQ.b CODE_B6AC25			;$B6AC1E
	LDA.w #$0180				;$B6AC20
	STA.b $44,x				;$B6AC23
CODE_B6AC25:
	JSL.l process_current_movement		;$B6AC25
	JMP.w return_handle_anim_and_despawn	;$B6AC29

CODE_B6AC2C:
	TYX					;$B6AC2C
	LDA.b $5C,x				;$B6AC2D
	STA.b $66,x				;$B6AC2F
	LDA.b $60,x				;$B6AC31
	STA.b $30,x				;$B6AC33
	STA.b $62,x				;$B6AC35
	LDA.w #$0006				;$B6AC37
	STA.b $38,x				;$B6AC3A
	LDA.w #$0031				;$B6AC3C
	STA.b $6A,x				;$B6AC3F
	JML [$04F5]				;$B6AC41

CODE_B6AC44:
	TYX					;$B6AC44
	LDA.b $5E,x				;$B6AC45
	STA.b $66,x				;$B6AC47
	LDA.b $64,x				;$B6AC49
	STA.b $30,x				;$B6AC4B
	STA.b $62,x				;$B6AC4D
	LDA.w #$0007				;$B6AC4F
	STA.b $38,x				;$B6AC52
	LDA.w #$0031				;$B6AC54
	STA.b $6A,x				;$B6AC57
	JML [$04F5]				;$B6AC59

CODE_B6AC5C:
	TYX					;$B6AC5C
	DEC.b $66,x				;$B6AC5D
	BNE.b CODE_B6AC88			;$B6AC5F
	INC.b $38,x				;$B6AC61
	LDA.b $5E,x				;$B6AC63
	STA.b $66,x				;$B6AC65
	LDY.w #$0251				;$B6AC67
	LDA.b $64,x				;$B6AC6A
	EOR.b $30,x				;$B6AC6C
	BPL.b CODE_B6AC73			;$B6AC6E
	LDY.w #$0255				;$B6AC70
CODE_B6AC73:
	TYA					;$B6AC73
	JSL.l set_sprite_animation		;$B6AC74
	LDX.b current_sprite			;$B6AC78
	LDA.b $64,x				;$B6AC7A
	STA.b $30,x				;$B6AC7C
	STA.b $62,x				;$B6AC7E
	LDA.w #$0031				;$B6AC80
	STA.b $6A,x				;$B6AC83
	JMP.w CODE_B6ABDA			;$B6AC85

CODE_B6AC88:
	JMP.w CODE_B6AB97			;$B6AC88

CODE_B6AC8B:
	TYX					;$B6AC8B
	DEC.b $66,x				;$B6AC8C
	BNE.b CODE_B6AC9D			;$B6AC8E
	LDA.w #$0008				;$B6AC90
	STA.b $38,x				;$B6AC93
	LDA.w #$0019				;$B6AC95
	STA.b $6A,x				;$B6AC98
	JMP.w CODE_B6AB97			;$B6AC9A

CODE_B6AC9D:
	JMP.w CODE_B6ABDA			;$B6AC9D

CODE_B6ACA0:
	LDA.w #$0000				;$B6ACA0
	JSR.w CODE_B6ACF4			;$B6ACA3
	JSL.l process_current_movement		;$B6ACA6
	JMP.w return_handle_anim_and_despawn	;$B6ACAA

CODE_B6ACAD:
	LDA.w #$0000				;$B6ACAD
	JSR.w CODE_B6ACF4			;$B6ACB0
	INC.b $6A,x				;$B6ACB3
	LDA.b $6A,x				;$B6ACB5
	CMP.w #$0032				;$B6ACB7
	BNE.b CODE_B6ACC5			;$B6ACBA
	STZ.b $6A,x				;$B6ACBC
	LDA.w #$0640				;$B6ACBE
	JSL.l queue_sound_effect		;$B6ACC1
CODE_B6ACC5:
	LDA.b $30,x				;$B6ACC5
	BEQ.b CODE_B6ACCE			;$B6ACC7
	EOR.b $1E,x				;$B6ACC9
	ASL					;$B6ACCB
	BMI.b CODE_B6ACD5			;$B6ACCC
CODE_B6ACCE:
	JSL.l process_current_movement		;$B6ACCE
	JMP.w return_handle_anim_and_despawn	;$B6ACD2

CODE_B6ACD5:
	LDA.b $40,x				;$B6ACD5
	CMP.w #$0254				;$B6ACD7
	BEQ.b CODE_B6ACED			;$B6ACDA
	CMP.w #$0255				;$B6ACDC
	BEQ.b CODE_B6ACED			;$B6ACDF
	LDA.w #$0180				;$B6ACE1
	STA.b $44,x				;$B6ACE4
	LDA.b $2A,x				;$B6ACE6
	EOR.b $1E,x				;$B6ACE8
	ASL					;$B6ACEA
	BMI.b CODE_B6ACF1			;$B6ACEB
CODE_B6ACED:
	JSL.l process_current_movement		;$B6ACED
CODE_B6ACF1:
	JMP.w return_handle_anim_and_despawn	;$B6ACF1

CODE_B6ACF4:
	STA.w $1C15				;$B6ACF4
	LDA.w #$0038				;$B6ACF7
	JSL.l check_throwable_collision		;$B6ACFA
	BCS.b CODE_B6AD10			;$B6ACFE
	JSL.l populate_sprite_clipping		;$B6AD00
	LDA.w $1C15				;$B6AD04
	JSL.l CODE_BEC009			;$B6AD07
	BCC.b CODE_B6AD0F			;$B6AD0B
	BNE.b CODE_B6AD15			;$B6AD0D
CODE_B6AD0F:
	RTS					;$B6AD0F

CODE_B6AD10:
	LDA.w #$063C				;$B6AD10
	BRA.b CODE_B6AD18			;$B6AD13

CODE_B6AD15:
	LDA.w #$063B				;$B6AD15
CODE_B6AD18:
	JSL.l queue_sound_effect		;$B6AD18
	LDY.w #$0002				;$B6AD1C
	LDA.w #$0253				;$B6AD1F
	JMP.w CODE_B6878B			;$B6AD22

krumple_main:
	JMP (.state_table,x)			;$B6AD25  |>

.state_table:
	dw .init
	dw .idle
	dw .defeated
	dw .laugh_init
	dw .laugh
	dw .laugh_flip

.init:
	TYX					;$B6AD34  \ Get Krumple sprite
	LDA sprite.state,x			;$B6AD35   |
	XBA					;$B6AD37   |
	STA sprite.state,x			;$B6AD38   | Set state 1
	JSR invert_max_x_speed_if_needed	;$B6AD3A   |
	LDA sprite.max_x_speed,x		;$B6AD3D   |
	STA sprite.general_purpose_62,x		;$B6AD3F   | Set Max X speed as movement behavior X speed
	JML [$04F5]				;$B6AD41  /

.idle:
	JSR .handle_collision			;$B6AD44  \
	LDA sprite.max_x_speed,x		;$B6AD47   |
	BEQ ..CODE_B6AD50			;$B6AD49   |
	EOR sprite.oam_property,x		;$B6AD4B   |
	ASL					;$B6AD4D   |
	BMI ..CODE_B6AD57			;$B6AD4E  /
..CODE_B6AD50:
	JSL process_current_movement		;$B6AD50  \
	JMP return_handle_anim_and_despawn	;$B6AD54  /

..CODE_B6AD57:
	LDA #$0259				;$B6AD57  \
	CMP sprite.animation_id,x		;$B6AD5A   | Check if in the turning animation
	BEQ ..skip_anim_speed_update		;$B6AD5C   | If yes, don't update animation speed
	LDA #$0180				;$B6AD5E   |
	STA sprite.animation_speed,x		;$B6AD61  / Else update it
..skip_anim_speed_update:
	JSL process_current_movement		;$B6AD63  \
	JMP return_handle_anim_and_despawn	;$B6AD67  /

.defeated:
	JMP generic_move_and_animate_state	;$B6AD6A  |>

.laugh_init:
	LDX current_sprite			;$B6AD6D  \ Get Krumple sprite
	LDA #$0004				;$B6AD6F   |
	STA sprite.state,x			;$B6AD72   | Set laugh state
	LDA #$004B				;$B6AD74   |
	STA sprite.general_purpose_64,x	;$B6AD77   | Set laugh timer
	LDA #$025A				;$B6AD79   |
	JSL set_sprite_animation		;$B6AD7C  / Set laugh animation
.laugh:
	JSR .handle_collision			;$B6AD80  \
	LDX current_sprite			;$B6AD83   |
	DEC sprite.general_purpose_64,x	;$B6AD85   | Decrease laugh timer
	BNE ..return				;$B6AD87   | If not done yet, return
	LDA #$0001				;$B6AD89   |
	STA sprite.state,x			;$B6AD8C   | Else set idle state
	LDY #$0258				;$B6AD8E   |
	LDA sprite.max_x_speed,x		;$B6AD91   |
	EOR sprite.oam_property,x		;$B6AD93   |
	ASL					;$B6AD95   |
	BPL ..CODE_B6AD9B			;$B6AD96   |
	LDY #$0259				;$B6AD98  /
..CODE_B6AD9B:
	TYA					;$B6AD9B  \
	JSL set_sprite_animation		;$B6AD9C   |
	JML [$04F5]				;$B6ADA0  /

..return:
	JMP CODE_B685E6				;$B6ADA3  |> Return and process animation

.laugh_flip:
	TYX					;$B6ADA6  \ Get Krumple sprite
	LDA sprite.animation_id,x		;$B6ADA7   |
	CMP #$025C				;$B6ADA9   | Check if still in laugh flip animation
	BEQ ..return				;$B6ADAC   | If yes return
	JMP .laugh_init				;$B6ADAE  / Else run laugh state code

..return:
	JMP CODE_B685E6				;$B6ADB1  |> Return and process animation

.handle_collision:
	LDA #$0038				;$B6ADB4  \ Get throwable collision flags
	JSL check_throwable_collision		;$B6ADB7   |
	BCS ..defeat_krumple			;$B6ADBB   | If collision happened, defeat him
	JSL populate_sprite_clipping		;$B6ADBD   |
	LDA #$0854				;$B6ADC1   |
	LDX #$0858				;$B6ADC4   | Else get player collision flags
	JSL CODE_BEC00C				;$B6ADC7   | Check collision with player
	BCC ..return				;$B6ADCB   | If no collision, return
	CMP #$0002				;$B6ADCD   | Else check if we succeeded in defeating him
	BEQ ..defeat_krumple			;$B6ADD0   | If yes, defeat him
	PLA					;$B6ADD2   |
	LDA.w sprite.x_position,y		;$B6ADD3   |
	SEC					;$B6ADD6   | Else get X distance from kong
	SBC sprite.x_position,x			;$B6ADD7   |
	LDY #$0003				;$B6ADD9   |
	EOR sprite.oam_property,x		;$B6ADDC   |
	ASL					;$B6ADDE   |
	BPL ..set_laugh_flip_state		;$B6ADDF   |
	LDA #$025C				;$B6ADE1   |
	JSL set_sprite_animation		;$B6ADE4   | Set flip animation
	LDX current_sprite			;$B6ADE8   |
	LDY #$0005				;$B6ADEA  /
..set_laugh_flip_state:
	STY sprite.state,x			;$B6ADED  \ 
	JML [$04F5]				;$B6ADEF  /

..return:
	RTS					;$B6ADF2  |>

..defeat_krumple:
	LDY #$0002				;$B6ADF3  \ Get defeat state to set
	LDA #$025B				;$B6ADF6   | Get animation to set
	JMP CODE_B6878B				;$B6ADF9  / Defeat sprite

swoopy_spawner_main:
	JMP (.state_table,x)			;$B6ADFC  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B6AE03  \ Get Spawner sprite
	JSR CODE_B6F371				;$B6AE04   |
	INC sprite.state,x			;$B6AE07  / Set idle state
.idle:
	LDX current_sprite			;$B6AE09  \ Get Spawner sprite
	JSR CODE_B6F381				;$B6AE0B   | Count down spawn timer
	BCC ..return				;$B6AE0E   | If timer not done, return
	LDY #$0130				;$B6AE10   |
	JSL CODE_BB8585				;$B6AE13   | Else spawn Swoop
	BCS ..return				;$B6AE17   | If spawn failed, return
	LDX alternate_sprite			;$B6AE19   | Else get Swoopy sprite
	LDY current_sprite			;$B6AE1B   | Get Spawner sprite
	LDA.w sprite.general_purpose_64,y	;$B6AE1D   |
	STA sprite.general_purpose_5C,x		;$B6AE20   |
	LDA.w sprite.general_purpose_66,y	;$B6AE22   |
	STA sprite.general_purpose_5E,x		;$B6AE25   |
	LDA.w sprite.general_purpose_68,y	;$B6AE27   |
	STA sprite.general_purpose_60,x	;$B6AE2A   |
	LDA.w sprite.general_purpose_6A,y	;$B6AE2C   |
	STA sprite.general_purpose_6A,x		;$B6AE2F   |
	LDA.w sprite.x_speed,y			;$B6AE31   | Copy spawner X speed to Swoopy
	STA sprite.x_speed,x			;$B6AE34   |
	BPL ..return				;$B6AE36   | If positive speed, don't flip
	LDA sprite.oam_property,x		;$B6AE38   |
	EOR #$4000				;$B6AE3A   | Else flip Swoopy
	STA sprite.oam_property,x		;$B6AE3D  /
..return:
	JMP return_handle_despawn		;$B6AE3F  |> Return

swoopy_main:
	JMP.w (DATA_B6AE45,x)			;$B6AE42

DATA_B6AE45:
	dw CODE_B6AE5B
	dw CODE_B6AE62
	dw CODE_B6AE97
	dw CODE_B6AEB1
	dw CODE_B6AEC1
	dw CODE_B6AEC4
	dw CODE_B6AF07
	dw CODE_B6AF19
	dw CODE_B6AF35
	dw CODE_B6AF7B
	dw CODE_B6AF8F

CODE_B6AE5B:
	TYX					;$B6AE5B
	INC.b $38,x				;$B6AE5C
	STZ.b $64,x				;$B6AE5E
	STZ.b $68,x				;$B6AE60
CODE_B6AE62:
	JSR.w CODE_B6AFAD			;$B6AE62
	JSR.w CODE_B6B02A			;$B6AE65
	DEC.b $5C,x				;$B6AE68
	BNE.b CODE_B6AE8D			;$B6AE6A
	INC.b $38,x				;$B6AE6C
	LDA.b $5E,x				;$B6AE6E
	STA.b $5C,x				;$B6AE70
	LDA.b $60,x				;$B6AE72
	SEC					;$B6AE74
	SBC.b $16,x				;$B6AE75
	LSR					;$B6AE77
	STA.b $62,x				;$B6AE78
	LDA.b $5E,x				;$B6AE7A
	XBA					;$B6AE7C
	ORA.b $5E,x				;$B6AE7D
	STA.w CPU.multiply_A			;$B6AE7F
	LDA.w CPU.multiply_result		;$B6AE82
	LDA.w CPU.multiply_result		;$B6AE85
	LSR					;$B6AE88
	STA.b $66,x				;$B6AE89
	BRA.b CODE_B6AE97			;$B6AE8B

CODE_B6AE8D:
	JSL.l process_current_movement		;$B6AE8D
	JSR.w CODE_B6AF9B			;$B6AE91
	JMP.w CODE_B685E6			;$B6AE94

CODE_B6AE97:
	JSR.w CODE_B6AFAD			;$B6AE97
	JSR.w CODE_B6B02A			;$B6AE9A
	LDY.w #$0001				;$B6AE9D
	JSR.w CODE_B6AFB9			;$B6AEA0
	BCC.b CODE_B6AEA7			;$B6AEA3
	INC.b $38,x				;$B6AEA5
CODE_B6AEA7:
	JSL.l process_current_movement		;$B6AEA7
	JSR.w CODE_B6AF9B			;$B6AEAB
	JMP.w CODE_B685E6			;$B6AEAE

CODE_B6AEB1:
	JSR.w CODE_B6AFAD			;$B6AEB1
	JSR.w CODE_B6B02A			;$B6AEB4
	JSL.l process_current_movement		;$B6AEB7
	JSR.w CODE_B6AF9B			;$B6AEBB
	JMP.w CODE_B685E6			;$B6AEBE

CODE_B6AEC1:
	JMP.w generic_move_and_animate_state	;$B6AEC1

CODE_B6AEC4:
	JSR.w CODE_B6AFAD			;$B6AEC4
	TYX					;$B6AEC7
	LDA.b $5D,x				;$B6AEC8
	AND.w #$00FF				;$B6AECA
	EOR.w #$FFFF				;$B6AECD
	SEC					;$B6AED0
	ADC.b $12,x				;$B6AED1
	STA.b $1C				;$B6AED3
	LDA.b $5C,x				;$B6AED5
	AND.w #$00FF				;$B6AED7
	CLC					;$B6AEDA
	ADC.b $12,x				;$B6AEDB
	STA.b $1E				;$B6AEDD
	LDA.b $5F,x				;$B6AEDF
	AND.w #$00FF				;$B6AEE1
	EOR.w #$FFFF				;$B6AEE4
	SEC					;$B6AEE7
	ADC.b $16,x				;$B6AEE8
	STA.b $20				;$B6AEEA
	LDA.b $5E,x				;$B6AEEC
	AND.w #$00FF				;$B6AEEE
	CLC					;$B6AEF1
	ADC.b $16,x				;$B6AEF2
	STA.b $22				;$B6AEF4
	LDY.w active_kong_sprite		;$B6AEF6
	LDA.w #$001C				;$B6AEF9
	JSL.l CODE_B6F3AB			;$B6AEFC
	BCC.b CODE_B6AF04			;$B6AF00
	INC.b $38,x				;$B6AF02
CODE_B6AF04:
	JMP.w return_handle_anim_and_despawn	;$B6AF04

CODE_B6AF07:
	TYX					;$B6AF07
	DEC.b $60,x				;$B6AF08
	BNE.b CODE_B6AF16			;$B6AF0A
	LDA.w #$025F				;$B6AF0C
	JSL.l set_sprite_animation		;$B6AF0F
	JML [$04F5]				;$B6AF13

CODE_B6AF16:
	JMP.w return_handle_anim_and_despawn	;$B6AF16

CODE_B6AF19:
	TYX					;$B6AF19
	LDA.b $34,x				;$B6AF1A
	LSR					;$B6AF1C
	LSR					;$B6AF1D
	LSR					;$B6AF1E
	SBC.b $34,x				;$B6AF1F
	EOR.w #$FFFF				;$B6AF21
	CMP.b $2E,x				;$B6AF24
	BCS.b CODE_B6AF2C			;$B6AF26
	INC.b $38,x				;$B6AF28
	STZ.b $34,x				;$B6AF2A
CODE_B6AF2C:
	LDA.w #$000A				;$B6AF2C
	JSL.l interpolate_y_speed		;$B6AF2F
	BRA.b CODE_B6AF4F			;$B6AF33

CODE_B6AF35:
	TYX					;$B6AF35
	LDA.b $2E,x				;$B6AF36
	CMP.w #$0180				;$B6AF38
	BCS.b CODE_B6AF48			;$B6AF3B
	LDA.w #$0260				;$B6AF3D
	CMP.b $40,x				;$B6AF40
	BEQ.b CODE_B6AF48			;$B6AF42
	JSL.l set_sprite_animation		;$B6AF44
CODE_B6AF48:
	LDA.w #$0006				;$B6AF48
	JSL.l interpolate_y_speed		;$B6AF4B
CODE_B6AF4F:
	LDA.w #$0007				;$B6AF4F
	JSL.l interpolate_x_speed		;$B6AF52
	JSL.l CODE_B9E006			;$B6AF56
	LDA.b $28,x				;$B6AF5A
	BIT.w #$0002				;$B6AF5C
	BEQ.b CODE_B6AF78			;$B6AF5F
	LDA.w #$0036				;$B6AF61
	JSL.l CODE_BFF006			;$B6AF64
	JSL.l CODE_B6840E			;$B6AF68
	INC.b $38,x				;$B6AF6C
	LDA.w #$0261				;$B6AF6E
	JSL.l set_sprite_animation		;$B6AF71
	JML [$04F5]				;$B6AF75

CODE_B6AF78:
	JMP.w return_handle_anim_and_despawn	;$B6AF78

CODE_B6AF7B:
	JSL.l CODE_BBAB52			;$B6AF7B
	BCS.b CODE_B6AF8C			;$B6AF7F
	LDA.w #CODE_B6AFF0			;$B6AF81
	JSL.l CODE_BB85D6			;$B6AF84
	JSL.l process_sprite_animation		;$B6AF88
CODE_B6AF8C:
	JML [$04F5]				;$B6AF8C

CODE_B6AF8F:
	TYX					;$B6AF8F
	JSR.w invert_max_x_speed_if_needed	;$B6AF90
	LDA.w #$0005				;$B6AF93
	STA.b $38,x				;$B6AF96
	JML [$04F5]				;$B6AF98

CODE_B6AF9B:
	LDA.b $12,x				;$B6AF9B
	SEC					;$B6AF9D
	SBC.b $6A,x				;$B6AF9E
	EOR.b $2A,x				;$B6AFA0
	BMI.b CODE_B6AFAC			;$B6AFA2
	PLA					;$B6AFA4
	JSL.l delete_sprite_handle_deallocation	;$B6AFA5
	JML [$04F5]				;$B6AFA9

CODE_B6AFAC:
	RTS					;$B6AFAC

CODE_B6AFAD:
	LDA.w #$0034				;$B6AFAD
	JSL.l CODE_BFF009			;$B6AFB0
	RTS					;$B6AFB4

CODE_B6AFB5:
	JSR.w CODE_B6AFB9			;$B6AFB5
	RTL					;$B6AFB8

CODE_B6AFB9:
	LDA.b $66,x				;$B6AFB9
	BEQ.b CODE_B6AFEA			;$B6AFBB
	LDA.b $5C,x				;$B6AFBD
	BEQ.b CODE_B6AFCD			;$B6AFBF
	DEC.b $5C,x				;$B6AFC1
	BNE.b CODE_B6AFCD			;$B6AFC3
	LDA.b $62,x				;$B6AFC5
	EOR.w #$FFFF				;$B6AFC7
	INC					;$B6AFCA
	STA.b $62,x				;$B6AFCB
CODE_B6AFCD:
	LDA.b $62,x				;$B6AFCD
	CLC					;$B6AFCF
	ADC.b $68,x				;$B6AFD0
	STA.b $68,x				;$B6AFD2
	CLC					;$B6AFD4
	ADC.b $64,x				;$B6AFD5
CODE_B6AFD7:
	CMP.b $66,x				;$B6AFD7
	BCC.b CODE_B6AFEC			;$B6AFD9
	SEC					;$B6AFDB
	SBC.b $66,x				;$B6AFDC
	BMI.b CODE_B6AFEA			;$B6AFDE
	PHA					;$B6AFE0
	TYA					;$B6AFE1
	CLC					;$B6AFE2
	ADC.b $16,x				;$B6AFE3
	STA.b $16,x				;$B6AFE5
	PLA					;$B6AFE7
	BRA.b CODE_B6AFD7			;$B6AFE8

CODE_B6AFEA:
	SEC					;$B6AFEA
	RTS					;$B6AFEB

CODE_B6AFEC:
	STA.b $64,x				;$B6AFEC
	CLC					;$B6AFEE
	RTS					;$B6AFEF

CODE_B6AFF0:
	LDA.w #$0023				;$B6AFF0
	JSL.l CODE_BEC01B			;$B6AFF3
	LDX.b current_sprite			;$B6AFF7
	BCC.b CODE_B6B014			;$B6AFF9
	CMP.w #$0000				;$B6AFFB
	BEQ.b CODE_B6B013			;$B6AFFE
	LDY.w active_kong_sprite		;$B6B000
	LDA.w $002E,y				;$B6B003
	BMI.b CODE_B6B013			;$B6B006
	LDA.w #$0265				;$B6B008
	CMP.b $40,x				;$B6B00B
	BEQ.b CODE_B6B013			;$B6B00D
	JSL.l set_sprite_animation		;$B6B00F
CODE_B6B013:
	RTL					;$B6B013

CODE_B6B014:
	LDA.w #$0265				;$B6B014
	CMP.b $40,x				;$B6B017
	BNE.b CODE_B6B013			;$B6B019
	LDA.w #$0266				;$B6B01B
	JSL.l set_sprite_animation		;$B6B01E
	LDX.b current_sprite			;$B6B022
	LDA.w #$0300				;$B6B024
	STA.b $44,x				;$B6B027
	RTL					;$B6B029

CODE_B6B02A:
	LDA.w #$0038				;$B6B02A
	JSL.l check_throwable_collision		;$B6B02D
	BCS.b CODE_B6B043			;$B6B031
	JSL.l populate_sprite_clipping		;$B6B033
	LDA.w #$0888				;$B6B037
	JSL.l CODE_BEC009			;$B6B03A
	BCC.b CODE_B6B042			;$B6B03E
	BNE.b CODE_B6B043			;$B6B040
CODE_B6B042:
	RTS					;$B6B042

CODE_B6B043:
	LDY.w #$0004				;$B6B043
	LDA.w #$0262				;$B6B046
	JMP.w CODE_B6878B			;$B6B049

kuchuka_main:
	JSL.l CODE_BEC036			;$B6B04C
	JMP.w (DATA_B6B053,x)			;$B6B050

DATA_B6B053:
	dw CODE_B6B061
	dw CODE_B6B129
	dw CODE_B6B13A
	dw CODE_B6B14C
	dw CODE_B6B15D
	dw CODE_B6B1C1
	dw CODE_B6B1EF

CODE_B6B061:
	JSL.l check_if_picked_up_by_kong	;$B6B061
	BCC.b CODE_B6B071			;$B6B065
	JMP.w CODE_B6B110			;$B6B067

CODE_B6B06A:
	JSL.l process_current_movement		;$B6B06A
	JMP.w CODE_B6B201			;$B6B06E

CODE_B6B071:
	LDX.b current_sprite			;$B6B071
	JSR.w CODE_B6F381			;$B6B073
	BCC.b CODE_B6B06A			;$B6B076
	LDY.b $64,x				;$B6B078
	STY.b alternate_sprite			;$B6B07A
	LDA.b $12,x				;$B6B07C
	STA.w $0012,y				;$B6B07E
	LDA.b $16,x				;$B6B081
	STA.w $0016,y				;$B6B083
	LDA.w #$0268				;$B6B086
	JSL.l set_alt_sprite_animation		;$B6B089
	LDA.b $67,x				;$B6B08D
	AND.w #$00FF				;$B6B08F
	BEQ.b CODE_B6B0B0			;$B6B092
	LDY.w active_kong_sprite		;$B6B094
	LDA.b $12,x				;$B6B097
	SEC					;$B6B099
	SBC.w $0012,y				;$B6B09A
	LDY.b $64,x				;$B6B09D
	EOR.w $001E,y				;$B6B09F
	ASL					;$B6B0A2
	BMI.b CODE_B6B0B0			;$B6B0A3
	LDA.w $001E,y				;$B6B0A5
	EOR.w #$4000				;$B6B0A8
	STA.w $001E,y				;$B6B0AB
	BRA.b CODE_B6B0C2			;$B6B0AE

CODE_B6B0B0:
	LDY.b $64,x				;$B6B0B0
	LDA.b $68,x				;$B6B0B2
	EOR.w $001E,y				;$B6B0B4
	ASL					;$B6B0B7
	BPL.b CODE_B6B0C2			;$B6B0B8
	LDA.b $68,x				;$B6B0BA
	EOR.w #$FFFF				;$B6B0BC
	INC					;$B6B0BF
	STA.b $68,x				;$B6B0C0
CODE_B6B0C2:
	LDA.b $66,x				;$B6B0C2
	AND.w #$00FF				;$B6B0C4
	BEQ.b CODE_B6B0F7			;$B6B0C7
	LDY.w #$0134				;$B6B0C9
	JSR.w CODE_B6B211			;$B6B0CC
	LDA.b $6C,x				;$B6B0CF
	EOR.w #$FFFF				;$B6B0D1
	INC					;$B6B0D4
	STA.w $005E,y				;$B6B0D5
	JSR.w CODE_B6B21A			;$B6B0D8
	LDY.w #$0136				;$B6B0DB
	JSR.w CODE_B6B211			;$B6B0DE
	TYX					;$B6B0E1
	STZ.b $5E,x				;$B6B0E2
	JSR.w CODE_B6B21A			;$B6B0E4
	LDY.w #$0138				;$B6B0E7
	JSR.w CODE_B6B211			;$B6B0EA
	LDA.b $6C,x				;$B6B0ED
	STA.w $005E,y				;$B6B0EF
	JSR.w CODE_B6B21A			;$B6B0F2
	BRA.b CODE_B6B10D			;$B6B0F5

CODE_B6B0F7:
	LDY.w #$0136				;$B6B0F7
	JSR.w CODE_B6B211			;$B6B0FA
	LDA.b $6C,x				;$B6B0FD
	ASL					;$B6B0FF
	JSL.l CODE_B58006			;$B6B100
	SEC					;$B6B104
	SBC.b $6C,x				;$B6B105
	STA.w $005E,y				;$B6B107
	TYX					;$B6B10A
	STZ.b $60,x				;$B6B10B
CODE_B6B10D:
	JMP.w CODE_B6B201			;$B6B10D

CODE_B6B110:
	LDX.b current_sprite			;$B6B110
	LDA.w #$006F				;$B6B112
	JSL.l CODE_BB85A0			;$B6B115
	LDX.b current_sprite			;$B6B119
	LDA.b $64,x				;$B6B11B
	STA.b alternate_sprite			;$B6B11D
	LDA.w #$0267				;$B6B11F
	JSL.l set_alt_sprite_animation		;$B6B122
	JMP.w CODE_B6B201			;$B6B126

CODE_B6B129:
	JSL.l update_held_sprite_position	;$B6B129
	JSL.l process_sprite_animation		;$B6B12D
	JSL.l CODE_BEC039			;$B6B131
	BCS.b CODE_B6B195			;$B6B135
	JML [$04F5]				;$B6B137

CODE_B6B13A:
	TYX					;$B6B13A
	JSL.l update_held_sprite_position	;$B6B13B
	JSL.l process_sprite_animation		;$B6B13F
	JSL.l CODE_BEC039			;$B6B143
	BCS.b CODE_B6B195			;$B6B147
	JML [$04F5]				;$B6B149

CODE_B6B14C:
	JSL.l update_held_sprite_position	;$B6B14C
	JSL.l process_sprite_animation		;$B6B150
	JSL.l CODE_BEC039			;$B6B154
	BCS.b CODE_B6B195			;$B6B158
	JML [$04F5]				;$B6B15A

CODE_B6B15D:
	JSL.l CODE_BEC03C			;$B6B15D
	BCS.b CODE_B6B195			;$B6B161
	LDX.b current_sprite			;$B6B163
	LDA.b $28,x				;$B6B165
	BIT.w #$0002				;$B6B167
	BNE.b CODE_B6B195			;$B6B16A
	LDA.b $2E,x				;$B6B16C
	PHA					;$B6B16E
	JSL.l process_current_movement		;$B6B16F
	PLY					;$B6B173
	LDA.b $28,x				;$B6B174
	AND.w #$0101				;$B6B176
	CMP.w #$0001				;$B6B179
	BNE.b CODE_B6B18E			;$B6B17C
	TYA					;$B6B17E
	LSR					;$B6B17F
	STA.b $1A				;$B6B180
	LSR					;$B6B182
	LSR					;$B6B183
	LSR					;$B6B184
	CLC					;$B6B185
	ADC.b $1A				;$B6B186
	EOR.w #$FFFF				;$B6B188
	INC					;$B6B18B
	STA.b $2E,x				;$B6B18C
CODE_B6B18E:
	JSL.l process_sprite_animation		;$B6B18E
	JMP.w CODE_B6B201			;$B6B192

CODE_B6B195:
	LDX.b current_sprite			;$B6B195
	CPX.w current_held_sprite		;$B6B197
	BNE.b CODE_B6B19F			;$B6B19A
	STZ.w current_held_sprite		;$B6B19C
CODE_B6B19F:
	LDY.b $64,x				;$B6B19F
	JSR.w CODE_B6F3EB			;$B6B1A1
	LDA.w #$062E				;$B6B1A4
	JSL.l queue_sound_effect		;$B6B1A7
	LDA.w #$060C				;$B6B1AB
	JSL.l queue_sound_effect		;$B6B1AE
	JSL.l CODE_BEC030			;$B6B1B2
	JSL.l CODE_BB85AC			;$B6B1B6
	JSL.l delete_sprite_handle_deallocation	;$B6B1BA
	JML [$04F5]				;$B6B1BE

CODE_B6B1C1:
	TYX					;$B6B1C1
	JSR.w CODE_B6F371			;$B6B1C2
	LDY.w #$0132				;$B6B1C5
	JSL.l CODE_BB8585			;$B6B1C8
	LDY.b alternate_sprite			;$B6B1CC
	LDX.b current_sprite			;$B6B1CE
	STY.b $64,x				;$B6B1D0
	STX.b $5C,y				;$B6B1D2
	LDA.b $08,x				;$B6B1D4
	STA.w $005E,y				;$B6B1D6
	STZ.b $38,x				;$B6B1D9
	LDA.b $1E,x				;$B6B1DB
	AND.w #$4000				;$B6B1DD
	PHA					;$B6B1E0
	ORA.w $001E,y				;$B6B1E1
	STA.w $001E,y				;$B6B1E4
	PLA					;$B6B1E7
	EOR.b $1E,x				;$B6B1E8
	STA.b $1E,x				;$B6B1EA
	JMP.w CODE_B6B201			;$B6B1EC

CODE_B6B1EF:
	TYX					;$B6B1EF
	JSR.w CODE_B6F371			;$B6B1F0
	LDA.w #$0028				;$B6B1F3
	STA.b $62,x				;$B6B1F6
	STZ.b $38,x				;$B6B1F8
	LDA.w #$006D				;$B6B1FA
	JSL.l CODE_BB85A0			;$B6B1FD
CODE_B6B201:
	JSL.l CODE_BBAB52			;$B6B201
	BCC.b CODE_B6B20E			;$B6B205
	LDX.b current_sprite			;$B6B207
	LDY.b $64,x				;$B6B209
	JSR.w CODE_B6F3EB			;$B6B20B
CODE_B6B20E:
	JML [$04F5]				;$B6B20E

CODE_B6B211:
	JSL.l CODE_BB85B8			;$B6B211
	LDX.b current_sprite			;$B6B215
	LDY.b alternate_sprite			;$B6B217
	RTS					;$B6B219

CODE_B6B21A:
	LDA.w #$0004				;$B6B21A
	JSL.l CODE_B58006			;$B6B21D
	STA.w $0060,y				;$B6B221
	RTS					;$B6B224

kuchuka_hand_main:
	LDA.w #!sprite_Kuchuka			;$B6B225
	JSR.w CODE_B6B22E			;$B6B228
	JMP.w CODE_B685E6			;$B6B22B

CODE_B6B22E:
	LDX.b $5C,y				;$B6B22E
	CMP.b sprite.type,x 			;$B6B230
	BEQ.b CODE_B6B238			;$B6B232
CODE_B6B234:
	PLA					;$B6B234
	JMP.w CODE_B6F27D			;$B6B235

CODE_B6B238:
	LDA.w $005E,y				;$B6B238
	CMP.b $08,x				;$B6B23B
	BNE.b CODE_B6B234			;$B6B23D
	RTS					;$B6B23F

kuchuka_bomb_main:
	JMP.w (DATA_B6B243,x)			;$B6B240

DATA_B6B243:
	dw CODE_B6B24D
	dw CODE_B6B294
	dw CODE_B6B34E
	dw !null_pointer
	dw CODE_B6B35E

CODE_B6B24D:
	LDX.b $5C,y				;$B6B24D
	LDY.b $64,x				;$B6B24F
	LDA.w $0026,y				;$B6B251
	CMP.w #$C000				;$B6B254
	BNE.b CODE_B6B291			;$B6B257
	LDX.b current_sprite			;$B6B259
	LDA.w #$0004				;$B6B25B
	STA.b $38,x				;$B6B25E
	LDA.w #$0044				;$B6B260
	STA.b $5A,x				;$B6B263
	LDA.b $5E,x				;$B6B265
	BMI.b CODE_B6B275			;$B6B267
	BEQ.b CODE_B6B270			;$B6B269
	LDA.w #$0080				;$B6B26B
	BRA.b CODE_B6B278			;$B6B26E

CODE_B6B270:
	LDA.w #$0000				;$B6B270
	BRA.b CODE_B6B278			;$B6B273

CODE_B6B275:
	LDA.w #$FF80				;$B6B275
CODE_B6B278:
	STA.b $2A,x				;$B6B278
	STZ.b $30,x				;$B6B27A
	STZ.b $2E,x				;$B6B27C
	LDA.w #$000A				;$B6B27E
	JSL.l CODE_B58006			;$B6B281
	ADC.w #$0050				;$B6B285
	STA.b $6C,x				;$B6B288
	LDA.w #$026A				;$B6B28A
	JSL.l set_sprite_animation		;$B6B28D
CODE_B6B291:
	JMP.w CODE_B685E6			;$B6B291

CODE_B6B294:
	TYX					;$B6B294
	INC.b $38,x				;$B6B295
	LDA.b $58,x				;$B6B297
	JSL.l CODE_B58021			;$B6B299
	CLC					;$B6B29D
	ADC.b $12,x				;$B6B29E
	STA.b $12,x				;$B6B2A0
	STA.b $62,x				;$B6B2A2
	LDA.b $59,x				;$B6B2A4
	JSL.l CODE_B58021			;$B6B2A6
	CLC					;$B6B2AA
	ADC.b $16,x				;$B6B2AB
	STA.b $16,x				;$B6B2AD
	STA.b $64,x				;$B6B2AF
	LDY.b $5C,x				;$B6B2B1
	LDA.w $0067,y				;$B6B2B3
	AND.w #$00FF				;$B6B2B6
	BEQ.b CODE_B6B2CF			;$B6B2B9
	LDA.b $5E,x				;$B6B2BB
	LDY.w active_kong_sprite		;$B6B2BD
	CLC					;$B6B2C0
	ADC.w $0012,y				;$B6B2C1
	STA.b $62,x				;$B6B2C4
	LDA.w $0016,y				;$B6B2C6
	STA.b $64,x				;$B6B2C9
	LDY.b $5C,x				;$B6B2CB
	BRA.b CODE_B6B2E1			;$B6B2CD

CODE_B6B2CF:
	LDA.b $62,x				;$B6B2CF
	CLC					;$B6B2D1
	ADC.w $0068,y				;$B6B2D2
	ADC.b $5E,x				;$B6B2D5
	STA.b $62,x				;$B6B2D7
	LDA.b $64,x				;$B6B2D9
	CLC					;$B6B2DB
	ADC.w $006A,y				;$B6B2DC
	STA.b $64,x				;$B6B2DF
CODE_B6B2E1:
	LDA.w $0067,y				;$B6B2E1
	AND.w #$00FF				;$B6B2E4
	BEQ.b CODE_B6B33B			;$B6B2E7
	LDY.w active_kong_sprite		;$B6B2E9
	JSL.l CODE_B5801E			;$B6B2EC
	CMP.b $1A				;$B6B2F0
	BCS.b CODE_B6B2F6			;$B6B2F2
	LDA.b $1A				;$B6B2F4
CODE_B6B2F6:
	LDY.b $5C,x				;$B6B2F6
	CMP.w #$0100				;$B6B2F8
	BCC.b CODE_B6B300			;$B6B2FB
	LDA.w #$00FF				;$B6B2FD
CODE_B6B300:
	XBA					;$B6B300
	LSR					;$B6B301
	STA.w CPU.dividen_low			;$B6B302
	SEP.b #$20				;$B6B305
	LDA.w $0068,y				;$B6B307
	STA.w CPU.divisor			;$B6B30A
	REP.b #$20				;$B6B30D
	JSL.l stall_cpu_time			;$B6B30F
	LDA.w CPU.divide_result			;$B6B313
	LSR					;$B6B316
	STA.b $6A,x				;$B6B317
	PHA					;$B6B319
	LDA.w $006A,y				;$B6B31A
	STA.w CPU.dividen_low			;$B6B31D
	PLA					;$B6B320
	SEP.b #$20				;$B6B321
	STA.w CPU.divisor			;$B6B323
	XBA					;$B6B326
	BEQ.b CODE_B6B32E			;$B6B327
	LDA.b #$FF				;$B6B329
	STA.w CPU.divisor			;$B6B32B
CODE_B6B32E:
	REP.b #$20				;$B6B32E
	JSL.l stall_cpu_time			;$B6B330
	LDA.w CPU.divide_result			;$B6B334
	STA.b $66,x				;$B6B337
	BRA.b CODE_B6B34E			;$B6B339

CODE_B6B33B:
	LDA.w $0032,y				;$B6B33B
	AND.w #$00FF				;$B6B33E
	CLC					;$B6B341
	ADC.b $60,x				;$B6B342
	STA.b $6A,x				;$B6B344
	LDA.w $0033,y				;$B6B346
	AND.w #$00FF				;$B6B349
	STA.b $66,x				;$B6B34C
CODE_B6B34E:
	JSR.w CODE_B6B38F			;$B6B34E
	BCS.b CODE_B6B3A4			;$B6B351
	JSL.l process_current_movement		;$B6B353
	LDA.b $28,x				;$B6B357
	BNE.b CODE_B6B3A4			;$B6B359
	JML [$04F5]				;$B6B35B

CODE_B6B35E:
	TYX					;$B6B35E
	DEC.b $6C,x				;$B6B35F
	BEQ.b CODE_B6B3A4			;$B6B361
	LDA.b $2E,x				;$B6B363
	PHA					;$B6B365
	JSL.l process_current_movement		;$B6B366
	PLY					;$B6B36A
	LDA.b $28,x				;$B6B36B
	AND.w #$0101				;$B6B36D
	CMP.w #$0001				;$B6B370
	BNE.b CODE_B6B38C			;$B6B373
	TYA					;$B6B375
	LSR					;$B6B376
	EOR.w #$FFFF				;$B6B377
	INC					;$B6B37A
	CMP.w #$FF80				;$B6B37B
	BCC.b CODE_B6B383			;$B6B37E
	LDA.w #$0000				;$B6B380
CODE_B6B383:
	STA.b $2E,x				;$B6B383
	LDA.w #$074B				;$B6B385
	JSL.l queue_sound_effect		;$B6B388
CODE_B6B38C:
	JML [$04F5]				;$B6B38C

CODE_B6B38F:
	CLC					;$B6B38F
	LDA.w $004C,y				;$B6B390
	BEQ.b CODE_B6B3A3			;$B6B393
	JSL.l populate_sprite_clipping		;$B6B395
	LDA.w #$0000				;$B6B399
	INC.w $1860				;$B6B39C
	JSL.l CODE_BEC009			;$B6B39F
CODE_B6B3A3:
	RTS					;$B6B3A3

CODE_B6B3A4:
	LDY.w #$0144				;$B6B3A4
	JSL.l CODE_BB8585			;$B6B3A7
	LDX.b alternate_sprite			;$B6B3AB
	JSL.l CODE_B6B3D6			;$B6B3AD
	LDA.w #$0028				;$B6B3B1
	JSL.l CODE_B58006			;$B6B3B4
	ASL					;$B6B3B8
	SEC					;$B6B3B9
	SBC.w #$0100				;$B6B3BA
	EOR.w #$FFFF				;$B6B3BD
	INC					;$B6B3C0
	STA.b $44,x				;$B6B3C1
	JMP.w CODE_B6F27D			;$B6B3C3

CODE_B6B3C6:
	PHX					;$B6B3C6
	LDA.w #$0011				;$B6B3C7
	JSL.l CODE_BB85A0			;$B6B3CA
	LDA.w #$026B				;$B6B3CE
	JSL.l set_sprite_animation		;$B6B3D1
	PLX					;$B6B3D5
CODE_B6B3D6:
	LDA.w #$0003				;$B6B3D6
	STA.b $5A,x				;$B6B3D9
	LDA.w #$FF80				;$B6B3DB
	STA.b $2E,x				;$B6B3DE
	LDA.w #$0002				;$B6B3E0
	JSL.l CODE_B58006			;$B6B3E3
	LSR					;$B6B3E7
	ROR					;$B6B3E8
	ROR					;$B6B3E9
	STA.b $1A				;$B6B3EA
	LDA.b $1E,x				;$B6B3EC
	AND.w #$BFFF				;$B6B3EE
	ORA.b $1A				;$B6B3F1
	STA.b $1E,x				;$B6B3F3
	LDA.w #$064F				;$B6B3F5
	JSL.l queue_sound_effect		;$B6B3F8
	LDA.w #$0750				;$B6B3FC
	JSL.l queue_sound_effect		;$B6B3FF
	RTL					;$B6B403

tnt_explosion_main:
	JSL.l CODE_BBAB46			;$B6B404
	BCC.b CODE_B6B40D			;$B6B408
	JML [$04F5]				;$B6B40A

CODE_B6B40D:
	JSR.w CODE_B6B38F			;$B6B40D
	JSL.l process_current_movement		;$B6B410
	JMP.w CODE_B685E6			;$B6B414

flying_knik_knak_main:
	JSL.l CODE_BEC036			;$B6B417
	BCC.b CODE_B6B42C			;$B6B41B
	LDX.b current_sprite			;$B6B41D
	CPX.w current_held_sprite		;$B6B41F
	BNE.b CODE_B6B427			;$B6B422
	STZ.w current_held_sprite		;$B6B424
CODE_B6B427:
	PHA					;$B6B427
	TYX					;$B6B428
	JMP.w CODE_B6B6E5			;$B6B429

CODE_B6B42C:
	JMP.w (DATA_B6B42F,x)			;$B6B42C

DATA_B6B42F:
	dw CODE_B6B453
	dw CODE_B6B45D
	dw CODE_B6B46D
	dw CODE_B6B483
	dw CODE_B6B493
	dw CODE_B6B4D5
	dw CODE_B6B4EA
	dw CODE_B6B514
	dw CODE_B6B557
	dw CODE_B6B55A
	dw CODE_B6B56B
	dw CODE_B6B5A3
	dw CODE_B6B5CD
	dw CODE_B6B5DE
	dw CODE_B6B622
	dw CODE_B6B66B
	dw CODE_B6B674
	dw CODE_B6B67D

CODE_B6B453:
	JSR.w CODE_B6B6CB			;$B6B453
	JSL.l process_current_movement		;$B6B456
	JMP.w return_handle_anim_and_despawn	;$B6B45A

CODE_B6B45D:
	JSL.l update_held_sprite_position	;$B6B45D
	JSL.l process_sprite_animation		;$B6B461
	JSR.w CODE_B6B6A4			;$B6B465
	BCS.b CODE_B6B4BB			;$B6B468
	JML [$04F5]				;$B6B46A

CODE_B6B46D:
	TYX					;$B6B46D
	LDA.w #$003C				;$B6B46E
	STA.b $64,x				;$B6B471
	JSL.l update_held_sprite_position	;$B6B473
	JSL.l process_sprite_animation		;$B6B477
	JSR.w CODE_B6B6A4			;$B6B47B
	BCS.b CODE_B6B4BB			;$B6B47E
	JML [$04F5]				;$B6B480

CODE_B6B483:
	JSL.l update_held_sprite_position	;$B6B483
	JSL.l process_sprite_animation		;$B6B487
	JSR.w CODE_B6B6A4			;$B6B48B
	BCS.b CODE_B6B4BB			;$B6B48E
	JML [$04F5]				;$B6B490

CODE_B6B493:
	JSR.w CODE_B6B6B3			;$B6B493
	BCS.b CODE_B6B4BB			;$B6B496
	LDA.b $28,x				;$B6B498
	BIT.w #$0002				;$B6B49A
	BNE.b CODE_B6B4BB			;$B6B49D
	BIT.w #$0001				;$B6B49F
	BEQ.b CODE_B6B4B4			;$B6B4A2
	JSL.l CODE_B5802A			;$B6B4A4
	LDA.w #$0046				;$B6B4A8
	STA.b $64,x				;$B6B4AB
	LDA.w #$0006				;$B6B4AD
	STA.b $38,x				;$B6B4B0
	STZ.b $30,x				;$B6B4B2
CODE_B6B4B4:
	JSL.l process_current_movement		;$B6B4B4
	JMP.w return_handle_anim_and_despawn	;$B6B4B8

CODE_B6B4BB:
	PHA					;$B6B4BB
	LDX.b current_sprite			;$B6B4BC
	CPX.w current_held_sprite		;$B6B4BE
	BNE.b CODE_B6B4C6			;$B6B4C1
	STZ.w current_held_sprite		;$B6B4C3
CODE_B6B4C6:
	JSL.l CODE_BB85AC			;$B6B4C6
	LDX.b current_sprite			;$B6B4CA
	LDY.w #$0008				;$B6B4CC
	LDA.w #$0230				;$B6B4CF
	JMP.w CODE_B6878B			;$B6B4D2

CODE_B6B4D5:
	LDX.b current_sprite			;$B6B4D5
	LDA.b $38,x				;$B6B4D7
	XBA					;$B6B4D9
	STA.b $38,x				;$B6B4DA
	JSR.w invert_max_x_speed_if_needed	;$B6B4DC
	LDA.b $30,x				;$B6B4DF
	STA.b $62,x				;$B6B4E1
	LDA.b $5A,x				;$B6B4E3
	STA.b $6A,x				;$B6B4E5
	JMP.w return_handle_anim_and_despawn	;$B6B4E7

CODE_B6B4EA:
	JSL.l check_if_picked_up_by_kong	;$B6B4EA
	BCC.b CODE_B6B4F3			;$B6B4EE
	JML [$04F5]				;$B6B4F0

CODE_B6B4F3:
	JSR.w CODE_B6B6C2			;$B6B4F3
	DEC.b $64,x				;$B6B4F6
	BNE.b CODE_B6B508			;$B6B4F8
	INC.b $38,x				;$B6B4FA
	LDA.w #$003C				;$B6B4FC
	STA.b $64,x				;$B6B4FF
	LDA.w #$0231				;$B6B501
	JSL.l set_sprite_animation		;$B6B504
CODE_B6B508:
	LDX.b current_sprite			;$B6B508
	LDA.w #$0044				;$B6B50A
	JSL.l process_alternate_movement	;$B6B50D
	JMP.w return_handle_anim_and_despawn	;$B6B511

CODE_B6B514:
	JSL.l check_if_picked_up_by_kong	;$B6B514
	BCC.b CODE_B6B51D			;$B6B518
	JML [$04F5]				;$B6B51A

CODE_B6B51D:
	JSR.w CODE_B6B6C2			;$B6B51D
	DEC.b $64,x				;$B6B520
	BNE.b CODE_B6B554			;$B6B522
	JSL.l CODE_B5802D			;$B6B524
	STZ.b $38,x				;$B6B528
	LDA.b $6A,x				;$B6B52A
	AND.w #$00FF				;$B6B52C
	STA.b $5A,x				;$B6B52F
	LDA.b $62,x				;$B6B531
	EOR.b $1E,x				;$B6B533
	ASL					;$B6B535
	BPL.b CODE_B6B540			;$B6B536
	LDA.b $62,x				;$B6B538
	EOR.w #$FFFF				;$B6B53A
	INC					;$B6B53D
	STA.b $62,x				;$B6B53E
CODE_B6B540:
	LDA.b $62,x				;$B6B540
	CMP.w #$8000				;$B6B542
	ROR					;$B6B545
	CLC					;$B6B546
	ADC.b $62,x				;$B6B547
	STA.b $62,x				;$B6B549
	STA.b $30,x				;$B6B54B
	LDA.w #$0232				;$B6B54D
	JSL.l set_sprite_animation		;$B6B550
CODE_B6B554:
	JMP.w return_handle_anim_and_despawn	;$B6B554

CODE_B6B557:
	JMP.w generic_move_and_animate_state	;$B6B557

CODE_B6B55A:
	LDA.w #$053F				;$B6B55A
	JSL.l CODE_B28024			;$B6B55D
	JSR.w CODE_B6B72C			;$B6B561
	JSL.l process_current_movement		;$B6B564
	JMP.w return_handle_anim_and_despawn	;$B6B568

CODE_B6B56B:
	LDA.w #$053F				;$B6B56B
	JSL.l CODE_B28024			;$B6B56E
	JSR.w CODE_B6B72C			;$B6B572
	DEC.b $5C,x				;$B6B575
	BNE.b CODE_B6B59C			;$B6B577
	LDA.b $5E,x				;$B6B579
	STA.b $5C,x				;$B6B57B
	LDA.b $60,x				;$B6B57D
	SEC					;$B6B57F
	SBC.b $16,x				;$B6B580
	LSR					;$B6B582
	STA.b $62,x				;$B6B583
	LDA.b $5E,x				;$B6B585
	XBA					;$B6B587
	ORA.b $5E,x				;$B6B588
	STA.w CPU.multiply_A			;$B6B58A
	LDA.w CPU.multiply_result		;$B6B58D
	LDA.w CPU.multiply_result		;$B6B590
	LSR					;$B6B593
	STA.b $66,x				;$B6B594
	STZ.b $64,x				;$B6B596
	STZ.b $68,x				;$B6B598
	INC.b $38,x				;$B6B59A
CODE_B6B59C:
	JSL.l process_current_movement		;$B6B59C
	JMP.w return_handle_anim_and_despawn	;$B6B5A0

CODE_B6B5A3:
	LDA.w #$053F				;$B6B5A3
	JSL.l CODE_B28024			;$B6B5A6
	JSR.w CODE_B6B72C			;$B6B5AA
	LDY.w #$0001				;$B6B5AD
	JSR.w CODE_B6AFB9			;$B6B5B0
	BCC.b CODE_B6B5C6			;$B6B5B3
	STZ.b $38,x				;$B6B5B5
	LDA.w #$004C				;$B6B5B7
	STA.b $5A,x				;$B6B5BA
	LDA.w #$0238				;$B6B5BC
	JSL.l set_sprite_animation		;$B6B5BF
	JMP.w CODE_B6B4D5			;$B6B5C3

CODE_B6B5C6:
	JSL.l process_current_movement		;$B6B5C6
	JMP.w return_handle_anim_and_despawn	;$B6B5CA

CODE_B6B5CD:
	LDA.w #$053F				;$B6B5CD
	JSL.l CODE_B28024			;$B6B5D0
	JSR.w CODE_B6B72C			;$B6B5D4
	JSL.l process_current_movement		;$B6B5D7
	JMP.w return_handle_anim_and_despawn	;$B6B5DB

CODE_B6B5DE:
	JSR.w CODE_B6B6CB			;$B6B5DE
	DEC.b $5C,x				;$B6B5E1
	BNE.b CODE_B6B61B			;$B6B5E3
	LDA.b $5E,x				;$B6B5E5
	STA.b $5C,x				;$B6B5E7
	LDA.b $16,x				;$B6B5E9
	SEC					;$B6B5EB
	SBC.b $60,x				;$B6B5EC
	LSR					;$B6B5EE
	STA.b $62,x				;$B6B5EF
	LDA.b $5E,x				;$B6B5F1
	XBA					;$B6B5F3
	ORA.b $5E,x				;$B6B5F4
	STA.w CPU.multiply_A			;$B6B5F6
	LDA.w CPU.multiply_result		;$B6B5F9
	LDA.w CPU.multiply_result		;$B6B5FC
	LSR					;$B6B5FF
	STA.b $66,x				;$B6B600
	STZ.b $64,x				;$B6B602
	STZ.b $68,x				;$B6B604
	LDA.w #$004D				;$B6B606
	STA.b $5A,x				;$B6B609
	STZ.b $2E,x				;$B6B60B
	STZ.b $28,x				;$B6B60D
	LDA.b $38,x				;$B6B60F
	XBA					;$B6B611
	STA.b $38,x				;$B6B612
	LDA.w #$022E				;$B6B614
	JSL.l set_sprite_animation		;$B6B617
CODE_B6B61B:
	JSL.l process_current_movement		;$B6B61B
	JMP.w return_handle_anim_and_despawn	;$B6B61F

CODE_B6B622:
	LDA.w #$053F				;$B6B622
	JSL.l CODE_B28024			;$B6B625
	JSR.w CODE_B6B72C			;$B6B629
	LDY.w #$FFFF				;$B6B62C
	JSR.w CODE_B6AFB9			;$B6B62F
	BCC.b CODE_B6B660			;$B6B632
	LDA.w #$000C				;$B6B634
	STA.b $38,x				;$B6B637
	LDA.w #$0007				;$B6B639
	STA.b $5A,x				;$B6B63C
	LDA.w #$0202				;$B6B63E
	STA.b $60,x				;$B6B641
	DEC					;$B6B643
	STA.b $64,x				;$B6B644
	LDA.w #$0040				;$B6B646
	STA.b $30,x				;$B6B649
	LDA.w #$0060				;$B6B64B
	STA.b $34,x				;$B6B64E
	LDA.l DATA_FF1BC0+$04			;$B6B650
	STA.b $06,x				;$B6B654
	LDA.w #$0239				;$B6B656
	JSL.l set_sprite_animation		;$B6B659
	JMP.w return_handle_despawn		;$B6B65D

CODE_B6B660:
	STZ.b $2E,x				;$B6B660
	STZ.b $28,x				;$B6B662
	JSL.l process_current_movement		;$B6B664
	JMP.w return_handle_anim_and_despawn	;$B6B668

CODE_B6B66B:
	LDA.w #$0E0D				;$B6B66B
	STA.w $0038,y				;$B6B66E
	JMP.w CODE_B6B5DE			;$B6B671

CODE_B6B674:
	LDA.w #$110D				;$B6B674
	STA.w $0038,y				;$B6B677
	JMP.w CODE_B6B5DE			;$B6B67A

CODE_B6B67D:
	JSR.w CODE_B6B72C			;$B6B67D
	LDY.w #$FFFF				;$B6B680
	JSR.w CODE_B6AFB9			;$B6B683
	BCC.b CODE_B6B699			;$B6B686
	LDA.w #$0009				;$B6B688
	STA.b $38,x				;$B6B68B
	LDA.w #$004D				;$B6B68D
	STA.b $5A,x				;$B6B690
	LDA.b $30,x				;$B6B692
	STA.b $62,x				;$B6B694
	JMP.w return_handle_despawn		;$B6B696

CODE_B6B699:
	STZ.b $2E,x				;$B6B699
	STZ.b $28,x				;$B6B69B
	JSL.l process_current_movement		;$B6B69D
	JMP.w return_handle_anim_and_despawn	;$B6B6A1

CODE_B6B6A4:
	JSL.l populate_sprite_clipping		;$B6B6A4
	LDA.w #$0040				;$B6B6A8
	LDY.w #$0008				;$B6B6AB
	JSL.l check_sprite_collision		;$B6B6AE
	RTS					;$B6B6B2

CODE_B6B6B3:
	JSL.l populate_sprite_clipping		;$B6B6B3
	LDA.w #$0040				;$B6B6B7
	LDY.w #$0010				;$B6B6BA
	JSL.l check_sprite_collision		;$B6B6BD
	RTS					;$B6B6C1

CODE_B6B6C2:
	JSL.l populate_sprite_clipping		;$B6B6C2
	LDA.w #$08AB				;$B6B6C6
	BRA.b CODE_B6B6D5			;$B6B6C9

CODE_B6B6CB:
	JSL.l populate_sprite_clipping		;$B6B6CB
	INC.w $1862				;$B6B6CF
	LDA.w #$08A8				;$B6B6D2
CODE_B6B6D5:
	JSL.l CODE_BEC009			;$B6B6D5
	BCC.b CODE_B6B722			;$B6B6D9
	BEQ.b CODE_B6B722			;$B6B6DB
	LDA.w $17C6				;$B6B6DD
	CMP.w #$0011				;$B6B6E0
	BEQ.b CODE_B6B6F4			;$B6B6E3
CODE_B6B6E5:
	LDA.w #$063B				;$B6B6E5
CODE_B6B6E8:
	JSL.l queue_sound_effect		;$B6B6E8
	JMP.w CODE_B6B4C6			;$B6B6EC

CODE_B6B6EF:
	LDA.w #$063C				;$B6B6EF
	BRA.b CODE_B6B6E8			;$B6B6F2

CODE_B6B6F4:
	LDA.b $38,x				;$B6B6F4
	CMP.w #$0006				;$B6B6F6
	BEQ.b CODE_B6B6E5			;$B6B6F9
	CMP.w #$0007				;$B6B6FB
	BEQ.b CODE_B6B6E5			;$B6B6FE
	JSL.l CODE_B5802A			;$B6B700
	LDA.w #$0064				;$B6B704
	STA.b $64,x				;$B6B707
	STZ.b $30,x				;$B6B709
	LDA.w #$0006				;$B6B70B
	STA.b $38,x				;$B6B70E
	LDA.w #$022F				;$B6B710
	JSL.l set_sprite_animation		;$B6B713
	LDA.w #$063A				;$B6B717
	JSL.l queue_sound_effect		;$B6B71A
	PLY					;$B6B71E
	JML [$04F5]				;$B6B71F

CODE_B6B722:
	LDA.w #$0038				;$B6B722
	JSL.l check_throwable_collision		;$B6B725
	BCS.b CODE_B6B6EF			;$B6B729
	RTS					;$B6B72B

CODE_B6B72C:
	LDA.w #$0038				;$B6B72C
	JSL.l check_throwable_collision		;$B6B72F
	BCS.b CODE_B6B6E5			;$B6B733
	JSL.l populate_sprite_clipping		;$B6B735
	LDA.w #$0888				;$B6B739
	JSL.l CODE_BEC009			;$B6B73C
	BCC.b CODE_B6B744			;$B6B740
	BNE.b CODE_B6B6E5			;$B6B742
CODE_B6B744:
	RTS					;$B6B744


;Bazza Spawner variables:
;	$60,x   Bazza Spawn interval
;	$62,x	Countdown timer for the above
;	$64,x	Current X velocity to apply to Bazza
;	$66,x   X home position to apply to Bazza

bazza_spawner_main:
	JMP (.state_table,x)			;$B6B745

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B6B74C  \ Get spawner sprite
	JSR CODE_B6F371				;$B6B74D   | Unclear purpose
	INC sprite.state,x			;$B6B750  / Set state 1
.idle:
	TYX					;$B6B752  \ Get spawner sprite
	JSR CODE_B6F381				;$B6B753   | Count down timer until next Bazza spawn
	BCC ..return				;$B6B756   | If not done yet return
	LDY #$013A				;$B6B758   |
	JSL CODE_BB8585				;$B6B75B   | Else spawn Bazza
	BCS ..return				;$B6B75F   | If failed to spawn, return
	LDY alternate_sprite			;$B6B761   | Else get Bazza sprite
	LDA #$0041				;$B6B763   |
	JSL CODE_BFF006				;$B6B766   | Play sound effect
	LDX current_sprite			;$B6B76A   | Get spawner sprite
	LDA sprite.general_purpose_66,x		;$B6B76C   | Get X velocity to apply to Bazza
	STA.w sprite.x_speed,y			;$B6B76E   | Set his current X velocity
	EOR.w sprite.oam_property,y		;$B6B771   |
	ASL					;$B6B774   |
	BMI ..no_flip				;$B6B775   | Skip if don't need to flip
	LDA.w sprite.oam_property,y		;$B6B777   | Else get his OAM properties
	EOR #$4000				;$B6B77A   |
	STA.w sprite.oam_property,y		;$B6B77D  / Flip his facing direction
..no_flip:
	LDA sprite.general_purpose_64,x	;$B6B780  \
	STA.w sprite.general_purpose_5C,y	;$B6B782  / Set Bazza's home X position
..return:
	JMP return_handle_despawn		;$B6B785  |> Return and handle despawn


bazza_main:
	JMP.w (DATA_B6B78B,x)			;$B6B788

DATA_B6B78B:
	dw CODE_B6B78F
	dw CODE_B6B7CD

CODE_B6B78F:
	JSL.l populate_sprite_clipping		;$B6B78F
	LDA.w #$0000				;$B6B793
	LDX.w #$0000				;$B6B796
	LDY.w #$00A0				;$B6B799
	JSL.l CODE_BEC024			;$B6B79C
	BCC.b CODE_B6B7B6			;$B6B7A0
	CMP.w #$0002				;$B6B7A2
	BNE.b CODE_B6B7B6			;$B6B7A5
	LDA.w #$0651				;$B6B7A7
	JSL.l queue_sound_effect		;$B6B7AA
	INC.b $38,x				;$B6B7AE
	LDA.w #$026D				;$B6B7B0
	JMP.w CODE_B6878E			;$B6B7B3

CODE_B6B7B6:
	JSL.l process_current_movement		;$B6B7B6
	LDA.b $12,x				;$B6B7BA
	SEC					;$B6B7BC
	SBC.b $5C,x				;$B6B7BD
	EOR.b $2A,x				;$B6B7BF
	BMI.b CODE_B6B7CA			;$B6B7C1
	JSL.l delete_sprite_handle_deallocation	;$B6B7C3
	JML [$04F5]				;$B6B7C7

CODE_B6B7CA:
	JMP.w CODE_B685E6			;$B6B7CA

CODE_B6B7CD:
	JMP.w generic_move_and_animate_state	;$B6B7CD


bounty_bass_main:
booty_bird_main:
	JMP.w (DATA_B6B7D3,x)			;$B6B7D0

DATA_B6B7D3:
	dw CODE_B6B7E3
	dw CODE_B6B7FD
	dw CODE_B6B989
	dw CODE_B6B9AE
	dw CODE_B6B9B5
	dw CODE_B6B9CB
	dw CODE_B6B7FD
	dw CODE_B6B989

CODE_B6B7E3:
	TYX					;$B6B7E3
	LDA.b $38,x				;$B6B7E4
	XBA					;$B6B7E6
	STA.b $38,x				;$B6B7E7
	JSR.w invert_max_x_speed_if_needed	;$B6B7E9
	JSR.w CODE_B6F284			;$B6B7EC
	LDA.b $30,x				;$B6B7EF
	STA.b $62,x				;$B6B7F1
	JML [$04F5]				;$B6B7F3

CODE_B6B7F6:
	JSL.l process_current_movement		;$B6B7F6
	JMP.w return_handle_anim_and_despawn	;$B6B7FA

CODE_B6B7FD:
	JSL.l populate_sprite_clipping		;$B6B7FD
	LDA.w #$0000				;$B6B801
	LDX.w #$0000				;$B6B804
	LDY.w #$00A0				;$B6B807
	JSL.l CODE_BEC024			;$B6B80A
	BCC.b CODE_B6B7F6			;$B6B80E
	CMP.w #$0002				;$B6B810
	BNE.b CODE_B6B7F6			;$B6B813
	LDA.w #$0270				;$B6B815
CODE_B6B818:
	PHA					;$B6B818
	STZ.b $3A,x				;$B6B819
	LDA.b $38,x				;$B6B81B
	CMP.w #$0006				;$B6B81D
	BCC.b CODE_B6B82B			;$B6B820
	LDA.b $1E,x				;$B6B822
	EOR.w #$FFFF				;$B6B824
	INC					;$B6B827
	ASL					;$B6B828
	BRA.b CODE_B6B833			;$B6B829

CODE_B6B82B:
	LDY.b $78				;$B6B82B
	LDA.b $12,x				;$B6B82D
	SEC					;$B6B82F
	SBC.w $0012,y				;$B6B830
CODE_B6B833:
	PHP					;$B6B833
	LDA.b $78				;$B6B834
	CMP.w active_kong_sprite		;$B6B836
	BNE.b CODE_B6B85F			;$B6B839
	LDA.w $17C6				;$B6B83B
	CMP.w #$0012				;$B6B83E
	BNE.b CODE_B6B85F			;$B6B841
	LDA.w #$0013				;$B6B843
	JSL.l CODE_B88069			;$B6B846
	BCS.b CODE_B6B85F			;$B6B84A
	LDA.w #$0200				;$B6B84C
	PLP					;$B6B84F
	PHP					;$B6B850
	BMI.b CODE_B6B856			;$B6B851
	LDA.w #$FE00				;$B6B853
CODE_B6B856:
	STA.w $17CA				;$B6B856
	STZ.w $17CC				;$B6B859
	STZ.w $17CE				;$B6B85C
CODE_B6B85F:
	PLP					;$B6B85F
	PHP					;$B6B860
	PHP					;$B6B861
	PHP					;$B6B862
	PLA					;$B6B863
	LSR					;$B6B864
	EOR.b $1E,x				;$B6B865
	LDX.b current_sprite			;$B6B867
	ASL					;$B6B869
	BPL.b CODE_B6B86F			;$B6B86A
	JMP.w CODE_B6B8F0			;$B6B86C

CODE_B6B86F:
	LDA.w #$FF80				;$B6B86F
	PLP					;$B6B872
	BMI.b CODE_B6B878			;$B6B873
	LDA.w #$0080				;$B6B875
CODE_B6B878:
	STA.b $2A,x				;$B6B878
	STZ.b $30,x				;$B6B87A
	STZ.b $2E,x				;$B6B87C
	STZ.b $34,x				;$B6B87E
	LDA.w #$000D				;$B6B880
	STA.b $5A,x				;$B6B883
	LDA.l DATA_FF1BC0+$06			;$B6B885
	STA.b $06,x				;$B6B889
	LDY.w #$006E				;$B6B88B
	JSL.l CODE_BB8585			;$B6B88E
	LDY.b current_sprite			;$B6B892
	LDA.w $006C,y				;$B6B894
	CMP.w #$0004				;$B6B897
	BCS.b CODE_B6B8AE			;$B6B89A
	TAX					;$B6B89C
	LDA.w DATA_B6F424,x			;$B6B89D
	BIT.w $05D7				;$B6B8A0
	BEQ.b CODE_B6B8AB			;$B6B8A3
	LDA.w #$0004				;$B6B8A5
	STA.w $006C,y				;$B6B8A8
CODE_B6B8AB:
	LDA.w $006C,y				;$B6B8AB
CODE_B6B8AE:
	CMP.w #$0011				;$B6B8AE
	BNE.b CODE_B6B8C3			;$B6B8B1
	LDX.b alternate_sprite			;$B6B8B3
	JSL.l CODE_BB85EB			;$B6B8B5
	LDA.w $18F7				;$B6B8B9
	AND.w #$01E0				;$B6B8BC
	ORA.b $1E,x				;$B6B8BF
	STA.b $1E,x				;$B6B8C1
CODE_B6B8C3:
	LDX.b current_sprite			;$B6B8C3
	LDA.b $6C,x				;$B6B8C5
	LDY.b alternate_sprite			;$B6B8C7
	ASL					;$B6B8C9
	CLC					;$B6B8CA
	ADC.b $6C,x				;$B6B8CB
	ASL					;$B6B8CD
	TAX					;$B6B8CE
	LDA.l DATA_FF257C+$04,x			;$B6B8CF
	STA.w $005C,y				;$B6B8D3
	LDA.w #$8080				;$B6B8D6
	STA.w $000C,y				;$B6B8D9
	LDA.l DATA_FF257C+$02,x			;$B6B8DC
	PHA					;$B6B8E0
	LDA.l DATA_FF257C,x			;$B6B8E1
	CMP.w #$0100				;$B6B8E5
	BCC.b CODE_B6B8FC			;$B6B8E8
	JSL.l CODE_BB8609			;$B6B8EA
	BRA.b CODE_B6B90C			;$B6B8EE

CODE_B6B8F0:
	LDA.w #$FD00				;$B6B8F0
	PLP					;$B6B8F3
	BMI.b CODE_B6B8F9			;$B6B8F4
	LDA.w #$0300				;$B6B8F6
CODE_B6B8F9:
	JMP.w CODE_B6B878			;$B6B8F9

CODE_B6B8FC:
	TAY					;$B6B8FC
	JSL.l CODE_BB859A			;$B6B8FD
	LDX.b alternate_sprite			;$B6B901
	EOR.b $1E,x				;$B6B903
	AND.w #$0E00				;$B6B905
	EOR.b $1E,x				;$B6B908
	STA.b $1E,x				;$B6B90A
CODE_B6B90C:
	PLA					;$B6B90C
	JSL.l set_alt_sprite_animation		;$B6B90D
	LDY.b alternate_sprite			;$B6B911
	LDA.w $001E,y				;$B6B913
	AND.w #$BFFF				;$B6B916
	STA.w $001E,y				;$B6B919
	LDA.b $00,x				;$B6B91C
	CMP.w #!sprite_bounty_bass		;$B6B91E
	BEQ.b CODE_B6B92F			;$B6B921
	LDA.w #$0015				;$B6B923
	BIT.b $1E,x				;$B6B926
	BVC.b CODE_B6B939			;$B6B928
	LDA.w #$FFE3				;$B6B92A
	BRA.b CODE_B6B939			;$B6B92D

CODE_B6B92F:
	LDA.w #$000E				;$B6B92F
	BIT.b $1E,x				;$B6B932
	BVC.b CODE_B6B939			;$B6B934
	LDA.w #$FFEC				;$B6B936
CODE_B6B939:
	CLC					;$B6B939
	ADC.w $0012,y				;$B6B93A
	STA.w $0012,y				;$B6B93D
	LDA.w $0016,y				;$B6B940
	CLC					;$B6B943
	ADC.w #$FFFE				;$B6B944
	STA.w $0016,y				;$B6B947
	LDA.b $6B,x				;$B6B94A
	AND.w #$00FF				;$B6B94C
	STA.w $0066,y				;$B6B94F
	LDA.b $6A,x				;$B6B952
	AND.w #$00FF				;$B6B954
	STA.w $006A,y				;$B6B957
	LDA.b $69,x				;$B6B95A
	JSL.l CODE_B58021			;$B6B95C
	BIT.b $1E,x				;$B6B960
	BVC.b CODE_B6B969			;$B6B962
	EOR.w #$FFFF				;$B6B964
	INC					;$B6B967
	CLC					;$B6B968
CODE_B6B969:
	ADC.w $0012,y				;$B6B969
	STA.w $0062,y				;$B6B96C
	LDA.b $68,x				;$B6B96F
	JSL.l CODE_B58021			;$B6B971
	CLC					;$B6B975
	ADC.w $0016,y				;$B6B976
	STA.w $0064,y				;$B6B979
	LDA.w #$0003				;$B6B97C
	STA.b $38,x				;$B6B97F
	PLA					;$B6B981
	JSL.l set_sprite_animation		;$B6B982
	JML [$04F5]				;$B6B986

CODE_B6B989:
	LDA.w #$0038				;$B6B989
	JSL.l check_throwable_collision		;$B6B98C
	BCS.b CODE_B6B9A1			;$B6B990
	JSL.l populate_sprite_clipping		;$B6B992
	LDA.w #$0AA8				;$B6B996
	JSL.l CODE_BEC009			;$B6B999
	BCC.b CODE_B6B9A7			;$B6B99D
	BEQ.b CODE_B6B9A7			;$B6B99F
CODE_B6B9A1:
	LDA.w #$0276				;$B6B9A1
	JMP.w CODE_B6B818			;$B6B9A4

CODE_B6B9A7:
	JSL.l process_current_movement		;$B6B9A7
	JMP.w return_handle_anim_and_despawn	;$B6B9AB

CODE_B6B9AE:
	JSL.l process_current_movement		;$B6B9AE
	JMP.w CODE_B685E6			;$B6B9B2

CODE_B6B9B5:
	TYX					;$B6B9B5
	LDY.w #$0500				;$B6B9B6
	BIT.b $1E,x				;$B6B9B9
	BVC.b CODE_B6B9C0			;$B6B9BB
	LDY.w #$FB00				;$B6B9BD
CODE_B6B9C0:
	STY.b $30,x				;$B6B9C0
	STZ.b $2E,x				;$B6B9C2
	LDA.w #$FC00				;$B6B9C4
	STA.b $34,x				;$B6B9C7
	INC.b $38,x				;$B6B9C9
CODE_B6B9CB:
	LDA.w #$0001				;$B6B9CB
	JSL.l process_alternate_movement	;$B6B9CE
	LDA.b $2A,x				;$B6B9D2
	BPL.b CODE_B6B9DA			;$B6B9D4
	EOR.w #$FFFF				;$B6B9D6
	INC					;$B6B9D9
CODE_B6B9DA:
	CMP.w #$0480				;$B6B9DA
	BCC.b CODE_B6B9E1			;$B6B9DD
	STZ.b $30,x				;$B6B9DF
CODE_B6B9E1:
	LDA.w #$0008				;$B6B9E1
	LDY.b $30,x				;$B6B9E4
	BNE.b CODE_B6B9EB			;$B6B9E6
	LDA.w #$0004				;$B6B9E8
CODE_B6B9EB:
	JSL.l interpolate_x_speed		;$B6B9EB
	LDA.w #$0002				;$B6B9EF
	JSL.l interpolate_y_speed		;$B6B9F2
	JMP.w CODE_B6BF79			;$B6B9F6


unknown_sprite_0438_main:
	JSR CODE_B6BA0E				;$B6B9F9
	JML CODE_BBC815				;$B6B9FC


unknown_sprite_043C_main:
	JSR CODE_B6BA0E				;$B6BA00
	JML CODE_BBC818				;$B6BA03


unknown_sprite_0440_main:
	JSR CODE_B6BA0E				;$B6BA07
	JML CODE_BBC81B				;$B6BA0A


CODE_B6BA0E:
	PHA					;$B6BA0E
	TXA					;$B6BA0F
	BNE.b CODE_B6BA27			;$B6BA10
	PHX					;$B6BA12
	PHY					;$B6BA13
	LDA.w #$0004				;$B6BA14
	JSL.l interpolate_x_speed		;$B6BA17
	LDX.b current_sprite			;$B6BA1B
	LDA.b $2A,x				;$B6BA1D
	BEQ.b CODE_B6BA25			;$B6BA1F
	JSL.l CODE_B9E006			;$B6BA21
CODE_B6BA25:
	PLY					;$B6BA25
	PLX					;$B6BA26
CODE_B6BA27:
	PLA					;$B6BA27
	RTS					;$B6BA28


nid_main:
	JMP.w (DATA_B6BA2C,x)			;$B6BA29

DATA_B6BA2C:
	dw CODE_B6BA36
	dw CODE_B6BA49
	dw CODE_B6BAB7
	dw CODE_B6BAC2
	dw CODE_B6BAE0

CODE_B6BA36:
	TYX					;$B6BA36
	LDA.b $12,x				;$B6BA37
	STA.b $5C,x				;$B6BA39
	STZ.b $68,x				;$B6BA3B
	LDA.b $38,x				;$B6BA3D
	XBA					;$B6BA3F
	STA.b $38,x				;$B6BA40
	JSL.l CODE_B6840E			;$B6BA42
	JML [$04F5]				;$B6BA46

CODE_B6BA49:
	JSR.w CODE_B6BB34			;$B6BA49
	JSR.w CODE_B6BAF1			;$B6BA4C
	JSR.w CODE_B68450			;$B6BA4F
	LDA.w #$0101				;$B6BA52
	STA.b $38,x				;$B6BA55
	LDA.b $68,x				;$B6BA57
	AND.w #$00FF				;$B6BA59
	BEQ.b CODE_B6BA92			;$B6BA5C
CODE_B6BA5E:
	LDA.b $5C,x				;$B6BA5E
	CMP.b $12,x				;$B6BA60
	BNE.b CODE_B6BA69			;$B6BA62
	LDA.b $12,x				;$B6BA64
	CLC					;$B6BA66
	ADC.b $5E,x				;$B6BA67
CODE_B6BA69:
	STA.b $62,x				;$B6BA69
	STZ.b $58,x				;$B6BA6B
	LDA.b $6C,x				;$B6BA6D
	STA.b $6A,x				;$B6BA6F
	LDA.b $16,x				;$B6BA71
	STA.b $64,x				;$B6BA73
	INC.b $38,x				;$B6BA75
	JSL.l CODE_BBAB29			;$B6BA77
	BCC.b CODE_B6BA82			;$B6BA7B
	LDA.w #$002B				;$B6BA7D
	BRA.b CODE_B6BA85			;$B6BA80

CODE_B6BA82:
	LDA.w #$002A				;$B6BA82
CODE_B6BA85:
	JSL.l CODE_BFF006			;$B6BA85
	LDA.w #$027A				;$B6BA89
	JSL.l set_sprite_animation		;$B6BA8C
	BRA.b CODE_B6BAA3			;$B6BA90

CODE_B6BA92:
	LDA.b $5C,x				;$B6BA92
	CMP.b $12,x				;$B6BA94
	BNE.b CODE_B6BA69			;$B6BA96
	LDA.w #$0279				;$B6BA98
	CMP.b $40,x				;$B6BA9B
	BEQ.b CODE_B6BAA3			;$B6BA9D
	JSL.l set_sprite_animation		;$B6BA9F
CODE_B6BAA3:
	JSL.l CODE_BBAB52			;$B6BAA3
	BCS.b CODE_B6BAB4			;$B6BAA7
	LDA.w #CODE_B6BB10			;$B6BAA9
	JSL.l CODE_BB85D6			;$B6BAAC
	JSL.l process_sprite_animation		;$B6BAB0
CODE_B6BAB4:
	JML [$04F5]				;$B6BAB4

CODE_B6BAB7:
	JSR.w CODE_B6BB34			;$B6BAB7
	JSR.w CODE_B6BAF1			;$B6BABA
	JSR.w CODE_B68450			;$B6BABD
	BRA.b CODE_B6BAA3			;$B6BAC0

CODE_B6BAC2:
	JSR.w CODE_B6BB34			;$B6BAC2
	JSR.w CODE_B6BAF1			;$B6BAC5
	JSR.w CODE_B68450			;$B6BAC8
	LDA.b $28,x				;$B6BACB
	BIT.w #$0001				;$B6BACD
	BEQ.b CODE_B6BADD			;$B6BAD0
	LDA.b $62,x				;$B6BAD2
	STA.b $2C,x				;$B6BAD4
	LDA.b $38,x				;$B6BAD6
	XBA					;$B6BAD8
	STA.b $38,x				;$B6BAD9
	STZ.b $5A,x				;$B6BADB
CODE_B6BADD:
	JMP.w CODE_B6BAA3			;$B6BADD

CODE_B6BAE0:
	JSR.w CODE_B6BB34			;$B6BAE0
	JSR.w CODE_B6BAF1			;$B6BAE3
	JSR.w CODE_B68450			;$B6BAE6
	LDA.w #$0401				;$B6BAE9
	STA.b $38,x				;$B6BAEC
	JMP.w CODE_B6BA5E			;$B6BAEE

CODE_B6BAF1:
	LDY.b $60,x				;$B6BAF1
	BEQ.b CODE_B6BB0F			;$B6BAF3
	LDA.b $68,x				;$B6BAF5
	AND.w #$00FF				;$B6BAF7
	BEQ.b CODE_B6BB09			;$B6BAFA
	LDA.w #$C000				;$B6BAFC
	ORA.w $0474				;$B6BAFF
	STA.w $0474				;$B6BB02
	JSR.w CODE_B6930B			;$B6BB05
	RTS					;$B6BB08

CODE_B6BB09:
	STZ.w $04AA				;$B6BB09
	STZ.w $04AE				;$B6BB0C
CODE_B6BB0F:
	RTS					;$B6BB0F

CODE_B6BB10:
	LDX.b current_sprite			;$B6BB10
	LDA.b $68,x				;$B6BB12
	XBA					;$B6BB14
	AND.w #$FF00				;$B6BB15
	STA.b $68,x				;$B6BB18
	LDA.w #$0024				;$B6BB1A
	JSL.l CODE_BEC01B			;$B6BB1D
	BCC.b CODE_B6BB33			;$B6BB21
	LDY.b alternate_sprite			;$B6BB23
	LDA.w $002E,y				;$B6BB25
	BMI.b CODE_B6BB33			;$B6BB28
	LDX.b current_sprite			;$B6BB2A
	LDA.w #$0001				;$B6BB2C
	ORA.b $68,x				;$B6BB2F
	STA.b $68,x				;$B6BB31
CODE_B6BB33:
	RTL					;$B6BB33

CODE_B6BB34:
	LDX.b current_sprite			;$B6BB34
	LDA.b $68,x				;$B6BB36
	BIT.w #$0001				;$B6BB38
	BNE.b CODE_B6BB46			;$B6BB3B
	JSL.l populate_sprite_clipping		;$B6BB3D
	LDA.w #$0000				;$B6BB41
	LDX.b current_sprite			;$B6BB44
CODE_B6BB46:
	RTS					;$B6BB46

bazuka_main:
	JMP.w (DATA_B6BB4A,x)			;$B6BB47

DATA_B6BB4A:
	dw CODE_B6BB5C
	dw CODE_B6BB7C
	dw CODE_B6BBB7
	dw CODE_B6BBEF
	dw CODE_B6BC44
	dw CODE_B6BC47
	dw CODE_B6BC72
	dw CODE_B6BCBA
	dw CODE_B6BD5D

CODE_B6BB5C:
	TYX					;$B6BB5C
	JSR.w CODE_B6F371			;$B6BB5D
	INC.b $38,x				;$B6BB60
	LDA.b $12,x				;$B6BB62
	STA.b $66,x				;$B6BB64
	LDA.b $68,x				;$B6BB66
	EOR.b $1E,x				;$B6BB68
	ASL					;$B6BB6A
	BPL.b CODE_B6BB75			;$B6BB6B
	LDA.b $68,x				;$B6BB6D
	EOR.w #$FFFF				;$B6BB6F
	INC					;$B6BB72
	STA.b $68,x				;$B6BB73
CODE_B6BB75:
	JSL.l CODE_B6840E			;$B6BB75
	JML [$04F5]				;$B6BB79

CODE_B6BB7C:
	JSR.w CODE_B6BD86			;$B6BB7C
	JSR.w CODE_B6F381			;$B6BB7F
	BCC.b CODE_B6BBA3			;$B6BB82
	INC.b $38,x				;$B6BB84
	LDA.w #$027C				;$B6BB86
	LDY.b $18,x				;$B6BB89
	BEQ.b CODE_B6BB95			;$B6BB8B
	LDA.w #$0008				;$B6BB8D
	STA.b $38,x				;$B6BB90
	LDA.w #$0286				;$B6BB92
CODE_B6BB95:
	JSL.l set_sprite_animation		;$B6BB95
	LDA.w #CODE_B6BD63			;$B6BB99
	JSL.l CODE_BB85D6			;$B6BB9C
	JML [$04F5]				;$B6BBA0

CODE_B6BBA3:
	JSL.l CODE_BBAB52			;$B6BBA3
	BCS.b CODE_B6BBB4			;$B6BBA7
	LDA.w #CODE_B6BD63			;$B6BBA9
	JSL.l CODE_BB85D6			;$B6BBAC
	JSL.l process_sprite_animation		;$B6BBB0
CODE_B6BBB4:
	JML [$04F5]				;$B6BBB4

CODE_B6BBB7:
	JSR.w CODE_B6BDAE			;$B6BBB7
	LDA.b $18,x				;$B6BBBA
	BNE.b CODE_B6BBC1			;$B6BBBC
	JSR.w set_platform_hitbox_position	;$B6BBBE
CODE_B6BBC1:
	LDA.b $2A,x				;$B6BBC1
	BPL.b CODE_B6BBC9			;$B6BBC3
	CLC					;$B6BBC5
	ADC.w #$0080				;$B6BBC6
CODE_B6BBC9:
	SEC					;$B6BBC9
	SBC.w #$0040				;$B6BBCA
	EOR.b $1E,x				;$B6BBCD
	ASL					;$B6BBCF
	BMI.b CODE_B6BBEC			;$B6BBD0
	LDA.w #$00C0				;$B6BBD2
	BIT.b $1E,x				;$B6BBD5
	BVC.b CODE_B6BBDC			;$B6BBD7
	LDA.w #$FF40				;$B6BBD9
CODE_B6BBDC:
	STA.b $2A,x				;$B6BBDC
	STA.b $30,x				;$B6BBDE
	INC.b $38,x				;$B6BBE0
	LDA.w #$027D				;$B6BBE2
	JSL.l set_sprite_animation		;$B6BBE5
	JML [$04F5]				;$B6BBE9

CODE_B6BBEC:
	JMP.w return_handle_anim_and_despawn	;$B6BBEC

CODE_B6BBEF:
	TYX					;$B6BBEF
	LDA.b $40,x				;$B6BBF0
	CMP.w #$027E				;$B6BBF2
	BNE.b CODE_B6BC30			;$B6BBF5
	LDA.b $18,x				;$B6BBF7
	BNE.b CODE_B6BC0B			;$B6BBF9
	JSR.w CODE_B6BD86			;$B6BBFB
	JSR.w set_platform_hitbox_position	;$B6BBFE
	LDA.b $12,x				;$B6BC01
	SEC					;$B6BC03
	SBC.b $66,x				;$B6BC04
	EOR.b $1E,x				;$B6BC06
	ASL					;$B6BC08
	BMI.b CODE_B6BC1C			;$B6BC09
CODE_B6BC0B:
	STZ.b $2A,x				;$B6BC0B
	STZ.b $38,x				;$B6BC0D
	INC.b $38,x				;$B6BC0F
	LDA.w #$0281				;$B6BC11
	JSL.l set_sprite_animation		;$B6BC14
	JSL.l CODE_B6840E			;$B6BC18
CODE_B6BC1C:
	JSL.l CODE_BBAB52			;$B6BC1C
	BCS.b CODE_B6BC2D			;$B6BC20
	LDA.w #CODE_B6BD63			;$B6BC22
	JSL.l CODE_BB85D6			;$B6BC25
	JSL.l process_sprite_animation		;$B6BC29
CODE_B6BC2D:
	JML [$04F5]				;$B6BC2D

CODE_B6BC30:
	JSL.l CODE_BBAB52			;$B6BC30
	BCS.b CODE_B6BC41			;$B6BC34
	LDA.w #CODE_B6BD81			;$B6BC36
	JSL.l CODE_BB85D6			;$B6BC39
	JSL.l process_sprite_animation		;$B6BC3D
CODE_B6BC41:
	JML [$04F5]				;$B6BC41

CODE_B6BC44:
	JMP.w generic_move_and_animate_state	;$B6BC44

CODE_B6BC47:
	LDA.w $1B6B				;$B6BC47
	BEQ.b CODE_B6BC58			;$B6BC4A
	JSL.l CODE_BB85A9			;$B6BC4C
	JSL.l CODE_BB85AC			;$B6BC50
	JML.l CODE_B6F27D			;$B6BC54

CODE_B6BC58:
	TYX					;$B6BC58
	JSR.w CODE_B6F371			;$B6BC59
	INC.b $38,x				;$B6BC5C
	STX.w $1B6B				;$B6BC5E
	LDA level_number			;$B6BC61
	CMP.w #!level_criss_kross_cliffs	;$B6BC63
	BNE.b CODE_B6BC6F			;$B6BC66
	LDA.w $054F				;$B6BC68
	BEQ.b CODE_B6BC6F			;$B6BC6B
	STA.b $64,x				;$B6BC6D
CODE_B6BC6F:
	JML [$04F5]				;$B6BC6F

CODE_B6BC72:
	TYX					;$B6BC72
	JSR.w CODE_B6BCFB			;$B6BC73
	LDA.w #$0110				;$B6BC76
	CLC					;$B6BC79
	ADC.w $1973				;$B6BC7A
	CMP.w $0016,y				;$B6BC7D
	BCS.b CODE_B6BC91			;$B6BC80
	STZ.b $3A,x				;$B6BC82
	LDA.w #$C000				;$B6BC84
	STA.b $26,x				;$B6BC87
	INC.b $38,x				;$B6BC89
	JSL.l CODE_BB859D			;$B6BC8B
	BRA.b CODE_B6BCBA			;$B6BC8F

CODE_B6BC91:
	JSR.w CODE_B6BDEE			;$B6BC91
	JSR.w CODE_B6F381			;$B6BC94
	BCC.b CODE_B6BCB7			;$B6BC97
	PHX					;$B6BC99
	PHY					;$B6BC9A
	JSL.l CODE_BBAB29			;$B6BC9B
	BCS.b CODE_B6BCA8			;$B6BC9F
	LDA.w #$060C				;$B6BCA1
	JSL.l queue_sound_effect		;$B6BCA4
CODE_B6BCA8:
	PLY					;$B6BCA8
	PLX					;$B6BCA9
	JSR.w CODE_B6BD08			;$B6BCAA
	LDA.w #$027F				;$B6BCAD
	JSL.l set_sprite_animation		;$B6BCB0
	JML [$04F5]				;$B6BCB4

CODE_B6BCB7:
	JMP.w CODE_B685E6			;$B6BCB7

CODE_B6BCBA:
	LDX.b current_sprite			;$B6BCBA
	JSR.w CODE_B6BCFB			;$B6BCBC
	JSR.w CODE_B6F381			;$B6BCBF
	BCC.b CODE_B6BCF8			;$B6BCC2
	PHX					;$B6BCC4
	PHY					;$B6BCC5
	JSL.l CODE_BBAB29			;$B6BCC6
	BCS.b CODE_B6BCD3			;$B6BCCA
	LDA.w #$060C				;$B6BCCC
	JSL.l queue_sound_effect		;$B6BCCF
CODE_B6BCD3:
	PLY					;$B6BCD3
	PLX					;$B6BCD4
	JSR.w CODE_B6BD08			;$B6BCD5
	JSR.w CODE_B6BD17			;$B6BCD8
	LDA.b $12,x				;$B6BCDB
	SEC					;$B6BCDD
	SBC.w #$0008				;$B6BCDE
	STA.w $0012,y				;$B6BCE1
	LDA.w $1973				;$B6BCE4
	CLC					;$B6BCE7
	ADC.w #$0110				;$B6BCE8
	STA.w $0016,y				;$B6BCEB
	LDA.b $6A,x				;$B6BCEE
	STA.w $005E,y				;$B6BCF0
	LDA.b $68,x				;$B6BCF3
	STA.w $002E,y				;$B6BCF5
CODE_B6BCF8:
	JML [$04F5]				;$B6BCF8

CODE_B6BCFB:
	LDA level_number			;$B6BCFB
	CMP.w #!level_criss_kross_cliffs	;$B6BCFD
	BNE.b CODE_B6BD07			;$B6BD00
	LDA.b $64,x				;$B6BD02
	STA.w $054F				;$B6BD04
CODE_B6BD07:
	RTS					;$B6BD07

CODE_B6BD08:
	LDA.b $64,x				;$B6BD08
	AND.w #$00FF				;$B6BD0A
	CMP.w #$0002				;$B6BD0D
	BNE.b CODE_B6BD16			;$B6BD10
	LDA.b $2C,x				;$B6BD12
	STA.b $62,x				;$B6BD14
CODE_B6BD16:
	RTS					;$B6BD16

CODE_B6BD17:
	LDA.b $64,x				;$B6BD17
	AND.w #$00FF				;$B6BD19
	ASL					;$B6BD1C
	TAX					;$B6BD1D
	LDY.w DATA_B6FC4E,x			;$B6BD1E
	LDA.w $155E				;$B6BD21
	PHA					;$B6BD24
	JSL.l CODE_BB85B8			;$B6BD25
	LDX.b current_sprite			;$B6BD29
	LDY.b alternate_sprite			;$B6BD2B
	LDA.w #$0001				;$B6BD2D
	STA.w $0060,y				;$B6BD30
	PLA					;$B6BD33
	CMP.w $155E				;$B6BD34
	BEQ.b CODE_B6BD42			;$B6BD37
CODE_B6BD39:
	LDA.w $001E,y				;$B6BD39
	STA.b $1C,x				;$B6BD3C
	STZ.b $1A,x				;$B6BD3E
	INC.b $1A,x				;$B6BD40
CODE_B6BD42:
	LDA.b $1A,x				;$B6BD42
	BEQ.b CODE_B6BD39			;$B6BD44
	LDA.b $64,x				;$B6BD46
	AND.w #$00FF				;$B6BD48
	ASL					;$B6BD4B
	TAY					;$B6BD4C
	LDA.w DATA_B6FC65,y			;$B6BD4D
	LDY.b alternate_sprite			;$B6BD50
	SEP.b #$20				;$B6BD52
	CLC					;$B6BD54
	ADC.b $1C,x				;$B6BD55
	STA.w $001E,y				;$B6BD57
	REP.b #$20				;$B6BD5A
	RTS					;$B6BD5C

CODE_B6BD5D:
	JSR.w CODE_B6BDAE			;$B6BD5D
	JMP.w return_handle_anim_and_despawn	;$B6BD60

CODE_B6BD63:
	LDX.b current_sprite			;$B6BD63
	LDA.b $24,x				;$B6BD65
	SEC					;$B6BD67
	SBC.w #$3552				;$B6BD68
	BMI.b CODE_B6BD79			;$B6BD6B
	BEQ.b CODE_B6BD74			;$B6BD6D
	LDA.w #$0027				;$B6BD6F
	BRA.b CODE_B6BD7C			;$B6BD72

CODE_B6BD74:
	LDA.w #$0026				;$B6BD74
	BRA.b CODE_B6BD7C			;$B6BD77

CODE_B6BD79:
	LDA.w #$0025				;$B6BD79
CODE_B6BD7C:
	JSL.l CODE_BEC01B			;$B6BD7C
	RTL					;$B6BD80

CODE_B6BD81:
	JSL.l CODE_BEC018			;$B6BD81
	RTL					;$B6BD85

CODE_B6BD86:
	LDA.w #$0020				;$B6BD86
	JSL.l check_throwable_collision		;$B6BD89
	BCC.b CODE_B6BD91			;$B6BD8D
	BEQ.b CODE_B6BDA5			;$B6BD8F
CODE_B6BD91:
	LDY.w active_kong_sprite		;$B6BD91
	LDA.b $16,x				;$B6BD94
	SEC					;$B6BD96
	SBC.w #$0020				;$B6BD97
	CMP.w $0016,y				;$B6BD9A
	BCS.b CODE_B6BDA2			;$B6BD9D
	JSR.w CODE_B6BDC0			;$B6BD9F
CODE_B6BDA2:
	STZ.b $6C,x				;$B6BDA2
	RTS					;$B6BDA4

CODE_B6BDA5:
	LDY.w #$0004				;$B6BDA5
	LDA.w #$0282				;$B6BDA8
	JMP.w CODE_B6878B			;$B6BDAB

CODE_B6BDAE:
	LDA.w #$0020				;$B6BDAE
	JSL.l check_throwable_collision		;$B6BDB1
	BCC.b CODE_B6BDB9			;$B6BDB5
	BEQ.b CODE_B6BDA5			;$B6BDB7
CODE_B6BDB9:
	LDA.b $6C,x				;$B6BDB9
	BEQ.b CODE_B6BDC0			;$B6BDBB
	DEC.b $6C,x				;$B6BDBD
	RTS					;$B6BDBF

CODE_B6BDC0:
	JSL.l populate_sprite_clipping		;$B6BDC0
	LDA.w #$8455				;$B6BDC4
	INC.w $1860				;$B6BDC7
	JSL.l CODE_BEC009			;$B6BDCA
	BCC.b CODE_B6BDED			;$B6BDCE
	LDA.w #$000F				;$B6BDD0
	JSL.l CODE_B88069			;$B6BDD3
	BCS.b CODE_B6BDED			;$B6BDD7
	STY.w $17C8				;$B6BDD9
	LDA.w #$0004				;$B6BDDC
	STA.b $6C,x				;$B6BDDF
	STZ.w $17CA				;$B6BDE1
	LDA.w #$F990				;$B6BDE4
	STA.w $17CC				;$B6BDE7
	STZ.w $17CE				;$B6BDEA
CODE_B6BDED:
	RTS					;$B6BDED

CODE_B6BDEE:
	LDA.w #$0028				;$B6BDEE
	JSL.l CODE_BCE43C			;$B6BDF1
	LDA.w #$0459				;$B6BDF5
	JSL.l CODE_BEC009			;$B6BDF8
	RTS					;$B6BDFC

upwards_shot_barrel_main:
bazuka_barrel_main:
	JMP.w (DATA_B6BE00,x)			;$B6BDFD

DATA_B6BE00:
	dw CODE_B6BE04
	dw CODE_B6BF6B

CODE_B6BE04:
	TYX					;$B6BE04
	LDA.b $60,x				;$B6BE05
	BEQ.b CODE_B6BE0E			;$B6BE07
	DEC.b $60,x				;$B6BE09
	JMP.w CODE_B6BEFC			;$B6BE0B

CODE_B6BE0E:
	JSL.l populate_sprite_clipping		;$B6BE0E
	LDA.b $5C,x				;$B6BE12
	ASL					;$B6BE14
	LDY.w $1B6B				;$B6BE15
	BEQ.b CODE_B6BE1E			;$B6BE18
	CLC					;$B6BE1A
	ADC.w #$0006				;$B6BE1B
CODE_B6BE1E:
	TAX					;$B6BE1E
	JMP.w (DATA_B6BE22,x)			;$B6BE1F

DATA_B6BE22:
	dw CODE_B6BE2E
	dw CODE_B6BE7F
	dw CODE_B6BECD
	dw CODE_B6BE2E
	dw CODE_B6BE61
	dw CODE_B6BEC8

CODE_B6BE2E:
	LDA.w #$0018				;$B6BE2E
	JSL.l check_throwable_collision		;$B6BE31
	BCS.b CODE_B6BE40			;$B6BE35
	LDA.w #$0808				;$B6BE37
	JSL.l CODE_BEC009			;$B6BE3A
	BCC.b CODE_B6BE52			;$B6BE3E
CODE_B6BE40:
	LDA.w #$060C				;$B6BE40
	JSL.l queue_sound_effect		;$B6BE43
	JSL.l CODE_BEC030			;$B6BE47
	JSL.l delete_sprite_handle_deallocation	;$B6BE4B
	JML [$04F5]				;$B6BE4F

CODE_B6BE52:
	LDA.w #$0040				;$B6BE52
	LDY.w #$0010				;$B6BE55
	JSL.l check_sprite_collision		;$B6BE58
	BCS.b CODE_B6BE40			;$B6BE5C
	JMP.w CODE_B6BEFC			;$B6BE5E

CODE_B6BE61:
	LDA.w #$0018				;$B6BE61
	JSL.l check_throwable_collision		;$B6BE64
	BCS.b CODE_B6BE91			;$B6BE68
	LDA.w #$8808				;$B6BE6A
	JSL.l CODE_BEC009			;$B6BE6D
	BCC.b CODE_B6BEBA			;$B6BE71
	LDA.w #$076D				;$B6BE73
	JSL.l queue_sound_effect		;$B6BE76
	JSR.w CODE_B6BF85			;$B6BE7A
	BCC.b CODE_B6BE91			;$B6BE7D
CODE_B6BE7F:
	LDA.w #$0018				;$B6BE7F
	JSL.l check_throwable_collision		;$B6BE82
	BCS.b CODE_B6BE91			;$B6BE86
	LDA.w #$0808				;$B6BE88
	JSL.l CODE_BEC009			;$B6BE8B
	BCC.b CODE_B6BEBA			;$B6BE8F
CODE_B6BE91:
	LDX.b current_sprite			;$B6BE91
	LDY.w active_kong_sprite		;$B6BE93
	LDA.b $12,x				;$B6BE96
	CMP.w $0012,y				;$B6BE98
	LDY.w #$0500				;$B6BE9B
	BCS.b CODE_B6BEA3			;$B6BE9E
	LDY.w #$FB00				;$B6BEA0
CODE_B6BEA3:
	STY.b $2A,x				;$B6BEA3
	STZ.b $30,x				;$B6BEA5
	STZ.b $3A,x				;$B6BEA7
	LDA.w #$0100				;$B6BEA9
	STA.b $2E,x				;$B6BEAC
	LDA.b $1E,x				;$B6BEAE
	ORA.w #$3000				;$B6BEB0
	STA.b $1E,x				;$B6BEB3
	INC.b $38,x				;$B6BEB5
	JML [$04F5]				;$B6BEB7

CODE_B6BEBA:
	LDA.w #$0040				;$B6BEBA
	LDY.w #$0410				;$B6BEBD
	JSL.l check_sprite_collision		;$B6BEC0
	BCS.b CODE_B6BE91			;$B6BEC4
	BRA.b CODE_B6BEFC			;$B6BEC6

CODE_B6BEC8:
	LDA.w #$0000				;$B6BEC8
	BRA.b CODE_B6BED0			;$B6BECB

CODE_B6BECD:
	LDA.w #$0000				;$B6BECD
CODE_B6BED0:
	STA.w $1C15				;$B6BED0
	LDA.w #$0018				;$B6BED3
	JSL.l check_throwable_collision		;$B6BED6
	BCS.b CODE_B6BEE5			;$B6BEDA
	LDA.w $1C15				;$B6BEDC
	JSL.l CODE_BEC009			;$B6BEDF
	BCC.b CODE_B6BEE8			;$B6BEE3
CODE_B6BEE5:
	JMP.w CODE_B6B3A4			;$B6BEE5

CODE_B6BEE8:
	LDA.w #$0040				;$B6BEE8
	LDY.w #$0038				;$B6BEEB
	JSL.l check_sprite_collision		;$B6BEEE
	BCC.b CODE_B6BEFC			;$B6BEF2
	LDA.w $0000,y				;$B6BEF4
	CMP.w #$0448				;$B6BEF7
	BNE.b CODE_B6BEE5			;$B6BEFA
CODE_B6BEFC:
	JSL.l process_current_movement		;$B6BEFC
	LDY.b $2A,x				;$B6BF00
	BEQ.b CODE_B6BF48			;$B6BF02
	LDA.b $12,x				;$B6BF04
	SEC					;$B6BF06
	SBC.b $5E,x				;$B6BF07
	EOR.b $2A,x				;$B6BF09
	BMI.b CODE_B6BF5B			;$B6BF0B
CODE_B6BF0D:
	JSL.l CODE_BBAB46			;$B6BF0D
	BCS.b CODE_B6BF65			;$B6BF11
	LDY.b current_sprite			;$B6BF13
	LDA.w $005C,y				;$B6BF15
	ASL					;$B6BF18
	TAX					;$B6BF19
	JMP.w (DATA_B6BF1D,x)			;$B6BF1A

DATA_B6BF1D:
	dw CODE_B6BE40
	dw CODE_B6BF26
	dw CODE_B6BEE5

CODE_B6BF23:
	JMP.w CODE_B6BE91			;$B6BF23

CODE_B6BF26:
	TYX					;$B6BF26
	LSR.b $6C,x				;$B6BF27
	BCC.b CODE_B6BF23			;$B6BF29
	JSR.w CODE_B6F3EB			;$B6BF2B
	LDY.w #$01CC				;$B6BF2E
	JSL.l CODE_BB8585			;$B6BF31
	LDX.b alternate_sprite			;$B6BF35
	LDY.b current_sprite			;$B6BF37
	LDA.w $002A,y				;$B6BF39
	STA.b $2A,x				;$B6BF3C
	STA.b $30,x				;$B6BF3E
	LDA.w #$4040				;$B6BF40
	STA.b $0C,x				;$B6BF43
	JML [$04F5]				;$B6BF45

CODE_B6BF48:
	LDA.b $16,x				;$B6BF48
	CLC					;$B6BF4A
	ADC.w #$001E				;$B6BF4B
	SEC					;$B6BF4E
	SBC.w $1973				;$B6BF4F
	BMI.b CODE_B6BF68			;$B6BF52
	LDA.b $16,x				;$B6BF54
	SEC					;$B6BF56
	SBC.b $5E,x				;$B6BF57
	BMI.b CODE_B6BF0D			;$B6BF59
CODE_B6BF5B:
	LDX.b current_sprite			;$B6BF5B
	LDA.b $40,x				;$B6BF5D
	BEQ.b CODE_B6BF65			;$B6BF5F
	JSL.l process_sprite_animation		;$B6BF61
CODE_B6BF65:
	JML [$04F5]				;$B6BF65

CODE_B6BF68:
	JMP.w CODE_B6F27D			;$B6BF68

CODE_B6BF6B:
	LDA.w #$0004				;$B6BF6B
	JSL.l process_alternate_movement	;$B6BF6E
	JSL.l CODE_BBAB46			;$B6BF72
	JML [$04F5]				;$B6BF76

CODE_B6BF79:
	JSL.l CODE_BBAB46			;$B6BF79
	BCS.b CODE_B6BF82			;$B6BF7D
	JMP.w CODE_B685E6			;$B6BF7F

CODE_B6BF82:
	JML [$04F5]				;$B6BF82

CODE_B6BF85:
	LDA.w $1B6B				;$B6BF85
	BEQ.b CODE_B6BF98			;$B6BF88
	LDA.w #$000E				;$B6BF8A
	JSL.l CODE_B88069			;$B6BF8D
	BCS.b CODE_B6BF98			;$B6BF91
	LDA.b $2E,x				;$B6BF93
	STA.w $17CA				;$B6BF95
CODE_B6BF98:
	RTS					;$B6BF98

barrel_switch_main:
	JMP.w (DATA_B6BF9C,x)			;$B6BF99

DATA_B6BF9C:
	dw CODE_B6BFA2
	dw CODE_B6BFF9
	dw CODE_B6BFF6

CODE_B6BFA2:
	LDA.w #$002C				;$B6BFA2
	JSL.l CODE_BCE43C			;$B6BFA5
	JSL.l CODE_B6F1BD			;$B6BFA9
	BCS.b CODE_B6BFB8			;$B6BFAD
	LDA.w #$1000				;$B6BFAF
	JSL.l check_throwable_collision		;$B6BFB2
	BCC.b CODE_B6BFD4			;$B6BFB6
CODE_B6BFB8:
	LDA.w #$002E				;$B6BFB8
	JSL.l CODE_BFF006			;$B6BFBB
	LDA.w #$0019				;$B6BFBF
	STA.b $5E,x				;$B6BFC2
	INC.b $38,x				;$B6BFC4
	JSR.w CODE_B6C014			;$B6BFC6
	BEQ.b CODE_B6BFF6			;$B6BFC9
	LDA.w $0064,y				;$B6BFCB
	XBA					;$B6BFCE
	STA.w $0064,y				;$B6BFCF
	BRA.b CODE_B6BFD9			;$B6BFD2

CODE_B6BFD4:
	JSR.w CODE_B6C014			;$B6BFD4
	BEQ.b CODE_B6BFF6			;$B6BFD7
CODE_B6BFD9:
	LDA.w $0064,y				;$B6BFD9
	AND.w #$00FF				;$B6BFDC
	ASL					;$B6BFDF
	ASL					;$B6BFE0
	TAY					;$B6BFE1
	LDA.w DATA_B6C027,y			;$B6BFE2
	CMP.b $40,x				;$B6BFE5
	BEQ.b CODE_B6BFF6			;$B6BFE7
	PHA					;$B6BFE9
	LDA.w DATA_B6C027+$02,y			;$B6BFEA
	JSL.l CODE_BB85A0			;$B6BFED
	PLA					;$B6BFF1
	JSL.l set_sprite_animation		;$B6BFF2
CODE_B6BFF6:
	JMP.w return_handle_despawn		;$B6BFF6

CODE_B6BFF9:
	LDA.w $005E,y				;$B6BFF9
	BEQ.b CODE_B6C003			;$B6BFFC
	TYX					;$B6BFFE
	DEC.b $5E,x				;$B6BFFF
	BNE.b CODE_B6BFD4			;$B6C001
CODE_B6C003:
	LDA.w #$002C				;$B6C003
	JSL.l CODE_BCE43C			;$B6C006
	JSL.l CODE_B6F1BD			;$B6C00A
	BCS.b CODE_B6BFD4			;$B6C00E
	DEC.b $38,x				;$B6C010
	BRA.b CODE_B6BFD4			;$B6C012

CODE_B6C014:
	LDY.w $1B6B				;$B6C014
	LDA.b $5C,x				;$B6C017
	BNE.b CODE_B6C021			;$B6C019
	LDA.w #$0448				;$B6C01B
	JSR.w CODE_B6C022			;$B6C01E
CODE_B6C021:
	RTS					;$B6C021

CODE_B6C022:
	JSR.w CODE_B6F2E8			;$B6C022
	TYA					;$B6C025
	RTS					;$B6C026

DATA_B6C027:
	dw $014E
	dw $001C
	dw $0164
	dw $001D
	dw $0156
	dw $001C

kopter_main:
	JMP.w (DATA_B6C036,x)			;$B6C033

DATA_B6C036:
	dw CODE_B6C05C
	dw CODE_B6C065
	dw CODE_B6C07F
	dw CODE_B6C0A9
	dw CODE_B6C0B3
	dw CODE_B6C0CF
	dw CODE_B6C0E4
	dw CODE_B6C0F8
	dw CODE_B6C10D
	dw CODE_B6C169
	dw CODE_B6C1A9
	dw CODE_B6C1C2
	dw CODE_B6C202
	dw CODE_B6C23D
	dw CODE_B6C243
	dw CODE_B6C26A
	dw CODE_B6C26D
	dw CODE_B6C277
	dw CODE_B6C288

CODE_B6C05C:
	TYX					;$B6C05C
	JSR.w invert_max_x_speed_if_needed	;$B6C05D
	JSR.w CODE_B6C31F			;$B6C060
	INC.b $38,x				;$B6C063
CODE_B6C065:
	TYX					;$B6C065
	LDA.b $30,x				;$B6C066
	PHA					;$B6C068
	JSL.l process_current_movement		;$B6C069
	PLA					;$B6C06D
	EOR.b $30,x				;$B6C06E
	BPL.b CODE_B6C07C			;$B6C070
	INC.b $64,x				;$B6C072
	LDA.b $64,x				;$B6C074
	DEC					;$B6C076
	DEC					;$B6C077
	BNE.b CODE_B6C07C			;$B6C078
	INC.b $38,x				;$B6C07A
CODE_B6C07C:
	JMP.w return_handle_anim_and_despawn	;$B6C07C

CODE_B6C07F:
	TYX					;$B6C07F
	LDA.b $2A,x				;$B6C080
	EOR.b $30,x				;$B6C082
	BMI.b CODE_B6C09F			;$B6C084
	LDA.b $12,x				;$B6C086
	SEC					;$B6C088
	SBC.b $5C,x				;$B6C089
	EOR.b $2A,x				;$B6C08B
	BMI.b CODE_B6C09F			;$B6C08D
	STZ.b $30,x				;$B6C08F
	INC.b $38,x				;$B6C091
	LDA.w #$0140				;$B6C093
	STA.b $6C,x				;$B6C096
	LDA.w #$FFF6				;$B6C098
	STA.b $6A,x				;$B6C09B
	BRA.b CODE_B6C0A9			;$B6C09D

CODE_B6C09F:
	LDA.w #$0040				;$B6C09F
	JSL.l process_alternate_movement	;$B6C0A2
	JMP.w return_handle_anim_and_despawn	;$B6C0A6

CODE_B6C0A9:
	LDA.w #$0040				;$B6C0A9
	JSL.l process_alternate_movement	;$B6C0AC
	JMP.w return_handle_anim_and_despawn	;$B6C0B0

CODE_B6C0B3:
	TYX					;$B6C0B3
	LDA.b $68,x				;$B6C0B4
	STA.b $66,x				;$B6C0B6
	STA.w CPU.dividen_low			;$B6C0B8
	SEP.b #$20				;$B6C0BB
	LDA.b #$1E				;$B6C0BD
	STA.w CPU.divisor			;$B6C0BF
	REP.b #$20				;$B6C0C2
	JSL.l stall_cpu_time		;$B6C0C4
	LDA.w CPU.divide_result			;$B6C0C8
	STA.b $64,x				;$B6C0CB
	INC.b $38,x				;$B6C0CD
CODE_B6C0CF:
	LDX.b current_sprite			;$B6C0CF
	DEC.b $66,x				;$B6C0D1
	BNE.b CODE_B6C0E1			;$B6C0D3
	INC.b $38,x				;$B6C0D5
	JSR.w CODE_B6C31F			;$B6C0D7
	LDA.w #$0287				;$B6C0DA
	JSL.l set_sprite_animation		;$B6C0DD
CODE_B6C0E1:
	JMP.w return_handle_anim_and_despawn	;$B6C0E1

CODE_B6C0E4:
	LDA.w #$0288				;$B6C0E4
	CMP.w $0040,y				;$B6C0E7
	BNE.b CODE_B6C0F5			;$B6C0EA
	TYX					;$B6C0EC
	STZ.b $38,x				;$B6C0ED
	INC.b $38,x				;$B6C0EF
	LDA.b $62,x				;$B6C0F1
	STA.b $30,x				;$B6C0F3
CODE_B6C0F5:
	JMP.w return_handle_anim_and_despawn	;$B6C0F5

CODE_B6C0F8:
	TYX					;$B6C0F8
	INC.b $38,x				;$B6C0F9
	STZ.b $30,x				;$B6C0FB
	LDA.b $64,x				;$B6C0FD
	STA.b $2E,x				;$B6C0FF
	JSR.w CODE_B6C32C			;$B6C101
	LDA.w #$0280				;$B6C104
	STA.b $6C,x				;$B6C107
	STA.b $44,x				;$B6C109
	STZ.b $6A,x				;$B6C10B
CODE_B6C10D:
	TYX					;$B6C10D
	LDA.b $1A,x				;$B6C10E
	PHA					;$B6C110
	JSL.l process_current_movement		;$B6C111
	LDY.w #$0000				;$B6C115
	LDA.b [$6A],y				;$B6C118
	CLC					;$B6C11A
	ADC.b $2E,x				;$B6C11B
	STA.b $2E,x				;$B6C11D
	LDA.b $64,x				;$B6C11F
	JSR.w CODE_B6F2C9			;$B6C121
	PLA					;$B6C124
	BPL.b CODE_B6C133			;$B6C125
	EOR.b $1A,x				;$B6C127
	BPL.b CODE_B6C133			;$B6C129
	LDA.b $18,x				;$B6C12B
	SEC					;$B6C12D
	SBC.b $16,x				;$B6C12E
	LSR					;$B6C130
	STA.b $5E,x				;$B6C131
CODE_B6C133:
	LDA.b $18,x				;$B6C133
	CMP.w #$7F00				;$B6C135
	BEQ.b CODE_B6C166			;$B6C138
	SEC					;$B6C13A
	SBC.b $16,x				;$B6C13B
	CMP.b $5E,x				;$B6C13D
	BCS.b CODE_B6C166			;$B6C13F
	LDY.b $2E,x				;$B6C141
	STY.w CPU.dividen_low			;$B6C143
	SEP.b #$20				;$B6C146
	STA.w CPU.divisor			;$B6C148
	REP.b #$20				;$B6C14B
	JSL.l stall_cpu_time			;$B6C14D
	LDA.w CPU.divide_result			;$B6C151
	STA.b $66,x				;$B6C154
	LDA.b $62,x				;$B6C156
	STA.b $30,x				;$B6C158
	LDA.w #$0380				;$B6C15A
	STA.b $6C,x				;$B6C15D
	LDA.w #$000C				;$B6C15F
	STA.b $6A,x				;$B6C162
	INC.b $38,x				;$B6C164
CODE_B6C166:
	JMP.w return_handle_anim_and_despawn	;$B6C166

CODE_B6C169:
	TYX					;$B6C169
	LDA.b $2E,x				;$B6C16A
	SEC					;$B6C16C
	SBC.b $66,x				;$B6C16D
	BPL.b CODE_B6C174			;$B6C16F
CODE_B6C171:
	LDA.w #$0080				;$B6C171
CODE_B6C174:
	CMP.w #$0080				;$B6C174
	BCC.b CODE_B6C171			;$B6C177
	STA.b $2E,x				;$B6C179
	JSL.l process_current_movement		;$B6C17B
	LDA.b $28,x				;$B6C17F
	AND.w #$0101				;$B6C181
	BEQ.b CODE_B6C1A6			;$B6C184
	CMP.w #$0001				;$B6C186
	BEQ.b CODE_B6C1A6			;$B6C189
	CMP.w #$0101				;$B6C18B
	BEQ.b CODE_B6C1A6			;$B6C18E
	LDA.b $30,x				;$B6C190
	CMP.w #$8000				;$B6C192
	PHP					;$B6C195
	ROR					;$B6C196
	PLP					;$B6C197
	STA.b $30,x				;$B6C198
	DEC.b $38,x				;$B6C19A
	LDA.w #$0280				;$B6C19C
	STA.b $6C,x				;$B6C19F
	LDA.w #$FFFA				;$B6C1A1
	STA.b $6A,x				;$B6C1A4
CODE_B6C1A6:
	JMP.w return_handle_anim_and_despawn	;$B6C1A6

CODE_B6C1A9:
	TYX					;$B6C1A9
	INC.b $38,x				;$B6C1AA
	LDA.b $12,x				;$B6C1AC
	STA.b $5C,x				;$B6C1AE
	LDA.w #$0380				;$B6C1B0
	STA.b $6C,x				;$B6C1B3
	STA.b $44,x				;$B6C1B5
	STZ.b $6A,x				;$B6C1B7
	JSR.w CODE_B6C32C			;$B6C1B9
	LDA.b $62,x				;$B6C1BC
	STA.b $2A,x				;$B6C1BE
	STA.b $30,x				;$B6C1C0
CODE_B6C1C2:
	JSR.w CODE_B6C2C6			;$B6C1C2
	JSL.l process_current_movement		;$B6C1C5
	LDA.b $30,x				;$B6C1C9
	EOR.b $2A,x				;$B6C1CB
	BMI.b CODE_B6C1FF			;$B6C1CD
	LDA.b $60,x				;$B6C1CF
	LDY.b $30,x				;$B6C1D1
	BPL.b CODE_B6C1E0			;$B6C1D3
	XBA					;$B6C1D5
	JSL.l CODE_B58021			;$B6C1D6
	EOR.w #$FFFF				;$B6C1DA
	INC					;$B6C1DD
	BRA.b CODE_B6C1E3			;$B6C1DE

CODE_B6C1E0:
	AND.w #$00FF				;$B6C1E0
CODE_B6C1E3:
	CLC					;$B6C1E3
	ADC.b $5C,x				;$B6C1E4
	SEC					;$B6C1E6
	SBC.b $12,x				;$B6C1E7
	EOR.b $30,x				;$B6C1E9
	BPL.b CODE_B6C1FF			;$B6C1EB
	STZ.b $30,x				;$B6C1ED
	STZ.b $2E,x				;$B6C1EF
	STZ.b $28,x				;$B6C1F1
	INC.b $38,x				;$B6C1F3
	LDA.w #$0580				;$B6C1F5
	STA.b $6C,x				;$B6C1F8
	LDA.w #$000E				;$B6C1FA
	STA.b $6A,x				;$B6C1FD
CODE_B6C1FF:
	JMP.w return_handle_anim_and_despawn	;$B6C1FF

CODE_B6C202:
	JSR.w CODE_B6C2C6			;$B6C202
	LDA.b $2E,x				;$B6C205
	SEC					;$B6C207
	SBC.b $4C,x				;$B6C208
	STA.b $2E,x				;$B6C20A
	LDA.b $64,x				;$B6C20C
	JSR.w CODE_B6F2C9			;$B6C20E
	JSL.l process_current_movement		;$B6C211
	LDA.b $28,x				;$B6C215
	AND.w #$0101				;$B6C217
	BEQ.b CODE_B6C220			;$B6C21A
	STZ.b $2E,x				;$B6C21C
	STZ.b $28,x				;$B6C21E
CODE_B6C220:
	LDA.b $16,x				;$B6C220
	CMP.b $4E,x				;$B6C222
	BCS.b CODE_B6C23A			;$B6C224
	INC.b $38,x				;$B6C226
	LDA.w #$0280				;$B6C228
	STA.b $6C,x				;$B6C22B
	LDA.w #$FFF2				;$B6C22D
	STA.b $6A,x				;$B6C230
	LDA.b $62,x				;$B6C232
	EOR.w #$FFFF				;$B6C234
	INC					;$B6C237
	STA.b $62,x				;$B6C238
CODE_B6C23A:
	JMP.w return_handle_anim_and_despawn	;$B6C23A

CODE_B6C23D:
	JSR.w CODE_B6C2C6			;$B6C23D
	JMP.w CODE_B6C10D			;$B6C240

CODE_B6C243:
	JSR.w CODE_B6C2C6			;$B6C243
	LDA.b $2E,x				;$B6C246
	SEC					;$B6C248
	SBC.b $66,x				;$B6C249
	BPL.b CODE_B6C250			;$B6C24B
CODE_B6C24D:
	LDA.w #$0080				;$B6C24D
CODE_B6C250:
	CMP.w #$0080				;$B6C250
	BCC.b CODE_B6C24D			;$B6C253
	STA.b $2E,x				;$B6C255
	JSL.l process_current_movement		;$B6C257
	LDA.b $28,x				;$B6C25B
	AND.w #$0101				;$B6C25D
	BEQ.b CODE_B6C267			;$B6C260
	LDA.w #$000B				;$B6C262
	STA.b $38,x				;$B6C265
CODE_B6C267:
	JMP.w return_handle_anim_and_despawn	;$B6C267

CODE_B6C26A:
	JMP.w generic_move_and_animate_state	;$B6C26A

CODE_B6C26D:
	JSR.w CODE_B6C2C6			;$B6C26D
	JSL.l process_current_movement		;$B6C270
	JMP.w return_handle_anim_and_despawn	;$B6C274

CODE_B6C277:
	TYX					;$B6C277
	INC.b $38,x				;$B6C278
	LDA.b $16,x				;$B6C27A
	CLC					;$B6C27C
	ADC.b $60,x				;$B6C27D
	STA.b $60,x				;$B6C27F
	LDA.b $16,x				;$B6C281
	SEC					;$B6C283
	SBC.b $5E,x				;$B6C284
	STA.b $5E,x				;$B6C286
CODE_B6C288:
	JSR.w CODE_B6C2C6			;$B6C288
	JSR.w CODE_B6C2AF			;$B6C28B
	LDA.b $16,x				;$B6C28E
	SEC					;$B6C290
	SBC.b $5E,x				;$B6C291
	BCC.b CODE_B6C29C			;$B6C293
	LDA.b $16,x				;$B6C295
	SEC					;$B6C297
	SBC.b $60,x				;$B6C298
	BCC.b CODE_B6C2A8			;$B6C29A
CODE_B6C29C:
	EOR.b $34,x				;$B6C29C
	BMI.b CODE_B6C2A8			;$B6C29E
	LDA.b $34,x				;$B6C2A0
	EOR.w #$FFFF				;$B6C2A2
	INC					;$B6C2A5
	STA.b $34,x				;$B6C2A6
CODE_B6C2A8:
	JSL.l process_current_movement		;$B6C2A8
	JMP.w return_handle_anim_and_despawn	;$B6C2AC

CODE_B6C2AF:
	LDA.b $34,x				;$B6C2AF
	BPL.b CODE_B6C2BB			;$B6C2B1
	LDA.w #$0300				;$B6C2B3
	LDY.w #$0008				;$B6C2B6
	BRA.b CODE_B6C2C1			;$B6C2B9

CODE_B6C2BB:
	LDA.w #$0180				;$B6C2BB
	LDY.w #$FFF8				;$B6C2BE
CODE_B6C2C1:
	STA.b $6C,x				;$B6C2C1
	STY.b $6A,x				;$B6C2C3
	RTS					;$B6C2C5

CODE_B6C2C6:
	LDA.w #$0029				;$B6C2C6
	JSL.l CODE_BCE43C			;$B6C2C9
	INC.w $1862				;$B6C2CD
	LDA.w #$0008				;$B6C2D0
	JSL.l CODE_BEC009			;$B6C2D3
	BCC.b CODE_B6C2EA			;$B6C2D7
	BEQ.b CODE_B6C2EA			;$B6C2D9
CODE_B6C2DB:
	LDA.b $2E,x				;$B6C2DB
	CLC					;$B6C2DD
	ADC.w #$0120				;$B6C2DE
	STA.b $2E,x				;$B6C2E1
	INC.b $16,x				;$B6C2E3
	INC.b $16,x				;$B6C2E5
	INC.b $16,x				;$B6C2E7
	RTS					;$B6C2E9

CODE_B6C2EA:
	JSL.l populate_sprite_clipping		;$B6C2EA
	LDA.w #$0000				;$B6C2EE
	JSL.l CODE_BEC009			;$B6C2F1
	RTS					;$B6C2F5

CODE_B6C2F6:
	JSL.l populate_sprite_clipping		;$B6C2F6
	INC.w $1862				;$B6C2FA
	LDA.w #$08A8				;$B6C2FD
	JSL.l CODE_BEC009			;$B6C300
	BCC.b CODE_B6C2EA			;$B6C304
	BEQ.b CODE_B6C2EA			;$B6C306
	LDA.w $17C6				;$B6C308
	CMP.w #$0011				;$B6C30B
	BNE.b CODE_B6C2DB			;$B6C30E
	JSL.l CODE_BB85AC			;$B6C310
	LDX.b current_sprite			;$B6C314
	LDY.w #$000F				;$B6C316
	LDA.w #$028A				;$B6C319
	JMP.w CODE_B6878B			;$B6C31C

CODE_B6C31F:
	STZ.b $64,x				;$B6C31F
	LDA.w #$0380				;$B6C321
	STA.b $6C,x				;$B6C324
	LDA.w #$0007				;$B6C326
	STA.b $6A,x				;$B6C329
	RTS					;$B6C32B

CODE_B6C32C:
	LDA.b $1E,x				;$B6C32C
	EOR.b $62,x				;$B6C32E
	ASL					;$B6C330
	BPL.b CODE_B6C33B			;$B6C331
	LDA.b $62,x				;$B6C333
	EOR.w #$FFFF				;$B6C335
	INC					;$B6C338
	STA.b $62,x				;$B6C339
CODE_B6C33B:
	RTS					;$B6C33B

murky_mill_elevator_main:
	JMP.w (DATA_B6C33F,x)			;$B6C33C

DATA_B6C33F:
	dw CODE_B6C349
	dw CODE_B6C35F
	dw CODE_B6C3CC
	dw CODE_B6C3CF
	dw CODE_B6C3DD

CODE_B6C349:
	TYX					;$B6C349
	STZ.b $68,x				;$B6C34A
	JSR.w CODE_B6834B			;$B6C34C
	LDY.w #$0152				;$B6C34F
	JSL.l CODE_BB8585			;$B6C352
	LDX.b alternate_sprite			;$B6C356
	LDY.b current_sprite			;$B6C358
	STX.b $62,y				;$B6C35A
	JSR.w CODE_B6C458			;$B6C35C
CODE_B6C35F:
	LDX.b current_sprite			;$B6C35F
	LDA.b $68,x				;$B6C361
	AND.w #$00FF				;$B6C363
	BEQ.b CODE_B6C380			;$B6C366
	LDA.w #$000D				;$B6C368
	STA.b $5A,x				;$B6C36B
	LDA.b $5E,x				;$B6C36D
	JSR.w CODE_B6C43A			;$B6C36F
	LDA.w #$0763				;$B6C372
	JSL.l queue_sound_effect		;$B6C375
	LDA.w #$0565				;$B6C379
	JSL.l queue_sound_effect		;$B6C37C
CODE_B6C380:
	LDY.w active_kong_sprite		;$B6C380
	LDA.w $0016,y				;$B6C383
	CMP.b $16,x				;$B6C386
	BCC.b CODE_B6C393			;$B6C388
	LDA.b $5C,x				;$B6C38A
	JSR.w CODE_B6C44C			;$B6C38C
CODE_B6C38F:
	LDA.b $5C,x				;$B6C38F
	BRA.b CODE_B6C399			;$B6C391

CODE_B6C393:
	LDA.b $34,x				;$B6C393
	BPL.b CODE_B6C38F			;$B6C395
	LDA.b $5E,x				;$B6C397
CODE_B6C399:
	SEC					;$B6C399
	SBC.b $16,x				;$B6C39A
	EOR.b $34,x				;$B6C39C
	BPL.b CODE_B6C3B6			;$B6C39E
	LDA.b $5A,x				;$B6C3A0
	BEQ.b CODE_B6C3B6			;$B6C3A2
	STZ.b $5A,x				;$B6C3A4
	STZ.b $2E,x				;$B6C3A6
	LDA.w #$0764				;$B6C3A8
	JSL.l queue_sound_effect		;$B6C3AB
	LDA.b $34,x				;$B6C3AF
	BPL.b CODE_B6C3B6			;$B6C3B1
	INC.w $054F				;$B6C3B3
CODE_B6C3B6:
	JSR.w set_platform_hitbox_position	;$B6C3B6
	JSR.w CODE_B683B3			;$B6C3B9
	JSR.w CODE_B6C458			;$B6C3BC
	JSR.w CODE_B6C3EA			;$B6C3BF
	LDA.w #CODE_B6C3FF			;$B6C3C2
	JSL.l CODE_BB85D6			;$B6C3C5
	JML [$04F5]				;$B6C3C9

CODE_B6C3CC:
	JML [$04F5]				;$B6C3CC

CODE_B6C3CF:
	LDA.w $054F				;$B6C3CF
	BNE.b CODE_B6C3E4			;$B6C3D2
	LDA.w #$C000				;$B6C3D4
	STA.w $0026,y				;$B6C3D7
	TYX					;$B6C3DA
	INC.b $38,x				;$B6C3DB
CODE_B6C3DD:
	TYX					;$B6C3DD
	JSR.w CODE_B6C3EA			;$B6C3DE
	JML [$04F5]				;$B6C3E1

CODE_B6C3E4:
	TYX					;$B6C3E4
	STZ.b $38,x				;$B6C3E5
	JMP.w CODE_B6C349			;$B6C3E7

CODE_B6C3EA:
	JSL.l CODE_BBAB52			;$B6C3EA
	BCC.b CODE_B6C3FE			;$B6C3EE
	PLA					;$B6C3F0
	LDX.b current_sprite			;$B6C3F1
	LDY.b $62,x				;$B6C3F3
	BEQ.b CODE_B6C3FB			;$B6C3F5
	JSL.l CODE_B6F3E7			;$B6C3F7
CODE_B6C3FB:
	JML [$04F5]				;$B6C3FB

CODE_B6C3FE:
	RTS					;$B6C3FE

CODE_B6C3FF:
	LDX.b current_sprite			;$B6C3FF
	LDA.b $68,x				;$B6C401
	XBA					;$B6C403
	AND.w #$FF00				;$B6C404
	STA.b $68,x				;$B6C407
	LDA.w #$001A				;$B6C409
	JSL.l CODE_BEC01B			;$B6C40C
	BCC.b CODE_B6C439			;$B6C410
	BEQ.b CODE_B6C439			;$B6C412
	LDX.b alternate_sprite			;$B6C414
	LDA.b $2E,x				;$B6C416
	BMI.b CODE_B6C439			;$B6C418
	LDY.b $00,x				;$B6C41A
	LDX.b current_sprite			;$B6C41C
	LDA.w #$0600				;$B6C41E
	CPY.w #!sprite_dixie_kong		;$B6C421
	BEQ.b CODE_B6C429			;$B6C424
	LDA.w #$0A00				;$B6C426
CODE_B6C429:
	PHA					;$B6C429
	SEP.b #$20				;$B6C42A
	LDA.b #$01				;$B6C42C
	STA.b $68,x				;$B6C42E
	REP.b #$20				;$B6C430
	PLA					;$B6C432
	CMP.b $6A,x				;$B6C433
	BCC.b CODE_B6C439			;$B6C435
	STA.b $6A,x				;$B6C437
CODE_B6C439:
	RTL					;$B6C439

CODE_B6C43A:
	SEC					;$B6C43A
	SBC.b $16,x				;$B6C43B
	EOR.b $34,x				;$B6C43D
	BPL.b CODE_B6C44B			;$B6C43F
	LDA.b $34,x				;$B6C441
	BMI.b CODE_B6C44B			;$B6C443
CODE_B6C445:
	EOR.w #$FFFF				;$B6C445
	INC					;$B6C448
	STA.b $34,x				;$B6C449
CODE_B6C44B:
	RTS					;$B6C44B

CODE_B6C44C:
	SEC					;$B6C44C
	SBC.b $16,x				;$B6C44D
	EOR.b $34,x				;$B6C44F
	BPL.b CODE_B6C44B			;$B6C451
	LDA.b $34,x				;$B6C453
	BMI.b CODE_B6C445			;$B6C455
	RTS					;$B6C457

CODE_B6C458:
	LDX.b current_sprite			;$B6C458
	LDY.b $62,x				;$B6C45A
	LDA.b $12,x				;$B6C45C
	CLC					;$B6C45E
	ADC.w #$001E				;$B6C45F
	STA.w $0012,y				;$B6C462
	LDA.b $16,x				;$B6C465
	STA.w $0016,y				;$B6C467
	LDA.b $54,x				;$B6C46A
	CLC					;$B6C46C
	ADC.w #$001E				;$B6C46D
	STA.w $0054,y				;$B6C470
	LDA.b $56,x				;$B6C473
	STA.w $0056,y				;$B6C475
	LDA.b $2C,x				;$B6C478
	CLC					;$B6C47A
	ADC.w #$001E				;$B6C47B
	STA.w $002C,y				;$B6C47E
	LDA.b $32,x				;$B6C481
	STA.w $0032,y				;$B6C483
	LDA.b $26,x				;$B6C486
	STA.w $0026,y				;$B6C488
	LDA.b $58,x				;$B6C48B
	STA.w $0058,y				;$B6C48D
	RTS					;$B6C490

nibbla_handler_main:
	LDA.w $1B6B				;$B6C491
	BNE.b CODE_B6C500			;$B6C494
	LDY.w #$0154				;$B6C496
	JSL.l CODE_BB8585			;$B6C499
	LDX.b current_sprite			;$B6C49D
	LDY.b alternate_sprite			;$B6C49F
	STY.w $1B6B				;$B6C4A1
	LDA.b $62,x				;$B6C4A4
	STA.w $005E,y				;$B6C4A6
	STA.w $0016,y				;$B6C4A9
	LDA.b $5E,x				;$B6C4AC
	STA.w $006A,y				;$B6C4AE
	LDA.b $60,x				;$B6C4B1
	STA.w $006C,y				;$B6C4B3
	LDY.w active_kong_sprite		;$B6C4B6
	LDA.w $0012,y				;$B6C4B9
	CMP.b $5E,x				;$B6C4BC
	BCC.b CODE_B6C4CD			;$B6C4BE
	CMP.b $60,x				;$B6C4C0
	BCC.b CODE_B6C4CD			;$B6C4C2
	LDA.w $196D				;$B6C4C4
	SEC					;$B6C4C7
	SBC.w #$0010				;$B6C4C8
	BRA.b CODE_B6C4D4			;$B6C4CB

CODE_B6C4CD:
	LDA.w $196D				;$B6C4CD
	CLC					;$B6C4D0
	ADC.w #$0110				;$B6C4D1
CODE_B6C4D4:
	LDY.b alternate_sprite			;$B6C4D4
	STA.w $0012,y				;$B6C4D6
	LDA.b $06,x				;$B6C4D9
	STA.w $0006,y				;$B6C4DB
	LDX.w active_kong_sprite		;$B6C4DE
	LDA.w $0012,y				;$B6C4E1
	SEC					;$B6C4E4
	SBC.b $12,x				;$B6C4E5
	EOR.w $001E,y				;$B6C4E7
	ASL					;$B6C4EA
	BPL.b CODE_B6C500			;$B6C4EB
	LDA.w $001E,y				;$B6C4ED
	EOR.w #$4000				;$B6C4F0
	STA.w $001E,y				;$B6C4F3
	LDA.w $0030,y				;$B6C4F6
	EOR.w #$FFFF				;$B6C4F9
	INC					;$B6C4FC
	STA.w $0030,y				;$B6C4FD
CODE_B6C500:
	TYX					;$B6C500
	LDY.w active_kong_sprite		;$B6C501
	LDA.w $0012,y				;$B6C504
	CMP.b $5E,x				;$B6C507
	BCC.b CODE_B6C50F			;$B6C509
	CMP.b $60,x				;$B6C50B
	BCC.b CODE_B6C53E			;$B6C50D
CODE_B6C50F:
	JSL.l CODE_BBAB29			;$B6C50F
	BCC.b CODE_B6C53E			;$B6C513
	LDX.b current_sprite			;$B6C515
	PHX					;$B6C517
	LDA.w $1B6B				;$B6C518
	STA.b current_sprite			;$B6C51B
	JSL.l CODE_BBAB29			;$B6C51D
	BCC.b CODE_B6C53B			;$B6C521
	LDX.b current_sprite			;$B6C523
	LDY.b $68,x				;$B6C525
	JSR.w CODE_B6F3EB			;$B6C527
	JSL.l delete_sprite_handle_deallocation	;$B6C52A
	PLX					;$B6C52E
	STX.b current_sprite			;$B6C52F
	STZ.w $1B6B				;$B6C531
	JSL.l CODE_BBAB52			;$B6C534
	JML [$04F5]				;$B6C538

CODE_B6C53B:
	PLX					;$B6C53B
	STX.b current_sprite			;$B6C53C
CODE_B6C53E:
	JML [$04F5]				;$B6C53E

nibbla_head_main:
	JMP.w (DATA_B6C544,x)			;$B6C541

DATA_B6C544:
	dw CODE_B6C54A
	dw CODE_B6C571
	dw CODE_B6C5E9

CODE_B6C54A:
	LDY.w #$0156				;$B6C54A
	JSL.l CODE_BB8585			;$B6C54D
	LDX.b current_sprite			;$B6C551
	LDY.b alternate_sprite			;$B6C553
	STY.b $68,x				;$B6C555
	STX.b $5C,y				;$B6C557
	LDA.b $06,x				;$B6C559
	STA.w $0006,y				;$B6C55B
	LDA.b $1E,x				;$B6C55E
	AND.w #$4000				;$B6C560
	EOR.w $001E,y				;$B6C563
	AND.w #$4000				;$B6C566
	EOR.w $001E,y				;$B6C569
	STA.w $001E,y				;$B6C56C
	INC.b $38,x				;$B6C56F
CODE_B6C571:
	LDX.b current_sprite			;$B6C571
	LDY.w active_kong_sprite		;$B6C573
	LDA.w $0016,y				;$B6C576
	CMP.w $050F				;$B6C579
	BCC.b CODE_B6C583			;$B6C57C
	INC.b $38,x				;$B6C57E
	TXY					;$B6C580
	BRA.b CODE_B6C5E9			;$B6C581

CODE_B6C583:
	LDA.w $0012,y				;$B6C583
	CMP.b $6A,x				;$B6C586
	BCC.b CODE_B6C59C			;$B6C588
	CMP.b $6C,x				;$B6C58A
	BCS.b CODE_B6C5A3			;$B6C58C
	STA.b $5C,x				;$B6C58E
	LDY.w #$0012				;$B6C590
	PHY					;$B6C593
	LDY.w #$0404				;$B6C594
	LDA.w #$2020				;$B6C597
	BRA.b CODE_B6C5B1			;$B6C59A

CODE_B6C59C:
	LDY.b $6A,x				;$B6C59C
	LDA.w #$0030				;$B6C59E
	BRA.b CODE_B6C5A8			;$B6C5A1

CODE_B6C5A3:
	LDY.b $6C,x				;$B6C5A3
	LDA.w #$3000				;$B6C5A5
CODE_B6C5A8:
	STY.b $5C,x				;$B6C5A8
	LDY.w #$000A				;$B6C5AA
	PHY					;$B6C5AD
	LDY.w #$0404				;$B6C5AE
CODE_B6C5B1:
	STY.b $64,x				;$B6C5B1
	STA.b $60,x				;$B6C5B3
	PLY					;$B6C5B5
	LDA.b [$6A],y				;$B6C5B6
	BIT.b $30,x				;$B6C5B8
	BPL.b CODE_B6C5C0			;$B6C5BA
	EOR.w #$FFFF				;$B6C5BC
	INC					;$B6C5BF
CODE_B6C5C0:
	STA.b $62,x				;$B6C5C0
	STA.b $30,x				;$B6C5C2
	LDY.w #$000C				;$B6C5C4
	LDA.b [$6A],y				;$B6C5C7
	BIT.b $34,x				;$B6C5C9
	BPL.b CODE_B6C5D1			;$B6C5CB
	EOR.w #$FFFF				;$B6C5CD
	INC					;$B6C5D0
CODE_B6C5D1:
	STA.b $66,x				;$B6C5D1
	STA.b $34,x				;$B6C5D3
	JSR.w CODE_B6C6AA			;$B6C5D5
	JSL.l process_current_movement		;$B6C5D8
CODE_B6C5DC:
	JSR.w CODE_B6C6EA			;$B6C5DC
	JSL.l process_sprite_animation		;$B6C5DF
	STZ.w $1B6F				;$B6C5E3
	JML [$04F5]				;$B6C5E6

CODE_B6C5E9:
	TYX					;$B6C5E9
	LDY.w active_kong_sprite		;$B6C5EA
	LDA.w $0016,y				;$B6C5ED
	CMP.w $050F				;$B6C5F0
	BCS.b CODE_B6C5FA			;$B6C5F3
CODE_B6C5F5:
	DEC.b $38,x				;$B6C5F5
	JMP.w CODE_B6C583			;$B6C5F7

CODE_B6C5FA:
	LDA.w $003A,y				;$B6C5FA
	BIT.w #$0100				;$B6C5FD
	BNE.b CODE_B6C5F5			;$B6C600
	JSR.w CODE_B6C698			;$B6C602
	LDA.b $12,x				;$B6C605
	BIT.b $1E,x				;$B6C607
	BVS.b CODE_B6C619			;$B6C609
	CLC					;$B6C60B
	ADC.w #$FFC9				;$B6C60C
	STA.b $1A				;$B6C60F
	LDA.b $12,x				;$B6C611
	CLC					;$B6C613
	ADC.w #$FFFF				;$B6C614
	BRA.b CODE_B6C625			;$B6C617

CODE_B6C619:
	CLC					;$B6C619
	ADC.w #$0001				;$B6C61A
	STA.b $1A				;$B6C61D
	LDA.b $12,x				;$B6C61F
	CLC					;$B6C621
	ADC.w #$0037				;$B6C622
CODE_B6C625:
	STA.b $1C				;$B6C625
	LDA.b $16,x				;$B6C627
	CLC					;$B6C629
	ADC.w #$FFF2				;$B6C62A
	STA.b $1E				;$B6C62D
	LDA.b $16,x				;$B6C62F
	CLC					;$B6C631
	ADC.w #$0028				;$B6C632
	STA.b $20				;$B6C635
	LDA.w #$001A				;$B6C637
	LDY.w active_kong_sprite		;$B6C63A
	JSL.l CODE_B6F3AB			;$B6C63D
	BCC.b CODE_B6C65A			;$B6C641
	LDA.w #$01B8				;$B6C643
	CMP.b $40,x				;$B6C646
	BEQ.b CODE_B6C65A			;$B6C648
	LDA.w #$01B7				;$B6C64A
	CMP.b $40,x				;$B6C64D
	BEQ.b CODE_B6C65A			;$B6C64F
	JSL.l set_sprite_animation		;$B6C651
	LDY.w active_kong_sprite		;$B6C655
	LDX.b current_sprite			;$B6C658
CODE_B6C65A:
	LDA.w $0012,y				;$B6C65A
	STA.w $1C15				;$B6C65D
	LDA.w $0016,y				;$B6C660
	CLC					;$B6C663
	ADC.w #$FFF6				;$B6C664
	STA.w $1C17				;$B6C667
	LDY.w #$0006				;$B6C66A
	LDA.b [$6A],y				;$B6C66D
	STA.b $1A				;$B6C66F
	LDY.w #$0008				;$B6C671
	LDA.b [$6A],y				;$B6C674
	STA.b $1C				;$B6C676
	JSR.w CODE_B68C12			;$B6C678
	JSR.w CODE_B6C6AA			;$B6C67B
	LDY.w #$000E				;$B6C67E
	LDA.b [$6A],y				;$B6C681
	JSR.w CODE_B6F2B1			;$B6C683
	LDY.w #$0010				;$B6C686
	LDA.b [$6A],y				;$B6C689
	JSR.w CODE_B6F2C9			;$B6C68B
	LDA.w #$0001				;$B6C68E
	JSL.l process_alternate_movement	;$B6C691
	JMP.w CODE_B6C5DC			;$B6C695

CODE_B6C698:
	JSL.l populate_sprite_clipping		;$B6C698
	LDA.w #$0000				;$B6C69C
	LDX.w #$0000				;$B6C69F
	LDY.w #$0300				;$B6C6A2
	JSL.l CODE_BEC024			;$B6C6A5
	RTS					;$B6C6A9

CODE_B6C6AA:
	LDA.b $16,x				;$B6C6AA
	CMP.w $050F				;$B6C6AC
	BCS.b CODE_B6C6B6			;$B6C6AF
	LDA.w #$0080				;$B6C6B1
	STA.b $2E,x				;$B6C6B4
CODE_B6C6B6:
	CMP.w #$02F0				;$B6C6B6
	BCC.b CODE_B6C6C0			;$B6C6B9
	LDA.w #$FF80				;$B6C6BB
	STA.b $2E,x				;$B6C6BE
CODE_B6C6C0:
	LDA.b $12,x				;$B6C6C0
	CMP.b $6A,x				;$B6C6C2
	BCS.b CODE_B6C6D2			;$B6C6C4
	LDA.b $6A,x				;$B6C6C6
	STA.b $12,x				;$B6C6C8
	STZ.b $2A,x				;$B6C6CA
	LDA.b $30,x				;$B6C6CC
	BPL.b CODE_B6C6E9			;$B6C6CE
	BRA.b CODE_B6C6E1			;$B6C6D0

CODE_B6C6D2:
	CMP.b $6C,x				;$B6C6D2
	BCC.b CODE_B6C6E9			;$B6C6D4
	LDA.b $6C,x				;$B6C6D6
	DEC					;$B6C6D8
	STA.b $12,x				;$B6C6D9
	STZ.b $2A,x				;$B6C6DB
	LDA.b $30,x				;$B6C6DD
	BMI.b CODE_B6C6E9			;$B6C6DF
CODE_B6C6E1:
	EOR.w #$FFFF				;$B6C6E1
	INC					;$B6C6E4
	STA.b $30,x				;$B6C6E5
	STA.b $62,x				;$B6C6E7
CODE_B6C6E9:
	RTS					;$B6C6E9

CODE_B6C6EA:
	LDX.b current_sprite			;$B6C6EA
	LDY.b $68,x				;$B6C6EC
	LDA.b $12,x				;$B6C6EE
	STA.w $0012,y				;$B6C6F0
	LDA.b $16,x				;$B6C6F3
	STA.w $0016,y				;$B6C6F5
	RTS					;$B6C6F8

nibbla_body_main:
	JMP.w CODE_B685E6			;$B6C6F9

boss_prize_bonus_coin_main:
	JSR.w CODE_B6C70A			;$B6C6FC
	JML.l CODE_BBC81E			;$B6C6FF

boss_prize_bear_coin_main:
	JSR.w CODE_B6C70A			;$B6C703
	JML.l CODE_BBC824			;$B6C706

CODE_B6C70A:
	PHA					;$B6C70A
	PHX					;$B6C70B
	PHY					;$B6C70C
	LDA.w $005E,y				;$B6C70D
	AND.w #$00FF				;$B6C710
	ASL					;$B6C713
	TAX					;$B6C714
	JSR.w (DATA_B6C71C,x)			;$B6C715
	PLY					;$B6C718
	PLX					;$B6C719
	PLA					;$B6C71A
	RTS					;$B6C71B

DATA_B6C71C:
	dw CODE_B6C72A
	dw CODE_B6C74A
	dw CODE_B6C76A
	dw CODE_B6C78C
	dw CODE_B6C790
	dw CODE_B6C7B9
	dw CODE_B6C7C4

CODE_B6C72A:
	LDA.w #$0518				;$B6C72A
	JSL.l CODE_B28018			;$B6C72D
	LDA.w #$0217				;$B6C731
	JSL.l CODE_B28018			;$B6C734
	LDA.w #$0119				;$B6C738
	JSL.l CODE_B28018			;$B6C73B
	LDA.w $005E,y				;$B6C73F
	XBA					;$B6C742
	STA.w $005E,y				;$B6C743
	JSR.w CODE_B6C7C8			;$B6C746
	RTS					;$B6C749

CODE_B6C74A:
	JSL.l process_current_movement		;$B6C74A
	BCC.b CODE_B6C75C			;$B6C74E
	INC.b $5E,x				;$B6C750
	STZ.b $30,x				;$B6C752
	JSR.w CODE_B6C7E2			;$B6C754
	LDA.w #$0004				;$B6C757
	STA.b $5A,x				;$B6C75A
CODE_B6C75C:
	LDA.b $2E,x				;$B6C75C
	BMI.b CODE_B6C766			;$B6C75E
	LDA.w #$3000				;$B6C760
	JSR.w CODE_B6F23E			;$B6C763
CODE_B6C766:
	JSR.w CODE_B6C7C8			;$B6C766
	RTS					;$B6C769

CODE_B6C76A:
	JSL.l process_current_movement		;$B6C76A
	LDA.b $16,x				;$B6C76E
	CMP.b $64,x				;$B6C770
	BCC.b CODE_B6C788			;$B6C772
	LDA.b $2E,x				;$B6C774
	CMP.w #$0180				;$B6C776
	BCS.b CODE_B6C785			;$B6C779
	STZ.b $2E,x				;$B6C77B
	LDA.b $64,x				;$B6C77D
	STA.b $16,x				;$B6C77F
	INC.b $5E,x				;$B6C781
	BRA.b CODE_B6C788			;$B6C783

CODE_B6C785:
	JSR.w CODE_B6C7E2			;$B6C785
CODE_B6C788:
	JSR.w CODE_B6C7C8			;$B6C788
	RTS					;$B6C78B

CODE_B6C78C:
	JSR.w CODE_B6C7C8			;$B6C78C
	RTS					;$B6C78F

CODE_B6C790:
	JSL.l process_current_movement		;$B6C790
	BCC.b CODE_B6C7B8			;$B6C794
	LDA.w #$0082				;$B6C796
	STA.w $1BCF				;$B6C799
	LDA.b $5C,x				;$B6C79C
	BNE.b CODE_B6C7B0			;$B6C79E
	LDA.w #$0001				;$B6C7A0
	JSL.l CODE_B2800F			;$B6C7A3
	LDX.b current_sprite			;$B6C7A7
	LDA.b $6C,x				;$B6C7A9
	JSL.l CODE_BBC800			;$B6C7AB
	RTS					;$B6C7AF

CODE_B6C7B0:
	LDA.w #$0002				;$B6C7B0
	TSB.w $05B1				;$B6C7B3
	INC.b $38,x				;$B6C7B6
CODE_B6C7B8:
	RTS					;$B6C7B8

CODE_B6C7B9:
	JSL.l process_current_movement		;$B6C7B9
	BCC.b CODE_B6C7C4			;$B6C7BD
	LDA.w #$0003				;$B6C7BF
	STA.b $5E,x				;$B6C7C2
CODE_B6C7C4:
	JSR.w CODE_B6C7C8			;$B6C7C4
	RTS					;$B6C7C7

CODE_B6C7C8:
	JSL.l populate_sprite_clipping		;$B6C7C8
	JSL.l CODE_BEC012			;$B6C7CC
	BCC.b CODE_B6C7E1			;$B6C7D0
	JSL.l CODE_B880B7			;$B6C7D2
	BCC.b CODE_B6C7E1			;$B6C7D6
	JSR.w CODE_B6F1A3			;$B6C7D8
	LDA.w #$0082				;$B6C7DB
	STA.w $1BCF				;$B6C7DE
CODE_B6C7E1:
	RTS					;$B6C7E1

CODE_B6C7E2:
	LDA.b $2E,x				;$B6C7E2
	CMP.w #$8000				;$B6C7E4
	ROR					;$B6C7E7
	EOR.w #$FFFF				;$B6C7E8
	INC					;$B6C7EB
	STA.b $2E,x				;$B6C7EC
	LDA.b $64,x				;$B6C7EE
	STA.b $16,x				;$B6C7F0
	RTS					;$B6C7F2

boss_prize_item_main:
	JSR.w CODE_B6C70A			;$B6C7F3
	JMP.w (DATA_B6C7F9,x)			;$B6C7F6

DATA_B6C7F9:
	dw CODE_B6C7FD
	dw CODE_B6C868

CODE_B6C7FD:
	JSL.l populate_sprite_clipping		;$B6C7FD
	JSL.l CODE_BEC012			;$B6C801
	BCC.b CODE_B6C865			;$B6C805
	JSL.l CODE_B880B7			;$B6C807
	BCC.b CODE_B6C865			;$B6C80B
	LDA.w #$000A				;$B6C80D
	STA.b $6C,x				;$B6C810
	JSR.w CODE_B6F1A3			;$B6C812
	INC.b $38,x				;$B6C815
	LDA.w #$0006				;$B6C817
	STA.b $5E,x				;$B6C81A
	LDA.w #$0014				;$B6C81C
	STA.b $5A,x				;$B6C81F
	LDX.w #$0607				;$B6C821
	LDA.w #$009C				;$B6C824
CODE_B6C827:
	INX					;$B6C827
	INX					;$B6C828
	CLC					;$B6C829
	ADC.w #$0014				;$B6C82A
	LDY.b $00,x				;$B6C82D
	BNE.b CODE_B6C827			;$B6C82F
	LDX.b current_sprite			;$B6C831
	STA.b $62,x				;$B6C833
	LDA.w #$0010				;$B6C835
	STA.b $64,x				;$B6C838
	LDA.w #$0014				;$B6C83A
	STA.b $66,x				;$B6C83D
	LDA.w #$0032				;$B6C83F
	STA.b $6A,x				;$B6C842
	LDA.w #$8000				;$B6C844
	STA.b $26,x				;$B6C847
	LDA.b $12,x				;$B6C849
	SEC					;$B6C84B
	SBC.w $196D				;$B6C84C
	STA.b $12,x				;$B6C84F
	LDA.b $16,x				;$B6C851
	SEC					;$B6C853
	SBC.w $1973				;$B6C854
	STA.b $16,x				;$B6C857
	LDY.w #$025C				;$B6C859
	JSL.l CODE_BB85B8			;$B6C85C
	LDX.b alternate_sprite			;$B6C860
	STX.w $18E7				;$B6C862
CODE_B6C865:
	JML [$04F5]				;$B6C865

CODE_B6C868:
	JSL.l process_current_movement		;$B6C868
	BCC.b CODE_B6C878			;$B6C86C
	LDA.b $68,x				;$B6C86E
	JSL.l CODE_B4801E			;$B6C870
	JSL.l delete_sprite_handle_deallocation	;$B6C874
CODE_B6C878:
	DEC.b $6C,x				;$B6C878
	BNE.b CODE_B6C883			;$B6C87A
	LDA.w #$0778				;$B6C87C
	JSL.l queue_sound_effect		;$B6C87F
CODE_B6C883:
	JML [$04F5]				;$B6C883

karbine_main:
	JMP.w (DATA_B6C889,x)			;$B6C886

DATA_B6C889:
	dw CODE_B6C891
	dw CODE_B6C89E
	dw CODE_B6C8C9
	dw CODE_B6C8D6

CODE_B6C891:
	TYA					;$B6C891
	CLC					;$B6C892
	ADC.w #$FFF0				;$B6C893
	TAX					;$B6C896
	JSR.w CODE_B6F371			;$B6C897
	LDX.b current_sprite			;$B6C89A
	INC.b $38,x				;$B6C89C
CODE_B6C89E:
	JSR.w CODE_B6C9BE			;$B6C89E
	JSL.l process_current_movement		;$B6C8A1
	LDY.w #$0014				;$B6C8A5
	JSR.w CODE_B6C9E8			;$B6C8A8
	LDY.w #$0014				;$B6C8AB
	JSR.w CODE_B6C9D3			;$B6C8AE
	TXA					;$B6C8B1
	CLC					;$B6C8B2
	ADC.w #$FFF0				;$B6C8B3
	TAX					;$B6C8B6
	JSR.w CODE_B6F381			;$B6C8B7
	BCC.b CODE_B6C8C6			;$B6C8BA
	JSR.w CODE_B6C958			;$B6C8BC
	LDA.w #$060C				;$B6C8BF
	JSL.l queue_sound_effect		;$B6C8C2
CODE_B6C8C6:
	JMP.w return_handle_anim_and_despawn	;$B6C8C6

CODE_B6C8C9:
	TYA					;$B6C8C9
	CLC					;$B6C8CA
	ADC.w #$FFF0				;$B6C8CB
	TAX					;$B6C8CE
	JSR.w CODE_B6F371			;$B6C8CF
	LDX.b current_sprite			;$B6C8D2
	INC.b $38,x				;$B6C8D4
CODE_B6C8D6:
	JSR.w CODE_B6C9BE			;$B6C8D6
	JSR.w CODE_B6C91A			;$B6C8D9
	JSL.l process_current_movement		;$B6C8DC
	LDY.w #$0014				;$B6C8E0
	JSR.w CODE_B6C9E8			;$B6C8E3
	LDY.w #$0014				;$B6C8E6
	JSR.w CODE_B6C9D3			;$B6C8E9
	TXA					;$B6C8EC
	CLC					;$B6C8ED
	ADC.w #$FFF0				;$B6C8EE
	TAX					;$B6C8F1
	JSR.w CODE_B6F381			;$B6C8F2
	BCC.b CODE_B6C917			;$B6C8F5
	JSR.w CODE_B6C958			;$B6C8F7
	LDA.w #$060C				;$B6C8FA
	JSL.l queue_sound_effect		;$B6C8FD
	LDY.b alternate_sprite			;$B6C901
	LDX.w active_kong_sprite		;$B6C903
	LDA.b $16,x				;$B6C906
	LDX.b current_sprite			;$B6C908
	CMP.b $68,x				;$B6C90A
	BCC.b CODE_B6C910			;$B6C90C
	LDA.b $68,x				;$B6C90E
CODE_B6C910:
	CLC					;$B6C910
	ADC.w #$FFC4				;$B6C911
	STA.w $0064,y				;$B6C914
CODE_B6C917:
	JMP.w return_handle_anim_and_despawn	;$B6C917

CODE_B6C91A:
	TYX					;$B6C91A
	LDY.w active_kong_sprite		;$B6C91B
	LDA.w $0016,y				;$B6C91E
	CLC					;$B6C921
	ADC.w #$FFE2				;$B6C922
	STA.b $5E,x				;$B6C925
	LDA.b $6A,x				;$B6C927
	CMP.b $5E,x				;$B6C929
	BCS.b CODE_B6C933			;$B6C92B
	LDA.b $6C,x				;$B6C92D
	CMP.b $5E,x				;$B6C92F
	BCS.b CODE_B6C935			;$B6C931
CODE_B6C933:
	STA.b $5E,x				;$B6C933
CODE_B6C935:
	LDA.b $16,x				;$B6C935
	SEC					;$B6C937
	SBC.b $5E,x				;$B6C938
	PHP					;$B6C93A
	BPL.b CODE_B6C941			;$B6C93B
	EOR.w #$FFFF				;$B6C93D
	INC					;$B6C940
CODE_B6C941:
	LDY.b $1C,x				;$B6C941
	CMP.w #$001E				;$B6C943
	BCS.b CODE_B6C94B			;$B6C946
	LDY.w #$0040				;$B6C948
CODE_B6C94B:
	TYA					;$B6C94B
	PLP					;$B6C94C
	BPL.b CODE_B6C953			;$B6C94D
	EOR.w #$FFFF				;$B6C94F
	INC					;$B6C952
CODE_B6C953:
	STA.b $66,x				;$B6C953
	STA.b $34,x				;$B6C955
	RTS					;$B6C957

CODE_B6C958:
	LDX.b current_sprite			;$B6C958
	LDY.w #$008A				;$B6C95A
	JSL.l CODE_BB8585			;$B6C95D
	LDY.b alternate_sprite			;$B6C961
	LDX.b current_sprite			;$B6C963
	LDA.b $18,x				;$B6C965
	STA.w $0066,y				;$B6C967
	LDA.b $5C,x				;$B6C96A
	STA.w $0062,y				;$B6C96C
	LDA.b $68,x				;$B6C96F
	STA.w $0064,y				;$B6C971
	LDA.b $2C,x				;$B6C974
	STA.w $002C,y				;$B6C976
	LDA.b $32,x				;$B6C979
	STA.w $0032,y				;$B6C97B
	LDA.w #$1400				;$B6C97E
	STA.w $005C,y				;$B6C981
	STA.w CPU.dividen_low			;$B6C984
	LDA.b $1A,x				;$B6C987
	STA.w $006A,y				;$B6C989
	SEP.b #$20				;$B6C98C
	PHA					;$B6C98E
	STA.w CPU.divisor			;$B6C98F
	REP.b #$20				;$B6C992
	JSL.l stall_cpu_time			;$B6C994
	LDA.w CPU.divide_result			;$B6C998
	STA.w $005E,y				;$B6C99B
	LDA.w #$1C00				;$B6C99E
	STA.w CPU.dividen_low			;$B6C9A1
	SEP.b #$20				;$B6C9A4
	PLA					;$B6C9A6
	STA.w CPU.divisor			;$B6C9A7
	REP.b #$20				;$B6C9AA
	JSL.l stall_cpu_time			;$B6C9AC
	LDA.w CPU.divide_result			;$B6C9B0
	STA.w $0044,y				;$B6C9B3
	LDA.w #$029E				;$B6C9B6
	JSL.l set_sprite_animation		;$B6C9B9
	RTS					;$B6C9BD

CODE_B6C9BE:
	LDA.w $0012,y				;$B6C9BE
	SEC					;$B6C9C1
	SBC.w $002C,y				;$B6C9C2
	STA.w $0012,y				;$B6C9C5
	LDA.w $0016,y				;$B6C9C8
	SEC					;$B6C9CB
	SBC.w $0032,y				;$B6C9CC
	STA.w $0016,y				;$B6C9CF
	RTS					;$B6C9D2

CODE_B6C9D3:
	LDA.w $1973 				;$B6C9D3 / Camera Y
	CLC					;$B6C9D6
	ADC.w #$0080				;$B6C9D7
	SEC					;$B6C9DA
	SBC.b $16,x				;$B6C9DB
	JSR.w CODE_B6C9FD			;$B6C9DD
	STA.b $32,x				;$B6C9E0
	CLC					;$B6C9E2
	ADC.b $16,x				;$B6C9E3
	STA.b $16,x				;$B6C9E5
	RTS					;$B6C9E7

CODE_B6C9E8:
	LDA.w $196D 				;$B6C9E8 / Camera X
	CLC					;$B6C9EB
	ADC.w #$0080				;$B6C9EC
	SEC					;$B6C9EF
	SBC.b $12,x				;$B6C9F0
	JSR.w CODE_B6C9FD			;$B6C9F2
	STA.b $2C,x				;$B6C9F5
	CLC					;$B6C9F7
	ADC.b $12,x				;$B6C9F8
	STA.b $12,x				;$B6C9FA
	RTS					;$B6C9FC

CODE_B6C9FD:
	PHP					;$B6C9FD
	PHX					;$B6C9FE
	BPL.b CODE_B6CA05			;$B6C9FF
	EOR.w #$FFFF				;$B6CA01
	INC					;$B6CA04
CODE_B6CA05:
	SEP.b #$20				;$B6CA05
	STA.w PPU.fixed_point_mul_A		;$B6CA07
	XBA					;$B6CA0A
	STA.w PPU.fixed_point_mul_A		;$B6CA0B
	TYA					;$B6CA0E
	STA.w PPU.fixed_point_mul_B		;$B6CA0F
	LDX.w PPU.multiply_result_word		;$B6CA12
	STX.w CPU.dividen			;$B6CA15
	LDA.b #$50				;$B6CA18
	STA.w CPU.divisor			;$B6CA1A
	REP.b #$20				;$B6CA1D
	JSL.l stall_cpu_time			;$B6CA1F
	LDA.w CPU.divide_result			;$B6CA23
	PLX					;$B6CA26
	PLP					;$B6CA27
	BPL.b CODE_B6CA2E			;$B6CA28
	EOR.w #$FFFF				;$B6CA2A
	INC					;$B6CA2D
CODE_B6CA2E:
	RTS					;$B6CA2E

karbine_fireball_main:
	JMP.w (DATA_B6CA32,x)			;$B6CA2F

DATA_B6CA32:
	dw CODE_B6CA38
	dw CODE_B6CA67
	dw CODE_B6CAB5

CODE_B6CA38:
	JSR.w CODE_B6CABF			;$B6CA38
	TXY					;$B6CA3B
	JSR.w CODE_B6C9BE			;$B6CA3C
	JSL.l process_current_movement		;$B6CA3F
	LDA.b $5D,x				;$B6CA43
	AND.w #$00FF				;$B6CA45
	TAY					;$B6CA48
	PHY					;$B6CA49
	JSR.w CODE_B6C9E8			;$B6CA4A
	PLY					;$B6CA4D
	JSR.w CODE_B6C9D3			;$B6CA4E
	LDA.b $5C,x				;$B6CA51
	SEC					;$B6CA53
	SBC.b $5E,x				;$B6CA54
	BPL.b CODE_B6CA62			;$B6CA56
	INC.b $38,x				;$B6CA58
	LDA.w #$0145				;$B6CA5A
	STA.b $5A,x				;$B6CA5D
	LDA.w #$0000				;$B6CA5F
CODE_B6CA62:
	STA.b $5C,x				;$B6CA62
	JMP.w CODE_B685E6			;$B6CA64

CODE_B6CA67:
	JSR.w CODE_B6CABF			;$B6CA67
	LDA.b $2E,x				;$B6CA6A
	PHA					;$B6CA6C
	JSL.l process_current_movement		;$B6CA6D
	LDA.b $1A,x				;$B6CA71
	PLY					;$B6CA73
	CMP.w #$0014				;$B6CA74
	BCS.b CODE_B6CAB2			;$B6CA77
	LDA.w #$0030				;$B6CA79
	JSL.l CODE_BFF006			;$B6CA7C
	TYA					;$B6CA80
	LSR					;$B6CA81
	LSR					;$B6CA82
	SEC					;$B6CA83
	SBC.b $2E,x				;$B6CA84
	STA.b $2E,x				;$B6CA86
	LDA.b $66,x				;$B6CA88
	ASL					;$B6CA8A
	STA.b $66,x				;$B6CA8B
	LDA.w #$011A				;$B6CA8D
	STA.b $5A,x				;$B6CA90
	INC.b $38,x				;$B6CA92
	STZ.b $2A,x				;$B6CA94
	LDA.w #$00EA				;$B6CA96
	STA.b $0E,x				;$B6CA99
	JSL.l CODE_BBAB46			;$B6CA9B
	BCC.b CODE_B6CAA4			;$B6CA9F
	JML [$04F5]				;$B6CAA1

CODE_B6CAA4:
	LDA.w #$02A0				;$B6CAA4
	JSL.l set_sprite_animation		;$B6CAA7
	LDY.w #$0084				;$B6CAAB
	JSL.l CODE_BB8585			;$B6CAAE
CODE_B6CAB2:
	JMP.w CODE_B685E6			;$B6CAB2

CODE_B6CAB5:
	JSR.w CODE_B6CABF			;$B6CAB5
	JSL.l process_current_movement		;$B6CAB8
	JMP.w CODE_B6BF79			;$B6CABC

CODE_B6CABF:
	TYX					;$B6CABF
	LDA.b $60,x				;$B6CAC0
	BEQ.b CODE_B6CACF			;$B6CAC2
	JSL.l populate_sprite_clipping		;$B6CAC4
	LDA.w #$0000				;$B6CAC8
	JSL.l CODE_BEC009			;$B6CACB
CODE_B6CACF:
	RTS					;$B6CACF

krosshair_fireball_main:
	JMP.w (DATA_B6CAD3,x)			;$B6CAD0

DATA_B6CAD3:
	dw CODE_B6CAD7
	dw CODE_B6CB02

CODE_B6CAD7:
	JSR.w CODE_B6CB93			;$B6CAD7
	TXY					;$B6CADA
	JSR.w CODE_B6C9BE			;$B6CADB
	JSR.w CODE_B6CB36			;$B6CADE
	LDA.b $5D,x				;$B6CAE1
	AND.w #$00FF				;$B6CAE3
	TAY					;$B6CAE6
	PHY					;$B6CAE7
	JSR.w CODE_B6CBC7			;$B6CAE8
	PLY					;$B6CAEB
	JSR.w CODE_B6CBAE			;$B6CAEC
	LDA.b $5C,x				;$B6CAEF
	SEC					;$B6CAF1
	SBC.b $5E,x				;$B6CAF2
	BPL.b CODE_B6CAFB			;$B6CAF4
	INC.b $38,x				;$B6CAF6
	LDA.w #$0000				;$B6CAF8
CODE_B6CAFB:
	STA.b $5C,x				;$B6CAFB
	STZ.b $26,x				;$B6CAFD
	JMP.w CODE_B685E6			;$B6CAFF

CODE_B6CB02:
	JSR.w CODE_B6CB93			;$B6CB02
	TXY					;$B6CB05
	JSR.w CODE_B6C9BE			;$B6CB06
	JSR.w CODE_B6CB36			;$B6CB09
	LDA.b $5D,x				;$B6CB0C
	AND.w #$00FF				;$B6CB0E
	TAY					;$B6CB11
	PHY					;$B6CB12
	JSR.w CODE_B6C9E8			;$B6CB13
	PLY					;$B6CB16
	JSR.w CODE_B6C9D3			;$B6CB17
	LDA.b $5C,x				;$B6CB1A
	CLC					;$B6CB1C
	ADC.b $5E,x				;$B6CB1D
	CMP.w #$2000				;$B6CB1F
	BCC.b CODE_B6CB27			;$B6CB22
	LDA.w #$2000				;$B6CB24
CODE_B6CB27:
	STA.b $5C,x				;$B6CB27
	LDA.b $2E,x				;$B6CB29
	BMI.b CODE_B6CB33			;$B6CB2B
	LDA.w #$1000				;$B6CB2D
	JSR.w CODE_B6F23E			;$B6CB30
CODE_B6CB33:
	JMP.w CODE_B6BF79			;$B6CB33

CODE_B6CB36:
	LDX.b current_sprite			;$B6CB36
	LDA.b $68,x				;$B6CB38
	BEQ.b CODE_B6CB4B			;$B6CB3A
	LDA.w #$0001				;$B6CB3C
	JSL.l process_alternate_movement	;$B6CB3F
	LDA.b $2E,x				;$B6CB43
	CLC					;$B6CB45
	ADC.b $66,x				;$B6CB46
	STA.b $2E,x				;$B6CB48
	RTS					;$B6CB4A

CODE_B6CB4B:
	LDA.b $5A,x				;$B6CB4B
	AND.w #$FF00				;$B6CB4D
	LDY.b $60,x				;$B6CB50
	BNE.b CODE_B6CB5C			;$B6CB52
	ORA.w #$001A				;$B6CB54
	JSL.l process_alternate_movement	;$B6CB57
	RTS					;$B6CB5B

CODE_B6CB5C:
	ORA.w #$0045				;$B6CB5C
	LDY.b $2E,x				;$B6CB5F
	PHY					;$B6CB61
	JSL.l process_alternate_movement	;$B6CB62
	LDA.b $1A,x				;$B6CB66
	PLY					;$B6CB68
	CMP.w #$0014				;$B6CB69
	BCS.b CODE_B6CB90			;$B6CB6C
	LDA.w #$0030				;$B6CB6E
	JSL.l CODE_BFF006			;$B6CB71
	INC.b $68,x				;$B6CB75
	LDA.w #$FD80				;$B6CB77
	STA.b $2E,x				;$B6CB7A
	LDA.w #$00C0				;$B6CB7C
	STA.b $0E,x				;$B6CB7F
	LDY.w #$0146				;$B6CB81
	JSL.l CODE_BB8585			;$B6CB84
	LDX.b alternate_sprite			;$B6CB88
	LDA.w #$2000				;$B6CB8A
	JSR.w CODE_B6F23E			;$B6CB8D
CODE_B6CB90:
	LDX.b current_sprite			;$B6CB90
	RTS					;$B6CB92

CODE_B6CB93:
	TYX					;$B6CB93
	LDA.b $60,x				;$B6CB94
	BEQ.b CODE_B6CBAD			;$B6CB96
	JSL.l populate_sprite_clipping		;$B6CB98
	LDA.w #$0000				;$B6CB9C
	JSL.l CODE_BEC009			;$B6CB9F
	LDA.w #$0040				;$B6CBA3
	LDY.w #$0038				;$B6CBA6
	JSL.l check_sprite_collision		;$B6CBA9
CODE_B6CBAD:
	RTS					;$B6CBAD

CODE_B6CBAE:
	LDA.w $1973				;$B6CBAE
	CLC					;$B6CBB1
	ADC.w #$0080				;$B6CBB2
	SEC					;$B6CBB5
	SBC.b $16,x				;$B6CBB6
	JSR.w CODE_B6C9FD			;$B6CBB8
	EOR.w #$FFFF				;$B6CBBB
	INC					;$B6CBBE
	STA.b $32,x				;$B6CBBF
	CLC					;$B6CBC1
	ADC.b $16,x				;$B6CBC2
	STA.b $16,x				;$B6CBC4
	RTS					;$B6CBC6

CODE_B6CBC7:
	LDA.w $196D				;$B6CBC7
	CLC					;$B6CBCA
	ADC.w #$0080				;$B6CBCB
	SEC					;$B6CBCE
	SBC.b $12,x				;$B6CBCF
	JSR.w CODE_B6C9FD			;$B6CBD1
	EOR.w #$FFFF				;$B6CBD4
	INC					;$B6CBD7
	STA.b $2C,x				;$B6CBD8
	CLC					;$B6CBDA
	ADC.b $12,x				;$B6CBDB
	STA.b $12,x				;$B6CBDD
	RTS					;$B6CBDF

gleamin_bream_main:
	JMP.w (DATA_B6CBE3,x)			;$B6CBE0

DATA_B6CBE3:
	dw CODE_B6CBEB
	dw CODE_B6CBF4
	dw CODE_B6CBF4
	dw CODE_B6CC7F

CODE_B6CBEB:
	TYX					;$B6CBEB
	INC.b $38,x				;$B6CBEC
	JSR.w invert_max_x_speed_if_needed	;$B6CBEE
	JSR.w CODE_B6CC8B			;$B6CBF1
CODE_B6CBF4:
	TYX					;$B6CBF4
	DEC.b $68,x				;$B6CBF5
	BPL.b CODE_B6CC66			;$B6CBF7
	INC.b $68,x				;$B6CBF9
	JSL.l populate_sprite_clipping		;$B6CBFB
	LDA.w #$0000				;$B6CBFF
	LDX.w #$0000				;$B6CC02
	LDY.w #$00A0				;$B6CC05
	JSL.l CODE_BEC024			;$B6CC08
	BCC.b CODE_B6CC66			;$B6CC0C
	CMP.w #$0002				;$B6CC0E
	BNE.b CODE_B6CC66			;$B6CC11
	LDA.w #$0662				;$B6CC13
	JSL.l queue_sound_effect		;$B6CC16
	LDA.w #$0763				;$B6CC1A
	JSL.l queue_sound_effect		;$B6CC1D
	LDA.b $12,x				;$B6CC21
	CMP.w $0012,y				;$B6CC23
	BCS.b CODE_B6CC32			;$B6CC26
	LDY.w #$0300				;$B6CC28
	LDA.b $2A,x				;$B6CC2B
	ADC.w #$FE80				;$B6CC2D
	BRA.b CODE_B6CC3B			;$B6CC30

CODE_B6CC32:
	LDY.w #$FD00				;$B6CC32
	LDA.b $2A,x				;$B6CC35
	CLC					;$B6CC37
	ADC.w #$0180				;$B6CC38
CODE_B6CC3B:
	STA.b $2A,x				;$B6CC3B
	LDA.w #$0013				;$B6CC3D
	JSL.l CODE_B88069			;$B6CC40
	BCS.b CODE_B6CC4F			;$B6CC44
	STY.w $17CA				;$B6CC46
	STZ.w $17CC				;$B6CC49
	STZ.w $17CE				;$B6CC4C
CODE_B6CC4F:
	LDA.w #$000F				;$B6CC4F
	STA.b $68,x				;$B6CC52
	LDA.b $6C,x				;$B6CC54
	STA.w $1B6F				;$B6CC56
	LDA.w #$0001				;$B6CC59
	STA.w $15E6				;$B6CC5C
	LDA.w #$0273				;$B6CC5F
	JSL.l set_sprite_animation		;$B6CC62
CODE_B6CC66:
	JSL.l process_current_movement		;$B6CC66
	LDA.b $12,x				;$B6CC6A
	CLC					;$B6CC6C
	ADC.w #$FF7A				;$B6CC6D
	STA.w $1B77				;$B6CC70
	LDA.b $16,x				;$B6CC73
	CLC					;$B6CC75
	ADC.w #$FF98				;$B6CC76
	STA.w $1B79				;$B6CC79
	JMP.w return_handle_anim_and_despawn	;$B6CC7C

CODE_B6CC7F:
	TYX					;$B6CC7F
	JSR.w CODE_B6F284			;$B6CC80
	JSR.w CODE_B6CC8B			;$B6CC83
	DEC.b $38,x				;$B6CC86
	JMP.w CODE_B6CBF4			;$B6CC88

CODE_B6CC8B:
	SEP.b #$20				;$B6CC8B
	LDA.b $6A,x				;$B6CC8D
	STA.w $1B6D				;$B6CC8F
	LDA.b $6B,x				;$B6CC92
	STA.w $1B6B				;$B6CC94
	REP.b #$20				;$B6CC97
	RTS					;$B6CC99


unknown_sprite_049C_main:
	TYX					;$B6CC9A
	DEC.b $5C,x				;$B6CC9B
	BMI.b CODE_B6CCA3			;$B6CC9D
	BNE.b CODE_B6CCA6			;$B6CC9F
	STZ.b $26,x				;$B6CCA1
CODE_B6CCA3:
	JMP.w CODE_B685E6			;$B6CCA3

CODE_B6CCA6:
	JML [$04F5]				;$B6CCA6


big_smoke_cloud_main:
	JSL.l process_current_movement		;$B6CCA9
	JMP.w CODE_B685E6			;$B6CCAD


knautilus_fireball_shooter_main:
	JML [$04F5]				;$B6CCB0


top_of_cotton_top_cove_waterfall_main:
	JMP.w CODE_B685E6			;$B6CCB3


belcha_main:
	LDA.w timestop_flags			;$B6CCB6
	BIT.w #$0004				;$B6CCB9
	BNE.b CODE_B6CCD9			;$B6CCBC
	JMP.w (DATA_B6CCC1,x)			;$B6CCBE

DATA_B6CCC1:
	dw CODE_B6CCF3
	dw CODE_B6CD65
	dw CODE_B6CD72
	dw CODE_B6CD99
	dw CODE_B6CDC9
	dw CODE_B6CDEF
	dw CODE_B6CE09
	dw CODE_B6CE33
	dw CODE_B6CE6E
	dw CODE_B6CED7
	dw CODE_B6CF95
	dw CODE_B6CF97

CODE_B6CCD9:
	JSR.w CODE_B6D836			;$B6CCD9
	JML [$04F5]				;$B6CCDC

;OAM properties related
DATA_B6CCDF:
	dw $0000
	dw $0002
	dw $0006
	dw $000A
	dw $000C
	dw $000E
	dw $0020
	dw $0022
	dw $0054
	dw $0057

CODE_B6CCF3:
	LDY.w #$010C				;$B6CCF3
	JSL.l CODE_BB8585			;$B6CCF6
	LDX.b alternate_sprite			;$B6CCFA
	STX.w $1B89				;$B6CCFC
	JSL.l CODE_B6840E			;$B6CCFF
	LDA.w #$0003				;$B6CD03
	STA.w $1B75				;$B6CD06
	INC.b $38,x				;$B6CD09
	STX.w $1B6B				;$B6CD0B
	STZ.w $1C15				;$B6CD0E
CODE_B6CD11:
	LDA.w #$00E6				;$B6CD11
	CLC					;$B6CD14
	ADC.w $1C15				;$B6CD15
	TAY					;$B6CD18
	JSL.l CODE_BB85B8			;$B6CD19
	LDY.w $1C15				;$B6CD1D
	LDA.b alternate_sprite			;$B6CD20
	STA.w $1BBB,y				;$B6CD22
	TAX					;$B6CD25
	LDA.w DATA_B6CCDF,y			;$B6CD26
	CLC					;$B6CD29
	ADC.b $1E,x				;$B6CD2A
	STA.b $1E,x				;$B6CD2C
	LDA.w $1C15				;$B6CD2E
	INC					;$B6CD31
	INC					;$B6CD32
	STA.w $1C15				;$B6CD33
	CMP.w #$0014				;$B6CD36
	BNE.b CODE_B6CD11			;$B6CD39
	LDY.w #$00FA				;$B6CD3B
	JSL.l CODE_BB85B8			;$B6CD3E
	LDX.b alternate_sprite			;$B6CD42
	STX.w $1B6D				;$B6CD44
	LDA.b $1E,x				;$B6CD47
	CLC					;$B6CD49
	ADC.w #$0024				;$B6CD4A
	STA.b $1E,x				;$B6CD4D
	LDY.w #$00FC				;$B6CD4F
	JSL.l CODE_BB8585			;$B6CD52
	LDX.b alternate_sprite			;$B6CD56
	STX.w $1B6F				;$B6CD58
	LDX.b current_sprite			;$B6CD5B
	LDA.w #$000B				;$B6CD5D
	STA.b $38,x				;$B6CD60
	JML [$04F5]				;$B6CD62

CODE_B6CD65:
	LDX.b current_sprite			;$B6CD65
	LDY.w $1B6F				;$B6CD67
	LDA.w #$0002				;$B6CD6A
	STA.w $0038,y				;$B6CD6D
	INC.b $38,x				;$B6CD70
CODE_B6CD72:
	LDX.b current_sprite			;$B6CD72
	LDY.w $1B6F				;$B6CD74
	LDA.w $0038,y				;$B6CD77
	BNE.b CODE_B6CD8F			;$B6CD7A
	PHY					;$B6CD7C
	JSR.w CODE_B6D7E9			;$B6CD7D
	LDA.w $0008,y				;$B6CD80
	STA.w $1B7D				;$B6CD83
	PLY					;$B6CD86
	LDA.w #$0008				;$B6CD87
	STA.w $0038,y				;$B6CD8A
	INC.b $38,x				;$B6CD8D
CODE_B6CD8F:
	JSL set_platform_hitbox_pos_keep_flags	;$B6CD8F
CODE_B6CD93:
	JSR.w CODE_B6D80C			;$B6CD93
	JML [$04F5]				;$B6CD96

CODE_B6CD99:
	DEC.w $1B7D				;$B6CD99
	BNE.b CODE_B6CDC7			;$B6CD9C
	TYX					;$B6CD9E
	JSR.w CODE_B6D7E9			;$B6CD9F
	LDA.w $000A,y				;$B6CDA2
	STA.b $66,x				;$B6CDA5
	LDA.w $000C,y				;$B6CDA7
	STA.b $6A,x				;$B6CDAA
	LDA.b $12,x				;$B6CDAC
	SEC					;$B6CDAE
	SBC.w $000E,y				;$B6CDAF
	CMP.w #$018B				;$B6CDB2
	BCS.b CODE_B6CDBA			;$B6CDB5
	LDA.w #$018B				;$B6CDB7
CODE_B6CDBA:
	STA.b $62,x				;$B6CDBA
	LDA.b $16,x				;$B6CDBC
	STA.b $64,x				;$B6CDBE
	INC.b $38,x				;$B6CDC0
	LDA.w #$0014				;$B6CDC2
	STA.b $5A,x				;$B6CDC5
CODE_B6CDC7:
	BRA.b CODE_B6CD8F			;$B6CDC7

CODE_B6CDC9:
	JSL set_platform_hitbox_pos_keep_flags	;$B6CDC9
	BCC CODE_B6CDED				;$B6CDCD
	LDA #$0669				;$B6CDCF
	JSL queue_sound_effect			;$B6CDD2
	LDA $62,x				;$B6CDD6
	STA $2C,x				;$B6CDD8
	LDA $64,x				;$B6CDDA
	STA $32,x				;$B6CDDC
	STZ $2A,x				;$B6CDDE
	INC $38,x				;$B6CDE0
	STZ $5A,x				;$B6CDE2
	JSR CODE_B6D7E9				;$B6CDE4
	LDA.w $0010,y				;$B6CDE7
	STA $1B7D				;$B6CDEA
CODE_B6CDED:
	BRA.b CODE_B6CD93			;$B6CDED

CODE_B6CDEF:
	DEC.w $1B7D				;$B6CDEF
	BNE.b CODE_B6CDFC			;$B6CDF2
	TYX					;$B6CDF4
	LDA.w #$0001				;$B6CDF5
	STA.b $38,x				;$B6CDF8
	BRA.b CODE_B6CE07			;$B6CDFA

CODE_B6CDFC:
	LDA.w $1B87				;$B6CDFC
	BNE.b CODE_B6CE07			;$B6CDFF
	LDA.w #$0001				;$B6CE01
	STA.w $1B7D				;$B6CE04
CODE_B6CE07:
	BRA.b CODE_B6CD8F			;$B6CE07

CODE_B6CE09:
	TYX					;$B6CE09
	LDA.b $5A,x				;$B6CE0A
	BEQ.b CODE_B6CE20			;$B6CE0C
	JSL set_platform_hitbox_pos_keep_flags	;$B6CE0E
	BCC.b CODE_B6CE20			;$B6CE12
	STZ.b $2A,x				;$B6CE14
	STZ.b $5A,x				;$B6CE16
	LDA.b $12,x				;$B6CE18
	STA.b $54,x				;$B6CE1A
	LDA.b $16,x				;$B6CE1C
	STA.b $56,x				;$B6CE1E
CODE_B6CE20:
	LDY.w $1B6F				;$B6CE20
	LDA.w $0038,y				;$B6CE23
	BNE.b CODE_B6CE30			;$B6CE26
	LDA.w #$0009				;$B6CE28
	STA.w $0038,y				;$B6CE2B
	INC.b $38,x				;$B6CE2E
CODE_B6CE30:
	JMP.w CODE_B6CD93			;$B6CE30

CODE_B6CE33:
	TYX					;$B6CE33
	LDY.w $1B6F				;$B6CE34
	LDA.w $0038,y				;$B6CE37
	BNE.b CODE_B6CE6B			;$B6CE3A
	LDA.w #$000A				;$B6CE3C
	STA.w $0038,y				;$B6CE3F
	INC.b $38,x				;$B6CE42
	LDA.w #$0002				;$B6CE44
	STA.b $5A,x				;$B6CE47
	JSR.w CODE_B6D7E9			;$B6CE49
	LDA.w $001E,y				;$B6CE4C
	STA.b $2A,x				;$B6CE4F
	LDA.w $0026,y				;$B6CE51
	STA.b $66,x				;$B6CE54
	LDA.w #$0562				;$B6CE56
	JSL.l queue_sound_effect		;$B6CE59
	LDA.w #$0663				;$B6CE5D
	JSL.l queue_sound_effect		;$B6CE60
	LDA.w #$0764				;$B6CE64
	JSL.l queue_sound_effect		;$B6CE67
CODE_B6CE6B:
	JMP.w CODE_B6CD93			;$B6CE6B

CODE_B6CE6E:
	TYX					;$B6CE6E
	LDA.b $66,x				;$B6CE6F
	JSL.l CODE_B58024			;$B6CE71
	LDA.b $2A,x				;$B6CE75
	BPL.b CODE_B6CEA0			;$B6CE77
	DEC.w $1B75				;$B6CE79
	BNE.b CODE_B6CE81			;$B6CE7C
	INC.w $1B75				;$B6CE7E
CODE_B6CE81:
	STZ.b $66,x				;$B6CE81
	STZ.b $2A,x				;$B6CE83
	STZ.b $5A,x				;$B6CE85
	JSR.w CODE_B6D7E9			;$B6CE87
	LDA.w $0020,y				;$B6CE8A
	STA.w $1B7D				;$B6CE8D
	LDA.w #$0005				;$B6CE90
	STA.b $38,x				;$B6CE93
	LDY.w $1B6F				;$B6CE95
	LDA.w #$0008				;$B6CE98
	STA.w $0038,y				;$B6CE9B
	BRA.b CODE_B6CEB9			;$B6CE9E

CODE_B6CEA0:
	JSL set_platform_hitbox_pos_keep_flags	;$B6CEA0
	LDA.b $12,x				;$B6CEA4
	CMP.w #$03C0				;$B6CEA6
	BCC.b CODE_B6CEBC			;$B6CEA9
	STZ.b $2E,x				;$B6CEAB
	INC.b $2E,x				;$B6CEAD
	INC.b $38,x				;$B6CEAF
	LDA.w #$0001				;$B6CEB1
	STA.b $5A,x				;$B6CEB4
	STZ.w $1B7D				;$B6CEB6
CODE_B6CEB9:
	JMP.w CODE_B6CD93			;$B6CEB9

CODE_B6CEBC:
	LDA.b $12,x				;$B6CEBC
	AND.w #$FFE0				;$B6CEBE
	CMP.w $1B93				;$B6CEC1
	BEQ.b CODE_B6CED0			;$B6CEC4
	STA.w $1B93				;$B6CEC6
	LDY.w #$0104				;$B6CEC9
	JSL.l CODE_BB85B8			;$B6CECC
CODE_B6CED0:
	BRA.b CODE_B6CEB9			;$B6CED0

CODE_B6CED2:
	INC.b $38,x				;$B6CED2
	JMP.w CODE_B6CF88			;$B6CED4

CODE_B6CED7:
	TYX					;$B6CED7
	LDA.b $2E,x				;$B6CED8
	BNE.b CODE_B6CEF6			;$B6CEDA
	LDA.b $2A,x				;$B6CEDC
	BEQ.b CODE_B6CED2			;$B6CEDE
	BPL.b CODE_B6CEEC			;$B6CEE0
	CLC					;$B6CEE2
	ADC.w #$0004				;$B6CEE3
	BMI.b CODE_B6CEF2			;$B6CEE6
CODE_B6CEE8:
	STZ.b $2A,x				;$B6CEE8
	BRA.b CODE_B6CF1A			;$B6CEEA

CODE_B6CEEC:
	SEC					;$B6CEEC
	SBC.w #$0004				;$B6CEED
	BMI.b CODE_B6CEE8			;$B6CEF0
CODE_B6CEF2:
	STA.b $2A,x				;$B6CEF2
	BRA.b CODE_B6CF1A			;$B6CEF4

CODE_B6CEF6:
	LDA.w #$0030				;$B6CEF6
	JSL.l CODE_B5800F			;$B6CEF9
	LDX.w $1B89				;$B6CEFD
	BEQ.b CODE_B6CF18			;$B6CF00
	LDA.w #$0060				;$B6CF02
	JSL.l CODE_B5800F			;$B6CF05
	LDA.b $16,x				;$B6CF09
	CMP.w #$0308				;$B6CF0B
	BCC.b CODE_B6CF18			;$B6CF0E
	STZ.w $1B89				;$B6CF10
	TXY					;$B6CF13
	JSL.l CODE_B6F3E7			;$B6CF14
CODE_B6CF18:
	LDX.b current_sprite			;$B6CF18
CODE_B6CF1A:
	LDA.b $12,x				;$B6CF1A
	CMP.w #$03CB				;$B6CF1C
	BCC.b CODE_B6CF2A			;$B6CF1F
	LDA.b $2A,x				;$B6CF21
	BMI.b CODE_B6CF36			;$B6CF23
	JSR.w CODE_B6CFAA			;$B6CF25
	BRA.b CODE_B6CF36			;$B6CF28

CODE_B6CF2A:
	CMP.w #$03B4				;$B6CF2A
	BCS.b CODE_B6CF36			;$B6CF2D
	LDA.b $2A,x				;$B6CF2F
	BPL.b CODE_B6CF36			;$B6CF31
	JSR.w CODE_B6CFAA			;$B6CF33
CODE_B6CF36:
	LDA.w #$0310				;$B6CF36
	CMP.b $16,x				;$B6CF39
	BCS.b CODE_B6CF84			;$B6CF3B
	STA.b $16,x				;$B6CF3D
	LDA.b $5C,x				;$B6CF3F
	BNE.b CODE_B6CF4C			;$B6CF41
	LDA.w #$0673				;$B6CF43
	JSL.l queue_sound_effect		;$B6CF46
	INC.b $5C,x				;$B6CF4A
CODE_B6CF4C:
	LDA.b $2E,x				;$B6CF4C
	BMI.b CODE_B6CF84			;$B6CF4E
	LSR					;$B6CF50
	CMP.w #$0100				;$B6CF51
	BCS.b CODE_B6CF5A			;$B6CF54
	STZ.b $2E,x				;$B6CF56
	BRA.b CODE_B6CF84			;$B6CF58

CODE_B6CF5A:
	EOR.w #$FFFF				;$B6CF5A
	INC					;$B6CF5D
	STA.b $2E,x				;$B6CF5E
	LDA.w $1B7D				;$B6CF60
	BNE.b CODE_B6CF81			;$B6CF63
	LDY.w #$0106				;$B6CF65
	JSL.l CODE_BB8585			;$B6CF68
	LDY.w #$0108				;$B6CF6C
	JSL.l CODE_BB8585			;$B6CF6F
	LDY.w #$010A				;$B6CF73
	JSL.l CODE_BB8585			;$B6CF76
	LDY.w #$0158				;$B6CF7A
	JSL.l CODE_B58036			;$B6CF7D
CODE_B6CF81:
	INC.w $1B7D				;$B6CF81
CODE_B6CF84:
	JSL set_platform_hitbox_pos_keep_flags	;$B6CF84
CODE_B6CF88:
	JSR.w CODE_B6D80C			;$B6CF88
	LDA.w #CODE_B6D859			;$B6CF8B
	JSL.l CODE_BB85D6			;$B6CF8E
	JML [$04F5]				;$B6CF92

CODE_B6CF95:
	BRA.b CODE_B6CF88			;$B6CF95

CODE_B6CF97:
	LDX.w active_kong_sprite		;$B6CF97
	LDA.b $16,x				;$B6CF9A
	CMP.w #$01E0				;$B6CF9C
	BCC.b CODE_B6CFA7			;$B6CF9F
	LDA.w #$0001				;$B6CFA1
	STA.w $0038,y				;$B6CFA4
CODE_B6CFA7:
	JML [$04F5]				;$B6CFA7

CODE_B6CFAA:
	EOR.w #$FFFF				;$B6CFAA
	INC					;$B6CFAD
	STA.b $1A				;$B6CFAE
	ASL					;$B6CFB0
	ASL					;$B6CFB1
	SEC					;$B6CFB2
	SBC.b $1A				;$B6CFB3
	CMP.w #$8000				;$B6CFB5
	PHP					;$B6CFB8
	ROR					;$B6CFB9
	PLP					;$B6CFBA
	ROR					;$B6CFBB
	STA.b $2A,x				;$B6CFBC
	RTS					;$B6CFBE

CODE_B6CFBF:
	LDA.b $6C,x				;$B6CFBF
	BEQ.b CODE_B6CFC7			;$B6CFC1
	DEC.b $6C,x				;$B6CFC3
	BNE.b CODE_B6D03C			;$B6CFC5
CODE_B6CFC7:
	LDA.b $12,x				;$B6CFC7
	SEC					;$B6CFC9
	SBC.w #$003C				;$B6CFCA
	STA.l $001830				;$B6CFCD
	STA.l $001840				;$B6CFD1
	CLC					;$B6CFD5
	ADC.w #$0078				;$B6CFD6
	STA.l $001834				;$B6CFD9
	STA.l $001844				;$B6CFDD
	LDA.b $16,x				;$B6CFE1
	SEC					;$B6CFE3
	SBC.w #$FFC0				;$B6CFE4
	STA.l $001836				;$B6CFE7
	STA.l $001846				;$B6CFEB
	CLC					;$B6CFEF
	ADC.w #$FF80				;$B6CFF0
	STA.l $001832				;$B6CFF3
	STA.l $001842				;$B6CFF7
	STZ.w $183C				;$B6CFFB
	INC.w $1860				;$B6CFFE
	LDA.w #$8000				;$B6D001
	JSL.l CODE_BEC009			;$B6D004
	BCC.b CODE_B6D03C			;$B6D008
	LDA.b $78				;$B6D00A
	CMP.w follower_kong_sprite		;$B6D00C
	BNE.b CODE_B6D01A			;$B6D00F
	LDA.w #$0014				;$B6D011
	JSL.l CODE_B88069			;$B6D014
	BRA.b CODE_B6D021			;$B6D018

CODE_B6D01A:
	LDA.w #$0013				;$B6D01A
	JSL.l CODE_B88069			;$B6D01D
CODE_B6D021:
	BCS.b CODE_B6D03C			;$B6D021
	LDX.b current_sprite			;$B6D023
	LDA.w #$000A				;$B6D025
	STA.b $6C,x				;$B6D028
	LDA.w #$FD00				;$B6D02A
	STA.w $17CC				;$B6D02D
	LDA.b $2A,x				;$B6D030
	SEC					;$B6D032
	SBC.w #$0300				;$B6D033
	STA.w $17CA				;$B6D036
	STZ.w $17CE				;$B6D039
CODE_B6D03C:
	LDX.b current_sprite			;$B6D03C
	RTS					;$B6D03E

CODE_B6D03F:
	CPY.w active_kong_sprite		;$B6D03F
	BEQ.b CODE_B6D083			;$B6D042
	JSR.w CODE_B6D09A			;$B6D044
	BCS.b CODE_B6D082			;$B6D047
	LDA.b $38,x				;$B6D049
	CMP.w #$0006				;$B6D04B
	BCS.b CODE_B6D081			;$B6D04E
	LDA.b $16,x				;$B6D050
	CLC					;$B6D052
	ADC.w #$FFF4				;$B6D053
	CMP.w $0016,y				;$B6D056
	BCS.b CODE_B6D081			;$B6D059
	LDA.b $16,x				;$B6D05B
	CLC					;$B6D05D
	ADC.w #$0016				;$B6D05E
	CMP.w $0016,y				;$B6D061
	BCC.b CODE_B6D082			;$B6D064
	LDA.w #$000A				;$B6D066
	STA.w $005C,y				;$B6D069
	LDA.w #$0009				;$B6D06C
	STA.w $0038,y				;$B6D06F
	PHY					;$B6D072
	LDY.w $1B6F				;$B6D073
	DEC					;$B6D076
	DEC					;$B6D077
	STA.w $0038,y				;$B6D078
	DEC					;$B6D07B
	STA.b $38,x				;$B6D07C
	PLY					;$B6D07E
	SEC					;$B6D07F
	RTS					;$B6D080

CODE_B6D081:
	CLC					;$B6D081
CODE_B6D082:
	RTS					;$B6D082

CODE_B6D083:
	LDA.w $003A,y				;$B6D083
	BIT.w #$0020				;$B6D086
	BEQ.b CODE_B6D099			;$B6D089
	JSR.w CODE_B6D09A			;$B6D08B
	BCS.b CODE_B6D099			;$B6D08E
	LDA.b $16,x				;$B6D090
	CLC					;$B6D092
	ADC.w #$FFC0				;$B6D093
	CMP.w $0016,y				;$B6D096
CODE_B6D099:
	RTS					;$B6D099

CODE_B6D09A:
	LDA.b $12,x				;$B6D09A
	SEC					;$B6D09C
	SBC.w #$003C				;$B6D09D
	CMP.w $0012,y				;$B6D0A0
	RTS					;$B6D0A3

belcha_mouth_side_main:
	PHX					;$B6D0A4
	JSR.w CODE_B6D7F4			;$B6D0A5
	STA.w $1B7B				;$B6D0A8
	PLX					;$B6D0AB
	LDY.b current_sprite			;$B6D0AC
	JMP.w (DATA_B6D0B1,x)			;$B6D0AE

DATA_B6D0B1:
	dw CODE_B6D0C7
	dw CODE_B6D0CA
	dw CODE_B6D0D5
	dw CODE_B6D0E4
	dw CODE_B6D0F2
	dw CODE_B6D0F5
	dw CODE_B6D104
	dw CODE_B6D113
	dw CODE_B6D122
	dw CODE_B6D131
	dw CODE_B6D140

CODE_B6D0C7:
	JML [$04F5]				;$B6D0C7

CODE_B6D0CA:
	LDA.w $1B7B				;$B6D0CA
	BNE.b CODE_B6D0D2			;$B6D0CD
	TYX					;$B6D0CF
	STZ.b $38,x				;$B6D0D0
CODE_B6D0D2:
	JML [$04F5]				;$B6D0D2

CODE_B6D0D5:
	TYX					;$B6D0D5
	LDA.w #$0001				;$B6D0D6
	STA.b $38,x				;$B6D0D9
	JSR.w CODE_B6D7E9			;$B6D0DB
	LDA.w $0000,y				;$B6D0DE
	JMP.w CODE_B6D14F			;$B6D0E1

CODE_B6D0E4:
	LDA.w $1B7B				;$B6D0E4
	BNE.b CODE_B6D0EF			;$B6D0E7
	TYX					;$B6D0E9
	LDA.b $38,x				;$B6D0EA
	XBA					;$B6D0EC
	STA.b $38,x				;$B6D0ED
CODE_B6D0EF:
	JML [$04F5]				;$B6D0EF

CODE_B6D0F2:
	JML [$04F5]				;$B6D0F2

CODE_B6D0F5:
	TYX					;$B6D0F5
	LDA.w #$0001				;$B6D0F6
	STA.b $38,x				;$B6D0F9
	JSR.w CODE_B6D7E9			;$B6D0FB
	LDA.w $0004,y				;$B6D0FE
	JMP.w CODE_B6D14F			;$B6D101

CODE_B6D104:
	TYX					;$B6D104
	LDA.w #$0001				;$B6D105
	STA.b $38,x				;$B6D108
	JSR.w CODE_B6D7E9			;$B6D10A
	LDA.w $0006,y				;$B6D10D
	JMP.w CODE_B6D14F			;$B6D110

CODE_B6D113:
	TYX					;$B6D113
	LDA.w #$0001				;$B6D114
	STA.b $38,x				;$B6D117
	JSR.w CODE_B6D7E9			;$B6D119
	LDA.w $0002,y				;$B6D11C
	JMP.w CODE_B6D14F			;$B6D11F

CODE_B6D122:
	TYX					;$B6D122
	LDA.w #$0004				;$B6D123
	STA.b $38,x				;$B6D126
	JSR.w CODE_B6D7E9			;$B6D128
	LDA.w $0014,y				;$B6D12B
	JMP.w CODE_B6D14F			;$B6D12E

CODE_B6D131:
	TYX					;$B6D131
	LDA.w #$0001				;$B6D132
	STA.b $38,x				;$B6D135
	JSR.w CODE_B6D7E9			;$B6D137
	LDA.w $0022,y				;$B6D13A
	JMP.w CODE_B6D14F			;$B6D13D

CODE_B6D140:
	TYX					;$B6D140
	LDA.w #$0001				;$B6D141
	STA.b $38,x				;$B6D144
	JSR.w CODE_B6D7E9			;$B6D146
	LDA.w $0024,y				;$B6D149
	JMP.w CODE_B6D14F			;$B6D14C

CODE_B6D14F:
	STA.b $1C				;$B6D14F
	STZ.b $1A				;$B6D151
	LDY.b $1A				;$B6D153
CODE_B6D155:
	LDX.w $1BBB,y				;$B6D155
	TYA					;$B6D158
	CLC					;$B6D159
	ADC.b $1C				;$B6D15A
	TAY					;$B6D15C
	LDA.w $0000,y				;$B6D15D
	STA.b $5C,x				;$B6D160
	LDA.w #$0002				;$B6D162
	STA.b $38,x				;$B6D165
	STZ.b $60,x				;$B6D167
	INC.b $1A				;$B6D169
	INC.b $1A				;$B6D16B
	LDY.b $1A				;$B6D16D
	CPY.w #$0014				;$B6D16F
	BNE.b CODE_B6D155			;$B6D172
	JML [$04F5]				;$B6D174

belcha_barrel_main:
	JMP.w (DATA_B6D17A,x)			;$B6D177

DATA_B6D17A:
	dw CODE_B6D180
	dw CODE_B6D196
	dw CODE_B6D1E5

CODE_B6D180:
	JSR.w CODE_B6D1F1			;$B6D180
	JSL.l process_current_movement		;$B6D183
	DEC.b $5C,x				;$B6D187
	BNE.b CODE_B6D193			;$B6D189
	INC.b $38,x				;$B6D18B
	LDA.w #$2000				;$B6D18D
	JSR.w CODE_B6F23E			;$B6D190
CODE_B6D193:
	JMP.w CODE_B685E6			;$B6D193

CODE_B6D196:
	JSR.w CODE_B6D1F1			;$B6D196
	LDA.b $2E,x				;$B6D199
	PHA					;$B6D19B
	LDA.w #$0044				;$B6D19C
	JSL.l process_alternate_movement	;$B6D19F
	PLY					;$B6D1A3
	LDA.b $16,x				;$B6D1A4
	CMP.w #$0308				;$B6D1A6
	BCC.b CODE_B6D1B1			;$B6D1A9
	DEC.w $1B87				;$B6D1AB
	JMP.w CODE_B6F27D			;$B6D1AE

CODE_B6D1B1:
	LDA.b $28,x				;$B6D1B1
	AND.w #$0101				;$B6D1B3
	CMP.w #$0001				;$B6D1B6
	BNE.b CODE_B6D1DD			;$B6D1B9
	LDA.w #$0770				;$B6D1BB
	JSL.l queue_sound_effect		;$B6D1BE
	LDA.b $5E,x				;$B6D1C2
	STA.b $30,x				;$B6D1C4
	TYA					;$B6D1C6
	BEQ.b CODE_B6D1DD			;$B6D1C7
	CMP.w #$0100				;$B6D1C9
	BCC.b CODE_B6D1E0			;$B6D1CC
	EOR.w #$FFFF				;$B6D1CE
	INC					;$B6D1D1
	SEC					;$B6D1D2
	ROR					;$B6D1D3
	STA.b $2E,x				;$B6D1D4
	LDY.w #$0100				;$B6D1D6
	JSL.l CODE_BB85B8			;$B6D1D9
CODE_B6D1DD:
	JMP.w CODE_B685E6			;$B6D1DD

CODE_B6D1E0:
	STZ.b $2E,x				;$B6D1E0
	JMP.w CODE_B685E6			;$B6D1E2

CODE_B6D1E5:
	TYX					;$B6D1E5
	DEC.b $60,x				;$B6D1E6
	BNE.b CODE_B6D1EE			;$B6D1E8
	STZ.b $38,x				;$B6D1EA
	STZ.b $26,x				;$B6D1EC
CODE_B6D1EE:
	JML [$04F5]				;$B6D1EE

CODE_B6D1F1:
	JSL.l populate_sprite_clipping		;$B6D1F1
	LDA.w #$08FB				;$B6D1F5
	JSL.l CODE_BEC009			;$B6D1F8
	BCC.b CODE_B6D227			;$B6D1FC
	CMP.w #$0002				;$B6D1FE
	BNE.b CODE_B6D227			;$B6D201
	PLA					;$B6D203
	LDY.w #$0102				;$B6D204
	JSL.l CODE_BB8585			;$B6D207
	LDX.b alternate_sprite			;$B6D20B
	JSR.w CODE_B6D7E9			;$B6D20D
	LDA.w $001C,y				;$B6D210
	STA.b $5C,x				;$B6D213
	LDA.w #$060C				;$B6D215
	JSL.l queue_sound_effect		;$B6D218
	JSL.l delete_sprite_handle_deallocation	;$B6D21C
	JSL.l CODE_BEC030			;$B6D220
	JML [$04F5]				;$B6D224

CODE_B6D227:
	RTS					;$B6D227

knik_knak_main:
	JSL.l CODE_BEC036			;$B6D228
	JMP.w (DATA_B6D22F,x)			;$B6D22C

DATA_B6D22F:
	dw CODE_B6D243
	dw CODE_B6D25B
	dw CODE_B6D26B
	dw CODE_B6D281
	dw CODE_B6D291
	dw CODE_B6D2F0
	dw CODE_B6D306
	dw CODE_B6D339
	dw CODE_B6D35A
	dw CODE_B6D35D

CODE_B6D243:
	LDA.w #$0044				;$B6D243
	JSL.l process_alternate_movement	;$B6D246
	DEC.b $5C,x				;$B6D24A
	BNE.b CODE_B6D258			;$B6D24C
	JSR.w CODE_B6D410			;$B6D24E
	LDA.w #$022A				;$B6D251
	JSL.l set_sprite_animation		;$B6D254
CODE_B6D258:
	JMP.w CODE_B685E6			;$B6D258

CODE_B6D25B:
	JSL.l update_held_sprite_position	;$B6D25B
	JSL.l process_sprite_animation		;$B6D25F
	JSR.w CODE_B6B6A4			;$B6D263
	BCS.b CODE_B6D2D9			;$B6D266
	JML [$04F5]				;$B6D268

CODE_B6D26B:
	TYX					;$B6D26B
	LDA.w #$003C				;$B6D26C
	STA.b $5C,x				;$B6D26F
	JSL.l update_held_sprite_position	;$B6D271
	JSL.l process_sprite_animation		;$B6D275
	JSR.w CODE_B6B6A4			;$B6D279
	BCS.b CODE_B6D2D9			;$B6D27C
	JML [$04F5]				;$B6D27E

CODE_B6D281:
	JSL.l update_held_sprite_position	;$B6D281
	JSL.l process_sprite_animation		;$B6D285
	JSR.w CODE_B6B6A4			;$B6D289
	BCS.b CODE_B6D2D9			;$B6D28C
	JML [$04F5]				;$B6D28E

CODE_B6D291:
	JSR.w CODE_B6B6B3			;$B6D291
	BCS.b CODE_B6D2D9			;$B6D294
	TXY					;$B6D296
	LDX.w $1B6B				;$B6D297
	JSR.w CODE_B6D03F			;$B6D29A
	TYX					;$B6D29D
	BCS.b CODE_B6D2AD			;$B6D29E
	JSR.w CODE_B6D3E6			;$B6D2A0
	LDA.w #$0666				;$B6D2A3
	JSL.l queue_sound_effect		;$B6D2A6
	JMP.w CODE_B6D2E3			;$B6D2AA

CODE_B6D2AD:
	LDA.b $28,x				;$B6D2AD
	BIT.w #$0002				;$B6D2AF
	BNE.b CODE_B6D2D9			;$B6D2B2
	BIT.w #$0001				;$B6D2B4
	BEQ.b CODE_B6D2C9			;$B6D2B7
	JSL.l CODE_B5802A			;$B6D2B9
	LDA.w #$0046				;$B6D2BD
	STA.b $5C,x				;$B6D2C0
	LDA.w #$0006				;$B6D2C2
	STA.b $38,x				;$B6D2C5
	STZ.b $30,x				;$B6D2C7
CODE_B6D2C9:
	JSL.l process_current_movement		;$B6D2C9
	JSR.w CODE_B6D3FC			;$B6D2CD
	BCS.b CODE_B6D2D6			;$B6D2D0
	JSL.l process_sprite_animation		;$B6D2D2
CODE_B6D2D6:
	JML [$04F5]				;$B6D2D6

CODE_B6D2D9:
	LDX.b current_sprite			;$B6D2D9
	CPX.w current_held_sprite		;$B6D2DB
	BNE.b CODE_B6D2E3			;$B6D2DE
	STZ.w current_held_sprite		;$B6D2E0
CODE_B6D2E3:
	DEC.w $1B87				;$B6D2E3
	LDY.w #$0008				;$B6D2E6
	LDA.w #$0230				;$B6D2E9
	PHA					;$B6D2EC
	JMP.w CODE_B6878B			;$B6D2ED

CODE_B6D2F0:
	JSR.w CODE_B6D37B			;$B6D2F0
	LDA.w #$0044				;$B6D2F3
	JSL.l process_alternate_movement	;$B6D2F6
	JSR.w CODE_B6D3FC			;$B6D2FA
	BCS.b CODE_B6D303			;$B6D2FD
	JSL.l process_sprite_animation		;$B6D2FF
CODE_B6D303:
	JML [$04F5]				;$B6D303

CODE_B6D306:
	JSL.l check_if_picked_up_by_kong	;$B6D306
	BCC.b CODE_B6D30F			;$B6D30A
	JML [$04F5]				;$B6D30C

CODE_B6D30F:
	JSR.w CODE_B6D372			;$B6D30F
	DEC.b $5C,x				;$B6D312
	BNE.b CODE_B6D324			;$B6D314
	INC.b $38,x				;$B6D316
	LDA.w #$003C				;$B6D318
	STA.b $5C,x				;$B6D31B
	LDA.w #$0231				;$B6D31D
	JSL.l set_sprite_animation		;$B6D320
CODE_B6D324:
	LDX.b current_sprite			;$B6D324
	LDA.w #$0044				;$B6D326
	JSL.l process_alternate_movement	;$B6D329
	JSR.w CODE_B6D3FC			;$B6D32D
	BCS.b CODE_B6D336			;$B6D330
	JSL.l process_sprite_animation		;$B6D332
CODE_B6D336:
	JML [$04F5]				;$B6D336

CODE_B6D339:
	JSL.l check_if_picked_up_by_kong	;$B6D339
	BCC.b CODE_B6D342			;$B6D33D
	JML [$04F5]				;$B6D33F

CODE_B6D342:
	JSR.w CODE_B6D372			;$B6D342
	DEC.b $5C,x				;$B6D345
	BNE.b CODE_B6D357			;$B6D347
	JSL.l CODE_B5802D			;$B6D349
	JSR.w CODE_B6D410			;$B6D34D
	LDA.w #$0232				;$B6D350
	JSL.l set_sprite_animation		;$B6D353
CODE_B6D357:
	JMP.w CODE_B685E6			;$B6D357

CODE_B6D35A:
	JMP.w generic_move_and_animate_state	;$B6D35A

CODE_B6D35D:
	JSL.l process_current_movement		;$B6D35D
	DEC.b $5C,x				;$B6D361
	BNE.b CODE_B6D36B			;$B6D363
	DEC.w $1B87				;$B6D365
	JMP.w CODE_B6F27D			;$B6D368

CODE_B6D36B:
	JSL.l process_sprite_animation		;$B6D36B
	JML [$04F5]				;$B6D36F

CODE_B6D372:
	JSL.l populate_sprite_clipping		;$B6D372
	LDA.w #$08AB				;$B6D376
	BRA.b CODE_B6D382			;$B6D379

CODE_B6D37B:
	JSL.l populate_sprite_clipping		;$B6D37B
	LDA.w #$08A8				;$B6D37F
CODE_B6D382:
	JSL.l CODE_BEC009			;$B6D382
	BCC.b CODE_B6D3CB			;$B6D386
	BEQ.b CODE_B6D3CB			;$B6D388
	LDA.w $17C6				;$B6D38A
	CMP.w #$0011				;$B6D38D
	BEQ.b CODE_B6D39D			;$B6D390
CODE_B6D392:
	LDA.w #$063B				;$B6D392
	JSL.l queue_sound_effect		;$B6D395
	PLY					;$B6D399
	JMP.w CODE_B6D2E3			;$B6D39A

CODE_B6D39D:
	LDA.b $38,x				;$B6D39D
	CMP.w #$0006				;$B6D39F
	BEQ.b CODE_B6D392			;$B6D3A2
	CMP.w #$0007				;$B6D3A4
	BEQ.b CODE_B6D392			;$B6D3A7
	JSL.l CODE_B5802A			;$B6D3A9
	LDA.w #$0064				;$B6D3AD
	STA.b $5C,x				;$B6D3B0
	STZ.b $30,x				;$B6D3B2
	LDA.w #$0006				;$B6D3B4
	STA.b $38,x				;$B6D3B7
	LDA.w #$022F				;$B6D3B9
	JSL.l set_sprite_animation		;$B6D3BC
	LDA.w #$063A				;$B6D3C0
	JSL.l queue_sound_effect		;$B6D3C3
	PLY					;$B6D3C7
	JML [$04F5]				;$B6D3C8

CODE_B6D3CB:
	LDA.w #$0038				;$B6D3CB
	JSL.l check_throwable_collision		;$B6D3CE
	BCS.b CODE_B6D39D			;$B6D3D2
	TXY					;$B6D3D4
	LDX.w $1B6B				;$B6D3D5
	JSR.w CODE_B6D03F			;$B6D3D8
	TYX					;$B6D3DB
	BCS.b CODE_B6D3E5			;$B6D3DC
	PLY					;$B6D3DE
	JSR.w CODE_B6D3E6			;$B6D3DF
	JMP.w CODE_B6D2E3			;$B6D3E2

CODE_B6D3E5:
	RTS					;$B6D3E5

CODE_B6D3E6:
	LDY.b current_sprite			;$B6D3E6
	JSL.l CODE_B58039			;$B6D3E8
	LDA.b $16,x				;$B6D3EC
	SEC					;$B6D3EE
	SBC.w #$0008				;$B6D3EF
	STA.b $16,x				;$B6D3F2
	LDA.w #$3000				;$B6D3F4
	JSR.w CODE_B6F23E			;$B6D3F7
	TYX					;$B6D3FA
	RTS					;$B6D3FB

CODE_B6D3FC:
	LDX.b current_sprite			;$B6D3FC
	LDA.b $16,x				;$B6D3FE
	CMP.w #$0308				;$B6D400
	BCC.b CODE_B6D40E			;$B6D403
	DEC.w $1B87				;$B6D405
	JSL.l delete_sprite_handle_deallocation	;$B6D408
	SEC					;$B6D40C
	RTS					;$B6D40D

CODE_B6D40E:
	CLC					;$B6D40E
	RTS					;$B6D40F

CODE_B6D410:
	LDA.w #$0005				;$B6D410
	STA.b $38,x				;$B6D413
	JSR.w CODE_B6D7E9			;$B6D415
	LDA.w $001A,y				;$B6D418
	STA.b $30,x				;$B6D41B
	RTS					;$B6D41D

belcha_platform_main:
	JSL.l process_current_movement		;$B6D41E
	JML [$04F5]				;$B6D422

belcha_tooth_main:
	LDA.w $0038,y				;$B6D425
	CMP.w #$0001				;$B6D428
	BEQ.b CODE_B6D458			;$B6D42B
	PHX					;$B6D42D
	LDX.w $1B6B				;$B6D42E
	LDA.w $0012,y				;$B6D431
	CLC					;$B6D434
	ADC.w $1B83				;$B6D435
	STA.w $0012,y				;$B6D438
	LDA.w $0016,y				;$B6D43B
	CLC					;$B6D43E
	ADC.w $1B85				;$B6D43F
	STA.w $0016,y				;$B6D442
	PLX					;$B6D445
	JMP.w (DATA_B6D449,x)			;$B6D446

DATA_B6D449:
	dw CODE_B6D455
	dw CODE_B6D458
	dw CODE_B6D493
	dw CODE_B6D4E8
	dw CODE_B6D514
	dw CODE_B6D527

CODE_B6D455:
	JML [$04F5]				;$B6D455

CODE_B6D458:
	LDX.w $1B6B				;$B6D458
	LDA.b $16,x				;$B6D45B
	STA.w $0016,y				;$B6D45D
	LDA.b $12,x				;$B6D460
	SEC					;$B6D462
	SBC.w #$0028				;$B6D463
	PHA					;$B6D466
	TYX					;$B6D467
	LDY.w active_kong_sprite		;$B6D468
	SEC					;$B6D46B
	SBC.w $0012,y				;$B6D46C
	BPL.b CODE_B6D475			;$B6D46F
	EOR.w #$FFFF				;$B6D471
	INC					;$B6D474
CODE_B6D475:
	SEP.b #$20				;$B6D475
	STA.w CPU.multiply_A			;$B6D477
	LDA.b #$0A				;$B6D47A
	STA.w CPU.multiply_B			;$B6D47C
	REP.b #$20				;$B6D47F
	NOP					;$B6D481
	LDA.w CPU.multiply_result_high		;$B6D482
	AND.w #$00FF				;$B6D485
	STA.b $1A				;$B6D488
	PLA					;$B6D48A
	CLC					;$B6D48B
	ADC.b $1A				;$B6D48C
	STA.b $12,x				;$B6D48E
	JML [$04F5]				;$B6D490

CODE_B6D493:
	LDX.b current_sprite			;$B6D493
CODE_B6D495:
	LDY.b $5C,x				;$B6D495
	LDA.w $0000,y				;$B6D497
	JSL.l CODE_B58021			;$B6D49A
	BMI.b CODE_B6D4BC			;$B6D49E
	CMP.w #$0064				;$B6D4A0
	BCC.b CODE_B6D4BC			;$B6D4A3
	SEC					;$B6D4A5
	SBC.w #$0064				;$B6D4A6
	ASL					;$B6D4A9
	TAX					;$B6D4AA
	LDY.b current_sprite			;$B6D4AB
	JMP.w (DATA_B6D4B0,x)			;$B6D4AD

DATA_B6D4B0:
	dw CODE_B6D534
	dw CODE_B6D53A
	dw CODE_B6D556
	dw CODE_B6D564
	dw CODE_B6D58F
	dw CODE_B6D5B5

CODE_B6D4BC:
	STA.b $5E,x				;$B6D4BC
	LDA.w $0001,y				;$B6D4BE
	AND.w #$00FF				;$B6D4C1
	ASL					;$B6D4C4
	ASL					;$B6D4C5
	ASL					;$B6D4C6
	ASL					;$B6D4C7
	STA.b $2E,x				;$B6D4C8
	INC.b $5C,x				;$B6D4CA
	INC.b $5C,x				;$B6D4CC
	LDY.w $1B6B				;$B6D4CE
	LDA.w $0016,y				;$B6D4D1
	CLC					;$B6D4D4
	ADC.b $5E,x				;$B6D4D5
	CMP.b $16,x				;$B6D4D7
	BCS.b CODE_B6D4E3			;$B6D4D9
	LDA.b $2E,x				;$B6D4DB
	EOR.w #$FFFF				;$B6D4DD
	INC					;$B6D4E0
	STA.b $2E,x				;$B6D4E1
CODE_B6D4E3:
	LDA.w #$0203				;$B6D4E3
	STA.b $38,x				;$B6D4E6
CODE_B6D4E8:
	LDX.b current_sprite			;$B6D4E8
	LDA.w #$0003				;$B6D4EA
	JSL.l process_alternate_movement	;$B6D4ED
	LDY.w $1B6B				;$B6D4F1
	LDA.b $5E,x				;$B6D4F4
	CLC					;$B6D4F6
	ADC.w $0016,y				;$B6D4F7
	LDY.b $2E,x				;$B6D4FA
	BPL.b CODE_B6D50C			;$B6D4FC
	CMP.b $16,x				;$B6D4FE
	BCC.b CODE_B6D509			;$B6D500
CODE_B6D502:
	STA.b $16,x				;$B6D502
	LDA.b $38,x				;$B6D504
	XBA					;$B6D506
	STA.b $38,x				;$B6D507
CODE_B6D509:
	JML [$04F5]				;$B6D509

CODE_B6D50C:
	CMP.b $16,x				;$B6D50C
	BEQ.b CODE_B6D502			;$B6D50E
	BCS.b CODE_B6D509			;$B6D510
	BRA.b CODE_B6D502			;$B6D512

CODE_B6D514:
	LDA.w $1B7B				;$B6D514
	CMP.w #$0004				;$B6D517
	BNE.b CODE_B6D524			;$B6D51A
	TYX					;$B6D51C
	INC.b $5C,x				;$B6D51D
	LDA.b $38,x				;$B6D51F
	XBA					;$B6D521
	STA.b $38,x				;$B6D522
CODE_B6D524:
	JML [$04F5]				;$B6D524

CODE_B6D527:
	TYX					;$B6D527
	DEC.b $5E,x				;$B6D528
	BNE.b CODE_B6D531			;$B6D52A
	LDA.b $38,x				;$B6D52C
	XBA					;$B6D52E
	STA.b $38,x				;$B6D52F
CODE_B6D531:
	JML [$04F5]				;$B6D531

CODE_B6D534:
	TYX					;$B6D534
	STZ.b $38,x				;$B6D535
	JML [$04F5]				;$B6D537

CODE_B6D53A:
	TYX					;$B6D53A
	LDA.b $37,x				;$B6D53B
	SEP.b #$20				;$B6D53D
	LDA.b #$05				;$B6D53F
	REP.b #$20				;$B6D541
	STA.b $38,x				;$B6D543
	LDY.b $5C,x				;$B6D545
	INC.b $5C,x				;$B6D547
	INC.b $5C,x				;$B6D549
	LDA.w $0001,y				;$B6D54B
	AND.w #$00FF				;$B6D54E
	STA.b $5E,x				;$B6D551
	JML [$04F5]				;$B6D553

CODE_B6D556:
	TYX					;$B6D556
	LDA.b $37,x				;$B6D557
	SEP.b #$20				;$B6D559
	LDA.b #$04				;$B6D55B
	REP.b #$20				;$B6D55D
	STA.b $38,x				;$B6D55F
	JML [$04F5]				;$B6D561

CODE_B6D564:
	TYX					;$B6D564
	LDY.b $5C,x				;$B6D565
	LDA.b $60,x				;$B6D567
	BMI.b CODE_B6D57C			;$B6D569
	BEQ.b CODE_B6D573			;$B6D56B
	DEC.b $60,x				;$B6D56D
	BEQ.b CODE_B6D584			;$B6D56F
	BRA.b CODE_B6D57C			;$B6D571

CODE_B6D573:
	LDA.w $0001,y				;$B6D573
	JSL.l CODE_B58021			;$B6D576
	STA.b $60,x				;$B6D57A
CODE_B6D57C:
	LDA.w $0002,y				;$B6D57C
	STA.b $5C,x				;$B6D57F
	JMP.w CODE_B6D495			;$B6D581

CODE_B6D584:
	LDA.b $5C,x				;$B6D584
	CLC					;$B6D586
	ADC.w #$0004				;$B6D587
	STA.b $5C,x				;$B6D58A
	JMP.w CODE_B6D495			;$B6D58C

CODE_B6D58F:
	TYX					;$B6D58F
	INC.b $5C,x				;$B6D590
	LDY.w #$00FE				;$B6D592
	JSL.l CODE_BB8585			;$B6D595
	LDX.b alternate_sprite			;$B6D599
	JSR.w CODE_B6D7E9			;$B6D59B
	INC.w $1B87				;$B6D59E
	LDA.w $0012,y				;$B6D5A1
	STA.b $2A,x				;$B6D5A4
	STA.b $30,x				;$B6D5A6
	LDA.w $0016,y				;$B6D5A8
	STA.b $5E,x				;$B6D5AB
	LDA.w $0018,y				;$B6D5AD
	STA.b $60,x				;$B6D5B0
	JMP.w CODE_B6D493			;$B6D5B2

CODE_B6D5B5:
	TYX					;$B6D5B5
	LDY.b $5C,x				;$B6D5B6
	LDA.w $0001,y				;$B6D5B8
	INY					;$B6D5BB
	INY					;$B6D5BC
	INY					;$B6D5BD
	STY.b $5C,x				;$B6D5BE
	JSL.l queue_sound_effect		;$B6D5C0
	JMP.w CODE_B6D493			;$B6D5C4

DATA_B6D5C7:
	dw DATA_B6D5DB
	dw DATA_B6D5E6
	dw DATA_B6D5F1
	dw DATA_B6D5E6
	dw DATA_B6D5DB
	dw DATA_B6D5FD
	dw DATA_B6D608
	dw DATA_B6D608
	dw DATA_B6D608
	dw DATA_B6D5FD

DATA_B6D5DB:
	db $00,$30,$66,$06,$10,$66,$65,$1E,$00,$10,$64

DATA_B6D5E6:
	db $00,$30,$66,$0E,$10,$66,$65,$1E,$00,$10,$64

DATA_B6D5F1:
	db $00,$30,$66,$0E,$10,$66,$68,$65,$1E,$00,$10,$64

DATA_B6D5FD:
	db $00,$30,$66,$FA,$10,$66,$65,$1E,$00,$10,$64

DATA_B6D608:
	db $00,$30,$66,$F2,$10,$66,$65,$1E,$00,$10,$64

DATA_B6D613:
	dw DATA_B6D627
	dw DATA_B6D66B
	dw DATA_B6D627
	dw DATA_B6D64A
	dw DATA_B6D627
	dw DATA_B6D695
	dw DATA_B6D6B8
	dw DATA_B6D695
	dw DATA_B6D6B8
	dw DATA_B6D695

DATA_B6D627:
	db $00,$20,$66,$65,$14,$12,$20,$66

DATA_B6D62F:
	db $00,$20,$66,$12,$20,$66,$67,$01
	dw DATA_B6D62F
	db $00,$20,$66,$65,$09

DATA_B6D63E:
	db $09,$10,$00,$10,$67,$03
	dw DATA_B6D63E
	db $66,$65,$08,$64

DATA_B6D64A:
	db $00,$20,$66,$65,$14,$12,$20,$66

DATA_B6D652:
	db $00,$20,$66,$12,$20,$66,$67,$01
	dw DATA_B6D652
	db $00,$20,$66

DATA_B6D65F:
	db $09,$10,$00,$10,$67,$03
	dw DATA_B6D65F
	db $66,$65,$08,$64

DATA_B6D66B:
	db $00,$20,$66,$69,$67,$06,$65,$14,$12,$20,$66

DATA_B6D676:
	db $00,$20,$66,$69,$65,$06,$12,$20,$66,$67,$01
	dw DATA_B6D676
	db $00,$20,$66,$69,$68,$06

DATA_B6D689:
	db $09,$10,$00,$10,$67,$03
	dw DATA_B6D689
	db $66,$65,$08,$64

DATA_B6D695:
	db $00,$20,$66,$65,$14,$EE,$20,$66

DATA_B6D69D:
	db $00,$20,$66,$EE,$20,$66,$67,$01
	dw DATA_B6D69D
	db $00,$20,$66,$65,$09

DATA_B6D6AC:
	db $F7,$10,$00,$10,$67,$03
	dw DATA_B6D6AC
	db $66,$65,$08,$64

DATA_B6D6B8:
	db $00,$20,$66,$65,$14,$EE,$20,$66

DATA_B6D6C0:
	db $00,$20,$66,$EE,$20,$66,$67,$01
	dw DATA_B6D6C0
	db $00,$20,$66

DATA_B6D6CD:
	db $F7,$10,$00,$10,$67,$03
	dw DATA_B6D6CD
	db $66,$65,$08,$64

DATA_B6D6D9:
	dw DATA_B6D6ED
	dw DATA_B6D6ED
	dw DATA_B6D6ED
	dw DATA_B6D6ED
	dw DATA_B6D6ED
	dw DATA_B6D6F1
	dw DATA_B6D6F1
	dw DATA_B6D6F1
	dw DATA_B6D6F1
	dw DATA_B6D6F1

DATA_B6D6ED:
	db $12,$04,$66,$64

DATA_B6D6F1:
	db $EE,$04,$66,$64

DATA_B6D6F5:
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709
	dw DATA_B6D709

DATA_B6D709:
	db $00,$04,$66,$64

DATA_B6D70D:
	dw DATA_B6D72E
	dw DATA_B6D721
	dw DATA_B6D721
	dw DATA_B6D721
	dw DATA_B6D721
	dw DATA_B6D73E
	dw DATA_B6D73E
	dw DATA_B6D73E
	dw DATA_B6D73E
	dw DATA_B6D73E

DATA_B6D721:
	db $12,$18,$66,$65,$14,$00,$30,$12,$30,$67
	db $FF : dw DATA_B6D721+$02

DATA_B6D72E:
	db $12,$18,$66,$65,$14,$00,$30,$69,$65,$06,$12,$30,$67
	db $FF : dw DATA_B6D72E+$02

DATA_B6D73E:
	db $EE,$18,$66,$65,$14,$00,$30,$EE,$30,$67
	db $FF : dw DATA_B6D73E+$02

DATA_B6D74B:
	dw DATA_B6D75F
	dw DATA_B6D763
	dw DATA_B6D767
	dw DATA_B6D763
	dw DATA_B6D75F
	dw DATA_B6D76B
	dw DATA_B6D76F
	dw DATA_B6D773
	dw DATA_B6D76F
	dw DATA_B6D76B

DATA_B6D75F:
	db $06,$08,$66,$64

DATA_B6D763:
	db $0B,$08,$66,$64

DATA_B6D767:
	db $10,$08,$66,$64

DATA_B6D76B:
	db $FA,$08,$66,$64

DATA_B6D76F:
	db $F5,$08,$66,$64

DATA_B6D773:
	db $F0,$08,$66,$64

DATA_B6D777:
	dw DATA_B6D78B
	dw DATA_B6D793
	dw DATA_B6D79B
	dw DATA_B6D793
	dw DATA_B6D78B
	dw DATA_B6D7A3
	dw DATA_B6D7AB
	dw DATA_B6D7B3
	dw DATA_B6D7AB
	dw DATA_B6D7A3

DATA_B6D78B:
	db $08,$10,$06,$10,$67
	db $FF : dw DATA_B6D78B

DATA_B6D793:
	db $0D,$10,$0B,$10,$67
	db $FF : dw DATA_B6D793

DATA_B6D79B:
	db $12,$10,$10,$10,$67
	db $FF : dw DATA_B6D79B

DATA_B6D7A3:
	db $F8,$10,$FA,$10,$67
	db $FF : dw DATA_B6D7A3

DATA_B6D7AB:
	db $F3,$10,$F5,$10,$67
	db $FF : dw DATA_B6D7AB

DATA_B6D7B3:
	db $EE,$10,$F0,$10,$67
	db $FF : dw DATA_B6D7B3

DATA_B6D7BB:
	dw DATA_B6D7C1
	dw DATA_B6D7C1
	dw DATA_B6D7C1

DATA_B6D7C1:
	dw DATA_B6D5C7,DATA_B6D613,DATA_B6D6D9,DATA_B6D6F5,$003C,$0014,$0028,$002D
	dw $012C,$FE00,DATA_B6D70D,$FF80,$000A,$FF00,$0014,$0330
	dw $0032,DATA_B6D74B,DATA_B6D777,$FFF6

CODE_B6D7E9:
	LDA.w $1B75				;$B6D7E9
	DEC					;$B6D7EC
	ASL					;$B6D7ED
	TAY					;$B6D7EE
	LDA.w DATA_B6D7BB,y			;$B6D7EF
	TAY					;$B6D7F2
	RTS					;$B6D7F3

CODE_B6D7F4:
	LDY.w #$0000				;$B6D7F4
	TYA					;$B6D7F7
	SEP.b #$20				;$B6D7F8
CODE_B6D7FA:
	LDX.w $1BBB,y				;$B6D7FA
	ORA.b $38,x				;$B6D7FD
	INY					;$B6D7FF
	INY					;$B6D800
	CPY.w #$0014				;$B6D801
	BNE.b CODE_B6D7FA			;$B6D804
	REP.b #$20				;$B6D806
	LDX.b current_sprite			;$B6D808
	TAY					;$B6D80A
	RTS					;$B6D80B

CODE_B6D80C:
	LDX.b current_sprite			;$B6D80C
	JSR.w CODE_B6CFBF			;$B6D80E
	LDA.b $12,x				;$B6D811
	SEC					;$B6D813
	SBC.b $54,x				;$B6D814
	STA.w $1B83				;$B6D816
	LDA.b $16,x				;$B6D819
	SEC					;$B6D81B
	SBC.b $56,x				;$B6D81C
	STA.w $1B85				;$B6D81E
	LDY.w $1B6F				;$B6D821
	LDA.b $12,x				;$B6D824
	SEC					;$B6D826
	SBC.w #$0028				;$B6D827
	STA.w $0012,y				;$B6D82A
	LDA.b $16,x				;$B6D82D
	STA.w $0016,y				;$B6D82F
	JSR.w CODE_B6D836			;$B6D832
	RTS					;$B6D835

CODE_B6D836:
	LDX.b current_sprite			;$B6D836
	LDA.b $12,x				;$B6D838
	SEC					;$B6D83A
	SBC.w $196D				;$B6D83B
	SBC.w #$017E				;$B6D83E
	EOR.w #$FFFF				;$B6D841
	INC					;$B6D844
	STA.w $1B77				;$B6D845
	LDA.b $16,x				;$B6D848
	SEC					;$B6D84A
	SBC.w $1975				;$B6D84B
	SBC.w #$0158				;$B6D84E
	EOR.w #$FFFF				;$B6D851
	INC					;$B6D854
	STA.w $1B79				;$B6D855
	RTS					;$B6D858

CODE_B6D859:
	LDA.w #$001E				;$B6D859
	JSL.l CODE_BEC01B			;$B6D85C
	RTL					;$B6D860

CODE_B6D861:
	JML [$04F5]				;$B6D861

squirt_main:
	JMP.w (DATA_B6D867,x)			;$B6D864

DATA_B6D867:
	dw CODE_B6D883
	dw CODE_B6D90B
	dw CODE_B6D935
	dw CODE_B6D98F
	dw CODE_B6D9A5
	dw CODE_B6D9BE
	dw CODE_B6D9D1
	dw CODE_B6D9E7
	dw CODE_B6DA2A
	dw CODE_B6DA38
	dw CODE_B6DA52
	dw CODE_B6DAE7
	dw CODE_B6DAF3
	dw CODE_B6DB23

CODE_B6D883:
	TYX					;$B6D883
	STX.w $1B6B				;$B6D884
	LDA.w #$0003				;$B6D887
	STA.w $1B75				;$B6D88A
	INC.b $38,x				;$B6D88D
	LDA.w #$0000				;$B6D88F
	STA.b $5C,x				;$B6D892
	LDA.w #$0303				;$B6D894
	STA.b $5E,x				;$B6D897
	LDA.w #$5000				;$B6D899
	STA.b $62,x				;$B6D89C
	LDA.w #$001E				;$B6D89E
	STA.b $6A,x				;$B6D8A1
	LDA.w #$0080				;$B6D8A3
	STA.b $2A,x				;$B6D8A6
	LDY.w #$01D0				;$B6D8A8
	JSL.l CODE_BB8585			;$B6D8AB
	LDX.b alternate_sprite			;$B6D8AF
	STX.w $1B6F				;$B6D8B1
	LDY.w #$01D2				;$B6D8B4
	JSL.l CODE_BB8585			;$B6D8B7
	LDX.b alternate_sprite			;$B6D8BB
	STX.w $1B77				;$B6D8BD
	LDY.w #$01D6				;$B6D8C0
	JSL.l CODE_BB8585			;$B6D8C3
	LDX.b alternate_sprite			;$B6D8C7
	STX.w $1B79				;$B6D8C9
	LDY.w #$01D8				;$B6D8CC
	JSL.l CODE_BB8585			;$B6D8CF
	LDX.b alternate_sprite			;$B6D8D3
	STX.w $1B7B				;$B6D8D5
	LDY.w #$01DA				;$B6D8D8
	JSL.l CODE_BB8585			;$B6D8DB
	LDX.b alternate_sprite			;$B6D8DF
	STX.w $1B83				;$B6D8E1
	LDY.w #$037E				;$B6D8E4
	JSL.l CODE_BB85B8			;$B6D8E7
	LDY.b alternate_sprite			;$B6D8EB
	STY.w $1B71				;$B6D8ED
	LDY.w #$0380				;$B6D8F0
	JSL.l CODE_BB85B8			;$B6D8F3
	LDY.b alternate_sprite			;$B6D8F7
	STY.w $1B73				;$B6D8F9
	SEP.b #$20				;$B6D8FC
	LDA.b #$7A				;$B6D8FE
	STA.w PPU.layer_3_tilemap_base		;$B6D900
	REP.b #$20				;$B6D903
	LDA.w #$012C				;$B6D905
	STA.w $1B7D				;$B6D908
CODE_B6D90B:
	DEC.w $1B7D				;$B6D90B
	BPL.b CODE_B6D923			;$B6D90E
	TYX					;$B6D910
	LDA.w #$006C				;$B6D911
	JSL.l CODE_BB85A0			;$B6D914
	LDX.w $1B83				;$B6D918
	LDA.w #$0007				;$B6D91B
	STA.b $38,x				;$B6D91E
	TYX					;$B6D920
	INC.b $38,x				;$B6D921
CODE_B6D923:
	JSR.w CODE_B6DB26			;$B6D923
	JSR.w CODE_B6DB5A			;$B6D926
	JSR.w CODE_B6DB92			;$B6D929
	JML [$04F5]				;$B6D92C

CODE_B6D92F:
	JSR.w CODE_B6DB92			;$B6D92F
	JML [$04F5]				;$B6D932

CODE_B6D935:
	LDX.w $1B83				;$B6D935
	LDA.b $38,x				;$B6D938
	BNE.b CODE_B6D98C			;$B6D93A
	TYX					;$B6D93C
	JSR.w CODE_B6DF97			;$B6D93D
	LDA.w $0010,y				;$B6D940
	PHY					;$B6D943
	STA.b $1A				;$B6D944
	LDA.b $12,x				;$B6D946
	LDY.w active_kong_sprite		;$B6D948
	CMP.w $0012,y				;$B6D94B
	LDA.b $1A				;$B6D94E
	BCS.b CODE_B6D956			;$B6D950
	EOR.w #$FFFF				;$B6D952
	INC					;$B6D955
CODE_B6D956:
	PLY					;$B6D956
	STA.b $2A,x				;$B6D957
	LDA.w #$8000				;$B6D959
	STA.b $60,x				;$B6D95C
	LDA.w $0012,y				;$B6D95E
	STA.b $5E,x				;$B6D961
	LDA.w $0008,y				;$B6D963
	BPL.b CODE_B6D97D			;$B6D966
	AND.w #$7FFF				;$B6D968
	INC.w $1C35				;$B6D96B
	INC.w $1C35				;$B6D96E
	INC.w $1C35				;$B6D971
	INC.w $1C35				;$B6D974
	LDY.w $1C37				;$B6D977
	BEQ.b CODE_B6D97D			;$B6D97A
	LSR					;$B6D97C
CODE_B6D97D:
	STA.w $1B7D				;$B6D97D
	LDA.w #$0001				;$B6D980
	STA.b $5C,x				;$B6D983
	INC.b $38,x				;$B6D985
	LDA.w #$0001				;$B6D987
	STA.b $5C,x				;$B6D98A
CODE_B6D98C:
	JMP.w CODE_B6D923			;$B6D98C

CODE_B6D98F:
	DEC.w $1B7D				;$B6D98F
	BNE.b CODE_B6D9A2			;$B6D992
	TYX					;$B6D994
	STZ.b $5C,x				;$B6D995
	JSR.w CODE_B6DF97			;$B6D997
	LDA.w $000E,y				;$B6D99A
	STA.w $1B7D				;$B6D99D
	INC.b $38,x				;$B6D9A0
CODE_B6D9A2:
	JMP.w CODE_B6D923			;$B6D9A2

CODE_B6D9A5:
	DEC.w $1B7D				;$B6D9A5
	BNE.b CODE_B6D9BB			;$B6D9A8
	TYX					;$B6D9AA
	INC.b $38,x				;$B6D9AB
	LDY.w $1B83				;$B6D9AD
	LDA.w #$000C				;$B6D9B0
	STA.w $0038,y				;$B6D9B3
	LDA.w #$0000				;$B6D9B6
	STA.b $5C,x				;$B6D9B9
CODE_B6D9BB:
	JMP.w CODE_B6D923			;$B6D9BB

CODE_B6D9BE:
	LDX.w $1B83				;$B6D9BE
	LDA.b $38,x				;$B6D9C1
	BNE.b CODE_B6D9CE			;$B6D9C3
	TYX					;$B6D9C5
	INC.b $38,x				;$B6D9C6
	LDA.w #$0001				;$B6D9C8
	JSR.w CODE_B6DF7A			;$B6D9CB
CODE_B6D9CE:
	JMP.w CODE_B6D923			;$B6D9CE

CODE_B6D9D1:
	JSR.w CODE_B6DF6F			;$B6D9D1
	BNE.b CODE_B6D9E4			;$B6D9D4
	LDA.w #$0002				;$B6D9D6
	STA.b $38,x				;$B6D9D9
	LDX.w $1B6F				;$B6D9DB
	STA.b $38,x				;$B6D9DE
	LDX.b current_sprite			;$B6D9E0
	INC.b $38,x				;$B6D9E2
CODE_B6D9E4:
	JMP.w CODE_B6D923			;$B6D9E4

CODE_B6D9E7:
	JSR.w CODE_B6DF6F			;$B6D9E7
	BNE.b CODE_B6DA27			;$B6D9EA
	TYX					;$B6D9EC
	INC.b $38,x				;$B6D9ED
	JSR.w CODE_B6DF97			;$B6D9EF
	LDA.w $1C37				;$B6D9F2
	EOR.w #$0001				;$B6D9F5
	STA.w $1C37				;$B6D9F8
	BEQ.b CODE_B6DA02			;$B6D9FB
	LDA.w $1C35				;$B6D9FD
	BNE.b CODE_B6DA05			;$B6DA00
CODE_B6DA02:
	LDA.w $000A,y				;$B6DA02
CODE_B6DA05:
	STA.w $1B7D				;$B6DA05
	LDX.w $1B79				;$B6DA08
	LDA.w #$3000				;$B6DA0B
	JSR.w CODE_B6F23E			;$B6DA0E
	LDX.w $1B7B				;$B6DA11
	LDA.w #$3000				;$B6DA14
	JSR.w CODE_B6F23E			;$B6DA17
	LDA.w #$0040				;$B6DA1A
	LDX.w $1B6F				;$B6DA1D
	STA.b $3A,x				;$B6DA20
	LDX.w $1B77				;$B6DA22
	STA.b $3A,x				;$B6DA25
CODE_B6DA27:
	JMP.w CODE_B6D923			;$B6DA27

CODE_B6DA2A:
	DEC.w $1B7D				;$B6DA2A
	BNE.b CODE_B6DA35			;$B6DA2D
	TYX					;$B6DA2F
	INC.b $38,x				;$B6DA30
	JSR.w CODE_B6DF3F			;$B6DA32
CODE_B6DA35:
	JMP.w CODE_B6D923			;$B6DA35

CODE_B6DA38:
	JSR.w CODE_B6DF6F			;$B6DA38
	BNE.b CODE_B6DA41			;$B6DA3B
	TYX					;$B6DA3D
	JSR.w CODE_B6DA44			;$B6DA3E
CODE_B6DA41:
	JMP.w CODE_B6D923			;$B6DA41

CODE_B6DA44:
	STZ.b $38,x				;$B6DA44
	INC.b $38,x				;$B6DA46
	JSR.w CODE_B6DF97			;$B6DA48
	LDA.w $000C,y				;$B6DA4B
	STA.w $1B7D				;$B6DA4E
	RTS					;$B6DA51

CODE_B6DA52:
	JSR.w CODE_B6DF6F			;$B6DA52
	BNE.b CODE_B6DABA			;$B6DA55
	DEC.w $1B75				;$B6DA57
	BNE.b CODE_B6DA9A			;$B6DA5A
	LDX.w $1B6F				;$B6DA5C
	LDA.w #$39EE				;$B6DA5F
	STA.b $24,x				;$B6DA62
	STA.b $60,x				;$B6DA64
	STZ.b $38,x				;$B6DA66
	STZ.b $5C,x				;$B6DA68
	LDX.w $1B77				;$B6DA6A
	LDA.w #$39EE				;$B6DA6D
	STA.b $24,x				;$B6DA70
	STA.b $60,x				;$B6DA72
	STZ.b $5C,x				;$B6DA74
	STZ.b $38,x				;$B6DA76
	LDA.w #$00FF				;$B6DA78
	STA.w $1B93				;$B6DA7B
	JSR.w CODE_B6DACA			;$B6DA7E
	LDY.b current_sprite			;$B6DA81
	LDA.w #$000C				;$B6DA83
	STA.w $0038,y				;$B6DA86
	LDX.w $1B83				;$B6DA89
	LDA.w #$0007				;$B6DA8C
	STA.b $38,x				;$B6DA8F
	LDA.w #$066F				;$B6DA91
	JSL.l queue_sound_effect		;$B6DA94
	BRA.b CODE_B6DABA			;$B6DA98

CODE_B6DA9A:
	LDA.w #$066E				;$B6DA9A
	JSL.l queue_sound_effect		;$B6DA9D
	TYX					;$B6DAA1
	INC.b $38,x				;$B6DAA2
	LDX.w $1B6F				;$B6DAA4
	LDA.w #$000A				;$B6DAA7
	STA.b $38,x				;$B6DAAA
	JSR.w CODE_B6DABD			;$B6DAAC
	LDX.w $1B77				;$B6DAAF
	LDA.w #$000A				;$B6DAB2
	STA.b $38,x				;$B6DAB5
	JSR.w CODE_B6DABD			;$B6DAB7
CODE_B6DABA:
	JMP.w CODE_B6D92F			;$B6DABA

CODE_B6DABD:
	JSR.w CODE_B6DDFE			;$B6DABD
	STX.b alternate_sprite			;$B6DAC0
	LDA.w #$02D6				;$B6DAC2
	JSL.l set_alt_sprite_animation		;$B6DAC5
	RTS					;$B6DAC9

CODE_B6DACA:
	LDX.w $1B71				;$B6DACA
	JSL.l CODE_BB85E8			;$B6DACD
	LDX.w $1B73				;$B6DAD1
	JSL.l CODE_BB85E8			;$B6DAD4
	LDX.w $1B79				;$B6DAD8
	JSL.l CODE_BB85E8			;$B6DADB
	LDX.w $1B7B				;$B6DADF
	JSL.l CODE_BB85E8			;$B6DAE2
	RTS					;$B6DAE6

CODE_B6DAE7:
	JSR.w CODE_B6DF6F			;$B6DAE7
	BNE.b CODE_B6DAF0			;$B6DAEA
	TYX					;$B6DAEC
	JSR.w CODE_B6DA44			;$B6DAED
CODE_B6DAF0:
	JMP.w CODE_B6D92F			;$B6DAF0

CODE_B6DAF3:
	LDX.w $1B83				;$B6DAF3
	LDA.b $38,x				;$B6DAF6
	BNE.b CODE_B6DB20			;$B6DAF8
	TYX					;$B6DAFA
	INC.b $38,x				;$B6DAFB
	LDX.b level_number			;$B6DAFD
	LDA.w $0632,x				;$B6DAFF
	BIT.w #$0002				;$B6DB02
	BNE.b CODE_B6DB0D			;$B6DB05
	STZ.w $073C				;$B6DB07
	STZ.w $074C				;$B6DB0A
CODE_B6DB0D:
	LDY.w #$0176				;$B6DB0D
	JSL.l CODE_B5803C			;$B6DB10
	LDX.b alternate_sprite			;$B6DB14
	LDA.w #$01A0				;$B6DB16
	STA.b $12,x				;$B6DB19
	LDA.w #$0166				;$B6DB1B
	STA.b $16,x				;$B6DB1E
CODE_B6DB20:
	JMP.w CODE_B6D923			;$B6DB20

CODE_B6DB23:
	JMP.w CODE_B6D92F			;$B6DB23

CODE_B6DB26:
	DEC.w $1B93				;$B6DB26
	BPL.b CODE_B6DB59			;$B6DB29
	LDA.w #$000A				;$B6DB2B
	STA.w $1B93				;$B6DB2E
	LDA.w #$0032				;$B6DB31
	JSL.l CODE_B58006			;$B6DB34
	CMP.w #$0007				;$B6DB38
	BCS.b CODE_B6DB59			;$B6DB3B
	LDX.w $1B6F				;$B6DB3D
	LDA.b $5C,x				;$B6DB40
	BNE.b CODE_B6DB4B			;$B6DB42
	LDA.b $38,x				;$B6DB44
	BNE.b CODE_B6DB59			;$B6DB46
	JSR.w CODE_B6DF87			;$B6DB48
CODE_B6DB4B:
	LDX.w $1B77				;$B6DB4B
	LDA.b $5C,x				;$B6DB4E
	BNE.b CODE_B6DB59			;$B6DB50
	LDA.b $38,x				;$B6DB52
	BNE.b CODE_B6DB59			;$B6DB54
	JSR.w CODE_B6DF87			;$B6DB56
CODE_B6DB59:
	RTS					;$B6DB59

CODE_B6DB5A:
	LDX.w $1B6F				;$B6DB5A
	LDA.b $5C,x				;$B6DB5D
	CMP.w #$0002				;$B6DB5F
	BNE.b CODE_B6DB91			;$B6DB62
	LDX.w $1B77				;$B6DB64
	LDA.b $5C,x				;$B6DB67
	CMP.w #$0002				;$B6DB69
	BNE.b CODE_B6DB91			;$B6DB6C
	LDY.b current_sprite			;$B6DB6E
	LDA.w #$000A				;$B6DB70
	STA.w $0038,y				;$B6DB73
	JSR.w CODE_B6DF3F			;$B6DB76
	STZ.b $5C,x				;$B6DB79
	LDA.w #$39EE				;$B6DB7B
	STA.b $60,x				;$B6DB7E
	LDX.w $1B77				;$B6DB80
	STZ.b $5C,x				;$B6DB83
	LDA.w #$39EE				;$B6DB85
	STA.b $60,x				;$B6DB88
	LDA.w #$066F				;$B6DB8A
	JSL.l queue_sound_effect		;$B6DB8D
CODE_B6DB91:
	RTS					;$B6DB91

CODE_B6DB92:
	LDY.b current_sprite			;$B6DB92
	LDA.w $005C,y				;$B6DB94
	AND.w #$00FF				;$B6DB97
	ASL					;$B6DB9A
	TAX					;$B6DB9B
	JMP.w (DATA_B6DB9F,x)			;$B6DB9C

DATA_B6DB9F:
	dw CODE_B6DBA3
	dw CODE_B6DBA4

CODE_B6DBA3:
	RTS					;$B6DBA3

CODE_B6DBA4:
	TYX					;$B6DBA4
	LDA.w #$0569				;$B6DBA5
	JSL.l CODE_B28024			;$B6DBA8
	LDA.b $60,x				;$B6DBAC
	CLC					;$B6DBAE
	ADC.b $2A,x				;$B6DBAF
	STA.b $60,x				;$B6DBB1
	DEC.b $5E,x				;$B6DBB3
	LDA.b $5E,x				;$B6DBB5
	AND.w #$00FF				;$B6DBB7
	BNE.b CODE_B6DBC6			;$B6DBBA
	LDA.b $5E,x				;$B6DBBC
	XBA					;$B6DBBE
	ORA.b $5E,x				;$B6DBBF
	STA.b $5E,x				;$B6DBC1
	JSR.w CODE_B6DBC7			;$B6DBC3
CODE_B6DBC6:
	RTS					;$B6DBC6

CODE_B6DBC7:
	%pea_use_dbr($7E8029)			;$B6DBC7
	PLB					;$B6DBCA
	LDA.w #$7E6780				;$B6DBCB
CODE_B6DBCE:
	TAY					;$B6DBCE
	LDX.w $0000,y				;$B6DBCF
	BEQ.b CODE_B6DBDF			;$B6DBD2
	CLC					;$B6DBD4
	ADC.w #$0014				;$B6DBD5
	CMP.w #$7E6B68				;$B6DBD8
	BNE.b CODE_B6DBCE			;$B6DBDB
CODE_B6DBDD:
	PLB					;$B6DBDD
	RTS					;$B6DBDE

CODE_B6DBDF:
	TYX					;$B6DBDF
	PHX					;$B6DBE0
	LDY.b current_sprite			;$B6DBE1
	LDA.w $0012,y				;$B6DBE3
	STA.w $0004,x				;$B6DBE6
	LDA.w $0016,y				;$B6DBE9
	CLC					;$B6DBEC
	ADC.w #$0014				;$B6DBED
	STA.w $0008,x				;$B6DBF0
	LDA.w $006A,y				;$B6DBF3
	STA.w $000C,x				;$B6DBF6
	STZ.w $0002,x				;$B6DBF9
	STZ.w $0006,x				;$B6DBFC
	STZ.w $0012,x				;$B6DBFF
	PHB					;$B6DC02
	PHK					;$B6DC03
	PLB					;$B6DC04
	LDA.w $0062,y				;$B6DC05
	AND.w #$FF00				;$B6DC08
	STA.b $3E				;$B6DC0B
	LDA.w $0061,y				;$B6DC0D
	AND.w #$00FF				;$B6DC10
	STA.b $40				;$B6DC13
	JSL.l CODE_B9E009			;$B6DC15
	JSR.w CODE_B6DCC3			;$B6DC19
	CLC					;$B6DC1C
	ADC.w $0012,y				;$B6DC1D
	STA.b $1A				;$B6DC20
	LDA.b $40				;$B6DC22
	JSL.l CODE_B9E00C			;$B6DC24
	JSR.w CODE_B6DCC3			;$B6DC28
	EOR.w #$FFFF				;$B6DC2B
	SEC					;$B6DC2E
	ADC.w $0016,y				;$B6DC2F
	STA.b $1C				;$B6DC32
	TYX					;$B6DC34
	LDA.b $1A				;$B6DC35
	SEC					;$B6DC37
	SBC.b $12,x				;$B6DC38
	PHP					;$B6DC3A
	BPL.b CODE_B6DC41			;$B6DC3B
	EOR.w #$FFFF				;$B6DC3D
	INC					;$B6DC40
CODE_B6DC41:
	XBA					;$B6DC41
	STA.w CPU.dividen_low			;$B6DC42
	SEP.b #$20				;$B6DC45
	LDA.b $61,x				;$B6DC47
	CLC					;$B6DC49
	ADC.b #$40				;$B6DC4A
	BMI.b CODE_B6DC6C			;$B6DC4C
	LDA.b $61,x				;$B6DC4E
	BPL.b CODE_B6DC59			;$B6DC50
	LDA.b #$80				;$B6DC52
	SEC					;$B6DC54
	SBC.b $61,x				;$B6DC55
	BRA.b CODE_B6DC5E			;$B6DC57

CODE_B6DC59:
	AND.b #$3F				;$B6DC59
	SEC					;$B6DC5B
	SBC.b #$80				;$B6DC5C
CODE_B6DC5E:
	EOR.b #$FF				;$B6DC5E
	INC					;$B6DC60
	LSR					;$B6DC61
	LSR					;$B6DC62
	LSR					;$B6DC63
	LSR					;$B6DC64
	CLC					;$B6DC65
	SBC.b $6A,x				;$B6DC66
	EOR.b #$FF				;$B6DC68
	BRA.b CODE_B6DC6E			;$B6DC6A

CODE_B6DC6C:
	LDA.b $6A,x				;$B6DC6C
CODE_B6DC6E:
	TAY					;$B6DC6E
	STA.w CPU.divisor			;$B6DC6F
	REP.b #$20				;$B6DC72
	JSL.l stall_cpu_time			;$B6DC74
	LDA.w CPU.divide_result			;$B6DC78
	PLP					;$B6DC7B
	BPL.b CODE_B6DC82			;$B6DC7C
	EOR.w #$FFFF				;$B6DC7E
	INC					;$B6DC81
CODE_B6DC82:
	STA.b $1A				;$B6DC82
	LDA.b $1C				;$B6DC84
	SEC					;$B6DC86
	SBC.b $16,x				;$B6DC87
	PHP					;$B6DC89
	BPL.b CODE_B6DC90			;$B6DC8A
	EOR.w #$FFFF				;$B6DC8C
	INC					;$B6DC8F
CODE_B6DC90:
	XBA					;$B6DC90
	STA.w CPU.dividen_low			;$B6DC91
	SEP.b #$20				;$B6DC94
	TYA					;$B6DC96
	STA.w CPU.divisor			;$B6DC97
	REP.b #$20				;$B6DC9A
	JSL.l stall_cpu_time			;$B6DC9C
	LDA.w CPU.divide_result			;$B6DCA0
	PLP					;$B6DCA3
	BPL.b CODE_B6DCAA			;$B6DCA4
	EOR.w #$FFFF				;$B6DCA6
	INC					;$B6DCA9
CODE_B6DCAA:
	PLB					;$B6DCAA
	PLX					;$B6DCAB
	STA.w $0010,x				;$B6DCAC
	LDA.b $1A				;$B6DCAF
	STA.w $000E,x				;$B6DCB1
	LDA.w #DATA_B6E21C			;$B6DCB4
	STA.w $0000,x				;$B6DCB7
	LDA.w #$0040				;$B6DCBA
	STA.w $000A,x				;$B6DCBD
	JMP.w CODE_B6DBDD			;$B6DCC0

CODE_B6DCC3:
	BPL.b CODE_B6DCD8			;$B6DCC3
	EOR.w #$FFFF				;$B6DCC5
	INC					;$B6DCC8
	ORA.b $3E				;$B6DCC9
	STA.w CPU.multiply_A			;$B6DCCB
	LDA.w CPU.multiply_result		;$B6DCCE
	LDA.w CPU.multiply_result_high		;$B6DCD1
	AND.w #$00FF				;$B6DCD4
	RTS					;$B6DCD7

CODE_B6DCD8:
	ORA.b $3E				;$B6DCD8
	STA.w CPU.multiply_A			;$B6DCDA
	LDA.w CPU.multiply_result		;$B6DCDD
	LDA.w CPU.multiply_result_high		;$B6DCE0
	AND.w #$00FF				;$B6DCE3
	EOR.w #$FFFF				;$B6DCE6
	INC					;$B6DCE9
	RTS					;$B6DCEA

squirts_eye_part_main:
	JMP.w (DATA_B6DCEE,x)			;$B6DCEB

DATA_B6DCEE:
	dw CODE_B6DD12
	dw CODE_B6DDA3
	dw CODE_B6DDB9
	dw CODE_B6DDD4
	dw CODE_B6DE08
	dw CODE_B6DE1E
	dw CODE_B6DE1E
	dw CODE_B6DE21
	dw CODE_B6DE32
	dw CODE_B6DE5A
	dw CODE_B6DE6F
	dw CODE_B6DE72
	dw CODE_B6DE78
	dw CODE_B6DE94
	dw CODE_B6DEB0
	dw CODE_B6DEBE
	dw CODE_B6DED1
	dw CODE_B6DF1F

CODE_B6DD12:
	LDX.b current_sprite			;$B6DD12
	LDA.b $3C,x				;$B6DD14
	BEQ.b CODE_B6DD35			;$B6DD16
	STZ.b $3C,x				;$B6DD18
	LDA.b $5C,x				;$B6DD1A
	CMP.w #$0002				;$B6DD1C
	BCS.b CODE_B6DD35			;$B6DD1F
	JSR.w CODE_B6DD6D			;$B6DD21
	LDA.w #$0670				;$B6DD24
	JSL.l queue_sound_effect		;$B6DD27
	INC.b $5C,x				;$B6DD2B
	JSR.w CODE_B6DDFE			;$B6DD2D
	LDA.w #$0404				;$B6DD30
	STA.b $5E,x				;$B6DD33
CODE_B6DD35:
	LDA.b $24,x				;$B6DD35
	CMP.b $60,x				;$B6DD37
	BEQ.b CODE_B6DD62			;$B6DD39
	PHP					;$B6DD3B
	DEC.b $5E,x				;$B6DD3C
	LDA.b $5E,x				;$B6DD3E
	AND.w #$00FF				;$B6DD40
	BNE.b CODE_B6DD5E			;$B6DD43
	LDA.b $5E,x				;$B6DD45
	XBA					;$B6DD47
	ORA.b $5E,x				;$B6DD48
	STA.b $5E,x				;$B6DD4A
	LDA.b $24,x				;$B6DD4C
	PLP					;$B6DD4E
	BCS.b CODE_B6DD56			;$B6DD4F
	ADC.w #$0005				;$B6DD51
	BRA.b CODE_B6DD59			;$B6DD54

CODE_B6DD56:
	SBC.w #$0005				;$B6DD56
CODE_B6DD59:
	STA.b $24,x				;$B6DD59
	JML [$04F5]				;$B6DD5B

CODE_B6DD5E:
	PLP					;$B6DD5E
	JML [$04F5]				;$B6DD5F

CODE_B6DD62:
	SEP.b #$20				;$B6DD62
	LDA.b $5F,x				;$B6DD64
	STA.b $5E,x				;$B6DD66
	REP.b #$20				;$B6DD68
	JML [$04F5]				;$B6DD6A

CODE_B6DD6D:
	LDA.b $12,x				;$B6DD6D
	STA.w $1867				;$B6DD6F
	LDA.b $16,x				;$B6DD72
	STA.w $1869				;$B6DD74
	LDY.w #$000C				;$B6DD77
	JSL.l CODE_BB8585			;$B6DD7A
	BCS.b CODE_B6DDA0			;$B6DD7E
	LDX.b current_sprite			;$B6DD80
	LDY.b alternate_sprite			;$B6DD82
	LDA.b $1E,x				;$B6DD84
	EOR.w $001E,y				;$B6DD86
	AND.w #$3000				;$B6DD89
	EOR.w $001E,y				;$B6DD8C
	STA.w $001E,y				;$B6DD8F
	LDA.b $0E,x				;$B6DD92
	EOR.w $000E,y				;$B6DD94
	AND.w #$0040				;$B6DD97
	EOR.w $000E,y				;$B6DD9A
	STA.w $000E,y				;$B6DD9D
CODE_B6DDA0:
	LDX.b current_sprite			;$B6DDA0
	RTS					;$B6DDA2

CODE_B6DDA3:
	TYX					;$B6DDA3
	LDA.w #$39EE				;$B6DDA4
	STA.b $60,x				;$B6DDA7
	LDA.w #$000E				;$B6DDA9
	STA.b $38,x				;$B6DDAC
	JSR.w CODE_B6DF97			;$B6DDAE
	LDA.w $0000,y				;$B6DDB1
	STA.b $5E,x				;$B6DDB4
	JMP.w CODE_B6DD12			;$B6DDB6

CODE_B6DDB9:
	JSR.w CODE_B6DF4E			;$B6DDB9
	LDA.w #$02D2				;$B6DDBC
	JSL.l set_alt_sprite_animation		;$B6DDBF
	INC.b $38,x				;$B6DDC3
	LDY.b alternate_sprite			;$B6DDC5
	STY.b $62,x				;$B6DDC7
	TYX					;$B6DDC9
	JSR.w CODE_B6DF97			;$B6DDCA
	LDA.w $0002,y				;$B6DDCD
	STA.b $44,x				;$B6DDD0
	LDY.b current_sprite			;$B6DDD2
CODE_B6DDD4:
	LDX.b $62,y				;$B6DDD4
	LDA.b $38,x				;$B6DDD6
	BNE.b CODE_B6DDFB			;$B6DDD8
	TXY					;$B6DDDA
	JSR.w CODE_B6F3EB			;$B6DDDB
	LDA.w #$3000				;$B6DDDE
	JSR.w CODE_B6F23E			;$B6DDE1
	JSR.w CODE_B6DDFE			;$B6DDE4
	STZ.b $38,x				;$B6DDE7
	LDX.w $1B71				;$B6DDE9
	LDA.w #$3000				;$B6DDEC
	JSR.w CODE_B6F23E			;$B6DDEF
	LDX.w $1B73				;$B6DDF2
	LDA.w #$3000				;$B6DDF5
	JSR.w CODE_B6F23E			;$B6DDF8
CODE_B6DDFB:
	JMP.w CODE_B6DD12			;$B6DDFB

CODE_B6DDFE:
	LDA.b $5C,x				;$B6DDFE
	ASL					;$B6DE00
	TAY					;$B6DE01
	LDA.w DATA_B6DF39,y			;$B6DE02
	STA.b $60,x				;$B6DE05
	RTS					;$B6DE07

CODE_B6DE08:
	TYX					;$B6DE08
	LDA.b $60,x				;$B6DE09
	CMP.b $24,x				;$B6DE0B
	BNE.b CODE_B6DE1B			;$B6DE0D
	LDA.w #$063E				;$B6DE0F
	JSL.l queue_sound_effect		;$B6DE12
	STZ.b $38,x				;$B6DE16
	JSR.w CODE_B6DDFE			;$B6DE18
CODE_B6DE1B:
	JMP.w CODE_B6DD12			;$B6DE1B

CODE_B6DE1E:
	JML [$04F5]				;$B6DE1E

CODE_B6DE21:
	TYX					;$B6DE21
	LDA.w #$3A07				;$B6DE22
	STA.b $60,x				;$B6DE25
	INC.b $38,x				;$B6DE27
	JSR.w CODE_B6DF97			;$B6DE29
	LDA.w $0004,y				;$B6DE2C
	STA.b $5E,x				;$B6DE2F
	TXY					;$B6DE31
CODE_B6DE32:
	LDA.w $0060,y				;$B6DE32
	CMP.w $0024,y				;$B6DE35
	BNE.b CODE_B6DE57			;$B6DE38
	LDY.w #$01DC				;$B6DE3A
	JSL.l CODE_BB8585			;$B6DE3D
	LDA.w #$02D4				;$B6DE41
	JSL.l set_alt_sprite_animation		;$B6DE44
	INC.b $38,x				;$B6DE48
	LDY.b alternate_sprite			;$B6DE4A
	STY.b $62,x				;$B6DE4C
	TYX					;$B6DE4E
	JSR.w CODE_B6DF97			;$B6DE4F
	LDA.w $0006,y				;$B6DE52
	STA.b $44,x				;$B6DE55
CODE_B6DE57:
	JMP.w CODE_B6DD12			;$B6DE57

CODE_B6DE5A:
	LDX.b $62,y				;$B6DE5A
	LDA.b $38,x				;$B6DE5C
	BNE.b CODE_B6DE6C			;$B6DE5E
	TXY					;$B6DE60
	JSR.w CODE_B6F3EB			;$B6DE61
	LDA.w #$3000				;$B6DE64
	JSR.w CODE_B6F23E			;$B6DE67
	STZ.b $38,x				;$B6DE6A
CODE_B6DE6C:
	JMP.w CODE_B6DD12			;$B6DE6C

CODE_B6DE6F:
	JMP.w CODE_B685E6			;$B6DE6F

CODE_B6DE72:
	TYX					;$B6DE72
	STZ.b $38,x				;$B6DE73
	JML [$04F5]				;$B6DE75

CODE_B6DE78:
	TYX					;$B6DE78
	INC.b $38,x				;$B6DE79
	LDA.w #$2000				;$B6DE7B
	JSR.w CODE_B6F23E			;$B6DE7E
	LDY.w #$01DC				;$B6DE81
	JSL.l CODE_BB8585			;$B6DE84
	LDA.w #$02D5				;$B6DE88
	JSL.l set_alt_sprite_animation		;$B6DE8B
	LDY.b alternate_sprite			;$B6DE8F
	STY.b $62,x				;$B6DE91
	TXY					;$B6DE93
CODE_B6DE94:
	LDX.b $62,y				;$B6DE94
	LDA.b $38,x				;$B6DE96
	BNE.b CODE_B6DEAD			;$B6DE98
	TXY					;$B6DE9A
	JSR.w CODE_B6F3EB			;$B6DE9B
	LDA.w #$3A11				;$B6DE9E
	STA.b $60,x				;$B6DEA1
	INC.b $38,x				;$B6DEA3
	JSR.w CODE_B6DF97			;$B6DEA5
	LDA.w $0004,y				;$B6DEA8
	STA.b $5E,x				;$B6DEAB
CODE_B6DEAD:
	JMP.w CODE_B6DD12			;$B6DEAD

CODE_B6DEB0:
	LDA.w $0060,y				;$B6DEB0
	CMP.w $0024,y				;$B6DEB3
	BNE.b CODE_B6DEBB			;$B6DEB6
	TYX					;$B6DEB8
	STZ.b $38,x				;$B6DEB9
CODE_B6DEBB:
	JMP.w CODE_B6DD12			;$B6DEBB

CODE_B6DEBE:
	TYX					;$B6DEBE
	LDA.w #$39EE				;$B6DEBF
	STA.b $60,x				;$B6DEC2
	INC.b $38,x				;$B6DEC4
	JSR.w CODE_B6DF97			;$B6DEC6
	LDA.w $0000,y				;$B6DEC9
	STA.b $5E,x				;$B6DECC
	JMP.w CODE_B6DD12			;$B6DECE

CODE_B6DED1:
	LDA.w $0060,y				;$B6DED1
	CMP.w $0024,y				;$B6DED4
	BNE.b CODE_B6DF1C			;$B6DED7
	TYX					;$B6DED9
	INC.b $38,x				;$B6DEDA
	LDA.w #$2000				;$B6DEDC
	JSR.w CODE_B6F23E			;$B6DEDF
	LDX.w $1B79				;$B6DEE2
	LDA.w #$2000				;$B6DEE5
	JSR.w CODE_B6F23E			;$B6DEE8
	LDX.w $1B7B				;$B6DEEB
	LDA.w #$2000				;$B6DEEE
	JSR.w CODE_B6F23E			;$B6DEF1
	JSR.w CODE_B6DF4E			;$B6DEF4
	LDA.w #$02D3				;$B6DEF7
	JSL.l set_alt_sprite_animation		;$B6DEFA
	LDY.b alternate_sprite			;$B6DEFE
	STY.b $62,x				;$B6DF00
	JSR.w CODE_B6DF97			;$B6DF02
	LDA.w $0004,y				;$B6DF05
	STA.b $5E,x				;$B6DF08
	LDX.w $1B71				;$B6DF0A
	LDA.w #$2000				;$B6DF0D
	JSR.w CODE_B6F23E			;$B6DF10
	LDX.w $1B73				;$B6DF13
	LDA.w #$2000				;$B6DF16
	JSR.w CODE_B6F23E			;$B6DF19
CODE_B6DF1C:
	JMP.w CODE_B6DD12			;$B6DF1C

CODE_B6DF1F:
	LDX.b $62,y				;$B6DF1F
	LDA.b $38,x				;$B6DF21
	BNE.b CODE_B6DF36			;$B6DF23
	TXY					;$B6DF25
	JSR.w CODE_B6F3EB			;$B6DF26
	STZ.b $38,x				;$B6DF29
	JSR.w CODE_B6DF97			;$B6DF2B
	LDA.w $0004,y				;$B6DF2E
	STA.b $5E,x				;$B6DF31
	JSR.w CODE_B6DDFE			;$B6DF33
CODE_B6DF36:
	JMP.w CODE_B6DD12			;$B6DF36

DATA_B6DF39:
	dw $39DF
	dw $39E9
	dw $39EE

CODE_B6DF3F:
	LDA.w #$000F				;$B6DF3F
	JSR.w CODE_B6DF7A			;$B6DF42
	TYX					;$B6DF45
	STZ.b $3A,x				;$B6DF46
	LDX.w $1B6F				;$B6DF48
	STZ.b $3A,x				;$B6DF4B
	RTS					;$B6DF4D

CODE_B6DF4E:
	LDY.w #$01D4				;$B6DF4E
	JSL.l CODE_BB8585			;$B6DF51
	LDY.b alternate_sprite			;$B6DF55
	LDX.b current_sprite			;$B6DF57
	JSL.l CODE_B6F272			;$B6DF59
	LDA.b $1E,x				;$B6DF5D
	AND.w #$4000				;$B6DF5F
	EOR.w $001E,y				;$B6DF62
	AND.w #$4000				;$B6DF65
	EOR.w $001E,y				;$B6DF68
	STA.w $001E,y				;$B6DF6B
	RTS					;$B6DF6E

CODE_B6DF6F:
	LDX.w $1B6F				;$B6DF6F
	LDA.b $38,x				;$B6DF72
	LDX.w $1B77				;$B6DF74
	ORA.b $38,x				;$B6DF77
	RTS					;$B6DF79

CODE_B6DF7A:
	LDY.w $1B6F				;$B6DF7A
	STA.w $0038,y				;$B6DF7D
	LDY.w $1B77				;$B6DF80
	STA.w $0038,y				;$B6DF83
	RTS					;$B6DF86

CODE_B6DF87:
	LDA.w #$39EE				;$B6DF87
	STA.b $60,x				;$B6DF8A
	LDA.w #$0404				;$B6DF8C
	STA.b $5E,x				;$B6DF8F
	LDA.w #$0004				;$B6DF91
	STA.b $38,x				;$B6DF94
	RTS					;$B6DF96

CODE_B6DF97:
	LDA.w $1B75				;$B6DF97
	ASL					;$B6DF9A
	TAY					;$B6DF9B
	LDA.w DATA_B6DFA1,y			;$B6DF9C
	TAY					;$B6DF9F
	RTS					;$B6DFA0

DATA_B6DFA1:
	dw DATA_B6DFE5
	dw DATA_B6DFD1
	dw DATA_B6DFBD
	dw DATA_B6DFA9

DATA_B6DFA9:
	dw $0404
	dw $0100
	dw $0404
	dw $0100
	dw $01F0
	dw $00C8
	dw $0019
	dw $001E
	dw $0080
	dw $0303


DATA_B6DFBD:
	dw $0404
	dw $0100
	dw $0404
	dw $0100
	dw $02F0
	dw $00B4
	dw $0019
	dw $001E
	dw $00B0
	dw $0303


DATA_B6DFD1:
	dw $0404
	dw $0100
	dw $0404
	dw $0100
	dw $0250
	dw $00A0
	dw $0019
	dw $001E
	dw $00E0
	dw $0303


DATA_B6DFE5:
	dw $0404
	dw $0100
	dw $0404
	dw $0100
	dw $0250
	dw $00A0
	dw $0019
	dw $001E
	dw $00E0
	dw $0303


CODE_B6DFF9:
	PHB					;$B6DFF9
	STZ.w $1B6D				;$B6DFFA
	%pea_mask_dbr(wram_base)		;$B6DFFD
	PLB					;$B6E000
	PLB					;$B6E001
	LDX.w $1B6B				;$B6E002
	LDA.b $1E,x				;$B6E005
	STA.b $1A				;$B6E007
	LDA.w $1973				;$B6E009
	SEC					;$B6E00C
	SBC.w #$0010				;$B6E00D
	STA.b $1C				;$B6E010
	CLC					;$B6E012
	ADC.w #$00F0				;$B6E013
	STA.b $1E				;$B6E016
	LDA.w $196D				;$B6E018
	SEC					;$B6E01B
	SBC.w #$0010				;$B6E01C
	STA.b $20				;$B6E01F
	CLC					;$B6E021
	ADC.w #$0110				;$B6E022
	STA.b $22				;$B6E025
	LDA.w #$7E6780				;$B6E027
CODE_B6E02A:
	TAY					;$B6E02A
	LDA.w $0000,y				;$B6E02B
	BNE.b CODE_B6E03C			;$B6E02E
	TYA					;$B6E030
CODE_B6E031:
	CLC					;$B6E031
	ADC.w #$0014				;$B6E032
	CMP.w #$6B68				;$B6E035
	BNE.b CODE_B6E02A			;$B6E038
	PLB					;$B6E03A
	RTL					;$B6E03B

CODE_B6E03C:
	STY.b $6E				;$B6E03C
	TYX					;$B6E03E
	DEC.w $000C,x				;$B6E03F
	BNE.b CODE_B6E059			;$B6E042
	LDA.w #DATA_B6E237			;$B6E044
	STA.w $0000,y				;$B6E047
	LDA.w #$0028				;$B6E04A
	STA.w $000A,y				;$B6E04D
	LDA.w #$4000				;$B6E050
	ORA.w $0012,y				;$B6E053
	STA.w $0012,y				;$B6E056
CODE_B6E059:
	LDA.w $000E,y				;$B6E059
	CLC					;$B6E05C
	BPL.b CODE_B6E06A			;$B6E05D
	LDX.w #$FFFF				;$B6E05F
	ADC.w #$0000				;$B6E062
	BMI.b CODE_B6E073			;$B6E065
	INX					;$B6E067
	BRA.b CODE_B6E072			;$B6E068

CODE_B6E06A:
	LDX.w #$0000				;$B6E06A
	ADC.w #$0000				;$B6E06D
	BPL.b CODE_B6E073			;$B6E070
CODE_B6E072:
	TXA					;$B6E072
CODE_B6E073:
	STA.w $000E,y				;$B6E073
	CLC					;$B6E076
	ADC.w $0003,y				;$B6E077
	STA.w $0003,y				;$B6E07A
	SEP.b #$20				;$B6E07D
	TXA					;$B6E07F
	ADC.w $0005,y				;$B6E080
	STA.w $0005,y				;$B6E083
	REP.b #$20				;$B6E086
	XBA					;$B6E088
	CMP.b $20				;$B6E089
	BCC.b CODE_B6E0BC			;$B6E08B
	CMP.b $22				;$B6E08D
	BCS.b CODE_B6E0BC			;$B6E08F
	LDX.w #$0000				;$B6E091
	LDA.w $0010,y				;$B6E094
	CLC					;$B6E097
	ADC.w #$000C				;$B6E098
	STA.w $0010,y				;$B6E09B
	BPL.b CODE_B6E0A1			;$B6E09E
	DEX					;$B6E0A0
CODE_B6E0A1:
	CLC					;$B6E0A1
	ADC.w $0007,y				;$B6E0A2
	STA.w $0007,y				;$B6E0A5
	SEP.b #$20				;$B6E0A8
	TXA					;$B6E0AA
	ADC.w $0009,y				;$B6E0AB
	STA.w $0009,y				;$B6E0AE
	REP.b #$20				;$B6E0B1
	XBA					;$B6E0B3
	CMP.b $1C				;$B6E0B4
	BCC.b CODE_B6E0BC			;$B6E0B6
	CMP.b $1E				;$B6E0B8
	BCC.b CODE_B6E0BF			;$B6E0BA
CODE_B6E0BC:
	JMP.w CODE_B6E214			;$B6E0BC

CODE_B6E0BF:									; Note: Related to Squirt's water stream.
	SEP.b #$20				;$B6E0BF
	LDA.w $000B,y				;$B6E0C1
	CLC					;$B6E0C4
	ADC.w $000A,y				;$B6E0C5
	STA.w $000B,y				;$B6E0C8
	REP.b #$20				;$B6E0CB
	BCC.b CODE_B6E0F1			;$B6E0CD
	LDA.w $0000,y				;$B6E0CF
	ADC.w #$0002				;$B6E0D2
	STA.w $0000,y				;$B6E0D5
	TAX					;$B6E0D8
	LDA.l DATA_B6E21C&$FF0000,x		;$B6E0D9
	AND.w #$00FF				;$B6E0DD
	CMP.w #$0080				;$B6E0E0
	BCC.b CODE_B6E0F1			;$B6E0E3
	EOR.w #$00FF				;$B6E0E5
	ASL					;$B6E0E8
	TAX					;$B6E0E9
	JMP.w (DATA_B6E0ED,x)			;$B6E0EA

DATA_B6E0ED:
	dw CODE_B6E208
	dw CODE_B6E214

CODE_B6E0F1:
	LDA.w $0004,y				;$B6E0F1
	CLC					;$B6E0F4
	ADC.w #$0100				;$B6E0F5
	SEC					;$B6E0F8
	SBC.w $196D				;$B6E0F9
	STA.b $88				;$B6E0FC
	LDA.w $0008,y				;$B6E0FE
	CLC					;$B6E101
	ADC.w #$0100				;$B6E102
	SEC					;$B6E105
	SBC.w $1973				;$B6E106
	STA.b $8A				;$B6E109
	LDX.w $0000,y				;$B6E10B
	STX.b $3E				;$B6E10E
	LDA.w $0012,y				;$B6E110
	BMI.b CODE_B6E165			;$B6E113
	LDA.w $0008,y				;$B6E115
	CMP.l $001806				;$B6E118
	BCS.b CODE_B6E165			;$B6E11C
	CMP.l $001802				;$B6E11E
	BCC.b CODE_B6E165			;$B6E122
	LDA.w $0004,y				;$B6E124
	CMP.l $001804				;$B6E127
	BCS.b CODE_B6E165			;$B6E12B
	CMP.l $001800				;$B6E12D
	BCC.b CODE_B6E165			;$B6E131
	LDA.w #$8000				;$B6E133
	ORA.w $0012,y				;$B6E136
	STA.w $0012,y				;$B6E139
	BIT.w #$4000				;$B6E13C
	BNE.b CODE_B6E14D			;$B6E13F
	LDA.w #DATA_B6E237			;$B6E141
	STA.w $0000,y				;$B6E144
	LDA.w #$0028				;$B6E147
	STA.w $000A,y				;$B6E14A
CODE_B6E14D:
	LDA.w #$0013				;$B6E14D
	JSL.l CODE_B88069			;$B6E150
	STZ.w $17CE				;$B6E154
	LDA.w $000E,y				;$B6E157
	ASL					;$B6E15A
	STA.w $17CA				;$B6E15B
	LDA.w $0010,y				;$B6E15E
	ASL					;$B6E161
	STA.w $17CC				;$B6E162
CODE_B6E165:
	PHB					;$B6E165
	PHK					;$B6E166
	PLB					;$B6E167
	LDA.w $0000,x				;$B6E168
	STA.b $3A				;$B6E16B
	LDA.w $0002,x				;$B6E16D
	STA.b $3C				;$B6E170
	LDX.b next_oam_slot			;$B6E172
	LDA.b $3B				;$B6E174
	AND.w #$00FF				;$B6E176
	CMP.w #$0080				;$B6E179
	BCC.b CODE_B6E182			;$B6E17C
	ORA.w #$FF00				;$B6E17E
	CLC					;$B6E181
CODE_B6E182:
	ADC.b $88				;$B6E182
	STA.b $00,x				;$B6E184
	BIT.w #$0100				;$B6E186
	BNE.b CODE_B6E1A4			;$B6E189
	TXA					;$B6E18B
	AND.w #$000C				;$B6E18C
	TAY					;$B6E18F
	TXA					;$B6E190
	LSR					;$B6E191
	LSR					;$B6E192
	LSR					;$B6E193
	LSR					;$B6E194
	AND.w #$001F				;$B6E195
	TAX					;$B6E198
	LDA.w DATA_B6E1F8,y			;$B6E199
	ORA.w $0400,x				;$B6E19C
	STA.w $0400,x				;$B6E19F
	LDX.b next_oam_slot			;$B6E1A2
CODE_B6E1A4:
	SEP.b #$20				;$B6E1A4
	LDA.b $3C				;$B6E1A6
	CLC					;$B6E1A8
	ADC.b $8A				;$B6E1A9
	STA.b $01,x				;$B6E1AB
	REP.b #$20				;$B6E1AD
	LDA.b $3A				;$B6E1AF
	AND.w #$00FF				;$B6E1B1
	CLC					;$B6E1B4
	ADC.b $1A				;$B6E1B5
	STA.b $02,x				;$B6E1B7
	LDA.b $3E				;$B6E1B9
	CMP.w #DATA_B6E237			;$B6E1BB
	BCC.b CODE_B6E1D9			;$B6E1BE
	TXA					;$B6E1C0
	AND.w #$000C				;$B6E1C1
	TAY					;$B6E1C4
	TXA					;$B6E1C5
	LSR					;$B6E1C6
	LSR					;$B6E1C7
	LSR					;$B6E1C8
	LSR					;$B6E1C9
	AND.w #$001F				;$B6E1CA
	TAX					;$B6E1CD
	LDA.w DATA_B6E1E8,y			;$B6E1CE
	ORA.w $0400,x				;$B6E1D1
	STA.w $0400,x				;$B6E1D4
	LDX.b next_oam_slot			;$B6E1D7
CODE_B6E1D9:
	INX					;$B6E1D9
	INX					;$B6E1DA
	INX					;$B6E1DB
	INX					;$B6E1DC
	STX.b next_oam_slot			;$B6E1DD
	INC.w $1B6D				;$B6E1DF
	LDA.b $6E				;$B6E1E2
	PLB					;$B6E1E4
	JMP.w CODE_B6E031			;$B6E1E5

DATA_B6E1E8:
	dw $0002, $0000
	dw $0008, $0000
	dw $0020, $0000
	dw $0080, $0000

DATA_B6E1F8:
	dw $0001, $0000
	dw $0004, $0000
	dw $0010, $0000
	dw $0040, $0000

CODE_B6E208:
	LDX.w $0000,y				;$B6E208
	LDA.w $0001,x				;$B6E20B
	STA.w $0000,y				;$B6E20E
	JMP.w CODE_B6E0F1			;$B6E211

CODE_B6E214:
	TYX					;$B6E214
	STZ.w $0000,x				;$B6E215
	TYA					;$B6E218
	JMP.w CODE_B6E031			;$B6E219

DATA_B6E21C:
	db $0E,$FC,$FC,$0F,$FC,$FC,$1E,$FC,$FC,$1F,$FC,$FC,$20,$FC,$FC,$21
	db $FC,$FC,$22,$FC,$FC,$23,$FC,$FC,$FF,$1C,$E2

DATA_B6E237:
	db $00,$F9,$F9,$02,$F8,$F6,$04,$F8,$F9,$06,$F8,$F9,$08,$F8,$F9,$0A
	db $F8,$F9,$0C,$F8,$FC,$FE

target_main:
	JMP.w (DATA_B6E250,x)			;$B6E24D

DATA_B6E250:
	dw CODE_B6E254
	dw CODE_B6E260

CODE_B6E254:
	TYX					;$B6E254
	DEC.b $5C,x				;$B6E255
	BNE.b CODE_B6E260			;$B6E257
	LDA.w #$018E				;$B6E259
	JSL.l set_sprite_animation		;$B6E25C
CODE_B6E260:
	JMP.w CODE_B685E6			;$B6E260

thrown_softball_main:
	LDX.b current_sprite			;$B6E263
	LDA.b $5C,x				;$B6E265
	JSL.l interpolate_x_speed		;$B6E267
	LDX.b current_sprite			;$B6E26B
	LDA.b $5E,x				;$B6E26D
	JSL.l interpolate_y_speed		;$B6E26F
	LDA.w #$0001				;$B6E273
	JSL.l process_alternate_movement	;$B6E276
	LDX.b current_sprite			;$B6E27A
	LDA.w #$016C				;$B6E27C
	CMP.b $16,x				;$B6E27F
	BCS.b CODE_B6E28D			;$B6E281
	LDA.w #$0175				;$B6E283
	CMP.b $16,x				;$B6E286
	BCC.b CODE_B6E28D			;$B6E288
	JMP.w CODE_B6F27D			;$B6E28A

CODE_B6E28D:
	JMP.w CODE_B685E6			;$B6E28D

unknown_sprite_0018_main:
	JMP.w (DATA_B6E293,x)			;$B6E290

DATA_B6E293:
	dw CODE_B6E299
	dw CODE_B6E2B7
	dw CODE_B6E2D6

CODE_B6E299:
	TYX					;$B6E299
	LDY.w $1BB9				;$B6E29A
	LDA.w current_kong			;$B6E29D
	BEQ.b CODE_B6E2A6			;$B6E2A0
	CLC					;$B6E2A2
	ADC.w #$0008				;$B6E2A3
CODE_B6E2A6:
	ADC.w $0012,y				;$B6E2A6
	STA.b $62,x				;$B6E2A9
	LDA.w $0016,y				;$B6E2AB
	SEC					;$B6E2AE
	SBC.w #$001E				;$B6E2AF
	STA.b $64,x				;$B6E2B2
	INC.b $38,x				;$B6E2B4
	TXY					;$B6E2B6
CODE_B6E2B7:
	TYX					;$B6E2B7
	JSL.l process_current_movement		;$B6E2B8
	BCC.b CODE_B6E2D3			;$B6E2BC
	LDX.b current_sprite			;$B6E2BE
	LDA.b $2A,x				;$B6E2C0
	CMP.w #$8000				;$B6E2C2
	ROR					;$B6E2C5
	EOR.w #$FFFF				;$B6E2C6
	INC					;$B6E2C9
	STA.b $2A,x				;$B6E2CA
	LDA.w #$FB00				;$B6E2CC
	STA.b $2E,x				;$B6E2CF
	INC.b $38,x				;$B6E2D1
CODE_B6E2D3:
	JMP.w CODE_B685E6			;$B6E2D3

CODE_B6E2D6:
	LDA.w #$0090				;$B6E2D6
	JSL.l CODE_B5800F			;$B6E2D9
	LDA.w #$0001				;$B6E2DD
	JSL.l process_current_movement		;$B6E2E0
	JMP.w CODE_B685E6			;$B6E2E4

unknown_sprite_001C_main:
	TYX					;$B6E2E7
	DEC.b $5C,x				;$B6E2E8
	BNE.b CODE_B6E2EF			;$B6E2EA
	JMP.w CODE_B6F27D			;$B6E2EC

CODE_B6E2EF:
	LDA.w #$0020				;$B6E2EF
	JSL.l CODE_B5800F			;$B6E2F2
	LDA.w #$0001				;$B6E2F6
	JSL.l process_alternate_movement	;$B6E2F9
	JML.l CODE_B685E6			;$B6E2FD

swanky_kong_prize_main:
	JMP.w (DATA_B6E304,x)			;$B6E301

DATA_B6E304:
	dw CODE_B6E308
	dw CODE_B6E340

CODE_B6E308:
	JSL.l process_current_movement		;$B6E308
	BCC.b CODE_B6E33D			;$B6E30C
	LDA.b $5C,x				;$B6E30E
	TAX					;$B6E310
	JMP.w (DATA_B6E314,x)			;$B6E311

DATA_B6E314:
	dw $0000
	dw CODE_B6E31A
	dw CODE_B6E333

CODE_B6E31A:
	LDX.b current_sprite			;$B6E31A
	INC.b $38,x				;$B6E31C
	LDA.w #$000A				;$B6E31E
	STA.b $68,x				;$B6E321
	SED					;$B6E323
	CLC					;$B6E324
	ADC.w $05D3				;$B6E325
	STA.w $05D3				;$B6E328
	CLD					;$B6E32B
	JSL.l CODE_B7E4A8			;$B6E32C
	JML [$04F5]				;$B6E330

CODE_B6E333:
	LDA.w #$0000				;$B6E333
	JSL.l CODE_BBC800			;$B6E336
	JML [$04F5]				;$B6E33A

CODE_B6E33D:
	JMP.w CODE_B685E6			;$B6E33D

CODE_B6E340:
	JML.l CODE_BBC812			;$B6E340

kaos_boxing_glove_main:
	PHX					;$B6E344
	LDX.w $1B6B				;$B6E345
	LDA.w $0012,y				;$B6E348
	CLC					;$B6E34B
	ADC.w $1B83				;$B6E34C
	STA.w $0012,y				;$B6E34F
	LDA.b $16,x				;$B6E352
	STA.w $0016,y				;$B6E354
	PLX					;$B6E357
	JMP.w (DATA_B6E35B,x)			;$B6E358

DATA_B6E35B:
	dw CODE_B6E363
	dw CODE_B6E387
	dw CODE_B6E387
	dw CODE_B6E38D

CODE_B6E363:
	JSR.w CODE_B6E3AB			;$B6E363
	JSL.l process_current_movement		;$B6E366
	LDY.w $1B6B				;$B6E36A
	LDA.w $0012,y				;$B6E36D
	CLC					;$B6E370
	ADC.b $5C,x				;$B6E371
	SEC					;$B6E373
	SBC.b $12,x				;$B6E374
	EOR.b $2A,x				;$B6E376
	BPL.b CODE_B6E384			;$B6E378
	INC.b $38,x				;$B6E37A
	LDA.b $2A,x				;$B6E37C
	EOR.w #$FFFF				;$B6E37E
	INC					;$B6E381
	STA.b $2A,x				;$B6E382
CODE_B6E384:
	JML [$04F5]				;$B6E384

CODE_B6E387:
	JSR.w CODE_B6E3AB			;$B6E387
	JMP.w CODE_B685E6			;$B6E38A

CODE_B6E38D:
	JSR.w CODE_B6E3AB			;$B6E38D
	JSL.l process_current_movement		;$B6E390
	LDY.w $1B6B				;$B6E394
	LDA.w $0012,y				;$B6E397
	CLC					;$B6E39A
	ADC.b $5E,x				;$B6E39B
	SEC					;$B6E39D
	SBC.b $12,x				;$B6E39E
	EOR.b $2A,x				;$B6E3A0
	BPL.b CODE_B6E3A8			;$B6E3A2
	JSL.l delete_sprite_handle_deallocation	;$B6E3A4
CODE_B6E3A8:
	JML [$04F5]				;$B6E3A8

CODE_B6E3AB:
	LDA.w $0060,y				;$B6E3AB
	BEQ.b CODE_B6E3B4			;$B6E3AE
	TYX					;$B6E3B0
	DEC.b $60,x				;$B6E3B1
	RTS					;$B6E3B3

CODE_B6E3B4:
	LDY.w active_kong_sprite		;$B6E3B4
	JSL.l CODE_BEC003			;$B6E3B7
	BCC.b CODE_B6E415			;$B6E3BB
	LDA.b $12,x				;$B6E3BD
	PHA					;$B6E3BF
	LDA.w #$FFF6				;$B6E3C0
	BIT.b $1E,x				;$B6E3C3
	BVC.b CODE_B6E3CA			;$B6E3C5
	LDA.w #$000A				;$B6E3C7
CODE_B6E3CA:
	CLC					;$B6E3CA
	ADC.b $12,x				;$B6E3CB
	STA.b $12,x				;$B6E3CD
	JSL.l CODE_BEC003			;$B6E3CF
	BCS.b CODE_B6E418			;$B6E3D3
	LDA.b $38,x				;$B6E3D5
	CMP.w #$0002				;$B6E3D7
	BCC.b CODE_B6E3EE			;$B6E3DA
	LDA.w #$0013				;$B6E3DC
	JSL.l CODE_B88069			;$B6E3DF
	BCS.b CODE_B6E416			;$B6E3E3
	LDA.w $002A,y				;$B6E3E5
	EOR.w #$FFFF				;$B6E3E8
	INC					;$B6E3EB
	BRA.b CODE_B6E401			;$B6E3EC

CODE_B6E3EE:
	LDA.w #$0013				;$B6E3EE
	JSL.l CODE_B88069			;$B6E3F1
	BCS.b CODE_B6E416			;$B6E3F5
	LDA.w #$0500				;$B6E3F7
	BIT.b $1E,x				;$B6E3FA
	BVC.b CODE_B6E401			;$B6E3FC
	LDA.w #$FB00				;$B6E3FE
CODE_B6E401:
	STA.w $17CA				;$B6E401
	LDY.w #$FF00				;$B6E404
CODE_B6E407:
	STY.w $17CC				;$B6E407
	PLA					;$B6E40A
	STA.b $12,x				;$B6E40B
	STZ.w $17CE				;$B6E40D
	LDA.w #$001E				;$B6E410
	STA.b $60,x				;$B6E413
CODE_B6E415:
	RTS					;$B6E415

CODE_B6E416:
	PLA					;$B6E416
	RTS					;$B6E417

CODE_B6E418:
	LDA.w #$0013				;$B6E418
	JSL.l CODE_B88069			;$B6E41B
	BCS.b CODE_B6E416			;$B6E41F
	LDA.w $002A,y				;$B6E421
	STA.w $17CA				;$B6E424
	LDA.w $0016,y				;$B6E427
	LDY.w #$FA00				;$B6E42A
	CMP.b $16,x				;$B6E42D
	BCC.b CODE_B6E407			;$B6E42F
	LDY.w #$0400				;$B6E431
	BRA.b CODE_B6E407			;$B6E434

kaos_bombs_main:
	JMP.w (DATA_B6E439,x)			;$B6E436

DATA_B6E439:
	dw CODE_B6E43D
	dw CODE_B6E481

CODE_B6E43D:
	JSR.w CODE_B6E48B			;$B6E43D
	BCC CODE_B6E455				;$B6E440
CODE_B6E442:
	INC.b $38,x				;$B6E442
	STZ.b $3A,x				;$B6E444
	JSL.l CODE_B6B3C6			;$B6E446
	LDA.w #$0080				;$B6E44A
	STA.b $44,x				;$B6E44D
	JSR.w CODE_B6F2A5			;$B6E44F
	JML [$04F5]				;$B6E452

CODE_B6E455:
	JSL.l process_current_movement		;$B6E455
	LDA.b $16,x				;$B6E459
	CMP.w #$01D2				;$B6E45B
	BCS.b CODE_B6E442			;$B6E45E
	LDA.b $2E,x				;$B6E460
	EOR.b $1E,x				;$B6E462
	BMI.b CODE_B6E473			;$B6E464
	JSR.w CODE_B6F2A5			;$B6E466
	LDA.w #$029B				;$B6E469
	JSL.l set_sprite_animation		;$B6E46C
CODE_B6E470:
	JML [$04F5]				;$B6E470

CODE_B6E473:
	LDA.b $2E,x				;$B6E473
	BMI.b CODE_B6E47E			;$B6E475
	LDA.b $16,x				;$B6E477
	CMP.w #$0100				;$B6E479
	BCC.b CODE_B6E470			;$B6E47C
CODE_B6E47E:
	JMP.w CODE_B685E6			;$B6E47E

CODE_B6E481:
	JSR.w CODE_B6E494			;$B6E481
	JSL.l process_current_movement		;$B6E484
	JMP.w CODE_B685E6			;$B6E488

CODE_B6E48B:
	LDA.w #$0038				;$B6E48B
	JSL.l check_throwable_collision		;$B6E48E
	BCS.b CODE_B6E4A6			;$B6E492
CODE_B6E494:
	LDX.b current_sprite			;$B6E494
	CLC					;$B6E496
	LDA.b $4C,x				;$B6E497
	BEQ.b CODE_B6E4A6			;$B6E499
	JSL.l populate_sprite_clipping		;$B6E49B
	LDA.w #$0000				;$B6E49F
	JSL.l CODE_BEC009			;$B6E4A2
CODE_B6E4A6:
	RTS					;$B6E4A6

barbos_mouth_main:
	JMP.w (DATA_B6E4AA,x)			;$B6E4A7

DATA_B6E4AA:
	dw CODE_B6E4BA
	dw CODE_B6E4BD
	dw CODE_B6E4CA
	dw CODE_B6E4E0
	dw CODE_B6E4ED
	dw CODE_B6E4F0
	dw CODE_B6E500
	dw CODE_B6E50D

CODE_B6E4BA:
	JML [$04F5]				;$B6E4BA

CODE_B6E4BD:
	TYX					;$B6E4BD
	INC.b $38,x				;$B6E4BE
	LDA.w #$023E				;$B6E4C0
	JSL.l set_sprite_animation		;$B6E4C3
	JML [$04F5]				;$B6E4C7

CODE_B6E4CA:
	LDA.w #$00FF				;$B6E4CA
	JSL.l CODE_B58006			;$B6E4CD
	CMP.w #$0003				;$B6E4D1
	BCS.b CODE_B6E4DD			;$B6E4D4
	LDA.w #$0241				;$B6E4D6
	JSL.l set_sprite_animation		;$B6E4D9
CODE_B6E4DD:
	JMP.w CODE_B685E6			;$B6E4DD

CODE_B6E4E0:
	TYX					;$B6E4E0
	INC.b $38,x				;$B6E4E1
	LDA.w #$023F				;$B6E4E3
	JSL.l set_sprite_animation		;$B6E4E6
	JML [$04F5]				;$B6E4EA

CODE_B6E4ED:
	JMP.w CODE_B685E6			;$B6E4ED

CODE_B6E4F0:
	LDA.w #$0002				;$B6E4F0
	STA.w $0038,y				;$B6E4F3
	LDA.w #$0242				;$B6E4F6
	JSL.l set_sprite_animation		;$B6E4F9
	JML [$04F5]				;$B6E4FD

CODE_B6E500:
	TYX					;$B6E500
	INC.b $38,x				;$B6E501
	LDA.w #$0240				;$B6E503
	JSL.l set_sprite_animation		;$B6E506
	JML [$04F5]				;$B6E50A

CODE_B6E50D:
	LDA.w #$00FF				;$B6E50D
	JSL.l CODE_B58006			;$B6E510
	CMP.w #$0003				;$B6E514
	BCS.b CODE_B6E520			;$B6E517
	LDA.w #$0243				;$B6E519
	JSL.l set_sprite_animation		;$B6E51C
CODE_B6E520:
	JMP.w CODE_B685E6			;$B6E520

defeated_bleak_snowball_main:
	JMP.w (DATA_B6E526,x)			;$B6E523

DATA_B6E526:
	dw CODE_B6E52C
	dw CODE_B6E550
	dw CODE_B6E595

CODE_B6E52C:
	TYX					;$B6E52C
	INC.b $38,x				;$B6E52D
CODE_B6E52F:
	LDA.b $60,x				;$B6E52F
	STA.b $6A,x				;$B6E531
	LDA.w #$0014				;$B6E533
	STA.b $5A,x				;$B6E536
	LDA.b $12,x				;$B6E538
	CLC					;$B6E53A
	ADC.b $5C,x				;$B6E53B
	STA.b $62,x				;$B6E53D
	LDA.b $44,x				;$B6E53F
	LDY.b $68,x				;$B6E541
	BNE.b CODE_B6E54B			;$B6E543
	LSR					;$B6E545
	LSR					;$B6E546
	EOR.w #$FFFF				;$B6E547
	INC					;$B6E54A
CODE_B6E54B:
	CLC					;$B6E54B
	ADC.b $16,x				;$B6E54C
	STA.b $64,x				;$B6E54E
CODE_B6E550:
	JSL.l process_current_movement		;$B6E550
	BCC.b CODE_B6E588			;$B6E554
	LDA.b $64,x				;$B6E556
	STA.b $16,x				;$B6E558
	LDA.b $68,x				;$B6E55A
	BEQ.b CODE_B6E567			;$B6E55C
	LDY.w #$00DC				;$B6E55E
	JSL.l CODE_BB8585			;$B6E561
	BRA.b CODE_B6E56E			;$B6E565

CODE_B6E567:
	LDY.w #$00DE				;$B6E567
	JSL.l CODE_BB85B8			;$B6E56A
CODE_B6E56E:
	LDX.b current_sprite			;$B6E56E
	DEC.b $6C,x				;$B6E570
	BNE.b CODE_B6E584			;$B6E572
	INC.b $38,x				;$B6E574
	LDA.b $44,x				;$B6E576
	LDY.b $68,x				;$B6E578
	BNE.b CODE_B6E580			;$B6E57A
	EOR.w #$FFFF				;$B6E57C
	INC					;$B6E57F
CODE_B6E580:
	STA.b $2E,x				;$B6E580
	BRA.b CODE_B6E595			;$B6E582

CODE_B6E584:
	LSR.b $66,x				;$B6E584
	BRA.b CODE_B6E52F			;$B6E586

CODE_B6E588:
	LDA.b $2E,x				;$B6E588
	BMI.b CODE_B6E592			;$B6E58A
	LDA.w #$3000				;$B6E58C
	JSR.w CODE_B6F23E			;$B6E58F
CODE_B6E592:
	JMP.w CODE_B685E6			;$B6E592

CODE_B6E595:
	LDA.w #$0005				;$B6E595
	JSL.l interpolate_x_speed		;$B6E598
	LDA.w #$0005				;$B6E59C
	JSL.l interpolate_y_speed		;$B6E59F
	LDA.w #$0001				;$B6E5A3
	JSL.l process_alternate_movement	;$B6E5A6
	LDA.b $44,x				;$B6E5AA
	BEQ.b CODE_B6E5C9			;$B6E5AC
	LSR					;$B6E5AE
	LSR					;$B6E5AF
	LSR					;$B6E5B0
	LSR					;$B6E5B1
	LSR					;$B6E5B2
	STA.b $1A				;$B6E5B3
	LSR					;$B6E5B5
	CLC					;$B6E5B6
	ADC.b $1A				;$B6E5B7
	BEQ.b CODE_B6E5C4			;$B6E5B9
	EOR.w #$FFFF				;$B6E5BB
	INC					;$B6E5BE
	CLC					;$B6E5BF
	ADC.b $44,x				;$B6E5C0
	BPL.b CODE_B6E5C7			;$B6E5C2
CODE_B6E5C4:
	LDA.w #$0000				;$B6E5C4
CODE_B6E5C7:
	STA.b $44,x				;$B6E5C7
CODE_B6E5C9:
	JMP.w CODE_B685E6			;$B6E5C9

arich_spit_main:
	LDA.w #$0038				;$B6E5CC
	JSL.l check_throwable_collision		;$B6E5CF
	BCS.b CODE_B6E5E2			;$B6E5D3
	JSL.l populate_sprite_clipping		;$B6E5D5
	LDA.w #$0000				;$B6E5D9
	JSL.l CODE_BEC009			;$B6E5DC
	BCC.b CODE_B6E5E5			;$B6E5E0
CODE_B6E5E2:
	JMP.w CODE_B6F27D			;$B6E5E2

CODE_B6E5E5:
	JSL.l process_current_movement		;$B6E5E5
	JMP.w CODE_B6BF79			;$B6E5E9

unknown_sprite_0024_main:
	JMP.w (DATA_B6E5EF,x)			;$B6E5EC

DATA_B6E5EF:
	dw CODE_B6E5F3
	dw CODE_B6E601

CODE_B6E5F3:
	TYX					;$B6E5F3
	JSL.l process_current_movement		;$B6E5F4
	LDA.w #$0001				;$B6E5F8
	STA.b $5A,x				;$B6E5FB
	INC.b $38,x				;$B6E5FD
	BRA.b CODE_B6E661			;$B6E5FF

CODE_B6E601:
	LDA.w #$0038				;$B6E601
	JSL.l check_throwable_collision		;$B6E604
	BCS.b CODE_B6E617			;$B6E608
	JSL.l populate_sprite_clipping		;$B6E60A
	LDA.w #$0000				;$B6E60E
	JSL.l CODE_BEC009			;$B6E611
	BCC.b CODE_B6E61A			;$B6E615
CODE_B6E617:
	JMP.w CODE_B6F27D			;$B6E617

CODE_B6E61A:
	JSL.l process_current_movement		;$B6E61A
	LDA.w #$010A				;$B6E61E
	CMP.b $12,x				;$B6E621
	BCC.b CODE_B6E634			;$B6E623
	INC					;$B6E625
	STA.b $12,x				;$B6E626
	JSR.w CODE_B6E664			;$B6E628
	LDA.w #$01DB				;$B6E62B
	JSL.l set_sprite_animation		;$B6E62E
	BRA.b CODE_B6E661			;$B6E632

CODE_B6E634:
	LDA.w #$01F7				;$B6E634
	CMP.b $12,x				;$B6E637
	BCS.b CODE_B6E649			;$B6E639
	STA.b $12,x				;$B6E63B
	JSR.w CODE_B6E664			;$B6E63D
	LDA.w #$01DB				;$B6E640
	JSL.l set_sprite_animation		;$B6E643
	BRA.b CODE_B6E661			;$B6E647

CODE_B6E649:
	LDA.w #$0255				;$B6E649
	CMP.b $16,x				;$B6E64C
	BCS.b CODE_B6E661			;$B6E64E
	STA.b $16,x				;$B6E650
	LDA.b $2E,x				;$B6E652
	EOR.w #$FFFF				;$B6E654
	INC					;$B6E657
	STA.b $2E,x				;$B6E658
	LDA.w #$01DA				;$B6E65A
	JSL.l set_sprite_animation		;$B6E65D
CODE_B6E661:
	JMP.w CODE_B6BF79			;$B6E661

CODE_B6E664:
	LDA.b $2A,x				;$B6E664
	EOR.w #$FFFF				;$B6E666
	INC					;$B6E669
	STA.b $2A,x				;$B6E66A
	RTS					;$B6E66C

arich_back_hitbox_main:
	JMP.w (DATA_B6E670,x)			;$B6E66D

DATA_B6E670:
	dw CODE_B6E676
	dw CODE_B6E67C
	dw CODE_B6E683

CODE_B6E676:
	JSL.l CODE_B6840E			;$B6E676
	INC.b $38,x				;$B6E67A
CODE_B6E67C:
	LDA.w #CODE_B6E686			;$B6E67C
	JSL.l CODE_BB85D6			;$B6E67F
CODE_B6E683:
	JML [$04F5]				;$B6E683

CODE_B6E686:
	LDA.w #$001C				;$B6E686
	JSL.l CODE_BEC01B			;$B6E689
	RTL					;$B6E68D

arich_legs_main:
	JMP.w (DATA_B6E691,x)			;$B6E68E

DATA_B6E691:
	dw CODE_B6E695
	dw CODE_B6E70A

CODE_B6E695:
	LDA.w $005C,y				;$B6E695
	BEQ.b CODE_B6E69F			;$B6E698
	TYX					;$B6E69A
	DEC.b $5C,x				;$B6E69B
	BRA.b CODE_B6E6DD			;$B6E69D

CODE_B6E69F:
	JSL.l populate_sprite_clipping		;$B6E69F
	LDA.w #$0008				;$B6E6A3
	JSL.l CODE_BEC009			;$B6E6A6
	BCC.b CODE_B6E6BB			;$B6E6AA
	LDY.w #$000A				;$B6E6AC
	STY.b $5C,x				;$B6E6AF
	CMP.w #$0001				;$B6E6B1
	BNE.b CODE_B6E6DD			;$B6E6B4
	JSR.w CODE_B6E70F			;$B6E6B6
	BRA.b CODE_B6E6DD			;$B6E6B9

CODE_B6E6BB:
	LDY.w active_kong_sprite		;$B6E6BB
	LDA.w $002E,y				;$B6E6BE
	BMI.b CODE_B6E6DD			;$B6E6C1
	LDA.w #$001D				;$B6E6C3
	JSL.l CODE_BCE43C			;$B6E6C6
	LDA.w #$08AA				;$B6E6CA
	JSL.l CODE_BEC009			;$B6E6CD
	BCC.b CODE_B6E6DD			;$B6E6D1
	LDY.w #$000A				;$B6E6D3
	STY.b $5C,x				;$B6E6D6
	CMP.w #$0001				;$B6E6D8
	BNE.b CODE_B6E6DD			;$B6E6DB
CODE_B6E6DD:
	LDY.w #$0030				;$B6E6DD
	LDA.b $1E,x				;$B6E6E0
	BIT.w #$4000				;$B6E6E2
	BNE.b CODE_B6E6EA			;$B6E6E5
	LDY.w #$FFD0				;$B6E6E7
CODE_B6E6EA:
	TYA					;$B6E6EA
	LDY.w $1B6B				;$B6E6EB
	CLC					;$B6E6EE
	ADC.w $0012,y				;$B6E6EF
	STA.b $12,x				;$B6E6F2
	LDA.w $1B75				;$B6E6F4
	BEQ.b CODE_B6E6FE			;$B6E6F7
	LDA.w #$003C				;$B6E6F9
	BRA.b CODE_B6E701			;$B6E6FC

CODE_B6E6FE:
	LDA.w #$FFC8				;$B6E6FE
CODE_B6E701:
	CLC					;$B6E701
	ADC.w $0016,y				;$B6E702
	STA.b $16,x				;$B6E705
	JMP.w CODE_B685E6			;$B6E707

CODE_B6E70A:
	TYX					;$B6E70A
	STA.b $3A,x				;$B6E70B
	BRA.b CODE_B6E6DD			;$B6E70D

CODE_B6E70F:
	LDA.w #$0013				;$B6E70F
	JSL.l CODE_B88069			;$B6E712
	BCS.b CODE_B6E724			;$B6E716
	LDA.w #$F900				;$B6E718
	STA.w $17CC				;$B6E71B
	STZ.w $17CA				;$B6E71E
	STZ.w $17CE				;$B6E721
CODE_B6E724:
	RTS					;$B6E724

unknown_sprite_020C_main:
electric_node_main:
	JMP.w (DATA_B6E728,x)			;$B6E725

DATA_B6E728:
	dw CODE_B6E72E
	dw CODE_B6E735
	dw CODE_B6E7C0

CODE_B6E72E:
	JSL.l CODE_B6F0C6			;$B6E72E
	TYX					;$B6E732
	INC.b $38,x				;$B6E733
CODE_B6E735:
	TYX					;$B6E735
	JSR.w CODE_B6E7DB			;$B6E736
	LDA.b $1E,x				;$B6E739
	AND.w #$BFFF				;$B6E73B
	STA.b $1A				;$B6E73E
	LDA.w #$0150				;$B6E740
	SEC					;$B6E743
	SBC.b $12,x				;$B6E744
	AND.w #$4000				;$B6E746
	EOR.b $1A				;$B6E749
	STA.b $1E,x				;$B6E74B
	LDY.w #$0000				;$B6E74D
	LDA.w $1BD9				;$B6E750
	BNE.b CODE_B6E758			;$B6E753
	LDY.w #$C000				;$B6E755
CODE_B6E758:
	STY.b $26,x				;$B6E758
	STA.w CPU.multiply_A			;$B6E75A
	LDA.w #$0010				;$B6E75D
	STA.b $3A				;$B6E760
	LDA.w #(electric_node_sprite_palette&$FF0000)>>8		;$B6E762
	STA.b $47				;$B6E765
	LDA.b $66,x				;$B6E767
	STA.b $46				;$B6E769
	LDX.w #$057B				;$B6E76B
	LDY.w #$0000				;$B6E76E
CODE_B6E771:
	LDA.b [$46],y				;$B6E771
	PHA					;$B6E773
	JSR.w CODE_B6F0E3			;$B6E774
	STA.b $3C				;$B6E777
	LDA.b $01,S				;$B6E779
	LSR					;$B6E77B
	LSR					;$B6E77C
	LSR					;$B6E77D
	LSR					;$B6E77E
	LSR					;$B6E77F
	JSR.w CODE_B6F0E3			;$B6E780
	ASL					;$B6E783
	ASL					;$B6E784
	ASL					;$B6E785
	ASL					;$B6E786
	ASL					;$B6E787
	ORA.b $3C				;$B6E788
	STA.b $3C				;$B6E78A
	PLA					;$B6E78C
	LSR					;$B6E78D
	LSR					;$B6E78E
	XBA					;$B6E78F
	JSR.w CODE_B6F0E3			;$B6E790
	XBA					;$B6E793
	ASL					;$B6E794
	ASL					;$B6E795
	ORA.b $3C				;$B6E796
	STA.b $00,x				;$B6E798
	INY					;$B6E79A
	INY					;$B6E79B
	INX					;$B6E79C
	INX					;$B6E79D
	DEC.b $3A				;$B6E79E
	BNE.b CODE_B6E771			;$B6E7A0
	LDY.b current_sprite			;$B6E7A2
	LDA.b $E8				;$B6E7A4
	ASL					;$B6E7A6
	ASL					;$B6E7A7
	TAX					;$B6E7A8
	LDA.w #$057B				;$B6E7A9
	STA.w $06FC,x				;$B6E7AC
	LDA.w $0068,y				;$B6E7AF
	STA.w $06FE,x				;$B6E7B2
	LDA.b $E8				;$B6E7B5
	INC					;$B6E7B7
	AND.w #$000F				;$B6E7B8
	STA.b $E8				;$B6E7BB
	JMP.w CODE_B685E6			;$B6E7BD

CODE_B6E7C0:
	TYX					;$B6E7C0
	LDY.w $1BDB				;$B6E7C1
	LDA.w $0024,y				;$B6E7C4
	JSR.w CODE_B6ECF1			;$B6E7C7
	JSR.w CODE_B6E7DB			;$B6E7CA
	LDY.w $1BDB				;$B6E7CD
	LDA.w $001E,y				;$B6E7D0
	ORA.w #$8000				;$B6E7D3
	STA.b $1E,x				;$B6E7D6
	JML [$04F5]				;$B6E7D8

CODE_B6E7DB:
	LDA.b $5C,x				;$B6E7DB
	LDY.w $196D				;$B6E7DD
	CPY.w #$0150				;$B6E7E0
	BCC.b CODE_B6E7E7			;$B6E7E3
	LDA.b $5E,x				;$B6E7E5
CODE_B6E7E7:
	STA.b $12,x				;$B6E7E7
	RTS					;$B6E7E9

unknown_sprite_04C0_main:
	PHX					;$B6E7EA
	TYX					;$B6E7EB
	DEC.b $5C,x				;$B6E7EC
	BPL.b CODE_B6E7F2			;$B6E7EE
	STZ.b $26,x				;$B6E7F0
CODE_B6E7F2:
	PLX					;$B6E7F2
	JMP.w (DATA_B6E7F6,x)			;$B6E7F3

DATA_B6E7F6:
	dw CODE_B6E7FA
	dw CODE_B6E800

CODE_B6E7FA:
	JSR.w CODE_B6E806			;$B6E7FA
	JMP.w CODE_B685E6			;$B6E7FD

CODE_B6E800:
	JSR.w CODE_B6E81E			;$B6E800
	JMP.w CODE_B685E6			;$B6E803

CODE_B6E806:
	LDA.w #$0004				;$B6E806
	BIT.w $15E6				;$B6E809
	BNE.b CODE_B6E816			;$B6E80C
CODE_B6E80E:
	LDA.l $7EA21E				;$B6E80E
	STA.w $0012,y				;$B6E812
	RTS					;$B6E815

CODE_B6E816:
	LDA.l $7EA21C				;$B6E816
	STA.w $0012,y				;$B6E81A
	RTS					;$B6E81D

CODE_B6E81E:
	LDA.w #$0004				;$B6E81E
	BIT.w $15E6				;$B6E821
	BNE.b CODE_B6E80E			;$B6E824
	BRA.b CODE_B6E816			;$B6E826

kaos_laser_head_flame_jet_main:
	LDX.w $1B6D				;$B6E828
	LDA.b $12,x				;$B6E82B
	STA.w $0012,y				;$B6E82D
	LDA.b $16,x				;$B6E830
	STA.w $0016,y				;$B6E832
	JMP.w CODE_B685E6			;$B6E835

kaos_flame_main:
	JMP.w (DATA_B6E83B,x)			;$B6E838

DATA_B6E83B:
	dw CODE_B6E843
	dw CODE_B6E8E2
	dw CODE_B6E8F9
	dw CODE_B6E90D

CODE_B6E843:
	LDX.w $1B6B				;$B6E843
	LDA.b $12,x				;$B6E846
	STA.w $0012,y				;$B6E848
	LDA.w $1B8B				;$B6E84B
	SEC					;$B6E84E
	SBC.w $1B89				;$B6E84F
	STA.b $1A				;$B6E852
	LDA.b $16,x				;$B6E854
	SEC					;$B6E856
	SBC.w $1B89				;$B6E857
	BPL.b CODE_B6E861			;$B6E85A
	LDA.w #$0000				;$B6E85C
	BRA.b CODE_B6E88C			;$B6E85F

CODE_B6E861:
	XBA					;$B6E861
	STA.w CPU.dividen_low			;$B6E862
	SEP.b #$20				;$B6E865
	LDA.b $1A				;$B6E867
	STA.w CPU.divisor			;$B6E869
	REP.b #$20				;$B6E86C
	JSL.l stall_cpu_time			;$B6E86E
	LDA.w CPU.divide_result			;$B6E872
	CMP.w #$00FF				;$B6E875
	BCC.b CODE_B6E87F			;$B6E878
	LDA.w #$001E				;$B6E87A
	BRA.b CODE_B6E88C			;$B6E87D

CODE_B6E87F:
	ORA.w #$1E00				;$B6E87F
	STA.w CPU.multiply_A			;$B6E882
	LDA.w CPU.multiply_result		;$B6E885
	LDA.w CPU.multiply_result		;$B6E888
	XBA					;$B6E88B
CODE_B6E88C:
	AND.w #$00FF				;$B6E88C
	PHA					;$B6E88F
	STA.w $1C05				;$B6E890
	CLC					;$B6E893
	ADC.b $16,x				;$B6E894
	CLC					;$B6E896
	ADC.w #$003A				;$B6E897
	STA.w $0016,y				;$B6E89A
	LDA.b $01,S				;$B6E89D
	CMP.w #$000A				;$B6E89F
	BCC.b CODE_B6E8A7			;$B6E8A2
	JSR.w CODE_B6E9A7			;$B6E8A4
CODE_B6E8A7:
	PLA					;$B6E8A7
	CMP.w #$0011				;$B6E8A8
	BCC.b CODE_B6E8DF			;$B6E8AB
	LDY.w $1B6B				;$B6E8AD
	LDA.w #$0205				;$B6E8B0
	LDX.b level_number			;$B6E8B3
	CPX.w #!level_kaos_karnage		;$B6E8B5
	BEQ.b CODE_B6E8BD			;$B6E8B8
	LDA.w #$017E				;$B6E8BA
CODE_B6E8BD:
	CMP.w $0016,y				;$B6E8BD
	BCS.b CODE_B6E8DF			;$B6E8C0
	LDX.w $1BAB				;$B6E8C2
	BNE.b CODE_B6E8DF			;$B6E8C5
	LDY.w #$0188				;$B6E8C7
	JSL.l CODE_BB8585			;$B6E8CA
	LDX.b alternate_sprite			;$B6E8CE
	STX.w $1BAB				;$B6E8D0
	LDY.w #$018A				;$B6E8D3
	JSL.l CODE_BB8585			;$B6E8D6
	LDX.b alternate_sprite			;$B6E8DA
	STX.w $1BAD				;$B6E8DC
CODE_B6E8DF:
	JMP.w CODE_B685E6			;$B6E8DF

CODE_B6E8E2:
	LDX.w $1B6B				;$B6E8E2
	LDA.b $12,x				;$B6E8E5
	STA.w $0012,y				;$B6E8E7
	LDA.b $16,x				;$B6E8EA
	CLC					;$B6E8EC
	ADC.w #$003A				;$B6E8ED
	ADC.w #$001E				;$B6E8F0
	STA.w $0016,y				;$B6E8F3
	JMP.w CODE_B685E6			;$B6E8F6

CODE_B6E8F9:
	LDX.w $1B6F				;$B6E8F9
	LDA.b $12,x				;$B6E8FC
	STA.w $0012,y				;$B6E8FE
	LDA.b $16,x				;$B6E901
	CLC					;$B6E903
	ADC.w #$0024				;$B6E904
	STA.w $0016,y				;$B6E907
	JMP.w CODE_B685E6			;$B6E90A

CODE_B6E90D:
	JSL.l CODE_B58045			;$B6E90D
	LDA.w $002E,y				;$B6E911
	SEC					;$B6E914
	SBC.w #$002D				;$B6E915
	STA.w $002E,y				;$B6E918
	JSL.l process_current_movement		;$B6E91B
	LDY.w $1B6B				;$B6E91F
	LDA.b $16,x				;$B6E922
	CMP.w $0016,y				;$B6E924
	BCS.b CODE_B6E92F			;$B6E927
	STZ.w $1B7B				;$B6E929
	JMP.w CODE_B6F27D			;$B6E92C

CODE_B6E92F:
	JMP.w CODE_B685E6			;$B6E92F

kaos_flame_spread_main:
	JMP.w (DATA_B6E935,x)			;$B6E932

DATA_B6E935:
	dw CODE_B6E939
	dw CODE_B6E993

CODE_B6E939:
	LDA.w #$0259				;$B6E939
	LDX.b level_number			;$B6E93C
	CPX.w #!level_kaos_karnage		;$B6E93E
	PHP					;$B6E941
	BEQ.b CODE_B6E947			;$B6E942
	LDA.w #$01D2				;$B6E944
CODE_B6E947:
	STA.w $0016,y				;$B6E947
	LDX.w $1B6B				;$B6E94A
	LDA.b $12,x				;$B6E94D
	STA.w $0012,y				;$B6E94F
	JSR.w CODE_B6E9A7			;$B6E952
	STZ.b $26,x				;$B6E955
	LDY.w $1B7B				;$B6E957
	LDA.w $0038,y				;$B6E95A
	CMP.w #$0003				;$B6E95D
	BEQ.b CODE_B6E97E			;$B6E960
	LDY.w $1B6B				;$B6E962
	LDA.w #$0205				;$B6E965
	PLP					;$B6E968
	BEQ.b CODE_B6E96E			;$B6E969
	LDA.w #$017E				;$B6E96B
CODE_B6E96E:
	CMP.w $0016,y				;$B6E96E
	BCS.b CODE_B6E97F			;$B6E971
	LDA.w $1C05				;$B6E973
	CMP.w #$0011				;$B6E976
	BCC.b CODE_B6E97F			;$B6E979
	JMP.w CODE_B685E6			;$B6E97B

CODE_B6E97E:
	PLP					;$B6E97E
CODE_B6E97F:
	LDY.w $1B6B				;$B6E97F
	LDA.w $002A,y				;$B6E982
	STA.b $2A,x				;$B6E985
	INC.b $38,x				;$B6E987
	LDA.w #$0298				;$B6E989
	JSL.l set_sprite_animation		;$B6E98C
	JML [$04F5]				;$B6E990

CODE_B6E993:
	JSR.w CODE_B6E9A7			;$B6E993
	LDA.w #$0004				;$B6E996
	JSL.l interpolate_x_speed		;$B6E999
	LDA.w #$0002				;$B6E99D
	JSL.l process_alternate_movement	;$B6E9A0
	JMP.w CODE_B685E6			;$B6E9A4

CODE_B6E9A7:
	JSL.l populate_sprite_clipping		;$B6E9A7
	LDA.w #$0000				;$B6E9AB
	JSL.l CODE_BEC009			;$B6E9AE
	RTS					;$B6E9B2

krool_feet_main:
	JMP.w (DATA_B6E9B6,x)			;$B6E9B3

DATA_B6E9B6:
	dw CODE_B6E9C2
	dw CODE_B6E9DD
	dw CODE_B6E9F1
	dw CODE_B6EA00
	dw CODE_B6EA2C
	dw CODE_B6EA29

CODE_B6E9C2:
	JSR.w CODE_B6EA5B			;$B6E9C2
	BMI.b CODE_B6E9DA			;$B6E9C5
	INC.b $38,x				;$B6E9C7
	LDA.w #$016A				;$B6E9C9
	STA.b $5C,x				;$B6E9CC
	LDA.w #$FE80				;$B6E9CE
	STA.b $2E,x				;$B6E9D1
	LDA.w #$003D				;$B6E9D3
	JSL.l CODE_BFF006			;$B6E9D6
CODE_B6E9DA:
	JML [$04F5]				;$B6E9DA

CODE_B6E9DD:
	JSR.w CODE_B6EA5B			;$B6E9DD
	BMI.b CODE_B6E9EE			;$B6E9E0
	INC.b $38,x				;$B6E9E2
	LDA.w #$0170				;$B6E9E4
	STA.b $5C,x				;$B6E9E7
	LDA.w #$0180				;$B6E9E9
	STA.b $2E,x				;$B6E9EC
CODE_B6E9EE:
	JML [$04F5]				;$B6E9EE

CODE_B6E9F1:
	JSR.w CODE_B6EA5B			;$B6E9F1
	BMI.b CODE_B6E9FD			;$B6E9F4
	LDA.w #$0032				;$B6E9F6
	STA.b $5E,x				;$B6E9F9
	INC.b $38,x				;$B6E9FB
CODE_B6E9FD:
	JML [$04F5]				;$B6E9FD

CODE_B6EA00:
	TYX					;$B6EA00
	DEC.b $5E,x				;$B6EA01
	BNE.b CODE_B6EA29			;$B6EA03
	INC.b $38,x				;$B6EA05
	LDA.w #$FF00				;$B6EA07
	STA.b $2E,x				;$B6EA0A
	LDY.w $1B6B				;$B6EA0C
	STA.w $002E,y				;$B6EA0F
	LDA.w #$0003				;$B6EA12
	STA.w $005A,y				;$B6EA15
	LDA.w #$0090				;$B6EA18
	STA.b $5C,x				;$B6EA1B
	LDA.w #$0078				;$B6EA1D
	STA.b $5E,x				;$B6EA20
	LDA.w #$066E				;$B6EA22
	JSL.l queue_sound_effect		;$B6EA25
CODE_B6EA29:
	JML [$04F5]				;$B6EA29

CODE_B6EA2C:
	JSR.w CODE_B6EA5B			;$B6EA2C
	BMI.b CODE_B6EA29			;$B6EA2F
	DEC.b $5E,x				;$B6EA31
	BPL.b CODE_B6EA41			;$B6EA33
	LDY.w $1B6B				;$B6EA35
	LDA.w #$001E				;$B6EA38
	STA.w $0038,y				;$B6EA3B
	JMP.w CODE_B6F27D			;$B6EA3E

CODE_B6EA41:
	JML [$04F5]				;$B6EA41

krool_curtain_main:
	JMP.w (DATA_B6EA47,x)			;$B6EA44

DATA_B6EA47:
	dw CODE_B6EA4B
	dw CODE_B6EA58

CODE_B6EA4B:
	TYX					;$B6EA4B
	DEC.b $5E,x				;$B6EA4C
	BPL.b CODE_B6EA29			;$B6EA4E
	JSR.w CODE_B6EA5B			;$B6EA50
	BMI.b CODE_B6EA29			;$B6EA53
	JMP.w CODE_B6F27D			;$B6EA55

CODE_B6EA58:
	JML [$04F5]				;$B6EA58

CODE_B6EA5B:
	JSL.l process_current_movement		;$B6EA5B
	LDA.b $16,x				;$B6EA5F
	SEC					;$B6EA61
	SBC.b $5C,x				;$B6EA62
	EOR.b $2E,x				;$B6EA64
	RTS					;$B6EA66

krool_propeller_main:
	JMP.w (DATA_B6EA6A,x)			;$B6EA67

DATA_B6EA6A:
	dw CODE_B6EA89
	dw CODE_B6EA74
	dw CODE_B6EA8C
	dw CODE_B6EACE
	dw CODE_B6EAE8

CODE_B6EA74:
	JSR.w CODE_B6EAF1			;$B6EA74
	JSR.w CODE_B6EB16			;$B6EA77
	TYX					;$B6EA7A
	DEC.b $5C,x				;$B6EA7B
	BNE.b CODE_B6EA81			;$B6EA7D
	INC.b $38,x				;$B6EA7F
CODE_B6EA81:
	LDA.b $5C,x				;$B6EA81
	LSR					;$B6EA83
	CLC					;$B6EA84
	ADC.b $16,x				;$B6EA85
	STA.b $16,x				;$B6EA87
CODE_B6EA89:
	JML [$04F5]				;$B6EA89

CODE_B6EA8C:
	JSR.w CODE_B6EAF1			;$B6EA8C
	LDA.w $1B75				;$B6EA8F
	BEQ.b CODE_B6EAC8			;$B6EA92
	JSL.l populate_sprite_clipping		;$B6EA94
	LDA.w #$0000				;$B6EA98
	JSL.l CODE_BEC009			;$B6EA9B
	LDY.w $1BB1				;$B6EA9F
	BEQ.b CODE_B6EAC8			;$B6EAA2
	LDA.w $003A,y				;$B6EAA4
	BEQ.b CODE_B6EAC8			;$B6EAA7
	JSL.l CODE_BEC003			;$B6EAA9
	BCC.b CODE_B6EAC8			;$B6EAAD
	LDA.w #$0800				;$B6EAAF
	STA.w $003C,y				;$B6EAB2
	TYX					;$B6EAB5
	STZ.b $3A,x				;$B6EAB6
	LDA level_number			;$B6EAB8
	CMP.w #!level_knautilus			;$B6EABA
	BNE.b CODE_B6EAC8			;$B6EABD
	LDY.w $1BBD				;$B6EABF
	LDA.w #$0010				;$B6EAC2
	STA.w $003C,y				;$B6EAC5
CODE_B6EAC8:
	JSR.w CODE_B6EB16			;$B6EAC8
	JMP.w CODE_B685E6			;$B6EACB

CODE_B6EACE:
	JSR.w CODE_B6EAF1			;$B6EACE
	LDA.w $0044,y				;$B6EAD1
	CMP.w #$00D0				;$B6EAD4
	BCC.b CODE_B6EAE5			;$B6EAD7
	TYX					;$B6EAD9
	DEC.b $38,x				;$B6EADA
	LDY.w $1BBD				;$B6EADC
	LDA.w #$0006				;$B6EADF
	STA.w $0038,y				;$B6EAE2
CODE_B6EAE5:
	JMP.w CODE_B685E6			;$B6EAE5

CODE_B6EAE8:
	JSR.w CODE_B6EAF1			;$B6EAE8
	JSR.w CODE_B6EB08			;$B6EAEB
	JMP.w CODE_B685E6			;$B6EAEE

CODE_B6EAF1:
	TYX					;$B6EAF1
	LDY.w $1BBD				;$B6EAF2
	LDA.b $1E,x				;$B6EAF5
	AND.w #$001F				;$B6EAF7
	STA.b $1A				;$B6EAFA
	LDA.w $001E,y				;$B6EAFC
	AND.w #$FE00				;$B6EAFF
	ORA.b $1A				;$B6EB02
	STA.b $1E,x				;$B6EB04
	TXY					;$B6EB06
	RTS					;$B6EB07

CODE_B6EB08:
	LDX.w $1BBD				;$B6EB08
	LDA.b $24,x				;$B6EB0B
	SEC					;$B6EB0D
	SBC.w #$38C7				;$B6EB0E
	LDY.w #DATA_B6EB87			;$B6EB11
	BRA.b CODE_B6EB22			;$B6EB14

CODE_B6EB16:
	LDX.w $1BBD				;$B6EB16
	LDA.b $24,x				;$B6EB19
	SEC					;$B6EB1B
	SBC.w #$8005				;$B6EB1C
	LDY.w #DATA_B6EB6F			;$B6EB1F
CODE_B6EB22:
	STY.b $1A				;$B6EB22
	STA.w CPU.dividen_low			;$B6EB24
	SEP.b #$20				;$B6EB27
	LDA.b #$05				;$B6EB29
	STA.w CPU.divisor			;$B6EB2B
	REP.b #$20				;$B6EB2E
	JSL.l stall_cpu_time			;$B6EB30
	LDA.w CPU.divide_result			;$B6EB34
	CMP.w #$000C				;$B6EB37
	BCC.b CODE_B6EB3F			;$B6EB3A
	LDA.w #$000B				;$B6EB3C
CODE_B6EB3F:
	ASL					;$B6EB3F
	ADC.b $1A				;$B6EB40
	TAY					;$B6EB42
	LDA.w $0000,y				;$B6EB43
	JSL.l CODE_B58021			;$B6EB46
	BIT.b $1E,x				;$B6EB4A
	BVC.b CODE_B6EB52			;$B6EB4C
	EOR.w #$FFFF				;$B6EB4E
	INC					;$B6EB51
CODE_B6EB52:
	CLC					;$B6EB52
	ADC.b $12,x				;$B6EB53
	PHA					;$B6EB55
	LDA.w $0001,y				;$B6EB56
	JSL.l CODE_B58021			;$B6EB59
	CLC					;$B6EB5D
	ADC.b $16,x				;$B6EB5E
	LDY.b current_sprite			;$B6EB60
	STA.w $0016,y				;$B6EB62
	PLA					;$B6EB65
	STA.w $0012,y				;$B6EB66
	LDA.b $58,x				;$B6EB69
	STA.w $0058,y				;$B6EB6B
	RTS					;$B6EB6E

DATA_B6EB6F:
	dw $C6ED,$C3EF,$BFF0,$BBF1,$BAF1,$B8F2,$B7F3,$B7F3
	dw $B7F3,$BCF6,$BCFD,$BBF1

DATA_B6EB87:
	dw $D5F8,$D3F8,$D3F9,$D2F9,$D2F9,$D2F9,$D4FA,$D4FE
	dw $D4F8,$D4F8,$D4F8,$D4F8

knautilus_fireball_main:
	TYX					;$B6EB9F
	LDA.b $60,x				;$B6EBA0
	BEQ.b CODE_B6EBAF			;$B6EBA2
	JSL.l populate_sprite_clipping		;$B6EBA4
	LDA.w #$0000				;$B6EBA8
	JSL.l CODE_BEC009			;$B6EBAB
CODE_B6EBAF:
	LDA.b $16,x				;$B6EBAF
	CMP.w #$0210				;$B6EBB1
	BCS.b CODE_B6EBDB			;$B6EBB4
	JSL.l process_current_movement		;$B6EBB6
	BCC.b CODE_B6EBD8			;$B6EBBA
	LDA.w #$00F8				;$B6EBBC
	STA.b $0E,x				;$B6EBBF
	LDA.b $2E,x				;$B6EBC1
	LSR					;$B6EBC3
	EOR.w #$FFFF				;$B6EBC4
	INC					;$B6EBC7
	STA.b $2E,x				;$B6EBC8
	LDY.w #$01C4				;$B6EBCA
	JSL.l CODE_BB8585			;$B6EBCD
	LDA.w #$0667				;$B6EBD1
	JSL.l queue_sound_effect		;$B6EBD4
CODE_B6EBD8:
	JMP.w CODE_B685E6			;$B6EBD8

CODE_B6EBDB:
	JMP.w CODE_B6F27D			;$B6EBDB

unknown_sprite_0208_main:
kastle_kaos_lever_main:
	JMP.w (DATA_B6EBE1,x)			;$B6EBDE

DATA_B6EBE1:
	dw CODE_B6EC00
	dw CODE_B6EC42
	dw CODE_B6EC5F
	dw CODE_B6EBEF
	dw CODE_B6EC73
	dw CODE_B6EC89
	dw CODE_B6ECCB

CODE_B6EBEF:
	TYX					;$B6EBEF
	LDA.b $12,x				;$B6EBF0
	STA.b $2C,x				;$B6EBF2
	LDA.b $16,x				;$B6EBF4
	STA.b $64,x				;$B6EBF6
	STZ.b $6C,x				;$B6EBF8
	STZ.b $62,x				;$B6EBFA
	STA.b $32,x				;$B6EBFC
	STZ.b $38,x				;$B6EBFE
CODE_B6EC00:
	TYX					;$B6EC00
	LDA.b $32,x				;$B6EC01
	STA.b $16,x				;$B6EC03
	JSR.w CODE_B6ECF8			;$B6EC05
	JSR.w CODE_B6ED04			;$B6EC08
	JSR.w CODE_B69301			;$B6EC0B
	BEQ.b CODE_B6EC38			;$B6EC0E
	INC.b $38,x				;$B6EC10
	LDA.b $5E,x				;$B6EC12
	BEQ.b CODE_B6EC35			;$B6EC14
	LDY.w #$018C				;$B6EC16
	JSL.l CODE_BB8585			;$B6EC19
	LDY.b alternate_sprite			;$B6EC1D
	STY.w $1BB1				;$B6EC1F
	LDX.b current_sprite			;$B6EC22
	STZ.b $5E,x				;$B6EC24
	LDA.w #$FFFF				;$B6EC26
	STA.w $000C,y				;$B6EC29
	LDA.b $18,x				;$B6EC2C
	CLC					;$B6EC2E
	ADC.w $0012,y				;$B6EC2F
	STA.w $0012,y				;$B6EC32
CODE_B6EC35:
	JML [$04F5]				;$B6EC35

CODE_B6EC38:
	LDA.w #$0002				;$B6EC38
	JSL.l CODE_BEC00F			;$B6EC3B
	JML [$04F5]				;$B6EC3F

CODE_B6EC42:
	TYX					;$B6EC42
	LDA.b $32,x				;$B6EC43
	STA.b $16,x				;$B6EC45
	JSR.w CODE_B69301			;$B6EC47
	BEQ.b CODE_B6EC55			;$B6EC4A
	JSR.w CODE_B6ECF8			;$B6EC4C
	JSR.w CODE_B6ED04			;$B6EC4F
	JML [$04F5]				;$B6EC52

CODE_B6EC55:
	LDA.w #$001E				;$B6EC55
	STA.b $5C,x				;$B6EC58
	INC.b $38,x				;$B6EC5A
	JML [$04F5]				;$B6EC5C

CODE_B6EC5F:
	TYX					;$B6EC5F
	LDA.b $32,x				;$B6EC60
	STA.b $16,x				;$B6EC62
	DEC.b $5C,x				;$B6EC64
	BNE.b CODE_B6EC6A			;$B6EC66
	STZ.b $38,x				;$B6EC68
CODE_B6EC6A:
	JSR.w CODE_B6ECF8			;$B6EC6A
	JSR.w CODE_B6ED04			;$B6EC6D
	JML [$04F5]				;$B6EC70

CODE_B6EC73:
	TYX					;$B6EC73
	LDA.b $16,x				;$B6EC74
	CMP.b $1A,x				;$B6EC76
	BCS.b CODE_B6EC81			;$B6EC78
	INC.b $16,x				;$B6EC7A
	INC.b $16,x				;$B6EC7C
	JML [$04F5]				;$B6EC7E

CODE_B6EC81:
	LDA.w #$0003				;$B6EC81
	STA.b $38,x				;$B6EC84
	JML [$04F5]				;$B6EC86

CODE_B6EC89:
	JSR.w CODE_B69301			;$B6EC89
	BEQ.b CODE_B6EC95			;$B6EC8C
	LDA.w #$000D				;$B6EC8E
	JSL.l CODE_B88069			;$B6EC91
CODE_B6EC95:
	LDA.b $68,x				;$B6EC95
	BEQ.b CODE_B6ECC8			;$B6EC97
	LDA.w #$02A8				;$B6EC99
	CMP.b $40,x				;$B6EC9C
	BEQ.b CODE_B6ECA4			;$B6EC9E
	JSL.l set_sprite_animation		;$B6ECA0
CODE_B6ECA4:
	JSL.l process_sprite_animation		;$B6ECA4
	LDX.b current_sprite			;$B6ECA8
	LDA.b $24,x				;$B6ECAA
	LDX.w $1BC3				;$B6ECAC
	BEQ.b CODE_B6ECB3			;$B6ECAF
	STA.b $24,x				;$B6ECB1
CODE_B6ECB3:
	LDX.w $1BC5				;$B6ECB3
	BEQ.b CODE_B6ECBA			;$B6ECB6
	STA.b $24,x				;$B6ECB8
CODE_B6ECBA:
	LDX.w $1BD1				;$B6ECBA
	BEQ.b CODE_B6ECC1			;$B6ECBD
	STA.b $24,x				;$B6ECBF
CODE_B6ECC1:
	LDX.w $1BD3				;$B6ECC1
	BEQ.b CODE_B6ECC8			;$B6ECC4
	STA.b $24,x				;$B6ECC6
CODE_B6ECC8:
	JML [$04F5]				;$B6ECC8

CODE_B6ECCB:
	TYX					;$B6ECCB
	LDA.b $16,x				;$B6ECCC
	CMP.w #$0100				;$B6ECCE
	BCC.b CODE_B6ECDA			;$B6ECD1
	DEC.b $16,x				;$B6ECD3
	DEC.b $16,x				;$B6ECD5
	JML [$04F5]				;$B6ECD7

CODE_B6ECDA:
	TYA					;$B6ECDA
	CMP.w $1BC3				;$B6ECDB
	BNE.b CODE_B6ECE6			;$B6ECDE
	STZ.w $1BC3				;$B6ECE0
	JMP.w CODE_B6F27D			;$B6ECE3

CODE_B6ECE6:
	CMP.w $1BC5				;$B6ECE6
	BNE.b CODE_B6ECEE			;$B6ECE9
	STZ.w $1BC5				;$B6ECEB
CODE_B6ECEE:
	JMP.w CODE_B6F27D			;$B6ECEE

CODE_B6ECF1:
	STA.b $24,x				;$B6ECF1
	STA.b $20,x				;$B6ECF3
	STA.b $22,x				;$B6ECF5
	RTS					;$B6ECF7

CODE_B6ECF8:
	LDA.b $5E,x				;$B6ECF8
	BEQ.b CODE_B6ED00			;$B6ECFA
	JSR.w CODE_B6ED32			;$B6ECFC
	RTS					;$B6ECFF

CODE_B6ED00:
	JSR.w CODE_B6ED1F			;$B6ED00
	RTS					;$B6ED03

CODE_B6ED04:
	SEP.b #$20				;$B6ED04
	LDA.b $66,x				;$B6ED06
	STA.w CPU.multiply_A			;$B6ED08
	LDA.b $62,x				;$B6ED0B
	STA.w CPU.multiply_B			;$B6ED0D
	REP.b #$20				;$B6ED10
	NOP					;$B6ED12
	LDA.w CPU.multiply_result_high		;$B6ED13
	AND.w #$00FF				;$B6ED16
	CLC					;$B6ED19
	ADC.b $64,x				;$B6ED1A
	STA.b $32,x				;$B6ED1C
	RTS					;$B6ED1E

CODE_B6ED1F:
	LDA.b $60,x				;$B6ED1F
	CLC					;$B6ED21
	ADC.b $62,x				;$B6ED22
	CMP.w #$00FF				;$B6ED24
	BCC.b CODE_B6ED2F			;$B6ED27
	LDA.w #$00FF				;$B6ED29
	STA.b $62,x				;$B6ED2C
	RTS					;$B6ED2E

CODE_B6ED2F:
	STA.b $62,x				;$B6ED2F
	RTS					;$B6ED31

CODE_B6ED32:
	LDA.b $6C,x				;$B6ED32
	AND.w #$00FF				;$B6ED34
	CLC					;$B6ED37
	ADC.b $6A,x				;$B6ED38
	STA.b $6C,x				;$B6ED3A
	CMP.w #$0100				;$B6ED3C
	BCC.b CODE_B6ED4D			;$B6ED3F
	LDA.b $62,x				;$B6ED41
	SEC					;$B6ED43
	SBC.b $2E,x				;$B6ED44
	BPL.b CODE_B6ED4B			;$B6ED46
	LDA.w #$0000				;$B6ED48
CODE_B6ED4B:
	STA.b $62,x				;$B6ED4B
CODE_B6ED4D:
	RTS					;$B6ED4D

krool_fight_platform_main:
	JMP.w (DATA_B6ED51,x)			;$B6ED4E

DATA_B6ED51:
	dw CODE_B6ED61
	dw CODE_B6ED71
	dw CODE_B6ED7F
	dw CODE_B6EDB0
	dw CODE_B6EDC1
	dw CODE_B6EDC5
	dw CODE_B6EDDF
	dw CODE_B6EDF6

CODE_B6ED61:
	JSR.w CODE_B6EDFE			;$B6ED61
	LDA.w #$02D3				;$B6ED64
	STA.b $5C,x				;$B6ED67
	LDA.w #$FE80				;$B6ED69
	STA.b $2A,x				;$B6ED6C
	STA.b $30,x				;$B6ED6E
	TXY					;$B6ED70
CODE_B6ED71:
	TYX					;$B6ED71
	LDA.b $12,x				;$B6ED72
	SEC					;$B6ED74
	SBC.b $5C,x				;$B6ED75
	EOR.b $30,x				;$B6ED77
	BMI.b CODE_B6ED7F			;$B6ED79
	STZ.b $30,x				;$B6ED7B
	INC.b $38,x				;$B6ED7D
CODE_B6ED7F:
	JSL set_platform_hitbox_pos_keep_flags	;$B6ED7F
	JSR.w CODE_B683B3			;$B6ED83
	LDA.b $12,x				;$B6ED86
	CMP.w #$02D8				;$B6ED88
	BCS.b CODE_B6ED93			;$B6ED8B
	LDA.w #$3000				;$B6ED8D
	JSR.w CODE_B6F23E			;$B6ED90
CODE_B6ED93:
	LDA.b $30,x				;$B6ED93
	BNE.b CODE_B6EDA6			;$B6ED95
	LDA.b $2A,x				;$B6ED97
	BPL.b CODE_B6ED9F			;$B6ED99
	EOR.w #$FFFF				;$B6ED9B
	INC					;$B6ED9E
CODE_B6ED9F:
	CMP.w #$0060				;$B6ED9F
	BCS.b CODE_B6EDA6			;$B6EDA2
	STZ.b $2A,x				;$B6EDA4
CODE_B6EDA6:
	LDA.w #CODE_B6EE09			;$B6EDA6
	JSL.l CODE_BB85D6			;$B6EDA9
	JML [$04F5]				;$B6EDAD

CODE_B6EDB0:
	TYX					;$B6EDB0
	LDA.w #$FE00				;$B6EDB1
	STA.b $30,x				;$B6EDB4
	LDA.w #$0170				;$B6EDB6
	STA.b $5C,x				;$B6EDB9
	DEC.b $38,x				;$B6EDBB
	DEC.b $38,x				;$B6EDBD
	BRA.b CODE_B6ED7F			;$B6EDBF

CODE_B6EDC1:
	JSR.w CODE_B6EDFE			;$B6EDC1
	TXY					;$B6EDC4
CODE_B6EDC5:
	TYX					;$B6EDC5
	LDA.b $5E,x				;$B6EDC6
	BIT.b $30,x				;$B6EDC8
	BMI.b CODE_B6EDCE			;$B6EDCA
	LDA.b $60,x				;$B6EDCC
CODE_B6EDCE:
	SEC					;$B6EDCE
	SBC.b $12,x				;$B6EDCF
	EOR.b $30,x				;$B6EDD1
	BPL.b CODE_B6EDDD			;$B6EDD3
	LDA.b $30,x				;$B6EDD5
	EOR.w #$FFFF				;$B6EDD7
	INC					;$B6EDDA
	STA.b $30,x				;$B6EDDB
CODE_B6EDDD:
	BRA.b CODE_B6ED7F			;$B6EDDD

CODE_B6EDDF:
	LDA.w #$0148				;$B6EDDF
	LDX.w #$FE80				;$B6EDE2
CODE_B6EDE5:
	STA.w $005C,y				;$B6EDE5
	STX.b $30,y				;$B6EDE8
	JSR.w CODE_B6EDFE			;$B6EDEA
	LDA.w #$0001				;$B6EDED
	STA.b $38,x				;$B6EDF0
	TXY					;$B6EDF2
	JMP.w CODE_B6ED71			;$B6EDF3

CODE_B6EDF6:
	LDA.w #$02B7				;$B6EDF6
	LDX.w #$0180				;$B6EDF9
	BRA.b CODE_B6EDE5			;$B6EDFC

CODE_B6EDFE:
	JSL.l CODE_B6840E			;$B6EDFE
	STZ.b $6A,x				;$B6EE02
	STZ.b $6C,x				;$B6EE04
	INC.b $38,x				;$B6EE06
	RTS					;$B6EE08

CODE_B6EE09:
	JSL.l CODE_BEC018			;$B6EE09
	BCC.b CODE_B6EE41			;$B6EE0D
	BEQ.b CODE_B6EE40			;$B6EE0F
	LDX.b alternate_sprite			;$B6EE11
	LDA.b $2E,x				;$B6EE13
	BMI.b CODE_B6EE46			;$B6EE15
	LDY.b $00,x				;$B6EE17
	LDX.b current_sprite			;$B6EE19
	LDA.w #$0600				;$B6EE1B
	CPY.w #!sprite_dixie_kong		;$B6EE1E
	BEQ.b CODE_B6EE30			;$B6EE21
	LDA.w #$0A00				;$B6EE23
	CPY.w #!sprite_kiddy_kong		;$B6EE26
	BEQ.b CODE_B6EE30			;$B6EE29
	LDA.w #$0800				;$B6EE2B
	BRA.b CODE_B6EE3A			;$B6EE2E

CODE_B6EE30:
	PHA					;$B6EE30
	SEP.b #$20				;$B6EE31
	LDA.b #$01				;$B6EE33
	STA.b $68,x				;$B6EE35
	REP.b #$20				;$B6EE37
	PLA					;$B6EE39
CODE_B6EE3A:
	CMP.b $6A,x				;$B6EE3A
	BCC.b CODE_B6EE40			;$B6EE3C
	STA.b $6A,x				;$B6EE3E
CODE_B6EE40:
	RTL					;$B6EE40

CODE_B6EE41:
	LDX.b current_sprite			;$B6EE41
	STZ.b $68,x				;$B6EE43
	RTL					;$B6EE45

CODE_B6EE46:
	LDX.b current_sprite			;$B6EE46
	SEP.b #$20				;$B6EE48
	LDA.b #$01				;$B6EE4A
	STA.b $68,x				;$B6EE4C
	REP.b #$20				;$B6EE4E
	RTL					;$B6EE50

area_name_text_main:
save_cave_selection_text_main:
	JMP.w (DATA_B6EE54,x)			;$B6EE51

DATA_B6EE54:
	dw CODE_B6EE92
	dw CODE_B6EEB4
	dw CODE_B6EF56
	dw CODE_B6EE5C

CODE_B6EE5C:
	LDX.b current_sprite			;$B6EE5C
	LDA.w #$0100				;$B6EE5E
	STA.b $1C				;$B6EE61
	LDA.w #((DATA_FC0000+$06A0)&$FF0000)>>8	;$B6EE63
	STA.b $1B				;$B6EE66
	LDA.w #DATA_FC0000+$06A0		;$B6EE68
	STA.b $1A				;$B6EE6B
	LDA.b $5C,x				;$B6EE6D
	CLC					;$B6EE6F
	ADC.b $1E,x				;$B6EE70
	AND.w #$01FF				;$B6EE72
	STA.b $3E				;$B6EE75
	JSL.l CODE_B78009			;$B6EE77
	BCS.b CODE_B6EE8F			;$B6EE7B
	LDA.b $3E				;$B6EE7D
	CLC					;$B6EE7F
	ADC.w #$0010				;$B6EE80
	JSL.l CODE_B78009			;$B6EE83
	BCS.b CODE_B6EE8F			;$B6EE87
	JSR.w CODE_B6F0F6			;$B6EE89
	JMP.w CODE_B6EF41			;$B6EE8C

CODE_B6EE8F:
	JML [$04F5]				;$B6EE8F

CODE_B6EE92:
	TYX					;$B6EE92
	LDA.w #(($7EA9DE&$FF0000)>>16)|((CODE_B6EE92&$FF0000)>>8)	;$B6EE93
	STA.w $004C,y				;$B6EE96
	STZ.b $5C,x				;$B6EE99
	LDA.b $5E,x				;$B6EE9B
	BPL.b CODE_B6EEA4			;$B6EE9D
	LDA.w #$FFE0				;$B6EE9F
	BRA.b CODE_B6EEAF			;$B6EEA2

CODE_B6EEA4:
	ASL					;$B6EEA4
	TAX					;$B6EEA5
	LDA.l $7EA7BA,x				;$B6EEA6
	CLC					;$B6EEAA
	ADC.w #$7EA9DE				;$B6EEAB
	TYX					;$B6EEAE
CODE_B6EEAF:
	STA.b $5E,x				;$B6EEAF
	INC.b $38,x				;$B6EEB1
	TXY					;$B6EEB3
CODE_B6EEB4:
	TYX					;$B6EEB4
	LDA.w #$0100				;$B6EEB5
	STA.b $1C				;$B6EEB8
	LDA.w #((DATA_FC0000+$06A0)&$FF0000)>>8	;$B6EEBA
	STA.b $1B				;$B6EEBD
CODE_B6EEBF:
	LDA.b $4C,x				;$B6EEBF
	PHA					;$B6EEC1
	PLB					;$B6EEC2
	LDY.b $5E,x				;$B6EEC3
	LDA.w $0000,y				;$B6EEC5
	PLB					;$B6EEC8
	AND.w #$00FF				;$B6EEC9
	BEQ.b CODE_B6EF34			;$B6EECC
	SEC					;$B6EECE
	SBC.w #$0021				;$B6EECF
	BPL.b CODE_B6EEF7			;$B6EED2
	LDA.w #DATA_FC0000+$06A0		;$B6EED4
	STA.b $1A				;$B6EED7
	LDA.b $5C,x				;$B6EED9
	CLC					;$B6EEDB
	ADC.b $1E,x				;$B6EEDC
	AND.w #$01FF				;$B6EEDE
	STA.b $3E				;$B6EEE1
	JSL.l CODE_B78009			;$B6EEE3
	BCS.b CODE_B6EF31			;$B6EEE7
	LDA.b $3E				;$B6EEE9
	CLC					;$B6EEEB
	ADC.w #$0010				;$B6EEEC
	JSL.l CODE_B78009			;$B6EEEF
	BCS.b CODE_B6EF31			;$B6EEF3
	BRA.b CODE_B6EF2A			;$B6EEF5

CODE_B6EEF7:
	TAY					;$B6EEF7
	LDA.w DATA_B6F42C,y			;$B6EEF8
	AND.w #$00FF				;$B6EEFB
	XBA					;$B6EEFE
	LSR					;$B6EEFF
	LSR					;$B6EF00
	CLC					;$B6EF01
	ADC.w #DATA_FC0000			;$B6EF02
	STA.b $1A				;$B6EF05
	LDA.b $5C,x				;$B6EF07
	CLC					;$B6EF09
	ADC.b $1E,x				;$B6EF0A
	AND.w #$01FF				;$B6EF0C
	STA.b $3E				;$B6EF0F
	JSL.l CODE_B78009			;$B6EF11
	BCS.b CODE_B6EF31			;$B6EF15
	LDA.b $1A				;$B6EF17
	ADC.w #$0020				;$B6EF19
	STA.b $1A				;$B6EF1C
	LDA.b $3E				;$B6EF1E
	CLC					;$B6EF20
	ADC.w #$0010				;$B6EF21
	JSL.l CODE_B78009			;$B6EF24
	BCS.b CODE_B6EF31			;$B6EF28
CODE_B6EF2A:
	JSR.w CODE_B6F0F6			;$B6EF2A
	INC.b $5E,x				;$B6EF2D
	BRA.b CODE_B6EEBF			;$B6EF2F

CODE_B6EF31:
	JML [$04F5]				;$B6EF31

CODE_B6EF34:
	LDA.b $5C,x				;$B6EF34
	LSR					;$B6EF36
	BCC.b CODE_B6EF41			;$B6EF37
	LDA.w #$0003				;$B6EF39
	STA.b $38,x				;$B6EF3C
	JMP.w CODE_B6EE5C			;$B6EF3E

CODE_B6EF41:
	LDA.b $5C,x				;$B6EF41
	AND.w #$FFF0				;$B6EF43
	BEQ.b CODE_B6EF50			;$B6EF46
	LDA.b $5C,x				;$B6EF48
	SEC					;$B6EF4A
	SBC.w #$0010				;$B6EF4B
	STA.b $5C,x				;$B6EF4E
CODE_B6EF50:
	LDA.w #$0002				;$B6EF50
	STA.b $38,x				;$B6EF53
	TXY					;$B6EF55
CODE_B6EF56:
	TYX					;$B6EF56
	LDA.b $6C,x				;$B6EF57
	BEQ.b CODE_B6EF62			;$B6EF59
	DEC.b $6C,x				;$B6EF5B
	BNE.b CODE_B6EF62			;$B6EF5D
	JMP.w CODE_B6F27D			;$B6EF5F

CODE_B6EF62:
	LDY.w $0541				;$B6EF62
	STX.b $00,y				;$B6EF65
	INY					;$B6EF67
	INY					;$B6EF68
	STY.w $0541				;$B6EF69
	TXY					;$B6EF6C
	LDA.b $60,x				;$B6EF6D
	ASL					;$B6EF6F
	TAX					;$B6EF70
	JSR.w (DATA_B6EF7B,x)			;$B6EF71
	JSL.l process_current_movement		;$B6EF74
	JML [$04F5]				;$B6EF78

DATA_B6EF7B:
	dw CODE_B6EF8F
	dw CODE_B6EF90
	dw CODE_B6EFAD
	dw CODE_B6EFC3
	dw CODE_B6F05E
	dw CODE_B6F071
	dw CODE_B6F07A
	dw CODE_B6F087
	dw CODE_B6F09F
	dw CODE_B6F0AF

CODE_B6EF8F:
	RTS					;$B6EF8F

CODE_B6EF90:
	TYX					;$B6EF90
	DEC.b $68,x				;$B6EF91
	BNE.b CODE_B6EFAC			;$B6EF93
	LDA.b $66,x				;$B6EF95
	STA.b $68,x				;$B6EF97
	LDY.b $64,x				;$B6EF99
CODE_B6EF9B:
	LDA.w $0000,y				;$B6EF9B
	BPL.b CODE_B6EFA4			;$B6EF9E
	LDY.b $62,x				;$B6EFA0
	BRA.b CODE_B6EF9B			;$B6EFA2

CODE_B6EFA4:
	INY					;$B6EFA4
	INY					;$B6EFA5
	STY.b $64,x				;$B6EFA6
	JSL.l CODE_BB85A0			;$B6EFA8
CODE_B6EFAC:
	RTS					;$B6EFAC

CODE_B6EFAD:
	JSL.l CODE_B6F0C6			;$B6EFAD
	TYX					;$B6EFB1
	INC.b $60,x				;$B6EFB2
	LDA.b $1E,x				;$B6EFB4
	AND.w #$CFFF				;$B6EFB6
	ORA.w #$1000				;$B6EFB9
	STA.b $1E,x				;$B6EFBC
	LDA.w #$00FF				;$B6EFBE
	STA.b $64,x				;$B6EFC1
CODE_B6EFC3:
	TYX					;$B6EFC3
	LDA.b $64,x				;$B6EFC4
	SEC					;$B6EFC6
	SBC.b $62,x				;$B6EFC7
	BMI.b CODE_B6F03A			;$B6EFC9
CODE_B6EFCB:
	STA.b $64,x				;$B6EFCB
	SEP.b #$20				;$B6EFCD
	STA.w CPU.multiply_A			;$B6EFCF
	REP.b #$20				;$B6EFD2
	AND.w #$FF00				;$B6EFD4
	BNE.b CODE_B6F03F			;$B6EFD7
	LDA.w #$0010				;$B6EFD9
	STA.b $3A				;$B6EFDC
	LDA.w #$FD00				;$B6EFDE
	STA.b $47				;$B6EFE1
	LDA.b $66,x				;$B6EFE3
	STA.b $46				;$B6EFE5
	LDX.w #$057B				;$B6EFE7
	LDY.w #$0000				;$B6EFEA
CODE_B6EFED:
	LDA.b [$46],y				;$B6EFED
	PHA					;$B6EFEF
	JSR.w CODE_B6F0E3			;$B6EFF0
	STA.b $3C				;$B6EFF3
	LDA.b $01,S				;$B6EFF5
	LSR					;$B6EFF7
	LSR					;$B6EFF8
	LSR					;$B6EFF9
	LSR					;$B6EFFA
	LSR					;$B6EFFB
	JSR.w CODE_B6F0E3			;$B6EFFC
	ASL					;$B6EFFF
	ASL					;$B6F000
	ASL					;$B6F001
	ASL					;$B6F002
	ASL					;$B6F003
	ORA.b $3C				;$B6F004
	STA.b $3C				;$B6F006
	PLA					;$B6F008
	LSR					;$B6F009
	LSR					;$B6F00A
	XBA					;$B6F00B
	JSR.w CODE_B6F0E3			;$B6F00C
	XBA					;$B6F00F
	ASL					;$B6F010
	ASL					;$B6F011
	ORA.b $3C				;$B6F012
	STA.b $00,x				;$B6F014
	INY					;$B6F016
	INY					;$B6F017
	INX					;$B6F018
	INX					;$B6F019
	DEC.b $3A				;$B6F01A
	BNE.b CODE_B6EFED			;$B6F01C
	LDY.b current_sprite			;$B6F01E
	LDA.b $E8				;$B6F020
	ASL					;$B6F022
	ASL					;$B6F023
	TAX					;$B6F024
	LDA.w #$057B				;$B6F025
	STA.w $06FC,x				;$B6F028
	LDA.w $0068,y				;$B6F02B
	STA.w $06FE,x				;$B6F02E
	LDA.b $E8				;$B6F031
	INC					;$B6F033
	AND.w #$000F				;$B6F034
	STA.b $E8				;$B6F037
	RTS					;$B6F039

CODE_B6F03A:
	JSL.l delete_sprite_handle_deallocation	;$B6F03A
	RTS					;$B6F03E

CODE_B6F03F:
	LDA.b $E8				;$B6F03F
	ASL					;$B6F041
	ASL					;$B6F042
	TAY					;$B6F043
	LDA.b $66,x				;$B6F044
	STA.w $06FC,y				;$B6F046
	LDA.b $68,x				;$B6F049
	ORA.w #$00FD				;$B6F04B
	STA.w $06FE,y				;$B6F04E
	LDA.b $1E,x				;$B6F051
	AND.w #$CFFF				;$B6F053
	ORA.w #$3000				;$B6F056
	STA.b $1E,x				;$B6F059
	STZ.b $60,x				;$B6F05B
	RTS					;$B6F05D

CODE_B6F05E:
	JSL.l CODE_B6F0C6			;$B6F05E
	TYX					;$B6F062
	INC.b $60,x				;$B6F063
	LDA.b $1E,x				;$B6F065
	AND.w #$CFFF				;$B6F067
	ORA.w #$1000				;$B6F06A
	STA.b $1E,x				;$B6F06D
	STZ.b $64,x				;$B6F06F
CODE_B6F071:
	TYX					;$B6F071
	LDA.b $64,x				;$B6F072
	CLC					;$B6F074
	ADC.b $62,x				;$B6F075
	JMP.w CODE_B6EFCB			;$B6F077

CODE_B6F07A:
	TYX					;$B6F07A
	STZ.b $60,x				;$B6F07B
	LDY.b $62,x				;$B6F07D
	LDA.w $0000,y				;$B6F07F
	JSL.l CODE_BB85A0			;$B6F082
	RTS					;$B6F086

CODE_B6F087:
	TYX					;$B6F087
	LDA.b $6C,x				;$B6F088
	BEQ.b CODE_B6F09E			;$B6F08A
	CMP.w #$0008				;$B6F08C
	BCS.b CODE_B6F09E			;$B6F08F
	LDA.b $16,x				;$B6F091
	CMP.w #$00F0				;$B6F093
	BPL.b CODE_B6F09E			;$B6F096
	INC					;$B6F098
	INC					;$B6F099
	INC					;$B6F09A
	INC					;$B6F09B
	STA.b $16,x				;$B6F09C
CODE_B6F09E:
	RTS					;$B6F09E

CODE_B6F09F:
	TYX					;$B6F09F
	SEP.b #$20				;$B6F0A0
	LDA.b $16,x				;$B6F0A2
	CMP.b #$08				;$B6F0A4
	BPL.b CODE_B6F0AC			;$B6F0A6
	INC					;$B6F0A8
	INC					;$B6F0A9
	STA.b $16,x				;$B6F0AA
CODE_B6F0AC:
	REP.b #$20				;$B6F0AC
	RTS					;$B6F0AE

CODE_B6F0AF:
	TYX					;$B6F0AF
	SEP.b #$20				;$B6F0B0
	LDA.b $16,x				;$B6F0B2
	CMP.b #$F0				;$B6F0B4
	BPL.b CODE_B6F0BF			;$B6F0B6
	REP.b #$20				;$B6F0B8
	JSL.l delete_sprite_handle_deallocation	;$B6F0BA
	RTS					;$B6F0BE

CODE_B6F0BF:
	DEC					;$B6F0BF
	DEC					;$B6F0C0
	STA.b $16,x				;$B6F0C1
	REP.b #$20				;$B6F0C3
	RTS					;$B6F0C5

CODE_B6F0C6:
	LDA.w $0066,y				;$B6F0C6
	ASL					;$B6F0C9
	TAX					;$B6F0CA
	LDA.l sprite_palette_table,x		;$B6F0CB
	STA.w $0066,y				;$B6F0CF
	LDA.w $001E,y				;$B6F0D2
	AND.w #$0E00				;$B6F0D5
	ASL					;$B6F0D8
	ASL					;$B6F0D9
	ASL					;$B6F0DA
	CLC					;$B6F0DB
	ADC.w #$8100				;$B6F0DC
	STA.w $0068,y				;$B6F0DF
	RTL					;$B6F0E2

CODE_B6F0E3:
	AND.w #$001F				;$B6F0E3
	SEP.b #$20				;$B6F0E6
	STA.w CPU.multiply_B			;$B6F0E8
	REP.b #$20				;$B6F0EB
	NOP					;$B6F0ED
	LDA.w CPU.multiply_result		;$B6F0EE
	XBA					;$B6F0F1
	AND.w #$001F				;$B6F0F2
	RTS					;$B6F0F5

CODE_B6F0F6:
	INC.b $5C,x				;$B6F0F6
	LDA.b $5C,x				;$B6F0F8
	AND.w #$000F				;$B6F0FA
	BNE.b CODE_B6F107			;$B6F0FD
	LDA.b $5C,x				;$B6F0FF
	CLC					;$B6F101
	ADC.w #$0010				;$B6F102
	STA.b $5C,x				;$B6F105
CODE_B6F107:
	RTS					;$B6F107

CODE_B6F108:
	PHB					;$B6F108
	PHK					;$B6F109
	PLB					;$B6F10A
	LDY.w $0541				;$B6F10B
CODE_B6F10E:
	DEY					;$B6F10E
	DEY					;$B6F10F
	CPY.w #$1D93				;$B6F110
	BCC.b CODE_B6F176			;$B6F113
	LDX.b $00,y				;$B6F115
	PHY					;$B6F117
	LDY.b $1E,x				;$B6F118
	LDA.b $5C,x				;$B6F11A
	LSR					;$B6F11C
	STA.b $3A				;$B6F11D
	ROL					;$B6F11F
	ASL					;$B6F120
	ASL					;$B6F121
	STA.b $3E				;$B6F122
	LDA.b $12,x				;$B6F124
	SEC					;$B6F126
	SBC.b $3E				;$B6F127
	AND.w #$00FF				;$B6F129
	XBA					;$B6F12C
	ORA.b $16,x				;$B6F12D
	XBA					;$B6F12F
	LDX.b next_oam_slot			;$B6F130
CODE_B6F132:
	STA.b $00,x				;$B6F132
	STY.b $02,x				;$B6F134
	INY					;$B6F136
	INY					;$B6F137
	CLC					;$B6F138
	ADC.w #$0010				;$B6F139
	PHA					;$B6F13C
	TYA					;$B6F13D
	AND.w #$000F				;$B6F13E
	BNE.b CODE_B6F149			;$B6F141
	TYA					;$B6F143
	CLC					;$B6F144
	ADC.w #$0010				;$B6F145
	TAY					;$B6F148
CODE_B6F149:
	PHX					;$B6F149
	PHY					;$B6F14A
	TXA					;$B6F14B
	AND.w #$01FF				;$B6F14C
	PHA					;$B6F14F
	LSR					;$B6F150
	LSR					;$B6F151
	LSR					;$B6F152
	LSR					;$B6F153
	CLC					;$B6F154
	ADC.w #$0400				;$B6F155
	TAX					;$B6F158
	PLA					;$B6F159
	AND.w #$000F				;$B6F15A
	LSR					;$B6F15D
	TAY					;$B6F15E
	LDA.w DATA_B6F17E,y			;$B6F15F
	ORA.b $00,x				;$B6F162
	STA.b $00,x				;$B6F164
	PLY					;$B6F166
	PLX					;$B6F167
	PLA					;$B6F168
	INX					;$B6F169
	INX					;$B6F16A
	INX					;$B6F16B
	INX					;$B6F16C
	DEC.b $3A				;$B6F16D
	BNE.b CODE_B6F132			;$B6F16F
	STX.b next_oam_slot			;$B6F171
	PLY					;$B6F173
	BRA.b CODE_B6F10E			;$B6F174

CODE_B6F176:
	LDA.w #$1D93				;$B6F176
	STA.w $0541				;$B6F179
	PLB					;$B6F17C
	RTL					;$B6F17D

DATA_B6F17E:
	dw $0002
	dw $0008
	dw $0020
	dw $0080

CODE_B6F186:
	LDA.b $12,x				;$B6F186
	SEC					;$B6F188
	SBC.w $196D				;$B6F189
	CLC					;$B6F18C
	ADC.w #$0010				;$B6F18D
	CMP.w #$0110				;$B6F190
	BCS.b CODE_B6F1A2			;$B6F193
	LDA.b $16,x				;$B6F195
	SEC					;$B6F197
	SBC.w $1973				;$B6F198
	CLC					;$B6F19B
	ADC.w #$0010				;$B6F19C
	CMP.w #$0110				;$B6F19F
CODE_B6F1A2:
	RTL					;$B6F1A2

CODE_B6F1A3:
	PHX					;$B6F1A3
	LDA.w #$0002				;$B6F1A4
	LDY.w active_kong_sprite		;$B6F1A7
	CPY.b $78				;$B6F1AA
	BEQ.b CODE_B6F1B1			;$B6F1AC
	LDA.w #$0006				;$B6F1AE
CODE_B6F1B1:
	TSB.w $05B1				;$B6F1B1
	LDA.w #$002A				;$B6F1B4
	JSL.l CODE_B88069			;$B6F1B7
	PLX					;$B6F1BB
	RTS					;$B6F1BC

CODE_B6F1BD:
	LDA.w #$0020				;$B6F1BD
	PHK					;$B6F1C0
	%return(CODE_B6F1C7)			;$B6F1C1
	JMP.w [$1864]				;$B6F1C4

CODE_B6F1C7:
	BCS.b CODE_B6F1CE			;$B6F1C7
CODE_B6F1C9:
	LDX.b current_sprite			;$B6F1C9
	TXY					;$B6F1CB
	CLC					;$B6F1CC
	RTL					;$B6F1CD

CODE_B6F1CE:
	LDA.w $1852				;$B6F1CE
	BIT.w #$0004				;$B6F1D1
	BNE.b CODE_B6F1E4			;$B6F1D4
	BIT.w #$0001				;$B6F1D6
	BEQ.b CODE_B6F1C9			;$B6F1D9
	LDX.b $78				;$B6F1DB
	LDA.b $4A,x				;$B6F1DD
	AND.w #$4000				;$B6F1DF
	BNE.b CODE_B6F1C9			;$B6F1E2
CODE_B6F1E4:
	LDX.b current_sprite			;$B6F1E4
	LDY.b $78				;$B6F1E6
	SEC					;$B6F1E8
	RTL					;$B6F1E9

CODE_B6F1EA:
	PHA					;$B6F1EA
	LDX.b current_sprite			;$B6F1EB
	STY.b current_sprite			;$B6F1ED
	STY.b $78				;$B6F1EF
	PHX					;$B6F1F1
	JSL.l populate_sprite_clipping		;$B6F1F2
	JSL.l CODE_BCE2E9			;$B6F1F6
	PLX					;$B6F1FA
	STX.b current_sprite			;$B6F1FB
	PLA					;$B6F1FD
	JSL.l CODE_BCE43C			;$B6F1FE
	LDA.b $D4				;$B6F202
	CMP.w $1830				;$B6F204
	BCC.b CODE_B6F22C			;$B6F207
	LDA.w $1834				;$B6F209
	CMP.b $D0				;$B6F20C
	BCC.b CODE_B6F22C			;$B6F20E
	STA.b $DC				;$B6F210
	LDA.w $1836				;$B6F212
	CMP.b $D2				;$B6F215
	BCC.b CODE_B6F22C			;$B6F217
	STA.b $DE				;$B6F219
	LDA.b $D6				;$B6F21B
	CMP.w $1832				;$B6F21D
	BCC.b CODE_B6F22C			;$B6F220
	LDA.w $1830				;$B6F222
	STA.b $D8				;$B6F225
	LDA.w $1832				;$B6F227
	STA.b $DA				;$B6F22A
CODE_B6F22C:
	LDX.b current_sprite			;$B6F22C
	LDY.b $78				;$B6F22E
	RTL					;$B6F230

return_handle_anim_and_despawn:
	JSL CODE_BBAB52				;$B6F231
	BCS .despawned				;$B6F235
	JSL process_sprite_animation		;$B6F237
.despawned:
	JML [$04F5]				;$B6F23B

CODE_B6F23E:
	EOR.b $1E,x				;$B6F23E
	AND.w #$3000				;$B6F240
	EOR.b $1E,x				;$B6F243
	STA.b $1E,x				;$B6F245
	RTS					;$B6F247

CODE_B6F248:
	STA.b $1A				;$B6F248
	CLC					;$B6F24A
	ADC.w #$0100				;$B6F24B
	CMP.b $12,x				;$B6F24E
	BCS.b CODE_B6F261			;$B6F250
	LDA.w $04BC				;$B6F252
	ADC.w #$0100				;$B6F255
	SEC					;$B6F258
	SBC.b $1A				;$B6F259
	STA.b $1A				;$B6F25B
	LDA.b $12,x				;$B6F25D
	CMP.b $1A				;$B6F25F
CODE_B6F261:
	RTL					;$B6F261

invert_max_x_speed_if_needed:
	LDA sprite.oam_property,x		;$B6F262
	EOR sprite.max_x_speed,x		;$B6F264
	ASL					;$B6F266
	BPL .return				;$B6F267
	LDA sprite.max_x_speed,x		;$B6F269
	EOR #$FFFF				;$B6F26B
	INC					;$B6F26E
	STA sprite.max_x_speed,x		;$B6F26F
.return:
	RTS					;$B6F271

CODE_B6F272:
	LDA sprite.x_position,x			;$B6F272
	STA.w sprite.x_position,y		;$B6F274
	LDA sprite.y_position,x			;$B6F277
	STA.w sprite.y_position,y		;$B6F279
	RTL					;$B6F27C

CODE_B6F27D:
	JSL.l delete_sprite_handle_deallocation	;$B6F27D
	JML [$04F5]				;$B6F281

CODE_B6F284:
	LDY.w active_kong_sprite		;$B6F284
	LDA.b $12,x				;$B6F287
	CMP.w $0012,y				;$B6F289
	BCC.b CODE_B6F295			;$B6F28C
	LDA.b $1E,x				;$B6F28E
	ORA.w #$4000				;$B6F290
	BRA.b CODE_B6F29A			;$B6F293

CODE_B6F295:
	LDA.b $1E,x				;$B6F295
	AND.w #$BFFF				;$B6F297
CODE_B6F29A:
	STA.b $1E,x				;$B6F29A
	RTS					;$B6F29C

CODE_B6F29D:
	LDA.b $1E,x				;$B6F29D
	EOR.w #$4000				;$B6F29F
	STA.b $1E,x				;$B6F2A2
	RTS					;$B6F2A4

CODE_B6F2A5:
	LDA.b $1E,x				;$B6F2A5
	EOR.w #$8000				;$B6F2A7
	STA.b $1E,x				;$B6F2AA
	RTS					;$B6F2AC

CODE_B6F2AD:
	JSR.w CODE_B6F2B1			;$B6F2AD
	RTL					;$B6F2B0

CODE_B6F2B1:
	LDY.b $2A,x				;$B6F2B1
	BPL.b CODE_B6F2BE			;$B6F2B3
	EOR.w #$FFFF				;$B6F2B5
	INC					;$B6F2B8
	CMP.b $2A,x				;$B6F2B9
	BCS.b CODE_B6F2C2			;$B6F2BB
	RTS					;$B6F2BD

CODE_B6F2BE:
	CMP.b $2A,x				;$B6F2BE
	BCS.b CODE_B6F2C4			;$B6F2C0
CODE_B6F2C2:
	STA.b $2A,x				;$B6F2C2
CODE_B6F2C4:
	RTS					;$B6F2C4

CODE_B6F2C5:
	JSR.w CODE_B6F2C9			;$B6F2C5
	RTL					;$B6F2C8

CODE_B6F2C9:
	LDY.b $2E,x				;$B6F2C9
	BPL.b CODE_B6F2D6			;$B6F2CB
	EOR.w #$FFFF				;$B6F2CD
	INC					;$B6F2D0
	CMP.b $2E,x				;$B6F2D1
	BCS.b CODE_B6F2DA			;$B6F2D3
	RTS					;$B6F2D5

CODE_B6F2D6:
	CMP.b $2E,x				;$B6F2D6
	BCS.b CODE_B6F2DC			;$B6F2D8
CODE_B6F2DA:
	STA.b $2E,x				;$B6F2DA
CODE_B6F2DC:
	RTS					;$B6F2DC

CODE_B6F2DD:
	LDX.b current_sprite			;$B6F2DD
	LDA.b $0A,x				;$B6F2DF
	XBA					;$B6F2E1
	AND.w #$001F				;$B6F2E2
	DEC					;$B6F2E5
	ASL					;$B6F2E6
	RTS					;$B6F2E7

CODE_B6F2E8:
	STA.w $1C15				;$B6F2E8
	JSR.w CODE_B6F2DD			;$B6F2EB
	CLC					;$B6F2EE
	ADC.l $001780				;$B6F2EF
	TAX					;$B6F2F3
	LDA.l $7E0000,x				;$B6F2F4
	TAX					;$B6F2F8
	BRA.b CODE_B6F31D			;$B6F2F9

CODE_B6F2FB:
	PHX					;$B6F2FB
	DEC					;$B6F2FC
	ASL					;$B6F2FD
	TAX					;$B6F2FE
	ASL					;$B6F2FF
	ASL					;$B6F300
	TAY					;$B6F301
	LDA.l $7E6180,x				;$B6F302
	BMI.b CODE_B6F31A			;$B6F306
	AND.w #$1FFF				;$B6F308
	TAY					;$B6F30B
	BEQ.b CODE_B6F31A			;$B6F30C
	LDA.w $0000,y				;$B6F30E
	CMP.w $1C15				;$B6F311
	BNE.b CODE_B6F31A			;$B6F314
	PLX					;$B6F316
	LDX.b current_sprite			;$B6F317
	RTS					;$B6F319

CODE_B6F31A:
	PLX					;$B6F31A
	INX					;$B6F31B
	INX					;$B6F31C
CODE_B6F31D:
	LDA.l $7E0000,x				;$B6F31D
	BNE.b CODE_B6F2FB			;$B6F321
	LDY.w #$0000				;$B6F323
	RTS					;$B6F326

CODE_B6F327:
	LDA.w $0000,y				;$B6F327
	SEC					;$B6F32A
	SBC.b $12,x				;$B6F32B
	BPL.b CODE_B6F333			;$B6F32D
	EOR.w #$FFFF				;$B6F32F
	INC					;$B6F332
CODE_B6F333:
	CMP.w $1C15				;$B6F333
	BCS.b CODE_B6F347			;$B6F336
	LDA.w $0002,y				;$B6F338
	SEC					;$B6F33B
	SBC.b $16,x				;$B6F33C
	BPL.b CODE_B6F344			;$B6F33E
	EOR.w #$FFFF				;$B6F340
	INC					;$B6F343
CODE_B6F344:
	CMP.w $1C17				;$B6F344
CODE_B6F347:
	RTS					;$B6F347

CODE_B6F348:
	PHA					;$B6F348
	AND.w #$0007				;$B6F349
	TAY					;$B6F34C
	JSR.w CODE_B6F359			;$B6F34D
	PLY					;$B6F350
	PHA					;$B6F351
	TYA					;$B6F352
	LSR					;$B6F353
	LSR					;$B6F354
	LSR					;$B6F355
	TAY					;$B6F356
	PLA					;$B6F357
	RTS					;$B6F358

CODE_B6F359:
	TYA					;$B6F359
	ASL					;$B6F35A
	TAY					;$B6F35B
	LDA.w DATA_B6F361,y			;$B6F35C
	RTS					;$B6F35F

CODE_B6F360:
	RTS					;$B6F360

DATA_B6F361:
	dw $0001
	dw $0002
	dw $0004
	dw $0008
	dw $0010
	dw $0020
	dw $0040
	dw $0080

CODE_B6F371:
	SEP #$20				;$B6F371
	LDA $5C,x				;$B6F373
	STA $5D,x				;$B6F375
	LDA $5E,x				;$B6F377
	XBA					;$B6F379
	LDA #$01				;$B6F37A
	REP #$20				;$B6F37C
	STA $5E,x				;$B6F37E
	RTS					;$B6F380

;This routine is used as a generic-ish timer countdown routine.
;Once the timer is done, it sets carry flag and resets the timer + some other stuff.
CODE_B6F381:
	LDA.b $62,x				;$B6F381
	BNE.b CODE_B6F3A5			;$B6F383
	SEP.b #$20				;$B6F385
	DEC.b $5E,x				;$B6F387
	BNE.b CODE_B6F3A7			;$B6F389
	LDA.b $5F,x				;$B6F38B
	STA.b $5E,x				;$B6F38D
	DEC.b $5C,x				;$B6F38F
	BNE.b CODE_B6F3A1			;$B6F391
	LDA.b $5D,x				;$B6F393
	STA.b $5C,x				;$B6F395
	LDA.b #$01				;$B6F397
	STA.b $5E,x				;$B6F399
	REP.b #$20				;$B6F39B
	LDA.b $60,x				;$B6F39D
	STA.b $62,x				;$B6F39F
CODE_B6F3A1:
	REP.b #$20				;$B6F3A1
	SEC					;$B6F3A3
	RTS					;$B6F3A4

CODE_B6F3A5:
	DEC.b $62,x				;$B6F3A5
CODE_B6F3A7:
	REP.b #$20				;$B6F3A7
	CLC					;$B6F3A9
	RTS					;$B6F3AA

CODE_B6F3AB:
	STZ.w $1C15				;$B6F3AB
	TAX					;$B6F3AE
	LDA.w $0012,y				;$B6F3AF
	CMP.b $00,x				;$B6F3B2
	BCC.b CODE_B6F3D6			;$B6F3B4
	CMP.b $02,x				;$B6F3B6
	BCS.b CODE_B6F3D6			;$B6F3B8
	LDA.w $0016,y				;$B6F3BA
	CMP.b $04,x				;$B6F3BD
	BCC.b CODE_B6F3D6			;$B6F3BF
	CMP.b $06,x				;$B6F3C1
	BCS.b CODE_B6F3D6			;$B6F3C3
	LDX.b current_sprite			;$B6F3C5
	CMP.b $16,x				;$B6F3C7
	ROL.w $1C15				;$B6F3C9
	LDA.w $0012,y				;$B6F3CC
	CMP.b $12,x				;$B6F3CF
	ROL.w $1C15				;$B6F3D1
	SEC					;$B6F3D4
	RTL					;$B6F3D5

CODE_B6F3D6:
	CLC					;$B6F3D6
	LDX.b current_sprite			;$B6F3D7
	RTL					;$B6F3D9

CODE_B6F3DA:
	LDX.b current_sprite			;$B6F3DA
	LDA.b $12,x				;$B6F3DC
	STA.w $1C31				;$B6F3DE
	LDA.b $16,x				;$B6F3E1
	STA.w $1C2F				;$B6F3E3
	RTL					;$B6F3E6

CODE_B6F3E7:
	JSR.w CODE_B6F3EB			;$B6F3E7
	RTL					;$B6F3EA

CODE_B6F3EB:
	LDX.b current_sprite			;$B6F3EB
	PHX					;$B6F3ED
	STY.b current_sprite			;$B6F3EE
	JSL.l delete_sprite_handle_deallocation	;$B6F3F0
	PLX					;$B6F3F4
	STX.b current_sprite			;$B6F3F5
	RTS					;$B6F3F7

CODE_B6F3F8:
	STY.b $3E				;$B6F3F8
	JSL.l CODE_BCE75E			;$B6F3FA
	LDX.b current_sprite			;$B6F3FE
	BCC.b CODE_B6F423			;$B6F400
	LDY.b $78				;$B6F402
	LDA.b $3E				;$B6F404
	ORA.w $003C,y				;$B6F406
	STA.w $003C,y				;$B6F409
	LDA.b $1E,x				;$B6F40C
	EOR.b $2A,x				;$B6F40E
	AND.w #$4000				;$B6F410
	EOR.b $2A,x				;$B6F413
	AND.w #$C000				;$B6F415
	CLC					;$B6F418
	ADC.b current_sprite			;$B6F419
	SEC					;$B6F41B
	SBC.w #aux_sprite_slot			;$B6F41C
	STA.w $003E,y				;$B6F41F
	SEC					;$B6F422
CODE_B6F423:
	RTL					;$B6F423

DATA_B6F424:
	db $01
	db $02
	db $04
	db $08
	db $10
	db $20
	db $40
	db $80

DATA_B6F42C:
	dw $2826
	dw $2B2A
	dw $2D2C
	dw $2F1A
	dw $3130
	dw $2632
	dw $1E22
	dw $0329
	dw $0B07
	dw $130F
	dw $1B17
	dw $231F
	dw $3327
	dw $3534
	dw $3736
	dw $382E
	dw $0400
	dw $0C08
	dw $1410
	dw $1C18
	dw $2420
	dw $0501
	dw $0D09
	dw $1511
	dw $1D19
	dw $2521
	dw $0602
	dw $0E0A
	dw $1612
	dw $3938
	dw $3B3A


DATA_B6F46A:
	dw $0045
	dw $0046
	dw $FFFF

DATA_B6F470:
	dw $0090
	dw $0045
	dw $FFFF

DATA_B6F476:
	dw DATA_B6F47A
	dw DATA_B6F482

DATA_B6F47A:
	dw $0135
	dw $0100
	dw $F800
	dw $0137

DATA_B6F482:
	dw $0135
	dw $0100
	dw $F800
	dw $0137

DATA_B6F48A:
	dw $001C

DATA_B6F48C:
	dw $5611
	dw $1800
	dw $4056
	dw $551F
	dw $3900
	dw $002E
	dw $3853
	dw $3700
	dw $0057
	dw $5743
	dw $4A00
	dw $4055
	dw $5554
	dw $5D00
	dw $4053
	dw $5366
	dw $7500
	dw $0065
	dw $6084
	dw $8440
	dw $007A
	dw $7A91
	dw $BA00
	dw $004F
	dw $55D2
	dw $C340
	dw $4050
	dw $64E5
	dw $E640
	dw $406A
	dw $2928
	dw $B700
	dw $008F
	dw $8BBF
	dw $C400
	dw $402B
	dw $2CD0
	dw $DB40
	dw $402C
	dw $9177
	dw $8000
	dw $4092


CODE_B6F4E0:
	PHB					;$B6F4E0
	JSR.w CODE_B6F4E6			;$B6F4E1
	PLB					;$B6F4E4
	RTL					;$B6F4E5

CODE_B6F4E6:
	LDA.w #$7EF000>>16			;$B6F4E6
	STA.b $44				;$B6F4E9
	LDA.w #$7EF000				;$B6F4EB
	STA.b $42				;$B6F4EE
	LDA.l $7EA7BA,x				;$B6F4F0
	CLC					;$B6F4F4
	ADC.w #$A9DE				;$B6F4F5
	TAX					;$B6F4F8
	LDA.w #$0580				;$B6F4F9
	CLC					;$B6F4FC
	ADC.b $42				;$B6F4FD
	STA.b $42				;$B6F4FF
	STZ.b $1C				;$B6F501
	STZ.b $1E				;$B6F503
	LDA.w #$3000				;$B6F505
	LDY.w $0547				;$B6F508
	BNE.b CODE_B6F510			;$B6F50B
	LDA.w #$2000				;$B6F50D
CODE_B6F510:
	STA.b $20				;$B6F510
	LDA.l $7E0000,x				;$B6F512
	AND.w #$00FF				;$B6F516
	STA.b $1A				;$B6F519
	SEP.b #$20				;$B6F51B
	LDA.b #$05				;$B6F51D
	SEC					;$B6F51F
	SBC.b $1A				;$B6F520
	REP.b #$20				;$B6F522
	XBA					;$B6F524
	LSR					;$B6F525
	LSR					;$B6F526
	CLC					;$B6F527
	ADC.b $42				;$B6F528
	STA.b $42				;$B6F52A
	TAY					;$B6F52C
	JSL.l CODE_B48006			;$B6F52D
	RTS					;$B6F531

CODE_B6F532:
	JSR.w CODE_B6F536			;$B6F532
	RTL					;$B6F535

CODE_B6F536:
	PHB					;$B6F536
	LDA.w #$2000				;$B6F537
	STA.l $7EF5C0				;$B6F53A
	LDA.w #$00FF				;$B6F53E
	LDX.w #$7EF5C0				;$B6F541
	LDY.w #$7EF5C2				;$B6F544
	MVN $7EF5C2>>16,$7EF5C0>>16		;$B6F547
	PLB					;$B6F54A
	RTS					;$B6F54B

CODE_B6F54C:
	LDY.b current_sprite			;$B6F54C
	ASL					;$B6F54E
	TAX					;$B6F54F
	JMP.w (DATA_B6F553,x)			;$B6F550

DATA_B6F553:
	dw CODE_B6F609
	dw CODE_B6F63C
	dw !null_pointer
	dw CODE_B6F659
	dw CODE_B6F6D2
	dw CODE_B6F6E1
	dw CODE_B6F707
	dw CODE_B6F75C
	dw CODE_B6F783
	dw CODE_B6F7C7
	dw CODE_B6F7F3
	dw CODE_B6F80C
	dw CODE_B6F814
	dw CODE_B6F839
	dw CODE_B6F848
	dw CODE_B6F85F
	dw CODE_B6F88E
	dw CODE_B6F8A9
	dw CODE_B6F8AF
	dw CODE_B6F8C5
	dw CODE_B6F8CB
	dw CODE_B6F8E0
	dw CODE_B6F93F
	dw CODE_B6F978
	dw CODE_B6F98F
	dw CODE_B6F993
	dw CODE_B6F9B8
	dw CODE_B6F9BF
	dw CODE_B6F9C6
	dw CODE_B6F9DE
	dw CODE_B6F9EF
	dw CODE_B6FA1D
	dw CODE_B6FA24
	dw CODE_B6FA4E
	dw CODE_B6FA5A
	dw CODE_B6FA61
	dw CODE_B6FA68
	dw CODE_B6FA7E
	dw CODE_B6FA84
	dw CODE_B6FA8A
	dw CODE_B6FA90
	dw CODE_B6FA96
	dw CODE_B6FAC7
	dw CODE_B6FACD
	dw CODE_B6FAD3
	dw CODE_B6FAE8
	dw CODE_B6FAFF
	dw CODE_B6FB7A
	dw CODE_B6FB1E
	dw CODE_B6FB28
	dw CODE_B6FB32
	dw CODE_B6FB3C
	dw CODE_B6FB46
	dw CODE_B6FB74
	dw CODE_B6FB80
	dw CODE_B6FB98
	dw CODE_B6FB9E
	dw CODE_B6FBA4
	dw CODE_B6FBC7
	dw CODE_B6FC60
	dw CODE_B6FC6B
	dw CODE_B6FCAD
	dw CODE_B6FCC0
	dw CODE_B6FCD6
	dw CODE_B6FCDF
	dw CODE_B6FCE7
	dw CODE_B6FCFA
	dw CODE_B6FD3D
	dw CODE_B6FD88
	dw CODE_B6FD8C
	dw CODE_B6FD91
	dw CODE_B6FD95
	dw CODE_B6F9E5
	dw CODE_B6F9EA
	dw CODE_B6FD9A
	dw CODE_B6FDB3
	dw CODE_B6FDCC
	dw CODE_B6FDE1
	dw !null_pointer
	dw CODE_B6FDEC
	dw CODE_B6FDF9
	dw CODE_B6FE02
	dw CODE_B6FE08
	dw CODE_B6FE28
	dw CODE_B6FE31
	dw CODE_B6FE46
	dw CODE_B6FE83
	dw CODE_B6FE95
	dw CODE_B6FEA7
	dw CODE_B6FEB4
	dw CODE_B6FB0F

CODE_B6F609:
	TYX					;$B6F609
	LDY.w active_kong_sprite		;$B6F60A
	LDA.b $12,x				;$B6F60D
	SEC					;$B6F60F
	SBC.w $0012,y				;$B6F610
	EOR.w $001E,y				;$B6F613
	ASL					;$B6F616
	BMI.b CODE_B6F632			;$B6F617
	LDA.b $30,x				;$B6F619
	EOR.b $1E,x				;$B6F61B
	ASL					;$B6F61D
	BMI.b CODE_B6F631			;$B6F61E
CODE_B6F620:
	LDA.w #$01B4				;$B6F620
	LDY.b $38,x				;$B6F623
	CPY.w #$0002				;$B6F625
	BNE.b CODE_B6F62D			;$B6F628
	LDA.w #$01B3				;$B6F62A
CODE_B6F62D:
	JSL.l set_sprite_animation		;$B6F62D
CODE_B6F631:
	RTL					;$B6F631

CODE_B6F632:
	LDA.b $1E,x				;$B6F632
	EOR.w $001E,y				;$B6F634
	ASL					;$B6F637
	BPL.b CODE_B6F620			;$B6F638
	BRA.b CODE_B6F631			;$B6F63A

CODE_B6F63C:
	TYX					;$B6F63C
	LDA.b $30,x				;$B6F63D
	EOR.b $1E,x				;$B6F63F
	ASL					;$B6F641
	BPL.b CODE_B6F64C			;$B6F642
	LDA.w #$01C7				;$B6F644
	JSL.l set_sprite_animation		;$B6F647
	RTL					;$B6F64B

CODE_B6F64C:
	LDY.w #$0100				;$B6F64C
	LDA.b $2E,x				;$B6F64F
	BMI.b CODE_B6F656			;$B6F651
	LDY.w #$00FF				;$B6F653
CODE_B6F656:
	STY.b $44,x				;$B6F656
	RTL					;$B6F658

CODE_B6F659:
	TYX					;$B6F659
	LDY.w $1B6F				;$B6F65A
	BEQ.b CODE_B6F6CC			;$B6F65D
	LDA.w $0000,y				;$B6F65F
	BEQ.b CODE_B6F6CC			;$B6F662
	LDA.w #$002B				;$B6F664
	JSL.l CODE_BEC003			;$B6F667
	BCC.b CODE_B6F6CC			;$B6F66B
	LDA.b $5E,x				;$B6F66D
	STA.w $054F				;$B6F66F
	LDA.w #$002D				;$B6F672
	STA.b $4C,x				;$B6F675
	LDA.w $0000,y				;$B6F677
	CMP.w #$03B4				;$B6F67A
	BNE.b CODE_B6F694			;$B6F67D
	INC.w $0551				;$B6F67F
	LDA.w #$0040				;$B6F682
	STA.b $4E,x				;$B6F685
	LDA.w #$0003				;$B6F687
	CMP.w $0551				;$B6F68A
	BCS.b CODE_B6F6B0			;$B6F68D
	STA.w $0551				;$B6F68F
	BRA.b CODE_B6F6A1			;$B6F692

CODE_B6F694:
	LDA.w #$003F				;$B6F694
	STA.b $4E,x				;$B6F697
	DEC.w $0551				;$B6F699
	BPL.b CODE_B6F6B0			;$B6F69C
	STZ.w $0551				;$B6F69E
CODE_B6F6A1:
	JSL.l CODE_B7802D			;$B6F6A1
	BEQ.b CODE_B6F6B0			;$B6F6A5
	LDA.w $051D				;$B6F6A7
	DEC					;$B6F6AA
	DEC					;$B6F6AB
	BEQ.b CODE_B6F6B0			;$B6F6AC
	STZ.b $4C,x				;$B6F6AE
CODE_B6F6B0:
	LDX.b current_sprite			;$B6F6B0
	PHX					;$B6F6B2
	STY.b current_sprite			;$B6F6B3
	PHY					;$B6F6B5
	JSL.l CODE_BB85AC			;$B6F6B6
	PLY					;$B6F6BA
	PLX					;$B6F6BB
	STX.b current_sprite			;$B6F6BC
	JSL.l CODE_B6F3E7			;$B6F6BE
	DEC.w $051D				;$B6F6C2
	LDA.w #$002F				;$B6F6C5
	JSL.l CODE_BFF006			;$B6F6C8
CODE_B6F6CC:
	LDA.w #$0001				;$B6F6CC
	STA.b $38,x				;$B6F6CF
	RTL					;$B6F6D1

CODE_B6F6D2:
	LDA.w $0551				;$B6F6D2
	CLC					;$B6F6D5
	ADC.w #$01B9				;$B6F6D6
	JSL.l set_sprite_animation		;$B6F6D9
	JSR.w CODE_B68B5A			;$B6F6DD
	RTL					;$B6F6E0

CODE_B6F6E1:
	TYX					;$B6F6E1
	LDA.w #$0045				;$B6F6E2
	STA.b $5A,x				;$B6F6E5
	RTL					;$B6F6E7

CODE_B6F6E8:
	LDA.b $2E,x				;$B6F6E8
	JSR.w CODE_B6F74B			;$B6F6EA
	BCC.b CODE_B6F706			;$B6F6ED
	LDY.w active_kong_sprite		;$B6F6EF
	LDA.b $12,x				;$B6F6F2
	SEC					;$B6F6F4
	SBC.w $0012,y				;$B6F6F5
	LDY.w #$01F0				;$B6F6F8
	EOR.b $1E,x				;$B6F6FB
	ASL					;$B6F6FD
	BPL.b CODE_B6F701			;$B6F6FE
	DEY					;$B6F700
CODE_B6F701:
	TYA					;$B6F701
	JSL.l set_sprite_animation		;$B6F702
CODE_B6F706:
	RTL					;$B6F706

CODE_B6F707:
	TYX					;$B6F707
	LDY.b $2E,x				;$B6F708
	BMI.b CODE_B6F741			;$B6F70A
	LDA.b $38,x				;$B6F70C
	CMP.w #$0005				;$B6F70E
	BEQ.b CODE_B6F6E8			;$B6F711
	CMP.w #$000A				;$B6F713
	BEQ.b CODE_B6F742			;$B6F716
	LDA.b $5E,x				;$B6F718
	AND.w #$00FF				;$B6F71A
	CMP.w #$0001				;$B6F71D
	BNE.b CODE_B6F72D			;$B6F720
CODE_B6F722:
	TYA					;$B6F722
	JSR.w CODE_B6F74B			;$B6F723
	BCC.b CODE_B6F741			;$B6F726
	LDA.w #$01F0				;$B6F728
	BRA.b CODE_B6F73D			;$B6F72B

CODE_B6F72D:
	TYA					;$B6F72D
	ASL					;$B6F72E
	CLC					;$B6F72F
	ADC.b $2E,x				;$B6F730
	XBA					;$B6F732
	AND.w #$00FF				;$B6F733
	CMP.b $1A,x				;$B6F736
	BCC.b CODE_B6F741			;$B6F738
	LDA.w #$01EF				;$B6F73A
CODE_B6F73D:
	JSL.l set_sprite_animation		;$B6F73D
CODE_B6F741:
	RTL					;$B6F741

CODE_B6F742:
	LDA.b $5C,x				;$B6F742
	EOR.b $1E,x				;$B6F744
	ASL					;$B6F746
	BPL.b CODE_B6F72D			;$B6F747
	BRA.b CODE_B6F722			;$B6F749

CODE_B6F74B:
	ASL					;$B6F74B
	ASL					;$B6F74C
	STA.b $1A				;$B6F74D
	ASL					;$B6F74F
	CLC					;$B6F750
	ADC.b $2E,x				;$B6F751
	ADC.b $1A				;$B6F753
	XBA					;$B6F755
	AND.w #$00FF				;$B6F756
	CMP.b $1A,x				;$B6F759
	RTS					;$B6F75B

CODE_B6F75C:
	TYX					;$B6F75C
	LDA.b $2A,x				;$B6F75D
	BEQ.b CODE_B6F782			;$B6F75F
	LDY.w active_kong_sprite		;$B6F761
	LDA.w $0012,y				;$B6F764
	SEC					;$B6F767
	SBC.b $12,x				;$B6F768
	AND.w #$4000				;$B6F76A
	EOR.b $1E,x				;$B6F76D
	AND.w #$4000				;$B6F76F
	EOR.b $1E,x				;$B6F772
	STA.b $1E,x				;$B6F774
	LDA.w #$01AC				;$B6F776
	STA.b $68,x				;$B6F779
	LDA.w #$01AE				;$B6F77B
	JSL.l set_sprite_animation		;$B6F77E
CODE_B6F782:
	RTL					;$B6F782

CODE_B6F783:
	TYX					;$B6F783
	LDA.b $2A,x				;$B6F784
	ORA.b $30,x				;$B6F786
	BNE.b CODE_B6F78F			;$B6F788
	JSL.l CODE_B6F7C7			;$B6F78A
	RTL					;$B6F78E

CODE_B6F78F:
	LDA.b $30,x				;$B6F78F
	BEQ.b CODE_B6F7AD			;$B6F791
	EOR.b $1E,x				;$B6F793
	ASL					;$B6F795
	BPL.b CODE_B6F7AD			;$B6F796
	LDA.b $2A,x				;$B6F798
	BPL.b CODE_B6F7A0			;$B6F79A
	EOR.w #$FFFF				;$B6F79C
	INC					;$B6F79F
CODE_B6F7A0:
	CMP.w #$00C0				;$B6F7A0
	BCS.b CODE_B6F7AD			;$B6F7A3
	LDA.w #$01AD				;$B6F7A5
	JSL.l set_sprite_animation		;$B6F7A8
	RTL					;$B6F7AC

CODE_B6F7AD:
	LDA.w #$0040				;$B6F7AD
	BRA.b CODE_B6F7B2			;$B6F7B0

CODE_B6F7B2:
	LDX.b current_sprite			;$B6F7B2
CODE_B6F7B4:
	STA.b $1A				;$B6F7B4
	LDA.b $2A,x				;$B6F7B6
	BPL.b CODE_B6F7BE			;$B6F7B8
	EOR.w #$FFFF				;$B6F7BA
	INC					;$B6F7BD
CODE_B6F7BE:
	CMP.b $1A				;$B6F7BE
	BCS.b CODE_B6F7C4			;$B6F7C0
	LDA.b $1A				;$B6F7C2
CODE_B6F7C4:
	STA.b $44,x				;$B6F7C4
	RTL					;$B6F7C6

CODE_B6F7C7:
	LDX.b current_sprite			;$B6F7C7
	LDA.w #$0008				;$B6F7C9
	JSL.l CODE_B58006			;$B6F7CC
	TAY					;$B6F7D0
	LDA.w #$01A9				;$B6F7D1
	CPY.w #$0003				;$B6F7D4
	BCC.b CODE_B6F7E0			;$B6F7D7
	INC					;$B6F7D9
	CPY.w #$0005				;$B6F7DA
	BCC.b CODE_B6F7E0			;$B6F7DD
	INC					;$B6F7DF
CODE_B6F7E0:
	STA.b $68,x				;$B6F7E0
	TAY					;$B6F7E2
	LDA.w #$01AC				;$B6F7E3
	CMP.b $40,x				;$B6F7E6
	BNE.b CODE_B6F7ED			;$B6F7E8
	LDY.w #$01AE				;$B6F7EA
CODE_B6F7ED:
	TYA					;$B6F7ED
	JSL.l set_sprite_animation		;$B6F7EE
	RTL					;$B6F7F2

CODE_B6F7F3:
	TYX					;$B6F7F3
	LDA.b $2E,x				;$B6F7F4
	BMI.b CODE_B6F80B			;$B6F7F6
	ASL					;$B6F7F8
	ASL					;$B6F7F9
	ASL					;$B6F7FA
	ASL					;$B6F7FB
	XBA					;$B6F7FC
	AND.w #$00FF				;$B6F7FD
	CMP.b $1A,x				;$B6F800
	BCC.b CODE_B6F80B			;$B6F802
	LDA.w #$01F7				;$B6F804
	JSL.l set_sprite_animation		;$B6F807
CODE_B6F80B:
	RTL					;$B6F80B

CODE_B6F80C:
	TYX					;$B6F80C
	LDA.b $6C,x				;$B6F80D
	JSL.l set_sprite_animation		;$B6F80F
	RTL					;$B6F813

CODE_B6F814:
	TYX					;$B6F814
	LDA.b $2E,x				;$B6F815
	BMI.b CODE_B6F838			;$B6F817
	ASL					;$B6F819
	ASL					;$B6F81A
	ASL					;$B6F81B
	ASL					;$B6F81C
	XBA					;$B6F81D
	AND.w #$00FF				;$B6F81E
	CMP.b $1A,x				;$B6F821
	BCC.b CODE_B6F838			;$B6F823
	LDY.b $32,x				;$B6F825
	LDA.w $0064,y				;$B6F827
	AND.w #$00FF				;$B6F82A
	BEQ.b CODE_B6F836			;$B6F82D
	LDA.b $2C,x				;$B6F82F
	ORA.w #$0001				;$B6F831
	STA.b $2C,x				;$B6F834
CODE_B6F836:
	STZ.b $48,x				;$B6F836
CODE_B6F838:
	RTL					;$B6F838

CODE_B6F839:
	TYX					;$B6F839
	LDY.b $32,x				;$B6F83A
	LDA.b $68,x				;$B6F83C
	STA.b $5C,x				;$B6F83E
	LDA.w #$01F9				;$B6F840
	JSL.l set_sprite_animation		;$B6F843
	RTL					;$B6F847

CODE_B6F848:
	TYX					;$B6F848
	LDA.w #$0046				;$B6F849
	STA.b $5A,x				;$B6F84C
	LDY.b $32,x				;$B6F84E
	LDX.b $5E,y				;$B6F850
	LDA.w #$01FE				;$B6F852
	CPX.b current_sprite			;$B6F855
	BEQ.b CODE_B6F85A			;$B6F857
	INC					;$B6F859
CODE_B6F85A:
	JSL.l set_sprite_animation		;$B6F85A
	RTL					;$B6F85E

CODE_B6F85F:
	TYX					;$B6F85F
	LDY.b $32,x				;$B6F860
	TYX					;$B6F862
	JSR.w CODE_B69C91			;$B6F863
	CPY.b current_sprite			;$B6F866
	BNE.b CODE_B6F886			;$B6F868
	LDY.b $32,x				;$B6F86A
	LDA.w $0039,y				;$B6F86C
	AND.w #$00FF				;$B6F86F
	BEQ.b CODE_B6F87D			;$B6F872
	SEP.b #$20				;$B6F874
	STA.w $0038,y				;$B6F876
	REP.b #$20				;$B6F879
	BRA.b CODE_B6F886			;$B6F87B

CODE_B6F87D:
	LDX.b current_sprite			;$B6F87D
	LDA.b $2C,x				;$B6F87F
	ORA.w #$0002				;$B6F881
	STA.b $2C,x				;$B6F884
CODE_B6F886:
	LDA.w #$01F9				;$B6F886
	JSL.l set_sprite_animation		;$B6F889
	RTL					;$B6F88D

CODE_B6F88E:
	TYX					;$B6F88E
	LDY.b $32,x				;$B6F88F
CODE_B6F891:
	LDA.w $0039,y				;$B6F891
	AND.w #$00FF				;$B6F894
	BEQ.b CODE_B6F8A1			;$B6F897
	SEP.b #$20				;$B6F899
	STA.w $0038,y				;$B6F89B
	REP.b #$20				;$B6F89E
	RTL					;$B6F8A0

CODE_B6F8A1:
	LDA.w #$01F9				;$B6F8A1
	JSL.l set_sprite_animation		;$B6F8A4
	RTL					;$B6F8A8

CODE_B6F8A9:
	LDA.w #$0080				;$B6F8A9
	JMP.w CODE_B6F7B2			;$B6F8AC

CODE_B6F8AF:
	LDA.w #$0204				;$B6F8AF
CODE_B6F8B2:
	STA.b $1A				;$B6F8B2
	TYX					;$B6F8B4
	LDA.b $30,x				;$B6F8B5
	BEQ.b CODE_B6F8C4			;$B6F8B7
	EOR.b $1E,x				;$B6F8B9
	ASL					;$B6F8BB
	BPL.b CODE_B6F8C4			;$B6F8BC
	LDA.b $1A				;$B6F8BE
	JSL.l set_sprite_animation		;$B6F8C0
CODE_B6F8C4:
	RTL					;$B6F8C4

CODE_B6F8C5:
	LDA.w #$00C0				;$B6F8C5
	JMP.w CODE_B6F7B2			;$B6F8C8

CODE_B6F8CB:
	TYX					;$B6F8CB
	LDA.b $30,x				;$B6F8CC
	EOR.b $1E,x				;$B6F8CE
	ASL					;$B6F8D0
	BMI.b CODE_B6F8DF			;$B6F8D1
	JSR.w CODE_B6F913			;$B6F8D3
	BCC.b CODE_B6F8DF			;$B6F8D6
	LDA.b $40,x				;$B6F8D8
	INC					;$B6F8DA
	JSL.l set_sprite_animation		;$B6F8DB
CODE_B6F8DF:
	RTL					;$B6F8DF

CODE_B6F8E0:
	TYX					;$B6F8E0
	LDA.b $1E,x				;$B6F8E1
	ASL					;$B6F8E3
	BPL.b CODE_B6F8EA			;$B6F8E4
	LDA.b $64,x				;$B6F8E6
	BRA.b CODE_B6F8EC			;$B6F8E8

CODE_B6F8EA:
	LDA.b $66,x				;$B6F8EA
CODE_B6F8EC:
	SEC					;$B6F8EC
	SBC.b $12,x				;$B6F8ED
	BPL.b CODE_B6F8F5			;$B6F8EF
	EOR.w #$FFFF				;$B6F8F1
	INC					;$B6F8F4
CODE_B6F8F5:
	STA.b $1A				;$B6F8F5
	XBA					;$B6F8F7
	STA.w CPU.dividen_low			;$B6F8F8
	SEP.b #$20				;$B6F8FB
	LDA.b $68,x				;$B6F8FD
	STA.w CPU.divisor			;$B6F8FF
	REP.b #$20				;$B6F902
	JSL.l stall_cpu_time			;$B6F904
	LDA.w CPU.divide_result			;$B6F908
	ASL					;$B6F90B
	CLC					;$B6F90C
	ADC.w #$0100				;$B6F90D
	STA.b $44,x				;$B6F910
	RTL					;$B6F912

CODE_B6F913:
	LDA.b $30,x				;$B6F913
	BPL.b CODE_B6F92D			;$B6F915
	LDA.b $68,x				;$B6F917
	LSR					;$B6F919
	STA.b $1A				;$B6F91A
	LSR					;$B6F91C
	LSR					;$B6F91D
	SEC					;$B6F91E
	SBC.b $1A				;$B6F91F
	EOR.w #$FFFF				;$B6F921
	SEC					;$B6F924
	ADC.b $64,x				;$B6F925
	CMP.b $12,x				;$B6F927
	BCC.b CODE_B6F93D			;$B6F929
CODE_B6F92B:
	SEC					;$B6F92B
	RTS					;$B6F92C

CODE_B6F92D:
	LDA.b $68,x				;$B6F92D
	LSR					;$B6F92F
	STA.b $1A				;$B6F930
	LSR					;$B6F932
	LSR					;$B6F933
	SEC					;$B6F934
	SBC.b $1A				;$B6F935
	ADC.b $66,x				;$B6F937
	CMP.b $12,x				;$B6F939
	BCC.b CODE_B6F92B			;$B6F93B
CODE_B6F93D:
	CLC					;$B6F93D
	RTS					;$B6F93E

CODE_B6F93F:
	TYX					;$B6F93F
	LDY.w #$00CE				;$B6F940
	JSL.l CODE_BB85B8			;$B6F943
	LDY.b alternate_sprite			;$B6F947
	LDX.b current_sprite			;$B6F949
	LDA.b $5E,x				;$B6F94B
	STA.w $0044,y				;$B6F94D
	LDA.b $1E,x				;$B6F950
	ASL					;$B6F952
	BMI.b CODE_B6F962			;$B6F953
	LDA.w $001E,y				;$B6F955
	AND.w #$BFFF				;$B6F958
	STA.w $001E,y				;$B6F95B
	LDA.b $5E,x				;$B6F95E
	BRA.b CODE_B6F971			;$B6F960

CODE_B6F962:
	LDA.w $001E,y				;$B6F962
	ORA.w #$4000				;$B6F965
	STA.w $001E,y				;$B6F968
	LDA.b $5E,x				;$B6F96B
	EOR.w #$FFFF				;$B6F96D
	INC					;$B6F970
CODE_B6F971:
	STA.w $002A,y				;$B6F971
	STA.w $0030,y				;$B6F974
	RTL					;$B6F977

CODE_B6F978:
	TYX					;$B6F978
	LDY.w active_kong_sprite		;$B6F979
	LDA.b $12,x				;$B6F97C
	SEC					;$B6F97E
	SBC.w $0012,y				;$B6F97F
	EOR.b $1E,x				;$B6F982
	ASL					;$B6F984
	BMI.b CODE_B6F98E			;$B6F985
	LDA.w #$01F3				;$B6F987
	JSL.l set_sprite_animation		;$B6F98A
CODE_B6F98E:
	RTL					;$B6F98E

CODE_B6F98F:
	TYX					;$B6F98F
	INC.b $38,x				;$B6F990
	RTL					;$B6F992

CODE_B6F993:
	TYX					;$B6F993
	LDA.w #$0013				;$B6F994
	JSL.l CODE_B88069			;$B6F997
	BCS.b CODE_B6F9B7			;$B6F99B
	LDY.w #$0400				;$B6F99D
	LDA.b $1E,x				;$B6F9A0
	ASL					;$B6F9A2
	BPL.b CODE_B6F9A8			;$B6F9A3
	LDY.w #$FC00				;$B6F9A5
CODE_B6F9A8:
	STY.w $17CA				;$B6F9A8
	LDA.w #$FC80				;$B6F9AB
	STA.w $17CC				;$B6F9AE
	LDA.b $1E,x				;$B6F9B1
	ASL					;$B6F9B3
	STA.w $17CE				;$B6F9B4
CODE_B6F9B7:
	RTL					;$B6F9B7

CODE_B6F9B8:
	TYX					;$B6F9B8
	LDA.w #$0001				;$B6F9B9
	STA.b $38,x				;$B6F9BC
	RTL					;$B6F9BE

CODE_B6F9BF:
	TYX					;$B6F9BF
	LDA.w #$0009				;$B6F9C0
	STA.b $38,x				;$B6F9C3
	RTL					;$B6F9C5

CODE_B6F9C6:
	TYX					;$B6F9C6
	LDA.b $2A,x				;$B6F9C7
	BEQ.b CODE_B6F9D8			;$B6F9C9
	EOR.b $1E,x				;$B6F9CB
	ASL					;$B6F9CD
	BPL.b CODE_B6F9D8			;$B6F9CE
	LDA.w #$0202				;$B6F9D0
	JSL.l set_sprite_animation		;$B6F9D3
	RTL					;$B6F9D7

CODE_B6F9D8:
	LDA.w #$0080				;$B6F9D8
	JMP.w CODE_B6F7B2			;$B6F9DB

CODE_B6F9DE:
	LDA.w #$0002				;$B6F9DE
CODE_B6F9E1:
	STA.w $0038,y				;$B6F9E1
	RTL					;$B6F9E4

CODE_B6F9E5:
	LDA.w #$0008				;$B6F9E5
	BRA.b CODE_B6F9E1			;$B6F9E8

CODE_B6F9EA:
	LDA.w #$000C				;$B6F9EA
	BRA.b CODE_B6F9E1			;$B6F9ED

CODE_B6F9EF:
	TYX					;$B6F9EF
	LDA.b $5C,x				;$B6F9F0
	BNE.b CODE_B6FA14			;$B6F9F2
	LDY.w #$0004				;$B6F9F4
	LDA.b $38,x				;$B6F9F7
	STY.b $38,x				;$B6F9F9
	CMP.w #$0007				;$B6F9FB
	BEQ.b CODE_B6FA15			;$B6F9FE
	LDA.w #$0014				;$B6FA00
	JSL.l CODE_B58006			;$B6FA03
	CLC					;$B6FA07
	ADC.w #$00B4				;$B6FA08
	STA.b $5C,x				;$B6FA0B
	LDA.w #$01C9				;$B6FA0D
	JSL.l set_sprite_animation		;$B6FA10
CODE_B6FA14:
	RTL					;$B6FA14

CODE_B6FA15:
	LDA.w #$01CB				;$B6FA15
	JSL.l set_sprite_animation		;$B6FA18
	RTL					;$B6FA1C

CODE_B6FA1D:
	TYX					;$B6FA1D
	LDA.w #$0007				;$B6FA1E
	STA.b $38,x				;$B6FA21
	RTL					;$B6FA23

CODE_B6FA24:
	TYX					;$B6FA24
	LDA.b $2A,x				;$B6FA25
	BEQ.b CODE_B6FA41			;$B6FA27
	EOR.b $1E,x				;$B6FA29
	ASL					;$B6FA2B
	BPL.b CODE_B6FA41			;$B6FA2C
	LDA.b $5C,x				;$B6FA2E
	STA.b alternate_sprite			;$B6FA30
	LDA.w #$0221				;$B6FA32
	JSL.l set_sprite_animation		;$B6FA35
	LDA.w #$0222				;$B6FA39
	JSL.l set_alt_sprite_animation		;$B6FA3C
	RTL					;$B6FA40

CODE_B6FA41:
	LDA.w #$0080				;$B6FA41
	JSL.l CODE_B6F7B4			;$B6FA44
	LDY.b $5C,x				;$B6FA48
	STA.w $0044,y				;$B6FA4A
	RTL					;$B6FA4D

CODE_B6FA4E:
	LDX.b current_sprite			;$B6FA4E
	LDY.b $5C,x				;$B6FA50
	TYX					;$B6FA52
	STZ.b $5C,x				;$B6FA53
	JSL.l delete_sprite_handle_deallocation	;$B6FA55
	RTL					;$B6FA59

CODE_B6FA5A:
	TYX					;$B6FA5A
	LDA.w #$000B				;$B6FA5B
	STA.b $38,x				;$B6FA5E
	RTL					;$B6FA60

CODE_B6FA61:
	TYX					;$B6FA61
	LDA.w #$0001				;$B6FA62
	STA.b $38,x				;$B6FA65
	RTL					;$B6FA67

CODE_B6FA68:
	TYX					;$B6FA68
	LDA.b $1E,x				;$B6FA69
	EOR.w #$4000				;$B6FA6B
	STA.b $1E,x				;$B6FA6E
	LDY.b $5C,x				;$B6FA70
	BEQ.b CODE_B6FA7D			;$B6FA72
	LDA.w $001E,y				;$B6FA74
	EOR.w #$4000				;$B6FA77
	STA.w $001E,y				;$B6FA7A
CODE_B6FA7D:
	RTL					;$B6FA7D

CODE_B6FA7E:
	LDA.w #$023C				;$B6FA7E
	JMP.w CODE_B6F8B2			;$B6FA81

CODE_B6FA84:
	LDA.w #$0080				;$B6FA84
	JMP.w CODE_B6F7B2			;$B6FA87

CODE_B6FA8A:
	LDA.w #$0080				;$B6FA8A
	JMP.w CODE_B6F7B2			;$B6FA8D

CODE_B6FA90:
	LDA.w #$0252				;$B6FA90
	JMP.w CODE_B6F8B2			;$B6FA93

CODE_B6FA96:
	TYX					;$B6FA96
	LDA.b $38,x				;$B6FA97
	CMP.w #$0008				;$B6FA99
	BEQ.b CODE_B6FAA4			;$B6FA9C
	LDA.w #$0254				;$B6FA9E
	JMP.w CODE_B6F8B2			;$B6FAA1

CODE_B6FAA4:
	LDA.b $5C,x				;$B6FAA4
	STA.b $66,x				;$B6FAA6
	LDY.w #$0257				;$B6FAA8
	LDA.b $60,x				;$B6FAAB
	EOR.b $30,x				;$B6FAAD
	BPL.b CODE_B6FAB4			;$B6FAAF
	LDY.w #$0256				;$B6FAB1
CODE_B6FAB4:
	TYA					;$B6FAB4
	JSL.l set_sprite_animation		;$B6FAB5
	LDX.b current_sprite			;$B6FAB9
	LDA.b $60,x				;$B6FABB
	STA.b $30,x				;$B6FABD
	STA.b $62,x				;$B6FABF
	LDA.w #$0006				;$B6FAC1
	STA.b $38,x				;$B6FAC4
	RTL					;$B6FAC6

CODE_B6FAC7:
	LDA.w #$0080				;$B6FAC7
	JMP.w CODE_B6F7B2			;$B6FACA

CODE_B6FACD:
	LDA.w #$0259				;$B6FACD
	JMP.w CODE_B6F8B2			;$B6FAD0

CODE_B6FAD3:
	LDA.w $0038,y				;$B6FAD3
	CMP.w #$0005				;$B6FAD6
	BNE.b CODE_B6FAE2			;$B6FAD9
	LDA.w #$0180				;$B6FADB
	STA.w $0044,y				;$B6FADE
	RTL					;$B6FAE1

CODE_B6FAE2:
	LDA.w #$0080				;$B6FAE2
	JMP.w CODE_B6F7B2			;$B6FAE5

CODE_B6FAE8:
	LDA.w $0044,y				;$B6FAE8
	CMP.w #$0300				;$B6FAEB
	BCC.b CODE_B6FAFE			;$B6FAEE
	LDA.w #$0263				;$B6FAF0
	JSL.l set_sprite_animation		;$B6FAF3
	LDX.b current_sprite			;$B6FAF7
	LDA.w #$0300				;$B6FAF9
	STA.b $44,x				;$B6FAFC
CODE_B6FAFE:
	RTL					;$B6FAFE

CODE_B6FAFF:
	LDA.w $0044,y				;$B6FAFF
	CMP.w #$0100				;$B6FB02
	BCS.b CODE_B6FB0E			;$B6FB05
	LDA.w #$0264				;$B6FB07
	JSL.l set_sprite_animation		;$B6FB0A
CODE_B6FB0E:
	RTL					;$B6FB0E

CODE_B6FB0F:
	LDA.b $6E				;$B6FB0F
	STA.w $005C,y				;$B6FB11
	LDA.w #$000A				;$B6FB14
	STA.b $1A				;$B6FB17
	LDA.w #$FFE2				;$B6FB19
	BRA.b CODE_B6FB4E			;$B6FB1C

CODE_B6FB1E:
	LDA.w #$000A				;$B6FB1E
	STA.b $1A				;$B6FB21
	LDA.w #$FFE2				;$B6FB23
	BRA.b CODE_B6FB4E			;$B6FB26

CODE_B6FB28:
	LDA.w #$000A				;$B6FB28
	STA.b $1A				;$B6FB2B
	LDA.w #$FFD8				;$B6FB2D
	BRA.b CODE_B6FB4E			;$B6FB30

CODE_B6FB32:
	LDA.w #$000A				;$B6FB32
	STA.b $1A				;$B6FB35
	LDA.w #$FFCE				;$B6FB37
	BRA.b CODE_B6FB4E			;$B6FB3A

CODE_B6FB3C:
	LDA.w #$0010				;$B6FB3C
	STA.b $1A				;$B6FB3F
	LDA.w #$FFCC				;$B6FB41
	BRA.b CODE_B6FB4E			;$B6FB44

CODE_B6FB46:
	LDA.w #$0005				;$B6FB46
	STA.b $1A				;$B6FB49
	LDA.w #$FFCD				;$B6FB4B
CODE_B6FB4E:
	LDX.b $5C,y				;$B6FB4E
	LDY.b $64,x				;$B6FB50
	TYX					;$B6FB52
	BIT.b $1E,x				;$B6FB53
	BVS.b CODE_B6FB61			;$B6FB55
	TAX					;$B6FB57
	LDA.b $1A				;$B6FB58
	EOR.w #$FFFF				;$B6FB5A
	INC					;$B6FB5D
	STA.b $1A				;$B6FB5E
	TXA					;$B6FB60
CODE_B6FB61:
	LDY.b current_sprite			;$B6FB61
	LDX.b $5C,y				;$B6FB63
	CLC					;$B6FB65
	ADC.b $16,x				;$B6FB66
	STA.w $0016,y				;$B6FB68
	LDA.b $12,x				;$B6FB6B
	CLC					;$B6FB6D
	ADC.b $1A				;$B6FB6E
	STA.w $0012,y				;$B6FB70
	RTL					;$B6FB73

CODE_B6FB74:
	LDA.w #$0080				;$B6FB74
	JMP.w CODE_B6F7B2			;$B6FB77

CODE_B6FB7A:
	LDA.w #$0100				;$B6FB7A
	JMP.w CODE_B6F7B2			;$B6FB7D

CODE_B6FB80:
	LDX.b $32,y				;$B6FB80
	LDA.b $38,x				;$B6FB82
	CMP.w #$000D				;$B6FB84
	BEQ.b CODE_B6FB90			;$B6FB87
	JSR.w CODE_B69C91			;$B6FB89
	CPY.b current_sprite			;$B6FB8C
	BNE.b CODE_B6FB97			;$B6FB8E
CODE_B6FB90:
	LDA.w #$0739				;$B6FB90
	JSL.l queue_sound_effect		;$B6FB93
CODE_B6FB97:
	RTL					;$B6FB97

CODE_B6FB98:
	LDA.w #$0100				;$B6FB98
	JMP.w CODE_B6F7B2			;$B6FB9B

CODE_B6FB9E:
	LDA.w #$00C0				;$B6FB9E
	JMP.w CODE_B6F7B2			;$B6FBA1

CODE_B6FBA4:
	LDA.w $002E,y				;$B6FBA4
	BEQ.b CODE_B6FBC6			;$B6FBA7
	BMI.b CODE_B6FBC6			;$B6FBA9
	ASL					;$B6FBAB
	STA.b $1A				;$B6FBAC
	ASL					;$B6FBAE
	CLC					;$B6FBAF
	ADC.b $1A				;$B6FBB0
	XBA					;$B6FBB2
	AND.w #$00FF				;$B6FBB3
	CLC					;$B6FBB6
	ADC.w $0016,y				;$B6FBB7
	CMP.w $0018,y				;$B6FBBA
	BCC.b CODE_B6FBC6			;$B6FBBD
	LDA.w #$027B				;$B6FBBF
	JSL.l set_sprite_animation		;$B6FBC2
CODE_B6FBC6:
	RTL					;$B6FBC6

CODE_B6FBC7:
	PHB					;$B6FBC7
	PHK					;$B6FBC8
	PLB					;$B6FBC9
	TYX					;$B6FBCA
	LDA.w #$0100				;$B6FBCB
	BIT.b $1E,x				;$B6FBCE
	BVS.b CODE_B6FBD5			;$B6FBD0
	LDA.w #$FF00				;$B6FBD2
CODE_B6FBD5:
	STA.b $2A,x				;$B6FBD5
	STZ.b $30,x				;$B6FBD7
	LDA.b $64,x				;$B6FBD9
	ASL					;$B6FBDB
	AND.w #$00FF				;$B6FBDC
	PHP					;$B6FBDF
	PHP					;$B6FBE0
	TAX					;$B6FBE1
	LDY.w DATA_B6FC4A,x			;$B6FBE2
	JSL.l CODE_BB8585			;$B6FBE5
	BCS.b CODE_B6FC43			;$B6FBE9
	LDY.b alternate_sprite			;$B6FBEB
	LDX.b current_sprite			;$B6FBED
	PLA					;$B6FBEF
	STA.w $006C,y				;$B6FBF0
	LDA.b $6A,x				;$B6FBF3
	STA.w $005E,y				;$B6FBF5
	LDA.b $12,x				;$B6FBF8
	CLC					;$B6FBFA
	ADC.w #$0024				;$B6FBFB
	BIT.b $1E,x				;$B6FBFE
	BVC.b CODE_B6FC06			;$B6FC00
	SEC					;$B6FC02
	SBC.w #$0048				;$B6FC03
CODE_B6FC06:
	STA.w $0012,y				;$B6FC06
	PHA					;$B6FC09
	LDA.b $68,x				;$B6FC0A
	STA.w $002A,y				;$B6FC0C
	PHA					;$B6FC0F
	BPL.b CODE_B6FC19			;$B6FC10
	LDA.b $64,x				;$B6FC12
	INC					;$B6FC14
	INC					;$B6FC15
	INC					;$B6FC16
	BRA.b CODE_B6FC1B			;$B6FC17

CODE_B6FC19:
	LDA.b $64,x				;$B6FC19
CODE_B6FC1B:
	AND.w #$00FF				;$B6FC1B
	ASL					;$B6FC1E
	TAY					;$B6FC1F
	LDA.w DATA_B6FC54,y			;$B6FC20
	JSL.l set_alt_sprite_animation		;$B6FC23
	LDY.w #$014E				;$B6FC27
	JSL.l CODE_BB8585			;$B6FC2A
	BCS.b CODE_B6FC46			;$B6FC2E
	LDY.b alternate_sprite			;$B6FC30
	PLA					;$B6FC32
	CMP.w #$8000				;$B6FC33
	PHP					;$B6FC36
	ROR					;$B6FC37
	PLP					;$B6FC38
	ROR					;$B6FC39
	STA.w $002A,y				;$B6FC3A
	PLA					;$B6FC3D
	STA.w $0012,y				;$B6FC3E
	PLB					;$B6FC41
	RTL					;$B6FC42

CODE_B6FC43:
	PLA					;$B6FC43
	PLB					;$B6FC44
	RTL					;$B6FC45

CODE_B6FC46:
	PLA					;$B6FC46
	PLA					;$B6FC47
	PLB					;$B6FC48
	RTL					;$B6FC49

DATA_B6FC4A:
	dw $0148
	dw $014A

DATA_B6FC4E:
	dw $014C
	dw $019A
	dw $019C

DATA_B6FC54:
	dw $0151
	dw $0167
	dw $0283
	dw $0229
	dw $0284
	dw $0285

CODE_B6FC60:
	JSL.l CODE_B6840E			;$B6FC60
	RTL					;$B6FC64

DATA_B6FC65:
	dw $0000
	dw $0000
	dw $0008

CODE_B6FC6B:
	PHB					;$B6FC6B
	PHK					;$B6FC6C
	PLB					;$B6FC6D
	TYX					;$B6FC6E
	JSR.w CODE_B6BD17			;$B6FC6F
	LDA.b $12,x				;$B6FC72
	SEC					;$B6FC74
	SBC.w #$0008				;$B6FC75
	STA.w $0012,y				;$B6FC78
	PHA					;$B6FC7B
	LDA.w $0016,y				;$B6FC7C
	SEC					;$B6FC7F
	SBC.w #$001E				;$B6FC80
	STA.w $0016,y				;$B6FC83
	PHA					;$B6FC86
	LDA.b $6A,x				;$B6FC87
	STA.w $005E,y				;$B6FC89
	LDA.b $68,x				;$B6FC8C
	STA.w $002E,y				;$B6FC8E
	PHA					;$B6FC91
	LDY.w #$0150				;$B6FC92
	JSL.l CODE_BB8585			;$B6FC95
	LDY.b alternate_sprite			;$B6FC99
	PLA					;$B6FC9B
	SEC					;$B6FC9C
	ROR					;$B6FC9D
	SEC					;$B6FC9E
	ROR					;$B6FC9F
	STA.w $002E,y				;$B6FCA0
	PLA					;$B6FCA3
	STA.w $0016,y				;$B6FCA4
	PLA					;$B6FCA7
	STA.w $0012,y				;$B6FCA8
	PLB					;$B6FCAB
	RTL					;$B6FCAC

CODE_B6FCAD:
	LDA.w $0044,y				;$B6FCAD
	CMP.w #$0140				;$B6FCB0
	BNE.b CODE_B6FCBF			;$B6FCB3
	TYX					;$B6FCB5
	INC.b $38,x				;$B6FCB6
	LDA.w #$028B				;$B6FCB8
	JSL.l set_sprite_animation		;$B6FCBB
CODE_B6FCBF:
	RTL					;$B6FCBF

CODE_B6FCC0:
	LDA.w $0044,y				;$B6FCC0
	CLC					;$B6FCC3
	ADC.w $006A,y				;$B6FCC4
	TAX					;$B6FCC7
	SEC					;$B6FCC8
	SBC.w $006C,y				;$B6FCC9
	EOR.w $006A,y				;$B6FCCC
	BMI.b CODE_B6FCD3			;$B6FCCF
	LDX.b $6C,y				;$B6FCD1
CODE_B6FCD3:
	STX.b $44,y				;$B6FCD3
	RTL					;$B6FCD5

CODE_B6FCD6:
	TYX					;$B6FCD6
	LDA.w #$0045				;$B6FCD7
	STA.b $5A,x				;$B6FCDA
	INC.b $38,x				;$B6FCDC
	RTL					;$B6FCDE

CODE_B6FCDF:
	LDA.w $0068,y				;$B6FCDF
	JSL.l set_sprite_animation		;$B6FCE2
	RTL					;$B6FCE6

CODE_B6FCE7:
	LDA.w $0030,y				;$B6FCE7
	BEQ.b CODE_B6FCF9			;$B6FCEA
	EOR.w $001E,y				;$B6FCEC
	ASL					;$B6FCEF
	BMI.b CODE_B6FCF9			;$B6FCF0
	LDA.w #$01B8				;$B6FCF2
	JSL.l set_sprite_animation		;$B6FCF5
CODE_B6FCF9:
	RTL					;$B6FCF9

CODE_B6FCFA:
	LDX.b $5C,y				;$B6FCFA
	LDA.b $38,x				;$B6FCFC
	CMP.w #$0002				;$B6FCFE
	BEQ.b CODE_B6FD1C			;$B6FD01
	LDA.b $30,x				;$B6FD03
	BPL.b CODE_B6FD0B			;$B6FD05
	EOR.w #$FFFF				;$B6FD07
	INC					;$B6FD0A
CODE_B6FD0B:
	STA.b $1A				;$B6FD0B
	LDA.b $2A,x				;$B6FD0D
	BIT.b $1E,x				;$B6FD0F
	BVC.b CODE_B6FD17			;$B6FD11
	EOR.w #$FFFF				;$B6FD13
	INC					;$B6FD16
CODE_B6FD17:
	CLC					;$B6FD17
	ADC.b $1A				;$B6FD18
	BRA.b CODE_B6FD2C			;$B6FD1A

CODE_B6FD1C:
	LDA.b $2A,x				;$B6FD1C
	BIT.b $1E,x				;$B6FD1E
	BVC.b CODE_B6FD26			;$B6FD20
	EOR.w #$FFFF				;$B6FD22
	INC					;$B6FD25
CODE_B6FD26:
	LDY.w #$000E				;$B6FD26
	CLC					;$B6FD29
	ADC.b [$6A],y				;$B6FD2A
CODE_B6FD2C:
	CLC					;$B6FD2C
	ADC.w #$0100				;$B6FD2D
	CMP.w #$04C0				;$B6FD30
	BCC.b CODE_B6FD38			;$B6FD33
	LDA.w #$04C0				;$B6FD35
CODE_B6FD38:
	LDX.b current_sprite			;$B6FD38
	STA.b $44,x				;$B6FD3A
	RTL					;$B6FD3C

CODE_B6FD3D:
	LDA.w $002E,y				;$B6FD3D
	BPL.b CODE_B6FD59			;$B6FD40
	LDA.w $005D,y				;$B6FD42
	AND.w #$00FF				;$B6FD45
	EOR.w #$FFFF				;$B6FD48
	SEC					;$B6FD4B
	ADC.w $0060,y				;$B6FD4C
	SEC					;$B6FD4F
	SBC.w $0016,y				;$B6FD50
	EOR.w $002E,y				;$B6FD53
	BMI.b CODE_B6FD6D			;$B6FD56
	RTL					;$B6FD58

CODE_B6FD59:
	LDA.w $005C,y				;$B6FD59
	AND.w #$00FF				;$B6FD5C
	DEC					;$B6FD5F
	CLC					;$B6FD60
	ADC.w $0060,y				;$B6FD61
	SEC					;$B6FD64
	SBC.w $0016,y				;$B6FD65
	EOR.w $002E,y				;$B6FD68
	BPL.b CODE_B6FD87			;$B6FD6B
CODE_B6FD6D:
	LDX.w #$01C3				;$B6FD6D
	LDA.w $002E,y				;$B6FD70
	EOR.w #$FFFF				;$B6FD73
	INC					;$B6FD76
	STA.w $002E,y				;$B6FD77
	BPL.b CODE_B6FD7F			;$B6FD7A
	LDX.w #$01C2				;$B6FD7C
CODE_B6FD7F:
	TXA					;$B6FD7F
	JSL.l set_sprite_animation		;$B6FD80
	JSR.w CODE_B68CE0			;$B6FD84
CODE_B6FD87:
	RTL					;$B6FD87

CODE_B6FD88:
	TYX					;$B6FD88
CODE_B6FD89:
	DEC.b $16,x				;$B6FD89
	RTL					;$B6FD8B

CODE_B6FD8C:
	TYX					;$B6FD8C
	DEC.b $16,x				;$B6FD8D
	BRA.b CODE_B6FD89			;$B6FD8F

CODE_B6FD91:
	TYX					;$B6FD91
CODE_B6FD92:
	INC.b $16,x				;$B6FD92
	RTL					;$B6FD94

CODE_B6FD95:
	TYX					;$B6FD95
	INC.b $16,x				;$B6FD96
	BRA.b CODE_B6FD92			;$B6FD98

CODE_B6FD9A:
	TYX					;$B6FD9A
	INC.b $62,x				;$B6FD9B
	LDA.b $62,x				;$B6FD9D
	ROR					;$B6FD9F
	ROR					;$B6FDA0
	ROR					;$B6FDA1
	BCC.b CODE_B6FDB2			;$B6FDA2
	LDA.w #$002C				;$B6FDA4
	JSL.l CODE_BFF006			;$B6FDA7
	LDA.w #$002D				;$B6FDAB
	JSL.l CODE_BFF006			;$B6FDAE
CODE_B6FDB2:
	RTL					;$B6FDB2

CODE_B6FDB3:
	INC.w $1B6E				;$B6FDB3
	LDA.w $1B6D				;$B6FDB6
	CMP.w #$0300				;$B6FDB9
	BNE.b CODE_B6FDC4			;$B6FDBC
	STZ.w $1B6D				;$B6FDBE
	LDA.w #$0000				;$B6FDC1
CODE_B6FDC4:
	CLC					;$B6FDC4
	ADC.w $0042,y				;$B6FDC5
	STA.w $0042,y				;$B6FDC8
	RTL					;$B6FDCB

CODE_B6FDCC:
	LDA.w #$0400				;$B6FDCC
	SEC					;$B6FDCF
	SBC.w $002E,y				;$B6FDD0
	BMI.b CODE_B6FDDA			;$B6FDD3
	CMP.w #$0100				;$B6FDD5
	BCS.b CODE_B6FDDD			;$B6FDD8
CODE_B6FDDA:
	LDA.w #$0100				;$B6FDDA
CODE_B6FDDD:
	STA.w $0044,y				;$B6FDDD
	RTL					;$B6FDE0

CODE_B6FDE1:
	LDA.w #$0001				;$B6FDE1
	STA.w $0038,y				;$B6FDE4
	JSL.l CODE_B6840E			;$B6FDE7
	RTL					;$B6FDEB

CODE_B6FDEC:
	TYX					;$B6FDEC
	LDA.w #$00D8				;$B6FDED
	STA.b $0E,x				;$B6FDF0
	LDA.w #$3000				;$B6FDF2
	JSR.w CODE_B6F23E			;$B6FDF5
	RTL					;$B6FDF8

CODE_B6FDF9:
	TYX					;$B6FDF9
	INC.b $60,x				;$B6FDFA
	LDA.w #$0840				;$B6FDFC
	STA.b $3A,x				;$B6FDFF
	RTL					;$B6FE01

CODE_B6FE02:
	TYX					;$B6FE02
	STZ.b $60,x				;$B6FE03
	STZ.b $3A,x				;$B6FE05
	RTL					;$B6FE07

CODE_B6FE08:
	TYX					;$B6FE08
	LDA.b $2A,x				;$B6FE09
	BEQ.b CODE_B6FE22			;$B6FE0B
	EOR.b $1E,x				;$B6FE0D
	ASL					;$B6FE0F
	BPL.b CODE_B6FE22			;$B6FE10
	LDA.b $30,x				;$B6FE12
	EOR.w #$FFFF				;$B6FE14
	INC					;$B6FE17
	STA.b $30,x				;$B6FE18
	LDA.w #$0218				;$B6FE1A
	JSL.l set_sprite_animation		;$B6FE1D
	RTL					;$B6FE21

CODE_B6FE22:
	LDA.w #$0080				;$B6FE22
	JMP.w CODE_B6F7B2			;$B6FE25

CODE_B6FE28:
	LDA.w $0024,y				;$B6FE28
	CMP.w $0066,y				;$B6FE2B
	BCS.b CODE_B6FE31			;$B6FE2E
	RTL					;$B6FE30

CODE_B6FE31:
	LDA.w $0038,y				;$B6FE31
	CMP.w #$0009				;$B6FE34
	BEQ.b CODE_B6FE40			;$B6FE37
	LDA.w #$000B				;$B6FE39
	STA.w $0038,y				;$B6FE3C
	RTL					;$B6FE3F

CODE_B6FE40:
	TYX					;$B6FE40
	STZ.b $40,x				;$B6FE41
	STZ.b $48,x				;$B6FE43
	RTL					;$B6FE45

CODE_B6FE46:
	TYX					;$B6FE46
	LDA.b $4C,x				;$B6FE47
	STA.b $42				;$B6FE49
	LDA.b $6C				;$B6FE4B
	STA.b $44				;$B6FE4D
	LDY.w #$0000				;$B6FE4F
CODE_B6FE52:
	LDA.b [$42],y				;$B6FE52
	BEQ.b CODE_B6FE82			;$B6FE54
	CMP.b $12,x				;$B6FE56
	BCS.b CODE_B6FE7C			;$B6FE58
	ADC.w #$0090				;$B6FE5A
	CMP.b $12,x				;$B6FE5D
	BCC.b CODE_B6FE7C			;$B6FE5F
	INY					;$B6FE61
	INY					;$B6FE62
	LDA.b [$42],y				;$B6FE63
	CMP.b $16,x				;$B6FE65
	BCS.b CODE_B6FE7E			;$B6FE67
	ADC.w #$0050				;$B6FE69
	CMP.b $16,x				;$B6FE6C
	BCC.b CODE_B6FE7E			;$B6FE6E
	JSL.l delete_sprite_handle_deallocation	;$B6FE70
	LDY.w #$0296				;$B6FE74
	JSL.l CODE_BB8585			;$B6FE77
	RTL					;$B6FE7B

CODE_B6FE7C:
	INY					;$B6FE7C
	INY					;$B6FE7D
CODE_B6FE7E:
	INY					;$B6FE7E
	INY					;$B6FE7F
	BRA.b CODE_B6FE52			;$B6FE80

CODE_B6FE82:
	RTL					;$B6FE82

CODE_B6FE83:
	LDA.w #$026E				;$B6FE83
	LDX.b $38,y				;$B6FE86
	CPX.w #$0002				;$B6FE88
	BNE.b CODE_B6FE90			;$B6FE8B
	LDA.w #$0271				;$B6FE8D
CODE_B6FE90:
	JSL.l set_sprite_animation		;$B6FE90
	RTL					;$B6FE94

CODE_B6FE95:
	TYX					;$B6FE95
	LDA.w #$0663				;$B6FE96
	DEC.b $64,x				;$B6FE99
	BMI.b CODE_B6FEA6			;$B6FE9B
	BNE.b CODE_B6FEA2			;$B6FE9D
	LDA.w #$066D				;$B6FE9F
CODE_B6FEA2:
	JSL.l queue_sound_effect		;$B6FEA2
CODE_B6FEA6:
	RTL					;$B6FEA6

CODE_B6FEA7:
	LDX.w $1BCD				;$B6FEA7
	BNE.b CODE_B6FEB3			;$B6FEAA
	LDA.w #$0039				;$B6FEAC
	JSL.l CODE_BFF006			;$B6FEAF
CODE_B6FEB3:
	RTL					;$B6FEB3

CODE_B6FEB4:
	TYX					;$B6FEB4
	STZ.b $4C,x				;$B6FEB5
	RTL					;$B6FEB7

UNK_B6FEB8:
	db $6E,$02
	
ADDR_B6FEBA:
	LDX.b $38,y				;$B6FEB8
	CPX.w #$0002				;$B6FEBA
	BNE.b ADDR_B6FEC4			;$B6FEBD
	LDA.w #$0271				;$B6FEBF
ADDR_B6FEC4:
	JSL.l set_sprite_animation		;$B6FEC2
	RTL					;$B6FEC6

ADDR_B6FEC9:
	TYX					;$B6FEC7
	LDA.w #$0663				;$B6FEC8
	DEC.b $64,x				;$B6FECB
	BMI.b ADDR_B6FEDA			;$B6FECD
	BNE.b ADDR_B6FED6			;$B6FECF
	LDA.w #$066D				;$B6FED1
ADDR_B6FED6:
	JSL.l queue_sound_effect		;$B6FED4
ADDR_B6FEDA:
	RTL					;$B6FED8

ADDR_B6FEDB:
	LDX.w $1BCD				;$B6FED9
	BNE.b ADDR_B6FEE7			;$B6FEDC
	LDA.w #$0039				;$B6FEDE
	JSL.l CODE_BFF006			;$B6FEE1
ADDR_B6FEE7:
	RTL					;$B6FEE5

ADDR_B6FEE8:
	TYX					;$B6FEE6
	STZ.b $4C,x				;$B6FEE7
	RTL					;$B6FEE9

UNK_B6FEEC:
	db $06,$F0,$BF,$6B,$BB,$74,$4C,$6B,$30

ADDR_B6FEF5:
	LDA.w #$0218				;$B6FEEA
	JSL.l set_sprite_animation		;$B6FEED
	RTL					;$B6FEF1

ADDR_B6FEFD:
	LDA.w #$0080				;$B6FEF2
	JMP.w CODE_B6F891			;$B6FEF5

ADDR_B6FF03:
	LDA.w $0024,y				;$B6FEF8
	CMP.w $0066,y				;$B6FEFB
	BCS.b ADDR_B6FF0C			;$B6FEFE
	RTL					;$B6FF00

ADDR_B6FF0C:
	LDA.w $0038,y				;$B6FF01
	CMP.w #$0009				;$B6FF04
	BEQ.b ADDR_B6FF1B			;$B6FF07
	LDA.w #$000B				;$B6FF09
	STA.w $0038,y				;$B6FF0C
	RTL					;$B6FF0F

ADDR_B6FF1B:
	TYX					;$B6FF10
	STZ.b $40,x				;$B6FF11
	STZ.b $48,x				;$B6FF13
	RTL					;$B6FF15

ADDR_B6FF21:
	TYX					;$B6FF16
	LDA.b $4C,x				;$B6FF17
	STA.b $42				;$B6FF19
	LDA.b $6C				;$B6FF1B
	STA.b $44				;$B6FF1D
	LDY.w #$0000				;$B6FF1F
ADDR_B6FF2D:
	LDA.b [$42],y				;$B6FF22
	BEQ.b ADDR_B6FF5D			;$B6FF24
	CMP.b $12,x				;$B6FF26
	BCS.b ADDR_B6FF57			;$B6FF28
	ADC.w #$0090				;$B6FF2A
	CMP.b $12,x				;$B6FF2D
	BCC.b ADDR_B6FF57			;$B6FF2F
	INY					;$B6FF31
	INY					;$B6FF32
	LDA.b [$42],y				;$B6FF33
	CMP.b $16,x				;$B6FF35
	BCS.b ADDR_B6FF59			;$B6FF37
	ADC.w #$0050				;$B6FF39
	CMP.b $16,x				;$B6FF3C
	BCC.b ADDR_B6FF59			;$B6FF3E
	JSL.l delete_sprite_no_deallocation+$01	;$B6FF40 \
	LDY.w #$0296				;$B6FF44  | These jump into the middle of an opcode!
	JSL.l CODE_BB8588+$01			;$B6FF47 /
	RTL					;$B6FF4B

ADDR_B6FF57:
	INY					;$B6FF4C
	INY					;$B6FF4D
ADDR_B6FF59:
	INY					;$B6FF4E
	INY					;$B6FF4F
	BRA.b ADDR_B6FF2D			;$B6FF50

ADDR_B6FF5D:
	RTL					;$B6FF52

ADDR_B6FF5E:
	LDA.w #$026E				;$B6FF53
	LDX.b $38,y				;$B6FF56
	CPX.w #$0002				;$B6FF58
	BNE.b ADDR_B6FF6B			;$B6FF5B
	LDA.w #$0271				;$B6FF5D
ADDR_B6FF6B:
	JSL.l set_sprite_animation		;$B6FF60
	RTL					;$B6FF64

ADDR_B6FF70:
	TYX					;$B6FF65
	LDA.w #$0663				;$B6FF66
	DEC.b $64,x				;$B6FF69
	BMI.b ADDR_B6FF81			;$B6FF6B
	BNE.b ADDR_B6FF7D			;$B6FF6D
	LDA.w #$066D				;$B6FF6F
ADDR_B6FF7D:
	JSL.l queue_sound_effect		;$B6FF72
ADDR_B6FF81:
	RTL					;$B6FF76

ADDR_B6FF82:
	LDX.w $1BCD				;$B6FF77
	BNE.b ADDR_B6FF8E			;$B6FF7A
	LDA.w #$0039				;$B6FF7C
	JSL.l CODE_BFF006			;$B6FF7F
ADDR_B6FF8E:
	RTL					;$B6FF83

ADDR_B6FF8F:
	TYX					;$B6FF84
	STZ.b $4C,x				;$B6FF85
	RTL					;$B6FF87
