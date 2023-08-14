var/list/spawntypes = list()

/proc/populate_spawn_points()
	spawntypes = list()
	for(var/type in subtypesof(/datum/spawnpoint))
		var/datum/spawnpoint/S = new type()
		spawntypes[S.display_name] = S

/datum/spawnpoint
	var/msg          //Message to display on the arrivals computer.
	var/list/turfs   //List of turfs to spawn on.
	var/display_name //Name used in preference setup.
	var/list/restrict_job = null
	var/list/disallow_job = null
	/* Bastion of Endeavor Translation
	var/announce_channel = "Common"
	*/
	var/announce_channel = "Общий"
	// End of Bastion of Endeavor Translation
	var/allowed_mob_types = JOB_SILICON|JOB_CARBON

/datum/spawnpoint/proc/check_job_spawning(job)
	if(restrict_job && !(job in restrict_job))
		return 0

	if(disallow_job && (job in disallow_job))
		return 0

	var/datum/job/J = SSjob.get_job(job)
	if(!J) // Couldn't find, admin shenanigans? Allow it
		return 1

	if(J.offmap_spawn && !(job in restrict_job))
		return 0

	if(!(J.mob_type & allowed_mob_types))
		return 0

	return 1

/datum/spawnpoint/proc/get_spawn_position()
	return get_turf(pick(turfs))

/datum/spawnpoint/arrivals
	/* Bastion of Endeavor Translation
	display_name = "Arrivals Shuttle"
	msg = "will arrive to the station shortly by shuttle"
	*/
	display_name = "Шаттл прибытия"
	msg = "прибыл;;а;о;и; на станцию на шаттле"
	// End of Bastion of Endeavor Translation

/datum/spawnpoint/arrivals/New()
	..()
	turfs = latejoin

/datum/spawnpoint/gateway
	/* Bastion of Endeavor Translation
	display_name = "Gateway"
	msg = "has completed translation from offsite gateway"
	*/
	display_name = "Телепорт"
	msg = "прибыл;;а;о;и; на станцию с помощью телепорта"
	// End of Bastion of Endeavor Translation

/datum/spawnpoint/gateway/New()
	..()
	turfs = latejoin_gateway
/* VOREStation Edit
/datum/spawnpoint/elevator
	display_name = "Elevator"
	msg = "has arrived from the residential district"

/datum/spawnpoint/elevator/New()
	..()
	turfs = latejoin_elevator
*/
/datum/spawnpoint/cryo
	/* Bastion of Endeavor Translation
	display_name = "Cryogenic Storage"
	msg = "has completed cryogenic revival"
	*/
	display_name = "Криокамеры"
	msg = "завершил;;а;о;и; пробуждение от криогенного сна"
	// End of Bastion of Endeavor Translation
	allowed_mob_types = JOB_CARBON

/datum/spawnpoint/cryo/New()
	..()
	turfs = latejoin_cryo

/datum/spawnpoint/cyborg
	/* Bastion of Endeavor Translation
	display_name = "Cyborg Storage"
	msg = "has been activated from storage"
	*/
	display_name = "Хранилище киборгов"
	msg = ";был активирован;была активирована;было активировано;были активированы; из хранилища"
	// End of Bastion of Endeavor Translation
	allowed_mob_types = JOB_SILICON

/datum/spawnpoint/cyborg/New()
	..()
	turfs = latejoin_cyborg

/obj/effect/landmark/arrivals
	name = "JoinLateShuttle"
	delete_me = 1

/obj/effect/landmark/arrivals/New()
	latejoin += loc
	..()

var/global/list/latejoin_tram   = list()

/obj/effect/landmark/tram
	name = "JoinLateTram"
	delete_me = 1

/obj/effect/landmark/tram/New()
	latejoin_tram += loc // There's no tram but you know whatever man!
	..()

/datum/spawnpoint/tram
	/* Bastion of Endeavor Translation
	display_name = "Tram Station"
	msg = "will arrive to the station shortly by shuttle"
	*/
	display_name = "Трамвайный вокзал"
	msg = "прибыл;;а;о;и; на станцию на шаттле"
	// End of Bastion of Endeavor Translation

/datum/spawnpoint/tram/New()
	..()
	turfs = latejoin_tram