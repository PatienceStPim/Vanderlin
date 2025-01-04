/mob/living/carbon/human/species/rakshari
	race = /datum/species/rakshari

/datum/species/rakshari
	name = "Rakshari"
	id = "rakshari"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT

	desc = "<b>Rakshari</b><br>\
	Their origins trace back to nomadic desert tribes, whose survival in the harsh sands cultivated a culture steeped in resilience, cunning, and adaptability. \
	Over centuries, the Rakshari united under the banners of powerful Zybantine  merchant-kings and warlords, transforming their scattered clans into a dominant slaver force across the region., \
	For centuries, they raided weaker settlements and rival caravans, \
	capturing slaves to fuel their expanding cities and economies, \
	practice of this was justified through religious doctrines venerating strength and dominance as divine virtues \
	As they attached themselves to Zybantine Rakshari integrated more sophisticated forms of servitude, including indentured contracts and debt bondage. \
	"

	skin_tone_wording = "Tribal Identity"
	use_skintones = 1
	default_color = "FFFFFF"
	default_features = list("mcolor" = "FFF",, "wings" = "None")
	specstats = list("strength" = -2, "perception" = 2, "intelligence" = 1, "constitution" = -1, "endurance" = 0, "speed" = 2, "fortune" = 0)
	specstats_f = list("strength" = -2, "perception" = 2, "intelligence" = 1, "constitution" = -1, "endurance" = 0, "speed" = 2, "fortune" = 0)

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/rakshari.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/rakshari.dmi'
	custom_clothes = FALSE
	possible_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	species_traits = list(EYECOLOR,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)

	offset_features = list(OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0),\
	OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,0), OFFSET_HEAD = list(0,0), \
	OFFSET_FACE = list(0,0), OFFSET_BELT = list(0,0), OFFSET_BACK = list(0,0), \
	OFFSET_NECK = list(0,0), OFFSET_MOUTH = list(0,0), OFFSET_PANTS = list(0,0), \
	OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,0), OFFSET_UNDIES = list(0,0), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
	OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
	OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
	OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
	OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))

/datum/species/rakshari/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/elvish)

/datum/species/rakshari/check_roundstart_eligible()
	return TRUE

/datum/species/rakshari/after_creation(mob/living/carbon/C)
	..()
//	if(!C.has_language(/datum/language/elvish))
	C.grant_language(/datum/language/elvish)
	to_chat(C, "<span class='info'>I can speak Elfish with ,e before my speech.</span>")

/datum/species/rakshari/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/elvish)

/datum/species/rakshari/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/rakshari/get_skin_list()
	return sortList(list(
		"Plain Elf" = SKIN_COLOR_PLAIN_ELF, // - (White 2)
		"Mountain Elf" = SKIN_COLOR_MOUNTAIN_ELF, // - (White 3)
		"Coastal Elf" = SKIN_COLOR_COASTAL_ELF, // - (White 4)
		"Wood Elf" = SKIN_COLOR_WOOD_ELF, // - (Mediterranean 1)
		"Sea Elf" = SKIN_COLOR_SEA_ELF, // - (Mediterranean 2)
		"Jungle Elf" = SKIN_COLOR_JUNGLE_ELF, // - (Latin)
		"Savannah Elf" = SKIN_COLOR_SAVANNAH_ELF, // - (Middle-Eastern)
		"Sand Elf" = SKIN_COLOR_SAND_ELF, // - (Black 1)
		"Crimson Elf" = SKIN_COLOR_CRIMSON_ELF, // - (Black2)
	))
