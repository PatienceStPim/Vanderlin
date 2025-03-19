/datum/job/wapprentice
	title = "Magician's Apprentice"
	tutorial = "Your master once saw potential in you, \
	something you are uncertain if they still do with your recent studies. \
	The path to using magic is something treacherous and untamed, \
	and you are still decades away from calling yourself even a journeyman in the field. \
	Listen and serve, and someday you will earn your hat."
	flag = APPRENTICE
	department_flag = APPRENTICES
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2

	allowed_races = ALL_PLAYER_RACES_BY_NAME
	allowed_ages = list(AGE_CHILD, AGE_ADULT)


	outfit = /datum/outfit/job/wapprentice
	display_order = JDO_WAPP
	give_bank_account = TRUE
	bypass_lastclass = TRUE
	can_have_apprentices = FALSE


/datum/outfit/job/wapprentice/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/magic/arcane, pick(1,2), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
	if(H.gender == MALE)
		pants = /obj/item/clothing/pants/tights/random
		shoes = /obj/item/clothing/shoes/simpleshoes
		shirt = /obj/item/clothing/shirt/shortshirt
		belt = /obj/item/storage/belt/leather/rope
		beltl = /obj/item/storage/keyring/mageapprentice
		armor = /obj/item/clothing/shirt/robe/newmage/adept
		backr = /obj/item/storage/backpack/satchel
	else
		shoes = /obj/item/clothing/shoes/sandals
		shirt = /obj/item/clothing/shirt/undershirt
		belt = /obj/item/storage/belt/leather/rope
		beltl = /obj/item/storage/keyring/mageapprentice
		armor = /obj/item/clothing/shirt/robe/newmage/adept
		backr = /obj/item/storage/backpack/satchel

	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_SPD, -1)
	ADD_TRAIT(H, TRAIT_MALUMFIRE, TRAIT_GENERIC)
