includeonce

!FALSE = 0
!TRUE = 1

!Define_DKC3_Global_RemappedBank80 = 0
!Define_DKC3_Global_DisableCopyDetection = 0

!REGISTER_ScreenDisplayRegister = $002100
	!ScreenDisplayRegister_MinBrightness00 = $00			;\ Screen brightness
	!ScreenDisplayRegister_Brightness01 = $01			;|
	!ScreenDisplayRegister_Brightness02 = $02			;|
	!ScreenDisplayRegister_Brightness03 = $03			;|
	!ScreenDisplayRegister_Brightness04 = $04			;|
	!ScreenDisplayRegister_Brightness05 = $05			;|
	!ScreenDisplayRegister_Brightness06 = $06			;|
	!ScreenDisplayRegister_Brightness07 = $07			;|
	!ScreenDisplayRegister_Brightness08 = $08			;|
	!ScreenDisplayRegister_Brightness09 = $09			;|
	!ScreenDisplayRegister_Brightness0A = $0A			;|
	!ScreenDisplayRegister_Brightness0B = $0B			;|
	!ScreenDisplayRegister_Brightness0C = $0C			;|
	!ScreenDisplayRegister_Brightness0D = $0D			;|
	!ScreenDisplayRegister_Brightness0E = $0E			;|
	!ScreenDisplayRegister_MaxBrightness0F = $0F			;/
	!ScreenDisplayRegister_SetForceBlank = $80
!REGISTER_OAMSizeAndDataAreaDesignation = $002101
	!SpriteGFXLocationInVRAMLo_0000 = $00				;\ Location of the first half of the sprite graphics in VRAM.
	!SpriteGFXLocationInVRAMLo_2000 = $01				;| Note that the SNES does not have enough VRAM for the last 4 settings to work as expected
	!SpriteGFXLocationInVRAMLo_4000 = $02				;| Don't use them unless you're using an emulator build/flashcart/custom made cartridge that supports 128 KB of VRAM
	!SpriteGFXLocationInVRAMLo_6000 = $03				;|
	!SpriteGFXLocationInVRAMLo_8000 = $04				;| 
	!SpriteGFXLocationInVRAMLo_A000 = $05				;|
	!SpriteGFXLocationInVRAMLo_C000 = $06				;|
	!SpriteGFXLocationInVRAMLo_E000 = $07				;/
	!SpriteGFXLocationInVRAMHi_Add1000 = $00			;\ Location of the second half of the sprite graphics in VRAM in relation to the first half
	!SpriteGFXLocationInVRAMHi_Add2000 = $08			;|
	!SpriteGFXLocationInVRAMHi_Add3000 = $10			;|
	!SpriteGFXLocationInVRAMHi_Add4000 = $18			;/
	!SpriteSize_8x8_16x16 = $00					;\ The sizes to use for sprites. The last two are not recommended to use.
	!SpriteSize_8x8_32x32 = $20					;|
	!SpriteSize_8x8_64x64 = $40					;|
	!SpriteSize_16x16_32x32 = $60					;|
	!SpriteSize_16x16_64x64 = $80					;|
	!SpriteSize_32x32_64x64 = $A0					;|
	!SpriteSize_16x32_32x64 = $C0					;|
	!SpriteSize_16x32_32x32 = $E0					;/
!REGISTER_OAMAddressLo = $002102
!REGISTER_OAMAddressHi = $002103
!REGISTER_OAMDataWritePort = $002104
!REGISTER_BGModeAndTileSizeSetting = $002105
	!BGModeAndTileSizeSetting_Mode00Enable = $00
	!BGModeAndTileSizeSetting_Mode01Enable = $01
	!BGModeAndTileSizeSetting_Mode02Enable = $02
	!BGModeAndTileSizeSetting_Mode03Enable = $03
	!BGModeAndTileSizeSetting_Mode04Enable = $04
	!BGModeAndTileSizeSetting_Mode05Enable = $05
	!BGModeAndTileSizeSetting_Mode06Enable = $06
	!BGModeAndTileSizeSetting_Mode07Enable = $07
	!BGModeAndTileSizeSetting_Mode01Layer3Priority = $08
	!BGModeAndTileSizeSetting_Use16x16Layer1Tiles = $10
	!BGModeAndTileSizeSetting_Use16x16Layer2Tiles = $20
	!BGModeAndTileSizeSetting_Use16x16Layer3Tiles = $40
	!BGModeAndTileSizeSetting_Use16x16Layer4Tiles = $80
!REGISTER_MosaicSizeAndBGEnable = $002106
	!MosaicSizeAndBGEnable_Layer1 = $01
	!MosaicSizeAndBGEnable_Layer2 = $02
	!MosaicSizeAndBGEnable_Layer3 = $04
	!MosaicSizeAndBGEnable_Layer4 = $08
	!MosaicSizeAndBGEnable_PixelSize1x1 = $00
	!MosaicSizeAndBGEnable_PixelSize2x2 = $10
	!MosaicSizeAndBGEnable_PixelSize3x3 = $20
	!MosaicSizeAndBGEnable_PixelSize4x4 = $30
	!MosaicSizeAndBGEnable_PixelSize5x5 = $40
	!MosaicSizeAndBGEnable_PixelSize6x6 = $50
	!MosaicSizeAndBGEnable_PixelSize7x7 = $60
	!MosaicSizeAndBGEnable_PixelSize8x8 = $70
	!MosaicSizeAndBGEnable_PixelSize9x9 = $80
	!MosaicSizeAndBGEnable_PixelSize10x10 = $90
	!MosaicSizeAndBGEnable_PixelSize11x11 = $A0
	!MosaicSizeAndBGEnable_PixelSize12x12 = $B0
	!MosaicSizeAndBGEnable_PixelSize13x13 = $C0
	!MosaicSizeAndBGEnable_PixelSize14x14 = $D0
	!MosaicSizeAndBGEnable_PixelSize15x15 = $E0
	!MosaicSizeAndBGEnable_PixelSize16x16 = $F0
!REGISTER_BG1AddressAndSize = $002107
!REGISTER_BG2AddressAndSize = $002108
!REGISTER_BG3AddressAndSize = $002109
!REGISTER_BG4AddressAndSize = $00210A
	!BGXAddressAndSize_EnableXMirroring = $01
	!BGXAddressAndSize_EnableYMirroring = $02
	!BGXAddressAndSize_VRAMAddr000000 = $00
	!BGXAddressAndSize_VRAMAddr000800 = $04
	!BGXAddressAndSize_VRAMAddr001000 = $08
	!BGXAddressAndSize_VRAMAddr001800 = $0C
	!BGXAddressAndSize_VRAMAddr002000 = $10
	!BGXAddressAndSize_VRAMAddr002800 = $14
	!BGXAddressAndSize_VRAMAddr003000 = $18
	!BGXAddressAndSize_VRAMAddr003800 = $1C
	!BGXAddressAndSize_VRAMAddr004000 = $20
	!BGXAddressAndSize_VRAMAddr004800 = $24
	!BGXAddressAndSize_VRAMAddr005000 = $28
	!BGXAddressAndSize_VRAMAddr005800 = $2C
	!BGXAddressAndSize_VRAMAddr006000 = $30
	!BGXAddressAndSize_VRAMAddr006800 = $34
	!BGXAddressAndSize_VRAMAddr007000 = $38
	!BGXAddressAndSize_VRAMAddr007800 = $3C
	!BGXAddressAndSize_VRAMAddr008000 = $40
	!BGXAddressAndSize_VRAMAddr008800 = $44
	!BGXAddressAndSize_VRAMAddr009000 = $48
	!BGXAddressAndSize_VRAMAddr009800 = $4C
	!BGXAddressAndSize_VRAMAddr00A000 = $50
	!BGXAddressAndSize_VRAMAddr00A800 = $54
	!BGXAddressAndSize_VRAMAddr00B000 = $58
	!BGXAddressAndSize_VRAMAddr00B800 = $5C
	!BGXAddressAndSize_VRAMAddr00C000 = $60
	!BGXAddressAndSize_VRAMAddr00C800 = $64
	!BGXAddressAndSize_VRAMAddr00D000 = $68
	!BGXAddressAndSize_VRAMAddr00D800 = $6C
	!BGXAddressAndSize_VRAMAddr00E000 = $70
	!BGXAddressAndSize_VRAMAddr00E800 = $74
	!BGXAddressAndSize_VRAMAddr00F000 = $78
	!BGXAddressAndSize_VRAMAddr00F800 = $7C
	!BGXAddressAndSize_VRAMAddr010000 = $80								;\ Note: The SNES only has 64 KB of VRAM, so these settings go unused.
	!BGXAddressAndSize_VRAMAddr010800 = $84								;|
	!BGXAddressAndSize_VRAMAddr011000 = $88								;|
	!BGXAddressAndSize_VRAMAddr011800 = $8C								;|
	!BGXAddressAndSize_VRAMAddr012000 = $90								;|
	!BGXAddressAndSize_VRAMAddr012800 = $94								;|
	!BGXAddressAndSize_VRAMAddr013000 = $98								;|
	!BGXAddressAndSize_VRAMAddr013800 = $9C								;|
	!BGXAddressAndSize_VRAMAddr014000 = $A0								;|
	!BGXAddressAndSize_VRAMAddr014800 = $A4								;|
	!BGXAddressAndSize_VRAMAddr015000 = $A8								;|
	!BGXAddressAndSize_VRAMAddr015800 = $AC								;|
	!BGXAddressAndSize_VRAMAddr016000 = $B0								;|
	!BGXAddressAndSize_VRAMAddr016800 = $B4								;|
	!BGXAddressAndSize_VRAMAddr017000 = $B8								;|
	!BGXAddressAndSize_VRAMAddr017800 = $BC								;|
	!BGXAddressAndSize_VRAMAddr018000 = $C0								;|
	!BGXAddressAndSize_VRAMAddr018800 = $C4								;|
	!BGXAddressAndSize_VRAMAddr019000 = $C8								;|
	!BGXAddressAndSize_VRAMAddr019800 = $CC								;|
	!BGXAddressAndSize_VRAMAddr01A000 = $D0								;|
	!BGXAddressAndSize_VRAMAddr01A800 = $D4								;|
	!BGXAddressAndSize_VRAMAddr01B000 = $D8								;|
	!BGXAddressAndSize_VRAMAddr01B800 = $DC								;|
	!BGXAddressAndSize_VRAMAddr01C000 = $E0								;|
	!BGXAddressAndSize_VRAMAddr01C800 = $E4								;|
	!BGXAddressAndSize_VRAMAddr01D000 = $E8								;|
	!BGXAddressAndSize_VRAMAddr01D800 = $EC								;|
	!BGXAddressAndSize_VRAMAddr01E000 = $F0								;|
	!BGXAddressAndSize_VRAMAddr01E800 = $F4								;|
	!BGXAddressAndSize_VRAMAddr01F000 = $F8								;|
	!BGXAddressAndSize_VRAMAddr01F800 = $FC								;/

!REGISTER_BG1And2TileDataDesignation = $00210B
	!BG1And2TileDataDesignation_Layer1Addr000000 = $00
	!BG1And2TileDataDesignation_Layer1Addr002000 = $01
	!BG1And2TileDataDesignation_Layer1Addr004000 = $02
	!BG1And2TileDataDesignation_Layer1Addr006000 = $03
	!BG1And2TileDataDesignation_Layer1Addr008000 = $04
	!BG1And2TileDataDesignation_Layer1Addr00A000 = $05
	!BG1And2TileDataDesignation_Layer1Addr00C000 = $06
	!BG1And2TileDataDesignation_Layer1Addr00E000 = $07
	!BG1And2TileDataDesignation_Layer1Addr010000 = $08						;\ Note: The SNES only has 64 KB of VRAM, so these settings go unused.
	!BG1And2TileDataDesignation_Layer1Addr012000 = $09						;|
	!BG1And2TileDataDesignation_Layer1Addr014000 = $0A						;|
	!BG1And2TileDataDesignation_Layer1Addr016000 = $0B						;|
	!BG1And2TileDataDesignation_Layer1Addr018000 = $0C						;|
	!BG1And2TileDataDesignation_Layer1Addr01A000 = $0D						;|
	!BG1And2TileDataDesignation_Layer1Addr01C000 = $0E						;|
	!BG1And2TileDataDesignation_Layer1Addr01E000 = $0F						;/
	!BG1And2TileDataDesignation_Layer2Addr000000 = $00
	!BG1And2TileDataDesignation_Layer2Addr002000 = $10
	!BG1And2TileDataDesignation_Layer2Addr004000 = $20
	!BG1And2TileDataDesignation_Layer2Addr006000 = $30
	!BG1And2TileDataDesignation_Layer2Addr008000 = $40
	!BG1And2TileDataDesignation_Layer2Addr00A000 = $50
	!BG1And2TileDataDesignation_Layer2Addr00C000 = $60
	!BG1And2TileDataDesignation_Layer2Addr00E000 = $70
	!BG1And2TileDataDesignation_Layer2Addr010000 = $80						;\ Note: The SNES only has 64 KB of VRAM, so these settings go unused.
	!BG1And2TileDataDesignation_Layer2Addr012000 = $90						;|
	!BG1And2TileDataDesignation_Layer2Addr014000 = $A0						;|
	!BG1And2TileDataDesignation_Layer2Addr016000 = $B0						;|
	!BG1And2TileDataDesignation_Layer2Addr018000 = $C0						;|
	!BG1And2TileDataDesignation_Layer2Addr01A000 = $D0						;|
	!BG1And2TileDataDesignation_Layer2Addr01C000 = $E0						;|
	!BG1And2TileDataDesignation_Layer2Addr01E000 = $F0						;/
!REGISTER_BG3And4TileDataDesignation = $00210C
	!BG1And2TileDataDesignation_Layer3Addr000000 = $00
	!BG1And2TileDataDesignation_Layer3Addr002000 = $01
	!BG1And2TileDataDesignation_Layer3Addr004000 = $02
	!BG1And2TileDataDesignation_Layer3Addr006000 = $03
	!BG1And2TileDataDesignation_Layer3Addr008000 = $04
	!BG1And2TileDataDesignation_Layer3Addr00A000 = $05
	!BG1And2TileDataDesignation_Layer3Addr00C000 = $06
	!BG1And2TileDataDesignation_Layer3Addr00E000 = $07
	!BG1And2TileDataDesignation_Layer3Addr010000 = $08						;\ Note: The SNES only has 64 KB of VRAM, so these settings go unused.
	!BG1And2TileDataDesignation_Layer3Addr012000 = $09						;|
	!BG1And2TileDataDesignation_Layer3Addr014000 = $0A						;|
	!BG1And2TileDataDesignation_Layer3Addr016000 = $0B						;|
	!BG1And2TileDataDesignation_Layer3Addr018000 = $0C						;|
	!BG1And2TileDataDesignation_Layer3Addr01A000 = $0D						;|
	!BG1And2TileDataDesignation_Layer3Addr01C000 = $0E						;|
	!BG1And2TileDataDesignation_Layer3Addr01E000 = $0F						;/
	!BG1And2TileDataDesignation_Layer4Addr000000 = $00
	!BG1And2TileDataDesignation_Layer4Addr002000 = $10
	!BG1And2TileDataDesignation_Layer4Addr004000 = $20
	!BG1And2TileDataDesignation_Layer4Addr006000 = $30
	!BG1And2TileDataDesignation_Layer4Addr008000 = $40
	!BG1And2TileDataDesignation_Layer4Addr00A000 = $50
	!BG1And2TileDataDesignation_Layer4Addr00C000 = $60
	!BG1And2TileDataDesignation_Layer4Addr00E000 = $70
	!BG1And2TileDataDesignation_Layer4Addr010000 = $80						;\ Note: The SNES only has 64 KB of VRAM, so these settings go unused.
	!BG1And2TileDataDesignation_Layer4Addr012000 = $90						;|
	!BG1And2TileDataDesignation_Layer4Addr014000 = $A0						;|
	!BG1And2TileDataDesignation_Layer4Addr016000 = $B0						;|
	!BG1And2TileDataDesignation_Layer4Addr018000 = $C0						;|
	!BG1And2TileDataDesignation_Layer4Addr01A000 = $D0						;|
	!BG1And2TileDataDesignation_Layer4Addr01C000 = $E0						;|
	!BG1And2TileDataDesignation_Layer4Addr01E000 = $F0						;/
!REGISTER_BG1HorizScrollOffset = $00210D
!REGISTER_BG1VertScrollOffset = $00210E
!REGISTER_BG2HorizScrollOffset = $00210F
!REGISTER_BG2VertScrollOffset = $002110
!REGISTER_BG3HorizScrollOffset = $002111
!REGISTER_BG3VertScrollOffset = $002112
!REGISTER_BG4HorizScrollOffset = $002113
!REGISTER_BG4VertScrollOffset = $002114
!REGISTER_VRAMAddressIncrementValue = $002115
	!VRAMAddressIncrementValue_IncrementBy01 = $00
	!VRAMAddressIncrementValue_IncrementBy20 = $01
	!VRAMAddressIncrementValue_IncrementBy80 = $02
	!VRAMAddressIncrementValue_CopyOfIncrementBy80 = $03
	!VRAMAddressIncrementValue_IncrementOnLoByte = $00
	!VRAMAddressIncrementValue_IncrementOnHiByte = $80
	!VRAMAddressIncrementValue_NoAddrRemap = $00
	!VRAMAddressIncrementValue_08BitRotate = $04			;\ Note: These are intended for 4 color, 16 color, and 256 color bitmaps respectively.
	!VRAMAddressIncrementValue_09BitRotate = $08			;|
	!VRAMAddressIncrementValue_10BitRotate = $0A			;/
!REGISTER_VRAMAddressLo = $002116
!REGISTER_VRAMAddressHi = $002117
!REGISTER_WriteToVRAMPortLo = $002118
!REGISTER_WriteToVRAMPortHi = $002119
!REGISTER_Mode7TilemapSettings = $00211A
	!Mode7TilemapSettings_EnableXMirroring = $01
	!Mode7TilemapSettings_EnableYMirroring = $02
	!Mode7TilemapSettings_WrapTilemap = $00
	!Mode7TilemapSettings_CopyOfWrapTilemap = $40
	!Mode7TilemapSettings_TransparentBlankArea = $80
	!Mode7TilemapSettings_FillBlankAreaWithTile00 = $C0
!REGISTER_Mode7MatrixParameterA = $00211B
!REGISTER_Mode7MatrixParameterB = $00211C
!REGISTER_Mode7MatrixParameterC = $00211D
!REGISTER_Mode7MatrixParameterD = $00211E
!REGISTER_Mode7CenterX = $00211F
!REGISTER_Mode7CenterY = $002120
!REGISTER_CGRAMAddress = $002121
!REGISTER_WriteToCGRAMPort = $002122
!REGISTER_BG1And2WindowMaskSettings = $002123
	!BGXAndYWindowMaskSettings_Window1_BG1_Disable = $00
	!BGXAndYWindowMaskSettings_Window1_BG1_CopyOfDisable = $01
	!BGXAndYWindowMaskSettings_Window1_BG1_Inside = $02
	!BGXAndYWindowMaskSettings_Window1_BG1_Outside = $03
	!BGXAndYWindowMaskSettings_Window2_BG1_Disable = $00
	!BGXAndYWindowMaskSettings_Window2_BG1_CopyOfDisable = $04
	!BGXAndYWindowMaskSettings_Window2_BG1_Inside = $08
	!BGXAndYWindowMaskSettings_Window2_BG1_Outside = $0C
	!BGXAndYWindowMaskSettings_Window1_BG2_Disable = $00
	!BGXAndYWindowMaskSettings_Window1_BG2_CopyOfDisable = $10
	!BGXAndYWindowMaskSettings_Window1_BG2_Inside = $20
	!BGXAndYWindowMaskSettings_Window1_BG2_Outside = $30
	!BGXAndYWindowMaskSettings_Window2_BG2_Disable = $00
	!BGXAndYWindowMaskSettings_Window2_BG2_CopyOfDisable = $40
	!BGXAndYWindowMaskSettings_Window2_BG2_Inside = $80
	!BGXAndYWindowMaskSettings_Window2_BG2_Outside = $C0
!REGISTER_BG3And4WindowMaskSettings = $002124
	!BGXAndYWindowMaskSettings_Window1_BG3_Disable = $00
	!BGXAndYWindowMaskSettings_Window1_BG3_CopyOfDisable = $01
	!BGXAndYWindowMaskSettings_Window1_BG3_Inside = $02
	!BGXAndYWindowMaskSettings_Window1_BG3_Outside = $03
	!BGXAndYWindowMaskSettings_Window2_BG3_Disable = $00
	!BGXAndYWindowMaskSettings_Window2_BG3_CopyOfDisable = $04
	!BGXAndYWindowMaskSettings_Window2_BG3_Inside = $08
	!BGXAndYWindowMaskSettings_Window2_BG3_Outside = $0C
	!BGXAndYWindowMaskSettings_Window1_BG4_Disable = $00
	!BGXAndYWindowMaskSettings_Window1_BG4_CopyOfDisable = $10
	!BGXAndYWindowMaskSettings_Window1_BG4_Inside = $20
	!BGXAndYWindowMaskSettings_Window1_BG4_Outside = $30
	!BGXAndYWindowMaskSettings_Window2_BG4_Disable = $00
	!BGXAndYWindowMaskSettings_Window2_BG4_CopyOfDisable = $40
	!BGXAndYWindowMaskSettings_Window2_BG4_Inside = $80
	!BGXAndYWindowMaskSettings_Window2_BG4_Outside = $C0
!REGISTER_ObjectAndColorWindowSettings = $002125
	!BGXAndYWindowMaskSettings_Window1_Sprite_Disable = $00
	!BGXAndYWindowMaskSettings_Window1_Sprite_CopyOfDisable = $01
	!BGXAndYWindowMaskSettings_Window1_Sprite_Inside = $02
	!BGXAndYWindowMaskSettings_Window1_Sprite_Outside = $03
	!BGXAndYWindowMaskSettings_Window2_Sprite_Disable = $00
	!BGXAndYWindowMaskSettings_Window2_Sprite_CopyOfDisable = $04
	!BGXAndYWindowMaskSettings_Window2_Sprite_Inside = $08
	!BGXAndYWindowMaskSettings_Window2_Sprite_Outside = $0C
	!BGXAndYWindowMaskSettings_Window1_ColorMath_Disable = $00
	!BGXAndYWindowMaskSettings_Window1_ColorMath_CopyOfDisable = $10
	!BGXAndYWindowMaskSettings_Window1_ColorMath_Inside = $20
	!BGXAndYWindowMaskSettings_Window1_ColorMath_Outside = $30
	!BGXAndYWindowMaskSettings_Window2_ColorMath_Disable = $00
	!BGXAndYWindowMaskSettings_Window2_ColorMath_CopyOfDisable = $40
	!BGXAndYWindowMaskSettings_Window2_ColorMath_Inside = $80
	!BGXAndYWindowMaskSettings_Window2_ColorMath_Outside = $C0
!REGISTER_Window1LeftPositionDesignation = $002126
!REGISTER_Window1RightPositionDesignation = $002127
!REGISTER_Window2LeftPositionDesignation = $002128
!REGISTER_Window2RightPositionDesignation = $002129
!REGISTER_BGWindowLogicSettings = $00212A
	!BGXAndYWindowMaskSettings_BG1_OR = $00
	!BGXAndYWindowMaskSettings_BG1_AND = $01
	!BGXAndYWindowMaskSettings_BG1_XOR = $02
	!BGXAndYWindowMaskSettings_BG1_XNOR = $03
	!BGXAndYWindowMaskSettings_BG2_OR = $00
	!BGXAndYWindowMaskSettings_BG2_AND = $04
	!BGXAndYWindowMaskSettings_BG2_XOR = $08
	!BGXAndYWindowMaskSettings_BG2_XNOR = $0C
	!BGXAndYWindowMaskSettings_BG3_OR = $00
	!BGXAndYWindowMaskSettings_BG3_AND = $10
	!BGXAndYWindowMaskSettings_BG3_XOR = $20
	!BGXAndYWindowMaskSettings_BG3_XNOR = $30
	!BGXAndYWindowMaskSettings_BG4_OR = $00
	!BGXAndYWindowMaskSettings_BG4_AND = $40
	!BGXAndYWindowMaskSettings_BG4_XOR = $80
	!BGXAndYWindowMaskSettings_BG4_XNOR = $C0
!REGISTER_ColorAndObjectWindowLogicSettings = $00212B
	!BGXAndYWindowMaskSettings_Sprite_OR = $00
	!BGXAndYWindowMaskSettings_Sprite_AND = $01
	!BGXAndYWindowMaskSettings_Sprite_XOR = $02
	!BGXAndYWindowMaskSettings_Sprite_XNOR = $03
	!BGXAndYWindowMaskSettings_BG2_OR = $00
	!BGXAndYWindowMaskSettings_ColorMath_AND = $04
	!BGXAndYWindowMaskSettings_ColorMath_XOR = $08
	!BGXAndYWindowMaskSettings_ColorMath_XNOR = $0C
!REGISTER_MainScreenLayers = $00212C
!REGISTER_SubScreenLayers = $00212D
	!XScreenLayers_EnableLayer1 = $01
	!XScreenLayers_EnableLayer2 = $02
	!XScreenLayers_EnableLayer3 = $04
	!XScreenLayers_EnableLayer4 = $08
	!XScreenLayers_EnableSprites = $10
!REGISTER_MainScreenWindowMask = $00212E
!REGISTER_SubScreenWindowMask = $00212F
	!XScreenWindowMask_EnableLayer1 = $01
	!XScreenWindowMask_EnableLayer2 = $02
	!XScreenWindowMask_EnableLayer3 = $04
	!XScreenWindowMask_EnableLayer4 = $08
	!XScreenWindowMask_EnableSprites = $10
!REGISTER_ColorMathInitialSettings = $002130
	!ColorMathSelectAndEnable_DisableDirectColorMode = $00
	!ColorMathSelectAndEnable_EnableDirectColorMode = $01
	!ColorMathSelectAndEnable_EnableColorMathOnSubscreen = $02
	!ColorMathSelectAndEnable_NeverPrevenColorMath = $00
	!ColorMathSelectAndEnable_PrevenColorMathOutsideWindow = $10
	!ColorMathSelectAndEnable_PrevenColorMathInsideWindow = $20
	!ColorMathSelectAndEnable_AlwaysPrevenColorMath = $30
	!ColorMathSelectAndEnable_NeverClipColorsToBlack = $00
	!ColorMathSelectAndEnable_ClipColorsToBlackOutsideWindow = $40
	!ColorMathSelectAndEnable_ClipColorsToBlackInsideWindow = $80
	!ColorMathSelectAndEnable_AlwaysClipColorsToBlack = $C0
!REGISTER_ColorMathSelectAndEnable = $002131
	!ColorMathSelectAndEnable_EnableLayer1 = $01
	!ColorMathSelectAndEnable_EnableLayer2 = $02
	!ColorMathSelectAndEnable_EnableLayer3 = $04
	!ColorMathSelectAndEnable_EnableLayer4 = $08
	!ColorMathSelectAndEnable_EnableSprites = $10
	!ColorMathSelectAndEnable_EnableBackdrop = $20
	!ColorMathSelectAndEnable_HalfColorMath = $40
	!ColorMathSelectAndEnable_Addition = $00
	!ColorMathSelectAndEnable_Subtraction = $80
!REGISTER_FixedColorData = $002132
!REGISTER_InitialScreenSettings = $002133
	!InitialScreenSettings_ScreenInterlaceFlag = $01
	!InitialScreenSettings_SpriteInterlaceFlag = $02
	!InitialScreenSettings_EnableOverscanFlag = $04
	!InitialScreenSettings_EnablePseudoHiResFlag = $08
	!InitialScreenSettings_EnableMode7EXTBG = $40
	!InitialScreenSettings_NormalExternalSync = $00
	!InitialScreenSettings_SuperImposeExternalSync = $80
!REGISTER_PPUMultiplicationProductLo = $002134
!REGISTER_PPUMultiplicationProductMid = $002135
!REGISTER_PPUMultiplicationProductHi = $002136
!REGISTER_SoftwareLatchForHVCounter = $002137
!REGISTER_ReadFromOAMPort = $002138
!REGISTER_ReadFromVRAMPortLo = $002139
!REGISTER_ReadFromVRAMPortHi = $00213A
!REGISTER_ReadFromCGRAMPort = $00213B
!REGISTER_HCounter = $00213C
!REGISTER_VCounter = $00213D
!REGISTER_PPUStatusFlag1 = $00213E
	!PPUStatusFlag1_PPU1VersionNumber = $0F
	!PPUStatusFlag1_MasterSlaveModeFlag = $20
	!PPUStatusFlag1_RangeOverFlag = $40
	!PPUStatusFlag1_TimeOverFlag = $80
!REGISTER_PPUStatusFlag2 = $00213F
	!PPUStatusFlag1_PPU2VersionNumber = $0F
	!PPUStatusFlag2_ConsoleRegion = $10
	!PPUStatusFlag2_PPULatchFlag = $40
	!PPUStatusFlag2_InterlaceField = $80
!REGISTER_APUPort0 = $002140
!REGISTER_APUPort1 = $002141
!REGISTER_APUPort2 = $002142
!REGISTER_APUPort3 = $002143
!REGISTER_ReadOrWriteToWRAMPort = $002180
!REGISTER_WRAMAddressLo = $002181
!REGISTER_WRAMAddressHi = $002182
!REGISTER_WRAMAddressBank = $002183
!REGISTER_JoypadSerialPort1 = $004016
!REGISTER_JoypadSerialPort2 = $004017
!REGISTER_IRQNMIAndJoypadEnableFlags = $004200
	!IRQNMIAndJoypadEnableFlags_EnableAutoJoypadRead = $01
	!IRQNMIAndJoypadEnableFlags_DisableIRQs = $00
	!IRQNMIAndJoypadEnableFlags_EanbleIRQsAtVPos = $10
	!IRQNMIAndJoypadEnableFlags_EanbleIRQsAtHPos = $20
	!IRQNMIAndJoypadEnableFlags_EanbleIRQsAtHVPos = $30
	!IRQNMIAndJoypadEnableFlags_DisableNMI = $00
	!IRQNMIAndJoypadEnableFlags_EnableNMI = $80
!REGISTER_ProgrammableIOPortOutput = $004201
	!ProgrammableIOPortOutput_Joypad1Pin6 = $40
	!ProgrammableIOPortOutput_Joypad2Pin6 = $80
!REGISTER_Multiplicand = $004202
!REGISTER_Multiplier = $004203
!REGISTER_DividendLo = $004204
!REGISTER_DividendHi = $004205
!REGISTER_Divisor = $004206
!REGISTER_HCountTimerLo = $004207
!REGISTER_HCountTimerHi = $004208
!REGISTER_VCountTimerLo = $004209
!REGISTER_VCountTimerHi = $00420A
!REGISTER_DMAEnable = $00420B
!REGISTER_HDMAEnable = $00420C
	!DMAEnable_Channel0 = $01
	!DMAEnable_Channel1 = $02
	!DMAEnable_Channel2 = $04
	!DMAEnable_Channel3 = $08
	!DMAEnable_Channel4 = $10
	!DMAEnable_Channel5 = $20
	!DMAEnable_Channel6 = $40
	!DMAEnable_Channel7 = $80
!REGISTER_EnableFastROM = $00420D
!REGISTER_NMIEnable = $004210
	!NMIEnable_5A22ChipVersionNumber = $0F
	!NMIEnable_NMIFlag = $80
!REGISTER_IRQEnable = $004211
	!IRQEnable_IRQFlag = $80
!REGISTER_HVBlankFlagsAndJoypadStatus = $004212
	!HVBlankFlagsAndJoypadStatus_AutoJoypadReadStatus = $01
	!HVBlankFlagsAndJoypadStatus_HBlankFlag = $40
	!HVBlankFlagsAndJoypadStatus_VBlankFlag = $80
!REGISTER_ProgrammableIOPortInput = $004213
!REGISTER_QuotientLo = $004214
!REGISTER_QuotientHi = $004215
!REGISTER_ProductOrRemainderLo = $004216
!REGISTER_ProductOrRemainderHi = $004217
!REGISTER_Joypad1Lo = $004218
!REGISTER_Joypad1Hi = $004219
!REGISTER_Joypad2Lo = $00421A
!REGISTER_Joypad2Hi = $00421B
!REGISTER_Joypad3Lo = $00421C
!REGISTER_Joypad3Hi = $00421D
!REGISTER_Joypad4Lo = $00421E
!REGISTER_Joypad4Hi = $00421F

org $000000
; struct DMA $004300
; 	.Parameters: skip $01
; 	.Destination: skip $01
; 	.SourceLo: skip $01
; 	.SourceHi: skip $01
; 	.SourceBank: skip $01
; 	.SizeLo: skip $01
; 	.SizeHi: skip $01
; 	.Unused1: skip $01
; 	.Unused2: skip $01
; 	.Unused3: skip $01
; 	.Unused4: skip $01
; endstruct align $10

; struct HDMA $004300
; 	.Parameters: skip $01
; 	.Destination: skip $01
; 	.SourceLo: skip $01
; 	.SourceHi: skip $01
; 	.SourceBank: skip $01
; 	.IndirectSourceLo: skip $01
; 	.IndirectSourceHi: skip $01
; 	.IndirectSourceBank: skip $01
; 	.TableSourceLo: skip $01
; 	.TableSourceHi: skip $01
; 	.LineCount: skip $01
; endstruct align $10

	!DMAParams_TransferMode_1Reg1Write = $00
	!DMAParams_TransferMode_2Regs1Write = $01
	!DMAParams_TransferMode_1Reg2Writes = $02
	!DMAParams_TransferMode_2Regs2Writes = $03
	!DMAParams_TransferMode_4Regs1Write = $04
	!DMAParams_TransferMode_2Regs2WritesAlternating = $05
	!DMAParams_TransferMode_CopyOf1Reg2Writes = $06
	!DMAParams_TransferMode_CopyOf2Regs2Writes = $07
	!DMAParams_EnableFixedTransfer = $08
	!DMAParams_IncrementSourceAddr = $00
	!DMAParams_DecrementSourceAddr = $10
	!DMAParams_HDMAUseDirectAddr = $00
	!DMAParams_HDMAUseIndirectAddr = $40
	!DMAParams_TransferDirection_ABusToBBus = $00
	!DMAParams_TransferDirection_BBusToABus = $80

;---------------------------------------------------------------------------

; Main ROM assembly specific macros

macro BANK_START(Bank)
assert !InBank == !FALSE, "You must put a BANK_END macro before calling BANK_START again!"
assert !BANKType_<Bank>&$04 == $00, "Bank $<Bank> has already been inserted!"
assert !CurrentBank <= $<Bank>, "It's risky inserting banks in non-ascending order! Please insert bank $<Bank> before bank !CurrentBank."

;if $<Bank> >= !StartOfMirrorBanks|((!FastROMAddressOffset|!HiROMAddressOffset)>>16)
	if $<Bank> > $FF
		error "Bank $<Bank> is beyond what the SNES can address."
	;else
	;	error "Bank $<Bank> is outside the range of the chosen ROM size. Use %HandleROMMirroring() if you intend to use ROM mirroring or set the ROM Layout to one of the FastROM settings if you wanted FastROM addressing."
	endif
;endif
if !BANKType_<Bank> == $FF
	error "Bank $<Bank> is not a valid ROM bank in this memory map!"
else
	!BANKType_<Bank> #= !BANKType_<Bank>|$04
endif
;if !BANKType_<Bank>&$02 != $00
;else
	if !BANKType_<Bank>&$01 == $00
		org (($<Bank><<16)+$8000)|!FastROMAddressOffset|!HiROMAddressOffset
		!InLoROMBank #= !TRUE
	else
		org ($<Bank><<16)|!FastROMAddressOffset|!HiROMAddressOffset
		!InLoROMBank #= !FALSE
	endif
	ROMBANK<Bank>_START:
	!InBank = !TRUE
	!CurrentBank = $<Bank>
;endif
endmacro

;---------------------------------------------------------------------------

macro BANK_END(Bank)
assert !InBank == !TRUE, "You must put a BANK_START macro before calling BANK_END!"
assert !CurrentBank <= $<Bank>, "The bank parameter of BANK_END must be greater than or equal to the bank parameter in the previous BANK_START!"
assert !InROMMirror == 0, "You must turn off ROM mirroring via EndROMMirroring() before a BANK_END() macro!"
if !BANKType_<Bank>&$20 != $00
	if !NumOfInsertedSNESHeader == $00
		if !Define_Global_ROMType == !ROMType_SatellaviewGame
			%Satelliview_Header(!SNESHeaderLoc)
		else
			%SNES_Header(!SNESHeaderLoc)
		endif
	endif
endif
;if $<Bank> >= !StartOfMirrorBanks|((!FastROMAddressOffset|!HiROMAddressOffset)>>16)
;	error "Bank $<Bank> is outside the range of the chosen ROM size. Use %HandleROMMirroring() if you intend to use ROM mirroring or set the ROM Layout to one of the FastROM settings if you wanted FastROM addressing."
;endif

if !InSuperFXHiROMMirror == !TRUE
	if (!CurrentBank/$02)|$40 == ($<Bank>/$02)|$40
		print "- Bank $",hex(($<Bank>/$02)|$40)," bytes: ", bytes
	else
		print "- Bank $",hex((!CurrentBank/$02)|$40),"-$",hex(($<Bank>/$02)|$40)," bytes: ", bytes
	endif
else
	if !ROMBankSplitFlag == !TRUE
		print "- Bank $<Bank> (Upper) bytes: ", bytes
	elseif !CurrentBank == $<Bank>
		print "- Bank $<Bank> bytes: ", bytes
	else
		print "- Bank !CurrentBank-$<Bank> bytes: ", bytes
	endif
endif
if !CurrentBank != $FF
	if !InSuperFXHiROMMirror == !TRUE
		warnpc ((($<Bank>/$02)<<16)|$400000)+$10000
		!InSuperFXHiROMMirror = !FALSE
	else
		if !ROMBankSplitFlag == !TRUE
			warnpc ((($<Bank><<16)+$10000)|!FastROMAddressOffset)^!HiROMAddressOffset
		else
			warnpc (($<Bank><<16)+$10000)|!FastROMAddressOffset|!HiROMAddressOffset
		endif
	endif
endif
	reset bytes
	!InBank = !FALSE
	!ROMBankSplitFlag = !FALSE
	!CurrentBank = $<Bank>
	ROMBANK<Bank>_END:
endmacro

;---------------------------------------------------------------------------

macro HiROMBankSplit()
if !InLoROMBank == !FALSE
	if !Define_Global_CustomChip&$7F == !Chip_SA1
		if !Define_Global_ROMSize > !ROMSize_4MB
		else
			warnpc ((!CurrentBank<<16)+$8000)|!FastROMAddressOffset|!HiROMAddressOffset
			org (((!CurrentBank<<16)+$8000)|!FastROMAddressOffset)^!HiROMAddressOffset
		endif
	else
		warnpc ((!CurrentBank<<16)+$8000)|!FastROMAddressOffset|!HiROMAddressOffset
		org (((!CurrentBank<<16)+$8000)|!FastROMAddressOffset)^!HiROMAddressOffset
	endif
	!ROMBankSplitFlag = !TRUE
	print "- Bank !CurrentBank (Lower) bytes: ", bytes
	reset bytes
else
	error "%HiROMBankSplit() is only meant to be used in HiROM banks!"
endif
endmacro

;---------------------------------------------------------------------------

macro BeginROMMirroring(Address, Offset, Flip)
if !Define_Global_IgnoreCodeAlignments|!Define_Global_DisableROMMirroring == !FALSE
	if !StartOfMirrorBanks < $0100
		assert !InROMMirror == !FALSE, "You must end ROM mirroring via EndROMMirroring() before starting another mirror block."
		!TEMP = (<Flip>^<Address>)+((<Offset>*!StartOfMirrorBanks)<<16)&$00FFFFFF
		if (!TEMP>>16)&$FE == $7E
			error "This HandleROMMirroring() macro call points to a RAM bank!"
		else
			warnpc <Address>
			!InROMMirror = !TRUE
			base !TEMP
		endif
	else
		error "This ROM has no ROM mirror banks, so you must set \!Define_Global_DisableROMMirroring to \!TRUE or else pointers affected by HandleROMMirroring() will point to the wrong addresses!"
	endif
endif
endmacro

;---------------------------------------------------------------------------

macro InsertMacroAtXPosition(Address)
if !Define_Global_IgnoreCodeAlignments == !FALSE
	if stringsequal("<Address>", "NULLROM")
	else
		if !InROMMirror == !FALSE
			if !ROMBankSplitFlag == !TRUE
				warnpc (<Address>|!FastROMAddressOffset)^!HiROMAddressOffset
				org (<Address>|!FastROMAddressOffset)^!HiROMAddressOffset
			else
				warnpc <Address>|!FastROMAddressOffset|!HiROMAddressOffset
				org <Address>|!FastROMAddressOffset|!HiROMAddressOffset
			endif
		else
			if !ROMBankSplitFlag == !TRUE
				warnpc (<Address>|!FastROMAddressOffset)^!HiROMAddressOffset
				base (<Address>|!FastROMAddressOffset)^!HiROMAddressOffset
			else
				warnpc <Address>|!FastROMAddressOffset|!HiROMAddressOffset
				base <Address>|!FastROMAddressOffset|!HiROMAddressOffset
			endif
		endif
	endif
endif
endmacro

;---------------------------------------------------------------------------

macro EndROMMirroring()
if !Define_Global_IgnoreCodeAlignments|!Define_Global_DisableROMMirroring == !FALSE
	if !StartOfMirrorBanks < $0100
		assert !InROMMirror == !TRUE, "You must start ROM mirroring via BeginROMMirroring() before ending a mirror block."
		!InROMMirror = !FALSE
		base off
	endif
endif
endmacro

;---------------------------------------------------------------------------

macro SetDuplicateOrNullPointer(BaseLoc, Pointer)
base <BaseLoc>
<Pointer>:
base off
endmacro

;---------------------------------------------------------------------------

;SPC700 registers/IPLROM
;$00F0
!REGISTER_SPC700_ControlRegister = $00F1
!REGISTER_SPC700_DSPRegisterIndex = $00F2
!REGISTER_SPC700_ReadWriteToDSPRegister = $00F3
!REGISTER_SPC700_APUPort0 = $00F4
!REGISTER_SPC700_APUPort1 = $00F5
!REGISTER_SPC700_APUPort2 = $00F6
!REGISTER_SPC700_APUPort3 = $00F7
;$00F8
;$00F9
!REGISTER_SPC700_Timer0 = $00FA
!REGISTER_SPC700_Timer1 = $00FB
!REGISTER_SPC700_Timer2 = $00FC
!REGISTER_SPC700_Counter0 = $00FD
!REGISTER_SPC700_Counter1 = $00FE
!REGISTER_SPC700_Counter2 = $00FF
!REGISTER_SPC700_IPLROMLoc = $FFC0

;DSP registers					; Note: Any register that has "ChannelX" in the name are meant to be used with the "!DSPChannelX" defines below.
!REGISTER_DSP_ChannelXLeftVolume = $00
	!DSPChannel1 = $00
	!DSPChannel2 = $10
	!DSPChannel3 = $20
	!DSPChannel4 = $30
	!DSPChannel5 = $40
	!DSPChannel6 = $50
	!DSPChannel7 = $60
	!DSPChannel8 = $70
!REGISTER_DSP_ChannelXRightVolume = $01
!REGISTER_DSP_ChannelXPitchLo = $02
!REGISTER_DSP_ChannelXPitchHi = $03
!REGISTER_DSP_ChannelXSourceNumber = $04
!REGISTER_DSP_ChannelXToggleADSROrGAIN = $05
!REGISTER_DSP_ChannelXADSREnvelope = $06
!REGISTER_DSP_ChannelXGAINEnvelope = $07
!REGISTER_DSP_ChannelXWriteEnvelope = $08
!REGISTER_DSP_ChannelXWriteWaveform = $09
!REGISTER_DSP_MainLeftVolume = $0C
!REGISTER_DSP_EchoFeedback = $0D
!REGISTER_DSP_ChannelXFIRFilerCoefficients = $0F
!REGISTER_DSP_MainRightVolume = $1C
!REGISTER_DSP_EchoLeftVolume = $2C
!REGISTER_DSP_PitchModulation = $2D
!REGISTER_DSP_EchoRightVolume = $3C
!REGISTER_DSP_NoiseEnable = $3D
!REGISTER_DSP_KeyOnBits = $4C
!REGISTER_DSP_EchoEnable = $4D
!REGISTER_DSP_KeyOffBits = $5C
!REGISTER_DSP_SourceDirectoryOffset = $5D
	!SourceDirectoryOffset_0000 = $0000
	!SourceDirectoryOffset_0100 = $0100
	!SourceDirectoryOffset_0200 = $0200
	!SourceDirectoryOffset_0300 = $0300
	!SourceDirectoryOffset_0400 = $0400
	!SourceDirectoryOffset_0500 = $0500
	!SourceDirectoryOffset_0600 = $0600
	!SourceDirectoryOffset_0700 = $0700
	!SourceDirectoryOffset_0800 = $0800
	!SourceDirectoryOffset_0900 = $0900
	!SourceDirectoryOffset_0A00 = $0A00
	!SourceDirectoryOffset_0B00 = $0B00
	!SourceDirectoryOffset_0C00 = $0C00
	!SourceDirectoryOffset_0D00 = $0D00
	!SourceDirectoryOffset_0E00 = $0E00
	!SourceDirectoryOffset_0F00 = $0F00
	!SourceDirectoryOffset_1000 = $1000
	!SourceDirectoryOffset_1100 = $1100
	!SourceDirectoryOffset_1200 = $1200
	!SourceDirectoryOffset_1300 = $1300
	!SourceDirectoryOffset_1400 = $1400
	!SourceDirectoryOffset_1500 = $1500
	!SourceDirectoryOffset_1600 = $1600
	!SourceDirectoryOffset_1700 = $1700
	!SourceDirectoryOffset_1800 = $1800
	!SourceDirectoryOffset_1900 = $1900
	!SourceDirectoryOffset_1A00 = $1A00
	!SourceDirectoryOffset_1B00 = $1B00
	!SourceDirectoryOffset_1C00 = $1C00
	!SourceDirectoryOffset_1D00 = $1D00
	!SourceDirectoryOffset_1E00 = $1E00
	!SourceDirectoryOffset_1F00 = $1F00
	!SourceDirectoryOffset_2000 = $2000
	!SourceDirectoryOffset_2100 = $2100
	!SourceDirectoryOffset_2200 = $2200
	!SourceDirectoryOffset_2300 = $2300
	!SourceDirectoryOffset_2400 = $2400
	!SourceDirectoryOffset_2500 = $2500
	!SourceDirectoryOffset_2600 = $2600
	!SourceDirectoryOffset_2700 = $2700
	!SourceDirectoryOffset_2800 = $2800
	!SourceDirectoryOffset_2900 = $2900
	!SourceDirectoryOffset_2A00 = $2A00
	!SourceDirectoryOffset_2B00 = $2B00
	!SourceDirectoryOffset_2C00 = $2C00
	!SourceDirectoryOffset_2D00 = $2D00
	!SourceDirectoryOffset_2E00 = $2E00
	!SourceDirectoryOffset_2F00 = $2F00
	!SourceDirectoryOffset_3000 = $3000
	!SourceDirectoryOffset_3100 = $3100
	!SourceDirectoryOffset_3200 = $3200
	!SourceDirectoryOffset_3300 = $3300
	!SourceDirectoryOffset_3400 = $3400
	!SourceDirectoryOffset_3500 = $3500
	!SourceDirectoryOffset_3600 = $3600
	!SourceDirectoryOffset_3700 = $3700
	!SourceDirectoryOffset_3800 = $3800
	!SourceDirectoryOffset_3900 = $3900
	!SourceDirectoryOffset_3A00 = $3A00
	!SourceDirectoryOffset_3B00 = $3B00
	!SourceDirectoryOffset_3C00 = $3C00
	!SourceDirectoryOffset_3D00 = $3D00
	!SourceDirectoryOffset_3E00 = $3E00
	!SourceDirectoryOffset_3F00 = $3F00
	!SourceDirectoryOffset_4000 = $4000
	!SourceDirectoryOffset_4100 = $4100
	!SourceDirectoryOffset_4200 = $4200
	!SourceDirectoryOffset_4300 = $4300
	!SourceDirectoryOffset_4400 = $4400
	!SourceDirectoryOffset_4500 = $4500
	!SourceDirectoryOffset_4600 = $4600
	!SourceDirectoryOffset_4700 = $4700
	!SourceDirectoryOffset_4800 = $4800
	!SourceDirectoryOffset_4900 = $4900
	!SourceDirectoryOffset_4A00 = $4A00
	!SourceDirectoryOffset_4B00 = $4B00
	!SourceDirectoryOffset_4C00 = $4C00
	!SourceDirectoryOffset_4D00 = $4D00
	!SourceDirectoryOffset_4E00 = $4E00
	!SourceDirectoryOffset_4F00 = $4F00
	!SourceDirectoryOffset_5000 = $5000
	!SourceDirectoryOffset_5100 = $5100
	!SourceDirectoryOffset_5200 = $5200
	!SourceDirectoryOffset_5300 = $5300
	!SourceDirectoryOffset_5400 = $5400
	!SourceDirectoryOffset_5500 = $5500
	!SourceDirectoryOffset_5600 = $5600
	!SourceDirectoryOffset_5700 = $5700
	!SourceDirectoryOffset_5800 = $5800
	!SourceDirectoryOffset_5900 = $5900
	!SourceDirectoryOffset_5A00 = $5A00
	!SourceDirectoryOffset_5B00 = $5B00
	!SourceDirectoryOffset_5C00 = $5C00
	!SourceDirectoryOffset_5D00 = $5D00
	!SourceDirectoryOffset_5E00 = $5E00
	!SourceDirectoryOffset_5F00 = $5F00
	!SourceDirectoryOffset_6000 = $6000
	!SourceDirectoryOffset_6100 = $6100
	!SourceDirectoryOffset_6200 = $6200
	!SourceDirectoryOffset_6300 = $6300
	!SourceDirectoryOffset_6400 = $6400
	!SourceDirectoryOffset_6500 = $6500
	!SourceDirectoryOffset_6600 = $6600
	!SourceDirectoryOffset_6700 = $6700
	!SourceDirectoryOffset_6800 = $6800
	!SourceDirectoryOffset_6900 = $6900
	!SourceDirectoryOffset_6A00 = $6A00
	!SourceDirectoryOffset_6B00 = $6B00
	!SourceDirectoryOffset_6C00 = $6C00
	!SourceDirectoryOffset_6D00 = $6D00
	!SourceDirectoryOffset_6E00 = $6E00
	!SourceDirectoryOffset_6F00 = $6F00
	!SourceDirectoryOffset_7000 = $7000
	!SourceDirectoryOffset_7100 = $7100
	!SourceDirectoryOffset_7200 = $7200
	!SourceDirectoryOffset_7300 = $7300
	!SourceDirectoryOffset_7400 = $7400
	!SourceDirectoryOffset_7500 = $7500
	!SourceDirectoryOffset_7600 = $7600
	!SourceDirectoryOffset_7700 = $7700
	!SourceDirectoryOffset_7800 = $7800
	!SourceDirectoryOffset_7900 = $7900
	!SourceDirectoryOffset_7A00 = $7A00
	!SourceDirectoryOffset_7B00 = $7B00
	!SourceDirectoryOffset_7C00 = $7C00
	!SourceDirectoryOffset_7D00 = $7D00
	!SourceDirectoryOffset_7E00 = $7E00
	!SourceDirectoryOffset_7F00 = $7F00
	!SourceDirectoryOffset_8000 = $8000
	!SourceDirectoryOffset_8100 = $8100
	!SourceDirectoryOffset_8200 = $8200
	!SourceDirectoryOffset_8300 = $8300
	!SourceDirectoryOffset_8400 = $8400
	!SourceDirectoryOffset_8500 = $8500
	!SourceDirectoryOffset_8600 = $8600
	!SourceDirectoryOffset_8700 = $8700
	!SourceDirectoryOffset_8800 = $8800
	!SourceDirectoryOffset_8900 = $8900
	!SourceDirectoryOffset_8A00 = $8A00
	!SourceDirectoryOffset_8B00 = $8B00
	!SourceDirectoryOffset_8C00 = $8C00
	!SourceDirectoryOffset_8D00 = $8D00
	!SourceDirectoryOffset_8E00 = $8E00
	!SourceDirectoryOffset_8F00 = $8F00
	!SourceDirectoryOffset_9000 = $9000
	!SourceDirectoryOffset_9100 = $9100
	!SourceDirectoryOffset_9200 = $9200
	!SourceDirectoryOffset_9300 = $9300
	!SourceDirectoryOffset_9400 = $9400
	!SourceDirectoryOffset_9500 = $9500
	!SourceDirectoryOffset_9600 = $9600
	!SourceDirectoryOffset_9700 = $9700
	!SourceDirectoryOffset_9800 = $9800
	!SourceDirectoryOffset_9900 = $9900
	!SourceDirectoryOffset_9A00 = $9A00
	!SourceDirectoryOffset_9B00 = $9B00
	!SourceDirectoryOffset_9C00 = $9C00
	!SourceDirectoryOffset_9D00 = $9D00
	!SourceDirectoryOffset_9E00 = $9E00
	!SourceDirectoryOffset_9F00 = $9F00
	!SourceDirectoryOffset_A000 = $A000
	!SourceDirectoryOffset_A100 = $A100
	!SourceDirectoryOffset_A200 = $A200
	!SourceDirectoryOffset_A300 = $A300
	!SourceDirectoryOffset_A400 = $A400
	!SourceDirectoryOffset_A500 = $A500
	!SourceDirectoryOffset_A600 = $A600
	!SourceDirectoryOffset_A700 = $A700
	!SourceDirectoryOffset_A800 = $A800
	!SourceDirectoryOffset_A900 = $A900
	!SourceDirectoryOffset_AA00 = $AA00
	!SourceDirectoryOffset_AB00 = $AB00
	!SourceDirectoryOffset_AC00 = $AC00
	!SourceDirectoryOffset_AD00 = $AD00
	!SourceDirectoryOffset_AE00 = $AE00
	!SourceDirectoryOffset_AF00 = $AF00
	!SourceDirectoryOffset_B000 = $B000
	!SourceDirectoryOffset_B100 = $B100
	!SourceDirectoryOffset_B200 = $B200
	!SourceDirectoryOffset_B300 = $B300
	!SourceDirectoryOffset_B400 = $B400
	!SourceDirectoryOffset_B500 = $B500
	!SourceDirectoryOffset_B600 = $B600
	!SourceDirectoryOffset_B700 = $B700
	!SourceDirectoryOffset_B800 = $B800
	!SourceDirectoryOffset_B900 = $B900
	!SourceDirectoryOffset_BA00 = $BA00
	!SourceDirectoryOffset_BB00 = $BB00
	!SourceDirectoryOffset_BC00 = $BC00
	!SourceDirectoryOffset_BD00 = $BD00
	!SourceDirectoryOffset_BE00 = $BE00
	!SourceDirectoryOffset_BF00 = $BF00
	!SourceDirectoryOffset_C000 = $C000
	!SourceDirectoryOffset_C100 = $C100
	!SourceDirectoryOffset_C200 = $C200
	!SourceDirectoryOffset_C300 = $C300
	!SourceDirectoryOffset_C400 = $C400
	!SourceDirectoryOffset_C500 = $C500
	!SourceDirectoryOffset_C600 = $C600
	!SourceDirectoryOffset_C700 = $C700
	!SourceDirectoryOffset_C800 = $C800
	!SourceDirectoryOffset_C900 = $C900
	!SourceDirectoryOffset_CA00 = $CA00
	!SourceDirectoryOffset_CB00 = $CB00
	!SourceDirectoryOffset_CC00 = $CC00
	!SourceDirectoryOffset_CD00 = $CD00
	!SourceDirectoryOffset_CE00 = $CE00
	!SourceDirectoryOffset_CF00 = $CF00
	!SourceDirectoryOffset_D000 = $D000
	!SourceDirectoryOffset_D100 = $D100
	!SourceDirectoryOffset_D200 = $D200
	!SourceDirectoryOffset_D300 = $D300
	!SourceDirectoryOffset_D400 = $D400
	!SourceDirectoryOffset_D500 = $D500
	!SourceDirectoryOffset_D600 = $D600
	!SourceDirectoryOffset_D700 = $D700
	!SourceDirectoryOffset_D800 = $D800
	!SourceDirectoryOffset_D900 = $D900
	!SourceDirectoryOffset_DA00 = $DA00
	!SourceDirectoryOffset_DB00 = $DB00
	!SourceDirectoryOffset_DC00 = $DC00
	!SourceDirectoryOffset_DD00 = $DD00
	!SourceDirectoryOffset_DE00 = $DE00
	!SourceDirectoryOffset_DF00 = $DF00
	!SourceDirectoryOffset_E000 = $E000
	!SourceDirectoryOffset_E100 = $E100
	!SourceDirectoryOffset_E200 = $E200
	!SourceDirectoryOffset_E300 = $E300
	!SourceDirectoryOffset_E400 = $E400
	!SourceDirectoryOffset_E500 = $E500
	!SourceDirectoryOffset_E600 = $E600
	!SourceDirectoryOffset_E700 = $E700
	!SourceDirectoryOffset_E800 = $E800
	!SourceDirectoryOffset_E900 = $E900
	!SourceDirectoryOffset_EA00 = $EA00
	!SourceDirectoryOffset_EB00 = $EB00
	!SourceDirectoryOffset_EC00 = $EC00
	!SourceDirectoryOffset_ED00 = $ED00
	!SourceDirectoryOffset_EE00 = $EE00
	!SourceDirectoryOffset_EF00 = $EF00
	!SourceDirectoryOffset_F000 = $F000
	!SourceDirectoryOffset_F100 = $F100
	!SourceDirectoryOffset_F200 = $F200
	!SourceDirectoryOffset_F300 = $F300
	!SourceDirectoryOffset_F400 = $F400
	!SourceDirectoryOffset_F500 = $F500
	!SourceDirectoryOffset_F600 = $F600
	!SourceDirectoryOffset_F700 = $F700
	!SourceDirectoryOffset_F800 = $F800
	!SourceDirectoryOffset_F900 = $F900
	!SourceDirectoryOffset_FA00 = $FA00
	!SourceDirectoryOffset_FB00 = $FB00
	!SourceDirectoryOffset_FC00 = $FC00
	!SourceDirectoryOffset_FD00 = $FD00
	!SourceDirectoryOffset_FE00 = $FE00
	!SourceDirectoryOffset_FF00 = $FF00
!REGISTER_DSP_DSPStatusFlags = $6C
	!DSPStatusFlags_NoiseClockFrequency_0Hz = $00
	!DSPStatusFlags_NoiseClockFrequency_16Hz = $01
	!DSPStatusFlags_NoiseClockFrequency_21Hz = $02
	!DSPStatusFlags_NoiseClockFrequency_25Hz = $03
	!DSPStatusFlags_NoiseClockFrequency_31Hz = $04
	!DSPStatusFlags_NoiseClockFrequency_42Hz = $05
	!DSPStatusFlags_NoiseClockFrequency_50Hz = $06
	!DSPStatusFlags_NoiseClockFrequency_63Hz = $07
	!DSPStatusFlags_NoiseClockFrequency_83Hz = $08
	!DSPStatusFlags_NoiseClockFrequency_100Hz = $09
	!DSPStatusFlags_NoiseClockFrequency_125Hz = $0A
	!DSPStatusFlags_NoiseClockFrequency_167Hz = $0B
	!DSPStatusFlags_NoiseClockFrequency_200Hz = $0C
	!DSPStatusFlags_NoiseClockFrequency_250Hz = $0D
	!DSPStatusFlags_NoiseClockFrequency_333Hz = $0E
	!DSPStatusFlags_NoiseClockFrequency_400Hz = $0F
	!DSPStatusFlags_NoiseClockFrequency_500Hz = $10
	!DSPStatusFlags_NoiseClockFrequency_667Hz = $11
	!DSPStatusFlags_NoiseClockFrequency_800Hz = $12
	!DSPStatusFlags_NoiseClockFrequency_1000Hz = $13
	!DSPStatusFlags_NoiseClockFrequency_1300Hz = $14
	!DSPStatusFlags_NoiseClockFrequency_1600Hz = $15
	!DSPStatusFlags_NoiseClockFrequency_2000Hz = $16
	!DSPStatusFlags_NoiseClockFrequency_2700Hz = $17
	!DSPStatusFlags_NoiseClockFrequency_3200Hz = $18
	!DSPStatusFlags_NoiseClockFrequency_4000Hz = $19
	!DSPStatusFlags_NoiseClockFrequency_5300Hz = $1A
	!DSPStatusFlags_NoiseClockFrequency_6400Hz = $1B
	!DSPStatusFlags_NoiseClockFrequency_8000Hz = $1C
	!DSPStatusFlags_NoiseClockFrequency_10700Hz = $1D
	!DSPStatusFlags_NoiseClockFrequency_16000Hz = $1E
	!DSPStatusFlags_NoiseClockFrequency_32000Hz = $1F
	!DSPStatusFlags_EchoEnableFlag = $20
	!DSPStatusFlags_MuteAudioFlag = $40
	!DSPStatusFlags_SoftResetFlag = $80
!REGISTER_DSP_EchoBufferStartOffset = $6D
!REGISTER_DSP_VoiceBits = $7C
!REGISTER_DSP_EchoDelay = $7D

;---------------------------------------------------------------------------

; SPC700 code assembly specific macros

macro SPC700RoutinePointer(Label, BlockStart, BlockEnd)
	dd <Label>
	dd <BlockStart>
	dd <BlockEnd>
endmacro

;---------------------------------------------------------------------------

!ChipName = "SPC7110"
!Firmware = "NULL"



!Define_DKC3_Global_RemappedBank80 = !FALSE			; If true, some DBR preserving code will be inserted in a few spots to prevent issues. It's automatically set to !TRUE in bank $80 is remapped.

!Define_DKC3_LevelID_WrinklysSaveCave = $0000
!Define_DKC3_LevelID_FunkysRentals = $0001
!Define_DKC3_LevelID_SwankysSideshowOutside = $0002
!Define_DKC3_LevelID_BazaarsGeneralStore = $0003
!Define_DKC3_LevelID_BlundersBooth = $0004
!Define_DKC3_LevelID_BramblesBungalow = $0005
!Define_DKC3_LevelID_BartersSwapShop = $0006
!Define_DKC3_LevelID_BarnaclesIsland = $0007
!Define_DKC3_LevelID_BrashsCabin = $0008
!Define_DKC3_LevelID_BluesBeachHut = $0009
!Define_DKC3_LevelID_BazookasBarracks = $000A
!Define_DKC3_LevelID_BlizzardsBaseCamp = $000B
!Define_DKC3_LevelID_BennysChairlifts = $000C
!Define_DKC3_LevelID_BjornsChairlifts = $000D
!Define_DKC3_LevelID_BafflesCodeRoom = $000E
!Define_DKC3_LevelID_BoomersBombShelter = $000F
!Define_DKC3_LevelID_KsCache = $0010
!Define_DKC3_LevelID_HilltopHoard = $0011
!Define_DKC3_LevelID_UndercoverCove = $0012
!Define_DKC3_LevelID_KongCave = $0013
!Define_DKC3_LevelID_BountyBeach = $0014
!Define_DKC3_LevelID_BelchasBurrow = $0015
!Define_DKC3_LevelID_SmugglersCove = $0016
!Define_DKC3_LevelID_ArichsHoard = $0017
!Define_DKC3_LevelID_BountyBay = $0018
!Define_DKC3_LevelID_SkyHighSecret = $0019
!Define_DKC3_LevelID_GlacialGrotto = $001A
!Define_DKC3_LevelID_ClifftopCache = $001B
!Define_DKC3_LevelID_SewerStockpile = $001C

!Define_DKC3_LevelID_EmptyDoorStopDashSublevel = $0000
!Define_DKC3_LevelID_NullLevel1 = $0001
!Define_DKC3_LevelID_NullLevel2 = $0002
!Define_DKC3_LevelID_NullLevel3 = $0003
!Define_DKC3_LevelID_NullLevel4 = $0004
!Define_DKC3_LevelID_NullLevel5 = $0005
!Define_DKC3_LevelID_NullLevel6 = $0006
!Define_DKC3_LevelID_NullLevel7 = $0007
!Define_DKC3_LevelID_BazzasBlockade_PhotoAlbum = $0008
!Define_DKC3_LevelID_DoorstopDash_PhotoAlbum = $0009
!Define_DKC3_LevelID_LemguinLunge_PhotoAlbum = $000A
!Define_DKC3_LevelID_RopeyRumpus_PhotoAlbum = $000B
!Define_DKC3_LevelID_SkiddasRow_PhotoAlbum = $000C
!Define_DKC3_LevelID_SquealsOnWheels_PhotoAlbum = $000D
!Define_DKC3_LevelID_FloodlitFish_PhotoAlbum = $000E							; Note: Unused
!Define_DKC3_LevelID_BrothersBearPhotos = $000F
!Define_DKC3_LevelID_SwankysSideshow_PhotoAlbum = $0010
!Define_DKC3_LevelID_BossPhotos = $0011
!Define_DKC3_LevelID_CloseupOfKRoolDrivingHovercraft = $0012
!Define_DKC3_LevelID_KastleKAOS_PhotoAlbum = $0013
!Define_DKC3_LevelID_EarlyBobbingBarrelBrawl = $0014
!Define_DKC3_LevelID_KiddysPhotoAlbumArea = $0015
!Define_DKC3_LevelID_DixiesPhotoAlbumArea = $0016
!Define_DKC3_LevelID_NullLevel8 = $0017
!Define_DKC3_LevelID_NullLevel9 = $0018
!Define_DKC3_LevelID_NullLevel10 = $0019
!Define_DKC3_LevelID_BazzasBlockade_ExitSublevel = $001A
!Define_DKC3_LevelID_FishfoodFrenzy_ExitSublevel = $001B
!Define_DKC3_LevelID_FloodlitFish_ExitSublevel = $001C
!Define_DKC3_LevelID_BelchasBarn = $001D
!Define_DKC3_LevelID_ArichsAmbush = $001E
!Define_DKC3_LevelID_SquirtsShowdown = $001F
!Define_DKC3_LevelID_KAOSKarnage = $0020
!Define_DKC3_LevelID_BleaksHouse = $0021
!Define_DKC3_LevelID_BarbossBarrier = $0022
!Define_DKC3_LevelID_KastleKAOS = $0023
!Define_DKC3_LevelID_Knautilus = $0024
!Define_DKC3_LevelID_LakesideLimbo_Main = $0025
!Define_DKC3_LevelID_KreepingKlasps_Main = $0026
!Define_DKC3_LevelID_TidalTrouble_Main = $0027
!Define_DKC3_LevelID_DoorstopDash_Main = $0028
!Define_DKC3_LevelID_SquealsOnWheels_Main = $0029
!Define_DKC3_LevelID_MurkyMill_Main = $002A
!Define_DKC3_LevelID_SkiddasRow_Main = $002B
!Define_DKC3_LevelID_LemguinLunge_Main = $002C
!Define_DKC3_LevelID_TearawayToboggan_Main = $002D
!Define_DKC3_LevelID_RipsawRage_Main = $002E
!Define_DKC3_LevelID_SpringinSpiders_Main = $002F
!Define_DKC3_LevelID_BarrelShieldBustUp_Main = $0030
!Define_DKC3_LevelID_SwoopySalvo_Main = $0031
!Define_DKC3_LevelID_RiversideRace_Main = $0032
!Define_DKC3_LevelID_LightningLookOut_Main = $0033
!Define_DKC3_LevelID_BobbingBarrelBrawl_Main = $0034
!Define_DKC3_LevelID_BazzasBlockade_Main = $0035
!Define_DKC3_LevelID_FishFoodFrenzy_Main = $0036
!Define_DKC3_LevelID_FloodlitFish_Main = $0037
!Define_DKC3_LevelID_RocketBarrelRide_Main = $0038
!Define_DKC3_LevelID_TrackerBarrelTrek_Main = $0039
!Define_DKC3_LevelID_BarrelDropBounce_Main = $003A
!Define_DKC3_LevelID_FireballFrenzy_Main = $003B
!Define_DKC3_LevelID_BlazingBazukas_Main = $003C
!Define_DKC3_LevelID_KrackshotKroc_Main = $003D
!Define_DKC3_LevelID_LowGLabyrinth_Main = $003E
!Define_DKC3_LevelID_PoisonousPipeline_Main = $003F
!Define_DKC3_LevelID_DemolitionDrainPipe_Main = $0040
!Define_DKC3_LevelID_KreviceKreepers_Main = $0041
!Define_DKC3_LevelID_KongFusedCliffs_Main = $0042
!Define_DKC3_LevelID_RopeyRumpus_Main = $0043
!Define_DKC3_LevelID_BuzzerBarrage_Main = $0044
!Define_DKC3_LevelID_PotHolePanic_Main = $0045
!Define_DKC3_LevelID_CreepyCaverns_Main = $0046
!Define_DKC3_LevelID_KoindozerKlamber_Main = $0047
!Define_DKC3_LevelID_KonveyorRopeKlash_Main = $0048
!Define_DKC3_LevelID_StampedeSprint_Main = $0049
!Define_DKC3_LevelID_CrissKrossCliffs_Main = $004A
!Define_DKC3_LevelID_TyrantTwinTussle_Main = $004B
!Define_DKC3_LevelID_RocketRush_Main = $004C
!Define_DKC3_LevelID_SwankysSideshowInTent = $004D
!Define_DKC3_LevelID_NullLevel11 = $004E
!Define_DKC3_LevelID_NullLevel12 = $004F
!Define_DKC3_LevelID_LakesideLimbo_Bonus1 = $0050
!Define_DKC3_LevelID_LakesideLimbo_Bonus2 = $0051
!Define_DKC3_LevelID_DoorstopDash_Bonus1 = $0052
!Define_DKC3_LevelID_DoorstopDash_Bonus2 = $0053
!Define_DKC3_LevelID_TidalTrouble_Bonus1 = $0054
!Define_DKC3_LevelID_TidalTrouble_Bonus2 = $0055
!Define_DKC3_LevelID_SkiddasRow_Bonus1 = $0056
!Define_DKC3_LevelID_SkiddasRow_Bonus2 = $0057
!Define_DKC3_LevelID_SquealsOnWheels_Bonus1 = $0058
!Define_DKC3_LevelID_SquealsOnWheels_Bonus2 = $0059
!Define_DKC3_LevelID_BarrelShieldBustUp_Bonus1 = $005A
!Define_DKC3_LevelID_BarrelShieldBustUp_Bonus2 = $005B
!Define_DKC3_LevelID_RiverbankRace_Bonus1 = $005C
!Define_DKC3_LevelID_RiverbankRace_Bonus2 = $005D
!Define_DKC3_LevelID_MurkyMill_Bonus1 = $005E
!Define_DKC3_LevelID_MurkyMill_Bonus2 = $005F
!Define_DKC3_LevelID_SpringinSpiders_Bonus1 = $0060
!Define_DKC3_LevelID_SpringinSpiders_Bonus2 = $0061
!Define_DKC3_LevelID_LightningLookOut_Bonus1 = $0062
!Define_DKC3_LevelID_LightningLookOut_Bonus2 = $0063
!Define_DKC3_LevelID_BazzasBlockade_Bonus1 = $0064
!Define_DKC3_LevelID_BazzasBlockade_Bonus2 = $0065
!Define_DKC3_LevelID_RocketBarrelRide_Bonus1 = $0066
!Define_DKC3_LevelID_RocketBarrelRide_Bonus2 = $0067
!Define_DKC3_LevelID_KreepingKlasps_Bonus1 = $0068
!Define_DKC3_LevelID_KreepingKlasps_Bonus2 = $0069
!Define_DKC3_LevelID_TrackerBarrelTrek_Bonus1 = $006A
!Define_DKC3_LevelID_TrackerBarrelTrek_Bonus2 = $006B
!Define_DKC3_LevelID_FishFoodFrenzy_Bonus1 = $006C
!Define_DKC3_LevelID_FishFoodFrenzy_Bonus2 = $006D
!Define_DKC3_LevelID_FireballFrenzy_Bonus1 = $006E
!Define_DKC3_LevelID_FireballFrenzy_Bonus2 = $006F
!Define_DKC3_LevelID_DemolitionDrainPipe_Bonus1 = $0070
!Define_DKC3_LevelID_DemolitionDrainPipe_Bonus2 = $0071
!Define_DKC3_LevelID_RipsawRage_Bonus1 = $0072
!Define_DKC3_LevelID_RipsawRage_Bonus2 = $0073
!Define_DKC3_LevelID_BlazingBazukas_Bonus1 = $0074
!Define_DKC3_LevelID_BlazingBazukas_Bonus2 = $0075
!Define_DKC3_LevelID_LowGLabyrinth_Bonus1 = $0076
!Define_DKC3_LevelID_LowGLabyrinth_Bonus2 = $0077
!Define_DKC3_LevelID_KreviceKreepers_Bonus1 = $0078
!Define_DKC3_LevelID_KreviceKreepers_Bonus2 = $0079
!Define_DKC3_LevelID_TearawayToboggan_Bonus1 = $007A
!Define_DKC3_LevelID_TearawayToboggan_Bonus2 = $007B
!Define_DKC3_LevelID_BarrelDropBounce_Bonus1 = $007C
!Define_DKC3_LevelID_BarrelDropBounce_Bonus2 = $007D
!Define_DKC3_LevelID_KrackshotKroc_Bonus1 = $007E
!Define_DKC3_LevelID_KrackshotKroc_Bonus2 = $007F
!Define_DKC3_LevelID_LemguinLunge_Bonus1 = $0080							; Note: ID 80 is also the ID for the secret waterfall cave involved with the WATER cheat.
!Define_DKC3_LevelID_LemguinLunge_Bonus2 = $0081
!Define_DKC3_LevelID_BuzzerBarrage_Bonus1 = $0082
!Define_DKC3_LevelID_BuzzerBarrage_Bonus2 = $0083
!Define_DKC3_LevelID_KongFusedCliffs_Bonus1 = $0084
!Define_DKC3_LevelID_KongFusedCliffs_Bonus2 = $0085
!Define_DKC3_LevelID_FloodlitFish_Bonus1 = $0086
!Define_DKC3_LevelID_FloodlitFish_Bonus2 = $0087
!Define_DKC3_LevelID_PotHolePanic_Bonus1 = $0088
!Define_DKC3_LevelID_PotHolePanic_Bonus2 = $0089
!Define_DKC3_LevelID_RopeyRumpus_Bonus1 = $008A
!Define_DKC3_LevelID_RopeyRumpus_Bonus2 = $008B
!Define_DKC3_LevelID_KoindozerKlamber_Bonus1 = $008C
!Define_DKC3_LevelID_KoindozerKlamber_Bonus2 = $008D
!Define_DKC3_LevelID_CreepyCaverns_Bonus1 = $008E
!Define_DKC3_LevelID_CreepyCaverns_Bonus2 = $008F
!Define_DKC3_LevelID_BobbingBarrelBrawl_Bonus1 = $0090
!Define_DKC3_LevelID_BobbingBarrelBrawl_Bonus2 = $0091
!Define_DKC3_LevelID_KonveyorRopeKlash_Bonus1 = $0092
!Define_DKC3_LevelID_KonveyorRopeKlash_Bonus2 = $0093
!Define_DKC3_LevelID_PoisonousPipeline_Bonus1 = $0094
!Define_DKC3_LevelID_PoisonousPipeline_Bonus2 = $0095
!Define_DKC3_LevelID_SwoopySalvo_Bonus3 = $0096
!Define_DKC3_LevelID_SwoopySalvo_Bonus1 = $0097
!Define_DKC3_LevelID_SwoopySalvo_Bonus2 = $0098
!Define_DKC3_LevelID_CrissKrossCliffs_Bonus1 = $0099
!Define_DKC3_LevelID_CrissKrossCliffs_Bonus2 = $009A
!Define_DKC3_LevelID_TyrantTwinTussle_Bonus1 = $009B
!Define_DKC3_LevelID_TyrantTwinTussle_Bonus3 = $009C
!Define_DKC3_LevelID_TyrantTwinTussle_Bonus2 = $009D
!Define_DKC3_LevelID_StampedeSprint_Bonus2 = $009E
!Define_DKC3_LevelID_StampedeSprint_Bonus3 = $009F
!Define_DKC3_LevelID_StampedeSprint_Bonus1 = $00A0

!Define_DKC3_MusicID_None = $0000
!Define_DKC3_MusicID_BonusTime = $0401
	!Define_DKC3_MusicID_BonusWin = $0301
	!Define_DKC3_MusicID_BonusLost = $0201
;!Define_DKC3_MusicID_BonusTime = $0002
;!Define_DKC3_MusicID_BonusTime = $0003
!Define_DKC3_MusicID_BrothersBear = $0004
	!Define_DKC3_MusicID_BrothersBearBlues = $0104
!Define_DKC3_MusicID_GetFitAGoGo = $0005
	!Define_DKC3_MusicID_Wrinkly64 = $0105
	!Define_DKC3_MusicID_WrinklysSaveCave = $0205
!Define_DKC3_MusicID_WaterWorld = $0006
!Define_DKC3_MusicID_HotPursuit = $0007
!Define_DKC3_MusicID_NutsAndBolts = $0008
!Define_DKC3_MusicID_SwankysSideshow = $0009
	!Define_DKC3_MusicID_CrankysShowdown = $0109
!Define_DKC3_MusicID_CascadeCapers = $000A
!Define_DKC3_MusicID_TreetopTumble = $000B
!Define_DKC3_MusicID_BossBoogie = $000C
!Define_DKC3_MusicID_JangleBells = $000D
!Define_DKC3_MusicID_MillFever = $000E
!Define_DKC3_MusicID_StiltVillage = $000F
!Define_DKC3_MusicID_EnchantedRiverbank = $0010
!Define_DKC3_MusicID_SubmapShuffle = $0011
!Define_DKC3_MusicID_KrematoaKoncerto = $0012
!Define_DKC3_MusicID_NorthernKremisphere = $0013
!Define_DKC3_MusicID_GameOver = $0014
!Define_DKC3_MusicID_HanginAtFunkys = $0015
!Define_DKC3_MusicID_Fanfare = $0016
!Define_DKC3_MusicID_FrostyFrolics = $0017
!Define_DKC3_MusicID_DixieBeat = $0018
!Define_DKC3_MusicID_PokeyPipes = $0019
!Define_DKC3_MusicID_BigBossBlues = $001A
!Define_DKC3_MusicID_CrystalChasm = $001B
!Define_DKC3_MusicID_RocketRun = $001C
!Define_DKC3_MusicID_JungleJitter = $001D
!Define_DKC3_MusicID_CavernCaprice = $001E
!Define_DKC3_MusicID_Copy1OfBossBoogie = $001F
!Define_DKC3_MusicID_BaddiesOnParade = $0020
!Define_DKC3_MusicID_RockfaceRumble = $0021
!Define_DKC3_MusicID_CrazyCalypso = $0022
!Define_DKC3_MusicID_MamaBird = $0023
!Define_DKC3_MusicID_Copy1OfNorthernKremisphere = $0024
!Define_DKC3_MusicID_Copy2OfNorthernKremisphere = $0025
!Define_DKC3_MusicID_CopyOfNutsAndBolts = $0026
!Define_DKC3_MusicID_CopyOfBigBossBlues = $0027
!Define_DKC3_MusicID_Copy2OfBossBoogie = $0028
!Define_DKC3_MusicID_CopyOfCavernCaprise = $0029
!Define_DKC3_MusicID_BananaBirdQueenChase = $002A
!Define_DKC3_MusicID_Copy1OfJangleBells = $002B
!Define_DKC3_MusicID_Copy2OfJangleBells = $002C
!Define_DKC3_MusicID_Copy3OfJangleBells = $002D
!Define_DKC3_MusicID_DefeatedBoss = $002E

!Define_DKC3_SpriteID_EmptySpriteSlot = $0000
!Define_DKC3_SpriteID_UnknownSprite0004 = $0004
!Define_DKC3_SpriteID_UnknownSprite0008 = $0008
!Define_DKC3_SpriteID_UnknownSprite000C = $000C
!Define_DKC3_SpriteID_HeadToHeadDot = $0010
!Define_DKC3_SpriteID_ThrownSoftball = $0014
!Define_DKC3_SpriteID_UnknownSprite0018 = $0018
!Define_DKC3_SpriteID_UnknownSprite001C = $001C
!Define_DKC3_SpriteID_ArichSpit = $0020
!Define_DKC3_SpriteID_UnknownSprite0024 = $0024
!Define_DKC3_SpriteID_UnknownSprite0028 = $0028
!Define_DKC3_SpriteID_ThrownSnowball = $002C
!Define_DKC3_SpriteID_BarrelShield = $0030
!Define_DKC3_SpriteID_BarrelPieces = $0034
!Define_DKC3_SpriteID_MapSwimmingKongSplash = $0038
!Define_DKC3_SpriteID_UnknownSprite003C = $003C
!Define_DKC3_SpriteID_MinkeyAcorn = $0040
!Define_DKC3_SpriteID_RotatingCylinderKey = $0044
!Define_DKC3_SpriteID_BleakFightCursor = $0048
!Define_DKC3_SpriteID_TopOfCottonTopCoveWaterfall = $004C
!Define_DKC3_SpriteID_BarbosSpikeProjectile = $0050
!Define_DKC3_SpriteID_BarbosEye = $0054
!Define_DKC3_SpriteID_BarbosPupil = $0058
!Define_DKC3_SpriteID_UnknownSprite005C = $005C
!Define_DKC3_SpriteID_BottomOfRightCottonTopCoveWaterfall = $0060
!Define_DKC3_SpriteID_BottomOfCottonTopCoveWaterfall = $0064
!Define_DKC3_SpriteID_PlayModeText = $0068
!Define_DKC3_SpriteID_UnknownSprite006C = $006C
!Define_DKC3_SpriteID_BananaBirdCaveCover = $0070
!Define_DKC3_SpriteID_UnknownSprite0074 = $0074
!Define_DKC3_SpriteID_EllieHorizontalWaterShot = $0078
!Define_DKC3_SpriteID_EllieDiagonalWaterShot = $007C
!Define_DKC3_SpriteID_SquawksEgg = $0080
!Define_DKC3_SpriteID_KremwoodForestLog = $0084
!Define_DKC3_SpriteID_MapCannon = $0088
!Define_DKC3_SpriteID_UnknownSprite008C = $008C
!Define_DKC3_SpriteID_KAOSLaserHeadFlameJet = $0090
!Define_DKC3_SpriteID_ChairliftChair = $0094
!Define_DKC3_SpriteID_SewerStockpileGrate = $0098
!Define_DKC3_SpriteID_UnknownSprite009C = $009C
!Define_DKC3_SpriteID_UnknownSprite00A0 = $00A0
!Define_DKC3_SpriteID_UnknownSprite00A4 = $00A4
!Define_DKC3_SpriteID_RazorRidgePipe = $00A8
!Define_DKC3_SpriteID_UnknownSprite00AC = $00AC
!Define_DKC3_SpriteID_UnknownSprite00B0 = $00B0
!Define_DKC3_SpriteID_KremtoaBridge = $00B4
!Define_DKC3_SpriteID_KuchukaBomb = $00B8
!Define_DKC3_SpriteID_RedGemInBananaBirdQueenBarrier = $00BC
!Define_DKC3_SpriteID_MapBananaBird = $00C0
!Define_DKC3_SpriteID_KRoolFightPlatform = $00C4
!Define_DKC3_SpriteID_KRoolFightBGDecorations = $00C8
!Define_DKC3_SpriteID_SquirtPupil = $00CC
!Define_DKC3_SpriteID_Minkey = $00D0
!Define_DKC3_SpriteID_UnknownSprite00D4 = $00D4										; Note: It's loaded in Wrinkly's Save Cave
!Define_DKC3_SpriteID_BelchaTooth = $00D8
!Define_DKC3_SpriteID_UnknownSprite00DC = $00DC										; Note: It's loaded on the Nintendo Presents screen
!Define_DKC3_SpriteID_InventoryItemHUDSquares = $00E0
!Define_DKC3_SpriteID_UnknownSprite00E4 = $00E4
!Define_DKC3_SpriteID_Squirt = $00E8
!Define_DKC3_SpriteID_UpwardsShotBarrel = $00EC
!Define_DKC3_SpriteID_RareLogo = $00F0
!Define_DKC3_SpriteID_UnknownSprite00F4 = $00F4
!Define_DKC3_SpriteID_FunkyKong = $00F8
!Define_DKC3_SpriteID_TitleScreenSign = $00FC
!Define_DKC3_SpriteID_SneekWheel = $0100
!Define_DKC3_SpriteID_AreaNameText = $0104
!Define_DKC3_SpriteID_Bleak = $0108
!Define_DKC3_SpriteID_BananaBirdCaveCrystal = $010C
!Define_DKC3_SpriteID_UnknownSprite0110 = $0110										; Note: Ending dialogue?
!Define_DKC3_SpriteID_TheEndSign = $0114
!Define_DKC3_SpriteID_KRool = $0118
!Define_DKC3_SpriteID_KRoolCurtain = $011C
!Define_DKC3_SpriteID_GiantBananaBirdQueenEgg = $0120
!Define_DKC3_SpriteID_LevelEndFlagpole = $0124
!Define_DKC3_SpriteID_UnknownSprite0128 = $0128										; Note: It's loaded inside Swanky's Sideshow
!Define_DKC3_SpriteID_UnknownSprite012C = $012C
!Define_DKC3_SpriteID_UnknownSprite0130 = $0130
!Define_DKC3_SpriteID_UnknownSprite0134 = $0134
!Define_DKC3_SpriteID_UnknownSprite0138 = $0138
!Define_DKC3_SpriteID_StampedeTrigger = $013C
!Define_DKC3_SpriteID_UnknownSprite0140 = $0140
!Define_DKC3_SpriteID_FloorDoor = $0144
!Define_DKC3_SpriteID_ExitDoor = $0148
!Define_DKC3_SpriteID_SpawnedRegularBanana = $014C
!Define_DKC3_SpriteID_GreenBanana = $0150
!Define_DKC3_SpriteID_GreenBananaSpawner = $0154
!Define_DKC3_SpriteID_KongFusedCliffsRope = $0158
!Define_DKC3_SpriteID_KongFusedCliffsAutoscroll = $015C
!Define_DKC3_SpriteID_UnknownSprite0160 = $0160
!Define_DKC3_SpriteID_KAOSHeadExplosionSpawner = $0164
!Define_DKC3_SpriteID_VerticalAutoscroll = $0168
!Define_DKC3_SpriteID_WaterfallBarrelSpawner = $016C
!Define_DKC3_SpriteID_BarrelRespawner = $0170
!Define_DKC3_SpriteID_UnknownSprite0174 = $0174
!Define_DKC3_SpriteID_BuzzSwarmSpawner = $0178
!Define_DKC3_SpriteID_UnknownSprite017C = $017C
!Define_DKC3_SpriteID_UnknownSprite0180 = $0180
!Define_DKC3_SpriteID_TargetSpawner = $0184
!Define_DKC3_SpriteID_UnknownSprite0188 = $0188
!Define_DKC3_SpriteID_KuffnKlout = $018C
!Define_DKC3_SpriteID_UnknownSprite0190 = $0190
!Define_DKC3_SpriteID_ArichBackHitbox = $0194											; Note: It's loaded in other places too.
!Define_DKC3_SpriteID_MapFlag = $0198
!Define_DKC3_SpriteID_UnknownSprite019C = $019C										; Note: It's loaded on the title screen
!Define_DKC3_SpriteID_UnknownSprite01A0 = $01A0
!Define_DKC3_SpriteID_FileSelectMenu = $01A4
!Define_DKC3_SpriteID_UnknownSprite01A8 = $01A8
!Define_DKC3_SpriteID_BrashCabinDigitalDisplay = $01AC
!Define_DKC3_SpriteID_FileSelectNumber = $01B0
!Define_DKC3_SpriteID_UnknownSprite01B4 = $01B4
!Define_DKC3_SpriteID_UnknownSprite01B8 = $01B8
!Define_DKC3_SpriteID_UnknownSprite01BC = $01BC
!Define_DKC3_SpriteID_SpeedrunTimer = $01C0
!Define_DKC3_SpriteID_UnknownSprite01C4 = $01C4
!Define_DKC3_SpriteID_UnknownSprite01C8 = $01C8
!Define_DKC3_SpriteID_UnknownSprite01CC = $01CC
!Define_DKC3_SpriteID_LightningBoltSpawner = $01D0
!Define_DKC3_SpriteID_KnautilusSpriteMask = $01D4										; Note: Also the sprite mask used in the Banana Bird Queen screen
!Define_DKC3_SpriteID_PlayerKrosshairController = $01D8
!Define_DKC3_SpriteID_UnknownSprite01DC = $01DC
!Define_DKC3_SpriteID_UnknownSprite01E0 = $01E0
!Define_DKC3_SpriteID_UnknownSprite01E4 = $01E4										; Note: Seems like the sprite that makes K Rool talk?
!Define_DKC3_SpriteID_Belcha = $01E8
!Define_DKC3_SpriteID_Barbos = $01EC
!Define_DKC3_SpriteID_UnknownSprite01F0 = $01F0
!Define_DKC3_SpriteID_SquealsOnWheelsTracker = $01F4
!Define_DKC3_SpriteID_BazzaSpawner = $01F8
!Define_DKC3_SpriteID_BananaBird = $01FC
!Define_DKC3_SpriteID_UnknownSprite0200 = $0200
!Define_DKC3_SpriteID_KAOS = $0204
!Define_DKC3_SpriteID_UnknownSprite0208 = $0208
!Define_DKC3_SpriteID_UnknownSprite020C = $020C
!Define_DKC3_SpriteID_NintendoPresentsKong = $0210
!Define_DKC3_SpriteID_RotatingCylinderHandle = $0214
!Define_DKC3_SpriteID_RareLogoKiddy = $0218
!Define_DKC3_SpriteID_RareLogoDixie = $021C
!Define_DKC3_SpriteID_Toboggan = $0220
!Define_DKC3_SpriteID_TobogganSparks = $0224
!Define_DKC3_SpriteID_LargePipe = $0228
!Define_DKC3_SpriteID_DixieKong = $022C
!Define_DKC3_SpriteID_KiddyKong = $0230
!Define_DKC3_SpriteID_Ellie = $0234
!Define_DKC3_SpriteID_Enguarde = $0238
!Define_DKC3_SpriteID_Squawks = $023C
!Define_DKC3_SpriteID_Squitter = $0240
!Define_DKC3_SpriteID_Parry = $0244
!Define_DKC3_SpriteID_WebShot = $0248
!Define_DKC3_SpriteID_WebPlatform = $024C
!Define_DKC3_SpriteID_AnimalBuddyBox = $0250
!Define_DKC3_SpriteID_AnimalBuddyIcon = $0254
!Define_DKC3_SpriteID_NoAnimalBuddySign = $0258
!Define_DKC3_SpriteID_UnknownSprite025C = $025C
!Define_DKC3_SpriteID_UnknownSprite0260 = $0260
!Define_DKC3_SpriteID_UnknownSprite0264 = $0264
!Define_DKC3_SpriteID_FireballLandingParticles = $0268
!Define_DKC3_SpriteID_BurstEffect = $026C
!Define_DKC3_SpriteID_WaterSplash = $0270
!Define_DKC3_SpriteID_SmokePuff = $0274
!Define_DKC3_SpriteID_BarrelSwitchS = $0278											; Note: Also the warning sign and No Krosshair sign
!Define_DKC3_SpriteID_MillPlatform = $027C												; Note: Also the factory and rocket platforms
!Define_DKC3_SpriteID_UnknownSprite0280 = $0280
!Define_DKC3_SpriteID_BearCoin = $0284
!Define_DKC3_SpriteID_UnknownSprite0288 = $0288
!Define_DKC3_SpriteID_BonusBCoin = $028C
!Define_DKC3_SpriteID_CollectableCog = $0290
!Define_DKC3_SpriteID_KongLetters = $0294
!Define_DKC3_SpriteID_Bananas = $0298
!Define_DKC3_SpriteID_ExtraLifeBalloon = $029C
!Define_DKC3_SpriteID_LevelEndFlag = $02A0
!Define_DKC3_SpriteID_UnknownSprite02A4 = $02A4
!Define_DKC3_SpriteID_BonusLevelTimer = $02A8
!Define_DKC3_SpriteID_RopeFire = $02AC
!Define_DKC3_SpriteID_KongWaterSplash = $02B0
!Define_DKC3_SpriteID_BarrelCannon = $02B4												; Note: This covers all the different barrels that can be entered.
!Define_DKC3_SpriteID_BarrelIcons = $02B8
!Define_DKC3_SpriteID_CheckpointBarrel = $02BC
!Define_DKC3_SpriteID_Barrel = $02C0
!Define_DKC3_SpriteID_DKBarrel = $02C4
!Define_DKC3_SpriteID_UnknownSprite02C8 = $02C8										; Note: Related to the first K. Rool fight, when returning to it.
!Define_DKC3_SpriteID_UnknownSprite02CC = $02CC
!Define_DKC3_SpriteID_TNTBarrel = $02D0
!Define_DKC3_SpriteID_SteelKeg = $02D4
!Define_DKC3_SpriteID_WoodenBox = $02D8
!Define_DKC3_SpriteID_WaterfallBarrel = $02DC
!Define_DKC3_SpriteID_InvincibilityBarrel = $02E0
!Define_DKC3_SpriteID_FuelCan = $02E4
!Define_DKC3_SpriteID_KAOSHeadExplosion = $02E8
!Define_DKC3_SpriteID_Rocket = $02EC
!Define_DKC3_SpriteID_RocketFlame = $02F0
!Define_DKC3_SpriteID_RocketEyes = $02F4
!Define_DKC3_SpriteID_Sneek = $02F8
!Define_DKC3_SpriteID_Buzz = $02FC
!Define_DKC3_SpriteID_Koco = $0300
!Define_DKC3_SpriteID_MapKong = $0304													; Note: Also the ID for map K. Rool
!Define_DKC3_SpriteID_StationaryDisplaySprite1 = $0308								; Note: This is the ID for the Banana Bird Queen Head, the pool of water in Funky's Rentals, the angry face in K3, the Karate Cranky statue parts, the water trails in the Kremwood Forest map, the smoke cloud from Krosshair's fireballs, and Boomer's Fan
!Define_DKC3_SpriteID_MapVehicle = $030C
!Define_DKC3_SpriteID_UnknownSprite0310 = $0310
!Define_DKC3_SpriteID_EndingSwankyKong = $0314
!Define_DKC3_SpriteID_MovingDisplaySprite = $0318										; Note: This is the ID for Wrinkly Kong, the egg shell pieces, Donkey Kong, Diddy Kong, and Cranky Kong holding up the "The End" sign
!Define_DKC3_SpriteID_GameOverBlocks = $031C
!Define_DKC3_SpriteID_BrothersBear = $0320
!Define_DKC3_SpriteID_BrothersBearAccessories = $0324
!Define_DKC3_SpriteID_MainMapWaterfall = $0328
!Define_DKC3_SpriteID_UnknownSprite032C = $032C
!Define_DKC3_SpriteID_FileSelectIcon = $0330
!Define_DKC3_SpriteID_ChairliftPulley = $0334
!Define_DKC3_SpriteID_UnknownSprite0338 = $0338
!Define_DKC3_SpriteID_StationaryDisplaySprite2 = $033C								; Note: Also the lights on the Banana Bird Queen's barrier
!Define_DKC3_SpriteID_BramblesVase = $0340
!Define_DKC3_SpriteID_GyrocopterBladesAndShadow = $0344
!Define_DKC3_SpriteID_UnknownSprite0348 = $0348
!Define_DKC3_SpriteID_UnknownSprite034C = $034C
!Define_DKC3_SpriteID_UnknownSprite0350 = $0350
!Define_DKC3_SpriteID_SkyHighSecretRock = $0354
!Define_DKC3_SpriteID_Krosshair = $0358
!Define_DKC3_SpriteID_Knautilus = $035C
!Define_DKC3_SpriteID_UnknownSprite0360 = $0360
!Define_DKC3_SpriteID_KRoolHead = $0364													; Note: Also Dixie/Kiddy sitting on the egg in the true ending, and Swanky Kong's barrel in the photo album
!Define_DKC3_SpriteID_MotorBoatFunkyAndCrankyInEnding = $0368
!Define_DKC3_SpriteID_WrinklysSaveCave = $036C
!Define_DKC3_SpriteID_MapBananaBirdQueen = $0370
!Define_DKC3_SpriteID_BuzzSwarrm = $0374
!Define_DKC3_SpriteID_FollowingKlasp = $0378
!Define_DKC3_SpriteID_AutoMovingKlasp = $037C
!Define_DKC3_SpriteID_Lemguin = $0380
!Define_DKC3_SpriteID_FriendlyNibblaHead = $0384
!Define_DKC3_SpriteID_FriendlyNibblaBody = $0388
!Define_DKC3_SpriteID_DoorLeverHandle = $038C
!Define_DKC3_SpriteID_LeverControlledMetalDoor = $0390
!Define_DKC3_SpriteID_DoorGear = $0394
!Define_DKC3_SpriteID_SneekInWheel = $0398
!Define_DKC3_SpriteID_SneekControlledMetalDoor = $039C
!Define_DKC3_SpriteID_ArichLegs = $03A0
!Define_DKC3_SpriteID_ArichHead = $03A4
!Define_DKC3_SpriteID_ArichPupil = $03A8												; Note: Also the sawdust effect?
!Define_DKC3_SpriteID_UnknownSprite03AC = $03AC
!Define_DKC3_SpriteID_UnknownSprite03B0 = $03B0
!Define_DKC3_SpriteID_Lurchin = $03B4
!Define_DKC3_SpriteID_BleakSnowball = $03B8
!Define_DKC3_SpriteID_ReKoil = $03BC
!Define_DKC3_SpriteID_BleakFightKong = $03C0
!Define_DKC3_SpriteID_UnknownSprite03C4 = $03C4
!Define_DKC3_SpriteID_SkiddaAndKobble = $03C8
!Define_DKC3_SpriteID_BigSmokeCloud = $03CC
!Define_DKC3_SpriteID_Koin = $03D0														; Note: Also the Koindozer
!Define_DKC3_SpriteID_DKCoin = $03D4
!Define_DKC3_SpriteID_LemguinSpawner = $03D8
!Define_DKC3_SpriteID_DefeatedBleakSnowball = $03DC
!Define_DKC3_SpriteID_Knocka = $03E0
!Define_DKC3_SpriteID_KnockaLimbs = $03E4
!Define_DKC3_SpriteID_UnknownSprite03E8 = $03E8
!Define_DKC3_SpriteID_SideOfBelchasMouth = $03EC
!Define_DKC3_SpriteID_BurpedUpBarrel = $03F0
!Define_DKC3_SpriteID_KnikKnak = $03F4
!Define_DKC3_SpriteID_Krimp = $03F8
!Define_DKC3_SpriteID_KnautilusFireballShooter = $03FC
!Define_DKC3_SpriteID_BelchaPlatform = $0400
!Define_DKC3_SpriteID_BarbosMouth = $0404
!Define_DKC3_SpriteID_PurpleLurchin = $0408
!Define_DKC3_SpriteID_BarbosSpawnedGreenLurchin = $040C
!Define_DKC3_SpriteID_SeashellMissle = $0410
!Define_DKC3_SpriteID_Bristle = $0414
!Define_DKC3_SpriteID_Krumple = $0418
!Define_DKC3_SpriteID_Swoopy = $041C
!Define_DKC3_SpriteID_Kuchuka = $0420
!Define_DKC3_SpriteID_KuchukaHand = $0424
!Define_DKC3_SpriteID_FlyingKnikKnak = $0428
!Define_DKC3_SpriteID_Bazza = $042C
!Define_DKC3_SpriteID_BountyBass = $0430
!Define_DKC3_SpriteID_BootyBird = $0434
!Define_DKC3_SpriteID_UnknownSprite0438 = $0438
!Define_DKC3_SpriteID_UnknownSprite043C = $043C
!Define_DKC3_SpriteID_UnknownSprite0440 = $0440
!Define_DKC3_SpriteID_Nid = $0444
!Define_DKC3_SpriteID_Bazuka = $0448
!Define_DKC3_SpriteID_BarrelShotByBazuka = $044C
!Define_DKC3_SpriteID_BarrelSwitch = $0450
!Define_DKC3_SpriteID_Kopter = $0454
!Define_DKC3_SpriteID_MurkyMillElevator = $0458
!Define_DKC3_SpriteID_NibblaHead = $045C
!Define_DKC3_SpriteID_NibblaBody = $0460
!Define_DKC3_SpriteID_BonusBCoinBossPrize = $0464
!Define_DKC3_SpriteID_BearCoinBossPrize = $0468
!Define_DKC3_SpriteID_KAOSLaserHead = $046C
!Define_DKC3_SpriteID_KAOSSkullHead = $0470
!Define_DKC3_SpriteID_KAOSFlame = $0474
!Define_DKC3_SpriteID_KAOSBlade = $0478
!Define_DKC3_SpriteID_KAOSBoxingGlove = $047C
!Define_DKC3_SpriteID_KAOSFlameSpread = $0480
!Define_DKC3_SpriteID_Karbine = $0484
!Define_DKC3_SpriteID_KarbineFireball = $0488
!Define_DKC3_SpriteID_KrosshairFireball = $048C
!Define_DKC3_SpriteID_GleaminBream = $0490
!Define_DKC3_SpriteID_KAOSCylinderHead = $0494
!Define_DKC3_SpriteID_KAOSBombs = $0498
!Define_DKC3_SpriteID_UnknownSprite049C = $049C
!Define_DKC3_SpriteID_TNTExplosion = $04A0
!Define_DKC3_SpriteID_KRoolPropeller = $04A4
!Define_DKC3_SpriteID_KastleKAOSLever = $04A8
!Define_DKC3_SpriteID_ElectricNode = $04AC
!Define_DKC3_SpriteID_KRoolsFeet = $04B0
!Define_DKC3_SpriteID_KnautilusFireballShooterFireball = $04B4
!Define_DKC3_SpriteID_BGSteelKeg = $04B8
!Define_DKC3_SpriteID_SquirtsEyePart = $04BC
!Define_DKC3_SpriteID_UnknownSprite04C0 = $04C0
!Define_DKC3_SpriteID_CrankyKong = $04C4
!Define_DKC3_SpriteID_TimerDigit = $04C8
!Define_DKC3_SpriteID_HeadToHeadIcon = $04CC
!Define_DKC3_SpriteID_Target = $04D0
!Define_DKC3_SpriteID_TargetShootKong = $04D4
!Define_DKC3_SpriteID_SwankyKong = $04D8
!Define_DKC3_SpriteID_PrizeFromSwankyKong = $04DC



!RAM_DKC3_Global_CurrentLevelLo = $0000C0
!RAM_DKC3_Global_CurrentLevelHi = !RAM_DKC3_Global_CurrentLevelLo+$01

!RAM_DKC3_Global_CurrentBoatLo = $0005EB
!RAM_DKC3_Global_CurrentBoatHi = !RAM_DKC3_Global_CurrentBoatLo+$01

; $000632 = Level tile flag table?

!RAM_DKC3_Global_FrenchTextFlag = $0006D6

!RAM_DKC3_Level_SpriteDataRAM = $000878

!RAM_DKC3_Global_TextBuffer = $7EA9DE

struct DKC3_Level_SpriteDataRAM $00 ;!RAM_DKC3_Level_SpriteDataRAM
	.SpriteIDLo: skip $01		; $00
	.SpriteIDHi: skip $01		; $01
	.RoutinePtrLo: skip $01		; $02
	.RoutinePtrHi: skip $01		; $03
	.RoutinePtrBank: skip $01		; $04
	skip $01					; $05
	skip $01					; $06
	skip $01					; $07
	skip $01					; $08
	skip $01					; $09
	skip $01					; $0A
	skip $01					; $0B
	skip $01					; $0C
	skip $01					; $0D
	skip $01					; $0E
	skip $01					; $0F
	skip $01					; $10
	.SubXPos: skip $01			; $11
	.XPosLo: skip $01			; $12
	.XPosHi: skip $01			; $13
	skip $01					; $14
	.SubYPos: skip $01			; $15
	.YPosLo: skip $01			; $16
	.YPosHi: skip $01			; $17
	skip $01					; $18
	skip $01					; $19
	skip $01					; $1A
	skip $01					; $1B
	skip $01					; $1C
	skip $01					; $1D
	skip $01					; $1E
	skip $01					; $1F
	skip $01					; $20
	skip $01					; $21
	skip $01					; $22
	skip $01					; $23
	skip $01					; $24
	skip $01					; $25
	skip $01					; $26
	skip $01					; $27
	skip $01					; $28
	skip $01					; $29
	.XSpeedLo: skip $01		; $2A
	.XSpeedHi: skip $01		; $2B
	skip $01					; $2C
	skip $01					; $2D
	.YSpeedLo: skip $01		; $2E
	.YSpeedHi: skip $01		; $2F
	skip $01					; $30
	skip $01					; $31
	skip $01					; $32
	skip $01					; $33
	skip $01					; $34
	skip $01					; $35
	skip $01					; $36
	skip $01					; $37
	skip $01					; $38
	skip $01					; $39
	skip $01					; $3A
	skip $01					; $3B
	skip $01					; $3C
	skip $01					; $3D
	skip $01					; $3E
	skip $01					; $3F
	skip $01					; $40
	skip $01					; $41
	skip $01					; $42
	skip $01					; $43
	skip $01					; $44
	skip $01					; $45
	.AnimationScriptIndexLo: skip $01	; $46
	.AnimationScriptIndexHi: skip $01	; $47
	skip $01					; $48
	skip $01					; $49
	skip $01					; $4A
	skip $01					; $4B
	skip $01					; $4C
	skip $01					; $4D
	skip $01					; $4E
	skip $01					; $4F
	skip $01					; $50
	skip $01					; $51
	skip $01					; $52
	skip $01					; $53
	skip $01					; $54
	skip $01					; $55
	skip $01					; $56
	skip $01					; $57
	skip $01					; $58
	skip $01					; $59
	skip $01					; $5A
	skip $01					; $5B
	skip $01					; $5C
	skip $01					; $5D
endstruct align $6E


 
;--------------------------------------------------------------------

macro DKC3_AnS_OpXX(Param1, Param2)
	db <Param1> : dw <Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op80(Param1)
	db $80 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op81(Param1, Param2)
	db $81 : dw <Param1>,<Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op82(Param1)
	db $82 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op83(Param1)
	db $83 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op84(Param1, Param2)
	db $84 : dw <Param1>,<Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op85(Param1)
	db $85 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op86(Param1, Param2)
	db $86 : dw <Param1>,<Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op87(Param1)
	db $87 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op88(Param1, Param2)
	db $88 : dw <Param1>,<Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op89(Param1)
	db $89 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op8A(Param1, Param2)
	db $8A : db <Param1> : dw <Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op8B(Param1, Param2)
	db $8B : db <Param1> : dw <Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op8C(Param1, Param2)
	db $8C : db <Param1> : dw <Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op8D(Param1)
	db $8D : db <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op8E(Param1)
	db $8E : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op8F(Param1)
	db $8F : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op90(Param1, Param2, Param3)
	db $90 : db <Param1> : dw <Param2>,<Param3>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op91(Param1, Param2)
	db $91 : dw <Param1>,<Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op92(Param1, Param2, Param3)
	db $92 : db <Param1> : dw <Param2>,<Param3>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op93(Param1, Param2, Param3, Param4)
	db $93 : db <Param1>,<Param2> : dw <Param3> : db <Param4>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op94(Param1, Param2, Param3, Param4, Param5)
	db $94 : db <Param1> : dw <Param2> : db <Param3>,<Param4>,<Param5>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op95(Param1, Param2, Param3, Param4)
	db $95 : db <Param1> : dw <Param2>,<Param3>,<Param4>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op96(Param1, Param2, Param3, Param4, Param5)
	db $96 : db <Param1> : dw <Param2>,<Param3>,<Param4>,<Param5>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op97(Param1, Param2, Param3, Param4)
	db $97 : db <Param1> : dw <Param2>,<Param3>,<Param4>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op98(Param1, Param2, Param3, Param4, Param5, Param6)
	db $98 : db <Param1> : dw <Param2>,<Param3>,<Param4>,<Param5>,<Param6>
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op99()
	db $99
endmacro

;--------------------------------------------------------------------

macro DKC3_AnS_Op9A()
	db $9A
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpXX(Param1, Param2)
	db <Param1> : dw <Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpEF()
	db $EF
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF0()
	db $F0
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF1(Param1, Param2)
	db $F1 : db <Param1> : dw <Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF2(Param1)
	db $F2 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF3(Param1, Param2)
	db $F3 : db <Param1>,<Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF4(Param1, Param2, Param3, Param4, Param5, Param6, Param7, Param8, Param9, Param10)
	db $F4 : dw <Param1> : db <Param2>,<Param3>,<Param4>,<Param5>,<Param6>,<Param7>,<Param8>,<Param9>,<Param10>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF5()
	db $F5
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF6(Param1, Param2)
	db $F6 : db <Param1>,<Param2>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF7(Param1, Param2, Param3)
	db $F7 : dw <Param1>,<Param2> : db <Param3>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF8(Param1, Param2, Param3, Param4)
	db $F8 : dw <Param1>,<Param2>,<Param3>,<Param4>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpF9(Param1)
	db $F9 : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpFA(Param1)
	db $FA : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpFB(Param1)
	db $FB : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpFC(Param1)
	db $FC : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpFD(Param1)
	db $FD : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpFE(Param1)
	db $FE : dw <Param1>
endmacro

;--------------------------------------------------------------------

macro DKC3_SSS_OpFF(Param1)
	db $FF : dw <Param1>
endmacro

;--------------------------------------------------------------------


struct DMA $004300
	.Parameters: skip $01
	.Destination: skip $01
	.SourceLo: skip $01
	.SourceHi: skip $01
	.SourceBank: skip $01
	.SizeLo: skip $01
	.SizeHi: skip $01
	.Unused1: skip $01
	.Unused2: skip $01
	.Unused3: skip $01
	.Unused4: skip $01
endstruct align $10

struct HDMA $004300
	.Parameters: skip $01
	.Destination: skip $01
	.SourceLo: skip $01
	.SourceHi: skip $01
	.SourceBank: skip $01
	.IndirectSourceLo: skip $01
	.IndirectSourceHi: skip $01
	.IndirectSourceBank: skip $01
	.TableSourceLo: skip $01
	.TableSourceHi: skip $01
	.LineCount: skip $01
endstruct align $10

	!DMAParams_TransferMode_1Reg1Write = $00
	!DMAParams_TransferMode_2Regs1Write = $01
	!DMAParams_TransferMode_1Reg2Writes = $02
	!DMAParams_TransferMode_2Regs2Writes = $03
	!DMAParams_TransferMode_4Regs1Write = $04
	!DMAParams_TransferMode_2Regs2WritesAlternating = $05
	!DMAParams_TransferMode_CopyOf1Reg2Writes = $06
	!DMAParams_TransferMode_CopyOf2Regs2Writes = $07
	!DMAParams_EnableFixedTransfer = $08
	!DMAParams_IncrementSourceAddr = $00
	!DMAParams_DecrementSourceAddr = $10
	!DMAParams_HDMAUseDirectAddr = $00
	!DMAParams_HDMAUseIndirectAddr = $40
	!DMAParams_TransferDirection_ABusToBBus = $00
	!DMAParams_TransferDirection_BBusToABus = $80