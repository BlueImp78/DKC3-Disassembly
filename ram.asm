includeonce

active_frame_counter			= $00
rng_result				= $02
rng_seed_1				= $03
rng_seed_2				= $04
rng_seed_3				= $05
spc_transaction				= $06
current_song				= $08

temp_1A					= $1A
temp_1B					= $1B
temp_1C					= $1C
temp_1D					= $1D
temp_1E					= $1E
temp_1F					= $1F
temp_20					= $20
temp_21					= $21
temp_22					= $22
temp_23					= $23
temp_24					= $24
temp_25					= $25
temp_26					= $26
temp_27					= $27
temp_28					= $28
temp_29					= $29
temp_2A					= $2A
temp_2B					= $2B
temp_2C					= $2C
temp_2D					= $2D
temp_2E					= $2E
temp_2F					= $2F
temp_30					= $30
temp_31					= $31
temp_32					= $32
temp_33					= $33
temp_34					= $34
temp_35					= $35
temp_36					= $36
temp_37					= $37
temp_38					= $38
temp_39					= $39
temp_3A					= $3A
temp_3B					= $3B
temp_3C					= $3C
temp_3D					= $3D
temp_3E					= $3E
temp_3F					= $3F
temp_40					= $40

nmi_pointer				= $4A
complete_frame_nmi_pointer		= $4C
game_mode_pointer			= $4E
game_mode_pointer_bank			= $50
incomplete_frame_game_mode_ptr		= $52
incomplete_frame_game_mode_bank		= $54
nmi_sub_mode				= $56
game_sub_mode				= $58
global_frame_counter			= $5A

current_sprite_constants		= $6A
sprite_constants_bank			= $6B

current_sprite				= $70
current_kong_control_variables		= $72
alternate_kong_control_variables	= $74
alternate_sprite			= $76
current_colliding_sprite		= $78
parry_index				= $7A
current_mount				= $7C
current_animal_type			= $7E

next_oam_slot				= $82

RAM_00BA				= $BA

level_number				= $C0
gameplay_frame_counter			= $C2
gameplay_frame_counter_high		= $C4

invincibility_timer			= $CA

RAM_00F4				= $F4
RAM_00F6				= $F6

;START OF RAMIFIED BLOCK
stack_end				= $0100
stack					= $01FF
oam_table				= $0200
oam_attribute_table			= $0400
sound_effect_buffer			= $0420
UNUSED_0422				= $0422
RAM_0424				= $0424
RAM_0426				= $0426
RAM_0428				= $0428
RAM_042A				= $042A
RAM_042C				= $042C
RAM_042E				= $042E
RAM_0430				= $0430
stereo_select				= $0432
RAM_0434				= $0434
RAM_0436				= $0436
RAM_0438				= $0438
spc_command_buffer			= $0439
RAM_043A				= $043A
;...
RAM_044A				= $044A
RAM_044C				= $044C
RAM_044E				= $044E
RAM_0450				= $0450
RAM_0452				= $0452
RAM_0453				= $0453
RAM_0454				= $0454
RAM_0456				= $0456
;...
RAM_045C				= $045C
RAM_045E				= $045E
RAM_0460				= $0460
RAM_0462				= $0462
RAM_0464				= $0464
;...
RAM_0470				= $0470
RAM_0472				= $0472
RAM_0473				= $0473
RAM_0474				= $0474
RAM_0476				= $0476
RAM_0478				= $0478
RAM_047A				= $047A
RAM_047B				= $047B
RAM_047C				= $047C
RAM_047E				= $047E
RAM_047F				= $047F
RAM_0480				= $0480
RAM_0482				= $0482
RAM_0484				= $0484
RAM_0486				= $0486
RAM_0488				= $0488
RAM_048A				= $048A
RAM_048C				= $048C
RAM_048E				= $048E
RAM_0490				= $0490
RAM_0492				= $0492
camera_x_position			= $0493
RAM_0494				= $0494
RAM_0496				= $0496
camera_y_position			= $0497
RAM_0498				= $0498
RAM_049A				= $049A
RAM_049B				= $049B
RAM_049C				= $049C
RAM_049E				= $049E
RAM_049F				= $049F
RAM_04A0				= $04A0
RAM_04A2				= $04A2
RAM_04A4				= $04A4
RAM_04A6				= $04A6
RAM_04A8				= $04A8
RAM_04AA				= $04AA
RAM_04AC				= $04AC
RAM_04AD				= $04AD
RAM_04AE				= $04AE
RAM_04B0				= $04B0
camera_shake_properties			= $04B2
RAM_04B4				= $04B4
RAM_04B6				= $04B6
RAM_04B8				= $04B8
RAM_04BA				= $04BA
RAM_04BC				= $04BC
RAM_04BE				= $04BE
RAM_04C0				= $04C0
RAM_04C2				= $04C2
RAM_04C3				= $04C3
current_game_mode			= $04C4
active_player				= $04C6
RAM_04C8				= $04C8
player_1_held				= $04CA
player_2_held				= $04CC
player_1_pressed			= $04CE
player_2_pressed			= $04D0
player_1_release			= $04D2
player_2_release			= $04D4
player_active_held			= $04D6
player_inactive_held			= $04D8
player_active_pressed			= $04DA
player_inactive_pressed			= $04DC
player_action				= $04DE
player_action_button_held		= $04E0
player_action_button_pressed		= $04E2
pending_dma_hdma_channels		= $04E4
RAM_04E6				= $04E6
RAM_04E8				= $04E8
RAM_04EA				= $04EA
screen_brightness			= $04EC
screen_fade_speed			= $04ED
screen_fade_timer			= $04EE
RAM_04EF				= $04EF
RAM_04F1				= $04F1
RAM_04F3				= $04F3
sprite_return_address			= $04F5
sprite_return_bank			= $04F7
active_kong_sprite			= $04F9
active_kong_control_variables		= $04FB
follower_kong_sprite			= $04FD
follower_kong_control_variables		= $04FF
RAM_0501				= $0501
RAM_0503				= $0503
RAM_0505				= $0505
water_current_speed			= $0507
water_bubbles_x_speed			= $0509
RAM_050B				= $050B
RAM_050D				= $050D
water_y_position			= $050F
UNUSED_0511				= $0511
RAM_0513				= $0513
RAM_0515				= $0515
RAM_0517				= $0517
RAM_0519				= $0519
RAM_051B				= $051B
RAM_051D				= $051D
RAM_051F				= $051F
RAM_0521				= $0521
RAM_0523				= $0523
RAM_0525				= $0525
RAM_0527				= $0527
UNUSED_0529				= $0529
RAM_052B				= $052B
RAM_052D				= $052D
RAM_052F				= $052F
UNUSED_0531				= $0531
RAM_0533				= $0533
riverside_race_timer			= $0535
RAM_0536				= $0536
RAM_0537				= $0537
RAM_0538				= $0538
RAM_0539				= $0539
active_cheats				= $053B
RAM_053D				= $053D
RAM_053F				= $053F

if !j1 == 1
RAM_J_0541				= $0541
RAM_J_0543				= $0543
RAM_J_0545				= $0545
endif

RAM_0541				= $0541
RAM_0543				= $0543
RAM_0545				= $0545
RAM_0547				= $0547
RAM_0549				= $0549
RAM_054B				= $054B
RAM_054D				= $054D
RAM_054F				= $054F
RAM_0551				= $0551
;...
RAM_059B				= $059B
;...
RAM_05A3				= $05A3
;...
game_state_flags			= $05AF
RAM_05B1				= $05B1
RAM_05B3				= $05B3
current_kong				= $05B5
current_entrance			= $05B7
parent_level_number			= $05B9
RAM_05BB				= $05BB
RAM_05BD				= $05BD
RAM_05BF				= $05BF
RAM_05C1				= $05C1
RAM_05C3				= $05C3
RAM_05C5				= $05C5
RAM_05C6				= $05C6
RAM_05C7				= $05C7
bear_coin_count				= $05C9
bonus_coin_count			= $05CB
banana_bird_count			= $05CD
dk_coin_count				= $05CF
krematoa_gear_count			= $05D1
banana_count				= $05D3
lives_count				= $05D5
kong_letter_flags			= $05D7
RAM_05D8				= $05D8
RAM_05D9				= $05D9
RAM_05DA				= $05DA
RAM_05DC				= $05DC
RAM_05DE				= $05DE
UNUSED_05E1				= $05E1
RAM_05E3				= $05E3
current_world				= $05E5
map_node_number				= $05E7
RAM_05E9				= $05E9
current_map_vehicle			= $05EB
RAM_05ED				= $05ED
RAM_05EF				= $05EF
RAM_05F1				= $05F1
RAM_05F3				= $05F3
RAM_05F5				= $05F5
RAM_05F7				= $05F7
RAM_05F9				= $05F9
RAM_05FB				= $05FB
RAM_05FD				= $05FD
boomer_explosive_count			= $05FF
RAM_0601				= $0601
RAM_0602				= $0602
boomer_cog_count			= $0603
RAM_0604				= $0604
RAM_0605				= $0605
RAM_0607				= $0607
inventory_flags				= $0609
RAM_060B				= $060B
RAM_0611				= $0611
RAM_0613				= $0613

struct bear_dialogue $0615
	.bazaar:			skip 2	;$0615
	.blunder:			skip 2	;$0617
	.bramble:			skip 2	;$0619
	.barter:			skip 2	;$061B
	.barnacle:			skip 2	;$061D
	.brash:				skip 2	;$061F
	.blue:				skip 2	;$0621
	.bazooka:			skip 2	;$0623
	.blizzard:			skip 2	;$0625
	.benny:				skip 2	;$0627
	.bjorn:				skip 2	;$0629
	.baffle:			skip 2	;$062B
	.boomer:			skip 2	;$062D
endstruct

riverside_race_player_time		= $062F
RAM_0631				= $0631
RAM_0632				= $0632
RAM_0633				= $0633
RAM_0635				= $0635
RAM_0637				= $0637
RAM_0639				= $0639
RAM_063B				= $063B
RAM_0641				= $0641
RAM_0648				= $0648
RAM_0649				= $0649
RAM_064A				= $064A
RAM_064B				= $064B
RAM_064D				= $064D
RAM_064E				= $064E
RAM_0655				= $0655
RAM_0656				= $0656
RAM_0657				= $0657
RAM_0659				= $0659
RAM_065A				= $065A
RAM_0662				= $0662
RAM_0663				= $0663
RAM_0667				= $0667
RAM_066D				= $066D
RAM_0673				= $0673
RAM_0674				= $0674
RAM_0676				= $0676
RAM_067A				= $067A
RAM_067B				= $067B
RAM_067D				= $067D
RAM_067E				= $067E
RAM_067F				= $067F
RAM_0685				= $0685
RAM_0687				= $0687
RAM_068F				= $068F
RAM_0692				= $0692
RAM_0693				= $0693
RAM_0694				= $0694
RAM_0696				= $0696
RAM_0697				= $0697
RAM_06A1				= $06A1
piracy_string_result			= $06A3
intro_cutscene_flags			= $06AB
RAM_06AD				= $06AD
RAM_06AF				= $06AF
RAM_06B1				= $06B1
RAM_06CF				= $06CF
RAM_06D1				= $06D1
RAM_06D2				= $06D2
RAM_06D3				= $06D3
RAM_06D4				= $06D4
RAM_06D5				= $06D5
language_select				= $06D6
sprite_vram_allocation_table		= $06D8
RAM_06DA				= $06DA
RAM_06DC				= $06DC
RAM_06DE				= $06DE
RAM_06E0				= $06E0
RAM_06E2				= $06E2
RAM_06E6				= $06E6
RAM_06E8				= $06E8
RAM_06F2				= $06F2
RAM_06F4				= $06F4
RAM_06F6				= $06F6
palette_upload_ring_buffer		= $06FC
RAM_06FE				= $06FE
active_sprite_palettes_table		= $073C
RAM_0740				= $0740
RAM_0742				= $0742
sprite_palette_reference_count		= $074C
RAM_075C				= $075C
RAM_075E				= $075E
RAM_075F				= $075F
RAM_0760				= $0760
RAM_0761				= $0761
RAM_0763				= $0763
RAM_0765				= $0765
RAM_0767				= $0767
RAM_076D				= $076D
RAM_076F				= $076F
RAM_0771				= $0771
RAM_0773				= $0773
RAM_0775				= $0775
RAM_0777				= $0777
RAM_077B				= $077B
RAM_077D				= $077D
RAM_077F				= $077F
RAM_0781				= $0781
RAM_0785				= $0785
RAM_0786				= $0786
RAM_078F				= $078F
RAM_0790				= $0790
RAM_0792				= $0792
RAM_0793				= $0793

struct sprite_table $080A
	.slot_0:			skip sizeof(sprite)	;$080A (aux)
	.slot_1:			skip sizeof(sprite)	;$0878 (dixie)
	.slot_2:			skip sizeof(sprite)	;$08E6 (kiddy)
	.slot_3:			skip sizeof(sprite)	;$0954
	.slot_4:			skip sizeof(sprite)	;$09C2
	.slot_5:			skip sizeof(sprite)	;$0A30
	.slot_6:			skip sizeof(sprite)	;$0A9E
	.slot_7:			skip sizeof(sprite)	;$0B0C
	.slot_8:			skip sizeof(sprite)	;$0B7A
	.slot_9:			skip sizeof(sprite)	;$0BE8
	.slot_10:			skip sizeof(sprite)	;$0C56
	.slot_11:			skip sizeof(sprite)	;$0CC4
	.slot_12:			skip sizeof(sprite)	;$0D32
	.slot_13:			skip sizeof(sprite)	;$0DA0
	.slot_14:			skip sizeof(sprite)	;$0E0E
	.slot_15:			skip sizeof(sprite)	;$0E7C
	.slot_16:			skip sizeof(sprite)	;$0EEA
	.slot_17:			skip sizeof(sprite)	;$0F58
	.slot_18:			skip sizeof(sprite)	;$0FC6
	.slot_19:			skip sizeof(sprite)	;$1034
	.slot_20:			skip sizeof(sprite)	;$10A2
	.slot_21:			skip sizeof(sprite)	;$1110
	.slot_22:			skip sizeof(sprite)	;$117E
	.slot_23:			skip sizeof(sprite)	;$11EC
	.slot_24:			skip sizeof(sprite)	;$125A
	.slot_25:			skip sizeof(sprite)	;$12C8
	.slot_26:			skip sizeof(sprite)	;$1336
	.slot_27:			skip sizeof(sprite)	;$13A4
	.slot_28:			skip sizeof(sprite)	;$1412
	.end:
endstruct

dixie_control_variables			= $1480
RAM_1488				= $1488
RAM_148A				= $148A
kiddy_control_variables			= $14D2
RAM_14DA				= $14DA
RAM_14DC				= $14DC
sprite_render_table			= $1524
next_sprite_dma_buffer_slot		= $155E
RAM_1560				= $1560

;16 entries in U
;32 entries in J
struct sprite_dma $1562
	.size:				skip 2
	.destination:			skip 2
	.source_word:			skip 2
	.terminate:
	.source_bank:			skip 2
endstruct

RAM_15E2				= $15E2
RAM_15E4				= $15E4
RAM_15E6				= $15E6
RAM_15E8				= $15E8
RAM_15EA				= $15EA
RAM_15EC				= $15EC
RAM_15EE				= $15EE
RAM_15F0				= $15F0
RAM_15F2				= $15F2
RAM_15F4				= $15F4
RAM_15F6				= $15F6
RAM_15F8				= $15F8
RAM_15FA				= $15FA
RAM_15FC				= $15FC
RAM_15FE				= $15FE
RAM_1600				= $1600
RAM_1602				= $1602
;...
RAM_177E				= $177E
RAM_1780				= $1780
RAM_1782				= $1782
RAM_1784				= $1784
RAM_1786				= $1786	;Probably group manager sprite table
;...
current_interaction			= $17C6
RAM_17C8				= $17C8
RAM_17CA				= $17CA
RAM_17CC				= $17CC
RAM_17CE				= $17CE
RAM_17D0				= $17D0
RAM_17D2				= $17D2
RAM_17D4				= $17D4
RAM_17D6				= $17D6
RAM_17D8				= $17D8
RAM_17DA				= $17DA
RAM_17DB				= $17DB

struct sprite_clipping $1800
	.left:		skip 2
	.top:		skip 2
	.right:		skip 2
	.bottom:	skip 2
endstruct

RAM_1852				= $1852
RAM_1854				= $1854
RAM_1856				= $1856
RAM_1858				= $1858
RAM_185A				= $185A
RAM_185C				= $185C
RAM_185E				= $185E
RAM_1860				= $1860
RAM_1862				= $1862
sprite_collision_routine_address	= $1864
sprite_collision_routine_addr_high	= $1865
contact_flash_x_position		= $1867
contact_flash_y_position		= $1869
current_held_sprite			= $186B
;END OF RAMIFIED BLOCK

kong_animal_x_offset			= $1885

kong_animal_y_offset			= $1889
ellie_ammo_count			= $1891

hud_current_banana_count		= $18CB
hud_final_banana_count			= $18CD
hud_banana_display_timer		= $18CF
hud_lives_count				= $18D1
hud_lives_to_add			= $18D3
hud_lives_display_timer			= $18D5
hud_lives_icon_graphic_id		= $18D7

hud_lives_icon_y_pos			= $18DB

bonus_timer_index			= $18E1

rocket_rush_fuel_amount			= $18E9

timestop_flags				= $194B
timestop_timer				= $194D

boss_hit_points				= $1B75

;Swanky minigame RAM/$1Bxx range looks like is also used by bosses
swanky_race_to_25_player_score		= $1BAF
swanky_race_to_25_cranky_score		= $1BB1

swanky_minigame_transition_timer	= $1BC3
swanky_minigame_winner			= $1BC5

swanky_minigame_cranky_dialogue_step	= $1C33

file_select_cursor_position		= $1C37

npc_screen_cursor_position		= $1C49
kong_npc_chosen_option			= $1C4A

file_select_file_to_copy		= $1C89

file_select_gamemode_cursor_position	= $1C8F
file_select_character_count		= $1C91

file_select_current_character		= $1CA0

music_test_cursor_position		= $1CCA

file_select_sucessful_cheat_inputs	= $1CCE

RAM_1D89				= $1D89

game_completion_percentage		= $2B08

wram_base				= $7E0000
wram_base_high				= $7F0000

sram_base				= $B06000


;SPECULATIVE

;sprite placement parameter from level data = $EA
;sprite x position from level data = $EC
;sprite y position from level data = $EE

;DKC2 $0983 equivalent = $04E2

;bash_the_baddies_enemy_count = $051D (Could be used for other bonus things)

;squals on wheels alive rats = $0557

;debug_flags = $059B

;world_map_events = $05FB ($0400 = kremwood log moved)

;DKC2 $08C2 equivalent = $05B1

;Contains what special map screen to init = $05E3
;	Goes up by 2 so probably indexed without an ASL
;	00 = Wrinkly, 02 = funky, 04 = Swanky, 06 = Gamover(?), 08 = bird cave, 0A = Bear houses
;		(If bird cave or bear house, right byte tells which one to send you to.)

;owned inventory item flags = $0609

;level completion flags? = $0632

;DKC2 $0515 equivalent = $075C
;used to index a table in bonus_timer_main = $075E

;x pos of bonus coin when touched = $195F
;y pos of bonus coin when touched = $1961

;x offset of world map sprites (kongs included) = $196D
;y offset of world map sprites (kongs included) = $1947

;index of bleak fight kong (may be shared boss RAM) = $1BB9

;boat water trail sprite index = $1C8F

;sprite level data? = $7E6180