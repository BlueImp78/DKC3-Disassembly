includeonce

active_frame_counter = $00

rng_result = $02
;rng_seed_1 = $03
;rng_seed_2 = $04
;rng_seed_3 = $05

spc_transaction = $06
current_song = $08

temp_1A = $1A
temp_1B = $1B
temp_1C = $1C
temp_1D = $1D
temp_1E = $1E
temp_1F = $1F
temp_20 = $20
temp_21 = $21
temp_22 = $22
temp_23 = $23
temp_24 = $24
temp_25 = $25
temp_26 = $26
temp_27 = $27
temp_28 = $28
temp_29 = $29
temp_2A = $2A
temp_2B = $2B
temp_2C = $2C
temp_2D = $2D
temp_2E = $2E
temp_2F = $2F
temp_30 = $30
temp_31 = $31
temp_32 = $32
temp_33 = $33
temp_34 = $34
temp_35 = $35
temp_36 = $36
temp_37 = $37
temp_38 = $38
temp_39 = $39
temp_3A = $3A
temp_3B = $3B
temp_3C = $3C
temp_3D = $3D
temp_3E = $3E
temp_3F = $3F
temp_40 = $40


NMI_pointer = $4A

;game_logic_pointer = $58
global_frame_counter = $5A

current_sprite_constants = $6A
sprite_constants_bank = $6B

current_sprite = $70
current_kong_control_variables = $72
alternate_kong_control_variables = $74
alternate_sprite = $76
current_colliding_sprite = $78
parry_index = $7A
current_mount = $7C
current_animal_type = $7E

next_oam_slot = $82

level_number = $C0
invincibility_timer = $CA


stack_end = $0100
stack = $01FF

oam_table = $0200
oam_attribute_table = $0400



stereo_select = $0432
camera_x_position = $0493
camera_y_position = $0497
camera_shake_properties = $04B2
current_game_mode = $04C4
active_player = $04C6


;controller logic
player_1_held = $04CA
player_2_held = $04CC

player_1_pressed = $04CE
player_2_pressed = $04D0

player_1_release = $04D2
player_2_release = $04D4

player_active_held = $04D6
player_inactive_held = $04D8
player_active_pressed = $04DA
player_inactive_pressed = $04DC

player_action = $04DE
player_action_button_held = $04E0
player_action_button_pressed = $04E2

pending_dma_hdma_channels = $04E4


screen_brightness = $04EC
screen_fade_speed = $04ED
screen_fade_timer = $04EE


sprite_return_address = $04F5
sprite_return_bank = $04F7

active_kong_sprite = $04F9
active_kong_control_variables = $04FB
follower_kong_sprite = $04FD
follower_kong_control_variables = $04FF


water_bubbles_x_speed = $0509
water_y_position = $050F
riverside_race_timer = $0535
active_cheats = $053B

game_state_flags = $05AF

current_kong = $05B5
parent_level_number = $05B9


bear_coin_count = $05C9
bonus_coin_count = $05CB
banana_bird_count = $05CD
dk_coin_count = $05CF
krematoa_gear_count = $05D1
banana_count = $05D3
lives_count = $05D5
kong_letter_flags = $05D7


current_world = $05E5
map_node_number = $05E7
current_map_vehicle = $05EB
inventory_flags = $0609
bazaar_store_products_flags = $0615


riverside_race_player_time = $062F


banana_bird_cave_flags = $0635

piracy_string_result = $06A3
intro_cutscene_flags = $06AB



language_select = $06D6


sprite_vram_allocation_table = $06D8
palette_upload_ring_buffer = $06FC

active_sprite_palettes_table = $073C
sprite_palette_reference_count = $074C




aux_sprite_slot = $080A
main_sprite_table = $0878
main_sprite_table_end = $1480
;main_sprite_table_end = $0878+(sizeof(sprite)*24)


dixie_sprite_slot = $0878
kiddy_sprite_slot = $08E6
non_kong_sprite_slots = $0954


dixie_control_variables = $1480
kiddy_control_variables = $14D2

sprite_render_table = $1524


current_interaction = $17C6


contact_flash_x_position = $1867
contact_flash_y_position = $1869


current_held_sprite = $186B
kong_animal_x_offset = $1885
kong_animal_y_offset = $1889
ellie_ammo_count = $1891


hud_current_banana_count = $18CB
hud_final_banana_count = $18CD
hud_banana_display_timer = $18CF
hud_lives_count = $18D1
hud_lives_to_add = $18D3
hud_lives_display_timer = $18D5

bonus_timer_index = $18E1
rocket_rush_fuel_amount = $18E9


timestop_flags = $194B
timestop_timer = $194D


boss_hit_points = $1B75


;Swanky minigame RAM/$1Bxx range looks like is also used by bosses
swanky_race_to_25_player_score = $1BAF
swanky_race_to_25_cranky_score = $1BB1
swanky_minigame_transition_timer = $1BC3
swanky_minigame_winner = $1BC5
swanky_minigame_cranky_dialogue_step = $1C33


file_select_cursor_position = $1C37
npc_screen_cursor_position = $1C49
kong_npc_chosen_option = $1C4A
file_select_file_to_copy = $1C89
file_select_gamemode_cursor_position = $1C8F
file_select_character_count = $1C91
file_select_current_character = $1CA0
music_test_cursor_position = $1CCA
file_select_sucessful_cheat_inputs = $1CCE


game_completion_percentage = $2B08




wram_base = $7E0000
wram_base_high = $7F0000

sram_base = $B06000


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

;owned inventory item flags = $0609

;level completion flags? = $0632

;DKC2 $0515 equivalent = $075C
;used to index a table in bonus_timer_main = $075E

;x pos of bonus coin when touched = $195F
;y pos of bonus coin when touched = $1961

;x offset of world map sprites (kongs included) = $196D
;y offset of world map sprites (kongs included) = $1947

;boat water trail sprite index = $1C8F

;sprite level data? = $7E6180