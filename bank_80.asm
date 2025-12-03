CODE_808000:
	JMP CODE_808387				;$808000

CODE_808003:
	JMP CODE_8083C3				;$808003

CODE_808006:
	JMP CODE_808384				;$808006

CODE_808009:
	JMP init_registers_global		;$808009

CODE_80800C:
	JMP clear_vram_global			;$80800C

CODE_80800F:
	JMP set_all_oam_offscreen		;$80800F

CODE_808012:
	JMP CODE_80898C				;$808012

CODE_808015:
	JMP CODE_8089CA				;$808015

CODE_808018:
	JMP CODE_808C60				;$808018

CODE_80801B:
	JMP CODE_808CB0				;$80801B

DMA_queued_sprite_palette:
	JMP DMA_queued_sprite_palette_global	;$80801E

handle_fading:
	JMP handle_fading_direct		;$808021

CODE_808024:
	JMP set_fade				;$808024

throw_exception_wrapper:
	JMP throw_exception			;$808027

CODE_80802A:
	JMP CODE_8091A3				;$80802A

CODE_80802D:
	JMP CODE_808C3F				;$80802D

CODE_808030:
	JMP CODE_808CEC				;$808030

CODE_808033:
	JMP CODE_808D2B				;$808033

CODE_808036:
	JMP CODE_808D5A				;$808036

CODE_808039:
	JMP CODE_8084C7				;$808039

set_and_wait_for_nmi:
	JMP set_and_wait_for_nmi_direct		;$80803C

CODE_80803F:
	JMP CODE_808EE6				;$80803F

CODE_808042:
	JMP CODE_808411				;$808042

CODE_808045:
	JMP CODE_809489				;$808045

CODE_808048:
	JMP CODE_80AE3E				;$808048

CODE_80804B:
	JMP CODE_809399				;$80804B

CODE_80804E:
	JMP CODE_8086C9				;$80804E

CODE_808051:
	JMP CODE_80B2C8				;$808051

DMA_to_VRAM:
	JMP DMA_to_VRAM_direct			;$808054

CODE_808057:
	JMP CODE_808669				;$808057

CODE_80805A:
	JMP CODE_80B593				;$80805A

CODE_80805D:
	JMP CODE_80B4C8				;$80805D

CODE_808060:
	JMP CODE_808EA4				;$808060

CODE_808063:
	JMP CODE_808EBA				;$808063

CODE_808066:
	JMP CODE_8092EB				;$808066

CODE_808069:
	JMP CODE_809040				;$808069

CODE_80806C:
	JMP CODE_80BCDC				;$80806C

CODE_80806F:
	JMP CODE_80BCDC				;$80806F

CODE_808072:
	JMP CODE_80BCDC				;$808072

CODE_808075:
	JMP CODE_80BCDC				;$808075

CODE_808078:
	JMP CODE_80BCDC				;$808078

CODE_80807B:
	JMP CODE_80C05A				;$80807B

lock_sprite_palette_queue:
	JMP lock_sprite_palette_queue_global	;$80807E

unlock_sprite_palette_queue:
	JMP unlock_sprite_palette_queue_global	;$808081

CODE_808084:
	JMP CODE_80C114				;$808084

throw_sprite_group_exception:
	JMP throw_sprite_group_exception_global	;$808087 Unused

DMA_queued_sprite_palettes:
	JMP DMA_queued_sprite_palettes_global	;$80808A



rare_string:
	db $F4, $92, $72, $EE, $77, $A6, $E7, $8A

piracy_string:
	db "(c) 1996"

display_error_message:
	TYA					;$80809D
	JSL vram_payload_handler_global		;$80809E
	LDA #$001D				;$8080A2
	LDY #$0000				;$8080A5
	LDX #$0020				;$8080A8
	JSL CODE_BB856D				;$8080AB
	LDA #$001F				;$8080AF
	LDY #$0000				;$8080B2
	LDX #$0001				;$8080B5
	JSL CODE_BB856D				;$8080B8
	LDA #$000F				;$8080BC
	JSL set_PPU_registers_global		;$8080BF
	STP					;$8080C3

RESET_start:
	SEI					;$8080C4
	LDA #$80				;$8080C5
	STA PPU.screen				;$8080C7
	LDA #$01				;$8080CA
	STA CPU.enable_interrupts		;$8080CC
	STA CPU.rom_speed			;$8080CF
	DEC					;$8080D2
	STA CPU.enable_hdma			;$8080D3
	CLC					;$8080D6
	XCE					;$8080D7
	REP #$30				;$8080D8
	TDC					;$8080DA
	ADC #$FFFF				;$8080DB
	BEQ .anti_piracy_test			;$8080DE
	BRL .prepare_anti_piracy		;$8080E0

.anti_piracy_test:
	TSX					;$8080E3
	LDA #RESET_start-$01			;$8080E4
	CMP $FFFF,x				;$8080E7
	BEQ .check_for_false_positive		;$8080EA
	LDY #$1FFD				;$8080EC
	SEP #$20				;$8080EF
.next_byte:
	LDA $0000,y				;$8080F1
	CMP #$4C				;$8080F4
	BEQ .jmp_test				;$8080F6
	CMP #$6C				;$8080F8
	BEQ .indirect_jmp_test			;$8080FA
	CMP #$60				;$8080FC
	BEQ .sequential_test			;$8080FE
.resume_scanning:
	DEY					;$808100
	BPL .next_byte				;$808101
	REP #$20				;$808103
	LDA.l sram_base				;$808105
	INC					;$808109
	STA.l sram_base				;$80810A
	CMP.l sram_base				;$80810E
	BNE .prepare_anti_piracy		;$808112
	DEC					;$808114
	STA.l sram_base				;$808115
	LDY #$0011				;$808119
	LDA PPU.status_ppu2			;$80811C
	AND #$0010				;$80811F
	BNE .prepare_message			;$808122
	BRA .final_piracy_test			;$808124

.jmp_test:
	REP #$20				;$808126
	LDA $0001,y				;$808128
	CMP #RESET_start			;$80812B
	BEQ .check_for_false_positive		;$80812E
	SEP #$20				;$808130
	BRA .resume_scanning			;$808132

.indirect_jmp_test:
	REP #$20				;$808134
	LDX $0001,y				;$808136
	BMI .address_rom			;$808139
	CPX #$2000				;$80813B
	BPL .invalid_address			;$80813E
.address_rom:
	LDA $0000,x				;$808140
	CMP #RESET_start			;$808143
	BEQ .check_for_false_positive		;$808146
.invalid_address:
	SEP #$20				;$808148
	BRA .resume_scanning			;$80814A

.sequential_test:
	TYX					;$80814C
.next_count:
	CMP $0000,x				;$80814D
	BNE .resume_scanning			;$808150
	INX					;$808152
	INC					;$808153
	BPL .next_count				;$808154
	REP #$20				;$808156
.check_for_false_positive:
	PHK					;$808158
	PLB					;$808159
	LDX #$0006				;$80815A
-:
	LDA piracy_string_result,x		;$80815D
	CMP rare_string,x			;$808160
	BNE .write_piracy_string		;$808163
	DEX					;$808165
	DEX					;$808166
	BPL -					;$808167
	BRA .prepare_logo			;$808169

.write_piracy_string:
	LDX #$0006				;$80816B
	LDY #$0004				;$80816E
.write_next_byte:
	LDA piracy_string,x			;$808171
	STA piracy_string_result,x		;$808174
	CMP.l sram_base,x			;$808177
	BNE +					;$80817B
	DEY					;$80817D
+:
	STA.l sram_base,x			;$80817E
	DEX					;$808182
	DEX					;$808183
	BPL .write_next_byte			;$808184
	TYA					;$808186
	BEQ .prepare_anti_piracy		;$808187
	LDY #$000F				;$808189
	BRA .prepare_message			;$80818C

.prepare_anti_piracy:
	LDY #$0010				;$80818E
.prepare_message:
	LDA #$0000				;$808191
	TCD					;$808194
	LDX #stack				;$808195
	TXS					;$808198
	%return(display_error_message)
	%return(clear_VRAM)	
	BRA init_registers			;$808199

.final_piracy_test:
	PHK					;$80819B
	PLB					;$80819C
	LDX #$0006				;$80819D
-:
	LDA piracy_string_result,x		;$8081A0
	CMP piracy_string,x			;$8081A3
	BNE .prepare_logo			;$8081A6
	DEX					;$8081A8
	DEX					;$8081A9
	BPL -					;$8081AA
	BRA .prepare_anti_piracy		;$8081AC

.prepare_logo:
	LDA #$0000				;$8081AE
	STA.l sram_base				;$8081B1
	LDX #stack				;$8081B5
	TXS					;$8081B8
	%return(start_engine)
	%return(clear_VRAM)
init_registers:
	SEP #$30				;$8081C5
	LDX #$00				;$8081C7
.clear_ppu:
	STZ $2101,x				;$8081C9
	STZ $2101,x				;$8081CC
	INX					;$8081CF
	CPX #$34				;$8081D0
	BNE .clear_ppu				;$8081D2
	LDX #$00				;$8081D4
.clear_cpu:
	STZ $4202,x				;$8081D6
	INX					;$8081D9
	CPX #$0B				;$8081DA
	BNE .clear_cpu				;$8081DC
	LDA #$8F				;$8081DE
	STA PPU.screen				;$8081E0
	LDA #$80				;$8081E3
	STA PPU.vram_control			;$8081E5
	STA PPU.set_mode_7			;$8081E8
	LDA #$01				;$8081EB
	STA CPU.rom_speed			;$8081ED
	STZ PPU.set_color_math			;$8081F0
	STZ PPU.video_mode			;$8081F3
	STZ CPU.enable_interrupts		;$8081F6
	LDA #$FF				;$8081F9
	STA CPU.output_port			;$8081FB
	LDA #$E0				;$8081FE
	STA PPU.fixed_color			;$808200
	LDA #$30				;$808203
	STA PPU.color_addition_logic		;$808205
	LDA #$00				;$808208
	STA PPU.mosaic				;$80820A
	STZ PPU.layer_1_scroll_x		;$80820D
	STZ PPU.layer_1_scroll_x		;$808210
	STZ PPU.layer_2_scroll_x		;$808213
	STZ PPU.layer_2_scroll_x		;$808216
	STZ PPU.layer_3_scroll_x		;$808219
	STZ PPU.layer_3_scroll_x		;$80821C
	LDA #$FF				;$80821F
	STA PPU.layer_1_scroll_y		;$808221
	STA PPU.layer_1_scroll_y		;$808224
	STA PPU.layer_2_scroll_y		;$808227
	STA PPU.layer_2_scroll_y		;$80822A
	STA PPU.layer_3_scroll_y		;$80822D
	STA PPU.layer_3_scroll_y		;$808230
	REP #$30				;$808233
	SEP #$20				;$808235
	LDX #$000A				;$808237
.clear_DMA:
	STZ DMA[0].control,x			;$80823A
	STZ HDMA[$01].control,x			;$80823D
	STZ HDMA[$02].control,x			;$808240
	STZ HDMA[$03].control,x			;$808243
	STZ HDMA[$04].control,x			;$808246
	STZ HDMA[$05].control,x			;$808249
	STZ HDMA[$06].control,x			;$80824C
	STZ HDMA[$07].control,x			;$80824F
	DEX					;$808252
	BPL .clear_DMA				;$808253
	REP #$20				;$808255
	RTS					;$808257

init_registers_global:
	JSR init_registers			;$808258
	RTL					;$80825B

VRAM_zero_fill:
	dw $0000

clear_VRAM:
	STZ PPU.vram_address			;$80825E
	LDA #VRAM_zero_fill			;$808261
	STA DMA[0].source_word			;$808264
	STA DMA[0].unused_2			;$808267
	STZ DMA[0].size				;$80826A
	LDA #$1809				;$80826D
	STA DMA[0].settings			;$808270
	SEP #$20				;$808273
	LDA #VRAM_zero_fill>>16			;$808275
	STA DMA[0].source_bank			;$808277
	LDA #$01				;$80827A
	STA CPU.enable_dma			;$80827C
	REP #$20				;$80827F
	RTS					;$808281

clear_vram_global:
	JSR clear_VRAM				;$808282
	RTL					;$808285

start_engine:
	LDX #$0006				;$808286
CODE_808289:
	LDA piracy_string_result,x		;$808289
	CMP rare_string,x			;$80828C
	BNE CODE_808295				;$80828F
	DEX					;$808291
	DEX					;$808292
	BPL CODE_808289				;$808293
CODE_808295:
	CPX #$8000				;$808295
	STZ active_frame_counter		;$808298
	LDX #$0000				;$80829A
	LDY #$0001				;$80829D
	LDA #$FFFF				;$8082A0
	MVN $7E,$7E				;$8082A3
	LDY #$0000				;$8082A6
	TYX					;$8082A9
	LDA #$FFFF				;$8082AA
	MVN $7F,$7E				;$8082AD
	PHK					;$8082B0
	PLB					;$8082B1
	TDC					;$8082B2
	ROL					;$8082B3
	STA $06AB				;$8082B4
	LDX #$0006				;$8082B7
CODE_8082BA:
	LDA rare_string,x			;$8082BA
	STA piracy_string_result,x		;$8082BD
	DEX					;$8082C0
	DEX					;$8082C1
	BPL CODE_8082BA				;$8082C2
	LDA #$3127				;$8082C4
	STA $02					;$8082C7
	STA $04					;$8082C9
	JSL upload_spc_engine			;$8082CB
	JSR CODE_80BBA6				;$8082CF
	LDA #$0004				;$8082D2
	TRB $06AB				;$8082D5
	TDC					;$8082D8
	SEP #$20				;$8082D9
	LDA $B06008				;$8082DB
	BPL CODE_8082E2				;$8082DF
	TDC					;$8082E1
CODE_8082E2:
	CMP #$03				;$8082E2
	BCC CODE_8082E7				;$8082E4
	TDC					;$8082E6
CODE_8082E7:
	REP #$20				;$8082E7
	STA language_select			;$8082E9
CODE_8082EC:
	LDA #$0000				;$8082EC
	TCD					;$8082EF
	LDX #stack				;$8082F0
	TXS					;$8082F3
	JSL disable_screen_wrapper		;$8082F4
	JSR init_registers			;$8082F8
	JSL CODE_808C77				;$8082FB
	STZ $04C8				;$8082FF
	LDA #$4000				;$808302
	STA $053B				;$808305
	LDA #$000F				;$808308
	STA $06CF				;$80830B
	JSR CODE_808EA8				;$80830E
	STZ $BA					;$808311
	LDX #CODE_B284D6			;$808313
	LDY.w #CODE_B284D6>>16			;$808316
	LDA #CODE_808370			;$808319
	STX $4E					;$80831C
	STY $50					;$80831E
	JMP set_and_wait_for_nmi_direct		;$808320

CODE_808323:
	LDA #$0001				;$808323
	STA CPU.enable_dma_hdma			;$808326
	BRA nmi_return				;$808329

CODE_80832B:
	PHK					;$80832B
	%return(nmi_return)			;$80832C
	JMP [$0052]				;$80832F

nmi_return:
	PLY					;$808332
	PLX					;$808333
	PLA					;$808334
	PLD					;$808335
	RTI					;$808336

CODE_808337:
	SEP #$20				;$808337
	LDA.l screen_brightness			;$808339
	STA.l PPU.screen			;$80833D
	REP #$20				;$808341
	RTL					;$808343

CODE_808344:
	JSL handle_fading_direct		;$808344
CODE_808348:
	LDA #stack				;$808348
	TCS					;$80834B
	PHK					;$80834C
	PLB					;$80834D
	LDA #CODE_80832B			;$80834E
	STA NMI_pointer				;$808351
	INC active_frame_counter		;$808353
	INC $C2					;$808355
	BNE CODE_80835F				;$808357
	INC $C4					;$808359
	BNE CODE_80835F				;$80835B
	DEC $C4					;$80835D
CODE_80835F:
	JMP [$004E]				;$80835F

CODE_808362:
	LDA #stack				;$808362
	TCS					;$808365
	LDA #CODE_80832B			;$808366
	STA NMI_pointer				;$808369
	INC active_frame_counter		;$80836B
	JMP [$004E]				;$80836D

CODE_808370:
	LDA #stack				;$808370
	TCS					;$808373
	LDA #CODE_80832B			;$808374
	STA NMI_pointer				;$808377
	INC active_frame_counter		;$808379
	INC $F4					;$80837B
	BNE CODE_808381				;$80837D
	INC $F6					;$80837F
CODE_808381:
	JMP [$004E]				;$808381

CODE_808384:
	JSR CODE_808C43				;$808384
CODE_808387:
	PHK					;$808387
	PLB					;$808388
	LDA $4C					;$808389
	STA NMI_pointer				;$80838B
	SEP #$20				;$80838D
	LDA CPU.nmi_flag			;$80838F
	LDA #$81				;$808392
	STA CPU.enable_interrupts		;$808394
	STZ joypad.port_0			;$808397
CODE_80839A:
	WAI					;$80839A
	BRA CODE_80839A				;$80839B

set_and_wait_for_nmi_direct:
	STA NMI_pointer				;$80839D
	STA $4C					;$80839F
	LDA #CODE_808337			;$8083A1
	STA $52					;$8083A4
	LDA.w #CODE_808337>>16			;$8083A6
	STA $54					;$8083A9
	SEP #$20				;$8083AB
	LDA CPU.irq_flag			;$8083AD
	LDA CPU.nmi_flag			;$8083B0
CODE_8083B3:
	LDA CPU.nmi_flag			;$8083B3
	BMI CODE_8083B3				;$8083B6
	LDA #$81				;$8083B8
	STA CPU.enable_interrupts		;$8083BA
	STZ joypad.port_0			;$8083BD
CODE_8083C0:
	WAI					;$8083C0
	BRA CODE_8083C0				;$8083C1

CODE_8083C3:
	PHK					;$8083C3
	PLB					;$8083C4
	STA $4E					;$8083C5
	STX $50					;$8083C7
	JMP CODE_808384				;$8083C9

CODE_8083CC:
	LDA #$01FF				;$8083CC
	TCS					;$8083CF
	LDA #CODE_80832B			;$8083D0
	STA $4A					;$8083D3
	LDA #$2000				;$8083D5
	BIT $05B1				;$8083D8
	BEQ CODE_8083FB				;$8083DB
	LDA #$0040				;$8083DD
	TSB game_state_flags			;$8083E0
	LDA $F4					;$8083E3
	CMP $053D				;$8083E5
	BCC CODE_80840A				;$8083E8
	LDA screen_brightness			;$8083EA
	AND #$FF00				;$8083ED
	BNE CODE_80840A				;$8083F0
	LDA #$810F				;$8083F2
	JSL set_fade				;$8083F5
	BRA CODE_80840A				;$8083F9

CODE_8083FB:
	LDA $F4					;$8083FB
	CMP $051D				;$8083FD
	BCC CODE_80840A				;$808400
	LDA #$0001				;$808402
	STA $1D89				;$808405
	STZ $F4					;$808408
CODE_80840A:
	INC active_frame_counter		;$80840A
	INC $F4					;$80840C
	JMP [$004E]				;$80840E

CODE_808411:
	LDX #game_state_flags			;$808411
	LDY #$00F3				;$808414
CODE_808417:
	STZ $00,x				;$808417
	INX					;$808419
	DEY					;$80841A
	BNE CODE_808417				;$80841B
	STZ $05BB				;$80841D
	STZ $05BD				;$808420
	STZ $05B7				;$808423
	LDA $053B				;$808426
	STA $06A1				;$808429
	LDA #!level_lakeside_limbo		;$80842C
	STA level_number			;$80842F
	STA parent_level_number			;$808431
	LDA #$0000				;$808434
	STA current_kong			;$808437
	STZ game_state_flags			;$80843A
	STZ $05B1				;$80843D
	STZ $C2					;$808440
	STZ $C4					;$808442
	JSR CODE_80912F				;$808444
	LDA #$0959				;$808447
	STA $0630				;$80844A
	LDA #$000C				;$80844D
	TSB $0615				;$808450
	LDA #$0010				;$808453
	TSB $0625				;$808456
	LDA #$0080				;$808459
	TSB $061B				;$80845C
	LDA #$0020				;$80845F
	TSB $0621				;$808462
	LDA #$0400				;$808465
	STA $0611				;$808468
	LDA #$0004				;$80846B
	STA $0613				;$80846E
	JSL CODE_B4800C				;$808471
	STZ $0523				;$808475
	LDA #$0004				;$808478
	STA $00052F				;$80847B
	LDA #$0002				;$80847F
	STA $000525				;$808482
	STZ $0527				;$808486
	LDA #$1D93				;$808489
	STA $0541				;$80848C
	STZ $0543				;$80848F
	RTL					;$808492

CODE_808493:
	PHK					;$808493
	PLB					;$808494
	LDA #CODE_808337			;$808495
	STA $52					;$808498
	LDA.w #CODE_808337>>16			;$80849A
	STA $54					;$80849D
	JSL CODE_BB8576				;$80849F
	PHK					;$8084A3
	PLB					;$8084A4
	LDA #$0200				;$8084A5
	JSL set_fade				;$8084A8
	SEP #$20				;$8084AC
	LDA $0773				;$8084AE
	STA $58					;$8084B1
	LDA $0771				;$8084B3
	STA $56					;$8084B6
	REP #$20				;$8084B8
	LDA #CODE_B38076			;$8084BA
	LDX.w #CODE_B38076>>16			;$8084BD
	STA $4E					;$8084C0
	STX $50					;$8084C2
	JMP CODE_808384				;$8084C4

CODE_8084C7:
	SEP #$20				;$8084C7
	STA $58					;$8084C9
	XBA					;$8084CB
	STA $56					;$8084CC
	REP #$20				;$8084CE
	LDA #CODE_B38076			;$8084D0
	LDX.w #CODE_B38076>>16			;$8084D3
	JMP CODE_8083C3				;$8084D6

throw_sprite_group_exception_global:
	PHX					;$8084D9
	LDX current_sprite			;$8084DA
	LDA sprite.placement_parameter,x	;$8084DC
	PLX					;$8084DE
	AND #$1F00				;$8084DF
	BEQ CODE_8084EB				;$8084E2
	LDA #$0008				;$8084E4
	JSL throw_exception			;$8084E7
CODE_8084EB:
	RTL					;$8084EB

throw_exception:
	RTL					;$8084EC

CODE_8084ED:
	STA $001D49				;$8084ED
	LDA #$00B4				;$8084F1
	STA $001D4B				;$8084F4
	LDA $001D4D				;$8084F8
	STA $001D4F				;$8084FC
	RTL					;$808500

set_fade:
	STZ screen_fade_speed			;$808501
	STA screen_brightness			;$808504
	RTL					;$808507

handle_fading_direct:
	SEP #$20				;$808508
	LDA screen_fade_speed			;$80850A
	BEQ .return				;$80850D
	BMI .fade_out				;$80850F
	INC screen_fade_timer			;$808511
	CMP screen_fade_timer			;$808514
	BNE .return				;$808517
	STZ screen_fade_timer			;$808519
	INC screen_brightness			;$80851C
	LDA #$0F				;$80851F
	CMP screen_brightness			;$808521
	BCS .return				;$808524
	STA screen_brightness			;$808526
	STZ screen_fade_speed			;$808529
	BRA .return				;$80852C

.fade_out:
	AND #$7F				;$80852E
	INC screen_fade_timer			;$808530
	CMP screen_fade_timer			;$808533
	BNE .return				;$808536
	STZ screen_fade_timer			;$808538
	DEC screen_brightness			;$80853B
	BMI .fade_finished			;$80853E
	BNE .return				;$808540
.fade_finished:
	STZ screen_fade_speed			;$808542
	STZ screen_brightness			;$808545
.return:
	REP #$20				;$808548
	LDA $1D89				;$80854A
	BNE CODE_808550				;$80854D
	RTL					;$80854F

CODE_808550:
	LDA #$0000				;$808550
	STA $00044A				;$808553
	LDA #$0778				;$808557
	JSL CODE_B28018				;$80855A
	SEP #$20				;$80855E
	LDA #$E0				;$808560
	STA PPU.fixed_color			;$808562
	REP #$20				;$808565
	LDA pending_dma_hdma_channels		;$808567
	AND #$1E01				;$80856A
	STA pending_dma_hdma_channels		;$80856D
	LDA #$0040				;$808570
	TSB game_state_flags			;$808573
	STZ $1D89				;$808576
	LDA #$8025				;$808579
	STA $1D8B				;$80857C
	LDA #$8078				;$80857F
	STA $1D8F				;$808582
	LDY #$026E				;$808585
	JSL CODE_BB8588				;$808588
	LDX alternate_sprite			;$80858C
	LDA sprite.oam_property,x		;$80858E
	AND #$F1FF				;$808590
	ORA #$0C00				;$808593
	STA sprite.oam_property,x		;$808596
	LDA level_number			;$808598
	CMP #!level_bosses_photo_album		;$80859A
	BNE CODE_8085A7				;$80859D
	LDA sprite.y_position,x			;$80859F
	CLC					;$8085A1
	ADC #$0010				;$8085A2
	STA sprite.y_position,x			;$8085A5
CODE_8085A7:
	LDA #$0C00				;$8085A7
	ORA sprite.oam_property,x		;$8085AA
	STA sprite.oam_property,x		;$8085AC
	LDA #$FFFF				;$8085AE
	STA sprite.general_purpose_5E,x		;$8085B1
	PHB					;$8085B3
	PHK					;$8085B4
	PLB					;$8085B5
	LDA $05E3				;$8085B6
	ASL					;$8085B9
	ASL					;$8085BA
	ASL					;$8085BB
	TAX					;$8085BC
	LDY photo_album_sequence_data,x		;$8085BD
	LDX #$FFFF				;$8085C0
	DEY					;$8085C3
CODE_8085C4:
	INX					;$8085C4
	INY					;$8085C5
	LDA $0000,y				;$8085C6
	AND #$00FF				;$8085C9
	STA $7EFFE0,x				;$8085CC
	BNE CODE_8085C4				;$8085D0
	INC $05E3				;$8085D2
	PLB					;$8085D5
	LDX #$01FE				;$8085D6
	LDA #$7FFF				;$8085D9
	STA $1D8D				;$8085DC
CODE_8085DF:
	STA $7E2F80,x				;$8085DF
	DEX					;$8085E3
	DEX					;$8085E4
	BPL CODE_8085DF				;$8085E5
	LDA #$0000				;$8085E7
	STA $1D91				;$8085EA
	LDX #$000E				;$8085ED
	LDA #$2F60				;$8085F0
	STA $42					;$8085F3
	LDA #$007E				;$8085F5
	STA $44					;$8085F8
	STA $48					;$8085FA
CODE_8085FC:
	TXY					;$8085FC
	LDA active_sprite_palettes_table,x	;$8085FD
	ASL					;$808600
	TAX					;$808601
	LDA sprite_palette_table,x		;$808602
	TYX					;$808606
	SEC					;$808607
	SBC #dixie_sprite_palettes		;$808608
	CLC					;$80860B
	ADC #$317E				;$80860C range or offset
	STA $46					;$80860F
	JSR CODE_80865A				;$808611
	LDA $42					;$808614
	SEC					;$808616
	SBC #$0020				;$808617
	STA $42					;$80861A
	DEX					;$80861C
	DEX					;$80861D
	CPX #$0002				;$80861E
	BCS CODE_8085FC				;$808621
	LDX #$0200				;$808623
	LDA sprite_palette_table,x		;$808626
	DEC					;$80862A
	DEC					;$80862B
	STA $46					;$80862C
	LDA.w #dixie_sprite_palettes>>16	;$80862E
	STA $48					;$808631
	LDA #$2F40				;$808633
	STA $42					;$808636
	JSR CODE_80865A				;$808638
	LDX #$0200				;$80863B
	LDA sprite_palette_table,x		;$80863E
	DEC					;$808642
	DEC					;$808643
	STA $46					;$808644
	LDA.w #dixie_sprite_palettes>>16	;$808646
	STA $48					;$808649
	LDA #$2F60				;$80864B
	STA $42					;$80864E
	JSR CODE_80865A				;$808650
	LDA #$4000				;$808653
	TSB $05B1				;$808656
	RTL					;$808659

CODE_80865A:
	LDY #$001E				;$80865A
CODE_80865D:
	LDA [$46],y				;$80865D
	STA [$42],y				;$80865F
	DEY					;$808661
	DEY					;$808662
	BNE CODE_80865D				;$808663
	TYA					;$808665
	STA [$42],y				;$808666
	RTS					;$808668

CODE_808669:
	LDA #$1300				;$808669
	STA $80					;$80866C
	LDA $05E3				;$80866E
	ASL					;$808671
	ASL					;$808672
	ASL					;$808673
	TAX					;$808674
	LDA.l photo_album_sequence_data+$02,x	;$808675
	PHA					;$808679
	AND #$1FFF				;$80867A
	TAY					;$80867D
	PLA					;$80867E
	BPL CODE_8086A0				;$80867F
	BIT #$2000				;$808681
	BEQ CODE_80868F				;$808684
	LDA #$0003				;$808686
	JSL CODE_BB85F7				;$808689
	BRA CODE_8086A4				;$80868D

CODE_80868F:
	BIT #$4000				;$80868F
	BEQ CODE_80869A				;$808692
	JSL CODE_BB85B8				;$808694
	BRA CODE_8086A4				;$808698

CODE_80869A:
	JSL CODE_BB85B5				;$80869A
	BRA CODE_8086A4				;$80869E

CODE_8086A0:
	JSL CODE_BB8585				;$8086A0
CODE_8086A4:
	STZ current_kong			;$8086A4
	LDX alternate_sprite			;$8086A7
	STX active_kong_sprite			;$8086A9
	LDA #dixie_control_variables		;$8086AC
	CPX $0501				;$8086AF
	BEQ CODE_8086B7				;$8086B2
	LDA #kiddy_control_variables		;$8086B4
CODE_8086B7:
	STA current_kong_control_variables	;$8086B7
	LDA sprite.state,x			;$8086B9
	BMI CODE_8086BE				;$8086BB
	RTL					;$8086BD

CODE_8086BE:
	EOR #$FFFF				;$8086BE
	INC					;$8086C1
	JSL CODE_BB85E2				;$8086C2
	PHK					;$8086C6
	PLB					;$8086C7
	RTL					;$8086C8

CODE_8086C9:
	LDA $1D8B				;$8086C9
	BEQ CODE_8086D6				;$8086CC
	DEC $1D8B				;$8086CE
	BMI CODE_8086D6				;$8086D1
	STZ $1D8B				;$8086D3
CODE_8086D6:
	LDA $1D8F				;$8086D6
	BEQ CODE_8086E9				;$8086D9
	DEC $1D8F				;$8086DB
	DEC $1D8F				;$8086DE
	DEC $1D8F				;$8086E1
	BMI CODE_8086E9				;$8086E4
	STZ $1D8F				;$8086E6
CODE_8086E9:
	LDA #$2D80				;$8086E9
	STA $42					;$8086EC
	LDA #$007E				;$8086EE
	STA $44					;$8086F1
	STA temp_1C				;$8086F3
	LDA #$2F80				;$8086F5
	STA temp_1A				;$8086F8
	LDA $1D8B				;$8086FA
	CMP #$8020				;$8086FD
	BCC CODE_808705				;$808700
	LDA #$8020				;$808702
CODE_808705:
	AND #$003F				;$808705
	LDX $1D8D				;$808708
	LDY #$01FE				;$80870B
	JSL CODE_BBC80F				;$80870E
	LDA #$2F40				;$808712
	STA $42					;$808715
	LDA #$007E				;$808717
	STA $44					;$80871A
	STA temp_1C				;$80871C
	LDA #$3140				;$80871E
	STA temp_1A				;$808721
	LDA $1D8F				;$808723
	CMP #$8020				;$808726
	BCC CODE_80872E				;$808729
	LDA #$8020				;$80872B
CODE_80872E:
	AND #$003F				;$80872E
	LDX $1D91				;$808731
	LDY #$001E				;$808734
	JSL CODE_BBC80F				;$808737
	LDA #$0000				;$80873B
	STA $7E2F80				;$80873E
	LDA.w #CODE_808769>>16			;$808742
	STA $04F7				;$808745
	LDA #CODE_808769			;$808748
	STA $04F5				;$80874B
	LDY alternate_sprite			;$80874E
	STY current_sprite			;$808750
	LDA.w sprite.main_routine_bank,y	;$808752
	PHA					;$808755
	PLB					;$808756
	LDA.w sprite.main_routine_address,y	;$808757
	PHA					;$80875A
	LDA.w sprite.constants_address,y	;$80875B
	STA current_sprite_constants		;$80875E
	LDA.w sprite.state,y			;$808760
	AND #$00FF				;$808763
	ASL					;$808766
	TAX					;$808767
	RTL					;$808768

CODE_808769:
	JSL CODE_B7800C				;$808769
	JSL CODE_B78000				;$80876D
	JSL CODE_80898C				;$808771
	JSR CODE_809741				;$808775
	BEQ CODE_80877B				;$808778
	RTL					;$80877A

CODE_80877B:
	LDA #$2000				;$80877B
	TRB $05B1				;$80877E
	STZ $F4					;$808781
	STZ $05BB				;$808783
	STZ $05BD				;$808786
	LDA #CODE_80B2C8			;$808789
	STA $4E					;$80878C
	LDA.w #CODE_80B2C8>>16			;$80878E
	STA $50					;$808791
	LDA #CODE_808362			;$808793
	JMP set_and_wait_for_nmi_direct		;$808796

DMA_queued_sprite_palette_global:
	LDA $1D8B				;$808799
	BNE CODE_8087F9				;$80879C
	LDA $E6					;$80879E
	CMP $E8					;$8087A0
	BEQ CODE_8087D4				;$8087A2
	ASL					;$8087A4
	ASL					;$8087A5
	TAX					;$8087A6
	LDA $E6					;$8087A7
	INC					;$8087A9
	AND #$000F				;$8087AA
	STA $E6					;$8087AD
	LDA #$2200				;$8087AF
	STA DMA[0].settings			;$8087B2
	LDA #$001E				;$8087B5
	STA DMA[0].size				;$8087B8
	LDA palette_upload_ring_buffer,x	;$8087BB
	STA DMA[0].source_word			;$8087BE
	LDA $06FE,x				;$8087C1
	SEP #$20				;$8087C4
	STA DMA[0].source_bank			;$8087C6
	XBA					;$8087C9
	STA PPU.cgram_address			;$8087CA
	LDA #$01				;$8087CD
	STA CPU.enable_dma			;$8087CF
	REP #$20				;$8087D2
CODE_8087D4:
	RTL					;$8087D4

DMA_queued_sprite_palettes_global:
	JSL DMA_queued_sprite_palette_global	;$8087D5
	LDA $E6					;$8087D9
	CMP $E8					;$8087DB
	BNE DMA_queued_sprite_palettes_global	;$8087DD
	RTL					;$8087DF

DMA_to_VRAM_direct:
	STA DMA[0].source_word			;$8087E0
	STY DMA[0].size				;$8087E3
	LDA #$1801				;$8087E6
	STA DMA[0].settings			;$8087E9
	SEP #$30				;$8087EC
	STX DMA[0].source_bank			;$8087EE
	LDA #$01				;$8087F1
	STA CPU.enable_dma			;$8087F3
	REP #$30				;$8087F6
	RTL					;$8087F8

CODE_8087F9:
	LDA #$4000				;$8087F9
	TRB $05B1				;$8087FC
	BEQ CODE_808804				;$8087FF
	JSR CODE_80882A				;$808801
CODE_808804:
	LDA #$2200				;$808804
	STA DMA[0].settings			;$808807
	LDA #$0200				;$80880A
	STA DMA[0].size				;$80880D
	LDA #$2F80				;$808810
	STA DMA[0].source_word			;$808813
	SEP #$20				;$808816
	LDA #$7E				;$808818
	STA DMA[0].source_bank			;$80881A
	LDA #$00				;$80881D
	STA PPU.cgram_address			;$80881F
	LDA #$01				;$808822
	STA CPU.enable_dma			;$808824
	REP #$20				;$808827
	RTL					;$808829

CODE_80882A:
	LDA #$2000				;$80882A
	TSB $05B1				;$80882D
	LDA level_number			;$808830
	CMP #!level_brothers_bear_photo_album	;$808832
	BEQ CODE_808898				;$808835
	CMP #!level_bosses_photo_album		;$808837
	BEQ CODE_808898				;$80883A
	LDA #$CCCC				;$80883C
	STA PPU.set_window_layer_1_2		;$80883F
	STA PPU.set_window_layer_3_4		;$808842
	LDA #$0000				;$808845
	STA PPU.set_window_sprite_color		;$808848
	LDA #$1F1F				;$80884B
	STA PPU.window_masks			;$80884E
	LDA #$0030				;$808851
	STA $7EA15A				;$808854
	LDA #$0001				;$808858
	STA $7EA15B				;$80885B
	LDA #$0070				;$80885F
	STA $7EA15D				;$808862
	LDA #$BF40				;$808866
	STA $7EA15E				;$808869
	LDA #$0001				;$80886D
	STA $7EA160				;$808870
	STA $7EA161				;$808874
	SEP #$20				;$808878
	LDX #$2801				;$80887A
	STX HDMA[$07].settings			;$80887D
	LDX #$A15A				;$808880
	STX HDMA[$07].source_word		;$808883
	LDA #$7E				;$808886
	STA HDMA[$07].source_bank		;$808888
	STA HDMA[$07].indirect_source_bank	;$80888B
	REP #$20				;$80888E
	LDA #$8000				;$808890
	TSB pending_dma_hdma_channels		;$808893
	BRA CODE_80889E				;$808896

CODE_808898:
	LDA #$0017				;$808898
	STA PPU.screens				;$80889B
CODE_80889E:
	LDA #$1E80				;$80889E
	STA PPU.vram_address			;$8088A1
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088A4
	LDA #DATA_FC2F40+$C0			;$8088A7
	LDY #$0020				;$8088AA
	JSL DMA_to_VRAM_direct			;$8088AD
	LDA #$1E90				;$8088B1
	STA PPU.vram_address			;$8088B4
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088B7
	LDA #DATA_FC2F40+$C0			;$8088BA
	LDY #$0020				;$8088BD
	JSL DMA_to_VRAM_direct			;$8088C0
	LDA #$1F80				;$8088C4
	STA PPU.vram_address			;$8088C7
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088CA
	LDA #DATA_FC2F40+$C0			;$8088CD
	LDY #$0020				;$8088D0
	JSL DMA_to_VRAM_direct			;$8088D3
	LDA #$1F90				;$8088D7
	STA PPU.vram_address			;$8088DA
	LDX.w #(DATA_FC2F40+$C0)>>16		;$8088DD
	LDA #DATA_FC2F40+$C0			;$8088E0
	LDY #$0020				;$8088E3
	JSL DMA_to_VRAM_direct			;$8088E6
	LDA #$1EA0				;$8088EA
	STA PPU.vram_address			;$8088ED
	LDX.w #DATA_FC2F40>>16			;$8088F0
	LDA #DATA_FC2F40			;$8088F3
	LDY #$0060				;$8088F6
	JSL DMA_to_VRAM_direct			;$8088F9
	LDA #$1ED0				;$8088FD
	STA PPU.vram_address			;$808900
	LDX.w #(DATA_FC2F40+$40)>>16		;$808903
	LDA #DATA_FC2F40+$40			;$808906
	LDY #$0060				;$808909
	JSL DMA_to_VRAM_direct			;$80890C
	LDA #$1FA0				;$808910
	STA PPU.vram_address			;$808913
	LDX.w #(DATA_FC2F40+$A0)>>16		;$808916
	LDA #DATA_FC2F40+$A0			;$808919
	LDY #$0020				;$80891C
	JSL DMA_to_VRAM_direct			;$80891F
	LDA #$1FB0				;$808923
	STA PPU.vram_address			;$808926
	LDX.w #(DATA_FC2F40+$80)>>16		;$808929
	LDA #DATA_FC2F40+$80			;$80892C
	LDY #$0020				;$80892F
	JSL DMA_to_VRAM_direct			;$808932
	LDA #$1FC0				;$808936
	STA PPU.vram_address			;$808939
	LDX.w #(DATA_FC2F40+$80)>>16		;$80893C
	LDA #DATA_FC2F40+$80			;$80893F
	LDY #$0020				;$808942
	JSL DMA_to_VRAM_direct			;$808945
	LDA #$1FD0				;$808949
	STA PPU.vram_address			;$80894C
	LDX.w #(DATA_FC2F40+$80)>>16		;$80894F
	LDA #DATA_FC2F40+$80			;$808952
	LDY #$0020				;$808955
	JSL DMA_to_VRAM_direct			;$808958
	LDA #$1FF0				;$80895C
	STA PPU.vram_address			;$80895F
	LDX.w #(DATA_FC2F40+$80)>>16		;$808962
	LDA #DATA_FC2F40+$80			;$808965
	LDY #$0020				;$808968
	JSL DMA_to_VRAM_direct			;$80896B
	LDA #$1FE0				;$80896F
	STA PPU.vram_address			;$808972
	LDX.w #(DATA_FC2F40+$60)>>16		;$808975
	LDA #DATA_FC2F40+$60			;$808978
	LDY #$0020				;$80897B
	JSL DMA_to_VRAM_direct			;$80897E
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
	CMP #$0001				;$8089AA
	BEQ CODE_8089C5				;$8089AD
	LDA CPU.port_0_data_1			;$8089AF
	TAX					;$8089B2
	EOR player_1_held			;$8089B3
	AND CPU.port_0_data_1			;$8089B6
	STA player_1_pressed			;$8089B9
	TXA					;$8089BC
	STA player_1_held			;$8089BD
	JSR CODE_808DFA				;$8089C0
	BRA CODE_808A13				;$8089C3

CODE_8089C5:
	JSR CODE_808E29				;$8089C5
	BRA CODE_808A13				;$8089C8

CODE_8089CA:
	PHK					;$8089CA
	PLB					;$8089CB
	SEP #$20				;$8089CC
	LDA #$01				;$8089CE
CODE_8089D0:
	BIT CPU.ppu_status			;$8089D0
	BNE CODE_8089D0				;$8089D3
	REP #$20				;$8089D5
	LDA $0523				;$8089D7
	BNE CODE_8089AA				;$8089DA
	LDA CPU.port_0_data_1			;$8089DC
	TAX					;$8089DF
	EOR player_1_held			;$8089E0
	AND CPU.port_0_data_1			;$8089E3
	STA player_1_pressed			;$8089E6
	TXA					;$8089E9
	EOR player_1_held			;$8089EA
	AND player_1_held			;$8089ED
	STA player_1_release			;$8089F0
	STX player_1_held			;$8089F3
	LDA CPU.port_1_data_1			;$8089F6
	TAX					;$8089F9
	EOR player_2_held			;$8089FA
	AND CPU.port_1_data_1			;$8089FD
	STA player_2_pressed			;$808A00
	TXA					;$808A03
	EOR player_2_held			;$808A04
	AND player_2_held			;$808A07
	STA player_2_release			;$808A0A
	STX player_2_held			;$808A0D
	JSR CODE_808B28				;$808A10
CODE_808A13:
	LDA current_game_mode			;$808A13
	BEQ CODE_808A5B				;$808A16
	DEC					;$808A18
	BEQ CODE_808A3A				;$808A19
	LDA active_player			;$808A1B
	ASL					;$808A1E
	TAX					;$808A1F
	LDA player_1_held,x			;$808A20
	STA player_active_held			;$808A23
	LDA player_2_held,x			;$808A26
	STA player_inactive_held		;$808A29
	LDA player_1_pressed,x			;$808A2C
	STA player_active_pressed		;$808A2F
	LDA player_2_pressed,x			;$808A32
	STA player_inactive_pressed		;$808A35
	BRA CODE_808A6D				;$808A38

CODE_808A3A:
	LDA $05B3				;$808A3A
	AND #$0002				;$808A3D
	TAX					;$808A40
	LDA player_1_held,x			;$808A41
	STA player_active_held			;$808A44
	LDA player_2_held,x			;$808A47
	STA player_inactive_held		;$808A4A
	LDA player_1_pressed,x			;$808A4D
	STA player_active_pressed		;$808A50
	LDA player_2_pressed,x			;$808A53
	STA player_inactive_pressed		;$808A56
	BRA CODE_808A6D				;$808A59

CODE_808A5B:
	LDA player_1_held			;$808A5B
	STA player_active_held			;$808A5E
	STZ player_inactive_held		;$808A61
	LDA player_1_pressed			;$808A64
	STA player_active_pressed		;$808A67
	STZ player_inactive_pressed		;$808A6A
CODE_808A6D:
	LDA game_state_flags			;$808A6D
	AND #$0040				;$808A70
	BNE CODE_808AE8				;$808A73
	LDA #$0010				;$808A75
	TRB $05B1				;$808A78
	BNE CODE_808ADC				;$808A7B
	LDA #$0200				;$808A7D
	TRB game_state_flags			;$808A80
	BEQ CODE_808AB5				;$808A83
	LDA $04D7				;$808A85
	AND #$0003				;$808A88
	ASL					;$808A8B
	TAX					;$808A8C
	LDA.l DATA_808B8B,x			;$808A8D
	EOR player_active_held			;$808A91
	AND #!input_left|!input_right		;$808A94
	EOR player_active_held			;$808A97
	STA player_active_held			;$808A9A
	LDA $04DB				;$808A9D
	AND #$0003				;$808AA0
	ASL					;$808AA3
	TAX					;$808AA4
	LDA.l DATA_808B8B,x			;$808AA5
	EOR player_active_pressed		;$808AA9
	AND #!input_left|!input_right		;$808AAC
	EOR player_active_pressed		;$808AAF
	STA player_active_pressed		;$808AB2
CODE_808AB5:
	LDA game_state_flags			;$808AB5
	AND #$0040				;$808AB8
	RTL					;$808ABB

CODE_808ABC:
	LDA screen_brightness			;$808ABC
	BEQ CODE_808AB5				;$808ABF
	CMP #$0100				;$808AC1
	BCS CODE_808AB5				;$808AC4
	JSR CODE_808B0B				;$808AC6
	LDA #$00FF				;$808AC9
	TRB $0430				;$808ACC
	STZ $0424				;$808ACF
	STZ $0426				;$808AD2
	LDA #$0040				;$808AD5
	TRB game_state_flags			;$808AD8
	RTL					;$808ADB

CODE_808ADC:
	LDA #$0040				;$808ADC
	TSB game_state_flags			;$808ADF
	STZ $1947				;$808AE2
	JSR CODE_808B0B				;$808AE5
CODE_808AE8:
	LDA $4C					;$808AE8
	CMP #CODE_8083CC			;$808AEA
	BEQ CODE_808AF7				;$808AED
	LDA player_active_pressed		;$808AEF
	AND #!input_start			;$808AF2
	BNE CODE_808ABC				;$808AF5
CODE_808AF7:
	LDA $C2					;$808AF7
	SEC					;$808AF9
	SBC #$0001				;$808AFA
	STA $C2					;$808AFD
	LDA $C4					;$808AFF
	SBC #$0000				;$808B01
	STA $C4					;$808B04
	JSR CODE_808B93				;$808B06
	BRA CODE_808AB5				;$808B09

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
	STZ temp_1A				;$808B28
	LDA player_1_held			;$808B2A
	AND #$0007				;$808B2D
	BEQ CODE_808B47				;$808B30
	SEP #$20				;$808B32
	LDY #$0010				;$808B34
CODE_808B37:
	LDA joypad.port_0			;$808B37
	DEY					;$808B3A
	BNE CODE_808B37				;$808B3B
	REP #$20				;$808B3D
	STZ player_1_held			;$808B3F
	STZ player_1_pressed			;$808B42
	BRA CODE_808B59				;$808B45

CODE_808B47:
	SEP #$20				;$808B47
	LDA joypad.port_0			;$808B49
	REP #$20				;$808B4C
	BIT #$0001				;$808B4E
	BNE CODE_808B59				;$808B51
	STZ player_1_held			;$808B53
	STZ player_1_pressed			;$808B56
CODE_808B59:
	LDA player_2_held			;$808B59
	AND #$0007				;$808B5C
	BEQ CODE_808B76				;$808B5F
	SEP #$20				;$808B61
	LDY #$0010				;$808B63
CODE_808B66:
	LDA joypad.port_1			;$808B66
	DEY					;$808B69
	BNE CODE_808B66				;$808B6A
	REP #$20				;$808B6C
	STZ player_2_held			;$808B6E
	STZ player_2_pressed			;$808B71
	BRA CODE_808B88				;$808B74

CODE_808B76:
	SEP #$20				;$808B76
	LDA joypad.port_1			;$808B78
	REP #$20				;$808B7B
	BIT #$0001				;$808B7D
	BNE CODE_808B8A				;$808B80
	STZ player_2_held			;$808B82
	STZ player_2_pressed			;$808B85
CODE_808B88:
	INC temp_1A				;$808B88
CODE_808B8A:
	RTS					;$808B8A

DATA_808B8B:
	dw $0000
	dw !input_left
	dw !input_right
	dw $0000

CODE_808B93:
	LDA $1947				;$808B93
	BNE CODE_808BDC				;$808B96
	LDA player_active_pressed		;$808B98
	AND #!input_select			;$808B9B
	BNE CODE_808BA4				;$808B9E
	LDA #$0040				;$808BA0
	RTS					;$808BA3

CODE_808BA4:
	LDX parent_level_number			;$808BA4
	LDA $0632,x				;$808BA7
	AND #$0002				;$808BAA
	BEQ CODE_808BD3				;$808BAD
	LDA $075C				;$808BAF
	CMP #$0001				;$808BB2
	BEQ CODE_808BC5				;$808BB5
	CMP #$0003				;$808BB7
	BEQ CODE_808BC5				;$808BBA
	CMP #$0006				;$808BBC
	BEQ CODE_808BC5				;$808BBF
	LDA #$0040				;$808BC1
	RTS					;$808BC4

CODE_808BC5:
	JSL CODE_B8807E				;$808BC5
	LDA #$FFFE				;$808BC9
	STA $195B				;$808BCC
	LDA #$0040				;$808BCF
	RTS					;$808BD2

CODE_808BD3:
	LDA #$0001				;$808BD3
	STA $1947				;$808BD6
	STZ $1949				;$808BD9
CODE_808BDC:
	LDA $1949				;$808BDC
	INC					;$808BDF
	BEQ CODE_808C31				;$808BE0
	LDA $1947				;$808BE2
	ASL					;$808BE5
	TAX					;$808BE6
	LDA player_active_held			;$808BE7
	AND #!input_LR				;$808BEA
	CMP #!input_LR				;$808BED
	BNE CODE_808C2B				;$808BF0
	LDA player_active_pressed		;$808BF2
	BEQ CODE_808C31				;$808BF5
	AND.l DATA_808C35-$02,x			;$808BF7
	BEQ CODE_808C2B				;$808BFB
	CMP.l DATA_808C35-$02,x			;$808BFD
	BEQ CODE_808C17				;$808C01
	ORA $1949				;$808C03
	AND player_active_held			;$808C06
	CMP.l DATA_808C35-$02,x			;$808C09
	BEQ CODE_808C17				;$808C0D
	AND player_active_pressed		;$808C0F
	STA $1949				;$808C12
	BRA CODE_808C31				;$808C15

CODE_808C17:
	AND player_active_pressed		;$808C17
	STA $1949				;$808C1A
	INX					;$808C1D
	INX					;$808C1E
	INC $1947				;$808C1F
	LDA.l DATA_808C35-$02,x			;$808C22
	INC					;$808C26
	BEQ CODE_808BC5				;$808C27
	BRA CODE_808C31				;$808C29

CODE_808C2B:
	LDA #$FFFF				;$808C2B
	STA $1949				;$808C2E
CODE_808C31:
	LDA #$0040				;$808C31
	RTS					;$808C34

;Dev exit cheat inputs
DATA_808C35:
	dw !input_select
	dw !input_B|!input_down
	dw !input_up|!input_X
	dw !input_select
	dw $FFFF

CODE_808C3F:
	JSR CODE_808C43				;$808C3F
	RTL					;$808C42

CODE_808C43:
	LDA #$0200				;$808C43
	STA DMA[0].source_word			;$808C46
	STA DMA[0].unused_2			;$808C49
	LDA #$0220				;$808C4C
	STA DMA[0].size				;$808C4F
	LDA #$0400				;$808C52
	STA DMA[0].settings			;$808C55
	SEP #$20				;$808C58
	STZ DMA[0].source_bank			;$808C5A
	REP #$20				;$808C5D
	RTS					;$808C5F

;RNG routine?
CODE_808C60:
	LDA $02					;$808C60
	STA temp_1C				;$808C62
	ASL					;$808C64
	LDA $04					;$808C65
	ROL					;$808C67
	STA temp_1A				;$808C68
	LDA $03					;$808C6A
	EOR temp_1A				;$808C6C
	STA $02					;$808C6E
	LDA temp_1C				;$808C70
	STA $04					;$808C72
	LDA $02					;$808C74
	RTL					;$808C76

CODE_808C77:
	LDA $01,S				;$808C77
	INC					;$808C79
	STA temp_1A				;$808C7A
	LDA $03,S				;$808C7C
	STA temp_1C				;$808C7E
	LDX #$001F				;$808C80
	TXS					;$808C83
	INX					;$808C84
	LDY #$007E				;$808C85
	LDA #$0683				;$808C88
	JSL CODE_808CEC				;$808C8B
	LDX #$06D8				;$808C8F
	LDY #$007E				;$808C92
	LDA #$F928				;$808C95
	JSL CODE_808CEC				;$808C98
	LDX #$0000				;$808C9C
	LDY #$007F				;$808C9F
	LDA #$0000				;$808CA2
	JSL CODE_808CEC				;$808CA5
	LDX #$01FF				;$808CA9
	TXS					;$808CAC
	JMP [$001A]				;$808CAD

CODE_808CB0:
	PHB					;$808CB0
	PHK					;$808CB1
	PLB					;$808CB2
	STZ $044A				;$808CB3
	LDX #$00C6				;$808CB6
	LDY #$007E				;$808CB9
	LDA #$0034				;$808CBC
	JSL CODE_808CEC				;$808CBF
	LDX #$06D8				;$808CC3
	LDY #$007E				;$808CC6
	LDA #$16C3				;$808CC9
	JSL CODE_808CEC				;$808CCC
	LDX #$2D80				;$808CD0
	LDY #$007E				;$808CD3
	LDA #$D280				;$808CD6
	JSL CODE_808CEC				;$808CD9
	LDX #$0000				;$808CDD
	LDY #$007F				;$808CE0
	LDA #$0000				;$808CE3
	JSL CODE_808CEC				;$808CE6
	PLB					;$808CEA
	RTL					;$808CEB

CODE_808CEC:
	STA DMA[0].size				;$808CEC
	TXA					;$808CEF
	STA DMA[0].source_word			;$808CF0
	TYA					;$808CF3
	SEP #$20				;$808CF4
	STA DMA[0].source_bank			;$808CF6
	LDA.b #PPU.vram_read_low		;$808CF9
	STA DMA[0].destination			;$808CFB
	LDA #$80				;$808CFE
	STA DMA[0].control			;$808D00
	STA PPU.vram_control			;$808D03
	REP #$20				;$808D06
	LDA #$0001				;$808D08
	LDY #$0000				;$808D0B
	STY PPU.vram_address			;$808D0E
	LDX PPU.vram_read			;$808D11
	STY PPU.vram_address			;$808D14
	STY PPU.vram_write			;$808D17
	STY PPU.vram_address			;$808D1A
	SEP #$20				;$808D1D
	STA CPU.enable_dma			;$808D1F
	REP #$20				;$808D22
	STY PPU.vram_address			;$808D24
	STX PPU.vram_write			;$808D27
	RTL					;$808D2A

CODE_808D2B:
	STX temp_1A				;$808D2B
	ASL					;$808D2D
	ASL					;$808D2E
	ASL					;$808D2F
	ASL					;$808D30
	ORA #$0008				;$808D31
	TAY					;$808D34
CODE_808D35:
	LDX #$0008				;$808D35
	SEP #$20				;$808D38
CODE_808D3A:
	STY PPU.vram_address			;$808D3A
	LDA PPU.vram_read_low			;$808D3D
	ORA PPU.vram_read_high			;$808D40
	STY PPU.vram_address			;$808D43
	STA PPU.vram_write_low			;$808D46
	INY					;$808D49
	DEX					;$808D4A
	BNE CODE_808D3A				;$808D4B
	REP #$20				;$808D4D
	TYA					;$808D4F
	CLC					;$808D50
	ADC #$0008				;$808D51
	TAY					;$808D54
	DEC temp_1A				;$808D55
	BNE CODE_808D35				;$808D57
	RTL					;$808D59

CODE_808D5A:
	PHB					;$808D5A
	%pea_mask_dbr(DATA_B4FCD2)		;$808D5B
	PLB					;$808D5E
	PLB					;$808D5F
	PHX					;$808D60
	PHY					;$808D61
	PHA					;$808D62
	CMP #$0000				;$808D63
	BPL CODE_808D6B				;$808D66
	LDA #$0000				;$808D68
CODE_808D6B:
	SEP #$30				;$808D6B
	CPX #$00				;$808D6D
	BEQ CODE_808DD1				;$808D6F
	TAY					;$808D71
	LDA.w DATA_B4FCD2,x			;$808D72
	STA CPU.multiply_A			;$808D75
	STY CPU.multiply_B			;$808D78
	TYA					;$808D7B
	XBA					;$808D7C
	LDY CPU.multiply_result_high		;$808D7D
	STA CPU.multiply_B			;$808D80
	REP #$30				;$808D83
	TYA					;$808D85
	AND #$00FF				;$808D86
	CLC					;$808D89
	ADC CPU.multiply_result			;$808D8A
	STA temp_1A				;$808D8D
	PLA					;$808D8F
	SEP #$30				;$808D90
	TAY					;$808D92
	TXA					;$808D93
	EOR #$FF				;$808D94
	INC					;$808D96
	TAX					;$808D97
	LDA.w DATA_B4FCD2,x			;$808D98
	STA CPU.multiply_A			;$808D9B
	STY CPU.multiply_B			;$808D9E
	XBA					;$808DA1
	NOP					;$808DA2
	LDY CPU.multiply_result_high		;$808DA3
	STA CPU.multiply_B			;$808DA6
	TYA					;$808DA9
	REP #$30				;$808DAA
	AND #$00FF				;$808DAC
	CLC					;$808DAF
	ADC CPU.multiply_result			;$808DB0
	STA temp_1C				;$808DB3
CODE_808DB5:
	PLY					;$808DB5
	PLA					;$808DB6
	XBA					;$808DB7
	AND #$0003				;$808DB8
	BEQ CODE_808DDA				;$808DBB
	CMP #$0002				;$808DBD
	BEQ CODE_808DE0				;$808DC0
	CMP #$0003				;$808DC2
	BEQ CODE_808DEF				;$808DC5
	LDA $1A					;$808DC7
	LDX $1C					;$808DC9
	EOR #$FFFF				;$808DCB
	INC					;$808DCE
	BRA CODE_808DF8				;$808DCF

CODE_808DD1:
	REP #$30				;$808DD1
	STA temp_1C				;$808DD3
	STZ temp_1A				;$808DD5
	PLA					;$808DD7
	BRA CODE_808DB5				;$808DD8

CODE_808DDA:
	LDX temp_1A				;$808DDA
	LDA temp_1C				;$808DDC
	BRA CODE_808DF8				;$808DDE

CODE_808DE0:
	LDA temp_1A				;$808DE0
	EOR #$FFFF				;$808DE2
	INC					;$808DE5
	TAX					;$808DE6
	LDA temp_1C				;$808DE7
	EOR #$FFFF				;$808DE9
	INC					;$808DEC
	BRA CODE_808DF8				;$808DED

CODE_808DEF:
	LDA temp_1C				;$808DEF
	EOR #$FFFF				;$808DF1
	INC					;$808DF4
	TAX					;$808DF5
	LDA temp_1A				;$808DF6
CODE_808DF8:
	PLB					;$808DF8
	RTL					;$808DF9

CODE_808DFA:
	LDX $0525				;$808DFA
	CPX #$1000				;$808DFD
	BCC CODE_808E03				;$808E00
	RTS					;$808E02

CODE_808E03:
	LDA CPU.port_0_data_1			;$808E03
	CMP $FE8406,x				;$808E06
	BNE CODE_808E16				;$808E0A
	LDA $FE8408,x				;$808E0C
	INC					;$808E10
	STA $FE8408,x				;$808E11
	RTS					;$808E15

CODE_808E16:
	INX					;$808E16
	INX					;$808E17
	INX					;$808E18
	INX					;$808E19
	STA $FE8406,x				;$808E1A
	LDA #$0001				;$808E1E
	STA $FE8408,x				;$808E21
	STX $0525				;$808E25
	RTS					;$808E28

CODE_808E29:
	PHK					;$808E29
	PLB					;$808E2A
	LDA #$1000				;$808E2B
	BIT $05FD				;$808E2E
	BNE CODE_808E3B				;$808E31
	LDA CPU.port_0_data_1			;$808E33
	AND #$D000				;$808E36
	BNE CODE_808E88				;$808E39
CODE_808E3B:
	LDA $0525				;$808E3B
	CMP $052B				;$808E3E
	BPL CODE_808E94				;$808E41
	LDX $052D				;$808E43
	LDA.l demo_scripts_table,x		;$808E46
	STA temp_1E				;$808E4A
	LDA.w #demo_scripts_table>>16		;$808E4C
	STA temp_20				;$808E4F
	LDY $0525				;$808E51
	LDA $0527				;$808E54
	BNE CODE_808E69				;$808E57
	INY					;$808E59
	INY					;$808E5A
	INY					;$808E5B
	INY					;$808E5C
	STY $0525				;$808E5D
	INY					;$808E60
	INY					;$808E61
	LDA [temp_1E],y				;$808E62
	DEY					;$808E64
	DEY					;$808E65
	STA $0527				;$808E66
CODE_808E69:
	DEC $0527				;$808E69
	BPL CODE_808E71				;$808E6C
	STZ $0527				;$808E6E
CODE_808E71:
	LDA [temp_1E],y				;$808E71
	STA temp_1A				;$808E73
	TAX					;$808E75
	EOR player_1_held			;$808E76
	AND temp_1A				;$808E79
	STA player_1_pressed			;$808E7B
	STX player_1_held			;$808E7E
	STA player_2_pressed			;$808E81
	STX player_2_held			;$808E84
	RTS					;$808E87

CODE_808E88:
	LDA #$FFFF				;$808E88
	STA $052F				;$808E8B
	LDA #$0002				;$808E8E
	TSB piracy_string_result		;$808E91
CODE_808E94:
	LDA #$0001				;$808E94
	TSB game_state_flags			;$808E97
	BNE CODE_808EA3				;$808E9A
	LDA #$810F				;$808E9C
	JSL set_fade				;$808E9F
CODE_808EA3:
	RTS					;$808EA3

CODE_808EA4:
	JSR CODE_808EA8				;$808EA4
	RTL					;$808EA7

CODE_808EA8:
	LDX $06CF				;$808EA8
	STX $06AD				;$808EAB
	SEP #$20				;$808EAE
CODE_808EB0:
	TXA					;$808EB0
	STA $06AF,x				;$808EB1
	DEX					;$808EB4
	BPL CODE_808EB0				;$808EB5
	REP #$20				;$808EB7
	RTS					;$808EB9

CODE_808EBA:
	JSR CODE_808EBE				;$808EBA
	RTL					;$808EBD

CODE_808EBE:
	JSL CODE_808C60				;$808EBE
	AND $06CF				;$808EC2
	TAX					;$808EC5
	LDA $06AF,x				;$808EC6
	BIT #$0080				;$808EC9
	BNE CODE_808EBE				;$808ECC
	ORA #$0080				;$808ECE
	STA $06AF,x				;$808ED1
	AND #$007F				;$808ED4
	TAY					;$808ED7
	DEC $06AD				;$808ED8
	BPL CODE_808EE3				;$808EDB
	JSR CODE_808EA8				;$808EDD
	TYA					;$808EE0
	SEC					;$808EE1
	RTS					;$808EE2

CODE_808EE3:
	CLC					;$808EE3
	TYA					;$808EE4
	RTS					;$808EE5

CODE_808EE6:
	LDA #$1000				;$808EE6
	BIT $05FD				;$808EE9
	BEQ CODE_808EF1				;$808EEC
	JMP CODE_8090C3				;$808EEE

CODE_808EF1:
	LDA #$8000				;$808EF1
	TSB game_state_flags			;$808EF4
	STZ current_animal_type			;$808EF7
	LDA #$0001				;$808EF9
	TRB game_state_flags			;$808EFC
	LDA #$0002				;$808EFF
	STA $0525				;$808F02
	STZ $0527				;$808F05
	DEC $052F				;$808F08
	BMI CODE_808F66				;$808F0B
	LDX $052F				;$808F0D
	LDA $06D1,x				;$808F10
	AND #$00FF				;$808F13
	ASL					;$808F16
	TAX					;$808F17
	STX $052D				;$808F18
	LDA.l demo_scripts_table,x		;$808F1B
	STA temp_1E				;$808F1F
	LDA.w #demo_scripts_table>>16		;$808F21
	STA temp_20				;$808F24
	LDY #$0000				;$808F26
	LDA [temp_1E]				;$808F29
	BPL CODE_808F33				;$808F2B
	AND #$7FFF				;$808F2D
	LDY #$0001				;$808F30
CODE_808F33:
	STY current_kong			;$808F33
	STA $052B				;$808F36
	LDY #$0002				;$808F39
	LDA [temp_1E],y				;$808F3C
	BMI CODE_808FA3				;$808F3E
	AND #$00FF				;$808F40
	STA level_number			;$808F43
	LDY #$0003				;$808F45
	LDA [temp_1E],y				;$808F48
	AND #$00FF				;$808F4A
	STA $05B7				;$808F4D
	LDA #$4000				;$808F50
	TSB game_state_flags			;$808F53
	LDA #CODE_808493			;$808F56
	STA $4E					;$808F59
	LDA.w #CODE_808493>>16			;$808F5B
	STA $50					;$808F5E
	LDA #CODE_808344			;$808F60
	JMP set_and_wait_for_nmi_direct		;$808F63

CODE_808F66:
	LDX $052F				;$808F66
	LDA #$0004				;$808F69
	STA $052F				;$808F6C
	STZ $0523				;$808F6F
	LDA #$0000				;$808F72
	STA $00044A				;$808F75
	CPX #$FFFE				;$808F79
	BEQ CODE_808F93				;$808F7C
	LDA #$0003				;$808F7E
	STA $BA					;$808F81
	LDX #CODE_B284D6			;$808F83
	LDY.w #CODE_B284D6>>16			;$808F86
	STX $4E					;$808F89
	STY $50					;$808F8B
	LDA #CODE_808370			;$808F8D
	JMP set_and_wait_for_nmi_direct		;$808F90

CODE_808F93:
	LDA #CODE_809489			;$808F93
	STA $4E					;$808F96
	LDX.w #CODE_809489>>16			;$808F98
	STX $50					;$808F9B
	LDA #CODE_808370			;$808F9D
	JMP set_and_wait_for_nmi_direct		;$808FA0

CODE_808FA3:
	CMP #$FFFF				;$808FA3
	BNE CODE_808FE5				;$808FA6
	LDA #$0002				;$808FA8
	STA map_node_number			;$808FAB
	STZ current_world			;$808FAE
	LDA #$0800				;$808FB1
	STA $0611				;$808FB4
	LDA #$0005				;$808FB7
	TSB $05FB				;$808FBA
	LDA #!vehicle_hovercraft		;$808FBD
	STA current_map_vehicle			;$808FC0
	LDA #$4000				;$808FC3
	TSB game_state_flags			;$808FC6
	LDA #$8002				;$808FC9
	STA $05E3				;$808FCC
	STZ $05ED				;$808FCF
	STZ $05EF				;$808FD2
	LDA #CODE_B48009			;$808FD5
	STA $4E					;$808FD8
	LDA.w #CODE_B48009>>16			;$808FDA
	STA $50					;$808FDD
	LDA #CODE_808344			;$808FDF
	JMP set_and_wait_for_nmi_direct		;$808FE2

CODE_808FE5:
	CMP #$FFFE				;$808FE5
	BNE CODE_80901E				;$808FE8
	LDA #$0003				;$808FEA
	STA map_node_number			;$808FED
	LDA #!world_lake_orangatanga		;$808FF0
	STA current_world			;$808FF3
	LDA #$0001				;$808FF6
	STA $0659				;$808FF9
	STA $0639				;$808FFC
	ORA #$003E				;$808FFF
	STA $0657				;$809002
	STA $065A				;$809005
	LDA #$4000				;$809008
	TSB game_state_flags			;$80900B
	LDA #CODE_B48009			;$80900E
	STA $4E					;$809011
	LDA.w #CODE_B48009>>16			;$809013
	STA $50					;$809016
	LDA #CODE_808344			;$809018
	JMP set_and_wait_for_nmi_direct		;$80901B

CODE_80901E:
	LDA #$040A				;$80901E
	STA $05E3				;$809021
	LDA #$4000				;$809024
	TSB game_state_flags			;$809027
	LDA #$8000				;$80902A
	TSB $061D				;$80902D
	LDA #CODE_B48000			;$809030
	STA $4E					;$809033
	LDA.w #CODE_B48000>>16			;$809035
	STA $50					;$809038
	LDA #CODE_808344			;$80903A
	JMP set_and_wait_for_nmi_direct		;$80903D

CODE_809040:
	LDA #!music_mama_bird_chase		;$809040
	JSL play_song				;$809043
	LDA #$1000				;$809047
	TSB $05FD				;$80904A
	LDA #$8000				;$80904D
	TSB game_state_flags			;$809050
	LDA #$0041				;$809053
	TRB game_state_flags			;$809056
	LDA #$0002				;$809059
	STA $0525				;$80905C
	STZ $0527				;$80905F
	LDX #$0020				;$809062
	STX $052D				;$809065
	LDA.l demo_scripts_table,x		;$809068
	STA temp_1E				;$80906C
	LDA.w #demo_scripts_table>>16		;$80906E
	STA temp_20				;$809071
	LDA [temp_1E]				;$809073
	AND #$7FFF				;$809075
	STA $052B				;$809078
	LDY #$0001				;$80907B
	STY current_kong			;$80907E
	LDA #$0002				;$809081
	STA map_node_number			;$809084
	STZ current_world			;$809087
	LDA #$0800				;$80908A
	STA $0611				;$80908D
	LDA #$0005				;$809090
	TSB $05FB				;$809093
	LDA #!vehicle_hovercraft		;$809096
	STA current_map_vehicle			;$809099
	LDA #$4000				;$80909C
	TRB game_state_flags			;$80909F
	LDA #$8002				;$8090A2
	STA $05E3				;$8090A5
	LDA #$0137				;$8090A8
	STA $05ED				;$8090AB
	LDA #$023D				;$8090AE
	STA $05EF				;$8090B1
	LDA #$0001				;$8090B4
	TSB $0696				;$8090B7
	LDA #CODE_B48009			;$8090BA
	LDX.w #CODE_B48009>>16			;$8090BD
	JMP CODE_8083C3				;$8090C0

CODE_8090C3:
	LDA #$0001				;$8090C3
	TRB game_state_flags			;$8090C6
	LDA #$1000				;$8090C9
	TRB $05FD				;$8090CC
	STZ $0523				;$8090CF
	LDA #!level_krool_hovercraft_ending	;$8090D2
	STA level_number			;$8090D5
	STA parent_level_number			;$8090D7
	STZ $05B7				;$8090DA
	LDA #$0563				;$8090DD
	JSL CODE_B28027				;$8090E0
	LDA #CODE_808348			;$8090E4
	STA $4A					;$8090E7
	STA $4C					;$8090E9
	LDA #CODE_808493			;$8090EB
	LDX.w #CODE_808493>>16			;$8090EE
	JMP CODE_8083C3				;$8090F1

CODE_8090F4:
	STZ active_player			;$8090F4
	LDA $7E2AF9				;$8090F7
	AND #$0003				;$8090FB
	STA current_game_mode			;$8090FE
	CMP #!gamemode_2_player_contest		;$809101
	BEQ CODE_80911E				;$809104
	JSR CODE_8092F2				;$809106
CODE_809109:
	JSR CODE_80912F				;$809109
	STZ active_player			;$80910C
	LDA #$C000				;$80910F
	TRB $053B				;$809112
	LDA $06A1				;$809115
	JSR CODE_8099B3				;$809118
	JMP CODE_8096C2				;$80911B

CODE_80911E:
	JSR CODE_8092F2				;$80911E
	JSR CODE_80939D				;$809121
	JSR CODE_8092F2				;$809124
	JSR CODE_80912F				;$809127
	JSR CODE_80939D				;$80912A
	BRA CODE_809109				;$80912D

CODE_80912F:
	LDX #$0005				;$80912F
	LDA #$0010				;$809132
	BIT active_cheats			;$809135
	BEQ CODE_80913D				;$809138
	LDX #$0032				;$80913A
CODE_80913D:
	STX $05D5				;$80913D
	RTS					;$809140

CODE_809141:
	LDY #$0004				;$809141
	LDA [$84],y				;$809144
	AND #$FFFE				;$809146
	CMP #$0052				;$809149
	BEQ CODE_809158				;$80914C
	CMP #$0152				;$80914E
	BEQ CODE_809158				;$809151
	CMP #$0252				;$809153
	BNE CODE_80916F				;$809156
CODE_809158:
	JSR CODE_809177				;$809158
	LDY #$0000				;$80915B
	LDA [$84],y				;$80915E
	CMP temp_3E				;$809160
	BNE CODE_80916F				;$809162
	LDY #$0002				;$809164
	LDA [$84],y				;$809167
	CMP temp_40				;$809169
	BNE CODE_80916F				;$80916B
	SEC					;$80916D
	RTS					;$80916E

CODE_80916F:
	CLC					;$80916F
	RTS					;$809170

;SRAM addresses
DATA_809171:
	dw $B06062
	dw $B062EC
	dw $B06576

CODE_809177:
	STZ temp_3E				;$809177
	STZ temp_40				;$809179
	LDY #$0006				;$80917B
CODE_80917E:
	LDA [$84],y				;$80917E
	CLC					;$809180
	ADC temp_3E				;$809181
	STA temp_3E				;$809183
	INY					;$809185
	INY					;$809186
	CPY #$028A				;$809187
	BNE CODE_80917E				;$80918A
	LDY #$0006				;$80918C
CODE_80918F:
	LDA [$84],y				;$80918F
	EOR temp_40				;$809191
	STA temp_40				;$809193
	INY					;$809195
	INY					;$809196
	CPY #$028A				;$809197
	BNE CODE_80918F				;$80919A
	LDA temp_3E				;$80919C
	BNE CODE_8091A2				;$80919E
	INC temp_3E				;$8091A0
CODE_8091A2:
	RTS					;$8091A2

CODE_8091A3:
	PHB					;$8091A3
	JSR CODE_8091A9				;$8091A4
	PLB					;$8091A7
	RTL					;$8091A8

CODE_8091A9:
	JSR CODE_80920D				;$8091A9
	JSR CODE_8091CB				;$8091AC
	RTS					;$8091AF

CODE_8091B0:
	LDA current_game_mode			;$8091B0
	CMP #!gamemode_2_player_contest		;$8091B3
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
	LDA $04C8				;$8091CB
	ASL					;$8091CE
	TAX					;$8091CF
	LDA.l DATA_809171,x			;$8091D0
	STA temp_1A				;$8091D4
	LDA #$00B0				;$8091D6
	STA temp_1C				;$8091D9
	%pea_use_dbr($7E807E)			;$8091DB
	PLB					;$8091DE
	LDY #$0288				;$8091DF
CODE_8091E2:
	LDA $2AF4,y				;$8091E2
	STA [temp_1A],y				;$8091E5
	DEY					;$8091E7
	BPL CODE_8091E2				;$8091E8
	PLB					;$8091EA
	RTS					;$8091EB

CODE_8091EC:
	LDA $04C8				;$8091EC
	ASL					;$8091EF
	TAX					;$8091F0
	LDA.l DATA_809171,x			;$8091F1
	STA temp_1A				;$8091F5
	LDA #$00B0				;$8091F7
	STA temp_1C				;$8091FA
	%pea_use_dbr($7E807E)			;$8091FC
	PLB					;$8091FF
	LDY #$0288				;$809200
CODE_809203:
	LDA [temp_1A],y				;$809203
	STA $2AF4,y				;$809205
	DEY					;$809208
	BPL CODE_809203				;$809209
	PLB					;$80920B
	RTS					;$80920C

CODE_80920D:
	LDA #$2AF4				;$80920D
	STA $84					;$809210
	LDA #$007E				;$809212
	STA $86					;$809215
	SEP #$20				;$809217
	LDA current_game_mode			;$809219
	LDY #$0005				;$80921C
	STA [$84],y				;$80921F
	LDA active_player			;$809221
	AND #$01				;$809224
	ORA #$52				;$809226
	LDY #$0004				;$809228
	STA [$84],y				;$80922B
	REP #$20				;$80922D
	LDA current_game_mode			;$80922F
	CMP #!gamemode_2_player_contest		;$809232
	BNE CODE_809241				;$809235
	LDA active_player			;$809237
	BEQ CODE_809241				;$80923A
	LDA #$0148				;$80923C
	BRA CODE_809244				;$80923F

CODE_809241:
	LDA #$0006				;$809241
CODE_809244:
	CLC					;$809244
	ADC $84					;$809245
	STA $D0					;$809247
	LDA #$0000				;$809249
	ADC $86					;$80924C
	STA $D2					;$80924E
	LDA $C2					;$809250
	LDY #$000A				;$809252
	STA [$D0],y				;$809255
	LDA $C4					;$809257
	INY					;$809259
	INY					;$80925A
	STA [$D0],y				;$80925B
	LDY #$0008				;$80925D
	LDX #$0008				;$809260
CODE_809263:
	LDA $05D9,x				;$809263
	STA [$D0],y				;$809266
	DEY					;$809268
	DEX					;$809269
	BPL CODE_809263				;$80926A
	JSR CODE_80B18E				;$80926C
	LDY #$000E				;$80926F
	SEP #$20				;$809272
	STA [$D0],y				;$809274
	REP #$20				;$809276
	LDA game_state_flags			;$809278
	LDY #$000F				;$80927B
	STA [$D0],y				;$80927E
	LDA $05B1				;$809280
	AND #$FFDF				;$809283
	INY					;$809286
	INY					;$809287
	STA [$D0],y				;$809288
	LDA $05C9				;$80928A
	LDY #$0013				;$80928D
	STA [$D0],y				;$809290
	LDA $05CB				;$809292
	INY					;$809295
	INY					;$809296
	STA [$D0],y				;$809297
	LDA $05CD				;$809299
	INY					;$80929C
	INY					;$80929D
	STA [$D0],y				;$80929E
	LDA $05CF				;$8092A0
	INY					;$8092A3
	INY					;$8092A4
	STA [$D0],y				;$8092A5
	LDA $05D1				;$8092A7
	INY					;$8092AA
	INY					;$8092AB
	STA [$D0],y				;$8092AC
	SEP #$20				;$8092AE
	LDY #$00DC				;$8092B0
	LDX #$00BF				;$8092B3
CODE_8092B6:
	LDA $05E3,x				;$8092B6
	STA [$D0],y				;$8092B9
	DEY					;$8092BB
	DEX					;$8092BC
	BPL CODE_8092B6				;$8092BD
	LDA language_select			;$8092BF
	LDY #$00DE				;$8092C2
	STA [$D0],y				;$8092C5
	LDA stereo_select			;$8092C7
	LDY #$00DF				;$8092CA
	STA [$D0],y				;$8092CD
	LDA current_kong			;$8092CF
	LDY #$00DD				;$8092D2
	STA [$D0],y				;$8092D5
	REP #$20				;$8092D7
	JSR CODE_809177				;$8092D9
	LDY #$0000				;$8092DC
	LDA temp_3E				;$8092DF
	STA [$84],y				;$8092E1
	LDY #$0002				;$8092E3
	LDA temp_40				;$8092E6
	STA [$84],y				;$8092E8
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
	CMP #!gamemode_2_player_contest		;$8092FF
	BNE CODE_80930E				;$809302
	LDA active_player			;$809304
	BEQ CODE_80930E				;$809307
	LDA #$0148				;$809309
	BRA CODE_809311				;$80930C

CODE_80930E:
	LDA #$0006				;$80930E
CODE_809311:
	CLC					;$809311
	ADC $84					;$809312
	STA $D0					;$809314
	LDA #$0000				;$809316
	ADC $86					;$809319
	STA $D2					;$80931B
	LDY #$000F				;$80931D
	LDA [$D0],y				;$809320
	STA game_state_flags			;$809322
	LDY #$0011				;$809325
	LDA [$D0],y				;$809328
	STA $05B1				;$80932A
	LDY #$000A				;$80932D
	LDA [$D0],y				;$809330
	STA $C2					;$809332
	INY					;$809334
	INY					;$809335
	LDA [$D0],y				;$809336
	STA $C4					;$809338
	LDY #$0008				;$80933A
	LDX #$0008				;$80933D
CODE_809340:
	LDA [$D0],y				;$809340
	STA $05D9,x				;$809342
	DEY					;$809345
	DEX					;$809346
	BPL CODE_809340				;$809347
	LDY #$0013				;$809349
	LDA [$D0],y				;$80934C
	STA $05C9				;$80934E
	INY					;$809351
	INY					;$809352
	LDA [$D0],y				;$809353
	STA $05CB				;$809355
	INY					;$809358
	INY					;$809359
	LDA [$D0],y				;$80935A
	STA $05CD				;$80935C
	INY					;$80935F
	INY					;$809360
	LDA [$D0],y				;$809361
	STA $05CF				;$809363
	INY					;$809366
	INY					;$809367
	LDA [$D0],y				;$809368
	STA $05D1				;$80936A
	SEP #$20				;$80936D
	LDY #$00DC				;$80936F
	LDX #$00BF				;$809372
CODE_809375:
	LDA [$D0],y				;$809375
	STA $05E3,x				;$809377
	DEY					;$80937A
	DEX					;$80937B
	BPL CODE_809375				;$80937C
	LDY #$00DE				;$80937E
	LDA [$D0],y				;$809381
	STA language_select			;$809383
	LDY #$00DF				;$809386
	LDA [$D0],y				;$809389
	STA stereo_select			;$80938B
	LDY #$00DD				;$80938E
	LDA [$D0],y				;$809391
	STA current_kong			;$809393
	REP #$20				;$809396
	RTS					;$809398

CODE_809399:
	JSR CODE_80939D				;$809399
	RTL					;$80939C

CODE_80939D:
	JSR CODE_8093C7				;$80939D
	LDA active_player			;$8093A0
	EOR #$0001				;$8093A3
	STA active_player			;$8093A6
	JSR CODE_8093FF				;$8093A9
	RTS					;$8093AC

CODE_8093AD:
	JSR CODE_8093C7				;$8093AD
	STZ active_player			;$8093B0
	JSR CODE_8091EC				;$8093B3
	JSR CODE_8092F2				;$8093B6
	RTS					;$8093B9

CODE_8093BA:
	LDA #$0001				;$8093BA
	STA active_player			;$8093BD
	JSR CODE_8091EC				;$8093C0
	JSR CODE_8092F2				;$8093C3
	RTS					;$8093C6

CODE_8093C7:
	LDA #$007E				;$8093C7
	STA $44					;$8093CA
	LDA #$2900				;$8093CC
	LDX active_player			;$8093CF
	BEQ CODE_8093D8				;$8093D2
	CLC					;$8093D4
	ADC #$00FA				;$8093D5
CODE_8093D8:
	STA $42					;$8093D8
	SEP #$20				;$8093DA
	LDX #$0000				;$8093DC
	LDY #$0000				;$8093DF
CODE_8093E2:
	LDA $C0,x				;$8093E2
	STA [$42],y				;$8093E4
	INY					;$8093E6
	INX					;$8093E7
	CPX #$0006				;$8093E8
	BNE CODE_8093E2				;$8093EB
	LDX #$0000				;$8093ED
CODE_8093F0:
	LDA game_state_flags,x			;$8093F0
	STA [$42],y				;$8093F3
	INY					;$8093F5
	INX					;$8093F6
	CPX #$00F4				;$8093F7
	BNE CODE_8093F0				;$8093FA
	REP #$20				;$8093FC
	RTS					;$8093FE

CODE_8093FF:
	LDA #$007E				;$8093FF
	STA $44					;$809402
	LDA #$2900				;$809404
	LDX active_player			;$809407
	BEQ CODE_809410				;$80940A
	CLC					;$80940C
	ADC #$00FA				;$80940D
CODE_809410:
	STA $42					;$809410
	SEP #$20				;$809412
	LDX #$0000				;$809414
	LDY #$0000				;$809417
CODE_80941A:
	LDA [$42],y				;$80941A
	STA $C0,x				;$80941C
	INY					;$80941E
	INX					;$80941F
	CPX #$0006				;$809420
	BNE CODE_80941A				;$809423
	LDX #$0000				;$809425
CODE_809428:
	LDA [$42],y				;$809428
	STA game_state_flags,x			;$80942A
	INY					;$80942D
	INX					;$80942E
	CPX #$00F4				;$80942F
	BNE CODE_809428				;$809432
	REP #$20				;$809434
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
	LDX #$A15A				;$809456
	LDY #$007E				;$809459
	LDA #$0660				;$80945C
	JSL CODE_808CEC				;$80945F
	JSL CODE_BB857F				;$809463
	LDA #$0200				;$809467
	STA DMA[0].source_word			;$80946A
	STA DMA[0].unused_2			;$80946D
	LDA #$0220				;$809470
	STA DMA[0].size				;$809473
	LDA #$0400				;$809476
	STA DMA[0].settings			;$809479
	SEP #$20				;$80947C
	STZ DMA[0].source_bank			;$80947E
	LDA #$01				;$809481
	STA CPU.enable_dma			;$809483
	REP #$20				;$809486
	RTS					;$809488

CODE_809489:
	PHK					;$809489
	PLB					;$80948A
	JSR CODE_809437				;$80948B
	LDA #$0020				;$80948E
	TRB $05B1				;$809491
	BNE CODE_80949D				;$809494
	LDA #!music_crazy_calypso		;$809496
	JSL play_song				;$809499
CODE_80949D:
	SEP #$20				;$80949D
	LDA $B06009				;$80949F
	CMP #$01				;$8094A3
	BEQ CODE_8094A8				;$8094A5
	TDC					;$8094A7
CODE_8094A8:
	STA stereo_select			;$8094A8
	REP #$20				;$8094AB
	JSL CODE_808411				;$8094AD
	LDA #$000F				;$8094B1
	JSL CODE_BB859A				;$8094B4
	ORA #$3000				;$8094B8
	CLC					;$8094BB
	ADC #$01C0				;$8094BC
	STA $B4					;$8094BF
	LDA #$0001				;$8094C1
	STA $06D8				;$8094C4
	LDA #$0021				;$8094C7
	JSL vram_payload_handler_global		;$8094CA
	LDA #$001F				;$8094CE
	JSL set_PPU_registers_global		;$8094D1
	JSR CODE_80A7AA				;$8094D5
	LDA #$002F				;$8094D8
	LDX #$0020				;$8094DB
	LDY #$0000				;$8094DE
	JSL CODE_BB856D				;$8094E1
	JSR CODE_80957A				;$8094E5
	JSR CODE_809E3B				;$8094E8
	LDA $04C8				;$8094EB
	JSR CODE_809DD0				;$8094EE
	LDA #$1C41				;$8094F1
	STA $1C3F				;$8094F4
	LDX #$F000				;$8094F7
	LDY #$007E				;$8094FA
	LDA #$0800				;$8094FD
	JSL CODE_808CEC				;$809500
	LDY #$000C				;$809504
	JSR CODE_809E1A				;$809507
	LDA #$5820				;$80950A
	STA $1CB0				;$80950D
	LDY #$024E				;$809510
	JSL CODE_BB85B5				;$809513
	LDA #$0001				;$809517
	STA $0740				;$80951A
	STA $0742				;$80951D
	LDA #$00C6				;$809520
	JSL CODE_BB859A				;$809523
	ORA #$1000				;$809527
	STA $1C81				;$80952A
	LDA #$00C7				;$80952D
	JSL CODE_BB859A				;$809530
	ORA #$3000				;$809534
	STA $1C8D				;$809537
	PHK					;$80953A
	PLB					;$80953B
	JSR CODE_809F4A				;$80953C
	JSR CODE_80A113				;$80953F
	STZ $0740				;$809542
	STZ $0742				;$809545
	LDA $04C8				;$809548
	STA $1C37				;$80954B
	JSR CODE_809709				;$80954E
	LDA #$0020				;$809551
	JSR CODE_80A3E9				;$809554
	STZ active_player			;$809557
	JSL DMA_queued_sprite_palette_global	;$80955A
	JSL DMA_queued_sprite_palette_global	;$80955E
	JSL DMA_queued_sprite_palette_global	;$809562
	JSL DMA_queued_sprite_palette_global	;$809566
	LDA #$0200				;$80956A
	JSL set_fade				;$80956D
	LDA #CODE_809586			;$809571
	LDX.w #CODE_809586>>16			;$809574
	JMP CODE_8083C3				;$809577

CODE_80957A:
	STZ $1E					;$80957A
	LDA #$FFFF				;$80957C
	STA $20					;$80957F
	JSL CODE_B7802A				;$809581
	RTS					;$809585

CODE_809586:
	LDA pending_dma_hdma_channels		;$809586
	STA CPU.enable_dma_hdma			;$809589
	JSL CODE_B38006				;$80958C
	JSL DMA_queued_sprite_palette_global	;$809590
	LDX #$7C00				;$809594
	STX PPU.vram_address			;$809597
	LDA #$F000				;$80959A
	STA DMA[0].source_word			;$80959D
	STA DMA[0].unused_2			;$8095A0
	LDA #$0700				;$8095A3
	STA DMA[0].size				;$8095A6
	LDA #$1801				;$8095A9
	STA DMA[0].settings			;$8095AC
	SEP #$20				;$8095AF
	LDA #$7E				;$8095B1
	STA DMA[0].source_bank			;$8095B3
	LDA #$01				;$8095B6
	STA CPU.enable_dma			;$8095B8
	REP #$20				;$8095BB
	JSR CODE_809FF8				;$8095BD
	SEP #$20				;$8095C0
	LDA screen_brightness			;$8095C2
	STA PPU.screen				;$8095C5
	REP #$20				;$8095C8
	STZ $1560				;$8095CA
	STZ $155E				;$8095CD
	JSL CODE_808C60				;$8095D0
	LDA $1C35				;$8095D4
	BIT #$4000				;$8095D7
	BNE CODE_8095E0				;$8095DA
	JSL CODE_8089CA				;$8095DC
CODE_8095E0:
	LDA $1C35				;$8095E0
	BIT #$0006				;$8095E3
	BNE CODE_809600				;$8095E6
	LDA player_active_held			;$8095E8
	BEQ CODE_8095EF				;$8095EB
	STZ $F4					;$8095ED
CODE_8095EF:
	LDA $F4					;$8095EF
	CMP #$0E10				;$8095F1
	BCC CODE_809600				;$8095F4
	JSL CODE_B8807E				;$8095F6
	LDA #$0008				;$8095FA
	TSB $1C35				;$8095FD
CODE_809600:
	JSL CODE_B7800C				;$809600
	JSL sprite_handler			;$809604
	LDA $1C3D				;$809608
	BMI CODE_809614				;$80960B
	BEQ CODE_809629				;$80960D
	DEC $1C3D				;$80960F
	BEQ CODE_80961B				;$809612
CODE_809614:
	LDA active_frame_counter		;$809614
	BIT #$0008				;$809616
	BNE CODE_809623				;$809619
CODE_80961B:
	LDA $1C37				;$80961B
	JSR CODE_809DE3				;$80961E
	BRA CODE_809629				;$809621

CODE_809623:
	LDA $1C37				;$809623
	JSR CODE_809DB7				;$809626
CODE_809629:
	JSL CODE_B6804B				;$809629
	JSL CODE_B7800F				;$80962D
	JSR CODE_80A08F				;$809631
	LDA #$0080				;$809634
	BIT $1C35				;$809637
	BEQ CODE_809647				;$80963A
	LDA $1C91				;$80963C
	CMP #$0005				;$80963F
	BCS CODE_809647				;$809642
	JSR CODE_80A608				;$809644
CODE_809647:
	LDA #$1000				;$809647
	BIT $1C35				;$80964A
	BNE CODE_809652				;$80964D
	JSR CODE_80A465				;$80964F
CODE_809652:
	JSL CODE_80898C				;$809652
	JSR CODE_809741				;$809656
	BEQ CODE_80966E				;$809659
	LDA $1C87				;$80965B
	BEQ CODE_80966B				;$80965E
	DEC $1C87				;$809660
	BNE CODE_80966B				;$809663
	LDA #$4000				;$809665
	TRB $1C35				;$809668
CODE_80966B:
	JMP CODE_808384				;$80966B

CODE_80966E:
	LDA #$0001				;$80966E
	TRB game_state_flags			;$809671
	LDA #$0001				;$809674
	TRB $1C35				;$809677
	BNE CODE_80969A				;$80967A
	LDA #$0008				;$80967C
	TRB $1C35				;$80967F
	BNE CODE_8096AE				;$809682
	LDA #$0020				;$809684
	TRB $1C35				;$809687
	BNE CODE_8096D2				;$80968A
	LDA #$2000				;$80968C
	BIT $1C35				;$80968F
	BNE CODE_8096BF				;$809692
	JSR CODE_8091EC				;$809694
	JMP CODE_8090F4				;$809697

CODE_80969A:
	LDA #$0002				;$80969A
	TRB piracy_string_result		;$80969D
	LDA #$0001				;$8096A0
	STA $BA					;$8096A3
	LDA #CODE_80B593			;$8096A5
	LDX.w #CODE_80B593>>16			;$8096A8
	JMP CODE_8083C3				;$8096AB

CODE_8096AE:
	STZ $BA					;$8096AE
	LDA #$0002				;$8096B0
	TRB piracy_string_result		;$8096B3
	LDA #CODE_B284D6			;$8096B6
	LDX.w #CODE_B284D6>>16			;$8096B9
	JMP CODE_8083C3				;$8096BC

CODE_8096BF:
	JSR CODE_8091B0				;$8096BF
CODE_8096C2:
	LDA #CODE_B48009			;$8096C2
	STA $4E					;$8096C5
	LDX.w #CODE_B48009>>16			;$8096C7
	STX $50					;$8096CA
	LDA #CODE_808362			;$8096CC
	JMP set_and_wait_for_nmi_direct		;$8096CF

CODE_8096D2:
	LDA $1C37				;$8096D2
	STA $04C8				;$8096D5
	JSR CODE_8091EC				;$8096D8
	STZ active_player			;$8096DB
	LDA $7E2AF9				;$8096DE
	AND #$0003				;$8096E2
	STA current_game_mode			;$8096E5
	JSR CODE_8092F2				;$8096E8
	JSR CODE_80939D				;$8096EB
	JSR CODE_8092F2				;$8096EE
	JSR CODE_80939D				;$8096F1
	LDA #CODE_80AE3E			;$8096F4
	LDX.w #CODE_80AE3E>>16			;$8096F7
	JMP CODE_8083C3				;$8096FA

CODE_8096FD:
	LDA #$0003				;$8096FD
CODE_809700:
	JSR CODE_809DB7				;$809700
	LDY #$000C				;$809703
	JSR CODE_809E0F				;$809706
CODE_809709:
	LDA $1CB0				;$809709
	AND #$0FFF				;$80970C
	ORA #$5000				;$80970F
	STA $1CB0				;$809712
	JSR CODE_809F92				;$809715
	LDA #$0003				;$809718
	STA $1C39				;$80971B
	LDA #$0000				;$80971E
	STA $1C3B				;$809721
	STZ $1C3D				;$809724
	LDA #$FFFF				;$809727
	STA $1C89				;$80972A
	LDA $1C37				;$80972D
	RTS					;$809730

CODE_809731:
	LDA $1C37				;$809731
CODE_809734:
	ASL					;$809734
	TAY					;$809735
	LDA DATA_809171,y			;$809736
	STA $84					;$809739
	LDA #$00B0				;$80973B
	STA $86					;$80973E
	RTS					;$809740

CODE_809741:
	JSL handle_fading_direct		;$809741
	LDA screen_brightness			;$809745
	BNE CODE_80974D				;$809748
	CMP screen_fade_speed			;$80974A
CODE_80974D:
	RTS					;$80974D

file_select_menu_main:
	LDA #$0004				;$80974E
	TSB $1C35				;$809751
	LDA #$4000				;$809754
	BIT $1C35				;$809757
	BNE .skip_state				;$80975A
	JSR (.state_table,x)			;$80975C
.skip_state:
	JML [$04F5]				;$80975F

.state_table:
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
	LDA #$000A				;$809782
	STA $1C3B				;$809785
	STZ $1C37				;$809788
	LDA #$0002				;$80978B
	STA $1C39				;$80978E
	LDA #$FFFF				;$809791
	STA $1C3D				;$809794
	TYX					;$809797
	STZ sprite.state,x			;$809798
	LDA #$0666				;$80979A
	JSL queue_sound_effect			;$80979D
	LDA #$C000				;$8097A1
	EOR $1CB0				;$8097A4
	STA $1CB0				;$8097A7
	LDA #$1000				;$8097AA
	STA $38					;$8097AD
	JSR CODE_809FA3				;$8097AF
	LDY #$001A				;$8097B2
	JSR CODE_809E0F				;$8097B5
	RTS					;$8097B8

CODE_8097B9:
	TYX					;$8097B9
	STZ sprite.state,x			;$8097BA
	JSR CODE_809731				;$8097BC
	LDY #$0000				;$8097BF
	LDA [$84],y				;$8097C2
	BEQ CODE_8097E0				;$8097C4
	LDA $1C37				;$8097C6
	STA $1C89				;$8097C9
	LDA #$000D				;$8097CC
	STA $1C3B				;$8097CF
	LDA #$0666				;$8097D2
	JSL queue_sound_effect			;$8097D5
	LDY #$001C				;$8097D9
	JSR CODE_809E0F				;$8097DC
	RTS					;$8097DF

CODE_8097E0:
	JMP CODE_80A3D8				;$8097E0

CODE_8097E3:
	TYX					;$8097E3
	STZ sprite.state,x			;$8097E4
	JSR CODE_809731				;$8097E6
	LDY #$0000				;$8097E9
	LDA [$84],y				;$8097EC
	BNE CODE_809801				;$8097EE
	JSR CODE_80A3F4				;$8097F0
	JSR CODE_8096FD				;$8097F3
	JSR CODE_809DD0				;$8097F6
	LDA #$0666				;$8097F9
	JSL CODE_B28018				;$8097FC
	RTS					;$809800

CODE_809801:
	JMP CODE_80A3D8				;$809801

CODE_809804:
	LDA #$0007				;$809804
	STA $1C3B				;$809807
	STZ $1C37				;$80980A
	LDA #$0002				;$80980D
	STA $1C39				;$809810
	LDA #$FFFF				;$809813
	STA $1C3D				;$809816
	TYX					;$809819
	STZ sprite.state,x			;$80981A
	LDA #$3000				;$80981C
	EOR $1CB0				;$80981F
	STA $1CB0				;$809822
	LDA #$1000				;$809825
	STA $38					;$809828
	JSR CODE_809FBF				;$80982A
	LDA #$0666				;$80982D
	JSL queue_sound_effect			;$809830
	LDY #$0018				;$809834
	JSR CODE_809E0F				;$809837
	RTS					;$80983A

CODE_80983B:
	TYX					;$80983B
	STZ sprite.state,x			;$80983C
	JSR CODE_80A3C3				;$80983E
	BCC CODE_809856				;$809841
	JSR CODE_8096FD				;$809843
	JSR CODE_809DD0				;$809846
	JSR CODE_809731				;$809849
	JSR CODE_80A1AA				;$80984C
	LDA #$0666				;$80984F
	JSL CODE_B28018				;$809852
CODE_809856:
	RTS					;$809856

CODE_809857:
	LDA $1C37				;$809857
	STA $04C8				;$80985A
	TYX					;$80985D
	JSR CODE_809731				;$80985E
	LDY #$0000				;$809861
	LDA [$84],y				;$809864
	BEQ CODE_809875				;$809866
	LDA #$4200				;$809868
	TSB $1C35				;$80986B
	LDA $1C37				;$80986E
	JSR CODE_809DB7				;$809871
	RTS					;$809874

CODE_809875:
	LDA #$0666				;$809875
	JSL queue_sound_effect			;$809878
	INC sprite.state,x			;$80987C
	LDY #$0016				;$80987E
	JSR CODE_809E0F				;$809881
CODE_809884:
	LDA #$1000				;$809884
	TSB $1C35				;$809887
	BNE CODE_8098F2				;$80988A
	LDY #$0252				;$80988C
	JSL CODE_BB85B8				;$80988F
	STZ $1C3B				;$809893
	LDA #$00CA				;$809896
	JSL CODE_BB859A				;$809899
	STA $1CA8				;$80989D
	LDA #$00CB				;$8098A0
	JSL CODE_BB859A				;$8098A3
	STA $1CAC				;$8098A7
	LDA #$001E				;$8098AA
	STA $1C3D				;$8098AD
	LDA #$0002				;$8098B0
	STA $1C83				;$8098B3
CODE_8098B6:
	LDY #$024C				;$8098B6
	JSL CODE_BB8585				;$8098B9
	LDX alternate_sprite			;$8098BD
	LDA sprite.oam_property,x		;$8098BF
	AND #$0E00				;$8098C1
	STA $1CAA				;$8098C4
	LDA sprite.display_mode,x		;$8098C7
	AND #$0E00				;$8098C9
	STA $1CA6				;$8098CC
	LDA $1C37				;$8098CF
	ASL					;$8098D2
	TAY					;$8098D3
	LDA DATA_80C322,y			;$8098D4
	STA sprite.y_position,x			;$8098D7
	LDA $1C83				;$8098D9
	STA sprite.general_purpose_5C,x		;$8098DC
	STA sprite.general_purpose_6A,x		;$8098DE
	LDA #$0120				;$8098E0
	STA sprite.x_position,x			;$8098E3
	LDA #$0002				;$8098E5
	STA sprite.state,x			;$8098E8
	DEC $1C83				;$8098EA
	BPL CODE_8098B6				;$8098ED
	JSR CODE_80A2DE				;$8098EF
CODE_8098F2:
	LDA #$4000				;$8098F2
	BIT $1C35				;$8098F5
	BNE CODE_809946				;$8098F8
	LDA player_1_pressed			;$8098FA
	BIT #$0200				;$8098FD
	BEQ CODE_809912				;$809900
	LDA $1C8F				;$809902
	DEC					;$809905
	BPL CODE_80990B				;$809906
	LDA #$0002				;$809908
CODE_80990B:
	STA $1C8F				;$80990B
	STA $1C3B				;$80990E
	RTS					;$809911

CODE_809912:
	BIT #$0100				;$809912
	BEQ CODE_80992A				;$809915
	LDA $1C8F				;$809917
	INC					;$80991A
	CMP #$0003				;$80991B
	BCC CODE_809923				;$80991E
	LDA #$0000				;$809920
CODE_809923:
	STA $1C8F				;$809923
	STA $1C3B				;$809926
	RTS					;$809929

CODE_80992A:
	BIT #$9080				;$80992A
	BEQ CODE_809946				;$80992D
	LDX current_sprite			;$80992F
	INC sprite.state,x			;$809931
	LDA #$0080				;$809933
	TSB $1C35				;$809936
	LDY #$0250				;$809939
	JSL CODE_BB85B5				;$80993C
	LDA $1C8F				;$809940
	STA current_game_mode			;$809943
CODE_809946:
	RTS					;$809946

CODE_809947:
	LDA #$0040				;$809947
	TRB $1C35				;$80994A
	BEQ CODE_809952				;$80994D
	TYX					;$80994F
	INC sprite.state,x			;$809950
CODE_809952:
	RTS					;$809952

CODE_809953:
	LDA #$0040				;$809953
	TRB $1C35				;$809956
	BEQ CODE_80996D				;$809959
	TYX					;$80995B
	INC sprite.state,x			;$80995C
	LDA $1C9B				;$80995E
	AND #$00FF				;$809961
	ORA #$A000				;$809964
	STA $1C9B				;$809967
	JSR CODE_80A2A5				;$80996A
CODE_80996D:
	RTS					;$80996D

CODE_80996E:
	TYX					;$80996E
	STZ sprite.state,x			;$80996F
	JSR CODE_8099C5				;$809971
	BCC CODE_809985				;$809974
	BEQ CODE_8099A8				;$809976
	CMP #$FFFF				;$809978
	BEQ CODE_8099A3				;$80997B
	CMP #$FFFE				;$80997D
	BEQ CODE_80999B				;$809980
	JSR CODE_8099B3				;$809982
CODE_809985:
	JSR CODE_8096FD				;$809985
	JSR CODE_809DD0				;$809988
	JSR CODE_809731				;$80998B
	JSR CODE_80A188				;$80998E
	JSR CODE_80A1AA				;$809991
	LDA #$0002				;$809994
	TRB $1C35				;$809997
	RTS					;$80999A

CODE_80999B:
	LDA #$C000				;$80999B
	TRB active_cheats			;$80999E
	BRA CODE_809985				;$8099A1

CODE_8099A3:
	JSR CODE_80BBF5				;$8099A3
	BRA CODE_809985				;$8099A6

CODE_8099A8:
	JSL CODE_B8807E				;$8099A8
	LDA #$4001				;$8099AC
	TSB $1C35				;$8099AF
	RTS					;$8099B2

CODE_8099B3:
	STA temp_1A				;$8099B3
	LDA #$FF00				;$8099B5
	BIT temp_1A				;$8099B8
	BEQ CODE_8099BF				;$8099BA
	TRB active_cheats			;$8099BC
CODE_8099BF:
	LDA temp_1A				;$8099BF
	TSB active_cheats			;$8099C1
	RTS					;$8099C4

CODE_8099C5:
	LDX #$0000				;$8099C5
	LDY #$0000				;$8099C8
	STZ temp_1A				;$8099CB
	STZ temp_1C				;$8099CD
CODE_8099CF:
	LDA $1C97,x				;$8099CF
	CMP file_select_cheats,y		;$8099D2
	BNE CODE_8099EA				;$8099D5
	INY					;$8099D7
	INX					;$8099D8
	CPX #$0004				;$8099D9
	BCC CODE_8099CF				;$8099DC
	LDA #$0705				;$8099DE
	JSL queue_sound_effect			;$8099E1
	LDA file_select_cheats+$01,y		;$8099E5
	SEC					;$8099E8
	RTS					;$8099E9

CODE_8099EA:
	LDA temp_1A				;$8099EA
	CLC					;$8099EC
	ADC #$0007				;$8099ED
	STA temp_1A				;$8099F0
	TAY					;$8099F2
	INC temp_1C				;$8099F3
	LDX #$0000				;$8099F5
	LDA file_select_cheats,y		;$8099F8
	BNE CODE_8099CF				;$8099FB
	JSR CODE_80A3D8				;$8099FD
	CLC					;$809A00
	RTS					;$809A01

file_select_cheats:
	db "MUSIC", $00, $00
	db "WATER", $04, $00
	db "LIVES", $10, $00
	db "COLOR", $40, $00
	db "HARDR", $FE, $FF
	db "MERRY", $01, $00
	db "ASAVE", $02, $00
	db "TUFST", $80, $80
	db "ERASE", $FF, $FF
	dw $0000

CODE_809A43:
	LDX $1CCE				;$809A43
	LDA player_1_pressed			;$809A46
	BEQ CODE_809A5D				;$809A49
	EOR.l cheat_mode_inputs,x		;$809A4B
	BNE CODE_809A5E				;$809A4F
	INC $1CCE				;$809A51
	INC $1CCE				;$809A54
	LDA.l cheat_mode_inputs+$02,x		;$809A57
	BEQ CODE_809A62				;$809A5B
CODE_809A5D:
	RTS					;$809A5D

CODE_809A5E:
	STZ $1CCE				;$809A5E
	RTS					;$809A61

CODE_809A62:
	STZ $1CCE				;$809A62
	LDX current_sprite			;$809A65
	LDA #$000E				;$809A67
	STA sprite.state,x			;$809A6A
	LDA #$0080				;$809A6C
	TSB $1C35				;$809A6F
	LDY #$0250				;$809A72
	JSL CODE_BB85B5				;$809A75
	LDA #$2400				;$809A79
	STA temp_38				;$809A7C
	LDY #$000E				;$809A7E
	JSR CODE_809E0F				;$809A81
	LDA #$0002				;$809A84
	TSB $1C35				;$809A87
	JSR CODE_809731				;$809A8A
	LDY #$0000				;$809A8D
	LDA [$84],y				;$809A90
	BNE CODE_809A9B				;$809A92
	STZ current_game_mode			;$809A94
	JSR CODE_80A257				;$809A97
	RTS					;$809A9A

CODE_809A9B:
	LDY #$0005				;$809A9B
	LDA [$84],y				;$809A9E
	AND #$00FF				;$809AA0
	STA current_game_mode			;$809AA3
	RTS					;$809AA6

cheat_mode_inputs:
	dw !input_L
	dw !input_R
	dw !input_R
	dw !input_L
	dw !input_R
	dw !input_R
	dw !input_L
	dw !input_R
	dw !input_L
	dw !input_R
	dw $0000

CODE_809ABD:
	LDA #$6200				;$809ABD
	TSB $1C35				;$809AC0
	LDA #$0000				;$809AC3
	STA active_player			;$809AC6
	INC					;$809AC9
	STA $05B3				;$809ACA
	RTS					;$809ACD

CODE_809ACE:
	LDA #$00D7				;$809ACE
	STA temp_1A				;$809AD1
	LDA $1C83				;$809AD3
	BNE CODE_809AE5				;$809AD6
	LDA #$0666				;$809AD8
	JSL queue_sound_effect			;$809ADB
	LDA #$0008				;$809ADF
	STA $1C83				;$809AE2
CODE_809AE5:
	LDA $1CB0				;$809AE5
	AND #$0FC0				;$809AE8
	STA temp_1C				;$809AEB
	LDA $1CB0				;$809AED
	AND #$003F				;$809AF0
	STA $1CB0				;$809AF3
	LDX #$1C41				;$809AF6
	JSR CODE_809C77				;$809AF9
	JSR CODE_809C77				;$809AFC
	JSR CODE_809C77				;$809AFF
	JSR CODE_809C77				;$809B02
	LSR temp_1C				;$809B05
	LDA temp_1C				;$809B07
	BIT #$0020				;$809B09
	BEQ CODE_809B13				;$809B0C
	LDA #$0800				;$809B0E
	STA temp_1C				;$809B11
CODE_809B13:
	LDA temp_1C				;$809B13
	TSB $1CB0				;$809B15
	DEC $1C83				;$809B18
	BNE CODE_809B37				;$809B1B
	LDA #$0006				;$809B1D
	JSR CODE_80A3E9				;$809B20
	TYX					;$809B23
	STZ sprite.state,x			;$809B24
	LDA stereo_select			;$809B26
	EOR #$0001				;$809B29
	STA stereo_select			;$809B2C
	SEP #$20				;$809B2F
	STA $B06009				;$809B31
	REP #$20				;$809B35
CODE_809B37:
	RTS					;$809B37

CODE_809B38:
	LDA #$00D7				;$809B38
	STA temp_1A				;$809B3B
	LDA $1C83				;$809B3D
	BNE CODE_809B4F				;$809B40
	LDA #$0666				;$809B42
	JSL queue_sound_effect			;$809B45
	LDA #$0008				;$809B49
	STA $1C83				;$809B4C
CODE_809B4F:
	LDA $1CB0				;$809B4F
	AND #$0FC0				;$809B52
	STA temp_1C				;$809B55
	LDA $1CB0				;$809B57
	AND #$003F				;$809B5A
	STA $1CB0				;$809B5D
	LDX #$1C41				;$809B60
	JSR CODE_809C8B				;$809B63
	JSR CODE_809C8B				;$809B66
	JSR CODE_809C8B				;$809B69
	JSR CODE_809C8B				;$809B6C
	ASL temp_1C				;$809B6F
	LDA temp_1C				;$809B71
	BIT #$1000				;$809B73
	BEQ CODE_809B7D				;$809B76
	LDA #$0040				;$809B78
	STA temp_1C				;$809B7B
CODE_809B7D:
	LDA temp_1C				;$809B7D
	TSB $1CB0				;$809B7F
	DEC $1C83				;$809B82
	BNE CODE_809BA1				;$809B85
	LDA #$0006				;$809B87
	JSR CODE_80A3E9				;$809B8A
	TYX					;$809B8D
	STZ sprite.state,x			;$809B8E
	LDA stereo_select			;$809B90
	EOR #$0001				;$809B93
	STA stereo_select			;$809B96
	SEP #$20				;$809B99
	STA $B06009				;$809B9B
	REP #$20				;$809B9F
CODE_809BA1:
	RTS					;$809BA1

CODE_809BA2:
	LDA #$00D7				;$809BA2
	STA temp_1A				;$809BA5
	LDA $1C83				;$809BA7
	BNE CODE_809BB9				;$809BAA
	LDA #$0666				;$809BAC
	JSL queue_sound_effect			;$809BAF
	LDA #$0008				;$809BB3
	STA $1C83				;$809BB6
CODE_809BB9:
	LDA $1CB0				;$809BB9
	AND #$003F				;$809BBC
	STA temp_1C				;$809BBF
	LDA $1CB0				;$809BC1
	AND #$0FC0				;$809BC4
	STA $1CB0				;$809BC7
	LDX #$1C51				;$809BCA
	JSR CODE_809C77				;$809BCD
	JSR CODE_809C77				;$809BD0
	JSR CODE_809C77				;$809BD3
	JSR CODE_809C77				;$809BD6
	LSR temp_1C				;$809BD9
	BCC CODE_809BE2				;$809BDB
	LDA #$0020				;$809BDD
	STA temp_1C				;$809BE0
CODE_809BE2:
	LDA temp_1C				;$809BE2
	TSB $1CB0				;$809BE4
	DEC $1C83				;$809BE7
	BNE CODE_809C09				;$809BEA
	LDA #$0006				;$809BEC
	JSR CODE_80A3E9				;$809BEF
	TYX					;$809BF2
	STZ sprite.state,x			;$809BF3
	LDA language_select			;$809BF5
	EOR #$0001				;$809BF8
	STA language_select			;$809BFB
	SEP #$20				;$809BFE
	STA $B06008				;$809C00
	REP #$20				;$809C04
	JSR CODE_809E09				;$809C06
CODE_809C09:
	RTS					;$809C09

CODE_809C0A:
	LDA #$00D7				;$809C0A
	STA temp_1A				;$809C0D
	LDA $1C83				;$809C0F
	BNE CODE_809C21				;$809C12
	LDA #$0666				;$809C14
	JSL queue_sound_effect			;$809C17
	LDA #$0008				;$809C1B
	STA $1C83				;$809C1E
CODE_809C21:
	LDA $1CB0				;$809C21
	AND #$003F				;$809C24
	STA temp_1C				;$809C27
	LDA $1CB0				;$809C29
	AND #$0FC0				;$809C2C
	STA $1CB0				;$809C2F
	LDX #$1C51				;$809C32
	JSR CODE_809C8B				;$809C35
	JSR CODE_809C8B				;$809C38
	JSR CODE_809C8B				;$809C3B
	JSR CODE_809C8B				;$809C3E
	ASL temp_1C				;$809C41
	LDA temp_1C				;$809C43
	BIT #$0040				;$809C45
	BEQ CODE_809C4F				;$809C48
	LDA #$0001				;$809C4A
	STA temp_1C				;$809C4D
CODE_809C4F:
	LDA temp_1C				;$809C4F
	TSB $1CB0				;$809C51
	DEC $1C83				;$809C54
	BNE CODE_809C76				;$809C57
	LDA #$0006				;$809C59
	JSR CODE_80A3E9				;$809C5C
	TYX					;$809C5F
	STZ sprite.state,x			;$809C60
	LDA language_select			;$809C62
	EOR #$0001				;$809C65
	STA language_select			;$809C68
	SEP #$20				;$809C6B
	STA $B06008				;$809C6D
	REP #$20				;$809C71
	JSR CODE_809E09				;$809C73
CODE_809C76:
	RTS					;$809C76

CODE_809C77:
	SEP #$20				;$809C77
	LDA $01,x				;$809C79
	DEC					;$809C7B
	CMP #$B8				;$809C7C
	BCS CODE_809C82				;$809C7E
	LDA temp_1A				;$809C80
CODE_809C82:
	STA $01,x				;$809C82
	INX					;$809C84
	INX					;$809C85
	INX					;$809C86
	INX					;$809C87
	REP #$20				;$809C88
	RTS					;$809C8A

CODE_809C8B:
	SEP #$20				;$809C8B
	LDA $01,x				;$809C8D
	INC					;$809C8F
	CMP temp_1A				;$809C90
	BCC CODE_809C96				;$809C92
	LDA #$B7				;$809C94
CODE_809C96:
	STA $01,x				;$809C96
	INX					;$809C98
	INX					;$809C99
	INX					;$809C9A
	INX					;$809C9B
	REP #$20				;$809C9C
	RTS					;$809C9E

CODE_809C9F:
	TYX					;$809C9F
	LDA $1C3B				;$809CA0
	BNE CODE_809CB0				;$809CA3
	LDA $1C37				;$809CA5
	CMP #$0003				;$809CA8
	BCS CODE_809CB0				;$809CAB
	JSR CODE_809A43				;$809CAD
CODE_809CB0:
	LDA #$0004				;$809CB0
	TRB $1C35				;$809CB3
	LDA player_active_pressed		;$809CB6
	BIT #!input_up				;$809CB9
	BEQ CODE_809CE9				;$809CBC
	LDA $1C37				;$809CBE
	BEQ CODE_809CE4				;$809CC1
	CMP #$0005				;$809CC3
	BPL CODE_809CE5				;$809CC6
	JSR CODE_809DB7				;$809CC8
	LDA $1C37				;$809CCB
	DEC					;$809CCE
	CMP #$0003				;$809CCF
	BCC CODE_809CD7				;$809CD2
	LDA #$0002				;$809CD4
CODE_809CD7:
	STA $1C37				;$809CD7
	JSR CODE_809DD0				;$809CDA
	LDA #$0565				;$809CDD
	JSL queue_sound_effect			;$809CE0
CODE_809CE4:
	RTS					;$809CE4

CODE_809CE5:
	STA.w sprite.state,y			;$809CE5
	RTS					;$809CE8

CODE_809CE9:
	BIT #!input_down			;$809CE9
	BEQ CODE_809D37				;$809CEC
	LDA $1C37				;$809CEE
	CMP #$0005				;$809CF1
	BPL CODE_809D18				;$809CF4
	CMP $1C39				;$809CF6
	BCS CODE_809D20				;$809CF9
	JSR CODE_809DB7				;$809CFB
	INC $1C37				;$809CFE
	LDA $1C37				;$809D01
	CMP #$0003				;$809D04
	BEQ CODE_809D14				;$809D07
	JSR CODE_809DD0				;$809D09
	LDA #$0565				;$809D0C
	JSL queue_sound_effect			;$809D0F
	RTS					;$809D13

CODE_809D14:
	JSR CODE_809DEE				;$809D14
	RTS					;$809D17

CODE_809D18:
	CLC					;$809D18
	ADC #$0007				;$809D19
	STA.w sprite.state,y			;$809D1C
	RTS					;$809D1F

CODE_809D20:
	LDA $1C3B				;$809D20
	BEQ CODE_809D36				;$809D23
	STZ sprite.state,x			;$809D25
	LDA #$0002				;$809D27
	JSR CODE_809700				;$809D2A
	LDA #$0003				;$809D2D
	STA $1C37				;$809D30
	JSR CODE_809DEE				;$809D33
CODE_809D36:
	RTS					;$809D36

CODE_809D37:
	BIT #$B080				;$809D37 start/select/b/a
	BEQ CODE_809D53				;$809D3A
	LDA $1C37				;$809D3C
	CMP #$0005				;$809D3F
	BPL CODE_809D53				;$809D42
	CLC					;$809D44
	ADC $1C3B				;$809D45
	TAX					;$809D48
	LDA DATA_809DA7,x			;$809D49
	AND #$00FF				;$809D4C
	STA.w sprite.state,y			;$809D4F
	RTS					;$809D52

CODE_809D53:
	LDX $1C37				;$809D53
	CPX #$0003				;$809D56
	BCC CODE_809D83				;$809D59
	BIT #$0100				;$809D5B
	BEQ CODE_809D6F				;$809D5E
	CPX #$0006				;$809D60
	BCS CODE_809D82				;$809D63
	INC $1C37				;$809D65
	LDA $1C37				;$809D68
	JSR CODE_809DEE				;$809D6B
	RTS					;$809D6E

CODE_809D6F:
	BIT #$0200				;$809D6F
	BEQ CODE_809D82				;$809D72
	CPX #$0004				;$809D74
	BCC CODE_809D82				;$809D77
	DEC $1C37				;$809D79
	LDA $1C37				;$809D7C
	JSR CODE_809DEE				;$809D7F
CODE_809D82:
	RTS					;$809D82

CODE_809D83:
	LDX $1C3B				;$809D83
	BNE CODE_809D82				;$809D86
	BIT #$0200				;$809D88
	BNE CODE_809D8E				;$809D8B
	RTS					;$809D8D

CODE_809D8E:
	JSR CODE_809731				;$809D8E
	LDY #$0000				;$809D91
	LDA [$84],y				;$809D94
	BNE CODE_809D99				;$809D96
	RTS					;$809D98

CODE_809D99:
	LDA #$4020				;$809D99
	TSB $1C35				;$809D9C
	LDA #$820F				;$809D9F
	JSL set_fade				;$809DA2
	RTS					;$809DA6

DATA_809DA7:
	db $01,$01,$01,$07,$0A,$05,$06,$0B
	db $0B,$0B,$08,$08,$08,$09,$09,$09

CODE_809DB7:
	INC					;$809DB7
	ASL					;$809DB8
	TAX					;$809DB9
	LDA #$D530				;$809DBA
	CPX #$0008				;$809DBD
	BCC CODE_809DCB				;$809DC0
	STZ PPU.window_1			;$809DC2
	LDX #$000A				;$809DC5
	LDA #$9508				;$809DC8
CODE_809DCB:
	STA $7EA15A,x				;$809DCB
	RTS					;$809DCF

CODE_809DD0:
	INC					;$809DD0
	ASL					;$809DD1
	TAX					;$809DD2
	LDA #$0030				;$809DD3
	CPX #$0008				;$809DD6
	BCC CODE_809DDE				;$809DD9
	LDX #$000A				;$809DDB
CODE_809DDE:
	STA $7EA15A,x				;$809DDE
	RTS					;$809DE2

CODE_809DE3:
	INC					;$809DE3
	ASL					;$809DE4
	TAX					;$809DE5
	LDA #$0030				;$809DE6
	STA $7EA15A,x				;$809DE9
	RTS					;$809DED

CODE_809DEE:
	SEC					;$809DEE
	SBC #$0003				;$809DEF
	TAX					;$809DF2
	LDA DATA_80C33E,x			;$809DF3
	SEP #$20				;$809DF6
	STA PPU.window_1_left			;$809DF8
	XBA					;$809DFB
	STA PPU.window_1_right			;$809DFC
	REP #$20				;$809DFF
	LDA #$0565				;$809E01
	JSL queue_sound_effect			;$809E04
	RTS					;$809E08

CODE_809E09:
	JSR CODE_80957A				;$809E09
	LDY #$000C				;$809E0C
CODE_809E0F:
	LDA #$0010				;$809E0F
	JSR CODE_80A3E9				;$809E12
	LDX $1D93				;$809E15
	INC sprite.general_purpose_60,x		;$809E18
CODE_809E1A:
	PHY					;$809E1A
	LDY #$0208				;$809E1B
	JSL CODE_BB8588				;$809E1E
	LDX alternate_sprite			;$809E22
	LDA #$FFFF				;$809E24
	STA sprite.general_purpose_5E,x		;$809E27
	LDA #$00F0				;$809E29
	STA sprite.y_position,x			;$809E2C
	LDA #$0008				;$809E2E
	STA sprite.general_purpose_60,x		;$809E31
	PLX					;$809E33
	LDY #$FFDF				;$809E34
	JSR CODE_809F29				;$809E37
	RTS					;$809E3A

CODE_809E3B:
	SEP #$20				;$809E3B
	LDX #$3100				;$809E3D
	STX HDMA[$01].settings			;$809E40
	LDX #$A15A				;$809E43
	STX HDMA[$01].source_word		;$809E46
	LDA #$7E				;$809E49
	STA HDMA[$01].source_bank		;$809E4B
	STA HDMA[$01].indirect_source_bank	;$809E4E
	LDX #$3000				;$809E51
	STX HDMA[$02].settings			;$809E54
	LDX #$A17A				;$809E57
	STX HDMA[$02].source_word		;$809E5A
	LDA #$7E				;$809E5D
	STA HDMA[$02].source_bank		;$809E5F
	STA HDMA[$02].indirect_source_bank	;$809E62
	LDX #$0D03				;$809E65
	STX HDMA[$03].settings			;$809E68
	LDX #$A18A				;$809E6B
	STX HDMA[$03].source_word		;$809E6E
	LDA #$7E				;$809E71
	STA HDMA[$03].source_bank		;$809E73
	STA HDMA[$03].indirect_source_bank	;$809E76
	LDX #$1103				;$809E79
	STX HDMA[$04].settings			;$809E7C
	LDX #$A1AE				;$809E7F
	STX HDMA[$04].source_word		;$809E82
	LDA #$7E				;$809E85
	STA HDMA[$04].source_bank		;$809E87
	STA HDMA[$04].indirect_source_bank	;$809E8A
	LDX #$2C00				;$809E8D
	STX HDMA[$05].settings			;$809E90
	LDX #$A1E1				;$809E93
	STX HDMA[$05].source_word		;$809E96
	LDA #$7E				;$809E99
	STA HDMA[$05].source_bank		;$809E9B
	STA HDMA[$05].indirect_source_bank	;$809E9E
	LDX #$3200				;$809EA1
	STX HDMA[$06].settings			;$809EA4
	LDX #$A1F2				;$809EA7
	STX HDMA[$06].source_word		;$809EAA
	LDA #$7E				;$809EAD
	STA HDMA[$06].source_bank		;$809EAF
	STA HDMA[$06].indirect_source_bank	;$809EB2
	REP #$20				;$809EB5
	LDA #$D528				;$809EB7
	STA $7EA15A				;$809EBA
	LDA #$D530				;$809EBE
	STA $7EA15C				;$809EC1
	STA $7EA15E				;$809EC5
	STA $7EA160				;$809EC9
	LDA #$D50C				;$809ECD
	STA $7EA162				;$809ED0
	LDA #$9508				;$809ED4
	STA $7EA164				;$809ED7
	LDA #$D501				;$809EDB
	STA $7EA166				;$809EDE
	LDA #$0000				;$809EE2
	STA $7EA168				;$809EE5
	LDA #$007F				;$809EE9
	STA $7EA17A				;$809EEC
	LDA #$0045				;$809EF0
	STA $7EA17C				;$809EF3
	LDA #$2008				;$809EF7
	STA $7EA17E				;$809EFA
	LDA #$0001				;$809EFE
	STA $7EA180				;$809F01
	LDA #$0000				;$809F05
	STA $7EA182				;$809F08
	LDX #$0000				;$809F0C
	LDY #$0000				;$809F0F
CODE_809F12:
	LDA DATA_80C290,y			;$809F12
	STA $7EA18A,x				;$809F15
	INX					;$809F19
	INX					;$809F1A
	INY					;$809F1B
	INY					;$809F1C
	CPY #$008A				;$809F1D
	BMI CODE_809F12				;$809F20
	LDA #$7E01				;$809F22
	STA pending_dma_hdma_channels		;$809F25
	RTS					;$809F28

CODE_809F29:
	STY temp_1A				;$809F29
	%pea_use_dbr($7E807E)			;$809F2B
	PLB					;$809F2E
	LDA $7EA7BA,x				;$809F2F
	CLC					;$809F33
	ADC #$A9DD				;$809F34
	TAY					;$809F37
	LDX temp_1A				;$809F38
CODE_809F3A:
	INX					;$809F3A
	INY					;$809F3B
	LDA $0000,y				;$809F3C
	AND #$00FF				;$809F3F
	STA $7E0000,x				;$809F42
	BNE CODE_809F3A				;$809F46
	PLB					;$809F48
	RTS					;$809F49

CODE_809F4A:
	JSR CODE_809FED				;$809F4A
	STZ $1C37				;$809F4D
	JSR CODE_809731				;$809F50
	JSR CODE_80A1AA				;$809F53
	LDY #$0262				;$809F56
	JSL CODE_BB85B5				;$809F59
	LDX alternate_sprite			;$809F5D
	LDA $1C37				;$809F5F
	STA sprite.general_purpose_5C,x		;$809F62
	INC $1C37				;$809F64
	JSR CODE_809731				;$809F67
	JSR CODE_80A1AA				;$809F6A
	LDY #$0262				;$809F6D
	JSL CODE_BB85B5				;$809F70
	LDX alternate_sprite			;$809F74
	LDA $1C37				;$809F76
	STA sprite.general_purpose_5C,x		;$809F79
	INC $1C37				;$809F7B
	JSR CODE_809731				;$809F7E
	JSR CODE_80A1AA				;$809F81
	LDY #$0262				;$809F84
	JSL CODE_BB85B5				;$809F87
	LDX alternate_sprite			;$809F8B
	LDA $1C37				;$809F8D
	STA sprite.general_purpose_5C,x		;$809F90
CODE_809F92:
	LDA #$0C00				;$809F92
	STA temp_38				;$809F95
	JSR CODE_809FA3				;$809F97
	LDA #$0C00				;$809F9A
	STA temp_38				;$809F9D
	JSR CODE_809FBF				;$809F9F
	RTS					;$809FA2

CODE_809FA3:
	LDX #DATA_809FDB			;$809FA3
	LDY #$0602				;$809FA6
	JSR CODE_80A439				;$809FA9
	LDX #DATA_809FE1			;$809FAC
	LDY #$0642				;$809FAF
	JSR CODE_80A439				;$809FB2
	LDX #DATA_809FE7			;$809FB5
	LDY #$0682				;$809FB8
	JSR CODE_80A439				;$809FBB
	RTS					;$809FBE

CODE_809FBF:
	LDX #DATA_809FDB			;$809FBF
	LDY #$060E				;$809FC2
	JSR CODE_80A439				;$809FC5
	LDX #DATA_809FE1			;$809FC8
	LDY #$064E				;$809FCB
	JSR CODE_80A439				;$809FCE
	LDX #DATA_809FE7			;$809FD1
	LDY #$068E				;$809FD4
	JSR CODE_80A439				;$809FD7
	RTS					;$809FDA

DATA_809FDB:
	db $86,$86,$86,$86,$86,$00

DATA_809FE1:
	db $87,$87,$87,$87,$87,$00

DATA_809FE7:
	db $86,$86,$86,$86,$86,$00

CODE_809FED:
	LDA #$007E				;$809FED
	STA $44					;$809FF0
	LDA #$F000				;$809FF2
	STA $42					;$809FF5
	RTS					;$809FF7

CODE_809FF8:
	LDA $1CB0				;$809FF8
	STA temp_1E				;$809FFB
	LDA #$000F				;$809FFD
	STA temp_3E				;$80A000
CODE_80A002:
	LSR temp_1E				;$80A002
	BCC CODE_80A02A				;$80A004
	LDA temp_3E				;$80A006
	ASL					;$80A008
	ASL					;$80A009
	TAX					;$80A00A
	LDA.l DATA_80A02F,x			;$80A00B
	STA PPU.vram_address			;$80A00F
	STA temp_1A				;$80A012
	LDA.l DATA_80A02F+$03,x			;$80A014
	AND #$00FF				;$80A018
	PHA					;$80A01B
	LDA.l DATA_80A02F+$02,x			;$80A01C
CODE_80A020:
	AND #$00FF				;$80A020
	PLX					;$80A023
	LDY #$0003				;$80A024
	JSR CODE_80A06F				;$80A027
CODE_80A02A:
	DEC temp_3E				;$80A02A
	BPL CODE_80A002				;$80A02C
	RTS					;$80A02E

DATA_80A02F:
	dw $7B01, $0005, $7B01, $6005
	dw $7B07, $1E05, $7B07, $7E05
	dw $7B0D, $5A01, $7B0D, $5401
	dw $7B0D, $4E01, $7B0D, $4801
	dw $7B0D, $4201, $7B0D, $3C01
	dw $7B15, $5A01, $7B15, $5401
	dw $7B15, $4E01, $7B15, $4801
	dw $7B15, $4201, $7B15, $3C01

CODE_80A06F:
	PHA					;$80A06F
	STA temp_1C				;$80A070
CODE_80A072:
	LDA.l DATA_EA0694,x			;$80A072
	STA PPU.vram_write			;$80A076
	INX					;$80A079
	INX					;$80A07A
	DEC temp_1C				;$80A07B
	BNE CODE_80A072				;$80A07D
	LDA temp_1A				;$80A07F
	CLC					;$80A081
	ADC #$0020				;$80A082
	STA temp_1A				;$80A085
	STA PPU.vram_address			;$80A087
	PLA					;$80A08A
	DEY					;$80A08B
	BNE CODE_80A06F				;$80A08C
	RTS					;$80A08E

CODE_80A08F:
	PHK					;$80A08F
	PLB					;$80A090
	JSR CODE_809FED				;$80A091
	LDA #$00B0				;$80A094
	STA $86					;$80A097
	STZ temp_2E				;$80A099
	LDA #$6062				;$80A09B
	LDY #$3800				;$80A09E
	JSR CODE_80A0BB				;$80A0A1
	INC temp_2E				;$80A0A4
	LDA #$62EC				;$80A0A6
	LDY #$6800				;$80A0A9
	JSR CODE_80A0BB				;$80A0AC
	INC temp_2E				;$80A0AF
	LDA #$6576				;$80A0B1
	LDY #$9800				;$80A0B4
	JSR CODE_80A0BB				;$80A0B7
	RTS					;$80A0BA

CODE_80A0BB:
	STZ temp_30				;$80A0BB
	STZ temp_32				;$80A0BD
	STA $84					;$80A0BF
	STY temp_34				;$80A0C1
	JSR CODE_80A0D7				;$80A0C3
	LDA #$0006				;$80A0C6
	LDY temp_34				;$80A0C9
	JSR CODE_80A374				;$80A0CB
	JSR CODE_80A0FA				;$80A0CE
	BCC CODE_80A0D6				;$80A0D1
	JSR CODE_80A374				;$80A0D3
CODE_80A0D6:
	RTS					;$80A0D6

CODE_80A0D7:
	LDY #$0005				;$80A0D7
	LDA [$84],y				;$80A0DA
	AND #$00FF				;$80A0DC
	STA temp_32				;$80A0DF
	LDY #$0000				;$80A0E1
	LDA [$84],y				;$80A0E4
	STA temp_30				;$80A0E6
	BEQ CODE_80A0F9				;$80A0E8
	LDA temp_32				;$80A0EA
	CMP #$0002				;$80A0EC
	BNE CODE_80A0F9				;$80A0EF
	LDA temp_34				;$80A0F1
	SEC					;$80A0F3
	SBC #$0800				;$80A0F4
	STA temp_34				;$80A0F7
CODE_80A0F9:
	RTS					;$80A0F9

CODE_80A0FA:
	LDA temp_32				;$80A0FA
	CMP #$0002				;$80A0FC
	BNE CODE_80A112				;$80A0FF
	LDA temp_30				;$80A101
	BEQ CODE_80A112				;$80A103
	LDA temp_34				;$80A105
	CLC					;$80A107
	ADC #$1000				;$80A108
	STA temp_34				;$80A10B
	TAY					;$80A10D
	LDA #$0142				;$80A10E
	SEC					;$80A111
CODE_80A112:
	RTS					;$80A112

CODE_80A113:
	LDA stereo_select			;$80A113
	STA temp_1A				;$80A116
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
	STA temp_1A				;$80A13F
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
	LDA temp_1A				;$80A166
	INC temp_1A				;$80A168
	AND #$0001				;$80A16A
	ASL					;$80A16D
	TAY					;$80A16E
	LDX DATA_80A173,y			;$80A16F
	RTS					;$80A172

DATA_80A173:
	dw DATA_80C365
	dw DATA_80C35F

CODE_80A177:
	LDA temp_1A				;$80A177
	INC temp_1A				;$80A179
	AND #$0001				;$80A17B
	ASL					;$80A17E
	TAY					;$80A17F
	LDX DATA_80A184,y			;$80A180
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
	JSR CODE_80A35A				;$80A1AA
	LDA #$2400				;$80A1AD
	STA temp_38				;$80A1B0
	JSR CODE_809141				;$80A1B2
	BCS CODE_80A1BD				;$80A1B5
	LDY #$0000				;$80A1B7
	TYA					;$80A1BA
	STA [$84],y				;$80A1BB
CODE_80A1BD:
	LDY #$0005				;$80A1BD
	LDA [$84],y				;$80A1C0
	AND #$00FF				;$80A1C2
	STA $1CD0				;$80A1C5
	LDY #$0000				;$80A1C8
	LDA [$84],y				;$80A1CB
	STA $1C85				;$80A1CD
	BEQ CODE_80A188				;$80A1D0
	LDA #$8002				;$80A1D2
	BIT $1C35				;$80A1D5
	BNE CODE_80A1F9				;$80A1D8
	LDY #$024C				;$80A1DA
	JSL CODE_BB8585				;$80A1DD
	LDA #$F000				;$80A1E1
	STA $42					;$80A1E4
	LDX alternate_sprite			;$80A1E6
	LDA $1C37				;$80A1E8
	STA sprite.general_purpose_6A,x		;$80A1EB
	ASL					;$80A1ED
	TAY					;$80A1EE
	LDA DATA_80C322,y			;$80A1EF
	STA sprite.y_position,x			;$80A1F2
	LDA $1CD0				;$80A1F4
	STA sprite.general_purpose_5C,x		;$80A1F7
CODE_80A1F9:
	LDA $1CD0				;$80A1F9
	BNE CODE_80A211				;$80A1FC
	JSR CODE_80A369				;$80A1FE
	LDA #$0006				;$80A201
	JSR CODE_80A286				;$80A204
	JSR CODE_80A2A5				;$80A207
	JSR CODE_80A2BE				;$80A20A
	JSR CODE_80A257				;$80A20D
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
	LDY $1C37				;$80A257
	LDA DATA_80C343+$03,y			;$80A25A
	AND #$00FF				;$80A25D
	TAX					;$80A260
	LDA #$FFFA				;$80A261
	STA $7EA1B0,x				;$80A264
	STA $7EA1B5,x				;$80A268
	RTS					;$80A26C

CODE_80A26D:
	LDY $1C37				;$80A26D
	LDA DATA_80C343+$03,y			;$80A270
	AND #$00FF				;$80A273
	TAX					;$80A276
	LDA #$FFF7				;$80A277
	STA $7EA1B0,x				;$80A27A
	LDA #$FFFD				;$80A27E
	STA $7EA1B5,x				;$80A281
	RTS					;$80A285

CODE_80A286:
	CLC					;$80A286
	ADC $84					;$80A287
	STA $84					;$80A289
	TAX					;$80A28B
	LDA $B00000,x				;$80A28C
	STA $1C97				;$80A290
	LDA $B00002,x				;$80A293
	STA $1C99				;$80A297
	LDA $B00003,x				;$80A29A
	ORA #$8000				;$80A29E
	STA $1C9A				;$80A2A1
	RTS					;$80A2A4

CODE_80A2A5:
	LDX #$001C97				;$80A2A5
	LDY #$0096				;$80A2A8
	JSR CODE_80A417				;$80A2AB
	RTS					;$80A2AE

CODE_80A2AF:
	LDX #$1C97				;$80A2AF
	LDA #$0096				;$80A2B2
	CLC					;$80A2B5
	ADC $1C95				;$80A2B6
	TAY					;$80A2B9
	JSR CODE_80A439				;$80A2BA
	RTS					;$80A2BD

CODE_80A2BE:
	LDY #$000E				;$80A2BE
	LDA [$84],y				;$80A2C1
	AND #$00FF				;$80A2C3
	LDX $1C95				;$80A2C6
	STX temp_36				;$80A2C9
	LDX #$0003				;$80A2CB
	LDY #$00A2				;$80A2CE
	JSR CODE_80A64A				;$80A2D1
	LDX #DATA_80C369			;$80A2D4
	LDY #$00A8				;$80A2D7
	JSR CODE_80A417				;$80A2DA
	RTS					;$80A2DD

CODE_80A2DE:
	LDA #$F000				;$80A2DE
	STA $42					;$80A2E1
	LDA #$0800				;$80A2E3
	STA temp_38				;$80A2E6
	LDX #$0002				;$80A2E8
	LDA stereo_select			;$80A2EB
	BNE CODE_80A2F3				;$80A2EE
	LDX #$0000				;$80A2F0
CODE_80A2F3:
	LDY #$061C				;$80A2F3
	JSR CODE_80A33F				;$80A2F6
	JSR CODE_80A33F				;$80A2F9
	JSR CODE_80A33F				;$80A2FC
	LDX #$0000				;$80A2FF
	LDA language_select			;$80A302
	BEQ CODE_80A312				;$80A305
	LDX #$0002				;$80A307
	CMP #$0001				;$80A30A
	BEQ CODE_80A312				;$80A30D
	LDX #$0004				;$80A30F
CODE_80A312:
	LDY #$062C				;$80A312
	JSR CODE_80A324				;$80A315
	JSR CODE_80A324				;$80A318
	JSR CODE_80A324				;$80A31B
	LDA #$2400				;$80A31E
	STA temp_38				;$80A321
	RTS					;$80A323

CODE_80A324:
	PHX					;$80A324
	PHY					;$80A325
	LDA DATA_80A337,x			;$80A326
	TAX					;$80A329
	JSR CODE_80A41D				;$80A32A
	PLA					;$80A32D
	CLC					;$80A32E
	ADC #$0040				;$80A32F
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
	LDA DATA_80A352,x			;$80A341
	TAX					;$80A344
	JSR CODE_80A41D				;$80A345
	PLA					;$80A348
	CLC					;$80A349
	ADC #$0040				;$80A34A
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
	LDA $1C37				;$80A35A
	ASL					;$80A35D
	TAY					;$80A35E
	LDA DATA_80C328,y			;$80A35F
	STA $1C95				;$80A362
	RTS					;$80A365

CODE_80A366:
	JSR CODE_80A369				;$80A366
CODE_80A369:
	LDA $1C95				;$80A369
	CLC					;$80A36C
	ADC #$0040				;$80A36D
	STA $1C95				;$80A370
	RTS					;$80A373

CODE_80A374:
	STY temp_36				;$80A374
	LDX temp_30				;$80A376
	BNE CODE_80A37B				;$80A378
	RTS					;$80A37A

CODE_80A37B:
	CLC					;$80A37B
	ADC $84					;$80A37C
	STA $84					;$80A37E
	JSR CODE_80A697				;$80A380
	LDA temp_3E				;$80A383
	LDY #$00DD				;$80A385
	LDX #$0002				;$80A388
	JSR CODE_80A4B2				;$80A38B
	LDA temp_40				;$80A38E
	LDY #$00C9				;$80A390
	LDX #$0002				;$80A393
	JSR CODE_80A4B2				;$80A396
	LDA temp_2E				;$80A399
	CMP $1C37				;$80A39B
	BNE CODE_80A3A7				;$80A39E
	LDA active_frame_counter		;$80A3A0
	BIT #$0020				;$80A3A2
	BNE CODE_80A3C2				;$80A3A5
CODE_80A3A7:
	LDA $1C81				;$80A3A7
	PHA					;$80A3AA
	LDA $1C8D				;$80A3AB
	STA $1C81				;$80A3AE
	LDA temp_36				;$80A3B1
	CLC					;$80A3B3
	ADC #$00D5				;$80A3B4
	TAY					;$80A3B7
	LDX #DATA_80C378			;$80A3B8
	JSR CODE_80A52C				;$80A3BB
	PLA					;$80A3BE
	STA $1C81				;$80A3BF
CODE_80A3C2:
	RTS					;$80A3C2

CODE_80A3C3:
	JSR CODE_809731				;$80A3C3
	LDY #$0000				;$80A3C6
	LDA [$84],y				;$80A3C9
	BEQ CODE_80A3D8				;$80A3CB
	TYA					;$80A3CD
	STA [$84],y				;$80A3CE
	LDA #$8000				;$80A3D0
	TSB $1C35				;$80A3D3
	SEC					;$80A3D6
	RTS					;$80A3D7

CODE_80A3D8:
	LDA #$0567				;$80A3D8
	JSL CODE_B28018				;$80A3DB
	LDA #$0668				;$80A3DF
	JSL CODE_B28018				;$80A3E2
	LDA #$0050				;$80A3E6
CODE_80A3E9:
	STA $1C87				;$80A3E9
	LDA #$4000				;$80A3EC
	TSB $1C35				;$80A3EF
	CLC					;$80A3F2
	RTS					;$80A3F3

CODE_80A3F4:
	LDA $1C89				;$80A3F4
	JSR CODE_809734				;$80A3F7
	LDA $84					;$80A3FA
	STA temp_1A				;$80A3FC
	LDA $86					;$80A3FE
	STA temp_1C				;$80A400
	JSR CODE_809731				;$80A402
	LDY #$0289				;$80A405
	SEP #$20				;$80A408
CODE_80A40A:
	LDA [temp_1A],y			;$80A40A
	STA [$84],y				;$80A40C
	DEY					;$80A40E
	BPL CODE_80A40A				;$80A40F
	REP #$20				;$80A411
	JSR CODE_80A1AA				;$80A413
	RTS					;$80A416

CODE_80A417:
	TYA					;$80A417
	CLC					;$80A418
	ADC $1C95				;$80A419
	TAY					;$80A41C
CODE_80A41D:
	LDA $0000,x				;$80A41D
	AND #$007F				;$80A420
	BEQ CODE_80A429				;$80A423
	SEC					;$80A425
	SBC #$0020				;$80A426
CODE_80A429:
	ORA temp_38				;$80A429
	STA [$42],y				;$80A42B
	INY					;$80A42D
	INY					;$80A42E
	LDA $0000,x				;$80A42F
	INX					;$80A432
	BIT #$0080				;$80A433
	BEQ CODE_80A41D				;$80A436
	RTS					;$80A438

CODE_80A439:
	LDA $0000,x				;$80A439
	AND #$00FF				;$80A43C
CODE_80A43F:
	SEC					;$80A43F
	SBC #$0020				;$80A440
	ORA temp_38				;$80A443
	STA [$42],y				;$80A445
	INY					;$80A447
	INY					;$80A448
	INX					;$80A449
	LDA $0000,x				;$80A44A
	AND #$00FF				;$80A44D
	BNE CODE_80A43F				;$80A450
	RTS					;$80A452

CODE_80A453:
	LDY $1C3F				;$80A453
	STA $0000,y				;$80A456
	INY					;$80A459
	INY					;$80A45A
	TXA					;$80A45B
	STA $0000,y				;$80A45C
	INY					;$80A45F
	INY					;$80A460
	STY $1C3F				;$80A461
	RTS					;$80A464

CODE_80A465:
	PHK					;$80A465
	PLB					;$80A466
	LDX #$1C41				;$80A467
	LDY next_oam_slot			;$80A46A
CODE_80A46C:
	LDA $00,x				;$80A46C
	BEQ CODE_80A495				;$80A46E
	STA $1A					;$80A470
	AND #$FF00				;$80A472
	CMP #$D400				;$80A475
	BEQ CODE_80A48F				;$80A478
	LDA $02,x				;$80A47A
	PHX					;$80A47C
	TAX					;$80A47D
CODE_80A47E:
	LDA $00,x				;$80A47E
	AND #$007F				;$80A480
	JSR CODE_80A498				;$80A483
	LDA $00,x				;$80A486
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
	SBC #$0020				;$80A499
	ORA $1C81				;$80A49C
	STA $0002,y				;$80A49F
	LDA temp_1A				;$80A4A2
	STA $0000,y				;$80A4A4
	CLC					;$80A4A7
	ADC #$0008				;$80A4A8
	STA temp_1A				;$80A4AB
	INY					;$80A4AD
	INY					;$80A4AE
	INY					;$80A4AF
	INY					;$80A4B0
	RTS					;$80A4B1

CODE_80A4B2:
	JSR CODE_80A65F				;$80A4B2
	TYX					;$80A4B5
CODE_80A4B6:
	PLA					;$80A4B6
	CLC					;$80A4B7
	ADC #$0064				;$80A4B8
	ORA $1C8D				;$80A4BB
	PHY					;$80A4BE
	LDY next_oam_slot			;$80A4BF
	STA $0002,y				;$80A4C1
	LDA temp_1C				;$80A4C4
	STA $0000,y				;$80A4C6
	INY					;$80A4C9
	INY					;$80A4CA
	INY					;$80A4CB
	INY					;$80A4CC
	STY next_oam_slot			;$80A4CD
	PLY					;$80A4CF
	CLC					;$80A4D0
	ADC #$0008				;$80A4D1
	STA temp_1C				;$80A4D4
	INY					;$80A4D6
	INY					;$80A4D7
	DEX					;$80A4D8
	BNE CODE_80A4B6				;$80A4D9
	RTS					;$80A4DB

CODE_80A4DC:
	JSR CODE_80A65F				;$80A4DC
	LDA temp_1C				;$80A4DF
	CLC					;$80A4E1
	ADC $42					;$80A4E2
	STA $42					;$80A4E4
	TYX					;$80A4E6
CODE_80A4E7:
	PLA					;$80A4E7
	CLC					;$80A4E8
	ADC #$000F				;$80A4E9
	JSR CODE_80A4F8				;$80A4EC
	DEX					;$80A4EF
	BNE CODE_80A4E7				;$80A4F0
	LDA #$F000				;$80A4F2
	STA $42					;$80A4F5
	RTS					;$80A4F7

CODE_80A4F8:
	BMI CODE_80A50C				;$80A4F8
	TAY					;$80A4FA
	LDA [$46],y				;$80A4FB
	AND #$00FF				;$80A4FD
	ASL					;$80A500
	ORA $1CAE				;$80A501
	STA [$42]				;$80A504
	INC					;$80A506
	LDY #$0040				;$80A507
	STA [$42],y				;$80A50A
CODE_80A50C:
	INC $42					;$80A50C
	INC $42					;$80A50E
	RTS					;$80A510

CODE_80A511:
	STY temp_1A				;$80A511
	LDY next_oam_slot			;$80A513
CODE_80A515:
	LDA $00,x				;$80A515
	AND #$007F				;$80A517
	SEC					;$80A51A
	SBC #$0020				;$80A51B
	JSR CODE_80A498				;$80A51E
	LDA $00,x				;$80A521
	INX					;$80A523
	BIT #$0080				;$80A524
	BEQ CODE_80A515				;$80A527
	STY next_oam_slot			;$80A529
	RTS					;$80A52B

CODE_80A52C:
	STY temp_1A				;$80A52C
	LDY next_oam_slot			;$80A52E
	LDA $00,x				;$80A530
	AND #$00FF				;$80A532
CODE_80A535:
	SEC					;$80A535
	SBC #$0020				;$80A536
	JSR CODE_80A498				;$80A539
	INX					;$80A53C
	LDA $00,x				;$80A53D
	AND #$00FF				;$80A53F
	BNE CODE_80A535				;$80A542
	STY next_oam_slot			;$80A544
	RTS					;$80A546

CODE_80A547:
	LDA $1CAE				;$80A547
	PHA					;$80A54A
	TYA					;$80A54B
	CLC					;$80A54C
	ADC $42					;$80A54D
	CLC					;$80A54F
	ADC temp_36				;$80A550
	STA $42					;$80A552
CODE_80A554:
	LDA $00,x				;$80A554
	AND #$007F				;$80A556
	CMP #$005F				;$80A559
	BNE CODE_80A561				;$80A55C
	LDA #$003E				;$80A56E
CODE_80A561:
	SEC					;$80A561
	SBC #$0021				;$80A562
	JSR CODE_80A4F8				;$80A565
	LDA $00,x				;$80A568
	AND #$00FF				;$80A56A
	CMP #$005E				;$80A56D
	BNE CODE_80A578				;$80A570
	LDY #$3400				;$80A572
	STY $1CAE				;$80A575
CODE_80A578:
	INX					;$80A578
	BIT #$0080				;$80A579
	BEQ CODE_80A554				;$80A57C
	PLA					;$80A57E
	STA $1CAE				;$80A57F
	LDA #$F000				;$80A582
	STA $42					;$80A585
	RTS					;$80A587

CODE_80A588:
	JSR CODE_80A58C				;$80A588
	RTL					;$80A58B

CODE_80A58C:
	TYA					;$80A58C
	CLC					;$80A58D
	ADC $42					;$80A58E
	CLC					;$80A590
	ADC temp_36				;$80A591
	STA $42					;$80A593
	LDA $7EA7BA,x				;$80A595
	CLC					;$80A599
	ADC #$A9DE				;$80A59A
	TAX					;$80A59D
CODE_80A59E:
	LDA $7E0000,x				;$80A59E
	AND #$00FF				;$80A5A2
CODE_80A5A5:
	CMP #$005F				;$80A5A5
	BNE CODE_80A5AD				;$80A5A8
	LDA #$003E				;$80A5AA
CODE_80A5AD:
	SEC					;$80A5AD
	SBC #$0021				;$80A5AE
	JSR CODE_80A4F8				;$80A5B1
	INX					;$80A5B4
	LDA $7E0000,x				;$80A5B5
	AND #$00FF				;$80A5B9
	BNE CODE_80A5A5				;$80A5BC
	LDA #$F000				;$80A5BE
	STA $42					;$80A5C1
	RTS					;$80A5C3

CODE_80A5C4:
	LDA $7EA7BA,x				;$80A5C4
	CLC					;$80A5C8
	ADC #$A9DE				;$80A5C9
	TAX					;$80A5CC
CODE_80A5CD:
	LDY #$FFFF				;$80A5CD
CODE_80A5D0:
	LDA $7E0000,x				;$80A5D0
	INX					;$80A5D4
	INY					;$80A5D5
	AND #$00FF				;$80A5D6
	BNE CODE_80A5D0				;$80A5D9
	STY temp_1A				;$80A5DB
	RTS					;$80A5DD

CODE_80A5DE:
	STY temp_1C				;$80A5DE
	PHX					;$80A5E0
	JSR CODE_80A5C4				;$80A5E1
	PLX					;$80A5E4
	LDA #$0020				;$80A5E5
	SEC					;$80A5E8
	SBC temp_1A				;$80A5E9
	AND #$FFFE				;$80A5EB
	CLC					;$80A5EE
	ADC temp_1C				;$80A5EF
	TAY					;$80A5F1
	RTS					;$80A5F2

CODE_80A5F3:
	STY temp_1C				;$80A5F3
	PHX					;$80A5F5
	JSR CODE_80A5CD				;$80A5F6
	PLX					;$80A5F9
	LDA #$0020				;$80A5FA
	SEC					;$80A5FD
	SBC temp_1A				;$80A5FE
	AND #$FFFE				;$80A600
	CLC					;$80A603
	ADC temp_1C				;$80A604
	TAY					;$80A606
	RTS					;$80A607

CODE_80A608:
	LDY next_oam_slot			;$80A608
	LDX $1C93				;$80A60A
	LDA current_game_mode			;$80A60D
	BNE CODE_80A615				;$80A610
	LDX #$0500				;$80A612
CODE_80A615:
	STX temp_1C				;$80A615
	LDA $1C37				;$80A617
	ASL					;$80A61A
	TAX					;$80A61B
	LDA DATA_80A644,x			;$80A61C
	STA temp_1A				;$80A61F
	LDX #$0005				;$80A621
CODE_80A624:
	LDA temp_1A				;$80A624
	CLC					;$80A626
	ADC temp_1C				;$80A627
	STA $0000,y				;$80A629
	LDA #$31FF				;$80A62C
	STA $0002,y				;$80A62F
	INY					;$80A632
	INY					;$80A633
	INY					;$80A634
	INY					;$80A635
	LDA temp_1A				;$80A636
	CLC					;$80A638
	ADC #$0008				;$80A639
	STA temp_1A				;$80A63C
	DEX					;$80A63E
	BNE CODE_80A624				;$80A63F
	STY next_oam_slot			;$80A641
	RTS					;$80A643

DATA_80A644:
	dw $3858
	dw $6858
	dw $9858

CODE_80A64A:
	JSR CODE_80A65F				;$80A64A
	TYX					;$80A64D
	LDY temp_1C				;$80A64E
CODE_80A650:
	PLA					;$80A650
	CLC					;$80A651
	ADC #$0010				;$80A652
	ORA temp_38				;$80A655
	STA [$42],y				;$80A657
	INY					;$80A659
	INY					;$80A65A
	DEX					;$80A65B
	BNE CODE_80A650				;$80A65C
	RTS					;$80A65E

CODE_80A65F:
	STA temp_1E				;$80A65F
	STX temp_20				;$80A661
	PLA					;$80A663
	STA temp_22				;$80A664
	TYA					;$80A666
	CLC					;$80A667
	ADC temp_36				;$80A668
	STA temp_1C				;$80A66A
	LDY #$0000				;$80A66C
	LDA temp_1E				;$80A66F
	LDX #$000A				;$80A671
CODE_80A674:
	SEP #$10				;$80A674
	STA CPU.dividen_low			;$80A676
	STX CPU.divisor				;$80A679
	REP #$10				;$80A67C
	LDA CPU.divide_remainder		;$80A67E
	LDA CPU.divide_remainder		;$80A681
	LDA CPU.divide_remainder		;$80A684
	LDA CPU.divide_remainder		;$80A687
	PHA					;$80A68A
	INY					;$80A68B
	LDA CPU.divide_result			;$80A68C
	DEC temp_20				;$80A68F
	BNE CODE_80A674				;$80A691
	LDA temp_22				;$80A693
	PHA					;$80A695
	RTS					;$80A696

CODE_80A697:
	LDY #$000A				;$80A697
	LDA [$84],y				;$80A69A
	STA temp_1A				;$80A69C
	STA temp_26				;$80A69E
	LDY #$000C				;$80A6A0
	LDA [$84],y				;$80A6A3
	STA temp_1C				;$80A6A5
	STA temp_28				;$80A6A7
CODE_80A6A9:
	LDA #$003C				;$80A6A9
	STA temp_1E				;$80A6AC
	JSR CODE_80A729				;$80A6AE
	LDA temp_20				;$80A6B1
	STA temp_1A				;$80A6B3
	LDA temp_22				;$80A6B5
	STA temp_1C				;$80A6B7
	LDA #$003C				;$80A6B9
	STA temp_1E				;$80A6BC
	JSR CODE_80A729				;$80A6BE
	LDA temp_20				;$80A6C1
	STA temp_1A				;$80A6C3
	LDA temp_22				;$80A6C5
	STA temp_1C				;$80A6C7
	LDA #$003C				;$80A6C9
	STA temp_1E				;$80A6CC
	JSR CODE_80A729				;$80A6CE
	LDA temp_20				;$80A6D1
	STA temp_40				;$80A6D3
	LDA temp_20				;$80A6D5
	SEP #$20				;$80A6D7
	STA PPU.fixed_point_mul_B		;$80A6D9
	LDA #$78				;$80A6DC
	STA PPU.fixed_point_mul_A		;$80A6DE
	LDA #$69				;$80A6E1
	STA PPU.fixed_point_mul_A		;$80A6E3
	REP #$20				;$80A6E6
	LDA PPU.multiply_result_word		;$80A6E8
	STA temp_1A				;$80A6EB
	LDA PPU.multiply_result_high		;$80A6ED
	AND #$00FF				;$80A6F0
	ASL temp_1A				;$80A6F3
	ROL					;$80A6F5
	ASL temp_1A				;$80A6F6
	ROL					;$80A6F8
	ASL temp_1A				;$80A6F9
	ROL					;$80A6FB
	STA temp_1C				;$80A6FC
	LDA temp_26				;$80A6FE
	SEC					;$80A700
	SBC temp_1A				;$80A701
	STA temp_1A				;$80A703
	LDA temp_28				;$80A705
	SBC temp_1C				;$80A707
	STA temp_1C				;$80A709
	LDA #$003C				;$80A70B
	STA temp_1E				;$80A70E
	JSR CODE_80A729				;$80A710
	LDA temp_20				;$80A713
	STA temp_1A				;$80A715
	LDA temp_22				;$80A717
	STA temp_1C				;$80A719
	LDA #$003C				;$80A71B
	STA temp_1E				;$80A71E
	JSR CODE_80A729				;$80A720
	LDA temp_20				;$80A723
	STA temp_3E				;$80A725
	SEC					;$80A727
	RTS					;$80A728

CODE_80A729:
	STZ temp_1F				;$80A729
	STZ temp_21				;$80A72B
	STZ temp_23				;$80A72D
	LDA temp_1C				;$80A72F
	STA CPU.dividen_low			;$80A731
	SEP #$20				;$80A734
	LDA temp_1E				;$80A736
	STA CPU.divisor				;$80A738
	REP #$20				;$80A73B
	LDA CPU.divide_result			;$80A73D
	LDA CPU.divide_result			;$80A740
	LDA CPU.divide_result			;$80A743
	LDA CPU.divide_result			;$80A746
	STA temp_22				;$80A749
	LDA CPU.divide_remainder		;$80A74B
	XBA					;$80A74E
	EOR temp_1B				;$80A74F
	AND #$FF00				;$80A751
	EOR temp_1B				;$80A754
	STA CPU.dividen_low			;$80A756
	SEP #$20				;$80A759
	LDA temp_1E				;$80A75B
	STA CPU.divisor				;$80A75D
	REP #$20				;$80A760
	LDA CPU.divide_result			;$80A762
	LDA CPU.divide_result			;$80A765
	LDA CPU.divide_result			;$80A768
	LDA CPU.divide_result			;$80A76B
	CLC					;$80A76E
	ADC temp_21				;$80A76F
	STA temp_21				;$80A771
	LDA #$0000				;$80A773
	ADC temp_23				;$80A776
	STA temp_23				;$80A778
	LDA CPU.divide_remainder		;$80A77A
	XBA					;$80A77D
	EOR temp_1A				;$80A77E
	AND #$FF00				;$80A780
	EOR temp_1A				;$80A783
	STA CPU.dividen_low			;$80A785
	SEP #$20				;$80A788
	LDA temp_1E				;$80A78A
	STA CPU.divisor				;$80A78C
	REP #$20				;$80A78F
	LDA CPU.divide_result			;$80A791
	LDA CPU.divide_result			;$80A794
	LDA CPU.divide_result			;$80A797
	LDA CPU.divide_result			;$80A79A
	CLC					;$80A79D
	ADC temp_20				;$80A79E
	STA temp_20				;$80A7A0
	LDA #$0000				;$80A7A2
	ADC temp_22				;$80A7A5
	STA temp_22				;$80A7A7
	RTS					;$80A7A9

CODE_80A7AA:
	STZ PPU.vram_address			;$80A7AA
	LDA #DATA_FC14A0			;$80A7AD
	STA $42					;$80A7B0
	LDA.w #DATA_FC14A0>>16			;$80A7B2
	STA $44					;$80A7B5
	LDA #$0064				;$80A7B7
	STA $1C83				;$80A7BA
	LDY #$0000				;$80A7BD
CODE_80A7C0:
	LDX #$0008				;$80A7C0
CODE_80A7C3:
	LDA [$42],y				;$80A7C3
	STA PPU.vram_write			;$80A7C5
	INY					;$80A7C8
	INY					;$80A7C9
	DEX					;$80A7CA
	BNE CODE_80A7C3				;$80A7CB
	STZ PPU.vram_write			;$80A7CD
	STZ PPU.vram_write			;$80A7D0
	STZ PPU.vram_write			;$80A7D3
	STZ PPU.vram_write			;$80A7D6
	STZ PPU.vram_write			;$80A7D9
	STZ PPU.vram_write			;$80A7DC
	STZ PPU.vram_write			;$80A7DF
	STZ PPU.vram_write			;$80A7E2
	DEC $1C83				;$80A7E5
	BNE CODE_80A7C0				;$80A7E8
	RTS					;$80A7EA

file_select_number_main:
	JMP (.state_table,x)			;$80A7EB  |>

.state_table:
	dw .state_0
	dw .state_1

.state_0:
	TYX					;$80A7F2  \
	INC sprite.state,x			;$80A7F3   |
	LDX sprite.general_purpose_5C,y		;$80A7F5   |
	LDA #$001C				;$80A7F7  /
..CODE_80A7FA:
	CLC					;$80A7FA  \
	ADC #$0030				;$80A7FB   |
	DEX					;$80A7FE   |
	BPL ..CODE_80A7FA			;$80A7FF   |
	STA.w sprite.y_position,y		;$80A801  /
.state_1:
	LDX $1CB2				;$80A804  \
	BEQ ..CODE_80A81A			;$80A807   |
	LDA sprite.general_purpose_6A,x		;$80A809   |
	CMP.w sprite.general_purpose_5C,y	;$80A80B   |
	BNE ..CODE_80A81A			;$80A80E   |
	LDA sprite.x_position,x			;$80A810   |
	STA.w sprite.x_position,y		;$80A812   |
	LDA sprite.y_position,x			;$80A815   |
	STA.w sprite.y_position,y		;$80A817  /
..CODE_80A81A:
	LDA.w sprite.general_purpose_5C,y	;$80A81A  \
	CLC					;$80A81D   |
	ADC #$006F				;$80A81E   |
	ORA $1C81				;$80A821   |
	ORA #$3000				;$80A824   |
	STA temp_1A				;$80A827   |
	LDX next_oam_slot			;$80A829   |
	LDA.w sprite.x_position,y		;$80A82B   |
	SEP #$20				;$80A82E   |
	SEC					;$80A830   |
	SBC #$30				;$80A831   |
	XBA					;$80A833   |
	ORA.w sprite.y_position,y		;$80A834   |
	SEC					;$80A837   |
	SBC #$16				;$80A838   |
	XBA					;$80A83A   |
	REP #$20				;$80A83B   |
	STA $00,x				;$80A83D   |
	LDA temp_1A				;$80A83F   |
	STA $02,x				;$80A841   |
	INX					;$80A843   |
	INX					;$80A844   |
	INX					;$80A845   |
	INX					;$80A846   |
	STX next_oam_slot			;$80A847   |
	JML [$04F5]				;$80A849  /

file_select_icon_main:
	JMP (DATA_80A84F,x)			;$80A84C

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
	JSR CODE_80AB28				;$80A85F
CODE_80A862:
	LDA.w sprite.general_purpose_6A,y	;$80A862
	CMP $1C37				;$80A865
	BNE CODE_80A8A2				;$80A868
	LDA #$8000				;$80A86A
	TRB $1C35				;$80A86D
	BEQ CODE_80A876				;$80A870
	JSL delete_sprite_handle_deallocation	;$80A872
CODE_80A876:
	LDA #$0200				;$80A876
	TRB $1C35				;$80A879
	BEQ CODE_80A8A2				;$80A87C
	LDA $1C37				;$80A87E
	JSR CODE_809DB7				;$80A881
	LDA #$0015				;$80A884
	STA.w sprite.general_purpose_62,y	;$80A887
	STY $1CB2				;$80A88A
	LDA #$0006				;$80A88D
	STA.w sprite.state,y			;$80A890
	STZ active_frame_counter		;$80A893
	LDA #$0100				;$80A895
	TSB $1C35				;$80A898
	LDA #$0769				;$80A89B
	JSL queue_sound_effect			;$80A89E
CODE_80A8A2:
	JML [$04F5]				;$80A8A2

CODE_80A8A5:
	TYX					;$80A8A5
	LDA #$FA00				;$80A8A6
	STA sprite.x_speed,x			;$80A8A9
	STA sprite.max_x_speed,x		;$80A8AB
	LDA #$0040				;$80A8AD
	STA sprite.general_purpose_5E,x		;$80A8B0
	LDA #$0070				;$80A8B2
	STA sprite.general_purpose_4C,x		;$80A8B5
	LDA #$00A0				;$80A8B7
	STA sprite.general_purpose_4E,x		;$80A8BA
	STA sprite.render_order,x		;$80A8BC
	LDA #$0030				;$80A8BE
	JSR CODE_80A3E9				;$80A8C1
	JSR CODE_80AB28				;$80A8C4
	INC sprite.state,x			;$80A8C7
	LDY sprite.general_purpose_6A,x		;$80A8C9
	BEQ CODE_80A914				;$80A8CB
CODE_80A8CD:
	JSR CODE_80A9A9				;$80A8CD
	DEY					;$80A8D0
	STY sprite.render_order,x		;$80A8D1
	BNE CODE_80A8CD				;$80A8D3
	JSR CODE_80A9CB				;$80A8D5
	BRA CODE_80A914				;$80A8D8

CODE_80A8DA:
	TYX					;$80A8DA
	LDA sprite.general_purpose_6A,x		;$80A8DB
	CMP $1C8F				;$80A8DD
	BEQ CODE_80A8E7				;$80A8E0
	JSR CODE_80A9CB				;$80A8E2
	BRA CODE_80A8EA				;$80A8E5

CODE_80A8E7:
	JSR CODE_80A9EC				;$80A8E7
CODE_80A8EA:
	LDA #$0010				;$80A8EA
	JSR CODE_80A3E9				;$80A8ED
	LDA sprite.x_position,x			;$80A8F0
	STA sprite.render_order,x		;$80A8F2
	CMP $1C91				;$80A8F4
	BNE CODE_80A90B				;$80A8F7
	LDA sprite.x_speed,x			;$80A8F9
	BPL CODE_80A8FF				;$80A8FB
	STZ sprite.render_order,x		;$80A8FD
CODE_80A8FF:
	EOR #$FFFF				;$80A8FF
	INC					;$80A902
	CMP #$8000				;$80A903
	ROL					;$80A906
	STA sprite.x_speed,x			;$80A907
	STA sprite.max_x_speed,x		;$80A909
CODE_80A90B:
	INC sprite.state,x			;$80A90B
	LDA #$0565				;$80A90D
	JSL queue_sound_effect			;$80A910
CODE_80A914:
	LDA #$0012				;$80A914
	JSL process_alternate_movement		;$80A917
	BCS CODE_80A920				;$80A91B
	JML [$04F5]				;$80A91D

CODE_80A920:
	INC sprite.state,x			;$80A920
CODE_80A922:
	TYX					;$80A922
	LDA #$0080				;$80A923
	BIT $1C35				;$80A926
	BEQ CODE_80A96C				;$80A929
	LDA $1C8F				;$80A92B
	CMP sprite.general_purpose_6A,x		;$80A92E
	BNE CODE_80A965				;$80A930
	TAY					;$80A932
	STY current_game_mode			;$80A933
	LDA #$0001				;$80A936
	STA sprite.state,x			;$80A939
	LDA $1C37				;$80A93B
	STA sprite.general_purpose_6A,x		;$80A93E
	CPY #$0000				;$80A940
	BNE CODE_80A94A				;$80A943
	JSR CODE_80A257				;$80A945
	BRA CODE_80A94D				;$80A948

CODE_80A94A:
	JSR CODE_80A26D				;$80A94A
CODE_80A94D:
	LDY #$0014				;$80A94D
	LDA $1C8F				;$80A950
	BEQ CODE_80A958				;$80A953
	LDY #$0010				;$80A955
CODE_80A958:
	JSR CODE_809E0F				;$80A958
	LDA #$0666				;$80A95B
	JSL queue_sound_effect			;$80A95E
	JML [$04F5]				;$80A962

CODE_80A965:
	JSL delete_sprite_handle_deallocation	;$80A965
	JML [$04F5]				;$80A969

CODE_80A96C:
	LDA player_1_pressed			;$80A96C
	BIT #!input_left			;$80A96F
	BEQ CODE_80A98C				;$80A972
	JSR CODE_80A9A9				;$80A974
	LDA #$0003				;$80A977
	STA sprite.state,x			;$80A97A
	LDA #$0400				;$80A97C
	STA sprite.x_speed,x			;$80A97F
	STA sprite.max_x_speed,x		;$80A981
	LDA #$00A0				;$80A983
	STA $1C91				;$80A986
	JML [$04F5]				;$80A989

CODE_80A98C:
	BIT #!input_right			;$80A98C
	BEQ CODE_80A9A6				;$80A98F
	JSR CODE_80A9BA				;$80A991
	LDA #$0003				;$80A994
	STA sprite.state,x			;$80A997
	LDA #$FC00				;$80A999
	STA sprite.x_speed,x			;$80A99C
	STA sprite.max_x_speed,x		;$80A99E
	LDA #$0040				;$80A9A0
	STA $1C91				;$80A9A3
CODE_80A9A6:
	JML [$04F5]				;$80A9A6

CODE_80A9A9:
	LDA sprite.general_purpose_5E,x		;$80A9A9
	STA temp_1A				;$80A9AB
	LDA sprite.general_purpose_4C,x		;$80A9AD
	STA sprite.general_purpose_5E,x		;$80A9AF
	LDA sprite.general_purpose_4E,x		;$80A9B1
	STA sprite.general_purpose_4C,x		;$80A9B3
	LDA temp_1A				;$80A9B5
	STA sprite.general_purpose_4E,x		;$80A9B7
	RTS					;$80A9B9

CODE_80A9BA:
	LDA sprite.general_purpose_4E,x		;$80A9BA
	STA temp_1A				;$80A9BC
	LDA sprite.general_purpose_4C,x		;$80A9BE
	STA sprite.general_purpose_4E,x		;$80A9C0
	LDA sprite.general_purpose_5E,x		;$80A9C2
	STA sprite.general_purpose_4C,x		;$80A9C4
	LDA temp_1A				;$80A9C6
	STA sprite.general_purpose_5E,x		;$80A9C8
	RTS					;$80A9CA

CODE_80A9CB:
	LDA $1CAC				;$80A9CB
	EOR sprite.oam_property,x		;$80A9CE
	AND #$0E00				;$80A9D0
	EOR sprite.oam_property,x		;$80A9D3
	STA sprite.oam_property,x		;$80A9D5
	LDA $1CA8				;$80A9D7
	AND #$0E00				;$80A9DA
	ORA #$8002				;$80A9DD
	STA temp_1A				;$80A9E0
	EOR sprite.display_mode,x		;$80A9E2
	AND #$4000				;$80A9E4
	EOR temp_1A				;$80A9E7
	STA sprite.display_mode,x		;$80A9E9
	RTS					;$80A9EB

CODE_80A9EC:
	LDA $1CAA				;$80A9EC
	EOR sprite.oam_property,x		;$80A9EF
	AND #$0E00				;$80A9F1
	EOR sprite.oam_property,x		;$80A9F4
	STA sprite.oam_property,x		;$80A9F6
	LDA $1CA6				;$80A9F8
	AND #$0E00				;$80A9FB
	ORA #$8002				;$80A9FE
	STA temp_1A				;$80AA01
	EOR sprite.display_mode,x		;$80AA03
	AND #$4000				;$80AA05
	EOR temp_1A				;$80AA08
	STA sprite.display_mode,x		;$80AA0A
	RTS					;$80AA0C

CODE_80AA0D:
	TYX					;$80AA0D
	DEC sprite.general_purpose_62,x		;$80AA0E
	BNE CODE_80AA3E				;$80AA10
	LDA $1C37				;$80AA12
	ASL					;$80AA15
	ASL					;$80AA16
	TAX					;$80AA17
	SEP #$20				;$80AA18
	LDA $7EA1F4,x				;$80AA1A
	PHA					;$80AA1E
	LDA $7EA1F6,x				;$80AA1F
	STA $7EA1F4,x				;$80AA23
	PLA					;$80AA27
	STA $7EA1F6,x				;$80AA28
	REP #$20				;$80AA2C
	TYX					;$80AA2E
	LDA #$000C				;$80AA2F
	STA sprite.general_purpose_62,x		;$80AA32
	INC sprite.state,x			;$80AA34
	LDA #$0100				;$80AA36
	TSB $1C35				;$80AA39
	BRA CODE_80AA48				;$80AA3C

CODE_80AA3E:
	DEC sprite.y_position,x			;$80AA3E
	LDA #$0100				;$80AA40
	TRB $1C35				;$80AA43
	BNE CODE_80AA4B				;$80AA46
CODE_80AA48:
	JSR CODE_80AA89				;$80AA48
CODE_80AA4B:
	LDA active_frame_counter		;$80AA4B
	BIT #$0003				;$80AA4D
	BNE CODE_80AA55				;$80AA50
	JSR CODE_80AB05				;$80AA52
CODE_80AA55:
	LDA active_frame_counter		;$80AA55
	AND #$0003				;$80AA57
	EOR #$0003				;$80AA5A
	BNE CODE_80AA63				;$80AA5D
	LDX current_sprite			;$80AA5F
	INC sprite.x_position,x			;$80AA61
CODE_80AA63:
	JML [$04F5]				;$80AA63

CODE_80AA66:
	TYX					;$80AA66
	DEC sprite.general_purpose_62,x		;$80AA67
	BNE CODE_80AA79				;$80AA69
	LDA #$0001				;$80AA6B
	STA sprite.state,x			;$80AA6E
	LDA #$820F				;$80AA70
	JSL set_fade				;$80AA73
	BRA CODE_80AA83				;$80AA77

CODE_80AA79:
	INC sprite.y_position,x			;$80AA79
	LDA #$0100				;$80AA7B
	TRB $1C35				;$80AA7E
	BNE CODE_80AA86				;$80AA81
CODE_80AA83:
	JSR CODE_80AAC7				;$80AA83
CODE_80AA86:
	JML [$04F5]				;$80AA86

CODE_80AA89:
	LDY sprite.general_purpose_6A,x		;$80AA89
	LDA DATA_80C343,y			;$80AA8B
	AND #$00FF				;$80AA8E
	TAX					;$80AA91
	LDA $7EA18C,x				;$80AA92
	INC					;$80AA96
	STA $7EA18C,x				;$80AA97
	LDA DATA_80C343+$03,y			;$80AA9B
	AND #$00FF				;$80AA9E
	TAX					;$80AAA1
	LDA $7EA1B0,x				;$80AAA2
	INC					;$80AAA6
	STA $7EA1B0,x				;$80AAA7
	LDA $7EA1B5,x				;$80AAAB
	INC					;$80AAAF
	STA $7EA1B5,x				;$80AAB0
	LDA $7EA1AD,x				;$80AAB4
	DEC					;$80AAB8
	STA $7EA1AD,x				;$80AAB9
	LDA $7EA1B2,x				;$80AABD
	INC					;$80AAC1
	STA $7EA1B2,x				;$80AAC2
	RTS					;$80AAC6

CODE_80AAC7:
	LDY sprite.general_purpose_6A,x		;$80AAC7
	LDA DATA_80C343,y			;$80AAC9
	AND #$00FF				;$80AACC
	TAX					;$80AACF
	LDA $7EA18C,x				;$80AAD0
	DEC					;$80AAD4
	STA $7EA18C,x				;$80AAD5
	LDA DATA_80C343+$03,y			;$80AAD9
	AND #$00FF				;$80AADC
	TAX					;$80AADF
	LDA $7EA1B0,x				;$80AAE0
	DEC					;$80AAE4
	STA $7EA1B0,x				;$80AAE5
	LDA $7EA1B5,x				;$80AAE9
	DEC					;$80AAED
	STA $7EA1B5,x				;$80AAEE
	LDA $7EA1AD,x				;$80AAF2
	INC					;$80AAF6
	STA $7EA1AD,x				;$80AAF7
	LDA $7EA1B2,x				;$80AAFB
	DEC					;$80AAFF
	STA $7EA1B2,x				;$80AB00
	RTS					;$80AB04

CODE_80AB05:
	LDA $7EA1AE,x				;$80AB05
	DEC					;$80AB09
	STA $7EA1AE,x				;$80AB0A
	LDA $7EA1B3,x				;$80AB0E
	DEC					;$80AB12
	STA $7EA1B3,x				;$80AB13
	LDA DATA_80C343,y			;$80AB17
	AND #$00FF				;$80AB1A
	TAX					;$80AB1D
	LDA $7EA18A,x				;$80AB1E
	DEC					;$80AB22
	STA $7EA18A,x				;$80AB23
	RTS					;$80AB27

CODE_80AB28:
	TYX					;$80AB28
	INC sprite.state,x			;$80AB29
	LDA sprite.general_purpose_5C,x		;$80AB2B
	ASL					;$80AB2D
	ASL					;$80AB2E
	CLC					;$80AB2F
	ADC sprite.general_purpose_5C,x		;$80AB30
	CLC					;$80AB32
	ADC sprite.current_graphic,x		;$80AB33
	STA sprite.current_graphic,x		;$80AB35
	RTS					;$80AB37

file_select_cheat_handler_main:
	LDA #$4000				;$80AB38
	BIT $1C35				;$80AB3B
	BNE .skip_state				;$80AB3E
	JSR (.state_table,x)			;$80AB40
.skip_state:
	JML [$04F5]				;$80AB43

.state_table:
	dw CODE_80AB50
	dw CODE_80AB82
	dw CODE_80AB98
	dw CODE_80ABFE
	dw CODE_80AC14

CODE_80AB50:
	TYX					;$80AB50
	INC sprite.state,x			;$80AB51
	STZ player_active_pressed		;$80AB53
	JSR CODE_80A35A				;$80AB56
	LDA current_game_mode			;$80AB59
	BNE CODE_80AB61				;$80AB5C
	JSR CODE_80A369				;$80AB5E
CODE_80AB61:
	LDA #$0028				;$80AB61
	LDX language_select			;$80AB64
	CPX #$0002				;$80AB67
	BNE CODE_80AB6F				;$80AB6A
	LDA #$0029				;$80AB6C
CODE_80AB6F:
	STA $1C9E				;$80AB6F
	JSR CODE_80AC66				;$80AB72
	STZ $1C91				;$80AB75
	STZ $1C93				;$80AB78
	LDA #$0003				;$80AB7B
	STA $1C3B				;$80AB7E
	RTS					;$80AB81

CODE_80AB82:
	LDA #$0F00				;$80AB82
	STA $1D83				;$80AB85
	JSR CODE_80B28E				;$80AB88
	JSR CODE_80AC76				;$80AB8B
	JSR CODE_80AC9C				;$80AB8E
	JSR CODE_80A2AF				;$80AB91
	JSR CODE_80ACBE				;$80AB94
	RTS					;$80AB97

CODE_80AB98:
	JSL CODE_808411				;$80AB98
	LDA #$0002				;$80AB9C
	BIT $1C35				;$80AB9F
	BNE CODE_80ABC9				;$80ABA2
	LDA $1CA0				;$80ABA4
	CMP #$0027				;$80ABA7
	BNE CODE_80ABBE				;$80ABAA
	LDA #$4944				;$80ABAC
	STA $1C97				;$80ABAF
	LDA #$4958				;$80ABB2
	STA $1C99				;$80ABB5
	LDA #$00C5				;$80ABB8
	STA $1C9B				;$80ABBB
CODE_80ABBE:
	LDX #$0000				;$80ABBE
	JSR CODE_80ADB2				;$80ABC1
	LDA current_game_mode			;$80ABC4
	BNE CODE_80ABD4				;$80ABC7
CODE_80ABC9:
	LDA #$0040				;$80ABC9
	TSB $1C35				;$80ABCC
	JSL delete_sprite_handle_deallocation	;$80ABCF
	RTS					;$80ABD3

CODE_80ABD4:
	LDA #$0666				;$80ABD4
	JSL queue_sound_effect			;$80ABD7
	TYX					;$80ABDB
	INC sprite.state,x			;$80ABDC
	JSR CODE_80AC66				;$80ABDE
	STZ $1C91				;$80ABE1
	LDA #$0080				;$80ABE4
	TSB $1C35				;$80ABE7
	JSR CODE_80A366				;$80ABEA
	LDA #$0001				;$80ABED
	STA active_player			;$80ABF0
	INC					;$80ABF3
	STA $05B3				;$80ABF4
	LDY #$0012				;$80ABF7
	JSR CODE_809E0F				;$80ABFA
	RTS					;$80ABFD

CODE_80ABFE:
	LDA #$0F00				;$80ABFE
	STA $1D83				;$80AC01
	JSR CODE_80B28E				;$80AC04
	JSR CODE_80AC76				;$80AC07
	JSR CODE_80AC9C				;$80AC0A
	JSR CODE_80A2AF				;$80AC0D
	JSR CODE_80ACBE				;$80AC10
	RTS					;$80AC13

CODE_80AC14:
	STZ active_player			;$80AC14
	LDA #$0001				;$80AC17
	STA $05B3				;$80AC1A
	LDA current_game_mode			;$80AC1D
	CMP #!gamemode_2_player_contest		;$80AC20
	BEQ CODE_80AC2D				;$80AC23
	LDX #$0005				;$80AC25
	JSR CODE_80AC48				;$80AC28
	BRA CODE_80AC3D				;$80AC2B

CODE_80AC2D:
	JSR CODE_80939D				;$80AC2D
	JSL CODE_808411				;$80AC30
	LDX #$0000				;$80AC34
	JSR CODE_80AC48				;$80AC37
	JSR CODE_80939D				;$80AC3A
CODE_80AC3D:
	LDA #$0040				;$80AC3D
	TSB $1C35				;$80AC40
	JSL delete_sprite_handle_deallocation	;$80AC43
	RTS					;$80AC47

CODE_80AC48:
	LDA $1CA0				;$80AC48
	CMP #$0027				;$80AC4B
	BNE CODE_80AC62				;$80AC4E
	LDA #$494B				;$80AC50
	STA $1C97				;$80AC53
	LDA #$4444				;$80AC56
	STA $1C99				;$80AC59
	LDA #$00D9				;$80AC5C
	STA $1C9B				;$80AC5F
CODE_80AC62:
	JSR CODE_80ADB2				;$80AC62
	RTS					;$80AC65

CODE_80AC66:
	STZ $1CA2				;$80AC66
	LDA #$2700				;$80AC69
	STA $1CA4				;$80AC6C
	LDA #$0001				;$80AC6F
	STA $1CA0				;$80AC72
	RTS					;$80AC75

CODE_80AC76:
	SEP #$30				;$80AC76
	LDX #$05				;$80AC78
CODE_80AC7A:
	LDY $1CA0,x				;$80AC7A
	LDA DATA_80C650,y			;$80AC7D
	BNE CODE_80AC84				;$80AC80
	LDA #$20				;$80AC82
CODE_80AC84:
	STA $1C97,x				;$80AC84
	DEX					;$80AC87
	BPL CODE_80AC7A				;$80AC88
	LDX $1C91				;$80AC8A
	CPX #$05				;$80AC8D
	BEQ CODE_80AC96				;$80AC8F
	LDA #$20				;$80AC91
	STA $1C9C				;$80AC93
CODE_80AC96:
	STZ $1C9D				;$80AC96
	REP #$30				;$80AC99
	RTS					;$80AC9B

CODE_80AC9C:
	LDA player_active_held			;$80AC9C
	BNE CODE_80ACBD				;$80AC9F
	LDA active_frame_counter		;$80ACA1
	BIT #$0008				;$80ACA3
	BNE CODE_80ACBD				;$80ACA6
	LDX $1C91				;$80ACA8
	SEP #$30				;$80ACAB
	LDY $1C97,x				;$80ACAD
	LDA #$20				;$80ACB0
	CPY #$20				;$80ACB2
	BNE CODE_80ACB8				;$80ACB4
	LDA #$2A				;$80ACB6
CODE_80ACB8:
	STA $1C97,x				;$80ACB8
	REP #$30				;$80ACBB
CODE_80ACBD:
	RTS					;$80ACBD

CODE_80ACBE:
	LDX $1C91				;$80ACBE
	CPX #$0005				;$80ACC1
	BNE CODE_80ACD8				;$80ACC4
	LDA $1D83				;$80ACC6
	BIT #$0F00				;$80ACC9
	BEQ CODE_80ACD8				;$80ACCC
	LDA $1CA0,x				;$80ACCE
	EOR #$0001				;$80ACD1
	STA $1CA0,x				;$80ACD4
	RTS					;$80ACD7

CODE_80ACD8:
	LDA $1D83				;$80ACD8
	BIT #$0900				;$80ACDB
	BEQ CODE_80ACFA				;$80ACDE
	SEP #$20				;$80ACE0
	LDA $1CA0,x				;$80ACE2
	INC					;$80ACE5
	CMP $1C9E				;$80ACE6
	BCC CODE_80ACED				;$80ACE9
	LDA #$01				;$80ACEB
CODE_80ACED:
	STA $1CA0,x				;$80ACED
	REP #$20				;$80ACF0
	LDA #$0565				;$80ACF2
	JSL queue_sound_effect			;$80ACF5
	RTS					;$80ACF9

CODE_80ACFA:
	BIT #$0600				;$80ACFA
	BEQ CODE_80AD1A				;$80ACFD
	SEP #$20				;$80ACFF
	LDA $1CA0,x				;$80AD01
	BEQ CODE_80AD10				;$80AD04
	DEC					;$80AD06
	BNE CODE_80AD0D				;$80AD07
	LDA $1C9E				;$80AD09
	DEC					;$80AD0C
CODE_80AD0D:
	STA $1CA0,x				;$80AD0D
CODE_80AD10:
	REP #$20				;$80AD10
	LDA #$0565				;$80AD12
	JSL queue_sound_effect			;$80AD15
	RTS					;$80AD19

CODE_80AD1A:
	LDA player_active_pressed		;$80AD1A
	BIT #!input_A|!input_B			;$80AD1D
	BEQ CODE_80AD59				;$80AD20
	JSR CODE_80AD67				;$80AD22
	BCS CODE_80AD51				;$80AD25
	LDA $1C91				;$80AD27
	INC					;$80AD2A
	CMP #$0006				;$80AD2B
	BCS CODE_80AD92				;$80AD2E
	CMP #$0005				;$80AD30
	BCC CODE_80AD3E				;$80AD33
	SEP #$10				;$80AD35
	LDX #$27				;$80AD37
	STX $1CA5				;$80AD39
	REP #$10				;$80AD3C
CODE_80AD3E:
	STA $1C91				;$80AD3E
	TAX					;$80AD41
	SEP #$20				;$80AD42
	LDA $1CA0,x				;$80AD44
	BNE CODE_80AD4F				;$80AD47
	LDA $1C9F,x				;$80AD49
	STA $1CA0,x				;$80AD4C
CODE_80AD4F:
	REP #$20				;$80AD4F
CODE_80AD51:
	LDA #$0666				;$80AD51
	JSL queue_sound_effect			;$80AD54
	RTS					;$80AD58

CODE_80AD59:
	BIT #!input_start			;$80AD59
	BNE CODE_80AD92				;$80AD5C
	BIT #!input_left			;$80AD5E
	BEQ CODE_80AD66				;$80AD61
	DEC $1C91				;$80AD63
CODE_80AD66:
	RTS					;$80AD66

CODE_80AD67:
	LDX $1C91				;$80AD67
	LDA $1CA0,x				;$80AD6A
	AND #$00FF				;$80AD6D
	CMP #$0026				;$80AD70
	BNE CODE_80AD8D				;$80AD73
	SEP #$20				;$80AD75
	LDA $1C91				;$80AD77
	DEC					;$80AD7A
	BMI CODE_80AD87				;$80AD7B
	STA $1C91				;$80AD7D
	CMP #$04				;$80AD80
	BEQ CODE_80AD87				;$80AD82
	STZ $1CA0,x				;$80AD84
CODE_80AD87:
	REP #$20				;$80AD87
	SEC					;$80AD89
	RTS					;$80AD8A

CODE_80AD8B:
	CLC					;$80AD8B
	RTS					;$80AD8C

CODE_80AD8D:
	CMP #$0027				;$80AD8D
	BNE CODE_80AD8B				;$80AD90
CODE_80AD92:
	LDX $1C91				;$80AD92
	LDA #$0027				;$80AD95
	STA $1CA0,x				;$80AD98
	LDA #$0020				;$80AD9B
	STA $1C97,x				;$80AD9E
	LDA #$0A00				;$80ADA1
	STA $1C93				;$80ADA4
	LDA #$0080				;$80ADA7
	TRB $1C35				;$80ADAA
	LDX current_sprite			;$80ADAD
	INC sprite.state,x			;$80ADAF
	RTS					;$80ADB1

CODE_80ADB2:
	LDA $1C97				;$80ADB2
	STA $05D9,x				;$80ADB5
	LDA $1C98				;$80ADB8
	STA $05DA,x				;$80ADBB
	LDA $1C9A				;$80ADBE
	STA $05DC,x				;$80ADC1
	TXA					;$80ADC4
	CLC					;$80ADC5
	ADC $1C91				;$80ADC6
	TAX					;$80ADC9
	BEQ CODE_80ADD5				;$80ADCA
	LDA $05D8,x				;$80ADCC
	ORA #$0080				;$80ADCF
	STA $05D8,x				;$80ADD2
CODE_80ADD5:
	SEP #$20				;$80ADD5
	LDA #$A0				;$80ADD7
	STA $1C9C				;$80ADD9
	REP #$20				;$80ADDC
	JSR CODE_809FED				;$80ADDE
	JSR CODE_80A2A5				;$80ADE1
	LDY current_sprite			;$80ADE4
	RTS					;$80ADE6

play_mode_text_main:
	JMP (.state_table,x)			;$80ADE7  |>

.state_table:
	dw .init
	dw .state_1

.init:
	TYX					;$80ADEE  \
	INC sprite.state,x			;$80ADEF   |
	LDA sprite.current_graphic,x		;$80ADF1   |
	STA sprite.general_purpose_5C,x		;$80ADF3  /
.state_1:
	TYX					;$80ADF5  \
	LDA $1C3B				;$80ADF6   |
	ASL					;$80ADF9   |
	ASL					;$80ADFA   |
	TAY					;$80ADFB   |
	CLC					;$80ADFC   |
	ADC $1C3B				;$80ADFD   |
	CLC					;$80AE00   |
	ADC sprite.general_purpose_5C,x		;$80AE01   |
	STA sprite.current_graphic,x		;$80AE03   |
	LDA DATA_80C32E,y			;$80AE05   |
	STA sprite.x_position,x			;$80AE08   |
	LDA DATA_80C32E+$02,y			;$80AE0A   |
	STA temp_1A				;$80AE0D   |
	LDA $1C37				;$80AE0F   |
	ASL					;$80AE12   |
	TAY					;$80AE13   |
	LDA DATA_80C322,y			;$80AE14   |
	CLC					;$80AE17   |
	ADC temp_1A				;$80AE18   |
	STA sprite.y_position,x			;$80AE1A   |
	LDA #$2000				;$80AE1C   |
	BIT $1C35				;$80AE1F   |
	BNE CODE_80AE35				;$80AE22   |
	LDA active_frame_counter		;$80AE24   |
	BIT #$0010				;$80AE26   |
	BNE CODE_80AE32				;$80AE29   |
	LDA sprite.x_position,x			;$80AE2B   |
	EOR #$0100				;$80AE2D   |
	STA sprite.x_position,x			;$80AE30  /
CODE_80AE32:
	JML [$04F5]				;$80AE32  |>

CODE_80AE35:
	LDA sprite.x_position,x			;$80AE35  \
	ORA #$0100				;$80AE37   |
	STA sprite.x_position,x			;$80AE3A   |
	BRA CODE_80AE32				;$80AE3C  /

CODE_80AE3E:
	JSR CODE_809437				;$80AE3E
	LDA #$00CF				;$80AE41
	JSL CODE_BB859A				;$80AE44
	ORA #$3000				;$80AE48
	CLC					;$80AE4B
	ADC #$01C0				;$80AE4C
	STA $B4					;$80AE4F
	LDA #$002A				;$80AE51
	JSL vram_payload_handler_global		;$80AE54
	LDA #$0028				;$80AE58
	JSL set_PPU_registers_global		;$80AE5B
	STZ PPU.set_window_layer_all		;$80AE5F
	LDA #$002E				;$80AE62
	LDX #$0020				;$80AE65
	LDY #$0000				;$80AE68
	JSL CODE_BB856D				;$80AE6B
	LDX #$F000				;$80AE6F
	LDY #$007E				;$80AE72
	LDA #$0800				;$80AE75
	JSL CODE_808CEC				;$80AE78
	SEP #$20				;$80AE7C
	LDX #$3001				;$80AE7E
	STX HDMA[$01].settings			;$80AE81
	LDX #$A15A				;$80AE84
	STX HDMA[$01].source_word		;$80AE87
	LDA #$7E				;$80AE8A
	STA HDMA[$01].source_bank		;$80AE8C
	STA HDMA[$01].indirect_source_bank	;$80AE8F
	LDX #$2C01				;$80AE92
	STX HDMA[$02].settings			;$80AE95
	LDX #$A164				;$80AE98
	STX HDMA[$02].source_word		;$80AE9B
	LDA #$7E				;$80AE9E
	STA HDMA[$02].source_bank		;$80AEA0
	STA HDMA[$02].indirect_source_bank	;$80AEA3
	REP #$20				;$80AEA6
	LDA #$0601				;$80AEA8
	STA pending_dma_hdma_channels		;$80AEAB
	LDA #$0020				;$80AEAE
	STA $7EA15A				;$80AEB1
	LDA #$0102				;$80AEB5
	STA $7EA15B				;$80AEB8
	LDA #$0060				;$80AEBC
	STA $7EA15D				;$80AEBF
	LDA #$0102				;$80AEC3
	STA $7EA15E				;$80AEC6
	LDA #$0060				;$80AECA
	STA $7EA160				;$80AECD
	LDA #$4102				;$80AED1
	STA $7EA161				;$80AED4
	LDA #$0000				;$80AED8
	STA $7EA163				;$80AEDB
	STA $7EA16D				;$80AEDF
	LDA #$0050				;$80AEE3
	STA $7EA164				;$80AEE6
	STA $7EA167				;$80AEEA
	STA $7EA16A				;$80AEEE
	LDA #$1605				;$80AEF2
	STA $7EA165				;$80AEF5
	STA $7EA168				;$80AEF9
	LDA #$1201				;$80AEFD
	STA $7EA16B				;$80AF00
	LDA #$0020				;$80AF04
	BIT $05B1				;$80AF07
	BEQ CODE_80AF0F				;$80AF0A
	JSR CODE_8091A9				;$80AF0C
CODE_80AF0F:
	LDA #$0001				;$80AF0F
	STA $06DA				;$80AF12
	JSR CODE_80AF3E				;$80AF15
	JSL DMA_queued_sprite_palette_global	;$80AF18
	JSL DMA_queued_sprite_palette_global	;$80AF1C
	JSL DMA_queued_sprite_palette_global	;$80AF20
	JSL DMA_queued_sprite_palette_global	;$80AF24
	LDA #$0200				;$80AF28
	JSL set_fade				;$80AF2B
	LDA #$0001				;$80AF2F
	TRB game_state_flags			;$80AF32
	LDA #CODE_80B1ED			;$80AF35
	LDX.w #CODE_80B1ED>>16			;$80AF38
	JMP CODE_8083C3				;$80AF3B

CODE_80AF3E:
	LDA #DATA_B6F42C			;$80AF3E
	STA $46					;$80AF41
	LDA.w #DATA_B6F42C>>16			;$80AF43
	STA $48					;$80AF46
	STZ temp_36				;$80AF48
	LDX #$3EFF				;$80AF4A
	JSR CODE_80B040				;$80AF4D
	LDA #$2000				;$80AF50
	STA $1CAE				;$80AF53
	STZ $1CC8				;$80AF56
	LDA current_game_mode			;$80AF59
	BEQ CODE_80AFA9				;$80AF5C
	CMP #!gamemode_2_player_contest		;$80AF5E
	BEQ CODE_80AF7A				;$80AF61
	LDX #$05D9				;$80AF63
	JSR CODE_80B054				;$80AF66
	LDX #$C649				;$80AF69
	JSR CODE_80B054				;$80AF6C
	LDX #$05DE				;$80AF6F
	JSR CODE_80B054				;$80AF72
	JSR CODE_80B076				;$80AF75
	BRA CODE_80AFB2				;$80AF78

CODE_80AF7A:
	LDA active_player			;$80AF7A
	PHA					;$80AF7D
	BEQ CODE_80AF83				;$80AF7E
	JSR CODE_80939D				;$80AF80
CODE_80AF83:
	LDX #$05D9				;$80AF83
	JSR CODE_80B054				;$80AF86
	LDX #$C64C				;$80AF89
	JSR CODE_80B054				;$80AF8C
	JSR CODE_80939D				;$80AF8F
	LDX #$05D9				;$80AF92
	JSR CODE_80B054				;$80AF95
	JSR CODE_80939D				;$80AF98
	PLA					;$80AF9B
	BEQ CODE_80AFA1				;$80AF9C
	JSR CODE_80939D				;$80AF9E
CODE_80AFA1:
	JSR CODE_809FED				;$80AFA1
	JSR CODE_80B076				;$80AFA4
	BRA CODE_80AFDF				;$80AFA7

CODE_80AFA9:
	LDX #$05D9				;$80AFA9
	JSR CODE_80B054				;$80AFAC
	JSR CODE_80B076				;$80AFAF
CODE_80AFB2:
	LDA #$3800				;$80AFB2
	STA $1CAE				;$80AFB5
	LDA #$0000				;$80AFB8
	JSR CODE_80B098				;$80AFBB
	LDA #$0102				;$80AFBE
	STA $7EA161				;$80AFC1
	LDA #$FFD3				;$80AFC5
	STA $1973				;$80AFC8
	SEP #$20				;$80AFCB
	STA PPU.layer_2_scroll_y		;$80AFCD
	XBA					;$80AFD0
	STA PPU.layer_2_scroll_y		;$80AFD1
	XBA					;$80AFD4
	STA PPU.layer_3_scroll_y		;$80AFD5
	XBA					;$80AFD8
	STA PPU.layer_3_scroll_y		;$80AFD9
	REP #$20				;$80AFDC
	RTS					;$80AFDE

CODE_80AFDF:
	LDA #$3800				;$80AFDF
	STA $1CAE				;$80AFE2
	LDA $05B1				;$80AFE5
	PHA					;$80AFE8
	LDA active_player			;$80AFE9
	PHA					;$80AFEC
	BEQ CODE_80AFFD				;$80AFED
	LDA #$0102				;$80AFEF
	STA $7EA161				;$80AFF2
	LDA #$4102				;$80AFF6
	STA $7EA15E				;$80AFF9
CODE_80AFFD:
	JSR CODE_8093AD				;$80AFFD
	LDA #$0000				;$80B000
	JSR CODE_80B098				;$80B003
	JSR CODE_8093BA				;$80B006
	JSR CODE_809FED				;$80B009
	LDA #$0300				;$80B00C
	JSR CODE_80B098				;$80B00F
	PLA					;$80B012
	STA active_player			;$80B013
	JSR CODE_8093FF				;$80B016
	PLA					;$80B019
	STA $05B1				;$80B01A
	LDA #$FFFF				;$80B01D
	STA $1973				;$80B020
	LDA #$0020				;$80B023
	BIT $05B1				;$80B026
	BNE CODE_80B039				;$80B029
	LDA #$0102				;$80B02B
	STA $7EA161				;$80B02E
	LDA #$0102				;$80B032
	STA $7EA15E				;$80B035
CODE_80B039:
	LDA #$0201				;$80B039
	STA pending_dma_hdma_channels		;$80B03C
	RTS					;$80B03F

CODE_80B040:
	JSR CODE_809FED				;$80B040
	TXA					;$80B043
	LDX #$F000				;$80B044
	LDY #$0400				;$80B047
CODE_80B04A:
	STA $7E0000,x				;$80B04A
	INX					;$80B04E
	INX					;$80B04F
	DEY					;$80B050
	BPL CODE_80B04A				;$80B051
	RTS					;$80B053

CODE_80B054:
	SEP #$20				;$80B054
	LDY $1CC8				;$80B056
	LDA $00,x				;$80B059
	BIT #$80				;$80B05B
	BNE CODE_80B06A				;$80B05D
CODE_80B05F:
	STA $1CB4,y				;$80B05F
	INY					;$80B062
	INX					;$80B063
	LDA $00,x				;$80B064
	BIT #$80				;$80B066
	BEQ CODE_80B05F				;$80B068
CODE_80B06A:
	AND #$7F				;$80B06A
	STA $1CB4,y				;$80B06C
	INY					;$80B06F
	STY $1CC8				;$80B070
	REP #$20				;$80B073
	RTS					;$80B075

CODE_80B076:
	LDY $1CC8				;$80B076
	LDA $1CB3,y				;$80B079
	ORA #$0080				;$80B07C
	STA $1CB3,y				;$80B07F
	LDA #$0020				;$80B082
	SEC					;$80B085
	SBC $1CC8				;$80B086
	AND #$00FE				;$80B089
	CLC					;$80B08C
	ADC #$0040				;$80B08D
	TAY					;$80B090
	LDX #$1CB4				;$80B091
	JSR CODE_80A547				;$80B094
	RTS					;$80B097

CODE_80B098:
	STA temp_36				;$80B098
	LSR					;$80B09A
	LSR					;$80B09B
	LSR					;$80B09C
	STA temp_34				;$80B09D
	JSR CODE_809FED				;$80B09F
	LDA $C2					;$80B0A2
	STA temp_1A				;$80B0A4
	STA temp_26				;$80B0A6
	LDA $C4					;$80B0A8
	STA temp_1C				;$80B0AA
	STA temp_28				;$80B0AC
	JSR CODE_80A6A9				;$80B0AE
	LDA temp_40				;$80B0B1
	LDX #$0002				;$80B0B3
	LDY #$0110				;$80B0B6
	JSR CODE_80A4DC				;$80B0B9
	LDA temp_3E				;$80B0BC
	LDX #$0002				;$80B0BE
	LDY #$0116				;$80B0C1
	JSR CODE_80A4DC				;$80B0C4
	JSR CODE_80B18E				;$80B0C7
	LDX #$0003				;$80B0CA
	LDY #$011E				;$80B0CD
	JSR CODE_80A4DC				;$80B0D0
	LDX #DATA_80C647			;$80B0D3
	LDY #$0114				;$80B0D6
	JSR CODE_80A547				;$80B0D9
	LDX #DATA_80C648			;$80B0DC
	LDY #$0124				;$80B0DF
	JSR CODE_80A547				;$80B0E2
	LDA $05CF				;$80B0E5
	LDX #$0002				;$80B0E8
	LDY #$012E				;$80B0EB
	JSR CODE_80A4DC				;$80B0EE
	LDA $05C9				;$80B0F1
	LDX #$0002				;$80B0F4
	LDY #$01CE				;$80B0F7
	JSR CODE_80A4DC				;$80B0FA
	LDA $05CB				;$80B0FD
	LDX #$0002				;$80B100
	LDY #$01DA				;$80B103
	JSR CODE_80A4DC				;$80B106
	LDA $05CD				;$80B109
	LDX #$0002				;$80B10C
	LDY #$01E6				;$80B10F
	JSR CODE_80A4DC				;$80B112
	LDX #$0003				;$80B115
CODE_80B118:
	TXA					;$80B118
	PHX					;$80B119
	ASL					;$80B11A
	TAX					;$80B11B
	LDY DATA_80C31A,x			;$80B11C
	JSL CODE_BB85B8				;$80B11F
	LDX alternate_sprite			;$80B123
	LDA sprite.y_position,x			;$80B125
	CLC					;$80B127
	ADC temp_34				;$80B128
	STA sprite.y_position,x			;$80B12A
	JSL CODE_B38006				;$80B12C
	STZ $1560				;$80B130
	STZ $155E				;$80B133
	PLX					;$80B136
	DEX					;$80B137
	BPL CODE_80B118				;$80B138
	LDY #$0264				;$80B13A
	JSL CODE_BB85B5				;$80B13D
	LDX alternate_sprite			;$80B141
	LDA #$00BD				;$80B143
	STA sprite.x_position,x			;$80B146
	LDA #$0039				;$80B148
	CLC					;$80B14B
	ADC temp_34				;$80B14C
	STA sprite.y_position,x			;$80B14E
	LDA $0603				;$80B150
	STA sprite.general_purpose_5E,x		;$80B153
	LDY #$0260				;$80B155
	JSL CODE_BB85B8				;$80B158
	LDX alternate_sprite			;$80B15C
	LDA sprite.y_position,x			;$80B15E
	CLC					;$80B160
	ADC temp_34				;$80B161
	STA sprite.y_position,x			;$80B163
	LDY #$025C				;$80B165
	JSL CODE_BB85B8				;$80B168
	LDX alternate_sprite			;$80B16C
	STX $18E7				;$80B16E
	LDA $0605				;$80B171
	STA sprite.general_purpose_68,x		;$80B174
	LDA $0607				;$80B176
	STA sprite.general_purpose_6A,x		;$80B179
	LDA #$00C8				;$80B17B
	STA sprite.x_position,x			;$80B17E
	LDA #$005B				;$80B180
	CLC					;$80B183
	ADC temp_34				;$80B184
	STA sprite.y_position,x			;$80B186
	LDA #$0200				;$80B188
	STA sprite.state,x			;$80B18B
	RTS					;$80B18D

CODE_80B18E:
	STZ temp_1A				;$80B18E
	LDX #$004C				;$80B190
CODE_80B193:
	LDA $0632,x				;$80B193
	BIT #$0002				;$80B196
	BEQ CODE_80B19D				;$80B199
	INC temp_1A				;$80B19B
CODE_80B19D:
	AND #$001C				;$80B19D
	EOR #$001C				;$80B1A0
	BNE CODE_80B1A7				;$80B1A3
	INC temp_1A				;$80B1A5
CODE_80B1A7:
	DEX					;$80B1A7
	CPX #$0010				;$80B1A8
	BCS CODE_80B193				;$80B1AB
	DEC temp_1A				;$80B1AD
	LDA $0655				;$80B1AF
	BIT #$0002				;$80B1B2
	BEQ CODE_80B1B9				;$80B1B5
	INC temp_1A				;$80B1B7
CODE_80B1B9:
	BIT #$0200				;$80B1B9
	BEQ CODE_80B1C0				;$80B1BC
	INC temp_1A				;$80B1BE
CODE_80B1C0:
	LDA #$0040				;$80B1C0
	BIT $05B1				;$80B1C3
	BEQ CODE_80B1CA				;$80B1C6
	INC temp_1A				;$80B1C8
CODE_80B1CA:
	LDA temp_1A				;$80B1CA
	CMP #$0067				;$80B1CC
	BNE CODE_80B1EA				;$80B1CF
	LDA $06A1				;$80B1D1
	AND #$C000				;$80B1D4
	BNE CODE_80B1DB				;$80B1D7
	INC temp_1A				;$80B1D9
CODE_80B1DB:
	LDA $06A1				;$80B1DB
	AND #$8080				;$80B1DE
	EOR #$8080				;$80B1E1
	BNE CODE_80B1EA				;$80B1E4
	INC temp_1A				;$80B1E6
	INC temp_1A				;$80B1E8
CODE_80B1EA:
	LDA temp_1A				;$80B1EA
	RTS					;$80B1EC

CODE_80B1ED:
	LDA pending_dma_hdma_channels		;$80B1ED
	STA CPU.enable_dma_hdma			;$80B1F0
	LDX #$7400				;$80B1F3
	STX PPU.vram_address			;$80B1F6
	LDA #$F000				;$80B1F9
	STA DMA[0].source_word			;$80B1FC
	STA DMA[0].unused_2			;$80B1FF
	LDA #$0800				;$80B202
	STA DMA[0].size				;$80B205
	LDA #$1801				;$80B208
	STA DMA[0].settings			;$80B20B
	SEP #$20				;$80B20E
	LDA #$7E				;$80B210
	STA DMA[0].source_bank			;$80B212
	LDA #$01				;$80B215
	STA CPU.enable_dma			;$80B217
	REP #$20				;$80B21A
	JSL CODE_B38006				;$80B21C
	JSL DMA_queued_sprite_palette_global	;$80B220
	SEP #$20				;$80B224
	LDA screen_brightness			;$80B226
	STA PPU.screen				;$80B229
	REP #$20				;$80B22C
	STZ $1560				;$80B22E
	STZ $155E				;$80B231
	LDA screen_brightness			;$80B234
	BIT #$FF00				;$80B237
	BNE CODE_80B24C				;$80B23A
	JSL CODE_8089CA				;$80B23C
	LDA player_active_pressed		;$80B240
	AND #$9180				;$80B243 A/B/Right/Start
	BEQ CODE_80B24C				;$80B246
	JSL CODE_B8807E				;$80B248
CODE_80B24C:
	JSL CODE_B7800C				;$80B24C
	JSL sprite_handler			;$80B250
	JSL CODE_B7800F				;$80B254
	JSL CODE_80898C				;$80B258
	JSR CODE_809741				;$80B25C
	BEQ CODE_80B264				;$80B25F
	JMP CODE_808384				;$80B261

CODE_80B264:
	LDA #$0020				;$80B264
	BIT $05B1				;$80B267
	BNE CODE_80B282				;$80B26A
	LDA #$0500				;$80B26C
	JSL queue_sound_effect			;$80B26F
	LDA #$0020				;$80B273
	TSB $05B1				;$80B276
	LDA #CODE_809489			;$80B279
	LDX.w #CODE_809489>>16			;$80B27C
	JMP CODE_8083C3				;$80B27F

CODE_80B282:
	STZ $05E3				;$80B282
	LDA #CODE_B48000			;$80B285
	LDX.w #CODE_B48000>>16			;$80B288
	JMP CODE_8083C3				;$80B28B

CODE_80B28E:
	LDA player_active_held			;$80B28E
	AND $1D83				;$80B291
	BNE CODE_80B29A				;$80B294
	STZ $1D83				;$80B296
	RTS					;$80B299

CODE_80B29A:
	LDA player_active_pressed		;$80B29A
	AND $1D83				;$80B29D
	BNE CODE_80B2BE				;$80B2A0
	LDA $1D81				;$80B2A2
	BEQ CODE_80B2AE				;$80B2A5
	DEC $1D81				;$80B2A7
	STZ $1D83				;$80B2AA
	RTS					;$80B2AD

CODE_80B2AE:
	LDA #$0002				;$80B2AE
	STA $1D81				;$80B2B1
	LDA player_active_held			;$80B2B4
	AND $1D83				;$80B2B7
	STA $1D83				;$80B2BA
	RTS					;$80B2BD

CODE_80B2BE:
	STA $1D83				;$80B2BE
	LDA #$0010				;$80B2C1
	STA $1D81				;$80B2C4
	RTS					;$80B2C7

CODE_80B2C8:
	PHK					;$80B2C8
	PLB					;$80B2C9
	LDA #$4001				;$80B2CA
	TRB game_state_flags			;$80B2CD
	STZ current_animal_type			;$80B2D0
	LDA #$1D93				;$80B2D2
	STA $0541				;$80B2D5
	LDA #$0040				;$80B2D8
	STA $053D				;$80B2DB
	LDA $05E3				;$80B2DE
	ASL					;$80B2E1
	ASL					;$80B2E2
	ASL					;$80B2E3
	TAX					;$80B2E4
	LDA photo_album_sequence_data+$06,x	;$80B2E5
	BMI CODE_80B32B				;$80B2E8
	STA $051D				;$80B2EA
	LDA photo_album_sequence_data+$04,x	;$80B2ED
	AND #$00FF				;$80B2F0
	STA level_number			;$80B2F3
	STZ $05B7				;$80B2F5
	LDA photo_album_sequence_data+$02,x	;$80B2F8
	SEC					;$80B2FB
	SBC #$039A				;$80B2FC
	STA $BE					;$80B2FF
	LDA photo_album_sequence_data+$05,x	;$80B301
	AND #$00FF				;$80B304
	BEQ CODE_80B31B				;$80B307
	STA $BA					;$80B309
	LDA #CODE_80B378			;$80B30B
	STA $4E					;$80B30E
	LDA.w #CODE_80B378>>16			;$80B310
	STA $50					;$80B313
	LDA #CODE_808370			;$80B315
	JMP set_and_wait_for_nmi_direct		;$80B318

CODE_80B31B:
	LDA #CODE_808493			;$80B31B
	STA $4E					;$80B31E
	LDA.w #CODE_808493>>16			;$80B320
	STA $50					;$80B323
	LDA #CODE_8083CC			;$80B325
	JMP set_and_wait_for_nmi_direct		;$80B328

CODE_80B32B:
	LDX #CODE_80B33D			;$80B32B
	LDY.w #CODE_80B33D>>16			;$80B32E
	STX $4E					;$80B331
	STY $50					;$80B333
	STZ active_frame_counter		;$80B335
	LDA #CODE_808370			;$80B337
	JMP set_and_wait_for_nmi_direct		;$80B33A

CODE_80B33D:
	LDA active_frame_counter		;$80B33D
	BIT #$0040				;$80B33F
	BNE CODE_80B363				;$80B342
	BIT #$000F				;$80B344
	BNE CODE_80B358				;$80B347
	AND #$0030				;$80B349
	LSR					;$80B34C
	LSR					;$80B34D
	LSR					;$80B34E
	TAX					;$80B34F
	LDA.l DATA_80B35B,x			;$80B350
	JSL CODE_B28027				;$80B354
CODE_80B358:
	JMP CODE_808387				;$80B358

DATA_80B35B:
	dw $0763
	dw $0764
	dw $077E
	dw $077F

CODE_80B363:
	LDA #$0004				;$80B363
	STA $BA					;$80B366
	LDX #CODE_B284D6			;$80B368
	LDY.w #CODE_B284D6>>16			;$80B36B
	STX $4E					;$80B36E
	STY $50					;$80B370
	LDA #CODE_808370			;$80B372
	JMP set_and_wait_for_nmi_direct		;$80B375

CODE_80B378:
	PHK					;$80B378
	PLB					;$80B379
	JSL disable_screen_wrapper		;$80B37A
	JSL init_registers_global		;$80B37E
	JSL clear_vram_global			;$80B382
	JSL CODE_808CB0				;$80B386
	JSL CODE_BB857F				;$80B38A
	LDA #$0200				;$80B38E
	STA DMA[0].source_word			;$80B391
	STA DMA[0].unused_2			;$80B394
	LDA #$0220				;$80B397
	STA DMA[0].size				;$80B39A
	LDA #$0400				;$80B39D
	STA DMA[0].settings			;$80B3A0
	SEP #$20				;$80B3A3
	STZ DMA[0].source_bank			;$80B3A5
	LDA #$01				;$80B3A8
	STA CPU.enable_dma			;$80B3AA
	REP #$20				;$80B3AD
	LDA #$0001				;$80B3AF
	TRB game_state_flags			;$80B3B2
	LDA #$1300				;$80B3B5
	STA $80					;$80B3B8
	LDA #$0001				;$80B3BA
	STA pending_dma_hdma_channels		;$80B3BD
	LDA #$000F				;$80B3C0
	JSL CODE_BB859A				;$80B3C3
	ORA #$3000				;$80B3C7
	CLC					;$80B3CA
	ADC #$01C0				;$80B3CB
	STA $B4					;$80B3CE
	LDA #$1000				;$80B3D0
	TSB $05B1				;$80B3D3
	BNE CODE_80B413				;$80B3D6
	LDA #!music_baddies_on_parade		;$80B3D8
	JSL play_song				;$80B3DB
	LDA #$8000				;$80B3DF
	TSB game_state_flags			;$80B3E2
	STZ $05E3				;$80B3E5
	LDA #$004D				;$80B3E8
	LDY #$0000				;$80B3EB
	LDX #$0008				;$80B3EE
	JSL CODE_BB856D				;$80B3F1
	LDA #$0038				;$80B3F5
	JSL vram_payload_handler_global		;$80B3F8
	LDA #$0031				;$80B3FC
	JSL set_PPU_registers_global		;$80B3FF
	LDA #$FFFC				;$80B403
	SEP #$20				;$80B406
	STA PPU.layer_1_scroll_x		;$80B408
	XBA					;$80B40B
	STA PPU.layer_1_scroll_x		;$80B40C
	REP #$20				;$80B40F
	BRA CODE_80B44D				;$80B411

CODE_80B413:
	LDA #$004E				;$80B413
	LDY #$0010				;$80B416
	LDX #$0004				;$80B419
	JSL CODE_BB856D				;$80B41C
	LDA #$0039				;$80B420
	JSL vram_payload_handler_global		;$80B423
	LDA #$0031				;$80B427
	JSL set_PPU_registers_global		;$80B42A
	JSR CODE_80957A				;$80B42E
	LDY #$032A				;$80B431
	JSL CODE_BB8588				;$80B434
	LDA $BA					;$80B438
	DEC					;$80B43A
	ASL					;$80B43B
	CLC					;$80B43C
	ADC #$003A				;$80B43D
	TAX					;$80B440
	LDY #$FFDF				;$80B441
	JSR CODE_809F29				;$80B444
	LDA #$1D93				;$80B447
	STA $0541				;$80B44A
CODE_80B44D:
	LDA #$0200				;$80B44D
	JSL set_fade				;$80B450
	LDA #CODE_80B45D			;$80B454
	LDX.w #CODE_80B45D>>16			;$80B457
	JMP CODE_8083C3				;$80B45A

CODE_80B45D:
	LDA pending_dma_hdma_channels		;$80B45D
	STA CPU.enable_dma_hdma			;$80B460
	JSL CODE_B38006				;$80B463
	JSL DMA_queued_sprite_palette_global	;$80B467
	SEP #$20				;$80B46B
	LDA screen_brightness			;$80B46D
	STA PPU.screen				;$80B470
	REP #$20				;$80B473
	STZ $1560				;$80B475
	STZ $155E				;$80B478
	JSL sprite_handler			;$80B47B
	LDA $F4					;$80B47F
	CMP #$012C				;$80B481
	BCC CODE_80B48A				;$80B484
	JSL CODE_B8807E				;$80B486
CODE_80B48A:
	JSL CODE_B7800C				;$80B48A
	JSL CODE_B6804B				;$80B48E
	JSL CODE_80898C				;$80B492
	JSR CODE_809741				;$80B496
	BEQ CODE_80B49E				;$80B499
	JMP CODE_808384				;$80B49B

CODE_80B49E:
	LDA $BA					;$80B49E
	CMP #$00FF				;$80B4A0
	BEQ CODE_80B4B5				;$80B4A3
	LDA #CODE_808493			;$80B4A5
	STA $4E					;$80B4A8
	LDA.w #CODE_808493>>16			;$80B4AA
	STA $50					;$80B4AD
	LDA #CODE_8083CC			;$80B4AF
	JMP set_and_wait_for_nmi_direct		;$80B4B2

CODE_80B4B5:
	INC $05E3				;$80B4B5
	LDA #CODE_80B2C8			;$80B4B8
	STA $4E					;$80B4BB
	LDA.w #CODE_80B2C8>>16			;$80B4BD
	STA $50					;$80B4C0
	LDA #CODE_808362			;$80B4C2
	JMP set_and_wait_for_nmi_direct		;$80B4C5

CODE_80B4C8:
	JSL CODE_8092EB				;$80B4C8
	STZ $053F				;$80B4CC
	JSR CODE_80B18E				;$80B4CF
	LDA #$0800				;$80B4D2
	TSB $05B1				;$80B4D5
	LDA #$0040				;$80B4D8
	BIT $05B1				;$80B4DB
	BEQ CODE_80B4E8				;$80B4DE
	LDA #$0080				;$80B4E0
	BIT $05B1				;$80B4E3
	BEQ CODE_80B539				;$80B4E6
CODE_80B4E8:
	LDA #$FFF0				;$80B4E8
	STA temp_1C				;$80B4EB
	LDX #$0040				;$80B4ED
CODE_80B4F0:
	LDA $B06021,x				;$80B4F0
	AND #$00FF				;$80B4F4
	CMP $1A					;$80B4F7
	BMI CODE_80B511				;$80B4F9
	BNE CODE_80B521				;$80B4FB
	LDA $B0601F,x				;$80B4FD
	CMP $C4					;$80B501
	BEQ CODE_80B509				;$80B503
	BPL CODE_80B511				;$80B505
	BRA CODE_80B521				;$80B507

CODE_80B509:
	LDA $B0601D,x				;$80B509
	CMP $C2					;$80B50D
	BMI CODE_80B521				;$80B50F
CODE_80B511:
	LDA temp_1C				;$80B511
	CLC					;$80B513
	ADC #$0010				;$80B514
	STA temp_1C				;$80B517
	TXA					;$80B519
	SEC					;$80B51A
	SBC #$0010				;$80B51B
	TAX					;$80B51E
	BPL CODE_80B4F0				;$80B51F
CODE_80B521:
	LDA temp_1C				;$80B521
	BMI CODE_80B539				;$80B523
	JSR CODE_80B53B				;$80B525
	JSR CODE_80BBCB				;$80B528
	LDA temp_3E				;$80B52B
	STA $B0600E				;$80B52D
	LDA temp_40				;$80B531
	STA $B06010				;$80B533
	SEC					;$80B537
	RTL					;$80B538

CODE_80B539:
	CLC					;$80B539
	RTL					;$80B53A

CODE_80B53B:
	PHX					;$80B53B
	STX temp_3E				;$80B53C
	LDA #$0040				;$80B53E
	SEC					;$80B541
	SBC temp_3E				;$80B542
	LSR					;$80B544
	LSR					;$80B545
	LSR					;$80B546
	LSR					;$80B547
	STA $053F				;$80B548
	LDX #$6051				;$80B54B
	LDY #$6061				;$80B54E
	LDA temp_1C				;$80B551
	BEQ CODE_80B55B				;$80B553
	DEC					;$80B555
	MVP $B0, $B0				;$80B556
	PHK					;$80B559
	PLB					;$80B55A
CODE_80B55B:
	PLA					;$80B55B
	CLC					;$80B55C
	ADC #$0010				;$80B55D
	TAX					;$80B560
	LDA temp_1A				;$80B561
	SEP #$20				;$80B563
	STA $B06021,x				;$80B565
	REP #$20				;$80B569
	LDA $C2					;$80B56B
	STA $B0601D,x				;$80B56D
	LDA $C4					;$80B571
	STA $B0601F,x				;$80B573
	LDA current_game_mode			;$80B577
	STA $B06012,x				;$80B57A
	LDY #$0000				;$80B57E
	INX					;$80B581
CODE_80B582:
	LDA $05D9,y				;$80B582
	STA $B06012,x				;$80B585
	INX					;$80B589
	INX					;$80B58A
	INY					;$80B58B
	INY					;$80B58C
	CPY #$000A				;$80B58D
	BCC CODE_80B582				;$80B590
	RTS					;$80B592

CODE_80B593:
	PHK					;$80B593
	PLB					;$80B594
	JSR CODE_809437				;$80B595
	LDA #!music_dixie_beat			;$80B598
	JSL play_song				;$80B59B
	LDA #$000F				;$80B59F
	JSL CODE_BB859A				;$80B5A2
	ORA #$3000				;$80B5A6
	CLC					;$80B5A9
	ADC #$01C0				;$80B5AA
	STA $B4					;$80B5AD
	LDA #$002A				;$80B5AF
	JSL vram_payload_handler_global		;$80B5B2
	LDA #$0028				;$80B5B6
	JSL set_PPU_registers_global		;$80B5B9
	LDA #$1201				;$80B5BD
	STA PPU.screens				;$80B5C0
	LDA #$0102				;$80B5C3
	STA PPU.color_math			;$80B5C6
	LDA #$002E				;$80B5C9
	LDX #$0020				;$80B5CC
	LDY #$0000				;$80B5CF
	JSL CODE_BB856D				;$80B5D2
	LDX #$F000				;$80B5D6
	LDY #$007E				;$80B5D9
	LDA #$0800				;$80B5DC
	JSL CODE_808CEC				;$80B5DF
	JSR CODE_80B926				;$80B5E3
	LDA #$7001				;$80B5E6
	STA pending_dma_hdma_channels		;$80B5E9
	JSR CODE_80B98B				;$80B5EC
	JSR CODE_80957A				;$80B5EF
	LDA #$0001				;$80B5F2
	TRB game_state_flags			;$80B5F5
	LDA $BA					;$80B5F8
	ASL					;$80B5FA
	TAX					;$80B5FB
	JMP (DATA_80B5FF,x)			;$80B5FC

DATA_80B5FF:
	dw CODE_80B9CD
	dw CODE_80B7FD
	dw CODE_80B9CD

CODE_80B605:
	LDA pending_dma_hdma_channels		;$80B605
	STA CPU.enable_dma_hdma			;$80B608
	JSL CODE_B38006				;$80B60B
	JSL DMA_queued_sprite_palette_global	;$80B60F
	LDA $1D39				;$80B613
	CMP #$008F				;$80B616
	BNE CODE_80B648				;$80B619
	LDA #$1717				;$80B61B
	STA PPU.window_masks			;$80B61E
	LDA #$3333				;$80B621
	STA PPU.set_window_layer_1_2		;$80B624
	STA PPU.set_window_layer_3_4		;$80B627
	SEP #$20				;$80B62A
	STZ PPU.layer_1_scroll_x		;$80B62C
	STZ PPU.layer_1_scroll_x		;$80B62F
	STZ PPU.layer_2_scroll_x		;$80B632
	STZ PPU.layer_2_scroll_x		;$80B635
	STZ PPU.layer_2_scroll_y		;$80B638
	STZ PPU.layer_2_scroll_y		;$80B63B
	LDA #$FF				;$80B63E
	STA PPU.layer_1_scroll_y		;$80B640
	STA PPU.layer_1_scroll_y		;$80B643
	REP #$20				;$80B646
CODE_80B648:
	SEP #$20				;$80B648
	LDA screen_brightness			;$80B64A
	STA PPU.screen				;$80B64D
	REP #$20				;$80B650
	STZ $1560				;$80B652
	STZ $155E				;$80B655
	LDA screen_brightness			;$80B658
	BIT #$FF00				;$80B65B
	BNE CODE_80B682				;$80B65E
	LDA $1D39				;$80B660
	BNE CODE_80B682				;$80B663
	JSL CODE_8089CA				;$80B665
	LDA player_active_pressed		;$80B669
	AND #!input_A|!input_B|!input_start	;$80B66C
	BEQ CODE_80B682				;$80B66F
	JSR CODE_80BC90				;$80B671
	LDA #$0090				;$80B674
	STA $1D39				;$80B677
	LDA #$8001				;$80B67A
	STA pending_dma_hdma_channels		;$80B67D
	STZ $F4					;$80B680
CODE_80B682:
	LDA $1D39				;$80B682
	BEQ CODE_80B6B5				;$80B685
	CMP #$0002				;$80B687
	BCC CODE_80B6C7				;$80B68A
	JSL CODE_B284D3				;$80B68C
	LDA $1D39				;$80B690
	LDX $1D35				;$80B693
	CPX #$0068				;$80B696
	BCC CODE_80B6A7				;$80B699
	CMP #$0028				;$80B69B
	BCS CODE_80B6A7				;$80B69E
	LDX $F4					;$80B6A0
	CPX #$0140				;$80B6A2
	BCC CODE_80B6C7				;$80B6A5
CODE_80B6A7:
	DEC $1D39				;$80B6A7
	CMP #$0010				;$80B6AA
	BCS CODE_80B6C7				;$80B6AD
	JSL CODE_B8807E				;$80B6AF
	BRA CODE_80B6C7				;$80B6B3

CODE_80B6B5:
	JSR CODE_80B96B				;$80B6B5
	JSL CODE_808C60				;$80B6B8
	AND #$00FF				;$80B6BC
	BNE CODE_80B6C4				;$80B6BF
	JSR CODE_80B98B				;$80B6C1
CODE_80B6C4:
	JSR CODE_80B9AC				;$80B6C4
CODE_80B6C7:
	JSL sprite_handler			;$80B6C7
	JSL CODE_B7800C				;$80B6CB
	JSL CODE_B6804B				;$80B6CF
	JSL CODE_B7800F				;$80B6D3
	JSL CODE_80898C				;$80B6D7
	JSR CODE_809741				;$80B6DB
	BEQ CODE_80B6F3				;$80B6DE
	LDA $F4					;$80B6E0
	CMP #$0A00				;$80B6E2
	BCC CODE_80B6F0				;$80B6E5
	LDA #$0000				;$80B6E7
	JSL CODE_B2800F				;$80B6EA
	STZ $F4					;$80B6EE
CODE_80B6F0:
	JMP CODE_808384				;$80B6F0

CODE_80B6F3:
	LDA current_game_mode			;$80B6F3
	CMP #!gamemode_2_player_contest		;$80B6F6
	BNE CODE_80B711				;$80B6F9
	LDA $061D				;$80B6FB
	AND #$4000				;$80B6FE
	PHA					;$80B701
	JSL CODE_8092EB				;$80B702
	JSL CODE_809399				;$80B706
	PLA					;$80B70A
	TSB $061D				;$80B70B
	JMP CODE_8096C2				;$80B70E

CODE_80B711:
	JMP CODE_8082EC				;$80B711

CODE_80B714:
	LDA pending_dma_hdma_channels		;$80B714
	STA CPU.enable_dma_hdma			;$80B717
	LDX #$75C0				;$80B71A
	STX PPU.vram_address			;$80B71D
	LDA #$F200				;$80B720
	STA DMA[0].source_word			;$80B723
	STA DMA[0].unused_2			;$80B726
	LDA #$0380				;$80B729
	STA DMA[0].size				;$80B72C
	LDA #$1801				;$80B72F
	STA DMA[0].settings			;$80B732
	SEP #$20				;$80B735
	LDA #$7E				;$80B737
	STA DMA[0].source_bank			;$80B739
	LDA #$01				;$80B73C
	STA CPU.enable_dma			;$80B73E
	REP #$20				;$80B741
	JSL CODE_B38006				;$80B743
	JSL DMA_queued_sprite_palette_global	;$80B747
	SEP #$20				;$80B74B
	LDA screen_brightness			;$80B74D
	STA PPU.screen				;$80B750
	REP #$20				;$80B753
	STZ $1560				;$80B755
	STZ $155E				;$80B758
	JSR CODE_80B96B				;$80B75B
	JSL CODE_808C60				;$80B75E
	AND #$01FF				;$80B762
	BNE CODE_80B76D				;$80B765
	LDA #$0002				;$80B767
	STA $1C3D				;$80B76A
CODE_80B76D:
	JSR CODE_80B9AC				;$80B76D
	LDA screen_brightness			;$80B770
	BIT #$FF00				;$80B773
	BNE CODE_80B7D5				;$80B776
	JSL CODE_8089CA				;$80B778
	LDA player_active_pressed		;$80B77C
	AND #!input_start			;$80B77F
	BEQ CODE_80B788				;$80B782
	JSL CODE_B8807E				;$80B784
CODE_80B788:
	LDA #$0C00				;$80B788
	STA $1D83				;$80B78B
	JSR CODE_80B28E				;$80B78E
	LDA $1D83				;$80B791
	BIT #$0400				;$80B794
	BEQ CODE_80B7AD				;$80B797
	LDA $1CCA				;$80B799
	CLC					;$80B79C
	ADC #$0004				;$80B79D
	CMP #$008C				;$80B7A0
	BCS CODE_80B7D5				;$80B7A3
	STA $1CCA				;$80B7A5
	JSR CODE_80B8D6				;$80B7A8
	BRA CODE_80B7D5				;$80B7AB

CODE_80B7AD:
	BIT #$0800				;$80B7AD
	BEQ CODE_80B7C3				;$80B7B0
	LDA $1CCA				;$80B7B2
	SEC					;$80B7B5
	SBC #$0004				;$80B7B6
	BMI CODE_80B7D5				;$80B7B9
	STA $1CCA				;$80B7BB
	JSR CODE_80B8D6				;$80B7BE
	BRA CODE_80B7D5				;$80B7C1

CODE_80B7C3:
	LDA player_active_pressed		;$80B7C3
	BIT #!input_A|!input_B			;$80B7C6
	BEQ CODE_80B7D5				;$80B7C9
	LDY $1CCA				;$80B7CB
	LDA DATA_80C385+$0A,y			;$80B7CE
	JSL CODE_B2800C				;$80B7D1
CODE_80B7D5:
	JSL sprite_handler			;$80B7D5
	JSL CODE_B7800C				;$80B7D9
	JSL CODE_B7800F				;$80B7DD
	JSL CODE_80898C				;$80B7E1
	JSR CODE_809741				;$80B7E5
	BEQ CODE_80B7ED				;$80B7E8
	JMP CODE_808384				;$80B7EA

CODE_80B7ED:
	LDX #CODE_809489			;$80B7ED
	LDY.w #CODE_809489>>16			;$80B7F0
	LDA #CODE_808370			;$80B7F3
	STX $4E					;$80B7F6
	STY $50					;$80B7F8
	JMP set_and_wait_for_nmi_direct		;$80B7FA

CODE_80B7FD:
	LDA #DATA_B6F42C			;$80B7FD
	STA $46					;$80B800
	LDA.w #DATA_B6F42C>>16			;$80B802
	STA $48					;$80B805
	STZ temp_36				;$80B807
	LDX #$3EFF				;$80B809
	JSR CODE_80B040				;$80B80C
	LDX #$7400				;$80B80F
	STX PPU.vram_address			;$80B812
	LDA #$F000				;$80B815
	STA DMA[0].source_word			;$80B818
	STA DMA[0].unused_2			;$80B81B
	LDA #$0800				;$80B81E
	STA DMA[0].size				;$80B821
	LDA #$1801				;$80B824
	STA DMA[0].settings			;$80B827
	SEP #$20				;$80B82A
	LDA #$7E				;$80B82C
	STA DMA[0].source_bank			;$80B82E
	LDA #$01				;$80B831
	STA CPU.enable_dma			;$80B833
	REP #$20				;$80B836
	LDA #$0001				;$80B838
	TSB pending_dma_hdma_channels		;$80B83B
	LDY #$0286				;$80B83E
	JSL CODE_BB8588				;$80B841
	LDA #$0007				;$80B845
	STA $1CCA				;$80B848
CODE_80B84B:
	LDY #$0284				;$80B84B
	JSL CODE_BB85B8				;$80B84E
	LDX alternate_sprite			;$80B852
	LDA $1CCA				;$80B854
	STA sprite.general_purpose_5C,x		;$80B857
	DEC $1CCA				;$80B859
	BPL CODE_80B84B				;$80B85C
	LDA #$0036				;$80B85E
	JSL vram_payload_handler_global		;$80B861
	LDY #$7440				;$80B865
	STY temp_1A				;$80B868
CODE_80B86A:
	STY PPU.vram_address			;$80B86A
	LDA PPU.vram_read			;$80B86D
	CLC					;$80B870
	ADC #$0078				;$80B871
	LDY temp_1A				;$80B874
	STY PPU.vram_address			;$80B876
	STA PPU.vram_write			;$80B879
	INY					;$80B87C
	STY temp_1A				;$80B87D
	CPY #$75C0				;$80B87F
	BCC CODE_80B86A				;$80B882
	LDA #$001E				;$80B884
	LDX #$0004				;$80B887
	LDY #$0000				;$80B88A
	JSL CODE_BB856D				;$80B88D
	STZ $1CCA				;$80B891
	JSR CODE_80B8D6				;$80B894
	LDA #$0200				;$80B897
	JSL set_fade				;$80B89A
	LDA #CODE_80B714			;$80B89E
	LDX.w #CODE_80B714>>16			;$80B8A1
	JMP CODE_8083C3				;$80B8A4

CODE_80B8A7:
	PHX					;$80B8A7
	LDY #$0000				;$80B8A8
CODE_80B8AB:
	LDA $0000,x				;$80B8AB
	INX					;$80B8AE
	INY					;$80B8AF
	BIT #$0080				;$80B8B0
	BEQ CODE_80B8AB				;$80B8B3
	PLX					;$80B8B5
	STY temp_1A				;$80B8B6
	LDA #$0020				;$80B8B8
	SEC					;$80B8BB
	SBC temp_1A				;$80B8BC
	AND #$00FE				;$80B8BE
	TAY					;$80B8C1
	RTS					;$80B8C2

CODE_80B8C3:
	LDA #$3EFF				;$80B8C3
	LDY #$0600				;$80B8C6
	LDX #$0200				;$80B8C9
CODE_80B8CC:
	STA $7EF000,x				;$80B8CC
	INX					;$80B8D0
	INX					;$80B8D1
	DEY					;$80B8D2
	BNE CODE_80B8CC				;$80B8D3
	RTS					;$80B8D5

CODE_80B8D6:
	LDA #$007E				;$80B8D6
	STA $44					;$80B8D9
	LDA #$F000				;$80B8DB
	STA $42					;$80B8DE
	STZ $1CCC				;$80B8E0
	LDA #$3400				;$80B8E3
	STA $1CAE				;$80B8E6
	LDA #$0200				;$80B8E9
	STA temp_36				;$80B8EC
	JSR CODE_80B8C3				;$80B8EE
	LDA $1CCC				;$80B8F1
CODE_80B8F4:
	ASL					;$80B8F4
	ASL					;$80B8F5
	CLC					;$80B8F6
	ADC $1CCA				;$80B8F7
	TAY					;$80B8FA
	LDX DATA_80C385,y			;$80B8FB
	JSR CODE_80B8A7				;$80B8FE
	JSR CODE_80A547				;$80B901
	LDA temp_36				;$80B904
	CLC					;$80B906
	ADC #$0080				;$80B907
	STA temp_36				;$80B90A
	INC $1CCC				;$80B90C
	LDA $1CCC				;$80B90F
	LDX #$3400				;$80B912
	CMP #$0002				;$80B915
	BNE CODE_80B91D				;$80B918
	LDX #$3800				;$80B91A
CODE_80B91D:
	STX $1CAE				;$80B91D
	CMP #$0005				;$80B920
	BCC CODE_80B8F4				;$80B923
	RTS					;$80B925

CODE_80B926:
	SEP #$20				;$80B926
	LDX #$0F42				;$80B928
	STX HDMA[$04].settings			;$80B92B
	LDX #DATA_80C20E			;$80B92E
	STX HDMA[$04].source_word		;$80B931
	LDA.b #DATA_80C20E>>16			;$80B934
	STA HDMA[$04].source_bank		;$80B936
	LDA #$7E				;$80B939
	STA HDMA[$04].indirect_source_bank	;$80B93B
	LDX #$1042				;$80B93E
	STX HDMA[$06].settings			;$80B941
	LDX #DATA_80C20E			;$80B944
	STX HDMA[$06].source_word		;$80B947
	LDA.b #DATA_80C20E>>16			;$80B94A
	STA HDMA[$06].source_bank		;$80B94C
	LDA #$7E				;$80B94F
	STA HDMA[$06].indirect_source_bank	;$80B951
	LDX #$2601				;$80B954
	STX HDMA[$05].settings			;$80B957
	LDX #DATA_80C215			;$80B95A
	STX HDMA[$05].source_word		;$80B95D
	LDA.b #DATA_80C215>>16			;$80B960
	STA HDMA[$05].source_bank		;$80B962
	STA HDMA[$05].indirect_source_bank	;$80B965
	REP #$20				;$80B968
	RTS					;$80B96A

CODE_80B96B:
	LDY #$007F				;$80B96B
	LDX #$0000				;$80B96E
CODE_80B971:
	LDA $7EA15A,x				;$80B971
	CMP #$8000				;$80B975
	ROR					;$80B978
	CMP #$FFFF				;$80B979
	BNE CODE_80B981				;$80B97C
	LDA #$0000				;$80B97E
CODE_80B981:
	STA $7EA15A,x				;$80B981
	INX					;$80B985
	INX					;$80B986
	DEY					;$80B987
	BPL CODE_80B971				;$80B988
	RTS					;$80B98A

CODE_80B98B:
	LDY #$007F				;$80B98B
	LDX #$0000				;$80B98E
CODE_80B991:
	JSL CODE_808C60				;$80B991
	STA $7EA15A,x				;$80B995
	INX					;$80B999
	INX					;$80B99A
	DEY					;$80B99B
	BPL CODE_80B991				;$80B99C
	LDA #$0002				;$80B99E
	STA $1C3D				;$80B9A1
	LDA #$0665				;$80B9A4
	JSL queue_sound_effect			;$80B9A7
	RTS					;$80B9AB

CODE_80B9AC:
	LDX $1C3D				;$80B9AC
	INX					;$80B9AF
	INX					;$80B9B0
	CPX #$00FF				;$80B9B1
	BCS CODE_80B9B9				;$80B9B4
	STX $1C3D				;$80B9B6
CODE_80B9B9:
	LDA $7EA15C,x				;$80B9B9
	INC					;$80B9BD
	INC					;$80B9BE
	STA $7EA15C,x				;$80B9BF
	LDA $7EA15A,x				;$80B9C3
	DEC					;$80B9C7
	STA $7EA15A,x				;$80B9C8
	RTS					;$80B9CC

CODE_80B9CD:
	LDA #DATA_B6F42C			;$80B9CD
	STA $46					;$80B9D0
	LDA.w #DATA_B6F42C>>16			;$80B9D2
	STA $48					;$80B9D5
	STZ temp_36				;$80B9D7
	LDX #$3EFF				;$80B9D9
	JSR CODE_80B040				;$80B9DC
	LDA #$2000				;$80B9DF
	STA $1CAE				;$80B9E2
	LDA #$0211				;$80B9E5
	STA PPU.screens				;$80B9E8
	LDX #$001E				;$80B9EB
	LDY #$0080				;$80B9EE
	JSR CODE_80A5DE				;$80B9F1
	JSR CODE_80A58C				;$80B9F4
	JSR CODE_80BC55				;$80B9F7
	LDX #$0020				;$80B9FA
	LDY #$FFDF				;$80B9FD
	JSR CODE_809F29				;$80BA00
	STX $15EC				;$80BA03
	JSR CODE_80B18E				;$80BA06
	STA $1D35				;$80BA09
	LDX #$FFFF				;$80BA0C
	LDY #$0020				;$80BA0F
	SEP #$20				;$80BA12
CODE_80BA14:
	INY					;$80BA14
	INY					;$80BA15
	INX					;$80BA16
	CMP DATA_80C37A,x			;$80BA17
	BCC CODE_80BA14				;$80BA1A
	REP #$20				;$80BA1C
	LDA $06A1				;$80BA1E
	BIT #$001A				;$80BA21
	BEQ CODE_80BA29				;$80BA24
	LDY #$0038				;$80BA26
CODE_80BA29:
	TYX					;$80BA29
	LDY $15EC				;$80BA2A
	DEY					;$80BA2D
	JSR CODE_809F29				;$80BA2E
	LDA current_game_mode			;$80BA31
	CMP #!gamemode_2_player_team		;$80BA34
	BNE CODE_80BA40				;$80BA37
	LDA #$0053				;$80BA39
	STA $7E0000,x				;$80BA3C
CODE_80BA40:
	LDX #$FFE0				;$80BA40
	LDY #$F600				;$80BA43
	JSR CODE_80A5F3				;$80BA46
	STY $42					;$80BA49
	JSR CODE_80A59E				;$80BA4B
	LDA #$3400				;$80BA4E
	STA $1CAE				;$80BA51
	LDA #$04C0				;$80BA54
	STA temp_36				;$80BA57
	STZ $1CC8				;$80BA59
	LDX #$0004				;$80BA5C
CODE_80BA5F:
	LDA #$3400				;$80BA5F
	DEC $053F				;$80BA62
	BNE CODE_80BA6A				;$80BA65
	LDA #$3800				;$80BA67
CODE_80BA6A:
	STA $1CAE				;$80BA6A
	JSR CODE_80BAD6				;$80BA6D
	DEX					;$80BA70
	BPL CODE_80BA5F				;$80BA71
	STZ $053F				;$80BA73
	LDX #$7400				;$80BA76
	STX PPU.vram_address			;$80BA79
	LDA #$7EF000				;$80BA7C
	STA DMA[0].source_word			;$80BA7F
	STA DMA[0].unused_2			;$80BA82
	LDA #$0800				;$80BA85
	STA DMA[0].size				;$80BA88
	LDA #$1801				;$80BA8B
	STA DMA[0].settings			;$80BA8E
	SEP #$20				;$80BA91
	LDA #$7E				;$80BA93
	STA DMA[0].source_bank			;$80BA95
	LDA #$01				;$80BA98
	STA CPU.enable_dma			;$80BA9A
	REP #$20				;$80BA9D
	LDA $1D35				;$80BA9F
	CMP #$0068				;$80BAA2
	BCC CODE_80BABD				;$80BAA5
	LDY #$0370				;$80BAA7
	JSL CODE_BB8585				;$80BAAA
	LDA alternate_sprite			;$80BAAE
	PHA					;$80BAB0
	LDY #$0362				;$80BAB1
	JSL CODE_BB8585				;$80BAB4
	LDX alternate_sprite			;$80BAB8
	PLA					;$80BABA
	STA sprite.general_purpose_5C,x		;$80BABB
CODE_80BABD:
	LDA #$0200				;$80BABD
	JSL set_fade				;$80BAC0
	STZ $F4					;$80BAC4
	LDA #CODE_808370			;$80BAC6
	STA $4A					;$80BAC9
	STA $4C					;$80BACB
	LDA #CODE_80B605			;$80BACD
	LDX.w #CODE_80B605>>16			;$80BAD0
	JMP CODE_8083C3				;$80BAD3

CODE_80BAD6:
	STX $1CCA				;$80BAD6
	LDX #$0012				;$80BAD9
CODE_80BADC:
	STZ $1CB4,x				;$80BADC
	DEX					;$80BADF
	BPL CODE_80BADC				;$80BAE0
	LDY #$0003				;$80BAE2
	LDA $1CCA				;$80BAE5
	CLC					;$80BAE8
	ADC #$0031				;$80BAE9
	STA $1CB4				;$80BAEC
	LDA #$202E				;$80BAEF
	STA $1CB5				;$80BAF2
	LDY #$0003				;$80BAF5
	LDA $1CCA				;$80BAF8
	ASL					;$80BAFB
	ASL					;$80BAFC
	ASL					;$80BAFD
	ASL					;$80BAFE
	TAX					;$80BAFF
	STX $1CCC				;$80BB00
	LDA $7EA8DE,x				;$80BB03
	AND #$00FF				;$80BB07
	CMP #$0001				;$80BB0A
	BNE CODE_80BB1B				;$80BB0D
	JSR CODE_80BB90				;$80BB0F
	LDA #$5D20				;$80BB12
	STA $1CB4,y				;$80BB15
	INY					;$80BB18
	INY					;$80BB19
	INY					;$80BB1A
CODE_80BB1B:
	JSR CODE_80BB90				;$80BB1B
	LDA $1CC2				;$80BB1E
	ORA #$8000				;$80BB21
	STA $1CC2				;$80BB24
	LDY #$0004				;$80BB27
	LDX #$001CB4				;$80BB2A
	JSR CODE_80A547				;$80BB2D
	LDY #$0000				;$80BB30
	LDX $1CCC				;$80BB33
	LDA $7EA8E9,x				;$80BB36
	STA temp_1A				;$80BB3A
	STA temp_26				;$80BB3C
	LDA $7EA8EB,x				;$80BB3E
	STA temp_1C				;$80BB42
	STA temp_28				;$80BB44
	JSR CODE_80A6A9				;$80BB46
	LDA temp_40				;$80BB49
	LDX #$0002				;$80BB4B
	LDY #$0026				;$80BB4E
	JSR CODE_80A4DC				;$80BB51
	LDA temp_3E				;$80BB54
	LDX #$0002				;$80BB56
	LDY #$002C				;$80BB59
	JSR CODE_80A4DC				;$80BB5C
	LDX $1CCC				;$80BB5F
	LDA $7EA8ED,x				;$80BB62
	AND #$00FF				;$80BB66
	LDY #$0034				;$80BB69
	LDX #$0003				;$80BB6C
	JSR CODE_80A4DC				;$80BB6F
	LDX #DATA_80C648			;$80BB72
	LDY #$003A				;$80BB75
	JSR CODE_80A547				;$80BB78
	LDX #DATA_80C647			;$80BB7B
	LDY #$002A				;$80BB7E
	JSR CODE_80A547				;$80BB81
	LDA temp_36				;$80BB84
	SEC					;$80BB86
	SBC #$00C0				;$80BB87
	STA temp_36				;$80BB8A
	LDX $1CCA				;$80BB8C
	RTS					;$80BB8F

CODE_80BB90:
	LDA $7EA8DF,x				;$80BB90
	AND #$007F				;$80BB94
	STA $1CB4,y				;$80BB97
	INY					;$80BB9A
	LDA $7EA8DF,x				;$80BB9B
	INX					;$80BB9F
	BIT #$0080				;$80BBA0
	BEQ CODE_80BB90				;$80BBA3
	RTS					;$80BBA5

CODE_80BBA6:
	LDA $B0600A				;$80BBA6
	CMP #$5269				;$80BBAA
	BNE CODE_80BBB9				;$80BBAD
	LDA $B0600C				;$80BBAF
	CMP #$5241				;$80BBB3
	BNE CODE_80BBB9				;$80BBB6
	RTS					;$80BBB8

CODE_80BBB9:
	LDA #$5269				;$80BBB9
	STA $B0600A				;$80BBBC
	LDA #$5241				;$80BBC0
	STA $B0600C				;$80BBC3
	JSR CODE_80BBF5				;$80BBC7
	RTS					;$80BBCA

CODE_80BBCB:
	STZ temp_3E				;$80BBCB
	STZ temp_40				;$80BBCD
	LDX #$0000				;$80BBCF
CODE_80BBD2:
	LDA $B06012,x				;$80BBD2
	CLC					;$80BBD6
	ADC temp_3E				;$80BBD7
	STA temp_3E				;$80BBD9
	INX					;$80BBDB
	INX					;$80BBDC
	CPX #$0050				;$80BBDD
	BNE CODE_80BBD2				;$80BBE0
	LDX #$0000				;$80BBE2
CODE_80BBE5:
	LDA $B06012,x				;$80BBE5
	EOR temp_40				;$80BBE9
	STA temp_40				;$80BBEB
	INX					;$80BBED
	INX					;$80BBEE
	CPX #$0050				;$80BBEF
	BNE CODE_80BBE5				;$80BBF2
	RTS					;$80BBF4

CODE_80BBF5:
	JSR CODE_80BC0B				;$80BBF5
	JSR CODE_80BC7E				;$80BBF8
	JSR CODE_80BBCB				;$80BBFB
	LDA temp_3E				;$80BBFE
	STA $B0600E				;$80BC00
	LDA temp_40				;$80BC04
	STA $B06010				;$80BC06
	RTS					;$80BC0A

CODE_80BC0B:
	LDX #$0008				;$80BC0B
	STZ temp_1A				;$80BC0E
CODE_80BC10:
	PHX					;$80BC10
	SEP #$20				;$80BC11
	LDY DATA_80C608,x			;$80BC13
	LDX temp_1A				;$80BC16
CODE_80BC18:
	LDA $0000,y				;$80BC18
	STA $7EA8DF,x				;$80BC1B
	INX					;$80BC1F
	LDA $0000,y				;$80BC20
	INY					;$80BC23
	BIT #$80				;$80BC24
	BEQ CODE_80BC18				;$80BC26
	LDX temp_1A				;$80BC28
	LDA #$00				;$80BC2A
	STA $7EA8DE,x				;$80BC2C
	REP #$20				;$80BC30
	LDA $0000,y				;$80BC32
	STA $7EA8E9,x				;$80BC35
	LDA $0002,y				;$80BC39
	STA $7EA8EB,x				;$80BC3C
	LDA $0003,y				;$80BC40
	STA $7EA8EC,x				;$80BC43
	LDA temp_1A				;$80BC47
	CLC					;$80BC49
	ADC #$0010				;$80BC4A
	STA temp_1A				;$80BC4D
	PLX					;$80BC4F
	DEX					;$80BC50
	DEX					;$80BC51
	BPL CODE_80BC10				;$80BC52
	RTS					;$80BC54

CODE_80BC55:
	JSR CODE_80BBCB				;$80BC55
	LDA $B0600E				;$80BC58
	CMP temp_3E				;$80BC5C
	BNE CODE_80BC68				;$80BC5E
	LDA $B06010				;$80BC60
	CMP temp_40				;$80BC64
	BEQ CODE_80BC6C				;$80BC66
CODE_80BC68:
	JSR CODE_80BC0B				;$80BC68
	RTS					;$80BC6B

CODE_80BC6C:
	LDX #$0000				;$80BC6C
CODE_80BC6F:
	LDA $B06012,x				;$80BC6F
	STA $7EA8DE,x				;$80BC73
	INX					;$80BC77
	CPX #$004F				;$80BC78
	BCC CODE_80BC6F				;$80BC7B
	RTS					;$80BC7D

CODE_80BC7E:
	LDX #$0000				;$80BC7E
CODE_80BC81:
	LDA $7EA8DE,x				;$80BC81
	STA $B06012,x				;$80BC85
	INX					;$80BC89
	CPX #$004F				;$80BC8A
	BCC CODE_80BC81				;$80BC8D
	RTS					;$80BC8F

CODE_80BC90:
	SEP #$20				;$80BC90
	LDX #$2641				;$80BC92
	STX HDMA[$07].settings			;$80BC95
	LDX #$A25A				;$80BC98
	STX HDMA[$07].source_word		;$80BC9B
	LDA #$7E				;$80BC9E
	STA HDMA[$07].source_bank		;$80BCA0
	STA HDMA[$07].indirect_source_bank	;$80BCA3
	REP #$20				;$80BCA6
	LDA #$00FF				;$80BCA8
	STA $7EA25A				;$80BCAB
	STA $7EA25D				;$80BCAF
	LDA #$A47A				;$80BCB3
	STA $7EA25B				;$80BCB6
	LDA #$A578				;$80BCBA
	STA $7EA25E				;$80BCBD
	LDA #$0000				;$80BCC1
	STA $7EA260				;$80BCC4
	LDA #$0001				;$80BCC8
	STA $7EA45A				;$80BCCB
	LDX #$A45A				;$80BCCF
	LDY #$A45C				;$80BCD2
	LDA #$01E0				;$80BCD5
	MVN $7E, $7E				;$80BCD8
	RTS					;$80BCDB

CODE_80BCDC:
	LDA #$007E				;$80BCDC
	STA $44					;$80BCDF
	STX temp_1C				;$80BCE1
	LDA #$F580				;$80BCE3
	STA $42					;$80BCE6
	STA temp_1A				;$80BCE8
	LDY #$0006				;$80BCEA
CODE_80BCED:
	LDX #$0020				;$80BCED
	LDA #$2000				;$80BCF0
CODE_80BCF3:
	STA [$42]				;$80BCF3
	INC $42					;$80BCF5
	INC $42					;$80BCF7
	DEX					;$80BCF9
	BNE CODE_80BCF3				;$80BCFA
	LDA temp_1A				;$80BCFC
	CLC					;$80BCFE
	ADC #$0040				;$80BCFF
	STA $42					;$80BD02
	STA temp_1A				;$80BD04
	DEY					;$80BD06
	BNE CODE_80BCED				;$80BD07
	LDX temp_1C				;$80BD09
	RTL					;$80BD0B

CODE_80BD0C:
	LDA #DATA_FC14A0			;$80BD0C
	STA $42					;$80BD0F
	LDA.w #DATA_FC14A0>>16			;$80BD11
	STA $44					;$80BD14
	LDA #$F000				;$80BD16
	STA $46					;$80BD19
	LDA #$007E				;$80BD1B
	STA $48					;$80BD1E
	LDA #$0064				;$80BD20
	STA $1C83				;$80BD23
CODE_80BD26:
	LDX #$0008				;$80BD26
CODE_80BD29:
	LDA [$42]				;$80BD29
	STA [$46]				;$80BD2B
	INC $42					;$80BD2D
	INC $42					;$80BD2F
	INC $46					;$80BD31
	INC $46					;$80BD33
	DEX					;$80BD35
	BNE CODE_80BD29				;$80BD36
	LDX #$0008				;$80BD38
CODE_80BD3B:
	LDA #$0000				;$80BD3B
	STA [$46]				;$80BD3E
	INC $46					;$80BD40
	INC $46					;$80BD42
	DEX					;$80BD44
	BNE CODE_80BD3B				;$80BD45
	DEC $1C83				;$80BD47
	BNE CODE_80BD26				;$80BD4A
	RTS					;$80BD4C

boss_cutscene_dialogue_handler_main:
	JMP (.state_table,x)			;$80BD4D  |>

.state_table:
	dw .state_0
	dw .state_1
	dw .state_2

.state_0:
	LDA #$1D93				;$80BD56  \
	STA $0541				;$80BD59   |
	LDY #$0000				;$80BD5C   |
	LDA language_select			;$80BD5F   |
	BEQ ..CODE_80BD6F			;$80BD62   |
	LDY #$000C				;$80BD64   |
	CMP #$0001				;$80BD67   |
	BEQ ..CODE_80BD6F			;$80BD6A   |
	LDY #$001C				;$80BD6C  /
..CODE_80BD6F:
	LDX #$0000				;$80BD6F  \
	LDA DATA_80BEDB,y			;$80BD72  /
..CODE_80BD75:
	STA $7EFFE0,x				;$80BD75  \
	INX					;$80BD79   |
	INY					;$80BD7A   |
	LDA DATA_80BEDB,y			;$80BD7B   |
	AND #$00FF				;$80BD7E   |
	BNE ..CODE_80BD75			;$80BD81   |
	STA $7EFFE0,x				;$80BD83   |
	LDY #$035A				;$80BD87   |
	JSL CODE_BB8585				;$80BD8A   |
	BCS ..return				;$80BD8E   |
	JSL delete_sprite_handle_deallocation	;$80BD90  /
..return:
	JML [$04F5]				;$80BD94  |>

.state_1:
	TYX					;$80BD97  \
	STZ sprite.ground_y_position,x		;$80BD98   |
	INC sprite.state,x			;$80BD9A   |
	LDA sprite.general_purpose_5C,x		;$80BD9C   |
	ASL					;$80BD9E   |
	TAY					;$80BD9F   |
	LDA DATA_80BE77,y			;$80BDA0   |
	TAY					;$80BDA3   |
	INC					;$80BDA4   |
	INC					;$80BDA5   |
	INC					;$80BDA6   |
	STA sprite.general_purpose_66,x		;$80BDA7   |
	LDA $0000,y				;$80BDA9   |
	AND #$00FF				;$80BDAC   |
	STA sprite.general_purpose_5E,x		;$80BDAF   |
	LDA $0001,y				;$80BDB1   |
	STA sprite.general_purpose_60,x		;$80BDB4   |
	LDA sprite.carry_or_defeat_flags,x	;$80BDB6   |
	BNE ..CODE_80BDC8			;$80BDB8   |
	STZ temp_1E				;$80BDBA   |
	STZ temp_20				;$80BDBC   |
	LDA #$0001				;$80BDBE   |
	JSL CODE_B78027				;$80BDC1   |
	JSR CODE_80BD0C				;$80BDC5  /
..CODE_80BDC8:
	LDA #$1D93				;$80BDC8  \
	STA $0541				;$80BDCB   |
	JML [$04F5]				;$80BDCE  /

.state_2:
	TYX					;$80BDD1  \
	LDA sprite.general_purpose_5C,x		;$80BDD2   |
	CMP #$0005				;$80BDD4   |
	BEQ ..CODE_80BE01			;$80BDD7   |
	LDA sprite.general_purpose_64,x		;$80BDD9   |
	CMP #$0020				;$80BDDB   |
	BCC ..CODE_80BE01			;$80BDDE   |
	LDA player_active_pressed		;$80BDE0   |
	BIT #!input_A|!input_B|!input_start	;$80BDE3   |
	BEQ ..CODE_80BE01			;$80BDE6   |
	LDA #$0020				;$80BDE8   |
	STA sprite.general_purpose_64,x		;$80BDEB   |
	LDA sprite.ground_y_position,x		;$80BDED   |
	BEQ ..CODE_80BDF8			;$80BDEF   |
	STZ sprite.ground_y_position,x		;$80BDF1   |
	TAX					;$80BDF3   |
	JSL CODE_BB85E8				;$80BDF4  /
..CODE_80BDF8:
	STZ $1D93				;$80BDF8  \
	LDA #$1D93				;$80BDFB   |
	STA $0541				;$80BDFE  /
..CODE_80BE01:
	DEC sprite.general_purpose_64,x		;$80BE01  \
	BNE ..return				;$80BE03   |
	LDA sprite.general_purpose_5E,x		;$80BE05   |
	BEQ ..CODE_80BE5C			;$80BE07   |
	LDY #$0360				;$80BE09   |
	JSL CODE_BB8588				;$80BE0C   |
	LDX current_sprite			;$80BE10   |
	BCC ..CODE_80BE19			;$80BE12   |
	INC sprite.general_purpose_64,x		;$80BE14   |
	JML [$04F5]				;$80BE16  /

..CODE_80BE19:
	LDY alternate_sprite			;$80BE19  \
	STX sprite.general_purpose_4C,y		;$80BE1B   |
	STY sprite.ground_y_position,x		;$80BE1D   |
	LDA sprite.general_purpose_5C,x		;$80BE1F   |
	STA.w sprite.unknown_2C,y		;$80BE21   |
	LDA sprite.general_purpose_60,x		;$80BE24   |
	STA.w sprite.general_purpose_5E,y	;$80BE26   |
	INC					;$80BE29   |
	INC					;$80BE2A   |
	STA sprite.general_purpose_60,x		;$80BE2B   |
	LDA sprite.general_purpose_66,x		;$80BE2D   |
	STA temp_1A				;$80BE2F   |
	INC					;$80BE31   |
	INC					;$80BE32   |
	STA sprite.general_purpose_66,x		;$80BE33   |
	LDA (temp_1A)				;$80BE35   |
	XBA					;$80BE37   |
	AND #$00FF				;$80BE38   |
	ASL					;$80BE3B   |
	STA.w sprite.general_purpose_6C,y	;$80BE3C   |
	CLC					;$80BE3F   |
	ADC #$0010				;$80BE40   |
	STA sprite.general_purpose_64,x		;$80BE43   |
	LDA (temp_1A)				;$80BE45   |
	AND #$00FF				;$80BE47   |
	STA $1D47				;$80BE4A   |
	CLC					;$80BE4D   |
	TYX					;$80BE4E   |
	ADC #$00FA				;$80BE4F   |
	JSL CODE_BB85A0				;$80BE52   |
	LDX current_sprite			;$80BE56   |
	DEC sprite.general_purpose_5E,x		;$80BE58   |
	BPL ..return				;$80BE5A  /
..CODE_80BE5C:
	JSL delete_sprite_handle_deallocation	;$80BE5C  \
	LDA sprite.ground_y_position,x		;$80BE60   |
	BEQ ..CODE_80BE6B			;$80BE62   |
	STZ sprite.ground_y_position,x		;$80BE64   |
	TAX					;$80BE66   |
	JSL CODE_BB85E8				;$80BE67  /
..CODE_80BE6B:
	STZ $1D93				;$80BE6B  \
	LDA #$1D93				;$80BE6E   |
	STA $0541				;$80BE71  /
..return:
	JML [$04F5]				;$80BE74  |>

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
	db $0D,$0C,$00,$00,$80,$00,$80,$00
	db $80,$00,$80,$01,$80,$00,$80,$00
	db $80,$00,$80,$00,$80,$01,$80,$00
	db $80,$00,$80,$00,$80

DATA_80BEB5:
	db $06,$26,$00,$00,$80,$00,$80,$00
	db $80,$00,$80,$01,$80,$00,$80

DATA_80BEC4:
	db $0A,$32,$00,$02,$80,$02,$80,$02
	db $80,$02,$80,$03,$80,$03,$80,$02
	db $80,$04,$80,$01,$80,$04,$80

DATA_80BEDB:
	db "NEW RECORD!", $00
	db "NOUVEAU RECORD!", $00
	db "NEU REKORD!", $00

boss_cutscene_text_main:
	JMP (.state_table,x)			;$80BF03  

.state_table:
	dw CODE_80BF0E
	dw CODE_80BF45
	dw CODE_80BFD2
	dw CODE_80C012

CODE_80BF0E:
	TYX					;$80BF0E
	STZ sprite.general_purpose_5C,x		;$80BF0F
	LDX sprite.general_purpose_5E,y		;$80BF11
	LDA $7EA7BA,x				;$80BF13
	CLC					;$80BF17
	ADC #$A9DE				;$80BF18
	TYX					;$80BF1B
	TAY					;$80BF1C
	INC					;$80BF1D
	STA sprite.general_purpose_5E,x		;$80BF1E
	STZ sprite.general_purpose_60,x		;$80BF20
	%pea_use_dbr($7E807E)			;$80BF22
	PLB					;$80BF25
	LDA $0000,y				;$80BF26
	AND #$00FF				;$80BF29
	STA temp_26				;$80BF2C
	CMP #$0001				;$80BF2E
	BEQ CODE_80BF3F				;$80BF31
CODE_80BF33:
	INY					;$80BF33
	LDA $0000,y				;$80BF34
	AND #$00FF				;$80BF37
	BNE CODE_80BF33				;$80BF3A
	INY					;$80BF3C
	STY sprite.general_purpose_60,x		;$80BF3D
CODE_80BF3F:
	PLB					;$80BF3F
	INC sprite.state,x			;$80BF40
	JML [$04F5]				;$80BF42

CODE_80BF45:
	TYX					;$80BF45
	LDA #$0100				;$80BF46
	STA temp_1C				;$80BF49
	LDA #$7E00				;$80BF4B
	STA temp_1B				;$80BF4E
CODE_80BF50:
	%pea_use_dbr($7E807E)			;$80BF50
	PLB					;$80BF53
	LDA #$FFFF				;$80BF54
	LDY sprite.general_purpose_60,x		;$80BF57
	BEQ CODE_80BF66				;$80BF59
	LDA $0000,y				;$80BF5B
	AND #$00FF				;$80BF5E
	SEC					;$80BF61
	SBC #$0020				;$80BF62
	XBA					;$80BF65
CODE_80BF66:
	STA temp_24				;$80BF66
	LDY sprite.general_purpose_5E,x		;$80BF68
	LDA $0000,y				;$80BF6A
	PLB					;$80BF6D
	AND #$00FF				;$80BF6E
	BEQ CODE_80BFB0				;$80BF71
	SEC					;$80BF73
	SBC #$0020				;$80BF74
	XBA					;$80BF77
	JSR CODE_80C008				;$80BF78
	LDA sprite.general_purpose_5C,x		;$80BF7B
	CLC					;$80BF7D
	ADC sprite.oam_property,x		;$80BF7E
	AND #$01FF				;$80BF80
	STA temp_3E				;$80BF83
	JSL CODE_B78009				;$80BF85
	BCS CODE_80BFAD				;$80BF89
	LDA temp_24				;$80BF8B
	BPL CODE_80BF90				;$80BF8D
	TDC					;$80BF8F
CODE_80BF90:
	JSR CODE_80C008				;$80BF90
	LDA temp_3E				;$80BF93
	CLC					;$80BF95
	ADC #$0010				;$80BF96
	JSL CODE_B78009				;$80BF99
	BCS CODE_80BFAD				;$80BF9D
	JSR CODE_80C048				;$80BF9F
	INC sprite.general_purpose_5E,x		;$80BFA2
	LDA sprite.general_purpose_60,x		;$80BFA4
	BEQ CODE_80BF50				;$80BFA6
	INC sprite.general_purpose_60,x		;$80BFA8
	JMP CODE_80BF50				;$80BFAA

CODE_80BFAD:
	JML [$04F5]				;$80BFAD

CODE_80BFB0:
	LDA sprite.general_purpose_5C,x		;$80BFB0
	LSR					;$80BFB2
	BCC CODE_80BFBD				;$80BFB3
	LDA #$0003				;$80BFB5
	STA sprite.state,x			;$80BFB8
	JMP CODE_80C012				;$80BFBA

CODE_80BFBD:
	LDA sprite.general_purpose_5C,x		;$80BFBD
	AND #$FFF0				;$80BFBF
	BEQ CODE_80BFCC				;$80BFC2
	LDA sprite.general_purpose_5C,x		;$80BFC4
	SEC					;$80BFC6
	SBC #$0010				;$80BFC7
	STA sprite.general_purpose_5C,x		;$80BFCA
CODE_80BFCC:
	LDA #$0002				;$80BFCC
	STA sprite.state,x			;$80BFCF
	TXY					;$80BFD1
CODE_80BFD2:
	TYX					;$80BFD2
	LDY $0541				;$80BFD3
	STX $00,y				;$80BFD6
	INY					;$80BFD8
	INY					;$80BFD9
	STY $0541				;$80BFDA
	LDA sprite.unknown_2C,x			;$80BFDD
	CMP #$0005				;$80BFDF
	BEQ CODE_80BFEC				;$80BFE2
	LDA player_active_pressed		;$80BFE4
	BIT #!input_A|!input_B|!input_start	;$80BFE7
	BNE CODE_80BFF9				;$80BFEA
CODE_80BFEC:
	DEC sprite.general_purpose_6C,x		;$80BFEC
	BNE CODE_80BFF2				;$80BFEE
	BRA CODE_80BFF9				;$80BFF0

CODE_80BFF2:
	JSL process_current_movement		;$80BFF2
	JML [$04F5]				;$80BFF6

CODE_80BFF9:
	LDY sprite.general_purpose_4C,x		;$80BFF9
	LDA #$0000				;$80BFFB
	STA $0018,y				;$80BFFE
	JSL delete_sprite_handle_deallocation	;$80C001
	JML [$04F5]				;$80C005

CODE_80C008:
	LSR					;$80C008
	LSR					;$80C009
	LSR					;$80C00A
	CLC					;$80C00B
	ADC #$F000				;$80C00C
	STA temp_1A				;$80C00F
	RTS					;$80C011

CODE_80C012:
	LDX current_sprite			;$80C012
	LDA #$0100				;$80C014
	STA temp_1C				;$80C017
	LDA #$7E00				;$80C019
	STA temp_1B				;$80C01C
	LDA #$F000				;$80C01E
	STA temp_1A				;$80C021
	LDA sprite.general_purpose_5C,x		;$80C023
	CLC					;$80C025
	ADC sprite.oam_property,x		;$80C026
	AND #$01FF				;$80C028
	STA temp_3E				;$80C02B
	JSL CODE_B78009				;$80C02D
	BCS CODE_80C045				;$80C031
	LDA temp_3E				;$80C033
	CLC					;$80C035
	ADC #$0010				;$80C036
	JSL CODE_B78009				;$80C039
	BCS CODE_80C045				;$80C03D
	JSR CODE_80C048				;$80C03F
	JMP CODE_80BFBD				;$80C042

CODE_80C045:
	JML [$04F5]				;$80C045

CODE_80C048:
	INC sprite.general_purpose_5C,x		;$80C048
	LDA sprite.general_purpose_5C,x		;$80C04A
	AND #$000F				;$80C04C
	BNE CODE_80C059				;$80C04F
	LDA sprite.general_purpose_5C,x		;$80C051
	CLC					;$80C053
	ADC #$0010				;$80C054
	STA sprite.general_purpose_5C,x		;$80C057
CODE_80C059:
	RTS					;$80C059

CODE_80C05A:
	LDA $1C5F				;$80C05A
	AND #$000C				;$80C05D
	LSR					;$80C060
	TAX					;$80C061
	LDA.l DATA_80C0A8,x			;$80C062
	STA temp_1E				;$80C066
	EOR #$FFFF				;$80C068
	STA temp_20				;$80C06B
	LDA $1C5F				;$80C06D
	AND #$0003				;$80C070
	ASL					;$80C073
	TAX					;$80C074
	LDY #$0000				;$80C075
	SEP #$30				;$80C078
CODE_80C07A:
	STY PPU.cgram_address			;$80C07A
	LDA PPU.cgram_read			;$80C07D
	XBA					;$80C080
	LDA PPU.cgram_read			;$80C081
	XBA					;$80C084
	REP #$20				;$80C085
	STA $1A					;$80C087
	JSR (DATA_80C0B0,x)			;$80C089
	STA temp_1C				;$80C08C
	LDA temp_1A				;$80C08E
	AND temp_20				;$80C090
	ORA temp_1C				;$80C092
	SEP #$20				;$80C094
	STY PPU.cgram_address			;$80C096
	STA PPU.cgram_write			;$80C099
	XBA					;$80C09C
	STA PPU.cgram_write			;$80C09D
	INY					;$80C0A0
	CPY #$80				;$80C0A1
	BNE CODE_80C07A				;$80C0A3
	REP #$30				;$80C0A5
	RTL					;$80C0A7

DATA_80C0A8:
	dw $001F
	dw $03E0
	dw $7C00
	dw $0000

DATA_80C0B0:
	dw CODE_80C0B8
	dw CODE_80C0C8
	dw CODE_80C0D9
	dw CODE_80C0EB

CODE_80C0B8:
	AND temp_1E				;$80C0B8
	STA temp_1C				;$80C0BA
	LSR					;$80C0BC
	LSR					;$80C0BD
	EOR #$FFFF				;$80C0BE
	INC					;$80C0C1
	CLC					;$80C0C2
	ADC temp_1C				;$80C0C3
	AND temp_1E				;$80C0C5
	RTS					;$80C0C7

CODE_80C0C8:
	AND temp_1E				;$80C0C8
	STA temp_1C				;$80C0CA
	LSR					;$80C0CC
	CLC					;$80C0CD
	ADC temp_1C				;$80C0CE
	CMP temp_1E				;$80C0D0
	BCC CODE_80C0D6				;$80C0D2
	LDA temp_1E				;$80C0D4
CODE_80C0D6:
	AND temp_1E				;$80C0D6
	RTS					;$80C0D8

CODE_80C0D9:
	AND temp_1E				;$80C0D9
	STA temp_1C				;$80C0DB
	LSR					;$80C0DD
	LSR					;$80C0DE
	CLC					;$80C0DF
	ADC temp_1C				;$80C0E0
	CMP temp_1E				;$80C0E2
	BCC CODE_80C0E8				;$80C0E4
	LDA temp_1E				;$80C0E6
CODE_80C0E8:
	AND temp_1E				;$80C0E8
	RTS					;$80C0EA

CODE_80C0EB:
	AND temp_1E				;$80C0EB
	LSR					;$80C0ED
	AND temp_1E				;$80C0EE
	RTS					;$80C0F0

lock_sprite_palette_queue_global:
	LDX #$0006				;$80C0F1
CODE_80C0F4:
	LDA active_sprite_palettes_table,x	;$80C0F4
	BNE CODE_80C0FF				;$80C0F7
	LDA #$FFFF				;$80C0F9
	STA active_sprite_palettes_table,x	;$80C0FC
CODE_80C0FF:
	DEX					;$80C0FF
	DEX					;$80C100
	BPL CODE_80C0F4				;$80C101
	RTL					;$80C103

unlock_sprite_palette_queue_global:
	LDX #$0006				;$80C104
CODE_80C107:
	LDA active_sprite_palettes_table,x	;$80C107
	BPL CODE_80C10F				;$80C10A
	STZ active_sprite_palettes_table,x	;$80C10C
CODE_80C10F:
	DEX					;$80C10F
	DEX					;$80C110
	BPL CODE_80C107				;$80C111
	RTL					;$80C113

CODE_80C114:
	PHK					;$80C114
	PLB					;$80C115
	JSR CODE_809437				;$80C116
	LDA #$000F				;$80C119
	JSL CODE_BB859A				;$80C11C
	ORA #$3000				;$80C120
	CLC					;$80C123
	ADC #$01C0				;$80C124
	STA $B4					;$80C127
	LDA #$0034				;$80C129
	JSL set_PPU_registers_global		;$80C12C
	LDA #$003E				;$80C130
	LDY active_player			;$80C133
	BEQ CODE_80C13B				;$80C136
	LDA #$003F				;$80C138
CODE_80C13B:
	JSL vram_payload_handler_global		;$80C13B
	LDA #$0082				;$80C13F
	LDY active_player			;$80C142
	BEQ CODE_80C14A				;$80C145
	LDA #$0083				;$80C147
CODE_80C14A:
	LDX #$0020				;$80C14A
	LDY #$0000				;$80C14D
	JSL CODE_BB856D				;$80C150
	JSR CODE_80957A				;$80C154
	LDA #$1D93				;$80C157
	STA $0541				;$80C15A
	LDY #$0208				;$80C15D
	JSL CODE_BB8588				;$80C160
	LDX alternate_sprite			;$80C164
	STZ sprite.general_purpose_60,x		;$80C166
	LDA #$FFFF				;$80C168
	STA sprite.general_purpose_5E,x		;$80C16B
	LDA #$00B0				;$80C16D
	STA sprite.y_position,x			;$80C170
	LDA #$0080				;$80C172
	STA sprite.x_position,x			;$80C175
	LDX #$004A				;$80C177
	LDA active_player			;$80C17A
	BEQ CODE_80C181				;$80C17D
	INX					;$80C17F
	INX					;$80C180
CODE_80C181:
	LDY #$FFDF				;$80C181
	JSR CODE_809F29				;$80C184
	LDA #$0001				;$80C187
	STA pending_dma_hdma_channels		;$80C18A
	LDA #$0001				;$80C18D
	TRB game_state_flags			;$80C190
	LDA #$0200				;$80C193
	JSL set_fade				;$80C196
	LDA #!music_defeated_boss		;$80C19A
	JSL play_song				;$80C19D
	LDA #CODE_80C1AA			;$80C1A1
	LDX.w #CODE_80C1AA>>16			;$80C1A4
	JMP CODE_8083C3				;$80C1A7

CODE_80C1AA:
	LDA pending_dma_hdma_channels		;$80C1AA
	STA CPU.enable_dma_hdma			;$80C1AD
	JSL CODE_B38006				;$80C1B0
	JSL DMA_queued_sprite_palette_global	;$80C1B4
	SEP #$20				;$80C1B8
	LDA screen_brightness			;$80C1BA
	STA PPU.screen				;$80C1BD
	REP #$20				;$80C1C0
	STZ $1560				;$80C1C2
	STZ $155E				;$80C1C5
	LDA screen_brightness			;$80C1C8
	BIT #$FF00				;$80C1CB
	BNE CODE_80C1E0				;$80C1CE
	JSL CODE_8089CA				;$80C1D0
	LDA player_active_pressed		;$80C1D4
	AND #!input_A|!input_B|!input_start	;$80C1D7
	BEQ CODE_80C1E0				;$80C1DA
	JSL CODE_B8807E				;$80C1DC
CODE_80C1E0:
	JSL sprite_handler			;$80C1E0
	LDA #$1D93				;$80C1E4
	STA $0541				;$80C1E7
	JSL CODE_B7800C				;$80C1EA
	JSL CODE_B284CD				;$80C1EE
	JSL CODE_80898C				;$80C1F2
	JSR CODE_809741				;$80C1F6
	BEQ CODE_80C1FE				;$80C1F9
	JMP CODE_808384				;$80C1FB

CODE_80C1FE:
	LDA #CODE_80B2C8			;$80C1FE
	STA $4E					;$80C201
	LDA.w #CODE_80B2C8>>16			;$80C203
	STA $50					;$80C206
	LDA #CODE_808362			;$80C208
	JMP set_and_wait_for_nmi_direct		;$80C20B

DATA_80C20E:
	db $FF,$5A,$A1,$FF,$5A,$A1,$00

DATA_80C215:
	db $0B,$01,$00,$9B,$34,$CB,$30,$CF
	db $2A,$D5,$24,$DB,$21,$DE,$1F,$E0
	db $1C,$E3,$1B,$E4,$19,$E6,$18,$E7
	db $17,$E8,$16,$E9,$15,$EA,$14,$EB
	db $13,$EC,$13,$EC,$12,$ED,$11,$EE
	db $11,$EE,$11,$EE,$10,$EF,$10,$EF
	db $10,$EF,$0F,$F0,$0F,$F0,$0F,$F0
	db $0F,$F0,$7F,$0E,$F1,$14,$0E,$F1
	db $9B,$0F,$F0,$0F,$F0,$0F,$F0,$0F
	db $F0,$10,$EF,$10,$EF,$10,$EF,$11
	db $EE,$11,$EE,$11,$EE,$12,$ED,$13
	db $EC,$13,$EC,$14,$EB,$15,$EA,$16
	db $E9,$17,$E8,$18,$E7,$19,$E6,$1B
	db $E4,$1C,$E3,$1F,$E0,$21,$DE,$24
	db $DB,$2A,$D5,$30,$CF,$34,$CB,$01
	db $01,$00,$00

DATA_80C290:
	db $2A,$0C,$00,$30,$00,$27,$0C,$00
	db $D8,$FF,$08,$0C,$00,$00,$00,$27
	db $0C,$00,$A8,$FF,$08,$0C,$00,$00
	db $00,$27,$0C,$00,$78,$FF,$01,$0C
	db $00,$00,$00,$00,$2A,$00,$00,$00
	db $00,$16,$00,$00,$F7,$FF,$0E,$00
	db $00,$FD,$FF,$0B,$00,$00,$00,$00
	db $16,$00,$00,$F7,$FF,$0F,$00,$00
	db $FD,$FF,$0A,$00,$00,$00,$00,$18
	db $00,$00,$F7,$FF,$11,$00,$00,$FD
	db $FF,$01,$00,$00,$03,$00,$00,$1E
	db $17,$0C,$07,$27,$17,$08,$07,$27
	db $17,$08,$07,$27,$17,$01,$17,$00
	db $2A,$E0,$07,$EC,$28,$E3,$09,$EC
	db $26,$E3,$0A,$EC,$26,$E3,$08,$EF
	db $90,$4C,$49,$45,$43,$45,$45,$45
	db $45,$45,$45,$45,$45,$43,$45,$49
	db $4C,$00

DATA_80C31A:
	dw $012E, $0256, $0258, $025A

DATA_80C322:
	dw $004C, $007C, $00AC

DATA_80C328:
	dw $0100, $0280, $0400

DATA_80C32E:
	dw $00F4, $FFCC, $00F4, $FFDC
	dw $00F4, $FFEC, $00F4, $FFB7

DATA_80C33E:
	db $00, $30, $60, $A0, $FF

DATA_80C343:
	db $06, $10, $1A, $06, $15, $24

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
	db $20,$20,$20,$20,$20,$20,$20,$20
	db $20,$20,$A0

DATA_80C378:
	db $AE,$00

DATA_80C37A:
	db $69,$68,$67,$66,$5F,$50,$46,$3C
	db $37,$32,$00


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
	db $00,$41,$42,$43,$44,$45,$46,$47
	db $48,$49,$4A,$4B,$4C,$4D,$4E,$4F
	db $50,$51,$52,$53,$54,$55,$56,$57
	db $58,$59,$5A,$30,$31,$32,$33,$34
	db $35,$36,$37,$38,$39,$20,$88,$89
	db $5F


;80C679
;Character name text pointer, DATA_FF218C spawn script index, level ID, category, photo timer
;Categories:
;	00: Don't change
;	01: Kremling Kreeps
;	02: Terrorfirma Tuff Guys
;	03: Flying Fiends
;	04: Aquatic Attackers
;	05: Big Time Bad Guys
;	06: Firt Class Friends
;	07: Brothers Bear
;	08: Crucial Kongs

photo_album_sequence_data:
	dw !null_pointer, 	$039A : db !level_empty_doorstop_dash, 	 	 $FF : dw $0000
	dw .kobble, 		$03A2 : db !level_doorstop_dash_photo_album, 	 $01 : dw $008A
	dw .rekoil, 		$03A8 : db !level_squeals_on_wheels_photo_album, $00 : dw $0080
	dw .knocka, 		$03C0 : db !level_ropey_rumpus_photo_album, 	 $00 : dw $0087
	dw .klasp, 		$03A6 : db !level_ropey_rumpus_photo_album, 	 $00 : dw $0093
	dw .krimp, 		$039E : db !level_lemguin_lunge_photo_album,     $00 : dw $007A
	dw .krumple, 		$03BE : db !level_ropey_rumpus_photo_album,      $00 : dw $00AE
	dw .kopter, 		$03BC : db !level_ropey_rumpus_photo_album,      $00 : dw $00AB
	dw .skidda, 		$039A : db !level_skiddas_row_photo_album, 	 $00 : dw $0100
	dw .bazuka, 		$03BA : db !level_ropey_rumpus_photo_album,      $00 : dw $0070
	dw .kuchuka, 		$03CC : db !level_ropey_rumpus_photo_album,      $00 : dw $0100
	dw .koin, 		$03D0 : db !level_lemguin_lunge_photo_album, 	 $00 : dw $0120
	dw .kuff_n_klout, 	$83AA : db !level_ropey_rumpus_photo_album, 	 $00 : dw $00A8
	dw .sneek, 		$039C : db !level_doorstop_dash_photo_album, 	 $02 : dw $00B0
	dw .knik_knak, 		$03B8 : db !level_squeals_on_wheels_photo_album, $00 : dw $00B8
	dw .bristles, 		$03C2 : db !level_ropey_rumpus_photo_album, 	 $00 : dw $00C2
	dw .nid, 		$03CE : db !level_squeals_on_wheels_photo_album, $00 : dw $008C
	dw .lemguin, 		$03AC : db !level_lemguin_lunge_photo_album, 	 $00 : dw $00D0
	dw .minkey, 		$C3C4 : db !level_squeals_on_wheels_photo_album, $00 : dw $009A
	dw .buzz, 		$03A0 : db !level_squeals_on_wheels_photo_album, $03 : dw $00AE
	dw .swoopy, 		$03C6 : db !level_ropey_rumpus_photo_album, 	 $00 : dw $0094
	dw .booty_bird, 	$03C8 : db !level_squeals_on_wheels_photo_album, $00 : dw $009E
	dw .karbine, 		$03CA : db !level_ropey_rumpus_photo_album, 	 $00 : dw $00B3
	dw .koco, 		$03A4 : db !level_bazzas_blockade_photo_album, 	 $04 : dw $008D
	dw .lurchin, 		$03B6 : db !level_bazzas_blockade_photo_album, 	 $00 : dw $0110
	dw .nibbla, 		$83AE : db !level_bazzas_blockade_photo_album, 	 $00 : dw $0065
	dw .bounty_bass, 	$03B0 : db !level_bazzas_blockade_photo_album, 	 $00 : dw $0100
	dw .bazza, 		$83B2 : db !level_bazzas_blockade_photo_album, 	 $00 : dw $00DC
	dw .gleamin_bream, 	$03B4 : db !level_bazzas_blockade_photo_album, 	 $00 : dw $0100
	dw .belcha, 		$03A0 : db !level_bosses_photo_album, 		 $05 : dw $0006
	dw .arich, 		$03A1 : db !level_bosses_photo_album, 		 $00 : dw $0006
	dw .squirt, 		$03A2 : db !level_bosses_photo_album, 		 $00 : dw $0006
	dw .kaos, 		$03A3 : db !level_bosses_photo_album, 		 $00 : dw $0006
	dw .bleak, 		$03A4 : db !level_bosses_photo_album, 		 $00 : dw $0006
	dw .barbos, 		$03A5 : db !level_bosses_photo_album, 		 $00 : dw $0006
	dw .krool, 		$A3E8 : db !level_kastle_kaos_photo_album, 	 $00 : dw $0347
	dw .ellie, 		$03D2 : db !level_doorstop_dash_photo_album, 	 $06 : dw $0085
	dw .squitter, 		$03D8 : db !level_doorstop_dash_photo_album, 	 $00 : dw $00A1
	dw .parry, 		$03DA : db !level_ropey_rumpus_photo_album, 	 $00 : dw $00B2
	dw .enguarde, 		$03D6 : db !level_bazzas_blockade_photo_album, 	 $00 : dw $00D0
	dw .squawks, 		$03D4 : db !level_ropey_rumpus_photo_album, 	 $00 : dw $0100
	dw .bazaar_barnacle, 	$039A : db !level_brothers_bear_photo_album, 	 $07 : dw $0006
	dw .brash_blunder, 	$039B : db !level_brothers_bear_photo_album, 	 $00 : dw $0006
	dw .blue_bazooka, 	$039C : db !level_brothers_bear_photo_album, 	 $00 : dw $0006
	dw .blizzard_bramble,   $039D : db !level_brothers_bear_photo_album, 	 $00 : dw $0006
	dw .benny_bjorn_barter, $039E : db !level_brothers_bear_photo_album, 	 $00 : dw $0006
	dw .baffle_boomer, 	$039F : db !level_brothers_bear_photo_album, 	 $00 : dw $0006
	dw .funky_kong, 	$03DC : db !level_doorstop_dash_photo_album, 	 $08 : dw $00E3
	dw .swanky_kong, 	$A3E0 : db !level_doorstop_dash_photo_album, 	 $00 : dw $0100
	dw .wrinkly_kong, 	$03DE : db !level_doorstop_dash_photo_album, 	 $00 : dw $0100
	dw .cranky_kong, 	$03E2 : db !level_swankys_sideshow_photo_album,  $00 : dw $0100
	dw .kiddy_kong, 	$03E4 : db !level_kiddy_kong_photo_album, 	 $00 : dw $0278
	dw .dixie_kong, 	$03E6 : db !level_dixie_kong_photo_album, 	 $00 : dw $02D0
	dw !null_pointer, 	$0000 : db !level_empty_doorstop_dash,	 	 $00 : dw $FFFF

.kobble:
	db "KOBBLE", $00

.sneek:
	db "SNEEK", $00

.krimp:
	db "KRIMP", $00

.knik_knak:
	db "KNIK-KNAK", $00

.bristles:
	db "BRISTLES", $00

.knocka:
	db "KNOCKA", $00

.kracka_unused:
	db "KRACKA", $00

.krumple:
	db "KRUMPLE", $00

.kopter:
	db "KOPTER", $00

.bazuka:
	db "BAZUKA", $00

.klasp:
	db "KLASP", $00

.rekoil:
	db "RE-KOIL", $00

.kuchuka:
	db "KUCHUKA", $00

.koin:
	db "KOIN", $00

.kuff_n_klout:
	db "KUFF 'N' KLOUT", $00

.karbine:
	db "KARBINE", $00

.minkey:
	db "MINKEY", $00

.lemguin:
	db "LEMGUIN", $00

.nid:
	db "NID", $00

.skidda:
	db "SKIDDA", $00

.buzz:
	db "BUZZ", $00

.swoopy:
	db "SWOOPY", $00

.booty_bird:
	db "BOOTY BIRD", $00

.koco:
	db "KOCO", $00

.lurchin:
	db "LURCHIN", $00

.nibbla:
	db "NIBBLA", $00

.bounty_bass:
	db "BOUNTY BASS", $00

.bazza:
	db "BAZZA", $00

.gleamin_bream:
	db "GLEAMIN' BREAM", $00

.belcha:
	db "BELCHA", $00

.arich:
	db "ARICH", $00

.squirt:
	db "SQUIRT", $00

.kaos:
	db "KAOS", $00

.bleak:
	db "BLEAK", $00

.barbos:
	db "BARBOS", $00

.krool:
	db "BARON K.ROOLENSTEIN", $00

.enguarde:
	db "ENGUARDE", $00

.squawks:
	db "SQUAWKS", $00

.squitter:
	db "SQUITTER", $00

.ellie:
	db "ELLIE", $00

.parry:
	db "PARRY", $00

.bazaar_barnacle:
	db " BAZAAR         BARNACLE", $00

.brash_blunder:
	db "  BRASH         BLUNDER ", $00

.blue_bazooka:
	db "  BLUE          BAZOOKA ", $00

.blizzard_bramble:
	db "BLIZZARD       BRAMBLE", $00

.benny_bjorn_barter:
	db "BENNY ] BJ+RN    BARTER   ", $00

.baffle_boomer:
	db "BAFFLE          BOOMER", $00

.dixie_kong:
	db "DIXIE KONG", $00

.kiddy_kong:
	db "KIDDY KONG", $00

.funky_kong:
	db "FUNKY KONG", $00

.wrinkly_kong:
	db "WRINKLY KONG", $00

.swanky_kong:
	db "SWANKY KONG", $00

.cranky_kong:
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


;Unused copy of NMI_start
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
