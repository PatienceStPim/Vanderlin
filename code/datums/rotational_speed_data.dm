/obj/structure
	var/rotation_structure = FALSE
	var/rotations_per_minute
	var/stress_use
	var/stress_generation
	var/rotation_direction

	var/datum/rotation_network/rotation_network

/obj/structure/Initialize()
	. = ..()
	if(rotation_structure)
		return INITIALIZE_HINT_LATELOAD

/obj/structure/Destroy()
	. = ..()
	if(rotation_network)
		rotation_network.remove_connection(src)

/obj/structure/LateInitialize()
	. = ..()
	if(rotation_structure)
		find_rotation_network()

/obj/structure/proc/update_animation_effect()
	return

/obj/structure/proc/find_rotation_network()
	var/turf/step_forward = get_step(src, dir)
	for(var/obj/structure/structure in step_forward.contents)
		if(structure.rotation_network)
			if(!structure.try_connect(src))
				rotation_break()

	var/turf/step_back = get_step(src, GLOB.reverse_dir[dir])
	for(var/obj/structure/structure in step_back.contents)
		if(structure.rotation_network)
			if(rotation_network)
				if(!structure.try_network_merge(src))
					rotation_break()
			else
				if(!structure.try_connect(src))
					rotation_break()

	if(!rotation_network)
		rotation_network = new
		rotation_network.add_connection(src)

/obj/structure/proc/set_rotational_direction_and_speed(direction, speed)
	rotations_per_minute = speed
	rotation_direction = direction
	find_and_propagate()
	rotation_network.check_stress()
	rotation_network.update_animation_effect()

/obj/structure/proc/set_rotational_speed(speed)
	rotations_per_minute = speed
	find_and_propagate()
	rotation_network.check_stress()
	rotation_network.update_animation_effect()

/obj/structure/proc/set_stress_generation(amount)
	rotation_network.total_stress -= stress_generation
	rotation_network.total_stress += amount
	stress_generation = amount
	rotation_network.check_stress()

/obj/structure/proc/set_stress_use(amount)
	rotation_network.used_stress -= stress_use
	rotation_network.used_stress += amount
	stress_use = amount
	rotation_network.check_stress()

/obj/structure/proc/try_connect(obj/structure/connector)
	if(can_connect(connector))
		rotation_network.add_connection(connector)
		pass_rotation_data(connector)
		return TRUE
	return FALSE

/obj/structure/proc/can_connect(obj/structure/connector)
	if(connector.rotation_direction && connector.rotation_direction != rotation_direction)
		if(connector.rotations_per_minute && rotations_per_minute)
			return FALSE
	return TRUE

/obj/structure/proc/try_network_merge(obj/structure/connector)
	if(!can_connect(connector))
		return FALSE
	for(var/obj/structure/child in connector.rotation_network.connected)
		connector.rotation_network.remove_connection(connector)
		rotation_network.add_connection(connector)
	rotation_network.total_stress += connector.rotation_network.total_stress
	rotation_network.used_stress += connector.rotation_network.used_stress
	propagate_rotation_change(connector)
	return TRUE

/obj/structure/proc/propagate_rotation_change(obj/structure/connector, list/checked, first = FALSE)
	if(!length(checked))
		checked = list()
	checked |= src

	if(connector.stress_generation && connector.rotation_direction != rotation_direction)
		rotation_break()
		return
	connector.rotation_direction = rotation_direction
	if(!connector.stress_generation)
		connector.rotations_per_minute = rotations_per_minute

	connector.find_and_propagate(checked, TRUE)
	if(first)
		connector.update_animation_effect()

/obj/structure/proc/find_and_propagate(list/checked, first = FALSE)
	if(!length(checked))
		checked = list()
	checked |= src

	var/turf/step_forward = get_step(src, dir)
	for(var/obj/structure/structure in step_forward.contents)
		if(structure in checked)
			continue
		if(structure.rotation_network)
			propagate_rotation_change(structure, checked, TRUE)

	var/turf/step_back = get_step(src, GLOB.reverse_dir[dir])
	for(var/obj/structure/structure in step_back.contents)
		if(structure.rotation_network)
			if(structure in checked)
				continue
			if(structure.rotation_network)
				propagate_rotation_change(structure, checked, TRUE)

	if(first)
		rotation_network.update_animation_effect()

/obj/structure/proc/pass_rotation_data(obj/structure/connector, list/checked)
	if(!length(checked))
		checked = list()
	checked |= src

	if(connector.rotations_per_minute == rotations_per_minute)
		return

	if(connector.rotations_per_minute > rotations_per_minute)
		connector.propagate_rotation_change(src, first = TRUE)
	else
		propagate_rotation_change(connector, checked, TRUE)

/obj/structure/proc/rotation_break()
	visible_message(span_warning("[src] breaks apart from the opposing directions!"))
	playsound(src, 'sound/foley/cartdump.ogg', 75)
	qdel(src)

/obj/structure/proc/set_rotations_per_minute(speed)
	if(speed > 256)
		rotation_break()
		return FALSE
	rotations_per_minute = speed
	return TRUE
