
/mob/living/simple_animal/hostile/retaliate/rogue/infernal/hellhound/AttackingTarget()
	if(SEND_SIGNAL(src, COMSIG_HOSTILE_PRE_ATTACKINGTARGET, target) & COMPONENT_HOSTILE_NO_PREATTACK)
		return FALSE //but more importantly return before attack_animal called
	SEND_SIGNAL(src, COMSIG_HOSTILE_ATTACKINGTARGET, target)
	in_melee = TRUE
	if(!target)
		return
	if(world.time >= src.flame_cd + 100)
		var/mob/living/targetted = target
		targetted.adjust_fire_stacks(5)
		targetted.IgniteMob()
		targetted.visible_message(span_danger("[src] sets [target] on fire!"))
		src.flame_cd = world.time
	return target.attack_animal(src)

/mob/living/simple_animal/hostile/retaliate/rogue/infernal/watcher
	icon = 'icons/mob/summonable/32x32.dmi'
	name = "infernal watcher"
	icon_state = "watcher"
	icon_living = "watcher"
	icon_dead = "vvd"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 6
	move_to_delay = 5
	base_intents = list(/datum/intent/simple/bite)
	butcher_results = list()
	faction = list("infernal")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 200
	maxHealth = 200
	melee_damage_lower = 20
	melee_damage_upper = 30
	vision_range = 7
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_NONE
	simple_detect_bonus = 20
	retreat_distance = 4
	minimum_distance = 3
	food_type = list()
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 13
	STASTR = 12
	STASPD = 8
	simple_detect_bonus = 20
	deaggroprob = 0
	defprob = 40
	defdrain = 10
	del_on_deaggro = 44 SECONDS
	retreat_health = 0.3
	food = 0
	attack_sound = list('sound/misc/lava_death.ogg')
	dodgetime = 30
	aggressive = 1
//	stat_attack = UNCONSCIOUS
	ranged = TRUE
	ranged_cooldown = 40
	projectiletype = /obj/projectile/magic/aoe/fireball/rogue
	ranged_message = "stares"



/mob/living/simple_animal/hostile/retaliate/rogue/infernal/watcher/MeleeAction(patience = TRUE)
	for(var/t in RANGE_TURFS(1, src))
		new /obj/effect/hotspot(t)
		src.visible_message(span_danger("[src] emits a burst of flames from it's core!"))
	if(rapid_melee > 1)
		var/datum/callback/cb = CALLBACK(src, PROC_REF(CheckAndAttack))
		var/delay = SSnpcpool.wait / rapid_melee
		for(var/i in 1 to rapid_melee)
			addtimer(cb, (i - 1)*delay)
	else
		AttackingTarget()
	if(patience)
		GainPatience()

/mob/living/simple_animal/hostile/retaliate/rogue/infernal/watcher/death(gibbed)
	..()
	var/turf/deathspot = get_turf(src)
	new /obj/item/natural/moltencore(deathspot)
	update_icon()
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/infernal/fiend
	icon = 'icons/mob/summonable/32x32.dmi'
	name = "fiend"
	icon_state = "fiend"
	icon_living = "fiend"
	icon_dead = "vvd"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 3
	see_in_dark = 6
	move_to_delay = 3
	base_intents = list(/datum/intent/simple/bite)
	butcher_results = list()
	faction = list("infernal")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 700
	maxHealth = 700
	melee_damage_lower = 20
	melee_damage_upper = 30
	vision_range = 7
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_NONE
	simple_detect_bonus = 20
	retreat_distance = 4
	minimum_distance = 4
	food_type = list()
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 13
	STASTR = 12
	STASPD = 8
	simple_detect_bonus = 20
	deaggroprob = 0
	defprob = 40
	defdrain = 10
	del_on_deaggro = 44 SECONDS
	retreat_health = 0.3
	food = 0
	attack_sound = list('sound/misc/lava_death.ogg')
	dodgetime = 30
	aggressive = 1
	ranged = TRUE
	rapid = TRUE
	projectiletype = /obj/projectile/magic/aoe/fireball/rogue
	ranged_message = "throws fire"
	var/flame_cd = 0
	var/summon_cd = 0


/mob/living/simple_animal/hostile/retaliate/rogue/infernal/fiend/OpenFire(atom/A)
	if(CheckFriendlyFire(A))
		return
	visible_message(span_danger("<b>[src]</b> [ranged_message] at [A]!"))

	if(world.time >= src.flame_cd + 100)
		var/mob/living/targetted = target
		create_meteors(targetted)
		src.flame_cd = world.time

	if(world.time >= src.summon_cd + 200)
		callforbackup()

		src.summon_cd = world.time

	if(rapid > 1)
		var/datum/callback/cb = CALLBACK(src, PROC_REF(Shoot), A)
		for(var/i in 1 to rapid)
			addtimer(cb, (i - 1)*rapid_fire_delay)
	else
		Shoot(A)
	ranged_cooldown = world.time + ranged_cooldown_time


/mob/living/simple_animal/hostile/retaliate/rogue/infernal/fiend/proc/create_meteors(atom/target)
	if(!target)
		return
	target.visible_message(span_boldwarning("Fire rains from the sky!"))
	var/turf/targetturf = get_turf(target)
	for(var/turf/turf as anything in RANGE_TURFS(4,targetturf))
		if(prob(20))
			new /obj/effect/temp_visual/target(turf)

/mob/living/simple_animal/hostile/retaliate/rogue/infernal/fiend/proc/callforbackup()
	var/list/spawnLists = list(/mob/living/simple_animal/hostile/retaliate/rogue/infernal/imp,/mob/living/simple_animal/hostile/retaliate/rogue/infernal/imp, /mob/living/simple_animal/hostile/retaliate/rogue/infernal/hellhound, /mob/living/simple_animal/hostile/retaliate/rogue/infernal/hellhound)
	var/reinforcement_count = 3
	src.visible_message(span_notice("[src] summons reinforcements from the infernal abyss."))
	while(reinforcement_count > 0)
		var/list/turflist = list()
		for(var/turf/t in RANGE_TURFS(1, src))
			turflist += t

		var/turf/picked = pick(turflist)


		var/spawnTypes = pick_n_take(spawnLists)
		new spawnTypes(picked)
		reinforcement_count--
		continue
