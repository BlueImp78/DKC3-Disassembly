hirom
optimize dp always
optimize address mirrors

!include_garbage_data = 1
;!override_lakeside_limbo = 0
;!lakeside_limbo_replacement = $00

	incsrc ram.asm
	incsrc macros.asm
	incsrc constants.asm
	incsrc old_defines.asm
	incsrc structs.asm
	;incsrc mmio.asm



org $00FFB0
	incsrc "header.asm"



org $C00000
	check bankcross half
	incsrc "bank_C0.asm"
	warnpc $C07FFC
	db $AA,$C3,$3F,$19


org $808000
	incsrc "bank_80.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DATA_80CB99.bin"
else
	padbyte $00 : pad $80FFB0
endif


org $C10000
	check bankcross full
	incsrc "bank_C1-EC.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DATA_ECA89B.bin"
	incbin "data/garbage_data/DKC2_DATA_ECADB4.bin"
else
	padbyte $00 : pad $ECB000
endif

org $ACB000
	incsrc "bank_AC.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_ECB29D.bin"
else
	padbyte $00 : pad $ACD000
endif

org $ECD000
	incsrc "data/levels/banana_placement/bananas_data.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_ECF77F.bin"
else
	padbyte $00 : pad $ED0000
endif

org $ED0000
	incsrc "bank_ED-F1.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_F1EC35.bin"
else
	padbyte $00 : pad $F20000
endif


org $F20000
	check bankcross half
	incsrc "bank_F2.asm"
if !include_garbage_data == 1
	incbin "data/garbage_data/DATA_F27C7E.bin"
else
	padbyte $00 : pad $F28000
endif

org $B28000
	incsrc "bank_B2.asm"
if !include_garbage_data = 1
	;check bankcross off
	incsrc "data/garbage_data/ADDR_B2FCAB.asm"
	incbin "data/garbage_data/DATA_B2FEAA.bin"
else
	padbyte $00 : pad $B30000	
endif

org $F30000
	check bankcross half
	incsrc "bank_F3.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_F37633.bin"
	incbin "data/garbage_data/DKC1_DATA_F37EE8.bin"
else
	padbyte $00 : pad $F38000
endif

org $B38000
	incsrc "bank_B3.asm"
if !include_garbage_data = 1
	;check bankcross off
	incsrc "data/garbage_data/ADDR_B3F938.asm"
	incbin "data/garbage_data/DATA_F3F957.bin"
else
	padbyte $00 : pad $B40000
endif

org $F40000
	check bankcross half
	incsrc "bank_F4.asm"

org $B48000
	incsrc "bank_B4.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DATA_F4FEA2.bin"
else
	padbyte $00 : pad $B50000
endif

org $F50000
	incsrc "bank_F5.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_F57E4C.bin"
	incbin "data/garbage_data/DKC1_DATA_F57F53.bin"
else
	padbyte $00 : pad $F58000
endif

org $B58000
	incsrc "bank_B5.asm"
	;padbyte $FF : pad $B60000
	padbyte $FF : pad $B5FFFF : db $FF

org $F60000
	incsrc "bank_F6.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_F67D5B.bin"
	padbyte $00 : pad $F68000
else
	padbyte $00 : pad $F68000
endif

org $B68000
	incsrc "bank_B6.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DATA_B6FF93.bin"
else
	padbyte $00 : pad $B70000
endif

org $F70000
	incsrc "bank_F7.asm"
if !include_garbage_data = 1
	incsrc "data/garbage_data/DKC2_DATA_B779E9.asm"
else
	padbyte $00 : pad $F78000
endif

org $B78000
	incsrc "bank_B7.asm"
if !include_garbage_data = 1
	;check bankcross off
	incsrc "data/garbage_data/ADDR_B7F43C.asm"
	incsrc "data/garbage_data/DKC2_CODE_B7F47D.asm"
	incbin "data/garbage_data/DKC1_DATA_B7FDCE.bin"
	incbin "data/garbage_data/DATA_B7FF0A.bin"
	;check bankcross full
else
	padbyte $00 : pad $B80000
endif

org $F80000
	incsrc "bank_F8.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_F87D95.bin"
	incbin "data/garbage_data/DATA_F87E05.bin"
else
	padbyte $00 : pad $F88000
endif

org $B88000
	incsrc "bank_B8.asm"
if !include_garbage_data = 1
	;check bankcross off
	incsrc "data/garbage_data/ADDR_B8FA1D.asm"
	incbin "data/garbage_data/DATA_B8FA52.bin"
	;check bankcross full
else
	padbyte $00 : pad $B90000
endif

org $F90000
	incsrc "bank_F9.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_F97E02.bin"
else
	padbyte $00 : pad $F98000
endif

org $B98000
	check bankcross full
if !include_garbage_data = 1
	incbin "data/garbage_data/DKC2_DATA_F98000.bin"
	incsrc "data/garbage_data/DKC1_CODE_B98FB3.asm"
	incbin "data/garbage_data/DKC2_DATA_F99400.bin"
else
	padbyte $00 : pad $B9A000
endif	
	incsrc "bank_B9.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DATA_B9F907.bin"
else
	padbyte $00 : pad $BA0000
endif	


org $FA0000
	;check bankcross full
	incsrc "bank_FA.asm"
if !include_garbage_data = 1
	;check bankcross off
	org $BAD100
		incsrc "data/garbage_data/ADDR_BAD100.asm"
	;check bankcross full
else
	padbyte $00 : pad $BAFFFC
endif	

org $BAFFFC
	incsrc "bank_BA.asm"

org $FB0000
	check bankcross half
	incsrc "bank_FB.asm"

org $BB8000
	incsrc "bank_BB.asm"

org $FC0000
	incsrc "bank_FC.asm"
if !include_garbage_data = 1
	;check bankcross off
	incbin "data/garbage_data/DKC2_DATA_FC6240.bin"
	incsrc "data/garbage_data/DATA_FC7DDC.asm"
	;check bankcross full
else
	padbyte $00 : pad $FC8000
endif	

org $BC8000
	incsrc "bank_BC.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DATA_BCFA44.bin"
else
	padbyte $00 : pad $BD0000
endif

org $FD0000
	check bankcross full
	incsrc "bank_FD.asm"
if !include_garbage_data = 1
	;check bankcross off
	incbin "data/garbage_data/DATA_FDE815.bin"
	incsrc "data/garbage_data/ADDR_BDF1E8.asm"
	incbin "data/garbage_data/DATA_FDF501.bin"
	;check bankcross full
else
	padbyte $00 : pad $FE0000
endif

org $FE0000
	incsrc "bank_FE.asm"
if !include_garbage_data = 1
	;check bankcross off
	padbyte $00 : pad $FE9406
	incbin "data/garbage_data/DATA_FE9406.bin"
	incsrc "data/garbage_data/DKC1_CODE_BEA514.asm"
org $BEB800
	incsrc "data/garbage_data/DKC2_CODE_BEB800.asm"
	padbyte $00 : pad $BEC000
	;check bankcross full
else
	padbyte $00 : pad $FEC000
endif

org $BEC000
	incsrc "bank_BE.asm"
if !include_garbage_data = 1
	;check bankcross off
	incsrc "data/garbage_data/DKC2_CODE_BEE9F5.asm"
	incbin "data/garbage_data/DATA_BEFB8B.bin"
	;check bankcross full
else
	padbyte $00 : pad $BF0000
endif

org $FF0000
	incsrc "bank_FF.asm"

org $BFF000
	incsrc "bank_BF.asm"
if !include_garbage_data = 1
	incbin "data/garbage_data/DATA_FFF2FC.bin"
else
	padbyte $00 : pad $BFFFFF
endif