DEF NUM_OBJECTS EQU 8

; wObjects structs constants
RSRESET
OBJ_FLAGS            rb ; $00
OBJ_UNK_01           rb ; $01
OBJ_UNK_02           rb ; $02
OBJ_Y_POS            rw ; $03
OBJ_X_POS            rw ; $05
OBJ_UNK_07           rb ; $07
OBJ_INTERACTION_TYPE rb ; $08
OBJ_COLLBOX_TOP      rb ; $09
OBJ_COLLBOX_BOTTOM   rb ; $0a
OBJ_COLLBOX_LEFT     rb ; $0b
OBJ_COLLBOX_RIGHT    rb ; $0c
OBJ_SCREEN_Y_POS     rb ; $0d
OBJ_SCREEN_X_POS     rb ; $0e
OBJ_FRAME            rb ; $0f
OBJ_OAM_PTR          rw ; $10
OBJ_FRAMESET_PTR     rw ; $12
OBJ_FRAME_DURATION   rb ; $14
OBJ_FRAMESET_OFFSET  rb ; $15
OBJ_STATE_DURATION   rb ; $16
OBJ_UNK_17           rb ; $17
OBJ_UNK_18           rb ; $18
OBJ_MOVEMENT_INDEX   rb ; $19
OBJ_UNK_1A           rb ; $1a
OBJ_STATE            rb ; $1b
OBJ_UNK_1C           rb ; $1c
OBJ_UNK_1D           rb ; $1d
OBJ_UPDATE_FUNCTION  rw ; $1e
DEF OBJ_STRUCT_LENGTH EQU _RS

; OBJ_FLAGS constants
	const_def
	const OBJFLAG_UNK0_F ; 0
	const OBJFLAG_UNK1_F ; 1
	const OBJFLAG_UNK2_F ; 2
	const OBJFLAG_UNK3_F ; 3
	const OBJFLAG_UNK4_F ; 4
	const OBJFLAG_UNK5_F ; 5
	const OBJFLAG_UNK6_F ; 6
	const OBJFLAG_UNK7_F ; 7

DEF OBJFLAG_UNK0 EQU (1 << OBJFLAG_UNK0_F)
DEF OBJFLAG_UNK1 EQU (1 << OBJFLAG_UNK1_F)
DEF OBJFLAG_UNK2 EQU (1 << OBJFLAG_UNK2_F)
DEF OBJFLAG_UNK3 EQU (1 << OBJFLAG_UNK3_F)
DEF OBJFLAG_UNK4 EQU (1 << OBJFLAG_UNK4_F)
DEF OBJFLAG_UNK5 EQU (1 << OBJFLAG_UNK5_F)
DEF OBJFLAG_UNK6 EQU (1 << OBJFLAG_UNK6_F)
DEF OBJFLAG_UNK7 EQU (1 << OBJFLAG_UNK7_F)

; wInteractionSide flags
	const_def 4
	const INTERACTION_LEFT_F  ; 4
	const INTERACTION_RIGHT_F ; 5
	const INTERACTION_UP_F    ; 6
	const INTERACTION_DOWN_F  ; 7

DEF INTERACTION_LEFT  EQU (1 << INTERACTION_LEFT_F)  ; $10
DEF INTERACTION_RIGHT EQU (1 << INTERACTION_RIGHT_F) ; $20
DEF INTERACTION_UP    EQU (1 << INTERACTION_UP_F)    ; $40
DEF INTERACTION_DOWN  EQU (1 << INTERACTION_DOWN_F)  ; $80

; object interaction types
	const_def
	const OBJ_INTERACTION_00             ; 00
	const OBJ_INTERACTION_01             ; 01
	const OBJ_INTERACTION_FRONT_STING    ; 02
	const OBJ_INTERACTION_BACK_STING     ; 03
	const OBJ_INTERACTION_TOP_STING      ; 04
	const OBJ_INTERACTION_FULL_STING     ; 05
	const OBJ_INTERACTION_06             ; 06
	const OBJ_INTERACTION_07             ; 07
	const OBJ_INTERACTION_08             ; 08
	const OBJ_INTERACTION_09             ; 09
	const OBJ_INTERACTION_0A             ; 0a
	const OBJ_INTERACTION_0B             ; 0b
	const OBJ_INTERACTION_WALKABLE       ; 0c
	const OBJ_INTERACTION_MUSICAL_COIN   ; 0d
	const OBJ_INTERACTION_FIRE           ; 0e
	const OBJ_INTERACTION_0F             ; 0f
	const OBJ_INTERACTION_GREY_KEY       ; 10
	const OBJ_INTERACTION_RED_KEY        ; 11
	const OBJ_INTERACTION_GREEN_KEY      ; 12
	const OBJ_INTERACTION_BLUE_KEY       ; 13
	const OBJ_INTERACTION_GREY_TREASURE  ; 14
	const OBJ_INTERACTION_RED_TREASURE   ; 15
	const OBJ_INTERACTION_GREEN_TREASURE ; 16
	const OBJ_INTERACTION_BLUE_TREASURE  ; 17
	const OBJ_INTERACTION_18             ; 18
	const OBJ_INTERACTION_19             ; 19
	const OBJ_INTERACTION_1A             ; 1a
	const OBJ_INTERACTION_REGULAR_COIN   ; 1b
	const OBJ_INTERACTION_1C             ; 1c
	const OBJ_INTERACTION_1D             ; 1d
	const OBJ_INTERACTION_1E             ; 1e
	const OBJ_INTERACTION_1F             ; 1f
	const OBJ_INTERACTION_20             ; 20
	const OBJ_INTERACTION_21             ; 21
	const OBJ_INTERACTION_SOLID          ; 22
	const OBJ_INTERACTION_23             ; 23
	const OBJ_INTERACTION_24             ; 24
	const OBJ_INTERACTION_25             ; 25
	const OBJ_INTERACTION_BUBBLE         ; 26
	const OBJ_INTERACTION_27             ; 27
	const OBJ_INTERACTION_OWL            ; 28
	const OBJ_INTERACTION_RAIL           ; 29
	const OBJ_INTERACTION_2A             ; 2a
	const OBJ_INTERACTION_2B             ; 2b
	const OBJ_INTERACTION_2C             ; 2c
	const OBJ_INTERACTION_2D             ; 2d
	const OBJ_INTERACTION_UNLIT_TORCH    ; 2e
	const OBJ_INTERACTION_STOVE          ; 2f
	const OBJ_INTERACTION_30             ; 30
	const OBJ_INTERACTION_31             ; 31
	const OBJ_INTERACTION_32             ; 32
	const OBJ_INTERACTION_33             ; 33
	const OBJ_INTERACTION_34             ; 34
	const OBJ_INTERACTION_35             ; 35
	const OBJ_INTERACTION_36             ; 36
	const OBJ_INTERACTION_37             ; 37
	const OBJ_INTERACTION_38             ; 38
	const OBJ_INTERACTION_39             ; 39
	const OBJ_INTERACTION_3A             ; 3a
	const OBJ_INTERACTION_3B             ; 3b
	const OBJ_INTERACTION_3C             ; 3c
	const OBJ_INTERACTION_3D             ; 3d
	const OBJ_INTERACTION_3E             ; 3e
	const OBJ_INTERACTION_3F             ; 3f
	const OBJ_INTERACTION_WATER_TELEPORTING ; 40
	const OBJ_INTERACTION_41             ; 41
	const OBJ_INTERACTION_42             ; 42
	const OBJ_INTERACTION_43             ; 43
	const OBJ_INTERACTION_44             ; 44
	const OBJ_INTERACTION_45             ; 45
	const OBJ_INTERACTION_46             ; 46
	const OBJ_INTERACTION_47             ; 47
	const OBJ_INTERACTION_48             ; 48
	const OBJ_INTERACTION_49             ; 49
	const OBJ_INTERACTION_COLOUR_COIN    ; 4a
	const OBJ_INTERACTION_4B             ; 4b
	const OBJ_INTERACTION_4C             ; 4c
	const OBJ_INTERACTION_4D             ; 4d
	const OBJ_INTERACTION_4E             ; 4e
	const OBJ_INTERACTION_4F             ; 4f
	const OBJ_INTERACTION_50             ; 50
	const OBJ_INTERACTION_51             ; 51
	const OBJ_INTERACTION_52             ; 52
	const OBJ_INTERACTION_UNUSED_1       ; 53
	const OBJ_INTERACTION_UNUSED_2       ; 54
	const OBJ_INTERACTION_UNUSED_3       ; 55
	const OBJ_INTERACTION_UNUSED_4       ; 56
	const OBJ_INTERACTION_UNUSED_5       ; 57
	const OBJ_INTERACTION_UNUSED_6       ; 58

; enemies with InteractionType with
; this flag set are considered heavy
DEF HEAVY_OBJ_F EQU 7
DEF HEAVY_OBJ EQU (1 << HEAVY_OBJ_F)
DEF INTERACTION_MASK EQU $ff ^ HEAVY_OBJ

	const_def
	const OBJACTION_00 ; $00
	const OBJACTION_LAND ; $01
	const OBJACTION_BUMP_LEFT_START ; $02
	const OBJACTION_BUMP_RIGHT_START ; $03
	const OBJACTION_04 ; $04
	const OBJACTION_05 ; $05
	const OBJACTION_GRAB_LEFT_START ; $06
	const OBJACTION_GRAB_RIGHT_START ; $07
	const OBJACTION_08 ; $08
	const OBJACTION_09 ; $09
	const OBJACTION_VANISH ; $0a
	const OBJACTION_0B ; $0b
	const OBJACTION_0C ; $0c
	const OBJACTION_0D ; $0d
	const OBJACTION_0E ; $0e
	const OBJACTION_0F ; $0f
	const OBJACTION_10 ; $10
	const OBJACTION_STANDING_FALL_START ; $11
	const OBJACTION_12 ; $12
	const OBJACTION_TURN_AROUND_START ; $13
	const OBJACTION_14 ; $14
	const OBJACTION_15 ; $15
	const OBJACTION_STUN_LEFT_START ; $16
	const OBJACTION_STUN_RIGHT_START ; $17
	const OBJACTION_18 ; $18
	const OBJACTION_19 ; $19
	const OBJACTION_1A ; $1a
	const OBJACTION_1B ; $1b
	const OBJACTION_1C ; $1c
	const OBJACTION_1D ; $1d
	const OBJACTION_1E ; $1e
	const OBJACTION_1F ; $1f
	const OBJACTION_20 ; $20
	const OBJACTION_21 ; $21
	const OBJACTION_22 ; $22
	const OBJACTION_23 ; $23
	const OBJACTION_24 ; $24
	const OBJACTION_25 ; $25
	const OBJACTION_26 ; $26
	const OBJACTION_27 ; $27
	const OBJACTION_28 ; $28
	const OBJACTION_29 ; $29
	const OBJACTION_2A ; $2a
	const OBJACTION_2B ; $2b
	const OBJACTION_2C ; $2c
	const OBJACTION_SPECIAL_1 ; $2d
	const OBJACTION_SPECIAL_2 ; $2e
	const OBJACTION_SPECIAL_3 ; $2f
	const OBJACTION_FALL ; $30
	const OBJACTION_WALK ; $31
	const OBJACTION_BUMP_LEFT ; $32
	const OBJACTION_BUMP_RIGHT ; $33
	const OBJACTION_34 ; $34
	const OBJACTION_35 ; $35
	const OBJACTION_36 ; $36
	const OBJACTION_37 ; $37
	const OBJACTION_38 ; $38
	const OBJACTION_39 ; $39
	const OBJACTION_3A ; $3a
	const OBJACTION_3B ; $3b
	const OBJACTION_3C ; $3c
	const OBJACTION_3D ; $3d
	const OBJACTION_3E ; $3e
	const OBJACTION_3F ; $3f
	const OBJACTION_40 ; $40
	const OBJACTION_STANDING_FALL ; $41
	const OBJACTION_42 ; $42
	const OBJACTION_TURN_AROUND ; $43
	const OBJACTION_44 ; $44
	const OBJACTION_45 ; $45
	const OBJACTION_STUN_LEFT ; $46
	const OBJACTION_STUN_RIGHT ; $47
	const OBJACTION_48 ; $48
	const OBJACTION_49 ; $49
	const OBJACTION_4A ; $4a
	const OBJACTION_4B ; $4b
	const OBJACTION_FULL_THROW_LEFT_START ; $4c
	const OBJACTION_FULL_THROW_RIGHT_START ; $4d
	const OBJACTION_4E ; $4e
	const OBJACTION_4F ; $4f
	const OBJACTION_50 ; $50
	const OBJACTION_51 ; $51
	const OBJACTION_52 ; $52
	const OBJACTION_53 ; $53
	const OBJACTION_54 ; $54
	const OBJACTION_55 ; $55
	const OBJACTION_56 ; $56
	const OBJACTION_57 ; $57
	const OBJACTION_58 ; $58
	const OBJACTION_59 ; $59
	const OBJACTION_5A ; $5a
	const OBJACTION_5B ; $5b
	const OBJACTION_5C ; $5c
	const OBJACTION_5D ; $5d
	const OBJACTION_FULL_THROW_LEFT ; $5e
	const OBJACTION_FULL_THROW_RIGHT ; $5f

	const_def
	const ENEMY_GROUP_000 ; $00
	const ENEMY_GROUP_001 ; $01
	const ENEMY_GROUP_002 ; $02
	const ENEMY_GROUP_003 ; $03
	const ENEMY_GROUP_004 ; $04
	const ENEMY_GROUP_005 ; $05
	const ENEMY_GROUP_006 ; $06
	const ENEMY_GROUP_007 ; $07
	const ENEMY_GROUP_008 ; $08
	const ENEMY_GROUP_009 ; $09
	const ENEMY_GROUP_010 ; $0a
	const ENEMY_GROUP_011 ; $0b
	const ENEMY_GROUP_012 ; $0c
	const ENEMY_GROUP_013 ; $0d
	const ENEMY_GROUP_014 ; $0e
	const ENEMY_GROUP_015 ; $0f
	const ENEMY_GROUP_016 ; $10
	const ENEMY_GROUP_017 ; $11
	const ENEMY_GROUP_018 ; $12
	const ENEMY_GROUP_019 ; $13
	const ENEMY_GROUP_020 ; $14
	const ENEMY_GROUP_021 ; $15
	const ENEMY_GROUP_022 ; $16
	const ENEMY_GROUP_023 ; $17
	const ENEMY_GROUP_024 ; $18
	const ENEMY_GROUP_025 ; $19
	const ENEMY_GROUP_026 ; $1a
	const ENEMY_GROUP_027 ; $1b
	const ENEMY_GROUP_028 ; $1c
	const ENEMY_GROUP_029 ; $1d
	const ENEMY_GROUP_030 ; $1e
	const ENEMY_GROUP_031 ; $1f
	const ENEMY_GROUP_032 ; $20
	const ENEMY_GROUP_033 ; $21
	const ENEMY_GROUP_034 ; $22
	const ENEMY_GROUP_035 ; $23
	const ENEMY_GROUP_036 ; $24
	const ENEMY_GROUP_037 ; $25
	const ENEMY_GROUP_038 ; $26
	const ENEMY_GROUP_039 ; $27
	const ENEMY_GROUP_040 ; $28
	const ENEMY_GROUP_041 ; $29
	const ENEMY_GROUP_042 ; $2a
	const ENEMY_GROUP_043 ; $2b
	const ENEMY_GROUP_044 ; $2c
	const ENEMY_GROUP_045 ; $2d
	const ENEMY_GROUP_046 ; $2e
	const ENEMY_GROUP_047 ; $2f
	const ENEMY_GROUP_048 ; $30
	const ENEMY_GROUP_049 ; $31
	const ENEMY_GROUP_050 ; $32
	const ENEMY_GROUP_051 ; $33
	const ENEMY_GROUP_052 ; $34
	const ENEMY_GROUP_053 ; $35
	const ENEMY_GROUP_054 ; $36
	const ENEMY_GROUP_055 ; $37
	const ENEMY_GROUP_056 ; $38
	const ENEMY_GROUP_057 ; $39
	const ENEMY_GROUP_058 ; $3a
	const ENEMY_GROUP_059 ; $3b
	const ENEMY_GROUP_060 ; $3c
	const ENEMY_GROUP_061 ; $3d
	const ENEMY_GROUP_062 ; $3e
	const ENEMY_GROUP_063 ; $3f
	const ENEMY_GROUP_064 ; $40
	const ENEMY_GROUP_065 ; $41
	const ENEMY_GROUP_066 ; $42
	const ENEMY_GROUP_067 ; $43
	const ENEMY_GROUP_068 ; $44
	const ENEMY_GROUP_069 ; $45
	const ENEMY_GROUP_070 ; $46
	const ENEMY_GROUP_071 ; $47
	const ENEMY_GROUP_072 ; $48
	const ENEMY_GROUP_073 ; $49
	const ENEMY_GROUP_074 ; $4a
	const ENEMY_GROUP_075 ; $4b
	const ENEMY_GROUP_076 ; $4c
	const ENEMY_GROUP_077 ; $4d
	const ENEMY_GROUP_078 ; $4e
	const ENEMY_GROUP_079 ; $4f
	const ENEMY_GROUP_080 ; $50
	const ENEMY_GROUP_081 ; $51
	const ENEMY_GROUP_082 ; $52
	const ENEMY_GROUP_083 ; $53
	const ENEMY_GROUP_084 ; $54
	const ENEMY_GROUP_085 ; $55
	const ENEMY_GROUP_086 ; $56
	const ENEMY_GROUP_087 ; $57
	const ENEMY_GROUP_088 ; $58
	const ENEMY_GROUP_089 ; $59
	const ENEMY_GROUP_090 ; $5a
	const ENEMY_GROUP_091 ; $5b
	const ENEMY_GROUP_092 ; $5c
	const ENEMY_GROUP_093 ; $5d
	const ENEMY_GROUP_094 ; $5e
	const ENEMY_GROUP_095 ; $5f
	const ENEMY_GROUP_096 ; $60
	const ENEMY_GROUP_097 ; $61
	const ENEMY_GROUP_098 ; $62
	const ENEMY_GROUP_099 ; $63
	const ENEMY_GROUP_100 ; $64
	const ENEMY_GROUP_101 ; $65
	const ENEMY_GROUP_102 ; $66
	const ENEMY_GROUP_103 ; $67
	const ENEMY_GROUP_104 ; $68
	const ENEMY_GROUP_105 ; $69
	const ENEMY_GROUP_106 ; $6a
	const ENEMY_GROUP_107 ; $6b
	const ENEMY_GROUP_108 ; $6c
	const ENEMY_GROUP_109 ; $6d
	const ENEMY_GROUP_110 ; $6e
	const ENEMY_GROUP_111 ; $6f
	const ENEMY_GROUP_112 ; $70
	const ENEMY_GROUP_113 ; $71
	const ENEMY_GROUP_114 ; $72
	const ENEMY_GROUP_115 ; $73
	const ENEMY_GROUP_116 ; $74
	const ENEMY_GROUP_117 ; $75
	const ENEMY_GROUP_118 ; $76
	const ENEMY_GROUP_119 ; $77
	const ENEMY_GROUP_120 ; $78
	const ENEMY_GROUP_121 ; $79
	const ENEMY_GROUP_122 ; $7a
	const ENEMY_GROUP_123 ; $7b
	const ENEMY_GROUP_124 ; $7c
	const ENEMY_GROUP_125 ; $7d
	const ENEMY_GROUP_126 ; $7e
	const ENEMY_GROUP_127 ; $7f
	const ENEMY_GROUP_128 ; $80
	const ENEMY_GROUP_129 ; $81
	const ENEMY_GROUP_130 ; $82
	const ENEMY_GROUP_131 ; $83
	const ENEMY_GROUP_132 ; $84
	const ENEMY_GROUP_133 ; $85
	const ENEMY_GROUP_134 ; $86
	const ENEMY_GROUP_135 ; $87
	const ENEMY_GROUP_136 ; $88
	const ENEMY_GROUP_137 ; $89
	const ENEMY_GROUP_138 ; $8a
	const ENEMY_GROUP_139 ; $8b
	const ENEMY_GROUP_140 ; $8c
	const ENEMY_GROUP_141 ; $8d
	const ENEMY_GROUP_142 ; $8e
	const ENEMY_GROUP_143 ; $8f
	const ENEMY_GROUP_144 ; $90
	const ENEMY_GROUP_145 ; $91
