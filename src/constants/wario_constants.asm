DIRECTION_LEFT  EQU 0
DIRECTION_RIGHT EQU 1

; number of cycles before Wario falls asleep
; while in the idle state
NUM_SLEEPING_IDLE_CYCLES EQU 7

; number of attack frames on the ground
MAX_ATTACK_COUNTER EQU $30
; after wAttackCounter reaches this value
; Wario will start to charge 
CHARGE_ATTACK_COUNTER EQU $2b

; power up level constants
	const_def
	const POWER_UP_NONE                     ; 0
	const POWER_UP_LEAD_OVERALLS            ; 1
	const POWER_UP_SWIMMING_FLIPPERS        ; 2
	const POWER_UP_HEAD_SMASH_HELMET        ; 3
	const POWER_UP_GRAB_GLOVE               ; 4
	const POWER_UP_GARLIC                   ; 5
	const POWER_UP_SUPER_JUMP_SLAM_OVERALLS ; 6
	const POWER_UP_HIGH_JUMP_BOOTS          ; 7
	const POWER_UP_PRINCE_FROGS_GLOVES      ; 8
	const POWER_UP_SUPER_GRAB_GLOVES        ; 9

; jump vel constants
MAX_JUMP_VEL_INDEX     EQU $27
FALLING_JUMP_VEL_INDEX EQU $18

	const_def
	const JUMP_VEL_NONE             ; 0
	const JUMP_VEL_KNOCK_BACK       ; 1
	const JUMP_VEL_NORMAL           ; 2
	const JUMP_VEL_HIGH_JUMP        ; 3
	const JUMP_VEL_BOUNCY_JUMP      ; 4
	const JUMP_VEL_BOUNCY_HIGH_JUMP ; 5

; number of times Wario has to wiggle
; to escape being picked up in the duration window
NUM_WIGGLES_TO_ESCAPE EQU 6
; duration window that Wario can decrement
MAX_PICKED_UP_FRAME_COUNTER EQU 32

; transformation constants
	const_def 1
	const TRANSFORMATION_HOT_WARIO           ; $01
	const TRANSFORMATION_FLAT_WARIO          ; $02
	const TRANSFORMATION_BALL_O_STRING_WARIO ; $03
	const TRANSFORMATION_FAT_WARIO           ; $04
	const TRANSFORMATION_ELECTRIC            ; $05
	const TRANSFORMATION_INVISIBLE_WARIO     ; $06
	const TRANSFORMATION_PUFFY_WARIO         ; $07
	const TRANSFORMATION_ZOMBIE_WARIO        ; $08 
	const TRANSFORMATION_BOUNCY_WARIO        ; $09
	const TRANSFORMATION_CRAZY_WARIO         ; $0a
	const TRANSFORMATION_VAMPIRE_WARIO       ; $0b
	const TRANSFORMATION_BUBBLE              ; $0c
	const TRANSFORMATION_ICE_SKATIN          ; $0d
	const TRANSFORMATION_OWL_WARIO           ; $0e
	const TRANSFORMATION_RAIL                ; $0f
	const TRANSFORMATION_SNOWMAN_WARIO       ; $10
	const TRANSFORMATION_SPLIT               ; $11
	const TRANSFORMATION_UNK_12              ; $12
	const TRANSFORMATION_BLIND               ; $13
	const TRANSFORMATION_UNK_14              ; $14
	const TRANSFORMATION_MAGIC               ; $15
	const TRANSFORMATION_BALL              ; $16
	const TRANSFORMATION_UNK_17              ; $17
	const TRANSFORMATION_UNK_18              ; $18
	const TRANSFORMATION_UNK_19              ; $19
	const TRANSFORMATION_UNK_1A              ; $1a
	const TRANSFORMATION_UNK_1B              ; $1b
	const TRANSFORMATION_UNK_1C              ; $1c
	const TRANSFORMATION_UNK_1D              ; $1d
	const TRANSFORMATION_UNK_1E              ; $1e
	const TRANSFORMATION_UNK_1F              ; $1f

HOT_WARIO_DURATION    EQU 600
FAT_WARIO_DURATION    EQU 420
BOUNCY_WARIO_DURATION EQU 900

; after this value is reached in the
; Hot Wario transformation duration,
; switch from OnFire to Hot state
HOT_WARIO_TRANSITION_DURATION EQU 300

; grab constants used for wGrabState
	const_def
	const GRAB_NONE                ; $0
	const GRAB_PICK_UP             ; $1
	const GRAB_UNK_02              ; $2
	const GRAB_IDLE                ; $3
	const GRAB_CHARGE_THROW        ; $4
	const GRAB_THROW_FULLY_CHARGED ; $5
	const GRAB_HOLD_FULL_CHARGE    ; $6
	const GRAB_THROW               ; $7

	const_def 4
	const GRAB_UNUSED_0_F    ; 4
	const GRAB_UNUSED_1_F    ; 5
	const GRAB_FULL_CHARGE_F ; 6
	const GRAB_HEAVY_F       ; 7

GRAB_FLAGS_MASK EQU (1 << GRAB_UNUSED_0_F) | (1 << GRAB_UNUSED_1_F) | (1 << GRAB_FULL_CHARGE_F) | (1 << GRAB_HEAVY_F)

; number of frames to reach fully charged throw
; with a light and heavy object
THROW_CHARGE_FRAMES_LIGHT EQU $1e
THROW_CHARGE_FRAMES_HEAVY EQU $3c

; touch state constants for wTouchState
	const_def
	const TOUCH_NONE         ; $0
	const TOUCH_VULNERABLE   ; $1
	const TOUCH_BUMP         ; $2
	const TOUCH_ATTACK       ; $3
	const TOUCH_VANISH       ; $4
	const TOUCH_PASS_THROUGH ; $5
