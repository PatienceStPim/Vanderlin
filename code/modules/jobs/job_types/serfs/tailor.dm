/datum/job/tailor
	title = "Tailor"
	f_title = "Seamstress"
	flag = TAILOR
	department_flag = SERFS
	faction = "Station"
	tutorial = "Cloth, linen, silk and leather. You've tirelessly studied and poured your life into \
				sewing articles of protection, padding, and fashion for serf and noble alike."
	total_positions = 1
	spawn_positions = 1
	allowed_races = ALL_PLAYER_RACES_BY_NAME
	give_bank_account = TRUE
	bypass_lastclass = TRUE
	display_order = JDO_TAILOR

	outfit = /datum/outfit/job/tailor

/datum/outfit/job/tailor/pre_equip(mob/living/carbon/human/H)
	..()

	shoes = /obj/item/clothing/shoes/nobleboot
	head = /obj/item/clothing/head/courtierhat
	belt = /obj/item/storage/belt/leather
	beltr = /obj/item/weapon/knife/scissors
	beltl = /obj/item/storage/keyring/tailor
	backr = /obj/item/storage/backpack/satchel
	neck = /obj/item/storage/belt/pouch/coins/mid
	backpack_contents = list(/obj/item/needle = 1, /obj/item/natural/bundle/cloth = 2, /obj/item/natural/bundle/fibers = 1, /obj/item/dye_pack/luxury = 1, /obj/item/book/advice_weaving = 1, /obj/item/weapon/knife/villager = 1)

	H.mind?.adjust_skillrank(/datum/skill/misc/sewing, pick(4,5), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/craft/tanning, pick(3,4), TRUE)
	H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/labor/mathematics, 2, TRUE)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	if(H.gender == MALE)
		pants = /obj/item/clothing/pants/tights/red
		shirt = /obj/item/clothing/shirt/undershirt/red
		armor = /obj/item/clothing/shirt/tunic/red
		cloak = /obj/item/clothing/cloak/raincloak/furcloak
	else
		cloak = /obj/item/clothing/cloak/raincloak/furcloak
		shirt = /obj/item/clothing/shirt/dress/gen/purple
		armor = /obj/item/clothing/shirt/tunic/purple
		pants = /obj/item/clothing/pants/tights/purple
	H.change_stat(STATKEY_INT, 2)
	H.change_stat(STATKEY_SPD, 2)
	H.change_stat(STATKEY_PER, 1)
	H.change_stat(STATKEY_STR, -1)
