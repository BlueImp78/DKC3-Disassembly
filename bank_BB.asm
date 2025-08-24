;Command set 1 jump table
copy_or_return_1_entry:
	NOP					;$BB8000  \ Decompression command entry
	JMP copy_or_return_1			;$BB8001  /

stream_byte_1_entry:
	NOP					;$BB8004  \ Decompression command entry
	JMP stream_byte_1			;$BB8005  /

stream_word_1_entry:
	NOP					;$BB8008  \ Decompression command entry
	JMP stream_word_1			;$BB8009  /

stream_byte_fill_1_entry:
	NOP					;$BB800C  \ Decompression command entry
	JMP stream_byte_fill_1			;$BB800D  /

direct_byte_1_fill_1_entry:
	NOP					;$BB8010  \ Decompression command entry
	JMP direct_byte_1_fill_1		;$BB8011  /

direct_byte_2_fill_1_entry:
	NOP					;$BB8014  \ Decompression command entry
	JMP direct_byte_2_fill_1		;$BB8015  /

direct_word_put_1_entry:
	NOP					;$BB8018  \ Decompression command entry
	JMP direct_word_put_1			;$BB8019  /

direct_byte_1_put_1_entry:
	NOP					;$BB801C  \ Decompression command entry
	JMP direct_byte_1_put_1			;$BB801D  /

direct_byte_2_put_1_entry:
	NOP					;$BB8020  \ Decompression command entry
	JMP direct_byte_2_put_1			;$BB8021  /

back_copy_word_1_entry:
	NOP					;$BB8024  \ Decompression command entry
	JMP back_copy_word_1			;$BB8025  /

back_copy_1_entry:
	NOP					;$BB8028  \ Decompression command entry
	JMP back_copy_1				;$BB8029  /

back_copy_far_1_entry:
	NOP					;$BB802C  \ Decompression command entry
	JMP back_copy_far_1			;$BB802D  /

back_copy_arbitrary_1_entry:
	NOP					;$BB8030  \ Decompression command entry
	JMP back_copy_arbitrary_1		;$BB8031  /

duplicate_byte_1_entry:
	NOP					;$BB8034  \ Decompression command entry
	JMP duplicate_byte_1			;$BB8035  /

duplicate_word_1_entry:
	NOP					;$BB8038  \ Decompression command entry
	JMP duplicate_word_1			;$BB8039  /

copy_future_word_1_entry:
	NOP					;$BB803C  \ Decompression command entry
	JMP copy_future_word_1			;$BB803D  /

;Command set 2 jump table
copy_or_return_2_entry:
	JMP copy_or_return_2			;$BB8040  > Decompression command entry

stream_byte_2_entry:
	NOP					;$BB8043  \ Decompression command entry
	JMP stream_byte_2			;$BB8044  /

stream_word_2_entry:
	NOP					;$BB8047  \ Decompression command entry
	JMP stream_word_2			;$BB8048  /

stream_byte_fill_2_entry:
	NOP					;$BB804B  \ Decompression command entry
	JMP stream_byte_fill_2			;$BB804C  /

direct_byte_1_fill_2_entry:
	NOP					;$BB804F  \ Decompression command entry
	JMP direct_byte_1_fill_2		;$BB8050  /

direct_byte_2_fill_2_entry:
	NOP					;$BB8053  \ Decompression command entry
	JMP direct_byte_2_fill_2		;$BB8054  /

direct_word_put_2_entry:
	NOP					;$BB8057  \ Decompression command entry
	JMP direct_word_put_2			;$BB8058  /

direct_byte_1_put_2_entry:
	NOP					;$BB805B  \ Decompression command entry
	JMP direct_byte_1_put_2			;$BB805C  /

direct_byte_2_put_2_entry:
	NOP					;$BB805F  \ Decompression command entry
	JMP direct_byte_2_put_2			;$BB8060  /

back_copy_word_2_entry:
	NOP					;$BB8063  \ Decompression command entry
	JMP back_copy_word_2			;$BB8064  /

back_copy_2_entry:
	NOP					;$BB8067  \ Decompression command entry
	JMP back_copy_2				;$BB8068  /

back_copy_far_2_entry:
	NOP					;$BB806B  \ Decompression command entry
	JMP back_copy_far_2			;$BB806C  /

back_copy_arbitrary_2_entry:
	NOP					;$BB806F  \ Decompression command entry
	JMP back_copy_arbitrary_2		;$BB8070  /

duplicate_byte_2_entry:
	NOP					;$BB8073  \ Decompression command entry
	JMP duplicate_byte_2			;$BB8074  /

duplicate_word_2_entry:
	NOP					;$BB8077  \ Decompression command entry
	JMP duplicate_word_2			;$BB8078  /

copy_future_word_2_entry:
	NOP					;$BB807B  \ Decompression command entry
	JMP copy_future_word_2			;$BB807C  /

UNK_BB807F:
	db $12,$29,$DE,$B3,$BF

sprite_main_table:
%offset(sprite_main_bank, 2)
%offset(sprite_timestop_flag, 3)
	dl null_sprite_main-1				: db $00	;0000
	dl unknown_sprite_0004_main-1			: db $00	;0004
	dl unknown_sprite_0008_main-1			: db $00	;0008
	dl unknown_sprite_000C_main-1			: db $00	;000C
	dl head_to_head_dot_main-1			: db $00	;0010
	dl thrown_softball_main-1			: db $00	;0014
	dl unknown_sprite_0018_main-1			: db $00	;0018
	dl unknown_sprite_001C_main-1			: db $00	;001C
	dl arich_spit_main-1				: db $00	;0020
	dl unknown_sprite_0024_main-1			: db $00	;0024
	dl unknown_sprite_0028_main-1			: db $00	;0028
	dl thrown_snowball_main-1			: db $00	;002C
	dl barrel_shield_main-1				: db $00	;0030
	dl barrel_pieces_main-1				: db $00	;0034
	dl map_swimming_kong_splash_main-1		: db $00	;0038
	dl boat_water_trail_main-1			: db $00	;003C
	dl minkey_acorn_main-1				: db $00	;0040
	dl rotating_cylinder_key_main-1			: db $00	;0044
	dl bleak_fight_cursor_main-1			: db $00	;0048
	dl top_of_cotton_top_cove_waterfall_main-1	: db $00	;004C
	dl barbos_spike_projectile_main-1		: db $00	;0050
	dl barbos_eye_main-1				: db $00	;0054
	dl barbos_pupil_main-1				: db $00	;0058
	dl unknown_sprite_005C_main-1			: db $00	;005C
	dl bottom_of_right_ctc_waterfall_main-1		: db $00	;0060
	dl bottom_of_ctc_waterfall_main-1		: db $00	;0064
	dl play_mode_text_main-1			: db $00	;0068
	dl music_test_note_main-1			: db $00	;006C
	dl banana_bird_cave_cover_main-1		: db $00	;0070
	dl banana_bird_crystal_shards_main-1		: db $00	;0074
	dl ellie_horizontal_water_shot_main-1		: db $00	;0078
	dl ellie_diagonal_water_shot_main-1		: db $00	;007C
	dl squawks_egg_main-1				: db $00	;0080
	dl kremwood_forest_log_main-1			: db $00	;0084
	dl map_cannon_main-1				: db $00	;0088
	dl boomers_bomb_shelter_cogs_main-1		: db $00	;008C
	dl kaos_laser_head_flame_jet_main-1		: db $00	;0090
	dl chairlift_chair_main-1			: db $00	;0094
	dl sewer_stockpile_grate_main-1			: db $00	;0098
	dl unknown_sprite_009C_main-1			: db $00	;009C
	dl unknown_sprite_00A0_main-1			: db $00	;00A0
	dl unknown_sprite_00A4_main-1			: db $00	;00A4
	dl razor_ridge_pipe_main-1			: db $00	;00A8
	dl unknown_sprite_00AC_main-1			: db $00	;00AC
	dl unknown_sprite_00B0_main-1			: db $00	;00B0
	dl krematoa_bridge_main-1			: db $00	;00B4
	dl kuchuka_bomb_main-1				: db $00	;00B8
	dl mama_bird_barrier_gem_main-1			: db $00	;00BC
	dl map_banana_bird_main-1			: db $00	;00C0
	dl krool_fight_platform_main-1			: db $00	;00C4
	dl krool_fight_bg_decorations_main-1		: db $00	;00C8
	dl squirt_pupil_main-1				: db $00	;00CC
	dl minkey_main-1				: db $00	;00D0
	dl unknown_sprite_00D4_main-1			: db $00	;00D4 Spawns in save cave
	dl belcha_tooth_main-1				: db $00	;00D8
	dl unknown_sprite_00DC_main-1			: db $00	;00DC Cylinder handle? does nothing
	dl inventory_item_squares_main-1		: db $00	;00E0
	dl boss_prize_item_main-1			: db $00	;00E4
	dl squirt_main-1				: db $01	;00E8
	dl upwards_shot_barrel_main-1			: db $00	;00EC
	dl rare_logo_main-1				: db $00	;00F0
	dl unknown_sprite_00F4_main-1			: db $00	;00F4 In bank BA so debug sprite?
	dl funky_kong_main-1				: db $00	;00F8
	dl title_screen_sign_main-1			: db $00	;00FC
	dl sneek_wheel_main-1				: db $00	;0100
	dl area_name_text_main-1			: db $00	;0104 Also used for photo album text
	dl bleak_main-1					: db $00	;0108
	dl banana_bird_cave_crystal_main-1		: db $00	;010C
	dl boss_cutscene_text_main-1			: db $00	;0110
	dl the_end_sign_main-1				: db $00	;0114
	dl krool_main-1					: db $00	;0118
	dl krool_curtain_main-1				: db $00	;011C
	dl mama_bird_egg-1				: db $00	;0120
	dl level_end_flagpole_main-1			: db $01	;0124
	dl unknown_sprite_0128_main-1			: db $00	;0128 Spawns in swanky minigame
	dl unknown_sprite_012C_main-1			: db $00	;012C
	dl sprite_marker_main-1				: db $00	;0130
	dl group_spawn_manager_main-1			: db $00	;0134
	dl unknown_sprite_0138_main-1			: db $00	;0138 Another marker/group handler?
	dl stampede_trigger_main-1			: db $00	;013C
	dl unknown_sprite_0140_main-1			: db $00	;0140
	dl floor_door_main-1				: db $00	;0144
	dl exit_door_main-1				: db $00	;0148
	dl banana_main-1				: db $00	;014C
	dl green_banana_main-1				: db $00	;0150
	dl green_banana_spawner_main-1			: db $00	;0154
	dl kongfused_cliffs_rope_main-1			: db $00	;0158
	dl kongfused_cliffs_autoscroll_main-1		: db $00	;015C
	dl breakable_floor_main-1			: db $00	;0160
	dl kaos_head_explosion_spawner_main-1		: db $00	;0164
	dl vertical_autoscroll_main-1			: db $00	;0168
	dl waterfall_barrel_spawner_main-1		: db $00	;016C
	dl barrel_respawner_main-1			: db $00	;0170
	dl unknown_sprite_0174_main-1			: db $00	;0174
	dl buzz_swarm_spawner_main-1			: db $00	;0178
	dl squeals_on_wheels_door_handler_main-1	: db $00	;017C
	dl unknown_sprite_0180_main-1			: db $00	;0180 squeals on wheels related
	dl target_spawner_main-1			: db $00	;0184
	dl ripsaw_rage_handler_main-1			: db $00	;0188
	dl kuff_n_klout_handler_main-1			: db $00	;018C
	dl koin_handler_main-1				: db $00	;0190
	dl arich_back_hitbox_main-1			: db $00	;0194
	dl map_flag_main-1				: db $00	;0198
	dl title_screen_logo_main-1			: db $00	;019C
	dl unknown_sprite_01A0_main-1			: db $00	;01A0
	dl file_select_menu_main-1			: db $00	;01A4
	dl unknown_sprite_01A8_main-1			: db $00	;01A8
	dl brash_cabin_digital_display_main-1		: db $00	;01AC
	dl file_select_number_main-1			: db $00	;01B0
	dl banana_bird_cave_controller_main-1		: db $00	;01B4
	dl unknown_sprite_01B8_main-1			: db $00	;01B8
	dl unknown_sprite_01BC_main-1			: db $00	;01BC
	dl riverside_race_timer_main-1			: db $01	;01C0
	dl unknown_sprite_01C4_main-1			: db $00	;01C4
	dl unknown_sprite_01C8_main-1			: db $00	;01C8
	dl unknown_sprite_01CC_main-1			: db $00	;01CC
	dl lightning_bolt_spawner_main-1		: db $00	;01D0
	dl knautilus_sprite_mask_main-1			: db $00	;01D4
	dl player_krosshair_controller_main-1		: db $00	;01D8
	dl unknown_sprite_01DC_main-1			: db $00	;01DC
	dl unknown_sprite_01E0_main-1			: db $00	;01E0
	dl boss_cutscene_dialogue_handler_main-1	: db $00	;01E4
	dl belcha_main-1				: db $01	;01E8
	dl barbos_main-1				: db $01	;01EC
	dl swoopy_spawner_main-1			: db $00	;01F0
	dl squeals_on_wheels_tracker_main-1		: db $00	;01F4
	dl bazza_spawner_main-1				: db $00	;01F8
	dl banana_bird_main-1				: db $00	;01FC
	dl nibbla_handler_main-1			: db $00	;0200
	dl kaos_main-1					: db $01	;0204
	dl unknown_sprite_0208_main-1			: db $00	;0208
	dl unknown_sprite_020C_main-1			: db $00	;020C
	dl nintendo_presents_kong_main-1		: db $00	;0210
	dl rotating_cylinder_handle_main-1		: db $00	;0214
	dl rare_logo_kiddy_main-1			: db $00	;0218
	dl rare_logo_dixie_main-1			: db $00	;021C
	dl toboggan_main-1				: db $00	;0220
	dl toboggan_sparks_main-1			: db $01	;0224
	dl large_pipe_main-1				: db $00	;0228
	dl dixie_kong_main-1				: db $00	;022C
	dl kiddy_kong_main-1				: db $00	;0230
	dl ellie_main-1					: db $00	;0234
	dl enguarde_main-1				: db $00	;0238
	dl squawks_main-1				: db $00	;023C
	dl squitter_main-1				: db $00	;0240
	dl parry_main-1					: db $00	;0244
	dl web_shot_main-1				: db $00	;0248
	dl web_platform_main-1				: db $00	;024C
	dl animal_buddy_box_main-1			: db $00	;0250
	dl animal_buddy_icon_main-1			: db $01	;0254
	dl no_animal_buddy_sign_main-1			: db $01	;0258
	dl unknown_sprite_025C_main-1			: db $01	;025C
	dl respawn_suppressor_main-1			: db $00	;0260
	dl unknown_sprite_0264_main-1			: db $00	;0264
	dl fireball_landing_particles_main-1		: db $00	;0268
	dl burst_effect_main-1				: db $01	;026C Also checkpoint stars and smoke
	dl water_splash_main-1				: db $00	;0270
	dl smoke_puff_main-1				: db $01	;0274
	dl barrel_switch_s_main-1			: db $00	;0278
	dl mill_platform_main-1				: db $00	;027C
	dl unknown_sprite_0280_main-1			: db $00	;0280
	dl bear_coin_main-1				: db $00	;0284
	dl unknown_sprite_0288_main-1			: db $00	;0288
	dl bonus_coin_main-1				: db $00	;028C
	dl collectable_cog_main-1			: db $00	;0290
	dl kong_letters_main-1				: db $00	;0294
	dl bananas_main-1				: db $00	;0298
	dl extra_life_balloon_main-1			: db $00	;029C
	dl level_end_flag_main-1			: db $01	;02A0
	dl unknown_sprite_02A4_main-1			: db $01	;02A4
	dl bonus_timer_main-1				: db $00	;02A8
	dl rope_fire_main-1				: db $00	;02AC
	dl kong_water_splash_main-1			: db $00	;02B0
	dl barrel_cannon_main-1				: db $00	;02B4
	dl barrel_icons_main-1				: db $00	;02B8
	dl checkpoint_barrel_main-1			: db $00	;02BC
	dl barrel_main-1				: db $00	;02C0
	dl floating_dk_barrel_main-1			: db $00	;02C4
	dl boss_dk_barrel_main-1			: db $00	;02C8
	dl dk_barrel_main-1				: db $00	;02CC
	dl tnt_barrel_main-1				: db $00	;02D0
	dl steel_keg_main-1				: db $00	;02D4
	dl wooden_box_main-1				: db $00	;02D8
	dl waterfall_barrel_main-1			: db $00	;02DC
	dl invincibility_barrel_main-1			: db $00	;02E0
	dl fuel_can_main-1				: db $00	;02E4
	dl kaos_head_explosion_main-1			: db $00	;02E8
	dl rocket_main-1				: db $00	;02EC
	dl rocket_flame_main-1				: db $00	;02F0
	dl rocket_eyes_main-1				: db $00	;02F4
	dl sneek_main-1					: db $00	;02F8
	dl buzz_main-1					: db $00	;02FC
	dl koco_main-1					: db $00	;0300
	dl map_kong_main-1				: db $00	;0304
	dl stationary_display_sprite_main-1		: db $00	;0308
	dl map_vehicle_main-1				: db $00	;030C
	dl npc_kong_main-1				: db $00	;0310
	dl ending_swanky_main-1				: db $00	;0314
	dl moving_display_sprite_main-1			: db $00	;0318
	dl game_over_blocks_main-1			: db $00	;031C
	dl brothers_bear_main-1				: db $00	;0320
	dl brothers_bear_accessories_main-1		: db $00	;0324
	dl main_map_waterfall_main-1			: db $00	;0328
	dl unknown_sprite_032C_main-1			: db $00	;032C
	dl file_select_icon_main-1			: db $00	;0330
	dl chairlift_pulley_main-1			: db $00	;0334
	dl barnacles_bird_cage_main-1			: db $00	;0338
	dl stationary_display_sprite_2_main-1		: db $00	;033C
	dl brambles_vase_main-1				: db $00	;0340
	dl gyrocopter_blades_and_shadow_main-1		: db $00	;0344
	dl banana_bird_cave_kong_main-1			: db $00	;0348
	dl funky_rentals_particles_main-1		: db $00	;034C
	dl save_cave_selection_text_main-1		: db $00	;0350
	dl sky_high_secret_rock_main-1			: db $00	;0354
	dl krosshair_main-1				: db $00	;0358
	dl knautilus_main-1				: db $00	;035C
	dl banana_bird_crystal_main-1			: db $00	;0360
	dl krool_head_main-1				: db $00	;0364
	dl funky_cranky_secret_ending_main-1		: db $00	;0368
	dl wrinklys_save_cave_main-1			: db $00	;036C
	dl map_mama_bird_main-1				: db $00	;0370
	dl buzz_swarm_main-1				: db $00	;0374
	dl klasp_follow_main-1				: db $00	;0378
	dl klasp_auto_move_main-1			: db $00	;037C
	dl lemguin_main-1				: db $00	;0380
	dl nibbla_head_friendly_main-1			: db $00	;0384
	dl nibbla_body_friendly_main-1			: db $00	;0388
	dl door_lever_handle_main-1			: db $00	;038C
	dl metal_door_lever_controlled_main-1		: db $00	;0390
	dl door_gear_main-1				: db $00	;0394
	dl sneek_in_wheel_main-1			: db $00	;0398
	dl metal_door_sneek_controlled_main-1		: db $00	;039C
	dl arich_legs_main-1				: db $00	;03A0
	dl arich_head_main-1				: db $00	;03A4
	dl arich_pupil_main-1				: db $00	;03A8
	dl ripsaw_rage_sawdust_main-1			: db $00	;03AC
	dl unknown_sprite_03B0_main-1			: db $00	;03B0 (rekoil 2? no spawn script)
	dl lurchin_main-1				: db $00	;03B4
	dl bleak_snowball_main-1			: db $00	;03B8
	dl rekoil_main-1				: db $00	;03BC
	dl bleak_fight_kong_main-1			: db $01	;03C0
	dl kuff_n_klout_main-1				: db $00	;03C4
	dl kobble_and_skidda_main-1			: db $00	;03C8
	dl big_smoke_cloud_main-1			: db $00	;03CC
	dl koin_main-1					: db $00	;03D0
	dl dk_coin_main-1				: db $00	;03D4
	dl lemguin_spawner_main-1			: db $00	;03D8
	dl defeated_bleak_snowball_main-1		: db $00	;03DC
	dl knocka_main-1				: db $00	;03E0
	dl knocka_limbs_main-1				: db $00	;03E4
	dl bleak_fight_dk_barrel_main-1			: db $00	;03E8
	dl belcha_mouth_side_main-1			: db $00	;03EC
	dl belcha_barrel_main-1				: db $00	;03F0
	dl knik_knak_main-1				: db $00	;03F4
	dl krimp_main-1					: db $00	;03F8
	dl knautilus_fireball_shooter_main-1		: db $00	;03FC
	dl belcha_platform_main-1			: db $00	;0400
	dl barbos_mouth_main-1				: db $00	;0404
	dl purple_lurchin_main-1			: db $00	;0408
	dl barbos_green_lurchin_main-1			: db $00	;040C
	dl seashell_missle_main-1			: db $00	;0410
	dl bristles_main-1				: db $00	;0414
	dl krumple_main-1				: db $00	;0418
	dl swoopy_main-1				: db $00	;041C
	dl kuchuka_main-1				: db $00	;0420
	dl kuchuka_hand_main-1				: db $00	;0424
	dl flying_knik_knak_main-1			: db $00	;0428
	dl bazza_main-1					: db $00	;042C
	dl bounty_bass_main-1				: db $00	;0430
	dl booty_bird_main-1				: db $00	;0434
	dl unknown_sprite_0438_main-1			: db $00	;0438 \
	dl unknown_sprite_043C_main-1			: db $00	;043C  | No spawn script, moves
	dl unknown_sprite_0440_main-1			: db $00	;0440 /
	dl nid_main-1					: db $00	;0444
	dl bazuka_main-1				: db $00	;0448
	dl bazuka_barrel_main-1				: db $00	;044C
	dl barrel_switch_main-1				: db $00	;0450
	dl kopter_main-1				: db $00	;0454
	dl murky_mill_elevator_main-1			: db $00	;0458
	dl nibbla_head_main-1				: db $00	;045C
	dl nibbla_body_main-1				: db $00	;0460
	dl boss_prize_bonus_coin_main-1			: db $00	;0464
	dl boss_prize_bear_coin_main-1			: db $00	;0468
	dl kaos_laser_head_main-1			: db $00	;046C
	dl kaos_skull_head_main-1			: db $00	;0470
	dl kaos_flame_main-1				: db $00	;0474
	dl kaos_blade_main-1				: db $00	;0478
	dl kaos_boxing_glove_main-1			: db $00	;047C
	dl kaos_flame_spread_main-1			: db $00	;0480
	dl karbine_main-1				: db $00	;0484
	dl karbine_fireball_main-1			: db $00	;0488
	dl krosshair_fireball_main-1			: db $00	;048C
	dl gleamin_bream_main-1				: db $00	;0490
	dl kaos_cylinder_head_main-1			: db $00	;0494
	dl kaos_bombs_main-1				: db $00	;0498
	dl unknown_sprite_049C_main-1			: db $00	;049C Explosion?
	dl tnt_explosion_main-1				: db $00	;04A0
	dl krool_propeller_main-1			: db $00	;04A4
	dl kastle_kaos_lever_main-1			: db $00	;04A8
	dl electric_node_main-1				: db $00	;04AC
	dl krool_feet_main-1				: db $00	;04B0 (Also kaos hook chain)
	dl knautilus_fireball_main-1			: db $00	;04B4
	dl bg_steel_keg_main-1				: db $00	;04B8
	dl squirts_eye_part_main-1			: db $00	;04BC
	dl unknown_sprite_04C0_main-1			: db $00	;04C0
	dl cranky_kong_main-1				: db $00	;04C4
	dl timer_digit_main-1				: db $00	;04C8
	dl head_to_head_icon_main-1			: db $00	;04CC
	dl target_main-1				: db $00	;04D0
	dl swanky_minigame_kong_main-1			: db $00	;04D4
	dl swanky_kong_main-1				: db $00	;04D8
	dl swanky_kong_prize_main-1			: db $00	;04DC


disable_screen_wrapper:
	JMP disable_screen			;$BB8564

vram_payload_handler_global:
	JMP vram_payload_handler		;$BB8567

set_PPU_registers_global:
	JMP set_PPU_registers			;$BB856A

CODE_BB856D:
	JMP CODE_BB8DE8				;$BB856D

CODE_BB8570:
	JMP CODE_BB8DF4				;$BB8570

CODE_BB8573:
	JMP CODE_BB8DFE				;$BB8573

CODE_BB8576:
	JMP CODE_BB9957				;$BB8576

CODE_BB8579:
	JMP CODE_BB97B1				;$BB8579

CODE_BB857C:
	JMP CODE_BB8632				;$BB857C

CODE_BB857F:
	JMP init_sprite_render_order		;$BB857F

CODE_BB8582:
	JMP CODE_BBA647				;$BB8582

CODE_BB8585:
	JMP CODE_BB8F61				;$BB8585

CODE_BB8588:
	JMP CODE_BB8FAE				;$BB8588

CODE_BB858B:
	JMP CODE_BB8FDD				;$BB858B

apply_spawn_script_to_slot:
	JMP apply_spawn_script_to_slot_direct	;$BB858E

delete_sprite_handle_deallocation:
	JMP delete_sprite_handle_dealloc_direct	;$BB8591

delete_sprite_no_deallocation:
	JMP delete_sprite_no_dealloc_direct	;$BB8594

CODE_BB8597:
	JMP CODE_BB948D				;$BB8597

CODE_BB859A:
	JMP request_palette_direct_global	;$BB859A

CODE_BB859D:
	JMP dereference_sprite_palette_global	;$BB859D

CODE_BB85A0:
	JMP CODE_BB9785				;$BB85A0

CODE_BB85A3:
	JMP CODE_BBAB04				;$BB85A3

CODE_BB85A6:
	JMP CODE_BBAB3B				;$BB85A6

CODE_BB85A9:
	JMP CODE_BBADC1				;$BB85A9

CODE_BB85AC:
	JMP CODE_BBAD15				;$BB85AC Mark sprite as defeated in level data

CODE_BB85AF:
	JMP CODE_BBAC30				;$BB85AF

CODE_BB85B2:
	JMP CODE_BBAC47				;$BB85B2

CODE_BB85B5:
	JMP CODE_BB8F34				;$BB85B5

CODE_BB85B8:
	JMP CODE_BB8F12				;$BB85B8

CODE_BB85BB:
	JMP CODE_BBB426				;$BB85BB

CODE_BB85BE:
	JMP CODE_BBADD9				;$BB85BE

sprite_handler:
	JMP sprite_handler_direct		;$BB85C1

CODE_BB85C4:
	JMP CODE_BBB880				;$BB85C4

CODE_BB85C7:
	JMP CODE_BBA211				;$BB85C7

CODE_BB85CA:
	JMP CODE_BB8F18				;$BB85CA

CODE_BB85CD:
	JMP CODE_BB8F67				;$BB85CD

enable_timestop:
	JMP enable_timestop_direct		;$BB85D0

disable_timestop:
	JMP disable_timestop_direct		;$BB85D3

CODE_BB85D6:
	JMP CODE_BBBA95				;$BB85D6

CODE_BB85D9:
	JMP CODE_BB9592				;$BB85D9

CODE_BB85DC:
	JMP dereference_sprite_palette_global	;$BB85DC

CODE_BB85DF:
	JMP CODE_BB8A6F				;$BB85DF

CODE_BB85E2:
	JMP CODE_BBBAAE				;$BB85E2

CODE_BB85E5:
	JMP CODE_BB861E				;$BB85E5

CODE_BB85E8:
	JMP CODE_BB9474				;$BB85E8

CODE_BB85EB:
	JMP deallocate_sprite_vram_slot_global	;$BB85EB

CODE_BB85EE:
	JMP CODE_BB9503				;$BB85EE

CODE_BB85F1:
	JMP CODE_BBA1F3				;$BB85F1

CODE_BB85F4:
	JMP CODE_BB97AE				;$BB85F4

CODE_BB85F7:
	JMP CODE_BB8FA4				;$BB85F7

CODE_BB85FA:
	JMP CODE_BB9B06				;$BB85FA

CODE_BB85FD:
	JMP CODE_BB9772				;$BB85FD

CODE_BB8600:
	JMP CODE_BB9776				;$BB8600

CODE_BB8603:
	JMP CODE_BB8F3A				;$BB8603

CODE_BB8606:
	JMP CODE_BBADD4				;$BB8606

CODE_BB8609:
	JMP CODE_BB9144				;$BB8609

CODE_BB860C:
	JMP CODE_BB8F59				;$BB860C

CODE_BB860F:
	JMP CODE_BB975F				;$BB860F

CODE_BB8612:
	JMP CODE_BB8F2C				;$BB8612

CODE_BB8615:
	LDA $0454				;$BB8615
	PHA					;$BB8618
	LDA $0452				;$BB8619
	BRA CODE_BB8639				;$BB861C

CODE_BB861E:
	JSL CODE_BB8A3F				;$BB861E
	%pea_shift_dbr(wram_base>>8)		;$BB8622
	BRA CODE_BB8639				;$BB8625

ADDR_BB8627:
	LDA #$0000				;$BB8627
	%pea_shift_dbr(wram_base_high>>8)	;$BB862A
	BRA CODE_BB8639				;$BB862D

CODE_BB862F:
	LDA #$0000				;$BB862F
CODE_BB8632:
	JSL CODE_BB8A3F				;$BB8632
	%pea_shift_dbr(wram_base_high>>8)	;$BB8636
CODE_BB8639:					; Note: Decompression routine.
	STA $20					;$BB8639
	PLA					;$BB863B
	STA $22					;$BB863C
	STX $1C					;$BB863E
	STY $1E					;$BB8640
	PHB					;$BB8642
	PHY					;$BB8643
	LDA #$FFFF				;$BB8644
	STA $1A					;$BB8647
	LDA #$7E2100				;$BB8649
	STA $2E					;$BB864C
	LDA.w #$7E2100>>16			;$BB864E
	STA $30					;$BB8651
	STA $2C					;$BB8653
	LDA #$2000				;$BB8655
	STA $2A					;$BB8658
	LDA #$8001				;$BB865A
	STA $36					;$BB865D
	LDA #$8040				;$BB865F
	STA $32					;$BB8662
	LDX $20					;$BB8664
	LDY #$0001				;$BB8666
	SEP #$20				;$BB8669
	LDA $22					;$BB866B
	PHA					;$BB866D
	PLB					;$BB866E
	LDA [$1C],y				;$BB866F
	STA $3A					;$BB8671
	INY					;$BB8673
	LDA [$1C],y				;$BB8674
	STA $3B					;$BB8676
	INY					;$BB8678
	LDA [$1C],y				;$BB8679
	STA $3E					;$BB867B
	INY					;$BB867D
	LDA [$1C],y				;$BB867E
	STA $3F					;$BB8680
	INY					;$BB8682
	REP #$20				;$BB8683
	LDA [$1C],y				;$BB8685
	STA $3C					;$BB8687
	LDY #$0027				;$BB8689
	STZ $24					;$BB868C
	STZ $26					;$BB868E
	SEP #$20				;$BB8690
execute_command_set_1:				;	   |
	LDA [$1C],y				;$BB8692   |\ Read the first command byte
	INY					;$BB8694   | |
	STA $2E					;$BB8695   |/
	AND #$F0				;$BB8697   |\ Command = (byte & 0xF0) >> 2
	LSR					;$BB8699   | | Range $00-$3C
	LSR					;$BB869A   | |
	STA $36					;$BB869B   |/
	PEI ($36)				;$BB869D   | Push command address onto the stack
	RTS					;$BB869F  / Return to execute command

execute_command_set_2_wide:
	LDA $2E					;$BB86A0  \ Read next command byte
	AND #$0F				;$BB86A2   |\ Command = (byte & 0xF0) >> 2
	ASL					;$BB86A4   | | Range $3F-$7B
	ASL					;$BB86A5   | |
	ADC #$3F				;$BB86A6   |/
	STA $32					;$BB86A8   |
	PEI ($32)				;$BB86AA   | Push command address onto the stack
	RTS					;$BB86AC  / Return to execute command

execute_command_set_2:
	LDA $2A					;$BB86AD  \ Read next command byte
	AND #$0F				;$BB86AF   |\ Command = (byte & 0xF0) >> 2
	ASL					;$BB86B1   | | Range $3F-$7B
	ASL					;$BB86B2   | |
	ADC #$3F				;$BB86B3   | |
	STA $32					;$BB86B5   |/
	PEI ($32)				;$BB86B7   | Push command address onto the stack
	RTS					;$BB86B9  / Return to execute command

copy_or_return_1:
	LDA $2E					;$BB86BA  \ \ Read number of bytes to copy
	AND #$0F				;$BB86BC   | |
	BEQ finalize_decompression		;$BB86BE   |/ If zero bytes, conclude decompression
	STA $24					;$BB86C0   | Store number of bytes to copy
.copy_byte:					;	   |
	LDA [$1C],y				;$BB86C2   |\ Direct copy of up to 16 bytes
	INY					;$BB86C4   | |
	STA $0000,x				;$BB86C5   | |
	INX					;$BB86C8   | |
	DEC $24					;$BB86C9   | |
	BNE .copy_byte				;$BB86CB   |/
	JMP execute_command_set_1		;$BB86CD  / Read new command

finalize_decompression:
	REP #$20				;$BB86D0  \ \ Restore 16 bit A, data bank and Y
	PLY					;$BB86D2   | |
	PLB					;$BB86D3   |/
	TXA					;$BB86D4   |\ Calculate the number of decompressed bytes (stored in X)
	SEC					;$BB86D5   | | X = X - destination (Where X as an operand is the destination offset)
	SBC $20					;$BB86D6   | |
	TAX					;$BB86D8   |/
	LDA $1A					;$BB86D9   |\ Check if DMA should run
	BMI .skip_DMA				;$BB86DB   |/
	LDA $40					;$BB86DD   |\ This would be a be a DMA to VRAM
	STA.w PPU.vram_address			;$BB86DF   | | However $32 is a constant and will always be skipped (0xFFFF)
	LDA $20					;$BB86E2   | |
	STA DMA[$00].source_word		;$BB86E4   | |
	LDA $22					;$BB86E7   | |
	STA DMA[$00].source_bank		;$BB86E9   | |
	STX DMA[$00].size			;$BB86EC   | |
	LDA #$1801				;$BB86EF   | |
	STA DMA[$00].settings			;$BB86F2   | |
	SEP #$20				;$BB86F5   | |
	LDA #$01				;$BB86F7   | |
	STA.w CPU.enable_dma			;$BB86F9   | |
	REP #$20				;$BB86FC   |/
.skip_DMA:					;	   |
	RTL					;$BB86FE  / Done with decompression

copy_or_return_2:
	LDA [$1C],y				;$BB86FF  \ \ Load next operand
	INY					;$BB8701   |/
	STA $2A					;$BB8702   |\ Store in nibble lookup tables
	STA $2E					;$BB8704   |/
	LDA [$2A]				;$BB8706   |\ Load number of bytes to write
	BEQ finalize_decompression		;$BB8708   | | If zero bytes, conclude decompression
	STA $24					;$BB870A   |/ Store number of bytes to write
.copy_byte:					;	   |
	LDA [$2E]				;$BB870C   |\ operand2 = high byte
	STA $26					;$BB870E   |/
	LDA [$1C],y				;$BB8710   |\ Load next operand
	INY					;$BB8712   |/
	STA $2A					;$BB8713   |\ Store in nibble lookup tables
	STA $2E					;$BB8715   |/
	LDA $26					;$BB8717   | Load operand2
	ORA [$2A]				;$BB8719   |\ write operand2 | low nibble
	STA $0000,x				;$BB871B   |/
	INX					;$BB871E   |\ Continue until no there are no more bytes
	DEC $24					;$BB871F   | |
	BNE .copy_byte				;$BB8721   |/
	JMP execute_command_set_2_wide		;	  / Run next command;$BB8723

stream_byte_1:
	LDA [$2E]				;$BB8726  \ \ Load operand high nibble
	STA $26					;$BB8728   |/
	LDA [$1C],y				;$BB872A   |\ Load next operand
	INY					;$BB872C   | |
	STA $2A					;$BB872D   |/
	LDA $26					;$BB872F   | Load operand high nibble
	ORA [$2A]				;$BB8731   |\ write high nibble | low nibble
	STA $0000,x				;$BB8733   | |
	INX					;$BB8736   |/
	JMP execute_command_set_2		;$BB8737  / Run next command

stream_byte_2:
	LDA [$1C],y				;$BB873A  \ \ Copy one byte from the compression stream
	INY					;$BB873C   | |
	STA $0000,x				;$BB873D   | |
	INX					;$BB8740   |/
	JMP execute_command_set_1		;$BB8741  / Run next command

stream_word_1:
	LDA [$2E]				;$BB8744  \ \ Load operand high nibble into operand2
	STA $26					;$BB8746   |/
	LDA [$1C],y				;$BB8748   |\ Load next operand
	INY					;$BB874A   |/
	STA $2A					;$BB874B   |\ Store in nibble lookup tables
	STA $2E					;$BB874D   |/
	LDA $26					;$BB874F   | Load operand2
	ORA [$2A]				;$BB8751   |\  write operand2 | low nibble
	STA $0000,x				;$BB8753   | |
	INX					;$BB8756   |/
	LDA [$2E]				;$BB8757   |\ Load operand high nibble into operand2
	STA $26					;$BB8759   |/
	LDA [$1C],y				;$BB875B   |\ Load next operand
	INY					;$BB875D   |/
	STA $2A					;$BB875E   | Store in low nibble lookup table
	LDA $26					;$BB8760   | Load operand2
	ORA [$2A]				;$BB8762   |\  write operand2 | low nibble
	STA $0000,x				;$BB8764   | |
	INX					;$BB8767   |/
	JMP execute_command_set_2		;$BB8768  / Run next command

stream_word_2:
	REP #$20				;$BB876B  \ \ Copy one word from the compression stream
	LDA [$1C],y				;$BB876D   | |
	STA $0000,x				;$BB876F   | |
	INY					;$BB8772   | |
	INY					;$BB8773   | |
	INX					;$BB8774   | |
	INX					;$BB8775   | |
	SEP #$20				;$BB8776   |/
	JMP execute_command_set_1		;$BB8778  / Run next command

stream_byte_fill_1:
	LDA $2E					;$BB877B   |\ Load operand
	AND #$0F				;$BB877D   | | Count = operand & 0x0F + 3
	ADC #$03				;$BB877F   | |
	STA $24					;$BB8781   |/
	LDA [$1C],y				;$BB8783   |\  Load fill byte
	INY					;$BB8785   |/
.fill_byte:					;	   |
	STA $0000,x				;$BB8786   |\ Store and repeat with fill byte.
	INX					;$BB8789   | |
	DEC $24					;$BB878A   | |
	BNE .fill_byte				;$BB878C   |/
	JMP execute_command_set_1		;$BB878E  / Run next command

stream_byte_fill_2:
	LDA [$1C],y				;$BB8791   |\ Load next operand
	INY					;$BB8793   |/
	STA $2A					;$BB8794   |\ Store in nibble lookup tables
	STA $2E					;$BB8796   |/
	LDA [$2A]				;$BB8798   |\ Count = low nibble + 3
	ADC #$03				;$BB879A   | |
	STA $24					;$BB879C   |/
	LDA [$2E]				;$BB879E   |\ Operand2 = high nibble
	STA $26					;$BB87A0   |/
	LDA [$1C],y				;$BB87A2   |\ Load next operand
	INY					;$BB87A4   | |
	STA $2A					;$BB87A5   |/ Store low nibble look up
	LDA $26					;$BB87A7   |\ Load operand2
	ORA [$2A]				;$BB87A9   |/ fill byte =  operand2 | low nibble
.fill_byte:					;	   |
	STA $0000,x				;$BB87AB   |\ Store and repeat with fill byte.
	INX					;$BB87AE   | |
	DEC $24					;$BB87AF   | |
	BNE .fill_byte				;$BB87B1   |/
	JMP execute_command_set_2		;$BB87B3  / Run next command

direct_byte_1_fill_1:
	LDA $2E					;$BB87B6  \ \ Load operand
	AND #$0F				;$BB87B8   | | Count = operand & 0x0F + 3
	ADC #$03				;$BB87BA   | |
	STA $24					;$BB87BC   |/
	LDA $3A					;$BB87BE   | Load fill byte 1
.fill_byte:					;	   |
	STA $0000,x				;$BB87C0   |\ Store and repeat with fill byte.
	INX					;$BB87C3   | |
	DEC $24					;$BB87C4   | |
	BNE .fill_byte				;$BB87C6   |/
	JMP execute_command_set_1		;$BB87C8  / Run next command

direct_byte_1_fill_2:
	LDA [$1C],y				;$BB87CB  \ \ Load next operand
	INY					;$BB87CD   | |
	STA $2A					;$BB87CE   |/ Store in low nibble lookup
	LDA [$2A]				;$BB87D0   |\ Count = low nibble + 3
	ADC #$03				;$BB87D2   | |
	STA $24					;$BB87D4   |/
	LDA $3A					;$BB87D6   | Load fill byte 1
.fill_byte:					;	   |
	STA $0000,x				;$BB87D8   |\ Store and repeat with fill byte.
	INX					;$BB87DB   | |
	DEC $24					;$BB87DC   | |
	BNE .fill_byte				;$BB87DE   |/
	JMP execute_command_set_2		;$BB87E0  / Run next command

direct_byte_2_fill_1:
	LDA $2E					;$BB87E3  \ \  Load operand
	AND #$0F				;$BB87E5   | | Count = (operand & 0x0F) + 3
	ADC #$03				;$BB87E7   | |
	STA $24					;$BB87E9   |/
	LDA $3B					;$BB87EB   | Load fill byte 2
.fill_byte:					;	   |
	STA $0000,x				;$BB87ED   |\ Store and repeat with fill byte.
	INX					;$BB87F0   | |
	DEC $24					;$BB87F1   | |
	BNE .fill_byte				;$BB87F3   |/
	JMP execute_command_set_1		;$BB87F5  / Run next command

direct_byte_2_fill_2:
	LDA [$1C],y				;$BB87F8  \ \ Load next operand
	INY					;$BB87FA   | |
	STA $2A					;$BB87FB   |/ Store in low nibble lookup
	LDA [$2A]				;$BB87FD   |\ Count = low nibble + 3
	ADC #$03				;$BB87FF   | |
	STA $24					;$BB8801   |/
	LDA $3B					;$BB8803   | Load fill byte 2
.fill_byte:					;	   |
	STA $0000,x				;$BB8805   |\ Store and repeat with fill byte.
	INX					;$BB8808   | |
	DEC $24					;$BB8809   | |
	BNE .fill_byte				;$BB880B   |/
	JMP execute_command_set_2		;$BB880D  / Run next command

direct_word_put_1:
	REP #$20				;$BB8810  \ \ Store direct word
	LDA $3C					;$BB8812   | |
	STA $0000,x				;$BB8814   | |
	INX					;$BB8817   | |
	INX					;$BB8818   | |
	SEP #$20				;$BB8819   |/
	JMP execute_command_set_2_wide		;$BB881B  / Run next command

direct_word_put_2:
	REP #$20				;$BB881E  \ \ Store direct word
	LDA $3C					;$BB8820   | |
	STA $0000,x				;$BB8822   | |
	INX					;$BB8825   | |
	INX					;$BB8826   | |
	SEP #$20				;$BB8827   |/
	JMP execute_command_set_1		;$BB8829  / Run next command

direct_byte_1_put_1:
	LDA $3E					;$BB882C  \ \ Store direct byte 1
	STA $0000,x				;$BB882E   | |
	INX					;$BB8831   |/
	JMP execute_command_set_2_wide		;$BB8832  / Run next command

direct_byte_1_put_2:
	LDA $3E					;$BB8835  \ \ Store direct byte 1
	STA $0000,x				;$BB8837   | |
	INX					;$BB883A   |/
	JMP execute_command_set_1		;$BB883B  / Run next command

direct_byte_2_put_1:
	LDA $3F					;$BB883E  \ \ Store direct byte 2
	STA $0000,x				;$BB8840   | |
	INX					;$BB8843   |/
	JMP execute_command_set_2_wide		;$BB8844  / Run next command

direct_byte_2_put_2:
	LDA $3F					;$BB8847  \ \ Store direct byte 2
	STA $0000,x				;$BB8849   | |
	INX					;$BB884C   |/
	JMP execute_command_set_1		;$BB884D  / Run next command

back_copy_word_1:
	PHY					;$BB8850  \ Preserve compression index
	LDA $2E					;$BB8851   | Load operand
	AND #$0F				;$BB8853   |\  Offset = (operand & 0x0F) + 2
	ADC #$02				;$BB8855   | |
	STA $26					;$BB8857   |/
	REP #$20				;$BB8859   |\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA					;$BB885B   | | The new offset is stored in Y
	SEC					;$BB885C   | | Y = X - offset
	SBC $26					;$BB885D   | |
	TAY					;$BB885F   |/
	LDA $0000,y				;$BB8860   |\ Copy from previous data
	STA $0000,x				;$BB8863   | |
	INX					;$BB8866   | |
	INX					;$BB8867   |/
	SEP #$20				;$BB8868   | Return to 8 bit A
	PLY					;$BB886A   | Restore compression index
	JMP execute_command_set_1		;$BB886B  / Run next command

back_copy_word_2:
	LDA [$1C],y				;$BB886E  \ \ Load next operand
	INY					;$BB8870   | |
	STA $2A					;$BB8871   |/
	LDA [$2A]				;$BB8873   |\  Offset = low nibble + 2
	ADC #$02				;$BB8875   | |
	STA $26					;$BB8877   |/
	PHY					;$BB8879   | Preserve compression index
	REP #$20				;$BB887A   |\ Prepare to copy (1 word) from a previous point in decompressed data
	TXA					;$BB887C   | | The new offset is stored in Y
	SEC					;$BB887D   | | Y = X - offset
	SBC $26					;$BB887E   | |
	TAY					;$BB8880   |/
	LDA $0000,y				;$BB8881   |\ Copy from previous data
	STA $0000,x				;$BB8884   | |
	INX					;$BB8887   | |
	INX					;$BB8888   |/
	SEP #$20				;$BB8889   | Return to 8 bit A
	PLY					;$BB888B   | Restore compression index
	JMP execute_command_set_2		;$BB888C  / Run next command

back_copy_1:
	LDA $2E					;$BB888F  \ Load next operand
	AND #$0F				;$BB8891   |\  Count = (operand & 0x0F) + 3
	ADC #$03				;$BB8893   | |
	STA $24					;$BB8895   |/
	LDA [$1C],y				;$BB8897   |\ Load next operand
	STA $26					;$BB8899   | |
	INY					;$BB889B   |/
	PHY					;$BB889C   | Preserve compression index
	REP #$20				;$BB889D   |\ Prepare to copy from a previous point in decompressed data
	TXA					;$BB889F   | | The new offset is stored in Y
	SEC					;$BB88A0   | | Y = X - count - offset
	SBC $24					;$BB88A1   | |
	SEC					;$BB88A3   | |
	SBC $26					;$BB88A4   | |
	TAY					;$BB88A6   |/
	SEP #$20				;$BB88A7   | Back to 8 bit A
.byte_copy:					;	   |
	LDA $0000,y				;$BB88A9   |\ Copy from previous data
	INY					;$BB88AC   | |
	STA $0000,x				;$BB88AD   | |
	INX					;$BB88B0   |/
	DEC $24					;$BB88B1   |\ Copy count number of bytes
	BNE .byte_copy				;$BB88B3   |/
	PLY					;$BB88B5   | Restore compression index
	JMP execute_command_set_1		;$BB88B6  / Run next command

back_copy_2:
	LDA [$1C],y				;$BB88B9  \ \ Load next operand
	INY					;$BB88BB   |/
	STA $2A					;$BB88BC   |\ Store in nibble look up tables
	STA $2E					;$BB88BE   |/
	LDA [$2A]				;$BB88C0   |\ Count = low nibble + 3
	ADC #$03				;$BB88C2   | |
	STA $24					;$BB88C4   |/
	LDA [$2E]				;$BB88C6   |\ Store high nibble in offset
	STA $26					;$BB88C8   |/
	LDA [$1C],y				;$BB88CA   |\ Load next operand and store in the low nibble lookup
	INY					;$BB88CC   | |
	STA $2A					;$BB88CD   |/
	LDA [$2A]				;$BB88CF   |\ offset = low nibble | offset
	ORA $26					;$BB88D1   | |
	STA $26					;$BB88D3   |/
	PHY					;$BB88D5   | Preserve compression index
	REP #$20				;$BB88D6   |\ Prepare to copy from a previous point in decompressed data
	TXA					;$BB88D8   | | The new offset is stored in Y
	SEC					;$BB88D9   | | Y = X - count - offset
	SBC $24					;$BB88DA   | |
	SEC					;$BB88DC   | |
	SBC $26					;$BB88DD   | |
	TAY					;$BB88DF   |/
	SEP #$20				;$BB88E0   | Back to 8 bit A
.byte_copy:					;	   |
	LDA $0000,y				;$BB88E2   |\ Copy from previous data
	INY					;$BB88E5   | |
	STA $0000,x				;$BB88E6   | |
	INX					;$BB88E9   |/
	DEC $24					;$BB88EA   |\ Copy count number of bytes
	BNE .byte_copy				;$BB88EC   |/
	PLY					;$BB88EE   | Restore compression index
	JMP execute_command_set_2		;$BB88EF  / Run next command

back_copy_far_1:
	LDA $2E					;$BB88F2  \ Load next operand
	AND #$0F				;$BB88F4   |\  Count = (operand & 0x0F) + 3
	ADC #$03				;$BB88F6   | |
	STA $24					;$BB88F8   |/
	LDA [$1C],y				;$BB88FA   |\ Load next operand
	INY					;$BB88FC   | |
	XBA					;$BB88FD   |/ Store as high byte for the full operand
	LDA [$1C],y				;$BB88FE   |\ Load next operand store in high byte look up
	INY					;$BB8900   | |
	STA $2E					;$BB8901   |/
	REP #$20				;$BB8903   | Switch to 16 bit A
	LSR					;$BB8905   |\ Offset = (operand >> 4) + 0x0103
	LSR					;$BB8906   | |
	LSR					;$BB8907   | |
	LSR					;$BB8908   | |
	CLC					;$BB8909   | |
	ADC #$0103				;$BB890A   | |
	STA $28					;$BB890D   |/
	PHY					;$BB890F   | Preserve compression index
	TXA					;$BB8910   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB8911   | | Y = X - offset
	SBC $28					;$BB8912   | |
	TAY					;$BB8914   |/
	SEP #$20				;$BB8915   | Back to 8 bit A
.byte_copy:					;	   |
	LDA $0000,y				;$BB8917   |\ Copy from previous data
	INY					;$BB891A   | |
	STA $0000,x				;$BB891B   | |
	INX					;$BB891E   |/
	DEC $24					;$BB891F   |\ Copy count number of bytes
	BNE .byte_copy				;$BB8921   |/
	PLY					;$BB8923   | Restore compression index
	JMP execute_command_set_2_wide		;	  / Run next command;$BB8924

back_copy_far_2:
	LDA [$1C],y				;$BB8927  \ \ Load next operand
	INY					;$BB8929   | |
	STA $2A					;$BB892A   |/ Store in low nibble look up table
	LDA [$2A]				;$BB892C   |\ Count = low nibble + 3
	ADC #$03				;$BB892E   | |
	STA $24					;$BB8930   |/
	LDA $2A					;$BB8932   |\ Copy the low nibble to the operand high byte
	AND #$0F				;$BB8934   | |
	XBA					;$BB8936   |/
	LDA [$1C],y				;$BB8937   |\ Load the operand low byte
	INY					;$BB8939   |/
	REP #$20				;$BB893A   |\ Offset = operand + 0x0103
	ADC #$0103				;$BB893C   | |
	STA $28					;$BB893F   |/
	PHY					;$BB8941   | Preserve compression index
	TXA					;$BB8942   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB8943   | | Y = X - offset
	SBC $28					;$BB8944   | |
	TAY					;$BB8946   |/
	SEP #$20				;$BB8947   | Back to 8 bit A
.byte_copy:					;	   |
	LDA $0000,y				;$BB8949   |\ Copy from previous data
	INY					;$BB894C   | |
	STA $0000,x				;$BB894D   | |
	INX					;$BB8950   |/
	DEC $24					;$BB8951   |\ Copy count number of bytes
	BNE .byte_copy				;$BB8953   |/
	PLY					;$BB8955   | Restore compression index
	JMP execute_command_set_1		;$BB8956  / Run next command

back_copy_arbitrary_1:
	LDA $2E					;$BB8959  \ Load next operand
	AND #$0F				;$BB895B   |\  Count = (operand & 0x0F) + 3
	ADC #$03				;$BB895D   | |
	STA $24					;$BB895F   |/
	REP #$20				;$BB8961   |\ Read a big endian word for the offset
	LDA [$1C],y				;$BB8963   | |
	XBA					;$BB8965   | |
	STA $28					;$BB8966   |/
	INY					;$BB8968   |\ Increment the compression index
	INY					;$BB8969   |/
	PHY					;$BB896A   | Preserve compression index
	TXA					;$BB896B   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB896C   | | Y = X - offset
	SBC $28					;$BB896D   | |
	TAY					;$BB896F   |/
	SEP #$20				;$BB8970   | Back to 8 bit A
.byte_copy:					;	   |
	LDA $0000,y				;$BB8972   |\ Copy from previous data
	INY					;$BB8975   | |
	STA $0000,x				;$BB8976   | |
	INX					;$BB8979   |/
	DEC $24					;$BB897A   |\ Copy count number of bytes
	BNE .byte_copy				;$BB897C   |/
	PLY					;$BB897E   | Restore compression index
	JMP execute_command_set_1		;$BB897F  / Run next command

back_copy_arbitrary_2:
	LDA [$1C],y				;$BB8982  \ \ Load next operand
	INY					;$BB8984   | |
	STA $2A					;$BB8985   |/ Store in low nibble look up table
	LDA [$2A]				;$BB8987   |\ Count = low nibble + 3
	ADC #$03				;$BB8989   | |
	STA $24					;$BB898B   |/
	LDA $2A					;$BB898D   |\ Copy as the operand high byte
	XBA					;$BB898F   |/
	LDA [$1C],y				;$BB8990   |\ Load the operand low byte
	INY					;$BB8992   |/
	REP #$20				;$BB8993   | Set A to 16 bit
	ASL					;$BB8995   |\ Offset = (operand << 4)
	ASL					;$BB8996   | |
	ASL					;$BB8997   | |
	ASL					;$BB8998   | |
	STA $28					;$BB8999   |/
	AND #$00FF				;$BB899B   | Clear the high byte of the offset
	SEP #$20				;$BB899E   | Resume 8 bit A
	LDA [$1C],y				;$BB89A0   |\ Load next operand
	INY					;$BB89A2   |/
	PHY					;$BB89A3   | Preserve compression index
	STA $2A					;$BB89A4   | Store the operand in the low nibble look up table
	LDA [$2A]				;$BB89A6   |\ Load low nibble
	REP #$20				;$BB89A8   | |
	AND #$000F				;$BB89AA   |/
	ORA $28					;$BB89AD   |\ offset = offset | low nibble
	STA $28					;$BB89AF   |/
	TXA					;$BB89B1   |\ Prepare to copy from a previous point in decompressed data
	SEC					;$BB89B2   | | Y = X - offset
	SBC $28					;$BB89B3   | |
	TAY					;$BB89B5   |/
	SEP #$20				;$BB89B6   | Back to 8 bit A
.copy_byte:					;	   |
	LDA $0000,y				;$BB89B8   |\ Copy from previous data
	INY					;$BB89BB   | |
	STA $0000,x				;$BB89BC   | |
	INX					;$BB89BF   |/
	DEC $24					;$BB89C0   |\ Copy count number of bytes
	BNE .copy_byte				;$BB89C2   |/
	PLY					;$BB89C4   | Restore compression index
	JMP execute_command_set_2		;$BB89C5  / Run next command Run next command

duplicate_byte_1:
	DEX					;$BB89C8  \ \ Copy previous byte to the decompression stream
	LDA $0000,x				;$BB89C9   | |
	STA $0001,x				;$BB89CC   | |
	INX					;$BB89CF   | |
	INX					;$BB89D0   |/
	JMP execute_command_set_2_wide		;$BB89D1  / Run next command

duplicate_byte_2:
	DEX					;$BB89D4  \ \ Copy previous byte to the decompression stream
	LDA $0000,x				;$BB89D5   | |
	STA $0001,x				;$BB89D8   | |
	INX					;$BB89DB   | |
	INX					;$BB89DC   |/
	JMP execute_command_set_1		;$BB89DD  / Run next command

duplicate_word_1:
	REP #$20				;$BB89E0  \ \ Copy the previous word to the decompression stream
	DEX					;$BB89E2   | |
	DEX					;$BB89E3   | | First go back two bytes
	LDA $0000,x				;$BB89E4   | |
	STA $0002,x				;$BB89E7   | |
	SEP #$20				;$BB89EA   | |
	INX					;$BB89EC   | | Then jump ahead four bytes
	INX					;$BB89ED   | |
	INX					;$BB89EE   | |
	INX					;$BB89EF   |/
	JMP execute_command_set_2_wide		;$BB89F0  / Run next command

duplicate_word_2:
	REP #$20				;$BB89F3  \ \ Copy the previous word to the decompression stream
	DEX					;$BB89F5   | |
	DEX					;$BB89F6   | | First go back two bytes
	LDA $0000,x				;$BB89F7   | |
	STA $0002,x				;$BB89FA   | |
	SEP #$20				;$BB89FD   | |
	INX					;$BB89FF   | | Then jump ahead four bytes
	INX					;$BB8A00   | |
	INX					;$BB8A01   | |
	INX					;$BB8A02   |/
	JMP execute_command_set_1		;$BB8A03  / Run next command

copy_future_word_1:
	PHY					;$BB8A06  \ Preserve compression index
	LDA $2E					;$BB8A07   | Load next operand
	REP #$20				;$BB8A09   | Set A to 16 bit
	AND #$000F				;$BB8A0B   |\ Y = (operand << 1) + 7
	ASL					;$BB8A0E   | |
	ADC #$0007				;$BB8A0F   | |
	TAY					;$BB8A12   |/
	LDA [$1C],y				;$BB8A13   |\ Copy word from compression stream to the decompression stream
	STA $0000,x				;$BB8A15   |/
	SEP #$20				;$BB8A18   |\ Return to 8 bit A and increment the decompression index
	INX					;$BB8A1A   | |
	INX					;$BB8A1B   |/
	PLY					;$BB8A1C   | Restore compression index
	JMP execute_command_set_1		;$BB8A1D  / Run next command

copy_future_word_2:
	LDA [$1C],y				;$BB8A20  \ \ Load next operand
	INY					;$BB8A22   | |
	STA $2E					;$BB8A23   |/ Store to high nibble look up table
	REP #$20				;$BB8A25   | Set A to 16 bit
	AND #$00F0				;$BB8A27   |\ Operand = operand >> 3
	LSR					;$BB8A2A   | |
	LSR					;$BB8A2B   | |
	LSR					;$BB8A2C   |/
	PHY					;$BB8A2D   | Preserve compression index
	ADC #$0007				;$BB8A2E   |\ Y = operand + 7
	TAY					;$BB8A31   |/
	LDA [$1C],y				;$BB8A32   |\ Copy word from compression stream to the decompression stream
	STA $0000,x				;$BB8A34   |/
	SEP #$20				;$BB8A37   |\ Return to 8 bit A and increment the decompression index
	INX					;$BB8A39   | |
	INX					;$BB8A3A   |/
	PLY					;$BB8A3B   | Restore compression index
	JMP execute_command_set_2_wide		;$BB8A3C  / Run next command

CODE_BB8A3F:
	PHA					;$BB8A3F
	PHX					;$BB8A40
	PHY					;$BB8A41
	LDY #$0100				;$BB8A42
	TDC					;$BB8A45
	TAX					;$BB8A46
	SEP #$20				;$BB8A47
.build_high_nibble:				;
	STA $7E2100,x				;$BB8A49   |\ Store look up value (index & 0x0F) << 4
	CLC					;$BB8A4D   | |
	ADC #$10				;$BB8A4E   | |
	AND #$F0				;$BB8A50   |/
	INX					;$BB8A52   |\ Loop through all 256 values
	DEY					;$BB8A53   | |
	BNE .build_high_nibble			;$BB8A54   |/
	LDY #$0100				;$BB8A56   | Prepare to generate the low nibble table
	LDX #$0000				;$BB8A59   |
.build_low_nibble:				;	
	TXA					;$BB8A5C
	LSR					;$BB8A5D
	LSR					;$BB8A5E
	LSR					;$BB8A5F
	LSR					;$BB8A60
	STA $7E2000,x				;$BB8A61
	INX					;$BB8A65
	DEY					;$BB8A66
	BNE .build_low_nibble			;$BB8A67
	REP #$20				;$BB8A69
	PLY					;$BB8A6B
	PLX					;$BB8A6C
	PLA					;$BB8A6D
	RTL					;$BB8A6E

CODE_BB8A6F:
	JSR CODE_BB8A73				;$BB8A6F
	RTL					;$BB8A72

CODE_BB8A73:
	STA $24					;$BB8A73
	STY $26					;$BB8A75
	LDY #$0000				;$BB8A77
	STZ $3E					;$BB8A7A
	STZ $40					;$BB8A7C
	LDA [$24]				;$BB8A7E
	INY					;$BB8A80
	STA $28					;$BB8A81
	AND #$00E0				;$BB8A83
	XBA					;$BB8A86
	PHA					;$BB8A87
	LDA [$24],y				;$BB8A88
	TAY					;$BB8A8A
	INC $24					;$BB8A8B
	INC $24					;$BB8A8D
	INC $24					;$BB8A8F
	PLA					;$BB8A91
CODE_BB8A92:
	STA $7F0000,x				;$BB8A92
	INX					;$BB8A96
	INX					;$BB8A97
	DEY					;$BB8A98
	BNE CODE_BB8A92				;$BB8A99
	LDA $28					;$BB8A9B
	BIT #$0001				;$BB8A9D
	BEQ CODE_BB8AA5				;$BB8AA0
	JSR CODE_BB8ABF				;$BB8AA2
CODE_BB8AA5:
	LDA $28					;$BB8AA5
	BIT #$0002				;$BB8AA7
	BEQ CODE_BB8AAF				;$BB8AAA
	JSR CODE_BB8B4F				;$BB8AAC
CODE_BB8AAF:
	LDA $28					;$BB8AAF
	BIT #$0004				;$BB8AB1
	BEQ CODE_BB8AB9				;$BB8AB4
	JSR CODE_BB8B09				;$BB8AB6
CODE_BB8AB9:
	JSR CODE_BB8B97				;$BB8AB9
	JMP CODE_BB8BDD				;$BB8ABC

CODE_BB8ABF:
	LDA #$0000				;$BB8ABF
	PHA					;$BB8AC2
CODE_BB8AC3:
	LDA #$0002				;$BB8AC3
	JSR CODE_BB8C76				;$BB8AC6
	BIT #$0002				;$BB8AC9
	BEQ CODE_BB8AF4				;$BB8ACC
	AND #$0001				;$BB8ACE
	CLC					;$BB8AD1
	ROR					;$BB8AD2
	ROR					;$BB8AD3
	ROR					;$BB8AD4
	ROR					;$BB8AD5
	STA $22					;$BB8AD6
	LDA #$0006				;$BB8AD8
	JSR CODE_BB8C76				;$BB8ADB
	BEQ CODE_BB8B07				;$BB8ADE
	TAY					;$BB8AE0
	PLX					;$BB8AE1
CODE_BB8AE2:
	LDA $7F0000,x				;$BB8AE2
	ORA $22					;$BB8AE6
	STA $7F0000,x				;$BB8AE8
	INX					;$BB8AEC
	INX					;$BB8AED
	DEY					;$BB8AEE
	BNE CODE_BB8AE2				;$BB8AEF
	PHX					;$BB8AF1
	BRA CODE_BB8AC3				;$BB8AF2

CODE_BB8AF4:
	PLX					;$BB8AF4
	CLC					;$BB8AF5
	ROR					;$BB8AF6
	ROR					;$BB8AF7
	ROR					;$BB8AF8
	ROR					;$BB8AF9
	ORA $7F0000,x				;$BB8AFA
	STA $7F0000,x				;$BB8AFE
	INX					;$BB8B02
	INX					;$BB8B03
	PHX					;$BB8B04
	BRA CODE_BB8AC3				;$BB8B05

CODE_BB8B07:
	PLX					;$BB8B07
	RTS					;$BB8B08

CODE_BB8B09:
	LDA #$0000				;$BB8B09
	PHA					;$BB8B0C
CODE_BB8B0D:
	LDA #$0002				;$BB8B0D
	JSR CODE_BB8C76				;$BB8B10
	BIT #$0002				;$BB8B13
	BEQ CODE_BB8B3C				;$BB8B16
	AND #$0001				;$BB8B18
	CLC					;$BB8B1B
	ROR					;$BB8B1C
	ROR					;$BB8B1D
	STA $22					;$BB8B1E
	LDA #$0006				;$BB8B20
	JSR CODE_BB8C76				;$BB8B23
	BEQ CODE_BB8B4D				;$BB8B26
	TAY					;$BB8B28
	PLX					;$BB8B29
CODE_BB8B2A:
	LDA $7F0000,x				;$BB8B2A
	ORA $22					;$BB8B2E
	STA $7F0000,x				;$BB8B30
	INX					;$BB8B34
	INX					;$BB8B35
	DEY					;$BB8B36
	BNE CODE_BB8B2A				;$BB8B37
	PHX					;$BB8B39
	BRA CODE_BB8B0D				;$BB8B3A

CODE_BB8B3C:
	PLX					;$BB8B3C
	CLC					;$BB8B3D
	ROR					;$BB8B3E
	ROR					;$BB8B3F
	ORA $7F0000,x				;$BB8B40
	STA $7F0000,x				;$BB8B44
	INX					;$BB8B48
	INX					;$BB8B49
	PHX					;$BB8B4A
	BRA CODE_BB8B0D				;$BB8B4B

CODE_BB8B4D:
	PLX					;$BB8B4D
	RTS					;$BB8B4E

CODE_BB8B4F:
	LDA #$0000				;$BB8B4F
	PHA					;$BB8B52
CODE_BB8B53:
	LDA #$0002				;$BB8B53
	JSR CODE_BB8C76				;$BB8B56
	BIT #$0002				;$BB8B59
	BEQ CODE_BB8B83				;$BB8B5C
	AND #$0001				;$BB8B5E
	CLC					;$BB8B61
	ROR					;$BB8B62
	ROR					;$BB8B63
	ROR					;$BB8B64
	STA $22					;$BB8B65
	LDA #$0006				;$BB8B67
	JSR CODE_BB8C76				;$BB8B6A
	BEQ CODE_BB8B95				;$BB8B6D
	TAY					;$BB8B6F
	PLX					;$BB8B70
CODE_BB8B71:
	LDA $7F0000,x				;$BB8B71
	ORA $22					;$BB8B75
	STA $7F0000,x				;$BB8B77
	INX					;$BB8B7B
	INX					;$BB8B7C
	DEY					;$BB8B7D
	BNE CODE_BB8B71				;$BB8B7E
	PHX					;$BB8B80
	BRA CODE_BB8B53				;$BB8B81

CODE_BB8B83:
	PLX					;$BB8B83
	CLC					;$BB8B84
	ROR					;$BB8B85
	ROR					;$BB8B86
	ROR					;$BB8B87
	ORA $7F0000,x				;$BB8B88
	STA $7F0000,x				;$BB8B8C
	INX					;$BB8B90
	INX					;$BB8B91
	PHX					;$BB8B92
	BRA CODE_BB8B53				;$BB8B93

CODE_BB8B95:
	PLX					;$BB8B95
	RTS					;$BB8B96

CODE_BB8B97:
	LDA #$0000				;$BB8B97
	PHA					;$BB8B9A
CODE_BB8B9B:
	LDA #$0004				;$BB8B9B
	JSR CODE_BB8C76				;$BB8B9E
	BIT #$0008				;$BB8BA1
	BEQ CODE_BB8BCA				;$BB8BA4
	AND #$0007				;$BB8BA6
	XBA					;$BB8BA9
	ASL					;$BB8BAA
	ASL					;$BB8BAB
	STA $22					;$BB8BAC
	LDA #$0004				;$BB8BAE
	JSR CODE_BB8C76				;$BB8BB1
	BEQ CODE_BB8BDB				;$BB8BB4
	TAY					;$BB8BB6
	PLX					;$BB8BB7
CODE_BB8BB8:
	LDA $7F0000,x				;$BB8BB8
	ORA $22					;$BB8BBC
	STA $7F0000,x				;$BB8BBE
	INX					;$BB8BC2
	INX					;$BB8BC3
	DEY					;$BB8BC4
	BNE CODE_BB8BB8				;$BB8BC5
	PHX					;$BB8BC7
	BRA CODE_BB8B9B				;$BB8BC8

CODE_BB8BCA:
	PLX					;$BB8BCA
	XBA					;$BB8BCB
	ASL					;$BB8BCC
	ASL					;$BB8BCD
	ORA $7F0000,x				;$BB8BCE
	STA $7F0000,x				;$BB8BD2
	INX					;$BB8BD6
	INX					;$BB8BD7
	PHX					;$BB8BD8
	BRA CODE_BB8B9B				;$BB8BD9

CODE_BB8BDB:
	PLX					;$BB8BDB
	RTS					;$BB8BDC

CODE_BB8BDD:
	LDA #$0000				;$BB8BDD
	PHA					;$BB8BE0
CODE_BB8BE1:
	LDA #$0004				;$BB8BE1
	JSR CODE_BB8C76				;$BB8BE4
	XBA					;$BB8BE7
	STA $20					;$BB8BE8
	LDA #$0008				;$BB8BEA
	JSR CODE_BB8C76				;$BB8BED
	ORA $20					;$BB8BF0
	BIT #$0C00				;$BB8BF2
	BEQ CODE_BB8C65				;$BB8BF5
	BIT #$0800				;$BB8BF7
	BEQ CODE_BB8C43				;$BB8BFA
	BIT #$0400				;$BB8BFC
	BEQ CODE_BB8C22				;$BB8BFF
	AND #$03FF				;$BB8C01
	STA $22					;$BB8C04
	LDA #$0004				;$BB8C06
	JSR CODE_BB8C76				;$BB8C09
	TAY					;$BB8C0C
	PLX					;$BB8C0D
CODE_BB8C0E:
	LDA $7F0000,x				;$BB8C0E
	ORA $22					;$BB8C12
	DEC $22					;$BB8C14
	STA $7F0000,x				;$BB8C16
	INX					;$BB8C1A
	INX					;$BB8C1B
	DEY					;$BB8C1C
	BNE CODE_BB8C0E				;$BB8C1D
	PHX					;$BB8C1F
	BRA CODE_BB8BE1				;$BB8C20

CODE_BB8C22:
	AND #$03FF				;$BB8C22
	STA $22					;$BB8C25
	LDA #$0004				;$BB8C27
	JSR CODE_BB8C76				;$BB8C2A
	TAY					;$BB8C2D
	PLX					;$BB8C2E
CODE_BB8C2F:
	LDA $7F0000,x				;$BB8C2F
	ORA $22					;$BB8C33
	INC $22					;$BB8C35
	STA $7F0000,x				;$BB8C37
	INX					;$BB8C3B
	INX					;$BB8C3C
	DEY					;$BB8C3D
	BNE CODE_BB8C2F				;$BB8C3E
	PHX					;$BB8C40
	BRA CODE_BB8BE1				;$BB8C41

CODE_BB8C43:
	AND #$03FF				;$BB8C43
	STA $22					;$BB8C46
	LDA #$0006				;$BB8C48
	JSR CODE_BB8C76				;$BB8C4B
	BEQ CODE_BB8C74				;$BB8C4E
	TAY					;$BB8C50
	PLX					;$BB8C51
CODE_BB8C52:
	LDA $7F0000,x				;$BB8C52
	ORA $22					;$BB8C56
	STA $7F0000,x				;$BB8C58
	INX					;$BB8C5C
	INX					;$BB8C5D
	DEY					;$BB8C5E
	BNE CODE_BB8C52				;$BB8C5F
	PHX					;$BB8C61
	JMP CODE_BB8BE1				;$BB8C62

CODE_BB8C65:
	PLX					;$BB8C65
	ORA $7F0000,x				;$BB8C66
	STA $7F0000,x				;$BB8C6A
	INX					;$BB8C6E
	INX					;$BB8C6F
	PHX					;$BB8C70
	JMP CODE_BB8BE1				;$BB8C71

CODE_BB8C74:
	PLX					;$BB8C74
	RTS					;$BB8C75

CODE_BB8C76:
	STA $1C					;$BB8C76
	LDA $3E					;$BB8C78
	TAX					;$BB8C7A
	AND #$0006				;$BB8C7B
	CLC					;$BB8C7E
	ADC $1C					;$BB8C7F
	CLC					;$BB8C81
	ADC #CODE_BB8CA5			;$BB8C82
	STA $1E					;$BB8C85
	LDA $40					;$BB8C87
	LSR					;$BB8C89
	LSR					;$BB8C8A
	CLC					;$BB8C8B
	ADC $3E					;$BB8C8C
	LSR					;$BB8C8E
	LSR					;$BB8C8F
	LSR					;$BB8C90
	TAY					;$BB8C91
	TXA					;$BB8C92
	CLC					;$BB8C93
	ADC $1C					;$BB8C94
	STA $3E					;$BB8C96
	LDA $40					;$BB8C98
	ADC #$0000				;$BB8C9A
	STA $40					;$BB8C9D
	LDA [$24],y				;$BB8C9F
	XBA					;$BB8CA1
	JMP ($001E)				;$BB8CA2

CODE_BB8CA5:
	LSR					;$BB8CA5
	LSR					;$BB8CA6
	LSR					;$BB8CA7
	LSR					;$BB8CA8
	LSR					;$BB8CA9
	LSR					;$BB8CAA
	LSR					;$BB8CAB
	LSR					;$BB8CAC
	LSR					;$BB8CAD
	LSR					;$BB8CAE
	LSR					;$BB8CAF
	LSR					;$BB8CB0
	LSR					;$BB8CB1
	LSR					;$BB8CB2
	LSR					;$BB8CB3
	LSR					;$BB8CB4
	LDX $1C					;$BB8CB5
	AND.l DATA_BB8CBC-$02,x			;$BB8CB7
	RTS					;$BB8CBB

DATA_BB8CBC:
	dw $0003, $000F
	dw $003F, $00FF

set_PPU_registers:
	PHB					;$BB8CC4
	%pea_shift_dbr(DATA_FD294E)
	PLB					;$BB8CC5
	PLB					;$BB8CC6
	SEP #$20				;$BB8CC7
	ASL					;$BB8CC9
	TAY					;$BB8CCA
	LDX.w DATA_FD294E,y			;$BB8CCB
	TXY					;$BB8CCE
.next_register:
	LDX.w DATA_FD294E,y			;$BB8CCF
	BEQ .return				;$BB8CD2
	INY					;$BB8CD4
	INY					;$BB8CD5
	STX $3A					;$BB8CD6
	ASL $3B					;$BB8CD8
	BCC .single_register			;$BB8CDA
	LSR $3B					;$BB8CDC
	LDX $3A					;$BB8CDE
	LDA.w DATA_FD294E,y			;$BB8CE0
	STA $00,x				;$BB8CE3
	INX					;$BB8CE5
	INY					;$BB8CE6
.single_register:
	LDA.w DATA_FD294E,y			;$BB8CE7
	STA $00,x				;$BB8CEA
	INY					;$BB8CEC
	BRA .next_register			;$BB8CED

.return:
	REP #$20				;$BB8CEF
	PLB					;$BB8CF1
	RTL					;$BB8CF2

vram_payload_handler:
	PHB					;$BB8CF6
	%pea_shift_dbr(DATA_FD1B03)		;$BB8CF7
	PLB					;$BB8CFA
	PLB					;$BB8CFB
	ASL					;$BB8CFC
	TAY					;$BB8CFD
	LDX.w DATA_FD1B03,y			;$BB8CFE
CODE_BB8D01:
	SEP #$20				;$BB8D01
	LDA.w DATA_FD1B03,x			;$BB8D03
	BEQ CODE_BB8D6F				;$BB8D06
	LDA.w DATA_FD1B03+$04,x			;$BB8D08
	BMI CODE_BB8D73				;$BB8D0B
	LDA.w DATA_FD1B03,x			;$BB8D0D
	ORA #$C0				;$BB8D10
	STA $44					;$BB8D12
	LDA #$7F				;$BB8D14
	STA.l DMA[$00].source_bank		;$BB8D16
	REP #$20				;$BB8D1A
	LDA #$0000				;$BB8D1C
	STA.l DMA[$00].source_word		;$BB8D1F
	LDA.w DATA_FD1B03+$01,x			;$BB8D23
	STA $42					;$BB8D26
	LDA.w DATA_FD1B03+$03,x			;$BB8D28
	STA.l PPU.vram_address			;$BB8D2B
	PHX					;$BB8D2F
	LDA.w DATA_FD1B03+$05,x			;$BB8D30
	INC					;$BB8D33
	AND #$FFFE				;$BB8D34
	TAY					;$BB8D37
	TAX					;$BB8D38
CODE_BB8D39:
	LDA [$42],y				;$BB8D39
	STA $7F0000,x				;$BB8D3B
	DEY					;$BB8D3F
	DEY					;$BB8D40
	TYX					;$BB8D41
	BPL CODE_BB8D39				;$BB8D42
	PLX					;$BB8D44
	SEP #$20				;$BB8D45
CODE_BB8D47:
	LDA.w DATA_FD1B03+$05,x			;$BB8D47
	STA.l DMA[$00].size_low			;$BB8D4A
	LDA.w DATA_FD1B03+$06,x			;$BB8D4E
	STA.l DMA[$00].size_high		;$BB8D51
	LDA.b #PPU.vram_write_low		;$BB8D55
	STA.l DMA[$00].destination		;$BB8D57
	LDA #$01				;$BB8D5B
	STA.l DMA[$00].control			;$BB8D5D
	STA.l CPU.enable_dma			;$BB8D61
	REP #$20				;$BB8D65
	TXA					;$BB8D67
	CLC					;$BB8D68
	ADC #$0007				;$BB8D69
	TAX					;$BB8D6C
	BRA CODE_BB8D01				;$BB8D6D

CODE_BB8D6F:
	REP #$20				;$BB8D6F
	PLB					;$BB8D71
	RTL					;$BB8D72

CODE_BB8D73:
	REP #$20				;$BB8D73
	LDY.w DATA_FD1B03+$01,x			;$BB8D75
	LDA.w DATA_FD1B03,x			;$BB8D78
	AND #$00C0				;$BB8D7B
	LSR					;$BB8D7E
	LSR					;$BB8D7F
	LSR					;$BB8D80
	LSR					;$BB8D81
	LSR					;$BB8D82
	PHX					;$BB8D83
	TAX					;$BB8D84
	JMP (DATA_BB8D88,x)			;$BB8D85

DATA_BB8D88:
	dw CODE_BB8D90
	dw CODE_BB8DCC
	dw CODE_BB8DE4
	dw CODE_BB8DE4

CODE_BB8D90:
	PLX					;$BB8D90
	LDA.w DATA_FD1B03,x			;$BB8D91
	ORA #$00C0				;$BB8D94
	AND #$00FF				;$BB8D97
	PHX					;$BB8D9A
	TYX					;$BB8D9B
	TAY					;$BB8D9C
	PHB					;$BB8D9D
	PHK					;$BB8D9E
	PLB					;$BB8D9F
	JSL CODE_BB862F				;$BB8DA0
	PLB					;$BB8DA4
	PLX					;$BB8DA5
CODE_BB8DA6:
	SEP #$20				;$BB8DA6
	LDA.w DATA_FD1B03+$03,x			;$BB8DA8
	STA.l PPU.vram_address_low		;$BB8DAB
	LDA.w DATA_FD1B03+$04,x			;$BB8DAF
	AND #$7F				;$BB8DB2
	STA.l PPU.vram_address_high		;$BB8DB4
	LDA #$7F				;$BB8DB8
	STA.l DMA[$00].source_bank		;$BB8DBA
	REP #$20				;$BB8DBE
	LDA #$0000				;$BB8DC0
	STA.l DMA[$00].source_word		;$BB8DC3
	SEP #$20				;$BB8DC7
	BRL CODE_BB8D47				;$BB8DC9

CODE_BB8DCC:
	PLX					;$BB8DCC
	PHX					;$BB8DCD
	LDA.w DATA_FD1B03,x			;$BB8DCE
	ORA #$00C0				;$BB8DD1
	AND #$00FF				;$BB8DD4
	TAY					;$BB8DD7
	LDA.w DATA_FD1B03+$01,x			;$BB8DD8
	LDX #$0000				;$BB8DDB
	JSR CODE_BB8A73				;$BB8DDE
	PLX					;$BB8DE1
	BRA CODE_BB8DA6				;$BB8DE2

CODE_BB8DE4:
	PLX					;$BB8DE4
	JMP CODE_BB8D47				;$BB8DE5

CODE_BB8DE8:
	STX $1A					;$BB8DE8
	ASL					;$BB8DEA
	TAX					;$BB8DEB
	LDA.l DATA_FD54E9,x			;$BB8DEC
	LDX $1A					;$BB8DF0
	BRA CODE_BB8DFE				;$BB8DF2

CODE_BB8DF4:
	STX $1A					;$BB8DF4
	ASL					;$BB8DF6
	TAX					;$BB8DF7
	LDA.l sprite_palette_table,x		;$BB8DF8
	LDX $1A					;$BB8DFC
CODE_BB8DFE:
	PHA					;$BB8DFE
	LDA $0775				;$BB8DFF
	BIT #$4008				;$BB8E02
	BEQ CODE_BB8E14				;$BB8E05
	BIT #$4000				;$BB8E07
	BEQ CODE_BB8E11				;$BB8E0A
	JSR CODE_BB8E38				;$BB8E0C
	BRA CODE_BB8E14				;$BB8E0F

CODE_BB8E11:
	JSR CODE_BB8E53				;$BB8E11
CODE_BB8E14:
	PLA					;$BB8E14
	STA DMA[$00].source_word		;$BB8E15
	TXA					;$BB8E18
	ASL					;$BB8E19
	ASL					;$BB8E1A
	ASL					;$BB8E1B
	STA DMA[$00].size			;$BB8E1C
	LDA #$2200				;$BB8E1F
	STA DMA[$00].settings			;$BB8E22
	SEP #$20				;$BB8E25
	LDA #$FD				;$BB8E27
	STA DMA[$00].source_bank		;$BB8E29
	TYA					;$BB8E2C
	STA PPU.cgram_address			;$BB8E2D
	LDA #$01				;$BB8E30
	STA CPU.enable_dma			;$BB8E32
	REP #$20				;$BB8E35
	RTL					;$BB8E37

CODE_BB8E38:
	LDA $03,S				;$BB8E38
	STA $1C					;$BB8E3A
	LDA #$2D80				;$BB8E3C
	STA $40					;$BB8E3F
	TXA					;$BB8E41
	ASL					;$BB8E42
	ASL					;$BB8E43
	STA $1A					;$BB8E44
	%pea_shift_dbr($8E7E00)			;$BB8E46
	PLB					;$BB8E49
	PHX					;$BB8E4A
	PHY					;$BB8E4B
	JSR CODE_BB8E6E				;$BB8E4C
	PLY					;$BB8E4F
	PLX					;$BB8E50
	PLB					;$BB8E51
	RTS					;$BB8E52

CODE_BB8E53:
	LDA $03,S				;$BB8E53
	STA $20					;$BB8E55
	LDA #$2D80				;$BB8E57
	STA $2E					;$BB8E5A
	TXA					;$BB8E5C
	ASL					;$BB8E5D
	ASL					;$BB8E5E
	STA $30					;$BB8E5F
	%pea_shift_dbr($8E7E00)			;$BB8E61
	PLB					;$BB8E64
	PHX					;$BB8E65
	PHY					;$BB8E66
	JSR CODE_BB8EAB				;$BB8E67
	PLY					;$BB8E6A
	PLX					;$BB8E6B
	PLB					;$BB8E6C
	RTS					;$BB8E6D

CODE_BB8E6E:
	LDX $1C					;$BB8E6E
	LDA $FD0000,x				;$BB8E70
	STA $3A					;$BB8E74
	AND #$001F				;$BB8E76
	STA $3C					;$BB8E79
	LDA $3A					;$BB8E7B
	LSR					;$BB8E7D
	LSR					;$BB8E7E
	LSR					;$BB8E7F
	LSR					;$BB8E80
	LSR					;$BB8E81
	AND #$001F				;$BB8E82
	CLC					;$BB8E85
	ADC $3C					;$BB8E86
	STA $3C					;$BB8E88
	LDA $3B					;$BB8E8A
	LSR					;$BB8E8C
	AND #$001F				;$BB8E8D
	CLC					;$BB8E90
	ADC $3C					;$BB8E91
	ASL					;$BB8E93
	TAX					;$BB8E94
	LDY $40					;$BB8E95
	LDA.L DATA_FD41C7,x			;$BB8E97
	STA $0000,y				;$BB8E9B
	INC $40					;$BB8E9E
	INC $40					;$BB8EA0
	INC $1C					;$BB8EA2
	INC $1C					;$BB8EA4
	DEC $1A					;$BB8EA6
	BNE CODE_BB8E6E				;$BB8EA8
	RTS					;$BB8EAA

CODE_BB8EAB:
	LDX $20					;$BB8EAB
	LDA $FD0000,x				;$BB8EAD
	STA $000022				;$BB8EB1
	STA $3A					;$BB8EB5
	AND #$001F				;$BB8EB7
	STA $3C					;$BB8EBA
	LDA $3A					;$BB8EBC
	LSR					;$BB8EBE
	LSR					;$BB8EBF
	LSR					;$BB8EC0
	LSR					;$BB8EC1
	LSR					;$BB8EC2
	AND #$001F				;$BB8EC3
	CLC					;$BB8EC6
	ADC $3C					;$BB8EC7
	STA $3C					;$BB8EC9
	LDA $3B					;$BB8ECB
	LSR					;$BB8ECD
	AND #$001F				;$BB8ECE
	CLC					;$BB8ED1
	ADC $3C					;$BB8ED2
	ASL					;$BB8ED4
	TAX					;$BB8ED5
	LDA.l DATA_FD41D7,x			;$BB8ED6
	STA $000024				;$BB8EDA
	LDA #$0018				;$BB8EDE
	STA $3E					;$BB8EE1
	LDA #$0008				;$BB8EE3
	STA $40					;$BB8EE6
	JSR CODE_BBBD04				;$BB8EE8
	LDY $2E					;$BB8EEB
	STA $0000,y				;$BB8EED
	INC $2E					;$BB8EF0
	INC $2E					;$BB8EF2
	INC $20					;$BB8EF4
	INC $20					;$BB8EF6
	DEC $30					;$BB8EF8
	BNE CODE_BB8EAB				;$BB8EFA
	RTS					;$BB8EFC

init_sprite_render_order:
	LDX #$0000				;$BB8EFD
	LDA #aux_sprite_slot			;$BB8F00
.next_slot:
	STA sprite_render_table,x		;$BB8F03
	CLC					;$BB8F06
	ADC.w #sizeof(sprite)			;$BB8F07
	INX					;$BB8F0A
	INX					;$BB8F0B
	CPX #$003A				;$BB8F0C
	BNE .next_slot				;$BB8F0F
	RTL					;$BB8F11

CODE_BB8F12:
	TYX					;$BB8F12
	LDA.l DATA_FF218C,x			;$BB8F13
	TAY					;$BB8F17
CODE_BB8F18:
	PHY					;$BB8F18
	JSR CODE_BB8F8B				;$BB8F19
	PLY					;$BB8F1C
	BCS CODE_BB8F2B				;$BB8F1D
	STZ sprite.placement_number,x		;$BB8F1F
	LDA #$0005				;$BB8F21
	STA sprite.placement_parameter,x	;$BB8F24
	STZ sprite.visibility,x			;$BB8F26
	BRL CODE_BB8FE3				;$BB8F28

CODE_BB8F2B:
	RTL					;$BB8F2B

CODE_BB8F2C:
	TYX					;$BB8F2C
	LDA.l DATA_FF0040,x			;$BB8F2D
	TAY					;$BB8F31
	BRA CODE_BB8F3A				;$BB8F32

CODE_BB8F34:
	TYX					;$BB8F34
	LDA.l DATA_FF218C,x			;$BB8F35
	TAY					;$BB8F39
CODE_BB8F3A:
	PHY					;$BB8F3A
	JSR CODE_BB8F8B				;$BB8F3B
	PLY					;$BB8F3E
	BCS CODE_BB8F58				;$BB8F3F
	STZ sprite.placement_number,x		;$BB8F41
	LDA #$0005				;$BB8F43
	STA sprite.placement_parameter,x	;$BB8F46
	STZ sprite.last_rendered_graphic,x	;$BB8F48
	STZ sprite.sprite_graphic,x		;$BB8F4A
	LDA #$C000				;$BB8F4C
	STA sprite.visibility,x			;$BB8F4F
	STZ sprite.terrain_attributes,x		;$BB8F51
	STZ sprite.oam_property,x		;$BB8F53
	BRL CODE_BB8FE3				;$BB8F55

CODE_BB8F58:
	RTL					;$BB8F58

CODE_BB8F59:
	TYX					;$BB8F59
	LDA.l DATA_FF0040,x			;$BB8F5A
	TAY					;$BB8F5E
	BRA CODE_BB8F67				;$BB8F5F

CODE_BB8F61:
	TYX					;$BB8F61
	LDA.l DATA_FF218C,x			;$BB8F62
	TAY					;$BB8F66
CODE_BB8F67:
	PHY					;$BB8F67
	JSR CODE_BB8F78				;$BB8F68
	PLY					;$BB8F6B
	BCS CODE_BB8F77				;$BB8F6C
	STZ sprite.placement_number,x		;$BB8F6E
	LDA #$0005				;$BB8F70
	STA sprite.placement_parameter,x	;$BB8F73
	BRA CODE_BB8FE3				;$BB8F75

CODE_BB8F77:
	RTL					;$BB8F77

CODE_BB8F78:
	JSR CODE_BB8F8B				;$BB8F78
	BCS CODE_BB8F8A				;$BB8F7B
	PHY					;$BB8F7D
	JSR CODE_BB9507				;$BB8F7E
	PLY					;$BB8F81
	BCS CODE_BB8F8A				;$BB8F82
	STZ sprite.last_rendered_graphic,x	;$BB8F84
	STZ sprite.visibility,x			;$BB8F86
	STZ sprite.terrain_attributes,x		;$BB8F88
CODE_BB8F8A:
	RTS					;$BB8F8A

CODE_BB8F8B:
	LDX #main_sprite_table			;$BB8F8B
	CLC					;$BB8F8E
CODE_BB8F8F:
	LDA sprite.type,x 			;$BB8F8F
	BEQ CODE_BB8FA1				;$BB8F91
	TXA					;$BB8F93
	ADC.w #sizeof(sprite)			;$BB8F94
	TAX					;$BB8F97
	CPX #main_sprite_table_end		;$BB8F98
	BCC CODE_BB8F8F				;$BB8F9B
	SEC					;$BB8F9D
	LDX #aux_sprite_slot			;$BB8F9E
CODE_BB8FA1:
	STX alternate_sprite			;$BB8FA1
	RTS					;$BB8FA3

CODE_BB8FA4:
	PHA					;$BB8FA4
	TYX					;$BB8FA5
	LDA.l DATA_FF218C,x			;$BB8FA6
	TAY					;$BB8FAA
	PLA					;$BB8FAB
	BRA CODE_BB8FB7				;$BB8FAC

CODE_BB8FAE:
	TYX					;$BB8FAE
	LDA.l DATA_FF218C,x			;$BB8FAF
	TAY					;$BB8FB3
	LDA #$0002				;$BB8FB4
CODE_BB8FB7:
	PHY					;$BB8FB7
	JSR CODE_BB8FC8				;$BB8FB8
	PLY					;$BB8FBB
	BCS CODE_BB8FC7				;$BB8FBC
	STZ sprite.placement_number,x		;$BB8FBE
	LDA #$0005				;$BB8FC0
	STA sprite.placement_parameter,x	;$BB8FC3
	BRA CODE_BB8FE3				;$BB8FC5

CODE_BB8FC7:
	RTL					;$BB8FC7

CODE_BB8FC8:
	PHA					;$BB8FC8
	JSR CODE_BB8F8B				;$BB8FC9
	PLA					;$BB8FCC
	BCS CODE_BB8FDC				;$BB8FCD
	PHY					;$BB8FCF
	JSR CODE_BB9529				;$BB8FD0
	PLY					;$BB8FD3
	BCS CODE_BB8FDC				;$BB8FD4
	STZ sprite.last_rendered_graphic,x	;$BB8FD6
	STZ sprite.visibility,x			;$BB8FD8
	STZ sprite.terrain_attributes,x		;$BB8FDA
CODE_BB8FDC:
	RTS					;$BB8FDC

;DKC2 CODE_BB8462
CODE_BB8FDD:
	TYX					;$BB8FDD
	LDA.l DATA_FF218C,x			;$BB8FDE
	TAY					;$BB8FE2
CODE_BB8FE3:
	LDX alternate_sprite			;$BB8FE3
	STZ sprite.terrain_interaction,x	;$BB8FE5
	STZ sprite.interaction_flags,x		;$BB8FE7
	STZ sprite.slip_velocity,x		;$BB8FE9
	STZ sprite.constants_address,x		;$BB8FEB
	STZ sprite.placement_number,x		;$BB8FED
	STZ sprite.carry_or_defeated_flags,x	;$BB8FEF
apply_spawn_script_to_slot_direct:
	PHB					;$BB8FF1
	%pea_shift_dbr(DATA_FF218C)
	PLB					;$BB8FF2
	PLB					;$BB8FF3
	BRA parse_initscript_entry		;$BB8FF4

parse_initscript:
	PHB					;$BB8FF9
	BRA parse_initscript_entry		;$BB8FFA

set_sprite_config:
	TCD					;$BB8FFC
	LDA $0001,y				;$BB8FFD
	STA $00,x				;$BB9000
initscript_next:
	INY					;$BB9002
	INY					;$BB9003
	INY					;$BB9004
parse_initscript_entry:
	LDA $0000,y				;$BB9005
	AND #$00FF				;$BB9008
	CMP #$00EF				;$BB900B
	BCC set_sprite_config			;$BB900E
	EOR #$00FF				;$BB9010
	ASL					;$BB9013
	TAX					;$BB9014
	JMP (initscript_commands,x)		;$BB9015

initscript_commands:
	dw spawn_command_set_sprite_type	; $FF - Set sprite type
	dw spawn_command_set_oam		; $FE - Set OAM
	dw spawn_command_set_oam_2		; $FD - Set OAM 2
	dw spawn_command_set_palette		; $FC - Set palette
	dw spawn_command_set_sequential_palette	; $FB - Set palette for current and next slot
	dw spawn_command_set_animation		; $FA - Set animation
	dw spawn_command_load_subconfig		; $F9 - Load subconfig
	dw spawn_command_set_conditional_pal	; $F8 - Set conditional palette (only used by squawks/his icon)
	dw spawn_command_setup_static		; $F7 - Setup static
	dw spawn_command_spawn_relative		; $F6 - Spawn relative
	dw spawn_command_set_position		; $F5 - Set position
	dw spawn_command_load_sub_and_bulk_set	; $F4 - Load subconfg + bulk set
	dw CODE_BB9190				; $F3 - Set graphic ID from DATA_B9B6E7 with offset
	dw spawn_command_set_render_order	; $F2 - Set render order and some more stuff
	dw spawn_command_set_directional	; $F1 - Set directional
	dw CODE_BB9048				; $F0 - Set OAM stuff + end of script
	dw spawn_command_success		; $EF - End of script

CODE_BB903A:
	PLB					;$BB903A
	SEC					;$BB903B
	LDA #$0000				;$BB903C
	TCD					;$BB903F
	RTL					;$BB9040

spawn_command_success:
	PLB					;$BB9041
	CLC					;$BB9042
	LDA #$0000				;$BB9043
	TCD					;$BB9046
	RTL					;$BB9047

CODE_BB9048:
	PLB					;$BB9048
	LDA #$0000				;$BB9049
	TCD					;$BB904C
	LDX alternate_sprite			;$BB904D
	LDA sprite.render_order,x		;$BB904F
	AND #$FFBF				;$BB9051
	STA sprite.render_order,x		;$BB9054
	LDA sprite.oam_property,x		;$BB9056
	AND #$CFFF				;$BB9058
	ORA #$2000				;$BB905B
	STA sprite.oam_property,x		;$BB905E
	CLC					;$BB9060
	RTL					;$BB9061

spawn_command_set_sprite_type:
	LDA #$0000				;$BB9062
	TCD					;$BB9065
	LDX alternate_sprite			;$BB9066
	LDA $0001,y				;$BB9068
	JSR CODE_BBB884				;$BB906B
	JMP initscript_next			;$BB906E

spawn_command_set_oam:
	LDA #$0000				;$BB9071
	TCD					;$BB9074
	LDX alternate_sprite			;$BB9075
	LDA $0001,y				;$BB9077
	EOR sprite.oam_property,x		;$BB907A
	AND #$F000				;$BB907C
	EOR sprite.oam_property,x		;$BB907F
	STA sprite.oam_property,x		;$BB9081
	LDA $000775				;$BB9083
	AND #$0002				;$BB9087
	BEQ CODE_BB9093				;$BB908A
	LDA sprite.oam_property,x		;$BB908C
	ORA #$3000				;$BB908E
	STA sprite.oam_property,x		;$BB9091
CODE_BB9093:
	JMP initscript_next			;$BB9093

spawn_command_set_oam_2:
	LDA #$0000				;$BB9096
	TCD					;$BB9099
	LDX alternate_sprite			;$BB909A
	LDA $0001,y				;$BB909C
	EOR sprite.oam_property,x		;$BB909F
	AND #$F000				;$BB90A1
	EOR sprite.oam_property,x		;$BB90A4
	STA sprite.oam_property,x		;$BB90A6
	JMP initscript_next			;$BB90A8

spawn_command_set_render_order:
	LDA #$0000				;$BB90AB
	TCD					;$BB90AE
	LDX alternate_sprite			;$BB90AF
	LDA $0001,y				;$BB90B1
	STA sprite.render_order,x		;$BB90B4
	JSR CODE_BB90BC				;$BB90B6
	JMP initscript_next			;$BB90B9

CODE_BB90BC:
	PHX					;$BB90BC
	PHY					;$BB90BD
	PHB					;$BB90BE
	PHK					;$BB90BF
	PLB					;$BB90C0
	LDY alternate_sprite			;$BB90C1
	LDA.w sprite.render_order,y		;$BB90C3
	STA $1A					;$BB90C6
	TYA					;$BB90C8
	LDX #sprite_render_table		;$BB90C9
CODE_BB90CC:
	CMP $00,x				;$BB90CC
	BEQ CODE_BB90D4				;$BB90CE
	INX					;$BB90D0
	INX					;$BB90D1
	BRA CODE_BB90CC				;$BB90D2

CODE_BB90D4:
	LDA $1A					;$BB90D4
	CPX #sprite_render_table		;$BB90D6
	BEQ CODE_BB9101				;$BB90D9
	CPX #$155C				;$BB90DB
	BCS CODE_BB90E7				;$BB90DE
	LDY $02,x				;$BB90E0
	CMP $000E,y				;$BB90E2
	BCC.b CODE_BB9101			;$BB90E5
CODE_BB90E7:
	DEX					;$BB90E7
	DEX					;$BB90E8
	CPX #sprite_render_table		;$BB90E9
	BEQ CODE_BB90FD				;$BB90EC
	LDY $00,x				;$BB90EE
	CMP $000E,y				;$BB90F0
	BCC CODE_BB90FD				;$BB90F3
	STY $02,x				;$BB90F5
	LDY alternate_sprite			;$BB90F7
	STY $00,x				;$BB90F9
	BRA CODE_BB90E7				;$BB90FB

CODE_BB90FD:
	PLB					;$BB90FD
	PLY					;$BB90FE
	PLX					;$BB90FF
	RTS					;$BB9100

CODE_BB9101:
	LDY $02,x				;$BB9101
	CMP $000E,y				;$BB9103
	BCS CODE_BB90FD				;$BB9106
	STY $00,x				;$BB9108
	LDY alternate_sprite			;$BB910A
	STY $02,x				;$BB910C
	INX					;$BB910E
	INX					;$BB910F
	CPX #$155C				;$BB9110
	BCC CODE_BB9101				;$BB9113
	PLB					;$BB9115
	PLY					;$BB9116
	PLX					;$BB9117
	RTS					;$BB9118

spawn_command_set_palette:
	LDA #$0000				;$BB9119
	TCD					;$BB911C
	LDA $0001,y				;$BB911D
	PHB					;$BB9120
	PHK					;$BB9121
	PLB					;$BB9122
	PHY					;$BB9123
	JSR request_palette_direct		;$BB9124
	PLY					;$BB9127
	LDX alternate_sprite			;$BB9128
	EOR sprite.oam_property,x		;$BB912A
	AND #$0E00				;$BB912C
	EOR sprite.oam_property,x		;$BB912F
	STA sprite.oam_property,x		;$BB9131
	PLB					;$BB9133
	JMP initscript_next			;$BB9134

spawn_command_set_sequential_palette:
	LDA #$0000				;$BB9137
	TCD					;$BB913A
	LDA $0001,y				;$BB913B
	JSR CODE_BB9148				;$BB913E
	JMP initscript_next			;$BB9141

CODE_BB9144:
	JSR CODE_BB9148				;$BB9144
	RTL					;$BB9147

CODE_BB9148:
	PHB					;$BB9148
	PHK					;$BB9149
	PLB					;$BB914A
	PHA					;$BB914B
	XBA					;$BB914C
	AND #$00FF				;$BB914D
	PHY					;$BB9150
	JSR request_palette_direct		;$BB9151
	PLY					;$BB9154
	LDX alternate_sprite			;$BB9155
	AND #$0E00				;$BB9157
	ORA #$8002				;$BB915A
	STA $42					;$BB915D
	EOR sprite.visibility,x			;$BB915F
	AND #$4000				;$BB9161
	EOR $42					;$BB9164
	STA sprite.visibility,x			;$BB9166
	PLA					;$BB9168
	AND #$00FF				;$BB9169
	PHY					;$BB916C
	JSR request_palette_direct		;$BB916D
	PLY					;$BB9170
	LDX alternate_sprite			;$BB9171
	EOR sprite.oam_property,x		;$BB9173
	AND #$0E00				;$BB9175
	EOR sprite.oam_property,x		;$BB9178
	STA sprite.oam_property,x		;$BB917A
	PLB					;$BB917C
	RTS					;$BB917D

spawn_command_set_animation:
	LDA #$0000				;$BB917E
	TCD					;$BB9181
	LDA $0001,y				;$BB9182
	PHY					;$BB9185
	JSL set_alt_sprite_animation		;$BB9186
	PLY					;$BB918A
	LDX alternate_sprite			;$BB918B
	JMP initscript_next			;$BB918D

CODE_BB9190:
	LDA #$0000				;$BB9190
	TCD					;$BB9193
	LDA $0001,y				;$BB9194
	AND #$00FF				;$BB9197
	ASL					;$BB919A
	TAX					;$BB919B
	LDA $0002,y				;$BB919C
	AND #$00FF				;$BB919F
	STA $42					;$BB91A2
	ASL					;$BB91A4
	ASL					;$BB91A5
	ADC $42					;$BB91A6
	CLC					;$BB91A8
	ADC.l DATA_B9B6E7,x			;$BB91A9
	LDX alternate_sprite			;$BB91AD
	STA sprite.sprite_graphic,x		;$BB91AF
	JMP initscript_next			;$BB91B1

spawn_command_load_subconfig:
	LDA #$0000				;$BB91B4
	TCD					;$BB91B7
	PHY					;$BB91B8
	LDA $0001,y				;$BB91B9
	TAY					;$BB91BC
	LDX alternate_sprite			;$BB91BD
	JSL parse_initscript			;$BB91BF
	PLY					;$BB91C3
	LDX alternate_sprite			;$BB91C4
	JMP initscript_next			;$BB91C6

spawn_command_set_conditional_pal:
	LDA #$0000				;$BB91C9
	TCD					;$BB91CC
	PHY					;$BB91CD
	LDA $0001,y				;$BB91CE
	TAX					;$BB91D1
	LDA $0003,y				;$BB91D2
	AND $00,x				;$BB91D5
	CMP #$0001				;$BB91D7
	LDA $0005,y				;$BB91DA
	BCC CODE_BB91E2				;$BB91DD
	LDA $0007,y				;$BB91DF
CODE_BB91E2:
	TAY					;$BB91E2
	LDX alternate_sprite			;$BB91E3
	JSL parse_initscript			;$BB91E5
	PLA					;$BB91E9
	CLC					;$BB91EA
	ADC #$0009				;$BB91EB
	TAY					;$BB91EE
	LDX alternate_sprite			;$BB91EF
	JMP parse_initscript_entry		;$BB91F1

spawn_command_setup_static:
	LDA #$0000				;$BB91F4
	TCD					;$BB91F7
	LDA $0001,y				;$BB91F8
	STA $1E					;$BB91FB
	LDA $0003,y				;$BB91FD
	STA $20					;$BB9200
	LDA $0005,y				;$BB9202
	AND #$00FF				;$BB9205
	ASL					;$BB9208
	ASL					;$BB9209
	TAX					;$BB920A
	LDA.l DATA_C00000,x			;$BB920B
	STA $1A					;$BB920F
	LDA.l DATA_C00000+$02,x			;$BB9211
	STA $1C					;$BB9215
	XBA					;$BB9217
	AND #$00FF				;$BB9218
	CLC					;$BB921B
	ADC #$001F				;$BB921C
	LSR					;$BB921F
	LSR					;$BB9220
	LSR					;$BB9221
	LSR					;$BB9222
	LSR					;$BB9223
	STA $24					;$BB9224
	PHB					;$BB9226
	PHB					;$BB9227
	PLA					;$BB9228
	STA $22					;$BB9229
	PHK					;$BB922B
	PLB					;$BB922C
	PHY					;$BB922D
	LDA $20					;$BB922E
	JSR request_palette_direct		;$BB9230
	PLY					;$BB9233
	BCS CODE_BB9299				;$BB9234
	LDX alternate_sprite			;$BB9236
	EOR sprite.oam_property,x		;$BB9238
	AND #$0E00				;$BB923A
	EOR sprite.oam_property,x		;$BB923D
	STA sprite.oam_property,x		;$BB923F
	LDX #main_sprite_table 			;$BB9241
CODE_BB9244:
	LDA $1E					;$BB9244
	CMP sprite.type,x			;$BB9246
	BEQ CODE_BB929C				;$BB9248
	TXA					;$BB924A
	CLC					;$BB924B
	ADC.w #sizeof(sprite)			;$BB924C
	TAX					;$BB924F
	CPX #main_sprite_table_end		;$BB9250
	BNE CODE_BB9244				;$BB9253
	LDX alternate_sprite			;$BB9255
	PHY					;$BB9257
	LDA $24					;$BB9258
	JSR CODE_BB9529				;$BB925A
	PLY					;$BB925D
	BCS CODE_BB9288				;$BB925E
	LDX alternate_sprite			;$BB9260
	LDA sprite.oam_property,x		;$BB9262
	AND #$01FF				;$BB9264
	JSL CODE_B78009				;$BB9267
	BCC CODE_BB92A9				;$BB926B
	LDA $155E				;$BB926D
	SEC					;$BB9270
	SBC #$0008				;$BB9271
	STA $155E				;$BB9274
	TAX					;$BB9277
	STZ $1568,x				;$BB9278
	LDA $24					;$BB927B
	DEC					;$BB927D
	BEQ CODE_BB9285				;$BB927E
	JSR CODE_BB9596				;$BB9280
	BRA CODE_BB9288				;$BB9283

CODE_BB9285:
	JSR deallocate_sprite_vram_slot		;$BB9285
CODE_BB9288:
	LDX alternate_sprite			;$BB9288
	LDA sprite.oam_property,x		;$BB928A
	JSR dereference_sprite_palette		;$BB928C
	BCS CODE_BB9299				;$BB928F
	LDA $E8					;$BB9291
	DEC					;$BB9293
	AND #$000F				;$BB9294
	STA $E8					;$BB9297
CODE_BB9299:
	JMP CODE_BB903A				;$BB9299

CODE_BB929C:
	LDA sprite.oam_property,x		;$BB929C
	LDX alternate_sprite			;$BB929E
	EOR sprite.oam_property,x		;$BB92A0
	AND #$F1FF				;$BB92A2
	EOR sprite.oam_property,x		;$BB92A5
	STA sprite.oam_property,x		;$BB92A7
CODE_BB92A9:
	LDA $1E					;$BB92A9
	JSR CODE_BBB884				;$BB92AB
	STZ sprite.last_rendered_graphic,x	;$BB92AE
	STZ sprite.visibility,x			;$BB92B0
	STZ sprite.terrain_attributes,x		;$BB92B2
	LDA $22					;$BB92B4
	PHA					;$BB92B6
	PLB					;$BB92B7
	PLB					;$BB92B8
	TYA					;$BB92B9
	CLC					;$BB92BA
	ADC #$0006				;$BB92BB
	TAY					;$BB92BE
	JMP parse_initscript_entry		;$BB92BF

spawn_command_spawn_relative:
	LDA #$0000				;$BB92C2
	TCD					;$BB92C5
	LDA $0001,y				;$BB92C6
	AND #$00FF				;$BB92C9
	CMP #$0080				;$BB92CC
	BCC CODE_BB92D4				;$BB92CF
	ORA #$FF00				;$BB92D1
CODE_BB92D4:
	LDX current_sprite			;$BB92D4
	BIT sprite.oam_property,x		;$BB92D6
	BVC CODE_BB92DE				;$BB92D8
	EOR #$FFFF				;$BB92DA
	INC					;$BB92DD
CODE_BB92DE:
	CLC					;$BB92DE
	ADC sprite.x_position,x			;$BB92DF
	LDX alternate_sprite			;$BB92E1
	STA sprite.x_position,x			;$BB92E3
	LDA $0002,y				;$BB92E5
	AND #$00FF				;$BB92E8
	CMP #$0080				;$BB92EB
	BCC CODE_BB92F3				;$BB92EE
	ORA #$FF00				;$BB92F0
CODE_BB92F3:
	LDX current_sprite			;$BB92F3
	BIT sprite.oam_property,x		;$BB92F5
	BPL CODE_BB92FD				;$BB92F7
	EOR #$FFFF				;$BB92F9
	INC					;$BB92FC
CODE_BB92FD:
	CLC					;$BB92FD
	ADC sprite.y_position,x			;$BB92FE
	LDX alternate_sprite			;$BB9300
	STA sprite.y_position,x			;$BB9302
	PHB					;$BB9304
	PHK					;$BB9305
	PLB					;$BB9306
	PHY					;$BB9307
	LDY current_sprite			;$BB9308
	LDX alternate_sprite			;$BB930A
	LDA.w sprite.render_order,y		;$BB930C
	INC					;$BB930F
	STA sprite.render_order,x		;$BB9310
	LDA.w sprite.visibility,y		;$BB9312
	AND #$800F				;$BB9315
	CMP #$8002				;$BB9318
	BNE CODE_BB932D				;$BB931B
	LDA.w sprite.visibility,y		;$BB931D
	AND #$C000				;$BB9320
	CMP #$C000				;$BB9323
	BEQ CODE_BB9330				;$BB9326
	LDA #$0000				;$BB9328
	BRA CODE_BB9330				;$BB932B

CODE_BB932D:
	LDA.w sprite.visibility,y		;$BB932D
CODE_BB9330:
	STA sprite.visibility,x			;$BB9330
	LDA.w sprite.x_sub_position,y		;$BB9332
	STA sprite.x_sub_position,x		;$BB9335
	LDA.w sprite.y_sub_position,y		;$BB9337
	STA sprite.y_sub_position,x		;$BB933A
	LDA.w sprite.oam_property,y		;$BB933C
	EOR sprite.oam_property,x		;$BB933F
	AND #$F000				;$BB9341
	EOR sprite.oam_property,x		;$BB9344
	STA sprite.oam_property,x		;$BB9346
	JSR CODE_BB90BC				;$BB9348
	PLY					;$BB934B
	PLB					;$BB934C
	JMP initscript_next			;$BB934D

spawn_command_set_position:
	LDA #$0000				;$BB9350
	TCD					;$BB9353
	LDX alternate_sprite			;$BB9354
	LDA $001867				;$BB9356
	STA sprite.x_position,x			;$BB935A
	LDA $001869				;$BB935C
	STA sprite.y_position,x			;$BB9360
	LDA #$00F8				;$BB9362
	STA sprite.render_order,x		;$BB9365
	INY					;$BB9367
	JMP parse_initscript_entry		;$BB9368

spawn_command_load_sub_and_bulk_set:
	LDA #$0000				;$BB936B
	TCD					;$BB936E
	LDX alternate_sprite			;$BB936F
	STZ sprite.general_purpose_4C,x		;$BB9371
	STZ sprite.animation_flags,x		;$BB9373
	STZ sprite.state,x			;$BB9375
	STZ sprite.general_purpose_6C,x		;$BB9377
	STZ sprite.movement_state,x		;$BB9379
	STZ sprite.unknown_58,x			;$BB937B
	PHY					;$BB937D
	LDA $0001,y				;$BB937E
	TAY					;$BB9381
	JSL parse_initscript			;$BB9382
	PLY					;$BB9386
	LDX alternate_sprite			;$BB9387
	LDA $0003,y				;$BB9389
	AND #$00FF				;$BB938C
	ORA sprite.constants_address,x		;$BB938F
	STA sprite.constants_address,x		;$BB9391
	AND #$0004				;$BB9393
	BEQ CODE_BB939D				;$BB9396
	LDA #$C000				;$BB9398
	STA sprite.visibility,x			;$BB939B
CODE_BB939D:
	LDA $0003,y				;$BB939D
	AND #$0F00				;$BB93A0
	ASL					;$BB93A3
	ASL					;$BB93A4
	ASL					;$BB93A5
	ASL					;$BB93A6
	STA sprite.animation_routine_pointer,x	;$BB93A7
	LDA $0004,y				;$BB93A9
	AND #$00F0				;$BB93AC
	ORA sprite.animation_routine_pointer,x	;$BB93AF
	XBA					;$BB93B1
	STA sprite.animation_address,x		;$BB93B2
	STA sprite.general_purpose_6A,x		;$BB93B4
	LDA $0004,y				;$BB93B6
	AND #$FF00				;$BB93B9
	JSR CODE_BB9441				;$BB93BC
	STA sprite.animation_speed,x		;$BB93BF
	LDA $0006,y				;$BB93C1
	AND #$00FF				;$BB93C4
	ASL					;$BB93C7
	ASL					;$BB93C8
	ASL					;$BB93C9
	EOR #$FFFF				;$BB93CA
	STA sprite.general_purpose_5C,x		;$BB93CD
	LDA $0007,y				;$BB93CF
	AND #$00FF				;$BB93D2
	ASL					;$BB93D5
	ASL					;$BB93D6
	ASL					;$BB93D7
	STA sprite.general_purpose_5E,x		;$BB93D8
	LDA sprite.constants_address,x		;$BB93DA
	AND #$0080				;$BB93DC
	BNE CODE_BB93FE				;$BB93DF
	LDA sprite.general_purpose_5C,x		;$BB93E1
	SEC					;$BB93E3
	ADC sprite.x_position,x			;$BB93E4
	STA sprite.general_purpose_5C,x		;$BB93E6
	LDA sprite.general_purpose_5E,x		;$BB93E8
	CLC					;$BB93EA
	ADC sprite.x_position,x			;$BB93EB
	STA sprite.general_purpose_5E,x		;$BB93ED
	LDA $0007,y				;$BB93EF
	AND #$FF00				;$BB93F2
	JSR CODE_BB9441				;$BB93F5
	STA sprite.max_x_speed,x		;$BB93F8
	STZ sprite.x_speed,x			;$BB93FA
	BRA CODE_BB9419				;$BB93FC

CODE_BB93FE:
	LDA sprite.general_purpose_5C,x		;$BB93FE
	SEC					;$BB9400
	ADC sprite.y_position,x			;$BB9401
	STA sprite.general_purpose_5C,x		;$BB9403
	LDA sprite.general_purpose_5E,x		;$BB9405
	CLC					;$BB9407
	ADC sprite.y_position,x			;$BB9408
	STA sprite.general_purpose_5E,x		;$BB940A
	LDA $0007,y				;$BB940C
	AND #$FF00				;$BB940F
	JSR CODE_BB9441				;$BB9412
	STA sprite.max_y_speed,x		;$BB9415
	STZ sprite.y_speed,x			;$BB9417
CODE_BB9419:
	LDA $0008,y				;$BB9419
	AND #$FF00				;$BB941C
	LSR					;$BB941F
	LSR					;$BB9420
	LSR					;$BB9421
	LSR					;$BB9422
	STA sprite.slip_velocity,x		;$BB9423
	LDA $000A,y				;$BB9425
	AND #$00FF				;$BB9428
	STA sprite.ground_y_position,x		;$BB942B
	LDA $000B,y				;$BB942D
	AND #$00FF				;$BB9430
	CLC					;$BB9433
	ADC sprite.ground_y_position,x		;$BB9434
	STA sprite.ground_distance,x		;$BB9436
	TYA					;$BB9438
	CLC					;$BB9439
	ADC #$000C				;$BB943A
	TAY					;$BB943D
	JMP parse_initscript_entry		;$BB943E

CODE_BB9441:
	CMP #$8000				;$BB9441
	ROR					;$BB9444
	CMP #$8000				;$BB9445
	ROR					;$BB9448
	CMP #$8000				;$BB9449
	ROR					;$BB944C
	CMP #$8000				;$BB944D
	ROR					;$BB9450
	RTS					;$BB9451

spawn_command_set_directional:
	LDA #$0000				;$BB9452
	TCD					;$BB9455
	LDA $0002,y				;$BB9456
	LDX current_sprite			;$BB9459
	BIT sprite.oam_property,x		;$BB945B
	BVC CODE_BB9463				;$BB945D
	EOR #$FFFF				;$BB945F
	INC					;$BB9462
CODE_BB9463:
	LDX alternate_sprite			;$BB9463
	PHA					;$BB9465
	LDA $0001,y				;$BB9466
	AND #$00FF				;$BB9469
	TCD					;$BB946C
	PLA					;$BB946D
	STA sprite.type,x			;$BB946E
	INY					;$BB9470
	JMP initscript_next			;$BB9471

CODE_BB9474:
	LDA current_sprite			;$BB9474
	PHA					;$BB9476
	STX current_sprite			;$BB9477
	JSL delete_sprite_handle_dealloc_direct	;$BB9479
	PLA					;$BB947D
	STA current_sprite			;$BB947E
	TAX					;$BB9480
	RTL					;$BB9481

delete_sprite_handle_dealloc_direct:
	LDX current_sprite			;$BB9482
	LDA sprite.type,x			;$BB9484
	BEQ CODE_BB949B				;$BB9486
	CMP #$0210				;$BB9488
	BCC CODE_BB949C				;$BB948B
CODE_BB948D:
	LDX current_sprite			;$BB948D
	JSR dereference_sprite_palette		;$BB948F
	LDX current_sprite			;$BB9492
	JSR deallocate_sprite_vram_slot		;$BB9494
delete_sprite_no_dealloc_direct:
	LDX current_sprite			;$BB9497
	STZ sprite.type,x			;$BB9499
CODE_BB949B:
	RTL					;$BB949B

CODE_BB949C:
	CMP #$0128				;$BB949C
	BCS delete_sprite_no_dealloc_direct	;$BB949F
	CMP #$00F0				;$BB94A1
	BCC CODE_BB94B2				;$BB94A4
CODE_BB94A6:
	LDX current_sprite			;$BB94A6
	JSR dereference_sprite_palette		;$BB94A8
	LDX current_sprite			;$BB94AB
	JSR CODE_BB9596				;$BB94AD
	BRA delete_sprite_no_dealloc_direct	;$BB94B0

CODE_BB94B2:
	STA $1A					;$BB94B2
	LDX #main_sprite_table			;$BB94B4
CODE_BB94B7:
	LDA $1A					;$BB94B7
	CMP sprite.type,x 			;$BB94B9
	BEQ CODE_BB94D1				;$BB94BB
CODE_BB94BD:
	TXA					;$BB94BD
	CLC					;$BB94BE
	ADC.w #sizeof(sprite)			;$BB94BF
	TAX					;$BB94C2
	CPX #main_sprite_table_end		;$BB94C3
	BNE CODE_BB94B7				;$BB94C6
	LDA $1A					;$BB94C8
	CMP #$00D0				;$BB94CA
	BCS CODE_BB94A6				;$BB94CD
	BRA CODE_BB948D				;$BB94CF

CODE_BB94D1:
	CPX current_sprite			;$BB94D1
	BEQ CODE_BB94BD				;$BB94D3
	LDA sprite.oam_property,x		;$BB94D5
	AND #$01E0				;$BB94D7
	LSR					;$BB94DA
	LSR					;$BB94DB
	LSR					;$BB94DC
	LSR					;$BB94DD
	TAY					;$BB94DE
	LDA $06DA,y				;$BB94DF
	CMP sprite_vram_allocation_table,y	;$BB94E2
	BNE CODE_BB94F7				;$BB94E5
	LDA $06DC,y				;$BB94E7
	CMP sprite_vram_allocation_table,y	;$BB94EA
	BNE CODE_BB94F3				;$BB94ED
	TXA					;$BB94EF
	STA $06DC,y				;$BB94F0
CODE_BB94F3:
	TXA					;$BB94F3
	STA $06DA,y				;$BB94F4
CODE_BB94F7:
	TXA					;$BB94F7
	STA sprite_vram_allocation_table,y	;$BB94F8
	LDX current_sprite			;$BB94FB
	JSR dereference_sprite_palette		;$BB94FD
	BRL delete_sprite_no_dealloc_direct	;$BB9500

CODE_BB9503:
	JSR CODE_BB9507				;$BB9503
	RTL					;$BB9506

CODE_BB9507:
	LDY #$001A				;$BB9507
CODE_BB950A:
	LDA sprite_vram_allocation_table,y	;$BB950A
	BEQ CODE_BB9515				;$BB950D
	DEY					;$BB950F
	DEY					;$BB9510
	BPL CODE_BB950A				;$BB9511
	SEC					;$BB9513
	RTS					;$BB9514

CODE_BB9515:
	TXA					;$BB9515
	STA sprite_vram_allocation_table,y	;$BB9516
	TYA					;$BB9519
	ASL					;$BB951A
	ASL					;$BB951B
	ASL					;$BB951C
	ASL					;$BB951D
	EOR sprite.oam_property,x		;$BB951E
	AND #$01FF				;$BB9520
	EOR sprite.oam_property,x		;$BB9523
	STA sprite.oam_property,x		;$BB9525
	CLC					;$BB9527
	RTS					;$BB9528

CODE_BB9529:
	STA $3A					;$BB9529
	STA $3C					;$BB952B
	ASL					;$BB952D
	CLC					;$BB952E
	ADC #$FFFE				;$BB952F
	STA $3E					;$BB9532
	LDY #$0018				;$BB9534
CODE_BB9537:
	LDA sprite_vram_allocation_table,y	;$BB9537
	BEQ CODE_BB954F				;$BB953A
CODE_BB953C:
	DEY					;$BB953C
	DEY					;$BB953D
	CPY $3E					;$BB953E
	BPL CODE_BB9537				;$BB9540
	SEC					;$BB9542
	RTS					;$BB9543

CODE_BB9544:
	LDA $3C					;$BB9544
	STA $3A					;$BB9546
	BRA CODE_BB953C				;$BB9548

CODE_BB954A:
	LDA sprite_vram_allocation_table,y	;$BB954A
	BNE CODE_BB9544				;$BB954D
CODE_BB954F:
	DEC $3A					;$BB954F
	BEQ CODE_BB9557				;$BB9551
	DEY					;$BB9553
	DEY					;$BB9554
	BRA CODE_BB954A				;$BB9555

CODE_BB9557:
	TYA					;$BB9557
	ASL					;$BB9558
	ASL					;$BB9559
	ASL					;$BB955A
	ASL					;$BB955B
	EOR sprite.oam_property,x		;$BB955C
	AND #$01FF				;$BB955E
	EOR sprite.oam_property,x		;$BB9561
	STA sprite.oam_property,x		;$BB9563
	BRA CODE_BB9569				;$BB9565

CODE_BB9567:
	INY					;$BB9567
	INY					;$BB9568
CODE_BB9569:
	TXA					;$BB9569
	STA sprite_vram_allocation_table,y	;$BB956A
	DEC $3C					;$BB956D
	BNE CODE_BB9567				;$BB956F
	CLC					;$BB9571
	RTS					;$BB9572

deallocate_sprite_vram_slot_global:
	JSR deallocate_sprite_vram_slot		;$BB9573
	RTL					;$BB9576

deallocate_sprite_vram_slot:
	LDA sprite.oam_property,x		;$BB9577
	AND #$01E0				;$BB9579
	LSR					;$BB957C
	LSR					;$BB957D
	LSR					;$BB957E
	LSR					;$BB957F
	TAY					;$BB9580
	LDA #$0000				;$BB9581
	STA sprite_vram_allocation_table,y	;$BB9584
	RTS					;$BB9587

;unreferenced
CODE_BB9588:
	LDA #$0000				;$BB9588
	STA sprite_vram_allocation_table,y	;$BB958B
	STA $06DA,y				;$BB958E
	RTS					;$BB9591

CODE_BB9592:
	JSR CODE_BB9596				;$BB9592
	RTL					;$BB9595

CODE_BB9596:
	LDA.b sprite.oam_property,x		;$BB9596
	AND #$01E0				;$BB9598
	LSR					;$BB959B
	LSR					;$BB959C
	LSR					;$BB959D
	LSR					;$BB959E
	TAY					;$BB959F
	LDA sprite_vram_allocation_table,y	;$BB95A0
	CMP $06DA,y				;$BB95A3
	BNE CODE_BB95BD				;$BB95A6
	CMP $06DC,y				;$BB95A8
	BNE CODE_BB95B3				;$BB95AB
	LDA #$0000				;$BB95AD
	STA $06DC,y				;$BB95B0
CODE_BB95B3:
	LDA #$0000				;$BB95B3
	STA $06DA,y				;$BB95B6
	STA sprite_vram_allocation_table,y	;$BB95B9
	RTS					;$BB95BC

CODE_BB95BD:
	LDA #$0000				;$BB95BD
	STA sprite_vram_allocation_table,y	;$BB95C0
	RTS					;$BB95C3

request_palette_direct_global:
	JSR request_palette_direct		;$BB95C4
	RTL					;$BB95C7

request_palette_direct:
	STA $04EF				;$BB95C8
	LDX #$0000				;$BB95CB
CODE_BB95CE:
	LDA active_sprite_palettes_table,x	;$BB95CE
	BEQ CODE_BB95F5				;$BB95D1
	CMP $04EF				;$BB95D3
	BEQ CODE_BB9606				;$BB95D6
	INX					;$BB95D8
	INX					;$BB95D9
	CPX #$0010				;$BB95DA
	BNE CODE_BB95CE				;$BB95DD
	LDA #$0020				;$BB95DF
	JSL throw_exception_wrapper		;$BB95E2
	LDA $04EF				;$BB95E6
	STA $1D4B				;$BB95E9
	LDX #$0000				;$BB95EC
	INC sprite_palette_reference_count,x	;$BB95EF
	TXA					;$BB95F2
	SEC					;$BB95F3
	RTS					;$BB95F4

CODE_BB95F5:
	STX $3E					;$BB95F5
CODE_BB95F7:
	INX					;$BB95F7
	INX					;$BB95F8
	CPX #$0010				;$BB95F9
	BCS CODE_BB960D				;$BB95FC
	LDA active_sprite_palettes_table,x	;$BB95FE
	CMP $04EF				;$BB9601
	BNE CODE_BB95F7				;$BB9604
CODE_BB9606:
	INC sprite_palette_reference_count,x	;$BB9606
	TXA					;$BB9609
	XBA					;$BB960A
	CLC					;$BB960B
	RTS					;$BB960C

CODE_BB960D:
	PHY					;$BB960D
	JSR CODE_BB9644				;$BB960E
	PLY					;$BB9611
	LDA $E8					;$BB9612
	ASL					;$BB9614
	ASL					;$BB9615
	TAX					;$BB9616
	LDA $04F1				;$BB9617
	STA palette_upload_ring_buffer,x	;$BB961A
	LDA $3E					;$BB961D
	ASL					;$BB961F
	ASL					;$BB9620
	ASL					;$BB9621
	CLC					;$BB9622
	ADC #$0081				;$BB9623
	XBA					;$BB9626
	ORA $04F3				;$BB9627
	STA palette_upload_ring_buffer+2,x	;$BB962A
	LDA $E8					;$BB962D
	INC					;$BB962F
	AND #$000F				;$BB9630
	STA $E8					;$BB9633
	LDX $3E					;$BB9635
	INC sprite_palette_reference_count,x	;$BB9637
	LDA $04EF				;$BB963A
	STA active_sprite_palettes_table,x	;$BB963D
	CLC					;$BB9640
	TXA					;$BB9641
	XBA					;$BB9642
	RTS					;$BB9643

CODE_BB9644:
	LDA $0775				;$BB9644
	AND #$8000				;$BB9647
	BNE CODE_BB9667				;$BB964A
	LDA $04EF				;$BB964C
	ASL					;$BB964F
	TAX					;$BB9650
	LDA.l sprite_palette_table,x		;$BB9651
	STA $04F1				;$BB9655
	LDA.w #dixie_sprite_palettes>>16	;$BB9658
	STA $04F3				;$BB965B
	LDA $04EF				;$BB965E
	CMP #$000B				;$BB9661
	BCC CODE_BB968A				;$BB9664
	RTS					;$BB9666

CODE_BB9667:
	LDA $04EF				;$BB9667
	ASL					;$BB966A
	TAX					;$BB966B
	LDA.l sprite_palette_table,x		;$BB966C
	SEC					;$BB9670
	SBC #dixie_sprite_palettes		;$BB9671
	CLC					;$BB9674
	ADC.w #$7E3180				;$BB9675
	STA $04F1				;$BB9678
	LDA.w #$7E3180>>16			;$BB967B
	STA $04F3				;$BB967E
	LDA $04EF				;$BB9681
	CMP #$000B				;$BB9684
	BCC CODE_BB968A				;$BB9687
	RTS					;$BB9689

CODE_BB968A:
	LDY #$0000				;$BB968A
	LDA current_game_mode			;$BB968D
	CMP #!gamemode_2_player_contest		;$BB9690
	BNE CODE_BB969F				;$BB9693
	LDA $04C6				;$BB9695
	BEQ CODE_BB96AA				;$BB9698
	LDY #$003C				;$BB969A
	BRA CODE_BB96AA				;$BB969D

CODE_BB969F:
	LDA active_cheats			;$BB969F
	BIT #$0040				;$BB96A2
	BEQ CODE_BB96AA				;$BB96A5
	LDY #$003C				;$BB96A7
CODE_BB96AA:
	STY $40					;$BB96AA
	LDA $04EF				;$BB96AC
	CMP #$0003				;$BB96AF
	BCC CODE_BB96CD				;$BB96B2
	CMP #$0005				;$BB96B4
	BCC CODE_BB96C3				;$BB96B7
	LDA $40					;$BB96B9
	LSR					;$BB96BB
	ADC $04F1				;$BB96BC
	STA $04F1				;$BB96BF
	RTS					;$BB96C2

CODE_BB96C3:
	LDA $40					;$BB96C3
	CLC					;$BB96C5
	ADC $04F1				;$BB96C6
	STA $04F1				;$BB96C9
	RTS					;$BB96CC

CODE_BB96CD:
	CMP #$0001				;$BB96CD
	BEQ CODE_BB96ED				;$BB96D0
	LDA current_kong			;$BB96D2
	BNE CODE_BB96F2				;$BB96D5
CODE_BB96D7:
	LDA $195A				;$BB96D7
	AND #$0007				;$BB96DA
	BNE CODE_BB9712				;$BB96DD
	LDA #$001E				;$BB96DF
	CLC					;$BB96E2
	ADC $04F1				;$BB96E3
	CLC					;$BB96E6
	ADC $40					;$BB96E7
	STA $04F1				;$BB96E9
	RTS					;$BB96EC

CODE_BB96ED:
	LDA current_kong			;$BB96ED
	BNE CODE_BB96D7				;$BB96F0
CODE_BB96F2:
	LDA $1958				;$BB96F2
	BMI CODE_BB9707				;$BB96F5
	XBA					;$BB96F7
	AND #$0007				;$BB96F8
	BNE CODE_BB9712				;$BB96FB
CODE_BB96FD:
	LDA $04F1				;$BB96FD
	CLC					;$BB9700
	ADC $40					;$BB9701
	STA $04F1				;$BB9703
	RTS					;$BB9706

CODE_BB9707:
	LDA $04F1				;$BB9707
	CLC					;$BB970A
	ADC #$0078				;$BB970B
	STA $04F1				;$BB970E
	RTS					;$BB9711

CODE_BB9712:
	CMP #$0002				;$BB9712
	BEQ CODE_BB96FD				;$BB9715
	LDA $04F1				;$BB9717
	CLC					;$BB971A
	ADC #$0096				;$BB971B
	STA $04F1				;$BB971E
	RTS					;$BB9721

dereference_sprite_palette_global:
	JSR dereference_sprite_palette		;$BB9722
	RTL					;$BB9725

dereference_sprite_palette:
	LDA sprite.visibility,x			;$BB9726
	BPL CODE_BB9747				;$BB9728
	AND #$800F				;$BB972A
	CMP #$8002				;$BB972D
	BNE CODE_BB9747				;$BB9730
	PHX					;$BB9732
	LDA sprite.visibility+1,x		;$BB9733
	AND #$000E				;$BB9735
	TAX					;$BB9738
	DEC sprite_palette_reference_count,x	;$BB9739
	BMI CODE_BB9740				;$BB973C
	BNE CODE_BB9746				;$BB973E
CODE_BB9740:
	STZ sprite_palette_reference_count,x	;$BB9740
	STZ active_sprite_palettes_table,x	;$BB9743
CODE_BB9746:
	PLX					;$BB9746
CODE_BB9747:
	LDA sprite.oam_property,x		;$BB9747
	XBA					;$BB9749
	AND #$000E				;$BB974A
	TAX					;$BB974D
	DEC sprite_palette_reference_count,x	;$BB974E
	BMI CODE_BB9757				;$BB9751
	BEQ CODE_BB9757				;$BB9753
	SEC					;$BB9755
	RTS					;$BB9756

CODE_BB9757:
	STZ active_sprite_palettes_table,x	;$BB9757
	STZ sprite_palette_reference_count,x	;$BB975A
	CLC					;$BB975D
	RTS					;$BB975E

CODE_BB975F:
	LDY follower_kong_sprite		;$BB975F
	LDA.w sprite.oam_property,y		;$BB9762
	XBA					;$BB9765
	AND #$000E				;$BB9766
	TAX					;$BB9769
	LDA active_sprite_palettes_table,x	;$BB976A
	TYX					;$BB976D
	JML CODE_BB9785				;$BB976E

CODE_BB9772:
	JSL CODE_BB975F				;$BB9772
CODE_BB9776:
	LDY active_kong_sprite			;$BB9776
	LDA.w sprite.oam_property,y		;$BB9779
	XBA					;$BB977C
	AND #$000E				;$BB977D
	TAX					;$BB9780
	LDA active_sprite_palettes_table,x	;$BB9781
	TYX					;$BB9784
CODE_BB9785:
	TXY					;$BB9785
	PHA					;$BB9786
	LDA sprite.oam_property,x		;$BB9787
	XBA					;$BB9789
	AND #$000E				;$BB978A
	TAX					;$BB978D
	LDA active_sprite_palettes_table,x	;$BB978E
	CMP #$38CB				;$BB9791
	BNE CODE_BB979B				;$BB9794
	DEC sprite_palette_reference_count,x	;$BB9796
	BRA CODE_BB979F				;$BB9799

CODE_BB979B:
	TYX					;$BB979B
	JSR CODE_BB9747			;$BB979C
CODE_BB979F:
	PLA					;$BB979F
	JSR request_palette_direct		;$BB97A0
	TYX					;$BB97A3
	EOR sprite.oam_property,x		;$BB97A4
	AND #$0E00				;$BB97A6
	EOR sprite.oam_property,x		;$BB97A9
	STA sprite.oam_property,x		;$BB97AB
	RTL					;$BB97AD

CODE_BB97AE:
	LDX #$075C				;$BB97AE
CODE_BB97B1:
	STA $1C					;$BB97B1
	XBA					;$BB97B3
	AND #$00FF				;$BB97B4
	STA $1A					;$BB97B7
	LDA $1C					;$BB97B9
	AND #$00FF				;$BB97BB
	ASL					;$BB97BE
	TAY					;$BB97BF
	PHB					;$BB97C0
	%pea_shift_dbr(DATA_FD0000)		;$BB97C1
	PLB					;$BB97C4
	PLB					;$BB97C5
	LDA.w DATA_FD0000,y			;$BB97C6
	TAY					;$BB97C9
	LDA.w DATA_FD0400&$FF0000,y		;$BB97CA
	INY					;$BB97CD
	INY					;$BB97CE
	STA $00,x				;$BB97CF
	CMP #$0000				;$BB97D1
	BNE CODE_BB9810				;$BB97D4
	PLB					;$BB97D6
	SEC					;$BB97D7
	RTL					;$BB97D8

CODE_BB97D9:
	LDA $0005E5				;$BB97D9
	CMP #$0008				;$BB97DD
	BNE CODE_BB980D				;$BB97E0
	LDA $0005FD				;$BB97E2
	AND #$0100				;$BB97E6
	BEQ CODE_BB980D				;$BB97E9
	LDA $0005E7				;$BB97EB
	SEC					;$BB97EF
	SBC #$0003				;$BB97F0
	CMP #$0006				;$BB97F3
	BCS CODE_BB980D				;$BB97F6
	TXY					;$BB97F8
	TAX					;$BB97F9
	LDA DATA_FD54E3,x			;$BB97FA
	AND #$00FF				;$BB97FE
	STA $001B57				;$BB9801
	TYX					;$BB9805
	LDA $19,x				;$BB9806
	ORA #$8000				;$BB9808
	STA $19,x				;$BB980B
CODE_BB980D:
	PLB					;$BB980D
	CLC					;$BB980E
	RTL					;$BB980F

CODE_BB9810:
	CMP #$0002				;$BB9810
	BNE CODE_BB9838				;$BB9813
	LDA $0000,y				;$BB9815
	INY					;$BB9818
	INY					;$BB9819
	STA $02,x				;$BB981A
	LDA $0000,y				;$BB981C
	INY					;$BB981F
	AND #$00FF				;$BB9820
	STA $09,x				;$BB9823
	LDA $00053B				;$BB9825
	AND #$0001				;$BB9829
	BEQ CODE_BB9841				;$BB982C
	LDA #$002A				;$BB982E
	CLC					;$BB9831
	ADC $09,x				;$BB9832
	STA $09,x				;$BB9834
	BRA CODE_BB9841				;$BB9836

CODE_BB9838:
	LDA $0000,y				;$BB9838
	INY					;$BB983B
	AND #$00FF				;$BB983C
	STA $09,x				;$BB983F
CODE_BB9841:
	LDA $0000,y				;$BB9841
	INY					;$BB9844
	INY					;$BB9845
	STA $1E					;$BB9846
	LDA $0000,y				;$BB9848
	INY					;$BB984B
	AND #$00FF				;$BB984C
	STA $20					;$BB984F
	LDA $0000,y				;$BB9851
	INY					;$BB9854
	AND #$00FF				;$BB9855
	STA $001B57				;$BB9858
	SEP #$20				;$BB985C
	LDA $0000,y				;$BB985E
	INY					;$BB9861
	STA $33,x				;$BB9862
	REP #$20				;$BB9864
	LDA $0000,y				;$BB9866
	INY					;$BB9869
	INY					;$BB986A
	STA $34,x				;$BB986B
	SEP #$20				;$BB986D
	LDA $0000,y				;$BB986F
	INY					;$BB9872
	STA $04,x				;$BB9873
	REP #$20				;$BB9875
	LDA $0000,y				;$BB9877
	INY					;$BB987A
	INY					;$BB987B
	STA $37,x				;$BB987C
	LDA $0000,y				;$BB987E
	INY					;$BB9881
	INY					;$BB9882
	STA $1B,x				;$BB9883
	STY $1D,x				;$BB9885
	STZ $27,x				;$BB9887
	BRA CODE_BB9893				;$BB9889

CODE_BB988B:
	INC $27,x				;$BB988B
	TYA					;$BB988D
	CLC					;$BB988E
	ADC #$0005				;$BB988F
	TAY					;$BB9892
CODE_BB9893:
	LDA $0005,y				;$BB9893
	AND #$00FF				;$BB9896
	CMP #$00FF				;$BB9899
	BEQ CODE_BB98A2				;$BB989C
	DEC $1A					;$BB989E
	BPL CODE_BB988B				;$BB98A0
CODE_BB98A2:
	PHY					;$BB98A2
	LDA $20					;$BB98A3
	AND #$00FF				;$BB98A5
	STA $13,x				;$BB98A8
	LDY $1E					;$BB98AA
	LDA $0000,y				;$BB98AC
	INY					;$BB98AF
	AND #$00FF				;$BB98B0
	STA $05,x				;$BB98B3
	LDA $0000,y				;$BB98B5
	INY					;$BB98B8
	AND #$00FF				;$BB98B9
	STA $07,x				;$BB98BC
	LDA $0000,y				;$BB98BE
	INY					;$BB98C1
	AND #$00FF				;$BB98C2
	STA $0D,x				;$BB98C5
	LDA $0000,y				;$BB98C7
	INY					;$BB98CA
	AND #$00FF				;$BB98CB
	STA $0B,x				;$BB98CE
	LDA $0000,y				;$BB98D0
	INY					;$BB98D3
	AND #$00FF				;$BB98D4
	STA $25,x				;$BB98D7
	LDA $0000,y				;$BB98D9
	INY					;$BB98DC
	AND #$00FF				;$BB98DD
	STA $23,x				;$BB98E0
	LDA $0000,y				;$BB98E2
	INY					;$BB98E5
	AND #$00FF				;$BB98E6
	STA $15,x				;$BB98E9
	LDA $0000,y				;$BB98EB
	INY					;$BB98EE
	AND #$00FF				;$BB98EF
	STA $17,x				;$BB98F2
	LDA $0000,y				;$BB98F4
	INY					;$BB98F7
	AND #$00FF				;$BB98F8
	STA $11,x				;$BB98FB
	LDA $0000,y				;$BB98FD
	INY					;$BB9900
	INY					;$BB9901
	STA $19,x				;$BB9902
	PLY					;$BB9904
	SEP #$20				;$BB9905
	LDA $0000,y				;$BB9907
	STA $36,x				;$BB990A
	REP #$20				;$BB990C
	LDA $0001,y				;$BB990E
	STA $1F,x				;$BB9911
	LDA $0003,y				;$BB9913
	STA $21,x				;$BB9916
	BRA CODE_BB991C				;$BB9918

CODE_BB991A:
	INC $27,x				;$BB991A
CODE_BB991C:
	TYA					;$BB991C
	CLC					;$BB991D
	ADC #$0005				;$BB991E
	TAY					;$BB9921
	LDA $0000,y				;$BB9922
	AND #$00FF				;$BB9925
	CMP #$00FF				;$BB9928
	BNE CODE_BB991A				;$BB992B
	INY					;$BB992D
	JSR CODE_BB9934				;$BB992E
	BRL CODE_BB97D9				;$BB9931

CODE_BB9934:
	STZ $29,x				;$BB9934
	STZ $2B,x				;$BB9936
	STZ $2D,x				;$BB9938
	STZ $2F,x				;$BB993A
	STZ $31,x				;$BB993C
	LDA $00,x				;$BB993E
	CMP #$0001				;$BB9940
	BNE CODE_BB9956				;$BB9943
	PHX					;$BB9945
	BRA CODE_BB994E				;$BB9946

CODE_BB9948:
	INY					;$BB9948
	INY					;$BB9949
	STA $29,x				;$BB994A
	INX					;$BB994C
	INX					;$BB994D
CODE_BB994E:
	LDA $0000,y				;$BB994E
	BPL CODE_BB9948				;$BB9951
	INY					;$BB9953
	INY					;$BB9954
	PLX					;$BB9955
CODE_BB9956:
	RTS					;$BB9956

CODE_BB9957:
	JSL disable_screen			;$BB9957
	JSL CODE_808009				;$BB995B
	JSL CODE_80801B				;$BB995F
	JSL CODE_80800C				;$BB9963
	STZ active_frame_counter		;$BB9967
	LDX #$7EA15A				;$BB9969
	LDY.w #$7EA15A>>16			;$BB996C
	LDA #$0660				;$BB996F
	JSL CODE_808030				;$BB9972
	JSL CODE_B2802A				;$BB9976
	LDA $05AF				;$BB997A
	AND #$D080				;$BB997D
	STA $05AF				;$BB9980
	LDA #$0006				;$BB9983
	TRB $05B1				;$BB9986
	LDA #$FFFF				;$BB9989
	STA $06F4				;$BB998C
	STA $06F6				;$BB998F
	LDA #$FFF9				;$BB9992
	STA $AA					;$BB9995
	LDA #$0005				;$BB9997
	STA $AC					;$BB999A
	LDA #CODE_BB9A86			;$BB999C
	STA $18B1				;$BB999F
	LDA.w #CODE_BB9A86>>16			;$BB99A2
	STA $18B3				;$BB99A5
	BIT $05AF				;$BB99A8
	BPL CODE_BB99B6				;$BB99AB
	STZ hud_current_banana_count		;$BB99AD
	LDA #$0005				;$BB99B0
	STA lives_count				;$BB99B3
CODE_BB99B6:
	JSR CODE_BB9AD3				;$BB99B6
	LDA $05B7				;$BB99B9
	XBA					;$BB99BC
	ORA level_number			;$BB99BD
	JSL CODE_BB97AE				;$BB99BF
	LDA $076D				;$BB99C3
	JSL CODE_B7B000				;$BB99C6
	JSR CODE_BBA3D6				;$BB99CA
	JSL CODE_B38000				;$BB99CD
	JSL CODE_B7E49C				;$BB99D1
	LDA $075C				;$BB99D5
	CMP #$0001				;$BB99D8
	BEQ CODE_BB99E2				;$BB99DB
	CMP #$0003				;$BB99DD
	BNE CODE_BB99FA				;$BB99E0
CODE_BB99E2:
	LDA level_number			;$BB99E2
	STA parent_level_number			;$BB99E4
	LDA $05B7				;$BB99E7
	BNE CODE_BB99FA				;$BB99EA
	LDA active_cheats			;$BB99EC
	AND #$8000				;$BB99EF
	BEQ CODE_BB99FA				;$BB99F2
	LDA #$4000				;$BB99F4
	TSB $05AF				;$BB99F7
CODE_BB99FA:
	JSL CODE_BBBC73				;$BB99FA
	LDA #$000F				;$BB99FE
	JSL request_palette_direct_global	;$BB9A01
	ORA #$3000				;$BB9A05
	CLC					;$BB9A08
	ADC #$01E0				;$BB9A09
	STA $B4					;$BB9A0C
	AND #$0E00				;$BB9A0E
	ORA #$01E0				;$BB9A11
	STA $B6					;$BB9A14
	JSR CODE_BB9A87				;$BB9A16
	LDA lives_count				;$BB9A19
	STA hud_lives_count			;$BB9A1C
	STZ hud_lives_to_add			;$BB9A1F
	LDA $075C				;$BB9A22
	CMP #$0001				;$BB9A25
	BEQ CODE_BB9A2F				;$BB9A28
	CMP #$0003				;$BB9A2A
	BNE CODE_BB9A38				;$BB9A2D
CODE_BB9A2F:
	LDA #$0078				;$BB9A2F
	STA hud_lives_display_timer		;$BB9A32
	STA hud_banana_display_timer		;$BB9A35
CODE_BB9A38:
	JSL init_sprite_render_order		;$BB9A38
	LDA current_kong			;$BB9A3C
	JSL CODE_B8805A				;$BB9A3F
	LDA $0767				;$BB9A43
	ASL					;$BB9A46
	TAX					;$BB9A47
	JSR (DATA_BB9B60,x)			;$BB9A48
	JSL CODE_B7B006				;$BB9A4B
	LDA $0760				;$BB9A4F
	BIT #$0080				;$BB9A52
	BEQ CODE_BB9A5F				;$BB9A55
	AND #$007F				;$BB9A57
	ASL					;$BB9A5A
	TAX					;$BB9A5B
	JSR (DATA_BB9C06,x)			;$BB9A5C
CODE_BB9A5F:
	JSL CODE_B38003				;$BB9A5F
	JSL CODE_B38006				;$BB9A63
	JSR CODE_BB9BE6				;$BB9A67
	LDA $0760				;$BB9A6A
	BIT #$0080				;$BB9A6D
	BNE CODE_BB9A7A				;$BB9A70
	AND #$00FF				;$BB9A72
	ASL					;$BB9A75
	TAX					;$BB9A76
	JSR (DATA_BB9C06,x)			;$BB9A77
CODE_BB9A7A:
	LDA $0775				;$BB9A7A
	AND #$0800				;$BB9A7D
	STA $F8					;$BB9A80
	JSL CODE_80808A				;$BB9A82
CODE_BB9A86:
	RTL					;$BB9A86

CODE_BB9A87:
	LDA $075C				;$BB9A87
	CMP #$0002				;$BB9A8A
	BNE CODE_BB9AC4				;$BB9A8D
	LDA $075E				;$BB9A8F
	AND #$0007				;$BB9A92
	CMP #$0003				;$BB9A95
	BCC CODE_BB9AC4				;$BB9A98
	BNE CODE_BB9AA9				;$BB9A9A
	LDA active_cheats			;$BB9A9C
	AND #$0001				;$BB9A9F
	BEQ CODE_BB9AC4				;$BB9AA2
	LDY #$0037				;$BB9AA4
	BRA CODE_BB9AB7				;$BB9AA7

CODE_BB9AA9:
	LDY #$0024				;$BB9AA9
	LDA active_cheats			;$BB9AAC
	AND #$0001				;$BB9AAF
	BEQ CODE_BB9AB7				;$BB9AB2
	LDY #$0036				;$BB9AB4
CODE_BB9AB7:
	TYA					;$BB9AB7
	JSL request_palette_direct_global	;$BB9AB8
	AND #$0E00				;$BB9ABC
	ORA #$01E0				;$BB9ABF
	BRA CODE_BB9AC6				;$BB9AC2

CODE_BB9AC4:
	LDA $B6					;$BB9AC4
CODE_BB9AC6:
	STA $18F7				;$BB9AC6
	STA $18F9				;$BB9AC9
	STA $18FB				;$BB9ACC
	STA $18FD				;$BB9ACF
	RTS					;$BB9AD2

CODE_BB9AD3:
	LDA level_number			;$BB9AD3
	CMP $05BD				;$BB9AD5
	BNE CODE_BB9B05				;$BB9AD8
	LDA $05B7				;$BB9ADA
	BNE CODE_BB9B05				;$BB9ADD
	LDA $05BB				;$BB9ADF
	STA $05B7				;$BB9AE2
	LDA $05BD				;$BB9AE5
	STA level_number			;$BB9AE8
	LDA $05C1				;$BB9AEA
	STA current_animal_type			;$BB9AED
	STZ current_mount			;$BB9AEF
	STZ parry_index				;$BB9AF1
	LDA $05C3				;$BB9AF3
	STA $05D7				;$BB9AF6
	LDA $05C6				;$BB9AF9
	STA $0536				;$BB9AFC
	LDA $05C5				;$BB9AFF
	STA $0535				;$BB9B02
CODE_BB9B05:
	RTS					;$BB9B05

CODE_BB9B06:
	LDA #$0100				;$BB9B06
	STA $18E5				;$BB9B09
	LDA #$0001				;$BB9B0C
	STA $05B7				;$BB9B0F
	STA $0533				;$BB9B12
	STA $05BB				;$BB9B15
	LDA level_number			;$BB9B18
	STA $05BD				;$BB9B1A
	LDA parent_level_number			;$BB9B1D
	STA $05BF				;$BB9B20
	STZ $05C1				;$BB9B23
	LDA current_mount			;$BB9B26
	BNE CODE_BB9B2F				;$BB9B28
	LDA current_animal_type			;$BB9B2A
	STA $05C1				;$BB9B2C
CODE_BB9B2F:
	LDA $05D7				;$BB9B2F
	STA $05C3				;$BB9B32
	LDA $0536				;$BB9B35
	STA $05C6				;$BB9B38
	LDA $0535				;$BB9B3B
	STA $05C5				;$BB9B3E
	RTL					;$BB9B41

disable_screen:
	SEP #$20				;$BB9B42
	LDA #$00				;$BB9B44
	STA.l CPU.enable_hdma			;$BB9B46
	LDA #$01				;$BB9B4A
	STA.l CPU.enable_interrupts		;$BB9B4C
	LDA #$8F				;$BB9B50
	STA.l PPU.screen			;$BB9B52
	REP #$20				;$BB9B56
	LDA #$0000				;$BB9B58
	STA $0004E4				;$BB9B5B
	RTL					;$BB9B5F

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
	RTS					;$BB9B72

CODE_BB9B73:
	JSL CODE_B8805D				;$BB9B73
	RTS					;$BB9B77

CODE_BB9B78:
	JSL CODE_808057				;$BB9B78
	RTS					;$BB9B7C

CODE_BB9B7D:
	LDY #$031C				;$BB9B7D
	JSL CODE_BB8F34				;$BB9B80
	LDY alternate_sprite			;$BB9B84
	STY active_kong_sprite			;$BB9B86
	RTS					;$BB9B89

CODE_BB9B8A:
	LDY #$0336				;$BB9B8A
	LDA #$0005				;$BB9B8D
	JSL CODE_BB8FA4				;$BB9B90
	LDA alternate_sprite			;$BB9B94
	STA $1C4D				;$BB9B96
	LDY #$0332				;$BB9B99
	JSL CODE_BB8F61				;$BB9B9C
	LDX alternate_sprite			;$BB9BA0
	STX active_kong_sprite			;$BB9BA2
	RTS					;$BB9BA5

CODE_BB9BA6:
	LDA #!sprite_ellie			;$BB9BA6
	STA current_animal_type			;$BB9BA9
	STZ current_mount			;$BB9BAB
	JSL CODE_B8805D				;$BB9BAD
	RTS					;$BB9BB1

CODE_BB9BB2:
	JSL CODE_B8805D				;$BB9BB2
	LDY active_kong_sprite			;$BB9BB6
	LDA #$0008				;$BB9BB9
CODE_BB9BBC:
	CLC					;$BB9BBC
	ADC $05B7				;$BB9BBD
	STA.w sprite.general_purpose_5C,y	;$BB9BC0
	LDA #!kong_state_75			;$BB9BC3
	STA.w sprite.state,y			;$BB9BC6
	JSL.l CODE_BBB9B0			;$BB9BC9
	RTS					;$BB9BCD

CODE_BB9BCE:
	JSL CODE_B8805D				;$BB9BCE
	LDY active_kong_sprite			;$BB9BD2
	LDA #$000B				;$BB9BD5
	BRA CODE_BB9BBC				;$BB9BD8

CODE_BB9BDA:
	JSL CODE_B8805D				;$BB9BDA
	LDY active_kong_sprite			;$BB9BDE
	LDA #$000D				;$BB9BE1
	BRA CODE_BB9BBC				;$BB9BE4

CODE_BB9BE6:
	LDA $0777				;$BB9BE6
	BIT #$0002				;$BB9BE9
	BEQ CODE_BB9C05				;$BB9BEC
	LDX #$0008				;$BB9BEE
	LDY #$0004				;$BB9BF1
	BIT #$0008				;$BB9BF4
	BNE CODE_BB9BFF				;$BB9BF7
	LDX #$0001				;$BB9BF9
	LDY #$000E				;$BB9BFC
CODE_BB9BFF:
	STX $0519				;$BB9BFF
	STY $051B				;$BB9C02
CODE_BB9C05:
	RTS					;$BB9C05

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
	JSR CODE_BBA0D1				;$BB9C32
	JSL CODE_BBA19F				;$BB9C35
	RTS					;$BB9C39

CODE_BB9C3A:
	LDA #$0003				;$BB9C3A
	LDY $054B				;$BB9C3D
	BNE CODE_BB9C49				;$BB9C40
	DEC					;$BB9C42
	LDY current_kong			;$BB9C43
	BNE CODE_BB9C49				;$BB9C46
	DEC					;$BB9C48
CODE_BB9C49:
	JSL CODE_BBBAAE				;$BB9C49
	JSR CODE_BBA0D1				;$BB9C4D
	LDA #$057C				;$BB9C50
	JSL CODE_B28018				;$BB9C53
	RTS					;$BB9C57

CODE_BB9C58:
	LDA #$0004				;$BB9C58
	JSL CODE_BBBAAE				;$BB9C5B
	BRA CODE_BB9C32				;$BB9C5F

CODE_BB9C61:
	LDA $05B7				;$BB9C61
	LSR					;$BB9C64
	BNE CODE_BB9C70				;$BB9C65
	LDA #$FFFF				;$BB9C67
	STA $04C2				;$BB9C6A
	LDA #$0000				;$BB9C6D
CODE_BB9C70:
	STA $054F				;$BB9C70
	BRA CODE_BB9C32				;$BB9C73

CODE_BB9C75:
	LDA #CODE_BB9FAF			;$BB9C75
	STA $18B1				;$BB9C78
	LDA.w #CODE_BB9FAF>>16			;$BB9C7B
	STA $18B3				;$BB9C7E
	LDX $0793				;$BB9C81
	LDA.l DATA_FD16C1,x			;$BB9C84
	STA $18AD				;$BB9C88
	STA $42					;$BB9C8B
	LDA.w #DATA_FD16CF>>16			;$BB9C8D
	STA $18AF				;$BB9C90
	STA $44					;$BB9C93
	LDY #$0000				;$BB9C95
	TYX					;$BB9C98
CODE_BB9C99:
	LDA [$42],y				;$BB9C99
	BMI CODE_BB9CB1				;$BB9C9B
	STA $18B7,x				;$BB9C9D
	INY					;$BB9CA0
	INY					;$BB9CA1
	INY					;$BB9CA2
	INY					;$BB9CA3
	LDA [$42],y				;$BB9CA4
	STA $18C1,x				;$BB9CA6
	INY					;$BB9CA9
	INY					;$BB9CAA
	INY					;$BB9CAB
	INY					;$BB9CAC
	INX					;$BB9CAD
	INX					;$BB9CAE
	BRA CODE_BB9C99				;$BB9CAF

CODE_BB9CB1:
	STA $18B7,x				;$BB9CB1
	STA $18C1,x				;$BB9CB4
	INX					;$BB9CB7
	INX					;$BB9CB8
	CPX #$000A				;$BB9CB9
	BCC CODE_BB9CB1				;$BB9CBC
CODE_BB9CBE:
	LDX $0793				;$BB9CBE
	LDA.l DATA_FF5F52,x			;$BB9CC1
	BEQ CODE_BB9CD4				;$BB9CC5
	LDY #$0070				;$BB9CC7
	JSL CODE_BB8F34				;$BB9CCA
	LDY alternate_sprite			;$BB9CCE
	JSL CODE_BBB9B0				;$BB9CD0
CODE_BB9CD4:
	BRL CODE_BB9C32				;$BB9CD4

CODE_BB9CD7:
	LDA #CODE_BB9F88			;$BB9CD7
	STA $18B1				;$BB9CDA
	LDA.w #CODE_BB9F88>>16			;$BB9CDD
	STA $18B3				;$BB9CE0
	LDY #$0382				;$BB9CE3
	JSL CODE_BB8F34				;$BB9CE6
	BRL CODE_BB9C32				;$BB9CEA

CODE_BB9CED:
	LDA #$FFFF				;$BB9CED
	STA sprite_vram_allocation_table	;$BB9CF0
	STZ PPU.vram_address			;$BB9CF3
	LDX #$0000				;$BB9CF6
CODE_BB9CF9:
	LDA.l DATA_FC3720,x			;$BB9CF9
	STA PPU.vram_write			;$BB9CFD
	INX					;$BB9D00
	INX					;$BB9D01
	CPX #$01E0				;$BB9D02
	BCC CODE_BB9CF9				;$BB9D05
	LDY #$028A				;$BB9D07
	JSL CODE_BB8F34				;$BB9D0A
	STZ $0533				;$BB9D0E
	LDA $05B7				;$BB9D11
	BEQ CODE_BB9D27				;$BB9D14
	DEC					;$BB9D16
	BEQ CODE_BB9D2D				;$BB9D17
	LDA $0539				;$BB9D19
	STA $0536				;$BB9D1C
	LDA $0538				;$BB9D1F
	STA $0535				;$BB9D22
	BRA CODE_BB9D33				;$BB9D25

CODE_BB9D27:
	STZ $0535				;$BB9D27
	STZ $0536				;$BB9D2A
CODE_BB9D2D:
	LDA #$0100				;$BB9D2D
	STA $18E5				;$BB9D30
CODE_BB9D33:
	LDA $05B7				;$BB9D33
	CMP #$0004				;$BB9D36
	BNE CODE_BB9D41				;$BB9D39
	LDA #$0959				;$BB9D3B
	STA $0536				;$BB9D3E
CODE_BB9D41:
	BRL CODE_BB9C32				;$BB9D41

CODE_BB9D44:
	LDA level_number			;$BB9D44
	LDY #$005A				;$BB9D46
	CMP #!level_ripsaw_rage			;$BB9D49
	BEQ CODE_BB9D59				;$BB9D4C
	LDY #$005C				;$BB9D4E
	CMP #!level_ripsaw_rage_bonus_1		;$BB9D51
	BEQ CODE_BB9D59				;$BB9D54
	LDY #$005E				;$BB9D56
CODE_BB9D59:
	JSL CODE_BB8F34				;$BB9D59
	LDY alternate_sprite			;$BB9D5D
	JSL CODE_BBB9B0				;$BB9D5F
	JSL CODE_B3800C				;$BB9D63
	BRL CODE_BB9EDC				;$BB9D67

CODE_BB9D6A:
	LDA $05B7				;$BB9D6A
	CMP #$0002				;$BB9D6D
	BCS CODE_BB9D75				;$BB9D70
	STZ $054F				;$BB9D72
CODE_BB9D75:
	JMP CODE_BB9C32				;$BB9D75

CODE_BB9D78:
	LDA #$0400				;$BB9D78
	STA PPU.vram_address			;$BB9D7B
	LDX #$0000				;$BB9D7E
CODE_BB9D81:
	LDA.l SPRITE_GRAPHIC_FC3020,x		;$BB9D81
	STA PPU.vram_write			;$BB9D85
	INX					;$BB9D88
	INX					;$BB9D89
	CPX #$0800				;$BB9D8A
	BCC CODE_BB9D81				;$BB9D8D
	BRL CODE_BB9C32				;$BB9D8F

CODE_BB9D92:
	LDA $0793				;$BB9D92
	AND #$00FF				;$BB9D95
	ASL					;$BB9D98
	ADC #$002A				;$BB9D99
	TAY					;$BB9D9C
	JSL CODE_BB8F34				;$BB9D9D
	LDX alternate_sprite			;$BB9DA1
	JSL CODE_BB9503				;$BB9DA3
	LDA #$001C				;$BB9DA7
	JSL request_palette_direct_global	;$BB9DAA
	LDX alternate_sprite			;$BB9DAE
	EOR sprite.oam_property,x		;$BB9DB0
	AND #$0E00				;$BB9DB2
	EOR sprite.oam_property,x		;$BB9DB5
	STA sprite.oam_property,x		;$BB9DB7
	JSR CODE_BB9E2C				;$BB9DB9
	LDX active_kong_sprite			;$BB9DBC
	LDA sprite.x_position,x			;$BB9DBF
	SEC					;$BB9DC1
	SBC #$0080				;$BB9DC2
	STA $196D				;$BB9DC5
	LDX alternate_sprite			;$BB9DC8
	LDA sprite.general_purpose_4E,x		;$BB9DCA
	STA $1A					;$BB9DCC
	LDA.w #DATA_FF2BE5>>16			;$BB9DCE
	STA $1C					;$BB9DD1
	LDA $05B7				;$BB9DD3
	ASL					;$BB9DD6
	TAY					;$BB9DD7
	LDA [$1A],y				;$BB9DD8
	SEC					;$BB9DDA
	SBC #$00E0				;$BB9DDB
	STA $189F				;$BB9DDE
	STZ $18A1				;$BB9DE1
	STA $1973				;$BB9DE4
	LDY alternate_sprite			;$BB9DE7
	JSL CODE_BBB9B0				;$BB9DE9
	LDY alternate_sprite			;$BB9DED
	LDA $189F				;$BB9DEF
	SEC					;$BB9DF2
	SBC.w sprite.y_position,y		;$BB9DF3
	CLC					;$BB9DF6
	ADC #$0100				;$BB9DF7
	CMP.w sprite.general_purpose_5E,y	;$BB9DFA
	BCS CODE_BB9E02				;$BB9DFD
	STA.w sprite.general_purpose_5E,y	;$BB9DFF
CODE_BB9E02:
	LDA #$003C				;$BB9E02
	STA.w sprite.general_purpose_64,y	;$BB9E05
	LDA #$0020				;$BB9E08
	TSB $05AF				;$BB9E0B
	LDA #$2000				;$BB9E0E
	TSB $0474				;$BB9E11
	LDA #$7C00				;$BB9E14
	STA $04A6				;$BB9E17
	STA $04A8				;$BB9E1A
	STZ $04AA				;$BB9E1D
	STZ $04AE				;$BB9E20
	LDA #$AC00				;$BB9E23
	STA $04AC				;$BB9E26
	BRL CODE_BB9C32				;$BB9E29

CODE_BB9E2C:
	AND #$01E0				;$BB9E2C
	ASL					;$BB9E2F
	ASL					;$BB9E30
	ASL					;$BB9E31
	ASL					;$BB9E32
	STA $42					;$BB9E33
	STA PPU.vram_address			;$BB9E35
	LDX #$0000				;$BB9E38
	LDY #$0030				;$BB9E3B
	JSR CODE_BB9E6F				;$BB9E3E
	LDY #$0010				;$BB9E41
	JSR CODE_BB9E68				;$BB9E44
	LDY #$0010				;$BB9E47
	JSR CODE_BB9E6F				;$BB9E4A
	LDA $42					;$BB9E4D
	CLC					;$BB9E4F
	ADC #$0100				;$BB9E50
	STA PPU.vram_address			;$BB9E53
	LDY #$0020				;$BB9E56
	JSR CODE_BB9E6F				;$BB9E59
	LDX #$0040				;$BB9E5C
	LDY #$0010				;$BB9E5F
	JSR CODE_BB9E6F				;$BB9E62
	LDY #$0010				;$BB9E65
CODE_BB9E68:
	STZ PPU.vram_write			;$BB9E68
	DEY					;$BB9E6B
	BNE CODE_BB9E68				;$BB9E6C
	RTS					;$BB9E6E

CODE_BB9E6F:
	LDA.l SPRITE_GRAPHIC_C079A6,x		;$BB9E6F
	STA PPU.vram_write			;$BB9E73
	INX					;$BB9E76
	INX					;$BB9E77
	DEY					;$BB9E78
	BNE CODE_BB9E6F				;$BB9E79
	RTS					;$BB9E7B

CODE_BB9E7C:
	LDA #$0004				;$BB9E7C
	STA $AC					;$BB9E7F
	JMP CODE_BB9C32				;$BB9E81

CODE_BB9E84:
	LDA #$0004				;$BB9E84
	STA $051F				;$BB9E87
	JMP CODE_BB9C32				;$BB9E8A

CODE_BB9E8D:
	LDY #$0304				;$BB9E8D
	JSL CODE_BB8F34				;$BB9E90
	LDY active_kong_sprite			;$BB9E94
	LDX alternate_sprite			;$BB9E97
	LDA.w sprite.x_position,y		;$BB9E99
	CLC					;$BB9E9C
	ADC #$0380				;$BB9E9D
	STA sprite.x_position,x			;$BB9EA0
	JMP CODE_BB9C32				;$BB9EA2

CODE_BB9EA5:
	LDY #$031E				;$BB9EA5
	JSL CODE_BB8F34				;$BB9EA8
	LDY active_kong_sprite			;$BB9EAC
	LDX alternate_sprite			;$BB9EAF
	LDA.w sprite.x_position,y		;$BB9EB1
	CLC					;$BB9EB4
	ADC #$0100				;$BB9EB5
	STA sprite.x_position,x			;$BB9EB8
	JMP CODE_BB9C32				;$BB9EBA

CODE_BB9EBD:
	LDA $05B7				;$BB9EBD
	CMP #$0002				;$BB9EC0
	BCS CODE_BB9ECB				;$BB9EC3
	STZ $054F				;$BB9EC5
	STZ $0551				;$BB9EC8
CODE_BB9ECB:
	JMP CODE_BB9C32				;$BB9ECB

CODE_BB9ECE:
	LDA $05B7				;$BB9ECE
	CMP #$0002				;$BB9ED1
	BCS CODE_BB9ED9				;$BB9ED4
	STZ $054F				;$BB9ED6
CODE_BB9ED9:
	JMP CODE_BB9C32				;$BB9ED9

CODE_BB9EDC:
	LDA #$0004				;$BB9EDC
	STA $AC					;$BB9EDF
	LDA #CODE_BB9F1F			;$BB9EE1
	STA $18B1				;$BB9EE4
	LDA.w #CODE_BB9F1F>>16			;$BB9EE7
	STA $18B3				;$BB9EEA
	JMP CODE_BB9C32				;$BB9EED

CODE_BB9EF0:
	LDA #$000B				;$BB9EF0
	JSL CODE_BBBAAE				;$BB9EF3
	LDY #$01BC				;$BB9EF7
	JSL CODE_BB8F12				;$BB9EFA
	JMP CODE_BB9C32				;$BB9EFE

CODE_BB9F01:
	LDA #$000B				;$BB9F01
	JSL CODE_BBBAAE				;$BB9F04
	LDA #$0003				;$BB9F08
	LDY #$01BE				;$BB9F0B
	JSL CODE_BB8FA4				;$BB9F0E
	JMP CODE_BB9C32				;$BB9F12

CODE_BB9F15:
	LDY #$01CE				;$BB9F15
	JSL CODE_BB8F12				;$BB9F18
	JMP CODE_BB9C32				;$BB9F1C

CODE_BB9F1F:
	LDY #DATA_BB9F68			;$BB9F1F
	LDA parent_level_number			;$BB9F22
	CMP #!level_swoopy_salvo		;$BB9F25
	BNE CODE_BB9F3F				;$BB9F28
	LDY #DATA_BB9F72			;$BB9F2A
	LDA level_number			;$BB9F2D
	CMP #!level_swoopy_salvo		;$BB9F2F
	BEQ CODE_BB9F3F				;$BB9F32
	LDY #DATA_BB9F7C			;$BB9F34
	CMP #$0097				;$BB9F37
	BEQ CODE_BB9F3F				;$BB9F3A
	LDY #DATA_BB9F82			;$BB9F3C
CODE_BB9F3F:
	PHK					;$BB9F3F
	PLB					;$BB9F40
	LDX current_sprite			;$BB9F41
	LDA sprite.x_position,x			;$BB9F43
CODE_BB9F45:
	CMP $0000,y				;$BB9F45
	BCC CODE_BB9F60				;$BB9F48
	CMP $0002,y				;$BB9F4A
	BCC CODE_BB9F55				;$BB9F4D
	INY					;$BB9F4F
	INY					;$BB9F50
	INY					;$BB9F51
	INY					;$BB9F52
	BRA CODE_BB9F45				;$BB9F53

CODE_BB9F55:
	LDA sprite.oam_property,x		;$BB9F55
	AND #$CFFF				;$BB9F57
	ORA #$2000				;$BB9F5A
	STA sprite.oam_property,x		;$BB9F5D
	RTL					;$BB9F5F

CODE_BB9F60:
	LDA sprite.oam_property,x		;$BB9F60
	ORA #$3000				;$BB9F62
	STA sprite.oam_property,x		;$BB9F65
	RTL					;$BB9F67

DATA_BB9F68:
	dw $0150,$0230,$02D0,$03B0,$FFFF

DATA_BB9F72:
	dw $0170,$0250,$0310,$03F0,$FFFF

DATA_BB9F7C:
	dw $0150,$01F0,$FFFF

DATA_BB9F82:
	dw $0130,$01F0,$FFFF

CODE_BB9F88:
	LDX active_kong_sprite			;$BB9F88
	JSR CODE_BB9F95				;$BB9F8B
	LDX follower_kong_sprite		;$BB9F8E
	JSR CODE_BB9F95				;$BB9F91
	RTL					;$BB9F94

CODE_BB9F95:
	LDA #$02B8				;$BB9F95
	CMP sprite.y_position,x			;$BB9F98
	BCS CODE_BB9FA4				;$BB9F9A
	LDA sprite.oam_property,x		;$BB9F9C
	ORA #$3000				;$BB9F9E
	STA sprite.oam_property,x		;$BB9FA1
	RTS					;$BB9FA3

CODE_BB9FA4:
	LDA sprite.oam_property,x		;$BB9FA4
	AND #$CFFF				;$BB9FA6
	ORA #$2000				;$BB9FA9
	STA sprite.oam_property,x		;$BB9FAC
	RTS					;$BB9FAE

CODE_BB9FAF:
	LDX current_sprite			;$BB9FAF
	BIT $18B5				;$BB9FB1
	BVS CODE_BB9FEB				;$BB9FB4
	BPL CODE_BB9FC7				;$BB9FB6
	JSL CODE_B9E027				;$BB9FB8
	CMP #$7F00				;$BB9FBC
	BEQ CODE_BB9FCE				;$BB9FBF
	CMP sprite.y_position,x			;$BB9FC1
	BCS CODE_BB9FDF				;$BB9FC3
	BRA CODE_BB9FFA				;$BB9FC5

CODE_BB9FC7:
	LDA sprite.ground_distance,x		;$BB9FC7
	CMP #$8050				;$BB9FC9
	BNE CODE_BB9FD6				;$BB9FCC
CODE_BB9FCE:
	LDA #$0050				;$BB9FCE
	CLC					;$BB9FD1
	ADC sprite.y_position,x			;$BB9FD2
	BRA CODE_BB9FDF				;$BB9FD4

CODE_BB9FD6:
	BCS CODE_BB9FFA				;$BB9FD6
	CMP #$4000				;$BB9FD8
	BEQ CODE_BB9FFA				;$BB9FDB
	LDA sprite.ground_y_position,x		;$BB9FDD
CODE_BB9FDF:
	SEC					;$BB9FDF
	SBC #$0020				;$BB9FE0
	STA $3E					;$BB9FE3
	CLC					;$BB9FE5
	ADC #$00A0				;$BB9FE6
	STA $40					;$BB9FE9
CODE_BB9FEB:
	LDA $18AD				;$BB9FEB
	STA $42					;$BB9FEE
	LDA $18AF				;$BB9FF0
	STA $44					;$BB9FF3
	LDY #$0000				;$BB9FF5
	BRA CODE_BBA000				;$BB9FF8

CODE_BB9FFA:
	BRA CODE_BBA079				;$BB9FFA

CODE_BB9FFC:
	INY					;$BB9FFC
	INY					;$BB9FFD
	INY					;$BB9FFE
	INY					;$BB9FFF
CODE_BBA000:
	LDA [$42],y				;$BBA000
	BMI CODE_BBA079				;$BBA002
	CMP sprite.x_position,x			;$BBA004
	BCC CODE_BBA011				;$BBA006
	SBC #$0048				;$BBA008
	CMP sprite.x_position,x			;$BBA00B
	BCS CODE_BBA079				;$BBA00D
	BRA CODE_BBA022				;$BBA00F

CODE_BBA011:
	INY					;$BBA011
	INY					;$BBA012
	INY					;$BBA013
	INY					;$BBA014
	LDA [$42],y				;$BBA015
	CMP sprite.x_position,x			;$BBA017
	BCS CODE_BBA079				;$BBA019
	ADC #$0048				;$BBA01B
	CMP sprite.x_position,x			;$BBA01E
	BCC CODE_BB9FFC				;$BBA020
CODE_BBA022:
	STA $1A					;$BBA022
	LDA [$42],y				;$BBA024
	STA $1C					;$BBA026
	BIT $18B5				;$BBA028
	BVS CODE_BBA046				;$BBA02B
	INY					;$BBA02D
	INY					;$BBA02E
	LDA [$42],y				;$BBA02F
	STA $42					;$BBA031
	LDY #$0000				;$BBA033
CODE_BBA036:
	LDA [$42],y				;$BBA036
	BEQ CODE_BBA079				;$BBA038
	CMP $3E					;$BBA03A
	BCC CODE_BBA079				;$BBA03C
	CMP $40					;$BBA03E
	BCC CODE_BBA046				;$BBA040
	INY					;$BBA042
	INY					;$BBA043
	BRA CODE_BBA036				;$BBA044

CODE_BBA046:
	LDA $1A					;$BBA046
	CLC					;$BBA048
	ADC $1C					;$BBA049
	LSR					;$BBA04B
	CMP sprite.x_position,x			;$BBA04C
	ROR $3A					;$BBA04E
	LDA $1C					;$BBA050
	SEC					;$BBA052
	SBC $1A					;$BBA053
	EOR $3A					;$BBA055
	BPL CODE_BBA068				;$BBA057
	LDA sprite.oam_property,x		;$BBA059
	ORA #$3000				;$BBA05B
	STA sprite.oam_property,x		;$BBA05E
	LDA sprite.render_order,x		;$BBA060
	ORA #$0040				;$BBA062
	STA sprite.render_order,x		;$BBA065
	RTL					;$BBA067

CODE_BBA068:
	LDA sprite.oam_property,x		;$BBA068
	AND #$CFFF				;$BBA06A
	ORA #$2000				;$BBA06D
	STA sprite.oam_property,x		;$BBA070
	LDA sprite.render_order,x		;$BBA072
	AND #$FFBF				;$BBA074
	STA sprite.render_order,x		;$BBA077
CODE_BBA079:
	LDA $18B5				;$BBA079
	AND #$2000				;$BBA07C
	BNE CODE_BBA0D0				;$BBA07F
	LDA sprite.oam_property,x		;$BBA081
	AND #$3000				;$BBA083
	CMP #$3000				;$BBA086
	BEQ CODE_BBA0D0				;$BBA089
	LDA sprite.ground_distance,x		;$BBA08B
	CMP #$4000				;$BBA08D
	BCC CODE_BBA0D0				;$BBA090
	CPX current_held_sprite			;$BBA092
	BEQ CODE_BBA0D0				;$BBA095
	LDA sprite.unknown_54,x			;$BBA097
	LDY #$FFFE				;$BBA099
CODE_BBA09C:
	INY					;$BBA09C
	INY					;$BBA09D
	CMP $18C1,y				;$BBA09E
	BCS CODE_BBA09C				;$BBA0A1
	CMP $18B7,y				;$BBA0A3
	BCC CODE_BBA0D0				;$BBA0A6
	LDA $18C1,y				;$BBA0A8
	SBC #$0024				;$BBA0AB
	CMP sprite.x_position,x			;$BBA0AE
	BCS CODE_BBA0B9				;$BBA0B0
	CMP sprite.unknown_54,x			;$BBA0B2
	BCS CODE_BBA0CC				;$BBA0B4
	DEC sprite.x_position,x			;$BBA0B6
	RTL					;$BBA0B8

CODE_BBA0B9:
	LDA $18B7,y				;$BBA0B9
	ADC #$0023				;$BBA0BC
	CMP sprite.x_position,x			;$BBA0BF
	BCC CODE_BBA0D0				;$BBA0C1
	CMP sprite.unknown_54,x			;$BBA0C3
	BCC CODE_BBA0CC				;$BBA0C5
	BEQ CODE_BBA0CC				;$BBA0C7
	INC sprite.x_position,x			;$BBA0C9
	RTL					;$BBA0CB

CODE_BBA0CC:
	STA sprite.x_position,x			;$BBA0CC
	STZ sprite.x_speed,x			;$BBA0CE
CODE_BBA0D0:
	RTL					;$BBA0D0

CODE_BBA0D1:
	LDX #$FFFD				;$BBA0D1
	LDA level_number			;$BBA0D4
	BEQ CODE_BBA121				;$BBA0D6
	SEP #$20				;$BBA0D8
	DEC					;$BBA0DA
CODE_BBA0DB:
	INX					;$BBA0DB
	INX					;$BBA0DC
	INX					;$BBA0DD
	CMP.l DATA_BBB7BC,x			;$BBA0DE
	BCS CODE_BBA0DB				;$BBA0E2
	EOR #$FF				;$BBA0E4
	ADC.l DATA_BBB7BC,x			;$BBA0E6
	REP #$20				;$BBA0EA
	BNE CODE_BBA121				;$BBA0EC
	LDA.l DATA_BBB7BC+$02,x			;$BBA0EE
	AND #$00FF				;$BBA0F2
	STA $0505				;$BBA0F5
	LDA.l DATA_BBB7BC+$01,x			;$BBA0F8
	AND #$00FF				;$BBA0FC
	ASL					;$BBA0FF
	TAX					;$BBA100
	LDA.l DATA_BBB831,x			;$BBA101
	STA $0513				;$BBA105
	LDA $0505				;$BBA108
	ASL					;$BBA10B
	TAX					;$BBA10C
	LDA.l DATA_BBB7B2,x			;$BBA10D
	STA $0515				;$BBA111
	JMP (DATA_BBA117,x)			;$BBA114

DATA_BBA117:
	dw CODE_BBA12E
	dw CODE_BBA12E
	dw CODE_BBA12E
	dw CODE_BBA12E
	dw CODE_BBA13E

CODE_BBA121:
	LDA #$8000				;$BBA121
	STA water_level				;$BBA124
	STZ $050B				;$BBA127
	STZ $050D				;$BBA12A
	RTS					;$BBA12D

CODE_BBA12E:
	LDA $0513				;$BBA12E
	STA water_level				;$BBA131
	JSR CODE_BBA154				;$BBA134
	STZ $0507				;$BBA137
	STZ $050D				;$BBA13A
	RTS					;$BBA13D

CODE_BBA13E:
	LDA $0513				;$BBA13E
	STA water_level				;$BBA141
	JSR CODE_BBA154				;$BBA144
	LDA #$FF80				;$BBA147
	STA $0507				;$BBA14A
	LDA #$FFFE				;$BBA14D
	STA $0509				;$BBA150
	RTS					;$BBA153

CODE_BBA154:
	LDX #$7E9882				;$BBA154
	LDY.w #$7E9882>>16			;$BBA157
	LDA #$0050				;$BBA15A
	JSL CODE_808030				;$BBA15D
	STZ $18AB				;$BBA161
	LDX #$188D				;$BBA164
	JSR CODE_BB9507				;$BBA167
	LDA #$00E0				;$BBA16A
	STA DMA[$00].size			;$BBA16D
	LDA $18AB				;$BBA170
	ASL					;$BBA173
	ASL					;$BBA174
	ASL					;$BBA175
	ASL					;$BBA176
	STA.l PPU.vram_address			;$BBA177
	LDA.l DATA_C00000+$04			;$BBA17B
	STA.l DMA[$00].source_word		;$BBA17F
	SEP #$20				;$BBA183
	LDA.l DATA_C00000+$06			;$BBA185
	STA.l DMA[$00].source_bank		;$BBA189
	LDA.b #PPU.vram_write_low		;$BBA18D
	STA.w DMA[$00].destination		;$BBA18F
	LDA #$01				;$BBA192
	STA.l DMA[$00].control			;$BBA194
	STA.l CPU.enable_dma			;$BBA198
	REP #$20				;$BBA19C
	RTS					;$BBA19E

CODE_BBA19F:
	LDA $05AF				;$BBA19F
	AND #$8000				;$BBA1A2
	STA $044A				;$BBA1A5
	BPL CODE_BBA1AB				;$BBA1A8
	RTL					;$BBA1AA

CODE_BBA1AB:
	LDA $075C				;$BBA1AB
	CMP #$0002				;$BBA1AE
	BEQ CODE_BBA1F1				;$BBA1B1
	CMP #$0006				;$BBA1B3
	BEQ CODE_BBA1F2				;$BBA1B6
	CMP #$0001				;$BBA1B8
	BNE CODE_BBA1EC				;$BBA1BB
	LDA $0765				;$BBA1BD
	AND #$003F				;$BBA1C0
	CMP $044C				;$BBA1C3
	STA $044C				;$BBA1C6
	BEQ CODE_BBA1D0				;$BBA1C9
	LDA #$0000				;$BBA1CB
	BRA CODE_BBA1E4				;$BBA1CE

CODE_BBA1D0:
	LDA $05B7				;$BBA1D0
	BEQ CODE_BBA1E4				;$BBA1D3
	LDA $044E				;$BBA1D5
	CLC					;$BBA1D8
	ADC #$0040				;$BBA1D9
	CMP #$0100				;$BBA1DC
	BCC CODE_BBA1E4				;$BBA1DF
	LDA #$0040				;$BBA1E1
CODE_BBA1E4:
	STA $044E				;$BBA1E4
	ORA $044C				;$BBA1E7
	BRA CODE_BBA1F3				;$BBA1EA

CODE_BBA1EC:
	LDA $0765				;$BBA1EC
	BRA CODE_BBA1F3				;$BBA1EF

CODE_BBA1F1:
	RTL					;$BBA1F1

CODE_BBA1F2:
	RTL					;$BBA1F2

CODE_BBA1F3:
	STA $3E					;$BBA1F3
	AND #$00FF				;$BBA1F5
	ASL					;$BBA1F8
	ASL					;$BBA1F9
	SEP #$20				;$BBA1FA
	LDA $3E					;$BBA1FC
	AND #$3F				;$BBA1FE
	CMP $08					;$BBA200
	REP #$20				;$BBA202
	BEQ CODE_BBA20B				;$BBA204
	JSL CODE_B2800C				;$BBA206
	RTL					;$BBA20A

CODE_BBA20B:
	XBA					;$BBA20B
	JSL CODE_B2800F				;$BBA20C
	RTL					;$BBA210

CODE_BBA211:
	PHK					;$BBA211
	PLB					;$BBA212
	BIT $05AF				;$BBA213
	BPL CODE_BBA222				;$BBA216
	LDA #CODE_80803F			;$BBA218
	LDX.w #CODE_80803F>>16			;$BBA21B
	JML CODE_808003				;$BBA21E

CODE_BBA222:
	LDA $05B7				;$BBA222
	XBA					;$BBA225
	ORA level_number			;$BBA226
	JSL CODE_BB97AE				;$BBA228
	LDA $195B				;$BBA22C
	INC					;$BBA22F
	BEQ CODE_BBA26D				;$BBA230
	INC					;$BBA232
	BEQ CODE_BBA250				;$BBA233
	LDA $075C				;$BBA235
	AND #$0007				;$BBA238
	ASL					;$BBA23B
	TAX					;$BBA23C
	JMP (DATA_BBA240,x)			;$BBA23D

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
	STZ $05B7				;$BBA250
	STZ kong_letter_flags			;$BBA253
	STZ current_animal_type			;$BBA256
	STZ current_mount			;$BBA258
	STZ parry_index				;$BBA25A
	LDA #CODE_808362			;$BBA25C
	STA $4A					;$BBA25F
	STA $4C					;$BBA261
	LDA #CODE_B48009			;$BBA263
	LDX.w #CODE_B48009>>16			;$BBA266
	JML CODE_808003				;$BBA269

CODE_BBA26D:
	STZ $05B7				;$BBA26D
	STZ kong_letter_flags			;$BBA270
	LDA lives_count				;$BBA273
	BPL CODE_BBA299				;$BBA276
	LDX #$000C				;$BBA278
CODE_BBA27B:
	STZ $05BB,x				;$BBA27B
	DEX					;$BBA27E
	DEX					;$BBA27F
	BPL CODE_BBA27B				;$BBA280
	LDA #$0006				;$BBA282
	STA $05E3				;$BBA285
	LDA #CODE_808362			;$BBA288
	STA $4A					;$BBA28B
	STA $4C					;$BBA28D
	LDA #CODE_B48000			;$BBA28F
	LDX.w #CODE_B48000>>16			;$BBA292
	JML CODE_808003				;$BBA295

CODE_BBA299:
	LDA current_game_mode			;$BBA299
	BEQ CODE_BBA2B1				;$BBA29C
	CMP #!gamemode_2_player_team		;$BBA29E
	BNE CODE_BBA2AB				;$BBA2A1
	EOR current_kong			;$BBA2A3
	STA current_kong			;$BBA2A6
	BRA CODE_BBA2B1				;$BBA2A9

CODE_BBA2AB:
	LDA #$2000				;$BBA2AB
	TSB $05FB				;$BBA2AE
CODE_BBA2B1:
	STZ current_animal_type			;$BBA2B1
	STZ current_mount			;$BBA2B3
	STZ parry_index				;$BBA2B5
	LDA #CODE_808362			;$BBA2B7
	STA $4A					;$BBA2BA
	STA $4C					;$BBA2BC
	LDA #CODE_B48009			;$BBA2BE
	LDX.w #CODE_B48009>>16			;$BBA2C1
	JML CODE_808003				;$BBA2C4

CODE_BBA2C8:
	LDA $195B				;$BBA2C8
	BEQ CODE_BBA32A				;$BBA2CB
	LDA $0536				;$BBA2CD
	STA $0539				;$BBA2D0
	LDA $0535				;$BBA2D3
	STA $0538				;$BBA2D6
	JSR CODE_BBAD9E				;$BBA2D9
	LDA $195B				;$BBA2DC
	STA $04EA				;$BBA2DF
	DEC					;$BBA2E2
	ASL					;$BBA2E3
	TAX					;$BBA2E4
	LDA $0786,x				;$BBA2E5
	AND #$00FF				;$BBA2E8
	STA $04E8				;$BBA2EB
	LDA level_number			;$BBA2EE
	STA $04E6				;$BBA2F0
	LDA $0785,x				;$BBA2F3
	AND #$00FF				;$BBA2F6
	STA level_number			;$BBA2F9
	STZ $05B7				;$BBA2FB
	LDA $195B				;$BBA2FE
	CMP #$0004				;$BBA301
	BCC CODE_BBA320				;$BBA304
	CMP #$0080				;$BBA306
	BCC CODE_BBA316				;$BBA309
	AND #$007F				;$BBA30B
	STA $05B7				;$BBA30E
	LDA $04E6				;$BBA311
	STA level_number			;$BBA314
CODE_BBA316:
	LDA #CODE_808493			;$BBA316
	LDX.w #CODE_808493>>16			;$BBA319
	JML CODE_808003				;$BBA31C

CODE_BBA320:
	LDA #CODE_B29578			;$BBA320
	LDX.w #CODE_B29578>>16			;$BBA323
	JML CODE_808003				;$BBA326

CODE_BBA32A:
	STZ kong_letter_flags			;$BBA32A
	STZ $05B7				;$BBA32D
	STZ $05BB				;$BBA330
	STZ $05BD				;$BBA333
	STZ $05BF				;$BBA336
	STZ $05C1				;$BBA339
	STZ $05C3				;$BBA33C
	STZ $05C5				;$BBA33F
	STZ $05C7				;$BBA342
	STZ current_animal_type			;$BBA345
	STZ $80					;$BBA347
	STZ parry_index				;$BBA349
	LDA level_number			;$BBA34B
	CMP #!level_kastle_kaos			;$BBA34D
	BEQ CODE_BBA3A3				;$BBA350
	LDA map_node_number			;$BBA352
	ORA #$8000				;$BBA355
	STA map_node_number			;$BBA358
	LDA #CODE_808362			;$BBA35B
	STA $4A					;$BBA35E
	STA $4C					;$BBA360
	LDA #CODE_B48009			;$BBA362
	LDX.w #CODE_B48009>>16			;$BBA365
	JML CODE_808003				;$BBA368

CODE_BBA36C:
	LDA $04EA				;$BBA36C
	CMP #$0005				;$BBA36F
	BEQ CODE_BBA32A				;$BBA372
	LDA #$0080				;$BBA374
	TSB $05AF				;$BBA377
	LDA $18F1				;$BBA37A
	BPL CODE_BBA38B				;$BBA37D
	AND #$7FFF				;$BBA37F
	STA banana_count			;$BBA382
	STA hud_current_banana_count		;$BBA385
	STA hud_final_banana_count		;$BBA388
CODE_BBA38B:
	LDA $04E6				;$BBA38B
	STA level_number			;$BBA38E
	LDA $04E8				;$BBA390
	STA $05B7				;$BBA393
	STZ $04EA				;$BBA396
	LDA #CODE_808493			;$BBA399
	LDX.w #CODE_808493>>16			;$BBA39C
	JML CODE_808003				;$BBA39F

CODE_BBA3A3:
	LDA #$0002				;$BBA3A3
	TSB $0655				;$BBA3A6
	LDA #$4000				;$BBA3A9
	TSB $061D				;$BBA3AC
	PHP					;$BBA3AF
	JSL CODE_80802A				;$BBA3B0
	LDY #CODE_808051			;$BBA3B4
	LDX.w #CODE_808051>>16			;$BBA3B7
	PLP					;$BBA3BA
	BNE CODE_BBA3CB				;$BBA3BB
	LDA current_game_mode			;$BBA3BD
	CMP #!gamemode_2_player_contest		;$BBA3C0
	BNE CODE_BBA3CB				;$BBA3C3
	LDY #CODE_808084			;$BBA3C5
	LDX.w #CODE_808084>>16			;$BBA3C8
CODE_BBA3CB:
	STY $4E					;$BBA3CB
	STX $50					;$BBA3CD
	LDA #CODE_808348			;$BBA3CF
	JML CODE_80803C				;$BBA3D2

CODE_BBA3D6:
	JSL CODE_B38009				;$BBA3D6
	LDX.w #$7F9FFE				;$BBA3DA
	LDA #$0000				;$BBA3DD
CODE_BBA3E0:
	STA $7F0000,x				;$BBA3E0
	DEX					;$BBA3E4
	DEX					;$BBA3E5
	BNE CODE_BBA3E0				;$BBA3E6
	STA $7F0000,x				;$BBA3E8
	LDX #$017E				;$BBA3EC
	LDA #$0000				;$BBA3EF
CODE_BBA3F2:
	STA $15FE,x				;$BBA3F2
	DEX					;$BBA3F5
	DEX					;$BBA3F6
	BPL CODE_BBA3F2				;$BBA3F7
	LDX #$01FE				;$BBA3F9
	LDA #$0000				;$BBA3FC
CODE_BBA3FF:
	STA $7E6580,x				;$BBA3FF
	DEX					;$BBA403
	DEX					;$BBA404
	BPL CODE_BBA3FF				;$BBA405
	LDA #$0004				;$BBA407
	STA $7F0000				;$BBA40A
	LDA #$0001				;$BBA40E
	STA $00177E				;$BBA411
	PHB					;$BBA415
	%pea_shift_dbr(DATA_FE0000)		;$BBA416
	PLB					;$BBA419
	PLB					;$BBA41A
	LDA level_number			;$BBA41B
	ASL					;$BBA41D
	TAY					;$BBA41E
	LDA.w DATA_FE0000,y			;$BBA41F
	BEQ CODE_BBA477				;$BBA422
	TAY					;$BBA424
	BRA CODE_BBA467				;$BBA425

CODE_BBA427:
	AND #$00F0				;$BBA427
	STA $1A					;$BBA42A
	LDA.w (DATA_FE0400&$FF0000)+$02,y	;$BBA42C
	SEC					;$BBA42F
	SBC #$0100				;$BBA430
	STA $0015EE				;$BBA433
	LDA.w (DATA_FE0400&$FF0000)+$04,y	;$BBA437
	SEC					;$BBA43A
	SBC #$0100				;$BBA43B
	STA $0015F4				;$BBA43E
	PHB					;$BBA442
	PHY					;$BBA443
	JSR CODE_BBA47A				;$BBA444
	PLY					;$BBA447
	PLB					;$BBA448
	LDA.w DATA_FE0400&$FF0000,y		;$BBA449
	AND #$1F00				;$BBA44C
	BEQ CODE_BBA458				;$BBA44F
	PHB					;$BBA451
	PHY					;$BBA452
	JSR CODE_BBA581				;$BBA453
	PLY					;$BBA456
	PLB					;$BBA457
CODE_BBA458:
	LDA $00177E				;$BBA458
	INC					;$BBA45C
	STA $00177E				;$BBA45D
	TYA					;$BBA461
	CLC					;$BBA462
	ADC #$0008				;$BBA463
	TAY					;$BBA466
CODE_BBA467:
	LDA.w DATA_FE0400&$FF0000,y		;$BBA467
	AND #$00FF				;$BBA46A
	BNE CODE_BBA427				;$BBA46D
	JSR CODE_BBA604				;$BBA46F
	JSR CODE_BBA59B				;$BBA472
	PLB					;$BBA475
	RTS					;$BBA476

CODE_BBA477:
	PLB					;$BBA477
	RTS					;$BBA478

CODE_BBA479:
	RTS					;$BBA479

CODE_BBA47A:
	%pea_shift_dbr(DATA_BBA8BE)		;$BBA47A
	PLB					;$BBA47D
	PLB					;$BBA47E
	LDX $1A					;$BBA47F
	STZ $15F0				;$BBA481
	LDA $15EE				;$BBA484
	SEC					;$BBA487
	SBC #$0100				;$BBA488
	SEC					;$BBA48B
	SBC.l DATA_BBA8BE,x			;$BBA48C
	BPL CODE_BBA495				;$BBA490
	LDA #$0000				;$BBA492
CODE_BBA495:
	STA $1E					;$BBA495
	AND #$FF00				;$BBA497
	XBA					;$BBA49A
	CMP $15FA				;$BBA49B
	BCS CODE_BBA479				;$BBA49E
	STA $15F0				;$BBA4A0
	LDA $1E					;$BBA4A3
	CLC					;$BBA4A5
	ADC.l DATA_BBA8BE+$02,x			;$BBA4A6
	AND #$FF00				;$BBA4AA
	XBA					;$BBA4AD
	CMP $15FA				;$BBA4AE
	BCC CODE_BBA4B7				;$BBA4B1
	LDA $15FA				;$BBA4B3
	DEC					;$BBA4B6
CODE_BBA4B7:
	STA $15F2				;$BBA4B7
	STZ $15F6				;$BBA4BA
	LDA $15F4				;$BBA4BD
	SEC					;$BBA4C0
	SBC #$00E0				;$BBA4C1
	SEC					;$BBA4C4
	SBC.l DATA_BBA8BE+$04,x			;$BBA4C5
	BPL CODE_BBA4CE				;$BBA4C9
	LDA #$0000				;$BBA4CB
CODE_BBA4CE:
	STA $1E					;$BBA4CE
	AND #$FF00				;$BBA4D0
	XBA					;$BBA4D3
	CMP $15FC				;$BBA4D4
	BCS CODE_BBA479				;$BBA4D7
	STA $15F6				;$BBA4D9
	LDA $1E					;$BBA4DC
	CLC					;$BBA4DE
	ADC.l DATA_BBA8BE+$06			;$BBA4DF
	AND #$FF00				;$BBA4E3
	XBA					;$BBA4E6
	CMP $15FC				;$BBA4E7
	BCC CODE_BBA4F0				;$BBA4EA
	LDA $15FC				;$BBA4EC
	DEC					;$BBA4EF
CODE_BBA4F0:
	STA $15F8				;$BBA4F0
	LDA $15F0				;$BBA4F3
	STA $15EE				;$BBA4F6
	LDA $15F6				;$BBA4F9
	STA $15F4				;$BBA4FC
	BRA.b CODE_BBA50F			;$BBA4FF

CODE_BBA501:
	INC $15F4				;$BBA501
	LDA $15F0				;$BBA504
	STA $15EE				;$BBA507
	BRA CODE_BBA50F				;$BBA50A

CODE_BBA50C:
	INC $15EE				;$BBA50C
CODE_BBA50F:
	JSR CODE_BBA523				;$BBA50F
	LDA $15EE				;$BBA512
	CMP $15F2				;$BBA515
	BNE CODE_BBA50C				;$BBA518
	LDA $15F4				;$BBA51A
	CMP $15F8				;$BBA51D
	BNE CODE_BBA501				;$BBA520
	RTS					;$BBA522

CODE_BBA523:
	LDA $15F4				;$BBA523
	XBA					;$BBA526
	ORA $15FA				;$BBA527
	STA CPU.multiply_A			;$BBA52A
	LDA CPU.multiply_result			;$BBA52D
	LDA CPU.multiply_result			;$BBA530
	LDA CPU.multiply_result			;$BBA533
	CLC					;$BBA536
	ADC $15EE				;$BBA537
	ASL					;$BBA53A
	TAX					;$BBA53B
	LDA $15FE,x				;$BBA53C
	BEQ CODE_BBA560				;$BBA53F
CODE_BBA541:
	TAX					;$BBA541
	LDA $7F0000,x				;$BBA542
	BNE CODE_BBA541				;$BBA546
	LDA $7F0000				;$BBA548
	STA $7F0000,x				;$BBA54C
	CLC					;$BBA550
	ADC #$0004				;$BBA551
	STA $7F0000				;$BBA554
	LDA $177E				;$BBA558
	STA $7F0002,x				;$BBA55B
	RTS					;$BBA55F

CODE_BBA560:
	LDA $7F0000				;$BBA560
	STA $15FE,x				;$BBA564
	TAX					;$BBA567
	LDA $177E				;$BBA568
	STA $7F0002,x				;$BBA56B
	TXA					;$BBA56F
	CLC					;$BBA570
	ADC #$0004				;$BBA571
	STA $7F0000,x				;$BBA574
	CLC					;$BBA578
	ADC #$0004				;$BBA579
	STA $7F0000				;$BBA57C
	RTS					;$BBA580

CODE_BBA581:
	XBA					;$BBA581
	DEC					;$BBA582
	ASL					;$BBA583
	ASL					;$BBA584
	ASL					;$BBA585
	ASL					;$BBA586
	TAX					;$BBA587
	BRA CODE_BBA58C				;$BBA588

CODE_BBA58A:
	INX					;$BBA58A
	INX					;$BBA58B
CODE_BBA58C:
	LDA $7E6580,x				;$BBA58C
	BNE CODE_BBA58A				;$BBA590
	LDA $00177E				;$BBA592
	STA $7E6580,x				;$BBA596
	RTS					;$BBA59A

CODE_BBA59B:
	PHB					;$BBA59B
	%pea_shift_dbr($7E4180)			;$BBA59C
	PLB					;$BBA59F
	PLB					;$BBA5A0
	LDA $7E4180				;$BBA5A1
	CLC					;$BBA5A5
	ADC #$4180				;$BBA5A6
	STA $001780				;$BBA5A9
	STA $1A					;$BBA5AD
	CLC					;$BBA5AF
	ADC #$0040				;$BBA5B0
	STA $1C					;$BBA5B3
	LDX #$0000				;$BBA5B5
CODE_BBA5B8:
	PHX					;$BBA5B8
	TXA					;$BBA5B9
	ASL					;$BBA5BA
	ASL					;$BBA5BB
	ASL					;$BBA5BC
	ASL					;$BBA5BD
	TAX					;$BBA5BE
	LDA $7E6580,x				;$BBA5BF
	BNE CODE_BBA5E1				;$BBA5C3
	LDA #$0000				;$BBA5C5
	STA ($1A)				;$BBA5C8
CODE_BBA5CA:
	INC $1A					;$BBA5CA
	INC $1A					;$BBA5CC
	PLX					;$BBA5CE
	INX					;$BBA5CF
	CPX #$0020				;$BBA5D0
	BNE CODE_BBA5B8				;$BBA5D3
	LDA $1C					;$BBA5D5
	SEC					;$BBA5D7
	SBC #$4180				;$BBA5D8
	STA $7E4180				;$BBA5DB
	PLB					;$BBA5DF
	RTS					;$BBA5E0

CODE_BBA5E1:
	LDA $1C					;$BBA5E1
	STA ($1A)				;$BBA5E3
	LDY #$0008				;$BBA5E5
CODE_BBA5E8:
	LDA $7E6580,x				;$BBA5E8
	BEQ CODE_BBA5F9				;$BBA5EC
	STA ($1C)				;$BBA5EE
	INC $1C					;$BBA5F0
	INC $1C					;$BBA5F2
	INX					;$BBA5F4
	INX					;$BBA5F5
	DEY					;$BBA5F6
	BNE CODE_BBA5E8				;$BBA5F7
CODE_BBA5F9:
	LDA #$0000				;$BBA5F9
	STA ($1C)				;$BBA5FC
	INC $1C					;$BBA5FE
	INC $1C					;$BBA600
	BRA CODE_BBA5CA				;$BBA602

CODE_BBA604:
	PHB					;$BBA604
	%pea_shift_dbr($7E4180)			;$BBA605
	PLB					;$BBA608
	PLB					;$BBA609
	LDX #$1FFE				;$BBA60A
	LDA #$0000				;$BBA60D
CODE_BBA610:
	STA.w $7E4180,x				;$BBA610
	DEX					;$BBA613
	DEX					;$BBA614
	BPL CODE_BBA610				;$BBA615
	LDY #$0002				;$BBA617
	LDX #$017E				;$BBA61A
CODE_BBA61D:
	LDA $0015FE,x				;$BBA61D
	BEQ CODE_BBA63C				;$BBA621
	PHX					;$BBA623
	PHA					;$BBA624
	TYA					;$BBA625
	STA $0015FE,x				;$BBA626
	PLA					;$BBA62A
CODE_BBA62B:
	TAX					;$BBA62B
	LDA $7F0002,x				;$BBA62C
	STA.w $7E4180,y				;$BBA630
	INY					;$BBA633
	INY					;$BBA634
	LDA $7F0000,x				;$BBA635
	BNE CODE_BBA62B				;$BBA639
	PLX					;$BBA63B
CODE_BBA63C:
	DEX					;$BBA63C
	DEX					;$BBA63D
	BPL CODE_BBA61D				;$BBA63E
	TYA					;$BBA640
	STA $7E4180				;$BBA641
	PLB					;$BBA645
	RTS					;$BBA646

CODE_BBA647:
	PHB					;$BBA647
	LDA level_number			;$BBA648
	ASL					;$BBA64A
	TAX					;$BBA64B
	LDA.l DATA_FE0000,x			;$BBA64C
	BEQ CODE_BBA6A1				;$BBA650
	STA $0000EA				;$BBA652
	INC					;$BBA656
	INC					;$BBA657
	STA $0000EC				;$BBA658
	INC					;$BBA65C
	INC					;$BBA65D
	STA $0000EE				;$BBA65E
	INC					;$BBA662
	INC					;$BBA663
	STA $0000F0				;$BBA664
	LDA $196D				;$BBA668
	XBA					;$BBA66B
	AND #$00FF				;$BBA66C
	DEC					;$BBA66F
	BPL CODE_BBA673				;$BBA670
	INC					;$BBA672
CODE_BBA673:
	STA $1A					;$BBA673
	LDA $1973				;$BBA675
	AND #$FF00				;$BBA678
	SEC					;$BBA67B
	SBC #$0100				;$BBA67C
	BPL CODE_BBA685				;$BBA67F
	CLC					;$BBA681
	ADC #$0100				;$BBA682
CODE_BBA685:
	ORA $15FA				;$BBA685
	STA CPU.multiply_A			;$BBA688
	LDA CPU.multiply_result			;$BBA68B
	LDA CPU.multiply_result			;$BBA68E
	CLC					;$BBA691
	ADC $1A					;$BBA692
	ASL					;$BBA694
	TAX					;$BBA695
	LDA $15FE,x				;$BBA696
	%pea_shift_dbr(DATA_FE0000)		;$BBA699
	PLB					;$BBA69C
	PLB					;$BBA69D
	TAX					;$BBA69E
	BNE CODE_BBA6AA				;$BBA69F
CODE_BBA6A1:
	PLB					;$BBA6A1
	RTL					;$BBA6A2

CODE_BBA6A3:
	PHX					;$BBA6A3
	JSR CODE_BBA6B2				;$BBA6A4
	PLX					;$BBA6A7
	INX					;$BBA6A8
	INX					;$BBA6A9
CODE_BBA6AA:
	LDA $7E4180,x				;$BBA6AA
	BNE CODE_BBA6A3				;$BBA6AE
	BRA CODE_BBA6A1				;$BBA6B0

CODE_BBA6B2:
	STA $0000F2				;$BBA6B2
	DEC					;$BBA6B6
	ASL					;$BBA6B7
	TAX					;$BBA6B8
	ASL					;$BBA6B9
	ASL					;$BBA6BA
	TAY					;$BBA6BB
	LDA ($EA),y				;$BBA6BC
	AND #$1F00				;$BBA6BE
	BEQ CODE_BBA6CB				;$BBA6C1
	STA $1A					;$BBA6C3
	LDA $7E6180,x				;$BBA6C5
	BPL CODE_BBA6EB				;$BBA6C9
CODE_BBA6CB:
	LDA $7E6180,x				;$BBA6CB
	STA $001782				;$BBA6CF
	AND #$3FFF				;$BBA6D3
	BEQ CODE_BBA6D9				;$BBA6D6
	RTS					;$BBA6D8

CODE_BBA6D9:
	LDA ($EA),y				;$BBA6D9
	AND #$000F				;$BBA6DB
	ASL					;$BBA6DE
	TAX					;$BBA6DF
	PHX					;$BBA6E0
	JSR (DATA_BBA93E,x)			;$BBA6E1
	PLX					;$BBA6E4
	BCS CODE_BBA6E8				;$BBA6E5
	RTS					;$BBA6E7

CODE_BBA6E8:
	JMP (DATA_BBA992,x)			;$BBA6E8

CODE_BBA6EB:
	LDA $7E6180,x				;$BBA6EB
	STA $001782				;$BBA6EF
	LDA $1A					;$BBA6F3
	XBA					;$BBA6F5
	DEC					;$BBA6F6
	ASL					;$BBA6F7
	TAX					;$BBA6F8
	LDA $001786,x				;$BBA6F9
	BEQ CODE_BBA700				;$BBA6FD
	RTS					;$BBA6FF

CODE_BBA700:
	LDA ($EA),y				;$BBA700
	AND #$000F				;$BBA702
	ASL					;$BBA705
	TAX					;$BBA706
	JSR (DATA_BBA93E,x)			;$BBA707
	BCS CODE_BBA70D				;$BBA70A
	RTS					;$BBA70C

CODE_BBA70D:
	TYA					;$BBA70D
	STA $001784				;$BBA70E
	JSR CODE_BB8F8B				;$BBA712
	BCC CODE_BBA718				;$BBA715
	RTS					;$BBA717

CODE_BBA718:
	LDY #$000E				;$BBA718
	JSL CODE_BB8FDD				;$BBA71B
	LDA $00059B				;$BBA71F
	AND #$0100				;$BBA723
	BEQ CODE_BBA730				;$BBA726
	LDX alternate_sprite			;$BBA728
	LDA #$0134				;$BBA72A
	JSR CODE_BBB884				;$BBA72D
CODE_BBA730:
	LDX alternate_sprite			;$BBA730
	LDA $001784				;$BBA732
	TAY					;$BBA736
	LDA ($EA),y				;$BBA737
	STA sprite.placement_parameter,x	;$BBA739
	AND #$1F00				;$BBA73B
	XBA					;$BBA73E
	STA sprite.general_purpose_5C,x		;$BBA73F
	DEC					;$BBA741
	ASL					;$BBA742
	TAX					;$BBA743
	LDA alternate_sprite			;$BBA744
	STA $001786,x				;$BBA746
	TXA					;$BBA74A
	CLC					;$BBA74B
	ADC $001780				;$BBA74C
	TAX					;$BBA750
	LDA $7E0000,x				;$BBA751
	TAX					;$BBA755
	BRA CODE_BBA77F				;$BBA756

CODE_BBA758:
	PHX					;$BBA758
	PHB					;$BBA759
	STA $0000F2				;$BBA75A
	DEC					;$BBA75E
	ASL					;$BBA75F
	TAX					;$BBA760
	ASL					;$BBA761
	ASL					;$BBA762
	TAY					;$BBA763
	LDA $7E6180,x				;$BBA764
	STA $001782				;$BBA768
	AND #$3FFF				;$BBA76C
	BNE CODE_BBA77B				;$BBA76F
	LDA ($EA),y				;$BBA771
	AND #$000F				;$BBA773
	ASL					;$BBA776
	TAX					;$BBA777
	JSR (DATA_BBA992,x)			;$BBA778
CODE_BBA77B:
	PLB					;$BBA77B
	PLX					;$BBA77C
	INX					;$BBA77D
	INX					;$BBA77E
CODE_BBA77F:
	LDA $7E0000,x				;$BBA77F
	BNE CODE_BBA758				;$BBA783
	RTS					;$BBA785

CODE_BBA786:
	PHY					;$BBA786
	PHB					;$BBA787
	PHK					;$BBA788
	PLB					;$BBA789
	JSR CODE_BB8F8B				;$BBA78A
	PLB					;$BBA78D
	PLY					;$BBA78E
	BCS CODE_BBA7E5				;$BBA78F
	LDX alternate_sprite			;$BBA791
	LDA ($EC),y				;$BBA793
	STA sprite.x_position,x			;$BBA795
	LDA ($EE),y				;$BBA797
	STA sprite.y_position,x			;$BBA799
	LDA #$00EC				;$BBA79B
	STA sprite.render_order,x		;$BBA79E
	LDA #$8000				;$BBA7A0
	STA sprite.x_sub_position,x		;$BBA7A3
	STA sprite.y_sub_position,x		;$BBA7A5
	STZ sprite.slip_velocity,x		;$BBA7A7
	STZ sprite.carry_or_defeated_flags,x	;$BBA7A9
	STZ sprite.interaction_flags,x		;$BBA7AB
	STZ sprite.terrain_interaction,x	;$BBA7AD
	STZ sprite.offscreen_despawn_time,x	;$BBA7AF
	STZ sprite.constants_address,x		;$BBA7B1
	LDA ($EA),y				;$BBA7B3
	STA sprite.placement_parameter,x	;$BBA7B5
	LDA ($F0),y				;$BBA7B7
	TAX					;$BBA7B9
	LDA.l DATA_FF0040,x			;$BBA7BA
	TAY					;$BBA7BE
	LDX alternate_sprite			;$BBA7BF
	JSL apply_spawn_script_to_slot_direct	;$BBA7C1
	LDX alternate_sprite			;$BBA7C5
	LDA $0000F2				;$BBA7C7
	STA sprite.placement_number,x		;$BBA7CB
	DEC					;$BBA7CD
	ASL					;$BBA7CE
	STA $1A					;$BBA7CF
	TXA					;$BBA7D1
	LDX $1A					;$BBA7D2
	EOR $7E6180,x				;$BBA7D4
	AND #$1FFF				;$BBA7D8
	EOR $7E6180,x				;$BBA7DB
	STA $7E6180,x				;$BBA7DF
	CLC					;$BBA7E3
	RTS					;$BBA7E4

CODE_BBA7E5:
	SEC					;$BBA7E5
	RTS					;$BBA7E6

CODE_BBA7E7:
	PHY					;$BBA7E7
	PHB					;$BBA7E8
	PHK					;$BBA7E9
	PLB					;$BBA7EA
	JSR CODE_BB8F8B				;$BBA7EB
	PLB					;$BBA7EE
	PLY					;$BBA7EF
	BCS CODE_BBA851				;$BBA7F0
	LDA ($EC),y				;$BBA7F2
	STA sprite.x_position,x			;$BBA7F4
	LDA ($EE),y				;$BBA7F6
	STA sprite.y_position,x			;$BBA7F8
	LDA #$00EC				;$BBA7FA
	STA sprite.render_order,x		;$BBA7FD
	LDA #$8000				;$BBA7FF
	STA sprite.x_sub_position,x		;$BBA802
	STA sprite.y_sub_position,x		;$BBA804
	LDA #$C000				;$BBA806
	STA sprite.visibility,x			;$BBA809
	STZ sprite.sprite_graphic,x		;$BBA80B
	STZ sprite.last_rendered_graphic,x	;$BBA80D
	STZ sprite.slip_velocity,x		;$BBA80F
	STZ sprite.carry_or_defeated_flags,x	;$BBA811
	STZ sprite.interaction_flags,x		;$BBA813
	STZ sprite.terrain_interaction,x	;$BBA815
	STZ sprite.offscreen_despawn_time,x	;$BBA817
	STZ sprite.visibility,x			;$BBA819
	STZ sprite.constants_address,x		;$BBA81B
	STZ sprite.oam_property,x		;$BBA81D
	LDA ($EA),y				;$BBA81F
	STA sprite.placement_parameter,x	;$BBA821
	LDA ($F0),y				;$BBA823
	TAX					;$BBA825
	LDA.l DATA_FF0040,x			;$BBA826
	TAY					;$BBA82A
	LDX alternate_sprite			;$BBA82B
	JSL apply_spawn_script_to_slot_direct	;$BBA82D
	LDX alternate_sprite			;$BBA831
	LDA $0000F2				;$BBA833
	STA sprite.placement_number,x		;$BBA837
	DEC					;$BBA839
	ASL					;$BBA83A
	STA $1A					;$BBA83B
	TXA					;$BBA83D
	LDX $1A					;$BBA83E
	EOR $7E6180,x				;$BBA840
	AND #$1FFF				;$BBA844
	EOR $7E6180,x				;$BBA847
	STA $7E6180,x				;$BBA84B
	CLC					;$BBA84F
	RTS					;$BBA850

CODE_BBA851:
	SEC					;$BBA851
	RTS					;$BBA852

CODE_BBA853:
	LDA #$0002				;$BBA853
	PHY					;$BBA856
	PHB					;$BBA857
	PHK					;$BBA858
	PLB					;$BBA859
	JSR CODE_BB8FC8				;$BBA85A
	BRA CODE_BBA866				;$BBA85D

CODE_BBA85F:
	PHY					;$BBA85F
	PHB					;$BBA860
	PHK					;$BBA861
	PLB					;$BBA862
	JSR CODE_BB8F78				;$BBA863
CODE_BBA866:
	PLB					;$BBA866
	PLY					;$BBA867
	BCS CODE_BBA8BC				;$BBA868
	LDA ($EC),y				;$BBA86A
	STA sprite.x_position,x			;$BBA86C
	LDA ($EE),y				;$BBA86E
	STA sprite.y_position,x			;$BBA870
	LDA #$00EC				;$BBA872
	STA sprite.render_order,x		;$BBA875
	LDA #$8000				;$BBA877
	STA sprite.x_sub_position,x		;$BBA87A
	STA sprite.y_sub_position,x		;$BBA87C
	STZ sprite.slip_velocity,x		;$BBA87E
	STZ sprite.carry_or_defeated_flags,x	;$BBA880
	STZ sprite.interaction_flags,x		;$BBA882
	STZ sprite.terrain_interaction,x	;$BBA884
	STZ sprite.offscreen_despawn_time,x	;$BBA886
	STZ sprite.constants_address,x		;$BBA888
	LDA ($EA),y				;$BBA88A
	STA sprite.placement_parameter,x	;$BBA88C
	LDA ($F0),y				;$BBA88E
	TAX					;$BBA890
	LDA.l DATA_FF0040,x			;$BBA891
	TAY					;$BBA895
	LDX alternate_sprite			;$BBA896
	JSL apply_spawn_script_to_slot_direct	;$BBA898
	LDX alternate_sprite			;$BBA89C
	LDA $0000F2				;$BBA89E
	STA sprite.placement_number,x		;$BBA8A2
	DEC					;$BBA8A4
	ASL					;$BBA8A5
	STA $1A					;$BBA8A6
	TXA					;$BBA8A8
	LDX $1A					;$BBA8A9
	EOR $7E6180,x				;$BBA8AB
	AND #$1FFF				;$BBA8AF
	EOR $7E6180,x				;$BBA8B2
	STA $7E6180,x				;$BBA8B6
	CLC					;$BBA8BA
	RTS					;$BBA8BB

CODE_BBA8BC:
	SEC					;$BBA8BC
	RTS					;$BBA8BD

DATA_BBA8BE:
	dw $0020, $0140, $0020, $0140
	dw $0028, $0150, $0028, $0150
	dw $0010, $0120, $0010, $0100
	dw $0018, $0130, $0018, $0110
	dw $0060, $01C0, $0040, $0180
	dw $0068, $01D0, $0048, $0190
	dw $0020, $0140, $0040, $0180
	dw $0028, $0150, $0048, $0190
	dw $0020, $0140, $00F8, $02D0
	dw $0028, $0150, $0100, $02E0
	dw $00F8, $02F0, $00F8, $02D0
	dw $0100, $0300, $0100, $02E0
	dw $00F8, $02F0, $0020, $0140
	dw $0100, $0300, $0028, $0150
	dw $0040, $01A0, $0020, $0120
	dw $0048, $01B0, $0028, $0130

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
	CLC					;$BBA9AC
	RTS					;$BBA9AD

CODE_BBA9AE:
	LDA ($EC),y				;$BBA9AE
	STA $88					;$BBA9B0
	LDA ($EE),y				;$BBA9B2
	STA $8A					;$BBA9B4
	LDA ($EA),y				;$BBA9B6
	AND #$00F0				;$BBA9B8
	TAX					;$BBA9BB
	JMP CODE_BBAAD4				;$BBA9BC

CODE_BBA9BF:
	LDA #$0001				;$BBA9BF
	AND $00194F				;$BBA9C2
	BNE CODE_BBA9AE				;$BBA9C6
CODE_BBA9C8:
	CLC					;$BBA9C8
	RTS					;$BBA9C9

CODE_BBA9CA:
	LDA.l active_cheats			;$BBA9CA
	BIT #$8000				;$BBA9CE
	BNE CODE_BBA9C8				;$BBA9D1
	AND #$4000				;$BBA9D3
	BNE CODE_BBA9AE				;$BBA9D6
	BRA CODE_BBA9C8				;$BBA9D8

CODE_BBA9DA:
	LDA.l active_cheats			;$BBA9DA
	AND #$8000				;$BBA9DE
	BEQ CODE_BBA9AE				;$BBA9E1
	BRA CODE_BBA9C8				;$BBA9E3

CODE_BBA9E5:
	LDA.l active_cheats			;$BBA9E5
	AND #$8000				;$BBA9E9
	BNE CODE_BBA9AE				;$BBA9EC
	BRA CODE_BBA9C8				;$BBA9EE

CODE_BBA9F0:
	LDA.l active_cheats			;$BBA9F0
	AND #$0080				;$BBA9F4
	BEQ CODE_BBA9AE				;$BBA9F7
	BRA CODE_BBA9C8				;$BBA9F9

CODE_BBA9FB:
	LDA.l active_cheats			;$BBA9FB
	AND #$0080				;$BBA9FF
	BNE CODE_BBA9AE				;$BBAA02
	BRA CODE_BBA9C8				;$BBAA04

CODE_BBAA06:
	TYX					;$BBAA06
	LDA sprite.x_position,x			;$BBAA07
	STA $88					;$BBAA09
	LDA sprite.y_position,x			;$BBAA0B
	STA $8A					;$BBAA0D
	LDA sprite.placement_parameter,x	;$BBAA0F
	AND #$00F0				;$BBAA11
	CLC					;$BBAA14
	ADC #$0008				;$BBAA15
	TAX					;$BBAA18
	JMP CODE_BBAAD4				;$BBAA19

CODE_BBAA1C:
	TYX					;$BBAA1C
	LDA sprite.x_position,x			;$BBAA1D
	STA $88					;$BBAA1F
	LDA sprite.y_position,x			;$BBAA21
	STA $8A					;$BBAA23
	LDA #$0050				;$BBAA25
	TAX					;$BBAA28
	JMP CODE_BBAAD4				;$BBAA29

CODE_BBAA2C:
	JSR CODE_BBAA06				;$BBAA2C
	BCC CODE_BBAA32				;$BBAA2F
	RTS					;$BBAA31

CODE_BBAA32:
	TYX					;$BBAA32
	LDA sprite.placement_number,x		;$BBAA33
	DEC					;$BBAA35
	ASL					;$BBAA36
	ASL					;$BBAA37
	ASL					;$BBAA38
	TAY					;$BBAA39
	PHB					;$BBAA3A
	%pea_shift_dbr(DATA_FE0000)		;$BBAA3B
	PLB					;$BBAA3E
	PLB					;$BBAA3F
	LDA ($EC),y				;$BBAA40
	STA $88					;$BBAA42
	LDA ($EE),y				;$BBAA44
	STA $8A					;$BBAA46
	PLB					;$BBAA48
	TXY					;$BBAA49
	LDA sprite.placement_parameter,x	;$BBAA4A
	AND #$00F0				;$BBAA4C
	TAX					;$BBAA4F
	JMP CODE_BBAAD4				;$BBAA50

CODE_BBAA53:
	LDA.w sprite.x_position,y		;$BBAA53
	STA $88					;$BBAA56
	LDA.w sprite.y_position,y		;$BBAA58
	STA $8A					;$BBAA5B
	LDX #$0008				;$BBAA5D
	JSR CODE_BBAAD4				;$BBAA60
	BCC CODE_BBAA66				;$BBAA63
	RTS					;$BBAA65

CODE_BBAA66:
	LDA.w sprite.placement_parameter+1,y	;$BBAA66
	AND #$00FF				;$BBAA69
	ASL					;$BBAA6C
	TAX					;$BBAA6D
	LDA.l sprite_slots_table,x		;$BBAA6E
	TAX					;$BBAA72
	LDA sprite.offscreen_despawn_time,x	;$BBAA73
	BEQ CODE_BBAAC0				;$BBAA75
	LDA sprite.unknown_2C,x			;$BBAA77
	AND #$00FF				;$BBAA79
	ASL					;$BBAA7C
	ASL					;$BBAA7D
	ASL					;$BBAA7E
	EOR #$FFFF				;$BBAA7F
	SEC					;$BBAA82
	ADC sprite.x_position,x			;$BBAA83
	BMI CODE_BBAA8C				;$BBAA85
	CMP.w sprite.x_position,y		;$BBAA87
	BCS CODE_BBAAC0				;$BBAA8A
CODE_BBAA8C:
	LDA sprite.unknown_2C+1,x		;$BBAA8C
	AND #$00FF				;$BBAA8E
	ASL					;$BBAA91
	ASL					;$BBAA92
	ASL					;$BBAA93
	ADC sprite.x_position,x			;$BBAA94
	CMP.w sprite.x_position,y		;$BBAA96
	BCC CODE_BBAAC0				;$BBAA99
	LDA sprite.unknown_32,x			;$BBAA9B
	AND #$00FF				;$BBAA9D
	ASL					;$BBAAA0
	ASL					;$BBAAA1
	ASL					;$BBAAA2
	EOR #$FFFF				;$BBAAA3
	SEC					;$BBAAA6
	ADC sprite.y_position,x			;$BBAAA7
	BMI CODE_BBAAB0				;$BBAAA9
	CMP.w sprite.y_position,y		;$BBAAAB
	BCS CODE_BBAAC0				;$BBAAAE
CODE_BBAAB0:
	LDA sprite.unknown_32+1,x		;$BBAAB0
	AND #$00FF				;$BBAAB2
	ASL					;$BBAAB5
	ASL					;$BBAAB6
	ASL					;$BBAAB7
	ADC sprite.y_position,x			;$BBAAB8
	CMP.w sprite.y_position,y		;$BBAABA
	BCC CODE_BBAAC0				;$BBAABD
	RTS					;$BBAABF

CODE_BBAAC0:
	TYA					;$BBAAC0
	LDY #$0003				;$BBAAC1
CODE_BBAAC4:
	CMP sprite.general_purpose_4C,x		;$BBAAC4
	BEQ CODE_BBAACF				;$BBAAC6
	INX					;$BBAAC8
	INX					;$BBAAC9
	DEY					;$BBAACA
	BPL CODE_BBAAC4				;$BBAACB
	BRA CODE_BBAAD1				;$BBAACD

CODE_BBAACF:
	STZ sprite.general_purpose_4C,x		;$BBAACF
CODE_BBAAD1:
	TAY					;$BBAAD1
	CLC					;$BBAAD2
	RTS					;$BBAAD3

CODE_BBAAD4:
	LDA $00196D				;$BBAAD4
	SEC					;$BBAAD8
	SBC.l DATA_BBA8BE,x			;$BBAAD9
	CMP $88					;$BBAADD
	BCS CODE_BBAB02				;$BBAADF
	CLC					;$BBAAE1
	ADC.l DATA_BBA8BE+$02,x			;$BBAAE2
	CMP $88					;$BBAAE6
	BCC CODE_BBAB02				;$BBAAE8
	LDA $001973				;$BBAAEA
	SEC					;$BBAAEE
	SBC.l DATA_BBA8BE+$04,x			;$BBAAEF
	CMP $8A					;$BBAAF3
	BCS CODE_BBAB02				;$BBAAF5
	CLC					;$BBAAF7
	ADC.l DATA_BBA8BE+$06,x			;$BBAAF8
	CMP $8A					;$BBAAFC
	BCC CODE_BBAB02				;$BBAAFE
	SEC					;$BBAB00
	RTS					;$BBAB01

CODE_BBAB02:
	CLC					;$BBAB02
	RTS					;$BBAB03

CODE_BBAB04:
	LDX current_sprite			;$BBAB04
	LDA sprite.placement_number,x		;$BBAB06
	BEQ CODE_BBAB23				;$BBAB08
	LDA sprite.placement_parameter,x	;$BBAB0A
	AND #$1F00				;$BBAB0C
	BEQ CODE_BBAB13				;$BBAB0F
	CLC					;$BBAB11
	RTL					;$BBAB12

CODE_BBAB13:
	LDA sprite.placement_number,x		;$BBAB13
	DEC					;$BBAB15
	ASL					;$BBAB16
	TAX					;$BBAB17
	LDA $7E6180,x				;$BBAB18
	AND #$E000				;$BBAB1C
	STA $7E6180,x				;$BBAB1F
CODE_BBAB23:
	JSL delete_sprite_handle_dealloc_direct ;$BBAB23
	SEC					;$BBAB27
	RTL					;$BBAB28

CODE_BBAB29:
	JSR CODE_BBAB2D				;$BBAB29
	RTL					;$BBAB2C

CODE_BBAB2D:
	LDY current_sprite			;$BBAB2D
	LDX #$000A				;$BBAB2F
	JSR (DATA_BBA958,x)			;$BBAB32
	BCC CODE_BBAB39				;$BBAB35
	CLC					;$BBAB37
	RTS					;$BBAB38

CODE_BBAB39:
	SEC					;$BBAB39
	RTS					;$BBAB3A

CODE_BBAB3B:
	LDY current_sprite			;$BBAB3B
	JSR CODE_BBAA2C				;$BBAB3D
	BCC CODE_BBAB44				;$BBAB40
	CLC					;$BBAB42
	RTL					;$BBAB43

CODE_BBAB44:
	SEC					;$BBAB44
	RTL					;$BBAB45

CODE_BBAB46:
	JSR CODE_BBAB2D				;$BBAB46
	BCS CODE_BBAB4C				;$BBAB49
	RTL					;$BBAB4B

CODE_BBAB4C:
	JSL delete_sprite_handle_dealloc_direct	;$BBAB4C
	SEC					;$BBAB50
	RTL					;$BBAB51

CODE_BBAB52:
	LDX current_sprite			;$BBAB52
	LDA sprite.placement_number,x		;$BBAB54
	BNE .placed_by_level			;$BBAB56 / If the current sprite was spawned by the level
	TXY					;$BBAB58
	LDA sprite.placement_parameter,x	;$BBAB59
	AND #$000F				;$BBAB5B
	ASL					;$BBAB5E
	TAX					;$BBAB5F
	JSR (DATA_BBA958,x)			;$BBAB60
	BCC .offscreen				;$BBAB63
	TYX					;$BBAB65
	LDA sprite.offscreen_despawn_time,x	;$BBAB66
	BNE .onscreen_reset_despawn_timer	;$BBAB68
	CLC					;$BBAB6A
	RTL					;$BBAB6B

.offscreen:
	TYX					;$BBAB6C
	LDA sprite.offscreen_despawn_time,x	;$BBAB6D
	SEC					;$BBAB6F
	SBC #$0100				;$BBAB70
	BCC .delete_sprite			;$BBAB73
	STA sprite.offscreen_despawn_time,x	;$BBAB75
	CLC					;$BBAB77
	RTL					;$BBAB78

.delete_sprite:
	JSL delete_sprite_handle_dealloc_direct	;$BBAB79
	SEC					;$BBAB7D
	RTL					;$BBAB7E

.placed_by_level:
	TXY					;$BBAB7F
	LDA sprite.placement_parameter,x	;$BBAB80
	AND #$1F00				;$BBAB82
	BNE .grouped_sprite			;$BBAB85 / If sprite is in a spawn group
.CODE_BBAB87:
	LDA sprite.placement_parameter,x	;$BBAB87
	AND #$000F				;$BBAB89
	ASL					;$BBAB8C
	TAX					;$BBAB8D
	JSR (DATA_BBA958,x)			;$BBAB8E
	BCC .offscreen_placed_by_level		;$BBAB91
	TYX					;$BBAB93
	LDA sprite.offscreen_despawn_time,x	;$BBAB94
	BNE .onscreen_reset_despawn_timer	;$BBAB96
	CLC					;$BBAB98
	RTL					;$BBAB99

.onscreen_reset_despawn_timer:
	SEP #$20				;$BBAB9A
	STA sprite.offscreen_despawn_time+1,x	;$BBAB9C
	REP #$20				;$BBAB9E
	CLC					;$BBABA0
	RTL					;$BBABA1

.offscreen_placed_by_level:
	TYX					;$BBABA2
	LDA sprite.offscreen_despawn_time,x	;$BBABA3
	SEC					;$BBABA5
	SBC #$0100				;$BBABA6
	BCC .CODE_BBABC1			;$BBABA9
	STA sprite.offscreen_despawn_time,x	;$BBABAB
	CLC					;$BBABAD
	RTL					;$BBABAE

.grouped_sprite:
	LDA sprite.placement_number,x		;$BBABAF
	BMI .CODE_BBABBF			;$BBABB1
	DEC					;$BBABB3
	ASL					;$BBABB4
	TAX					;$BBABB5
	LDA $7E6180,x				;$BBABB6
	ASL					;$BBABBA
	TYX					;$BBABBB
	BCS .CODE_BBAB87			;$BBABBC
	RTL					;$BBABBE

.CODE_BBABBF:
	CLC					;$BBABBF
	RTL					;$BBABC0

.CODE_BBABC1:
	LDA sprite.placement_parameter,x	;$BBABC1
	AND #$000F				;$BBABC3
	ASL					;$BBABC6
	TAX					;$BBABC7
	JSR (DATA_BBA978,x)			;$BBABC8
	BCS .CODE_BBABE4			;$BBABCB
	TYX					;$BBABCD
	LDA sprite.placement_number,x		;$BBABCE
	DEC					;$BBABD0
	ASL					;$BBABD1
	TAX					;$BBABD2
	LDA $7E6180,x				;$BBABD3
	AND #$E000				;$BBABD7
	STA $7E6180,x				;$BBABDA
	JSL delete_sprite_handle_dealloc_direct	;$BBABDE
	SEC					;$BBABE2
	RTL					;$BBABE3

.CODE_BBABE4:
	JSL delete_sprite_handle_dealloc_direct	;$BBABE4
	LDX current_sprite			;$BBABE8
	LDA #!sprite_respawn_suppressor		;$BBABEA
	JSR CODE_BBB884				;$BBABED
	STZ sprite.sprite_graphic,x		;$BBABF0
	STZ sprite.last_rendered_graphic,x	;$BBABF2
	STZ sprite.x_position,x			;$BBABF4
	STZ sprite.y_position,x			;$BBABF6
	STZ sprite.state,x			;$BBABF8
	SEC					;$BBABFA
	RTL					;$BBABFB

respawn_suppressor_main:
	LDY current_sprite			;$BBABFC
	LDA.w sprite.state,y			;$BBABFE
	BEQ CODE_BBAC0A				;$BBAC01
	TYX					;$BBAC03
	DEC sprite.general_purpose_5C,x		;$BBAC04
	BNE CODE_BBAC2D				;$BBAC06
	STZ sprite.state,x			;$BBAC08
CODE_BBAC0A:
	LDA.w sprite.placement_parameter,y	;$BBAC0A
	AND #$000F				;$BBAC0D
	ASL					;$BBAC10
	TAX					;$BBAC11
	JSR (DATA_BBA978,x)			;$BBAC12
	BCS CODE_BBAC2D				;$BBAC15
	LDX current_sprite			;$BBAC17
	LDA sprite.placement_number,x		;$BBAC19
	DEC					;$BBAC1B
	ASL					;$BBAC1C
	TAX					;$BBAC1D
	LDA $7E6180,x				;$BBAC1E
	AND #$E000				;$BBAC22
	STA $7E6180,x				;$BBAC25
	JSL delete_sprite_no_dealloc_direct	;$BBAC29
CODE_BBAC2D:
	JML [$04F5]				;$BBAC2D

CODE_BBAC30:
	LDX current_sprite			;$BBAC30
	LDA sprite.general_purpose_5C,x		;$BBAC32
	DEC					;$BBAC34
	ASL					;$BBAC35
	CLC					;$BBAC36
	ADC $001780				;$BBAC37
	TAX					;$BBAC3B
	LDA $7E0000,x				;$BBAC3C
	TAX					;$BBAC40
	STA $1782				;$BBAC41
	BRL CODE_BBACC7				;$BBAC44

CODE_BBAC47:
	LDX current_sprite			;$BBAC47
	LDA sprite.general_purpose_5C,x		;$BBAC49
	DEC					;$BBAC4B
	ASL					;$BBAC4C
	CLC					;$BBAC4D
	ADC $001780				;$BBAC4E
	TAX					;$BBAC52
	LDA $7E0000,x				;$BBAC53
	TAX					;$BBAC57
	STA $1782				;$BBAC58
	LDA $059B				;$BBAC5B
	AND #$0100				;$BBAC5E
	BNE CODE_BBAC65				;$BBAC61
CODE_BBAC63:
	BRA CODE_BBAC94				;$BBAC63

CODE_BBAC65:
	LDY current_sprite			;$BBAC65
	LDA.w sprite.type,y			;$BBAC67
	CMP #!sprite_spawn_group_manager 	;$BBAC6A
	BNE CODE_BBACC7				;$BBAC6D
	BRA CODE_BBAC63				;$BBAC6F

CODE_BBAC71:
	PHX					;$BBAC71
	DEC					;$BBAC72
	ASL					;$BBAC73
	TAX					;$BBAC74
	ASL					;$BBAC75
	ASL					;$BBAC76
	TAY					;$BBAC77
	LDA $7E6180,x				;$BBAC78
	BMI CODE_BBAC91				;$BBAC7C
	AND #$1FFF				;$BBAC7E
	TAY					;$BBAC81
	LDA.w sprite.placement_parameter,y	;$BBAC82
	AND #$000F				;$BBAC85
	ASL					;$BBAC88
	TAX					;$BBAC89
	JSR (DATA_BBA958,x)			;$BBAC8A
	BCC CODE_BBAC91				;$BBAC8D
	PLX					;$BBAC8F
	RTL					;$BBAC90

CODE_BBAC91:
	PLX					;$BBAC91
	INX					;$BBAC92
	INX					;$BBAC93
CODE_BBAC94:
	LDA $7E0000,x				;$BBAC94
	BNE CODE_BBAC71				;$BBAC98
	LDA $1782				;$BBAC9A
	TAX					;$BBAC9D
	BRA CODE_BBACC1				;$BBAC9E

CODE_BBACA0:
	PHX					;$BBACA0
	DEC					;$BBACA1
	ASL					;$BBACA2
	TAX					;$BBACA3
	ASL					;$BBACA4
	ASL					;$BBACA5
	TAY					;$BBACA6
	LDA $7E6180,x				;$BBACA7
	BMI CODE_BBACBE				;$BBACAB
	AND #$1FFF				;$BBACAD
	TAY					;$BBACB0
	LDA.w sprite.placement_parameter,y	;$BBACB1
	AND #$000F				;$BBACB4
	ASL					;$BBACB7
	TAX					;$BBACB8
	JSR (DATA_BBA978,x)			;$BBACB9
	BCS CODE_BBAD13				;$BBACBC
CODE_BBACBE:
	PLX					;$BBACBE
	INX					;$BBACBF
	INX					;$BBACC0
CODE_BBACC1:
	LDA $7E0000,x				;$BBACC1
	BNE CODE_BBACA0				;$BBACC5
CODE_BBACC7:
	LDA $1782				;$BBACC7
	TAX					;$BBACCA
	LDA current_sprite			;$BBACCB
	PHA					;$BBACCD
	BRA CODE_BBACF8				;$BBACCE

CODE_BBACD0:
	PHX					;$BBACD0
	DEC					;$BBACD1
	ASL					;$BBACD2
	TAX					;$BBACD3
	LDA $7E6180,x				;$BBACD4
	BMI CODE_BBACF5				;$BBACD8
	AND #$1FFF				;$BBACDA
	STA current_sprite			;$BBACDD
	BEQ CODE_BBACF5				;$BBACDF
	TAY					;$BBACE1
	TDC					;$BBACE2
	STA.w sprite.placement_parameter,y	;$BBACE3
	LDA $7E6180,x				;$BBACE6
	AND #$E000				;$BBACEA
	STA $7E6180,x				;$BBACED
	JSL delete_sprite_handle_dealloc_direct	;$BBACF1
CODE_BBACF5:
	PLX					;$BBACF5
	INX					;$BBACF6
	INX					;$BBACF7
CODE_BBACF8:
	LDA $7E0000,x				;$BBACF8
	BNE CODE_BBACD0				;$BBACFC
	PLX					;$BBACFE
	STX current_sprite			;$BBACFF
	STZ sprite.placement_parameter,x	;$BBAD01
	LDA sprite.general_purpose_5C,x		;$BBAD03
	DEC					;$BBAD05
	ASL					;$BBAD06
	TAX					;$BBAD07
	LDA #$0000				;$BBAD08
	STA $001786,x				;$BBAD0B
	JML delete_sprite_no_dealloc_direct	;$BBAD0F

CODE_BBAD13:
	PLX					;$BBAD13
	RTL					;$BBAD14

CODE_BBAD15:
	LDX current_sprite			;$BBAD15
	LDA sprite.placement_number,x		;$BBAD17
	BEQ CODE_BBAD37				;$BBAD19
	LDA sprite.placement_parameter,x	;$BBAD1B
	AND #$1F00				;$BBAD1D
	BEQ CODE_BBAD36				;$BBAD20
	EOR sprite.placement_parameter,x	;$BBAD22
	STA sprite.placement_parameter,x	;$BBAD24
	LDA sprite.placement_number,x		;$BBAD26
	DEC					;$BBAD28
	ASL					;$BBAD29
	TAX					;$BBAD2A
	LDA $7E6180,x				;$BBAD2B
	ORA #$8000				;$BBAD2F
	STA $7E6180,x				;$BBAD32
CODE_BBAD36:
	RTL					;$BBAD36

CODE_BBAD37:
	LDA sprite.placement_parameter,x	;$BBAD37
	AND #$000F				;$BBAD39
	CMP #$000F				;$BBAD3C
	BEQ CODE_BBAD46				;$BBAD3F
	EOR sprite.placement_parameter,x	;$BBAD41
	STA sprite.placement_parameter,x	;$BBAD43
	RTL					;$BBAD45

CODE_BBAD46:
	EOR sprite.placement_parameter,x	;$BBAD46
	STZ sprite.placement_parameter,x	;$BBAD48
	XBA					;$BBAD4A
	ASL					;$BBAD4B
	TAX					;$BBAD4C
	LDA.l sprite_slots_table,x		;$BBAD4D
	TAX					;$BBAD51
	LDA current_sprite			;$BBAD52
	LDY #$0004				;$BBAD54
CODE_BBAD57:
	CMP sprite.general_purpose_4C,x		;$BBAD57
	BEQ CODE_BBAD61				;$BBAD59
	INX					;$BBAD5B
	INX					;$BBAD5C
	DEY					;$BBAD5D
	BPL CODE_BBAD57				;$BBAD5E
	RTL					;$BBAD60

CODE_BBAD61:
	STZ sprite.general_purpose_4C,x		;$BBAD61
	RTL					;$BBAD63

sprite_slots_table:
	dw aux_sprite_slot
	dw dixie_sprite_slot
	dw kiddy_sprite_slot
	dw $0954
	dw $09C2
	dw $0A30
	dw $0A9E
	dw $0B0C
	dw $0B7A
	dw $0BE8
	dw $0C56
	dw $0CC4
	dw $0D32
	dw $0DA0
	dw $0E0E
	dw $0E7C
	dw $0EEA
	dw $0F58
	dw $0FC6
	dw $1034
	dw $10A2
	dw $1110
	dw $117E
	dw $11EC
	dw $125A
	dw $12C8
	dw $1336
	dw $13A4
	dw $1412

CODE_BBAD9E:
	LDX #$03FE				;$BBAD9E
CODE_BBADA1:
	LDA $7E6180,x				;$BBADA1
	AND #$E000				;$BBADA5
	STA $7E2500,x				;$BBADA8
	DEX					;$BBADAC
	DEX					;$BBADAD
	BPL CODE_BBADA1				;$BBADAE
	RTS					;$BBADB0

CODE_BBADB1:
	LDX #$03FE				;$BBADB1
CODE_BBADB4:
	LDA $7E2500,x				;$BBADB4
	STA $7E6180,x				;$BBADB8
	DEX					;$BBADBC
	DEX					;$BBADBD
	BPL CODE_BBADB4				;$BBADBE
	RTS					;$BBADC0

CODE_BBADC1:
	LDX current_sprite			;$BBADC1
	LDA sprite.placement_number,x		;$BBADC3
	DEC					;$BBADC5
	ASL					;$BBADC6
	TAX					;$BBADC7
	LDA $7E6180,x				;$BBADC8
	ORA #$2000				;$BBADCC
	STA $7E6180,x				;$BBADCF
	RTL					;$BBADD3

CODE_BBADD4:
	LDA #$0003				;$BBADD4
	BRA CODE_BBADDC				;$BBADD7

CODE_BBADD9:
	LDA #$0001				;$BBADD9
CODE_BBADDC:
	JSL request_palette_direct_global	;$BBADDC
	DEC sprite_palette_reference_count,x	;$BBADE0
	AND #$0E00				;$BBADE3
	ORA #$3000				;$BBADE6
	STA $40					;$BBADE9
	LDA $B6					;$BBADEB
	AND #$0E00				;$BBADED
	ORA #$3000				;$BBADF0
	STA $3E					;$BBADF3
	JSR CODE_BBB16C				;$BBADF5
	JSR CODE_BBB2B1				;$BBADF8
	JSR CODE_BBB069				;$BBADFB
	JSR CODE_BBAE1F				;$BBADFE
	JSR CODE_BBAF26				;$BBAE01
	LDA active_frame_counter		;$BBAE04
	AND #$0010				;$BBAE06
	BNE CODE_BBAE15				;$BBAE09
	JSR CODE_BBB155				;$BBAE0B
	JSR CODE_BBB3A0				;$BBAE0E
	JSR CODE_BBB35E				;$BBAE11
	RTL					;$BBAE14

CODE_BBAE15:
	JSR CODE_BBB3A0				;$BBAE15
	JSR CODE_BBB155				;$BBAE18
	JSR CODE_BBB35E				;$BBAE1B
	RTL					;$BBAE1E

CODE_BBAE1F:
	LDA $18E9				;$BBAE1F
	BNE CODE_BBAE25				;$BBAE22
	RTS					;$BBAE24

CODE_BBAE25:
	LDA $18EB				;$BBAE25
	BEQ CODE_BBAE42				;$BBAE28
	LDA #$0100				;$BBAE2A
	DEC $18EB				;$BBAE2D
	BEQ CODE_BBAE36				;$BBAE30
	ASL					;$BBAE32
	DEC $18EB				;$BBAE33
CODE_BBAE36:
	CLC					;$BBAE36
	ADC $18E9				;$BBAE37
	BCC CODE_BBAE3F				;$BBAE3A
	LDA #$FFFF				;$BBAE3C
CODE_BBAE3F:
	STA $18E9				;$BBAE3F
CODE_BBAE42:
	LDY next_oam_slot			;$BBAE42
	LDA $18EB				;$BBAE44
	XBA					;$BBAE47
	CLC					;$BBAE48
	ADC $18E9				;$BBAE49
	BCS CODE_BBAE65				;$BBAE4C
	DEC					;$BBAE4E
	BEQ CODE_BBAE65				;$BBAE4F
	CMP #$3000				;$BBAE51
	BCS CODE_BBAE65				;$BBAE54
	CMP #$1800				;$BBAE56
	LDA #$0010				;$BBAE59
	BCS CODE_BBAE61				;$BBAE5C
	LDA #$0008				;$BBAE5E
CODE_BBAE61:
	AND active_frame_counter		;$BBAE61
	BNE CODE_BBAE91				;$BBAE63
CODE_BBAE65:
	LDA $18E9				;$BBAE65
	LSR					;$BBAE68
	AND #$FF00				;$BBAE69
	EOR #$FFFF				;$BBAE6C
	SEC					;$BBAE6F
	ADC #$BAE8				;$BBAE70
	STA $0000,y				;$BBAE73
	CLC					;$BBAE76
	ADC #$0008				;$BBAE77
	STA $0004,y				;$BBAE7A
	LDA #$01C9				;$BBAE7D
	ORA $3E					;$BBAE80
	STA $0002,y				;$BBAE82
	EOR #$4000				;$BBAE85
	STA $0006,y				;$BBAE88
	TYA					;$BBAE8B
	CLC					;$BBAE8C
	ADC #$0008				;$BBAE8D
	TAY					;$BBAE90
CODE_BBAE91:
	LDA #$35E8				;$BBAE91
	STA $0000,y				;$BBAE94
	LDA #$35F0				;$BBAE97
	STA $0004,y				;$BBAE9A
	LDA #$01C5				;$BBAE9D
	ORA $3E					;$BBAEA0
	STA $0002,y				;$BBAEA2
	INC					;$BBAEA5
	STA $0006,y				;$BBAEA6
	LDA #$C0E8				;$BBAEA9
	STA $0008,y				;$BBAEAC
	LDA #$C0F0				;$BBAEAF
	STA $000C,y				;$BBAEB2
	LDA #$01C7				;$BBAEB5
	ORA $3E					;$BBAEB8
	STA $000A,y				;$BBAEBA
	INC					;$BBAEBD
	STA $000E,y				;$BBAEBE
	TYA					;$BBAEC1
	CLC					;$BBAEC2
	ADC #$0010				;$BBAEC3
	TAY					;$BBAEC6
	LDA active_frame_counter		;$BBAEC7
	AND #$0007				;$BBAEC9
	BNE CODE_BBAED8				;$BBAECC
	LDA $18ED				;$BBAECE
	CLC					;$BBAED1
	ADC #$0800				;$BBAED2
	STA $18ED				;$BBAED5
CODE_BBAED8:
	LDA active_frame_counter		;$BBAED8
	AND #$0007				;$BBAEDA
	BEQ CODE_BBAF03				;$BBAEDD
	LDA $18ED				;$BBAEDF
	JSR CODE_BBAF06				;$BBAEE2
	LDA $18ED				;$BBAEE5
	SEC					;$BBAEE8
	SBC #$4000				;$BBAEE9
	JSR CODE_BBAF06				;$BBAEEC
	LDA $18ED				;$BBAEEF
	SEC					;$BBAEF2
	SBC #$8000				;$BBAEF3
	JSR CODE_BBAF06				;$BBAEF6
	LDA $18ED				;$BBAEF9
	SEC					;$BBAEFC
	SBC #$C000				;$BBAEFD
	JSR CODE_BBAF06				;$BBAF00
CODE_BBAF03:
	STY next_oam_slot			;$BBAF03
	RTS					;$BBAF05

CODE_BBAF06:
	CMP $18E9				;$BBAF06
	BCS CODE_BBAF03				;$BBAF09
	LSR					;$BBAF0B
	AND #$FF00				;$BBAF0C
	EOR #$FFFF				;$BBAF0F
	SEC					;$BBAF12
	ADC #$BCEC				;$BBAF13
	STA $0000,y				;$BBAF16
	LDA #$01C4				;$BBAF19
	ORA $3E					;$BBAF1C
	STA $0002,y				;$BBAF1E
	INY					;$BBAF21
	INY					;$BBAF22
	INY					;$BBAF23
	INY					;$BBAF24
	RTS					;$BBAF25

CODE_BBAF26:
	LDX $18E3				;$BBAF26
	BNE CODE_BBAF2C				;$BBAF29
	RTS					;$BBAF2B

CODE_BBAF2C:
	LDA $18E5				;$BBAF2C
	BMI CODE_BBAF50				;$BBAF2F
	BEQ CODE_BBAF56				;$BBAF31
	DEC $18E5				;$BBAF33
	LDA $0533				;$BBAF36
	CMP #$0001				;$BBAF39
	BEQ CODE_BBAF46				;$BBAF3C
	JSR CODE_BBAF98				;$BBAF3E
	JSR CODE_BBAFB8				;$BBAF41
	BRA CODE_BBAF56				;$BBAF44

CODE_BBAF46:
	JSR CODE_BBAFA8				;$BBAF46
	JSR CODE_BBAFB8				;$BBAF49
	JSR CODE_BBAFFF				;$BBAF4C
	RTS					;$BBAF4F

CODE_BBAF50:
	JSR CODE_BBAF98				;$BBAF50
	JSR CODE_BBAFC0				;$BBAF53
CODE_BBAF56:
	LDY next_oam_slot			;$BBAF56
	STZ $1A					;$BBAF58
	STZ $1C					;$BBAF5A
	LDA $64,x				;$BBAF5C
	JSR CODE_BBB042				;$BBAF5E
	LDA $0535				;$BBAF61
	JSR CODE_BBB042				;$BBAF64
	LDA #$000A				;$BBAF67
	JSR CODE_BBB045				;$BBAF6A
	INC $1A					;$BBAF6D
	INC $1A					;$BBAF6F
	INC $1A					;$BBAF71
	LDA $0536				;$BBAF73
	JSR CODE_BBB042				;$BBAF76
	LDA $0536				;$BBAF79
	LSR					;$BBAF7C
	LSR					;$BBAF7D
	LSR					;$BBAF7E
	LSR					;$BBAF7F
	JSR CODE_BBB042				;$BBAF80
	LDA #$000A				;$BBAF83
	JSR CODE_BBB045				;$BBAF86
	INC $1A					;$BBAF89
	INC $1A					;$BBAF8B
	INC $1A					;$BBAF8D
	LDA $0537				;$BBAF8F
	JSR CODE_BBB042				;$BBAF92
	STY next_oam_slot			;$BBAF95
	RTS					;$BBAF97

CODE_BBAF98:
	LDA #$0005				;$BBAF98
	STA $24					;$BBAF9B
	LDA #$0001				;$BBAF9D
	STA $26					;$BBAFA0
	LDA #$0001				;$BBAFA2
	STA $28					;$BBAFA5
	RTS					;$BBAFA7

CODE_BBAFA8:
	LDA #$0005				;$BBAFA8
	STA $24					;$BBAFAB
	LDA #$0003				;$BBAFAD
	STA $26					;$BBAFB0
	LDA #$0000				;$BBAFB2
	STA $28					;$BBAFB5
	RTS					;$BBAFB7

CODE_BBAFB8:
	LDA active_frame_counter		;$BBAFB8
	BIT #$0008				;$BBAFBA
	BEQ CODE_BBAFC0				;$BBAFBD
	RTS					;$BBAFBF

CODE_BBAFC0:
	LDY next_oam_slot			;$BBAFC0
	STZ $1A					;$BBAFC2
	LDA #$000A				;$BBAFC4
	STA $1C					;$BBAFC7
	LDA #$000E				;$BBAFC9
	JSR CODE_BBB042				;$BBAFCC
	LDA #$000D				;$BBAFCF
	JSR CODE_BBB042				;$BBAFD2
	LDA #$000B				;$BBAFD5
	JSR CODE_BBB045				;$BBAFD8
	INC $1A					;$BBAFDB
	INC $1A					;$BBAFDD
	INC $1A					;$BBAFDF
	LDA $24					;$BBAFE1
	JSR CODE_BBB042				;$BBAFE3
	LDA $26					;$BBAFE6
	JSR CODE_BBB042				;$BBAFE8
	LDA #$000A				;$BBAFEB
	JSR CODE_BBB045				;$BBAFEE
	INC $1A					;$BBAFF1
	INC $1A					;$BBAFF3
	INC $1A					;$BBAFF5
	LDA $28					;$BBAFF7
	JSR CODE_BBB042				;$BBAFF9
	STY next_oam_slot			;$BBAFFC
	RTS					;$BBAFFE

CODE_BBAFFF:
	LDY next_oam_slot			;$BBAFFF
	STZ $1A					;$BBB001
	STZ $1C					;$BBB003
	LDA #$0000				;$BBB005
	JSR CODE_BBB042				;$BBB008
	LDA $05C5				;$BBB00B
	JSR CODE_BBB042				;$BBB00E
	LDA #$000A				;$BBB011
	JSR CODE_BBB045				;$BBB014
	INC $1A					;$BBB017
	INC $1A					;$BBB019
	INC $1A					;$BBB01B
	LDA $05C6				;$BBB01D
	JSR CODE_BBB042				;$BBB020
	LDA $05C6				;$BBB023
	LSR					;$BBB026
	LSR					;$BBB027
	LSR					;$BBB028
	LSR					;$BBB029
	JSR CODE_BBB042				;$BBB02A
	LDA #$000A				;$BBB02D
	JSR CODE_BBB045				;$BBB030
	INC $1A					;$BBB033
	INC $1A					;$BBB035
	INC $1A					;$BBB037
	LDA $05C7				;$BBB039
	JSR CODE_BBB042				;$BBB03C
	STY next_oam_slot			;$BBB03F
	RTS					;$BBB041

CODE_BBB042:
	AND #$000F				;$BBB042
CODE_BBB045:
	ORA $1E,x				;$BBB045
	STA $0002,y				;$BBB047
	SEP #$20				;$BBB04A
	LDA $16,x				;$BBB04C
	SEC					;$BBB04E
	SBC $1C					;$BBB04F
	XBA					;$BBB051
	LDA $12,x				;$BBB052
	CLC					;$BBB054
	ADC $1A					;$BBB055
	REP #$20				;$BBB057
	STA $0000,y				;$BBB059
	INY					;$BBB05C
	INY					;$BBB05D
	INY					;$BBB05E
	INY					;$BBB05F
	LDA.b $1A				;$BBB060
	SEC					;$BBB062
	SBC.w #$0008				;$BBB063
	STA.b $1A				;$BBB066
	RTS					;$BBB068

CODE_BBB069:
	LDA current_animal_type			;$BBB069
	CMP #!sprite_ellie			;$BBB06B
	BNE CODE_BBB078				;$BBB06E
	LDA $0777				;$BBB070
	AND #$0020				;$BBB073
	BNE CODE_BBB079				;$BBB076
CODE_BBB078:
	RTS					;$BBB078

CODE_BBB079:
	LDX active_kong_sprite			;$BBB079
	LDA sprite.oam_property,x		;$BBB07C
	AND #$0E00				;$BBB07E
	ORA #$3000				;$BBB081
	STA $3A					;$BBB084
	LDA $1891				;$BBB086
	ASL					;$BBB089
	ASL					;$BBB08A
	ASL					;$BBB08B
	TAX					;$BBB08C
	LDY next_oam_slot			;$BBB08D
	LDA.l DATA_BBB0F1,x			;$BBB08F
	ORA $3A					;$BBB093
	STA $0002,y				;$BBB095
	ADC.l DATA_BBB0F1+$02,x			;$BBB098
	STA $0006,y				;$BBB09C
	CLC					;$BBB09F
	ADC.l DATA_BBB0F1+$04,x			;$BBB0A0
	STA $000A,y				;$BBB0A4
	CLC					;$BBB0A7
	ADC.l DATA_BBB0F1+$06,x			;$BBB0A8
	STA $000E,y				;$BBB0AC
	LDA #$01C9				;$BBB0AF
	ORA $3A					;$BBB0B2
	STA $0012,y				;$BBB0B4
	INC					;$BBB0B7
	STA $0016,y				;$BBB0B8
	INC					;$BBB0BB
	STA $001A,y				;$BBB0BC
	LDA #$CAD4				;$BBB0BF
	STA $0000,y				;$BBB0C2
	LDA #$CADC				;$BBB0C5
	STA $0004,y				;$BBB0C8
	LDA #$CAE4				;$BBB0CB
	STA $0008,y				;$BBB0CE
	LDA #$CAEC				;$BBB0D1
	STA $000C,y				;$BBB0D4
	LDA #$C6C8				;$BBB0D7
	STA $0010,y				;$BBB0DA
	LDA #$CEC7				;$BBB0DD
	STA $0014,y				;$BBB0E0
	LDA #$CEC9				;$BBB0E3
	STA $0018,y				;$BBB0E6
	TYA					;$BBB0E9
	CLC					;$BBB0EA
	ADC #$001C				;$BBB0EB
	STA next_oam_slot			;$BBB0EE
	RTS					;$BBB0F0

DATA_BBB0F1:
;(Found by Mattrizzle)
;Tile values for each state of Ellie's water meter
;The first 16-bit word in a row is the value of the first tile
;and the base value to use for all subsequent tiles in the row.
;The values that follow are relative to the previous value;
;e.g. in the second row, the values are $01C5, $01C6, $01C6 and
;$01C8, as:
;$01C5+$0001=$01C6
;$01C6+$0000=$01C6
;$01C6+$0002=$01C8
        dw $01C6, $0000, $0000, $0002      ;0/7 (Empty)
        dw $01C5, $0001, $0000, $0002      ;1/7
        dw $01C4, $0002, $0000, $0002      ;2/7
        dw $01C4, $0001, $0001, $0002      ;3/7
        dw $01C4, $0000, $0002, $0002      ;4/7
        dw $01C4, $0000, $0001, $0003      ;5/7
        dw $01C4, $0000, $0000, $0004      ;6/7
        dw $01C4, $0000, $0000, $0003      ;7/7 (Full)
;$BBB131
        dw $01C6, $0000, $0002            ;0/5 (Empty)
        dw $01C5, $0001, $0002            ;1/5
        dw $01C4, $0002, $0002            ;2/5
        dw $01C4, $0001, $0003            ;3/5
        dw $01C4, $0000, $0004            ;4/5
        dw $01C4, $0000, $0003            ;5/5 (Full)

CODE_BBB155:
	LDY $18E1				;$BBB155
	BEQ CODE_BBB16B				;$BBB158
	JSR CODE_BBB162				;$BBB15A
	LDX $18E1				;$BBB15D
	LDY $5C,x				;$BBB160
CODE_BBB162:
	LDX $12,y				;$BBB162
	LDA $0016,y				;$BBB164
	JSL CODE_B78015				;$BBB167
CODE_BBB16B:
	RTS					;$BBB16B

CODE_BBB16C:
	LDA hud_lives_display_timer		;$BBB16C
	BEQ CODE_BBB16B				;$BBB16F
	DEC					;$BBB171
	BNE CODE_BBB188				;$BBB172
	LDA $18DB				;$BBB174
	SEC					;$BBB177
	SBC #$0030				;$BBB178
	BCS CODE_BBB183				;$BBB17B
	LDA #$0000				;$BBB17D
	STA hud_lives_display_timer		;$BBB180
CODE_BBB183:
	STA $18DB				;$BBB183
	BRA CODE_BBB19B				;$BBB186

CODE_BBB188:
	LDA $18DB				;$BBB188
	CMP #$0180				;$BBB18B
	BCS CODE_BBB198				;$BBB18E
	ADC #$0030				;$BBB190
	STA $18DB				;$BBB193
	BRA CODE_BBB19B				;$BBB196

CODE_BBB198:
	DEC hud_lives_display_timer		;$BBB198
CODE_BBB19B:
	LDA.l DATA_B9B73D			;$BBB19B
	STA $18D7				;$BBB19F
	LDX #$1D40				;$BBB1A2
	LDA $18DB				;$BBB1A5
	CLC					;$BBB1A8
	ADC #$1000				;$BBB1A9
	TAY					;$BBB1AC
	LDA $40					;$BBB1AD
	JSR CODE_BBB261				;$BBB1AF
	LDA active_frame_counter		;$BBB1B2
	AND #$000F				;$BBB1B4
	BNE CODE_BBB21F				;$BBB1B7
	LDA hud_lives_to_add			;$BBB1B9
	AND #$00FF				;$BBB1BC
	STA $1A					;$BBB1BF
	LDA hud_lives_to_add+1			;$BBB1C1
	AND #$00FF				;$BBB1C4
	STA $1C					;$BBB1C7
	SEC					;$BBB1C9
	SBC $1A					;$BBB1CA
	CLC					;$BBB1CC
	ADC lives_count				;$BBB1CD
	CMP hud_lives_count			;$BBB1D0
	BCC CODE_BBB1D7				;$BBB1D3
	BNE CODE_BBB20F				;$BBB1D5
CODE_BBB1D7:
	LDA $1C					;$BBB1D7
	BEQ CODE_BBB21F				;$BBB1D9
	JSR CODE_BBB21F				;$BBB1DB
	LDA hud_lives_display_timer		;$BBB1DE
	CMP #$005A				;$BBB1E1
	BCS CODE_BBB20E				;$BBB1E4
	DEC hud_lives_display_timer-1		;$BBB1E6
	DEC hud_lives_count			;$BBB1E9
	LDA #$0716				;$BBB1EC
	JSL CODE_B28027				;$BBB1EF
	LDA $044A				;$BBB1F3
	PHA					;$BBB1F6
	STZ $044A				;$BBB1F7
	LDA #$0716				;$BBB1FA
	JSL CODE_B28018				;$BBB1FD
	PLA					;$BBB201
	STA $044A				;$BBB202
	STZ $18DB				;$BBB205
	LDA #$005A				;$BBB208
	STA hud_lives_display_timer		;$BBB20B
CODE_BBB20E:
	RTS					;$BBB20E

CODE_BBB20F:
	INC hud_lives_count			;$BBB20F
	LDA #$003C				;$BBB212
	STA hud_lives_display_timer		;$BBB215
	LDA #$0715				;$BBB218
	JSL queue_sound_effect			;$BBB21B
CODE_BBB21F:
	LDA hud_lives_count			;$BBB21F
	BMI CODE_BBB20E				;$BBB222
	CMP #$0063				;$BBB224
	BCC CODE_BBB22C				;$BBB227
	LDA #$0063				;$BBB229
CODE_BBB22C:
	STA CPU.dividen_low			;$BBB22C
	SEP #$20				;$BBB22F
	LDA #$0A				;$BBB231
	STA CPU.divisor				;$BBB233
	REP #$20				;$BBB236
	LDA $18DB				;$BBB238
	ASL					;$BBB23B
	ASL					;$BBB23C
	ASL					;$BBB23D
	ASL					;$BBB23E
	ADC #$F000				;$BBB23F
	AND #$FF00				;$BBB242
	STA $1A					;$BBB245
	LDA CPU.divide_result			;$BBB247
	BEQ CODE_BBB258				;$BBB24A
	LDX #$00DF				;$BBB24C
	JSR CODE_BBB285				;$BBB24F
	LDA CPU.divide_remainder		;$BBB252
	JMP CODE_BBB285				;$BBB255

CODE_BBB258:
	LDA CPU.divide_remainder		;$BBB258
	LDX #$00E4				;$BBB25B
	JMP CODE_BBB285				;$BBB25E

CODE_BBB261:
	ORA #$01C0				;$BBB261
	STA $0828				;$BBB264
	LDA $18D9				;$BBB267
	STA $082A				;$BBB26A
	LDA $18D7				;$BBB26D
	STA $082E				;$BBB270
	STZ $0830				;$BBB273
	TYA					;$BBB276
	LDY #aux_sprite_slot			;$BBB277
	JSL CODE_B78015				;$BBB27A
	LDA $082C				;$BBB27E
	STA $18D9				;$BBB281
	RTS					;$BBB284

CODE_BBB285:
	LDY next_oam_slot			;$BBB285
	CLC					;$BBB287
	ADC #$01CC				;$BBB288
	ORA $3E					;$BBB28B
	STA $0002,y				;$BBB28D
	ADC #$000A				;$BBB290
	STA $0006,y				;$BBB293
	TXA					;$BBB296
	ORA $1A					;$BBB297
	STA $0000,y				;$BBB299
	CLC					;$BBB29C
	ADC #$0800				;$BBB29D
	STA $0004,y				;$BBB2A0
	TYA					;$BBB2A3
	CLC					;$BBB2A4
	ADC #$0008				;$BBB2A5
	STA next_oam_slot			;$BBB2A8
	TXA					;$BBB2AA
	CLC					;$BBB2AB
	ADC #$0008				;$BBB2AC
	TAX					;$BBB2AF
	RTS					;$BBB2B0

CODE_BBB2B1:
	LDA hud_final_banana_count		;$BBB2B1
	CMP hud_current_banana_count		;$BBB2B4
	BNE CODE_BBB2E1				;$BBB2B7
	LDA hud_banana_display_timer		;$BBB2B9
	BNE CODE_BBB30D				;$BBB2BC
	RTS					;$BBB2BE

CODE_BBB2BF:
	SED					;$BBB2BF
	LDA banana_count			;$BBB2C0
	CLC					;$BBB2C3
	SBC #$0099				;$BBB2C4
	STA banana_count			;$BBB2C7
	LDA hud_final_banana_count		;$BBB2CA
	CLC					;$BBB2CD
	SBC #$0099				;$BBB2CE
	STA hud_final_banana_count		;$BBB2D1
	CLD					;$BBB2D4
	STZ hud_current_banana_count		;$BBB2D5
	LDA #$0001				;$BBB2D8
	JSL CODE_B88081				;$BBB2DB
	BRA CODE_BBB30D				;$BBB2DF

CODE_BBB2E1:
	BIT hud_banana_display_timer		;$BBB2E1
	BMI CODE_BBB2EC				;$BBB2E4
	LDA #$003C				;$BBB2E6
	STA hud_banana_display_timer		;$BBB2E9
CODE_BBB2EC:
	BCS CODE_BBB2FA				;$BBB2EC
	LDA active_frame_counter		;$BBB2EE
	AND #$0003				;$BBB2F0
	BNE CODE_BBB30D				;$BBB2F3
	LDA #$9999				;$BBB2F5
	BRA CODE_BBB305				;$BBB2F8

CODE_BBB2FA:
	LDA hud_current_banana_count		;$BBB2FA
	CMP #$0099				;$BBB2FD
	BCS CODE_BBB2BF				;$BBB300
	LDA #$0001				;$BBB302
CODE_BBB305:
	SED					;$BBB305
	ADC hud_current_banana_count		;$BBB306
	STA hud_current_banana_count		;$BBB309
	CLD					;$BBB30C
CODE_BBB30D:
	DEC hud_banana_display_timer		;$BBB30D
	LDY next_oam_slot			;$BBB310
	LDA #$0808				;$BBB312
	STA $0000,y				;$BBB315
	LDA active_frame_counter		;$BBB318
	AND #$001C				;$BBB31A
	LSR					;$BBB31D
	ADC $18F7				;$BBB31E
	ORA #$3000				;$BBB321
	STA $0002,y				;$BBB324
	JSR CODE_BBB3D0				;$BBB327
	INY					;$BBB32A
	INY					;$BBB32B
	INY					;$BBB32C
	INY					;$BBB32D
	STY next_oam_slot			;$BBB32E
	LDX #$0018				;$BBB330
	LDA #$0800				;$BBB333
	STA $1A					;$BBB336
	LDA $18CC				;$BBB338
	AND #$000F				;$BBB33B
	BEQ CODE_BBB343				;$BBB33E
	JSR CODE_BBB285				;$BBB340
CODE_BBB343:
	LDA hud_current_banana_count		;$BBB343
	AND #$0FF0				;$BBB346
	BEQ CODE_BBB355				;$BBB349
	LSR					;$BBB34B
	LSR					;$BBB34C
	LSR					;$BBB34D
	LSR					;$BBB34E
	AND #$000F				;$BBB34F
	JSR CODE_BBB285				;$BBB352
CODE_BBB355:
	LDA hud_current_banana_count		;$BBB355
	AND #$000F				;$BBB358
	JMP CODE_BBB285				;$BBB35B

CODE_BBB35E:
	LDX $18DD				;$BBB35E
	BEQ CODE_BBB39F				;$BBB361
	LDA $1E,x				;$BBB363
	BMI CODE_BBB39F				;$BBB365
	STA $1A					;$BBB367
	JSR CODE_BBB372				;$BBB369
	JSR CODE_BBB372				;$BBB36C
	JSR CODE_BBB372				;$BBB36F
CODE_BBB372:
	LDA $5C,x				;$BBB372
	BEQ CODE_BBB399				;$BBB374
	LDY next_oam_slot			;$BBB376
	SEP #$20				;$BBB378
	SEC					;$BBB37A
	SBC #$08				;$BBB37B
	STA $0000,y				;$BBB37D
	XBA					;$BBB380
	SEC					;$BBB381
	SBC #$10				;$BBB382
	STA $0001,y				;$BBB384
	REP #$20				;$BBB387
	LDA $1A					;$BBB389
	STA $0002,y				;$BBB38B
	PHX					;$BBB38E
	JSR CODE_BBB3D0				;$BBB38F
	PLX					;$BBB392
	INY					;$BBB393
	INY					;$BBB394
	INY					;$BBB395
	INY					;$BBB396
	STY next_oam_slot			;$BBB397
CODE_BBB399:
	INC $1A					;$BBB399
	INC $1A					;$BBB39B
	INX					;$BBB39D
	INX					;$BBB39E
CODE_BBB39F:
	RTS					;$BBB39F

CODE_BBB3A0:
	LDY $18DF				;$BBB3A0
	BNE CODE_BBB3A6				;$BBB3A3
	RTS					;$BBB3A5

CODE_BBB3A6:
	LDA $005C,y				;$BBB3A6
	AND #$00FF				;$BBB3A9
	TAX					;$BBB3AC
	EOR $005C,y				;$BBB3AD
	STA $1A					;$BBB3B0
	LDA $005E,y				;$BBB3B2
	CMP #$0100				;$BBB3B5
	BCC CODE_BBB3C9				;$BBB3B8
	PHA					;$BBB3BA
	XBA					;$BBB3BB
	AND #$00FF				;$BBB3BC
	JSR CODE_BBB285				;$BBB3BF
	PLA					;$BBB3C2
	AND #$00FF				;$BBB3C3
	JMP CODE_BBB285				;$BBB3C6

CODE_BBB3C9:
	INX					;$BBB3C9
	INX					;$BBB3CA
	INX					;$BBB3CB
	INX					;$BBB3CC
	JMP CODE_BBB285				;$BBB3CD

CODE_BBB3D0:
	PHY					;$BBB3D0
	TYA					;$BBB3D1
	AND #$000C				;$BBB3D2
	TAX					;$BBB3D5
	TYA					;$BBB3D6
	LSR					;$BBB3D7
	LSR					;$BBB3D8
	LSR					;$BBB3D9
	LSR					;$BBB3DA
	AND #$001F				;$BBB3DB
	TAY					;$BBB3DE
	LDA.l DATA_BBB3EB,x			;$BBB3DF
	ORA $0400,y				;$BBB3E3
	STA $0400,y				;$BBB3E6
	PLY					;$BBB3E9
	RTS					;$BBB3EA

DATA_BBB3EB:
	dw $0002, $0000
	dw $0008, $0000
	dw $0020, $0000
	dw $0080, $0000

CODE_BBB3FB:
	PHY					;$BBB3FB
	TYA					;$BBB3FC
	AND #$000C				;$BBB3FD
	TAX					;$BBB400
	TYA					;$BBB401
	LSR					;$BBB402
	LSR					;$BBB403
	LSR					;$BBB404
	LSR					;$BBB405
	AND #$001F				;$BBB406
	TAY					;$BBB409
	LDA.l DATA_BBB416,x			;$BBB40A
	ORA $0400,y				;$BBB40E
	STA $0400,y				;$BBB411
	PLY					;$BBB414
	RTS					;$BBB415

DATA_BBB416:
	dw $0001, $0000
	dw $0004, $0000
	dw $0010, $0000
	dw $0040, $0000

CODE_BBB426:
	JSR CODE_BBB42D				;$BBB426
	JSR CODE_BBB75A				;$BBB429
	RTL					;$BBB42C

CODE_BBB42D:
	PHK					;$BBB42D
	PLB					;$BBB42E
	JSR CODE_BBB51E				;$BBB42F
	LDX #$0000				;$BBB432
CODE_BBB435:
	JSR CODE_BBB440				;$BBB435
	INX					;$BBB438
	INX					;$BBB439
	CPX #$0010				;$BBB43A
	BCC CODE_BBB435				;$BBB43D
	RTS					;$BBB43F

CODE_BBB440:
	LDA $7E9882,x				;$BBB440
	BEQ CODE_BBB474				;$BBB444
	LDA $7E98A2,x				;$BBB446
	SEC					;$BBB44A
	SBC $7E98C2,x				;$BBB44B
	STA $7E98A2,x				;$BBB44F
	LSR					;$BBB453
	LSR					;$BBB454
	TAY					;$BBB455
	SEC					;$BBB456
	SBC $7E98D2,x				;$BBB457
	CMP $050F				;$BBB45B
	BCC CODE_BBB46D				;$BBB45E
	TYA					;$BBB460
	SBC $1973				;$BBB461
	CLC					;$BBB464
	ADC #$0010				;$BBB465
	CMP #$0100				;$BBB468
	BCC CODE_BBB475				;$BBB46B
CODE_BBB46D:
	LDA #$0000				;$BBB46D
	STA $7E9882,x				;$BBB470
CODE_BBB474:
	RTS					;$BBB474

CODE_BBB475:
	TAY					;$BBB475
	LDA $7E9892,x				;$BBB476
	CLC					;$BBB47A
	ADC $0509				;$BBB47B
	STA $7E9892,x				;$BBB47E
	LSR					;$BBB482
	LSR					;$BBB483
	SEC					;$BBB484
	SBC $196D				;$BBB485
	BCS CODE_BBB48F				;$BBB488
	ADC #$0020				;$BBB48A
	BCC CODE_BBB46D				;$BBB48D
CODE_BBB48F:
	SBC #$0120				;$BBB48F
	BCS CODE_BBB46D				;$BBB492
	LDA $7E98B2,x				;$BBB494
	BPL CODE_BBB4C4				;$BBB498
	JSR CODE_BBB511				;$BBB49A
	BEQ CODE_BBB4C0				;$BBB49D
	PHA					;$BBB49F
	CLC					;$BBB4A0
	ADC $7E9892,x				;$BBB4A1
	STA $7E9892,x				;$BBB4A5
	PLA					;$BBB4A9
	BPL CODE_BBB4B6				;$BBB4AA
	LDA $7E98B2,x				;$BBB4AC
	INC					;$BBB4B0
	STA $7E98B2,x				;$BBB4B1
	RTS					;$BBB4B5

CODE_BBB4B6:
	LDA $7E98B2,x				;$BBB4B6
	DEC					;$BBB4BA
	STA $7E98B2,x				;$BBB4BB
	RTS					;$BBB4BF

CODE_BBB4C0:
	STA $7E98B2,x				;$BBB4C0
CODE_BBB4C4:
	LDA $7E98B2,x				;$BBB4C4
	BNE CODE_BBB4D8				;$BBB4C8
	TYA					;$BBB4CA
	AND #$0007				;$BBB4CB
	BNE CODE_BBB505				;$BBB4CE
	LDA #$0100				;$BBB4D0
	STA $7E98B2,x				;$BBB4D3
	RTS					;$BBB4D7

CODE_BBB4D8:
	SEP #$30				;$BBB4D8
	DEC					;$BBB4DA
	BPL CODE_BBB4EE				;$BBB4DB
	XBA					;$BBB4DD
	INC					;$BBB4DE
	INC					;$BBB4DF
	TAY					;$BBB4E0
	LDA DATA_BBB506+$01,y			;$BBB4E1
	BNE CODE_BBB4E7				;$BBB4E4
	TAY					;$BBB4E6
CODE_BBB4E7:
	XBA					;$BBB4E7
	TYA					;$BBB4E8
	STA $7E98B3,x				;$BBB4E9
	XBA					;$BBB4ED
CODE_BBB4EE:
	STA $7E98B2,x				;$BBB4EE
	XBA					;$BBB4F2
	TAY					;$BBB4F3
	LDA DATA_BBB506,y			;$BBB4F4
	REP #$30				;$BBB4F7
	JSR CODE_BBB511				;$BBB4F9
	CLC					;$BBB4FC
	ADC $7E9892,x				;$BBB4FD
	STA $7E9892,x				;$BBB501
CODE_BBB505:
	RTS					;$BBB505

DATA_BBB506:
	db $00, $00, $00, $02, $08
	db $FE, $10, $02, $08, $00
	db $00

CODE_BBB511:
	BIT #$0080				;$BBB511
	BEQ CODE_BBB51A				;$BBB514
	ORA #$FF00				;$BBB516
	RTS					;$BBB519

CODE_BBB51A:
	AND #$00FF				;$BBB51A
	RTS					;$BBB51D

CODE_BBB51E:
	LDA $0505				;$BBB51E
	ASL					;$BBB521
	TAX					;$BBB522
	JSR (DATA_BBB592,x)			;$BBB523
	BCS CODE_BBB591				;$BBB526
	JSR CODE_BBB749				;$BBB528
	BNE CODE_BBB591				;$BBB52B
	JSL CODE_808018				;$BBB52D
	TAY					;$BBB531
	AND #$01FF				;$BBB532
	STA $1A					;$BBB535
	ASL					;$BBB537
	ADC $1A					;$BBB538
	LSR					;$BBB53A
	LSR					;$BBB53B
	SEC					;$BBB53C
	SBC #$0020				;$BBB53D
	CLC					;$BBB540
	ADC $196D				;$BBB541
	ASL					;$BBB544
	ASL					;$BBB545
	STA $7E9892,x				;$BBB546
	TYA					;$BBB54A
	XBA					;$BBB54B
	AND #$0038				;$BBB54C
	CLC					;$BBB54F
	ADC $42					;$BBB550
	TAY					;$BBB552
	LDA $1973				;$BBB553
	CLC					;$BBB556
	ADC #$00E8				;$BBB557
	CMP DATA_BBB649,y			;$BBB55A
	BCC CODE_BBB56B				;$BBB55D
	STA $1A					;$BBB55F
	LDA DATA_BBB649,y			;$BBB561
	CMP $1973				;$BBB564
	BCS CODE_BBB56B				;$BBB567
	LDA $1A					;$BBB569
CODE_BBB56B:
	ASL					;$BBB56B
	ASL					;$BBB56C
	STA $7E98A2,x				;$BBB56D
	LDA DATA_BBB649+$02,y			;$BBB571
	STA $7E98D2,x				;$BBB574
	LDA $18AB				;$BBB578
	CLC					;$BBB57B
	ADC DATA_BBB649+$04,y			;$BBB57C
	STA $7E9882,x				;$BBB57F
	LDA DATA_BBB649+$06,y			;$BBB583
	STA $7E98C2,x				;$BBB586
	LDA #$0000				;$BBB58A
	STA $7E98B2,x				;$BBB58D
CODE_BBB591:
	RTS					;$BBB591

DATA_BBB592:
	dw CODE_BBB59C
	dw CODE_BBB5C6
	dw CODE_BBB5F3
	dw CODE_BBB61E
	dw CODE_BBB59C

CODE_BBB59C:
	LDA active_frame_counter		;$BBB59C
	AND #$0003				;$BBB59E
	BNE CODE_BBB5C4				;$BBB5A1
	LDX #$0000				;$BBB5A3
	LDA $050F				;$BBB5A6
	SEC					;$BBB5A9
	SBC $1973				;$BBB5AA
	BCC CODE_BBB5C0				;$BBB5AD
	CMP #$0100				;$BBB5AF
	BCS CODE_BBB5C4				;$BBB5B2
	SBC #$0080				;$BBB5B4
	BCC CODE_BBB5C0				;$BBB5B7
	LSR					;$BBB5B9
	LSR					;$BBB5BA
	LSR					;$BBB5BB
	LSR					;$BBB5BC
	INC					;$BBB5BD
	ASL					;$BBB5BE
	TAX					;$BBB5BF
CODE_BBB5C0:
	STZ $42					;$BBB5C0
	CLC					;$BBB5C2
	RTS					;$BBB5C3

CODE_BBB5C4:
	SEC					;$BBB5C4
	RTS					;$BBB5C5

CODE_BBB5C6:
	LDA active_frame_counter		;$BBB5C6
	AND #$0003				;$BBB5C8
	BNE CODE_BBB5F1				;$BBB5CB
	LDX #$0000				;$BBB5CD
	LDA $050F				;$BBB5D0
	SEC					;$BBB5D3
	SBC $1973				;$BBB5D4
	BCC CODE_BBB5EA				;$BBB5D7
	CMP #$0100				;$BBB5D9
	BCS CODE_BBB5F1				;$BBB5DC
	SBC #$0080				;$BBB5DE
	BCC CODE_BBB5EA				;$BBB5E1
	LSR					;$BBB5E3
	LSR					;$BBB5E4
	LSR					;$BBB5E5
	LSR					;$BBB5E6
	INC					;$BBB5E7
	ASL					;$BBB5E8
	TAX					;$BBB5E9
CODE_BBB5EA:
	LDA #$0040				;$BBB5EA
	STA $42					;$BBB5ED
	CLC					;$BBB5EF
	RTS					;$BBB5F0

CODE_BBB5F1:
	SEC					;$BBB5F1
	RTS					;$BBB5F2

CODE_BBB5F3:
	LDA active_frame_counter		;$BBB5F3
	AND #$0003				;$BBB5F5
	BNE CODE_BBB61C				;$BBB5F8
	LDX #$0000				;$BBB5FA
	LDA $050F				;$BBB5FD
	SEC					;$BBB600
	SBC $1973				;$BBB601
	BCC CODE_BBB615				;$BBB604
	CMP #$0100				;$BBB606
	BCS CODE_BBB61C				;$BBB609
	ASL					;$BBB60B
	ASL					;$BBB60C
	ASL					;$BBB60D
	XBA					;$BBB60E
	AND #$0007				;$BBB60F
	INC					;$BBB612
	ASL					;$BBB613
	TAX					;$BBB614
CODE_BBB615:
	LDA #$0080				;$BBB615
	STA $42					;$BBB618
	CLC					;$BBB61A
	RTS					;$BBB61B

CODE_BBB61C:
	SEC					;$BBB61C
	RTS					;$BBB61D

CODE_BBB61E:
	LDA active_frame_counter		;$BBB61E
	AND #$0003				;$BBB620
	BNE CODE_BBB647				;$BBB623
	LDX #$0000				;$BBB625
	LDA $050F				;$BBB628
	SEC					;$BBB62B
	SBC $1973				;$BBB62C
	BCC CODE_BBB640				;$BBB62F
	CMP #$0100				;$BBB631
	BCS CODE_BBB647				;$BBB634
	ASL					;$BBB636
	ASL					;$BBB637
	ASL					;$BBB638
	XBA					;$BBB639
	AND #$0007				;$BBB63A
	INC					;$BBB63D
	ASL					;$BBB63E
	TAX					;$BBB63F
CODE_BBB640:
	LDA #$00C0				;$BBB640
	STA $42					;$BBB643
	CLC					;$BBB645
	RTS					;$BBB646

CODE_BBB647:
	SEC					;$BBB647
	RTS					;$BBB648

DATA_BBB649:
	dw $02D0, $000C, $1000, $0003
	dw $02D0, $000C, $1000, $0003
	dw $02D0, $000E, $1001, $0004
	dw $02E8, $000F, $2002, $0005
	dw $02E8, $0010, $2003, $0005
	dw $FFFF, $0011, $3004, $0006
	dw $FFFF, $0012, $3005, $0007
	dw $FFFF, $0014, $3006, $0007
	dw $FFFF, $0008, $3000, $0003
	dw $FFFF, $0008, $3000, $0003
	dw $FFFF, $0008, $3001, $0004
	dw $FFFF, $0008, $3002, $0005
	dw $FFFF, $0008, $3003, $0005
	dw $FFFF, $0008, $3004, $0006
	dw $FFFF, $0008, $3005, $0007
	dw $FFFF, $0008, $3006, $0007
	dw $FFFF, $0008, $0000, $0003
	dw $FFFF, $0008, $0000, $0003
	dw $FFFF, $0008, $0001, $0004
	dw $FFFF, $0008, $1001, $0005
	dw $FFFF, $0008, $1002, $0005
	dw $FFFF, $0008, $1003, $0006
	dw $FFFF, $0008, $3004, $0007
	dw $FFFF, $0008, $3005, $0007
	dw $FFFF, $0008, $2000, $0003
	dw $FFFF, $0008, $2000, $0003
	dw $FFFF, $0008, $2001, $0004
	dw $FFFF, $0008, $2002, $0005
	dw $FFFF, $0008, $2003, $0005
	dw $FFFF, $0008, $2004, $0006
	dw $FFFF, $0008, $2005, $0007
	dw $FFFF, $0008, $2006, $0007

CODE_BBB749:
	LDA $7E9882,x				;$BBB749
	BEQ CODE_BBB759				;$BBB74D
	INX					;$BBB74F
	INX					;$BBB750
	CPX #$000E				;$BBB751
	BCC CODE_BBB749				;$BBB754
	LDA #$FFFF				;$BBB756
CODE_BBB759:
	RTS					;$BBB759

CODE_BBB75A:
	PHK					;$BBB75A
	PLB					;$BBB75B
	LDX #$0000				;$BBB75C
	LDY next_oam_slot			;$BBB75F
	CPY #$0400				;$BBB761
	BCS CODE_BBB7A4				;$BBB764
CODE_BBB766:
	LDA $7E9882,x				;$BBB766
	BEQ CODE_BBB798				;$BBB76A
	LDA $7E98A2,x				;$BBB76C
	LSR					;$BBB770
	LSR					;$BBB771
	SEC					;$BBB772
	SBC $1973				;$BBB773
	STA $0001,y				;$BBB776
	LDA $7E9882,x				;$BBB779
	STA $0002,y				;$BBB77D
	LDA $7E9892,x				;$BBB780
	LSR					;$BBB784
	LSR					;$BBB785
	SEC					;$BBB786
	SBC $196D				;$BBB787
	SEP #$20				;$BBB78A
	STA $0000,y				;$BBB78C
	XBA					;$BBB78F
	REP #$20				;$BBB790
	BNE CODE_BBB7A7				;$BBB792
	INY					;$BBB794
	INY					;$BBB795
	INY					;$BBB796
	INY					;$BBB797
CODE_BBB798:
	CPY #$0400				;$BBB798
	BCS CODE_BBB7A4				;$BBB79B
	INX					;$BBB79D
	INX					;$BBB79E
	CPX #$0010				;$BBB79F
	BCC CODE_BBB766				;$BBB7A2
CODE_BBB7A4:
	STY next_oam_slot			;$BBB7A4
	RTS					;$BBB7A6

CODE_BBB7A7:
	PHX					;$BBB7A7
	JSR CODE_BBB3FB				;$BBB7A8
	PLX					;$BBB7AB
	INY					;$BBB7AC
	INY					;$BBB7AD
	INY					;$BBB7AE
	INY					;$BBB7AF
	BRA CODE_BBB798				;$BBB7B0

DATA_BBB7B2:
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000

DATA_BBB7BC:
	db $08, $00, $02, $14, $01, $01, $1A,$02
	db $00, $1B, $03, $00, $1C, $04, $00,$22
	db $05, $02, $25, $06, $00, $26, $07,$00
	db $27, $08, $04, $32, $09, $01, $33,$0A
	db $01, $34, $0B, $01, $35, $0C, $02,$36
	db $0D, $02, $37, $0E, $02, $3F, $0F,$03
	db $45, $10, $00, $50, $11, $00, $51,$12
	db $00, $54, $13, $04, $55, $14, $04,$5C
	db $15, $01, $5D, $16, $01, $62, $17,$01
	db $63, $18, $01, $64, $19, $02, $65,$1A
	db $02, $68, $1B, $00, $69, $1C, $00,$6C
	db $1D, $02, $6D, $1E, $02, $86, $1F,$02
	db $87, $20, $02, $88, $21, $00, $90,$22
	db $01, $91, $23, $01, $94, $24, $03,$95
	db $25, $03, $FF, $26, $00

DATA_BBB831:
	dw $0100, $0258, $020C, $026C
	dw $02EC, $0100, $0298, $0298
	dw $0298, $0258, $0258, $0258
	dw $0100, $0100, $0100, $0200
	dw $0378, $0298, $0298, $0298
	dw $0298, $0258, $0258, $0258
	dw $0258, $0100, $0100, $0298
	dw $0298, $0100, $0100, $0100
	dw $0100, $0200, $0258, $0258
	dw $0100, $0100

CODE_BBB87D:
	JML [$04F5]				;$BBB87D

CODE_BBB880:
	JSR CODE_BBB884				;$BBB880  \
	RTL					;$BBB883  /


;A = new sprite type
;X = pointer to sprite slot where new sprite is going to spawn
;Y = current spawn script index (not used by routine but preserved)

CODE_BBB884:
	PHB					;$BBB884  \> Preserve bank
	PHK					;$BBB885   |\
	PLB					;$BBB886   |/ Set data bank to here
	PHY					;$BBB887   |> Preserve spawn script index
	TXY					;$BBB888   |> Transfer sprite slot to Y
	TAX					;$BBB889   |\ Transfer sprite type to X
	STX sprite.type,y			;$BBB88A   |/ And store it to the new sprite slot
	LDA.l sprite_main_table,x		;$BBB88C   |\ Get sprite main routine pointer
	STA.w sprite.main_routine_address,y	;$BBB890   | | And store it to the sprites main pointer
	SEP #$20				;$BBB893   | |
	LDA.l sprite_main_bank,x		;$BBB895   | |
	STA.w sprite.main_routine_bank,y	;$BBB899   | |
	STA.w sprite.main_routine_bank+1,y	;$BBB89C   | |
	REP #$20				;$BBB89F   |/
	TYX					;$BBB8A1   |\ Transfer current sprite back into X
	PLY					;$BBB8A2   | | Retrieve the current spawn script index
	PLB					;$BBB8A3   | | Restore the current bank
	RTS					;$BBB8A4  /_/ Return

sprite_handler_direct:
	JSL CODE_BCE2CB				;$BBB8A5  \> Initialize sprite collision
	LDA.w #DATA_FF1BC0>>8			;$BBB8A9   |\ Write bank of sprite constants for current sprite (always FF)
	STA sprite_constants_bank		;$BBB8AC   |/
	STZ $0428				;$BBB8AE   |
	STZ $042A				;$BBB8B1   |
	STZ $042C				;$BBB8B4   |
	STZ $042E				;$BBB8B7   |
	LDA timestop_flags			;$BBB8BA   |\ If time is currently stopped
	BNE .time_stop_sprite_handler		;$BBB8BD   |/ Handle conditional sprite pr
	LDA.w #<:.sprite_return			;$BBB8BF   |\ Write bank of sprite return address
	STA sprite_return_bank			;$BBB8C2   |/
	LDA #.sprite_return			;$BBB8C5   |\ Write sprite return pointer
	STA sprite_return_address		;$BBB8C8   |/
	LDY #main_sprite_table			;$BBB8CB   | Load sprite base pointer
.next_slot:					;	   |
	LDA.w sprite.type,y			;$BBB8CE   |\ If the sprite doesn't exist
	BEQ .get_next_slot			;$BBB8D1   |/ Get the next sprite
	STY current_sprite			;$BBB8D3   |\ If the sprite was found, preserve the index
	LDA.w sprite.main_routine_bank,y	;$BBB8D5   | | Then push its main routine as the return vector
	PHA					;$BBB8D8   | |
	PLB					;$BBB8D9   | |
	LDA.w sprite.main_routine_address,y	;$BBB8DA   | |
	PHA					;$BBB8DD   |/
	LDA.w sprite.constants_address,y	;$BBB8DE   |\
	STA current_sprite_constants		;$BBB8E1   |/ Set constants pointer to current sprites constants
	LDA.w sprite.state,y			;$BBB8E3   |\ Get sprites state
	AND #$00FF				;$BBB8E6   | |
	ASL					;$BBB8E9   | |
	TAX					;$BBB8EA   |/ Return sprite state << 1 in X (can be used to directly index state table)
	RTL					;$BBB8EB  /> Return into sprite main

.sprite_return:
	LDY current_sprite			;$BBB8EC  \
.get_next_slot:					;	   |
	TYA					;$BBB8EE   |
	CLC					;$BBB8EF   |
	ADC.w #sizeof(sprite)			;$BBB8F0   |
	TAY					;$BBB8F3   |
	CPY #main_sprite_table_end		;$BBB8F4   |
	BNE .next_slot				;$BBB8F7   |
	JSL process_player_interactions		;$BBB8F9   |
	JSR process_platform_sprites		;$BBB8FD   |
	JSR handle_kong_follow			;$BBB900   |
	JSL CODE_B28015				;$BBB903   |> Play queued sound effect
	JMP CODE_BBB99A				;$BBB907  /

.time_stop_sprite_handler:
	AND #$0080				;$BBB90A  \ \
	BNE .dont_process_any_sprites		;$BBB90D   |/ If time is stopped for all sprites then dont process any sprites
	LDA.w #<:..sprite_return		;$BBB90F   |\ Write bank of sprite return address
	STA $04F7				;$BBB912   |/
	LDA #..sprite_return			;$BBB915   |\ Write sprite return pointer
	STA $04F5				;$BBB918   |/
	LDY #main_sprite_table			;$BBB91B   | Load sprite base pointer
..next_slot:					;	   |
	LDX sprite.type,y			;$BBB91E   |\ If the sprite doesn't exist
	BEQ ..get_next_slot			;$BBB920   |/ Get the next sprite
	STY current_sprite			;$BBB922   |> If the sprite was found, preserve the index
	CPY active_kong_sprite			;$BBB924   |\
	BEQ ..sprite_is_main_kong		;$BBB927   |/ If the sprite is the active kong then determine whether it processes or not
	CPY follower_kong_sprite		;$BBB929   |\
	BEQ ..sprite_is_follower_kong		;$BBB92C   |/ If the sprite is the inactive kong then determine whether it processes or not
..handle_general_time_stop:			;	   |
	LDA timestop_flags			;$BBB92E   |\
	AND #$0024				;$BBB931   | |
	BEQ ..return_to_sprite_code		;$BBB934   |/ If no time stop flags are active for general sprites then process the sprite
	LDA.l sprite_timestop_flag,x		;$BBB936   |\ Get sprite timestop flags
	AND #$0001				;$BBB93A   | |
	BEQ ..sprite_return			;$BBB93D   |/ If current sprite type cant run during time stop, return and move to next slot
	BRA ..return_to_sprite_code		;$BBB93F  /> This sprite has a time stop exception and can process, return to sprite code

..sprite_is_main_kong:
	LDA timestop_flags			;$BBB941  \ \
	AND #$0028				;$BBB944   | |
	BEQ ..return_to_sprite_code		;$BBB947   |/ If no time stop flags are active that impact active kong then process the sprite
	AND #$0008				;$BBB949   |\
	BNE ..sprite_return			;$BBB94C   | | If the active kong is time stopped then return and move to next slot
	BRA ..handle_general_time_stop		;$BBB94E  / / Else the active kong sprite isnt time stopped, process it

..sprite_is_follower_kong:
	LDA timestop_flags			;$BBB950  \ \
	AND #$0030				;$BBB953   | |
	BEQ ..return_to_sprite_code		;$BBB956   |/ If no time stop flags are active that impact inactive kong then process the sprite
	AND #$0010				;$BBB958   |\
	BNE ..sprite_return			;$BBB95B   | | If the inactive kong is time stopped then return and move to next slot
	BRA ..handle_general_time_stop		;$BBB95D  / / Else the inactive kong sprite isnt time stopped, process it

..return_to_sprite_code:
	LDA.w sprite.main_routine_bank,y	;$BBB95F  \ \ Push sprite main routine as the return vector
	PHA					;$BBB962   | |
	PLB					;$BBB963   | |
	LDA.w sprite.main_routine_address,y	;$BBB964   | |
	PHA					;$BBB967   |/
	LDA.w sprite.constants_address,y	;$BBB968   |\
	STA current_sprite_constants		;$BBB96B   |/ Set constants pointer to current sprites constants
	LDA.w sprite.state,y			;$BBB96D   |\ Get sprites state
	AND #$00FF				;$BBB970   | |
	ASL					;$BBB973   | |
	TAX					;$BBB974   | |
	RTL					;$BBB975  / / Return sprite state << 1 in X (can be used to directly index state table)

..sprite_return:
	LDY current_sprite			;$BBB976  \
..get_next_slot:				;	   |
	TYA					;$BBB978   |
	CLC					;$BBB979   |
	ADC.w #sizeof(sprite)			;$BBB97A   |
	TAY					;$BBB97D   |
	CPY #main_sprite_table_end		;$BBB97E   |
	BNE ..next_slot				;$BBB981   |
.dont_process_any_sprites:			;	   |
	JSL process_player_interactions		;$BBB983   |
	JSR process_platform_sprites		;$BBB987   |
	JSR handle_kong_follow			;$BBB98A   |
	JSL CODE_B28015				;$BBB98D   |
	DEC timestop_timer			;$BBB991   |
	BEQ CODE_BBB997				;$BBB994   |
	RTL					;$BBB996  /

CODE_BBB997:
	STZ timestop_flags			;$BBB997
CODE_BBB99A:
	LDA $1D8B				;$BBB99A
	BNE CODE_BBB9AF				;$BBB99D
	LDA $E6					;$BBB99F
	CMP $E8					;$BBB9A1
	BEQ CODE_BBB9AF				;$BBB9A3
	LDA $1560				;$BBB9A5
	CLC					;$BBB9A8
	ADC #$0063				;$BBB9A9
	STA $1560				;$BBB9AC
CODE_BBB9AF:
	RTL					;$BBB9AF

CODE_BBB9B0:
	LDA.w #DATA_FF1BC0>>8			;$BBB9B0
	STA sprite_constants_bank		;$BBB9B3
	LDA.w #CODE_BBB9DC>>16			;$BBB9B5
	STA sprite_return_bank			;$BBB9B8
	LDA #CODE_BBB9DC			;$BBB9BB
	STA sprite_return_address		;$BBB9BE
	STY current_sprite			;$BBB9C1
	LDA.w sprite.type,y			;$BBB9C3
	LDA.w sprite.main_routine_bank,y	;$BBB9C6
	PHA					;$BBB9C9
	PLB					;$BBB9CA
	LDA.w sprite.main_routine_address,y	;$BBB9CB
	PHA					;$BBB9CE
	LDA.w sprite.constants_address,y	;$BBB9CF
	STA current_sprite_constants		;$BBB9D2
	LDA.w sprite.state,y			;$BBB9D4
	AND #$00FF				;$BBB9D7
	ASL					;$BBB9DA
	TAX					;$BBB9DB
CODE_BBB9DC:
	RTL					;$BBB9DC

enable_timestop_direct:
	STA timestop_flags			;$BBB9DD
	STY timestop_timer			;$BBB9E0
	RTL					;$BBB9E3

disable_timestop_direct:
	STZ timestop_flags			;$BBB9E4
	STZ timestop_timer			;$BBB9E7
	RTL					;$BBB9EA

handle_kong_follow:
	LDA $05AF				;$BBB9EB
	AND #$0002				;$BBB9EE
	BNE CODE_BBBA16				;$BBB9F1
	LDY active_kong_sprite			;$BBB9F3
	LDA $1917				;$BBB9F6
	CMP.w sprite.x_position,y		;$BBB9F9
	BNE CODE_BBBA1D				;$BBB9FC
	LDA $1919				;$BBB9FE
	CMP.w sprite.y_position,y		;$BBBA01
	BNE CODE_BBBA1D				;$BBBA04
	LDA.w sprite.terrain_interaction,y	;$BBBA06
	AND #$1010				;$BBBA09
	BNE CODE_BBBA1D				;$BBBA0C
	LDA #$0004				;$BBBA0E
	TRB $05AF				;$BBBA11
	BNE CODE_BBBA1D				;$BBBA14
CODE_BBBA16:
	LDA #$0006				;$BBBA16
	TRB $05AF				;$BBBA19
	RTS					;$BBBA1C

CODE_BBBA1D:
	LDA #$0010				;$BBBA1D
	TRB $1927				;$BBBA20
	BNE CODE_BBBA28				;$BBBA23
	STZ $1921				;$BBBA25
CODE_BBBA28:
	LDX $1923				;$BBBA28
	LDA.w sprite.x_position,y		;$BBBA2B
	STA $1917				;$BBBA2E
	STA $7E4080,x				;$BBBA31
	LDA.w sprite.y_position,y		;$BBBA35
	STA $1919				;$BBBA38
	CLC					;$BBBA3B
	ADC $1921				;$BBBA3C
	STA $7E40C0,x				;$BBBA3F
	LDA.w sprite.oam_property,y		;$BBBA43
	AND #$4000				;$BBBA46
	STA $7E4100,x				;$BBBA49
	LDY active_kong_control_variables	;$BBBA4D
	LDA $0000,y				;$BBBA50
	STA $7E4140,x				;$BBBA53
	INX					;$BBBA57
	INX					;$BBBA58
	TXA					;$BBBA59
	AND #$003F				;$BBBA5A
	STA $1923				;$BBBA5D
	CMP $1925				;$BBBA60
	BNE CODE_BBBA70				;$BBBA63
	LDA $1925				;$BBBA65
	INC					;$BBBA68
	INC					;$BBBA69
	AND #$003F				;$BBBA6A
	STA $1925				;$BBBA6D
CODE_BBBA70:
	RTS					;$BBBA70

process_existing_platform_sprite:
	SEC					;$BBBA71  \ \
	SBC #$0005				;$BBBA72   | | Move to previous platform slot index
	STA $17D6				;$BBBA75   |/
	TAY					;$BBBA78   |> Transfer platform slot index to Y
	LDA $17D8,y				;$BBBA79   |\ Copy platform logic pointer to $1A
	STA $1A					;$BBBA7C   | |
	LDA $17DA,y				;$BBBA7E   | | Copy platform logic bank to $1C
	STA $1C					;$BBBA81   |/
	LDX $17DB,y				;$BBBA83   |\ Get platform sprite
	STX current_sprite			;$BBBA86   |/
	PHK					;$BBBA88   |\
	%return(process_platform_sprites)	;$BBBA89   |/ Set return address to logic handler so it loops through all platforms
	JMP [$001A]				;$BBBA8C  /> Execute platform logic

process_platform_sprites:
	LDA $17D6				;$BBBA8F  \ \ Get platform slot index
	BNE process_existing_platform_sprite	;$BBBA92   |/ If slot contains a platform then process it
	RTS					;$BBBA94  /


;related to standable sprite table
CODE_BBBA95:
	LDY $17D6				;$BBBA95
	STA $17D8,y				;$BBBA98
	LDA $03,S				;$BBBA9B
	STA $17DA,y				;$BBBA9D
	LDA current_sprite			;$BBBAA0
	STA $17DB,y				;$BBBAA2
	TYA					;$BBBAA5
	CLC					;$BBBAA6
	ADC #$0005				;$BBBAA7
	STA $17D6				;$BBBAAA
	RTL					;$BBBAAD

CODE_BBBAAE:
	ASL					;$BBBAAE
	BNE CODE_BBBAB2				;$BBBAAF
	RTL					;$BBBAB1

CODE_BBBAB2:
	JSL CODE_BB8A3F				;$BBBAB2
	%pea_shift_dbr($80B900)			;$BBBAB6
	PLB					;$BBBAB9
	TAX					;$BBBABA
	LDY.w DATA_B9B775,x			;$BBBABB
	LDA $0000,y				;$BBBABE
	STA $7FFFFE				;$BBBAC1
	TAX					;$BBBAC5
	LDA $0002,y				;$BBBAC6
	STA $7F0000,x				;$BBBAC9
	STA $0452				;$BBBACD
	LDA $0003,y				;$BBBAD0
	STA $7F0001,x				;$BBBAD3
	STA $0453				;$BBBAD7
	LDA $0005,y				;$BBBADA
	STA $0456				;$BBBADD
	LDA #$0005				;$BBBAE0
	STA $0450				;$BBBAE3
	TYA					;$BBBAE6
	CLC					;$BBBAE7
	ADC #$0007				;$BBBAE8
	TAY					;$BBBAEB
CODE_BBBAEC:
	STY $42					;$BBBAEC
	LDA $0000,y				;$BBBAEE
	AND #$00FF				;$BBBAF1
	BEQ CODE_BBBB04				;$BBBAF4
	CMP #$0080				;$BBBAF6
	BCC CODE_BBBB37				;$BBBAF9
	CMP #$00FE				;$BBBAFB
	BCC CODE_BBBB04				;$BBBAFE
	BEQ CODE_BBBB06				;$BBBB00
	BRA CODE_BBBB20				;$BBBB02

CODE_BBBB04:
	PLB					;$BBBB04
	RTL					;$BBBB05

CODE_BBBB06:
	LDA $0001,y				;$BBBB06
	STA $0452				;$BBBB09
	LDA $0002,y				;$BBBB0C
	STA $0453				;$BBBB0F
	LDA $0004,y				;$BBBB12
	STA $0456				;$BBBB15
	TYA					;$BBBB18
	CLC					;$BBBB19
	ADC #$0006				;$BBBB1A
	TAY					;$BBBB1D
	BRA CODE_BBBAEC				;$BBBB1E

CODE_BBBB20:
	LDA $0001,y				;$BBBB20
	AND #$00FF				;$BBBB23
	STA $1A					;$BBBB26
	ASL					;$BBBB28
	ASL					;$BBBB29
	ADC $1A					;$BBBB2A
	CLC					;$BBBB2C
	ADC $0450				;$BBBB2D
	STA $0450				;$BBBB30
	INY					;$BBBB33
	INY					;$BBBB34
	BRA CODE_BBBAEC				;$BBBB35

CODE_BBBB37:
	STA $44					;$BBBB37
	LDA $0001,y				;$BBBB39
	CMP #$0678				;$BBBB3C
	BCS CODE_BBBB98				;$BBBB3F
CODE_BBBB41:
	PHA					;$BBBB41
	TAX					;$BBBB42
	LDA.l sprite_hitbox_table,x		;$BBBB43
	STA $46					;$BBBB47
	LDA.l sprite_graphic_table_bank,x	;$BBBB49
	TAY					;$BBBB4D
	LDA.l sprite_graphic_table,x		;$BBBB4E
	TAX					;$BBBB52
	JSL CODE_BB8615				;$BBBB53
	PHX					;$BBBB57
	LDA $7FFFFE				;$BBBB58
	CLC					;$BBBB5C
	ADC $0450				;$BBBB5D
	TAX					;$BBBB60
	LDA $0452				;$BBBB61
	STA $7F0000,x				;$BBBB64
	LDA $0453				;$BBBB68
	STA $7F0001,x				;$BBBB6B
	LDA $46					;$BBBB6F
	STA $7F0003,x				;$BBBB71
	LDA $0450				;$BBBB75
	CLC					;$BBBB78
	ADC #$0005				;$BBBB79
	STA $0450				;$BBBB7C
	PLA					;$BBBB7F
	CLC					;$BBBB80
	ADC $0452				;$BBBB81
	STA $0452				;$BBBB84
	PLA					;$BBBB87
	CLC					;$BBBB88
	ADC #$0005				;$BBBB89
	DEC $44					;$BBBB8C
	BNE CODE_BBBB41				;$BBBB8E
	LDY $42					;$BBBB90
	INY					;$BBBB92
	INY					;$BBBB93
	INY					;$BBBB94
	JMP CODE_BBBAEC				;$BBBB95

CODE_BBBB98:
	PHY					;$BBBB98
	TAX					;$BBBB99
	STX $42					;$BBBB9A
	LDA.l sprite_graphic_table_bank,x	;$BBBB9C
	TAY					;$BBBBA0
	LDA.l sprite_graphic_table,x		;$BBBBA1
	TAX					;$BBBBA5
	JSL CODE_BB8615				;$BBBBA6
	LDA $42					;$BBBBAA
	CMP #$0AB5				;$BBBBAC
	ROR $3A					;$BBBBAF
CODE_BBBBB1:
	LDA $7FFFFE				;$BBBBB1
	CLC					;$BBBBB5
	ADC $0450				;$BBBBB6
	TAX					;$BBBBB9
	LDA $0452				;$BBBBBA
	STA $7F0000,x				;$BBBBBD
	LDA $0453				;$BBBBC1
	STA $7F0001,x				;$BBBBC4
	PHX					;$BBBBC8
	LDX $42					;$BBBBC9
	LDA.l sprite_hitbox_table,x		;$BBBBCB
	PLX					;$BBBBCF
	STA $7F0003,x				;$BBBBD0
	LDA $0450				;$BBBBD4
	CLC					;$BBBBD7
	ADC #$0005				;$BBBBD8
	STA $0450				;$BBBBDB
	LDA $42					;$BBBBDE
	CLC					;$BBBBE0
	ADC #$0005				;$BBBBE1
	STA $42					;$BBBBE4
	JSR CODE_BBBBFB				;$BBBBE6
	CLC					;$BBBBE9
	ADC $0452				;$BBBBEA
	STA $0452				;$BBBBED
	DEC $44					;$BBBBF0
	BNE CODE_BBBBB1				;$BBBBF2
	PLY					;$BBBBF4
	INY					;$BBBBF5
	INY					;$BBBBF6
	INY					;$BBBBF7
	JMP CODE_BBBAEC				;$BBBBF8

CODE_BBBBFB:
	PHY					;$BBBBFB
	PHB					;$BBBBFC
	SEP #$20				;$BBBBFD
	LDA $000454				;$BBBBFF
	LDY $0452				;$BBBC03
	PHA					;$BBBC06
	PLB					;$BBBC07
	LDA $3B					;$BBBC08
	BMI CODE_BBBC38				;$BBBC0A
	LDA $0000,y				;$BBBC0C
	CLC					;$BBBC0F
	ADC $0001,y				;$BBBC10
	ADC $0003,y				;$BBBC13
	STA $3E					;$BBBC16
	STZ $3F					;$BBBC18
	TDC					;$BBBC1A
	LDA $0000,y				;$BBBC1B
	ASL					;$BBBC1E
	ASL					;$BBBC1F
	ADC $0001,y				;$BBBC20
	ADC $0003,y				;$BBBC23
	PLB					;$BBBC26
	REP #$20				;$BBBC27
	ASL					;$BBBC29
	ASL					;$BBBC2A
	ASL					;$BBBC2B
	ASL					;$BBBC2C
	ADC $3E					;$BBBC2D
	ASL					;$BBBC2F
	ADC #$0008				;$BBBC30
	STA $045E				;$BBBC33
	PLY					;$BBBC36
	RTS					;$BBBC37

CODE_BBBC38:
	LDA $0000,y				;$BBBC38
	CLC					;$BBBC3B
	ADC $0001,y				;$BBBC3C
	ADC $0003,y				;$BBBC3F
	ADC $0008,y				;$BBBC42
	ADC $000A,y				;$BBBC45
	ADC $000C,y				;$BBBC48
	STA $3E					;$BBBC4B
	STZ $3F					;$BBBC4D
	TDC					;$BBBC4F
	LDA $0000,y				;$BBBC50
	ADC $0008,y				;$BBBC53
	ASL					;$BBBC56
	ASL					;$BBBC57
	ADC $0001,y				;$BBBC58
	ADC $0003,y				;$BBBC5B
	ADC $000A,y				;$BBBC5E
	ADC $000C,y				;$BBBC61
	PLB					;$BBBC64
	REP #$20				;$BBBC65
	ASL					;$BBBC67
	ASL					;$BBBC68
	ASL					;$BBBC69
	ASL					;$BBBC6A
	ADC $3E					;$BBBC6B
	ASL					;$BBBC6D
	ADC #$000E				;$BBBC6E
	PLY					;$BBBC71
	RTS					;$BBBC72

CODE_BBBC73:
	LDA $0775				;$BBBC73
	BIT #$4000				;$BBBC76
	BNE CODE_BBBC93				;$BBBC79
	BIT #$2000				;$BBBC7B
	BNE CODE_BBBC9C				;$BBBC7E
	BIT #$1000				;$BBBC80
	BNE CODE_BBBCA8				;$BBBC83
	BIT #$8000				;$BBBC85
	BEQ CODE_BBBC92				;$BBBC88
	LDA current_world			;$BBBC8A
	CMP #!world_krematoa			;$BBBC8D
	BEQ CODE_BBBCB1				;$BBBC90
CODE_BBBC92:
	RTL					;$BBBC92

CODE_BBBC93:
	%pea_shift_dbr($BC7E00)			;$BBBC93
	PLB					;$BBBC96
	JSR CODE_BBBCBA				;$BBBC97
	PLB					;$BBBC9A
	RTL					;$BBBC9B

CODE_BBBC9C:
	%pea_shift_dbr($BC7E00)			;$BBBC9C
	PLB					;$BBBC9F
	JSR CODE_BBBD77				;$BBBCA0
	JSR CODE_BBBD8A				;$BBBCA3
	PLB					;$BBBCA6
	RTL					;$BBBCA7

CODE_BBBCA8:
	%pea_shift_dbr($BC7E00)			;$BBBCA8
	PLB					;$BBBCAB
	JSR CODE_BBBDA3				;$BBBCAC
	PLB					;$BBBCAF
	RTL					;$BBBCB0

CODE_BBBCB1:
	%pea_shift_dbr($BC7E00)			;$BBBCB1
	PLB					;$BBBCB4
	JSR CODE_BBBE00				;$BBBCB5
	PLB					;$BBBCB8
	RTL					;$BBBCB9

CODE_BBBCBA:
	LDY #$0DAA				;$BBBCBA
CODE_BBBCBD:
	TYX					;$BBBCBD
	LDA.l dixie_sprite_palettes,x		;$BBBCBE
	STA $000022				;$BBBCC2
	STA $3A					;$BBBCC6
	AND #$001F				;$BBBCC8
	STA $3C					;$BBBCCB
	LDA $3A					;$BBBCCD
	LSR					;$BBBCCF
	LSR					;$BBBCD0
	LSR					;$BBBCD1
	LSR					;$BBBCD2
	LSR					;$BBBCD3
	AND #$001F				;$BBBCD4
	CLC					;$BBBCD7
	ADC $3C					;$BBBCD8
	STA $3C					;$BBBCDA
	LDA $3B					;$BBBCDC
	LSR					;$BBBCDE
	AND #$001F				;$BBBCDF
	CLC					;$BBBCE2
	ADC $3C					;$BBBCE3
	ASL					;$BBBCE5
	TAX					;$BBBCE6
	LDA.l DATA_FD41D7,x			;$BBBCE7
	STA $000024				;$BBBCEB
	LDA #$000E				;$BBBCEF
	STA $3E					;$BBBCF2
	LDA #$0012				;$BBBCF4
	STA $40					;$BBBCF7
	JSR CODE_BBBD04				;$BBBCF9
	STA.w $7E3180,y				;$BBBCFC
	DEY					;$BBBCFF
	DEY					;$BBBD00
	BPL CODE_BBBCBD				;$BBBD01
	RTS					;$BBBD03

CODE_BBBD04:
	LDX $24					;$BBBD04
	LDA $22					;$BBBD06
	JSR CODE_BBBD39				;$BBBD08
	STA $26					;$BBBD0B
	LDA $24					;$BBBD0D
	LSR					;$BBBD0F
	LSR					;$BBBD10
	LSR					;$BBBD11
	LSR					;$BBBD12
	LSR					;$BBBD13
	TAX					;$BBBD14
	LDA $22					;$BBBD15
	LSR					;$BBBD17
	LSR					;$BBBD18
	LSR					;$BBBD19
	LSR					;$BBBD1A
	LSR					;$BBBD1B
	JSR CODE_BBBD39				;$BBBD1C
	ASL					;$BBBD1F
	ASL					;$BBBD20
	ASL					;$BBBD21
	ASL					;$BBBD22
	ASL					;$BBBD23
	TSB $26					;$BBBD24
	LDA $25					;$BBBD26
	LSR					;$BBBD28
	LSR					;$BBBD29
	TAX					;$BBBD2A
	LDA $23					;$BBBD2B
	LSR					;$BBBD2D
	LSR					;$BBBD2E
	JSR CODE_BBBD39				;$BBBD2F
	ASL					;$BBBD32
	ASL					;$BBBD33
	TSB $27					;$BBBD34
	LDA $26					;$BBBD36
	RTS					;$BBBD38

CODE_BBBD39:
	SEP #$20				;$BBBD39
	AND #$1F				;$BBBD3B
	STA.l CPU.multiply_A			;$BBBD3D
	LDA $3E					;$BBBD41
	STA.l CPU.multiply_B			;$BBBD43
	LDA ($00)				;$BBBD47
	REP #$20				;$BBBD49
	LDA.l CPU.multiply_result		;$BBBD4B
	STA $3A					;$BBBD4F
	SEP #$20				;$BBBD51
	LDA.b $40				;$BBBD53
	STA.l CPU.multiply_A			;$BBBD55
	TXA					;$BBBD59
	AND #$1F				;$BBBD5A
	STA.l CPU.multiply_B			;$BBBD5C
	REP #$20				;$BBBD60
	LDA $3A					;$BBBD62
	CLC					;$BBBD64
	ADC.l CPU.multiply_result		;$BBBD65
	LSR					;$BBBD69
	LSR					;$BBBD6A
	LSR					;$BBBD6B
	LSR					;$BBBD6C
	LSR					;$BBBD6D
	CMP #$001F				;$BBBD6E
	BCC CODE_BBBD76				;$BBBD71
	LDA #$001F				;$BBBD73
CODE_BBBD76:
	RTS					;$BBBD76

CODE_BBBD77:
	LDX #$0DAA				;$BBBD77
CODE_BBBD7A:
	LDA.l dixie_sprite_palettes,x		;$BBBD7A
	LSR					;$BBBD7E
	AND #$3DEF				;$BBBD7F
	STA.w $7E3180,x				;$BBBD82
	DEX					;$BBBD85
	DEX					;$BBBD86
	BPL CODE_BBBD7A				;$BBBD87
	RTS					;$BBBD89

CODE_BBBD8A:
	LDX #$0454				;$BBBD8A
CODE_BBBD8D:
	LDA.l dixie_sprite_palettes,x		;$BBBD8D
	CMP #$7FFF				;$BBBD91
	BEQ CODE_BBBD9B				;$BBBD94
CODE_BBBD96:
	DEX					;$BBBD96
	DEX					;$BBBD97
	BPL CODE_BBBD8D				;$BBBD98
	RTS					;$BBBD9A

CODE_BBBD9B:
	LDA #$6318				;$BBBD9B
	STA $3180,x				;$BBBD9E
	BRA.b CODE_BBBD96			;$BBBDA1

CODE_BBBDA3:
	LDX #$0DAA				;$BBBDA3
CODE_BBBDA6:
	LDA.l dixie_sprite_palettes,x		;$BBBDA6
	EOR #$7FFF				;$BBBDAA
	STA $1A					;$BBBDAD
	AND #$001F				;$BBBDAF
	STA $1E					;$BBBDB2
	LSR					;$BBBDB4
	LSR					;$BBBDB5
	CLC					;$BBBDB6
	ADC $1E					;$BBBDB7
	SEC					;$BBBDB9
	SBC #$0007				;$BBBDBA
	BPL CODE_BBBDC2				;$BBBDBD
	LDA #$0000				;$BBBDBF
CODE_BBBDC2:
	STA $1C					;$BBBDC2
	LDA $1A					;$BBBDC4
	AND #$03E0				;$BBBDC6
	STA $1E					;$BBBDC9
	LSR					;$BBBDCB
	LSR					;$BBBDCC
	CLC					;$BBBDCD
	ADC $1E					;$BBBDCE
	SEC					;$BBBDD0
	SBC #$00E0				;$BBBDD1
	BPL CODE_BBBDD9				;$BBBDD4
	LDA #$0000				;$BBBDD6
CODE_BBBDD9:
	AND #$03E0				;$BBBDD9
	TSB $1C					;$BBBDDC
	LDA $1A					;$BBBDDE
	AND #$7C00				;$BBBDE0
	STA $1E					;$BBBDE3
	LSR					;$BBBDE5
	LSR					;$BBBDE6
	CLC					;$BBBDE7
	ADC $1E					;$BBBDE8
	SEC					;$BBBDEA
	SBC #$1C00				;$BBBDEB
	BPL CODE_BBBDF3				;$BBBDEE
	LDA #$0000				;$BBBDF0
CODE_BBBDF3:
	AND #$7C00				;$BBBDF3
	ORA $1C					;$BBBDF6
	STA $3180,x				;$BBBDF8
	DEX					;$BBBDFB
	DEX					;$BBBDFC
	BPL CODE_BBBDA6				;$BBBDFD
	RTS					;$BBBDFF

CODE_BBBE00:
	LDX #$0DAA				;$BBBE00
CODE_BBBE03:
	LDA.l dixie_sprite_palettes,x		;$BBBE03
	STA $1A					;$BBBE07
	AND #$000F				;$BBBE09
	CLC					;$BBBE0C
	ADC #$0006				;$BBBE0D
	CMP #$000F				;$BBBE10
	BCC CODE_BBBE18				;$BBBE13
	LDA #$000F				;$BBBE15
CODE_BBBE18:
	EOR $1A					;$BBBE18
	AND #$000F				;$BBBE1A
	EOR $1A					;$BBBE1D
	STA $3180,x				;$BBBE1F
	DEX					;$BBBE22
	DEX					;$BBBE23
	BPL.b CODE_BBBE03			;$BBBE24
	RTS					;$BBBE26

UNK_BBBE27:
	db $20

CODE_BBBE28:
	ASL					;$BBBE28
	ASL					;$BBBE29
	ASL					;$BBBE2A
	ASL					;$BBBE2B
	ADC $3E					;$BBBE2C
	ASL					;$BBBE2E
	ADC #$0008				;$BBBE2F
	STA $045E				;$BBBE32
	PLY					;$BBBE35
	RTS					;$BBBE36

CODE_BBBE37:
	LDA $0000,y				;$BBBE37
	CLC					;$BBBE3A
	ADC $0001,y				;$BBBE3B
	ADC $0003,y				;$BBBE3E
	ADC $0008,y				;$BBBE41
	ADC $000A,y				;$BBBE44
	ADC $000C,y				;$BBBE47
	STA $3E					;$BBBE4A
	STZ $3F					;$BBBE4C
	TDC					;$BBBE4E
	LDA $0000,y				;$BBBE4F
	ADC $0008,y				;$BBBE52
	ASL					;$BBBE55
	ASL					;$BBBE56
	ADC $0001,y				;$BBBE57
	ADC $0003,y				;$BBBE5A
	ADC $000A,y				;$BBBE5D
	ADC $000C,y				;$BBBE60
	PLB					;$BBBE63
	REP #$20				;$BBBE64
	ASL					;$BBBE66
	ASL					;$BBBE67
	ASL					;$BBBE68
	ASL					;$BBBE69
	ADC $3E					;$BBBE6A
	ASL					;$BBBE6C
	ADC #$000E				;$BBBE6D
	PLY					;$BBBE70
	RTS					;$BBBE71

CODE_BBBE72:
	LDA $0775				;$BBBE72
	BIT #$4000				;$BBBE75
	BNE CODE_BBBE92				;$BBBE78
	BIT #$2000				;$BBBE7A
	BNE CODE_BBBE9B				;$BBBE7D
	BIT #$1000				;$BBBE7F
	BNE CODE_BBBEA7				;$BBBE82
	BIT #$8000				;$BBBE84
	BEQ CODE_BBBE91				;$BBBE87
	LDA current_world			;$BBBE89
	CMP #!world_krematoa			;$BBBE8C
	BEQ CODE_BBBEB0				;$BBBE8F
CODE_BBBE91:
	RTL					;$BBBE91

CODE_BBBE92:
	%pea_shift_dbr($BE7E00)			;$BBBE92
	PLB					;$BBBE95
	JSR CODE_BBBEB9				;$BBBE96
	PLB					;$BBBE99
	RTL					;$BBBE9A

CODE_BBBE9B:
	%pea_shift_dbr($BE7E00)			;$BBBE9B
	PLB					;$BBBE9E
	JSR CODE_BBBF76				;$BBBE9F
	JSR CODE_BBBF89				;$BBBEA2
	PLB					;$BBBEA5
	RTL					;$BBBEA6

CODE_BBBEA7:
	%pea_shift_dbr($BE7E00)			;$BBBEA7
	PLB					;$BBBEAA
	JSR CODE_BBBFA2				;$BBBEAB
	PLB					;$BBBEAE
	RTL					;$BBBEAF

CODE_BBBEB0:
	%pea_shift_dbr($BE7E00)			;$BBBEB0
	PLB					;$BBBEB3
	JSR CODE_BBBFFF				;$BBBEB4
	PLB					;$BBBEB7
	RTL					;$BBBEB8

CODE_BBBEB9:
	LDY #$0DAA				;$BBBEB9
CODE_BBBEBC:
	TYX					;$BBBEBC
	LDA.l dixie_sprite_palettes+$15,x	;$BBBEBD
	STA $000022				;$BBBEC1
	STA $3A					;$BBBEC5
	AND #$001F				;$BBBEC7
	STA $3C					;$BBBECA
	LDA $3A					;$BBBECC
	LSR					;$BBBECE
	LSR					;$BBBECF
	LSR					;$BBBED0
	LSR					;$BBBED1
	LSR					;$BBBED2
	AND #$001F				;$BBBED3
	CLC					;$BBBED6
	ADC $3C					;$BBBED7
	STA $3C					;$BBBED9
	LDA $3B					;$BBBEDB
	LSR					;$BBBEDD
	AND #$001F				;$BBBEDE
	CLC					;$BBBEE1
	ADC $3C					;$BBBEE2
	ASL					;$BBBEE4
	TAX					;$BBBEE5
	LDA.l DATA_FD41EC,x			;$BBBEE6
	STA $000024				;$BBBEEA
	LDA #$000E				;$BBBEEE
	STA $3E					;$BBBEF1
	LDA #$0012				;$BBBEF3
	STA $40					;$BBBEF6
	JSR CODE_BBBF03				;$BBBEF8
	STA $3180,y				;$BBBEFB
	DEY					;$BBBEFE
	DEY					;$BBBEFF
	BPL CODE_BBBEBC				;$BBBF00
	RTS					;$BBBF02

CODE_BBBF03:
	LDX $24					;$BBBF03
	LDA $22					;$BBBF05
	JSR CODE_BBBF38				;$BBBF07
	STA $26					;$BBBF0A
	LDA $24					;$BBBF0C
	LSR					;$BBBF0E
	LSR					;$BBBF0F
	LSR					;$BBBF10
	LSR					;$BBBF11
	LSR					;$BBBF12
	TAX					;$BBBF13
	LDA $22					;$BBBF14
	LSR					;$BBBF16
	LSR					;$BBBF17
	LSR					;$BBBF18
	LSR					;$BBBF19
	LSR					;$BBBF1A
	JSR CODE_BBBF38				;$BBBF1B
	ASL					;$BBBF1E
	ASL					;$BBBF1F
	ASL					;$BBBF20
	ASL					;$BBBF21
	ASL					;$BBBF22
	TSB $26					;$BBBF23
	LDA $25					;$BBBF25
	LSR					;$BBBF27
	LSR					;$BBBF28
	TAX					;$BBBF29
	LDA $23					;$BBBF2A
	LSR					;$BBBF2C
	LSR					;$BBBF2D
	JSR CODE_BBBF38				;$BBBF2E
	ASL					;$BBBF31
	ASL					;$BBBF32
	TSB $27					;$BBBF33
	LDA $26					;$BBBF35
	RTS					;$BBBF37

CODE_BBBF38:
	SEP #$20				;$BBBF38
	AND #$1F				;$BBBF3A
	STA.l CPU.multiply_A			;$BBBF3C
	LDA $3E					;$BBBF40
	STA.l CPU.multiply_B			;$BBBF42
	LDA ($00)				;$BBBF46
	REP #$20				;$BBBF48
	LDA.l CPU.multiply_result		;$BBBF4A
	STA $3A					;$BBBF4E
	SEP #$20				;$BBBF50
	LDA $40					;$BBBF52
	STA.l CPU.multiply_A			;$BBBF54
	TXA					;$BBBF58
	AND #$1F				;$BBBF59
	STA.l CPU.multiply_B			;$BBBF5B
	REP #$20				;$BBBF5F
	LDA $3A					;$BBBF61
	CLC					;$BBBF63
	ADC.l CPU.multiply_result		;$BBBF64
	LSR					;$BBBF68
	LSR					;$BBBF69
	LSR					;$BBBF6A
	LSR					;$BBBF6B
	LSR					;$BBBF6C
	CMP #$001F				;$BBBF6D
	BCC CODE_BBBF75				;$BBBF70
	LDA #$001F				;$BBBF72
CODE_BBBF75:
	RTS					;$BBBF75

CODE_BBBF76:
	LDX #$0DAA				;$BBBF76
CODE_BBBF79:
	LDA dixie_sprite_palettes+$15,x		;$BBBF79
	LSR					;$BBBF7D
	AND #$3DEF				;$BBBF7E
	STA $3180,x				;$BBBF81
	DEX					;$BBBF84
	DEX					;$BBBF85
	BPL CODE_BBBF79				;$BBBF86
	RTS					;$BBBF88

CODE_BBBF89:
	LDX #$0454				;$BBBF89
CODE_BBBF8C:
	LDA.l dixie_sprite_palettes+$15,x	;$BBBF8C
	CMP #$7FFF				;$BBBF90
	BEQ CODE_BBBF9A				;$BBBF93
CODE_BBBF95:
	DEX					;$BBBF95
	DEX					;$BBBF96
	BPL CODE_BBBF8C				;$BBBF97
	RTS					;$BBBF99

CODE_BBBF9A:
	LDA #$6318				;$BBBF9A
	STA $3180,x				;$BBBF9D
	BRA CODE_BBBF95				;$BBBFA0

CODE_BBBFA2:
	LDX #$0DAA				;$BBBFA2
CODE_BBBFA5:
	LDA.l dixie_sprite_palettes+$15,x	;$BBBFA5
	EOR #$7FFF				;$BBBFA9
	STA $1A					;$BBBFAC
	AND #$001F				;$BBBFAE
	STA $1E					;$BBBFB1
	LSR					;$BBBFB3
	LSR					;$BBBFB4
	CLC					;$BBBFB5
	ADC $1E					;$BBBFB6
	SEC					;$BBBFB8
	SBC #$0007				;$BBBFB9
	BPL CODE_BBBFC1				;$BBBFBC
	LDA #$0000				;$BBBFBE
CODE_BBBFC1:
	STA $1C					;$BBBFC1
	LDA $1A					;$BBBFC3
	AND #$03E0				;$BBBFC5
	STA $1E					;$BBBFC8
	LSR					;$BBBFCA
	LSR					;$BBBFCB
	CLC					;$BBBFCC
	ADC $1E					;$BBBFCD
	SEC					;$BBBFCF
	SBC #$00E0				;$BBBFD0
	BPL CODE_BBBFD8				;$BBBFD3
	LDA #$0000				;$BBBFD5
CODE_BBBFD8:
	AND #$03E0				;$BBBFD8
	TSB $1C					;$BBBFDB
	LDA $1A					;$BBBFDD
	AND #$7C00				;$BBBFDF
	STA $1E					;$BBBFE2
	LSR					;$BBBFE4
	LSR					;$BBBFE5
	CLC					;$BBBFE6
	ADC $1E					;$BBBFE7
	SEC					;$BBBFE9
	SBC #$1C00				;$BBBFEA
	BPL CODE_BBBFF2				;$BBBFED
	LDA #$0000				;$BBBFEF
CODE_BBBFF2:
	AND #$7C00				;$BBBFF2
	ORA $1C					;$BBBFF5
	STA $3180,x				;$BBBFF7
	DEX					;$BBBFFA
	DEX					;$BBBFFB
	BPL CODE_BBBFA5				;$BBBFFC
	RTS					;$BBBFFE

CODE_BBBFFF:
	LDX #$0DAA				;$BBBFFF
CODE_BBC002:
	LDA.l dixie_sprite_palettes+$15,x	;$BBC002
	STA $1A					;$BBC006
	AND #$000F				;$BBC008
	CLC					;$BBC00B
	ADC #$0006				;$BBC00C
	CMP #$000F				;$BBC00F
	BCC CODE_BBC017				;$BBC012
	LDA #$000F				;$BBC014
CODE_BBC017:
	EOR $1A					;$BBC017
	AND #$000F				;$BBC019
	EOR $1A					;$BBC01C
	STA $3180,x				;$BBC01E
	DEX					;$BBC021
	DEX					;$BBC022
	BPL CODE_BBC002				;$BBC023
	RTS					;$BBC025

if !include_garbage_data == 1
	incsrc "data/garbage_data/ADDR_BBC026.asm"
else
	padbyte $00 : pad $BBC800
endif	

org $BBC800
CODE_BBC800:
	JMP CODE_BBD42A				;$BBC800

CODE_BBC803:
	JMP CODE_BBD64E				;$BBC803

CODE_BBC806:
	JMP CODE_BBD650				;$BBC806

CODE_BBC809:
	JMP CODE_BBD68C				;$BBC809

CODE_BBC80C:
	JMP CODE_BBCA6F				;$BBC80C

CODE_BBC80F:
	JMP CODE_BBCB24				;$BBC80F

CODE_BBC812:
	JMP CODE_BBD046				;$BBC812

CODE_BBC815:
	JMP kong_letters_main			;$BBC815

CODE_BBC818:
	JMP bananas_main			;$BBC818

CODE_BBC81B:
	JMP bear_coin_main			;$BBC81B

CODE_BBC81E:
	JMP bonus_coin_main			;$BBC81E

CODE_BBC821:
	JMP CODE_BBCAE0				;$BBC821

CODE_BBC824:
	JMP unknown_sprite_0288_main		;$BBC824

CODE_BBC827:
	JSL CODE_BBAB52				;$BBC827
	JML [$04F5]				;$BBC82B

level_end_flagpole_main:
	LDA.w sprite.sub_state,y		;$BBC82E
	AND #$00FF				;$BBC831
	ASL					;$BBC834
	TAX					;$BBC835
	JMP (.state_table,x)			;$BBC836

.state_table:
	dw CODE_BBC843
	dw CODE_BBC88A
	dw CODE_BBC939
	dw CODE_BBC956
	dw CODE_BBC96A

CODE_BBC843:
	LDA.w sprite.x_position,y		;$BBC843
	STA.w sprite.unknown_54,y		;$BBC846
	STA.w sprite.unknown_2C,y		;$BBC849
	LDA.w sprite.y_position,y		;$BBC84C
	STA.w sprite.unknown_56,y		;$BBC84F
	STA.w sprite.unknown_32,y		;$BBC852
	LDA #$800A				;$BBC855
	STA.w sprite.visibility,y		;$BBC858
	JSR CODE_BBC982				;$BBC85B
	LDX parent_level_number			;$BBC85E
	LDA $0632,x				;$BBC861
	LDY #$0032				;$BBC864
	BIT #$0002				;$BBC867
	BEQ CODE_BBC877				;$BBC86A
	LDY #$0034				;$BBC86C
	BIT #$0040				;$BBC86F
	BEQ CODE_BBC877				;$BBC872
	LDY #$0036				;$BBC874
CODE_BBC877:
	JSL CODE_BB8585				;$BBC877
	BCS CODE_BBC887				;$BBC87B
	LDX current_sprite			;$BBC87D
	LDY alternate_sprite			;$BBC87F
	STX sprite.general_purpose_5C,y		;$BBC881
	STY sprite.general_purpose_5C,x		;$BBC883
	INC sprite.sub_state,x			;$BBC885
CODE_BBC887:
	JML [$04F5]				;$BBC887

CODE_BBC88A:
	TYX					;$BBC88A
	LDA #$0040				;$BBC88B
	AND sprite.carry_or_defeated_flags,x	;$BBC88E
	STZ sprite.carry_or_defeated_flags,x	;$BBC890
	BNE CODE_BBC897				;$BBC892
	JMP CODE_BBC915				;$BBC894

CODE_BBC897:
	LDA parent_level_number			;$BBC897
	CMP #!level_riverside_race		;$BBC89A
	BNE CODE_BBC8C7				;$BBC89D
	LDA $0630				;$BBC89F
	CMP $0536				;$BBC8A2
	BEQ CODE_BBC8AB				;$BBC8A5
	BCC CODE_BBC8C1				;$BBC8A7
	BRA CODE_BBC8B3				;$BBC8A9

CODE_BBC8AB:
	LDA $062F				;$BBC8AB
	CMP $0535				;$BBC8AE
	BCC CODE_BBC8C1				;$BBC8B1
CODE_BBC8B3:
	LDA $0536				;$BBC8B3
	CMP #$0115				;$BBC8B6
	BCS CODE_BBC8BE				;$BBC8B9
	JSR CODE_BBC924				;$BBC8BB
CODE_BBC8BE:
	JSR CODE_BBC92C				;$BBC8BE
CODE_BBC8C1:
	LDA #$0003				;$BBC8C1
	STA $0533				;$BBC8C4
CODE_BBC8C7:
	LDA #$0004				;$BBC8C7
	JSL CODE_B2800F				;$BBC8CA
	LDA #$074D				;$BBC8CE
	JSL CODE_B28018				;$BBC8D1
	LDX current_sprite			;$BBC8D5
	LDA sprite.general_purpose_5E,x		;$BBC8D7
	BEQ CODE_BBC907				;$BBC8D9
	LDY #$007E				;$BBC8DB
	LDX parent_level_number			;$BBC8DE
	LDA $0632,x				;$BBC8E1
	AND #$0002				;$BBC8E4
	BEQ CODE_BBC8EC				;$BBC8E7
	LDY #$0080				;$BBC8E9
CODE_BBC8EC:
	JSL CODE_BB8585				;$BBC8EC
	LDA #$0518				;$BBC8F0
	JSL CODE_B28018				;$BBC8F3
	LDA #$0217				;$BBC8F7
	JSL CODE_B28018				;$BBC8FA
	LDA #$0119				;$BBC8FE
	JSL CODE_B28018				;$BBC901
	LDX current_sprite			;$BBC905
CODE_BBC907:
	INC sprite.sub_state,x			;$BBC907
	LDA #$8000				;$BBC909
	TSB $044A				;$BBC90C
CODE_BBC90F:
	JSR CODE_BBC982				;$BBC90F
	JML [$04F5]				;$BBC912

CODE_BBC915:
	LDA #$0003				;$BBC915
	JSL CODE_BEC00F				;$BBC918
	BCS CODE_BBC90F				;$BBC91C
	JSR CODE_BBC982				;$BBC91E
	JMP CODE_BBC973				;$BBC921

CODE_BBC924:
	LDY #$035E				;$BBC924
	JSL CODE_BB85B5				;$BBC927
	RTS					;$BBC92B

CODE_BBC92C:
	LDA $0535				;$BBC92C
	STA $062F				;$BBC92F
	LDA $0536				;$BBC932
	STA $0630				;$BBC935
	RTS					;$BBC938

CODE_BBC939:
	TYX					;$BBC939
	LDY sprite.general_purpose_5C,x		;$BBC93A
	LDA sprite.animation_address,x		;$BBC93C
	LSR					;$BBC93E
	STA.w sprite.general_purpose_5E,y	;$BBC93F
	DEC sprite.animation_address,x		;$BBC942
	BNE CODE_BBC950				;$BBC944
	INC sprite.sub_state,x			;$BBC946
	LDY sprite.general_purpose_5C,x		;$BBC948
	LDA #$0001				;$BBC94A
	STA.w sprite.general_purpose_5E,y	;$BBC94D
CODE_BBC950:
	JSR CODE_BBC982				;$BBC950
	JML [$04F5]				;$BBC953

CODE_BBC956:
	TYX					;$BBC956
	DEC sprite.general_purpose_60,x		;$BBC957
	BPL CODE_BBC96A				;$BBC959
	INC sprite.sub_state,x			;$BBC95B
	LDA #$001F				;$BBC95D
	STA timestop_flags			;$BBC960
	JSL CODE_B8807E				;$BBC963
	STZ $195B				;$BBC967
CODE_BBC96A:
	JSR CODE_BBC9E4				;$BBC96A
	JSR CODE_BBC982				;$BBC96D
	JML [$04F5]				;$BBC970

CODE_BBC973:
	JSL CODE_BBAB52				;$BBC973
	BCC CODE_BBC97F				;$BBC977
	LDY current_sprite			;$BBC979
	LDX sprite.general_purpose_5C,y		;$BBC97B
	STZ sprite.general_purpose_5C,x		;$BBC97D
CODE_BBC97F:
	JML [$04F5]				;$BBC97F

CODE_BBC982:
	LDX current_sprite			;$BBC982
	LDA sprite.animation_address,x		;$BBC984
	AND #$0003				;$BBC986
	CLC					;$BBC989
	ADC #$8182				;$BBC98A
	XBA					;$BBC98D
	STA sprite.unknown_58,x			;$BBC98E
	LDA sprite.animation_address,x		;$BBC990
	AND #$0004				;$BBC992
	LSR					;$BBC995
	CLC					;$BBC996
	ADC #$0022				;$BBC997
	XBA					;$BBC99A
	ORA #$0007				;$BBC99B
	STA sprite.general_purpose_68,x		;$BBC99E
	SEP #$20				;$BBC9A0
	LDA #$77				;$BBC9A2
	SEC					;$BBC9A4
	SBC sprite.animation_address,x		;$BBC9A5
	STA $1A					;$BBC9A7
	CLC					;$BBC9A9
	ADC #$08				;$BBC9AA
	STA sprite.general_purpose_6C-1,x	;$BBC9AC
	LDA $1A					;$BBC9AE
	LSR					;$BBC9B0
	LSR					;$BBC9B1
	LSR					;$BBC9B2
	LSR					;$BBC9B3
	STA sprite.general_purpose_6C,x		;$BBC9B4
	LDA #$00				;$BBC9B6
	ADC #$00				;$BBC9B8
	EOR #$01				;$BBC9BA
	ASL					;$BBC9BC
	ASL					;$BBC9BD
	ASL					;$BBC9BE
	STA sprite.general_purpose_62,x		;$BBC9BF
	REP #$20				;$BBC9C1
	LDY sprite.general_purpose_5C,x		;$BBC9C3
	BEQ CODE_BBC9E3				;$BBC9C5
	LDA sprite.animation_address,x		;$BBC9C7
	SEC					;$BBC9C9
	SBC #$005B				;$BBC9CA
	CLC					;$BBC9CD
	ADC sprite.y_position,x			;$BBC9CE
	STA.w sprite.y_position,y		;$BBC9D0
	LDA #$0008				;$BBC9D3
	BIT sprite.oam_property,x		;$BBC9D6
	BVC CODE_BBC9DD				;$BBC9D8
	LDA #$FFF8				;$BBC9DA
CODE_BBC9DD:
	CLC					;$BBC9DD
	ADC sprite.x_position,x			;$BBC9DE
	STA.w sprite.x_position,y		;$BBC9E0
CODE_BBC9E3:
	RTS					;$BBC9E3

CODE_BBC9E4:
	LDX current_sprite			;$BBC9E4
	LDA sprite.x_position,x			;$BBC9E6
	STA sprite.unknown_54,x			;$BBC9E8
	LDA sprite.y_position,x			;$BBC9EA
	STA sprite.unknown_56,x			;$BBC9EC
	LDA sprite.unknown_2C,x			;$BBC9EE
	STA sprite.x_position,x			;$BBC9F0
	LDA sprite.unknown_32,x			;$BBC9F2
	STA sprite.y_position,x			;$BBC9F4
	JSL process_current_movement		;$BBC9F6
	LDX current_sprite			;$BBC9FA
	LDA sprite.unknown_2C,x			;$BBC9FC
	LDY sprite.x_position,x			;$BBC9FE
	STA sprite.x_position,x			;$BBCA00
	STY sprite.unknown_2C,x			;$BBCA02
	LDA sprite.unknown_32,x			;$BBCA04
	LDY sprite.y_position,x			;$BBCA06
	STA sprite.y_position,x			;$BBCA08
	STY sprite.unknown_32,x			;$BBCA0A
	RTS					;$BBCA0C

level_end_flag_main:
	JMP (.state_table,x)			;$BBCA0D

.state_table:
	dw !null_pointer
	dw CODE_BBCA16
	dw CODE_BBCA21

CODE_BBCA16:
	LDA.w sprite.general_purpose_5E,y	;$BBCA16
	CMP.w sprite.general_purpose_60,y	;$BBCA19
	BEQ CODE_BBCA21				;$BBCA1C
	JSR CODE_BBCA33				;$BBCA1E
CODE_BBCA21:
	LDX sprite.general_purpose_5C,y		;$BBCA21
	BEQ CODE_BBCA2C				;$BBCA23
	JSL process_sprite_animation		;$BBCA25
	JML [$04F5]				;$BBCA29

CODE_BBCA2C:
	JSL delete_sprite_handle_deallocation	;$BBCA2C
	JML [$04F5]				;$BBCA30

CODE_BBCA33:
	STA.w sprite.general_purpose_60,y	;$BBCA33
	LDX sprite.general_purpose_62,y		;$BBCA36
	LDA current_kong			;$BBCA38
	BEQ CODE_BBCA3F				;$BBCA3B
	LDX sprite.general_purpose_64,y		;$BBCA3D
CODE_BBCA3F:
	LDA.w sprite.general_purpose_60,y	;$BBCA3F
	STZ $46					;$BBCA42
	LDY current_game_mode			;$BBCA44
	CPY #!gamemode_2_player_contest		;$BBCA47
	BNE CODE_BBCA58				;$BBCA4A
	LDY active_player			;$BBCA4C
	BEQ CODE_BBCA67				;$BBCA4F
	LDY #$001E				;$BBCA51
	STY $46					;$BBCA54
	BRA CODE_BBCA67				;$BBCA56

CODE_BBCA58:
	TAY					;$BBCA58
	LDA active_cheats			;$BBCA59
	BIT #$0040				;$BBCA5C
	BEQ CODE_BBCA66				;$BBCA5F
	LDA #$001E				;$BBCA61
	STA $46					;$BBCA64
CODE_BBCA66:
	TYA					;$BBCA66
CODE_BBCA67:
	LDY #$002B				;$BBCA67
	JSL CODE_BBCA6F				;$BBCA6A
	RTS					;$BBCA6E

CODE_BBCA6F:
	STA $3E					;$BBCA6F
	EOR #$FFFF				;$BBCA71
	SEC					;$BBCA74
	ADC #$0020				;$BBCA75
	STA $40					;$BBCA78
	TXA					;$BBCA7A
	ASL					;$BBCA7B
	TAX					;$BBCA7C
	LDA.l sprite_palette_table,x		;$BBCA7D
	CLC					;$BBCA81
	ADC $46					;$BBCA82
	STA $46					;$BBCA84
	TYA					;$BBCA86
	ASL					;$BBCA87
	TAX					;$BBCA88
	LDA.l sprite_palette_table,x		;$BBCA89
	STA $42					;$BBCA8D
	LDA #$00FD				;$BBCA8F
	STA $44					;$BBCA92
	STA $48					;$BBCA94
	LDA #$2F80				;$BBCA96
	STA $1A					;$BBCA99
	LDA #$007E				;$BBCA9B
	STA $1C					;$BBCA9E
	LDY #$001C				;$BBCAA0
CODE_BBCAA3:
	LDA [$42],y				;$BBCAA3
	STA $000022				;$BBCAA5
	LDA [$46],y				;$BBCAA9
	STA $000024				;$BBCAAB
	JSR CODE_BBCB43				;$BBCAAF
	DEY					;$BBCAB2
	DEY					;$BBCAB3
	BPL CODE_BBCAA3				;$BBCAB4
	LDA $E8					;$BBCAB6
	ASL					;$BBCAB8
	ASL					;$BBCAB9
	TAX					;$BBCABA
	LDA #$2F80				;$BBCABB
	STA palette_upload_ring_buffer,x	;$BBCABE
	LDY current_sprite			;$BBCAC1
	LDA.W sprite.oam_property+1,y		;$BBCAC3
	AND #$000E				;$BBCAC6
	ASL					;$BBCAC9
	ASL					;$BBCACA
	ASL					;$BBCACB
	CLC					;$BBCACC
	ADC #$0081				;$BBCACD
	XBA					;$BBCAD0
	ORA #$007E				;$BBCAD1
	STA palette_upload_ring_buffer+2,x	;$BBCAD4
	LDA $E8					;$BBCAD7
	INC					;$BBCAD9
	AND #$000F				;$BBCADA
	STA $E8					;$BBCADD
	RTL					;$BBCADF

CODE_BBCAE0:
	STA $3E					;$BBCAE0
	EOR #$FFFF				;$BBCAE2
	SEC					;$BBCAE5
	ADC #$0020				;$BBCAE6
	STA $40					;$BBCAE9
	TXA					;$BBCAEB
	ASL					;$BBCAEC
	TAX					;$BBCAED
	LDA.l DATA_FD54E9,x			;$BBCAEE
	STA $46					;$BBCAF2
	TYA					;$BBCAF4
	ASL					;$BBCAF5
	TAX					;$BBCAF6
	LDA.l DATA_FD54E9,x			;$BBCAF7
	STA $42					;$BBCAFB
	LDA #$00FD				;$BBCAFD
	STA $44					;$BBCB00
	STA $48					;$BBCB02
	LDA #$2F80				;$BBCB04
	STA $1A					;$BBCB07
	LDA #$007E				;$BBCB09
	STA.b $1C				;$BBCB0C
	LDY.b $1E				;$BBCB0E
CODE_BBCB10:
	LDA [$42],y				;$BBCB10
	STA $000022				;$BBCB12
	LDA [$46],y				;$BBCB16
	STA $000024				;$BBCB18
	JSR CODE_BBCB43				;$BBCB1C
	DEY					;$BBCB1F
	DEY					;$BBCB20
	BPL CODE_BBCB10				;$BBCB21
	RTL					;$BBCB23

CODE_BBCB24:
	STX $0022				;$BBCB24
	AND #$003F				;$BBCB27
	STA $3E					;$BBCB2A
	EOR #$FFFF				;$BBCB2C
	SEC					;$BBCB2F
	ADC #$0020				;$BBCB30
	STA $40					;$BBCB33
CODE_BBCB35:
	LDA [$42],y				;$BBCB35
	STA $000024				;$BBCB37
	JSR CODE_BBCB43				;$BBCB3B
	DEY					;$BBCB3E
	DEY					;$BBCB3F
	BPL CODE_BBCB35				;$BBCB40
	RTL					;$BBCB42

CODE_BBCB43:
	LDX $24					;$BBCB43
	LDA $22					;$BBCB45
	JSR CODE_BBCB7A				;$BBCB47
	STA $26					;$BBCB4A
	LDA $24					;$BBCB4C
	LSR					;$BBCB4E
	LSR					;$BBCB4F
	LSR					;$BBCB50
	LSR					;$BBCB51
	LSR					;$BBCB52
	TAX					;$BBCB53
	LDA $22					;$BBCB54
	LSR					;$BBCB56
	LSR					;$BBCB57
	LSR					;$BBCB58
	LSR					;$BBCB59
	LSR					;$BBCB5A
	JSR CODE_BBCB7A				;$BBCB5B
	ASL					;$BBCB5E
	ASL					;$BBCB5F
	ASL					;$BBCB60
	ASL					;$BBCB61
	ASL					;$BBCB62
	TSB $26					;$BBCB63
	LDA $25					;$BBCB65
	LSR					;$BBCB67
	LSR					;$BBCB68
	TAX					;$BBCB69
	LDA $23					;$BBCB6A
	LSR					;$BBCB6C
	LSR					;$BBCB6D
	JSR CODE_BBCB7A				;$BBCB6E
	ASL					;$BBCB71
	ASL					;$BBCB72
	TSB $27					;$BBCB73
	LDA $26					;$BBCB75
	STA [$1A],y				;$BBCB77
	RTS					;$BBCB79

CODE_BBCB7A:
	SEP #$20				;$BBCB7A
	AND #$1F				;$BBCB7C
	STA CPU.multiply_A			;$BBCB7E
	LDA $3E					;$BBCB81
	STA CPU.multiply_B			;$BBCB83
	LDA ($00)				;$BBCB86
	REP #$20				;$BBCB88
	LDA CPU.multiply_result			;$BBCB8A
	STA $3A					;$BBCB8D
	SEP #$20				;$BBCB8F
	LDA $40					;$BBCB91
	STA CPU.multiply_A			;$BBCB93
	TXA					;$BBCB96
	AND #$1F				;$BBCB97
	STA CPU.multiply_B			;$BBCB99
	REP #$20				;$BBCB9C
	LDA $3A					;$BBCB9E
	CLC					;$BBCBA0
	ADC CPU.multiply_result			;$BBCBA1
	LSR					;$BBCBA4
	LSR					;$BBCBA5
	LSR					;$BBCBA6
	LSR					;$BBCBA7
	LSR					;$BBCBA8
	CMP #$001F				;$BBCBA9
	BCC CODE_BBCBB1				;$BBCBAC
	LDA #$001F				;$BBCBAE
CODE_BBCBB1:
	RTS					;$BBCBB1

exit_door_main:
	JMP (.state_table,x)			;$BBCBB2

.state_table:
	dw CODE_BBCBB9
	dw CODE_BBCCA2

CODE_BBCBB9:
	LDA.w sprite.sub_state,y		;$BBCBB9
	AND #$00FF				;$BBCBBC
	ASL					;$BBCBBF
	TAX					;$BBCBC0
	JMP (DATA_BBCBC4,x)			;$BBCBC1

DATA_BBCBC4:
	dw CODE_BBCBCA
	dw CODE_BBCC08
	dw CODE_BBCC58

CODE_BBCBCA:
	TYX					;$BBCBCA
	INC sprite.sub_state,x			;$BBCBCB
	LDA sprite.general_purpose_5C,x		;$BBCBCD
	JSR CODE_BBCBFC				;$BBCBCF
	STA sprite.general_purpose_5C,x		;$BBCBD2
	LDA sprite.general_purpose_5E,x		;$BBCBD4
	JSR CODE_BBCBFC				;$BBCBD6
	STA sprite.general_purpose_5E,x		;$BBCBD9
	LDA sprite.general_purpose_60,x		;$BBCBDB
	JSR CODE_BBCBFC				;$BBCBDD
	STA sprite.general_purpose_60,x		;$BBCBE0
	LDA sprite.general_purpose_64-1,x	;$BBCBE2
	AND #$00FF				;$BBCBE4
	CLC					;$BBCBE7
	ADC sprite.y_position,x			;$BBCBE8
	STA sprite.general_purpose_64,x		;$BBCBEA
	LDA sprite.general_purpose_62,x		;$BBCBEC
	AND #$00FF				;$BBCBEE
	EOR #$FFFF				;$BBCBF1
	SEC					;$BBCBF4
	ADC sprite.y_position,x			;$BBCBF5
	STA sprite.general_purpose_62,x		;$BBCBF7
	JMP CODE_BBC827				;$BBCBF9

CODE_BBCBFC:
	BIT sprite.oam_property,x		;$BBCBFC
	BVS CODE_BBCC04				;$BBCBFE
	EOR #$FFFF				;$BBCC00
	INC					;$BBCC03
CODE_BBCC04:
	CLC					;$BBCC04
	ADC sprite.x_position,x			;$BBCC05
	RTS					;$BBCC07

CODE_BBCC08:
	JSR CODE_BBCC5B				;$BBCC08
	BCC CODE_BBCC1B				;$BBCC0B
	LDA.w sprite.x_position,y		;$BBCC0D
	CMP sprite.general_purpose_5E,x		;$BBCC10
	ROR $1A					;$BBCC12
	CMP sprite.x_position,x			;$BBCC14
	ROR					;$BBCC16
	EOR $1A					;$BBCC17
	BMI.b CODE_BBCC1E			;$BBCC19
CODE_BBCC1B:
	JMP CODE_BBC827				;$BBCC1B

CODE_BBCC1E:
	LDX follower_kong_sprite		;$BBCC1E
	LDA sprite.oam_property,x		;$BBCC21
	AND #$CFFF				;$BBCC23
	ORA #$2000				;$BBCC26
	STA sprite.oam_property,x		;$BBCC29
	LDX current_mount			;$BBCC2B
	BEQ CODE_BBCC39				;$BBCC2D
	LDA sprite.oam_property,x		;$BBCC2F
	AND #$CFFF				;$BBCC31
	ORA #$2000				;$BBCC34
	STA sprite.oam_property,x		;$BBCC37
CODE_BBCC39:
	LDA #$001D				;$BBCC39
	JSL CODE_B88069				;$BBCC3C
	BCS CODE_BBCC55				;$BBCC40
	LDX current_sprite			;$BBCC42
	LDA sprite.general_purpose_4C,x		;$BBCC44
	STA $17CA				;$BBCC46
	LDA sprite.general_purpose_60,x		;$BBCC49
	STA $17CC				;$BBCC4B
	LDA sprite.y_position,x			;$BBCC4E
	STA $17CE				;$BBCC50
	INC sprite.sub_state,x			;$BBCC53
CODE_BBCC55:
	JML [$04F5]				;$BBCC55

CODE_BBCC58:
	JML [$04F5]				;$BBCC58

CODE_BBCC5B:
	LDY current_mount			;$BBCC5B
	BEQ CODE_BBCC62				;$BBCC5D
	JSR CODE_BBCC6B				;$BBCC5F
CODE_BBCC62:
	LDY follower_kong_sprite		;$BBCC62
	JSR CODE_BBCC6B				;$BBCC65
	LDY active_kong_sprite			;$BBCC68
CODE_BBCC6B:
	LDX current_sprite			;$BBCC6B
	LDA.w sprite.x_position,y		;$BBCC6D
	CMP sprite.general_purpose_5C,x		;$BBCC70
	ROR $1A					;$BBCC72
	CMP sprite.x_position,x			;$BBCC74
	ROR					;$BBCC76
	EOR $1A					;$BBCC77
	BPL CODE_BBCC97				;$BBCC79
	LDA.w sprite.y_position,y		;$BBCC7B
	CMP sprite.general_purpose_62,x		;$BBCC7E
	ROR $1A					;$BBCC80
	CMP sprite.general_purpose_64,x		;$BBCC82
	ROR					;$BBCC84
	EOR $1A					;$BBCC85
	BPL CODE_BBCC97				;$BBCC87
	LDA.w sprite.oam_property,y		;$BBCC89
	AND #$CFFF				;$BBCC8C
	ORA #$2000				;$BBCC8F
	STA.w sprite.oam_property,y		;$BBCC92
	SEC					;$BBCC95
	RTS					;$BBCC96

CODE_BBCC97:
	LDA.w sprite.oam_property,y		;$BBCC97
	ORA #$3000				;$BBCC9A
	STA.w sprite.oam_property,y		;$BBCC9D
	CLC					;$BBCCA0
	RTS					;$BBCCA1

CODE_BBCCA2:
	JML [$04F5]				;$BBCCA2

;Unreferenced  state table (unused sprite?)
DATA_BBCCA5:
	dw CODE_BBCCAB
	dw CODE_BBCCBF
	dw CODE_BBCCE8

CODE_BBCCAB:
	TYX					;$BBCCAB
	LDA sprite.general_purpose_5C,x		;$BBCCAC
	CLC					;$BBCCAE
	ADC sprite.x_position,x			;$BBCCAF
	STA sprite.general_purpose_5C,x		;$BBCCB1
	LDA sprite.general_purpose_5E,x		;$BBCCB3
	CLC					;$BBCCB5
	ADC sprite.y_position,x			;$BBCCB6
	STA sprite.general_purpose_5E,x		;$BBCCB8
	INC sprite.state,x			;$BBCCBA
	JMP CODE_BBC827				;$BBCCBC

CODE_BBCCBF:
	TYX					;$BBCCBF
	LDY active_kong_sprite			;$BBCCC0
	LDA.w sprite.x_position,y		;$BBCCC3
	CMP sprite.general_purpose_5C,x		;$BBCCC6
	BIT sprite.oam_property,x		;$BBCCC8
	BVC CODE_BBCCD0				;$BBCCCA
	BCS CODE_BBCCD4				;$BBCCCC
	BRA CODE_BBCCD7				;$BBCCCE

CODE_BBCCD0:
	BCC CODE_BBCCD4				;$BBCCD0
	BRA CODE_BBCCD7				;$BBCCD2

CODE_BBCCD4:
	JMP CODE_BBC827				;$BBCCD4

CODE_BBCCD7:
	LDX current_sprite			;$BBCCD7
	INC sprite.state,x			;$BBCCD9
	LDA #$001F				;$BBCCDB
	STA timestop_flags			;$BBCCDE
	JSL CODE_B8807E				;$BBCCE1
	JML [$04F5]				;$BBCCE5

CODE_BBCCE8:
	JML [$04F5]				;$BBCCE8

kong_letters_main:
	JMP (.state_table,x)			;$BBCCEB

.state_table:
	dw CODE_BBCCFC
	dw CODE_BBCD71
	dw CODE_BBCD7C
	dw CODE_BBCDD2
	dw CODE_BBCE2E
	dw CODE_BBCE6B
	dw CODE_BBCEFE

CODE_BBCCFC:
	LDA.w sprite.general_purpose_66,y	;$BBCCFC
	AND kong_letter_flags			;$BBCCFF
	BEQ CODE_BBCD0B				;$BBCD02
	JSL CODE_BB8597				;$BBCD04
	JML [$04F5]				;$BBCD08

CODE_BBCD0B:
	JSL process_sprite_animation		;$BBCD0B
	JSL populate_sprite_clipping		;$BBCD0F
	JSL CODE_BEC012				;$BBCD13
	BCS CODE_BBCD1C				;$BBCD17
	JMP CODE_BBC827				;$BBCD19

CODE_BBCD1C:
	LDA sprite.oam_property,x		;$BBCD1C
	ORA #$3000				;$BBCD1E
	STA sprite.oam_property,x		;$BBCD21
	TXA					;$BBCD23
	CLC					;$BBCD24
	ADC sprite.general_purpose_64,x		;$BBCD25
	TAY					;$BBCD27
	LDA $0000,y				;$BBCD28
	EOR sprite.unknown_56+1,x		;$BBCD2B
	AND #$00FF				;$BBCD2D
	EOR sprite.unknown_56+1,x		;$BBCD30
	JSL CODE_BBD64E				;$BBCD32
	INC sprite.state,x			;$BBCD36
	LDA sprite.general_purpose_66,x		;$BBCD38
	TSB kong_letter_flags			;$BBCD3A
	LDA kong_letter_flags			;$BBCD3D
	INC					;$BBCD40
	AND #$000F				;$BBCD41
	STA sprite.movement_state,x		;$BBCD44
	BNE CODE_BBCD4F				;$BBCD46
	LDA #$0001				;$BBCD48
	JSL CODE_B88084				;$BBCD4B
CODE_BBCD4F:
	LDA sprite.general_purpose_68,x		;$BBCD4F
	JSL queue_sound_effect			;$BBCD51
	LDX current_sprite			;$BBCD55
	LDA kong_letter_flags			;$BBCD57
	LSR					;$BBCD5A
	BCS CODE_BBCD5F				;$BBCD5B
	STZ sprite.general_purpose_5C,x		;$BBCD5D
CODE_BBCD5F:
	LSR					;$BBCD5F
	BCS CODE_BBCD64				;$BBCD60
	STZ sprite.general_purpose_5E,x		;$BBCD62
CODE_BBCD64:
	LSR					;$BBCD64
	BCS CODE_BBCD69				;$BBCD65
	STZ sprite.general_purpose_60,x		;$BBCD67
CODE_BBCD69:
	LSR					;$BBCD69
	BCS CODE_BBCD6E				;$BBCD6A
	STZ sprite.general_purpose_62,x		;$BBCD6C
CODE_BBCD6E:
	JML [$04F5]				;$BBCD6E

CODE_BBCD71:
	JSL process_sprite_animation		;$BBCD71
	JSL CODE_BBD68C				;$BBCD75
	JML [$04F5]				;$BBCD79

CODE_BBCD7C:
	JSL CODE_BBD68C				;$BBCD7C
	LDA #DATA_FC2D40			;$BBCD80
	STA $1A					;$BBCD83
	LDA.w #DATA_FC2D40>>16			;$BBCD85
	STA $1C					;$BBCD88
	LDA #$0008				;$BBCD8A
	STA $1D					;$BBCD8D
	LDX current_sprite			;$BBCD8F
	LDA sprite.oam_property,x		;$BBCD91
	AND #$01E0				;$BBCD93
	JSL CODE_B78009				;$BBCD96
	BCS CODE_BBCDC2				;$BBCD9A
	LDA #DATA_FC2D40+$0100			;$BBCD9C
	STA $1A					;$BBCD9F
	LDA.w #(DATA_FC2D40+$0100)>>16		;$BBCDA1
	STA $1C					;$BBCDA4
	LDA #$0008				;$BBCDA6
	STA $1D					;$BBCDA9
	LDA sprite.oam_property,x		;$BBCDAB
	AND #$01E0				;$BBCDAD
	ORA #$0010				;$BBCDB0
	JSL CODE_B78009				;$BBCDB3
	BCC CODE_BBCDC5				;$BBCDB7
	LDA $155E				;$BBCDB9
	SBC #$0008				;$BBCDBC
	STA $155E				;$BBCDBF
CODE_BBCDC2:
	JML [$04F5]				;$BBCDC2

CODE_BBCDC5:
	LDX current_sprite			;$BBCDC5
	STX $18DD				;$BBCDC7
	LDA #$C000				;$BBCDCA
	STA sprite.visibility,x			;$BBCDCD
	INC sprite.state,x			;$BBCDCF
	TXY					;$BBCDD1
CODE_BBCDD2:
	TYX					;$BBCDD2
	LDY #$0003				;$BBCDD3
	STZ $3E					;$BBCDD6
	LDA sprite.unknown_58,x			;$BBCDD8
	STA $40					;$BBCDDA
	SEP #$20				;$BBCDDC
CODE_BBCDDE:
	LDA sprite.general_purpose_5C,x		;$BBCDDE
	BEQ CODE_BBCDEE				;$BBCDE0
	LDA sprite.general_purpose_5C+1,x	;$BBCDE2
	CMP $40					;$BBCDE4
	BEQ CODE_BBCDEE				;$BBCDE6
	INC sprite.general_purpose_5C+1,x	;$BBCDE8
	INC sprite.general_purpose_5C+1,x	;$BBCDEA
	INC $3E					;$BBCDEC
CODE_BBCDEE:
	INX					;$BBCDEE
	INX					;$BBCDEF
	DEY					;$BBCDF0
	BPL CODE_BBCDDE				;$BBCDF1
	REP #$20				;$BBCDF3
	JSL CODE_BBD68C				;$BBCDF5
	BMI CODE_BBCDFD				;$BBCDF9
	INC $3E					;$BBCDFB
CODE_BBCDFD:
	TXA					;$BBCDFD
	CLC					;$BBCDFE
	ADC sprite.general_purpose_64,x		;$BBCDFF
	TAY					;$BBCE01
	SEP #$20				;$BBCE02
	LDA sprite.y_position,x			;$BBCE04
	XBA					;$BBCE06
	LDA sprite.x_position,x			;$BBCE07
	REP #$20				;$BBCE09
	STA $0000,y				;$BBCE0B
	LDA $3E					;$BBCE0E
	BNE CODE_BBCE2B				;$BBCE10
	INC sprite.state,x			;$BBCE12
	LDA sprite.movement_state,x		;$BBCE14
	BNE CODE_BBCE2B				;$BBCE16
	INC sprite.state,x			;$BBCE18
	STZ sprite.general_purpose_6C,x		;$BBCE1A
	LDA #$0003				;$BBCE1C
CODE_BBCE1F:
	SEC					;$BBCE1F
	LDY #$20E8				;$BBCE20
	PHA					;$BBCE23
	JSR CODE_BBCF16				;$BBCE24
	PLA					;$BBCE27
	DEC					;$BBCE28
	BPL CODE_BBCE1F				;$BBCE29
CODE_BBCE2B:
	JML [$04F5]				;$BBCE2B

CODE_BBCE2E:
	TYX					;$BBCE2E
	DEC sprite.general_purpose_6C,x		;$BBCE2F
	BPL CODE_BBCE68				;$BBCE31
	TYX					;$BBCE33
	LDY #$0003				;$BBCE34
	STZ $3E					;$BBCE37
	LDA sprite.unknown_58+1,x		;$BBCE39
	STA $40					;$BBCE3B
	SEP #$20				;$BBCE3D
CODE_BBCE3F:
	LDA sprite.general_purpose_5C,x		;$BBCE3F
	BEQ CODE_BBCE4F				;$BBCE41
	LDA sprite.general_purpose_5C+1,x	;$BBCE43
	CMP $40					;$BBCE45
	BEQ CODE_BBCE4F				;$BBCE47
	DEC sprite.general_purpose_5C+1,x	;$BBCE49
	DEC sprite.general_purpose_5C+1,x	;$BBCE4B
	INC $3E					;$BBCE4D
CODE_BBCE4F:
	INX					;$BBCE4F
	INX					;$BBCE50
	DEY					;$BBCE51
	BPL CODE_BBCE3F				;$BBCE52
	REP #$20				;$BBCE54
	LDA $3E					;$BBCE56
	BNE CODE_BBCE68				;$BBCE58
	LDA current_sprite			;$BBCE5A
	CMP $18DD				;$BBCE5C
	BNE CODE_BBCE64				;$BBCE5F
	STZ $18DD				;$BBCE61
CODE_BBCE64:
	JSL CODE_BB8597				;$BBCE64
CODE_BBCE68:
	JML [$04F5]				;$BBCE68

CODE_BBCE6B:
	LDA #$0078				;$BBCE6B
	STA hud_lives_display_timer		;$BBCE6E
	LDX current_sprite			;$BBCE71
	INC sprite.general_purpose_6C,x		;$BBCE73
	LDA sprite.general_purpose_6C,x		;$BBCE75
	CMP #$002F				;$BBCE77
	BCS CODE_BBCE95				;$BBCE7A
	BIT #$0008				;$BBCE7C
	BEQ CODE_BBCE8B				;$BBCE7F
	LDA sprite.oam_property,x		;$BBCE81
	AND #$7FFF				;$BBCE83
	STA sprite.oam_property,x		;$BBCE86
	JML [$04F5]				;$BBCE88

CODE_BBCE8B:
	LDA sprite.oam_property,x		;$BBCE8B
	ORA #$8000				;$BBCE8D
	STA sprite.oam_property,x		;$BBCE90
	JML [$04F5]				;$BBCE92

CODE_BBCE95:
	BEQ CODE_BBCEE6				;$BBCE95
	CMP #$004B				;$BBCE97
	BCC CODE_BBCEED				;$BBCE9A
	BEQ CODE_BBCED4				;$BBCE9C
	CMP #$0067				;$BBCE9E
	BCC CODE_BBCEDB				;$BBCEA1
	BEQ CODE_BBCEC2				;$BBCEA3
	CMP #$0083				;$BBCEA5
	BCC CODE_BBCEC9				;$BBCEA8
	BNE CODE_BBCEB3				;$BBCEAA
	LDA #$0713				;$BBCEAC
	JSL queue_sound_effect			;$BBCEAF
CODE_BBCEB3:
	LDA #$0003				;$BBCEB3
	CLC					;$BBCEB6
	JSR CODE_BBCF16				;$BBCEB7
	BPL CODE_BBCEC9				;$BBCEBA
	LDX current_sprite			;$BBCEBC
	INC sprite.state,x			;$BBCEBE
	BRA CODE_BBCEF6				;$BBCEC0

CODE_BBCEC2:
	LDA #$0712				;$BBCEC2
	JSL queue_sound_effect			;$BBCEC5
CODE_BBCEC9:
	LDA #$0002				;$BBCEC9
	CLC					;$BBCECC
	JSR CODE_BBCF16				;$BBCECD
	BPL CODE_BBCEDB				;$BBCED0
	BRA CODE_BBCEF6				;$BBCED2

CODE_BBCED4:
	LDA #$0711				;$BBCED4
	JSL queue_sound_effect			;$BBCED7
CODE_BBCEDB:
	LDA #$0001				;$BBCEDB
	CLC					;$BBCEDE
	JSR CODE_BBCF16				;$BBCEDF
	BPL CODE_BBCEED				;$BBCEE2
	BRA CODE_BBCEF6				;$BBCEE4

CODE_BBCEE6:
	LDA #$0710				;$BBCEE6
	JSL queue_sound_effect			;$BBCEE9
CODE_BBCEED:
	LDA #$0000				;$BBCEED
	CLC					;$BBCEF0
	JSR CODE_BBCF16				;$BBCEF1
	BPL CODE_BBCEFB				;$BBCEF4
CODE_BBCEF6:
	LDA #$0000				;$BBCEF6
	STA ($1A)				;$BBCEF9
CODE_BBCEFB:
	JML [$04F5]				;$BBCEFB

CODE_BBCEFE:
	JSL CODE_BB8597				;$BBCEFE
	LDA #$0001				;$BBCF02
	JSL CODE_B88087				;$BBCF05
	LDX current_sprite			;$BBCF09
	CPX $18DD				;$BBCF0B
	BNE CODE_BBCF13				;$BBCF0E
	STZ $18DD				;$BBCF10
CODE_BBCF13:
	JML [$04F5]				;$BBCF13

CODE_BBCF16:
	BCC CODE_BBCF32				;$BBCF16
	PHY					;$BBCF18
	JSR CODE_BBCF73				;$BBCF19
	LDA ($1A)				;$BBCF1C
	AND #$00FF				;$BBCF1E
	XBA					;$BBCF21
	STA ($1C)				;$BBCF22
	LDA ($1A)				;$BBCF24
	AND #$FF00				;$BBCF26
	STA ($1E)				;$BBCF29
	PLA					;$BBCF2B
	STA ($20)				;$BBCF2C
	LDY #$0001				;$BBCF2E
	RTS					;$BBCF31

CODE_BBCF32:
	JSR CODE_BBCF73				;$BBCF32
	LDA ($1A)				;$BBCF35
	BEQ CODE_BBCF72				;$BBCF37
	LDA #$0200				;$BBCF39
	STA $3E					;$BBCF3C
	LDA ($20)				;$BBCF3E
	XBA					;$BBCF40
	AND #$FF00				;$BBCF41
	SEC					;$BBCF44
	SBC ($1C)				;$BBCF45
	JSR CODE_BBCF8E				;$BBCF47
	CLC					;$BBCF4A
	ADC ($1C)				;$BBCF4B
	STA ($1C)				;$BBCF4D
	AND #$FF00				;$BBCF4F
	XBA					;$BBCF52
	STA ($1A)				;$BBCF53
	LDA #$0040				;$BBCF55
	STA $3E					;$BBCF58
	LDA ($20)				;$BBCF5A
	AND #$FF00				;$BBCF5C
	SEC					;$BBCF5F
	SBC ($1E)				;$BBCF60
	JSR CODE_BBCF8E				;$BBCF62
	CLC					;$BBCF65
	ADC ($1E)				;$BBCF66
	STA ($1E)				;$BBCF68
	AND #$FF00				;$BBCF6A
	ORA ($1A)				;$BBCF6D
	STA ($1A)				;$BBCF6F
	DEY					;$BBCF71
CODE_BBCF72:
	RTS					;$BBCF72

CODE_BBCF73:
	ASL					;$BBCF73
	ASL					;$BBCF74
	TAX					;$BBCF75
	LDY #$FFFA				;$BBCF76
CODE_BBCF79:
	LDA.l DATA_BBCFB0,x			;$BBCF79
	AND #$00FF				;$BBCF7D
	CLC					;$BBCF80
	ADC current_sprite			;$BBCF81
	STA $0020,y				;$BBCF83
	INX					;$BBCF86
	INY					;$BBCF87
	INY					;$BBCF88
	BMI CODE_BBCF79				;$BBCF89
	BEQ CODE_BBCF79				;$BBCF8B
	RTS					;$BBCF8D

CODE_BBCF8E:
	BEQ CODE_BBCF9E				;$BBCF8E
	BCS CODE_BBCFA0				;$BBCF90
	EOR #$FFFF				;$BBCF92
	INC					;$BBCF95
	JSR CODE_BBCFA0				;$BBCF96
	EOR #$FFFF				;$BBCF99
	INC					;$BBCF9C
	RTS					;$BBCF9D

CODE_BBCF9E:
	DEY					;$BBCF9E
	RTS					;$BBCF9F

CODE_BBCFA0:
	CMP #$0100				;$BBCFA0
	BCC CODE_BBCFAF				;$BBCFA3
	LSR					;$BBCFA5
	LSR					;$BBCFA6
	LSR					;$BBCFA7
	LSR					;$BBCFA8
	CMP $3E					;$BBCFA9
	BCS CODE_BBCFAF				;$BBCFAB
	LDA $3E					;$BBCFAD
CODE_BBCFAF:
	RTS					;$BBCFAF

DATA_BBCFB0:
	db $5C,$10,$12,$64,$5E,$14,$16,$66,$60,$2A,$2C,$58,$62,$30,$32,$5A

banana_main:
	JMP (.state_table,x)			;$BBCFC0

.state_table:
	dw CODE_BBCFC7
	dw CODE_BBCFE2

CODE_BBCFC7:
	TYX					;$BBCFC7
	LDA sprite.oam_property,x		;$BBCFC8
	EOR $18F7				;$BBCFCA
	AND #$F000				;$BBCFCD
	EOR $18F7				;$BBCFD0
	STA sprite.oam_property,x		;$BBCFD3
	STZ sprite.visibility,x			;$BBCFD5
	INC sprite.state,x			;$BBCFD7
	LDA sprite.animation_id,x		;$BBCFD9
	JSL set_sprite_animation		;$BBCFDB
	JML [$04F5]				;$BBCFDF

CODE_BBCFE2:
	JSL process_sprite_animation		;$BBCFE2
	JSL populate_sprite_clipping		;$BBCFE6
	JSL CODE_BEC012				;$BBCFEA
	BCS CODE_BBCFF3				;$BBCFEE
	JMP CODE_BBC827				;$BBCFF0

CODE_BBCFF3:
	LDA #$0001				;$BBCFF3
	SED					;$BBCFF6
	CLC					;$BBCFF7
	ADC banana_count			;$BBCFF8
	STA banana_count			;$BBCFFB
	CLD					;$BBCFFE
	JSL CODE_B7E4A8				;$BBCFFF
	LDX #$0000				;$BBD003
	JSL CODE_B7E4A2				;$BBD006
	LDX current_sprite			;$BBD00A
	STZ sprite.oam_property,x		;$BBD00C
	JSL delete_sprite_handle_deallocation	;$BBD00E
	JML [$04F5]				;$BBD012

bananas_main:
	JMP (.state_table,x)			;$BBD015

.state_table:
	dw CODE_BBD01C
	dw CODE_BBD046

CODE_BBD01C:
	JSL process_sprite_animation		;$BBD01C
	JSL populate_sprite_clipping		;$BBD020
	JSL CODE_BEC012				;$BBD024
	BCS CODE_BBD02D				;$BBD028
	JMP CODE_BBC827				;$BBD02A

CODE_BBD02D:
	LDA #$0001				;$BBD02D
	STA sprite.state,x			;$BBD030
	STZ sprite.visibility,x			;$BBD032
	LDA sprite.general_purpose_68,x		;$BBD034
	SED					;$BBD036
	CLC					;$BBD037
	ADC banana_count			;$BBD038
	STA banana_count			;$BBD03B
	CLD					;$BBD03E
	JSL CODE_B7E4A8				;$BBD03F
	JML [$04F5]				;$BBD043

CODE_BBD046:
	LDA active_frame_counter		;$BBD046
	AND #$0003				;$BBD048
	BNE CODE_BBD073				;$BBD04B
	LDX #$F8F8				;$BBD04D
	JSL CODE_B7E4A2				;$BBD050
	LDX current_sprite			;$BBD054
	LDA sprite.visibility,x			;$BBD056
	AND #$C000				;$BBD058
	EOR #$C000				;$BBD05B
	STA sprite.visibility,x			;$BBD05E
	LDA sprite.general_purpose_68,x		;$BBD060
	SEP #$09				;$BBD062
	SBC #$0001				;$BBD064
	STA sprite.general_purpose_68,x		;$BBD067
	CLD					;$BBD069
	BNE CODE_BBD073				;$BBD06A
	JSL CODE_BB8597				;$BBD06C
	JML [$04F5]				;$BBD070

CODE_BBD073:
	JSL process_sprite_animation		;$BBD073
	JML [$04F5]				;$BBD077

green_banana_spawner_main:
	JMP (.state_table,x)			;$BBD07A

.state_table:
	dw CODE_BBD085
	dw CODE_BBD09D
	dw CODE_BBD100
	dw CODE_BBD103

CODE_BBD085:
	TYX					;$BBD085
	LDA #$0003				;$BBD086
	STA sprite.state,x			;$BBD089
	LDA sprite.general_purpose_5E,x		;$BBD08B
	STA $1C3F				;$BBD08D
	LDA #$001F				;$BBD090
	STA $06CF				;$BBD093
	JSL CODE_808060				;$BBD096
	JML [$04F5]				;$BBD09A

CODE_BBD09D:
	LDA.w sprite.general_purpose_5E,y	;$BBD09D
	BEQ CODE_BBD0FC				;$BBD0A0
CODE_BBD0A2:
	JSL CODE_808063				;$BBD0A2
	CMP $1C3F				;$BBD0A6
	BCS CODE_BBD0A2				;$BBD0A9
	STA $1C41				;$BBD0AB
	LDY #$0280				;$BBD0AE
	JSL CODE_BB85B5				;$BBD0B1
	BCS CODE_BBD0F9				;$BBD0B5
	LDA #$071A				;$BBD0B7
	JSL queue_sound_effect			;$BBD0BA
	LDX alternate_sprite			;$BBD0BE
	LDY current_sprite			;$BBD0C0
	STY sprite.general_purpose_5C,x		;$BBD0C2
	LDA.w sprite.general_purpose_64,y	;$BBD0C4
	STA sprite.general_purpose_5E,x		;$BBD0C7
	LDA.w sprite.general_purpose_62,y	;$BBD0C9
	STA sprite.general_purpose_60,x		;$BBD0CC
	LDA $1C41				;$BBD0CE
	ASL					;$BBD0D1
	ASL					;$BBD0D2
	CLC					;$BBD0D3
	ADC.w sprite.general_purpose_5C,y	;$BBD0D4
	TAY					;$BBD0D7
	%pea_shift_dbr($BBFF00)			;$BBD0D8
	PLB					;$BBD0DB
	LDA $0000,y				;$BBD0DC
	STA sprite.x_position,x			;$BBD0DF
	LDA sprite.general_purpose_60,x		;$BBD0E1
	BEQ CODE_BBD0EF				;$BBD0E3
	LDA $0002,y				;$BBD0E5
	CLC					;$BBD0E8
	ADC $001973				;$BBD0E9
	BRA CODE_BBD0F2				;$BBD0ED

CODE_BBD0EF:
	LDA $0002,y				;$BBD0EF
CODE_BBD0F2:
	STA sprite.y_position,x			;$BBD0F2
	PLB					;$BBD0F4
	LDX current_sprite			;$BBD0F5
	INC sprite.state,x			;$BBD0F7
CODE_BBD0F9:
	JML [$04F5]				;$BBD0F9

CODE_BBD0FC:
	JSL delete_sprite_handle_deallocation	;$BBD0FC
CODE_BBD100:
	JML [$04F5]				;$BBD100

CODE_BBD103:
	TYX					;$BBD103
	DEC sprite.general_purpose_60,x		;$BBD104
	BPL CODE_BBD0F9				;$BBD106
	LDA #$0001				;$BBD108
	STA sprite.state,x			;$BBD10B
	JML [$04F5]				;$BBD10D

green_banana_main:
	JMP (DATA_BBD113,x)			;$BBD110

DATA_BBD113:
	dw CODE_BBD117
	dw CODE_BBD132

CODE_BBD117:
	TYX					;$BBD117
	LDA sprite.oam_property,x		;$BBD118
	EOR $18F7				;$BBD11A
	AND #$F000				;$BBD11D
	EOR $18F7				;$BBD120
	STA sprite.oam_property,x		;$BBD123
	STZ sprite.visibility,x			;$BBD125
	INC sprite.state,x			;$BBD127
	LDA sprite.animation_id,x		;$BBD129
	JSL set_sprite_animation		;$BBD12B
	JML [$04F5]				;$BBD12F

CODE_BBD132:
	JSL process_sprite_animation		;$BBD132
	DEC sprite.general_purpose_5E,x		;$BBD136
	BPL CODE_BBD152				;$BBD138
	JSR CODE_BBD1AB				;$BBD13A
	INC sprite.general_purpose_5E,x		;$BBD13D
	LDX $1C41				;$BBD13F
	LDA $06AF,x				;$BBD142
	EOR #$0080				;$BBD145
	STA $06AF,x				;$BBD148
	JSL delete_sprite_handle_deallocation	;$BBD14B
	JML [$04F5]				;$BBD14F

CODE_BBD152:
	LDA sprite.general_purpose_5E,x		;$BBD152
	CMP #$0030				;$BBD154
	BCS CODE_BBD171				;$BBD157
	AND #$0030				;$BBD159
	LSR					;$BBD15C
	LSR					;$BBD15D
	LSR					;$BBD15E
	TAY					;$BBD15F
	LDA DATA_BBD181,y			;$BBD160
	AND active_frame_counter		;$BBD163
	BNE CODE_BBD171				;$BBD165
	LDA sprite.visibility,x			;$BBD167
	AND #$C000				;$BBD169
	EOR #$C000				;$BBD16C
	STA sprite.visibility,x			;$BBD16F
CODE_BBD171:
	JSL populate_sprite_clipping		;$BBD171
	LDA #$08AA				;$BBD175
	JSL CODE_BEC012				;$BBD178
	BCS CODE_BBD189				;$BBD17C
	JML [$04F5]				;$BBD17E

DATA_BBD181:
	dw $0001
	dw $0003
	dw $0007
	dw $000F

CODE_BBD189:
	LDX #$F8F8				;$BBD189
	JSL CODE_B7E4A2				;$BBD18C
	JSR CODE_BBD1AB				;$BBD190
	LDA $18EF				;$BBD193
	SEP #$09				;$BBD196
	ADC banana_count			;$BBD198
	BPL CODE_BBD1A0				;$BBD19B
	LDA #$0000				;$BBD19D
CODE_BBD1A0:
	STA banana_count			;$BBD1A0
	CLD					;$BBD1A3
	JSL delete_sprite_handle_deallocation	;$BBD1A4
	JML [$04F5]				;$BBD1A8

CODE_BBD1AB:
	LDY current_sprite			;$BBD1AB
	LDX sprite.general_purpose_5C,y		;$BBD1AD
	INC sprite.state,x			;$BBD1AF
	DEC sprite.general_purpose_5E,x		;$BBD1B1
	LDA #$0020				;$BBD1B3
	STA sprite.general_purpose_60,x		;$BBD1B6
	RTS					;$BBD1B8

extra_life_balloon_main:
	JMP (.state_table,x)			;$BBD1B9

.state_table:
	dw CODE_BBD1C2
	dw CODE_BBD213				;Unused state? (Would act like dkc2 1-1 cabin balloon)
	dw CODE_BBD234

CODE_BBD1C2:
	LDA timestop_flags			;$BBD1C2
	BIT #$0004				;$BBD1C5
	BNE CODE_BBD1EE				;$BBD1C8
	JSL populate_sprite_clipping		;$BBD1CA
	JSL CODE_BEC012				;$BBD1CE
	BCS CODE_BBD1F1				;$BBD1D2
CODE_BBD1D4:
	JSL process_sprite_animation		;$BBD1D4
	LDA sprite.general_purpose_6C,x		;$BBD1D8
	CMP #$8000				;$BBD1DA
	BNE CODE_BBD1E2				;$BBD1DD
	JMP CODE_BBC827				;$BBD1DF

CODE_BBD1E2:
	DEC sprite.general_purpose_6C,x		;$BBD1E2
	BPL CODE_BBD1EE				;$BBD1E4
	JSL process_current_movement		;$BBD1E6
	JSL CODE_BBAB46				;$BBD1EA
CODE_BBD1EE:
	JML [$04F5]				;$BBD1EE

CODE_BBD1F1:
	LDA #$0714				;$BBD1F1
	JSL queue_sound_effect			;$BBD1F4
	LDX current_sprite			;$BBD1F8
	LDA sprite.general_purpose_5C,x		;$BBD1FA
	JSL CODE_B88084				;$BBD1FC
	LDA #$0002				;$BBD200
	STA sprite.state,x			;$BBD203
	LDA #$28D4				;$BBD205
	JSL CODE_BBD64E				;$BBD208
	JSL process_sprite_animation		;$BBD20C
	JML [$04F5]				;$BBD210

CODE_BBD213:
	LDA #$0010				;$BBD213
	BIT kong_letter_flags			;$BBD216
	BNE CODE_BBD22D				;$BBD219
	JSL populate_sprite_clipping		;$BBD21B
	JSL CODE_BEC012				;$BBD21F
	BCC CODE_BBD1D4				;$BBD223
	LDA #$0010				;$BBD225
	TSB kong_letter_flags			;$BBD228
	BRA CODE_BBD1F1				;$BBD22B

CODE_BBD22D:
	JSL CODE_BB8597				;$BBD22D
	JML [$04F5]				;$BBD231

CODE_BBD234:
	JSL CODE_BBD68C				;$BBD234
	BMI CODE_BBD241				;$BBD238
	JSL process_sprite_animation		;$BBD23A
	JML [$04F5]				;$BBD23E

CODE_BBD241:
	LDA sprite.general_purpose_5C,x		;$BBD241
	JSL CODE_B88087				;$BBD243
	JSL CODE_BB8597				;$BBD247
	JML [$04F5]				;$BBD24B

bear_coin_main:
	JSL process_sprite_animation		;$BBD24E
	JSL populate_sprite_clipping		;$BBD252
	JSL CODE_BEC012				;$BBD256
	BCS CODE_BBD25F				;$BBD25A
	JMP CODE_BBC827				;$BBD25C

CODE_BBD25F:
	LDX current_sprite			;$BBD25F
	LDA sprite.general_purpose_6C,x		;$BBD261
	JSL CODE_BBD42A				;$BBD263
	JML [$04F5]				;$BBD267

unknown_sprite_0288_main:
	JSL process_sprite_animation		;$BBD26A
	JSL populate_sprite_clipping		;$BBD26E
	JSL CODE_BEC012				;$BBD272
	BCS CODE_BBD27B				;$BBD276
	JML [$04F5]				;$BBD278

CODE_BBD27B:
	LDY $78					;$BBD27B
	CPY follower_kong_sprite		;$BBD27D
	BNE CODE_BBD294				;$BBD280
	LDA.w sprite.state,y			;$BBD282
	ASL					;$BBD285
	ASL					;$BBD286
	TAX					;$BBD287
	LDA.l kong_state_flags,x		;$BBD288
	AND #$0080				;$BBD28C
	BNE CODE_BBD294				;$BBD28F
	JML [$04F5]				;$BBD291

CODE_BBD294:
	LDX current_sprite			;$BBD294
	LDA sprite.general_purpose_6C,x		;$BBD296
	JSL CODE_BBD42A				;$BBD298
	JML [$04F5]				;$BBD29C

unknown_sprite_02A4_main:
	JMP (.state_table,x)			;$BBD29F

.state_table:
	dw CODE_BBD2A6
	dw CODE_BBD2B8

CODE_BBD2A6:
	TYX					;$BBD2A6
	DEC sprite.general_purpose_5C,x		;$BBD2A7
	BPL CODE_BBD2AD				;$BBD2A9
	INC sprite.state,x			;$BBD2AB
CODE_BBD2AD:
	JSL process_current_movement		;$BBD2AD
	JSL process_sprite_animation		;$BBD2B1
	JML [$04F5]				;$BBD2B5

CODE_BBD2B8:
	TYX					;$BBD2B8
	LDY active_kong_sprite			;$BBD2B9
	JSL CODE_BEC003				;$BBD2BC
	BCC CODE_BBD2AD				;$BBD2C0
	LDA sprite.general_purpose_6C,x		;$BBD2C2
	JSL CODE_BBD42A				;$BBD2C4
	JML [$04F5]				;$BBD2C8

bonus_coin_main:
	JMP (.state_table,x)			;$BBD2CB

.state_table:
	dw CODE_BBD2D8
	dw CODE_BBD2F1
	dw CODE_BBD349
	dw CODE_BBD2D8
	dw CODE_BBD350

CODE_BBD2D8:
	LDY #$0014				;$BBD2D8
	JSL CODE_BB8585				;$BBD2DB
	BCS CODE_BBD2EE				;$BBD2DF
	LDX current_sprite			;$BBD2E1
	INC sprite.state,x			;$BBD2E3
	LDA sprite.state,x			;$BBD2E5
	AND #$00FF				;$BBD2E7
	ASL					;$BBD2EA
	TAX					;$BBD2EB
	BRA bonus_coin_main			;$BBD2EC

CODE_BBD2EE:
	JML [$04F5]				;$BBD2EE

CODE_BBD2F1:
	JSL process_sprite_animation		;$BBD2F1
	JSL populate_sprite_clipping		;$BBD2F5
	JSL CODE_BEC012				;$BBD2F9
	BCS CODE_BBD302				;$BBD2FD
	JML [$04F5]				;$BBD2FF

CODE_BBD302:
	LDY $78					;$BBD302
	CPY follower_kong_sprite		;$BBD304
	BNE CODE_BBD31B				;$BBD307
	LDA.w sprite.state,y			;$BBD309
	ASL					;$BBD30C
	ASL					;$BBD30D
	TAX					;$BBD30E
	LDA.l kong_state_flags,x		;$BBD30F
	AND #$0080				;$BBD313
	BNE CODE_BBD31B				;$BBD316
	JML [$04F5]				;$BBD318

CODE_BBD31B:
	LDX current_sprite			;$BBD31B
	LDA sprite.x_position,x			;$BBD31D
	STA $195F				;$BBD31F
	LDA sprite.y_position,x			;$BBD322
	STA $1961				;$BBD324
	LDA sprite.general_purpose_5C,x		;$BBD327
	BNE CODE_BBD334				;$BBD329
	LDA sprite.general_purpose_6C,x		;$BBD32B
	JSL CODE_BBD42A				;$BBD32D
	JML [$04F5]				;$BBD331

CODE_BBD334:
	LDA #$0002				;$BBD334
	LDY active_kong_sprite			;$BBD337
	CPY $78					;$BBD33A
	BEQ CODE_BBD341				;$BBD33C
	LDA #$0006				;$BBD33E
CODE_BBD341:
	TSB $05B1				;$BBD341
	INC sprite.state,x			;$BBD344
	JML [$04F5]				;$BBD346

CODE_BBD349:
	JSL process_sprite_animation		;$BBD349
	JML [$04F5]				;$BBD34D

CODE_BBD350:
	JSL process_sprite_animation		;$BBD350
	JSL populate_sprite_clipping		;$BBD354
	LDA #$0040				;$BBD358
	JSL check_sprite_collision		;$BBD35B
	BCS CODE_BBD364				;$BBD35F
	JML [$04F5]				;$BBD361

CODE_BBD364:
	LDX current_sprite			;$BBD364
	LDA sprite.general_purpose_5C,x		;$BBD366
	BNE CODE_BBD373				;$BBD368
	LDA sprite.general_purpose_6C,x		;$BBD36A
	JSL CODE_BBD42A				;$BBD36C
	JML [$04F5]				;$BBD370

CODE_BBD373:
	LDA #$0002				;$BBD373
	TSB $05B1				;$BBD376
	LDA #$0002				;$BBD379
	STA sprite.state,x			;$BBD37C
	JML [$04F5]				;$BBD37E

collectable_cog_main:
	JMP (DATA_BBD384,x)			;$BBD381

DATA_BBD384:
	dw CODE_BBD38C
	dw CODE_BBD3B1
	dw CODE_BBD3CC
	dw CODE_BBD3FC

CODE_BBD38C:
	LDX sprite.general_purpose_60,y		;$BBD38C
	LDA $00,x				;$BBD38E
	STA CPU.dividen_low			;$BBD390
	SEP #$20				;$BBD393
	LDA #$0A				;$BBD395
	STA CPU.divisor				;$BBD397
	TYX					;$BBD39A
	STX $18DF				;$BBD39B
	INC sprite.state,x			;$BBD39E
	BIT active_frame_counter		;$BBD3A0
	LDA CPU.divide_result_low		;$BBD3A2
	XBA					;$BBD3A5
	LDA CPU.divide_remainder		;$BBD3A6
	REP #$20				;$BBD3A9
	STA.w sprite.general_purpose_5E,y	;$BBD3AB
	JML [$04F5]				;$BBD3AE

CODE_BBD3B1:
	TYX					;$BBD3B1
	LDA sprite.y_position,x			;$BBD3B2
	INC					;$BBD3B4
	CMP sprite.y_sub_position,x		;$BBD3B5
	BMI CODE_BBD3BD				;$BBD3B7
	INC sprite.state,x			;$BBD3B9
	BRA CODE_BBD3C5				;$BBD3BB

CODE_BBD3BD:
	STA sprite.y_position,x			;$BBD3BD
	SEP #$20				;$BBD3BF
	INC sprite.general_purpose_5C+1,x	;$BBD3C1
	REP #$20				;$BBD3C3
CODE_BBD3C5:
	JSL process_sprite_animation		;$BBD3C5
	JML [$04F5]				;$BBD3C9

CODE_BBD3CC:
	TYX					;$BBD3CC
	LDA sprite.general_purpose_62,x		;$BBD3CD
	BEQ CODE_BBD3D7				;$BBD3CF
	DEC sprite.general_purpose_62,x		;$BBD3D1
	BNE CODE_BBD3D7				;$BBD3D3
	INC sprite.state,x			;$BBD3D5
CODE_BBD3D7:
	LDA.w sprite.general_purpose_64,y	;$BBD3D7
	LDX sprite.general_purpose_60,y		;$BBD3DA
	CMP $00,x				;$BBD3DC
	BEQ CODE_BBD3F1				;$BBD3DE
	BCS CODE_BBD3F8				;$BBD3E0
	DEC $00,x				;$BBD3E2
CODE_BBD3E4:
	LDA #$0000				;$BBD3E4
	STA.w sprite.state,y			;$BBD3E7
	LDA #$071A				;$BBD3EA
	JSL queue_sound_effect			;$BBD3ED
CODE_BBD3F1:
	JSL process_sprite_animation		;$BBD3F1
	JML [$04F5]				;$BBD3F5

CODE_BBD3F8:
	INC $00,x				;$BBD3F8
	BRA CODE_BBD3E4				;$BBD3FA

CODE_BBD3FC:
	CPY $18DF				;$BBD3FC
	BNE CODE_BBD427				;$BBD3FF
	JSL process_sprite_animation		;$BBD401
	DEC sprite.general_purpose_62,x		;$BBD405
	BMI CODE_BBD40C				;$BBD407
	JML [$04F5]				;$BBD409

CODE_BBD40C:
	DEC sprite.y_position,x			;$BBD40C
	DEC sprite.y_position,x			;$BBD40E
	LDA sprite.general_purpose_5C,x		;$BBD410
	SEC					;$BBD412
	SBC #$0200				;$BBD413
	STA sprite.general_purpose_5C,x		;$BBD416
	BPL CODE_BBD427				;$BBD418
	CMP #$E800				;$BBD41A
	BCS CODE_BBD427				;$BBD41D
	CPX $18DF				;$BBD41F
	BNE CODE_BBD427				;$BBD422
	STZ $18DF				;$BBD424
CODE_BBD427:
	JML [$04F5]				;$BBD427

CODE_BBD42A:
	PHK					;$BBD42A
	PLB					;$BBD42B
	ASL					;$BBD42C
	ASL					;$BBD42D
	ASL					;$BBD42E
	ASL					;$BBD42F
	TAY					;$BBD430
	LDA DATA_BBD4B7,y			;$BBD431
	STA $1A					;$BBD434
	PHY					;$BBD436
	%return(CODE_BBD43D)			;$BBD437
	JMP ($001A)				;$BBD43A

CODE_BBD43D:
	PLY					;$BBD43D
	LDX DATA_BBD4B7+$02,y			;$BBD43E
	LDA $00,x				;$BBD441
	STA CPU.dividen_low			;$BBD443
	STA $3A					;$BBD446
	CLC					;$BBD448
	ADC DATA_BBD4B7+$04,y			;$BBD449
	CMP DATA_BBD4B7+$06,y			;$BBD44C
	BCC CODE_BBD454				;$BBD44F
	LDA DATA_BBD4B7+$06,y			;$BBD451
CODE_BBD454:
	STA $00,x				;$BBD454
	SEP #$20				;$BBD456
	LDA #$0A				;$BBD458
	STA CPU.divisor				;$BBD45A
	REP #$20				;$BBD45D
	LDA $00,x				;$BBD45F
	SEC					;$BBD461
	SBC $3A					;$BBD462
	LDX current_sprite			;$BBD464
	STA sprite.general_purpose_60,x		;$BBD466
	SEP #$20				;$BBD468
	LDA CPU.divide_result_low		;$BBD46A
	XBA					;$BBD46D
	LDA CPU.divide_remainder		;$BBD46E
	REP #$20				;$BBD471
	STA sprite.general_purpose_5E,x		;$BBD473
	LDA DATA_BBD4B7+$02,y			;$BBD475
	STA sprite.general_purpose_6A,x		;$BBD478
	LDA DATA_BBD4B7+$08,y			;$BBD47A
	STA sprite.general_purpose_62,x		;$BBD47D
	AND #$00FF				;$BBD47F
	ORA #$E800				;$BBD482
	STA sprite.general_purpose_5C,x		;$BBD485
	LDA DATA_BBD4B7+$0A,y			;$BBD487
	JSL CODE_BBD64E				;$BBD48A
	LDA DATA_BBD4B7+$0C,y			;$BBD48E
	STA sprite.general_purpose_64,x		;$BBD491
	LDA DATA_BBD4B7+$0E,y			;$BBD493
	BEQ CODE_BBD4A0				;$BBD496
	STA sprite.general_purpose_66,x		;$BBD498
	STZ sprite.general_purpose_68,x		;$BBD49A
	JSL queue_sound_effect			;$BBD49C
CODE_BBD4A0:
	LDA #CODE_BBD577			;$BBD4A0
	STA sprite.main_routine_address,x	;$BBD4A3
	LDA #$BBBB				;$BBD4A5
	STA sprite.main_routine_bank,x		;$BBD4A8
	LDA sprite.oam_property,x		;$BBD4AA
	ORA #$3000				;$BBD4AC
	STA sprite.oam_property,x		;$BBD4AF
	LDA #$00FF				;$BBD4B1
	STA sprite.render_order,x		;$BBD4B4
	RTL					;$BBD4B6

DATA_BBD4B7:
	dw CODE_BBD517, $05C9, $0001, $0063, $0A88, $1E78, $0078, $071A
	dw CODE_BBD51C, $05CF, $0001, $0029, $1088, $2C70, $0078, $071C
	dw CODE_BBD52D, $05CB, $0001, $0055, $0E88, $2874, $0078, $041B
	dw CODE_BBD56B, $05CD, $0001, $000D, $0488, $1C78, $0078, $071A
	dw CODE_BBD570, $05D1, $0001, $0005, $0A88, $2278, $0078, $071A
	dw CODE_BBD52D, $05CB, $0000, $0055, $0E88, $2874, $0078, $041B

CODE_BBD517:
	LDX current_sprite			;$BBD517
	STZ sprite.state,x			;$BBD519
	RTS					;$BBD51B

CODE_BBD51C:
	LDX current_sprite			;$BBD51C
	STZ sprite.state,x			;$BBD51E
	LDX parent_level_number			;$BBD520
	LDA $0632,x				;$BBD523
	ORA #$0020				;$BBD526
	STA $0632,x				;$BBD529
	RTS					;$BBD52C

CODE_BBD52D:
	LDX current_sprite			;$BBD52D
	STZ sprite.state,x			;$BBD52F
	LDA #$0008				;$BBD531
	LDY $04EA				;$BBD534
	CPY #$0002				;$BBD537
	BEQ CODE_BBD544				;$BBD53A
	LDA #$0004				;$BBD53C
	BCC CODE_BBD544				;$BBD53F
	LDA #$0010				;$BBD541
CODE_BBD544:
	LDX parent_level_number			;$BBD544
	ORA $0632,x				;$BBD547
	STA $0632,x				;$BBD54A
	LDA #$0002				;$BBD54D
	LDY active_kong_sprite			;$BBD550
	CPY $78					;$BBD553
	BEQ CODE_BBD55A				;$BBD555
	LDA #$0006				;$BBD557
CODE_BBD55A:
	TSB $05B1				;$BBD55A
	LDA #$0008				;$BBD55D
	AND active_cheats			;$BBD560
	BEQ CODE_BBD56A				;$BBD563
	LDA #$0050				;$BBD565
	STA $03,S				;$BBD568
CODE_BBD56A:
	RTS					;$BBD56A

CODE_BBD56B:
	LDX current_sprite			;$BBD56B
	STZ sprite.state,x			;$BBD56D
	RTS					;$BBD56F

CODE_BBD570:
	LDX current_sprite			;$BBD570
	STZ sprite.state,x			;$BBD572
	INC $0603				;$BBD574
CODE_BBD577:
	RTS					;$BBD577

;Unreferenced. (Unused sprite?)
CODE_BBD578:
	JMP (.state_table,x)			;$BBD578

.state_table:
	dw CODE_BBD581
	dw CODE_BBD5B8
	dw CODE_BBD61C

CODE_BBD581:
	LDA $18DF				;$BBD581
	BNE CODE_BBD58F				;$BBD584
	STY $18DF				;$BBD586
	LDA #$00FF				;$BBD589
	STA.w sprite.render_order,y		;$BBD58C
CODE_BBD58F:
	LDA.w sprite.general_purpose_5C,y	;$BBD58F
	CLC					;$BBD592
	ADC #$0200				;$BBD593
	BMI CODE_BBD5A0				;$BBD596
	CMP.w sprite.general_purpose_62,y	;$BBD598
	BCC CODE_BBD5A0				;$BBD59B
	LDA.w sprite.general_purpose_62,y	;$BBD59D
CODE_BBD5A0:
	STA.w sprite.general_purpose_5C,y	;$BBD5A0
	JSL process_sprite_animation		;$BBD5A3
	JSL CODE_BBD68C				;$BBD5A7
	BPL CODE_BBD5B5				;$BBD5AB
	LDA sprite.general_purpose_5C,x		;$BBD5AD
	CMP sprite.general_purpose_62,x		;$BBD5AF
	BNE CODE_BBD5B5				;$BBD5B1
	INC sprite.state,x			;$BBD5B3
CODE_BBD5B5:
	JML [$04F5]				;$BBD5B5

CODE_BBD5B8:
	CPY $18DF				;$BBD5B8
	BEQ CODE_BBD5D9				;$BBD5BB
	LDX $18DF				;$BBD5BD
	LDA sprite.state,x			;$BBD5C0
	CMP #$0002				;$BBD5C2
	BCS CODE_BBD5D0				;$BBD5C5
	LDA sprite.general_purpose_6A,x		;$BBD5C7
	CMP.w sprite.general_purpose_6A,y	;$BBD5C9
	BEQ CODE_BBD60D				;$BBD5CC
	BRA CODE_BBD606				;$BBD5CE

CODE_BBD5D0:
	STY $18DF				;$BBD5D0
	LDA #$00FF				;$BBD5D3
	STA.w sprite.render_order,y		;$BBD5D6
CODE_BBD5D9:
	LDA active_frame_counter		;$BBD5D9
	AND #$0007				;$BBD5DB
	BNE CODE_BBD606				;$BBD5DE
	TYX					;$BBD5E0
	DEC sprite.general_purpose_60,x		;$BBD5E1
	BMI CODE_BBD604				;$BBD5E3
	LDA sprite.general_purpose_66,x		;$BBD5E5
	CMP sprite.general_purpose_68,x		;$BBD5E7
	STA sprite.general_purpose_68,x		;$BBD5E9
	BNE CODE_BBD5F1				;$BBD5EB
	JSL queue_sound_effect			;$BBD5ED
CODE_BBD5F1:
	LDA sprite.general_purpose_5E,x		;$BBD5F1
	CMP #$0909				;$BBD5F3
	BEQ CODE_BBD604				;$BBD5F6
	SED					;$BBD5F8
	ADC #$0091				;$BBD5F9
	AND #$0F0F				;$BBD5FC
	CLD					;$BBD5FF
	STA sprite.general_purpose_5E,x		;$BBD600
	BRA CODE_BBD606				;$BBD602

CODE_BBD604:
	INC sprite.state,x			;$BBD604
CODE_BBD606:
	JSL process_sprite_animation		;$BBD606
	JML [$04F5]				;$BBD60A

CODE_BBD60D:
	LDA sprite.general_purpose_60,x		;$BBD60D
	CLC					;$BBD60F
	ADC.w sprite.general_purpose_60,y	;$BBD610
	STA sprite.general_purpose_60,x		;$BBD613
	JSL CODE_BB8597				;$BBD615
	JML [$04F5]				;$BBD619

CODE_BBD61C:
	CPY $18DF				;$BBD61C
	BNE CODE_BBD647				;$BBD61F
	JSL process_sprite_animation		;$BBD621
	DEC sprite.general_purpose_64,x		;$BBD625
	BMI CODE_BBD62C				;$BBD627
	JML [$04F5]				;$BBD629

CODE_BBD62C:
	DEC sprite.y_position,x			;$BBD62C
	DEC sprite.y_position,x			;$BBD62E
	LDA sprite.general_purpose_5C,x		;$BBD630
	SEC					;$BBD632
	SBC #$0200				;$BBD633
	STA sprite.general_purpose_5C,x		;$BBD636
	BPL CODE_BBD64B				;$BBD638
	CMP #$F000				;$BBD63A
	BCS CODE_BBD64B				;$BBD63D
	CPX $18DF				;$BBD63F
	BNE CODE_BBD647				;$BBD642
	STZ $18DF				;$BBD644
CODE_BBD647:
	JSL CODE_BB8597				;$BBD647
CODE_BBD64B:
	JML [$04F5]				;$BBD64B

CODE_BBD64E:
	LDX current_sprite			;$BBD64E
CODE_BBD650:
	STA sprite.y_speed,x			;$BBD650
	SEP #$20				;$BBD652
	STZ sprite.y_speed,x			;$BBD654
	STZ sprite.x_speed,x			;$BBD656
	STA sprite.x_speed+1,x			;$BBD658
	REP #$20				;$BBD65A
	LDA #$8000				;$BBD65C
	STA sprite.visibility,x			;$BBD65F
	LDA sprite.x_position,x			;$BBD661
	SEC					;$BBD663
	SBC $196D				;$BBD664
	BCS CODE_BBD66C				;$BBD667
	LDA #$0000				;$BBD669
CODE_BBD66C:
	CMP #$0100				;$BBD66C
	BCC CODE_BBD674				;$BBD66F
	LDA #$00FF				;$BBD671
CODE_BBD674:
	STA sprite.x_position,x			;$BBD674
	LDA sprite.y_position,x			;$BBD676
	SEC					;$BBD678
	SBC $1973				;$BBD679
	BCS CODE_BBD681				;$BBD67C
	LDA #$0000				;$BBD67E
CODE_BBD681:
	CMP #$0100				;$BBD681
	BCC CODE_BBD689				;$BBD684
	LDA #$00FF				;$BBD686
CODE_BBD689:
	STA sprite.y_position,x			;$BBD689
	RTL					;$BBD68B

CODE_BBD68C:
	LDY #$0002				;$BBD68C
	LDX current_sprite			;$BBD68F
	LDA sprite.x_speed,x			;$BBD691
	SEC					;$BBD693
	SBC sprite.x_sub_position+1,x		;$BBD694
	JSR CODE_BBD6AD				;$BBD696
	CLC					;$BBD699
	ADC sprite.x_sub_position+1,x		;$BBD69A
	STA sprite.x_sub_position+1,x		;$BBD69C
	LDA sprite.y_speed,x			;$BBD69E
	SEC					;$BBD6A0
	SBC sprite.y_sub_position+1,x		;$BBD6A1
	JSR CODE_BBD6AD				;$BBD6A3
	CLC					;$BBD6A6
	ADC sprite.y_sub_position+1,x		;$BBD6A7
	STA sprite.y_sub_position+1,x		;$BBD6A9
	DEY					;$BBD6AB
	RTL					;$BBD6AC

CODE_BBD6AD:
	BEQ CODE_BBD6BD				;$BBD6AD
	BCS CODE_BBD6BF				;$BBD6AF
	EOR #$FFFF				;$BBD6B1
	INC					;$BBD6B4
	JSR CODE_BBD6BF				;$BBD6B5
	EOR #$FFFF				;$BBD6B8
	INC					;$BBD6BB
	RTS					;$BBD6BC

CODE_BBD6BD:
	DEY					;$BBD6BD
	RTS					;$BBD6BE

CODE_BBD6BF:
	CMP #$0100				;$BBD6BF
	BCC CODE_BBD6CF				;$BBD6C2
	LSR					;$BBD6C4
	LSR					;$BBD6C5
	LSR					;$BBD6C6
	CMP #$0080				;$BBD6C7
	BCS CODE_BBD6CF				;$BBD6CA
	LDA #$0080				;$BBD6CC
CODE_BBD6CF:
	RTS					;$BBD6CF

;bonus handler might be a better name?
bonus_timer_main:
	JMP (DATA_BBD6D3,x)			;$BBD6D0

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
	LDY #$0010				;$BBD6E9
	JSL CODE_BB8585				;$BBD6EC
	BCC CODE_BBD6F5				;$BBD6F0
	JML [$04F5]				;$BBD6F2

CODE_BBD6F5:
	LDX current_sprite			;$BBD6F5
	LDY alternate_sprite			;$BBD6F7
	STY sprite.general_purpose_5C,x		;$BBD6F9
	STX sprite.general_purpose_5C,y		;$BBD6FB
	LDA sprite.sprite_graphic,x		;$BBD6FD
	STA sprite.general_purpose_6C,x		;$BBD6FF
	STX bonus_timer_index			;$BBD701
	JSR CODE_BBD915				;$BBD704
	TXY					;$BBD707
	LDA $075E				;$BBD708
	AND #$00FF				;$BBD70B
	ASL					;$BBD70E
	TAX					;$BBD70F
	JSR (DATA_BBD716,x)			;$BBD710
	JML [$04F5]				;$BBD713

DATA_BBD716:
	dw CODE_BBD722
	dw CODE_BBD722
	dw CODE_BBD729
	dw CODE_BBD739
	dw CODE_BBD75E
	dw CODE_BBD783

CODE_BBD722:
	LDA #$0002				;$BBD722
	STA.w sprite.state,y			;$BBD725
	RTS					;$BBD728

CODE_BBD729:
	LDA #$0003				;$BBD729
	STA.w sprite.state,y			;$BBD72C
	LDA $075F				;$BBD72F
	AND #$00FF				;$BBD732
	STA $051D				;$BBD735
	RTS					;$BBD738

CODE_BBD739:
	LDA #$0004				;$BBD739
	STA.w sprite.state,y			;$BBD73C
	LDA banana_count			;$BBD73F
	ORA #$8000				;$BBD742
	STA $18F1				;$BBD745
	LDA $075F				;$BBD748
	AND #$00FF				;$BBD74B
	STA banana_count			;$BBD74E
	STA hud_current_banana_count		;$BBD751
	STA hud_final_banana_count		;$BBD754
	LDA #$9998				;$BBD757
	STA $18EF				;$BBD75A
	RTS					;$BBD75D

CODE_BBD75E:
	LDA #$0005				;$BBD75E
	STA.w sprite.state,y			;$BBD761
	LDA banana_count			;$BBD764
	ORA #$8000				;$BBD767
	STA $18F1				;$BBD76A
	LDA $075F				;$BBD76D
	AND #$00FF				;$BBD770
	STA banana_count			;$BBD773
	STA hud_current_banana_count		;$BBD776
	STA hud_final_banana_count		;$BBD779
	LDA #$9998				;$BBD77C
	STA $18EF				;$BBD77F
	RTS					;$BBD782

CODE_BBD783:
	LDA #$0009				;$BBD783
	STA.w sprite.state,y			;$BBD786
	LDA $075F				;$BBD789
	AND #$00FF				;$BBD78C
	STA $051D				;$BBD78F
	RTS					;$BBD792

CODE_BBD793:
	JML [$04F5]				;$BBD793

CODE_BBD796:
	BRA CODE_BBD7D8				;$BBD796

CODE_BBD798:
	LDA $051D				;$BBD798
	BNE CODE_BBD7D8				;$BBD79B
	BRA CODE_BBD7B9				;$BBD79D

CODE_BBD79F:
	LDA #$0064				;$BBD79F
	STA $18CF				;$BBD7A2
	LDA banana_count			;$BBD7A5
	BNE CODE_BBD7D8				;$BBD7A8
	BRA CODE_BBD7B9				;$BBD7AA

CODE_BBD7AC:
	LDA #$0064				;$BBD7AC
	STA $18CF				;$BBD7AF
	LDA banana_count			;$BBD7B2
	BNE CODE_BBD7D8				;$BBD7B5
	BRA CODE_BBD7B9				;$BBD7B7

CODE_BBD7B9:
	LDA #$0001				;$BBD7B9
	TSB $194F				;$BBD7BC
	BNE CODE_BBD7D8				;$BBD7BF
	LDA #$0518				;$BBD7C1
	JSL CODE_B28018				;$BBD7C4
	LDA #$0217				;$BBD7C8
	JSL CODE_B28018				;$BBD7CB
	LDA #$0119				;$BBD7CF
	JSL CODE_B28018				;$BBD7D2
	BRA CODE_BBD7D8				;$BBD7D6

CODE_BBD7D8:
	JSR CODE_BBD8C9				;$BBD7D8
	JSR CODE_BBD944				;$BBD7DB
	LDA sprite.general_purpose_62,x		;$BBD7DE
	BMI CODE_BBD7EA				;$BBD7E0
	JSR CODE_BBD974				;$BBD7E2
	BCS CODE_BBD7EA				;$BBD7E5
	JML [$04F5]				;$BBD7E7

CODE_BBD7EA:
	LDA #$001F				;$BBD7EA
	LDY #$0004				;$BBD7ED
	JSL enable_timestop			;$BBD7F0
	LDX current_sprite			;$BBD7F4
	LDA #$0006				;$BBD7F6
	STA sprite.state,x			;$BBD7F9
	JML [$04F5]				;$BBD7FB

CODE_BBD7FE:
	JSR CODE_BBD974				;$BBD7FE
	BCS CODE_BBD81E				;$BBD801
	LDX current_sprite			;$BBD803
	LDA #$0007				;$BBD805
	STA sprite.state,x			;$BBD808
	LDA #$001F				;$BBD80A
	LDY #$0400				;$BBD80D
	JSL enable_timestop			;$BBD810
	LDA #$0027				;$BBD814
	JSL CODE_B88069				;$BBD817
	JML [$04F5]				;$BBD81B

CODE_BBD81E:
	LDA #$0028				;$BBD81E
	JSL CODE_B88069				;$BBD821
	BCS CODE_BBD833				;$BBD825
	LDX current_sprite			;$BBD827
	LDA sprite.general_purpose_66,x		;$BBD829
	STA $17CA				;$BBD82B
	LDA #$0008				;$BBD82E
	STA sprite.state,x			;$BBD831
CODE_BBD833:
	JML [$04F5]				;$BBD833

CODE_BBD836:
	STY bonus_timer_index			;$BBD836
	JML [$04F5]				;$BBD839

CODE_BBD83C:
	STZ bonus_timer_index			;$BBD83C
	JML [$04F5]				;$BBD83F

CODE_BBD842:
	LDA $051D				;$BBD842
	BNE CODE_BBD864				;$BBD845
	LDA #$0001				;$BBD847
	TSB $194F				;$BBD84A
	BNE CODE_BBD864				;$BBD84D
	LDA #$0518				;$BBD84F
	JSL CODE_B28018				;$BBD852
	LDA #$0217				;$BBD856
	JSL CODE_B28018				;$BBD859
	LDA #$0119				;$BBD85D
	JSL CODE_B28018				;$BBD860
CODE_BBD864:
	JSR CODE_BBD8C9				;$BBD864
	JSR CODE_BBD944				;$BBD867
	LDA sprite.general_purpose_62,x		;$BBD86A
	BMI CODE_BBD88A				;$BBD86C
	JSR CODE_BBD974				;$BBD86E
	BCS CODE_BBD876				;$BBD871
	JML [$04F5]				;$BBD873

CODE_BBD876:
	LDA #$000A				;$BBD876
	STA sprite.state,x			;$BBD879
	LDA #$0078				;$BBD87B
	STA sprite.general_purpose_66,x		;$BBD87E
	LDA #$0003				;$BBD880
	JSL CODE_B2800F				;$BBD883
	JML [$04F5]				;$BBD887

CODE_BBD88A:
	LDA #$0007				;$BBD88A
	STA sprite.state,x			;$BBD88D
	LDA #$0002				;$BBD88F
	JSL CODE_B2800F				;$BBD892
	JSR CODE_BBD89C				;$BBD896
	JML [$04F5]				;$BBD899

CODE_BBD89C:
	LDA #$0001				;$BBD89C
	TSB $05AF				;$BBD89F
	BNE CODE_BBD8AB				;$BBD8A2
	LDA #$820F				;$BBD8A4
	JSL CODE_808024				;$BBD8A7
CODE_BBD8AB:
	LDA #$001F				;$BBD8AB
	LDY #$0004				;$BBD8AE
	JSL enable_timestop			;$BBD8B1
	RTS					;$BBD8B5

CODE_BBD8B6:
	TYX					;$BBD8B6
	DEC sprite.general_purpose_66,x		;$BBD8B7
	BPL CODE_BBD8C3				;$BBD8B9
	LDA #$0008				;$BBD8BB
	STA sprite.state,x			;$BBD8BE
	JSR CODE_BBD89C				;$BBD8C0
CODE_BBD8C3:
	STZ bonus_timer_index			;$BBD8C3
	JML [$04F5]				;$BBD8C6

CODE_BBD8C9:
	LDX current_sprite			;$BBD8C9
	LDA sprite.general_purpose_64,x		;$BBD8CB
	SEC					;$BBD8CD
	SBC #$0100				;$BBD8CE
	BCC CODE_BBD8D6				;$BBD8D1
	STA sprite.general_purpose_64,x		;$BBD8D3
	RTS					;$BBD8D5

CODE_BBD8D6:
	SEP #$20				;$BBD8D6
	STA sprite.general_purpose_64+1,x	;$BBD8D8
	REP #$20				;$BBD8DA
	DEC sprite.general_purpose_62,x		;$BBD8DC
	BMI CODE_BBD914				;$BBD8DE
	JSR CODE_BBD915				;$BBD8E0
	LDA sprite.general_purpose_62,x		;$BBD8E3
	CMP #$0006				;$BBD8E5
	BCC CODE_BBD906				;$BBD8E8
	CMP #$000B				;$BBD8EA
	BCC CODE_BBD8F7				;$BBD8ED
	LDA #$0563				;$BBD8EF
	JSL CODE_B28018				;$BBD8F2
	RTS					;$BBD8F6

CODE_BBD8F7:
	LDA #$0564				;$BBD8F7
	JSL CODE_B28018				;$BBD8FA
	LDA #$0062				;$BBD8FE
	JSL CODE_B28018				;$BBD901
	RTS					;$BBD905

CODE_BBD906:
	LDA #$0565				;$BBD906
	JSL CODE_B28018				;$BBD909
	LDA #$0062				;$BBD90D
	JSL CODE_B28018				;$BBD910
CODE_BBD914:
	RTS					;$BBD914

CODE_BBD915:
	LDX current_sprite			;$BBD915
	LDA sprite.general_purpose_62,x		;$BBD917
	STA CPU.dividen_low			;$BBD919
	SEP #$20				;$BBD91C
	LDA #$0A				;$BBD91E
	STA CPU.divisor				;$BBD920
	REP #$20				;$BBD923
	LDA ($00)				;$BBD925
	NOP					;$BBD927
	LDY sprite.general_purpose_5C,x		;$BBD928
	LDA CPU.divide_result			;$BBD92A
	ASL					;$BBD92D
	ASL					;$BBD92E
	ADC CPU.divide_result			;$BBD92F
	ADC sprite.general_purpose_6C,x		;$BBD932
	STA sprite.sprite_graphic,x		;$BBD934
	LDA CPU.divide_remainder		;$BBD936
	ASL					;$BBD939
	ASL					;$BBD93A
	ADC CPU.divide_remainder		;$BBD93B
	ADC sprite.general_purpose_6C,x		;$BBD93E
	STA.w sprite.sprite_graphic,y		;$BBD940
	RTS					;$BBD943

CODE_BBD944:
	LDX current_sprite			;$BBD944
	LDY sprite.general_purpose_5C,x		;$BBD946
	LDA sprite.general_purpose_62,x		;$BBD948
	BEQ CODE_BBD964				;$BBD94A
	CMP #$0006				;$BBD94C
	BCC CODE_BBD95F				;$BBD94F
	CMP #$000B				;$BBD951
	BCC CODE_BBD95A				;$BBD954
	STX bonus_timer_index			;$BBD956
	RTS					;$BBD959

CODE_BBD95A:
	LDA #$0007				;$BBD95A
	BRA CODE_BBD967				;$BBD95D

CODE_BBD95F:
	LDA #$0003				;$BBD95F
	BRA CODE_BBD967				;$BBD962

CODE_BBD964:
	LDA #$0000				;$BBD964
CODE_BBD967:
	AND active_frame_counter		;$BBD967
	BNE CODE_BBD973				;$BBD969
	LDA bonus_timer_index			;$BBD96B
	EOR current_sprite			;$BBD96E
	STA bonus_timer_index			;$BBD970
CODE_BBD973:
	RTS					;$BBD973

CODE_BBD974:
	LDA $05B1				;$BBD974
	AND #$0002				;$BBD977
	CMP #$0001				;$BBD97A
	RTS					;$BBD97D

floor_door_main:
	JMP (.state_table,x)			;$BBD97E

.state_table:
	dw CODE_BBD989
	dw CODE_BBD9B3
	dw CODE_BBD9E3
	dw CODE_BBDA3B

CODE_BBD989:
	LDA.w sprite.sub_state,y		;$BBD989
	AND #$00FF				;$BBD98C
	BNE CODE_BBD9A5				;$BBD98F
	JSR CODE_BBDA8F				;$BBD991
	BCC CODE_BBD9A2				;$BBD994
	LDA #$0000				;$BBD996
	JSR CODE_BBDAC5				;$BBD999
	BCC CODE_BBD9A2				;$BBD99C
	LDX current_sprite			;$BBD99E
	INC sprite.sub_state,x			;$BBD9A0
CODE_BBD9A2:
	JMP CODE_BBC827				;$BBD9A2

CODE_BBD9A5:
	LDA $15E2				;$BBD9A5
	BNE CODE_BBD9B0				;$BBD9A8
	LDA #$0000				;$BBD9AA
	STA.w sprite.state,y			;$BBD9AD
CODE_BBD9B0:
	JMP CODE_BBC827				;$BBD9B0

CODE_BBD9B3:
	LDA.w sprite.sub_state,y		;$BBD9B3
	AND #$00FF				;$BBD9B6
	BNE CODE_BBD9D5				;$BBD9B9
	JSR CODE_BBDA8F				;$BBD9BB
	BCC CODE_BBD9D2				;$BBD9BE
	LDA #$0000				;$BBD9C0
	JSR CODE_BBDAC5				;$BBD9C3
	BCC CODE_BBD9D2				;$BBD9C6
	LDA #$00FF				;$BBD9C8
	TRB $04C3				;$BBD9CB
	LDX current_sprite			;$BBD9CE
	INC sprite.sub_state,x			;$BBD9D0
CODE_BBD9D2:
	JMP CODE_BBC827				;$BBD9D2

CODE_BBD9D5:
	LDA $15E2				;$BBD9D5
	BNE CODE_BBD9E0				;$BBD9D8
	LDA #$0000				;$BBD9DA
	STA.w sprite.state,y			;$BBD9DD
CODE_BBD9E0:
	JMP CODE_BBC827				;$BBD9E0

CODE_BBD9E3:
	LDA.w sprite.general_purpose_5E,y	;$BBD9E3
	BEQ CODE_BBDA32				;$BBD9E6
	AND $04C3				;$BBD9E8
	BEQ CODE_BBDA32				;$BBD9EB
	LDX current_sprite			;$BBD9ED
	LDA #$2000				;$BBD9EF
	STA sprite.oam_property,x		;$BBD9F2
	JSL CODE_BB85EE				;$BBD9F4
	BCS CODE_BBDA2F				;$BBD9F8
	LDA #$001D				;$BBD9FA
	JSL CODE_BB859A				;$BBD9FD
	LDX current_sprite			;$BBDA01
	EOR sprite.oam_property,x		;$BBDA03
	AND #$0E00				;$BBDA05
	EOR sprite.oam_property,x		;$BBDA08
	STA sprite.oam_property,x		;$BBDA0A
	LDA #$00C0				;$BBDA0C
	STA sprite.render_order,x		;$BBDA0F
	LDA #$8001				;$BBDA11
	STA sprite.visibility,x			;$BBDA14
	LDA #$04FC				;$BBDA16
	STA sprite.unknown_58,x			;$BBDA19
	TXY					;$BBDA1B
	LDX #$006C				;$BBDA1C
	LDA.l DATA_B9B6E7,x			;$BBDA1F
	TYX					;$BBDA23
	STA sprite.sprite_graphic,x		;$BBDA24
	STZ sprite.sprite_graphic_mirror,x	;$BBDA26
	STZ sprite.last_rendered_graphic,x	;$BBDA28
	INC sprite.state,x			;$BBDA2A
	JML [$04F5]				;$BBDA2C

CODE_BBDA2F:
	JMP CODE_BBC827				;$BBDA2F

CODE_BBDA32:
	LDA #$0000				;$BBDA32
	STA.w sprite.state,y			;$BBDA35
	JMP CODE_BBC827				;$BBDA38

CODE_BBDA3B:
	LDA.w sprite.sub_state,y		;$BBDA3B
	AND #$00FF				;$BBDA3E
	BNE CODE_BBDA81				;$BBDA41
	JSR CODE_BBDA8F				;$BBDA43
	BCC CODE_BBDA55				;$BBDA46
	LDX current_sprite			;$BBDA48
	LDA sprite.general_purpose_5E,x		;$BBDA4A
	JSR CODE_BBDAC5				;$BBDA4C
	BCC CODE_BBDA55				;$BBDA4F
	LDX current_sprite			;$BBDA51
	INC sprite.sub_state,x			;$BBDA53
CODE_BBDA55:
	JSL CODE_BBAB29				;$BBDA55
	BCC CODE_BBDA6E				;$BBDA59
	LDX current_sprite			;$BBDA5B
	JSL CODE_BB85EB				;$BBDA5D
	LDX current_sprite			;$BBDA61
	JSL CODE_BB859D				;$BBDA63
	JSL CODE_BB85A3				;$BBDA67
	JML [$04F5]				;$BBDA6B

CODE_BBDA6E:
	LDX current_sprite			;$BBDA6E
	LDA #$04FC				;$BBDA70
	LDY $15E2				;$BBDA73
	DEY					;$BBDA76
	BMI CODE_BBDA7C				;$BBDA77
	LDA #$06FD				;$BBDA79
CODE_BBDA7C:
	STA sprite.unknown_58,x			;$BBDA7C
	JML [$04F5]				;$BBDA7E

CODE_BBDA81:
	LDA $15E2				;$BBDA81
	BNE CODE_BBDA8C				;$BBDA84
	LDA #$0003				;$BBDA86
	STA.w sprite.state,y			;$BBDA89
CODE_BBDA8C:
	JMP CODE_BBC827				;$BBDA8C

CODE_BBDA8F:
	LDA #$0004				;$BBDA8F
	JSL CODE_BCE43C				;$BBDA92
	LDA #$0024				;$BBDA96
	PHK					;$BBDA99
	PEA CODE_BBDAA0-$01			;$BBDA9A
	JMP [$1864]				;$BBDA9D
CODE_BBDAA0:
	BCC CODE_BBDAC3				;$BBDAA0
	LDX current_sprite			;$BBDAA2
	LDY $78					;$BBDAA4
	LDA.w sprite.terrain_interaction,y	;$BBDAA6
	AND #$0001				;$BBDAA9
	BEQ CODE_BBDAC3				;$BBDAAC
	LDA.w sprite.x_position,y		;$BBDAAE
	CMP $1840				;$BBDAB1
	BCC CODE_BBDAC3				;$BBDAB4
	DEC					;$BBDAB6
	CMP $1844				;$BBDAB7
	BCS CODE_BBDAC3				;$BBDABA
	LDA.w sprite.y_speed,y			;$BBDABC
	BMI CODE_BBDAC3				;$BBDABF
	SEC					;$BBDAC1
	RTS					;$BBDAC2

CODE_BBDAC3:
	CLC					;$BBDAC3
	RTS					;$BBDAC4

CODE_BBDAC5:
	AND $04C2				;$BBDAC5
	BNE CODE_BBDADF				;$BBDAC8
	LDY $78					;$BBDACA
	LDA.w sprite.animation_flags,y		;$BBDACC
	AND #$3800				;$BBDACF
	CMP #$0800				;$BBDAD2
	BEQ CODE_BBDAFA				;$BBDAD5
	LDA.w sprite.terrain_interaction,y	;$BBDAD7
	AND #$0100				;$BBDADA
	BEQ CODE_BBDAFA				;$BBDADD
CODE_BBDADF:
	LDX current_sprite			;$BBDADF
	LDA sprite.general_purpose_5C,x		;$BBDAE1
	STA $15E8				;$BBDAE3
	LDA #$0005				;$BBDAE6
	LDY $15E2				;$BBDAE9
	STA $15E2				;$BBDAEC
	BNE CODE_BBDAF8				;$BBDAEF
	LDA #$0023				;$BBDAF1
	JSL CODE_BFF006				;$BBDAF4
CODE_BBDAF8:
	CLC					;$BBDAF8
	RTS					;$BBDAF9

CODE_BBDAFA:
	LDX current_sprite			;$BBDAFA
	LDA sprite.general_purpose_5C,x		;$BBDAFC
	STA $15E8				;$BBDAFE
	LDA #$0020				;$BBDB01
	STA $15E2				;$BBDB04
	LDA #$0022				;$BBDB07
	JSL CODE_BFF006				;$BBDB0A
	SEC					;$BBDB0E
	RTS					;$BBDB0F

kongfused_cliffs_rope_main:
	TYX					;$BBDB10
	LDA sprite.general_purpose_4C,x		;$BBDB11
	STA $1A					;$BBDB13
	LDA $6C					;$BBDB15
	STA $1C					;$BBDB17
	LDA #$0001				;$BBDB19
	STA $1E					;$BBDB1C
	BRA CODE_BBDB2A				;$BBDB1E

CODE_BBDB20:
	ASL $1E					;$BBDB20
	LDA $1A					;$BBDB22
	CLC					;$BBDB24
	ADC #$0008				;$BBDB25
	STA $1A					;$BBDB28
CODE_BBDB2A:
	LDA [$1A]				;$BBDB2A
	BMI CODE_BBDBA2				;$BBDB2C
	SEC					;$BBDB2E
	SBC $196D				;$BBDB2F
	CLC					;$BBDB32
	ADC #$0010				;$BBDB33
	CMP #$0120				;$BBDB36
	BCS CODE_BBDB20				;$BBDB39
	LDA sprite.general_purpose_5C,x		;$BBDB3B
	AND $1E					;$BBDB3D
	BNE CODE_BBDB20				;$BBDB3F
	LDY #$0002				;$BBDB41
	LDA [$1A],y				;$BBDB44
	SEC					;$BBDB46
	SBC $1973				;$BBDB47
	BMI CODE_BBDB51				;$BBDB4A
	CMP #$00F0				;$BBDB4C
	BCS CODE_BBDB20				;$BBDB4F
CODE_BBDB51:
	CLC					;$BBDB51
	INY					;$BBDB52
	INY					;$BBDB53
	ADC [$1A],y				;$BBDB54
	CLC					;$BBDB56
	ADC #$0010				;$BBDB57
	BMI CODE_BBDB20				;$BBDB5A
	LDA $1A					;$BBDB5C
	PHA					;$BBDB5E
	LDA $1E					;$BBDB5F
	PHA					;$BBDB61
	LDY #$0006				;$BBDB62
	LDA [$1A],y				;$BBDB65
	TAY					;$BBDB67
	JSL CODE_BB8603				;$BBDB68
	PLA					;$BBDB6C
	STA $1E					;$BBDB6D
	PLA					;$BBDB6F
	STA $1A					;$BBDB70
	BCS CODE_BBDBA2				;$BBDB72
	LDA $6C					;$BBDB74
	STA $1C					;$BBDB76
	LDY current_sprite			;$BBDB78
	LDX alternate_sprite			;$BBDB7A
	LDA.w sprite.oam_property,y		;$BBDB7C
	STA sprite.oam_property,x		;$BBDB7F
	LDA [$1A]				;$BBDB81
	STA sprite.x_position,x			;$BBDB83
	LDY #$0002				;$BBDB85
	LDA [$1A],y				;$BBDB88
	STA sprite.y_position,x			;$BBDB8A
	INY					;$BBDB8C
	INY					;$BBDB8D
	LDA [$1A],y				;$BBDB8E
	STZ sprite.general_purpose_5C,x		;$BBDB90
	STA sprite.general_purpose_5E,x		;$BBDB92
	STA sprite.general_purpose_60,x		;$BBDB94
	LDY current_sprite			;$BBDB96
	LDA.w sprite.general_purpose_5C,y	;$BBDB98
	ORA $1E					;$BBDB9B
	STA.w sprite.general_purpose_5C,y	;$BBDB9D
	STY sprite.general_purpose_4C,x		;$BBDBA0
CODE_BBDBA2:
	JML [$04F5]				;$BBDBA2

kongfused_cliffs_autoscroll_main:
	JMP (.state_table,x)			;$BBDBA5

.state_table:
	dw CODE_BBDBB0
	dw CODE_BBDBD0
	dw CODE_BBDBF5
	dw CODE_BBDC3D

CODE_BBDBB0:
	LDY #$0030				;$BBDBB0
	JSL CODE_BB8585				;$BBDBB3
	BCS CODE_BBDBCD				;$BBDBB7
	LDX current_sprite			;$BBDBB9
	INC sprite.state,x			;$BBDBBB
	LDY alternate_sprite			;$BBDBBD
	STY sprite.general_purpose_4E,x		;$BBDBBF
	STX sprite.general_purpose_4E,y		;$BBDBC1
	STZ sprite.general_purpose_62,x		;$BBDBC3
	LDA $05AF				;$BBDBC5
	STA sprite.general_purpose_66,x		;$BBDBC8
	JSR CODE_BBDCA3				;$BBDBCA
CODE_BBDBCD:
	JML [$04F5]				;$BBDBCD

CODE_BBDBD0:
	JSR CODE_BBDCE4				;$BBDBD0
	LDY current_sprite			;$BBDBD3
	LDX $18A1				;$BBDBD5
	BEQ CODE_BBDBEC				;$BBDBD8
	LDA sprite.y_position,x			;$BBDBDA
	CLC					;$BBDBDC
	ADC sprite.general_purpose_5E,x		;$BBDBDD
	STA $1A					;$BBDBDF
	LDA.w sprite.y_position,y		;$BBDBE1
	CLC					;$BBDBE4
	ADC.w sprite.general_purpose_5E,y	;$BBDBE5
	CMP $1A					;$BBDBE8
	BCC.b CODE_BBDBF2			;$BBDBEA
CODE_BBDBEC:
	STY $18A1				;$BBDBEC
	TYX					;$BBDBEF
	INC sprite.state,x			;$BBDBF0
CODE_BBDBF2:
	JML [$04F5]				;$BBDBF2

CODE_BBDBF5:
	JSR CODE_BBDCE4				;$BBDBF5
	JSR CODE_BBDC64				;$BBDBF8
	BMI CODE_BBDC4B				;$BBDBFB
	LDA $189F				;$BBDBFD
	CMP sprite.ground_y_position,x		;$BBDC00
	BCC CODE_BBDC20				;$BBDC02
	CPX $18A1				;$BBDC04
	BNE CODE_BBDC1A				;$BBDC07
	LDA sprite.general_purpose_5E,x		;$BBDC09
	CLC					;$BBDC0B
	ADC sprite.y_position,x			;$BBDC0C
	SEC					;$BBDC0E
	SBC #$00D8				;$BBDC0F
	CMP $189F				;$BBDC12
	BCS CODE_BBDC1A				;$BBDC15
	STA $189F				;$BBDC17
CODE_BBDC1A:
	JSR CODE_BBDCA3				;$BBDC1A
	JML [$04F5]				;$BBDC1D

CODE_BBDC20:
	INC sprite.state,x			;$BBDC20
	LDA #$0000				;$BBDC22
	STA $078F				;$BBDC25
	LDA $189F				;$BBDC28
	STA $04BE				;$BBDC2B
	LDA $0777				;$BBDC2E
	AND #$FF7F				;$BBDC31
	STA $0777				;$BBDC34
	JSR CODE_BBDCA3				;$BBDC37
	JML [$04F5]				;$BBDC3A

CODE_BBDC3D:
	JSR CODE_BBDCE4				;$BBDC3D
	JSR CODE_BBDC64				;$BBDC40
	BMI CODE_BBDC4B				;$BBDC43
	JSR CODE_BBDCA3				;$BBDC45
	JML [$04F5]				;$BBDC48

CODE_BBDC4B:
	CPX $18A1				;$BBDC4B
	BNE CODE_BBDC53				;$BBDC4E
	STZ $18A1				;$BBDC50
CODE_BBDC53:
	STZ sprite.oam_property,x		;$BBDC53
	LDY sprite.general_purpose_4E,x		;$BBDC55
	LDA #$0000				;$BBDC57
	STA.w sprite.general_purpose_4E,y	;$BBDC5A
	JSL delete_sprite_handle_deallocation	;$BBDC5D
	JML [$04F5]				;$BBDC61

CODE_BBDC64:
	LDX current_sprite			;$BBDC64
	LDA $05AF				;$BBDC66
	TAY					;$BBDC69
	EOR sprite.general_purpose_66,x		;$BBDC6A
	STY sprite.general_purpose_66,x		;$BBDC6C
	AND #$4000				;$BBDC6E
	BEQ CODE_BBDC80				;$BBDC71
	AND $05AF				;$BBDC73
	BNE CODE_BBDC80				;$BBDC76
	LDA #$003C				;$BBDC78
	STA sprite.general_purpose_64,x		;$BBDC7B
	LDA sprite.general_purpose_5E,x		;$BBDC7D
	RTS					;$BBDC7F

CODE_BBDC80:
	LDA sprite.general_purpose_64,x		;$BBDC80
	BNE CODE_BBDC9E				;$BBDC82
	STZ $3E					;$BBDC84
	LDA sprite.y_speed,x			;$BBDC86
	BPL CODE_BBDC8C				;$BBDC88
	DEC $3E					;$BBDC8A
CODE_BBDC8C:
	CLC					;$BBDC8C
	ADC sprite.general_purpose_5C+1,x	;$BBDC8D
	STA sprite.general_purpose_5C+1,x	;$BBDC8F
	SEP #$20				;$BBDC91
	LDA $3E					;$BBDC93
	ADC sprite.general_purpose_5E+1,x	;$BBDC95
	STA sprite.general_purpose_5E+1,x	;$BBDC97
	REP #$20				;$BBDC99
	LDA sprite.general_purpose_5E,x		;$BBDC9B
	RTS					;$BBDC9D

CODE_BBDC9E:
	DEC sprite.general_purpose_64,x		;$BBDC9E
	LDA sprite.general_purpose_5E,x		;$BBDCA0
	RTS					;$BBDCA2

CODE_BBDCA3:
	LDX current_sprite			;$BBDCA3
	LDY sprite.general_purpose_4E,x		;$BBDCA5
	LDA sprite.x_position,x			;$BBDCA7
	CLC					;$BBDCA9
	ADC #$0003				;$BBDCAA
	STA.w sprite.x_position,y		;$BBDCAD
	LDA sprite.general_purpose_62,x		;$BBDCB0
	INC					;$BBDCB2
	CMP #$0020				;$BBDCB3
	BCC CODE_BBDCBB				;$BBDCB6
	LDA #$0000				;$BBDCB8
CODE_BBDCBB:
	STA sprite.general_purpose_62,x		;$BBDCBB
	CMP #$0010				;$BBDCBD
	BCC CODE_BBDCC8				;$BBDCC0
	EOR #$FFFF				;$BBDCC2
	ADC #$0020				;$BBDCC5
CODE_BBDCC8:
	LSR					;$BBDCC8
	LSR					;$BBDCC9
	LSR					;$BBDCCA
	CLC					;$BBDCCB
	ADC sprite.general_purpose_5E,x		;$BBDCCC
	CMP #$0010				;$BBDCCE
	BCS CODE_BBDCD6				;$BBDCD1
	LDA #$0010				;$BBDCD3
CODE_BBDCD6:
	CLC					;$BBDCD6
	ADC sprite.y_position,x			;$BBDCD7
	STA.w sprite.y_position,y		;$BBDCD9
	LDA #$001F				;$BBDCDC
	JSL CODE_BFF009				;$BBDCDF
	RTS					;$BBDCE3

CODE_BBDCE4:
	LDX current_sprite			;$BBDCE4
	JSL CODE_BBDD25				;$BBDCE6
	LDA #$0080				;$BBDCEA
	JSL CODE_BCE58E				;$BBDCED
	BCS CODE_BBDCF4				;$BBDCF1
	RTS					;$BBDCF3

CODE_BBDCF4:
	LDY active_kong_control_variables	;$BBDCF4
	LDA $78					;$BBDCF7
	CMP active_kong_sprite			;$BBDCF9
	BEQ CODE_BBDD01				;$BBDCFC
	LDY follower_kong_control_variables	;$BBDCFE
CODE_BBDD01:
	LDA $0028,y				;$BBDD01
	STA $002E,y				;$BBDD04
	LDA $002A,y				;$BBDD07
	STA $0030,y				;$BBDD0A
	LDA $002C,y				;$BBDD0D
	STA $0032,y				;$BBDD10
	LDX current_sprite			;$BBDD13
	STX $28,y				;$BBDD15
	LDA #CODE_BBDD25			;$BBDD17
	STA $002A,y				;$BBDD1A
	LDA.w #CODE_BBDD25>>16			;$BBDD1D
	STA $002C,y				;$BBDD20
	SEC					;$BBDD23
	RTS					;$BBDD24

CODE_BBDD25:
	LDA sprite.x_position,x			;$BBDD25
	SEC					;$BBDD27
	SBC #$0008				;$BBDD28
	STA $1830				;$BBDD2B
	STA $1840				;$BBDD2E
	STA $D8					;$BBDD31
	CLC					;$BBDD33
	ADC #$0014				;$BBDD34
	STA $1834				;$BBDD37
	STA $1844				;$BBDD3A
	STA $DC					;$BBDD3D
	LDA sprite.y_position,x			;$BBDD3F
	STA $1832				;$BBDD41
	STA $1842				;$BBDD44
	STA $DA					;$BBDD47
	CLC					;$BBDD49
	ADC sprite.general_purpose_5E,x		;$BBDD4A
	STA $1836				;$BBDD4C
	STA $1846				;$BBDD4F
	STA $DE					;$BBDD52
	LDA sprite.general_purpose_5E,x		;$BBDD54
	CMP #$0010				;$BBDD56
	BCS CODE_BBDD5E				;$BBDD59
	STZ $1844				;$BBDD5B
CODE_BBDD5E:
	RTL					;$BBDD5E


rope_fire_main:
	JMP (.state_table,x)			;$BBDD5F

.state_table:
	dw .state_0
	dw .state_1

.state_0:
	JSL populate_sprite_clipping		;$BBDD66  \
	LDA #$0000				;$BBDD6A   | Get collision flags (hurt always)
	JSL CODE_BEC009				;$BBDD6D   | Check collision with kong
	LDX current_sprite			;$BBDD71   | Get fire sprite
	LDA sprite.general_purpose_4E,x		;$BBDD73   |
	BNE ..return				;$BBDD75   |
	INC sprite.state,x			;$BBDD77  / Set state 1
..return:
	JSL process_sprite_animation		;$BBDD79  \ Process animation
	JMP [$04F5]				;$BBDD7D  / Return

.state_1:
	JSL populate_sprite_clipping		;$BBDD80  \
	LDA #$0000				;$BBDD84   | Get collision flags (hurt always)
	JSL CODE_BEC009				;$BBDD87   | Check collision with kong
	JSL process_sprite_animation		;$BBDD8B   | Process animation
	JSL process_current_movement		;$BBDD8F   | Process current movement
	JMP CODE_BBC827				;$BBDD93  / Return (handle despawn?)


breakable_floor_main:
	JMP (.state_table,x)			;$BBDD96

.state_table:
	dw CODE_BBDD9D
	dw CODE_BBDDB6

CODE_BBDD9D:
	JSR CODE_BBDE22				;$BBDD9D
	BCS CODE_BBDDA5				;$BBDDA0
	JMP CODE_BBC827				;$BBDDA2

CODE_BBDDA5:
	LDY current_sprite			;$BBDDA5
	LDX sprite.general_purpose_5E,y		;$BBDDA7
	LDA.w sprite.general_purpose_60,y	;$BBDDA9
	JSR CODE_BBDE63				;$BBDDAC
	JSL delete_sprite_handle_deallocation	;$BBDDAF
	JML [$04F5]				;$BBDDB3

CODE_BBDDB6:
	JSR CODE_BBDE22				;$BBDDB6
	BCS CODE_BBDDC3				;$BBDDB9
	JSR CODE_BBDE42				;$BBDDBB
	BCS CODE_BBDDC3				;$BBDDBE
	JML [$04F5]				;$BBDDC0

CODE_BBDDC3:
	LDY current_sprite			;$BBDDC3
	LDX sprite.general_purpose_5E,y		;$BBDDC5
	LDA.w sprite.general_purpose_60,y	;$BBDDC7
	JSR CODE_BBDE63				;$BBDDCA
	LDX current_sprite			;$BBDDCD
	STZ sprite.visibility,x			;$BBDDCF
	LDA sprite.general_purpose_6C,x		;$BBDDD1
	BMI CODE_BBDDED				;$BBDDD3
	JSR CODE_BBDE7A				;$BBDDD5
	LDY #$0014				;$BBDDD8
	JSL CODE_BB8585				;$BBDDDB
	LDA #$060C				;$BBDDDF
	JSL queue_sound_effect			;$BBDDE2
	JSL delete_sprite_handle_deallocation	;$BBDDE6
	JML [$04F5]				;$BBDDEA

CODE_BBDDED:
	JSR CODE_BBDDFE				;$BBDDED
	LDA #$060C				;$BBDDF0
	JSL queue_sound_effect			;$BBDDF3
	JSL delete_sprite_handle_deallocation	;$BBDDF7
	JML [$04F5]				;$BBDDFB

CODE_BBDDFE:
	LDY #$0014				;$BBDDFE
	JSL CODE_BB8585				;$BBDE01
	LDY #$0016				;$BBDE05
	JSL CODE_BB85B8				;$BBDE08
	LDY #$0018				;$BBDE0C
	JSL CODE_BB85B8				;$BBDE0F
	LDY #$001A				;$BBDE13
	JSL CODE_BB85B8				;$BBDE16
	LDY #$001C				;$BBDE1A
	JSL CODE_BB85B8				;$BBDE1D
	RTS					;$BBDE21

CODE_BBDE22:
	LDA.w sprite.general_purpose_5C,y	;$BBDE22
	JSL CODE_BCE43C				;$BBDE25
	LDA #$0400				;$BBDE29
	JSL check_sprite_collision		;$BBDE2C
	BCC CODE_BBDE41				;$BBDE30
	LDX current_sprite			;$BBDE32
	LDY $78					;$BBDE34
	LDA #$0200				;$BBDE36
	ORA.w sprite.carry_or_defeated_flags,y	;$BBDE39
	STA.w sprite.carry_or_defeated_flags,y	;$BBDE3C
	STX sprite.unknown_3E,y			;$BBDE3F
CODE_BBDE41:
	RTS					;$BBDE41

CODE_BBDE42:
	LDA #$0020				;$BBDE42
	JSL CODE_BCE58E				;$BBDE45
	BCC CODE_BBDE61				;$BBDE49
	LDY $78					;$BBDE4B
	LDA.w sprite.state,y			;$BBDE4D
	CMP #!kong_state_4F			;$BBDE50
	BNE CODE_BBDE61				;$BBDE53
	LDA.w sprite.terrain_interaction,y	;$BBDE55
	AND #$0101				;$BBDE58
	CMP #$0001				;$BBDE5B
	BNE CODE_BBDE61				;$BBDE5E
	RTS					;$BBDE60

CODE_BBDE61:
	CLC					;$BBDE61
	RTS					;$BBDE62

CODE_BBDE63:
	SEP #$20				;$BBDE63
	CMP #$01				;$BBDE65
	BCC CODE_BBDE75				;$BBDE67
	BEQ CODE_BBDE70				;$BBDE69
	XBA					;$BBDE6B
	EOR sprite.type,x			;$BBDE6C
	BRA CODE_BBDE75				;$BBDE6E

CODE_BBDE70:
	XBA					;$BBDE70
	ORA sprite.type,x			;$BBDE71
	BRA CODE_BBDE75				;$BBDE73

CODE_BBDE75:
	STA sprite.type,x			;$BBDE75
	REP #$20				;$BBDE77
	RTS					;$BBDE79

CODE_BBDE7A:
	CMP #$0004				;$BBDE7A
	BCS CODE_BBDE8D				;$BBDE7D
	TAX					;$BBDE7F
	LDA.l DATA_BBDF15,x			;$BBDE80
	AND kong_letter_flags			;$BBDE84
	BEQ CODE_BBDE8C				;$BBDE87
	LDX #$0004				;$BBDE89
CODE_BBDE8C:
	TXA					;$BBDE8C
CODE_BBDE8D:
	PHA					;$BBDE8D
	LDY #$006E				;$BBDE8E
	JSL CODE_BB8585				;$BBDE91
	PLA					;$BBDE95
	CMP #$0011				;$BBDE96
	BNE CODE_BBDEAE				;$BBDE99
	LDX alternate_sprite			;$BBDE9B
	JSL CODE_BB85EB				;$BBDE9D
	LDA $18F7				;$BBDEA1
	AND #$01E0				;$BBDEA4
	ORA sprite.oam_property,x		;$BBDEA7
	STA sprite.oam_property,x		;$BBDEA9
	LDA #$0011				;$BBDEAB
CODE_BBDEAE:
	LDY alternate_sprite			;$BBDEAE
	STA $3A					;$BBDEB0
	ASL					;$BBDEB2
	ADC $3A					;$BBDEB3
	ASL					;$BBDEB5
	TAX					;$BBDEB6
	LDA.l DATA_FF257C+$04,x			;$BBDEB7
	STA.w sprite.general_purpose_5C,y	;$BBDEBB
	LDA.l DATA_FF257C+$02,x			;$BBDEBE
	STA.w sprite.animation_id,y		;$BBDEC2
	LDA.l DATA_FF257C,x			;$BBDEC5
	CMP #$0100				;$BBDEC9
	BCC CODE_BBDED4				;$BBDECC
	JSL CODE_BB8609				;$BBDECE
	BRA CODE_BBDEF3				;$BBDED2

CODE_BBDED4:
	TAY					;$BBDED4
	JSL CODE_BB859A				;$BBDED5
	LDX alternate_sprite			;$BBDED9
	EOR sprite.oam_property,x		;$BBDEDB
	AND #$0E00				;$BBDEDD
	EOR sprite.oam_property,x		;$BBDEE0
	LDY active_kong_sprite			;$BBDEE2
	EOR.w sprite.oam_property,y		;$BBDEE5
	AND #$CFFF				;$BBDEE8
	EOR.w sprite.oam_property,y		;$BBDEEB
	AND #$BFFF				;$BBDEEE
	STA sprite.oam_property,x		;$BBDEF1
CODE_BBDEF3:
	LDX alternate_sprite			;$BBDEF3
	LDA sprite.animation_id,x		;$BBDEF5
	JSL set_alt_sprite_animation		;$BBDEF7
	LDX alternate_sprite			;$BBDEFB
	LDY current_sprite			;$BBDEFD
	LDA.w sprite.general_purpose_4C,y	;$BBDEFF
	STA sprite.general_purpose_62,x		;$BBDF02
	LDA.w sprite.general_purpose_4E,y	;$BBDF04
	STA sprite.general_purpose_64,x		;$BBDF07
	LDA.w sprite.general_purpose_50,y	;$BBDF09
	STA sprite.general_purpose_66,x		;$BBDF0C
	LDA.w sprite.general_purpose_52,y	;$BBDF0E
	STA sprite.general_purpose_6A,x		;$BBDF11
	CLC					;$BBDF13
	RTS					;$BBDF14

DATA_BBDF15:
	db $01,$02,$04,$08,$10,$20,$40,$80

unknown_sprite_0140_main:
	JMP (.state_table,x)			;$BBDF1D

.state_table:
	dw CODE_BBDF28
	dw CODE_BBDF36
	dw CODE_BBDF53
	dw CODE_BBDF5D

CODE_BBDF28:
	LDA.w sprite.general_purpose_5C,y	;$BBDF28
	JSL queue_sound_effect			;$BBDF2B
	JSL delete_sprite_handle_deallocation	;$BBDF2F
	JML [$04F5]				;$BBDF33

CODE_BBDF36:
	TYX					;$BBDF36
	LDA sprite.sub_state,x			;$BBDF37
	AND #$00FF				;$BBDF39
	BNE CODE_BBDF42				;$BBDF3C
	INC sprite.sub_state,x			;$BBDF3E
	STZ sprite.general_purpose_60,x		;$BBDF40
CODE_BBDF42:
	DEC sprite.general_purpose_60,x		;$BBDF42
	BPL CODE_BBDF50				;$BBDF44
	LDA sprite.general_purpose_5E,x		;$BBDF46
	STA sprite.general_purpose_60,x		;$BBDF48
	LDA sprite.general_purpose_5C,x		;$BBDF4A
	JSL queue_sound_effect			;$BBDF4C
CODE_BBDF50:
	JMP CODE_BBC827				;$BBDF50

CODE_BBDF53:
	LDA.w sprite.general_purpose_5C,y	;$BBDF53
	JSL CODE_B28024				;$BBDF56
	JMP CODE_BBC827				;$BBDF5A

CODE_BBDF5D:
	LDA.w sprite.state,y			;$BBDF5D
	CMP #$0100				;$BBDF60
	BCS CODE_BBDF6C				;$BBDF63
	LDA.w sprite.general_purpose_5C,y	;$BBDF65
	JSL queue_sound_effect			;$BBDF68
CODE_BBDF6C:
	JMP CODE_BBC827				;$BBDF6C

if !include_garbage_data == 1
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