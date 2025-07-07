upload_spc_engine:
	JMP .upload_spc_engine_wrapper		;$B28000

#CODE_B28003:
	JMP .queue_song				;$B28003

#CODE_B28006:
	JMP .play_queued_song			;$B28006

#CODE_B28009:
	JMP .play_song				;$B28009

#CODE_B2800C:
	JMP .play_song_with_transition		;$B2800C

#CODE_B2800F:
	JMP .transition_song			;$B2800F

#CODE_B28012:
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
	STA $08					;$B2804E
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
	STA $08					;$B28080
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
	AND.w #$00FF				;$B280AE
	STA.b $08				;$B280B1
	LDX.w #$00FF				;$B280B3
	JSR.w .write_spc_command_x		;$B280B6
	JSR.w .upload_song_sample_set		;$B280B9
	JSR.w .upload_song_data			;$B280BC
	JSR.w .upload_song_sound_effects	;$B280BF
	JSR.w .execute_spc_sound_engine		;$B280C2
	JSL.l .clear_sound_buffers		;$B280C5
	PLA					;$B280C9
	AND.w #$FF00				;$B280CA
	ORA.w #$00FB				;$B280CD
	JSR.w .write_spc_command_a		;$B280D0
	LDX.w #$00FE				;$B280D3
	JSR.w .write_spc_command_x		;$B280D6
	LDA.w stereo_select			;$B280D9
	XBA					;$B280DC
	ORA.w #$00FA				;$B280DD
	JSR.w .write_spc_command_a		;$B280E0
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
	BIT.w $044A				;$B28151
	BMI ..return				;$B28154
	PHX					;$B28156
	PHY					;$B28157
	SEP #$30				;$B28158
	XBA					;$B2815A
	AND.b #$07				;$B2815B
	TAX					;$B2815D
	XBA					;$B2815E
	LDY.w $0428,x				;$B2815F
	BEQ ..CODE_B28169			;$B28162
	CMP.w $0420,x				;$B28164
	BNE ..CODE_B2816C			;$B28167
..CODE_B28169:
	STA.w $0428,x				;$B28169
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
	AND.b #$0F				;$B28175
	TAX					;$B28177
	XBA					;$B28178
	STA.w $0420,x				;$B28179
	BEQ.b .CODE_B28186			;$B2817C
	LDA.w .index_to_bit,x			;$B2817E
	TSB.w $0430				;$B28181
	BRA.b .CODE_B2818C			;$B28184

.CODE_B28186:
	LDA.w .index_to_bit,x			;$B28186
	TRB.w $0430				;$B28189
.CODE_B2818C:
	LDA.w $0420,x				;$B2818C
	REP #$30				;$B2818F
	TAX					;$B28191
	JSR.w .write_spc_command_x		;$B28192
	RTL					;$B28195

.play_queued_sound_effect:
	PHB					;$B28196
	PHK					;$B28197
	PLB					;$B28198
	LDA.b $00				;$B28199
	CMP.w $0438				;$B2819B
	BEQ.b .CODE_B281C1			;$B2819E
	LDX.w $0434				;$B281A0
	LDA.w $043A,x				;$B281A3
	BEQ.b .CODE_B281C1			;$B281A6
	STZ.w $043A,x				;$B281A8
	JSL.l .play_high_priority_sound		;$B281AB
	LDA.w $0434				;$B281AF
	INC					;$B281B2
	INC					;$B281B3
	AND.w #$000E				;$B281B4
	STA.w $0434				;$B281B7
	LDA.b $00				;$B281BA
	STA.w $0438				;$B281BC
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
	LDA.w .index_to_bit,x			;$B281E3
	TRB.w $0430				;$B281E6
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
	BIT.w $044A				;$B2820C
	BMI .CODE_B28231			;$B2820F
	SEP #$30				;$B28211
	XBA					;$B28213
	TAX					;$B28214
	LDA.w $0430				;$B28215
	BIT.w .index_to_bit,x			;$B28218
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
	BIT.w $044A				;$B2824C
	BMI.b ..return				;$B2824F
	AND.w #$00FF				;$B28251
	XBA					;$B28254
	ORA.w #$00FD				;$B28255
	JSR.w .write_spc_command_a		;$B28258
..return:
	PLB					;$B2825B
	RTL					;$B2825C

.write_spc_command_x:
	TXA					;$B2825D
.write_spc_command_a:
	SEP #$10				;$B2825E
	LDX $06					;$B28260
..wait_for_echo:
	CPX.w !REGISTER_APUPort0		;$B28262
	BNE ..wait_for_echo			;$B28265
	STA.w !REGISTER_APUPort1		;$B28267
	INX					;$B2826A
	STX.w !REGISTER_APUPort0		;$B2826B
	STX $06					;$B2826E
	REP #$10				;$B28270
	RTS					;$B28272

.upload_spc_base_engine:
	SEP #$10				;$B28273
	LDA.w #$BBAA				;$B28275
-
	CMP.w !REGISTER_APUPort0		;$B28278
	BNE -					;$B2827B
	LDA.w #$04D8				;$B2827D
	STA.w !REGISTER_APUPort2		;$B28280
	LDA.w #$01CC				;$B28283
	STA.w !REGISTER_APUPort0		;$B28286
	TAX					;$B28289
-
	CPX.w !REGISTER_APUPort0		;$B2828A
	BNE -					;$B2828D
	LDX.b #$00				;$B2828F
.next_byte:
	LDA.l DATA_ED0000,x			;$B28291
	TAY					;$B28295
	STY.w !REGISTER_APUPort1		;$B28296
	STX.w !REGISTER_APUPort0		;$B28299
-
	CPX.w !REGISTER_APUPort0		;$B2829C
	BNE -					;$B2829F
	INX					;$B282A1
	CPX.b #$88				;$B282A2
	BNE.b .next_byte			;$B282A4
	INX					;$B282A6
	TXA					;$B282A7
	STA.w !REGISTER_APUPort0		;$B282A8
-
	CPX.w !REGISTER_APUPort0		;$B282AB
	BNE -					;$B282AE
	STZ.b spc_transaction			;$B282B0
	REP #$10				;$B282B2
	RTS					;$B282B4

.upload_song_data:
	LDA.b $08				;$B282B5
	ASL					;$B282B7
	ASL					;$B282B8
	ASL					;$B282B9
	ADC.b $08				;$B282BA
	TAX					;$B282BC
	LDA.l DATA_ED0D86,x			;$B282BD
	STA.b $1A				;$B282C1
	LDA.l DATA_ED0D86+$02,x			;$B282C3
	STA.b $1C				;$B282C7
	JSR.w .upload_inline_spc_block		;$B282C9
	RTS					;$B282CC

.upload_song_sound_effects:
	LDA.b $08				;$B282CD
	ASL					;$B282CF
	ASL					;$B282D0
	ASL					;$B282D1
	ADC.b $08				;$B282D2
	TAX					;$B282D4
	LDA.l DATA_ED0D86+$06,x			;$B282D5
	STA.b $1A				;$B282D9
	LDA.l DATA_ED0D86+$08,x			;$B282DB
	STA.b $1C				;$B282DF
	JSR.w .upload_inline_spc_block		;$B282E1
	RTS					;$B282E4

.upload_spc_sound_engine:
	LDA.w #DATA_ED0088			;$B282E5
	STA.b $1A				;$B282E8
	LDA.w #DATA_ED0088>>16			;$B282EA
	STA.b $1C				;$B282ED
	LDA.w #$0560				;$B282EF
	STA.b $1D				;$B282F2
	LDA.w #$067F				;$B282F4
	STA.b $1F				;$B282F7
	JSR.w .upload_spc_block			;$B282F9
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
	LDA.b $08				;$B28325
	ASL					;$B28327
	ASL					;$B28328
	ASL					;$B28329
	ADC.b $08				;$B2832A
	TAX					;$B2832C
	LDA.l DATA_ED0D86+$03,x			;$B2832D
	STA.b $0A				;$B28331
	LDA.l DATA_ED0D86+$05,x			;$B28333
	STA.b $0C				;$B28337
	LDA.b $14				;$B28339
	STA.b $12				;$B2833B
	LDA.b $10				;$B2833D
	STA.b $0E				;$B2833F
	LDA.b $18				;$B28341
	STA.b $16				;$B28343
	JSR.w .sample_uploader			;$B28345
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
	LDY.b $24				;$B28364
	LDA.b [$26],y				;$B28366
	CMP.w #$FFFF				;$B28368
	BEQ.b .upload_sample_directory		;$B2836B
	ASL					;$B2836D
	ADC.b [$26],y				;$B2836E
	TXY					;$B28370
	TAX					;$B28371
	LDA.l DATA_EE078A,x			;$B28372
	STA.b $1A				;$B28376
	LDA.l DATA_EE078A+$02,x			;$B28378
	STA.b $1C				;$B2837C
	TYX					;$B2837E
	LDA.b $0E				;$B2837F
	STA.l $7E2000,x				;$B28381
	CLC					;$B28385
	ADC.b [$1A]				;$B28386
	STA.l $7E2002,x				;$B28388
	LDY.w #$0002				;$B2838C
	LDA.b $0E				;$B2838F
	CLC					;$B28391
	ADC.b [$1A],y				;$B28392
	STA.b $0E				;$B28394
	INX					;$B28396
	INX					;$B28397
	INX					;$B28398
	INX					;$B28399
	INC.b $24				;$B2839A
	INC.b $24				;$B2839C
	BRA .parse_next_sample			;$B2839E

.upload_sample_directory:
	TXA					;$B283A0
	CLC					;$B283A1
	ADC.b $12				;$B283A2
	STA.b $12				;$B283A4
	LDA.w #$7E2000				;$B283A6
	STA.b $1A				;$B283A9
	LDA.w #$7E2000>>16			;$B283AB
	STA.b $1C				;$B283AE
	LDA.b $2A				;$B283B0
	STA.b $1D				;$B283B2
	LDA.w #$3400				;$B283B4
	SEC					;$B283B7
	SBC.b $2A				;$B283B8
	CLC					;$B283BA
	INC					;$B283BB
	LSR					;$B283BC
	STA.b $1F				;$B283BD
	JSR.w .upload_spc_block			;$B283BF
	LDY.w #$0000				;$B283C2
	LDA.w #DATA_ED0F36			;$B283C5
	STA.b $26				;$B283C8
	LDA.w #DATA_ED0F36>>16			;$B283CA
	STA.b $28				;$B283CD
	CMP.b $0C				;$B283CF
	BNE.b .CODE_B283DA			;$B283D1
	LDA.w #$0F36				;$B283D3
	CMP.b $0A				;$B283D6
	BEQ.b .upload_samples			;$B283D8
.CODE_B283DA:
	LDA.b [$26],y				;$B283DA
	CMP.w #$FFFF				;$B283DC
	BEQ.b .CODE_B283F2			;$B283DF
	TAX					;$B283E1
	SEP.b #$20				;$B283E2
	LDA.b $16				;$B283E4
	STA.l $7E2000,x				;$B283E6
	INC.b $16				;$B283EA
	REP.b #$20				;$B283EC
	INY					;$B283EE
	INY					;$B283EF
	BRA.b .CODE_B283DA			;$B283F0

.CODE_B283F2:
	LDY.w #$0000				;$B283F2
	LDA.b $0A				;$B283F5
	STA.b $26				;$B283F7
	LDA.b $0C				;$B283F9
	STA.b $28				;$B283FB
.CODE_B283FD:
	LDA.b [$26],y				;$B283FD
	CMP.w #$FFFF				;$B283FF
	BEQ.b .CODE_B28415			;$B28402
	TAX					;$B28404
	SEP.b #$20				;$B28405
	LDA.b $16				;$B28407
	STA.l $7E2000,x				;$B28409
	INC.b $16				;$B2840D
	REP.b #$20				;$B2840F
	INY					;$B28411
	INY					;$B28412
	BRA.b .CODE_B283FD			;$B28413

.CODE_B28415:
	LDA.w #$7E2000				;$B28415
	STA.b $1A				;$B28418
	LDA.w #$7E2000>>16			;$B2841A
	STA.b $1C				;$B2841D
	LDA.w #$0560				;$B2841F
	STA.b $1D				;$B28422
	LDA.w #$0080				;$B28424
	STA.b $1F				;$B28427
	JSR.w .upload_spc_block			;$B28429
.upload_samples:
	LDA.b $2C				;$B2842C
	STA.b $0E				;$B2842E
	STZ.b $24				;$B28430
.map_global_sample:
	LDY.b $24				;$B28432
	LDA.b [$0A],y				;$B28434
	CMP.w #$FFFF				;$B28436
	BEQ.b ..return				;$B28439
	ASL					;$B2843B
	ADC.b [$0A],y				;$B2843C
	TAX					;$B2843E
	LDA.l DATA_EE078A,x			;$B2843F
	INC					;$B28443
	INC					;$B28444
	STA.b $1A				;$B28445
	LDA.l DATA_EE078A+$02,x			;$B28447
	STA.b $1C				;$B2844B
	LDA.b $0E				;$B2844D
	STA.b $1D				;$B2844F
	LDA.b [$1A]				;$B28451
	STA.b $1F				;$B28453
	CLC					;$B28455
	ADC.b $1D				;$B28456
	STA.b $0E				;$B28458
	INC.b $1F				;$B2845A
	LSR.b $1F				;$B2845C
	INC.b $1A				;$B2845E
	INC.b $1A				;$B28460
	JSR.w .upload_spc_block			;$B28462
	INC.b $24				;$B28465
	INC.b $24				;$B28467
	BRA.b .map_global_sample		;$B28469

..return:
	RTS					;$B2846B

.upload_inline_spc_block:
	LDA.b [$1A]				;$B2846C
	STA.b $1D				;$B2846E
	INC.b $1A				;$B28470
	INC.b $1A				;$B28472
	LDA.b [$1A]				;$B28474
	STA.b $1F				;$B28476
	INC.b $1A				;$B28478
	INC.b $1A				;$B2847A
	BRA .upload_spc_block			;$B2847C

.execute_spc_sound_engine:
	LDA.w #$0672				;$B2847E
	STA.b $1D				;$B28481
	STZ.b $1F				;$B28483
.upload_spc_block:
	SEP #$10				;$B28485
	LDX.b $06				;$B28487
-
	CPX.w !REGISTER_APUPort0		;$B28489
	BNE -					;$B2848C
	LDA.b $1D				;$B2848E
	STA.w !REGISTER_APUPort1		;$B28490
	INX					;$B28493
	STX.w !REGISTER_APUPort0		;$B28494
	LDA.b $1F				;$B28497
	STA.b $21				;$B28499
-
	CPX.w !REGISTER_APUPort0		;$B2849B
	BNE -					;$B2849E
	STA.w !REGISTER_APUPort1		;$B284A0
	INX					;$B284A3
	STX.w !REGISTER_APUPort0		;$B284A4
	LDA.b $1F				;$B284A7
	BEQ.b .return				;$B284A9
	LDY.b #$00				;$B284AB
..next_byte:
	LDA.b [$1A],y				;$B284AD
	INY					;$B284AF
	INY					;$B284B0
	BNE ..wait_for_echo			;$B284B1
	INC.b $1B				;$B284B3
..wait_for_echo:
	CPX.w !REGISTER_APUPort0		;$B284B5
	BNE ..wait_for_echo			;$B284B8
	INX					;$B284BA
	STA.w !REGISTER_APUPort1		;$B284BB
	STX.w !REGISTER_APUPort0		;$B284BE
	DEC.b $1F				;$B284C1
	BNE ..next_byte				;$B284C3
.return:
	STX.b $06				;$B284C5
	REP #$10				;$B284C7
	LDA.b $21				;$B284C9
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
	JSL.l disable_screen_wrapper		;$B284D8
	JSL.l CODE_808009			;$B284DC
	JSL.l CODE_80801B			;$B284E0
	JSL.l CODE_80800C			;$B284E4
	LDX.w #$7EA15A				;$B284E8
	LDY.w #$7EA15A>>16			;$B284EB
	LDA.w #$0660				;$B284EE
	JSL.l CODE_808030			;$B284F1
	JSL.l CODE_BB857F			;$B284F5
	STZ.b $BC				;$B284F9
	STZ.b $F4				;$B284FB
	LDA.b $BA				;$B284FD
	ASL					;$B284FF
	TAX					;$B28500
	JMP.w (DATA_B28504,x)			;$B28501

DATA_B28504:
	dw CODE_B2861F
	dw CODE_B289B9
	dw CODE_B28CFF
	dw CODE_B28EB4
	dw CODE_B2935C

CODE_B2850E:
	STA.b $BA				;$B2850E
	LDX.w #CODE_B284D6			;$B28510
	LDY.w #CODE_B284D6>>16			;$B28513
	STX.b $4E				;$B28516
	STY.b $50				;$B28518
	LDA.w #CODE_808370			;$B2851A
	JML.l CODE_80803C			;$B2851D

CODE_B28521:
	LDA.w #$1300				;$B28521
	STA.b $80				;$B28524
	LDA.w #$0001				;$B28526
	STA.w $04E4				;$B28529
	RTS					;$B2852C

CODE_B2852D:
	LDA.w #$1300				;$B2852D
	STA.b $80				;$B28530
	SEP.b #$20				;$B28532
	LDX.w #(!REGISTER_BG2VertScrollOffset&$0000FF<<8)+$42	;$B28534
	STX.w HDMA[$01].Parameters		;$B28537
	LDX.w #DATA_B285F9			;$B2853A
	STX.w HDMA[$01].SourceLo		;$B2853D
	LDA.b #DATA_B285F9>>16			;$B28540
	STA.w HDMA[$01].SourceBank		;$B28542
	LDA.b #$7E				;$B28545
	STA.w HDMA[$01].IndirectSourceBank	;$B28547
	LDX.w #(!REGISTER_MainScreenLayers&$0000FF<<8)+$00	;$B2854A
	STX.w HDMA[$02].Parameters		;$B2854D
	LDX.w #DATA_B285F2			;$B28550
	STX.w HDMA[$02].SourceLo		;$B28553
	LDA.b #DATA_B285F2>>16			;$B28556
	STA.w HDMA[$02].SourceBank		;$B28558
	LDA.b #$7E				;$B2855B
	STA.w HDMA[$02].IndirectSourceBank	;$B2855D
	LDX.w #(!REGISTER_FixedColorData&$0000FF<<8)+$00	;$B28560
	STX.w HDMA[$03].Parameters		;$B28563
	LDX.w #DATA_B285B8			;$B28566
	STX.w HDMA[$03].SourceLo		;$B28569
	LDA.b #DATA_B285B8>>16			;$B2856C
	STA.w HDMA[$03].SourceBank		;$B2856E
	LDA.b #$7E				;$B28571
	STA.w HDMA[$03].IndirectSourceBank	;$B28573
	LDX.w #(!REGISTER_ColorMathSelectAndEnable&$0000FF<<8)+$00	;$B28576
	STX.w HDMA[$04].Parameters		;$B28579
	LDX.w #DATA_B285B1			;$B2857C
	STX.w HDMA[$04].SourceLo		;$B2857F
	LDA.b #DATA_B285B1>>16			;$B28582
	STA.w HDMA[$04].SourceBank		;$B28584
	LDA.b #$7E				;$B28587
	STA.w HDMA[$04].IndirectSourceBank	;$B28589
	LDX.w #(!REGISTER_BG3VertScrollOffset&$0000FF<<8)+$42	;$B2858C
	STX.w HDMA[$05].Parameters		;$B2858F
	LDX.w #DATA_B285F9			;$B28592
	STX.w HDMA[$05].SourceLo		;$B28595
	LDA.b #DATA_B285F9>>16			;$B28598
	STA.w HDMA[$05].SourceBank		;$B2859A
	LDA.b #$7E				;$B2859D
	STA.w HDMA[$05].IndirectSourceBank	;$B2859F
	REP.b #$20				;$B285A2
	LDA.w #$3E01				;$B285A4
	STA.w $04E4				;$B285A7
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
	LDA.w #$0001				;$B28603
	TSB.b $BC				;$B28606
	BNE.b CODE_B28611			;$B28608
	LDA.w #$820F				;$B2860A
	JSL.l CODE_808024			;$B2860D
CODE_B28611:
	RTS					;$B28611

CODE_B28612:
	JSL.l CODE_808021			;$B28612
	LDA.w screen_brightness			;$B28616
	BNE.b CODE_B2861E			;$B28619
	CMP.w screen_fade_speed			;$B2861B
CODE_B2861E:
	RTS					;$B2861E

CODE_B2861F:
	JSL.l disable_screen_wrapper		;$B2861F
	JSL.l CODE_808009			;$B28623
	JSL.l CODE_80801B			;$B28627
	JSL.l CODE_80800C			;$B2862B
	LDX.w #$7EA15A				;$B2862F
	LDY.w #$7EA15A>>16			;$B28632
	LDA.w #$0660				;$B28635
	JSL.l CODE_808030			;$B28638
	JSL.l CODE_BB857F			;$B2863C
	LDA.w #$0040				;$B28640
	JSL.l vram_payload_handler_global	;$B28643
	LDA.w #$0035				;$B28647
	JSL.l set_PPU_registers_global		;$B2864A
	LDX.w #DATA_F6008E			;$B2864E
	LDY.w #DATA_F6008E>>16			;$B28651
	LDA.w #$0000				;$B28654
	JSL.l CODE_BB857C			;$B28657
	STZ.w !REGISTER_VRAMAddressLo		;$B2865B
	SEP.b #$20				;$B2865E
	LDX.w #$0000				;$B28660
CODE_B28663:
	TXA					;$B28663
	LSR					;$B28664
	LSR					;$B28665
	LSR					;$B28666
	LSR					;$B28667
	LSR					;$B28668
	LSR					;$B28669
	LDA.l $7F0000,x				;$B2866A
	STA.w !REGISTER_WriteToVRAMPortHi	;$B2866E
	INX					;$B28671
	CPX.w #$3400				;$B28672
	BNE.b CODE_B28663			;$B28675
	REP.b #$20				;$B28677
	LDA.w #$038B				;$B28679
	STA.b $1A				;$B2867C
	LDA.w #DATA_F60000			;$B2867E
	LDX.w #DATA_F60000>>16			;$B28681
	STA.b $1C				;$B28684
	STX.b $1E				;$B28686
	STZ.b $21				;$B28688
	SEP.b #$20				;$B2868A
	STZ.w !REGISTER_VRAMAddressIncrementValue	;$B2868C
	REP.b #$20				;$B2868F
	LDY.w #$0000				;$B28691
	LDA.b [$1C],y				;$B28694
	STA.b $20				;$B28696
	INY					;$B28698
	INY					;$B28699
CODE_B2869A:
	LDA.b $1A				;$B2869A
	STA.w !REGISTER_VRAMAddressLo		;$B2869C
	LDA.b $20				;$B2869F
	AND.w #$00FF				;$B286A1
	TAX					;$B286A4
CODE_B286A5:
	SEP.b #$20				;$B286A5
	LDA.b [$1C],y				;$B286A7
	STA.w !REGISTER_WriteToVRAMPortLo	;$B286A9
	REP.b #$20				;$B286AC
	INY					;$B286AE
	DEX					;$B286AF
	BNE.b CODE_B286A5			;$B286B0
	LDA.b $1A				;$B286B2
	CLC					;$B286B4
	ADC.w #$0080				;$B286B5
	STA.b $1A				;$B286B8
	DEC.b $21				;$B286BA
	BNE.b CODE_B2869A			;$B286BC
	SEP.b #$20				;$B286BE
	LDA.b #$80				;$B286C0
	STA.w !REGISTER_VRAMAddressIncrementValue	;$B286C2
	REP.b #$20				;$B286C5
	LDA.w #$0021				;$B286C7
	LDX.w #$0020				;$B286CA
	LDY.w #$0000				;$B286CD
	JSL.l CODE_BB856D			;$B286D0
	JSR.w CODE_B28521			;$B286D4
	SEP.b #$20				;$B286D7
	LDA.b #$FC				;$B286D9
	STA.w !REGISTER_BG1HorizScrollOffset	;$B286DB
	LDA.b #$FF				;$B286DE
	STA.w !REGISTER_BG1HorizScrollOffset	;$B286E0
	LDA.b #$DD				;$B286E3
	STA.w !REGISTER_BG1VertScrollOffset	;$B286E5
	LDA.b #$FF				;$B286E8
	STA.w !REGISTER_BG1VertScrollOffset	;$B286EA
	LDA.b #$80				;$B286ED
	STA.w !REGISTER_Mode7CenterX		;$B286EF
	LDA.b #$00				;$B286F2
	STA.w !REGISTER_Mode7CenterX		;$B286F4
	LDA.b #$98				;$B286F7
	STA.w !REGISTER_Mode7CenterY		;$B286F9
	STZ.w !REGISTER_Mode7CenterY		;$B286FC
	LDA.b #$80				;$B286FF
	STA.w !REGISTER_Mode7TilemapSettings	;$B28701
	REP.b #$20				;$B28704
	LDY.w #$038E				;$B28706
	JSL.l CODE_BB8588			;$B28709
	LDA.b alternate_sprite			;$B2870D
	STA.l $7EA15C				;$B2870F
	LDY.w #$0390				;$B28713
	JSL.l CODE_BB8585			;$B28716
	LDY.w #$0392				;$B2871A
	JSL.l CODE_BB8585			;$B2871D
	LDA.w #$01B0				;$B28721
	STA.b $5E				;$B28724
	STA.b $5C				;$B28726
	LDA.w #!Define_DKC3_MusicID_Fanfare	;$B28728
	JSL.l CODE_B28009			;$B2872B
	LDA.w #$0002				;$B2872F
	TRB.w $06AB				;$B28732
	PHK					;$B28735
	PLB					;$B28736
	LDA.w #$0200				;$B28737
	JSL.l CODE_808024			;$B2873A
	LDA.w #$000A				;$B2873E
	JSL.l CODE_BB85E2			;$B28741
	PHK					;$B28745
	PLB					;$B28746
	LDA.w #CODE_B28751			;$B28747
	LDX.w #CODE_B28751>>16			;$B2874A
	JML.l CODE_808003			;$B2874D

CODE_B28751:
	LDA.w $04E4				;$B28751
	STA.w !REGISTER_DMAEnable		;$B28754
	LDX.w #$0000				;$B28757
CODE_B2875A:
	LDA.w $1568,x				;$B2875A
	BPL.b CODE_B28770			;$B2875D
	LDA.w $1564,x				;$B2875F
	ORA.w #$4000				;$B28762
	STA.w $1564,x				;$B28765
	TXA					;$B28768
	CLC					;$B28769
	ADC.w #$0008				;$B2876A
	TAX					;$B2876D
	BRA.b CODE_B2875A			;$B2876E

CODE_B28770:
	JSL.l CODE_B38006			;$B28770
	JSL.l CODE_80801E			;$B28774
	SEP.b #$20				;$B28778
	LDA.w screen_brightness			;$B2877A
	STA.w !REGISTER_ScreenDisplayRegister	;$B2877D
	REP.b #$20				;$B28780
	STZ.w $1560				;$B28782
	STZ.w $155E				;$B28785
	LDA.w $06AB				;$B28788
	BEQ.b CODE_B287AA			;$B2878B
	LDA.w screen_brightness			;$B2878D
	BIT.w #$FF00				;$B28790
	BNE.b CODE_B287AA			;$B28793
	JSL.l CODE_808015			;$B28795
	LDA.w $04CE				;$B28799
	AND.w #$9080				;$B2879C
	BEQ.b CODE_B287AA			;$B2879F
	LDA.w #$0002				;$B287A1
	TSB.w $06AB				;$B287A4
	JSR.w CODE_B28603			;$B287A7
CODE_B287AA:
	LDA.b $5E				;$B287AA
	CLC					;$B287AC
	ADC.w $1989				;$B287AD
	STA.b $5E				;$B287B0
	STA.b $5C				;$B287B2
	JSL.l CODE_B28800			;$B287B4
	JSL.l CODE_BB85C1			;$B287B8
	JSL.l CODE_B7800C			;$B287BC
	JSL.l CODE_B7800F			;$B287C0
	JSL.l CODE_808012			;$B287C4
	JSR.w CODE_B28612			;$B287C8
	BEQ.b CODE_B287DB			;$B287CB
	LDA.b $F4				;$B287CD
	CMP.w #$00E2				;$B287CF
	BCC.b CODE_B287D7			;$B287D2
	JSR.w CODE_B28603			;$B287D4
CODE_B287D7:
	JML.l CODE_808006			;$B287D7

CODE_B287DB:
	LDA.w #$0002				;$B287DB
	BIT.w $06AB				;$B287DE
	BNE.b CODE_B287E9			;$B287E1
	LDA.w #$0001				;$B287E3
	JMP.w CODE_B2850E			;$B287E6

CODE_B287E9:
	TRB.w $06AB				;$B287E9
	LDA.w #$0004				;$B287EC
	BIT.w $06AB				;$B287EF
	BEQ.b CODE_B287FA			;$B287F2
	LDA.w #$0002				;$B287F4
	JMP.w CODE_B2850E			;$B287F7

CODE_B287FA:
	LDA.w #$0003				;$B287FA
	JMP.w CODE_B2850E			;$B287FD

CODE_B28800:
	SEP.b #$30				;$B28800
	JSR.w CODE_B28830			;$B28802
	LDA.b $68				;$B28805
	STA.w !REGISTER_Mode7MatrixParameterA	;$B28807
	LDA.b $69				;$B2880A
	STA.w !REGISTER_Mode7MatrixParameterA	;$B2880C
	LDA.b $64				;$B2880F
	STA.w !REGISTER_Mode7MatrixParameterB	;$B28811
	LDA.b $65				;$B28814
	STA.w !REGISTER_Mode7MatrixParameterB	;$B28816
	LDA.b $62				;$B28819
	STA.w !REGISTER_Mode7MatrixParameterC	;$B2881B
	LDA.b $63				;$B2881E
	STA.w !REGISTER_Mode7MatrixParameterC	;$B28820
	LDA.b $60				;$B28823
	STA.w !REGISTER_Mode7MatrixParameterD	;$B28825
	LDA.b $61				;$B28828
	STA.w !REGISTER_Mode7MatrixParameterD	;$B2882A
	REP.b #$30				;$B2882D
	RTL					;$B2882F

CODE_B28830:
	LDY.b $5E				;$B28830
	LDX.b $5F				;$B28832
	LDA.b $66				;$B28834
	JSR.w CODE_B2888E			;$B28836
	STY.b $68				;$B28839
	STX.b $69				;$B2883B
	LDY.b $5E				;$B2883D
	LDX.b $5F				;$B2883F
	LDA.b $66				;$B28841
	JSR.w CODE_B28871			;$B28843
	STY.b $64				;$B28846
	STX.b $65				;$B28848
	LDY.b $5C				;$B2884A
	LDX.b $5D				;$B2884C
	LDA.b $66				;$B2884E
	JSR.w CODE_B28871			;$B28850
	TYA					;$B28853
	EOR.b #$FF				;$B28854
	STA.b $62				;$B28856
	TXA					;$B28858
	EOR.b #$FF				;$B28859
	STA.b $63				;$B2885B
	INC.b $62				;$B2885D
	BNE.b CODE_B28863			;$B2885F
	INC.b $63				;$B28861
CODE_B28863:
	LDY.b $5C				;$B28863
	LDX.b $5D				;$B28865
	LDA.b $66				;$B28867
	JSR.w CODE_B2888E			;$B28869
	STY.b $60				;$B2886C
	STX.b $61				;$B2886E
	RTS					;$B28870

CODE_B28871:
	STY.w !REGISTER_Mode7MatrixParameterA	;$B28871
	STX.w !REGISTER_Mode7MatrixParameterA	;$B28874
	JSR.w CODE_B288AE			;$B28877
	BCS.b CODE_B2888D			;$B2887A
	STA.w !REGISTER_Mode7MatrixParameterB	;$B2887C
	LDA.w !REGISTER_PPUMultiplicationProductLo	;$B2887F
	ASL					;$B28882
	LDA.w !REGISTER_PPUMultiplicationProductMid	;$B28883
	ROL					;$B28886
	TAY					;$B28887
	LDA.w !REGISTER_PPUMultiplicationProductHi	;$B28888
	ROL					;$B2888B
	TAX					;$B2888C
CODE_B2888D:
	RTS					;$B2888D

CODE_B2888E:
	STY.w !REGISTER_Mode7MatrixParameterA	;$B2888E
	STX.w !REGISTER_Mode7MatrixParameterA	;$B28891
	JSR.w CODE_B288AB			;$B28894
	BCS.b CODE_B288AA			;$B28897
	STA.w !REGISTER_Mode7MatrixParameterB	;$B28899
	LDA.w !REGISTER_PPUMultiplicationProductLo	;$B2889C
	ASL					;$B2889F
	LDA.w !REGISTER_PPUMultiplicationProductMid	;$B288A0
	ROL					;$B288A3
	TAY					;$B288A4
	LDA.w !REGISTER_PPUMultiplicationProductHi	;$B288A5
	ROL					;$B288A8
	TAX					;$B288A9
CODE_B288AA:
	RTS					;$B288AA

CODE_B288AB:
	CLC					;$B288AB
	ADC.b #$40				;$B288AC
CODE_B288AE:
	CMP.b #$40				;$B288AE
	BEQ.b CODE_B288B8			;$B288B0
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
	JSR.w CODE_B289D3			;$B289B9
	LDA.w #DATA_F315C6			;$B289BC
	LDY.w #DATA_F315C6>>16			;$B289BF
	LDX.w #$0000				;$B289C2
	JSL.l CODE_BB85DF			;$B289C5
	LDA.w #CODE_B28B2C			;$B289C9
	LDX.w #CODE_B28B2C>>16			;$B289CC
	JML.l CODE_808003			;$B289CF

CODE_B289D3:
	JSL.l disable_screen_wrapper		;$B289D3
	JSL.l CODE_808009			;$B289D7
	JSL.l CODE_80801B			;$B289DB
	JSL.l CODE_80800C			;$B289DF
	LDX.w #$7EA15A				;$B289E3
	LDY.w #$7EA15A>>16			;$B289E6
	LDA.w #$0660				;$B289E9
	JSL.l CODE_808030			;$B289EC
	JSL.l CODE_BB857F			;$B289F0
	LDA.w #$0041				;$B289F4
	JSL.l vram_payload_handler_global	;$B289F7
	LDA.w #$0036				;$B289FB
	JSL.l set_PPU_registers_global		;$B289FE
	LDA.w #$0020				;$B28A02
	LDX.w #$0020				;$B28A05
	LDY.w #$0000				;$B28A08
	JSL.l CODE_BB856D			;$B28A0B
	JSR.w CODE_B2852D			;$B28A0F
	LDA.w #$000C				;$B28A12
	STA.w $0400				;$B28A15
CODE_B28A18:
	LDA.w $0400				;$B28A18
	AND.w #$0003				;$B28A1B
	ASL					;$B28A1E
	CLC					;$B28A1F
	ADC.w #$0384				;$B28A20
	TAY					;$B28A23
	JSL.l CODE_BB85B8			;$B28A24
	LDY.b alternate_sprite			;$B28A28
	LDA.w #$007C				;$B28A2A
	STA.w $0016,y				;$B28A2D
	LDX.w $0400				;$B28A30
	LDA.l DATA_B28B1F,x			;$B28A33
	AND.w #$00FF				;$B28A37
	SEC					;$B28A3A
	SBC.w #$0003				;$B28A3B
	STA.w $0012,y				;$B28A3E
	LDA.w $0400				;$B28A41
	ASL					;$B28A44
	ADC.w #$15FC				;$B28A45
	STA.w $005C,y				;$B28A48
	DEC.w $0400				;$B28A4B
	BNE.b CODE_B28A18			;$B28A4E
	LDY.w #$038C				;$B28A50
	JSL.l CODE_BB85B8			;$B28A53
	LDY.b alternate_sprite			;$B28A57
	TYA					;$B28A59
	STA.l $7EA258				;$B28A5A
	LDA.w #$0020				;$B28A5E
	STA.w $0012,y				;$B28A61
	LDA.w #$FFC0				;$B28A64
	STA.w $0016,y				;$B28A67
	LDA.w #$0118				;$B28A6A
	STA.w $0024,y				;$B28A6D
	LDY.w #$0394				;$B28A70
	JSL.l CODE_BB8585			;$B28A73
	LDA.b alternate_sprite			;$B28A77
	STA.b $84				;$B28A79
	LDY.w #$0394				;$B28A7B
	JSL.l CODE_BB8585			;$B28A7E
	LDY.b alternate_sprite			;$B28A82
	STY.b $86				;$B28A84
	LDA.w #$00F0				;$B28A86
	STA.w $0012,y				;$B28A89
	LDA.w $001E,y				;$B28A8C
	EOR.w #$4000				;$B28A8F
	STA.w $001E,y				;$B28A92
	LDY.w #$0396				;$B28A95
	JSL.l CODE_BB8585			;$B28A98
	LDY.b alternate_sprite			;$B28A9C
	LDA.b $84				;$B28A9E
	STA.w $0010,y				;$B28AA0
	LDY.w #$0398				;$B28AA3
	JSL.l CODE_BB8585			;$B28AA6
	LDY.b alternate_sprite			;$B28AAA
	LDA.b $86				;$B28AAC
	STA.w $0010,y				;$B28AAE
	LDX.w #$0000				;$B28AB1
	LDA.w #$0000				;$B28AB4
CODE_B28AB7:
	STA.l $7EA25E,x				;$B28AB7
	INX					;$B28ABB
	INX					;$B28ABC
	CPX.w #$0066				;$B28ABD
	BNE.b CODE_B28AB7			;$B28AC0
	LDA.w #$0088				;$B28AC2
	STA.b $00				;$B28AC5
	LDA.w #$0141				;$B28AC7
	SEC					;$B28ACA
	SBC.b $00				;$B28ACB
	STA.l $7EA25A				;$B28ACD
	LDA.w #$FFF0				;$B28AD1
	STA.w $1973				;$B28AD4
	SEP.b #$20				;$B28AD7
	LDA.b #$F2				;$B28AD9
	STA.w !REGISTER_BG1VertScrollOffset	;$B28ADB
	STZ.w !REGISTER_BG1VertScrollOffset	;$B28ADE
	REP.b #$20				;$B28AE1
	PHK					;$B28AE3
	PLB					;$B28AE4
	LDA.w #$0200				;$B28AE5
	JSL.l CODE_808024			;$B28AE8
	LDA.w #$000A				;$B28AEC
	JSL.l CODE_BB85E2			;$B28AEF
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
	LDA.w $04E4				;$B28B2C
	STA.w !REGISTER_DMAEnable		;$B28B2F
	LDA.w $1975				;$B28B32
	CLC					;$B28B35
	ADC.w #$00A0				;$B28B36
	AND.w #$00F8				;$B28B39
	ASL					;$B28B3C
	ASL					;$B28B3D
	CLC					;$B28B3E
	ADC.w #$7400				;$B28B3F
	STA.w !REGISTER_VRAMAddressLo		;$B28B42
	LDA.w $1975				;$B28B45
	AND.w #$01F8				;$B28B48
	ASL					;$B28B4B
	ASL					;$B28B4C
	ASL					;$B28B4D
	TAX					;$B28B4E
	LDY.w #$0020				;$B28B4F
CODE_B28B52:
	LDA.l $7F0000,x				;$B28B52
	STA.w !REGISTER_WriteToVRAMPortLo	;$B28B56
	INX					;$B28B59
	INX					;$B28B5A
	DEY					;$B28B5B
	BNE.b CODE_B28B52			;$B28B5C
	JSL.l CODE_B38006			;$B28B5E
	JSL.l CODE_80801E			;$B28B62
	SEP.b #$20				;$B28B66
	LDA.w screen_brightness			;$B28B68
	STA.w !REGISTER_ScreenDisplayRegister	;$B28B6B
	REP.b #$20				;$B28B6E
	STZ.w $1560				;$B28B70
	STZ.w $155E				;$B28B73
	LDA.w $06AB				;$B28B76
	BEQ.b CODE_B28B92			;$B28B79
	LDA.w screen_brightness			;$B28B7B
	BIT.w #$FF00				;$B28B7E
	BNE.b CODE_B28B92			;$B28B81
	JSL.l CODE_808015			;$B28B83
	LDA.w $04CE				;$B28B87
	AND.w #$9080				;$B28B8A
	BEQ.b CODE_B28B92			;$B28B8D
	JSR.w CODE_B28603			;$B28B8F
CODE_B28B92:
	LDA.b $00				;$B28B92
	CMP.w #$00AB				;$B28B94
	BCC.b CODE_B28BC4			;$B28B97
	LDA.b $00				;$B28B99
	SEC					;$B28B9B
	SBC.w #$0103				;$B28B9C
	CMP.w #$003C				;$B28B9F
	BCC.b CODE_B28BC4			;$B28BA2
	LDA.b $00				;$B28BA4
	SEC					;$B28BA6
	SBC.w #$0258				;$B28BA7
	BMI.b CODE_B28BBA			;$B28BAA
	LSR					;$B28BAC
	LSR					;$B28BAD
	BEQ.b CODE_B28BBA			;$B28BAE
	CMP.w #$0008				;$B28BB0
	BCC.b CODE_B28BBD			;$B28BB3
	LDA.w #$0008				;$B28BB5
	BRA.b CODE_B28BBD			;$B28BB8

CODE_B28BBA:
	LDA.w #$0001				;$B28BBA
CODE_B28BBD:
	CLC					;$B28BBD
	ADC.w $1975				;$B28BBE
	STA.w $1975				;$B28BC1
CODE_B28BC4:
	LDA.w $1975				;$B28BC4
	SEC					;$B28BC7
	SBC.w #$0010				;$B28BC8
	STA.b $1A				;$B28BCB
	LDY.w #$0000				;$B28BCD
	LDX.w #$0000				;$B28BD0
CODE_B28BD3:
	LDA.l DATA_B2AFDE,x			;$B28BD3
	CLC					;$B28BD7
	ADC.b $1A				;$B28BD8
	STA.l $7EA15A,x				;$B28BDA
	INX					;$B28BDE
	INX					;$B28BDF
	CPX.w #$00A2				;$B28BE0
	BNE.b CODE_B28BD3			;$B28BE3
	LDA.l $7EA25A				;$B28BE5
	DEC					;$B28BE9
	STA.l $7EA25A				;$B28BEA
	LDA.l $7EA25A				;$B28BEE
	BNE.b CODE_B28C4A			;$B28BF2
	LDA.l $7EA25C				;$B28BF4
	TAX					;$B28BF8
	LDA.l DATA_B28AF6,x			;$B28BF9
	AND.w #$00FF				;$B28BFD
	STA.l $7EA25A				;$B28C00
	LDA.l DATA_B28AF6+$01,x			;$B28C04
	AND.w #$00FF				;$B28C08
	CMP.w #$00FF				;$B28C0B
	BEQ.b CODE_B28C4A			;$B28C0E
	STA.b $84				;$B28C10
	INX					;$B28C12
	INX					;$B28C13
	TXA					;$B28C14
	STA.l $7EA25C				;$B28C15
	LDX.w #$0000				;$B28C19
CODE_B28C1C:
	LDA.l $7EA25E,x				;$B28C1C
	BEQ.b CODE_B28C2B			;$B28C20
	INX					;$B28C22
	INX					;$B28C23
	CPX.w #$0022				;$B28C24
	BNE.b CODE_B28C1C			;$B28C27
	BRA.b CODE_B28C4A			;$B28C29

CODE_B28C2B:
	TXY					;$B28C2B
	LDA.b $84				;$B28C2C
	STA.l $7EA2A2,x				;$B28C2E
	TAX					;$B28C32
	LDA.l DATA_B28B1F+$01,x			;$B28C33
	CLC					;$B28C37
	ADC.w #$0004				;$B28C38
	AND.w #$00FF				;$B28C3B
	TYX					;$B28C3E
	STA.l $7EA280,x				;$B28C3F
	LDA.w #$00E0				;$B28C43
	STA.l $7EA25E,x				;$B28C46
CODE_B28C4A:
	LDX.w #$0000				;$B28C4A
CODE_B28C4D:
	LDA.l $7EA2C4,x				;$B28C4D
	CMP.l $7EA2C6,x				;$B28C51
	BEQ.b CODE_B28CA5			;$B28C55
	BPL.b CODE_B28CA5			;$B28C57
	STA.b $1A				;$B28C59
	LDA.l $7EA280,x				;$B28C5B
	STA.b $1C				;$B28C5F
	LDA.l $7EA2A2,x				;$B28C61
	STA.b $1E				;$B28C65
	LDA.l $7EA25E,x				;$B28C67
	STA.b $20				;$B28C6B
	LDA.l $7EA2C6,x				;$B28C6D
	STA.l $7EA2C4,x				;$B28C71
	LDA.l $7EA282,x				;$B28C75
	STA.l $7EA280,x				;$B28C79
	LDA.l $7EA260,x				;$B28C7D
	STA.l $7EA25E,x				;$B28C81
	LDA.l $7EA2A4,x				;$B28C85
	STA.l $7EA2A2,x				;$B28C89
	LDA.b $1A				;$B28C8D
	STA.l $7EA2C6,x				;$B28C8F
	LDA.b $1C				;$B28C93
	STA.l $7EA282,x				;$B28C95
	LDA.b $1E				;$B28C99
	STA.l $7EA2A4,x				;$B28C9B
	LDA.b $20				;$B28C9F
	STA.l $7EA260,x				;$B28CA1
CODE_B28CA5:
	INX					;$B28CA5
	INX					;$B28CA6
	CPX.w #$0020				;$B28CA7
	BNE.b CODE_B28C4D			;$B28CAA
	JSL.l CODE_BB85C1			;$B28CAC
	JSL.l CODE_B7800C			;$B28CB0
	JSL.l CODE_B7800F			;$B28CB4
	LDX.w #$0000				;$B28CB8
CODE_B28CBB:
	LDA.l $7EA25E,x				;$B28CBB
	BEQ.b CODE_B28CC8			;$B28CBF
	STX.b $34				;$B28CC1
	JSR.w CODE_B291D6			;$B28CC3
	LDX.b $34				;$B28CC6
CODE_B28CC8:
	INX					;$B28CC8
	INX					;$B28CC9
	CPX.w #$0022				;$B28CCA
	BNE.b CODE_B28CBB			;$B28CCD
	JSL.l CODE_808012			;$B28CCF
	JSR.w CODE_B28612			;$B28CD3
	BEQ.b CODE_B28CE6			;$B28CD6
	LDA.b $F4				;$B28CD8
	CMP.w #$0276				;$B28CDA
	BCC.b CODE_B28CE2			;$B28CDD
	JSR.w CODE_B28603			;$B28CDF
CODE_B28CE2:
	JML.l CODE_808006			;$B28CE2

CODE_B28CE6:
	LDA.w $06AB				;$B28CE6
	BIT.w #$0004				;$B28CE9
	BEQ.b CODE_B28CF9			;$B28CEC
	BIT.w #$0001				;$B28CEE
	BEQ.b CODE_B28CF9			;$B28CF1
	LDA.w #$0002				;$B28CF3
	JMP.w CODE_B2850E			;$B28CF6

CODE_B28CF9:
	LDA.w #$0003				;$B28CF9
	JMP.w CODE_B2850E			;$B28CFC

CODE_B28CFF:
	JSL.l disable_screen_wrapper		;$B28CFF
	JSL.l CODE_808009			;$B28D03
	JSL.l CODE_80801B			;$B28D07
	JSL.l CODE_80800C			;$B28D0B
	LDX.w #$7EA15A				;$B28D0F
	LDY.w #$7EA15A>>16			;$B28D12
	LDA.w #$0660				;$B28D15
	JSL.l CODE_808030			;$B28D18
	JSL.l CODE_808042			;$B28D1C
	JSL.l CODE_BB857F			;$B28D20
	LDA.w #$0042				;$B28D24
	JSL.l vram_payload_handler_global	;$B28D27
	LDA.w #$0037				;$B28D2B
	JSL.l set_PPU_registers_global		;$B28D2E
	LDA.w #$001E				;$B28D32
	LDX.w #$0020				;$B28D35
	LDY.w #$0000				;$B28D38
	JSL.l CODE_BB856D			;$B28D3B
	LDA.w #$0003				;$B28D3F
	LDY.w #$0238				;$B28D42
	JSL.l CODE_BB85F7			;$B28D45
	LDY.w #$023C				;$B28D49
	JSL.l CODE_BB8588			;$B28D4C
	LDY.w #$023A				;$B28D50
	JSL.l CODE_BB85B5			;$B28D53
	LDX.b alternate_sprite			;$B28D57
	STX.w active_kong_sprite		;$B28D59
	LDA.w #$0002				;$B28D5C
	TRB.w $06AB				;$B28D5F
	JSR.w CODE_B28D82			;$B28D62
	JSR.w CODE_B28521			;$B28D65
	LDA.w #!Define_DKC3_MusicID_DixieBeat	;$B28D68
	JSL.l CODE_B28009			;$B28D6B
	PHK					;$B28D6F
	PLB					;$B28D70
	LDA.w #$0200				;$B28D71
	JSL.l CODE_808024			;$B28D74
	LDA.w #CODE_B28E05			;$B28D78
	LDX.w #CODE_B28E05>>16			;$B28D7B
	JML.l CODE_808003			;$B28D7E

CODE_B28D82:
	LDA.w $06AD				;$B28D82
	AND.w #$00FF				;$B28D85
	CMP.w #$000F				;$B28D88
	BNE.b CODE_B28DA2			;$B28D8B
	LDA.w #$8080				;$B28D8D
	TSB.w $06AF				;$B28D90
	TSB.w $06B1				;$B28D93
	DEC.w $06AD				;$B28D96
	DEC.w $06AD				;$B28D99
	DEC.w $06AD				;$B28D9C
	DEC.w $06AD				;$B28D9F
CODE_B28DA2:
	TDC					;$B28DA2
	SEP.b #$20				;$B28DA3
	LDA.w $06D5				;$B28DA5
	AND.b #$03				;$B28DA8
	STA.w $06D4				;$B28DAA
	TAX					;$B28DAD
	ORA.b #$80				;$B28DAE
	STA.w $06AF,x				;$B28DB0
	REP.b #$20				;$B28DB3
	JSL.l CODE_808063			;$B28DB5
	STA.w $06D1				;$B28DB9
	JSL.l CODE_808063			;$B28DBC
	STA.w $06D2				;$B28DC0
	JSL.l CODE_808063			;$B28DC3
	SEP.b #$20				;$B28DC7
	STA.w $06D3				;$B28DC9
	INC.w $06D5				;$B28DCC
	REP.b #$20				;$B28DCF
	STZ.b $22				;$B28DD1
	LDX.w #$0003				;$B28DD3
	STX.b $24				;$B28DD6
CODE_B28DD8:
	LDA.w $06D1,x				;$B28DD8
	AND.w #$00FF				;$B28DDB
	ASL					;$B28DDE
	TAX					;$B28DDF
	LDA.l DATA_FE8406,x			;$B28DE0
	STA.b $1E				;$B28DE4
	LDA.w #DATA_FE8428>>16			;$B28DE6
	STA.b $20				;$B28DE9
	LDY.w #$0004				;$B28DEB
	LDA.b [$1E],y				;$B28DEE
	CLC					;$B28DF0
	ADC.b $22				;$B28DF1
	STA.b $22				;$B28DF3
	DEC.b $24				;$B28DF5
	LDX.b $24				;$B28DF7
	BPL.b CODE_B28DD8			;$B28DF9
	LDA.w #$081C				;$B28DFB
	SEC					;$B28DFE
	SBC.b $22				;$B28DFF
	STA.w $1D37				;$B28E01
	RTS					;$B28E04

CODE_B28E05:
	LDA.w $04E4				;$B28E05
	STA.w !REGISTER_DMAEnable		;$B28E08
	JSL.l CODE_B38006			;$B28E0B
	JSL.l CODE_80801E			;$B28E0F
	LDX.w active_kong_sprite		;$B28E13
	LDA.b $16,x				;$B28E16
	EOR.w #$FFFF				;$B28E18
	INC					;$B28E1B
	SEP.b #$20				;$B28E1C
	STA.w !REGISTER_BG1VertScrollOffset	;$B28E1E
	XBA					;$B28E21
	STA.w !REGISTER_BG1VertScrollOffset	;$B28E22
	REP.b #$20				;$B28E25
	LDA.b $12,x				;$B28E27
	SEP.b #$20				;$B28E29
	STA.w !REGISTER_BG1HorizScrollOffset	;$B28E2B
	XBA					;$B28E2E
	STA.w !REGISTER_BG1HorizScrollOffset	;$B28E2F
	REP.b #$20				;$B28E32
	SEP.b #$20				;$B28E34
	LDA.w screen_brightness			;$B28E36
	STA.w !REGISTER_ScreenDisplayRegister	;$B28E39
	REP.b #$20				;$B28E3C
	STZ.w $1560				;$B28E3E
	STZ.w $155E				;$B28E41
	LDA.w screen_brightness			;$B28E44
	BIT.w #$FF00				;$B28E47
	BNE.b CODE_B28E61			;$B28E4A
	JSL.l CODE_808015			;$B28E4C
	LDA.w $04CE				;$B28E50
	BIT.w #$9080				;$B28E53
	BEQ.b CODE_B28E61			;$B28E56
	LDA.w #$0002				;$B28E58
	TSB.w $06AB				;$B28E5B
	JSR.w CODE_B28603			;$B28E5E
CODE_B28E61:
	JSL.l CODE_BB85C1			;$B28E61
	JSL.l CODE_B7800C			;$B28E65
	JSL.l CODE_B7800F			;$B28E69
	JSL.l CODE_808012			;$B28E6D
	JSR.w CODE_B28612			;$B28E71
	BEQ.b CODE_B28E84			;$B28E74
	LDA.b $F4				;$B28E76
	CMP.w $1D37				;$B28E78
	BCC.b CODE_B28E80			;$B28E7B
	JSR.w CODE_B28603			;$B28E7D
CODE_B28E80:
	JML.l CODE_808006			;$B28E80

CODE_B28E84:
	LDA.w #$0002				;$B28E84
	BIT.w $06AB				;$B28E87
	BEQ.b CODE_B28E9D			;$B28E8A
	LDA.w #CODE_808045			;$B28E8C
	STA.b $4E				;$B28E8F
	LDA.w #CODE_808045>>16			;$B28E91
	STA.b $50				;$B28E94
	LDA.w #CODE_808370			;$B28E96
	JML.l CODE_80803C			;$B28E99

CODE_B28E9D:
	LDA.w #$0001				;$B28E9D
	STA.w $0523				;$B28EA0
	LDX.w #CODE_80803F			;$B28EA3
	LDY.w #CODE_80803F>>16			;$B28EA6
	STX.b $4E				;$B28EA9
	STY.b $50				;$B28EAB
	LDA.w #CODE_808344			;$B28EAD
	JML.l CODE_80803C			;$B28EB0

CODE_B28EB4:
	LDA.w #$0043				;$B28EB4
	JSL.l vram_payload_handler_global	;$B28EB7
	LDA.w #$0038				;$B28EBB
	JSL.l set_PPU_registers_global		;$B28EBE
	LDA.w #$0023				;$B28EC2
	LDX.w #$0004				;$B28EC5
	LDY.w #$0000				;$B28EC8
	JSL.l CODE_BB856D			;$B28ECB
	JSR.w CODE_B28521			;$B28ECF
	PHK					;$B28ED2
	PLB					;$B28ED3
	LDA.w #$0200				;$B28ED4
	JSL.l CODE_808024			;$B28ED7
	LDA.w #CODE_B28EE5			;$B28EDB
	LDX.w #CODE_B28EE5>>16			;$B28EDE
	JML.l CODE_808003			;$B28EE1

CODE_B28EE5:
	LDA.w $04E4				;$B28EE5
	STA.w !REGISTER_DMAEnable		;$B28EE8
	JSL.l CODE_B38006			;$B28EEB
	JSL.l CODE_80801E			;$B28EEF
	SEP.b #$20				;$B28EF3
	LDA.w screen_brightness			;$B28EF5
	STA.w !REGISTER_ScreenDisplayRegister	;$B28EF8
	REP.b #$20				;$B28EFB
	STZ.w $1560				;$B28EFD
	STZ.w $155E				;$B28F00
	JSL.l CODE_808015			;$B28F03
	LDA.w $04CE				;$B28F07
	BIT.w #$9080				;$B28F0A
	BEQ.b CODE_B28F15			;$B28F0D
	LDA.w #$0002				;$B28F0F
	TSB.w $06AB				;$B28F12
CODE_B28F15:
	JSR.w CODE_B28612			;$B28F15
	BEQ.b CODE_B28F28			;$B28F18
	LDA.b $F4				;$B28F1A
	CMP.w #$005A				;$B28F1C
	BCC.b CODE_B28F24			;$B28F1F
	JSR.w CODE_B28603			;$B28F21
CODE_B28F24:
	JML.l CODE_808006			;$B28F24

CODE_B28F28:
	LDA.w #$0001				;$B28F28
	TSB.w $06AB				;$B28F2B
	BEQ.b CODE_B28F46			;$B28F2E
	LDA.w #$0004				;$B28F30
	TSB.w $06AB				;$B28F33
	BEQ.b CODE_B28F46			;$B28F36
	LDA.w #$0002				;$B28F38
	BIT.w $06AB				;$B28F3B
	BNE.b CODE_B28F52			;$B28F3E
	LDA.w #$0000				;$B28F40
	JMP.w CODE_B2850E			;$B28F43

CODE_B28F46:
	LDA.w #$0004				;$B28F46
	TSB.w $06AB				;$B28F49
	LDA.w #$0002				;$B28F4C
	JMP.w CODE_B2850E			;$B28F4F

CODE_B28F52:
	LDA.w #CODE_808045			;$B28F52
	LDX.w #CODE_808045>>16			;$B28F55
	JML.l CODE_808003			;$B28F58

rotating_cylinder_handle_main:
;$B28F5C
	LDY.b current_sprite			;$B28F5C
	LDA.w $1975				;$B28F5E
	CLC					;$B28F61
	ADC.w #$0080				;$B28F62
	AND.w #$00FF				;$B28F65
	ASL					;$B28F68
	TAX					;$B28F69
	LDA.l DATA_B9F278,x			;$B28F6A
	CLC					;$B28F6E
	ADC.w #$0100				;$B28F6F
	LSR					;$B28F72
	LSR					;$B28F73
	LSR					;$B28F74
	LSR					;$B28F75
	CLC					;$B28F76
	ADC.w #$003A				;$B28F77
	STA.b $1A				;$B28F7A
	LDA.w $1975				;$B28F7C
	CLC					;$B28F7F
	ADC.w #$00C0				;$B28F80
	AND.w #$00FF				;$B28F83
	ASL					;$B28F86
	TAX					;$B28F87
	LDA.l DATA_B9F278,x			;$B28F88
	CLC					;$B28F8C
	ADC.w #$0100				;$B28F8D
	LSR					;$B28F90
	LSR					;$B28F91
	LSR					;$B28F92
	LSR					;$B28F93
	LSR					;$B28F94
	LSR					;$B28F95
	LSR					;$B28F96
	CLC					;$B28F97
	ADC.w #$0010				;$B28F98
	STA.b $1C				;$B28F9B
	LDA.w $001E,y				;$B28F9D
	BIT.w #$4000				;$B28FA0
	BEQ.b CODE_B28FB9			;$B28FA3
	LDA.b $1C				;$B28FA5
	CLC					;$B28FA7
	ADC.w #$00DE				;$B28FA8
	STA.w $0012,y				;$B28FAB
	LDA.b $1A				;$B28FAE
	EOR.w #$FFFF				;$B28FB0
	CLC					;$B28FB3
	ADC.w #$0094				;$B28FB4
	BRA.b CODE_B28FC0			;$B28FB7

CODE_B28FB9:
	LDA.b $1C				;$B28FB9
	STA.w $0012,y				;$B28FBB
	LDA.b $1A				;$B28FBE
CODE_B28FC0:
	STA.w $0016,y				;$B28FC0
	JML [$04F5]				;$B28FC3

unknown_sprite_00DC_main:
;$B28FC6
	JML [$04F5]				;$B28FC6

rotating_cylinder_key_main:
;$B28FC9
	JSL.l process_sprite_animation		;$B28FC9
	JML [$04F5]				;$B28FCD

rare_logo_main:
;$B28FD0
	LDX.b current_sprite			;$B28FD0
	JSR.w CODE_B2903B			;$B28FD2
	JSR.w CODE_B29057			;$B28FD5
	LDA.b $16,x				;$B28FD8
	CMP.w #$00C0				;$B28FDA
	BCC.b CODE_B2902C			;$B28FDD
	LDA.b $2E,x				;$B28FDF
	CMP.w #$0100				;$B28FE1
	BCC.b CODE_B29020			;$B28FE4
	LDA.l $7EA15A				;$B28FE6
	BEQ.b CODE_B29008			;$B28FEA
	CMP.w #$0001				;$B28FEC
	BEQ.b CODE_B29003			;$B28FEF
	LDA.w #$0764				;$B28FF1
	JSL.l CODE_B28018			;$B28FF4
	LDA.w #$0001				;$B28FF8
	STA.w $15FE				;$B28FFB
	STA.w $1600				;$B28FFE
	BRA.b CODE_B29020			;$B29001

CODE_B29003:
	LDA.w #$0763				;$B29003
	BRA.b CODE_B2900D			;$B29006

CODE_B29008:
	LDA.w #$0762				;$B29008
	BRA.b CODE_B2900D			;$B2900B

CODE_B2900D:
	JSL.l CODE_B28018			;$B2900D
	LDA.l $7EA15A				;$B29011
	INC					;$B29015
	STA.l $7EA15A				;$B29016
	LDA.w #$0001				;$B2901A
	STA.w $15FE				;$B2901D
CODE_B29020:
	LDA.w #$00C0				;$B29020
	STA.b $16,x				;$B29023
	LDA.w #$0000				;$B29025
	STA.b $2E,x				;$B29028
	STA.b $2A,x				;$B2902A
CODE_B2902C:
	LDA.b $2E,x				;$B2902C
	CLC					;$B2902E
	ADC.w #$0080				;$B2902F
	STA.b $2E,x				;$B29032
	JSL.l process_sprite_animation		;$B29034
	JML [$04F5]				;$B29038

CODE_B2903B:
	LDA.b $29,x				;$B2903B
	AND.w #$FF00				;$B2903D
	CLC					;$B29040
	ADC.b $10,x				;$B29041
	STA.b $10,x				;$B29043
	LDA.b $2B,x				;$B29045
	AND.w #$00FF				;$B29047
	BIT.w #$0080				;$B2904A
	BEQ.b CODE_B29052			;$B2904D
	ORA.w #$FF00				;$B2904F
CODE_B29052:
	ADC.b $12,x				;$B29052
	STA.b $12,x				;$B29054
	RTS					;$B29056

CODE_B29057:
	LDA.b $2D,x				;$B29057
	AND.w #$FF00				;$B29059
	CLC					;$B2905C
	ADC.b $14,x				;$B2905D
	STA.b $14,x				;$B2905F
	LDA.b $2F,x				;$B29061
	AND.w #$00FF				;$B29063
	BIT.w #$0080				;$B29066
	BEQ.b CODE_B2906E			;$B29069
	ORA.w #$FF00				;$B2906B
CODE_B2906E:
	ADC.b $16,x				;$B2906E
	STA.b $16,x				;$B29070
	RTS					;$B29072

DATA_B29073:
	db $45,$00,$00,$00,$00,$47,$00,$00,$00,$00,$4C,$00,$00,$00,$00,$53
	db $00,$00,$00,$00,$5A,$00,$00,$00,$00,$60,$00,$00,$00,$00,$65,$00
	db $00,$00,$00,$67,$00,$00,$00,$00,$43,$04,$00,$00,$00,$3D,$0C,$00
	db $00,$00,$37,$14,$00,$00,$00,$35,$18

nintendo_presents_kong_main:
;$B290AC
	JSL.l process_sprite_animation		;$B290AC
	JSR.w CODE_B29057			;$B290B0
	LDX.b current_sprite			;$B290B3
	LDA.b $10,x				;$B290B5
	TAY					;$B290B7
	LDA.b $1E,x				;$B290B8
	BIT.w #$4000				;$B290BA
	BEQ.b CODE_B290D8			;$B290BD
	LDA.w $0016,y				;$B290BF
	CLC					;$B290C2
	ADC.w #$0027				;$B290C3
	STA.b $1A				;$B290C6
	CMP.b $16,x				;$B290C8
	BPL.b CODE_B290F0			;$B290CA
	LDA.b $1A				;$B290CC
	STA.b $16,x				;$B290CE
	LDA.w $0012,y				;$B290D0
	STA.b $12,x				;$B290D3
	JML [$04F5]				;$B290D5

CODE_B290D8:
	LDA.w $0016,y				;$B290D8
	CLC					;$B290DB
	ADC.w #$003C				;$B290DC
	STA.b $1A				;$B290DF
	CMP.b $16,x				;$B290E1
	BPL.b CODE_B290F0			;$B290E3
	LDA.b $1A				;$B290E5
	STA.b $16,x				;$B290E7
	LDA.w #$0001				;$B290E9
	STA.l $7EA35A				;$B290EC
CODE_B290F0:
	LDA.w $0012,y				;$B290F0
	STA.b $12,x				;$B290F3
	JML [$04F5]				;$B290F5

rare_logo_kiddy_main:
;$B290F8
	JSL.l process_sprite_animation		;$B290F8
	LDX.b current_sprite			;$B290FC
	LDA.b $2E,x				;$B290FE
	CLC					;$B29100
	ADC.w #$0040				;$B29101
	STA.b $2E,x				;$B29104
	LDA.w $1602				;$B29106
	BEQ.b CODE_B29129			;$B29109
	CMP.w #$0001				;$B2910B
	BNE.b CODE_B29120			;$B2910E
	LDA.w #$0300				;$B29110
	STA.b $2A,x				;$B29113
	LDA.w #$F700				;$B29115
	STA.b $2E,x				;$B29118
	LDA.w #$0002				;$B2911A
	STA.w $1602				;$B2911D
CODE_B29120:
	JSR.w CODE_B2903B			;$B29120
	JSR.w CODE_B29057			;$B29123
	JML [$04F5]				;$B29126

CODE_B29129:
	LDA.l $7EA15C				;$B29129
	TAY					;$B2912D
	LDA.w $0024,y				;$B2912E
	SEC					;$B29131
	SBC.w #$800A				;$B29132
	TAX					;$B29135
	LDA.l DATA_B29073+$01,x			;$B29136
	AND.w #$00FF				;$B2913A
	CLC					;$B2913D
	ADC.w $0012,y				;$B2913E
	CLC					;$B29141
	ADC.w #$000C				;$B29142
	LDX.b current_sprite			;$B29145
	STA.b $12,x				;$B29147
	LDA.w $0024,y				;$B29149
	SEC					;$B2914C
	SBC.w #$800A				;$B2914D
	TAX					;$B29150
	LDA.l DATA_B29073,x			;$B29151
	AND.w #$00FF				;$B29155
	CLC					;$B29158
	ADC.w $0016,y				;$B29159
	SEC					;$B2915C
	SBC.w #$006D				;$B2915D
	LDX.b current_sprite			;$B29160
	STA.b $16,x				;$B29162
	JML [$04F5]				;$B29164

rare_logo_dixie_main:
;$B29167
	JSL.l process_sprite_animation		;$B29167
	LDX.b current_sprite			;$B2916B
	LDA.b $2E,x				;$B2916D
	CLC					;$B2916F
	ADC.w #$0040				;$B29170
	STA.b $2E,x				;$B29173
	LDA.w $1602				;$B29175
	BEQ.b CODE_B29198			;$B29178
	CMP.w #$0002				;$B2917A
	BNE.b CODE_B2918F			;$B2917D
	LDA.w #$0300				;$B2917F
	STA.b $2A,x				;$B29182
	LDA.w #$F300				;$B29184
	STA.b $2E,x				;$B29187
	LDA.w #$0003				;$B29189
	STA.w $1602				;$B2918C
CODE_B2918F:
	JSR.w CODE_B2903B			;$B2918F
	JSR.w CODE_B29057			;$B29192
	JML [$04F5]				;$B29195

CODE_B29198:
	LDA.l $7EA15C				;$B29198
	TAY					;$B2919C
	LDA.w $0024,y				;$B2919D
	SEC					;$B291A0
	SBC.w #$800A				;$B291A1
	TAX					;$B291A4
	LDA.l DATA_B29073+$01,x			;$B291A5
	AND.w #$00FF				;$B291A9
	CLC					;$B291AC
	ADC.w $0012,y				;$B291AD
	SEC					;$B291B0
	SBC.w #$000C				;$B291B1
	LDX.b current_sprite			;$B291B4
	STA.b $12,x				;$B291B6
	LDA.w $0024,y				;$B291B8
	SEC					;$B291BB
	SBC.w #$800A				;$B291BC
	TAX					;$B291BF
	LDA.l DATA_B29073,x			;$B291C0
	AND.w #$00FF				;$B291C4
	CLC					;$B291C7
	ADC.w $0016,y				;$B291C8
	SEC					;$B291CB
	SBC.w #$006D				;$B291CC
	LDX.b current_sprite			;$B291CF
	STA.b $16,x				;$B291D1
	JML [$04F5]				;$B291D3

CODE_B291D6:
	PEA.w ((DATA_B9F278&$FF0000)>>16)|((CODE_B28B2C&$FF0000)>>8)	;$B291D6
	PLB					;$B291D9
	LDA.b $00				;$B291DA
	SEC					;$B291DC
	SBC.w #$0258				;$B291DD
	BMI.b CODE_B291F0			;$B291E0
	LSR					;$B291E2
	LSR					;$B291E3
	BEQ.b CODE_B291F0			;$B291E4
	CMP.w #$0008				;$B291E6
	BCC.b CODE_B291F3			;$B291E9
	LDA.w #$0008				;$B291EB
	BRA.b CODE_B291F3			;$B291EE

CODE_B291F0:
	LDA.w #$0001				;$B291F0
CODE_B291F3:
	EOR.w #$FFFF				;$B291F3
	INC					;$B291F6
	CLC					;$B291F7
	ADC.l $7EA25E,x				;$B291F8
	STA.l $7EA25E,x				;$B291FC
	CMP.w #$0020				;$B29200
	BCS.b CODE_B2920E			;$B29203
	PLB					;$B29205
	LDA.w #$0000				;$B29206
	STA.l $7EA25E,x				;$B29209
	RTS					;$B2920D

CODE_B2920E:
	STA.b $1E				;$B2920E
	CMP.w #$00C0				;$B29210
	BNE.b CODE_B29221			;$B29213
	LDA.l $7EA2A2,x				;$B29215
	ASL					;$B29219
	TAY					;$B2921A
	LDA.w #$0001				;$B2921B
	STA.w $15FE,y				;$B2921E
CODE_B29221:
	LDA.b $1E				;$B29221
	AND.w #$00FF				;$B29223
	ASL					;$B29226
	TAY					;$B29227
	LDA.w DATA_B9F278,y			;$B29228
	CLC					;$B2922B
	ADC.w #$0100				;$B2922C
	LSR					;$B2922F
	LSR					;$B29230
	STA.b $1A				;$B29231
	LSR					;$B29233
	LSR					;$B29234
	CLC					;$B29235
	ADC.b $1A				;$B29236
	LSR					;$B29238
	CLC					;$B29239
	ADC.w #$0020				;$B2923A
	STA.b $20				;$B2923D
	LDA.b $1E				;$B2923F
	CLC					;$B29241
	ADC.w #$0040				;$B29242
	AND.w #$00FF				;$B29245
	ASL					;$B29248
	TAY					;$B29249
	LDA.w DATA_B9F278,y			;$B2924A
	CLC					;$B2924D
	ADC.w #$0100				;$B2924E
	STA.b $22				;$B29251
	LDA.b $1E				;$B29253
	AND.w #$00FC				;$B29255
	BIT.w #$0080				;$B29258
	BEQ.b CODE_B29260			;$B2925B
	EOR.w #$00FC				;$B2925D
CODE_B29260:
	SEC					;$B29260
	SBC.w #$0024				;$B29261
	BPL.b CODE_B2926B			;$B29264
	LDA.w #$0000				;$B29266
	BRA.b CODE_B29277			;$B29269

CODE_B2926B:
	CLC					;$B2926B
	STA.b $1A				;$B2926C
	LSR					;$B2926E
	LSR					;$B2926F
	CLC					;$B29270
	ADC.b $1A				;$B29271
	CLC					;$B29273
	ADC.w #$0118				;$B29274
CODE_B29277:
	STA.b $24				;$B29277
	LDA.l $7EA258				;$B29279
	TAY					;$B2927D
	LDA.b $1E				;$B2927E
	CLC					;$B29280
	ADC.w #$0040				;$B29281
	LSR					;$B29284
	LSR					;$B29285
	LSR					;$B29286
	XBA					;$B29287
	EOR.w $001E,y				;$B29288
	AND.w #$1000				;$B2928B
	EOR.w $001E,y				;$B2928E
	STA.w $001E,y				;$B29291
	LDA.b $1E				;$B29294
	XBA					;$B29296
	EOR.w $001E,y				;$B29297
	AND.w #$8000				;$B2929A
	EOR.w $001E,y				;$B2929D
	STA.w $001E,y				;$B292A0
	LDA.b $24				;$B292A3
	STA.w $0024,y				;$B292A5
	LDA.b $22				;$B292A8
	STA.w $000E,y				;$B292AA
	STA.l $7EA2C4,x				;$B292AD
	LDA.l $7EA280,x				;$B292B1
	TAX					;$B292B5
	LDA.b $20				;$B292B6
	PLB					;$B292B8
	JSL.l CODE_B78018			;$B292B9
	RTS					;$B292BD

title_screen_sign_main:
;$B292BE
	LDA.w $06AB				;$B292BE
	BIT.w #$0002				;$B292C1
	BEQ.b CODE_B292DB			;$B292C4
	LDA.w $005C,y				;$B292C6
	STA.w $0012,y				;$B292C9
	LDA.w #$0002				;$B292CC
	STA.w $0038,y				;$B292CF
	LDA.w #$0000				;$B292D2
	STA.w $005A,y				;$B292D5
	LDX.w #$0004				;$B292D8
CODE_B292DB:
	JMP.w (DATA_B292DE,x)			;$B292DB

DATA_B292DE:
	dw CODE_B292E4
	dw CODE_B292EE
	dw CODE_B29302

CODE_B292E4:
	TYX					;$B292E4
	DEC.b $5E,x				;$B292E5
	BNE.b CODE_B292EB			;$B292E7
	INC.b $38,x				;$B292E9
CODE_B292EB:
	JML [$04F5]				;$B292EB

CODE_B292EE:
	TYX					;$B292EE
	LDA.b $5C,x				;$B292EF
	CMP.b $12,x				;$B292F1
	BCC.b CODE_B292FB			;$B292F3
	STA.b $12,x				;$B292F5
	STZ.b $5A,x				;$B292F7
	INC.b $38,x				;$B292F9
CODE_B292FB:
	JSL.l CODE_B9E000			;$B292FB
	JML [$04F5]				;$B292FF

CODE_B29302:
	JML [$04F5]				;$B29302

unknown_sprite_019C_main:
;$B29305
	LDA.w $06AB				;$B29305
	BIT.w #$0002				;$B29308
	BEQ.b CODE_B29322			;$B2930B
	LDA.w $006A,y				;$B2930D
	STA.w $0016,y				;$B29310
	LDA.w #$0002				;$B29313
	STA.w $0038,y				;$B29316
	LDA.w #$0000				;$B29319
	STA.w $005A,y				;$B2931C
	LDX.w #$0004				;$B2931F
CODE_B29322:
	JMP.w (DATA_B29325,x)			;$B29322

DATA_B29325:
	dw CODE_B292E4
	dw CODE_B2932B
	dw CODE_B29302

CODE_B2932B:
	TYX					;$B2932B
	LDA.b $2E,x				;$B2932C
	BPL.b CODE_B2934E			;$B2932E
	LDA.b $4C,x				;$B29330
	BMI.b CODE_B29355			;$B29332
	CLC					;$B29334
	ADC.w #$8001				;$B29335
	STA.b $4C,x				;$B29338
	LDY.w #$0679				;$B2933A
	CMP.w #$8002				;$B2933D
	BEQ.b CODE_B29347			;$B29340
	BCS.b CODE_B29355			;$B29342
	LDY.w #$0670				;$B29344
CODE_B29347:
	TYA					;$B29347
	JSL.l CODE_B28012			;$B29348
	BRA.b CODE_B29355			;$B2934C

CODE_B2934E:
	LDA.b $4C,x				;$B2934E
	AND.w #$7FFF				;$B29350
	STA.b $4C,x				;$B29353
CODE_B29355:
	JSL.l CODE_B9E000			;$B29355
	JML [$04F5]				;$B29359

CODE_B2935C:
	LDA.w #!Define_DKC3_MusicID_BonusTime	;$B2935C
	JSL.l CODE_B2800C			;$B2935F
	JSR.w CODE_B289D3			;$B29363
	LDA.w #$7000				;$B29366
	STA.w !REGISTER_VRAMAddressLo		;$B29369
	LDA.w #$0000				;$B2936C
CODE_B2936F:
	TAX					;$B2936F
	SEP.b #$20				;$B29370
	LDA.l DATA_FC0000+$01,x			;$B29372
	ORA.l DATA_FC0000+$10,x			;$B29376
	XBA					;$B2937A
	LDA.l DATA_FC0000,x			;$B2937B
	EOR.l DATA_FC0000+$01,x			;$B2937F
	EOR.l DATA_FC0000+$11,x			;$B29383
	AND.l DATA_FC0000+$00,x			;$B29387
	REP.b #$20				;$B2938B
	STA.w !REGISTER_WriteToVRAMPortLo	;$B2938D
	TXA					;$B29390
	CLC					;$B29391
	ADC.w #$0002				;$B29392
	BIT.w #$000E				;$B29395
	BNE.b CODE_B2936F			;$B29398
	CLC					;$B2939A
	ADC.w #$0010				;$B2939B
	TAX					;$B2939E
	CMP.w #$1000				;$B2939F
	BNE.b CODE_B2936F			;$B293A2
	LDA.w #$7400				;$B293A4
	STA.w !REGISTER_VRAMAddressLo		;$B293A7
	LDA.w #$0035				;$B293AA
	LDX.w #$0400				;$B293AD
CODE_B293B0:
	STA.w !REGISTER_WriteToVRAMPortLo	;$B293B0
	DEX					;$B293B3
	BNE.b CODE_B293B0			;$B293B4
	LDA.w #$002D				;$B293B6
	LDX.w #$0004				;$B293B9
	LDY.w #$0000				;$B293BC
	JSL.l CODE_BB856D			;$B293BF
	LDA.w #$0000				;$B293C3
	LDX.w #$1D04				;$B293C6
	LDY.w language_select			;$B293C9
	BEQ.b CODE_B293DF			;$B293CC
	LDX.w #$1D04				;$B293CE
	LDA.w #$04DB				;$B293D1
	CPY.w #$0001				;$B293D4
	BEQ.b CODE_B293DF			;$B293D7
	LDX.w #$1E38				;$B293D9
	LDA.w #$09AC				;$B293DC
CODE_B293DF:
	STA.w $15E4				;$B293DF
	STX.w $15EC				;$B293E2
	LDA.w #CODE_B293EF			;$B293E5
	LDX.w #CODE_B293EF>>16			;$B293E8
	JML.l CODE_808003			;$B293EB

CODE_B293EF:
	LDA.w $04E4				;$B293EF
	STA.w !REGISTER_DMAEnable		;$B293F2
	LDA.b $00				;$B293F5
	BIT.w #$0001				;$B293F7
	BEQ.b CODE_B2941D			;$B293FA
	LDA.w $1975				;$B293FC
	BIT.w #$000F				;$B293FF
	BNE.b CODE_B2941D			;$B29402
	LDA.w $1975				;$B29404
	CLC					;$B29407
	ADC.w #$00A0				;$B29408
	AND.w #$00F8				;$B2940B
	ASL					;$B2940E
	ASL					;$B2940F
	CLC					;$B29410
	ADC.w #$7406				;$B29411
	LDX.w $15E4				;$B29414
	JSR.w CODE_B294D3			;$B29417
	STX.w $15E4				;$B2941A
CODE_B2941D:
	LDA.w $1975				;$B2941D
	AND.w #$00F8				;$B29420
	ASL					;$B29423
	ASL					;$B29424
	CLC					;$B29425
	ADC.w #$7400				;$B29426
	STA.w !REGISTER_VRAMAddressLo		;$B29429
	LDX.w #$0020				;$B2942C
	LDA.w #$0035				;$B2942F
CODE_B29432:
	STA.w !REGISTER_WriteToVRAMPortLo	;$B29432
	DEX					;$B29435
	BNE.b CODE_B29432			;$B29436
	JSL.l CODE_B38006			;$B29438
	JSL.l CODE_80801E			;$B2943C
	SEP.b #$20				;$B29440
	LDA.w screen_brightness			;$B29442
	STA.w !REGISTER_ScreenDisplayRegister	;$B29445
	REP.b #$20				;$B29448
	STZ.w $1560				;$B2944A
	STZ.w $155E				;$B2944D
	LDA.b $00				;$B29450
	BIT.w #$0001				;$B29452
	BEQ.b CODE_B2945A			;$B29455
	INC.w $1975				;$B29457
CODE_B2945A:
	LDA.w $1975				;$B2945A
	SEC					;$B2945D
	SBC.w #$0010				;$B2945E
	STA.b $1A				;$B29461
	LDY.w #$0000				;$B29463
	LDX.w #$0000				;$B29466
	LDA.b $00				;$B29469
	BIT.w #$0001				;$B2946B
	BEQ.b CODE_B29484			;$B2946E
CODE_B29470:
	LDA.l DATA_B2B080,x			;$B29470
	CLC					;$B29474
	ADC.b $1A				;$B29475
	STA.l $7EA15A,x				;$B29477
	INX					;$B2947B
	INX					;$B2947C
	CPX.w #$00A2				;$B2947D
	BNE.b CODE_B29470			;$B29480
	BRA.b CODE_B29496			;$B29482

CODE_B29484:
	LDA.l DATA_B2AFDE,x			;$B29484
	CLC					;$B29488
	ADC.b $1A				;$B29489
	STA.l $7EA15A,x				;$B2948B
	INX					;$B2948F
	INX					;$B29490
	CPX.w #$00A2				;$B29491
	BNE.b CODE_B29484			;$B29494
CODE_B29496:
	JSL.l CODE_BB85C1			;$B29496
	JSL.l CODE_B7800C			;$B2949A
	JSL.l CODE_B7800F			;$B2949E
	JSL.l CODE_808012			;$B294A2
	JSR.w CODE_B28612			;$B294A6
	BEQ.b CODE_B294C3			;$B294A9
	LDA.b $F4				;$B294AB
	CMP.w $15EC				;$B294AD
	BNE.b CODE_B294BF			;$B294B0
	LDA.w #$880F				;$B294B2
	STA.w screen_brightness			;$B294B5
	LDA.w #$0003				;$B294B8
	JSL.l CODE_B2800F			;$B294BB
CODE_B294BF:
	JML.l CODE_808006			;$B294BF

CODE_B294C3:
	JSL.l CODE_80805D			;$B294C3
	STZ.b $BA				;$B294C7
	LDA.w #CODE_80805A			;$B294C9
	LDX.w #CODE_80805A>>16			;$B294CC
	JML.l CODE_808003			;$B294CF

CODE_B294D3:
	STA.b $1A				;$B294D3
	SEP.b #$20				;$B294D5
	LDA.b #$81				;$B294D7
	STA.w !REGISTER_VRAMAddressIncrementValue	;$B294D9
	REP.b #$20				;$B294DC
	LDA.l DATA_B2A126,x			;$B294DE
	AND.w #$00FF				;$B294E2
	BEQ.b CODE_B2950D			;$B294E5
	DEC					;$B294E7
	BEQ.b CODE_B29504			;$B294E8
	DEC					;$B294EA
	BEQ.b CODE_B294FB			;$B294EB
	DEC					;$B294ED
	BEQ.b CODE_B294F2			;$B294EE
	BRA.b CODE_B29518			;$B294F0

CODE_B294F2:
	LDA.w #$2800				;$B294F2
	STA.w $15E2				;$B294F5
	INX					;$B294F8
	BRA.b CODE_B29518			;$B294F9

CODE_B294FB:
	LDA.w #$2400				;$B294FB
	STA.w $15E2				;$B294FE
	INX					;$B29501
	BRA.b CODE_B29518			;$B29502

CODE_B29504:
	LDA.w #$2000				;$B29504
	STA.w $15E2				;$B29507
	INX					;$B2950A
	BRA.b CODE_B29518			;$B2950B

CODE_B2950D:
	SEP.b #$20				;$B2950D
	LDA.b #$80				;$B2950F
	STA.w !REGISTER_VRAMAddressIncrementValue	;$B29511
	REP.b #$20				;$B29514
	INX					;$B29516
	RTS					;$B29517

CODE_B29518:
	STX.b $1E				;$B29518
CODE_B2951A:
	LDA.l DATA_B2A126,x			;$B2951A
	INX					;$B2951E
	BIT.w #$0080				;$B2951F
	BEQ.b CODE_B2951A			;$B29522
	TXA					;$B29524
	SEC					;$B29525
	SBC.b $1E				;$B29526
	EOR.w #$FFFF				;$B29528
	CLC					;$B2952B
	ADC.w #$0014				;$B2952C
	LSR					;$B2952F
	ADC.b $1A				;$B29530
	STA.b $1A				;$B29532
	LDX.b $1E				;$B29534
CODE_B29536:
	LDA.l DATA_B2A126,x			;$B29536
	AND.w #$007F				;$B2953A
	CMP.w #$0020				;$B2953D
	BEQ.b CODE_B29560			;$B29540
	SEC					;$B29542
	SBC.w #$0021				;$B29543
	TXY					;$B29546
	TAX					;$B29547
	LDA.l DATA_B6F42C,x			;$B29548
	AND.w #$00FF				;$B2954C
	ASL					;$B2954F
	TYX					;$B29550
	LDY.b $1A				;$B29551
	STY.w !REGISTER_VRAMAddressLo		;$B29553
	ORA.w $15E2				;$B29556
	STA.w !REGISTER_WriteToVRAMPortLo	;$B29559
	INC					;$B2955C
	STA.w !REGISTER_WriteToVRAMPortLo	;$B2955D
CODE_B29560:
	LDA.l DATA_B2A126,x			;$B29560
	INX					;$B29564
	BIT.w #$0080				;$B29565
	BNE.b CODE_B2956E			;$B29568
	INC.b $1A				;$B2956A
	BRA.b CODE_B29536			;$B2956C

CODE_B2956E:
	SEP.b #$20				;$B2956E
	LDA.b #$80				;$B29570
	STA.w !REGISTER_VRAMAddressIncrementValue	;$B29572
	REP.b #$20				;$B29575
	RTS					;$B29577

CODE_B29578:
	PHK					;$B29578
	PLB					;$B29579
	LDA.w #CODE_808337			;$B2957A
	STA.b $52				;$B2957D
	LDA.w #CODE_808337>>16			;$B2957F
	STA.b $54				;$B29582
	JSL.l disable_screen_wrapper		;$B29584
	JSL.l CODE_808009			;$B29588
	JSL.l CODE_80801B			;$B2958C
	JSL.l CODE_80800C			;$B29590
	JSL.l CODE_BB857F			;$B29594
	JSR.w CODE_B28521			;$B29598
	LDA.w #$1D93				;$B2959B
	STA.w $0541				;$B2959E
	LDA.w #$000F				;$B295A1
	JSL.l CODE_BB859A			;$B295A4
	ORA.w #$3000				;$B295A8
	CLC					;$B295AB
	ADC.w #$01C0				;$B295AC
	STA.b $B4				;$B295AF
	LDA.b level_number			;$B295B1
	JSL.l CODE_BB85F4			;$B295B3
	LDA.w #$A000				;$B295B7
	TRB.w $0775				;$B295BA
	STZ.b $F4				;$B295BD
	STZ.b $BC				;$B295BF
	LDA.w #$0001				;$B295C1
	TRB.w $05AF				;$B295C4
	LDA.w #$0038				;$B295C7
	LDY.w #$0000				;$B295CA
	LDX.w #$0004				;$B295CD
	JSL.l CODE_BB856D			;$B295D0
	LDX.w #$0033				;$B295D4
	LDA.w $04C4				;$B295D7
	CMP.w #$0002				;$B295DA
	BNE.b CODE_B295E9			;$B295DD
	LDA.w $04C6				;$B295DF
	BEQ.b CODE_B295F4			;$B295E2
	LDX.w #$004E				;$B295E4
	BRA.b CODE_B295F4			;$B295E7

CODE_B295E9:
	LDA.w #$0040				;$B295E9
	BIT.w $053B				;$B295EC
	BEQ.b CODE_B295F4			;$B295EF
	LDX.w #$004E				;$B295F1
CODE_B295F4:
	STX.b $1A				;$B295F4
	LDA.w $075E				;$B295F6
	AND.w #$00FF				;$B295F9
	CMP.w #$0005				;$B295FC
	BNE.b CODE_B29604			;$B295FF
	LDA.w #$0002				;$B29601
CODE_B29604:
	STA.w $15E2				;$B29604
	CLC					;$B29607
	ADC.b $1A				;$B29608
	LDY.w #$0010				;$B2960A
	LDX.w #$001C				;$B2960D
	JSL.l CODE_BB856D			;$B29610
	LDA.w $15E2				;$B29614
	ASL					;$B29617
	TAX					;$B29618
	LDA.w DATA_B297F8-$02,x			;$B29619
	JSL.l vram_payload_handler_global	;$B2961C
	LDA.w #$0035				;$B29620
	JSL.l vram_payload_handler_global	;$B29623
	LDA.w #$002A				;$B29627
	JSL.l set_PPU_registers_global		;$B2962A
	LDY.w #$0208				;$B2962E
	JSL.l CODE_BB8588			;$B29631
	LDX.b alternate_sprite			;$B29635
	STZ.w $1D93				;$B29637
	STZ.b $60,x				;$B2963A
	LDA.w #$FFFF				;$B2963C
	STA.b $5E,x				;$B2963F
	LDA.w #$00A8				;$B29641
	STA.b $16,x				;$B29644
	LDA.w #$0088				;$B29646
	STA.b $12,x				;$B29649
	LDA.w $15E2				;$B2964B
	ASL					;$B2964E
	STA.b $1A				;$B2964F
	LDA.w language_select			;$B29651
	ASL					;$B29654
	ASL					;$B29655
	ASL					;$B29656
	CLC					;$B29657
	ADC.b $1A				;$B29658
	TAX					;$B2965A
	LDY.w DATA_B296EC-$02,x			;$B2965B
	LDA.w $0000,y				;$B2965E
	AND.w #$00FF				;$B29661
	STA.b $3E				;$B29664
	INY					;$B29666
	LDX.w #$FFE0				;$B29667
	JSR.w CODE_B29800			;$B2966A
	LDA.w $15E2				;$B2966D
	CMP.w #$0003				;$B29670
	BCC.b CODE_B2969B			;$B29673
	LDA.w $075F				;$B29675
	AND.w #$000F				;$B29678
	CLC					;$B2967B
	ADC.w #$0030				;$B2967C
	STA.b $22				;$B2967F
	LDA.w $075F				;$B29681
	AND.w #$00FF				;$B29684
	LSR					;$B29687
	LSR					;$B29688
	LSR					;$B29689
	LSR					;$B2968A
	CLC					;$B2968B
	ADC.w #$0030				;$B2968C
	XBA					;$B2968F
	ORA.b $22				;$B29690
	XBA					;$B29692
	LDX.b $3E				;$B29693
	BEQ.b CODE_B2969B			;$B29695
	STA.l $7EFFE0,x				;$B29697
CODE_B2969B:
	LDA.w #$0001				;$B2969B
	STA.w $04E4				;$B2969E
	LDA.w #$0010				;$B296A1
	SEP.b #$20				;$B296A4
	STA.w !REGISTER_BG1VertScrollOffset	;$B296A6
	XBA					;$B296A9
	STA.w !REGISTER_BG1VertScrollOffset	;$B296AA
	REP.b #$20				;$B296AD
	LDA.w $0765				;$B296AF
	AND.w #$003F				;$B296B2
	JSL.l CODE_B28009			;$B296B5
	LDA.l $00053B				;$B296B9
	AND.w #$0001				;$B296BD
	BEQ.b CODE_B296CE			;$B296C0
	LDA.w $0765				;$B296C2
	SEC					;$B296C5
	SBC.w #$002A				;$B296C6
	STA.w $0765				;$B296C9
	STA.b $08				;$B296CC
CODE_B296CE:
	LDA.w #$0200				;$B296CE
	JSL.l CODE_808024			;$B296D1
	LDA.w #$1D93				;$B296D5
	STA.w $0541				;$B296D8
	LDA.w #CODE_808370			;$B296DB
	STA.b $4A				;$B296DE
	STA.b $4C				;$B296E0
	LDA.w #CODE_B298BA			;$B296E2
	LDX.w #CODE_B298BA>>16			;$B296E5
	JML.l CODE_808003			;$B296E8

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
	LDA.w $0000,y				;$B29800
CODE_B29803:
	STA.l $7E0000,x				;$B29803
	INX					;$B29807
	INY					;$B29808
	LDA.w $0000,y				;$B29809
	AND.w #$00FF				;$B2980C
	BNE.b CODE_B29803			;$B2980F
	STA.l $7E0000,x				;$B29811
	RTS					;$B29815

CODE_B29816:
	LDY.w $0541				;$B29816
	LDX.b $00,y				;$B29819
	BEQ.b CODE_B29888			;$B2981B
	PHK					;$B2981D
	PLB					;$B2981E
	LDY.b $1E,x				;$B2981F
	LDA.b $5C,x				;$B29821
	LSR					;$B29823
	STA.b $3A				;$B29824
	ROL					;$B29826
	ASL					;$B29827
	ASL					;$B29828
	STA.b $3E				;$B29829
	LDA.b $00				;$B2982B
	STA.b $1A				;$B2982D
	LDA.b $12,x				;$B2982F
	SEC					;$B29831
	SBC.b $3E				;$B29832
	AND.w #$00FF				;$B29834
	XBA					;$B29837
	ORA.b $16,x				;$B29838
	XBA					;$B2983A
	LDX.b next_oam_slot			;$B2983B
	STA.b $1E				;$B2983D
	JSR.w CODE_B29889			;$B2983F
CODE_B29842:
	STA.b $00,x				;$B29842
	STY.b $02,x				;$B29844
	INY					;$B29846
	INY					;$B29847
	LDA.b $1E				;$B29848
	CLC					;$B2984A
	ADC.w #$0010				;$B2984B
	STA.b $1E				;$B2984E
	TYA					;$B29850
	AND.w #$000F				;$B29851
	BNE.b CODE_B2985C			;$B29854
	TYA					;$B29856
	CLC					;$B29857
	ADC.w #$0010				;$B29858
	TAY					;$B2985B
CODE_B2985C:
	PHX					;$B2985C
	PHY					;$B2985D
	TXA					;$B2985E
	AND.w #$01FF				;$B2985F
	PHA					;$B29862
	LSR					;$B29863
	LSR					;$B29864
	LSR					;$B29865
	LSR					;$B29866
	CLC					;$B29867
	ADC.w #$0400				;$B29868
	TAX					;$B2986B
	PLA					;$B2986C
	AND.w #$000F				;$B2986D
	LSR					;$B29870
	TAY					;$B29871
	LDA.w DATA_B298A2,y			;$B29872
	ORA.b $00,x				;$B29875
	STA.b $00,x				;$B29877
	JSR.w CODE_B29889			;$B29879
	PLY					;$B2987C
	PLX					;$B2987D
	INX					;$B2987E
	INX					;$B2987F
	INX					;$B29880
	INX					;$B29881
	DEC.b $3A				;$B29882
	BNE.b CODE_B29842			;$B29884
	STX.b next_oam_slot			;$B29886
CODE_B29888:
	RTL					;$B29888

CODE_B29889:
	STX.b $20				;$B29889
	LDA.b $1A				;$B2988B
	INC.b $1A				;$B2988D
	INC.b $1A				;$B2988F
	AND.w #$000F				;$B29891
	TAX					;$B29894
	LDA.w DATA_B298AA,x			;$B29895
	AND.w #$00FF				;$B29898
	XBA					;$B2989B
	CLC					;$B2989C
	ADC.b $1E				;$B2989D
	LDX.b $20				;$B2989F
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
	LDA.w $04E4				;$B298BA
	STA.w !REGISTER_DMAEnable		;$B298BD
	JSL.l CODE_B38006			;$B298C0
	JSL.l CODE_80801E			;$B298C4
	SEP.b #$20				;$B298C8
	LDA.w screen_brightness			;$B298CA
	STA.w !REGISTER_ScreenDisplayRegister	;$B298CD
	REP.b #$20				;$B298D0
	STZ.w $1560				;$B298D2
	STZ.w $155E				;$B298D5
	LDA.w screen_brightness			;$B298D8
	BIT.w #$FF00				;$B298DB
	BNE.b CODE_B298F6			;$B298DE
	JSL.l CODE_808015			;$B298E0
	LDA.w $04DA				;$B298E4
	BIT.w #$9080				;$B298E7
	BEQ.b CODE_B298F6			;$B298EA
	JSR.w CODE_B28603			;$B298EC
	LDA.w #$0001				;$B298EF
	JSL.l CODE_B2800F			;$B298F2
CODE_B298F6:
	JSL.l CODE_BB85C1			;$B298F6
	LDA.w #$1D93				;$B298FA
	STA.w $0541				;$B298FD
	LDY.w #$01CC				;$B29900
	LDA.w $053B				;$B29903
	AND.w #$0001				;$B29906
	BNE.b CODE_B2990E			;$B29909
	LDY.w #$025D				;$B2990B
CODE_B2990E:
	CPY.b $F4				;$B2990E
	BCS.b CODE_B2992C			;$B29910
	JSR.w CODE_B28603			;$B29912
	LDA.w #$0001				;$B29915
	TSB.w $05AF				;$B29918
	BNE.b CODE_B2992C			;$B2991B
	LDA.w $053B				;$B2991D
	AND.w #$0001				;$B29920
	BNE.b CODE_B2992C			;$B29923
	LDA.w #$0001				;$B29925
	JSL.l CODE_B2800F			;$B29928
CODE_B2992C:
	JSL.l CODE_B7800C			;$B2992C
	JSL.l CODE_B29816			;$B29930
	JSL.l CODE_808012			;$B29934
	JSR.w CODE_B28612			;$B29938
	BEQ.b CODE_B29941			;$B2993B
	JML.l CODE_808006			;$B2993D

CODE_B29941:
	LDX.w #CODE_808493			;$B29941
	LDY.w #CODE_808493>>16			;$B29944
	STX.b $4E				;$B29947
	STY.b $50				;$B29949
	LDA.w #CODE_808348			;$B2994B
	JML.l CODE_80803C			;$B2994E

CODE_B29952:
	PHK					;$B29952
	PLB					;$B29953
	LDA.w #CODE_808337			;$B29954
	STA.b $52				;$B29957
	LDA.w #CODE_808337>>16			;$B29959
	STA.b $54				;$B2995C
	JSR.w CODE_B28521			;$B2995E
	JSL.l disable_screen_wrapper		;$B29961
	JSL.l CODE_808009			;$B29965
	JSL.l CODE_80800C			;$B29969
	JSL.l CODE_80801B			;$B2996D
	JSL.l CODE_BB857F			;$B29971
	LDA.w #!Define_DKC3_MusicID_MamaBird	;$B29975
	JSL.l CODE_B28009			;$B29978
	LDA.w #$0047				;$B2997C
	LDY.w #$0000				;$B2997F
	LDX.w #$0020				;$B29982
	JSL.l CODE_BB856D			;$B29985
	LDA.w #$0037				;$B29989
	JSL.l vram_payload_handler_global	;$B2998C
	LDA.w #$0030				;$B29990
	JSL.l set_PPU_registers_global		;$B29993
	LDA.w #$FFFF				;$B29997
	STA.w $06D8				;$B2999A
	STA.w $06DA				;$B2999D
	LDA.w #$4000				;$B299A0
	STA.w $073C				;$B299A3
	JSL.l CODE_80807E			;$B299A6
	JSR.w CODE_B29CED			;$B299AA
	LDY.w #$0328				;$B299AD
	JSL.l CODE_BB8585			;$B299B0
	LDX.b alternate_sprite			;$B299B4
	STX.w $1C3F				;$B299B6
	JSL.l CODE_808081			;$B299B9
	LDY.w #$0326				;$B299BD
	JSL.l CODE_BB85B5			;$B299C0
	LDY.w #$032C				;$B299C4
	JSL.l CODE_BB85B5			;$B299C7
	JSR.w CODE_B29D51			;$B299CB
	SEP.b #$20				;$B299CE
	LDX.w #(!REGISTER_BG3HorizScrollOffset&$0000FF<<8)+$02	;$B299D0
	STX.w HDMA[$01].Parameters		;$B299D3
	LDX.w #$7EA174				;$B299D6
	STX.w HDMA[$01].SourceLo		;$B299D9
	LDA.b #$7EA174>>16			;$B299DC
	STA.w HDMA[$01].SourceBank		;$B299DE
	STZ.w HDMA[$01].IndirectSourceBank	;$B299E1
	LDX.w #(!REGISTER_BG3VertScrollOffset&$0000FF<<8)+$02	;$B299E4
	STX.w HDMA[$02].Parameters		;$B299E7
	LDX.w #$7EA16A				;$B299EA
	STX.w HDMA[$02].SourceLo		;$B299ED
	LDA.b #$7EA16A>>16			;$B299F0
	STA.w HDMA[$02].SourceBank		;$B299F2
	STZ.w HDMA[$02].IndirectSourceBank	;$B299F5
	LDX.w #(!REGISTER_ColorMathInitialSettings&$0000FF<<8)+$00	;$B299F8
	STX.w HDMA[$03].Parameters		;$B299FB
	LDX.w #$7EA1DA				;$B299FE
	STX.w HDMA[$03].SourceLo		;$B29A01
	LDA.b #$7EA1DA>>16			;$B29A04
	STA.w HDMA[$03].SourceBank		;$B29A06
	STA.w HDMA[$03].IndirectSourceBank	;$B29A09
	LDX.w #(!REGISTER_Window1LeftPositionDesignation&$0000FF<<8)+$41	;$B29A0C
	STX.w HDMA[$07].Parameters		;$B29A0F
	LDX.w #$7EA25A				;$B29A12
	STX.w HDMA[$07].SourceLo		;$B29A15
	LDA.b #$7EA25A>>16			;$B29A18
	STA.w HDMA[$07].SourceBank		;$B29A1A
	STA.w HDMA[$07].IndirectSourceBank	;$B29A1D
	REP.b #$20				;$B29A20
	LDA.w #$0001				;$B29A22
	STA.w $1C49				;$B29A25
	LDA.w #$003F				;$B29A28
	STA.w $1C4B				;$B29A2B
	LDA.w #$00FF				;$B29A2E
	STA.l $7EA25A				;$B29A31
	STA.l $7EA25D				;$B29A35
	LDA.w #$A47A				;$B29A39
	STA.l $7EA25B				;$B29A3C
	LDA.w #$A578				;$B29A40
	STA.l $7EA25E				;$B29A43
	LDA.w #$0000				;$B29A47
	STA.l $7EA260				;$B29A4A
	LDA.w #$0001				;$B29A4E
	STA.l $7EA45A				;$B29A51
	LDX.w #$7EA45A				;$B29A55
	LDY.w #$7EA45C				;$B29A58
	LDA.w #$01E0				;$B29A5B
	MVN $7EA45C>>16,$7EA45A>>16		;$B29A5E
	LDX.w #DATA_B29EDA			;$B29A61
	LDY.w #$7EA16A				;$B29A64
	LDA.w #$001D				;$B29A67
	MVN $7EA16A>>16,DATA_B29EDA>>16		;$B29A6A
	PHK					;$B29A6D
	PLB					;$B29A6E
	LDA.w #$8E01				;$B29A6F
	STA.w $04E4				;$B29A72
	LDY.w #$0324				;$B29A75
	JSL.l CODE_BB85B5			;$B29A78
	LDX.b alternate_sprite			;$B29A7C
	STX.w $1C41				;$B29A7E
	STZ.b $20				;$B29A81
	STZ.b $1E				;$B29A83
	STZ.b $1C				;$B29A85
	LDA.w #$0014				;$B29A87
	STA.w $1C45				;$B29A8A
	JSL.l CODE_B78027			;$B29A8D
	STZ.w $1C3B				;$B29A91
	STZ.w $1C37				;$B29A94
	LDA.w #$0060				;$B29A97
	STA.w $1C39				;$B29A9A
	LDA.w #$000F				;$B29A9D
	JSL.l CODE_BB859A			;$B29AA0
	ORA.w #$3000				;$B29AA4
	CLC					;$B29AA7
	ADC.w #$01C0				;$B29AA8
	STA.b $B4				;$B29AAB
	JSL.l CODE_80801E			;$B29AAD
	JSL.l CODE_80801E			;$B29AB1
	JSL.l CODE_80801E			;$B29AB5
	JSL.l CODE_80801E			;$B29AB9
	LDA.w #$0200				;$B29ABD
	JSL.l CODE_808024			;$B29AC0
	LDA.w #$000200				;$B29AC4
	STA.w DMA[$00].SourceLo			;$B29AC7
	STA.w DMA[$00].Unused2			;$B29ACA
	LDA.w #$0220				;$B29ACD
	STA.w DMA[$00].SizeLo			;$B29AD0
	LDA.w #(!REGISTER_OAMDataWritePort&$0000FF<<8)+$00	;$B29AD3
	STA.w DMA[$00].Parameters		;$B29AD6
	SEP.b #$20				;$B29AD9
	STZ.w DMA[$00].SourceBank		;$B29ADB
	LDA.b #$01				;$B29ADE
	STA.w !REGISTER_DMAEnable		;$B29AE0
	REP.b #$20				;$B29AE3
	LDA.w #CODE_B29AEF			;$B29AE5
	LDX.w #CODE_B29AEF>>16			;$B29AE8
	JML.l CODE_808003			;$B29AEB

CODE_B29AEF:
	LDA.w $04E4				;$B29AEF
	STA.w !REGISTER_DMAEnable		;$B29AF2
	JSL.l CODE_B38006			;$B29AF5
	JSL.l CODE_80801E			;$B29AF9
	JSR.w CODE_B29D64			;$B29AFD
	LDA.w #$0001				;$B29B00
	TRB.w $1C35				;$B29B03
	BEQ.b CODE_B29B13			;$B29B06
	LDA.w $15E8				;$B29B08
	CMP.w #$0002				;$B29B0B
	BCS.b CODE_B29B13			;$B29B0E
	JSR.w CODE_B29F14			;$B29B10
CODE_B29B13:
	SEP.b #$20				;$B29B13
	LDA.w screen_brightness			;$B29B15
	STA.w !REGISTER_ScreenDisplayRegister	;$B29B18
	REP.b #$20				;$B29B1B
	STZ.w $1560				;$B29B1D
	STZ.w $155E				;$B29B20
	JSR.w CODE_B29BC1			;$B29B23
	LDA.w screen_brightness			;$B29B26
	BIT.w #$FF00				;$B29B29
	BNE.b CODE_B29B32			;$B29B2C
	JSL.l CODE_808015			;$B29B2E
CODE_B29B32:
	JSR.w CODE_B29EFA			;$B29B32
	JSR.w CODE_B29BA4			;$B29B35
	LDA.w $1C39				;$B29B38
	BEQ.b CODE_B29B4A			;$B29B3B
	DEC.w $1C39				;$B29B3D
	BNE.b CODE_B29B4A			;$B29B40
	LDA.w $1C37				;$B29B42
	ASL					;$B29B45
	TAX					;$B29B46
	JSR.w (DATA_B29FCA,x)			;$B29B47
CODE_B29B4A:
	JSR.w CODE_B2A10A			;$B29B4A
	JSL.l CODE_BB85C1			;$B29B4D
	JSL.l CODE_B7800C			;$B29B51
	JSL.l CODE_B7800F			;$B29B55
	JSL.l CODE_808012			;$B29B59
	JSR.w CODE_B28612			;$B29B5D
	BEQ.b CODE_B29B66			;$B29B60
	JML.l CODE_808006			;$B29B62

CODE_B29B66:
	LDA.w #$0002				;$B29B66
	BIT.w $1C35				;$B29B69
	BEQ.b CODE_B29B93			;$B29B6C
	LDA.w #$0040				;$B29B6E
	TRB.w $05FB				;$B29B71
	LDA.w #$0001				;$B29B74
	STA.w $0523				;$B29B77
	LDA.w #$0001				;$B29B7A
	STA.w $052F				;$B29B7D
	STZ.b $00				;$B29B80
	LDX.w #CODE_808069			;$B29B82
	LDY.w #CODE_808069>>16			;$B29B85
	STX.b $4E				;$B29B88
	STY.b $50				;$B29B8A
	LDA.w #CODE_808362			;$B29B8C
	JML.l CODE_80803C			;$B29B8F

CODE_B29B93:
	LDX.w #CODE_B48009			;$B29B93
	LDY.w #CODE_B48009>>16			;$B29B96
	STX.b $4E				;$B29B99
	STY.b $50				;$B29B9B
	LDA.w #CODE_808362			;$B29B9D
	JML.l CODE_80803C			;$B29BA0

CODE_B29BA4:
	LDA.w $15E8				;$B29BA4
	CMP.w #$01A8				;$B29BA7
	BNE.b CODE_B29BB4			;$B29BAA
	LDA.w #$074F				;$B29BAC
	JSL.l CODE_B28012			;$B29BAF
	RTS					;$B29BB3

CODE_B29BB4:
	CMP.w #$01A2				;$B29BB4
	BNE.b CODE_B29BC0			;$B29BB7
	LDA.w #$050E				;$B29BB9
	JSL.l CODE_B28012			;$B29BBC
CODE_B29BC0:
	RTS					;$B29BC0

CODE_B29BC1:
	LDA.w $1C49				;$B29BC1
	BEQ.b CODE_B29BC9			;$B29BC4
	JSR.w CODE_B29BCE			;$B29BC6
CODE_B29BC9:
	RTS					;$B29BC9

CODE_B29BCA:
	JSR.w CODE_B29BCE			;$B29BCA
	RTL					;$B29BCD

CODE_B29BCE:
	BEQ.b CODE_B29C14			;$B29BCE
	STA.b $1C				;$B29BD0
	STZ.b $1A				;$B29BD2
	LDA.w #$0001				;$B29BD4
	SEC					;$B29BD7
	SBC.b $1C				;$B29BD8
	STA.b $1E				;$B29BDA
	JSR.w CODE_B29C15			;$B29BDC
	JSR.w CODE_B29C56			;$B29BDF
CODE_B29BE2:
	LDA.b $1E				;$B29BE2
	BPL.b CODE_B29BF6			;$B29BE4
	LDA.b $1A				;$B29BE6
	ASL					;$B29BE8
	CLC					;$B29BE9
	ADC.w #$0003				;$B29BEA
	CLC					;$B29BED
	ADC.b $1E				;$B29BEE
	STA.b $1E				;$B29BF0
	INC.b $1A				;$B29BF2
	BRA.b CODE_B29C09			;$B29BF4

CODE_B29BF6:
	LDA.b $1A				;$B29BF6
	SEC					;$B29BF8
	SBC.b $1C				;$B29BF9
	ASL					;$B29BFB
	CLC					;$B29BFC
	ADC.b $1E				;$B29BFD
	CLC					;$B29BFF
	ADC.w #$0005				;$B29C00
	STA.b $1E				;$B29C03
	INC.b $1A				;$B29C05
	DEC.b $1C				;$B29C07
CODE_B29C09:
	JSR.w CODE_B29C56			;$B29C09
	LDA.b $1A				;$B29C0C
	CMP.b $1C				;$B29C0E
	BEQ.b CODE_B29BE2			;$B29C10
	BCC.b CODE_B29BE2			;$B29C12
CODE_B29C14:
	RTS					;$B29C14

CODE_B29C15:
	LDA.b $1C				;$B29C15
	CLC					;$B29C17
	ADC.w #$0081				;$B29C18
	ASL					;$B29C1B
	TAX					;$B29C1C
	BPL.b CODE_B29C22			;$B29C1D
	LDX.w #$0000				;$B29C1F
CODE_B29C22:
	CPX.w #$01E0				;$B29C22
	BCC.b CODE_B29C2A			;$B29C25
	LDX.w #$01E0				;$B29C27
CODE_B29C2A:
	LDA.w #$00FF				;$B29C2A
	STA.l $7EA45A,x				;$B29C2D
	STA.l $7EA45C,x				;$B29C31
	LDA.w #$007F				;$B29C35
	SEC					;$B29C38
	SBC.b $1C				;$B29C39
	ASL					;$B29C3B
	TAX					;$B29C3C
	BPL.b CODE_B29C42			;$B29C3D
	LDX.w #$0000				;$B29C3F
CODE_B29C42:
	CPX.w #$01E0				;$B29C42
	BCC.b CODE_B29C4A			;$B29C45
	LDX.w #$01E0				;$B29C47
CODE_B29C4A:
	LDA.w #$00FF				;$B29C4A
	STA.l $7EA45A,x				;$B29C4D
	STA.l $7EA458,x				;$B29C51
	RTS					;$B29C55

CODE_B29C56:
	LDA.b $1C				;$B29C56
	CLC					;$B29C58
	ADC.w #$0080				;$B29C59
	ASL					;$B29C5C
	TAX					;$B29C5D
	JSR.w CODE_B29C83			;$B29C5E
	LDA.w #$0080				;$B29C61
	SEC					;$B29C64
	SBC.b $1C				;$B29C65
	ASL					;$B29C67
	TAX					;$B29C68
	JSR.w CODE_B29C83			;$B29C69
	LDA.b $1A				;$B29C6C
	CLC					;$B29C6E
	ADC.w #$0080				;$B29C6F
	ASL					;$B29C72
	TAX					;$B29C73
	JSR.w CODE_B29CB8			;$B29C74
	LDA.w #$0080				;$B29C77
	SEC					;$B29C7A
	SBC.b $1A				;$B29C7B
	ASL					;$B29C7D
	TAX					;$B29C7E
	JSR.w CODE_B29CB8			;$B29C7F
	RTS					;$B29C82

CODE_B29C83:
	BPL.b CODE_B29C88			;$B29C83
	LDX.w #$0000				;$B29C85
CODE_B29C88:
	CPX.w #$01E0				;$B29C88
	BCC.b CODE_B29C90			;$B29C8B
	LDX.w #$01E0				;$B29C8D
CODE_B29C90:
	LDA.b $1A				;$B29C90
	CLC					;$B29C92
	ADC.w #$0080				;$B29C93
	CMP.w #$0100				;$B29C96
	BCC.b CODE_B29C9E			;$B29C99
	LDA.w #$00FF				;$B29C9B
CODE_B29C9E:
	SEP.b #$20				;$B29C9E
	STA.l $7EA45B,x				;$B29CA0
	REP.b #$20				;$B29CA4
	LDA.w #$0080				;$B29CA6
	SEC					;$B29CA9
	SBC.b $1A				;$B29CAA
	BPL.b CODE_B29CAF			;$B29CAC
	TDC					;$B29CAE
CODE_B29CAF:
	SEP.b #$20				;$B29CAF
	STA.l $7EA45A,x				;$B29CB1
	REP.b #$20				;$B29CB5
	RTS					;$B29CB7

CODE_B29CB8:
	BPL.b CODE_B29CBD			;$B29CB8
	LDX.w #$0000				;$B29CBA
CODE_B29CBD:
	CPX.w #$01E0				;$B29CBD
	BCC.b CODE_B29CC5			;$B29CC0
	LDX.w #$01E0				;$B29CC2
CODE_B29CC5:
	LDA.b $1C				;$B29CC5
	CLC					;$B29CC7
	ADC.w #$0080				;$B29CC8
	CMP.w #$0100				;$B29CCB
	BCC.b CODE_B29CD3			;$B29CCE
	LDA.w #$00FF				;$B29CD0
CODE_B29CD3:
	SEP.b #$20				;$B29CD3
	STA.l $7EA45B,x				;$B29CD5
	REP.b #$20				;$B29CD9
	LDA.w #$0080				;$B29CDB
	SEC					;$B29CDE
	SBC.b $1C				;$B29CDF
	BPL.b CODE_B29CE4			;$B29CE1
	TDC					;$B29CE3
CODE_B29CE4:
	SEP.b #$20				;$B29CE4
	STA.l $7EA45A,x				;$B29CE6
	REP.b #$20				;$B29CEA
	RTS					;$B29CEC

CODE_B29CED:
	JSL.l CODE_B8806F			;$B29CED
	LDA.w $05B5				;$B29CF1
	JSL.l CODE_B8805A			;$B29CF4
	LDA.w $05AF				;$B29CF8
	BIT.w #$4000				;$B29CFB
	BNE.b CODE_B29D08			;$B29CFE
	LDX.w follower_kong_sprite		;$B29D00
	LDA.w #$C000				;$B29D03
	STA.b $26,x				;$B29D06
CODE_B29D08:
	JSR.w CODE_B29D0C			;$B29D08
	RTS					;$B29D0B

CODE_B29D0C:
	LDX.w active_kong_sprite		;$B29D0C
	LDY.w #DATA_B29D41			;$B29D0F
	JSR.w CODE_B29D1B			;$B29D12
	LDX.w follower_kong_sprite		;$B29D15
	LDY.w #DATA_B29D49			;$B29D18
CODE_B29D1B:
	LDA.w $0000,y				;$B29D1B
	STA.b $12,x				;$B29D1E
	LDA.w $0002,y				;$B29D20
	STA.b $16,x				;$B29D23
	LDA.w $0004,y				;$B29D25
	STA.b $5E,x				;$B29D28
	LDA.w $0006,y				;$B29D2A
	STA.b $0E,x				;$B29D2D
	LDA.w #$FEC8				;$B29D2F
	STA.b $30,x				;$B29D32
	STA.b $2A,x				;$B29D34
	LDA.w #$FF90				;$B29D36
	STA.b $2E,x				;$B29D39
	LDA.w #$0004				;$B29D3B
	STA.b $38,x				;$B29D3E
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
	LDA.w #$0240				;$B29D51
	STA.l $7EA1DA				;$B29D54
	STA.l $7EA1DC				;$B29D58
	LDA.w #$0001				;$B29D5C
	STA.l $7EA1DE				;$B29D5F
	RTS					;$B29D63

CODE_B29D64:
	LDA.w $15E8				;$B29D64
	BEQ.b CODE_B29DB9			;$B29D67
	CMP.w #$0180				;$B29D69
	BCC.b CODE_B29DB9			;$B29D6C
	BNE.b CODE_B29D83			;$B29D6E
	LDA.w #$8001				;$B29D70
	STA.w $04E4				;$B29D73
	RTS					;$B29D76

CODE_B29D77:
	LDA.w #$0E01				;$B29D77
	STA.w $04E4				;$B29D7A
	STZ.w $15E8				;$B29D7D
	JMP.w CODE_B29EB8			;$B29D80

CODE_B29D83:
	CMP.w #$0181				;$B29D83
	BNE.b CODE_B29D8E			;$B29D86
	JSR.w CODE_B29E9F			;$B29D88
	STZ.b $00				;$B29D8B
	RTS					;$B29D8D

CODE_B29D8E:
	CMP.w #$01C0				;$B29D8E
	BCS.b CODE_B29D77			;$B29D91
	LDA.w $1C4B				;$B29D93
	DEC					;$B29D96
	BMI.b CODE_B29DA9			;$B29D97
	STA.w $1C4B				;$B29D99
	AND.w #$001F				;$B29D9C
	ORA.w #$00E0				;$B29D9F
	SEP.b #$20				;$B29DA2
	STA.w !REGISTER_FixedColorData		;$B29DA4
	REP.b #$20				;$B29DA7
CODE_B29DA9:
	LDA.w $1C49				;$B29DA9
	CLC					;$B29DAC
	ADC.w #$0006				;$B29DAD
	CMP.w #$00A8				;$B29DB0
	BCS.b CODE_B29DB8			;$B29DB3
	STA.w $1C49				;$B29DB5
CODE_B29DB8:
	RTS					;$B29DB8

CODE_B29DB9:
	LDA.w $15E6				;$B29DB9
	BEQ.b CODE_B29DD8			;$B29DBC
	LDA.w $15E4				;$B29DBE
	CMP.w #$0100				;$B29DC1
	BPL.b CODE_B29DD8			;$B29DC4
	JSL.l CODE_808018			;$B29DC6
	AND.w #$0003				;$B29DCA
	DEC					;$B29DCD
	CLC					;$B29DCE
	ADC.w $15E4				;$B29DCF
	BPL.b CODE_B29DD5			;$B29DD2
	TDC					;$B29DD4
CODE_B29DD5:
	STA.w $15E4				;$B29DD5
CODE_B29DD8:
	LDA.w $15E4				;$B29DD8
	CMP.w #$0080				;$B29DDB
	BPL.b CODE_B29DE3			;$B29DDE
	LDA.w #$0080				;$B29DE0
CODE_B29DE3:
	CMP.w #$009F				;$B29DE3
	BMI.b CODE_B29DEB			;$B29DE6
	LDA.w #$009F				;$B29DE8
CODE_B29DEB:
	AND.w #$001F				;$B29DEB
	EOR.w #$001F				;$B29DEE
	STA.b $1E				;$B29DF1
	SEP.b #$20				;$B29DF3
	LDA.b #$71				;$B29DF5
	STA.w !REGISTER_CGRAMAddress		;$B29DF7
	REP.b #$20				;$B29DFA
	LDX.w #$0000				;$B29DFC
CODE_B29DFF:
	LDA.l DATA_B29E81,x			;$B29DFF
	SEC					;$B29E03
	SBC.b $1E				;$B29E04
	BPL.b CODE_B29E0B			;$B29E06
	LDA.w #$0000				;$B29E08
CODE_B29E0B:
	STA.b $1C				;$B29E0B
	ASL					;$B29E0D
	ASL					;$B29E0E
	XBA					;$B29E0F
	TSB.b $1C				;$B29E10
	XBA					;$B29E12
	ASL					;$B29E13
	ASL					;$B29E14
	ASL					;$B29E15
	ORA.b $1C				;$B29E16
	SEP.b #$20				;$B29E18
	STA.w !REGISTER_WriteToCGRAMPort	;$B29E1A
	XBA					;$B29E1D
	STA.w !REGISTER_WriteToCGRAMPort	;$B29E1E
	REP.b #$20				;$B29E21
	INX					;$B29E23
	INX					;$B29E24
	CPX.w #$001E				;$B29E25
	BNE.b CODE_B29DFF			;$B29E28
	LDA.w $15E4				;$B29E2A
	CMP.w #$005A				;$B29E2D
	BCC.b CODE_B29E35			;$B29E30
	LDA.w #$005A				;$B29E32
CODE_B29E35:
	EOR.w #$FFFF				;$B29E35
	SEC					;$B29E38
	ADC.w #$005C				;$B29E39
	STA.b $1A				;$B29E3C
	EOR.w #$00FF				;$B29E3E
	SEC					;$B29E41
	SBC.w #$006D				;$B29E42
	LSR					;$B29E45
	SEP.b #$20				;$B29E46
	STA.l $7EA1DA				;$B29E48
	STA.l $7EA1DC				;$B29E4C
	REP.b #$20				;$B29E50
	SEP.b #$20				;$B29E52
	LDA.b $1A				;$B29E54
	STA.w !REGISTER_BG2VertScrollOffset	;$B29E56
	STZ.w !REGISTER_BG2VertScrollOffset	;$B29E59
	REP.b #$20				;$B29E5C
	LDA.w $15E8				;$B29E5E
	BIT.w #$FF00				;$B29E61
	BEQ.b CODE_B29E80			;$B29E64
	SEP.b #$20				;$B29E66
	LDA.b #$81				;$B29E68
	STA.w !REGISTER_CGRAMAddress		;$B29E6A
	LDY.w #$001E				;$B29E6D
	LDX.w #$0000				;$B29E70
CODE_B29E73:
	LDA.l $7E3180,x				;$B29E73
	STA.w !REGISTER_WriteToCGRAMPort	;$B29E77
	INX					;$B29E7A
	DEY					;$B29E7B
	BNE.b CODE_B29E73			;$B29E7C
	REP.b #$20				;$B29E7E
CODE_B29E80:
	RTS					;$B29E80

DATA_B29E81:
	dw $0002,$0004,$0006,$0008,$000A,$000D,$000F,$0011
	dw $0013,$0015,$0017,$0019,$001B,$001D,$001F

CODE_B29E9F:
	LDA.w #$8000				;$B29E9F
	TSB.w $04E4				;$B29EA2
	LDA.w #$3322				;$B29EA5
	STA.w !REGISTER_ColorMathInitialSettings	;$B29EA8
	LDA.w #$0013				;$B29EAB
	STA.w !REGISTER_MainScreenLayers	;$B29EAE
	LDA.w #$0030				;$B29EB1
	STA.w !REGISTER_ObjectAndColorWindowSettings	;$B29EB4
	RTS					;$B29EB7

CODE_B29EB8:
	STZ.w $1C49				;$B29EB8
	LDA.w #$1100				;$B29EBB
	STA.w !REGISTER_ColorMathInitialSettings	;$B29EBE
	LDA.w #$2011				;$B29EC1
	STA.w !REGISTER_ColorMathSelectAndEnable	;$B29EC4
	LDA.w #$0213				;$B29EC7
	STA.w !REGISTER_MainScreenLayers	;$B29ECA
	STZ.w !REGISTER_ObjectAndColorWindowSettings	;$B29ECD
	SEP.b #$20				;$B29ED0
	LDA.b #$E0				;$B29ED2
	STA.w !REGISTER_FixedColorData		;$B29ED4
	REP.b #$20				;$B29ED7
	RTS					;$B29ED9

DATA_B29EDA:
	dw $007F,$2100,$0000,$0040,$0000,$007F,$3800,$0000
	dw $003C,$0800,$0000,$0008,$0800,$0000,$0008,$0000

CODE_B29EFA:
	LDX.w $1C41				;$B29EFA
	LDA.b $16,x				;$B29EFD
	CLC					;$B29EFF
	ADC.w #$000A				;$B29F00
	STA.l $7EA171				;$B29F03
	EOR.w #$FFFF				;$B29F07
	INC					;$B29F0A
	CLC					;$B29F0B
	ADC.w #$0043				;$B29F0C
	STA.l $7EA174				;$B29F0F
	RTS					;$B29F13

CODE_B29F14:
	LDA.w #$0217				;$B29F14
	STA.w !REGISTER_MainScreenLayers	;$B29F17
	LDX.w #$72E0				;$B29F1A
	STX.w !REGISTER_VRAMAddressLo		;$B29F1D
	LDA.w #$7EF5C0				;$B29F20
	STA.w DMA[$00].SourceLo			;$B29F23
	STA.w DMA[$00].Unused2			;$B29F26
	LDA.w #$0100				;$B29F29
	STA.w DMA[$00].SizeLo			;$B29F2C
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01	;$B29F2F
	STA.w DMA[$00].Parameters		;$B29F32
	SEP.b #$20				;$B29F35
	LDA.b #$7EF5C0>>16			;$B29F37
	STA.w DMA[$00].SourceBank		;$B29F39
	LDA.b #$01				;$B29F3C
	STA.w !REGISTER_DMAEnable		;$B29F3E
	REP.b #$20				;$B29F41
	RTS					;$B29F43

CODE_B29F44:
	JSL.l CODE_80806F			;$B29F44
	LDA.w #$2000				;$B29F48
	STA.b $20				;$B29F4B
	JSR.w CODE_B29F63			;$B29F4D
	LDX.w $1C3F				;$B29F50
	STX.b current_sprite			;$B29F53
	LDA.w #$0346				;$B29F55
	JSL.l set_sprite_animation		;$B29F58
	LDA.w #$0001				;$B29F5C
	TSB.w $1C35				;$B29F5F
	RTS					;$B29F62

CODE_B29F63:
	LDA.w #$7EF580>>16			;$B29F63
	STA.b $44				;$B29F66
	LDA.w #$7EF580				;$B29F68
	STA.b $42				;$B29F6B
	LDA.l $7EA7BA,x				;$B29F6D
	CLC					;$B29F71
	ADC.w #$A9DE				;$B29F72
	TAX					;$B29F75
	JSL.l CODE_B48003			;$B29F76
	JSR.w CODE_B29F96			;$B29F7A
	RTS					;$B29F7D

CODE_B29F7E:
	STA.b $1A				;$B29F7E
	LDA.l $7EA7BA,x				;$B29F80
	TAX					;$B29F84
CODE_B29F85:
	INX					;$B29F85
	LDA.l $7EA9DE,x				;$B29F86
	CMP.w #$3030				;$B29F8A
	BNE.b CODE_B29F85			;$B29F8D
	LDA.b $1A				;$B29F8F
	STA.l $7EA9DE,x				;$B29F91
	RTS					;$B29F95

CODE_B29F96:
	STZ.b $1C				;$B29F96
	STZ.b $1E				;$B29F98
	LDA.w #$FFC0				;$B29F9A
	STA.l $7EA171				;$B29F9D
	LDA.l $7E0000,x				;$B29FA1
	AND.w #$00FF				;$B29FA5
	STA.w $1C47				;$B29FA8
	CMP.w #$0005				;$B29FAB
	BCC.b CODE_B29FB4			;$B29FAE
	LDA.w #$0001				;$B29FB0
	DEX					;$B29FB3
CODE_B29FB4:
	STA.b $1A				;$B29FB4
	LDA.w #$0005				;$B29FB6
	SEC					;$B29FB9
	SBC.b $1A				;$B29FBA
	XBA					;$B29FBC
	LSR					;$B29FBD
	LSR					;$B29FBE
	CLC					;$B29FBF
	ADC.b $42				;$B29FC0
	STA.b $42				;$B29FC2
	TAY					;$B29FC4
	JSL.l CODE_B48006			;$B29FC5
	RTS					;$B29FC9

DATA_B29FCA:
	dw CODE_B29FD4
	dw CODE_B2A024
	dw CODE_B2A067
	dw CODE_B2A0C6
	dw CODE_B2A0DD

CODE_B29FD4:
	LDA.w $05CD				;$B29FD4
	CMP.w #$000F				;$B29FD7
	BEQ.b CODE_B2A001			;$B29FDA
	LDA.w #$0010				;$B29FDC
	BIT.w $05FD				;$B29FDF
	BNE.b CODE_B2A024			;$B29FE2
	LDA.w $1C3B				;$B29FE4
	CMP.w #$000C				;$B29FE7
	BEQ.b CODE_B2A014			;$B29FEA
	CLC					;$B29FEC
	ADC.w #$0000				;$B29FED
	TAX					;$B29FF0
	INC.w $1C3B				;$B29FF1
	INC.w $1C3B				;$B29FF4
	JSR.w CODE_B29F44			;$B29FF7
	LDA.w #$0180				;$B29FFA
	STA.w $1C39				;$B29FFD
	RTS					;$B2A000

CODE_B2A001:
	LDA.w #$0010				;$B2A001
	TSB.w $05FD				;$B2A004
	STZ.w $1C3B				;$B2A007
	LDA.w #$0002				;$B2A00A
	STA.w $1C37				;$B2A00D
	INC.w $1C39				;$B2A010
	RTS					;$B2A013

CODE_B2A014:
	LDA.w #$0010				;$B2A014
	TSB.w $05FD				;$B2A017
	LDA.w #$0003				;$B2A01A
	STA.w $1C37				;$B2A01D
	INC.w $1C39				;$B2A020
	RTS					;$B2A023

CODE_B2A024:
	LDA.w #$000F				;$B2A024
	SEC					;$B2A027
	SBC.w $05CD				;$B2A028
	STA.w !REGISTER_DividendLo		;$B2A02B
	LDA.w #$000A				;$B2A02E
	STA.w !REGISTER_Divisor			;$B2A031
	LDY.w #$0000				;$B2A034
	LDY.w #$0000				;$B2A037
	LDA.b ($00)				;$B2A03A
	LDA.b ($00)				;$B2A03C
	LDA.w !REGISTER_QuotientLo		;$B2A03E
	CLC					;$B2A041
	ADC.w #$0030				;$B2A042
	XBA					;$B2A045
	ORA.w !REGISTER_ProductOrRemainderLo	;$B2A046
	CLC					;$B2A049
	ADC.w #$0030				;$B2A04A
	XBA					;$B2A04D
	LDX.w #$0018				;$B2A04E
	JSR.w CODE_B29F7E			;$B2A051
	LDX.w #$0018				;$B2A054
	JSR.w CODE_B29F44			;$B2A057
	LDA.w #$0300				;$B2A05A
	STA.w $1C39				;$B2A05D
	LDA.w #$0003				;$B2A060
	STA.w $1C37				;$B2A063
	RTS					;$B2A066

CODE_B2A067:
	LDA.w #$0040				;$B2A067
	BIT.w $05FD				;$B2A06A
	BNE.b CODE_B2A090			;$B2A06D
	LDA.w $1C3B				;$B2A06F
	CMP.w #$0004				;$B2A072
	BEQ.b CODE_B2A086			;$B2A075
	CLC					;$B2A077
	ADC.w #$000C				;$B2A078
	TAX					;$B2A07B
	JSR.w CODE_B29F44			;$B2A07C
	INC.w $1C3B				;$B2A07F
	INC.w $1C3B				;$B2A082
	RTS					;$B2A085

CODE_B2A086:
	LDA.w #$0004				;$B2A086
	STA.w $1C37				;$B2A089
	JSR.w CODE_B2A0E5			;$B2A08C
	RTS					;$B2A08F

CODE_B2A090:
	LDA.w #$0180				;$B2A090
	STA.w $1C39				;$B2A093
	LDA.w $1C3B				;$B2A096
	CMP.w #$0008				;$B2A099
	BEQ.b CODE_B2A0BE			;$B2A09C
	CMP.w #$0002				;$B2A09E
	BNE.b CODE_B2A0AF			;$B2A0A1
	LDX.w #$0001				;$B2A0A3
	STX.w $15E8				;$B2A0A6
	LDX.w #$0380				;$B2A0A9
	STX.w $1C39				;$B2A0AC
CODE_B2A0AF:
	CLC					;$B2A0AF
	ADC.w #$0010				;$B2A0B0
	TAX					;$B2A0B3
	JSR.w CODE_B29F44			;$B2A0B4
	INC.w $1C3B				;$B2A0B7
	INC.w $1C3B				;$B2A0BA
	RTS					;$B2A0BD

CODE_B2A0BE:
	LDA.w #$0002				;$B2A0BE
	TSB.w $1C35				;$B2A0C1
	BRA.b CODE_B2A086			;$B2A0C4

CODE_B2A0C6:
	JSL.l CODE_808018			;$B2A0C6
	AND.w #$0003				;$B2A0CA
	ASL					;$B2A0CD
	CLC					;$B2A0CE
	ADC.w #$001A				;$B2A0CF
	TAX					;$B2A0D2
	JSR.w CODE_B29F44			;$B2A0D3
	INC.w $1C37				;$B2A0D6
	JSR.w CODE_B2A0E5			;$B2A0D9
	RTS					;$B2A0DC

CODE_B2A0DD:
	LDA.w #$820F				;$B2A0DD
	JSL.l CODE_808024			;$B2A0E0
	RTS					;$B2A0E4

CODE_B2A0E5:
	LDA.w $1C47				;$B2A0E5
	INC					;$B2A0E8
	XBA					;$B2A0E9
	LSR					;$B2A0EA
	LSR					;$B2A0EB
	STA.w $1C39				;$B2A0EC
	LDX.w active_kong_sprite		;$B2A0EF
	JSR.w CODE_B2A0F8			;$B2A0F2
	LDX.w follower_kong_sprite		;$B2A0F5
CODE_B2A0F8:
	LDA.w #$0120				;$B2A0F8
	STA.b $5E,x				;$B2A0FB
	LDA.w #$0004				;$B2A0FD
	STA.b $38,x				;$B2A100
	LDA.w #$0180				;$B2A102
	STA.b $2A,x				;$B2A105
	STA.b $30,x				;$B2A107
	RTS					;$B2A109

CODE_B2A10A:
	LDA.w $15E8				;$B2A10A
	BNE.b CODE_B2A125			;$B2A10D
	LDA.w #$0010				;$B2A10F
	BIT.w $05FD				;$B2A112
	BEQ.b CODE_B2A125			;$B2A115
	LDA.w $04DA				;$B2A117
	BIT.w #$9180				;$B2A11A
	BEQ.b CODE_B2A125			;$B2A11D
	LDA.w #$0002				;$B2A11F
	STA.w $1C39				;$B2A122
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
;$B2B122
	JMP.w (DATA_F2B125,x)			;$B2B122

DATA_F2B125:
	dw CODE_B2B12F
	dw CODE_B2B192
	dw CODE_B2B195
	dw CODE_B2B34D
	dw CODE_B2B6EB

CODE_B2B12F:
	LDA.w $0039,y				;$B2B12F
	AND.w #$00FF				;$B2B132
	ASL					;$B2B135
	TAX					;$B2B136
	JMP.w (DATA_B2B13A,x)			;$B2B137

DATA_B2B13A:
	dw CODE_B2B13E
	dw CODE_B2B183

CODE_B2B13E:
	LDY.w #$0058				;$B2B13E
	JSL.l CODE_BB8585			;$B2B141
	BCC.b CODE_B2B14A			;$B2B145
	JML [$04F5]				;$B2B147

CODE_B2B14A:
	LDY.b alternate_sprite			;$B2B14A
	LDX.b current_sprite			;$B2B14C
	STX.b $5C,y				;$B2B14E
	STY.b $5C,x				;$B2B150
	LDA.b $5E,x				;$B2B152
	STA.b $38,x				;$B2B154
	STZ.b $5E,x				;$B2B156
	STZ.b $60,x				;$B2B158
	LDA.b $16,x				;$B2B15A
	STA.b $26,x				;$B2B15C
	STZ.b $2A,x				;$B2B15E
	STZ.b $30,x				;$B2B160
	LDA.w #$0100				;$B2B162
	STA.b $2E,x				;$B2B165
	LDA.b $12,x				;$B2B167
	STA.b $64,x				;$B2B169
	LDA.b $16,x				;$B2B16B
	STA.b $66,x				;$B2B16D
	LDA.w #$8000				;$B2B16F
	STA.b $40,x				;$B2B172
	LDA.w $05AF				;$B2B174
	AND.w #$4000				;$B2B177
	STA.b $6C,x				;$B2B17A
	STZ.b $46,x				;$B2B17C
	STZ.b $52,x				;$B2B17E
	JML [$04F5]				;$B2B180

CODE_B2B183:
	LDA.w $005C,y				;$B2B183
	CMP.w $05B7				;$B2B186
	BEQ.b CODE_B2B13E			;$B2B189
	JSL.l CODE_BB8597			;$B2B18B
	JML [$04F5]				;$B2B18F

CODE_B2B192:
	JML [$04F5]				;$B2B192

CODE_B2B195:
	LDA.w $0046,y				;$B2B195
	AND.w #$0018				;$B2B198
	BEQ.b CODE_B2B1A3			;$B2B19B
	LDA.w #$0402				;$B2B19D
	STA.w $0038,y				;$B2B1A0
CODE_B2B1A3:
	LDA.w $0039,y				;$B2B1A3
	AND.w #$00FF				;$B2B1A6
	ASL					;$B2B1A9
	TAX					;$B2B1AA
	JMP.w (DATA_B2B1AE,x)			;$B2B1AB

DATA_B2B1AE:
	dw CODE_B2B1BC
	dw CODE_B2B1C2
	dw CODE_B2B1F3
	dw CODE_B2B223
	dw CODE_B2B25B
	dw CODE_B2B2B5
	dw CODE_B2B30D

CODE_B2B1BC:
	TYX					;$B2B1BC
	INC.b $39,x				;$B2B1BD
	JSR.w CODE_B2BAAC			;$B2B1BF
CODE_B2B1C2:
	JSR.w CODE_B2B852			;$B2B1C2
	JSR.w CODE_B2B94F			;$B2B1C5
	JSR.w CODE_B2B715			;$B2B1C8
	BCC.b CODE_B2B1ED			;$B2B1CB
	LDX.b current_sprite			;$B2B1CD
	LDA.w $05AF				;$B2B1CF
	AND.w #$4000				;$B2B1D2
	BEQ.b CODE_B2B1E1			;$B2B1D5
	LDA.b $5E,x				;$B2B1D7
	DEC					;$B2B1D9
	BMI.b CODE_B2B1ED			;$B2B1DA
	LDA.b $60,x				;$B2B1DC
	DEC					;$B2B1DE
	BMI.b CODE_B2B1ED			;$B2B1DF
CODE_B2B1E1:
	STX.w $1B63				;$B2B1E1
	INC.b $39,x				;$B2B1E4
	LDA.w #$0003				;$B2B1E6
	JSL.l CODE_BFF006			;$B2B1E9
CODE_B2B1ED:
	JSR.w CODE_B2BB62			;$B2B1ED
	JMP.w CODE_B2B6EE			;$B2B1F0

CODE_B2B1F3:
	JSR.w CODE_B2B852			;$B2B1F3
	JSR.w CODE_B2B813			;$B2B1F6
	JSR.w CODE_B2B8D1			;$B2B1F9
	JSR.w CODE_B2B8F9			;$B2B1FC
	BCC.b CODE_B2B208			;$B2B1FF
	INC					;$B2B201
	JSR.w CODE_B2B933			;$B2B202
	JML [$04F5]				;$B2B205

CODE_B2B208:
	JSR.w CODE_B2BC5E			;$B2B208
	JSR.w CODE_B2BAAC			;$B2B20B
	JSR.w CODE_B2B94F			;$B2B20E
	JSR.w CODE_B2B9E7			;$B2B211
	JSR.w CODE_B2B715			;$B2B214
	JSR.w CODE_B2BB62			;$B2B217
	JSR.w CODE_B2B863			;$B2B21A
	JSR.w CODE_B2BE7C			;$B2B21D
	JMP.w CODE_B2B6EE			;$B2B220

CODE_B2B223:
	JSR.w CODE_B2B852			;$B2B223
	JSR.w CODE_B2B813			;$B2B226
	JSR.w CODE_B2B8D1			;$B2B229
	JSR.w CODE_B2B8F9			;$B2B22C
	BCC.b CODE_B2B238			;$B2B22F
	INC					;$B2B231
	JSR.w CODE_B2B933			;$B2B232
	JML [$04F5]				;$B2B235

CODE_B2B238:
	JSR.w CODE_B2BC39			;$B2B238
	JSR.w CODE_B2BAAC			;$B2B23B
	BCC.b CODE_B2B24C			;$B2B23E
	DEC.b $39,x				;$B2B240
	JSR.w CODE_B2B93D			;$B2B242
	LDA.w #$0002				;$B2B245
	JSL.l CODE_BFF006			;$B2B248
CODE_B2B24C:
	JSR.w CODE_B2B94F			;$B2B24C
	JSR.w CODE_B2B9E7			;$B2B24F
	JSR.w CODE_B2BB62			;$B2B252
	JSR.w CODE_B2BE7C			;$B2B255
	JMP.w CODE_B2B6EE			;$B2B258

CODE_B2B25B:
	LDX.b current_sprite			;$B2B25B
	LDA.b $46,x				;$B2B25D
	TAY					;$B2B25F
	AND.w #$FFE7				;$B2B260
	STA.b $46,x				;$B2B263
	TYA					;$B2B265
	AND.w #$0008				;$B2B266
	BEQ.b CODE_B2B29D			;$B2B269
	LDA.w $05AF				;$B2B26B
	AND.w #$4000				;$B2B26E
	STA.b $6C,x				;$B2B271
	LDA.b $60,x				;$B2B273
	STA.b $5E,x				;$B2B275
	STZ.b $60,x				;$B2B277
	LDA.w #$0300				;$B2B279
	STA.b $28,x				;$B2B27C
	LDY.w $04FB				;$B2B27E
	LDA.b $00				;$B2B281
	STA.w $0022,y				;$B2B283
	JSR.w CODE_B2B863			;$B2B286
	LDY.w #$000A				;$B2B289
	LDA.b [$6A],y				;$B2B28C
	STA.b $2E,x				;$B2B28E
	JSR.w CODE_B2BAAC			;$B2B290
	LDY.w #$000A				;$B2B293
	LDA.b [$6A],y				;$B2B296
	STA.b $2E,x				;$B2B298
	JML [$04F5]				;$B2B29A

CODE_B2B29D:
	LDA.w #$0300				;$B2B29D
	STA.b $28,x				;$B2B2A0
	LDY.w $04FB				;$B2B2A2
	LDA.b $00				;$B2B2A5
	STA.w $0022,y				;$B2B2A7
	JSR.w CODE_B2B863			;$B2B2AA
	LDA.w #$FC00				;$B2B2AD
	STA.b $2E,x				;$B2B2B0
	JML [$04F5]				;$B2B2B2

CODE_B2B2B5:
	JSR.w CODE_B2B852			;$B2B2B5
	JSR.w CODE_B2B813			;$B2B2B8
	JSR.w CODE_B2B8D1			;$B2B2BB
	JSR.w CODE_B2B8F9			;$B2B2BE
	LDA.b $2E,x				;$B2B2C1
	PHA					;$B2B2C3
	JSR.w CODE_B2BAAC			;$B2B2C4
	PLA					;$B2B2C7
	STA.b $2E,x				;$B2B2C8
	LDA.b $18,x				;$B2B2CA
	CMP.w #$7F00				;$B2B2CC
	BEQ.b CODE_B2B302			;$B2B2CF
	LDA.b $28,x				;$B2B2D1
	AND.w #$0202				;$B2B2D3
	BNE.b CODE_B2B2ED			;$B2B2D6
	LDA.b $1A,x				;$B2B2D8
	CLC					;$B2B2DA
	ADC.w #$0200				;$B2B2DB
	CMP.w #$0210				;$B2B2DE
	BCS.b CODE_B2B302			;$B2B2E1
	LDA.b $28,x				;$B2B2E3
	AND.w #$FFFE				;$B2B2E5
	ORA.w #$0002				;$B2B2E8
	STA.b $28,x				;$B2B2EB
CODE_B2B2ED:
	LDA.b $4A,x				;$B2B2ED
	CMP.w #$000A				;$B2B2EF
	BCS.b CODE_B2B2F7			;$B2B2F2
	LDA.w #$000A				;$B2B2F4
CODE_B2B2F7:
	STA.b $4A,x				;$B2B2F7
	JSR.w CODE_B2B94F			;$B2B2F9
	JSR.w CODE_B2BB62			;$B2B2FC
	JMP.w CODE_B2B6EE			;$B2B2FF

CODE_B2B302:
	INC.b $39,x				;$B2B302
	JSR.w CODE_B2B94F			;$B2B304
	JSR.w CODE_B2BB62			;$B2B307
	JMP.w CODE_B2B6EE			;$B2B30A

CODE_B2B30D:
	LDA.w $0028,y				;$B2B30D
	AND.w #$0202				;$B2B310
	BNE.b CODE_B2B31E			;$B2B313
	LDA.w #$0302				;$B2B315
	STA.w $0038,y				;$B2B318
	JMP.w CODE_B2B223			;$B2B31B

CODE_B2B31E:
	JSR.w CODE_B2B852			;$B2B31E
	JSR.w CODE_B2B813			;$B2B321
	JSR.w CODE_B2B8D1			;$B2B324
	JSR.w CODE_B2B8F9			;$B2B327
	JSR.w CODE_B2BC39			;$B2B32A
	JSR.w CODE_B2BAAC			;$B2B32D
	BCC.b CODE_B2B344			;$B2B330
	LDA.w #$0202				;$B2B332
	STA.b $38,x				;$B2B335
	JSR.w CODE_B2B93D			;$B2B337
	LDA.w #$0002				;$B2B33A
	JSL.l CODE_BFF006			;$B2B33D
	JSR.w CODE_B2BE7C			;$B2B341
CODE_B2B344:
	JSR.w CODE_B2B94F			;$B2B344
	JSR.w CODE_B2BB62			;$B2B347
	JMP.w CODE_B2B6EE			;$B2B34A

CODE_B2B34D:
	LDA.w $0046,y				;$B2B34D
	AND.w #$0038				;$B2B350
	BEQ.b CODE_B2B35B			;$B2B353
	LDA.w #$0403				;$B2B355
	STA.w $0038,y				;$B2B358
CODE_B2B35B:
	LDA.w $0039,y				;$B2B35B
	AND.w #$00FF				;$B2B35E
	ASL					;$B2B361
	TAX					;$B2B362
	JMP.w (DATA_B2B366,x)			;$B2B363

DATA_B2B366:
	dw CODE_B2B378
	dw CODE_B2B394
	dw CODE_B2B3D0
	dw CODE_B2B403
	dw CODE_B2B473
	dw CODE_B2B503
	dw CODE_B2B55B
	dw CODE_B2B5CF
	dw CODE_B2B64B

CODE_B2B378:
	TYX					;$B2B378
	INC.b $39,x				;$B2B379
	JSR.w CODE_B2BD77			;$B2B37B
	JSR.w CODE_B2BAAC			;$B2B37E
	LDX.b current_sprite			;$B2B381
	LDA.b $4E,x				;$B2B383
	CMP.b $16,x				;$B2B385
	BNE.b CODE_B2B394			;$B2B387
	STA.b $66,x				;$B2B389
	JSR.w CODE_B2BE26			;$B2B38B
	JSR.w CODE_B2B94F			;$B2B38E
	JSR.w CODE_B2B6A7			;$B2B391
CODE_B2B394:
	JSR.w CODE_B2B852			;$B2B394
	JSR.w CODE_B2B94F			;$B2B397
	JSR.w CODE_B2B715			;$B2B39A
	BCC.b CODE_B2B3CA			;$B2B39D
	LDX.b current_sprite			;$B2B39F
	LDA.w $05AF				;$B2B3A1
	AND.w #$4000				;$B2B3A4
	BEQ.b CODE_B2B3B3			;$B2B3A7
	LDA.b $5E,x				;$B2B3A9
	DEC					;$B2B3AB
	BMI.b CODE_B2B3CA			;$B2B3AC
	LDA.b $60,x				;$B2B3AE
	DEC					;$B2B3B0
	BMI.b CODE_B2B3CA			;$B2B3B1
CODE_B2B3B3:
	STX.w $1B63				;$B2B3B3
	LDA.w #$0002				;$B2B3B6
	LDY.b $52,x				;$B2B3B9
	BEQ.b CODE_B2B3C0			;$B2B3BB
	LDA.w #$0007				;$B2B3BD
CODE_B2B3C0:
	JSR.w CODE_B2B933			;$B2B3C0
	LDA.w #$0003				;$B2B3C3
	JSL.l CODE_BFF006			;$B2B3C6
CODE_B2B3CA:
	JSR.w CODE_B2BB62			;$B2B3CA
	JMP.w CODE_B2B6EE			;$B2B3CD

CODE_B2B3D0:
	JSR.w CODE_B2B852			;$B2B3D0
	JSR.w CODE_B2B813			;$B2B3D3
	JSR.w CODE_B2B8D1			;$B2B3D6
	JSR.w CODE_B2B8F9			;$B2B3D9
	BCC.b CODE_B2B3E5			;$B2B3DC
	INC					;$B2B3DE
	JSR.w CODE_B2B933			;$B2B3DF
	JML [$04F5]				;$B2B3E2

CODE_B2B3E5:
	JSR.w CODE_B2BC5E			;$B2B3E5
	JSR.w CODE_B2BD77			;$B2B3E8
	JSR.w CODE_B2BAAC			;$B2B3EB
	JSR.w CODE_B2B94F			;$B2B3EE
	JSR.w CODE_B2B9E7			;$B2B3F1
	JSR.w CODE_B2B715			;$B2B3F4
	JSR.w CODE_B2BB62			;$B2B3F7
	JSR.w CODE_B2B863			;$B2B3FA
	JSR.w CODE_B2BE7C			;$B2B3FD
	JMP.w CODE_B2B6EE			;$B2B400

CODE_B2B403:
	JSR.w CODE_B2B852			;$B2B403
	JSR.w CODE_B2B813			;$B2B406
	JSR.w CODE_B2B8D1			;$B2B409
	JSR.w CODE_B2B8F9			;$B2B40C
	BCC.b CODE_B2B418			;$B2B40F
	INC					;$B2B411
	JSR.w CODE_B2B933			;$B2B412
	JML [$04F5]				;$B2B415

CODE_B2B418:
	JSR.w CODE_B2BC39			;$B2B418
	JSR.w CODE_B2BD77			;$B2B41B
	JSR.w CODE_B2BAAC			;$B2B41E
	BCS.b CODE_B2B437			;$B2B421
	JSR.w CODE_B2BE08			;$B2B423
	BCC.b CODE_B2B452			;$B2B426
	JSR.w CODE_B2B94F			;$B2B428
	JSR.w CODE_B2B9E7			;$B2B42B
	JSR.w CODE_B2BB62			;$B2B42E
	JSR.w CODE_B2BE7C			;$B2B431
	JMP.w CODE_B2B6EE			;$B2B434

CODE_B2B437:
	DEC.b $39,x				;$B2B437
	JSR.w CODE_B2B93D			;$B2B439
	LDA.w #$0000				;$B2B43C
	JSL.l CODE_BFF006			;$B2B43F
	JSR.w CODE_B2BE7C			;$B2B443
	JSR.w CODE_B2B94F			;$B2B446
	JSR.w CODE_B2B9E7			;$B2B449
	JSR.w CODE_B2BB62			;$B2B44C
	JMP.w CODE_B2B6EE			;$B2B44F

CODE_B2B452:
	JSR.w CODE_B2B6A7			;$B2B452
	LDA.w #$0007				;$B2B455
	JSR.w CODE_B2B933			;$B2B458
	LDX.b current_sprite			;$B2B45B
	LDY.b $5E,x				;$B2B45D
	BEQ.b CODE_B2B467			;$B2B45F
	LDA.w #$0700				;$B2B461
	STA.w $004A,y				;$B2B464
CODE_B2B467:
	JSR.w CODE_B2B94F			;$B2B467
	JSR.w CODE_B2B9E7			;$B2B46A
	JSR.w CODE_B2BB62			;$B2B46D
	JMP.w CODE_B2B6EE			;$B2B470

CODE_B2B473:
	LDX.b current_sprite			;$B2B473
	LDA.b $46,x				;$B2B475
	BIT.w #$0020				;$B2B477
	BNE.b CODE_B2B4D2			;$B2B47A
	TAY					;$B2B47C
	AND.w #$FFE7				;$B2B47D
	STA.b $46,x				;$B2B480
	TYA					;$B2B482
	AND.w #$0008				;$B2B483
	BEQ.b CODE_B2B4BA			;$B2B486
	LDA.w $05AF				;$B2B488
	AND.w #$4000				;$B2B48B
	STA.b $6C,x				;$B2B48E
	LDA.b $60,x				;$B2B490
	STA.b $5E,x				;$B2B492
	STZ.b $60,x				;$B2B494
	LDA.w #$0300				;$B2B496
	STA.b $28,x				;$B2B499
	LDY.w $04FB				;$B2B49B
	LDA.b $00				;$B2B49E
	STA.w $0022,y				;$B2B4A0
	JSR.w CODE_B2B863			;$B2B4A3
	LDY.w #$000A				;$B2B4A6
	LDA.b [$6A],y				;$B2B4A9
	STA.b $2E,x				;$B2B4AB
	JSR.w CODE_B2BAAC			;$B2B4AD
	LDY.w #$000A				;$B2B4B0
	LDA.b [$6A],y				;$B2B4B3
	STA.b $2E,x				;$B2B4B5
	JML [$04F5]				;$B2B4B7

CODE_B2B4BA:
	LDA.w #$0300				;$B2B4BA
	STA.b $28,x				;$B2B4BD
	LDY.w $04FB				;$B2B4BF
	LDA.b $00				;$B2B4C2
	STA.w $0022,y				;$B2B4C4
	JSR.w CODE_B2B863			;$B2B4C7
	LDA.w #$FC00				;$B2B4CA
	STA.b $2E,x				;$B2B4CD
	JML [$04F5]				;$B2B4CF

CODE_B2B4D2:
	PHX					;$B2B4D2
	LDY.b $5C,x				;$B2B4D3
	STY.b current_sprite			;$B2B4D5
	JSL.l CODE_BB8597			;$B2B4D7
	PLX					;$B2B4DB
	STX.b current_sprite			;$B2B4DC
	JSL.l CODE_BB8597			;$B2B4DE
	LDX.b current_sprite			;$B2B4E2
	INC.b $00,x				;$B2B4E4
	LDA.w #$060C				;$B2B4E6
	JSL.l CODE_B28012			;$B2B4E9
	JSL.l CODE_BEC030			;$B2B4ED
	LDX.b current_sprite			;$B2B4F1
	STZ.b $00,x				;$B2B4F3
	LDA.l $7E9DD4				;$B2B4F5
	ORA.w #$0020				;$B2B4F9
	STA.l $7E9DD4				;$B2B4FC
	JML [$04F5]				;$B2B500

CODE_B2B503:
	JSR.w CODE_B2B852			;$B2B503
	JSR.w CODE_B2B813			;$B2B506
	JSR.w CODE_B2B8D1			;$B2B509
	JSR.w CODE_B2B8F9			;$B2B50C
	LDA.b $2E,x				;$B2B50F
	PHA					;$B2B511
	JSR.w CODE_B2BAAC			;$B2B512
	PLA					;$B2B515
	STA.b $2E,x				;$B2B516
	LDA.b $18,x				;$B2B518
	CMP.w #$7F00				;$B2B51A
	BEQ.b CODE_B2B550			;$B2B51D
	LDA.b $28,x				;$B2B51F
	AND.w #$0202				;$B2B521
	BNE.b CODE_B2B53B			;$B2B524
	LDA.b $1A,x				;$B2B526
	CLC					;$B2B528
	ADC.w #$0200				;$B2B529
	CMP.w #$0210				;$B2B52C
	BCS.b CODE_B2B550			;$B2B52F
	LDA.b $28,x				;$B2B531
	AND.w #$FFFE				;$B2B533
	ORA.w #$0002				;$B2B536
	STA.b $28,x				;$B2B539
CODE_B2B53B:
	LDA.b $4A,x				;$B2B53B
	CMP.w #$000A				;$B2B53D
	BCS.b CODE_B2B545			;$B2B540
	LDA.w #$000A				;$B2B542
CODE_B2B545:
	STA.b $4A,x				;$B2B545
	JSR.w CODE_B2B94F			;$B2B547
	JSR.w CODE_B2BB62			;$B2B54A
	JMP.w CODE_B2B6EE			;$B2B54D

CODE_B2B550:
	INC.b $39,x				;$B2B550
	JSR.w CODE_B2B94F			;$B2B552
	JSR.w CODE_B2BB62			;$B2B555
	JMP.w CODE_B2B6EE			;$B2B558

CODE_B2B55B:
	LDA.w $0028,y				;$B2B55B
	AND.w #$0202				;$B2B55E
	BNE.b CODE_B2B56C			;$B2B561
	LDA.w #$0003				;$B2B563
	JSR.w CODE_B2B933			;$B2B566
	JMP.w CODE_B2B403			;$B2B569

CODE_B2B56C:
	JSR.w CODE_B2B852			;$B2B56C
	JSR.w CODE_B2B813			;$B2B56F
	JSR.w CODE_B2B8D1			;$B2B572
	JSR.w CODE_B2B8F9			;$B2B575
	JSR.w CODE_B2BC39			;$B2B578
	JSR.w CODE_B2BAAC			;$B2B57B
	BCS.b CODE_B2B594			;$B2B57E
	JSR.w CODE_B2BE08			;$B2B580
	BCC.b CODE_B2B5B3			;$B2B583
	JSR.w CODE_B2B94F			;$B2B585
	JSR.w CODE_B2B9E7			;$B2B588
	JSR.w CODE_B2BB62			;$B2B58B
	JSR.w CODE_B2BE7C			;$B2B58E
	JMP.w CODE_B2B6EE			;$B2B591

CODE_B2B594:
	LDA.w #$0003				;$B2B594
	JSR.w CODE_B2B933			;$B2B597
	JSR.w CODE_B2B93D			;$B2B59A
	LDA.w #$0000				;$B2B59D
	JSL.l CODE_BFF006			;$B2B5A0
	JSR.w CODE_B2BE7C			;$B2B5A4
	JSR.w CODE_B2B94F			;$B2B5A7
	JSR.w CODE_B2B9E7			;$B2B5AA
	JSR.w CODE_B2BB62			;$B2B5AD
	JMP.w CODE_B2B6EE			;$B2B5B0

CODE_B2B5B3:
	LDA.w #$0007				;$B2B5B3
	JSR.w CODE_B2B933			;$B2B5B6
	LDY.b $5E,x				;$B2B5B9
	BEQ.b CODE_B2B5C3			;$B2B5BB
	LDA.w #$0700				;$B2B5BD
	STA.w $004A,y				;$B2B5C0
CODE_B2B5C3:
	JSR.w CODE_B2B94F			;$B2B5C3
	JSR.w CODE_B2B9E7			;$B2B5C6
	JSR.w CODE_B2BB62			;$B2B5C9
	JMP.w CODE_B2B6EE			;$B2B5CC

CODE_B2B5CF:
	JSR.w CODE_B2B852			;$B2B5CF
	JSR.w CODE_B2B813			;$B2B5D2
	JSR.w CODE_B2B8D1			;$B2B5D5
	JSR.w CODE_B2B8F9			;$B2B5D8
	BCC.b CODE_B2B5E6			;$B2B5DB
	BNE.b CODE_B2B5E6			;$B2B5DD
	INC					;$B2B5DF
	JSR.w CODE_B2B933			;$B2B5E0
	JML [$04F5]				;$B2B5E3

CODE_B2B5E6:
	JSR.w CODE_B2BC5E			;$B2B5E6
	JSR.w CODE_B2BE26			;$B2B5E9
	BCC.b CODE_B2B616			;$B2B5EC
	JSR.w CODE_B2B94F			;$B2B5EE
	JSR.w CODE_B2B6A7			;$B2B5F1
	JSR.w CODE_B2B715			;$B2B5F4
	JSR.w CODE_B2BB62			;$B2B5F7
	LDA.w $04D6				;$B2B5FA
	AND.w #$0400				;$B2B5FD
	BEQ.b CODE_B2B613			;$B2B600
	JSR.w CODE_B2B863			;$B2B602
	BCS.b CODE_B2B613			;$B2B605
	LDA.w #$000B				;$B2B607
	LDX.b current_sprite			;$B2B60A
	STA.b $4A,x				;$B2B60C
	STZ.b $2E,x				;$B2B60E
	JSR.w CODE_B2B6DC			;$B2B610
CODE_B2B613:
	JMP.w CODE_B2B6EE			;$B2B613

CODE_B2B616:
	LDA.w #$0003				;$B2B616
	JSR.w CODE_B2B933			;$B2B619
	JSR.w CODE_B2B6DC			;$B2B61C
	LDA.b $4A,x				;$B2B61F
	CMP.w #$000A				;$B2B621
	BCS.b CODE_B2B629			;$B2B624
	LDA.w #$000A				;$B2B626
CODE_B2B629:
	STA.b $4A,x				;$B2B629
	STZ.b $2E,x				;$B2B62B
	LDY.b $5E,x				;$B2B62D
	BEQ.b CODE_B2B63F			;$B2B62F
	LDA.w #$0F00				;$B2B631
	STA.w $004A,y				;$B2B634
	LDA.b $00				;$B2B637
	SBC.w #$0010				;$B2B639
	STA.w $0022,y				;$B2B63C
CODE_B2B63F:
	JSR.w CODE_B2B94F			;$B2B63F
	JSR.w CODE_B2B715			;$B2B642
	JSR.w CODE_B2BB62			;$B2B645
	JMP.w CODE_B2B6EE			;$B2B648

CODE_B2B64B:
	LDA.w $002E,y				;$B2B64B
	BPL.b CODE_B2B659			;$B2B64E
	LDA.w #$0003				;$B2B650
	JSR.w CODE_B2B933			;$B2B653
	JMP.w CODE_B2B403			;$B2B656

CODE_B2B659:
	JSR.w CODE_B2B852			;$B2B659
	JSR.w CODE_B2B813			;$B2B65C
	JSR.w CODE_B2B8D1			;$B2B65F
	JSR.w CODE_B2B8F9			;$B2B662
	BCC.b CODE_B2B66E			;$B2B665
	INC					;$B2B667
	JSR.w CODE_B2B933			;$B2B668
	JML [$04F5]				;$B2B66B

CODE_B2B66E:
	JSR.w CODE_B2BC39			;$B2B66E
	JSR.w CODE_B2BD77			;$B2B671
	JSR.w CODE_B2BAAC			;$B2B674
	BCS.b CODE_B2B688			;$B2B677
	JSR.w CODE_B2B94F			;$B2B679
	JSR.w CODE_B2B9E7			;$B2B67C
	JSR.w CODE_B2BB62			;$B2B67F
	JSR.w CODE_B2BE7C			;$B2B682
	JMP.w CODE_B2B6EE			;$B2B685

CODE_B2B688:
	LDA.w #$0003				;$B2B688
	JSR.w CODE_B2B933			;$B2B68B
	JSR.w CODE_B2B93D			;$B2B68E
	LDA.w #$0000				;$B2B691
	JSL.l CODE_BFF006			;$B2B694
	JSR.w CODE_B2BE7C			;$B2B698
	JSR.w CODE_B2B94F			;$B2B69B
	JSR.w CODE_B2B9E7			;$B2B69E
	JSR.w CODE_B2BB62			;$B2B6A1
	JMP.w CODE_B2B6EE			;$B2B6A4

CODE_B2B6A7:
	LDX.b current_sprite			;$B2B6A7
	LDY.b $52,x				;$B2B6A9
	BNE.b CODE_B2B6C4			;$B2B6AB
	LDY.w #$007A				;$B2B6AD
	JSL.l CODE_BB8585			;$B2B6B0
	LDX.b current_sprite			;$B2B6B4
	BCS.b CODE_B2B6DB			;$B2B6B6
	LDY.b alternate_sprite			;$B2B6B8
	STY.b $52,x				;$B2B6BA
	STX.b $5C,y				;$B2B6BC
	LDA.w $0024,y				;$B2B6BE
	STA.w $005E,y				;$B2B6C1
CODE_B2B6C4:
	LDA.b $12,x				;$B2B6C4
	STA.w $0012,y				;$B2B6C6
	LDA.b $4E,x				;$B2B6C9
	STA.w $0016,y				;$B2B6CB
	LDA.b $40,x				;$B2B6CE
	ASL					;$B2B6D0
	ASL					;$B2B6D1
	ADC.b $40,x				;$B2B6D2
	CLC					;$B2B6D4
	ADC.w $005E,y				;$B2B6D5
	STA.w $0024,y				;$B2B6D8
CODE_B2B6DB:
	RTS					;$B2B6DB

CODE_B2B6DC:
	LDY.b current_sprite			;$B2B6DC
	LDX.b $52,y				;$B2B6DE
	BEQ.b CODE_B2B6EA			;$B2B6E0
	TDC					;$B2B6E2
	STA.w $0052,y				;$B2B6E3
	JSL.l CODE_BB85E8			;$B2B6E6
CODE_B2B6EA:
	RTS					;$B2B6EA

CODE_B2B6EB:
	JML [$04F5]				;$B2B6EB

CODE_B2B6EE:
	LDY.b $5E,x				;$B2B6EE
	BNE.b CODE_B2B712			;$B2B6F0
	JSL.l CODE_BBAB52			;$B2B6F2
	BCC.b CODE_B2B712			;$B2B6F6
	LDX.b current_sprite			;$B2B6F8
	PHX					;$B2B6FA
	LDY.b $5C,x				;$B2B6FB
	PHY					;$B2B6FD
	LDY.b $52,x				;$B2B6FE
	BEQ.b CODE_B2B708			;$B2B700
	STY.b current_sprite			;$B2B702
	JSL.l CODE_BB8597			;$B2B704
CODE_B2B708:
	PLY					;$B2B708
	STY.b current_sprite			;$B2B709
	JSL.l CODE_BB8597			;$B2B70B
	PLY					;$B2B70F
	STY.b current_sprite			;$B2B710
CODE_B2B712:
	JML [$04F5]				;$B2B712

CODE_B2B715:
	LDA.w $194B				;$B2B715
	AND.w #$0004				;$B2B718
	BNE.b CODE_B2B727			;$B2B71B
	LDX.b current_sprite			;$B2B71D
	LDA.b $5E,x				;$B2B71F
	DEC					;$B2B721
	BMI.b CODE_B2B729			;$B2B722
	BRL.w CODE_B2B7A4			;$B2B724

CODE_B2B727:
	CLC					;$B2B727
	RTS					;$B2B728

CODE_B2B729:
	JSL.l populate_sprite_clipping		;$B2B729
	LDA.w #$0010				;$B2B72D
	PHK					;$B2B730
	PEA.w CODE_B2B737-$01			;$B2B731
	JMP.w [$1864]				;$B2B734
CODE_B2B737:
	BCC.b CODE_B2B7A2			;$B2B737
	LDY.b $78				;$B2B739
	LDA.w $002E,y				;$B2B73B
	BMI.b CODE_B2B7A2			;$B2B73E
	LDX.b current_sprite			;$B2B740
	LDA.b $5E,x				;$B2B742
	ORA.b $60,x				;$B2B744
	BNE.b CODE_B2B74F			;$B2B746
	LDA.b $16,x				;$B2B748
	CMP.w $0016,y				;$B2B74A
	BCC.b CODE_B2B7A2			;$B2B74D
CODE_B2B74F:
	LDY.b $78				;$B2B74F
	CPY.w active_kong_sprite		;$B2B751
	BEQ.b CODE_B2B771			;$B2B754
	LDA.w #$0018				;$B2B756
	JSL.l CODE_B88069			;$B2B759
	BCS.b CODE_B2B7A2			;$B2B75D
	STX.w $17CA				;$B2B75F
	LDA.b $78				;$B2B762
	STA.w $17CC				;$B2B764
	STA.b $60,x				;$B2B767
	JSR.w CODE_B2B7F5			;$B2B769
	LDA.w #$0001				;$B2B76C
	SEC					;$B2B76F
	RTS					;$B2B770

CODE_B2B771:
	LDA.w #$0018				;$B2B771
	JSL.l CODE_B88069			;$B2B774
	BCS.b CODE_B2B7A2			;$B2B778
	STX.w $17CA				;$B2B77A
	LDA.b $78				;$B2B77D
	STA.w $17CC				;$B2B77F
	STA.b $5E,x				;$B2B782
	LDY.w $04FB				;$B2B784
	LDA.b $00				;$B2B787
	SEC					;$B2B789
	SBC.w #$0010				;$B2B78A
	STA.w $0022,y				;$B2B78D
	LDX.b current_sprite			;$B2B790
	LDA.b $12,x				;$B2B792
	STA.b $68,x				;$B2B794
	LDA.b $16,x				;$B2B796
	STA.b $6A,x				;$B2B798
	JSR.w CODE_B2B7F5			;$B2B79A
	LDA.w #$0000				;$B2B79D
	SEC					;$B2B7A0
	RTS					;$B2B7A1

CODE_B2B7A2:
	CLC					;$B2B7A2
	RTS					;$B2B7A3

CODE_B2B7A4:
	LDA.w $05AF				;$B2B7A4
	AND.w #$4000				;$B2B7A7
	BEQ.b CODE_B2B7A2			;$B2B7AA
	LDA.b $60,x				;$B2B7AC
	DEC					;$B2B7AE
	BPL.b CODE_B2B7A2			;$B2B7AF
	LDA.b $60,x				;$B2B7B1
	BMI.b CODE_B2B7D0			;$B2B7B3
	LDY.w follower_kong_sprite		;$B2B7B5
	LDA.b $12,x				;$B2B7B8
	SEC					;$B2B7BA
	SBC.b $68,x				;$B2B7BB
	CLC					;$B2B7BD
	ADC.w $0012,y				;$B2B7BE
	STA.w $0012,y				;$B2B7C1
	LDA.b $16,x				;$B2B7C4
	SEC					;$B2B7C6
	SBC.b $6A,x				;$B2B7C7
	CLC					;$B2B7C9
	ADC.w $0016,y				;$B2B7CA
	STA.w $0016,y				;$B2B7CD
CODE_B2B7D0:
	LDY.w follower_kong_sprite		;$B2B7D0
	JSL.l CODE_BEC003			;$B2B7D3
	BCC.b CODE_B2B7A2			;$B2B7D7
	LDA.w #$0018				;$B2B7D9
	JSL.l CODE_B88069			;$B2B7DC
	BCS.b CODE_B2B7A2			;$B2B7E0
	STX.w $17CA				;$B2B7E2
	LDA.w follower_kong_sprite		;$B2B7E5
	STA.w $17CC				;$B2B7E8
	LDA.w follower_kong_sprite		;$B2B7EB
	STA.b $60,x				;$B2B7EE
	LDA.w #$0001				;$B2B7F0
	SEC					;$B2B7F3
	RTS					;$B2B7F4

CODE_B2B7F5:
	LDX.w $0503				;$B2B7F5
	LDX.w active_kong_sprite		;$B2B7F8
	LDA.w #$00D8				;$B2B7FB
	STA.b $0E,x				;$B2B7FE
	LDX.w $0501				;$B2B800
	LDX.w follower_kong_sprite		;$B2B803
	LDA.w #$00E4				;$B2B806
	STA.b $0E,x				;$B2B809
	LDX.b current_sprite			;$B2B80B
	LDA.w #$00E5				;$B2B80D
	STA.b $0E,x				;$B2B810
	RTS					;$B2B812

CODE_B2B813:
	LDX.b current_sprite			;$B2B813
	LDA.b $16,x				;$B2B815
	SEC					;$B2B817
	SBC.w #$0120				;$B2B818
	BCC.b CODE_B2B851			;$B2B81B
	CMP.w $1973				;$B2B81D
	BCC.b CODE_B2B851			;$B2B820
	LDA.b $5E,x				;$B2B822
	DEC					;$B2B824
	BMI.b CODE_B2B851			;$B2B825
	LDA.w #$0040				;$B2B827
	JSL.l CODE_B8807B			;$B2B82A
	BCS.b CODE_B2B842			;$B2B82E
	LDA.w #$0027				;$B2B830
	LDY.w $075C				;$B2B833
	CPY.w #$0002				;$B2B836
	BEQ.b CODE_B2B83E			;$B2B839
	LDA.w #$002C				;$B2B83B
CODE_B2B83E:
	JSL.l CODE_B88069			;$B2B83E
CODE_B2B842:
	LDX.b current_sprite			;$B2B842
	BCS.b CODE_B2B851			;$B2B844
	LDA.w #$0004				;$B2B846
	STA.b $38,x				;$B2B849
	LDA.w #$0003				;$B2B84B
	STA.w $194B				;$B2B84E
CODE_B2B851:
	RTS					;$B2B851

CODE_B2B852:
	LDY.w $04FB				;$B2B852
	LDA.w $04DA				;$B2B855
	AND.w #$8000				;$B2B858
	BEQ.b CODE_B2B862			;$B2B85B
	LDA.b $00				;$B2B85D
	STA.w $0022,y				;$B2B85F
CODE_B2B862:
	RTS					;$B2B862

CODE_B2B863:
	LDX.b current_sprite			;$B2B863
	LDA.b $28,x				;$B2B865
	AND.w #$0101				;$B2B867
	BEQ.b CODE_B2B8C1			;$B2B86A
	LDY.w $04FB				;$B2B86C
	LDA.b $00				;$B2B86F
	SEC					;$B2B871
	SBC.w $0022,y				;$B2B872
	CMP.w #$0010				;$B2B875
	BPL.b CODE_B2B8BF			;$B2B878
	LDX.b current_sprite			;$B2B87A
	LDA.b $28,x				;$B2B87C
	BIT.w #$0101				;$B2B87E
	BEQ.b CODE_B2B8BF			;$B2B881
	AND.w #$FFFE				;$B2B883
	STA.b $28,x				;$B2B886
	LDA.b $00				;$B2B888
	SBC.w #$0010				;$B2B88A
	STA.w $0022,y				;$B2B88D
	INC.b $39,x				;$B2B890
	LDA.b [$6A]				;$B2B892
	STA.b $2E,x				;$B2B894
	LDA.b $4A,x				;$B2B896
	CMP.w #$000A				;$B2B898
	BCS.b CODE_B2B8A0			;$B2B89B
	LDA.w #$000A				;$B2B89D
CODE_B2B8A0:
	STA.b $4A,x				;$B2B8A0
	LDY.b $5E,x				;$B2B8A2
	BEQ.b CODE_B2B8BF			;$B2B8A4
	LDA.w #$0F00				;$B2B8A6
	STA.w $004A,y				;$B2B8A9
	LDA.w #$0004				;$B2B8AC
	LDY.b $37,x				;$B2B8AF
	CPY.w #$0300				;$B2B8B1
	BCC.b CODE_B2B8B9			;$B2B8B4
	LDA.w #$0001				;$B2B8B6
CODE_B2B8B9:
	JSL.l CODE_BFF006			;$B2B8B9
	CLC					;$B2B8BD
	RTS					;$B2B8BE

CODE_B2B8BF:
	SEC					;$B2B8BF
	RTS					;$B2B8C0

CODE_B2B8C1:
	LDY.b $5E,x				;$B2B8C1
	BEQ.b CODE_B2B8BF			;$B2B8C3
	LDA.w #$0F00				;$B2B8C5
	STA.w $004A,y				;$B2B8C8
	INC.b $39,x				;$B2B8CB
	STZ.b $2E,x				;$B2B8CD
	CLC					;$B2B8CF
	RTS					;$B2B8D0

CODE_B2B8D1:
	LDX.b current_sprite			;$B2B8D1
	LDA.b $46,x				;$B2B8D3
	AND.w #$0002				;$B2B8D5
	BNE.b CODE_B2B8E0			;$B2B8D8
	JSL.l CODE_B880A5			;$B2B8DA
	BCS.b CODE_B2B8F5			;$B2B8DE
CODE_B2B8E0:
	LDX.b current_sprite			;$B2B8E0
	STZ.b $5E,x				;$B2B8E2
	LDY.w $04FB				;$B2B8E4
	LDA.b $00				;$B2B8E7
	SBC.w #$0010				;$B2B8E9
	STA.w $0022,y				;$B2B8EC
	STZ.b $3A,x				;$B2B8EF
	LDA.w #$0001				;$B2B8F1
	RTS					;$B2B8F4

CODE_B2B8F5:
	LDA.w #$0000				;$B2B8F5
	RTS					;$B2B8F8

CODE_B2B8F9:
	LDX.b current_sprite			;$B2B8F9
	LDA.b $6C,x				;$B2B8FB
	EOR.w $05AF				;$B2B8FD
	AND.w #$4000				;$B2B900
	BEQ.b CODE_B2B931			;$B2B903
	EOR.b $6C,x				;$B2B905
	STA.b $6C,x				;$B2B907
	AND.w #$4000				;$B2B909
	BNE.b CODE_B2B922			;$B2B90C
	STZ.b $5E,x				;$B2B90E
	STZ.b $60,x				;$B2B910
	LDA.b $00				;$B2B912
	SBC.w #$0010				;$B2B914
	LDY.w $04FB				;$B2B917
	STA.w $0022,y				;$B2B91A
	LDA.w #$0000				;$B2B91D
	SEC					;$B2B920
	RTS					;$B2B921

CODE_B2B922:
	LDX.b current_sprite			;$B2B922
	LDA.b $12,x				;$B2B924
	STA.b $68,x				;$B2B926
	LDA.b $16,x				;$B2B928
	STA.b $6A,x				;$B2B92A
	LDA.w #$0001				;$B2B92C
	SEC					;$B2B92F
	RTS					;$B2B930

CODE_B2B931:
	CLC					;$B2B931
	RTS					;$B2B932

CODE_B2B933:
	LDY.b current_sprite			;$B2B933
	SEP.b #$20				;$B2B935
	STA.w $0039,y				;$B2B937
	REP.b #$20				;$B2B93A
	RTS					;$B2B93C

CODE_B2B93D:
	LDY.b $5E,x				;$B2B93D
	BEQ.b CODE_B2B947			;$B2B93F
	LDA.w #$0700				;$B2B941
	STA.w $004A,y				;$B2B944
CODE_B2B947:
	LDA.b $46,x				;$B2B947
	AND.w #$FFFB				;$B2B949
	STA.b $46,x				;$B2B94C
	RTS					;$B2B94E

CODE_B2B94F:
	PHK					;$B2B94F
	PLB					;$B2B950
	LDX.b current_sprite			;$B2B951
	LDA.b $1C,x				;$B2B953
	AND.w #$8007				;$B2B955
	CMP.w #$8000				;$B2B958
	ROL					;$B2B95B
	TAY					;$B2B95C
	LDA.w DATA_B2B9D9,y			;$B2B95D
	AND.w #$00FF				;$B2B960
	BIT.b $40,x				;$B2B963
	BMI.b CODE_B2B9AC			;$B2B965
	STA.b $1A				;$B2B967
	LDA.b $1A,x				;$B2B969
	BEQ.b CODE_B2B98B			;$B2B96B
	STZ.b $44,x				;$B2B96D
	BIT.b $2E,x				;$B2B96F
	BMI.b CODE_B2B986			;$B2B971
	LDA.b $1A,x				;$B2B973
	CMP.w #$0020				;$B2B975
	BCS.b CODE_B2B9C1			;$B2B978
	LDA.b $1A				;$B2B97A
	STA.b $4A,x				;$B2B97C
	SEC					;$B2B97E
	SBC.b $40,x				;$B2B97F
	CMP.w #$FFFC				;$B2B981
	BCS.b CODE_B2B9C1			;$B2B984
CODE_B2B986:
	JSR.w CODE_B2B9A0			;$B2B986
	BRA.b CODE_B2B9A0			;$B2B989

CODE_B2B98B:
	LDA.b $1A				;$B2B98B
	STA.b $4A,x				;$B2B98D
	SEC					;$B2B98F
	SBC.b $40,x				;$B2B990
	CMP.w #$0003				;$B2B992
	BCC.b CODE_B2B99C			;$B2B995
	CMP.w #$FFFD				;$B2B997
	BCC.b CODE_B2B9A0			;$B2B99A
CODE_B2B99C:
	DEC.b $44,x				;$B2B99C
	BPL.b CODE_B2B9C1			;$B2B99E
CODE_B2B9A0:
	LDA.b $40,x				;$B2B9A0
	CMP.b $4A,x				;$B2B9A2
	BEQ.b CODE_B2B9C1			;$B2B9A4
	BCS.b CODE_B2B9B0			;$B2B9A6
	INC.b $40,x				;$B2B9A8
	BRA.b CODE_B2B9B2			;$B2B9AA

CODE_B2B9AC:
	STA.b $40,x				;$B2B9AC
	BRA.b CODE_B2B9B2			;$B2B9AE

CODE_B2B9B0:
	DEC.b $40,x				;$B2B9B0
CODE_B2B9B2:
	LDA.b $1A,x				;$B2B9B2
	CMP.w #$0030				;$B2B9B4
	LDA.w #$0008				;$B2B9B7
	BCS.b CODE_B2B9BF			;$B2B9BA
	LDA.w #$0003				;$B2B9BC
CODE_B2B9BF:
	STA.b $44,x				;$B2B9BF
CODE_B2B9C1:
	LDX.b current_sprite			;$B2B9C1
	LDA.b $40,x				;$B2B9C3
	ASL					;$B2B9C5
	ASL					;$B2B9C6
	ADC.b $40,x				;$B2B9C7
	CLC					;$B2B9C9
	ADC.w #$27D8				;$B2B9CA
	STA.b $24,x				;$B2B9CD
	LDY.b $5C,x				;$B2B9CF
	CLC					;$B2B9D1
	ADC.w #$0041				;$B2B9D2
	STA.w $0024,y				;$B2B9D5
	RTS					;$B2B9D8

DATA_B2B9D9:
	db $06,$06,$08,$04,$0A,$02,$0B,$01,$0C,$00,$0C,$00,$0C,$00

CODE_B2B9E7:
	LDX.b current_sprite			;$B2B9E7
	LDA.b $28,x				;$B2B9E9
	AND.w #$0002				;$B2B9EB
	BEQ.b CODE_B2BA39			;$B2B9EE
	LDA.b $12,x				;$B2B9F0
	CMP.w #$42C0				;$B2B9F2
	BCS.b CODE_B2BA3A			;$B2B9F5
	LDA.w $1B63				;$B2B9F7
	BEQ.b CODE_B2BA15			;$B2B9FA
	JSR.w CODE_B2BA4E			;$B2B9FC
	CMP.w #$0001				;$B2B9FF
	BCC.b CODE_B2BA15			;$B2BA02
	BNE.b CODE_B2BA2A			;$B2BA04
	LDA.b $46,x				;$B2BA06
	BIT.w #$0004				;$B2BA08
	BEQ.b CODE_B2BA1D			;$B2BA0B
	LDA.b $2E,x				;$B2BA0D
	SEC					;$B2BA0F
	SBC.w #$0100				;$B2BA10
	BPL.b CODE_B2BA1D			;$B2BA13
CODE_B2BA15:
	LDA.b $46,x				;$B2BA15
	ORA.w #$0010				;$B2BA17
	STA.b $46,x				;$B2BA1A
	RTS					;$B2BA1C

CODE_B2BA1D:
	LDA.w #$0024				;$B2BA1D
	JSL.l CODE_B88069			;$B2BA20
	BCS.b CODE_B2BA39			;$B2BA24
	STZ.w $17CA				;$B2BA26
	RTS					;$B2BA29

CODE_B2BA2A:
	LDA.w #$0024				;$B2BA2A
	JSL.l CODE_B88069			;$B2BA2D
	BCS.b CODE_B2BA39			;$B2BA31
	LDA.w #$0001				;$B2BA33
	STA.w $17CA				;$B2BA36
CODE_B2BA39:
	RTS					;$B2BA39

CODE_B2BA3A:
	LDA.b $46,x				;$B2BA3A
	ORA.w #$0020				;$B2BA3C
	STA.b $46,x				;$B2BA3F
	LDA.w $1B63				;$B2BA41
	BEQ.b CODE_B2BA39			;$B2BA44
	LDA.w #$0026				;$B2BA46
	JSL.l CODE_B88069			;$B2BA49
	RTS					;$B2BA4D

CODE_B2BA4E:
	LDA.b $2B,x				;$B2BA4E
	AND.w #$000F				;$B2BA50
	SEC					;$B2BA53
	ADC.b $12,x				;$B2BA54
	SEC					;$B2BA56
	SBC.w #$0100				;$B2BA57
	STA.b $3E				;$B2BA5A
	LDA.b $16,x				;$B2BA5C
	STA.b $40				;$B2BA5E
CODE_B2BA60:
	LDA.b $3E				;$B2BA60
	STA.b $1A				;$B2BA62
	LDA.b $40				;$B2BA64
	STA.b $1C				;$B2BA66
	JSL.l CODE_B7C766			;$B2BA68
	EOR.w #$FFFF				;$B2BA6C
	BPL.b CODE_B2BA91			;$B2BA6F
	SEC					;$B2BA71
	ADC.w #$6300				;$B2BA72
	CMP.b $40				;$B2BA75
	BEQ.b CODE_B2BA93			;$B2BA77
	STA.b $40				;$B2BA79
	CLC					;$B2BA7B
	ADC.w #$0048				;$B2BA7C
	CMP.b $16,x				;$B2BA7F
	BCC.b CODE_B2BA91			;$B2BA81
	LDA.w #$0007				;$B2BA83
	BIT.b $A0				;$B2BA86
	BEQ.b CODE_B2BA60			;$B2BA88
	CLC					;$B2BA8A
	ADC.b $3E				;$B2BA8B
	STA.b $3E				;$B2BA8D
	BRA.b CODE_B2BA60			;$B2BA8F

CODE_B2BA91:
	LDA.b $40				;$B2BA91
CODE_B2BA93:
	SEC					;$B2BA93
	SBC.b $16,x				;$B2BA94
	CMP.w #$FFF0				;$B2BA96
	BCS.b CODE_B2BAA8			;$B2BA99
	CMP.w #$FFB8				;$B2BA9B
	BCS.b CODE_B2BAA4			;$B2BA9E
	LDA.w #$0002				;$B2BAA0
	RTS					;$B2BAA3

CODE_B2BAA4:
	LDA.w #$0001				;$B2BAA4
	RTS					;$B2BAA7

CODE_B2BAA8:
	LDA.w #$0000				;$B2BAA8
	RTS					;$B2BAAB

CODE_B2BAAC:
	LDX.b current_sprite			;$B2BAAC
	LDA.b $64,x				;$B2BAAE
	STA.b $12,x				;$B2BAB0
	LDA.b $66,x				;$B2BAB2
	STA.b $16,x				;$B2BAB4
	LDA.b $34,x				;$B2BAB6
	PHA					;$B2BAB8
	LDA.b $2A,x				;$B2BAB9
	PHA					;$B2BABB
	JSR.w CODE_B2BAE4			;$B2BABC
	STA.b $2A,x				;$B2BABF
	JSL.l CODE_B9E006			;$B2BAC1
	PLA					;$B2BAC5
	STA.b $2A,x				;$B2BAC6
	PLA					;$B2BAC8
	STA.b $34,x				;$B2BAC9
	LDA.b $64,x				;$B2BACB
	LDY.b $12,x				;$B2BACD
	STA.b $12,x				;$B2BACF
	STY.b $64,x				;$B2BAD1
	LDA.b $66,x				;$B2BAD3
	LDY.b $16,x				;$B2BAD5
	STA.b $16,x				;$B2BAD7
	STY.b $66,x				;$B2BAD9
	LDA.b $28,x				;$B2BADB
	AND.w #$0101				;$B2BADD
	CMP.w #$0101				;$B2BAE0
	RTS					;$B2BAE3

CODE_B2BAE4:
	STZ.b $40				;$B2BAE4
	LDA.b $2A,x				;$B2BAE6
	BPL.b CODE_B2BAF5			;$B2BAE8
	EOR.w #$FFFF				;$B2BAEA
	INC					;$B2BAED
	CMP.w #$0010				;$B2BAEE
	BCC.b CODE_B2BAF5			;$B2BAF1
	DEC.b $40				;$B2BAF3
CODE_B2BAF5:
	LSR					;$B2BAF5
	LSR					;$B2BAF6
	LSR					;$B2BAF7
	LSR					;$B2BAF8
	STA.b $3E				;$B2BAF9
	LDA.b $1C,x				;$B2BAFB
	AND.w #$0007				;$B2BAFD
	BEQ.b CODE_B2BB33			;$B2BB00
	CMP.w #$0005				;$B2BB02
	BNE.b CODE_B2BB10			;$B2BB05
	BIT.b $2E,x				;$B2BB07
	BPL.b CODE_B2BB14			;$B2BB09
	BIT.b $1C,x				;$B2BB0B
	BMI.b CODE_B2BB14			;$B2BB0D
	INC					;$B2BB0F
CODE_B2BB10:
	BCC.b CODE_B2BB14			;$B2BB10
	BRA.b CODE_B2BB33			;$B2BB12

CODE_B2BB14:
	PHK					;$B2BB14
	PLB					;$B2BB15
	SEP.b #$20				;$B2BB16
	TAY					;$B2BB18
	LDA.w DATA_B2BB3D,y			;$B2BB19
	STA.w !REGISTER_Multiplicand		;$B2BB1C
	LDA.b $3E				;$B2BB1F
	STA.w !REGISTER_Multiplier		;$B2BB21
	LDA.b $40				;$B2BB24
	ASL					;$B2BB26
	REP.b #$20				;$B2BB27
	LDA.w !REGISTER_ProductOrRemainderLo	;$B2BB29
	BCC.b CODE_B2BB3C			;$B2BB2C
	EOR.w #$FFFF				;$B2BB2E
	BRA.b CODE_B2BB3C			;$B2BB31

CODE_B2BB33:
	STZ.b $40				;$B2BB33
	LDA.b $2A,x				;$B2BB35
	CLC					;$B2BB37
	BPL.b CODE_B2BB3C			;$B2BB38
	DEC.b $40				;$B2BB3A
CODE_B2BB3C:
	RTS					;$B2BB3C

DATA_B2BB3D:
	db $00,$10,$0E,$0D,$0B,$08,$06

CODE_B2BB44:
	LDA.b $16,x				;$B2BB44
	STA.b $1C				;$B2BB46
	LDA.b $12,x				;$B2BB48
	SEC					;$B2BB4A
	SBC.w #$0100				;$B2BB4B
	STA.b $1A				;$B2BB4E
	JML.l CODE_B7C766			;$B2BB50

CODE_B2BB54:
	SEC					;$B2BB54
	SBC.w #$0100				;$B2BB55
	STA.b $1A				;$B2BB58
	LDA.b $16,x				;$B2BB5A
	STA.b $1C				;$B2BB5C
	JML.l CODE_B7C766			;$B2BB5E

CODE_B2BB62:
	LDX.b current_sprite			;$B2BB62
	LDY.b $5C,x				;$B2BB64
	LDA.b $12,x				;$B2BB66
	STA.w $0012,y				;$B2BB68
	LDA.b $16,x				;$B2BB6B
	STA.w $0016,y				;$B2BB6D
	LDY.b $5E,x				;$B2BB70
	BEQ.b CODE_B2BB79			;$B2BB72
	BMI.b CODE_B2BB79			;$B2BB74
	JSR.w CODE_B2BBA9			;$B2BB76
CODE_B2BB79:
	LDY.b $60,x				;$B2BB79
	BEQ.b CODE_B2BBA8			;$B2BB7B
	BMI.b CODE_B2BBA8			;$B2BB7D
	JSR.w CODE_B2BBA9			;$B2BB7F
	LDA.w #$0000				;$B2BB82
	CPY.w $0501				;$B2BB85
	BEQ.b CODE_B2BB8D			;$B2BB88
	LDA.w #$000D				;$B2BB8A
CODE_B2BB8D:
	CLC					;$B2BB8D
	ADC.b $40,x				;$B2BB8E
	ASL					;$B2BB90
	TAX					;$B2BB91
	LDA.l DATA_B2BBD1,x			;$B2BB92
	CLC					;$B2BB96
	ADC.w $0012,y				;$B2BB97
	STA.w $0012,y				;$B2BB9A
	LDA.l DATA_B2BC05,x			;$B2BB9D
	CLC					;$B2BBA1
	ADC.w $0016,y				;$B2BBA2
	STA.w $0016,y				;$B2BBA5
CODE_B2BBA8:
	RTS					;$B2BBA8

CODE_B2BBA9:
	LDA.b $12,x				;$B2BBA9
	STA.w $0012,y				;$B2BBAB
	LDA.b $16,x				;$B2BBAE
	STA.w $0016,y				;$B2BBB0
	LDA.b $1E,x				;$B2BBB3
	EOR.w $001E,y				;$B2BBB5
	AND.w #$4000				;$B2BBB8
	EOR.w $001E,y				;$B2BBBB
	STA.w $001E,y				;$B2BBBE
	LDA.b $18,x				;$B2BBC1
	STA.w $0018,y				;$B2BBC3
	LDA.b $1A,x				;$B2BBC6
	STA.w $001A,y				;$B2BBC8
	LDA.b $28,x				;$B2BBCB
	LDA.w $0028,y				;$B2BBCD
	RTS					;$B2BBD0

DATA_B2BBD1:
	dw $FFF3,$FFF3,$FFF2,$FFF1,$FFF1,$FFF0,$FFF1,$FFF1
	dw $FFF1,$FFF3,$FFF2,$FFF3,$FFF4,$FFF5,$FFF5,$FFF4
	dw $FFF4,$FFF3,$FFF3,$FFF2,$FFF4,$FFF3,$FFF5,$FFF6
	dw $FFF8,$FFF8

DATA_B2BC05:
	dw $FFF8,$FFF8,$FFF9,$FFFB,$FFFC,$FFFE,$0000,$0002
	dw $0003,$0006,$0008,$0009,$000B,$FFF9,$FFF8,$FFF9
	dw $FFFB,$FFFC,$FFFF,$0001,$0002,$0004,$0005,$0007
	dw $0009,$0009

CODE_B2BC39:
	LDA.b $2E,x				;$B2BC39
	BMI.b CODE_B2BC43			;$B2BC3B
	LDY.w #$0005				;$B2BC3D
	JSR.w CODE_B2BC86			;$B2BC40
CODE_B2BC43:
	LDA.b $2E,x				;$B2BC43
	BPL.b CODE_B2BC6E			;$B2BC45
	LDA.b $46,x				;$B2BC47
	AND.w #$0004				;$B2BC49
	BNE.b CODE_B2BC59			;$B2BC4C
	LDY.w $04FB				;$B2BC4E
	LDA.w $0004,y				;$B2BC51
	AND.w #$8000				;$B2BC54
	BEQ.b CODE_B2BC6E			;$B2BC57
CODE_B2BC59:
	LDY.w #$0002				;$B2BC59
	BRA.b CODE_B2BC71			;$B2BC5C

CODE_B2BC5E:
	LDY.w #$0002				;$B2BC5E
	JSR.w CODE_B2BC86			;$B2BC61
	LDX.b current_sprite			;$B2BC64
	LDA.b $29,x				;$B2BC66
	AND.w #$0001				;$B2BC68
	BEQ.b CODE_B2BC6E			;$B2BC6B
	RTS					;$B2BC6D

CODE_B2BC6E:
	LDY.w #$0004				;$B2BC6E
CODE_B2BC71:
	LDX.b current_sprite			;$B2BC71
	LDA.b $2E,x				;$B2BC73
	CLC					;$B2BC75
	ADC.b [$6A],y				;$B2BC76
	BMI.b CODE_B2BC83			;$B2BC78
	LDY.w #$0006				;$B2BC7A
	CMP.b [$6A],y				;$B2BC7D
	BCC.b CODE_B2BC83			;$B2BC7F
	LDA.b [$6A],y				;$B2BC81
CODE_B2BC83:
	STA.b $2E,x				;$B2BC83
	RTS					;$B2BC85

CODE_B2BC86:
	PHK					;$B2BC86
	PLB					;$B2BC87
	STY.b $1E				;$B2BC88
	LDX.b current_sprite			;$B2BC8A
	LDA.b $16,x				;$B2BC8C
	SEC					;$B2BC8E
	SBC.b $26,x				;$B2BC8F
	STA.b $1A				;$B2BC91
	ASL					;$B2BC93
	CLC					;$B2BC94
	ADC.b $1A				;$B2BC95
	STA.b $1A				;$B2BC97
	LDA.b $36,x				;$B2BC99
	BEQ.b CODE_B2BCAC			;$B2BC9B
	EOR.b $58,x				;$B2BC9D
	BPL.b CODE_B2BCAC			;$B2BC9F
	LDA.b $36,x				;$B2BCA1
	CLC					;$B2BCA3
	ADC.b $58,x				;$B2BCA4
	STA.b $36,x				;$B2BCA6
	LDA.b $34,x				;$B2BCA8
	BRA.b CODE_B2BCB3			;$B2BCAA

CODE_B2BCAC:
	LDA.b $34,x				;$B2BCAC
	CLC					;$B2BCAE
	ADC.b $58,x				;$B2BCAF
	STA.b $34,x				;$B2BCB1
CODE_B2BCB3:
	CLC					;$B2BCB3
	ADC.b $36,x				;$B2BCB4
	BPL.b CODE_B2BCBD			;$B2BCB6
	SEC					;$B2BCB8
	SBC.b $1A				;$B2BCB9
	BRA.b CODE_B2BCC0			;$B2BCBB

CODE_B2BCBD:
	CLC					;$B2BCBD
	ADC.b $1A				;$B2BCBE
CODE_B2BCC0:
	STA.b $1C				;$B2BCC0
	CMP.w #$0080				;$B2BCC2
	BCC.b CODE_B2BCCC			;$B2BCC5
	CMP.w #$FF80				;$B2BCC7
	BCC.b CODE_B2BCE4			;$B2BCCA
CODE_B2BCCC:
	LDA.b $1C,x				;$B2BCCC
	AND.w #$8007				;$B2BCCE
	CMP.w #$8000				;$B2BCD1
	ROL					;$B2BCD4
	ASL					;$B2BCD5
	TAY					;$B2BCD6
	LDA.w DATA_B2BD5F,y			;$B2BCD7
	CLC					;$B2BCDA
	ADC.b $30,x				;$B2BCDB
	CLC					;$B2BCDD
	ADC.b $58,x				;$B2BCDE
	STA.b $1C				;$B2BCE0
	BRA.b CODE_B2BD30			;$B2BCE2

CODE_B2BCE4:
	LDA.b $1C				;$B2BCE4
	BMI.b CODE_B2BD00			;$B2BCE6
	LDA.b $2C,x				;$B2BCE8
	CLC					;$B2BCEA
	ADC.b $36,x				;$B2BCEB
	BMI.b CODE_B2BCF3			;$B2BCED
	CMP.b $1C				;$B2BCEF
	BCS.b CODE_B2BD16			;$B2BCF1
CODE_B2BCF3:
	LDA.b $32,x				;$B2BCF3
	CLC					;$B2BCF5
	ADC.b $36,x				;$B2BCF6
	BMI.b CODE_B2BD16			;$B2BCF8
	CMP.b $1C				;$B2BCFA
	BCS.b CODE_B2BD1A			;$B2BCFC
	BRA.b CODE_B2BD16			;$B2BCFE

CODE_B2BD00:
	LDA.b $2C,x				;$B2BD00
	CLC					;$B2BD02
	ADC.b $36,x				;$B2BD03
	BPL.b CODE_B2BD16			;$B2BD05
	CMP.b $1C				;$B2BD07
	BCS.b CODE_B2BD16			;$B2BD09
	LDA.b $32,x				;$B2BD0B
	CLC					;$B2BD0D
	ADC.b $36,x				;$B2BD0E
	BPL.b CODE_B2BD1A			;$B2BD10
	CMP.b $1C				;$B2BD12
	BCS.b CODE_B2BD1A			;$B2BD14
CODE_B2BD16:
	STA.b $1C				;$B2BD16
	BRA.b CODE_B2BD30			;$B2BD18

CODE_B2BD1A:
	LDA.b $1C				;$B2BD1A
	EOR.b $30,x				;$B2BD1C
	BPL.b CODE_B2BD3F			;$B2BD1E
	ASL.b $1A				;$B2BD20
	LDA.b $1C				;$B2BD22
	BPL.b CODE_B2BD2B			;$B2BD24
	CLC					;$B2BD26
	ADC.b $1A				;$B2BD27
	BRA.b CODE_B2BD2E			;$B2BD29

CODE_B2BD2B:
	SEC					;$B2BD2B
	SBC.b $1A				;$B2BD2C
CODE_B2BD2E:
	STA.b $1C				;$B2BD2E
CODE_B2BD30:
	LDA.b $1A,x				;$B2BD30
	BNE.b CODE_B2BD3F			;$B2BD32
	LDA.b $1C				;$B2BD34
	SEC					;$B2BD36
	SBC.b $36,x				;$B2BD37
	STA.b $34,x				;$B2BD39
	LDA.b $16,x				;$B2BD3B
	STA.b $26,x				;$B2BD3D
CODE_B2BD3F:
	STZ.b $58,x				;$B2BD3F
	LDA.b $1C				;$B2BD41
	STA.b $30,x				;$B2BD43
	LDY.b $1E				;$B2BD45
	BEQ.b CODE_B2BD5C			;$B2BD47
	SEC					;$B2BD49
	SBC.b $2A,x				;$B2BD4A
CODE_B2BD4C:
	CMP.w #$8000				;$B2BD4C
	ROR					;$B2BD4F
	DEY					;$B2BD50
	BNE.b CODE_B2BD4C			;$B2BD51
	CLC					;$B2BD53
	ADC.b $2A,x				;$B2BD54
	CMP.b $2A,x				;$B2BD56
	BNE.b CODE_B2BD5C			;$B2BD58
	LDA.b $1C				;$B2BD5A
CODE_B2BD5C:
	STA.b $2A,x				;$B2BD5C
	RTS					;$B2BD5E

DATA_B2BD5F:
	dw $0000,$0000,$FFFF,$0001,$FFFE,$0002,$FFFD,$0003
	dw $FFFC,$0004,$FFFB,$0005

CODE_B2BD77:
	LDX.b current_sprite			;$B2BD77
	LDA.b $4C,x				;$B2BD79
	STA.b $42				;$B2BD7B
	CLC					;$B2BD7D
	ADC.w #$0006				;$B2BD7E
	STA.b $46				;$B2BD81
	LDA.b $6C				;$B2BD83
	STA.b $44				;$B2BD85
	STA.b $48				;$B2BD87
	LDY.w #$0000				;$B2BD89
	LDA.b $12,x				;$B2BD8C
	CMP.b [$42],y				;$B2BD8E
	BCC.b CODE_B2BDC4			;$B2BD90
CODE_B2BD92:
	CMP.b [$46],y				;$B2BD92
	BCC.b CODE_B2BD9E			;$B2BD94
	INY					;$B2BD96
	INY					;$B2BD97
	INY					;$B2BD98
	INY					;$B2BD99
	INY					;$B2BD9A
	INY					;$B2BD9B
	BRA.b CODE_B2BD92			;$B2BD9C

CODE_B2BD9E:
	TYA					;$B2BD9E
	CLC					;$B2BD9F
	ADC.b $42				;$B2BDA0
	STA.b $4C,x				;$B2BDA2
	LDA.b $12,x				;$B2BDA4
	SEC					;$B2BDA6
	SBC.b [$42],y				;$B2BDA7
	STA.b $1A				;$B2BDA9
	INY					;$B2BDAB
	INY					;$B2BDAC
	LDA.b [$42],y				;$B2BDAD
	STA.b $1C				;$B2BDAF
	BEQ.b CODE_B2BDC4			;$B2BDB1
	INY					;$B2BDB3
	INY					;$B2BDB4
	LDA.b [$42],y				;$B2BDB5
	STA.b $50,x				;$B2BDB7
	ASL					;$B2BDB9
	TAX					;$B2BDBA
	JMP.w (DATA_B2BDBE,x)			;$B2BDBB

DATA_B2BDBE:
	dw CODE_B2BDC9
	dw CODE_B2BDD4
	dw CODE_B2BDF0

CODE_B2BDC4:
	STZ.b $4E,x				;$B2BDC4
	STZ.b $50,x				;$B2BDC6
	RTS					;$B2BDC8

CODE_B2BDC9:
	LDX.b current_sprite			;$B2BDC9
	LDA.b $1C				;$B2BDCB
	CLC					;$B2BDCD
	ADC.w #$0030				;$B2BDCE
	STA.b $4E,x				;$B2BDD1
	RTS					;$B2BDD3

CODE_B2BDD4:
	LDX.b current_sprite			;$B2BDD4
	LDA.b $1A				;$B2BDD6
	BCS.b CODE_B2BDDE			;$B2BDD8
	EOR.w #$FFFF				;$B2BDDA
	INC					;$B2BDDD
CODE_B2BDDE:
	CMP.w #$8000				;$B2BDDE
	ROR					;$B2BDE1
	CMP.w #$8000				;$B2BDE2
	ROR					;$B2BDE5
	CLC					;$B2BDE6
	ADC.b $1C				;$B2BDE7
	CLC					;$B2BDE9
	ADC.w #$0030				;$B2BDEA
	STA.b $4E,x				;$B2BDED
	RTS					;$B2BDEF

CODE_B2BDF0:
	LDX.b current_sprite			;$B2BDF0
	LDA.b $1A				;$B2BDF2
	BCS.b CODE_B2BDFA			;$B2BDF4
	EOR.w #$FFFF				;$B2BDF6
	INC					;$B2BDF9
CODE_B2BDFA:
	CMP.w #$8000				;$B2BDFA
	ROR					;$B2BDFD
	CLC					;$B2BDFE
	ADC.b $1C				;$B2BDFF
	CLC					;$B2BE01
	ADC.w #$0030				;$B2BE02
	STA.b $4E,x				;$B2BE05
	RTS					;$B2BE07

CODE_B2BE08:
	LDX.b current_sprite			;$B2BE08
	LDA.b $16,x				;$B2BE0A
	CMP.b $4E,x				;$B2BE0C
	BCC.b CODE_B2BE1D			;$B2BE0E
	LDA.b $46,x				;$B2BE10
	AND.w #$FFFE				;$B2BE12
	CMP.b $46,x				;$B2BE15
	STA.b $46,x				;$B2BE17
	BEQ.b CODE_B2BE24			;$B2BE19
	CLC					;$B2BE1B
	RTS					;$B2BE1C

CODE_B2BE1D:
	LDA.b $46,x				;$B2BE1D
	ORA.w #$0001				;$B2BE1F
	STA.b $46,x				;$B2BE22
CODE_B2BE24:
	SEC					;$B2BE24
	RTS					;$B2BE25

CODE_B2BE26:
	LDX.b current_sprite			;$B2BE26
	LDA.b $64,x				;$B2BE28
	STA.b $12,x				;$B2BE2A
	LDA.b $66,x				;$B2BE2C
	STA.b $16,x				;$B2BE2E
	STZ.b $28,x				;$B2BE30
	JSR.w CODE_B2BAE4			;$B2BE32
	ADC.b $11,x				;$B2BE35
	STA.b $11,x				;$B2BE37
	SEP.b #$20				;$B2BE39
	LDA.b $40				;$B2BE3B
	ADC.b $13,x				;$B2BE3D
	STA.b $13,x				;$B2BE3F
	REP.b #$20				;$B2BE41
	JSR.w CODE_B2BD77			;$B2BE43
	LDA.b $4E,x				;$B2BE46
	BNE.b CODE_B2BE56			;$B2BE48
	STZ.b $18,x				;$B2BE4A
	LDA.w #$8090				;$B2BE4C
	STA.b $1A,x				;$B2BE4F
	STZ.b $1C,x				;$B2BE51
	CLC					;$B2BE53
	BRA.b CODE_B2BE6B			;$B2BE54

CODE_B2BE56:
	STA.b $16,x				;$B2BE56
	STZ.b $1A,x				;$B2BE58
	LDA.b $28,x				;$B2BE5A
	ORA.w #$0001				;$B2BE5C
	STA.b $28,x				;$B2BE5F
	LDA.w #$0100				;$B2BE61
	STA.b $2E,x				;$B2BE64
	LDA.b $50,x				;$B2BE66
	STA.b $1C,x				;$B2BE68
	SEC					;$B2BE6A
CODE_B2BE6B:
	LDA.b $64,x				;$B2BE6B
	LDY.b $12,x				;$B2BE6D
	STA.b $12,x				;$B2BE6F
	STY.b $64,x				;$B2BE71
	LDA.b $66,x				;$B2BE73
	LDY.b $16,x				;$B2BE75
	STA.b $16,x				;$B2BE77
	STY.b $66,x				;$B2BE79
	RTS					;$B2BE7B

CODE_B2BE7C:
	LDA.w $194B				;$B2BE7C
	AND.w #$0004				;$B2BE7F
	BNE.b CODE_B2BEBD			;$B2BE82
	LDX.b current_sprite			;$B2BE84
	LDA.b $2A,x				;$B2BE86
	BEQ.b CODE_B2BEBD			;$B2BE88
	LDA.w $051F				;$B2BE8A
	DEC					;$B2BE8D
	BMI.b CODE_B2BEBD			;$B2BE8E
	LDA.b $28,x				;$B2BE90
	AND.w #$0101				;$B2BE92
	CMP.w #$0001				;$B2BE95
	BEQ.b CODE_B2BEBE			;$B2BE98
	CMP.w #$0101				;$B2BE9A
	BNE.b CODE_B2BEBD			;$B2BE9D
	LDA.b $38,x				;$B2BE9F
	AND.w #$00FF				;$B2BEA1
	CMP.w #$0002				;$B2BEA4
	BEQ.b CODE_B2BEB3			;$B2BEA7
	JSL.l CODE_808018			;$B2BEA9
	LSR					;$B2BEAD
	CMP.b $2A,x				;$B2BEAE
	BCC.b CODE_B2BEBE			;$B2BEB0
	RTS					;$B2BEB2

CODE_B2BEB3:
	JSL.l CODE_808018			;$B2BEB3
	LSR					;$B2BEB7
	LSR					;$B2BEB8
	CMP.b $2A,x				;$B2BEB9
	BCC.b CODE_B2BEBE			;$B2BEBB
CODE_B2BEBD:
	RTS					;$B2BEBD

CODE_B2BEBE:
	LDY.w #$0038				;$B2BEBE
	LDA.b $38,x				;$B2BEC1
	AND.w #$00FF				;$B2BEC3
	CMP.w #$0002				;$B2BEC6
	BEQ.b CODE_B2BECE			;$B2BEC9
	LDY.w #$003A				;$B2BECB
CODE_B2BECE:
	JSL.l CODE_BB8585			;$B2BECE
	BCS.b CODE_B2BEBD			;$B2BED2
	DEC.w $051F				;$B2BED4
	LDX.b alternate_sprite			;$B2BED7
	LDY.b current_sprite			;$B2BED9
	STY.b $5C,x				;$B2BEDB
	STZ.b $5E,x				;$B2BEDD
	INC.b $38,x				;$B2BEDF
	JMP.w CODE_B2BEF8			;$B2BEE1

toboggan_sparks_main:
;$B2BEE4
	JSL.l process_sprite_animation		;$B2BEE4
	LDA.b $00,x				;$B2BEE8
	BEQ.b CODE_B2BEF2			;$B2BEEA
	JSL.l CODE_BBAB46			;$B2BEEC
	BCC.b CODE_B2BEF5			;$B2BEF0
CODE_B2BEF2:
	INC.w $051F				;$B2BEF2
CODE_B2BEF5:
	JML [$04F5]				;$B2BEF5

CODE_B2BEF8:
	PHK					;$B2BEF8
	PLB					;$B2BEF9
	LDY.b $5C,x				;$B2BEFA
	LDA.w $001A,y				;$B2BEFC
	BNE.b CODE_B2BF2A			;$B2BEFF
	LDA.w $0040,y				;$B2BF01
	AND.w #$00FF				;$B2BF04
	TAY					;$B2BF07
	LDA.w DATA_B2BF38,y			;$B2BF08
	JSR.w CODE_B2BF2B			;$B2BF0B
	STA.b $1A				;$B2BF0E
	LDA.w DATA_B2BF45,y			;$B2BF10
	JSR.w CODE_B2BF2B			;$B2BF13
	STA.b $1C				;$B2BF16
	LDY.b $5C,x				;$B2BF18
	LDA.w $0012,y				;$B2BF1A
	CLC					;$B2BF1D
	ADC.b $1A				;$B2BF1E
	STA.b $12,x				;$B2BF20
	LDA.w $0016,y				;$B2BF22
	CLC					;$B2BF25
	ADC.b $1C				;$B2BF26
	STA.b $16,x				;$B2BF28
CODE_B2BF2A:
	RTS					;$B2BF2A

CODE_B2BF2B:
	BIT.w #$0080				;$B2BF2B
	BEQ.b CODE_B2BF34			;$B2BF2E
	ORA.w #$FF00				;$B2BF30
	RTS					;$B2BF33

CODE_B2BF34:
	AND.w #$00FF				;$B2BF34
	RTS					;$B2BF37

DATA_B2BF38:
	db $EE,$EB,$E9,$E8,$E8,$E8,$E8,$E9,$EA,$EC,$EF,$F0,$F3

DATA_B2BF45:
	db $ED,$EF,$F2,$F5,$F8,$FB,$FE,$02,$06,$08,$0A,$0D,$10

large_pipe_main:
;$B2BF52
	JSL.l CODE_BBAB52			;$B2BF52
	BCS.b CODE_B2BF89			;$B2BF56
	CPX.b $CC				;$B2BF58
	BEQ.b CODE_B2BF68			;$B2BF5A
	CPX.b $CE				;$B2BF5C
	BEQ.b CODE_B2BF64			;$B2BF5E
	LDA.b $CC				;$B2BF60
	BEQ.b CODE_B2BF68			;$B2BF62
CODE_B2BF64:
	STX.b $CE				;$B2BF64
	BRA.b CODE_B2BF6A			;$B2BF66

CODE_B2BF68:
	STX.b $CC				;$B2BF68
CODE_B2BF6A:
	JSL.l populate_sprite_clipping		;$B2BF6A
	LDA.l $001840				;$B2BF6E
	STA.b $4C,x				;$B2BF72
	LDA.l $001844				;$B2BF74
	STA.b $4E,x				;$B2BF78
	LDA.l $001842				;$B2BF7A
	STA.b $50,x				;$B2BF7E
	LDA.l $001846				;$B2BF80
	STA.b $52,x				;$B2BF84
	JML [$04F5]				;$B2BF86

CODE_B2BF89:
	LDA.b current_sprite			;$B2BF89
	CMP.b $CC				;$B2BF8B
	BNE.b CODE_B2BF91			;$B2BF8D
	STZ.b $CC				;$B2BF8F
CODE_B2BF91:
	CMP.b $CE				;$B2BF91
	BNE.b CODE_B2BF97			;$B2BF93
	STZ.b $CE				;$B2BF95
CODE_B2BF97:
	JML [$04F5]				;$B2BF97

unknown_sprite_0310_main:
;$B2BF9A
	LDA.w $04FB				;$B2BF9A
	CPY.w active_kong_sprite		;$B2BF9D
	BEQ.b CODE_B2BFA5			;$B2BFA0
	LDA.w $04FF				;$B2BFA2
CODE_B2BFA5:
	STA.b $72				;$B2BFA5
	JSR.w (DATA_B2BFB8,x)			;$B2BFA7
	JSR.w CODE_B2BFC2			;$B2BFAA
	JSL.l CODE_B9E000			;$B2BFAD
	JSL.l process_anim_preserve_state	;$B2BFB1
	JML [$04F5]				;$B2BFB5

DATA_B2BFB8:
	dw CODE_B2BFDF
	dw CODE_B2BFE0
	dw CODE_B2C037
	dw CODE_B2C026
	dw CODE_B2C010

CODE_B2BFC2:
	LDX.w active_kong_sprite		;$B2BFC2
	LDY.w follower_kong_sprite		;$B2BFC5
	LDA.b $16,x				;$B2BFC8
	CMP.w $0016,y				;$B2BFCA
	BCC.b CODE_B2BFD2			;$B2BFCD
	TYA					;$B2BFCF
	TXY					;$B2BFD0
	TAX					;$B2BFD1
CODE_B2BFD2:
	LDA.w $000E,y				;$B2BFD2
	PHA					;$B2BFD5
	LDA.b $0E,x				;$B2BFD6
	STA.w $000E,y				;$B2BFD8
	PLA					;$B2BFDB
	STA.b $0E,x				;$B2BFDC
	RTS					;$B2BFDE

CODE_B2BFDF:
	RTS					;$B2BFDF

CODE_B2BFE0:
	LDA.w #$0012				;$B2BFE0
	JSL.l CODE_B9E003			;$B2BFE3
	BCC.b CODE_B2C008			;$B2BFE7
	LDA.b $1E,x				;$B2BFE9
	BIT.w #$4000				;$B2BFEB
	BEQ.b CODE_B2C002			;$B2BFEE
	LDA.w #$8000				;$B2BFF0
	STA.b $10,x				;$B2BFF3
	LDA.w #$0001				;$B2BFF5
	STA.b $30,x				;$B2BFF8
	STZ.b $2A,x				;$B2BFFA
	LDA.b $12,x				;$B2BFFC
	DEC					;$B2BFFE
	STA.b $5E,x				;$B2BFFF
	RTS					;$B2C001

CODE_B2C002:
	STZ.b $38,x				;$B2C002
	STZ.b $30,x				;$B2C004
	STZ.b $2A,x				;$B2C006
CODE_B2C008:
	LDA.w #$0003				;$B2C008
	JSL.l CODE_B9E003			;$B2C00B
	RTS					;$B2C00F

CODE_B2C010:
	LDA.w #$0012				;$B2C010
	JSL.l CODE_B9E003			;$B2C013
	BCC.b CODE_B2C025			;$B2C017
	STZ.b $38,x				;$B2C019
	STZ.b $30,x				;$B2C01B
	STZ.b $2A,x				;$B2C01D
	LDA.w #$0800				;$B2C01F
	TSB.w $1C35				;$B2C022
CODE_B2C025:
	RTS					;$B2C025

CODE_B2C026:
	LDA.w #$0085				;$B2C026
	JSL.l set_anim_handle_kiddy		;$B2C029
	LDA.w #$0001				;$B2C02D
	STA.b $38,x				;$B2C030
	STZ.b $2E,x				;$B2C032
	STZ.b $34,x				;$B2C034
	RTS					;$B2C036

CODE_B2C037:
	LDA.w #$0012				;$B2C037
	JSL.l CODE_B9E003			;$B2C03A
	BCC.b CODE_B2C048			;$B2C03E
	STZ.b $30,x				;$B2C040
	STZ.b $2A,x				;$B2C042
	STZ.b $6A,x				;$B2C044
	BRA.b CODE_B2C084			;$B2C046

CODE_B2C048:
	LDA.b $5A,x				;$B2C048
	BNE.b CODE_B2C084			;$B2C04A
	LDA.b $6A,x				;$B2C04C
	BMI.b CODE_B2C085			;$B2C04E
	LDY.b $2A,x				;$B2C050
	BPL.b CODE_B2C05A			;$B2C052
	CMP.b $12,x				;$B2C054
	BPL.b CODE_B2C05E			;$B2C056
	BRA.b CODE_B2C084			;$B2C058

CODE_B2C05A:
	CMP.b $12,x				;$B2C05A
	BPL.b CODE_B2C084			;$B2C05C
CODE_B2C05E:
	LDA.w #$0084				;$B2C05E
	JSL.l set_anim_handle_kiddy		;$B2C061
	LDA.b $2A,x				;$B2C065
	CMP.w #$8000				;$B2C067
	ROR					;$B2C06A
	CMP.w #$8000				;$B2C06B
	ROR					;$B2C06E
	CLC					;$B2C06F
	ADC.b $2A,x				;$B2C070
	STA.b $2A,x				;$B2C072
	LDA.b $16,x				;$B2C074
	STA.b $60,x				;$B2C076
	LDA.w #$F780				;$B2C078
	STA.b $34,x				;$B2C07B
	STA.b $2E,x				;$B2C07D
	LDA.w #$003C				;$B2C07F
	STA.b $5A,x				;$B2C082
CODE_B2C084:
	RTS					;$B2C084

CODE_B2C085:
	AND.w #$0FFF				;$B2C085
	CMP.b $12,x				;$B2C088
	BMI.b CODE_B2C084			;$B2C08A
	BRA.b CODE_B2C05E			;$B2C08C

map_kong_main:
;$B2C08E
	LDA.w #$007E				;$B2C08E
	STA.b $6C				;$B2C091
	LDA.w #$0100				;$B2C093
	BIT.w $05FB				;$B2C096
	BNE.b CODE_B2C0A2			;$B2C099
	JSR.w (DATA_B2C0AE,x)			;$B2C09B
	JSL.l CODE_B9E000			;$B2C09E
CODE_B2C0A2:
	JSL.l process_anim_preserve_state	;$B2C0A2
	LDA.w #DATA_FF206A>>16			;$B2C0A6
	STA.b $6C				;$B2C0A9
	JML [$04F5]				;$B2C0AB

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
	CPY.w active_kong_sprite		;$B2C0E6
	BNE.b CODE_B2C0F4			;$B2C0E9
	LDY.w #$0308				;$B2C0EB
	JSL.l CODE_BB85B8			;$B2C0EE
	LDY.b current_sprite			;$B2C0F2
CODE_B2C0F4:
	LDA.w #$0001				;$B2C0F4
	STA.w $0038,y				;$B2C0F7
	LDA.w $001E,y				;$B2C0FA
	AND.w #$EFFF				;$B2C0FD
	STA.w $001E,y				;$B2C100
	LDA.w #$0318				;$B2C103
	JSL.l set_sprite_animation		;$B2C106
	STZ.w $1C41				;$B2C10A
	STZ.w $1C57				;$B2C10D
	LDY.w active_kong_sprite		;$B2C110
	LDA.b $6A,x				;$B2C113
	STA.w $006A,y				;$B2C115
	LDA.w #$0009				;$B2C118
	STA.w $005A,y				;$B2C11B
	RTS					;$B2C11E

CODE_B2C11F:
	CPY.w active_kong_sprite		;$B2C11F
	BNE.b CODE_B2C12D			;$B2C122
	LDY.w #$0300				;$B2C124
	JSL.l CODE_BB85B8			;$B2C127
	LDY.b current_sprite			;$B2C12B
CODE_B2C12D:
	LDA.w #$0001				;$B2C12D
	STA.w $0038,y				;$B2C130
	LDA.w #$0319				;$B2C133
	JSL.l set_sprite_animation		;$B2C136
	RTS					;$B2C13A

CODE_B2C13B:
	CPY.w active_kong_sprite		;$B2C13B
	BNE.b CODE_B2C149			;$B2C13E
	LDY.w #$030A				;$B2C140
	JSL.l CODE_BB85B8			;$B2C143
	LDY.b current_sprite			;$B2C147
CODE_B2C149:
	LDA.w #$0001				;$B2C149
	STA.w $0038,y				;$B2C14C
	LDA.w $001E,y				;$B2C14F
	AND.w #$EFFF				;$B2C152
	STA.w $001E,y				;$B2C155
	LDA.w #$0040				;$B2C158
	STA.w $005E,y				;$B2C15B
	LDA.w #$0318				;$B2C15E
	JSL.l set_sprite_animation		;$B2C161
	RTS					;$B2C165

CODE_B2C166:
	CPY.w active_kong_sprite		;$B2C166
	BNE.b CODE_B2C179			;$B2C169
	LDY.w #$0306				;$B2C16B
	JSL.l CODE_BB8585			;$B2C16E
	LDY.b current_sprite			;$B2C172
	LDA.b alternate_sprite			;$B2C174
	STA.w $0032,y				;$B2C176
CODE_B2C179:
	LDA.w #$0001				;$B2C179
	STA.w $0038,y				;$B2C17C
	LDA.w $001E,y				;$B2C17F
	AND.w #$CFFF				;$B2C182
	STA.w $001E,y				;$B2C185
	LDA.w #$0120				;$B2C188
	STA.w $005E,y				;$B2C18B
	RTS					;$B2C18E

CODE_B2C18F:
	LDX.b $32,y				;$B2C18F
	BEQ.b CODE_B2C1A0			;$B2C191
	JSL.l CODE_BB85E8			;$B2C193
	LDX.b current_sprite			;$B2C197
	LDA.w #$0001				;$B2C199
	STA.b $38,x				;$B2C19C
	STZ.b $32,x				;$B2C19E
CODE_B2C1A0:
	RTS					;$B2C1A0

CODE_B2C1A1:
	TYX					;$B2C1A1
	INC.b $38,x				;$B2C1A2
	LDA.w #$031A				;$B2C1A4
	JSL.l set_sprite_animation		;$B2C1A7
CODE_B2C1AB:
	RTS					;$B2C1AB

CODE_B2C1AC:
	TYX					;$B2C1AC
	STZ.b $5A,x				;$B2C1AD
	CPX.w active_kong_sprite		;$B2C1AF
	BNE.b CODE_B2C1F9			;$B2C1B2
	LDA.w map_node_number			;$B2C1B4
	CMP.w #$0003				;$B2C1B7
	BNE.b CODE_B2C1D7			;$B2C1BA
	LDA.w $04DA				;$B2C1BC
	BIT.w #$0100				;$B2C1BF
	BEQ.b CODE_B2C1F9			;$B2C1C2
	STZ.w $1C41				;$B2C1C4
	STZ.w $1C57				;$B2C1C7
	LDA.w #$0001				;$B2C1CA
	STA.b $38,x				;$B2C1CD
	LDA.w #$0013				;$B2C1CF
	JSL.l CODE_B48012			;$B2C1D2
	RTS					;$B2C1D6

CODE_B2C1D7:
	LDA.w map_node_number			;$B2C1D7
	CMP.w #$000A				;$B2C1DA
	BNE.b CODE_B2C1F9			;$B2C1DD
	LDA.w $04DA				;$B2C1DF
	BIT.w #$0200				;$B2C1E2
	BEQ.b CODE_B2C1F9			;$B2C1E5
	STZ.w $1C41				;$B2C1E7
	STZ.w $1C57				;$B2C1EA
	LDA.w #$0001				;$B2C1ED
	STA.b $38,x				;$B2C1F0
	LDA.w #$0010				;$B2C1F2
	JSL.l CODE_B48012			;$B2C1F5
CODE_B2C1F9:
	RTS					;$B2C1F9

CODE_B2C1FA:
	TYX					;$B2C1FA
	INC.b $38,x				;$B2C1FB
	LDA.w #$0319				;$B2C1FD
	JSL.l set_sprite_animation		;$B2C200
	LDA.w #$060D				;$B2C204
	JSL.l CODE_B28012			;$B2C207
	LDA.w #$0080				;$B2C20B
	STA.w $1C39				;$B2C20E
	CPX.w follower_kong_sprite		;$B2C211
	BNE.b CODE_B2C223			;$B2C214
	LDA.w $05AF				;$B2C216
	BIT.w #$4000				;$B2C219
	BNE.b CODE_B2C223			;$B2C21C
	LDA.w #$C000				;$B2C21E
	STA.b $26,x				;$B2C221
CODE_B2C223:
	RTS					;$B2C223

CODE_B2C224:
	TYX					;$B2C224
	LDA.b $2E,x				;$B2C225
	CLC					;$B2C227
	ADC.w #$0040				;$B2C228
	STA.b $2E,x				;$B2C22B
	LDA.b $2A,x				;$B2C22D
	BPL.b CODE_B2C255			;$B2C22F
	LDA.b $12,x				;$B2C231
	CMP.b $4C,x				;$B2C233
	BCS.b CODE_B2C254			;$B2C235
CODE_B2C237:
	LDA.w #$0004				;$B2C237
	STA.b $38,x				;$B2C23A
	LDA.w #$02E9				;$B2C23C
	JSL.l set_sprite_animation		;$B2C23F
	CPX.w follower_kong_sprite		;$B2C243
	BNE.b CODE_B2C254			;$B2C246
	LDA.b $4E,x				;$B2C248
	JSL.l CODE_B48012			;$B2C24A
	LDA.w #$4000				;$B2C24E
	TRB.w $05FB				;$B2C251
CODE_B2C254:
	RTS					;$B2C254

CODE_B2C255:
	LDA.b $12,x				;$B2C255
	CMP.b $4C,x				;$B2C257
	BCC.b CODE_B2C254			;$B2C259
	BRA.b CODE_B2C237			;$B2C25B

CODE_B2C25D:
	TYX					;$B2C25D
	LDA.w #$00C0				;$B2C25E
	STA.b $32,x				;$B2C261
	LDA.w current_world			;$B2C263
	CMP.w #$0002				;$B2C266
	BCS.b CODE_B2C271			;$B2C269
	LDY.w #$3000				;$B2C26B
	JSR.w CODE_B2C555			;$B2C26E
CODE_B2C271:
	STZ.w $05E3				;$B2C271
	STZ.b $2A,x				;$B2C274
	STZ.b $2E,x				;$B2C276
	LDA.w #$02ED				;$B2C278
	JSL.l set_sprite_animation		;$B2C27B
	LDY.w #$0000				;$B2C27F
	CPX.w active_kong_sprite		;$B2C282
	BNE.b CODE_B2C295			;$B2C285
	LDA.w #$8000				;$B2C287
	STA.w $04A6				;$B2C28A
	STA.w $04A8				;$B2C28D
	LDX.b current_sprite			;$B2C290
	LDY.w #$0001				;$B2C292
CODE_B2C295:
	STY.b $38,x				;$B2C295
	RTS					;$B2C297

CODE_B2C298:
	LDA.w #$0100				;$B2C298
	BIT.w $1C35				;$B2C29B
	BNE.b CODE_B2C2FE			;$B2C29E
	LDA.w #$6000				;$B2C2A0
	BIT.w $05FB				;$B2C2A3
	BNE.b CODE_B2C2FE			;$B2C2A6
	JSR.w CODE_B2CA2B			;$B2C2A8
	LDA.b $5A,x				;$B2C2AB
	BNE.b CODE_B2C2F7			;$B2C2AD
	LDA.b $18,x				;$B2C2AF
	BEQ.b CODE_B2C2F7			;$B2C2B1
	LDA.w $05AF				;$B2C2B3
	BIT.w #$4000				;$B2C2B6
	BEQ.b CODE_B2C2C0			;$B2C2B9
	LDA.w $005A,y				;$B2C2BB
	BNE.b CODE_B2C2F7			;$B2C2BE
CODE_B2C2C0:
	LDA.w $04D6				;$B2C2C0
	BIT.w #$0800				;$B2C2C3
	BEQ.b CODE_B2C2D0			;$B2C2C6
	LDA.w #$0006				;$B2C2C8
	JSL.l CODE_B4800F			;$B2C2CB
	RTS					;$B2C2CF

CODE_B2C2D0:
	BIT.w #$0400				;$B2C2D0
	BEQ.b CODE_B2C2DD			;$B2C2D3
	LDA.w #$0007				;$B2C2D5
	JSL.l CODE_B4800F			;$B2C2D8
	RTS					;$B2C2DC

CODE_B2C2DD:
	BIT.w #$0200				;$B2C2DD
	BEQ.b CODE_B2C2EA			;$B2C2E0
	LDA.w #$0009				;$B2C2E2
	JSL.l CODE_B4800F			;$B2C2E5
	RTS					;$B2C2E9

CODE_B2C2EA:
	BIT.w #$0100				;$B2C2EA
	BEQ.b CODE_B2C2F7			;$B2C2ED
	LDA.w #$0008				;$B2C2EF
	JSL.l CODE_B4800F			;$B2C2F2
	RTS					;$B2C2F6

CODE_B2C2F7:
	LDX.w $1C8F				;$B2C2F7
	BEQ.b CODE_B2C2FE			;$B2C2FA
	STY.b $5E,x				;$B2C2FC
CODE_B2C2FE:
	RTS					;$B2C2FE

CODE_B2C2FF:
	TYX					;$B2C2FF
	LDA.w #$0309				;$B2C300
	JSR.w CODE_B2C50E			;$B2C303
	LDA.w #$000D				;$B2C306
	STA.b $38,x				;$B2C309
	LDA.w #$0769				;$B2C30B
	JSL.l CODE_B28012			;$B2C30E
	RTS					;$B2C312

CODE_B2C313:
	TYX					;$B2C313
	STZ.b $1C,x				;$B2C314
	LDA.w #$0004				;$B2C316
	STA.b $38,x				;$B2C319
	RTS					;$B2C31B

CODE_B2C31C:
	LDA.w $001C,y				;$B2C31C
	CLC					;$B2C31F
	ADC.w #$0008				;$B2C320
	STA.w $001C,y				;$B2C323
	CLC					;$B2C326
	ADC.w $0034,y				;$B2C327
	STA.w $0034,y				;$B2C32A
	RTS					;$B2C32D

CODE_B2C32E:
	LDA.w #$FC01				;$B2C32E
	STA.w $04E4				;$B2C331
	LDA.w #$0004				;$B2C334
	STA.w $0038,y				;$B2C337
	RTS					;$B2C33A

CODE_B2C33B:
	TYX					;$B2C33B
	CPX.w active_kong_sprite		;$B2C33C
	BNE.b CODE_B2C34B			;$B2C33F
	LDA.b $5E,x				;$B2C341
	CLC					;$B2C343
	ADC.w #$0020				;$B2C344
	STA.b $5E,x				;$B2C347
	BRA.b CODE_B2C352			;$B2C349

CODE_B2C34B:
	LDA.w #$066C				;$B2C34B
	JSL.l CODE_B28012			;$B2C34E
CODE_B2C352:
	STZ.b $38,x				;$B2C352
	LDA.w #$FE01				;$B2C354
	STA.w $04E4				;$B2C357
	LDA.w #$0309				;$B2C35A
	JSR.w CODE_B2C50E			;$B2C35D
	RTS					;$B2C360

CODE_B2C361:
	RTS					;$B2C361

CODE_B2C362:
	JSL.l CODE_B7D7FB			;$B2C362
	LDX.b current_sprite			;$B2C366
	LDY.w #$2000				;$B2C368
	JSR.w CODE_B2C555			;$B2C36B
	LDA.w #$0002				;$B2C36E
	STA.w map_node_number			;$B2C371
	STZ.w $1C41				;$B2C374
	STZ.w $1C57				;$B2C377
	LDA.w #$0009				;$B2C37A
	STA.b $38,x				;$B2C37D
	LDA.w #$8001				;$B2C37F
	ORA.b $26,x				;$B2C382
	STA.b $26,x				;$B2C384
	STZ.b $5A,x				;$B2C386
	STZ.b $2A,x				;$B2C388
	STZ.b $2E,x				;$B2C38A
	LDA.w #$4000				;$B2C38C
	TSB.w $0611				;$B2C38F
	LDA.w #$0000				;$B2C392
	CPX.w active_kong_sprite		;$B2C395
	BNE.b CODE_B2C39D			;$B2C398
	LDA.w #$0009				;$B2C39A
CODE_B2C39D:
	STA.b $38,x				;$B2C39D
	LDA.w #$02F7				;$B2C39F
	CPX.w active_kong_sprite		;$B2C3A2
	BNE.b CODE_B2C3C8			;$B2C3A5
	LDA.w $05ED				;$B2C3A7
	STA.b $12,x				;$B2C3AA
	LDA.w $05EF				;$B2C3AC
	STA.b $16,x				;$B2C3AF
	LDA.w #$1000				;$B2C3B1
	BIT.w $05FD				;$B2C3B4
	BEQ.b CODE_B2C3C5			;$B2C3B7
	LDA.w #$00F1				;$B2C3B9
	JSL.l CODE_BB85A0			;$B2C3BC
	LDA.w #$0300				;$B2C3C0
	BRA.b CODE_B2C3C8			;$B2C3C3

CODE_B2C3C5:
	LDA.w #$02EE				;$B2C3C5
CODE_B2C3C8:
	JSL.l set_sprite_animation		;$B2C3C8
	RTS					;$B2C3CC

DATA_B2C3CD:
	db $02,$03,$04,$06

CODE_B2C3D1:
	LDA.w current_world			;$B2C3D1
	BNE.b CODE_B2C417			;$B2C3D4
	LDA.w #$0004				;$B2C3D6
	BIT.w $05FB				;$B2C3D9
	BEQ.b CODE_B2C417			;$B2C3DC
	JMP.w CODE_B2C362			;$B2C3DE

CODE_B2C3E1:
	TYX					;$B2C3E1
	STZ.b $38,x				;$B2C3E2
	JSR.w CODE_B2C4E1			;$B2C3E4
	JSR.w CODE_B2C519			;$B2C3E7
	JSR.w CODE_B2C547			;$B2C3EA
	LDX.b current_sprite			;$B2C3ED
	CPX.w active_kong_sprite		;$B2C3EF
	BNE.b CODE_B2C402			;$B2C3F2
	LDY.w #$0026				;$B2C3F4
	JSL.l CODE_BB8585			;$B2C3F7
	LDA.w #$076A				;$B2C3FB
	JSL.l CODE_B28012			;$B2C3FE
CODE_B2C402:
	RTS					;$B2C402

CODE_B2C403:
	LDA.w #$0170				;$B2C403
	STA.w $005E,y				;$B2C406
	LDX.w follower_kong_sprite		;$B2C409
	LDA.w #$0180				;$B2C40C
	STA.b $5E,x				;$B2C40F
	LDX.w #$001E				;$B2C411
	JMP.w CODE_B2C753			;$B2C414

CODE_B2C417:
	TYX					;$B2C417
	LDA.w #$0001				;$B2C418
	STA.b $5A,x				;$B2C41B
	LDA.w #$0011				;$B2C41D
	STA.b $38,x				;$B2C420
	LDA.w #$FF70				;$B2C422
	STA.b $5C,x				;$B2C425
	LDA.w #$0012				;$B2C427
	STA.b $1C,x				;$B2C42A
	LDA.w #$0309				;$B2C42C
	JSR.w CODE_B2C50E			;$B2C42F
	RTS					;$B2C432

CODE_B2C433:
	TYX					;$B2C433
	LDA.b $2E,x				;$B2C434
	CLC					;$B2C436
	ADC.b $5C,x				;$B2C437
	STA.b $2E,x				;$B2C439
	LDA.b $5C,x				;$B2C43B
	CLC					;$B2C43D
	ADC.w #$0019				;$B2C43E
	STA.b $5C,x				;$B2C441
	DEC.b $1C,x				;$B2C443
	BEQ.b CODE_B2C448			;$B2C445
	RTS					;$B2C447

CODE_B2C448:
	LDA.w #$0006				;$B2C448
	STA.b $38,x				;$B2C44B
	LDA.b $26,x				;$B2C44D
	BIT.w #$4000				;$B2C44F
	BNE.b CODE_B2C45B			;$B2C452
	LDA.w #$076A				;$B2C454
	JSL.l CODE_B28012			;$B2C457
CODE_B2C45B:
	JSR.w CODE_B2C4E1			;$B2C45B
	CPX.w active_kong_sprite		;$B2C45E
	BNE.b CODE_B2C469			;$B2C461
	LDA.w #$00EE				;$B2C463
	STA.w $1C9D				;$B2C466
CODE_B2C469:
	LDY.w #$2000				;$B2C469
	JSR.w CODE_B2C555			;$B2C46C
	LDY.b $32,x				;$B2C46F
	LDA.w #$0007				;$B2C471
	CPX.w active_kong_sprite		;$B2C474
	BEQ.b CODE_B2C4AF			;$B2C477
	JSL.l CODE_B9E000			;$B2C479
	LDY.w active_kong_sprite		;$B2C47D
	LDA.w $0060,y				;$B2C480
	STA.l $7EA258				;$B2C483
	LDA.b $12,x				;$B2C487
	STA.l $7EA25A				;$B2C489
	LDA.b $16,x				;$B2C48D
	STA.l $7EA25C				;$B2C48F
	PHB					;$B2C493
	LDA.w $1C9D				;$B2C494
	BNE.b CODE_B2C49C			;$B2C497
	LDA.w #$00EE				;$B2C499
CODE_B2C49C:
	INC					;$B2C49C
	LDX.w #$7EA258				;$B2C49D
	LDY.w #$7EA25E				;$B2C4A0
	MVN $7EA25E>>16,$7EA258>>16		;$B2C4A3
	PLB					;$B2C4A6
	LDX.b current_sprite			;$B2C4A7
	LDA.b $32,x				;$B2C4A9
	TAY					;$B2C4AB
	LDA.w #$000C				;$B2C4AC
CODE_B2C4AF:
	STA.b $38,x				;$B2C4AF
	LDA.w #$0001				;$B2C4B1
	STA.b $5A,x				;$B2C4B4
	STY.b $62,x				;$B2C4B6
	STZ.b $68,x				;$B2C4B8
	LDA.w #$00A1				;$B2C4BA
	STA.b $6A,x				;$B2C4BD
	LDA.w #$0061				;$B2C4BF
	STA.b $64,x				;$B2C4C2
	LDA.w #$0008				;$B2C4C4
	STA.b $66,x				;$B2C4C7
	JSR.w CODE_B2C519			;$B2C4C9
	CPY.w active_kong_sprite		;$B2C4CC
	BNE.b CODE_B2C4E0			;$B2C4CF
	LDA.w current_world			;$B2C4D1
	BNE.b CODE_B2C4D9			;$B2C4D4
	JSR.w CODE_B2C547			;$B2C4D6
CODE_B2C4D9:
	LDA.w #$056B				;$B2C4D9
	JSL.l CODE_B28012			;$B2C4DC
CODE_B2C4E0:
	RTS					;$B2C4E0

CODE_B2C4E1:
	LDA.w $0040,y				;$B2C4E1
	SEC					;$B2C4E4
	SBC.w $003C,y				;$B2C4E5
	STA.b $1A				;$B2C4E8
	TAX					;$B2C4EA
	LDA.w $001E,y				;$B2C4EB
	BIT.w #$4000				;$B2C4EE
	BEQ.b CODE_B2C4FA			;$B2C4F1
	LDA.w #$0008				;$B2C4F3
	SEC					;$B2C4F6
	SBC.b $1A				;$B2C4F7
	TAX					;$B2C4F9
CODE_B2C4FA:
	TXA					;$B2C4FA
	XBA					;$B2C4FB
	LSR					;$B2C4FC
	AND.w #$03FF				;$B2C4FD
	STA.w $0060,y				;$B2C500
	LDA.b $1A				;$B2C503
	CLC					;$B2C505
	ADC.w #$0313				;$B2C506
	JSL.l set_sprite_animation		;$B2C509
	RTS					;$B2C50D

CODE_B2C50E:
	CLC					;$B2C50E
	ADC.b $40,x				;$B2C50F
	SEC					;$B2C511
	SBC.b $3C,x				;$B2C512
	JSL.l set_sprite_animation		;$B2C514
	RTS					;$B2C518

CODE_B2C519:
	LDY.w #$020A				;$B2C519
	JSL.l CODE_BB85B8			;$B2C51C
	BCS.b CODE_B2C546			;$B2C520
	LDX.b alternate_sprite			;$B2C522
	LDY.b current_sprite			;$B2C524
	STY.b $5C,x				;$B2C526
	LDA.w $0028,y				;$B2C528
	STA.b $06,x				;$B2C52B
	LDA.w $0026,y				;$B2C52D
	STA.b $26,x				;$B2C530
	CMP.w #$C000				;$B2C532
	BEQ.b CODE_B2C546			;$B2C535
	LDA.w #$FF00				;$B2C537
	BIT.w screen_brightness			;$B2C53A
	BNE.b CODE_B2C546			;$B2C53D
	LDA.w #$076A				;$B2C53F
	JSL.l CODE_B28012			;$B2C542
CODE_B2C546:
	RTS					;$B2C546

CODE_B2C547:
	LDA.w #$0001				;$B2C547
	STA.b level_number			;$B2C54A
	JSL.l CODE_B7B006			;$B2C54C
	JSL.l CODE_B7D7FB			;$B2C550
	RTS					;$B2C554

CODE_B2C555:
	STY.b $1A				;$B2C555
	LDA.b $1E,x				;$B2C557
	AND.w #$CFFF				;$B2C559
	ORA.b $1A				;$B2C55C
	STA.b $1E,x				;$B2C55E
	RTS					;$B2C560

CODE_B2C561:
	LDX.w active_kong_sprite		;$B2C561
	LDA.b $38,x				;$B2C564
	CMP.w #$0007				;$B2C566
	BNE.b CODE_B2C56F			;$B2C569
	LDA.b $62,x				;$B2C56B
	BEQ.b CODE_B2C5A8			;$B2C56D
CODE_B2C56F:
	PHB					;$B2C56F
	LDX.w #$7EA25E				;$B2C570
	LDY.w #$7EA258				;$B2C573
	LDA.w #$00F4				;$B2C576
	MVN $7EA258>>16,$7EA25E>>16		;$B2C579
	PLB					;$B2C57C
	LDX.w active_kong_sprite		;$B2C57D
	LDY.w follower_kong_sprite		;$B2C580
	LDA.b $38,x				;$B2C583
	CMP.w #$0007				;$B2C585
	BEQ.b CODE_B2C591			;$B2C588
	LDA.w #$0000				;$B2C58A
	STA.l $7EA34A				;$B2C58D
CODE_B2C591:
	LDA.l $7EA25A				;$B2C591
	BEQ.b CODE_B2C5AC			;$B2C595
	STA.w $0012,y				;$B2C597
	LDA.l $7EA258				;$B2C59A
	STA.w $0060,y				;$B2C59E
	LDA.l $7EA25C				;$B2C5A1
	STA.w $0016,y				;$B2C5A5
CODE_B2C5A8:
	PLA					;$B2C5A8
	JMP.w CODE_B2C0A2			;$B2C5A9

CODE_B2C5AC:
	LDA.w #$0009				;$B2C5AC
	STA.w $005A,y				;$B2C5AF
	LDA.w #$0004				;$B2C5B2
	STA.w $0038,y				;$B2C5B5
	LDA.w $005C,y				;$B2C5B8
	CLC					;$B2C5BB
	ADC.w #$0004				;$B2C5BC
	STA.w $005C,y				;$B2C5BF
	BRA.b CODE_B2C5A8			;$B2C5C2

CODE_B2C5C4:
	TYX					;$B2C5C4
	JSR.w CODE_B2C934			;$B2C5C5
	JSR.w CODE_B2CA2B			;$B2C5C8
	JSR.w CODE_B2D1FF			;$B2C5CB
	LDX.w follower_kong_sprite		;$B2C5CE
	LDA.b $38,x				;$B2C5D1
	CMP.w #$000C				;$B2C5D3
	BEQ.b CODE_B2C60D			;$B2C5D6
	PHB					;$B2C5D8
	LDX.w #$7EA25E				;$B2C5D9
	LDY.w #$7EA258				;$B2C5DC
	LDA.w #$00F4				;$B2C5DF
	MVN $7EA258>>16,$7EA25E>>16		;$B2C5E2
	PLB					;$B2C5E5
	LDX.w active_kong_sprite		;$B2C5E6
	LDA.b $60,x				;$B2C5E9
	STA.l $7EA348				;$B2C5EB
	LDA.b $12,x				;$B2C5EF
	STA.l $7EA34A				;$B2C5F1
	LDA.b $16,x				;$B2C5F5
	STA.l $7EA34C				;$B2C5F7
	LDA.w $1C9D				;$B2C5FB
	BEQ.b CODE_B2C60C			;$B2C5FE
	SEC					;$B2C600
	SBC.w #$0006				;$B2C601
	CMP.w #$0006				;$B2C604
	BCC.b CODE_B2C60C			;$B2C607
	STA.w $1C9D				;$B2C609
CODE_B2C60C:
	TXY					;$B2C60C
CODE_B2C60D:
	LDA.w $0060,y				;$B2C60D
	STA.l $7EA348				;$B2C610
	LDA.w $0012,y				;$B2C614
	STA.l $7EA34A				;$B2C617
	LDA.w $0016,y				;$B2C61B
	STA.l $7EA34C				;$B2C61E
	LDA.w $0012,y				;$B2C622
	STA.l $7EA222				;$B2C625
	LDA.w $0016,y				;$B2C629
	STA.l $7EA224				;$B2C62C
	JSL.l CODE_B9E000			;$B2C630
	LDX.w #CODE_B2D0EC			;$B2C634
	LDA.w current_world			;$B2C637
	BEQ.b CODE_B2C63F			;$B2C63A
	LDX.w #CODE_B2D10C			;$B2C63C
CODE_B2C63F:
	STX.b $1A				;$B2C63F
	LDA.w $0012,y				;$B2C641
	LDX.b $16,y				;$B2C644
	PEA.w CODE_B2C64C-$01			;$B2C646
	JMP.w ($001A)				;$B2C649
CODE_B2C64C:
	BEQ.b CODE_B2C662			;$B2C64C
	CMP.w #$0009				;$B2C64E
	BEQ.b CODE_B2C666			;$B2C651
CODE_B2C653:
	LDX.b current_sprite			;$B2C653
	JSR.w CODE_B2D1C7			;$B2C655
	TDC					;$B2C658
	STA.w $002A,y				;$B2C659
	STA.w $002E,y				;$B2C65C
	JSR.w CODE_B2C68B			;$B2C65F
CODE_B2C662:
	PLA					;$B2C662
	JMP.w CODE_B2C0A2			;$B2C663

CODE_B2C666:
	LDA.w #$0004				;$B2C666
	BIT.w $053B				;$B2C669
	BEQ.b CODE_B2C653			;$B2C66C
	LDA.w $0016,y				;$B2C66E
	CMP.w #$0230				;$B2C671
	BNE.b CODE_B2C662			;$B2C674
	LDA.w #$0015				;$B2C676
	STA.w map_node_number			;$B2C679
	LDA.w #$0100				;$B2C67C
	TSB.w $1C35				;$B2C67F
	BNE.b CODE_B2C68A			;$B2C682
	LDY.w #$0001				;$B2C684
	STY.w $1C39				;$B2C687
CODE_B2C68A:
	RTS					;$B2C68A

CODE_B2C68B:
	LDY.w active_kong_sprite		;$B2C68B
	JSR.w CODE_B2C6AC			;$B2C68E
CODE_B2C691:
	JSR.w CODE_B2C70E			;$B2C691
	BCS.b CODE_B2C69F			;$B2C694
	JSR.w CODE_B2C733			;$B2C696
	BCS.b CODE_B2C69F			;$B2C699
	JSR.w CODE_B2C753			;$B2C69B
	RTS					;$B2C69E

CODE_B2C69F:
	TXA					;$B2C69F
	CLC					;$B2C6A0
	ADC.w #$000C				;$B2C6A1
	TAX					;$B2C6A4
	LDA.l DATA_B2C7BC,x			;$B2C6A5
	BNE.b CODE_B2C691			;$B2C6A9
	RTS					;$B2C6AB

CODE_B2C6AC:
	LDA.w current_world			;$B2C6AC
	ASL					;$B2C6AF
	TAX					;$B2C6B0
	LDA.l DATA_B2C7BC,x			;$B2C6B1
	TAX					;$B2C6B5
	RTS					;$B2C6B6

CODE_B2C6B7:
	LDY.w active_kong_sprite		;$B2C6B7
	JSR.w CODE_B2C6AC			;$B2C6BA
CODE_B2C6BD:
	JSR.w CODE_B2C70E			;$B2C6BD
	BCS.b CODE_B2C6CB			;$B2C6C0
	JSR.w CODE_B2C753			;$B2C6C2
	BCC.b CODE_B2C6CA			;$B2C6C5
	JSR.w CODE_B2C6D8			;$B2C6C7
CODE_B2C6CA:
	RTS					;$B2C6CA

CODE_B2C6CB:
	TXA					;$B2C6CB
	CLC					;$B2C6CC
	ADC.w #$000C				;$B2C6CD
	TAX					;$B2C6D0
	LDA.l DATA_B2C7BC,x			;$B2C6D1
	BNE.b CODE_B2C6BD			;$B2C6D5
	RTS					;$B2C6D7

CODE_B2C6D8:
	JSR.w CODE_B2CDE5			;$B2C6D8
	LDA.b $12,x				;$B2C6DB
	STA.w $05ED				;$B2C6DD
	LDA.b $16,x				;$B2C6E0
	STA.w $05EF				;$B2C6E2
	LDY.w $1C8F				;$B2C6E5
	BEQ.b CODE_B2C6ED			;$B2C6E8
	STA.w $005E,y				;$B2C6EA
CODE_B2C6ED:
	RTS					;$B2C6ED

CODE_B2C6EE:
	LDA.w $1C35				;$B2C6EE
	BIT.w #$0100				;$B2C6F1
	BNE.b CODE_B2C70D			;$B2C6F4
	LDA.l DATA_B2C7BC			;$B2C6F6
	TAX					;$B2C6FA
	JSR.w CODE_B2C70E			;$B2C6FB
	BCS.b CODE_B2C70D			;$B2C6FE
	JSR.w CODE_B2C7AE			;$B2C700
	JSR.w CODE_B2C6D8			;$B2C703
	STZ.w $05ED				;$B2C706
	LDX.b current_sprite			;$B2C709
	STZ.b $62,x				;$B2C70B
CODE_B2C70D:
	RTS					;$B2C70D

CODE_B2C70E:
	LDA.w $0012,y				;$B2C70E
	SEC					;$B2C711
	SBC.w $0052,y				;$B2C712
	CMP.l DATA_B2C7BC,x			;$B2C715
	BCC.b CODE_B2C731			;$B2C719
	CMP.l DATA_B2C7BC+$04,x			;$B2C71B
	BCS.b CODE_B2C731			;$B2C71F
	LDA.w $0016,y				;$B2C721
	CMP.l DATA_B2C7BC+$02,x			;$B2C724
	BCC.b CODE_B2C731			;$B2C728
	CMP.l DATA_B2C7BC+$06,x			;$B2C72A
	BCS.b CODE_B2C731			;$B2C72E
	RTS					;$B2C730

CODE_B2C731:
	SEC					;$B2C731
	RTS					;$B2C732

CODE_B2C733:
	LDA.w $0060,y				;$B2C733
	CLC					;$B2C736
	ADC.w #$0400				;$B2C737
	STA.b $1A				;$B2C73A
	LDA.l DATA_B2C7BC+$08,x			;$B2C73C
	CLC					;$B2C740
	ADC.w #$0380				;$B2C741
	CMP.b $1A				;$B2C744
	BCS.b CODE_B2C751			;$B2C746
	ADC.w #$0101				;$B2C748
	CMP.b $1A				;$B2C74B
	BCC.b CODE_B2C751			;$B2C74D
	CLC					;$B2C74F
	RTS					;$B2C750

CODE_B2C751:
	SEC					;$B2C751
	RTS					;$B2C752

CODE_B2C753:
	LDA.l DATA_B2C7BC+$0A,x			;$B2C753
	BMI.b CODE_B2C7AE			;$B2C757
	PHA					;$B2C759
	JSL.l CODE_B48015			;$B2C75A
	BCC.b CODE_B2C7AB			;$B2C75E
	LDY.w active_kong_sprite		;$B2C760
	LDX.b $38,y				;$B2C763
	STX.w $1C71				;$B2C765
	LDA.w #$0004				;$B2C768
	STA.w $0038,y				;$B2C76B
	CPX.w #$0009				;$B2C76E
	BEQ.b CODE_B2C786			;$B2C771
	LDA.w $0012,y				;$B2C773
	STA.w $1C41				;$B2C776
	LDA.w $0016,y				;$B2C779
	STA.w $1C57				;$B2C77C
	LDA.w #$0500				;$B2C77F
	JSL.l CODE_B28012			;$B2C782
CODE_B2C786:
	STZ.w map_node_number			;$B2C786
	LDA.w #$4000				;$B2C789
	TRB.w $0611				;$B2C78C
	PLA					;$B2C78F
	JSL.l CODE_B48012			;$B2C790
	LDA.w $1C71				;$B2C794
	CMP.w #$0009				;$B2C797
	BEQ.b CODE_B2C7A9			;$B2C79A
	LDX.w follower_kong_sprite		;$B2C79C
	LDA.w #$0001				;$B2C79F
	STA.b $5A,x				;$B2C7A2
	LDA.w #$000C				;$B2C7A4
	STA.b $38,x				;$B2C7A7
CODE_B2C7A9:
	SEC					;$B2C7A9
	RTS					;$B2C7AA

CODE_B2C7AB:
	CLC					;$B2C7AB
	PLA					;$B2C7AC
	RTS					;$B2C7AD

CODE_B2C7AE:
	LDA.w #$0100				;$B2C7AE
	TSB.w $1C35				;$B2C7B1
	LDA.w #$820F				;$B2C7B4
	STA.w screen_brightness			;$B2C7B7
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
	LDA.w #$0100				;$B2C934
	BIT.w $1C35				;$B2C937
	BNE.b CODE_B2C944			;$B2C93A
	LDA.w $04D6				;$B2C93C
	AND.w #$0F00				;$B2C93F
	BNE.b CODE_B2C948			;$B2C942
CODE_B2C944:
	JSR.w CODE_B2D50E			;$B2C944
	RTS					;$B2C947

CODE_B2C948:
	BIT.w #$0800				;$B2C948
	BEQ.b CODE_B2C950			;$B2C94B
	AND.w #$FBFF				;$B2C94D
CODE_B2C950:
	BIT.w #$0100				;$B2C950
	BEQ.b CODE_B2C958			;$B2C953
	AND.w #$FDFF				;$B2C955
CODE_B2C958:
	XBA					;$B2C958
	ASL					;$B2C959
	TAY					;$B2C95A
	LDA.w DATA_B2D4C5-$02,y			;$B2C95B
	STA.b $24				;$B2C95E
	CLC					;$B2C960
	ADC.w #$0200				;$B2C961
	AND.w #$03FF				;$B2C964
	STA.b $26				;$B2C967
	JSR.w CODE_B2D4D9			;$B2C969
	CMP.w #$0040				;$B2C96C
	BMI.b CODE_B2C97E			;$B2C96F
	LDA.b $60,x				;$B2C971
	SEC					;$B2C973
	SBC.b $26				;$B2C974
	JSR.w CODE_B2D51D			;$B2C976
	CMP.w #$00D0				;$B2C979
	BMI.b CODE_B2C982			;$B2C97C
CODE_B2C97E:
	LDA.b $24				;$B2C97E
	STA.b $60,x				;$B2C980
CODE_B2C982:
	RTS					;$B2C982

CODE_B2C983:
	LDA.w current_boat			;$B2C983
	CMP.w #$0003				;$B2C986
	BEQ.b CODE_B2C99D			;$B2C989
	JSR.w CODE_B2C99E			;$B2C98B
	LDA.w $04DA				;$B2C98E
	BIT.w #$0040				;$B2C991
	BEQ.b CODE_B2C99D			;$B2C994
	LDA.w #$0767				;$B2C996
	JSL.l CODE_B28012			;$B2C999
CODE_B2C99D:
	RTS					;$B2C99D

CODE_B2C99E:
	LDA.w $04D6				;$B2C99E
	AND.w #$0040				;$B2C9A1
	BEQ.b CODE_B2C9C0			;$B2C9A4
	LDX.w $1C45				;$B2C9A6
	LDA.w $04DA				;$B2C9A9
	BEQ.b CODE_B2C9C0			;$B2C9AC
	EOR.l DATA_B2C9D2,x			;$B2C9AE
	BNE.b CODE_B2C9C1			;$B2C9B2
	INC.w $1C45				;$B2C9B4
	INC.w $1C45				;$B2C9B7
	LDA.l DATA_B2C9D2+$02,x			;$B2C9BA
	BEQ.b CODE_B2C9C5			;$B2C9BE
CODE_B2C9C0:
	RTS					;$B2C9C0

CODE_B2C9C1:
	STZ.w $1C45				;$B2C9C1
	RTS					;$B2C9C4

CODE_B2C9C5:
	LDA.w current_boat			;$B2C9C5
	ASL					;$B2C9C8
	TAX					;$B2C9C9
	LDA.w DATA_B2C9D2+$04,x			;$B2C9CA
	JSL.l CODE_B28012			;$B2C9CD
	RTS					;$B2C9D1

DATA_B2C9D2:
	dw $0030,$0000,$0668,$076F,$076E,$0770

CODE_B2C9DE:
	LDA.b $2A,x				;$B2C9DE
	BEQ.b CODE_B2C9FA			;$B2C9E0
	BPL.b CODE_B2C9EF			;$B2C9E2
	CLC					;$B2C9E4
	ADC.w #$0010				;$B2C9E5
	BMI.b CODE_B2C9F8			;$B2C9E8
	LDA.w #$0000				;$B2C9EA
	BRA.b CODE_B2C9F8			;$B2C9ED

CODE_B2C9EF:
	SEC					;$B2C9EF
	SBC.w #$0010				;$B2C9F0
	BPL.b CODE_B2C9F8			;$B2C9F3
	LDA.w #$0000				;$B2C9F5
CODE_B2C9F8:
	STA.b $2A,x				;$B2C9F8
CODE_B2C9FA:
	RTS					;$B2C9FA

CODE_B2C9FB:
	LDA.b $2E,x				;$B2C9FB
	BEQ.b CODE_B2CA17			;$B2C9FD
	BPL.b CODE_B2CA0C			;$B2C9FF
	CLC					;$B2CA01
	ADC.w #$0010				;$B2CA02
	BMI.b CODE_B2CA15			;$B2CA05
	LDA.w #$0000				;$B2CA07
	BRA.b CODE_B2CA15			;$B2CA0A

CODE_B2CA0C:
	SEC					;$B2CA0C
	SBC.w #$0010				;$B2CA0D
	BPL.b CODE_B2CA15			;$B2CA10
	LDA.w #$0000				;$B2CA12
CODE_B2CA15:
	STA.b $2E,x				;$B2CA15
CODE_B2CA17:
	RTS					;$B2CA17

CODE_B2CA18:
	TYX					;$B2CA18
	LDY.w active_kong_sprite		;$B2CA19
	DEC.b $1C,x				;$B2CA1C
	BNE.b CODE_B2CA2A			;$B2CA1E
	LDA.w #$0009				;$B2CA20
	STA.b $5A,x				;$B2CA23
	LDA.w #$0004				;$B2CA25
	STA.b $38,x				;$B2CA28
CODE_B2CA2A:
	RTS					;$B2CA2A

CODE_B2CA2B:
	LDX.w active_kong_sprite		;$B2CA2B
	LDY.w follower_kong_sprite		;$B2CA2E
	LDA.b $16,x				;$B2CA31
	CMP.w $0016,y				;$B2CA33
	BPL.b CODE_B2CA4B			;$B2CA36
	LDA.w #$00E4				;$B2CA38
	CLC					;$B2CA3B
	ADC.w $004C,y				;$B2CA3C
	STA.w $000E,y				;$B2CA3F
	LDA.w #$00D8				;$B2CA42
	CLC					;$B2CA45
	ADC.b $4C,x				;$B2CA46
	STA.b $0E,x				;$B2CA48
	RTS					;$B2CA4A

CODE_B2CA4B:
	LDA.w #$00E4				;$B2CA4B
	CLC					;$B2CA4E
	ADC.b $4C,x				;$B2CA4F
	STA.b $0E,x				;$B2CA51
	LDA.w #$00D8				;$B2CA53
	CLC					;$B2CA56
	ADC.w $004C,y				;$B2CA57
	STA.w $000E,y				;$B2CA5A
	RTS					;$B2CA5D

CODE_B2CA5E:
	LDY.b current_sprite			;$B2CA5E
	LDA.w $0050,y				;$B2CA60
	ASL					;$B2CA63
	TAX					;$B2CA64
	LDA.w current_boat			;$B2CA65
	BIT.w #$0001				;$B2CA68
	BEQ.b CODE_B2CA7A			;$B2CA6B
	CPX.w #$0003				;$B2CA6D
	BCS.b CODE_B2CA7A			;$B2CA70
	CPX.w #$0000				;$B2CA72
	BNE.b CODE_B2CAA6			;$B2CA75
CODE_B2CA77:
	LDX.w #$0012				;$B2CA77
CODE_B2CA7A:
	LDA.w DATA_B2CAB0,x			;$B2CA7A
	AND.w #$00FF				;$B2CA7D
	STA.w $000E,y				;$B2CA80
	LDA.w DATA_B2CAB0+$01,x			;$B2CA83
	LDX.w active_kong_sprite		;$B2CA86
	AND.w #$00FF				;$B2CA89
	STA.b $0E,x				;$B2CA8C
	CMP.w #$00E4				;$B2CA8E
	BEQ.b CODE_B2CA9D			;$B2CA91
	LDA.w #$00E4				;$B2CA93
	LDX.w follower_kong_sprite		;$B2CA96
	STA.b $0E,x				;$B2CA99
	BRA.b CODE_B2CAA5			;$B2CA9B

CODE_B2CA9D:
	LDA.w #$00D8				;$B2CA9D
	LDX.w follower_kong_sprite		;$B2CAA0
	STA.b $0E,x				;$B2CAA3
CODE_B2CAA5:
	RTS					;$B2CAA5

CODE_B2CAA6:
	LDA.w current_boat			;$B2CAA6
	CMP.w #$0001				;$B2CAA9
	BNE.b CODE_B2CA7A			;$B2CAAC
	BRA.b CODE_B2CA77			;$B2CAAE

DATA_B2CAB0:
	db $D0,$D8,$D0,$D8,$D0,$D8,$D0,$D8,$D0,$D8,$D0,$E4,$D0,$E4,$D0,$E4
	db $D0,$E4,$E6,$D8

map_swimming_kong_splash_main:
;$B2CAC4
	LDX.w active_kong_sprite		;$B2CAC4
	LDA.b $38,x				;$B2CAC7
	AND.w #$7FFF				;$B2CAC9
	CMP.w #$0007				;$B2CACC
	BEQ.b CODE_B2CADC			;$B2CACF
	CMP.w #$0000				;$B2CAD1
	BEQ.b CODE_B2CADC			;$B2CAD4
	JSL.l CODE_BB8591			;$B2CAD6
	BRA.b CODE_B2CB34			;$B2CADA

CODE_B2CADC:
	LDX.b $5C,y				;$B2CADC
	LDA.b $0E,x				;$B2CADE
	DEC					;$B2CAE0
	STA.w $000E,y				;$B2CAE1
	LDA.b $1E,x				;$B2CAE4
	EOR.w $001E,y				;$B2CAE6
	AND.w #$4000				;$B2CAE9
	EOR.w $001E,y				;$B2CAEC
	STA.w $001E,y				;$B2CAEF
	LDA.b $40,x				;$B2CAF2
	SEC					;$B2CAF4
	SBC.w #$0313				;$B2CAF5
	ASL					;$B2CAF8
	TAY					;$B2CAF9
	LDA.b $1E,x				;$B2CAFA
	BIT.w #$4000				;$B2CAFC
	BNE.b CODE_B2CB0A			;$B2CAFF
	LDA.b [$6A],y				;$B2CB01
	CLC					;$B2CB03
	ADC.b $12,x				;$B2CB04
	STA.b $1A				;$B2CB06
	BRA.b CODE_B2CB17			;$B2CB08

CODE_B2CB0A:
	LDA.b [$6A],y				;$B2CB0A
	EOR.w #$FFFF				;$B2CB0C
	INC					;$B2CB0F
	INC					;$B2CB10
	INC					;$B2CB11
	CLC					;$B2CB12
	ADC.b $12,x				;$B2CB13
	STA.b $1A				;$B2CB15
CODE_B2CB17:
	TYA					;$B2CB17
	CLC					;$B2CB18
	ADC.w #$000A				;$B2CB19
	TAY					;$B2CB1C
	LDA.b [$6A],y				;$B2CB1D
	CLC					;$B2CB1F
	ADC.b $16,x				;$B2CB20
	STA.b $1C				;$B2CB22
	LDY.b current_sprite			;$B2CB24
	LDA.b $1A				;$B2CB26
	STA.w $0012,y				;$B2CB28
	LDA.b $1C				;$B2CB2B
	STA.w $0016,y				;$B2CB2D
	JSL.l process_anim_preserve_state	;$B2CB30
CODE_B2CB34:
	JML [$04F5]				;$B2CB34

unknown_sprite_003C_main:
;$B2CB37
	JMP.w (DATA_B2CB3A,x)			;$B2CB37

DATA_B2CB3A:
	dw CODE_B2CB3E
	dw CODE_B2CB59

CODE_B2CB3E:
	TYX					;$B2CB3E
	STX.w $1C8F				;$B2CB3F
	INC.b $38,x				;$B2CB42
	LDA.b $24,x				;$B2CB44
	STA.b $60,x				;$B2CB46
	STZ.b $24,x				;$B2CB48
	LDX.w #$0000				;$B2CB4A
	TXA					;$B2CB4D
CODE_B2CB4E:
	STA.l $7EA228,x				;$B2CB4E
	INX					;$B2CB52
	INX					;$B2CB53
	CPX.w #$0030				;$B2CB54
	BCC.b CODE_B2CB4E			;$B2CB57
CODE_B2CB59:
	LDA.w #$0010				;$B2CB59
	BIT.w $05FB				;$B2CB5C
	BNE.b CODE_B2CB66			;$B2CB5F
	LDA.w $005E,y				;$B2CB61
	BEQ.b CODE_B2CB6F			;$B2CB64
CODE_B2CB66:
	STZ.w $1C8F				;$B2CB66
	JSR.w CODE_B2E53B			;$B2CB69
	JML [$04F5]				;$B2CB6C

CODE_B2CB6F:
	JSR.w CODE_B2CB8D			;$B2CB6F
	JSR.w CODE_B2CC0A			;$B2CB72
	JML [$04F5]				;$B2CB75

CODE_B2CB78:
	LDX.w #$0010				;$B2CB78
CODE_B2CB7B:
	DEX					;$B2CB7B
	DEX					;$B2CB7C
	LDA.l $7EA248,x				;$B2CB7D
	AND.w #$00FF				;$B2CB81
	BNE.b CODE_B2CB7B			;$B2CB84
	TXA					;$B2CB86
	STA.b $20				;$B2CB87
	ASL					;$B2CB89
	STA.b $1E				;$B2CB8A
	RTS					;$B2CB8C

CODE_B2CB8D:
	LDA.b $00				;$B2CB8D
	BIT.w #$0003				;$B2CB8F
	BNE.b CODE_B2CBD4			;$B2CB92
	LDX.b $5C,y				;$B2CB94
	LDA.b $62,x				;$B2CB96
	BEQ.b CODE_B2CBD4			;$B2CB98
	LDA.b $58,x				;$B2CB9A
	CMP.w #$FF00				;$B2CB9C
	BMI.b CODE_B2CBD4			;$B2CB9F
	JSR.w CODE_B2CB78			;$B2CBA1
	BMI.b CODE_B2CBD4			;$B2CBA4
	LDX.b $5C,y				;$B2CBA6
	LDA.b $4E,x				;$B2CBA8
	JSR.w CODE_B2CBD5			;$B2CBAA
	LDA.b $62,x				;$B2CBAD
	CMP.w #$0101				;$B2CBAF
	BCS.b CODE_B2CBBD			;$B2CBB2
	LDA.b $1A				;$B2CBB4
	LDX.b $1C				;$B2CBB6
	JSR.w CODE_B2D0EC			;$B2CBB8
	BNE.b CODE_B2CBD4			;$B2CBBB
CODE_B2CBBD:
	LDX.b $1E				;$B2CBBD
	LDA.b $1A				;$B2CBBF
	STA.l $7EA228,x				;$B2CBC1
	LDA.b $1C				;$B2CBC5
	STA.l $7EA22A,x				;$B2CBC7
	LDX.b $20				;$B2CBCB
	LDA.w #$0514				;$B2CBCD
	STA.l $7EA248,x				;$B2CBD0
CODE_B2CBD4:
	RTS					;$B2CBD4

CODE_B2CBD5:
	AND.w #$03FF				;$B2CBD5
	LSR					;$B2CBD8
	LSR					;$B2CBD9
	LSR					;$B2CBDA
	LSR					;$B2CBDB
	LSR					;$B2CBDC
	AND.w #$FFFE				;$B2CBDD
	TAY					;$B2CBE0
	LDA.w DATA_B2CC42,y			;$B2CBE1
	AND.w #$00FF				;$B2CBE4
	BIT.w #$0080				;$B2CBE7
	BEQ.b CODE_B2CBEF			;$B2CBEA
	ORA.w #$FF00				;$B2CBEC
CODE_B2CBEF:
	CLC					;$B2CBEF
	ADC.b $12,x				;$B2CBF0
	STA.b $1A				;$B2CBF2
	LDA.w DATA_B2CC42+$01,y			;$B2CBF4
	AND.w #$00FF				;$B2CBF7
	BIT.w #$0080				;$B2CBFA
	BEQ.b CODE_B2CC02			;$B2CBFD
	ORA.w #$FF00				;$B2CBFF
CODE_B2CC02:
	CLC					;$B2CC02
	ADC.b $16,x				;$B2CC03
	STA.b $1C				;$B2CC05
	LDY.b current_sprite			;$B2CC07
	RTS					;$B2CC09

CODE_B2CC0A:
	LDX.w #$000E				;$B2CC0A
CODE_B2CC0D:
	LDA.l $7EA248,x				;$B2CC0D
	BIT.w #$00FF				;$B2CC11
	BEQ.b CODE_B2CC3D			;$B2CC14
	XBA					;$B2CC16
	AND.w #$00FF				;$B2CC17
	BEQ.b CODE_B2CC3D			;$B2CC1A
	DEC					;$B2CC1C
	BEQ.b CODE_B2CC29			;$B2CC1D
	SEP.b #$20				;$B2CC1F
	STA.l $7EA249,x				;$B2CC21
	REP.b #$20				;$B2CC25
	BRA.b CODE_B2CC3D			;$B2CC27

CODE_B2CC29:
	LDA.l $7EA248,x				;$B2CC29
	AND.w #$00FF				;$B2CC2D
	SEC					;$B2CC30
	SBC.w #$0005				;$B2CC31
	BMI.b CODE_B2CC3D			;$B2CC34
	ORA.w #$0500				;$B2CC36
	STA.l $7EA248,x				;$B2CC39
CODE_B2CC3D:
	DEX					;$B2CC3D
	DEX					;$B2CC3E
	BPL.b CODE_B2CC0D			;$B2CC3F
	RTS					;$B2CC41

DATA_B2CC42:
	db $00,$10,$F8,$10,$F1,$0D,$EE,$0A,$ED,$08,$EF,$00,$F2,$FA,$F7,$F8
	db $00,$F8,$09,$F8,$0E,$FA,$11,$00,$13,$08,$12,$0A,$0F,$0D,$08,$10

map_vehicle_main:
;$B2CC62
	JMP.w (DATA_B2CC65,x)			;$B2CC62

DATA_B2CC65:
	dw CODE_B2CC69
	dw CODE_B2CCDE

CODE_B2CC69:
	LDA.w $0024,y				;$B2CC69
	STA.w $005E,y				;$B2CC6C
	LDX.w active_kong_sprite		;$B2CC6F
	STY.b $6C,x				;$B2CC72
	LDX.w follower_kong_sprite		;$B2CC74
	STY.b $6C,x				;$B2CC77
	TYX					;$B2CC79
	INC.b $38,x				;$B2CC7A
	LDA.b [$6A]				;$B2CC7C
	INC					;$B2CC7E
	STA.b $64,x				;$B2CC7F
	INC.b $6A				;$B2CC81
	INC.b $6A				;$B2CC83
	LDA.b [$6A]				;$B2CC85
	STA.b $68,x				;$B2CC87
	INC.b $6A				;$B2CC89
	INC.b $6A				;$B2CC8B
	LDA.b [$6A]				;$B2CC8D
	STA.b $66,x				;$B2CC8F
	INC.b $6A				;$B2CC91
	INC.b $6A				;$B2CC93
	LDA.b [$6A]				;$B2CC95
	STA.b $6A,x				;$B2CC97
	LDA.w #$0006				;$B2CC99
	JSR.w CODE_B2CE6B			;$B2CC9C
	LDA.w current_boat			;$B2CC9F
	CMP.w #$0003				;$B2CCA2
	BNE.b CODE_B2CCCC			;$B2CCA5
	LDX.w active_kong_sprite		;$B2CCA7
	LDA.b $38,x				;$B2CCAA
	AND.w #$7FFF				;$B2CCAC
	CMP.w #$0009				;$B2CCAF
	BNE.b CODE_B2CCCC			;$B2CCB2
	LDA.w $001E,y				;$B2CCB4
	ORA.w #$3000				;$B2CCB7
	STA.w $001E,y				;$B2CCBA
	LDY.w #$0268				;$B2CCBD
	JSL.l CODE_BB8585			;$B2CCC0
	LDX.b alternate_sprite			;$B2CCC4
	LDA.b current_sprite			;$B2CCC6
	STA.b $5C,x				;$B2CCC8
	BRA.b CODE_B2CCDE			;$B2CCCA

CODE_B2CCCC:
	JSL.l CODE_B9E000			;$B2CCCC
	LDA.w current_boat			;$B2CCD0
	CMP.w #$0003				;$B2CCD3
	BEQ.b CODE_B2CCDB			;$B2CCD6
	JSR.w CODE_B2D284			;$B2CCD8
CODE_B2CCDB:
	JML [$04F5]				;$B2CCDB

CODE_B2CCDE:
	LDA.w #$0010				;$B2CCDE
	BIT.w $05FB				;$B2CCE1
	BEQ.b CODE_B2CCE9			;$B2CCE4
	JML [$04F5]				;$B2CCE6

CODE_B2CCE9:
	JSR.w CODE_B2D09A			;$B2CCE9
	LDX.w active_kong_sprite		;$B2CCEC
	LDA.b $38,x				;$B2CCEF
	AND.w #$7FFF				;$B2CCF1
	CMP.w #$0009				;$B2CCF4
	BNE.b CODE_B2CCCC			;$B2CCF7
	LDX.w follower_kong_sprite		;$B2CCF9
	LDA.b $38,x				;$B2CCFC
	BNE.b CODE_B2CCCC			;$B2CCFE
	JSR.w CODE_B2D219			;$B2CD00
	JSR.w CODE_B2CA5E			;$B2CD03
	JSR.w CODE_B2D379			;$B2CD06
	JSR.w CODE_B2D439			;$B2CD09
	JSR.w CODE_B2D425			;$B2CD0C
	LDA.w current_boat			;$B2CD0F
	CMP.w #$0003				;$B2CD12
	BEQ.b CODE_B2CD1A			;$B2CD15
	JSR.w CODE_B2D365			;$B2CD17
CODE_B2CD1A:
	JSR.w CODE_B2D247			;$B2CD1A
	JSR.w CODE_B2CE98			;$B2CD1D
	JSR.w CODE_B2D1FF			;$B2CD20
	LDA.w $0012,y				;$B2CD23
	STA.l $7EA222				;$B2CD26
	LDA.w $0016,y				;$B2CD2A
	STA.l $7EA224				;$B2CD2D
	JSL.l CODE_B9E000			;$B2CD31
	LDA.w current_boat			;$B2CD35
	CMP.w #$0003				;$B2CD38
	BEQ.b CODE_B2CD81			;$B2CD3B
	LDY.b current_sprite			;$B2CD3D
	LDA.w $0012,y				;$B2CD3F
	LDX.b $16,y				;$B2CD42
	JSR.w CODE_B2D0EC			;$B2CD44
	BEQ.b CODE_B2CDB4			;$B2CD47
	TYX					;$B2CD49
	BIT.w #$0020				;$B2CD4A
	BEQ.b CODE_B2CD52			;$B2CD4D
	JSR.w CODE_B2D2FF			;$B2CD4F
CODE_B2CD52:
	CMP.w #$0079				;$B2CD52
	BNE.b CODE_B2CD77			;$B2CD55
	LDY.w current_boat			;$B2CD57
	CPY.w #$0002				;$B2CD5A
	BNE.b CODE_B2CD77			;$B2CD5D
	LDY.b $60,x				;$B2CD5F
	CPY.w #$0180				;$B2CD61
	BCC.b CODE_B2CD73			;$B2CD64
	CPY.w #$0280				;$B2CD66
	BCS.b CODE_B2CD73			;$B2CD69
	LDY.w #$0200				;$B2CD6B
	STY.b $60,x				;$B2CD6E
	JSR.w CODE_B2D30A			;$B2CD70
CODE_B2CD73:
	LDY.b $6C,x				;$B2CD73
	BNE.b CODE_B2CDB4			;$B2CD75
CODE_B2CD77:
	CMP.w #$0005				;$B2CD77
	BNE.b CODE_B2CDAD			;$B2CD7A
	JSR.w CODE_B2C6EE			;$B2CD7C
	BRA.b CODE_B2CDB4			;$B2CD7F

CODE_B2CD81:
	LDY.b current_sprite			;$B2CD81
	LDA.w $0012,y				;$B2CD83
	CMP.w #$0108				;$B2CD86
	BCC.b CODE_B2CD90			;$B2CD89
	CMP.w #$0300				;$B2CD8B
	BCC.b CODE_B2CD97			;$B2CD8E
CODE_B2CD90:
	LDA.l $7EA222				;$B2CD90
	STA.w $0012,y				;$B2CD94
CODE_B2CD97:
	LDA.w $0016,y				;$B2CD97
	CMP.w #$0120				;$B2CD9A
	BCC.b CODE_B2CDA4			;$B2CD9D
	CMP.w #$02F0				;$B2CD9F
	BCC.b CODE_B2CDD3			;$B2CDA2
CODE_B2CDA4:
	LDA.l $7EA224				;$B2CDA4
	STA.w $0016,y				;$B2CDA8
	BRA.b CODE_B2CDB7			;$B2CDAB

CODE_B2CDAD:
	BIT.b $1C,x				;$B2CDAD
	BEQ.b CODE_B2CDB4			;$B2CDAF
	JSR.w CODE_B2D127			;$B2CDB1
CODE_B2CDB4:
	JSR.w CODE_B2D326			;$B2CDB4
CODE_B2CDB7:
	JSR.w CODE_B2D284			;$B2CDB7
	LDX.b current_sprite			;$B2CDBA
	LDY.w active_kong_sprite		;$B2CDBC
	JSR.w CODE_B2D1D4			;$B2CDBF
	LDY.w follower_kong_sprite		;$B2CDC2
	LDA.w $005A,y				;$B2CDC5
	BNE.b CODE_B2CDCD			;$B2CDC8
	JSR.w CODE_B2D1D4			;$B2CDCA
CODE_B2CDCD:
	JSR.w CODE_B2CE2E			;$B2CDCD
	JML [$04F5]				;$B2CDD0

CODE_B2CDD3:
	CMP.w #$0130				;$B2CDD3
	BCS.b CODE_B2CDB7			;$B2CDD6
	LDA.w $0012,y				;$B2CDD8
	CMP.w #$0120				;$B2CDDB
	BCS.b CODE_B2CDB7			;$B2CDDE
	JSR.w CODE_B2CDFC			;$B2CDE0
	BRA.b CODE_B2CDB7			;$B2CDE3

CODE_B2CDE5:
	LDA.w #$0004				;$B2CDE5
	STA.w $1C7F				;$B2CDE8
	LDX.b current_sprite			;$B2CDEB
	STZ.b $62,x				;$B2CDED
	LDA.w #$0500				;$B2CDEF
	STA.b $5C,x				;$B2CDF2
	LDA.b $18,x				;$B2CDF4
	AND.w #$7FFF				;$B2CDF6
	STA.b $18,x				;$B2CDF9
	RTS					;$B2CDFB

CODE_B2CDFC:
	REP.b #$20				;$B2CDFC
	LDA.w #$0100				;$B2CDFE
	TSB.w $1C35				;$B2CE01
	BNE.b CODE_B2CE2D			;$B2CE04
	LDA.w #$820F				;$B2CE06
	STA.w screen_brightness			;$B2CE09
	LDA.w #$0040				;$B2CE0C
	TSB.w $05FB				;$B2CE0F
	LDA.w #$0400				;$B2CE12
	TSB.w $05FD				;$B2CE15
	JSR.w CODE_B2CDE5			;$B2CE18
	LDA.w #$0148				;$B2CE1B
	STA.w $05ED				;$B2CE1E
	LDA.w #$0148				;$B2CE21
	STA.w $05EF				;$B2CE24
	LDA.w #$0016				;$B2CE27
	STA.w map_node_number			;$B2CE2A
CODE_B2CE2D:
	RTS					;$B2CE2D

CODE_B2CE2E:
	PHK					;$B2CE2E
	PLB					;$B2CE2F
	LDY.w active_kong_sprite		;$B2CE30
	LDA.w $0038,y				;$B2CE33
	CMP.w #$0009				;$B2CE36
	BNE.b CODE_B2CE6A			;$B2CE39
	LDA.w $04D6				;$B2CE3B
	BEQ.b CODE_B2CE6A			;$B2CE3E
	LDX.b current_sprite			;$B2CE40
	LDA.b $4E,x				;$B2CE42
	CMP.w #$0200				;$B2CE44
	BPL.b CODE_B2CE52			;$B2CE47
	LDA.b $1E,x				;$B2CE49
	AND.w #$BFFF				;$B2CE4B
	STA.b $1E,x				;$B2CE4E
	BRA.b CODE_B2CE59			;$B2CE50

CODE_B2CE52:
	LDA.b $1E,x				;$B2CE52
	ORA.w #$4000				;$B2CE54
	STA.b $1E,x				;$B2CE57
CODE_B2CE59:
	LDA.b $4E,x				;$B2CE59
	LSR					;$B2CE5B
	LSR					;$B2CE5C
	LSR					;$B2CE5D
	LSR					;$B2CE5E
	LSR					;$B2CE5F
	AND.w #$FFFE				;$B2CE60
	TAY					;$B2CE63
	LDA.w DATA_B2CE78,y			;$B2CE64
	JSR.w CODE_B2CE6B			;$B2CE67
CODE_B2CE6A:
	RTS					;$B2CE6A

CODE_B2CE6B:
	STA.b $50,x				;$B2CE6B
	ASL					;$B2CE6D
	ASL					;$B2CE6E
	CLC					;$B2CE6F
	ADC.b $50,x				;$B2CE70
	CLC					;$B2CE72
	ADC.b $5E,x				;$B2CE73
	STA.b $24,x				;$B2CE75
	RTS					;$B2CE77

DATA_B2CE78:
	dw $0000,$0001,$0002,$0003,$0004,$0005,$0006,$0007
	dw $0008,$0007,$0006,$0005,$0004,$0003,$0002,$0001

CODE_B2CE98:
	LDA.w current_boat			;$B2CE98
	CMP.w #$0003				;$B2CE9B
	BNE.b CODE_B2CF1D			;$B2CE9E
	LDX.b current_sprite			;$B2CEA0
	LDA.b $00				;$B2CEA2
	BIT.w #$0001				;$B2CEA4
	BNE.b CODE_B2CEB6			;$B2CEA7
	SEP.b #$20				;$B2CEA9
	LDA.b $41,x				;$B2CEAB
	DEC					;$B2CEAD
	CMP.b #$C0				;$B2CEAE
	BMI.b CODE_B2CEB4			;$B2CEB0
	STA.b $41,x				;$B2CEB2
CODE_B2CEB4:
	REP.b #$20				;$B2CEB4
CODE_B2CEB6:
	LDA.w #$0040				;$B2CEB6
	BIT.w $05FB				;$B2CEB9
	BEQ.b CODE_B2CEE2			;$B2CEBC
	SEP.b #$20				;$B2CEBE
	LDA.b #$00				;$B2CEC0
	STA.b $62,x				;$B2CEC2
	LDA.b $41,x				;$B2CEC4
	INC					;$B2CEC6
	CMP.b #$00				;$B2CEC7
	BMI.b CODE_B2CEDD			;$B2CEC9
	REP.b #$20				;$B2CECB
	LDA.w #$0100				;$B2CECD
	TSB.w $1C35				;$B2CED0
	BNE.b CODE_B2CF1D			;$B2CED3
	LDA.w #$820F				;$B2CED5
	STA.w screen_brightness			;$B2CED8
	BRA.b CODE_B2CF1D			;$B2CEDB

CODE_B2CEDD:
	STA.b $41,x				;$B2CEDD
	REP.b #$20				;$B2CEDF
	RTS					;$B2CEE1

CODE_B2CEE2:
	LDY.b current_sprite			;$B2CEE2
	JSR.w CODE_B2CF60			;$B2CEE4
	BCC.b CODE_B2CF3A			;$B2CEE7
	LDA.w $04DA				;$B2CEE9
	BIT.w #$9000				;$B2CEEC
	BEQ.b CODE_B2CF1E			;$B2CEEF
	LDY.w active_kong_sprite		;$B2CEF1
	LDX.b $18,y				;$B2CEF4
	JSL.l CODE_BB85E8			;$B2CEF6
	LDA.w #$1D93				;$B2CEFA
	STA.w $0541				;$B2CEFD
	LDX.b current_sprite			;$B2CF00
	LDA.w map_node_number			;$B2CF02
	JSL.l CODE_B48018			;$B2CF05
	LDA.w #$0040				;$B2CF09
	TSB.w $05FB				;$B2CF0C
	JSR.w CODE_B2CDE5			;$B2CF0F
	LDA.w map_node_number			;$B2CF12
	CMP.w #$0002				;$B2CF15
	BNE.b CODE_B2CF1D			;$B2CF18
	STZ.w $05ED				;$B2CF1A
CODE_B2CF1D:
	RTS					;$B2CF1D

CODE_B2CF1E:
	LDX.w active_kong_sprite		;$B2CF1E
	LDA.b $18,x				;$B2CF21
	BNE.b CODE_B2CF37			;$B2CF23
	LDY.w map_node_number			;$B2CF25
	LDA.w DATA_B2CF4B,y			;$B2CF28
	AND.w #$00FF				;$B2CF2B
	STA.b $1A,x				;$B2CF2E
	LDA.w map_node_number			;$B2CF30
	JSL.l CODE_B4801B			;$B2CF33
CODE_B2CF37:
	LDX.b current_sprite			;$B2CF37
	RTS					;$B2CF39

CODE_B2CF3A:
	LDX.w active_kong_sprite		;$B2CF3A
	LDY.b $18,x				;$B2CF3D
	BEQ.b CODE_B2CF37			;$B2CF3F
	LDA.w #$0001				;$B2CF41
	STA.w $006C,y				;$B2CF44
	STZ.b $18,x				;$B2CF47
	BRA.b CODE_B2CF37			;$B2CF49

DATA_B2CF4B:
	db $00,$03,$4F,$4B,$43,$44,$4C,$45,$46,$4D,$47,$4E,$48,$49,$4A,$50
	db $51,$52,$53,$54,$55

CODE_B2CF60:
	LDA.w #$0001				;$B2CF60
	STA.b $1A				;$B2CF63
CODE_B2CF65:
	LDA.b $1A				;$B2CF65
	ASL					;$B2CF67
	ASL					;$B2CF68
	ASL					;$B2CF69
	CLC					;$B2CF6A
	ADC.b $1A				;$B2CF6B
	ADC.b $1A				;$B2CF6D
	ADC.b $1A				;$B2CF6F
	ADC.w #DATA_B4D092			;$B2CF71
	TAX					;$B2CF74
	LDA.l (DATA_B4D092&$FF0000)+$02,x	;$B2CF75
	STA.w $05ED				;$B2CF79
	SEC					;$B2CF7C
	SBC.w #$0010				;$B2CF7D
	CMP.w $0012,y				;$B2CF80
	BCS.b CODE_B2CFAD			;$B2CF83
	CLC					;$B2CF85
	ADC.w #$0020				;$B2CF86
	CMP.w $0012,y				;$B2CF89
	BCC.b CODE_B2CFAD			;$B2CF8C
	LDA.l (DATA_B4D092&$FF0000)+$04,x	;$B2CF8E
	STA.w $05EF				;$B2CF92
	SEC					;$B2CF95
	SBC.w #$0020				;$B2CF96
	CMP.w $0016,y				;$B2CF99
	BCS.b CODE_B2CFAD			;$B2CF9C
	CLC					;$B2CF9E
	ADC.w #$0020				;$B2CF9F
	CMP.w $0016,y				;$B2CFA2
	BCC.b CODE_B2CFAD			;$B2CFA5
	LDA.b $1A				;$B2CFA7
	STA.w map_node_number			;$B2CFA9
	RTS					;$B2CFAC

CODE_B2CFAD:
	INC.b $1A				;$B2CFAD
	LDA.b $1A				;$B2CFAF
	CMP.w #$0015				;$B2CFB1
	BCC.b CODE_B2CF65			;$B2CFB4
	CLC					;$B2CFB6
	RTS					;$B2CFB7

gyrocopter_blades_and_shadow_main:
;$B2CFB8
	LDX.b $5C,y				;$B2CFB8
	JSR.w CODE_B2CFE9			;$B2CFBA
	LDA.b $1E,x				;$B2CFBD
	EOR.w $001E,y				;$B2CFBF
	AND.w #$3000				;$B2CFC2
	EOR.w $001E,y				;$B2CFC5
	STA.w $001E,y				;$B2CFC8
	LDA.b $4E,x				;$B2CFCB
	JSR.w CODE_B2D045			;$B2CFCD
	LDA.b $58,x				;$B2CFD0
	STA.w $0058,y				;$B2CFD2
	LDA.b $1A				;$B2CFD5
	STA.w $0012,y				;$B2CFD7
	LDA.b $1C				;$B2CFDA
	STA.w $0016,y				;$B2CFDC
	JSL.l process_anim_preserve_state	;$B2CFDF
	JSR.w CODE_B2D00B			;$B2CFE3
	JML [$04F5]				;$B2CFE6

CODE_B2CFE9:
	LDA.w #$3000				;$B2CFE9
	STA.b $3E				;$B2CFEC
	LDA.b $12,x				;$B2CFEE
	CMP.w #$01B0				;$B2CFF0
	BCS.b CODE_B2D001			;$B2CFF3
	LDA.b $16,x				;$B2CFF5
	CMP.w #$019C				;$B2CFF7
	BCS.b CODE_B2D001			;$B2CFFA
	LDA.w #$2000				;$B2CFFC
	STA.b $3E				;$B2CFFF
CODE_B2D001:
	LDA.b $1E,x				;$B2D001
	AND.w #$CFFF				;$B2D003
	ORA.b $3E				;$B2D006
	STA.b $1E,x				;$B2D008
	RTS					;$B2D00A

CODE_B2D00B:
	LDY.b $5C,x				;$B2D00B
	LDA.w $001E,y				;$B2D00D
	AND.w #$3000				;$B2D010
	ORA.w #$07EC				;$B2D013
	STA.b $3E				;$B2D016
	LDA.w $0016,y				;$B2D018
	LDX.b $12,y				;$B2D01B
	JSL.l CODE_B7801B			;$B2D01D
	BCS.b CODE_B2D044			;$B2D021
	LDA.w #$8078				;$B2D023
	JSL.l CODE_B78021			;$B2D026
	BCS.b CODE_B2D044			;$B2D02A
	STA.b $00,x				;$B2D02C
	LDY.b $3E				;$B2D02E
	LDA.b $00				;$B2D030
	BIT.w #$0001				;$B2D032
	BNE.b CODE_B2D039			;$B2D035
	INY					;$B2D037
	INY					;$B2D038
CODE_B2D039:
	STY.b $02,x				;$B2D039
	JSR.w CODE_B2E329			;$B2D03B
	INX					;$B2D03E
	INX					;$B2D03F
	INX					;$B2D040
	INX					;$B2D041
	STX.b next_oam_slot			;$B2D042
CODE_B2D044:
	RTS					;$B2D044

CODE_B2D045:
	AND.w #$03FF				;$B2D045
	LSR					;$B2D048
	LSR					;$B2D049
	LSR					;$B2D04A
	LSR					;$B2D04B
	LSR					;$B2D04C
	AND.w #$FFFE				;$B2D04D
	TAY					;$B2D050
	LDA.w DATA_B2D07A,y			;$B2D051
	AND.w #$00FF				;$B2D054
	BIT.w #$0080				;$B2D057
	BEQ.b CODE_B2D05F			;$B2D05A
	ORA.w #$FF00				;$B2D05C
CODE_B2D05F:
	CLC					;$B2D05F
	ADC.b $12,x				;$B2D060
	STA.b $1A				;$B2D062
	LDA.w DATA_B2D07A+$01,y			;$B2D064
	AND.w #$00FF				;$B2D067
	BIT.w #$0080				;$B2D06A
	BEQ.b CODE_B2D072			;$B2D06D
	ORA.w #$FF00				;$B2D06F
CODE_B2D072:
	CLC					;$B2D072
	ADC.b $16,x				;$B2D073
	STA.b $1C				;$B2D075
	LDY.b current_sprite			;$B2D077
	RTS					;$B2D079

DATA_B2D07A:
	db $00,$02,$FC,$03,$F7,$02,$F4,$FF,$F3,$FD,$F4,$FD,$F7,$FB,$FB,$FA
	db $00,$F9,$05,$FA,$09,$FB,$0C,$FD,$0D,$FD,$0C,$FF,$09,$02,$05,$03

CODE_B2D09A:
	LDA.b $00				;$B2D09A
	INC					;$B2D09C
	BIT.w #$0007				;$B2D09D
	BNE.b CODE_B2D0EB			;$B2D0A0
	LDA.w $1C7F				;$B2D0A2
	BEQ.b CODE_B2D0EB			;$B2D0A5
	BMI.b CODE_B2D0B9			;$B2D0A7
	DEC					;$B2D0A9
	BEQ.b CODE_B2D0C9			;$B2D0AA
	STA.w $1C7F				;$B2D0AC
	LDA.w #$0032				;$B2D0AF
	JSL.l CODE_B2801E			;$B2D0B2
	LDY.b current_sprite			;$B2D0B6
	RTS					;$B2D0B8

CODE_B2D0B9:
	INC					;$B2D0B9
	BEQ.b CODE_B2D0C9			;$B2D0BA
	STA.w $1C7F				;$B2D0BC
	LDA.w #$00C8				;$B2D0BF
	JSL.l CODE_B2801E			;$B2D0C2
	LDY.b current_sprite			;$B2D0C6
	RTS					;$B2D0C8

CODE_B2D0C9:
	LDA.w $005C,y				;$B2D0C9
	BMI.b CODE_B2D0E0			;$B2D0CC
	BEQ.b CODE_B2D0EB			;$B2D0CE
	ORA.w #$8000				;$B2D0D0
	STA.w $005C,y				;$B2D0D3
	LDA.w #$0001				;$B2D0D6
	JSL.l CODE_B28021			;$B2D0D9
	LDY.b current_sprite			;$B2D0DD
	RTS					;$B2D0DF

CODE_B2D0E0:
	AND.w #$7FFF				;$B2D0E0
	JSL.l CODE_B28018			;$B2D0E3
	TDC					;$B2D0E7
	STA.w $005C,y				;$B2D0E8
CODE_B2D0EB:
	RTS					;$B2D0EB

CODE_B2D0EC:
	SEC					;$B2D0EC
	SBC.w #$0100				;$B2D0ED
	LSR					;$B2D0F0
	LSR					;$B2D0F1
	LSR					;$B2D0F2
	STA.b $3E				;$B2D0F3
	TXA					;$B2D0F5
	SEC					;$B2D0F6
	SBC.w #$0100				;$B2D0F7
	AND.w #$FFF8				;$B2D0FA
	ASL					;$B2D0FD
	ASL					;$B2D0FE
	ASL					;$B2D0FF
	CLC					;$B2D100
	ADC.b $3E				;$B2D101
	TAX					;$B2D103
	LDA.l $7E82E8,x				;$B2D104
	AND.w #$00FF				;$B2D108
	RTS					;$B2D10B

CODE_B2D10C:
	SEC					;$B2D10C
	SBC.w $0052,y				;$B2D10D
	LSR					;$B2D110
	LSR					;$B2D111
	LSR					;$B2D112
	STA.b $3E				;$B2D113
	TXA					;$B2D115
	AND.w #$FFF8				;$B2D116
	ASL					;$B2D119
	ASL					;$B2D11A
	CLC					;$B2D11B
	ADC.b $3E				;$B2D11C
	TAX					;$B2D11E
	LDA.l $7E82E8,x				;$B2D11F
	AND.w #$00FF				;$B2D123
	RTS					;$B2D126

CODE_B2D127:
	LDY.b $62,x				;$B2D127
	CPY.w #$0030				;$B2D129
	BCS.b CODE_B2D135			;$B2D12C
	LDA.b $4E,x				;$B2D12E
	STA.b $60,x				;$B2D130
	BRL.w CODE_B2D1B1			;$B2D132

CODE_B2D135:
	LDY.b $60,x				;$B2D135
	STY.b $24				;$B2D137
	AND.w #$0007				;$B2D139
	CMP.w #$0001				;$B2D13C
	BEQ.b CODE_B2D167			;$B2D13F
	CMP.w #$0002				;$B2D141
	BEQ.b CODE_B2D17E			;$B2D144
	CMP.w #$0003				;$B2D146
	BEQ.b CODE_B2D19C			;$B2D149
	CMP.w #$0004				;$B2D14B
	BNE.b CODE_B2D1B1			;$B2D14E
	LDA.w #$0100				;$B2D150
	SEC					;$B2D153
	SBC.b $60,x				;$B2D154
	AND.w #$03FF				;$B2D156
	CMP.w #$0080				;$B2D159
	BEQ.b CODE_B2D192			;$B2D15C
	CMP.w #$0280				;$B2D15E
	BEQ.b CODE_B2D192			;$B2D161
	STA.b $60,x				;$B2D163
	BRA.b CODE_B2D1B1			;$B2D165

CODE_B2D167:
	LDA.w #$0200				;$B2D167
	SEC					;$B2D16A
	SBC.b $60,x				;$B2D16B
	AND.w #$03FF				;$B2D16D
	CMP.w #$0100				;$B2D170
	BEQ.b CODE_B2D192			;$B2D173
	CMP.w #$0300				;$B2D175
	BEQ.b CODE_B2D192			;$B2D178
	STA.b $60,x				;$B2D17A
	BRA.b CODE_B2D1B1			;$B2D17C

CODE_B2D17E:
	LDA.w #$0400				;$B2D17E
	SEC					;$B2D181
	SBC.b $60,x				;$B2D182
	AND.w #$03FF				;$B2D184
	BEQ.b CODE_B2D192			;$B2D187
	CMP.w #$0200				;$B2D189
	BEQ.b CODE_B2D192			;$B2D18C
	STA.b $60,x				;$B2D18E
	BRA.b CODE_B2D1B1			;$B2D190

CODE_B2D192:
	LDA.b $60,x				;$B2D192
	SEC					;$B2D194
	SBC.w #$0040				;$B2D195
	STA.b $60,x				;$B2D198
	BRA.b CODE_B2D1C7			;$B2D19A

CODE_B2D19C:
	LDA.w #$0300				;$B2D19C
	SEC					;$B2D19F
	SBC.b $60,x				;$B2D1A0
	AND.w #$03FF				;$B2D1A2
	CMP.w #$0180				;$B2D1A5
	BEQ.b CODE_B2D192			;$B2D1A8
	CMP.w #$0380				;$B2D1AA
	BEQ.b CODE_B2D192			;$B2D1AD
	STA.b $60,x				;$B2D1AF
CODE_B2D1B1:
	LDA.b $62,x				;$B2D1B1
	CMP.w #$8000				;$B2D1B3
	ROR					;$B2D1B6
	LDY.w current_boat			;$B2D1B7
	BEQ.b CODE_B2D1C0			;$B2D1BA
	CMP.w #$8000				;$B2D1BC
	ROR					;$B2D1BF
CODE_B2D1C0:
	STA.b $62,x				;$B2D1C0
	LDA.w #$0010				;$B2D1C2
	STA.b $4C,x				;$B2D1C5
CODE_B2D1C7:
	LDA.l $7EA222				;$B2D1C7
	STA.b $12,x				;$B2D1CB
	LDA.l $7EA224				;$B2D1CD
	STA.b $16,x				;$B2D1D1
	RTS					;$B2D1D3

CODE_B2D1D4:
	LDA.b $12,x				;$B2D1D4
	STA.w $0012,y				;$B2D1D6
	LDA.b $16,x				;$B2D1D9
	STA.w $0016,y				;$B2D1DB
	LDA.b $58,x				;$B2D1DE
	STA.w $0058,y				;$B2D1E0
	RTS					;$B2D1E3

CODE_B2D1E4:
	LDY.w active_kong_sprite		;$B2D1E4
	LDA.w $0038,y				;$B2D1E7
	CMP.w #$0009				;$B2D1EA
	BNE.b CODE_B2D1FE			;$B2D1ED
	LDY.w #$0218				;$B2D1EF
	JSL.l CODE_BB85B8			;$B2D1F2
	LDY.b current_sprite			;$B2D1F6
	BCS.b CODE_B2D1FE			;$B2D1F8
	LDX.b alternate_sprite			;$B2D1FA
	STY.b $5C,x				;$B2D1FC
CODE_B2D1FE:
	RTS					;$B2D1FE

CODE_B2D1FF:
	LDY.b current_sprite			;$B2D1FF
	LDA.w $0060,y				;$B2D201
	AND.w #$03FF				;$B2D204
	TAX					;$B2D207
	LDA.w $0062,y				;$B2D208
	JSL.l CODE_808036			;$B2D20B
	STX.b $2A,y				;$B2D20F
	EOR.w #$FFFF				;$B2D211
	INC					;$B2D214
	STA.w $002E,y				;$B2D215
	RTS					;$B2D218

CODE_B2D219:
	LDY.b current_sprite			;$B2D219
	LDA.w current_boat			;$B2D21B
	CMP.w #$0003				;$B2D21E
	BEQ.b CODE_B2D237			;$B2D221
	TYX					;$B2D223
	LDA.b $62,x				;$B2D224
	BNE.b CODE_B2D23E			;$B2D226
	LDA.b $3E,x				;$B2D228
	BEQ.b CODE_B2D238			;$B2D22A
	DEC.b $3E,x				;$B2D22C
	BNE.b CODE_B2D237			;$B2D22E
	LDX.w $1C8F				;$B2D230
	BEQ.b CODE_B2D237			;$B2D233
	STY.b $5E,x				;$B2D235
CODE_B2D237:
	RTS					;$B2D237

CODE_B2D238:
	LDA.w #$0020				;$B2D238
	STA.b $3E,x				;$B2D23B
	RTS					;$B2D23D

CODE_B2D23E:
	LDA.w $1C8F				;$B2D23E
	BNE.b CODE_B2D237			;$B2D241
	JSR.w CODE_B2D1E4			;$B2D243
	RTS					;$B2D246

CODE_B2D247:
	LDX.b current_sprite			;$B2D247
	LDA.b $00				;$B2D249
	BIT.w #$0003				;$B2D24B
	BEQ.b CODE_B2D255			;$B2D24E
	LDA.b $62,x				;$B2D250
	BNE.b CODE_B2D268			;$B2D252
	RTS					;$B2D254

CODE_B2D255:
	LDA.b $62,x				;$B2D255
	LSR					;$B2D257
	LSR					;$B2D258
	LSR					;$B2D259
	LSR					;$B2D25A
	SBC.w #$0020				;$B2D25B
	AND.w #$00FF				;$B2D25E
	JSL.l CODE_B28021			;$B2D261
	LDX.b current_sprite			;$B2D265
	RTS					;$B2D267

CODE_B2D268:
	LDY.b $18,x				;$B2D268
	BMI.b CODE_B2D283			;$B2D26A
	LDA.w $1C35				;$B2D26C
	BIT.w #$0100				;$B2D26F
	BNE.b CODE_B2D283			;$B2D272
	STY.b $5C,x				;$B2D274
	LDA.w #$FFFC				;$B2D276
	STA.w $1C7F				;$B2D279
	LDA.b $18,x				;$B2D27C
	ORA.w #$8000				;$B2D27E
	STA.b $18,x				;$B2D281
CODE_B2D283:
	RTS					;$B2D283

CODE_B2D284:
	LDY.b current_sprite			;$B2D284
	LDA.w $0062,y				;$B2D286
	CMP.w #$0040				;$B2D289
	BCS.b CODE_B2D2B9			;$B2D28C
	LDA.b $00				;$B2D28E
	BIT.w #$0003				;$B2D290
	BNE.b CODE_B2D2A9			;$B2D293
	LSR					;$B2D295
	AND.w #$000F				;$B2D296
	TAX					;$B2D299
	LDA.w current_boat			;$B2D29A
	CMP.w #$0003				;$B2D29D
	BEQ.b CODE_B2D2AA			;$B2D2A0
	LDA.l DATA_B2D2DF,x			;$B2D2A2
CODE_B2D2A6:
	STA.w $0058,y				;$B2D2A6
CODE_B2D2A9:
	RTS					;$B2D2A9

CODE_B2D2AA:
	JSR.w CODE_B2D2C6			;$B2D2AA
	CLC					;$B2D2AD
	ADC.l DATA_B2D2EF,x			;$B2D2AE
	BMI.b CODE_B2D2A6			;$B2D2B2
	LDA.w #$0000				;$B2D2B4
	BRA.b CODE_B2D2A6			;$B2D2B7

CODE_B2D2B9:
	LDA.w current_boat			;$B2D2B9
	CMP.w #$0003				;$B2D2BC
	BNE.b CODE_B2D2A9			;$B2D2BF
	JSR.w CODE_B2D2C6			;$B2D2C1
	BRA.b CODE_B2D2A6			;$B2D2C4

CODE_B2D2C6:
	LDA.w #$01C0				;$B2D2C6
	SEC					;$B2D2C9
	SBC.w $0016,y				;$B2D2CA
	BMI.b CODE_B2D2DA			;$B2D2CD
	XBA					;$B2D2CF
	LSR					;$B2D2D0
	LSR					;$B2D2D1
	AND.w #$FF00				;$B2D2D2
	CLC					;$B2D2D5
	ADC.w $0040,y				;$B2D2D6
	RTS					;$B2D2D9

CODE_B2D2DA:
	LDA.w $0040,y				;$B2D2DA
	BRA.b CODE_B2D2A6			;$B2D2DD

DATA_B2D2DF:
	dw $FF00,$FF00,$FF00,$FF00,$0000,$0000,$0000,$0000

DATA_B2D2EF:
	dw $FF00,$FF01,$FE01,$FD01,$FD00,$FD00,$FE00,$FF00

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
	LDY.w current_boat			;$B2D313
	CPY.w #$0002				;$B2D316
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
	dw $FF00,$FF00,$FE00,$FD00,$FD00,$FE00,$FF00,$FF00

CODE_B2D365:
	LDA.w #$0100				;$B2D365
	BIT.w $1C35				;$B2D368
	BNE.b CODE_B2D378			;$B2D36B
	LDA.w $04DA				;$B2D36D
	BIT.w #$8080				;$B2D370
	BEQ.b CODE_B2D378			;$B2D373
	JSR.w CODE_B2C6B7			;$B2D375
CODE_B2D378:
	RTS					;$B2D378

CODE_B2D379:
	LDX.b current_sprite			;$B2D379
	LDA.b $6C,x				;$B2D37B
	BNE.b CODE_B2D3D4			;$B2D37D
	LDA.w #$1000				;$B2D37F
	BIT.w $05FD				;$B2D382
	BNE.b CODE_B2D38F			;$B2D385
	LDA.w screen_brightness			;$B2D387
	BIT.w #$FF00				;$B2D38A
	BNE.b CODE_B2D397			;$B2D38D
CODE_B2D38F:
	LDA.w $04D6				;$B2D38F
	AND.w #$0F00				;$B2D392
	BNE.b CODE_B2D39B			;$B2D395
CODE_B2D397:
	JSR.w CODE_B2D50E			;$B2D397
	RTS					;$B2D39A

CODE_B2D39B:
	BIT.w #$0800				;$B2D39B
	BEQ.b CODE_B2D3A3			;$B2D39E
	AND.w #$FBFF				;$B2D3A0
CODE_B2D3A3:
	BIT.w #$0100				;$B2D3A3
	BEQ.b CODE_B2D3AB			;$B2D3A6
	AND.w #$FDFF				;$B2D3A8
CODE_B2D3AB:
	XBA					;$B2D3AB
	ASL					;$B2D3AC
	TAY					;$B2D3AD
	LDA.w DATA_B2D4C5-$02,y			;$B2D3AE
	STA.w $1C81				;$B2D3B1
	STA.b $24				;$B2D3B4
	CLC					;$B2D3B6
	ADC.w #$0200				;$B2D3B7
	AND.w #$03FF				;$B2D3BA
	STA.b $26				;$B2D3BD
	JSR.w CODE_B2D4D9			;$B2D3BF
	LDA.b $68,x				;$B2D3C2
	STA.b $28				;$B2D3C4
	JSR.w CODE_B2D3D9			;$B2D3C6
	BEQ.b CODE_B2D3D4			;$B2D3C9
	BCC.b CODE_B2D3D5			;$B2D3CB
	SBC.b $28				;$B2D3CD
CODE_B2D3CF:
	AND.w #$03FF				;$B2D3CF
	STA.b $60,x				;$B2D3D2
CODE_B2D3D4:
	RTS					;$B2D3D4

CODE_B2D3D5:
	ADC.b $28				;$B2D3D5
	BRA.b CODE_B2D3CF			;$B2D3D7

CODE_B2D3D9:
	LDA.w $04D6				;$B2D3D9
	AND.w #$0F00				;$B2D3DC
	BEQ.b CODE_B2D3F6			;$B2D3DF
	BIT.w #$0100				;$B2D3E1
	BEQ.b CODE_B2D3EC			;$B2D3E4
CODE_B2D3E6:
	LDA.b $60,x				;$B2D3E6
	JSR.w CODE_B2D3FE			;$B2D3E8
	RTS					;$B2D3EB

CODE_B2D3EC:
	BIT.w #$0200				;$B2D3EC
	BEQ.b CODE_B2D3F7			;$B2D3EF
CODE_B2D3F1:
	LDA.b $60,x				;$B2D3F1
	JSR.w CODE_B2D413			;$B2D3F3
CODE_B2D3F6:
	RTS					;$B2D3F6

CODE_B2D3F7:
	EOR.w #$0800				;$B2D3F7
	BEQ.b CODE_B2D3E6			;$B2D3FA
	BRA.b CODE_B2D3F1			;$B2D3FC

CODE_B2D3FE:
	CMP.b $24				;$B2D3FE
	BCC.b CODE_B2D40C			;$B2D400
	BEQ.b CODE_B2D40C			;$B2D402
	CMP.b $26				;$B2D404
	BEQ.b CODE_B2D40E			;$B2D406
	BCS.b CODE_B2D40C			;$B2D408
	SEC					;$B2D40A
	RTS					;$B2D40B

CODE_B2D40C:
	CLC					;$B2D40C
	RTS					;$B2D40D

CODE_B2D40E:
	CMP.w #$FFFF				;$B2D40E
	CLC					;$B2D411
	RTS					;$B2D412

CODE_B2D413:
	CMP.b $26				;$B2D413
	BCC.b CODE_B2D41E			;$B2D415
	BEQ.b CODE_B2D420			;$B2D417
	CMP.b $24				;$B2D419
	BCS.b CODE_B2D41E			;$B2D41B
	RTS					;$B2D41D

CODE_B2D41E:
	SEC					;$B2D41E
	RTS					;$B2D41F

CODE_B2D420:
	CMP.w #$FFFF				;$B2D420
	SEC					;$B2D423
	RTS					;$B2D424

CODE_B2D425:
	LDA.w current_boat			;$B2D425
	BNE.b CODE_B2D438			;$B2D428
	LDX.b current_sprite			;$B2D42A
	LDA.b $4C,x				;$B2D42C
	BEQ.b CODE_B2D438			;$B2D42E
	DEC.b $4C,x				;$B2D430
	BNE.b CODE_B2D438			;$B2D432
	LDA.b $4E,x				;$B2D434
	STA.b $60,x				;$B2D436
CODE_B2D438:
	RTS					;$B2D438

CODE_B2D439:
	LDA.w $04D6				;$B2D439
	BIT.w #$0F00				;$B2D43C
	BEQ.b CODE_B2D486			;$B2D43F
	LDX.b current_sprite			;$B2D441
	LDA.w $1C81				;$B2D443
	STA.b $24				;$B2D446
	CLC					;$B2D448
	ADC.w #$0200				;$B2D449
	AND.w #$03FF				;$B2D44C
	STA.b $26				;$B2D44F
	LDA.b $68,x				;$B2D451
	LDY.w current_boat			;$B2D453
	BEQ.b CODE_B2D459			;$B2D456
	ASL					;$B2D458
CODE_B2D459:
	STA.b $28				;$B2D459
	JSR.w CODE_B2D49B			;$B2D45B
	BEQ.b CODE_B2D486			;$B2D45E
	BCC.b CODE_B2D487			;$B2D460
	SBC.b $28				;$B2D462
CODE_B2D464:
	AND.w #$03FF				;$B2D464
	LDY.w current_boat			;$B2D467
	CPY.w #$0003				;$B2D46A
	BEQ.b CODE_B2D482			;$B2D46D
	STA.b $1E				;$B2D46F
	JSR.w CODE_B2CBD5			;$B2D471
	LDA.b $1A				;$B2D474
	LDX.b $1C				;$B2D476
	JSR.w CODE_B2D0EC			;$B2D478
	BIT.w #$0080				;$B2D47B
	BNE.b CODE_B2D48B			;$B2D47E
	LDA.b $1E				;$B2D480
CODE_B2D482:
	LDX.b current_sprite			;$B2D482
	STA.b $4E,x				;$B2D484
CODE_B2D486:
	RTS					;$B2D486

CODE_B2D487:
	ADC.b $28				;$B2D487
	BRA.b CODE_B2D464			;$B2D489

CODE_B2D48B:
	LDX.b current_sprite			;$B2D48B
	LDA.b $4E,x				;$B2D48D
	CLC					;$B2D48F
	ADC.w #$0020				;$B2D490
	STA.b $60,x				;$B2D493
	LDA.w #$0010				;$B2D495
	STA.b $4C,x				;$B2D498
	RTS					;$B2D49A

CODE_B2D49B:
	LDA.w $1C81				;$B2D49B
	CMP.w #$0001				;$B2D49E
	BCC.b CODE_B2D4AE			;$B2D4A1
	CMP.w #$0200				;$B2D4A3
	BCS.b CODE_B2D4AE			;$B2D4A6
CODE_B2D4A8:
	LDA.b $4E,x				;$B2D4A8
	JSR.w CODE_B2D3FE			;$B2D4AA
	RTS					;$B2D4AD

CODE_B2D4AE:
	CMP.w #$0201				;$B2D4AE
	BCC.b CODE_B2D4B9			;$B2D4B1
CODE_B2D4B3:
	LDA.b $4E,x				;$B2D4B3
	JSR.w CODE_B2D413			;$B2D4B5
	RTS					;$B2D4B8

CODE_B2D4B9:
	CMP.w #$0101				;$B2D4B9
	BCC.b CODE_B2D4A8			;$B2D4BC
	CMP.w #$0300				;$B2D4BE
	BCS.b CODE_B2D4A8			;$B2D4C1
	BRA.b CODE_B2D4B3			;$B2D4C3

DATA_B2D4C5:
	dw $0100,$0300,$0000,$0200,$0180,$0280,$0000,$0000
	dw $0080,$0380

CODE_B2D4D9:
	LDA.b $60,x				;$B2D4D9
	SEC					;$B2D4DB
	SBC.b $26				;$B2D4DC
	JSR.w CODE_B2D51D			;$B2D4DE
	CMP.w #$00D0				;$B2D4E1
	BMI.b CODE_B2D50E			;$B2D4E4
	LDY.b $6A,x				;$B2D4E6
	LDA.w $04D6				;$B2D4E8
	BIT.w #$4000				;$B2D4EB
	BNE.b CODE_B2D500			;$B2D4EE
	LDA.b $64,x				;$B2D4F0
	CMP.b $62,x				;$B2D4F2
	BPL.b CODE_B2D4FF			;$B2D4F4
	LDA.b $62,x				;$B2D4F6
	SEC					;$B2D4F8
	SBC.b $66,x				;$B2D4F9
	STA.b $62,x				;$B2D4FB
	BRA.b CODE_B2D50D			;$B2D4FD

CODE_B2D4FF:
	TAY					;$B2D4FF
CODE_B2D500:
	STY.b $28				;$B2D500
	LDA.b $62,x				;$B2D502
	CLC					;$B2D504
	ADC.b $66,x				;$B2D505
	CMP.b $28				;$B2D507
	BPL.b CODE_B2D50D			;$B2D509
	STA.b $62,x				;$B2D50B
CODE_B2D50D:
	RTS					;$B2D50D

CODE_B2D50E:
	LDA.b $62,x				;$B2D50E
	SEC					;$B2D510
	SBC.b $66,x				;$B2D511
	BPL.b CODE_B2D51A			;$B2D513
	LDA.b $4E,x				;$B2D515
	STA.b $60,x				;$B2D517
	TDC					;$B2D519
CODE_B2D51A:
	STA.b $62,x				;$B2D51A
	RTS					;$B2D51C

CODE_B2D51D:
	TAY					;$B2D51D
	CMP.w #$0300				;$B2D51E
	BPL.b CODE_B2D52B			;$B2D521
	TYA					;$B2D523
	BPL.b CODE_B2D52A			;$B2D524
	EOR.w #$FFFF				;$B2D526
	INC					;$B2D529
CODE_B2D52A:
	RTS					;$B2D52A

CODE_B2D52B:
	TDC					;$B2D52B
	RTS					;$B2D52C

game_over_blocks_main:
;$B2D52D
	JMP.w (DATA_B2D530,x)			;$B2D52D

DATA_B2D530:
	dw CODE_B2D538
	dw CODE_B2D558
	dw CODE_B2D575
	dw CODE_B2D5DF

CODE_B2D538:
	LDA.b $00				;$B2D538
	STA.w $1C37				;$B2D53A
	LDA.w $1C35				;$B2D53D
	BIT.w #$4000				;$B2D540
	BEQ.b CODE_B2D5B9			;$B2D543
	TYX					;$B2D545
	INC.b $38,x				;$B2D546
	JSL.l CODE_808018			;$B2D548
	AND.w #$03FF				;$B2D54C
	ORA.w #$0100				;$B2D54F
	EOR.w #$FFFF				;$B2D552
	INC					;$B2D555
	STA.b $2E,x				;$B2D556
CODE_B2D558:
	TYX					;$B2D558
	LDA.b $2E,x				;$B2D559
	SEC					;$B2D55B
	SBC.w #$0040				;$B2D55C
	STA.b $2E,x				;$B2D55F
	LDA.b $6A,x				;$B2D561
	CMP.b $16,x				;$B2D563
	BCC.b CODE_B2D5B9			;$B2D565
	INC.b $38,x				;$B2D567
	LDA.w #$003D				;$B2D569
	STA.b $5A,x				;$B2D56C
	LDA.w #$00C3				;$B2D56E
	STA.b $6A,x				;$B2D571
	BRA.b CODE_B2D5B9			;$B2D573

CODE_B2D575:
	TYX					;$B2D575
	LDA.w $1C35				;$B2D576
	BIT.w #$8000				;$B2D579
	BNE.b CODE_B2D5C0			;$B2D57C
	LDA.w $1C63				;$B2D57E
	CMP.w #$0080				;$B2D581
	BCS.b CODE_B2D5A2			;$B2D584
	LDA.w $04DA				;$B2D586
	BIT.b $5E,x				;$B2D589
	BEQ.b CODE_B2D5A2			;$B2D58B
	LDA.w #$0080				;$B2D58D
	STA.w $1C63				;$B2D590
	LDA.b $16,x				;$B2D593
	CMP.w #$0010				;$B2D595
	BMI.b CODE_B2D5B9			;$B2D598
	LDA.b $60,x				;$B2D59A
	JSL.l CODE_B28012			;$B2D59C
	BRA.b CODE_B2D5B4			;$B2D5A0

CODE_B2D5A2:
	LDY.b $66,x				;$B2D5A2
	LDA.b [$6A],y				;$B2D5A4
	BMI.b CODE_B2D5B9			;$B2D5A6
	CLC					;$B2D5A8
	ADC.w $1C37				;$B2D5A9
	CMP.b $00				;$B2D5AC
	BNE.b CODE_B2D5B9			;$B2D5AE
	INC.b $66,x				;$B2D5B0
	INC.b $66,x				;$B2D5B2
CODE_B2D5B4:
	LDA.w #$F900				;$B2D5B4
	STA.b $2E,x				;$B2D5B7
CODE_B2D5B9:
	JSL.l CODE_B9E000			;$B2D5B9
	JML [$04F5]				;$B2D5BD

CODE_B2D5C0:
	TYX					;$B2D5C0
	INC.b $38,x				;$B2D5C1
	JSL.l CODE_808018			;$B2D5C3
	AND.w #$03FF				;$B2D5C7
	ORA.w #$0100				;$B2D5CA
	EOR.w #$FFFF				;$B2D5CD
	INC					;$B2D5D0
	STA.b $2E,x				;$B2D5D1
	LDA.w #$003D				;$B2D5D3
	STA.b $5A,x				;$B2D5D6
	LDA.w #$0440				;$B2D5D8
	STA.b $6A,x				;$B2D5DB
	BRA.b CODE_B2D5B9			;$B2D5DD

CODE_B2D5DF:
	LDA.w $0016,y				;$B2D5DF
	CMP.w #$0200				;$B2D5E2
	BCC.b CODE_B2D5EA			;$B2D5E5
	STZ.w $15E6				;$B2D5E7
CODE_B2D5EA:
	BRA.b CODE_B2D5B9			;$B2D5EA

stationary_display_sprite1_main:
;$B2D5EC
	JSL.l process_anim_preserve_state	;$B2D5EC
	JML [$04F5]				;$B2D5F0

ending_swanky_main:
;$B2D5F3
	JMP.w (DATA_B2D5F6,x)			;$B2D5F3

DATA_B2D5F6:
	dw CODE_B2D5FA
	dw CODE_B2D604

CODE_B2D5FA:
	TYX					;$B2D5FA
	INC.b $38,x				;$B2D5FB
	LDY.w #$0338				;$B2D5FD
	JSL.l CODE_BB8585			;$B2D600
moving_display_sprite_main:
CODE_B2D604:
	JSL.l CODE_B9E000			;$B2D604
	JSL.l process_anim_preserve_state	;$B2D608
	JML [$04F5]				;$B2D60C

funky_kong_main:
;$B2D60F
	JMP.w (DATA_B2D612,x)			;$B2D60F

DATA_B2D612:
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
	JSL.l process_anim_preserve_state	;$B2D624
	JML [$04F5]				;$B2D628

CODE_B2D62B:
	TYX					;$B2D62B
	LDA.w #$01B0				;$B2D62C
	STA.b $60,x				;$B2D62F
	INC.b $38,x				;$B2D631
CODE_B2D633:
	TYX					;$B2D633
	DEC.b $60,x				;$B2D634
	BNE.b CODE_B2D63A			;$B2D636
	INC.b $38,x				;$B2D638
CODE_B2D63A:
	BRA.b CODE_B2D624			;$B2D63A

CODE_B2D63C:
	LDA.w #$02D9				;$B2D63C
	JSL.l set_sprite_animation		;$B2D63F
	LDA.w #$0120				;$B2D643
	STA.b $5E,x				;$B2D646
	LDA.w #$00A0				;$B2D648
	STA.b $30,x				;$B2D64B
	STA.b $2A,x				;$B2D64D
	LDA.w #$FFFE				;$B2D64F
	STA.b $62,x				;$B2D652
	INC.b $38,x				;$B2D654
	LDY.w $18E7				;$B2D656
	LDA.b $66,x				;$B2D659
	STA.w $005C,y				;$B2D65B
CODE_B2D65E:
	LDA.w #$0012				;$B2D65E
	JSL.l CODE_B9E003			;$B2D661
	BCC.b CODE_B2D66E			;$B2D665
	LDA.w #$0150				;$B2D667
	STA.b $60,x				;$B2D66A
	INC.b $38,x				;$B2D66C
CODE_B2D66E:
	JSL.l process_anim_preserve_state	;$B2D66E
	JML [$04F5]				;$B2D672

CODE_B2D675:
	TYX					;$B2D675
	DEC.b $60,x				;$B2D676
	BNE.b CODE_B2D67C			;$B2D678
	INC.b $38,x				;$B2D67A
CODE_B2D67C:
	LDA.b $64,x				;$B2D67C
	BEQ.b CODE_B2D685			;$B2D67E
	DEC.b $64,x				;$B2D680
CODE_B2D682:
	JML [$04F5]				;$B2D682

CODE_B2D685:
	INC.b $62,x				;$B2D685
	INC.b $62,x				;$B2D687
	LDY.b $62,x				;$B2D689
	LDA.w DATA_B2D6A4,y			;$B2D68B
	BEQ.b CODE_B2D682			;$B2D68E
	LDY.w #$0028				;$B2D690
	CMP.w #$0240				;$B2D693
	BEQ.b CODE_B2D69B			;$B2D696
	LDY.w #$000C				;$B2D698
CODE_B2D69B:
	STY.b $64,x				;$B2D69B
	TAY					;$B2D69D
	JSL.l CODE_BB8585			;$B2D69E
	BRA.b CODE_B2D682			;$B2D6A2

DATA_B2D6A4:
	dw $0240,$0240,$0240,$0244,$0244,$0244,$0240,$0240
	dw $0246,$0246,$0246,$0246,$0246,$0240,$0000

CODE_B2D6C2:
	TYX					;$B2D6C2
	LDA.b $1E,x				;$B2D6C3
	EOR.w #$4000				;$B2D6C5
	STA.b $1E,x				;$B2D6C8
	LDA.w #$02DA				;$B2D6CA
	JSL.l set_sprite_animation		;$B2D6CD
	LDA.w #$00E2				;$B2D6D1
	STA.b $5E,x				;$B2D6D4
	LDA.w #$FF60				;$B2D6D6
	STA.b $30,x				;$B2D6D9
	STA.b $2A,x				;$B2D6DB
	INC.b $38,x				;$B2D6DD
CODE_B2D6DF:
	LDA.w #$0012				;$B2D6DF
	JSL.l CODE_B9E003			;$B2D6E2
	BCC.b CODE_B2D6F1			;$B2D6E6
	LDA.w #$02DB				;$B2D6E8
	JSL.l set_sprite_animation		;$B2D6EB
	STZ.b $38,x				;$B2D6EF
CODE_B2D6F1:
	JSL.l process_anim_preserve_state	;$B2D6F1
	JML [$04F5]				;$B2D6F5

CODE_B2D6F8:
	JSL.l process_anim_preserve_state	;$B2D6F8
knautilus_sprite_mask_main:
;$B2D6FC
	JSL.l CODE_B9E000			;$B2D6FC
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
	LDA $0038,y				;$B2D710   | Get active kong's state
	BNE ..return				;$B2D713   | If not, minigame is done, or kong is walking to tent
	INC $38,x				;$B2D715  /
..return:
	JMP CODE_B2E074				;$B2D717  |> Return and process animation

.state_1:
	TYX					;$B2D71A  \ Get Swanky sprite
	LDA $0543				;$B2D71B   | Check if we have prizes to give after minigame ends
	BEQ .dummy				;$B2D71E   | If not, return
	INC $38,x				;$B2D720   | Set dummy state
	LDA #$02E2				;$B2D722   |
	JSL set_sprite_animation		;$B2D725   | Set give prize animation
	LDA #$0010				;$B2D729   |
	TSB $0613				;$B2D72C  / Set some flag
.dummy:
	JMP CODE_B2E074				;$B2D72F  |> Return and process animation


brothers_bear_main:
	JMP.w (DATA_B2D735,x)			;$B2D732

DATA_B2D735:
	dw CODE_B2D739
	dw CODE_B2D780

CODE_B2D739:
	TYX					;$B2D739
	INC.b $38,x				;$B2D73A
	LDA.b $5E,x				;$B2D73C
	ASL					;$B2D73E
	TAX					;$B2D73F
	LDY.w DATA_B2D7B1,x			;$B2D740
	BEQ.b CODE_B2D77B			;$B2D743
	CPX.w #$000A				;$B2D745
	BNE.b CODE_B2D756			;$B2D748
	JSL.l CODE_BB85B5			;$B2D74A
	LDA.w #$FFFF				;$B2D74E
	STA.w $06DA				;$B2D751
	BRA.b CODE_B2D77B			;$B2D754

CODE_B2D756:
	CPX.w #$0018				;$B2D756
	BNE.b CODE_B2D770			;$B2D759
	JSL.l CODE_BB85B5			;$B2D75B
	LDA.w $0604				;$B2D75F
	AND.w #$00FF				;$B2D762
	LDY.w #$0354				;$B2D765
	CMP.w #$0005				;$B2D768
	BNE.b CODE_B2D770			;$B2D76B
	LDY.w #$0222				;$B2D76D
CODE_B2D770:
	JSL.l CODE_BB8585			;$B2D770
	LDA.b alternate_sprite			;$B2D774
	LDY.b current_sprite			;$B2D776
	STA.w $004C,y				;$B2D778
CODE_B2D77B:
	LDY.b current_sprite			;$B2D77B
	JSR.w CODE_B2D7CB			;$B2D77D
CODE_B2D780:
	LDA.w $005E,y				;$B2D780
	CMP.w #$0005				;$B2D783
	BNE.b CODE_B2D7AA			;$B2D786
	LDA.w $006A,y				;$B2D788
	BIT.w #$4000				;$B2D78B
	BEQ.b CODE_B2D7AA			;$B2D78E
	EOR.w #$4000				;$B2D790
	STA.w $006A,y				;$B2D793
	LDX.b $68,y				;$B2D796
	LDA.w #$0023				;$B2D798
	STA.b $5E,x				;$B2D79B
	LDA.w #$0330				;$B2D79D
	JSL.l set_sprite_animation		;$B2D7A0
	LDA.w #$1000				;$B2D7A4
	TSB.w $061F				;$B2D7A7
CODE_B2D7AA:
	JSL.l process_anim_preserve_state	;$B2D7AA
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
	LDA.w #$000C				;$B2D7CB
	JSL.l CODE_BB859A			;$B2D7CE
	STA.b $2E				;$B2D7D2
	LDX.w #$0000				;$B2D7D4
	LDA.w #$0000				;$B2D7D7
	STA.b $84				;$B2D7DA
	LDA.w #$0001				;$B2D7DC
	STA.b $40				;$B2D7DF
CODE_B2D7E1:
	PHX					;$B2D7E1
	LDA.w $006A,y				;$B2D7E2
	BIT.b $40				;$B2D7E5
	BEQ.b CODE_B2D81D			;$B2D7E7
	LDY.w #$0270				;$B2D7E9
	JSL.l CODE_BB85B8			;$B2D7EC
	LDX.b alternate_sprite			;$B2D7F0
	LDY.b current_sprite			;$B2D7F2
	LDA.b $24,x				;$B2D7F4
	CLC					;$B2D7F6
	ADC.b $84				;$B2D7F7
	STA.b $24,x				;$B2D7F9
	LDA.w $0012,y				;$B2D7FB
	STA.b $12,x				;$B2D7FE
	LDA.b $40				;$B2D800
	STA.b $5C,x				;$B2D802
	BIT.w #$0028				;$B2D804
	BEQ.b CODE_B2D812			;$B2D807
	LDA.b $1E,x				;$B2D809
	AND.w #$F1FF				;$B2D80B
	ORA.b $2E				;$B2D80E
	STA.b $1E,x				;$B2D810
CODE_B2D812:
	LDA.b $01,S				;$B2D812
	JSR.w CODE_B2D82F			;$B2D814
	STA.b $16,x				;$B2D817
	LDA.b $20				;$B2D819
	STA.b $12,x				;$B2D81B
CODE_B2D81D:
	ASL.b $40				;$B2D81D
	LDA.b $84				;$B2D81F
	CLC					;$B2D821
	ADC.w #$0005				;$B2D822
	STA.b $84				;$B2D825
	PLX					;$B2D827
	INX					;$B2D828
	CPX.w #$0008				;$B2D829
	BCC.b CODE_B2D7E1			;$B2D82C
	RTS					;$B2D82E

CODE_B2D82F:
	STA.b $1A				;$B2D82F
	LDA.w $005E,y				;$B2D831
	STA.b $22				;$B2D834
	ASL					;$B2D836
	TAY					;$B2D837
	LDA.w DATA_B2D861,y			;$B2D838
	AND.w #$00FF				;$B2D83B
	BNE.b CODE_B2D843			;$B2D83E
	LDA.w #$0120				;$B2D840
CODE_B2D843:
	STA.b $20				;$B2D843
	LDA.b $22				;$B2D845
	BNE.b CODE_B2D858			;$B2D847
	LDA.b $1A				;$B2D849
	CMP.w #$0003				;$B2D84B
	BNE.b CODE_B2D858			;$B2D84E
	LDA.b $20				;$B2D850
	CLC					;$B2D852
	ADC.w #$0010				;$B2D853
	STA.b $20				;$B2D856
CODE_B2D858:
	LDA.w DATA_B2D861+$01,y			;$B2D858
	AND.w #$00FF				;$B2D85B
	LDY.b current_sprite			;$B2D85E
	RTS					;$B2D860

DATA_B2D861:
	db $AD,$7E,$80,$70,$A5,$6C,$58,$7A,$78,$90,$84,$78,$2E,$74,$2E,$72
	db $AC,$7C,$80,$70,$2E,$72,$5E,$72,$80,$70,$00,$A0


brothers_bear_accessories_main:
	JMP.w (DATA_B2D880,x)			;$B2D87D

DATA_B2D880:
	dw CODE_B2D884
	dw CODE_B2D898

CODE_B2D884:
	JSR.w CODE_B2F881			;$B2D884
	LDA.b $1E,x				;$B2D887
	EOR.w $001E,y				;$B2D889
	AND.w #$4000				;$B2D88C
	EOR.w $001E,y				;$B2D88F
	STA.w $001E,y				;$B2D892
	TYX					;$B2D895
	INC.b $38,x				;$B2D896
CODE_B2D898:
	LDX.b $5C,y				;$B2D898
	LDA.b $24,x				;$B2D89A
	CLC					;$B2D89C
	ADC.w $005E,y				;$B2D89D
	STA.w $0024,y				;$B2D8A0
	JML [$04F5]				;$B2D8A3

unknown_sprite_032C_main:
;$B2D8A6
	JMP.w (DATA_B2D8A9,x)			;$B2D8A6

DATA_B2D8A9:
	dw CODE_B2D8AF
	dw CODE_B2D8CC
	dw CODE_B2D8CF

CODE_B2D8AF:
	TYX					;$B2D8AF
	INC.b $38,x				;$B2D8B0
	LDA.b $24,x				;$B2D8B2
	STA.b $60,x				;$B2D8B4
	LDA.w #$0040				;$B2D8B6
	STA.b $62,x				;$B2D8B9
	JSR.w CODE_B2F881			;$B2D8BB
	LDA.b $1E,x				;$B2D8BE
	EOR.w $001E,y				;$B2D8C0
	AND.w #$4000				;$B2D8C3
	EOR.w $001E,y				;$B2D8C6
	STA.w $001E,y				;$B2D8C9
CODE_B2D8CC:
	JML [$04F5]				;$B2D8CC

CODE_B2D8CF:
	TYX					;$B2D8CF
	LDA.b $60,x				;$B2D8D0
	CLC					;$B2D8D2
	ADC.b $5E,x				;$B2D8D3
	STA.b $24,x				;$B2D8D5
	LDA.b $5E,x				;$B2D8D7
	CLC					;$B2D8D9
	ADC.w #$0005				;$B2D8DA
	CMP.w #$0019				;$B2D8DD
	BNE.b CODE_B2D8E5			;$B2D8E0
	LDA.w #$0000				;$B2D8E2
CODE_B2D8E5:
	STA.b $5E,x				;$B2D8E5
	DEC.b $62,x				;$B2D8E7
	BNE.b CODE_B2D8F1			;$B2D8E9
	LDA.b $60,x				;$B2D8EB
	STA.b $24,x				;$B2D8ED
	DEC.b $38,x				;$B2D8EF
CODE_B2D8F1:
	JML [$04F5]				;$B2D8F1

main_map_waterfall_main:
;$B2D8F4
	JMP.w (DATA_B2D8F7,x)			;$B2D8F4

DATA_B2D8F7:
	dw CODE_B2D8FB
	dw CODE_B2D907

CODE_B2D8FB:
	LDA.w $0024,y				;$B2D8FB
	STA.w $005C,y				;$B2D8FE
	TYX					;$B2D901
	INC.b $38,x				;$B2D902
	STX.w $1C5D				;$B2D904
CODE_B2D907:
	JML [$04F5]				;$B2D907

unknown_sprite_034C_main:
;$B2D90A
	JMP.w (DATA_B2D90D,x)			;$B2D90A

DATA_B2D90D:
	dw CODE_B2D911
	dw CODE_B2D938

CODE_B2D911:
	TYX					;$B2D911
	INC.b $38,x				;$B2D912
	JSL.l CODE_808018			;$B2D914
	AND.w #$03FF				;$B2D918
	EOR.w #$FFFF				;$B2D91B
	INC					;$B2D91E
	CLC					;$B2D91F
	ADC.b $2E,x				;$B2D920
	STA.b $2E,x				;$B2D922
	STA.b $34,x				;$B2D924
	JSL.l CODE_808018			;$B2D926
	AND.w #$03FF				;$B2D92A
	EOR.w #$FFFF				;$B2D92D
	INC					;$B2D930
	CLC					;$B2D931
	ADC.b $2A,x				;$B2D932
	STA.b $2A,x				;$B2D934
	STA.b $30,x				;$B2D936
CODE_B2D938:
	JSL.l CODE_B9E000			;$B2D938
	JSL.l process_anim_preserve_state	;$B2D93C
	JML [$04F5]				;$B2D940

chairlift_pulley_main:
;$B2D943
	JMP.w (DATA_B2D946,x)			;$B2D943

DATA_B2D946:
	dw CODE_B2D94A
	dw CODE_B2D970

CODE_B2D94A:
	TYX					;$B2D94A
	INC.b $38,x				;$B2D94B
	LDA.w $1C5F				;$B2D94D
	CMP.w #$0009				;$B2D950
	BEQ.b CODE_B2D962			;$B2D953
	LDA.w #$1000				;$B2D955
	BIT.w $0629				;$B2D958
	BEQ.b CODE_B2D970			;$B2D95B
	LDA.w #$0100				;$B2D95D
	STA.b $44,x				;$B2D960
CODE_B2D962:
	LDA.w #$0564				;$B2D962
	JSL.l CODE_B28012			;$B2D965
	LDA.w #$066E				;$B2D969
	JSL.l CODE_B28012			;$B2D96C
CODE_B2D970:
	TYX					;$B2D970
	JSR.w CODE_B2D9BA			;$B2D971
	LDA.w #$1000				;$B2D974
	BIT.w $0629				;$B2D977
	BNE.b CODE_B2D9A7			;$B2D97A
	LDA.w #$2000				;$B2D97C
	BIT.w $0629				;$B2D97F
	BEQ.b CODE_B2D9A7			;$B2D982
	INC.b $44,x				;$B2D984
	LDA.b $44,x				;$B2D986
	CMP.w #$0100				;$B2D988
	BCC.b CODE_B2D9A7			;$B2D98B
	LDA.w #$2000				;$B2D98D
	TRB.w $0629				;$B2D990
	LDA.w #$1000				;$B2D993
	TSB.w $0629				;$B2D996
	LDA.w #$0564				;$B2D999
	JSL.l CODE_B28012			;$B2D99C
	LDA.w #$066E				;$B2D9A0
	JSL.l CODE_B28012			;$B2D9A3
CODE_B2D9A7:
	LDA.b $42,x				;$B2D9A7
	LSR					;$B2D9A9
	SEC					;$B2D9AA
	SBC.b $44,x				;$B2D9AB
	BEQ.b CODE_B2D9B1			;$B2D9AD
	BPL.b CODE_B2D9B3			;$B2D9AF
CODE_B2D9B1:
	INC.b $5C,x				;$B2D9B1
CODE_B2D9B3:
	JSL.l process_anim_preserve_state	;$B2D9B3
	JML [$04F5]				;$B2D9B7

CODE_B2D9BA:
	LDA.b $5C,x				;$B2D9BA
	AND.w #$0003				;$B2D9BC
	CLC					;$B2D9BF
	ADC.w #$8692				;$B2D9C0
	XBA					;$B2D9C3
	STA.b $58,x				;$B2D9C4
	LDA.b $5C,x				;$B2D9C6
	AND.w #$0004				;$B2D9C8
	LSR					;$B2D9CB
	LSR					;$B2D9CC
	ADC.w #$0008				;$B2D9CD
	XBA					;$B2D9D0
	ORA.w #$0013				;$B2D9D1
	STA.b $68,x				;$B2D9D4
	LDA.b $5C,x				;$B2D9D6
	EOR.w #$FFFF				;$B2D9D8
	INC					;$B2D9DB
	STA.b $1A				;$B2D9DC
	AND.w #$0003				;$B2D9DE
	CLC					;$B2D9E1
	ADC.w #$8692				;$B2D9E2
	XBA					;$B2D9E5
	SEC					;$B2D9E6
	SBC.w #$000F				;$B2D9E7
	STA.b $6A,x				;$B2D9EA
	LDA.b $1A				;$B2D9EC
	AND.w #$0004				;$B2D9EE
	LSR					;$B2D9F1
	LSR					;$B2D9F2
	ADC.w #$0008				;$B2D9F3
	XBA					;$B2D9F6
	ORA.w #$0013				;$B2D9F7
	STA.b $6C,x				;$B2D9FA
	RTS					;$B2D9FC

brash_cabin_digital_display_main:
;$B2D9FD
	JMP.w (DATA_B2DA00,x)			;$B2D9FD

DATA_B2DA00:
	dw CODE_B2DA04
	dw CODE_B2DA7D

CODE_B2DA04:
	TYX					;$B2DA04
	INC.b $38,x				;$B2DA05
	LDA.w #$00CC				;$B2DA07
	JSL.l CODE_BB859A			;$B2DA0A
	ORA.w #$2000				;$B2DA0E
	STA.w $005C,y				;$B2DA11
	STZ.b $00				;$B2DA14
	JSR.w CODE_B2DAF7			;$B2DA16
	LDA.w $0649				;$B2DA19
	BIT.w #$0004				;$B2DA1C
	BEQ.b CODE_B2DA7D			;$B2DA1F
	LDX.w #$0000				;$B2DA21
CODE_B2DA24:
	LDA.l DATA_B2DB1D,x			;$B2DA24
	STA.l $7EA8E9,x				;$B2DA28
	INX					;$B2DA2C
	INX					;$B2DA2D
	CPX.w #$0020				;$B2DA2E
	BCC.b CODE_B2DA24			;$B2DA31
	LDA.w #$0001				;$B2DA33
	ORA.w #$0A00				;$B2DA36
	STA.l $7EA8EF				;$B2DA39
	SEP.b #$20				;$B2DA3D
	LDA.b #$05				;$B2DA3F
	STA.l $7EA8F2				;$B2DA41
	LDA.b #$01				;$B2DA45
	STA.l $7EA8F1				;$B2DA47
	REP.b #$20				;$B2DA4B
	LDA.w $0631				;$B2DA4D
	AND.w #$000F				;$B2DA50
	ORA.w #$0A00				;$B2DA53
	STA.l $7EA902				;$B2DA56
	SEP.b #$20				;$B2DA5A
	LDA.w $0630				;$B2DA5C
	LSR					;$B2DA5F
	LSR					;$B2DA60
	LSR					;$B2DA61
	LSR					;$B2DA62
	AND.b #$0F				;$B2DA63
	STA.l $7EA904				;$B2DA65
	LDA.w $0630				;$B2DA69
	AND.b #$0F				;$B2DA6C
	STA.l $7EA905				;$B2DA6E
	LDA.w $062F				;$B2DA72
	AND.b #$0F				;$B2DA75
	STA.l $7EA907				;$B2DA77
	REP.b #$20				;$B2DA7B
CODE_B2DA7D:
	LDA.w $005C,y				;$B2DA7D
	CLC					;$B2DA80
	ADC.w #$0020				;$B2DA81
	STA.b $1A				;$B2DA84
	LDA.b $00				;$B2DA86
	AND.w #$01F8				;$B2DA88
	LSR					;$B2DA8B
	LSR					;$B2DA8C
	LSR					;$B2DA8D
	STA.b $1E				;$B2DA8E
	LDA.b $00				;$B2DA90
	AND.w #$0007				;$B2DA92
	EOR.w #$FFFF				;$B2DA95
	INC					;$B2DA98
	CLC					;$B2DA99
	ADC.w #$A820				;$B2DA9A
	XBA					;$B2DA9D
	SEP.b #$20				;$B2DA9E
	SEC					;$B2DAA0
	SBC.w $1973				;$B2DAA1
	XBA					;$B2DAA4
	REP.b #$20				;$B2DAA5
	STA.b $1C				;$B2DAA7
	LDX.w #$0000				;$B2DAA9
	LDY.b next_oam_slot			;$B2DAAC
CODE_B2DAAE:
	PHX					;$B2DAAE
	TXA					;$B2DAAF
	CLC					;$B2DAB0
	ADC.b $1E				;$B2DAB1
	TAX					;$B2DAB3
	LDA.l $7EA8DE,x				;$B2DAB4
	AND.w #$00FF				;$B2DAB8
	ORA.b $1A				;$B2DABB
	STA.w $0002,y				;$B2DABD
	LDA.b $1C				;$B2DAC0
	STA.w $0000,y				;$B2DAC2
	LDA.b $1C				;$B2DAC5
	CLC					;$B2DAC7
	ADC.w #$0008				;$B2DAC8
	STA.b $1C				;$B2DACB
	INY					;$B2DACD
	INY					;$B2DACE
	INY					;$B2DACF
	INY					;$B2DAD0
	PLX					;$B2DAD1
	INX					;$B2DAD2
	CPX.w #$0006				;$B2DAD3
	BNE.b CODE_B2DAAE			;$B2DAD6
	STY.b next_oam_slot			;$B2DAD8
	LDA.b $00				;$B2DADA
	BIT.w #$0003				;$B2DADC
	BNE.b CODE_B2DAF4			;$B2DADF
	LDA.b $00				;$B2DAE1
	AND.w #$000C				;$B2DAE3
	ASL					;$B2DAE6
	TAY					;$B2DAE7
	LDX.w #$7EA90B				;$B2DAE8
	JSR.w CODE_B2DB06			;$B2DAEB
	LDX.w #$7EA914				;$B2DAEE
	JSR.w CODE_B2DB06			;$B2DAF1
CODE_B2DAF4:
	JML [$04F5]				;$B2DAF4

CODE_B2DAF7:
	LDX.w #$0044				;$B2DAF7
CODE_B2DAFA:
	LDA.w #$0B0B				;$B2DAFA
	STA.l $7EA8DE,x				;$B2DAFD
	DEX					;$B2DB01
	DEX					;$B2DB02
	BPL.b CODE_B2DAFA			;$B2DB03
	RTS					;$B2DB05

CODE_B2DB06:
	PHY					;$B2DB06
	LDA.w #$0004				;$B2DB07
	STA.b $1A				;$B2DB0A
CODE_B2DB0C:
	LDA.w DATA_B2DB3D,y			;$B2DB0C
	STA.l $7E0000,x				;$B2DB0F
	INY					;$B2DB13
	INY					;$B2DB14
	INX					;$B2DB15
	INX					;$B2DB16
	DEC.b $1A				;$B2DB17
	BNE.b CODE_B2DB0C			;$B2DB19
	PLY					;$B2DB1B
	RTS					;$B2DB1C

DATA_B2DB1D:
	db $0D,$0E,$0F,$10,$11,$0B,$00,$0A,$00,$00,$0C,$00,$0B,$0B,$0B,$0B
	db $0B,$0B,$0B,$12,$13,$14,$15,$10,$0B,$00,$0A,$00,$00,$0C,$00,$0B

DATA_B2DB3D:
	db $1C,$1C,$0B,$0B,$1C,$0B,$16,$17,$1D,$1D,$0B,$0B,$1D,$0B,$18,$19
	db $1E,$1E,$0B,$0B,$1E,$0B,$1A,$1B,$1D,$1D,$0B,$0B,$1D,$0B,$18,$19

unknown_sprite_0338_main:
;$B2DB5D
	JMP.w (DATA_F2DB60,x)			;$B2DB5D

DATA_F2DB60:
	dw CODE_B2DB64
	dw CODE_B2DBA2

CODE_B2DB64:
	TYX					;$B2DB64
	INC.b $38,x				;$B2DB65
	LDY.w #$0350				;$B2DB67
	JSL.l CODE_BB8585			;$B2DB6A
	LDY.b current_sprite			;$B2DB6E
	LDA.w $061D				;$B2DB70
	BIT.w #$0004				;$B2DB73
	BNE.b CODE_B2DBA2			;$B2DB76
	STZ.w $1560				;$B2DB78
	STZ.w $155E				;$B2DB7B
	LDY.w #$012E				;$B2DB7E
	JSL.l CODE_BB85B8			;$B2DB81
	LDX.b alternate_sprite			;$B2DB85
	LDY.b current_sprite			;$B2DB87
	STX.b $5C,y				;$B2DB89
	STZ.b $0E,x				;$B2DB8B
	LDA.b $1E,x				;$B2DB8D
	EOR.w #$4000				;$B2DB8F
	STA.b $1E,x				;$B2DB92
	LDA.w $0012,y				;$B2DB94
	STA.b $12,x				;$B2DB97
	LDA.w $0016,y				;$B2DB99
	SEC					;$B2DB9C
	SBC.w #$0016				;$B2DB9D
	STA.b $16,x				;$B2DBA0
CODE_B2DBA2:
	TYX					;$B2DBA2
	LDY.b $5C,x				;$B2DBA3
	BEQ.b CODE_B2DBB7			;$B2DBA5
	LDA.w #$0004				;$B2DBA7
	BIT.w $061D				;$B2DBAA
	BEQ.b CODE_B2DBB7			;$B2DBAD
	LDA.w #$0007				;$B2DBAF
	STA.w $0038,y				;$B2DBB2
	STZ.b $5C,x				;$B2DBB5
CODE_B2DBB7:
	JML [$04F5]				;$B2DBB7

brambles_vase_main:
;$B2DBBA
	JMP.w (DATA_B2DBBD,x)			;$B2DBBA

DATA_B2DBBD:
	dw CODE_B2DBC1
	dw CODE_B2DBE4

CODE_B2DBC1:
	TYX					;$B2DBC1
	INC.b $38,x				;$B2DBC2
	LDY.w #$0270				;$B2DBC4
	JSL.l CODE_BB85B8			;$B2DBC7
	LDX.b alternate_sprite			;$B2DBCB
	LDA.b $24,x				;$B2DBCD
	CLC					;$B2DBCF
	ADC.w #$001E				;$B2DBD0
	STA.b $24,x				;$B2DBD3
	LDA.w #$0054				;$B2DBD5
	STA.b $12,x				;$B2DBD8
	LDA.w #$0038				;$B2DBDA
	STA.b $16,x				;$B2DBDD
	LDA.w #$0000				;$B2DBDF
	STA.b $0E,x				;$B2DBE2
CODE_B2DBE4:
	LDX.w #$00A4				;$B2DBE4
	LDA.w #$0088				;$B2DBE7
	LDY.b current_sprite			;$B2DBEA
	JSL.l CODE_B78018			;$B2DBEC
	JML [$04F5]				;$B2DBF0

razor_ridge_pipe_main:
unknown_sprite_00AC_main:
;$B2DBF3
	JMP.w (DATA_B2DBF6,x)			;$B2DBF3

DATA_B2DBF6:
	dw CODE_B2DC1E
	dw CODE_B2DBFA

CODE_B2DBFA:
	LDA.b $00				;$B2DBFA
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
	JSL.l CODE_BB8591			;$B2DC21
	BRA.b CODE_B2DC1E			;$B2DC25

unknown_sprite_00B0_main:
;$B2DC27
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

unknown_sprite_0348_main:
;$B2DC8E
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
	JSL.l CODE_B9E003			;$B2DCA0
	BCC.b CODE_B2DCB3			;$B2DCA4
	TYX					;$B2DCA6
	INC.b $38,x				;$B2DCA7
	LDA.w #$0195				;$B2DCA9
	CLC					;$B2DCAC
	ADC.b $5C,x				;$B2DCAD
	JSL.l set_sprite_animation		;$B2DCAF
CODE_B2DCB3:
	JSL.l CODE_B9E000			;$B2DCB3
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
	JSL.l CODE_B9E003			;$B2DD19
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
	STZ.w !REGISTER_SubScreenLayers		;$B2DE35
	REP.b #$20				;$B2DE38
	JML [$04F5]				;$B2DE3A

DATA_B2DE3D:
	db $55,$46,$37,$28,$19,$00

unknown_sprite_0360_main:
;$B2DE43
	LDA.w #$1000				;$B2DE43
	TRB.w $05FB				;$B2DE46
	BEQ.b CODE_B2DE95			;$B2DE49
	LDY.w #$02A8				;$B2DE4B
	JSL.l CODE_BB85B8			;$B2DE4E
	LDY.w #$02AA				;$B2DE52
	JSL.l CODE_BB85B8			;$B2DE55
	LDY.w #$02AC				;$B2DE59
	JSL.l CODE_BB85B8			;$B2DE5C
	LDY.w #$02AE				;$B2DE60
	JSL.l CODE_BB85B8			;$B2DE63
	LDY.w #$02B2				;$B2DE67
	JSL.l CODE_BB85B8			;$B2DE6A
	LDY.w #$02B4				;$B2DE6E
	JSL.l CODE_BB85B8			;$B2DE71
	LDY.w #$02B6				;$B2DE75
	JSL.l CODE_BB85B8			;$B2DE78
	LDY.w #$02B8				;$B2DE7C
	JSL.l CODE_BB85B8			;$B2DE7F
	LDA.w #$0667				;$B2DE83
	JSL.l CODE_B28012			;$B2DE86
	LDA.w #$0768				;$B2DE8A
	JSL.l CODE_B28012			;$B2DE8D
	JSL.l CODE_BB8591			;$B2DE91
CODE_B2DE95:
	JML [$04F5]				;$B2DE95

banana_bird_cave_crystal_main:
;$B2DE98
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
	JSL.l CODE_B28012			;$B2DEB4
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
	JSL.l CODE_B28012			;$B2DEFD
	JSL.l CODE_BB8591			;$B2DF01
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
	LDA.l DATA_FD3201,x			;$B2DF68
	DEC					;$B2DF6C
	DEC					;$B2DF6D
	STA.b $46				;$B2DF6E
	LDA.w #DATA_FD341B>>16			;$B2DF70
	STA.b $48				;$B2DF73
	LDA.w #$7E3180				;$B2DF75
	STA.b $42				;$B2DF78
	LDA.w #$7E3180>>16			;$B2DF7A
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

unknown_sprite_01B4_main:
;$B2DF91
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
	db $03,$04,$04,$04,$05,$05,$05,$06,$06,$06,$06,$07,$07,$07,$08,$05

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
	JSL.l CODE_BB8591			;$B2E038
	BRA.b CODE_B2E02A			;$B2E03C

CODE_B2E03E:
	LDA.w $04DA				;$B2E03E
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
;$B2E07B
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
	db $00,$00,$00,$02,$00,$02,$00,$00,$04,$04,$04,$06,$04,$06,$04,$04

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
	JSL.l CODE_B9E000			;$B2E36F
	BCC.b CODE_B2E37F			;$B2E373
	LDA.b $5C,x				;$B2E375
	JSL.l CODE_B4801E			;$B2E377
CODE_B2E37B:
	JSL.l CODE_BB8591			;$B2E37B
CODE_B2E37F:
	JML [$04F5]				;$B2E37F

CODE_B2E382:
	JSR.w CODE_B2E3B3			;$B2E382
	JSL.l CODE_B9E000			;$B2E385
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
	dw $CEBA,$F6E2

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
;$B2E41A
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
	JSL.l CODE_B28012			;$B2E489
CODE_B2E48D:
	JSL.l CODE_BB8591			;$B2E48D
	BRA.b CODE_B2E467			;$B2E491

unknown_sprite_01BC_main:
;$B2E493
	JMP.w (DATA_B2E496,x)			;$B2E493

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
	LDY.w $04C4				;$B2E4BA
	CPY.w #$0002				;$B2E4BD
	BNE.b CODE_B2E4CA			;$B2E4C0
	LDY.w $04C6				;$B2E4C2
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
	JSL.l CODE_B28012			;$B2E4ED
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
	JSL.l CODE_BB8591			;$B2E53B
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

unknown_sprite_006C_main:
;$B2E556
	JMP.w (DATA_B2E559,x)			;$B2E556

DATA_B2E559:
	dw CODE_B2E55D
	dw CODE_B2E5A1

CODE_B2E55D:
	TYX					;$B2E55D
	INC.b $38,x				;$B2E55E
	LDA.b $5C,x				;$B2E560
	AND.w #$000F				;$B2E562
	CMP.w #$0004				;$B2E565
	BCS.b CODE_B2E56E			;$B2E568
	SEC					;$B2E56A
	SBC.w #$0005				;$B2E56B
CODE_B2E56E:
	ASL					;$B2E56E
	ASL					;$B2E56F
	ASL					;$B2E570
	ASL					;$B2E571
	CLC					;$B2E572
	ADC.w #$0070				;$B2E573
	STA.b $12,x				;$B2E576
	JSL.l CODE_808018			;$B2E578
	AND.w #$003F				;$B2E57C
	CLC					;$B2E57F
	ADC.w #$0080				;$B2E580
	STA.b $16,x				;$B2E583
	JSL.l CODE_808018			;$B2E585
	AND.w #$01FF				;$B2E589
	CLC					;$B2E58C
	ADC.w #$0200				;$B2E58D
	STA.b $34,x				;$B2E590
	BIT.w #$0001				;$B2E592
	BNE.b CODE_B2E5A1			;$B2E595
	LDA.b $24,x				;$B2E597
	CLC					;$B2E599
	ADC.w #$0005				;$B2E59A
	STA.b $24,x				;$B2E59D
	STZ.b $20,x				;$B2E59F
CODE_B2E5A1:
	JSL.l CODE_B9E000			;$B2E5A1
	JML [$04F5]				;$B2E5A5

speedrun_timer_main:
;$B2E5A8
	JMP.w (DATA_B2E5AB,x)			;$B2E5A8

DATA_B2E5AB:
	dw CODE_B2E5B1
	dw CODE_B2E5C9
	dw CODE_B2E5ED

CODE_B2E5B1:
	TYX					;$B2E5B1
	STX.w $18E3				;$B2E5B2
	INC.b $38,x				;$B2E5B5
	LDA.w #$0006				;$B2E5B7
	STA.b $62,x				;$B2E5BA
	LDA.w #$0070				;$B2E5BC
	JSL.l CODE_BB859A			;$B2E5BF
	ORA.w #$3000				;$B2E5C3
	STA.w $001E,y				;$B2E5C6
CODE_B2E5C9:
	TYX					;$B2E5C9
	LDA.w $0533				;$B2E5CA
	CMP.w #$0002				;$B2E5CD
	BCS.b CODE_B2E5ED			;$B2E5D0
	LDA.w #$0100				;$B2E5D2
	BIT.w $05AF				;$B2E5D5
	BNE.b CODE_B2E5ED			;$B2E5D8
	JSR.w CODE_B2E5F0			;$B2E5DA
	LDX.w active_kong_sprite		;$B2E5DD
	LDA.b $12,x				;$B2E5E0
	CMP.w #$2751				;$B2E5E2
	BCC.b CODE_B2E5ED			;$B2E5E5
	LDA.w #$FFFF				;$B2E5E7
	STA.w $18E5				;$B2E5EA
CODE_B2E5ED:
	JML [$04F5]				;$B2E5ED

CODE_B2E5F0:
	LDA.w $0536				;$B2E5F0
	CMP.w #$0959				;$B2E5F3
	BCS.b CODE_B2E637			;$B2E5F6
	LDA.b $00				;$B2E5F8
	AND.w #$0007				;$B2E5FA
	STA.b $64,x				;$B2E5FD
	DEC.b $62,x				;$B2E5FF
	BNE.b CODE_B2E637			;$B2E601
	LDA.w #$0006				;$B2E603
	STA.b $62,x				;$B2E606
	LDA.w $0535				;$B2E608
	SEP.b #$28				;$B2E60B
	ADC.b #$01				;$B2E60D
	STA.w $0535				;$B2E60F
	CMP.b #$10				;$B2E612
	BMI.b CODE_B2E634			;$B2E614
	STZ.w $0535				;$B2E616
	LDA.w $0536				;$B2E619
	CLC					;$B2E61C
	ADC.b #$01				;$B2E61D
	STA.w $0536				;$B2E61F
	CMP.b #$60				;$B2E622
	BMI.b CODE_B2E634			;$B2E624
	STZ.w $0536				;$B2E626
	LDA.w $0537				;$B2E629
	CLC					;$B2E62C
	ADC.b #$01				;$B2E62D
	STA.w $0537				;$B2E62F
	CMP.b #$10				;$B2E632
CODE_B2E634:
	CLD					;$B2E634
	REP.b #$20				;$B2E635
CODE_B2E637:
	RTS					;$B2E637

map_flag_main:
;$B2E638
	JMP.w (DATA_B2E63B,x)			;$B2E638

DATA_B2E63B:
	dw CODE_B2E641
	dw CODE_B2E65A
	dw CODE_B2E666

CODE_B2E641:
	LDA.w current_world			;$B2E641
	BNE.b CODE_B2E654			;$B2E644
	LDA.w current_boat			;$B2E646
	CMP.w #$0003				;$B2E649
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
	LDA.b $00				;$B2E66F
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
	LDA.b $00				;$B2E695
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
	LDA.b $00				;$B2E6AC
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
	LDA.w $04DA				;$B2E712
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
;$B2E753
	JMP.w (DATA_B2E756,x)			;$B2E753

DATA_B2E756:
	dw CODE_B2E75A
	dw CODE_B2E77D

CODE_B2E75A:
	LDA.w $001E,y				;$B2E75A
	AND.w #$01E0				;$B2E75D
	LSR					;$B2E760
	LSR					;$B2E761
	LSR					;$B2E762
	LSR					;$B2E763
	TAX					;$B2E764
	LDA.w #$0000				;$B2E765
	STA.w $06D8,x				;$B2E768
	STY.w $06F4				;$B2E76B
	LDA.w $001E,y				;$B2E76E
	AND.w #$FE1F				;$B2E771
	ORA.w #$01C0				;$B2E774
	STA.w $001E,y				;$B2E777
	TYX					;$B2E77A
	INC.b $38,x				;$B2E77B
CODE_B2E77D:
	JSL.l process_anim_preserve_state	;$B2E77D
	JML [$04F5]				;$B2E781

kremwood_forest_log_main:
;$B2E784
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
	LDA.b $00				;$B2E7BF
	BIT.w #$001F				;$B2E7C1
	BNE.b CODE_B2E7E9			;$B2E7C4
	LDA.w #$0673				;$B2E7C6
	JSL.l CODE_B28012			;$B2E7C9
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
	JSL.l CODE_B9E000			;$B2E7FB
	JML [$04F5]				;$B2E7FF

map_cannon_main:
;$B2E802
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
	LDA.b $00				;$B2E826
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
	JSL.l CODE_B9E000			;$B2E88D
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
	LDA.b $00				;$B2E8BE
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
	JSL.l CODE_B9E000			;$B2E8F2
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

unknown_sprite_0074_main:
;$B2E992
	LDA.w $0016,y				;$B2E992
	CMP.w #$00D0				;$B2E995
	BPL.b CODE_B2E9A5			;$B2E998
	JSL.l process_sprite_animation		;$B2E99A
	JSL.l CODE_B9E000			;$B2E99E
	JML [$04F5]				;$B2E9A2

CODE_B2E9A5:
	JSL.l CODE_BB8591			;$B2E9A5
	JML [$04F5]				;$B2E9A9

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
	JSL.l CODE_BB8591			;$B2E9D7
	LDA.w #$0671				;$B2E9DB
	JSL.l CODE_B28012			;$B2E9DE
	LDA.w #$077C				;$B2E9E2
	JSL.l CODE_B28012			;$B2E9E5
	LDY.w #$0296				;$B2E9E9
	JSL.l CODE_BB8585			;$B2E9EC
	LDA.w #$0100				;$B2E9F0
	TSB.w $05FB				;$B2E9F3
CODE_B2E9F6:
	JML [$04F5]				;$B2E9F6

CODE_B2E9F9:
	JSL.l CODE_BB8591			;$B2E9F9
	JML [$04F5]				;$B2E9FD

unknown_sprite_01C4_main:
;$B2EA00
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
	JSL.l CODE_BB8591			;$B2EA28
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

unknown_sprite_008C_main:
;$B2EAB3
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
;$B2EACA
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
	JSL.l CODE_B9E000			;$B2EB07
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
;$B2EC45
	JMP.w (DATA_B2EC48,x)			;$B2EC45

DATA_B2EC48:
	dw CODE_B2EC50
	dw CODE_B2EC68
	dw CODE_B2EC79
	dw CODE_B2ECA7

CODE_B2EC50:
	LDA.w $051F				;$B2EC50
	BNE.b CODE_B2EC5C			;$B2EC53
	JSL.l CODE_BB8591			;$B2EC55
	JML [$04F5]				;$B2EC59

CODE_B2EC5C:
	TYX					;$B2EC5C
	INC.b $38,x				;$B2EC5D
	STA.b $4E,x				;$B2EC5F
	LDA.w #$0572				;$B2EC61
	JSL.l CODE_B28012			;$B2EC64
CODE_B2EC68:
	LDA.b $00				;$B2EC68
	BIT.w #$0001				;$B2EC6A
	BNE.b CODE_B2EC72			;$B2EC6D
	JSR.w CODE_B2ECAC			;$B2EC6F
CODE_B2EC72:
	JSL.l CODE_B9E000			;$B2EC72
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
	JSL.l CODE_B28012			;$B2EC9C
	JSL.l CODE_BB8591			;$B2ECA0
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
;$B2ECBA
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
	JSL.l CODE_BB8591			;$B2ECCC
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
;$B2ECEB
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
	JSL.l CODE_B28012			;$B2ED19
CODE_B2ED1D:
	JML [$04F5]				;$B2ED1D

CODE_B2ED20:
	LDA.b $00				;$B2ED20
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
;$B2ED3D
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
;$B2ED93
	LDA.w map_node_number			;$B2ED93
	CMP.w #$000A				;$B2ED96
	BNE.b CODE_B2ED9E			;$B2ED99
	JSR.w CODE_B2EDA8			;$B2ED9B
CODE_B2ED9E:
	JSR.w CODE_B2EDD9			;$B2ED9E
	JSL.l CODE_B9E000			;$B2EDA1
	JML [$04F5]				;$B2EDA5

CODE_B2EDA8:
	STZ.b $1A				;$B2EDA8
	LDX.w active_kong_sprite		;$B2EDAA
	LDA.b $18,x				;$B2EDAD
	BEQ.b CODE_B2EDD8			;$B2EDAF
	JSR.w CODE_B2EDBF			;$B2EDB1
	DEC.b $1A				;$B2EDB4
	DEC.b $1A				;$B2EDB6
	DEC.b $1A				;$B2EDB8
	DEC.b $1A				;$B2EDBA
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
	ADC.b $1A				;$B2EDCF
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
	STX.b $1E				;$B2EDEC
	ASL					;$B2EDEE
	ASL					;$B2EDEF
	ASL					;$B2EDF0
	STA.b $3E				;$B2EDF1
	LDA.w #$0020				;$B2EDF3
	SEC					;$B2EDF6
	SBC.b $3E				;$B2EDF7
	STA.b $3E				;$B2EDF9
	STA.b $1C				;$B2EDFB
	LDA.w #$0000				;$B2EDFD
	STA.b $1A				;$B2EE00
	LDX.w #$0010				;$B2EE02
CODE_B2EE05:
	LDA.b $1A				;$B2EE05
	STA.l $7EA1DA,x				;$B2EE07
	DEC.b $1C				;$B2EE0B
	BNE.b CODE_B2EE1A			;$B2EE0D
	LDA.b $3E				;$B2EE0F
	STA.b $1C				;$B2EE11
	LDA.b $1A				;$B2EE13
	CLC					;$B2EE15
	ADC.b $1E				;$B2EE16
	STA.b $1A				;$B2EE18
CODE_B2EE1A:
	INX					;$B2EE1A
	INX					;$B2EE1B
	CPX.w #$0090				;$B2EE1C
	BCC.b CODE_B2EE05			;$B2EE1F
	RTS					;$B2EE21

unknown_sprite_00A0_main:
;$B2EE22
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
	JSL.l CODE_BB8591			;$B2EE33
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
	JSL.l CODE_B28012			;$B2EE57
	JSL.l CODE_BB8591			;$B2EE5B
CODE_B2EE5F:
	JML [$04F5]				;$B2EE5F

unknown_sprite_00A4_main:
;$B2EE62
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
;$B2EE75
	JMP.w (DATA_B2EE78,x)			;$B2EE75

DATA_B2EE78:
	dw CODE_B2EE80
	dw CODE_B2EECB
	dw CODE_B2EF62
	dw CODE_B2EF7F

CODE_B2EE80:
	LDA.w $15EC				;$B2EE80
	BEQ.b CODE_B2EE8C			;$B2EE83
	JSL.l CODE_BB8591			;$B2EE85
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
	LDA.l DATA_FD3201,x			;$B2EEB3
	TAX					;$B2EEB7
	LDY.w #$7E2F80				;$B2EEB8
	LDA.w #$000F				;$B2EEBB
	MVN $7E2F80>>16,DATA_FD341B>>16		;$B2EEBE
	LDA.w #$0566				;$B2EEC1
	JSL.l CODE_B28012			;$B2EEC4
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
	JSL.l CODE_B9E000			;$B2EF5B
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
	JSL.l CODE_B9E000			;$B2EF78
	JML [$04F5]				;$B2EF7C

CODE_B2EF7F:
	LDA.w $15EC				;$B2EF7F
	BEQ.b CODE_B2EF8B			;$B2EF82
	JSL.l CODE_BB8591			;$B2EF84
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
	STZ.b $30,x				;$B2EFDF
	STZ.b $2A,x				;$B2EFE1
	STZ.b $34,x				;$B2EFE3
	STZ.b $2E,x				;$B2EFE5
	RTS					;$B2EFE7

CODE_B2EFE8:
	LDA.w $15E8				;$B2EFE8
	BNE.b CODE_B2EFF1			;$B2EFEB
	LDA.b $60,x				;$B2EFED
	BNE.b CODE_B2F006			;$B2EFEF
CODE_B2EFF1:
	STZ.w $15E8				;$B2EFF1
	LDA.w #$070C				;$B2EFF4
	JSL.l CODE_B28012			;$B2EFF7
	LDA.b $5E,x				;$B2EFFB
	STA.b $60,x				;$B2EFFD
	STX.w $15EC				;$B2EFFF
	JSR.w CODE_B2F065			;$B2F002
	RTS					;$B2F005

CODE_B2F006:
	CMP.w #$0060				;$B2F006
	BNE.b CODE_B2F012			;$B2F009
	LDA.w #$0667				;$B2F00B
	JSL.l CODE_B28012			;$B2F00E
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
	LDA.b $00				;$B2F041
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
	STA.w !REGISTER_DividendLo		;$B2F0A7
	LDA.b $1A,x				;$B2F0AA
	STA.w $006A,y				;$B2F0AC
	SEP.b #$20				;$B2F0AF
	PHA					;$B2F0B1
	STA.w !REGISTER_Divisor			;$B2F0B2
	REP.b #$20				;$B2F0B5
	LDA.w #$0000				;$B2F0B7
	LDA.b ($00)				;$B2F0BA
	LDA.b ($00)				;$B2F0BC
	LDA.w !REGISTER_QuotientLo		;$B2F0BE
	STA.w $005E,y				;$B2F0C1
	LDA.w #$1C00				;$B2F0C4
	STA.w !REGISTER_DividendLo		;$B2F0C7
	SEP.b #$20				;$B2F0CA
	PLA					;$B2F0CC
	STA.w !REGISTER_Divisor			;$B2F0CD
	REP.b #$20				;$B2F0D0
	LDA.w #$0000				;$B2F0D2
	LDA.b ($00)				;$B2F0D5
	LDA.b ($00)				;$B2F0D7
	LDA.w !REGISTER_QuotientLo		;$B2F0D9
	STA.w $0044,y				;$B2F0DC
CODE_B2F0DF:
	RTS					;$B2F0DF

lightning_bolt_spawner_main:
;$B2F0E0
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
	JSL.l CODE_B9E000			;$B2F131
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
	SBC.w #aux_sprite_table			;$B2F2FD
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
;$B2F323
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
	JSL.l CODE_B28012			;$B2F38C
	TXY					;$B2F390
CODE_B2F391:
	LDA.b $00				;$B2F391
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
	JSL.l CODE_B9E000			;$B2F3B3
CODE_B2F3B7:
	JML [$04F5]				;$B2F3B7

CODE_B2F3BA:
	TYX					;$B2F3BA
	DEC.b $4E,x				;$B2F3BB
	BNE.b CODE_B2F3B3			;$B2F3BD
	INC.b $38,x				;$B2F3BF
	BRA.b CODE_B2F3B3			;$B2F3C1

CODE_B2F3C3:
	LDA.b $00				;$B2F3C3
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
	JSL.l CODE_B9E000			;$B2F3E5
	JML [$04F5]				;$B2F3E9

CODE_B2F3EC:
	JSR.w CODE_B2F881			;$B2F3EC
	JML [$04F5]				;$B2F3EF

krematoa_bridge_main:
;$B2F3F2
	JMP.w (DATA_B2F3F5,x)			;$B2F3F2

DATA_B2F3F5:
	dw CODE_B2F3F9
	dw CODE_B2F420

CODE_B2F3F9:
	TYX					;$B2F3F9
	INC.b $38,x				;$B2F3FA
	LDY.w #$0310				;$B2F3FC
	JSL.l CODE_BB85B8			;$B2F3FF
	LDY.w #$0312				;$B2F403
	JSL.l CODE_BB85B8			;$B2F406
	LDY.w #$0314				;$B2F40A
	JSL.l CODE_BB85B8			;$B2F40D
	LDA.w #$0100				;$B2F411
	BIT.w $05FD				;$B2F414
	BNE.b CODE_B2F420			;$B2F417
	LDA.w #$0777				;$B2F419
	JSL.l CODE_B28012			;$B2F41C
CODE_B2F420:
	TYX					;$B2F420
	LDA.b $58,x				;$B2F421
	BEQ.b CODE_B2F44C			;$B2F423
	LDA.w #$0100				;$B2F425
	BIT.w $05FD				;$B2F428
	BEQ.b CODE_B2F42F			;$B2F42B
	STZ.b $26,x				;$B2F42D
CODE_B2F42F:
	LDA.b $00				;$B2F42F
	BIT.w #$0007				;$B2F431
	BNE.b CODE_B2F44C			;$B2F434
	SEP.b #$20				;$B2F436
	DEC.b $59,x				;$B2F438
	REP.b #$20				;$B2F43A
	BNE.b CODE_B2F44C			;$B2F43C
	LDA.b $5C,x				;$B2F43E
	BEQ.b CODE_B2F44C			;$B2F440
	JSL.l CODE_B28012			;$B2F442
	LDA.w #$0100				;$B2F446
	TSB.w $05FD				;$B2F449
CODE_B2F44C:
	JML [$04F5]				;$B2F44C

player_krosshair_controller_main:
;$B2F44F
	LDA.w #$0001				;$B2F44F
	BIT.w $05AF				;$B2F452
	BNE.b CODE_B2F46E			;$B2F455
	LDA.w #$002B				;$B2F457
	JSL.l CODE_B88069			;$B2F45A
	JSR.w CODE_B2F471			;$B2F45E
	JSL.l CODE_B9E000			;$B2F461
	LDA.b $28,x				;$B2F465
	AND.w #$0003				;$B2F467
	BEQ.b CODE_B2F46E			;$B2F46A
	STZ.b $2E,x				;$B2F46C
CODE_B2F46E:
	JML [$04F5]				;$B2F46E

CODE_B2F471:
	TYX					;$B2F471
	LDA.w $04D6				;$B2F472
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
	LDA.w $04D6				;$B2F48D
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
	LDA.w $04D6				;$B2F4AB
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
	LDA.w $04DA				;$B2F4BF
	AND.w #$8080				;$B2F4C2
	BEQ.b CODE_B2F4CF			;$B2F4C5
	INC.w $15E8				;$B2F4C7
	LDA.b $5E,x				;$B2F4CA
	STA.b $5C,x				;$B2F4CC
	RTS					;$B2F4CE

CODE_B2F4CF:
	LDA.w $04DA				;$B2F4CF
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
;$B2F4F1
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
	LDA.b $00				;$B2F508
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
	JSL.l CODE_BB8591			;$B2F54B
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
;$B2F582
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
	STZ.b $00				;$B2F5B9
CODE_B2F5BB:
	LDA.b $00				;$B2F5BB
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
	JSL.l CODE_B28012			;$B2F5D5
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
	JSL.l CODE_B28012			;$B2F602
CODE_B2F606:
	INC.w $15E8				;$B2F606
	LDA.b $00				;$B2F609
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
	JSL.l CODE_B28012			;$B2F63C
	JSL.l CODE_BB8591			;$B2F640
	LDX.w $15EC				;$B2F644
	JSL.l CODE_BB85E8			;$B2F647
CODE_B2F64B:
	JML [$04F5]				;$B2F64B

red_gem_in_banana_bird_queen_barrier_main:
;$B2F64E
	LDA.w $15E8				;$B2F64E
	BIT.w #$FF00				;$B2F651
	BEQ.b CODE_B2F68E			;$B2F654
	CMP.w #$0180				;$B2F656
	BCC.b CODE_B2F684			;$B2F659
	LDA.w #$037A				;$B2F65B
	JSL.l CODE_B28012			;$B2F65E
	LDA.w #$040C				;$B2F662
	JSL.l CODE_B28012			;$B2F665
	LDA.w #$050F				;$B2F669
	JSL.l CODE_B28012			;$B2F66C
	LDA.w #$0629				;$B2F670
	JSL.l CODE_B28012			;$B2F673
	LDA.w #$074F				;$B2F677
	JSL.l CODE_B28012			;$B2F67A
	JSL.l CODE_BB8591			;$B2F67E
	BRA.b CODE_B2F68E			;$B2F682

CODE_B2F684:
	TYX					;$B2F684
	JSL.l CODE_808018			;$B2F685
	AND.w #$0101				;$B2F689
	STA.b $58,x				;$B2F68C
CODE_B2F68E:
	JML [$04F5]				;$B2F68E

k_rool_head_main:
;$B2F691
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
	JSL.l CODE_B9E000			;$B2F6EA
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
	LDA.w $04DA				;$B2F754
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
	JSL.l CODE_B9E000			;$B2F7A7
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

giant_banana_bird_queen_egg_main:
;$B2F7BE
	JMP.w (DATA_B2F7C1,x)			;$B2F7BE

DATA_B2F7C1:
	dw CODE_B2F7C5
	dw CODE_B2F81C

CODE_B2F7C5:
	TYX					;$B2F7C5
	DEC.b $50,x				;$B2F7C6
	BNE.b CODE_B2F7D4			;$B2F7C8
	LDA.w #$057A				;$B2F7CA
	JSL.l CODE_B28027			;$B2F7CD
	STZ.w $044A				;$B2F7D1
CODE_B2F7D4:
	LDX.b $5C,y				;$B2F7D4
	BEQ.b CODE_B2F80B			;$B2F7D6
	LDA.b $12,x				;$B2F7D8
	STA.w $0012,y				;$B2F7DA
	LDA.w $005A,y				;$B2F7DD
	BNE.b CODE_B2F804			;$B2F7E0
	LDA.w #$0001				;$B2F7E2
	STA.w $0038,y				;$B2F7E5
	LDA.w #$0108				;$B2F7E8
	STA.b $5A,x				;$B2F7EB
	LDA.w #$0202				;$B2F7ED
	STA.b $64,x				;$B2F7F0
	LDA.w #$0080				;$B2F7F2
	STA.b $34,x				;$B2F7F5
	STA.b $66,x				;$B2F7F7
	LDA.w #$0250				;$B2F7F9
	STA.b $5E,x				;$B2F7FC
	LDA.w #$01E0				;$B2F7FE
	STA.w $005E,y				;$B2F801
CODE_B2F804:
	JSL.l CODE_B9E000			;$B2F804
	JML [$04F5]				;$B2F808

CODE_B2F80B:
	LDA.b $00				;$B2F80B
	BIT.w #$001F				;$B2F80D
	BNE.b CODE_B2F819			;$B2F810
	LDA.w #$0648				;$B2F812
	JSL.l CODE_B28027			;$B2F815
CODE_B2F819:
	JML [$04F5]				;$B2F819

CODE_B2F81C:
	LDX.b $5C,y				;$B2F81C
	LDA.b $12,x				;$B2F81E
	STA.w $0012,y				;$B2F820
	LDA.b $32,x				;$B2F823
	CLC					;$B2F825
	ADC.w #$0030				;$B2F826
	STA.w $0016,y				;$B2F829
	LDA.w $005E,y				;$B2F82C
	BEQ.b CODE_B2F844			;$B2F82F
	LDA.b $30,x				;$B2F831
	SEC					;$B2F833
	SBC.w #$0008				;$B2F834
	BPL.b CODE_B2F83A			;$B2F837
	TDC					;$B2F839
CODE_B2F83A:
	STA.b $30,x				;$B2F83A
	TYX					;$B2F83C
	DEC.b $5E,x				;$B2F83D
	BNE.b CODE_B2F844			;$B2F83F
	JSR.w CODE_B2F84B			;$B2F841
CODE_B2F844:
	JSL.l CODE_B9E000			;$B2F844
	JML [$04F5]				;$B2F848

CODE_B2F84B:
	LDA.w #$077B				;$B2F84B
	JSL.l CODE_B28027			;$B2F84E
	LDY.w #$033A				;$B2F852
	JSL.l CODE_BB8585			;$B2F855
	LDY.w #$033C				;$B2F859
	JSL.l CODE_BB8585			;$B2F85C
	LDY.w #$033E				;$B2F860
	JSL.l CODE_BB8585			;$B2F863
	LDY.b current_sprite			;$B2F867
	LDA.w $005C,y				;$B2F869
	LDX.b alternate_sprite			;$B2F86C
	STA.b $5C,x				;$B2F86E
	LDY.w #$0340				;$B2F870
	JSL.l CODE_BB8585			;$B2F873
	LDY.b current_sprite			;$B2F877
	LDA.w $005C,y				;$B2F879
	LDX.b alternate_sprite			;$B2F87C
	STA.b $5C,x				;$B2F87E
	RTS					;$B2F880

CODE_B2F881:
	LDX.b $5C,y				;$B2F881
	LDA.b $12,x				;$B2F883
	STA.w $0012,y				;$B2F885
	LDA.b $16,x				;$B2F888
	STA.w $0016,y				;$B2F88A
	RTS					;$B2F88D

funky_cranky_secret_ending_main:
;$B2F88E
	JMP.w (DATA_B2F891,x)			;$B2F88E

DATA_B2F891:
	dw CODE_B2F899
	dw CODE_B2F8CC
	dw CODE_B2F8FC
	dw CODE_B2F914

CODE_B2F899:
	TYX					;$B2F899
	INC.b $38,x				;$B2F89A
	JSL.l CODE_B9E000			;$B2F89C
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
	JSL.l CODE_B9E000			;$B2F8F1
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
	JSL.l CODE_B28012			;$B2F965
	LDA.w #$0750				;$B2F969
	JSL.l CODE_B28012			;$B2F96C
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
	JSL.l CODE_BB8591			;$B2F99B
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
;$B2F9B4
	JMP.w (DATA_B2F9B7,x)			;$B2F9B4

DATA_B2F9B7:
	dw CODE_B2F9BD
	dw CODE_B2F9DB
	dw CODE_B2F9E6

CODE_B2F9BD:
	TYX					;$B2F9BD
	INC.b $38,x				;$B2F9BE
	LDA.w #$0005				;$B2F9C0
	STA.b $60				;$B2F9C3
	LDA.w #$0374				;$B2F9C5
	STA.b $62				;$B2F9C8
CODE_B2F9CA:
	LDY.b $62				;$B2F9CA
	INC.b $62				;$B2F9CC
	INC.b $62				;$B2F9CE
	JSL.l CODE_BB85B8			;$B2F9D0
	DEC.b $60				;$B2F9D4
	BNE.b CODE_B2F9CA			;$B2F9D6
	JML [$04F5]				;$B2F9D8

CODE_B2F9DB:
	JSR.w CODE_B2F9F1			;$B2F9DB
	LDA.w $005A,y				;$B2F9DE
	BNE.b CODE_B2F9E6			;$B2F9E1
	JSR.w CODE_B2CDFC			;$B2F9E3
CODE_B2F9E6:
	JSL.l CODE_B9E000			;$B2F9E6
	JSL.l process_sprite_animation		;$B2F9EA
	JML [$04F5]				;$B2F9EE

CODE_B2F9F1:
	LDX.w active_kong_sprite		;$B2F9F1
	JSR.w CODE_B2FA6E			;$B2F9F4
	LDX.w follower_kong_sprite		;$B2F9F7
	JSR.w CODE_B2FA6E			;$B2F9FA
	RTS					;$B2F9FD

map_banana_bird_queen_main:
;$B2F9FE
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
	JSL.l CODE_B9E000			;$B2FA41
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
;$B2FAA6
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
	JSL.l CODE_B9E000			;$B2FAF5
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
;$B2FB18
	JML [$04F5]				;$B2FB18

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

CODE_B2FB33:
	JMP.w (DATA_B2FB36,x)			;$B2FB33

DATA_B2FB36:
	dw CODE_B2FB3A
	dw CODE_B2FB61

CODE_B2FB3A:
	TYX					;$B2FB3A
	INC.b $38,x				;$B2FB3B
	LDA.w #$0020				;$B2FB3D
	STA.b $52,x				;$B2FB40
	LDA.w current_world			;$B2FB42
	BNE.b CODE_B2FB5E			;$B2FB45
	LDA.w #$0006				;$B2FB47
	STA.b level_number			;$B2FB4A
	JSL.l CODE_B7B006			;$B2FB4C
	LDX.b current_sprite			;$B2FB50
	STX.w $04A4				;$B2FB52
	LDA.w #$8000				;$B2FB55
	STA.w $04A6				;$B2FB58
	STA.w $04A8				;$B2FB5B
CODE_B2FB5E:
	JML [$04F5]				;$B2FB5E

CODE_B2FB61:
	LDX.w #$D113				;$B2FB61
	LDA.w current_world			;$B2FB64
	BEQ.b CODE_B2FB6C			;$B2FB67
	LDX.w #$D133				;$B2FB69
CODE_B2FB6C:
	STX.b $1A				;$B2FB6C
	LDA.w $0012,y				;$B2FB6E
	LDX.b $16,y				;$B2FB71
	STA.w $0106				;$B2FB73
	STX.w $0108				;$B2FB76
	PEA.w CODE_B2FB7F-$01			;$B2FB79
	JMP.w ($001A)				;$B2FB7C
CODE_B2FB7F:
	STX.w $0102				;$B2FB7F
	STA.w $0104				;$B2FB82
	JSR.w CODE_B2FB9A			;$B2FB85
	JSR.w CODE_B2FBD6			;$B2FB88
	LDX.b $5E,y				;$B2FB8B
	LDA.w $0012,y				;$B2FB8D
	STA.b $12,x				;$B2FB90
	LDA.w $0016,y				;$B2FB92
	STA.b $16,x				;$B2FB95
	JML [$04F5]				;$B2FB97

CODE_B2FB9A:
	BIT.w #$0008				;$B2FB9A
	BNE.b CODE_B2FBC1			;$B2FB9D
	AND.w #$0007				;$B2FB9F
	ASL					;$B2FBA2
	TAX					;$B2FBA3
	LDA.l DATA_B2FBC6,x			;$B2FBA4
CODE_B2FBA8:
	CLC					;$B2FBA8
	ADC.w #$35FB				;$B2FBA9
	STA.w $005C,y				;$B2FBAC
	CPX.w #$0006				;$B2FBAF
	BNE.b CODE_B2FBC0			;$B2FBB2
	LDA.w $005C,y				;$B2FBB4
	AND.w #$3FFF				;$B2FBB7
	ORA.w #$4000				;$B2FBBA
	STA.w $005C,y				;$B2FBBD
CODE_B2FBC0:
	RTS					;$B2FBC0

CODE_B2FBC1:
	LDA.w #$0004				;$B2FBC1
	BRA.b CODE_B2FBA8			;$B2FBC4

DATA_B2FBC6:
	dw $0000
	dw $0003
	dw $0002
	dw $0001
	dw $0001
	dw $0000
	dw $0000
	dw $0000

CODE_B2FBD6:
	LDA.w #$0001				;$B2FBD6
	STA.b $1A				;$B2FBD9
	LDA.w $04CC				;$B2FBDB
	BIT.w #$4000				;$B2FBDE
	BEQ.b CODE_B2FBE8			;$B2FBE1
	LDA.w #$0008				;$B2FBE3
	STA.b $1A				;$B2FBE6
CODE_B2FBE8:
	LDA.w $04CC				;$B2FBE8
	BIT.w #$0800				;$B2FBEB
	BEQ.b CODE_B2FBF9			;$B2FBEE
	LDA.w $0016,y				;$B2FBF0
	SEC					;$B2FBF3
	SBC.b $1A				;$B2FBF4
	STA.w $0016,y				;$B2FBF6
CODE_B2FBF9:
	LDA.w $04CC				;$B2FBF9
	BIT.w #$0400				;$B2FBFC
	BEQ.b CODE_B2FC0A			;$B2FBFF
	LDA.w $0016,y				;$B2FC01
	CLC					;$B2FC04
	ADC.b $1A				;$B2FC05
	STA.w $0016,y				;$B2FC07
CODE_B2FC0A:
	LDA.w $04CC				;$B2FC0A
	BIT.w #$0200				;$B2FC0D
	BEQ.b CODE_B2FC1B			;$B2FC10
	LDA.w $0012,y				;$B2FC12
	SEC					;$B2FC15
	SBC.b $1A				;$B2FC16
	STA.w $0012,y				;$B2FC18
CODE_B2FC1B:
	LDA.w $04CC				;$B2FC1B
	BIT.w #$0100				;$B2FC1E
	BEQ.b CODE_B2FC2C			;$B2FC21
	LDA.w $0012,y				;$B2FC23
	CLC					;$B2FC26
	ADC.b $1A				;$B2FC27
	STA.w $0012,y				;$B2FC29
CODE_B2FC2C:
	LDA.w $04D0				;$B2FC2C
	BIT.w #$8000				;$B2FC2F
	BEQ.b CODE_B2FC45			;$B2FC32
	LDX.w $0102				;$B2FC34
	SEP.b #$20				;$B2FC37
	LDA.l $7E82E8,x				;$B2FC39
	ORA.b #$08				;$B2FC3D
	STA.l $7E82E8,x				;$B2FC3F
	REP.b #$20				;$B2FC43
CODE_B2FC45:
	LDA.w $04D0				;$B2FC45
	BIT.w #$0080				;$B2FC48
	BEQ.b CODE_B2FC5A			;$B2FC4B
	LDX.w $0102				;$B2FC4D
	SEP.b #$20				;$B2FC50
	LDA.b #$00				;$B2FC52
	STA.l $7E82E8,x				;$B2FC54
	REP.b #$20				;$B2FC58
CODE_B2FC5A:
	LDA.w $04D0				;$B2FC5A
	BIT.w #$0040				;$B2FC5D
	BEQ.b CODE_B2FC73			;$B2FC60
	LDX.w $0102				;$B2FC62
	SEP.b #$20				;$B2FC65
	LDA.l $7E82E8,x				;$B2FC67
	EOR.b #$10				;$B2FC6B
	STA.l $7E82E8,x				;$B2FC6D
	REP.b #$20				;$B2FC71
CODE_B2FC73:
	LDA.w $04D0				;$B2FC73
	BIT.w #$1000				;$B2FC76
	BEQ.b CODE_B2FC81			;$B2FC79
	LDA.w #$0878				;$B2FC7B
	STA.w $005E,y				;$B2FC7E
CODE_B2FC81:
	LDA.w $04D0				;$B2FC81
	BIT.w #$2000				;$B2FC84
	BEQ.b CODE_B2FCAA			;$B2FC87
CODE_B2FC89:
	LDA.w $005E,y				;$B2FC89
	SEC					;$B2FC8C
	SBC.w #$006E				;$B2FC8D
	CMP.w #aux_sprite_table			;$B2FC90
	BNE.b CODE_B2FC98			;$B2FC93
	LDA.w #$1480				;$B2FC95
CODE_B2FC98:
	STA.w $005E,y				;$B2FC98
	TAX					;$B2FC9B
	LDA.b $00,x				;$B2FC9C
	BEQ.b CODE_B2FC89			;$B2FC9E
	LDA.b $12,x				;$B2FCA0
	STA.w $0012,y				;$B2FCA2
	LDA.b $16,x				;$B2FCA5
	STA.w $0016,y				;$B2FCA7
CODE_B2FCAA:
	RTS					;$B2FCAA
