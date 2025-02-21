DEF DIRECTION_LEFT  EQU 0
DEF DIRECTION_RIGHT EQU 1

; jump vel constants
DEF MAX_JUMP_VEL_INDEX     EQU $27
DEF FALLING_JUMP_VEL_INDEX EQU $18

	const_def
	const JUMP_VEL_NONE             ; 0
	const JUMP_VEL_KNOCK_BACK       ; 1
	const JUMP_VEL_NORMAL           ; 2
	const JUMP_VEL_HIGH_JUMP        ; 3
	const JUMP_VEL_BOUNCY_JUMP      ; 4
	const JUMP_VEL_BOUNCY_HIGH_JUMP ; 5

; number of times Wario has to wiggle
; to escape being picked up in the duration window
DEF NUM_WIGGLES_TO_ESCAPE EQU 6
; duration window that Wario can decrement
DEF MAX_PICKED_UP_FRAME_COUNTER EQU 32

; wFloorTransitionDir flags
DEF FLOOR_TRANSITION_DOWN_F EQU 2
DEF FLOOR_TRANSITION_UP_F   EQU 3

DEF FLOOR_TRANSITION_DOWN  EQU 1 << FLOOR_TRANSITION_DOWN_F
DEF FLOOR_TRANSITION_UP    EQU 1 << FLOOR_TRANSITION_UP_F

; wCollisionPoints flags
	const_def
	const COLLISION_DOWN_F ; 0
	const COLLISION_UNK1_F ; 1
	const COLLISION_UNK2_F ; 2
	const COLLISION_UNK3_F ; 3
	const COLLISION_UNK4_F ; 4
	const COLLISION_UNK5_F ; 5
	const COLLISION_UNK6_F ; 6
	const COLLISION_UNK7_F ; 7

DEF COLLISION_DOWN EQU 1 << COLLISION_DOWN_F
DEF COLLISION_UNK1 EQU 1 << COLLISION_UNK1_F
DEF COLLISION_UNK2 EQU 1 << COLLISION_UNK2_F
DEF COLLISION_UNK3 EQU 1 << COLLISION_UNK3_F
DEF COLLISION_UNK4 EQU 1 << COLLISION_UNK4_F
DEF COLLISION_UNK5 EQU 1 << COLLISION_UNK5_F
DEF COLLISION_UNK6 EQU 1 << COLLISION_UNK6_F
DEF COLLISION_UNK7 EQU 1 << COLLISION_UNK7_F

; flags set for wWaterCurrent
	const_def
	const CURRENT_RIGHT_F ; 0
	const CURRENT_LEFT_F  ; 1
	const CURRENT_UP_F    ; 2
	const CURRENT_DOWN_F  ; 3

DEF CURRENT_RIGHT EQU 1 << CURRENT_RIGHT_F
DEF CURRENT_LEFT  EQU 1 << CURRENT_LEFT_F
DEF CURRENT_UP    EQU 1 << CURRENT_UP_F
DEF CURRENT_DOWN  EQU 1 << CURRENT_DOWN_F

; wObjSlopeInteraction and wWarioSlopeInteraction constants
	const_def
	const RIGHT_SLOPE_F ; 0
	const LEFT_SLOPE_F  ; 1

DEF ON_SLOPE    EQU $10
DEF RIGHT_SLOPE EQU 1 << RIGHT_SLOPE_F
DEF LEFT_SLOPE  EQU 1 << LEFT_SLOPE_F

; wWaterInteraction constants
	const_def 1
	const SUBMERSIBLE_WATER     ; $1
	const NON_SUBMERSIBLE_WATER ; $2

; wLadderInteraction constants
	const_def 1
	const LADDER_COLLISION  ; $1
	const LADDER_UNDERNEATH ; $2

; wBlockFuncSpecialCollision constants
	const_def 1
	const COLLISION_THROWN_OBJ       ; $1
	const COLLISION_ROBO_MOUSE_BREAK ; $2
	const COLLISION_ROBO_MOUSE_FREE  ; $3
