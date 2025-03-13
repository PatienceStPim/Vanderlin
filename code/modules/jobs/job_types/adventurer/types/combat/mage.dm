/datum/advclass/combat/mage
	name = "Mage"
	tutorial = "Either a apprentice studing under a wizard or an ambitious autodidact, you have finally set out to Vanderlin to gain more knowledge. You seek adventure, using your arcyne knowledge to aid others in need."
	allowed_sexes = list(MALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Half-Orc"
	)
	outfit = /datum/outfit/job/adventurer/mage
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	maximum_possible_slots = 2
	cmode_music = 'sound/music/cmode/adventurer/CombatSorcerer.ogg'

/datum/outfit/job/adventurer/mage
	allowed_patrons = list(/datum/patron/divine/noc, /datum/patron/inhumen/zizo)

/datum/outfit/job/adventurer/mage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguehood/mage
	shoes = /obj/item/clothing/shoes/simpleshoes
	armor = /obj/item/clothing/shirt/robe/mage
	belt = /obj/item/storage/belt/leather/rope
	backr = /obj/item/storage/backpack/satchel
	beltl = /obj/item/reagent_containers/glass/bottle/manapot
	r_hand = /obj/item/weapon/polearm/woodstaff
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
		if(H.age == AGE_OLD)
			head = /obj/item/clothing/head/wizhat/gen
			armor = /obj/item/clothing/shirt/robe/plain
			backl = /obj/item/storage/backpack/backpack
			H.mind?.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
			H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_STR, -2)
		H.change_stat(STATKEY_INT, 3)
		H.change_stat(STATKEY_CON, -2)
		H.change_stat(STATKEY_END, -1)
		H.change_stat(STATKEY_SPD, -2)
		H.mind.adjust_spellpoints(7)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/learnspell)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
