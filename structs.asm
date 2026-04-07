includeonce

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ROM structures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

struct sprite $0000
	.type 				skip 2 	;00,x
	.main_routine_address:		skip 2 	;02,x
	.main_routine_bank:		skip 2 	;04,x
	.constants_address:		skip 2  ;06,x
	.placement_number:		skip 2  ;08,x
	.placement_parameter:		skip 2  ;0A,x
	.offscreen_despawn_time:	skip 2  ;0C,x
	.render_order:			skip 2  ;0E,x
	.x_sub_position:		skip 2  ;10,x
	.x_position:			skip 2  ;12,x
	.y_sub_position:		skip 2  ;14,x
	.y_position:			skip 2  ;16,x
	.ground_y_position:		skip 2  ;18,x
	.ground_distance:		skip 2  ;1A,x
	.terrain_attributes:		skip 2  ;1C,x
	.oam_property:			skip 2  ;1E,x
	.last_rendered_graphic:		skip 2  ;20,x
	.current_graphic_mirror:	skip 2  ;22,x
	.current_graphic:		skip 2  ;24,x
	.display_mode:			skip 2  ;26,x
	.terrain_interaction:		skip 1  ;28,x
	.last_terrain_interaction:	skip 1  ;29,x
	.x_speed:			skip 2  ;2A,x
	.unknown_2C:			skip 1  ;2C,x
	.unknown_2D:			skip 1	;2D,x
	.y_speed:			skip 2  ;2E,x
	.max_x_speed:			skip 2  ;30,x
	.unknown_32:			skip 1  ;32,x
	.unknown_33:			skip 1  ;33,x
	.max_y_speed:			skip 2  ;34,x
	.slip_velocity:			skip 2  ;36,x
	.state:				skip 1  ;38,x
	.sub_state:			skip 1  ;39,x
	.interaction_flags:		skip 2  ;3A,x
	.carry_or_defeat_flags:		skip 2  ;3C,x
	.unknown_3E:			skip 2  ;3E,x 34,x in DKC2
	.animation_id:			skip 2  ;40,x
	.animation_timer:		skip 2  ;42,x
	.animation_speed:		skip 2  ;44,x
	.animation_address:		skip 2  ;46,x
	.animation_routine:		skip 2  ;48,x
	.animation_flags:		skip 2  ;4A,x
	.general_purpose_4C:		skip 2  ;4C,x
	.general_purpose_4E:		skip 2  ;4E,x
	.general_purpose_50:		skip 2  ;50,x
	.general_purpose_52:		skip 2  ;52,x
	.unknown_54:			skip 2  ;54,x sometimes copy of X position
	.unknown_56:			skip 2  ;56,x sometimes copy of Y position
	.unknown_58:			skip 2  ;58,x standable sprite related?
	.movement_state:		skip 1  ;5A,x
	.movement_sub_state:		skip 1  ;5B,x
	.general_purpose_5C:		skip 2  ;5C,x movement behavior: home X position
	.general_purpose_5E:		skip 2  ;5E,x movement behavior: home Y position
	.general_purpose_60:		skip 2  ;60,x movement behavior: horizontal deviation distance
	.general_purpose_62:		skip 2  ;62,x movement behavior: X velocity 
	.general_purpose_64:		skip 2  ;64,x movement behavior: vertical deviation distance
	.general_purpose_66:		skip 2  ;66,x movement behavior: Y velocity
	.general_purpose_68:		skip 2  ;68,x movement behavior?
	.general_purpose_6A:		skip 2  ;6A,x movement behavior?
	.general_purpose_6C:		skip 2  ;6C,x movement behavior?
endstruct

struct kong_control $0000
	.animation_id:			skip 2	;00 animation number (no kong offset)
	.input_pressed:			skip 2	;02 Copy of the active players inputs that were just pressed
	.input_held:			skip 2	;04 Copy of the active players inputs that are pressed or held down
	.fast_flag:			skip 2	;06 04 if a direction was held with Y
	.gravity_force:			skip 2	;08 Gravity force
	.max_fall_speed:		skip 2	;0A Terminal velocity
	.unknown_0C:			skip 2	;0C Appears to be used for dixie, something to do with rolling/gliding, checked by animation code
	.roll_speed:			skip 2	;0E Roll speed
	.roll_event_time:		skip 2	;10 A record of the time that a roll was triggered
	.jump_event_time:		skip 2	;12 A record of the time that a jump was triggered
	.flash_timer:			skip 2	;14 Invincibility flash timer
	.invincible_timer:		skip 2	;16 Invincibility timer
	.input_held_y_event:		skip 2	;18 A record of the held input state when Y was pressed
	.y_press_time:			skip 2	;1A A record of the latest time that Y was pressed
	.y_old_press_time:		skip 2	;1C A record of the previous time that Y was pressed
	.y_release_time:		skip 2	;1E A record of the time that the latest Y press was released
	.y_old_release_time:		skip 2	;20 A record of the time that the previous Y press was released
	.b_press_time:			skip 2	;22 A record of the last time B was pressed
	.roll_gravity_delay:		skip 2	;24 Amount of time before gravity force should be applied when rolling off a ledge
endstruct