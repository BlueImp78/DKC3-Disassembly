; Note: These NOP : JMPs must be at the start of this half bank or else the decompression routine will break.

CODE_BB8000:
	NOP
	JMP.w CODE_BB86BA

CODE_BB8004:
	NOP
	JMP.w CODE_BB8726

CODE_BB8008:
	NOP
	JMP.w CODE_BB8744

CODE_BB800C:
	NOP
	JMP.w CODE_BB877B

CODE_BB8010:
	NOP
	JMP.w CODE_BB87B6

CODE_BB8014:
	NOP
	JMP.w CODE_BB87E3

CODE_BB8018:
	NOP
	JMP.w CODE_BB8810

CODE_BB801C:
	NOP
	JMP.w CODE_BB882C

CODE_BB8020:
	NOP
	JMP.w CODE_BB883E

CODE_BB8024:
	NOP
	JMP.w CODE_BB8850

CODE_BB8028:
	NOP
	JMP.w CODE_BB888F

CODE_BB802C:
	NOP
	JMP.w CODE_BB88F2

CODE_BB8030:
	NOP
	JMP.w CODE_BB8959

CODE_BB8034:
	NOP
	JMP.w CODE_BB89C8

CODE_BB8038:
	NOP
	JMP.w CODE_BB89E0

CODE_BB803C:
	NOP
	JMP.w CODE_BB8A06

CODE_BB8040:
	JMP.w CODE_BB86FF

CODE_BB8043:
	NOP
	JMP.w CODE_BB873A

CODE_BB8047:
	NOP
	JMP.w CODE_BB876B

CODE_BB804B:
	NOP
	JMP.w CODE_BB8791

CODE_BB804F:
	NOP
	JMP.w CODE_BB87CB

CODE_BB8053:
	NOP
	JMP.w CODE_BB87F8

CODE_BB8057:
	NOP
	JMP.w CODE_BB881E

CODE_BB805B:
	NOP
	JMP.w CODE_BB8835

CODE_BB805F:
	NOP
	JMP.w CODE_BB8847

CODE_BB8063:
	NOP
	JMP.w CODE_BB886E

CODE_BB8067:
	NOP
	JMP.w CODE_BB88B9

CODE_BB806B:
	NOP
	JMP.w CODE_BB8927

CODE_BB806F:
	NOP
	JMP.w CODE_BB8982

CODE_BB8073:
	NOP
	JMP.w CODE_BB89D4

CODE_BB8077:
	NOP
	JMP.w CODE_BB89F3

CODE_BB807B:
	NOP
	JMP.w CODE_BB8A20

UNK_BB807F:
	db $12,$29,$DE,$B3,$BF

DATA_BB8084:
	dd (DKC3_NorSpr0000_EmptySpriteSlot_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0004_UnknownSprite0004_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0008_UnknownSprite0008_Main-$01)|($00<<24)
	dd (DKC3_NorSpr000C_UnknownSprite000C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0010_HeadToHeadDot_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0014_ThrownSoftball_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0018_UnknownSprite0018_Main-$01)|($00<<24)
	dd (DKC3_NorSpr001C_UnknownSprite001C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0020_ArichSpit_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0024_UnknownSprite0024_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0028_UnknownSprite0028_Main-$01)|($00<<24)
	dd (DKC3_NorSpr002C_ThrownSnowball_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0030_BarrelShield_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0034_BarrelPieces_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0038_MapSwimmingKongSplash_Main-$01)|($00<<24)
	dd (DKC3_NorSpr003C_UnknownSprite003C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0040_MinkeyAcorn_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0044_RotatingCylinderKey_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0048_BleakFightCursor_Main-$01)|($00<<24)
	dd (DKC3_NorSpr004C_TopOfCottonTopCoveWaterfall_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0050_BarbosSpikeProjectile_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0054_BarbosEye_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0058_BarbosPupil_Main-$01)|($00<<24)
	dd (DKC3_NorSpr005C_UnknownSprite005C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0060_BottomOfRightCottonTopCoveWaterfall_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0064_BottomOfCottonTopCoveWaterfall_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0068_PlayModeText_Main-$01)|($00<<24)
	dd (DKC3_NorSpr006C_UnknownSprite006C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0070_BananaBirdCaveCover_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0074_UnknownSprite0074_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0078_EllieHorizontalWaterShot_Main-$01)|($00<<24)
	dd (DKC3_NorSpr007C_EllieDiagonalWaterShot_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0080_SquawksEgg_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0084_KremwoodForestLog_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0088_MapCannon_Main-$01)|($00<<24)
	dd (DKC3_NorSpr008C_UnknownSprite008C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0090_KAOSLaserHeadFlameJet_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0094_ChairliftChair_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0098_SewerStockpileGrate_Main-$01)|($00<<24)
	dd (DKC3_NorSpr009C_UnknownSprite009C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00A0_UnknownSprite00A0_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00A4_UnknownSprite00A4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00A8_RazorRidgePipe_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00AC_UnknownSprite00AC_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00B0_UnknownSprite00B0_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00B4_KremtoaBridge_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00B8_KuchukaBomb_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00BC_RedGemInBananaBirdQueenBarrier_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00C0_MapBananaBird_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00C4_KRoolFightPlatform_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00C8_KRoolFightBGDecorations_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00CC_SquirtPupil_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00D0_Minkey_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00D4_UnknownSprite00D4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00D8_BelchaTooth_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00DC_UnknownSprite00DC_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00E0_InventoryItemHUDSquares_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00E4_UnknownSprite00E4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00E8_Squirt_Main-$01)|($01<<24)
	dd (DKC3_NorSpr00EC_UpwardsShotBarrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00F0_RareLogo_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00F4_UnknownSprite00F4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00F8_FunkyKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr00FC_TitleScreenSign_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0100_SneekWheel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0104_AreaNameText_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0108_Bleak_Main-$01)|($00<<24)
	dd (DKC3_NorSpr010C_BananaBirdCaveCrystal_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0110_UnknownSprite0110_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0114_TheEndSign_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0118_KRool_Main-$01)|($00<<24)
	dd (DKC3_NorSpr011C_KRoolCurtain_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0120_GiantBananaBirdQueenEgg_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0124_LevelEndFlagpole_Main-$01)|($01<<24)
	dd (DKC3_NorSpr0128_UnknownSprite0128_Main-$01)|($00<<24)
	dd (DKC3_NorSpr012C_UnknownSprite012C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0130_UnknownSprite0130_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0134_UnknownSprite0134_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0138_UnknownSprite0138_Main-$01)|($00<<24)
	dd (DKC3_NorSpr013C_StampedeTrigger_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0140_UnknownSprite0140_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0144_FloorDoor_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0148_ExitDoor_Main-$01)|($00<<24)
	dd (DKC3_NorSpr014C_SpawnedRegularBanana_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0150_GreenBanana_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0154_GreenBananaSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0158_KongFusedCliffsRope_Main-$01)|($00<<24)
	dd (DKC3_NorSpr015C_KongFusedCliffsAutoscroll_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0160_UnknownSprite0160_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0164_KAOSHeadExplosionSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0168_VerticalAutoscroll_Main-$01)|($00<<24)
	dd (DKC3_NorSpr016C_WaterfallBarrelSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0170_BarrelRespawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0174_UnknownSprite0174_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0178_BuzzSwarmSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr017C_UnknownSprite0180_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0180_UnknownSprite0180_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0184_TargetSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0188_UnknownSprite0188_Main-$01)|($00<<24)
	dd (DKC3_NorSpr018C_KuffnKlout_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0190_UnknownSprite0190_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0194_ArichBackHitbox_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0198_MapFlag_Main-$01)|($00<<24)
	dd (DKC3_NorSpr019C_UnknownSprite019C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01A0_UnknownSprite01A0_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01A4_FileSelectMenu_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01A8_UnknownSprite01A8_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01AC_BrashCabinDigitalDisplay_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01B0_FileSelectNumber_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01B4_UnknownSprite01B4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01B8_UnknownSprite01B8_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01BC_UnknownSprite01BC_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01C0_SpeedrunTimer_Main-$01)|($01<<24)
	dd (DKC3_NorSpr01C4_UnknownSprite01C4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01C8_UnknownSprite01C8_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01CC_UnknownSprite01CC_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01D0_LightningBoltSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01D4_KnautilusSpriteMask_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01D8_PlayerKrosshairController_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01DC_UnknownSprite01DC_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01E0_UnknownSprite01E0_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01E4_UnknownSprite01E4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01E8_Belcha_Main-$01)|($01<<24)
	dd (DKC3_NorSpr01EC_Barbos_Main-$01)|($01<<24)
	dd (DKC3_NorSpr01F0_UnknownSprite01F0_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01F4_SquealsOnWheelsTracker_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01F8_BazzaSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr01FC_BananaBird_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0200_UnknownSprite0200_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0204_KAOS_Main-$01)|($01<<24)
	dd (DKC3_NorSpr0208_UnknownSprite0208_Main-$01)|($00<<24)
	dd (DKC3_NorSpr020C_UnknownSprite020C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0210_NintendoPresentsKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0214_RotatingCylinderHandle_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0218_RareLogoKiddy_Main-$01)|($00<<24)
	dd (DKC3_NorSpr021C_RareLogoDixie_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0220_Toboggan_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0224_TobogganSparks_Main-$01)|($01<<24)
	dd (DKC3_NorSpr0228_LargePipe_Main-$01)|($00<<24)
	dd (DKC3_NorSpr022C_DixieKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0230_KiddyKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0234_Ellie_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0238_Enguarde_Main-$01)|($00<<24)
	dd (DKC3_NorSpr023C_Squawks_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0240_Squitter_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0244_Parry_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0248_WebShot_Main-$01)|($00<<24)
	dd (DKC3_NorSpr024C_WebPlatform_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0250_AnimalBuddyBox_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0254_AnimalBuddyIcon_Main-$01)|($01<<24)
	dd (DKC3_NorSpr0258_NoAnimalBuddySign_Main-$01)|($01<<24)
	dd (DKC3_NorSpr025C_UnknownSprite025C_Main-$01)|($01<<24)
	dd (DKC3_NorSpr0260_UnknownSprite0260_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0264_UnknownSprite0264_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0268_FireballLandingParticles_Main-$01)|($00<<24)
	dd (DKC3_NorSpr026C_BurstEffect_Main-$01)|($01<<24)
	dd (DKC3_NorSpr0270_WaterSplash_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0274_SmokePuff_Main-$01)|($01<<24)
	dd (DKC3_NorSpr0278_BarrelSwitchS_Main-$01)|($00<<24)
	dd (DKC3_NorSpr027C_MillPlatform_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0280_UnknownSprite0280_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0284_BearCoin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0288_UnknownSprite0288_Main-$01)|($00<<24)
	dd (DKC3_NorSpr028C_BonusBCoin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0290_CollectableCog_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0294_KongLetters_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0298_Bananas_Main-$01)|($00<<24)
	dd (DKC3_NorSpr029C_ExtraLifeBalloon_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02A0_LevelEndFlag_Main-$01)|($01<<24)
	dd (DKC3_NorSpr02A4_UnknownSprite02A4_Main-$01)|($01<<24)
	dd (DKC3_NorSpr02A8_BonusLevelTimer_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02AC_RopeFire_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02B0_KongWaterSplash_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02B4_BarrelCannon_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02B8_BarrelIcons_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02BC_CheckpointBarrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02C0_Barrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02C4_DKBarrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02C8_UnknownSprite02C8_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02CC_UnknownSprite02CC_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02D0_TNTBarrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02D4_SteelKeg_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02D8_WoodenBox_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02DC_WaterfallBarrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02E0_InvincibilityBarrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02E4_FuelCan_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02E8_KAOSHeadExplosion_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02EC_Rocket_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02F0_RocketFlame_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02F4_RocketEyes_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02F8_Sneek_Main-$01)|($00<<24)
	dd (DKC3_NorSpr02FC_Buzz_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0300_Koco_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0304_MapKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0308_StationaryDisplaySprite1_Main-$01)|($00<<24)
	dd (DKC3_NorSpr030C_MapVehicle_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0310_UnknownSprite0310_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0314_EndingSwankyKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0318_MovingDisplaySprite_Main-$01)|($00<<24)
	dd (DKC3_NorSpr031C_GameOverBlocks_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0320_BrothersBear_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0324_BrothersBearAccessories_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0328_MainMapWaterfall_Main-$01)|($00<<24)
	dd (DKC3_NorSpr032C_UnknownSprite032C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0330_FileSelectIcon_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0334_ChairliftPulley_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0338_UnknownSprite0338_Main-$01)|($00<<24)
	dd (DKC3_NorSpr033C_StationaryDisplaySprite2_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0340_BramblesVase_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0344_GyrocopterBladesAndShadow_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0348_UnknownSprite0348_Main-$01)|($00<<24)
	dd (DKC3_NorSpr034C_UnknownSprite034C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0350_UnknownSprite0350_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0354_SkyHighSecretRock_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0358_Krosshair_Main-$01)|($00<<24)
	dd (DKC3_NorSpr035C_Knautilus_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0360_UnknownSprite0360_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0364_KRoolHead_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0368_MotorBoatFunkyAndCrankyInEnding_Main-$01)|($00<<24)
	dd (DKC3_NorSpr036C_WrinklysSaveCave_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0370_MapBananaBirdQueen_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0374_BuzzSwarrm_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0378_FollowingKlasp_Main-$01)|($00<<24)
	dd (DKC3_NorSpr037C_AutoMovingKlasp_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0380_Lemguin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0384_FriendlyNibblaHead_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0388_FriendlyNibblaBody_Main-$01)|($00<<24)
	dd (DKC3_NorSpr038C_DoorLeverHandle_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0390_LeverControlledMetalDoor_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0394_DoorGear_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0398_SneekInWheel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr039C_SneekControlledMetalDoor_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03A0_ArichLegs_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03A4_ArichHead_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03A8_ArichPupil_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03AC_UnknownSprite03AC_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03B0_UnknownSprite03B0_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03B4_Lurchin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03B8_BleakSnowball_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03BC_ReKoil_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03C0_BleakFightKong_Main-$01)|($01<<24)
	dd (DKC3_NorSpr03C4_UnknownSprite03C4_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03C8_SkiddaAndKobble_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03CC_BigSmokeCloud_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03D0_Koin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03D4_DKCoin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03D8_LemguinSpawner_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03DC_DefeatedBleakSnowball_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03E0_Knocka_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03E4_KnockaLimbs_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03E8_UnknownSprite03E8_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03EC_SideOfBelchasMouth_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03F0_BurpedUpBarrel_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03F4_KnikKnak_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03F8_Krimp_Main-$01)|($00<<24)
	dd (DKC3_NorSpr03FC_KnautilusFireballShooter_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0400_BelchaPlatform_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0404_BarbosMouth_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0408_PurpleLurchin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr040C_BarbosSpawnedGreenLurchin_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0410_SeashellMissle_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0414_Bristle_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0418_Krumple_Main-$01)|($00<<24)
	dd (DKC3_NorSpr041C_Swoopy_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0420_Kuchuka_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0424_KuchukaHand_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0428_FlyingKnikKnak_Main-$01)|($00<<24)
	dd (DKC3_NorSpr042C_Bazza_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0430_BountyBass_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0434_BootyBird_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0438_UnknownSprite0438_Main-$01)|($00<<24)
	dd (DKC3_NorSpr043C_UnknownSprite043C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0440_UnknownSprite0440_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0444_Nid_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0448_Bazuka_Main-$01)|($00<<24)
	dd (DKC3_NorSpr044C_BarrelShotByBazuka_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0450_BarrelSwitch_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0454_Kopter_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0458_MurkyMillElevator_Main-$01)|($00<<24)
	dd (DKC3_NorSpr045C_NibblaHead_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0460_NibblaBody_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0464_BonusBCoinBossPrize_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0468_BearCoinBossPrize_Main-$01)|($00<<24)
	dd (DKC3_NorSpr046C_KAOSLaserHead_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0470_KAOSSkullHead_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0474_KAOSFlame_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0478_KAOSBlade_Main-$01)|($00<<24)
	dd (DKC3_NorSpr047C_KAOSBoxingGlove_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0480_KAOSFlameSpread_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0484_Karbine_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0488_KarbineFireball_Main-$01)|($00<<24)
	dd (DKC3_NorSpr048C_KrosshairFireball_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0490_GleaminBream_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0494_KAOSCylinderHead_Main-$01)|($00<<24)
	dd (DKC3_NorSpr0498_KAOSBombs_Main-$01)|($00<<24)
	dd (DKC3_NorSpr049C_UnknownSprite049C_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04A0_TNTExplosion_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04A4_KRoolPropeller_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04A8_KastleKAOSLever_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04AC_ElectricNode_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04B0_KRoolsFeet_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04B4_KnautilusFireballShooterFireball_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04B8_BGSteelKeg_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04BC_SquirtsEyePart_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04C0_UnknownSprite04C0_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04C4_CrankyKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04C8_TimerDigit_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04CC_HeadToHeadIcon_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04D0_Target_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04D4_TargetShootKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04D8_SwankyKong_Main-$01)|($00<<24)
	dd (DKC3_NorSpr04DC_PrizeFromSwankyKong_Main-$01)|($00<<24)

disable_screen_wrapper:
	JMP.w disable_screen

vram_payload_handler_global:
	JMP vram_payload_handler

set_PPU_registers_global:
	JMP.w set_PPU_registers

CODE_BB856D:
	JMP.w CODE_BB8DE8

CODE_BB8570:
	JMP.w CODE_BB8DF4

CODE_BB8573:
	JMP.w CODE_BB8DFE

CODE_BB8576:
	JMP.w CODE_BB9957

CODE_BB8579:
	JMP.w CODE_BB97B1

CODE_BB857C:
	JMP.w CODE_BB8632

CODE_BB857F:
	JMP.w init_sprite_render_order

CODE_BB8582:
	JMP.w CODE_BBA647

CODE_BB8585:
	JMP.w CODE_BB8F61

CODE_BB8588:
	JMP.w CODE_BB8FAE

CODE_BB858B:
	JMP.w CODE_BB8FDD

CODE_BB858E:
	JMP.w CODE_BB8FF1

CODE_BB8591:
	JMP.w CODE_BB9482

CODE_BB8594:
	JMP.w CODE_BB9497

CODE_BB8597:
	JMP.w CODE_BB948D

CODE_BB859A:
	JMP.w request_palette_direct_global

CODE_BB859D:
	JMP.w CODE_BB9722

CODE_BB85A0:
	JMP.w CODE_BB9785

CODE_BB85A3:
	JMP.w CODE_BBAB04

CODE_BB85A6:
	JMP.w CODE_BBAB3B

CODE_BB85A9:
	JMP.w CODE_BBADC1

CODE_BB85AC:
	JMP.w CODE_BBAD15

CODE_BB85AF:
	JMP.w CODE_BBAC30

CODE_BB85B2:
	JMP.w CODE_BBAC47

CODE_BB85B5:
	JMP.w CODE_BB8F34

CODE_BB85B8:
	JMP.w CODE_BB8F12

CODE_BB85BB:
	JMP.w CODE_BBB426

CODE_BB85BE:
	JMP.w CODE_BBADD9

CODE_BB85C1:
	JMP.w CODE_BBB8A5

CODE_BB85C4:
	JMP.w CODE_BBB880

CODE_BB85C7:
	JMP.w CODE_BBA211

CODE_BB85CA:
	JMP.w CODE_BB8F18

CODE_BB85CD:
	JMP.w CODE_BB8F67

CODE_BB85D0:
	JMP.w CODE_BBB9DD

CODE_BB85D3:
	JMP.w CODE_BBB9E4

CODE_BB85D6:
	JMP.w CODE_BBBA95

CODE_BB85D9:
	JMP.w CODE_BB9592

CODE_BB85DC:
	JMP.w CODE_BB9722

CODE_BB85DF:
	JMP.w CODE_BB8A6F

CODE_BB85E2:
	JMP.w CODE_BBBAAE

CODE_BB85E5:
	JMP.w CODE_BB861E

CODE_BB85E8:
	JMP.w CODE_BB9474

CODE_BB85EB:
	JMP.w CODE_BB9573

CODE_BB85EE:
	JMP.w CODE_BB9503

CODE_BB85F1:
	JMP.w CODE_BBA1F3

CODE_BB85F4:
	JMP.w CODE_BB97AE

CODE_BB85F7:
	JMP.w CODE_BB8FA4

CODE_BB85FA:
	JMP.w CODE_BB9B06

CODE_BB85FD:
	JMP.w CODE_BB9772

CODE_BB8600:
	JMP.w CODE_BB9776

CODE_BB8603:
	JMP.w CODE_BB8F3A

CODE_BB8606:
	JMP.w CODE_BBADD4

CODE_BB8609:
	JMP.w CODE_BB9144

CODE_BB860C:
	JMP.w CODE_BB8F59

CODE_BB860F:
	JMP.w CODE_BB975F

CODE_BB8612:
	JMP.w CODE_BB8F2C

CODE_BB8615:
	LDA.w $0454
	PHA
	LDA.w $0452
	BRA.b CODE_BB8639

CODE_BB861E:
	JSL.l CODE_BB8A3F
	PEA.w $7E0000>>16
	BRA.b CODE_BB8639

ADDR_BB8627:
	LDA.w #$0000
	PEA.w $7F0000>>16
	BRA.b CODE_BB8639

CODE_BB862F:
	LDA.w #$0000
CODE_BB8632:
	JSL.l CODE_BB8A3F
	PEA.w $7F0000>>16
CODE_BB8639:										; Note: Decompression routine.
	STA.b $20
	PLA
	STA.b $22
	STX.b $1C
	STY.b $1E
	PHB
	PHY
	LDA.w #$FFFF
	STA.b $1A
	LDA.w #$7E2100
	STA.b $2E
	LDA.w #$7E2100>>16
	STA.b $30
	STA.b $2C
	LDA.w #$2000
	STA.b $2A
	LDA.w #$8001
	STA.b $36
	LDA.w #$8040
	STA.b $32
	LDX.b $20
	LDY.w #$0001
	SEP.b #$20
	LDA.b $22
	PHA
	PLB
	LDA.b [$1C],y
	STA.b $3A
	INY
	LDA.b [$1C],y
	STA.b $3B
	INY
	LDA.b [$1C],y
	STA.b $3E
	INY
	LDA.b [$1C],y
	STA.b $3F
	INY
	REP.b #$20
	LDA.b [$1C],y
	STA.b $3C
	LDY.w #$0027
	STZ.b $24
	STZ.b $26
	SEP.b #$20
CODE_BB8692:
	LDA.b [$1C],y
	INY
	STA.b $2E
	AND.b #$F0
	LSR
	LSR
	STA.b $36
	PEI.b ($36)
	RTS

CODE_BB86A0:
	LDA.b $2E
	AND.b #$0F
	ASL
	ASL
	ADC.b #$3F
	STA.b $32
	PEI.b ($32)
	RTS

CODE_BB86AD:
	LDA.b $2A
	AND.b #$0F
	ASL
	ASL
	ADC.b #$3F
	STA.b $32
	PEI.b ($32)
	RTS

CODE_BB86BA:
	LDA.b $2E
	AND.b #$0F
	BEQ.b CODE_BB86D0
	STA.b $24
CODE_BB86C2:
	LDA.b [$1C],y
	INY
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB86C2
	JMP.w CODE_BB8692

CODE_BB86D0:
	REP.b #$20
	PLY
	PLB
	TXA
	SEC
	SBC.b $20
	TAX
	LDA.b $1A
	BMI.b CODE_BB86FE
	LDA.b $40
	STA.w !REGISTER_VRAMAddressLo
	LDA.b $20
	STA.w DMA[$00].SourceLo
	LDA.b $22
	STA.w DMA[$00].SourceBank
	STX.w DMA[$00].SizeLo
	LDA.w #(!REGISTER_WriteToVRAMPortLo&$0000FF<<8)+$01
	STA.w DMA[$00].Parameters
	SEP.b #$20
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
CODE_BB86FE:
	RTL

CODE_BB86FF:
	LDA.b [$1C],y
	INY
	STA.b $2A
	STA.b $2E
	LDA.b [$2A]
	BEQ.b CODE_BB86D0
	STA.b $24
CODE_BB870C:
	LDA.b [$2E]
	STA.b $26
	LDA.b [$1C],y
	INY
	STA.b $2A
	STA.b $2E
	LDA.b $26
	ORA.b [$2A]
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB870C
	JMP.w CODE_BB86A0

CODE_BB8726:
	LDA.b [$2E]
	STA.b $26
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b $26
	ORA.b [$2A]
	STA.w $0000,x
	INX
	JMP.w CODE_BB86AD

CODE_BB873A:
	LDA.b [$1C],y
	INY
	STA.w $0000,x
	INX
	JMP.w CODE_BB8692

CODE_BB8744:
	LDA.b [$2E]
	STA.b $26
	LDA.b [$1C],y
	INY
	STA.b $2A
	STA.b $2E
	LDA.b $26
	ORA.b [$2A]
	STA.w $0000,x
	INX
	LDA.b [$2E]
	STA.b $26
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b $26
	ORA.b [$2A]
	STA.w $0000,x
	INX
	JMP.w CODE_BB86AD

CODE_BB876B:
	REP.b #$20
	LDA.b [$1C],y
	STA.w $0000,x
	INY
	INY
	INX
	INX
	SEP.b #$20
	JMP.w CODE_BB8692

CODE_BB877B:
	LDA.b $2E
	AND.b #$0F
	ADC.b #$03
	STA.b $24
	LDA.b [$1C],y
	INY
CODE_BB8786:
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB8786
	JMP.w CODE_BB8692

CODE_BB8791:
	LDA.b [$1C],y
	INY
	STA.b $2A
	STA.b $2E
	LDA.b [$2A]
	ADC.b #$03
	STA.b $24
	LDA.b [$2E]
	STA.b $26
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b $26
	ORA.b [$2A]
CODE_BB87AB:
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB87AB
	JMP.w CODE_BB86AD

CODE_BB87B6:
	LDA.b $2E
	AND.b #$0F
	ADC.b #$03
	STA.b $24
	LDA.b $3A
CODE_BB87C0:
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB87C0
	JMP.w CODE_BB8692

CODE_BB87CB:
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b [$2A]
	ADC.b #$03
	STA.b $24
	LDA.b $3A
CODE_BB87D8:
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB87D8
	JMP.w CODE_BB86AD

CODE_BB87E3:
	LDA.b $2E
	AND.b #$0F
	ADC.b #$03
	STA.b $24
	LDA.b $3B
CODE_BB87ED:
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB87ED
	JMP.w CODE_BB8692

CODE_BB87F8:
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b [$2A]
	ADC.b #$03
	STA.b $24
	LDA.b $3B
CODE_BB8805:
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB8805
	JMP.w CODE_BB86AD

CODE_BB8810:
	REP.b #$20
	LDA.b $3C
	STA.w $0000,x
	INX
	INX
	SEP.b #$20
	JMP.w CODE_BB86A0

CODE_BB881E:
	REP.b #$20
	LDA.b $3C
	STA.w $0000,x
	INX
	INX
	SEP.b #$20
	JMP.w CODE_BB8692

CODE_BB882C:
	LDA.b $3E
	STA.w $0000,x
	INX
	JMP.w CODE_BB86A0

CODE_BB8835:
	LDA.b $3E
	STA.w $0000,x
	INX
	JMP.w CODE_BB8692

CODE_BB883E:
	LDA.b $3F
	STA.w $0000,x
	INX
	JMP.w CODE_BB86A0

CODE_BB8847:
	LDA.b $3F
	STA.w $0000,x
	INX
	JMP.w CODE_BB8692

CODE_BB8850:
	PHY
	LDA.b $2E
	AND.b #$0F
	ADC.b #$02
	STA.b $26
	REP.b #$20
	TXA
	SEC
	SBC.b $26
	TAY
	LDA.w $0000,y
	STA.w $0000,x
	INX
	INX
	SEP.b #$20
	PLY
	JMP.w CODE_BB8692

CODE_BB886E:
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b [$2A]
	ADC.b #$02
	STA.b $26
	PHY
	REP.b #$20
	TXA
	SEC
	SBC.b $26
	TAY
	LDA.w $0000,y
	STA.w $0000,x
	INX
	INX
	SEP.b #$20
	PLY
	JMP.w CODE_BB86AD

CODE_BB888F:
	LDA.b $2E
	AND.b #$0F
	ADC.b #$03
	STA.b $24
	LDA.b [$1C],y
	STA.b $26
	INY
	PHY
	REP.b #$20
	TXA
	SEC
	SBC.b $24
	SEC
	SBC.b $26
	TAY
	SEP.b #$20
CODE_BB88A9:
	LDA.w $0000,y
	INY
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB88A9
	PLY
	JMP.w CODE_BB8692

CODE_BB88B9:
	LDA.b [$1C],y
	INY
	STA.b $2A
	STA.b $2E
	LDA.b [$2A]
	ADC.b #$03
	STA.b $24
	LDA.b [$2E]
	STA.b $26
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b [$2A]
	ORA.b $26
	STA.b $26
	PHY
	REP.b #$20
	TXA
	SEC
	SBC.b $24
	SEC
	SBC.b $26
	TAY
	SEP.b #$20
CODE_BB88E2:
	LDA.w $0000,y
	INY
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB88E2
	PLY
	JMP.w CODE_BB86AD

CODE_BB88F2:
	LDA.b $2E
	AND.b #$0F
	ADC.b #$03
	STA.b $24
	LDA.b [$1C],y
	INY
	XBA
	LDA.b [$1C],y
	INY
	STA.b $2E
	REP.b #$20
	LSR
	LSR
	LSR
	LSR
	CLC
	ADC.w #$0103
	STA.b $28
	PHY
	TXA
	SEC
	SBC.b $28
	TAY
	SEP.b #$20
CODE_BB8917:
	LDA.w $0000,y
	INY
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB8917
	PLY
	JMP.w CODE_BB86A0

CODE_BB8927:
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b [$2A]
	ADC.b #$03
	STA.b $24
	LDA.b $2A
	AND.b #$0F
	XBA
	LDA.b [$1C],y
	INY
	REP.b #$20
	ADC.w #$0103
	STA.b $28
	PHY
	TXA
	SEC
	SBC.b $28
	TAY
	SEP.b #$20
CODE_BB8949:
	LDA.w $0000,y
	INY
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB8949
	PLY
	JMP.w CODE_BB8692

CODE_BB8959:
	LDA.b $2E
	AND.b #$0F
	ADC.b #$03
	STA.b $24
	REP.b #$20
	LDA.b [$1C],y
	XBA
	STA.b $28
	INY
	INY
	PHY
	TXA
	SEC
	SBC.b $28
	TAY
	SEP.b #$20
CODE_BB8972:
	LDA.w $0000,y
	INY
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB8972
	PLY
	JMP.w CODE_BB8692

CODE_BB8982:
	LDA.b [$1C],y
	INY
	STA.b $2A
	LDA.b [$2A]
	ADC.b #$03
	STA.b $24
	LDA.b $2A
	XBA
	LDA.b [$1C],y
	INY
	REP.b #$20
	ASL
	ASL
	ASL
	ASL
	STA.b $28
	AND.w #$00FF
	SEP.b #$20
	LDA.b [$1C],y
	INY
	PHY
	STA.b $2A
	LDA.b [$2A]
	REP.b #$20
	AND.w #$000F
	ORA.b $28
	STA.b $28
	TXA
	SEC
	SBC.b $28
	TAY
	SEP.b #$20
CODE_BB89B8:
	LDA.w $0000,y
	INY
	STA.w $0000,x
	INX
	DEC.b $24
	BNE.b CODE_BB89B8
	PLY
	JMP.w CODE_BB86AD

CODE_BB89C8:
	DEX
	LDA.w $0000,x
	STA.w $0001,x
	INX
	INX
	JMP.w CODE_BB86A0

CODE_BB89D4:
	DEX
	LDA.w $0000,x
	STA.w $0001,x
	INX
	INX
	JMP.w CODE_BB8692

CODE_BB89E0:
	REP.b #$20
	DEX
	DEX
	LDA.w $0000,x
	STA.w $0002,x
	SEP.b #$20
	INX
	INX
	INX
	INX
	JMP.w CODE_BB86A0

CODE_BB89F3:
	REP.b #$20
	DEX
	DEX
	LDA.w $0000,x
	STA.w $0002,x
	SEP.b #$20
	INX
	INX
	INX
	INX
	JMP.w CODE_BB8692

CODE_BB8A06:
	PHY
	LDA.b $2E
	REP.b #$20
	AND.w #$000F
	ASL
	ADC.w #$0007
	TAY
	LDA.b [$1C],y
	STA.w $0000,x
	SEP.b #$20
	INX
	INX
	PLY
	JMP.w CODE_BB8692

CODE_BB8A20:
	LDA.b [$1C],y
	INY
	STA.b $2E
	REP.b #$20
	AND.w #$00F0
	LSR
	LSR
	LSR
	PHY
	ADC.w #$0007
	TAY
	LDA.b [$1C],y
	STA.w $0000,x
	SEP.b #$20
	INX
	INX
	PLY
	JMP.w CODE_BB86A0

CODE_BB8A3F:
	PHA
	PHX
	PHY
	LDY.w #$0100
	TDC
	TAX
	SEP.b #$20
CODE_BB8A49:
	STA.l $7E2100,x
	CLC
	ADC.b #$10
	AND.b #$F0
	INX
	DEY
	BNE.b CODE_BB8A49
	LDY.w #$0100
	LDX.w #$0000
CODE_BB8A5C:
	TXA
	LSR
	LSR
	LSR
	LSR
	STA.l $7E2000,x
	INX
	DEY
	BNE.b CODE_BB8A5C
	REP.b #$20
	PLY
	PLX
	PLA
	RTL

CODE_BB8A6F:
	JSR.w CODE_BB8A73
	RTL

CODE_BB8A73:
	STA.b $24
	STY.b $26
	LDY.w #$0000
	STZ.b $3E
	STZ.b $40
	LDA.b [$24]
	INY
	STA.b $28
	AND.w #$00E0
	XBA
	PHA
	LDA.b [$24],y
	TAY
	INC.b $24
	INC.b $24
	INC.b $24
	PLA
CODE_BB8A92:
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8A92
	LDA.b $28
	BIT.w #$0001
	BEQ.b CODE_BB8AA5
	JSR.w CODE_BB8ABF
CODE_BB8AA5:
	LDA.b $28
	BIT.w #$0002
	BEQ.b CODE_BB8AAF
	JSR.w CODE_BB8B4F
CODE_BB8AAF:
	LDA.b $28
	BIT.w #$0004
	BEQ.b CODE_BB8AB9
	JSR.w CODE_BB8B09
CODE_BB8AB9:
	JSR.w CODE_BB8B97
	JMP.w CODE_BB8BDD

CODE_BB8ABF:
	LDA.w #$0000
	PHA
CODE_BB8AC3:
	LDA.w #$0002
	JSR.w CODE_BB8C76
	BIT.w #$0002
	BEQ.b CODE_BB8AF4
	AND.w #$0001
	CLC
	ROR
	ROR
	ROR
	ROR
	STA.b $22
	LDA.w #$0006
	JSR.w CODE_BB8C76
	BEQ.b CODE_BB8B07
	TAY
	PLX
CODE_BB8AE2:
	LDA.l $7F0000,x
	ORA.b $22
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8AE2
	PHX
	BRA.b CODE_BB8AC3

CODE_BB8AF4:
	PLX
	CLC
	ROR
	ROR
	ROR
	ROR
	ORA.l $7F0000,x
	STA.l $7F0000,x
	INX
	INX
	PHX
	BRA.b CODE_BB8AC3

CODE_BB8B07:
	PLX
	RTS

CODE_BB8B09:
	LDA.w #$0000
	PHA
CODE_BB8B0D:
	LDA.w #$0002
	JSR.w CODE_BB8C76
	BIT.w #$0002
	BEQ.b CODE_BB8B3C
	AND.w #$0001
	CLC
	ROR
	ROR
	STA.b $22
	LDA.w #$0006
	JSR.w CODE_BB8C76
	BEQ.b CODE_BB8B4D
	TAY
	PLX
CODE_BB8B2A:
	LDA.l $7F0000,x
	ORA.b $22
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8B2A
	PHX
	BRA.b CODE_BB8B0D

CODE_BB8B3C:
	PLX
	CLC
	ROR
	ROR
	ORA.l $7F0000,x
	STA.l $7F0000,x
	INX
	INX
	PHX
	BRA.b CODE_BB8B0D

CODE_BB8B4D:
	PLX
	RTS

CODE_BB8B4F:
	LDA.w #$0000
	PHA
CODE_BB8B53:
	LDA.w #$0002
	JSR.w CODE_BB8C76
	BIT.w #$0002
	BEQ.b CODE_BB8B83
	AND.w #$0001
	CLC
	ROR
	ROR
	ROR
	STA.b $22
	LDA.w #$0006
	JSR.w CODE_BB8C76
	BEQ.b CODE_BB8B95
	TAY
	PLX
CODE_BB8B71:
	LDA.l $7F0000,x
	ORA.b $22
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8B71
	PHX
	BRA.b CODE_BB8B53

CODE_BB8B83:
	PLX
	CLC
	ROR
	ROR
	ROR
	ORA.l $7F0000,x
	STA.l $7F0000,x
	INX
	INX
	PHX
	BRA.b CODE_BB8B53

CODE_BB8B95:
	PLX
	RTS

CODE_BB8B97:
	LDA.w #$0000
	PHA
CODE_BB8B9B:
	LDA.w #$0004
	JSR.w CODE_BB8C76
	BIT.w #$0008
	BEQ.b CODE_BB8BCA
	AND.w #$0007
	XBA
	ASL
	ASL
	STA.b $22
	LDA.w #$0004
	JSR.w CODE_BB8C76
	BEQ.b CODE_BB8BDB
	TAY
	PLX
CODE_BB8BB8:
	LDA.l $7F0000,x
	ORA.b $22
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8BB8
	PHX
	BRA.b CODE_BB8B9B

CODE_BB8BCA:
	PLX
	XBA
	ASL
	ASL
	ORA.l $7F0000,x
	STA.l $7F0000,x
	INX
	INX
	PHX
	BRA.b CODE_BB8B9B

CODE_BB8BDB:
	PLX
	RTS

CODE_BB8BDD:
	LDA.w #$0000
	PHA
CODE_BB8BE1:
	LDA.w #$0004
	JSR.w CODE_BB8C76
	XBA
	STA.b $20
	LDA.w #$0008
	JSR.w CODE_BB8C76
	ORA.b $20
	BIT.w #$0C00
	BEQ.b CODE_BB8C65
	BIT.w #$0800
	BEQ.b CODE_BB8C43
	BIT.w #$0400
	BEQ.b CODE_BB8C22
	AND.w #$03FF
	STA.b $22
	LDA.w #$0004
	JSR.w CODE_BB8C76
	TAY
	PLX
CODE_BB8C0E:
	LDA.l $7F0000,x
	ORA.b $22
	DEC.b $22
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8C0E
	PHX
	BRA.b CODE_BB8BE1

CODE_BB8C22:
	AND.w #$03FF
	STA.b $22
	LDA.w #$0004
	JSR.w CODE_BB8C76
	TAY
	PLX
CODE_BB8C2F:
	LDA.l $7F0000,x
	ORA.b $22
	INC.b $22
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8C2F
	PHX
	BRA.b CODE_BB8BE1

CODE_BB8C43:
	AND.w #$03FF
	STA.b $22
	LDA.w #$0006
	JSR.w CODE_BB8C76
	BEQ.b CODE_BB8C74
	TAY
	PLX
CODE_BB8C52:
	LDA.l $7F0000,x
	ORA.b $22
	STA.l $7F0000,x
	INX
	INX
	DEY
	BNE.b CODE_BB8C52
	PHX
	JMP.w CODE_BB8BE1

CODE_BB8C65:
	PLX
	ORA.l $7F0000,x
	STA.l $7F0000,x
	INX
	INX
	PHX
	JMP.w CODE_BB8BE1

CODE_BB8C74:
	PLX
	RTS

CODE_BB8C76:
	STA.b $1C
	LDA.b $3E
	TAX
	AND.w #$0006
	CLC
	ADC.b $1C
	CLC
	ADC.w #CODE_BB8CA5
	STA.b $1E
	LDA.b $40
	LSR
	LSR
	CLC
	ADC.b $3E
	LSR
	LSR
	LSR
	TAY
	TXA
	CLC
	ADC.b $1C
	STA.b $3E
	LDA.b $40
	ADC.w #$0000
	STA.b $40
	LDA.b [$24],y
	XBA
	JMP.w ($001E)

CODE_BB8CA5:
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LSR
	LDX.b $1C
	AND.l DATA_BB8CBC-$02,x
	RTS

DATA_BB8CBC:
	dw $0003,$000F,$003F,$00FF

set_PPU_registers:
	PHB
	%pea_shift_dbr(DATA_FD294E)
	PLB
	PLB
	SEP #$20
	ASL
	TAY
	LDX.w DATA_FD294E,y
	TXY
.next_register:
	LDX.w DATA_FD294E,y
	BEQ.b .return
	INY
	INY
	STX $3A
	ASL $3B
	BCC.b .single_register
	LSR $3B
	LDX $3A
	LDA.w DATA_FD294E,y
	STA $00,x
	INX
	INY
.single_register:
	LDA.w DATA_FD294E,y
	STA $00,x
	INY
	BRA.b .next_register

.return:
	REP #$20
	PLB
	RTL

vram_payload_handler:
	PHB
	PEA.w DATA_FD1B03>>8
	PLB
	PLB
	ASL
	TAY
	LDX.w DATA_FD1B03,y
CODE_BB8D01:
	SEP.b #$20
	LDA.w DATA_FD1B03,x
	BEQ.b CODE_BB8D6F
	LDA.w DATA_FD1B03+$04,x
	BMI.b CODE_BB8D73
	LDA.w DATA_FD1B03,x
	ORA.b #$C0
	STA.b $44
	LDA.b #$7F0000>>16
	STA.l DMA[$00].SourceBank
	REP.b #$20
	LDA.w #$7F0000
	STA.l DMA[$00].SourceLo
	LDA.w DATA_FD1B03+$01,x
	STA.b $42
	LDA.w DATA_FD1B03+$03,x
	STA.l !REGISTER_VRAMAddressLo
	PHX
	LDA.w DATA_FD1B03+$05,x
	INC
	AND.w #$FFFE
	TAY
	TAX
CODE_BB8D39:
	LDA.b [$42],y
	STA.l $7F0000,x
	DEY
	DEY
	TYX
	BPL.b CODE_BB8D39
	PLX
	SEP.b #$20
CODE_BB8D47:
	LDA.w DATA_FD1B03+$05,x
	STA.l DMA[$00].SizeLo
	LDA.w DATA_FD1B03+$06,x
	STA.l DMA[$00].SizeHi
	LDA.b #!REGISTER_WriteToVRAMPortLo
	STA.l DMA[$00].Destination
	LDA.b #$01
	STA.l DMA[$00].Parameters
	STA.l !REGISTER_DMAEnable
	REP.b #$20
	TXA
	CLC
	ADC.w #$0007
	TAX
	BRA.b CODE_BB8D01

CODE_BB8D6F:
	REP.b #$20
	PLB
	RTL

CODE_BB8D73:
	REP.b #$20
	LDY.w DATA_FD1B03+$01,x
	LDA.w DATA_FD1B03,x
	AND.w #$00C0
	LSR
	LSR
	LSR
	LSR
	LSR
	PHX
	TAX
	JMP.w (DATA_BB8D88,x)

DATA_BB8D88:
	dw CODE_BB8D90
	dw CODE_BB8DCC
	dw CODE_BB8DE4
	dw CODE_BB8DE4

CODE_BB8D90:
	PLX
	LDA.w DATA_FD1B03,x
	ORA.w #$00C0
	AND.w #$00FF
	PHX
	TYX
	TAY
	PHB
	PHK
	PLB
	JSL.l CODE_BB862F
	PLB
	PLX
CODE_BB8DA6:
	SEP.b #$20
	LDA.w DATA_FD1B03+$03,x
	STA.l !REGISTER_VRAMAddressLo
	LDA.w DATA_FD1B03+$04,x
	AND.b #$7F0000>>16
	STA.l !REGISTER_VRAMAddressHi
	LDA.b #$7F0000>>16
	STA.l DMA[$00].SourceBank
	REP.b #$20
	LDA.w #$7F0000
	STA.l DMA[$00].SourceLo
	SEP.b #$20
	BRL.w CODE_BB8D47

CODE_BB8DCC:
	PLX
	PHX
	LDA.w DATA_FD1B03,x
	ORA.w #$00C0
	AND.w #$00FF
	TAY
	LDA.w DATA_FD1B03+$01,x
	LDX.w #$0000
	JSR.w CODE_BB8A73
	PLX
	BRA.b CODE_BB8DA6

CODE_BB8DE4:
	PLX
	JMP.w CODE_BB8D47

CODE_BB8DE8:
	STX.b $1A
	ASL
	TAX
	LDA.l DATA_FD54E9,x
	LDX.b $1A
	BRA.b CODE_BB8DFE

CODE_BB8DF4:
	STX.b $1A
	ASL
	TAX
	LDA.l DATA_FD3201,x
	LDX.b $1A
CODE_BB8DFE:
	PHA
	LDA.w $0775
	BIT.w #$4008
	BEQ.b CODE_BB8E14
	BIT.w #$4000
	BEQ.b CODE_BB8E11
	JSR.w CODE_BB8E38
	BRA.b CODE_BB8E14

CODE_BB8E11:
	JSR.w CODE_BB8E53
CODE_BB8E14:
	PLA
	STA.w DMA[$00].SourceLo
	TXA
	ASL
	ASL
	ASL
	STA.w DMA[$00].SizeLo
	LDA.w #(!REGISTER_WriteToCGRAMPort&$0000FF<<8)+$00
	STA.w DMA[$00].Parameters
	SEP.b #$20
	LDA.b #DATA_FD341B>>16
	STA.w DMA[$00].SourceBank
	TYA
	STA.w !REGISTER_CGRAMAddress
	LDA.b #$01
	STA.w !REGISTER_DMAEnable
	REP.b #$20
	RTL

CODE_BB8E38:
	LDA.b $03,S
	STA.b $1C
	LDA.w #$7E2D80
	STA.b $40
	TXA
	ASL
	ASL
	STA.b $1A
	PEA.w (($7E2D80&$FF0000)>>16)|(($8E0000&$FF0000)>>8)
	PLB
	PHX
	PHY
	JSR.w CODE_BB8E6E
	PLY
	PLX
	PLB
	RTS

CODE_BB8E53:
	LDA.b $03,S
	STA.b $20
	LDA.w #$7E2D80
	STA.b $2E
	TXA
	ASL
	ASL
	STA.b $30
	PEA.w (($7E2D80&$FF0000)>>16)|(($8E0000&$FF0000)>>8)
	PLB
	PHX
	PHY
	JSR.w CODE_BB8EAB
	PLY
	PLX
	PLB
	RTS

CODE_BB8E6E:
	LDX.b $1C
	LDA.l DATA_FD341B&$FF0000,x
	STA.b $3A
	AND.w #$001F
	STA.b $3C
	LDA.b $3A
	LSR
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	STA.b $3C
	LDA.b $3B
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	ASL
	TAX
	LDY.b $40
	LDA.l DATA_FD41C7,x
	STA.w $0000,y
	INC.b $40
	INC.b $40
	INC.b $1C
	INC.b $1C
	DEC.b $1A
	BNE.b CODE_BB8E6E
	RTS

CODE_BB8EAB:
	LDX.b $20
	LDA.l DATA_FD341B&$FF0000,x
	STA.l $000022
	STA.b $3A
	AND.w #$001F
	STA.b $3C
	LDA.b $3A
	LSR
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	STA.b $3C
	LDA.b $3B
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	ASL
	TAX
	LDA.l DATA_FD41D7,x
	STA.l $000024
	LDA.w #$0018
	STA.b $3E
	LDA.w #$0008
	STA.b $40
	JSR.w CODE_BBBD04
	LDY.b $2E
	STA.w $0000,y
	INC.b $2E
	INC.b $2E
	INC.b $20
	INC.b $20
	DEC.b $30
	BNE.b CODE_BB8EAB
	RTS

init_sprite_render_order:
	LDX #$0000
	LDA #aux_sprite_table
.next_slot:
	STA sprite_render_table,x
	CLC
	ADC #sizeof(sprite)
	INX
	INX
	CPX #$003A
	BNE.b .next_slot
	RTL

CODE_BB8F12:
	TYX
	LDA.l DATA_FF218C,x
	TAY
CODE_BB8F18:
	PHY
	JSR.w CODE_BB8F8B
	PLY
	BCS.b CODE_BB8F2B
	STZ.b $08,x
	LDA.w #$0005
	STA.b $0A,x
	STZ.b $26,x
	BRL.w CODE_BB8FE3

CODE_BB8F2B:
	RTL

CODE_BB8F2C:
	TYX
	LDA.l DATA_FF0040,x
	TAY
	BRA.b CODE_BB8F3A

CODE_BB8F34:
	TYX
	LDA.l DATA_FF218C,x
	TAY
CODE_BB8F3A:
	PHY
	JSR.w CODE_BB8F8B
	PLY
	BCS.b CODE_BB8F58
	STZ.b $08,x
	LDA.w #$0005
	STA.b $0A,x
	STZ.b $20,x
	STZ.b $24,x
	LDA.w #$C000
	STA.b $26,x
	STZ.b $1C,x
	STZ.b $1E,x
	BRL.w CODE_BB8FE3

CODE_BB8F58:
	RTL

CODE_BB8F59:
	TYX
	LDA.l DATA_FF0040,x
	TAY
	BRA.b CODE_BB8F67

CODE_BB8F61:
	TYX
	LDA.l DATA_FF218C,x
	TAY
CODE_BB8F67:
	PHY
	JSR.w CODE_BB8F78
	PLY
	BCS.b CODE_BB8F77
	STZ.b $08,x
	LDA.w #$0005
	STA.b $0A,x
	BRA.b CODE_BB8FE3

CODE_BB8F77:
	RTL

CODE_BB8F78:
	JSR.w CODE_BB8F8B
	BCS.b CODE_BB8F8A
	PHY
	JSR.w CODE_BB9507
	PLY
	BCS.b CODE_BB8F8A
	STZ.b $20,x
	STZ.b $26,x
	STZ.b $1C,x
CODE_BB8F8A:
	RTS

CODE_BB8F8B:
	LDX.w #!RAM_DKC3_Level_SpriteDataRAM
	CLC
CODE_BB8F8F:
	LDA.b DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,x
	BEQ.b CODE_BB8FA1
	TXA
	ADC.w #$006E
	TAX
	CPX.w #$1480
	BCC.b CODE_BB8F8F
	SEC
	LDX.w #aux_sprite_table
CODE_BB8FA1:
	STX.b $76
	RTS

CODE_BB8FA4:
	PHA
	TYX
	LDA.l DATA_FF218C,x
	TAY
	PLA
	BRA.b CODE_BB8FB7

CODE_BB8FAE:
	TYX
	LDA.l DATA_FF218C,x
	TAY
	LDA.w #$0002
CODE_BB8FB7:
	PHY
	JSR.w CODE_BB8FC8
	PLY
	BCS.b CODE_BB8FC7
	STZ.b $08,x
	LDA.w #$0005
	STA.b $0A,x
	BRA.b CODE_BB8FE3

CODE_BB8FC7:
	RTL

CODE_BB8FC8:
	PHA
	JSR.w CODE_BB8F8B
	PLA
	BCS.b CODE_BB8FDC
	PHY
	JSR.w CODE_BB9529
	PLY
	BCS.b CODE_BB8FDC
	STZ.b $20,x
	STZ.b $26,x
	STZ.b $1C,x
CODE_BB8FDC:
	RTS

CODE_BB8FDD:
	TYX
	LDA.l DATA_FF218C,x
	TAY
CODE_BB8FE3:
	LDX alternate_sprite
	STZ $28,x
	STZ $3A,x
	STZ $36,x
	STZ $06,x
	STZ $08,x
	STZ $3C,x
CODE_BB8FF1:
	PHB
	%pea_shift_dbr(DATA_FF218C)
	PLB
	PLB
	BRA parse_initscript_entry

parse_initscript:
	PHB
	BRA parse_initscript_entry

set_sprite_config:
	TCD
	LDA.w $0001,y
	STA $00,x
initscript_next:
	INY
	INY
	INY
parse_initscript_entry:
	LDA.w $0000,y
	AND #$00FF
	CMP #$00EF
	BCC set_sprite_config
	EOR #$00FF
	ASL
	TAX
	JMP (initscript_commands,x)

initscript_commands:								; Info: Sprite spawn script opcodes
	dw CODE_BB9062								; $FF - Spawn sprite?
	dw CODE_BB9071								; $FE - 
	dw CODE_BB9096								; $FD - 
	dw CODE_BB9119								; $FC - 
	dw CODE_BB9137								; $FB - 
	dw CODE_BB917E								; $FA - 
	dw CODE_BB91B4								; $F9 - 
	dw CODE_BB91C9								; $F8 - 
	dw CODE_BB91F4								; $F7 - Spawn semi-dynamic sprite?
	dw CODE_BB92C2								; $F6 - 
	dw CODE_BB9350								; $F5 - 
	dw CODE_BB936B								; $F4 - 
	dw CODE_BB9190								; $F3 - 
	dw CODE_BB90AB								; $F2 - 
	dw CODE_BB9452								; $F1 - 
	dw CODE_BB9048								; $F0 - 
	dw CODE_BB9041								; $EF - End of script

CODE_BB903A:
	PLB
	SEC
	LDA.w #$0000
	TCD
	RTL

CODE_BB9041:
	PLB
	CLC
	LDA.w #$0000
	TCD
	RTL

CODE_BB9048:
	PLB
	LDA.w #$0000
	TCD
	LDX.b $76
	LDA.b $0E,x
	AND.w #$FFBF
	STA.b $0E,x
	LDA.b $1E,x
	AND.w #$CFFF
	ORA.w #$2000
	STA.b $1E,x
	CLC
	RTL

CODE_BB9062:
	LDA.w #$0000
	TCD
	LDX.b $76
	LDA.w $0001,y
	JSR.w CODE_BBB884
	JMP.w initscript_next

CODE_BB9071:
	LDA.w #$0000
	TCD
	LDX.b $76
	LDA.w $0001,y
	EOR.b $1E,x
	AND.w #$F000
	EOR.b $1E,x
	STA.b $1E,x
	LDA.l $000775
	AND.w #$0002
	BEQ.b CODE_BB9093
	LDA.b $1E,x
	ORA.w #$3000
	STA.b $1E,x
CODE_BB9093:
	JMP.w initscript_next

CODE_BB9096:
	LDA.w #$0000
	TCD
	LDX.b $76
	LDA.w $0001,y
	EOR.b $1E,x
	AND.w #$F000
	EOR.b $1E,x
	STA.b $1E,x
	JMP.w initscript_next

CODE_BB90AB:
	LDA.w #$0000
	TCD
	LDX.b $76
	LDA.w $0001,y
	STA.b $0E,x
	JSR.w CODE_BB90BC
	JMP.w initscript_next

CODE_BB90BC:
	PHX
	PHY
	PHB
	PHK
	PLB
	LDY.b $76
	LDA.w $000E,y
	STA.b $1A
	TYA
	LDX.w #sprite_render_table
CODE_BB90CC:
	CMP.b $00,x
	BEQ.b CODE_BB90D4
	INX
	INX
	BRA.b CODE_BB90CC

CODE_BB90D4:
	LDA.b $1A
	CPX.w #sprite_render_table
	BEQ.b CODE_BB9101
	CPX.w #$155C
	BCS.b CODE_BB90E7
	LDY.b $02,x
	CMP.w $000E,y
	BCC.b CODE_BB9101
CODE_BB90E7:
	DEX
	DEX
	CPX.w #sprite_render_table
	BEQ.b CODE_BB90FD
	LDY.b $00,x
	CMP.w $000E,y
	BCC.b CODE_BB90FD
	STY.b $02,x
	LDY.b $76
	STY.b $00,x
	BRA.b CODE_BB90E7

CODE_BB90FD:
	PLB
	PLY
	PLX
	RTS

CODE_BB9101:
	LDY.b $02,x
	CMP.w $000E,y
	BCS.b CODE_BB90FD
	STY.b $00,x
	LDY.b $76
	STY.b $02,x
	INX
	INX
	CPX.w #$155C
	BCC.b CODE_BB9101
	PLB
	PLY
	PLX
	RTS

CODE_BB9119:
	LDA.w #$0000
	TCD
	LDA.w $0001,y
	PHB
	PHK
	PLB
	PHY
	JSR.w request_palette_direct
	PLY
	LDX.b $76
	EOR.b $1E,x
	AND.w #$0E00
	EOR.b $1E,x
	STA.b $1E,x
	PLB
	JMP.w initscript_next

CODE_BB9137:
	LDA.w #$0000
	TCD
	LDA.w $0001,y
	JSR.w CODE_BB9148
	JMP.w initscript_next

CODE_BB9144:
	JSR.w CODE_BB9148
	RTL

CODE_BB9148:
	PHB
	PHK
	PLB
	PHA
	XBA
	AND.w #$00FF
	PHY
	JSR.w request_palette_direct
	PLY
	LDX.b $76
	AND.w #$0E00
	ORA.w #$8002
	STA.b $42
	EOR.b $26,x
	AND.w #$4000
	EOR.b $42
	STA.b $26,x
	PLA
	AND.w #$00FF
	PHY
	JSR.w request_palette_direct
	PLY
	LDX.b $76
	EOR.b $1E,x
	AND.w #$0E00
	EOR.b $1E,x
	STA.b $1E,x
	PLB
	RTS

CODE_BB917E:
	LDA.w #$0000
	TCD
	LDA.w $0001,y
	PHY
	JSL.l CODE_B9A003
	PLY
	LDX.b $76
	JMP.w initscript_next

CODE_BB9190:
	LDA.w #$0000
	TCD
	LDA.w $0001,y
	AND.w #$00FF
	ASL
	TAX
	LDA.w $0002,y
	AND.w #$00FF
	STA.b $42
	ASL
	ASL
	ADC.b $42
	CLC
	ADC.l DATA_B9B6E7,x
	LDX.b $76
	STA.b $24,x
	JMP.w initscript_next

CODE_BB91B4:
	LDA.w #$0000
	TCD
	PHY
	LDA.w $0001,y
	TAY
	LDX.b $76
	JSL.l parse_initscript
	PLY
	LDX.b $76
	JMP.w initscript_next

CODE_BB91C9:
	LDA.w #$0000
	TCD
	PHY
	LDA.w $0001,y
	TAX
	LDA.w $0003,y
	AND.b $00,x
	CMP.w #$0001
	LDA.w $0005,y
	BCC.b CODE_BB91E2
	LDA.w $0007,y
CODE_BB91E2:
	TAY
	LDX.b $76
	JSL.l parse_initscript
	PLA
	CLC
	ADC.w #$0009
	TAY
	LDX.b $76
	JMP.w parse_initscript_entry

CODE_BB91F4:
	LDA.w #$0000
	TCD
	LDA.w $0001,y
	STA.b $1E
	LDA.w $0003,y
	STA.b $20
	LDA.w $0005,y
	AND.w #$00FF
	ASL
	ASL
	TAX
	LDA.l DATA_C00000,x
	STA.b $1A
	LDA.l DATA_C00000+$02,x
	STA.b $1C
	XBA
	AND.w #$00FF
	CLC
	ADC.w #$001F
	LSR
	LSR
	LSR
	LSR
	LSR
	STA.b $24
	PHB
	PHB
	PLA
	STA.b $22
	PHK
	PLB
	PHY
	LDA.b $20
	JSR.w request_palette_direct
	PLY
	BCS.b CODE_BB9299
	LDX.b $76
	EOR.b $1E,x
	AND.w #$0E00
	EOR.b $1E,x
	STA.b $1E,x
	LDX.w #!RAM_DKC3_Level_SpriteDataRAM
CODE_BB9244:
	LDA.b $1E
	CMP.b DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,x
	BEQ.b CODE_BB929C
	TXA
	CLC
	ADC.w #$006E
	TAX
	CPX.w #$1480
	BNE.b CODE_BB9244
	LDX.b $76
	PHY
	LDA.b $24
	JSR.w CODE_BB9529
	PLY
	BCS.b CODE_BB9288
	LDX.b $76
	LDA.b $1E,x
	AND.w #$01FF
	JSL.l CODE_B78009
	BCC.b CODE_BB92A9
	LDA.w $155E
	SEC
	SBC.w #$0008
	STA.w $155E
	TAX
	STZ.w $1568,x
	LDA.b $24
	DEC
	BEQ.b CODE_BB9285
	JSR.w CODE_BB9596
	BRA.b CODE_BB9288

CODE_BB9285:
	JSR.w CODE_BB9577
CODE_BB9288:
	LDX.b $76
	LDA.b $1E,x
	JSR.w CODE_BB9726
	BCS.b CODE_BB9299
	LDA.b $E8
	DEC
	AND.w #$000F
	STA.b $E8
CODE_BB9299:
	JMP.w CODE_BB903A

CODE_BB929C:
	LDA.b $1E,x
	LDX.b $76
	EOR.b $1E,x
	AND.w #$F1FF
	EOR.b $1E,x
	STA.b $1E,x
CODE_BB92A9:
	LDA.b $1E
	JSR.w CODE_BBB884
	STZ.b $20,x
	STZ.b $26,x
	STZ.b $1C,x
	LDA.b $22
	PHA
	PLB
	PLB
	TYA
	CLC
	ADC.w #$0006
	TAY
	JMP.w parse_initscript_entry

CODE_BB92C2:
	LDA.w #$0000
	TCD
	LDA.w $0001,y
	AND.w #$00FF
	CMP.w #$0080
	BCC.b CODE_BB92D4
	ORA.w #$FF00
CODE_BB92D4:
	LDX.b $70
	BIT.b $1E,x
	BVC.b CODE_BB92DE
	EOR.w #$FFFF
	INC
CODE_BB92DE:
	CLC
	ADC.b $12,x
	LDX.b $76
	STA.b $12,x
	LDA.w $0002,y
	AND.w #$00FF
	CMP.w #$0080
	BCC.b CODE_BB92F3
	ORA.w #$FF00
CODE_BB92F3:
	LDX.b $70
	BIT.b $1E,x
	BPL.b CODE_BB92FD
	EOR.w #$FFFF
	INC
CODE_BB92FD:
	CLC
	ADC.b $16,x
	LDX.b $76
	STA.b $16,x
	PHB
	PHK
	PLB
	PHY
	LDY.b $70
	LDX.b $76
	LDA.w $000E,y
	INC
	STA.b $0E,x
	LDA.w $0026,y
	AND.w #$800F
	CMP.w #$8002
	BNE.b CODE_BB932D
	LDA.w $0026,y
	AND.w #$C000
	CMP.w #$C000
	BEQ.b CODE_BB9330
	LDA.w #$0000
	BRA.b CODE_BB9330

CODE_BB932D:
	LDA.w $0026,y
CODE_BB9330:
	STA.b $26,x
	LDA.w $0010,y
	STA.b $10,x
	LDA.w $0014,y
	STA.b $14,x
	LDA.w $001E,y
	EOR.b $1E,x
	AND.w #$F000
	EOR.b $1E,x
	STA.b $1E,x
	JSR.w CODE_BB90BC
	PLY
	PLB
	JMP.w initscript_next

CODE_BB9350:
	LDA.w #$0000
	TCD
	LDX.b $76
	LDA.l $001867
	STA.b $12,x
	LDA.l $001869
	STA.b $16,x
	LDA.w #$00F8
	STA.b $0E,x
	INY
	JMP.w parse_initscript_entry

CODE_BB936B:
	LDA.w #$0000
	TCD
	LDX.b $76
	STZ.b $4C,x
	STZ.b $4A,x
	STZ.b $38,x
	STZ.b $6C,x
	STZ.b $5A,x
	STZ.b $58,x
	PHY
	LDA.w $0001,y
	TAY
	JSL.l parse_initscript
	PLY
	LDX.b $76
	LDA.w $0003,y
	AND.w #$00FF
	ORA.b $06,x
	STA.b $06,x
	AND.w #$0004
	BEQ.b CODE_BB939D
	LDA.w #$C000
	STA.b $26,x
CODE_BB939D:
	LDA.w $0003,y
	AND.w #$0F00
	ASL
	ASL
	ASL
	ASL
	STA.b $48,x
	LDA.w $0004,y
	AND.w #$00F0
	ORA.b $48,x
	XBA
	STA.b $46,x
	STA.b $6A,x
	LDA.w $0004,y
	AND.w #$FF00
	JSR.w CODE_BB9441
	STA.b $44,x
	LDA.w $0006,y
	AND.w #$00FF
	ASL
	ASL
	ASL
	EOR.w #$FFFF
	STA.b $5C,x
	LDA.w $0007,y
	AND.w #$00FF
	ASL
	ASL
	ASL
	STA.b $5E,x
	LDA.b $06,x
	AND.w #$0080
	BNE.b CODE_BB93FE
	LDA.b $5C,x
	SEC
	ADC.b $12,x
	STA.b $5C,x
	LDA.b $5E,x
	CLC
	ADC.b $12,x
	STA.b $5E,x
	LDA.w $0007,y
	AND.w #$FF00
	JSR.w CODE_BB9441
	STA.b $30,x
	STZ.b $2A,x
	BRA.b CODE_BB9419

CODE_BB93FE:
	LDA.b $5C,x
	SEC
	ADC.b $16,x
	STA.b $5C,x
	LDA.b $5E,x
	CLC
	ADC.b $16,x
	STA.b $5E,x
	LDA.w $0007,y
	AND.w #$FF00
	JSR.w CODE_BB9441
	STA.b $34,x
	STZ.b $2E,x
CODE_BB9419:
	LDA.w $0008,y
	AND.w #$FF00
	LSR
	LSR
	LSR
	LSR
	STA.b $36,x
	LDA.w $000A,y
	AND.w #$00FF
	STA.b $18,x
	LDA.w $000B,y
	AND.w #$00FF
	CLC
	ADC.b $18,x
	STA.b $1A,x
	TYA
	CLC
	ADC.w #$000C
	TAY
	JMP.w parse_initscript_entry

CODE_BB9441:
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	CMP.w #$8000
	ROR
	RTS

CODE_BB9452:
	LDA.w #$0000
	TCD
	LDA.w $0002,y
	LDX.b $70
	BIT.b $1E,x
	BVC.b CODE_BB9463
	EOR.w #$FFFF
	INC
CODE_BB9463:
	LDX.b $76
	PHA
	LDA.w $0001,y
	AND.w #$00FF
	TCD
	PLA
	STA.b $00,x
	INY
	JMP.w initscript_next

CODE_BB9474:
	LDA.b $70
	PHA
	STX.b $70
	JSL.l CODE_BB9482
	PLA
	STA.b $70
	TAX
	RTL

CODE_BB9482:
	LDX.b $70
	LDA.b DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,x
	BEQ.b CODE_BB949B
	CMP.w #$0210
	BCC.b CODE_BB949C
CODE_BB948D:
	LDX.b $70
	JSR.w CODE_BB9726
	LDX.b $70
	JSR.w CODE_BB9577
CODE_BB9497:
	LDX.b $70
	STZ.b DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,x
CODE_BB949B:
	RTL

CODE_BB949C:
	CMP.w #$0128
	BCS.b CODE_BB9497
	CMP.w #$00F0
	BCC.b CODE_BB94B2
CODE_BB94A6:
	LDX.b $70
	JSR.w CODE_BB9726
	LDX.b $70
	JSR.w CODE_BB9596
	BRA.b CODE_BB9497

CODE_BB94B2:
	STA.b $1A
	LDX.w #!RAM_DKC3_Level_SpriteDataRAM
CODE_BB94B7:
	LDA.b $1A
	CMP.b DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,x
	BEQ.b CODE_BB94D1
CODE_BB94BD:
	TXA
	CLC
	ADC.w #$006E
	TAX
	CPX.w #$1480
	BNE.b CODE_BB94B7
	LDA.b $1A
	CMP.w #$00D0
	BCS.b CODE_BB94A6
	BRA.b CODE_BB948D

CODE_BB94D1:
	CPX.b $70
	BEQ.b CODE_BB94BD
	LDA.b $1E,x
	AND.w #$01E0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA.w $06DA,y
	CMP.w $06D8,y
	BNE.b CODE_BB94F7
	LDA.w $06DC,y
	CMP.w $06D8,y
	BNE.b CODE_BB94F3
	TXA
	STA.w $06DC,y
CODE_BB94F3:
	TXA
	STA.w $06DA,y
CODE_BB94F7:
	TXA
	STA.w $06D8,y
	LDX.b $70
	JSR.w CODE_BB9726
	BRL.w CODE_BB9497

CODE_BB9503:
	JSR.w CODE_BB9507
	RTL

CODE_BB9507:
	LDY.w #$001A
CODE_BB950A:
	LDA.w $06D8,y
	BEQ.b CODE_BB9515
	DEY
	DEY
	BPL.b CODE_BB950A
	SEC
	RTS

CODE_BB9515:
	TXA
	STA.w $06D8,y
	TYA
	ASL
	ASL
	ASL
	ASL
	EOR.b $1E,x
	AND.w #$01FF
	EOR.b $1E,x
	STA.b $1E,x
	CLC
	RTS

CODE_BB9529:
	STA.b $3A
	STA.b $3C
	ASL
	CLC
	ADC.w #$FFFE
	STA.b $3E
	LDY.w #$0018
CODE_BB9537:
	LDA.w $06D8,y
	BEQ.b CODE_BB954F
CODE_BB953C:
	DEY
	DEY
	CPY.b $3E
	BPL.b CODE_BB9537
	SEC
	RTS

CODE_BB9544:
	LDA.b $3C
	STA.b $3A
	BRA.b CODE_BB953C

CODE_BB954A:
	LDA.w $06D8,y
	BNE.b CODE_BB9544
CODE_BB954F:
	DEC.b $3A
	BEQ.b CODE_BB9557
	DEY
	DEY
	BRA.b CODE_BB954A

CODE_BB9557:
	TYA
	ASL
	ASL
	ASL
	ASL
	EOR.b $1E,x
	AND.w #$01FF
	EOR.b $1E,x
	STA.b $1E,x
	BRA.b CODE_BB9569

CODE_BB9567:
	INY
	INY
CODE_BB9569:
	TXA
	STA.w $06D8,y
	DEC.b $3C
	BNE.b CODE_BB9567
	CLC
	RTS

CODE_BB9573:
	JSR.w CODE_BB9577
	RTL

CODE_BB9577:
	LDA.b $1E,x
	AND.w #$01E0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA.w #$0000
	STA.w $06D8,y
	RTS

CODE_BB9588:
	LDA.w #$0000
	STA.w $06D8,y
	STA.w $06DA,y
	RTS

CODE_BB9592:
	JSR.w CODE_BB9596
	RTL

CODE_BB9596:
	LDA.b $1E,x
	AND.w #$01E0
	LSR
	LSR
	LSR
	LSR
	TAY
	LDA.w $06D8,y
	CMP.w $06DA,y
	BNE.b CODE_BB95BD
	CMP.w $06DC,y
	BNE.b CODE_BB95B3
	LDA.w #$0000
	STA.w $06DC,y
CODE_BB95B3:
	LDA.w #$0000
	STA.w $06DA,y
	STA.w $06D8,y
	RTS

CODE_BB95BD:
	LDA.w #$0000
	STA.w $06D8,y
	RTS

request_palette_direct_global:
	JSR.w request_palette_direct
	RTL

request_palette_direct:
	STA.w $04EF
	LDX.w #$0000
CODE_BB95CE:
	LDA.w $073C,x
	BEQ.b CODE_BB95F5
	CMP.w $04EF
	BEQ.b CODE_BB9606
	INX
	INX
	CPX.w #$0010
	BNE.b CODE_BB95CE
	LDA.w #$0020
	JSL.l throw_exception_wrapper
	LDA.w $04EF
	STA.w $1D4B
	LDX.w #$0000
	INC.w $074C,x
	TXA
	SEC
	RTS

CODE_BB95F5:
	STX.b $3E
CODE_BB95F7:
	INX
	INX
	CPX.w #$0010
	BCS.b CODE_BB960D
	LDA.w $073C,x
	CMP.w $04EF
	BNE.b CODE_BB95F7
CODE_BB9606:
	INC.w $074C,x
	TXA
	XBA
	CLC
	RTS

CODE_BB960D:
	PHY
	JSR.w CODE_BB9644
	PLY
	LDA.b $E8
	ASL
	ASL
	TAX
	LDA.w $04F1
	STA.w $06FC,x
	LDA.b $3E
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0081
	XBA
	ORA.w $04F3
	STA.w $06FE,x
	LDA.b $E8
	INC
	AND.w #$000F
	STA.b $E8
	LDX.b $3E
	INC.w $074C,x
	LDA.w $04EF
	STA.w $073C,x
	CLC
	TXA
	XBA
	RTS

CODE_BB9644:
	LDA.w $0775
	AND.w #$8000
	BNE.b CODE_BB9667
	LDA.w $04EF
	ASL
	TAX
	LDA.l DATA_FD3201,x
	STA.w $04F1
	LDA.w #DATA_FD341B>>16
	STA.w $04F3
	LDA.w $04EF
	CMP.w #$000B
	BCC.b CODE_BB968A
	RTS

CODE_BB9667:
	LDA.w $04EF
	ASL
	TAX
	LDA.l DATA_FD3201,x
	SEC
	SBC.w #DATA_FD341B
	CLC
	ADC.w #$7E3180
	STA.w $04F1
	LDA.w #$7E3180>>16
	STA.w $04F3
	LDA.w $04EF
	CMP.w #$000B
	BCC.b CODE_BB968A
	RTS

CODE_BB968A:
	LDY.w #$0000
	LDA.w $04C4
	CMP.w #$0002
	BNE.b CODE_BB969F
	LDA.w $04C6
	BEQ.b CODE_BB96AA
	LDY.w #$003C
	BRA.b CODE_BB96AA

CODE_BB969F:
	LDA.w $053B
	BIT.w #$0040
	BEQ.b CODE_BB96AA
	LDY.w #$003C
CODE_BB96AA:
	STY.b $40
	LDA.w $04EF
	CMP.w #$0003
	BCC.b CODE_BB96CD
	CMP.w #$0005
	BCC.b CODE_BB96C3
	LDA.b $40
	LSR
	ADC.w $04F1
	STA.w $04F1
	RTS

CODE_BB96C3:
	LDA.b $40
	CLC
	ADC.w $04F1
	STA.w $04F1
	RTS

CODE_BB96CD:
	CMP.w #$0001
	BEQ.b CODE_BB96ED
	LDA.w $05B5
	BNE.b CODE_BB96F2
CODE_BB96D7:
	LDA.w $195A
	AND.w #$0007
	BNE.b CODE_BB9712
	LDA.w #$001E
	CLC
	ADC.w $04F1
	CLC
	ADC.b $40
	STA.w $04F1
	RTS

CODE_BB96ED:
	LDA.w $05B5
	BNE.b CODE_BB96D7
CODE_BB96F2:
	LDA.w $1958
	BMI.b CODE_BB9707
	XBA
	AND.w #$0007
	BNE.b CODE_BB9712
CODE_BB96FD:
	LDA.w $04F1
	CLC
	ADC.b $40
	STA.w $04F1
	RTS

CODE_BB9707:
	LDA.w $04F1
	CLC
	ADC.w #$0078
	STA.w $04F1
	RTS

CODE_BB9712:
	CMP.w #$0002
	BEQ.b CODE_BB96FD
	LDA.w $04F1
	CLC
	ADC.w #$0096
	STA.w $04F1
	RTS

CODE_BB9722:
	JSR.w CODE_BB9726
	RTL

CODE_BB9726:
	LDA.b $26,x
	BPL.b CODE_BB9747
	AND.w #$800F
	CMP.w #$8002
	BNE.b CODE_BB9747
	PHX
	LDA.b $27,x
	AND.w #$000E
	TAX
	DEC.w $074C,x
	BMI.b CODE_BB9740
	BNE.b CODE_BB9746
CODE_BB9740:
	STZ.w $074C,x
	STZ.w $073C,x
CODE_BB9746:
	PLX
CODE_BB9747:
	LDA.b $1E,x
	XBA
	AND.w #$000E
	TAX
	DEC.w $074C,x
	BMI.b CODE_BB9757
	BEQ.b CODE_BB9757
	SEC
	RTS

CODE_BB9757:
	STZ.w $073C,x
	STZ.w $074C,x
	CLC
	RTS

CODE_BB975F:
	LDY.w $04FD
	LDA.w $001E,y
	XBA
	AND.w #$000E
	TAX
	LDA.w $073C,x
	TYX
	JML.l CODE_BB9785

CODE_BB9772:
	JSL.l CODE_BB975F
CODE_BB9776:
	LDY.w $04F9
	LDA.w $001E,y
	XBA
	AND.w #$000E
	TAX
	LDA.w $073C,x
	TYX
CODE_BB9785:
	TXY
	PHA
	LDA.b $1E,x
	XBA
	AND.w #$000E
	TAX
	LDA.w $073C,x
	CMP.w #$38CB
	BNE.b CODE_BB979B
	DEC.w $074C,x
	BRA.b CODE_BB979F

CODE_BB979B:
	TYX
	JSR.w CODE_BB9747
CODE_BB979F:
	PLA
	JSR.w request_palette_direct
	TYX
	EOR.b $1E,x
	AND.w #$0E00
	EOR.b $1E,x
	STA.b $1E,x
	RTL

CODE_BB97AE:
	LDX.w #$075C
CODE_BB97B1:
	STA.b $1C
	XBA
	AND.w #$00FF
	STA.b $1A
	LDA.b $1C
	AND.w #$00FF
	ASL
	TAY
	PHB
	PEA.w DATA_FD0000>>8
	PLB
	PLB
	LDA.w DATA_FD0000,y
	TAY
	LDA.w DATA_FD0400&$FF0000,y
	INY
	INY
	STA.b $00,x
	CMP.w #$0000
	BNE.b CODE_BB9810
	PLB
	SEC
	RTL

CODE_BB97D9:
	LDA.l $0005E5
	CMP.w #$0008
	BNE.b CODE_BB980D
	LDA.l $0005FD
	AND.w #$0100
	BEQ.b CODE_BB980D
	LDA.l $0005E7
	SEC
	SBC.w #$0003
	CMP.w #$0006
	BCS.b CODE_BB980D
	TXY
	TAX
	LDA.l DATA_FD54E3,x
	AND.w #$00FF
	STA.l $001B57
	TYX
	LDA.b $19,x
	ORA.w #$8000
	STA.b $19,x
CODE_BB980D:
	PLB
	CLC
	RTL

CODE_BB9810:
	CMP.w #$0002
	BNE.b CODE_BB9838
	LDA.w $0000,y
	INY
	INY
	STA.b $02,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $09,x
	LDA.l $00053B
	AND.w #$0001
	BEQ.b CODE_BB9841
	LDA.w #$002A
	CLC
	ADC.b $09,x
	STA.b $09,x
	BRA.b CODE_BB9841

CODE_BB9838:
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $09,x
CODE_BB9841:
	LDA.w $0000,y
	INY
	INY
	STA.b $1E
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $20
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.l $001B57
	SEP.b #$20
	LDA.w $0000,y
	INY
	STA.b $33,x
	REP.b #$20
	LDA.w $0000,y
	INY
	INY
	STA.b $34,x
	SEP.b #$20
	LDA.w $0000,y
	INY
	STA.b $04,x
	REP.b #$20
	LDA.w $0000,y
	INY
	INY
	STA.b $37,x
	LDA.w $0000,y
	INY
	INY
	STA.b $1B,x
	STY.b $1D,x
	STZ.b $27,x
	BRA.b CODE_BB9893

CODE_BB988B:
	INC.b $27,x
	TYA
	CLC
	ADC.w #$0005
	TAY
CODE_BB9893:
	LDA.w $0005,y
	AND.w #$00FF
	CMP.w #$00FF
	BEQ.b CODE_BB98A2
	DEC.b $1A
	BPL.b CODE_BB988B
CODE_BB98A2:
	PHY
	LDA.b $20
	AND.w #$00FF
	STA.b $13,x
	LDY.b $1E
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $05,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $07,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $0D,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $0B,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $25,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $23,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $15,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $17,x
	LDA.w $0000,y
	INY
	AND.w #$00FF
	STA.b $11,x
	LDA.w $0000,y
	INY
	INY
	STA.b $19,x
	PLY
	SEP.b #$20
	LDA.w $0000,y
	STA.b $36,x
	REP.b #$20
	LDA.w $0001,y
	STA.b $1F,x
	LDA.w $0003,y
	STA.b $21,x
	BRA.b CODE_BB991C

CODE_BB991A:
	INC.b $27,x
CODE_BB991C:
	TYA
	CLC
	ADC.w #$0005
	TAY
	LDA.w $0000,y
	AND.w #$00FF
	CMP.w #$00FF
	BNE.b CODE_BB991A
	INY
	JSR.w CODE_BB9934
	BRL.w CODE_BB97D9

CODE_BB9934:
	STZ.b $29,x
	STZ.b $2B,x
	STZ.b $2D,x
	STZ.b $2F,x
	STZ.b $31,x
	LDA.b $00,x
	CMP.w #$0001
	BNE.b CODE_BB9956
	PHX
	BRA.b CODE_BB994E

CODE_BB9948:
	INY
	INY
	STA.b $29,x
	INX
	INX
CODE_BB994E:
	LDA.w $0000,y
	BPL.b CODE_BB9948
	INY
	INY
	PLX
CODE_BB9956:
	RTS

CODE_BB9957:
	JSL.l disable_screen
	JSL.l CODE_808009
	JSL.l CODE_80801B
	JSL.l CODE_80800C
	STZ.b $00
	LDX.w #$7EA15A
	LDY.w #$7EA15A>>16
	LDA.w #$0660
	JSL.l CODE_808030
	JSL.l CODE_B2802A
	LDA.w $05AF
	AND.w #$D080
	STA.w $05AF
	LDA.w #$0006
	TRB.w $05B1
	LDA.w #$FFFF
	STA.w $06F4
	STA.w $06F6
	LDA.w #$FFF9
	STA.b $AA
	LDA.w #$0005
	STA.b $AC
	LDA.w #CODE_BB9A86
	STA.w $18B1
	LDA.w #CODE_BB9A86>>16
	STA.w $18B3
	BIT.w $05AF
	BPL.b CODE_BB99B6
	STZ.w $18CB
	LDA.w #$0005
	STA.w $05D5
CODE_BB99B6:
	JSR.w CODE_BB9AD3
	LDA.w $05B7
	XBA
	ORA.b !RAM_DKC3_Global_CurrentLevelLo
	JSL.l CODE_BB97AE
	LDA.w $076D
	JSL.l CODE_B7B000
	JSR.w CODE_BBA3D6
	JSL.l CODE_B38000
	JSL.l CODE_B7E49C
	LDA.w $075C
	CMP.w #$0001
	BEQ.b CODE_BB99E2
	CMP.w #$0003
	BNE.b CODE_BB99FA
CODE_BB99E2:
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	STA.w $05B9
	LDA.w $05B7
	BNE.b CODE_BB99FA
	LDA.w $053B
	AND.w #$8000
	BEQ.b CODE_BB99FA
	LDA.w #$4000
	TSB.w $05AF
CODE_BB99FA:
	JSL.l CODE_BBBC73
	LDA.w #$000F
	JSL.l request_palette_direct_global
	ORA.w #$3000
	CLC
	ADC.w #$01E0
	STA.b $B4
	AND.w #$0E00
	ORA.w #$01E0
	STA.b $B6
	JSR.w CODE_BB9A87
	LDA.w $05D5
	STA.w $18D1
	STZ.w $18D3
	LDA.w $075C
	CMP.w #$0001
	BEQ.b CODE_BB9A2F
	CMP.w #$0003
	BNE.b CODE_BB9A38
CODE_BB9A2F:
	LDA.w #$0078
	STA.w $18D5
	STA.w $18CF
CODE_BB9A38:
	JSL.l init_sprite_render_order
	LDA.w $05B5
	JSL.l CODE_B8805A
	LDA.w $0767
	ASL
	TAX
	JSR.w (DATA_BB9B60,x)
	JSL.l CODE_B7B006
	LDA.w $0760
	BIT.w #$0080
	BEQ.b CODE_BB9A5F
	AND.w #$007F
	ASL
	TAX
	JSR.w (DATA_BB9C06,x)
CODE_BB9A5F:
	JSL.l CODE_B38003
	JSL.l CODE_B38006
	JSR.w CODE_BB9BE6
	LDA.w $0760
	BIT.w #$0080
	BNE.b CODE_BB9A7A
	AND.w #$00FF
	ASL
	TAX
	JSR.w (DATA_BB9C06,x)
CODE_BB9A7A:
	LDA.w $0775
	AND.w #$0800
	STA.b $F8
	JSL.l CODE_80808A
CODE_BB9A86:
	RTL

CODE_BB9A87:
	LDA.w $075C
	CMP.w #$0002
	BNE.b CODE_BB9AC4
	LDA.w $075E
	AND.w #$0007
	CMP.w #$0003
	BCC.b CODE_BB9AC4
	BNE.b CODE_BB9AA9
	LDA.w $053B
	AND.w #$0001
	BEQ.b CODE_BB9AC4
	LDY.w #$0037
	BRA.b CODE_BB9AB7

CODE_BB9AA9:
	LDY.w #$0024
	LDA.w $053B
	AND.w #$0001
	BEQ.b CODE_BB9AB7
	LDY.w #$0036
CODE_BB9AB7:
	TYA
	JSL.l request_palette_direct_global
	AND.w #$0E00
	ORA.w #$01E0
	BRA.b CODE_BB9AC6

CODE_BB9AC4:
	LDA.b $B6
CODE_BB9AC6:
	STA.w $18F7
	STA.w $18F9
	STA.w $18FB
	STA.w $18FD
	RTS

CODE_BB9AD3:
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	CMP.w $05BD
	BNE.b CODE_BB9B05
	LDA.w $05B7
	BNE.b CODE_BB9B05
	LDA.w $05BB
	STA.w $05B7
	LDA.w $05BD
	STA.b !RAM_DKC3_Global_CurrentLevelLo
	LDA.w $05C1
	STA.b $7E
	STZ.b $7C
	STZ.b $7A
	LDA.w $05C3
	STA.w $05D7
	LDA.w $05C6
	STA.w $0536
	LDA.w $05C5
	STA.w $0535
CODE_BB9B05:
	RTS

CODE_BB9B06:
	LDA.w #$0100
	STA.w $18E5
	LDA.w #$0001
	STA.w $05B7
	STA.w $0533
	STA.w $05BB
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	STA.w $05BD
	LDA.w $05B9
	STA.w $05BF
	STZ.w $05C1
	LDA.b $7C
	BNE.b CODE_BB9B2F
	LDA.b $7E
	STA.w $05C1
CODE_BB9B2F:
	LDA.w $05D7
	STA.w $05C3
	LDA.w $0536
	STA.w $05C6
	LDA.w $0535
	STA.w $05C5
	RTL

disable_screen:
	SEP #$20
	LDA #$00
	STA.l !REGISTER_HDMAEnable
	LDA #$01
	STA.l !REGISTER_IRQNMIAndJoypadEnableFlags
	LDA #$8F
	STA.l !REGISTER_ScreenDisplayRegister
	REP #$20
	LDA #$0000
	STA.l $0004E4
	RTL

DATA_BB9B60:
	dw CODE_BB9B72
	dw CODE_BB9B73
	dw CODE_BB9B78
	dw CODE_BB9B7D
	dw CODE_BB9B8A
	dw CODE_BB9BA6
	dw CODE_BB9BB2
	dw CODE_BB9BCE
	dw CODE_BB9BDA

CODE_BB9B72:
	RTS

CODE_BB9B73:
	JSL.l CODE_B8805D
	RTS

CODE_BB9B78:
	JSL.l CODE_808057
	RTS

CODE_BB9B7D:
	LDY.w #$031C
	JSL.l CODE_BB8F34
	LDY.b $76
	STY.w $04F9
	RTS

CODE_BB9B8A:
	LDY.w #$0336
	LDA.w #$0005
	JSL.l CODE_BB8FA4
	LDA.b $76
	STA.w $1C4D
	LDY.w #$0332
	JSL.l CODE_BB8F61
	LDX.b $76
	STX.w $04F9
	RTS

CODE_BB9BA6:
	LDA.w #$0234
	STA.b $7E
	STZ.b $7C
	JSL.l CODE_B8805D
	RTS

CODE_BB9BB2:
	JSL.l CODE_B8805D
	LDY.w $04F9
	LDA.w #$0008
CODE_BB9BBC:
	CLC
	ADC.w $05B7
	STA.w $005C,y
	LDA.w #$0075
	STA.w $0038,y
	JSL.l CODE_BBB9B0
	RTS

CODE_BB9BCE:
	JSL.l CODE_B8805D
	LDY.w $04F9
	LDA.w #$000B
	BRA.b CODE_BB9BBC

CODE_BB9BDA:
	JSL.l CODE_B8805D
	LDY.w $04F9
	LDA.w #$000D
	BRA.b CODE_BB9BBC

CODE_BB9BE6:
	LDA.w $0777
	BIT.w #$0002
	BEQ.b CODE_BB9C05
	LDX.w #$0008
	LDY.w #$0004
	BIT.w #$0008
	BNE.b CODE_BB9BFF
	LDX.w #$0001
	LDY.w #$000E
CODE_BB9BFF:
	STX.w $0519
	STY.w $051B
CODE_BB9C05:
	RTS

DATA_BB9C06:
	dw CODE_BB9C32
	dw CODE_BB9C3A
	dw CODE_BB9C58
	dw CODE_BB9C61
	dw CODE_BB9C75
	dw CODE_BB9CD7
	dw CODE_BB9CED
	dw CODE_BB9D44
	dw CODE_BB9D6A
	dw CODE_BB9D78
	dw CODE_BB9D92
	dw CODE_BB9E7C
	dw CODE_BB9E84
	dw CODE_BB9CBE
	dw CODE_BB9E8D
	dw CODE_BB9EA5
	dw CODE_BB9EBD
	dw CODE_BB9ECE
	dw CODE_BB9EDC
	dw CODE_BB9EF0
	dw CODE_BB9F01
	dw CODE_BB9F15

CODE_BB9C32:
	JSR.w CODE_BBA0D1
	JSL.l CODE_BBA19F
	RTS

CODE_BB9C3A:
	LDA.w #$0003
	LDY.w $054B
	BNE.b CODE_BB9C49
	DEC
	LDY.w $05B5
	BNE.b CODE_BB9C49
	DEC
CODE_BB9C49:
	JSL.l CODE_BBBAAE
	JSR.w CODE_BBA0D1
	LDA.w #$057C
	JSL.l CODE_B28018
	RTS

CODE_BB9C58:
	LDA.w #$0004
	JSL.l CODE_BBBAAE
	BRA.b CODE_BB9C32

CODE_BB9C61:
	LDA.w $05B7
	LSR
	BNE.b CODE_BB9C70
	LDA.w #$FFFF
	STA.w $04C2
	LDA.w #$0000
CODE_BB9C70:
	STA.w $054F
	BRA.b CODE_BB9C32

CODE_BB9C75:
	LDA.w #CODE_BB9FAF
	STA.w $18B1
	LDA.w #CODE_BB9FAF>>16
	STA.w $18B3
	LDX.w $0793
	LDA.l DATA_FD16C1,x
	STA.w $18AD
	STA.b $42
	LDA.w #DATA_FD16CF>>16
	STA.w $18AF
	STA.b $44
	LDY.w #$0000
	TYX
CODE_BB9C99:
	LDA.b [$42],y
	BMI.b CODE_BB9CB1
	STA.w $18B7,x
	INY
	INY
	INY
	INY
	LDA.b [$42],y
	STA.w $18C1,x
	INY
	INY
	INY
	INY
	INX
	INX
	BRA.b CODE_BB9C99

CODE_BB9CB1:
	STA.w $18B7,x
	STA.w $18C1,x
	INX
	INX
	CPX.w #$000A
	BCC.b CODE_BB9CB1
CODE_BB9CBE:
	LDX.w $0793
	LDA.l DATA_FF5F52,x
	BEQ.b CODE_BB9CD4
	LDY.w #$0070
	JSL.l CODE_BB8F34
	LDY.b $76
	JSL.l CODE_BBB9B0
CODE_BB9CD4:
	BRL.w CODE_BB9C32

CODE_BB9CD7:
	LDA.w #CODE_BB9F88
	STA.w $18B1
	LDA.w #CODE_BB9F88>>16
	STA.w $18B3
	LDY.w #$0382
	JSL.l CODE_BB8F34
	BRL.w CODE_BB9C32

CODE_BB9CED:
	LDA.w #$FFFF
	STA.w $06D8
	STZ.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_BB9CF9:
	LDA.l DATA_FC3720,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$01E0
	BCC.b CODE_BB9CF9
	LDY.w #$028A
	JSL.l CODE_BB8F34
	STZ.w $0533
	LDA.w $05B7
	BEQ.b CODE_BB9D27
	DEC
	BEQ.b CODE_BB9D2D
	LDA.w $0539
	STA.w $0536
	LDA.w $0538
	STA.w $0535
	BRA.b CODE_BB9D33

CODE_BB9D27:
	STZ.w $0535
	STZ.w $0536
CODE_BB9D2D:
	LDA.w #$0100
	STA.w $18E5
CODE_BB9D33:
	LDA.w $05B7
	CMP.w #$0004
	BNE.b CODE_BB9D41
	LDA.w #$0959
	STA.w $0536
CODE_BB9D41:
	BRL.w CODE_BB9C32

CODE_BB9D44:
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	LDY.w #$005A
	CMP.w #!Define_DKC3_LevelID_RipsawRage_Main
	BEQ.b CODE_BB9D59
	LDY.w #$005C
	CMP.w #!Define_DKC3_LevelID_RipsawRage_Bonus1
	BEQ.b CODE_BB9D59
	LDY.w #$005E
CODE_BB9D59:
	JSL.l CODE_BB8F34
	LDY.b $76
	JSL.l CODE_BBB9B0
	JSL.l CODE_B3800C
	BRL.w CODE_BB9EDC

CODE_BB9D6A:
	LDA.w $05B7
	CMP.w #$0002
	BCS.b CODE_BB9D75
	STZ.w $054F
CODE_BB9D75:
	JMP.w CODE_BB9C32

CODE_BB9D78:
	LDA.w #$0400
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
CODE_BB9D81:
	LDA.l DATA_FC3020,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	CPX.w #$0800
	BCC.b CODE_BB9D81
	BRL.w CODE_BB9C32

CODE_BB9D92:
	LDA.w $0793
	AND.w #$00FF
	ASL
	ADC.w #$002A
	TAY
	JSL.l CODE_BB8F34
	LDX.b $76
	JSL.l CODE_BB9503
	LDA.w #$001C
	JSL.l request_palette_direct_global
	LDX.b $76
	EOR.b $1E,x
	AND.w #$0E00
	EOR.b $1E,x
	STA.b $1E,x
	JSR.w CODE_BB9E2C
	LDX.w $04F9
	LDA.b $12,x
	SEC
	SBC.w #$0080
	STA.w $196D
	LDX.b $76
	LDA.b $4E,x
	STA.b $1A
	LDA.w #DATA_FF2BE5>>16
	STA.b $1C
	LDA.w $05B7
	ASL
	TAY
	LDA.b [$1A],y
	SEC
	SBC.w #$00E0
	STA.w $189F
	STZ.w $18A1
	STA.w $1973
	LDY.b $76
	JSL.l CODE_BBB9B0
	LDY.b $76
	LDA.w $189F
	SEC
	SBC.w $0016,y
	CLC
	ADC.w #$0100
	CMP.w $005E,y
	BCS.b CODE_BB9E02
	STA.w $005E,y
CODE_BB9E02:
	LDA.w #$003C
	STA.w $0064,y
	LDA.w #$0020
	TSB.w $05AF
	LDA.w #$2000
	TSB.w $0474
	LDA.w #$7C00
	STA.w $04A6
	STA.w $04A8
	STZ.w $04AA
	STZ.w $04AE
	LDA.w #$AC00
	STA.w $04AC
	BRL.w CODE_BB9C32

CODE_BB9E2C:
	AND.w #$01E0
	ASL
	ASL
	ASL
	ASL
	STA.b $42
	STA.w !REGISTER_VRAMAddressLo
	LDX.w #$0000
	LDY.w #$0030
	JSR.w CODE_BB9E6F
	LDY.w #$0010
	JSR.w CODE_BB9E68
	LDY.w #$0010
	JSR.w CODE_BB9E6F
	LDA.b $42
	CLC
	ADC.w #$0100
	STA.w !REGISTER_VRAMAddressLo
	LDY.w #$0020
	JSR.w CODE_BB9E6F
	LDX.w #$0040
	LDY.w #$0010
	JSR.w CODE_BB9E6F
	LDY.w #$0010
CODE_BB9E68:
	STZ.w !REGISTER_WriteToVRAMPortLo
	DEY
	BNE.b CODE_BB9E68
	RTS

CODE_BB9E6F:
	LDA.l DATA_C079A6,x
	STA.w !REGISTER_WriteToVRAMPortLo
	INX
	INX
	DEY
	BNE.b CODE_BB9E6F
	RTS

CODE_BB9E7C:
	LDA.w #$0004
	STA.b $AC
	JMP.w CODE_BB9C32

CODE_BB9E84:
	LDA.w #$0004
	STA.w $051F
	JMP.w CODE_BB9C32

CODE_BB9E8D:
	LDY.w #$0304
	JSL.l CODE_BB8F34
	LDY.w $04F9
	LDX.b $76
	LDA.w $0012,y
	CLC
	ADC.w #$0380
	STA.b $12,x
	JMP.w CODE_BB9C32

CODE_BB9EA5:
	LDY.w #$031E
	JSL.l CODE_BB8F34
	LDY.w $04F9
	LDX.b $76
	LDA.w $0012,y
	CLC
	ADC.w #$0100
	STA.b $12,x
	JMP.w CODE_BB9C32

CODE_BB9EBD:
	LDA.w $05B7
	CMP.w #$0002
	BCS.b CODE_BB9ECB
	STZ.w $054F
	STZ.w $0551
CODE_BB9ECB:
	JMP.w CODE_BB9C32

CODE_BB9ECE:
	LDA.w $05B7
	CMP.w #$0002
	BCS.b CODE_BB9ED9
	STZ.w $054F
CODE_BB9ED9:
	JMP.w CODE_BB9C32

CODE_BB9EDC:
	LDA.w #$0004
	STA.b $AC
	LDA.w #CODE_BB9F1F
	STA.w $18B1
	LDA.w #CODE_BB9F1F>>16
	STA.w $18B3
	JMP.w CODE_BB9C32

CODE_BB9EF0:
	LDA.w #$000B
	JSL.l CODE_BBBAAE
	LDY.w #$01BC
	JSL.l CODE_BB8F12
	JMP.w CODE_BB9C32

CODE_BB9F01:
	LDA.w #$000B
	JSL.l CODE_BBBAAE
	LDA.w #$0003
	LDY.w #$01BE
	JSL.l CODE_BB8FA4
	JMP.w CODE_BB9C32

CODE_BB9F15:
	LDY.w #$01CE
	JSL.l CODE_BB8F12
	JMP.w CODE_BB9C32

CODE_BB9F1F:
	LDY.w #DATA_BB9F68
	LDA.w $05B9
	CMP.w #$0031
	BNE.b CODE_BB9F3F
	LDY.w #DATA_BB9F72
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	CMP.w #!Define_DKC3_LevelID_SwoopySalvo_Main
	BEQ.b CODE_BB9F3F
	LDY.w #DATA_BB9F7C
	CMP.w #$0097
	BEQ.b CODE_BB9F3F
	LDY.w #DATA_BB9F82
CODE_BB9F3F:
	PHK
	PLB
	LDX.b $70
	LDA.b $12,x
CODE_BB9F45:
	CMP.w $0000,y
	BCC.b CODE_BB9F60
	CMP.w $0002,y
	BCC.b CODE_BB9F55
	INY
	INY
	INY
	INY
	BRA.b CODE_BB9F45

CODE_BB9F55:
	LDA.b $1E,x
	AND.w #$CFFF
	ORA.w #$2000
	STA.b $1E,x
	RTL

CODE_BB9F60:
	LDA.b $1E,x
	ORA.w #$3000
	STA.b $1E,x
	RTL

DATA_BB9F68:
	dw $0150,$0230,$02D0,$03B0,$FFFF

DATA_BB9F72:
	dw $0170,$0250,$0310,$03F0,$FFFF

DATA_BB9F7C:
	dw $0150,$01F0,$FFFF

DATA_BB9F82:
	dw $0130,$01F0,$FFFF

CODE_BB9F88:
	LDX.w $04F9
	JSR.w CODE_BB9F95
	LDX.w $04FD
	JSR.w CODE_BB9F95
	RTL

CODE_BB9F95:
	LDA.w #$02B8
	CMP.b $16,x
	BCS.b CODE_BB9FA4
	LDA.b $1E,x
	ORA.w #$3000
	STA.b $1E,x
	RTS

CODE_BB9FA4:
	LDA.b $1E,x
	AND.w #$CFFF
	ORA.w #$2000
	STA.b $1E,x
	RTS

CODE_BB9FAF:
	LDX.b $70
	BIT.w $18B5
	BVS.b CODE_BB9FEB
	BPL.b CODE_BB9FC7
	JSL.l CODE_B9E027
	CMP.w #$7F00
	BEQ.b CODE_BB9FCE
	CMP.b $16,x
	BCS.b CODE_BB9FDF
	BRA.b CODE_BB9FFA

CODE_BB9FC7:
	LDA.b $1A,x
	CMP.w #$8050
	BNE.b CODE_BB9FD6
CODE_BB9FCE:
	LDA.w #$0050
	CLC
	ADC.b $16,x
	BRA.b CODE_BB9FDF

CODE_BB9FD6:
	BCS.b CODE_BB9FFA
	CMP.w #$4000
	BEQ.b CODE_BB9FFA
	LDA.b $18,x
CODE_BB9FDF:
	SEC
	SBC.w #$0020
	STA.b $3E
	CLC
	ADC.w #$00A0
	STA.b $40
CODE_BB9FEB:
	LDA.w $18AD
	STA.b $42
	LDA.w $18AF
	STA.b $44
	LDY.w #$0000
	BRA.b CODE_BBA000

CODE_BB9FFA:
	BRA.b CODE_BBA079

CODE_BB9FFC:
	INY
	INY
	INY
	INY
CODE_BBA000:
	LDA.b [$42],y
	BMI.b CODE_BBA079
	CMP.b $12,x
	BCC.b CODE_BBA011
	SBC.w #$0048
	CMP.b $12,x
	BCS.b CODE_BBA079
	BRA.b CODE_BBA022

CODE_BBA011:
	INY
	INY
	INY
	INY
	LDA.b [$42],y
	CMP.b $12,x
	BCS.b CODE_BBA079
	ADC.w #$0048
	CMP.b $12,x
	BCC.b CODE_BB9FFC
CODE_BBA022:
	STA.b $1A
	LDA.b [$42],y
	STA.b $1C
	BIT.w $18B5
	BVS.b CODE_BBA046
	INY
	INY
	LDA.b [$42],y
	STA.b $42
	LDY.w #$0000
CODE_BBA036:
	LDA.b [$42],y
	BEQ.b CODE_BBA079
	CMP.b $3E
	BCC.b CODE_BBA079
	CMP.b $40
	BCC.b CODE_BBA046
	INY
	INY
	BRA.b CODE_BBA036

CODE_BBA046:
	LDA.b $1A
	CLC
	ADC.b $1C
	LSR
	CMP.b $12,x
	ROR.b $3A
	LDA.b $1C
	SEC
	SBC.b $1A
	EOR.b $3A
	BPL.b CODE_BBA068
	LDA.b $1E,x
	ORA.w #$3000
	STA.b $1E,x
	LDA.b $0E,x
	ORA.w #$0040
	STA.b $0E,x
	RTL

CODE_BBA068:
	LDA.b $1E,x
	AND.w #$CFFF
	ORA.w #$2000
	STA.b $1E,x
	LDA.b $0E,x
	AND.w #$FFBF
	STA.b $0E,x
CODE_BBA079:
	LDA.w $18B5
	AND.w #$2000
	BNE.b CODE_BBA0D0
	LDA.b $1E,x
	AND.w #$3000
	CMP.w #$3000
	BEQ.b CODE_BBA0D0
	LDA.b $1A,x
	CMP.w #$4000
	BCC.b CODE_BBA0D0
	CPX.w $186B
	BEQ.b CODE_BBA0D0
	LDA.b $54,x
	LDY.w #$FFFE
CODE_BBA09C:
	INY
	INY
	CMP.w $18C1,y
	BCS.b CODE_BBA09C
	CMP.w $18B7,y
	BCC.b CODE_BBA0D0
	LDA.w $18C1,y
	SBC.w #$0024
	CMP.b $12,x
	BCS.b CODE_BBA0B9
	CMP.b $54,x
	BCS.b CODE_BBA0CC
	DEC.b $12,x
	RTL

CODE_BBA0B9:
	LDA.w $18B7,y
	ADC.w #$0023
	CMP.b $12,x
	BCC.b CODE_BBA0D0
	CMP.b $54,x
	BCC.b CODE_BBA0CC
	BEQ.b CODE_BBA0CC
	INC.b $12,x
	RTL

CODE_BBA0CC:
	STA.b $12,x
	STZ.b $2A,x
CODE_BBA0D0:
	RTL

CODE_BBA0D1:
	LDX.w #$FFFD
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	BEQ.b CODE_BBA121
	SEP.b #$20
	DEC
CODE_BBA0DB:
	INX
	INX
	INX
	CMP.l DATA_BBB7BC,x
	BCS.b CODE_BBA0DB
	EOR.b #$FF
	ADC.l DATA_BBB7BC,x
	REP.b #$20
	BNE.b CODE_BBA121
	LDA.l DATA_BBB7BC+$02,x
	AND.w #$00FF
	STA.w $0505
	LDA.l DATA_BBB7BC+$01,x
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_BBB831,x
	STA.w $0513
	LDA.w $0505
	ASL
	TAX
	LDA.l DATA_BBB7B2,x
	STA.w $0515
	JMP.w (DATA_BBA117,x)

DATA_BBA117:
	dw CODE_BBA12E
	dw CODE_BBA12E
	dw CODE_BBA12E
	dw CODE_BBA12E
	dw CODE_BBA13E

CODE_BBA121:
	LDA.w #$8000
	STA.w $050F
	STZ.w $050B
	STZ.w $050D
	RTS

CODE_BBA12E:
	LDA.w $0513
	STA.w $050F
	JSR.w CODE_BBA154
	STZ.w $0507
	STZ.w $050D
	RTS

CODE_BBA13E:
	LDA.w $0513
	STA.w $050F
	JSR.w CODE_BBA154
	LDA.w #$FF80
	STA.w $0507
	LDA.w #$FFFE
	STA.w $0509
	RTS

CODE_BBA154:
	LDX.w #$7E9882
	LDY.w #$7E9882>>16
	LDA.w #$0050
	JSL.l CODE_808030
	STZ.w $18AB
	LDX.w #$188D
	JSR.w CODE_BB9507
	LDA.w #$00E0
	STA.w DMA[$00].SizeLo
	LDA.w $18AB
	ASL
	ASL
	ASL
	ASL
	STA.l !REGISTER_VRAMAddressLo
	LDA.l DATA_C00000+$04
	STA.l DMA[$00].SourceLo
	SEP.b #$20
	LDA.l DATA_C00000+$06
	STA.l DMA[$00].SourceBank
	LDA.b #!REGISTER_WriteToVRAMPortLo
	STA.w DMA[$00].Destination
	LDA.b #$01
	STA.l DMA[$00].Parameters
	STA.l !REGISTER_DMAEnable
	REP.b #$20
	RTS

CODE_BBA19F:
	LDA.w $05AF
	AND.w #$8000
	STA.w $044A
	BPL.b CODE_BBA1AB
	RTL

CODE_BBA1AB:
	LDA.w $075C
	CMP.w #$0002
	BEQ.b CODE_BBA1F1
	CMP.w #$0006
	BEQ.b CODE_BBA1F2
	CMP.w #$0001
	BNE.b CODE_BBA1EC
	LDA.w $0765
	AND.w #$003F
	CMP.w $044C
	STA.w $044C
	BEQ.b CODE_BBA1D0
	LDA.w #$0000
	BRA.b CODE_BBA1E4

CODE_BBA1D0:
	LDA.w $05B7
	BEQ.b CODE_BBA1E4
	LDA.w $044E
	CLC
	ADC.w #$0040
	CMP.w #$0100
	BCC.b CODE_BBA1E4
	LDA.w #$0040
CODE_BBA1E4:
	STA.w $044E
	ORA.w $044C
	BRA.b CODE_BBA1F3

CODE_BBA1EC:
	LDA.w $0765
	BRA.b CODE_BBA1F3

CODE_BBA1F1:
	RTL

CODE_BBA1F2:
	RTL

CODE_BBA1F3:
	STA.b $3E
	AND.w #$00FF
	ASL
	ASL
	SEP.b #$20
	LDA.b $3E
	AND.b #$3F
	CMP.b $08
	REP.b #$20
	BEQ.b CODE_BBA20B
	JSL.l CODE_B2800C
	RTL

CODE_BBA20B:
	XBA
	JSL.l CODE_B2800F
	RTL

CODE_BBA211:
	PHK
	PLB
	BIT.w $05AF
	BPL.b CODE_BBA222
	LDA.w #CODE_80803F
	LDX.w #CODE_80803F>>16
	JML.l CODE_808003

CODE_BBA222:
	LDA.w $05B7
	XBA
	ORA.b !RAM_DKC3_Global_CurrentLevelLo
	JSL.l CODE_BB97AE
	LDA.w $195B
	INC
	BEQ.b CODE_BBA26D
	INC
	BEQ.b CODE_BBA250
	LDA.w $075C
	AND.w #$0007
	ASL
	TAX
	JMP.w (DATA_BBA240,x)

DATA_BBA240:
	dw CODE_BBA2C8
	dw CODE_BBA2C8
	dw CODE_BBA36C
	dw CODE_BBA2C8
	dw CODE_BBA2C8
	dw CODE_BBA2C8
	dw CODE_BBA36C
	dw CODE_BBA2C8

CODE_BBA250:
	STZ.w $05B7
	STZ.w $05D7
	STZ.b $7E
	STZ.b $7C
	STZ.b $7A
	LDA.w #CODE_808362
	STA.b $4A
	STA.b $4C
	LDA.w #CODE_B48009
	LDX.w #CODE_B48009>>16
	JML.l CODE_808003

CODE_BBA26D:
	STZ.w $05B7
	STZ.w $05D7
	LDA.w $05D5
	BPL.b CODE_BBA299
	LDX.w #$000C
CODE_BBA27B:
	STZ.w $05BB,x
	DEX
	DEX
	BPL.b CODE_BBA27B
	LDA.w #$0006
	STA.w $05E3
	LDA.w #CODE_808362
	STA.b $4A
	STA.b $4C
	LDA.w #CODE_B48000
	LDX.w #CODE_B48000>>16
	JML.l CODE_808003

CODE_BBA299:
	LDA.w $04C4
	BEQ.b CODE_BBA2B1
	CMP.w #$0001
	BNE.b CODE_BBA2AB
	EOR.w $05B5
	STA.w $05B5
	BRA.b CODE_BBA2B1

CODE_BBA2AB:
	LDA.w #$2000
	TSB.w $05FB
CODE_BBA2B1:
	STZ.b $7E
	STZ.b $7C
	STZ.b $7A
	LDA.w #CODE_808362
	STA.b $4A
	STA.b $4C
	LDA.w #CODE_B48009
	LDX.w #CODE_B48009>>16
	JML.l CODE_808003

CODE_BBA2C8:
	LDA.w $195B
	BEQ.b CODE_BBA32A
	LDA.w $0536
	STA.w $0539
	LDA.w $0535
	STA.w $0538
	JSR.w CODE_BBAD9E
	LDA.w $195B
	STA.w $04EA
	DEC
	ASL
	TAX
	LDA.w $0786,x
	AND.w #$00FF
	STA.w $04E8
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	STA.w $04E6
	LDA.w $0785,x
	AND.w #$00FF
	STA.b !RAM_DKC3_Global_CurrentLevelLo
	STZ.w $05B7
	LDA.w $195B
	CMP.w #$0004
	BCC.b CODE_BBA320
	CMP.w #$0080
	BCC.b CODE_BBA316
	AND.w #$007F
	STA.w $05B7
	LDA.w $04E6
	STA.b !RAM_DKC3_Global_CurrentLevelLo
CODE_BBA316:
	LDA.w #CODE_808493
	LDX.w #CODE_808493>>16
	JML.l CODE_808003

CODE_BBA320:
	LDA.w #CODE_B29578
	LDX.w #CODE_B29578>>16
	JML.l CODE_808003

CODE_BBA32A:
	STZ.w $05D7
	STZ.w $05B7
	STZ.w $05BB
	STZ.w $05BD
	STZ.w $05BF
	STZ.w $05C1
	STZ.w $05C3
	STZ.w $05C5
	STZ.w $05C7
	STZ.b $7E
	STZ.b $80
	STZ.b $7A
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	CMP.w #!Define_DKC3_LevelID_KastleKAOS
	BEQ.b CODE_BBA3A3
	LDA.w $05E7
	ORA.w #$8000
	STA.w $05E7
	LDA.w #CODE_808362
	STA.b $4A
	STA.b $4C
	LDA.w #CODE_B48009
	LDX.w #CODE_B48009>>16
	JML.l CODE_808003

CODE_BBA36C:
	LDA.w $04EA
	CMP.w #$0005
	BEQ.b CODE_BBA32A
	LDA.w #$0080
	TSB.w $05AF
	LDA.w $18F1
	BPL.b CODE_BBA38B
	AND.w #$7FFF
	STA.w $05D3
	STA.w $18CB
	STA.w $18CD
CODE_BBA38B:
	LDA.w $04E6
	STA.b !RAM_DKC3_Global_CurrentLevelLo
	LDA.w $04E8
	STA.w $05B7
	STZ.w $04EA
	LDA.w #CODE_808493
	LDX.w #CODE_808493>>16
	JML.l CODE_808003

CODE_BBA3A3:
	LDA.w #$0002
	TSB.w $0655
	LDA.w #$4000
	TSB.w $061D
	PHP
	JSL.l CODE_80802A
	LDY.w #CODE_808051
	LDX.w #CODE_808051>>16
	PLP
	BNE.b CODE_BBA3CB
	LDA.w $04C4
	CMP.w #$0002
	BNE.b CODE_BBA3CB
	LDY.w #CODE_808084
	LDX.w #CODE_808084>>16
CODE_BBA3CB:
	STY.b $4E
	STX.b $50
	LDA.w #CODE_808348
	JML.l CODE_80803C

CODE_BBA3D6:
	JSL.l CODE_B38009
	LDX.w #$7F9FFE
	LDA.w #$0000
CODE_BBA3E0:
	STA.l $7F0000,x
	DEX
	DEX
	BNE.b CODE_BBA3E0
	STA.l $7F0000,x
	LDX.w #$017E
	LDA.w #$0000
CODE_BBA3F2:
	STA.w $15FE,x
	DEX
	DEX
	BPL.b CODE_BBA3F2
	LDX.w #$01FE
	LDA.w #$0000
CODE_BBA3FF:
	STA.l $7E6580,x
	DEX
	DEX
	BPL.b CODE_BBA3FF
	LDA.w #$0004
	STA.l $7F0000
	LDA.w #$0001
	STA.l $00177E
	PHB
	PEA.w (DATA_FE0000&$FF0000)>>8
	PLB
	PLB
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	ASL
	TAY
	LDA.w DATA_FE0000,y
	BEQ.b CODE_BBA477
	TAY
	BRA.b CODE_BBA467

CODE_BBA427:
	AND.w #$00F0
	STA.b $1A
	LDA.w (DATA_FE0400&$FF0000)+$02,y
	SEC
	SBC.w #$0100
	STA.l $0015EE
	LDA.w (DATA_FE0400&$FF0000)+$04,y
	SEC
	SBC.w #$0100
	STA.l $0015F4
	PHB
	PHY
	JSR.w CODE_BBA47A
	PLY
	PLB
	LDA.w DATA_FE0400&$FF0000,y
	AND.w #$1F00
	BEQ.b CODE_BBA458
	PHB
	PHY
	JSR.w CODE_BBA581
	PLY
	PLB
CODE_BBA458:
	LDA.l $00177E
	INC
	STA.l $00177E
	TYA
	CLC
	ADC.w #$0008
	TAY
CODE_BBA467:
	LDA.w DATA_FE0400&$FF0000,y
	AND.w #$00FF
	BNE.b CODE_BBA427
	JSR.w CODE_BBA604
	JSR.w CODE_BBA59B
	PLB
	RTS

CODE_BBA477:
	PLB
	RTS

CODE_BBA479:
	RTS

CODE_BBA47A:
	PEA.w DATA_BBA8BE>>8
	PLB
	PLB
	LDX.b $1A
	STZ.w $15F0
	LDA.w $15EE
	SEC
	SBC.w #$0100
	SEC
	SBC.l DATA_BBA8BE,x
	BPL.b CODE_BBA495
	LDA.w #$0000
CODE_BBA495:
	STA.b $1E
	AND.w #$FF00
	XBA
	CMP.w $15FA
	BCS.b CODE_BBA479
	STA.w $15F0
	LDA.b $1E
	CLC
	ADC.l DATA_BBA8BE+$02,x
	AND.w #$FF00
	XBA
	CMP.w $15FA
	BCC.b CODE_BBA4B7
	LDA.w $15FA
	DEC
CODE_BBA4B7:
	STA.w $15F2
	STZ.w $15F6
	LDA.w $15F4
	SEC
	SBC.w #$00E0
	SEC
	SBC.l DATA_BBA8BE+$04,x
	BPL.b CODE_BBA4CE
	LDA.w #$0000
CODE_BBA4CE:
	STA.b $1E
	AND.w #$FF00
	XBA
	CMP.w $15FC
	BCS.b CODE_BBA479
	STA.w $15F6
	LDA.b $1E
	CLC
	ADC.l DATA_BBA8BE+$06
	AND.w #$FF00
	XBA
	CMP.w $15FC
	BCC.b CODE_BBA4F0
	LDA.w $15FC
	DEC
CODE_BBA4F0:
	STA.w $15F8
	LDA.w $15F0
	STA.w $15EE
	LDA.w $15F6
	STA.w $15F4
	BRA.b CODE_BBA50F

CODE_BBA501:
	INC.w $15F4
	LDA.w $15F0
	STA.w $15EE
	BRA.b CODE_BBA50F

CODE_BBA50C:
	INC.w $15EE
CODE_BBA50F:
	JSR.w CODE_BBA523
	LDA.w $15EE
	CMP.w $15F2
	BNE.b CODE_BBA50C
	LDA.w $15F4
	CMP.w $15F8
	BNE.b CODE_BBA501
	RTS

CODE_BBA523:
	LDA.w $15F4
	XBA
	ORA.w $15FA
	STA.w !REGISTER_Multiplicand
	LDA.w !REGISTER_ProductOrRemainderLo
	LDA.w !REGISTER_ProductOrRemainderLo
	LDA.w !REGISTER_ProductOrRemainderLo
	CLC
	ADC.w $15EE
	ASL
	TAX
	LDA.w $15FE,x
	BEQ.b CODE_BBA560
CODE_BBA541:
	TAX
	LDA.l $7F0000,x
	BNE.b CODE_BBA541
	LDA.l $7F0000
	STA.l $7F0000,x
	CLC
	ADC.w #$0004
	STA.l $7F0000
	LDA.w $177E
	STA.l $7F0002,x
	RTS

CODE_BBA560:
	LDA.l $7F0000
	STA.w $15FE,x
	TAX
	LDA.w $177E
	STA.l $7F0002,x
	TXA
	CLC
	ADC.w #$0004
	STA.l $7F0000,x
	CLC
	ADC.w #$0004
	STA.l $7F0000
	RTS

CODE_BBA581:
	XBA
	DEC
	ASL
	ASL
	ASL
	ASL
	TAX
	BRA.b CODE_BBA58C

CODE_BBA58A:
	INX
	INX
CODE_BBA58C:
	LDA.l $7E6580,x
	BNE.b CODE_BBA58A
	LDA.l $00177E
	STA.l $7E6580,x
	RTS

CODE_BBA59B:
	PHB
	PEA.w $7E4180>>8
	PLB
	PLB
	LDA.l $7E4180
	CLC
	ADC.w #$4180
	STA.l $001780
	STA.b $1A
	CLC
	ADC.w #$0040
	STA.b $1C
	LDX.w #$0000
CODE_BBA5B8:
	PHX
	TXA
	ASL
	ASL
	ASL
	ASL
	TAX
	LDA.l $7E6580,x
	BNE.b CODE_BBA5E1
	LDA.w #$0000
	STA.b ($1A)
CODE_BBA5CA:
	INC.b $1A
	INC.b $1A
	PLX
	INX
	CPX.w #$0020
	BNE.b CODE_BBA5B8
	LDA.b $1C
	SEC
	SBC.w #$4180
	STA.l $7E4180
	PLB
	RTS

CODE_BBA5E1:
	LDA.b $1C
	STA.b ($1A)
	LDY.w #$0008
CODE_BBA5E8:
	LDA.l $7E6580,x
	BEQ.b CODE_BBA5F9
	STA.b ($1C)
	INC.b $1C
	INC.b $1C
	INX
	INX
	DEY
	BNE.b CODE_BBA5E8
CODE_BBA5F9:
	LDA.w #$0000
	STA.b ($1C)
	INC.b $1C
	INC.b $1C
	BRA.b CODE_BBA5CA

CODE_BBA604:
	PHB
	PEA.w $7E4180>>8
	PLB
	PLB
	LDX.w #$1FFE
	LDA.w #$0000
CODE_BBA610:
	STA.w $7E4180,x
	DEX
	DEX
	BPL.b CODE_BBA610
	LDY.w #$0002
	LDX.w #$017E
CODE_BBA61D:
	LDA.l $0015FE,x
	BEQ.b CODE_BBA63C
	PHX
	PHA
	TYA
	STA.l $0015FE,x
	PLA
CODE_BBA62B:
	TAX
	LDA.l $7F0002,x
	STA.w $7E4180,y
	INY
	INY
	LDA.l $7F0000,x
	BNE.b CODE_BBA62B
	PLX
CODE_BBA63C:
	DEX
	DEX
	BPL.b CODE_BBA61D
	TYA
	STA.l $7E4180
	PLB
	RTS

CODE_BBA647:
	PHB
	LDA.b !RAM_DKC3_Global_CurrentLevelLo
	ASL
	TAX
	LDA.l DATA_FE0000,x
	BEQ.b CODE_BBA6A1
	STA.l $0000EA
	INC
	INC
	STA.l $0000EC
	INC
	INC
	STA.l $0000EE
	INC
	INC
	STA.l $0000F0
	LDA.w $196D
	XBA
	AND.w #$00FF
	DEC
	BPL.b CODE_BBA673
	INC
CODE_BBA673:
	STA.b $1A
	LDA.w $1973
	AND.w #$FF00
	SEC
	SBC.w #$0100
	BPL.b CODE_BBA685
	CLC
	ADC.w #$0100
CODE_BBA685:
	ORA.w $15FA
	STA.w !REGISTER_Multiplicand
	LDA.w !REGISTER_ProductOrRemainderLo
	LDA.w !REGISTER_ProductOrRemainderLo
	CLC
	ADC.b $1A
	ASL
	TAX
	LDA.w $15FE,x
	PEA.w DATA_FE0000>>8
	PLB
	PLB
	TAX
	BNE.b CODE_BBA6AA
CODE_BBA6A1:
	PLB
	RTL

CODE_BBA6A3:
	PHX
	JSR.w CODE_BBA6B2
	PLX
	INX
	INX
CODE_BBA6AA:
	LDA.l $7E4180,x
	BNE.b CODE_BBA6A3
	BRA.b CODE_BBA6A1

CODE_BBA6B2:
	STA.l $0000F2
	DEC
	ASL
	TAX
	ASL
	ASL
	TAY
	LDA.b ($EA),y
	AND.w #$1F00
	BEQ.b CODE_BBA6CB
	STA.b $1A
	LDA.l $7E6180,x
	BPL.b CODE_BBA6EB
CODE_BBA6CB:
	LDA.l $7E6180,x
	STA.l $001782
	AND.w #$3FFF
	BEQ.b CODE_BBA6D9
	RTS

CODE_BBA6D9:
	LDA.b ($EA),y
	AND.w #$000F
	ASL
	TAX
	PHX
	JSR.w (DATA_BBA93E,x)
	PLX
	BCS.b CODE_BBA6E8
	RTS

CODE_BBA6E8:
	JMP.w (DATA_BBA992,x)

CODE_BBA6EB:
	LDA.l $7E6180,x
	STA.l $001782
	LDA.b $1A
	XBA
	DEC
	ASL
	TAX
	LDA.l $001786,x
	BEQ.b CODE_BBA700
	RTS

CODE_BBA700:
	LDA.b ($EA),y
	AND.w #$000F
	ASL
	TAX
	JSR.w (DATA_BBA93E,x)
	BCS.b CODE_BBA70D
	RTS

CODE_BBA70D:
	TYA
	STA.l $001784
	JSR.w CODE_BB8F8B
	BCC.b CODE_BBA718
	RTS

CODE_BBA718:
	LDY.w #$000E
	JSL.l CODE_BB8FDD
	LDA.l $00059B
	AND.w #$0100
	BEQ.b CODE_BBA730
	LDX.b $76
	LDA.w #$0134
	JSR.w CODE_BBB884
CODE_BBA730:
	LDX.b $76
	LDA.l $001784
	TAY
	LDA.b ($EA),y
	STA.b $0A,x
	AND.w #$1F00
	XBA
	STA.b $5C,x
	DEC
	ASL
	TAX
	LDA.b $76
	STA.l $001786,x
	TXA
	CLC
	ADC.l $001780
	TAX
	LDA.l $7E0000,x
	TAX
	BRA.b CODE_BBA77F

CODE_BBA758:
	PHX
	PHB
	STA.l $0000F2
	DEC
	ASL
	TAX
	ASL
	ASL
	TAY
	LDA.l $7E6180,x
	STA.l $001782
	AND.w #$3FFF
	BNE.b CODE_BBA77B
	LDA.b ($EA),y
	AND.w #$000F
	ASL
	TAX
	JSR.w (DATA_BBA992,x)
CODE_BBA77B:
	PLB
	PLX
	INX
	INX
CODE_BBA77F:
	LDA.l $7E0000,x
	BNE.b CODE_BBA758
	RTS

CODE_BBA786:
	PHY
	PHB
	PHK
	PLB
	JSR.w CODE_BB8F8B
	PLB
	PLY
	BCS.b CODE_BBA7E5
	LDX.b $76
	LDA.b ($EC),y
	STA.b $12,x
	LDA.b ($EE),y
	STA.b $16,x
	LDA.w #$00EC
	STA.b $0E,x
	LDA.w #$8000
	STA.b $10,x
	STA.b $14,x
	STZ.b $36,x
	STZ.b $3C,x
	STZ.b $3A,x
	STZ.b $28,x
	STZ.b $0C,x
	STZ.b $06,x
	LDA.b ($EA),y
	STA.b $0A,x
	LDA.b ($F0),y
	TAX
	LDA.l DATA_FF0040,x
	TAY
	LDX.b $76
	JSL.l CODE_BB8FF1
	LDX.b $76
	LDA.l $0000F2
	STA.b $08,x
	DEC
	ASL
	STA.b $1A
	TXA
	LDX.b $1A
	EOR.l $7E6180,x
	AND.w #$1FFF
	EOR.l $7E6180,x
	STA.l $7E6180,x
	CLC
	RTS

CODE_BBA7E5:
	SEC
	RTS

CODE_BBA7E7:
	PHY
	PHB
	PHK
	PLB
	JSR.w CODE_BB8F8B
	PLB
	PLY
	BCS.b CODE_BBA851
	LDA.b ($EC),y
	STA.b $12,x
	LDA.b ($EE),y
	STA.b $16,x
	LDA.w #$00EC
	STA.b $0E,x
	LDA.w #$8000
	STA.b $10,x
	STA.b $14,x
	LDA.w #$C000
	STA.b $26,x
	STZ.b $24,x
	STZ.b $20,x
	STZ.b $36,x
	STZ.b $3C,x
	STZ.b $3A,x
	STZ.b $28,x
	STZ.b $0C,x
	STZ.b $26,x
	STZ.b $06,x
	STZ.b $1E,x
	LDA.b ($EA),y
	STA.b $0A,x
	LDA.b ($F0),y
	TAX
	LDA.l DATA_FF0040,x
	TAY
	LDX.b $76
	JSL.l CODE_BB8FF1
	LDX.b $76
	LDA.l $0000F2
	STA.b $08,x
	DEC
	ASL
	STA.b $1A
	TXA
	LDX.b $1A
	EOR.l $7E6180,x
	AND.w #$1FFF
	EOR.l $7E6180,x
	STA.l $7E6180,x
	CLC
	RTS

CODE_BBA851:
	SEC
	RTS

CODE_BBA853:
	LDA.w #$0002
	PHY
	PHB
	PHK
	PLB
	JSR.w CODE_BB8FC8
	BRA.b CODE_BBA866

CODE_BBA85F:
	PHY
	PHB
	PHK
	PLB
	JSR.w CODE_BB8F78
CODE_BBA866:
	PLB
	PLY
	BCS.b CODE_BBA8BC
	LDA.b ($EC),y
	STA.b $12,x
	LDA.b ($EE),y
	STA.b $16,x
	LDA.w #$00EC
	STA.b $0E,x
	LDA.w #$8000
	STA.b $10,x
	STA.b $14,x
	STZ.b $36,x
	STZ.b $3C,x
	STZ.b $3A,x
	STZ.b $28,x
	STZ.b $0C,x
	STZ.b $06,x
	LDA.b ($EA),y
	STA.b $0A,x
	LDA.b ($F0),y
	TAX
	LDA.l DATA_FF0040,x
	TAY
	LDX.b $76
	JSL.l CODE_BB8FF1
	LDX.b $76
	LDA.l $0000F2
	STA.b $08,x
	DEC
	ASL
	STA.b $1A
	TXA
	LDX.b $1A
	EOR.l $7E6180,x
	AND.w #$1FFF
	EOR.l $7E6180,x
	STA.l $7E6180,x
	CLC
	RTS

CODE_BBA8BC:
	SEC
	RTS

DATA_BBA8BE:
	dw $0020,$0140,$0020,$0140,$0028,$0150,$0028,$0150
	dw $0010,$0120,$0010,$0100,$0018,$0130,$0018,$0110
	dw $0060,$01C0,$0040,$0180,$0068,$01D0,$0048,$0190
	dw $0020,$0140,$0040,$0180,$0028,$0150,$0048,$0190
	dw $0020,$0140,$00F8,$02D0,$0028,$0150,$0100,$02E0
	dw $00F8,$02F0,$00F8,$02D0,$0100,$0300,$0100,$02E0
	dw $00F8,$02F0,$0020,$0140,$0100,$0300,$0028,$0150
	dw $0040,$01A0,$0020,$0120,$0048,$01B0,$0028,$0130

DATA_BBA93E:
	dw CODE_BBA9AC
	dw CODE_BBA9AE
	dw CODE_BBA9AE
	dw CODE_BBA9AE
	dw CODE_BBA9AE
	dw CODE_BBA9AC
	dw CODE_BBA9AE
	dw CODE_BBA9BF
	dw CODE_BBA9CA
	dw CODE_BBA9DA
	dw CODE_BBA9E5
	dw CODE_BBA9F0
	dw CODE_BBA9FB

DATA_BBA958:
	dw CODE_BBA9AC
	dw CODE_BBAA2C
	dw CODE_BBAA1C
	dw CODE_BBAA2C
	dw CODE_BBAA2C
	dw CODE_BBAA06
	dw CODE_BBAA2C
	dw CODE_BBAA2C
	dw CODE_BBAA2C
	dw CODE_BBAA2C
	dw CODE_BBAA2C
	dw CODE_BBAA2C
	dw CODE_BBAA2C
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBAA53

DATA_BBA978:
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBAA32
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC
	dw CODE_BBA9AC

DATA_BBA992:
	dw CODE_BBA9AC
	dw CODE_BBA85F
	dw CODE_BBA85F
	dw CODE_BBA853
	dw CODE_BBA7E7
	dw CODE_BBA9AC
	dw CODE_BBA786
	dw CODE_BBA85F
	dw CODE_BBA85F
	dw CODE_BBA85F
	dw CODE_BBA85F
	dw CODE_BBA85F
	dw CODE_BBA85F

CODE_BBA9AC:
	CLC
	RTS

CODE_BBA9AE:
	LDA.b ($EC),y
	STA.b $88
	LDA.b ($EE),y
	STA.b $8A
	LDA.b ($EA),y
	AND.w #$00F0
	TAX
	JMP.w CODE_BBAAD4

CODE_BBA9BF:
	LDA.w #$0001
	AND.l $00194F
	BNE.b CODE_BBA9AE
CODE_BBA9C8:
	CLC
	RTS

CODE_BBA9CA:
	LDA.l $00053B
	BIT.w #$8000
	BNE.b CODE_BBA9C8
	AND.w #$4000
	BNE.b CODE_BBA9AE
	BRA.b CODE_BBA9C8

CODE_BBA9DA:
	LDA.l $00053B
	AND.w #$8000
	BEQ.b CODE_BBA9AE
	BRA.b CODE_BBA9C8

CODE_BBA9E5:
	LDA.l $00053B
	AND.w #$8000
	BNE.b CODE_BBA9AE
	BRA.b CODE_BBA9C8

CODE_BBA9F0:
	LDA.l $00053B
	AND.w #$0080
	BEQ.b CODE_BBA9AE
	BRA.b CODE_BBA9C8

CODE_BBA9FB:
	LDA.l $00053B
	AND.w #$0080
	BNE.b CODE_BBA9AE
	BRA.b CODE_BBA9C8

CODE_BBAA06:
	TYX
	LDA.b $12,x
	STA.b $88
	LDA.b $16,x
	STA.b $8A
	LDA.b $0A,x
	AND.w #$00F0
	CLC
	ADC.w #$0008
	TAX
	JMP.w CODE_BBAAD4

CODE_BBAA1C:
	TYX
	LDA.b $12,x
	STA.b $88
	LDA.b $16,x
	STA.b $8A
	LDA.w #$0050
	TAX
	JMP.w CODE_BBAAD4

CODE_BBAA2C:
	JSR.w CODE_BBAA06
	BCC.b CODE_BBAA32
	RTS

CODE_BBAA32:
	TYX
	LDA.b $08,x
	DEC
	ASL
	ASL
	ASL
	TAY
	PHB
	PEA.w DATA_FE0000>>8
	PLB
	PLB
	LDA.b ($EC),y
	STA.b $88
	LDA.b ($EE),y
	STA.b $8A
	PLB
	TXY
	LDA.b $0A,x
	AND.w #$00F0
	TAX
	JMP.w CODE_BBAAD4

CODE_BBAA53:
	LDA.w $0012,y
	STA.b $88
	LDA.w $0016,y
	STA.b $8A
	LDX.w #$0008
	JSR.w CODE_BBAAD4
	BCC.b CODE_BBAA66
	RTS

CODE_BBAA66:
	LDA.w $000B,y
	AND.w #$00FF
	ASL
	TAX
	LDA.l DATA_BBAD64,x
	TAX
	LDA.b $0C,x
	BEQ.b CODE_BBAAC0
	LDA.b $2C,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	EOR.w #$FFFF
	SEC
	ADC.b $12,x
	BMI.b CODE_BBAA8C
	CMP.w $0012,y
	BCS.b CODE_BBAAC0
CODE_BBAA8C:
	LDA.b $2D,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ADC.b $12,x
	CMP.w $0012,y
	BCC.b CODE_BBAAC0
	LDA.b $32,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	EOR.w #$FFFF
	SEC
	ADC.b $16,x
	BMI.b CODE_BBAAB0
	CMP.w $0016,y
	BCS.b CODE_BBAAC0
CODE_BBAAB0:
	LDA.b $33,x
	AND.w #$00FF
	ASL
	ASL
	ASL
	ADC.b $16,x
	CMP.w $0016,y
	BCC.b CODE_BBAAC0
	RTS

CODE_BBAAC0:
	TYA
	LDY.w #$0003
CODE_BBAAC4:
	CMP.b $4C,x
	BEQ.b CODE_BBAACF
	INX
	INX
	DEY
	BPL.b CODE_BBAAC4
	BRA.b CODE_BBAAD1

CODE_BBAACF:
	STZ.b $4C,x
CODE_BBAAD1:
	TAY
	CLC
	RTS

CODE_BBAAD4:
	LDA.l $00196D
	SEC
	SBC.l DATA_BBA8BE,x
	CMP.b $88
	BCS.b CODE_BBAB02
	CLC
	ADC.l DATA_BBA8BE+$02,x
	CMP.b $88
	BCC.b CODE_BBAB02
	LDA.l $001973
	SEC
	SBC.l DATA_BBA8BE+$04,x
	CMP.b $8A
	BCS.b CODE_BBAB02
	CLC
	ADC.l DATA_BBA8BE+$06,x
	CMP.b $8A
	BCC.b CODE_BBAB02
	SEC
	RTS

CODE_BBAB02:
	CLC
	RTS

CODE_BBAB04:
	LDX.b $70
	LDA.b $08,x
	BEQ.b CODE_BBAB23
	LDA.b $0A,x
	AND.w #$1F00
	BEQ.b CODE_BBAB13
	CLC
	RTL

CODE_BBAB13:
	LDA.b $08,x
	DEC
	ASL
	TAX
	LDA.l $7E6180,x
	AND.w #$E000
	STA.l $7E6180,x
CODE_BBAB23:
	JSL.l CODE_BB9482
	SEC
	RTL

CODE_BBAB29:
	JSR.w CODE_BBAB2D
	RTL

CODE_BBAB2D:
	LDY.b $70
	LDX.w #$000A
	JSR.w (DATA_BBA958,x)
	BCC.b CODE_BBAB39
	CLC
	RTS

CODE_BBAB39:
	SEC
	RTS

CODE_BBAB3B:
	LDY.b $70
	JSR.w CODE_BBAA2C
	BCC.b CODE_BBAB44
	CLC
	RTL

CODE_BBAB44:
	SEC
	RTL

CODE_BBAB46:
	JSR.w CODE_BBAB2D
	BCS.b CODE_BBAB4C
	RTL

CODE_BBAB4C:
	JSL.l CODE_BB9482
	SEC
	RTL

CODE_BBAB52:
	LDX current_sprite
	LDA $08,x
	BNE CODE_BBAB7F		;If the current sprite was spawned by the level
	TXY
	LDA $0A,x
	AND #$000F
	ASL
	TAX
	JSR (DATA_BBA958,x)
	BCC CODE_BBAB6C
	TYX
	LDA $0C,x
	BNE CODE_BBAB9A
	CLC
	RTL

CODE_BBAB6C:
	TYX
	LDA $0C,x
	SEC
	SBC #$0100
	BCC CODE_BBAB79
	STA $0C,x
	CLC
	RTL

CODE_BBAB79:
	JSL.l CODE_BB9482
	SEC
	RTL

CODE_BBAB7F:
	TXY
	LDA $0A,x
	AND #$1F00
	BNE CODE_BBABAF			;If sprite is in a spawn group
CODE_BBAB87:
	LDA $0A,x
	AND #$000F
	ASL
	TAX
	JSR (DATA_BBA958,x)
	BCC CODE_BBABA2
	TYX
	LDA $0C,x
	BNE CODE_BBAB9A
	CLC
	RTL

CODE_BBAB9A:
	SEP #$20
	STA $0D,x
	REP #$20
	CLC
	RTL

CODE_BBABA2:
	TYX
	LDA.b $0C,x
	SEC
	SBC.w #$0100
	BCC.b CODE_BBABC1
	STA.b $0C,x
	CLC
	RTL

CODE_BBABAF:
	LDA.b $08,x
	BMI.b CODE_BBABBF
	DEC
	ASL
	TAX
	LDA.l $7E6180,x
	ASL
	TYX
	BCS.b CODE_BBAB87
	RTL

CODE_BBABBF:
	CLC
	RTL

CODE_BBABC1:
	LDA.b $0A,x
	AND.w #$000F
	ASL
	TAX
	JSR.w (DATA_BBA978,x)
	BCS.b CODE_BBABE4
	TYX
	LDA.b $08,x
	DEC
	ASL
	TAX
	LDA.l $7E6180,x
	AND.w #$E000
	STA.l $7E6180,x
	JSL.l CODE_BB9482
	SEC
	RTL

CODE_BBABE4:
	JSL.l CODE_BB9482
	LDX.b $70
	LDA.w #$0260
	JSR.w CODE_BBB884
	STZ.b $24,x
	STZ.b $20,x
	STZ.b $12,x
	STZ.b $16,x
	STZ.b $38,x
	SEC
	RTL

DKC3_NorSpr0260_UnknownSprite0260_Main:
;$BBABFC
	LDY.b $70
	LDA.w $0038,y
	BEQ.b CODE_BBAC0A
	TYX
	DEC.b $5C,x
	BNE.b CODE_BBAC2D
	STZ.b $38,x
CODE_BBAC0A:
	LDA.w $000A,y
	AND.w #$000F
	ASL
	TAX
	JSR.w (DATA_BBA978,x)
	BCS.b CODE_BBAC2D
	LDX.b $70
	LDA.b $08,x
	DEC
	ASL
	TAX
	LDA.l $7E6180,x
	AND.w #$E000
	STA.l $7E6180,x
	JSL.l CODE_BB9497
CODE_BBAC2D:
	JMP.w [$04F5]

CODE_BBAC30:
	LDX.b $70
	LDA.b $5C,x
	DEC
	ASL
	CLC
	ADC.l $001780
	TAX
	LDA.l $7E0000,x
	TAX
	STA.w $1782
	BRL.w CODE_BBACC7

CODE_BBAC47:
	LDX current_sprite
	LDA $5C,x
	DEC
	ASL
	CLC
	ADC $001780
	TAX
	LDA.l $7E0000,x
	TAX
	STA $1782
	LDA $059B
	AND #$0100
	BNE CODE_BBAC65
CODE_BBAC63:
	BRA CODE_BBAC94

CODE_BBAC65:
	LDY current_sprite
	LDA $0000,y
	CMP #$0134 		;#!sprite_debug_spawn_group_manager
	BNE CODE_BBACC7
	BRA CODE_BBAC63

CODE_BBAC71:
	PHX
	DEC
	ASL
	TAX
	ASL
	ASL
	TAY
	LDA.l $7E6180,x
	BMI.b CODE_BBAC91
	AND.w #$1FFF
	TAY
	LDA.w $000A,y
	AND.w #$000F
	ASL
	TAX
	JSR.w (DATA_BBA958,x)
	BCC.b CODE_BBAC91
	PLX
	RTL

CODE_BBAC91:
	PLX
	INX
	INX
CODE_BBAC94:
	LDA.l $7E0000,x
	BNE.b CODE_BBAC71
	LDA.w $1782
	TAX
	BRA.b CODE_BBACC1

CODE_BBACA0:
	PHX
	DEC
	ASL
	TAX
	ASL
	ASL
	TAY
	LDA.l $7E6180,x
	BMI.b CODE_BBACBE
	AND.w #$1FFF
	TAY
	LDA.w $000A,y
	AND.w #$000F
	ASL
	TAX
	JSR.w (DATA_BBA978,x)
	BCS.b CODE_BBAD13
CODE_BBACBE:
	PLX
	INX
	INX
CODE_BBACC1:
	LDA.l $7E0000,x
	BNE.b CODE_BBACA0
CODE_BBACC7:
	LDA.w $1782
	TAX
	LDA.b $70
	PHA
	BRA.b CODE_BBACF8

CODE_BBACD0:
	PHX
	DEC
	ASL
	TAX
	LDA.l $7E6180,x
	BMI.b CODE_BBACF5
	AND.w #$1FFF
	STA.b $70
	BEQ.b CODE_BBACF5
	TAY
	TDC
	STA.w $000A,y
	LDA.l $7E6180,x
	AND.w #$E000
	STA.l $7E6180,x
	JSL.l CODE_BB9482
CODE_BBACF5:
	PLX
	INX
	INX
CODE_BBACF8:
	LDA.l $7E0000,x
	BNE.b CODE_BBACD0
	PLX
	STX.b $70
	STZ.b $0A,x
	LDA.b $5C,x
	DEC
	ASL
	TAX
	LDA.w #$0000
	STA.l $001786,x
	JML.l CODE_BB9497

CODE_BBAD13:
	PLX
	RTL

CODE_BBAD15:
	LDX.b $70
	LDA.b $08,x
	BEQ.b CODE_BBAD37
	LDA.b $0A,x
	AND.w #$1F00
	BEQ.b CODE_BBAD36
	EOR.b $0A,x
	STA.b $0A,x
	LDA.b $08,x
	DEC
	ASL
	TAX
	LDA.l $7E6180,x
	ORA.w #$8000
	STA.l $7E6180,x
CODE_BBAD36:
	RTL

CODE_BBAD37:
	LDA.b $0A,x
	AND.w #$000F
	CMP.w #$000F
	BEQ.b CODE_BBAD46
	EOR.b $0A,x
	STA.b $0A,x
	RTL

CODE_BBAD46:
	EOR.b $0A,x
	STZ.b $0A,x
	XBA
	ASL
	TAX
	LDA.l DATA_BBAD64,x
	TAX
	LDA.b $70
	LDY.w #$0004
CODE_BBAD57:
	CMP.b $4C,x
	BEQ.b CODE_BBAD61
	INX
	INX
	DEY
	BPL.b CODE_BBAD57
	RTL

CODE_BBAD61:
	STZ.b $4C,x
	RTL

DATA_BBAD64:
	dw aux_sprite_table,$0878,$08E6,$0954,$09C2,$0A30,$0A9E,$0B0C
	dw $0B7A,$0BE8,$0C56,$0CC4,$0D32,$0DA0,$0E0E,$0E7C
	dw $0EEA,$0F58,$0FC6,$1034,$10A2,$1110,$117E,$11EC
	dw $125A,$12C8,$1336,$13A4,$1412

CODE_BBAD9E:
	LDX.w #$03FE
CODE_BBADA1:
	LDA.l $7E6180,x
	AND.w #$E000
	STA.l $7E2500,x
	DEX
	DEX
	BPL.b CODE_BBADA1
	RTS

CODE_BBADB1:
	LDX.w #$03FE
CODE_BBADB4:
	LDA.l $7E2500,x
	STA.l $7E6180,x
	DEX
	DEX
	BPL.b CODE_BBADB4
	RTS

CODE_BBADC1:
	LDX.b $70
	LDA.b $08,x
	DEC
	ASL
	TAX
	LDA.l $7E6180,x
	ORA.w #$2000
	STA.l $7E6180,x
	RTL

CODE_BBADD4:
	LDA.w #$0003
	BRA.b CODE_BBADDC

CODE_BBADD9:
	LDA.w #$0001
CODE_BBADDC:
	JSL.l request_palette_direct_global
	DEC.w $074C,x
	AND.w #$0E00
	ORA.w #$3000
	STA.b $40
	LDA.b $B6
	AND.w #$0E00
	ORA.w #$3000
	STA.b $3E
	JSR.w CODE_BBB16C
	JSR.w CODE_BBB2B1
	JSR.w CODE_BBB069
	JSR.w CODE_BBAE1F
	JSR.w CODE_BBAF26
	LDA.b $00
	AND.w #$0010
	BNE.b CODE_BBAE15
	JSR.w CODE_BBB155
	JSR.w CODE_BBB3A0
	JSR.w CODE_BBB35E
	RTL

CODE_BBAE15:
	JSR.w CODE_BBB3A0
	JSR.w CODE_BBB155
	JSR.w CODE_BBB35E
	RTL

CODE_BBAE1F:
	LDA.w $18E9
	BNE.b CODE_BBAE25
	RTS

CODE_BBAE25:
	LDA.w $18EB
	BEQ.b CODE_BBAE42
	LDA.w #$0100
	DEC.w $18EB
	BEQ.b CODE_BBAE36
	ASL
	DEC.w $18EB
CODE_BBAE36:
	CLC
	ADC.w $18E9
	BCC.b CODE_BBAE3F
	LDA.w #$FFFF
CODE_BBAE3F:
	STA.w $18E9
CODE_BBAE42:
	LDY.b $82
	LDA.w $18EB
	XBA
	CLC
	ADC.w $18E9
	BCS.b CODE_BBAE65
	DEC
	BEQ.b CODE_BBAE65
	CMP.w #$3000
	BCS.b CODE_BBAE65
	CMP.w #$1800
	LDA.w #$0010
	BCS.b CODE_BBAE61
	LDA.w #$0008
CODE_BBAE61:
	AND.b $00
	BNE.b CODE_BBAE91
CODE_BBAE65:
	LDA.w $18E9
	LSR
	AND.w #$FF00
	EOR.w #$FFFF
	SEC
	ADC.w #$BAE8
	STA.w $0000,y
	CLC
	ADC.w #$0008
	STA.w $0004,y
	LDA.w #$01C9
	ORA.b $3E
	STA.w $0002,y
	EOR.w #$4000
	STA.w $0006,y
	TYA
	CLC
	ADC.w #$0008
	TAY
CODE_BBAE91:
	LDA.w #$35E8
	STA.w $0000,y
	LDA.w #$35F0
	STA.w $0004,y
	LDA.w #$01C5
	ORA.b $3E
	STA.w $0002,y
	INC
	STA.w $0006,y
	LDA.w #$C0E8
	STA.w $0008,y
	LDA.w #$C0F0
	STA.w $000C,y
	LDA.w #$01C7
	ORA.b $3E
	STA.w $000A,y
	INC
	STA.w $000E,y
	TYA
	CLC
	ADC.w #$0010
	TAY
	LDA.b $00
	AND.w #$0007
	BNE.b CODE_BBAED8
	LDA.w $18ED
	CLC
	ADC.w #$0800
	STA.w $18ED
CODE_BBAED8:
	LDA.b $00
	AND.w #$0007
	BEQ.b CODE_BBAF03
	LDA.w $18ED
	JSR.w CODE_BBAF06
	LDA.w $18ED
	SEC
	SBC.w #$4000
	JSR.w CODE_BBAF06
	LDA.w $18ED
	SEC
	SBC.w #$8000
	JSR.w CODE_BBAF06
	LDA.w $18ED
	SEC
	SBC.w #$C000
	JSR.w CODE_BBAF06
CODE_BBAF03:
	STY.b $82
	RTS

CODE_BBAF06:
	CMP.w $18E9
	BCS.b CODE_BBAF03
	LSR
	AND.w #$FF00
	EOR.w #$FFFF
	SEC
	ADC.w #$BCEC
	STA.w $0000,y
	LDA.w #$01C4
	ORA.b $3E
	STA.w $0002,y
	INY
	INY
	INY
	INY
	RTS

CODE_BBAF26:
	LDX.w $18E3
	BNE.b CODE_BBAF2C
	RTS

CODE_BBAF2C:
	LDA.w $18E5
	BMI.b CODE_BBAF50
	BEQ.b CODE_BBAF56
	DEC.w $18E5
	LDA.w $0533
	CMP.w #$0001
	BEQ.b CODE_BBAF46
	JSR.w CODE_BBAF98
	JSR.w CODE_BBAFB8
	BRA.b CODE_BBAF56

CODE_BBAF46:
	JSR.w CODE_BBAFA8
	JSR.w CODE_BBAFB8
	JSR.w CODE_BBAFFF
	RTS

CODE_BBAF50:
	JSR.w CODE_BBAF98
	JSR.w CODE_BBAFC0
CODE_BBAF56:
	LDY.b $82
	STZ.b $1A
	STZ.b $1C
	LDA.b $64,x
	JSR.w CODE_BBB042
	LDA.w $0535
	JSR.w CODE_BBB042
	LDA.w #$000A
	JSR.w CODE_BBB045
	INC.b $1A
	INC.b $1A
	INC.b $1A
	LDA.w $0536
	JSR.w CODE_BBB042
	LDA.w $0536
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_BBB042
	LDA.w #$000A
	JSR.w CODE_BBB045
	INC.b $1A
	INC.b $1A
	INC.b $1A
	LDA.w $0537
	JSR.w CODE_BBB042
	STY.b $82
	RTS

CODE_BBAF98:
	LDA.w #$0005
	STA.b $24
	LDA.w #$0001
	STA.b $26
	LDA.w #$0001
	STA.b $28
	RTS

CODE_BBAFA8:
	LDA.w #$0005
	STA.b $24
	LDA.w #$0003
	STA.b $26
	LDA.w #$0000
	STA.b $28
	RTS

CODE_BBAFB8:
	LDA.b $00
	BIT.w #$0008
	BEQ.b CODE_BBAFC0
	RTS

CODE_BBAFC0:
	LDY.b $82
	STZ.b $1A
	LDA.w #$000A
	STA.b $1C
	LDA.w #$000E
	JSR.w CODE_BBB042
	LDA.w #$000D
	JSR.w CODE_BBB042
	LDA.w #$000B
	JSR.w CODE_BBB045
	INC.b $1A
	INC.b $1A
	INC.b $1A
	LDA.b $24
	JSR.w CODE_BBB042
	LDA.b $26
	JSR.w CODE_BBB042
	LDA.w #$000A
	JSR.w CODE_BBB045
	INC.b $1A
	INC.b $1A
	INC.b $1A
	LDA.b $28
	JSR.w CODE_BBB042
	STY.b $82
	RTS

CODE_BBAFFF:
	LDY.b $82
	STZ.b $1A
	STZ.b $1C
	LDA.w #$0000
	JSR.w CODE_BBB042
	LDA.w $05C5
	JSR.w CODE_BBB042
	LDA.w #$000A
	JSR.w CODE_BBB045
	INC.b $1A
	INC.b $1A
	INC.b $1A
	LDA.w $05C6
	JSR.w CODE_BBB042
	LDA.w $05C6
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_BBB042
	LDA.w #$000A
	JSR.w CODE_BBB045
	INC.b $1A
	INC.b $1A
	INC.b $1A
	LDA.w $05C7
	JSR.w CODE_BBB042
	STY.b $82
	RTS

CODE_BBB042:
	AND.w #$000F
CODE_BBB045:
	ORA.b $1E,x
	STA.w $0002,y
	SEP.b #$20
	LDA.b $16,x
	SEC
	SBC.b $1C
	XBA
	LDA.b $12,x
	CLC
	ADC.b $1A
	REP.b #$20
	STA.w $0000,y
	INY
	INY
	INY
	INY
	LDA.b $1A
	SEC
	SBC.w #$0008
	STA.b $1A
	RTS

CODE_BBB069:
	LDA.b $7E
	CMP.w #$0234
	BNE.b CODE_BBB078
	LDA.w $0777
	AND.w #$0020
	BNE.b CODE_BBB079
CODE_BBB078:
	RTS

CODE_BBB079:
	LDX.w $04F9
	LDA.b $1E,x
	AND.w #$0E00
	ORA.w #$3000
	STA.b $3A
	LDA.w $1891
	ASL
	ASL
	ASL
	TAX
	LDY.b $82
	LDA.l DATA_BBB0F1,x
	ORA.b $3A
	STA.w $0002,y
	ADC.l DATA_BBB0F1+$02,x
	STA.w $0006,y
	CLC
	ADC.l DATA_BBB0F1+$04,x
	STA.w $000A,y
	CLC
	ADC.l DATA_BBB0F1+$06,x
	STA.w $000E,y
	LDA.w #$01C9
	ORA.b $3A
	STA.w $0012,y
	INC
	STA.w $0016,y
	INC
	STA.w $001A,y
	LDA.w #$CAD4
	STA.w $0000,y
	LDA.w #$CADC
	STA.w $0004,y
	LDA.w #$CAE4
	STA.w $0008,y
	LDA.w #$CAEC
	STA.w $000C,y
	LDA.w #$C6C8
	STA.w $0010,y
	LDA.w #$CEC7
	STA.w $0014,y
	LDA.w #$CEC9
	STA.w $0018,y
	TYA
	CLC
	ADC.w #$001C
	STA.b $82
	RTS

DATA_BBB0F1:
dw $01C6,$0000,$0000,$0002,$01C5,$0001,$0000,$0002
dw $01C4,$0002,$0000,$0002,$01C4,$0001,$0001,$0002
dw $01C4,$0000,$0002,$0002,$01C4,$0000,$0001,$0003
dw $01C4,$0000,$0000,$0004,$01C4,$0000,$0000,$0003
dw $01C6,$0000,$0002,$01C5,$0001,$0002,$01C4,$0002
dw $0002,$01C4,$0001,$0003,$01C4,$0000,$0004,$01C4
dw $0000,$0003

CODE_BBB155:
	LDY.w $18E1
	BEQ.b CODE_BBB16B
	JSR.w CODE_BBB162
	LDX.w $18E1
	LDY.b $5C,x
CODE_BBB162:
	LDX.b $12,y
	LDA.w $0016,y
	JSL.l CODE_B78015
CODE_BBB16B:
	RTS

CODE_BBB16C:
	LDA.w $18D5
	BEQ.b CODE_BBB16B
	DEC
	BNE.b CODE_BBB188
	LDA.w $18DB
	SEC
	SBC.w #$0030
	BCS.b CODE_BBB183
	LDA.w #$0000
	STA.w $18D5
CODE_BBB183:
	STA.w $18DB
	BRA.b CODE_BBB19B

CODE_BBB188:
	LDA.w $18DB
	CMP.w #$0180
	BCS.b CODE_BBB198
	ADC.w #$0030
	STA.w $18DB
	BRA.b CODE_BBB19B

CODE_BBB198:
	DEC.w $18D5
CODE_BBB19B:
	LDA.l DATA_B9B73D
	STA.w $18D7
	LDX.w #$1D40
	LDA.w $18DB
	CLC
	ADC.w #$1000
	TAY
	LDA.b $40
	JSR.w CODE_BBB261
	LDA.b $00
	AND.w #$000F
	BNE.b CODE_BBB21F
	LDA.w $18D3
	AND.w #$00FF
	STA.b $1A
	LDA.w $18D4
	AND.w #$00FF
	STA.b $1C
	SEC
	SBC.b $1A
	CLC
	ADC.w $05D5
	CMP.w $18D1
	BCC.b CODE_BBB1D7
	BNE.b CODE_BBB20F
CODE_BBB1D7:
	LDA.b $1C
	BEQ.b CODE_BBB21F
	JSR.w CODE_BBB21F
	LDA.w $18D5
	CMP.w #$005A
	BCS.b CODE_BBB20E
	DEC.w $18D4
	DEC.w $18D1
	LDA.w #$0716
	JSL.l CODE_B28027
	LDA.w $044A
	PHA
	STZ.w $044A
	LDA.w #$0716
	JSL.l CODE_B28018
	PLA
	STA.w $044A
	STZ.w $18DB
	LDA.w #$005A
	STA.w $18D5
CODE_BBB20E:
	RTS

CODE_BBB20F:
	INC.w $18D1
	LDA.w #$003C
	STA.w $18D5
	LDA.w #$0715
	JSL.l CODE_B28012
CODE_BBB21F:
	LDA.w $18D1
	BMI.b CODE_BBB20E
	CMP.w #$0063
	BCC.b CODE_BBB22C
	LDA.w #$0063
CODE_BBB22C:
	STA.w !REGISTER_DividendLo
	SEP.b #$20
	LDA.b #$0A
	STA.w !REGISTER_Divisor
	REP.b #$20
	LDA.w $18DB
	ASL
	ASL
	ASL
	ASL
	ADC.w #$F000
	AND.w #$FF00
	STA.b $1A
	LDA.w !REGISTER_QuotientLo
	BEQ.b CODE_BBB258
	LDX.w #$00DF
	JSR.w CODE_BBB285
	LDA.w !REGISTER_ProductOrRemainderLo
	JMP.w CODE_BBB285

CODE_BBB258:
	LDA.w !REGISTER_ProductOrRemainderLo
	LDX.w #$00E4
	JMP.w CODE_BBB285

CODE_BBB261:
	ORA.w #$01C0
	STA.w $0828
	LDA.w $18D9
	STA.w $082A
	LDA.w $18D7
	STA.w $082E
	STZ.w $0830
	TYA
	LDY.w #aux_sprite_table
	JSL.l CODE_B78015
	LDA.w $082C
	STA.w $18D9
	RTS

CODE_BBB285:
	LDY.b $82
	CLC
	ADC.w #$01CC
	ORA.b $3E
	STA.w $0002,y
	ADC.w #$000A
	STA.w $0006,y
	TXA
	ORA.b $1A
	STA.w $0000,y
	CLC
	ADC.w #$0800
	STA.w $0004,y
	TYA
	CLC
	ADC.w #$0008
	STA.b $82
	TXA
	CLC
	ADC.w #$0008
	TAX
	RTS

CODE_BBB2B1:
	LDA.w $18CD
	CMP.w $18CB
	BNE.b CODE_BBB2E1
	LDA.w $18CF
	BNE.b CODE_BBB30D
	RTS

CODE_BBB2BF:
	SED
	LDA.w $05D3
	CLC
	SBC.w #$0099
	STA.w $05D3
	LDA.w $18CD
	CLC
	SBC.w #$0099
	STA.w $18CD
	CLD
	STZ.w $18CB
	LDA.w #$0001
	JSL.l CODE_B88081
	BRA.b CODE_BBB30D

CODE_BBB2E1:
	BIT.w $18CF
	BMI.b CODE_BBB2EC
	LDA.w #$003C
	STA.w $18CF
CODE_BBB2EC:
	BCS.b CODE_BBB2FA
	LDA.b $00
	AND.w #$0003
	BNE.b CODE_BBB30D
	LDA.w #$9999
	BRA.b CODE_BBB305

CODE_BBB2FA:
	LDA.w $18CB
	CMP.w #$0099
	BCS.b CODE_BBB2BF
	LDA.w #$0001
CODE_BBB305:
	SED
	ADC.w $18CB
	STA.w $18CB
	CLD
CODE_BBB30D:
	DEC.w $18CF
	LDY.b $82
	LDA.w #$0808
	STA.w $0000,y
	LDA.b $00
	AND.w #$001C
	LSR
	ADC.w $18F7
	ORA.w #$3000
	STA.w $0002,y
	JSR.w CODE_BBB3D0
	INY
	INY
	INY
	INY
	STY.b $82
	LDX.w #$0018
	LDA.w #$0800
	STA.b $1A
	LDA.w $18CC
	AND.w #$000F
	BEQ.b CODE_BBB343
	JSR.w CODE_BBB285
CODE_BBB343:
	LDA.w $18CB
	AND.w #$0FF0
	BEQ.b CODE_BBB355
	LSR
	LSR
	LSR
	LSR
	AND.w #$000F
	JSR.w CODE_BBB285
CODE_BBB355:
	LDA.w $18CB
	AND.w #$000F
	JMP.w CODE_BBB285

CODE_BBB35E:
	LDX.w $18DD
	BEQ.b CODE_BBB39F
	LDA.b $1E,x
	BMI.b CODE_BBB39F
	STA.b $1A
	JSR.w CODE_BBB372
	JSR.w CODE_BBB372
	JSR.w CODE_BBB372
CODE_BBB372:
	LDA.b $5C,x
	BEQ.b CODE_BBB399
	LDY.b $82
	SEP.b #$20
	SEC
	SBC.b #$08
	STA.w $0000,y
	XBA
	SEC
	SBC.b #$10
	STA.w $0001,y
	REP.b #$20
	LDA.b $1A
	STA.w $0002,y
	PHX
	JSR.w CODE_BBB3D0
	PLX
	INY
	INY
	INY
	INY
	STY.b $82
CODE_BBB399:
	INC.b $1A
	INC.b $1A
	INX
	INX
CODE_BBB39F:
	RTS

CODE_BBB3A0:
	LDY.w $18DF
	BNE.b CODE_BBB3A6
	RTS

CODE_BBB3A6:
	LDA.w $005C,y
	AND.w #$00FF
	TAX
	EOR.w $005C,y
	STA.b $1A
	LDA.w $005E,y
	CMP.w #$0100
	BCC.b CODE_BBB3C9
	PHA
	XBA
	AND.w #$00FF
	JSR.w CODE_BBB285
	PLA
	AND.w #$00FF
	JMP.w CODE_BBB285

CODE_BBB3C9:
	INX
	INX
	INX
	INX
	JMP.w CODE_BBB285

CODE_BBB3D0:
	PHY
	TYA
	AND.w #$000C
	TAX
	TYA
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	TAY
	LDA.l DATA_BBB3EB,x
	ORA.w $0400,y
	STA.w $0400,y
	PLY
	RTS

DATA_BBB3EB:
	dw $0002,$0000,$0008,$0000,$0020,$0000,$0080,$0000

CODE_BBB3FB:
	PHY
	TYA
	AND.w #$000C
	TAX
	TYA
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	TAY
	LDA.l DATA_BBB416,x
	ORA.w $0400,y
	STA.w $0400,y
	PLY
	RTS

DATA_BBB416:
	dw $0001,$0000,$0004,$0000,$0010,$0000,$0040,$0000

CODE_BBB426:
	JSR.w CODE_BBB42D
	JSR.w CODE_BBB75A
	RTL

CODE_BBB42D:
	PHK
	PLB
	JSR.w CODE_BBB51E
	LDX.w #$0000
CODE_BBB435:
	JSR.w CODE_BBB440
	INX
	INX
	CPX.w #$0010
	BCC.b CODE_BBB435
	RTS

CODE_BBB440:
	LDA.l $7E9882,x
	BEQ.b CODE_BBB474
	LDA.l $7E98A2,x
	SEC
	SBC.l $7E98C2,x
	STA.l $7E98A2,x
	LSR
	LSR
	TAY
	SEC
	SBC.l $7E98D2,x
	CMP.w $050F
	BCC.b CODE_BBB46D
	TYA
	SBC.w $1973
	CLC
	ADC.w #$0010
	CMP.w #$0100
	BCC.b CODE_BBB475
CODE_BBB46D:
	LDA.w #$0000
	STA.l $7E9882,x
CODE_BBB474:
	RTS

CODE_BBB475:
	TAY
	LDA.l $7E9892,x
	CLC
	ADC.w $0509
	STA.l $7E9892,x
	LSR
	LSR
	SEC
	SBC.w $196D
	BCS.b CODE_BBB48F
	ADC.w #$0020
	BCC.b CODE_BBB46D
CODE_BBB48F:
	SBC.w #$0120
	BCS.b CODE_BBB46D
	LDA.l $7E98B2,x
	BPL.b CODE_BBB4C4
	JSR.w CODE_BBB511
	BEQ.b CODE_BBB4C0
	PHA
	CLC
	ADC.l $7E9892,x
	STA.l $7E9892,x
	PLA
	BPL.b CODE_BBB4B6
	LDA.l $7E98B2,x
	INC
	STA.l $7E98B2,x
	RTS

CODE_BBB4B6:
	LDA.l $7E98B2,x
	DEC
	STA.l $7E98B2,x
	RTS

CODE_BBB4C0:
	STA.l $7E98B2,x
CODE_BBB4C4:
	LDA.l $7E98B2,x
	BNE.b CODE_BBB4D8
	TYA
	AND.w #$0007
	BNE.b CODE_BBB505
	LDA.w #$0100
	STA.l $7E98B2,x
	RTS

CODE_BBB4D8:
	SEP.b #$30
	DEC
	BPL.b CODE_BBB4EE
	XBA
	INC
	INC
	TAY
	LDA.w DATA_BBB506+$01,y
	BNE.b CODE_BBB4E7
	TAY
CODE_BBB4E7:
	XBA
	TYA
	STA.l $7E98B3,x
	XBA
CODE_BBB4EE:
	STA.l $7E98B2,x
	XBA
	TAY
	LDA.w DATA_BBB506,y
	REP.b #$30
	JSR.w CODE_BBB511
	CLC
	ADC.l $7E9892,x
	STA.l $7E9892,x
CODE_BBB505:
	RTS

DATA_BBB506:
	db $00,$00,$00,$02,$08,$FE,$10,$02,$08,$00,$00

CODE_BBB511:
	BIT.w #$0080
	BEQ.b CODE_BBB51A
	ORA.w #$FF00
	RTS

CODE_BBB51A:
	AND.w #$00FF
	RTS

CODE_BBB51E:
	LDA.w $0505
	ASL
	TAX
	JSR.w (DATA_BBB592,x)
	BCS.b CODE_BBB591
	JSR.w CODE_BBB749
	BNE.b CODE_BBB591
	JSL.l CODE_808018
	TAY
	AND.w #$01FF
	STA.b $1A
	ASL
	ADC.b $1A
	LSR
	LSR
	SEC
	SBC.w #$0020
	CLC
	ADC.w $196D
	ASL
	ASL
	STA.l $7E9892,x
	TYA
	XBA
	AND.w #$0038
	CLC
	ADC.b $42
	TAY
	LDA.w $1973
	CLC
	ADC.w #$00E8
	CMP.w DATA_BBB649,y
	BCC.b CODE_BBB56B
	STA.b $1A
	LDA.w DATA_BBB649,y
	CMP.w $1973
	BCS.b CODE_BBB56B
	LDA.b $1A
CODE_BBB56B:
	ASL
	ASL
	STA.l $7E98A2,x
	LDA.w DATA_BBB649+$02,y
	STA.l $7E98D2,x
	LDA.w $18AB
	CLC
	ADC.w DATA_BBB649+$04,y
	STA.l $7E9882,x
	LDA.w DATA_BBB649+$06,y
	STA.l $7E98C2,x
	LDA.w #$0000
	STA.l $7E98B2,x
CODE_BBB591:
	RTS

DATA_BBB592:
	dw CODE_BBB59C
	dw CODE_BBB5C6
	dw CODE_BBB5F3
	dw CODE_BBB61E
	dw CODE_BBB59C

CODE_BBB59C:
	LDA.b $00
	AND.w #$0003
	BNE.b CODE_BBB5C4
	LDX.w #$0000
	LDA.w $050F
	SEC
	SBC.w $1973
	BCC.b CODE_BBB5C0
	CMP.w #$0100
	BCS.b CODE_BBB5C4
	SBC.w #$0080
	BCC.b CODE_BBB5C0
	LSR
	LSR
	LSR
	LSR
	INC
	ASL
	TAX
CODE_BBB5C0:
	STZ.b $42
	CLC
	RTS

CODE_BBB5C4:
	SEC
	RTS

CODE_BBB5C6:
	LDA.b $00
	AND.w #$0003
	BNE.b CODE_BBB5F1
	LDX.w #$0000
	LDA.w $050F
	SEC
	SBC.w $1973
	BCC.b CODE_BBB5EA
	CMP.w #$0100
	BCS.b CODE_BBB5F1
	SBC.w #$0080
	BCC.b CODE_BBB5EA
	LSR
	LSR
	LSR
	LSR
	INC
	ASL
	TAX
CODE_BBB5EA:
	LDA.w #$0040
	STA.b $42
	CLC
	RTS

CODE_BBB5F1:
	SEC
	RTS

CODE_BBB5F3:
	LDA.b $00
	AND.w #$0003
	BNE.b CODE_BBB61C
	LDX.w #$0000
	LDA.w $050F
	SEC
	SBC.w $1973
	BCC.b CODE_BBB615
	CMP.w #$0100
	BCS.b CODE_BBB61C
	ASL
	ASL
	ASL
	XBA
	AND.w #$0007
	INC
	ASL
	TAX
CODE_BBB615:
	LDA.w #$0080
	STA.b $42
	CLC
	RTS

CODE_BBB61C:
	SEC
	RTS

CODE_BBB61E:
	LDA.b $00
	AND.w #$0003
	BNE.b CODE_BBB647
	LDX.w #$0000
	LDA.w $050F
	SEC
	SBC.w $1973
	BCC.b CODE_BBB640
	CMP.w #$0100
	BCS.b CODE_BBB647
	ASL
	ASL
	ASL
	XBA
	AND.w #$0007
	INC
	ASL
	TAX
CODE_BBB640:
	LDA.w #$00C0
	STA.b $42
	CLC
	RTS

CODE_BBB647:
	SEC
	RTS

DATA_BBB649:
	dw $02D0,$000C,$1000,$0003,$02D0,$000C,$1000,$0003
	dw $02D0,$000E,$1001,$0004,$02E8,$000F,$2002,$0005
	dw $02E8,$0010,$2003,$0005,$FFFF,$0011,$3004,$0006
	dw $FFFF,$0012,$3005,$0007,$FFFF,$0014,$3006,$0007
	dw $FFFF,$0008,$3000,$0003,$FFFF,$0008,$3000,$0003
	dw $FFFF,$0008,$3001,$0004,$FFFF,$0008,$3002,$0005
	dw $FFFF,$0008,$3003,$0005,$FFFF,$0008,$3004,$0006
	dw $FFFF,$0008,$3005,$0007,$FFFF,$0008,$3006,$0007
	dw $FFFF,$0008,$0000,$0003,$FFFF,$0008,$0000,$0003
	dw $FFFF,$0008,$0001,$0004,$FFFF,$0008,$1001,$0005
	dw $FFFF,$0008,$1002,$0005,$FFFF,$0008,$1003,$0006
	dw $FFFF,$0008,$3004,$0007,$FFFF,$0008,$3005,$0007
	dw $FFFF,$0008,$2000,$0003,$FFFF,$0008,$2000,$0003
	dw $FFFF,$0008,$2001,$0004,$FFFF,$0008,$2002,$0005
	dw $FFFF,$0008,$2003,$0005,$FFFF,$0008,$2004,$0006
	dw $FFFF,$0008,$2005,$0007,$FFFF,$0008,$2006,$0007

CODE_BBB749:
	LDA.l $7E9882,x
	BEQ.b CODE_BBB759
	INX
	INX
	CPX.w #$000E
	BCC.b CODE_BBB749
	LDA.w #$FFFF
CODE_BBB759:
	RTS

CODE_BBB75A:
	PHK
	PLB
	LDX.w #$0000
	LDY.b $82
	CPY.w #$0400
	BCS.b CODE_BBB7A4
CODE_BBB766:
	LDA.l $7E9882,x
	BEQ.b CODE_BBB798
	LDA.l $7E98A2,x
	LSR
	LSR
	SEC
	SBC.w $1973
	STA.w $0001,y
	LDA.l $7E9882,x
	STA.w $0002,y
	LDA.l $7E9892,x
	LSR
	LSR
	SEC
	SBC.w $196D
	SEP.b #$20
	STA.w $0000,y
	XBA
	REP.b #$20
	BNE.b CODE_BBB7A7
	INY
	INY
	INY
	INY
CODE_BBB798:
	CPY.w #$0400
	BCS.b CODE_BBB7A4
	INX
	INX
	CPX.w #$0010
	BCC.b CODE_BBB766
CODE_BBB7A4:
	STY.b $82
	RTS

CODE_BBB7A7:
	PHX
	JSR.w CODE_BBB3FB
	PLX
	INY
	INY
	INY
	INY
	BRA.b CODE_BBB798

DATA_BBB7B2:
	dw $0000,$0000,$0000,$0000,$0000

DATA_BBB7BC:
	db $08,$00,$02,$14,$01,$01,$1A,$02,$00,$1B,$03,$00,$1C,$04,$00,$22
	db $05,$02,$25,$06,$00,$26,$07,$00,$27,$08,$04,$32,$09,$01,$33,$0A
	db $01,$34,$0B,$01,$35,$0C,$02,$36,$0D,$02,$37,$0E,$02,$3F,$0F,$03
	db $45,$10,$00,$50,$11,$00,$51,$12,$00,$54,$13,$04,$55,$14,$04,$5C
	db $15,$01,$5D,$16,$01,$62,$17,$01,$63,$18,$01,$64,$19,$02,$65,$1A
	db $02,$68,$1B,$00,$69,$1C,$00,$6C,$1D,$02,$6D,$1E,$02,$86,$1F,$02
	db $87,$20,$02,$88,$21,$00,$90,$22,$01,$91,$23,$01,$94,$24,$03,$95
	db $25,$03,$FF,$26,$00

DATA_BBB831:
	dw $0100,$0258,$020C,$026C,$02EC,$0100,$0298,$0298
	dw $0298,$0258,$0258,$0258,$0100,$0100,$0100,$0200
	dw $0378,$0298,$0298,$0298,$0298,$0258,$0258,$0258
	dw $0258,$0100,$0100,$0298,$0298,$0100,$0100,$0100
	dw $0100,$0200,$0258,$0258,$0100,$0100

CODE_BBB87D:
	JMP.w [$04F5]

CODE_BBB880:
	JSR.w CODE_BBB884
	RTL

CODE_BBB884:
	PHB
	PHK
	PLB
	PHY
	TXY
	TAX
	STX.b DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,y
	LDA.l DATA_BB8084,x
	STA.w DKC3_Level_SpriteDataRAM[$00].RoutinePtrLo,y
	SEP.b #$20
	LDA.l DATA_BB8084+$02,x
	STA.w DKC3_Level_SpriteDataRAM[$00].RoutinePtrBank,y
	STA.w $0005,y
	REP.b #$20
	TYX
	PLY
	PLB
	RTS

CODE_BBB8A5:
	JSL.l CODE_BCE2CB
	LDA.w #DATA_FF1BC0>>8
	STA.b $6B
	STZ.w $0428
	STZ.w $042A
	STZ.w $042C
	STZ.w $042E
	LDA.w $194B
	BNE.b CODE_BBB90A
	LDA.w #CODE_BBB8EC>>16
	STA.w $04F7
	LDA.w #CODE_BBB8EC
	STA.w $04F5
	LDY.w #$0878
CODE_BBB8CE:
	LDA.w $0000,y
	BEQ.b CODE_BBB8EE
	STY.b $70
	LDA.w $0004,y
	PHA
	PLB
	LDA.w $0002,y
	PHA
	LDA.w $0006,y
	STA.b $6A
	LDA.w $0038,y
	AND.w #$00FF
	ASL
	TAX
	RTL

CODE_BBB8EC:
	LDY.b $70
CODE_BBB8EE:
	TYA
	CLC
	ADC.w #$006E
	TAY
	CPY.w #$1480
	BNE.b CODE_BBB8CE
	JSL.l CODE_B8806C
	JSR.w CODE_BBBA8F
	JSR.w CODE_BBB9EB
	JSL.l CODE_B28015
	JMP.w CODE_BBB99A

CODE_BBB90A:
	AND.w #$0080
	BNE.b CODE_BBB983
	LDA.w #CODE_BBB976>>16
	STA.w $04F7
	LDA.w #CODE_BBB976
	STA.w $04F5
CODE_BBB91B:
	LDY.w #!RAM_DKC3_Level_SpriteDataRAM
CODE_BBB91E:
	LDX.b DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,y
	BEQ.b CODE_BBB978
	STY.b $70
	CPY.w $04F9
	BEQ.b CODE_BBB941
	CPY.w $04FD
	BEQ.b CODE_BBB950
CODE_BBB92E:
	LDA.w $194B
	AND.w #$0024
	BEQ.b CODE_BBB95F
	LDA.l DATA_BB8084+$03,x
	AND.w #$0001
	BEQ.b CODE_BBB976
	BRA.b CODE_BBB95F

CODE_BBB941:
	LDA.w $194B
	AND.w #$0028
	BEQ.b CODE_BBB95F
	AND.w #$0008
	BNE.b CODE_BBB976
	BRA.b CODE_BBB92E

CODE_BBB950:
	LDA.w $194B
	AND.w #$0030
	BEQ.b CODE_BBB95F
	AND.w #$0010
	BNE.b CODE_BBB976
	BRA.b CODE_BBB92E

CODE_BBB95F:
	LDA.w DKC3_Level_SpriteDataRAM[$00].RoutinePtrBank,y
	PHA
	PLB
	LDA.w DKC3_Level_SpriteDataRAM[$00].RoutinePtrLo,y
	PHA
	LDA.w $0006,y
	STA.b $6A
	LDA.w $0038,y
	AND.w #$00FF
	ASL
	TAX
	RTL

CODE_BBB976:
	LDY.b $70
CODE_BBB978:
	TYA
	CLC
	ADC.w #$006E
	TAY
	CPY.w #$1480
	BNE.b CODE_BBB91E
CODE_BBB983:
	JSL.l CODE_B8806C
	JSR.w CODE_BBBA8F
	JSR.w CODE_BBB9EB
	JSL.l CODE_B28015
	DEC.w $194D
	BEQ.b CODE_BBB997
	RTL

CODE_BBB997:
	STZ.w $194B
CODE_BBB99A:
	LDA.w $1D8B
	BNE.b CODE_BBB9AF
	LDA.b $E6
	CMP.b $E8
	BEQ.b CODE_BBB9AF
	LDA.w $1560
	CLC
	ADC.w #$0063
	STA.w $1560
CODE_BBB9AF:
	RTL

CODE_BBB9B0:
	LDA.w #DATA_FF1BC0>>8
	STA.b $6B
	LDA.w #CODE_BBB9DC>>16
	STA.w $04F7
	LDA.w #CODE_BBB9DC
	STA.w $04F5
	STY.b $70
	LDA.w DKC3_Level_SpriteDataRAM[$00].SpriteIDLo,y
	LDA.w DKC3_Level_SpriteDataRAM[$00].RoutinePtrBank,y
	PHA
	PLB
	LDA.w DKC3_Level_SpriteDataRAM[$00].RoutinePtrLo,y
	PHA
	LDA.w $0006,y
	STA.b $6A
	LDA.w $0038,y
	AND.w #$00FF
	ASL
	TAX
CODE_BBB9DC:
	RTL

CODE_BBB9DD:
	STA.w $194B
	STY.w $194D
	RTL

CODE_BBB9E4:
	STZ.w $194B
	STZ.w $194D
	RTL

CODE_BBB9EB:
	LDA.w $05AF
	AND.w #$0002
	BNE.b CODE_BBBA16
	LDY.w $04F9
	LDA.w $1917
	CMP.w $0012,y
	BNE.b CODE_BBBA1D
	LDA.w $1919
	CMP.w $0016,y
	BNE.b CODE_BBBA1D
	LDA.w $0028,y
	AND.w #$1010
	BNE.b CODE_BBBA1D
	LDA.w #$0004
	TRB.w $05AF
	BNE.b CODE_BBBA1D
CODE_BBBA16:
	LDA.w #$0006
	TRB.w $05AF
	RTS

CODE_BBBA1D:
	LDA.w #$0010
	TRB.w $1927
	BNE.b CODE_BBBA28
	STZ.w $1921
CODE_BBBA28:
	LDX.w $1923
	LDA.w $0012,y
	STA.w $1917
	STA.l $7E4080,x
	LDA.w $0016,y
	STA.w $1919
	CLC
	ADC.w $1921
	STA.l $7E40C0,x
	LDA.w $001E,y
	AND.w #$4000
	STA.l $7E4100,x
	LDY.w $04FB
	LDA.w $0000,y
	STA.l $7E4140,x
	INX
	INX
	TXA
	AND.w #$003F
	STA.w $1923
	CMP.w $1925
	BNE.b CODE_BBBA70
	LDA.w $1925
	INC
	INC
	AND.w #$003F
	STA.w $1925
CODE_BBBA70:
	RTS

CODE_BBBA71:
	SEC
	SBC.w #$0005
	STA.w $17D6
	TAY
	LDA.w $17D8,y
	STA.b $1A
	LDA.w $17DA,y
	STA.b $1C
	LDX.w $17DB,y
	STX.b $70
	PHK
	PEA.w CODE_BBBA8F-$01
	JMP.w [$001A]
CODE_BBBA8F:
	LDA.w $17D6
	BNE.b CODE_BBBA71
	RTS


;related to standable sprite table
CODE_BBBA95:
	LDY.w $17D6
	STA.w $17D8,y
	LDA.b $03,S
	STA.w $17DA,y
	LDA.b $70
	STA.w $17DB,y
	TYA
	CLC
	ADC.w #$0005
	STA.w $17D6
	RTL

CODE_BBBAAE:
	ASL
	BNE.b CODE_BBBAB2
	RTL

CODE_BBBAB2:
	JSL.l CODE_BB8A3F
	PEA.w ((DATA_B9B775&$FF0000)>>16)|((RESET_start&$FF0000)>>8)
	PLB
	TAX
	LDY.w DATA_B9B775,x
	LDA.w $0000,y
	STA.l $7FFFFE
	TAX
	LDA.w $0002,y
	STA.l $7F0000,x
	STA.w $0452
	LDA.w $0003,y
	STA.l $7F0001,x
	STA.w $0453
	LDA.w $0005,y
	STA.w $0456
	LDA.w #$0005
	STA.w $0450
	TYA
	CLC
	ADC.w #$0007
	TAY
CODE_BBBAEC:
	STY.b $42
	LDA.w $0000,y
	AND.w #$00FF
	BEQ.b CODE_BBBB04
	CMP.w #$0080
	BCC.b CODE_BBBB37
	CMP.w #$00FE
	BCC.b CODE_BBBB04
	BEQ.b CODE_BBBB06
	BRA.b CODE_BBBB20

CODE_BBBB04:
	PLB
	RTL

CODE_BBBB06:
	LDA.w $0001,y
	STA.w $0452
	LDA.w $0002,y
	STA.w $0453
	LDA.w $0004,y
	STA.w $0456
	TYA
	CLC
	ADC.w #$0006
	TAY
	BRA.b CODE_BBBAEC

CODE_BBBB20:
	LDA.w $0001,y
	AND.w #$00FF
	STA.b $1A
	ASL
	ASL
	ADC.b $1A
	CLC
	ADC.w $0450
	STA.w $0450
	INY
	INY
	BRA.b CODE_BBBAEC

CODE_BBBB37:
	STA.b $44
	LDA.w $0001,y
	CMP.w #$0678
	BCS.b CODE_BBBB98
CODE_BBBB41:
	PHA
	TAX
	LDA.l DATA_BC8000+$03,x
	STA.b $46
	LDA.l DATA_BC8000+$02,x
	TAY
	LDA.l DATA_BC8000,x
	TAX
	JSL.l CODE_BB8615
	PHX
	LDA.l $7FFFFE
	CLC
	ADC.w $0450
	TAX
	LDA.w $0452
	STA.l $7F0000,x
	LDA.w $0453
	STA.l $7F0001,x
	LDA.b $46
	STA.l $7F0003,x
	LDA.w $0450
	CLC
	ADC.w #$0005
	STA.w $0450
	PLA
	CLC
	ADC.w $0452
	STA.w $0452
	PLA
	CLC
	ADC.w #$0005
	DEC.b $44
	BNE.b CODE_BBBB41
	LDY.b $42
	INY
	INY
	INY
	JMP.w CODE_BBBAEC

CODE_BBBB98:
	PHY
	TAX
	STX.b $42
	LDA.l DATA_BC8000+$02,x
	TAY
	LDA.l DATA_BC8000,x
	TAX
	JSL.l CODE_BB8615
	LDA.b $42
	CMP.w #$0AB5
	ROR.b $3A
CODE_BBBBB1:
	LDA.l $7FFFFE
	CLC
	ADC.w $0450
	TAX
	LDA.w $0452
	STA.l $7F0000,x
	LDA.w $0453
	STA.l $7F0001,x
	PHX
	LDX.b $42
	LDA.l DATA_BC8000+$03,x
	PLX
	STA.l $7F0003,x
	LDA.w $0450
	CLC
	ADC.w #$0005
	STA.w $0450
	LDA.b $42
	CLC
	ADC.w #$0005
	STA.b $42
	JSR.w CODE_BBBBFB
	CLC
	ADC.w $0452
	STA.w $0452
	DEC.b $44
	BNE.b CODE_BBBBB1
	PLY
	INY
	INY
	INY
	JMP.w CODE_BBBAEC

CODE_BBBBFB:
	PHY
	PHB
	SEP.b #$20
	LDA.l $000454
	LDY.w $0452
	PHA
	PLB
	LDA.b $3B
	BMI.b CODE_BBBC38
	LDA.w $0000,y
	CLC
	ADC.w $0001,y
	ADC.w $0003,y
	STA.b $3E
	STZ.b $3F
	TDC
	LDA.w $0000,y
	ASL
	ASL
	ADC.w $0001,y
	ADC.w $0003,y
	PLB
	REP.b #$20
	ASL
	ASL
	ASL
	ASL
	ADC.b $3E
	ASL
	ADC.w #$0008
	STA.w $045E
	PLY
	RTS

CODE_BBBC38:
	LDA.w $0000,y
	CLC
	ADC.w $0001,y
	ADC.w $0003,y
	ADC.w $0008,y
	ADC.w $000A,y
	ADC.w $000C,y
	STA.b $3E
	STZ.b $3F
	TDC
	LDA.w $0000,y
	ADC.w $0008,y
	ASL
	ASL
	ADC.w $0001,y
	ADC.w $0003,y
	ADC.w $000A,y
	ADC.w $000C,y
	PLB
	REP.b #$20
	ASL
	ASL
	ASL
	ASL
	ADC.b $3E
	ASL
	ADC.w #$000E
	PLY
	RTS

CODE_BBBC73:
	LDA.w $0775
	BIT.w #$4000
	BNE.b CODE_BBBC93
	BIT.w #$2000
	BNE.b CODE_BBBC9C
	BIT.w #$1000
	BNE.b CODE_BBBCA8
	BIT.w #$8000
	BEQ.b CODE_BBBC92
	LDA.w $05E5
	CMP.w #$0008
	BEQ.b CODE_BBBCB1
CODE_BBBC92:
	RTL

CODE_BBBC93:
	PEA.w (($7E3180&$FF0000)>>16)|(($BC0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBCBA
	PLB
	RTL

CODE_BBBC9C:
	PEA.w (($7E3180&$FF0000)>>16)|(($BC0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBD77
	JSR.w CODE_BBBD8A
	PLB
	RTL

CODE_BBBCA8:
	PEA.w (($7E3180&$FF0000)>>16)|(($BC0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBDA3
	PLB
	RTL

CODE_BBBCB1:
	PEA.w (($7E3180&$FF0000)>>16)|(($BC0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBE00
	PLB
	RTL

CODE_BBBCBA:
	LDY.w #$0DAA
CODE_BBBCBD:
	TYX
	LDA.l DATA_FD341B,x
	STA.l $000022
	STA.b $3A
	AND.w #$001F
	STA.b $3C
	LDA.b $3A
	LSR
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	STA.b $3C
	LDA.b $3B
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	ASL
	TAX
	LDA.l DATA_FD41D7,x
	STA.l $000024
	LDA.w #$000E
	STA.b $3E
	LDA.w #$0012
	STA.b $40
	JSR.w CODE_BBBD04
	STA.w $7E3180,y
	DEY
	DEY
	BPL.b CODE_BBBCBD
	RTS

CODE_BBBD04:
	LDX.b $24
	LDA.b $22
	JSR.w CODE_BBBD39
	STA.b $26
	LDA.b $24
	LSR
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.b $22
	LSR
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_BBBD39
	ASL
	ASL
	ASL
	ASL
	ASL
	TSB.b $26
	LDA.b $25
	LSR
	LSR
	TAX
	LDA.b $23
	LSR
	LSR
	JSR.w CODE_BBBD39
	ASL
	ASL
	TSB.b $27
	LDA.b $26
	RTS

CODE_BBBD39:
	SEP.b #$20
	AND.b #$1F
	STA.l !REGISTER_Multiplicand
	LDA.b $3E
	STA.l !REGISTER_Multiplier
	LDA.b ($00)
	REP.b #$20
	LDA.l !REGISTER_ProductOrRemainderLo
	STA.b $3A
	SEP.b #$20
	LDA.b $40
	STA.l !REGISTER_Multiplicand
	TXA
	AND.b #$1F
	STA.l !REGISTER_Multiplier
	REP.b #$20
	LDA.b $3A
	CLC
	ADC.l !REGISTER_ProductOrRemainderLo
	LSR
	LSR
	LSR
	LSR
	LSR
	CMP.w #$001F
	BCC.b CODE_BBBD76
	LDA.w #$001F
CODE_BBBD76:
	RTS

CODE_BBBD77:
	LDX.w #$0DAA
CODE_BBBD7A:
	LDA.l DATA_FD341B,x
	LSR
	AND.w #$3DEF
	STA.w $7E3180,x
	DEX
	DEX
	BPL.b CODE_BBBD7A
	RTS

CODE_BBBD8A:
	LDX.w #$0454
CODE_BBBD8D:
	LDA.l DATA_FD341B,x
	CMP.w #$7FFF
	BEQ.b CODE_BBBD9B
CODE_BBBD96:
	DEX
	DEX
	BPL.b CODE_BBBD8D
	RTS

CODE_BBBD9B:
	LDA.w #$6318
	STA.w $7E3180,x
	BRA.b CODE_BBBD96

CODE_BBBDA3:
	LDX.w #$0DAA
CODE_BBBDA6:
	LDA.l DATA_FD341B,x
	EOR.w #$7FFF
	STA.b $1A
	AND.w #$001F
	STA.b $1E
	LSR
	LSR
	CLC
	ADC.b $1E
	SEC
	SBC.w #$0007
	BPL.b CODE_BBBDC2
	LDA.w #$0000
CODE_BBBDC2:
	STA.b $1C
	LDA.b $1A
	AND.w #$03E0
	STA.b $1E
	LSR
	LSR
	CLC
	ADC.b $1E
	SEC
	SBC.w #$00E0
	BPL.b CODE_BBBDD9
	LDA.w #$0000
CODE_BBBDD9:
	AND.w #$03E0
	TSB.b $1C
	LDA.b $1A
	AND.w #$7C00
	STA.b $1E
	LSR
	LSR
	CLC
	ADC.b $1E
	SEC
	SBC.w #$1C00
	BPL.b CODE_BBBDF3
	LDA.w #$0000
CODE_BBBDF3:
	AND.w #$7C00
	ORA.b $1C
	STA.w $7E3180,x
	DEX
	DEX
	BPL.b CODE_BBBDA6
	RTS

CODE_BBBE00:
	LDX.w #$0DAA
CODE_BBBE03:
	LDA.l DATA_FD341B,x
	STA.b $1A
	AND.w #$000F
	CLC
	ADC.w #$0006
	CMP.w #$000F
	BCC.b CODE_BBBE18
	LDA.w #$000F
CODE_BBBE18:
	EOR.b $1A
	AND.w #$000F
	EOR.b $1A
	STA.w $7E3180,x
	DEX
	DEX
	BPL.b CODE_BBBE03
	RTS

UNK_BBBE27:
	db $20

CODE_BBBE28:
	ASL
	ASL
	ASL
	ASL
	ADC.b $3E
	ASL
	ADC.w #$0008
	STA.w $045E
	PLY
	RTS

CODE_BBBE37:
	LDA.w $0000,y
	CLC
	ADC.w $0001,y
	ADC.w $0003,y
	ADC.w $0008,y
	ADC.w $000A,y
	ADC.w $000C,y
	STA.b $3E
	STZ.b $3F
	TDC
	LDA.w $0000,y
	ADC.w $0008,y
	ASL
	ASL
	ADC.w $0001,y
	ADC.w $0003,y
	ADC.w $000A,y
	ADC.w $000C,y
	PLB
	REP.b #$20
	ASL
	ASL
	ASL
	ASL
	ADC.b $3E
	ASL
	ADC.w #$000E
	PLY
	RTS

CODE_BBBE72:
	LDA.w $0775
	BIT.w #$4000
	BNE.b CODE_BBBE92
	BIT.w #$2000
	BNE.b CODE_BBBE9B
	BIT.w #$1000
	BNE.b CODE_BBBEA7
	BIT.w #$8000
	BEQ.b CODE_BBBE91
	LDA.w $05E5
	CMP.w #$0008
	BEQ.b CODE_BBBEB0
CODE_BBBE91:
	RTL

CODE_BBBE92:
	PEA.w (($7E3180&$FF0000)>>16)|(($BE0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBEB9
	PLB
	RTL

CODE_BBBE9B:
	PEA.w (($7E3180&$FF0000)>>16)|(($BE0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBF76
	JSR.w CODE_BBBF89
	PLB
	RTL

CODE_BBBEA7:
	PEA.w (($7E3180&$FF0000)>>16)|(($BE0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBFA2
	PLB
	RTL

CODE_BBBEB0:
	PEA.w (($7E3180&$FF0000)>>16)|(($BE0000&$FF0000)>>8)
	PLB
	JSR.w CODE_BBBFFF
	PLB
	RTL

CODE_BBBEB9:
	LDY.w #$0DAA
CODE_BBBEBC:
	TYX
	LDA.l DATA_FD341B+$15,x
	STA.l $000022
	STA.b $3A
	AND.w #$001F
	STA.b $3C
	LDA.b $3A
	LSR
	LSR
	LSR
	LSR
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	STA.b $3C
	LDA.b $3B
	LSR
	AND.w #$001F
	CLC
	ADC.b $3C
	ASL
	TAX
	LDA.l DATA_FD41EC,x
	STA.l $000024
	LDA.w #$000E
	STA.b $3E
	LDA.w #$0012
	STA.b $40
	JSR.w CODE_BBBF03
	STA.w $7E3180,y
	DEY
	DEY
	BPL.b CODE_BBBEBC
	RTS

CODE_BBBF03:
	LDX.b $24
	LDA.b $22
	JSR.w CODE_BBBF38
	STA.b $26
	LDA.b $24
	LSR
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.b $22
	LSR
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_BBBF38
	ASL
	ASL
	ASL
	ASL
	ASL
	TSB.b $26
	LDA.b $25
	LSR
	LSR
	TAX
	LDA.b $23
	LSR
	LSR
	JSR.w CODE_BBBF38
	ASL
	ASL
	TSB.b $27
	LDA.b $26
	RTS

CODE_BBBF38:
	SEP.b #$20
	AND.b #$1F
	STA.l !REGISTER_Multiplicand
	LDA.b $3E
	STA.l !REGISTER_Multiplier
	LDA.b ($00)
	REP.b #$20
	LDA.l !REGISTER_ProductOrRemainderLo
	STA.b $3A
	SEP.b #$20
	LDA.b $40
	STA.l !REGISTER_Multiplicand
	TXA
	AND.b #$1F
	STA.l !REGISTER_Multiplier
	REP.b #$20
	LDA.b $3A
	CLC
	ADC.l !REGISTER_ProductOrRemainderLo
	LSR
	LSR
	LSR
	LSR
	LSR
	CMP.w #$001F
	BCC.b CODE_BBBF75
	LDA.w #$001F
CODE_BBBF75:
	RTS

CODE_BBBF76:
	LDX.w #$0DAA
CODE_BBBF79:
	LDA.l DATA_FD341B+$15,x
	LSR
	AND.w #$3DEF
	STA.w $7E3180,x
	DEX
	DEX
	BPL.b CODE_BBBF79
	RTS

CODE_BBBF89:
	LDX.w #$0454
CODE_BBBF8C:
	LDA.l DATA_FD341B+$15,x
	CMP.w #$7FFF
	BEQ.b CODE_BBBF9A
CODE_BBBF95:
	DEX
	DEX
	BPL.b CODE_BBBF8C
	RTS

CODE_BBBF9A:
	LDA.w #$6318
	STA.w $7E3180,x
	BRA.b CODE_BBBF95

CODE_BBBFA2:
	LDX.w #$0DAA
CODE_BBBFA5:
	LDA.l DATA_FD341B+$15,x
	EOR.w #$7FFF
	STA.b $1A
	AND.w #$001F
	STA.b $1E
	LSR
	LSR
	CLC
	ADC.b $1E
	SEC
	SBC.w #$0007
	BPL.b CODE_BBBFC1
	LDA.w #$0000
CODE_BBBFC1:
	STA.b $1C
	LDA.b $1A
	AND.w #$03E0
	STA.b $1E
	LSR
	LSR
	CLC
	ADC.b $1E
	SEC
	SBC.w #$00E0
	BPL.b CODE_BBBFD8
	LDA.w #$0000
CODE_BBBFD8:
	AND.w #$03E0
	TSB.b $1C
	LDA.b $1A
	AND.w #$7C00
	STA.b $1E
	LSR
	LSR
	CLC
	ADC.b $1E
	SEC
	SBC.w #$1C00
	BPL.b CODE_BBBFF2
	LDA.w #$0000
CODE_BBBFF2:
	AND.w #$7C00
	ORA.b $1C
	STA.w $7E3180,x
	DEX
	DEX
	BPL.b CODE_BBBFA5
	RTS

CODE_BBBFFF:
	LDX.w #$0DAA
CODE_BBC002:
	LDA.l DATA_FD341B+$15,x
	STA.b $1A
	AND.w #$000F
	CLC
	ADC.w #$0006
	CMP.w #$000F
	BCC.b CODE_BBC017
	LDA.w #$000F
CODE_BBC017:
	EOR.b $1A
	AND.w #$000F
	EOR.b $1A
	STA.w $7E3180,x
	DEX
	DEX
	BPL.b CODE_BBC002
	RTS

if !include_garbage_data = 1
	incsrc "data/garbage_data/ADDR_BBC026.asm"
else
	padbyte $00 : pad $BBC800
endif	

org $BBC800
CODE_BBC800:
	JMP.w CODE_BBD42A

CODE_BBC803:
	JMP.w CODE_BBD64E

CODE_BBC806:
	JMP.w CODE_BBD650

CODE_BBC809:
	JMP.w CODE_BBD68C

CODE_BBC80C:
	JMP.w CODE_BBCA6F

CODE_BBC80F:
	JMP.w CODE_BBCB24

CODE_BBC812:
	JMP.w CODE_BBD046

CODE_BBC815:
	JMP.w CODE_BBCCEB

CODE_BBC818:
	JMP.w CODE_BBD015

CODE_BBC81B:
	JMP.w CODE_BBD24E

CODE_BBC81E:
	JMP.w CODE_BBD2CB

CODE_BBC821:
	JMP.w CODE_BBCAE0

CODE_BBC824:
	JMP.w CODE_BBD26A

CODE_BBC827:
	JSL.l CODE_BBAB52
	JMP.w [$04F5]

DKC3_NorSpr0124_LevelEndFlagpole_Main:
;$BBC82E
	LDA.w $0039,y
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_BBC839,x)

DATA_BBC839:
	dw CODE_BBC843
	dw CODE_BBC88A
	dw CODE_BBC939
	dw CODE_BBC956
	dw CODE_BBC96A

CODE_BBC843:
	LDA.w $0012,y
	STA.w $0054,y
	STA.w $002C,y
	LDA.w $0016,y
	STA.w $0056,y
	STA.w $0032,y
	LDA.w #$800A
	STA.w $0026,y
	JSR.w CODE_BBC982
	LDX.w $05B9
	LDA.w $0632,x
	LDY.w #$0032
	BIT.w #$0002
	BEQ.b CODE_BBC877
	LDY.w #$0034
	BIT.w #$0040
	BEQ.b CODE_BBC877
	LDY.w #$0036
CODE_BBC877:
	JSL.l CODE_BB8585
	BCS.b CODE_BBC887
	LDX.b $70
	LDY.b $76
	STX.b $5C,y
	STY.b $5C,x
	INC.b $39,x
CODE_BBC887:
	JMP.w [$04F5]

CODE_BBC88A:
	TYX
	LDA.w #$0040
	AND.b $3C,x
	STZ.b $3C,x
	BNE.b CODE_BBC897
	JMP.w CODE_BBC915

CODE_BBC897:
	LDA.w $05B9
	CMP.w #$0032
	BNE.b CODE_BBC8C7
	LDA.w $0630
	CMP.w $0536
	BEQ.b CODE_BBC8AB
	BCC.b CODE_BBC8C1
	BRA.b CODE_BBC8B3

CODE_BBC8AB:
	LDA.w $062F
	CMP.w $0535
	BCC.b CODE_BBC8C1
CODE_BBC8B3:
	LDA.w $0536
	CMP.w #$0115
	BCS.b CODE_BBC8BE
	JSR.w CODE_BBC924
CODE_BBC8BE:
	JSR.w CODE_BBC92C
CODE_BBC8C1:
	LDA.w #$0003
	STA.w $0533
CODE_BBC8C7:
	LDA.w #$0004
	JSL.l CODE_B2800F
	LDA.w #$074D
	JSL.l CODE_B28018
	LDX.b $70
	LDA.b $5E,x
	BEQ.b CODE_BBC907
	LDY.w #$007E
	LDX.w $05B9
	LDA.w $0632,x
	AND.w #$0002
	BEQ.b CODE_BBC8EC
	LDY.w #$0080
CODE_BBC8EC:
	JSL.l CODE_BB8585
	LDA.w #$0518
	JSL.l CODE_B28018
	LDA.w #$0217
	JSL.l CODE_B28018
	LDA.w #$0119
	JSL.l CODE_B28018
	LDX.b $70
CODE_BBC907:
	INC.b $39,x
	LDA.w #$8000
	TSB.w $044A
CODE_BBC90F:
	JSR.w CODE_BBC982
	JMP.w [$04F5]

CODE_BBC915:
	LDA.w #$0003
	JSL.l CODE_BEC00F
	BCS.b CODE_BBC90F
	JSR.w CODE_BBC982
	JMP.w CODE_BBC973

CODE_BBC924:
	LDY.w #$035E
	JSL.l CODE_BB85B5
	RTS

CODE_BBC92C:
	LDA.w $0535
	STA.w $062F
	LDA.w $0536
	STA.w $0630
	RTS

CODE_BBC939:
	TYX
	LDY.b $5C,x
	LDA.b $46,x
	LSR
	STA.w $005E,y
	DEC.b $46,x
	BNE.b CODE_BBC950
	INC.b $39,x
	LDY.b $5C,x
	LDA.w #$0001
	STA.w $005E,y
CODE_BBC950:
	JSR.w CODE_BBC982
	JMP.w [$04F5]

CODE_BBC956:
	TYX
	DEC.b $60,x
	BPL.b CODE_BBC96A
	INC.b $39,x
	LDA.w #$001F
	STA.w $194B
	JSL.l CODE_B8807E
	STZ.w $195B
CODE_BBC96A:
	JSR.w CODE_BBC9E4
	JSR.w CODE_BBC982
	JMP.w [$04F5]

CODE_BBC973:
	JSL.l CODE_BBAB52
	BCC.b CODE_BBC97F
	LDY.b $70
	LDX.b $5C,y
	STZ.b $5C,x
CODE_BBC97F:
	JMP.w [$04F5]

CODE_BBC982:
	LDX.b $70
	LDA.b $46,x
	AND.w #$0003
	CLC
	ADC.w #$8182
	XBA
	STA.b $58,x
	LDA.b $46,x
	AND.w #$0004
	LSR
	CLC
	ADC.w #$0022
	XBA
	ORA.w #$0007
	STA.b $68,x
	SEP.b #$20
	LDA.b #$77
	SEC
	SBC.b $46,x
	STA.b $1A
	CLC
	ADC.b #$08
	STA.b $6B,x
	LDA.b $1A
	LSR
	LSR
	LSR
	LSR
	STA.b $6C,x
	LDA.b #$00
	ADC.b #$00
	EOR.b #$01
	ASL
	ASL
	ASL
	STA.b $62,x
	REP.b #$20
	LDY.b $5C,x
	BEQ.b CODE_BBC9E3
	LDA.b $46,x
	SEC
	SBC.w #$005B
	CLC
	ADC.b $16,x
	STA.w $0016,y
	LDA.w #$0008
	BIT.b $1E,x
	BVC.b CODE_BBC9DD
	LDA.w #$FFF8
CODE_BBC9DD:
	CLC
	ADC.b $12,x
	STA.w $0012,y
CODE_BBC9E3:
	RTS

CODE_BBC9E4:
	LDX.b $70
	LDA.b $12,x
	STA.b $54,x
	LDA.b $16,x
	STA.b $56,x
	LDA.b $2C,x
	STA.b $12,x
	LDA.b $32,x
	STA.b $16,x
	JSL.l CODE_B9E000
	LDX.b $70
	LDA.b $2C,x
	LDY.b $12,x
	STA.b $12,x
	STY.b $2C,x
	LDA.b $32,x
	LDY.b $16,x
	STA.b $16,x
	STY.b $32,x
	RTS

DKC3_NorSpr02A0_LevelEndFlag_Main:
;$BBCA0D
	JMP.w (DATA_BBCA10,x)

DATA_BBCA10:
	dw $0000
	dw CODE_BBCA16
	dw CODE_BBCA21

CODE_BBCA16:
	LDA.w $005E,y
	CMP.w $0060,y
	BEQ.b CODE_BBCA21
	JSR.w CODE_BBCA33
CODE_BBCA21:
	LDX.b $5C,y
	BEQ.b CODE_BBCA2C
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBCA2C:
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBCA33:
	STA.w $0060,y
	LDX.b $62,y
	LDA.w $05B5
	BEQ.b CODE_BBCA3F
	LDX.b $64,y
CODE_BBCA3F:
	LDA.w $0060,y
	STZ.b $46
	LDY.w $04C4
	CPY.w #$0002
	BNE.b CODE_BBCA58
	LDY.w $04C6
	BEQ.b CODE_BBCA67
	LDY.w #$001E
	STY.b $46
	BRA.b CODE_BBCA67

CODE_BBCA58:
	TAY
	LDA.w $053B
	BIT.w #$0040
	BEQ.b CODE_BBCA66
	LDA.w #$001E
	STA.b $46
CODE_BBCA66:
	TYA
CODE_BBCA67:
	LDY.w #$002B
	JSL.l CODE_BBCA6F
	RTS

CODE_BBCA6F:
	STA.b $3E
	EOR.w #$FFFF
	SEC
	ADC.w #$0020
	STA.b $40
	TXA
	ASL
	TAX
	LDA.l DATA_FD3201,x
	CLC
	ADC.b $46
	STA.b $46
	TYA
	ASL
	TAX
	LDA.l DATA_FD3201,x
	STA.b $42
	LDA.w #DATA_FD341B>>16
	STA.b $44
	STA.b $48
	LDA.w #$2F80
	STA.b $1A
	LDA.w #$007E
	STA.b $1C
	LDY.w #$001C
CODE_BBCAA3:
	LDA.b [$42],y
	STA.l $000022
	LDA.b [$46],y
	STA.l $000024
	JSR.w CODE_BBCB43
	DEY
	DEY
	BPL.b CODE_BBCAA3
	LDA.b $E8
	ASL
	ASL
	TAX
	LDA.w #$7E2F80
	STA.w $06FC,x
	LDY.b $70
	LDA.w $001F,y
	AND.w #$000E
	ASL
	ASL
	ASL
	CLC
	ADC.w #$0081
	XBA
	ORA.w #$7E2F80>>16
	STA.w $06FE,x
	LDA.b $E8
	INC
	AND.w #$000F
	STA.b $E8
	RTL

CODE_BBCAE0:
	STA.b $3E
	EOR.w #$FFFF
	SEC
	ADC.w #$0020
	STA.b $40
	TXA
	ASL
	TAX
	LDA.l DATA_FD54E9,x
	STA.b $46
	TYA
	ASL
	TAX
	LDA.l DATA_FD54E9,x
	STA.b $42
	LDA.w #DATA_FD55F1>>16
	STA.b $44
	STA.b $48
	LDA.w #$7E2F80
	STA.b $1A
	LDA.w #$7E2F80>>16
	STA.b $1C
	LDY.b $1E
CODE_BBCB10:
	LDA.b [$42],y
	STA.l $000022
	LDA.b [$46],y
	STA.l $000024
	JSR.w CODE_BBCB43
	DEY
	DEY
	BPL.b CODE_BBCB10
	RTL

CODE_BBCB24:
	STX.w $0022
	AND.w #$003F
	STA.b $3E
	EOR.w #$FFFF
	SEC
	ADC.w #$0020
	STA.b $40
CODE_BBCB35:
	LDA.b [$42],y
	STA.l $000024
	JSR.w CODE_BBCB43
	DEY
	DEY
	BPL.b CODE_BBCB35
	RTL

CODE_BBCB43:
	LDX.b $24
	LDA.b $22
	JSR.w CODE_BBCB7A
	STA.b $26
	LDA.b $24
	LSR
	LSR
	LSR
	LSR
	LSR
	TAX
	LDA.b $22
	LSR
	LSR
	LSR
	LSR
	LSR
	JSR.w CODE_BBCB7A
	ASL
	ASL
	ASL
	ASL
	ASL
	TSB.b $26
	LDA.b $25
	LSR
	LSR
	TAX
	LDA.b $23
	LSR
	LSR
	JSR.w CODE_BBCB7A
	ASL
	ASL
	TSB.b $27
	LDA.b $26
	STA.b [$1A],y
	RTS

CODE_BBCB7A:
	SEP.b #$20
	AND.b #$1F
	STA.w !REGISTER_Multiplicand
	LDA.b $3E
	STA.w !REGISTER_Multiplier
	LDA.b ($00)
	REP.b #$20
	LDA.w !REGISTER_ProductOrRemainderLo
	STA.b $3A
	SEP.b #$20
	LDA.b $40
	STA.w !REGISTER_Multiplicand
	TXA
	AND.b #$1F
	STA.w !REGISTER_Multiplier
	REP.b #$20
	LDA.b $3A
	CLC
	ADC.w !REGISTER_ProductOrRemainderLo
	LSR
	LSR
	LSR
	LSR
	LSR
	CMP.w #$001F
	BCC.b CODE_BBCBB1
	LDA.w #$001F
CODE_BBCBB1:
	RTS

DKC3_NorSpr0148_ExitDoor_Main:
;$BBCBB2
	JMP.w (DATA_BBCBB5,x)

DATA_BBCBB5:
	dw CODE_BBCBB9
	dw CODE_BBCCA2

CODE_BBCBB9:
	LDA.w $0039,y
	AND.w #$00FF
	ASL
	TAX
	JMP.w (DATA_BBCBC4,x)

DATA_BBCBC4:
	dw CODE_BBCBCA
	dw CODE_BBCC08
	dw CODE_BBCC58

CODE_BBCBCA:
	TYX
	INC.b $39,x
	LDA.b $5C,x
	JSR.w CODE_BBCBFC
	STA.b $5C,x
	LDA.b $5E,x
	JSR.w CODE_BBCBFC
	STA.b $5E,x
	LDA.b $60,x
	JSR.w CODE_BBCBFC
	STA.b $60,x
	LDA.b $63,x
	AND.w #$00FF
	CLC
	ADC.b $16,x
	STA.b $64,x
	LDA.b $62,x
	AND.w #$00FF
	EOR.w #$FFFF
	SEC
	ADC.b $16,x
	STA.b $62,x
	JMP.w CODE_BBC827

CODE_BBCBFC:
	BIT.b $1E,x
	BVS.b CODE_BBCC04
	EOR.w #$FFFF
	INC
CODE_BBCC04:
	CLC
	ADC.b $12,x
	RTS

CODE_BBCC08:
	JSR.w CODE_BBCC5B
	BCC.b CODE_BBCC1B
	LDA.w $0012,y
	CMP.b $5E,x
	ROR.b $1A
	CMP.b $12,x
	ROR
	EOR.b $1A
	BMI.b CODE_BBCC1E
CODE_BBCC1B:
	JMP.w CODE_BBC827

CODE_BBCC1E:
	LDX.w $04FD
	LDA.b $1E,x
	AND.w #$CFFF
	ORA.w #$2000
	STA.b $1E,x
	LDX.b $7C
	BEQ.b CODE_BBCC39
	LDA.b $1E,x
	AND.w #$CFFF
	ORA.w #$2000
	STA.b $1E,x
CODE_BBCC39:
	LDA.w #$001D
	JSL.l CODE_B88069
	BCS.b CODE_BBCC55
	LDX.b $70
	LDA.b $4C,x
	STA.w $17CA
	LDA.b $60,x
	STA.w $17CC
	LDA.b $16,x
	STA.w $17CE
	INC.b $39,x
CODE_BBCC55:
	JMP.w [$04F5]

CODE_BBCC58:
	JMP.w [$04F5]

CODE_BBCC5B:
	LDY.b $7C
	BEQ.b CODE_BBCC62
	JSR.w CODE_BBCC6B
CODE_BBCC62:
	LDY.w $04FD
	JSR.w CODE_BBCC6B
	LDY.w $04F9
CODE_BBCC6B:
	LDX.b $70
	LDA.w $0012,y
	CMP.b $5C,x
	ROR.b $1A
	CMP.b $12,x
	ROR
	EOR.b $1A
	BPL.b CODE_BBCC97
	LDA.w $0016,y
	CMP.b $62,x
	ROR.b $1A
	CMP.b $64,x
	ROR
	EOR.b $1A
	BPL.b CODE_BBCC97
	LDA.w $001E,y
	AND.w #$CFFF
	ORA.w #$2000
	STA.w $001E,y
	SEC
	RTS

CODE_BBCC97:
	LDA.w $001E,y
	ORA.w #$3000
	STA.w $001E,y
	CLC
	RTS

CODE_BBCCA2:
	JMP.w [$04F5]

DATA_BBCCA5:
	dw CODE_BBCCAB
	dw CODE_BBCCBF
	dw CODE_BBCCE8

CODE_BBCCAB:
	TYX
	LDA.b $5C,x
	CLC
	ADC.b $12,x
	STA.b $5C,x
	LDA.b $5E,x
	CLC
	ADC.b $16,x
	STA.b $5E,x
	INC.b $38,x
	JMP.w CODE_BBC827

CODE_BBCCBF:
	TYX
	LDY.w $04F9
	LDA.w $0012,y
	CMP.b $5C,x
	BIT.b $1E,x
	BVC.b CODE_BBCCD0
	BCS.b CODE_BBCCD4
	BRA.b CODE_BBCCD7

CODE_BBCCD0:
	BCC.b CODE_BBCCD4
	BRA.b CODE_BBCCD7

CODE_BBCCD4:
	JMP.w CODE_BBC827

CODE_BBCCD7:
	LDX.b $70
	INC.b $38,x
	LDA.w #$001F
	STA.w $194B
	JSL.l CODE_B8807E
	JMP.w [$04F5]

CODE_BBCCE8:
	JMP.w [$04F5]

DKC3_NorSpr0294_KongLetters_Main:
CODE_BBCCEB:
	JMP.w (DATA_BBCCEE,x)

DATA_BBCCEE:
	dw CODE_BBCCFC
	dw CODE_BBCD71
	dw CODE_BBCD7C
	dw CODE_BBCDD2
	dw CODE_BBCE2E
	dw CODE_BBCE6B
	dw CODE_BBCEFE

CODE_BBCCFC:
	LDA.w $0066,y
	AND.w $05D7
	BEQ.b CODE_BBCD0B
	JSL.l CODE_BB8597
	JMP.w [$04F5]

CODE_BBCD0B:
	JSL.l CODE_B9A006
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCS.b CODE_BBCD1C
	JMP.w CODE_BBC827

CODE_BBCD1C:
	LDA.b $1E,x
	ORA.w #$3000
	STA.b $1E,x
	TXA
	CLC
	ADC.b $64,x
	TAY
	LDA.w $0000,y
	EOR.b $57,x
	AND.w #$00FF
	EOR.b $57,x
	JSL.l CODE_BBD64E
	INC.b $38,x
	LDA.b $66,x
	TSB.w $05D7
	LDA.w $05D7
	INC
	AND.w #$000F
	STA.b $5A,x
	BNE.b CODE_BBCD4F
	LDA.w #$0001
	JSL.l CODE_B88084
CODE_BBCD4F:
	LDA.b $68,x
	JSL.l CODE_B28012
	LDX.b $70
	LDA.w $05D7
	LSR
	BCS.b CODE_BBCD5F
	STZ.b $5C,x
CODE_BBCD5F:
	LSR
	BCS.b CODE_BBCD64
	STZ.b $5E,x
CODE_BBCD64:
	LSR
	BCS.b CODE_BBCD69
	STZ.b $60,x
CODE_BBCD69:
	LSR
	BCS.b CODE_BBCD6E
	STZ.b $62,x
CODE_BBCD6E:
	JMP.w [$04F5]

CODE_BBCD71:
	JSL.l CODE_B9A006
	JSL.l CODE_BBD68C
	JMP.w [$04F5]

CODE_BBCD7C:
	JSL.l CODE_BBD68C
	LDA.w #DATA_FC2D40
	STA.b $1A
	LDA.w #DATA_FC2D40>>16
	STA.b $1C
	LDA.w #$0008
	STA.b $1D
	LDX.b $70
	LDA.b $1E,x
	AND.w #$01E0
	JSL.l CODE_B78009
	BCS.b CODE_BBCDC2
	LDA.w #DATA_FC2D40+$0100
	STA.b $1A
	LDA.w #(DATA_FC2D40+$0100)>>16
	STA.b $1C
	LDA.w #$0008
	STA.b $1D
	LDA.b $1E,x
	AND.w #$01E0
	ORA.w #$0010
	JSL.l CODE_B78009
	BCC.b CODE_BBCDC5
	LDA.w $155E
	SBC.w #$0008
	STA.w $155E
CODE_BBCDC2:
	JMP.w [$04F5]

CODE_BBCDC5:
	LDX.b $70
	STX.w $18DD
	LDA.w #$C000
	STA.b $26,x
	INC.b $38,x
	TXY
CODE_BBCDD2:
	TYX
	LDY.w #$0003
	STZ.b $3E
	LDA.b $58,x
	STA.b $40
	SEP.b #$20
CODE_BBCDDE:
	LDA.b $5C,x
	BEQ.b CODE_BBCDEE
	LDA.b $5D,x
	CMP.b $40
	BEQ.b CODE_BBCDEE
	INC.b $5D,x
	INC.b $5D,x
	INC.b $3E
CODE_BBCDEE:
	INX
	INX
	DEY
	BPL.b CODE_BBCDDE
	REP.b #$20
	JSL.l CODE_BBD68C
	BMI.b CODE_BBCDFD
	INC.b $3E
CODE_BBCDFD:
	TXA
	CLC
	ADC.b $64,x
	TAY
	SEP.b #$20
	LDA.b $16,x
	XBA
	LDA.b $12,x
	REP.b #$20
	STA.w $0000,y
	LDA.b $3E
	BNE.b CODE_BBCE2B
	INC.b $38,x
	LDA.b $5A,x
	BNE.b CODE_BBCE2B
	INC.b $38,x
	STZ.b $6C,x
	LDA.w #$0003
CODE_BBCE1F:
	SEC
	LDY.w #$20E8
	PHA
	JSR.w CODE_BBCF16
	PLA
	DEC
	BPL.b CODE_BBCE1F
CODE_BBCE2B:
	JMP.w [$04F5]

CODE_BBCE2E:
	TYX
	DEC.b $6C,x
	BPL.b CODE_BBCE68
	TYX
	LDY.w #$0003
	STZ.b $3E
	LDA.b $59,x
	STA.b $40
	SEP.b #$20
CODE_BBCE3F:
	LDA.b $5C,x
	BEQ.b CODE_BBCE4F
	LDA.b $5D,x
	CMP.b $40
	BEQ.b CODE_BBCE4F
	DEC.b $5D,x
	DEC.b $5D,x
	INC.b $3E
CODE_BBCE4F:
	INX
	INX
	DEY
	BPL.b CODE_BBCE3F
	REP.b #$20
	LDA.b $3E
	BNE.b CODE_BBCE68
	LDA.b $70
	CMP.w $18DD
	BNE.b CODE_BBCE64
	STZ.w $18DD
CODE_BBCE64:
	JSL.l CODE_BB8597
CODE_BBCE68:
	JMP.w [$04F5]

CODE_BBCE6B:
	LDA.w #$0078
	STA.w $18D5
	LDX.b $70
	INC.b $6C,x
	LDA.b $6C,x
	CMP.w #$002F
	BCS.b CODE_BBCE95
	BIT.w #$0008
	BEQ.b CODE_BBCE8B
	LDA.b $1E,x
	AND.w #$7FFF
	STA.b $1E,x
	JMP.w [$04F5]

CODE_BBCE8B:
	LDA.b $1E,x
	ORA.w #$8000
	STA.b $1E,x
	JMP.w [$04F5]

CODE_BBCE95:
	BEQ.b CODE_BBCEE6
	CMP.w #$004B
	BCC.b CODE_BBCEED
	BEQ.b CODE_BBCED4
	CMP.w #$0067
	BCC.b CODE_BBCEDB
	BEQ.b CODE_BBCEC2
	CMP.w #$0083
	BCC.b CODE_BBCEC9
	BNE.b CODE_BBCEB3
	LDA.w #$0713
	JSL.l CODE_B28012
CODE_BBCEB3:
	LDA.w #$0003
	CLC
	JSR.w CODE_BBCF16
	BPL.b CODE_BBCEC9
	LDX.b $70
	INC.b $38,x
	BRA.b CODE_BBCEF6

CODE_BBCEC2:
	LDA.w #$0712
	JSL.l CODE_B28012
CODE_BBCEC9:
	LDA.w #$0002
	CLC
	JSR.w CODE_BBCF16
	BPL.b CODE_BBCEDB
	BRA.b CODE_BBCEF6

CODE_BBCED4:
	LDA.w #$0711
	JSL.l CODE_B28012
CODE_BBCEDB:
	LDA.w #$0001
	CLC
	JSR.w CODE_BBCF16
	BPL.b CODE_BBCEED
	BRA.b CODE_BBCEF6

CODE_BBCEE6:
	LDA.w #$0710
	JSL.l CODE_B28012
CODE_BBCEED:
	LDA.w #$0000
	CLC
	JSR.w CODE_BBCF16
	BPL.b CODE_BBCEFB
CODE_BBCEF6:
	LDA.w #$0000
	STA.b ($1A)
CODE_BBCEFB:
	JMP.w [$04F5]

CODE_BBCEFE:
	JSL.l CODE_BB8597
	LDA.w #$0001
	JSL.l CODE_B88087
	LDX.b $70
	CPX.w $18DD
	BNE.b CODE_BBCF13
	STZ.w $18DD
CODE_BBCF13:
	JMP.w [$04F5]

CODE_BBCF16:
	BCC.b CODE_BBCF32
	PHY
	JSR.w CODE_BBCF73
	LDA.b ($1A)
	AND.w #$00FF
	XBA
	STA.b ($1C)
	LDA.b ($1A)
	AND.w #$FF00
	STA.b ($1E)
	PLA
	STA.b ($20)
	LDY.w #$0001
	RTS

CODE_BBCF32:
	JSR.w CODE_BBCF73
	LDA.b ($1A)
	BEQ.b CODE_BBCF72
	LDA.w #$0200
	STA.b $3E
	LDA.b ($20)
	XBA
	AND.w #$FF00
	SEC
	SBC.b ($1C)
	JSR.w CODE_BBCF8E
	CLC
	ADC.b ($1C)
	STA.b ($1C)
	AND.w #$FF00
	XBA
	STA.b ($1A)
	LDA.w #$0040
	STA.b $3E
	LDA.b ($20)
	AND.w #$FF00
	SEC
	SBC.b ($1E)
	JSR.w CODE_BBCF8E
	CLC
	ADC.b ($1E)
	STA.b ($1E)
	AND.w #$FF00
	ORA.b ($1A)
	STA.b ($1A)
	DEY
CODE_BBCF72:
	RTS

CODE_BBCF73:
	ASL
	ASL
	TAX
	LDY.w #$FFFA
CODE_BBCF79:
	LDA.l DATA_BBCFB0,x
	AND.w #$00FF
	CLC
	ADC.b $70
	STA.w $0020,y
	INX
	INY
	INY
	BMI.b CODE_BBCF79
	BEQ.b CODE_BBCF79
	RTS

CODE_BBCF8E:
	BEQ.b CODE_BBCF9E
	BCS.b CODE_BBCFA0
	EOR.w #$FFFF
	INC
	JSR.w CODE_BBCFA0
	EOR.w #$FFFF
	INC
	RTS

CODE_BBCF9E:
	DEY
	RTS

CODE_BBCFA0:
	CMP.w #$0100
	BCC.b CODE_BBCFAF
	LSR
	LSR
	LSR
	LSR
	CMP.b $3E
	BCS.b CODE_BBCFAF
	LDA.b $3E
CODE_BBCFAF:
	RTS

DATA_BBCFB0:
	db $5C,$10,$12,$64,$5E,$14,$16,$66,$60,$2A,$2C,$58,$62,$30,$32,$5A

DKC3_NorSpr014C_SpawnedRegularBanana_Main:
;$BBCFC0
	JMP.w (DATA_BBCFC3,x)

DATA_BBCFC3:
	dw CODE_BBCFC7
	dw CODE_BBCFE2

CODE_BBCFC7:
	TYX
	LDA.b $1E,x
	EOR.w $18F7
	AND.w #$F000
	EOR.w $18F7
	STA.b $1E,x
	STZ.b $26,x
	INC.b $38,x
	LDA.b $40,x
	JSL.l CODE_B9A000
	JMP.w [$04F5]

CODE_BBCFE2:
	JSL.l CODE_B9A006
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCS.b CODE_BBCFF3
	JMP.w CODE_BBC827

CODE_BBCFF3:
	LDA.w #$0001
	SED
	CLC
	ADC.w $05D3
	STA.w $05D3
	CLD
	JSL.l CODE_B7E4A8
	LDX.w #$0000
	JSL.l CODE_B7E4A2
	LDX.b $70
	STZ.b $1E,x
	JSL.l CODE_BB8591
	JMP.w [$04F5]

DKC3_NorSpr0298_Bananas_Main:
CODE_BBD015:
	JMP.w (DATA_BBD018,x)

DATA_BBD018:
	dw CODE_BBD01C
	dw CODE_BBD046

CODE_BBD01C:
	JSL.l CODE_B9A006
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCS.b CODE_BBD02D
	JMP.w CODE_BBC827

CODE_BBD02D:
	LDA.w #$0001
	STA.b $38,x
	STZ.b $26,x
	LDA.b $68,x
	SED
	CLC
	ADC.w $05D3
	STA.w $05D3
	CLD
	JSL.l CODE_B7E4A8
	JMP.w [$04F5]

CODE_BBD046:
	LDA.b $00
	AND.w #$0003
	BNE.b CODE_BBD073
	LDX.w #$F8F8
	JSL.l CODE_B7E4A2
	LDX.b $70
	LDA.b $26,x
	AND.w #$C000
	EOR.w #$C000
	STA.b $26,x
	LDA.b $68,x
	SEP.b #$09
	SBC.w #$0001
	STA.b $68,x
	CLD
	BNE.b CODE_BBD073
	JSL.l CODE_BB8597
	JMP.w [$04F5]

CODE_BBD073:
	JSL.l CODE_B9A006
	JMP.w [$04F5]

DKC3_NorSpr0154_GreenBananaSpawner_Main:
;$BBD07A
	JMP.w (DATA_BBD07D,x)

DATA_BBD07D:
	dw CODE_BBD085
	dw CODE_BBD09D
	dw CODE_BBD100
	dw CODE_BBD103

CODE_BBD085:
	TYX
	LDA.w #$0003
	STA.b $38,x
	LDA.b $5E,x
	STA.w $1C3F
	LDA.w #$001F
	STA.w $06CF
	JSL.l CODE_808060
	JMP.w [$04F5]

CODE_BBD09D:
	LDA.w $005E,y
	BEQ.b CODE_BBD0FC
CODE_BBD0A2:
	JSL.l CODE_808063
	CMP.w $1C3F
	BCS.b CODE_BBD0A2
	STA.w $1C41
	LDY.w #$0280
	JSL.l CODE_BB85B5
	BCS.b CODE_BBD0F9
	LDA.w #$071A
	JSL.l CODE_B28012
	LDX.b $76
	LDY.b $70
	STY.b $5C,x
	LDA.w $0064,y
	STA.b $5E,x
	LDA.w $0062,y
	STA.b $60,x
	LDA.w $1C41
	ASL
	ASL
	CLC
	ADC.w $005C,y
	TAY
	PEA.w ((DATA_FFB5AD&$FF0000)>>16)|((DKC3_NorSpr0154_GreenBananaSpawner_Main&$FF0000)>>8)
	PLB
	LDA.w $0000,y
	STA.b $12,x
	LDA.b $60,x
	BEQ.b CODE_BBD0EF
	LDA.w $0002,y
	CLC
	ADC.l $001973
	BRA.b CODE_BBD0F2

CODE_BBD0EF:
	LDA.w $0002,y
CODE_BBD0F2:
	STA.b $16,x
	PLB
	LDX.b $70
	INC.b $38,x
CODE_BBD0F9:
	JMP.w [$04F5]

CODE_BBD0FC:
	JSL.l CODE_BB8591
CODE_BBD100:
	JMP.w [$04F5]

CODE_BBD103:
	TYX
	DEC.b $60,x
	BPL.b CODE_BBD0F9
	LDA.w #$0001
	STA.b $38,x
	JMP.w [$04F5]

DKC3_NorSpr0150_GreenBanana_Main:
;$BBD110
	JMP.w (DATA_BBD113,x)

DATA_BBD113:
	dw CODE_BBD117
	dw CODE_BBD132

CODE_BBD117:
	TYX
	LDA.b $1E,x
	EOR.w $18F7
	AND.w #$F000
	EOR.w $18F7
	STA.b $1E,x
	STZ.b $26,x
	INC.b $38,x
	LDA.b $40,x
	JSL.l CODE_B9A000
	JMP.w [$04F5]

CODE_BBD132:
	JSL.l CODE_B9A006
	DEC.b $5E,x
	BPL.b CODE_BBD152
	JSR.w CODE_BBD1AB
	INC.b $5E,x
	LDX.w $1C41
	LDA.w $06AF,x
	EOR.w #$0080
	STA.w $06AF,x
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBD152:
	LDA.b $5E,x
	CMP.w #$0030
	BCS.b CODE_BBD171
	AND.w #$0030
	LSR
	LSR
	LSR
	TAY
	LDA.w DATA_BBD181,y
	AND.b $00
	BNE.b CODE_BBD171
	LDA.b $26,x
	AND.w #$C000
	EOR.w #$C000
	STA.b $26,x
CODE_BBD171:
	JSL.l CODE_BCE425
	LDA.w #$08AA
	JSL.l CODE_BEC012
	BCS.b CODE_BBD189
	JMP.w [$04F5]

DATA_BBD181:
	dw $0001,$0003,$0007,$000F

CODE_BBD189:
	LDX.w #$F8F8
	JSL.l CODE_B7E4A2
	JSR.w CODE_BBD1AB
	LDA.w $18EF
	SEP.b #$09
	ADC.w $05D3
	BPL.b CODE_BBD1A0
	LDA.w #$0000
CODE_BBD1A0:
	STA.w $05D3
	CLD
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBD1AB:
	LDY.b $70
	LDX.b $5C,y
	INC.b $38,x
	DEC.b $5E,x
	LDA.w #$0020
	STA.b $60,x
	RTS

DKC3_NorSpr029C_ExtraLifeBalloon_Main:
;$BBD1B9
	JMP.w (DATA_BBD1BC,x)

DATA_BBD1BC:
	dw CODE_BBD1C2
	dw CODE_BBD213
	dw CODE_BBD234

CODE_BBD1C2:
	LDA.w $194B
	BIT.w #$0004
	BNE.b CODE_BBD1EE
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCS.b CODE_BBD1F1
CODE_BBD1D4:
	JSL.l CODE_B9A006
	LDA.b $6C,x
	CMP.w #$8000
	BNE.b CODE_BBD1E2
	JMP.w CODE_BBC827

CODE_BBD1E2:
	DEC.b $6C,x
	BPL.b CODE_BBD1EE
	JSL.l CODE_B9E000
	JSL.l CODE_BBAB46
CODE_BBD1EE:
	JMP.w [$04F5]

CODE_BBD1F1:
	LDA.w #$0714
	JSL.l CODE_B28012
	LDX.b $70
	LDA.b $5C,x
	JSL.l CODE_B88084
	LDA.w #$0002
	STA.b $38,x
	LDA.w #$28D4
	JSL.l CODE_BBD64E
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBD213:
	LDA.w #$0010
	BIT.w $05D7
	BNE.b CODE_BBD22D
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCC.b CODE_BBD1D4
	LDA.w #$0010
	TSB.w $05D7
	BRA.b CODE_BBD1F1

CODE_BBD22D:
	JSL.l CODE_BB8597
	JMP.w [$04F5]

CODE_BBD234:
	JSL.l CODE_BBD68C
	BMI.b CODE_BBD241
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBD241:
	LDA.b $5C,x
	JSL.l CODE_B88087
	JSL.l CODE_BB8597
	JMP.w [$04F5]

DKC3_NorSpr0284_BearCoin_Main:
CODE_BBD24E:
	JSL.l CODE_B9A006
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCS.b CODE_BBD25F
	JMP.w CODE_BBC827

CODE_BBD25F:
	LDX.b $70
	LDA.b $6C,x
	JSL.l CODE_BBD42A
	JMP.w [$04F5]

DKC3_NorSpr0288_UnknownSprite0288_Main:
CODE_BBD26A:
	JSL.l CODE_B9A006
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCS.b CODE_BBD27B
	JMP.w [$04F5]

CODE_BBD27B:
	LDY.b $78
	CPY.w $04FD
	BNE.b CODE_BBD294
	LDA.w $0038,y
	ASL
	ASL
	TAX
	LDA.l DATA_B8A191+$02,x
	AND.w #$0080
	BNE.b CODE_BBD294
	JMP.w [$04F5]

CODE_BBD294:
	LDX.b $70
	LDA.b $6C,x
	JSL.l CODE_BBD42A
	JMP.w [$04F5]

DKC3_NorSpr02A4_UnknownSprite02A4_Main:
;$BBD29F
	JMP.w (DATA_BBD2A2,x)

DATA_BBD2A2:
	dw CODE_BBD2A6
	dw CODE_BBD2B8

CODE_BBD2A6:
	TYX
	DEC.b $5C,x
	BPL.b CODE_BBD2AD
	INC.b $38,x
CODE_BBD2AD:
	JSL.l CODE_B9E000
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBD2B8:
	TYX
	LDY.w $04F9
	JSL.l CODE_BEC003
	BCC.b CODE_BBD2AD
	LDA.b $6C,x
	JSL.l CODE_BBD42A
	JMP.w [$04F5]

DKC3_NorSpr028C_BonusBCoin_Main:
CODE_BBD2CB:
	JMP.w (DATA_BBD2CE,x)

DATA_BBD2CE:
	dw CODE_BBD2D8
	dw CODE_BBD2F1
	dw CODE_BBD349
	dw CODE_BBD2D8
	dw CODE_BBD350

CODE_BBD2D8:
	LDY.w #$0014
	JSL.l CODE_BB8585
	BCS.b CODE_BBD2EE
	LDX.b $70
	INC.b $38,x
	LDA.b $38,x
	AND.w #$00FF
	ASL
	TAX
	BRA.b CODE_BBD2CB

CODE_BBD2EE:
	JMP.w [$04F5]

CODE_BBD2F1:
	JSL.l CODE_B9A006
	JSL.l CODE_BCE425
	JSL.l CODE_BEC012
	BCS.b CODE_BBD302
	JMP.w [$04F5]

CODE_BBD302:
	LDY.b $78
	CPY.w $04FD
	BNE.b CODE_BBD31B
	LDA.w $0038,y
	ASL
	ASL
	TAX
	LDA.l DATA_B8A191+$02,x
	AND.w #$0080
	BNE.b CODE_BBD31B
	JMP.w [$04F5]

CODE_BBD31B:
	LDX.b $70
	LDA.b $12,x
	STA.w $195F
	LDA.b $16,x
	STA.w $1961
	LDA.b $5C,x
	BNE.b CODE_BBD334
	LDA.b $6C,x
	JSL.l CODE_BBD42A
	JMP.w [$04F5]

CODE_BBD334:
	LDA.w #$0002
	LDY.w $04F9
	CPY.b $78
	BEQ.b CODE_BBD341
	LDA.w #$0006
CODE_BBD341:
	TSB.w $05B1
	INC.b $38,x
	JMP.w [$04F5]

CODE_BBD349:
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBD350:
	JSL.l CODE_B9A006
	JSL.l CODE_BCE425
	LDA.w #$0040
	JSL.l CODE_BEC000
	BCS.b CODE_BBD364
	JMP.w [$04F5]

CODE_BBD364:
	LDX.b $70
	LDA.b $5C,x
	BNE.b CODE_BBD373
	LDA.b $6C,x
	JSL.l CODE_BBD42A
	JMP.w [$04F5]

CODE_BBD373:
	LDA.w #$0002
	TSB.w $05B1
	LDA.w #$0002
	STA.b $38,x
	JMP.w [$04F5]

DKC3_NorSpr0290_CollectableCog_Main:
;$BBD381
	JMP.w (DATA_BBD384,x)

DATA_BBD384:
	dw CODE_BBD38C
	dw CODE_BBD3B1
	dw CODE_BBD3CC
	dw CODE_BBD3FC

CODE_BBD38C:
	LDX.b $60,y
	LDA.b $00,x
	STA.w !REGISTER_DividendLo
	SEP.b #$20
	LDA.b #$0A
	STA.w !REGISTER_Divisor
	TYX
	STX.w $18DF
	INC.b $38,x
	BIT.b $00
	LDA.w !REGISTER_QuotientLo
	XBA
	LDA.w !REGISTER_ProductOrRemainderLo
	REP.b #$20
	STA.w $005E,y
	JMP.w [$04F5]

CODE_BBD3B1:
	TYX
	LDA.b $16,x
	INC
	CMP.b $14,x
	BMI.b CODE_BBD3BD
	INC.b $38,x
	BRA.b CODE_BBD3C5

CODE_BBD3BD:
	STA.b $16,x
	SEP.b #$20
	INC.b $5D,x
	REP.b #$20
CODE_BBD3C5:
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBD3CC:
	TYX
	LDA.b $62,x
	BEQ.b CODE_BBD3D7
	DEC.b $62,x
	BNE.b CODE_BBD3D7
	INC.b $38,x
CODE_BBD3D7:
	LDA.w $0064,y
	LDX.b $60,y
	CMP.b $00,x
	BEQ.b CODE_BBD3F1
	BCS.b CODE_BBD3F8
	DEC.b $00,x
CODE_BBD3E4:
	LDA.w #$0000
	STA.w $0038,y
	LDA.w #$071A
	JSL.l CODE_B28012
CODE_BBD3F1:
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBD3F8:
	INC.b $00,x
	BRA.b CODE_BBD3E4

CODE_BBD3FC:
	CPY.w $18DF
	BNE.b CODE_BBD427
	JSL.l CODE_B9A006
	DEC.b $62,x
	BMI.b CODE_BBD40C
	JMP.w [$04F5]

CODE_BBD40C:
	DEC.b $16,x
	DEC.b $16,x
	LDA.b $5C,x
	SEC
	SBC.w #$0200
	STA.b $5C,x
	BPL.b CODE_BBD427
	CMP.w #$E800
	BCS.b CODE_BBD427
	CPX.w $18DF
	BNE.b CODE_BBD427
	STZ.w $18DF
CODE_BBD427:
	JMP.w [$04F5]

CODE_BBD42A:
	PHK
	PLB
	ASL
	ASL
	ASL
	ASL
	TAY
	LDA.w DATA_BBD4B7,y
	STA.b $1A
	PHY
	PEA.w CODE_BBD43D-$01
	JMP.w ($001A)
CODE_BBD43D:
	PLY
	LDX.w DATA_BBD4B7+$02,y
	LDA.b $00,x
	STA.w !REGISTER_DividendLo
	STA.b $3A
	CLC
	ADC.w DATA_BBD4B7+$04,y
	CMP.w DATA_BBD4B7+$06,y
	BCC.b CODE_BBD454
	LDA.w DATA_BBD4B7+$06,y
CODE_BBD454:
	STA.b $00,x
	SEP.b #$20
	LDA.b #$0A
	STA.w !REGISTER_Divisor
	REP.b #$20
	LDA.b $00,x
	SEC
	SBC.b $3A
	LDX.b $70
	STA.b $60,x
	SEP.b #$20
	LDA.w !REGISTER_QuotientLo
	XBA
	LDA.w !REGISTER_ProductOrRemainderLo
	REP.b #$20
	STA.b $5E,x
	LDA.w DATA_BBD4B7+$02,y
	STA.b $6A,x
	LDA.w DATA_BBD4B7+$08,y
	STA.b $62,x
	AND.w #$00FF
	ORA.w #$E800
	STA.b $5C,x
	LDA.w DATA_BBD4B7+$0A,y
	JSL.l CODE_BBD64E
	LDA.w DATA_BBD4B7+$0C,y
	STA.b $64,x
	LDA.w DATA_BBD4B7+$0E,y
	BEQ.b CODE_BBD4A0
	STA.b $66,x
	STZ.b $68,x
	JSL.l CODE_B28012
CODE_BBD4A0:
	LDA.w #CODE_BBD577
	STA.b $02,x
	LDA.w #((CODE_BBD577&$FF0000)>>16)|((CODE_BBD577&$FF0000)>>8)
	STA.b $04,x
	LDA.b $1E,x
	ORA.w #$3000
	STA.b $1E,x
	LDA.w #$00FF
	STA.b $0E,x
	RTL

DATA_BBD4B7:
	dw CODE_BBD517,$05C9,$0001,$0063,$0A88,$1E78,$0078,$071A
	dw CODE_BBD51C,$05CF,$0001,$0029,$1088,$2C70,$0078,$071C
	dw CODE_BBD52D,$05CB,$0001,$0055,$0E88,$2874,$0078,$041B
	dw CODE_BBD56B,$05CD,$0001,$000D,$0488,$1C78,$0078,$071A
	dw CODE_BBD570,$05D1,$0001,$0005,$0A88,$2278,$0078,$071A
	dw CODE_BBD52D,$05CB,$0000,$0055,$0E88,$2874,$0078,$041B

CODE_BBD517:
	LDX.b $70
	STZ.b $38,x
	RTS

CODE_BBD51C:
	LDX.b $70
	STZ.b $38,x
	LDX.w $05B9
	LDA.w $0632,x
	ORA.w #$0020
	STA.w $0632,x
	RTS

CODE_BBD52D:
	LDX.b $70
	STZ.b $38,x
	LDA.w #$0008
	LDY.w $04EA
	CPY.w #$0002
	BEQ.b CODE_BBD544
	LDA.w #$0004
	BCC.b CODE_BBD544
	LDA.w #$0010
CODE_BBD544:
	LDX.w $05B9
	ORA.w $0632,x
	STA.w $0632,x
	LDA.w #$0002
	LDY.w $04F9
	CPY.b $78
	BEQ.b CODE_BBD55A
	LDA.w #$0006
CODE_BBD55A:
	TSB.w $05B1
	LDA.w #$0008
	AND.w $053B
	BEQ.b CODE_BBD56A
	LDA.w #$0050
	STA.b $03,S
CODE_BBD56A:
	RTS

CODE_BBD56B:
	LDX.b $70
	STZ.b $38,x
	RTS

CODE_BBD570:
	LDX.b $70
	STZ.b $38,x
	INC.w $0603
CODE_BBD577:
	RTS

CODE_BBD578:
	JMP.w (DATA_BBD57B,x)

DATA_BBD57B:
	dw CODE_BBD581
	dw CODE_BBD5B8
	dw CODE_BBD61C

CODE_BBD581:
	LDA.w $18DF
	BNE.b CODE_BBD58F
	STY.w $18DF
	LDA.w #$00FF
	STA.w $000E,y
CODE_BBD58F:
	LDA.w $005C,y
	CLC
	ADC.w #$0200
	BMI.b CODE_BBD5A0
	CMP.w $0062,y
	BCC.b CODE_BBD5A0
	LDA.w $0062,y
CODE_BBD5A0:
	STA.w $005C,y
	JSL.l CODE_B9A006
	JSL.l CODE_BBD68C
	BPL.b CODE_BBD5B5
	LDA.b $5C,x
	CMP.b $62,x
	BNE.b CODE_BBD5B5
	INC.b $38,x
CODE_BBD5B5:
	JMP.w [$04F5]

CODE_BBD5B8:
	CPY.w $18DF
	BEQ.b CODE_BBD5D9
	LDX.w $18DF
	LDA.b $38,x
	CMP.w #$0002
	BCS.b CODE_BBD5D0
	LDA.b $6A,x
	CMP.w $006A,y
	BEQ.b CODE_BBD60D
	BRA.b CODE_BBD606

CODE_BBD5D0:
	STY.w $18DF
	LDA.w #$00FF
	STA.w $000E,y
CODE_BBD5D9:
	LDA.b $00
	AND.w #$0007
	BNE.b CODE_BBD606
	TYX
	DEC.b $60,x
	BMI.b CODE_BBD604
	LDA.b $66,x
	CMP.b $68,x
	STA.b $68,x
	BNE.b CODE_BBD5F1
	JSL.l CODE_B28012
CODE_BBD5F1:
	LDA.b $5E,x
	CMP.w #$0909
	BEQ.b CODE_BBD604
	SED
	ADC.w #$0091
	AND.w #$0F0F
	CLD
	STA.b $5E,x
	BRA.b CODE_BBD606

CODE_BBD604:
	INC.b $38,x
CODE_BBD606:
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBD60D:
	LDA.b $60,x
	CLC
	ADC.w $0060,y
	STA.b $60,x
	JSL.l CODE_BB8597
	JMP.w [$04F5]

CODE_BBD61C:
	CPY.w $18DF
	BNE.b CODE_BBD647
	JSL.l CODE_B9A006
	DEC.b $64,x
	BMI.b CODE_BBD62C
	JMP.w [$04F5]

CODE_BBD62C:
	DEC.b $16,x
	DEC.b $16,x
	LDA.b $5C,x
	SEC
	SBC.w #$0200
	STA.b $5C,x
	BPL.b CODE_BBD64B
	CMP.w #$F000
	BCS.b CODE_BBD64B
	CPX.w $18DF
	BNE.b CODE_BBD647
	STZ.w $18DF
CODE_BBD647:
	JSL.l CODE_BB8597
CODE_BBD64B:
	JMP.w [$04F5]

CODE_BBD64E:
	LDX.b $70
CODE_BBD650:
	STA.b $2E,x
	SEP.b #$20
	STZ.b $2E,x
	STZ.b $2A,x
	STA.b $2B,x
	REP.b #$20
	LDA.w #$8000
	STA.b $26,x
	LDA.b $12,x
	SEC
	SBC.w $196D
	BCS.b CODE_BBD66C
	LDA.w #$0000
CODE_BBD66C:
	CMP.w #$0100
	BCC.b CODE_BBD674
	LDA.w #$00FF
CODE_BBD674:
	STA.b $12,x
	LDA.b $16,x
	SEC
	SBC.w $1973
	BCS.b CODE_BBD681
	LDA.w #$0000
CODE_BBD681:
	CMP.w #$0100
	BCC.b CODE_BBD689
	LDA.w #$00FF
CODE_BBD689:
	STA.b $16,x
	RTL

CODE_BBD68C:
	LDY.w #$0002
	LDX.b $70
	LDA.b $2A,x
	SEC
	SBC.b $11,x
	JSR.w CODE_BBD6AD
	CLC
	ADC.b $11,x
	STA.b $11,x
	LDA.b $2E,x
	SEC
	SBC.b $15,x
	JSR.w CODE_BBD6AD
	CLC
	ADC.b $15,x
	STA.b $15,x
	DEY
	RTL

CODE_BBD6AD:
	BEQ.b CODE_BBD6BD
	BCS.b CODE_BBD6BF
	EOR.w #$FFFF
	INC
	JSR.w CODE_BBD6BF
	EOR.w #$FFFF
	INC
	RTS

CODE_BBD6BD:
	DEY
	RTS

CODE_BBD6BF:
	CMP.w #$0100
	BCC.b CODE_BBD6CF
	LSR
	LSR
	LSR
	CMP.w #$0080
	BCS.b CODE_BBD6CF
	LDA.w #$0080
CODE_BBD6CF:
	RTS

DKC3_NorSpr02A8_BonusLevelTimer_Main:
;$BBD6D0
	JMP.w (DATA_BBD6D3,x)

DATA_BBD6D3:
	dw CODE_BBD6E9
	dw CODE_BBD793
	dw CODE_BBD796
	dw CODE_BBD798
	dw CODE_BBD79F
	dw CODE_BBD7AC
	dw CODE_BBD7FE
	dw CODE_BBD836
	dw CODE_BBD83C
	dw CODE_BBD842
	dw CODE_BBD8B6

CODE_BBD6E9:
	LDY.w #$0010
	JSL.l CODE_BB8585
	BCC.b CODE_BBD6F5
	JMP.w [$04F5]

CODE_BBD6F5:
	LDX.b $70
	LDY.b $76
	STY.b $5C,x
	STX.b $5C,y
	LDA.b $24,x
	STA.b $6C,x
	STX.w $18E1
	JSR.w CODE_BBD915
	TXY
	LDA.w $075E
	AND.w #$00FF
	ASL
	TAX
	JSR.w (DATA_BBD716,x)
	JMP.w [$04F5]

DATA_BBD716:
	dw CODE_BBD722
	dw CODE_BBD722
	dw CODE_BBD729
	dw CODE_BBD739
	dw CODE_BBD75E
	dw CODE_BBD783

CODE_BBD722:
	LDA.w #$0002
	STA.w $0038,y
	RTS

CODE_BBD729:
	LDA.w #$0003
	STA.w $0038,y
	LDA.w $075F
	AND.w #$00FF
	STA.w $051D
	RTS

CODE_BBD739:
	LDA.w #$0004
	STA.w $0038,y
	LDA.w $05D3
	ORA.w #$8000
	STA.w $18F1
	LDA.w $075F
	AND.w #$00FF
	STA.w $05D3
	STA.w $18CB
	STA.w $18CD
	LDA.w #$9998
	STA.w $18EF
	RTS

CODE_BBD75E:
	LDA.w #$0005
	STA.w $0038,y
	LDA.w $05D3
	ORA.w #$8000
	STA.w $18F1
	LDA.w $075F
	AND.w #$00FF
	STA.w $05D3
	STA.w $18CB
	STA.w $18CD
	LDA.w #$9998
	STA.w $18EF
	RTS

CODE_BBD783:
	LDA.w #$0009
	STA.w $0038,y
	LDA.w $075F
	AND.w #$00FF
	STA.w $051D
	RTS

CODE_BBD793:
	JMP.w [$04F5]

CODE_BBD796:
	BRA.b CODE_BBD7D8

CODE_BBD798:
	LDA.w $051D
	BNE.b CODE_BBD7D8
	BRA.b CODE_BBD7B9

CODE_BBD79F:
	LDA.w #$0064
	STA.w $18CF
	LDA.w $05D3
	BNE.b CODE_BBD7D8
	BRA.b CODE_BBD7B9

CODE_BBD7AC:
	LDA.w #$0064
	STA.w $18CF
	LDA.w $05D3
	BNE.b CODE_BBD7D8
	BRA.b CODE_BBD7B9

CODE_BBD7B9:
	LDA.w #$0001
	TSB.w $194F
	BNE.b CODE_BBD7D8
	LDA.w #$0518
	JSL.l CODE_B28018
	LDA.w #$0217
	JSL.l CODE_B28018
	LDA.w #$0119
	JSL.l CODE_B28018
	BRA.b CODE_BBD7D8

CODE_BBD7D8:
	JSR.w CODE_BBD8C9
	JSR.w CODE_BBD944
	LDA.b $62,x
	BMI.b CODE_BBD7EA
	JSR.w CODE_BBD974
	BCS.b CODE_BBD7EA
	JMP.w [$04F5]

CODE_BBD7EA:
	LDA.w #$001F
	LDY.w #$0004
	JSL.l CODE_BB85D0
	LDX.b $70
	LDA.w #$0006
	STA.b $38,x
	JMP.w [$04F5]

CODE_BBD7FE:
	JSR.w CODE_BBD974
	BCS.b CODE_BBD81E
	LDX.b $70
	LDA.w #$0007
	STA.b $38,x
	LDA.w #$001F
	LDY.w #$0400
	JSL.l CODE_BB85D0
	LDA.w #$0027
	JSL.l CODE_B88069
	JMP.w [$04F5]

CODE_BBD81E:
	LDA.w #$0028
	JSL.l CODE_B88069
	BCS.b CODE_BBD833
	LDX.b $70
	LDA.b $66,x
	STA.w $17CA
	LDA.w #$0008
	STA.b $38,x
CODE_BBD833:
	JMP.w [$04F5]

CODE_BBD836:
	STY.w $18E1
	JMP.w [$04F5]

CODE_BBD83C:
	STZ.w $18E1
	JMP.w [$04F5]

CODE_BBD842:
	LDA.w $051D
	BNE.b CODE_BBD864
	LDA.w #$0001
	TSB.w $194F
	BNE.b CODE_BBD864
	LDA.w #$0518
	JSL.l CODE_B28018
	LDA.w #$0217
	JSL.l CODE_B28018
	LDA.w #$0119
	JSL.l CODE_B28018
CODE_BBD864:
	JSR.w CODE_BBD8C9
	JSR.w CODE_BBD944
	LDA.b $62,x
	BMI.b CODE_BBD88A
	JSR.w CODE_BBD974
	BCS.b CODE_BBD876
	JMP.w [$04F5]

CODE_BBD876:
	LDA.w #$000A
	STA.b $38,x
	LDA.w #$0078
	STA.b $66,x
	LDA.w #$0003
	JSL.l CODE_B2800F
	JMP.w [$04F5]

CODE_BBD88A:
	LDA.w #$0007
	STA.b $38,x
	LDA.w #$0002
	JSL.l CODE_B2800F
	JSR.w CODE_BBD89C
	JMP.w [$04F5]

CODE_BBD89C:
	LDA.w #$0001
	TSB.w $05AF
	BNE.b CODE_BBD8AB
	LDA.w #$820F
	JSL.l CODE_808024
CODE_BBD8AB:
	LDA.w #$001F
	LDY.w #$0004
	JSL.l CODE_BB85D0
	RTS

CODE_BBD8B6:
	TYX
	DEC.b $66,x
	BPL.b CODE_BBD8C3
	LDA.w #$0008
	STA.b $38,x
	JSR.w CODE_BBD89C
CODE_BBD8C3:
	STZ.w $18E1
	JMP.w [$04F5]

CODE_BBD8C9:
	LDX.b $70
	LDA.b $64,x
	SEC
	SBC.w #$0100
	BCC.b CODE_BBD8D6
	STA.b $64,x
	RTS

CODE_BBD8D6:
	SEP.b #$20
	STA.b $65,x
	REP.b #$20
	DEC.b $62,x
	BMI.b CODE_BBD914
	JSR.w CODE_BBD915
	LDA.b $62,x
	CMP.w #$0006
	BCC.b CODE_BBD906
	CMP.w #$000B
	BCC.b CODE_BBD8F7
	LDA.w #$0563
	JSL.l CODE_B28018
	RTS

CODE_BBD8F7:
	LDA.w #$0564
	JSL.l CODE_B28018
	LDA.w #$0062
	JSL.l CODE_B28018
	RTS

CODE_BBD906:
	LDA.w #$0565
	JSL.l CODE_B28018
	LDA.w #$0062
	JSL.l CODE_B28018
CODE_BBD914:
	RTS

CODE_BBD915:
	LDX.b $70
	LDA.b $62,x
	STA.w !REGISTER_DividendLo
	SEP.b #$20
	LDA.b #$0A
	STA.w !REGISTER_Divisor
	REP.b #$20
	LDA.b ($00)
	NOP
	LDY.b $5C,x
	LDA.w !REGISTER_QuotientLo
	ASL
	ASL
	ADC.w !REGISTER_QuotientLo
	ADC.b $6C,x
	STA.b $24,x
	LDA.w !REGISTER_ProductOrRemainderLo
	ASL
	ASL
	ADC.w !REGISTER_ProductOrRemainderLo
	ADC.b $6C,x
	STA.w $0024,y
	RTS

CODE_BBD944:
	LDX.b $70
	LDY.b $5C,x
	LDA.b $62,x
	BEQ.b CODE_BBD964
	CMP.w #$0006
	BCC.b CODE_BBD95F
	CMP.w #$000B
	BCC.b CODE_BBD95A
	STX.w $18E1
	RTS

CODE_BBD95A:
	LDA.w #$0007
	BRA.b CODE_BBD967

CODE_BBD95F:
	LDA.w #$0003
	BRA.b CODE_BBD967

CODE_BBD964:
	LDA.w #$0000
CODE_BBD967:
	AND.b $00
	BNE.b CODE_BBD973
	LDA.w $18E1
	EOR.b $70
	STA.w $18E1
CODE_BBD973:
	RTS

CODE_BBD974:
	LDA.w $05B1
	AND.w #$0002
	CMP.w #$0001
	RTS

DKC3_NorSpr0144_FloorDoor_Main:
;$BBD97E
	JMP.w (DATA_BBD981,x)

DATA_BBD981:
	dw CODE_BBD989
	dw CODE_BBD9B3
	dw CODE_BBD9E3
	dw CODE_BBDA3B

CODE_BBD989:
	LDA.w $0039,y
	AND.w #$00FF
	BNE.b CODE_BBD9A5
	JSR.w CODE_BBDA8F
	BCC.b CODE_BBD9A2
	LDA.w #$0000
	JSR.w CODE_BBDAC5
	BCC.b CODE_BBD9A2
	LDX.b $70
	INC.b $39,x
CODE_BBD9A2:
	JMP.w CODE_BBC827

CODE_BBD9A5:
	LDA.w $15E2
	BNE.b CODE_BBD9B0
	LDA.w #$0000
	STA.w $0038,y
CODE_BBD9B0:
	JMP.w CODE_BBC827

CODE_BBD9B3:
	LDA.w $0039,y
	AND.w #$00FF
	BNE.b CODE_BBD9D5
	JSR.w CODE_BBDA8F
	BCC.b CODE_BBD9D2
	LDA.w #$0000
	JSR.w CODE_BBDAC5
	BCC.b CODE_BBD9D2
	LDA.w #$00FF
	TRB.w $04C3
	LDX.b $70
	INC.b $39,x
CODE_BBD9D2:
	JMP.w CODE_BBC827

CODE_BBD9D5:
	LDA.w $15E2
	BNE.b CODE_BBD9E0
	LDA.w #$0000
	STA.w $0038,y
CODE_BBD9E0:
	JMP.w CODE_BBC827

CODE_BBD9E3:
	LDA.w $005E,y
	BEQ.b CODE_BBDA32
	AND.w $04C3
	BEQ.b CODE_BBDA32
	LDX.b $70
	LDA.w #$2000
	STA.b $1E,x
	JSL.l CODE_BB85EE
	BCS.b CODE_BBDA2F
	LDA.w #$001D
	JSL.l CODE_BB859A
	LDX.b $70
	EOR.b $1E,x
	AND.w #$0E00
	EOR.b $1E,x
	STA.b $1E,x
	LDA.w #$00C0
	STA.b $0E,x
	LDA.w #$8001
	STA.b $26,x
	LDA.w #$04FC
	STA.b $58,x
	TXY
	LDX.w #$006C
	LDA.l DATA_B9B6E7,x
	TYX
	STA.b $24,x
	STZ.b $22,x
	STZ.b $20,x
	INC.b $38,x
	JMP.w [$04F5]

CODE_BBDA2F:
	JMP.w CODE_BBC827

CODE_BBDA32:
	LDA.w #$0000
	STA.w $0038,y
	JMP.w CODE_BBC827

CODE_BBDA3B:
	LDA.w $0039,y
	AND.w #$00FF
	BNE.b CODE_BBDA81
	JSR.w CODE_BBDA8F
	BCC.b CODE_BBDA55
	LDX.b $70
	LDA.b $5E,x
	JSR.w CODE_BBDAC5
	BCC.b CODE_BBDA55
	LDX.b $70
	INC.b $39,x
CODE_BBDA55:
	JSL.l CODE_BBAB29
	BCC.b CODE_BBDA6E
	LDX.b $70
	JSL.l CODE_BB85EB
	LDX.b $70
	JSL.l CODE_BB859D
	JSL.l CODE_BB85A3
	JMP.w [$04F5]

CODE_BBDA6E:
	LDX.b $70
	LDA.w #$04FC
	LDY.w $15E2
	DEY
	BMI.b CODE_BBDA7C
	LDA.w #$06FD
CODE_BBDA7C:
	STA.b $58,x
	JMP.w [$04F5]

CODE_BBDA81:
	LDA.w $15E2
	BNE.b CODE_BBDA8C
	LDA.w #$0003
	STA.w $0038,y
CODE_BBDA8C:
	JMP.w CODE_BBC827

CODE_BBDA8F:
	LDA.w #$0004
	JSL.l CODE_BCE43C
	LDA.w #$0024
	PHK
	PEA.w CODE_BBDAA0-$01
	JMP.w [$1864]
CODE_BBDAA0:
	BCC.b CODE_BBDAC3
	LDX.b $70
	LDY.b $78
	LDA.w $0028,y
	AND.w #$0001
	BEQ.b CODE_BBDAC3
	LDA.w $0012,y
	CMP.w $1840
	BCC.b CODE_BBDAC3
	DEC
	CMP.w $1844
	BCS.b CODE_BBDAC3
	LDA.w $002E,y
	BMI.b CODE_BBDAC3
	SEC
	RTS

CODE_BBDAC3:
	CLC
	RTS

CODE_BBDAC5:
	AND.w $04C2
	BNE.b CODE_BBDADF
	LDY.b $78
	LDA.w $004A,y
	AND.w #$3800
	CMP.w #$0800
	BEQ.b CODE_BBDAFA
	LDA.w $0028,y
	AND.w #$0100
	BEQ.b CODE_BBDAFA
CODE_BBDADF:
	LDX.b $70
	LDA.b $5C,x
	STA.w $15E8
	LDA.w #$0005
	LDY.w $15E2
	STA.w $15E2
	BNE.b CODE_BBDAF8
	LDA.w #$0023
	JSL.l CODE_BFF006
CODE_BBDAF8:
	CLC
	RTS

CODE_BBDAFA:
	LDX.b $70
	LDA.b $5C,x
	STA.w $15E8
	LDA.w #$0020
	STA.w $15E2
	LDA.w #$0022
	JSL.l CODE_BFF006
	SEC
	RTS

DKC3_NorSpr0158_KongFusedCliffsRope_Main:
;$BBDB10
	TYX
	LDA.b $4C,x
	STA.b $1A
	LDA.b $6C
	STA.b $1C
	LDA.w #$0001
	STA.b $1E
	BRA.b CODE_BBDB2A

CODE_BBDB20:
	ASL.b $1E
	LDA.b $1A
	CLC
	ADC.w #$0008
	STA.b $1A
CODE_BBDB2A:
	LDA.b [$1A]
	BMI.b CODE_BBDBA2
	SEC
	SBC.w $196D
	CLC
	ADC.w #$0010
	CMP.w #$0120
	BCS.b CODE_BBDB20
	LDA.b $5C,x
	AND.b $1E
	BNE.b CODE_BBDB20
	LDY.w #$0002
	LDA.b [$1A],y
	SEC
	SBC.w $1973
	BMI.b CODE_BBDB51
	CMP.w #$00F0
	BCS.b CODE_BBDB20
CODE_BBDB51:
	CLC
	INY
	INY
	ADC.b [$1A],y
	CLC
	ADC.w #$0010
	BMI.b CODE_BBDB20
	LDA.b $1A
	PHA
	LDA.b $1E
	PHA
	LDY.w #$0006
	LDA.b [$1A],y
	TAY
	JSL.l CODE_BB8603
	PLA
	STA.b $1E
	PLA
	STA.b $1A
	BCS.b CODE_BBDBA2
	LDA.b $6C
	STA.b $1C
	LDY.b $70
	LDX.b $76
	LDA.w $001E,y
	STA.b $1E,x
	LDA.b [$1A]
	STA.b $12,x
	LDY.w #$0002
	LDA.b [$1A],y
	STA.b $16,x
	INY
	INY
	LDA.b [$1A],y
	STZ.b $5C,x
	STA.b $5E,x
	STA.b $60,x
	LDY.b $70
	LDA.w $005C,y
	ORA.b $1E
	STA.w $005C,y
	STY.b $4C,x
CODE_BBDBA2:
	JMP.w [$04F5]

DKC3_NorSpr015C_KongFusedCliffsAutoscroll_Main:
;$BBDBA5
	JMP.w (DATA_BBDBA8,x)

DATA_BBDBA8:
	dw CODE_BBDBB0
	dw CODE_BBDBD0
	dw CODE_BBDBF5
	dw CODE_BBDC3D

CODE_BBDBB0:
	LDY.w #$0030
	JSL.l CODE_BB8585
	BCS.b CODE_BBDBCD
	LDX.b $70
	INC.b $38,x
	LDY.b $76
	STY.b $4E,x
	STX.b $4E,y
	STZ.b $62,x
	LDA.w $05AF
	STA.b $66,x
	JSR.w CODE_BBDCA3
CODE_BBDBCD:
	JMP.w [$04F5]

CODE_BBDBD0:
	JSR.w CODE_BBDCE4
	LDY.b $70
	LDX.w $18A1
	BEQ.b CODE_BBDBEC
	LDA.b $16,x
	CLC
	ADC.b $5E,x
	STA.b $1A
	LDA.w $0016,y
	CLC
	ADC.w $005E,y
	CMP.b $1A
	BCC.b CODE_BBDBF2
CODE_BBDBEC:
	STY.w $18A1
	TYX
	INC.b $38,x
CODE_BBDBF2:
	JMP.w [$04F5]

CODE_BBDBF5:
	JSR.w CODE_BBDCE4
	JSR.w CODE_BBDC64
	BMI.b CODE_BBDC4B
	LDA.w $189F
	CMP.b $18,x
	BCC.b CODE_BBDC20
	CPX.w $18A1
	BNE.b CODE_BBDC1A
	LDA.b $5E,x
	CLC
	ADC.b $16,x
	SEC
	SBC.w #$00D8
	CMP.w $189F
	BCS.b CODE_BBDC1A
	STA.w $189F
CODE_BBDC1A:
	JSR.w CODE_BBDCA3
	JMP.w [$04F5]

CODE_BBDC20:
	INC.b $38,x
	LDA.w #$0000
	STA.w $078F
	LDA.w $189F
	STA.w $04BE
	LDA.w $0777
	AND.w #$FF7F
	STA.w $0777
	JSR.w CODE_BBDCA3
	JMP.w [$04F5]

CODE_BBDC3D:
	JSR.w CODE_BBDCE4
	JSR.w CODE_BBDC64
	BMI.b CODE_BBDC4B
	JSR.w CODE_BBDCA3
	JMP.w [$04F5]

CODE_BBDC4B:
	CPX.w $18A1
	BNE.b CODE_BBDC53
	STZ.w $18A1
CODE_BBDC53:
	STZ.b $1E,x
	LDY.b $4E,x
	LDA.w #$0000
	STA.w $004E,y
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBDC64:
	LDX.b $70
	LDA.w $05AF
	TAY
	EOR.b $66,x
	STY.b $66,x
	AND.w #$4000
	BEQ.b CODE_BBDC80
	AND.w $05AF
	BNE.b CODE_BBDC80
	LDA.w #$003C
	STA.b $64,x
	LDA.b $5E,x
	RTS

CODE_BBDC80:
	LDA.b $64,x
	BNE.b CODE_BBDC9E
	STZ.b $3E
	LDA.b $2E,x
	BPL.b CODE_BBDC8C
	DEC.b $3E
CODE_BBDC8C:
	CLC
	ADC.b $5D,x
	STA.b $5D,x
	SEP.b #$20
	LDA.b $3E
	ADC.b $5F,x
	STA.b $5F,x
	REP.b #$20
	LDA.b $5E,x
	RTS

CODE_BBDC9E:
	DEC.b $64,x
	LDA.b $5E,x
	RTS

CODE_BBDCA3:
	LDX.b $70
	LDY.b $4E,x
	LDA.b $12,x
	CLC
	ADC.w #$0003
	STA.w $0012,y
	LDA.b $62,x
	INC
	CMP.w #$0020
	BCC.b CODE_BBDCBB
	LDA.w #$0000
CODE_BBDCBB:
	STA.b $62,x
	CMP.w #$0010
	BCC.b CODE_BBDCC8
	EOR.w #$FFFF
	ADC.w #$0020
CODE_BBDCC8:
	LSR
	LSR
	LSR
	CLC
	ADC.b $5E,x
	CMP.w #$0010
	BCS.b CODE_BBDCD6
	LDA.w #$0010
CODE_BBDCD6:
	CLC
	ADC.b $16,x
	STA.w $0016,y
	LDA.w #$001F
	JSL.l CODE_BFF009
	RTS

CODE_BBDCE4:
	LDX.b $70
	JSL.l CODE_BBDD25
	LDA.w #$0080
	JSL.l CODE_BCE58E
	BCS.b CODE_BBDCF4
	RTS

CODE_BBDCF4:
	LDY.w $04FB
	LDA.b $78
	CMP.w $04F9
	BEQ.b CODE_BBDD01
	LDY.w $04FF
CODE_BBDD01:
	LDA.w $0028,y
	STA.w $002E,y
	LDA.w $002A,y
	STA.w $0030,y
	LDA.w $002C,y
	STA.w $0032,y
	LDX.b $70
	STX.b $28,y
	LDA.w #CODE_BBDD25
	STA.w $002A,y
	LDA.w #CODE_BBDD25>>16
	STA.w $002C,y
	SEC
	RTS

CODE_BBDD25:
	LDA.b $12,x
	SEC
	SBC.w #$0008
	STA.w $1830
	STA.w $1840
	STA.b $D8
	CLC
	ADC.w #$0014
	STA.w $1834
	STA.w $1844
	STA.b $DC
	LDA.b $16,x
	STA.w $1832
	STA.w $1842
	STA.b $DA
	CLC
	ADC.b $5E,x
	STA.w $1836
	STA.w $1846
	STA.b $DE
	LDA.b $5E,x
	CMP.w #$0010
	BCS.b CODE_BBDD5E
	STZ.w $1844
CODE_BBDD5E:
	RTL

DKC3_NorSpr02AC_RopeFire_Main:
;$BBDD5F
	JMP.w (DATA_BBDD62,x)

DATA_BBDD62:
	dw CODE_BBDD66
	dw CODE_BBDD80

CODE_BBDD66:
	JSL.l CODE_BCE425
	LDA.w #$0000
	JSL.l CODE_BEC009
	LDX.b $70
	LDA.b $4E,x
	BNE.b CODE_BBDD79
	INC.b $38,x
CODE_BBDD79:
	JSL.l CODE_B9A006
	JMP.w [$04F5]

CODE_BBDD80:
	JSL.l CODE_BCE425
	LDA.w #$0000
	JSL.l CODE_BEC009
	JSL.l CODE_B9A006
	JSL.l CODE_B9E000
	JMP.w CODE_BBC827

DKC3_NorSpr0160_UnknownSprite0160_Main:
;$BBDD96
	JMP.w (DATA_BBDD99,x)

DATA_BBDD99:
	dw CODE_BBDD9D
	dw CODE_BBDDB6

CODE_BBDD9D:
	JSR.w CODE_BBDE22
	BCS.b CODE_BBDDA5
	JMP.w CODE_BBC827

CODE_BBDDA5:
	LDY.b $70
	LDX.b $5E,y
	LDA.w $0060,y
	JSR.w CODE_BBDE63
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBDDB6:
	JSR.w CODE_BBDE22
	BCS.b CODE_BBDDC3
	JSR.w CODE_BBDE42
	BCS.b CODE_BBDDC3
	JMP.w [$04F5]

CODE_BBDDC3:
	LDY.b $70
	LDX.b $5E,y
	LDA.w $0060,y
	JSR.w CODE_BBDE63
	LDX.b $70
	STZ.b $26,x
	LDA.b $6C,x
	BMI.b CODE_BBDDED
	JSR.w CODE_BBDE7A
	LDY.w #$0014
	JSL.l CODE_BB8585
	LDA.w #$060C
	JSL.l CODE_B28012
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBDDED:
	JSR.w CODE_BBDDFE
	LDA.w #$060C
	JSL.l CODE_B28012
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBDDFE:
	LDY.w #$0014
	JSL.l CODE_BB8585
	LDY.w #$0016
	JSL.l CODE_BB85B8
	LDY.w #$0018
	JSL.l CODE_BB85B8
	LDY.w #$001A
	JSL.l CODE_BB85B8
	LDY.w #$001C
	JSL.l CODE_BB85B8
	RTS

CODE_BBDE22:
	LDA.w $005C,y
	JSL.l CODE_BCE43C
	LDA.w #$0400
	JSL.l CODE_BEC000
	BCC.b CODE_BBDE41
	LDX.b $70
	LDY.b $78
	LDA.w #$0200
	ORA.w $003C,y
	STA.w $003C,y
	STX.b $3E,y
CODE_BBDE41:
	RTS

CODE_BBDE42:
	LDA.w #$0020
	JSL.l CODE_BCE58E
	BCC.b CODE_BBDE61
	LDY.b $78
	LDA.w $0038,y
	CMP.w #$004F
	BNE.b CODE_BBDE61
	LDA.w $0028,y
	AND.w #$0101
	CMP.w #$0001
	BNE.b CODE_BBDE61
	RTS

CODE_BBDE61:
	CLC
	RTS

CODE_BBDE63:
	SEP.b #$20
	CMP.b #$01
	BCC.b CODE_BBDE75
	BEQ.b CODE_BBDE70
	XBA
	EOR.b $00,x
	BRA.b CODE_BBDE75

CODE_BBDE70:
	XBA
	ORA.b $00,x
	BRA.b CODE_BBDE75

CODE_BBDE75:
	STA.b $00,x
	REP.b #$20
	RTS

CODE_BBDE7A:
	CMP.w #$0004
	BCS.b CODE_BBDE8D
	TAX
	LDA.l DATA_BBDF15,x
	AND.w $05D7
	BEQ.b CODE_BBDE8C
	LDX.w #$0004
CODE_BBDE8C:
	TXA
CODE_BBDE8D:
	PHA
	LDY.w #$006E
	JSL.l CODE_BB8585
	PLA
	CMP.w #$0011
	BNE.b CODE_BBDEAE
	LDX.b $76
	JSL.l CODE_BB85EB
	LDA.w $18F7
	AND.w #$01E0
	ORA.b $1E,x
	STA.b $1E,x
	LDA.w #$0011
CODE_BBDEAE:
	LDY.b $76
	STA.b $3A
	ASL
	ADC.b $3A
	ASL
	TAX
	LDA.l DATA_FF257C+$04,x
	STA.w $005C,y
	LDA.l DATA_FF257C+$02,x
	STA.w $0040,y
	LDA.l DATA_FF257C,x
	CMP.w #$0100
	BCC.b CODE_BBDED4
	JSL.l CODE_BB8609
	BRA.b CODE_BBDEF3

CODE_BBDED4:
	TAY
	JSL.l CODE_BB859A
	LDX.b $76
	EOR.b $1E,x
	AND.w #$0E00
	EOR.b $1E,x
	LDY.w $04F9
	EOR.w $001E,y
	AND.w #$CFFF
	EOR.w $001E,y
	AND.w #$BFFF
	STA.b $1E,x
CODE_BBDEF3:
	LDX.b $76
	LDA.b $40,x
	JSL.l CODE_B9A003
	LDX.b $76
	LDY.b $70
	LDA.w $004C,y
	STA.b $62,x
	LDA.w $004E,y
	STA.b $64,x
	LDA.w $0050,y
	STA.b $66,x
	LDA.w $0052,y
	STA.b $6A,x
	CLC
	RTS

DATA_BBDF15:
	db $01,$02,$04,$08,$10,$20,$40,$80

DKC3_NorSpr0140_UnknownSprite0140_Main:
;$BBDF1D
	JMP.w (DATA_BBDF20,x)

DATA_BBDF20:
	dw CODE_BBDF28
	dw CODE_BBDF36
	dw CODE_BBDF53
	dw CODE_BBDF5D

CODE_BBDF28:
	LDA.w $005C,y
	JSL.l CODE_B28012
	JSL.l CODE_BB8591
	JMP.w [$04F5]

CODE_BBDF36:
	TYX
	LDA.b $39,x
	AND.w #$00FF
	BNE.b CODE_BBDF42
	INC.b $39,x
	STZ.b $60,x
CODE_BBDF42:
	DEC.b $60,x
	BPL.b CODE_BBDF50
	LDA.b $5E,x
	STA.b $60,x
	LDA.b $5C,x
	JSL.l CODE_B28012
CODE_BBDF50:
	JMP.w CODE_BBC827

CODE_BBDF53:
	LDA.w $005C,y
	JSL.l CODE_B28024
	JMP.w CODE_BBC827

CODE_BBDF5D:
	LDA.w $0038,y
	CMP.w #$0100
	BCS.b CODE_BBDF6C
	LDA.w $005C,y
	JSL.l CODE_B28012
CODE_BBDF6C:
	JMP.w CODE_BBC827

if !include_garbage_data = 1
	incbin "data/garbage_data/DKC1_DATA_BBDF6F.bin"
	incbin "data/garbage_data/DKC2_DATA_BBE800.bin"
else
	padbyte $00 : pad $BBF83E
endif	

UNK_BBF83E:
	dw $0806,$0806,$0806,$0806,$0806,$0806,$146E,$0806
	dw $0806,$0806,$1531,$48EA,$0806,$0806,$149A,$4814
	dw $4C71,$4C85,$4CA1,$4CCF,$4CCE,$4CCD,$4CCC,$4C74
	dw $0C92,$490A,$4C72,$0806,$08EA,$48FD,$08FD,$0882
	dw $0881,$0881,$0806,$08CA,$4814,$4C71,$946F,$0C83
	dw $4CC1,$4C2A,$944E,$8853,$9054,$544D,$5532,$144E
	dw $546F,$54A8,$152C,$1054,$5054,$C853,$4CE8,$4CE4
	dw $4CCB,$4857,$090B,$0C55,$4C56,$CCD0,$4C4B,$0C6C
	dw $4C6C,$4CAC,$8857,$082B,$0806,$0806,$482B,$490B
	dw $0806,$0806,$090B,$4C6C,$4C02,$4C03,$4C04,$C857
	dw $4C76,$4C43,$4C25,$48C5,$08C6,$1452,$1475,$C8FE
	dw $C8FE,$08FF,$545F,$5458,$5531,$1054,$544F,$546F
	dw $5054,$0806,$946E,$C878,$0806,$0806,$1406,$4CE4
	dw $4857,$0806,$0857,$1532,$0853,$0806,$08EA,$1487
	dw $8805,$4805,$1446,$482B,$082B,$1446,$54EB,$0CD0
	dw $0C26,$550C,$550D,$48EA,$0806,$0806,$08EA,$5446
	dw $0805,$4805,$1446,$14EB,$5446,$1446,$54EB,$150D
	dw $150C,$550C,$550D,$48EA,$0850,$0851,$1452,$54A9
	dw $14AA,$14AB,$149B,$14E9,$54DF,$1475,$5054,$547B
	dw $14C4,$BE9A,$FC00,$EE00,$08C2,$FA02,$EC00,$0022
	dw $C00D,$BFFF,$BDF3,$38E0,$70F0,$79C0,$7DF0,$A3E9
	dw $038E,$CD0E,$7F32,$CF80,$BF30,$EF40,$9610,$B169
	dw $E34E,$FF23,$7F03,$BFFF,$43FE,$FF3F,$7F02,$FFE8
	dw $7EC2,$DF0C,$2FDF,$B74E,$2AD7,$36CF,$5CAF,$689F
	dw $FE43,$02FF,$FFFD,$22FD,$0FFF,$FFBB,$FF0E,$FF3B
	dw $FC07,$748F,$8DFE,$F9FE,$78FF,$1083,$E00C,$CF5B
	dw $1E30,$F9F9,$FCFE,$F6EF,$76D7,$BEC3,$DEEB,$46FF
	dw $E7FF,$4718,$D3B8,$AD2C,$BD52,$D542,$E12A,$FF1E
	dw $1C00,$341C,$7A3C,$BF7E,$CBFF,$B3E1,$33DE,$D6F5
	dw $08AD,$0814,$0C34,$6C72,$7F93,$7F94,$FF80,$FF02
	dw $7652,$5276,$5476,$6276,$4646,$BB66,$4DFE,$75FB
	dw $249F,$2652,$3650,$3640,$F650,$A390,$07BC,$41E0
	dw $60FF,$E5E7,$67A4,$73B2,$F2D3,$5273,$7E5D,$FFDA
	dw $F230,$E007,$2403,$1241,$9221,$4231,$4C33,$807F
	dw $1DEF,$7C6C,$3818,$88A8,$BC9C,$ECCC,$3E2E,$6B63
	dw $BBBB,$6C10,$88A0,$08A0,$0CB0,$18F4,$C2FC,$95FE
	dw $E55E,$FF22,$ED0C,$AAFA,$FFF7,$D7D6,$F1F5,$F6EC
	dw $A3BE,$11A3,$1B0A,$00FD,$00D4,$00F8,$00FF,$00E9
	dw $00FE,$EFEF,$6666,$C3DB,$5B9B,$F1FD,$6D7F,$8B0F
	dw $7575,$DBA3,$020A,$00BF,$A3AF,$0FBC,$0001,$A377
	dw $0B52,$FD08,$89F9,$8840,$0080,$24A4,$2C83,$0113
	dw $A185,$FF43,$8300,$1378,$DB00,$0044,$11FF,$00DF
	dw $6FFF,$9FBF,$1717,$2F3F,$0F1F,$535F,$2F2F,$071F
	dw $FF4F,$4F00,$2A17,$3C4F,$4F00,$8428,$7C4E,$2500
	dw $0100,$FFFF,$0022,$FF01,$2200,$24FF,$4600,$00FF
	dw $0024,$26E0,$2854,$6C3B,$3BFC,$64B7,$6DAC,$38FB
	dw $39E7,$D53B,$0044,$0013,$00BC,$102E,$08B6,$005F
	dw $01C2,$002A,$F2FF,$F4FF,$FFFF,$83BE,$0E43,$4EE0
	dw $FFA7,$CF4B,$CD03,$FB32,$F804,$CF07,$8736,$5B7B
	dw $B6A4,$FC49,$D103,$F3FF,$EFFF,$CFFA,$CFFC,$6FFE
	dw $DFFC,$DFFA,$7EFC,$3C91,$7DF3,$F7E2,$F1C8,$F38E
	dw $E54C,$EF5A,$F950,$FE9F,$FC57,$AE87,$4703,$8707
	dw $4F01,$9701,$7787,$AB88,$7F54,$FD80,$F802,$4307
	dw $01FE,$FB08,$CE04,$BCFF,$E3FF,$6FFF,$FF22,$2AE0
	dw $FD5F,$FC7F,$F87F,$06F9,$04FB,$03FC,$0DF2,$1FE0
	dw $0DF2,$24DB,$38C7,$0C00,$2C1F,$1969,$2162,$5E9F
	dw $F848,$4787,$F77B,$0000,$000D,$C206,$06F8,$003E
	dw $0047,$003F,$2271,$0D00,$0C04,$0898,$E0F2,$FF92
	dw $E3E5,$FA19,$BFAE,$0023,$28E0,$0096,$006C,$00F2
	dw $0079,$000C,$00E6,$530C,$8C44,$1F2F,$3F3C,$3769
	dw $1A04,$070C,$0305,$0020,$0033,$0046,$007C,$0021
	dw $0001,$C204,$0704,$C6C6,$E0E0,$3838,$C848,$EE84
	dw $030A,$0080,$7F00,$0044,$04FE,$003C,$00FC,$A3F0
	dw $142A,$000D,$E1ED,$FDF9,$D4FE,$6AEF,$F3F3,$DCFC
	dw $83F0,$1043,$0001,$4CF2,$FF00,$0F0C,$5D49,$955F
	dw $D987,$2317,$072D,$057F,$FF22,$B702,$EB00,$0044
	dw $00FF,$46DF,$FF00,$000B,$1140,$4091,$9EE2,$FF85
	dw $FFD1,$24AE,$4EFF,$FF00,$1F09,$BF1B,$FFBF,$BF57
	dw $FFFF,$26AF,$4EFF,$FF00,$1F45,$0162,$3F3F,$1F45
	dw $0122,$3C02,$7C45,$0000,$463F,$3C00,$3F01,$4500
	dw $822C,$FC01,$45FC,$8428,$5001,$452C,$007E,$FC00
	dw $0046,$007C,$83FC,$15D2,$03C4,$04C3,$0025,$FF48
	dw $2400,$1100,$6DDF,$F51F,$D59A,$DF1A,$F5BF,$F51F
	dw $552F,$0E13,$0035,$7043,$1205,$1FE0,$1540,$0055
	dw $002A,$0031,$8187,$0183,$87CF,$4BFF,$22FE,$E0FF
	dw $FC3C,$F3FF,$7FFF,$FE80,$7801,$B787,$0948,$8BF6
	dw $4B74,$9FB4,$F762,$E6FF,$EEFF,$CAFF,$DFFF,$3FFF
	dw $EFFF,$C7C7,$79C3,$7BE6,$FBA4,$FF24,$E7C0,$CB98
	dw $F934,$3C06,$FFC3,$FC53,$FB97,$7AFF,$87FF,$FF25
	dw $FE08,$52AD,$807F,$E817,$30CF,$B4A3,$0D03,$E6F9
	dw $6AF5,$F0FF,$F89F,$DC3F,$8D5F,$DEAF,$62C2,$1F02
	dw $079F,$EF43,$0C10,$08F7,$05FA,$02FD,$E817,$1CE3
	dw $04FB,$4300,$0200,$020F,$4B4C,$1B20,$2ED1,$FF05
	dw $FD6F,$0202,$2022,$A312,$0C74,$0046,$11FF,$0010
	dw $2038,$1030,$20E0,$C004,$9048,$A814,$BC50,$0818
	dw $E6A3,$0403,$00E2,$20E4,$C2F8,$00FE,$22FD,$1000
	dw $0044,$3828,$162E,$2C3C,$1D5C,$2701,$070D,$0000
	dw $2254,$0000,$2280,$0400,$0045,$0126,$260F,$0900
	dw $3C3C,$7848,$7010,$6060,$E0E0,$0023,$180B,$3818
	dw $7004,$7008,$6000,$8000,$2260,$0700,$3F7F,$3F60
	dw $3F40,$384F,$4844,$023B,$FF00,$4C7F,$40FF,$030B
	dw $0F03,$F7F7,$F71F,$F70F,$37CF,$430F,$8FB7,$0102
	dw $F1FF,$FF4B,$2201,$04FF,$FFFD,$FFFA,$C3F4,$2204
	dw $03FF,$FFF5,$88FF,$FF4E,$1080,$48FF,$24B0,$58D0
	dw $34A0,$58C0,$25A0,$49D0,$FFB0,$4C80,$00FF,$0022
	dw $0103,$D701,$83D7,$1423,$AB00,$FF22,$AB00,$11C2
	dw $10C4,$A902,$29FF,$FF45,$27A9,$06FF,$FF57,$FFEB
	dw $FF55,$23C3,$45FF,$FF00,$0100,$FF45,$1800,$007F
	dw $6390,$50DF,$45FF,$31AE,$32DD,$48F7,$62DD,$0000
	dw $000C,$0020,$0008,$A440,$0849,$111E,$FE00,$8202
	dw $D9C9,$C765,$1E21,$EE81,$0311,$7609,$00F9,$3700
	dw $0300,$1B00,$6700,$E700,$F700,$0AC2,$CF00,$D0C2
	dw $FE1D,$FBF9,$13E2,$7BE0,$3CF1,$80FF,$7F7F,$FF8E
	dw $C7F0,$9DF8,$FFE2,$8E00,$C371,$FF3C,$EF00,$8383
	dw $06EB,$E702,$3FFF,$FF44,$181F,$FFDF,$837C,$46B9
	dw $3EC1,$04FB,$0BFF,$0EFF,$05FE,$C33C,$FCDF,$FDDF
	dw $FE47,$C207,$0025,$22E3,$07FF,$FFF1,$0CF3,$0DF2
	dw $04FB,$5683,$0D16,$02FD,$C03F,$F00F,$030E,$0B9E
	dw $47FE,$2FFE,$4683,$0F12,$F9E6,$FCC2,$00FF,$0AF5
	dw $44BB,$24DB,$7887,$C03F,$FF43,$0A00,$FF71,$EF95
	dw $FFAE,$FF7E,$FFEE,$25BF,$83FF,$03F5,$0E06,$2EFF
	dw $46FF,$B7FF,$FF23,$9A0A,$65FC,$B29E,$E6FD,$7AFF
	dw $79FF,$FF24,$FE00,$0045,$04FF,$FF80,$FF70,$C339
	dw $0833,$0302,$0101,$0E0E,$1D15,$2208,$8318,$128E
	dw $0300,$F8C2,$0D08,$1903,$1804,$1000,$0008,$10C2
	dw $4001,$8340,$16EA,$4002,$40C0,$C022,$8005,$A0C0
	dw $80E0,$22C0,$0280,$8000,$4340,$00C0,$400D,$4080
	dw $3BA0,$384B,$3F48,$3F40,$4060,$253F,$47FF,$FF40
	dw $0044,$22FF,$02FF,$8F37,$4337,$F70F,$1F01,$2607
	dw $4CFF,$FF01,$FF22,$7F07,$3F7F,$3A3F,$1F3F,$C51F
	dw $0304,$3F37,$7F7F,$3F43,$0120,$1F1F,$04C5,$3F01
	dw $C237,$0522,$BCDE,$FF40,$B4FF,$04C2,$3C03,$B7C0
	dw $22FE,$02FF,$FF00,$2200,$00FF,$2200,$C2FF,$0A0A
	dw $EBBD,$FF2B,$A9FF,$ABFF,$AB6F,$23FF,$50AB,$AA00
	dw $3CAC