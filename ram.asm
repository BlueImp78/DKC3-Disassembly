;as a convention, any unused address will be named UNUSED_<address> and treated as a single byte
;Most addresses shall be assumed 2 bytes unless otherwise noted.  Single byte addresses won't be specifically
;noted as their addresses will carry that point.
;Duplicate addresses imply an address withg multiple contexts.
;Temporaries are named after the address they point to rather than a sequence.
;Temporaries used for any significant context should have local reassignment
;Temporaries are generally any addres used in multi contexts.

spc_transaction = $06
current_song = $08


NMI_pointer = $56
game_logic_pointer = $58
global_frame_counter = $5A
sprite_contants_pointer = $6A

current_sprite = $70
current_kong_control_variables = $72
alternate_sprite = $76
current_mount = $7C
current_animal_type = $7E

next_oam_slot = $82

level_number = $C0
active_frame_counter = $C2
invincibility_timer = $CA

stack_end = $0100
stack = $01FF

oam_table = $0200
oam_attribute_table = $0400



stereo_select = $0432
camera_x_position = $0493
camera_y_position = $0497
camera_shake_properties = $04B2
current_game_mode = $04C2
active_player = $04C6


;controller logic
player_1_held = $04CA
player_2_held = $04CC
player_1_pressed = $04CE
player_2_pressed = $04D0
player_1_release = $04D2
player_2_release = $04D4
player_active_held = $04D6
player_active_pressed = $04DA
player_action = $04DE
player_action_button_held = $04E0
player_action_button_pressed = $04E2


screen_brightness = $04EC
screen_fade_speed = $04ED


sprite_return_address = $04F5

active_kong_sprite = $04F9
active_kong_control_variables = $04FB
follower_kong_sprite = $04FD
follower_kong_control_variables = $04FF



water_level = $050F
active_cheats = $053B
parent_level_number = $05B9


bear_coin_count = $05C9
bonu_coin_count = $05CB
banana_bird_count = $05CD
dk_coin_count = $05CF
krematoa_gear_count = $05D1
banana_count = $05D3
lives_count = $05D5
kong_letter_flags = $05D7


current_world = $05E5
map_node_number = $05E7
current_boat = $05EB
inventory_flags = $0609
bazaar_store_products_flags = $0615


riverside_race_player_time = $062F


banana_bird_cave_flags = $0635

piracy_string_result = $06A3
intro_cutscene_flags = $06AB

language_select = $06D6


palette_upload_ring_buffer = $06FC


aux_sprite_table = $080A
main_sprite_table = $0878
main_sprite_table_end = $0878+(sizeof(sprite)*24)


dixie_control_variables = $1480
kiddy_control_variables = $14D2

sprite_render_table = $1524


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


rocket_rush_fuel_amount = $18E9


timestop_flags = $194B
timestop_timer = $194D


boss_hit_points = $1B75


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