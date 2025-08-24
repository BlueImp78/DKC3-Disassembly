BRK_emulation_start = $5000
BRK_native_start = $5003

ROM_header:
	db "01"					;$80FFB0 Maker Code
	db "A3CE"				;$80FFB2 Game Code
	db $00, $00, $00, $00, $00, $00, $00	;$80FFB6 Fixed Value
	db $00					;$80FFBE Expansion RAM Size
	db $00					;$80FFBE Special Version
	db $00					;$80FFBF Cart Type Sub Number
	db "DONKEY KONG COUNTRY 3"		;$80FFC0 Game Title Registration
	db !HiROM_fast_mapping_mode		;$80FFD5 Mapping Mode
	db !ROM_RAM_battery_cart_type		;$80FFD6 Cart Type
	db !size_4MB				;$80FFD7 ROM Size
	db !size_2KB				;$80FFD8 RAM Size
	db !north_america_region		;$80FFD9 Destination Code
	db $33					;$80FFDA Fixed Value
	db !version				;$80FFDB Mask ROM Version
	dw $4D73				;$80FFDC Complement check
	dw $B28C				;$80FFDE Checksum
	db "DIXIE "				;$80FFE0 Unused Vectors (Native)
	dw BRK_native_start			;$80FFE6 BRK Vector (Native)
	dw !null_pointer			;$80FFE8 Abort Vector (Native)
	dw NMI_start				;$80FFEA NMI Vector (Native)
	dw !null_pointer			;$80FFEC Unused Vector
	dw IRQ_start				;$80FFEE IRQ Vector (Native)
	db "          "				;$80FFF0 Unused Vectors (Emulation)
	dw $F800				;$80FFFA Unused NMI Vector (Emulation)
	dw RESET_start				;$80FFFC Reset Vector (Emulation)
	dw BRK_emulation_start			;$80FFFE IRQ/BRK Vector (Emulation)