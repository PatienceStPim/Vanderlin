//Defines for atom layers and planes
//KEEP THESE IN A NICE ACSCENDING ORDER, PLEASE

#define FIELD_OF_VISION_BLOCKER_PLANE -199
#define FIELD_OF_VISION_BLOCKER_RENDER_TARGET "*fovblock"

//---------- DEFILTER PLANES -------------
#define DEFILTER_REFLECTIVE_PLANE_ALL -102
#define DEFILTER_REFLECTIVE_PLANE_ALL_RENDER_TARGET "*DEFILTER_REFLECTIVE_PLANE_ALL_RENDER_TARGET"
#define DEFILTER_MANUAL_REFLECTIVE_PLANE -101
#define DEFILTER_MANUAL_REFLECTIVE_PLANE_RENDER_TARGET "*DEFILTER_MANUAL_REFLECTIVE_PLANE_RENDER_TARGET"
#define DEFILTER_MANUAL_REFLECTIVE_MASK_PLANE -100
#define DEFILTER_MANUAL_REFLECTIVE_PLANE_MASK_RENDER_TARGET "*DEFILTER_MANUAL_REFLECTIVE_PLANE_MASK_RENDER_TARGET"

#define CLICKCATCHER_PLANE -99

#define PLANE_SPACE -95
#define PLANE_SPACE_PARALLAX -90

#define WEATHER_OVERLAY_PLANE -80
#define WEATHER_OVERLAY_LAYER -80
#define WEATHER_RENDER_TARGET "*WEATHER_OVERLAY_PLANE"

#define OPENSPACE_LAYER 17 //Openspace layer over all
#define OPENSPACE_PLANE -8 //Openspace plane below all turfs
#define OPENSPACE_BACKDROP_PLANE -7

#define FLOOR_PLANE -6
#define GAME_PLANE -5
#define GAME_PLANE_RENDER_TARGET "GAME_PLANE_RENDER_TARGET"
#define GAME_PLANE_FOV_HIDDEN -5
#define GAME_PLANE_UPPER -4
#define WEATHER_EFFECT_PLANE -3
#define STRATEGY_PLANE -2
#define PLANE_LEYLINES -1
#define BLACKNESS_PLANE 0 //To keep from conflicts with SEE_BLACKNESS internals

#define SPACE_LAYER 1.8
//#define TURF_LAYER 2 //For easy recordkeeping; this is a byond define
#define MID_TURF_LAYER 2.02
#define HIGH_TURF_LAYER 2.03
#define TURF_PLATING_DECAL_LAYER 2.031
#define TURF_DECAL_LAYER 2.039 //Makes turf decals appear in DM how they will look inworld.
#define ABOVE_OPEN_TURF_LAYER 2.04
#define CLOSED_TURF_LAYER 2.05
#define BULLET_HOLE_LAYER 2.06
#define ABOVE_NORMAL_TURF_LAYER 2.08
#define LATTICE_LAYER 2.2
#define DISPOSAL_PIPE_LAYER 2.3
#define GAS_PIPE_HIDDEN_LAYER 2.35
#define WIRE_LAYER 2.4
#define WIRE_BRIDGE_LAYER 2.44
#define WIRE_TERMINAL_LAYER 2.45
#define GAS_SCRUBBER_LAYER 2.46
#define GAS_PIPE_VISIBLE_LAYER 2.47
#define GAS_FILTER_LAYER 2.48
#define GAS_PUMP_LAYER 2.49
#define LOW_OBJ_LAYER 2.5
#define LOW_SIGIL_LAYER 2.52
#define SIGIL_LAYER 2.54
#define HIGH_SIGIL_LAYER 2.56

#define BELOW_OPEN_DOOR_LAYER 2.6
#define BLASTDOOR_LAYER 2.65
#define OPEN_DOOR_LAYER 2.7
#define DOOR_HELPER_LAYER 2.71 //keep this above OPEN_DOOR_LAYER
#define PROJECTILE_HIT_THRESHHOLD_LAYER 2.75 //projectiles won't hit objects at or below this layer if possible
#define TABLE_LAYER 2.8
#define BELOW_OBJ_LAYER 2.9
#define LOW_ITEM_LAYER 2.95
//#define OBJ_LAYER 3 //For easy recordkeeping; this is a byond define
#define CLOSED_BLASTDOOR_LAYER 3.05
#define CLOSED_DOOR_LAYER 3.1
#define CLOSED_FIREDOOR_LAYER 3.11
#define SHUTTER_LAYER 3.12 // HERE BE DRAGONS
#define ABOVE_OBJ_LAYER 3.2
#define ABOVE_WINDOW_LAYER 3.3
#define SIGN_LAYER 3.4
#define NOT_HIGH_OBJ_LAYER 3.5
#define HIGH_OBJ_LAYER 3.6

#define BELOW_MOB_LAYER 3.7
#define LYING_MOB_LAYER 3.8
//#define MOB_LAYER 4 //For easy recordkeeping; this is a byond define
#define ABOVE_MOB_LAYER 4.1
#define WALL_OBJ_LAYER 4.25
#define EDGED_TURF_LAYER 4.3
#define ON_EDGED_TURF_LAYER 4.35
#define LARGE_MOB_LAYER 4.4
#define ABOVE_ALL_MOB_LAYER 4.5

#define SPACEVINE_LAYER 4.8
#define SPACEVINE_MOB_LAYER 4.9
//#define FLY_LAYER 5 //For easy recordkeeping; this is a byond define
#define GASFIRE_LAYER 5.05
#define RIPPLE_LAYER 5.1

#define GHOST_LAYER 6
#define LOW_LANDMARK_LAYER 9
#define MID_LANDMARK_LAYER 9.1
#define HIGH_LANDMARK_LAYER 9.2
//#define AREA_LAYER 10
#define MASSIVE_OBJ_LAYER 11
#define POINT_LAYER 12

#define CHAT_LAYER 12.1

#define WARN_LAYER 12.2

#define AREA_PLANE	12
#define AREA_LAYER	12

#define GRAIN_LAYER 13

#define WEATHER_PLANE 13

#define INDOOR_PLANE 14

#define EMISSIVE_BLOCKER_PLANE 15
#define EMISSIVE_BLOCKER_LAYER 12
#define EMISSIVE_BLOCKER_RENDER_TARGET "*EMISSIVE_BLOCKER_PLANE"

#define EMISSIVE_PLANE 16
#define EMISSIVE_RENDER_TARGET "*EMISSIVE_PLANE"

#define EMISSIVE_UNBLOCKABLE_PLANE 17
#define EMISSIVE_UNBLOCKABLE_LAYER 17
#define EMISSIVE_UNBLOCKABLE_RENDER_TARGET "*EMISSIVE_UNBLOCKABLE_PLANE"


#define SUNLIGHTING_PLANE 18
#define SUNLIGHTING_RENDER_TARGET "*SUNLIGHT_PLANE"

#define LIGHTING_PLANE 19
#define LIGHTING_LAYER 15 //15

#define O_LIGHTING_VISUAL_PLANE 20
#define O_LIGHTING_VISUAL_LAYER 18
#define O_LIGHTING_VISUAL_RENDER_TARGET "O_LIGHT_VISUAL_PLANE"

#define ABOVE_LIGHTING_PLANE 21
#define ABOVE_LIGHTING_LAYER 19
#define ABOVE_LIGHTING_RENDER_TARGET "ABOVE_LIGHTING_PLANE"

#define BYOND_LIGHTING_PLANE 22
#define BYOND_LIGHTING_LAYER 21

#define CAMERA_STATIC_PLANE 23
#define CAMERA_STATIC_LAYER 22

//HUD layer defines


#define FULLSCREEN_PLANE 24
#define FLASH_LAYER 23
#define FULLSCREEN_LAYER 23.1
#define UI_DAMAGE_LAYER 23.2
#define BLIND_LAYER 23.3
#define CRIT_LAYER 23.4
#define CURSE_LAYER 23.5
#define BACKHUD_LAYER 23.6

#define HUD_PLANE 25
#define HUD_LAYER 24
#define ABOVE_HUD_PLANE 26
#define ABOVE_HUD_LAYER 25

#define SPLASHSCREEN_LAYER 26
#define SPLASHSCREEN_PLANE 28

#define FOV_EFFECTS_LAYER 10000
