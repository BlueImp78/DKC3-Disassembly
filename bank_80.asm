CODE_808000:
	JMP.w CODE_808387			;$808000

CODE_808003:
	JMP.w CODE_8083C3			;$808003

CODE_808006:
	JMP.w CODE_808384			;$808006

CODE_808009:
	JMP.w init_registers_global		;$808009

CODE_80800C:
	JMP.w clear_vram_global			;$80800C

CODE_80800F:
	JMP.w set_all_oam_offscreen		;$80800F

CODE_808012:
	JMP.w CODE_80898C			;$808012

CODE_808015:
	JMP.w CODE_8089CA			;$808015

CODE_808018:
	JMP.w CODE_808C60			;$808018

CODE_80801B:
	JMP.w CODE_808CB0			;$80801B

CODE_80801E:
	JMP.w CODE_808799			;$80801E

CODE_808021:
	JMP.w fade_screen			;$808021

CODE_808024:
	JMP.w set_fade				;$808024

throw_exception_wrapper:
;$808027
	JMP.w throw_exception			;$808027

CODE_80802A:
	JMP.w CODE_8091A3			;$80802A

CODE_80802D:
	JMP.w CODE_808C3F			;$80802D

CODE_808030:
	JMP.w CODE_808CEC			;$808030

CODE_808033:
	JMP.w CODE_808D2B			;$808033

CODE_808036:
	JMP.w CODE_808D5A			;$808036

CODE_808039:
	JMP.w CODE_8084C7			;$808039

CODE_80803C:
	JMP.w CODE_80839D			;$80803C

CODE_80803F:
	JMP.w CODE_808EE6			;$80803F

CODE_808042:
	JMP.w CODE_808411			;$808042

CODE_808045:
	JMP.w CODE_809489			;$808045

CODE_808048:
	JMP.w CODE_80AE3E			;$808048

CODE_80804B:
	JMP.w CODE_809399			;$80804B

CODE_80804E:
	JMP.w CODE_8086C9			;$80804E

CODE_808051:
	JMP.w CODE_80B2C8			;$808051

CODE_808054:
	JMP.w CODE_8087E0			;$808054

CODE_808057:
	JMP.w CODE_808669			;$808057

CODE_80805A:
	JMP.w CODE_80B593			;$80805A

CODE_80805D:
	JMP.w CODE_80B4C8			;$80805D

CODE_808060:
	JMP.w CODE_808EA4			;$808060

CODE_808063:
	JMP.w CODE_808EBA			;$808063

CODE_808066:
	JMP.w CODE_8092EB			;$808066

CODE_808069:
	JMP.w CODE_809040			;$808069

CODE_80806C:
	JMP.w CODE_80BCDC			;$80806C

CODE_80806F:
	JMP.w CODE_80BCDC			;$80806F

CODE_808072:
	JMP.w CODE_80BCDC			;$808072

CODE_808075:
	JMP.w CODE_80BCDC			;$808075

CODE_808078:
	JMP.w CODE_80BCDC			;$808078

CODE_80807B:
	JMP.w CODE_80C05A			;$80807B

CODE_80807E:
	JMP.w CODE_80C0F1			;$80807E

CODE_808081:
	JMP.w CODE_80C104			;$808081

CODE_808084:
	JMP.w CODE_80C114			;$808084

CODE_808087:
	JMP.w CODE_8084D9			;$808087

CODE_80808A:
	JMP.w CODE_8087D5			;$80808A

rare_string:
	db $F4,$92,$72,$EE,$77,$A6,$E7,$8A

piracy_string:
	db "(c) 1996"

display_error_message:
;$80809D
	TYA					;$80809D
	JSL.l vram_payload_handler_global	;$80809E
	LDA.w #$001D				;$8080A2
	LDY.w #$0000				;$8080A5
	LDX.w #$0020				;$8080A8
	JSL.l CODE_BB856D			;$8080AB
	LDA.w #$001F				;$8080AF
	LDY.w #$0000				;$8080B2
	LDX.w #$0001				;$8080B5
	JSL.l CODE_BB856D			;$8080B8
	LDA.w #$000F				;$8080BC
	JSL.l set_PPU_registers_global		;$8080BF
	STP					;$8080C3

RESET_start:
;$8080C4
	SEI					;$8080C4
	LDA.b #$80				;$8080C5
	STA.w PPU.screen			;$8080C7
	LDA.b #$01				;$8080CA
	STA.w CPU.enable_interrupts		;$8080CC
	STA.w CPU.rom_speed			;$8080CF
	DEC					;$8080D2
	STA.w CPU.enable_hdma			;$8080D3
	CLC					;$8080D6
	XCE					;$8080D7
	REP.b #$30				;$8080D8
	TDC					;$8080DA
	ADC.w #$FFFF				;$8080DB
	BEQ.b .anti_piracy_test			;$8080DE
	BRL.w .prepare_anti_piracy		;$8080E0

.anti_piracy_test:
	TSX					;$8080E3
	LDA.w #RESET_start-$01			;$8080E4
	CMP.w $FFFF,x				;$8080E7
	BEQ.b .check_for_false_positive		;$8080EA
	LDY.w #$1FFD				;$8080EC
	SEP.b #$20				;$8080EF
.next_byte:
	LDA.w $0000,y				;$8080F1
	CMP.b #$4C				;$8080F4
	BEQ.b .jmp_test				;$8080F6
	CMP.b #$6C				;$8080F8
	BEQ.b .indirect_jmp_test		;$8080FA
	CMP.b #$60				;$8080FC
	BEQ.b .sequential_test			;$8080FE
.resume_scanning:
	DEY					;$808100
	BPL.b .next_byte			;$808101
	REP.b #$20				;$808103
	LDA.l sram_base				;$808105
	INC					;$808109
	STA.l sram_base				;$80810A
	CMP.l sram_base				;$80810E
	BNE.b .prepare_anti_piracy		;$808112
	DEC					;$808114
	STA.l sram_base				;$808115
	LDY.w #$0011				;$808119
	LDA.w PPU.status_ppu2			;$80811C
	AND.w #$0010				;$80811F
	BNE.b .prepare_message			;$808122
	BRA.b .final_piracy_test		;$808124

.jmp_test:
	REP.b #$20				;$808126
	LDA.w $0001,y				;$808128
	CMP.w #RESET_start			;$80812B
	BEQ.b .check_for_false_positive		;$80812E
	SEP.b #$20				;$808130
	BRA.b .resume_scanning			;$808132

.indirect_jmp_test:
	REP.b #$20				;$808134
	LDX.w $0001,y				;$808136
	BMI.b .address_rom			;$808139
	CPX.w #$2000				;$80813B
	BPL.b .invalid_address			;$80813E
.address_rom:
	LDA.w $0000,x				;$808140
	CMP.w #RESET_start			;$808143
	BEQ.b .check_for_false_positive		;$808146
.invalid_address:
	SEP.b #$20				;$808148
	BRA.b .resume_scanning			;$80814A

.sequential_test:
	TYX					;$80814C
.next_count:
	CMP.w $0000,x				;$80814D
	BNE.b .resume_scanning			;$808150
	INX					;$808152
	INC					;$808153
	BPL.b .next_count			;$808154
	REP.b #$20				;$808156
.check_for_false_positive:
	PHK					;$808158
	PLB					;$808159
	LDX.w #$0006				;$80815A
-:
	LDA.w piracy_string_result,x		;$80815D
	CMP.w rare_string,x			;$808160
	BNE.b .write_piracy_string		;$808163
	DEX					;$808165
	DEX					;$808166
	BPL.b -					;$808167
	BRA.b .prepare_logo			;$808169

.write_piracy_string:
	LDX.w #$0006				;$80816B
	LDY.w #$0004				;$80816E
.write_next_byte:
	LDA.w piracy_string,x			;$808171
	STA.w piracy_string_result,x		;$808174
	CMP.l sram_base,x			;$808177
	BNE +					;$80817B
	DEY					;$80817D
+:
	STA.l sram_base,x			;$80817E
	DEX					;$808182
	DEX					;$808183
	BPL.b .write_next_byte			;$808184
	TYA					;$808186
	BEQ.b .prepare_anti_piracy		;$808187
	LDY.w #$000F				;$808189
	BRA.b .prepare_message			;$80818C

.prepare_anti_piracy:
	LDY.w #$0010				;$80818E
.prepare_message:
	LDA.w #$0000				;$808191
	TCD					;$808194
	LDX.w #$01FF				;$808195
	TXS					;$808198
	%return(display_error_message)
	%return(clear_VRAM)	
	BRA.b init_registers			;$808199

.final_piracy_test:
	PHK					;$80819B
	PLB					;$80819C
	LDX.w #$0006				;$80819D
-:
	LDA.w piracy_string_result,x		;$8081A0
	CMP.w piracy_string,x			;$8081A3
	BNE.b .prepare_logo			;$8081A6
	DEX					;$8081A8
	DEX					;$8081A9
	BPL -					;$8081AA
	BRA .prepare_anti_piracy		;$8081AC

.prepare_logo:
	LDA.w #$0000				;$8081AE
	STA.l sram_base				;$8081B1
	LDX.w #stack				;$8081B5
	TXS					;$8081B8
	%return(start_engine)
	%return(clear_VRAM)
init_registers:
	SEP.b #$30				;$8081C5
	LDX.b #$00				;$8081C7
.clear_ppu:
	STZ.w $2101,x				;$8081C9
	STZ.w $2101,x				;$8081CC
	INX					;$8081CF
	CPX.b #$34				;$8081D0
	BNE.b .clear_ppu			;$8081D2
	LDX.b #$00				;$8081D4
.clear_cpu:
	STZ.w $4202,x				;$8081D6
	INX					;$8081D9
	CPX.b #$0B				;$8081DA
	BNE.b .clear_cpu			;$8081DC
	LDA.b #$8F				;$8081DE
	STA.w PPU.screen			;$8081E0
	LDA.b #$80				;$8081E3
	STA.w PPU.vram_control			;$8081E5
	STA.w PPU.set_mode_7			;$8081E8
	LDA.b #$01				;$8081EB
	STA.w CPU.rom_speed			;$8081ED
	STZ.w PPU.set_color_math		;$8081F0
	STZ.w PPU.video_mode			;$8081F3
	STZ.w CPU.enable_interrupts		;$8081F6
	LDA.b #$FF				;$8081F9
	STA.w CPU.output_port			;$8081FB
	LDA.b #$E0				;$8081FE
	STA.w PPU.fixed_color			;$808200
	LDA.b #$30				;$808203
	STA.w PPU.color_addition_logic		;$808205
	LDA.b #$00				;$808208
	STA.w PPU.mosaic			;$80820A
	STZ.w PPU.layer_1_scroll_x		;$80820D
	STZ.w PPU.layer_1_scroll_x		;$808210
	STZ.w PPU.layer_2_scroll_x		;$808213
	STZ.w PPU.layer_2_scroll_x		;$808216
	STZ.w PPU.layer_3_scroll_x		;$808219
	STZ.w PPU.layer_3_scroll_x		;$80821C
	LDA.b #$FF				;$80821F
	STA.w PPU.layer_1_scroll_y		;$808221
	STA.w PPU.layer_1_scroll_y		;$808224
	STA.w PPU.layer_2_scroll_y		;$808227
	STA.w PPU.layer_2_scroll_y		;$80822A
	STA.w PPU.layer_3_scroll_y		;$80822D
	STA.w PPU.layer_3_scroll_y		;$808230
	REP.b #$30				;$808233
	SEP.b #$20				;$808235
	LDX.w #$000A				;$808237
.clear_DMA:
	STZ.w DMA[$00].control,x		;$80823A
	STZ.w HDMA[$01].control,x		;$80823D
	STZ.w HDMA[$02].control,x		;$808240
	STZ.w HDMA[$03].control,x		;$808243
	STZ.w HDMA[$04].control,x		;$808246
	STZ.w HDMA[$05].control,x		;$808249
	STZ.w HDMA[$06].control,x		;$80824C
	STZ.w HDMA[$07].control,x		;$80824F
	DEX					;$808252
	BPL .clear_DMA				;$808253
	REP #$20				;$808255
	RTS					;$808257

init_registers_global:
	JSR.w init_registers			;$808258
	RTL					;$80825B

VRAM_zero_fill:
	dw $0000

clear_VRAM:
	STZ.w PPU.vram_address			;$80825E
	LDA.w #VRAM_zero_fill			;$808261
	STA.w DMA[$00].source_word		;$808264
	STA.w DMA[$00].unused_2			;$808267
	STZ.w DMA[$00].size			;$80826A
	LDA.w #$1809				;$80826D
	STA.w DMA[$00].settings			;$808270
	SEP.b #$20				;$808273
	LDA.b #VRAM_zero_fill>>16		;$808275
	STA.w DMA[$00].source_bank		;$808277
	LDA.b #$01				;$80827A
	STA.w CPU.enable_dma			;$80827C
	REP.b #$20				;$80827F
	RTS					;$808281

clear_vram_global:
	JSR.w clear_VRAM			;$808282
	RTL					;$808285

start_engine:
	LDX.w #$0006				;$808286
CODE_808289:
	LDA.w piracy_string_result,x		;$808289
	CMP.w rare_string,x			;$80828C
	BNE.b CODE_808295			;$80828F
	DEX					;$808291
	DEX					;$808292
	BPL.b CODE_808289			;$808293
CODE_808295:
	CPX.w #$8000				;$808295
	STZ.b active_frame_counter		;$808298
	LDX.w #$0000				;$80829A
	LDY.w #$0001				;$80829D
	LDA.w #$FFFF				;$8082A0
	MVN $7E,$7E				;$8082A3
	LDY.w #$0000				;$8082A6
	TYX					;$8082A9
	LDA.w #$FFFF				;$8082AA
	MVN $7F,$7E				;$8082AD
	PHK					;$8082B0
	PLB					;$8082B1
	TDC					;$8082B2
	ROL					;$8082B3
	STA.w $06AB				;$8082B4
	LDX.w #$0006				;$8082B7
CODE_8082BA:
	LDA.w rare_string,x			;$8082BA
	STA.w piracy_string_result,x		;$8082BD
	DEX					;$8082C0
	DEX					;$8082C1
	BPL.b CODE_8082BA			;$8082C2
	LDA.w #$3127				;$8082C4
	STA.b $02				;$8082C7
	STA.b $04				;$8082C9
	JSL.l upload_spc_engine			;$8082CB
	JSR.w CODE_80BBA6			;$8082CF
	LDA.w #$0004				;$8082D2
	TRB.w $06AB				;$8082D5
	TDC					;$8082D8
	SEP.b #$20				;$8082D9
	LDA.l $B06008				;$8082DB
	BPL.b CODE_8082E2			;$8082DF
	TDC					;$8082E1
CODE_8082E2:
	CMP.b #$03				;$8082E2
	BCC.b CODE_8082E7			;$8082E4
	TDC					;$8082E6
CODE_8082E7:
	REP #$20				;$8082E7
	STA.w language_select			;$8082E9
CODE_8082EC:
	LDA.w #$0000				;$8082EC
	TCD					;$8082EF
	LDX.w #stack				;$8082F0
	TXS					;$8082F3
	JSL.l disable_screen_wrapper		;$8082F4
	JSR.w init_registers			;$8082F8
	JSL.l CODE_808C77			;$8082FB
	STZ.w $04C8				;$8082FF
	LDA.w #$4000				;$808302
	STA.w $053B				;$808305
	LDA.w #$000F				;$808308
	STA.w $06CF				;$80830B
	JSR.w CODE_808EA8			;$80830E
	STZ.b $BA				;$808311
	LDX.w #CODE_B284D6			;$808313
	LDY.w #CODE_B284D6>>16			;$808316
	LDA.w #CODE_808370			;$808319
	STX.b $4E				;$80831C
	STY.b $50				;$80831E
	JMP.w CODE_80839D			;$808320

CODE_808323:
	LDA.w #$0001				;$808323
	STA.w CPU.enable_dma_hdma		;$808326
	BRA.b nmi_return			;$808329

CODE_80832B:
	PHK					;$80832B
	PEA.w nmi_return-$01			;$80832C
	JMP.w [$0052]				;$80832F

nmi_return:
	PLY					;$808332
	PLX					;$808333
	PLA					;$808334
	PLD					;$808335
	RTI					;$808336

CODE_808337:
	SEP.b #$20				;$808337
	LDA.l $0004EC				;$808339
	STA.l PPU.screen			;$80833D
	REP.b #$20				;$808341
	RTL					;$808343

CODE_808344:
	JSL.l fade_screen			;$808344
CODE_808348:
	LDA.w #stack				;$808348
	TCS					;$80834B
	PHK					;$80834C
	PLB					;$80834D
	LDA.w #CODE_80832B			;$80834E
	STA.b NMI_pointer			;$808351
	INC.b active_frame_counter		;$808353
	INC.b $C2				;$808355
	BNE.b CODE_80835F			;$808357
	INC.b $C4				;$808359
	BNE.b CODE_80835F			;$80835B
	DEC.b $C4				;$80835D
CODE_80835F:
	JMP.w [$004E]				;$80835F

CODE_808362:
	LDA.w #stack				;$808362
	TCS					;$808365
	LDA.w #CODE_80832B			;$808366
	STA.b NMI_pointer			;$808369
	INC.b active_frame_counter		;$80836B
	JMP.w [$004E]				;$80836D

CODE_808370:
	LDA.w #stack				;$808370
	TCS					;$808373
	LDA.w #CODE_80832B			;$808374
	STA.b NMI_pointer			;$808377
	INC.b active_frame_counter		;$808379
	INC.b $F4				;$80837B
	BNE.b CODE_808381			;$80837D
	INC.b $F6				;$80837F
CODE_808381:
	JMP.w [$004E]				;$808381

CODE_808384:
	JSR.w CODE_808C43			;$808384
CODE_808387:
	PHK					;$808387
	PLB					;$808388
	LDA.b $4C				;$808389
	STA.b NMI_pointer			;$80838B
	SEP.b #$20				;$80838D
	LDA.w CPU.nmi_flag			;$80838F
	LDA.b #$81				;$808392
	STA.w CPU.enable_interrupts		;$808394
	STZ.w joypad.port_0			;$808397
CODE_80839A:
	WAI					;$80839A
	BRA.b CODE_80839A			;$80839B

CODE_80839D:
	STA.b NMI_pointer			;$80839D
	STA.b $4C				;$80839F
	LDA.w #CODE_808337			;$8083A1
	STA.b $52				;$8083A4
	LDA.w #CODE_808337>>16			;$8083A6
	STA.b $54				;$8083A9
	SEP.b #$20				;$8083AB
	LDA.w CPU.irq_flag			;$8083AD
	LDA.w CPU.nmi_flag			;$8083B0
CODE_8083B3:
	LDA.w CPU.nmi_flag			;$8083B3
	BMI.b CODE_8083B3			;$8083B6
	LDA.b #$81				;$8083B8
	STA.w CPU.enable_interrupts		;$8083BA
	STZ.w joypad.port_0			;$8083BD
CODE_8083C0:
	WAI					;$8083C0
	BRA.b CODE_8083C0			;$8083C1

CODE_8083C3:
	PHK					;$8083C3
	PLB					;$8083C4
	STA.b $4E				;$8083C5
	STX.b $50				;$8083C7
	JMP.w CODE_808384			;$8083C9

CODE_8083CC:
	LDA.w #$01FF				;$8083CC
	TCS					;$8083CF
	LDA.w #CODE_80832B			;$8083D0
	STA.b $4A				;$8083D3
	LDA.w #$2000				;$8083D5
	BIT.w $05B1				;$8083D8
	BEQ.b CODE_8083FB			;$8083DB
	LDA.w #$0040				;$8083DD
	TSB.w $05AF				;$8083E0
	LDA.b $F4				;$8083E3
	CMP.w $053D				;$8083E5
	BCC.b CODE_80840A			;$8083E8
	LDA.w screen_brightness			;$8083EA
	AND.w #$FF00				;$8083ED
	BNE.b CODE_80840A			;$8083F0
	LDA.w #$810F				;$8083F2
	JSL.l set_fade				;$8083F5
	BRA.b CODE_80840A			;$8083F9

CODE_8083FB:
	LDA.b $F4				;$8083FB
	CMP.w $051D				;$8083FD
	BCC.b CODE_80840A			;$808400
	LDA.w #$0001				;$808402
	STA.w $1D89				;$808405
	STZ.b $F4				;$808408
CODE_80840A:
	INC.b active_frame_counter		;$80840A
	INC.b $F4				;$80840C
	JMP.w [$004E]				;$80840E

CODE_808411:
	LDX.w #$05AF				;$808411
	LDY.w #$00F3				;$808414
CODE_808417:
	STZ.b $00,x				;$808417
	INX					;$808419
	DEY					;$80841A
	BNE.b CODE_808417			;$80841B
	STZ.w $05BB				;$80841D
	STZ.w $05BD				;$808420
	STZ.w $05B7				;$808423
	LDA.w $053B				;$808426
	STA.w $06A1				;$808429
	LDA.w #!level_lakeside_limbo		;$80842C
	STA.b level_number			;$80842F
	STA.w parent_level_number		;$808431
	LDA.w #$0000				;$808434
	STA.w current_kong			;$808437
	STZ.w $05AF				;$80843A
	STZ.w $05B1				;$80843D
	STZ.b $C2				;$808440
	STZ.b $C4				;$808442
	JSR.w CODE_80912F			;$808444
	LDA.w #$0959				;$808447
	STA.w $0630				;$80844A
	LDA.w #$000C				;$80844D
	TSB.w $0615				;$808450
	LDA.w #$0010				;$808453
	TSB.w $0625				;$808456
	LDA.w #$0080				;$808459
	TSB.w $061B				;$80845C
	LDA.w #$0020				;$80845F
	TSB.w $0621				;$808462
	LDA.w #$0400				;$808465
	STA.w $0611				;$808468
	LDA.w #$0004				;$80846B
	STA.w $0613				;$80846E
	JSL.l CODE_B4800C			;$808471
	STZ.w $0523				;$808475
	LDA.w #$0004				;$808478
	STA.l $00052F				;$80847B
	LDA.w #$0002				;$80847F
	STA.l $000525				;$808482
	STZ.w $0527				;$808486
	LDA.w #$1D93				;$808489
	STA.w $0541				;$80848C
	STZ.w $0543				;$80848F
	RTL					;$808492

CODE_808493:
	PHK					;$808493
	PLB					;$808494
	LDA.w #CODE_808337			;$808495
	STA.b $52				;$808498
	LDA.w #CODE_808337>>16			;$80849A
	STA.b $54				;$80849D
	JSL.l CODE_BB8576			;$80849F
	PHK					;$8084A3
	PLB					;$8084A4
	LDA.w #$0200				;$8084A5
	JSL.l set_fade				;$8084A8
	SEP.b #$20				;$8084AC
	LDA.w $0773				;$8084AE
	STA.b $58				;$8084B1
	LDA.w $0771				;$8084B3
	STA.b $56				;$8084B6
	REP.b #$20				;$8084B8
	LDA.w #CODE_B38076			;$8084BA
	LDX.w #CODE_B38076>>16			;$8084BD
	STA.b $4E				;$8084C0
	STX.b $50				;$8084C2
	JMP.w CODE_808384			;$8084C4

CODE_8084C7:
	SEP.b #$20				;$8084C7
	STA.b $58				;$8084C9
	XBA					;$8084CB
	STA.b $56				;$8084CC
	REP.b #$20				;$8084CE
	LDA.w #CODE_B38076			;$8084D0
	LDX.w #CODE_B38076>>16			;$8084D3
	JMP.w CODE_8083C3			;$8084D6

CODE_8084D9:
	PHX					;$8084D9
	LDX.b current_sprite			;$8084DA
	LDA.b $0A,x				;$8084DC
	PLX					;$8084DE
	AND.w #$1F00				;$8084DF
	BEQ.b CODE_8084EB			;$8084E2
	LDA.w #$0008				;$8084E4
	JSL.l throw_exception			;$8084E7
CODE_8084EB:
	RTL					;$8084EB

throw_exception:
;$8084EC
	RTL					;$8084EC

CODE_8084ED:
	STA.l $001D49				;$8084ED
	LDA.w #$00B4				;$8084F1
	STA.l $001D4B				;$8084F4
	LDA.l $001D4D				;$8084F8
	STA.l $001D4F				;$8084FC
	RTL					;$808500

set_fade:
;$808501
	STZ.w screen_fade_speed			;$808501
	STA.w screen_brightness			;$808504
	RTL					;$808507

fade_screen:
;$808508
	SEP.b #$20				;$808508
	LDA.w $04ED				;$80850A
	BEQ.b .return				;$80850D
	BMI.b .fade_out				;$80850F
	INC.w $04EE				;$808511
	CMP.w $04EE				;$808514
	BNE.b .return				;$808517
	STZ.w $04EE				;$808519
	INC.w $04EC				;$80851C
	LDA.b #$0F				;$80851F
	CMP.w $04EC				;$808521
	BCS.b .return				;$808524
	STA.w $04EC				;$808526
	STZ.w $04ED				;$808529
	BRA.b .return				;$80852C

.fade_out:
	AND.b #$7F				;$80852E
	INC.w $04EE				;$808530
	CMP.w $04EE				;$808533
	BNE.b .return				;$808536
	STZ.w $04EE				;$808538
	DEC.w $04EC				;$80853B
	BMI.b .fade_finished			;$80853E
	BNE.b .return				;$808540
.fade_finished:
	STZ.w $04ED				;$808542
	STZ.w $04EC				;$808545
.return:
	REP.b #$20				;$808548
	LDA.w $1D89				;$80854A
	BNE.b CODE_808550			;$80854D
	RTL					;$80854F

CODE_808550:
	LDA.w #$0000				;$808550
	STA.l $00044A				;$808553
	LDA.w #$0778				;$808557
	JSL.l CODE_B28018			;$80855A
	SEP.b #$20				;$80855E
	LDA.b #$E0				;$808560
	STA.w PPU.fixed_color			;$808562
	REP.b #$20				;$808565
	LDA.w $04E4				;$808567
	AND.w #$1E01				;$80856A
	STA.w $04E4				;$80856D
	LDA.w #$0040				;$808570
	TSB.w $05AF				;$808573
	STZ.w $1D89				;$808576
	LDA.w #$8025				;$808579
	STA.w $1D8B				;$80857C
	LDA.w #$8078				;$80857F
	STA.w $1D8F				;$808582
	LDY.w #$026E				;$808585
	JSL.l CODE_BB8588			;$808588
	LDX.b alternate_sprite			;$80858C
	LDA.b $1E,x				;$80858E
	AND.w #$F1FF				;$808590
	ORA.w #$0C00				;$808593
	STA.b $1E,x				;$808596
	LDA level_number			;$808598
	CMP.w #!level_bosses_photo_album	;$80859A
	BNE.b CODE_8085A7			;$80859D
	LDA.b $16,x				;$80859F
	CLC					;$8085A1
	ADC.w #$0010				;$8085A2
	STA.b $16,x				;$8085A5
CODE_8085A7:
	LDA.w #$0C00				;$8085A7
	ORA.b $1E,x				;$8085AA
	STA.b $1E,x				;$8085AC
	LDA.w #$FFFF				;$8085AE
	STA.b $5E,x				;$8085B1
	PHB					;$8085B3
	PHK					;$8085B4
	PLB					;$8085B5
	LDA.w $05E3				;$8085B6
	ASL					;$8085B9
	ASL					;$8085BA
	ASL					;$8085BB
	TAX					;$8085BC
	LDY.w DATA_80C679,x			;$8085BD
	LDX.w #$FFFF				;$8085C0
	DEY					;$8085C3
CODE_8085C4:
	INX					;$8085C4
	INY					;$8085C5
	LDA.w $0000,y				;$8085C6
	AND.w #$00FF				;$8085C9
	STA.l $7EFFE0,x				;$8085CC
	BNE.b CODE_8085C4			;$8085D0
	INC.w $05E3				;$8085D2
	PLB					;$8085D5
	LDX.w #$01FE				;$8085D6
	LDA.w #$7FFF				;$8085D9
	STA.w $1D8D				;$8085DC
CODE_8085DF:
	STA.l $7E2F80,x				;$8085DF
	DEX					;$8085E3
	DEX					;$8085E4
	BPL.b CODE_8085DF			;$8085E5
	LDA.w #$0000				;$8085E7
	STA.w $1D91				;$8085EA
	LDX.w #$000E				;$8085ED
	LDA.w #$7E2F60				;$8085F0
	STA.b $42				;$8085F3
	LDA.w #$7E2F60>>16			;$8085F5
	STA.b $44				;$8085F8
	STA.b $48				;$8085FA
CODE_8085FC:
	TXY					;$8085FC
	LDA.w $073C,x				;$8085FD
	ASL					;$808600
	TAX					;$808601
	LDA.l DATA_FD3201,x			;$808602
	TYX					;$808606
	SEC					;$808607
	SBC.w #DATA_FD341B			;$808608
	CLC					;$80860B
	ADC.w #$317E				;$80860C
	STA.b $46				;$80860F
	JSR.w CODE_80865A			;$808611
	LDA.b $42				;$808614
	SEC					;$808616
	SBC.w #$0020				;$808617
	STA.b $42				;$80861A
	DEX					;$80861C
	DEX					;$80861D
	CPX.w #$0002				;$80861E
	BCS.b CODE_8085FC			;$808621
	LDX.w #$0200				;$808623
	LDA.l DATA_FD3201,x			;$808626
	DEC					;$80862A
	DEC					;$80862B
	STA.b $46				;$80862C
	LDA.w #DATA_FD341B>>16			;$80862E
	STA.b $48				;$808631
	LDA.w #$7E2F40				;$808633
	STA.b $42				;$808636
	JSR.w CODE_80865A			;$808638
	LDX.w #$0200				;$80863B
	LDA.l DATA_FD3201,x			;$80863E
	DEC					;$808642
	DEC					;$808643
	STA.b $46				;$808644
	LDA.w #DATA_FD341B>>16			;$808646
	STA.b $48				;$808649
	LDA.w #$7E2F60				;$80864B
	STA.b $42				;$80864E
	JSR.w CODE_80865A			;$808650
	LDA.w #$4000				;$808653
	TSB.w $05B1				;$808656
	RTL					;$808659

CODE_80865A:
	LDY.w #$001E				;$80865A
CODE_80865D:
	LDA.b [$46],y				;$80865D
	STA.b [$42],y				;$80865F
	DEY					;$808661
	DEY					;$808662
	BNE.b CODE_80865D			;$808663
	TYA					;$808665
	STA.b [$42],y				;$808666
	RTS					;$808668

CODE_808669:
	LDA.w #$1300				;$808669
	STA.b $80				;$80866C
	LDA.w $05E3				;$80866E
	ASL					;$808671
	ASL					;$808672
	ASL					;$808673
	TAX					;$808674
	LDA.l DATA_80C679+$02,x			;$808675
	PHA					;$808679
	AND.w #$1FFF				;$80867A
	TAY					;$80867D
	PLA					;$80867E
	BPL.b CODE_8086A0			;$80867F
	BIT.w #$2000				;$808681
	BEQ.b CODE_80868F			;$808684
	LDA.w #$0003				;$808686
	JSL.l CODE_BB85F7			;$808689
	BRA.b CODE_8086A4			;$80868D

CODE_80868F:
	BIT.w #$4000				;$80868F
	BEQ.b CODE_80869A			;$808692
	JSL.l CODE_BB85B8			;$808694
	BRA.b CODE_8086A4			;$808698

CODE_80869A:
	JSL.l CODE_BB85B5			;$80869A
	BRA.b CODE_8086A4			;$80869E

CODE_8086A0:
	JSL.l CODE_BB8585			;$8086A0
CODE_8086A4:
	STZ.w current_kong			;$8086A4
	LDX.b alternate_sprite			;$8086A7
	STX.w active_kong_sprite		;$8086A9
	LDA.w #$1480				;$8086AC
	CPX.w $0501				;$8086AF
	BEQ.b CODE_8086B7			;$8086B2
	LDA.w #$14D2				;$8086B4
CODE_8086B7:
	STA current_kong_control_variables	;$8086B7
	LDA.b $38,x				;$8086B9
	BMI.b CODE_8086BE			;$8086BB
	RTL					;$8086BD

CODE_8086BE:
	EOR.w #$FFFF				;$8086BE
	INC					;$8086C1
	JSL.l CODE_BB85E2			;$8086C2
	PHK					;$8086C6
	PLB					;$8086C7
	RTL					;$8086C8

CODE_8086C9:
	LDA.w $1D8B				;$8086C9
	BEQ.b CODE_8086D6			;$8086CC
	DEC.w $1D8B				;$8086CE
	BMI.b CODE_8086D6			;$8086D1
	STZ.w $1D8B				;$8086D3
CODE_8086D6:
	LDA.w $1D8F				;$8086D6
	BEQ.b CODE_8086E9			;$8086D9
	DEC.w $1D8F				;$8086DB
	DEC.w $1D8F				;$8086DE
	DEC.w $1D8F				;$8086E1
	BMI.b CODE_8086E9			;$8086E4
	STZ.w $1D8F				;$8086E6
CODE_8086E9:
	LDA.w #$7E2D80				;$8086E9
	STA.b $42				;$8086EC
	LDA.w #$7E2D80>>16			;$8086EE
	STA.b $44				;$8086F1
	STA.b $1C				;$8086F3
	LDA.w #$7E2F80				;$8086F5
	STA.b $1A				;$8086F8
	LDA.w $1D8B				;$8086FA
	CMP.w #$8020				;$8086FD
	BCC.b CODE_808705			;$808700
	LDA.w #$8020				;$808702
CODE_808705:
	AND.w #$003F				;$808705
	LDX.w $1D8D				;$808708
	LDY.w #$01FE				;$80870B
	JSL.l CODE_BBC80F			;$80870E
	LDA.w #$7E2F40				;$808712
	STA.b $42				;$808715
	LDA.w #$7E2F40>>16			;$808717
	STA.b $44				;$80871A
	STA.b $1C				;$80871C
	LDA.w #$7E3140				;$80871E
	STA.b $1A				;$808721
	LDA.w $1D8F				;$808723
	CMP.w #$8020				;$808726
	BCC.b CODE_80872E			;$808729
	LDA.w #$8020				;$80872B
CODE_80872E:
	AND.w #$003F				;$80872E
	LDX.w $1D91				;$808731
	LDY.w #$001E				;$808734
	JSL.l CODE_BBC80F			;$808737
	LDA.w #$0000				;$80873B
	STA.l $7E2F80				;$80873E
	LDA.w #CODE_808769>>16			;$808742
	STA.w $04F7				;$808745
	LDA.w #CODE_808769			;$808748
	STA.w $04F5				;$80874B
	LDY.b alternate_sprite			;$80874E
	STY.b current_sprite			;$808750
	LDA.w $0004,y				;$808752
	PHA					;$808755
	PLB					;$808756
	LDA.w $0002,y				;$808757
	PHA					;$80875A
	LDA.w $0006,y				;$80875B
	STA.b $6A				;$80875E
	LDA.w $0038,y				;$808760
	AND.w #$00FF				;$808763
	ASL					;$808766
	TAX					;$808767
	RTL					;$808768

CODE_808769:
	JSL.l CODE_B7800C			;$808769
	JSL.l CODE_B78000			;$80876D
	JSL.l CODE_80898C			;$808771
	JSR.w CODE_809741			;$808775
	BEQ.b CODE_80877B			;$808778
	RTL					;$80877A

CODE_80877B:
	LDA.w #$2000				;$80877B
	TRB.w $05B1				;$80877E
	STZ.b $F4				;$808781
	STZ.w $05BB				;$808783
	STZ.w $05BD				;$808786
	LDA.w #CODE_80B2C8			;$808789
	STA.b $4E				;$80878C
	LDA.w #CODE_80B2C8>>16			;$80878E
	STA.b $50				;$808791
	LDA.w #CODE_808362			;$808793
	JMP.w CODE_80839D			;$808796

CODE_808799:
	LDA.w $1D8B				;$808799
	BNE.b CODE_8087F9			;$80879C
	LDA.b $E6				;$80879E
	CMP.b $E8				;$8087A0
	BEQ.b CODE_8087D4			;$8087A2
	ASL					;$8087A4
	ASL					;$8087A5
	TAX					;$8087A6
	LDA.b $E6				;$8087A7
	INC					;$8087A9
	AND.w #$000F				;$8087AA
	STA.b $E6				;$8087AD
	LDA.w #$2200				;$8087AF
	STA.w DMA[$00].settings			;$8087B2
	LDA.w #$001E				;$8087B5
	STA.w DMA[$00].size			;$8087B8
	LDA.w $06FC,x				;$8087BB
	STA.w DMA[$00].source_word		;$8087BE
	LDA.w $06FE,x				;$8087C1
	SEP.b #$20				;$8087C4
	STA.w DMA[$00].source_bank		;$8087C6
	XBA					;$8087C9
	STA.w PPU.cgram_address			;$8087CA
	LDA.b #$01				;$8087CD
	STA.w CPU.enable_dma			;$8087CF
	REP.b #$20				;$8087D2
CODE_8087D4:
	RTL					;$8087D4

CODE_8087D5:
	JSL.l CODE_808799			;$8087D5
	LDA.b $E6				;$8087D9
	CMP.b $E8				;$8087DB
	BNE.b CODE_8087D5			;$8087DD
	RTL					;$8087DF

CODE_8087E0:
	STA.w DMA[$00].source_word		;$8087E0
	STY.w DMA[$00].size			;$8087E3
	LDA.w #$1801				;$8087E6
	STA.w DMA[$00].settings			;$8087E9
	SEP.b #$30				;$8087EC
	STX.w DMA[$00].source_bank		;$8087EE
	LDA.b #$01				;$8087F1
	STA.w CPU.enable_dma			;$8087F3
	REP.b #$30				;$8087F6
	RTL					;$8087F8

CODE_8087F9:
	LDA.w #$4000				;$8087F9
	TRB.w $05B1				;$8087FC
	BEQ.b CODE_808804			;$8087FF
	JSR.w CODE_80882A			;$808801
CODE_808804:
	LDA.w #$2200				;$808804
	STA.w DMA[$00].settings			;$808807
	LDA.w #$0200				;$80880A
	STA.w DMA[$00].size			;$80880D
	LDA.w #$7E2F80				;$808810
	STA.w DMA[$00].source_word		;$808813
	SEP.b #$20				;$808816
	LDA.b #$7E2F80>>16			;$808818
	STA.w DMA[$00].source_bank		;$80881A
	LDA.b #$00				;$80881D
	STA.w PPU.cgram_address			;$80881F
	LDA.b #$01				;$808822
	STA.w CPU.enable_dma			;$808824
	REP.b #$20				;$808827
	RTL					;$808829

CODE_80882A:
	LDA.w #$2000				;$80882A
	TSB.w $05B1				;$80882D
	LDA level_number			;$808830
	CMP.w #!level_brothers_bear_photo_album	;$808832
	BEQ.b CODE_808898			;$808835
	CMP.w #!level_bosses_photo_album	;$808837
	BEQ.b CODE_808898			;$80883A
	LDA.w #$CCCC				;$80883C
	STA.w PPU.set_window_layer_1_2		;$80883F
	STA.w PPU.set_window_layer_3_4		;$808842
	LDA.w #$0000				;$808845
	STA.w PPU.set_window_sprite_color	;$808848
	LDA.w #$1F1F				;$80884B
	STA.w PPU.window_masks			;$80884E
	LDA.w #$0030				;$808851
	STA.l $7EA15A				;$808854
	LDA.w #$0001				;$808858
	STA.l $7EA15B				;$80885B
	LDA.w #$0070				;$80885F
	STA.l $7EA15D				;$808862
	LDA.w #$BF40				;$808866
	STA.l $7EA15E				;$808869
	LDA.w #$0001				;$80886D
	STA.l $7EA160				;$808870
	STA.l $7EA161				;$808874
	SEP.b #$20				;$808878
	LDX.w #$2801				;$80887A
	STX.w HDMA[$07].settings		;$80887D
	LDX.w #$7EA15A				;$808880
	STX.w HDMA[$07].source_word		;$808883
	LDA.b #$7EA15A>>16			;$808886
	STA.w HDMA[$07].source_bank		;$808888
	STA.w HDMA[$07].indirect_source_bank	;$80888B
	REP.b #$20				;$80888E
	LDA.w #$8000				;$808890
	TSB.w $04E4				;$808893
	BRA.b CODE_80889E			;$808896

CODE_808898:
	LDA.w #$0017				;$808898
	STA.w PPU.screens			;$80889B
CODE_80889E:
	LDA.w #$1E80				;$80889E
	STA.w PPU.vram_address			;$8088A1
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088A4
	LDA.w #DATA_FC2F40+$C0			;$8088A7
	LDY.w #$0020				;$8088AA
	JSL.l CODE_8087E0			;$8088AD
	LDA.w #$1E90				;$8088B1
	STA.w PPU.vram_address			;$8088B4
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088B7
	LDA.w #DATA_FC2F40+$C0			;$8088BA
	LDY.w #$0020				;$8088BD
	JSL.l CODE_8087E0			;$8088C0
	LDA.w #$1F80				;$8088C4
	STA.w PPU.vram_address			;$8088C7
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088CA
	LDA.w #DATA_FC2F40+$C0			;$8088CD
	LDY.w #$0020				;$8088D0
	JSL.l CODE_8087E0			;$8088D3
	LDA.w #$1F90				;$8088D7
	STA.w PPU.vram_address			;$8088DA
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088DD
	LDA.w #DATA_FC2F40+$C0			;$8088E0
	LDY.w #$0020				;$8088E3
	JSL.l CODE_8087E0			;$8088E6
	LDA.w #$1EA0				;$8088EA
	STA.w PPU.vram_address			;$8088ED
	LDX.w #DATA_FC2F40>>16			;$8088F0
	LDA.w #DATA_FC2F40			;$8088F3
	LDY.w #$0060				;$8088F6
	JSL.l CODE_8087E0			;$8088F9
	LDA.w #$1ED0				;$8088FD
	STA.w PPU.vram_address			;$808900
	LDX.w #(DATA_FC2F40+$40)>>16		;$808903
	LDA.w #DATA_FC2F40+$40			;$808906
	LDY.w #$0060				;$808909
	JSL.l CODE_8087E0			;$80890C
	LDA.w #$1FA0				;$808910
	STA.w PPU.vram_address			;$808913
	LDX.w #(DATA_FC2F40+$A0)>>16		;$808916
	LDA.w #DATA_FC2F40+$A0			;$808919
	LDY.w #$0020				;$80891C
	JSL.l CODE_8087E0			;$80891F
	LDA.w #$1FB0				;$808923
	STA.w PPU.vram_address			;$808926
	LDX.w #(DATA_FC2F40+$80)>>16		;$808929
	LDA.w #DATA_FC2F40+$80			;$80892C
	LDY.w #$0020				;$80892F
	JSL.l CODE_8087E0			;$808932
	LDA.w #$1FC0				;$808936
	STA.w PPU.vram_address			;$808939
	LDX.w #(DATA_FC2F40+$80)>>16		;$80893C
	LDA.w #DATA_FC2F40+$80			;$80893F
	LDY.w #$0020				;$808942
	JSL.l CODE_8087E0			;$808945
	LDA.w #$1FD0				;$808949
	STA.w PPU.vram_address			;$80894C
	LDX.w #(DATA_FC2F40+$80)>>16		;$80894F
	LDA.w #DATA_FC2F40+$80			;$808952
	LDY.w #$0020				;$808955
	JSL.l CODE_8087E0			;$808958
	LDA.w #$1FF0				;$80895C
	STA.w PPU.vram_address			;$80895F
	LDX.w #(DATA_FC2F40+$80)>>16		;$808962
	LDA.w #DATA_FC2F40+$80			;$808965
	LDY.w #$0020				;$808968
	JSL.l CODE_8087E0			;$80896B
	LDA.w #$1FE0				;$80896F
	STA.w PPU.vram_address			;$808972
	LDX.w #(DATA_FC2F40+$60)>>16		;$808975
	LDA.w #DATA_FC2F40+$60			;$808978
	LDY.w #$0020				;$80897B
	JSL.l CODE_8087E0			;$80897E
	RTS					;$808982

set_all_oam_offscreen:
	LDA #oam_table				;$808983
	STA next_oam_slot			;$808986
	JSR set_unused_oam_offscreen		;$808988
	RTL					;$80898B

CODE_80898C:
	PHB					;$80898C
	JSR set_unused_oam_offscreen		;$80898D
	PLB					;$808990
	RTL					;$808991

set_unused_oam_offscreen:
	PHK					;$808992
	PLB					;$808993
	LDX next_oam_slot			;$808994
	CPX #$0400				;$808996
	BEQ .oam_full				;$808999
	LDA #$F0FF				;$80899B
.next_slot:
	STA $00,x				;$80899E
	INX					;$8089A0
	INX					;$8089A1
	INX					;$8089A2
	INX					;$8089A3
	CPX #$0400				;$8089A4
	BNE .next_slot				;$8089A7
.oam_full:
	RTS					;$8089A9

CODE_8089AA:
	CMP.w #$0001				;$8089AA
	BEQ.b CODE_8089C5			;$8089AD
	LDA.w CPU.port_0_data_1			;$8089AF
	TAX					;$8089B2
	EOR.w $04CA				;$8089B3
	AND.w CPU.port_0_data_1			;$8089B6
	STA.w $04CE				;$8089B9
	TXA					;$8089BC
	STA.w $04CA				;$8089BD
	JSR.w CODE_808DFA			;$8089C0
	BRA.b CODE_808A13			;$8089C3

CODE_8089C5:
	JSR.w CODE_808E29			;$8089C5
	BRA.b CODE_808A13			;$8089C8

CODE_8089CA:
	PHK					;$8089CA
	PLB					;$8089CB
	SEP.b #$20				;$8089CC
	LDA.b #$01				;$8089CE
CODE_8089D0:
	BIT.w CPU.ppu_status			;$8089D0
	BNE.b CODE_8089D0			;$8089D3
	REP.b #$20				;$8089D5
	LDA.w $0523				;$8089D7
	BNE.b CODE_8089AA			;$8089DA
	LDA.w CPU.port_0_data_1			;$8089DC
	TAX					;$8089DF
	EOR.w $04CA				;$8089E0
	AND.w CPU.port_0_data_1			;$8089E3
	STA.w $04CE				;$8089E6
	TXA					;$8089E9
	EOR.w $04CA				;$8089EA
	AND.w $04CA				;$8089ED
	STA.w $04D2				;$8089F0
	STX.w $04CA				;$8089F3
	LDA.w CPU.port_1_data_1			;$8089F6
	TAX					;$8089F9
	EOR.w $04CC				;$8089FA
	AND.w CPU.port_1_data_1			;$8089FD
	STA.w $04D0				;$808A00
	TXA					;$808A03
	EOR.w $04CC				;$808A04
	AND.w $04CC				;$808A07
	STA.w $04D4				;$808A0A
	STX.w $04CC				;$808A0D
	JSR.w CODE_808B28			;$808A10
CODE_808A13:
	LDA.w $04C4				;$808A13
	BEQ.b CODE_808A5B			;$808A16
	DEC					;$808A18
	BEQ.b CODE_808A3A			;$808A19
	LDA.w $04C6				;$808A1B
	ASL					;$808A1E
	TAX					;$808A1F
	LDA.w $04CA,x				;$808A20
	STA.w $04D6				;$808A23
	LDA.w $04CC,x				;$808A26
	STA.w $04D8				;$808A29
	LDA.w $04CE,x				;$808A2C
	STA.w $04DA				;$808A2F
	LDA.w $04D0,x				;$808A32
	STA.w $04DC				;$808A35
	BRA.b CODE_808A6D			;$808A38

CODE_808A3A:
	LDA.w $05B3				;$808A3A
	AND.w #$0002				;$808A3D
	TAX					;$808A40
	LDA.w $04CA,x				;$808A41
	STA.w $04D6				;$808A44
	LDA.w $04CC,x				;$808A47
	STA.w $04D8				;$808A4A
	LDA.w $04CE,x				;$808A4D
	STA.w $04DA				;$808A50
	LDA.w $04D0,x				;$808A53
	STA.w $04DC				;$808A56
	BRA.b CODE_808A6D			;$808A59

CODE_808A5B:
	LDA.w $04CA				;$808A5B
	STA.w $04D6				;$808A5E
	STZ.w $04D8				;$808A61
	LDA.w $04CE				;$808A64
	STA.w $04DA				;$808A67
	STZ.w $04DC				;$808A6A
CODE_808A6D:
	LDA.w $05AF				;$808A6D
	AND.w #$0040				;$808A70
	BNE.b CODE_808AE8			;$808A73
	LDA.w #$0010				;$808A75
	TRB.w $05B1				;$808A78
	BNE.b CODE_808ADC			;$808A7B
	LDA.w #$0200				;$808A7D
	TRB.w $05AF				;$808A80
	BEQ.b CODE_808AB5			;$808A83
	LDA.w $04D7				;$808A85
	AND.w #$0003				;$808A88
	ASL					;$808A8B
	TAX					;$808A8C
	LDA.l DATA_808B8B,x			;$808A8D
	EOR.w $04D6				;$808A91
	AND.w #$0300				;$808A94
	EOR.w $04D6				;$808A97
	STA.w $04D6				;$808A9A
	LDA.w $04DB				;$808A9D
	AND.w #$0003				;$808AA0
	ASL					;$808AA3
	TAX					;$808AA4
	LDA.l DATA_808B8B,x			;$808AA5
	EOR.w $04DA				;$808AA9
	AND.w #$0300				;$808AAC
	EOR.w $04DA				;$808AAF
	STA.w $04DA				;$808AB2
CODE_808AB5:
	LDA.w $05AF				;$808AB5
	AND.w #$0040				;$808AB8
	RTL					;$808ABB

CODE_808ABC:
	LDA.w screen_brightness			;$808ABC
	BEQ.b CODE_808AB5			;$808ABF
	CMP.w #$0100				;$808AC1
	BCS.b CODE_808AB5			;$808AC4
	JSR.w CODE_808B0B			;$808AC6
	LDA.w #$00FF				;$808AC9
	TRB.w $0430				;$808ACC
	STZ.w $0424				;$808ACF
	STZ.w $0426				;$808AD2
	LDA.w #$0040				;$808AD5
	TRB.w $05AF				;$808AD8
	RTL					;$808ADB

CODE_808ADC:
	LDA.w #$0040				;$808ADC
	TSB.w $05AF				;$808ADF
	STZ.w $1947				;$808AE2
	JSR.w CODE_808B0B			;$808AE5
CODE_808AE8:
	LDA.b $4C				;$808AE8
	CMP.w #CODE_8083CC			;$808AEA
	BEQ.b CODE_808AF7			;$808AED
	LDA.w $04DA				;$808AEF
	AND.w #$1000				;$808AF2
	BNE.b CODE_808ABC			;$808AF5
CODE_808AF7:
	LDA.b $C2				;$808AF7
	SEC					;$808AF9
	SBC.w #$0001				;$808AFA
	STA.b $C2				;$808AFD
	LDA.b $C4				;$808AFF
	SBC.w #$0000				;$808B01
	STA.b $C4				;$808B04
	JSR.w CODE_808B93			;$808B06
	BRA.b CODE_808AB5			;$808B09

;Play pause sound effects
CODE_808B0B:
	LDA #$072D				;$808B0B
	JSL CODE_B2801B				;$808B0E
	LDA #$062D				;$808B12
	JSL CODE_B2801B				;$808B15
	LDA #$052D				;$808B19
	JSL CODE_B2801B				;$808B1C
	LDA #$042D				;$808B20
	JSL CODE_B2801B				;$808B23
	RTS					;$808B27

CODE_808B28:
	STZ.b $1A				;$808B28
	LDA.w $04CA				;$808B2A
	AND.w #$0007				;$808B2D
	BEQ.b CODE_808B47			;$808B30
	SEP.b #$20				;$808B32
	LDY.w #$0010				;$808B34
CODE_808B37:
	LDA.w joypad.port_0			;$808B37
	DEY					;$808B3A
	BNE.b CODE_808B37			;$808B3B
	REP.b #$20				;$808B3D
	STZ.w $04CA				;$808B3F
	STZ.w $04CE				;$808B42
	BRA.b CODE_808B59			;$808B45

CODE_808B47:
	SEP.b #$20				;$808B47
	LDA.w joypad.port_0			;$808B49
	REP.b #$20				;$808B4C
	BIT.w #$0001				;$808B4E
	BNE.b CODE_808B59			;$808B51
	STZ.w $04CA				;$808B53
	STZ.w $04CE				;$808B56
CODE_808B59:
	LDA.w $04CC				;$808B59
	AND.w #$0007				;$808B5C
	BEQ.b CODE_808B76			;$808B5F
	SEP.b #$20				;$808B61
	LDY.w #$0010				;$808B63
CODE_808B66:
	LDA.w joypad.port_1			;$808B66
	DEY					;$808B69
	BNE.b CODE_808B66			;$808B6A
	REP.b #$20				;$808B6C
	STZ.w $04CC				;$808B6E
	STZ.w $04D0				;$808B71
	BRA.b CODE_808B88			;$808B74

CODE_808B76:
	SEP.b #$20				;$808B76
	LDA.w joypad.port_1			;$808B78
	REP.b #$20				;$808B7B
	BIT.w #$0001				;$808B7D
	BNE.b CODE_808B8A			;$808B80
	STZ.w $04CC				;$808B82
	STZ.w $04D0				;$808B85
CODE_808B88:
	INC.b $1A				;$808B88
CODE_808B8A:
	RTS					;$808B8A

DATA_808B8B:
	dw $0000,$0200,$0100,$0000

CODE_808B93:
	LDA.w $1947				;$808B93
	BNE.b CODE_808BDC			;$808B96
	LDA.w $04DA				;$808B98
	AND.w #$2000				;$808B9B
	BNE.b CODE_808BA4			;$808B9E
	LDA.w #$0040				;$808BA0
	RTS					;$808BA3

CODE_808BA4:
	LDX.w parent_level_number		;$808BA4
	LDA.w $0632,x				;$808BA7
	AND.w #$0002				;$808BAA
	BEQ.b CODE_808BD3			;$808BAD
	LDA.w $075C				;$808BAF
	CMP.w #$0001				;$808BB2
	BEQ.b CODE_808BC5			;$808BB5
	CMP.w #$0003				;$808BB7
	BEQ.b CODE_808BC5			;$808BBA
	CMP.w #$0006				;$808BBC
	BEQ.b CODE_808BC5			;$808BBF
	LDA.w #$0040				;$808BC1
	RTS					;$808BC4

CODE_808BC5:
	JSL.l CODE_B8807E			;$808BC5
	LDA.w #$FFFE				;$808BC9
	STA.w $195B				;$808BCC
	LDA.w #$0040				;$808BCF
	RTS					;$808BD2

CODE_808BD3:
	LDA.w #$0001				;$808BD3
	STA.w $1947				;$808BD6
	STZ.w $1949				;$808BD9
CODE_808BDC:
	LDA.w $1949				;$808BDC
	INC					;$808BDF
	BEQ.b CODE_808C31			;$808BE0
	LDA.w $1947				;$808BE2
	ASL					;$808BE5
	TAX					;$808BE6
	LDA.w $04D6				;$808BE7
	AND.w #$0030				;$808BEA
	CMP.w #$0030				;$808BED
	BNE.b CODE_808C2B			;$808BF0
	LDA.w $04DA				;$808BF2
	BEQ.b CODE_808C31			;$808BF5
	AND.l DATA_808C35-$02,x			;$808BF7
	BEQ.b CODE_808C2B			;$808BFB
	CMP.l DATA_808C35-$02,x			;$808BFD
	BEQ.b CODE_808C17			;$808C01
	ORA.w $1949				;$808C03
	AND.w $04D6				;$808C06
	CMP.l DATA_808C35-$02,x			;$808C09
	BEQ.b CODE_808C17			;$808C0D
	AND.w $04DA				;$808C0F
	STA.w $1949				;$808C12
	BRA.b CODE_808C31			;$808C15

CODE_808C17:
	AND.w $04DA				;$808C17
	STA.w $1949				;$808C1A
	INX					;$808C1D
	INX					;$808C1E
	INC.w $1947				;$808C1F
	LDA.l DATA_808C35-$02,x			;$808C22
	INC					;$808C26
	BEQ.b CODE_808BC5			;$808C27
	BRA.b CODE_808C31			;$808C29

CODE_808C2B:
	LDA.w #$FFFF				;$808C2B
	STA.w $1949				;$808C2E
CODE_808C31:
	LDA.w #$0040				;$808C31
	RTS					;$808C34

DATA_808C35:
	dw $2000,$8400,$0840,$2000,$FFFF

CODE_808C3F:
	JSR CODE_808C43				;$808C3F
	RTL					;$808C42

CODE_808C43:
	LDA.w #$0200				;$808C43
	STA.w DMA[$00].source_word		;$808C46
	STA.w DMA[$00].unused_2			;$808C49
	LDA.w #$0220				;$808C4C
	STA.w DMA[$00].size			;$808C4F
	LDA.w #$0400				;$808C52
	STA.w DMA[$00].settings			;$808C55
	SEP.b #$20				;$808C58
	STZ.w DMA[$00].source_bank		;$808C5A
	REP.b #$20				;$808C5D
	RTS					;$808C5F

CODE_808C60:
	LDA.b $02				;$808C60
	STA.b $1C				;$808C62
	ASL					;$808C64
	LDA.b $04				;$808C65
	ROL					;$808C67
	STA.b $1A				;$808C68
	LDA.b $03				;$808C6A
	EOR.b $1A				;$808C6C
	STA.b $02				;$808C6E
	LDA.b $1C				;$808C70
	STA.b $04				;$808C72
	LDA.b $02				;$808C74
	RTL					;$808C76

CODE_808C77:
	LDA.b $01,S				;$808C77
	INC					;$808C79
	STA.b $1A				;$808C7A
	LDA.b $03,S				;$808C7C
	STA.b $1C				;$808C7E
	LDX.w #$001F				;$808C80
	TXS					;$808C83
	INX					;$808C84
	LDY.w #$7E0020>>16			;$808C85
	LDA.w #$0683				;$808C88
	JSL.l CODE_808CEC			;$808C8B
	LDX.w #$7E06D8				;$808C8F
	LDY.w #$7E06D8>>16			;$808C92
	LDA.w #$F928				;$808C95
	JSL.l CODE_808CEC			;$808C98
	LDX.w #$7F0000				;$808C9C
	LDY.w #$7F0000>>16			;$808C9F
	LDA.w #$0000				;$808CA2
	JSL.l CODE_808CEC			;$808CA5
	LDX.w #$01FF				;$808CA9
	TXS					;$808CAC
	JMP.w [$001A]				;$808CAD

CODE_808CB0:
	PHB					;$808CB0
	PHK					;$808CB1
	PLB					;$808CB2
	STZ.w $044A				;$808CB3
	LDX.w #$7E00C6				;$808CB6
	LDY.w #$7E00C6>>16			;$808CB9
	LDA.w #$0034				;$808CBC
	JSL.l CODE_808CEC			;$808CBF
	LDX.w #$7E06D8				;$808CC3
	LDY.w #$7E06D8>>16			;$808CC6
	LDA.w #$16C3				;$808CC9
	JSL.l CODE_808CEC			;$808CCC
	LDX.w #$7E2D80				;$808CD0
	LDY.w #$7E2D80>>16			;$808CD3
	LDA.w #$D280				;$808CD6
	JSL.l CODE_808CEC			;$808CD9
	LDX.w #$7F0000				;$808CDD
	LDY.w #$7F0000>>16			;$808CE0
	LDA.w #$0000				;$808CE3
	JSL.l CODE_808CEC			;$808CE6
	PLB					;$808CEA
	RTL					;$808CEB

CODE_808CEC:
	STA.w DMA[$00].size			;$808CEC
	TXA					;$808CEF
	STA.w DMA[$00].source_word		;$808CF0
	TYA					;$808CF3
	SEP.b #$20				;$808CF4
	STA.w DMA[$00].source_bank		;$808CF6
	LDA.b #PPU.vram_read_low		;$808CF9
	STA.w DMA[$00].destination		;$808CFB
	LDA.b #$80				;$808CFE
	STA.w DMA[$00].control			;$808D00
	STA.w PPU.vram_control			;$808D03
	REP.b #$20				;$808D06
	LDA.w #$0001				;$808D08
	LDY.w #$0000				;$808D0B
	STY.w PPU.vram_address			;$808D0E
	LDX.w PPU.vram_read			;$808D11
	STY.w PPU.vram_address			;$808D14
	STY.w PPU.vram_write			;$808D17
	STY.w PPU.vram_address			;$808D1A
	SEP.b #$20				;$808D1D
	STA.w CPU.enable_dma			;$808D1F
	REP.b #$20				;$808D22
	STY.w PPU.vram_address			;$808D24
	STX.w PPU.vram_write			;$808D27
	RTL					;$808D2A

CODE_808D2B:
	STX.b $1A				;$808D2B
	ASL					;$808D2D
	ASL					;$808D2E
	ASL					;$808D2F
	ASL					;$808D30
	ORA.w #$0008				;$808D31
	TAY					;$808D34
CODE_808D35:
	LDX.w #$0008				;$808D35
	SEP.b #$20				;$808D38
CODE_808D3A:
	STY.w PPU.vram_address			;$808D3A
	LDA.w PPU.vram_read_low			;$808D3D
	ORA.w PPU.vram_read_high		;$808D40
	STY.w PPU.vram_address			;$808D43
	STA.w PPU.vram_write_low		;$808D46
	INY					;$808D49
	DEX					;$808D4A
	BNE.b CODE_808D3A			;$808D4B
	REP.b #$20				;$808D4D
	TYA					;$808D4F
	CLC					;$808D50
	ADC.w #$0008				;$808D51
	TAY					;$808D54
	DEC.b $1A				;$808D55
	BNE.b CODE_808D35			;$808D57
	RTL					;$808D59

CODE_808D5A:
	PHB					;$808D5A
	PEA.w (DATA_B4FCD2&$FF0000)>>8		;$808D5B
	PLB					;$808D5E
	PLB					;$808D5F
	PHX					;$808D60
	PHY					;$808D61
	PHA					;$808D62
	CMP.w #$0000				;$808D63
	BPL.b CODE_808D6B			;$808D66
	LDA.w #$0000				;$808D68
CODE_808D6B:
	SEP.b #$30				;$808D6B
	CPX.b #$00				;$808D6D
	BEQ.b CODE_808DD1			;$808D6F
	TAY					;$808D71
	LDA.w DATA_B4FCD2,x			;$808D72
	STA.w CPU.multiply_A			;$808D75
	STY.w CPU.multiply_B			;$808D78
	TYA					;$808D7B
	XBA					;$808D7C
	LDY.w CPU.multiply_result_high		;$808D7D
	STA.w CPU.multiply_B			;$808D80
	REP.b #$30				;$808D83
	TYA					;$808D85
	AND.w #$00FF				;$808D86
	CLC					;$808D89
	ADC.w CPU.multiply_result		;$808D8A
	STA.b $1A				;$808D8D
	PLA					;$808D8F
	SEP.b #$30				;$808D90
	TAY					;$808D92
	TXA					;$808D93
	EOR.b #$FF				;$808D94
	INC					;$808D96
	TAX					;$808D97
	LDA.w DATA_B4FCD2,x			;$808D98
	STA.w CPU.multiply_A			;$808D9B
	STY.w CPU.multiply_B			;$808D9E
	XBA					;$808DA1
	NOP					;$808DA2
	LDY.w CPU.multiply_result_high		;$808DA3
	STA.w CPU.multiply_B			;$808DA6
	TYA					;$808DA9
	REP.b #$30				;$808DAA
	AND.w #$00FF				;$808DAC
	CLC					;$808DAF
	ADC.w CPU.multiply_result		;$808DB0
	STA.b $1C				;$808DB3
CODE_808DB5:
	PLY					;$808DB5
	PLA					;$808DB6
	XBA					;$808DB7
	AND.w #$0003				;$808DB8
	BEQ.b CODE_808DDA			;$808DBB
	CMP.w #$0002				;$808DBD
	BEQ.b CODE_808DE0			;$808DC0
	CMP.w #$0003				;$808DC2
	BEQ.b CODE_808DEF			;$808DC5
	LDA.b $1A				;$808DC7
	LDX.b $1C				;$808DC9
	EOR.w #$FFFF				;$808DCB
	INC					;$808DCE
	BRA.b CODE_808DF8			;$808DCF

CODE_808DD1:
	REP.b #$30				;$808DD1
	STA.b $1C				;$808DD3
	STZ.b $1A				;$808DD5
	PLA					;$808DD7
	BRA.b CODE_808DB5			;$808DD8

CODE_808DDA:
	LDX.b $1A				;$808DDA
	LDA.b $1C				;$808DDC
	BRA.b CODE_808DF8			;$808DDE

CODE_808DE0:
	LDA.b $1A				;$808DE0
	EOR.w #$FFFF				;$808DE2
	INC					;$808DE5
	TAX					;$808DE6
	LDA.b $1C				;$808DE7
	EOR.w #$FFFF				;$808DE9
	INC					;$808DEC
	BRA.b CODE_808DF8			;$808DED

CODE_808DEF:
	LDA.b $1C				;$808DEF
	EOR.w #$FFFF				;$808DF1
	INC					;$808DF4
	TAX					;$808DF5
	LDA.b $1A				;$808DF6
CODE_808DF8:
	PLB					;$808DF8
	RTL					;$808DF9

CODE_808DFA:
	LDX.w $0525				;$808DFA
	CPX.w #$1000				;$808DFD
	BCC.b CODE_808E03			;$808E00
	RTS					;$808E02

CODE_808E03:
	LDA.w CPU.port_0_data_1			;$808E03
	CMP.l $FE8406,x				;$808E06
	BNE.b CODE_808E16			;$808E0A
	LDA.l $FE8408,x				;$808E0C
	INC					;$808E10
	STA.l $FE8408,x				;$808E11
	RTS					;$808E15

CODE_808E16:
	INX					;$808E16
	INX					;$808E17
	INX					;$808E18
	INX					;$808E19
	STA.l $FE8406,x				;$808E1A
	LDA.w #$0001				;$808E1E
	STA.l $FE8408,x				;$808E21
	STX.w $0525				;$808E25
	RTS					;$808E28

CODE_808E29:
	PHK					;$808E29
	PLB					;$808E2A
	LDA.w #$1000				;$808E2B
	BIT.w $05FD				;$808E2E
	BNE.b CODE_808E3B			;$808E31
	LDA.w CPU.port_0_data_1			;$808E33
	AND.w #$D000				;$808E36
	BNE.b CODE_808E88			;$808E39
CODE_808E3B:
	LDA.w $0525				;$808E3B
	CMP.w $052B				;$808E3E
	BPL.b CODE_808E94			;$808E41
	LDX.w $052D				;$808E43
	LDA.l DATA_FE8406,x			;$808E46
	STA.b $1E				;$808E4A
	LDA.w #DATA_FE8428>>16			;$808E4C
	STA.b $20				;$808E4F
	LDY.w $0525				;$808E51
	LDA.w $0527				;$808E54
	BNE.b CODE_808E69			;$808E57
	INY					;$808E59
	INY					;$808E5A
	INY					;$808E5B
	INY					;$808E5C
	STY.w $0525				;$808E5D
	INY					;$808E60
	INY					;$808E61
	LDA.b [$1E],y				;$808E62
	DEY					;$808E64
	DEY					;$808E65
	STA.w $0527				;$808E66
CODE_808E69:
	DEC.w $0527				;$808E69
	BPL.b CODE_808E71			;$808E6C
	STZ.w $0527				;$808E6E
CODE_808E71:
	LDA.b [$1E],y				;$808E71
	STA.b $1A				;$808E73
	TAX					;$808E75
	EOR.w $04CA				;$808E76
	AND.b $1A				;$808E79
	STA.w $04CE				;$808E7B
	STX.w $04CA				;$808E7E
	STA.w $04D0				;$808E81
	STX.w $04CC				;$808E84
	RTS					;$808E87

CODE_808E88:
	LDA.w #$FFFF				;$808E88
	STA.w $052F				;$808E8B
	LDA.w #$0002				;$808E8E
	TSB.w piracy_string_result		;$808E91
CODE_808E94:
	LDA.w #$0001				;$808E94
	TSB.w $05AF				;$808E97
	BNE.b CODE_808EA3			;$808E9A
	LDA.w #$810F				;$808E9C
	JSL.l set_fade				;$808E9F
CODE_808EA3:
	RTS					;$808EA3

CODE_808EA4:
	JSR.w CODE_808EA8			;$808EA4
	RTL					;$808EA7

CODE_808EA8:
	LDX.w $06CF				;$808EA8
	STX.w $06AD				;$808EAB
	SEP.b #$20				;$808EAE
CODE_808EB0:
	TXA					;$808EB0
	STA.w $06AF,x				;$808EB1
	DEX					;$808EB4
	BPL.b CODE_808EB0			;$808EB5
	REP.b #$20				;$808EB7
	RTS					;$808EB9

CODE_808EBA:
	JSR.w CODE_808EBE			;$808EBA
	RTL					;$808EBD

CODE_808EBE:
	JSL.l CODE_808C60			;$808EBE
	AND.w $06CF				;$808EC2
	TAX					;$808EC5
	LDA.w $06AF,x				;$808EC6
	BIT.w #$0080				;$808EC9
	BNE.b CODE_808EBE			;$808ECC
	ORA.w #$0080				;$808ECE
	STA.w $06AF,x				;$808ED1
	AND.w #$007F				;$808ED4
	TAY					;$808ED7
	DEC.w $06AD				;$808ED8
	BPL.b CODE_808EE3			;$808EDB
	JSR.w CODE_808EA8			;$808EDD
	TYA					;$808EE0
	SEC					;$808EE1
	RTS					;$808EE2

CODE_808EE3:
	CLC					;$808EE3
	TYA					;$808EE4
	RTS					;$808EE5

CODE_808EE6:
	LDA.w #$1000				;$808EE6
	BIT.w $05FD				;$808EE9
	BEQ.b CODE_808EF1			;$808EEC
	JMP.w CODE_8090C3			;$808EEE

CODE_808EF1:
	LDA.w #$8000				;$808EF1
	TSB.w $05AF				;$808EF4
	STZ.b current_animal_type		;$808EF7
	LDA.w #$0001				;$808EF9
	TRB.w $05AF				;$808EFC
	LDA.w #$0002				;$808EFF
	STA.w $0525				;$808F02
	STZ.w $0527				;$808F05
	DEC.w $052F				;$808F08
	BMI.b CODE_808F66			;$808F0B
	LDX.w $052F				;$808F0D
	LDA.w $06D1,x				;$808F10
	AND.w #$00FF				;$808F13
	ASL					;$808F16
	TAX					;$808F17
	STX.w $052D				;$808F18
	LDA.l DATA_FE8406,x			;$808F1B
	STA.b $1E				;$808F1F
	LDA.w #DATA_FE8428>>16			;$808F21
	STA.b $20				;$808F24
	LDY.w #$0000				;$808F26
	LDA.b [$1E]				;$808F29
	BPL.b CODE_808F33			;$808F2B
	AND.w #$7FFF				;$808F2D
	LDY.w #$0001				;$808F30
CODE_808F33:
	STY.w current_kong			;$808F33
	STA.w $052B				;$808F36
	LDY.w #$0002				;$808F39
	LDA.b [$1E],y				;$808F3C
	BMI.b CODE_808FA3			;$808F3E
	AND.w #$00FF				;$808F40
	STA.b level_number			;$808F43
	LDY.w #$0003				;$808F45
	LDA.b [$1E],y				;$808F48
	AND.w #$00FF				;$808F4A
	STA.w $05B7				;$808F4D
	LDA.w #$4000				;$808F50
	TSB.w $05AF				;$808F53
	LDA.w #CODE_808493			;$808F56
	STA.b $4E				;$808F59
	LDA.w #CODE_808493>>16			;$808F5B
	STA.b $50				;$808F5E
	LDA.w #CODE_808344			;$808F60
	JMP.w CODE_80839D			;$808F63

CODE_808F66:
	LDX.w $052F				;$808F66
	LDA.w #$0004				;$808F69
	STA.w $052F				;$808F6C
	STZ.w $0523				;$808F6F
	LDA.w #$0000				;$808F72
	STA.l $00044A				;$808F75
	CPX.w #$FFFE				;$808F79
	BEQ.b CODE_808F93			;$808F7C
	LDA.w #$0003				;$808F7E
	STA.b $BA				;$808F81
	LDX.w #CODE_B284D6			;$808F83
	LDY.w #CODE_B284D6>>16			;$808F86
	STX.b $4E				;$808F89
	STY.b $50				;$808F8B
	LDA.w #CODE_808370			;$808F8D
	JMP.w CODE_80839D			;$808F90

CODE_808F93:
	LDA.w #CODE_809489			;$808F93
	STA.b $4E				;$808F96
	LDX.w #CODE_809489>>16			;$808F98
	STX.b $50				;$808F9B
	LDA.w #CODE_808370			;$808F9D
	JMP.w CODE_80839D			;$808FA0

CODE_808FA3:
	CMP.w #$FFFF				;$808FA3
	BNE.b CODE_808FE5			;$808FA6
	LDA.w #$0002				;$808FA8
	STA.w map_node_number			;$808FAB
	STZ.w current_world			;$808FAE
	LDA.w #$0800				;$808FB1
	STA.w $0611				;$808FB4
	LDA.w #$0005				;$808FB7
	TSB.w $05FB				;$808FBA
	LDA.w #!vehicle_hovercraft		;$808FBD
	STA.w current_map_vehicle		;$808FC0
	LDA.w #$4000				;$808FC3
	TSB.w $05AF				;$808FC6
	LDA.w #$8002				;$808FC9
	STA.w $05E3				;$808FCC
	STZ.w $05ED				;$808FCF
	STZ.w $05EF				;$808FD2
	LDA.w #CODE_B48009			;$808FD5
	STA.b $4E				;$808FD8
	LDA.w #CODE_B48009>>16			;$808FDA
	STA.b $50				;$808FDD
	LDA.w #CODE_808344			;$808FDF
	JMP.w CODE_80839D			;$808FE2

CODE_808FE5:
	CMP.w #$FFFE				;$808FE5
	BNE.b CODE_80901E			;$808FE8
	LDA.w #$0003				;$808FEA
	STA.w map_node_number			;$808FED
	LDA.w #$0001				;$808FF0
	STA.w current_world			;$808FF3
	LDA.w #$0001				;$808FF6
	STA.w $0659				;$808FF9
	STA.w $0639				;$808FFC
	ORA.w #$003E				;$808FFF
	STA.w $0657				;$809002
	STA.w $065A				;$809005
	LDA.w #$4000				;$809008
	TSB.w $05AF				;$80900B
	LDA.w #CODE_B48009			;$80900E
	STA.b $4E				;$809011
	LDA.w #CODE_B48009>>16			;$809013
	STA.b $50				;$809016
	LDA.w #CODE_808344			;$809018
	JMP.w CODE_80839D			;$80901B

CODE_80901E:
	LDA.w #$040A				;$80901E
	STA.w $05E3				;$809021
	LDA.w #$4000				;$809024
	TSB.w $05AF				;$809027
	LDA.w #$8000				;$80902A
	TSB.w $061D				;$80902D
	LDA.w #CODE_B48000			;$809030
	STA.b $4E				;$809033
	LDA.w #CODE_B48000>>16			;$809035
	STA.b $50				;$809038
	LDA.w #CODE_808344			;$80903A
	JMP.w CODE_80839D			;$80903D

CODE_809040:
	LDA.w #!music_mama_bird_chase		;$809040
	JSL.l CODE_B28009			;$809043
	LDA.w #$1000				;$809047
	TSB.w $05FD				;$80904A
	LDA.w #$8000				;$80904D
	TSB.w $05AF				;$809050
	LDA.w #$0041				;$809053
	TRB.w $05AF				;$809056
	LDA.w #$0002				;$809059
	STA.w $0525				;$80905C
	STZ.w $0527				;$80905F
	LDX.w #$0020				;$809062
	STX.w $052D				;$809065
	LDA.l DATA_FE8406,x			;$809068
	STA.b $1E				;$80906C
	LDA.w #DATA_FE8428>>16			;$80906E
	STA.b $20				;$809071
	LDA.b [$1E]				;$809073
	AND.w #$7FFF				;$809075
	STA.w $052B				;$809078
	LDY.w #$0001				;$80907B
	STY.w current_kong			;$80907E
	LDA.w #$0002				;$809081
	STA.w map_node_number			;$809084
	STZ.w current_world			;$809087
	LDA.w #$0800				;$80908A
	STA.w $0611				;$80908D
	LDA.w #$0005				;$809090
	TSB.w $05FB				;$809093
	LDA.w #!vehicle_hovercraft		;$809096
	STA.w current_map_vehicle		;$809099
	LDA.w #$4000				;$80909C
	TRB.w $05AF				;$80909F
	LDA.w #$8002				;$8090A2
	STA.w $05E3				;$8090A5
	LDA.w #$0137				;$8090A8
	STA.w $05ED				;$8090AB
	LDA.w #$023D				;$8090AE
	STA.w $05EF				;$8090B1
	LDA.w #$0001				;$8090B4
	TSB.w $0696				;$8090B7
	LDA.w #CODE_B48009			;$8090BA
	LDX.w #CODE_B48009>>16			;$8090BD
	JMP.w CODE_8083C3			;$8090C0

CODE_8090C3:
	LDA.w #$0001				;$8090C3
	TRB.w $05AF				;$8090C6
	LDA.w #$1000				;$8090C9
	TRB.w $05FD				;$8090CC
	STZ.w $0523				;$8090CF
	LDA.w #!level_krool_hovercraft_ending	;$8090D2
	STA.b level_number			;$8090D5
	STA.w parent_level_number		;$8090D7
	STZ.w $05B7				;$8090DA
	LDA.w #$0563				;$8090DD
	JSL.l CODE_B28027			;$8090E0
	LDA.w #CODE_808348			;$8090E4
	STA.b $4A				;$8090E7
	STA.b $4C				;$8090E9
	LDA.w #CODE_808493			;$8090EB
	LDX.w #CODE_808493>>16			;$8090EE
	JMP.w CODE_8083C3			;$8090F1

CODE_8090F4:
	STZ.w $04C6				;$8090F4
	LDA.l $7E2AF9				;$8090F7
	AND.w #$0003				;$8090FB
	STA.w $04C4				;$8090FE
	CMP.w #!gamemode_2_player_contest	;$809101
	BEQ.b CODE_80911E			;$809104
	JSR.w CODE_8092F2			;$809106
CODE_809109:
	JSR.w CODE_80912F			;$809109
	STZ.w $04C6				;$80910C
	LDA.w #$C000				;$80910F
	TRB.w $053B				;$809112
	LDA.w $06A1				;$809115
	JSR.w CODE_8099B3			;$809118
	JMP.w CODE_8096C2			;$80911B

CODE_80911E:
	JSR.w CODE_8092F2			;$80911E
	JSR.w CODE_80939D			;$809121
	JSR.w CODE_8092F2			;$809124
	JSR.w CODE_80912F			;$809127
	JSR.w CODE_80939D			;$80912A
	BRA.b CODE_809109			;$80912D

CODE_80912F:
	LDX.w #$0005				;$80912F
	LDA.w #$0010				;$809132
	BIT.w $053B				;$809135
	BEQ.b CODE_80913D			;$809138
	LDX.w #$0032				;$80913A
CODE_80913D:
	STX.w $05D5				;$80913D
	RTS					;$809140

CODE_809141:
	LDY.w #$0004				;$809141
	LDA.b [$84],y				;$809144
	AND.w #$FFFE				;$809146
	CMP.w #$0052				;$809149
	BEQ.b CODE_809158			;$80914C
	CMP.w #$0152				;$80914E
	BEQ.b CODE_809158			;$809151
	CMP.w #$0252				;$809153
	BNE.b CODE_80916F			;$809156
CODE_809158:
	JSR.w CODE_809177			;$809158
	LDY.w #$0000				;$80915B
	LDA.b [$84],y				;$80915E
	CMP.b $3E				;$809160
	BNE.b CODE_80916F			;$809162
	LDY.w #$0002				;$809164
	LDA.b [$84],y				;$809167
	CMP.b $40				;$809169
	BNE.b CODE_80916F			;$80916B
	SEC					;$80916D
	RTS					;$80916E

CODE_80916F:
	CLC					;$80916F
	RTS					;$809170

;Look into
DATA_809171:
	dw $B06062,$B062EC,$B06576

CODE_809177:
	STZ.b $3E				;$809177
	STZ.b $40				;$809179
	LDY.w #$0006				;$80917B
CODE_80917E:
	LDA.b [$84],y				;$80917E
	CLC					;$809180
	ADC.b $3E				;$809181
	STA.b $3E				;$809183
	INY					;$809185
	INY					;$809186
	CPY.w #$028A				;$809187
	BNE.b CODE_80917E			;$80918A
	LDY.w #$0006				;$80918C
CODE_80918F:
	LDA.b [$84],y				;$80918F
	EOR.b $40				;$809191
	STA.b $40				;$809193
	INY					;$809195
	INY					;$809196
	CPY.w #$028A				;$809197
	BNE.b CODE_80918F			;$80919A
	LDA.b $3E				;$80919C
	BNE.b CODE_8091A2			;$80919E
	INC.b $3E				;$8091A0
CODE_8091A2:
	RTS					;$8091A2

CODE_8091A3:
	PHB					;$8091A3
	JSR.w CODE_8091A9			;$8091A4
	PLB					;$8091A7
	RTL					;$8091A8

CODE_8091A9:
	JSR CODE_80920D				;$8091A9
	JSR CODE_8091CB				;$8091AC
	RTS					;$8091AF

CODE_8091B0:
	LDA current_game_mode			;$8091B0
	CMP #$0002				;$8091B3
	BNE CODE_8091C4				;$8091B6
	JSR CODE_80939D				;$8091B8
	JSR CODE_80920D				;$8091BB
	JSR CODE_8091CB				;$8091BE
	JSR CODE_80939D				;$8091C1
CODE_8091C4:	
	JSR CODE_80920D				;$8091C4
	JSR CODE_8091CB				;$8091C7
	RTS					;$8091CA

CODE_8091CB:
	LDA.w $04C8				;$8091CB
	ASL					;$8091CE
	TAX					;$8091CF
	LDA.l DATA_809171,x			;$8091D0
	STA.b $1A				;$8091D4
	LDA.w #$B06062>>16			;$8091D6
	STA.b $1C				;$8091D9
	PEA.w (($7E2AF4&$FF0000)>>16)|((RESET_start&$FF0000)>>8)	;$8091DB
	PLB					;$8091DE
	LDY.w #$0288				;$8091DF
CODE_8091E2:
	LDA.w $7E2AF4,y				;$8091E2
	STA.b [$1A],y				;$8091E5
	DEY					;$8091E7
	BPL.b CODE_8091E2			;$8091E8
	PLB					;$8091EA
	RTS					;$8091EB

CODE_8091EC:
	LDA.w $04C8				;$8091EC
	ASL					;$8091EF
	TAX					;$8091F0
	LDA.l DATA_809171,x			;$8091F1
	STA.b $1A				;$8091F5
	LDA.w #$B06062>>16			;$8091F7
	STA.b $1C				;$8091FA
	PEA.w (($7E2AF4&$FF0000)>>16)|((RESET_start&$FF0000)>>8)	;$8091FC
	PLB					;$8091FF
	LDY.w #$0288				;$809200
CODE_809203:
	LDA.b [$1A],y				;$809203
	STA.w $7E2AF4,y				;$809205
	DEY					;$809208
	BPL.b CODE_809203			;$809209
	PLB					;$80920B
	RTS					;$80920C

CODE_80920D:
	LDA.w #$2AF4				;$80920D
	STA.b $84				;$809210
	LDA.w #$007E				;$809212
	STA.b $86				;$809215
	SEP.b #$20				;$809217
	LDA.w $04C4				;$809219
	LDY.w #$0005				;$80921C
	STA.b [$84],y				;$80921F
	LDA.w $04C6				;$809221
	AND.b #$01				;$809224
	ORA.b #$52				;$809226
	LDY.w #$0004				;$809228
	STA.b [$84],y				;$80922B
	REP.b #$20				;$80922D
	LDA.w $04C4				;$80922F
	CMP.w #!gamemode_2_player_contest	;$809232
	BNE.b CODE_809241			;$809235
	LDA.w $04C6				;$809237
	BEQ.b CODE_809241			;$80923A
	LDA.w #$0148				;$80923C
	BRA.b CODE_809244			;$80923F

CODE_809241:
	LDA.w #$0006				;$809241
CODE_809244:
	CLC					;$809244
	ADC.b $84				;$809245
	STA.b $D0				;$809247
	LDA.w #$0000				;$809249
	ADC.b $86				;$80924C
	STA.b $D2				;$80924E
	LDA.b $C2				;$809250
	LDY.w #$000A				;$809252
	STA.b [$D0],y				;$809255
	LDA.b $C4				;$809257
	INY					;$809259
	INY					;$80925A
	STA.b [$D0],y				;$80925B
	LDY.w #$0008				;$80925D
	LDX.w #$0008				;$809260
CODE_809263:
	LDA.w $05D9,x				;$809263
	STA.b [$D0],y				;$809266
	DEY					;$809268
	DEX					;$809269
	BPL.b CODE_809263			;$80926A
	JSR.w CODE_80B18E			;$80926C
	LDY.w #$000E				;$80926F
	SEP.b #$20				;$809272
	STA.b [$D0],y				;$809274
	REP.b #$20				;$809276
	LDA.w $05AF				;$809278
	LDY.w #$000F				;$80927B
	STA.b [$D0],y				;$80927E
	LDA.w $05B1				;$809280
	AND.w #$FFDF				;$809283
	INY					;$809286
	INY					;$809287
	STA.b [$D0],y				;$809288
	LDA.w $05C9				;$80928A
	LDY.w #$0013				;$80928D
	STA.b [$D0],y				;$809290
	LDA.w $05CB				;$809292
	INY					;$809295
	INY					;$809296
	STA.b [$D0],y				;$809297
	LDA.w $05CD				;$809299
	INY					;$80929C
	INY					;$80929D
	STA.b [$D0],y				;$80929E
	LDA.w $05CF				;$8092A0
	INY					;$8092A3
	INY					;$8092A4
	STA.b [$D0],y				;$8092A5
	LDA.w $05D1				;$8092A7
	INY					;$8092AA
	INY					;$8092AB
	STA.b [$D0],y				;$8092AC
	SEP.b #$20				;$8092AE
	LDY.w #$00DC				;$8092B0
	LDX.w #$00BF				;$8092B3
CODE_8092B6:
	LDA.w $05E3,x				;$8092B6
	STA.b [$D0],y				;$8092B9
	DEY					;$8092BB
	DEX					;$8092BC
	BPL.b CODE_8092B6			;$8092BD
	LDA.w language_select			;$8092BF
	LDY.w #$00DE				;$8092C2
	STA.b [$D0],y				;$8092C5
	LDA.w stereo_select			;$8092C7
	LDY.w #$00DF				;$8092CA
	STA.b [$D0],y				;$8092CD
	LDA.w current_kong			;$8092CF
	LDY.w #$00DD				;$8092D2
	STA.b [$D0],y				;$8092D5
	REP.b #$20				;$8092D7
	JSR.w CODE_809177			;$8092D9
	LDY.w #$0000				;$8092DC
	LDA.b $3E				;$8092DF
	STA.b [$84],y				;$8092E1
	LDY.w #$0002				;$8092E3
	LDA.b $40				;$8092E6
	STA.b [$84],y				;$8092E8
	RTS					;$8092EA

CODE_8092EB:
	JSR CODE_8091EC				;$8092EB
	JSR CODE_8092F2				;$8092EE
	RTL					;$8092F1

CODE_8092F2:
	LDA #$2AF4				;$8092F2
	STA $84					;$8092F5
	LDA #$007E				;$8092F7
	STA $86					;$8092FA
	LDA current_game_mode			;$8092FC
	CMP #$0002				;$8092FF
	BNE CODE_80930E				;$809302
	LDA $04C6				;$809304
	BEQ CODE_80930E				;$809307
	LDA #$0148				;$809309
	BRA CODE_809311				;$80930C

CODE_80930E:
	LDA.w #$0006				;$80930E
CODE_809311:
	CLC					;$809311
	ADC.b $84				;$809312
	STA.b $D0				;$809314
	LDA.w #$0000				;$809316
	ADC.b $86				;$809319
	STA.b $D2				;$80931B
	LDY.w #$000F				;$80931D
	LDA.b [$D0],y				;$809320
	STA.w $05AF				;$809322
	LDY.w #$0011				;$809325
	LDA.b [$D0],y				;$809328
	STA.w $05B1				;$80932A
	LDY.w #$000A				;$80932D
	LDA.b [$D0],y				;$809330
	STA.b $C2				;$809332
	INY					;$809334
	INY					;$809335
	LDA.b [$D0],y				;$809336
	STA.b $C4				;$809338
	LDY.w #$0008				;$80933A
	LDX.w #$0008				;$80933D
CODE_809340:
	LDA.b [$D0],y				;$809340
	STA.w $05D9,x				;$809342
	DEY					;$809345
	DEX					;$809346
	BPL.b CODE_809340			;$809347
	LDY.w #$0013				;$809349
	LDA.b [$D0],y				;$80934C
	STA.w $05C9				;$80934E
	INY					;$809351
	INY					;$809352
	LDA.b [$D0],y				;$809353
	STA.w $05CB				;$809355
	INY					;$809358
	INY					;$809359
	LDA.b [$D0],y				;$80935A
	STA.w $05CD				;$80935C
	INY					;$80935F
	INY					;$809360
	LDA.b [$D0],y				;$809361
	STA.w $05CF				;$809363
	INY					;$809366
	INY					;$809367
	LDA.b [$D0],y				;$809368
	STA.w $05D1				;$80936A
	SEP.b #$20				;$80936D
	LDY.w #$00DC				;$80936F
	LDX.w #$00BF				;$809372
CODE_809375:
	LDA.b [$D0],y				;$809375
	STA.w $05E3,x				;$809377
	DEY					;$80937A
	DEX					;$80937B
	BPL.b CODE_809375			;$80937C
	LDY.w #$00DE				;$80937E
	LDA.b [$D0],y				;$809381
	STA.w language_select			;$809383
	LDY.w #$00DF				;$809386
	LDA.b [$D0],y				;$809389
	STA.w stereo_select			;$80938B
	LDY.w #$00DD				;$80938E
	LDA.b [$D0],y				;$809391
	STA.w current_kong			;$809393
	REP.b #$20				;$809396
	RTS					;$809398

CODE_809399:
	JSR.w CODE_80939D			;$809399
	RTL					;$80939C

CODE_80939D:
	JSR.w CODE_8093C7			;$80939D
	LDA.w $04C6				;$8093A0
	EOR.w #$0001				;$8093A3
	STA.w $04C6				;$8093A6
	JSR.w CODE_8093FF			;$8093A9
	RTS					;$8093AC

CODE_8093AD:
	JSR.w CODE_8093C7			;$8093AD
	STZ.w $04C6				;$8093B0
	JSR.w CODE_8091EC			;$8093B3
	JSR.w CODE_8092F2			;$8093B6
	RTS					;$8093B9

CODE_8093BA:
	LDA.w #$0001				;$8093BA
	STA.w $04C6				;$8093BD
	JSR.w CODE_8091EC			;$8093C0
	JSR.w CODE_8092F2			;$8093C3
	RTS					;$8093C6

CODE_8093C7:
	LDA.w #$007E				;$8093C7
	STA.b $44				;$8093CA
	LDA.w #$2900				;$8093CC
	LDX.w $04C6				;$8093CF
	BEQ.b CODE_8093D8			;$8093D2
	CLC					;$8093D4
	ADC.w #$00FA				;$8093D5
CODE_8093D8:
	STA.b $42				;$8093D8
	SEP.b #$20				;$8093DA
	LDX.w #$0000				;$8093DC
	LDY.w #$0000				;$8093DF
CODE_8093E2:
	LDA.b $C0,x				;$8093E2
	STA.b [$42],y				;$8093E4
	INY					;$8093E6
	INX					;$8093E7
	CPX.w #$0006				;$8093E8
	BNE.b CODE_8093E2			;$8093EB
	LDX.w #$0000				;$8093ED
CODE_8093F0:
	LDA.w $05AF,x				;$8093F0
	STA.b [$42],y				;$8093F3
	INY					;$8093F5
	INX					;$8093F6
	CPX.w #$00F4				;$8093F7
	BNE.b CODE_8093F0			;$8093FA
	REP.b #$20				;$8093FC
	RTS					;$8093FE

CODE_8093FF:
	LDA.w #$007E				;$8093FF
	STA.b $44				;$809402
	LDA.w #$2900				;$809404
	LDX.w $04C6				;$809407
	BEQ.b CODE_809410			;$80940A
	CLC					;$80940C
	ADC.w #$00FA				;$80940D
CODE_809410:
	STA.b $42				;$809410
	SEP.b #$20				;$809412
	LDX.w #$0000				;$809414
	LDY.w #$0000				;$809417
CODE_80941A:
	LDA.b [$42],y				;$80941A
	STA.b $C0,x				;$80941C
	INY					;$80941E
	INX					;$80941F
	CPX.w #$0006				;$809420
	BNE.b CODE_80941A			;$809423
	LDX.w #$0000				;$809425
CODE_809428:
	LDA.b [$42],y				;$809428
	STA.w $05AF,x				;$80942A
	INY					;$80942D
	INX					;$80942E
	CPX.w #$00F4				;$80942F
	BNE.b CODE_809428			;$809432
	REP.b #$20				;$809434
	RTS					;$809436

CODE_809437:
	LDA #CODE_808337			;$809437
	STA $52					;$80943A
	LDA.w #CODE_808337>>16			;$80943C
	STA $54					;$80943F
	LDA #$1300				;$809441
	STA $80					;$809444
	JSL disable_screen_wrapper		;$809446
	JSL init_registers_global		;$80944A
	JSL CODE_808CB0				;$80944E
	JSL clear_vram_global			;$809452
	LDX #$7EA15A				;$809456
	LDY.w #$7EA15A>>16			;$809459
	LDA #$0660				;$80945C
	JSL CODE_808CEC				;$80945F
	JSL CODE_BB857F				;$809463
	LDA #$0200				;$809467
	STA DMA[$00].source_word		;$80946A
	STA DMA[$00].unused_2			;$80946D
	LDA #$0220				;$809470
	STA DMA[$00].size			;$809473
	LDA #$0400				;$809476
	STA DMA[$00].settings			;$809479
	SEP #$20				;$80947C
	STZ DMA[$00].source_bank		;$80947E
	LDA.b #$01				;$809481
	STA.w CPU.enable_dma			;$809483
	REP #$20				;$809486
	RTS					;$809488

CODE_809489:
	PHK					;$809489
	PLB					;$80948A
	JSR.w CODE_809437			;$80948B
	LDA.w #$0020				;$80948E
	TRB.w $05B1				;$809491
	BNE.b CODE_80949D			;$809494
	LDA.w #!music_crazy_calypso		;$809496
	JSL.l CODE_B28009			;$809499
CODE_80949D:
	SEP.b #$20				;$80949D
	LDA.l $B06009				;$80949F
	CMP.b #$01				;$8094A3
	BEQ.b CODE_8094A8			;$8094A5
	TDC					;$8094A7
CODE_8094A8:
	STA.w stereo_select			;$8094A8
	REP.b #$20				;$8094AB
	JSL.l CODE_808411			;$8094AD
	LDA.w #$000F				;$8094B1
	JSL.l CODE_BB859A			;$8094B4
	ORA.w #$3000				;$8094B8
	CLC					;$8094BB
	ADC.w #$01C0				;$8094BC
	STA.b $B4				;$8094BF
	LDA.w #$0001				;$8094C1
	STA.w $06D8				;$8094C4
	LDA.w #$0021				;$8094C7
	JSL.l vram_payload_handler_global	;$8094CA
	LDA.w #$001F				;$8094CE
	JSL.l set_PPU_registers_global		;$8094D1
	JSR.w CODE_80A7AA			;$8094D5
	LDA.w #$002F				;$8094D8
	LDX.w #$0020				;$8094DB
	LDY.w #$0000				;$8094DE
	JSL.l CODE_BB856D			;$8094E1
	JSR.w CODE_80957A			;$8094E5
	JSR.w CODE_809E3B			;$8094E8
	LDA.w $04C8				;$8094EB
	JSR.w CODE_809DD0			;$8094EE
	LDA.w #$1C41				;$8094F1
	STA.w $1C3F				;$8094F4
	LDX.w #$7EF000				;$8094F7
	LDY.w #$7EF000>>16			;$8094FA
	LDA.w #$0800				;$8094FD
	JSL.l CODE_808CEC			;$809500
	LDY.w #$000C				;$809504
	JSR.w CODE_809E1A			;$809507
	LDA.w #$5820				;$80950A
	STA.w $1CB0				;$80950D
	LDY.w #$024E				;$809510
	JSL.l CODE_BB85B5			;$809513
	LDA.w #$0001				;$809517
	STA.w $0740				;$80951A
	STA.w $0742				;$80951D
	LDA.w #$00C6				;$809520
	JSL.l CODE_BB859A			;$809523
	ORA.w #$1000				;$809527
	STA.w $1C81				;$80952A
	LDA.w #$00C7				;$80952D
	JSL.l CODE_BB859A			;$809530
	ORA.w #$3000				;$809534
	STA.w $1C8D				;$809537
	PHK					;$80953A
	PLB					;$80953B
	JSR.w CODE_809F4A			;$80953C
	JSR.w CODE_80A113			;$80953F
	STZ.w $0740				;$809542
	STZ.w $0742				;$809545
	LDA.w $04C8				;$809548
	STA.w $1C37				;$80954B
	JSR.w CODE_809709			;$80954E
	LDA.w #$0020				;$809551
	JSR.w CODE_80A3E9			;$809554
	STZ.w $04C6				;$809557
	JSL.l CODE_808799			;$80955A
	JSL.l CODE_808799			;$80955E
	JSL.l CODE_808799			;$809562
	JSL.l CODE_808799			;$809566
	LDA.w #$0200				;$80956A
	JSL.l set_fade				;$80956D
	LDA.w #CODE_809586			;$809571
	LDX.w #CODE_809586>>16			;$809574
	JMP.w CODE_8083C3			;$809577

CODE_80957A:
	STZ.b $1E				;$80957A
	LDA.w #$FFFF				;$80957C
	STA.b $20				;$80957F
	JSL.l CODE_B7802A			;$809581
	RTS					;$809585

CODE_809586:
	LDA.w $04E4				;$809586
	STA.w CPU.enable_dma_hdma		;$809589
	JSL.l CODE_B38006			;$80958C
	JSL.l CODE_808799			;$809590
	LDX.w #$7C00				;$809594
	STX.w PPU.vram_address			;$809597
	LDA.w #$7EF000				;$80959A
	STA.w DMA[$00].source_word		;$80959D
	STA.w DMA[$00].unused_2			;$8095A0
	LDA.w #$0700				;$8095A3
	STA.w DMA[$00].size			;$8095A6
	LDA.w #$1801				;$8095A9
	STA.w DMA[$00].settings			;$8095AC
	SEP.b #$20				;$8095AF
	LDA.b #$7EF000>>16			;$8095B1
	STA.w DMA[$00].source_bank		;$8095B3
	LDA.b #$01				;$8095B6
	STA.w CPU.enable_dma			;$8095B8
	REP.b #$20				;$8095BB
	JSR.w CODE_809FF8			;$8095BD
	SEP.b #$20				;$8095C0
	LDA.w screen_brightness			;$8095C2
	STA.w PPU.screen			;$8095C5
	REP.b #$20				;$8095C8
	STZ.w $1560				;$8095CA
	STZ.w $155E				;$8095CD
	JSL.l CODE_808C60			;$8095D0
	LDA.w $1C35				;$8095D4
	BIT.w #$4000				;$8095D7
	BNE.b CODE_8095E0			;$8095DA
	JSL.l CODE_8089CA			;$8095DC
CODE_8095E0:
	LDA.w $1C35				;$8095E0
	BIT.w #$0006				;$8095E3
	BNE.b CODE_809600			;$8095E6
	LDA.w $04D6				;$8095E8
	BEQ.b CODE_8095EF			;$8095EB
	STZ.b $F4				;$8095ED
CODE_8095EF:
	LDA.b $F4				;$8095EF
	CMP.w #$0E10				;$8095F1
	BCC.b CODE_809600			;$8095F4
	JSL.l CODE_B8807E			;$8095F6
	LDA.w #$0008				;$8095FA
	TSB.w $1C35				;$8095FD
CODE_809600:
	JSL.l CODE_B7800C			;$809600
	JSL.l sprite_handler			;$809604
	LDA.w $1C3D				;$809608
	BMI.b CODE_809614			;$80960B
	BEQ.b CODE_809629			;$80960D
	DEC.w $1C3D				;$80960F
	BEQ.b CODE_80961B			;$809612
CODE_809614:
	LDA.b active_frame_counter		;$809614
	BIT.w #$0008				;$809616
	BNE.b CODE_809623			;$809619
CODE_80961B:
	LDA.w $1C37				;$80961B
	JSR.w CODE_809DE3			;$80961E
	BRA.b CODE_809629			;$809621

CODE_809623:
	LDA.w $1C37				;$809623
	JSR.w CODE_809DB7			;$809626
CODE_809629:
	JSL.l CODE_B6804B			;$809629
	JSL.l CODE_B7800F			;$80962D
	JSR.w CODE_80A08F			;$809631
	LDA.w #$0080				;$809634
	BIT.w $1C35				;$809637
	BEQ.b CODE_809647			;$80963A
	LDA.w $1C91				;$80963C
	CMP.w #$0005				;$80963F
	BCS.b CODE_809647			;$809642
	JSR.w CODE_80A608			;$809644
CODE_809647:
	LDA.w #$1000				;$809647
	BIT.w $1C35				;$80964A
	BNE.b CODE_809652			;$80964D
	JSR.w CODE_80A465			;$80964F
CODE_809652:
	JSL.l CODE_80898C			;$809652
	JSR.w CODE_809741			;$809656
	BEQ.b CODE_80966E			;$809659
	LDA.w $1C87				;$80965B
	BEQ.b CODE_80966B			;$80965E
	DEC.w $1C87				;$809660
	BNE.b CODE_80966B			;$809663
	LDA.w #$4000				;$809665
	TRB.w $1C35				;$809668
CODE_80966B:
	JMP.w CODE_808384			;$80966B

CODE_80966E:
	LDA.w #$0001				;$80966E
	TRB.w $05AF				;$809671
	LDA.w #$0001				;$809674
	TRB.w $1C35				;$809677
	BNE.b CODE_80969A			;$80967A
	LDA.w #$0008				;$80967C
	TRB.w $1C35				;$80967F
	BNE.b CODE_8096AE			;$809682
	LDA.w #$0020				;$809684
	TRB.w $1C35				;$809687
	BNE.b CODE_8096D2			;$80968A
	LDA.w #$2000				;$80968C
	BIT.w $1C35				;$80968F
	BNE.b CODE_8096BF			;$809692
	JSR.w CODE_8091EC			;$809694
	JMP.w CODE_8090F4			;$809697

CODE_80969A:
	LDA.w #$0002				;$80969A
	TRB.w piracy_string_result		;$80969D
	LDA.w #$0001				;$8096A0
	STA.b $BA				;$8096A3
	LDA.w #CODE_80B593			;$8096A5
	LDX.w #CODE_80B593>>16			;$8096A8
	JMP.w CODE_8083C3			;$8096AB

CODE_8096AE:
	STZ.b $BA				;$8096AE
	LDA.w #$0002				;$8096B0
	TRB.w piracy_string_result		;$8096B3
	LDA.w #CODE_B284D6			;$8096B6
	LDX.w #CODE_B284D6>>16			;$8096B9
	JMP.w CODE_8083C3			;$8096BC

CODE_8096BF:
	JSR.w CODE_8091B0			;$8096BF
CODE_8096C2:
	LDA.w #CODE_B48009			;$8096C2
	STA.b $4E				;$8096C5
	LDX.w #CODE_B48009>>16			;$8096C7
	STX.b $50				;$8096CA
	LDA.w #CODE_808362			;$8096CC
	JMP.w CODE_80839D			;$8096CF

CODE_8096D2:
	LDA.w $1C37				;$8096D2
	STA.w $04C8				;$8096D5
	JSR.w CODE_8091EC			;$8096D8
	STZ.w $04C6				;$8096DB
	LDA.l $7E2AF9				;$8096DE
	AND.w #$0003				;$8096E2
	STA.w $04C4				;$8096E5
	JSR.w CODE_8092F2			;$8096E8
	JSR.w CODE_80939D			;$8096EB
	JSR.w CODE_8092F2			;$8096EE
	JSR.w CODE_80939D			;$8096F1
	LDA.w #CODE_80AE3E			;$8096F4
	LDX.w #CODE_80AE3E>>16			;$8096F7
	JMP.w CODE_8083C3			;$8096FA

CODE_8096FD:
	LDA.w #$0003				;$8096FD
CODE_809700:
	JSR.w CODE_809DB7			;$809700
	LDY.w #$000C				;$809703
	JSR.w CODE_809E0F			;$809706
CODE_809709:
	LDA.w $1CB0				;$809709
	AND.w #$0FFF				;$80970C
	ORA.w #$5000				;$80970F
	STA.w $1CB0				;$809712
	JSR.w CODE_809F92			;$809715
	LDA.w #$0003				;$809718
	STA.w $1C39				;$80971B
	LDA.w #$0000				;$80971E
	STA.w $1C3B				;$809721
	STZ.w $1C3D				;$809724
	LDA.w #$FFFF				;$809727
	STA.w $1C89				;$80972A
	LDA.w $1C37				;$80972D
	RTS					;$809730

CODE_809731:
	LDA.w $1C37				;$809731
CODE_809734:
	ASL					;$809734
	TAY					;$809735
	LDA.w DATA_809171,y			;$809736
	STA.b $84				;$809739
	LDA.w #$B06062>>16			;$80973B
	STA.b $86				;$80973E
	RTS					;$809740

CODE_809741:
	JSL fade_screen				;$809741
	LDA screen_brightness			;$809745
	BNE CODE_80974D				;$809748
	CMP screen_fade_speed			;$80974A
CODE_80974D:
	RTS					;$80974D

file_select_menu_main:
	LDA.w #$0004				;$80974E
	TSB.w $1C35				;$809751
	LDA.w #$4000				;$809754
	BIT.w $1C35				;$809757
	BNE.b CODE_80975F			;$80975A
	JSR.w (DATA_809762,x)			;$80975C
CODE_80975F:
	JML [$04F5]				;$80975F

DATA_809762:
	dw CODE_809C9F
	dw CODE_809857
	dw CODE_809884
	dw CODE_809947
	dw CODE_809ABD
	dw CODE_809ACE
	dw CODE_809BA2
	dw CODE_809782
	dw CODE_8097B9
	dw CODE_8097E3
	dw CODE_809804
	dw CODE_80983B
	dw CODE_809B38
	dw CODE_809C0A
	dw CODE_809953
	dw CODE_80996E

CODE_809782:
	LDA.w #$000A				;$809782
	STA.w $1C3B				;$809785
	STZ.w $1C37				;$809788
	LDA.w #$0002				;$80978B
	STA.w $1C39				;$80978E
	LDA.w #$FFFF				;$809791
	STA.w $1C3D				;$809794
	TYX					;$809797
	STZ.b $38,x				;$809798
	LDA.w #$0666				;$80979A
	JSL.l CODE_B28012			;$80979D
	LDA.w #$C000				;$8097A1
	EOR.w $1CB0				;$8097A4
	STA.w $1CB0				;$8097A7
	LDA.w #$1000				;$8097AA
	STA.b $38				;$8097AD
	JSR.w CODE_809FA3			;$8097AF
	LDY.w #$001A				;$8097B2
	JSR.w CODE_809E0F			;$8097B5
	RTS					;$8097B8

CODE_8097B9:
	TYX					;$8097B9
	STZ.b $38,x				;$8097BA
	JSR.w CODE_809731			;$8097BC
	LDY.w #$0000				;$8097BF
	LDA.b [$84],y				;$8097C2
	BEQ.b CODE_8097E0			;$8097C4
	LDA.w $1C37				;$8097C6
	STA.w $1C89				;$8097C9
	LDA.w #$000D				;$8097CC
	STA.w $1C3B				;$8097CF
	LDA.w #$0666				;$8097D2
	JSL.l CODE_B28012			;$8097D5
	LDY.w #$001C				;$8097D9
	JSR.w CODE_809E0F			;$8097DC
	RTS					;$8097DF

CODE_8097E0:
	JMP.w CODE_80A3D8			;$8097E0

CODE_8097E3:
	TYX					;$8097E3
	STZ.b $38,x				;$8097E4
	JSR.w CODE_809731			;$8097E6
	LDY.w #$0000				;$8097E9
	LDA.b [$84],y				;$8097EC
	BNE.b CODE_809801			;$8097EE
	JSR.w CODE_80A3F4			;$8097F0
	JSR.w CODE_8096FD			;$8097F3
	JSR.w CODE_809DD0			;$8097F6
	LDA.w #$0666				;$8097F9
	JSL.l CODE_B28018			;$8097FC
	RTS					;$809800

CODE_809801:
	JMP.w CODE_80A3D8			;$809801

CODE_809804:
	LDA.w #$0007				;$809804
	STA.w $1C3B				;$809807
	STZ.w $1C37				;$80980A
	LDA.w #$0002				;$80980D
	STA.w $1C39				;$809810
	LDA.w #$FFFF				;$809813
	STA.w $1C3D				;$809816
	TYX					;$809819
	STZ.b $38,x				;$80981A
	LDA.w #$3000				;$80981C
	EOR.w $1CB0				;$80981F
	STA.w $1CB0				;$809822
	LDA.w #$1000				;$809825
	STA.b $38				;$809828
	JSR.w CODE_809FBF			;$80982A
	LDA.w #$0666				;$80982D
	JSL.l CODE_B28012			;$809830
	LDY.w #$0018				;$809834
	JSR.w CODE_809E0F			;$809837
	RTS					;$80983A

CODE_80983B:
	TYX					;$80983B
	STZ.b $38,x				;$80983C
	JSR.w CODE_80A3C3			;$80983E
	BCC.b CODE_809856			;$809841
	JSR.w CODE_8096FD			;$809843
	JSR.w CODE_809DD0			;$809846
	JSR.w CODE_809731			;$809849
	JSR.w CODE_80A1AA			;$80984C
	LDA.w #$0666				;$80984F
	JSL.l CODE_B28018			;$809852
CODE_809856:
	RTS					;$809856

CODE_809857:
	LDA.w $1C37				;$809857
	STA.w $04C8				;$80985A
	TYX					;$80985D
	JSR.w CODE_809731			;$80985E
	LDY.w #$0000				;$809861
	LDA.b [$84],y				;$809864
	BEQ.b CODE_809875			;$809866
	LDA.w #$4200				;$809868
	TSB.w $1C35				;$80986B
	LDA.w $1C37				;$80986E
	JSR.w CODE_809DB7			;$809871
	RTS					;$809874

CODE_809875:
	LDA.w #$0666				;$809875
	JSL.l CODE_B28012			;$809878
	INC.b $38,x				;$80987C
	LDY.w #$0016				;$80987E
	JSR.w CODE_809E0F			;$809881
CODE_809884:
	LDA.w #$1000				;$809884
	TSB.w $1C35				;$809887
	BNE.b CODE_8098F2			;$80988A
	LDY.w #$0252				;$80988C
	JSL.l CODE_BB85B8			;$80988F
	STZ.w $1C3B				;$809893
	LDA.w #$00CA				;$809896
	JSL.l CODE_BB859A			;$809899
	STA.w $1CA8				;$80989D
	LDA.w #$00CB				;$8098A0
	JSL.l CODE_BB859A			;$8098A3
	STA.w $1CAC				;$8098A7
	LDA.w #$001E				;$8098AA
	STA.w $1C3D				;$8098AD
	LDA.w #$0002				;$8098B0
	STA.w $1C83				;$8098B3
CODE_8098B6:
	LDY.w #$024C				;$8098B6
	JSL.l CODE_BB8585			;$8098B9
	LDX.b alternate_sprite			;$8098BD
	LDA.b $1E,x				;$8098BF
	AND.w #$0E00				;$8098C1
	STA.w $1CAA				;$8098C4
	LDA.b $26,x				;$8098C7
	AND.w #$0E00				;$8098C9
	STA.w $1CA6				;$8098CC
	LDA.w $1C37				;$8098CF
	ASL					;$8098D2
	TAY					;$8098D3
	LDA.w DATA_80C322,y			;$8098D4
	STA.b $16,x				;$8098D7
	LDA.w $1C83				;$8098D9
	STA.b $5C,x				;$8098DC
	STA.b $6A,x				;$8098DE
	LDA.w #$0120				;$8098E0
	STA.b $12,x				;$8098E3
	LDA.w #$0002				;$8098E5
	STA.b $38,x				;$8098E8
	DEC.w $1C83				;$8098EA
	BPL.b CODE_8098B6			;$8098ED
	JSR.w CODE_80A2DE			;$8098EF
CODE_8098F2:
	LDA.w #$4000				;$8098F2
	BIT.w $1C35				;$8098F5
	BNE.b CODE_809946			;$8098F8
	LDA.w $04CE				;$8098FA
	BIT.w #$0200				;$8098FD
	BEQ.b CODE_809912			;$809900
	LDA.w $1C8F				;$809902
	DEC					;$809905
	BPL.b CODE_80990B			;$809906
	LDA.w #$0002				;$809908
CODE_80990B:
	STA.w $1C8F				;$80990B
	STA.w $1C3B				;$80990E
	RTS					;$809911

CODE_809912:
	BIT.w #$0100				;$809912
	BEQ.b CODE_80992A			;$809915
	LDA.w $1C8F				;$809917
	INC					;$80991A
	CMP.w #$0003				;$80991B
	BCC.b CODE_809923			;$80991E
	LDA.w #$0000				;$809920
CODE_809923:
	STA.w $1C8F				;$809923
	STA.w $1C3B				;$809926
	RTS					;$809929

CODE_80992A:
	BIT.w #$9080				;$80992A
	BEQ.b CODE_809946			;$80992D
	LDX.b current_sprite			;$80992F
	INC.b $38,x				;$809931
	LDA.w #$0080				;$809933
	TSB.w $1C35				;$809936
	LDY.w #$0250				;$809939
	JSL.l CODE_BB85B5			;$80993C
	LDA.w $1C8F				;$809940
	STA.w $04C4				;$809943
CODE_809946:
	RTS					;$809946

CODE_809947:
	LDA.w #$0040				;$809947
	TRB.w $1C35				;$80994A
	BEQ.b CODE_809952			;$80994D
	TYX					;$80994F
	INC.b $38,x				;$809950
CODE_809952:
	RTS					;$809952

CODE_809953:
	LDA.w #$0040				;$809953
	TRB.w $1C35				;$809956
	BEQ.b CODE_80996D			;$809959
	TYX					;$80995B
	INC.b $38,x				;$80995C
	LDA.w $1C9B				;$80995E
	AND.w #$00FF				;$809961
	ORA.w #$A000				;$809964
	STA.w $1C9B				;$809967
	JSR.w CODE_80A2A5			;$80996A
CODE_80996D:
	RTS					;$80996D

CODE_80996E:
	TYX					;$80996E
	STZ.b $38,x				;$80996F
	JSR.w CODE_8099C5			;$809971
	BCC.b CODE_809985			;$809974
	BEQ.b CODE_8099A8			;$809976
	CMP.w #$FFFF				;$809978
	BEQ.b CODE_8099A3			;$80997B
	CMP.w #$FFFE				;$80997D
	BEQ.b CODE_80999B			;$809980
	JSR.w CODE_8099B3			;$809982
CODE_809985:
	JSR.w CODE_8096FD			;$809985
	JSR.w CODE_809DD0			;$809988
	JSR.w CODE_809731			;$80998B
	JSR.w CODE_80A188			;$80998E
	JSR.w CODE_80A1AA			;$809991
	LDA.w #$0002				;$809994
	TRB.w $1C35				;$809997
	RTS					;$80999A

CODE_80999B:
	LDA.w #$C000				;$80999B
	TRB.w $053B				;$80999E
	BRA.b CODE_809985			;$8099A1

CODE_8099A3:
	JSR.w CODE_80BBF5			;$8099A3
	BRA.b CODE_809985			;$8099A6

CODE_8099A8:
	JSL.l CODE_B8807E			;$8099A8
	LDA.w #$4001				;$8099AC
	TSB.w $1C35				;$8099AF
	RTS					;$8099B2

CODE_8099B3:
	STA.b $1A				;$8099B3
	LDA.w #$FF00				;$8099B5
	BIT.b $1A				;$8099B8
	BEQ.b CODE_8099BF			;$8099BA
	TRB.w $053B				;$8099BC
CODE_8099BF:
	LDA.b $1A				;$8099BF
	TSB.w $053B				;$8099C1
	RTS					;$8099C4

CODE_8099C5:
	LDX.w #$0000				;$8099C5
	LDY.w #$0000				;$8099C8
	STZ.b $1A				;$8099CB
	STZ.b $1C				;$8099CD
CODE_8099CF:
	LDA.w $1C97,x				;$8099CF
	CMP.w DATA_809A02,y			;$8099D2
	BNE.b CODE_8099EA			;$8099D5
	INY					;$8099D7
	INX					;$8099D8
	CPX.w #$0004				;$8099D9
	BCC.b CODE_8099CF			;$8099DC
	LDA.w #$0705				;$8099DE
	JSL.l CODE_B28012			;$8099E1
	LDA.w DATA_809A02+$01,y			;$8099E5
	SEC					;$8099E8
	RTS					;$8099E9

CODE_8099EA:
	LDA.b $1A				;$8099EA
	CLC					;$8099EC
	ADC.w #$0007				;$8099ED
	STA.b $1A				;$8099F0
	TAY					;$8099F2
	INC.b $1C				;$8099F3
	LDX.w #$0000				;$8099F5
	LDA.w DATA_809A02,y			;$8099F8
	BNE.b CODE_8099CF			;$8099FB
	JSR.w CODE_80A3D8			;$8099FD
	CLC					;$809A00
	RTS					;$809A01

DATA_809A02:
	db "MUSIC",$00,$00
	db "WATER",$04,$00
	db "LIVES",$10,$00
	db "COLOR",$40,$00
	db "HARDR",$FE,$FF
	db "MERRY",$01,$00
	db "ASAVE",$02,$00
	db "TUFST",$80,$80
	db "ERASE",$FF,$FF
	db $00,$00

CODE_809A43:
	LDX.w $1CCE				;$809A43
	LDA.w $04CE				;$809A46
	BEQ.b CODE_809A5D			;$809A49
	EOR.l DATA_809AA7,x			;$809A4B
	BNE.b CODE_809A5E			;$809A4F
	INC.w $1CCE				;$809A51
	INC.w $1CCE				;$809A54
	LDA.l DATA_809AA7+$02,x			;$809A57
	BEQ.b CODE_809A62			;$809A5B
CODE_809A5D:
	RTS					;$809A5D

CODE_809A5E:
	STZ.w $1CCE				;$809A5E
	RTS					;$809A61

CODE_809A62:
	STZ.w $1CCE				;$809A62
	LDX.b current_sprite			;$809A65
	LDA.w #$000E				;$809A67
	STA.b $38,x				;$809A6A
	LDA.w #$0080				;$809A6C
	TSB.w $1C35				;$809A6F
	LDY.w #$0250				;$809A72
	JSL.l CODE_BB85B5			;$809A75
	LDA.w #$2400				;$809A79
	STA.b $38				;$809A7C
	LDY.w #$000E				;$809A7E
	JSR.w CODE_809E0F			;$809A81
	LDA.w #$0002				;$809A84
	TSB.w $1C35				;$809A87
	JSR.w CODE_809731			;$809A8A
	LDY.w #$0000				;$809A8D
	LDA.b [$84],y				;$809A90
	BNE.b CODE_809A9B			;$809A92
	STZ.w $04C4				;$809A94
	JSR.w CODE_80A257			;$809A97
	RTS					;$809A9A

CODE_809A9B:
	LDY.w #$0005				;$809A9B
	LDA.b [$84],y				;$809A9E
	AND.w #$00FF				;$809AA0
	STA.w $04C4				;$809AA3
	RTS					;$809AA6

DATA_809AA7:
	dw $0020
	dw $0010
	dw $0010
	dw $0020
	dw $0010
	dw $0010
	dw $0020
	dw $0010
	dw $0020
	dw $0010
	dw $0000

CODE_809ABD:
	LDA.w #$6200				;$809ABD
	TSB.w $1C35				;$809AC0
	LDA.w #$0000				;$809AC3
	STA.w $04C6				;$809AC6
	INC					;$809AC9
	STA.w $05B3				;$809ACA
	RTS					;$809ACD

CODE_809ACE:
	LDA.w #$00D7				;$809ACE
	STA.b $1A				;$809AD1
	LDA.w $1C83				;$809AD3
	BNE.b CODE_809AE5			;$809AD6
	LDA.w #$0666				;$809AD8
	JSL.l CODE_B28012			;$809ADB
	LDA.w #$0008				;$809ADF
	STA.w $1C83				;$809AE2
CODE_809AE5:
	LDA.w $1CB0				;$809AE5
	AND.w #$0FC0				;$809AE8
	STA.b $1C				;$809AEB
	LDA.w $1CB0				;$809AED
	AND.w #$003F				;$809AF0
	STA.w $1CB0				;$809AF3
	LDX.w #$1C41				;$809AF6
	JSR.w CODE_809C77			;$809AF9
	JSR.w CODE_809C77			;$809AFC
	JSR.w CODE_809C77			;$809AFF
	JSR.w CODE_809C77			;$809B02
	LSR.b $1C				;$809B05
	LDA.b $1C				;$809B07
	BIT.w #$0020				;$809B09
	BEQ.b CODE_809B13			;$809B0C
	LDA.w #$0800				;$809B0E
	STA.b $1C				;$809B11
CODE_809B13:
	LDA.b $1C				;$809B13
	TSB.w $1CB0				;$809B15
	DEC.w $1C83				;$809B18
	BNE.b CODE_809B37			;$809B1B
	LDA.w #$0006				;$809B1D
	JSR.w CODE_80A3E9			;$809B20
	TYX					;$809B23
	STZ.b $38,x				;$809B24
	LDA.w stereo_select			;$809B26
	EOR.w #$0001				;$809B29
	STA.w stereo_select			;$809B2C
	SEP.b #$20				;$809B2F
	STA.l $B06009				;$809B31
	REP.b #$20				;$809B35
CODE_809B37:
	RTS					;$809B37

CODE_809B38:
	LDA.w #$00D7				;$809B38
	STA.b $1A				;$809B3B
	LDA.w $1C83				;$809B3D
	BNE.b CODE_809B4F			;$809B40
	LDA.w #$0666				;$809B42
	JSL.l CODE_B28012			;$809B45
	LDA.w #$0008				;$809B49
	STA.w $1C83				;$809B4C
CODE_809B4F:
	LDA.w $1CB0				;$809B4F
	AND.w #$0FC0				;$809B52
	STA.b $1C				;$809B55
	LDA.w $1CB0				;$809B57
	AND.w #$003F				;$809B5A
	STA.w $1CB0				;$809B5D
	LDX.w #$1C41				;$809B60
	JSR.w CODE_809C8B			;$809B63
	JSR.w CODE_809C8B			;$809B66
	JSR.w CODE_809C8B			;$809B69
	JSR.w CODE_809C8B			;$809B6C
	ASL.b $1C				;$809B6F
	LDA.b $1C				;$809B71
	BIT.w #$1000				;$809B73
	BEQ.b CODE_809B7D			;$809B76
	LDA.w #$0040				;$809B78
	STA.b $1C				;$809B7B
CODE_809B7D:
	LDA.b $1C				;$809B7D
	TSB.w $1CB0				;$809B7F
	DEC.w $1C83				;$809B82
	BNE.b CODE_809BA1			;$809B85
	LDA.w #$0006				;$809B87
	JSR.w CODE_80A3E9			;$809B8A
	TYX					;$809B8D
	STZ.b $38,x				;$809B8E
	LDA.w stereo_select			;$809B90
	EOR.w #$0001				;$809B93
	STA.w stereo_select			;$809B96
	SEP.b #$20				;$809B99
	STA.l $B06009				;$809B9B
	REP.b #$20				;$809B9F
CODE_809BA1:
	RTS					;$809BA1

CODE_809BA2:
	LDA.w #$00D7				;$809BA2
	STA.b $1A				;$809BA5
	LDA.w $1C83				;$809BA7
	BNE.b CODE_809BB9			;$809BAA
	LDA.w #$0666				;$809BAC
	JSL.l CODE_B28012			;$809BAF
	LDA.w #$0008				;$809BB3
	STA.w $1C83				;$809BB6
CODE_809BB9:
	LDA.w $1CB0				;$809BB9
	AND.w #$003F				;$809BBC
	STA.b $1C				;$809BBF
	LDA.w $1CB0				;$809BC1
	AND.w #$0FC0				;$809BC4
	STA.w $1CB0				;$809BC7
	LDX.w #$1C51				;$809BCA
	JSR.w CODE_809C77			;$809BCD
	JSR.w CODE_809C77			;$809BD0
	JSR.w CODE_809C77			;$809BD3
	JSR.w CODE_809C77			;$809BD6
	LSR.b $1C				;$809BD9
	BCC.b CODE_809BE2			;$809BDB
	LDA.w #$0020				;$809BDD
	STA.b $1C				;$809BE0
CODE_809BE2:
	LDA.b $1C				;$809BE2
	TSB.w $1CB0				;$809BE4
	DEC.w $1C83				;$809BE7
	BNE.b CODE_809C09			;$809BEA
	LDA.w #$0006				;$809BEC
	JSR.w CODE_80A3E9			;$809BEF
	TYX					;$809BF2
	STZ.b $38,x				;$809BF3
	LDA.w language_select			;$809BF5
	EOR.w #$0001				;$809BF8
	STA.w language_select			;$809BFB
	SEP.b #$20				;$809BFE
	STA.l $B06008				;$809C00
	REP.b #$20				;$809C04
	JSR.w CODE_809E09			;$809C06
CODE_809C09:
	RTS					;$809C09

CODE_809C0A:
	LDA.w #$00D7				;$809C0A
	STA.b $1A				;$809C0D
	LDA.w $1C83				;$809C0F
	BNE.b CODE_809C21			;$809C12
	LDA.w #$0666				;$809C14
	JSL.l CODE_B28012			;$809C17
	LDA.w #$0008				;$809C1B
	STA.w $1C83				;$809C1E
CODE_809C21:
	LDA.w $1CB0				;$809C21
	AND.w #$003F				;$809C24
	STA.b $1C				;$809C27
	LDA.w $1CB0				;$809C29
	AND.w #$0FC0				;$809C2C
	STA.w $1CB0				;$809C2F
	LDX.w #$1C51				;$809C32
	JSR.w CODE_809C8B			;$809C35
	JSR.w CODE_809C8B			;$809C38
	JSR.w CODE_809C8B			;$809C3B
	JSR.w CODE_809C8B			;$809C3E
	ASL.b $1C				;$809C41
	LDA.b $1C				;$809C43
	BIT.w #$0040				;$809C45
	BEQ.b CODE_809C4F			;$809C48
	LDA.w #$0001				;$809C4A
	STA.b $1C				;$809C4D
CODE_809C4F:
	LDA.b $1C				;$809C4F
	TSB.w $1CB0				;$809C51
	DEC.w $1C83				;$809C54
	BNE.b CODE_809C76			;$809C57
	LDA.w #$0006				;$809C59
	JSR.w CODE_80A3E9			;$809C5C
	TYX					;$809C5F
	STZ.b $38,x				;$809C60
	LDA.w language_select			;$809C62
	EOR.w #$0001				;$809C65
	STA.w language_select			;$809C68
	SEP.b #$20				;$809C6B
	STA.l $B06008				;$809C6D
	REP.b #$20				;$809C71
	JSR.w CODE_809E09			;$809C73
CODE_809C76:
	RTS					;$809C76

CODE_809C77:
	SEP.b #$20				;$809C77
	LDA.b $01,x				;$809C79
	DEC					;$809C7B
	CMP.b #$B8				;$809C7C
	BCS.b CODE_809C82			;$809C7E
	LDA.b $1A				;$809C80
CODE_809C82:
	STA.b $01,x				;$809C82
	INX					;$809C84
	INX					;$809C85
	INX					;$809C86
	INX					;$809C87
	REP.b #$20				;$809C88
	RTS					;$809C8A

CODE_809C8B:
	SEP.b #$20				;$809C8B
	LDA.b $01,x				;$809C8D
	INC					;$809C8F
	CMP.b $1A				;$809C90
	BCC.b CODE_809C96			;$809C92
	LDA.b #$B7				;$809C94
CODE_809C96:
	STA.b $01,x				;$809C96
	INX					;$809C98
	INX					;$809C99
	INX					;$809C9A
	INX					;$809C9B
	REP.b #$20				;$809C9C
	RTS					;$809C9E

CODE_809C9F:
	TYX					;$809C9F
	LDA.w $1C3B				;$809CA0
	BNE.b CODE_809CB0			;$809CA3
	LDA.w $1C37				;$809CA5
	CMP.w #$0003				;$809CA8
	BCS.b CODE_809CB0			;$809CAB
	JSR.w CODE_809A43			;$809CAD
CODE_809CB0:
	LDA.w #$0004				;$809CB0
	TRB.w $1C35				;$809CB3
	LDA.w $04DA				;$809CB6
	BIT.w #$0800				;$809CB9
	BEQ.b CODE_809CE9			;$809CBC
	LDA.w $1C37				;$809CBE
	BEQ.b CODE_809CE4			;$809CC1
	CMP.w #$0005				;$809CC3
	BPL.b CODE_809CE5			;$809CC6
	JSR.w CODE_809DB7			;$809CC8
	LDA.w $1C37				;$809CCB
	DEC					;$809CCE
	CMP.w #$0003				;$809CCF
	BCC.b CODE_809CD7			;$809CD2
	LDA.w #$0002				;$809CD4
CODE_809CD7:
	STA.w $1C37				;$809CD7
	JSR.w CODE_809DD0			;$809CDA
	LDA.w #$0565				;$809CDD
	JSL.l CODE_B28012			;$809CE0
CODE_809CE4:
	RTS					;$809CE4

CODE_809CE5:
	STA.w $0038,y				;$809CE5
	RTS					;$809CE8

CODE_809CE9:
	BIT.w #$0400				;$809CE9
	BEQ.b CODE_809D37			;$809CEC
	LDA.w $1C37				;$809CEE
	CMP.w #$0005				;$809CF1
	BPL.b CODE_809D18			;$809CF4
	CMP.w $1C39				;$809CF6
	BCS.b CODE_809D20			;$809CF9
	JSR.w CODE_809DB7			;$809CFB
	INC.w $1C37				;$809CFE
	LDA.w $1C37				;$809D01
	CMP.w #$0003				;$809D04
	BEQ.b CODE_809D14			;$809D07
	JSR.w CODE_809DD0			;$809D09
	LDA.w #$0565				;$809D0C
	JSL.l CODE_B28012			;$809D0F
	RTS					;$809D13

CODE_809D14:
	JSR.w CODE_809DEE			;$809D14
	RTS					;$809D17

CODE_809D18:
	CLC					;$809D18
	ADC.w #$0007				;$809D19
	STA.w $0038,y				;$809D1C
	RTS					;$809D1F

CODE_809D20:
	LDA.w $1C3B				;$809D20
	BEQ.b CODE_809D36			;$809D23
	STZ.b $38,x				;$809D25
	LDA.w #$0002				;$809D27
	JSR.w CODE_809700			;$809D2A
	LDA.w #$0003				;$809D2D
	STA.w $1C37				;$809D30
	JSR.w CODE_809DEE			;$809D33
CODE_809D36:
	RTS					;$809D36

CODE_809D37:
	BIT.w #$B080				;$809D37
	BEQ.b CODE_809D53			;$809D3A
	LDA.w $1C37				;$809D3C
	CMP.w #$0005				;$809D3F
	BPL.b CODE_809D53			;$809D42
	CLC					;$809D44
	ADC.w $1C3B				;$809D45
	TAX					;$809D48
	LDA.w DATA_809DA7,x			;$809D49
	AND.w #$00FF				;$809D4C
	STA.w $0038,y				;$809D4F
	RTS					;$809D52

CODE_809D53:
	LDX.w $1C37				;$809D53
	CPX.w #$0003				;$809D56
	BCC.b CODE_809D83			;$809D59
	BIT.w #$0100				;$809D5B
	BEQ.b CODE_809D6F			;$809D5E
	CPX.w #$0006				;$809D60
	BCS.b CODE_809D82			;$809D63
	INC.w $1C37				;$809D65
	LDA.w $1C37				;$809D68
	JSR.w CODE_809DEE			;$809D6B
	RTS					;$809D6E

CODE_809D6F:
	BIT.w #$0200				;$809D6F
	BEQ.b CODE_809D82			;$809D72
	CPX.w #$0004				;$809D74
	BCC.b CODE_809D82			;$809D77
	DEC.w $1C37				;$809D79
	LDA.w $1C37				;$809D7C
	JSR.w CODE_809DEE			;$809D7F
CODE_809D82:
	RTS					;$809D82

CODE_809D83:
	LDX.w $1C3B				;$809D83
	BNE.b CODE_809D82			;$809D86
	BIT.w #$0200				;$809D88
	BNE.b CODE_809D8E			;$809D8B
	RTS					;$809D8D

CODE_809D8E:
	JSR.w CODE_809731			;$809D8E
	LDY.w #$0000				;$809D91
	LDA.b [$84],y				;$809D94
	BNE.b CODE_809D99			;$809D96
	RTS					;$809D98

CODE_809D99:
	LDA.w #$4020				;$809D99
	TSB.w $1C35				;$809D9C
	LDA.w #$820F				;$809D9F
	JSL.l set_fade				;$809DA2
	RTS					;$809DA6

DATA_809DA7:
	db $01,$01,$01,$07,$0A,$05,$06,$0B,$0B,$0B,$08,$08,$08,$09,$09,$09

CODE_809DB7:
	INC					;$809DB7
	ASL					;$809DB8
	TAX					;$809DB9
	LDA.w #$D530				;$809DBA
	CPX.w #$0008				;$809DBD
	BCC.b CODE_809DCB			;$809DC0
	STZ.w PPU.window_1			;$809DC2
	LDX.w #$000A				;$809DC5
	LDA.w #$9508				;$809DC8
CODE_809DCB:
	STA.l $7EA15A,x				;$809DCB
	RTS					;$809DCF

CODE_809DD0:
	INC					;$809DD0
	ASL					;$809DD1
	TAX					;$809DD2
	LDA.w #$0030				;$809DD3
	CPX.w #$0008				;$809DD6
	BCC.b CODE_809DDE			;$809DD9
	LDX.w #$000A				;$809DDB
CODE_809DDE:
	STA.l $7EA15A,x				;$809DDE
	RTS					;$809DE2

CODE_809DE3:
	INC					;$809DE3
	ASL					;$809DE4
	TAX					;$809DE5
	LDA.w #$0030				;$809DE6
	STA.l $7EA15A,x				;$809DE9
	RTS					;$809DED

CODE_809DEE:
	SEC					;$809DEE
	SBC.w #$0003				;$809DEF
	TAX					;$809DF2
	LDA.w DATA_80C33E,x			;$809DF3
	SEP.b #$20				;$809DF6
	STA.w PPU.window_1_left			;$809DF8
	XBA					;$809DFB
	STA.w PPU.window_1_right		;$809DFC
	REP.b #$20				;$809DFF
	LDA.w #$0565				;$809E01
	JSL.l CODE_B28012			;$809E04
	RTS					;$809E08

CODE_809E09:
	JSR.w CODE_80957A			;$809E09
	LDY.w #$000C				;$809E0C
CODE_809E0F:
	LDA.w #$0010				;$809E0F
	JSR.w CODE_80A3E9			;$809E12
	LDX.w $1D93				;$809E15
	INC.b $60,x				;$809E18
CODE_809E1A:
	PHY					;$809E1A
	LDY.w #$0208				;$809E1B
	JSL.l CODE_BB8588			;$809E1E
	LDX.b alternate_sprite			;$809E22
	LDA.w #$FFFF				;$809E24
	STA.b $5E,x				;$809E27
	LDA.w #$00F0				;$809E29
	STA.b $16,x				;$809E2C
	LDA.w #$0008				;$809E2E
	STA.b $60,x				;$809E31
	PLX					;$809E33
	LDY.w #$FFDF				;$809E34
	JSR.w CODE_809F29			;$809E37
	RTS					;$809E3A

CODE_809E3B:
	SEP.b #$20				;$809E3B
	LDX.w #$3100				;$809E3D
	STX.w HDMA[$01].settings		;$809E40
	LDX.w #$7EA15A				;$809E43
	STX.w HDMA[$01].source_word		;$809E46
	LDA.b #$7EA15A>>16			;$809E49
	STA.w HDMA[$01].source_bank		;$809E4B
	STA.w HDMA[$01].indirect_source_bank	;$809E4E
	LDX.w #$3000				;$809E51
	STX.w HDMA[$02].settings		;$809E54
	LDX.w #$7EA17A				;$809E57
	STX.w HDMA[$02].source_word		;$809E5A
	LDA.b #$7EA17A>>16			;$809E5D
	STA.w HDMA[$02].source_bank		;$809E5F
	STA.w HDMA[$02].indirect_source_bank	;$809E62
	LDX.w #$0D03				;$809E65
	STX.w HDMA[$03].settings		;$809E68
	LDX.w #$7EA18A				;$809E6B
	STX.w HDMA[$03].source_word		;$809E6E
	LDA.b #$7EA18A>>16			;$809E71
	STA.w HDMA[$03].source_bank		;$809E73
	STA.w HDMA[$03].indirect_source_bank	;$809E76
	LDX.w #$1103				;$809E79
	STX.w HDMA[$04].settings		;$809E7C
	LDX.w #$7EA1AE				;$809E7F
	STX.w HDMA[$04].source_word		;$809E82
	LDA.b #$7EA1AE>>16			;$809E85
	STA.w HDMA[$04].source_bank		;$809E87
	STA.w HDMA[$04].indirect_source_bank	;$809E8A
	LDX.w #$2C00				;$809E8D
	STX.w HDMA[$05].settings		;$809E90
	LDX.w #$7EA1E1				;$809E93
	STX.w HDMA[$05].source_word		;$809E96
	LDA.b #$7EA1E1>>16			;$809E99
	STA.w HDMA[$05].source_bank		;$809E9B
	STA.w HDMA[$05].indirect_source_bank	;$809E9E
	LDX.w #$3200				;$809EA1
	STX.w HDMA[$06].settings		;$809EA4
	LDX.w #$7EA1F2				;$809EA7
	STX.w HDMA[$06].source_word		;$809EAA
	LDA.b #$7EA1F2>>16			;$809EAD
	STA.w HDMA[$06].source_bank		;$809EAF
	STA.w HDMA[$06].indirect_source_bank	;$809EB2
	REP.b #$20				;$809EB5
	LDA.w #$D528				;$809EB7
	STA.l $7EA15A				;$809EBA
	LDA.w #$D530				;$809EBE
	STA.l $7EA15C				;$809EC1
	STA.l $7EA15E				;$809EC5
	STA.l $7EA160				;$809EC9
	LDA.w #$D50C				;$809ECD
	STA.l $7EA162				;$809ED0
	LDA.w #$9508				;$809ED4
	STA.l $7EA164				;$809ED7
	LDA.w #$D501				;$809EDB
	STA.l $7EA166				;$809EDE
	LDA.w #$0000				;$809EE2
	STA.l $7EA168				;$809EE5
	LDA.w #$007F				;$809EE9
	STA.l $7EA17A				;$809EEC
	LDA.w #$0045				;$809EF0
	STA.l $7EA17C				;$809EF3
	LDA.w #$2008				;$809EF7
	STA.l $7EA17E				;$809EFA
	LDA.w #$0001				;$809EFE
	STA.l $7EA180				;$809F01
	LDA.w #$0000				;$809F05
	STA.l $7EA182				;$809F08
	LDX.w #$0000				;$809F0C
	LDY.w #$0000				;$809F0F
CODE_809F12:
	LDA.w DATA_80C290,y			;$809F12
	STA.l $7EA18A,x				;$809F15
	INX					;$809F19
	INX					;$809F1A
	INY					;$809F1B
	INY					;$809F1C
	CPY.w #$008A				;$809F1D
	BMI.b CODE_809F12			;$809F20
	LDA.w #$7E01				;$809F22
	STA.w $04E4				;$809F25
	RTS					;$809F28

CODE_809F29:
	STY.b $1A				;$809F29
	PEA.w (($7EA7BA&$FF0000)>>16)|((RESET_start&$FF0000)>>8)	;$809F2B
	PLB					;$809F2E
	LDA.l $7EA7BA,x				;$809F2F
	CLC					;$809F33
	ADC.w #$7EA9DD				;$809F34
	TAY					;$809F37
	LDX.b $1A				;$809F38
CODE_809F3A:
	INX					;$809F3A
	INY					;$809F3B
	LDA.w $0000,y				;$809F3C
	AND.w #$00FF				;$809F3F
	STA.l $7E0000,x				;$809F42
	BNE.b CODE_809F3A			;$809F46
	PLB					;$809F48
	RTS					;$809F49

CODE_809F4A:
	JSR.w CODE_809FED			;$809F4A
	STZ.w $1C37				;$809F4D
	JSR.w CODE_809731			;$809F50
	JSR.w CODE_80A1AA			;$809F53
	LDY.w #$0262				;$809F56
	JSL.l CODE_BB85B5			;$809F59
	LDX.b alternate_sprite			;$809F5D
	LDA.w $1C37				;$809F5F
	STA.b $5C,x				;$809F62
	INC.w $1C37				;$809F64
	JSR.w CODE_809731			;$809F67
	JSR.w CODE_80A1AA			;$809F6A
	LDY.w #$0262				;$809F6D
	JSL.l CODE_BB85B5			;$809F70
	LDX.b alternate_sprite			;$809F74
	LDA.w $1C37				;$809F76
	STA.b $5C,x				;$809F79
	INC.w $1C37				;$809F7B
	JSR.w CODE_809731			;$809F7E
	JSR.w CODE_80A1AA			;$809F81
	LDY.w #$0262				;$809F84
	JSL.l CODE_BB85B5			;$809F87
	LDX.b alternate_sprite			;$809F8B
	LDA.w $1C37				;$809F8D
	STA.b $5C,x				;$809F90
CODE_809F92:
	LDA.w #$0C00				;$809F92
	STA.b $38				;$809F95
	JSR.w CODE_809FA3			;$809F97
	LDA.w #$0C00				;$809F9A
	STA.b $38				;$809F9D
	JSR.w CODE_809FBF			;$809F9F
	RTS					;$809FA2

CODE_809FA3:
	LDX.w #DATA_809FDB			;$809FA3
	LDY.w #$0602				;$809FA6
	JSR.w CODE_80A439			;$809FA9
	LDX.w #DATA_809FE1			;$809FAC
	LDY.w #$0642				;$809FAF
	JSR.w CODE_80A439			;$809FB2
	LDX.w #DATA_809FE7			;$809FB5
	LDY.w #$0682				;$809FB8
	JSR.w CODE_80A439			;$809FBB
	RTS					;$809FBE

CODE_809FBF:
	LDX.w #DATA_809FDB			;$809FBF
	LDY.w #$060E				;$809FC2
	JSR.w CODE_80A439			;$809FC5
	LDX.w #DATA_809FE1			;$809FC8
	LDY.w #$064E				;$809FCB
	JSR.w CODE_80A439			;$809FCE
	LDX.w #DATA_809FE7			;$809FD1
	LDY.w #$068E				;$809FD4
	JSR.w CODE_80A439			;$809FD7
	RTS					;$809FDA

DATA_809FDB:
	db $86,$86,$86,$86,$86,$00

DATA_809FE1:
	db $87,$87,$87,$87,$87,$00

DATA_809FE7:
	db $86,$86,$86,$86,$86,$00

CODE_809FED:
	LDA.w #$7EF000>>16			;$809FED
	STA.b $44				;$809FF0
	LDA.w #$7EF000				;$809FF2
	STA.b $42				;$809FF5
	RTS					;$809FF7

CODE_809FF8:
	LDA.w $1CB0				;$809FF8
	STA.b $1E				;$809FFB
	LDA.w #$000F				;$809FFD
	STA.b $3E				;$80A000
CODE_80A002:
	LSR.b $1E				;$80A002
	BCC.b CODE_80A02A			;$80A004
	LDA.b $3E				;$80A006
	ASL					;$80A008
	ASL					;$80A009
	TAX					;$80A00A
	LDA.l DATA_80A02F,x			;$80A00B
	STA.w PPU.vram_address			;$80A00F
	STA.b $1A				;$80A012
	LDA.l DATA_80A02F+$03,x			;$80A014
	AND.w #$00FF				;$80A018
	PHA					;$80A01B
	LDA.l DATA_80A02F+$02,x			;$80A01C
CODE_80A020:
	AND.w #$00FF				;$80A020
	PLX					;$80A023
	LDY.w #$0003				;$80A024
	JSR.w CODE_80A06F			;$80A027
CODE_80A02A:
	DEC.b $3E				;$80A02A
	BPL.b CODE_80A002			;$80A02C
	RTS					;$80A02E

DATA_80A02F:
	dw $7B01,$0005,$7B01,$6005,$7B07,$1E05,$7B07,$7E05
	dw $7B0D,$5A01,$7B0D,$5401,$7B0D,$4E01,$7B0D,$4801
	dw $7B0D,$4201,$7B0D,$3C01,$7B15,$5A01,$7B15,$5401
	dw $7B15,$4E01,$7B15,$4801,$7B15,$4201,$7B15,$3C01

CODE_80A06F:
	PHA					;$80A06F
	STA.b $1C				;$80A070
CODE_80A072:
	LDA.l DATA_EA0694,x			;$80A072
	STA.w PPU.vram_write			;$80A076
	INX					;$80A079
	INX					;$80A07A
	DEC.b $1C				;$80A07B
	BNE.b CODE_80A072			;$80A07D
	LDA.b $1A				;$80A07F
	CLC					;$80A081
	ADC.w #$0020				;$80A082
	STA.b $1A				;$80A085
	STA.w PPU.vram_address			;$80A087
	PLA					;$80A08A
	DEY					;$80A08B
	BNE.b CODE_80A06F			;$80A08C
	RTS					;$80A08E

CODE_80A08F:
	PHK					;$80A08F
	PLB					;$80A090
	JSR.w CODE_809FED			;$80A091
	LDA.w #$B06062>>16			;$80A094
	STA.b $86				;$80A097
	STZ.b $2E				;$80A099
	LDA.w #$B06062				;$80A09B
	LDY.w #$3800				;$80A09E
	JSR.w CODE_80A0BB			;$80A0A1
	INC.b $2E				;$80A0A4
	LDA.w #$B062EC				;$80A0A6
	LDY.w #$6800				;$80A0A9
	JSR.w CODE_80A0BB			;$80A0AC
	INC.b $2E				;$80A0AF
	LDA.w #$B06576				;$80A0B1
	LDY.w #$9800				;$80A0B4
	JSR.w CODE_80A0BB			;$80A0B7
	RTS					;$80A0BA

CODE_80A0BB:
	STZ.b $30				;$80A0BB
	STZ.b $32				;$80A0BD
	STA.b $84				;$80A0BF
	STY.b $34				;$80A0C1
	JSR.w CODE_80A0D7			;$80A0C3
	LDA.w #$0006				;$80A0C6
	LDY.b $34				;$80A0C9
	JSR.w CODE_80A374			;$80A0CB
	JSR.w CODE_80A0FA			;$80A0CE
	BCC.b CODE_80A0D6			;$80A0D1
	JSR.w CODE_80A374			;$80A0D3
CODE_80A0D6:
	RTS					;$80A0D6

CODE_80A0D7:
	LDY.w #$0005				;$80A0D7
	LDA.b [$84],y				;$80A0DA
	AND.w #$00FF				;$80A0DC
	STA.b $32				;$80A0DF
	LDY.w #$0000				;$80A0E1
	LDA.b [$84],y				;$80A0E4
	STA.b $30				;$80A0E6
	BEQ.b CODE_80A0F9			;$80A0E8
	LDA.b $32				;$80A0EA
	CMP.w #$0002				;$80A0EC
	BNE.b CODE_80A0F9			;$80A0EF
	LDA.b $34				;$80A0F1
	SEC					;$80A0F3
	SBC.w #$0800				;$80A0F4
	STA.b $34				;$80A0F7
CODE_80A0F9:
	RTS					;$80A0F9

CODE_80A0FA:
	LDA.b $32				;$80A0FA
	CMP.w #$0002				;$80A0FC
	BNE.b CODE_80A112			;$80A0FF
	LDA.b $30				;$80A101
	BEQ.b CODE_80A112			;$80A103
	LDA.b $34				;$80A105
	CLC					;$80A107
	ADC.w #$1000				;$80A108
	STA.b $34				;$80A10B
	TAY					;$80A10D
	LDA.w #$0142				;$80A10E
	SEC					;$80A111
CODE_80A112:
	RTS					;$80A112

CODE_80A113:
	LDA stereo_select			;$80A113
	STA $1A					;$80A116
	JSR CODE_80A166				;$80A118
	LDA #$BC70				;$80A11B
	JSR CODE_80A453				;$80A11E
	JSR CODE_80A166				;$80A121
	LDA #$C470				;$80A124
	JSR CODE_80A453				;$80A127
	JSR CODE_80A166				;$80A12A
	LDA #$CC70				;$80A12D
	JSR CODE_80A453				;$80A130
	JSR CODE_80A166				;$80A133
	LDA #$D470				;$80A136
	JSR CODE_80A453				;$80A139
	LDA language_select			;$80A13C
	STA $1A					;$80A13F
	JSR CODE_80A177				;$80A141
	LDA #$BCB0				;$80A144
	JSR CODE_80A453				;$80A147
	JSR CODE_80A177				;$80A14A
	LDA #$C4B0				;$80A14D
	JSR CODE_80A453				;$80A150
	JSR CODE_80A177				;$80A153
	LDA #$CCB0				;$80A156
	JSR CODE_80A453				;$80A159
	JSR CODE_80A177				;$80A15C
	LDA #$D4B0				;$80A15F
	JSR CODE_80A453				;$80A162
	RTS					;$80A165

CODE_80A166:
	LDA.b $1A				;$80A166
	INC.b $1A				;$80A168
	AND.w #$0001				;$80A16A
	ASL					;$80A16D
	TAY					;$80A16E
	LDX.w DATA_80A173,y			;$80A16F
	RTS					;$80A172

DATA_80A173:
	dw DATA_80C365
	dw DATA_80C35F

CODE_80A177:
	LDA.b $1A				;$80A177
	INC.b $1A				;$80A179
	AND.w #$0001				;$80A17B
	ASL					;$80A17E
	TAY					;$80A17F
	LDX.w DATA_80A184,y			;$80A180
	RTS					;$80A183

DATA_80A184:
	dw DATA_80C349
	dw DATA_80C358

CODE_80A188:
	LDX #DATA_80C36D			;$80A188
	LDY #$0094				;$80A18B
	JSR CODE_80A417				;$80A18E
	JSR CODE_80A369				;$80A191
	LDX #DATA_80C36D			;$80A194
	LDY #$0094				;$80A197
	JSR CODE_80A417				;$80A19A
	JSR CODE_80A369				;$80A19D
	LDX #DATA_80C36D			;$80A1A0
	LDY #$0094				;$80A1A3
	JSR CODE_80A417				;$80A1A6
	RTS					;$80A1A9

CODE_80A1AA:
	JSR.w CODE_80A35A			;$80A1AA
	LDA.w #$2400				;$80A1AD
	STA.b $38				;$80A1B0
	JSR.w CODE_809141			;$80A1B2
	BCS.b CODE_80A1BD			;$80A1B5
	LDY.w #$0000				;$80A1B7
	TYA					;$80A1BA
	STA.b [$84],y				;$80A1BB
CODE_80A1BD:
	LDY.w #$0005				;$80A1BD
	LDA.b [$84],y				;$80A1C0
	AND.w #$00FF				;$80A1C2
	STA.w $1CD0				;$80A1C5
	LDY.w #$0000				;$80A1C8
	LDA.b [$84],y				;$80A1CB
	STA.w $1C85				;$80A1CD
	BEQ.b CODE_80A188			;$80A1D0
	LDA.w #$8002				;$80A1D2
	BIT.w $1C35				;$80A1D5
	BNE.b CODE_80A1F9			;$80A1D8
	LDY.w #$024C				;$80A1DA
	JSL.l CODE_BB8585			;$80A1DD
	LDA.w #$F000				;$80A1E1
	STA.b $42				;$80A1E4
	LDX.b alternate_sprite			;$80A1E6
	LDA.w $1C37				;$80A1E8
	STA.b $6A,x				;$80A1EB
	ASL					;$80A1ED
	TAY					;$80A1EE
	LDA.w DATA_80C322,y			;$80A1EF
	STA.b $16,x				;$80A1F2
	LDA.w $1CD0				;$80A1F4
	STA.b $5C,x				;$80A1F7
CODE_80A1F9:
	LDA.w $1CD0				;$80A1F9
	BNE.b CODE_80A211			;$80A1FC
	JSR.w CODE_80A369			;$80A1FE
	LDA.w #$0006				;$80A201
	JSR.w CODE_80A286			;$80A204
	JSR.w CODE_80A2A5			;$80A207
	JSR.w CODE_80A2BE			;$80A20A
	JSR.w CODE_80A257			;$80A20D
	RTS					;$80A210

CODE_80A211:
	LDA #$0006				;$80A211
	JSR CODE_80A286				;$80A214
	JSR CODE_80A2A5				;$80A217
	JSR CODE_80A2BE				;$80A21A
	JSR CODE_80A366				;$80A21D
	LDY $1CD0				;$80A220
	CPY #$0002				;$80A223
	BEQ CODE_80A247				;$80A226
	LDA #$0005				;$80A228
	JSR CODE_80A286				;$80A22B
	JSR CODE_80A2A5				;$80A22E
	LDX #DATA_80C36B			;$80A231
	LDY #$0096				;$80A234
	JSR CODE_80A417				;$80A237
	LDX #$001C97				;$80A23A
	LDY #$009A				;$80A23D
	JSR CODE_80A417				;$80A240
	JSR CODE_80A26D				;$80A243
	RTS					;$80A246

CODE_80A247:
	LDA #$0142				;$80A247
	JSR CODE_80A286				;$80A24A
	JSR CODE_80A2A5				;$80A24D
	JSR CODE_80A2BE				;$80A250
	JSR CODE_80A26D				;$80A253
	RTS					;$80A256

CODE_80A257:
	LDY.w $1C37				;$80A257
	LDA.w DATA_80C343+$03,y			;$80A25A
	AND.w #$00FF				;$80A25D
	TAX					;$80A260
	LDA.w #$FFFA				;$80A261
	STA.l $7EA1B0,x				;$80A264
	STA.l $7EA1B5,x				;$80A268
	RTS					;$80A26C

CODE_80A26D:
	LDY.w $1C37				;$80A26D
	LDA.w DATA_80C343+$03,y			;$80A270
	AND.w #$00FF				;$80A273
	TAX					;$80A276
	LDA.w #$FFF7				;$80A277
	STA.l $7EA1B0,x				;$80A27A
	LDA.w #$FFFD				;$80A27E
	STA.l $7EA1B5,x				;$80A281
	RTS					;$80A285

CODE_80A286:
	CLC					;$80A286
	ADC.b $84				;$80A287
	STA.b $84				;$80A289
	TAX					;$80A28B
	LDA.l $B00000,x				;$80A28C
	STA.w $1C97				;$80A290
	LDA.l $B00002,x				;$80A293
	STA.w $1C99				;$80A297
	LDA.l $B00003,x				;$80A29A
	ORA.w #$8000				;$80A29E
	STA.w $1C9A				;$80A2A1
	RTS					;$80A2A4

CODE_80A2A5:
	LDX.w #$001C97				;$80A2A5
	LDY.w #$0096				;$80A2A8
	JSR.w CODE_80A417			;$80A2AB
	RTS					;$80A2AE

CODE_80A2AF:
	LDX.w #$1C97				;$80A2AF
	LDA.w #$0096				;$80A2B2
	CLC					;$80A2B5
	ADC.w $1C95				;$80A2B6
	TAY					;$80A2B9
	JSR.w CODE_80A439			;$80A2BA
	RTS					;$80A2BD

CODE_80A2BE:
	LDY #$000E				;$80A2BE
	LDA [$84],y				;$80A2C1
	AND #$00FF				;$80A2C3
	LDX $1C95				;$80A2C6
	STX $36					;$80A2C9
	LDX #$0003				;$80A2CB
	LDY #$00A2				;$80A2CE
	JSR CODE_80A64A				;$80A2D1
	LDX #DATA_80C369			;$80A2D4
	LDY #$00A8				;$80A2D7
	JSR CODE_80A417				;$80A2DA
	RTS					;$80A2DD

CODE_80A2DE:
	LDA.w #$F000				;$80A2DE
	STA.b $42				;$80A2E1
	LDA.w #$0800				;$80A2E3
	STA.b $38				;$80A2E6
	LDX.w #$0002				;$80A2E8
	LDA.w stereo_select			;$80A2EB
	BNE.b CODE_80A2F3			;$80A2EE
	LDX.w #$0000				;$80A2F0
CODE_80A2F3:
	LDY.w #$061C				;$80A2F3
	JSR.w CODE_80A33F			;$80A2F6
	JSR.w CODE_80A33F			;$80A2F9
	JSR.w CODE_80A33F			;$80A2FC
	LDX.w #$0000				;$80A2FF
	LDA.w language_select			;$80A302
	BEQ.b CODE_80A312			;$80A305
	LDX.w #$0002				;$80A307
	CMP.w #$0001				;$80A30A
	BEQ.b CODE_80A312			;$80A30D
	LDX.w #$0004				;$80A30F
CODE_80A312:
	LDY.w #$062C				;$80A312
	JSR.w CODE_80A324			;$80A315
	JSR.w CODE_80A324			;$80A318
	JSR.w CODE_80A324			;$80A31B
	LDA.w #$2400				;$80A31E
	STA.b $38				;$80A321
	RTS					;$80A323

CODE_80A324:
	PHX					;$80A324
	PHY					;$80A325
	LDA.w DATA_80A337,x			;$80A326
	TAX					;$80A329
	JSR.w CODE_80A41D			;$80A32A
	PLA					;$80A32D
	CLC					;$80A32E
	ADC.w #$0040				;$80A32F
	TAY					;$80A332
	PLX					;$80A333
	INX					;$80A334
	INX					;$80A335
	RTS					;$80A336

DATA_80A337:
	dw DATA_80C349
	dw DATA_80C358
	dw DATA_80C349
	dw DATA_80C358

CODE_80A33F:
	PHX					;$80A33F
	PHY					;$80A340
	LDA.w DATA_80A352,x			;$80A341
	TAX					;$80A344
	JSR.w CODE_80A41D			;$80A345
	PLA					;$80A348
	CLC					;$80A349
	ADC.w #$0040				;$80A34A
	TAY					;$80A34D
	PLX					;$80A34E
	INX					;$80A34F
	INX					;$80A350
	RTS					;$80A351

DATA_80A352:
	dw DATA_80C365
	dw DATA_80C35F
	dw DATA_80C365
	dw DATA_80C35F

CODE_80A35A:
	LDA.w $1C37				;$80A35A
	ASL					;$80A35D
	TAY					;$80A35E
	LDA.w DATA_80C328,y			;$80A35F
	STA.w $1C95				;$80A362
	RTS					;$80A365

CODE_80A366:
	JSR.w CODE_80A369			;$80A366
CODE_80A369:
	LDA.w $1C95				;$80A369
	CLC					;$80A36C
	ADC.w #$0040				;$80A36D
	STA.w $1C95				;$80A370
	RTS					;$80A373

CODE_80A374:
	STY.b $36				;$80A374
	LDX.b $30				;$80A376
	BNE.b CODE_80A37B			;$80A378
	RTS					;$80A37A

CODE_80A37B:
	CLC					;$80A37B
	ADC.b $84				;$80A37C
	STA.b $84				;$80A37E
	JSR.w CODE_80A697			;$80A380
	LDA.b $3E				;$80A383
	LDY.w #$00DD				;$80A385
	LDX.w #$0002				;$80A388
	JSR.w CODE_80A4B2			;$80A38B
	LDA.b $40				;$80A38E
	LDY.w #$00C9				;$80A390
	LDX.w #$0002				;$80A393
	JSR.w CODE_80A4B2			;$80A396
	LDA.b $2E				;$80A399
	CMP.w $1C37				;$80A39B
	BNE.b CODE_80A3A7			;$80A39E
	LDA.b active_frame_counter		;$80A3A0
	BIT.w #$0020				;$80A3A2
	BNE.b CODE_80A3C2			;$80A3A5
CODE_80A3A7:
	LDA.w $1C81				;$80A3A7
	PHA					;$80A3AA
	LDA.w $1C8D				;$80A3AB
	STA.w $1C81				;$80A3AE
	LDA.b $36				;$80A3B1
	CLC					;$80A3B3
	ADC.w #$00D5				;$80A3B4
	TAY					;$80A3B7
	LDX.w #DATA_80C378			;$80A3B8
	JSR.w CODE_80A52C			;$80A3BB
	PLA					;$80A3BE
	STA.w $1C81				;$80A3BF
CODE_80A3C2:
	RTS					;$80A3C2

CODE_80A3C3:
	JSR.w CODE_809731			;$80A3C3
	LDY.w #$0000				;$80A3C6
	LDA.b [$84],y				;$80A3C9
	BEQ.b CODE_80A3D8			;$80A3CB
	TYA					;$80A3CD
	STA.b [$84],y				;$80A3CE
	LDA.w #$8000				;$80A3D0
	TSB.w $1C35				;$80A3D3
	SEC					;$80A3D6
	RTS					;$80A3D7

CODE_80A3D8:
	LDA.w #$0567				;$80A3D8
	JSL.l CODE_B28018			;$80A3DB
	LDA.w #$0668				;$80A3DF
	JSL.l CODE_B28018			;$80A3E2
	LDA.w #$0050				;$80A3E6
CODE_80A3E9:
	STA.w $1C87				;$80A3E9
	LDA.w #$4000				;$80A3EC
	TSB.w $1C35				;$80A3EF
	CLC					;$80A3F2
	RTS					;$80A3F3

CODE_80A3F4:
	LDA.w $1C89				;$80A3F4
	JSR.w CODE_809734			;$80A3F7
	LDA.b $84				;$80A3FA
	STA.b $1A				;$80A3FC
	LDA.b $86				;$80A3FE
	STA.b $1C				;$80A400
	JSR.w CODE_809731			;$80A402
	LDY.w #$0289				;$80A405
	SEP.b #$20				;$80A408
CODE_80A40A:
	LDA.b [$1A],y				;$80A40A
	STA.b [$84],y				;$80A40C
	DEY					;$80A40E
	BPL.b CODE_80A40A			;$80A40F
	REP.b #$20				;$80A411
	JSR.w CODE_80A1AA			;$80A413
	RTS					;$80A416

CODE_80A417:
	TYA					;$80A417
	CLC					;$80A418
	ADC.w $1C95				;$80A419
	TAY					;$80A41C
CODE_80A41D:
	LDA.w $0000,x				;$80A41D
	AND.w #$007F				;$80A420
	BEQ.b CODE_80A429			;$80A423
	SEC					;$80A425
	SBC.w #$0020				;$80A426
CODE_80A429:
	ORA.b $38				;$80A429
	STA.b [$42],y				;$80A42B
	INY					;$80A42D
	INY					;$80A42E
	LDA.w $0000,x				;$80A42F
	INX					;$80A432
	BIT.w #$0080				;$80A433
	BEQ.b CODE_80A41D			;$80A436
	RTS					;$80A438

CODE_80A439:
	LDA.w $0000,x				;$80A439
	AND.w #$00FF				;$80A43C
CODE_80A43F:
	SEC					;$80A43F
	SBC.w #$0020				;$80A440
	ORA.b $38				;$80A443
	STA.b [$42],y				;$80A445
	INY					;$80A447
	INY					;$80A448
	INX					;$80A449
	LDA.w $0000,x				;$80A44A
	AND.w #$00FF				;$80A44D
	BNE.b CODE_80A43F			;$80A450
	RTS					;$80A452

CODE_80A453:
	LDY.w $1C3F				;$80A453
	STA.w $0000,y				;$80A456
	INY					;$80A459
	INY					;$80A45A
	TXA					;$80A45B
	STA.w $0000,y				;$80A45C
	INY					;$80A45F
	INY					;$80A460
	STY.w $1C3F				;$80A461
	RTS					;$80A464

CODE_80A465:
	PHK					;$80A465
	PLB					;$80A466
	LDX.w #$1C41				;$80A467
	LDY.b next_oam_slot			;$80A46A
CODE_80A46C:
	LDA.b $00,x				;$80A46C
	BEQ.b CODE_80A495			;$80A46E
	STA.b $1A				;$80A470
	AND.w #$FF00				;$80A472
	CMP.w #$D400				;$80A475
	BEQ.b CODE_80A48F			;$80A478
	LDA.b $02,x				;$80A47A
	PHX					;$80A47C
	TAX					;$80A47D
CODE_80A47E:
	LDA.b $00,x				;$80A47E
	AND.w #$007F				;$80A480
	JSR.w CODE_80A498			;$80A483
	LDA.b $00,x				;$80A486
	INX					;$80A488
	BIT #$0080				;$80A489
	BEQ CODE_80A47E				;$80A48C
	PLX					;$80A48E
CODE_80A48F:
	INX					;$80A48F
	INX					;$80A490
	INX					;$80A491
	INX					;$80A492
	BRA CODE_80A46C				;$80A493

CODE_80A495:
	STY next_oam_slot			;$80A495
	RTS					;$80A497

CODE_80A498:
	SEC					;$80A498
	SBC.w #$0020				;$80A499
	ORA.w $1C81				;$80A49C
	STA.w $0002,y				;$80A49F
	LDA.b $1A				;$80A4A2
	STA.w $0000,y				;$80A4A4
	CLC					;$80A4A7
	ADC.w #$0008				;$80A4A8
	STA.b $1A				;$80A4AB
	INY					;$80A4AD
	INY					;$80A4AE
	INY					;$80A4AF
	INY					;$80A4B0
	RTS					;$80A4B1

CODE_80A4B2:
	JSR.w CODE_80A65F			;$80A4B2
	TYX					;$80A4B5
CODE_80A4B6:
	PLA					;$80A4B6
	CLC					;$80A4B7
	ADC.w #$0064				;$80A4B8
	ORA.w $1C8D				;$80A4BB
	PHY					;$80A4BE
	LDY.b next_oam_slot			;$80A4BF
	STA.w $0002,y				;$80A4C1
	LDA.b $1C				;$80A4C4
	STA.w $0000,y				;$80A4C6
	INY					;$80A4C9
	INY					;$80A4CA
	INY					;$80A4CB
	INY					;$80A4CC
	STY.b next_oam_slot			;$80A4CD
	PLY					;$80A4CF
	CLC					;$80A4D0
	ADC.w #$0008				;$80A4D1
	STA.b $1C				;$80A4D4
	INY					;$80A4D6
	INY					;$80A4D7
	DEX					;$80A4D8
	BNE.b CODE_80A4B6			;$80A4D9
	RTS					;$80A4DB

CODE_80A4DC:
	JSR.w CODE_80A65F			;$80A4DC
	LDA.b $1C				;$80A4DF
	CLC					;$80A4E1
	ADC.b $42				;$80A4E2
	STA.b $42				;$80A4E4
	TYX					;$80A4E6
CODE_80A4E7:
	PLA					;$80A4E7
	CLC					;$80A4E8
	ADC.w #$000F				;$80A4E9
	JSR.w CODE_80A4F8			;$80A4EC
	DEX					;$80A4EF
	BNE.b CODE_80A4E7			;$80A4F0
	LDA.w #$F000				;$80A4F2
	STA.b $42				;$80A4F5
	RTS					;$80A4F7

CODE_80A4F8:
	BMI.b CODE_80A50C			;$80A4F8
	TAY					;$80A4FA
	LDA.b [$46],y				;$80A4FB
	AND.w #$00FF				;$80A4FD
	ASL					;$80A500
	ORA.w $1CAE				;$80A501
	STA.b [$42]				;$80A504
	INC					;$80A506
	LDY.w #$0040				;$80A507
	STA.b [$42],y				;$80A50A
CODE_80A50C:
	INC.b $42				;$80A50C
	INC.b $42				;$80A50E
	RTS					;$80A510

CODE_80A511:
	STY.b $1A				;$80A511
	LDY.b next_oam_slot			;$80A513
CODE_80A515:
	LDA.b $00,x				;$80A515
	AND.w #$007F				;$80A517
	SEC					;$80A51A
	SBC.w #$0020				;$80A51B
	JSR.w CODE_80A498			;$80A51E
	LDA.b $00,x				;$80A521
	INX					;$80A523
	BIT.w #$0080				;$80A524
	BEQ.b CODE_80A515			;$80A527
	STY.b next_oam_slot			;$80A529
	RTS					;$80A52B

CODE_80A52C:
	STY.b $1A				;$80A52C
	LDY.b next_oam_slot			;$80A52E
	LDA.b $00,x				;$80A530
	AND.w #$00FF				;$80A532
CODE_80A535:
	SEC					;$80A535
	SBC.w #$0020				;$80A536
	JSR.w CODE_80A498			;$80A539
	INX					;$80A53C
	LDA.b $00,x				;$80A53D
	AND.w #$00FF				;$80A53F
	BNE.b CODE_80A535			;$80A542
	STY.b next_oam_slot			;$80A544
	RTS					;$80A546

CODE_80A547:
	LDA.w $1CAE				;$80A547
	PHA					;$80A54A
	TYA					;$80A54B
	CLC					;$80A54C
	ADC.b $42				;$80A54D
	CLC					;$80A54F
	ADC.b $36				;$80A550
	STA.b $42				;$80A552
CODE_80A554:
	LDA.b $00,x				;$80A554
	AND.w #$007F				;$80A556
	CMP.w #$005F				;$80A559
	BNE.b CODE_80A561			;$80A55C
	LDA.w #$003E				;$80A56E
CODE_80A561:
	SEC					;$80A561
	SBC.w #$0021				;$80A562
	JSR.w CODE_80A4F8			;$80A565
	LDA.b $00,x				;$80A568
	AND.w #$00FF				;$80A56A
	CMP.w #$005E				;$80A56D
	BNE.b CODE_80A578			;$80A570
	LDY.w #$3400				;$80A572
	STY.w $1CAE				;$80A575
CODE_80A578:
	INX					;$80A578
	BIT.w #$0080				;$80A579
	BEQ.b CODE_80A554			;$80A57C
	PLA					;$80A57E
	STA.w $1CAE				;$80A57F
	LDA.w #$F000				;$80A582
	STA.b $42				;$80A585
	RTS					;$80A587

CODE_80A588:
	JSR.w CODE_80A58C			;$80A588
	RTL					;$80A58B

CODE_80A58C:
	TYA					;$80A58C
	CLC					;$80A58D
	ADC.b $42				;$80A58E
	CLC					;$80A590
	ADC.b $36				;$80A591
	STA.b $42				;$80A593
	LDA.l $7EA7BA,x				;$80A595
	CLC					;$80A599
	ADC.w #$A9DE				;$80A59A
	TAX					;$80A59D
CODE_80A59E:
	LDA.l $7E0000,x				;$80A59E
	AND.w #$00FF				;$80A5A2
CODE_80A5A5:
	CMP.w #$005F				;$80A5A5
	BNE.b CODE_80A5AD			;$80A5A8
	LDA.w #$003E				;$80A5AA
CODE_80A5AD:
	SEC					;$80A5AD
	SBC.w #$0021				;$80A5AE
	JSR.w CODE_80A4F8			;$80A5B1
	INX					;$80A5B4
	LDA.l $7E0000,x				;$80A5B5
	AND.w #$00FF				;$80A5B9
	BNE.b CODE_80A5A5			;$80A5BC
	LDA.w #$F000				;$80A5BE
	STA.b $42				;$80A5C1
	RTS					;$80A5C3

CODE_80A5C4:
	LDA.l $7EA7BA,x				;$80A5C4
	CLC					;$80A5C8
	ADC.w #$A9DE				;$80A5C9
	TAX					;$80A5CC
CODE_80A5CD:
	LDY.w #$FFFF				;$80A5CD
CODE_80A5D0:
	LDA.l $7E0000,x				;$80A5D0
	INX					;$80A5D4
	INY					;$80A5D5
	AND.w #$00FF				;$80A5D6
	BNE.b CODE_80A5D0			;$80A5D9
	STY.b $1A				;$80A5DB
	RTS					;$80A5DD

CODE_80A5DE:
	STY.b $1C				;$80A5DE
	PHX					;$80A5E0
	JSR.w CODE_80A5C4			;$80A5E1
	PLX					;$80A5E4
	LDA.w #$0020				;$80A5E5
	SEC					;$80A5E8
	SBC.b $1A				;$80A5E9
	AND.w #$FFFE				;$80A5EB
	CLC					;$80A5EE
	ADC.b $1C				;$80A5EF
	TAY					;$80A5F1
	RTS					;$80A5F2

CODE_80A5F3:
	STY.b $1C				;$80A5F3
	PHX					;$80A5F5
	JSR.w CODE_80A5CD			;$80A5F6
	PLX					;$80A5F9
	LDA.w #$0020				;$80A5FA
	SEC					;$80A5FD
	SBC.b $1A				;$80A5FE
	AND.w #$FFFE				;$80A600
	CLC					;$80A603
	ADC.b $1C				;$80A604
	TAY					;$80A606
	RTS					;$80A607

CODE_80A608:
	LDY.b next_oam_slot			;$80A608
	LDX.w $1C93				;$80A60A
	LDA.w $04C4				;$80A60D
	BNE.b CODE_80A615			;$80A610
	LDX.w #$0500				;$80A612
CODE_80A615:
	STX.b $1C				;$80A615
	LDA.w $1C37				;$80A617
	ASL					;$80A61A
	TAX					;$80A61B
	LDA.w DATA_80A644,x			;$80A61C
	STA.b $1A				;$80A61F
	LDX.w #$0005				;$80A621
CODE_80A624:
	LDA.b $1A				;$80A624
	CLC					;$80A626
	ADC.b $1C				;$80A627
	STA.w $0000,y				;$80A629
	LDA.w #$31FF				;$80A62C
	STA.w $0002,y				;$80A62F
	INY					;$80A632
	INY					;$80A633
	INY					;$80A634
	INY					;$80A635
	LDA.b $1A				;$80A636
	CLC					;$80A638
	ADC.w #$0008				;$80A639
	STA.b $1A				;$80A63C
	DEX					;$80A63E
	BNE.b CODE_80A624			;$80A63F
	STY.b next_oam_slot			;$80A641
	RTS					;$80A643

DATA_80A644:
	dw $3858
	dw $6858
	dw $9858

CODE_80A64A:
	JSR.w CODE_80A65F			;$80A64A
	TYX					;$80A64D
	LDY.b $1C				;$80A64E
CODE_80A650:
	PLA					;$80A650
	CLC					;$80A651
	ADC.w #$0010				;$80A652
	ORA.b $38				;$80A655
	STA.b [$42],y				;$80A657
	INY					;$80A659
	INY					;$80A65A
	DEX					;$80A65B
	BNE.b CODE_80A650			;$80A65C
	RTS					;$80A65E

CODE_80A65F:
	STA.b $1E				;$80A65F
	STX.b $20				;$80A661
	PLA					;$80A663
	STA.b $22				;$80A664
	TYA					;$80A666
	CLC					;$80A667
	ADC.b $36				;$80A668
	STA.b $1C				;$80A66A
	LDY.w #$0000				;$80A66C
	LDA.b $1E				;$80A66F
	LDX.w #$000A				;$80A671
CODE_80A674:
	SEP.b #$10				;$80A674
	STA.w CPU.dividen_low			;$80A676
	STX.w CPU.divisor			;$80A679
	REP.b #$10				;$80A67C
	LDA.w CPU.divide_remainder		;$80A67E
	LDA.w CPU.divide_remainder		;$80A681
	LDA.w CPU.divide_remainder		;$80A684
	LDA.w CPU.divide_remainder		;$80A687
	PHA					;$80A68A
	INY					;$80A68B
	LDA.w CPU.divide_result			;$80A68C
	DEC.b $20				;$80A68F
	BNE.b CODE_80A674			;$80A691
	LDA.b $22				;$80A693
	PHA					;$80A695
	RTS					;$80A696

CODE_80A697:
	LDY.w #$000A				;$80A697
	LDA.b [$84],y				;$80A69A
	STA.b $1A				;$80A69C
	STA.b $26				;$80A69E
	LDY.w #$000C				;$80A6A0
	LDA.b [$84],y				;$80A6A3
	STA.b $1C				;$80A6A5
	STA.b $28				;$80A6A7
CODE_80A6A9:
	LDA.w #$003C				;$80A6A9
	STA.b $1E				;$80A6AC
	JSR.w CODE_80A729			;$80A6AE
	LDA.b $20				;$80A6B1
	STA.b $1A				;$80A6B3
	LDA.b $22				;$80A6B5
	STA.b $1C				;$80A6B7
	LDA.w #$003C				;$80A6B9
	STA.b $1E				;$80A6BC
	JSR.w CODE_80A729			;$80A6BE
	LDA.b $20				;$80A6C1
	STA.b $1A				;$80A6C3
	LDA.b $22				;$80A6C5
	STA.b $1C				;$80A6C7
	LDA.w #$003C				;$80A6C9
	STA.b $1E				;$80A6CC
	JSR.w CODE_80A729			;$80A6CE
	LDA.b $20				;$80A6D1
	STA.b $40				;$80A6D3
	LDA.b $20				;$80A6D5
	SEP.b #$20				;$80A6D7
	STA.w PPU.fixed_point_mul_B		;$80A6D9
	LDA.b #$78				;$80A6DC
	STA.w PPU.fixed_point_mul_A		;$80A6DE
	LDA.b #$69				;$80A6E1
	STA.w PPU.fixed_point_mul_A		;$80A6E3
	REP.b #$20				;$80A6E6
	LDA.w PPU.multiply_result_word		;$80A6E8
	STA.b $1A				;$80A6EB
	LDA.w PPU.multiply_result_high		;$80A6ED
	AND.w #$00FF				;$80A6F0
	ASL.b $1A				;$80A6F3
	ROL					;$80A6F5
	ASL.b $1A				;$80A6F6
	ROL					;$80A6F8
	ASL.b $1A				;$80A6F9
	ROL					;$80A6FB
	STA.b $1C				;$80A6FC
	LDA.b $26				;$80A6FE
	SEC					;$80A700
	SBC.b $1A				;$80A701
	STA.b $1A				;$80A703
	LDA.b $28				;$80A705
	SBC.b $1C				;$80A707
	STA.b $1C				;$80A709
	LDA.w #$003C				;$80A70B
	STA.b $1E				;$80A70E
	JSR.w CODE_80A729			;$80A710
	LDA.b $20				;$80A713
	STA.b $1A				;$80A715
	LDA.b $22				;$80A717
	STA.b $1C				;$80A719
	LDA.w #$003C				;$80A71B
	STA.b $1E				;$80A71E
	JSR.w CODE_80A729			;$80A720
	LDA.b $20				;$80A723
	STA.b $3E				;$80A725
	SEC					;$80A727
	RTS					;$80A728

CODE_80A729:
	STZ.b $1F				;$80A729
	STZ.b $21				;$80A72B
	STZ.b $23				;$80A72D
	LDA.b $1C				;$80A72F
	STA.w CPU.dividen_low			;$80A731
	SEP.b #$20				;$80A734
	LDA.b $1E				;$80A736
	STA.w CPU.divisor			;$80A738
	REP.b #$20				;$80A73B
	LDA.w CPU.divide_result			;$80A73D
	LDA.w CPU.divide_result			;$80A740
	LDA.w CPU.divide_result			;$80A743
	LDA.w CPU.divide_result			;$80A746
	STA.b $22				;$80A749
	LDA.w CPU.divide_remainder		;$80A74B
	XBA					;$80A74E
	EOR.b $1B				;$80A74F
	AND.w #$FF00				;$80A751
	EOR.b $1B				;$80A754
	STA.w CPU.dividen_low			;$80A756
	SEP.b #$20				;$80A759
	LDA.b $1E				;$80A75B
	STA.w CPU.divisor			;$80A75D
	REP.b #$20				;$80A760
	LDA.w CPU.divide_result			;$80A762
	LDA.w CPU.divide_result			;$80A765
	LDA.w CPU.divide_result			;$80A768
	LDA.w CPU.divide_result			;$80A76B
	CLC					;$80A76E
	ADC.b $21				;$80A76F
	STA.b $21				;$80A771
	LDA.w #$0000				;$80A773
	ADC.b $23				;$80A776
	STA.b $23				;$80A778
	LDA.w CPU.divide_remainder		;$80A77A
	XBA					;$80A77D
	EOR.b $1A				;$80A77E
	AND.w #$FF00				;$80A780
	EOR.b $1A				;$80A783
	STA.w CPU.dividen_low			;$80A785
	SEP.b #$20				;$80A788
	LDA.b $1E				;$80A78A
	STA.w CPU.divisor			;$80A78C
	REP.b #$20				;$80A78F
	LDA.w CPU.divide_result			;$80A791
	LDA.w CPU.divide_result			;$80A794
	LDA.w CPU.divide_result			;$80A797
	LDA.w CPU.divide_result			;$80A79A
	CLC					;$80A79D
	ADC.b $20				;$80A79E
	STA.b $20				;$80A7A0
	LDA.w #$0000				;$80A7A2
	ADC.b $22				;$80A7A5
	STA.b $22				;$80A7A7
	RTS					;$80A7A9

CODE_80A7AA:
	STZ.w PPU.vram_address			;$80A7AA
	LDA.w #DATA_FC14A0			;$80A7AD
	STA.b $42				;$80A7B0
	LDA.w #DATA_FC14A0>>16			;$80A7B2
	STA.b $44				;$80A7B5
	LDA.w #$0064				;$80A7B7
	STA.w $1C83				;$80A7BA
	LDY.w #$0000				;$80A7BD
CODE_80A7C0:
	LDX.w #$0008				;$80A7C0
CODE_80A7C3:
	LDA.b [$42],y				;$80A7C3
	STA.w PPU.vram_write			;$80A7C5
	INY					;$80A7C8
	INY					;$80A7C9
	DEX					;$80A7CA
	BNE.b CODE_80A7C3			;$80A7CB
	STZ.w PPU.vram_write			;$80A7CD
	STZ.w PPU.vram_write			;$80A7D0
	STZ.w PPU.vram_write			;$80A7D3
	STZ.w PPU.vram_write			;$80A7D6
	STZ.w PPU.vram_write			;$80A7D9
	STZ.w PPU.vram_write			;$80A7DC
	STZ.w PPU.vram_write			;$80A7DF
	STZ.w PPU.vram_write			;$80A7E2
	DEC.w $1C83				;$80A7E5
	BNE.b CODE_80A7C0			;$80A7E8
	RTS					;$80A7EA

file_select_number_main:
	JMP.w (DATA_80A7EE,x)			;$80A7EB

DATA_80A7EE:
	dw CODE_80A7F2
	dw CODE_80A804

CODE_80A7F2:
	TYX					;$80A7F2
	INC.b $38,x				;$80A7F3
	LDX.b $5C,y				;$80A7F5
	LDA.w #$001C				;$80A7F7
CODE_80A7FA:
	CLC					;$80A7FA
	ADC.w #$0030				;$80A7FB
	DEX					;$80A7FE
	BPL.b CODE_80A7FA			;$80A7FF
	STA.w $0016,y				;$80A801
CODE_80A804:
	LDX.w $1CB2				;$80A804
	BEQ.b CODE_80A81A			;$80A807
	LDA.b $6A,x				;$80A809
	CMP.w $005C,y				;$80A80B
	BNE.b CODE_80A81A			;$80A80E
	LDA.b $12,x				;$80A810
	STA.w $0012,y				;$80A812
	LDA.b $16,x				;$80A815
	STA.w $0016,y				;$80A817
CODE_80A81A:
	LDA.w $005C,y				;$80A81A
	CLC					;$80A81D
	ADC.w #$006F				;$80A81E
	ORA.w $1C81				;$80A821
	ORA.w #$3000				;$80A824
	STA.b $1A				;$80A827
	LDX.b next_oam_slot			;$80A829
	LDA.w $0012,y				;$80A82B
	SEP.b #$20				;$80A82E
	SEC					;$80A830
	SBC.b #$30				;$80A831
	XBA					;$80A833
	ORA.w $0016,y				;$80A834
	SEC					;$80A837
	SBC.b #$16				;$80A838
	XBA					;$80A83A
	REP.b #$20				;$80A83B
	STA.b $00,x				;$80A83D
	LDA.b $1A				;$80A83F
	STA.b $02,x				;$80A841
	INX					;$80A843
	INX					;$80A844
	INX					;$80A845
	INX					;$80A846
	STX.b next_oam_slot			;$80A847
	JML [$04F5]				;$80A849

file_select_icon_main:
	JMP.w (DATA_80A84F,x)			;$80A84C

DATA_80A84F:
	dw CODE_80A85F
	dw CODE_80A862
	dw CODE_80A8A5
	dw CODE_80A8DA
	dw CODE_80A914
	dw CODE_80A922
	dw CODE_80AA0D
	dw CODE_80AA66

CODE_80A85F:
	JSR.w CODE_80AB28			;$80A85F
CODE_80A862:
	LDA.w $006A,y				;$80A862
	CMP.w $1C37				;$80A865
	BNE.b CODE_80A8A2			;$80A868
	LDA.w #$8000				;$80A86A
	TRB.w $1C35				;$80A86D
	BEQ.b CODE_80A876			;$80A870
	JSL.l delete_sprite_handle_deallocation	;$80A872
CODE_80A876:
	LDA.w #$0200				;$80A876
	TRB.w $1C35				;$80A879
	BEQ.b CODE_80A8A2			;$80A87C
	LDA.w $1C37				;$80A87E
	JSR.w CODE_809DB7			;$80A881
	LDA.w #$0015				;$80A884
	STA.w $0062,y				;$80A887
	STY.w $1CB2				;$80A88A
	LDA.w #$0006				;$80A88D
	STA.w $0038,y				;$80A890
	STZ.b active_frame_counter		;$80A893
	LDA.w #$0100				;$80A895
	TSB.w $1C35				;$80A898
	LDA.w #$0769				;$80A89B
	JSL.l CODE_B28012			;$80A89E
CODE_80A8A2:
	JML [$04F5]				;$80A8A2

CODE_80A8A5:
	TYX					;$80A8A5
	LDA.w #$FA00				;$80A8A6
	STA.b $2A,x				;$80A8A9
	STA.b $30,x				;$80A8AB
	LDA.w #$0040				;$80A8AD
	STA.b $5E,x				;$80A8B0
	LDA.w #$0070				;$80A8B2
	STA.b $4C,x				;$80A8B5
	LDA.w #$00A0				;$80A8B7
	STA.b $4E,x				;$80A8BA
	STA.b $0E,x				;$80A8BC
	LDA.w #$0030				;$80A8BE
	JSR.w CODE_80A3E9			;$80A8C1
	JSR.w CODE_80AB28			;$80A8C4
	INC.b $38,x				;$80A8C7
	LDY.b $6A,x				;$80A8C9
	BEQ.b CODE_80A914			;$80A8CB
CODE_80A8CD:
	JSR.w CODE_80A9A9			;$80A8CD
	DEY					;$80A8D0
	STY.b $0E,x				;$80A8D1
	BNE.b CODE_80A8CD			;$80A8D3
	JSR.w CODE_80A9CB			;$80A8D5
	BRA.b CODE_80A914			;$80A8D8

CODE_80A8DA:
	TYX					;$80A8DA
	LDA.b $6A,x				;$80A8DB
	CMP.w $1C8F				;$80A8DD
	BEQ.b CODE_80A8E7			;$80A8E0
	JSR.w CODE_80A9CB			;$80A8E2
	BRA.b CODE_80A8EA			;$80A8E5

CODE_80A8E7:
	JSR.w CODE_80A9EC			;$80A8E7
CODE_80A8EA:
	LDA.w #$0010				;$80A8EA
	JSR.w CODE_80A3E9			;$80A8ED
	LDA.b $12,x				;$80A8F0
	STA.b $0E,x				;$80A8F2
	CMP.w $1C91				;$80A8F4
	BNE.b CODE_80A90B			;$80A8F7
	LDA.b $2A,x				;$80A8F9
	BPL.b CODE_80A8FF			;$80A8FB
	STZ.b $0E,x				;$80A8FD
CODE_80A8FF:
	EOR.w #$FFFF				;$80A8FF
	INC					;$80A902
	CMP.w #$8000				;$80A903
	ROL					;$80A906
	STA.b $2A,x				;$80A907
	STA.b $30,x				;$80A909
CODE_80A90B:
	INC.b $38,x				;$80A90B
	LDA.w #$0565				;$80A90D
	JSL.l CODE_B28012			;$80A910
CODE_80A914:
	LDA.w #$0012				;$80A914
	JSL.l CODE_B9E003			;$80A917
	BCS.b CODE_80A920			;$80A91B
	JML [$04F5]				;$80A91D

CODE_80A920:
	INC $38,x				;$80A920
CODE_80A922:
	TYX					;$80A922
	LDA #$0080				;$80A923
	BIT $1C35				;$80A926
	BEQ CODE_80A96C				;$80A929
	LDA $1C8F				;$80A92B
	CMP $6A,x				;$80A92E
	BNE CODE_80A965				;$80A930
	TAY					;$80A932
	STY current_game_mode			;$80A933
	LDA #$0001				;$80A936
	STA $38,x				;$80A939
	LDA $1C37				;$80A93B
	STA $6A,x				;$80A93E
	CPY #$0000				;$80A940
	BNE CODE_80A94A				;$80A943
	JSR CODE_80A257				;$80A945
	BRA CODE_80A94D				;$80A948

CODE_80A94A:
	JSR.w CODE_80A26D			;$80A94A
CODE_80A94D:
	LDY.w #$0014				;$80A94D
	LDA.w $1C8F				;$80A950
	BEQ.b CODE_80A958			;$80A953
	LDY.w #$0010				;$80A955
CODE_80A958:
	JSR.w CODE_809E0F			;$80A958
	LDA.w #$0666				;$80A95B
	JSL.l CODE_B28012			;$80A95E
	JML [$04F5]				;$80A962

CODE_80A965:
	JSL.l delete_sprite_handle_deallocation	;$80A965
	JML [$04F5]				;$80A969

CODE_80A96C:
	LDA.w $04CE				;$80A96C
	BIT.w #$0200				;$80A96F
	BEQ.b CODE_80A98C			;$80A972
	JSR.w CODE_80A9A9			;$80A974
	LDA.w #$0003				;$80A977
	STA.b $38,x				;$80A97A
	LDA.w #$0400				;$80A97C
	STA.b $2A,x				;$80A97F
	STA.b $30,x				;$80A981
	LDA.w #$00A0				;$80A983
	STA.w $1C91				;$80A986
	JML [$04F5]				;$80A989

CODE_80A98C:
	BIT.w #$0100				;$80A98C
	BEQ.b CODE_80A9A6			;$80A98F
	JSR.w CODE_80A9BA			;$80A991
	LDA.w #$0003				;$80A994
	STA.b $38,x				;$80A997
	LDA.w #$FC00				;$80A999
	STA.b $2A,x				;$80A99C
	STA.b $30,x				;$80A99E
	LDA.w #$0040				;$80A9A0
	STA.w $1C91				;$80A9A3
CODE_80A9A6:
	JML [$04F5]				;$80A9A6

CODE_80A9A9:
	LDA.b $5E,x				;$80A9A9
	STA.b $1A				;$80A9AB
	LDA.b $4C,x				;$80A9AD
	STA.b $5E,x				;$80A9AF
	LDA.b $4E,x				;$80A9B1
	STA.b $4C,x				;$80A9B3
	LDA.b $1A				;$80A9B5
	STA.b $4E,x				;$80A9B7
	RTS					;$80A9B9

CODE_80A9BA:
	LDA.b $4E,x				;$80A9BA
	STA.b $1A				;$80A9BC
	LDA.b $4C,x				;$80A9BE
	STA.b $4E,x				;$80A9C0
	LDA.b $5E,x				;$80A9C2
	STA.b $4C,x				;$80A9C4
	LDA.b $1A				;$80A9C6
	STA.b $5E,x				;$80A9C8
	RTS					;$80A9CA

CODE_80A9CB:
	LDA.w $1CAC				;$80A9CB
	EOR.b $1E,x				;$80A9CE
	AND.w #$0E00				;$80A9D0
	EOR.b $1E,x				;$80A9D3
	STA.b $1E,x				;$80A9D5
	LDA.w $1CA8				;$80A9D7
	AND.w #$0E00				;$80A9DA
	ORA.w #$8002				;$80A9DD
	STA.b $1A				;$80A9E0
	EOR.b $26,x				;$80A9E2
	AND.w #$4000				;$80A9E4
	EOR.b $1A				;$80A9E7
	STA.b $26,x				;$80A9E9
	RTS					;$80A9EB

CODE_80A9EC:
	LDA.w $1CAA				;$80A9EC
	EOR.b $1E,x				;$80A9EF
	AND.w #$0E00				;$80A9F1
	EOR.b $1E,x				;$80A9F4
	STA.b $1E,x				;$80A9F6
	LDA.w $1CA6				;$80A9F8
	AND.w #$0E00				;$80A9FB
	ORA.w #$8002				;$80A9FE
	STA.b $1A				;$80AA01
	EOR.b $26,x				;$80AA03
	AND.w #$4000				;$80AA05
	EOR.b $1A				;$80AA08
	STA.b $26,x				;$80AA0A
	RTS					;$80AA0C

CODE_80AA0D:
	TYX					;$80AA0D
	DEC.b $62,x				;$80AA0E
	BNE.b CODE_80AA3E			;$80AA10
	LDA.w $1C37				;$80AA12
	ASL					;$80AA15
	ASL					;$80AA16
	TAX					;$80AA17
	SEP.b #$20				;$80AA18
	LDA.l $7EA1F4,x				;$80AA1A
	PHA					;$80AA1E
	LDA.l $7EA1F6,x				;$80AA1F
	STA.l $7EA1F4,x				;$80AA23
	PLA					;$80AA27
	STA.l $7EA1F6,x				;$80AA28
	REP.b #$20				;$80AA2C
	TYX					;$80AA2E
	LDA.w #$000C				;$80AA2F
	STA.b $62,x				;$80AA32
	INC.b $38,x				;$80AA34
	LDA.w #$0100				;$80AA36
	TSB.w $1C35				;$80AA39
	BRA.b CODE_80AA48			;$80AA3C

CODE_80AA3E:
	DEC.b $16,x				;$80AA3E
	LDA.w #$0100				;$80AA40
	TRB.w $1C35				;$80AA43
	BNE.b CODE_80AA4B			;$80AA46
CODE_80AA48:
	JSR.w CODE_80AA89			;$80AA48
CODE_80AA4B:
	LDA.b active_frame_counter		;$80AA4B
	BIT.w #$0003				;$80AA4D
	BNE.b CODE_80AA55			;$80AA50
	JSR.w CODE_80AB05			;$80AA52
CODE_80AA55:
	LDA.b active_frame_counter		;$80AA55
	AND.w #$0003				;$80AA57
	EOR.w #$0003				;$80AA5A
	BNE.b CODE_80AA63			;$80AA5D
	LDX.b current_sprite			;$80AA5F
	INC.b $12,x				;$80AA61
CODE_80AA63:
	JML [$04F5]				;$80AA63

CODE_80AA66:
	TYX					;$80AA66
	DEC.b $62,x				;$80AA67
	BNE.b CODE_80AA79			;$80AA69
	LDA.w #$0001				;$80AA6B
	STA.b $38,x				;$80AA6E
	LDA.w #$820F				;$80AA70
	JSL.l set_fade				;$80AA73
	BRA.b CODE_80AA83			;$80AA77

CODE_80AA79:
	INC.b $16,x				;$80AA79
	LDA.w #$0100				;$80AA7B
	TRB.w $1C35				;$80AA7E
	BNE.b CODE_80AA86			;$80AA81
CODE_80AA83:
	JSR.w CODE_80AAC7			;$80AA83
CODE_80AA86:
	JML [$04F5]				;$80AA86

CODE_80AA89:
	LDY.b $6A,x				;$80AA89
	LDA.w DATA_80C343,y			;$80AA8B
	AND.w #$00FF				;$80AA8E
	TAX					;$80AA91
	LDA.l $7EA18C,x				;$80AA92
	INC					;$80AA96
	STA.l $7EA18C,x				;$80AA97
	LDA.w DATA_80C343+$03,y			;$80AA9B
	AND.w #$00FF				;$80AA9E
	TAX					;$80AAA1
	LDA.l $7EA1B0,x				;$80AAA2
	INC					;$80AAA6
	STA.l $7EA1B0,x				;$80AAA7
	LDA.l $7EA1B5,x				;$80AAAB
	INC					;$80AAAF
	STA.l $7EA1B5,x				;$80AAB0
	LDA.l $7EA1AD,x				;$80AAB4
	DEC					;$80AAB8
	STA.l $7EA1AD,x				;$80AAB9
	LDA.l $7EA1B2,x				;$80AABD
	INC					;$80AAC1
	STA.l $7EA1B2,x				;$80AAC2
	RTS					;$80AAC6

CODE_80AAC7:
	LDY.b $6A,x				;$80AAC7
	LDA.w DATA_80C343,y			;$80AAC9
	AND.w #$00FF				;$80AACC
	TAX					;$80AACF
	LDA.l $7EA18C,x				;$80AAD0
	DEC					;$80AAD4
	STA.l $7EA18C,x				;$80AAD5
	LDA.w DATA_80C343+$03,y			;$80AAD9
	AND.w #$00FF				;$80AADC
	TAX					;$80AADF
	LDA.l $7EA1B0,x				;$80AAE0
	DEC					;$80AAE4
	STA.l $7EA1B0,x				;$80AAE5
	LDA.l $7EA1B5,x				;$80AAE9
	DEC					;$80AAED
	STA.l $7EA1B5,x				;$80AAEE
	LDA.l $7EA1AD,x				;$80AAF2
	INC					;$80AAF6
	STA.l $7EA1AD,x				;$80AAF7
	LDA.l $7EA1B2,x				;$80AAFB
	DEC					;$80AAFF
	STA.l $7EA1B2,x				;$80AB00
	RTS					;$80AB04

CODE_80AB05:
	LDA.l $7EA1AE,x				;$80AB05
	DEC					;$80AB09
	STA.l $7EA1AE,x				;$80AB0A
	LDA.l $7EA1B3,x				;$80AB0E
	DEC					;$80AB12
	STA.l $7EA1B3,x				;$80AB13
	LDA.w DATA_80C343,y			;$80AB17
	AND.w #$00FF				;$80AB1A
	TAX					;$80AB1D
	LDA.l $7EA18A,x				;$80AB1E
	DEC					;$80AB22
	STA.l $7EA18A,x				;$80AB23
	RTS					;$80AB27

CODE_80AB28:
	TYX					;$80AB28
	INC.b $38,x				;$80AB29
	LDA.b $5C,x				;$80AB2B
	ASL					;$80AB2D
	ASL					;$80AB2E
	CLC					;$80AB2F
	ADC.b $5C,x				;$80AB30
	CLC					;$80AB32
	ADC.b $24,x				;$80AB33
	STA.b $24,x				;$80AB35
	RTS					;$80AB37

unknown_sprite_01A8_main:
	LDA.w #$4000				;$80AB38
	BIT.w $1C35				;$80AB3B
	BNE.b CODE_80AB43			;$80AB3E
	JSR.w (DATA_80AB46,x)			;$80AB40
CODE_80AB43:
	JML [$04F5]				;$80AB43

DATA_80AB46:
	dw CODE_80AB50
	dw CODE_80AB82
	dw CODE_80AB98
	dw CODE_80ABFE
	dw CODE_80AC14

CODE_80AB50:
	TYX					;$80AB50
	INC.b $38,x				;$80AB51
	STZ.w $04DA				;$80AB53
	JSR.w CODE_80A35A			;$80AB56
	LDA.w $04C4				;$80AB59
	BNE.b CODE_80AB61			;$80AB5C
	JSR.w CODE_80A369			;$80AB5E
CODE_80AB61:
	LDA.w #$0028				;$80AB61
	LDX.w language_select			;$80AB64
	CPX.w #$0002				;$80AB67
	BNE.b CODE_80AB6F			;$80AB6A
	LDA.w #$0029				;$80AB6C
CODE_80AB6F:
	STA.w $1C9E				;$80AB6F
	JSR.w CODE_80AC66			;$80AB72
	STZ.w $1C91				;$80AB75
	STZ.w $1C93				;$80AB78
	LDA.w #$0003				;$80AB7B
	STA.w $1C3B				;$80AB7E
	RTS					;$80AB81

CODE_80AB82:
	LDA.w #$0F00				;$80AB82
	STA.w $1D83				;$80AB85
	JSR.w CODE_80B28E			;$80AB88
	JSR.w CODE_80AC76			;$80AB8B
	JSR.w CODE_80AC9C			;$80AB8E
	JSR.w CODE_80A2AF			;$80AB91
	JSR.w CODE_80ACBE			;$80AB94
	RTS					;$80AB97

CODE_80AB98:
	JSL.l CODE_808411			;$80AB98
	LDA.w #$0002				;$80AB9C
	BIT.w $1C35				;$80AB9F
	BNE.b CODE_80ABC9			;$80ABA2
	LDA.w $1CA0				;$80ABA4
	CMP.w #$0027				;$80ABA7
	BNE.b CODE_80ABBE			;$80ABAA
	LDA.w #$4944				;$80ABAC
	STA.w $1C97				;$80ABAF
	LDA.w #$4958				;$80ABB2
	STA.w $1C99				;$80ABB5
	LDA.w #$00C5				;$80ABB8
	STA.w $1C9B				;$80ABBB
CODE_80ABBE:
	LDX.w #$0000				;$80ABBE
	JSR.w CODE_80ADB2			;$80ABC1
	LDA.w $04C4				;$80ABC4
	BNE.b CODE_80ABD4			;$80ABC7
CODE_80ABC9:
	LDA.w #$0040				;$80ABC9
	TSB.w $1C35				;$80ABCC
	JSL.l delete_sprite_handle_deallocation	;$80ABCF
	RTS					;$80ABD3

CODE_80ABD4:
	LDA.w #$0666				;$80ABD4
	JSL.l CODE_B28012			;$80ABD7
	TYX					;$80ABDB
	INC.b $38,x				;$80ABDC
	JSR.w CODE_80AC66			;$80ABDE
	STZ.w $1C91				;$80ABE1
	LDA.w #$0080				;$80ABE4
	TSB.w $1C35				;$80ABE7
	JSR.w CODE_80A366			;$80ABEA
	LDA.w #$0001				;$80ABED
	STA.w $04C6				;$80ABF0
	INC					;$80ABF3
	STA.w $05B3				;$80ABF4
	LDY.w #$0012				;$80ABF7
	JSR.w CODE_809E0F			;$80ABFA
	RTS					;$80ABFD

CODE_80ABFE:
	LDA.w #$0F00				;$80ABFE
	STA.w $1D83				;$80AC01
	JSR.w CODE_80B28E			;$80AC04
	JSR.w CODE_80AC76			;$80AC07
	JSR.w CODE_80AC9C			;$80AC0A
	JSR.w CODE_80A2AF			;$80AC0D
	JSR.w CODE_80ACBE			;$80AC10
	RTS					;$80AC13

CODE_80AC14:
	STZ.w $04C6				;$80AC14
	LDA.w #$0001				;$80AC17
	STA.w $05B3				;$80AC1A
	LDA.w $04C4				;$80AC1D
	CMP.w #!gamemode_2_player_contest	;$80AC20
	BEQ.b CODE_80AC2D			;$80AC23
	LDX.w #$0005				;$80AC25
	JSR.w CODE_80AC48			;$80AC28
	BRA.b CODE_80AC3D			;$80AC2B

CODE_80AC2D:
	JSR.w CODE_80939D			;$80AC2D
	JSL.l CODE_808411			;$80AC30
	LDX.w #$0000				;$80AC34
	JSR.w CODE_80AC48			;$80AC37
	JSR.w CODE_80939D			;$80AC3A
CODE_80AC3D:
	LDA.w #$0040				;$80AC3D
	TSB.w $1C35				;$80AC40
	JSL.l delete_sprite_handle_deallocation	;$80AC43
	RTS					;$80AC47

CODE_80AC48:
	LDA.w $1CA0				;$80AC48
	CMP.w #$0027				;$80AC4B
	BNE.b CODE_80AC62			;$80AC4E
	LDA.w #$494B				;$80AC50
	STA.w $1C97				;$80AC53
	LDA.w #$4444				;$80AC56
	STA.w $1C99				;$80AC59
	LDA.w #$00D9				;$80AC5C
	STA.w $1C9B				;$80AC5F
CODE_80AC62:
	JSR.w CODE_80ADB2			;$80AC62
	RTS					;$80AC65

CODE_80AC66:
	STZ.w $1CA2				;$80AC66
	LDA.w #$2700				;$80AC69
	STA.w $1CA4				;$80AC6C
	LDA.w #$0001				;$80AC6F
	STA.w $1CA0				;$80AC72
	RTS					;$80AC75

CODE_80AC76:
	SEP.b #$30				;$80AC76
	LDX.b #$05				;$80AC78
CODE_80AC7A:
	LDY.w $1CA0,x				;$80AC7A
	LDA.w DATA_80C650,y			;$80AC7D
	BNE.b CODE_80AC84			;$80AC80
	LDA.b #$20				;$80AC82
CODE_80AC84:
	STA.w $1C97,x				;$80AC84
	DEX					;$80AC87
	BPL.b CODE_80AC7A			;$80AC88
	LDX.w $1C91				;$80AC8A
	CPX.b #$05				;$80AC8D
	BEQ.b CODE_80AC96			;$80AC8F
	LDA.b #$20				;$80AC91
	STA.w $1C9C				;$80AC93
CODE_80AC96:
	STZ.w $1C9D				;$80AC96
	REP.b #$30				;$80AC99
	RTS					;$80AC9B

CODE_80AC9C:
	LDA.w $04D6				;$80AC9C
	BNE.b CODE_80ACBD			;$80AC9F
	LDA.b active_frame_counter		;$80ACA1
	BIT.w #$0008				;$80ACA3
	BNE.b CODE_80ACBD			;$80ACA6
	LDX.w $1C91				;$80ACA8
	SEP.b #$30				;$80ACAB
	LDY.w $1C97,x				;$80ACAD
	LDA.b #$20				;$80ACB0
	CPY.b #$20				;$80ACB2
	BNE.b CODE_80ACB8			;$80ACB4
	LDA.b #$2A				;$80ACB6
CODE_80ACB8:
	STA.w $1C97,x				;$80ACB8
	REP.b #$30				;$80ACBB
CODE_80ACBD:
	RTS					;$80ACBD

CODE_80ACBE:
	LDX.w $1C91				;$80ACBE
	CPX.w #$0005				;$80ACC1
	BNE.b CODE_80ACD8			;$80ACC4
	LDA.w $1D83				;$80ACC6
	BIT.w #$0F00				;$80ACC9
	BEQ.b CODE_80ACD8			;$80ACCC
	LDA.w $1CA0,x				;$80ACCE
	EOR.w #$0001				;$80ACD1
	STA.w $1CA0,x				;$80ACD4
	RTS					;$80ACD7

CODE_80ACD8:
	LDA.w $1D83				;$80ACD8
	BIT.w #$0900				;$80ACDB
	BEQ.b CODE_80ACFA			;$80ACDE
	SEP.b #$20				;$80ACE0
	LDA.w $1CA0,x				;$80ACE2
	INC					;$80ACE5
	CMP.w $1C9E				;$80ACE6
	BCC.b CODE_80ACED			;$80ACE9
	LDA.b #$01				;$80ACEB
CODE_80ACED:
	STA.w $1CA0,x				;$80ACED
	REP.b #$20				;$80ACF0
	LDA.w #$0565				;$80ACF2
	JSL.l CODE_B28012			;$80ACF5
	RTS					;$80ACF9

CODE_80ACFA:
	BIT.w #$0600				;$80ACFA
	BEQ.b CODE_80AD1A			;$80ACFD
	SEP.b #$20				;$80ACFF
	LDA.w $1CA0,x				;$80AD01
	BEQ.b CODE_80AD10			;$80AD04
	DEC					;$80AD06
	BNE.b CODE_80AD0D			;$80AD07
	LDA.w $1C9E				;$80AD09
	DEC					;$80AD0C
CODE_80AD0D:
	STA.w $1CA0,x				;$80AD0D
CODE_80AD10:
	REP.b #$20				;$80AD10
	LDA.w #$0565				;$80AD12
	JSL.l CODE_B28012			;$80AD15
	RTS					;$80AD19

CODE_80AD1A:
	LDA.w $04DA				;$80AD1A
	BIT.w #$8080				;$80AD1D
	BEQ.b CODE_80AD59			;$80AD20
	JSR.w CODE_80AD67			;$80AD22
	BCS.b CODE_80AD51			;$80AD25
	LDA.w $1C91				;$80AD27
	INC					;$80AD2A
	CMP.w #$0006				;$80AD2B
	BCS.b CODE_80AD92			;$80AD2E
	CMP.w #$0005				;$80AD30
	BCC.b CODE_80AD3E			;$80AD33
	SEP.b #$10				;$80AD35
	LDX.b #$27				;$80AD37
	STX.w $1CA5				;$80AD39
	REP.b #$10				;$80AD3C
CODE_80AD3E:
	STA.w $1C91				;$80AD3E
	TAX					;$80AD41
	SEP.b #$20				;$80AD42
	LDA.w $1CA0,x				;$80AD44
	BNE.b CODE_80AD4F			;$80AD47
	LDA.w $1C9F,x				;$80AD49
	STA.w $1CA0,x				;$80AD4C
CODE_80AD4F:
	REP.b #$20				;$80AD4F
CODE_80AD51:
	LDA.w #$0666				;$80AD51
	JSL.l CODE_B28012			;$80AD54
	RTS					;$80AD58

CODE_80AD59:
	BIT.w #$1000				;$80AD59
	BNE.b CODE_80AD92			;$80AD5C
	BIT.w #$0200				;$80AD5E
	BEQ.b CODE_80AD66			;$80AD61
	DEC.w $1C91				;$80AD63
CODE_80AD66:
	RTS					;$80AD66

CODE_80AD67:
	LDX.w $1C91				;$80AD67
	LDA.w $1CA0,x				;$80AD6A
	AND.w #$00FF				;$80AD6D
	CMP.w #$0026				;$80AD70
	BNE.b CODE_80AD8D			;$80AD73
	SEP.b #$20				;$80AD75
	LDA.w $1C91				;$80AD77
	DEC					;$80AD7A
	BMI.b CODE_80AD87			;$80AD7B
	STA.w $1C91				;$80AD7D
	CMP.b #$04				;$80AD80
	BEQ.b CODE_80AD87			;$80AD82
	STZ.w $1CA0,x				;$80AD84
CODE_80AD87:
	REP.b #$20				;$80AD87
	SEC					;$80AD89
	RTS					;$80AD8A

CODE_80AD8B:
	CLC					;$80AD8B
	RTS					;$80AD8C

CODE_80AD8D:
	CMP.w #$0027				;$80AD8D
	BNE.b CODE_80AD8B			;$80AD90
CODE_80AD92:
	LDX.w $1C91				;$80AD92
	LDA.w #$0027				;$80AD95
	STA.w $1CA0,x				;$80AD98
	LDA.w #$0020				;$80AD9B
	STA.w $1C97,x				;$80AD9E
	LDA.w #$0A00				;$80ADA1
	STA.w $1C93				;$80ADA4
	LDA.w #$0080				;$80ADA7
	TRB.w $1C35				;$80ADAA
	LDX.b current_sprite			;$80ADAD
	INC.b $38,x				;$80ADAF
	RTS					;$80ADB1

CODE_80ADB2:
	LDA.w $1C97				;$80ADB2
	STA.w $05D9,x				;$80ADB5
	LDA.w $1C98				;$80ADB8
	STA.w $05DA,x				;$80ADBB
	LDA.w $1C9A				;$80ADBE
	STA.w $05DC,x				;$80ADC1
	TXA					;$80ADC4
	CLC					;$80ADC5
	ADC.w $1C91				;$80ADC6
	TAX					;$80ADC9
	BEQ.b CODE_80ADD5			;$80ADCA
	LDA.w $05D8,x				;$80ADCC
	ORA.w #$0080				;$80ADCF
	STA.w $05D8,x				;$80ADD2
CODE_80ADD5:
	SEP.b #$20				;$80ADD5
	LDA.b #$A0				;$80ADD7
	STA.w $1C9C				;$80ADD9
	REP.b #$20				;$80ADDC
	JSR.w CODE_809FED			;$80ADDE
	JSR.w CODE_80A2A5			;$80ADE1
	LDY.b current_sprite			;$80ADE4
	RTS					;$80ADE6

play_mode_text_main:
	JMP.w (DATA_80ADEA,x)			;$80ADE7

DATA_80ADEA:
	dw CODE_80ADEE
	dw CODE_80ADF5

CODE_80ADEE:
	TYX					;$80ADEE
	INC.b $38,x				;$80ADEF
	LDA.b $24,x				;$80ADF1
	STA.b $5C,x				;$80ADF3
CODE_80ADF5:
	TYX					;$80ADF5
	LDA.w $1C3B				;$80ADF6
	ASL					;$80ADF9
	ASL					;$80ADFA
	TAY					;$80ADFB
	CLC					;$80ADFC
	ADC.w $1C3B				;$80ADFD
	CLC					;$80AE00
	ADC.b $5C,x				;$80AE01
	STA.b $24,x				;$80AE03
	LDA.w DATA_80C32E,y			;$80AE05
	STA.b $12,x				;$80AE08
	LDA.w DATA_80C32E+$02,y			;$80AE0A
	STA.b $1A				;$80AE0D
	LDA.w $1C37				;$80AE0F
	ASL					;$80AE12
	TAY					;$80AE13
	LDA.w DATA_80C322,y			;$80AE14
	CLC					;$80AE17
	ADC.b $1A				;$80AE18
	STA.b $16,x				;$80AE1A
	LDA.w #$2000				;$80AE1C
	BIT.w $1C35				;$80AE1F
	BNE.b CODE_80AE35			;$80AE22
	LDA.b active_frame_counter		;$80AE24
	BIT.w #$0010				;$80AE26
	BNE.b CODE_80AE32			;$80AE29
	LDA.b $12,x				;$80AE2B
	EOR.w #$0100				;$80AE2D
	STA.b $12,x				;$80AE30
CODE_80AE32:
	JML [$04F5]				;$80AE32

CODE_80AE35:
	LDA.b $12,x				;$80AE35
	ORA.w #$0100				;$80AE37
	STA.b $12,x				;$80AE3A
	BRA.b CODE_80AE32			;$80AE3C

CODE_80AE3E:
	JSR.w CODE_809437			;$80AE3E
	LDA.w #$00CF				;$80AE41
	JSL.l CODE_BB859A			;$80AE44
	ORA.w #$3000				;$80AE48
	CLC					;$80AE4B
	ADC.w #$01C0				;$80AE4C
	STA.b $B4				;$80AE4F
	LDA.w #$002A				;$80AE51
	JSL.l vram_payload_handler_global	;$80AE54
	LDA.w #$0028				;$80AE58
	JSL.l set_PPU_registers_global		;$80AE5B
	STZ.w PPU.set_window_layer_all		;$80AE5F
	LDA.w #$002E				;$80AE62
	LDX.w #$0020				;$80AE65
	LDY.w #$0000				;$80AE68
	JSL.l CODE_BB856D			;$80AE6B
	LDX.w #$7EF000				;$80AE6F
	LDY.w #$7EF000>>16			;$80AE72
	LDA.w #$0800				;$80AE75
	JSL.l CODE_808CEC			;$80AE78
	SEP.b #$20				;$80AE7C
	LDX.w #$3001				;$80AE7E
	STX.w HDMA[$01].settings		;$80AE81
	LDX.w #$7EA15A				;$80AE84
	STX.w HDMA[$01].source_word		;$80AE87
	LDA.b #$7EA15A>>16			;$80AE8A
	STA.w HDMA[$01].source_bank		;$80AE8C
	STA.w HDMA[$01].indirect_source_bank	;$80AE8F
	LDX.w #$2C01				;$80AE92
	STX.w HDMA[$02].settings		;$80AE95
	LDX.w #$7EA164				;$80AE98
	STX.w HDMA[$02].source_word		;$80AE9B
	LDA.b #$7EA164>>16			;$80AE9E
	STA.w HDMA[$02].source_bank		;$80AEA0
	STA.w HDMA[$02].indirect_source_bank	;$80AEA3
	REP.b #$20				;$80AEA6
	LDA.w #$0601				;$80AEA8
	STA.w $04E4				;$80AEAB
	LDA.w #$0020				;$80AEAE
	STA.l $7EA15A				;$80AEB1
	LDA.w #$0102				;$80AEB5
	STA.l $7EA15B				;$80AEB8
	LDA.w #$0060				;$80AEBC
	STA.l $7EA15D				;$80AEBF
	LDA.w #$0102				;$80AEC3
	STA.l $7EA15E				;$80AEC6
	LDA.w #$0060				;$80AECA
	STA.l $7EA160				;$80AECD
	LDA.w #$4102				;$80AED1
	STA.l $7EA161				;$80AED4
	LDA.w #$0000				;$80AED8
	STA.l $7EA163				;$80AEDB
	STA.l $7EA16D				;$80AEDF
	LDA.w #$0050				;$80AEE3
	STA.l $7EA164				;$80AEE6
	STA.l $7EA167				;$80AEEA
	STA.l $7EA16A				;$80AEEE
	LDA.w #$1605				;$80AEF2
	STA.l $7EA165				;$80AEF5
	STA.l $7EA168				;$80AEF9
	LDA.w #$1201				;$80AEFD
	STA.l $7EA16B				;$80AF00
	LDA.w #$0020				;$80AF04
	BIT.w $05B1				;$80AF07
	BEQ.b CODE_80AF0F			;$80AF0A
	JSR.w CODE_8091A9			;$80AF0C
CODE_80AF0F:
	LDA.w #$0001				;$80AF0F
	STA.w $06DA				;$80AF12
	JSR.w CODE_80AF3E			;$80AF15
	JSL.l CODE_808799			;$80AF18
	JSL.l CODE_808799			;$80AF1C
	JSL.l CODE_808799			;$80AF20
	JSL.l CODE_808799			;$80AF24
	LDA.w #$0200				;$80AF28
	JSL.l set_fade				;$80AF2B
	LDA.w #$0001				;$80AF2F
	TRB.w $05AF				;$80AF32
	LDA.w #CODE_80B1ED			;$80AF35
	LDX.w #CODE_80B1ED>>16			;$80AF38
	JMP.w CODE_8083C3			;$80AF3B

CODE_80AF3E:
	LDA.w #DATA_B6F42C			;$80AF3E
	STA.b $46				;$80AF41
	LDA.w #DATA_B6F42C>>16			;$80AF43
	STA.b $48				;$80AF46
	STZ.b $36				;$80AF48
	LDX.w #$3EFF				;$80AF4A
	JSR.w CODE_80B040			;$80AF4D
	LDA.w #$2000				;$80AF50
	STA.w $1CAE				;$80AF53
	STZ.w $1CC8				;$80AF56
	LDA.w $04C4				;$80AF59
	BEQ.b CODE_80AFA9			;$80AF5C
	CMP.w #!gamemode_2_player_contest	;$80AF5E
	BEQ.b CODE_80AF7A			;$80AF61
	LDX.w #$05D9				;$80AF63
	JSR.w CODE_80B054			;$80AF66
	LDX.w #$C649				;$80AF69
	JSR.w CODE_80B054			;$80AF6C
	LDX.w #$05DE				;$80AF6F
	JSR.w CODE_80B054			;$80AF72
	JSR.w CODE_80B076			;$80AF75
	BRA.b CODE_80AFB2			;$80AF78

CODE_80AF7A:
	LDA.w $04C6				;$80AF7A
	PHA					;$80AF7D
	BEQ.b CODE_80AF83			;$80AF7E
	JSR.w CODE_80939D			;$80AF80
CODE_80AF83:
	LDX.w #$05D9				;$80AF83
	JSR.w CODE_80B054			;$80AF86
	LDX.w #$C64C				;$80AF89
	JSR.w CODE_80B054			;$80AF8C
	JSR.w CODE_80939D			;$80AF8F
	LDX.w #$05D9				;$80AF92
	JSR.w CODE_80B054			;$80AF95
	JSR.w CODE_80939D			;$80AF98
	PLA					;$80AF9B
	BEQ.b CODE_80AFA1			;$80AF9C
	JSR.w CODE_80939D			;$80AF9E
CODE_80AFA1:
	JSR.w CODE_809FED			;$80AFA1
	JSR.w CODE_80B076			;$80AFA4
	BRA.b CODE_80AFDF			;$80AFA7

CODE_80AFA9:
	LDX.w #$05D9				;$80AFA9
	JSR.w CODE_80B054			;$80AFAC
	JSR.w CODE_80B076			;$80AFAF
CODE_80AFB2:
	LDA.w #$3800				;$80AFB2
	STA.w $1CAE				;$80AFB5
	LDA.w #$0000				;$80AFB8
	JSR.w CODE_80B098			;$80AFBB
	LDA.w #$0102				;$80AFBE
	STA.l $7EA161				;$80AFC1
	LDA.w #$FFD3				;$80AFC5
	STA.w $1973				;$80AFC8
	SEP.b #$20				;$80AFCB
	STA.w PPU.layer_2_scroll_y		;$80AFCD
	XBA					;$80AFD0
	STA.w PPU.layer_2_scroll_y		;$80AFD1
	XBA					;$80AFD4
	STA.w PPU.layer_3_scroll_y		;$80AFD5
	XBA					;$80AFD8
	STA.w PPU.layer_3_scroll_y		;$80AFD9
	REP.b #$20				;$80AFDC
	RTS					;$80AFDE

CODE_80AFDF:
	LDA.w #$3800				;$80AFDF
	STA.w $1CAE				;$80AFE2
	LDA.w $05B1				;$80AFE5
	PHA					;$80AFE8
	LDA.w $04C6				;$80AFE9
	PHA					;$80AFEC
	BEQ.b CODE_80AFFD			;$80AFED
	LDA.w #$0102				;$80AFEF
	STA.l $7EA161				;$80AFF2
	LDA.w #$4102				;$80AFF6
	STA.l $7EA15E				;$80AFF9
CODE_80AFFD:
	JSR.w CODE_8093AD			;$80AFFD
	LDA.w #$0000				;$80B000
	JSR.w CODE_80B098			;$80B003
	JSR.w CODE_8093BA			;$80B006
	JSR.w CODE_809FED			;$80B009
	LDA.w #$0300				;$80B00C
	JSR.w CODE_80B098			;$80B00F
	PLA					;$80B012
	STA.w $04C6				;$80B013
	JSR.w CODE_8093FF			;$80B016
	PLA					;$80B019
	STA.w $05B1				;$80B01A
	LDA.w #$FFFF				;$80B01D
	STA.w $1973				;$80B020
	LDA.w #$0020				;$80B023
	BIT.w $05B1				;$80B026
	BNE.b CODE_80B039			;$80B029
	LDA.w #$0102				;$80B02B
	STA.l $7EA161				;$80B02E
	LDA.w #$0102				;$80B032
	STA.l $7EA15E				;$80B035
CODE_80B039:
	LDA.w #$0201				;$80B039
	STA.w $04E4				;$80B03C
	RTS					;$80B03F

CODE_80B040:
	JSR.w CODE_809FED			;$80B040
	TXA					;$80B043
	LDX.w #$F000				;$80B044
	LDY.w #$0400				;$80B047
CODE_80B04A:
	STA.l $7E0000,x				;$80B04A
	INX					;$80B04E
	INX					;$80B04F
	DEY					;$80B050
	BPL.b CODE_80B04A			;$80B051
	RTS					;$80B053

CODE_80B054:
	SEP.b #$20				;$80B054
	LDY.w $1CC8				;$80B056
	LDA.b $00,x				;$80B059
	BIT.b #$80				;$80B05B
	BNE.b CODE_80B06A			;$80B05D
CODE_80B05F:
	STA.w $1CB4,y				;$80B05F
	INY					;$80B062
	INX					;$80B063
	LDA.b $00,x				;$80B064
	BIT.b #$80				;$80B066
	BEQ.b CODE_80B05F			;$80B068
CODE_80B06A:
	AND.b #$7F				;$80B06A
	STA.w $1CB4,y				;$80B06C
	INY					;$80B06F
	STY.w $1CC8				;$80B070
	REP.b #$20				;$80B073
	RTS					;$80B075

CODE_80B076:
	LDY.w $1CC8				;$80B076
	LDA.w $1CB3,y				;$80B079
	ORA.w #$0080				;$80B07C
	STA.w $1CB3,y				;$80B07F
	LDA.w #$0020				;$80B082
	SEC					;$80B085
	SBC.w $1CC8				;$80B086
	AND.w #$00FE				;$80B089
	CLC					;$80B08C
	ADC.w #$0040				;$80B08D
	TAY					;$80B090
	LDX.w #$001CB4				;$80B091
	JSR.w CODE_80A547			;$80B094
	RTS					;$80B097

CODE_80B098:
	STA.b $36				;$80B098
	LSR					;$80B09A
	LSR					;$80B09B
	LSR					;$80B09C
	STA.b $34				;$80B09D
	JSR.w CODE_809FED			;$80B09F
	LDA.b $C2				;$80B0A2
	STA.b $1A				;$80B0A4
	STA.b $26				;$80B0A6
	LDA.b $C4				;$80B0A8
	STA.b $1C				;$80B0AA
	STA.b $28				;$80B0AC
	JSR.w CODE_80A6A9			;$80B0AE
	LDA.b $40				;$80B0B1
	LDX.w #$0002				;$80B0B3
	LDY.w #$0110				;$80B0B6
	JSR.w CODE_80A4DC			;$80B0B9
	LDA.b $3E				;$80B0BC
	LDX.w #$0002				;$80B0BE
	LDY.w #$0116				;$80B0C1
	JSR.w CODE_80A4DC			;$80B0C4
	JSR.w CODE_80B18E			;$80B0C7
	LDX.w #$0003				;$80B0CA
	LDY.w #$011E				;$80B0CD
	JSR.w CODE_80A4DC			;$80B0D0
	LDX.w #DATA_80C647			;$80B0D3
	LDY.w #$0114				;$80B0D6
	JSR.w CODE_80A547			;$80B0D9
	LDX.w #DATA_80C648			;$80B0DC
	LDY.w #$0124				;$80B0DF
	JSR.w CODE_80A547			;$80B0E2
	LDA.w $05CF				;$80B0E5
	LDX.w #$0002				;$80B0E8
	LDY.w #$012E				;$80B0EB
	JSR.w CODE_80A4DC			;$80B0EE
	LDA.w $05C9				;$80B0F1
	LDX.w #$0002				;$80B0F4
	LDY.w #$01CE				;$80B0F7
	JSR.w CODE_80A4DC			;$80B0FA
	LDA.w $05CB				;$80B0FD
	LDX.w #$0002				;$80B100
	LDY.w #$01DA				;$80B103
	JSR.w CODE_80A4DC			;$80B106
	LDA.w $05CD				;$80B109
	LDX.w #$0002				;$80B10C
	LDY.w #$01E6				;$80B10F
	JSR.w CODE_80A4DC			;$80B112
	LDX.w #$0003				;$80B115
CODE_80B118:
	TXA					;$80B118
	PHX					;$80B119
	ASL					;$80B11A
	TAX					;$80B11B
	LDY.w DATA_80C31A,x			;$80B11C
	JSL.l CODE_BB85B8			;$80B11F
	LDX.b alternate_sprite			;$80B123
	LDA.b $16,x				;$80B125
	CLC					;$80B127
	ADC.b $34				;$80B128
	STA.b $16,x				;$80B12A
	JSL.l CODE_B38006			;$80B12C
	STZ.w $1560				;$80B130
	STZ.w $155E				;$80B133
	PLX					;$80B136
	DEX					;$80B137
	BPL.b CODE_80B118			;$80B138
	LDY.w #$0264				;$80B13A
	JSL.l CODE_BB85B5			;$80B13D
	LDX.b alternate_sprite			;$80B141
	LDA.w #$00BD				;$80B143
	STA.b $12,x				;$80B146
	LDA.w #$0039				;$80B148
	CLC					;$80B14B
	ADC.b $34				;$80B14C
	STA.b $16,x				;$80B14E
	LDA.w $0603				;$80B150
	STA.b $5E,x				;$80B153
	LDY.w #$0260				;$80B155
	JSL.l CODE_BB85B8			;$80B158
	LDX.b alternate_sprite			;$80B15C
	LDA.b $16,x				;$80B15E
	CLC					;$80B160
	ADC.b $34				;$80B161
	STA.b $16,x				;$80B163
	LDY.w #$025C				;$80B165
	JSL.l CODE_BB85B8			;$80B168
	LDX.b alternate_sprite			;$80B16C
	STX.w $18E7				;$80B16E
	LDA.w $0605				;$80B171
	STA.b $68,x				;$80B174
	LDA.w $0607				;$80B176
	STA.b $6A,x				;$80B179
	LDA.w #$00C8				;$80B17B
	STA.b $12,x				;$80B17E
	LDA.w #$005B				;$80B180
	CLC					;$80B183
	ADC.b $34				;$80B184
	STA.b $16,x				;$80B186
	LDA.w #$0200				;$80B188
	STA.b $38,x				;$80B18B
	RTS					;$80B18D

CODE_80B18E:
	STZ.b $1A				;$80B18E
	LDX.w #$004C				;$80B190
CODE_80B193:
	LDA.w $0632,x				;$80B193
	BIT.w #$0002				;$80B196
	BEQ.b CODE_80B19D			;$80B199
	INC.b $1A				;$80B19B
CODE_80B19D:
	AND.w #$001C				;$80B19D
	EOR.w #$001C				;$80B1A0
	BNE.b CODE_80B1A7			;$80B1A3
	INC.b $1A				;$80B1A5
CODE_80B1A7:
	DEX					;$80B1A7
	CPX.w #$0010				;$80B1A8
	BCS.b CODE_80B193			;$80B1AB
	DEC.b $1A				;$80B1AD
	LDA.w $0655				;$80B1AF
	BIT.w #$0002				;$80B1B2
	BEQ.b CODE_80B1B9			;$80B1B5
	INC.b $1A				;$80B1B7
CODE_80B1B9:
	BIT.w #$0200				;$80B1B9
	BEQ.b CODE_80B1C0			;$80B1BC
	INC.b $1A				;$80B1BE
CODE_80B1C0:
	LDA.w #$0040				;$80B1C0
	BIT.w $05B1				;$80B1C3
	BEQ.b CODE_80B1CA			;$80B1C6
	INC.b $1A				;$80B1C8
CODE_80B1CA:
	LDA.b $1A				;$80B1CA
	CMP.w #$0067				;$80B1CC
	BNE.b CODE_80B1EA			;$80B1CF
	LDA.w $06A1				;$80B1D1
	AND.w #$C000				;$80B1D4
	BNE.b CODE_80B1DB			;$80B1D7
	INC.b $1A				;$80B1D9
CODE_80B1DB:
	LDA.w $06A1				;$80B1DB
	AND.w #$8080				;$80B1DE
	EOR.w #$8080				;$80B1E1
	BNE.b CODE_80B1EA			;$80B1E4
	INC.b $1A				;$80B1E6
	INC.b $1A				;$80B1E8
CODE_80B1EA:
	LDA.b $1A				;$80B1EA
	RTS					;$80B1EC

CODE_80B1ED:
	LDA.w $04E4				;$80B1ED
	STA.w CPU.enable_dma_hdma		;$80B1F0
	LDX.w #$7400				;$80B1F3
	STX.w PPU.vram_address			;$80B1F6
	LDA.w #$7EF000				;$80B1F9
	STA.w DMA[$00].source_word		;$80B1FC
	STA.w DMA[$00].unused_2			;$80B1FF
	LDA.w #$0800				;$80B202
	STA.w DMA[$00].size			;$80B205
	LDA.w #$1801				;$80B208
	STA.w DMA[$00].settings			;$80B20B
	SEP.b #$20				;$80B20E
	LDA.b #$7EF000>>16			;$80B210
	STA.w DMA[$00].source_bank		;$80B212
	LDA.b #$01				;$80B215
	STA.w CPU.enable_dma			;$80B217
	REP.b #$20				;$80B21A
	JSL.l CODE_B38006			;$80B21C
	JSL.l CODE_808799			;$80B220
	SEP.b #$20				;$80B224
	LDA.w screen_brightness			;$80B226
	STA.w PPU.screen			;$80B229
	REP.b #$20				;$80B22C
	STZ.w $1560				;$80B22E
	STZ.w $155E				;$80B231
	LDA.w screen_brightness			;$80B234
	BIT.w #$FF00				;$80B237
	BNE.b CODE_80B24C			;$80B23A
	JSL.l CODE_8089CA			;$80B23C
	LDA.w $04DA				;$80B240
	AND.w #$9180				;$80B243
	BEQ.b CODE_80B24C			;$80B246
	JSL.l CODE_B8807E			;$80B248
CODE_80B24C:
	JSL.l CODE_B7800C			;$80B24C
	JSL.l sprite_handler			;$80B250
	JSL.l CODE_B7800F			;$80B254
	JSL.l CODE_80898C			;$80B258
	JSR.w CODE_809741			;$80B25C
	BEQ.b CODE_80B264			;$80B25F
	JMP.w CODE_808384			;$80B261

CODE_80B264:
	LDA.w #$0020				;$80B264
	BIT.w $05B1				;$80B267
	BNE.b CODE_80B282			;$80B26A
	LDA.w #$0500				;$80B26C
	JSL.l CODE_B28012			;$80B26F
	LDA.w #$0020				;$80B273
	TSB.w $05B1				;$80B276
	LDA.w #CODE_809489			;$80B279
	LDX.w #CODE_809489>>16			;$80B27C
	JMP.w CODE_8083C3			;$80B27F

CODE_80B282:
	STZ.w $05E3				;$80B282
	LDA.w #CODE_B48000			;$80B285
	LDX.w #CODE_B48000>>16			;$80B288
	JMP.w CODE_8083C3			;$80B28B

CODE_80B28E:
	LDA.w $04D6				;$80B28E
	AND.w $1D83				;$80B291
	BNE.b CODE_80B29A			;$80B294
	STZ.w $1D83				;$80B296
	RTS					;$80B299

CODE_80B29A:
	LDA.w $04DA				;$80B29A
	AND.w $1D83				;$80B29D
	BNE.b CODE_80B2BE			;$80B2A0
	LDA.w $1D81				;$80B2A2
	BEQ.b CODE_80B2AE			;$80B2A5
	DEC.w $1D81				;$80B2A7
	STZ.w $1D83				;$80B2AA
	RTS					;$80B2AD

CODE_80B2AE:
	LDA.w #$0002				;$80B2AE
	STA.w $1D81				;$80B2B1
	LDA.w $04D6				;$80B2B4
	AND.w $1D83				;$80B2B7
	STA.w $1D83				;$80B2BA
	RTS					;$80B2BD

CODE_80B2BE:
	STA.w $1D83				;$80B2BE
	LDA.w #$0010				;$80B2C1
	STA.w $1D81				;$80B2C4
	RTS					;$80B2C7

CODE_80B2C8:
	PHK					;$80B2C8
	PLB					;$80B2C9
	LDA.w #$4001				;$80B2CA
	TRB.w $05AF				;$80B2CD
	STZ.b current_animal_type		;$80B2D0
	LDA.w #$1D93				;$80B2D2
	STA.w $0541				;$80B2D5
	LDA.w #$0040				;$80B2D8
	STA.w $053D				;$80B2DB
	LDA.w $05E3				;$80B2DE
	ASL					;$80B2E1
	ASL					;$80B2E2
	ASL					;$80B2E3
	TAX					;$80B2E4
	LDA.w DATA_80C679+$06,x			;$80B2E5
	BMI.b CODE_80B32B			;$80B2E8
	STA.w $051D				;$80B2EA
	LDA.w DATA_80C679+$04,x			;$80B2ED
	AND.w #$00FF				;$80B2F0
	STA.b level_number			;$80B2F3
	STZ.w $05B7				;$80B2F5
	LDA.w DATA_80C679+$02,x			;$80B2F8
	SEC					;$80B2FB
	SBC.w #$039A				;$80B2FC
	STA.b $BE				;$80B2FF
	LDA.w DATA_80C679+$05,x			;$80B301
	AND.w #$00FF				;$80B304
	BEQ.b CODE_80B31B			;$80B307
	STA.b $BA				;$80B309
	LDA.w #CODE_80B378			;$80B30B
	STA.b $4E				;$80B30E
	LDA.w #CODE_80B378>>16			;$80B310
	STA.b $50				;$80B313
	LDA.w #CODE_808370			;$80B315
	JMP.w CODE_80839D			;$80B318

CODE_80B31B:
	LDA.w #CODE_808493			;$80B31B
	STA.b $4E				;$80B31E
	LDA.w #CODE_808493>>16			;$80B320
	STA.b $50				;$80B323
	LDA.w #CODE_8083CC			;$80B325
	JMP.w CODE_80839D			;$80B328

CODE_80B32B:
	LDX.w #CODE_80B33D			;$80B32B
	LDY.w #CODE_80B33D>>16			;$80B32E
	STX.b $4E				;$80B331
	STY.b $50				;$80B333
	STZ.b active_frame_counter		;$80B335
	LDA.w #CODE_808370			;$80B337
	JMP.w CODE_80839D			;$80B33A

CODE_80B33D:
	LDA.b active_frame_counter		;$80B33D
	BIT.w #$0040				;$80B33F
	BNE.b CODE_80B363			;$80B342
	BIT.w #$000F				;$80B344
	BNE.b CODE_80B358			;$80B347
	AND.w #$0030				;$80B349
	LSR					;$80B34C
	LSR					;$80B34D
	LSR					;$80B34E
	TAX					;$80B34F
	LDA.l DATA_80B35B,x			;$80B350
	JSL.l CODE_B28027			;$80B354
CODE_80B358:
	JMP.w CODE_808387			;$80B358

DATA_80B35B:
	dw $0763,$0764,$077E,$077F

CODE_80B363:
	LDA.w #$0004				;$80B363
	STA.b $BA				;$80B366
	LDX.w #CODE_B284D6			;$80B368
	LDY.w #CODE_B284D6>>16			;$80B36B
	STX.b $4E				;$80B36E
	STY.b $50				;$80B370
	LDA.w #CODE_808370			;$80B372
	JMP.w CODE_80839D			;$80B375

CODE_80B378:
	PHK					;$80B378
	PLB					;$80B379
	JSL.l disable_screen_wrapper		;$80B37A
	JSL.l init_registers_global		;$80B37E
	JSL.l clear_vram_global			;$80B382
	JSL.l CODE_808CB0			;$80B386
	JSL.l CODE_BB857F			;$80B38A
	LDA.w #$000200				;$80B38E
	STA.w DMA[$00].source_word		;$80B391
	STA.w DMA[$00].unused_2			;$80B394
	LDA.w #$0220				;$80B397
	STA.w DMA[$00].size			;$80B39A
	LDA.w #$0400				;$80B39D
	STA.w DMA[$00].settings			;$80B3A0
	SEP.b #$20				;$80B3A3
	STZ.w DMA[$00].source_bank		;$80B3A5
	LDA.b #$01				;$80B3A8
	STA.w CPU.enable_dma			;$80B3AA
	REP.b #$20				;$80B3AD
	LDA.w #$0001				;$80B3AF
	TRB.w $05AF				;$80B3B2
	LDA.w #$1300				;$80B3B5
	STA.b $80				;$80B3B8
	LDA.w #$0001				;$80B3BA
	STA.w $04E4				;$80B3BD
	LDA.w #$000F				;$80B3C0
	JSL.l CODE_BB859A			;$80B3C3
	ORA.w #$3000				;$80B3C7
	CLC					;$80B3CA
	ADC.w #$01C0				;$80B3CB
	STA.b $B4				;$80B3CE
	LDA.w #$1000				;$80B3D0
	TSB.w $05B1				;$80B3D3
	BNE.b CODE_80B413			;$80B3D6
	LDA.w #!music_baddies_on_parade		;$80B3D8
	JSL.l CODE_B28009			;$80B3DB
	LDA.w #$8000				;$80B3DF
	TSB.w $05AF				;$80B3E2
	STZ.w $05E3				;$80B3E5
	LDA.w #$004D				;$80B3E8
	LDY.w #$0000				;$80B3EB
	LDX.w #$0008				;$80B3EE
	JSL.l CODE_BB856D			;$80B3F1
	LDA.w #$0038				;$80B3F5
	JSL.l vram_payload_handler_global	;$80B3F8
	LDA.w #$0031				;$80B3FC
	JSL.l set_PPU_registers_global		;$80B3FF
	LDA.w #$FFFC				;$80B403
	SEP.b #$20				;$80B406
	STA.w PPU.layer_1_scroll_x		;$80B408
	XBA					;$80B40B
	STA.w PPU.layer_1_scroll_x		;$80B40C
	REP.b #$20				;$80B40F
	BRA.b CODE_80B44D			;$80B411

CODE_80B413:
	LDA.w #$004E				;$80B413
	LDY.w #$0010				;$80B416
	LDX.w #$0004				;$80B419
	JSL.l CODE_BB856D			;$80B41C
	LDA.w #$0039				;$80B420
	JSL.l vram_payload_handler_global	;$80B423
	LDA.w #$0031				;$80B427
	JSL.l set_PPU_registers_global		;$80B42A
	JSR.w CODE_80957A			;$80B42E
	LDY.w #$032A				;$80B431
	JSL.l CODE_BB8588			;$80B434
	LDA.b $BA				;$80B438
	DEC					;$80B43A
	ASL					;$80B43B
	CLC					;$80B43C
	ADC.w #$003A				;$80B43D
	TAX					;$80B440
	LDY.w #$FFDF				;$80B441
	JSR.w CODE_809F29			;$80B444
	LDA.w #$1D93				;$80B447
	STA.w $0541				;$80B44A
CODE_80B44D:
	LDA.w #$0200				;$80B44D
	JSL.l set_fade				;$80B450
	LDA.w #CODE_80B45D			;$80B454
	LDX.w #CODE_80B45D>>16			;$80B457
	JMP.w CODE_8083C3			;$80B45A

CODE_80B45D:
	LDA.w $04E4				;$80B45D
	STA.w CPU.enable_dma_hdma		;$80B460
	JSL.l CODE_B38006			;$80B463
	JSL.l CODE_808799			;$80B467
	SEP.b #$20				;$80B46B
	LDA.w screen_brightness			;$80B46D
	STA.w PPU.screen			;$80B470
	REP.b #$20				;$80B473
	STZ.w $1560				;$80B475
	STZ.w $155E				;$80B478
	JSL.l sprite_handler			;$80B47B
	LDA.b $F4				;$80B47F
	CMP.w #$012C				;$80B481
	BCC.b CODE_80B48A			;$80B484
	JSL.l CODE_B8807E			;$80B486
CODE_80B48A:
	JSL.l CODE_B7800C			;$80B48A
	JSL.l CODE_B6804B			;$80B48E
	JSL.l CODE_80898C			;$80B492
	JSR.w CODE_809741			;$80B496
	BEQ.b CODE_80B49E			;$80B499
	JMP.w CODE_808384			;$80B49B

CODE_80B49E:
	LDA.b $BA				;$80B49E
	CMP.w #$00FF				;$80B4A0
	BEQ.b CODE_80B4B5			;$80B4A3
	LDA.w #CODE_808493			;$80B4A5
	STA.b $4E				;$80B4A8
	LDA.w #CODE_808493>>16			;$80B4AA
	STA.b $50				;$80B4AD
	LDA.w #CODE_8083CC			;$80B4AF
	JMP.w CODE_80839D			;$80B4B2

CODE_80B4B5:
	INC.w $05E3				;$80B4B5
	LDA.w #CODE_80B2C8			;$80B4B8
	STA.b $4E				;$80B4BB
	LDA.w #CODE_80B2C8>>16			;$80B4BD
	STA.b $50				;$80B4C0
	LDA.w #CODE_808362			;$80B4C2
	JMP.w CODE_80839D			;$80B4C5

CODE_80B4C8:
	JSL.l CODE_8092EB			;$80B4C8
	STZ.w $053F				;$80B4CC
	JSR.w CODE_80B18E			;$80B4CF
	LDA.w #$0800				;$80B4D2
	TSB.w $05B1				;$80B4D5
	LDA.w #$0040				;$80B4D8
	BIT.w $05B1				;$80B4DB
	BEQ.b CODE_80B4E8			;$80B4DE
	LDA.w #$0080				;$80B4E0
	BIT.w $05B1				;$80B4E3
	BEQ.b CODE_80B539			;$80B4E6
CODE_80B4E8:
	LDA.w #$FFF0				;$80B4E8
	STA.b $1C				;$80B4EB
	LDX.w #$0040				;$80B4ED
CODE_80B4F0:
	LDA.l $B06021,x				;$80B4F0
	AND.w #$00FF				;$80B4F4
	CMP.b $1A				;$80B4F7
	BMI.b CODE_80B511			;$80B4F9
	BNE.b CODE_80B521			;$80B4FB
	LDA.l $B0601F,x				;$80B4FD
	CMP.b $C4				;$80B501
	BEQ.b CODE_80B509			;$80B503
	BPL.b CODE_80B511			;$80B505
	BRA.b CODE_80B521			;$80B507

CODE_80B509:
	LDA.l $B0601D,x				;$80B509
	CMP.b $C2				;$80B50D
	BMI.b CODE_80B521			;$80B50F
CODE_80B511:
	LDA.b $1C				;$80B511
	CLC					;$80B513
	ADC.w #$0010				;$80B514
	STA.b $1C				;$80B517
	TXA					;$80B519
	SEC					;$80B51A
	SBC.w #$0010				;$80B51B
	TAX					;$80B51E
	BPL.b CODE_80B4F0			;$80B51F
CODE_80B521:
	LDA.b $1C				;$80B521
	BMI.b CODE_80B539			;$80B523
	JSR.w CODE_80B53B			;$80B525
	JSR.w CODE_80BBCB			;$80B528
	LDA.b $3E				;$80B52B
	STA.l $B0600E				;$80B52D
	LDA.b $40				;$80B531
	STA.l $B06010				;$80B533
	SEC					;$80B537
	RTL					;$80B538

CODE_80B539:
	CLC					;$80B539
	RTL					;$80B53A

CODE_80B53B:
	PHX					;$80B53B
	STX.b $3E				;$80B53C
	LDA.w #$0040				;$80B53E
	SEC					;$80B541
	SBC.b $3E				;$80B542
	LSR					;$80B544
	LSR					;$80B545
	LSR					;$80B546
	LSR					;$80B547
	STA.w $053F				;$80B548
	LDX.w #$B06051				;$80B54B
	LDY.w #$B06061				;$80B54E
	LDA.b $1C				;$80B551
	BEQ.b CODE_80B55B			;$80B553
	DEC					;$80B555
	MVP $B06061>>16,$B06051>>16		;$80B556
	PHK					;$80B559
	PLB					;$80B55A
CODE_80B55B:
	PLA					;$80B55B
	CLC					;$80B55C
	ADC.w #$0010				;$80B55D
	TAX					;$80B560
	LDA.b $1A				;$80B561
	SEP.b #$20				;$80B563
	STA.l $B06021,x				;$80B565
	REP.b #$20				;$80B569
	LDA.b $C2				;$80B56B
	STA.l $B0601D,x				;$80B56D
	LDA.b $C4				;$80B571
	STA.l $B0601F,x				;$80B573
	LDA.w $04C4				;$80B577
	STA.l $B06012,x				;$80B57A
	LDY.w #$0000				;$80B57E
	INX					;$80B581
CODE_80B582:
	LDA.w $05D9,y				;$80B582
	STA.l $B06012,x				;$80B585
	INX					;$80B589
	INX					;$80B58A
	INY					;$80B58B
	INY					;$80B58C
	CPY.w #$000A				;$80B58D
	BCC.b CODE_80B582			;$80B590
	RTS					;$80B592

CODE_80B593:
	PHK					;$80B593
	PLB					;$80B594
	JSR.w CODE_809437			;$80B595
	LDA.w #!music_dixie_beat		;$80B598
	JSL.l CODE_B28009			;$80B59B
	LDA.w #$000F				;$80B59F
	JSL.l CODE_BB859A			;$80B5A2
	ORA.w #$3000				;$80B5A6
	CLC					;$80B5A9
	ADC.w #$01C0				;$80B5AA
	STA.b $B4				;$80B5AD
	LDA.w #$002A				;$80B5AF
	JSL.l vram_payload_handler_global	;$80B5B2
	LDA.w #$0028				;$80B5B6
	JSL.l set_PPU_registers_global		;$80B5B9
	LDA.w #$1201				;$80B5BD
	STA.w PPU.screens			;$80B5C0
	LDA.w #$0102				;$80B5C3
	STA.w PPU.color_math			;$80B5C6
	LDA.w #$002E				;$80B5C9
	LDX.w #$0020				;$80B5CC
	LDY.w #$0000				;$80B5CF
	JSL.l CODE_BB856D			;$80B5D2
	LDX.w #$7EF000				;$80B5D6
	LDY.w #$7EF000>>16			;$80B5D9
	LDA.w #$0800				;$80B5DC
	JSL.l CODE_808CEC			;$80B5DF
	JSR.w CODE_80B926			;$80B5E3
	LDA.w #$7001				;$80B5E6
	STA.w $04E4				;$80B5E9
	JSR.w CODE_80B98B			;$80B5EC
	JSR.w CODE_80957A			;$80B5EF
	LDA.w #$0001				;$80B5F2
	TRB.w $05AF				;$80B5F5
	LDA.b $BA				;$80B5F8
	ASL					;$80B5FA
	TAX					;$80B5FB
	JMP.w (DATA_80B5FF,x)			;$80B5FC

DATA_80B5FF:
	dw CODE_80B9CD
	dw CODE_80B7FD
	dw CODE_80B9CD

CODE_80B605:
	LDA.w $04E4				;$80B605
	STA.w CPU.enable_dma_hdma		;$80B608
	JSL.l CODE_B38006			;$80B60B
	JSL.l CODE_808799			;$80B60F
	LDA.w $1D39				;$80B613
	CMP.w #$008F				;$80B616
	BNE.b CODE_80B648			;$80B619
	LDA.w #$1717				;$80B61B
	STA.w PPU.window_masks			;$80B61E
	LDA.w #$3333				;$80B621
	STA.w PPU.set_window_layer_1_2		;$80B624
	STA.w PPU.set_window_layer_3_4		;$80B627
	SEP.b #$20				;$80B62A
	STZ.w PPU.layer_1_scroll_x		;$80B62C
	STZ.w PPU.layer_1_scroll_x		;$80B62F
	STZ.w PPU.layer_2_scroll_x		;$80B632
	STZ.w PPU.layer_2_scroll_x		;$80B635
	STZ.w PPU.layer_2_scroll_y		;$80B638
	STZ.w PPU.layer_2_scroll_y		;$80B63B
	LDA.b #$FF				;$80B63E
	STA.w PPU.layer_1_scroll_y		;$80B640
	STA.w PPU.layer_1_scroll_y		;$80B643
	REP.b #$20				;$80B646
CODE_80B648:
	SEP.b #$20				;$80B648
	LDA.w screen_brightness			;$80B64A
	STA.w PPU.screen			;$80B64D
	REP.b #$20				;$80B650
	STZ.w $1560				;$80B652
	STZ.w $155E				;$80B655
	LDA.w screen_brightness			;$80B658
	BIT.w #$FF00				;$80B65B
	BNE.b CODE_80B682			;$80B65E
	LDA.w $1D39				;$80B660
	BNE.b CODE_80B682			;$80B663
	JSL.l CODE_8089CA			;$80B665
	LDA.w $04DA				;$80B669
	AND.w #$9080				;$80B66C
	BEQ.b CODE_80B682			;$80B66F
	JSR.w CODE_80BC90			;$80B671
	LDA.w #$0090				;$80B674
	STA.w $1D39				;$80B677
	LDA.w #$8001				;$80B67A
	STA.w $04E4				;$80B67D
	STZ.b $F4				;$80B680
CODE_80B682:
	LDA.w $1D39				;$80B682
	BEQ.b CODE_80B6B5			;$80B685
	CMP.w #$0002				;$80B687
	BCC.b CODE_80B6C7			;$80B68A
	JSL.l CODE_B284D3			;$80B68C
	LDA.w $1D39				;$80B690
	LDX.w $1D35				;$80B693
	CPX.w #$0068				;$80B696
	BCC.b CODE_80B6A7			;$80B699
	CMP.w #$0028				;$80B69B
	BCS.b CODE_80B6A7			;$80B69E
	LDX.b $F4				;$80B6A0
	CPX.w #$0140				;$80B6A2
	BCC.b CODE_80B6C7			;$80B6A5
CODE_80B6A7:
	DEC.w $1D39				;$80B6A7
	CMP.w #$0010				;$80B6AA
	BCS.b CODE_80B6C7			;$80B6AD
	JSL.l CODE_B8807E			;$80B6AF
	BRA.b CODE_80B6C7			;$80B6B3

CODE_80B6B5:
	JSR.w CODE_80B96B			;$80B6B5
	JSL.l CODE_808C60			;$80B6B8
	AND.w #$00FF				;$80B6BC
	BNE.b CODE_80B6C4			;$80B6BF
	JSR.w CODE_80B98B			;$80B6C1
CODE_80B6C4:
	JSR.w CODE_80B9AC			;$80B6C4
CODE_80B6C7:
	JSL.l sprite_handler			;$80B6C7
	JSL.l CODE_B7800C			;$80B6CB
	JSL.l CODE_B6804B			;$80B6CF
	JSL.l CODE_B7800F			;$80B6D3
	JSL.l CODE_80898C			;$80B6D7
	JSR.w CODE_809741			;$80B6DB
	BEQ.b CODE_80B6F3			;$80B6DE
	LDA.b $F4				;$80B6E0
	CMP.w #$0A00				;$80B6E2
	BCC.b CODE_80B6F0			;$80B6E5
	LDA.w #$0000				;$80B6E7
	JSL.l CODE_B2800F			;$80B6EA
	STZ.b $F4				;$80B6EE
CODE_80B6F0:
	JMP.w CODE_808384			;$80B6F0

CODE_80B6F3:
	LDA.w $04C4				;$80B6F3
	CMP.w #!gamemode_2_player_contest	;$80B6F6
	BNE.b CODE_80B711			;$80B6F9
	LDA.w $061D				;$80B6FB
	AND.w #$4000				;$80B6FE
	PHA					;$80B701
	JSL.l CODE_8092EB			;$80B702
	JSL.l CODE_809399			;$80B706
	PLA					;$80B70A
	TSB.w $061D				;$80B70B
	JMP.w CODE_8096C2			;$80B70E

CODE_80B711:
	JMP.w CODE_8082EC			;$80B711

CODE_80B714:
	LDA.w $04E4				;$80B714
	STA.w CPU.enable_dma_hdma		;$80B717
	LDX.w #$75C0				;$80B71A
	STX.w PPU.vram_address			;$80B71D
	LDA.w #$7EF200				;$80B720
	STA.w DMA[$00].source_word		;$80B723
	STA.w DMA[$00].unused_2			;$80B726
	LDA.w #$0380				;$80B729
	STA.w DMA[$00].size			;$80B72C
	LDA.w #$1801				;$80B72F
	STA.w DMA[$00].settings			;$80B732
	SEP.b #$20				;$80B735
	LDA.b #$7EF200>>16			;$80B737
	STA.w DMA[$00].source_bank		;$80B739
	LDA.b #$01				;$80B73C
	STA.w CPU.enable_dma			;$80B73E
	REP.b #$20				;$80B741
	JSL.l CODE_B38006			;$80B743
	JSL.l CODE_808799			;$80B747
	SEP.b #$20				;$80B74B
	LDA.w screen_brightness			;$80B74D
	STA.w PPU.screen			;$80B750
	REP.b #$20				;$80B753
	STZ.w $1560				;$80B755
	STZ.w $155E				;$80B758
	JSR.w CODE_80B96B			;$80B75B
	JSL.l CODE_808C60			;$80B75E
	AND.w #$01FF				;$80B762
	BNE.b CODE_80B76D			;$80B765
	LDA.w #$0002				;$80B767
	STA.w $1C3D				;$80B76A
CODE_80B76D:
	JSR.w CODE_80B9AC			;$80B76D
	LDA.w screen_brightness			;$80B770
	BIT.w #$FF00				;$80B773
	BNE.b CODE_80B7D5			;$80B776
	JSL.l CODE_8089CA			;$80B778
	LDA.w $04DA				;$80B77C
	AND.w #$1000				;$80B77F
	BEQ.b CODE_80B788			;$80B782
	JSL.l CODE_B8807E			;$80B784
CODE_80B788:
	LDA.w #$0C00				;$80B788
	STA.w $1D83				;$80B78B
	JSR.w CODE_80B28E			;$80B78E
	LDA.w $1D83				;$80B791
	BIT.w #$0400				;$80B794
	BEQ.b CODE_80B7AD			;$80B797
	LDA.w $1CCA				;$80B799
	CLC					;$80B79C
	ADC.w #$0004				;$80B79D
	CMP.w #$008C				;$80B7A0
	BCS.b CODE_80B7D5			;$80B7A3
	STA.w $1CCA				;$80B7A5
	JSR.w CODE_80B8D6			;$80B7A8
	BRA.b CODE_80B7D5			;$80B7AB

CODE_80B7AD:
	BIT.w #$0800				;$80B7AD
	BEQ.b CODE_80B7C3			;$80B7B0
	LDA.w $1CCA				;$80B7B2
	SEC					;$80B7B5
	SBC.w #$0004				;$80B7B6
	BMI.b CODE_80B7D5			;$80B7B9
	STA.w $1CCA				;$80B7BB
	JSR.w CODE_80B8D6			;$80B7BE
	BRA.b CODE_80B7D5			;$80B7C1

CODE_80B7C3:
	LDA.w $04DA				;$80B7C3
	BIT.w #$8080				;$80B7C6
	BEQ.b CODE_80B7D5			;$80B7C9
	LDY.w $1CCA				;$80B7CB
	LDA.w DATA_80C385+$0A,y			;$80B7CE
	JSL.l CODE_B2800C			;$80B7D1
CODE_80B7D5:
	JSL.l sprite_handler			;$80B7D5
	JSL.l CODE_B7800C			;$80B7D9
	JSL.l CODE_B7800F			;$80B7DD
	JSL.l CODE_80898C			;$80B7E1
	JSR.w CODE_809741			;$80B7E5
	BEQ.b CODE_80B7ED			;$80B7E8
	JMP.w CODE_808384			;$80B7EA

CODE_80B7ED:
	LDX.w #CODE_809489			;$80B7ED
	LDY.w #CODE_809489>>16			;$80B7F0
	LDA.w #CODE_808370			;$80B7F3
	STX.b $4E				;$80B7F6
	STY.b $50				;$80B7F8
	JMP.w CODE_80839D			;$80B7FA

CODE_80B7FD:
	LDA.w #DATA_B6F42C			;$80B7FD
	STA.b $46				;$80B800
	LDA.w #DATA_B6F42C>>16			;$80B802
	STA.b $48				;$80B805
	STZ.b $36				;$80B807
	LDX.w #$3EFF				;$80B809
	JSR.w CODE_80B040			;$80B80C
	LDX.w #$7400				;$80B80F
	STX.w PPU.vram_address			;$80B812
	LDA.w #$7EF000				;$80B815
	STA.w DMA[$00].source_word		;$80B818
	STA.w DMA[$00].unused_2			;$80B81B
	LDA.w #$0800				;$80B81E
	STA.w DMA[$00].size			;$80B821
	LDA.w #$1801				;$80B824
	STA.w DMA[$00].settings			;$80B827
	SEP.b #$20				;$80B82A
	LDA.b #$7EF000>>16			;$80B82C
	STA.w DMA[$00].source_bank		;$80B82E
	LDA.b #$01				;$80B831
	STA.w CPU.enable_dma			;$80B833
	REP.b #$20				;$80B836
	LDA.w #$0001				;$80B838
	TSB.w $04E4				;$80B83B
	LDY.w #$0286				;$80B83E
	JSL.l CODE_BB8588			;$80B841
	LDA.w #$0007				;$80B845
	STA.w $1CCA				;$80B848
CODE_80B84B:
	LDY.w #$0284				;$80B84B
	JSL.l CODE_BB85B8			;$80B84E
	LDX.b alternate_sprite			;$80B852
	LDA.w $1CCA				;$80B854
	STA.b $5C,x				;$80B857
	DEC.w $1CCA				;$80B859
	BPL.b CODE_80B84B			;$80B85C
	LDA.w #$0036				;$80B85E
	JSL.l vram_payload_handler_global	;$80B861
	LDY.w #$7440				;$80B865
	STY.b $1A				;$80B868
CODE_80B86A:
	STY.w PPU.vram_address			;$80B86A
	LDA.w PPU.vram_read			;$80B86D
	CLC					;$80B870
	ADC.w #$0078				;$80B871
	LDY.b $1A				;$80B874
	STY.w PPU.vram_address			;$80B876
	STA.w PPU.vram_write			;$80B879
	INY					;$80B87C
	STY.b $1A				;$80B87D
	CPY.w #$75C0				;$80B87F
	BCC.b CODE_80B86A			;$80B882
	LDA.w #$001E				;$80B884
	LDX.w #$0004				;$80B887
	LDY.w #$0000				;$80B88A
	JSL.l CODE_BB856D			;$80B88D
	STZ.w $1CCA				;$80B891
	JSR.w CODE_80B8D6			;$80B894
	LDA.w #$0200				;$80B897
	JSL.l set_fade				;$80B89A
	LDA.w #CODE_80B714			;$80B89E
	LDX.w #CODE_80B714>>16			;$80B8A1
	JMP.w CODE_8083C3			;$80B8A4

CODE_80B8A7:
	PHX					;$80B8A7
	LDY.w #$0000				;$80B8A8
CODE_80B8AB:
	LDA.w $0000,x				;$80B8AB
	INX					;$80B8AE
	INY					;$80B8AF
	BIT.w #$0080				;$80B8B0
	BEQ.b CODE_80B8AB			;$80B8B3
	PLX					;$80B8B5
	STY.b $1A				;$80B8B6
	LDA.w #$0020				;$80B8B8
	SEC					;$80B8BB
	SBC.b $1A				;$80B8BC
	AND.w #$00FE				;$80B8BE
	TAY					;$80B8C1
	RTS					;$80B8C2

CODE_80B8C3:
	LDA.w #$3EFF				;$80B8C3
	LDY.w #$0600				;$80B8C6
	LDX.w #$0200				;$80B8C9
CODE_80B8CC:
	STA.l $7EF000,x				;$80B8CC
	INX					;$80B8D0
	INX					;$80B8D1
	DEY					;$80B8D2
	BNE.b CODE_80B8CC			;$80B8D3
	RTS					;$80B8D5

CODE_80B8D6:
	LDA.w #$007E				;$80B8D6
	STA.b $44				;$80B8D9
	LDA.w #$F000				;$80B8DB
	STA.b $42				;$80B8DE
	STZ.w $1CCC				;$80B8E0
	LDA.w #$3400				;$80B8E3
	STA.w $1CAE				;$80B8E6
	LDA.w #$0200				;$80B8E9
	STA.b $36				;$80B8EC
	JSR.w CODE_80B8C3			;$80B8EE
	LDA.w $1CCC				;$80B8F1
CODE_80B8F4:
	ASL					;$80B8F4
	ASL					;$80B8F5
	CLC					;$80B8F6
	ADC.w $1CCA				;$80B8F7
	TAY					;$80B8FA
	LDX.w DATA_80C385,y			;$80B8FB
	JSR.w CODE_80B8A7			;$80B8FE
	JSR.w CODE_80A547			;$80B901
	LDA.b $36				;$80B904
	CLC					;$80B906
	ADC.w #$0080				;$80B907
	STA.b $36				;$80B90A
	INC.w $1CCC				;$80B90C
	LDA.w $1CCC				;$80B90F
	LDX.w #$3400				;$80B912
	CMP.w #$0002				;$80B915
	BNE.b CODE_80B91D			;$80B918
	LDX.w #$3800				;$80B91A
CODE_80B91D:
	STX.w $1CAE				;$80B91D
	CMP.w #$0005				;$80B920
	BCC.b CODE_80B8F4			;$80B923
	RTS					;$80B925

CODE_80B926:
	SEP #$20				;$80B926
	LDX #$0F42				;$80B928
	STX HDMA[$04].settings			;$80B92B
	LDX #DATA_80C20E			;$80B92E
	STX HDMA[$04].source_word		;$80B931
	LDA #DATA_80C20E>>16			;$80B934
	STA HDMA[$04].source_bank		;$80B936
	LDA #$7E				;$80B939
	STA HDMA[$04].indirect_source_bank	;$80B93B
	LDX #$1042				;$80B93E
	STX HDMA[$06].settings			;$80B941
	LDX #DATA_80C20E			;$80B944
	STX HDMA[$06].source_word		;$80B947
	LDA #DATA_80C20E>>16			;$80B94A
	STA HDMA[$06].source_bank		;$80B94C
	LDA #$7E				;$80B94F
	STA HDMA[$06].indirect_source_bank	;$80B951
	LDX #$2601				;$80B954
	STX HDMA[$05].settings			;$80B957
	LDX #DATA_80C215			;$80B95A
	STX HDMA[$05].source_word		;$80B95D
	LDA #DATA_80C215>>16			;$80B960
	STA HDMA[$05].source_bank		;$80B962
	STA HDMA[$05].indirect_source_bank	;$80B965
	REP #$20				;$80B968
	RTS					;$80B96A

CODE_80B96B:
	LDY.w #$007F				;$80B96B
	LDX.w #$0000				;$80B96E
CODE_80B971:
	LDA.l $7EA15A,x				;$80B971
	CMP.w #$8000				;$80B975
	ROR					;$80B978
	CMP.w #$FFFF				;$80B979
	BNE.b CODE_80B981			;$80B97C
	LDA.w #$0000				;$80B97E
CODE_80B981:
	STA.l $7EA15A,x				;$80B981
	INX					;$80B985
	INX					;$80B986
	DEY					;$80B987
	BPL.b CODE_80B971			;$80B988
	RTS					;$80B98A

CODE_80B98B:
	LDY.w #$007F				;$80B98B
	LDX.w #$0000				;$80B98E
CODE_80B991:
	JSL.l CODE_808C60			;$80B991
	STA.l $7EA15A,x				;$80B995
	INX					;$80B999
	INX					;$80B99A
	DEY					;$80B99B
	BPL.b CODE_80B991			;$80B99C
	LDA.w #$0002				;$80B99E
	STA.w $1C3D				;$80B9A1
	LDA.w #$0665				;$80B9A4
	JSL.l CODE_B28012			;$80B9A7
	RTS					;$80B9AB

CODE_80B9AC:
	LDX.w $1C3D				;$80B9AC
	INX					;$80B9AF
	INX					;$80B9B0
	CPX.w #$00FF				;$80B9B1
	BCS.b CODE_80B9B9			;$80B9B4
	STX.w $1C3D				;$80B9B6
CODE_80B9B9:
	LDA.l $7EA15C,x				;$80B9B9
	INC					;$80B9BD
	INC					;$80B9BE
	STA.l $7EA15C,x				;$80B9BF
	LDA.l $7EA15A,x				;$80B9C3
	DEC					;$80B9C7
	STA.l $7EA15A,x				;$80B9C8
	RTS					;$80B9CC

CODE_80B9CD:
	LDA.w #DATA_B6F42C			;$80B9CD
	STA.b $46				;$80B9D0
	LDA.w #DATA_B6F42C>>16			;$80B9D2
	STA.b $48				;$80B9D5
	STZ.b $36				;$80B9D7
	LDX.w #$3EFF				;$80B9D9
	JSR.w CODE_80B040			;$80B9DC
	LDA.w #$2000				;$80B9DF
	STA.w $1CAE				;$80B9E2
	LDA.w #$0211				;$80B9E5
	STA.w PPU.screens			;$80B9E8
	LDX.w #$001E				;$80B9EB
	LDY.w #$0080				;$80B9EE
	JSR.w CODE_80A5DE			;$80B9F1
	JSR.w CODE_80A58C			;$80B9F4
	JSR.w CODE_80BC55			;$80B9F7
	LDX.w #$0020				;$80B9FA
	LDY.w #$FFDF				;$80B9FD
	JSR.w CODE_809F29			;$80BA00
	STX.w $15EC				;$80BA03
	JSR.w CODE_80B18E			;$80BA06
	STA.w $1D35				;$80BA09
	LDX.w #$FFFF				;$80BA0C
	LDY.w #$0020				;$80BA0F
	SEP.b #$20				;$80BA12
CODE_80BA14:
	INY					;$80BA14
	INY					;$80BA15
	INX					;$80BA16
	CMP.w DATA_80C37A,x			;$80BA17
	BCC.b CODE_80BA14			;$80BA1A
	REP.b #$20				;$80BA1C
	LDA.w $06A1				;$80BA1E
	BIT.w #$001A				;$80BA21
	BEQ.b CODE_80BA29			;$80BA24
	LDY.w #$0038				;$80BA26
CODE_80BA29:
	TYX					;$80BA29
	LDY.w $15EC				;$80BA2A
	DEY					;$80BA2D
	JSR.w CODE_809F29			;$80BA2E
	LDA.w $04C4				;$80BA31
	CMP.w #!gamemode_2_player_team		;$80BA34
	BNE.b CODE_80BA40			;$80BA37
	LDA.w #$0053				;$80BA39
	STA.l $7E0000,x				;$80BA3C
CODE_80BA40:
	LDX.w #$FFE0				;$80BA40
	LDY.w #$F600				;$80BA43
	JSR.w CODE_80A5F3			;$80BA46
	STY.b $42				;$80BA49
	JSR.w CODE_80A59E			;$80BA4B
	LDA.w #$3400				;$80BA4E
	STA.w $1CAE				;$80BA51
	LDA.w #$04C0				;$80BA54
	STA.b $36				;$80BA57
	STZ.w $1CC8				;$80BA59
	LDX.w #$0004				;$80BA5C
CODE_80BA5F:
	LDA.w #$3400				;$80BA5F
	DEC.w $053F				;$80BA62
	BNE.b CODE_80BA6A			;$80BA65
	LDA.w #$3800				;$80BA67
CODE_80BA6A:
	STA.w $1CAE				;$80BA6A
	JSR.w CODE_80BAD6			;$80BA6D
	DEX					;$80BA70
	BPL.b CODE_80BA5F			;$80BA71
	STZ.w $053F				;$80BA73
	LDX.w #$7400				;$80BA76
	STX.w PPU.vram_address			;$80BA79
	LDA.w #$7EF000				;$80BA7C
	STA.w DMA[$00].source_word		;$80BA7F
	STA.w DMA[$00].unused_2			;$80BA82
	LDA.w #$0800				;$80BA85
	STA.w DMA[$00].size			;$80BA88
	LDA.w #$1801				;$80BA8B
	STA.w DMA[$00].settings			;$80BA8E
	SEP.b #$20				;$80BA91
	LDA.b #$7EF000>>16			;$80BA93
	STA.w DMA[$00].source_bank		;$80BA95
	LDA.b #$01				;$80BA98
	STA.w CPU.enable_dma			;$80BA9A
	REP.b #$20				;$80BA9D
	LDA.w $1D35				;$80BA9F
	CMP.w #$0068				;$80BAA2
	BCC.b CODE_80BABD			;$80BAA5
	LDY.w #$0370				;$80BAA7
	JSL.l CODE_BB8585			;$80BAAA
	LDA.b alternate_sprite			;$80BAAE
	PHA					;$80BAB0
	LDY.w #$0362				;$80BAB1
	JSL.l CODE_BB8585			;$80BAB4
	LDX.b alternate_sprite			;$80BAB8
	PLA					;$80BABA
	STA.b $5C,x				;$80BABB
CODE_80BABD:
	LDA.w #$0200				;$80BABD
	JSL.l set_fade				;$80BAC0
	STZ.b $F4				;$80BAC4
	LDA.w #CODE_808370			;$80BAC6
	STA.b $4A				;$80BAC9
	STA.b $4C				;$80BACB
	LDA.w #CODE_80B605			;$80BACD
	LDX.w #CODE_80B605>>16			;$80BAD0
	JMP.w CODE_8083C3			;$80BAD3

CODE_80BAD6:
	STX.w $1CCA				;$80BAD6
	LDX.w #$0012				;$80BAD9
CODE_80BADC:
	STZ.w $1CB4,x				;$80BADC
	DEX					;$80BADF
	BPL.b CODE_80BADC			;$80BAE0
	LDY.w #$0003				;$80BAE2
	LDA.w $1CCA				;$80BAE5
	CLC					;$80BAE8
	ADC.w #$0031				;$80BAE9
	STA.w $1CB4				;$80BAEC
	LDA.w #$202E				;$80BAEF
	STA.w $1CB5				;$80BAF2
	LDY.w #$0003				;$80BAF5
	LDA.w $1CCA				;$80BAF8
	ASL					;$80BAFB
	ASL					;$80BAFC
	ASL					;$80BAFD
	ASL					;$80BAFE
	TAX					;$80BAFF
	STX.w $1CCC				;$80BB00
	LDA.l $7EA8DE,x				;$80BB03
	AND.w #$00FF				;$80BB07
	CMP.w #$0001				;$80BB0A
	BNE.b CODE_80BB1B			;$80BB0D
	JSR.w CODE_80BB90			;$80BB0F
	LDA.w #$5D20				;$80BB12
	STA.w $1CB4,y				;$80BB15
	INY					;$80BB18
	INY					;$80BB19
	INY					;$80BB1A
CODE_80BB1B:
	JSR.w CODE_80BB90			;$80BB1B
	LDA.w $1CC2				;$80BB1E
	ORA.w #$8000				;$80BB21
	STA.w $1CC2				;$80BB24
	LDY.w #$0004				;$80BB27
	LDX.w #$001CB4				;$80BB2A
	JSR.w CODE_80A547			;$80BB2D
	LDY.w #$0000				;$80BB30
	LDX.w $1CCC				;$80BB33
	LDA.l $7EA8E9,x				;$80BB36
	STA.b $1A				;$80BB3A
	STA.b $26				;$80BB3C
	LDA.l $7EA8EB,x				;$80BB3E
	STA.b $1C				;$80BB42
	STA.b $28				;$80BB44
	JSR.w CODE_80A6A9			;$80BB46
	LDA.b $40				;$80BB49
	LDX.w #$0002				;$80BB4B
	LDY.w #$0026				;$80BB4E
	JSR.w CODE_80A4DC			;$80BB51
	LDA.b $3E				;$80BB54
	LDX.w #$0002				;$80BB56
	LDY.w #$002C				;$80BB59
	JSR.w CODE_80A4DC			;$80BB5C
	LDX.w $1CCC				;$80BB5F
	LDA.l $7EA8ED,x				;$80BB62
	AND.w #$00FF				;$80BB66
	LDY.w #$0034				;$80BB69
	LDX.w #$0003				;$80BB6C
	JSR.w CODE_80A4DC			;$80BB6F
	LDX.w #DATA_80C648			;$80BB72
	LDY.w #$003A				;$80BB75
	JSR.w CODE_80A547			;$80BB78
	LDX.w #DATA_80C647			;$80BB7B
	LDY.w #$002A				;$80BB7E
	JSR.w CODE_80A547			;$80BB81
	LDA.b $36				;$80BB84
	SEC					;$80BB86
	SBC.w #$00C0				;$80BB87
	STA.b $36				;$80BB8A
	LDX.w $1CCA				;$80BB8C
	RTS					;$80BB8F

CODE_80BB90:
	LDA.l $7EA8DF,x				;$80BB90
	AND.w #$007F				;$80BB94
	STA.w $1CB4,y				;$80BB97
	INY					;$80BB9A
	LDA.l $7EA8DF,x				;$80BB9B
	INX					;$80BB9F
	BIT.w #$0080				;$80BBA0
	BEQ.b CODE_80BB90			;$80BBA3
	RTS					;$80BBA5

CODE_80BBA6:
	LDA.l $B0600A				;$80BBA6
	CMP.w #$5269				;$80BBAA
	BNE.b CODE_80BBB9			;$80BBAD
	LDA.l $B0600C				;$80BBAF
	CMP.w #$5241				;$80BBB3
	BNE.b CODE_80BBB9			;$80BBB6
	RTS					;$80BBB8

CODE_80BBB9:
	LDA.w #$5269				;$80BBB9
	STA.l $B0600A				;$80BBBC
	LDA.w #$5241				;$80BBC0
	STA.l $B0600C				;$80BBC3
	JSR.w CODE_80BBF5			;$80BBC7
	RTS					;$80BBCA

CODE_80BBCB:
	STZ.b $3E				;$80BBCB
	STZ.b $40				;$80BBCD
	LDX.w #$0000				;$80BBCF
CODE_80BBD2:
	LDA.l $B06012,x				;$80BBD2
	CLC					;$80BBD6
	ADC.b $3E				;$80BBD7
	STA.b $3E				;$80BBD9
	INX					;$80BBDB
	INX					;$80BBDC
	CPX.w #$0050				;$80BBDD
	BNE.b CODE_80BBD2			;$80BBE0
	LDX.w #$0000				;$80BBE2
CODE_80BBE5:
	LDA.l $B06012,x				;$80BBE5
	EOR.b $40				;$80BBE9
	STA.b $40				;$80BBEB
	INX					;$80BBED
	INX					;$80BBEE
	CPX.w #$0050				;$80BBEF
	BNE.b CODE_80BBE5			;$80BBF2
	RTS					;$80BBF4

CODE_80BBF5:
	JSR.w CODE_80BC0B			;$80BBF5
	JSR.w CODE_80BC7E			;$80BBF8
	JSR.w CODE_80BBCB			;$80BBFB
	LDA.b $3E				;$80BBFE
	STA.l $B0600E				;$80BC00
	LDA.b $40				;$80BC04
	STA.l $B06010				;$80BC06
	RTS					;$80BC0A

CODE_80BC0B:
	LDX.w #$0008				;$80BC0B
	STZ.b $1A				;$80BC0E
CODE_80BC10:
	PHX					;$80BC10
	SEP.b #$20				;$80BC11
	LDY.w DATA_80C608,x			;$80BC13
	LDX.b $1A				;$80BC16
CODE_80BC18:
	LDA.w $0000,y				;$80BC18
	STA.l $7EA8DF,x				;$80BC1B
	INX					;$80BC1F
	LDA.w $0000,y				;$80BC20
	INY					;$80BC23
	BIT.b #$80				;$80BC24
	BEQ.b CODE_80BC18			;$80BC26
	LDX.b $1A				;$80BC28
	LDA.b #$00				;$80BC2A
	STA.l $7EA8DE,x				;$80BC2C
	REP.b #$20				;$80BC30
	LDA.w $0000,y				;$80BC32
	STA.l $7EA8E9,x				;$80BC35
	LDA.w $0002,y				;$80BC39
	STA.l $7EA8EB,x				;$80BC3C
	LDA.w $0003,y				;$80BC40
	STA.l $7EA8EC,x				;$80BC43
	LDA.b $1A				;$80BC47
	CLC					;$80BC49
	ADC.w #$0010				;$80BC4A
	STA.b $1A				;$80BC4D
	PLX					;$80BC4F
	DEX					;$80BC50
	DEX					;$80BC51
	BPL.b CODE_80BC10			;$80BC52
	RTS					;$80BC54

CODE_80BC55:
	JSR.w CODE_80BBCB			;$80BC55
	LDA.l $B0600E				;$80BC58
	CMP.b $3E				;$80BC5C
	BNE.b CODE_80BC68			;$80BC5E
	LDA.l $B06010				;$80BC60
	CMP.b $40				;$80BC64
	BEQ.b CODE_80BC6C			;$80BC66
CODE_80BC68:
	JSR.w CODE_80BC0B			;$80BC68
	RTS					;$80BC6B

CODE_80BC6C:
	LDX.w #$0000				;$80BC6C
CODE_80BC6F:
	LDA.l $B06012,x				;$80BC6F
	STA.l $7EA8DE,x				;$80BC73
	INX					;$80BC77
	CPX.w #$004F				;$80BC78
	BCC.b CODE_80BC6F			;$80BC7B
	RTS					;$80BC7D

CODE_80BC7E:
	LDX.w #$0000				;$80BC7E
CODE_80BC81:
	LDA.l $7EA8DE,x				;$80BC81
	STA.l $B06012,x				;$80BC85
	INX					;$80BC89
	CPX.w #$004F				;$80BC8A
	BCC.b CODE_80BC81			;$80BC8D
	RTS					;$80BC8F

CODE_80BC90:
	SEP.b #$20				;$80BC90
	LDX.w #$2641				;$80BC92
	STX.w HDMA[$07].settings		;$80BC95
	LDX.w #$7EA25A				;$80BC98
	STX.w HDMA[$07].source_word		;$80BC9B
	LDA.b #$7EA25A>>16			;$80BC9E
	STA.w HDMA[$07].source_bank		;$80BCA0
	STA.w HDMA[$07].indirect_source_bank	;$80BCA3
	REP.b #$20				;$80BCA6
	LDA.w #$00FF				;$80BCA8
	STA.l $7EA25A				;$80BCAB
	STA.l $7EA25D				;$80BCAF
	LDA.w #$A47A				;$80BCB3
	STA.l $7EA25B				;$80BCB6
	LDA.w #$A578				;$80BCBA
	STA.l $7EA25E				;$80BCBD
	LDA.w #$0000				;$80BCC1
	STA.l $7EA260				;$80BCC4
	LDA.w #$0001				;$80BCC8
	STA.l $7EA45A				;$80BCCB
	LDX.w #$7EA45A				;$80BCCF
	LDY.w #$7EA45C				;$80BCD2
	LDA.w #$01E0				;$80BCD5
	MVN $7EA45C>>16,$7EA45A>>16		;$80BCD8
	RTS					;$80BCDB

CODE_80BCDC:
	LDA.w #$7EF580>>16			;$80BCDC
	STA.b $44				;$80BCDF
	STX.b $1C				;$80BCE1
	LDA.w #$7EF580				;$80BCE3
	STA.b $42				;$80BCE6
	STA.b $1A				;$80BCE8
	LDY.w #$0006				;$80BCEA
CODE_80BCED:
	LDX.w #$0020				;$80BCED
	LDA.w #$2000				;$80BCF0
CODE_80BCF3:
	STA.b [$42]				;$80BCF3
	INC.b $42				;$80BCF5
	INC.b $42				;$80BCF7
	DEX					;$80BCF9
	BNE.b CODE_80BCF3			;$80BCFA
	LDA.b $1A				;$80BCFC
	CLC					;$80BCFE
	ADC.w #$0040				;$80BCFF
	STA.b $42				;$80BD02
	STA.b $1A				;$80BD04
	DEY					;$80BD06
	BNE.b CODE_80BCED			;$80BD07
	LDX.b $1C				;$80BD09
	RTL					;$80BD0B

CODE_80BD0C:
	LDA.w #DATA_FC14A0			;$80BD0C
	STA.b $42				;$80BD0F
	LDA.w #DATA_FC14A0>>16			;$80BD11
	STA.b $44				;$80BD14
	LDA.w #$7EF000				;$80BD16
	STA.b $46				;$80BD19
	LDA.w #$7EF000>>16			;$80BD1B
	STA.b $48				;$80BD1E
	LDA.w #$0064				;$80BD20
	STA.w $1C83				;$80BD23
CODE_80BD26:
	LDX.w #$0008				;$80BD26
CODE_80BD29:
	LDA.b [$42]				;$80BD29
	STA.b [$46]				;$80BD2B
	INC.b $42				;$80BD2D
	INC.b $42				;$80BD2F
	INC.b $46				;$80BD31
	INC.b $46				;$80BD33
	DEX					;$80BD35
	BNE.b CODE_80BD29			;$80BD36
	LDX.w #$0008				;$80BD38
CODE_80BD3B:
	LDA.w #$0000				;$80BD3B
	STA.b [$46]				;$80BD3E
	INC.b $46				;$80BD40
	INC.b $46				;$80BD42
	DEX					;$80BD44
	BNE.b CODE_80BD3B			;$80BD45
	DEC.w $1C83				;$80BD47
	BNE.b CODE_80BD26			;$80BD4A
	RTS					;$80BD4C

unknown_sprite_01E4_main:
	JMP.w (DATA_80BD50,x)			;$80BD4D

DATA_80BD50:
	dw CODE_80BD56
	dw CODE_80BD97
	dw CODE_80BDD1

CODE_80BD56:
	LDA.w #$1D93				;$80BD56
	STA.w $0541				;$80BD59
	LDY.w #$0000				;$80BD5C
	LDA.w language_select			;$80BD5F
	BEQ.b CODE_80BD6F			;$80BD62
	LDY.w #$000C				;$80BD64
	CMP.w #$0001				;$80BD67
	BEQ.b CODE_80BD6F			;$80BD6A
	LDY.w #$001C				;$80BD6C
CODE_80BD6F:
	LDX.w #$0000				;$80BD6F
	LDA.w DATA_80BEDB,y			;$80BD72
CODE_80BD75:
	STA.l $7EFFE0,x				;$80BD75
	INX					;$80BD79
	INY					;$80BD7A
	LDA.w DATA_80BEDB,y			;$80BD7B
	AND.w #$00FF				;$80BD7E
	BNE.b CODE_80BD75			;$80BD81
	STA.l $7EFFE0,x				;$80BD83
	LDY.w #$035A				;$80BD87
	JSL.l CODE_BB8585			;$80BD8A
	BCS.b CODE_80BD94			;$80BD8E
	JSL.l delete_sprite_handle_deallocation	;$80BD90
CODE_80BD94:
	JML [$04F5]				;$80BD94

CODE_80BD97:
	TYX					;$80BD97
	STZ.b $18,x				;$80BD98
	INC.b $38,x				;$80BD9A
	LDA.b $5C,x				;$80BD9C
	ASL					;$80BD9E
	TAY					;$80BD9F
	LDA.w DATA_80BE77,y			;$80BDA0
	TAY					;$80BDA3
	INC					;$80BDA4
	INC					;$80BDA5
	INC					;$80BDA6
	STA.b $66,x				;$80BDA7
	LDA.w $0000,y				;$80BDA9
	AND.w #$00FF				;$80BDAC
	STA.b $5E,x				;$80BDAF
	LDA.w $0001,y				;$80BDB1
	STA.b $60,x				;$80BDB4
	LDA.b $3C,x				;$80BDB6
	BNE.b CODE_80BDC8			;$80BDB8
	STZ.b $1E				;$80BDBA
	STZ.b $20				;$80BDBC
	LDA.w #$0001				;$80BDBE
	JSL.l CODE_B78027			;$80BDC1
	JSR.w CODE_80BD0C			;$80BDC5
CODE_80BDC8:
	LDA.w #$1D93				;$80BDC8
	STA.w $0541				;$80BDCB
	JML [$04F5]				;$80BDCE

CODE_80BDD1:
	TYX					;$80BDD1
	LDA.b $5C,x				;$80BDD2
	CMP.w #$0005				;$80BDD4
	BEQ.b CODE_80BE01			;$80BDD7
	LDA.b $64,x				;$80BDD9
	CMP.w #$0020				;$80BDDB
	BCC.b CODE_80BE01			;$80BDDE
	LDA.w $04DA				;$80BDE0
	BIT.w #$9080				;$80BDE3
	BEQ.b CODE_80BE01			;$80BDE6
	LDA.w #$0020				;$80BDE8
	STA.b $64,x				;$80BDEB
	LDA.b $18,x				;$80BDED
	BEQ.b CODE_80BDF8			;$80BDEF
	STZ.b $18,x				;$80BDF1
	TAX					;$80BDF3
	JSL.l CODE_BB85E8			;$80BDF4
CODE_80BDF8:
	STZ.w $1D93				;$80BDF8
	LDA.w #$1D93				;$80BDFB
	STA.w $0541				;$80BDFE
CODE_80BE01:
	DEC.b $64,x				;$80BE01
	BNE.b CODE_80BE74			;$80BE03
	LDA.b $5E,x				;$80BE05
	BEQ.b CODE_80BE5C			;$80BE07
	LDY.w #$0360				;$80BE09
	JSL.l CODE_BB8588			;$80BE0C
	LDX.b current_sprite			;$80BE10
	BCC.b CODE_80BE19			;$80BE12
	INC.b $64,x				;$80BE14
	JML [$04F5]				;$80BE16

CODE_80BE19:
	LDY.b alternate_sprite			;$80BE19
	STX.b $4C,y				;$80BE1B
	STY.b $18,x				;$80BE1D
	LDA.b $5C,x				;$80BE1F
	STA.w $002C,y				;$80BE21
	LDA.b $60,x				;$80BE24
	STA.w $005E,y				;$80BE26
	INC					;$80BE29
	INC					;$80BE2A
	STA.b $60,x				;$80BE2B
	LDA.b $66,x				;$80BE2D
	STA.b $1A				;$80BE2F
	INC					;$80BE31
	INC					;$80BE32
	STA.b $66,x				;$80BE33
	LDA.b ($1A)				;$80BE35
	XBA					;$80BE37
	AND.w #$00FF				;$80BE38
	ASL					;$80BE3B
	STA.w $006C,y				;$80BE3C
	CLC					;$80BE3F
	ADC.w #$0010				;$80BE40
	STA.b $64,x				;$80BE43
	LDA.b ($1A)				;$80BE45
	AND.w #$00FF				;$80BE47
	STA.w $1D47				;$80BE4A
	CLC					;$80BE4D
	TYX					;$80BE4E
	ADC.w #$00FA				;$80BE4F
	JSL.l CODE_BB85A0			;$80BE52
	LDX.b current_sprite			;$80BE56
	DEC.b $5E,x				;$80BE58
	BPL.b CODE_80BE74			;$80BE5A
CODE_80BE5C:
	JSL.l delete_sprite_handle_deallocation	;$80BE5C
	LDA.b $18,x				;$80BE60
	BEQ.b CODE_80BE6B			;$80BE62
	STZ.b $18,x				;$80BE64
	TAX					;$80BE66
	JSL.l CODE_BB85E8			;$80BE67
CODE_80BE6B:
	STZ.w $1D93				;$80BE6B
	LDA.w #$1D93				;$80BE6E
	STA.w $0541				;$80BE71
CODE_80BE74:
	JML [$04F5]				;$80BE74

DATA_80BE77:
	dw DATA_80BE83
	dw DATA_80BE8A
	dw DATA_80BE91
	dw DATA_80BE98
	dw DATA_80BEB5
	dw DATA_80BEC4

DATA_80BE83:
	db $02,$00,$00,$00,$80,$00,$80

DATA_80BE8A:
	db $02,$04,$00,$00,$80,$00,$80

DATA_80BE91:
	db $02,$08,$00,$00,$80,$00,$80

DATA_80BE98:
	db $0D,$0C,$00,$00,$80,$00,$80,$00,$80,$00,$80,$01,$80,$00,$80,$00
	db $80,$00,$80,$00,$80,$01,$80,$00,$80,$00,$80,$00,$80

DATA_80BEB5:
	db $06,$26,$00,$00,$80,$00,$80,$00,$80,$00,$80,$01,$80,$00,$80

DATA_80BEC4:
	db $0A,$32,$00,$02,$80,$02,$80,$02,$80,$02,$80,$03,$80,$03,$80,$02
	db $80,$04,$80,$01,$80,$04,$80

DATA_80BEDB:
	db "NEW RECORD!", $00
	db "NOUVEAU RECORD!", $00
	db "NEU REKORD!", $00

unknown_sprite_0110_main:
	JMP.w (DATA_80BF06,x)			;$80BF03

DATA_80BF06:
	dw CODE_80BF0E
	dw CODE_80BF45
	dw CODE_80BFD2
	dw CODE_80C012

CODE_80BF0E:
	TYX					;$80BF0E
	STZ.b $5C,x				;$80BF0F
	LDX.b $5E,y				;$80BF11
	LDA.l $7EA7BA,x				;$80BF13
	CLC					;$80BF17
	ADC.w #$7EA9DE				;$80BF18
	TYX					;$80BF1B
	TAY					;$80BF1C
	INC					;$80BF1D
	STA.b $5E,x				;$80BF1E
	STZ.b $60,x				;$80BF20
	PEA.w (($7EA9DE&$FF0000)>>16)|((RESET_start&$FF0000)>>8)	;$80BF22
	PLB					;$80BF25
	LDA.w $0000,y				;$80BF26
	AND.w #$00FF				;$80BF29
	STA.b $26				;$80BF2C
	CMP.w #$0001				;$80BF2E
	BEQ.b CODE_80BF3F			;$80BF31
CODE_80BF33:
	INY					;$80BF33
	LDA.w $0000,y				;$80BF34
	AND.w #$00FF				;$80BF37
	BNE.b CODE_80BF33			;$80BF3A
	INY					;$80BF3C
	STY.b $60,x				;$80BF3D
CODE_80BF3F:
	PLB					;$80BF3F
	INC.b $38,x				;$80BF40
	JML [$04F5]				;$80BF42

CODE_80BF45:
	TYX					;$80BF45
	LDA.w #$0100				;$80BF46
	STA.b $1C				;$80BF49
	LDA.w #$7E00				;$80BF4B
	STA.b $1B				;$80BF4E
CODE_80BF50:
	PEA.w (($7E0000&$FF0000)>>16)|((RESET_start&$FF0000)>>8)	;$80BF50
	PLB					;$80BF53
	LDA.w #$FFFF				;$80BF54
	LDY.b $60,x				;$80BF57
	BEQ.b CODE_80BF66			;$80BF59
	LDA.w $0000,y				;$80BF5B
	AND.w #$00FF				;$80BF5E
	SEC					;$80BF61
	SBC.w #$0020				;$80BF62
	XBA					;$80BF65
CODE_80BF66:
	STA.b $24				;$80BF66
	LDY.b $5E,x				;$80BF68
	LDA.w $0000,y				;$80BF6A
	PLB					;$80BF6D
	AND.w #$00FF				;$80BF6E
	BEQ.b CODE_80BFB0			;$80BF71
	SEC					;$80BF73
	SBC.w #$0020				;$80BF74
	XBA					;$80BF77
	JSR.w CODE_80C008			;$80BF78
	LDA.b $5C,x				;$80BF7B
	CLC					;$80BF7D
	ADC.b $1E,x				;$80BF7E
	AND.w #$01FF				;$80BF80
	STA.b $3E				;$80BF83
	JSL.l CODE_B78009			;$80BF85
	BCS.b CODE_80BFAD			;$80BF89
	LDA.b $24				;$80BF8B
	BPL.b CODE_80BF90			;$80BF8D
	TDC					;$80BF8F
CODE_80BF90:
	JSR.w CODE_80C008			;$80BF90
	LDA.b $3E				;$80BF93
	CLC					;$80BF95
	ADC.w #$0010				;$80BF96
	JSL.l CODE_B78009			;$80BF99
	BCS.b CODE_80BFAD			;$80BF9D
	JSR.w CODE_80C048			;$80BF9F
	INC.b $5E,x				;$80BFA2
	LDA.b $60,x				;$80BFA4
	BEQ.b CODE_80BF50			;$80BFA6
	INC.b $60,x				;$80BFA8
	JMP.w CODE_80BF50			;$80BFAA

CODE_80BFAD:
	JML [$04F5]				;$80BFAD

CODE_80BFB0:
	LDA.b $5C,x				;$80BFB0
	LSR					;$80BFB2
	BCC.b CODE_80BFBD			;$80BFB3
	LDA.w #$0003				;$80BFB5
	STA.b $38,x				;$80BFB8
	JMP.w CODE_80C012			;$80BFBA

CODE_80BFBD:
	LDA.b $5C,x				;$80BFBD
	AND.w #$FFF0				;$80BFBF
	BEQ.b CODE_80BFCC			;$80BFC2
	LDA.b $5C,x				;$80BFC4
	SEC					;$80BFC6
	SBC.w #$0010				;$80BFC7
	STA.b $5C,x				;$80BFCA
CODE_80BFCC:
	LDA.w #$0002				;$80BFCC
	STA.b $38,x				;$80BFCF
	TXY					;$80BFD1
CODE_80BFD2:
	TYX					;$80BFD2
	LDY.w $0541				;$80BFD3
	STX.b $00,y				;$80BFD6
	INY					;$80BFD8
	INY					;$80BFD9
	STY.w $0541				;$80BFDA
	LDA.b $2C,x				;$80BFDD
	CMP.w #$0005				;$80BFDF
	BEQ.b CODE_80BFEC			;$80BFE2
	LDA.w $04DA				;$80BFE4
	BIT.w #$9080				;$80BFE7
	BNE.b CODE_80BFF9			;$80BFEA
CODE_80BFEC:
	DEC.b $6C,x				;$80BFEC
	BNE.b CODE_80BFF2			;$80BFEE
	BRA.b CODE_80BFF9			;$80BFF0

CODE_80BFF2:
	JSL.l CODE_B9E000			;$80BFF2
	JML [$04F5]				;$80BFF6

CODE_80BFF9:
	LDY.b $4C,x				;$80BFF9
	LDA.w #$0000				;$80BFFB
	STA.w $0018,y				;$80BFFE
	JSL.l delete_sprite_handle_deallocation	;$80C001
	JML [$04F5]				;$80C005

CODE_80C008:
	LSR					;$80C008
	LSR					;$80C009
	LSR					;$80C00A
	CLC					;$80C00B
	ADC.w #$F000				;$80C00C
	STA.b $1A				;$80C00F
	RTS					;$80C011

CODE_80C012:
	LDX.b current_sprite			;$80C012
	LDA.w #$0100				;$80C014
	STA.b $1C				;$80C017
	LDA.w #$7E00				;$80C019
	STA.b $1B				;$80C01C
	LDA.w #$F000				;$80C01E
	STA.b $1A				;$80C021
	LDA.b $5C,x				;$80C023
	CLC					;$80C025
	ADC.b $1E,x				;$80C026
	AND.w #$01FF				;$80C028
	STA.b $3E				;$80C02B
	JSL.l CODE_B78009			;$80C02D
	BCS.b CODE_80C045			;$80C031
	LDA.b $3E				;$80C033
	CLC					;$80C035
	ADC.w #$0010				;$80C036
	JSL.l CODE_B78009			;$80C039
	BCS.b CODE_80C045			;$80C03D
	JSR.w CODE_80C048			;$80C03F
	JMP.w CODE_80BFBD			;$80C042

CODE_80C045:
	JML [$04F5]				;$80C045

CODE_80C048:
	INC.b $5C,x				;$80C048
	LDA.b $5C,x				;$80C04A
	AND.w #$000F				;$80C04C
	BNE.b CODE_80C059			;$80C04F
	LDA.b $5C,x				;$80C051
	CLC					;$80C053
	ADC.w #$0010				;$80C054
	STA.b $5C,x				;$80C057
CODE_80C059:
	RTS					;$80C059

CODE_80C05A:
	LDA.w $1C5F				;$80C05A
	AND.w #$000C				;$80C05D
	LSR					;$80C060
	TAX					;$80C061
	LDA.l DATA_80C0A8,x			;$80C062
	STA.b $1E				;$80C066
	EOR.w #$FFFF				;$80C068
	STA.b $20				;$80C06B
	LDA.w $1C5F				;$80C06D
	AND.w #$0003				;$80C070
	ASL					;$80C073
	TAX					;$80C074
	LDY.w #$0000				;$80C075
	SEP.b #$30				;$80C078
CODE_80C07A:
	STY.w PPU.cgram_address			;$80C07A
	LDA.w PPU.cgram_read			;$80C07D
	XBA					;$80C080
	LDA.w PPU.cgram_read			;$80C081
	XBA					;$80C084
	REP.b #$20				;$80C085
	STA.b $1A				;$80C087
	JSR.w (DATA_80C0B0,x)			;$80C089
	STA.b $1C				;$80C08C
	LDA.b $1A				;$80C08E
	AND.b $20				;$80C090
	ORA.b $1C				;$80C092
	SEP.b #$20				;$80C094
	STY.w PPU.cgram_address			;$80C096
	STA.w PPU.cgram_write			;$80C099
	XBA					;$80C09C
	STA.w PPU.cgram_write			;$80C09D
	INY					;$80C0A0
	CPY.b #$80				;$80C0A1
	BNE.b CODE_80C07A			;$80C0A3
	REP.b #$30				;$80C0A5
	RTL					;$80C0A7

DATA_80C0A8:
	dw $001F,$03E0,$7C00,$0000

DATA_80C0B0:
	dw CODE_80C0B8
	dw CODE_80C0C8
	dw CODE_80C0D9
	dw CODE_80C0EB

CODE_80C0B8:
	AND.b $1E				;$80C0B8
	STA.b $1C				;$80C0BA
	LSR					;$80C0BC
	LSR					;$80C0BD
	EOR.w #$FFFF				;$80C0BE
	INC					;$80C0C1
	CLC					;$80C0C2
	ADC.b $1C				;$80C0C3
	AND.b $1E				;$80C0C5
	RTS					;$80C0C7

CODE_80C0C8:
	AND.b $1E				;$80C0C8
	STA.b $1C				;$80C0CA
	LSR					;$80C0CC
	CLC					;$80C0CD
	ADC.b $1C				;$80C0CE
	CMP.b $1E				;$80C0D0
	BCC.b CODE_80C0D6			;$80C0D2
	LDA.b $1E				;$80C0D4
CODE_80C0D6:
	AND.b $1E				;$80C0D6
	RTS					;$80C0D8

CODE_80C0D9:
	AND.b $1E				;$80C0D9
	STA.b $1C				;$80C0DB
	LSR					;$80C0DD
	LSR					;$80C0DE
	CLC					;$80C0DF
	ADC.b $1C				;$80C0E0
	CMP.b $1E				;$80C0E2
	BCC.b CODE_80C0E8			;$80C0E4
	LDA.b $1E				;$80C0E6
CODE_80C0E8:
	AND.b $1E				;$80C0E8
	RTS					;$80C0EA

CODE_80C0EB:
	AND.b $1E				;$80C0EB
	LSR					;$80C0ED
	AND.b $1E				;$80C0EE
	RTS					;$80C0F0

CODE_80C0F1:
	LDX.w #$0006				;$80C0F1
CODE_80C0F4:
	LDA.w $073C,x				;$80C0F4
	BNE.b CODE_80C0FF			;$80C0F7
	LDA.w #$FFFF				;$80C0F9
	STA.w $073C,x				;$80C0FC
CODE_80C0FF:
	DEX					;$80C0FF
	DEX					;$80C100
	BPL.b CODE_80C0F4			;$80C101
	RTL					;$80C103

CODE_80C104:
	LDX.w #$0006				;$80C104
CODE_80C107:
	LDA.w $073C,x				;$80C107
	BPL.b CODE_80C10F			;$80C10A
	STZ.w $073C,x				;$80C10C
CODE_80C10F:
	DEX					;$80C10F
	DEX					;$80C110
	BPL.b CODE_80C107			;$80C111
	RTL					;$80C113

CODE_80C114:
	PHK					;$80C114
	PLB					;$80C115
	JSR.w CODE_809437			;$80C116
	LDA.w #$000F				;$80C119
	JSL.l CODE_BB859A			;$80C11C
	ORA.w #$3000				;$80C120
	CLC					;$80C123
	ADC.w #$01C0				;$80C124
	STA.b $B4				;$80C127
	LDA.w #$0034				;$80C129
	JSL.l set_PPU_registers_global		;$80C12C
	LDA.w #$003E				;$80C130
	LDY.w $04C6				;$80C133
	BEQ.b CODE_80C13B			;$80C136
	LDA.w #$003F				;$80C138
CODE_80C13B:
	JSL.l vram_payload_handler_global	;$80C13B
	LDA.w #$0082				;$80C13F
	LDY.w $04C6				;$80C142
	BEQ.b CODE_80C14A			;$80C145
	LDA.w #$0083				;$80C147
CODE_80C14A:
	LDX.w #$0020				;$80C14A
	LDY.w #$0000				;$80C14D
	JSL.l CODE_BB856D			;$80C150
	JSR.w CODE_80957A			;$80C154
	LDA.w #$1D93				;$80C157
	STA.w $0541				;$80C15A
	LDY.w #$0208				;$80C15D
	JSL.l CODE_BB8588			;$80C160
	LDX.b alternate_sprite			;$80C164
	STZ.b $60,x				;$80C166
	LDA.w #$FFFF				;$80C168
	STA.b $5E,x				;$80C16B
	LDA.w #$00B0				;$80C16D
	STA.b $16,x				;$80C170
	LDA.w #$0080				;$80C172
	STA.b $12,x				;$80C175
	LDX.w #$004A				;$80C177
	LDA.w $04C6				;$80C17A
	BEQ.b CODE_80C181			;$80C17D
	INX					;$80C17F
	INX					;$80C180
CODE_80C181:
	LDY.w #$FFDF				;$80C181
	JSR.w CODE_809F29			;$80C184
	LDA.w #$0001				;$80C187
	STA.w $04E4				;$80C18A
	LDA.w #$0001				;$80C18D
	TRB.w $05AF				;$80C190
	LDA.w #$0200				;$80C193
	JSL.l set_fade				;$80C196
	LDA.w #!music_defeated_boss		;$80C19A
	JSL.l CODE_B28009			;$80C19D
	LDA.w #CODE_80C1AA			;$80C1A1
	LDX.w #CODE_80C1AA>>16			;$80C1A4
	JMP.w CODE_8083C3			;$80C1A7

CODE_80C1AA:
	LDA.w $04E4				;$80C1AA
	STA.w CPU.enable_dma_hdma		;$80C1AD
	JSL.l CODE_B38006			;$80C1B0
	JSL.l CODE_808799			;$80C1B4
	SEP.b #$20				;$80C1B8
	LDA.w screen_brightness			;$80C1BA
	STA.w PPU.screen			;$80C1BD
	REP.b #$20				;$80C1C0
	STZ.w $1560				;$80C1C2
	STZ.w $155E				;$80C1C5
	LDA.w screen_brightness			;$80C1C8
	BIT.w #$FF00				;$80C1CB
	BNE.b CODE_80C1E0			;$80C1CE
	JSL.l CODE_8089CA			;$80C1D0
	LDA.w $04DA				;$80C1D4
	AND.w #$9080				;$80C1D7
	BEQ.b CODE_80C1E0			;$80C1DA
	JSL.l CODE_B8807E			;$80C1DC
CODE_80C1E0:
	JSL.l sprite_handler			;$80C1E0
	LDA.w #$1D93				;$80C1E4
	STA.w $0541				;$80C1E7
	JSL.l CODE_B7800C			;$80C1EA
	JSL.l CODE_B284CD			;$80C1EE
	JSL.l CODE_80898C			;$80C1F2
	JSR.w CODE_809741			;$80C1F6
	BEQ.b CODE_80C1FE			;$80C1F9
	JMP.w CODE_808384			;$80C1FB

CODE_80C1FE:
	LDA.w #CODE_80B2C8			;$80C1FE
	STA.b $4E				;$80C201
	LDA.w #CODE_80B2C8>>16			;$80C203
	STA.b $50				;$80C206
	LDA.w #CODE_808362			;$80C208
	JMP.w CODE_80839D			;$80C20B

DATA_80C20E:
	db $FF,$5A,$A1,$FF,$5A,$A1,$00

DATA_80C215:
	db $0B,$01,$00,$9B,$34,$CB,$30,$CF,$2A,$D5,$24,$DB,$21,$DE,$1F,$E0
	db $1C,$E3,$1B,$E4,$19,$E6,$18,$E7,$17,$E8,$16,$E9,$15,$EA,$14,$EB
	db $13,$EC,$13,$EC,$12,$ED,$11,$EE,$11,$EE,$11,$EE,$10,$EF,$10,$EF
	db $10,$EF,$0F,$F0,$0F,$F0,$0F,$F0,$0F,$F0,$7F,$0E,$F1,$14,$0E,$F1
	db $9B,$0F,$F0,$0F,$F0,$0F,$F0,$0F,$F0,$10,$EF,$10,$EF,$10,$EF,$11
	db $EE,$11,$EE,$11,$EE,$12,$ED,$13,$EC,$13,$EC,$14,$EB,$15,$EA,$16
	db $E9,$17,$E8,$18,$E7,$19,$E6,$1B,$E4,$1C,$E3,$1F,$E0,$21,$DE,$24
	db $DB,$2A,$D5,$30,$CF,$34,$CB,$01,$01,$00,$00

DATA_80C290:
	db $2A,$0C,$00,$30,$00,$27,$0C,$00,$D8,$FF,$08,$0C,$00,$00,$00,$27
	db $0C,$00,$A8,$FF,$08,$0C,$00,$00,$00,$27,$0C,$00,$78,$FF,$01,$0C
	db $00,$00,$00,$00,$2A,$00,$00,$00,$00,$16,$00,$00,$F7,$FF,$0E,$00
	db $00,$FD,$FF,$0B,$00,$00,$00,$00,$16,$00,$00,$F7,$FF,$0F,$00,$00
	db $FD,$FF,$0A,$00,$00,$00,$00,$18,$00,$00,$F7,$FF,$11,$00,$00,$FD
	db $FF,$01,$00,$00,$03,$00,$00,$1E,$17,$0C,$07,$27,$17,$08,$07,$27
	db $17,$08,$07,$27,$17,$01,$17,$00,$2A,$E0,$07,$EC,$28,$E3,$09,$EC
	db $26,$E3,$0A,$EC,$26,$E3,$08,$EF,$90,$4C,$49,$45,$43,$45,$45,$45
	db $45,$45,$45,$45,$45,$43,$45,$49,$4C,$00

DATA_80C31A:
	dw $012E,$0256,$0258,$025A

DATA_80C322:
	dw $004C,$007C,$00AC

DATA_80C328:
	dw $0100,$0280,$0400

DATA_80C32E:
	dw $00F4,$FFCC,$00F4,$FFDC,$00F4,$FFEC,$00F4,$FFB7

DATA_80C33E:
	db $00,$30,$60,$A0,$FF

DATA_80C343:
	db $06,$10,$1A,$06,$15,$24

DATA_80C349:
	db "FRANCAI", $D3

UNK_80C351:
	db "DEUTSC", $C8

DATA_80C358:
	db "ENGLIS", $C8

DATA_80C35F:
	db "STERE", $CF

DATA_80C365:
	db "MON", $CF

DATA_80C369:
	db $25,$A0

DATA_80C36B:
	db $26,$A0

DATA_80C36D:
	db $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$A0

DATA_80C378:
	db $AE,$00

DATA_80C37A:
	db $69,$68,$67,$66,$5F,$50,$46,$3C,$37,$32,$00

;Music test song names
DATA_80C385:
	dw DATA_80C421, $0000
	dw DATA_80C421, $0000
	dw DATA_80C571, $0018
	dw DATA_80C5C4, $0022
	dw DATA_80C422, $001E
	dw DATA_80C430, $0006
	dw DATA_80C43B, $0021
	dw DATA_80C44A, $001D
	dw DATA_80C457, $0008
	dw DATA_80C465, $000E
	dw DATA_80C46F, $0010
	dw DATA_80C497, $0017
	dw DATA_80C4A5, $000F
	dw DATA_80C4B2, $000B
	dw DATA_80C4C0, $0019
	dw DATA_80C4CB, $000A
	dw DATA_80C4D9, $000C
	dw DATA_80C4E4, $001A
	dw DATA_80C4F2, $0401
	dw DATA_80C529, $0116
	dw DATA_80C530, $0015
	dw DATA_80C4FD, $0205
	dw DATA_80C510, $0005
	dw DATA_80C51F, $0105
	dw DATA_80C54F, $0009
	dw DATA_80C560, $0109
	dw DATA_80C542, $0004
	dw DATA_80C57B, $0013
	dw DATA_80C58F, $0011
	dw DATA_80C59D, $0012
	dw DATA_80C482, $0007
	dw DATA_80C5B7, $001B
	dw DATA_80C48D, $001C
	dw DATA_80C5D1, $0020
	dw DATA_80C5AE, $0114
	dw DATA_80C5E2, $000D
	dw DATA_80C5EE, $0023
	dw DATA_80C421, $0000
	dw DATA_80C421, $0000

DATA_80C421:
	db $A0

DATA_80C422:
	db "CAVERN CAPRIC", $C5

DATA_80C430:
	db "WATER WORL", $C4

DATA_80C43B:
	db "ROCKFACE RUMBL", $C5

DATA_80C44A:
	db "JUNGLE JITTE", $D2

DATA_80C457:
	db "NUTS AND BOLT", $D3

DATA_80C465:
	db "MILL FEVE", $D2

DATA_80C46F:
	db "ENCHANTED RIVERBAN", $CB

DATA_80C482:
	db "HOT PURSUI", $D4

DATA_80C48D:
	db "ROCKET RU", $CE

DATA_80C497:
	db "FROSTY FROLIC", $D3

DATA_80C4A5:
	db "STILT VILLAG", $C5

DATA_80C4B2:
	db "TREETOP TUMBL", $C5

DATA_80C4C0:
	db "POKEY PIPE", $D3

DATA_80C4CB:
	db "CASCADE CAPER", $D3

DATA_80C4D9:
	db "BOSS BOOGI", $C5

DATA_80C4E4:
	db "BIG BOSS BLUE", $D3

DATA_80C4F2:
	db "BONUS TIME", $A1

DATA_80C4FD:
	db "WRINKLY'S SAVE CAV", $C5

DATA_80C510:
	db "GET FIT A-GO-G", $CF

DATA_80C51F:
	db "WRINKLY 6", $B4

DATA_80C529:
	db "FANFAR", $C5

DATA_80C530:
	db "HANGIN' AT FUNKY'", $D3

DATA_80C542:
	db "BROTHERS BEA", $D2

DATA_80C54F:
	db "SWANKY'S SIDESHO", $D7

DATA_80C560:
	db "CRANKY'S SHOWDOW", $CE

DATA_80C571:
	db "DIXIE BEA", $D4

DATA_80C57B:
	db "NORTHERN KREMISPHER", $C5

DATA_80C58F:
	db "SUBMAP SHUFFL", $C5

DATA_80C59D:
	db "KREMATOA KONCERT", $CF

DATA_80C5AE:
	db "GAME OVE", $D2

DATA_80C5B7:
	db "CRYSTAL CHAS", $CD

DATA_80C5C4:
	db "CRAZY CALYPS", $CF

DATA_80C5D1:
	db "BADDIES ON PARAD", $C5

DATA_80C5E2:
	db "JANGLE BELL", $D3

DATA_80C5EE:
	db "MAMA BIR", $C4

UNK_80C5F7:
	db "                ", $A0

;"All time greats" screen scores
;Name, completion time, game percentage
DATA_80C608:
	dw DATA_80C63E
	dw DATA_80C632
	dw DATA_80C627
	dw DATA_80C61D
	dw DATA_80C612

DATA_80C612:
	db "CRANK", $D9
	db $B0, $4D, $11, $00
	db $67

DATA_80C61D:
	db "FUNK", $D9
	db $90, $F3, $12, $00
	db $65

DATA_80C627:
	db "SWANK", $D9
	db $80, $C6, $13, $00
	db $58

DATA_80C632:
	db "WRINKL", $D9
	db $80, $2B, $18, $00
	db $3C

DATA_80C63E:
	db "RAR", $C5
	db $80, $F5, $20, $00
	db $01

DATA_80C647:
	db $DB

DATA_80C648:
	db $DC,$20,$5D,$A0,$20,$56,$5E,$A0

;ASCII table?
DATA_80C650:
	db $00,$41,$42,$43,$44,$45,$46,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F
	db $50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$5A,$30,$31,$32,$33,$34
	db $35,$36,$37,$38,$39,$20,$88,$89,$5F

DATA_80C679:
	dw !null_pointer, $039A : db $00, $FF : dw $0000
	dw DATA_80C829, $03A2 : db !level_doorstop_dash_photo_album, $01 : dw $008A
	dw DATA_80C879, $03A8 : db !level_squeals_on_wheels_photo_album, $00 : dw $0080
	dw DATA_80C84F, $03C0 : db !level_ropey_rumpus_photo_album, $00 : dw $0087
	dw DATA_80C873, $03A6 : db !level_ropey_rumpus_photo_album, $00 : dw $0093
	dw DATA_80C836, $039E : db !level_lemguin_lunge_photo_album, $00 : dw $007A
	dw DATA_80C85D, $03BE : db !level_ropey_rumpus_photo_album, $00 : dw $00AE
	dw DATA_80C865, $03BC : db !level_ropey_rumpus_photo_album, $00 : dw $00AB
	dw DATA_80C8B8, $039A : db !level_skiddas_row_photo_album, $00 : dw $0100
	dw DATA_80C86C, $03BA : db !level_ropey_rumpus_photo_album, $00 : dw $0070
	dw DATA_80C881, $03CC : db !level_ropey_rumpus_photo_album, $00 : dw $0100
	dw DATA_80C889, $03D0 : db !level_lemguin_lunge_photo_album, $00 : dw $0120
	dw DATA_80C88E, $83AA : db !level_ropey_rumpus_photo_album, $00 : dw $00A8
	dw DATA_80C830, $039C : db !level_doorstop_dash_photo_album, $02 : dw $00B0
	dw DATA_80C83C, $03B8 : db !level_squeals_on_wheels_photo_album, $00 : dw $00B8
	dw DATA_80C846, $03C2 : db !level_ropey_rumpus_photo_album, $00 : dw $00C2
	dw DATA_80C8B4, $03CE : db !level_squeals_on_wheels_photo_album, $00 : dw $008C
	dw DATA_80C8AC, $03AC : db !level_lemguin_lunge_photo_album, $00 : dw $00D0
	dw DATA_80C8A5, $C3C4 : db !level_squeals_on_wheels_photo_album, $00 : dw $009A
	dw DATA_80C8BF, $03A0 : db !level_squeals_on_wheels_photo_album, $03 : dw $00AE
	dw DATA_80C8C4, $03C6 : db !level_ropey_rumpus_photo_album, $00 : dw $0094
	dw DATA_80C8CB, $03C8 : db !level_squeals_on_wheels_photo_album, $00 : dw $009E
	dw DATA_80C89D, $03CA : db !level_ropey_rumpus_photo_album, $00 : dw $00B3
	dw DATA_80C8D6, $03A4 : db !level_bazzas_blockade_photo_album, $04 : dw $008D
	dw DATA_80C8DB, $03B6 : db !level_bazzas_blockade_photo_album, $00 : dw $0110
	dw DATA_80C8E3, $83AE : db !level_bazzas_blockade_photo_album, $00 : dw $0065
	dw DATA_80C8EA, $03B0 : db !level_bazzas_blockade_photo_album, $00 : dw $0100
	dw DATA_80C8F6, $83B2 : db !level_bazzas_blockade_photo_album, $00 : dw $00DC
	dw DATA_80C8FC, $03B4 : db !level_bazzas_blockade_photo_album, $00 : dw $0100
	dw DATA_80C90B, $03A0 : db !level_bosses_photo_album, $05 : dw $0006
	dw DATA_80C912, $03A1 : db !level_bosses_photo_album, $00 : dw $0006
	dw DATA_80C918, $03A2 : db !level_bosses_photo_album, $00 : dw $0006
	dw DATA_80C91F, $03A3 : db !level_bosses_photo_album, $00 : dw $0006
	dw DATA_80C924, $03A4 : db !level_bosses_photo_album, $00 : dw $0006
	dw DATA_80C92A, $03A5 : db !level_bosses_photo_album, $00 : dw $0006
	dw DATA_80C931, $A3E8 : db !level_kastle_kaos_photo_album, $00 : dw $0347
	dw DATA_80C95F, $03D2 : db !level_doorstop_dash_photo_album, $06 : dw $0085
	dw DATA_80C956, $03D8 : db !level_doorstop_dash_photo_album, $00 : dw $00A1
	dw DATA_80C965, $03DA : db !level_ropey_rumpus_photo_album, $00 : dw $00B2
	dw DATA_80C945, $03D6 : db !level_bazzas_blockade_photo_album, $00 : dw $00D0
	dw DATA_80C94E, $03D4 : db !level_ropey_rumpus_photo_album, $00 : dw $0100
	dw DATA_80C96B, $039A : db !level_brothers_bear_photo_album, $07 : dw $0006
	dw DATA_80C984, $039B : db !level_brothers_bear_photo_album, $00 : dw $0006
	dw DATA_80C99D, $039C : db !level_brothers_bear_photo_album, $00 : dw $0006
	dw DATA_80C9B6, $039D : db !level_brothers_bear_photo_album, $00 : dw $0006
	dw DATA_80C9CD, $039E : db !level_brothers_bear_photo_album, $00 : dw $0006
	dw DATA_80C9E8, $039F : db !level_brothers_bear_photo_album, $00 : dw $0006
	dw DATA_80CA15, $03DC : db !level_doorstop_dash_photo_album, $08 : dw $00E3
	dw DATA_80CA2D, $A3E0 : db !level_doorstop_dash_photo_album, $00 : dw $0100
	dw DATA_80CA20, $03DE : db !level_doorstop_dash_photo_album, $00 : dw $0100
	dw DATA_80CA39, $03E2 : db !level_swankys_sideshow_photo_album, $00 : dw $0100
	dw DATA_80CA0A, $03E4 : db !level_kiddy_kong_photo_album, $00 : dw $0278
	dw DATA_80C9FF, $03E6 : db !level_dixie_kong_photo_album, $00 : dw $02D0
	dw !null_pointer, $0000 : db $00, $00 : dw $FFFF

DATA_80C829:
	db "KOBBLE", $00

DATA_80C830:
	db "SNEEK", $00

DATA_80C836:
	db "KRIMP", $00

DATA_80C83C:
	db "KNIK-KNAK", $00

DATA_80C846:
	db "BRISTLES", $00

DATA_80C84F:
	db "KNOCKA", $00

UNK_80C856:
	db "KRACKA", $00

DATA_80C85D:
	db "KRUMPLE", $00

DATA_80C865:
	db "KOPTER", $00

DATA_80C86C:
	db "BAZUKA", $00

DATA_80C873:
	db "KLASP", $00

DATA_80C879:
	db "RE-KOIL", $00

DATA_80C881:
	db "KUCHUKA", $00

DATA_80C889:
	db "KOIN", $00

DATA_80C88E:
	db "KUFF 'N' KLOUT", $00

DATA_80C89D:
	db "KARBINE", $00

DATA_80C8A5:
	db "MINKEY", $00

DATA_80C8AC:
	db "LEMGUIN", $00

DATA_80C8B4:
	db "NID", $00

DATA_80C8B8:
	db "SKIDDA", $00

DATA_80C8BF:
	db "BUZZ", $00

DATA_80C8C4:
	db "SWOOPY", $00

DATA_80C8CB:
	db "BOOTY BIRD", $00

DATA_80C8D6:
	db "KOCO", $00

DATA_80C8DB:
	db "LURCHIN", $00

DATA_80C8E3:
	db "NIBBLA", $00

DATA_80C8EA:
	db "BOUNTY BASS", $00

DATA_80C8F6:
	db "BAZZA", $00

DATA_80C8FC:
	db "GLEAMIN' BREAM", $00

DATA_80C90B:
	db "BELCHA", $00

DATA_80C912:
	db "ARICH", $00

DATA_80C918:
	db "SQUIRT", $00

DATA_80C91F:
	db "KAOS", $00

DATA_80C924:
	db "BLEAK", $00

DATA_80C92A:
	db "BARBOS", $00

DATA_80C931:
	db "BARON K.ROOLENSTEIN", $00

DATA_80C945:
	db "ENGUARDE", $00

DATA_80C94E:
	db "SQUAWKS", $00

DATA_80C956:
	db "SQUITTER", $00

DATA_80C95F:
	db "ELLIE", $00

DATA_80C965:
	db "PARRY", $00

DATA_80C96B:
	db " BAZAAR         BARNACLE", $00

DATA_80C984:
	db "  BRASH         BLUNDER ", $00

DATA_80C99D:
	db "  BLUE          BAZOOKA ", $00

DATA_80C9B6:
	db "BLIZZARD       BRAMBLE", $00

DATA_80C9CD:
	db "BENNY ] BJ+RN    BARTER   ", $00

DATA_80C9E8:
	db "BAFFLE          BOOMER", $00

DATA_80C9FF:
	db "DIXIE KONG", $00

DATA_80CA0A:
	db "KIDDY KONG", $00

DATA_80CA15:
	db "FUNKY KONG", $00

DATA_80CA20:
	db "WRINKLY KONG", $00

DATA_80CA2D:
	db "SWANKY KONG", $00

DATA_80CA39:
	db "CRANKY KONG", $00

NMI_start:
	JML .fast_rom_hop			;$80CA45

.fast_rom_hop:
	REP #$30				;$80CA49
	PHD					;$80CA4B
	PHA					;$80CA4C
	PHX					;$80CA4D
	PHY					;$80CA4E
	LDA #$0000				;$80CA4F
	TCD					;$80CA52
	CLD					;$80CA53
	SEP #$20				;$80CA54
	LDA.l CPU.nmi_flag			;$80CA56
	LDA #$8F				;$80CA5A
	STA.l PPU.screen			;$80CA5C
	REP #$20				;$80CA60
	LDA.l global_frame_counter		;$80CA62
	INC					;$80CA66
	STA.l global_frame_counter		;$80CA67
	JMP.w (NMI_pointer)			;$80CA6B

IRQ_start:
	SEI					;$80CA6E
	RTI					;$80CA6F

UNK_80CA70:
	db "GUARDE", $00

UNK_80CA77:
	db "SQUAWKS", $00

UNK_80CA7F:
	db "SQUITTER", $00

UNK_80CA88:
	db "ELLIE", $00

UNK_80CA8E:
	db "PARRY", $00

UNK_80CA94:
	db " BAZAAR         BARNACLE", $00

UNK_80CAAD:
	db "  BRASH         BLUNDER ", $00

UNK_80CAC6:
	db "  BLUE          BAZOOKA ", $00

UNK_80CADF:
	db "BLIZZARD       BRAMBLE", $00

UNK_80CAF6:
	db "BENNY ] BJ+RN    BARTER   ", $00

UNK_80CB11:
	db "BAFFLE          BOOMER", $00

UNK_80CB28:
	db "DIXIE KONG", $00

UNK_80CB33:
	db "KIDDY KONG", $00

UNK_80CB3E:
	db "FUNKY KONG", $00

UNK_80CB49:
	db "WRINKLY KONG", $00

UNK_80CB56:
	db "SWANKY KONG", $00

UNK_80CB62:
	db "CRANKY KONG", $00

CODE_80CB6E:
	JML .CODE_80CB72			;$80CB6E
.CODE_80CB72:
	REP #$30				;$80CB72
	PHD					;$80CB74
	PHA					;$80CB75
	PHX					;$80CB76
	PHY					;$80CB77
	LDA #$0000				;$80CB78
	TCD					;$80CB7B
	CLD					;$80CB7C
	SEP #$20				;$80CB7D
	LDA.l CPU.nmi_flag			;$80CB7F
	LDA #$8F				;$80CB83
	STA.l PPU.screen			;$80CB85
	REP #$20				;$80CB89
	LDA.l global_frame_counter		;$80CB8B
	INC					;$80CB8F
	STA.l global_frame_counter		;$80CB90
	JMP.w (NMI_pointer)			;$80CB94

CODE_80CB97:
	SEI					;$80CB97
	RTI					;$80CB98
