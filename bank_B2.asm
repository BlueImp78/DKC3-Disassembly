upload_spc_engine:
	JMP .upload_spc_engine_wrapper		;$B28000

#CODE_B28003:
	JMP .queue_song				;$B28003

#CODE_B28006:
	JMP .play_queued_song			;$B28006

#play_song:
	JMP .play_song				;$B28009

#CODE_B2800C:
	JMP .play_song_with_transition		;$B2800C

#CODE_B2800F:
	JMP .transition_song			;$B2800F

#queue_sound_effect:
	JMP .queue_sound_effect			;$B28012

#CODE_B28015:
	JMP .play_queued_sound_effect		;$B28015

#CODE_B28018:
	JMP .play_high_priority_sound		;$B28018

#CODE_B2801B:
	JMP .CODE_B28172			;$B2801B

#CODE_B2801E:
	JMP .reset_var_pitch_loop_sound		;$B2801E

#CODE_B28021:
	JMP .set_var_pitch_loop_sound		;$B28021

#CODE_B28024:
	JMP .CODE_B2814E			;$B28024

#CODE_B28027:
	JMP .CODE_B281FB			;$B28027

#CODE_B2802A:
	JMP .clear_sound_buffers		;$B2802A

.upload_spc_engine_wrapper:
	PHB					;$B2802D
	PHK					;$B2802E
	PLB					;$B2802F
	JSR .upload_spc_base_engine		;$B28030
	JSR .upload_spc_sound_engine		;$B28033
	JSR .upload_global_samples		;$B28036
	LDA #DATA_F1B663			;$B28039
	STA $1A					;$B2803C
	LDA.w #DATA_F1B663>>16			;$B2803E
	STA $1C					;$B28041
	JSR .upload_inline_spc_block		;$B28043
	JSR .execute_spc_sound_engine		;$B28046
	PLB					;$B28049
	RTL					;$B2804A

.queue_song:
	PHB					;$B2804B
	PHK					;$B2804C
	PLB					;$B2804D
	STA current_song			;$B2804E
	LDX #$00FF				;$B28050
	JSR .write_spc_command_x		;$B28053
	JSR .upload_song_sample_set		;$B28056
	JSR .upload_song_data			;$B28059
	JSR .upload_song_sound_effects		;$B2805C
	JSR .execute_spc_sound_engine		;$B2805F
	PLB					;$B28062
	RTL					;$B28063

.play_queued_song:
	PHB					;$B28064
	PHK					;$B28065
	PLB					;$B28066
	JSL .clear_sound_buffers		;$B28067
	LDX #$00FE				;$B2806B
	JSR .write_spc_command_x		;$B2806E
	LDA stereo_select			;$B28071
	XBA					;$B28074
	ORA #$00FA				;$B28075
	JSR .write_spc_command_a		;$B28078
	PLB					;$B2807B
	RTL					;$B2807C

.play_song:
	PHB					;$B2807D
	PHK					;$B2807E
	PLB					;$B2807F
	STA current_song			;$B28080
	LDX #$00FF				;$B28082
	JSR .write_spc_command_x		;$B28085
	JSR .upload_song_sample_set		;$B28088
	JSR .upload_song_data			;$B2808B
	JSR .upload_song_sound_effects		;$B2808E
	JSR .execute_spc_sound_engine		;$B28091
	JSL .clear_sound_buffers		;$B28094
	LDX #$00FE				;$B28098
	JSR .write_spc_command_x		;$B2809B
	LDA stereo_select			;$B2809E
	XBA					;$B280A1
	ORA #$00FA				;$B280A2
	JSR .write_spc_command_a		;$B280A5
	PLB					;$B280A8
	RTL					;$B280A9

.play_song_with_transition:
	PHB					;$B280AA
	PHK					;$B280AB
	PLB					;$B280AC
	PHA					;$B280AD
	AND #$00FF				;$B280AE
	STA current_song			;$B280B1
	LDX #$00FF				;$B280B3
	JSR .write_spc_command_x		;$B280B6
	JSR .upload_song_sample_set		;$B280B9
	JSR .upload_song_data			;$B280BC
	JSR .upload_song_sound_effects		;$B280BF
	JSR .execute_spc_sound_engine		;$B280C2
	JSL .clear_sound_buffers		;$B280C5
	PLA					;$B280C9
	AND #$FF00				;$B280CA
	ORA #$00FB				;$B280CD
	JSR .write_spc_command_a		;$B280D0
	LDX #$00FE				;$B280D3
	JSR .write_spc_command_x		;$B280D6
	LDA stereo_select			;$B280D9
	XBA					;$B280DC
	ORA #$00FA				;$B280DD
	JSR .write_spc_command_a		;$B280E0
	PLB					;$B280E3
	RTL					;$B280E4

.transition_song:
	PHB					;$B280E5
	PHK					;$B280E6
	PLB					;$B280E7
	XBA					;$B280E8
	AND #$FF00				;$B280E9
	ORA #$00FB				;$B280EC
	JSR .write_spc_command_a		;$B280EF
	LDX #$00FE				;$B280F2
	JSR .write_spc_command_x		;$B280F5
	LDA stereo_select			;$B280F8
	XBA					;$B280FB
	ORA #$00FA				;$B280FC
	JSR .write_spc_command_a		;$B280FF
	PLB					;$B28102
	RTL					;$B28103

.clear_sound_buffers:
	LDX #$0007				;$B28104
.clear_buffer_entry:
	STZ $0439,x				;$B28107
	STZ $0441,x				;$B2810A
	STZ $0420,x				;$B2810D
	DEX					;$B28110
	DEX					;$B28111
	BPL .clear_buffer_entry			;$B28112
	STZ $0430				;$B28114
	STZ $0436				;$B28117
	STZ $0438				;$B2811A
	LDA #$0002				;$B2811D
	STA $0434				;$B28120
	RTL					;$B28123

.queue_sound_effect:
	PHB					;$B28124
	PHX					;$B28125
	PHY					;$B28126
	PHK					;$B28127
	PLB					;$B28128
	BIT $044A				;$B28129
	BMI ..return				;$B2812C
	LDX $0436				;$B2812E
	CMP $043A,x				;$B28131
	BEQ ..return				;$B28134
	TAY					;$B28136
	INX					;$B28137
	INX					;$B28138
	TXA					;$B28139
	AND #$000E				;$B2813A
	TAX					;$B2813D
	LDA $043A,x				;$B2813E
	BNE ..return				;$B28141
	TYA					;$B28143
	STA $043A,x				;$B28144
	STX $0436				;$B28147
..return:
	PLY					;$B2814A
	PLX					;$B2814B
	PLB					;$B2814C
	RTL					;$B2814D

.CODE_B2814E:
	PHB					;$B2814E
	PHK					;$B2814F
	PLB					;$B28150
	BIT $044A				;$B28151
	BMI ..return				;$B28154
	PHX					;$B28156
	PHY					;$B28157
	SEP #$30				;$B28158
	XBA					;$B2815A
	AND.b #$07				;$B2815B
	TAX					;$B2815D
	XBA					;$B2815E
	LDY $0428,x				;$B2815F
	BEQ ..CODE_B28169			;$B28162
	CMP $0420,x				;$B28164
	BNE ..CODE_B2816C			;$B28167
..CODE_B28169:
	STA $0428,x				;$B28169
..CODE_B2816C:
	REP #$30				;$B2816C
	PLY					;$B2816E
	PLX					;$B2816F
..return:
	PLB					;$B28170
	RTL					;$B28171

;High priority mute others?
.CODE_B28172:
	SEP #$30				;$B28172
	XBA					;$B28174
	AND #$0F				;$B28175
	TAX					;$B28177
	XBA					;$B28178
	STA $0420,x				;$B28179
	BEQ .CODE_B28186			;$B2817C
	LDA .index_to_bit,x			;$B2817E
	TSB $0430				;$B28181
	BRA .CODE_B2818C			;$B28184

.CODE_B28186:
	LDA .index_to_bit,x			;$B28186
	TRB $0430				;$B28189
.CODE_B2818C:
	LDA $0420,x				;$B2818C
	REP #$30				;$B2818F
	TAX					;$B28191
	JSR .write_spc_command_x		;$B28192
	RTL					;$B28195

.play_queued_sound_effect:
	PHB					;$B28196
	PHK					;$B28197
	PLB					;$B28198
	LDA active_frame_counter		;$B28199
	CMP $0438				;$B2819B
	BEQ .CODE_B281C1			;$B2819E
	LDX $0434				;$B281A0
	LDA $043A,x				;$B281A3
	BEQ .CODE_B281C1			;$B281A6
	STZ $043A,x				;$B281A8
	JSL .play_high_priority_sound		;$B281AB
	LDA $0434				;$B281AF
	INC					;$B281B2
	INC					;$B281B3
	AND #$000E				;$B281B4
	STA $0434				;$B281B7
	LDA active_frame_counter		;$B281BA
	STA $0438				;$B281BC
	PLB					;$B281BF
	RTL					;$B281C0

.CODE_B281C1:
	SEP #$20				;$B281C1
	LDX #$0007				;$B281C3
.next_slot:
	LDA $0428,x				;$B281C6
	CMP $0420,x				;$B281C9
	BNE .CODE_B281D5			;$B281CC
	DEX					;$B281CE
	BPL .next_slot				;$B281CF
	REP #$20				;$B281D1
	PLB					;$B281D3
	RTL					;$B281D4

.CODE_B281D5:
	STA $0420,x				;$B281D5
	TAY					;$B281D8
	BEQ .reset_channel			;$B281D9
	LDA .index_to_bit,x			;$B281DB
	TSB $0430				;$B281DE
	BRA .write_sound			;$B281E1

.reset_channel:
	LDA .index_to_bit,x			;$B281E3
	TRB $0430				;$B281E6
.write_sound:
	TXA					;$B281E9
	XBA					;$B281EA
	TYA					;$B281EB
	REP #$20				;$B281EC
	JSR .write_spc_command_a		;$B281EE
	PLB					;$B281F1
	RTL					;$B281F2

.index_to_bit:
	db $01, $02, $04, $08, $10, $20, $40, $80

.CODE_B281FB:
	PHB					;$B281FB
	PHY					;$B281FC
	PHX					;$B281FD
	PHK					;$B281FE
	PLB					;$B281FF
	JSR .write_spc_command_a		;$B28200
	PLX					;$B28203
	PLY					;$B28204
	PLB					;$B28205
	RTL					;$B28206

.play_high_priority_sound:
	PHB					;$B28207
	PHY					;$B28208
	PHX					;$B28209
	PHK					;$B2820A
	PLB					;$B2820B
	BIT $044A				;$B2820C
	BMI .CODE_B28231			;$B2820F
	SEP #$30				;$B28211
	XBA					;$B28213
	TAX					;$B28214
	LDA $0430				;$B28215
	BIT .index_to_bit,x			;$B28218
	BNE .CODE_B28228			;$B2821B
.CODE_B2821D:
	TXA					;$B2821D
	XBA					;$B2821E
	REP #$30				;$B2821F
	JSR .write_spc_command_a		;$B28221
	PLX					;$B28224
	PLY					;$B28225
	PLB					;$B28226
	RTL					;$B28227

.CODE_B28228:
	LDX #$04				;$B28228
	BIT .index_to_bit,x			;$B2822A
	BEQ .CODE_B2821D			;$B2822D
	REP #$30				;$B2822F
.CODE_B28231:
	PLX					;$B28231
	PLY					;$B28232
	PLB					;$B28233
	RTL					;$B28234

.set_var_pitch_loop_sound:
	PHB					;$B28235
	PHK					;$B28236
	PLB					;$B28237
	BIT $044A				;$B28238
	BMI ..return				;$B2823B
	AND #$00FF				;$B2823D
	XBA					;$B28240
	ORA #$00FC				;$B28241
	JSR .write_spc_command_a		;$B28244
..return:
	PLB					;$B28247
	RTL					;$B28248

;Stop variable pitch loop sound effect
.reset_var_pitch_loop_sound:
	PHB					;$B28249
	PHK					;$B2824A
	PLB					;$B2824B
	BIT $044A				;$B2824C
	BMI ..return				;$B2824F
	AND #$00FF				;$B28251
	XBA					;$B28254
	ORA #$00FD				;$B28255
	JSR .write_spc_command_a		;$B28258
..return:
	PLB					;$B2825B
	RTL					;$B2825C

.write_spc_command_x:
	TXA					;$B2825D
.write_spc_command_a:
	SEP #$10				;$B2825E
	LDX $06					;$B28260
..wait_for_echo:
	CPX APU.IO1				;$B28262
	BNE ..wait_for_echo			;$B28265
	STA APU.IO2				;$B28267
	INX					;$B2826A
	STX APU.IO1				;$B2826B
	STX $06					;$B2826E
	REP #$10				;$B28270
	RTS					;$B28272

.upload_spc_base_engine:
	SEP #$10				;$B28273
	LDA #$BBAA				;$B28275
-
	CMP APU.IO1				;$B28278
	BNE -					;$B2827B
	LDA #$04D8				;$B2827D
	STA APU.IO3				;$B28280
	LDA #$01CC				;$B28283
	STA APU.IO1				;$B28286
	TAX					;$B28289
-
	CPX APU.IO1				;$B2828A
	BNE -					;$B2828D
	LDX #$00				;$B2828F
.next_byte:
	LDA.l DATA_ED0000,x			;$B28291
	TAY					;$B28295
	STY APU.IO2				;$B28296
	STX APU.IO1				;$B28299
-
	CPX APU.IO1				;$B2829C
	BNE -					;$B2829F
	INX					;$B282A1
	CPX #$88				;$B282A2
	BNE .next_byte				;$B282A4
	INX					;$B282A6
	TXA					;$B282A7
	STA APU.IO1				;$B282A8
-
	CPX APU.IO1				;$B282AB
	BNE -					;$B282AE
	STZ spc_transaction			;$B282B0
	REP #$10				;$B282B2
	RTS					;$B282B4

.upload_song_data:
	LDA current_song			;$B282B5
	ASL					;$B282B7
	ASL					;$B282B8
	ASL					;$B282B9
	ADC current_song			;$B282BA
	TAX					;$B282BC
	LDA.l DATA_ED0D86,x			;$B282BD
	STA $1A					;$B282C1
	LDA.l DATA_ED0D86+$02,x			;$B282C3
	STA $1C					;$B282C7
	JSR .upload_inline_spc_block		;$B282C9
	RTS					;$B282CC

.upload_song_sound_effects:
	LDA current_song			;$B282CD
	ASL					;$B282CF
	ASL					;$B282D0
	ASL					;$B282D1
	ADC current_song			;$B282D2
	TAX					;$B282D4
	LDA.l DATA_ED0D86+$06,x			;$B282D5
	STA $1A					;$B282D9
	LDA.l DATA_ED0D86+$08,x			;$B282DB
	STA $1C					;$B282DF
	JSR .upload_inline_spc_block		;$B282E1
	RTS					;$B282E4

.upload_spc_sound_engine:
	LDA #DATA_ED0088			;$B282E5
	STA $1A					;$B282E8
	LDA.w #DATA_ED0088>>16			;$B282EA
	STA $1C					;$B282ED
	LDA #$0560				;$B282EF
	STA $1D					;$B282F2
	LDA #$067F				;$B282F4
	STA $1F					;$B282F7
	JSR .upload_spc_block			;$B282F9
	RTS					;$B282FC

.upload_global_samples:
	LDA #DATA_ED0F36			;$B282FD
	STA $0A					;$B28300
	LDA.w #DATA_ED0F36>>16			;$B28302
	STA $0C					;$B28305
	LDA #$3100				;$B28307
	STA $12					;$B2830A
	STZ $16					;$B2830C
	LDA #$3400				;$B2830E
	STA $0E					;$B28311
	STZ $16					;$B28313
	JSR .sample_uploader			;$B28315
	LDA $12					;$B28318
	STA $14					;$B2831A
	LDA $0E					;$B2831C
	STA $10					;$B2831E
	LDA $16					;$B28320
	STA $18					;$B28322
	RTS					;$B28324

.upload_song_sample_set:
	LDA current_song			;$B28325
	ASL					;$B28327
	ASL					;$B28328
	ASL					;$B28329
	ADC current_song			;$B2832A
	TAX					;$B2832C
	LDA.l DATA_ED0D86+$03,x			;$B2832D
	STA $0A					;$B28331
	LDA.l DATA_ED0D86+$05,x			;$B28333
	STA $0C					;$B28337
	LDA $14					;$B28339
	STA $12					;$B2833B
	LDA $10					;$B2833D
	STA $0E					;$B2833F
	LDA $18					;$B28341
	STA $16					;$B28343
	JSR .sample_uploader			;$B28345
	RTS					;$B28348

.sample_uploader:
	STZ $16					;$B28349
	LDA $16					;$B2834B
	STA $22					;$B2834D
	LDA $0A					;$B2834F
	STA $26					;$B28351
	LDA $0C					;$B28353
	STA $28					;$B28355
	LDA $12					;$B28357
	STA $2A					;$B28359
	LDA $0E					;$B2835B
	STA $2C					;$B2835D
	LDX #$0000				;$B2835F
	STZ $24					;$B28362
.parse_next_sample:
	LDY $24					;$B28364
	LDA [$26],y				;$B28366
	CMP #$FFFF				;$B28368
	BEQ .upload_sample_directory		;$B2836B
	ASL					;$B2836D
	ADC [$26],y				;$B2836E
	TXY					;$B28370
	TAX					;$B28371
	LDA.l DATA_EE078A,x			;$B28372
	STA $1A					;$B28376
	LDA.l DATA_EE078A+$02,x			;$B28378
	STA $1C					;$B2837C
	TYX					;$B2837E
	LDA $0E					;$B2837F
	STA $7E2000,x				;$B28381
	CLC					;$B28385
	ADC [$1A]				;$B28386
	STA $7E2002,x				;$B28388
	LDY #$0002				;$B2838C
	LDA $0E					;$B2838F
	CLC					;$B28391
	ADC [$1A],y				;$B28392
	STA $0E					;$B28394
	INX					;$B28396
	INX					;$B28397
	INX					;$B28398
	INX					;$B28399
	INC $24					;$B2839A
	INC $24					;$B2839C
	BRA .parse_next_sample			;$B2839E

.upload_sample_directory:
	TXA					;$B283A0
	CLC					;$B283A1
	ADC $12					;$B283A2
	STA $12					;$B283A4
	LDA #$2000				;$B283A6
	STA $1A					;$B283A9
	LDA #$007E				;$B283AB
	STA $1C					;$B283AE
	LDA $2A					;$B283B0
	STA $1D					;$B283B2
	LDA #$3400				;$B283B4
	SEC					;$B283B7
	SBC $2A					;$B283B8
	CLC					;$B283BA
	INC					;$B283BB
	LSR					;$B283BC
	STA $1F					;$B283BD
	JSR .upload_spc_block			;$B283BF
	LDY #$0000				;$B283C2
	LDA #DATA_ED0F36			;$B283C5
	STA $26					;$B283C8
	LDA.w #DATA_ED0F36>>16			;$B283CA
	STA $28					;$B283CD
	CMP $0C					;$B283CF
	BNE .CODE_B283DA			;$B283D1
	LDA #$0F36				;$B283D3
	CMP $0A					;$B283D6
	BEQ .upload_samples			;$B283D8
.CODE_B283DA:
	LDA [$26],y				;$B283DA
	CMP #$FFFF				;$B283DC
	BEQ .CODE_B283F2			;$B283DF
	TAX					;$B283E1
	SEP #$20				;$B283E2
	LDA $16					;$B283E4
	STA $7E2000,x				;$B283E6
	INC $16					;$B283EA
	REP #$20				;$B283EC
	INY					;$B283EE
	INY					;$B283EF
	BRA .CODE_B283DA			;$B283F0

.CODE_B283F2:
	LDY #$0000				;$B283F2
	LDA $0A					;$B283F5
	STA $26					;$B283F7
	LDA $0C					;$B283F9
	STA $28					;$B283FB
.CODE_B283FD:
	LDA [$26],y				;$B283FD
	CMP #$FFFF				;$B283FF
	BEQ .CODE_B28415			;$B28402
	TAX					;$B28404
	SEP #$20				;$B28405
	LDA $16					;$B28407
	STA $7E2000,x				;$B28409
	INC $16					;$B2840D
	REP #$20				;$B2840F
	INY					;$B28411
	INY					;$B28412
	BRA .CODE_B283FD			;$B28413

.CODE_B28415:
	LDA #$2000				;$B28415
	STA $1A					;$B28418
	LDA #$007E				;$B2841A
	STA $1C					;$B2841D
	LDA #$0560				;$B2841F
	STA $1D					;$B28422
	LDA #$0080				;$B28424
	STA $1F					;$B28427
	JSR .upload_spc_block			;$B28429
.upload_samples:
	LDA $2C					;$B2842C
	STA $0E					;$B2842E
	STZ $24					;$B28430
.map_global_sample:
	LDY $24					;$B28432
	LDA [$0A],y				;$B28434
	CMP #$FFFF				;$B28436
	BEQ ..return				;$B28439
	ASL					;$B2843B
	ADC [$0A],y				;$B2843C
	TAX					;$B2843E
	LDA.l DATA_EE078A,x			;$B2843F
	INC					;$B28443
	INC					;$B28444
	STA $1A					;$B28445
	LDA.l DATA_EE078A+$02,x			;$B28447
	STA $1C					;$B2844B
	LDA $0E					;$B2844D
	STA $1D					;$B2844F
	LDA [$1A]				;$B28451
	STA $1F					;$B28453
	CLC					;$B28455
	ADC $1D					;$B28456
	STA $0E					;$B28458
	INC $1F					;$B2845A
	LSR $1F					;$B2845C
	INC $1A					;$B2845E
	INC $1A					;$B28460
	JSR .upload_spc_block			;$B28462
	INC $24					;$B28465
	INC $24					;$B28467
	BRA .map_global_sample			;$B28469

..return:
	RTS					;$B2846B

.upload_inline_spc_block:
	LDA [$1A]				;$B2846C
	STA $1D					;$B2846E
	INC $1A					;$B28470
	INC $1A					;$B28472
	LDA [$1A]				;$B28474
	STA $1F					;$B28476
	INC $1A					;$B28478
	INC $1A					;$B2847A
	BRA .upload_spc_block			;$B2847C

.execute_spc_sound_engine:
	LDA #$0672				;$B2847E
	STA $1D					;$B28481
	STZ $1F					;$B28483
.upload_spc_block:
	SEP #$10				;$B28485
	LDX $06					;$B28487
-
	CPX APU.IO1				;$B28489
	BNE -					;$B2848C
	LDA $1D					;$B2848E
	STA APU.IO2				;$B28490
	INX					;$B28493
	STX APU.IO1				;$B28494
	LDA $1F					;$B28497
	STA $21					;$B28499
-
	CPX APU.IO1				;$B2849B
	BNE -					;$B2849E
	STA APU.IO2				;$B284A0
	INX					;$B284A3
	STX APU.IO1				;$B284A4
	LDA $1F					;$B284A7
	BEQ .return				;$B284A9
	LDY #$00				;$B284AB
..next_byte:
	LDA [$1A],y				;$B284AD
	INY					;$B284AF
	INY					;$B284B0
	BNE ..wait_for_echo			;$B284B1
	INC $1B					;$B284B3
..wait_for_echo:
	CPX APU.IO1				;$B284B5
	BNE ..wait_for_echo			;$B284B8
	INX					;$B284BA
	STA APU.IO2				;$B284BB
	STX APU.IO1				;$B284BE
	DEC $1F					;$B284C1
	BNE ..next_byte				;$B284C3
.return:
	STX $06					;$B284C5
	REP #$10				;$B284C7
	LDA $21					;$B284C9
	ASL					;$B284CB
	RTS					;$B284CC

CODE_B284CD:
	JMP CODE_B29816				;$B284CD

CODE_B284D0:
	JMP CODE_B29952				;$B284D0

CODE_B284D3:
	JMP CODE_B29BCA				;$B284D3

CODE_B284D6:
	PHK					;$B284D6
	PLB					;$B284D7
	JSL disable_screen_wrapper		;$B284D8
	JSL CODE_808009				;$B284DC
	JSL CODE_80801B				;$B284E0
	JSL CODE_80800C				;$B284E4
	LDX #$A15A				;$B284E8
	LDY #$007E				;$B284EB
	LDA #$0660				;$B284EE
	JSL CODE_808030				;$B284F1
	JSL CODE_BB857F				;$B284F5
	STZ $BC					;$B284F9
	STZ $F4					;$B284FB
	LDA $BA					;$B284FD
	ASL					;$B284FF
	TAX					;$B28500
	JMP (DATA_B28504,x)			;$B28501

DATA_B28504:
	dw CODE_B2861F
	dw CODE_B289B9
	dw CODE_B28CFF
	dw CODE_B28EB4
	dw CODE_B2935C

CODE_B2850E:
	STA $BA					;$B2850E
	LDX #CODE_B284D6			;$B28510
	LDY.w #CODE_B284D6>>16			;$B28513
	STX $4E					;$B28516
	STY $50					;$B28518
	LDA #CODE_808370			;$B2851A
	JML set_and_wait_for_nmi		;$B2851D

CODE_B28521:
	LDA #$1300				;$B28521
	STA $80					;$B28524
	LDA #$0001				;$B28526
	STA $04E4				;$B28529
	RTS					;$B2852C

CODE_B2852D:
	LDA #$1300				;$B2852D
	STA $80					;$B28530
	SEP #$20				;$B28532
	LDX #$1042				;$B28534
	STX HDMA[$01].settings			;$B28537
	LDX #DATA_B285F9			;$B2853A
	STX HDMA[$01].source_word		;$B2853D
	LDA.b #DATA_B285F9>>16			;$B28540
	STA HDMA[$01].source_bank		;$B28542
	LDA #$7E				;$B28545
	STA HDMA[$01].indirect_source_bank	;$B28547
	LDX #$2C00				;$B2854A
	STX HDMA[$02].settings			;$B2854D
	LDX #DATA_B285F2			;$B28550
	STX HDMA[$02].source_word		;$B28553
	LDA.b #DATA_B285F2>>16			;$B28556
	STA HDMA[$02].source_bank		;$B28558
	LDA #$7E				;$B2855B
	STA HDMA[$02].indirect_source_bank	;$B2855D
	LDX #$3200				;$B28560
	STX HDMA[$03].settings			;$B28563
	LDX #DATA_B285B8			;$B28566
	STX HDMA[$03].source_word		;$B28569
	LDA.b #DATA_B285B8>>16			;$B2856C
	STA HDMA[$03].source_bank		;$B2856E
	LDA #$7E				;$B28571
	STA HDMA[$03].indirect_source_bank	;$B28573
	LDX #$3100				;$B28576
	STX HDMA[$04].settings			;$B28579
	LDX #DATA_B285B1			;$B2857C
	STX HDMA[$04].source_word		;$B2857F
	LDA.b #DATA_B285B1>>16			;$B28582
	STA HDMA[$04].source_bank		;$B28584
	LDA #$7E				;$B28587
	STA HDMA[$04].indirect_source_bank	;$B28589
	LDX #$1242				;$B2858C
	STX HDMA[$05].settings			;$B2858F
	LDX #DATA_B285F9			;$B28592
	STX HDMA[$05].source_word		;$B28595
	LDA.b #DATA_B285F9>>16			;$B28598
	STA HDMA[$05].source_bank		;$B2859A
	LDA #$7E				;$B2859D
	STA HDMA[$05].indirect_source_bank	;$B2859F
	REP #$20				;$B285A2
	LDA #$3E01				;$B285A4
	STA $04E4				;$B285A7
	RTS					;$B285AA

DATA_B285AB:
	db $FF,$5A,$A1,$FF,$58,$A2

DATA_B285B1:
	db $48,$86,$10,$06,$01,$86,$00

DATA_B285B8:
	db $30,$F0,$90,$F0,$EE,$EC,$EA,$E9,$E8,$E7,$E6,$E5,$E4,$E3,$E3,$E2
	db $E2,$E1,$E1,$08,$E0,$88,$E1,$E2,$E3,$E4,$E4,$E3,$E2,$E1,$19,$E0
	db $98,$E1,$E1,$E2,$E2,$E3,$E3,$E4,$E4,$E5,$E5,$E6,$E6,$E7,$E8,$E9
	db $EA,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F0,$00

DATA_B285F2:
	db $30,$11,$51,$17,$01,$11,$00

DATA_B285F9:
	db $30,$5A,$A2,$D1,$5A,$A1,$01,$5A,$A2,$00

CODE_B28603:
	LDA #$0001				;$B28603
	TSB $BC					;$B28606
	BNE CODE_B28611				;$B28608
	LDA #$820F				;$B2860A
	JSL CODE_808024				;$B2860D
CODE_B28611:
	RTS					;$B28611

CODE_B28612:
	JSL handle_fading				;$B28612
	LDA screen_brightness			;$B28616
	BNE CODE_B2861E				;$B28619
	CMP screen_fade_speed			;$B2861B
CODE_B2861E:
	RTS					;$B2861E

CODE_B2861F:
	JSL disable_screen_wrapper		;$B2861F
	JSL CODE_808009				;$B28623
	JSL CODE_80801B				;$B28627
	JSL CODE_80800C				;$B2862B
	LDX #$A15A				;$B2862F
	LDY #$007E				;$B28632
	LDA #$0660				;$B28635
	JSL CODE_808030				;$B28638
	JSL CODE_BB857F				;$B2863C
	LDA #$0040				;$B28640
	JSL vram_payload_handler_global		;$B28643
	LDA #$0035				;$B28647
	JSL set_PPU_registers_global		;$B2864A
	LDX #DATA_F6008E			;$B2864E
	LDY.w #DATA_F6008E>>16			;$B28651
	LDA #$0000				;$B28654
	JSL CODE_BB857C				;$B28657
	STZ PPU.vram_address			;$B2865B
	SEP #$20				;$B2865E
	LDX #$0000				;$B28660
CODE_B28663:
	TXA					;$B28663
	LSR					;$B28664
	LSR					;$B28665
	LSR					;$B28666
	LSR					;$B28667
	LSR					;$B28668
	LSR					;$B28669
	LDA $7F0000,x				;$B2866A
	STA PPU.vram_write_high			;$B2866E
	INX					;$B28671
	CPX #$3400				;$B28672
	BNE CODE_B28663				;$B28675
	REP #$20				;$B28677
	LDA #$038B				;$B28679
	STA $1A					;$B2867C
	LDA #DATA_F60000			;$B2867E
	LDX.w #DATA_F60000>>16			;$B28681
	STA $1C					;$B28684
	STX $1E					;$B28686
	STZ $21					;$B28688
	SEP #$20				;$B2868A
	STZ PPU.vram_control			;$B2868C
	REP #$20				;$B2868F
	LDY #$0000				;$B28691
	LDA [$1C],y				;$B28694
	STA $20					;$B28696
	INY					;$B28698
	INY					;$B28699
CODE_B2869A:
	LDA $1A					;$B2869A
	STA PPU.vram_address			;$B2869C
	LDA $20					;$B2869F
	AND #$00FF				;$B286A1
	TAX					;$B286A4
CODE_B286A5:
	SEP #$20				;$B286A5
	LDA [$1C],y				;$B286A7
	STA PPU.vram_write_low			;$B286A9
	REP #$20				;$B286AC
	INY					;$B286AE
	DEX					;$B286AF
	BNE CODE_B286A5				;$B286B0
	LDA $1A					;$B286B2
	CLC					;$B286B4
	ADC #$0080				;$B286B5
	STA $1A					;$B286B8
	DEC $21					;$B286BA
	BNE CODE_B2869A				;$B286BC
	SEP #$20				;$B286BE
	LDA #$80				;$B286C0
	STA PPU.vram_control			;$B286C2
	REP #$20				;$B286C5
	LDA #$0021				;$B286C7
	LDX #$0020				;$B286CA
	LDY #$0000				;$B286CD
	JSL CODE_BB856D				;$B286D0
	JSR CODE_B28521				;$B286D4
	SEP #$20				;$B286D7
	LDA #$FC				;$B286D9
	STA PPU.layer_1_scroll_x		;$B286DB
	LDA #$FF				;$B286DE
	STA PPU.layer_1_scroll_x		;$B286E0
	LDA #$DD				;$B286E3
	STA PPU.layer_1_scroll_y		;$B286E5
	LDA #$FF				;$B286E8
	STA PPU.layer_1_scroll_y		;$B286EA
	LDA #$80				;$B286ED
	STA PPU.mode_7_center_x			;$B286EF
	LDA #$00				;$B286F2
	STA PPU.mode_7_center_x			;$B286F4
	LDA #$98				;$B286F7
	STA PPU.mode_7_center_y			;$B286F9
	STZ PPU.mode_7_center_y			;$B286FC
	LDA #$80				;$B286FF
	STA PPU.set_mode_7			;$B28701
	REP #$20				;$B28704
	LDY #$038E				;$B28706
	JSL CODE_BB8588				;$B28709
	LDA alternate_sprite			;$B2870D
	STA $7EA15C				;$B2870F
	LDY #$0390				;$B28713
	JSL CODE_BB8585				;$B28716
	LDY #$0392				;$B2871A
	JSL CODE_BB8585				;$B2871D
	LDA #$01B0				;$B28721
	STA $5E					;$B28724
	STA $5C					;$B28726
	LDA #!music_fanfare			;$B28728
	JSL play_song				;$B2872B
	LDA #$0002				;$B2872F
	TRB $06AB				;$B28732
	PHK					;$B28735
	PLB					;$B28736
	LDA #$0200				;$B28737
	JSL CODE_808024				;$B2873A
	LDA #$000A				;$B2873E
	JSL CODE_BB85E2				;$B28741
	PHK					;$B28745
	PLB					;$B28746
	LDA #CODE_B28751			;$B28747
	LDX.w #CODE_B28751>>16			;$B2874A
	JML CODE_808003				;$B2874D

CODE_B28751:
	LDA $04E4				;$B28751
	STA CPU.enable_dma_hdma			;$B28754
	LDX #$0000				;$B28757
CODE_B2875A:
	LDA $1568,x				;$B2875A
	BPL CODE_B28770				;$B2875D
	LDA $1564,x				;$B2875F
	ORA #$4000				;$B28762
	STA $1564,x				;$B28765
	TXA					;$B28768
	CLC					;$B28769
	ADC #$0008				;$B2876A
	TAX					;$B2876D
	BRA CODE_B2875A				;$B2876E

CODE_B28770:
	JSL CODE_B38006				;$B28770
	JSL CODE_80801E				;$B28774
	SEP #$20				;$B28778
	LDA screen_brightness			;$B2877A
	STA PPU.screen				;$B2877D
	REP #$20				;$B28780
	STZ $1560				;$B28782
	STZ $155E				;$B28785
	LDA $06AB				;$B28788
	BEQ CODE_B287AA				;$B2878B
	LDA screen_brightness			;$B2878D
	BIT #$FF00				;$B28790
	BNE CODE_B287AA				;$B28793
	JSL CODE_808015				;$B28795
	LDA player_1_pressed			;$B28799
	AND #$9080				;$B2879C
	BEQ CODE_B287AA				;$B2879F
	LDA #$0002				;$B287A1
	TSB $06AB				;$B287A4
	JSR CODE_B28603				;$B287A7
CODE_B287AA:
	LDA $5E					;$B287AA
	CLC					;$B287AC
	ADC $1989				;$B287AD
	STA $5E					;$B287B0
	STA $5C					;$B287B2
	JSL CODE_B28800				;$B287B4
	JSL sprite_handler			;$B287B8
	JSL CODE_B7800C				;$B287BC
	JSL CODE_B7800F				;$B287C0
	JSL CODE_808012				;$B287C4
	JSR CODE_B28612				;$B287C8
	BEQ CODE_B287DB				;$B287CB
	LDA $F4					;$B287CD
	CMP #$00E2				;$B287CF
	BCC CODE_B287D7				;$B287D2
	JSR CODE_B28603				;$B287D4
CODE_B287D7:
	JML CODE_808006				;$B287D7

CODE_B287DB:
	LDA #$0002				;$B287DB
	BIT $06AB				;$B287DE
	BNE CODE_B287E9				;$B287E1
	LDA #$0001				;$B287E3
	JMP CODE_B2850E				;$B287E6

CODE_B287E9:
	TRB $06AB				;$B287E9
	LDA #$0004				;$B287EC
	BIT $06AB				;$B287EF
	BEQ CODE_B287FA				;$B287F2
	LDA #$0002				;$B287F4
	JMP CODE_B2850E				;$B287F7

CODE_B287FA:
	LDA #$0003				;$B287FA
	JMP CODE_B2850E				;$B287FD

CODE_B28800:
	SEP #$30				;$B28800
	JSR CODE_B28830				;$B28802
	LDA $68					;$B28805
	STA PPU.fixed_point_mul_A		;$B28807
	LDA $69					;$B2880A
	STA PPU.fixed_point_mul_A		;$B2880C
	LDA $64					;$B2880F
	STA PPU.fixed_point_mul_B		;$B28811
	LDA $65					;$B28814
	STA PPU.fixed_point_mul_B		;$B28816
	LDA $62					;$B28819
	STA PPU.mode_7_C			;$B2881B
	LDA $63					;$B2881E
	STA PPU.mode_7_C			;$B28820
	LDA $60					;$B28823
	STA PPU.mode_7_D			;$B28825
	LDA $61					;$B28828
	STA PPU.mode_7_D			;$B2882A
	REP #$30				;$B2882D
	RTL					;$B2882F

CODE_B28830:
	LDY $5E					;$B28830
	LDX $5F					;$B28832
	LDA $66					;$B28834
	JSR CODE_B2888E				;$B28836
	STY $68					;$B28839
	STX $69					;$B2883B
	LDY $5E					;$B2883D
	LDX $5F					;$B2883F
	LDA $66					;$B28841
	JSR CODE_B28871				;$B28843
	STY $64					;$B28846
	STX $65					;$B28848
	LDY $5C					;$B2884A
	LDX $5D					;$B2884C
	LDA $66					;$B2884E
	JSR CODE_B28871				;$B28850
	TYA					;$B28853
	EOR #$FF				;$B28854
	STA $62					;$B28856
	TXA					;$B28858
	EOR #$FF				;$B28859
	STA $63					;$B2885B
	INC $62					;$B2885D
	BNE CODE_B28863				;$B2885F
	INC $63					;$B28861
CODE_B28863:
	LDY $5C					;$B28863
	LDX $5D					;$B28865
	LDA $66					;$B28867
	JSR CODE_B2888E				;$B28869
	STY $60					;$B2886C
	STX $61					;$B2886E
	RTS					;$B28870

CODE_B28871:
	STY PPU.fixed_point_mul_A		;$B28871
	STX PPU.fixed_point_mul_A		;$B28874
	JSR CODE_B288AE				;$B28877
	BCS CODE_B2888D				;$B2887A
	STA PPU.fixed_point_mul_B		;$B2887C
	LDA PPU.multiply_result_low		;$B2887F
	ASL					;$B28882
	LDA PPU.multiply_result_mid		;$B28883
	ROL					;$B28886
	TAY					;$B28887
	LDA PPU.multiply_result_high		;$B28888
	ROL					;$B2888B
	TAX					;$B2888C
CODE_B2888D:
	RTS					;$B2888D

CODE_B2888E:
	STY PPU.fixed_point_mul_A		;$B2888E
	STX PPU.fixed_point_mul_A		;$B28891
	JSR CODE_B288AB				;$B28894
	BCS CODE_B288AA				;$B28897
	STA PPU.fixed_point_mul_B		;$B28899
	LDA PPU.multiply_result_low		;$B2889C
	ASL					;$B2889F
	LDA PPU.multiply_result_mid		;$B288A0
	ROL					;$B288A3
	TAY					;$B288A4
	LDA PPU.multiply_result_high		;$B288A5
	ROL					;$B288A8
	TAX					;$B288A9
CODE_B288AA:
	RTS					;$B288AA

CODE_B288AB:
	CLC					;$B288AB
	ADC #$40				;$B288AC
CODE_B288AE:
	CMP #$40				;$B288AE
	BEQ CODE_B288B8				;$B288B0
	TAX					;$B288B2
	LDA.l DATA_B288B9,x			;$B288B3
	CLC					;$B288B7
CODE_B288B8:
	RTS					;$B288B8

DATA_B288B9:
	db $00,$03,$06,$09,$0C,$0F,$12,$15,$18,$1C,$1F,$22,$25,$28,$2B,$2E
	db $30,$33,$36,$39,$3C,$3F,$41,$44,$47,$49,$4C,$4E,$51,$53,$55,$58
	db $5A,$5C,$5E,$60,$62,$64,$66,$68,$6A,$6C,$6D,$6F,$70,$72,$73,$75
	db $76,$77,$78,$79,$7A,$7B,$7C,$7C,$7D,$7E,$7E,$7F,$7F,$7F,$7F,$7F
	db $7F,$7F,$7F,$7F,$7F,$7F,$7E,$7E,$7D,$7C,$7C,$7B,$7A,$79,$78,$77
	db $76,$75,$73,$72,$70,$6F,$6D,$6C,$6A,$68,$66,$64,$62,$60,$5E,$5C
	db $5A,$58,$55,$53,$51,$4E,$4C,$49,$47,$44,$41,$3F,$3C,$39,$36,$33
	db $30,$2E,$2B,$28,$25,$22,$1F,$1C,$18,$15,$12,$0F,$0C,$09,$06,$03
	db $00,$FC,$F9,$F6,$F3,$F0,$ED,$EA,$E7,$E3,$E0,$DD,$DA,$D7,$D4,$D1
	db $CF,$CC,$C9,$C6,$C3,$C0,$BE,$BB,$B8,$B6,$B3,$B1,$AE,$AC,$AA,$A7
	db $A5,$A3,$A1,$9F,$9D,$9B,$99,$97,$95,$93,$92,$90,$8F,$8D,$8C,$8A
	db $89,$88,$87,$86,$85,$84,$83,$83,$82,$81,$81,$80,$80,$80,$80,$80
	db $80,$80,$80,$80,$80,$80,$81,$81,$82,$83,$83,$84,$85,$86,$87,$88
	db $89,$8A,$8C,$8D,$8F,$90,$92,$93,$95,$97,$99,$9B,$9D,$9F,$A1,$A3
	db $A5,$A7,$AA,$AC,$AE,$B1,$B3,$B6,$B8,$BB,$BE,$C0,$C3,$C6,$C9,$CC
	db $CF,$D1,$D4,$D7,$DA,$DD,$E0,$E3,$E7,$EA,$ED,$F0,$F3,$F6,$F9,$FC

CODE_B289B9:
	JSR CODE_B289D3				;$B289B9
	LDA #DATA_F315C6			;$B289BC
	LDY.w #DATA_F315C6>>16			;$B289BF
	LDX #$0000				;$B289C2
	JSL CODE_BB85DF				;$B289C5
	LDA #CODE_B28B2C			;$B289C9
	LDX.w #CODE_B28B2C>>16			;$B289CC
	JML CODE_808003				;$B289CF

CODE_B289D3:
	JSL disable_screen_wrapper		;$B289D3
	JSL CODE_808009				;$B289D7
	JSL CODE_80801B				;$B289DB
	JSL CODE_80800C				;$B289DF
	LDX #$A15A				;$B289E3
	LDY #$007E				;$B289E6
	LDA #$0660				;$B289E9
	JSL CODE_808030				;$B289EC
	JSL CODE_BB857F				;$B289F0
	LDA #$0041				;$B289F4
	JSL vram_payload_handler_global		;$B289F7
	LDA #$0036				;$B289FB
	JSL set_PPU_registers_global		;$B289FE
	LDA #$0020				;$B28A02
	LDX #$0020				;$B28A05
	LDY #$0000				;$B28A08
	JSL CODE_BB856D				;$B28A0B
	JSR CODE_B2852D				;$B28A0F
	LDA #$000C				;$B28A12
	STA $0400				;$B28A15
CODE_B28A18:
	LDA $0400				;$B28A18
	AND #$0003				;$B28A1B
	ASL					;$B28A1E
	CLC					;$B28A1F
	ADC #$0384				;$B28A20
	TAY					;$B28A23
	JSL CODE_BB85B8				;$B28A24
	LDY alternate_sprite			;$B28A28
	LDA #$007C				;$B28A2A
	STA $0016,y				;$B28A2D
	LDX $0400				;$B28A30
	LDA.l DATA_B28B1F,x			;$B28A33
	AND #$00FF				;$B28A37
	SEC					;$B28A3A
	SBC #$0003				;$B28A3B
	STA $0012,y				;$B28A3E
	LDA $0400				;$B28A41
	ASL					;$B28A44
	ADC #$15FC				;$B28A45
	STA $005C,y				;$B28A48
	DEC $0400				;$B28A4B
	BNE CODE_B28A18				;$B28A4E
	LDY #$038C				;$B28A50
	JSL CODE_BB85B8				;$B28A53
	LDY alternate_sprite			;$B28A57
	TYA					;$B28A59
	STA $7EA258				;$B28A5A
	LDA #$0020				;$B28A5E
	STA $0012,y				;$B28A61
	LDA #$FFC0				;$B28A64
	STA $0016,y				;$B28A67
	LDA #$0118				;$B28A6A
	STA $0024,y				;$B28A6D
	LDY #$0394				;$B28A70
	JSL CODE_BB8585				;$B28A73
	LDA alternate_sprite			;$B28A77
	STA $84					;$B28A79
	LDY #$0394				;$B28A7B
	JSL CODE_BB8585				;$B28A7E
	LDY alternate_sprite			;$B28A82
	STY $86					;$B28A84
	LDA #$00F0				;$B28A86
	STA $0012,y				;$B28A89
	LDA $001E,y				;$B28A8C
	EOR #$4000				;$B28A8F
	STA $001E,y				;$B28A92
	LDY #$0396				;$B28A95
	JSL CODE_BB8585				;$B28A98
	LDY alternate_sprite			;$B28A9C
	LDA $84					;$B28A9E
	STA $0010,y				;$B28AA0
	LDY #$0398				;$B28AA3
	JSL CODE_BB8585				;$B28AA6
	LDY alternate_sprite			;$B28AAA
	LDA $86					;$B28AAC
	STA $0010,y				;$B28AAE
	LDX #$0000				;$B28AB1
	LDA #$0000				;$B28AB4
CODE_B28AB7:
	STA $7EA25E,x				;$B28AB7
	INX					;$B28ABB
	INX					;$B28ABC
	CPX #$0066				;$B28ABD
	BNE CODE_B28AB7				;$B28AC0
	LDA #$0088				;$B28AC2
	STA active_frame_counter		;$B28AC5
	LDA #$0141				;$B28AC7
	SEC					;$B28ACA
	SBC active_frame_counter		;$B28ACB
	STA $7EA25A				;$B28ACD
	LDA #$FFF0				;$B28AD1
	STA $1973				;$B28AD4
	SEP #$20				;$B28AD7
	LDA #$F2				;$B28AD9
	STA PPU.layer_1_scroll_y		;$B28ADB
	STZ PPU.layer_1_scroll_y		;$B28ADE
	REP #$20				;$B28AE1
	PHK					;$B28AE3
	PLB					;$B28AE4
	LDA #$0200				;$B28AE5
	JSL CODE_808024				;$B28AE8
	LDA #$000A				;$B28AEC
	JSL CODE_BB85E2				;$B28AEF
	PHK					;$B28AF3
	PLB					;$B28AF4
	RTS					;$B28AF5

DATA_B28AF6:
	db $03,$00,$03,$01,$03,$02,$03,$03,$03,$02,$03,$04,$03,$05,$03,$06
	db $06,$08,$06,$09,$06,$0A,$06,$09,$6F,$0B,$06,$06,$06,$07,$06,$06
	db $2E,$08,$06,$01,$06,$03,$06,$01,$00

DATA_B28B1F:
	db $02,$30,$3E,$4C,$5A,$68,$76,$83,$91,$9E,$AC,$BA,$C8

CODE_B28B2C:
	LDA $04E4				;$B28B2C
	STA CPU.enable_dma_hdma			;$B28B2F
	LDA $1975				;$B28B32
	CLC					;$B28B35
	ADC #$00A0				;$B28B36
	AND #$00F8				;$B28B39
	ASL					;$B28B3C
	ASL					;$B28B3D
	CLC					;$B28B3E
	ADC #$7400				;$B28B3F
	STA PPU.vram_address			;$B28B42
	LDA $1975				;$B28B45
	AND #$01F8				;$B28B48
	ASL					;$B28B4B
	ASL					;$B28B4C
	ASL					;$B28B4D
	TAX					;$B28B4E
	LDY #$0020				;$B28B4F
CODE_B28B52:
	LDA $7F0000,x				;$B28B52
	STA PPU.vram_write			;$B28B56
	INX					;$B28B59
	INX					;$B28B5A
	DEY					;$B28B5B
	BNE CODE_B28B52				;$B28B5C
	JSL CODE_B38006				;$B28B5E
	JSL CODE_80801E				;$B28B62
	SEP #$20				;$B28B66
	LDA screen_brightness			;$B28B68
	STA PPU.screen				;$B28B6B
	REP #$20				;$B28B6E
	STZ $1560				;$B28B70
	STZ $155E				;$B28B73
	LDA $06AB				;$B28B76
	BEQ CODE_B28B92				;$B28B79
	LDA screen_brightness			;$B28B7B
	BIT #$FF00				;$B28B7E
	BNE CODE_B28B92				;$B28B81
	JSL CODE_808015				;$B28B83
	LDA player_1_pressed			;$B28B87
	AND #$9080				;$B28B8A
	BEQ CODE_B28B92				;$B28B8D
	JSR CODE_B28603				;$B28B8F
CODE_B28B92:
	LDA active_frame_counter		;$B28B92
	CMP #$00AB				;$B28B94
	BCC CODE_B28BC4				;$B28B97
	LDA active_frame_counter		;$B28B99
	SEC					;$B28B9B
	SBC #$0103				;$B28B9C
	CMP #$003C				;$B28B9F
	BCC CODE_B28BC4				;$B28BA2
	LDA active_frame_counter		;$B28BA4
	SEC					;$B28BA6
	SBC #$0258				;$B28BA7
	BMI CODE_B28BBA				;$B28BAA
	LSR					;$B28BAC
	LSR					;$B28BAD
	BEQ CODE_B28BBA				;$B28BAE
	CMP #$0008				;$B28BB0
	BCC CODE_B28BBD				;$B28BB3
	LDA #$0008				;$B28BB5
	BRA CODE_B28BBD				;$B28BB8

CODE_B28BBA:
	LDA #$0001				;$B28BBA
CODE_B28BBD:
	CLC					;$B28BBD
	ADC $1975				;$B28BBE
	STA $1975				;$B28BC1
CODE_B28BC4:
	LDA $1975				;$B28BC4
	SEC					;$B28BC7
	SBC #$0010				;$B28BC8
	STA $1A					;$B28BCB
	LDY #$0000				;$B28BCD
	LDX #$0000				;$B28BD0
CODE_B28BD3:
	LDA.l DATA_B2AFDE,x			;$B28BD3
	CLC					;$B28BD7
	ADC $1A					;$B28BD8
	STA $7EA15A,x				;$B28BDA
	INX					;$B28BDE
	INX					;$B28BDF
	CPX #$00A2				;$B28BE0
	BNE CODE_B28BD3				;$B28BE3
	LDA $7EA25A				;$B28BE5
	DEC					;$B28BE9
	STA $7EA25A				;$B28BEA
	LDA $7EA25A				;$B28BEE
	BNE CODE_B28C4A				;$B28BF2
	LDA $7EA25C				;$B28BF4
	TAX					;$B28BF8
	LDA.l DATA_B28AF6,x			;$B28BF9
	AND #$00FF				;$B28BFD
	STA $7EA25A				;$B28C00
	LDA.l DATA_B28AF6+$01,x			;$B28C04
	AND #$00FF				;$B28C08
	CMP #$00FF				;$B28C0B
	BEQ CODE_B28C4A				;$B28C0E
	STA $84					;$B28C10
	INX					;$B28C12
	INX					;$B28C13
	TXA					;$B28C14
	STA $7EA25C				;$B28C15
	LDX #$0000				;$B28C19
CODE_B28C1C:
	LDA $7EA25E,x				;$B28C1C
	BEQ CODE_B28C2B				;$B28C20
	INX					;$B28C22
	INX					;$B28C23
	CPX #$0022				;$B28C24
	BNE CODE_B28C1C				;$B28C27
	BRA CODE_B28C4A				;$B28C29

CODE_B28C2B:
	TXY					;$B28C2B
	LDA $84					;$B28C2C
	STA $7EA2A2,x				;$B28C2E
	TAX					;$B28C32
	LDA.l DATA_B28B1F+$01,x			;$B28C33
	CLC					;$B28C37
	ADC #$0004				;$B28C38
	AND #$00FF				;$B28C3B
	TYX					;$B28C3E
	STA $7EA280,x				;$B28C3F
	LDA #$00E0				;$B28C43
	STA $7EA25E,x				;$B28C46
CODE_B28C4A:
	LDX #$0000				;$B28C4A
CODE_B28C4D:
	LDA $7EA2C4,x				;$B28C4D
	CMP $7EA2C6,x				;$B28C51
	BEQ CODE_B28CA5				;$B28C55
	BPL CODE_B28CA5				;$B28C57
	STA $1A					;$B28C59
	LDA $7EA280,x				;$B28C5B
	STA $1C					;$B28C5F
	LDA $7EA2A2,x				;$B28C61
	STA $1E					;$B28C65
	LDA $7EA25E,x				;$B28C67
	STA $20					;$B28C6B
	LDA $7EA2C6,x				;$B28C6D
	STA $7EA2C4,x				;$B28C71
	LDA $7EA282,x				;$B28C75
	STA $7EA280,x				;$B28C79
	LDA $7EA260,x				;$B28C7D
	STA $7EA25E,x				;$B28C81
	LDA $7EA2A4,x				;$B28C85
	STA $7EA2A2,x				;$B28C89
	LDA $1A					;$B28C8D
	STA $7EA2C6,x				;$B28C8F
	LDA $1C					;$B28C93
	STA $7EA282,x				;$B28C95
	LDA $1E					;$B28C99
	STA $7EA2A4,x				;$B28C9B
	LDA $20					;$B28C9F
	STA $7EA260,x				;$B28CA1
CODE_B28CA5:
	INX					;$B28CA5
	INX					;$B28CA6
	CPX #$0020				;$B28CA7
	BNE CODE_B28C4D				;$B28CAA
	JSL sprite_handler			;$B28CAC
	JSL CODE_B7800C				;$B28CB0
	JSL CODE_B7800F				;$B28CB4
	LDX #$0000				;$B28CB8
CODE_B28CBB:
	LDA $7EA25E,x				;$B28CBB
	BEQ CODE_B28CC8				;$B28CBF
	STX $34					;$B28CC1
	JSR CODE_B291D6				;$B28CC3
	LDX $34					;$B28CC6
CODE_B28CC8:
	INX					;$B28CC8
	INX					;$B28CC9
	CPX #$0022				;$B28CCA
	BNE CODE_B28CBB				;$B28CCD
	JSL CODE_808012				;$B28CCF
	JSR CODE_B28612				;$B28CD3
	BEQ CODE_B28CE6				;$B28CD6
	LDA $F4					;$B28CD8
	CMP #$0276				;$B28CDA
	BCC CODE_B28CE2				;$B28CDD
	JSR CODE_B28603				;$B28CDF
CODE_B28CE2:
	JML CODE_808006				;$B28CE2

CODE_B28CE6:
	LDA $06AB				;$B28CE6
	BIT #$0004				;$B28CE9
	BEQ CODE_B28CF9				;$B28CEC
	BIT #$0001				;$B28CEE
	BEQ CODE_B28CF9				;$B28CF1
	LDA #$0002				;$B28CF3
	JMP CODE_B2850E				;$B28CF6

CODE_B28CF9:
	LDA #$0003				;$B28CF9
	JMP CODE_B2850E				;$B28CFC

CODE_B28CFF:
	JSL disable_screen_wrapper		;$B28CFF
	JSL CODE_808009				;$B28D03
	JSL CODE_80801B				;$B28D07
	JSL CODE_80800C				;$B28D0B
	LDX #$A15A				;$B28D0F
	LDY #$007E				;$B28D12
	LDA #$0660				;$B28D15
	JSL CODE_808030				;$B28D18
	JSL CODE_808042				;$B28D1C
	JSL CODE_BB857F				;$B28D20
	LDA #$0042				;$B28D24
	JSL vram_payload_handler_global		;$B28D27
	LDA #$0037				;$B28D2B
	JSL set_PPU_registers_global		;$B28D2E
	LDA #$001E				;$B28D32
	LDX #$0020				;$B28D35
	LDY #$0000				;$B28D38
	JSL CODE_BB856D				;$B28D3B
	LDA #$0003				;$B28D3F
	LDY #$0238				;$B28D42
	JSL CODE_BB85F7				;$B28D45
	LDY #$023C				;$B28D49
	JSL CODE_BB8588				;$B28D4C
	LDY #$023A				;$B28D50
	JSL CODE_BB85B5				;$B28D53
	LDX alternate_sprite			;$B28D57
	STX active_kong_sprite			;$B28D59
	LDA #$0002				;$B28D5C
	TRB $06AB				;$B28D5F
	JSR CODE_B28D82				;$B28D62
	JSR CODE_B28521				;$B28D65
	LDA #!music_dixie_beat			;$B28D68
	JSL play_song				;$B28D6B
	PHK					;$B28D6F
	PLB					;$B28D70
	LDA #$0200				;$B28D71
	JSL CODE_808024				;$B28D74
	LDA #CODE_B28E05			;$B28D78
	LDX.w #CODE_B28E05>>16			;$B28D7B
	JML CODE_808003				;$B28D7E

CODE_B28D82:
	LDA $06AD				;$B28D82
	AND #$00FF				;$B28D85
	CMP #$000F				;$B28D88
	BNE CODE_B28DA2				;$B28D8B
	LDA #$8080				;$B28D8D
	TSB $06AF				;$B28D90
	TSB $06B1				;$B28D93
	DEC $06AD				;$B28D96
	DEC $06AD				;$B28D99
	DEC $06AD				;$B28D9C
	DEC $06AD				;$B28D9F
CODE_B28DA2:
	TDC					;$B28DA2
	SEP #$20				;$B28DA3
	LDA $06D5				;$B28DA5
	AND #$03				;$B28DA8
	STA $06D4				;$B28DAA
	TAX					;$B28DAD
	ORA #$80				;$B28DAE
	STA $06AF,x				;$B28DB0
	REP #$20				;$B28DB3
	JSL CODE_808063				;$B28DB5
	STA $06D1				;$B28DB9
	JSL CODE_808063				;$B28DBC
	STA $06D2				;$B28DC0
	JSL CODE_808063				;$B28DC3
	SEP #$20				;$B28DC7
	STA $06D3				;$B28DC9
	INC $06D5				;$B28DCC
	REP #$20				;$B28DCF
	STZ $22					;$B28DD1
	LDX #$0003				;$B28DD3
	STX $24					;$B28DD6
CODE_B28DD8:
	LDA $06D1,x				;$B28DD8
	AND #$00FF				;$B28DDB
	ASL					;$B28DDE
	TAX					;$B28DDF
	LDA demo_scripts_table,x		;$B28DE0
	STA $1E					;$B28DE4
	LDA.w #demo_scripts_table>>16		;$B28DE6
	STA $20					;$B28DE9
	LDY #$0004				;$B28DEB
	LDA [$1E],y				;$B28DEE
	CLC					;$B28DF0
	ADC $22					;$B28DF1
	STA $22					;$B28DF3
	DEC $24					;$B28DF5
	LDX $24					;$B28DF7
	BPL CODE_B28DD8				;$B28DF9
	LDA #$081C				;$B28DFB
	SEC					;$B28DFE
	SBC $22					;$B28DFF
	STA $1D37				;$B28E01
	RTS					;$B28E04

CODE_B28E05:
	LDA $04E4				;$B28E05
	STA CPU.enable_dma_hdma			;$B28E08
	JSL CODE_B38006				;$B28E0B
	JSL CODE_80801E				;$B28E0F
	LDX active_kong_sprite			;$B28E13
	LDA $16,x				;$B28E16
	EOR #$FFFF				;$B28E18
	INC					;$B28E1B
	SEP #$20				;$B28E1C
	STA PPU.layer_1_scroll_y		;$B28E1E
	XBA					;$B28E21
	STA PPU.layer_1_scroll_y		;$B28E22
	REP #$20				;$B28E25
	LDA $12,x				;$B28E27
	SEP #$20				;$B28E29
	STA PPU.layer_1_scroll_x		;$B28E2B
	XBA					;$B28E2E
	STA PPU.layer_1_scroll_x		;$B28E2F
	REP #$20				;$B28E32
	SEP #$20				;$B28E34
	LDA screen_brightness			;$B28E36
	STA PPU.screen				;$B28E39
	REP #$20				;$B28E3C
	STZ $1560				;$B28E3E
	STZ $155E				;$B28E41
	LDA screen_brightness			;$B28E44
	BIT #$FF00				;$B28E47
	BNE CODE_B28E61				;$B28E4A
	JSL CODE_808015				;$B28E4C
	LDA player_1_pressed			;$B28E50
	BIT #$9080				;$B28E53
	BEQ CODE_B28E61				;$B28E56
	LDA #$0002				;$B28E58
	TSB $06AB				;$B28E5B
	JSR CODE_B28603				;$B28E5E
CODE_B28E61:
	JSL sprite_handler			;$B28E61
	JSL CODE_B7800C				;$B28E65
	JSL CODE_B7800F				;$B28E69
	JSL CODE_808012				;$B28E6D
	JSR CODE_B28612				;$B28E71
	BEQ CODE_B28E84				;$B28E74
	LDA $F4					;$B28E76
	CMP $1D37				;$B28E78
	BCC CODE_B28E80				;$B28E7B
	JSR CODE_B28603				;$B28E7D
CODE_B28E80:
	JML CODE_808006				;$B28E80

CODE_B28E84:
	LDA #$0002				;$B28E84
	BIT $06AB				;$B28E87
	BEQ CODE_B28E9D				;$B28E8A
	LDA #CODE_808045			;$B28E8C
	STA $4E					;$B28E8F
	LDA.w #CODE_808045>>16			;$B28E91
	STA $50					;$B28E94
	LDA #CODE_808370			;$B28E96
	JML set_and_wait_for_nmi		;$B28E99

CODE_B28E9D:
	LDA #$0001				;$B28E9D
	STA $0523				;$B28EA0
	LDX #CODE_80803F			;$B28EA3
	LDY.w #CODE_80803F>>16			;$B28EA6
	STX $4E					;$B28EA9
	STY $50					;$B28EAB
	LDA #CODE_808344			;$B28EAD
	JML set_and_wait_for_nmi		;$B28EB0

CODE_B28EB4:
	LDA #$0043				;$B28EB4
	JSL vram_payload_handler_global		;$B28EB7
	LDA #$0038				;$B28EBB
	JSL set_PPU_registers_global		;$B28EBE
	LDA #$0023				;$B28EC2
	LDX #$0004				;$B28EC5
	LDY #$0000				;$B28EC8
	JSL CODE_BB856D				;$B28ECB
	JSR CODE_B28521				;$B28ECF
	PHK					;$B28ED2
	PLB					;$B28ED3
	LDA #$0200				;$B28ED4
	JSL CODE_808024				;$B28ED7
	LDA #CODE_B28EE5			;$B28EDB
	LDX.w #CODE_B28EE5>>16			;$B28EDE
	JML CODE_808003				;$B28EE1

CODE_B28EE5:
	LDA $04E4				;$B28EE5
	STA CPU.enable_dma_hdma			;$B28EE8
	JSL CODE_B38006				;$B28EEB
	JSL CODE_80801E				;$B28EEF
	SEP #$20				;$B28EF3
	LDA screen_brightness			;$B28EF5
	STA PPU.screen				;$B28EF8
	REP #$20				;$B28EFB
	STZ $1560				;$B28EFD
	STZ $155E				;$B28F00
	JSL CODE_808015				;$B28F03
	LDA player_1_pressed			;$B28F07
	BIT #$9080				;$B28F0A
	BEQ CODE_B28F15				;$B28F0D
	LDA #$0002				;$B28F0F
	TSB $06AB				;$B28F12
CODE_B28F15:
	JSR CODE_B28612				;$B28F15
	BEQ CODE_B28F28				;$B28F18
	LDA $F4					;$B28F1A
	CMP #$005A				;$B28F1C
	BCC CODE_B28F24				;$B28F1F
	JSR CODE_B28603				;$B28F21
CODE_B28F24:
	JML CODE_808006				;$B28F24

CODE_B28F28:
	LDA #$0001				;$B28F28
	TSB $06AB				;$B28F2B
	BEQ CODE_B28F46				;$B28F2E
	LDA #$0004				;$B28F30
	TSB $06AB				;$B28F33
	BEQ CODE_B28F46				;$B28F36
	LDA #$0002				;$B28F38
	BIT $06AB				;$B28F3B
	BNE CODE_B28F52				;$B28F3E
	LDA #$0000				;$B28F40
	JMP CODE_B2850E				;$B28F43

CODE_B28F46:
	LDA #$0004				;$B28F46
	TSB $06AB				;$B28F49
	LDA #$0002				;$B28F4C
	JMP CODE_B2850E				;$B28F4F

CODE_B28F52:
	LDA #CODE_808045			;$B28F52
	LDX.w #CODE_808045>>16			;$B28F55
	JML CODE_808003				;$B28F58

rotating_cylinder_handle_main:
	LDY current_sprite			;$B28F5C  \
	LDA $1975				;$B28F5E   |
	CLC					;$B28F61   |
	ADC #$0080				;$B28F62   |
	AND #$00FF				;$B28F65   |
	ASL					;$B28F68   |
	TAX					;$B28F69   |
	LDA.l DATA_B9F278,x			;$B28F6A   |
	CLC					;$B28F6E   |
	ADC #$0100				;$B28F6F   |
	LSR					;$B28F72   |
	LSR					;$B28F73   |
	LSR					;$B28F74   |
	LSR					;$B28F75   |
	CLC					;$B28F76   |
	ADC #$003A				;$B28F77   |
	STA $1A					;$B28F7A   |
	LDA $1975				;$B28F7C   |
	CLC					;$B28F7F   |
	ADC #$00C0				;$B28F80   |
	AND #$00FF				;$B28F83   |
	ASL					;$B28F86   |
	TAX					;$B28F87   |
	LDA.l DATA_B9F278,x			;$B28F88   |
	CLC					;$B28F8C   |
	ADC #$0100				;$B28F8D   |
	LSR					;$B28F90   |
	LSR					;$B28F91   |
	LSR					;$B28F92   |
	LSR					;$B28F93   |
	LSR					;$B28F94   |
	LSR					;$B28F95   |
	LSR					;$B28F96   |
	CLC					;$B28F97   |
	ADC #$0010				;$B28F98   |
	STA $1C					;$B28F9B   |
	LDA.w sprite.oam_property,y		;$B28F9D   |
	BIT #$4000				;$B28FA0   |
	BEQ .CODE_B28FB9			;$B28FA3   |
	LDA $1C					;$B28FA5   |
	CLC					;$B28FA7   |
	ADC #$00DE				;$B28FA8   |
	STA.w sprite.x_position,y		;$B28FAB   |
	LDA $1A					;$B28FAE   |
	EOR #$FFFF				;$B28FB0   |
	CLC					;$B28FB3   |
	ADC #$0094				;$B28FB4   |
	BRA .CODE_B28FC0			;$B28FB7  /

.CODE_B28FB9:
	LDA $1C					;$B28FB9  \
	STA.w sprite.x_position,y		;$B28FBB   |
	LDA $1A					;$B28FBE  /
.CODE_B28FC0:
	STA.w sprite.y_position,y		;$B28FC0  \
	JML [$04F5]				;$B28FC3  /

unknown_sprite_00DC_main:
	JML [$04F5]				;$B28FC6  |>

rotating_cylinder_key_main:
	JSL.l process_sprite_animation		;$B28FC9  \
	JML [$04F5]				;$B28FCD  /

rare_logo_main:
	LDX current_sprite			;$B28FD0  \
	JSR CODE_B2903B				;$B28FD2   |
	JSR CODE_B29057				;$B28FD5   |
	LDA sprite.y_position,x			;$B28FD8   |
	CMP #$00C0				;$B28FDA   |
	BCC .CODE_B2902C			;$B28FDD   |
	LDA sprite.y_speed,x			;$B28FDF   |
	CMP #$0100				;$B28FE1   |
	BCC .CODE_B29020			;$B28FE4   |
	LDA $7EA15A				;$B28FE6   |
	BEQ .CODE_B29008			;$B28FEA   |
	CMP #$0001				;$B28FEC   |
	BEQ .CODE_B29003			;$B28FEF   |
	LDA #$0764				;$B28FF1   |
	JSL CODE_B28018				;$B28FF4   |
	LDA #$0001				;$B28FF8   |
	STA $15FE				;$B28FFB   |
	STA $1600				;$B28FFE   |
	BRA .CODE_B29020			;$B29001  /

.CODE_B29003:
	LDA #$0763				;$B29003  \
	BRA .CODE_B2900D			;$B29006  /

.CODE_B29008:
	LDA #$0762				;$B29008  \
	BRA .CODE_B2900D			;$B2900B  /

.CODE_B2900D:
	JSL CODE_B28018				;$B2900D  \
	LDA $7EA15A				;$B29011   |
	INC					;$B29015   |
	STA $7EA15A				;$B29016   |
	LDA #$0001				;$B2901A   |
	STA $15FE				;$B2901D  /
.CODE_B29020:
	LDA #$00C0				;$B29020  \
	STA sprite.y_position,x			;$B29023   |
	LDA #$0000				;$B29025   |
	STA sprite.y_speed,x			;$B29028   |
	STA sprite.x_speed,x			;$B2902A  /
.CODE_B2902C:
	LDA sprite.y_speed,x			;$B2902C  \
	CLC					;$B2902E   |
	ADC #$0080				;$B2902F   |
	STA sprite.y_speed,x			;$B29032   |
	JSL process_sprite_animation		;$B29034   |
	JML [$04F5]				;$B29038  /

CODE_B2903B:
	LDA $29,x				;$B2903B  \
	AND #$FF00				;$B2903D   |
	CLC					;$B29040   |
	ADC sprite.x_sub_position,x		;$B29041   |
	STA sprite.x_sub_position,x		;$B29043   |
	LDA $2B,x				;$B29045   |
	AND #$00FF				;$B29047   |
	BIT #$0080				;$B2904A   |
	BEQ .CODE_B29052			;$B2904D   |
	ORA #$FF00				;$B2904F  /
.CODE_B29052:
	ADC sprite.x_position,x			;$B29052  \
	STA sprite.x_position,x			;$B29054   |
	RTS					;$B29056  /

CODE_B29057:
	LDA $2D,x				;$B29057  \
	AND #$FF00				;$B29059   |
	CLC					;$B2905C   |
	ADC sprite.y_sub_position,x		;$B2905D   |
	STA sprite.y_sub_position,x		;$B2905F   |
	LDA $2F,x				;$B29061   |
	AND #$00FF				;$B29063   |
	BIT #$0080				;$B29066   |
	BEQ .CODE_B2906E			;$B29069   |
	ORA #$FF00				;$B2906B  /
.CODE_B2906E:
	ADC sprite.y_position,x			;$B2906E  \
	STA sprite.y_position,x			;$B29070   |
	RTS					;$B29072  /

DATA_B29073:
	db $45,$00,$00,$00,$00,$47,$00,$00,$00,$00,$4C,$00,$00,$00,$00,$53
	db $00,$00,$00,$00,$5A,$00,$00,$00,$00,$60,$00,$00,$00,$00,$65,$00
	db $00,$00,$00,$67,$00,$00,$00,$00,$43,$04,$00,$00,$00,$3D,$0C,$00
	db $00,$00,$37,$14,$00,$00,$00,$35,$18

nintendo_presents_kong_main:
	JSL process_sprite_animation		;$B290AC  \
	JSR CODE_B29057				;$B290B0   |
	LDX current_sprite			;$B290B3   |
	LDA sprite.x_sub_position,x		;$B290B5   |
	TAY					;$B290B7   |
	LDA sprite.oam_property,x		;$B290B8   |
	BIT #$4000				;$B290BA   |
	BEQ .CODE_B290D8			;$B290BD   |
	LDA.w sprite.y_position,y		;$B290BF   |
	CLC					;$B290C2   |
	ADC #$0027				;$B290C3   |
	STA $1A					;$B290C6   |
	CMP sprite.y_position,x			;$B290C8   |
	BPL .CODE_B290F0			;$B290CA   |
	LDA $1A					;$B290CC   |
	STA sprite.y_position,x			;$B290CE   |
	LDA.w sprite.x_position,y		;$B290D0   |
	STA sprite.x_position,x			;$B290D3   |
	JML [$04F5]				;$B290D5  /

.CODE_B290D8:
	LDA.w sprite.y_position,y		;$B290D8  \
	CLC					;$B290DB   |
	ADC #$003C				;$B290DC   |
	STA $1A					;$B290DF   |
	CMP sprite.y_position,x			;$B290E1   |
	BPL .CODE_B290F0			;$B290E3   |
	LDA $1A					;$B290E5   |
	STA sprite.y_position,x			;$B290E7   |
	LDA #$0001				;$B290E9   |
	STA $7EA35A				;$B290EC  /
.CODE_B290F0:
	LDA.w sprite.x_position,y		;$B290F0  \
	STA sprite.x_position,x			;$B290F3   |
	JML [$04F5]				;$B290F5  /

rare_logo_kiddy_main:
	JSL process_sprite_animation		;$B290F8  \
	LDX current_sprite			;$B290FC   |
	LDA sprite.y_speed,x			;$B290FE   |
	CLC					;$B29100   |
	ADC #$0040				;$B29101   |
	STA sprite.y_speed,x			;$B29104   |
	LDA $1602				;$B29106   |
	BEQ CODE_B29129				;$B29109   |
	CMP #$0001				;$B2910B   |
	BNE CODE_B29120				;$B2910E   |
	LDA #$0300				;$B29110   |
	STA sprite.x_speed,x			;$B29113   |
	LDA #$F700				;$B29115   |
	STA sprite.y_speed,x			;$B29118   |
	LDA #$0002				;$B2911A   |
	STA $1602				;$B2911D  /
CODE_B29120:
	JSR CODE_B2903B				;$B29120  \
	JSR CODE_B29057				;$B29123   |
	JML [$04F5]				;$B29126  /

CODE_B29129:
	LDA $7EA15C				;$B29129  \
	TAY					;$B2912D   |
	LDA.w sprite.sprite_graphic,y		;$B2912E   |
	SEC					;$B29131   |
	SBC #$800A				;$B29132   |
	TAX					;$B29135   |
	LDA.l DATA_B29073+$01,x			;$B29136   |
	AND #$00FF				;$B2913A   |
	CLC					;$B2913D   |
	ADC.w sprite.x_position,y		;$B2913E   |
	CLC					;$B29141   |
	ADC #$000C				;$B29142   |
	LDX current_sprite			;$B29145   |
	STA sprite.x_position,x			;$B29147   |
	LDA.w sprite.sprite_graphic,y		;$B29149   |
	SEC					;$B2914C   |
	SBC #$800A				;$B2914D   |
	TAX					;$B29150   |
	LDA.l DATA_B29073,x			;$B29151   |
	AND #$00FF				;$B29155   |
	CLC					;$B29158   |
	ADC.w sprite.y_position,y		;$B29159   |
	SEC					;$B2915C   |
	SBC #$006D				;$B2915D   |
	LDX current_sprite			;$B29160   |
	STA sprite.y_position,x			;$B29162   |
	JML [$04F5]				;$B29164  /

rare_logo_dixie_main:
	JSL process_sprite_animation		;$B29167  \
	LDX current_sprite			;$B2916B   |
	LDA sprite.y_speed,x			;$B2916D   |
	CLC					;$B2916F   |
	ADC #$0040				;$B29170   |
	STA sprite.y_speed,x			;$B29173   |
	LDA $1602				;$B29175   |
	BEQ .CODE_B29198			;$B29178   |
	CMP #$0002				;$B2917A   |
	BNE .CODE_B2918F			;$B2917D   |
	LDA #$0300				;$B2917F   |
	STA sprite.x_speed,x			;$B29182   |
	LDA #$F300				;$B29184   |
	STA sprite.y_speed,x			;$B29187   |
	LDA #$0003				;$B29189   |
	STA $1602				;$B2918C  /
.CODE_B2918F:
	JSR CODE_B2903B				;$B2918F  \
	JSR CODE_B29057				;$B29192   |
	JML [$04F5]				;$B29195  /

.CODE_B29198:
	LDA $7EA15C				;$B29198   \
	TAY					;$B2919C   |
	LDA.w sprite.sprite_graphic,y		;$B2919D   |
	SEC					;$B291A0   |
	SBC #$800A				;$B291A1   |
	TAX					;$B291A4   |
	LDA.l DATA_B29073+$01,x			;$B291A5   |
	AND #$00FF				;$B291A9   |
	CLC					;$B291AC   |
	ADC.w sprite.x_position,y		;$B291AD   |
	SEC					;$B291B0   |
	SBC #$000C				;$B291B1   |
	LDX current_sprite			;$B291B4   |
	STA sprite.x_position,x			;$B291B6   |
	LDA.w sprite.sprite_graphic,y		;$B291B8   |
	SEC					;$B291BB   |
	SBC #$800A				;$B291BC   |
	TAX					;$B291BF   |
	LDA.l DATA_B29073,x			;$B291C0   |
	AND #$00FF				;$B291C4   |
	CLC					;$B291C7   |
	ADC.w sprite.y_position,y		;$B291C8   |
	SEC					;$B291CB   |
	SBC #$006D				;$B291CC   |
	LDX current_sprite			;$B291CF   |
	STA sprite.y_position,x			;$B291D1   |
	JML [$04F5]				;$B291D3  /

CODE_B291D6:
	%pea_shift_dbr(DATA_B2B9D9)		;$B291D6
	PLB					;$B291D9
	LDA active_frame_counter		;$B291DA
	SEC					;$B291DC
	SBC #$0258				;$B291DD
	BMI CODE_B291F0				;$B291E0
	LSR					;$B291E2
	LSR					;$B291E3
	BEQ CODE_B291F0				;$B291E4
	CMP #$0008				;$B291E6
	BCC CODE_B291F3				;$B291E9
	LDA #$0008				;$B291EB
	BRA CODE_B291F3				;$B291EE

CODE_B291F0:
	LDA #$0001				;$B291F0
CODE_B291F3:
	EOR #$FFFF				;$B291F3
	INC					;$B291F6
	CLC					;$B291F7
	ADC $7EA25E,x				;$B291F8
	STA $7EA25E,x				;$B291FC
	CMP #$0020				;$B29200
	BCS CODE_B2920E				;$B29203
	PLB					;$B29205
	LDA #$0000				;$B29206
	STA $7EA25E,x				;$B29209
	RTS					;$B2920D

CODE_B2920E:
	STA $1E					;$B2920E
	CMP #$00C0				;$B29210
	BNE CODE_B29221				;$B29213
	LDA $7EA2A2,x				;$B29215
	ASL					;$B29219
	TAY					;$B2921A
	LDA #$0001				;$B2921B
	STA $15FE,y				;$B2921E
CODE_B29221:
	LDA $1E					;$B29221
	AND #$00FF				;$B29223
	ASL					;$B29226
	TAY					;$B29227
	LDA.w DATA_B9F278,y			;$B29228
	CLC					;$B2922B
	ADC #$0100				;$B2922C
	LSR					;$B2922F
	LSR					;$B29230
	STA $1A					;$B29231
	LSR					;$B29233
	LSR					;$B29234
	CLC					;$B29235
	ADC $1A					;$B29236
	LSR					;$B29238
	CLC					;$B29239
	ADC #$0020				;$B2923A
	STA $20					;$B2923D
	LDA $1E					;$B2923F
	CLC					;$B29241
	ADC #$0040				;$B29242
	AND #$00FF				;$B29245
	ASL					;$B29248
	TAY					;$B29249
	LDA.w DATA_B9F278,y			;$B2924A
	CLC					;$B2924D
	ADC #$0100				;$B2924E
	STA $22					;$B29251
	LDA $1E					;$B29253
	AND #$00FC				;$B29255
	BIT #$0080				;$B29258
	BEQ CODE_B29260				;$B2925B
	EOR #$00FC				;$B2925D
CODE_B29260:
	SEC					;$B29260
	SBC #$0024				;$B29261
	BPL CODE_B2926B				;$B29264
	LDA #$0000				;$B29266
	BRA CODE_B29277				;$B29269

CODE_B2926B:
	CLC					;$B2926B
	STA $1A					;$B2926C
	LSR					;$B2926E
	LSR					;$B2926F
	CLC					;$B29270
	ADC $1A					;$B29271
	CLC					;$B29273
	ADC #$0118				;$B29274
CODE_B29277:
	STA $24					;$B29277
	LDA $7EA258				;$B29279
	TAY					;$B2927D
	LDA $1E					;$B2927E
	CLC					;$B29280
	ADC #$0040				;$B29281
	LSR					;$B29284
	LSR					;$B29285
	LSR					;$B29286
	XBA					;$B29287
	EOR $001E,y				;$B29288
	AND #$1000				;$B2928B
	EOR $001E,y				;$B2928E
	STA $001E,y				;$B29291
	LDA $1E					;$B29294
	XBA					;$B29296
	EOR $001E,y				;$B29297
	AND #$8000				;$B2929A
	EOR $001E,y				;$B2929D
	STA $001E,y				;$B292A0
	LDA $24					;$B292A3
	STA $0024,y				;$B292A5
	LDA $22					;$B292A8
	STA $000E,y				;$B292AA
	STA $7EA2C4,x				;$B292AD
	LDA $7EA280,x				;$B292B1
	TAX					;$B292B5
	LDA $20					;$B292B6
	PLB					;$B292B8
	JSL CODE_B78018				;$B292B9
	RTS					;$B292BD

title_screen_sign_main:
	LDA $06AB				;$B292BE  \
	BIT #$0002				;$B292C1   |
	BEQ .handle_title_screen_sign_state	;$B292C4   |
	LDA.w sprite.general_purpose_5C,y	;$B292C6   |
	STA.w sprite.x_position,y		;$B292C9   |
	LDA #$0002				;$B292CC   |
	STA.w sprite.state,y			;$B292CF   |
	LDA #$0000				;$B292D2   |
	STA.w sprite.movement_state,y		;$B292D5   |
	LDX #$0004				;$B292D8  /
.handle_title_screen_sign_state:
	JMP (.title_screen_sign_state_table,x)	;$B292DB  |>

.title_screen_sign_state_table:
	dw .title_screen_sign_init
	dw .title_screen_sign_state_1
	dw .return_state

.title_screen_sign_init:
	TYX					;$B292E4  \
	DEC sprite.general_purpose_5E,x		;$B292E5   |
	BNE ..return				;$B292E7   |
	INC sprite.state,x			;$B292E9  /
..return:
	JML [$04F5]				;$B292EB  |>	

.title_screen_sign_state_1:
	TYX					;$B292EE  \
	LDA sprite.general_purpose_5C,x		;$B292EF   |
	CMP sprite.x_position,x			;$B292F1   |
	BCC ..return				;$B292F3   |
	STA sprite.x_position,x			;$B292F5   |
	STZ sprite.movement_state,x		;$B292F7   |
	INC sprite.state,x			;$B292F9  /
..return:
	JSL process_current_movement		;$B292FB  \
	JML [$04F5]				;$B292FF  /

.return_state:
	JML [$04F5]				;$B29302  |>

#title_screen_logo_main:
	LDA $06AB				;$B29305  \
	BIT #$0002				;$B29308   |
	BEQ .handle_title_screen_logo_state	;$B2930B   |
	LDA.w sprite.general_purpose_6A,y	;$B2930D   |
	STA.w sprite.y_position,y		;$B29310   |
	LDA #$0002				;$B29313   |
	STA.w sprite.state,y			;$B29316   |
	LDA #$0000				;$B29319   |
	STA.w sprite.movement_state,y		;$B2931C   |
	LDX #$0004				;$B2931F  /
.handle_title_screen_logo_state:
	JMP (.title_screen_logo_state_table,x)	;$B29322  |>

.title_screen_logo_state_table:
	dw .title_screen_sign_init
	dw .title_screen_logo_state_1
	dw .return_state

.title_screen_logo_state_1:
	TYX					;$B2932B  \
	LDA sprite.y_speed,x			;$B2932C   |
	BPL ..CODE_B2934E			;$B2932E   |
	LDA sprite.general_purpose_4C,x		;$B29330   |
	BMI ..CODE_B29355			;$B29332   |
	CLC					;$B29334   |
	ADC #$8001				;$B29335   |
	STA sprite.general_purpose_4C,x		;$B29338   |
	LDY #$0679				;$B2933A   |
	CMP #$8002				;$B2933D   |
	BEQ ..CODE_B29347			;$B29340   |
	BCS ..CODE_B29355			;$B29342   |
	LDY #$0670				;$B29344  /
..CODE_B29347:
	TYA					;$B29347  \
	JSL queue_sound_effect			;$B29348   |
	BRA ..CODE_B29355			;$B2934C  /

..CODE_B2934E:
	LDA sprite.general_purpose_4C,x		;$B2934E  \
	AND #$7FFF				;$B29350   |
	STA sprite.general_purpose_4C,x		;$B29353  /
..CODE_B29355:
	JSL process_current_movement		;$B29355  \
	JML [$04F5]				;$B29359  /

CODE_B2935C:
	LDA #!music_bonus_time			;$B2935C
	JSL CODE_B2800C				;$B2935F
	JSR CODE_B289D3				;$B29363
	LDA #$7000				;$B29366
	STA PPU.vram_address			;$B29369
	LDA #$0000				;$B2936C
CODE_B2936F:
	TAX					;$B2936F
	SEP #$20				;$B29370
	LDA.l DATA_FC0000+$01,x			;$B29372
	ORA DATA_FC0000+$10,x			;$B29376
	XBA					;$B2937A
	LDA.l DATA_FC0000,x			;$B2937B
	EOR DATA_FC0000+$01,x			;$B2937F
	EOR DATA_FC0000+$11,x			;$B29383
	AND DATA_FC0000+$00,x			;$B29387
	REP #$20				;$B2938B
	STA PPU.vram_write			;$B2938D
	TXA					;$B29390
	CLC					;$B29391
	ADC #$0002				;$B29392
	BIT #$000E				;$B29395
	BNE CODE_B2936F				;$B29398
	CLC					;$B2939A
	ADC #$0010				;$B2939B
	TAX					;$B2939E
	CMP #$1000				;$B2939F
	BNE CODE_B2936F				;$B293A2
	LDA #$7400				;$B293A4
	STA PPU.vram_address			;$B293A7
	LDA #$0035				;$B293AA
	LDX #$0400				;$B293AD
CODE_B293B0:
	STA PPU.vram_write			;$B293B0
	DEX					;$B293B3
	BNE CODE_B293B0				;$B293B4
	LDA #$002D				;$B293B6
	LDX #$0004				;$B293B9
	LDY #$0000				;$B293BC
	JSL CODE_BB856D				;$B293BF
	LDA #$0000				;$B293C3
	LDX #$1D04				;$B293C6
	LDY language_select			;$B293C9
	BEQ CODE_B293DF				;$B293CC
	LDX #$1D04				;$B293CE
	LDA #$04DB				;$B293D1
	CPY #$0001				;$B293D4
	BEQ CODE_B293DF				;$B293D7
	LDX #$1E38				;$B293D9
	LDA #$09AC				;$B293DC
CODE_B293DF:
	STA $15E4				;$B293DF
	STX $15EC				;$B293E2
	LDA #CODE_B293EF			;$B293E5
	LDX.w #CODE_B293EF>>16			;$B293E8
	JML CODE_808003				;$B293EB

CODE_B293EF:
	LDA $04E4				;$B293EF
	STA CPU.enable_dma_hdma			;$B293F2
	LDA active_frame_counter		;$B293F5
	BIT #$0001				;$B293F7
	BEQ CODE_B2941D				;$B293FA
	LDA $1975				;$B293FC
	BIT #$000F				;$B293FF
	BNE CODE_B2941D				;$B29402
	LDA $1975				;$B29404
	CLC					;$B29407
	ADC #$00A0				;$B29408
	AND #$00F8				;$B2940B
	ASL					;$B2940E
	ASL					;$B2940F
	CLC					;$B29410
	ADC #$7406				;$B29411
	LDX $15E4				;$B29414
	JSR CODE_B294D3				;$B29417
	STX $15E4				;$B2941A
CODE_B2941D:
	LDA $1975				;$B2941D
	AND #$00F8				;$B29420
	ASL					;$B29423
	ASL					;$B29424
	CLC					;$B29425
	ADC #$7400				;$B29426
	STA PPU.vram_address			;$B29429
	LDX #$0020				;$B2942C
	LDA #$0035				;$B2942F
CODE_B29432:
	STA PPU.vram_write			;$B29432
	DEX					;$B29435
	BNE CODE_B29432				;$B29436
	JSL CODE_B38006				;$B29438
	JSL CODE_80801E				;$B2943C
	SEP #$20				;$B29440
	LDA screen_brightness			;$B29442
	STA PPU.screen				;$B29445
	REP #$20				;$B29448
	STZ $1560				;$B2944A
	STZ $155E				;$B2944D
	LDA active_frame_counter		;$B29450
	BIT #$0001				;$B29452
	BEQ CODE_B2945A				;$B29455
	INC $1975				;$B29457
CODE_B2945A:
	LDA $1975				;$B2945A
	SEC					;$B2945D
	SBC #$0010				;$B2945E
	STA $1A					;$B29461
	LDY #$0000				;$B29463
	LDX #$0000				;$B29466
	LDA active_frame_counter		;$B29469
	BIT #$0001				;$B2946B
	BEQ CODE_B29484				;$B2946E
CODE_B29470:
	LDA.l DATA_B2B080,x			;$B29470
	CLC					;$B29474
	ADC $1A					;$B29475
	STA $7EA15A,x				;$B29477
	INX					;$B2947B
	INX					;$B2947C
	CPX #$00A2				;$B2947D
	BNE CODE_B29470				;$B29480
	BRA CODE_B29496				;$B29482

CODE_B29484:
	LDA.l DATA_B2AFDE,x			;$B29484
	CLC					;$B29488
	ADC $1A					;$B29489
	STA $7EA15A,x				;$B2948B
	INX					;$B2948F
	INX					;$B29490
	CPX #$00A2				;$B29491
	BNE CODE_B29484				;$B29494
CODE_B29496:
	JSL sprite_handler			;$B29496
	JSL CODE_B7800C				;$B2949A
	JSL CODE_B7800F				;$B2949E
	JSL CODE_808012				;$B294A2
	JSR CODE_B28612				;$B294A6
	BEQ CODE_B294C3				;$B294A9
	LDA $F4					;$B294AB
	CMP $15EC				;$B294AD
	BNE CODE_B294BF				;$B294B0
	LDA #$880F				;$B294B2
	STA screen_brightness			;$B294B5
	LDA #$0003				;$B294B8
	JSL CODE_B2800F				;$B294BB
CODE_B294BF:
	JML CODE_808006				;$B294BF

CODE_B294C3:
	JSL CODE_80805D				;$B294C3
	STZ $BA					;$B294C7
	LDA #CODE_80805A			;$B294C9
	LDX.w #CODE_80805A>>16			;$B294CC
	JML CODE_808003				;$B294CF

CODE_B294D3:
	STA $1A					;$B294D3
	SEP #$20				;$B294D5
	LDA #$81				;$B294D7
	STA PPU.vram_control			;$B294D9
	REP #$20				;$B294DC
	LDA.l DATA_B2A126,x			;$B294DE
	AND #$00FF				;$B294E2
	BEQ CODE_B2950D				;$B294E5
	DEC					;$B294E7
	BEQ CODE_B29504				;$B294E8
	DEC					;$B294EA
	BEQ CODE_B294FB				;$B294EB
	DEC					;$B294ED
	BEQ CODE_B294F2				;$B294EE
	BRA CODE_B29518				;$B294F0

CODE_B294F2:
	LDA #$2800				;$B294F2
	STA $15E2				;$B294F5
	INX					;$B294F8
	BRA CODE_B29518				;$B294F9

CODE_B294FB:
	LDA #$2400				;$B294FB
	STA $15E2				;$B294FE
	INX					;$B29501
	BRA CODE_B29518				;$B29502

CODE_B29504:
	LDA #$2000				;$B29504
	STA $15E2				;$B29507
	INX					;$B2950A
	BRA CODE_B29518				;$B2950B

CODE_B2950D:
	SEP #$20				;$B2950D
	LDA #$80				;$B2950F
	STA PPU.vram_control			;$B29511
	REP #$20				;$B29514
	INX					;$B29516
	RTS					;$B29517

CODE_B29518:
	STX $1E					;$B29518
CODE_B2951A:
	LDA.l DATA_B2A126,x			;$B2951A
	INX					;$B2951E
	BIT #$0080				;$B2951F
	BEQ CODE_B2951A				;$B29522
	TXA					;$B29524
	SEC					;$B29525
	SBC $1E					;$B29526
	EOR #$FFFF				;$B29528
	CLC					;$B2952B
	ADC #$0014				;$B2952C
	LSR					;$B2952F
	ADC $1A					;$B29530
	STA $1A					;$B29532
	LDX $1E					;$B29534
CODE_B29536:
	LDA.l DATA_B2A126,x			;$B29536
	AND #$007F				;$B2953A
	CMP #$0020				;$B2953D
	BEQ CODE_B29560				;$B29540
	SEC					;$B29542
	SBC #$0021				;$B29543
	TXY					;$B29546
	TAX					;$B29547
	LDA.l DATA_B6F42C,x			;$B29548
	AND #$00FF				;$B2954C
	ASL					;$B2954F
	TYX					;$B29550
	LDY $1A					;$B29551
	STY PPU.vram_address			;$B29553
	ORA $15E2				;$B29556
	STA PPU.vram_write			;$B29559
	INC					;$B2955C
	STA PPU.vram_write			;$B2955D
CODE_B29560:
	LDA.l DATA_B2A126,x			;$B29560
	INX					;$B29564
	BIT #$0080				;$B29565
	BNE CODE_B2956E				;$B29568
	INC $1A					;$B2956A
	BRA CODE_B29536				;$B2956C

CODE_B2956E:
	SEP #$20				;$B2956E
	LDA #$80				;$B29570
	STA PPU.vram_control			;$B29572
	REP #$20				;$B29575
	RTS					;$B29577

CODE_B29578:
	PHK					;$B29578
	PLB					;$B29579
	LDA #CODE_808337			;$B2957A
	STA $52					;$B2957D
	LDA.w #CODE_808337>>16			;$B2957F
	STA $54					;$B29582
	JSL disable_screen_wrapper		;$B29584
	JSL CODE_808009				;$B29588
	JSL CODE_80801B				;$B2958C
	JSL CODE_80800C				;$B29590
	JSL CODE_BB857F				;$B29594
	JSR CODE_B28521				;$B29598
	LDA #$1D93				;$B2959B
	STA $0541				;$B2959E
	LDA #$000F				;$B295A1
	JSL CODE_BB859A				;$B295A4
	ORA #$3000				;$B295A8
	CLC					;$B295AB
	ADC #$01C0				;$B295AC
	STA $B4					;$B295AF
	LDA level_number			;$B295B1
	JSL CODE_BB85F4				;$B295B3
	LDA #$A000				;$B295B7
	TRB $0775				;$B295BA
	STZ $F4					;$B295BD
	STZ $BC					;$B295BF
	LDA #$0001				;$B295C1
	TRB $05AF				;$B295C4
	LDA #$0038				;$B295C7
	LDY #$0000				;$B295CA
	LDX #$0004				;$B295CD
	JSL CODE_BB856D				;$B295D0
	LDX #$0033				;$B295D4
	LDA current_game_mode			;$B295D7
	CMP #!gamemode_2_player_contest		;$B295DA
	BNE CODE_B295E9				;$B295DD
	LDA active_player			;$B295DF
	BEQ CODE_B295F4				;$B295E2
	LDX #$004E				;$B295E4
	BRA CODE_B295F4				;$B295E7

CODE_B295E9:
	LDA #$0040				;$B295E9
	BIT active_cheats			;$B295EC
	BEQ CODE_B295F4				;$B295EF
	LDX #$004E				;$B295F1
CODE_B295F4:
	STX $1A					;$B295F4
	LDA $075E				;$B295F6
	AND #$00FF				;$B295F9
	CMP #$0005				;$B295FC
	BNE CODE_B29604				;$B295FF
	LDA #$0002				;$B29601
CODE_B29604:
	STA $15E2				;$B29604
	CLC					;$B29607
	ADC $1A					;$B29608
	LDY #$0010				;$B2960A
	LDX #$001C				;$B2960D
	JSL CODE_BB856D				;$B29610
	LDA $15E2				;$B29614
	ASL					;$B29617
	TAX					;$B29618
	LDA DATA_B297F8-$02,x			;$B29619
	JSL vram_payload_handler_global		;$B2961C
	LDA #$0035				;$B29620
	JSL vram_payload_handler_global		;$B29623
	LDA #$002A				;$B29627
	JSL set_PPU_registers_global		;$B2962A
	LDY #$0208				;$B2962E
	JSL CODE_BB8588				;$B29631
	LDX alternate_sprite			;$B29635
	STZ $1D93				;$B29637
	STZ sprite.general_purpose_60,x		;$B2963A
	LDA #$FFFF				;$B2963C
	STA sprite.general_purpose_5E,x		;$B2963F
	LDA #$00A8				;$B29641
	STA sprite.y_position,x			;$B29644
	LDA #$0088				;$B29646
	STA sprite.x_position,x			;$B29649
	LDA $15E2				;$B2964B
	ASL					;$B2964E
	STA $1A					;$B2964F
	LDA language_select			;$B29651
	ASL					;$B29654
	ASL					;$B29655
	ASL					;$B29656
	CLC					;$B29657
	ADC $1A					;$B29658
	TAX					;$B2965A
	LDY DATA_B296EC-$02,x			;$B2965B
	LDA $0000,y				;$B2965E
	AND #$00FF				;$B29661
	STA $3E					;$B29664
	INY					;$B29666
	LDX #$FFE0				;$B29667
	JSR CODE_B29800				;$B2966A
	LDA $15E2				;$B2966D
	CMP #$0003				;$B29670
	BCC CODE_B2969B				;$B29673
	LDA $075F				;$B29675
	AND #$000F				;$B29678
	CLC					;$B2967B
	ADC #$0030				;$B2967C
	STA $22					;$B2967F
	LDA $075F				;$B29681
	AND #$00FF				;$B29684
	LSR					;$B29687
	LSR					;$B29688
	LSR					;$B29689
	LSR					;$B2968A
	CLC					;$B2968B
	ADC #$0030				;$B2968C
	XBA					;$B2968F
	ORA $22					;$B29690
	XBA					;$B29692
	LDX $3E					;$B29693
	BEQ CODE_B2969B				;$B29695
	STA $7EFFE0,x				;$B29697
CODE_B2969B:
	LDA #$0001				;$B2969B
	STA $04E4				;$B2969E
	LDA #$0010				;$B296A1
	SEP #$20				;$B296A4
	STA PPU.layer_1_scroll_y		;$B296A6
	XBA					;$B296A9
	STA PPU.layer_1_scroll_y		;$B296AA
	REP #$20				;$B296AD
	LDA $0765				;$B296AF
	AND #$003F				;$B296B2
	JSL play_song				;$B296B5
	LDA.l active_cheats			;$B296B9
	AND #$0001				;$B296BD
	BEQ CODE_B296CE				;$B296C0
	LDA $0765				;$B296C2
	SEC					;$B296C5
	SBC #$002A				;$B296C6
	STA $0765				;$B296C9
	STA $08					;$B296CC
CODE_B296CE:
	LDA #$0200				;$B296CE
	JSL CODE_808024				;$B296D1
	LDA #$1D93				;$B296D5
	STA $0541				;$B296D8
	LDA #CODE_808370			;$B296DB
	STA $4A					;$B296DE
	STA $4C					;$B296E0
	LDA #CODE_B298BA			;$B296E2
	LDX.w #CODE_B298BA>>16			;$B296E5
	JML CODE_808003				;$B296E8

;Bonus screen text
DATA_B296EC:
	dw DATA_B29704
	dw DATA_B29714
	dw DATA_B29727
	dw DATA_B2973A
	dw DATA_B2974C
	dw DATA_B2975F
	dw DATA_B29777
	dw DATA_B2978E
	dw DATA_B297A4
	dw DATA_B297B6
	dw DATA_B297CC
	dw DATA_B297DF

DATA_B29704:
	db $00
	db "FIND THE COIN!",$00

DATA_B29714:
	db $00
	db "BASH THE BADDIES!",$00

DATA_B29727:
	db $08
	db "COLLECT 00 STARS!",$00

DATA_B2973A:
	db $05
	db "GRAB 00 BANANAS!",$00

DATA_B2974C:
	db $00
	db "TROUVEZ LA PI&CE!",$00

DATA_B2975F:
	db $00
	db "D?TRUISEZ LES ENNEMIS!",$00

DATA_B29777:
	db $0A
	db "COLLECTEZ 00 ?TOILES!",$00

DATA_B2978E:
	db $09
	db "ATTRAPEZ 00 BANANES!",$00

DATA_B297A4:
	db $00
	db "FINDE DIE M:NZE!",$00

DATA_B297B6:
	db $00
	db "BESIEGE ALLE GEGNER!",$00

DATA_B297CC:
	db $07
	db "SAMMLE 00 STERNE!",$00

DATA_B297DF:
	db $0C
	db "SCHNAPP DIR 00 BANANEN!",$00

DATA_B297F8:
	dw $0033
	dw $0034
	dw $002C
	dw $0032

CODE_B29800:
	LDA $0000,y				;$B29800
CODE_B29803:
	STA $7E0000,x				;$B29803
	INX					;$B29807
	INY					;$B29808
	LDA $0000,y				;$B29809
	AND #$00FF				;$B2980C
	BNE CODE_B29803				;$B2980F
	STA $7E0000,x				;$B29811
	RTS					;$B29815

CODE_B29816:
	LDY $0541				;$B29816
	LDX $00,y				;$B29819
	BEQ CODE_B29888				;$B2981B
	PHK					;$B2981D
	PLB					;$B2981E
	LDY $1E,x				;$B2981F
	LDA $5C,x				;$B29821
	LSR					;$B29823
	STA $3A					;$B29824
	ROL					;$B29826
	ASL					;$B29827
	ASL					;$B29828
	STA $3E					;$B29829
	LDA active_frame_counter		;$B2982B
	STA $1A					;$B2982D
	LDA $12,x				;$B2982F
	SEC					;$B29831
	SBC $3E					;$B29832
	AND #$00FF				;$B29834
	XBA					;$B29837
	ORA $16,x				;$B29838
	XBA					;$B2983A
	LDX next_oam_slot			;$B2983B
	STA $1E					;$B2983D
	JSR CODE_B29889				;$B2983F
CODE_B29842:
	STA $00,x				;$B29842
	STY $02,x				;$B29844
	INY					;$B29846
	INY					;$B29847
	LDA $1E					;$B29848
	CLC					;$B2984A
	ADC #$0010				;$B2984B
	STA $1E					;$B2984E
	TYA					;$B29850
	AND #$000F				;$B29851
	BNE CODE_B2985C				;$B29854
	TYA					;$B29856
	CLC					;$B29857
	ADC #$0010				;$B29858
	TAY					;$B2985B
CODE_B2985C:
	PHX					;$B2985C
	PHY					;$B2985D
	TXA					;$B2985E
	AND #$01FF				;$B2985F
	PHA					;$B29862
	LSR					;$B29863
	LSR					;$B29864
	LSR					;$B29865
	LSR					;$B29866
	CLC					;$B29867
	ADC #$0400				;$B29868
	TAX					;$B2986B
	PLA					;$B2986C
	AND #$000F				;$B2986D
	LSR					;$B29870
	TAY					;$B29871
	LDA DATA_B298A2,y			;$B29872
	ORA $00,x				;$B29875
	STA $00,x				;$B29877
	JSR CODE_B29889				;$B29879
	PLY					;$B2987C
	PLX					;$B2987D
	INX					;$B2987E
	INX					;$B2987F
	INX					;$B29880
	INX					;$B29881
	DEC $3A					;$B29882
	BNE CODE_B29842				;$B29884
	STX next_oam_slot			;$B29886
CODE_B29888:
	RTL					;$B29888

CODE_B29889:
	STX $20					;$B29889
	LDA $1A					;$B2988B
	INC $1A					;$B2988D
	INC $1A					;$B2988F
	AND #$000F				;$B29891
	TAX					;$B29894
	LDA DATA_B298AA,x			;$B29895
	AND #$00FF				;$B29898
	XBA					;$B2989B
	CLC					;$B2989C
	ADC $1E					;$B2989D
	LDX $20					;$B2989F
	RTS					;$B298A1

DATA_B298A2:
	dw $0002
	dw $0008
	dw $0020
	dw $0080

DATA_B298AA:
	dw $0100
	dw $0302
	dw $0303
	dw $0102
	dw $FF00
	dw $FDFE
	dw $FDFD
	dw $FFFE

CODE_B298BA:
	LDA $04E4				;$B298BA
	STA CPU.enable_dma_hdma			;$B298BD
	JSL CODE_B38006				;$B298C0
	JSL CODE_80801E				;$B298C4
	SEP #$20				;$B298C8
	LDA screen_brightness			;$B298CA
	STA PPU.screen				;$B298CD
	REP #$20				;$B298D0
	STZ $1560				;$B298D2
	STZ $155E				;$B298D5
	LDA screen_brightness			;$B298D8
	BIT #$FF00				;$B298DB
	BNE CODE_B298F6				;$B298DE
	JSL CODE_808015				;$B298E0
	LDA player_active_pressed		;$B298E4
	BIT #$9080				;$B298E7
	BEQ CODE_B298F6				;$B298EA
	JSR CODE_B28603				;$B298EC
	LDA #$0001				;$B298EF
	JSL CODE_B2800F				;$B298F2
CODE_B298F6:
	JSL sprite_handler			;$B298F6
	LDA #$1D93				;$B298FA
	STA $0541				;$B298FD
	LDY #$01CC				;$B29900
	LDA active_cheats			;$B29903
	AND #$0001				;$B29906
	BNE CODE_B2990E				;$B29909
	LDY #$025D				;$B2990B
CODE_B2990E:
	CPY $F4					;$B2990E
	BCS CODE_B2992C				;$B29910
	JSR CODE_B28603				;$B29912
	LDA #$0001				;$B29915
	TSB $05AF				;$B29918
	BNE CODE_B2992C				;$B2991B
	LDA active_cheats			;$B2991D
	AND #$0001				;$B29920
	BNE CODE_B2992C				;$B29923
	LDA #$0001				;$B29925
	JSL CODE_B2800F				;$B29928
CODE_B2992C:
	JSL CODE_B7800C				;$B2992C
	JSL CODE_B29816				;$B29930
	JSL CODE_808012				;$B29934
	JSR CODE_B28612				;$B29938
	BEQ CODE_B29941				;$B2993B
	JML CODE_808006				;$B2993D

CODE_B29941:
	LDX #CODE_808493			;$B29941
	LDY.w #CODE_808493>>16			;$B29944
	STX $4E					;$B29947
	STY $50					;$B29949
	LDA #CODE_808348			;$B2994B
	JML set_and_wait_for_nmi		;$B2994E

CODE_B29952:
	PHK					;$B29952
	PLB					;$B29953
	LDA #CODE_808337			;$B29954
	STA $52					;$B29957
	LDA.w #CODE_808337>>16			;$B29959
	STA $54					;$B2995C
	JSR CODE_B28521				;$B2995E
	JSL disable_screen_wrapper		;$B29961
	JSL CODE_808009				;$B29965
	JSL CODE_80800C				;$B29969
	JSL CODE_80801B				;$B2996D
	JSL CODE_BB857F				;$B29971
	LDA #!music_mama_bird			;$B29975
	JSL play_song				;$B29978
	LDA #$0047				;$B2997C
	LDY #$0000				;$B2997F
	LDX #$0020				;$B29982
	JSL CODE_BB856D				;$B29985
	LDA #$0037				;$B29989
	JSL vram_payload_handler_global		;$B2998C
	LDA #$0030				;$B29990
	JSL set_PPU_registers_global		;$B29993
	LDA #$FFFF				;$B29997
	STA sprite_vram_allocation_table	;$B2999A
	STA $06DA				;$B2999D
	LDA #$4000				;$B299A0
	STA $073C				;$B299A3
	JSL CODE_80807E				;$B299A6
	JSR CODE_B29CED				;$B299AA
	LDY #$0328				;$B299AD
	JSL CODE_BB8585				;$B299B0
	LDX alternate_sprite			;$B299B4
	STX $1C3F				;$B299B6
	JSL CODE_808081				;$B299B9
	LDY #$0326				;$B299BD
	JSL CODE_BB85B5				;$B299C0
	LDY #$032C				;$B299C4
	JSL CODE_BB85B5				;$B299C7
	JSR CODE_B29D51				;$B299CB
	SEP #$20				;$B299CE
	LDX #$1102				;$B299D0
	STX HDMA[$01].settings			;$B299D3
	LDX #$A174				;$B299D6
	STX HDMA[$01].source_word		;$B299D9
	LDA #$7E				;$B299DC
	STA HDMA[$01].source_bank		;$B299DE
	STZ HDMA[$01].indirect_source_bank	;$B299E1
	LDX #$1202				;$B299E4
	STX HDMA[$02].settings			;$B299E7
	LDX #$A16A				;$B299EA
	STX HDMA[$02].source_word		;$B299ED
	LDA #$7E				;$B299F0
	STA HDMA[$02].source_bank		;$B299F2
	STZ HDMA[$02].indirect_source_bank	;$B299F5
	LDX #$3000				;$B299F8
	STX HDMA[$03].settings			;$B299FB
	LDX #$A1DA				;$B299FE
	STX HDMA[$03].source_word		;$B29A01
	LDA #$7E				;$B29A04
	STA HDMA[$03].source_bank		;$B29A06
	STA HDMA[$03].indirect_source_bank	;$B29A09
	LDX #$2641				;$B29A0C
	STX HDMA[$07].settings			;$B29A0F
	LDX #$A25A				;$B29A12
	STX HDMA[$07].source_word		;$B29A15
	LDA #$7E				;$B29A18
	STA HDMA[$07].source_bank		;$B29A1A
	STA HDMA[$07].indirect_source_bank	;$B29A1D
	REP #$20				;$B29A20
	LDA #$0001				;$B29A22
	STA $1C49				;$B29A25
	LDA #$003F				;$B29A28
	STA $1C4B				;$B29A2B
	LDA #$00FF				;$B29A2E
	STA $7EA25A				;$B29A31
	STA $7EA25D				;$B29A35
	LDA #$A47A				;$B29A39
	STA $7EA25B				;$B29A3C
	LDA #$A578				;$B29A40
	STA $7EA25E				;$B29A43
	LDA #$0000				;$B29A47
	STA $7EA260				;$B29A4A
	LDA #$0001				;$B29A4E
	STA $7EA45A				;$B29A51
	LDX #$A45A				;$B29A55
	LDY #$A45C				;$B29A58
	LDA #$01E0				;$B29A5B
	MVN $7E, $7E				;$B29A5E
	LDX #DATA_B29EDA			;$B29A61
	LDY #$A16A				;$B29A64
	LDA #$001D				;$B29A67
	MVN $7E, $B2				;$B29A6A
	PHK					;$B29A6D
	PLB					;$B29A6E
	LDA #$8E01				;$B29A6F
	STA $04E4				;$B29A72
	LDY #$0324				;$B29A75
	JSL CODE_BB85B5				;$B29A78
	LDX alternate_sprite			;$B29A7C
	STX $1C41				;$B29A7E
	STZ $20					;$B29A81
	STZ $1E					;$B29A83
	STZ $1C					;$B29A85
	LDA #$0014				;$B29A87
	STA $1C45				;$B29A8A
	JSL CODE_B78027				;$B29A8D
	STZ $1C3B				;$B29A91
	STZ $1C37				;$B29A94
	LDA #$0060				;$B29A97
	STA $1C39				;$B29A9A
	LDA #$000F				;$B29A9D
	JSL CODE_BB859A				;$B29AA0
	ORA #$3000				;$B29AA4
	CLC					;$B29AA7
	ADC #$01C0				;$B29AA8
	STA $B4					;$B29AAB
	JSL CODE_80801E				;$B29AAD
	JSL CODE_80801E				;$B29AB1
	JSL CODE_80801E				;$B29AB5
	JSL CODE_80801E				;$B29AB9
	LDA #$0200				;$B29ABD
	JSL CODE_808024				;$B29AC0
	LDA #$0200				;$B29AC4
	STA DMA[0].source_word			;$B29AC7
	STA DMA[0].unused_2			;$B29ACA
	LDA #$0220				;$B29ACD
	STA DMA[0].size				;$B29AD0
	LDA #$0400				;$B29AD3
	STA DMA[0].settings			;$B29AD6
	SEP #$20				;$B29AD9
	STZ DMA[0].source_bank			;$B29ADB
	LDA #$01				;$B29ADE
	STA CPU.enable_dma			;$B29AE0
	REP #$20				;$B29AE3
	LDA #CODE_B29AEF			;$B29AE5
	LDX.w #CODE_B29AEF>>16			;$B29AE8
	JML CODE_808003				;$B29AEB

CODE_B29AEF:
	LDA $04E4				;$B29AEF
	STA CPU.enable_dma_hdma			;$B29AF2
	JSL CODE_B38006				;$B29AF5
	JSL CODE_80801E				;$B29AF9
	JSR CODE_B29D64				;$B29AFD
	LDA #$0001				;$B29B00
	TRB $1C35				;$B29B03
	BEQ CODE_B29B13				;$B29B06
	LDA $15E8				;$B29B08
	CMP #$0002				;$B29B0B
	BCS CODE_B29B13				;$B29B0E
	JSR CODE_B29F14				;$B29B10
CODE_B29B13:
	SEP #$20				;$B29B13
	LDA screen_brightness			;$B29B15
	STA PPU.screen				;$B29B18
	REP #$20				;$B29B1B
	STZ $1560				;$B29B1D
	STZ $155E				;$B29B20
	JSR CODE_B29BC1				;$B29B23
	LDA screen_brightness			;$B29B26
	BIT #$FF00				;$B29B29
	BNE CODE_B29B32				;$B29B2C
	JSL CODE_808015				;$B29B2E
CODE_B29B32:
	JSR CODE_B29EFA				;$B29B32
	JSR CODE_B29BA4				;$B29B35
	LDA $1C39				;$B29B38
	BEQ CODE_B29B4A				;$B29B3B
	DEC $1C39				;$B29B3D
	BNE CODE_B29B4A				;$B29B40
	LDA $1C37				;$B29B42
	ASL					;$B29B45
	TAX					;$B29B46
	JSR (DATA_B29FCA,x)			;$B29B47
CODE_B29B4A:
	JSR CODE_B2A10A				;$B29B4A
	JSL sprite_handler			;$B29B4D
	JSL CODE_B7800C				;$B29B51
	JSL CODE_B7800F				;$B29B55
	JSL CODE_808012				;$B29B59
	JSR CODE_B28612				;$B29B5D
	BEQ CODE_B29B66				;$B29B60
	JML CODE_808006				;$B29B62

CODE_B29B66:
	LDA #$0002				;$B29B66
	BIT $1C35				;$B29B69
	BEQ CODE_B29B93				;$B29B6C
	LDA #$0040				;$B29B6E
	TRB $05FB				;$B29B71
	LDA #$0001				;$B29B74
	STA $0523				;$B29B77
	LDA #$0001				;$B29B7A
	STA $052F				;$B29B7D
	STZ active_frame_counter		;$B29B80
	LDX #CODE_808069			;$B29B82
	LDY.w #CODE_808069>>16			;$B29B85
	STX $4E					;$B29B88
	STY $50					;$B29B8A
	LDA #CODE_808362			;$B29B8C
	JML set_and_wait_for_nmi		;$B29B8F

CODE_B29B93:
	LDX #CODE_B48009			;$B29B93
	LDY.w #CODE_B48009>>16			;$B29B96
	STX $4E					;$B29B99
	STY $50					;$B29B9B
	LDA #CODE_808362			;$B29B9D
	JML set_and_wait_for_nmi		;$B29BA0

CODE_B29BA4:
	LDA $15E8				;$B29BA4
	CMP #$01A8				;$B29BA7
	BNE CODE_B29BB4				;$B29BAA
	LDA #$074F				;$B29BAC
	JSL queue_sound_effect			;$B29BAF
	RTS					;$B29BB3

CODE_B29BB4:
	CMP #$01A2				;$B29BB4
	BNE CODE_B29BC0				;$B29BB7
	LDA #$050E				;$B29BB9
	JSL queue_sound_effect			;$B29BBC
CODE_B29BC0:
	RTS					;$B29BC0

CODE_B29BC1:
	LDA $1C49				;$B29BC1
	BEQ CODE_B29BC9				;$B29BC4
	JSR CODE_B29BCE				;$B29BC6
CODE_B29BC9:
	RTS					;$B29BC9

CODE_B29BCA:
	JSR CODE_B29BCE				;$B29BCA
	RTL					;$B29BCD

CODE_B29BCE:
	BEQ CODE_B29C14				;$B29BCE
	STA $1C					;$B29BD0
	STZ $1A					;$B29BD2
	LDA #$0001				;$B29BD4
	SEC					;$B29BD7
	SBC $1C					;$B29BD8
	STA $1E					;$B29BDA
	JSR CODE_B29C15				;$B29BDC
	JSR CODE_B29C56				;$B29BDF
CODE_B29BE2:
	LDA $1E					;$B29BE2
	BPL CODE_B29BF6				;$B29BE4
	LDA $1A					;$B29BE6
	ASL					;$B29BE8
	CLC					;$B29BE9
	ADC #$0003				;$B29BEA
	CLC					;$B29BED
	ADC $1E					;$B29BEE
	STA $1E					;$B29BF0
	INC $1A					;$B29BF2
	BRA CODE_B29C09				;$B29BF4

CODE_B29BF6:
	LDA $1A					;$B29BF6
	SEC					;$B29BF8
	SBC $1C					;$B29BF9
	ASL					;$B29BFB
	CLC					;$B29BFC
	ADC $1E					;$B29BFD
	CLC					;$B29BFF
	ADC #$0005				;$B29C00
	STA $1E					;$B29C03
	INC $1A					;$B29C05
	DEC $1C					;$B29C07
CODE_B29C09:
	JSR CODE_B29C56				;$B29C09
	LDA $1A					;$B29C0C
	CMP $1C					;$B29C0E
	BEQ CODE_B29BE2				;$B29C10
	BCC CODE_B29BE2				;$B29C12
CODE_B29C14:
	RTS					;$B29C14

CODE_B29C15:
	LDA $1C					;$B29C15
	CLC					;$B29C17
	ADC #$0081				;$B29C18
	ASL					;$B29C1B
	TAX					;$B29C1C
	BPL CODE_B29C22				;$B29C1D
	LDX #$0000				;$B29C1F
CODE_B29C22:
	CPX #$01E0				;$B29C22
	BCC CODE_B29C2A				;$B29C25
	LDX #$01E0				;$B29C27
CODE_B29C2A:
	LDA #$00FF				;$B29C2A
	STA $7EA45A,x				;$B29C2D
	STA $7EA45C,x				;$B29C31
	LDA #$007F				;$B29C35
	SEC					;$B29C38
	SBC $1C					;$B29C39
	ASL					;$B29C3B
	TAX					;$B29C3C
	BPL CODE_B29C42				;$B29C3D
	LDX #$0000				;$B29C3F
CODE_B29C42:
	CPX #$01E0				;$B29C42
	BCC CODE_B29C4A				;$B29C45
	LDX #$01E0				;$B29C47
CODE_B29C4A:
	LDA #$00FF				;$B29C4A
	STA $7EA45A,x				;$B29C4D
	STA $7EA458,x				;$B29C51
	RTS					;$B29C55

CODE_B29C56:
	LDA $1C					;$B29C56
	CLC					;$B29C58
	ADC #$0080				;$B29C59
	ASL					;$B29C5C
	TAX					;$B29C5D
	JSR CODE_B29C83				;$B29C5E
	LDA #$0080				;$B29C61
	SEC					;$B29C64
	SBC $1C					;$B29C65
	ASL					;$B29C67
	TAX					;$B29C68
	JSR CODE_B29C83				;$B29C69
	LDA $1A					;$B29C6C
	CLC					;$B29C6E
	ADC #$0080				;$B29C6F
	ASL					;$B29C72
	TAX					;$B29C73
	JSR CODE_B29CB8				;$B29C74
	LDA #$0080				;$B29C77
	SEC					;$B29C7A
	SBC $1A					;$B29C7B
	ASL					;$B29C7D
	TAX					;$B29C7E
	JSR CODE_B29CB8				;$B29C7F
	RTS					;$B29C82

CODE_B29C83:
	BPL CODE_B29C88				;$B29C83
	LDX #$0000				;$B29C85
CODE_B29C88:
	CPX #$01E0				;$B29C88
	BCC CODE_B29C90				;$B29C8B
	LDX #$01E0				;$B29C8D
CODE_B29C90:
	LDA $1A					;$B29C90
	CLC					;$B29C92
	ADC #$0080				;$B29C93
	CMP #$0100				;$B29C96
	BCC CODE_B29C9E				;$B29C99
	LDA #$00FF				;$B29C9B
CODE_B29C9E:
	SEP #$20				;$B29C9E
	STA $7EA45B,x				;$B29CA0
	REP #$20				;$B29CA4
	LDA #$0080				;$B29CA6
	SEC					;$B29CA9
	SBC $1A					;$B29CAA
	BPL CODE_B29CAF				;$B29CAC
	TDC					;$B29CAE
CODE_B29CAF:
	SEP #$20				;$B29CAF
	STA $7EA45A,x				;$B29CB1
	REP #$20				;$B29CB5
	RTS					;$B29CB7

CODE_B29CB8:
	BPL CODE_B29CBD				;$B29CB8
	LDX #$0000				;$B29CBA
CODE_B29CBD:
	CPX #$01E0				;$B29CBD
	BCC CODE_B29CC5				;$B29CC0
	LDX #$01E0				;$B29CC2
CODE_B29CC5:
	LDA $1C					;$B29CC5
	CLC					;$B29CC7
	ADC #$0080				;$B29CC8
	CMP #$0100				;$B29CCB
	BCC CODE_B29CD3				;$B29CCE
	LDA #$00FF				;$B29CD0
CODE_B29CD3:
	SEP #$20				;$B29CD3
	STA $7EA45B,x				;$B29CD5
	REP #$20				;$B29CD9
	LDA #$0080				;$B29CDB
	SEC					;$B29CDE
	SBC $1C					;$B29CDF
	BPL CODE_B29CE4				;$B29CE1
	TDC					;$B29CE3
CODE_B29CE4:
	SEP #$20				;$B29CE4
	STA $7EA45A,x				;$B29CE6
	REP #$20				;$B29CEA
	RTS					;$B29CEC

CODE_B29CED:
	JSL CODE_B8806F				;$B29CED
	LDA current_kong			;$B29CF1
	JSL CODE_B8805A				;$B29CF4
	LDA $05AF				;$B29CF8
	BIT #$4000				;$B29CFB
	BNE CODE_B29D08				;$B29CFE
	LDX follower_kong_sprite		;$B29D00
	LDA #$C000				;$B29D03
	STA sprite.visibility,x			;$B29D06
CODE_B29D08:
	JSR CODE_B29D0C				;$B29D08
	RTS					;$B29D0B

CODE_B29D0C:
	LDX active_kong_sprite			;$B29D0C
	LDY #DATA_B29D41			;$B29D0F
	JSR CODE_B29D1B				;$B29D12
	LDX follower_kong_sprite		;$B29D15
	LDY #DATA_B29D49			;$B29D18
CODE_B29D1B:
	LDA $0000,y				;$B29D1B
	STA sprite.x_position,x			;$B29D1E
	LDA $0002,y				;$B29D20
	STA sprite.y_position,x			;$B29D23
	LDA $0004,y				;$B29D25
	STA sprite.general_purpose_5E,x		;$B29D28
	LDA $0006,y				;$B29D2A
	STA sprite.render_order,x		;$B29D2D
	LDA #$FEC8				;$B29D2F
	STA sprite.max_x_speed,x		;$B29D32
	STA sprite.x_speed,x			;$B29D34
	LDA #$FF90				;$B29D36
	STA sprite.y_speed,x			;$B29D39
	LDA #!kong_state_04			;$B29D3B
	STA sprite.state,x			;$B29D3E
	RTS					;$B29D40

DATA_B29D41:
	dw $0120
	dw $00B2
	dw $00C1
	dw $00D8

DATA_B29D49:
	dw $0140
	dw $00B8
	dw $00E1
	dw $00E4

CODE_B29D51:
	LDA #$0240				;$B29D51
	STA $7EA1DA				;$B29D54
	STA $7EA1DC				;$B29D58
	LDA #$0001				;$B29D5C
	STA $7EA1DE				;$B29D5F
	RTS					;$B29D63

CODE_B29D64:
	LDA $15E8				;$B29D64
	BEQ CODE_B29DB9				;$B29D67
	CMP #$0180				;$B29D69
	BCC CODE_B29DB9				;$B29D6C
	BNE CODE_B29D83				;$B29D6E
	LDA #$8001				;$B29D70
	STA $04E4				;$B29D73
	RTS					;$B29D76

CODE_B29D77:
	LDA #$0E01				;$B29D77
	STA $04E4				;$B29D7A
	STZ $15E8				;$B29D7D
	JMP CODE_B29EB8				;$B29D80

CODE_B29D83:
	CMP #$0181				;$B29D83
	BNE CODE_B29D8E				;$B29D86
	JSR CODE_B29E9F				;$B29D88
	STZ active_frame_counter		;$B29D8B
	RTS					;$B29D8D

CODE_B29D8E:
	CMP #$01C0				;$B29D8E
	BCS CODE_B29D77				;$B29D91
	LDA $1C4B				;$B29D93
	DEC					;$B29D96
	BMI CODE_B29DA9				;$B29D97
	STA $1C4B				;$B29D99
	AND #$001F				;$B29D9C
	ORA #$00E0				;$B29D9F
	SEP #$20				;$B29DA2
	STA PPU.fixed_color			;$B29DA4
	REP #$20				;$B29DA7
CODE_B29DA9:
	LDA $1C49				;$B29DA9
	CLC					;$B29DAC
	ADC #$0006				;$B29DAD
	CMP #$00A8				;$B29DB0
	BCS CODE_B29DB8				;$B29DB3
	STA $1C49				;$B29DB5
CODE_B29DB8:
	RTS					;$B29DB8

CODE_B29DB9:
	LDA $15E6				;$B29DB9
	BEQ CODE_B29DD8				;$B29DBC
	LDA $15E4				;$B29DBE
	CMP #$0100				;$B29DC1
	BPL CODE_B29DD8				;$B29DC4
	JSL CODE_808018				;$B29DC6
	AND #$0003				;$B29DCA
	DEC					;$B29DCD
	CLC					;$B29DCE
	ADC $15E4				;$B29DCF
	BPL CODE_B29DD5				;$B29DD2
	TDC					;$B29DD4
CODE_B29DD5:
	STA $15E4				;$B29DD5
CODE_B29DD8:
	LDA $15E4				;$B29DD8
	CMP #$0080				;$B29DDB
	BPL CODE_B29DE3				;$B29DDE
	LDA #$0080				;$B29DE0
CODE_B29DE3:
	CMP #$009F				;$B29DE3
	BMI CODE_B29DEB				;$B29DE6
	LDA #$009F				;$B29DE8
CODE_B29DEB:
	AND #$001F				;$B29DEB
	EOR #$001F				;$B29DEE
	STA $1E					;$B29DF1
	SEP #$20				;$B29DF3
	LDA #$71				;$B29DF5
	STA PPU.cgram_address			;$B29DF7
	REP #$20				;$B29DFA
	LDX #$0000				;$B29DFC
CODE_B29DFF:
	LDA.l DATA_B29E81,x			;$B29DFF
	SEC					;$B29E03
	SBC $1E					;$B29E04
	BPL CODE_B29E0B				;$B29E06
	LDA #$0000				;$B29E08
CODE_B29E0B:
	STA $1C					;$B29E0B
	ASL					;$B29E0D
	ASL					;$B29E0E
	XBA					;$B29E0F
	TSB $1C					;$B29E10
	XBA					;$B29E12
	ASL					;$B29E13
	ASL					;$B29E14
	ASL					;$B29E15
	ORA $1C					;$B29E16
	SEP #$20				;$B29E18
	STA PPU.cgram_write			;$B29E1A
	XBA					;$B29E1D
	STA PPU.cgram_write			;$B29E1E
	REP #$20				;$B29E21
	INX					;$B29E23
	INX					;$B29E24
	CPX #$001E				;$B29E25
	BNE CODE_B29DFF				;$B29E28
	LDA $15E4				;$B29E2A
	CMP #$005A				;$B29E2D
	BCC CODE_B29E35				;$B29E30
	LDA #$005A				;$B29E32
CODE_B29E35:
	EOR #$FFFF				;$B29E35
	SEC					;$B29E38
	ADC #$005C				;$B29E39
	STA $1A					;$B29E3C
	EOR #$00FF				;$B29E3E
	SEC					;$B29E41
	SBC #$006D				;$B29E42
	LSR					;$B29E45
	SEP #$20				;$B29E46
	STA $7EA1DA				;$B29E48
	STA $7EA1DC				;$B29E4C
	REP #$20				;$B29E50
	SEP #$20				;$B29E52
	LDA $1A					;$B29E54
	STA PPU.layer_2_scroll_y		;$B29E56
	STZ PPU.layer_2_scroll_y		;$B29E59
	REP #$20				;$B29E5C
	LDA $15E8				;$B29E5E
	BIT #$FF00				;$B29E61
	BEQ CODE_B29E80				;$B29E64
	SEP #$20				;$B29E66
	LDA #$81				;$B29E68
	STA PPU.cgram_address			;$B29E6A
	LDY #$001E				;$B29E6D
	LDX #$0000				;$B29E70
CODE_B29E73:
	LDA $7E3180,x				;$B29E73
	STA PPU.cgram_write			;$B29E77
	INX					;$B29E7A
	DEY					;$B29E7B
	BNE CODE_B29E73				;$B29E7C
	REP #$20				;$B29E7E
CODE_B29E80:
	RTS					;$B29E80

;CGRAM related
DATA_B29E81:
	dw $0002
	dw $0004
	dw $0006
	dw $0008
	dw $000A
	dw $000D
	dw $000F
	dw $0011
	dw $0013
	dw $0015
	dw $0017
	dw $0019
	dw $001B
	dw $001D
	dw $001F

CODE_B29E9F:
	LDA.w #$8000				;$B29E9F
	TSB.w $04E4				;$B29EA2
	LDA.w #$3322				;$B29EA5
	STA.w PPU.color_math			;$B29EA8
	LDA.w #$0013				;$B29EAB
	STA.w PPU.screens			;$B29EAE
	LDA.w #$0030				;$B29EB1
	STA.w PPU.set_window_sprite_color	;$B29EB4
	RTS					;$B29EB7

CODE_B29EB8:
	STZ.w $1C49				;$B29EB8
	LDA.w #$1100				;$B29EBB
	STA.w PPU.color_math			;$B29EBE
	LDA.w #$2011				;$B29EC1
	STA.w PPU.set_color_math		;$B29EC4
	LDA.w #$0213				;$B29EC7
	STA.w PPU.screens			;$B29ECA
	STZ.w PPU.set_window_sprite_color	;$B29ECD
	SEP.b #$20				;$B29ED0
	LDA.b #$E0				;$B29ED2
	STA.w PPU.fixed_color			;$B29ED4
	REP.b #$20				;$B29ED7
	RTS					;$B29ED9

DATA_B29EDA:
	dw $007F,$2100,$0000,$0040,$0000,$007F,$3800,$0000
	dw $003C,$0800,$0000,$0008,$0800,$0000,$0008,$0000

CODE_B29EFA:
	LDX $1C41				;$B29EFA
	LDA $16,x				;$B29EFD
	CLC					;$B29EFF
	ADC #$000A				;$B29F00
	STA $7EA171				;$B29F03
	EOR #$FFFF				;$B29F07
	INC					;$B29F0A
	CLC					;$B29F0B
	ADC #$0043				;$B29F0C
	STA $7EA174				;$B29F0F
	RTS					;$B29F13

CODE_B29F14:
	LDA #$0217				;$B29F14
	STA PPU.screens				;$B29F17
	LDX #$72E0				;$B29F1A
	STX PPU.vram_address			;$B29F1D
	LDA #$F5C0				;$B29F20
	STA DMA[0].source_word			;$B29F23
	STA DMA[0].unused_2			;$B29F26
	LDA #$0100				;$B29F29
	STA DMA[0].size				;$B29F2C
	LDA #$1801				;$B29F2F
	STA DMA[0].settings			;$B29F32
	SEP #$20				;$B29F35
	LDA #$7E				;$B29F37
	STA DMA[0].source_bank			;$B29F39
	LDA #$01				;$B29F3C
	STA CPU.enable_dma			;$B29F3E
	REP #$20				;$B29F41
	RTS					;$B29F43

CODE_B29F44:
	JSL CODE_80806F				;$B29F44
	LDA #$2000				;$B29F48
	STA $20					;$B29F4B
	JSR CODE_B29F63				;$B29F4D
	LDX $1C3F				;$B29F50
	STX current_sprite			;$B29F53
	LDA #$0346				;$B29F55
	JSL set_sprite_animation		;$B29F58
	LDA #$0001				;$B29F5C
	TSB $1C35				;$B29F5F
	RTS					;$B29F62

CODE_B29F63:
	LDA #$007E				;$B29F63
	STA $44					;$B29F66
	LDA #$F580				;$B29F68
	STA $42					;$B29F6B
	LDA $7EA7BA,x				;$B29F6D
	CLC					;$B29F71
	ADC #$A9DE				;$B29F72
	TAX					;$B29F75
	JSL CODE_B48003				;$B29F76
	JSR CODE_B29F96				;$B29F7A
	RTS					;$B29F7D

CODE_B29F7E:
	STA $1A					;$B29F7E
	LDA $7EA7BA,x				;$B29F80
	TAX					;$B29F84
CODE_B29F85:
	INX					;$B29F85
	LDA $7EA9DE,x				;$B29F86
	CMP #$3030				;$B29F8A
	BNE CODE_B29F85				;$B29F8D
	LDA $1A					;$B29F8F
	STA $7EA9DE,x				;$B29F91
	RTS					;$B29F95

CODE_B29F96:
	STZ $1C					;$B29F96
	STZ $1E					;$B29F98
	LDA #$FFC0				;$B29F9A
	STA $7EA171				;$B29F9D
	LDA $7E0000,x				;$B29FA1
	AND #$00FF				;$B29FA5
	STA $1C47				;$B29FA8
	CMP #$0005				;$B29FAB
	BCC CODE_B29FB4				;$B29FAE
	LDA #$0001				;$B29FB0
	DEX					;$B29FB3
CODE_B29FB4:
	STA $1A					;$B29FB4
	LDA #$0005				;$B29FB6
	SEC					;$B29FB9
	SBC $1A					;$B29FBA
	XBA					;$B29FBC
	LSR					;$B29FBD
	LSR					;$B29FBE
	CLC					;$B29FBF
	ADC $42					;$B29FC0
	STA $42					;$B29FC2
	TAY					;$B29FC4
	JSL CODE_B48006				;$B29FC5
	RTS					;$B29FC9

DATA_B29FCA:
	dw CODE_B29FD4
	dw CODE_B2A024
	dw CODE_B2A067
	dw CODE_B2A0C6
	dw CODE_B2A0DD

CODE_B29FD4:
	LDA banana_bird_count			;$B29FD4
	CMP #$000F				;$B29FD7
	BEQ CODE_B2A001				;$B29FDA
	LDA #$0010				;$B29FDC
	BIT $05FD				;$B29FDF
	BNE CODE_B2A024				;$B29FE2
	LDA $1C3B				;$B29FE4
	CMP #$000C				;$B29FE7
	BEQ CODE_B2A014				;$B29FEA
	CLC					;$B29FEC
	ADC #$0000				;$B29FED
	TAX					;$B29FF0
	INC $1C3B				;$B29FF1
	INC $1C3B				;$B29FF4
	JSR CODE_B29F44				;$B29FF7
	LDA #$0180				;$B29FFA
	STA $1C39				;$B29FFD
	RTS					;$B2A000

CODE_B2A001:
	LDA #$0010				;$B2A001
	TSB $05FD				;$B2A004
	STZ $1C3B				;$B2A007
	LDA #$0002				;$B2A00A
	STA $1C37				;$B2A00D
	INC $1C39				;$B2A010
	RTS					;$B2A013

CODE_B2A014:
	LDA #$0010				;$B2A014
	TSB $05FD				;$B2A017
	LDA #$0003				;$B2A01A
	STA $1C37				;$B2A01D
	INC $1C39				;$B2A020
	RTS					;$B2A023

CODE_B2A024:
	LDA #$000F				;$B2A024
	SEC					;$B2A027
	SBC banana_bird_count			;$B2A028
	STA CPU.dividen_low			;$B2A02B
	LDA #$000A				;$B2A02E
	STA CPU.divisor				;$B2A031
	LDY #$0000				;$B2A034
	LDY #$0000				;$B2A037
	LDA ($00)				;$B2A03A
	LDA ($00)				;$B2A03C
	LDA CPU.divide_result			;$B2A03E
	CLC					;$B2A041
	ADC #$0030				;$B2A042
	XBA					;$B2A045
	ORA CPU.divide_remainder		;$B2A046
	CLC					;$B2A049
	ADC #$0030				;$B2A04A
	XBA					;$B2A04D
	LDX #$0018				;$B2A04E
	JSR CODE_B29F7E				;$B2A051
	LDX #$0018				;$B2A054
	JSR CODE_B29F44				;$B2A057
	LDA #$0300				;$B2A05A
	STA $1C39				;$B2A05D
	LDA #$0003				;$B2A060
	STA $1C37				;$B2A063
	RTS					;$B2A066

CODE_B2A067:
	LDA #$0040				;$B2A067
	BIT $05FD				;$B2A06A
	BNE CODE_B2A090				;$B2A06D
	LDA $1C3B				;$B2A06F
	CMP #$0004				;$B2A072
	BEQ CODE_B2A086				;$B2A075
	CLC					;$B2A077
	ADC #$000C				;$B2A078
	TAX					;$B2A07B
	JSR CODE_B29F44				;$B2A07C
	INC $1C3B				;$B2A07F
	INC $1C3B				;$B2A082
	RTS					;$B2A085

CODE_B2A086:
	LDA #$0004				;$B2A086
	STA $1C37				;$B2A089
	JSR CODE_B2A0E5				;$B2A08C
	RTS					;$B2A08F

CODE_B2A090:
	LDA #$0180				;$B2A090
	STA $1C39				;$B2A093
	LDA $1C3B				;$B2A096
	CMP #$0008				;$B2A099
	BEQ CODE_B2A0BE				;$B2A09C
	CMP #$0002				;$B2A09E
	BNE CODE_B2A0AF				;$B2A0A1
	LDX #$0001				;$B2A0A3
	STX $15E8				;$B2A0A6
	LDX #$0380				;$B2A0A9
	STX $1C39				;$B2A0AC
CODE_B2A0AF:
	CLC					;$B2A0AF
	ADC #$0010				;$B2A0B0
	TAX					;$B2A0B3
	JSR CODE_B29F44				;$B2A0B4
	INC $1C3B				;$B2A0B7
	INC $1C3B				;$B2A0BA
	RTS					;$B2A0BD

CODE_B2A0BE:
	LDA #$0002				;$B2A0BE
	TSB $1C35				;$B2A0C1
	BRA CODE_B2A086				;$B2A0C4

CODE_B2A0C6:
	JSL CODE_808018				;$B2A0C6
	AND #$0003				;$B2A0CA
	ASL					;$B2A0CD
	CLC					;$B2A0CE
	ADC #$001A				;$B2A0CF
	TAX					;$B2A0D2
	JSR CODE_B29F44				;$B2A0D3
	INC $1C37				;$B2A0D6
	JSR CODE_B2A0E5				;$B2A0D9
	RTS					;$B2A0DC

CODE_B2A0DD:
	LDA #$820F				;$B2A0DD
	JSL CODE_808024				;$B2A0E0
	RTS					;$B2A0E4

CODE_B2A0E5:
	LDA $1C47				;$B2A0E5
	INC					;$B2A0E8
	XBA					;$B2A0E9
	LSR					;$B2A0EA
	LSR					;$B2A0EB
	STA $1C39				;$B2A0EC
	LDX active_kong_sprite			;$B2A0EF
	JSR CODE_B2A0F8				;$B2A0F2
	LDX follower_kong_sprite		;$B2A0F5
CODE_B2A0F8:
	LDA #$0120				;$B2A0F8
	STA sprite.general_purpose_5E,x		;$B2A0FB
	LDA #!kong_state_04			;$B2A0FD
	STA sprite.state,x			;$B2A100
	LDA #$0180				;$B2A102
	STA sprite.x_speed,x			;$B2A105
	STA sprite.max_x_speed,x		;$B2A107
	RTS					;$B2A109

CODE_B2A10A:
	LDA $15E8				;$B2A10A
	BNE CODE_B2A125				;$B2A10D
	LDA #$0010				;$B2A10F
	BIT $05FD				;$B2A112
	BEQ CODE_B2A125				;$B2A115
	LDA player_active_pressed		;$B2A117
	BIT #$9180				;$B2A11A
	BEQ CODE_B2A125				;$B2A11D
	LDA #$0002				;$B2A11F
	STA $1C39				;$B2A122
CODE_B2A125:
	RTS					;$B2A125

;Credits text
DATA_B2A126:
	db $00,$00,$00,$00,$01
	db "CRAZY KONG CREATOR",$D3
	db $00,$00,$02
	db "HEAD PROGRAMME",$D2
	db $00,$03
	db "M.WILSO",$CE
	db $00,$00,$02
	db "PROGRAMMER",$D3
	db $00,$03
	db "T.ATTWOO",$C4
	db $00
	db "S.HORSBURG",$C8
	db $00,$00,$02
	db "TECHNICAL PROGRAMME",$D2
	db $00,$03
	db "B.GUN",$CE
	db $00,$00,$02
	db "HEAD ARTIST",$AF
	db "CHARACTER",$D3
	db $00,$03
	db "M.STEVENSO",$CE
	db $00,$00,$02
	db "ASSISTANT CHARACTER",$D3
	db "AND ANIMATIO",$CE
	db $00,$03
	db "N.CROO",$CB
	db $00,$00,$02
	db "BACKGROUND ARTIST",$D3
	db $00,$03
	db "P.DUNN",$C5
	db $00
	db "C.TILLE",$D9
	db $00
	db "C.WOOD",$D3
	db $00
	db "L.RA",$D9
	db $00,$00,$02
	db "GRAPHICS MANIPULATO",$D2
	db $00,$03
	db "C.PEI",$CC
	db $00,$00,$02
	db "MUSIC/SOUND EFFECT",$D3
	db $00,$03
	db "E.FISCHE",$D2
	db $00,$00,$02
	db "ADDITIONAL MUSI",$C3
	db $00,$03
	db "D.WIS",$C5
	db $00,$00,$02
	db "GAME TESTIN",$C7
	db $00,$03
	db "H.WAR",$C4
	db $00
	db "G.RICHARD",$D3
	db $00
	db "G.HOO",$C4
	db $00
	db "G.ANDREA",$D3
	db $00
	db "J.WILLIAM",$D3
	db $00
	db "M.PENN",$D9
	db $00
	db "G.JONE",$D3
	db $00,$00,$02
	db "NINTEND",$CF
	db "PRODUCT TESTIN",$C7
	db $00,$03
	db "M.KELBAUG",$C8
	db $00
	db "C.NEEDHA",$CD
	db $00
	db "T.HERTZO",$C7
	db $00
	db "T.BECHTE",$CC
	db $00
	db "D.BRIDGHA",$CD
	db $00
	db "R.JOHNSO",$CE
	db $00
	db "I.MARSHAL",$CC
	db $00
	db "B.SMIT",$C8
	db $00
	db "THE BUGHOUSE ",$B9
	db $00,$00,$02
	db "MANUA",$CC
	db $00,$03
	db "G.RICHARDSO",$CE
	db $00
	db "NINTENDO POWE",$D2
	db $00,$00,$02
	db "SPECIAL THANK",$D3
	db $00,$03
	db "MR.YAMAUCH",$C9
	db $00
	db "MR.LINCOL",$CE
	db $00
	db "MR.ARAKAW",$C1
	db $00
	db "M.FUKUD",$C1
	db $00
	db "J.HOCHBER",$C7
	db $00,$00
	db "E.WAA",$D3
	db $00
	db "R.RICHARDSO",$CE
	db $00
	db "K.LOB",$C2
	db $00
	db "K.KOND",$CF
	db $00
	db "M.HATAKEYAM",$C1
	db $00
	db "N.KAWAN",$CF
	db $00
	db "S.KIMUR",$C1
	db $00
	db "Y.KAT",$CF
	db $00
	db "I.HIRAN",$CF
	db $00
	db "I.YONED",$C1
	db $00
	db "E.KOBAYASH",$C9
	db $00
	db "H.NAKAMUR",$C1
	db $00
	db "S.FARME",$D2
	db $00
	db "S.STAMPE",$D2
	db $00
	db "G.MAYLE",$D3
	db $00
	db "C.SUTHERLAN",$C4
	db $00
	db "S.MAYLE",$D3
	db $00
	db "C.GAG",$C5
	db $00
	db "C.MOYS",$C5
	db $00
	db "A.BERNER",$D4
	db $00
	db "J.BARDAKOF",$C6
	db $00
	db "L.ASHLE",$D9
	db $00,$00,$02
	db "SOFTWARE SYSTEM",$D3
	db $00,$03
	db "ALIAS/NINTENDO",$AF
	db "RARE ACM",$B3
	db $00
	db "SILICON GRAPHIC",$D3
	db $00,$00,$02
	db "NETWORK SUPPOR",$D4
	db $00,$03
	db "P.MIKEL",$CC
	db $00
	db "D.DOA",$CB
	db $00,$00,$02
	db "HARDWAR",$C5
	db $00,$03
	db "RARE SYSTEM",$D3
	db $00
	db "SILICON GRAPHIC",$D3
	db $00,$00,$02
	db "HARDWARE SUPPOR",$D4
	db $00,$03
	db "P.CO",$D8
	db $00
	db "A.TIPPE",$D2
	db $00,$00,$02
	db "ORIGINAL DONKEY KON",$C7
	db "CREATO",$D2
	db $00,$03
	db "S.MIYAMOT",$CF
	db $00,$00,$02
	db "ASSISTAN",$D4
	db "GAME DESIGNE",$D2
	db $00,$03
	db "P.WEAVE",$D2
	db $00,$00,$02
	db "GAME DESIGN/PRODUCE",$D2
	db $00,$03
	db "A.COLLAR",$C4
	db $00,$00,$02
	db "EXECUTIVE DIRECTO",$D2
	db $00,$03
	db "T.STAMPE",$D2
	db $00,$00,$02
	db "PRODUCED B",$D9
	db $00,$03
	db "RAR",$C5
	db $00,$00,$02
	db "PRESENTED B",$D9
	db $00,$03
	db "NINTEND",$CF
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

DATA_B2A601:
	db $00,$00,$00,$00,$01
	db "CR?ATEURS CRAZY KON",$C7
	db $00,$00,$02
	db "PROGRAMMEUR EN CHE",$C6
	db $00,$03
	db "M.WILSO",$CE
	db $00,$00,$02
	db "PROGRAMMEUR",$D3
	db $00,$03
	db "T.ATTWOO",$C4
	db $00
	db "S.HORSBURG",$C8
	db $00,$00,$02
	db "PROGRAMMEU",$D2
	db "TECHNIQU",$C5
	db $00,$03
	db "B.GUN",$CE
	db $00,$00,$02
	db "ARTISTE EN CHEF",$AF
	db "PERSONNAGE",$D3
	db $00,$03
	db "M.STEVENSO",$CE
	db $00,$00,$02
	db "PERSONNAGES SUP",$AE
	db "ET ANIMATIO",$CE
	db $00,$03
	db "N.CROO",$CB
	db $00,$00,$02
	db "D?COR",$D3
	db $00,$03
	db "P.DUNN",$C5
	db $00
	db "C.TILLE",$D9
	db $00
	db "C.WOOD",$D3
	db $00
	db "L.RA",$D9
	db $00,$00,$02
	db "MANIPULATIO",$CE
	db "GRAPHISME",$D3
	db $00,$03
	db "C.PEI",$CC
	db $00,$00,$02
	db "MUSIQUE ",$AF
	db "EFFETS SONORE",$D3
	db $00,$03
	db "E.FISCHE",$D2
	db $00,$00,$02
	db "MUSIQU",$C5
	db "SUPPL?MENTAIR",$C5
	db $00,$03
	db "D.WIS",$C5
	db $00,$00,$02
	db "TESTEUR",$D3
	db $00,$03
	db "H.WAR",$C4
	db $00
	db "G.RICHARD",$D3
	db $00
	db "G.HOO",$C4
	db $00
	db "G.ANDREA",$D3
	db $00
	db "J.WILLIAM",$D3
	db $00
	db "M.PENN",$D9
	db $00
	db "G.JONE",$D3
	db $00,$00,$02
	db "TESTEURS NINTEND",$CF
	db $00,$03
	db "M.KELBAUG",$C8
	db $00
	db "C.NEEDHA",$CD
	db $00
	db "T.HERTZO",$C7
	db $00
	db "T.BECHTE",$CC
	db $00
	db "D.BRIDGHA",$CD
	db $00
	db "R.JOHNSO",$CE
	db $00
	db "I.MARSHAL",$CC
	db $00
	db "B.SMIT",$C8
	db $00
	db "THE BUGHOUSE ",$B9
	db $00,$00,$02
	db "MANUE",$CC
	db $00,$03
	db "G.RICHARDSO",$CE
	db $00
	db "NINTENDO POWE",$D2
	db $00,$00,$02
	db "UN GRAND MERCI % ",$DB
	db $00,$03
	db "MR.YAMAUCH",$C9
	db $00
	db "MR.LINCOL",$CE
	db $00
	db "MR.ARAKAW",$C1
	db $00
	db "M.FUKUD",$C1
	db $00
	db "J.HOCHBER",$C7
	db $00,$00
	db "E.WAA",$D3
	db $00
	db "R.RICHARDSO",$CE
	db $00
	db "K.LOB",$C2
	db $00
	db "K.KOND",$CF
	db $00
	db "M.HATAKEYAM",$C1
	db $00
	db "N.KAWAN",$CF
	db $00
	db "S.KIMUR",$C1
	db $00
	db "Y.KAT",$CF
	db $00
	db "I.HIRAN",$CF
	db $00
	db "I.YONED",$C1
	db $00
	db "E.KOBAYASH",$C9
	db $00
	db "H.NAKAMUR",$C1
	db $00
	db "S.FARME",$D2
	db $00
	db "S.STAMPE",$D2
	db $00
	db "G.MAYLE",$D3
	db $00
	db "C.SUTHERLAN",$C4
	db $00
	db "S.MAYLE",$D3
	db $00
	db "C.GAG",$C5
	db $00
	db "C.MOYS",$C5
	db $00
	db "A.BERNER",$D4
	db $00
	db "J.BARDAKOF",$C6
	db $00
	db "L.ASHLE",$D9
	db $00,$00,$02
	db "SYST&MES SOFTWAR",$C5
	db $00,$03
	db "ALIAS/NINTENDO",$AF
	db "RARE ACM",$B3
	db $00
	db "SILICON GRAPHIC",$D3
	db $00,$00,$02
	db "SUPPORT R?SEA",$D5
	db $00,$03
	db "P.MIKEL",$CC
	db $00
	db "D.DOA",$CB
	db $00,$00,$02
	db "HARDWAR",$C5
	db $00,$03
	db "RARE SYSTEM",$D3
	db $00
	db "SILICON GRAPHIC",$D3
	db $00,$00,$02
	db "SUPPORT HARDWAR",$C5
	db $00,$03
	db "P.CO",$D8
	db $00
	db "A.TIPPE",$D2
	db $00,$00,$02
	db "CR?ATEUR D",$C5
	db "DONKEY KON",$C7
	db $00,$03
	db "S.MIYAMOT",$CF
	db $00,$00,$02
	db "ASSISTANT AU CONCEP",$D4
	db $00,$03
	db "P.WEAVE",$D2
	db $00,$00,$02
	db "PRODUCTEUR/CONCEP",$D4
	db $00,$03
	db "A.COLLAR",$C4
	db $00,$00,$02
	db "DIRECTEUR EX?CUTI",$C6
	db $00,$03
	db "T.STAMPE",$D2
	db $00,$00,$02
	db "PRODUIT PA",$D2
	db $00,$03
	db "RAR",$C5
	db $00,$00,$02
	db "PR?SENT? PA",$D2
	db $00,$03
	db "NINTEND",$CF
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

DATA_B2AAD2:
	db $00,$00,$00,$00,$01
	db "ENTWICKLUN",$C7
	db "CRAZY  KON",$C7
	db $00,$00,$02
	db "CHEF PROGRAMMIERUN",$C7
	db $00,$03
	db "M.WILSO",$CE
	db $00,$00,$02
	db "PROGRAMMIERUN",$C7
	db $00,$03
	db "T.ATTWOO",$C4
	db $00
	db "S.HORSBURG",$C8
	db $00,$00,$02
	db "TECHNISCH",$C5
	db "PROGRAMMIERUN",$C7
	db $00,$03
	db "B.GUN",$CE
	db $00,$00,$02
	db "CHEF GRAFISCH",$C5
	db "ENTWICKLUN",$C7
	db $00,$03
	db "M.STEVENSO",$CE
	db $00,$00,$02
	db "ASSISTENZ GRAFISCH",$C5
	db "ENTWICKLUN",$C7
	db $00,$03
	db "N.CROO",$CB
	db $00,$00,$02
	db "HINTERGR:ND DESIG",$CE
	db $00,$03
	db "P.DUNN",$C5
	db $00
	db "C.TILLE",$D9
	db $00
	db "C.WOOD",$D3
	db $00
	db "L.RA",$D9
	db $00,$00,$02
	db "GRAFISCH",$C5
	db "KONVERTIERUN",$C7
	db $00,$03
	db "C.PEI",$CC
	db $00,$00,$02
	db "MUSIK/SOUN",$C4
	db $00,$03
	db "E.FISCHE",$D2
	db $00,$00,$02
	db "ASS. MUSIK/SOUN",$C4
	db $00,$03
	db "D.WIS",$C5
	db $00,$00,$02
	db "MONITORING ",$AD
	db "RARE LT",$C4
	db $00,$03
	db "H.WAR",$C4
	db $00
	db "G.RICHARD",$D3
	db $00
	db "G.HOO",$C4
	db $00
	db "G.ANDREA",$D3
	db $00
	db "J.WILLIAM",$D3
	db $00
	db "M.PENN",$D9
	db $00
	db "G.JONE",$D3
	db $00,$00,$02
	db "MONITORING ",$AD
	db "NINTENDO OF AMERIC",$C1
	db $00,$03
	db "M.KELBAUG",$C8
	db $00
	db "C.NEEDHA",$CD
	db $00
	db "T.HERTZO",$C7
	db $00
	db "T.BECHTE",$CC
	db $00
	db "D.BRIDGHA",$CD
	db $00
	db "R.JOHNSO",$CE
	db $00
	db "I.MARSHAL",$CC
	db $00
	db "B.SMIT",$C8
	db $00
	db "THE BUGHOUSE ",$B9
	db $00,$00,$02
	db "SPIELEANLEITUN",$C7
	db $00,$03
	db "G.RICHARDSO",$CE
	db $00
	db "NINTENDO POWE",$D2
	db $00,$00,$02
	db "BESONDEREN DANK A",$CE
	db $00,$03
	db "MR.YAMAUCH",$C9
	db $00
	db "MR.LINCOL",$CE
	db $00
	db "MR.ARAKAW",$C1
	db $00
	db "M.FUKUD",$C1
	db $00
	db "J.HOCHBER",$C7
	db $00,$00
	db "E.WAA",$D3
	db $00
	db "R.RICHARDSO",$CE
	db $00
	db "K.LOB",$C2
	db $00
	db "K.KOND",$CF
	db $00
	db "M.HATAKEYAM",$C1
	db $00
	db "N.KAWAN",$CF
	db $00
	db "S.KIMUR",$C1
	db $00
	db "Y.KAT",$CF
	db $00
	db "I.HIRAN",$CF
	db $00
	db "I.YONED",$C1
	db $00
	db "E.KOBAYASH",$C9
	db $00
	db "H.NAKAMUR",$C1
	db $00
	db "S.FARME",$D2
	db $00
	db "S.STAMPE",$D2
	db $00
	db "G.MAYLE",$D3
	db $00
	db "C.SUTHERLAN",$C4
	db $00
	db "S.MAYLE",$D3
	db $00
	db "C.GAG",$C5
	db $00
	db "C.MOYS",$C5
	db $00
	db "M.PFITENE",$D2
	db $00
	db "T.G+R",$C7
	db $00
	db "A.BERNER",$D4
	db $00
	db "J.BARDAKOF",$C6
	db $00
	db "L.ASHLE",$D9
	db $00,$00,$02
	db "SOFTWARE SYSTEM",$C5
	db $00,$03
	db "ALIAS/NINTENDO",$AF
	db "RARE ACM",$B3
	db $00
	db "SILICON GRAPHIC",$D3
	db $00,$00,$02
	db "NETWORK SUPPOR",$D4
	db $00,$03
	db "P.MIKEL",$CC
	db $00
	db "D.DOA",$CB
	db $00,$00,$02
	db "HARDWAR",$C5
	db $00,$03
	db "RARE SYSTEM",$D3
	db $00
	db "SILICON GRAPHIC",$D3
	db $00,$00,$02
	db "HARDWARE SUPPOR",$D4
	db $00,$03
	db "P.CO",$D8
	db $00
	db "A.TIPPE",$D2
	db $00,$00,$02
	db "ORIGINAL DONKEY KON",$C7
	db "CREATIO",$CE
	db $00,$03
	db "S.MIYAMOT",$CF
	db $00,$00,$02
	db "ASS. SPIELDESIG",$CE
	db $00,$03
	db "P.WEAVE",$D2
	db $00,$00,$02
	db "SPIELDESIGN",$AF
	db "PRODUKTIO",$CE
	db $00,$03
	db "A.COLLAR",$C4
	db $00,$00,$02
	db "GESAMTLEITUN",$C7
	db $00,$03
	db "T.STAMPE",$D2
	db $00,$00,$02
	db "PRODUZIERT VO",$CE
	db $00,$03
	db "RAR",$C5
	db $00,$00,$02
	db "HERAUSGEBE",$D2
	db $00,$03
	db "NINTEND",$CF
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

DATA_B2AFDE:
	dw $0003,$0008,$000B,$000D,$000E,$000F,$0010,$0011
	dw $0012,$0013,$0013,$0014,$0014,$0015,$0015,$0015
	dw $0016,$0016,$0016,$0016,$0016,$0017,$0017,$0017
	dw $0017,$0017,$0017,$0017,$0017,$0017,$0017,$0017
	dw $0017,$0017,$0017,$0017,$0017,$0017,$0017,$0017
	dw $0017,$0018,$0018,$0018,$0018,$0018,$0018,$0018
	dw $0018,$0018,$0018,$0018,$0018,$0018,$0018,$0018
	dw $0018,$0018,$0018,$0018,$0018,$0019,$0019,$0019
	dw $0019,$0019,$001A,$001A,$001A,$001B,$001B,$001C
	dw $001C,$001D,$001E,$001F,$0020,$0021,$0022,$0024
	dw $0027

DATA_B2B080:
	dw $0000,$0008,$000A,$000C,$000E,$000F,$0010,$0011
	dw $0012,$0012,$0013,$0013,$0014,$0014,$0014,$0015
	dw $0015,$0015,$0016,$0016,$0016,$0016,$0016,$0016
	dw $0016,$0016,$0017,$0017,$0017,$0017,$0017,$0017
	dw $0017,$0017,$0017,$0017,$0017,$0017,$0017,$0017
	dw $0017,$0017,$0017,$0017,$0017,$0017,$0017,$0017
	dw $0017,$0017,$0017,$0017,$0017,$0017,$0017,$0017
	dw $0018,$0018,$0018,$0018,$0018,$0018,$0018,$0018
	dw $0019,$0019,$0019,$001A,$001A,$001A,$001B,$001B
	dw $001C,$001C,$001D,$001E,$001F,$0020,$0022,$0024
	dw $0026

toboggan_main:
	JMP (.state_table,x)			;$B2B122  |>

.state_table:
	dw .handle_sub_state
	dw .return_state
	dw .state_2
	dw .state_3
	dw .return_state_2

.handle_sub_state:
	LDA.w sprite.sub_state,y		;$B2B12F  \
	AND #$00FF				;$B2B132   |
	ASL					;$B2B135   |
	TAX					;$B2B136   |
	JMP (.sub_state_table,x)		;$B2B137  /

.sub_state_table:
	dw .sub_state_0
	dw .sub_state_1

.sub_state_0:
	LDY #$0058				;$B2B13E  \
	JSL CODE_BB8585				;$B2B141   |
	BCC ..CODE_B2B14A			;$B2B145   |
	JML [$04F5]				;$B2B147  /

..CODE_B2B14A:
	LDY alternate_sprite			;$B2B14A  \
	LDX current_sprite			;$B2B14C   |
	STX sprite.general_purpose_5C,y		;$B2B14E   |
	STY sprite.general_purpose_5C,x		;$B2B150   |
	LDA sprite.general_purpose_5E,x		;$B2B152   |
	STA sprite.state,x			;$B2B154   |
	STZ sprite.general_purpose_5E,x		;$B2B156   |
	STZ sprite.general_purpose_60,x		;$B2B158   |
	LDA sprite.y_position,x			;$B2B15A   |
	STA sprite.visibility,x			;$B2B15C   |
	STZ sprite.x_speed,x			;$B2B15E   |
	STZ sprite.max_x_speed,x		;$B2B160   |
	LDA #$0100				;$B2B162   |
	STA sprite.y_speed,x			;$B2B165   |
	LDA sprite.x_position,x			;$B2B167   |
	STA sprite.general_purpose_64,x		;$B2B169   |
	LDA sprite.y_position,x			;$B2B16B   |
	STA sprite.general_purpose_66,x		;$B2B16D   |
	LDA #$8000				;$B2B16F   |
	STA sprite.animation_id,x		;$B2B172   |
	LDA $05AF				;$B2B174   |
	AND #$4000				;$B2B177   |
	STA sprite.general_purpose_6C,x		;$B2B17A   |
	STZ sprite.animation_address,x		;$B2B17C   |
	STZ sprite.general_purpose_52,x		;$B2B17E   |
	JML [$04F5]				;$B2B180  /

.sub_state_1:
	LDA.w sprite.general_purpose_5C,y	;$B2B183  \
	CMP $05B7				;$B2B186   |
	BEQ .sub_state_0			;$B2B189   |
	JSL CODE_BB8597				;$B2B18B   |
	JML [$04F5]				;$B2B18F  /

.return_state:
	JML [$04F5]				;$B2B192  |>

.state_2:
	LDA.w sprite.animation_address,y	;$B2B195  \
	AND #$0018				;$B2B198   |
	BEQ ..CODE_B2B1A3			;$B2B19B   |
	LDA #$0402				;$B2B19D   |
	STA.w sprite.state,y			;$B2B1A0  /
..CODE_B2B1A3:
	LDA.w sprite.sub_state,y		;$B2B1A3  \
	AND #$00FF				;$B2B1A6   |
	ASL					;$B2B1A9   |
	TAX					;$B2B1AA   |
	JMP (.DATA_B2B1AE,x)			;$B2B1AB  /

.DATA_B2B1AE:
	dw .CODE_B2B1BC
	dw .CODE_B2B1C2
	dw .CODE_B2B1F3
	dw .CODE_B2B223
	dw .CODE_B2B25B
	dw .CODE_B2B2B5
	dw .CODE_B2B30D

.CODE_B2B1BC:
	TYX					;$B2B1BC  \
	INC sprite.sub_state,x			;$B2B1BD   |
	JSR CODE_B2BAAC			        ;$B2B1BF  /
.CODE_B2B1C2:
	JSR CODE_B2B852			        ;$B2B1C2  \
	JSR CODE_B2B94F			        ;$B2B1C5   |
	JSR CODE_B2B715			        ;$B2B1C8   |
	BCC ..CODE_B2B1ED			;$B2B1CB   |
	LDX current_sprite			;$B2B1CD   |
	LDA $05AF				;$B2B1CF   |
	AND #$4000				;$B2B1D2   |
	BEQ ..CODE_B2B1E1			;$B2B1D5   |
	LDA sprite.general_purpose_5E,x		;$B2B1D7   |
	DEC					;$B2B1D9   |
	BMI ..CODE_B2B1ED			;$B2B1DA   |
	LDA sprite.general_purpose_60,x		;$B2B1DC   |
	DEC					;$B2B1DE   |
	BMI ..CODE_B2B1ED			;$B2B1DF  /
..CODE_B2B1E1:
	STX $1B63				;$B2B1E1  \
	INC sprite.sub_state,x			;$B2B1E4   |
	LDA #$0003				;$B2B1E6   |
	JSL CODE_BFF006			        ;$B2B1E9  /
..CODE_B2B1ED:
	JSR CODE_B2BB62			        ;$B2B1ED  \
	JMP CODE_B2B6EE			        ;$B2B1F0  /

.CODE_B2B1F3:
	JSR CODE_B2B852			        ;$B2B1F3  \
	JSR CODE_B2B813			        ;$B2B1F6   |
	JSR CODE_B2B8D1			        ;$B2B1F9   |
	JSR CODE_B2B8F9			        ;$B2B1FC   |
	BCC ..CODE_B2B208			;$B2B1FF   |
	INC					;$B2B201   |
	JSR CODE_B2B933			        ;$B2B202   |
	JML [$04F5]				;$B2B205  /

..CODE_B2B208:
	JSR CODE_B2BC5E			        ;$B2B208  \
	JSR CODE_B2BAAC			        ;$B2B20B   |
	JSR CODE_B2B94F			        ;$B2B20E   |
	JSR CODE_B2B9E7			        ;$B2B211   |
	JSR CODE_B2B715			        ;$B2B214   |
	JSR CODE_B2BB62			        ;$B2B217   |
	JSR CODE_B2B863			        ;$B2B21A   |
	JSR CODE_B2BE7C			        ;$B2B21D   |
	JMP CODE_B2B6EE			        ;$B2B220  /

.CODE_B2B223:
	JSR CODE_B2B852			        ;$B2B223  \
	JSR CODE_B2B813			        ;$B2B226   |
	JSR CODE_B2B8D1			        ;$B2B229   |
	JSR CODE_B2B8F9			        ;$B2B22C   |
	BCC ..CODE_B2B238			;$B2B22F   |
	INC					;$B2B231   |
	JSR CODE_B2B933			        ;$B2B232   |
	JML [$04F5]				;$B2B235  /

..CODE_B2B238:
	JSR CODE_B2BC39			        ;$B2B238  \
	JSR CODE_B2BAAC			        ;$B2B23B   |
	BCC ..CODE_B2B24C			;$B2B23E   |
	DEC sprite.sub_state,x			;$B2B240   |
	JSR CODE_B2B93D			        ;$B2B242   |
	LDA #$0002				;$B2B245   |
	JSL CODE_BFF006			        ;$B2B248  /
..CODE_B2B24C:
	JSR CODE_B2B94F			        ;$B2B24C  \
	JSR CODE_B2B9E7			        ;$B2B24F   |
	JSR CODE_B2BB62			        ;$B2B252   |
	JSR CODE_B2BE7C			        ;$B2B255   |
	JMP CODE_B2B6EE			        ;$B2B258  /

.CODE_B2B25B:
	LDX current_sprite			;$B2B25B  \
	LDA sprite.animation_address,x		;$B2B25D   |
	TAY					;$B2B25F   |
	AND #$FFE7				;$B2B260   |
	STA sprite.animation_address,x		;$B2B263   |
	TYA					;$B2B265   |
	AND #$0008				;$B2B266   |
	BEQ ..CODE_B2B29D			;$B2B269   |
	LDA $05AF				;$B2B26B   |
	AND #$4000				;$B2B26E   |
	STA sprite.general_purpose_6C,x		;$B2B271   |
	LDA sprite.general_purpose_60,x		;$B2B273   |
	STA sprite.general_purpose_5E,x		;$B2B275   |
	STZ sprite.general_purpose_60,x		;$B2B277   |
	LDA #$0300				;$B2B279   |
	STA sprite.terrain_interaction,x	;$B2B27C   |
	LDY $04FB				;$B2B27E   |
	LDA active_frame_counter		;$B2B281   |
	STA.w sprite.sprite_graphic_mirror,y	;$B2B283   |
	JSR CODE_B2B863			        ;$B2B286   |
	LDY #$000A				;$B2B289   |
	LDA [$6A],y				;$B2B28C   |
	STA sprite.y_speed,x			;$B2B28E   |
	JSR CODE_B2BAAC			        ;$B2B290   |
	LDY #$000A				;$B2B293   |
	LDA [$6A],y				;$B2B296   |
	STA sprite.y_speed,x			;$B2B298   |
	JML [$04F5]				;$B2B29A  /

..CODE_B2B29D:
	LDA #$0300				;$B2B29D  \
	STA sprite.terrain_interaction,x	;$B2B2A0   |
	LDY $04FB				;$B2B2A2   |
	LDA active_frame_counter		;$B2B2A5   |
	STA.w sprite.sprite_graphic_mirror,y	;$B2B2A7   |
	JSR CODE_B2B863			        ;$B2B2AA   |
	LDA #$FC00				;$B2B2AD   |
	STA sprite.y_speed,x			;$B2B2B0   |
	JML [$04F5]				;$B2B2B2  /

.CODE_B2B2B5:
	JSR CODE_B2B852			        ;$B2B2B5  \
	JSR CODE_B2B813			        ;$B2B2B8   |
	JSR CODE_B2B8D1			        ;$B2B2BB   |
	JSR CODE_B2B8F9			        ;$B2B2BE   |
	LDA sprite.y_speed,x			;$B2B2C1   |
	PHA					;$B2B2C3   |
	JSR CODE_B2BAAC			        ;$B2B2C4   |
	PLA					;$B2B2C7   |
	STA sprite.y_speed,x			;$B2B2C8   |
	LDA sprite.ground_y_position,x		;$B2B2CA   |
	CMP #$7F00				;$B2B2CC   |
	BEQ ..CODE_B2B302			;$B2B2CF   |
	LDA sprite.terrain_interaction,x	;$B2B2D1   |
	AND #$0202				;$B2B2D3   |
	BNE ..CODE_B2B2ED			;$B2B2D6   |
	LDA sprite.ground_distance,x		;$B2B2D8   |
	CLC					;$B2B2DA   |
	ADC #$0200				;$B2B2DB   |
	CMP #$0210				;$B2B2DE   |
	BCS ..CODE_B2B302			;$B2B2E1   |
	LDA sprite.terrain_interaction,x	;$B2B2E3   |
	AND #$FFFE				;$B2B2E5   |
	ORA #$0002				;$B2B2E8   |
	STA sprite.terrain_interaction,x	;$B2B2EB  /
..CODE_B2B2ED:
	LDA sprite.animation_flags,x		;$B2B2ED  \
	CMP #$000A				;$B2B2EF   |
	BCS ..CODE_B2B2F7			;$B2B2F2   |
	LDA #$000A				;$B2B2F4  /
..CODE_B2B2F7:
	STA sprite.animation_flags,x		;$B2B2F7  \
	JSR CODE_B2B94F			        ;$B2B2F9   |
	JSR CODE_B2BB62			        ;$B2B2FC   |
	JMP CODE_B2B6EE			        ;$B2B2FF  /

..CODE_B2B302:
	INC sprite.sub_state,x			;$B2B302  \
	JSR CODE_B2B94F			        ;$B2B304   |
	JSR CODE_B2BB62			        ;$B2B307   |
	JMP CODE_B2B6EE			        ;$B2B30A  /

.CODE_B2B30D:
	LDA.w sprite.terrain_interaction,y	;$B2B30D  \
	AND #$0202				;$B2B310   |
	BNE ..CODE_B2B31E			;$B2B313   |
	LDA #$0302				;$B2B315   |
	STA.w sprite.state,y			;$B2B318   |
	JMP .CODE_B2B223			;$B2B31B  /

..CODE_B2B31E:
	JSR CODE_B2B852			        ;$B2B31E  \
	JSR CODE_B2B813			        ;$B2B321   |
	JSR CODE_B2B8D1			        ;$B2B324   |
	JSR CODE_B2B8F9			        ;$B2B327   |
	JSR CODE_B2BC39			        ;$B2B32A   |
	JSR CODE_B2BAAC			        ;$B2B32D   |
	BCC ..CODE_B2B344		        ;$B2B330   |
	LDA #$0202			        ;$B2B332   |
	STA sprite.state,x	                ;$B2B335   |
	JSR CODE_B2B93D			        ;$B2B337   |
	LDA #$0002			        ;$B2B33A   |
	JSL CODE_BFF006			        ;$B2B33D   |
	JSR CODE_B2BE7C			        ;$B2B341  /
..CODE_B2B344:
	JSR CODE_B2B94F			        ;$B2B344  \
	JSR CODE_B2BB62			        ;$B2B347   |
	JMP CODE_B2B6EE			        ;$B2B34A  /

.state_3:
	LDA.w sprite.animation_address,y	;$B2B34D  \
	AND #$0038				;$B2B350   |
	BEQ ..CODE_B2B35B			;$B2B353   |
	LDA #$0403				;$B2B355   |
	STA.w sprite.state,y			;$B2B358  /
..CODE_B2B35B:
	LDA.w sprite.sub_state,y		;$B2B35B  \
	AND #$00FF				;$B2B35E   |
	ASL					;$B2B361   |
	TAX					;$B2B362   |
	JMP (.DATA_B2B366,x)			;$B2B363  /

.DATA_B2B366:
	dw .CODE_B2B378
	dw .CODE_B2B394
	dw .CODE_B2B3D0
	dw .CODE_B2B403
	dw .CODE_B2B473
	dw .CODE_B2B503
	dw .CODE_B2B55B
	dw .CODE_B2B5CF
	dw .CODE_B2B64B

.CODE_B2B378:
	TYX					;$B2B378  \
	INC sprite.sub_state,x			;$B2B379   |
	JSR CODE_B2BD77			        ;$B2B37B   |
	JSR CODE_B2BAAC			        ;$B2B37E   |
	LDX current_sprite			;$B2B381   |
	LDA sprite.general_purpose_4E,x		;$B2B383   |
	CMP sprite.y_position,x			;$B2B385   |
	BNE .CODE_B2B394			;$B2B387   |
	STA sprite.general_purpose_66,x		;$B2B389   |
	JSR CODE_B2BE26			        ;$B2B38B   |
	JSR CODE_B2B94F			        ;$B2B38E   |
	JSR .CODE_B2B6A7			;$B2B391  /
.CODE_B2B394:
	JSR CODE_B2B852			        ;$B2B394  \
	JSR CODE_B2B94F			        ;$B2B397   |
	JSR CODE_B2B715			        ;$B2B39A   |
	BCC ..CODE_B2B3CA			;$B2B39D   |
	LDX current_sprite			;$B2B39F   |
	LDA $05AF				;$B2B3A1   |
	AND #$4000				;$B2B3A4   |
	BEQ ..CODE_B2B3B3			;$B2B3A7   |
	LDA sprite.general_purpose_5E,x		;$B2B3A9   |
	DEC					;$B2B3AB   |
	BMI ..CODE_B2B3CA			;$B2B3AC   |
	LDA sprite.general_purpose_60,x		;$B2B3AE   |
	DEC					;$B2B3B0   |
	BMI ..CODE_B2B3CA			;$B2B3B1  /
..CODE_B2B3B3:
	STX $1B63				;$B2B3B3  \
	LDA #$0002				;$B2B3B6   |
	LDY sprite.general_purpose_52,x		;$B2B3B9   |
	BEQ ..CODE_B2B3C0			;$B2B3BB   |
	LDA #$0007				;$B2B3BD  /
..CODE_B2B3C0:
	JSR CODE_B2B933			        ;$B2B3C0  \
	LDA #$0003				;$B2B3C3   |
	JSL CODE_BFF006			        ;$B2B3C6  /
..CODE_B2B3CA:
	JSR CODE_B2BB62			        ;$B2B3CA  \
	JMP CODE_B2B6EE			        ;$B2B3CD  /

.CODE_B2B3D0:
	JSR CODE_B2B852			        ;$B2B3D0  \
	JSR CODE_B2B813			        ;$B2B3D3   |
	JSR CODE_B2B8D1			        ;$B2B3D6   |
	JSR CODE_B2B8F9			        ;$B2B3D9   |
	BCC ..CODE_B2B3E5			;$B2B3DC   |
	INC					;$B2B3DE   |
	JSR CODE_B2B933			        ;$B2B3DF   |
	JML [$04F5]				;$B2B3E2  /

..CODE_B2B3E5:
	JSR CODE_B2BC5E			        ;$B2B3E5  \
	JSR CODE_B2BD77			        ;$B2B3E8   |
	JSR CODE_B2BAAC			        ;$B2B3EB   |
	JSR CODE_B2B94F			        ;$B2B3EE   |
	JSR CODE_B2B9E7			        ;$B2B3F1   |
	JSR CODE_B2B715			        ;$B2B3F4   |
	JSR CODE_B2BB62			        ;$B2B3F7   |
	JSR CODE_B2B863			        ;$B2B3FA   |
	JSR CODE_B2BE7C			        ;$B2B3FD   |
	JMP CODE_B2B6EE			        ;$B2B400  /

.CODE_B2B403:
	JSR CODE_B2B852			        ;$B2B403  \
	JSR CODE_B2B813			        ;$B2B406   |
	JSR CODE_B2B8D1			        ;$B2B409   |
	JSR CODE_B2B8F9			        ;$B2B40C   |
	BCC ..CODE_B2B418			;$B2B40F   |
	INC					;$B2B411   |
	JSR CODE_B2B933			        ;$B2B412   |
	JML [$04F5]				;$B2B415  /

..CODE_B2B418:
	JSR CODE_B2BC39			        ;$B2B418  \
	JSR CODE_B2BD77			        ;$B2B41B   |
	JSR CODE_B2BAAC			        ;$B2B41E   |
	BCS ..CODE_B2B437			;$B2B421   |
	JSR CODE_B2BE08			        ;$B2B423   |
	BCC ..CODE_B2B452			;$B2B426   |
	JSR CODE_B2B94F			        ;$B2B428   |
	JSR CODE_B2B9E7			        ;$B2B42B   |
	JSR CODE_B2BB62			        ;$B2B42E   |
	JSR CODE_B2BE7C			        ;$B2B431   |
	JMP CODE_B2B6EE			        ;$B2B434  /

..CODE_B2B437:
	DEC sprite.sub_state,x			;$B2B437  \
	JSR CODE_B2B93D			        ;$B2B439   |
	LDA #$0000				;$B2B43C   |
	JSL CODE_BFF006			        ;$B2B43F   |
	JSR CODE_B2BE7C			        ;$B2B443   |
	JSR CODE_B2B94F			        ;$B2B446   |
	JSR CODE_B2B9E7			        ;$B2B449   |
	JSR CODE_B2BB62			        ;$B2B44C   |
	JMP CODE_B2B6EE			        ;$B2B44F  /

..CODE_B2B452:
	JSR .CODE_B2B6A7			;$B2B452  \
	LDA #$0007				;$B2B455   |
	JSR CODE_B2B933			        ;$B2B458   |
	LDX current_sprite			;$B2B45B   |
	LDY sprite.general_purpose_5E,x		;$B2B45D   |
	BEQ ..CODE_B2B467			;$B2B45F   |
	LDA #$0700				;$B2B461   |
	STA.w sprite.animation_flags,y		;$B2B464  /
..CODE_B2B467:
	JSR CODE_B2B94F			        ;$B2B467  \
	JSR CODE_B2B9E7			        ;$B2B46A   |
	JSR CODE_B2BB62			        ;$B2B46D   |
	JMP CODE_B2B6EE			        ;$B2B470  /

.CODE_B2B473:
	LDX current_sprite			;$B2B473  \
	LDA sprite.animation_address,x		;$B2B475   |
	BIT #$0020				;$B2B477   |
	BNE ..CODE_B2B4D2			;$B2B47A   |
	TAY					;$B2B47C   |
	AND #$FFE7				;$B2B47D   |
	STA sprite.animation_address,x		;$B2B480   |
	TYA					;$B2B482   |
	AND #$0008				;$B2B483   |
	BEQ ..CODE_B2B4BA			;$B2B486   |
	LDA $05AF				;$B2B488   |
	AND #$4000				;$B2B48B   |
	STA sprite.general_purpose_6C,x		;$B2B48E   |
	LDA sprite.general_purpose_60,x		;$B2B490   |
	STA sprite.general_purpose_5E,x		;$B2B492   |
	STZ sprite.general_purpose_60,x		;$B2B494   |
	LDA #$0300				;$B2B496   |
	STA sprite.terrain_interaction,x	;$B2B499   |
	LDY $04FB				;$B2B49B   |
	LDA active_frame_counter		;$B2B49E   |
	STA.w sprite.sprite_graphic_mirror,y	;$B2B4A0   |
	JSR CODE_B2B863			        ;$B2B4A3   |
	LDY #$000A				;$B2B4A6   |
	LDA [$6A],y				;$B2B4A9   |
	STA sprite.y_speed,x			;$B2B4AB   |
	JSR CODE_B2BAAC			        ;$B2B4AD   |
	LDY #$000A				;$B2B4B0   |
	LDA [$6A],y				;$B2B4B3   |
	STA sprite.y_speed,x			;$B2B4B5   |
	JML [$04F5]				;$B2B4B7  /

..CODE_B2B4BA:
	LDA #$0300				;$B2B4BA  \
	STA sprite.terrain_interaction,x	;$B2B4BD   |
	LDY $04FB				;$B2B4BF   |
	LDA active_frame_counter		;$B2B4C2   |
	STA.w sprite.sprite_graphic_mirror,y	;$B2B4C4   |
	JSR CODE_B2B863			        ;$B2B4C7   |
	LDA #$FC00				;$B2B4CA   |
	STA sprite.y_speed,x			;$B2B4CD   |
	JML [$04F5]				;$B2B4CF  /

..CODE_B2B4D2:
	PHX					;$B2B4D2  \
	LDY sprite.general_purpose_5C,x		;$B2B4D3   |
	STY current_sprite			;$B2B4D5   |
	JSL CODE_BB8597			        ;$B2B4D7   |
	PLX					;$B2B4DB   |
	STX current_sprite			;$B2B4DC   |
	JSL CODE_BB8597			        ;$B2B4DE   |
	LDX current_sprite			;$B2B4E2   |
	INC sprite.type,x			;$B2B4E4   |
	LDA #$060C				;$B2B4E6   |
	JSL queue_sound_effect		        ;$B2B4E9   |
	JSL CODE_BEC030			        ;$B2B4ED   |
	LDX current_sprite			;$B2B4F1   |
	STZ sprite.type,x			;$B2B4F3   |
	LDA $7E9DD4				;$B2B4F5   |
	ORA #$0020				;$B2B4F9   |
	STA $7E9DD4				;$B2B4FC   |
	JML [$04F5]				;$B2B500  /

.CODE_B2B503:
	JSR CODE_B2B852			        ;$B2B503  \
	JSR CODE_B2B813			        ;$B2B506   |
	JSR CODE_B2B8D1			        ;$B2B509   |
	JSR CODE_B2B8F9			        ;$B2B50C   |
	LDA sprite.y_speed,x			;$B2B50F   |
	PHA					;$B2B511   |
	JSR CODE_B2BAAC			        ;$B2B512   |
	PLA					;$B2B515   |
	STA sprite.y_speed,x			;$B2B516   |
	LDA sprite.ground_y_position,x		;$B2B518   |
	CMP #$7F00				;$B2B51A   |
	BEQ ..CODE_B2B550			;$B2B51D   |
	LDA sprite.terrain_interaction,x	;$B2B51F   |
	AND #$0202				;$B2B521   |
	BNE ..CODE_B2B53B			;$B2B524   |
	LDA sprite.ground_distance,x		;$B2B526   |
	CLC					;$B2B528   |
	ADC #$0200				;$B2B529   |
	CMP #$0210				;$B2B52C   |
	BCS ..CODE_B2B550			;$B2B52F   |
	LDA sprite.terrain_interaction,x	;$B2B531   |
	AND #$FFFE				;$B2B533   |
	ORA #$0002				;$B2B536   |
	STA sprite.terrain_interaction,x	;$B2B539  /
..CODE_B2B53B:
	LDA sprite.animation_flags,x		;$B2B53B  \
	CMP #$000A				;$B2B53D   |
	BCS ..CODE_B2B545			;$B2B540   |
	LDA #$000A				;$B2B542  /
..CODE_B2B545:
	STA sprite.animation_flags,x		;$B2B545  \
	JSR CODE_B2B94F			        ;$B2B547   |
	JSR CODE_B2BB62			        ;$B2B54A   |
	JMP CODE_B2B6EE			        ;$B2B54D  /

..CODE_B2B550:
	INC sprite.sub_state,x			;$B2B550  \
	JSR CODE_B2B94F			        ;$B2B552   |
	JSR CODE_B2BB62			        ;$B2B555   |
	JMP CODE_B2B6EE			        ;$B2B558  /

.CODE_B2B55B:
	LDA.w sprite.terrain_interaction,y	;$B2B55B  \
	AND #$0202				;$B2B55E   |
	BNE ..CODE_B2B56C			;$B2B561   |
	LDA #$0003				;$B2B563   |
	JSR CODE_B2B933			        ;$B2B566   |
	JMP .CODE_B2B403			;$B2B569  /

..CODE_B2B56C:
	JSR CODE_B2B852			        ;$B2B56C  \
	JSR CODE_B2B813			        ;$B2B56F   |
	JSR CODE_B2B8D1			        ;$B2B572   |
	JSR CODE_B2B8F9			        ;$B2B575   |
	JSR CODE_B2BC39			        ;$B2B578   |
	JSR CODE_B2BAAC			        ;$B2B57B   |
	BCS ..CODE_B2B594		        ;$B2B57E   |
	JSR CODE_B2BE08			        ;$B2B580   |
	BCC ..CODE_B2B5B3		        ;$B2B583   |
	JSR CODE_B2B94F			        ;$B2B585   |
	JSR CODE_B2B9E7			        ;$B2B588   |
	JSR CODE_B2BB62			        ;$B2B58B   |
	JSR CODE_B2BE7C			        ;$B2B58E   |
	JMP CODE_B2B6EE			        ;$B2B591  /

..CODE_B2B594:
	LDA #$0003				;$B2B594  \
	JSR CODE_B2B933			        ;$B2B597   |
	JSR CODE_B2B93D			        ;$B2B59A   |
	LDA #$0000				;$B2B59D   |
	JSL CODE_BFF006			        ;$B2B5A0   |
	JSR CODE_B2BE7C			        ;$B2B5A4   |
	JSR CODE_B2B94F			        ;$B2B5A7   |
	JSR CODE_B2B9E7			        ;$B2B5AA   |
	JSR CODE_B2BB62			        ;$B2B5AD   |
	JMP CODE_B2B6EE			        ;$B2B5B0  /

..CODE_B2B5B3:
	LDA #$0007				;$B2B5B3  \
	JSR CODE_B2B933			        ;$B2B5B6   |
	LDY sprite.general_purpose_5E,x		;$B2B5B9   |
	BEQ ..CODE_B2B5C3			;$B2B5BB   |
	LDA #$0700				;$B2B5BD   |
	STA.w sprite.animation_flags,y		;$B2B5C0  /
..CODE_B2B5C3:
	JSR CODE_B2B94F			        ;$B2B5C3  \
	JSR CODE_B2B9E7			        ;$B2B5C6   |
	JSR CODE_B2BB62			        ;$B2B5C9   |
	JMP CODE_B2B6EE			        ;$B2B5CC  /

.CODE_B2B5CF:
	JSR CODE_B2B852			        ;$B2B5CF  \
	JSR CODE_B2B813			        ;$B2B5D2   |
	JSR CODE_B2B8D1			        ;$B2B5D5   |
	JSR CODE_B2B8F9			        ;$B2B5D8   |
	BCC ..CODE_B2B5E6			;$B2B5DB   |
	BNE ..CODE_B2B5E6			;$B2B5DD   |
	INC					;$B2B5DF   |
	JSR CODE_B2B933			        ;$B2B5E0   |
	JML [$04F5]				;$B2B5E3  /

..CODE_B2B5E6:
	JSR CODE_B2BC5E			        ;$B2B5E6  \
	JSR CODE_B2BE26			        ;$B2B5E9   |
	BCC ..CODE_B2B616			;$B2B5EC   |
	JSR CODE_B2B94F			        ;$B2B5EE   |
	JSR .CODE_B2B6A7			;$B2B5F1   |
	JSR CODE_B2B715			        ;$B2B5F4   |
	JSR CODE_B2BB62			        ;$B2B5F7   |
	LDA player_active_held			;$B2B5FA   |
	AND #$0400				;$B2B5FD   |
	BEQ ..CODE_B2B613			;$B2B600   |
	JSR CODE_B2B863			        ;$B2B602   |
	BCS ..CODE_B2B613			;$B2B605   |
	LDA #$000B				;$B2B607   |
	LDX current_sprite			;$B2B60A   |
	STA sprite.animation_flags,x		;$B2B60C   |
	STZ sprite.y_speed,x			;$B2B60E   |
	JSR .CODE_B2B6DC			;$B2B610  /
..CODE_B2B613:
	JMP CODE_B2B6EE			        ;$B2B613  |>

..CODE_B2B616:
	LDA #$0003				;$B2B616  \
	JSR CODE_B2B933			        ;$B2B619   |
	JSR .CODE_B2B6DC			;$B2B61C   |
	LDA sprite.animation_flags,x		;$B2B61F   |
	CMP #$000A				;$B2B621   |
	BCS ..CODE_B2B629			;$B2B624   |
	LDA #$000A				;$B2B626  /
..CODE_B2B629:
	STA sprite.animation_flags,x		;$B2B629  \
	STZ sprite.y_speed,x			;$B2B62B   |
	LDY sprite.general_purpose_5E,x	        ;$B2B62D   |
	BEQ ..CODE_B2B63F			;$B2B62F   |
	LDA #$0F00				;$B2B631   |
	STA.w sprite.animation_flags,y		;$B2B634   |
	LDA active_frame_counter		;$B2B637   |
	SBC #$0010				;$B2B639   |
	STA.w sprite.sprite_graphic_mirror,y	;$B2B63C  /
..CODE_B2B63F:
	JSR CODE_B2B94F			        ;$B2B63F  \
	JSR CODE_B2B715			        ;$B2B642   |
	JSR CODE_B2BB62			        ;$B2B645   |
	JMP CODE_B2B6EE			        ;$B2B648  /

.CODE_B2B64B:
	LDA.w sprite.y_speed,y			;$B2B64B  \
	BPL ..CODE_B2B659			;$B2B64E   |
	LDA #$0003				;$B2B650   |
	JSR CODE_B2B933			        ;$B2B653   |
	JMP .CODE_B2B403			;$B2B656  /

..CODE_B2B659:
	JSR CODE_B2B852			        ;$B2B659  \
	JSR CODE_B2B813			        ;$B2B65C   |
	JSR CODE_B2B8D1			        ;$B2B65F   |
	JSR CODE_B2B8F9			        ;$B2B662   |
	BCC ..CODE_B2B66E			;$B2B665   |
	INC					;$B2B667   |
	JSR CODE_B2B933			        ;$B2B668   |
	JML [$04F5]				;$B2B66B  /

..CODE_B2B66E:
	JSR CODE_B2BC39			        ;$B2B66E  \
	JSR CODE_B2BD77			        ;$B2B671   |
	JSR CODE_B2BAAC			        ;$B2B674   |
	BCS ..CODE_B2B688		        ;$B2B677   |
	JSR CODE_B2B94F			        ;$B2B679   |
	JSR CODE_B2B9E7			        ;$B2B67C   |
	JSR CODE_B2BB62			        ;$B2B67F   |
	JSR CODE_B2BE7C			        ;$B2B682   |
	JMP CODE_B2B6EE			        ;$B2B685  /

..CODE_B2B688:
	LDA #$0003				;$B2B688  \
	JSR CODE_B2B933			        ;$B2B68B   |
	JSR CODE_B2B93D			        ;$B2B68E   |
	LDA #$0000				;$B2B691   |
	JSL CODE_BFF006			        ;$B2B694   |
	JSR CODE_B2BE7C			        ;$B2B698   |
	JSR CODE_B2B94F			        ;$B2B69B   |
	JSR CODE_B2B9E7			        ;$B2B69E   |
	JSR CODE_B2BB62			        ;$B2B6A1   |
	JMP CODE_B2B6EE			        ;$B2B6A4  /

.CODE_B2B6A7:
	LDX current_sprite			;$B2B6A7  \
	LDY sprite.general_purpose_52,x		;$B2B6A9   |
	BNE ..CODE_B2B6C4			;$B2B6AB   |
	LDY #$007A				;$B2B6AD   |
	JSL CODE_BB8585			        ;$B2B6B0   |
	LDX current_sprite			;$B2B6B4   |
	BCS ..CODE_B2B6DB			;$B2B6B6   |
	LDY alternate_sprite			;$B2B6B8   |
	STY sprite.general_purpose_52,x		;$B2B6BA   |
	STX sprite.general_purpose_5C,y		;$B2B6BC   |
	LDA.w sprite.sprite_graphic,y		;$B2B6BE   |
	STA.w sprite.general_purpose_5E,y	;$B2B6C1  /
..CODE_B2B6C4:
	LDA sprite.x_position,x			;$B2B6C4  \
	STA.w sprite.x_position,y		;$B2B6C6   |
	LDA sprite.general_purpose_4E,x		;$B2B6C9   |
	STA.w sprite.y_position,y		;$B2B6CB   |
	LDA sprite.animation_id,x		;$B2B6CE   |
	ASL					;$B2B6D0   |
	ASL					;$B2B6D1   |
	ADC sprite.animation_id,x		;$B2B6D2   |
	CLC					;$B2B6D4   |
	ADC.w sprite.general_purpose_5E,y	;$B2B6D5   |
	STA.w sprite.sprite_graphic,y		;$B2B6D8  /
..CODE_B2B6DB:
	RTS					;$B2B6DB  |>

.CODE_B2B6DC:
	LDY current_sprite			;$B2B6DC  \
	LDX sprite.general_purpose_52,y		;$B2B6DE   |
	BEQ ..CODE_B2B6EA			;$B2B6E0   |
	TDC					;$B2B6E2   |
	STA.w sprite.general_purpose_52,y	;$B2B6E3   |
	JSL CODE_BB85E8			        ;$B2B6E6  /
..CODE_B2B6EA:
	RTS					;$B2B6EA  |>

.return_state_2:
	JML [$04F5]				;$B2B6EB  |>

CODE_B2B6EE:
	LDY sprite.general_purpose_5E,x		;$B2B6EE
	BNE CODE_B2B712				;$B2B6F0
	JSL CODE_BBAB52				;$B2B6F2
	BCC CODE_B2B712				;$B2B6F6
	LDX current_sprite			;$B2B6F8
	PHX					;$B2B6FA
	LDY sprite.general_purpose_5C,x		;$B2B6FB
	PHY					;$B2B6FD
	LDY sprite.general_purpose_52,x		;$B2B6FE
	BEQ CODE_B2B708				;$B2B700
	STY current_sprite			;$B2B702
	JSL CODE_BB8597				;$B2B704
CODE_B2B708:
	PLY					;$B2B708
	STY current_sprite			;$B2B709
	JSL CODE_BB8597				;$B2B70B
	PLY					;$B2B70F
	STY current_sprite			;$B2B710
CODE_B2B712:
	JML [$04F5]				;$B2B712

CODE_B2B715:
	LDA timestop_flags			;$B2B715
	AND #$0004				;$B2B718
	BNE CODE_B2B727				;$B2B71B
	LDX current_sprite			;$B2B71D
	LDA sprite.general_purpose_5E,x		;$B2B71F
	DEC					;$B2B721
	BMI CODE_B2B729				;$B2B722
	BRL CODE_B2B7A4				;$B2B724

CODE_B2B727:
	CLC					;$B2B727
	RTS					;$B2B728

CODE_B2B729:
	JSL populate_sprite_clipping		;$B2B729
	LDA #$0010				;$B2B72D
	PHK					;$B2B730
	%return(CODE_B2B737)
	JMP [$1864]				;$B2B734

CODE_B2B737:
	BCC CODE_B2B7A2				;$B2B737
	LDY $78					;$B2B739
	LDA.w sprite.y_speed,y			;$B2B73B
	BMI CODE_B2B7A2				;$B2B73E
	LDX current_sprite			;$B2B740
	LDA sprite.general_purpose_5E,x		;$B2B742
	ORA sprite.general_purpose_60,x		;$B2B744
	BNE CODE_B2B74F				;$B2B746
	LDA sprite.y_position,x			;$B2B748
	CMP.w sprite.y_position,y		;$B2B74A
	BCC CODE_B2B7A2				;$B2B74D
CODE_B2B74F:
	LDY $78					;$B2B74F
	CPY active_kong_sprite			;$B2B751
	BEQ CODE_B2B771				;$B2B754
	LDA #$0018				;$B2B756
	JSL CODE_B88069				;$B2B759
	BCS CODE_B2B7A2				;$B2B75D
	STX $17CA				;$B2B75F
	LDA $78					;$B2B762
	STA $17CC				;$B2B764
	STA sprite.general_purpose_60,x		;$B2B767
	JSR CODE_B2B7F5				;$B2B769
	LDA #$0001				;$B2B76C
	SEC					;$B2B76F
	RTS					;$B2B770

CODE_B2B771:
	LDA #$0018				;$B2B771
	JSL CODE_B88069				;$B2B774
	BCS CODE_B2B7A2				;$B2B778
	STX $17CA				;$B2B77A
	LDA $78					;$B2B77D
	STA $17CC				;$B2B77F
	STA sprite.general_purpose_5E,x		;$B2B782
	LDY $04FB				;$B2B784
	LDA active_frame_counter		;$B2B787
	SEC					;$B2B789
	SBC #$0010				;$B2B78A
	STA $0022,y				;$B2B78D
	LDX current_sprite			;$B2B790
	LDA sprite.x_position,x			;$B2B792
	STA sprite.general_purpose_68,x		;$B2B794
	LDA sprite.y_position,x			;$B2B796
	STA sprite.general_purpose_6A,x		;$B2B798
	JSR CODE_B2B7F5				;$B2B79A
	LDA #$0000				;$B2B79D
	SEC					;$B2B7A0
	RTS					;$B2B7A1

CODE_B2B7A2:
	CLC					;$B2B7A2
	RTS					;$B2B7A3

CODE_B2B7A4:
	LDA $05AF				;$B2B7A4
	AND #$4000				;$B2B7A7
	BEQ CODE_B2B7A2				;$B2B7AA
	LDA sprite.general_purpose_60,x		;$B2B7AC
	DEC					;$B2B7AE
	BPL CODE_B2B7A2				;$B2B7AF
	LDA sprite.general_purpose_60,x		;$B2B7B1
	BMI CODE_B2B7D0				;$B2B7B3
	LDY follower_kong_sprite		;$B2B7B5
	LDA sprite.x_position,x			;$B2B7B8
	SEC					;$B2B7BA
	SBC sprite.general_purpose_68,x		;$B2B7BB
	CLC					;$B2B7BD
	ADC.w sprite.x_position,y		;$B2B7BE
	STA.w sprite.x_position,y		;$B2B7C1
	LDA sprite.y_position,x			;$B2B7C4
	SEC					;$B2B7C6
	SBC sprite.general_purpose_6A,x		;$B2B7C7
	CLC					;$B2B7C9
	ADC.w sprite.y_position,y		;$B2B7CA
	STA.w sprite.y_position,y		;$B2B7CD
CODE_B2B7D0:
	LDY follower_kong_sprite		;$B2B7D0
	JSL CODE_BEC003				;$B2B7D3
	BCC CODE_B2B7A2				;$B2B7D7
	LDA #$0018				;$B2B7D9
	JSL CODE_B88069				;$B2B7DC
	BCS CODE_B2B7A2				;$B2B7E0
	STX $17CA				;$B2B7E2
	LDA follower_kong_sprite		;$B2B7E5
	STA $17CC				;$B2B7E8
	LDA follower_kong_sprite		;$B2B7EB
	STA sprite.general_purpose_60,x		;$B2B7EE
	LDA #$0001				;$B2B7F0
	SEC					;$B2B7F3
	RTS					;$B2B7F4

CODE_B2B7F5:
	LDX $0503				;$B2B7F5
	LDX active_kong_sprite			;$B2B7F8
	LDA #$00D8				;$B2B7FB
	STA sprite.render_order,x		;$B2B7FE
	LDX $0501				;$B2B800
	LDX follower_kong_sprite		;$B2B803
	LDA #$00E4				;$B2B806
	STA sprite.render_order,x		;$B2B809
	LDX current_sprite			;$B2B80B
	LDA #$00E5				;$B2B80D
	STA sprite.render_order,x		;$B2B810
	RTS					;$B2B812

CODE_B2B813:
	LDX current_sprite			;$B2B813
	LDA sprite.y_position,x			;$B2B815
	SEC					;$B2B817
	SBC #$0120				;$B2B818
	BCC CODE_B2B851				;$B2B81B
	CMP $1973				;$B2B81D
	BCC CODE_B2B851				;$B2B820
	LDA sprite.general_purpose_5E,x		;$B2B822
	DEC					;$B2B824
	BMI CODE_B2B851				;$B2B825
	LDA #$0040				;$B2B827
	JSL CODE_B8807B				;$B2B82A
	BCS CODE_B2B842				;$B2B82E
	LDA #$0027				;$B2B830
	LDY $075C				;$B2B833
	CPY #$0002				;$B2B836
	BEQ CODE_B2B83E				;$B2B839
	LDA #$002C				;$B2B83B
CODE_B2B83E:
	JSL CODE_B88069				;$B2B83E
CODE_B2B842:
	LDX current_sprite			;$B2B842
	BCS CODE_B2B851				;$B2B844
	LDA #$0004				;$B2B846
	STA sprite.state,x			;$B2B849
	LDA #$0003				;$B2B84B
	STA timestop_flags			;$B2B84E
CODE_B2B851:
	RTS					;$B2B851

CODE_B2B852:
	LDY active_kong_control_variables	;$B2B852
	LDA player_active_pressed		;$B2B855
	AND #$8000				;$B2B858
	BEQ .return				;$B2B85B
	LDA active_frame_counter		;$B2B85D
	STA $0022,y				;$B2B85F
.return:
	RTS					;$B2B862

CODE_B2B863:
	LDX current_sprite			;$B2B863
	LDA sprite.terrain_interaction,x	;$B2B865
	AND #$0101				;$B2B867
	BEQ CODE_B2B8C1				;$B2B86A
	LDY active_kong_control_variables	;$B2B86C
	LDA active_frame_counter		;$B2B86F
	SEC					;$B2B871
	SBC $0022,y				;$B2B872
	CMP #$0010				;$B2B875
	BPL CODE_B2B8BF				;$B2B878
	LDX current_sprite			;$B2B87A
	LDA sprite.terrain_interaction,x	;$B2B87C
	BIT #$0101				;$B2B87E
	BEQ CODE_B2B8BF				;$B2B881
	AND #$FFFE				;$B2B883
	STA sprite.terrain_interaction,x	;$B2B886
	LDA active_frame_counter		;$B2B888
	SBC #$0010				;$B2B88A
	STA $0022,y				;$B2B88D
	INC sprite.sub_state,x			;$B2B890
	LDA [current_sprite_constants]		;$B2B892
	STA sprite.y_speed,x			;$B2B894
	LDA sprite.animation_flags,x		;$B2B896
	CMP #$000A				;$B2B898
	BCS CODE_B2B8A0				;$B2B89B
	LDA #$000A				;$B2B89D
CODE_B2B8A0:
	STA sprite.animation_flags,x		;$B2B8A0
	LDY sprite.general_purpose_5E,x		;$B2B8A2
	BEQ CODE_B2B8BF				;$B2B8A4
	LDA #$0F00				;$B2B8A6
	STA.w sprite.animation_flags,y		;$B2B8A9
	LDA #$0004				;$B2B8AC
	LDY $37,x				;$B2B8AF
	CPY #$0300				;$B2B8B1
	BCC CODE_B2B8B9				;$B2B8B4
	LDA #$0001				;$B2B8B6
CODE_B2B8B9:
	JSL CODE_BFF006				;$B2B8B9
	CLC					;$B2B8BD
	RTS					;$B2B8BE

CODE_B2B8BF:
	SEC					;$B2B8BF
	RTS					;$B2B8C0

CODE_B2B8C1:
	LDY sprite.general_purpose_5E,x		;$B2B8C1
	BEQ CODE_B2B8BF				;$B2B8C3
	LDA #$0F00				;$B2B8C5
	STA.w sprite.animation_flags,y		;$B2B8C8
	INC sprite.sub_state,x			;$B2B8CB
	STZ sprite.y_speed,x			;$B2B8CD
	CLC					;$B2B8CF
	RTS					;$B2B8D0

CODE_B2B8D1:
	LDX current_sprite			;$B2B8D1
	LDA sprite.animation_address,x		;$B2B8D3
	AND #$0002				;$B2B8D5
	BNE CODE_B2B8E0				;$B2B8D8
	JSL CODE_B880A5				;$B2B8DA
	BCS CODE_B2B8F5				;$B2B8DE
CODE_B2B8E0:
	LDX current_sprite			;$B2B8E0
	STZ sprite.general_purpose_5E,x		;$B2B8E2
	LDY active_kong_control_variables	;$B2B8E4
	LDA active_frame_counter		;$B2B8E7
	SBC #$0010				;$B2B8E9
	STA.w $0022,y				;$B2B8EC
	STZ sprite.interaction_flags,x		;$B2B8EF
	LDA #$0001				;$B2B8F1
	RTS					;$B2B8F4

CODE_B2B8F5:
	LDA #$0000				;$B2B8F5
	RTS					;$B2B8F8

CODE_B2B8F9:
	LDX current_sprite			;$B2B8F9
	LDA sprite.general_purpose_6C,x		;$B2B8FB
	EOR $05AF				;$B2B8FD
	AND #$4000				;$B2B900
	BEQ CODE_B2B931				;$B2B903
	EOR sprite.general_purpose_6C,x		;$B2B905
	STA sprite.general_purpose_6C,x		;$B2B907
	AND #$4000				;$B2B909
	BNE CODE_B2B922				;$B2B90C
	STZ sprite.general_purpose_5E,x		;$B2B90E
	STZ sprite.general_purpose_60,x		;$B2B910
	LDA active_frame_counter		;$B2B912
	SBC #$0010				;$B2B914
	LDY active_kong_control_variables	;$B2B917
	STA.w $0022,y				;$B2B91A
	LDA #$0000				;$B2B91D
	SEC					;$B2B920
	RTS					;$B2B921

CODE_B2B922:
	LDX current_sprite			;$B2B922
	LDA sprite.x_position,x			;$B2B924
	STA sprite.general_purpose_68,x		;$B2B926
	LDA sprite.y_position,x			;$B2B928
	STA sprite.general_purpose_6A,x		;$B2B92A
	LDA #$0001				;$B2B92C
	SEC					;$B2B92F
	RTS					;$B2B930

CODE_B2B931:
	CLC					;$B2B931
	RTS					;$B2B932

CODE_B2B933:
	LDY current_sprite			;$B2B933
	SEP #$20				;$B2B935
	STA.w sprite.sub_state,y		;$B2B937
	REP #$20				;$B2B93A
	RTS					;$B2B93C

CODE_B2B93D:
	LDY sprite.general_purpose_5E,x		;$B2B93D
	BEQ CODE_B2B947				;$B2B93F
	LDA #$0700				;$B2B941
	STA.w sprite.animation_flags,y		;$B2B944
CODE_B2B947:
	LDA sprite.animation_address,x		;$B2B947
	AND #$FFFB				;$B2B949
	STA sprite.animation_address,x		;$B2B94C
	RTS					;$B2B94E

CODE_B2B94F:
	PHK					;$B2B94F
	PLB					;$B2B950
	LDX current_sprite			;$B2B951
	LDA sprite.terrain_attributes,x		;$B2B953
	AND #$8007				;$B2B955
	CMP #$8000				;$B2B958
	ROL					;$B2B95B
	TAY					;$B2B95C
	LDA DATA_B2B9D9,y			;$B2B95D
	AND #$00FF				;$B2B960
	BIT sprite.animation_id,x		;$B2B963
	BMI CODE_B2B9AC				;$B2B965
	STA temp_1A				;$B2B967
	LDA sprite.ground_distance,x		;$B2B969
	BEQ CODE_B2B98B				;$B2B96B
	STZ sprite.animation_speed,x		;$B2B96D
	BIT sprite.y_speed,x			;$B2B96F
	BMI CODE_B2B986				;$B2B971
	LDA sprite.ground_distance,x		;$B2B973
	CMP #$0020				;$B2B975
	BCS CODE_B2B9C1				;$B2B978
	LDA temp_1A				;$B2B97A
	STA sprite.animation_flags,x		;$B2B97C
	SEC					;$B2B97E
	SBC sprite.animation_id,x		;$B2B97F
	CMP #$FFFC				;$B2B981
	BCS CODE_B2B9C1				;$B2B984
CODE_B2B986:
	JSR CODE_B2B9A0				;$B2B986
	BRA CODE_B2B9A0				;$B2B989

CODE_B2B98B:
	LDA temp_1A				;$B2B98B
	STA sprite.animation_flags,x		;$B2B98D
	SEC					;$B2B98F
	SBC sprite.animation_id,x		;$B2B990
	CMP #$0003				;$B2B992
	BCC CODE_B2B99C				;$B2B995
	CMP #$FFFD				;$B2B997
	BCC CODE_B2B9A0				;$B2B99A
CODE_B2B99C:
	DEC sprite.animation_speed,x		;$B2B99C
	BPL CODE_B2B9C1				;$B2B99E
CODE_B2B9A0:
	LDA sprite.animation_id,x		;$B2B9A0
	CMP sprite.animation_flags,x		;$B2B9A2
	BEQ CODE_B2B9C1				;$B2B9A4
	BCS CODE_B2B9B0				;$B2B9A6
	INC sprite.animation_id,x		;$B2B9A8
	BRA CODE_B2B9B2				;$B2B9AA

CODE_B2B9AC:
	STA sprite.animation_id,x		;$B2B9AC
	BRA CODE_B2B9B2				;$B2B9AE

CODE_B2B9B0:
	DEC sprite.animation_id,x		;$B2B9B0
CODE_B2B9B2:
	LDA sprite.ground_distance,x		;$B2B9B2
	CMP #$0030				;$B2B9B4
	LDA #$0008				;$B2B9B7
	BCS CODE_B2B9BF				;$B2B9BA
	LDA #$0003				;$B2B9BC
CODE_B2B9BF:
	STA sprite.animation_speed,x		;$B2B9BF
CODE_B2B9C1:
	LDX current_sprite			;$B2B9C1
	LDA sprite.animation_id,x		;$B2B9C3
	ASL					;$B2B9C5
	ASL					;$B2B9C6
	ADC sprite.animation_id,x		;$B2B9C7
	CLC					;$B2B9C9
	ADC #$27D8				;$B2B9CA  tobbogan base graphic id?
	STA sprite.sprite_graphic,x		;$B2B9CD
	LDY sprite.general_purpose_5C,x		;$B2B9CF
	CLC					;$B2B9D1
	ADC #$0041				;$B2B9D2
	STA.w sprite.sprite_graphic,y		;$B2B9D5
	RTS					;$B2B9D8

DATA_B2B9D9:
	db $06,$06,$08,$04,$0A,$02,$0B,$01
	db $0C,$00,$0C,$00,$0C,$00

CODE_B2B9E7:
	LDX current_sprite			;$B2B9E7
	LDA sprite.terrain_interaction,x	;$B2B9E9
	AND #$0002				;$B2B9EB
	BEQ CODE_B2BA39				;$B2B9EE
	LDA sprite.x_position,x			;$B2B9F0
	CMP #$42C0				;$B2B9F2
	BCS CODE_B2BA3A				;$B2B9F5
	LDA $1B63				;$B2B9F7
	BEQ CODE_B2BA15				;$B2B9FA
	JSR CODE_B2BA4E				;$B2B9FC
	CMP #$0001				;$B2B9FF
	BCC CODE_B2BA15				;$B2BA02
	BNE CODE_B2BA2A				;$B2BA04
	LDA sprite.animation_address,x		;$B2BA06
	BIT #$0004				;$B2BA08
	BEQ CODE_B2BA1D				;$B2BA0B
	LDA sprite.y_speed,x			;$B2BA0D
	SEC					;$B2BA0F
	SBC #$0100				;$B2BA10
	BPL CODE_B2BA1D				;$B2BA13
CODE_B2BA15:
	LDA sprite.animation_address,x		;$B2BA15
	ORA #$0010				;$B2BA17
	STA sprite.animation_address,x		;$B2BA1A
	RTS					;$B2BA1C

CODE_B2BA1D:
	LDA #$0024				;$B2BA1D
	JSL CODE_B88069				;$B2BA20
	BCS CODE_B2BA39				;$B2BA24
	STZ $17CA				;$B2BA26
	RTS					;$B2BA29

CODE_B2BA2A:
	LDA #$0024				;$B2BA2A
	JSL CODE_B88069				;$B2BA2D
	BCS CODE_B2BA39				;$B2BA31
	LDA #$0001				;$B2BA33
	STA $17CA				;$B2BA36
CODE_B2BA39:
	RTS					;$B2BA39

CODE_B2BA3A:
	LDA sprite.animation_address,x		;$B2BA3A
	ORA #$0020				;$B2BA3C
	STA sprite.animation_address,x		;$B2BA3F
	LDA $1B63				;$B2BA41
	BEQ CODE_B2BA39				;$B2BA44
	LDA #$0026				;$B2BA46
	JSL CODE_B88069				;$B2BA49
	RTS					;$B2BA4D

CODE_B2BA4E:
	LDA sprite.x_speed+1,x			;$B2BA4E
	AND #$000F				;$B2BA50
	SEC					;$B2BA53
	ADC sprite.x_position,x			;$B2BA54
	SEC					;$B2BA56
	SBC #$0100				;$B2BA57
	STA temp_3E				;$B2BA5A
	LDA sprite.y_position,x			;$B2BA5C
	STA temp_40				;$B2BA5E
CODE_B2BA60:
	LDA temp_3E				;$B2BA60
	STA temp_1A				;$B2BA62
	LDA temp_40				;$B2BA64
	STA temp_1C				;$B2BA66
	JSL CODE_B7C766				;$B2BA68
	EOR #$FFFF				;$B2BA6C
	BPL CODE_B2BA91				;$B2BA6F
	SEC					;$B2BA71
	ADC #$6300				;$B2BA72
	CMP temp_40				;$B2BA75
	BEQ CODE_B2BA93				;$B2BA77
	STA temp_40				;$B2BA79
	CLC					;$B2BA7B
	ADC #$0048				;$B2BA7C
	CMP sprite.y_position,x			;$B2BA7F
	BCC CODE_B2BA91				;$B2BA81
	LDA #$0007				;$B2BA83
	BIT $A0					;$B2BA86
	BEQ CODE_B2BA60				;$B2BA88
	CLC					;$B2BA8A
	ADC temp_3E				;$B2BA8B
	STA temp_3E				;$B2BA8D
	BRA CODE_B2BA60				;$B2BA8F

CODE_B2BA91:
	LDA temp_40				;$B2BA91
CODE_B2BA93:
	SEC					;$B2BA93
	SBC sprite.y_position,x			;$B2BA94
	CMP #$FFF0				;$B2BA96
	BCS CODE_B2BAA8				;$B2BA99
	CMP #$FFB8				;$B2BA9B
	BCS CODE_B2BAA4				;$B2BA9E
	LDA #$0002				;$B2BAA0
	RTS					;$B2BAA3

CODE_B2BAA4:
	LDA #$0001				;$B2BAA4
	RTS					;$B2BAA7

CODE_B2BAA8:
	LDA #$0000				;$B2BAA8
	RTS					;$B2BAAB

CODE_B2BAAC:
	LDX current_sprite			;$B2BAAC
	LDA sprite.general_purpose_64,x		;$B2BAAE
	STA sprite.x_position,x			;$B2BAB0
	LDA sprite.general_purpose_66,x		;$B2BAB2
	STA sprite.y_position,x			;$B2BAB4
	LDA sprite.max_y_speed,x		;$B2BAB6
	PHA					;$B2BAB8
	LDA sprite.x_speed,x			;$B2BAB9
	PHA					;$B2BABB
	JSR CODE_B2BAE4				;$B2BABC
	STA sprite.x_speed,x			;$B2BABF
	JSL CODE_B9E006				;$B2BAC1
	PLA					;$B2BAC5
	STA sprite.x_speed,x			;$B2BAC6
	PLA					;$B2BAC8
	STA sprite.max_y_speed,x		;$B2BAC9
	LDA sprite.general_purpose_64,x		;$B2BACB
	LDY sprite.x_position,x			;$B2BACD
	STA sprite.x_position,x			;$B2BACF
	STY sprite.general_purpose_64,x		;$B2BAD1
	LDA sprite.general_purpose_66,x		;$B2BAD3
	LDY sprite.y_position,x			;$B2BAD5
	STA sprite.y_position,x			;$B2BAD7
	STY sprite.general_purpose_66,x		;$B2BAD9
	LDA sprite.terrain_interaction,x	;$B2BADB
	AND #$0101				;$B2BADD
	CMP #$0101				;$B2BAE0
	RTS					;$B2BAE3

CODE_B2BAE4:
	STZ temp_40				;$B2BAE4
	LDA sprite.x_speed,x			;$B2BAE6
	BPL CODE_B2BAF5				;$B2BAE8
	EOR #$FFFF				;$B2BAEA
	INC					;$B2BAED
	CMP #$0010				;$B2BAEE
	BCC CODE_B2BAF5				;$B2BAF1
	DEC temp_40				;$B2BAF3
CODE_B2BAF5:
	LSR					;$B2BAF5
	LSR					;$B2BAF6
	LSR					;$B2BAF7
	LSR					;$B2BAF8
	STA temp_3E				;$B2BAF9
	LDA sprite.terrain_attributes,x		;$B2BAFB
	AND #$0007				;$B2BAFD
	BEQ CODE_B2BB33				;$B2BB00
	CMP #$0005				;$B2BB02
	BNE CODE_B2BB10				;$B2BB05
	BIT sprite.y_speed,x			;$B2BB07
	BPL CODE_B2BB14				;$B2BB09
	BIT sprite.terrain_attributes,x		;$B2BB0B
	BMI CODE_B2BB14				;$B2BB0D
	INC					;$B2BB0F
CODE_B2BB10:
	BCC CODE_B2BB14				;$B2BB10
	BRA CODE_B2BB33				;$B2BB12

CODE_B2BB14:
	PHK					;$B2BB14
	PLB					;$B2BB15
	SEP #$20				;$B2BB16
	TAY					;$B2BB18
	LDA DATA_B2BB3D,y			;$B2BB19
	STA CPU.multiply_A			;$B2BB1C
	LDA temp_3E				;$B2BB1F
	STA CPU.multiply_B			;$B2BB21
	LDA temp_40				;$B2BB24
	ASL					;$B2BB26
	REP #$20				;$B2BB27
	LDA CPU.multiply_result			;$B2BB29
	BCC CODE_B2BB3C				;$B2BB2C
	EOR #$FFFF				;$B2BB2E
	BRA CODE_B2BB3C				;$B2BB31

CODE_B2BB33:
	STZ temp_40				;$B2BB33
	LDA sprite.x_speed,x			;$B2BB35
	CLC					;$B2BB37
	BPL CODE_B2BB3C				;$B2BB38
	DEC temp_40				;$B2BB3A
CODE_B2BB3C:
	RTS					;$B2BB3C

DATA_B2BB3D:
	db $00,$10,$0E,$0D,$0B,$08,$06

CODE_B2BB44:
	LDA sprite.y_position,x			;$B2BB44
	STA temp_1C				;$B2BB46
	LDA sprite.x_position,x			;$B2BB48
	SEC					;$B2BB4A
	SBC #$0100				;$B2BB4B
	STA temp_1A				;$B2BB4E
	JML CODE_B7C766				;$B2BB50

CODE_B2BB54:
	SEC					;$B2BB54
	SBC #$0100				;$B2BB55
	STA temp_1A				;$B2BB58
	LDA sprite.y_position,x			;$B2BB5A
	STA temp_1C				;$B2BB5C
	JML CODE_B7C766				;$B2BB5E

CODE_B2BB62:
	LDX current_sprite			;$B2BB62
	LDY sprite.general_purpose_5C,x		;$B2BB64
	LDA sprite.x_position,x			;$B2BB66
	STA.w sprite.x_position,y		;$B2BB68
	LDA sprite.y_position,x			;$B2BB6B
	STA.w sprite.y_position,y		;$B2BB6D
	LDY sprite.general_purpose_5E,x		;$B2BB70
	BEQ CODE_B2BB79				;$B2BB72
	BMI CODE_B2BB79				;$B2BB74
	JSR CODE_B2BBA9				;$B2BB76
CODE_B2BB79:
	LDY sprite.general_purpose_60,x		;$B2BB79
	BEQ CODE_B2BBA8				;$B2BB7B
	BMI CODE_B2BBA8				;$B2BB7D
	JSR CODE_B2BBA9				;$B2BB7F
	LDA #$0000				;$B2BB82
	CPY $0501				;$B2BB85
	BEQ CODE_B2BB8D				;$B2BB88
	LDA #$000D				;$B2BB8A
CODE_B2BB8D:
	CLC					;$B2BB8D
	ADC sprite.animation_id,x		;$B2BB8E
	ASL					;$B2BB90
	TAX					;$B2BB91
	LDA.l DATA_B2BBD1,x			;$B2BB92
	CLC					;$B2BB96
	ADC.w sprite.x_position,y		;$B2BB97
	STA.w sprite.x_position,y		;$B2BB9A
	LDA.l DATA_B2BC05,x			;$B2BB9D
	CLC					;$B2BBA1
	ADC.w sprite.y_position,y		;$B2BBA2
	STA.w sprite.y_position,y		;$B2BBA5
CODE_B2BBA8:
	RTS					;$B2BBA8

CODE_B2BBA9:
	LDA sprite.x_position,x			;$B2BBA9
	STA.w sprite.x_position,y		;$B2BBAB
	LDA sprite.y_position,x			;$B2BBAE
	STA.w sprite.y_position,y		;$B2BBB0
	LDA sprite.oam_property,x		;$B2BBB3
	EOR.w sprite.oam_property,y		;$B2BBB5
	AND #$4000				;$B2BBB8
	EOR.w sprite.oam_property,y		;$B2BBBB
	STA.w sprite.oam_property,y		;$B2BBBE
	LDA sprite.ground_y_position,x		;$B2BBC1
	STA.w sprite.ground_y_position,y	;$B2BBC3
	LDA sprite.ground_distance,x		;$B2BBC6
	STA.w sprite.ground_distance,y		;$B2BBC8
	LDA sprite.terrain_interaction,x	;$B2BBCB
	LDA.w sprite.terrain_interaction,y	;$B2BBCD
	RTS					;$B2BBD0

;X position offsets
DATA_B2BBD1:
	dw $FFF3,$FFF3,$FFF2,$FFF1,$FFF1,$FFF0,$FFF1,$FFF1
	dw $FFF1,$FFF3,$FFF2,$FFF3,$FFF4,$FFF5,$FFF5,$FFF4
	dw $FFF4,$FFF3,$FFF3,$FFF2,$FFF4,$FFF3,$FFF5,$FFF6
	dw $FFF8,$FFF8

;Y position offsets
DATA_B2BC05:
	dw $FFF8,$FFF8,$FFF9,$FFFB,$FFFC,$FFFE,$0000,$0002
	dw $0003,$0006,$0008,$0009,$000B,$FFF9,$FFF8,$FFF9
	dw $FFFB,$FFFC,$FFFF,$0001,$0002,$0004,$0005,$0007
	dw $0009,$0009

CODE_B2BC39:
	LDA sprite.y_speed,x			;$B2BC39
	BMI CODE_B2BC43				;$B2BC3B
	LDY #$0005				;$B2BC3D
	JSR CODE_B2BC86				;$B2BC40
CODE_B2BC43:
	LDA sprite.y_speed,x			;$B2BC43
	BPL CODE_B2BC6E				;$B2BC45
	LDA sprite.animation_address,x		;$B2BC47
	AND #$0004				;$B2BC49
	BNE CODE_B2BC59				;$B2BC4C
	LDY active_kong_control_variables	;$B2BC4E
	LDA $0004,y				;$B2BC51
	AND #$8000				;$B2BC54
	BEQ CODE_B2BC6E				;$B2BC57
CODE_B2BC59:
	LDY #$0002				;$B2BC59
	BRA CODE_B2BC71				;$B2BC5C

CODE_B2BC5E:
	LDY #$0002				;$B2BC5E
	JSR CODE_B2BC86				;$B2BC61
	LDX current_sprite			;$B2BC64
	LDA sprite.terrain_interaction+1,x	;$B2BC66
	AND #$0001				;$B2BC68
	BEQ CODE_B2BC6E				;$B2BC6B
	RTS					;$B2BC6D

CODE_B2BC6E:
	LDY #$0004				;$B2BC6E
CODE_B2BC71:
	LDX current_sprite			;$B2BC71
	LDA sprite.y_speed,x			;$B2BC73
	CLC					;$B2BC75
	ADC [current_sprite_constants],y	;$B2BC76
	BMI CODE_B2BC83				;$B2BC78
	LDY #$0006				;$B2BC7A
	CMP [current_sprite_constants],y	;$B2BC7D
	BCC CODE_B2BC83				;$B2BC7F
	LDA [current_sprite_constants],y	;$B2BC81
CODE_B2BC83:
	STA sprite.y_speed,x			;$B2BC83
	RTS					;$B2BC85

CODE_B2BC86:
	PHK					;$B2BC86
	PLB					;$B2BC87
	STY temp_1E				;$B2BC88
	LDX current_sprite			;$B2BC8A
	LDA sprite.y_position,x			;$B2BC8C
	SEC					;$B2BC8E
	SBC sprite.visibility,x			;$B2BC8F
	STA temp_1A				;$B2BC91
	ASL					;$B2BC93
	CLC					;$B2BC94
	ADC temp_1A				;$B2BC95
	STA temp_1A				;$B2BC97
	LDA sprite.slip_velocity,x		;$B2BC99
	BEQ CODE_B2BCAC				;$B2BC9B
	EOR sprite.unknown_58,x			;$B2BC9D
	BPL CODE_B2BCAC				;$B2BC9F
	LDA sprite.slip_velocity,x		;$B2BCA1
	CLC					;$B2BCA3
	ADC sprite.unknown_58,x			;$B2BCA4
	STA sprite.slip_velocity,x		;$B2BCA6
	LDA sprite.max_y_speed,x		;$B2BCA8
	BRA CODE_B2BCB3				;$B2BCAA

CODE_B2BCAC:
	LDA sprite.max_y_speed,x		;$B2BCAC
	CLC					;$B2BCAE
	ADC sprite.unknown_58,x			;$B2BCAF
	STA sprite.max_y_speed,x		;$B2BCB1
CODE_B2BCB3:
	CLC					;$B2BCB3
	ADC sprite.slip_velocity,x		;$B2BCB4
	BPL CODE_B2BCBD				;$B2BCB6
	SEC					;$B2BCB8
	SBC temp_1A				;$B2BCB9
	BRA CODE_B2BCC0				;$B2BCBB

CODE_B2BCBD:
	CLC					;$B2BCBD
	ADC temp_1A				;$B2BCBE
CODE_B2BCC0:
	STA temp_1C				;$B2BCC0
	CMP #$0080				;$B2BCC2
	BCC CODE_B2BCCC				;$B2BCC5
	CMP #$FF80				;$B2BCC7
	BCC CODE_B2BCE4				;$B2BCCA
CODE_B2BCCC:
	LDA sprite.terrain_attributes,x		;$B2BCCC
	AND #$8007				;$B2BCCE
	CMP #$8000				;$B2BCD1
	ROL					;$B2BCD4
	ASL					;$B2BCD5
	TAY					;$B2BCD6
	LDA DATA_B2BD5F,y			;$B2BCD7
	CLC					;$B2BCDA
	ADC sprite.max_x_speed,x		;$B2BCDB
	CLC					;$B2BCDD
	ADC sprite.unknown_58,x			;$B2BCDE
	STA temp_1C				;$B2BCE0
	BRA CODE_B2BD30				;$B2BCE2

CODE_B2BCE4:
	LDA temp_1C				;$B2BCE4
	BMI CODE_B2BD00				;$B2BCE6
	LDA sprite.unknown_2C,x			;$B2BCE8
	CLC					;$B2BCEA
	ADC sprite.slip_velocity,x		;$B2BCEB
	BMI CODE_B2BCF3				;$B2BCED
	CMP temp_1C				;$B2BCEF
	BCS CODE_B2BD16				;$B2BCF1
CODE_B2BCF3:
	LDA sprite.unknown_32,x			;$B2BCF3
	CLC					;$B2BCF5
	ADC sprite.slip_velocity,x		;$B2BCF6
	BMI CODE_B2BD16				;$B2BCF8
	CMP temp_1C				;$B2BCFA
	BCS CODE_B2BD1A				;$B2BCFC
	BRA CODE_B2BD16				;$B2BCFE

CODE_B2BD00:
	LDA sprite.unknown_2C,x			;$B2BD00
	CLC					;$B2BD02
	ADC sprite.slip_velocity,x		;$B2BD03
	BPL CODE_B2BD16				;$B2BD05
	CMP temp_1C				;$B2BD07
	BCS CODE_B2BD16				;$B2BD09
	LDA sprite.unknown_32,x			;$B2BD0B
	CLC					;$B2BD0D
	ADC sprite.slip_velocity,x		;$B2BD0E
	BPL CODE_B2BD1A				;$B2BD10
	CMP temp_1C				;$B2BD12
	BCS CODE_B2BD1A				;$B2BD14
CODE_B2BD16:
	STA temp_1C				;$B2BD16
	BRA CODE_B2BD30				;$B2BD18

CODE_B2BD1A:
	LDA temp_1C				;$B2BD1A
	EOR sprite.max_x_speed,x		;$B2BD1C
	BPL CODE_B2BD3F				;$B2BD1E
	ASL temp_1A				;$B2BD20
	LDA temp_1C				;$B2BD22
	BPL CODE_B2BD2B				;$B2BD24
	CLC					;$B2BD26
	ADC temp_1A				;$B2BD27
	BRA CODE_B2BD2E				;$B2BD29

CODE_B2BD2B:
	SEC					;$B2BD2B
	SBC temp_1A				;$B2BD2C
CODE_B2BD2E:
	STA temp_1C				;$B2BD2E
CODE_B2BD30:
	LDA sprite.ground_distance,x		;$B2BD30
	BNE CODE_B2BD3F				;$B2BD32
	LDA temp_1C				;$B2BD34
	SEC					;$B2BD36
	SBC sprite.slip_velocity,x		;$B2BD37
	STA sprite.max_y_speed,x		;$B2BD39
	LDA sprite.y_position,x			;$B2BD3B
	STA sprite.visibility,x			;$B2BD3D
CODE_B2BD3F:
	STZ sprite.unknown_58,x			;$B2BD3F
	LDA temp_1C				;$B2BD41
	STA sprite.max_x_speed,x		;$B2BD43
	LDY temp_1E				;$B2BD45
	BEQ CODE_B2BD5C				;$B2BD47
	SEC					;$B2BD49
	SBC sprite.x_speed,x			;$B2BD4A
CODE_B2BD4C:
	CMP #$8000				;$B2BD4C
	ROR					;$B2BD4F
	DEY					;$B2BD50
	BNE CODE_B2BD4C				;$B2BD51
	CLC					;$B2BD53
	ADC sprite.x_speed,x			;$B2BD54
	CMP sprite.x_speed,x			;$B2BD56
	BNE CODE_B2BD5C				;$B2BD58
	LDA temp_1C				;$B2BD5A
CODE_B2BD5C:
	STA sprite.x_speed,x			;$B2BD5C
	RTS					;$B2BD5E

DATA_B2BD5F:
	dw $0000,$0000,$FFFF,$0001,$FFFE,$0002,$FFFD,$0003
	dw $FFFC,$0004,$FFFB,$0005

CODE_B2BD77:
	LDX current_sprite			;$B2BD77
	LDA sprite.general_purpose_4C,x		;$B2BD79
	STA $42					;$B2BD7B
	CLC					;$B2BD7D
	ADC #$0006				;$B2BD7E
	STA $46					;$B2BD81
	LDA $6C					;$B2BD83
	STA $44					;$B2BD85
	STA $48					;$B2BD87
	LDY #$0000				;$B2BD89
	LDA sprite.x_position,x			;$B2BD8C
	CMP [$42],y				;$B2BD8E
	BCC CODE_B2BDC4				;$B2BD90
CODE_B2BD92:
	CMP [$46],y				;$B2BD92
	BCC CODE_B2BD9E				;$B2BD94
	INY					;$B2BD96
	INY					;$B2BD97
	INY					;$B2BD98
	INY					;$B2BD99
	INY					;$B2BD9A
	INY					;$B2BD9B
	BRA CODE_B2BD92				;$B2BD9C

CODE_B2BD9E:
	TYA					;$B2BD9E
	CLC					;$B2BD9F
	ADC $42					;$B2BDA0
	STA sprite.general_purpose_4C,x		;$B2BDA2
	LDA sprite.x_position,x			;$B2BDA4
	SEC					;$B2BDA6
	SBC [$42],y				;$B2BDA7
	STA temp_1A				;$B2BDA9
	INY					;$B2BDAB
	INY					;$B2BDAC
	LDA [$42],y				;$B2BDAD
	STA temp_1C				;$B2BDAF
	BEQ CODE_B2BDC4				;$B2BDB1
	INY					;$B2BDB3
	INY					;$B2BDB4
	LDA [$42],y				;$B2BDB5
	STA sprite.general_purpose_50,x		;$B2BDB7
	ASL					;$B2BDB9
	TAX					;$B2BDBA
	JMP (DATA_B2BDBE,x)			;$B2BDBB

DATA_B2BDBE:
	dw CODE_B2BDC9
	dw CODE_B2BDD4
	dw CODE_B2BDF0

CODE_B2BDC4:
	STZ sprite.general_purpose_4E,x		;$B2BDC4
	STZ sprite.general_purpose_50,x		;$B2BDC6
	RTS					;$B2BDC8

CODE_B2BDC9:
	LDX current_sprite			;$B2BDC9
	LDA temp_1C				;$B2BDCB
	CLC					;$B2BDCD
	ADC #$0030				;$B2BDCE
	STA sprite.general_purpose_4E,x		;$B2BDD1
	RTS					;$B2BDD3

CODE_B2BDD4:
	LDX current_sprite			;$B2BDD4
	LDA temp_1A				;$B2BDD6
	BCS CODE_B2BDDE				;$B2BDD8
	EOR #$FFFF				;$B2BDDA
	INC					;$B2BDDD
CODE_B2BDDE:
	CMP #$8000				;$B2BDDE
	ROR					;$B2BDE1
	CMP #$8000				;$B2BDE2
	ROR					;$B2BDE5
	CLC					;$B2BDE6
	ADC temp_1C				;$B2BDE7
	CLC					;$B2BDE9
	ADC #$0030				;$B2BDEA
	STA sprite.general_purpose_4E,x		;$B2BDED
	RTS					;$B2BDEF

CODE_B2BDF0:
	LDX current_sprite			;$B2BDF0
	LDA temp_1A				;$B2BDF2
	BCS CODE_B2BDFA				;$B2BDF4
	EOR #$FFFF				;$B2BDF6
	INC					;$B2BDF9
CODE_B2BDFA:
	CMP #$8000				;$B2BDFA
	ROR					;$B2BDFD
	CLC					;$B2BDFE
	ADC temp_1C				;$B2BDFF
	CLC					;$B2BE01
	ADC #$0030				;$B2BE02
	STA sprite.general_purpose_4E,x		;$B2BE05
	RTS					;$B2BE07

CODE_B2BE08:
	LDX current_sprite			;$B2BE08
	LDA sprite.y_position,x			;$B2BE0A
	CMP sprite.general_purpose_4E,x		;$B2BE0C
	BCC CODE_B2BE1D				;$B2BE0E
	LDA sprite.animation_address,x		;$B2BE10
	AND #$FFFE				;$B2BE12
	CMP sprite.animation_address,x		;$B2BE15
	STA sprite.animation_address,x		;$B2BE17
	BEQ CODE_B2BE24				;$B2BE19
	CLC					;$B2BE1B
	RTS					;$B2BE1C

CODE_B2BE1D:
	LDA sprite.animation_address,x		;$B2BE1D
	ORA #$0001				;$B2BE1F
	STA sprite.animation_address,x		;$B2BE22
CODE_B2BE24:
	SEC					;$B2BE24
	RTS					;$B2BE25

CODE_B2BE26:
	LDX current_sprite			;$B2BE26
	LDA sprite.general_purpose_64,x		;$B2BE28
	STA sprite.x_position,x			;$B2BE2A
	LDA sprite.general_purpose_66,x		;$B2BE2C
	STA sprite.y_position,x			;$B2BE2E
	STZ sprite.terrain_interaction,x	;$B2BE30
	JSR CODE_B2BAE4				;$B2BE32
	ADC sprite.x_sub_position+1,x		;$B2BE35
	STA sprite.x_sub_position+1,x		;$B2BE37
	SEP #$20				;$B2BE39
	LDA temp_40				;$B2BE3B
	ADC sprite.x_position+1,x		;$B2BE3D
	STA sprite.x_position+1,x		;$B2BE3F
	REP #$20				;$B2BE41
	JSR CODE_B2BD77				;$B2BE43
	LDA sprite.general_purpose_4E,x		;$B2BE46
	BNE CODE_B2BE56				;$B2BE48
	STZ sprite.ground_y_position,x		;$B2BE4A
	LDA #$8090				;$B2BE4C
	STA sprite.ground_distance,x		;$B2BE4F
	STZ sprite.terrain_attributes,x		;$B2BE51
	CLC					;$B2BE53
	BRA CODE_B2BE6B				;$B2BE54

CODE_B2BE56:
	STA sprite.y_position,x			;$B2BE56
	STZ sprite.ground_distance,x		;$B2BE58
	LDA sprite.terrain_interaction,x	;$B2BE5A
	ORA #$0001				;$B2BE5C
	STA sprite.terrain_interaction,x	;$B2BE5F
	LDA #$0100				;$B2BE61
	STA sprite.y_speed,x			;$B2BE64
	LDA sprite.general_purpose_50,x		;$B2BE66
	STA sprite.terrain_attributes,x		;$B2BE68
	SEC					;$B2BE6A
CODE_B2BE6B:
	LDA sprite.general_purpose_64,x		;$B2BE6B
	LDY sprite.x_position,x			;$B2BE6D
	STA sprite.x_position,x			;$B2BE6F
	STY sprite.general_purpose_64,x		;$B2BE71
	LDA sprite.general_purpose_66,x		;$B2BE73
	LDY sprite.y_position,x			;$B2BE75
	STA sprite.y_position,x			;$B2BE77
	STY sprite.general_purpose_66,x		;$B2BE79
	RTS					;$B2BE7B

CODE_B2BE7C:
	LDA timestop_flags			;$B2BE7C
	AND #$0004				;$B2BE7F
	BNE CODE_B2BEBD				;$B2BE82
	LDX current_sprite			;$B2BE84
	LDA sprite.x_speed,x			;$B2BE86
	BEQ CODE_B2BEBD				;$B2BE88
	LDA $051F				;$B2BE8A
	DEC					;$B2BE8D
	BMI CODE_B2BEBD				;$B2BE8E
	LDA sprite.terrain_interaction,x	;$B2BE90
	AND #$0101				;$B2BE92
	CMP #$0001				;$B2BE95
	BEQ CODE_B2BEBE				;$B2BE98
	CMP #$0101				;$B2BE9A
	BNE CODE_B2BEBD				;$B2BE9D
	LDA sprite.state,x			;$B2BE9F
	AND #$00FF				;$B2BEA1
	CMP #$0002				;$B2BEA4
	BEQ CODE_B2BEB3				;$B2BEA7
	JSL CODE_808018				;$B2BEA9
	LSR					;$B2BEAD
	CMP sprite.x_speed,x			;$B2BEAE
	BCC CODE_B2BEBE				;$B2BEB0
	RTS					;$B2BEB2

CODE_B2BEB3:
	JSL CODE_808018				;$B2BEB3
	LSR					;$B2BEB7
	LSR					;$B2BEB8
	CMP sprite.x_speed,x			;$B2BEB9
	BCC CODE_B2BEBE				;$B2BEBB
CODE_B2BEBD:
	RTS					;$B2BEBD

CODE_B2BEBE:
	LDY #$0038				;$B2BEBE
	LDA sprite.state,x			;$B2BEC1
	AND #$00FF				;$B2BEC3
	CMP #$0002				;$B2BEC6
	BEQ CODE_B2BECE				;$B2BEC9
	LDY #$003A				;$B2BECB
CODE_B2BECE:
	JSL CODE_BB8585				;$B2BECE
	BCS CODE_B2BEBD				;$B2BED2
	DEC $051F				;$B2BED4
	LDX alternate_sprite			;$B2BED7
	LDY current_sprite			;$B2BED9
	STY sprite.general_purpose_5C,x		;$B2BEDB
	STZ sprite.general_purpose_5E,x		;$B2BEDD
	INC sprite.state,x			;$B2BEDF
	JMP CODE_B2BEF8				;$B2BEE1

toboggan_sparks_main:
	JSL process_sprite_animation		;$B2BEE4  \
	LDA sprite.type,x			;$B2BEE8   |
	BEQ .CODE_B2BEF2			;$B2BEEA   |
	JSL CODE_BBAB46				;$B2BEEC   |
	BCC .return				;$B2BEF0  /
.CODE_B2BEF2:
	INC $051F				;$B2BEF2  |>
.return:
	JML [$04F5]				;$B2BEF5  |>

CODE_B2BEF8:
	PHK					;$B2BEF8  \
	PLB					;$B2BEF9   |
	LDY sprite.general_purpose_5C,x		;$B2BEFA   |
	LDA.w sprite.ground_distance,y		;$B2BEFC   |
	BNE CODE_B2BF2A				;$B2BEFF   |
	LDA.w sprite.animation_id,y		;$B2BF01   |
	AND #$00FF				;$B2BF04   |
	TAY					;$B2BF07   |
	LDA DATA_B2BF38,y			;$B2BF08   |
	JSR CODE_B2BF2B				;$B2BF0B   |
	STA $1A					;$B2BF0E   |
	LDA DATA_B2BF45,y			;$B2BF10   |
	JSR CODE_B2BF2B				;$B2BF13   |
	STA $1C					;$B2BF16   |
	LDY sprite.general_purpose_5C,x		;$B2BF18   |
	LDA.w sprite.x_position,y		;$B2BF1A   |
	CLC					;$B2BF1D   |
	ADC.b $1A				;$B2BF1E   |
	STA.b sprite.x_position,x		;$B2BF20   |
	LDA.w sprite.y_position,y		;$B2BF22   |
	CLC					;$B2BF25   |
	ADC.b $1C				;$B2BF26   |
	STA.b sprite.y_position,x		;$B2BF28  /
CODE_B2BF2A:
	RTS					;$B2BF2A  |>

CODE_B2BF2B:
	BIT #$0080				;$B2BF2B  \
	BEQ CODE_B2BF34				;$B2BF2E   |
	ORA #$FF00				;$B2BF30   |
	RTS					;$B2BF33  /

CODE_B2BF34:
	AND #$00FF				;$B2BF34  \
	RTS					;$B2BF37  /

DATA_B2BF38:
	db $EE,$EB,$E9,$E8,$E8,$E8,$E8,$E9,$EA,$EC,$EF,$F0,$F3

DATA_B2BF45:
	db $ED,$EF,$F2,$F5,$F8,$FB,$FE,$02,$06,$08,$0A,$0D,$10

large_pipe_main:
	JSL CODE_BBAB52				;$B2BF52  \
	BCS .CODE_B2BF89			;$B2BF56   |
	CPX $CC					;$B2BF58   |
	BEQ .CODE_B2BF68			;$B2BF5A   |
	CPX $CE					;$B2BF5C   |
	BEQ .CODE_B2BF64			;$B2BF5E   |
	LDA $CC					;$B2BF60   |
	BEQ .CODE_B2BF68			;$B2BF62  /
.CODE_B2BF64:
	STX $CE					;$B2BF64  \
	BRA .CODE_B2BF6A			;$B2BF66  /

.CODE_B2BF68:
	STX $CC					;$B2BF68  |>
.CODE_B2BF6A:
	JSL populate_sprite_clipping		;$B2BF6A  \
	LDA $001840				;$B2BF6E   |
	STA sprite.general_purpose_4C,x		;$B2BF72   |
	LDA $001844				;$B2BF74   |
	STA sprite.general_purpose_4E,x		;$B2BF78   |
	LDA $001842				;$B2BF7A   |
	STA sprite.general_purpose_50,x		;$B2BF7E   |
	LDA $001846				;$B2BF80   |
	STA sprite.general_purpose_52,x		;$B2BF84   |
	JML [$04F5]				;$B2BF86  /

.CODE_B2BF89:
	LDA current_sprite			;$B2BF89  \
	CMP $CC					;$B2BF8B   |
	BNE .CODE_B2BF91			;$B2BF8D   |
	STZ $CC					;$B2BF8F  /
.CODE_B2BF91:
	CMP $CE					;$B2BF91  \
	BNE .return				;$B2BF93   |
	STZ $CE					;$B2BF95  /
.return:
	JML [$04F5]				;$B2BF97  |>


npc_kong_main:
	LDA active_kong_control_variables	;$B2BF9A  \
	CPY active_kong_sprite			;$B2BF9D   |
	BEQ CODE_B2BFA5				;$B2BFA0   |
	LDA follower_kong_control_variables	;$B2BFA2  /
CODE_B2BFA5:
	STA current_kong_control_variables	;$B2BFA5  \
	JSR (DATA_B2BFB8,x)			;$B2BFA7   |
	JSR CODE_B2BFC2				;$B2BFAA   |
	JSL process_current_movement		;$B2BFAD   |
	JSL process_anim_preserve_state		;$B2BFB1   |
	JML [$04F5]				;$B2BFB5  /

DATA_B2BFB8:
	dw CODE_B2BFDF
	dw CODE_B2BFE0
	dw CODE_B2C037
	dw CODE_B2C026
	dw CODE_B2C010

CODE_B2BFC2:
	LDX active_kong_sprite			;$B2BFC2  \
	LDY follower_kong_sprite		;$B2BFC5   |
	LDA sprite.y_position,x			;$B2BFC8   |
	CMP.w sprite.y_position,y		;$B2BFCA   |
	BCC CODE_B2BFD2				;$B2BFCD   |
	TYA					;$B2BFCF   |
	TXY					;$B2BFD0   |
	TAX					;$B2BFD1  /
CODE_B2BFD2:
	LDA.w sprite.render_order,y		;$B2BFD2  \
	PHA					;$B2BFD5   |
	LDA sprite.render_order,x		;$B2BFD6   |
	STA.w sprite.render_order,y		;$B2BFD8   |
	PLA					;$B2BFDB   |
	STA sprite.render_order,x		;$B2BFDC   |
	RTS					;$B2BFDE  /

CODE_B2BFDF:
	RTS					;$B2BFDF  |>

CODE_B2BFE0:
	LDA #$0012				;$B2BFE0  \
	JSL process_alternate_movement		;$B2BFE3   |
	BCC CODE_B2C008				;$B2BFE7   |
	LDA sprite.oam_property,x		;$B2BFE9   |
	BIT #$4000				;$B2BFEB   |
	BEQ CODE_B2C002				;$B2BFEE   |
	LDA #$8000				;$B2BFF0   |
	STA sprite.x_sub_position,x		;$B2BFF3   |
	LDA #$0001				;$B2BFF5   |
	STA sprite.max_x_speed,x		;$B2BFF8   |
	STZ sprite.x_speed,x			;$B2BFFA   |
	LDA sprite.x_position,x			;$B2BFFC   |
	DEC					;$B2BFFE   |
	STA sprite.general_purpose_5E,x		;$B2BFFF   |
	RTS					;$B2C001  /

CODE_B2C002:
	STZ sprite.state,x			;$B2C002  \
	STZ sprite.max_x_speed,x		;$B2C004   |
	STZ sprite.x_speed,x			;$B2C006  /
CODE_B2C008:
	LDA #$0003				;$B2C008  \
	JSL process_alternate_movement		;$B2C00B   |
	RTS					;$B2C00F  /

CODE_B2C010:
	LDA #$0012				;$B2C010  \
	JSL process_alternate_movement		;$B2C013   |
	BCC CODE_B2C025				;$B2C017   |
	STZ sprite.state,x			;$B2C019   |
	STZ sprite.max_x_speed,x		;$B2C01B   |
	STZ sprite.x_speed,x			;$B2C01D   |
	LDA #$0800				;$B2C01F   |
	TSB $1C35				;$B2C022  /
CODE_B2C025:
	RTS					;$B2C025  |>

CODE_B2C026:
	LDA #$0085				;$B2C026  \
	JSL set_anim_handle_kiddy		;$B2C029   |
	LDA #$0001				;$B2C02D   |
	STA sprite.state,x			;$B2C030   |
	STZ sprite.y_speed,x			;$B2C032   |
	STZ sprite.max_y_speed,x		;$B2C034   |
	RTS					;$B2C036  /

CODE_B2C037:
	LDA #$0012				;$B2C037  \
	JSL process_alternate_movement		;$B2C03A   |
	BCC CODE_B2C048				;$B2C03E   |
	STZ sprite.max_x_speed,x		;$B2C040   |
	STZ sprite.x_speed,x			;$B2C042   |
	STZ sprite.general_purpose_6A,x		;$B2C044   |
	BRA CODE_B2C084				;$B2C046  /

CODE_B2C048:
	LDA sprite.movement_state,x		;$B2C048  \
	BNE CODE_B2C084				;$B2C04A   |
	LDA sprite.general_purpose_6A,x		;$B2C04C   |
	BMI CODE_B2C085				;$B2C04E   |
	LDY sprite.x_speed,x			;$B2C050   |
	BPL CODE_B2C05A				;$B2C052   |
	CMP sprite.x_position,x			;$B2C054   |
	BPL CODE_B2C05E				;$B2C056   |
	BRA CODE_B2C084				;$B2C058  /

CODE_B2C05A:
	CMP sprite.x_position,x			;$B2C05A  \
	BPL CODE_B2C084				;$B2C05C  /
CODE_B2C05E:
	LDA #$0084				;$B2C05E  \
	JSL set_anim_handle_kiddy		;$B2C061   |
	LDA sprite.x_speed,x			;$B2C065   |
	CMP #$8000				;$B2C067   |
	ROR					;$B2C06A   |
	CMP #$8000				;$B2C06B   |
	ROR					;$B2C06E   |
	CLC					;$B2C06F   |
	ADC sprite.x_speed,x			;$B2C070   |
	STA sprite.x_speed,x			;$B2C072   |
	LDA sprite.y_position,x			;$B2C074   |
	STA sprite.general_purpose_60,x		;$B2C076   |
	LDA #$F780				;$B2C078   |
	STA sprite.max_y_speed,x		;$B2C07B   |
	STA sprite.y_speed,x			;$B2C07D   |
	LDA #$003C				;$B2C07F   |
	STA sprite.movement_state,x		;$B2C082  /
CODE_B2C084:
	RTS					;$B2C084  |>

CODE_B2C085:
	AND #$0FFF				;$B2C085  \
	CMP sprite.x_position,x			;$B2C088   |
	BMI CODE_B2C084				;$B2C08A   |
	BRA CODE_B2C05E				;$B2C08C  /


map_kong_main:
	LDA #$007E				;$B2C08E  \
	STA $6C					;$B2C091   |
	LDA #$0100				;$B2C093   |
	BIT $05FB				;$B2C096   |
	BNE CODE_B2C0A2				;$B2C099   |
	JSR (DATA_B2C0AE,x)			;$B2C09B   |
	JSL process_current_movement		;$B2C09E  /
CODE_B2C0A2:
	JSL process_anim_preserve_state		;$B2C0A2  \
	LDA.w #DATA_FF206A>>16			;$B2C0A6   |
	STA $6C					;$B2C0A9   |
	JML [$04F5]				;$B2C0AB  /

DATA_B2C0AE:
	dw CODE_B2C361
	dw CODE_B2C298
	dw CODE_B2C32E
	dw CODE_B2C33B
	dw CODE_B2C25D
	dw CODE_B2CA18
	dw CODE_B2C45B
	dw CODE_B2C5C4
	dw CODE_B2C362
	dw CODE_B2C983
	dw CODE_B2C2FF
	dw CODE_B2C313
	dw CODE_B2C561
	dw CODE_B2C31C
	dw CODE_B2C3E1
	dw CODE_B2C403
	dw CODE_B2C3D1
	dw CODE_B2C433
	dw CODE_B2C1FA
	dw CODE_B2C224
	dw CODE_B2C1A1
	dw CODE_B2C1AB
	dw CODE_B2C1AC
	dw CODE_B2C166
	dw CODE_B2C18F
	dw CODE_B2C0E6
	dw CODE_B2C13B
	dw CODE_B2C11F

CODE_B2C0E6:
	CPY active_kong_sprite			;$B2C0E6  \
	BNE CODE_B2C0F4				;$B2C0E9   |
	LDY #$0308				;$B2C0EB   |
	JSL CODE_BB85B8				;$B2C0EE   |
	LDY current_sprite			;$B2C0F2  /
CODE_B2C0F4:
	LDA #$0001				;$B2C0F4  \
	STA sprite.state,y			;$B2C0F7   |
	LDA sprite.oam_property,y		;$B2C0FA   |
	AND #$EFFF				;$B2C0FD   |
	STA sprite.oam_property,y		;$B2C100   |
	LDA #$0318				;$B2C103   |
	JSL set_sprite_animation		;$B2C106   |
	STZ $1C41				;$B2C10A   |
	STZ $1C57				;$B2C10D   |
	LDY active_kong_sprite			;$B2C110   |
	LDA sprite.general_purpose_6A,x		;$B2C113   |
	STA sprite.general_purpose_6A,y		;$B2C115   |
	LDA #$0009				;$B2C118   |
	STA sprite.movement_state,y		;$B2C11B   |
	RTS					;$B2C11E  /

CODE_B2C11F:
	CPY active_kong_sprite			;$B2C11F  \
	BNE CODE_B2C12D				;$B2C122   |
	LDY #$0300				;$B2C124   |
	JSL CODE_BB85B8				;$B2C127   |
	LDY current_sprite			;$B2C12B  /
CODE_B2C12D:
	LDA #$0001				;$B2C12D
	STA sprite.state,y			;$B2C130
	LDA #$0319				;$B2C133
	JSL set_sprite_animation		;$B2C136
	RTS					;$B2C13A

CODE_B2C13B:
	CPY active_kong_sprite			;$B2C13B
	BNE CODE_B2C149				;$B2C13E
	LDY #$030A				;$B2C140
	JSL CODE_BB85B8				;$B2C143
	LDY current_sprite			;$B2C147
CODE_B2C149:
	LDA #$0001				;$B2C149
	STA.w sprite.state,y			;$B2C14C
	LDA.w sprite.oam_property,y		;$B2C14F
	AND #$EFFF				;$B2C152
	STA.w sprite.oam_property,y		;$B2C155
	LDA #$0040				;$B2C158
	STA.w sprite.general_purpose_5E,y	;$B2C15B
	LDA #$0318				;$B2C15E
	JSL set_sprite_animation		;$B2C161
	RTS					;$B2C165

CODE_B2C166:
	CPY active_kong_sprite			;$B2C166
	BNE CODE_B2C179				;$B2C169
	LDY #$0306				;$B2C16B
	JSL CODE_BB8585				;$B2C16E
	LDY current_sprite			;$B2C172
	LDA alternate_sprite			;$B2C174
	STA.w sprite.unknown_32,y		;$B2C176
CODE_B2C179:
	LDA #$0001				;$B2C179
	STA.w sprite.state,y			;$B2C17C
	LDA.w sprite.oam_property,y		;$B2C17F
	AND #$CFFF				;$B2C182
	STA.w sprite.oam_property,y		;$B2C185
	LDA #$0120				;$B2C188
	STA.w sprite.general_purpose_5E,y	;$B2C18B
	RTS					;$B2C18E

CODE_B2C18F:
	LDX sprite.unknown_32,y			;$B2C18F
	BEQ CODE_B2C1A0				;$B2C191
	JSL CODE_BB85E8				;$B2C193
	LDX current_sprite			;$B2C197
	LDA #$0001				;$B2C199
	STA sprite.state,x			;$B2C19C
	STZ sprite.unknown_32,x			;$B2C19E
CODE_B2C1A0:
	RTS					;$B2C1A0

CODE_B2C1A1:
	TYX					;$B2C1A1
	INC sprite.state,x			;$B2C1A2
	LDA #$031A				;$B2C1A4
	JSL set_sprite_animation		;$B2C1A7
CODE_B2C1AB:
	RTS					;$B2C1AB

CODE_B2C1AC:
	TYX					;$B2C1AC
	STZ sprite.movement_state,x		;$B2C1AD
	CPX active_kong_sprite			;$B2C1AF
	BNE CODE_B2C1F9				;$B2C1B2
	LDA map_node_number			;$B2C1B4
	CMP #$0003				;$B2C1B7
	BNE CODE_B2C1D7				;$B2C1BA
	LDA player_active_pressed		;$B2C1BC
	BIT #$0100				;$B2C1BF
	BEQ CODE_B2C1F9				;$B2C1C2
	STZ $1C41				;$B2C1C4
	STZ $1C57				;$B2C1C7
	LDA #$0001				;$B2C1CA
	STA sprite.state,x			;$B2C1CD
	LDA #$0013				;$B2C1CF
	JSL CODE_B48012				;$B2C1D2
	RTS					;$B2C1D6

CODE_B2C1D7:
	LDA map_node_number			;$B2C1D7
	CMP #$000A				;$B2C1DA
	BNE CODE_B2C1F9				;$B2C1DD
	LDA player_active_pressed		;$B2C1DF
	BIT #$0200				;$B2C1E2
	BEQ CODE_B2C1F9				;$B2C1E5
	STZ $1C41				;$B2C1E7
	STZ $1C57				;$B2C1EA
	LDA #$0001				;$B2C1ED
	STA sprite.state,x			;$B2C1F0
	LDA #$0010				;$B2C1F2
	JSL CODE_B48012				;$B2C1F5
CODE_B2C1F9:
	RTS					;$B2C1F9

CODE_B2C1FA:
	TYX					;$B2C1FA
	INC sprite.state,x			;$B2C1FB
	LDA #$0319				;$B2C1FD
	JSL set_sprite_animation		;$B2C200
	LDA #$060D				;$B2C204
	JSL queue_sound_effect			;$B2C207
	LDA #$0080				;$B2C20B
	STA $1C39				;$B2C20E
	CPX follower_kong_sprite		;$B2C211
	BNE CODE_B2C223				;$B2C214
	LDA $05AF				;$B2C216
	BIT #$4000				;$B2C219
	BNE CODE_B2C223				;$B2C21C
	LDA #$C000				;$B2C21E
	STA sprite.visibility,x			;$B2C221
CODE_B2C223:
	RTS					;$B2C223

CODE_B2C224:
	TYX					;$B2C224
	LDA sprite.y_speed,x			;$B2C225
	CLC					;$B2C227
	ADC #$0040				;$B2C228
	STA sprite.y_speed,x			;$B2C22B
	LDA sprite.x_speed,x			;$B2C22D
	BPL CODE_B2C255				;$B2C22F
	LDA sprite.x_position,x			;$B2C231
	CMP sprite.general_purpose_4C,x		;$B2C233
	BCS CODE_B2C254				;$B2C235
CODE_B2C237:
	LDA #$0004				;$B2C237
	STA sprite.state,x			;$B2C23A
	LDA #$02E9				;$B2C23C
	JSL set_sprite_animation		;$B2C23F
	CPX follower_kong_sprite		;$B2C243
	BNE CODE_B2C254				;$B2C246
	LDA sprite.general_purpose_4E,x		;$B2C248
	JSL CODE_B48012				;$B2C24A
	LDA #$4000				;$B2C24E
	TRB $05FB				;$B2C251
CODE_B2C254:
	RTS					;$B2C254

CODE_B2C255:
	LDA sprite.x_position,x			;$B2C255
	CMP sprite.general_purpose_4C,x		;$B2C257
	BCC CODE_B2C254				;$B2C259
	BRA CODE_B2C237				;$B2C25B

CODE_B2C25D:
	TYX					;$B2C25D
	LDA #$00C0				;$B2C25E
	STA sprite.unknown_32,x			;$B2C261
	LDA current_world			;$B2C263
	CMP #!world_kremwood_forest		;$B2C266
	BCS CODE_B2C271				;$B2C269
	LDY #$3000				;$B2C26B
	JSR CODE_B2C555				;$B2C26E
CODE_B2C271:
	STZ $05E3				;$B2C271
	STZ sprite.x_speed,x			;$B2C274
	STZ sprite.y_speed,x			;$B2C276
	LDA #$02ED				;$B2C278
	JSL set_sprite_animation		;$B2C27B
	LDY #$0000				;$B2C27F
	CPX active_kong_sprite			;$B2C282
	BNE CODE_B2C295				;$B2C285
	LDA #$8000				;$B2C287
	STA $04A6				;$B2C28A
	STA $04A8				;$B2C28D
	LDX current_sprite			;$B2C290
	LDY #$0001				;$B2C292
CODE_B2C295:
	STY sprite.state,x			;$B2C295
	RTS					;$B2C297

CODE_B2C298:
	LDA #$0100				;$B2C298
	BIT $1C35				;$B2C29B
	BNE CODE_B2C2FE				;$B2C29E
	LDA #$6000				;$B2C2A0
	BIT $05FB				;$B2C2A3
	BNE CODE_B2C2FE				;$B2C2A6
	JSR CODE_B2CA2B				;$B2C2A8
	LDA sprite.movement_state,x		;$B2C2AB
	BNE CODE_B2C2F7				;$B2C2AD
	LDA sprite.ground_y_position,x		;$B2C2AF
	BEQ CODE_B2C2F7				;$B2C2B1
	LDA $05AF				;$B2C2B3
	BIT #$4000				;$B2C2B6
	BEQ CODE_B2C2C0				;$B2C2B9
	LDA.w sprite.movement_state,y		;$B2C2BB
	BNE CODE_B2C2F7				;$B2C2BE
CODE_B2C2C0:
	LDA player_active_held			;$B2C2C0
	BIT #$0800				;$B2C2C3
	BEQ CODE_B2C2D0				;$B2C2C6
	LDA #$0006				;$B2C2C8
	JSL CODE_B4800F				;$B2C2CB
	RTS					;$B2C2CF

CODE_B2C2D0:
	BIT #$0400				;$B2C2D0
	BEQ CODE_B2C2DD				;$B2C2D3
	LDA #$0007				;$B2C2D5
	JSL CODE_B4800F				;$B2C2D8
	RTS					;$B2C2DC

CODE_B2C2DD:
	BIT #$0200				;$B2C2DD
	BEQ CODE_B2C2EA				;$B2C2E0
	LDA #$0009				;$B2C2E2
	JSL CODE_B4800F				;$B2C2E5
	RTS					;$B2C2E9

CODE_B2C2EA:
	BIT #$0100				;$B2C2EA
	BEQ CODE_B2C2F7				;$B2C2ED
	LDA #$0008				;$B2C2EF
	JSL CODE_B4800F				;$B2C2F2
	RTS					;$B2C2F6

CODE_B2C2F7:
	LDX $1C8F				;$B2C2F7
	BEQ CODE_B2C2FE				;$B2C2FA
	STY sprite.general_purpose_5E,x		;$B2C2FC
CODE_B2C2FE:
	RTS					;$B2C2FE

CODE_B2C2FF:
	TYX					;$B2C2FF
	LDA #$0309				;$B2C300
	JSR CODE_B2C50E				;$B2C303
	LDA #$000D				;$B2C306
	STA sprite.state,x			;$B2C309
	LDA #$0769				;$B2C30B
	JSL queue_sound_effect			;$B2C30E
	RTS					;$B2C312

CODE_B2C313:
	TYX					;$B2C313
	STZ $1C,x				;$B2C314
	LDA #$0004				;$B2C316
	STA sprite.state,x			;$B2C319
	RTS					;$B2C31B

CODE_B2C31C:
	LDA $001C,y				;$B2C31C
	CLC					;$B2C31F
	ADC #$0008				;$B2C320
	STA $001C,y				;$B2C323
	CLC					;$B2C326
	ADC.w sprite.max_y_speed,y		;$B2C327
	STA.w sprite.max_y_speed,y		;$B2C32A
	RTS					;$B2C32D

CODE_B2C32E:
	LDA #$FC01				;$B2C32E
	STA $04E4				;$B2C331
	LDA #$0004				;$B2C334
	STA.w sprite.state,y			;$B2C337
	RTS					;$B2C33A

CODE_B2C33B:
	TYX					;$B2C33B
	CPX active_kong_sprite			;$B2C33C
	BNE CODE_B2C34B				;$B2C33F
	LDA sprite.general_purpose_5E,x		;$B2C341
	CLC					;$B2C343
	ADC #$0020				;$B2C344
	STA sprite.general_purpose_5E,x		;$B2C347
	BRA CODE_B2C352				;$B2C349

CODE_B2C34B:
	LDA #$066C				;$B2C34B
	JSL queue_sound_effect			;$B2C34E
CODE_B2C352:
	STZ sprite.state,x			;$B2C352
	LDA #$FE01				;$B2C354
	STA $04E4				;$B2C357
	LDA #$0309				;$B2C35A
	JSR CODE_B2C50E				;$B2C35D
	RTS					;$B2C360

CODE_B2C361:
	RTS					;$B2C361

CODE_B2C362:
	JSL CODE_B7D7FB				;$B2C362
	LDX current_sprite			;$B2C366
	LDY #$2000				;$B2C368
	JSR CODE_B2C555				;$B2C36B
	LDA #$0002				;$B2C36E
	STA map_node_number			;$B2C371
	STZ $1C41				;$B2C374
	STZ $1C57				;$B2C377
	LDA #$0009				;$B2C37A
	STA sprite.state,x			;$B2C37D
	LDA #$8001				;$B2C37F
	ORA sprite.visibility,x			;$B2C382
	STA sprite.visibility,x			;$B2C384
	STZ sprite.movement_state,x		;$B2C386
	STZ sprite.x_speed,x			;$B2C388
	STZ sprite.y_speed,x			;$B2C38A
	LDA #$4000				;$B2C38C
	TSB $0611				;$B2C38F
	LDA #$0000				;$B2C392
	CPX active_kong_sprite			;$B2C395
	BNE CODE_B2C39D				;$B2C398
	LDA #$0009				;$B2C39A
CODE_B2C39D:
	STA sprite.state,x			;$B2C39D
	LDA #$02F7				;$B2C39F
	CPX active_kong_sprite			;$B2C3A2
	BNE CODE_B2C3C8				;$B2C3A5
	LDA $05ED				;$B2C3A7
	STA sprite.x_position,x			;$B2C3AA
	LDA $05EF				;$B2C3AC
	STA sprite.y_position,x			;$B2C3AF
	LDA #$1000				;$B2C3B1
	BIT $05FD				;$B2C3B4
	BEQ CODE_B2C3C5				;$B2C3B7
	LDA #$00F1				;$B2C3B9
	JSL CODE_BB85A0				;$B2C3BC
	LDA #$0300				;$B2C3C0
	BRA CODE_B2C3C8				;$B2C3C3

CODE_B2C3C5:
	LDA #$02EE				;$B2C3C5
CODE_B2C3C8:
	JSL set_sprite_animation		;$B2C3C8
	RTS					;$B2C3CC

DATA_B2C3CD:
	db $02,$03,$04,$06

CODE_B2C3D1:
	LDA current_world			;$B2C3D1
	BNE CODE_B2C417				;$B2C3D4
	LDA #$0004				;$B2C3D6
	BIT $05FB				;$B2C3D9
	BEQ CODE_B2C417				;$B2C3DC
	JMP CODE_B2C362				;$B2C3DE

CODE_B2C3E1:
	TYX					;$B2C3E1
	STZ sprite.state,x			;$B2C3E2
	JSR CODE_B2C4E1				;$B2C3E4
	JSR CODE_B2C519				;$B2C3E7
	JSR CODE_B2C547				;$B2C3EA
	LDX current_sprite			;$B2C3ED
	CPX active_kong_sprite			;$B2C3EF
	BNE CODE_B2C402				;$B2C3F2
	LDY #$0026				;$B2C3F4
	JSL CODE_BB8585				;$B2C3F7
	LDA #$076A				;$B2C3FB
	JSL queue_sound_effect			;$B2C3FE
CODE_B2C402:
	RTS					;$B2C402

CODE_B2C403:
	LDA #$0170				;$B2C403
	STA.w sprite.general_purpose_5E,y	;$B2C406
	LDX follower_kong_sprite		;$B2C409
	LDA #$0180				;$B2C40C
	STA sprite.general_purpose_5E,x		;$B2C40F
	LDX #$001E				;$B2C411
	JMP CODE_B2C753				;$B2C414

CODE_B2C417:
	TYX					;$B2C417
	LDA #$0001				;$B2C418
	STA sprite.movement_state,x		;$B2C41B
	LDA #$0011				;$B2C41D
	STA sprite.state,x			;$B2C420
	LDA #$FF70				;$B2C422
	STA sprite.general_purpose_5C,x		;$B2C425
	LDA #$0012				;$B2C427
	STA $1C,x				;$B2C42A
	LDA #$0309				;$B2C42C
	JSR CODE_B2C50E				;$B2C42F
	RTS					;$B2C432

CODE_B2C433:
	TYX					;$B2C433
	LDA sprite.y_speed,x			;$B2C434
	CLC					;$B2C436
	ADC sprite.general_purpose_5C,x		;$B2C437
	STA sprite.y_speed,x			;$B2C439
	LDA sprite.general_purpose_5C,x		;$B2C43B
	CLC					;$B2C43D
	ADC #$0019				;$B2C43E
	STA sprite.general_purpose_5C,x		;$B2C441
	DEC $1C,x				;$B2C443
	BEQ CODE_B2C448				;$B2C445
	RTS					;$B2C447

CODE_B2C448:
	LDA #$0006				;$B2C448
	STA sprite.state,x			;$B2C44B
	LDA sprite.visibility,x			;$B2C44D
	BIT #$4000				;$B2C44F
	BNE CODE_B2C45B				;$B2C452
	LDA #$076A				;$B2C454
	JSL queue_sound_effect			;$B2C457
CODE_B2C45B:
	JSR CODE_B2C4E1				;$B2C45B
	CPX active_kong_sprite			;$B2C45E
	BNE CODE_B2C469				;$B2C461
	LDA #$00EE				;$B2C463
	STA $1C9D				;$B2C466
CODE_B2C469:
	LDY #$2000				;$B2C469
	JSR CODE_B2C555				;$B2C46C
	LDY sprite.unknown_32,x			;$B2C46F
	LDA #$0007				;$B2C471
	CPX active_kong_sprite			;$B2C474
	BEQ CODE_B2C4AF				;$B2C477
	JSL process_current_movement		;$B2C479
	LDY active_kong_sprite			;$B2C47D
	LDA.w sprite.general_purpose_60,y	;$B2C480
	STA $7EA258				;$B2C483
	LDA sprite.x_position,x			;$B2C487
	STA $7EA25A				;$B2C489
	LDA sprite.y_position,x			;$B2C48D
	STA $7EA25C				;$B2C48F
	PHB					;$B2C493
	LDA $1C9D				;$B2C494
	BNE CODE_B2C49C				;$B2C497
	LDA #$00EE				;$B2C499
CODE_B2C49C:
	INC					;$B2C49C
	LDX #$A258				;$B2C49D
	LDY #$A25E				;$B2C4A0
	MVN $7E, $7E				;$B2C4A3
	PLB					;$B2C4A6
	LDX current_sprite			;$B2C4A7
	LDA sprite.unknown_32,x			;$B2C4A9
	TAY					;$B2C4AB
	LDA #$000C				;$B2C4AC
CODE_B2C4AF:
	STA sprite.state,x			;$B2C4AF
	LDA #$0001				;$B2C4B1
	STA sprite.movement_state,x		;$B2C4B4
	STY sprite.general_purpose_62,x		;$B2C4B6
	STZ sprite.general_purpose_68,x		;$B2C4B8
	LDA #$00A1				;$B2C4BA
	STA sprite.general_purpose_6A,x		;$B2C4BD
	LDA #$0061				;$B2C4BF
	STA sprite.general_purpose_64,x		;$B2C4C2
	LDA #$0008				;$B2C4C4
	STA sprite.general_purpose_66,x		;$B2C4C7
	JSR CODE_B2C519			;$B2C4C9
	CPY active_kong_sprite		;$B2C4CC
	BNE CODE_B2C4E0			;$B2C4CF
	LDA current_world			;$B2C4D1
	BNE CODE_B2C4D9			;$B2C4D4
	JSR CODE_B2C547			;$B2C4D6
CODE_B2C4D9:
	LDA #$056B				;$B2C4D9
	JSL queue_sound_effect		;$B2C4DC
CODE_B2C4E0:
	RTS					;$B2C4E0

CODE_B2C4E1:
	LDA.w sprite.animation_id,y		;$B2C4E1
	SEC					;$B2C4E4
	SBC $003C,y				;$B2C4E5
	STA temp_1A				;$B2C4E8
	TAX					;$B2C4EA
	LDA.w sprite.oam_property,y		;$B2C4EB
	BIT #$4000				;$B2C4EE
	BEQ CODE_B2C4FA				;$B2C4F1
	LDA #$0008				;$B2C4F3
	SEC					;$B2C4F6
	SBC temp_1A				;$B2C4F7
	TAX					;$B2C4F9
CODE_B2C4FA:
	TXA					;$B2C4FA
	XBA					;$B2C4FB
	LSR					;$B2C4FC
	AND #$03FF				;$B2C4FD
	STA.w sprite.general_purpose_60,y	;$B2C500
	LDA temp_1A				;$B2C503
	CLC					;$B2C505
	ADC #$0313				;$B2C506
	JSL set_sprite_animation		;$B2C509
	RTS					;$B2C50D

CODE_B2C50E:
	CLC					;$B2C50E
	ADC sprite.animation_id,x		;$B2C50F
	SEC					;$B2C511
	SBC $3C,x				;$B2C512
	JSL set_sprite_animation		;$B2C514
	RTS					;$B2C518

CODE_B2C519:
	LDY #$020A				;$B2C519
	JSL CODE_BB85B8				;$B2C51C
	BCS CODE_B2C546				;$B2C520
	LDX alternate_sprite			;$B2C522
	LDY current_sprite			;$B2C524
	STY sprite.general_purpose_5C,x		;$B2C526
	LDA $0028,y				;$B2C528
	STA sprite.constants_address,x		;$B2C52B
	LDA.w sprite.visibility,y		;$B2C52D
	STA sprite.visibility,x			;$B2C530
	CMP #$C000				;$B2C532
	BEQ CODE_B2C546				;$B2C535
	LDA #$FF00				;$B2C537
	BIT screen_brightness			;$B2C53A
	BNE CODE_B2C546				;$B2C53D
	LDA #$076A				;$B2C53F
	JSL queue_sound_effect			;$B2C542
CODE_B2C546:
	RTS					;$B2C546

CODE_B2C547:
	LDA #$0001				;$B2C547
	STA level_number			;$B2C54A
	JSL CODE_B7B006				;$B2C54C
	JSL CODE_B7D7FB				;$B2C550
	RTS					;$B2C554

CODE_B2C555:
	STY temp_1A				;$B2C555
	LDA sprite.oam_property,x		;$B2C557
	AND #$CFFF				;$B2C559
	ORA temp_1A				;$B2C55C
	STA sprite.oam_property,x		;$B2C55E
	RTS					;$B2C560

CODE_B2C561:
	LDX active_kong_sprite			;$B2C561
	LDA sprite.state,x			;$B2C564
	CMP #$0007				;$B2C566
	BNE CODE_B2C56F				;$B2C569
	LDA sprite.general_purpose_62,x		;$B2C56B
	BEQ CODE_B2C5A8				;$B2C56D
CODE_B2C56F:
	PHB					;$B2C56F
	LDX #$A25E				;$B2C570
	LDY #$A258				;$B2C573
	LDA #$00F4				;$B2C576
	MVN $7E, $7E				;$B2C579
	PLB					;$B2C57C
	LDX active_kong_sprite			;$B2C57D
	LDY follower_kong_sprite		;$B2C580
	LDA sprite.state,x			;$B2C583
	CMP #$0007				;$B2C585
	BEQ CODE_B2C591				;$B2C588
	LDA #$0000				;$B2C58A
	STA $7EA34A				;$B2C58D
CODE_B2C591:
	LDA $7EA25A				;$B2C591
	BEQ CODE_B2C5AC				;$B2C595
	STA.w sprite.x_position,y		;$B2C597
	LDA $7EA258				;$B2C59A
	STA.w sprite.general_purpose_60,y	;$B2C59E
	LDA $7EA25C				;$B2C5A1
	STA.w sprite.y_position,y		;$B2C5A5
CODE_B2C5A8:
	PLA					;$B2C5A8
	JMP CODE_B2C0A2				;$B2C5A9

CODE_B2C5AC:
	LDA #$0009				;$B2C5AC
	STA.w sprite.movement_state,y		;$B2C5AF
	LDA #$0004				;$B2C5B2
	STA.w sprite.state,y			;$B2C5B5
	LDA.w sprite.general_purpose_5C,y	;$B2C5B8
	CLC					;$B2C5BB
	ADC #$0004				;$B2C5BC
	STA.w sprite.general_purpose_5C,y	;$B2C5BF
	BRA CODE_B2C5A8				;$B2C5C2

CODE_B2C5C4:
	TYX					;$B2C5C4
	JSR CODE_B2C934				;$B2C5C5
	JSR CODE_B2CA2B				;$B2C5C8
	JSR CODE_B2D1FF				;$B2C5CB
	LDX follower_kong_sprite		;$B2C5CE
	LDA sprite.state,x			;$B2C5D1
	CMP #$000C				;$B2C5D3
	BEQ CODE_B2C60D				;$B2C5D6
	PHB					;$B2C5D8
	LDX #$A25E				;$B2C5D9
	LDY #$A258				;$B2C5DC
	LDA #$00F4				;$B2C5DF
	MVN $7E, $7E				;$B2C5E2
	PLB					;$B2C5E5
	LDX active_kong_sprite			;$B2C5E6
	LDA sprite.general_purpose_60,x		;$B2C5E9
	STA $7EA348				;$B2C5EB
	LDA sprite.x_position,x			;$B2C5EF
	STA $7EA34A				;$B2C5F1
	LDA sprite.y_position,x			;$B2C5F5
	STA $7EA34C				;$B2C5F7
	LDA $1C9D				;$B2C5FB
	BEQ CODE_B2C60C				;$B2C5FE
	SEC					;$B2C600
	SBC #$0006				;$B2C601
	CMP #$0006				;$B2C604
	BCC CODE_B2C60C				;$B2C607
	STA $1C9D				;$B2C609
CODE_B2C60C:
	TXY					;$B2C60C
CODE_B2C60D:
	LDA.w sprite.general_purpose_60,y	;$B2C60D
	STA $7EA348				;$B2C610
	LDA.w sprite.x_position,y		;$B2C614
	STA $7EA34A				;$B2C617
	LDA.w sprite.y_position,y		;$B2C61B
	STA $7EA34C				;$B2C61E
	LDA.w sprite.x_position,y		;$B2C622
	STA $7EA222				;$B2C625
	LDA.w sprite.y_position,y		;$B2C629
	STA $7EA224				;$B2C62C
	JSL process_current_movement		;$B2C630
	LDX #CODE_B2D0EC			;$B2C634
	LDA current_world			;$B2C637
	BEQ CODE_B2C63F				;$B2C63A
	LDX #CODE_B2D10C			;$B2C63C
CODE_B2C63F:
	STX temp_1A				;$B2C63F
	LDA.w sprite.x_position,y		;$B2C641
	LDX sprite.y_position,y			;$B2C644
	%return(CODE_B2C64C)			;$B2C646
	JMP ($001A)				;$B2C649

CODE_B2C64C:
	BEQ CODE_B2C662				;$B2C64C
	CMP #$0009				;$B2C64E
	BEQ CODE_B2C666				;$B2C651
CODE_B2C653:
	LDX current_sprite			;$B2C653
	JSR CODE_B2D1C7				;$B2C655
	TDC					;$B2C658
	STA.w sprite.x_speed,y			;$B2C659
	STA.w sprite.y_speed,y			;$B2C65C
	JSR CODE_B2C68B				;$B2C65F
CODE_B2C662:
	PLA					;$B2C662
	JMP CODE_B2C0A2				;$B2C663

CODE_B2C666:
	LDA #$0004				;$B2C666
	BIT $053B				;$B2C669
	BEQ CODE_B2C653				;$B2C66C
	LDA.w sprite.y_position,y		;$B2C66E
	CMP #$0230				;$B2C671
	BNE CODE_B2C662				;$B2C674
	LDA #$0015				;$B2C676
	STA map_node_number			;$B2C679
	LDA #$0100				;$B2C67C
	TSB $1C35				;$B2C67F
	BNE CODE_B2C68A				;$B2C682
	LDY #$0001				;$B2C684
	STY $1C39				;$B2C687
CODE_B2C68A:
	RTS					;$B2C68A

CODE_B2C68B:
	LDY active_kong_sprite			;$B2C68B
	JSR CODE_B2C6AC				;$B2C68E
CODE_B2C691:
	JSR CODE_B2C70E				;$B2C691
	BCS CODE_B2C69F				;$B2C694
	JSR CODE_B2C733				;$B2C696
	BCS CODE_B2C69F				;$B2C699
	JSR CODE_B2C753				;$B2C69B
	RTS					;$B2C69E

CODE_B2C69F:
	TXA					;$B2C69F
	CLC					;$B2C6A0
	ADC #$000C				;$B2C6A1
	TAX					;$B2C6A4
	LDA.l DATA_B2C7BC,x			;$B2C6A5
	BNE CODE_B2C691				;$B2C6A9
	RTS					;$B2C6AB

CODE_B2C6AC:
	LDA current_world			;$B2C6AC
	ASL					;$B2C6AF
	TAX					;$B2C6B0
	LDA.l DATA_B2C7BC,x			;$B2C6B1
	TAX					;$B2C6B5
	RTS					;$B2C6B6

CODE_B2C6B7:
	LDY active_kong_sprite			;$B2C6B7
	JSR CODE_B2C6AC				;$B2C6BA
CODE_B2C6BD:
	JSR CODE_B2C70E				;$B2C6BD
	BCS CODE_B2C6CB				;$B2C6C0
	JSR CODE_B2C753				;$B2C6C2
	BCC CODE_B2C6CA				;$B2C6C5
	JSR CODE_B2C6D8				;$B2C6C7
CODE_B2C6CA:
	RTS					;$B2C6CA

CODE_B2C6CB:
	TXA					;$B2C6CB
	CLC					;$B2C6CC
	ADC #$000C				;$B2C6CD
	TAX					;$B2C6D0
	LDA.l DATA_B2C7BC,x			;$B2C6D1
	BNE CODE_B2C6BD				;$B2C6D5
	RTS					;$B2C6D7

CODE_B2C6D8:
	JSR CODE_B2CDE5				;$B2C6D8
	LDA sprite.x_position,x			;$B2C6DB
	STA $05ED				;$B2C6DD
	LDA sprite.y_position,x			;$B2C6E0
	STA $05EF				;$B2C6E2
	LDY $1C8F				;$B2C6E5
	BEQ CODE_B2C6ED				;$B2C6E8
	STA.w sprite.general_purpose_5E,y	;$B2C6EA
CODE_B2C6ED:
	RTS					;$B2C6ED

CODE_B2C6EE:
	LDA $1C35				;$B2C6EE
	BIT #$0100				;$B2C6F1
	BNE CODE_B2C70D				;$B2C6F4
	LDA.l DATA_B2C7BC			;$B2C6F6
	TAX					;$B2C6FA
	JSR CODE_B2C70E				;$B2C6FB
	BCS CODE_B2C70D				;$B2C6FE
	JSR CODE_B2C7AE				;$B2C700
	JSR CODE_B2C6D8				;$B2C703
	STZ $05ED				;$B2C706
	LDX current_sprite			;$B2C709
	STZ sprite.general_purpose_62,x		;$B2C70B
CODE_B2C70D:
	RTS					;$B2C70D

CODE_B2C70E:
	LDA.w sprite.x_position,y		;$B2C70E
	SEC					;$B2C711
	SBC.w sprite.general_purpose_52,y	;$B2C712
	CMP.l DATA_B2C7BC,x			;$B2C715
	BCC CODE_B2C731				;$B2C719
	CMP.l DATA_B2C7BC+$04,x			;$B2C71B
	BCS CODE_B2C731				;$B2C71F
	LDA.w sprite.y_position,y		;$B2C721
	CMP.l DATA_B2C7BC+$02,x			;$B2C724
	BCC CODE_B2C731				;$B2C728
	CMP.l DATA_B2C7BC+$06,x			;$B2C72A
	BCS CODE_B2C731				;$B2C72E
	RTS					;$B2C730

CODE_B2C731:
	SEC					;$B2C731
	RTS					;$B2C732

CODE_B2C733:
	LDA.w sprite.general_purpose_60,y	;$B2C733
	CLC					;$B2C736
	ADC #$0400				;$B2C737
	STA temp_1A				;$B2C73A
	LDA.l DATA_B2C7BC+$08,x			;$B2C73C
	CLC					;$B2C740
	ADC #$0380				;$B2C741
	CMP temp_1A				;$B2C744
	BCS CODE_B2C751				;$B2C746
	ADC #$0101				;$B2C748
	CMP temp_1A				;$B2C74B
	BCC CODE_B2C751				;$B2C74D
	CLC					;$B2C74F
	RTS					;$B2C750

CODE_B2C751:
	SEC					;$B2C751
	RTS					;$B2C752

CODE_B2C753:
	LDA.l DATA_B2C7BC+$0A,x			;$B2C753
	BMI CODE_B2C7AE				;$B2C757
	PHA					;$B2C759
	JSL CODE_B48015				;$B2C75A
	BCC CODE_B2C7AB				;$B2C75E
	LDY active_kong_sprite			;$B2C760
	LDX sprite.state,y			;$B2C763
	STX $1C71				;$B2C765
	LDA #$0004				;$B2C768
	STA.w sprite.state,y			;$B2C76B
	CPX #$0009				;$B2C76E
	BEQ CODE_B2C786				;$B2C771
	LDA.w sprite.x_position,y		;$B2C773
	STA $1C41				;$B2C776
	LDA.w sprite.y_position,y		;$B2C779
	STA $1C57				;$B2C77C
	LDA #$0500				;$B2C77F
	JSL queue_sound_effect			;$B2C782
CODE_B2C786:
	STZ map_node_number			;$B2C786
	LDA #$4000				;$B2C789
	TRB $0611				;$B2C78C
	PLA					;$B2C78F
	JSL CODE_B48012				;$B2C790
	LDA $1C71				;$B2C794
	CMP #$0009				;$B2C797
	BEQ CODE_B2C7A9				;$B2C79A
	LDX follower_kong_sprite		;$B2C79C
	LDA #$0001				;$B2C79F
	STA sprite.movement_state,x		;$B2C7A2
	LDA #$000C				;$B2C7A4
	STA sprite.state,x			;$B2C7A7
CODE_B2C7A9:
	SEC					;$B2C7A9
	RTS					;$B2C7AA

CODE_B2C7AB:
	CLC					;$B2C7AB
	PLA					;$B2C7AC
	RTS					;$B2C7AD

CODE_B2C7AE:
	LDA #$0100				;$B2C7AE
	TSB $1C35				;$B2C7B1
	LDA #$820F				;$B2C7B4
	STA screen_brightness			;$B2C7B7
	SEC					;$B2C7BA
	RTS					;$B2C7BB

DATA_B2C7BC:
	dw $0012,$00A4,$0000,$00D6,$0000,$0000,$0114,$013A
	dw $0000,$01FF,$0266,$0225,$0278,$0380,$8000,$01B9
	dw $0297,$01C2,$029B,$0000,$004E,$027F,$02D2,$0289
	dw $02E0,$0100,$000F,$01F6,$0210,$0200,$021C,$0100
	dw $0012,$01C7,$019F,$01D4,$0202,$0000,$0010,$01F0
	dw $01DF,$01FB,$01E2,$0000,$0011,$0242,$017F,$0250
	dw $0181,$0000,$0013,$0284,$0147,$0298,$014A,$0000
	dw $001C,$0169,$0230,$017D,$0232,$0000,$0016,$0134
	dw $01E0,$0147,$01E2,$0000,$0017,$026F,$0268,$0278
	dw $0270,$0000,$0018,$02A5,$021F,$02B0,$0222,$0000
	dw $001D,$0000,$0027,$008E,$0035,$0091,$0200,$004C
	dw $0026,$003B,$0034,$0042,$0000,$000D,$0069,$0066
	dw $0075,$0071,$0100,$000E,$007D,$001F,$0087,$0022
	dw $0000,$000F,$0000,$0050,$00B6,$0058,$00B8,$0200
	dw $004B,$000E,$0080,$0019,$0081,$0000,$000C,$0070
	dw $0078,$007A,$0079,$0000,$004D,$00BF,$0077,$00C8
	dw $0079,$0000,$000E,$004C,$0077,$0058,$0079,$0000
	dw $000F,$0000,$00D0,$007F,$00DB,$0081,$0000,$004C
	dw $00C2,$0096,$00CF,$0098,$0200,$000D,$007F,$0085
	dw $0081,$0088,$0300,$004E,$0000,$0047,$00D0,$0049
	dw $00D9,$0300,$000B,$0057,$0078,$0059,$007D,$0300
	dw $004C,$00A6,$0095,$00A8,$009A,$0100,$000D,$009A
	dw $0087,$00A3,$0089,$0000,$000E,$0070,$00AE,$0090
	dw $00B0,$0200,$0010,$0000

CODE_B2C934:
	LDA #$0100				;$B2C934
	BIT $1C35				;$B2C937
	BNE CODE_B2C944				;$B2C93A
	LDA player_active_held			;$B2C93C
	AND #$0F00				;$B2C93F
	BNE CODE_B2C948				;$B2C942
CODE_B2C944:
	JSR CODE_B2D50E				;$B2C944
	RTS					;$B2C947

CODE_B2C948:
	BIT #$0800				;$B2C948
	BEQ CODE_B2C950				;$B2C94B
	AND #$FBFF				;$B2C94D
CODE_B2C950:
	BIT #$0100				;$B2C950
	BEQ CODE_B2C958				;$B2C953
	AND #$FDFF				;$B2C955
CODE_B2C958:
	XBA					;$B2C958
	ASL					;$B2C959
	TAY					;$B2C95A
	LDA DATA_B2D4C5-$02,y			;$B2C95B
	STA temp_24				;$B2C95E
	CLC					;$B2C960
	ADC #$0200				;$B2C961
	AND #$03FF				;$B2C964
	STA temp_26				;$B2C967
	JSR CODE_B2D4D9				;$B2C969
	CMP #$0040				;$B2C96C
	BMI CODE_B2C97E				;$B2C96F
	LDA sprite.general_purpose_60,x		;$B2C971
	SEC					;$B2C973
	SBC temp_26				;$B2C974
	JSR CODE_B2D51D				;$B2C976
	CMP #$00D0				;$B2C979
	BMI CODE_B2C982				;$B2C97C
CODE_B2C97E:
	LDA temp_24				;$B2C97E
	STA sprite.general_purpose_60,x		;$B2C980
CODE_B2C982:
	RTS					;$B2C982

CODE_B2C983:
	LDA current_map_vehicle			;$B2C983
	CMP #!vehicle_gyrocopter		;$B2C986
	BEQ CODE_B2C99D				;$B2C989
	JSR CODE_B2C99E				;$B2C98B
	LDA player_active_pressed		;$B2C98E
	BIT #$0040				;$B2C991
	BEQ CODE_B2C99D				;$B2C994
	LDA #$0767				;$B2C996
	JSL queue_sound_effect			;$B2C999
CODE_B2C99D:
	RTS					;$B2C99D

CODE_B2C99E:
	LDA player_active_held			;$B2C99E
	AND #$0040				;$B2C9A1
	BEQ CODE_B2C9C0				;$B2C9A4
	LDX $1C45				;$B2C9A6
	LDA player_active_pressed		;$B2C9A9
	BEQ CODE_B2C9C0				;$B2C9AC
	EOR.l DATA_B2C9D2,x			;$B2C9AE
	BNE CODE_B2C9C1				;$B2C9B2
	INC $1C45				;$B2C9B4
	INC $1C45				;$B2C9B7
	LDA.l DATA_B2C9D2+$02,x			;$B2C9BA
	BEQ CODE_B2C9C5				;$B2C9BE
CODE_B2C9C0:
	RTS					;$B2C9C0

CODE_B2C9C1:
	STZ $1C45				;$B2C9C1
	RTS					;$B2C9C4

CODE_B2C9C5:
	LDA current_map_vehicle			;$B2C9C5
	ASL					;$B2C9C8
	TAX					;$B2C9C9
	LDA DATA_B2C9D2+$04,x			;$B2C9CA
	JSL queue_sound_effect			;$B2C9CD
	RTS					;$B2C9D1

DATA_B2C9D2:
	dw $0030
	dw $0000
	dw $0668
	dw $076F
	dw $076E
	dw $0770

CODE_B2C9DE:
	LDA sprite.x_speed,x			;$B2C9DE
	BEQ CODE_B2C9FA				;$B2C9E0
	BPL CODE_B2C9EF				;$B2C9E2
	CLC					;$B2C9E4
	ADC #$0010				;$B2C9E5
	BMI CODE_B2C9F8				;$B2C9E8
	LDA #$0000				;$B2C9EA
	BRA CODE_B2C9F8				;$B2C9ED

CODE_B2C9EF:
	SEC					;$B2C9EF
	SBC #$0010				;$B2C9F0
	BPL CODE_B2C9F8				;$B2C9F3
	LDA #$0000				;$B2C9F5
CODE_B2C9F8:
	STA sprite.x_speed,x			;$B2C9F8
CODE_B2C9FA:
	RTS					;$B2C9FA

CODE_B2C9FB:
	LDA sprite.y_speed,x			;$B2C9FB
	BEQ CODE_B2CA17				;$B2C9FD
	BPL CODE_B2CA0C				;$B2C9FF
	CLC					;$B2CA01
	ADC #$0010				;$B2CA02
	BMI CODE_B2CA15				;$B2CA05
	LDA #$0000				;$B2CA07
	BRA CODE_B2CA15				;$B2CA0A

CODE_B2CA0C:
	SEC					;$B2CA0C
	SBC #$0010				;$B2CA0D
	BPL CODE_B2CA15				;$B2CA10
	LDA #$0000				;$B2CA12
CODE_B2CA15:
	STA sprite.y_speed,x			;$B2CA15
CODE_B2CA17:
	RTS					;$B2CA17

CODE_B2CA18:
	TYX					;$B2CA18
	LDY active_kong_sprite			;$B2CA19
	DEC $1C,x				;$B2CA1C
	BNE CODE_B2CA2A				;$B2CA1E
	LDA #$0009				;$B2CA20
	STA sprite.movement_state,x		;$B2CA23
	LDA #$0004				;$B2CA25
	STA sprite.state,x			;$B2CA28
CODE_B2CA2A:
	RTS					;$B2CA2A

CODE_B2CA2B:
	LDX active_kong_sprite			;$B2CA2B
	LDY follower_kong_sprite		;$B2CA2E
	LDA sprite.y_position,x			;$B2CA31
	CMP.w sprite.y_position,y		;$B2CA33
	BPL CODE_B2CA4B				;$B2CA36
	LDA #$00E4				;$B2CA38
	CLC					;$B2CA3B
	ADC.w sprite.general_purpose_4C,y	;$B2CA3C
	STA.w sprite.render_order,y		;$B2CA3F
	LDA #$00D8				;$B2CA42
	CLC					;$B2CA45
	ADC sprite.general_purpose_4C,x		;$B2CA46
	STA sprite.render_order,x		;$B2CA48
	RTS					;$B2CA4A

CODE_B2CA4B:
	LDA #$00E4				;$B2CA4B
	CLC					;$B2CA4E
	ADC sprite.general_purpose_4C,x		;$B2CA4F
	STA sprite.render_order,x		;$B2CA51
	LDA #$00D8				;$B2CA53
	CLC					;$B2CA56
	ADC.w sprite.general_purpose_4C,y	;$B2CA57
	STA.w sprite.render_order,y		;$B2CA5A
	RTS					;$B2CA5D

CODE_B2CA5E:
	LDY current_sprite			;$B2CA5E
	LDA.w sprite.general_purpose_50,y	;$B2CA60
	ASL					;$B2CA63
	TAX					;$B2CA64
	LDA current_map_vehicle			;$B2CA65
	BIT #$0001				;$B2CA68
	BEQ CODE_B2CA7A				;$B2CA6B
	CPX #$0003				;$B2CA6D
	BCS CODE_B2CA7A				;$B2CA70
	CPX #$0000				;$B2CA72
	BNE CODE_B2CAA6				;$B2CA75
CODE_B2CA77:
	LDX #$0012				;$B2CA77
CODE_B2CA7A:
	LDA DATA_B2CAB0,x			;$B2CA7A
	AND #$00FF				;$B2CA7D
	STA.w sprite.render_order,y		;$B2CA80
	LDA DATA_B2CAB0+$01,x			;$B2CA83
	LDX active_kong_sprite			;$B2CA86
	AND #$00FF				;$B2CA89
	STA sprite.render_order,x		;$B2CA8C
	CMP #$00E4				;$B2CA8E
	BEQ CODE_B2CA9D				;$B2CA91
	LDA #$00E4				;$B2CA93
	LDX follower_kong_sprite		;$B2CA96
	STA sprite.render_order,x		;$B2CA99
	BRA CODE_B2CAA5				;$B2CA9B

CODE_B2CA9D:
	LDA #$00D8				;$B2CA9D
	LDX follower_kong_sprite		;$B2CAA0
	STA sprite.render_order,x		;$B2CAA3
CODE_B2CAA5:
	RTS					;$B2CAA5

CODE_B2CAA6:
	LDA current_map_vehicle			;$B2CAA6
	CMP #!vehicle_hovercraft		;$B2CAA9
	BNE CODE_B2CA7A				;$B2CAAC
	BRA CODE_B2CA77				;$B2CAAE

;Render order values
DATA_B2CAB0:
	db $D0,$D8,$D0,$D8,$D0,$D8,$D0,$D8
	db $D0,$D8,$D0,$E4,$D0,$E4,$D0,$E4
	db $D0,$E4,$E6,$D8


map_swimming_kong_splash_main:
	LDX active_kong_sprite			;$B2CAC4  \
	LDA sprite.state,x			;$B2CAC7   |
	AND #$7FFF				;$B2CAC9   |
	CMP #$0007				;$B2CACC   |
	BEQ .CODE_B2CADC			;$B2CACF   |
	CMP #$0000				;$B2CAD1   |
	BEQ .CODE_B2CADC			;$B2CAD4   |
	JSL delete_sprite_handle_deallocation	;$B2CAD6   |
	BRA .return				;$B2CADA  /

.CODE_B2CADC:
	LDX sprite.general_purpose_5C,y		;$B2CADC  \
	LDA sprite.render_order,x		;$B2CADE   |
	DEC					;$B2CAE0   |
	STA.w sprite.render_order,y		;$B2CAE1   |
	LDA sprite.oam_property,x		;$B2CAE4   |
	EOR.w sprite.oam_property,y		;$B2CAE6   |
	AND #$4000				;$B2CAE9   |
	EOR.w sprite.oam_property,y		;$B2CAEC   |
	STA.w sprite.oam_property,y		;$B2CAEF   |
	LDA sprite.animation_id,x		;$B2CAF2   |
	SEC					;$B2CAF4   |
	SBC #$0313				;$B2CAF5   |
	ASL					;$B2CAF8   |
	TAY					;$B2CAF9   |
	LDA sprite.oam_property,x		;$B2CAFA   |
	BIT #$4000				;$B2CAFC   |
	BNE .CODE_B2CB0A			;$B2CAFF   |
	LDA [current_sprite_constants],y	;$B2CB01   |
	CLC					;$B2CB03   |
	ADC sprite.x_position,x			;$B2CB04   |
	STA temp_1A				;$B2CB06   |
	BRA .CODE_B2CB17			;$B2CB08  /

.CODE_B2CB0A:
	LDA [current_sprite_constants],y	;$B2CB0A  \
	EOR #$FFFF				;$B2CB0C   |
	INC					;$B2CB0F   |
	INC					;$B2CB10   |
	INC					;$B2CB11   |
	CLC					;$B2CB12   |
	ADC sprite.x_position,x			;$B2CB13   |
	STA temp_1A				;$B2CB15  /
.CODE_B2CB17:
	TYA					;$B2CB17  \
	CLC					;$B2CB18   |
	ADC #$000A				;$B2CB19   |
	TAY					;$B2CB1C   |
	LDA [current_sprite_constants],y	;$B2CB1D   |
	CLC					;$B2CB1F   |
	ADC sprite.y_position,x			;$B2CB20   |
	STA temp_1C				;$B2CB22   |
	LDY current_sprite			;$B2CB24   |
	LDA temp_1A				;$B2CB26   |
	STA.w sprite.x_position,y		;$B2CB28   |
	LDA temp_1C				;$B2CB2B   |
	STA.w sprite.y_position,y		;$B2CB2D   |
	JSL process_anim_preserve_state		;$B2CB30  /
.return:
	JML [$04F5]				;$B2CB34  |>


boat_water_trail_main:
	JMP (.state_table,x)			;$B2CB37  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2CB3E  \
	STX $1C8F				;$B2CB3F   |
	INC sprite.state,x			;$B2CB42   |
	LDA sprite.sprite_graphic,x		;$B2CB44   |
	STA sprite.general_purpose_60,x		;$B2CB46   |
	STZ sprite.sprite_graphic,x		;$B2CB48   |
	LDX #$0000				;$B2CB4A   |
	TXA					;$B2CB4D  /
..loop:
	STA $7EA228,x				;$B2CB4E  \
	INX					;$B2CB52   |
	INX					;$B2CB53   |
	CPX #$0030				;$B2CB54   |
	BCC ..loop				;$B2CB57  /
.idle:
	LDA #$0010				;$B2CB59  \
	BIT $05FB				;$B2CB5C   |
	BNE CODE_B2CB66				;$B2CB5F   |
	LDA.w sprite.general_purpose_5E,y	;$B2CB61   |
	BEQ CODE_B2CB6F				;$B2CB64  /
CODE_B2CB66:
	STZ $1C8F				;$B2CB66  \
	JSR CODE_B2E53B				;$B2CB69   |
	JML [$04F5]				;$B2CB6C  /

CODE_B2CB6F:
	JSR CODE_B2CB8D				;$B2CB6F  \
	JSR CODE_B2CC0A				;$B2CB72   |
	JML [$04F5]				;$B2CB75  /

CODE_B2CB78:
	LDX #$0010				;$B2CB78  |>
CODE_B2CB7B:
	DEX					;$B2CB7B  \
	DEX					;$B2CB7C   |
	LDA $7EA248,x				;$B2CB7D   |
	AND #$00FF				;$B2CB81   |
	BNE CODE_B2CB7B				;$B2CB84   |
	TXA					;$B2CB86   |
	STA temp_20				;$B2CB87   |
	ASL					;$B2CB89   |
	STA temp_1E				;$B2CB8A   |
	RTS					;$B2CB8C  /

CODE_B2CB8D:
	LDA active_frame_counter		;$B2CB8D  \
	BIT #$0003				;$B2CB8F   |
	BNE CODE_B2CBD4				;$B2CB92   |
	LDX sprite.general_purpose_5C,y		;$B2CB94   |
	LDA sprite.general_purpose_62,x		;$B2CB96   |
	BEQ CODE_B2CBD4				;$B2CB98   |
	LDA sprite.unknown_58,x			;$B2CB9A   |
	CMP #$FF00				;$B2CB9C   |
	BMI CODE_B2CBD4				;$B2CB9F   |
	JSR CODE_B2CB78				;$B2CBA1   |
	BMI CODE_B2CBD4				;$B2CBA4   |
	LDX sprite.general_purpose_5C,y		;$B2CBA6   |
	LDA sprite.general_purpose_4E,x		;$B2CBA8   |
	JSR CODE_B2CBD5				;$B2CBAA   |
	LDA sprite.general_purpose_62,x		;$B2CBAD   |
	CMP #$0101				;$B2CBAF   |
	BCS CODE_B2CBBD				;$B2CBB2   |
	LDA temp_1A				;$B2CBB4   |
	LDX temp_1C				;$B2CBB6   |
	JSR CODE_B2D0EC				;$B2CBB8   |
	BNE CODE_B2CBD4				;$B2CBBB  /
CODE_B2CBBD:
	LDX temp_1E				;$B2CBBD  \
	LDA temp_1A				;$B2CBBF   |
	STA $7EA228,x				;$B2CBC1   |
	LDA temp_1C				;$B2CBC5   |
	STA $7EA22A,x				;$B2CBC7   |
	LDX temp_20				;$B2CBCB   |
	LDA #$0514				;$B2CBCD   |
	STA $7EA248,x				;$B2CBD0  /
CODE_B2CBD4:
	RTS					;$B2CBD4  |>

CODE_B2CBD5:
	AND #$03FF				;$B2CBD5  \
	LSR					;$B2CBD8   |
	LSR					;$B2CBD9   |
	LSR					;$B2CBDA   |
	LSR					;$B2CBDB   |
	LSR					;$B2CBDC   |
	AND.w #$FFFE				;$B2CBDD   |
	TAY					;$B2CBE0   |
	LDA DATA_B2CC42,y			;$B2CBE1   |
	AND #$00FF				;$B2CBE4   |
	BIT #$0080				;$B2CBE7   |
	BEQ CODE_B2CBEF				;$B2CBEA   |
	ORA #$FF00				;$B2CBEC  /
CODE_B2CBEF:
	CLC					;$B2CBEF  \
	ADC sprite.x_position,x			;$B2CBF0   |
	STA temp_1A				;$B2CBF2   |
	LDA DATA_B2CC42+$01,y			;$B2CBF4   |
	AND #$00FF				;$B2CBF7   |
	BIT #$0080				;$B2CBFA   |
	BEQ CODE_B2CC02				;$B2CBFD   |
	ORA #$FF00				;$B2CBFF  /
CODE_B2CC02:
	CLC					;$B2CC02  \
	ADC sprite.y_position,x			;$B2CC03   |
	STA temp_1C				;$B2CC05   |
	LDY current_sprite			;$B2CC07   |
	RTS					;$B2CC09  /

CODE_B2CC0A:
	LDX #$000E				;$B2CC0A  |>
CODE_B2CC0D:
	LDA $7EA248,x				;$B2CC0D  \
	BIT #$00FF				;$B2CC11   |
	BEQ CODE_B2CC3D				;$B2CC14   |
	XBA					;$B2CC16   |
	AND #$00FF				;$B2CC17   |
	BEQ CODE_B2CC3D				;$B2CC1A   |
	DEC					;$B2CC1C   |
	BEQ CODE_B2CC29				;$B2CC1D   |
	SEP #$20				;$B2CC1F   |
	STA $7EA249,x				;$B2CC21   |
	REP #$20				;$B2CC25   |
	BRA CODE_B2CC3D				;$B2CC27  /

CODE_B2CC29:
	LDA $7EA248,x				;$B2CC29  \
	AND #$00FF				;$B2CC2D   |
	SEC					;$B2CC30   |
	SBC #$0005				;$B2CC31   |
	BMI CODE_B2CC3D				;$B2CC34   |
	ORA #$0500				;$B2CC36   |
	STA $7EA248,x				;$B2CC39  /
CODE_B2CC3D:
	DEX					;$B2CC3D  \
	DEX					;$B2CC3E   |
	BPL CODE_B2CC0D				;$B2CC3F   |
	RTS					;$B2CC41  /

DATA_B2CC42:
	db $00,$10,$F8,$10,$F1,$0D,$EE,$0A
	db $ED,$08,$EF,$00,$F2,$FA,$F7,$F8
	db $00,$F8,$09,$F8,$0E,$FA,$11,$00
	db $13,$08,$12,$0A,$0F,$0D,$08,$10


map_vehicle_main:
	JMP (.state_table,x)			;$B2CC62  |>

.state_table:
	dw CODE_B2CC69
	dw CODE_B2CCDE

CODE_B2CC69:
	LDA.w sprite.sprite_graphic,y		;$B2CC69  \
	STA.w sprite.general_purpose_5E,y	;$B2CC6C   |
	LDX active_kong_sprite			;$B2CC6F   |
	STY sprite.general_purpose_6C,x		;$B2CC72   |
	LDX follower_kong_sprite		;$B2CC74   |
	STY sprite.general_purpose_6C,x		;$B2CC77   |
	TYX					;$B2CC79   |
	INC sprite.state,x			;$B2CC7A   |
	LDA [current_sprite_constants]		;$B2CC7C   |
	INC					;$B2CC7E   |
	STA sprite.general_purpose_64,x		;$B2CC7F   |
	INC current_sprite_constants		;$B2CC81   |
	INC current_sprite_constants		;$B2CC83   |
	LDA [current_sprite_constants]		;$B2CC85   |
	STA sprite.general_purpose_68,x		;$B2CC87   |
	INC current_sprite_constants		;$B2CC89   |
	INC current_sprite_constants		;$B2CC8B   |
	LDA [current_sprite_constants]		;$B2CC8D   |
	STA sprite.general_purpose_66,x		;$B2CC8F   |
	INC current_sprite_constants		;$B2CC91   |
	INC current_sprite_constants		;$B2CC93   |
	LDA [current_sprite_constants]		;$B2CC95   |
	STA sprite.general_purpose_6A,x		;$B2CC97   |
	LDA #$0006				;$B2CC99   |
	JSR CODE_B2CE6B				;$B2CC9C   |
	LDA current_map_vehicle			;$B2CC9F   |
	CMP #!vehicle_gyrocopter		;$B2CCA2   |
	BNE CODE_B2CCCC				;$B2CCA5   |
	LDX active_kong_sprite			;$B2CCA7   |
	LDA sprite.state,x			;$B2CCAA   |
	AND #$7FFF				;$B2CCAC   |
	CMP #$0009				;$B2CCAF   |
	BNE CODE_B2CCCC				;$B2CCB2   |
	LDA.w sprite.oam_property,y		;$B2CCB4   |
	ORA #$3000				;$B2CCB7   |
	STA.w sprite.oam_property,y		;$B2CCBA   |
	LDY #$0268				;$B2CCBD   |
	JSL CODE_BB8585				;$B2CCC0   |
	LDX alternate_sprite			;$B2CCC4   |
	LDA current_sprite			;$B2CCC6   |
	STA sprite.general_purpose_5C,x		;$B2CCC8   |
	BRA CODE_B2CCDE				;$B2CCCA  /

CODE_B2CCCC:
	JSL process_current_movement		;$B2CCCC  \
	LDA current_map_vehicle			;$B2CCD0   |
	CMP #!vehicle_gyrocopter		;$B2CCD3   |
	BEQ CODE_B2CCDB				;$B2CCD6   |
	JSR CODE_B2D284				;$B2CCD8  /
CODE_B2CCDB:
	JML [$04F5]				;$B2CCDB  |>

CODE_B2CCDE:
	LDA #$0010				;$B2CCDE  \
	BIT $05FB				;$B2CCE1   |
	BEQ CODE_B2CCE9				;$B2CCE4   |
	JML [$04F5]				;$B2CCE6  /

CODE_B2CCE9:
	JSR CODE_B2D09A				;$B2CCE9  \
	LDX active_kong_sprite			;$B2CCEC   |
	LDA sprite.state,x			;$B2CCEF   |
	AND #$7FFF				;$B2CCF1   |
	CMP #$0009				;$B2CCF4   |
	BNE CODE_B2CCCC				;$B2CCF7   |
	LDX follower_kong_sprite		;$B2CCF9   |
	LDA sprite.state,x			;$B2CCFC   |
	BNE CODE_B2CCCC				;$B2CCFE   |
	JSR CODE_B2D219				;$B2CD00   |
	JSR CODE_B2CA5E				;$B2CD03   |
	JSR CODE_B2D379				;$B2CD06   |
	JSR CODE_B2D439				;$B2CD09   |
	JSR CODE_B2D425				;$B2CD0C   |
	LDA current_map_vehicle			;$B2CD0F   |
	CMP #!vehicle_gyrocopter		;$B2CD12   |
	BEQ CODE_B2CD1A				;$B2CD15   |
	JSR CODE_B2D365				;$B2CD17  /
CODE_B2CD1A:
	JSR CODE_B2D247				;$B2CD1A  \
	JSR CODE_B2CE98				;$B2CD1D   |
	JSR CODE_B2D1FF				;$B2CD20   |
	LDA.w sprite.x_position,y		;$B2CD23   |
	STA $7EA222				;$B2CD26   |
	LDA.w sprite.y_position,y		;$B2CD2A   |
	STA $7EA224				;$B2CD2D   |
	JSL process_current_movement		;$B2CD31   |
	LDA current_map_vehicle			;$B2CD35   |
	CMP #!vehicle_gyrocopter		;$B2CD38   |
	BEQ CODE_B2CD81				;$B2CD3B   |
	LDY current_sprite			;$B2CD3D   |
	LDA.w sprite.x_position,y		;$B2CD3F   |
	LDX sprite.y_position,y			;$B2CD42   |
	JSR CODE_B2D0EC				;$B2CD44   |
	BEQ CODE_B2CDB4				;$B2CD47   |
	TYX					;$B2CD49   |
	BIT #$0020				;$B2CD4A   |
	BEQ CODE_B2CD52				;$B2CD4D   |
	JSR CODE_B2D2FF				;$B2CD4F  /
CODE_B2CD52:
	CMP #$0079				;$B2CD52  \
	BNE CODE_B2CD77				;$B2CD55   |
	LDY current_map_vehicle			;$B2CD57   |
	CPY #!vehicle_turbo_ski			;$B2CD5A   |
	BNE CODE_B2CD77				;$B2CD5D   |
	LDY sprite.general_purpose_60,x		;$B2CD5F   |
	CPY #$0180				;$B2CD61   |
	BCC CODE_B2CD73				;$B2CD64   |
	CPY #$0280				;$B2CD66   |
	BCS CODE_B2CD73				;$B2CD69   |
	LDY #$0200				;$B2CD6B   |
	STY sprite.general_purpose_60,x		;$B2CD6E   |
	JSR CODE_B2D30A				;$B2CD70  /
CODE_B2CD73:
	LDY sprite.general_purpose_6C,x		;$B2CD73  \
	BNE CODE_B2CDB4				;$B2CD75  /
CODE_B2CD77:
	CMP #$0005				;$B2CD77  \
	BNE CODE_B2CDAD				;$B2CD7A   |
	JSR CODE_B2C6EE				;$B2CD7C   |
	BRA CODE_B2CDB4				;$B2CD7F  /

CODE_B2CD81:
	LDY current_sprite			;$B2CD81  \
	LDA.w sprite.x_position,y		;$B2CD83   |
	CMP #$0108				;$B2CD86   |
	BCC CODE_B2CD90				;$B2CD89   |
	CMP #$0300				;$B2CD8B   |
	BCC CODE_B2CD97				;$B2CD8E /
CODE_B2CD90:
	LDA $7EA222				;$B2CD90  \
	STA.w sprite.x_position,y		;$B2CD94  /
CODE_B2CD97:
	LDA.w sprite.y_position,y		;$B2CD97  \
	CMP #$0120				;$B2CD9A   |
	BCC CODE_B2CDA4				;$B2CD9D   |
	CMP #$02F0				;$B2CD9F   |
	BCC CODE_B2CDD3				;$B2CDA2  /
CODE_B2CDA4:
	LDA $7EA224				;$B2CDA4  \
	STA.w sprite.y_position,y		;$B2CDA8   |
	BRA CODE_B2CDB7				;$B2CDAB  /

CODE_B2CDAD:
	BIT sprite.terrain_attributes,x		;$B2CDAD  \
	BEQ CODE_B2CDB4				;$B2CDAF   |
	JSR CODE_B2D127				;$B2CDB1  /
CODE_B2CDB4:
	JSR CODE_B2D326				;$B2CDB4  |>
CODE_B2CDB7:
	JSR CODE_B2D284				;$B2CDB7  \
	LDX current_sprite			;$B2CDBA   |
	LDY active_kong_sprite			;$B2CDBC   |
	JSR CODE_B2D1D4				;$B2CDBF   |
	LDY follower_kong_sprite		;$B2CDC2   |
	LDA.w sprite.movement_state,y		;$B2CDC5   |
	BNE CODE_B2CDCD				;$B2CDC8   |
	JSR CODE_B2D1D4				;$B2CDCA  /
CODE_B2CDCD:
	JSR CODE_B2CE2E				;$B2CDCD  \
	JML [$04F5]				;$B2CDD0  /

CODE_B2CDD3:
	CMP #$0130				;$B2CDD3  \
	BCS CODE_B2CDB7				;$B2CDD6   |
	LDA.w sprite.x_position,y		;$B2CDD8   |
	CMP #$0120				;$B2CDDB   |
	BCS CODE_B2CDB7				;$B2CDDE   |
	JSR CODE_B2CDFC				;$B2CDE0   |
	BRA CODE_B2CDB7				;$B2CDE3  /

CODE_B2CDE5:
	LDA #$0004				;$B2CDE5  \
	STA $1C7F				;$B2CDE8   |
	LDX current_sprite			;$B2CDEB   |
	STZ sprite.general_purpose_62,x		;$B2CDED   |
	LDA #$0500				;$B2CDEF   |
	STA sprite.general_purpose_5C,x		;$B2CDF2   |
	LDA $18,x				;$B2CDF4   |
	AND #$7FFF				;$B2CDF6   |
	STA $18,x				;$B2CDF9   |
	RTS					;$B2CDFB  /

CODE_B2CDFC:
	REP #$20				;$B2CDFC  \
	LDA #$0100				;$B2CDFE   |
	TSB $1C35				;$B2CE01   |
	BNE CODE_B2CE2D				;$B2CE04   |
	LDA #$820F				;$B2CE06   |
	STA screen_brightness			;$B2CE09   |
	LDA #$0040				;$B2CE0C   |
	TSB $05FB				;$B2CE0F   |
	LDA #$0400				;$B2CE12   |
	TSB $05FD				;$B2CE15   |
	JSR CODE_B2CDE5				;$B2CE18   |
	LDA #$0148				;$B2CE1B   |
	STA $05ED				;$B2CE1E   |
	LDA #$0148				;$B2CE21   |
	STA $05EF				;$B2CE24   |
	LDA #$0016				;$B2CE27   |
	STA map_node_number			;$B2CE2A  /
CODE_B2CE2D:
	RTS					;$B2CE2D  |>

CODE_B2CE2E:
	PHK					;$B2CE2E  \
	PLB					;$B2CE2F   |
	LDY active_kong_sprite			;$B2CE30   |
	LDA.w sprite.state,y			;$B2CE33   |
	CMP #$0009				;$B2CE36   |
	BNE CODE_B2CE6A				;$B2CE39   |
	LDA player_active_held			;$B2CE3B   |
	BEQ CODE_B2CE6A				;$B2CE3E   |
	LDX current_sprite			;$B2CE40   |
	LDA sprite.general_purpose_4E,x		;$B2CE42   |
	CMP #$0200				;$B2CE44   |
	BPL CODE_B2CE52				;$B2CE47   |
	LDA sprite.oam_property,x		;$B2CE49   |
	AND #$BFFF				;$B2CE4B   |
	STA sprite.oam_property,x		;$B2CE4E   |
	BRA CODE_B2CE59				;$B2CE50  /

CODE_B2CE52:
	LDA sprite.oam_property,x		;$B2CE52  \
	ORA #$4000				;$B2CE54   |
	STA sprite.oam_property,x		;$B2CE57  /
CODE_B2CE59:
	LDA sprite.general_purpose_4E,x		;$B2CE59  \
	LSR					;$B2CE5B   |
	LSR					;$B2CE5C   |
	LSR					;$B2CE5D   |
	LSR					;$B2CE5E   |
	LSR					;$B2CE5F   |
	AND #$FFFE				;$B2CE60   |
	TAY					;$B2CE63   |
	LDA DATA_B2CE78,y			;$B2CE64   |
	JSR CODE_B2CE6B				;$B2CE67  /
CODE_B2CE6A:
	RTS					;$B2CE6A  |>

CODE_B2CE6B:
	STA sprite.general_purpose_50,x		;$B2CE6B  \
	ASL					;$B2CE6D   |
	ASL					;$B2CE6E   |
	CLC					;$B2CE6F   |
	ADC sprite.general_purpose_50,x		;$B2CE70   |
	CLC					;$B2CE72   |
	ADC sprite.general_purpose_5E,x		;$B2CE73   |
	STA sprite.sprite_graphic,x		;$B2CE75   |
	RTS					;$B2CE77  /

DATA_B2CE78:
	dw $0000,$0001,$0002,$0003
	dw $0004,$0005,$0006,$0007
	dw $0008,$0007,$0006,$0005
	dw $0004,$0003,$0002,$0001

CODE_B2CE98:
	LDA current_map_vehicle			;$B2CE98  \
	CMP #!vehicle_gyrocopter		;$B2CE9B   |
	BNE CODE_B2CF1D				;$B2CE9E   |
	LDX current_sprite			;$B2CEA0   |
	LDA active_frame_counter		;$B2CEA2   |
	BIT #$0001				;$B2CEA4   |
	BNE CODE_B2CEB6				;$B2CEA7   |
	SEP #$20				;$B2CEA9   |
	LDA sprite.animation_id+1,x		;$B2CEAB   |
	DEC					;$B2CEAD   |
	CMP #$C0				;$B2CEAE   |
	BMI CODE_B2CEB4				;$B2CEB0   |
	STA sprite.animation_id+1,x		;$B2CEB2  /
CODE_B2CEB4:
	REP #$20				;$B2CEB4  |>
CODE_B2CEB6:
	LDA #$0040				;$B2CEB6  \
	BIT $05FB				;$B2CEB9   |
	BEQ CODE_B2CEE2				;$B2CEBC   |
	SEP #$20				;$B2CEBE   |
	LDA #$00				;$B2CEC0   |
	STA sprite.general_purpose_62,x		;$B2CEC2   |
	LDA sprite.animation_id+1,x		;$B2CEC4   |
	INC					;$B2CEC6   |
	CMP #$00				;$B2CEC7   |
	BMI CODE_B2CEDD				;$B2CEC9   |
	REP #$20				;$B2CECB   |
	LDA #$0100				;$B2CECD   |
	TSB $1C35				;$B2CED0   |
	BNE CODE_B2CF1D				;$B2CED3   |
	LDA #$820F				;$B2CED5   |
	STA screen_brightness			;$B2CED8   |
	BRA CODE_B2CF1D				;$B2CEDB  /

CODE_B2CEDD:
	STA sprite.animation_id+1,x		;$B2CEDD  \
	REP #$20				;$B2CEDF   |
	RTS					;$B2CEE1  /

CODE_B2CEE2:
	LDY current_sprite			;$B2CEE2  \
	JSR CODE_B2CF60				;$B2CEE4   |
	BCC CODE_B2CF3A				;$B2CEE7   |
	LDA player_active_pressed		;$B2CEE9   |
	BIT #$9000				;$B2CEEC   |
	BEQ CODE_B2CF1E				;$B2CEEF   |
	LDY active_kong_sprite			;$B2CEF1   |
	LDX $18,y				;$B2CEF4   |
	JSL CODE_BB85E8				;$B2CEF6   |
	LDA #$1D93				;$B2CEFA   |
	STA $0541				;$B2CEFD   |
	LDX current_sprite			;$B2CF00   |
	LDA map_node_number			;$B2CF02   |
	JSL CODE_B48018				;$B2CF05   |
	LDA #$0040				;$B2CF09   |
	TSB $05FB				;$B2CF0C   |
	JSR CODE_B2CDE5				;$B2CF0F   |
	LDA map_node_number			;$B2CF12   |
	CMP #$0002				;$B2CF15   |
	BNE CODE_B2CF1D				;$B2CF18   |
	STZ $05ED				;$B2CF1A  /
CODE_B2CF1D:
	RTS					;$B2CF1D  |>

CODE_B2CF1E:
	LDX active_kong_sprite			;$B2CF1E  \
	LDA $18,x				;$B2CF21   |
	BNE CODE_B2CF37				;$B2CF23   |
	LDY map_node_number			;$B2CF25   |
	LDA DATA_B2CF4B,y			;$B2CF28   |
	AND #$00FF				;$B2CF2B   |
	STA $1A,x				;$B2CF2E   |
	LDA map_node_number			;$B2CF30   |
	JSL CODE_B4801B				;$B2CF33  /
CODE_B2CF37:
	LDX current_sprite			;$B2CF37  \
	RTS					;$B2CF39  /

CODE_B2CF3A:
	LDX active_kong_sprite			;$B2CF3A  \
	LDY $18,x				;$B2CF3D   |
	BEQ CODE_B2CF37				;$B2CF3F   |
	LDA #$0001				;$B2CF41   |
	STA.w sprite.general_purpose_6C,y	;$B2CF44   |
	STZ $18,x				;$B2CF47   |
	BRA CODE_B2CF37				;$B2CF49  /

DATA_B2CF4B:
	db $00,$03,$4F,$4B,$43,$44,$4C,$45
	db $46,$4D,$47,$4E,$48,$49,$4A,$50
	db $51,$52,$53,$54,$55

CODE_B2CF60:
	LDA #$0001				;$B2CF60  \
	STA temp_1A				;$B2CF63  /
CODE_B2CF65:
	LDA temp_1A				;$B2CF65  \
	ASL					;$B2CF67   |
	ASL					;$B2CF68   |
	ASL					;$B2CF69   |
	CLC					;$B2CF6A   |
	ADC temp_1A				;$B2CF6B   |
	ADC temp_1A				;$B2CF6D   |
	ADC temp_1A				;$B2CF6F   |
	ADC #DATA_B4D092			;$B2CF71   |
	TAX					;$B2CF74   |
	LDA.l (DATA_B4D092&$FF0000)+$02,x	;$B2CF75   |
	STA $05ED				;$B2CF79   |
	SEC					;$B2CF7C   |
	SBC #$0010				;$B2CF7D   |
	CMP sprite.x_position,y			;$B2CF80   |
	BCS CODE_B2CFAD				;$B2CF83   |
	CLC					;$B2CF85   |
	ADC #$0020				;$B2CF86   |
	CMP sprite.x_position,y			;$B2CF89   |
	BCC CODE_B2CFAD				;$B2CF8C   |
	LDA.l (DATA_B4D092&$FF0000)+$04,x	;$B2CF8E   |
	STA $05EF				;$B2CF92   |
	SEC					;$B2CF95   |
	SBC #$0020				;$B2CF96   |
	CMP sprite.y_position,y			;$B2CF99   |
	BCS CODE_B2CFAD				;$B2CF9C   |
	CLC					;$B2CF9E   |
	ADC #$0020				;$B2CF9F   |
	CMP sprite.y_position,y			;$B2CFA2   |
	BCC CODE_B2CFAD				;$B2CFA5   |
	LDA temp_1A				;$B2CFA7   |
	STA map_node_number			;$B2CFA9   |
	RTS					;$B2CFAC  /

CODE_B2CFAD:
	INC temp_1A				;$B2CFAD  \
	LDA temp_1A				;$B2CFAF   |
	CMP #$0015				;$B2CFB1   |
	BCC CODE_B2CF65				;$B2CFB4   |
	CLC					;$B2CFB6   |
	RTS					;$B2CFB7  /


gyrocopter_blades_and_shadow_main:
	LDX sprite.general_purpose_5C,y		;$B2CFB8  \
	JSR CODE_B2CFE9				;$B2CFBA   |
	LDA sprite.oam_property,x		;$B2CFBD   |
	EOR.w sprite.oam_property,y		;$B2CFBF   |
	AND #$3000				;$B2CFC2   |
	EOR.w sprite.oam_property,y		;$B2CFC5   |
	STA.w sprite.oam_property,y		;$B2CFC8   |
	LDA sprite.general_purpose_4E,x		;$B2CFCB   |
	JSR CODE_B2D045				;$B2CFCD   |
	LDA sprite.unknown_58,x			;$B2CFD0   |
	STA.w sprite.unknown_58,y		;$B2CFD2   |
	LDA temp_1A				;$B2CFD5   |
	STA.w sprite.x_position,y		;$B2CFD7   |
	LDA temp_1C				;$B2CFDA   |
	STA.w sprite.y_position,y		;$B2CFDC   |
	JSL process_anim_preserve_state		;$B2CFDF   |
	JSR CODE_B2D00B				;$B2CFE3   |
	JML [$04F5]				;$B2CFE6  /

CODE_B2CFE9:
	LDA #$3000				;$B2CFE9
	STA temp_3E				;$B2CFEC
	LDA sprite.x_position,x			;$B2CFEE
	CMP #$01B0				;$B2CFF0
	BCS CODE_B2D001				;$B2CFF3
	LDA sprite.y_position,x			;$B2CFF5
	CMP #$019C				;$B2CFF7
	BCS CODE_B2D001				;$B2CFFA
	LDA #$2000				;$B2CFFC
	STA temp_3E				;$B2CFFF
CODE_B2D001:
	LDA sprite.oam_property,x		;$B2D001
	AND #$CFFF				;$B2D003
	ORA temp_3E				;$B2D006
	STA sprite.oam_property,x		;$B2D008
	RTS					;$B2D00A

CODE_B2D00B:
	LDY sprite.general_purpose_5C,x		;$B2D00B
	LDA.w sprite.oam_property,y		;$B2D00D
	AND #$3000				;$B2D010
	ORA #$07EC				;$B2D013
	STA temp_3E				;$B2D016
	LDA.w sprite.y_position,y		;$B2D018
	LDX sprite.x_position,y			;$B2D01B
	JSL CODE_B7801B				;$B2D01D
	BCS CODE_B2D044				;$B2D021
	LDA #$8078				;$B2D023
	JSL CODE_B78021				;$B2D026
	BCS CODE_B2D044				;$B2D02A
	STA $00,x				;$B2D02C
	LDY temp_3E				;$B2D02E
	LDA active_frame_counter		;$B2D030
	BIT #$0001				;$B2D032
	BNE CODE_B2D039				;$B2D035
	INY					;$B2D037
	INY					;$B2D038
CODE_B2D039:
	STY $02,x				;$B2D039
	JSR CODE_B2E329				;$B2D03B
	INX					;$B2D03E
	INX					;$B2D03F
	INX					;$B2D040
	INX					;$B2D041
	STX next_oam_slot			;$B2D042
CODE_B2D044:
	RTS					;$B2D044

CODE_B2D045:
	AND #$03FF				;$B2D045
	LSR					;$B2D048
	LSR					;$B2D049
	LSR					;$B2D04A
	LSR					;$B2D04B
	LSR					;$B2D04C
	AND #$FFFE				;$B2D04D
	TAY					;$B2D050
	LDA DATA_B2D07A,y			;$B2D051
	AND #$00FF				;$B2D054
	BIT #$0080				;$B2D057
	BEQ CODE_B2D05F				;$B2D05A
	ORA #$FF00				;$B2D05C
CODE_B2D05F:
	CLC					;$B2D05F
	ADC sprite.x_position,x			;$B2D060
	STA temp_1A				;$B2D062
	LDA DATA_B2D07A+$01,y			;$B2D064
	AND #$00FF				;$B2D067
	BIT #$0080				;$B2D06A
	BEQ CODE_B2D072				;$B2D06D
	ORA #$FF00				;$B2D06F
CODE_B2D072:
	CLC					;$B2D072
	ADC sprite.y_position,x			;$B2D073
	STA temp_1C				;$B2D075
	LDY current_sprite			;$B2D077
	RTS					;$B2D079

DATA_B2D07A:
	db $00,$02,$FC,$03,$F7,$02,$F4,$FF
	db $F3,$FD,$F4,$FD,$F7,$FB,$FB,$FA
	db $00,$F9,$05,$FA,$09,$FB,$0C,$FD
	db $0D,$FD,$0C,$FF,$09,$02,$05,$03

CODE_B2D09A:
	LDA active_frame_counter		;$B2D09A
	INC					;$B2D09C
	BIT #$0007				;$B2D09D
	BNE CODE_B2D0EB				;$B2D0A0
	LDA $1C7F				;$B2D0A2
	BEQ CODE_B2D0EB				;$B2D0A5
	BMI CODE_B2D0B9				;$B2D0A7
	DEC					;$B2D0A9
	BEQ CODE_B2D0C9				;$B2D0AA
	STA $1C7F				;$B2D0AC
	LDA #$0032				;$B2D0AF
	JSL CODE_B2801E				;$B2D0B2
	LDY current_sprite			;$B2D0B6
	RTS					;$B2D0B8

CODE_B2D0B9:
	INC					;$B2D0B9
	BEQ CODE_B2D0C9				;$B2D0BA
	STA $1C7F				;$B2D0BC
	LDA #$00C8				;$B2D0BF
	JSL CODE_B2801E				;$B2D0C2
	LDY current_sprite			;$B2D0C6
	RTS					;$B2D0C8

CODE_B2D0C9:
	LDA.w sprite.general_purpose_5C,y	;$B2D0C9
	BMI CODE_B2D0E0				;$B2D0CC
	BEQ CODE_B2D0EB				;$B2D0CE
	ORA #$8000				;$B2D0D0
	STA.w sprite.general_purpose_5C,y	;$B2D0D3
	LDA #$0001				;$B2D0D6
	JSL CODE_B28021				;$B2D0D9
	LDY current_sprite			;$B2D0DD
	RTS					;$B2D0DF

CODE_B2D0E0:
	AND #$7FFF				;$B2D0E0
	JSL CODE_B28018				;$B2D0E3
	TDC					;$B2D0E7
	STA.w sprite.general_purpose_5C,y	;$B2D0E8
CODE_B2D0EB:
	RTS					;$B2D0EB

CODE_B2D0EC:
	SEC					;$B2D0EC
	SBC #$0100				;$B2D0ED
	LSR					;$B2D0F0
	LSR					;$B2D0F1
	LSR					;$B2D0F2
	STA temp_3E				;$B2D0F3
	TXA					;$B2D0F5
	SEC					;$B2D0F6
	SBC #$0100				;$B2D0F7
	AND #$FFF8				;$B2D0FA
	ASL					;$B2D0FD
	ASL					;$B2D0FE
	ASL					;$B2D0FF
	CLC					;$B2D100
	ADC temp_3E				;$B2D101
	TAX					;$B2D103
	LDA $7E82E8,x				;$B2D104
	AND #$00FF				;$B2D108
	RTS					;$B2D10B

CODE_B2D10C:
	SEC					;$B2D10C
	SBC.w sprite.general_purpose_52,y	;$B2D10D
	LSR					;$B2D110
	LSR					;$B2D111
	LSR					;$B2D112
	STA temp_3E				;$B2D113
	TXA					;$B2D115
	AND #$FFF8				;$B2D116
	ASL					;$B2D119
	ASL					;$B2D11A
	CLC					;$B2D11B
	ADC temp_3E				;$B2D11C
	TAX					;$B2D11E
	LDA $7E82E8,x				;$B2D11F
	AND #$00FF				;$B2D123
	RTS					;$B2D126

CODE_B2D127:
	LDY sprite.general_purpose_62,x		;$B2D127
	CPY #$0030				;$B2D129
	BCS CODE_B2D135				;$B2D12C
	LDA sprite.general_purpose_4E,x		;$B2D12E
	STA sprite.general_purpose_60,x		;$B2D130
	BRL CODE_B2D1B1				;$B2D132

CODE_B2D135:
	LDY sprite.general_purpose_60,x		;$B2D135
	STY temp_24				;$B2D137
	AND #$0007				;$B2D139
	CMP #$0001				;$B2D13C
	BEQ CODE_B2D167				;$B2D13F
	CMP #$0002				;$B2D141
	BEQ CODE_B2D17E				;$B2D144
	CMP #$0003				;$B2D146
	BEQ CODE_B2D19C				;$B2D149
	CMP #$0004				;$B2D14B
	BNE CODE_B2D1B1				;$B2D14E
	LDA #$0100				;$B2D150
	SEC					;$B2D153
	SBC sprite.general_purpose_60,x		;$B2D154
	AND #$03FF				;$B2D156
	CMP #$0080				;$B2D159
	BEQ CODE_B2D192				;$B2D15C
	CMP #$0280				;$B2D15E
	BEQ CODE_B2D192				;$B2D161
	STA sprite.general_purpose_60,x		;$B2D163
	BRA CODE_B2D1B1				;$B2D165

CODE_B2D167:
	LDA #$0200				;$B2D167
	SEC					;$B2D16A
	SBC sprite.general_purpose_60,x		;$B2D16B
	AND #$03FF				;$B2D16D
	CMP #$0100				;$B2D170
	BEQ CODE_B2D192				;$B2D173
	CMP #$0300				;$B2D175
	BEQ CODE_B2D192				;$B2D178
	STA sprite.general_purpose_60,x		;$B2D17A
	BRA CODE_B2D1B1				;$B2D17C

CODE_B2D17E:
	LDA #$0400				;$B2D17E
	SEC					;$B2D181
	SBC sprite.general_purpose_60,x		;$B2D182
	AND #$03FF				;$B2D184
	BEQ CODE_B2D192				;$B2D187
	CMP #$0200				;$B2D189
	BEQ CODE_B2D192				;$B2D18C
	STA sprite.general_purpose_60,x		;$B2D18E
	BRA CODE_B2D1B1				;$B2D190

CODE_B2D192:
	LDA sprite.general_purpose_60,x		;$B2D192
	SEC					;$B2D194
	SBC #$0040				;$B2D195
	STA sprite.general_purpose_60,x		;$B2D198
	BRA CODE_B2D1C7				;$B2D19A

CODE_B2D19C:
	LDA #$0300				;$B2D19C
	SEC					;$B2D19F
	SBC sprite.general_purpose_60,x		;$B2D1A0
	AND #$03FF				;$B2D1A2
	CMP #$0180				;$B2D1A5
	BEQ CODE_B2D192				;$B2D1A8
	CMP #$0380				;$B2D1AA
	BEQ CODE_B2D192				;$B2D1AD
	STA sprite.general_purpose_60,x		;$B2D1AF
CODE_B2D1B1:
	LDA sprite.general_purpose_62,x		;$B2D1B1
	CMP #$8000				;$B2D1B3
	ROR					;$B2D1B6
	LDY current_map_vehicle			;$B2D1B7
	BEQ CODE_B2D1C0				;$B2D1BA
	CMP #$8000				;$B2D1BC
	ROR					;$B2D1BF
CODE_B2D1C0:
	STA sprite.general_purpose_62,x		;$B2D1C0
	LDA #$0010				;$B2D1C2
	STA sprite.general_purpose_4C,x		;$B2D1C5
CODE_B2D1C7:
	LDA $7EA222				;$B2D1C7
	STA sprite.x_position,x			;$B2D1CB
	LDA $7EA224				;$B2D1CD
	STA sprite.y_position,x			;$B2D1D1
	RTS					;$B2D1D3

CODE_B2D1D4:
	LDA sprite.x_position,x			;$B2D1D4
	STA.w sprite.x_position,y		;$B2D1D6
	LDA sprite.y_position,x			;$B2D1D9
	STA.w sprite.y_position,y		;$B2D1DB
	LDA sprite.unknown_58,x			;$B2D1DE
	STA.w sprite.unknown_58,y		;$B2D1E0
	RTS					;$B2D1E3

CODE_B2D1E4:
	LDY active_kong_sprite			;$B2D1E4
	LDA.w sprite.state,y			;$B2D1E7
	CMP #$0009				;$B2D1EA
	BNE CODE_B2D1FE				;$B2D1ED
	LDY #$0218				;$B2D1EF
	JSL CODE_BB85B8				;$B2D1F2
	LDY current_sprite			;$B2D1F6
	BCS CODE_B2D1FE				;$B2D1F8
	LDX alternate_sprite			;$B2D1FA
	STY sprite.general_purpose_5C,x		;$B2D1FC
CODE_B2D1FE:
	RTS					;$B2D1FE

CODE_B2D1FF:
	LDY current_sprite			;$B2D1FF
	LDA.w sprite.general_purpose_60,y	;$B2D201
	AND #$03FF				;$B2D204
	TAX					;$B2D207
	LDA.w sprite.general_purpose_62,y	;$B2D208
	JSL CODE_808036				;$B2D20B
	STX sprite.x_speed,y			;$B2D20F
	EOR #$FFFF				;$B2D211
	INC					;$B2D214
	STA.w sprite.y_speed,y			;$B2D215
	RTS					;$B2D218

CODE_B2D219:
	LDY current_sprite			;$B2D219
	LDA current_map_vehicle			;$B2D21B
	CMP #!vehicle_gyrocopter		;$B2D21E
	BEQ CODE_B2D237				;$B2D221
	TYX					;$B2D223
	LDA sprite.general_purpose_62,x		;$B2D224
	BNE CODE_B2D23E				;$B2D226
	LDA sprite.unknown_3E,x			;$B2D228
	BEQ CODE_B2D238				;$B2D22A
	DEC sprite.unknown_3E,x			;$B2D22C
	BNE CODE_B2D237				;$B2D22E
	LDX $1C8F				;$B2D230
	BEQ CODE_B2D237				;$B2D233
	STY sprite.general_purpose_5E,x		;$B2D235
CODE_B2D237:
	RTS					;$B2D237

CODE_B2D238:
	LDA #$0020				;$B2D238
	STA sprite.unknown_3E,x			;$B2D23B
	RTS					;$B2D23D

CODE_B2D23E:
	LDA $1C8F				;$B2D23E
	BNE CODE_B2D237				;$B2D241
	JSR CODE_B2D1E4				;$B2D243
	RTS					;$B2D246

CODE_B2D247:
	LDX current_sprite			;$B2D247
	LDA active_frame_counter		;$B2D249
	BIT #$0003				;$B2D24B
	BEQ CODE_B2D255				;$B2D24E
	LDA sprite.general_purpose_62,x		;$B2D250
	BNE CODE_B2D268				;$B2D252
	RTS					;$B2D254

CODE_B2D255:
	LDA sprite.general_purpose_62,x		;$B2D255
	LSR					;$B2D257
	LSR					;$B2D258
	LSR					;$B2D259
	LSR					;$B2D25A
	SBC #$0020				;$B2D25B
	AND #$00FF				;$B2D25E
	JSL CODE_B28021				;$B2D261
	LDX current_sprite			;$B2D265
	RTS					;$B2D267

CODE_B2D268:
	LDY $18,x				;$B2D268
	BMI CODE_B2D283				;$B2D26A
	LDA $1C35				;$B2D26C
	BIT #$0100				;$B2D26F
	BNE CODE_B2D283				;$B2D272
	STY sprite.general_purpose_5C,x		;$B2D274
	LDA #$FFFC				;$B2D276
	STA $1C7F				;$B2D279
	LDA $18,x				;$B2D27C
	ORA #$8000				;$B2D27E
	STA $18,x				;$B2D281
CODE_B2D283:
	RTS					;$B2D283

CODE_B2D284:
	LDY current_sprite			;$B2D284
	LDA.w sprite.general_purpose_62,y	;$B2D286
	CMP #$0040				;$B2D289
	BCS CODE_B2D2B9				;$B2D28C
	LDA active_frame_counter		;$B2D28E
	BIT #$0003				;$B2D290
	BNE CODE_B2D2A9				;$B2D293
	LSR					;$B2D295
	AND #$000F				;$B2D296
	TAX					;$B2D299
	LDA current_map_vehicle			;$B2D29A
	CMP #!vehicle_gyrocopter		;$B2D29D
	BEQ CODE_B2D2AA				;$B2D2A0
	LDA.l DATA_B2D2DF,x			;$B2D2A2
CODE_B2D2A6:
	STA.w sprite.unknown_58,y		;$B2D2A6
CODE_B2D2A9:
	RTS					;$B2D2A9

CODE_B2D2AA:
	JSR CODE_B2D2C6				;$B2D2AA
	CLC					;$B2D2AD
	ADC.l DATA_B2D2EF,x			;$B2D2AE
	BMI CODE_B2D2A6				;$B2D2B2
	LDA #$0000				;$B2D2B4
	BRA CODE_B2D2A6				;$B2D2B7

CODE_B2D2B9:
	LDA current_map_vehicle			;$B2D2B9
	CMP #!vehicle_gyrocopter		;$B2D2BC
	BNE CODE_B2D2A9				;$B2D2BF
	JSR CODE_B2D2C6				;$B2D2C1
	BRA CODE_B2D2A6				;$B2D2C4

CODE_B2D2C6:
	LDA #$01C0				;$B2D2C6
	SEC					;$B2D2C9
	SBC.w sprite.y_position,y		;$B2D2CA
	BMI CODE_B2D2DA				;$B2D2CD
	XBA					;$B2D2CF
	LSR					;$B2D2D0
	LSR					;$B2D2D1
	AND #$FF00				;$B2D2D2
	CLC					;$B2D2D5
	ADC.w sprite.animation_id,y		;$B2D2D6
	RTS					;$B2D2D9

CODE_B2D2DA:
	LDA.w sprite.animation_id,y		;$B2D2DA
	BRA CODE_B2D2A6				;$B2D2DD

DATA_B2D2DF:
	dw $FF00
	dw $FF00
	dw $FF00
	dw $FF00
	dw $0000
	dw $0000
	dw $0000
	dw $0000

DATA_B2D2EF:
	dw $FF00
	dw $FF01
	dw $FE01
	dw $FD01
	dw $FD00
	dw $FD00
	dw $FE00
	dw $FF00

CODE_B2D2FF:
	LDY.b $6C,x				;$B2D2FF
	BNE.b CODE_B2D325			;$B2D301
	LDY.b $62,x				;$B2D303
	CPY.w #$0130				;$B2D305
	BCC.b CODE_B2D325			;$B2D308
CODE_B2D30A:
	PHA					;$B2D30A
	TYA					;$B2D30B
	STA.w $1C85				;$B2D30C
	EOR.w #$FFFF				;$B2D30F
	INC					;$B2D312
	LDY.w current_map_vehicle		;$B2D313
	CPY.w #!vehicle_turbo_ski		;$B2D316
	BEQ.b CODE_B2D31E			;$B2D319
	LDA.w #$FF00				;$B2D31B
CODE_B2D31E:
	STA.b $2C,x				;$B2D31E
	STA.b $6C,x				;$B2D320
	STZ.b $58,x				;$B2D322
	PLA					;$B2D324
CODE_B2D325:
	RTS					;$B2D325

CODE_B2D326:
	LDX.b current_sprite			;$B2D326
	LDY.b $6C,x				;$B2D328
	BEQ.b CODE_B2D354			;$B2D32A
	SEP.b #$20				;$B2D32C
	LDA.b $59,x				;$B2D32E
	CLC					;$B2D330
	ADC.b $2D,x				;$B2D331
	STA.b $59,x				;$B2D333
	REP.b #$20				;$B2D335
	BMI.b CODE_B2D344			;$B2D337
	STZ.b $6C,x				;$B2D339
	LDA.w $1C85				;$B2D33B
	CMP.b $62,x				;$B2D33E
	BPL.b CODE_B2D344			;$B2D340
	STA.b $62,x				;$B2D342
CODE_B2D344:
	LDA.b $2C,x				;$B2D344
	CLC					;$B2D346
	ADC.w #$0060				;$B2D347
	STA.b $2C,x				;$B2D34A
	LDA.b $62,x				;$B2D34C
	CLC					;$B2D34E
	ADC.w #$0004				;$B2D34F
	STA.b $62,x				;$B2D352
CODE_B2D354:
	RTS					;$B2D354

DATA_B2D355:
	dw $FF00
	dw $FF00
	dw $FE00
	dw $FD00
	dw $FD00
	dw $FE00
	dw $FF00
	dw $FF00

CODE_B2D365:
	LDA #$0100				;$B2D365
	BIT $1C35				;$B2D368
	BNE CODE_B2D378				;$B2D36B
	LDA player_active_pressed		;$B2D36D
	BIT #$8080				;$B2D370
	BEQ CODE_B2D378				;$B2D373
	JSR CODE_B2C6B7				;$B2D375
CODE_B2D378:
	RTS					;$B2D378

CODE_B2D379:
	LDX current_sprite			;$B2D379
	LDA sprite.general_purpose_6C,x		;$B2D37B
	BNE CODE_B2D3D4				;$B2D37D
	LDA #$1000				;$B2D37F
	BIT $05FD				;$B2D382
	BNE CODE_B2D38F				;$B2D385
	LDA screen_brightness			;$B2D387
	BIT #$FF00				;$B2D38A
	BNE CODE_B2D397				;$B2D38D
CODE_B2D38F:
	LDA player_active_held			;$B2D38F
	AND #$0F00				;$B2D392
	BNE CODE_B2D39B				;$B2D395
CODE_B2D397:
	JSR CODE_B2D50E				;$B2D397
	RTS					;$B2D39A

CODE_B2D39B:
	BIT #$0800				;$B2D39B
	BEQ CODE_B2D3A3				;$B2D39E
	AND #$FBFF				;$B2D3A0
CODE_B2D3A3:
	BIT #$0100				;$B2D3A3
	BEQ CODE_B2D3AB				;$B2D3A6
	AND #$FDFF				;$B2D3A8
CODE_B2D3AB:
	XBA					;$B2D3AB
	ASL					;$B2D3AC
	TAY					;$B2D3AD
	LDA DATA_B2D4C5-$02,y			;$B2D3AE
	STA $1C81				;$B2D3B1
	STA temp_24				;$B2D3B4
	CLC					;$B2D3B6
	ADC #$0200				;$B2D3B7
	AND #$03FF				;$B2D3BA
	STA temp_26				;$B2D3BD
	JSR CODE_B2D4D9				;$B2D3BF
	LDA sprite.general_purpose_68,x		;$B2D3C2
	STA temp_28				;$B2D3C4
	JSR CODE_B2D3D9				;$B2D3C6
	BEQ CODE_B2D3D4				;$B2D3C9
	BCC CODE_B2D3D5				;$B2D3CB
	SBC temp_28				;$B2D3CD
CODE_B2D3CF:
	AND #$03FF				;$B2D3CF
	STA sprite.general_purpose_60,x		;$B2D3D2
CODE_B2D3D4:
	RTS					;$B2D3D4

CODE_B2D3D5:
	ADC temp_28				;$B2D3D5
	BRA CODE_B2D3CF				;$B2D3D7

CODE_B2D3D9:
	LDA player_active_held			;$B2D3D9
	AND #$0F00				;$B2D3DC
	BEQ CODE_B2D3F6				;$B2D3DF
	BIT #$0100				;$B2D3E1
	BEQ CODE_B2D3EC				;$B2D3E4
CODE_B2D3E6:
	LDA sprite.general_purpose_60,x		;$B2D3E6
	JSR CODE_B2D3FE				;$B2D3E8
	RTS					;$B2D3EB

CODE_B2D3EC:
	BIT #$0200				;$B2D3EC
	BEQ CODE_B2D3F7				;$B2D3EF
CODE_B2D3F1:
	LDA sprite.general_purpose_60,x		;$B2D3F1
	JSR CODE_B2D413				;$B2D3F3
CODE_B2D3F6:
	RTS					;$B2D3F6

CODE_B2D3F7:
	EOR #$0800				;$B2D3F7
	BEQ CODE_B2D3E6				;$B2D3FA
	BRA CODE_B2D3F1				;$B2D3FC

CODE_B2D3FE:
	CMP temp_24				;$B2D3FE
	BCC CODE_B2D40C				;$B2D400
	BEQ CODE_B2D40C				;$B2D402
	CMP temp_26				;$B2D404
	BEQ CODE_B2D40E				;$B2D406
	BCS CODE_B2D40C				;$B2D408
	SEC					;$B2D40A
	RTS					;$B2D40B

CODE_B2D40C:
	CLC					;$B2D40C
	RTS					;$B2D40D

CODE_B2D40E:
	CMP #$FFFF				;$B2D40E
	CLC					;$B2D411
	RTS					;$B2D412

CODE_B2D413:
	CMP temp_26				;$B2D413
	BCC CODE_B2D41E				;$B2D415
	BEQ CODE_B2D420				;$B2D417
	CMP temp_24				;$B2D419
	BCS CODE_B2D41E				;$B2D41B
	RTS					;$B2D41D

CODE_B2D41E:
	SEC					;$B2D41E
	RTS					;$B2D41F

CODE_B2D420:
	CMP #$FFFF				;$B2D420
	SEC					;$B2D423
	RTS					;$B2D424

CODE_B2D425:
	LDA current_map_vehicle			;$B2D425
	BNE CODE_B2D438				;$B2D428
	LDX current_sprite			;$B2D42A
	LDA sprite.general_purpose_4C,x		;$B2D42C
	BEQ CODE_B2D438				;$B2D42E
	DEC sprite.general_purpose_4C,x		;$B2D430
	BNE CODE_B2D438				;$B2D432
	LDA sprite.general_purpose_4E,x		;$B2D434
	STA sprite.general_purpose_60,x		;$B2D436
CODE_B2D438:
	RTS					;$B2D438

CODE_B2D439:
	LDA player_active_held			;$B2D439
	BIT #$0F00				;$B2D43C
	BEQ CODE_B2D486				;$B2D43F
	LDX current_sprite			;$B2D441
	LDA $1C81				;$B2D443
	STA temp_24				;$B2D446
	CLC					;$B2D448
	ADC #$0200				;$B2D449
	AND #$03FF				;$B2D44C
	STA temp_26				;$B2D44F
	LDA sprite.general_purpose_68,x		;$B2D451
	LDY current_map_vehicle			;$B2D453
	BEQ CODE_B2D459				;$B2D456
	ASL					;$B2D458
CODE_B2D459:
	STA temp_28				;$B2D459
	JSR CODE_B2D49B				;$B2D45B
	BEQ CODE_B2D486				;$B2D45E
	BCC CODE_B2D487				;$B2D460
	SBC temp_28				;$B2D462
CODE_B2D464:
	AND #$03FF				;$B2D464
	LDY current_map_vehicle			;$B2D467
	CPY #!vehicle_gyrocopter		;$B2D46A
	BEQ CODE_B2D482				;$B2D46D
	STA temp_1E				;$B2D46F
	JSR CODE_B2CBD5				;$B2D471
	LDA temp_1A				;$B2D474
	LDX temp_1C				;$B2D476
	JSR CODE_B2D0EC				;$B2D478
	BIT #$0080				;$B2D47B
	BNE CODE_B2D48B				;$B2D47E
	LDA temp_1E				;$B2D480
CODE_B2D482:
	LDX current_sprite			;$B2D482
	STA sprite.general_purpose_4E,x		;$B2D484
CODE_B2D486:
	RTS					;$B2D486

CODE_B2D487:
	ADC temp_28				;$B2D487
	BRA CODE_B2D464				;$B2D489

CODE_B2D48B:
	LDX current_sprite			;$B2D48B
	LDA sprite.general_purpose_4E,x		;$B2D48D
	CLC					;$B2D48F
	ADC #$0020				;$B2D490
	STA sprite.general_purpose_60,x		;$B2D493
	LDA #$0010				;$B2D495
	STA sprite.general_purpose_4C,x		;$B2D498
	RTS					;$B2D49A

CODE_B2D49B:
	LDA $1C81				;$B2D49B
	CMP #$0001				;$B2D49E
	BCC CODE_B2D4AE				;$B2D4A1
	CMP #$0200				;$B2D4A3
	BCS CODE_B2D4AE				;$B2D4A6
CODE_B2D4A8:
	LDA sprite.general_purpose_4E,x		;$B2D4A8
	JSR CODE_B2D3FE				;$B2D4AA
	RTS					;$B2D4AD

CODE_B2D4AE:
	CMP #$0201				;$B2D4AE
	BCC CODE_B2D4B9				;$B2D4B1
CODE_B2D4B3:
	LDA sprite.general_purpose_4E,x		;$B2D4B3
	JSR CODE_B2D413				;$B2D4B5
	RTS					;$B2D4B8

CODE_B2D4B9:
	CMP #$0101				;$B2D4B9
	BCC CODE_B2D4A8				;$B2D4BC
	CMP #$0300				;$B2D4BE
	BCS CODE_B2D4A8				;$B2D4C1
	BRA CODE_B2D4B3				;$B2D4C3

DATA_B2D4C5:
	dw $0100,$0300,$0000,$0200
	dw $0180,$0280,$0000,$0000
	dw $0080,$0380

CODE_B2D4D9:
	LDA sprite.general_purpose_60,x		;$B2D4D9
	SEC					;$B2D4DB
	SBC temp_26				;$B2D4DC
	JSR CODE_B2D51D				;$B2D4DE
	CMP #$00D0				;$B2D4E1
	BMI CODE_B2D50E				;$B2D4E4
	LDY sprite.general_purpose_6A,x		;$B2D4E6
	LDA player_active_held			;$B2D4E8
	BIT #$4000				;$B2D4EB
	BNE CODE_B2D500				;$B2D4EE
	LDA sprite.general_purpose_64,x		;$B2D4F0
	CMP sprite.general_purpose_62,x		;$B2D4F2
	BPL CODE_B2D4FF				;$B2D4F4
	LDA sprite.general_purpose_62,x		;$B2D4F6
	SEC					;$B2D4F8
	SBC sprite.general_purpose_66,x		;$B2D4F9
	STA sprite.general_purpose_62,x		;$B2D4FB
	BRA CODE_B2D50D				;$B2D4FD

CODE_B2D4FF:
	TAY					;$B2D4FF
CODE_B2D500:
	STY temp_28				;$B2D500
	LDA sprite.general_purpose_62,x		;$B2D502
	CLC					;$B2D504
	ADC sprite.general_purpose_66,x		;$B2D505
	CMP temp_28				;$B2D507
	BPL CODE_B2D50D				;$B2D509
	STA sprite.general_purpose_62,x		;$B2D50B
CODE_B2D50D:
	RTS					;$B2D50D

CODE_B2D50E:
	LDA sprite.general_purpose_62,x		;$B2D50E
	SEC					;$B2D510
	SBC sprite.general_purpose_66,x		;$B2D511
	BPL CODE_B2D51A				;$B2D513
	LDA sprite.general_purpose_4E,x		;$B2D515
	STA sprite.general_purpose_60,x		;$B2D517
	TDC					;$B2D519
CODE_B2D51A:
	STA sprite.general_purpose_62,x		;$B2D51A
	RTS					;$B2D51C

CODE_B2D51D:
	TAY					;$B2D51D
	CMP #$0300				;$B2D51E
	BPL CODE_B2D52B				;$B2D521
	TYA					;$B2D523
	BPL CODE_B2D52A				;$B2D524
	EOR #$FFFF				;$B2D526
	INC					;$B2D529
CODE_B2D52A:
	RTS					;$B2D52A

CODE_B2D52B:
	TDC					;$B2D52B
	RTS					;$B2D52C


game_over_blocks_main:
	JMP (.state_table,x)			;$B2D52D  |>

.state_table:
	dw .init
	dw .state_1
	dw .state_2
	dw .state_3

.init:
	LDA active_frame_counter		;$B2D538  \
	STA $1C37				;$B2D53A   |
	LDA $1C35				;$B2D53D   |
	BIT #$4000				;$B2D540   |
	BEQ .CODE_B2D5B9			;$B2D543   |
	TYX					;$B2D545   |
	INC sprite.state,x			;$B2D546   |
	JSL CODE_808018				;$B2D548   |
	AND #$03FF				;$B2D54C   |
	ORA #$0100				;$B2D54F   |
	EOR #$FFFF				;$B2D552   |
	INC					;$B2D555   |
	STA sprite.y_speed,x			;$B2D556  /
.state_1:
	TYX					;$B2D558  \
	LDA sprite.y_speed,x			;$B2D559   |
	SEC					;$B2D55B   |
	SBC #$0040				;$B2D55C   |
	STA sprite.y_speed,x			;$B2D55F   |
	LDA sprite.general_purpose_6A,x		;$B2D561   |
	CMP sprite.y_position,x			;$B2D563   |
	BCC .CODE_B2D5B9			;$B2D565   |
	INC sprite.state,x			;$B2D567   |
	LDA #$003D				;$B2D569   |
	STA sprite.movement_state,x		;$B2D56C   |
	LDA #$00C3				;$B2D56E   |
	STA sprite.general_purpose_6A,x		;$B2D571   |
	BRA .CODE_B2D5B9			;$B2D573  /

.state_2:
	TYX					;$B2D575  \
	LDA $1C35				;$B2D576   |
	BIT #$8000				;$B2D579   |
	BNE .CODE_B2D5C0			;$B2D57C   |
	LDA $1C63				;$B2D57E   |
	CMP #$0080				;$B2D581   |
	BCS .CODE_B2D5A2			;$B2D584   |
	LDA player_active_pressed		;$B2D586   |
	BIT sprite.general_purpose_5E,x		;$B2D589   |
	BEQ .CODE_B2D5A2			;$B2D58B   |
	LDA #$0080				;$B2D58D   |
	STA $1C63				;$B2D590   |
	LDA sprite.y_position,x			;$B2D593   |
	CMP #$0010				;$B2D595   |
	BMI .CODE_B2D5B9			;$B2D598   |
	LDA sprite.general_purpose_60,x		;$B2D59A   |
	JSL queue_sound_effect			;$B2D59C   |
	BRA .CODE_B2D5B4			;$B2D5A0  /

.CODE_B2D5A2:
	LDY sprite.general_purpose_66,x		;$B2D5A2  \
	LDA [current_sprite_constants],y	;$B2D5A4   |
	BMI .CODE_B2D5B9			;$B2D5A6   |
	CLC					;$B2D5A8   |
	ADC $1C37				;$B2D5A9   |
	CMP active_frame_counter		;$B2D5AC   |
	BNE .CODE_B2D5B9			;$B2D5AE   |
	INC sprite.general_purpose_66,x		;$B2D5B0   |
	INC sprite.general_purpose_66,x		;$B2D5B2  /
.CODE_B2D5B4:
	LDA #$F900				;$B2D5B4  \
	STA sprite.y_speed,x			;$B2D5B7  /
.CODE_B2D5B9:
	JSL process_current_movement		;$B2D5B9  \
	JML [$04F5]				;$B2D5BD  /

.CODE_B2D5C0:
	TYX					;$B2D5C0  \
	INC sprite.state,x			;$B2D5C1   |
	JSL CODE_808018				;$B2D5C3   |
	AND #$03FF				;$B2D5C7   |
	ORA #$0100				;$B2D5CA   |
	EOR #$FFFF				;$B2D5CD   |
	INC					;$B2D5D0   |
	STA sprite.y_speed,x			;$B2D5D1   |
	LDA #$003D				;$B2D5D3   |
	STA sprite.movement_state,x		;$B2D5D6   |
	LDA #$0440				;$B2D5D8   |
	STA sprite.general_purpose_6A,x		;$B2D5DB   |
	BRA .CODE_B2D5B9			;$B2D5DD  /

.state_3:
	LDA.w sprite.y_position,y		;$B2D5DF  \
	CMP #$0200				;$B2D5E2   |
	BCC .CODE_B2D5EA			;$B2D5E5   |
	STZ $15E6				;$B2D5E7  /
.CODE_B2D5EA:
	BRA.b .CODE_B2D5B9			;$B2D5EA  |>


stationary_display_sprite_main:
	JSL process_anim_preserve_state		;$B2D5EC
	JML [$04F5]				;$B2D5F0


ending_swanky_main:
	JMP (.state_table,x)			;$B2D5F3  |>

.state_table:
	dw .init
	dw moving_display_sprite_main

.init:
	TYX					;$B2D5FA  \
	INC sprite.state,x			;$B2D5FB   |
	LDY #$0338				;$B2D5FD   |
	JSL CODE_BB8585				;$B2D600  /
moving_display_sprite_main:
	JSL process_current_movement		;$B2D604  \
	JSL process_anim_preserve_state		;$B2D608   |
	JML [$04F5]				;$B2D60C  /

funky_kong_main:
	JMP (.state_table,x)			;$B2D60F

.state_table:
	dw CODE_B2D624
	dw CODE_B2D62B
	dw CODE_B2D633
	dw CODE_B2D63C
	dw CODE_B2D65E
	dw CODE_B2D675
	dw CODE_B2D6C2
	dw CODE_B2D6DF
	dw CODE_B2D6F8

CODE_B2D624:
	JSL process_anim_preserve_state		;$B2D624
	JML [$04F5]				;$B2D628

CODE_B2D62B:
	TYX					;$B2D62B
	LDA #$01B0				;$B2D62C
	STA sprite.general_purpose_60,x		;$B2D62F
	INC sprite.state,x			;$B2D631
CODE_B2D633:
	TYX					;$B2D633
	DEC sprite.general_purpose_60,x		;$B2D634
	BNE CODE_B2D63A				;$B2D636
	INC sprite.state,x			;$B2D638
CODE_B2D63A:
	BRA CODE_B2D624				;$B2D63A

CODE_B2D63C:
	LDA #$02D9				;$B2D63C
	JSL set_sprite_animation		;$B2D63F
	LDA #$0120				;$B2D643
	STA sprite.general_purpose_5E,x		;$B2D646
	LDA #$00A0				;$B2D648
	STA sprite.max_x_speed,x		;$B2D64B
	STA sprite.x_speed,x			;$B2D64D
	LDA #$FFFE				;$B2D64F
	STA sprite.general_purpose_62,x		;$B2D652
	INC sprite.state,x			;$B2D654
	LDY $18E7				;$B2D656
	LDA sprite.general_purpose_66,x		;$B2D659
	STA.w sprite.general_purpose_5C,y	;$B2D65B
CODE_B2D65E:
	LDA #$0012				;$B2D65E
	JSL process_alternate_movement		;$B2D661
	BCC CODE_B2D66E				;$B2D665
	LDA #$0150				;$B2D667
	STA sprite.general_purpose_60,x		;$B2D66A
	INC sprite.state,x			;$B2D66C
CODE_B2D66E:
	JSL process_anim_preserve_state		;$B2D66E
	JML [$04F5]				;$B2D672

CODE_B2D675:
	TYX					;$B2D675
	DEC sprite.general_purpose_60,x		;$B2D676
	BNE CODE_B2D67C				;$B2D678
	INC sprite.state,x			;$B2D67A
CODE_B2D67C:
	LDA sprite.general_purpose_64,x		;$B2D67C
	BEQ CODE_B2D685				;$B2D67E
	DEC sprite.general_purpose_64,x		;$B2D680
CODE_B2D682:
	JML [$04F5]				;$B2D682

CODE_B2D685:
	INC sprite.general_purpose_62,x		;$B2D685
	INC sprite.general_purpose_62,x		;$B2D687
	LDY sprite.general_purpose_62,x		;$B2D689
	LDA DATA_B2D6A4,y			;$B2D68B
	BEQ CODE_B2D682				;$B2D68E
	LDY #$0028				;$B2D690
	CMP #$0240				;$B2D693
	BEQ CODE_B2D69B				;$B2D696
	LDY #$000C				;$B2D698
CODE_B2D69B:
	STY sprite.general_purpose_64,x		;$B2D69B
	TAY					;$B2D69D
	JSL CODE_BB8585				;$B2D69E
	BRA CODE_B2D682				;$B2D6A2

;Spawn script indexes
DATA_B2D6A4:
	dw $0240
	dw $0240
	dw $0240
	dw $0244
	dw $0244
	dw $0244
	dw $0240
	dw $0240
	dw $0246
	dw $0246
	dw $0246
	dw $0246
	dw $0246
	dw $0240
	dw $0000

CODE_B2D6C2:
	TYX					;$B2D6C2
	LDA sprite.oam_property,x		;$B2D6C3
	EOR #$4000				;$B2D6C5
	STA sprite.oam_property,x		;$B2D6C8
	LDA #$02DA				;$B2D6CA
	JSL set_sprite_animation		;$B2D6CD
	LDA #$00E2				;$B2D6D1
	STA sprite.general_purpose_5E,x		;$B2D6D4
	LDA #$FF60				;$B2D6D6
	STA sprite.max_x_speed,x		;$B2D6D9
	STA sprite.x_speed,x			;$B2D6DB
	INC sprite.state,x			;$B2D6DD
CODE_B2D6DF:
	LDA #$0012				;$B2D6DF
	JSL process_alternate_movement		;$B2D6E2
	BCC CODE_B2D6F1				;$B2D6E6
	LDA #$02DB				;$B2D6E8
	JSL set_sprite_animation		;$B2D6EB
	STZ sprite.state,x			;$B2D6EF
CODE_B2D6F1:
	JSL process_anim_preserve_state		;$B2D6F1
	JML [$04F5]				;$B2D6F5

CODE_B2D6F8:
	JSL process_anim_preserve_state		;$B2D6F8
knautilus_sprite_mask_main:
	JSL process_current_movement		;$B2D6FC
	JML [$04F5]				;$B2D700


swanky_kong_main:
	JMP (.state_table,x)			;$B2D703

.state_table:
	dw .state_0
	dw .state_1
	dw .dummy

.state_0:
	TYX					;$B2D70C  \ Get Swanky sprite
	LDY active_kong_sprite			;$B2D70D   |
	LDA.w sprite.state,y			;$B2D710   | Get active kong's state
	BNE ..return				;$B2D713   | If not, minigame is done, or kong is walking to tent
	INC sprite.state,x			;$B2D715  /
..return:
	JMP CODE_B2E074				;$B2D717  |> Return and process animation

.state_1:
	TYX					;$B2D71A  \ Get Swanky sprite
	LDA $0543				;$B2D71B   | Check if we have prizes to give after minigame ends
	BEQ .dummy				;$B2D71E   | If not, return
	INC sprite.state,x			;$B2D720   | Set dummy state
	LDA #$02E2				;$B2D722   |
	JSL set_sprite_animation		;$B2D725   | Set give prize animation
	LDA #$0010				;$B2D729   |
	TSB $0613				;$B2D72C  / Set some flag
.dummy:
	JMP CODE_B2E074				;$B2D72F  |> Return and process animation


brothers_bear_main:
	JMP (.state_table,x)			;$B2D732

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2D739
	INC sprite.state,x			;$B2D73A
	LDA sprite.general_purpose_5E,x		;$B2D73C
	ASL					;$B2D73E
	TAX					;$B2D73F
	LDY DATA_B2D7B1,x			;$B2D740
	BEQ ..CODE_B2D77B			;$B2D743
	CPX #$000A				;$B2D745
	BNE ..CODE_B2D756			;$B2D748
	JSL CODE_BB85B5				;$B2D74A
	LDA #$FFFF				;$B2D74E
	STA $06DA				;$B2D751
	BRA ..CODE_B2D77B			;$B2D754

..CODE_B2D756:
	CPX #$0018				;$B2D756
	BNE ..CODE_B2D770			;$B2D759
	JSL CODE_BB85B5				;$B2D75B
	LDA $0604				;$B2D75F
	AND #$00FF				;$B2D762
	LDY #$0354				;$B2D765
	CMP #$0005				;$B2D768
	BNE ..CODE_B2D770			;$B2D76B
	LDY #$0222				;$B2D76D
..CODE_B2D770:
	JSL CODE_BB8585				;$B2D770
	LDA alternate_sprite			;$B2D774
	LDY current_sprite			;$B2D776
	STA.w sprite.general_purpose_4C,y	;$B2D778
..CODE_B2D77B:
	LDY current_sprite			;$B2D77B
	JSR CODE_B2D7CB				;$B2D77D
.idle:
	LDA.w sprite.general_purpose_5E,y	;$B2D780
	CMP #$0005				;$B2D783
	BNE ..return				;$B2D786
	LDA.w sprite.general_purpose_6A,y	;$B2D788
	BIT #$4000				;$B2D78B
	BEQ ..return				;$B2D78E
	EOR #$4000				;$B2D790
	STA.w sprite.general_purpose_6A,y	;$B2D793
	LDX sprite.general_purpose_68,y		;$B2D796
	LDA #$0023				;$B2D798
	STA sprite.general_purpose_5E,x		;$B2D79B
	LDA #$0330				;$B2D79D
	JSL set_sprite_animation		;$B2D7A0
	LDA #$1000				;$B2D7A4
	TSB $061F				;$B2D7A7
..return:
	JSL process_anim_preserve_state		;$B2D7AA
	JML [$04F5]				;$B2D7AE

DATA_B2D7B1:
	dw $0000
	dw $0000
	dw $025E
	dw $0000
	dw $0248
	dw $0254
	dw $0000
	dw $0000
	dw $0000
	dw $0236
	dw $024A
	dw $0000
	dw $0352


CODE_B2D7CB:
	LDA #$000C				;$B2D7CB
	JSL CODE_BB859A				;$B2D7CE
	STA $2E					;$B2D7D2
	LDX #$0000				;$B2D7D4
	LDA #$0000				;$B2D7D7
	STA $84					;$B2D7DA
	LDA #$0001				;$B2D7DC
	STA $40					;$B2D7DF
.CODE_B2D7E1:
	PHX					;$B2D7E1
	LDA.w sprite.general_purpose_6A,y	;$B2D7E2
	BIT $40					;$B2D7E5
	BEQ .CODE_B2D81D			;$B2D7E7
	LDY #$0270				;$B2D7E9
	JSL CODE_BB85B8				;$B2D7EC
	LDX alternate_sprite			;$B2D7F0
	LDY current_sprite			;$B2D7F2
	LDA sprite.sprite_graphic,x		;$B2D7F4
	CLC					;$B2D7F6
	ADC $84					;$B2D7F7
	STA sprite.sprite_graphic,x		;$B2D7F9
	LDA.w sprite.x_position,y		;$B2D7FB
	STA sprite.x_position,x			;$B2D7FE
	LDA $40					;$B2D800
	STA sprite.general_purpose_5C,x		;$B2D802
	BIT #$0028				;$B2D804
	BEQ .CODE_B2D812			;$B2D807
	LDA sprite.oam_property,x		;$B2D809
	AND #$F1FF				;$B2D80B
	ORA $2E					;$B2D80E
	STA sprite.oam_property,x		;$B2D810
.CODE_B2D812:
	LDA $01,S				;$B2D812
	JSR CODE_B2D82F				;$B2D814
	STA sprite.y_position,x			;$B2D817
	LDA $20					;$B2D819
	STA sprite.x_position,x			;$B2D81B
.CODE_B2D81D:
	ASL $40					;$B2D81D
	LDA $84					;$B2D81F
	CLC					;$B2D821
	ADC #$0005				;$B2D822
	STA $84					;$B2D825
	PLX					;$B2D827
	INX					;$B2D828
	CPX #$0008				;$B2D829
	BCC .CODE_B2D7E1			;$B2D82C
	RTS					;$B2D82E

CODE_B2D82F:
	STA $1A					;$B2D82F
	LDA.w sprite.general_purpose_5E,y	;$B2D831
	STA $22					;$B2D834
	ASL					;$B2D836
	TAY					;$B2D837
	LDA DATA_B2D861,y			;$B2D838
	AND #$00FF				;$B2D83B
	BNE .CODE_B2D843			;$B2D83E
	LDA #$0120				;$B2D840
.CODE_B2D843:
	STA $20					;$B2D843
	LDA $22					;$B2D845
	BNE .CODE_B2D858			;$B2D847
	LDA $1A					;$B2D849
	CMP #$0003				;$B2D84B
	BNE .CODE_B2D858			;$B2D84E
	LDA $20					;$B2D850
	CLC					;$B2D852
	ADC #$0010				;$B2D853
	STA $20					;$B2D856
.CODE_B2D858:
	LDA DATA_B2D861+$01,y			;$B2D858
	AND #$00FF				;$B2D85B
	LDY current_sprite			;$B2D85E
	RTS					;$B2D860

DATA_B2D861:
	db $AD,$7E,$80,$70,$A5,$6C,$58,$7A
	db $78,$90,$84,$78,$2E,$74,$2E,$72
	db $AC,$7C,$80,$70,$2E,$72,$5E,$72
	db $80,$70,$00,$A0


brothers_bear_accessories_main:
	JMP (.state_table,x)			;$B2D87D  |>

.state_table:
	dw .init
	dw .idle

.init:
	JSR CODE_B2F881				;$B2D884  \
	LDA sprite.oam_property,x		;$B2D887   |
	EOR.w sprite.oam_property,y		;$B2D889   |
	AND #$4000				;$B2D88C   |
	EOR.w sprite.oam_property,y		;$B2D88F   |
	STA.w sprite.oam_property,y		;$B2D892   |
	TYX					;$B2D895   |
	INC sprite.state,x			;$B2D896  /
.idle:
	LDX sprite.general_purpose_5C,y		;$B2D898  \
	LDA sprite.sprite_graphic,x		;$B2D89A   |
	CLC					;$B2D89C   |
	ADC.w sprite.general_purpose_5E,y	;$B2D89D   |
	STA.w sprite.sprite_graphic,y		;$B2D8A0   |
	JML [$04F5]				;$B2D8A3  /


unknown_sprite_032C_main:
	JMP (.state_table,x)			;$B2D8A6  |>

.state_table:
	dw .init
	dw .dummy
	dw .state_2

.init:
	TYX					;$B2D8AF  \
	INC sprite.state,x			;$B2D8B0   |
	LDA sprite.sprite_graphic,x		;$B2D8B2   |
	STA sprite.general_purpose_60,x	;$B2D8B4   |
	LDA #$0040				;$B2D8B6   |
	STA sprite.general_purpose_62,x		;$B2D8B9   |
	JSR CODE_B2F881				;$B2D8BB   |
	LDA sprite.oam_property,x		;$B2D8BE   |
	EOR.w sprite.oam_property,y		;$B2D8C0   |
	AND #$4000				;$B2D8C3   |
	EOR.w sprite.oam_property,y		;$B2D8C6   |
	STA.w sprite.oam_property,y		;$B2D8C9  /
.dummy:
	JML [$04F5]				;$B2D8CC  |>

.state_2:
	TYX					;$B2D8CF  \
	LDA sprite.general_purpose_60,x		;$B2D8D0   |
	CLC					;$B2D8D2   |
	ADC sprite.general_purpose_5E,x		;$B2D8D3   |
	STA sprite.sprite_graphic,x		;$B2D8D5   |
	LDA sprite.general_purpose_5E,x		;$B2D8D7   |
	CLC					;$B2D8D9   |
	ADC #$0005				;$B2D8DA   |
	CMP #$0019				;$B2D8DD   |
	BNE ..CODE_B2D8E5			;$B2D8E0   |
	LDA #$0000				;$B2D8E2  /
..CODE_B2D8E5:
	STA sprite.general_purpose_5E,x		;$B2D8E5  \
	DEC sprite.general_purpose_62,x		;$B2D8E7   |
	BNE ..return				;$B2D8E9   |
	LDA sprite.general_purpose_60,x		;$B2D8EB   |
	STA sprite.sprite_graphic,x		;$B2D8ED   |
	DEC sprite.state,x			;$B2D8EF  /
..return:
	JML [$04F5]				;$B2D8F1  |>


main_map_waterfall_main:
	JMP (.state_table,x)			;$B2D8F4  |>

.state_table:
	dw .init
	dw .idle

.init:
	LDA.w sprite.sprite_graphic,y		;$B2D8FB  \ Get sprite graphic
	STA.w sprite.general_purpose_5C,y	;$B2D8FE   | Store a mirror of it
	TYX					;$B2D901   | Transfer sprite to X
	INC sprite.state,x			;$B2D902   | Set idle state
	STX $1C5D				;$B2D904  / Store index of waterfall sprite
.idle:
	JML [$04F5]				;$B2D907  |> Return

funky_rentals_particles_main:
	JMP (.state_table,x)			;$B2D90A  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2D911  \
	INC sprite.state,x			;$B2D912   |
	JSL CODE_808018				;$B2D914   | Get RNG?
	AND #$03FF				;$B2D918   |
	EOR #$FFFF				;$B2D91B   |
	INC					;$B2D91E   |
	CLC					;$B2D91F   |
	ADC sprite.y_speed,x			;$B2D920   |
	STA sprite.y_speed,x			;$B2D922   |
	STA sprite.max_y_speed,x		;$B2D924   |
	JSL CODE_808018				;$B2D926   | Get RNG?
	AND #$03FF				;$B2D92A   |
	EOR #$FFFF				;$B2D92D   |
	INC					;$B2D930   |
	CLC					;$B2D931   |
	ADC sprite.x_speed,x			;$B2D932   |
	STA sprite.x_speed,x			;$B2D934   |
	STA sprite.max_x_speed,x		;$B2D936  /
.idle:
	JSL process_current_movement		;$B2D938  \
	JSL process_anim_preserve_state		;$B2D93C   |
	JML [$04F5]				;$B2D940  /


chairlift_pulley_main:
	JMP (.state_table,x)			;$B2D943  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2D94A  \
	INC sprite.state,x			;$B2D94B   |
	LDA $1C5F				;$B2D94D   |
	CMP #$0009				;$B2D950   |
	BEQ .CODE_B2D962			;$B2D953   |
	LDA #$1000				;$B2D955   |
	BIT $0629				;$B2D958   |
	BEQ .idle				;$B2D95B   |
	LDA #$0100				;$B2D95D   |
	STA sprite.animation_speed,x		;$B2D960  /
.CODE_B2D962:
	LDA #$0564				;$B2D962  \
	JSL queue_sound_effect			;$B2D965   |
	LDA #$066E				;$B2D969   |
	JSL queue_sound_effect			;$B2D96C  /
.idle:
	TYX					;$B2D970  \
	JSR .CODE_B2D9BA			;$B2D971   |
	LDA #$1000				;$B2D974   |
	BIT $0629				;$B2D977   |
	BNE ..CODE_B2D9A7			;$B2D97A   |
	LDA #$2000				;$B2D97C   |
	BIT $0629				;$B2D97F   |
	BEQ ..CODE_B2D9A7			;$B2D982   |
	INC sprite.animation_speed,x		;$B2D984   |
	LDA sprite.animation_speed,x		;$B2D986   |
	CMP #$0100				;$B2D988   |
	BCC ..CODE_B2D9A7			;$B2D98B   |
	LDA #$2000				;$B2D98D   |
	TRB $0629				;$B2D990   |
	LDA #$1000				;$B2D993   |
	TSB $0629				;$B2D996   |
	LDA #$0564				;$B2D999   |
	JSL queue_sound_effect			;$B2D99C   |
	LDA #$066E				;$B2D9A0   |
	JSL queue_sound_effect			;$B2D9A3  /
..CODE_B2D9A7:
	LDA sprite.animation_timer,x		;$B2D9A7  \
	LSR					;$B2D9A9   |
	SEC					;$B2D9AA   |
	SBC sprite.animation_speed,x		;$B2D9AB   |
	BEQ ..CODE_B2D9B1			;$B2D9AD   |
	BPL ..CODE_B2D9B3			;$B2D9AF  /
..CODE_B2D9B1:
	INC sprite.general_purpose_5C,x		;$B2D9B1  |>
..CODE_B2D9B3:
	JSL process_anim_preserve_state		;$B2D9B3  \
	JML [$04F5]				;$B2D9B7  /

.CODE_B2D9BA:
	LDA sprite.general_purpose_5C,x		;$B2D9BA  \
	AND #$0003				;$B2D9BC   |
	CLC					;$B2D9BF   |
	ADC #$8692				;$B2D9C0   |
	XBA					;$B2D9C3   |
	STA sprite.unknown_58,x			;$B2D9C4   |
	LDA sprite.general_purpose_5C,x		;$B2D9C6   |
	AND #$0004				;$B2D9C8   |
	LSR					;$B2D9CB   |
	LSR					;$B2D9CC   |
	ADC #$0008				;$B2D9CD   |
	XBA					;$B2D9D0   |
	ORA #$0013				;$B2D9D1   |
	STA sprite.general_purpose_68,x		;$B2D9D4   |
	LDA sprite.general_purpose_5C,x		;$B2D9D6   |
	EOR #$FFFF				;$B2D9D8   |
	INC					;$B2D9DB   |
	STA $1A					;$B2D9DC   |
	AND #$0003				;$B2D9DE   |
	CLC					;$B2D9E1   |
	ADC #$8692				;$B2D9E2   |
	XBA					;$B2D9E5   |
	SEC					;$B2D9E6   |
	SBC #$000F				;$B2D9E7   |
	STA sprite.general_purpose_6A,x		;$B2D9EA   |
	LDA $1A					;$B2D9EC   |
	AND #$0004				;$B2D9EE   |
	LSR					;$B2D9F1   |
	LSR					;$B2D9F2   |
	ADC #$0008				;$B2D9F3   |
	XBA					;$B2D9F6   |
	ORA #$0013				;$B2D9F7   |
	STA sprite.general_purpose_6C,x		;$B2D9FA   |
	RTS					;$B2D9FC  /


brash_cabin_digital_display_main:
	JMP (.state_table,x)			;$B2D9FD

.state_table:
	dw .init
	dw .state_1

.init:
	TYX					;$B2DA04
	INC sprite.state,x			;$B2DA05
	LDA #$00CC				;$B2DA07
	JSL CODE_BB859A				;$B2DA0A
	ORA #$2000				;$B2DA0E
	STA.w sprite.general_purpose_5C,y	;$B2DA11
	STZ active_frame_counter		;$B2DA14
	JSR .CODE_B2DAF7			;$B2DA16
	LDA $0649				;$B2DA19
	BIT #$0004				;$B2DA1C
	BEQ .state_1				;$B2DA1F
	LDX #$0000				;$B2DA21
.CODE_B2DA24:
	LDA.l DATA_B2DB1D,x			;$B2DA24
	STA $7EA8E9,x				;$B2DA28
	INX					;$B2DA2C
	INX					;$B2DA2D
	CPX #$0020				;$B2DA2E
	BCC .CODE_B2DA24			;$B2DA31
	LDA #$0001				;$B2DA33
	ORA #$0A00				;$B2DA36
	STA $7EA8EF				;$B2DA39
	SEP #$20				;$B2DA3D
	LDA #$05				;$B2DA3F
	STA $7EA8F2				;$B2DA41
	LDA #$01				;$B2DA45
	STA $7EA8F1				;$B2DA47
	REP #$20				;$B2DA4B
	LDA $0631				;$B2DA4D
	AND #$000F				;$B2DA50
	ORA #$0A00				;$B2DA53
	STA $7EA902				;$B2DA56
	SEP #$20				;$B2DA5A
	LDA $0630				;$B2DA5C
	LSR					;$B2DA5F
	LSR					;$B2DA60
	LSR					;$B2DA61
	LSR					;$B2DA62
	AND #$0F				;$B2DA63
	STA $7EA904				;$B2DA65
	LDA $0630				;$B2DA69
	AND #$0F				;$B2DA6C
	STA $7EA905				;$B2DA6E
	LDA $062F				;$B2DA72
	AND #$0F				;$B2DA75
	STA $7EA907				;$B2DA77
	REP #$20				;$B2DA7B
.state_1:
	LDA.w sprite.general_purpose_5C,y	;$B2DA7D
	CLC					;$B2DA80
	ADC #$0020				;$B2DA81
	STA $1A					;$B2DA84
	LDA active_frame_counter		;$B2DA86
	AND #$01F8				;$B2DA88
	LSR					;$B2DA8B
	LSR					;$B2DA8C
	LSR					;$B2DA8D
	STA $1E					;$B2DA8E
	LDA active_frame_counter		;$B2DA90
	AND #$0007				;$B2DA92
	EOR #$FFFF				;$B2DA95
	INC					;$B2DA98
	CLC					;$B2DA99
	ADC #$A820				;$B2DA9A
	XBA					;$B2DA9D
	SEP #$20				;$B2DA9E
	SEC					;$B2DAA0
	SBC $1973				;$B2DAA1
	XBA					;$B2DAA4
	REP #$20				;$B2DAA5
	STA $1C					;$B2DAA7
	LDX #$0000				;$B2DAA9
	LDY next_oam_slot			;$B2DAAC
..CODE_B2DAAE:
	PHX					;$B2DAAE
	TXA					;$B2DAAF
	CLC					;$B2DAB0
	ADC $1E					;$B2DAB1
	TAX					;$B2DAB3
	LDA $7EA8DE,x				;$B2DAB4
	AND #$00FF				;$B2DAB8
	ORA $1A					;$B2DABB
	STA $0002,y				;$B2DABD
	LDA $1C					;$B2DAC0
	STA $0000,y				;$B2DAC2
	LDA $1C					;$B2DAC5
	CLC					;$B2DAC7
	ADC #$0008				;$B2DAC8
	STA $1C					;$B2DACB
	INY					;$B2DACD
	INY					;$B2DACE
	INY					;$B2DACF
	INY					;$B2DAD0
	PLX					;$B2DAD1
	INX					;$B2DAD2
	CPX #$0006				;$B2DAD3
	BNE ..CODE_B2DAAE			;$B2DAD6
	STY next_oam_slot			;$B2DAD8
	LDA active_frame_counter		;$B2DADA
	BIT #$0003				;$B2DADC
	BNE ..return				;$B2DADF
	LDA active_frame_counter		;$B2DAE1
	AND #$000C				;$B2DAE3
	ASL					;$B2DAE6
	TAY					;$B2DAE7
	LDX #$7EA90B				;$B2DAE8
	JSR .CODE_B2DB06			;$B2DAEB
	LDX #$7EA914				;$B2DAEE
	JSR .CODE_B2DB06			;$B2DAF1
..return:
	JML [$04F5]				;$B2DAF4

.CODE_B2DAF7:
	LDX #$0044				;$B2DAF7
..CODE_B2DAFA:
	LDA #$0B0B				;$B2DAFA
	STA $7EA8DE,x				;$B2DAFD
	DEX					;$B2DB01
	DEX					;$B2DB02
	BPL ..CODE_B2DAFA			;$B2DB03
	RTS					;$B2DB05

.CODE_B2DB06:
	PHY					;$B2DB06
	LDA #$0004				;$B2DB07
	STA $1A					;$B2DB0A
..CODE_B2DB0C:
	LDA DATA_B2DB3D,y			;$B2DB0C
	STA $7E0000,x				;$B2DB0F
	INY					;$B2DB13
	INY					;$B2DB14
	INX					;$B2DB15
	INX					;$B2DB16
	DEC $1A					;$B2DB17
	BNE ..CODE_B2DB0C			;$B2DB19
	PLY					;$B2DB1B
	RTS					;$B2DB1C

DATA_B2DB1D:
	db $0D,$0E,$0F,$10,$11,$0B,$00,$0A
	db $00,$00,$0C,$00,$0B,$0B,$0B,$0B
	db $0B,$0B,$0B,$12,$13,$14,$15,$10
	db $0B,$00,$0A,$00,$00,$0C,$00,$0B

DATA_B2DB3D:
	db $1C,$1C,$0B,$0B,$1C,$0B,$16,$17
	db $1D,$1D,$0B,$0B,$1D,$0B,$18,$19
	db $1E,$1E,$0B,$0B,$1E,$0B,$1A,$1B
	db $1D,$1D,$0B,$0B,$1D,$0B,$18,$19


barnacles_bird_cage_main:
	JMP (.state_table,x)			;$B2DB5D

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2DB64  \ Get Cage sprite
	INC sprite.state,x			;$B2DB65   | Set idle state
	LDY #$0350				;$B2DB67   |
	JSL CODE_BB8585				;$B2DB6A   | Spawn left side of the cage (?)
	LDY current_sprite			;$B2DB6E   |
	LDA $061D				;$B2DB70   | Check some flag
	BIT #$0004				;$B2DB73   |
	BNE .idle				;$B2DB76   | If set, don't spawn Banana Bird
	STZ $1560				;$B2DB78   | Else
	STZ $155E				;$B2DB7B   |
	LDY #$012E				;$B2DB7E   |
	JSL CODE_BB85B8				;$B2DB81   | Spawn Banana Bird
	LDX alternate_sprite			;$B2DB85   | Get Banana Bird sprite
	LDY current_sprite			;$B2DB87   | Get Cage sprite
	STX sprite.general_purpose_5C,y		;$B2DB89   | Store index of Banana Bird in Cage
	STZ sprite.render_order,x		;$B2DB8B   | Make it render behind cage
	LDA sprite.oam_property,x		;$B2DB8D   |
	EOR #$4000				;$B2DB8F   | H flip it
	STA sprite.oam_property,x		;$B2DB92   |
	LDA.w sprite.x_position,y		;$B2DB94   |
	STA sprite.x_position,x			;$B2DB97   | Move Banana Bird to Cage X position
	LDA.w sprite.y_position,y		;$B2DB99   |
	SEC					;$B2DB9C   |
	SBC #$0016				;$B2DB9D   | Offset Y position
	STA sprite.y_position,x			;$B2DBA0  /
.idle:
	TYX					;$B2DBA2  \ Get cage sprite
	LDY sprite.general_purpose_5C,x		;$B2DBA3   | Get index of Banana Bird
	BEQ ..return				;$B2DBA5   | If it doesn't exist, return
	LDA #$0004				;$B2DBA7   |
	BIT $061D				;$B2DBAA   | Else check some flags
	BEQ ..return				;$B2DBAD   | If off, return
	LDA #$0007				;$B2DBAF   |
	STA.w sprite.state,y			;$B2DBB2   | Else set Banana Bird state 7
	STZ sprite.general_purpose_5C,x		;$B2DBB5  / Clear index of Banana Bird
..return:
	JML [$04F5]				;$B2DBB7  |> Return


brambles_vase_main:
	JMP (.state_table,x)			;$B2DBBA  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2DBC1  \
	INC sprite.state,x			;$B2DBC2   |
	LDY #$0270				;$B2DBC4   |
	JSL CODE_BB85B8				;$B2DBC7   |
	LDX alternate_sprite			;$B2DBCB   |
	LDA sprite.sprite_graphic,x		;$B2DBCD   |
	CLC					;$B2DBCF   |
	ADC #$001E				;$B2DBD0   |
	STA sprite.sprite_graphic,x		;$B2DBD3   |
	LDA #$0054				;$B2DBD5   |
	STA sprite.x_position,x			;$B2DBD8   |
	LDA #$0038				;$B2DBDA   |
	STA sprite.y_position,x			;$B2DBDD   |
	LDA #$0000				;$B2DBDF   |
	STA sprite.render_order,x		;$B2DBE2  /
.idle:
	LDX #$00A4				;$B2DBE4  \
	LDA #$0088				;$B2DBE7   |
	LDY current_sprite			;$B2DBEA   |
	JSL CODE_B78018				;$B2DBEC   |
	JML [$04F5]				;$B2DBF0  /


razor_ridge_pipe_main:
unknown_sprite_00AC_main:
	JMP.w (DATA_B2DBF6,x)			;$B2DBF3

DATA_B2DBF6:
	dw CODE_B2DC1E
	dw CODE_B2DBFA

CODE_B2DBFA:
	LDA.b active_frame_counter		;$B2DBFA
	BIT.w #$0001				;$B2DBFC
	BNE.b CODE_B2DC1A			;$B2DBFF
	TYX					;$B2DC01
	LDA.b $5C,x				;$B2DC02
	BEQ.b CODE_B2DC21			;$B2DC04
	SEP.b #$20				;$B2DC06
	CMP.b #$30				;$B2DC08
	BCS.b CODE_B2DC14			;$B2DC0A
	CMP.b #$10				;$B2DC0C
	BCS.b CODE_B2DC16			;$B2DC0E
	INC.b $59,x				;$B2DC10
	BRA.b CODE_B2DC16			;$B2DC12

CODE_B2DC14:
	DEC.b $59,x				;$B2DC14
CODE_B2DC16:
	REP.b #$20				;$B2DC16
	DEC.b $5C,x				;$B2DC18
CODE_B2DC1A:
	JSL.l process_sprite_animation		;$B2DC1A
stationary_display_sprite_2_main:
CODE_B2DC1E:
	JML [$04F5]				;$B2DC1E

CODE_B2DC21:
	JSL.l delete_sprite_handle_deallocation	;$B2DC21
	BRA.b CODE_B2DC1E			;$B2DC25


unknown_sprite_00B0_main:
	JMP.w (DATA_B2DC2A,x)			;$B2DC27

DATA_B2DC2A:
	dw CODE_B2DC2E
	dw CODE_B2E9AC

CODE_B2DC2E:
	LDA.w $0024,y				;$B2DC2E
	STA.w $005C,y				;$B2DC31
	CLC					;$B2DC34
	ADC.w #$0005				;$B2DC35
	STA.w $0024,y				;$B2DC38
	LDX.w #$00A1				;$B2DC3B
	LDA.w #$0080				;$B2DC3E
	JSL.l CODE_B78018			;$B2DC41
	LDY.b current_sprite			;$B2DC45
	LDX.w active_kong_sprite		;$B2DC47
	LDA.b $38,x				;$B2DC4A
	CMP.w #$0002				;$B2DC4C
	BCS.b CODE_B2DC85			;$B2DC4F
	LDA.w map_node_number			;$B2DC51
	CMP.w #$0003				;$B2DC54
	BCS.b CODE_B2DC85			;$B2DC57
	LDA.w $005C,y				;$B2DC59
	CLC					;$B2DC5C
	ADC.w #$000A				;$B2DC5D
	STA.w $0024,y				;$B2DC60
	LDX.w #$00A1				;$B2DC63
	LDA.w #$0080				;$B2DC66
	JSL.l CODE_B78018			;$B2DC69
	LDY.b current_sprite			;$B2DC6D
	LDA.w $005C,y				;$B2DC6F
	CLC					;$B2DC72
	ADC.w #$000F				;$B2DC73
	STA.w $0024,y				;$B2DC76
	LDX.w #$00A1				;$B2DC79
	LDA.w #$0080				;$B2DC7C
	JSL.l CODE_B78018			;$B2DC7F
	LDY.b current_sprite			;$B2DC83
CODE_B2DC85:
	LDA.w $005C,y				;$B2DC85
	STA.w $0024,y				;$B2DC88
	JML [$04F5]				;$B2DC8B


banana_bird_cave_kong_main:
	JMP.w (DATA_B2DC91,x)			;$B2DC8E

DATA_B2DC91:
	dw CODE_B2DC9D
	dw CODE_B2DCBD
	dw CODE_B2DD16
	dw CODE_B2DD3C
	dw CODE_B2DD16
	dw CODE_B2DD94

CODE_B2DC9D:
	LDA.w #$0012				;$B2DC9D
	JSL.l process_alternate_movement	;$B2DCA0
	BCC.b CODE_B2DCB3			;$B2DCA4
	TYX					;$B2DCA6
	INC.b $38,x				;$B2DCA7
	LDA.w #$0195				;$B2DCA9
	CLC					;$B2DCAC
	ADC.b $5C,x				;$B2DCAD
	JSL.l set_sprite_animation		;$B2DCAF
CODE_B2DCB3:
	JSL.l process_current_movement		;$B2DCB3
	JSR.w CODE_B2DD30			;$B2DCB7
CODE_B2DCBA:
	JMP.w CODE_B2E074			;$B2DCBA

CODE_B2DCBD:
	TYX					;$B2DCBD
	DEC.b $60,x				;$B2DCBE
	BPL.b CODE_B2DCBA			;$B2DCC0
	LDX.w $1C5F				;$B2DCC2
	LDA.w $0632,x				;$B2DCC5
	BIT.w #$0002				;$B2DCC8
	BNE.b CODE_B2DCE5			;$B2DCCB
	LDA.w #$0040				;$B2DCCD
	TSB.w $1C71				;$B2DCD0
	BNE.b CODE_B2DCDC			;$B2DCD3
	LDY.w #$027E				;$B2DCD5
	JSL.l CODE_BB85B5			;$B2DCD8
CODE_B2DCDC:
	LDX.b current_sprite			;$B2DCDC
	INC.b $38,x				;$B2DCDE
	INC.b $38,x				;$B2DCE0
	JMP.w CODE_B2E074			;$B2DCE2

CODE_B2DCE5:
	LDA.w #$0004				;$B2DCE5
	TRB.w $053B				;$B2DCE8
	TYX					;$B2DCEB
	LDA.w #$0198				;$B2DCEC
	CLC					;$B2DCEF
	ADC.b $5C,x				;$B2DCF0
	JSL.l set_sprite_animation		;$B2DCF2
	LDA.b $1E,x				;$B2DCF6
	EOR.w #$4000				;$B2DCF8
	STA.b $1E,x				;$B2DCFB
CODE_B2DCFD:
	LDA.w #$FFE0				;$B2DCFD
	STA.b $5E,x				;$B2DD00
	LDA.w #$FE00				;$B2DD02
	STA.b $2A,x				;$B2DD05
	STA.b $30,x				;$B2DD07
	LDA.w #$00F0				;$B2DD09
	STA.b $2E,x				;$B2DD0C
	LDA.w #$0002				;$B2DD0E
	STA.b $38,x				;$B2DD11
	JMP.w CODE_B2DCB3			;$B2DD13

CODE_B2DD16:
	LDA.w #$0012				;$B2DD16
	JSL.l process_alternate_movement	;$B2DD19
	BCC.b CODE_B2DD2D			;$B2DD1D
	LDA.w screen_brightness			;$B2DD1F
	AND.w #$FF00				;$B2DD22
	BNE.b CODE_B2DD2D			;$B2DD25
	LDA.w #$820F				;$B2DD27
	STA.w screen_brightness			;$B2DD2A
CODE_B2DD2D:
	JMP.w CODE_B2DCB3			;$B2DD2D

CODE_B2DD30:
	LDA.w #$00E4				;$B2DD30
	CMP.w $0016,y				;$B2DD33
	BCC.b CODE_B2DD3B			;$B2DD36
	STA.w $0016,y				;$B2DD38
CODE_B2DD3B:
	RTS					;$B2DD3B

CODE_B2DD3C:
	LDA.w $1C71				;$B2DD3C
	BIT.w #$0030				;$B2DD3F
	BEQ.b CODE_B2DD77			;$B2DD42
	BIT.w #$0020				;$B2DD44
	BNE.b CODE_B2DCE5			;$B2DD47
	LDA.w #$0005				;$B2DD49
	STA.w $0038,y				;$B2DD4C
	LDA.w #$0120				;$B2DD4F
	STA.w $0060,y				;$B2DD52
	LDA.w #$0040				;$B2DD55
	TRB.w $1C71				;$B2DD58
	BEQ.b CODE_B2DD77			;$B2DD5B
	LDX.w $1C5F				;$B2DD5D
	BEQ.b CODE_B2DD7E			;$B2DD60
	INC.w $05CD				;$B2DD62
CODE_B2DD65:
	LDA.w $0632,x				;$B2DD65
	ORA.w #$0002				;$B2DD68
	STA.w $0632,x				;$B2DD6B
	LDA.w #$0800				;$B2DD6E
	TSB.w $1C71				;$B2DD71
	JML [$04F5]				;$B2DD74

CODE_B2DD77:
	JSL.l process_sprite_animation		;$B2DD77
	JML [$04F5]				;$B2DD7B

CODE_B2DD7E:
	LDA.w #$0004				;$B2DD7E
	TRB.w $053B				;$B2DD81
	LDA.w $0632,x				;$B2DD84
	BIT.w #$0002				;$B2DD87
	BNE.b CODE_B2DD65			;$B2DD8A
	LDA.w #$0028				;$B2DD8C
	TSB.w $053B				;$B2DD8F
	BRA.b CODE_B2DD65			;$B2DD92

CODE_B2DD94:
	TYX					;$B2DD94
	DEC.b $60,x				;$B2DD95
	LDA.b $60,x				;$B2DD97
	CMP.w #$00E0				;$B2DD99
	BEQ.b CODE_B2DDD4			;$B2DD9C
	CPX.w follower_kong_sprite		;$B2DD9E
	BEQ.b CODE_B2DDAD			;$B2DDA1
	CMP.w #$00A0				;$B2DDA3
	BEQ.b CODE_B2DDCB			;$B2DDA6
	CMP.w #$00B0				;$B2DDA8
	BPL.b CODE_B2DDBF			;$B2DDAB
CODE_B2DDAD:
	CMP.w #$0000				;$B2DDAD
	BPL.b CODE_B2DDC8			;$B2DDB0
	LDA.w #$01CD				;$B2DDB2
	CLC					;$B2DDB5
	ADC.b $5C,x				;$B2DDB6
	JSL.l set_sprite_animation		;$B2DDB8
	JMP.w CODE_B2DCFD			;$B2DDBC

CODE_B2DDBF:
	LDA.w $1C8B				;$B2DDBF
	AND.w #$000F				;$B2DDC2
	STA.w $1C8B				;$B2DDC5
CODE_B2DDC8:
	JMP.w CODE_B2E074			;$B2DDC8

CODE_B2DDCB:
	LDA.w #$0001				;$B2DDCB
	JSL.l CODE_B2800F			;$B2DDCE
	BRA.b CODE_B2DDC8			;$B2DDD2

CODE_B2DDD4:
	LDA.w #$0192				;$B2DDD4
	CLC					;$B2DDD7
	ADC.w $005C,y				;$B2DDD8
	JSL.l set_sprite_animation		;$B2DDDB
	CPX.w follower_kong_sprite		;$B2DDDF
	BEQ.b CODE_B2DDC8			;$B2DDE2
	LDA.w #$0020				;$B2DDE4
	BIT.w $053B				;$B2DDE7
	BNE.b CODE_B2DDF3			;$B2DDEA
	LDY.w #$0186				;$B2DDEC
	JSL.l CODE_BB85B8			;$B2DDEF
CODE_B2DDF3:
	LDA.w #$1000				;$B2DDF3
	TSB.w $05FB				;$B2DDF6
	LDA.w #$0020				;$B2DDF9
	TRB.w $053B				;$B2DDFC
	BEQ.b CODE_B2DE33			;$B2DDFF
	LDA.w #$000F				;$B2DE01
	JSL.l CODE_BB859A			;$B2DE04
	AND.w #$0E00				;$B2DE08
	ORA.w #$01A0				;$B2DE0B
	STA.w $18F7				;$B2DE0E
	STA.b $B6				;$B2DE11
	STZ.b level_number			;$B2DE13
	LDY.w #$02A0				;$B2DE15
	JSL.l CODE_BB8585			;$B2DE18
	LDX.b alternate_sprite			;$B2DE1C
	STX.w $18DF				;$B2DE1E
	STZ.b $38,x				;$B2DE21
	STZ.b $62,x				;$B2DE23
	LDY.w $05FF				;$B2DE25
	LDA.w DATA_B2DE3D,y			;$B2DE28
	AND.w #$00FF				;$B2DE2B
	STA.w $05CB				;$B2DE2E
	STA.b $64,x				;$B2DE31
CODE_B2DE33:
	SEP.b #$20				;$B2DE33
	STZ.w PPU.sub_screen			;$B2DE35
	REP.b #$20				;$B2DE38
	JML [$04F5]				;$B2DE3A

DATA_B2DE3D:
	db $55,$46,$37,$28,$19,$00


banana_bird_crystal_main:
	LDA #$1000				;$B2DE43  \
	TRB $05FB				;$B2DE46   |
	BEQ .return				;$B2DE49   |
	LDY #$02A8				;$B2DE4B   |
	JSL CODE_BB85B8				;$B2DE4E   |
	LDY #$02AA				;$B2DE52   |
	JSL CODE_BB85B8				;$B2DE55   |
	LDY #$02AC				;$B2DE59   |
	JSL CODE_BB85B8				;$B2DE5C   |
	LDY #$02AE				;$B2DE60   |
	JSL CODE_BB85B8				;$B2DE63   |
	LDY #$02B2				;$B2DE67   |
	JSL CODE_BB85B8				;$B2DE6A   |
	LDY #$02B4				;$B2DE6E   |
	JSL CODE_BB85B8				;$B2DE71   |
	LDY #$02B6				;$B2DE75   |
	JSL CODE_BB85B8				;$B2DE78   |
	LDY #$02B8				;$B2DE7C   |
	JSL CODE_BB85B8				;$B2DE7F   |
	LDA #$0667				;$B2DE83   |
	JSL queue_sound_effect			;$B2DE86   |
	LDA #$0768				;$B2DE8A   |
	JSL queue_sound_effect			;$B2DE8D   |
	JSL delete_sprite_handle_deallocation	;$B2DE91  /
.return:
	JML [$04F5]				;$B2DE95  |>


banana_bird_cave_crystal_main:
	TYX					;$B2DE98
	LDA.b $5C,x				;$B2DE99
	TRB.w $1C71				;$B2DE9B
	BEQ.b CODE_B2DEC3			;$B2DE9E
	LDA.b $64,x				;$B2DEA0
	JSL.l CODE_BB85A0			;$B2DEA2
	LDY.b $60,x				;$B2DEA6
	LDA.w $1C71				;$B2DEA8
	BIT.w #$0020				;$B2DEAB
	BEQ.b CODE_B2DEB3			;$B2DEAE
	LDY.w #$0766				;$B2DEB0
CODE_B2DEB3:
	TYA					;$B2DEB3
	JSL.l queue_sound_effect		;$B2DEB4
	LDA.w #$0020				;$B2DEB8
	STA.b $5E,x				;$B2DEBB
	LDA.w #$8000				;$B2DEBD
	TRB.w $1C71				;$B2DEC0
CODE_B2DEC3:
	LDA.b $5C,x				;$B2DEC3
	XBA					;$B2DEC5
	BIT.w $1C71				;$B2DEC6
	BNE.b CODE_B2DEE2			;$B2DEC9
	LDA.b $5E,x				;$B2DECB
	BEQ.b CODE_B2DEDF			;$B2DECD
	DEC.b $5E,x				;$B2DECF
	BNE.b CODE_B2DEDF			;$B2DED1
	LDA.b $62,x				;$B2DED3
	JSL.l CODE_BB85A0			;$B2DED5
	LDA.w #$8000				;$B2DED9
	TSB.w $1C71				;$B2DEDC
CODE_B2DEDF:
	JML [$04F5]				;$B2DEDF

CODE_B2DEE2:
	JSR.w CODE_B2DF08			;$B2DEE2
	BCC.b CODE_B2DEDF			;$B2DEE5
	LDA.w $1C71				;$B2DEE7
	AND.w #$0F00				;$B2DEEA
	LSR					;$B2DEED
	EOR.w $1C71				;$B2DEEE
	AND.w #$0F00				;$B2DEF1
	EOR.w $1C71				;$B2DEF4
	STA.w $1C71				;$B2DEF7
	LDA.w #$060E				;$B2DEFA
	JSL.l queue_sound_effect		;$B2DEFD
	JSL.l delete_sprite_handle_deallocation	;$B2DF01
	JML [$04F5]				;$B2DF05

CODE_B2DF08:
	JSR.w CODE_B2DF5D			;$B2DF08
	JSR.w CODE_B2DF82			;$B2DF0B
	LDA.w #$2F80				;$B2DF0E
	STA.b $1A				;$B2DF11
	LDY.b current_sprite			;$B2DF13
	LDA.w #$0010				;$B2DF15
	SEC					;$B2DF18
	SBC.w $0066,y				;$B2DF19
	AND.w #$003F				;$B2DF1C
	LDX.w #$0000				;$B2DF1F
	LDY.w #$001E				;$B2DF22
	JSL.l CODE_BBC80F			;$B2DF25
	LDY.b current_sprite			;$B2DF29
	LDA.b $E8				;$B2DF2B
	ASL					;$B2DF2D
	ASL					;$B2DF2E
	TAX					;$B2DF2F
	LDA.w #$7E2F80				;$B2DF30
	STA.w $06FC,x				;$B2DF33
	LDA.w $001E,y				;$B2DF36
	AND.w #$0E00				;$B2DF39
	ASL					;$B2DF3C
	ASL					;$B2DF3D
	ASL					;$B2DF3E
	CLC					;$B2DF3F
	ADC.w #$8100				;$B2DF40
	SEP.b #$20				;$B2DF43
	LDA.b #$7E2F80>>16			;$B2DF45
	REP.b #$20				;$B2DF47
	STA.w $06FE,x				;$B2DF49
	LDA.b $E8				;$B2DF4C
	INC					;$B2DF4E
	AND.w #$000F				;$B2DF4F
	STA.b $E8				;$B2DF52
	CLC					;$B2DF54
	LDX.b current_sprite			;$B2DF55
	DEC.b $66,x				;$B2DF57
	BPL.b CODE_B2DF5C			;$B2DF59
	SEC					;$B2DF5B
CODE_B2DF5C:
	RTS					;$B2DF5C

CODE_B2DF5D:
	LDA.b $1F,x				;$B2DF5D
	AND.w #$000E				;$B2DF5F
	TAX					;$B2DF62
	LDA.w $073C,x				;$B2DF63
	ASL					;$B2DF66
	TAX					;$B2DF67
	LDA.l sprite_palette_table,x		;$B2DF68
	DEC					;$B2DF6C
	DEC					;$B2DF6D
	STA.b $46				;$B2DF6E
	LDA.w #dixie_sprite_palettes>>16	;$B2DF70
	STA.b $48				;$B2DF73
	LDA.w #$3180				;$B2DF75
	STA.b $42				;$B2DF78
	LDA.w #$007E				;$B2DF7A
	STA.b $44				;$B2DF7D
	STA.b $1C				;$B2DF7F
	RTS					;$B2DF81

CODE_B2DF82:
	LDY.w #$001E				;$B2DF82
CODE_B2DF85:
	LDA.b [$46],y				;$B2DF85
	STA.b [$42],y				;$B2DF87
	DEY					;$B2DF89
	DEY					;$B2DF8A
	BNE.b CODE_B2DF85			;$B2DF8B
	TYA					;$B2DF8D
	STA.b [$42],y				;$B2DF8E
	RTS					;$B2DF90


banana_bird_cave_controller_main:
	JMP.w (DATA_B2DF94,x)			;$B2DF91

DATA_B2DF94:
	dw CODE_B2DF9A
	dw CODE_B2DFE4
	dw CODE_B2E00C

CODE_B2DF9A:
	LDX.w $05CD				;$B2DF9A
	LDA.w $1C5F				;$B2DF9D
	BNE.b CODE_B2DFA5			;$B2DFA0
	LDX.w #$000F				;$B2DFA2
CODE_B2DFA5:
	LDA.w DATA_B2DFD4,x			;$B2DFA5
	AND.w #$00FF				;$B2DFA8
	STA.w $005C,y				;$B2DFAB
	STA.w $0062,y				;$B2DFAE
	TAX					;$B2DFB1
CODE_B2DFB2:
	JSL.l CODE_808018			;$B2DFB2
	SEP.b #$30				;$B2DFB6
	AND.b #$03				;$B2DFB8
	TAY					;$B2DFBA
	LDA.w DATA_B2DFD0,y			;$B2DFBB
	STA.l $7EA8DE,x				;$B2DFBE
	REP.b #$30				;$B2DFC2
	DEX					;$B2DFC4
	BPL.b CODE_B2DFB2			;$B2DFC5
	LDX.b current_sprite			;$B2DFC7
	INC.b $38,x				;$B2DFC9
	STZ.b $5E,x				;$B2DFCB
	JML [$04F5]				;$B2DFCD

DATA_B2DFD0:
	db $01,$02,$04,$08

DATA_B2DFD4:
	db $03,$04,$04,$04,$05,$05,$05,$06
	db $06,$06,$06,$07,$07,$07,$08,$05

CODE_B2DFE4:
	TYX					;$B2DFE4
	LDA.b $5E,x				;$B2DFE5
	BEQ.b CODE_B2DFED			;$B2DFE7
	DEC.b $5E,x				;$B2DFE9
	BRA.b CODE_B2E009			;$B2DFEB

CODE_B2DFED:
	LDX.b $5C,y				;$B2DFED
	LDA.l $7EA8DE,x				;$B2DFEF
	AND.w #$00FF				;$B2DFF3
	TSB.w $1C71				;$B2DFF6
	TYX					;$B2DFF9
	LDA.w #$0030				;$B2DFFA
	STA.b $5E,x				;$B2DFFD
	DEC.b $5C,x				;$B2DFFF
	BPL.b CODE_B2E009			;$B2E001
	INC.b $38,x				;$B2E003
	LDA.b $62,x				;$B2E005
	STA.b $5C,x				;$B2E007
CODE_B2E009:
	JML [$04F5]				;$B2E009

CODE_B2E00C:
	BIT.w $1C71				;$B2E00C
	BPL.b CODE_B2E02A			;$B2E00F
	JSR.w CODE_B2E03E			;$B2E011
	CMP.w #$0000				;$B2E014
	BEQ.b CODE_B2E02A			;$B2E017
	STA.b $1A				;$B2E019
	LDX.b $5C,y				;$B2E01B
	LDA.l $7EA8DE,x				;$B2E01D
	BIT.b $1A				;$B2E021
	BEQ.b CODE_B2E02D			;$B2E023
	TYX					;$B2E025
	DEC.b $5C,x				;$B2E026
	BMI.b CODE_B2E032			;$B2E028
CODE_B2E02A:
	JML [$04F5]				;$B2E02A

CODE_B2E02D:
	LDA.w #$0020				;$B2E02D
	BRA.b CODE_B2E035			;$B2E030

CODE_B2E032:
	LDA.w #$0050				;$B2E032
CODE_B2E035:
	TSB.w $1C71				;$B2E035
	JSL.l delete_sprite_handle_deallocation	;$B2E038
	BRA.b CODE_B2E02A			;$B2E03C

CODE_B2E03E:
	LDA.w player_active_pressed		;$B2E03E
	AND.w #$C0C0				;$B2E041
	BIT.w #$0040				;$B2E044
	BEQ.b CODE_B2E050			;$B2E047
	LDA.w #$0004				;$B2E049
	TSB.w $1C71				;$B2E04C
	RTS					;$B2E04F

CODE_B2E050:
	BIT.w #$0080				;$B2E050
	BEQ.b CODE_B2E05C			;$B2E053
	LDA.w #$0001				;$B2E055
	TSB.w $1C71				;$B2E058
	RTS					;$B2E05B

CODE_B2E05C:
	BIT.w #$8000				;$B2E05C
	BEQ.b CODE_B2E068			;$B2E05F
	LDA.w #$0008				;$B2E061
	TSB.w $1C71				;$B2E064
	RTS					;$B2E067

CODE_B2E068:
	BIT.w #$4000				;$B2E068
	BEQ.b CODE_B2E073			;$B2E06B
	LDA.w #$0002				;$B2E06D
	TSB.w $1C71				;$B2E070
CODE_B2E073:
	RTS					;$B2E073

CODE_B2E074:
	JSL.l process_sprite_animation		;$B2E074
	JML [$04F5]				;$B2E078


inventory_item_squares_main:
	JMP.w (DATA_B2E07E,x)			;$B2E07B

DATA_B2E07E:
	dw CODE_B2E08C
	dw CODE_B2E0F0
	dw CODE_B2E100
	dw CODE_B2E1E2
	dw CODE_B2E353
	dw CODE_B2E36C
	dw CODE_B2E382

CODE_B2E08C:
	LDA.w $005E,y				;$B2E08C
	XBA					;$B2E08F
	AND.w #$00FF				;$B2E090
	STA.w $005E,y				;$B2E093
	LDA.w $001E,y				;$B2E096
	STA.w $004C,y				;$B2E099
	AND.w #$01FF				;$B2E09C
	STA.w $001E,y				;$B2E09F
	LDA.w #$0004				;$B2E0A2
	JSL.l CODE_BB859A			;$B2E0A5
	CLC					;$B2E0A9
	ADC.w $001E,y				;$B2E0AA
	ORA.w #$3000				;$B2E0AD
	STA.w $004E,y				;$B2E0B0
	LDA.w #$FFFF				;$B2E0B3
	STA.w $0024,y				;$B2E0B6
	STA.w $0022,y				;$B2E0B9
	LDA.w $0038,y				;$B2E0BC
	XBA					;$B2E0BF
	STA.w $0038,y				;$B2E0C0
	CMP.w #$0002				;$B2E0C3
	BNE.b CODE_B2E0F0			;$B2E0C6
	LDA.w #$00D0				;$B2E0C8
	JSL.l CODE_BB859A			;$B2E0CB
	CLC					;$B2E0CF
	ADC.w $001E,y				;$B2E0D0
	ORA.w #$3000				;$B2E0D3
	STA.w $0050,y				;$B2E0D6
	LDA.w #$00D1				;$B2E0D9
	JSL.l CODE_BB859A			;$B2E0DC
	CLC					;$B2E0E0
	ADC.w $001E,y				;$B2E0E1
	ORA.w #$3000				;$B2E0E4
	STA.w $0052,y				;$B2E0E7
	TYX					;$B2E0EA
	INC.b $38,x				;$B2E0EB
	JML [$04F5]				;$B2E0ED

CODE_B2E0F0:
	TYX					;$B2E0F0
	LDA.b $16,x				;$B2E0F1
	INC					;$B2E0F3
	CMP.w #$0009				;$B2E0F4
	BMI.b CODE_B2E0FB			;$B2E0F7
	INC.b $38,x				;$B2E0F9
CODE_B2E0FB:
	STA.b $16,x				;$B2E0FB
	JML [$04F5]				;$B2E0FD

CODE_B2E100:
	TYX					;$B2E100
	LDA.b $60,x				;$B2E101
	BEQ.b CODE_B2E10A			;$B2E103
	STZ.b $60,x				;$B2E105
	TSB.w $1D35				;$B2E107
CODE_B2E10A:
	LDA.b $5C,x				;$B2E10A
	BEQ.b CODE_B2E124			;$B2E10C
	TRB.w $0605				;$B2E10E
	AND.w #$DFFF				;$B2E111
	BEQ.b CODE_B2E124			;$B2E114
	TSB.w $0607				;$B2E116
	JSR.w CODE_B2E127			;$B2E119
	LDA.w $005C,y				;$B2E11C
	STA.b $5C,x				;$B2E11F
	JSR.w CODE_B2E1B9			;$B2E121
CODE_B2E124:
	JML [$04F5]				;$B2E124

CODE_B2E127:
	LDA.w #$000C				;$B2E127
	JSL.l CODE_BB859A			;$B2E12A
	STA.b $2E				;$B2E12E
	LDY.w #$0270				;$B2E130
	JSL.l CODE_BB85B8			;$B2E133
	LDY.b alternate_sprite			;$B2E137
	LDX.b current_sprite			;$B2E139
	LDA.b $12,x				;$B2E13B
	STA.w $0012,y				;$B2E13D
	LDA.w #$0006				;$B2E140
	STA.w $0038,y				;$B2E143
	LDA.w #$0014				;$B2E146
	STA.w $005A,y				;$B2E149
	JSR.w CODE_B2E19E			;$B2E14C
	LDX.b current_sprite			;$B2E14F
	LDA.b $5C,x				;$B2E151
	STA.b $1A				;$B2E153
	BIT.w #$0002				;$B2E155
	BNE.b CODE_B2E194			;$B2E158
	LDA.w #$FFFF				;$B2E15A
	STA.b $1C				;$B2E15D
	LDA.w #$FFFB				;$B2E15F
CODE_B2E162:
	CLC					;$B2E162
	ADC.w #$0005				;$B2E163
	INC.b $1C				;$B2E166
	LSR.b $1A				;$B2E168
	BCC.b CODE_B2E162			;$B2E16A
CODE_B2E16C:
	CLC					;$B2E16C
	ADC.w $0024,y				;$B2E16D
	STA.w $0024,y				;$B2E170
	LDA.b $5C,x				;$B2E173
	BIT.w #$0028				;$B2E175
	BEQ.b CODE_B2E185			;$B2E178
	LDA.w $001E,y				;$B2E17A
	AND.w #$F1FF				;$B2E17D
	ORA.b $2E				;$B2E180
	STA.w $001E,y				;$B2E182
CODE_B2E185:
	LDA.b $1C				;$B2E185
	TYX					;$B2E187
	LDY.b current_sprite			;$B2E188
	JSR.w CODE_B2D82F			;$B2E18A
	STA.b $64,x				;$B2E18D
	LDA.b $20				;$B2E18F
	STA.b $62,x				;$B2E191
	RTS					;$B2E193

CODE_B2E194:
	LDA.w #$0001				;$B2E194
	STA.b $1C				;$B2E197
	LDA.w #$002D				;$B2E199
	BRA.b CODE_B2E16C			;$B2E19C

CODE_B2E19E:
	LDA.b $5C,x				;$B2E19E
	LDX.w #$FFFE				;$B2E1A0
CODE_B2E1A3:
	INX					;$B2E1A3
	INX					;$B2E1A4
	BIT.w $0609,x				;$B2E1A5
	BEQ.b CODE_B2E1A3			;$B2E1A8
	JSR.w CODE_B2E3D0			;$B2E1AA
	LDY.b alternate_sprite			;$B2E1AD
	STA.w $0012,y				;$B2E1AF
	LDA.w #$0011				;$B2E1B2
	STA.w $0016,y				;$B2E1B5
	RTS					;$B2E1B8

CODE_B2E1B9:
	STZ.b $1A				;$B2E1B9
	LDX.w #$0008				;$B2E1BB
CODE_B2E1BE:
	DEX					;$B2E1BE
	DEX					;$B2E1BF
	BMI.b CODE_B2E1E1			;$B2E1C0
	BIT.w $0609,x				;$B2E1C2
	BEQ.b CODE_B2E1BE			;$B2E1C5
	EOR.w $0609,x				;$B2E1C7
	STA.b $1A				;$B2E1CA
CODE_B2E1CC:
	CPX.w #$0006				;$B2E1CC
	BEQ.b CODE_B2E1DB			;$B2E1CF
	LDA.w $060B,x				;$B2E1D1
	STA.w $0609,x				;$B2E1D4
	INX					;$B2E1D7
	INX					;$B2E1D8
	BRA.b CODE_B2E1CC			;$B2E1D9

CODE_B2E1DB:
	STZ.w $0609,x				;$B2E1DB
	TYX					;$B2E1DE
	STZ.b $5C,x				;$B2E1DF
CODE_B2E1E1:
	RTS					;$B2E1E1

CODE_B2E1E2:
	TYX					;$B2E1E2
	STZ.b $24,x				;$B2E1E3
	LDX.b next_oam_slot			;$B2E1E5
	LDA.w #$0000				;$B2E1E7
	STA.b $1A				;$B2E1EA
	STZ.b $20				;$B2E1EC
	STZ.b $26				;$B2E1EE
	LDA.w $006A,y				;$B2E1F0
	STA.b $24				;$B2E1F3
	STA.w $15EC				;$B2E1F5
	LDA.w #$02C8				;$B2E1F8
	STA.b $2A				;$B2E1FB
	LDA.w #$00A4				;$B2E1FD
	STA.b $1E				;$B2E200
	LDA.w $0068,y				;$B2E202
	BIT.w #$2002				;$B2E205
	BEQ.b CODE_B2E20D			;$B2E208
	ORA.w #$0002				;$B2E20A
CODE_B2E20D:
	STA.b $1C				;$B2E20D
	STZ.b $3E				;$B2E20F
CODE_B2E211:
	LDA.b $3E				;$B2E211
	STA.b $32				;$B2E213
	LDA.b $1A				;$B2E215
	STA.b $30				;$B2E217
	STZ.b $28				;$B2E219
	LDY.b current_sprite			;$B2E21B
	LSR.b $1C				;$B2E21D
	PHP					;$B2E21F
	LSR.b $24				;$B2E220
	TDC					;$B2E222
	ADC.w #$0000				;$B2E223
	STA.b $28				;$B2E226
	BNE.b CODE_B2E23F			;$B2E228
	PLP					;$B2E22A
	BCS.b CODE_B2E239			;$B2E22B
	LDA.w #$0022				;$B2E22D
	STA.b $1A				;$B2E230
	LDA.w #$0003				;$B2E232
	STA.b $3E				;$B2E235
	BRA.b CODE_B2E240			;$B2E237

CODE_B2E239:
	LDA.b $2A				;$B2E239
	JSR.w CODE_B2E26E			;$B2E23B
	PHP					;$B2E23E
CODE_B2E23F:
	PLP					;$B2E23F
CODE_B2E240:
	JSR.w CODE_B2E2AA			;$B2E240
	LDA.b $1E				;$B2E243
	SEC					;$B2E245
	SBC.w #$0018				;$B2E246
	AND.w #$00FF				;$B2E249
	STA.b $1E				;$B2E24C
	LDA.b $32				;$B2E24E
	STA.b $3E				;$B2E250
	LDA.b $30				;$B2E252
	STA.b $1A				;$B2E254
	INC.b $1A				;$B2E256
	INC.b $1A				;$B2E258
	LDA.b $2A				;$B2E25A
	CLC					;$B2E25C
	ADC.w #$0006				;$B2E25D
	STA.b $2A				;$B2E260
	INC.b $3E				;$B2E262
	LDA.b $3E				;$B2E264
	CMP.w #$0008				;$B2E266
	BCC.b CODE_B2E211			;$B2E269
	JML [$04F5]				;$B2E26B

CODE_B2E26E:
	PHX					;$B2E26E
	PHA					;$B2E26F
	TAX					;$B2E270
	LDA.w #$1C78				;$B2E271
	STA.l $7F0000,x				;$B2E274
	LDA.w #$1C79				;$B2E278
	STA.l $7F0002,x				;$B2E27B
	STA.l $7F0004,x				;$B2E27F
	LDA.w #$1C78				;$B2E283
	STA.l $7F0040,x				;$B2E286
	LDA.w #$1C79				;$B2E28A
	STA.l $7F0042,x				;$B2E28D
	STA.l $7F0044,x				;$B2E291
	LDA.w #$1C78				;$B2E295
	STA.l $7F0080,x				;$B2E298
	LDA.w #$1C79				;$B2E29C
	STA.l $7F0082,x				;$B2E29F
	STA.l $7F0084,x				;$B2E2A3
	PLA					;$B2E2A7
	PLX					;$B2E2A8
	RTS					;$B2E2A9

CODE_B2E2AA:
	LDA.b $1E				;$B2E2AA
	SEP.b #$20				;$B2E2AC
	EOR.b #$FF				;$B2E2AE
	INC					;$B2E2B0
	CLC					;$B2E2B1
	ADC.w $0012,y				;$B2E2B2
	SEC					;$B2E2B5
	SBC.w $196D				;$B2E2B6
	XBA					;$B2E2B9
	ORA.w $0016,y				;$B2E2BA
	SEC					;$B2E2BD
	SBC.w $1973				;$B2E2BE
	XBA					;$B2E2C1
	REP.b #$20				;$B2E2C2
	STA.b $00,x				;$B2E2C4
	JSR.w CODE_B2E2D5			;$B2E2C6
	STA.b $02,x				;$B2E2C9
	JSR.w CODE_B2E329			;$B2E2CB
	INX					;$B2E2CE
	INX					;$B2E2CF
	INX					;$B2E2D0
	INX					;$B2E2D1
	STX.b next_oam_slot			;$B2E2D2
	RTS					;$B2E2D4

CODE_B2E2D5:
	PHX					;$B2E2D5
	LDA.b $28				;$B2E2D6
	ASL					;$B2E2D8
	ASL					;$B2E2D9
	ASL					;$B2E2DA
	CLC					;$B2E2DB
	ADC.b $3E				;$B2E2DC
	TAX					;$B2E2DE
	LDA.w DATA_B2E319,x			;$B2E2DF
	AND.w #$00FF				;$B2E2E2
	STA.b $28				;$B2E2E5
	TYA					;$B2E2E7
	CLC					;$B2E2E8
	ADC.b $28				;$B2E2E9
	TAY					;$B2E2EB
	LDA.b $1A				;$B2E2EC
	CLC					;$B2E2EE
	ADC.w $004C,y				;$B2E2EF
	TAY					;$B2E2F2
	SEP.b #$20				;$B2E2F3
	CMP.b #$82				;$B2E2F5
	REP.b #$20				;$B2E2F7
	BNE.b CODE_B2E316			;$B2E2F9
	LDX.b current_sprite			;$B2E2FB
	LDA.b $68,x				;$B2E2FD
	EOR.w #$2002				;$B2E2FF
	AND.w #$2002				;$B2E302
	BEQ.b CODE_B2E30E			;$B2E305
	LDA.b $6A,x				;$B2E307
	AND.w #$0002				;$B2E309
	BEQ.b CODE_B2E316			;$B2E30C
CODE_B2E30E:
	TYA					;$B2E30E
	SEP.b #$20				;$B2E30F
	LDA.b #$A0				;$B2E311
	REP.b #$20				;$B2E313
	TAY					;$B2E315
CODE_B2E316:
	TYA					;$B2E316
	PLX					;$B2E317
	RTS					;$B2E318

DATA_B2E319:
	db $00,$00,$00,$02,$00,$02,$00,$00
	db $04,$04,$04,$06,$04,$06,$04,$04

CODE_B2E329:
	PHX					;$B2E329
	TXA					;$B2E32A
	AND.w #$000C				;$B2E32B
	TAY					;$B2E32E
	TXA					;$B2E32F
	LSR					;$B2E330
	LSR					;$B2E331
	LSR					;$B2E332
	LSR					;$B2E333
	AND.w #$001F				;$B2E334
	TAX					;$B2E337
	LDA.w DATA_B2E343,y			;$B2E338
	ORA.w oam_attribute_table,x		;$B2E33B
	STA.w oam_attribute_table,x		;$B2E33E
	PLX					;$B2E341
	RTS					;$B2E342

DATA_B2E343:
	dw $0002
	dw $0000
	dw $0008
	dw $0000
	dw $0020
	dw $0000
	dw $0080
	dw $0000

CODE_B2E353:
	TYX					;$B2E353
	LDA.b $5C,x				;$B2E354
	TRB.w $1D35				;$B2E356
	BEQ.b CODE_B2E37F			;$B2E359
	INC.b $38,x				;$B2E35B
	LDA.w #$0014				;$B2E35D
	STA.b $5A,x				;$B2E360
	JSR.w CODE_B2E3C6			;$B2E362
	LDX.b current_sprite			;$B2E365
	STA.b $62,x				;$B2E367
	JML [$04F5]				;$B2E369

CODE_B2E36C:
	JSR.w CODE_B2E3B3			;$B2E36C
	JSL.l process_current_movement		;$B2E36F
	BCC.b CODE_B2E37F			;$B2E373
	LDA.b $5C,x				;$B2E375
	JSL.l CODE_B4801E			;$B2E377
CODE_B2E37B:
	JSL.l delete_sprite_handle_deallocation	;$B2E37B
CODE_B2E37F:
	JML [$04F5]				;$B2E37F

CODE_B2E382:
	JSR.w CODE_B2E3B3			;$B2E382
	JSL.l process_current_movement		;$B2E385
	BCC.b CODE_B2E37F			;$B2E389
	LDA.w #$0611				;$B2E38B
	CMP.b $B8				;$B2E38E
	BEQ.b CODE_B2E398			;$B2E390
	LDA.b ($B8)				;$B2E392
	ORA.b $5C,x				;$B2E394
	STA.b ($B8)				;$B2E396
CODE_B2E398:
	STZ.b $5A,x				;$B2E398
	LDA.b $5C,x				;$B2E39A
	BIT.w #$0001				;$B2E39C
	BNE.b CODE_B2E37B			;$B2E39F
	BIT.w #$0010				;$B2E3A1
	BNE.b CODE_B2E37B			;$B2E3A4
	BIT.w #$0080				;$B2E3A6
	BNE.b CODE_B2E37B			;$B2E3A9
	BIT.w #$0020				;$B2E3AB
	BNE.b CODE_B2E37B			;$B2E3AE
	JML [$04F5]				;$B2E3B0

CODE_B2E3B3:
	LDA.w $002E,y				;$B2E3B3
	BPL.b CODE_B2E3BF			;$B2E3B6
	LDA.w #$00FD				;$B2E3B8
	STA.w $000E,y				;$B2E3BB
	RTS					;$B2E3BE

CODE_B2E3BF:
	LDA.w #$00FF				;$B2E3BF
	STA.w $000E,y				;$B2E3C2
	RTS					;$B2E3C5

CODE_B2E3C6:
	LDX.w #$FFFE				;$B2E3C6
CODE_B2E3C9:
	INX					;$B2E3C9
	INX					;$B2E3CA
	LDA.w $0609,x				;$B2E3CB
	BNE.b CODE_B2E3C9			;$B2E3CE
CODE_B2E3D0:
	TXA					;$B2E3D0
	LSR					;$B2E3D1
	TAY					;$B2E3D2
	LDA.w DATA_B2E3E1,y			;$B2E3D3
	JSR.w CODE_B2E3E5			;$B2E3D6
	LDY.w $18E7				;$B2E3D9
	CLC					;$B2E3DC
	ADC.w $0012,y				;$B2E3DD
	RTS					;$B2E3E0

DATA_B2E3E1:
	dw $CEBA, $F6E2

CODE_B2E3E5:
	BIT.w #$0080				;$B2E3E5
	BEQ.b CODE_B2E3EE			;$B2E3E8
	ORA.w #$FF00				;$B2E3EA
	RTS					;$B2E3ED

CODE_B2E3EE:
	AND.w #$00FF				;$B2E3EE
	RTS					;$B2E3F1

CODE_B2E3F2:
	STA.b $3E				;$B2E3F2
	LDA.w $0012,y				;$B2E3F4
	SEC					;$B2E3F7
	SBC.b $3E				;$B2E3F8
	CMP.b $12,x				;$B2E3FA
	BCS.b CODE_B2E418			;$B2E3FC
	ADC.b $3E				;$B2E3FE
	ADC.b $3E				;$B2E400
	CMP.b $12,x				;$B2E402
	BCC.b CODE_B2E418			;$B2E404
	LDA.w $0016,y				;$B2E406
	SBC.b $3E				;$B2E409
	CMP.b $16,x				;$B2E40B
	BCS.b CODE_B2E418			;$B2E40D
	ADC.b $3E				;$B2E40F
	ADC.b $3E				;$B2E411
	CMP.b $16,x				;$B2E413
	BCC.b CODE_B2E418			;$B2E415
	RTS					;$B2E417

CODE_B2E418:
	CLC					;$B2E418
	RTS					;$B2E419


unknown_sprite_01B8_main:
	JMP.w (DATA_B2E41D,x)			;$B2E41A

DATA_B2E41D:
	dw CODE_B2E421
	dw CODE_B2E434

CODE_B2E421:
	LDX.b $5E,y				;$B2E421
	LDA.w $0632,x				;$B2E423
	BIT.w #$0001				;$B2E426
	BEQ.b CODE_B2E431			;$B2E429
	JSR.w CODE_B2E53B			;$B2E42B
	JML [$04F5]				;$B2E42E

CODE_B2E431:
	TYX					;$B2E431
	INC.b $38,x				;$B2E432
CODE_B2E434:
	TYX					;$B2E434
	LDY.b $5C,x				;$B2E435
	LDA.b [$6A],y				;$B2E437
	BMI.b CODE_B2E46A			;$B2E439
	STA.b $12,x				;$B2E43B
	INY					;$B2E43D
	INY					;$B2E43E
	LDA.b [$6A],y				;$B2E43F
	STA.b $16,x				;$B2E441
	LDY.w active_kong_sprite		;$B2E443
	LDA.w #$0008				;$B2E446
	JSR.w CODE_B2E3F2			;$B2E449
	BCC.b CODE_B2E45D			;$B2E44C
	LDA.b $5C,x				;$B2E44E
	CLC					;$B2E450
	ADC.w #$0004				;$B2E451
	STA.b $5C,x				;$B2E454
	LDA.b $62,x				;$B2E456
	STA.b $60,x				;$B2E458
	JML [$04F5]				;$B2E45A

CODE_B2E45D:
	LDA.b $5C,x				;$B2E45D
	BEQ.b CODE_B2E467			;$B2E45F
	DEC.b $60,x				;$B2E461
	BPL.b CODE_B2E467			;$B2E463
	STZ.b $5C,x				;$B2E465
CODE_B2E467:
	JML [$04F5]				;$B2E467

CODE_B2E46A:
	TXY					;$B2E46A
	LDX.b $5E,y				;$B2E46B
	LDA.w $0632,x				;$B2E46D
	BIT.w #$0001				;$B2E470
	BNE.b CODE_B2E48D			;$B2E473
	ORA.w #$0001				;$B2E475
	STA.w $0632,x				;$B2E478
	CPX.w #$0064				;$B2E47B
	BNE.b CODE_B2E486			;$B2E47E
	LDA.w #$8010				;$B2E480
	TSB.w $05FB				;$B2E483
CODE_B2E486:
	LDA.w #$071C				;$B2E486
	JSL.l queue_sound_effect		;$B2E489
CODE_B2E48D:
	JSL.l delete_sprite_handle_deallocation	;$B2E48D
	BRA.b CODE_B2E467			;$B2E491


unknown_sprite_01BC_main:
	JMP (DATA_B2E496,x)			;$B2E493

DATA_B2E496:
	dw CODE_B2E49A
	dw CODE_B2E4DC

CODE_B2E49A:
	LDA.w #$0040				;$B2E49A
	BIT.w $0605				;$B2E49D
	BNE.b CODE_B2E4FA			;$B2E4A0
	BIT.w $0619				;$B2E4A2
	BNE.b CODE_B2E4FA			;$B2E4A5
	LDA.w #$0002				;$B2E4A7
	BIT.w $0694				;$B2E4AA
	BEQ.b CODE_B2E4FA			;$B2E4AD
	LDA.w #$0004				;$B2E4AF
	BIT.w $061D				;$B2E4B2
	BEQ.b CODE_B2E4FA			;$B2E4B5
	LDA.w #$00CF				;$B2E4B7
	LDY.w current_game_mode			;$B2E4BA
	CPY.w #!gamemode_2_player_contest	;$B2E4BD
	BNE.b CODE_B2E4CA			;$B2E4C0
	LDY.w active_player			;$B2E4C2
	BEQ.b CODE_B2E4CA			;$B2E4C5
	LDA.w #$00D5				;$B2E4C7
CODE_B2E4CA:
	JSL.l CODE_BB859A			;$B2E4CA
	LDX.b current_sprite			;$B2E4CE
	INC.b $38,x				;$B2E4D0
	AND.w #$0E00				;$B2E4D2
	EOR.b $1E,x				;$B2E4D5
	STA.b $1E,x				;$B2E4D7
	JML [$04F5]				;$B2E4D9

CODE_B2E4DC:
	JSR.w CODE_B2E50E			;$B2E4DC
	LDX.w active_kong_sprite		;$B2E4DF
	LDA.w #$0008				;$B2E4E2
	JSR.w CODE_B2E3F2			;$B2E4E5
	BCC.b CODE_B2E4FD			;$B2E4E8
	LDA.w #$071A				;$B2E4EA
	JSL.l queue_sound_effect		;$B2E4ED
	LDA.w #$0040				;$B2E4F1
	TSB.w $0605				;$B2E4F4
	JSR.w CODE_B2E500			;$B2E4F7
CODE_B2E4FA:
	JSR.w CODE_B2E53B			;$B2E4FA
CODE_B2E4FD:
	JML [$04F5]				;$B2E4FD

CODE_B2E500:
	LDX.w #$0000				;$B2E500
CODE_B2E503:
	INX					;$B2E503
	INX					;$B2E504
	LDY.w $0607,x				;$B2E505
	BNE.b CODE_B2E503			;$B2E508
	STA.w $0607,x				;$B2E50A
	RTS					;$B2E50D

CODE_B2E50E:
	LDA.w $001E,y				;$B2E50E
	AND.w #$0E00				;$B2E511
	STA.b $24				;$B2E514
	LDX.b $12,y				;$B2E516
	LDA.w $0016,y				;$B2E518
	JSL.l CODE_B7801B			;$B2E51B
	BCS.b CODE_B2E53A			;$B2E51F
	LDA.w #$807C				;$B2E521
	JSL.l CODE_B78021			;$B2E524
	BCS.b CODE_B2E53A			;$B2E528
	STA.b $00,x				;$B2E52A
	LDA.b $24				;$B2E52C
	CLC					;$B2E52E
	ADC.w #$21E5				;$B2E52F
	STA.b $02,x				;$B2E532
	INX					;$B2E534
	INX					;$B2E535
	INX					;$B2E536
	INX					;$B2E537
	STX.b next_oam_slot			;$B2E538
CODE_B2E53A:
	RTS					;$B2E53A

CODE_B2E53B:
	JSL.l delete_sprite_handle_deallocation	;$B2E53B
	LDA.b current_sprite			;$B2E53F
	CLC					;$B2E541
	ADC.w #$006C				;$B2E542
	TAX					;$B2E545
	LDA.w #$0000				;$B2E546
CODE_B2E549:
	STA.b $00,x				;$B2E549
	DEX					;$B2E54B
	DEX					;$B2E54C
	CPX.b current_sprite			;$B2E54D
	BCS.b CODE_B2E549			;$B2E54F
	LDX.b current_sprite			;$B2E551
	STZ.b $00,x				;$B2E553
	RTS					;$B2E555


music_test_note_main:
	JMP (.state_table,x)			;$B2E556  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2E55D  \
	INC sprite.state,x			;$B2E55E   |
	LDA sprite.general_purpose_5C,x		;$B2E560   |
	AND #$000F				;$B2E562   |
	CMP #$0004				;$B2E565   |
	BCS ..CODE_B2E56E			;$B2E568   |
	SEC					;$B2E56A   |
	SBC #$0005				;$B2E56B  /
..CODE_B2E56E:
	ASL					;$B2E56E  \
	ASL					;$B2E56F   |
	ASL					;$B2E570   |
	ASL					;$B2E571   |
	CLC					;$B2E572   |
	ADC #$0070				;$B2E573   |
	STA sprite.x_position,x			;$B2E576   |
	JSL CODE_808018				;$B2E578   |
	AND #$003F				;$B2E57C   |
	CLC					;$B2E57F   |
	ADC #$0080				;$B2E580   |
	STA sprite.y_position,x			;$B2E583   |
	JSL CODE_808018				;$B2E585   |
	AND #$01FF				;$B2E589   |
	CLC					;$B2E58C   |
	ADC #$0200				;$B2E58D   |
	STA sprite.max_y_speed,x		;$B2E590   |
	BIT #$0001				;$B2E592   |
	BNE .idle				;$B2E595   |
	LDA sprite.sprite_graphic,x		;$B2E597   |
	CLC					;$B2E599   |
	ADC #$0005				;$B2E59A   |
	STA sprite.sprite_graphic,x		;$B2E59D   |
	STZ sprite.last_rendered_graphic,x	;$B2E59F  /
.idle:
	JSL process_current_movement		;$B2E5A1  \
	JML [$04F5]				;$B2E5A5  /


riverside_race_timer_main:
	JMP (.state_table,x)			;$B2E5A8  |>

.state_table:
	dw .init
	dw .idle
	dw .dummy

.init:
	TYX					;$B2E5B1  \
	STX $18E3				;$B2E5B2   |
	INC sprite.state,x			;$B2E5B5   |
	LDA #$0006				;$B2E5B7   |
	STA sprite.general_purpose_62,x		;$B2E5BA   |
	LDA #$0070				;$B2E5BC   |
	JSL CODE_BB859A				;$B2E5BF   |
	ORA #$3000				;$B2E5C3   |
	STA.w sprite.oam_property,y		;$B2E5C6  /
.idle:
	TYX					;$B2E5C9  \
	LDA $0533				;$B2E5CA   |
	CMP #$0002				;$B2E5CD   |
	BCS .dummy				;$B2E5D0   |
	LDA #$0100				;$B2E5D2   |
	BIT $05AF				;$B2E5D5   |
	BNE .dummy				;$B2E5D8   |
	JSR .update_timer			;$B2E5DA   |
	LDX active_kong_sprite			;$B2E5DD   |
	LDA sprite.x_position,x			;$B2E5E0   |
	CMP #$2751				;$B2E5E2   |
	BCC .dummy				;$B2E5E5   |
	LDA #$FFFF				;$B2E5E7   |
	STA $18E5				;$B2E5EA  /
.dummy:
	JML [$04F5]				;$B2E5ED  |>

.update_timer:
	LDA $0536				;$B2E5F0  \
	CMP #$0959				;$B2E5F3   |
	BCS ..return				;$B2E5F6   |
	LDA active_frame_counter		;$B2E5F8   |
	AND #$0007				;$B2E5FA   |
	STA sprite.general_purpose_64,x		;$B2E5FD   |
	DEC sprite.general_purpose_62,x		;$B2E5FF   |
	BNE ..return				;$B2E601   |
	LDA #$0006				;$B2E603   |
	STA sprite.general_purpose_62,x		;$B2E606   |
	LDA $0535				;$B2E608   |
	SEP #$28				;$B2E60B   |
	ADC #$01				;$B2E60D   |
	STA $0535				;$B2E60F   |
	CMP #$10				;$B2E612   |
	BMI ..CODE_B2E634			;$B2E614   |
	STZ $0535				;$B2E616   |
	LDA $0536				;$B2E619   |
	CLC					;$B2E61C   |
	ADC #$01				;$B2E61D   |
	STA $0536				;$B2E61F   |
	CMP #$60				;$B2E622   |
	BMI ..CODE_B2E634			;$B2E624   |
	STZ $0536				;$B2E626   |
	LDA $0537				;$B2E629   |
	CLC					;$B2E62C   |
	ADC #$01				;$B2E62D   |
	STA $0537				;$B2E62F   |
	CMP #$10				;$B2E632  /
..CODE_B2E634:
	CLD					;$B2E634  \
	REP #$20				;$B2E635  /
..return:
	RTS					;$B2E637  |>


map_flag_main:
	JMP.w (DATA_B2E63B,x)			;$B2E638

DATA_B2E63B:
	dw CODE_B2E641
	dw CODE_B2E65A
	dw CODE_B2E666

CODE_B2E641:
	LDA.w current_world			;$B2E641
	BNE.b CODE_B2E654			;$B2E644
	LDA.w current_map_vehicle		;$B2E646
	CMP.w #!vehicle_gyrocopter		;$B2E649
	BNE.b CODE_B2E654			;$B2E64C
	LDA.w #$0080				;$B2E64E
	STA.w $000E,y				;$B2E651
CODE_B2E654:
	JSR.w CODE_B2E695			;$B2E654
	JML [$04F5]				;$B2E657

CODE_B2E65A:
	JSR.w CODE_B2E6BD			;$B2E65A
	JSR.w CODE_B2E695			;$B2E65D
	JSR.w CODE_B2E6AC			;$B2E660
	JML [$04F5]				;$B2E663

CODE_B2E666:
	TYX					;$B2E666
	LDA.b $66,x				;$B2E667
	BEQ.b CODE_B2E68F			;$B2E669
	DEC.b $68,x				;$B2E66B
	BPL.b CODE_B2E68F			;$B2E66D
	LDA.b active_frame_counter		;$B2E66F
	BIT.w #$0007				;$B2E671
	BNE.b CODE_B2E68F			;$B2E674
	LDA.w #$8004				;$B2E676
	STA.b $26,x				;$B2E679
	DEC.b $16,x				;$B2E67B
	DEC.b $66,x				;$B2E67D
	BNE.b CODE_B2E68F			;$B2E67F
	LDA.b $5E,x				;$B2E681
	ORA.w #$3000				;$B2E683
	STA.b $5E,x				;$B2E686
	LDA.b $60,x				;$B2E688
	ORA.w #$3000				;$B2E68A
	STA.b $60,x				;$B2E68D
CODE_B2E68F:
	JSR.w CODE_B2E695			;$B2E68F
	JML [$04F5]				;$B2E692

CODE_B2E695:
	LDA.b active_frame_counter		;$B2E695
	BIT.w #$0007				;$B2E697
	BNE.b CODE_B2E6AB			;$B2E69A
	LDA.w $0024,y				;$B2E69C
	XBA					;$B2E69F
	INC					;$B2E6A0
	AND.w #$FF07				;$B2E6A1
	XBA					;$B2E6A4
	STA.w $0024,y				;$B2E6A5
	STA.w $0022,y				;$B2E6A8
CODE_B2E6AB:
	RTS					;$B2E6AB

CODE_B2E6AC:
	LDA.b active_frame_counter		;$B2E6AC
	BIT.w #$000F				;$B2E6AE
	BNE.b CODE_B2E6BC			;$B2E6B1
	LDA.w $005C,y				;$B2E6B3
	EOR.w #$0003				;$B2E6B6
	STA.w $005C,y				;$B2E6B9
CODE_B2E6BC:
	RTS					;$B2E6BC

CODE_B2E6BD:
	JSR.w CODE_B2E6EF			;$B2E6BD
	BCS.b CODE_B2E6CE			;$B2E6C0
	JSR.w CODE_B2E6CF			;$B2E6C2
	LDX.w follower_kong_sprite		;$B2E6C5
	JSR.w CODE_B2E6CF			;$B2E6C8
	JSR.w CODE_B2E702			;$B2E6CB
CODE_B2E6CE:
	RTS					;$B2E6CE

CODE_B2E6CF:
	LDA.w $0016,y				;$B2E6CF
	PHA					;$B2E6D2
	CLC					;$B2E6D3
	ADC.w #$0008				;$B2E6D4
	STA.w $0016,y				;$B2E6D7
	LDA.w #$0008				;$B2E6DA
	JSR.w CODE_B2E3F2			;$B2E6DD
	PLA					;$B2E6E0
	STA.w $0016,y				;$B2E6E1
	BCC.b CODE_B2E6EC			;$B2E6E4
	LDA.w #$0018				;$B2E6E6
	STA.b $4C,x				;$B2E6E9
	RTS					;$B2E6EB

CODE_B2E6EC:
	STZ.b $4C,x				;$B2E6EC
	RTS					;$B2E6EE

CODE_B2E6EF:
	LDX.w active_kong_sprite		;$B2E6EF
	LDA.b $12,x				;$B2E6F2
	SEC					;$B2E6F4
	SBC.w $0012,y				;$B2E6F5
	BPL.b CODE_B2E6FE			;$B2E6F8
	EOR.w #$FFFF				;$B2E6FA
	INC					;$B2E6FD
CODE_B2E6FE:
	CMP.w #$0010				;$B2E6FE
	RTS					;$B2E701

CODE_B2E702:
	LDA.w map_node_number			;$B2E702
	BNE.b CODE_B2E73F			;$B2E705
	LDX.w active_kong_sprite		;$B2E707
	LDA.w #$0008				;$B2E70A
	JSR.w CODE_B2E3F2			;$B2E70D
	BCC.b CODE_B2E742			;$B2E710
	LDA.w player_active_pressed		;$B2E712
	BIT.w #$9000				;$B2E715
	BEQ.b CODE_B2E72F			;$B2E718
	LDA.w $0062,y				;$B2E71A
	STA.w map_node_number			;$B2E71D
	LDA.w #$0100				;$B2E720
	TSB.w $1C35				;$B2E723
	BNE.b CODE_B2E73F			;$B2E726
	LDY.w #$0001				;$B2E728
	STY.w $1C39				;$B2E72B
	RTS					;$B2E72E

CODE_B2E72F:
	LDA.b $18,x				;$B2E72F
	BNE.b CODE_B2E73F			;$B2E731
	LDA.w $0064,y				;$B2E733
	STA.b $1A,x				;$B2E736
	LDA.w $0062,y				;$B2E738
	JSL.l CODE_B4801B			;$B2E73B
CODE_B2E73F:
	LDY.b current_sprite			;$B2E73F
	RTS					;$B2E741

CODE_B2E742:
	LDY.b $18,x				;$B2E742
	BEQ.b CODE_B2E73F			;$B2E744
	LDA.w #$0008				;$B2E746
	STA.w $006C,y				;$B2E749
	STZ.b $18,x				;$B2E74C
	BRA.b CODE_B2E73F			;$B2E74E

CODE_B2E750:
	JML [$04F5]				;$B2E750


wrinklys_save_cave_main:
	JMP (.state_table,x)			;$B2E753

.state_table:
	dw .init
	dw .idle

.init:
	LDA $001E,y				;$B2E75A  \
	AND #$01E0				;$B2E75D   |
	LSR					;$B2E760   |
	LSR					;$B2E761   |
	LSR					;$B2E762   |
	LSR					;$B2E763   |
	TAX					;$B2E764   |
	LDA #$0000				;$B2E765   |
	STA $06D8,x				;$B2E768   |
	STY $06F4				;$B2E76B   |
	LDA $001E,y				;$B2E76E   |
	AND #$FE1F				;$B2E771   |
	ORA #$01C0				;$B2E774   |
	STA $001E,y				;$B2E777   |
	TYX					;$B2E77A   |
	INC $38,x				;$B2E77B  /
.idle:
	JSL.l process_anim_preserve_state	;$B2E77D  \
	JML [$04F5]				;$B2E781  /


kremwood_forest_log_main:
	JMP.w (DATA_B2E787,x)			;$B2E784

DATA_B2E787:
	dw CODE_B2E78F
	dw CODE_B2E7B1
	dw CODE_B2E7BF
	dw CODE_B2E7EC

CODE_B2E78F:
	TYX					;$B2E78F
	INC.b $38,x				;$B2E790
	LDA.w #$0400				;$B2E792
	BIT.w $05FB				;$B2E795
	BEQ.b CODE_B2E7B1			;$B2E798
	LDA.b $24,x				;$B2E79A
	CLC					;$B2E79C
	ADC.w #$0019				;$B2E79D
	STA.b $24,x				;$B2E7A0
	LDA.w #$0069				;$B2E7A2
	STA.b $12,x				;$B2E7A5
	LDA.w #$0065				;$B2E7A7
	STA.b $16,x				;$B2E7AA
	STZ.b $0E,x				;$B2E7AC
	JML [$04F5]				;$B2E7AE

CODE_B2E7B1:
	LDA.w #$1000				;$B2E7B1
	TRB.w $05FB				;$B2E7B4
	BEQ.b CODE_B2E7BC			;$B2E7B7
	TYX					;$B2E7B9
	INC.b $38,x				;$B2E7BA
CODE_B2E7BC:
	JML [$04F5]				;$B2E7BC

CODE_B2E7BF:
	LDA.b active_frame_counter		;$B2E7BF
	BIT.w #$001F				;$B2E7C1
	BNE.b CODE_B2E7E9			;$B2E7C4
	LDA.w #$0673				;$B2E7C6
	JSL.l queue_sound_effect		;$B2E7C9
	LDA.w #$000F				;$B2E7CD
	STA.w $1C8B				;$B2E7D0
	TYX					;$B2E7D3
	INC.b $12,x				;$B2E7D4
	DEC.b $6C,x				;$B2E7D6
	BNE.b CODE_B2E7E9			;$B2E7D8
	INC.b $38,x				;$B2E7DA
	LDA.w #$0331				;$B2E7DC
	JSL.l set_sprite_animation		;$B2E7DF
	LDA.w #$0400				;$B2E7E3
	TSB.w $05FB				;$B2E7E6
CODE_B2E7E9:
	JML [$04F5]				;$B2E7E9

CODE_B2E7EC:
	LDA.w $005A,y				;$B2E7EC
	BNE.b CODE_B2E7F7			;$B2E7EF
	LDA.w #$0100				;$B2E7F1
	TRB.w $05FB				;$B2E7F4
CODE_B2E7F7:
	JSL.l process_sprite_animation		;$B2E7F7
	JSL.l process_current_movement		;$B2E7FB
	JML [$04F5]				;$B2E7FF


map_cannon_main:
	JMP.w (DATA_B2E805,x)			;$B2E802

DATA_B2E805:
	dw CODE_B2E811
	dw CODE_B2E826
	dw CODE_B2E882
	dw CODE_B2E8A8
	dw CODE_B2E8BE
	dw CODE_B2E8E7

CODE_B2E811:
	LDA.w screen_brightness			;$B2E811
	BIT.w #$FF00				;$B2E814
	BNE.b CODE_B2E84C			;$B2E817
	LDA.w #$4000				;$B2E819
	BIT.w $05FB				;$B2E81C
	BEQ.b CODE_B2E84C			;$B2E81F
	TYX					;$B2E821
	INC.b $38,x				;$B2E822
	BRA.b CODE_B2E84C			;$B2E824

CODE_B2E826:
	LDA.b active_frame_counter		;$B2E826
	BIT.w #$0003				;$B2E828
	BNE.b CODE_B2E84C			;$B2E82B
	TYX					;$B2E82D
	SEP.b #$20				;$B2E82E
	DEC.b $59,x				;$B2E830
	REP.b #$20				;$B2E832
	BNE.b CODE_B2E84C			;$B2E834
	INC.b $38,x				;$B2E836
	LDA.w #$0005				;$B2E838
	JSR.w CODE_B2E894			;$B2E83B
	JSR.w CODE_B2E852			;$B2E83E
	LDA.w #$0001				;$B2E841
	STA.w map_node_number			;$B2E844
	LDA.w #$0041				;$B2E847
	STA.b $4E,x				;$B2E84A
CODE_B2E84C:
	JSR.w CODE_B2E93B			;$B2E84C
	JML [$04F5]				;$B2E84F

CODE_B2E852:
	LDX.w active_kong_sprite		;$B2E852
	JSR.w CODE_B2E85B			;$B2E855
	LDX.w follower_kong_sprite		;$B2E858
CODE_B2E85B:
	LDA.w #$FCC0				;$B2E85B
	STA.b $2A,x				;$B2E85E
	LDA.w $0012,y				;$B2E860
	SEC					;$B2E863
	SBC.w #$0008				;$B2E864
	STA.b $12,x				;$B2E867
	LDA.w $0016,y				;$B2E869
	SEC					;$B2E86C
	SBC.w #$0008				;$B2E86D
	STA.b $16,x				;$B2E870
	JSR.w CODE_B2E929			;$B2E872
	LDA.b $1E,x				;$B2E875
	ORA.w #$4000				;$B2E877
	STA.b $1E,x				;$B2E87A
	LDA.w #$0038				;$B2E87C
	STA.b $4C,x				;$B2E87F
	RTS					;$B2E881

CODE_B2E882:
	TYX					;$B2E882
	LDA.b $2A,x				;$B2E883
	BEQ.b CODE_B2E88D			;$B2E885
	CLC					;$B2E887
	ADC.w #$0008				;$B2E888
	STA.b $2A,x				;$B2E88B
CODE_B2E88D:
	JSL.l process_current_movement		;$B2E88D
	JML [$04F5]				;$B2E891

CODE_B2E894:
	CLC					;$B2E894
	ADC.w $0012,y				;$B2E895
	STA.w $0012,y				;$B2E898
	STZ.w $1C41				;$B2E89B
	STZ.w $1C57				;$B2E89E
	LDA.w #$0002				;$B2E8A1
	STA.w $005A,y				;$B2E8A4
	RTS					;$B2E8A7

CODE_B2E8A8:
	LDA.w screen_brightness			;$B2E8A8
	BIT.w #$FF00				;$B2E8AB
	BNE.b CODE_B2E8BB			;$B2E8AE
	LDA.w #$4000				;$B2E8B0
	BIT.w $05FB				;$B2E8B3
	BEQ.b CODE_B2E8BB			;$B2E8B6
	TYX					;$B2E8B8
	INC.b $38,x				;$B2E8B9
CODE_B2E8BB:
	JML [$04F5]				;$B2E8BB

CODE_B2E8BE:
	LDA.b active_frame_counter		;$B2E8BE
	BIT.w #$0003				;$B2E8C0
	BNE.b CODE_B2E8BB			;$B2E8C3
	TYX					;$B2E8C5
	SEP.b #$20				;$B2E8C6
	DEC.b $58,x				;$B2E8C8
	REP.b #$20				;$B2E8CA
	BNE.b CODE_B2E8BB			;$B2E8CC
	INC.b $38,x				;$B2E8CE
	LDA.w #$FFFB				;$B2E8D0
	JSR.w CODE_B2E894			;$B2E8D3
	JSR.w CODE_B2E8F9			;$B2E8D6
	LDA.w #$000A				;$B2E8D9
	STA.w map_node_number			;$B2E8DC
	LDA.w #$000A				;$B2E8DF
	STA.b $4E,x				;$B2E8E2
	JML [$04F5]				;$B2E8E4

CODE_B2E8E7:
	TYX					;$B2E8E7
	LDA.b $2A,x				;$B2E8E8
	BEQ.b CODE_B2E8F2			;$B2E8EA
	SEC					;$B2E8EC
	SBC.w #$0008				;$B2E8ED
	STA.b $2A,x				;$B2E8F0
CODE_B2E8F2:
	JSL.l process_current_movement		;$B2E8F2
	JML [$04F5]				;$B2E8F6

CODE_B2E8F9:
	LDX.w active_kong_sprite		;$B2E8F9
	JSR.w CODE_B2E902			;$B2E8FC
	LDX.w follower_kong_sprite		;$B2E8FF
CODE_B2E902:
	LDA.w #$0520				;$B2E902
	STA.b $2A,x				;$B2E905
	LDA.w #$3000				;$B2E907
	ORA.b $1E,x				;$B2E90A
	STA.b $1E,x				;$B2E90C
	LDA.w $0012,y				;$B2E90E
	CLC					;$B2E911
	ADC.w #$0008				;$B2E912
	STA.b $12,x				;$B2E915
	LDA.w $0016,y				;$B2E917
	SEC					;$B2E91A
	SBC.w #$0008				;$B2E91B
	STA.b $16,x				;$B2E91E
	JSR.w CODE_B2E929			;$B2E920
	LDA.w #$0106				;$B2E923
	STA.b $4C,x				;$B2E926
	RTS					;$B2E928

CODE_B2E929:
	LDA.w #$0012				;$B2E929
	STA.b $38,x				;$B2E92C
	LDA.w #$F9E0				;$B2E92E
	STA.b $2E,x				;$B2E931
	LDA.w #$0001				;$B2E933
	STA.b $5A,x				;$B2E936
	STZ.b $26,x				;$B2E938
	RTS					;$B2E93A

CODE_B2E93B:
	LDA.w $001E,y				;$B2E93B
	PHA					;$B2E93E
	AND.w #$CFFF				;$B2E93F
	ORA.w #$8000				;$B2E942
	STA.w $001E,y				;$B2E945
	LDA.w $0024,y				;$B2E948
	PHA					;$B2E94B
	CLC					;$B2E94C
	ADC.w #$0005				;$B2E94D
	STA.w $0024,y				;$B2E950
	LDX.b $12,y				;$B2E953
	DEX					;$B2E955
	DEX					;$B2E956
	DEX					;$B2E957
	DEX					;$B2E958
	LDA.w $0058,y				;$B2E959
	AND.w #$FF00				;$B2E95C
	BPL.b CODE_B2E964			;$B2E95F
	ORA.w #$00FF				;$B2E961
CODE_B2E964:
	XBA					;$B2E964
	CLC					;$B2E965
	ADC.w $0016,y				;$B2E966
	SEC					;$B2E969
	SBC.w #$000E				;$B2E96A
	CMP.w #$007C				;$B2E96D
	BCS.b CODE_B2E975			;$B2E970
	LDA.w #$007C				;$B2E972
CODE_B2E975:
	PHA					;$B2E975
	PHX					;$B2E976
	JSL.l CODE_B78018			;$B2E977
	LDY.b current_sprite			;$B2E97B
	PLX					;$B2E97D
	PLA					;$B2E97E
	INC					;$B2E97F
	INC					;$B2E980
	INC					;$B2E981
	INC					;$B2E982
	JSL.l CODE_B78018			;$B2E983
	LDY.b current_sprite			;$B2E987
	PLA					;$B2E989
	STA.w $0024,y				;$B2E98A
	PLA					;$B2E98D
	STA.w $001E,y				;$B2E98E
	RTS					;$B2E991


banana_bird_crystal_shards_main:
	LDA.w sprite.y_position,y		;$B2E992  \
	CMP #$00D0				;$B2E995   |
	BPL .delete_sprite			;$B2E998   |
	JSL process_sprite_animation		;$B2E99A   |
	JSL process_current_movement		;$B2E99E   |
	JML [$04F5]				;$B2E9A2  /

.delete_sprite:
	JSL delete_sprite_handle_deallocation	;$B2E9A5  \
	JML [$04F5]				;$B2E9A9  /


banana_bird_cave_cover_main:
CODE_B2E9AC:
	JMP.w (DATA_B2E9AF,x)			;$B2E9AC

DATA_B2E9AF:
	dw CODE_B2E9B5
	dw CODE_B2E9C1
	dw CODE_B2E9F6

CODE_B2E9B5:
	LDX.b $5C,y				;$B2E9B5
	LDA.b $00,x				;$B2E9B7
	BIT.w #$0020				;$B2E9B9
	BNE.b CODE_B2E9F9			;$B2E9BC
	TYX					;$B2E9BE
	INC.b $38,x				;$B2E9BF
CODE_B2E9C1:
	LDA.w map_node_number			;$B2E9C1
	CMP.w $005E,y				;$B2E9C4
	BNE.b CODE_B2E9F6			;$B2E9C7
	LDX.b $5C,y				;$B2E9C9
	LDA.b $00,x				;$B2E9CB
	BIT.w #$0020				;$B2E9CD
	BNE.b CODE_B2E9F9			;$B2E9D0
	ORA.w #$0020				;$B2E9D2
	STA.b $00,x				;$B2E9D5
	JSL.l delete_sprite_handle_deallocation	;$B2E9D7
	LDA.w #$0671				;$B2E9DB
	JSL.l queue_sound_effect		;$B2E9DE
	LDA.w #$077C				;$B2E9E2
	JSL.l queue_sound_effect		;$B2E9E5
	LDY.w #$0296				;$B2E9E9
	JSL.l CODE_BB8585			;$B2E9EC
	LDA.w #$0100				;$B2E9F0
	TSB.w $05FB				;$B2E9F3
CODE_B2E9F6:
	JML [$04F5]				;$B2E9F6

CODE_B2E9F9:
	JSL.l delete_sprite_handle_deallocation	;$B2E9F9
	JML [$04F5]				;$B2E9FD


unknown_sprite_01C4_main:
	JMP.w (DATA_B2EA03,x)			;$B2EA00

DATA_B2EA03:
	dw CODE_B2EA09
	dw CODE_B2EA12
	dw CODE_B2EA2F

CODE_B2EA09:
	LDA.w $0603				;$B2EA09
	AND.w #$FF00				;$B2EA0C
	STA.w $005E,y				;$B2EA0F
CODE_B2EA12:
	TDC					;$B2EA12
	SEP.b #$20				;$B2EA13
	LDA.w $005E,y				;$B2EA15
	CLC					;$B2EA18
	ADC.w $005F,y				;$B2EA19
	REP.b #$20				;$B2EA1C
	BEQ.b CODE_B2EA28			;$B2EA1E
	DEC					;$B2EA20
	TAX					;$B2EA21
CODE_B2EA22:
	JSR.w CODE_B2EA4E			;$B2EA22
	DEX					;$B2EA25
	BPL.b CODE_B2EA22			;$B2EA26
CODE_B2EA28:
	JSL.l delete_sprite_handle_deallocation	;$B2EA28
	JML [$04F5]				;$B2EA2C

CODE_B2EA2F:
	LDA.w $005E,y				;$B2EA2F
	AND.w #$00FF				;$B2EA32
	STA.b $5E				;$B2EA35
	SEP.b #$20				;$B2EA37
	LDA.w $005F,y				;$B2EA39
	CLC					;$B2EA3C
	ADC.w $005E,y				;$B2EA3D
	DEC					;$B2EA40
	REP.b #$20				;$B2EA41
	TAX					;$B2EA43
CODE_B2EA44:
	JSR.w CODE_B2EA4E			;$B2EA44
	DEX					;$B2EA47
	DEC.b $5E				;$B2EA48
	BNE.b CODE_B2EA44			;$B2EA4A
	BRA.b CODE_B2EA28			;$B2EA4C

CODE_B2EA4E:
	PHX					;$B2EA4E
	TXA					;$B2EA4F
	ASL					;$B2EA50
	ASL					;$B2EA51
	STA.b $84				;$B2EA52
	LDY.w #$02C0				;$B2EA54
	JSL.l CODE_BB85B8			;$B2EA57
	LDY.b alternate_sprite			;$B2EA5B
	LDX.b current_sprite			;$B2EA5D
	STX.b $5C,y				;$B2EA5F
	LDA.b $12,x				;$B2EA61
	STA.w $0012,y				;$B2EA63
	LDA.b $16,x				;$B2EA66
	STA.w $0016,y				;$B2EA68
	LDA.b $5C,x				;$B2EA6B
	BNE.b CODE_B2EA83			;$B2EA6D
	LDX.b $84				;$B2EA6F
	LDA.w DATA_B2EA95,x			;$B2EA71
	STA.w $0058,y				;$B2EA74
	LDA.w #$0342				;$B2EA77
	CLC					;$B2EA7A
	ADC.w DATA_B2EA95+$02,x			;$B2EA7B
	STA.w $005C,y				;$B2EA7E
	PLX					;$B2EA81
	RTS					;$B2EA82

CODE_B2EA83:
	LSR.b $84				;$B2EA83
	LDX.b $84				;$B2EA85
	LDA.w DATA_B2EAA9,x			;$B2EA87
	STA.w $0058,y				;$B2EA8A
	LDA.w #$0344				;$B2EA8D
	STA.w $005C,y				;$B2EA90
	PLX					;$B2EA93
	RTS					;$B2EA94

DATA_B2EA95:
	dw $0001
	dw $0000
	dw $060A
	dw $0001
	dw $1008
	dw $0000
	dw $1212
	dw $0001
	dw $0C1B
	dw $0000

DATA_B2EAA9:
	dw $0C18
	dw $0312
	dw $0C0C
	dw $0306
	dw $0C00


boomers_bomb_shelter_cogs_main:
	JMP.w (DATA_B2EAB6,x)			;$B2EAB3

DATA_B2EAB6:
	dw CODE_B2EABA
	dw CODE_B2EAC3

CODE_B2EABA:
	TYX					;$B2EABA
	INC.b $38,x				;$B2EABB
	LDA.b $5C,x				;$B2EABD
	JSL.l set_sprite_animation		;$B2EABF
CODE_B2EAC3:
	JSL.l process_sprite_animation		;$B2EAC3
	JML [$04F5]				;$B2EAC7


chairlift_chair_main:
	JMP.w (DATA_B2EACD,x)			;$B2EACA

DATA_B2EACD:
	dw CODE_B2EAD7
	dw CODE_B2EB12
	dw CODE_B2EB34
	dw CODE_B2EB88
	dw CODE_B2EBAA

CODE_B2EAD7:
	STZ.b $1A				;$B2EAD7
	LDX.w active_kong_sprite		;$B2EAD9
	LDA.b $38,x				;$B2EADC
	CMP.w #$0007				;$B2EADE
	BNE.b CODE_B2EAEF			;$B2EAE1
	LDA.b $12,x				;$B2EAE3
	CMP.w #$00E0				;$B2EAE5
	BCS.b CODE_B2EAEF			;$B2EAE8
	LDA.w #$0040				;$B2EAEA
	STA.b $1A				;$B2EAED
CODE_B2EAEF:
	LDA.w #$00C0				;$B2EAEF
	LDX.b $2A,y				;$B2EAF2
	BPL.b CODE_B2EAF9			;$B2EAF4
	LDA.w $0050,y				;$B2EAF6
CODE_B2EAF9:
	CLC					;$B2EAF9
	ADC.b $1A				;$B2EAFA
	STA.w $000E,y				;$B2EAFC
	LDA.w $004C,y				;$B2EAFF
	BEQ.b CODE_B2EB07			;$B2EB02
	JSR.w CODE_B2EBBF			;$B2EB04
CODE_B2EB07:
	JSL.l process_current_movement		;$B2EB07
	JSL.l process_anim_preserve_state	;$B2EB0B
	JML [$04F5]				;$B2EB0F

CODE_B2EB12:
	TYX					;$B2EB12
	STZ.b $38,x				;$B2EB13
	LDA.w #$0321				;$B2EB15
	JSL.l set_sprite_animation		;$B2EB18
	TXY					;$B2EB1C
	LDX.w active_kong_sprite		;$B2EB1D
	LDA.b $38,x				;$B2EB20
	BEQ.b CODE_B2EB31			;$B2EB22
	CMP.w #$0015				;$B2EB24
	BNE.b CODE_B2EB31			;$B2EB27
	LDA.w $004C,y				;$B2EB29
	BEQ.b CODE_B2EB31			;$B2EB2C
	JSR.w CODE_B2EBFD			;$B2EB2E
CODE_B2EB31:
	JML [$04F5]				;$B2EB31

CODE_B2EB34:
	TYX					;$B2EB34
	STZ.b $38,x				;$B2EB35
	LDX.w active_kong_sprite		;$B2EB37
	LDA.b $38,x				;$B2EB3A
	BEQ.b CODE_B2EB43			;$B2EB3C
	CMP.w #$0016				;$B2EB3E
	BNE.b CODE_B2EB5F			;$B2EB41
CODE_B2EB43:
	JSR.w CODE_B2EB71			;$B2EB43
	BCC.b CODE_B2EB5F			;$B2EB46
	LDA.w $002A,y				;$B2EB48
	BMI.b CODE_B2EB62			;$B2EB4B
	LDA.w map_node_number			;$B2EB4D
	CMP.w #$0004				;$B2EB50
	BEQ.b CODE_B2EB5A			;$B2EB53
	CMP.w #$000A				;$B2EB55
	BNE.b CODE_B2EB5F			;$B2EB58
CODE_B2EB5A:
	STX.b $4C,y				;$B2EB5A
	JSR.w CODE_B2EBBF			;$B2EB5C
CODE_B2EB5F:
	JML [$04F5]				;$B2EB5F

CODE_B2EB62:
	LDA.w map_node_number			;$B2EB62
	CMP.w #$0003				;$B2EB65
	BEQ.b CODE_B2EB5A			;$B2EB68
	CMP.w #$000B				;$B2EB6A
	BEQ.b CODE_B2EB5A			;$B2EB6D
	BRA.b CODE_B2EB5F			;$B2EB6F

CODE_B2EB71:
	LDA.b $16,x				;$B2EB71
	SEC					;$B2EB73
	SBC.w #$0008				;$B2EB74
	CMP.w $0016,y				;$B2EB77
	BCS.b CODE_B2EB86			;$B2EB7A
	CLC					;$B2EB7C
	ADC.w #$0010				;$B2EB7D
	CMP.w $0016,y				;$B2EB80
	BCC.b CODE_B2EB86			;$B2EB83
	RTS					;$B2EB85

CODE_B2EB86:
	CLC					;$B2EB86
	RTS					;$B2EB87

CODE_B2EB88:
	TYX					;$B2EB88
	STZ.b $38,x				;$B2EB89
	LDA.b $1E,x				;$B2EB8B
	EOR.w #$4000				;$B2EB8D
	STA.b $1E,x				;$B2EB90
	TXY					;$B2EB92
	LDX.w active_kong_sprite		;$B2EB93
	LDA.b $38,x				;$B2EB96
	BEQ.b CODE_B2EBA7			;$B2EB98
	CMP.w #$0015				;$B2EB9A
	BNE.b CODE_B2EBA7			;$B2EB9D
	LDA.w $004C,y				;$B2EB9F
	BEQ.b CODE_B2EBA7			;$B2EBA2
	JSR.w CODE_B2EBFD			;$B2EBA4
CODE_B2EBA7:
	JML [$04F5]				;$B2EBA7

CODE_B2EBAA:
	TYX					;$B2EBAA
	STZ.b $5A,x				;$B2EBAB
	STZ.b $38,x				;$B2EBAD
	LDA.b $3C,x				;$B2EBAF
	AND.w #$00FF				;$B2EBB1
	STA.b $12,x				;$B2EBB4
	LDA.b $3D,x				;$B2EBB6
	AND.w #$00FF				;$B2EBB8
	STA.b $16,x				;$B2EBBB
	BRA.b CODE_B2EBA7			;$B2EBBD

CODE_B2EBBF:
	LDX.w active_kong_sprite		;$B2EBBF
	STZ.b $26,x				;$B2EBC2
	JSR.w CODE_B2EBD4			;$B2EBC4
	LDX.w follower_kong_sprite		;$B2EBC7
	LDA.w #$4000				;$B2EBCA
	BIT.w $05AF				;$B2EBCD
	BEQ.b CODE_B2EBD4			;$B2EBD0
	STZ.b $26,x				;$B2EBD2
CODE_B2EBD4:
	LDA.w $0012,y				;$B2EBD4
	STA.b $12,x				;$B2EBD7
	LDA.w $0016,y				;$B2EBD9
	STA.b $16,x				;$B2EBDC
	LDA.w $000E,y				;$B2EBDE
	INC					;$B2EBE1
	STA.b $0E,x				;$B2EBE2
	LDA.w #$0014				;$B2EBE4
	STA.b $38,x				;$B2EBE7
	LDA.w $001E,y				;$B2EBE9
	EOR.b $1E,x				;$B2EBEC
	AND.w #$4000				;$B2EBEE
	EOR.b $1E,x				;$B2EBF1
	STA.b $1E,x				;$B2EBF3
	CPX.w $0501				;$B2EBF5
	BNE.b CODE_B2EBFC			;$B2EBF8
	INC.b $0E,x				;$B2EBFA
CODE_B2EBFC:
	RTS					;$B2EBFC

CODE_B2EBFD:
	STZ.w $1C41				;$B2EBFD
	STZ.w $1C57				;$B2EC00
	TDC					;$B2EC03
	STA.w $004C,y				;$B2EC04
	LDA.w map_node_number			;$B2EC07
	CMP.w #$0003				;$B2EC0A
	BNE.b CODE_B2EC14			;$B2EC0D
	LDA.w #$0012				;$B2EC0F
	BRA.b CODE_B2EC2B			;$B2EC12

CODE_B2EC14:
	CMP.w #$0004				;$B2EC14
	BNE.b CODE_B2EC1E			;$B2EC17
	LDA.w #$0013				;$B2EC19
	BRA.b CODE_B2EC2B			;$B2EC1C

CODE_B2EC1E:
	CMP.w #$000A				;$B2EC1E
	BNE.b CODE_B2EC28			;$B2EC21
	LDA.w #$0011				;$B2EC23
	BRA.b CODE_B2EC2B			;$B2EC26

CODE_B2EC28:
	LDA.w #$0010				;$B2EC28
CODE_B2EC2B:
	JSL.l CODE_B48012			;$B2EC2B
	LDX.w active_kong_sprite		;$B2EC2F
	JSR.w CODE_B2EC3A			;$B2EC32
	LDX.w follower_kong_sprite		;$B2EC35
	LDY.b current_sprite			;$B2EC38
CODE_B2EC3A:
	LDA.w #$0004				;$B2EC3A
	STA.b $38,x				;$B2EC3D
	LDA.w #$0009				;$B2EC3F
	STA.b $5A,x				;$B2EC42
	RTS					;$B2EC44


unknown_sprite_01C8_main:
	JMP.w (DATA_B2EC48,x)			;$B2EC45

DATA_B2EC48:
	dw CODE_B2EC50
	dw CODE_B2EC68
	dw CODE_B2EC79
	dw CODE_B2ECA7

CODE_B2EC50:
	LDA.w $051F				;$B2EC50
	BNE.b CODE_B2EC5C			;$B2EC53
	JSL.l delete_sprite_handle_deallocation	;$B2EC55
	JML [$04F5]				;$B2EC59

CODE_B2EC5C:
	TYX					;$B2EC5C
	INC.b $38,x				;$B2EC5D
	STA.b $4E,x				;$B2EC5F
	LDA.w #$0572				;$B2EC61
	JSL.l queue_sound_effect		;$B2EC64
CODE_B2EC68:
	LDA.b active_frame_counter		;$B2EC68
	BIT.w #$0001				;$B2EC6A
	BNE.b CODE_B2EC72			;$B2EC6D
	JSR.w CODE_B2ECAC			;$B2EC6F
CODE_B2EC72:
	JSL.l process_current_movement		;$B2EC72
	JML [$04F5]				;$B2EC76

CODE_B2EC79:
	TYX					;$B2EC79
	LSR.b $4E,x				;$B2EC7A
	BCS.b CODE_B2EC87			;$B2EC7C
CODE_B2EC7E:
	LDA.w #$0001				;$B2EC7E
	STA.b $38,x				;$B2EC81
	ASL.b $50,x				;$B2EC83
	BRA.b CODE_B2EC68			;$B2EC85

CODE_B2EC87:
	LDA.b $50,x				;$B2EC87
	TSB.w $0601				;$B2EC89
	LDA.b $4E,x				;$B2EC8C
	BNE.b CODE_B2EC7E			;$B2EC8E
	LDA.w #$0100				;$B2EC90
	TRB.w $05FB				;$B2EC93
	STZ.w $1C5D				;$B2EC96
	LDA.w #$0500				;$B2EC99
	JSL.l queue_sound_effect		;$B2EC9C
	JSL.l delete_sprite_handle_deallocation	;$B2ECA0
	JML [$04F5]				;$B2ECA4

CODE_B2ECA7:
	TYX					;$B2ECA7
	STZ.b $4E,x				;$B2ECA8
	BRA.b CODE_B2EC7E			;$B2ECAA

CODE_B2ECAC:
	LDA.w $004C,y				;$B2ECAC
	INC					;$B2ECAF
	CMP.w #$0006				;$B2ECB0
	BNE.b CODE_B2ECB6			;$B2ECB3
	TDC					;$B2ECB5
CODE_B2ECB6:
	STA.w $004C,y				;$B2ECB6
	RTS					;$B2ECB9


sewer_stockpile_grate_main:
	JMP.w (DATA_B2ECBD,x)			;$B2ECBA

DATA_B2ECBD:
	dw CODE_B2ECC1
	dw CODE_B2ECD0

CODE_B2ECC1:
	TYX					;$B2ECC1
	INC.b $38,x				;$B2ECC2
	LDA.w $064E				;$B2ECC4
	BIT.w #$0001				;$B2ECC7
	BEQ.b CODE_B2ECD0			;$B2ECCA
	JSL.l delete_sprite_handle_deallocation	;$B2ECCC
CODE_B2ECD0:
	LDA.w $064E				;$B2ECD0
	BIT.w #$0001				;$B2ECD3
	BEQ.b CODE_B2ECE8			;$B2ECD6
	LDA.w #$031E				;$B2ECD8
	CMP.w $0040,y				;$B2ECDB
	BEQ.b CODE_B2ECE4			;$B2ECDE
	JSL.l set_sprite_animation		;$B2ECE0
CODE_B2ECE4:
	JSL.l process_sprite_animation		;$B2ECE4
CODE_B2ECE8:
	JML [$04F5]				;$B2ECE8


unknown_sprite_01CC_main:
	JMP.w (DATA_B2ECEE,x)			;$B2ECEB

DATA_B2ECEE:
	dw CODE_B2ECF4
	dw CODE_B2ED0B
	dw CODE_B2ED20

CODE_B2ECF4:
	LDA.w $0696				;$B2ECF4
	BIT.w #$0001				;$B2ECF7
	BEQ.b CODE_B2ED05			;$B2ECFA
CODE_B2ECFC:
	STZ.w $1C97				;$B2ECFC
	JSR.w CODE_B2E53B			;$B2ECFF
	JML [$04F5]				;$B2ED02

CODE_B2ED05:
	TYX					;$B2ED05
	INC.b $38,x				;$B2ED06
	STX.w $1C97				;$B2ED08
CODE_B2ED0B:
	LDA.w #$8000				;$B2ED0B
	TRB.w $05FB				;$B2ED0E
	BEQ.b CODE_B2ED1D			;$B2ED11
	TYX					;$B2ED13
	INC.b $38,x				;$B2ED14
	LDA.w #$0662				;$B2ED16
	JSL.l queue_sound_effect		;$B2ED19
CODE_B2ED1D:
	JML [$04F5]				;$B2ED1D

CODE_B2ED20:
	LDA.b active_frame_counter		;$B2ED20
	BIT.w #$0007				;$B2ED22
	BNE.b CODE_B2ED1D			;$B2ED25
	LDA.w $005C,y				;$B2ED27
	INC					;$B2ED2A
	CMP.w #$0018				;$B2ED2B
	BCC.b CODE_B2ED38			;$B2ED2E
	LDA.w #$0008				;$B2ED30
	TSB.w $05FD				;$B2ED33
	BRA.b CODE_B2ECFC			;$B2ED36

CODE_B2ED38:
	STA.w $005C,y				;$B2ED38
	BRA.b CODE_B2ED1D			;$B2ED3B


unknown_sprite_009C_main:
	JMP.w (DATA_B2ED40,x)			;$B2ED3D

DATA_B2ED40:
	dw CODE_B2ED44
	dw CODE_B2ED70

CODE_B2ED44:
	TYX					;$B2ED44
	INC.b $38,x				;$B2ED45
	LDA.w #$0018				;$B2ED47
CODE_B2ED4A:
	PHA					;$B2ED4A
	ASL					;$B2ED4B
	ASL					;$B2ED4C
	TAX					;$B2ED4D
	JSL.l CODE_808018			;$B2ED4E
	AND.w #$001F				;$B2ED52
	CLC					;$B2ED55
	ADC.w #$0298				;$B2ED56
	STA.l $7EA258,x				;$B2ED59
	JSL.l CODE_808018			;$B2ED5D
	AND.w #$000F				;$B2ED61
	CLC					;$B2ED64
	ADC.w #$021F				;$B2ED65
	STA.l $7EA25A,x				;$B2ED68
	PLA					;$B2ED6C
	DEC					;$B2ED6D
	BPL.b CODE_B2ED4A			;$B2ED6E
CODE_B2ED70:
	LDA.w #$0018				;$B2ED70
CODE_B2ED73:
	PHA					;$B2ED73
	ASL					;$B2ED74
	ASL					;$B2ED75
	TAX					;$B2ED76
	LDA.l $7EA25A,x				;$B2ED77
	PHA					;$B2ED7B
	LDA.l $7EA258,x				;$B2ED7C
	TAX					;$B2ED80
	PLA					;$B2ED81
	LDY.b current_sprite			;$B2ED82
	JSL.l CODE_B78018			;$B2ED84
	PLA					;$B2ED88
	DEC					;$B2ED89
	BPL.b CODE_B2ED73			;$B2ED8A
	JSL.l process_sprite_animation		;$B2ED8C
	JML [$04F5]				;$B2ED90


sky_high_secret_rock_main:
	LDA.w map_node_number			;$B2ED93
	CMP.w #$000A				;$B2ED96
	BNE.b CODE_B2ED9E			;$B2ED99
	JSR.w CODE_B2EDA8			;$B2ED9B
CODE_B2ED9E:
	JSR.w CODE_B2EDD9			;$B2ED9E
	JSL.l process_current_movement		;$B2EDA1
	JML [$04F5]				;$B2EDA5

CODE_B2EDA8:
	STZ.b temp_1A				;$B2EDA8
	LDX.w active_kong_sprite		;$B2EDAA
	LDA.b $18,x				;$B2EDAD
	BEQ.b CODE_B2EDD8			;$B2EDAF
	JSR.w CODE_B2EDBF			;$B2EDB1
	DEC.b temp_1A				;$B2EDB4
	DEC.b temp_1A				;$B2EDB6
	DEC.b temp_1A				;$B2EDB8
	DEC.b temp_1A				;$B2EDBA
	LDX.w follower_kong_sprite		;$B2EDBC
CODE_B2EDBF:
	LDA.b $38,x				;$B2EDBF
	AND.w #$7FFF				;$B2EDC1
	BEQ.b CODE_B2EDCB			;$B2EDC4
	CMP.w #$0001				;$B2EDC6
	BNE.b CODE_B2EDD8			;$B2EDC9
CODE_B2EDCB:
	LDA.w $0012,y				;$B2EDCB
	CLC					;$B2EDCE
	ADC.b temp_1A				;$B2EDCF
	STA.b $12,x				;$B2EDD1
	LDA.w $0016,y				;$B2EDD3
	STA.b $16,x				;$B2EDD6
CODE_B2EDD8:
	RTS					;$B2EDD8

CODE_B2EDD9:
	LDX.w #$FFFF				;$B2EDD9
	LDA.w $0012,y				;$B2EDDC
	SEC					;$B2EDDF
	SBC.w $005C,y				;$B2EDE0
	BPL.b CODE_B2EDEC			;$B2EDE3
	LDX.w #$0001				;$B2EDE5
	EOR.w #$FFFF				;$B2EDE8
	INC					;$B2EDEB
CODE_B2EDEC:
	STX.b temp_1E				;$B2EDEC
	ASL					;$B2EDEE
	ASL					;$B2EDEF
	ASL					;$B2EDF0
	STA.b temp_3E				;$B2EDF1
	LDA.w #$0020				;$B2EDF3
	SEC					;$B2EDF6
	SBC.b temp_3E				;$B2EDF7
	STA.b temp_3E				;$B2EDF9
	STA.b temp_1C				;$B2EDFB
	LDA.w #$0000				;$B2EDFD
	STA.b temp_1A				;$B2EE00
	LDX.w #$0010				;$B2EE02
CODE_B2EE05:
	LDA.b temp_1A				;$B2EE05
	STA.l $7EA1DA,x				;$B2EE07
	DEC.b temp_1C				;$B2EE0B
	BNE.b CODE_B2EE1A			;$B2EE0D
	LDA.b temp_3E				;$B2EE0F
	STA.b temp_1C				;$B2EE11
	LDA.b temp_1A				;$B2EE13
	CLC					;$B2EE15
	ADC.b temp_1E				;$B2EE16
	STA.b temp_1A				;$B2EE18
CODE_B2EE1A:
	INX					;$B2EE1A
	INX					;$B2EE1B
	CPX.w #$0090				;$B2EE1C
	BCC.b CODE_B2EE05			;$B2EE1F
	RTS					;$B2EE21


unknown_sprite_00A0_main:
	JMP.w (DATA_B2EE25,x)			;$B2EE22

DATA_B2EE25:
	dw CODE_B2EE29
	dw CODE_B2EE3A

CODE_B2EE29:
	TYX					;$B2EE29
	INC.b $38,x				;$B2EE2A
	LDA.b $5C,x				;$B2EE2C
	BIT.w $0601				;$B2EE2E
	BEQ.b CODE_B2EE37			;$B2EE31
	JSL.l delete_sprite_handle_deallocation	;$B2EE33
CODE_B2EE37:
	JML [$04F5]				;$B2EE37

CODE_B2EE3A:
	TYX					;$B2EE3A
	LDA.w $0601				;$B2EE3B
	XBA					;$B2EE3E
	BIT.b $5C,x				;$B2EE3F
	BEQ.b CODE_B2EE5F			;$B2EE41
	TSB.w $0601				;$B2EE43
	LDY.w #$02F6				;$B2EE46
	JSL.l CODE_BB8585			;$B2EE49
	LDY.w #$0322				;$B2EE4D
	JSL.l CODE_BB8585			;$B2EE50
	LDA.w #$060E				;$B2EE54
	JSL.l queue_sound_effect		;$B2EE57
	JSL.l delete_sprite_handle_deallocation	;$B2EE5B
CODE_B2EE5F:
	JML [$04F5]				;$B2EE5F


unknown_sprite_00A4_main:
	TYX					;$B2EE62
	LDA.b $5C,x				;$B2EE63
	BEQ.b CODE_B2EE72			;$B2EE65
	STZ.b $26,x				;$B2EE67
	DEC.b $5C,x				;$B2EE69
	BNE.b CODE_B2EE72			;$B2EE6B
	LDA.w #$C000				;$B2EE6D
	STA.b $26,x				;$B2EE70
CODE_B2EE72:
	JML [$04F5]				;$B2EE72


krosshair_main:
	JMP.w (DATA_B2EE78,x)			;$B2EE75

DATA_B2EE78:
	dw CODE_B2EE80
	dw CODE_B2EECB
	dw CODE_B2EF62
	dw CODE_B2EF7F

CODE_B2EE80:
	LDA.w $15EC				;$B2EE80
	BEQ.b CODE_B2EE8C			;$B2EE83
	JSL.l delete_sprite_handle_deallocation	;$B2EE85
	JML [$04F5]				;$B2EE89

CODE_B2EE8C:
	TYX					;$B2EE8C
	INC.b $38,x				;$B2EE8D
	STX.w $15EC				;$B2EE8F
	LDA.w $05AF				;$B2EE92
	AND.w #$4000				;$B2EE95
	STA.b $62,x				;$B2EE98
	LDA.b $1F,x				;$B2EE9A
	AND.w #$000E				;$B2EE9C
	ASL					;$B2EE9F
	ASL					;$B2EEA0
	ASL					;$B2EEA1
	CLC					;$B2EEA2
	ADC.w #$0081				;$B2EEA3
	STA.b $5C,x				;$B2EEA6
	LDA.b $1F,x				;$B2EEA8
	AND.w #$000E				;$B2EEAA
	TAX					;$B2EEAD
	LDA.w $073C,x				;$B2EEAE
	ASL					;$B2EEB1
	TAX					;$B2EEB2
	LDA.l sprite_palette_table,x		;$B2EEB3
	TAX					;$B2EEB7
	LDY.w #$2F80				;$B2EEB8
	LDA.w #$000F				;$B2EEBB
	MVN $7E, palette_bank>>16		;$B2EEBE
	LDA.w #$0566				;$B2EEC1
	JSL.l queue_sound_effect		;$B2EEC4
CODE_B2EEC8:
	JML [$04F5]				;$B2EEC8

CODE_B2EECB:
	LDA.w $05AF				;$B2EECB
	BIT.w #$2000				;$B2EECE
	BNE.b CODE_B2EEC8			;$B2EED1
	AND.w #$4000				;$B2EED3
	EOR.w $0062,y				;$B2EED6
	BEQ.b CODE_B2EEE1			;$B2EED9
	LDA.w #$0100				;$B2EEDB
	STA.w $0060,y				;$B2EEDE
CODE_B2EEE1:
	LDA.w $05AF				;$B2EEE1
	AND.w #$4000				;$B2EEE4
	STA.w $0062,y				;$B2EEE7
	TYX					;$B2EEEA
	LDY.w active_kong_sprite		;$B2EEEB
	LDA.b [$6A]				;$B2EEEE
	STA.b $1A				;$B2EEF0
	LDA.b $66,x				;$B2EEF2
	BNE.b CODE_B2EF4A			;$B2EEF4
	LDA.w $0012,y				;$B2EEF6
	SEC					;$B2EEF9
	SBC.b $12,x				;$B2EEFA
	STA.b $1C				;$B2EEFC
	CLC					;$B2EEFE
	ADC.b $30,x				;$B2EEFF
	BPL.b CODE_B2EF13			;$B2EF01
	EOR.w #$FFFF				;$B2EF03
	INC					;$B2EF06
	CMP.b $1A				;$B2EF07
	BCC.b CODE_B2EF0D			;$B2EF09
	LDA.b $1A				;$B2EF0B
CODE_B2EF0D:
	EOR.w #$FFFF				;$B2EF0D
	INC					;$B2EF10
	BRA.b CODE_B2EF19			;$B2EF11

CODE_B2EF13:
	CMP.b $1A				;$B2EF13
	BCC.b CODE_B2EF19			;$B2EF15
	LDA.b $1A				;$B2EF17
CODE_B2EF19:
	JSR.w CODE_B2EFA1			;$B2EF19
	STA.b $30,x				;$B2EF1C
	LDA.w $0016,y				;$B2EF1E
	SEC					;$B2EF21
	SBC.w #$0008				;$B2EF22
	SEC					;$B2EF25
	SBC.b $16,x				;$B2EF26
	STA.b $1C				;$B2EF28
	CLC					;$B2EF2A
	ADC.b $34,x				;$B2EF2B
	BPL.b CODE_B2EF3F			;$B2EF2D
	EOR.w #$FFFF				;$B2EF2F
	INC					;$B2EF32
	CMP.b $1A				;$B2EF33
	BCC.b CODE_B2EF39			;$B2EF35
	LDA.b $1A				;$B2EF37
CODE_B2EF39:
	EOR.w #$FFFF				;$B2EF39
	INC					;$B2EF3C
	BRA.b CODE_B2EF45			;$B2EF3D

CODE_B2EF3F:
	CMP.b $1A				;$B2EF3F
	BCC.b CODE_B2EF45			;$B2EF41
	LDA.b $1A				;$B2EF43
CODE_B2EF45:
	JSR.w CODE_B2EFA1			;$B2EF45
	STA.b $34,x				;$B2EF48
CODE_B2EF4A:
	LDA.b $66,x				;$B2EF4A
	BEQ.b CODE_B2EF50			;$B2EF4C
	DEC.b $66,x				;$B2EF4E
CODE_B2EF50:
	JSR.w CODE_B2EFBC			;$B2EF50
	BCS.b CODE_B2EF5B			;$B2EF53
	JSR.w CODE_B2EFE8			;$B2EF55
	JSR.w CODE_B2F013			;$B2EF58
CODE_B2EF5B:
	JSL.l process_current_movement		;$B2EF5B
	JML [$04F5]				;$B2EF5F

CODE_B2EF62:
	TYX					;$B2EF62
	LDA.w #$07E9				;$B2EF63
	SBC.b $12,x				;$B2EF66
	STA.b $30,x				;$B2EF68
	LDA.w #$016E				;$B2EF6A
	SBC.b $16,x				;$B2EF6D
	STA.b $34,x				;$B2EF6F
	JSR.w CODE_B2EFBC			;$B2EF71
	BCS.b CODE_B2EF78			;$B2EF74
	DEC.b $38,x				;$B2EF76
CODE_B2EF78:
	JSL.l process_current_movement		;$B2EF78
	JML [$04F5]				;$B2EF7C

CODE_B2EF7F:
	LDA.w $15EC				;$B2EF7F
	BEQ.b CODE_B2EF8B			;$B2EF82
	JSL.l delete_sprite_handle_deallocation	;$B2EF84
CODE_B2EF88:
	JML [$04F5]				;$B2EF88

CODE_B2EF8B:
	TYX					;$B2EF8B
	LDY.w active_kong_sprite		;$B2EF8C
	LDA.w $0012,y				;$B2EF8F
	CMP.b $6A,x				;$B2EF92
	BCC.b CODE_B2EF88			;$B2EF94
	STZ.b $38,x				;$B2EF96
	LDA.w #$0001				;$B2EF98
	STA.b $66,x				;$B2EF9B
	TXY					;$B2EF9D
	JMP.w CODE_B2EE80			;$B2EF9E

CODE_B2EFA1:
	STA.b $1E				;$B2EFA1
	LDA.b $1C				;$B2EFA3
	JSR.w CODE_B2EFB5			;$B2EFA5
	CMP.w #$0008				;$B2EFA8
	BCS.b CODE_B2EFB2			;$B2EFAB
	LDA.b $1E				;$B2EFAD
	ASL					;$B2EFAF
	ROR.b $1E				;$B2EFB0
CODE_B2EFB2:
	LDA.b $1E				;$B2EFB2
	RTS					;$B2EFB4

CODE_B2EFB5:
	BPL.b CODE_B2EFBB			;$B2EFB5
	EOR.w #$FFFF				;$B2EFB7
	INC					;$B2EFBA
CODE_B2EFBB:
	RTS					;$B2EFBB

CODE_B2EFBC:
	LDY.w active_kong_sprite		;$B2EFBC
	LDA.w $0016,y				;$B2EFBF
	CMP.w #$0141				;$B2EFC2
	BCC.b CODE_B2EFDD			;$B2EFC5
	CMP.w #$035A				;$B2EFC7
	BCS.b CODE_B2EFDD			;$B2EFCA
	LDA.w $0012,y				;$B2EFCC
	CMP.w #$084F				;$B2EFCF
	BCC.b CODE_B2EFDD			;$B2EFD2
	LDX.b current_sprite			;$B2EFD4
	LDA.w #$0002				;$B2EFD6
	STA.b $38,x				;$B2EFD9
	SEC					;$B2EFDB
	RTS					;$B2EFDC

CODE_B2EFDD:
	CLC					;$B2EFDD
	RTS					;$B2EFDE

CODE_B2EFDF:
	STZ $30,x				;$B2EFDF
	STZ $2A,x				;$B2EFE1
	STZ $34,x				;$B2EFE3
	STZ $2E,x				;$B2EFE5
	RTS					;$B2EFE7

CODE_B2EFE8:
	LDA.w $15E8				;$B2EFE8
	BNE.b CODE_B2EFF1			;$B2EFEB
	LDA.b $60,x				;$B2EFED
	BNE.b CODE_B2F006			;$B2EFEF
CODE_B2EFF1:
	STZ.w $15E8				;$B2EFF1
	LDA.w #$070C				;$B2EFF4
	JSL.l queue_sound_effect		;$B2EFF7
	LDA.b $5E,x				;$B2EFFB
	STA.b $60,x				;$B2EFFD
	STX.w $15EC				;$B2EFFF
	JSR.w CODE_B2F065			;$B2F002
	RTS					;$B2F005

CODE_B2F006:
	CMP.w #$0060				;$B2F006
	BNE.b CODE_B2F012			;$B2F009
	LDA.w #$0667				;$B2F00B
	JSL.l queue_sound_effect		;$B2F00E
CODE_B2F012:
	RTS					;$B2F012

CODE_B2F013:
	DEC.b $60,x				;$B2F013
	BMI.b CODE_B2F047			;$B2F015
	LDA.b $60,x				;$B2F017
	BEQ.b CODE_B2F064			;$B2F019
	CMP.w #$0020				;$B2F01B
	BNE.b CODE_B2F027			;$B2F01E
	LDA.b $68,x				;$B2F020
	STA.b $66,x				;$B2F022
	JSR.w CODE_B2EFDF			;$B2F024
CODE_B2F027:
	LDX.w #$0000				;$B2F027
	CMP.w #$0041				;$B2F02A
	BCC.b CODE_B2F03A			;$B2F02D
	LDX.w #$0001				;$B2F02F
	CMP.w #$0071				;$B2F032
	BCC.b CODE_B2F03A			;$B2F035
	LDX.w #$FFFF				;$B2F037
CODE_B2F03A:
	STX.b $1A				;$B2F03A
	BIT.w #$0007				;$B2F03C
	BNE.b CODE_B2F041			;$B2F03F
CODE_B2F041:
	LDA.b active_frame_counter		;$B2F041
	BIT.b $1A				;$B2F043
	BNE.b CODE_B2F064			;$B2F045
CODE_B2F047:
	LDA.l $7E2F8E				;$B2F047
	STA.b $1A				;$B2F04B
	LDX.w #$000C				;$B2F04D
CODE_B2F050:
	LDA.l $7E2F80,x				;$B2F050
	STA.l $7E2F82,x				;$B2F054
	DEX					;$B2F058
	DEX					;$B2F059
	BPL.b CODE_B2F050			;$B2F05A
	LDA.b $1A				;$B2F05C
	STA.l $7E2F80				;$B2F05E
	LDX.b current_sprite			;$B2F062
CODE_B2F064:
	RTS					;$B2F064

CODE_B2F065:
	LDY.w #$0302				;$B2F065
	JSL.l CODE_BB8585			;$B2F068
	BCS.b CODE_B2F0DF			;$B2F06C
	LDY.b alternate_sprite			;$B2F06E
	LDX.b current_sprite			;$B2F070
	LDA.b $4C,x				;$B2F072
	STA.w $004C,y				;$B2F074
	LDA.w $196D				;$B2F077
	CLC					;$B2F07A
	ADC.w #$0080				;$B2F07B
	STA.w $0012,y				;$B2F07E
	LDA.w $1973				;$B2F081
	CLC					;$B2F084
	ADC.w #$00E0				;$B2F085
	STA.w $0016,y				;$B2F088
	LDA.b $18,x				;$B2F08B
	STA.w $0066,y				;$B2F08D
	LDA.b $12,x				;$B2F090
	STA.w $0062,y				;$B2F092
	LDA.b $16,x				;$B2F095
	STA.w $0064,y				;$B2F097
	TDC					;$B2F09A
	STA.w $002C,y				;$B2F09B
	STA.w $0032,y				;$B2F09E
	LDA.w #$1400				;$B2F0A1
	STA.w $005C,y				;$B2F0A4
	STA.w CPU.dividen_low			;$B2F0A7
	LDA.b $1A,x				;$B2F0AA
	STA.w $006A,y				;$B2F0AC
	SEP.b #$20				;$B2F0AF
	PHA					;$B2F0B1
	STA.w CPU.divisor			;$B2F0B2
	REP.b #$20				;$B2F0B5
	LDA.w #$0000				;$B2F0B7
	LDA.b ($00)				;$B2F0BA
	LDA.b ($00)				;$B2F0BC
	LDA.w CPU.divide_result			;$B2F0BE
	STA.w $005E,y				;$B2F0C1
	LDA.w #$1C00				;$B2F0C4
	STA.w CPU.dividen_low			;$B2F0C7
	SEP.b #$20				;$B2F0CA
	PLA					;$B2F0CC
	STA.w CPU.divisor			;$B2F0CD
	REP.b #$20				;$B2F0D0
	LDA.w #$0000				;$B2F0D2
	LDA.b ($00)				;$B2F0D5
	LDA.b ($00)				;$B2F0D7
	LDA.w CPU.divide_result			;$B2F0D9
	STA.w $0044,y				;$B2F0DC
CODE_B2F0DF:
	RTS					;$B2F0DF


lightning_bolt_spawner_main:
	TYX					;$B2F0E0
	LDY.w active_kong_sprite		;$B2F0E1
	LDA.b [$6A]				;$B2F0E4
	STA.b $1A				;$B2F0E6
	LDA.w $05AF				;$B2F0E8
	AND.w #$4000				;$B2F0EB
	STA.b $1C				;$B2F0EE
	EOR.b $32,x				;$B2F0F0
	BEQ.b CODE_B2F0F9			;$B2F0F2
	LDA.w #$00B4				;$B2F0F4
	STA.b $5C,x				;$B2F0F7
CODE_B2F0F9:
	LDA.b $1C				;$B2F0F9
	STA.b $32,x				;$B2F0FB
	LDA.w $0012,y				;$B2F0FD
	SEC					;$B2F100
	SBC.b $12,x				;$B2F101
	STA.b $1C				;$B2F103
	CLC					;$B2F105
	ADC.b $30,x				;$B2F106
	BPL.b CODE_B2F11A			;$B2F108
	EOR.w #$FFFF				;$B2F10A
	INC					;$B2F10D
	CMP.b $1A				;$B2F10E
	BCC.b CODE_B2F114			;$B2F110
	LDA.b $1A				;$B2F112
CODE_B2F114:
	EOR.w #$FFFF				;$B2F114
	INC					;$B2F117
	BRA.b CODE_B2F120			;$B2F118

CODE_B2F11A:
	CMP.b $1A				;$B2F11A
	BCC.b CODE_B2F120			;$B2F11C
	LDA.b $1A				;$B2F11E
CODE_B2F120:
	JSR.w CODE_B2F18F			;$B2F120
	STA.b $30,x				;$B2F123
	LDA.b $5C,x				;$B2F125
	BNE.b CODE_B2F138			;$B2F127
CODE_B2F129:
	LDY.w $15E4				;$B2F129
	BEQ.b CODE_B2F131			;$B2F12C
	JSR.w CODE_B2F275			;$B2F12E
CODE_B2F131:
	JSL.l process_current_movement		;$B2F131
	JML [$04F5]				;$B2F135

CODE_B2F138:
	DEC.b $5C,x				;$B2F138
	BEQ.b CODE_B2F157			;$B2F13A
	CMP.b $62,x				;$B2F13C
	BNE.b CODE_B2F129			;$B2F13E
	LDA.w $1973				;$B2F140
	SEC					;$B2F143
	SBC.w #$01A0				;$B2F144
	STA.w $1C37				;$B2F147
	STZ.w $15EC				;$B2F14A
	LDA.w #$0015				;$B2F14D
CODE_B2F150:
	STA.w $15E4				;$B2F150
	STZ.b $66,x				;$B2F153
	BRA.b CODE_B2F129			;$B2F155

CODE_B2F157:
	JSR.w CODE_B2F1F8			;$B2F157
	LDA.b $4C,x				;$B2F15A
	EOR.w #$0001				;$B2F15C
	STA.b $4C,x				;$B2F15F
	BEQ.b CODE_B2F179			;$B2F161
	LDA.w #$0056				;$B2F163
	STA.w $15EC				;$B2F166
	JSL.l CODE_BFF006			;$B2F169
	LDA.w #$0057				;$B2F16D
	JSL.l CODE_BFF006			;$B2F170
	LDA.w #$0013				;$B2F174
	BRA.b CODE_B2F150			;$B2F177

CODE_B2F179:
	LDA.w #$0055				;$B2F179
	STA.w $15EC				;$B2F17C
	JSL.l CODE_BFF006			;$B2F17F
	LDA.w #$0057				;$B2F183
	JSL.l CODE_BFF006			;$B2F186
	LDA.w #$0013				;$B2F18A
	BRA.b CODE_B2F150			;$B2F18D

CODE_B2F18F:
	STA.b $1E				;$B2F18F
	LDA.b $1C				;$B2F191
	JSR.w CODE_B2F1A1			;$B2F193
	CMP.w #$0010				;$B2F196
	BCS.b CODE_B2F19E			;$B2F199
	JSR.w CODE_B2F1A8			;$B2F19B
CODE_B2F19E:
	LDA.b $1E				;$B2F19E
	RTS					;$B2F1A0

CODE_B2F1A1:
	BPL.b CODE_B2F1A7			;$B2F1A1
	EOR.w #$FFFF				;$B2F1A3
	INC					;$B2F1A6
CODE_B2F1A7:
	RTS					;$B2F1A7

CODE_B2F1A8:
	JSR.w CODE_B2F1E7			;$B2F1A8
	CMP.b $40,x				;$B2F1AB
	BCC.b CODE_B2F1E6			;$B2F1AD
	CMP.b $42,x				;$B2F1AF
	BCS.b CODE_B2F1E6			;$B2F1B1
	LDA.b $5C,x				;$B2F1B3
	BNE.b CODE_B2F1E6			;$B2F1B5
	LDA.w $15E4				;$B2F1B7
	BNE.b CODE_B2F1E6			;$B2F1BA
	JSL.l CODE_808018			;$B2F1BC
	BIT.w #$0001				;$B2F1C0
	BNE.b CODE_B2F1E6			;$B2F1C3
	LDA.b $13,x				;$B2F1C5
	AND.w #$00FF				;$B2F1C7
	LSR					;$B2F1CA
	EOR.w #$FFFF				;$B2F1CB
	ADC.b $64,x				;$B2F1CE
	CMP.w #$0040				;$B2F1D0
	BCS.b CODE_B2F1D8			;$B2F1D3
	LDA.w #$0040				;$B2F1D5
CODE_B2F1D8:
	STA.b $5C,x				;$B2F1D8
	JSR.w CODE_B2F1E7			;$B2F1DA
	STA.b $60,x				;$B2F1DD
	SEC					;$B2F1DF
	SBC.w #$0070				;$B2F1E0
	STA.w $1C35				;$B2F1E3
CODE_B2F1E6:
	RTS					;$B2F1E6

CODE_B2F1E7:
	LDY.w active_kong_sprite		;$B2F1E7
	LDA.w $002A,y				;$B2F1EA
	CMP.w #$8000				;$B2F1ED
	ROR					;$B2F1F0
	CMP.w #$8000				;$B2F1F1
	ROR					;$B2F1F4
	ADC.b $12,x				;$B2F1F5
	RTS					;$B2F1F7

CODE_B2F1F8:
	LDA.w #$0003				;$B2F1F8
	STA.b $1E				;$B2F1FB
	LDA.w $1973				;$B2F1FD
	STA.b $1C				;$B2F200
CODE_B2F202:
	STA.w $1C37				;$B2F202
	LDA.b $60,x				;$B2F205
	STA.b $1A				;$B2F207
	JSL.l CODE_B880B1			;$B2F209
	BCC.b CODE_B2F21E			;$B2F20D
	LDA.w $1C37				;$B2F20F
	DEC.b $1E				;$B2F212
	BEQ.b CODE_B2F21E			;$B2F214
	CLC					;$B2F216
	ADC.w #$0040				;$B2F217
	STA.b $1C				;$B2F21A
	BRA.b CODE_B2F202			;$B2F21C

CODE_B2F21E:
	CMP.w $050F				;$B2F21E
	BCC.b CODE_B2F229			;$B2F221
	LDA.w $050F				;$B2F223
	SBC.w #$0020				;$B2F226
CODE_B2F229:
	CLC					;$B2F229
	ADC.w #$0030				;$B2F22A
	STA.w $1C37				;$B2F22D
	SBC.w $1973				;$B2F230
	SBC.w #$00F0				;$B2F233
	BCC.b CODE_B2F241			;$B2F236
	EOR.w #$FFFF				;$B2F238
	ADC.w $1C37				;$B2F23B
	STA.w $1C37				;$B2F23E
CODE_B2F241:
	LDA.w $1C37				;$B2F241
	RTS					;$B2F244

CODE_B2F245:
	LDA.b $60,x				;$B2F245
	SEC					;$B2F247
	SBC.w #$0010				;$B2F248
	STA.w $1830				;$B2F24B
	STA.w $1840				;$B2F24E
	CLC					;$B2F251
	ADC.w #$0020				;$B2F252
	STA.w $1834				;$B2F255
	STA.w $1844				;$B2F258
	LDA.w $1973				;$B2F25B
	SEC					;$B2F25E
	SBC.w #$0120				;$B2F25F
	STA.w $1832				;$B2F262
	STA.w $1842				;$B2F265
	LDA.w $1C37				;$B2F268
	STA.w $1836				;$B2F26B
	STA.w $1846				;$B2F26E
	STZ.w $183C				;$B2F271
	RTS					;$B2F274

CODE_B2F275:
	LDA.b $5C,x				;$B2F275
	BEQ.b CODE_B2F27A			;$B2F277
	RTS					;$B2F279

CODE_B2F27A:
	LDA.w $050F				;$B2F27A
	CLC					;$B2F27D
	ADC.w #$0010				;$B2F27E
	CMP.w $1C37				;$B2F281
	BNE.b CODE_B2F293			;$B2F284
	LDA.w $050F				;$B2F286
	LDY.w active_kong_sprite		;$B2F289
	STY.b $78				;$B2F28C
	CMP.w $0016,y				;$B2F28E
	BCC.b CODE_B2F309			;$B2F291
CODE_B2F293:
	JSR.w CODE_B2F245			;$B2F293
	LDA.b $66,x				;$B2F296
	BEQ.b CODE_B2F2A8			;$B2F298
	LDA.w $1C37				;$B2F29A
	SBC.w #$0060				;$B2F29D
	STA.w $1836				;$B2F2A0
	STA.w $1846				;$B2F2A3
	BRA.b CODE_B2F303			;$B2F2A6

CODE_B2F2A8:
	LDA.w #$0060				;$B2F2A8
	JSL.l CODE_BCE75E			;$B2F2AB
	BCC.b CODE_B2F303			;$B2F2AF
	LDA.w #$7F00				;$B2F2B1
	STA.b $3E				;$B2F2B4
	LDA.b $78				;$B2F2B6
	STA.b $40				;$B2F2B8
CODE_B2F2BA:
	LDY.b $78				;$B2F2BA
	LDA.w $0016,y				;$B2F2BC
	CMP.b $3E				;$B2F2BF
	BCS.b CODE_B2F2C7			;$B2F2C1
	STA.b $3E				;$B2F2C3
	STY.b $40				;$B2F2C5
CODE_B2F2C7:
	JSL.l CODE_BCE779			;$B2F2C7
	BCS.b CODE_B2F2BA			;$B2F2CB
	LDA.b $3E				;$B2F2CD
	ADC.w #$0030				;$B2F2CF
	STA.w $1C37				;$B2F2D2
	SBC.w #$0060				;$B2F2D5
	STA.w $1836				;$B2F2D8
	STA.w $1846				;$B2F2DB
	LDX.b current_sprite			;$B2F2DE
	INC.b $66,x				;$B2F2E0
	LDY.b $40				;$B2F2E2
	LDA.w #$0810				;$B2F2E4
	ORA.w $003C,y				;$B2F2E7
	STA.w $003C,y				;$B2F2EA
	LDA.b $1E,x				;$B2F2ED
	EOR.b $2A,x				;$B2F2EF
	AND.w #$4000				;$B2F2F1
	EOR.b $2A,x				;$B2F2F4
	AND.w #$C000				;$B2F2F6
	CLC					;$B2F2F9
	ADC.b current_sprite			;$B2F2FA
	SEC					;$B2F2FC
	SBC.w #aux_sprite_slot			;$B2F2FD
	STA.w $003E,y				;$B2F300
CODE_B2F303:
	JSL.l CODE_BEC012			;$B2F303
	BCC.b CODE_B2F322			;$B2F307
CODE_B2F309:
	LDA.w $003A,y				;$B2F309
	EOR.w #$0020				;$B2F30C
	AND.w #$0120				;$B2F30F
	BNE.b CODE_B2F322			;$B2F312
	LDA.w #$0025				;$B2F314
	JSL.l CODE_B88069			;$B2F317
	BCS.b CODE_B2F322			;$B2F31B
	LDA.b $78				;$B2F31D
	STA.w $17C8				;$B2F31F
CODE_B2F322:
	RTS					;$B2F322


the_end_sign_main:
knautilus_main:
	JMP.w (DATA_B2F326,x)			;$B2F323

DATA_B2F326:
	dw CODE_B2F332
	dw CODE_B2F391
	dw CODE_B2F3BA
	dw CODE_B2F3C3
	dw CODE_B2F3E5
	dw CODE_B2F3EC

CODE_B2F332:
	TYX					;$B2F332
	INC.b $38,x				;$B2F333
	LDA.w #$0001				;$B2F335
	TSB.w $0656				;$B2F338
	LDY.w #$030C				;$B2F33B
	JSL.l CODE_BB85B5			;$B2F33E
	LDY.w #$02E8				;$B2F342
	JSL.l CODE_BB8585			;$B2F345
	LDY.b alternate_sprite			;$B2F349
	LDX.b current_sprite			;$B2F34B
	STX.b $5C,y				;$B2F34D
	STY.b $3C,x				;$B2F34F
	LDA.w #$0100				;$B2F351
	BIT.w $05FD				;$B2F354
	BEQ.b CODE_B2F389			;$B2F357
	LDA.w #$0100				;$B2F359
	TRB.w $05FB				;$B2F35C
	LDA.w #$008D				;$B2F35F
	STA.b $16,x				;$B2F362
	LDA.w #$0004				;$B2F364
	STA.b $38,x				;$B2F367
	INC					;$B2F369
	STA.w $0038,y				;$B2F36A
	LDA.w $0024,y				;$B2F36D
	CLC					;$B2F370
	ADC.w #$0014				;$B2F371
	STA.w $0024,y				;$B2F374
	LDA.w #$0201				;$B2F377
	STA.w $04E4				;$B2F37A
	STZ.b $5B,x				;$B2F37D
	LDY.w #$02EA				;$B2F37F
	JSL.l CODE_BB85B8			;$B2F382
	JML [$04F5]				;$B2F386

CODE_B2F389:
	LDA.w #$0662				;$B2F389
	JSL.l queue_sound_effect		;$B2F38C
	TXY					;$B2F390
CODE_B2F391:
	LDA.b active_frame_counter		;$B2F391
	BIT.w #$0007				;$B2F393
	BNE.b CODE_B2F3B7			;$B2F396
	TYX					;$B2F398
	DEC.b $16,x				;$B2F399
	LDA.b $16,x				;$B2F39B
	CMP.w #$008C				;$B2F39D
	BCS.b CODE_B2F3B3			;$B2F3A0
	LDA.w #$0201				;$B2F3A2
	STA.w $04E4				;$B2F3A5
	STZ.b $5B,x				;$B2F3A8
	INC.b $38,x				;$B2F3AA
	LDY.w #$02EA				;$B2F3AC
	JSL.l CODE_BB85B8			;$B2F3AF
CODE_B2F3B3:
	JSL.l process_current_movement		;$B2F3B3
CODE_B2F3B7:
	JML [$04F5]				;$B2F3B7

CODE_B2F3BA:
	TYX					;$B2F3BA
	DEC.b $4E,x				;$B2F3BB
	BNE.b CODE_B2F3B3			;$B2F3BD
	INC.b $38,x				;$B2F3BF
	BRA.b CODE_B2F3B3			;$B2F3C1

CODE_B2F3C3:
	LDA.b active_frame_counter		;$B2F3C3
	BIT.w #$0007				;$B2F3C5
	BNE.b CODE_B2F3E5			;$B2F3C8
	TYX					;$B2F3CA
	LDA.b $4C,x				;$B2F3CB
	DEC.b $4C,x				;$B2F3CD
	BNE.b CODE_B2F3DB			;$B2F3CF
	INC.b $38,x				;$B2F3D1
	LDA.w #$0100				;$B2F3D3
	TRB.w $05FB				;$B2F3D6
	BRA.b CODE_B2F3B3			;$B2F3D9

CODE_B2F3DB:
	LDX.b $3C,y				;$B2F3DB
	LDA.b $24,x				;$B2F3DD
	CLC					;$B2F3DF
	ADC.w #$0005				;$B2F3E0
	STA.b $24,x				;$B2F3E3
CODE_B2F3E5:
	JSL.l process_current_movement		;$B2F3E5
	JML [$04F5]				;$B2F3E9

CODE_B2F3EC:
	JSR.w CODE_B2F881			;$B2F3EC
	JML [$04F5]				;$B2F3EF


krematoa_bridge_main:
	JMP (.state_table,x)			;$B2F3F2  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2F3F9  \
	INC sprite.state,x			;$B2F3FA   |
	LDY #$0310				;$B2F3FC   |
	JSL CODE_BB85B8				;$B2F3FF   |
	LDY #$0312				;$B2F403   |
	JSL CODE_BB85B8				;$B2F406   |
	LDY #$0314				;$B2F40A   |
	JSL CODE_BB85B8				;$B2F40D   |
	LDA #$0100				;$B2F411   |
	BIT $05FD				;$B2F414   |
	BNE .idle				;$B2F417   |
	LDA #$0777				;$B2F419   |
	JSL queue_sound_effect			;$B2F41C  /
.idle:
	TYX					;$B2F420  \
	LDA sprite.unknown_58,x			;$B2F421   |
	BEQ .return				;$B2F423   |
	LDA #$0100				;$B2F425   |
	BIT $05FD				;$B2F428   |
	BEQ .CODE_B2F42F			;$B2F42B   |
	STZ sprite.visibility,x			;$B2F42D  /
.CODE_B2F42F:
	LDA active_frame_counter		;$B2F42F  \
	BIT #$0007				;$B2F431   |
	BNE .return				;$B2F434   |
	SEP #$20				;$B2F436   |
	DEC sprite.unknown_58+1,x		;$B2F438   |
	REP #$20				;$B2F43A   |
	BNE .return				;$B2F43C   |
	LDA sprite.general_purpose_5C,x		;$B2F43E   |
	BEQ .return				;$B2F440   |
	JSL queue_sound_effect			;$B2F442   |
	LDA #$0100				;$B2F446   |
	TSB $05FD				;$B2F449  /
.return:
	JML [$04F5]				;$B2F44C  |>


player_krosshair_controller_main:
	LDA.w #$0001				;$B2F44F
	BIT.w $05AF				;$B2F452
	BNE.b CODE_B2F46E			;$B2F455
	LDA.w #$002B				;$B2F457
	JSL.l CODE_B88069			;$B2F45A
	JSR.w CODE_B2F471			;$B2F45E
	JSL.l process_current_movement		;$B2F461
	LDA.b $28,x				;$B2F465
	AND.w #$0003				;$B2F467
	BEQ.b CODE_B2F46E			;$B2F46A
	STZ.b $2E,x				;$B2F46C
CODE_B2F46E:
	JML [$04F5]				;$B2F46E

CODE_B2F471:
	TYX					;$B2F471
	LDA.w player_active_held		;$B2F472
	AND.w #$0300				;$B2F475
	BEQ.b CODE_B2F48B			;$B2F478
	LDY.b $62,x				;$B2F47A
	BIT.w #$0100				;$B2F47C
	BNE.b CODE_B2F489			;$B2F47F
	LDA.b [$6A],y				;$B2F481
	EOR.w #$FFFF				;$B2F483
	INC					;$B2F486
	BRA.b CODE_B2F48B			;$B2F487

CODE_B2F489:
	LDA.b [$6A],y				;$B2F489
CODE_B2F48B:
	STA.b $30,x				;$B2F48B
	LDA.w player_active_held		;$B2F48D
	AND.w #$0C00				;$B2F490
	BEQ.b CODE_B2F4A6			;$B2F493
	LDY.b $62,x				;$B2F495
	BIT.w #$0400				;$B2F497
	BNE.b CODE_B2F4A4			;$B2F49A
	LDA.b [$6A],y				;$B2F49C
	EOR.w #$FFFF				;$B2F49E
	INC					;$B2F4A1
	BRA.b CODE_B2F4A6			;$B2F4A2

CODE_B2F4A4:
	LDA.b [$6A],y				;$B2F4A4
CODE_B2F4A6:
	STA.b $34,x				;$B2F4A6
	LDY.w #$0006				;$B2F4A8
	LDA.w player_active_held		;$B2F4AB
	AND.w #$4000				;$B2F4AE
	BEQ.b CODE_B2F4B6			;$B2F4B1
	LDY.w #$0008				;$B2F4B3
CODE_B2F4B6:
	STY.b $62,x				;$B2F4B6
	LDA.b $5C,x				;$B2F4B8
	BEQ.b CODE_B2F4BF			;$B2F4BA
	DEC.b $5C,x				;$B2F4BC
	RTS					;$B2F4BE

CODE_B2F4BF:
	LDA.w player_active_pressed		;$B2F4BF
	AND.w #$8080				;$B2F4C2
	BEQ.b CODE_B2F4CF			;$B2F4C5
	INC.w $15E8				;$B2F4C7
	LDA.b $5E,x				;$B2F4CA
	STA.b $5C,x				;$B2F4CC
	RTS					;$B2F4CE

CODE_B2F4CF:
	LDA.w player_active_pressed		;$B2F4CF
	BIT.w #$1000				;$B2F4D2
	BNE.b CODE_B2F4D8			;$B2F4D5
	RTS					;$B2F4D7

CODE_B2F4D8:
	LDA.w screen_brightness			;$B2F4D8
	BEQ.b CODE_B2F4F0			;$B2F4DB
	CMP.w #$0100				;$B2F4DD
	BCS.b CODE_B2F4F0			;$B2F4E0
	LDA.w #$2000				;$B2F4E2
	BIT.w $05AF				;$B2F4E5
	BNE.b CODE_B2F4F0			;$B2F4E8
	LDA.w #$0010				;$B2F4EA
	TSB.w $05B1				;$B2F4ED
CODE_B2F4F0:
	RTS					;$B2F4F0


unknown_sprite_01DC_main:
	JMP.w (DATA_B2F4F4,x)			;$B2F4F1

DATA_B2F4F4:
	dw CODE_B2F4FA
	dw CODE_B2F527
	dw CODE_B2F539

CODE_B2F4FA:
	LDA.w #$0100				;$B2F4FA
	TSB.w $05FB				;$B2F4FD
	LDA.w #$0100				;$B2F500
	BIT.w $05FD				;$B2F503
	BNE.b CODE_B2F544			;$B2F506
	LDA.b active_frame_counter		;$B2F508
	BIT.w #$0003				;$B2F50A
	BNE.b CODE_B2F54F			;$B2F50D
	TYX					;$B2F50F
	LDA.b $5C,x				;$B2F510
	CMP.w #$0020				;$B2F512
	BCS.b CODE_B2F51C			;$B2F515
	JSR.w CODE_B2F552			;$B2F517
	LDX.b current_sprite			;$B2F51A
CODE_B2F51C:
	DEC.b $5C,x				;$B2F51C
	BPL.b CODE_B2F54F			;$B2F51E
	INC.b $38,x				;$B2F520
	LDA.w #$0020				;$B2F522
	STA.b $5C,x				;$B2F525
CODE_B2F527:
	TYX					;$B2F527
	DEC.b $5C,x				;$B2F528
	BPL.b CODE_B2F54F			;$B2F52A
	LDA.w #$0020				;$B2F52C
	TSB.w $0601				;$B2F52F
	INC.b $38,x				;$B2F532
	LDA.w #$0040				;$B2F534
	STA.b $5C,x				;$B2F537
CODE_B2F539:
	TYX					;$B2F539
	DEC.b $5C,x				;$B2F53A
	BPL.b CODE_B2F54F			;$B2F53C
	LDA.w #$0601				;$B2F53E
	STA.w $04E4				;$B2F541
CODE_B2F544:
	LDY.w #$02E6				;$B2F544
	JSL.l CODE_BB8585			;$B2F547
	JSL.l delete_sprite_handle_deallocation	;$B2F54B
CODE_B2F54F:
	JML [$04F5]				;$B2F54F

CODE_B2F552:
	LDA.w $005C,y				;$B2F552
	LSR					;$B2F555
	SBC.w #$0005				;$B2F556
	BPL.b CODE_B2F55C			;$B2F559
	TDC					;$B2F55B
CODE_B2F55C:
	STA.w $15E4				;$B2F55C
	LDA.w #$00FE				;$B2F55F
	STA.b $1E				;$B2F562
	LDA.w #$001F				;$B2F564
	SEC					;$B2F567
	SBC.w $005C,y				;$B2F568
	LDX.w #$003C				;$B2F56B
	LDY.w #$004B				;$B2F56E
	JSL.l CODE_BBC821			;$B2F571
	LDA.w #$0200				;$B2F575
	TSB.w $05FD				;$B2F578
	LDA.w #$0100				;$B2F57B
	STA.w $15E8				;$B2F57E
	RTS					;$B2F581


unknown_sprite_01E0_main:
	JMP.w (DATA_B2F585,x)			;$B2F582

DATA_B2F585:
	dw CODE_B2F58D
	dw CODE_B2F5B1
	dw CODE_B2F5BB
	dw CODE_B2F606

CODE_B2F58D:
	TYX					;$B2F58D
	INC.b $38,x				;$B2F58E
	LDY.w #$0330				;$B2F590
	JSL.l CODE_BB85B8			;$B2F593
	LDA.w #$0040				;$B2F597
	BIT.w $05FD				;$B2F59A
	BEQ.b CODE_B2F5AE			;$B2F59D
	JSL.l CODE_80807E			;$B2F59F
	LDY.w #$00D8				;$B2F5A3
	JSL.l CODE_BB85B8			;$B2F5A6
	JSL.l CODE_808081			;$B2F5AA
CODE_B2F5AE:
	JML [$04F5]				;$B2F5AE

CODE_B2F5B1:
	LDA.w $15E8				;$B2F5B1
	BEQ.b CODE_B2F5AE			;$B2F5B4
	TYX					;$B2F5B6
	INC.b $38,x				;$B2F5B7
	STZ.b active_frame_counter		;$B2F5B9
CODE_B2F5BB:
	LDA.b active_frame_counter		;$B2F5BB
	BIT.w #$001F				;$B2F5BD
	BNE.b CODE_B2F5AE			;$B2F5C0
	TYX					;$B2F5C2
	SEC					;$B2F5C3
	ROR.b $5C,x				;$B2F5C4
	LDA.b $5E,x				;$B2F5C6
	CLC					;$B2F5C8
	ADC.w #$0665				;$B2F5C9
	CMP.w #$0669				;$B2F5CC
	BCC.b CODE_B2F5D5			;$B2F5CF
	CLC					;$B2F5D1
	ADC.w #$0003				;$B2F5D2
CODE_B2F5D5:
	JSL.l queue_sound_effect		;$B2F5D5
	INC.b $5E,x				;$B2F5D9
	LDA.b $5C,x				;$B2F5DB
	CMP.w #$FFFF				;$B2F5DD
	BNE.b CODE_B2F5AE			;$B2F5E0
	STZ.w $073C				;$B2F5E2
	INC.b $38,x				;$B2F5E5
	LDY.w #$032E				;$B2F5E7
	JSL.l CODE_BB8585			;$B2F5EA
	LDX.b alternate_sprite			;$B2F5EE
	STX.w $15EC				;$B2F5F0
	JSR.w CODE_B2DF5D			;$B2F5F3
	JSR.w CODE_B2DF82			;$B2F5F6
	LDA.w #$0100				;$B2F5F9
	STA.w $15E8				;$B2F5FC
	LDA.w #$0679				;$B2F5FF
	JSL.l queue_sound_effect		;$B2F602
CODE_B2F606:
	INC.w $15E8				;$B2F606
	LDA.b active_frame_counter		;$B2F609
	BIT.w #$0003				;$B2F60B
	BNE.b CODE_B2F62B			;$B2F60E
	LDA.l $7E318E				;$B2F610
	STA.b $1A				;$B2F614
	LDX.w #$000C				;$B2F616
CODE_B2F619:
	LDA.l $7E3180,x				;$B2F619
	STA.l $7E3182,x				;$B2F61D
	DEX					;$B2F621
	DEX					;$B2F622
	BPL.b CODE_B2F619			;$B2F623
	LDA.b $1A				;$B2F625
	STA.l $7E3180				;$B2F627
CODE_B2F62B:
	LDA.w $15E8				;$B2F62B
	CMP.w #$01C0				;$B2F62E
	BCC.b CODE_B2F64B			;$B2F631
	LDA.w #$0001				;$B2F633
	STA.w $15E6				;$B2F636
	LDA.w #$0462				;$B2F639
	JSL.l queue_sound_effect		;$B2F63C
	JSL.l delete_sprite_handle_deallocation	;$B2F640
	LDX.w $15EC				;$B2F644
	JSL.l CODE_BB85E8			;$B2F647
CODE_B2F64B:
	JML [$04F5]				;$B2F64B


mama_bird_barrier_gem_main:
	LDA $15E8				;$B2F64E  \
	BIT #$FF00				;$B2F651   |
	BEQ CODE_B2F68E				;$B2F654   |
	CMP #$0180				;$B2F656   |
	BCC CODE_B2F684				;$B2F659   |
	LDA #$037A				;$B2F65B   |
	JSL queue_sound_effect			;$B2F65E   |
	LDA #$040C				;$B2F662   |
	JSL queue_sound_effect			;$B2F665   |
	LDA #$050F				;$B2F669   |
	JSL queue_sound_effect			;$B2F66C   |
	LDA #$0629				;$B2F670   |
	JSL queue_sound_effect			;$B2F673   |
	LDA #$074F				;$B2F677   |
	JSL queue_sound_effect			;$B2F67A   |
	JSL delete_sprite_handle_deallocation	;$B2F67E   |
	BRA CODE_B2F68E				;$B2F682  /

CODE_B2F684:
	TYX					;$B2F684  \
	JSL CODE_808018				;$B2F685   |
	AND #$0101				;$B2F689   |
	STA sprite.unknown_58,x			;$B2F68C  /
CODE_B2F68E:
	JML [$04F5]				;$B2F68E  |>


krool_head_main:
	JMP.w (DATA_B2F694,x)			;$B2F691

DATA_B2F694:
	dw CODE_B2F69C
	dw CODE_B2F6B3
	dw CODE_B2F6E3
	dw CODE_B2F6F1

CODE_B2F69C:
	TYX					;$B2F69C
	INC.b $38,x				;$B2F69D
	LDA.b $12,x				;$B2F69F
	STA.b $54,x				;$B2F6A1
	STA.b $2C,x				;$B2F6A3
	LDA.b $16,x				;$B2F6A5
	STA.b $56,x				;$B2F6A7
	STA.b $32,x				;$B2F6A9
	LDA.w #$8000				;$B2F6AB
	TRB.w $05AF				;$B2F6AE
	STZ.b $BC				;$B2F6B1
CODE_B2F6B3:
	JSR.w CODE_B2F703			;$B2F6B3
	JSR.w CODE_B2F763			;$B2F6B6
	JSR.w CODE_B2F797			;$B2F6B9
	LDA.b $12,x				;$B2F6BC
	SEC					;$B2F6BE
	SBC.w $196D				;$B2F6BF
	SBC.w #$007F				;$B2F6C2
	EOR.w #$FFFF				;$B2F6C5
	INC					;$B2F6C8
	STA.w $1C49				;$B2F6C9
	LDA.b $16,x				;$B2F6CC
	SEC					;$B2F6CE
	SBC.w $1973				;$B2F6CF
	SBC.w #$0099				;$B2F6D2
	EOR.w #$FFFF				;$B2F6D5
	INC					;$B2F6D8
	STA.w $1C4B				;$B2F6D9
	JSL.l process_sprite_animation		;$B2F6DC
	JML [$04F5]				;$B2F6E0

CODE_B2F6E3:
	JSR.w CODE_B2F881			;$B2F6E3
CODE_B2F6E6:
	JSL.l process_sprite_animation		;$B2F6E6
	JSL.l process_current_movement		;$B2F6EA
	JML [$04F5]				;$B2F6EE

CODE_B2F6F1:
	LDA.w $005A,y				;$B2F6F1
	BNE.b CODE_B2F6E6			;$B2F6F4
	LDX.b $5C,y				;$B2F6F6
	LDA.b $16,x				;$B2F6F8
	SEC					;$B2F6FA
	SBC.w #$0030				;$B2F6FB
	STA.w $0016,y				;$B2F6FE
	BRA.b CODE_B2F6E6			;$B2F701

CODE_B2F703:
	TYX					;$B2F703
	INC.b $6A,x				;$B2F704
	LDA.b $6A,x				;$B2F706
	CMP.w #$7000				;$B2F708
	BPL.b CODE_B2F75C			;$B2F70B
	CMP.w #$0110				;$B2F70D
	BMI.b CODE_B2F72B			;$B2F710
	BNE.b CODE_B2F71E			;$B2F712
	LDA.w #$0359				;$B2F714
	JSL.l set_sprite_animation		;$B2F717
	LDY.b current_sprite			;$B2F71B
	RTS					;$B2F71D

CODE_B2F71E:
	CMP.w #$0180				;$B2F71E
	BNE.b CODE_B2F72B			;$B2F721
	LDY.b current_sprite			;$B2F723
	LDX.w $1C4D				;$B2F725
	STY.b $5C,x				;$B2F728
	RTS					;$B2F72A

CODE_B2F72B:
	CMP.w #$0386				;$B2F72B
	BNE.b CODE_B2F745			;$B2F72E
	LDA.w #$00E6				;$B2F730
	STA.b $0E,x				;$B2F733
	LDA.w #$00F2				;$B2F735
	JSL.l CODE_BB85A0			;$B2F738
	LDA.w #$035A				;$B2F73C
	JSL.l set_sprite_animation		;$B2F73F
	TXY					;$B2F743
	RTS					;$B2F744

CODE_B2F745:
	CMP.w #$0500				;$B2F745
	BNE.b CODE_B2F752			;$B2F748
	LDY.w #$0346				;$B2F74A
	JSL.l CODE_BB8585			;$B2F74D
	RTS					;$B2F751

CODE_B2F752:
	BMI.b CODE_B2F75F			;$B2F752
	LDA.w player_active_pressed		;$B2F754
	BIT.w #$9080				;$B2F757
	BEQ.b CODE_B2F75F			;$B2F75A
CODE_B2F75C:
	JSR.w CODE_B28603			;$B2F75C
CODE_B2F75F:
	RTS					;$B2F75F

CODE_B2F760:
	DEC.b $6A,x				;$B2F760
	RTS					;$B2F762

CODE_B2F763:
	LDX.b current_sprite			;$B2F763
	LDA.b $6A,x				;$B2F765
	CMP.w #$0170				;$B2F767
	BPL.b CODE_B2F796			;$B2F76A
	LDA.b $16,x				;$B2F76C
	CMP.w #$0248				;$B2F76E
	BCC.b CODE_B2F796			;$B2F771
	LDA.b $5C,x				;$B2F773
	BNE.b CODE_B2F794			;$B2F775
	LDY.w #$0334				;$B2F777
	JSL.l CODE_BB8585			;$B2F77A
	BCS.b CODE_B2F78D			;$B2F77E
	LDX.b alternate_sprite			;$B2F780
	JSL.l CODE_808018			;$B2F782
	AND.w #$003F				;$B2F786
	ADC.b $12,x				;$B2F789
	STA.b $12,x				;$B2F78B
CODE_B2F78D:
	LDX.b current_sprite			;$B2F78D
	LDA.w #$0004				;$B2F78F
	STA.b $5C,x				;$B2F792
CODE_B2F794:
	DEC.b $5C,x				;$B2F794
CODE_B2F796:
	RTS					;$B2F796

CODE_B2F797:
	LDA.b $12,x				;$B2F797
	STA.b $54,x				;$B2F799
	LDA.b $16,x				;$B2F79B
	STA.b $56,x				;$B2F79D
	LDA.b $2C,x				;$B2F79F
	STA.b $12,x				;$B2F7A1
	LDA.b $32,x				;$B2F7A3
	STA.b $16,x				;$B2F7A5
	JSL.l process_current_movement		;$B2F7A7
	LDX.b current_sprite			;$B2F7AB
	LDA.b $2C,x				;$B2F7AD
	LDY.b $12,x				;$B2F7AF
	STA.b $12,x				;$B2F7B1
	STY.b $2C,x				;$B2F7B3
	LDA.b $32,x				;$B2F7B5
	LDY.b $16,x				;$B2F7B7
	STA.b $16,x				;$B2F7B9
	STY.b $32,x				;$B2F7BB
	RTS					;$B2F7BD


mama_bird_egg:
	JMP (.state_table,x)			;$B2F7BE  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2F7C5  \
	DEC sprite.general_purpose_50,x		;$B2F7C6   |
	BNE ..CODE_B2F7D4			;$B2F7C8   |
	LDA #$057A				;$B2F7CA   |
	JSL CODE_B28027				;$B2F7CD   |
	STZ $044A				;$B2F7D1  /
..CODE_B2F7D4:
	LDX sprite.general_purpose_5C,y		;$B2F7D4  \
	BEQ ..CODE_B2F80B			;$B2F7D6   |
	LDA sprite.x_position,x			;$B2F7D8   |
	STA.w sprite.x_position,y		;$B2F7DA   |
	LDA.w sprite.movement_state,y		;$B2F7DD   |
	BNE ..CODE_B2F804			;$B2F7E0   |
	LDA #$0001				;$B2F7E2   |
	STA.w sprite.state,y			;$B2F7E5   |
	LDA #$0108				;$B2F7E8   |
	STA sprite.movement_state,x		;$B2F7EB   |
	LDA #$0202				;$B2F7ED   |
	STA sprite.general_purpose_64,x		;$B2F7F0   |
	LDA #$0080				;$B2F7F2   |
	STA sprite.max_y_speed,x		;$B2F7F5   |
	STA sprite.general_purpose_66,x		;$B2F7F7   |
	LDA #$0250				;$B2F7F9   |
	STA sprite.general_purpose_5E,x		;$B2F7FC   |
	LDA #$01E0				;$B2F7FE   |
	STA.w sprite.general_purpose_5E,y	;$B2F801  /
..CODE_B2F804:
	JSL process_current_movement		;$B2F804  \
	JML [$04F5]				;$B2F808  /

..CODE_B2F80B:
	LDA active_frame_counter		;$B2F80B  \
	BIT #$001F				;$B2F80D   |
	BNE ..CODE_B2F819			;$B2F810   |
	LDA #$0648				;$B2F812   |
	JSL CODE_B28027				;$B2F815  /
..CODE_B2F819:
	JML [$04F5]				;$B2F819  |>

.idle:
	LDX sprite.general_purpose_5C,y		;$B2F81C  \
	LDA sprite.x_position,x			;$B2F81E   |
	STA.w sprite.x_position,y		;$B2F820   |
	LDA sprite.unknown_32,x			;$B2F823   |
	CLC					;$B2F825   |
	ADC #$0030				;$B2F826   |
	STA.w sprite.y_position,y		;$B2F829   |
	LDA.w sprite.general_purpose_5E,y	;$B2F82C   |
	BEQ ..CODE_B2F844			;$B2F82F   |
	LDA sprite.max_x_speed,x		;$B2F831   |
	SEC					;$B2F833   |
	SBC #$0008				;$B2F834   |
	BPL.b ..CODE_B2F83A			;$B2F837   |
	TDC					;$B2F839  /
..CODE_B2F83A:
	STA sprite.max_x_speed,x		;$B2F83A  \
	TYX					;$B2F83C   |
	DEC sprite.general_purpose_5E,x		;$B2F83D   |
	BNE ..CODE_B2F844			;$B2F83F   |
	JSR CODE_B2F84B				;$B2F841  /
..CODE_B2F844:
	JSL.l process_current_movement		;$B2F844  \
	JML [$04F5]				;$B2F848  /

CODE_B2F84B:
	LDA #$077B				;$B2F84B  \
	JSL CODE_B28027				;$B2F84E   |
	LDY #$033A				;$B2F852   |
	JSL CODE_BB8585				;$B2F855   |
	LDY #$033C				;$B2F859   |
	JSL CODE_BB8585				;$B2F85C   |
	LDY #$033E				;$B2F860   |
	JSL CODE_BB8585				;$B2F863   |
	LDY current_sprite			;$B2F867   |
	LDA.w sprite.general_purpose_5C,y	;$B2F869   |
	LDX alternate_sprite			;$B2F86C   |
	STA sprite.general_purpose_5C,x		;$B2F86E   |
	LDY #$0340				;$B2F870   |
	JSL CODE_BB8585				;$B2F873   |
	LDY current_sprite			;$B2F877   |
	LDA.w sprite.general_purpose_5C,y	;$B2F879   |
	LDX alternate_sprite			;$B2F87C   |
	STA sprite.general_purpose_5C,x		;$B2F87E   |
	RTS					;$B2F880  /

CODE_B2F881:
	LDX sprite.general_purpose_5C,y		;$B2F881  \
	LDA sprite.x_position,x			;$B2F883   |
	STA.w sprite.x_position,y		;$B2F885   |
	LDA sprite.y_position,x			;$B2F888   |
	STA.w sprite.y_position,y		;$B2F88A   |
	RTS					;$B2F88D  /


funky_cranky_secret_ending_main:
	JMP.w (DATA_B2F891,x)			;$B2F88E

DATA_B2F891:
	dw CODE_B2F899
	dw CODE_B2F8CC
	dw CODE_B2F8FC
	dw CODE_B2F914

CODE_B2F899:
	TYX					;$B2F899
	INC.b $38,x				;$B2F89A
	JSL.l process_current_movement		;$B2F89C
	LDA.b $12,x				;$B2F8A0
	CLC					;$B2F8A2
	ADC.w #$00E0				;$B2F8A3
	STA.b $12,x				;$B2F8A6
	STZ.w $073C				;$B2F8A8
	STZ.w $074C				;$B2F8AB
	LDY.w #$0344				;$B2F8AE
	JSL.l CODE_BB8585			;$B2F8B1
	LDX.b alternate_sprite			;$B2F8B5
	LDA.b current_sprite			;$B2F8B7
	STA.b $5C,x				;$B2F8B9
	PHX					;$B2F8BB
	LDY.w #$0348				;$B2F8BC
	JSL.l CODE_BB8585			;$B2F8BF
	LDX.b alternate_sprite			;$B2F8C3
	LDY.b current_sprite			;$B2F8C5
	STY.b $5C,x				;$B2F8C7
	PLA					;$B2F8C9
	STA.b $5E,x				;$B2F8CA
CODE_B2F8CC:
	TYX					;$B2F8CC
	DEC.b $4C,x				;$B2F8CD
	BPL.b CODE_B2F8F9			;$B2F8CF
	JSL.l CODE_808018			;$B2F8D1
	BIT.w #$003F				;$B2F8D5
	BNE.b CODE_B2F8E1			;$B2F8D8
	LDA.w #$0767				;$B2F8DA
	JSL.l CODE_B28027			;$B2F8DD
CODE_B2F8E1:
	LDA.b $1E,x				;$B2F8E1
	BIT.b $30,x				;$B2F8E3
	BPL.b CODE_B2F8EC			;$B2F8E5
	ORA.w #$4000				;$B2F8E7
	BRA.b CODE_B2F8EF			;$B2F8EA

CODE_B2F8EC:
	AND.w #$BFFF				;$B2F8EC
CODE_B2F8EF:
	STA.b $1E,x				;$B2F8EF
	JSL.l process_current_movement		;$B2F8F1
	JSL.l process_sprite_animation		;$B2F8F5
CODE_B2F8F9:
	JML [$04F5]				;$B2F8F9

CODE_B2F8FC:
	JSR.w CODE_B2F881			;$B2F8FC
	LDA.b $1E,x				;$B2F8FF
	EOR.w $001E,y				;$B2F901
	AND.w #$4000				;$B2F904
CODE_B2F907:
	EOR.w $001E,y				;$B2F907
	STA.w $001E,y				;$B2F90A
	JSL.l process_sprite_animation		;$B2F90D
	JML [$04F5]				;$B2F911

CODE_B2F914:
	JSR.w CODE_B2F881			;$B2F914
	JSR.w CODE_B2F9A2			;$B2F917
	LDA.b $1E,x				;$B2F91A
	EOR.w $001E,y				;$B2F91C
	AND.w #$4000				;$B2F91F
	BEQ.b CODE_B2F907			;$B2F922
	JSR.w CODE_B2F931			;$B2F924
	DEC.b $4E,x				;$B2F927
	BEQ.b CODE_B2F962			;$B2F929
	LDA.w #$4000				;$B2F92B
	TXY					;$B2F92E
	BRA.b CODE_B2F907			;$B2F92F

CODE_B2F931:
	LDA.w #$0566				;$B2F931
	JSL.l CODE_B28027			;$B2F934
	LDA.w #$0100				;$B2F938
	STA.b $4C,x				;$B2F93B
	JSR.w CODE_B2F955			;$B2F93D
	LDA.w $004E,y				;$B2F940
	DEC					;$B2F943
	DEC					;$B2F944
	AND.w #$0003				;$B2F945
	BNE.b CODE_B2F94C			;$B2F948
	ASL.b $30,x				;$B2F94A
CODE_B2F94C:
	CLC					;$B2F94C
	ADC.w #$035F				;$B2F94D
	JSL.l set_sprite_animation		;$B2F950
	RTS					;$B2F954

CODE_B2F955:
	LDA.w #$0140				;$B2F955
	BIT.b $30,x				;$B2F958
	BPL.b CODE_B2F95F			;$B2F95A
	LDA.w #$FEC0				;$B2F95C
CODE_B2F95F:
	STA.b $30,x				;$B2F95F
	RTS					;$B2F961

CODE_B2F962:
	LDA.w #$064F				;$B2F962
	JSL.l queue_sound_effect		;$B2F965
	LDA.w #$0750				;$B2F969
	JSL.l queue_sound_effect		;$B2F96C
	TXY					;$B2F970
	LDX.b $5C,y				;$B2F971
	JSL.l CODE_BB85E8			;$B2F973
	LDA.w #$0500				;$B2F977
	JSL.l CODE_B28027			;$B2F97A
	TXY					;$B2F97E
	LDX.b $5E,y				;$B2F97F
	JSL.l CODE_BB85E8			;$B2F981
	LDY.w #$0368				;$B2F985
	JSL.l CODE_BB8585			;$B2F988
	LDA.b alternate_sprite			;$B2F98C
	PHA					;$B2F98E
	LDY.w #$036A				;$B2F98F
	JSL.l CODE_BB8588			;$B2F992
	LDX.b alternate_sprite			;$B2F996
	PLA					;$B2F998
	STA.b $5C,x				;$B2F999
	JSL.l delete_sprite_handle_deallocation	;$B2F99B
	JML [$04F5]				;$B2F99F

CODE_B2F9A2:
	LDA.w #$FFC8				;$B2F9A2
	BIT.b $30,x				;$B2F9A5
	BPL.b CODE_B2F9AC			;$B2F9A7
	LDA.w #$0038				;$B2F9A9
CODE_B2F9AC:
	CLC					;$B2F9AC
	ADC.w $0012,y				;$B2F9AD
	STA.w $0012,y				;$B2F9B0
	RTS					;$B2F9B3


map_banana_bird_main:
	JMP (.state_table,x)			;$B2F9B4  |>

.state_table:
	dw .init
	dw CODE_B2F9DB
	dw CODE_B2F9E6

.init:
	TYX					;$B2F9BD  \
	INC sprite.state,x			;$B2F9BE   |
	LDA #$0005				;$B2F9C0   |
	STA $60					;$B2F9C3   |
	LDA #$0374				;$B2F9C5   |
	STA $62					;$B2F9C8  /
CODE_B2F9CA:
	LDY $62					;$B2F9CA  \
	INC $62					;$B2F9CC   |
	INC $62					;$B2F9CE   |
	JSL CODE_BB85B8				;$B2F9D0   |
	DEC $60					;$B2F9D4   |
	BNE.b CODE_B2F9CA			;$B2F9D6   |
	JML [$04F5]				;$B2F9D8  /

CODE_B2F9DB:
	JSR CODE_B2F9F1				;$B2F9DB  \
	LDA.w sprite.movement_state,y		;$B2F9DE   |
	BNE CODE_B2F9E6				;$B2F9E1   |
	JSR CODE_B2CDFC				;$B2F9E3  /
CODE_B2F9E6:
	JSL process_current_movement		;$B2F9E6  \
	JSL process_sprite_animation		;$B2F9EA   |
	JML [$04F5]				;$B2F9EE  /

CODE_B2F9F1:
	LDX active_kong_sprite			;$B2F9F1  \
	JSR CODE_B2FA6E				;$B2F9F4   |
	LDX follower_kong_sprite		;$B2F9F7   |
	JSR CODE_B2FA6E				;$B2F9FA   |
	RTS					;$B2F9FD  /


map_mama_bird_main:
	JMP.w (DATA_B2FA01,x)			;$B2F9FE

DATA_B2FA01:
	dw CODE_B2FA07
	dw CODE_B2FA0E
	dw CODE_B2FA41

CODE_B2FA07:
	TYX					;$B2FA07
	DEC.b $4C,x				;$B2FA08
	BNE.b CODE_B2FA55			;$B2FA0A
	INC.b $38,x				;$B2FA0C
CODE_B2FA0E:
	TYX					;$B2FA0E
	INC.b $38,x				;$B2FA0F
	LDA.b $40,x				;$B2FA11
	STA.b $5E,x				;$B2FA13
	LDY.w #$0364				;$B2FA15
	JSL.l CODE_BB8585			;$B2FA18
	LDY.b current_sprite			;$B2FA1C
	LDX.b alternate_sprite			;$B2FA1E
	STX.b $60,y				;$B2FA20
	LDA.b $24,x				;$B2FA22
	STA.b $5E,x				;$B2FA24
	LDA.w #DATA_B2FA96			;$B2FA26
	STA.b $64,x				;$B2FA29
	LDY.w #$0366				;$B2FA2B
	JSL.l CODE_BB8585			;$B2FA2E
	LDY.b current_sprite			;$B2FA32
	LDX.b alternate_sprite			;$B2FA34
	STX.b $62,y				;$B2FA36
	LDA.b $24,x				;$B2FA38
	STA.b $5E,x				;$B2FA3A
	LDA.w #DATA_B2FA9E			;$B2FA3C
	STA.b $64,x				;$B2FA3F
CODE_B2FA41:
	JSL.l process_current_movement		;$B2FA41
	JSL.l process_anim_preserve_state	;$B2FA45
	LDY.b current_sprite			;$B2FA49
	LDX.b $60,y				;$B2FA4B
	JSR.w CODE_B2FA58			;$B2FA4D
	LDX.b $62,y				;$B2FA50
	JSR.w CODE_B2FA58			;$B2FA52
CODE_B2FA55:
	JML [$04F5]				;$B2FA55

CODE_B2FA58:
	LDA.w $0040,y				;$B2FA58
	SEC					;$B2FA5B
	SBC.w $005E,y				;$B2FA5C
	JSR.w CODE_B2FA85			;$B2FA5F
	ASL					;$B2FA62
	STA.b $1A				;$B2FA63
	ASL					;$B2FA65
	ASL					;$B2FA66
	CLC					;$B2FA67
	ADC.b $1A				;$B2FA68
	ADC.b $5E,x				;$B2FA6A
	STA.b $24,x				;$B2FA6C
CODE_B2FA6E:
	LDA.w $0012,y				;$B2FA6E
	STA.b $12,x				;$B2FA71
	LDA.w $0016,y				;$B2FA73
	STA.b $16,x				;$B2FA76
	LDA.w $001E,y				;$B2FA78
	EOR.b $1E,x				;$B2FA7B
	AND.w #$7000				;$B2FA7D
	EOR.b $1E,x				;$B2FA80
	STA.b $1E,x				;$B2FA82
	RTS					;$B2FA84

CODE_B2FA85:
	PHA					;$B2FA85
	CLC					;$B2FA86
	ADC.b $64,x				;$B2FA87
	TAY					;$B2FA89
	LDA.w $0000,y				;$B2FA8A
	AND.w #$00FF				;$B2FA8D
	LDY.b current_sprite			;$B2FA90
	STA.b $0E,x				;$B2FA92
	PLA					;$B2FA94
	RTS					;$B2FA95

DATA_B2FA96:
	db $D8,$D8,$D8,$E4,$E4,$E4,$D8,$D8

DATA_B2FA9E:
	db $E4,$E4,$E4,$D8,$D8,$D8,$E4,$E4


squirt_pupil_main:
	JMP.w (DATA_B2FAA9,x)			;$B2FAA6

DATA_B2FAA9:
	dw CODE_B2FAAD
	dw CODE_B2FAD2

CODE_B2FAAD:
	LDA.w $0012,y				;$B2FAAD
	SEC					;$B2FAB0
	SBC.w #$0003				;$B2FAB1
	STA.w $005C,y				;$B2FAB4
	CLC					;$B2FAB7
	ADC.w #$0006				;$B2FAB8
	STA.w $005E,y				;$B2FABB
	LDA.w $0016,y				;$B2FABE
	SEC					;$B2FAC1
	SBC.w #$0003				;$B2FAC2
	STA.w $0060,y				;$B2FAC5
	CLC					;$B2FAC8
	ADC.w #$0006				;$B2FAC9
	STA.w $0062,y				;$B2FACC
	TYX					;$B2FACF
	INC.b $38,x				;$B2FAD0
CODE_B2FAD2:
	LDX.w active_kong_sprite		;$B2FAD2
	LDA.b $12,x				;$B2FAD5
	SEC					;$B2FAD7
	SBC.w $0012,y				;$B2FAD8
	ASL					;$B2FADB
	STA.w $0030,y				;$B2FADC
	LDA.b $16,x				;$B2FADF
	SEC					;$B2FAE1
	SBC.w $0016,y				;$B2FAE2
	ASL					;$B2FAE5
	STA.w $0034,y				;$B2FAE6
	LDA.w $0012,y				;$B2FAE9
	STA.w $0054,y				;$B2FAEC
	LDA.w $0016,y				;$B2FAEF
	STA.w $0056,y				;$B2FAF2
	JSL.l process_current_movement		;$B2FAF5
	LDA.b $12,x				;$B2FAF9
	CMP.b $5C,x				;$B2FAFB
	BCC.b CODE_B2FB03			;$B2FAFD
	CMP.b $5E,x				;$B2FAFF
	BCC.b CODE_B2FB07			;$B2FB01
CODE_B2FB03:
	LDA.b $54,x				;$B2FB03
	STA.b $12,x				;$B2FB05
CODE_B2FB07:
	LDA.b $16,x				;$B2FB07
	CMP.b $60,x				;$B2FB09
	BCC.b CODE_B2FB11			;$B2FB0B
	CMP.b $62,x				;$B2FB0D
	BCC.b CODE_B2FB15			;$B2FB0F
CODE_B2FB11:
	LDA.b $56,x				;$B2FB11
	STA.b $16,x				;$B2FB13
CODE_B2FB15:
	JML [$04F5]				;$B2FB15


unknown_sprite_01A0_main:
	JML [$04F5]				;$B2FB18


;Unreferenced
CODE_B2FB1B:
	LSR.w $0490,x				;$B2FB1B
	LDA.b $54,x				;$B2FB1E
	STA.b $12,x				;$B2FB20
	LDA.b $16,x				;$B2FB22
	CMP.b $60,x				;$B2FB24
	BCC.b CODE_B2FB2C			;$B2FB26
	CMP.b $62,x				;$B2FB28
	BCC.b CODE_B2FB30			;$B2FB2A
CODE_B2FB2C:
	LDA.b $56,x				;$B2FB2C
	STA.b $16,x				;$B2FB2E
CODE_B2FB30:
	JML [$04F5]				;$B2FB30


;A sprite main that is not in the main table, might be leftover debug stuff
CODE_B2FB33:
	JMP (.state_table,x)			;$B2FB33  |>

.state_table:
	dw .init
	dw .idle

.init:
	TYX					;$B2FB3A  \
	INC sprite.state,x			;$B2FB3B   |
	LDA #$0020				;$B2FB3D   |
	STA sprite.general_purpose_52,x		;$B2FB40   |
	LDA current_world			;$B2FB42   |
	BNE ..return				;$B2FB45   |
	LDA #!level_empty_krevice_kreepers	;$B2FB47   |
	STA level_number			;$B2FB4A   |
	JSL CODE_B7B006				;$B2FB4C   |
	LDX current_sprite			;$B2FB50   |
	STX $04A4				;$B2FB52   |
	LDA #$8000				;$B2FB55   |
	STA $04A6				;$B2FB58   |
	STA $04A8				;$B2FB5B  /
..return:
	JML [$04F5]				;$B2FB5E  |>

.idle:
	LDX #$D113				;$B2FB61  \  Address?
	LDA current_world			;$B2FB64   |
	BEQ ..in_main_map			;$B2FB67   |
	LDX #$D133				;$B2FB69  /  Address?
..in_main_map:
	STX temp_1A				;$B2FB6C  \
	LDA.w sprite.x_position,y		;$B2FB6E   |
	LDX sprite.y_position,y			;$B2FB71   |
	STA $0106				;$B2FB73   |
	STX $0108				;$B2FB76   |
	%return(CODE_B2FB7F)			;$B2FB79   |
	JMP ($001A)				;$B2FB7C  /

CODE_B2FB7F:
	STX $0102				;$B2FB7F  \
	STA $0104				;$B2FB82   |
	JSR .CODE_B2FB9A			;$B2FB85   |
	JSR .handle_inputs			;$B2FB88   |
	LDX sprite.general_purpose_5E,y		;$B2FB8B   |
	LDA.w sprite.x_position,y		;$B2FB8D   |
	STA sprite.x_position,x			;$B2FB90   |
	LDA.w sprite.y_position,y		;$B2FB92   |
	STA sprite.y_position,x			;$B2FB95   |
	JML [$04F5]				;$B2FB97  /

.CODE_B2FB9A:
	BIT #$0008				;$B2FB9A  \
	BNE ..CODE_B2FBC1			;$B2FB9D   |
	AND #$0007				;$B2FB9F   |
	ASL					;$B2FBA2   |
	TAX					;$B2FBA3   |
	LDA.l .DATA_B2FBC6,x			;$B2FBA4  /
..CODE_B2FBA8:
	CLC					;$B2FBA8  \
	ADC #$35FB				;$B2FBA9   |
	STA.w sprite.general_purpose_5C,y	;$B2FBAC   |
	CPX #$0006				;$B2FBAF   |
	BNE ..return				;$B2FBB2   |
	LDA.w sprite.general_purpose_5C,y	;$B2FBB4   |
	AND #$3FFF				;$B2FBB7   |
	ORA #$4000				;$B2FBBA   |
	STA.w sprite.general_purpose_5C,y	;$B2FBBD  /
..return:
	RTS					;$B2FBC0  |>

..CODE_B2FBC1:
	LDA #$0004				;$B2FBC1  \
	BRA ..CODE_B2FBA8			;$B2FBC4  /

.DATA_B2FBC6:
	dw $0000
	dw $0003
	dw $0002
	dw $0001
	dw $0001
	dw $0000
	dw $0000
	dw $0000

.handle_inputs:
	LDA #$0001				;$B2FBD6  \
	STA temp_1A				;$B2FBD9   |
	LDA player_2_held			;$B2FBDB   |
	BIT #$4000				;$B2FBDE   |
	BEQ ..no_y_held				;$B2FBE1   |
	LDA #$0008				;$B2FBE3   |
	STA temp_1A				;$B2FBE6  /
..no_y_held:
	LDA player_2_held			;$B2FBE8  \
	BIT #$0800				;$B2FBEB   |
	BEQ ..no_up_held			;$B2FBEE   |
	LDA.w sprite.y_position,y		;$B2FBF0   |
	SEC					;$B2FBF3   |
	SBC temp_1A				;$B2FBF4   |
	STA.w sprite.y_position,y		;$B2FBF6  /
..no_up_held:
	LDA player_2_held			;$B2FBF9  \
	BIT #$0400				;$B2FBFC   |
	BEQ ..no_down_held			;$B2FBFF   |
	LDA.w sprite.y_position,y		;$B2FC01   |
	CLC					;$B2FC04   |
	ADC temp_1A				;$B2FC05   |
	STA.w sprite.y_position,y		;$B2FC07  /
..no_down_held:
	LDA player_2_held			;$B2FC0A  \
	BIT #$0200				;$B2FC0D   |
	BEQ ..no_left_held			;$B2FC10   |
	LDA.w sprite.x_position,y		;$B2FC12   |
	SEC					;$B2FC15   |
	SBC temp_1A				;$B2FC16   |
	STA.w sprite.x_position,y		;$B2FC18  /
..no_left_held:
	LDA player_2_held			;$B2FC1B  \
	BIT #$0100				;$B2FC1E   |
	BEQ ..no_right_held			;$B2FC21   |
	LDA.w sprite.x_position,y		;$B2FC23   |
	CLC					;$B2FC26   |
	ADC temp_1A				;$B2FC27   |
	STA.w sprite.x_position,y		;$B2FC29  /
..no_right_held:
	LDA player_2_pressed			;$B2FC2C  \
	BIT #$8000				;$B2FC2F   |
	BEQ ..no_b_press			;$B2FC32   |
	LDX $0102				;$B2FC34   |
	SEP #$20				;$B2FC37   |
	LDA $7E82E8,x				;$B2FC39   |
	ORA #$08				;$B2FC3D   |
	STA $7E82E8,x				;$B2FC3F   |
	REP #$20				;$B2FC43  /
..no_b_press:
	LDA player_2_pressed			;$B2FC45  \
	BIT #$0080				;$B2FC48   |
	BEQ ..no_a_press			;$B2FC4B   |
	LDX $0102				;$B2FC4D   |
	SEP #$20				;$B2FC50   |
	LDA #$00				;$B2FC52   |
	STA $7E82E8,x				;$B2FC54   |
	REP #$20				;$B2FC58  /
..no_a_press:
	LDA player_2_pressed			;$B2FC5A  \
	BIT #$0040				;$B2FC5D   |
	BEQ ..no_x_press			;$B2FC60   |
	LDX $0102				;$B2FC62   |
	SEP #$20				;$B2FC65   |
	LDA $7E82E8,x				;$B2FC67   |
	EOR #$10				;$B2FC6B   |
	STA $7E82E8,x				;$B2FC6D   |
	REP #$20				;$B2FC71  /
..no_x_press:
	LDA player_2_pressed			;$B2FC73  \
	BIT #$1000				;$B2FC76   |
	BEQ ..no_start_press			;$B2FC79   |
	LDA #main_sprite_table			;$B2FC7B   |
	STA.w sprite.general_purpose_5E,y	;$B2FC7E
..no_start_press:
	LDA player_2_pressed			;$B2FC81  \
	BIT #$2000				;$B2FC84   |
	BEQ ..return				;$B2FC87  /
..next:
	LDA.w sprite.general_purpose_5E,y	;$B2FC89  \
	SEC					;$B2FC8C   |
	SBC.w #sizeof(sprite)			;$B2FC8D   |
	CMP #aux_sprite_slot			;$B2FC90   |
	BNE ..CODE_B2FC98			;$B2FC93   |
	LDA #main_sprite_table_end		;$B2FC95  /
..CODE_B2FC98:
	STA.w sprite.general_purpose_5E,y	;$B2FC98  \
	TAX					;$B2FC9B   |
	LDA sprite.type,x			;$B2FC9C   |
	BEQ ..next				;$B2FC9E   |
	LDA sprite.x_position,x			;$B2FCA0   |
	STA.w sprite.x_position,y		;$B2FCA2   |
	LDA sprite.y_position,x			;$B2FCA5   |
	STA.w sprite.y_position,y		;$B2FCA7  /
..return:
	RTS					;$B2FCAA  |>
