krool_fight_bg_decorations_main:
	JMP (.state_table,x)			;$ACB000  |>

.state_table:
	dw .dummy
	dw .state_1

.dummy:
	JMP CODE_ACB28C				;$ACB007  |>

.state_1:
	LDA active_frame_counter		;$ACB00A  \
	BIT #$0003				;$ACB00C   |
	BNE ..return				;$ACB00F   |
	LDX current_sprite			;$ACB011   |
	LDA sprite.oam_property,x		;$ACB013   |
	AND #$0E00				;$ACB015   |
	ASL					;$ACB018   |
	ASL					;$ACB019   |
	ASL					;$ACB01A   |
	CLC					;$ACB01B   |
	ADC #$8100				;$ACB01C   |
	ORA.w #$7EA1AA>>16			;$ACB01F   |
	STA $04F3				;$ACB022   |
	LDA #$7EA1AA				;$ACB025   |
	STA $04F1				;$ACB028   |
	JSR .CODE_ACB059			;$ACB02B   |
	LDA $7EA1C8				;$ACB02E   |
	INC					;$ACB032   |
	CMP #$000C				;$ACB033   |
	BNE ..CODE_ACB03B			;$ACB036   |
	LDA #$0000				;$ACB038  /
..CODE_ACB03B:
	STA $7EA1C8				;$ACB03B  \
	ASL					;$ACB03F   |
	TAY					;$ACB040   |
	PHK					;$ACB041   |
	PLB					;$ACB042   |
	LDX #$0000				;$ACB043  /
..CODE_ACB046:
	LDA DATA_ACB073,y			;$ACB046  \
	STA $7EA1AE,x				;$ACB049   |
	INY					;$ACB04D   |
	INY					;$ACB04E   |
	INX					;$ACB04F   |
	INX					;$ACB050   |
	CPX #$0018				;$ACB051   |
	BNE ..CODE_ACB046			;$ACB054  /
..return:
	JML [$04F5]				;$ACB056  |>

.CODE_ACB059:
	LDA $E8					;$ACB059  \
	ASL					;$ACB05B   |
	ASL					;$ACB05C   |
	TAX					;$ACB05D   |
	LDA $04F1				;$ACB05E   |
	STA $06FC,x				;$ACB061   |
	LDA $04F3				;$ACB064   |
	STA $06FE,x				;$ACB067   |
	LDA $E8					;$ACB06A   |
	INC					;$ACB06C   |
	AND #$000F				;$ACB06D   |
	STA $E8					;$ACB070   |
	RTS					;$ACB072  /

DATA_ACB073:
	dw $0040
	dw $0040
	dw $0040
	dw $0341
	dw $0280
	dw $01C0
	dw $0100
	dw $0040
	dw $0040
	dw $0040
	dw $0040
	dw $0040
	dw $0040
	dw $0040
	dw $0040
	dw $0341
	dw $0280
	dw $01C0
	dw $0100
	dw $0040
	dw $0040
	dw $0040
	dw $0040


bg_steel_keg_main:
	JMP (.state_table,x)			;$ACB0A1  |>

.state_table:
	dw .init
	dw .state_1
	dw .state_2
	dw .state_3

.init:
	TYX					;$ACB0AC  \
	LDA #$002D				;$ACB0AD   |
	STA sprite.general_purpose_5C,x		;$ACB0B0   |
	INC sprite.state,x			;$ACB0B2  /
.state_1:
	TYX					;$ACB0B4  \
	DEC sprite.general_purpose_5C,x		;$ACB0B5   |
	BNE ..return				;$ACB0B7   |
	STZ sprite.display_mode,x		;$ACB0B9   |
	LDA #$0300				;$ACB0BB   |
	STA sprite.y_speed,x			;$ACB0BE   |
	INC sprite.state,x			;$ACB0C0  /
..return:
	JML [$04F5]				;$ACB0C2  |>

.state_2:
	LDY $1BBF				;$ACB0C5  \
	JSL CODE_BEC003				;$ACB0C8   |
	BCC ..CODE_ACB0D9			;$ACB0CC   |
	LDY $1BBD				;$ACB0CE   |
	LDA #$0018				;$ACB0D1   |
	STA.w sprite.carry_or_defeated_flags,y	;$ACB0D4   |
	BRA ..CODE_ACB0E2			;$ACB0D7  /

..CODE_ACB0D9:
	LDY $1BBD				;$ACB0D9  \
	JSL CODE_BEC003				;$ACB0DC   |
	BCC ..CODE_ACB103			;$ACB0E0  /
..CODE_ACB0E2:
	LDY #$0239				;$ACB0E2  \
	LDA #$0002				;$ACB0E5   |
	JSL CODE_B58006				;$ACB0E8   |
	PHA					;$ACB0EC   |
	PLA					;$ACB0ED   |
	BEQ ..CODE_ACB0F3			;$ACB0EE   |
	LDY #$01C3				;$ACB0F0  /
..CODE_ACB0F3:
	STY sprite.general_purpose_62,x		;$ACB0F3  \
	LDA #$0174				;$ACB0F5   |
	STA sprite.general_purpose_64,x		;$ACB0F8   |
	LDA #$001A				;$ACB0FA   |
	STA sprite.movement_state,x		;$ACB0FD   |
	INC sprite.state,x			;$ACB0FF   |
	BRA .CODE_ACB127			;$ACB101  /

..CODE_ACB103:
	LDA sprite.y_position,x			;$ACB103  \
	CMP #$017B				;$ACB105   |
	BCS ..CODE_ACB0E2			;$ACB108   |
	JSL process_current_movement		;$ACB10A   |
	JML [$04F5]				;$ACB10E  /

.state_3:
	JSL process_current_movement		;$ACB111  \
	BCC .CODE_ACB127			;$ACB115   |
	LDA #$0010				;$ACB117   |
	TSB $1C33				;$ACB11A   |
	JSL CODE_B58042				;$ACB11D   |
	STZ $1BB1				;$ACB121   |
	JMP CODE_ACB285				;$ACB124  /

.CODE_ACB127:
	LDA sprite.y_speed,x			;$ACB127  \
	BMI ..return				;$ACB129   |
	LDA #$2000				;$ACB12B   |
	JSR CODE_ACB293				;$ACB12E  /
..return:
	JML [$04F5]				;$ACB131  |>


kaos_blade_main:
	JMP (.state_table,x)			;$ACB134  |>

.state_table:
	dw .state_0
	dw .state_1
	dw .state_2

.state_0:
	JSR .CODE_ACB25A			;$ACB13D  \
	LDA.w sprite.sprite_graphic,y		;$ACB140   |
	JSR .CODE_ACB1F2			;$ACB143   |
	JML [$04F5]				;$ACB146  /

.state_1:
	JSR .CODE_ACB25A			;$ACB149  \
	TYX					;$ACB14C   |
	LDA sprite.general_purpose_64,x		;$ACB14D   |
	BEQ ..CODE_ACB158			;$ACB14F   |
	LDA #.CODE_ACB1C2			;$ACB151   |
	JSL CODE_BB85D6				;$ACB154  /
..CODE_ACB158:
	LDA sprite.general_purpose_5E,x		;$ACB158  \
	BEQ ..CODE_ACB168			;$ACB15A   |
	STA sprite.sprite_graphic,x		;$ACB15C   |
	STZ sprite.general_purpose_5E,x		;$ACB15E   |
	JSL process_sprite_animation		;$ACB160   |
	LDX current_sprite			;$ACB164   |
	BRA .CODE_ACB182			;$ACB166  /

..CODE_ACB168:
	JSL process_sprite_animation		;$ACB168  \
	LDX current_sprite			;$ACB16C   |
	LDA sprite.sprite_graphic,x		;$ACB16E   |
	CMP sprite.last_rendered_graphic,x	;$ACB170   |
	BEQ .CODE_ACB182			;$ACB172   |
	STA sprite.general_purpose_5E,x		;$ACB174   |
	LDA sprite.last_rendered_graphic,x	;$ACB176   |
	STA sprite.sprite_graphic,x		;$ACB178   |
	LDA sprite.general_purpose_5E,x		;$ACB17A   |
	JSR .CODE_ACB1F2			;$ACB17C   |
	JML [$04F5]				;$ACB17F  /

.CODE_ACB182:
	LDA sprite.sprite_graphic,x		;$ACB182  \
	JSR .CODE_ACB1F2			;$ACB184   |
	JML [$04F5]				;$ACB187  /

.state_2:
	JSL CODE_B68015				;$ACB18A  \
	LDA sprite.sprite_graphic,x		;$ACB18E   |
	JSR .CODE_ACB1F2			;$ACB190   |
	LDA sprite.unknown_2C,x			;$ACB193   |
	STA sprite.x_position,x			;$ACB195   |
	LDA sprite.unknown_32,x			;$ACB197   |
	STA sprite.y_position,x			;$ACB199   |
	LDA sprite.state,x			;$ACB19B   |
	XBA					;$ACB19D   |
	STA sprite.state,x			;$ACB19E   |
	STZ sprite.general_purpose_64,x		;$ACB1A0   |
	JSL CODE_B58048				;$ACB1A2   |
	BCS ..CODE_ACB1AD			;$ACB1A6   |
	LDA #$0000				;$ACB1A8   |
	BRA ..CODE_ACB1B0			;$ACB1AB  /

..CODE_ACB1AD:
	LDA #$4000				;$ACB1AD  |>
..CODE_ACB1B0:
	EOR sprite.oam_property,x		;$ACB1B0  \
	AND #$4000				;$ACB1B2   |
	EOR sprite.oam_property,x		;$ACB1B5   |
	STA sprite.oam_property,x		;$ACB1B7   |
	LDA sprite.general_purpose_62,x		;$ACB1B9   |
	JSL set_sprite_animation		;$ACB1BB   |
	JML [$04F5]				;$ACB1BF  /

.CODE_ACB1C2:
	LDX current_sprite			;$ACB1C2  \
	LDA sprite.general_purpose_68,x		;$ACB1C4   |
	XBA					;$ACB1C6   |
	AND #$FF00				;$ACB1C7   |
	STA sprite.general_purpose_68,x		;$ACB1CA   |
	JSL CODE_BEC018				;$ACB1CC   |
	BCC ..return				;$ACB1D0   |
	LDY alternate_sprite			;$ACB1D2   |
	LDA.w sprite.y_speed,y			;$ACB1D4   |
	BMI ..return				;$ACB1D7   |
	LDX current_sprite			;$ACB1D9   |
	LDA #$0001				;$ACB1DB   |
	ORA sprite.general_purpose_68,x		;$ACB1DE   |
	STA sprite.general_purpose_68,x		;$ACB1E0   |
	LSR					;$ACB1E2   |
	BNE ..return				;$ACB1E3   |
	LDA #$0080				;$ACB1E5   |
	STA $1B97				;$ACB1E8   |
	LDA #$0200				;$ACB1EB   |
	STA $1B99				;$ACB1EE  /
..return:
	RTL					;$ACB1F1   |>

.CODE_ACB1F2:
	PHA					;$ACB1F2  \
	LDX current_sprite			;$ACB1F3   |
	LDA sprite.x_position,x			;$ACB1F5   |
	STA sprite.unknown_54,x			;$ACB1F7   |
	LDA sprite.y_position,x			;$ACB1F9   |
	STA sprite.unknown_56,x			;$ACB1FB   |
	LDA sprite.unknown_2C,x			;$ACB1FD   |
	STA sprite.x_position,x			;$ACB1FF   |
	LDA sprite.unknown_32,x			;$ACB201   |
	STA sprite.y_position,x			;$ACB203   |
	PLA					;$ACB205   |
	SEC					;$ACB206   |
	SBC #$3679				;$ACB207   |
	STA CPU.dividen_low			;$ACB20A   |
	SEP #$20				;$ACB20D   |
	LDA #$05				;$ACB20F   |
	STA CPU.divisor				;$ACB211   |
	REP #$20				;$ACB214   |
	JSL stall_cpu_time			;$ACB216   |
	LDA CPU.divide_result			;$ACB21A   |
	ASL					;$ACB21D   |
	TAY					;$ACB21E   |
	LDA DATA_ACB26F+$01,y			;$ACB21F   |
	PHA					;$ACB222   |
	LDA DATA_ACB26F,y			;$ACB223   |
	JSL CODE_B58021				;$ACB226   |
	BIT sprite.oam_property,x		;$ACB22A   |
	BVC ..CODE_ACB232			;$ACB22C   |
	EOR #$FFFF				;$ACB22E   |
	INC					;$ACB231  /
..CODE_ACB232:
	LDY $1B6B				;$ACB232  \
	CLC					;$ACB235   |
	ADC.w sprite.x_position,y		;$ACB236   |
	STA sprite.x_position,x			;$ACB239   |
	PLA					;$ACB23B   |
	JSL CODE_B58021				;$ACB23C   |
	CLC					;$ACB240   |
	ADC.w sprite.y_position,y		;$ACB241   |
	CLC					;$ACB244   |
	ADC sprite.general_purpose_60,x		;$ACB245   |
	STA sprite.y_position,x			;$ACB247   |
	LDA sprite.unknown_2C,x			;$ACB249   |
	LDY sprite.x_position,x			;$ACB24B   |
	STA sprite.x_position,x			;$ACB24D   |
	STY sprite.unknown_2C,x			;$ACB24F   |
	LDA sprite.unknown_32,x			;$ACB251   |
	LDY sprite.y_position,x			;$ACB253   |
	STA sprite.y_position,x			;$ACB255   |
	STY sprite.unknown_32,x			;$ACB257   |
	RTS					;$ACB259  /

.CODE_ACB25A:
	LDA.w sprite.unknown_2C,y		;$ACB25A  \
	CLC					;$ACB25D   |
	ADC $1B83				;$ACB25E   |
	STA.w sprite.unknown_2C,y		;$ACB261   |
	LDA.w sprite.unknown_32,y		;$ACB264   |
	CLC					;$ACB267   |
	ADC $1B85				;$ACB268   |
	STA.w sprite.unknown_32,y		;$ACB26B   |
	RTS					;$ACB26E  /

DATA_ACB26F:
	dw $0000
	dw $00F4
	dw $FEEA
	dw $FCE2
	dw $FADC
	dw $F7D8
	dw $F4D4
	dw $F2D4
	dw $F0D4
	dw $EED6
	dw $ECD8

CODE_ACB285:
	JSL delete_sprite_handle_deallocation	;$ACB285  \
	JML [$04F5]				;$ACB289  /

CODE_ACB28C:
	JSL process_sprite_animation		;$ACB28C  \
	JML [$04F5]				;$ACB290  /

CODE_ACB293:
	EOR sprite.oam_property,x		;$ACB293  \
	AND #$3000				;$ACB295   |
	EOR sprite.oam_property,x		;$ACB298   |
	STA sprite.oam_property,x		;$ACB29A   |
	RTS					;$ACB29C  /
