/datum/round_event_control/antagonist/solo/zizo_cult
	name = "Zizo Cult"
	tags = list(
		TAG_COMBAT,
		TAG_VILLIAN,
	)
	roundstart = TRUE
	antag_flag = ROLE_ZIZOIDCULTIST
	shared_occurence_type = SHARED_HIGH_THREAT

	base_antags = 1
	maximum_antags = 3

	weight = 4

	earliest_start = 0 SECONDS

	typepath = /datum/round_event/antagonist/solo/zizo_cultist
	antag_datum = /datum/antagonist/zizocultist

	restricted_roles = list(
		"Monarch",
		"Consort",
		"Dungeoneer",
		"Inquisitor",
		"Men-at-arms",
		"Merchant",
		"Priest",
		"Acolyte",
		"Adepts",
		"Templar",
		"Bandit",
		"Prince",
		"Princess",
		"Hand",
		"Steward",
		"Feldsher",
		"Town Elder",
		"Captain",
		"Archivist",
		"Merchant",
		"Royal Knight",
		"Garrison Guard",
		"Jailor",
		"Court Magician",
		"Forest Warden",
		"Inquisitor",
		"Adepts",
		"Forest Guard",
		"Squire",
		"Veteran",
		"Apothecary"
	)

/datum/round_event/antagonist/solo/zizo_cultist
	var/leader = FALSE

/datum/round_event/antagonist/solo/zizo_cultist/add_datum_to_mind(datum/mind/antag_mind)
	if(!leader)
		antag_mind.add_antag_datum(/datum/antagonist/zizocultist/leader)
		leader = TRUE
	else
		antag_mind.add_antag_datum(antag_datum)
