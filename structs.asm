includeonce

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ROM structures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

struct sprite $0000
	.type 				skip 2 		;00,x
	.main_routine_address:		skip 2 		;02,x
	.main_routine_bank:		skip 2 		;04,x
	.constants_address:		skip 2  	;06,x
	.placement_number:		skip 2  	;08,x
	.placement_parameter:		skip 2  	;0A,x
	.offscreen_despawn_time:	skip 2  	;0C,x
	.render_order:			skip 2  	;0E,x
	.x_sub_position:		skip 2  	;10,x
	.x_position:			skip 2  	;12,x
	.y_sub_position:		skip 2  	;14,x
	.y_position:			skip 2  	;16,x
	.ground_y_position:		skip 2  	;18,x
	.ground_distance:		skip 2  	;1A,x
	.terrain_attributes:		skip 2  	;1C,x
	.oam_property:			skip 2  	;1E,x
	.last_rendered_graphic:		skip 2  	;20,x
	.current_graphic_mirror:	skip 2  	;22,x
	.current_graphic:		skip 2  	;24,x
	.display_mode:			skip 2  	;26,x
	.terrain_interaction:		skip 2  	;28,x
	.x_speed:			skip 2  	;2A,x
	.unknown_2C:			skip 1  	;2C,x
	.unknown_2D:			skip 1		;2D,x
	.y_speed:			skip 2  	;2E,x
	.max_x_speed:			skip 2  	;30,x
	.unknown_32:			skip 1  	;32,x
	.unknown_33:			skip 1  	;33,x
	.max_y_speed:			skip 2  	;34,x
	.slip_velocity:			skip 2  	;36,x
	.state:				skip 1  	;38,x
	.sub_state:			skip 1  	;39,x
	.interaction_flags:		skip 2  	;3A,x
	.carry_or_defeat_flags:		skip 2  	;3C,x
	.unknown_3E:			skip 2  	;3E,x   34,x in DKC2
	.animation_id:			skip 2  	;40,x
	.animation_timer:		skip 2  	;42,x
	.animation_speed:		skip 2  	;44,x
	.animation_address:		skip 2  	;46,x
	.animation_routine:		skip 2  	;48,x
	.animation_flags:		skip 2  	;4A,x
	.general_purpose_4C:		skip 2  	;4C,x
	.general_purpose_4E:		skip 2  	;4E,x
	.general_purpose_50:		skip 2  	;50,x
	.general_purpose_52:		skip 2  	;52,x
	.unknown_54:			skip 2  	;54,x   sometimes copy of X position
	.unknown_56:			skip 2  	;56,x   sometimes copy of Y position
	.unknown_58:			skip 2  	;58,x   standable sprite related?
	.movement_state:		skip 1  	;5A,x
	.movement_sub_state:		skip 1  	;5B,x
	.general_purpose_5C:		skip 2  	;5C,x   movement behavior: home X position
	.general_purpose_5E:		skip 2  	;5E,x   movement behavior: home Y position
	.general_purpose_60:		skip 2  	;60,x   movement behavior: horizontal deviation distance
	.general_purpose_62:		skip 2  	;62,x   movement behavior: X velocity 
	.general_purpose_64:		skip 2  	;64,x   movement behavior: vertical deviation distance
	.general_purpose_66:		skip 2  	;66,x   movement behavior: Y velocity
	.general_purpose_68:		skip 2  	;68,x   movement behavior?
	.general_purpose_6A:		skip 2  	;6A,x   movement behavior?
	.general_purpose_6C:		skip 2  	;6C,x   movement behavior?
endstruct

struct sprite_DMA sprite_DMA_buffer
	.size:		skip 2
	.destination:	skip 2
	.source_word:	skip 2
	.terminate:
	.source_bank:	skip 2
endstruct