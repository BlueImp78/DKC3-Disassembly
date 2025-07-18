DATA_ED0000:
	incsrc "data/sound/InitializeSPC700.asm"

DATA_ED0088:
	incsrc "data/sound/SPC700_Engine_DKC3.asm"

;Song pointers
DATA_ED0D86:
	dl DATA_ED0F64
	dl DATA_ED0FCE
	dl DATA_F1C05F
	dl DATA_ED0FD0
	dl DATA_ED1AFD
	dl DATA_F1C51A
	dl DATA_ED0FD0
	dl DATA_ED1F69
	dl DATA_F1E481
	dl DATA_ED0FD0
	dl DATA_EE03A8
	dl DATA_F1E652
	dl DATA_ED1FA1
	dl DATA_ED23D3
	dl DATA_F1E180
	dl DATA_ED23F5
	dl DATA_ED2AEF
	dl DATA_F1C2D0
	dl DATA_ED2B39
	dl DATA_ED376D
	dl DATA_F1C7D7
	dl DATA_ED37A9
	dl DATA_ED4263
	dl DATA_F1CA7B
	dl DATA_ED42A5
	dl DATA_ED4C61
	dl DATA_F1CB85
	dl DATA_ED4C97
	dl DATA_ED5884
	dl DATA_F1C2D0
	dl DATA_ED58B4
	dl DATA_ED6378
	dl DATA_F1CD07
	dl DATA_ED63DA
	dl DATA_ED6B41
	dl DATA_F1C6AE
	dl DATA_ED6B7D
	dl DATA_ED7509
	dl DATA_F1D69E
	dl DATA_ED7535
	dl DATA_ED7DA6
	dl DATA_F1D967
	dl DATA_ED7DD2
	dl DATA_ED8961
	dl DATA_F1CDCE
	dl DATA_ED8997
	dl DATA_ED9404
	dl DATA_F1C9B1
	dl DATA_ED943C
	dl DATA_EDA137
	dl DATA_F1D109
	dl DATA_EDA175
	dl DATA_EDA69E
	dl DATA_F1C068
	dl DATA_EDA6BC
	dl DATA_EDAA22
	dl DATA_F1C068
	dl DATA_EDAA3E
	dl DATA_EDAEEE
	dl DATA_F1C068
	dl DATA_EDAF18
	dl DATA_EDAFF6
	dl DATA_F1D89E
	dl DATA_EDB000
	dl DATA_EDB3E4
	dl DATA_F1C2D0
	dl DATA_EDB40A
	dl DATA_EDB981
	dl DATA_F1D9E0
	dl DATA_EDB99F
	dl DATA_EDC0BD
	dl DATA_F1D967
	dl DATA_EDC0EF
	dl DATA_EDC8EF
	dl DATA_F1C2D0
	dl DATA_EDC913
	dl DATA_EDD371
	dl DATA_F1D4D7
	dl DATA_EDD3AF
	dl DATA_EDDB03
	dl DATA_F1E8BC
	dl DATA_EDDB31
	dl DATA_EDE1C8
	dl DATA_F1E35C
	dl DATA_EDE1E6
	dl DATA_EDEE18
	dl DATA_F1D2F8
	dl DATA_EDEE42
	dl DATA_EDF999
	dl DATA_F1D5FF
	dl DATA_EDF9CD
	dl DATA_EE0330
	dl DATA_F1CFB1
	dl DATA_ED6B7D
	dl DATA_EE0370
	dl DATA_F1DCCA
	dl DATA_F19E0A
	dl DATA_F1A165
	dl DATA_F1DF30
	dl DATA_F1A179
	dl DATA_F1A95C
	dl DATA_F1D2F8
	dl DATA_ED1B35
	dl DATA_ED1F4D
	dl DATA_F1D9E0
	dl DATA_F1A994
	dl DATA_F1AE3B
	dl DATA_F1DF30
	dl DATA_EDAA3E
	dl DATA_EE03E6
	dl DATA_F1C068
	dl DATA_EDAA3E
	dl DATA_EE0410
	dl DATA_F1C068
	dl DATA_ED42A5
	dl DATA_EE043A
	dl DATA_F1CB85
	dl DATA_EDD3AF
	dl DATA_EE0470
	dl DATA_F1EA41
	dl DATA_ED6B7D
	dl DATA_EE049E
	dl DATA_F1DAFE
	dl DATA_EDF9CD
	dl DATA_EE04CE
	dl DATA_F1CFB1
	dl DATA_F1AE5F
	dl DATA_F1B633
	dl DATA_F1C068
	dl DATA_ED7535
	dl DATA_EE0510
	dl DATA_F1C51A
	dl DATA_ED7535
	dl DATA_EE0542
	dl DATA_F1E481
	dl DATA_ED7535
	dl DATA_EE0574
	dl DATA_F1E652
	dl DATA_EE05AC
	dl DATA_EE077E
	dl DATA_F1C05F


padbyte $00 : pad $ED0F36

DATA_ED0F36:
	dw $00A7
	dw $00A8
	dw $00AE
	dw $00A3
	dw $00A5
	dw $00A6
	dw $0083
	dw $00B9
	dw $00A1
	dw $00A2
	dw $00A4
	dw $00B7
	dw $00AC
	dw $00B0
	dw $00A9
	dw $0078
	dw $0079
	dw $003E
	dw $0047
	dw $0048
	dw $0049
	dw $004A
	dw $FFFF

DATA_ED0F64:
	incbin "data/sound/music/None.bin"

DATA_ED0FCE:
	dw $FFFF

DATA_ED0FD0:
	incbin "data/sound/music/BonusTime.bin"

DATA_ED1AFD:
	dw $00BB
	dw $00BC
	dw $00BD
	dw $00BA
	dw $00C0
	dw $00B8
	dw $00BE
	dw $00C2
	dw $0008
	dw $00BF
	dw $00C1
	dw $0097
	dw $009E
	dw $0073
	dw $00B5
	dw $00B4
	dw $00AB
	dw $0063
	dw $005D
	dw $0082
	dw $009A
	dw $0067
	dw $00B1
	dw $007E
	dw $00C3
	dw $00AA
	dw $0075
	dw $FFFF

DATA_ED1B35:
	incbin "data/sound/music/CrazyCalypso.bin"

DATA_ED1F4D:
	dw $0015
	dw $0014
	dw $00C1
	dw $0023
	dw $006F
	dw $00AA
	dw $00BA
	dw $00B8
	dw $007C
	dw $000B
	dw $0021
	dw $0024
	dw $0075
	dw $FFFF

DATA_ED1F69:
	dw $00BB
	dw $00BC
	dw $00BD
	dw $00BA
	dw $00C0
	dw $00B8
	dw $00BE
	dw $00C2
	dw $0008
	dw $00BF
	dw $00C1
	dw $00B5
	dw $00B4
	dw $0081
	dw $007E
	dw $00C3
	dw $00AA
	dw $0095
	dw $00AB
	dw $006F
	dw $009A
	dw $0082
	dw $006C
	dw $0076
	dw $008F
	dw $008E
	dw $0059
	dw $FFFF

DATA_ED1FA1:
	incbin "data/sound/music/BrothersBear.bin"

DATA_ED23D3:
	dw $00BD
	dw $00B8
	dw $00BF
	dw $000F
	dw $000A
	dw $0071
	dw $007E
	dw $007F
	dw $0094
	dw $0075
	dw $0013
	dw $00B5
	dw $0090
	dw $0087
	dw $00BB
	dw $000B
	dw $FFFF

DATA_ED23F5:
	incbin "data/sound/music/WrinklyKongSongs.bin"

DATA_ED2AEF:
	dw $0004
	dw $000C
	dw $0032
	dw $0033
	dw $0034
	dw $0035
	dw $0036
	dw $0037
	dw $0038
	dw $0039
	dw $003A
	dw $003B
	dw $003C
	dw $003D
	dw $003F
	dw $0040
	dw $0041
	dw $0042
	dw $0043
	dw $0044
	dw $0045
	dw $0046
	dw $0018
	dw $0022
	dw $00AA
	dw $00BD
	dw $00BA
	dw $00B8
	dw $0098
	dw $0099
	dw $009F
	dw $0094
	dw $000B
	dw $0071
	dw $007E
	dw $007F
	dw $FFFF

DATA_ED2B39:
	incbin "data/sound/music/WaterWorld.bin"

DATA_ED376D:
	dw $000B
	dw $0051
	dw $0024
	dw $001E
	dw $0004
	dw $0006
	dw $0018
	dw $002D
	dw $002C
	dw $0005
	dw $0029
	dw $002E
	dw $004E
	dw $001B
	dw $0010
	dw $00AA
	dw $0095
	dw $007D
	dw $00AD
	dw $00B6
	dw $00AF
	dw $0075
	dw $006A
	dw $005D
	dw $00B1
	dw $0073
	dw $0074
	dw $0061
	dw $0002
	dw $FFFF

DATA_ED37A9:
	incbin "data/sound/music/HotPursuit.bin"

DATA_ED4263:
	dw $0024
	dw $0029
	dw $002E
	dw $002C
	dw $0005
	dw $0025
	dw $0010
	dw $0006
	dw $0028
	dw $0021
	dw $00B4
	dw $00B5
	dw $00B3
	dw $00AA
	dw $0081
	dw $0077
	dw $006F
	dw $0095
	dw $0067
	dw $007E
	dw $0075
	dw $009C
	dw $009F
	dw $00B1
	dw $00B6
	dw $0060
	dw $0069
	dw $0082
	dw $006A
	dw $00AB
	dw $00C3
	dw $0073
	dw $FFFF

DATA_ED42A5:
	incbin "data/sound/music/NutsAndBolts.bin"

DATA_ED4C61:
	dw $004F
	dw $0050
	dw $0010
	dw $001F
	dw $001D
	dw $000D
	dw $000E
	dw $002E
	dw $00BB
	dw $00BC
	dw $000C
	dw $0021
	dw $0081
	dw $0077
	dw $00AA
	dw $00B5
	dw $00B4
	dw $00B3
	dw $00AB
	dw $0095
	dw $0072
	dw $0075
	dw $0073
	dw $0063
	dw $005D
	dw $006A
	dw $FFFF

DATA_ED4C97:
	incbin "data/sound/music/SwankysSideshow.bin"

DATA_ED5884:
	dw $0010
	dw $00BD
	dw $0008
	dw $0015
	dw $00BC
	dw $0029
	dw $0026
	dw $0016
	dw $0017
	dw $000F
	dw $0025
	dw $002B
	dw $002C
	dw $002E
	dw $000A
	dw $009E
	dw $009A
	dw $009B
	dw $0095
	dw $0082
	dw $0080
	dw $0094
	dw $000B
	dw $FFFF

DATA_ED58B4:
	incbin "data/sound/music/CascadeCapers.bin"

DATA_ED6378:
	dw $0032
	dw $0033
	dw $0034
	dw $0035
	dw $0036
	dw $0037
	dw $0038
	dw $0039
	dw $003A
	dw $003B
	dw $003C
	dw $003D
	dw $003F
	dw $0040
	dw $0041
	dw $0042
	dw $0043
	dw $0044
	dw $0045
	dw $0046
	dw $0004
	dw $0018
	dw $00A0
	dw $0006
	dw $00BD
	dw $002C
	dw $0010
	dw $0059
	dw $0022
	dw $0005
	dw $00B3
	dw $00AA
	dw $0081
	dw $0077
	dw $0066
	dw $0067
	dw $0082
	dw $0095
	dw $00B5
	dw $00B4
	dw $007E
	dw $00BB
	dw $0075
	dw $0073
	dw $0069
	dw $0060
	dw $006A
	dw $001B
	dw $FFFF

DATA_ED63DA:
	incbin "data/sound/music/TreetopTumble.bin"

DATA_ED6B41:
	dw $0004
	dw $0006
	dw $0010
	dw $0059
	dw $0014
	dw $001C
	dw $0029
	dw $0058
	dw $002D
	dw $00B3
	dw $007E
	dw $0076
	dw $00AA
	dw $0081
	dw $0077
	dw $0095
	dw $0067
	dw $009A
	dw $0082
	dw $006C
	dw $00B5
	dw $00B4
	dw $00C3
	dw $008F
	dw $008E
	dw $0075
	dw $0069
	dw $0073
	dw $006A
	dw $FFFF

DATA_ED6B7D:
	incbin "data/sound/music/BossBoogie.bin"

DATA_ED7509:
	dw $0010
	dw $0021
	dw $0014
	dw $000B
	dw $0029
	dw $002C
	dw $002E
	dw $0005
	dw $004B
	dw $00BC
	dw $0007
	dw $006C
	dw $0082
	dw $009A
	dw $009B
	dw $0092
	dw $0093
	dw $00AA
	dw $005A
	dw $005B
	dw $006A
	dw $FFFF

DATA_ED7535:
	incbin "data/sound/music/JangleBells.bin"

DATA_ED7DA6:
	dw $0056
	dw $002F
	dw $002B
	dw $0010
	dw $0025
	dw $0016
	dw $0031
	dw $002E
	dw $009C
	dw $009B
	dw $00AA
	dw $0081
	dw $00B5
	dw $00B4
	dw $007E
	dw $0095
	dw $0075
	dw $0073
	dw $0058
	dw $0069
	dw $006A
	dw $FFFF

DATA_ED7DD2:
	incbin "data/sound/music/MillFever.bin"

DATA_ED8961:
	dw $0014
	dw $000A
	dw $00C0
	dw $0011
	dw $0012
	dw $0016
	dw $0010
	dw $002E
	dw $00B3
	dw $00AA
	dw $0081
	dw $0082
	dw $0095
	dw $00B5
	dw $00B4
	dw $007E
	dw $0073
	dw $0075
	dw $0086
	dw $009E
	dw $0097
	dw $0072
	dw $0050
	dw $0060
	dw $0069
	dw $006A
	dw $FFFF

DATA_ED8997:
	incbin "data/sound/music/StiltVillage.bin"

DATA_ED9404:
	dw $0009
	dw $0030
	dw $002E
	dw $002C
	dw $0029
	dw $0019
	dw $0023
	dw $0017
	dw $0069
	dw $00B3
	dw $00AA
	dw $0081
	dw $001B
	dw $0082
	dw $0095
	dw $00B5
	dw $00B4
	dw $007E
	dw $00AD
	dw $0073
	dw $00B1
	dw $0075
	dw $006A
	dw $00B6
	dw $00AF
	dw $0060
	dw $005D
	dw $FFFF

DATA_ED943C:
	incbin "data/sound/music/EnchantedRiverbank.bin"

DATA_EDA137:
	dw $0027
	dw $004B
	dw $004C
	dw $004D
	dw $0057
	dw $001C
	dw $0014
	dw $002A
	dw $0004
	dw $0006
	dw $0019
	dw $002C
	dw $002E
	dw $001A
	dw $001B
	dw $0010
	dw $00B5
	dw $00B4
	dw $0081
	dw $0069
	dw $007E
	dw $0095
	dw $00AA
	dw $0075
	dw $00B1
	dw $00B6
	dw $0060
	dw $00AD
	dw $006A
	dw $005D
	dw $FFFF

DATA_EDA175:
	incbin "data/sound/music/SubmapShuffle.bin"

DATA_EDA69E:
	dw $0014
	dw $002A
	dw $0006
	dw $0057
	dw $002C
	dw $000A
	dw $0031
	dw $009C
	dw $00B1
	dw $00B2
	dw $00B5
	dw $0075
	dw $006C
	dw $009D
	dw $FFFF

DATA_EDA6BC:
	incbin "data/sound/music/KremtoaKoncerto.bin"

DATA_EDAA22:
	dw $0006
	dw $000A
	dw $001E
	dw $004B
	dw $0018
	dw $009D
	dw $0090
	dw $0087
	dw $0091
	dw $0096
	dw $006F
	dw $006C
	dw $0075
	dw $FFFF

DATA_EDAA3E:
	incbin "data/sound/music/NorthernKremisphere.bin"

DATA_EDAEEE:
	dw $0033
	dw $0036
	dw $0038
	dw $003C
	dw $0006
	dw $000A
	dw $004B
	dw $0018
	dw $0004
	dw $002C
	dw $0005
	dw $0022
	dw $0030
	dw $006C
	dw $009D
	dw $0090
	dw $0096
	dw $00B1
	dw $00B2
	dw $0075
	dw $FFFF

DATA_EDAF18:
	incbin "data/sound/music/GameOver.bin"

DATA_EDAFF6:
	dw $0051
	dw $0084
	dw $0086
	dw $008B
	dw $FFFF

DATA_EDB000:
	incbin "data/sound/music/HanginAtFunkys.bin"

DATA_EDB3E4:
	dw $000F
	dw $0016
	dw $002B
	dw $0029
	dw $002C
	dw $002E
	dw $0030
	dw $0052
	dw $0053
	dw $0054
	dw $0055
	dw $006B
	dw $0088
	dw $0089
	dw $008A
	dw $0094
	dw $000B
	dw $0085
	dw $FFFF

DATA_EDB40A:
	incbin "data/sound/music/Fanfare.bin"

DATA_EDB981:
	dw $0051
	dw $0008
	dw $0015
	dw $0017
	dw $0006
	dw $0014
	dw $0029
	dw $00BD
	dw $006F
	dw $002C
	dw $0005
	dw $0007
	dw $000C
	dw $00B8
	dw $FFFF

DATA_EDB99F:
	incbin "data/sound/music/FrostyFrolics.bin"

DATA_EDC0BD:
	dw $00BF
	dw $000A
	dw $0004
	dw $0018
	dw $001E
	dw $0031
	dw $0051
	dw $0013
	dw $002C
	dw $002E
	dw $001C
	dw $0081
	dw $0095
	dw $00AA
	dw $009C
	dw $009B
	dw $00B5
	dw $00B4
	dw $007E
	dw $0058
	dw $0075
	dw $0073
	dw $0069
	dw $006A
	dw $FFFF

DATA_EDC0EF:
	incbin "data/sound/music/DixieBeat.bin"

DATA_EDC8EF:
	dw $0059
	dw $009F
	dw $00BB
	dw $00BC
	dw $00BD
	dw $00BA
	dw $00C0
	dw $00B8
	dw $00BE
	dw $00C2
	dw $0008
	dw $00C1
	dw $0016
	dw $00BF
	dw $009A
	dw $009B
	dw $0003
	dw $FFFF

DATA_EDC913:
	incbin "data/sound/music/PokeyPipes.bin"

DATA_EDD371:
	dw $00B8
	dw $0004
	dw $004B
	dw $0033
	dw $0036
	dw $003A
	dw $0040
	dw $002E
	dw $002C
	dw $001C
	dw $0013
	dw $0018
	dw $0014
	dw $00B3
	dw $00AA
	dw $0081
	dw $0095
	dw $00B5
	dw $00B4
	dw $007E
	dw $007D
	dw $00C3
	dw $00AF
	dw $0075
	dw $0073
	dw $00B6
	dw $00B1
	dw $0069
	dw $006A
	dw $005D
	dw $FFFF

DATA_EDD3AF:
	incbin "data/sound/music/BigBossBlues.bin"

DATA_EDDB03:
	dw $00B8
	dw $00BC
	dw $002C
	dw $000B
	dw $000A
	dw $000D
	dw $001D
	dw $001F
	dw $000C
	dw $0007
	dw $0024
	dw $0067
	dw $00B5
	dw $0064
	dw $0063
	dw $00AA
	dw $0097
	dw $006A
	dw $0072
	dw $005A
	dw $0094
	dw $0073
	dw $FFFF

DATA_EDDB31:
	incbin "data/sound/music/CrystalChasm.bin"

DATA_EDE1C8:
	dw $0033
	dw $0036
	dw $003A
	dw $0040
	dw $0018
	dw $0013
	dw $001E
	dw $0006
	dw $0071
	dw $007E
	dw $007F
	dw $006D
	dw $0031
	dw $002F
	dw $FFFF

DATA_EDE1E6:
	incbin "data/sound/music/RocketRun.bin"

DATA_EDEE18:
	dw $0024
	dw $001E
	dw $002C
	dw $002E
	dw $000A
	dw $0014
	dw $0008
	dw $0030
	dw $0021
	dw $0006
	dw $00B5
	dw $00B4
	dw $00AA
	dw $0095
	dw $0075
	dw $00BB
	dw $0072
	dw $0050
	dw $0073
	dw $006A
	dw $FFFF

DATA_EDEE42:
	incbin "data/sound/music/JungleJitter.bin"

DATA_EDF999:
	dw $00BC
	dw $00BD
	dw $00C0
	dw $00BA
	dw $0006
	dw $00B8
	dw $0008
	dw $0017
	dw $0014
	dw $0023
	dw $0077
	dw $0081
	dw $00AA
	dw $001B
	dw $0082
	dw $0066
	dw $0067
	dw $0095
	dw $00B5
	dw $00B4
	dw $007E
	dw $0075
	dw $0073
	dw $0069
	dw $006A
	dw $FFFF

check bankcross off
DATA_EDF9CD:
	incbin "data/sound/music/CavernCaprise.bin"
check bankcross full

DATA_EE0330:
	dw $0021
	dw $0024
	dw $001C
	dw $0018
	dw $0014
	dw $0007
	dw $0006
	dw $0010
	dw $002E
	dw $002C
	dw $0004
	dw $0077
	dw $00AA
	dw $0081
	dw $001B
	dw $0082
	dw $0066
	dw $0067
	dw $009A
	dw $0095
	dw $00B5
	dw $00B4
	dw $007E
	dw $00C3
	dw $00AB
	dw $0061
	dw $0062
	dw $0075
	dw $0073
	dw $0069
	dw $006A
	dw $FFFF

DATA_EE0370:
	dw $0014
	dw $0010
	dw $0021
	dw $000B
	dw $0029
	dw $002C
	dw $002E
	dw $0005
	dw $004B
	dw $00BC
	dw $0007
	dw $0081
	dw $0074
	dw $00B8
	dw $0082
	dw $009A
	dw $009B
	dw $007A
	dw $007B
	dw $007D
	dw $00AA
	dw $006E
	dw $00B6
	dw $0072
	dw $00AF
	dw $005D
	dw $006A
	dw $FFFF

DATA_EE03A8:
	dw $00BB
	dw $00BC
	dw $00BD
	dw $00BA
	dw $00C0
	dw $00B8
	dw $00BE
	dw $00C2
	dw $0008
	dw $00BF
	dw $00C1
	dw $0073
	dw $005D
	dw $00B6
	dw $00B1
	dw $0082
	dw $00AF
	dw $00AD
	dw $00B5
	dw $00B4
	dw $007E
	dw $00C3
	dw $009F
	dw $007D
	dw $009C
	dw $009B
	dw $0081
	dw $00AA
	dw $0074
	dw $0002
	dw $FFFF

DATA_EE03E6:
	dw $0033
	dw $0036
	dw $0038
	dw $003C
	dw $0006
	dw $000A
	dw $004B
	dw $0018
	dw $0004
	dw $002C
	dw $0005
	dw $0022
	dw $0030
	dw $006C
	dw $009D
	dw $0087
	dw $0096
	dw $00B1
	dw $00B2
	dw $0075
	dw $FFFF

DATA_EE0410:
	dw $0033
	dw $0036
	dw $0038
	dw $003C
	dw $0006
	dw $000A
	dw $004B
	dw $0018
	dw $0004
	dw $002C
	dw $0005
	dw $0022
	dw $0030
	dw $006C
	dw $009D
	dw $0091
	dw $0096
	dw $00B1
	dw $00B2
	dw $0075
	dw $FFFF

DATA_EE043A:
	dw $004F
	dw $0050
	dw $0010
	dw $001F
	dw $001D
	dw $000D
	dw $000E
	dw $002E
	dw $00BB
	dw $00BC
	dw $000C
	dw $0021
	dw $0081
	dw $0077
	dw $00AA
	dw $00B5
	dw $00B4
	dw $00B3
	dw $00AB
	dw $0075
	dw $0082
	dw $005C
	dw $0095
	dw $0063
	dw $005D
	dw $006A
	dw $FFFF

DATA_EE0470:
	dw $00B8
	dw $00BC
	dw $002C
	dw $000B
	dw $000A
	dw $000D
	dw $001D
	dw $001F
	dw $000C
	dw $0007
	dw $0024
	dw $00BB
	dw $0095
	dw $0063
	dw $0075
	dw $006C
	dw $0064
	dw $00AA
	dw $006A
	dw $0067
	dw $0094
	dw $0062
	dw $FFFF

DATA_EE049E:
	dw $0014
	dw $0010
	dw $0021
	dw $000B
	dw $0029
	dw $002C
	dw $002E
	dw $0005
	dw $004B
	dw $00BC
	dw $0007
	dw $00BB
	dw $0095
	dw $0063
	dw $006C
	dw $0064
	dw $00B5
	dw $00AA
	dw $006A
	dw $0060
	dw $00AB
	dw $005D
	dw $00B6
	dw $FFFF

DATA_EE04CE:
	dw $0021
	dw $0024
	dw $001C
	dw $0018
	dw $0014
	dw $0007
	dw $0006
	dw $0010
	dw $002E
	dw $002C
	dw $0004
	dw $00C3
	dw $007E
	dw $0069
	dw $00B4
	dw $00B5
	dw $009A
	dw $0061
	dw $0062
	dw $00AB
	dw $00AA
	dw $0095
	dw $0075
	dw $0073
	dw $006A
	dw $007D
	dw $005D
	dw $00AF
	dw $0060
	dw $00B3
	dw $00B6
	dw $00B1
	dw $FFFF

DATA_EE0510:
	dw $0056
	dw $002F
	dw $002B
	dw $0010
	dw $0025
	dw $0016
	dw $0031
	dw $002E
	dw $0097
	dw $009E
	dw $0073
	dw $00B5
	dw $00B4
	dw $00AB
	dw $0063
	dw $005D
	dw $009A
	dw $0067
	dw $00B1
	dw $007E
	dw $00C3
	dw $00AA
	dw $0075
	dw $0082
	dw $FFFF

DATA_EE0542:
	dw $0056
	dw $002F
	dw $002B
	dw $0010
	dw $0025
	dw $0016
	dw $0031
	dw $002E
	dw $00B5
	dw $00B4
	dw $0081
	dw $007E
	dw $00C3
	dw $00AA
	dw $0095
	dw $00AB
	dw $006F
	dw $009A
	dw $0082
	dw $006C
	dw $0076
	dw $008F
	dw $008E
	dw $0059
	dw $FFFF

DATA_EE0574:
	dw $0056
	dw $002F
	dw $002B
	dw $0010
	dw $0025
	dw $0016
	dw $0031
	dw $002E
	dw $0073
	dw $005D
	dw $00B6
	dw $00B1
	dw $0082
	dw $00AF
	dw $00AD
	dw $00B5
	dw $00B4
	dw $007E
	dw $00C3
	dw $009F
	dw $007D
	dw $009C
	dw $009B
	dw $0081
	dw $00AA
	dw $0074
	dw $0002
	dw $FFFF

DATA_EE05AC:
	incbin "data/sound/music/DefeatedBoss.bin"

DATA_EE077E:
	dw $00BD
	dw $00B8
	dw $0008
	dw $00C2
	dw $0025
	dw $FFFF

;sample table
DATA_EE078A:
	dl DATA_EE0A8A		;00
	dl DATA_EE119F		;01
	dl DATA_EE143D		;02
	dl DATA_EE19E1		;03
	dl DATA_EE2618		;04
	dl DATA_EE2D0A		;05
	dl DATA_EE31C4		;06
	dl DATA_EE3C4B		;07
	dl DATA_EE48CA		;08
	dl DATA_EE4D8D		;09
	dl DATA_EE5568		;0A
	dl DATA_EE5914		;0B
	dl DATA_EE632F		;0C
	dl DATA_EE6AD4		;0D
	dl DATA_EE78CD		;0E
	dl DATA_EE8474		;0F
	dl DATA_EE8605		;11
	dl DATA_EE87A7		;12
	dl DATA_EE88EF		;13
	dl DATA_EE8C02		;14
	dl DATA_EE93E6		;15
	dl DATA_EE9810		;16
	dl DATA_EE9E71		;17
	dl DATA_EEA26E		;18
	dl DATA_EEAE42		;19
	dl DATA_EEB0FB		;1A
	dl DATA_EEB2EE		;1B
	dl DATA_EEB5E6		;1C
	dl DATA_EEB896		;1D
	dl DATA_EEC09E		;1E
	dl DATA_EEC1CB		;1F
	dl DATA_EEC982		;20
	dl DATA_EED235		;21
	dl DATA_EEDCD7		;22
	dl DATA_EEDE67		;23
	dl DATA_EEE73E		;24
	dl DATA_EEEAB4		;25
	dl DATA_EEEB00		;26
	dl DATA_EEECA2		;27
	dl DATA_EEEE71		;28
	dl DATA_EEF73F		;29
	dl DATA_EEF983		;2A
	dl DATA_EF04F4		;2B
	dl DATA_EF08F1		;2C
	dl DATA_EF0DE1		;2D
	dl DATA_EF11DE		;2E
	dl DATA_EF1377		;2F
	dl DATA_EF1804		;30
	dl DATA_EF1EBF		;31
	dl DATA_EF2355		;32
	dl DATA_EF2D04		;33
	dl DATA_EF2D36		;34
	dl DATA_EF2D68		;35
	dl DATA_EF2D9A		;36
	dl DATA_EF2DCC		;37
	dl DATA_EF2DFE		;38
	dl DATA_EF2E30		;39
	dl DATA_EF2E62		;3A
	dl DATA_EF2E94		;3B
	dl DATA_EF2EC6		;3C
	dl DATA_EF2EF8		;3D
	dl DATA_EF2F2A		;3E
	dl DATA_EF2F5C		;3F
	dl DATA_EF2F8E		;40
	dl DATA_EF2FC0		;41
	dl DATA_EF2FF2		;42
	dl DATA_EF3024		;43
	dl DATA_EF3056		;44
	dl DATA_EF3088		;45
	dl DATA_EF30BA		;46
	dl DATA_EF30EC		;47
	dl DATA_EF311E		;48
	dl DATA_EF3150		;49
	dl DATA_EF3182		;4A
	dl DATA_EF31B4		;4B
	dl DATA_EF31E6		;4C
	dl DATA_EF3CD9		;4D
	dl DATA_EF414B		;4E
	dl DATA_EF46B9		;4F
	dl DATA_EF53C8		;50
	dl DATA_EF597E		;51
	dl DATA_EF6537		;52
	dl DATA_EF69E8		;53
	dl DATA_EF6CE9		;54
	dl DATA_EF6F51		;55
	dl DATA_EF7510		;56
	dl DATA_EF7B56		;57
	dl DATA_EF82D7		;58
	dl DATA_EF8617		;59
	dl DATA_EF97E5		;5A
	dl DATA_EFA27E		;5B
	dl DATA_EFA324		;5C
	dl DATA_EFA6FD		;5D
	dl DATA_EFAC62		;5E
	dl DATA_EFADFB		;5F
	dl DATA_EFB1B0		;60
	dl DATA_EFB67C		;61
	dl DATA_EFBA3A		;62
	dl DATA_EFBE01		;63
	dl DATA_EFC354		;64
	dl DATA_EFCA21		;65
	dl DATA_EFD3D9		;66
	dl DATA_EFD986		;67
	dl DATA_EFE158		;68
	dl DATA_EFE86D		;69
	dl DATA_EFEB53		;6A 	;kiddy tantrum
	dl DATA_EFECEC		;6B
	dl DATA_EFF1CA		;6C
	dl DATA_EFF27A		;6D
	dl DATA_EFF557		;6E
	dl DATA_F0002F		;6F
	dl DATA_F00153		;70
	dl DATA_F0038F		;71
	dl DATA_F006CF		;72
	dl DATA_F00871		;73
	dl DATA_F00E6F		;74
	dl DATA_F010C5		;75
	dl DATA_F01861		;76
	dl DATA_F01D51		;77
	dl DATA_F01FA7		;78
	dl DATA_F02101		;79
	dl DATA_F02627		;7A
	dl DATA_F02673		;7B
	dl DATA_F02EC3		;7C
	dl DATA_F03548		;7D
	dl DATA_F03E31		;7E
	dl DATA_F03FAF		;7F
	dl DATA_F04325		;80
	dl DATA_F04854		;81
	dl DATA_F04915		;82
	dl DATA_F04D90		;83
	dl DATA_F04FF8		;84
	dl DATA_F05890		;85
	dl DATA_F06815		;86
	dl DATA_F06D44		;87
	dl DATA_F0767E		;88
	dl DATA_F07B4A		;89
	dl DATA_F07E6F		;8A
	dl DATA_F0826C		;8B
	dl DATA_F08A86		;8C
	dl DATA_F08B98		;8D
	dl DATA_F08C98		;8E
	dl DATA_F08D1A		;8F
	dl DATA_F0926D		;90
	dl DATA_F0964F		;91
	dl DATA_F0A2B3		;92 	bleak laugh 1
	dl DATA_F0AD16		;93	bleak laugh 2
	dl DATA_F0B005		;94
	dl DATA_F0B21C		;95
	dl DATA_F0B32E		;96
	dl DATA_F0B77C		;97
	dl DATA_F0BB43		;98
	dl DATA_F0C4FB		;99
	dl DATA_F0CA8D		;9A
	dl DATA_F0D016		;9B
	dl DATA_F0D170		;9C
	dl DATA_F0D300		;9D
	dl DATA_F0D9F1		;9E
	dl DATA_F0E895		;9F
	dl DATA_F0ED85		;A0
	dl DATA_F0F46D		;A1
	dl DATA_F0FB9E		;A2
	dl DATA_F0FD38		;A3
	dl DATA_F0FF08		;A4
	dl DATA_F101B8		;A5
	dl DATA_F10376		;A6
	dl DATA_F105BA		;A7
	dl DATA_F1099C		;A8
	dl DATA_F110BB		;A9
	dl DATA_F11564		;AA
	dl DATA_F11773		;AB
	dl DATA_F11C76		;AC
	dl DATA_F11E8D		;AD
	dl DATA_F11EC8		;AE
	dl DATA_F1246C		;AF
	dl DATA_F12845		;B0
	dl DATA_F12865		;B1
	dl DATA_F12885		;B2
	dl DATA_F1366D		;B3
	dl DATA_F145FC		;B4
	dl DATA_F14AA4		;B5
	dl DATA_F14D93		;B6
	dl DATA_F154E7		;B7
	dl DATA_F1578F		;B8
	dl DATA_F15B96		;B9
	dl DATA_F16276		;C0
	dl DATA_F162B1		;C1
	dl DATA_F164A5		;C2
	dl DATA_F16F63		;C3
	dl DATA_F17EAA		;C4
	dl DATA_F1859C		;C5
	dl DATA_F18C61		;C6
	dl DATA_F1932E		;C7
	dl DATA_F19477		;C8
	dl DATA_F19AA2		;C9
	dl DATA_F19CB0		;CA
	dl DATA_F19CB0+$03	;CB


if !include_garbage_data == 1
	incbin "data/garbage_data/DKC2_DATA_EE09D9.bin"
	incbin "data/garbage_data/DATA_EE0A80.bin"
else
	padbyte $00 : pad $EE0A8A
endif


DATA_EE0A8A:
	dw $0000,$0711
	incbin "data/sound/samples/00.brr"

DATA_EE119F:
	dw $0000,$029A
	incbin "data/sound/samples/01.brr"

DATA_EE143D:
	dw $0000,$05A0
	incbin "data/sound/samples/02.brr"

DATA_EE19E1:
	dw $0630,$0C33
	incbin "data/sound/samples/03.brr"

DATA_EE2618:
	dw $0000,$06EE
	incbin "data/sound/samples/04.brr"

DATA_EE2D0A:
	dw $0000,$04B6
	incbin "data/sound/samples/05.brr"

DATA_EE31C4:
	dw $0000,$0A83
	incbin "data/sound/samples/06.brr"

DATA_EE3C4B:
	dw $0000,$0C7B
	incbin "data/sound/samples/07.brr"

DATA_EE48CA:
	dw $049B,$04BF
	incbin "data/sound/samples/08.brr"

DATA_EE4D8D:
	dw $05D6,$07D7
	incbin "data/sound/samples/09.brr"

DATA_EE5568:
	dw $02A3,$03A8
	incbin "data/sound/samples/0A.brr"

DATA_EE5914:
	dw $0000,$0A17
	incbin "data/sound/samples/0B.brr"

DATA_EE632F:
	dw $0000,$07A1
	incbin "data/sound/samples/0C.brr"

DATA_EE6AD4:
	dw $0000,$0DF5
	incbin "data/sound/samples/0D.brr"

DATA_EE78CD:
	dw $0000,$0BA3
	incbin "data/sound/samples/0E.brr"

DATA_EE8474:
	dw $010E,$018D
	incbin "data/sound/samples/0F.brr"

DATA_EE8605:
	dw $0171,$019E
	incbin "data/sound/samples/10.brr"

DATA_EE87A7:
	dw $0000,$0144
	incbin "data/sound/samples/11.brr"

DATA_EE88EF:
	dw $0000,$030F
	incbin "data/sound/samples/12.brr"

DATA_EE8C02:
	dw $026D,$07E0
	incbin "data/sound/samples/13.brr"

DATA_EE93E6:
	dw $0321,$0426
	incbin "data/sound/samples/14.brr"

DATA_EE9810:
	dw $0639,$065D
	incbin "data/sound/samples/15.brr"

DATA_EE9E71:
	dw $03A8,$03F9
	incbin "data/sound/samples/16.brr"

DATA_EEA26E:
	dw $09F3,$0BD0
	incbin "data/sound/samples/17.brr"

DATA_EEAE42:
	dw $029A,$02B5
	incbin "data/sound/samples/18.brr"

DATA_EEB0FB:
	dw $0000,$01EF
	incbin "data/sound/samples/19.brr"

DATA_EEB2EE:
	dw $02B5,$02F4
	incbin "data/sound/samples/1A.brr"

DATA_EEB5E6:
	dw $0240,$02AC
	incbin "data/sound/samples/1B.brr"

DATA_EEB896:
	dw $0000,$0804
	incbin "data/sound/samples/1C.brr"

DATA_EEC09E:
	dw $0117,$0129
	incbin "data/sound/samples/1D.brr"

DATA_EEC1CB:
	dw $07A1,$07B3
	incbin "data/sound/samples/1E.brr"

DATA_EEC982:
	dw $0000,$08AF
	incbin "data/sound/samples/1F.brr"

DATA_EED235:
	dw $0A68,$0A9E
	incbin "data/sound/samples/20.brr"

DATA_EEDCD7:
	dw $0132,$018C
	incbin "data/sound/samples/21.brr"

DATA_EEDE67:
	dw $0708,$08D3
	incbin "data/sound/samples/22.brr"

DATA_EEE73E:
	dw $0318,$0372
	incbin "data/sound/samples/23.brr"

DATA_EEEAB4:
	dw $0000,$0048
	incbin "data/sound/samples/24.brr"

DATA_EEEB00:
	dw $018C,$019E
	incbin "data/sound/samples/25.brr"

DATA_EEECA2:
	dw $01B0,$01CB
	incbin "data/sound/samples/26.brr"

DATA_EEEE71:
	dw $084C,$08CA
	incbin "data/sound/samples/27.brr"

DATA_EEF73F:
	dw $0000,$0240
	incbin "data/sound/samples/28.brr"

check bankcross off
DATA_EEF983:
	dw $0000,$0B6D
	incbin "data/sound/samples/29.brr"
check bankcross full

DATA_EF04F4:
	dw $0000,$03F9
	incbin "data/sound/samples/2A.brr"

DATA_EF08F1:
	dw $04B6,$04EC
	incbin "data/sound/samples/2B.brr"

DATA_EF0DE1:
	dw $0000,$03F9
	incbin "data/sound/samples/2C.brr"

DATA_EF11DE:
	dw $0000,$0195
	incbin "data/sound/samples/2D.brr"

DATA_EF1377:
	dw $0276,$0489
	incbin "data/sound/samples/2E.brr"

DATA_EF1804:
	dw $03F9,$06B7
	incbin "data/sound/samples/2F.brr"

DATA_EF1EBF:
	dw $044A,$0492
	incbin "data/sound/samples/30.brr"

DATA_EF2355:
	dw $04AD,$09AB
	incbin "data/sound/samples/31.brr"

DATA_EF2D04:
	dw $0000,$002E
	incbin "data/sound/samples/32.brr"

DATA_EF2D36:
	dw $0000,$002E
	incbin "data/sound/samples/33.brr"

DATA_EF2D68:
	dw $0000,$002E
	incbin "data/sound/samples/34.brr"

DATA_EF2D9A:
	dw $0000,$002E
	incbin "data/sound/samples/35.brr"

DATA_EF2DCC:
	dw $0000,$002E
	incbin "data/sound/samples/36.brr"

DATA_EF2DFE:
	dw $0000,$002E
	incbin "data/sound/samples/37.brr"

DATA_EF2E30:
	dw $0000,$002E
	incbin "data/sound/samples/38.brr"

DATA_EF2E62:
	dw $0000,$002E
	incbin "data/sound/samples/39.brr"

DATA_EF2E94:
	dw $0000,$002E
	incbin "data/sound/samples/3A.brr"

DATA_EF2EC6:
	dw $0000,$002E
	incbin "data/sound/samples/3B.brr"

DATA_EF2EF8:
	dw $0000,$002E
	incbin "data/sound/samples/3C.brr"

DATA_EF2F2A:
	dw $0000,$002E
	incbin "data/sound/samples/3D.brr"

DATA_EF2F5C:
	dw $0000,$002E
	incbin "data/sound/samples/3E.brr"

DATA_EF2F8E:
	dw $0000,$002E
	incbin "data/sound/samples/3F.brr"

DATA_EF2FC0:
	dw $0000,$002E
	incbin "data/sound/samples/40.brr"

DATA_EF2FF2:
	dw $0000,$002E
	incbin "data/sound/samples/41.brr"

DATA_EF3024:
	dw $0000,$002E
	incbin "data/sound/samples/42.brr"

DATA_EF3056:
	dw $0000,$002E
	incbin "data/sound/samples/43.brr"

DATA_EF3088:
	dw $0000,$002E
	incbin "data/sound/samples/44.brr"

DATA_EF30BA:
	dw $0000,$002E
	incbin "data/sound/samples/45.brr"

DATA_EF30EC:
	dw $0000,$002E
	incbin "data/sound/samples/46.brr"

DATA_EF311E:
	dw $0000,$002E
	incbin "data/sound/samples/47.brr"

DATA_EF3150:
	dw $0000,$002E
	incbin "data/sound/samples/48.brr"

DATA_EF3182:
	dw $0000,$002E
	incbin "data/sound/samples/49.brr"

DATA_EF31B4:
	dw $0000,$002E
	incbin "data/sound/samples/4A.brr"

DATA_EF31E6:
	dw $0A83,$0AEF
	incbin "data/sound/samples/4B.brr"

DATA_EF3CD9:
	dw $0000,$046E
	incbin "data/sound/samples/4C.brr"

DATA_EF414B:
	dw $0000,$056A
	incbin "data/sound/samples/4D.brr"

DATA_EF46B9:
	dw $0000,$0D0B
	incbin "data/sound/samples/4E.brr"

DATA_EF53C8:
	dw $02AC,$05B2
	incbin "data/sound/samples/4F.brr"

DATA_EF597E:
	dw $0000,$0BB5
	incbin "data/sound/samples/50.brr"

DATA_EF6537:
	dw $03BA,$04AD
	incbin "data/sound/samples/51.brr"

DATA_EF69E8:
	dw $0000,$02FD
	incbin "data/sound/samples/52.brr"

DATA_EF6CE9:
	dw $0000,$0264
	incbin "data/sound/samples/53.brr"

DATA_EF6F51:
	dw $0000,$05BB
	incbin "data/sound/samples/54.brr"

DATA_EF7510:
	dw $0000,$0642
	incbin "data/sound/samples/55.brr"

DATA_EF7B56:
	dw $064B,$077D
	incbin "data/sound/samples/56.brr"

DATA_EF82D7:
	dw $0000,$033C
	incbin "data/sound/samples/57.brr"

DATA_EF8617:
	dw $0000,$11CA
	incbin "data/sound/samples/58.brr"

DATA_EF97E5:
	dw $0000,$0A95
	incbin "data/sound/samples/59.brr"

DATA_EFA27E:
	dw $0000,$00A2
	incbin "data/sound/samples/5A.brr"

DATA_EFA324:
	dw $002D,$03D5
	incbin "data/sound/samples/5B.brr"

DATA_EFA6FD:
	dw $0000,$0561
	incbin "data/sound/samples/5C.brr"

DATA_EFAC62:
	dw $0000,$0195
	incbin "data/sound/samples/5D.brr"

DATA_EFADFB:
	dw $0000,$03B1
	incbin "data/sound/samples/5E.brr"

DATA_EFB1B0:
	dw $0000,$04C8
	incbin "data/sound/samples/5F.brr"

DATA_EFB67C:
	dw $0000,$03BA
	incbin "data/sound/samples/60.brr"

DATA_EFBA3A:
	dw $0000,$03C3
	incbin "data/sound/samples/61.brr"

DATA_EFBE01:
	dw $0000,$054F
	incbin "data/sound/samples/62.brr"

DATA_EFC354:
	dw $0000,$06C9
	incbin "data/sound/samples/63.brr"

DATA_EFCA21:
	dw $0762,$09B4
	incbin "data/sound/samples/64.brr"

DATA_EFD3D9:
	dw $027F,$05A9
	incbin "data/sound/samples/65.brr"

DATA_EFD986:
	dw $038D,$07CE
	incbin "data/sound/samples/66.brr"

DATA_EFE158:
	dw $03B1,$0711
	incbin "data/sound/samples/67.brr"

DATA_EFE86D:
	dw $0000,$02E2
	incbin "data/sound/samples/68.brr"

DATA_EFEB53:
	dw $0000,$0195
	incbin "data/sound/samples/69.brr"

DATA_EFECEC:
	dw $0090,$04DA
	incbin "data/sound/samples/6A.brr"

DATA_EFF1CA:
	dw $0000,$00AC
	incbin "data/sound/samples/6B.brr"

DATA_EFF27A:
	dw $025B,$02D9
	incbin "data/sound/samples/6C.brr"

check bankcross off
DATA_EFF557:
	dw $0000,$0AD4
	incbin "data/sound/samples/6D.brr"
check bankcross full

DATA_F0002F:
	dw $0000,$0120
	incbin "data/sound/samples/6E.brr"

DATA_F00153:
	dw $0000,$0238
	incbin "data/sound/samples/6F.brr"

DATA_F0038F:
	dw $0000,$033C
	incbin "data/sound/samples/70.brr"

DATA_F006CF:
	dw $0000,$019E
	incbin "data/sound/samples/71.brr"

DATA_F00871:
	dw $0000,$05FA
	incbin "data/sound/samples/72.brr"

DATA_F00E6F:
	dw $0000,$0252
	incbin "data/sound/samples/73.brr"

DATA_F010C5:
	dw $0000,$0798
	incbin "data/sound/samples/74.brr"

DATA_F01861:
	dw $0000,$04EC
	incbin "data/sound/samples/75.brr"

DATA_F01D51:
	dw $01B9,$0252
	incbin "data/sound/samples/76.brr"

DATA_F01FA7:
	dw $0000,$0156
	incbin "data/sound/samples/77.brr"

DATA_F02101:
	dw $0000,$0522
	incbin "data/sound/samples/78.brr"

DATA_F02627:
	dw $0000,$0048
	incbin "data/sound/samples/79.brr"

DATA_F02673:
	dw $0000,$084C
	incbin "data/sound/samples/7A.brr"

DATA_F02EC3:
	dw $0000,$0681
	incbin "data/sound/samples/7B.brr"

DATA_F03548:
	dw $0000,$08E5
	incbin "data/sound/samples/7C.brr"

DATA_F03E31:
	dw $0000,$017A
	incbin "data/sound/samples/7D.brr"

DATA_F03FAF:
	dw $0000,$0372
	incbin "data/sound/samples/7E.brr"

DATA_F04325:
	dw $0000,$052B
	incbin "data/sound/samples/7F.brr"

DATA_F04854:
	dw $0000,$00BD
	incbin "data/sound/samples/80.brr"

DATA_F04915:
	dw $0000,$0477
	incbin "data/sound/samples/81.brr"

DATA_F04D90:
	dw $0000,$0264
	incbin "data/sound/samples/82.brr"

DATA_F04FF8:
	dw $0000,$0894
	incbin "data/sound/samples/83.brr"

DATA_F05890:
	dw $0D5C,$0F81
	incbin "data/sound/samples/84.brr"

DATA_F06815:
	dw $0000,$052B
	incbin "data/sound/samples/85.brr"

DATA_F06D44:
	dw $0000,$0936
	incbin "data/sound/samples/86.brr"

DATA_F0767E:
	dw $0000,$04C8
	incbin "data/sound/samples/87.brr"

DATA_F07B4A:
	dw $0000,$0321
	incbin "data/sound/samples/88.brr"

DATA_F07E6F:
	dw $0000,$03F9
	incbin "data/sound/samples/89.brr"

DATA_F0826C:
	dw $0000,$0816
	incbin "data/sound/samples/8A.brr"

DATA_F08A86:
	dw $0000,$010E
	incbin "data/sound/samples/8B.brr"

DATA_F08B98:
	dw $00D8,$00FC
	incbin "data/sound/samples/8C.brr"

DATA_F08C98:
	dw $0075,$007E
	incbin "data/sound/samples/8D.brr"

DATA_F08D1A:
	dw $0000,$054F
	incbin "data/sound/samples/8E.brr"

DATA_F0926D:
	dw $0000,$03DE
	incbin "data/sound/samples/8F.brr"

DATA_F0964F:
	dw $0561,$0C60
	incbin "data/sound/samples/90.brr"

DATA_F0A2B3:
	dw $00D8,$0A5F
	incbin "data/sound/samples/91.brr"

DATA_F0AD16:
	dw $0000,$02EB
	incbin "data/sound/samples/92.brr"

DATA_F0B005:
	dw $0000,$0213
	incbin "data/sound/samples/93.brr"

DATA_F0B21C:
	dw $00BD,$010E
	incbin "data/sound/samples/94.brr"

DATA_F0B32E:
	dw $0000,$044A
	incbin "data/sound/samples/95.brr"

DATA_F0B77C:
	dw $0000,$03C3
	incbin "data/sound/samples/96.brr"

DATA_F0BB43:
	dw $0000,$09B4
	incbin "data/sound/samples/97.brr"

DATA_F0C4FB:
	dw $0000,$058E
	incbin "data/sound/samples/98.brr"

DATA_F0CA8D:
	dw $038D,$0585
	incbin "data/sound/samples/99.brr"

DATA_F0D016:
	dw $0000,$0156
	incbin "data/sound/samples/9A.brr"

DATA_F0D170:
	dw $0000,$018C
	incbin "data/sound/samples/9B.brr"

DATA_F0D300:
	dw $0000,$06ED
	incbin "data/sound/samples/9C.brr"

DATA_F0D9F1:
	dw $026D,$0EA0
	incbin "data/sound/samples/9D.brr"

DATA_F0E895:
	dw $0000,$04EC
	incbin "data/sound/samples/9E.brr"

DATA_F0ED85:
	dw $0000,$06E4
	incbin "data/sound/samples/9F.brr"

DATA_F0F46D:
	dw $05FA,$072D
	incbin "data/sound/samples/A0.brr"

DATA_F0FB9E:
	dw $0000,$0196
	incbin "data/sound/samples/A1.brr"

DATA_F0FD38:
	dw $0000,$01CC
	incbin "data/sound/samples/A2.brr"

check bankcross off
DATA_F0FF08:
	dw $0000,$02AC
	incbin "data/sound/samples/A3.brr"
check bankcross full

DATA_F101B8:
	dw $0000,$01BA
	incbin "data/sound/samples/A4.brr"

DATA_F10376:
	dw $0000,$0240
	incbin "data/sound/samples/A5.brr"

DATA_F105BA:
	dw $0000,$03DE
	incbin "data/sound/samples/A6.brr"

DATA_F1099C:
	dw $0000,$071B
	incbin "data/sound/samples/A7.brr"

DATA_F110BB:
	dw $0000,$04A5
	incbin "data/sound/samples/A8.brr"

DATA_F11564:
	dw $0000,$020B
	incbin "data/sound/samples/A9.brr"

DATA_F11773:
	dw $0000,$04FF
	incbin "data/sound/samples/AA.brr"

DATA_F11C76:
	dw $0000,$0213
	incbin "data/sound/samples/AB.brr"

DATA_F11E8D:
	dw $0000,$0037
	incbin "data/sound/samples/AC.brr"

DATA_F11EC8:
	dw $0000,$05A0
	incbin "data/sound/samples/AD.brr"

DATA_F1246C:
	dw $0000,$03D5
	incbin "data/sound/samples/AE.brr"

DATA_F12845:
	dw $0000,$001C
	incbin "data/sound/samples/AF.brr"

DATA_F12865:
	dw $0000,$001C
	incbin "data/sound/samples/B0.brr"

DATA_F12885:
	dw $0711,$0DE4
	incbin "data/sound/samples/B1.brr"

DATA_F1366D:
	dw $0000,$0F8B
	incbin "data/sound/samples/B2.brr"

DATA_F145FC:
	dw $0000,$04A4
	incbin "data/sound/samples/B3.brr"

DATA_F14AA4:
	dw $0000,$02EB
	incbin "data/sound/samples/B4.brr"

DATA_F14D93:
	dw $0000,$0750
	incbin "data/sound/samples/B5.brr"

DATA_F154E7:
	dw $0000,$02A4
	incbin "data/sound/samples/B6.brr"

DATA_F1578F:
	dw $0000,$0403
	incbin "data/sound/samples/B7.brr"

DATA_F15B96:
	dw $065D,$06DC
	incbin "data/sound/samples/B8.brr"

DATA_F16276:
	dw $0000,$0037
	incbin "data/sound/samples/B9.brr"

DATA_F162B1:
	dw $018C,$01F0
	incbin "data/sound/samples/BA.brr"

DATA_F164A5:
	dw $0000,$0ABA
	incbin "data/sound/samples/BB.brr"

DATA_F16F63:
	dw $0C7B,$0F43
	incbin "data/sound/samples/BC.brr"

DATA_F17EAA:
	dw $0519,$06EE
	incbin "data/sound/samples/BD.brr"

DATA_F1859C:
	dw $029A,$06C1
	incbin "data/sound/samples/BE.brr"

DATA_F18C61:
	dw $06AE,$06C9
	incbin "data/sound/samples/BF.brr"

DATA_F1932E:
	dw $0000,$0145
	incbin "data/sound/samples/C0.brr"

DATA_F19477:
	dw $0603,$0627
	incbin "data/sound/samples/C1.brr"

DATA_F19AA2:
	dw $01EF,$020A
	incbin "data/sound/samples/C2.brr"

DATA_F19CB0:
	dw $0000,$0156
	incbin "data/sound/samples/C3.brr"

DATA_F19E0A:
	incbin "data/sound/music/BaddiesOnParade.bin"

DATA_F1A165:
	dw $002E
	dw $002C
	dw $0030
	dw $0017
	dw $0015
	dw $0016
	dw $002B
	dw $000A
	dw $007C
	dw $FFFF

DATA_F1A179:
	incbin "data/sound/music/RockfaceRumble.bin"

DATA_F1A95C:
	dw $00BD
	dw $001C
	dw $002C
	dw $0058
	dw $001D
	dw $00BC
	dw $0030
	dw $0006
	dw $001B
	dw $0082
	dw $00AA
	dw $0095
	dw $0067
	dw $00B5
	dw $00B4
	dw $007E
	dw $0075
	dw $00BB
	dw $006F
	dw $009A
	dw $0069
	dw $006A
	dw $00B3
	dw $0081
	dw $006C
	dw $0094
	dw $0073
	dw $FFFF

DATA_F1A994:
	incbin "data/sound/music/MamaBird.bin"

DATA_F1AE3B:
	dw $0051
	dw $0031
	dw $0013
	dw $0018
	dw $0058
	dw $002C
	dw $0004
	dw $001E
	dw $00BF
	dw $009D
	dw $00A0
	dw $0071
	dw $007E
	dw $007F
	dw $0063
	dw $00B0
	dw $0008
	dw $FFFF

DATA_F1AE5F:
	incbin "data/sound/music/BananaBirdQueenChase.bin"

DATA_F1B633:
	dw $00B8
	dw $0010
	dw $002E
	dw $00A1
	dw $004B
	dw $000C
	dw $0021
	dw $000A
	dw $00BE
	dw $001D
	dw $00BD
	dw $00BB
	dw $00BA
	dw $0096
	dw $007E
	dw $0090
	dw $0091
	dw $006E
	dw $001C
	dw $00B1
	dw $0001
	dw $006A
	dw $0000
	dw $FFFF

DATA_F1B663:
	incbin "data/sound/sound_effects/GlobalSoundEffects.bin"

DATA_F1C05F:
	incbin "data/sound/sound_effects/DATA_F1C05F.bin"

DATA_F1C068:
	incbin "data/sound/sound_effects/DATA_F1C068.bin"

DATA_F1C2D0:
	incbin "data/sound/sound_effects/DATA_F1C2D0.bin"

DATA_F1C51A:
	incbin "data/sound/sound_effects/DATA_F1C51A.bin"

DATA_F1C6AE:
	incbin "data/sound/sound_effects/DATA_F1C6AE.bin"

DATA_F1C7D7:
	incbin "data/sound/sound_effects/DATA_F1C7D7.bin"

DATA_F1C9B1:
	incbin "data/sound/sound_effects/DATA_F1C9B1.bin"

DATA_F1CA7B:
	incbin "data/sound/sound_effects/DATA_F1CA7B.bin"

DATA_F1CB85:
	incbin "data/sound/sound_effects/DATA_F1CB85.bin"

DATA_F1CD07:
	incbin "data/sound/sound_effects/DATA_F1CD07.bin"

DATA_F1CDCE:
	incbin "data/sound/sound_effects/DATA_F1CDCE.bin"

DATA_F1CFB1:
	incbin "data/sound/sound_effects/DATA_F1CFB1.bin"

DATA_F1D109:
	incbin "data/sound/sound_effects/DATA_F1D109.bin"

DATA_F1D2F8:
	incbin "data/sound/sound_effects/DATA_F1D2F8.bin"

DATA_F1D4D7:
	incbin "data/sound/sound_effects/DATA_F1D4D7.bin"

DATA_F1D5FF:
	incbin "data/sound/sound_effects/DATA_F1D5FF.bin"

;boss sound effect set 2
DATA_F1D69E:
	incbin "data/sound/sound_effects/DATA_F1D69E.bin"

DATA_F1D89E:
	incbin "data/sound/sound_effects/DATA_F1D89E.bin"

DATA_F1D967:
	incbin "data/sound/sound_effects/DATA_F1D967.bin"

DATA_F1D9E0:
	incbin "data/sound/sound_effects/DATA_F1D9E0.bin"

DATA_F1DAFE:
	incbin "data/sound/sound_effects/DATA_F1DAFE.bin"

DATA_F1DCCA:
	incbin "data/sound/sound_effects/DATA_F1DCCA.bin"

DATA_F1DF30:
	incbin "data/sound/sound_effects/DATA_F1DF30.bin"

DATA_F1E180:
	incbin "data/sound/sound_effects/DATA_F1E180.bin"

DATA_F1E35C:
	incbin "data/sound/sound_effects/DATA_F1E35C.bin"

DATA_F1E481:
	incbin "data/sound/sound_effects/DATA_F1E481.bin"

DATA_F1E652:
	incbin "data/sound/sound_effects/DATA_F1E652.bin"

DATA_F1E8BC:
	incbin "data/sound/sound_effects/DATA_F1E8BC.bin"

DATA_F1EA41:
	incbin "data/sound/sound_effects/DATA_F1EA41.bin"
