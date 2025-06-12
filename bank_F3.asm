DATA_F30000:
	incbin "data/screens/8x8_tilemaps/nintendo_presents_layer_1_8x8_tilemap.bin"

DATA_F30200:
	incbin "data/screens/tiledata/nintendo_presents_layer1_tiledata.bin"

DATA_F315C6:
	incbin "data/screens/8x8_tilemaps/nintendo_presents_layer3_8x8_tilemap.bin"

DATA_F316F0:
	incbin "data/screens/tiledata/nintendo_presents_layer3_tiledata.bin"

DATA_F31B38:
	incbin "data/screens/8x8_tilemaps/banana_bird_queen_layer1_8x8_tilemap.bin"

DATA_F31DED:
	incbin "data/screens/tiledata/banana_bird_queen_layer1_tiledata.bin"

DATA_F3480A:
	incbin "data/screens/8x8_tilemaps/photo_album_cover_layer2_8x8_tilemap.bin"

DATA_F34C21:
	incbin "data/screens/8x8_tilemaps/photo_album_section_layer2_8x8_tilemap.bin"

DATA_F34FAD:
	incbin "data/screens/tiledata/photo_album_section_layer2_tiledata.bin"

DATA_F35E23:
	incbin "data/world_maps/8x8_tilemaps/k3_layer2_waterfall_8x8_tilemap.bin"

DATA_F36023:
	dw DATA_F36033
	dw DATA_F36033+$02C0
	dw DATA_F36033+$0580
	dw DATA_F36033+$0840
	dw DATA_F36033+$0B00
	dw DATA_F36033+$0DC0
	dw DATA_F36033+$1080
	dw DATA_F36033+$1340

DATA_F36033:
	incbin "data/world_maps/tiledata/animated/k3_layer2_waterfall_tiledata.bin"