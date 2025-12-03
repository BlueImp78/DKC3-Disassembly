DATA_FB0000:
	incbin "data/screens/tiledata/brother_bear_house_tiledata.bin"

DATA_FB6897:
	incbin "data/screens/tiledata/brother_bear_house_bg_tiledata.bin"

if !include_garbage_data == 1
	incbin "data/garbage_data/DKC2_DATA_FB7967.bin"
else
	padbyte $00 : pad $FB7FC0
endif

;64 bytes, most likely to pad to $7FFF
UNK_FB7FC0:
	dw $DE71, $FBFB, $F3DC, $31FB
	dw $FBF8, $3DFB, $FBFB, $C5FB
	dw $2AC1, $7BAA, $F5D1, $FBFB
	dw $18FB, $EB1F, $48FB, $C10D
	dw $FB3E, $7B5C, $F5F7, $FBFE
	dw $FBFE, $FB3D, $B1D1, $5FD1
	dw $FBD1, $78D1, $38D1, $FBD0
	dw $E32B, $FBDC, $DBFB, $EDFB