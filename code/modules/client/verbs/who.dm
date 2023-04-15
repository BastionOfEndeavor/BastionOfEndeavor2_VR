/client/verb/who()
	/* Bastion of Endeavor Translation
	set name = "Who"
	set category = "OOC"

	var/msg = "<b>Current Players:</b>\n"
	*/
	set name = "Кто онлайн"
	set category = "OOC"
	set desc = "Показать, кто сейчас подключён к серверу."
	set hidden = TRUE // i don't see the point of this given that Advanced Who exists
	var/msg = "<b>Игроки онлайн:</b>\n"
	// End of Bastion of Endeavor Translation

	var/list/Lines = list()

	for(var/client/C in GLOB.clients)
		if(!check_rights_for(src, R_ADMIN|R_MOD))
			Lines += "\t[C.holder?.fakekey || C.key]"
			continue
		var/entry = "\t[C.key]"
		if(C.holder?.fakekey)
		/* Bastion of Endeavor Translation: Risky but we'll see
			entry += " <i>(as [C.holder.fakekey])</i>"
		entry += " - Playing as [C.mob.real_name]"
		*/
			entry += " <i>(как [C.holder.fakekey])</i>"
		entry += " - Играет за [acase_ru(C.mob, secondary = "real_name")]"
		// End of Bastion of Endeavor Translation
		switch(C.mob.stat)
			if(UNCONSCIOUS)
				/* Bastion of Endeavor Translation
				entry += " - <font color='darkgray'><b>Unconscious</b></font>"
				*/
				entry += " - <font color='darkgray'><b>Без сознания</b></font>"
				// End of Bastion of Endeavor Translation
			if(DEAD)
				if(isobserver(C.mob))
					var/mob/observer/dead/O = C.mob
				/* Bastion of Endeavor Translation
					if(O.started_as_observer)
						entry += " - <font color='gray'>Observing</font>"
					else
						entry += " - <font color='black'><b>DEAD</b></font>"
				else
					entry += " - <font color='black'><b>DEAD</b></font>"
				*/
					if(O.started_as_observer)
						entry += " - <font color='gray'>Наблюдает</font>"
					else
						entry += " - <font color='black'><b>[verb_ru(C.mob, ";Мёртв;Мертва;Мертво;Мертвы;", index_v = "real_name")]</b></font>"
				else
					entry += " - <font color='black'><b>[verb_ru(C.mob, ";Мёртв;Мертва;Мертво;Мертвы;", index_v = "real_name")]</b></font>"
				// End of Bastion of Endeavor Translation

		if(C.player_age != initial(C.player_age) && isnum(C.player_age)) // database is on
			var/age = C.player_age
			/* Bastion of Endeavor Translation
			switch(age)
				if(0 to 1)
					age = "<font color='#ff0000'><b>[age] days old</b></font>"
				if(1 to 10)
					age = "<font color='#ff8c00'><b>[age] days old</b></font>"
				else
					entry += " - [age] days old"
				*/
			entry += " - Возраст: [count_ru(age, "день;дня;дней")]"
			// End of Bastion of Endeavor Translation

		if(is_special_character(C.mob))
			/* Bastion of Endeavor Translation
			entry += " - <b><font color='red'>Antagonist</font></b>"
			*/
			entry += " - <b><font color='red'>Антагонист</font></b>"
			// End of Bastion of Endeavor Translation

		if(C.is_afk())
			var/seconds = C.last_activity_seconds()
			/* Bastion of Endeavor Translation
			entry += " (AFK - [round(seconds / 60)] minutes, [seconds % 60] seconds)"
			*/
			entry += " (АФК - [count_ru(round(seconds / 60), "минут;у;ы;")], [count_ru(round(seconds % 60), "секунд;у;ы;")])"
			// End of Bastion of Endeavor Translation

		entry += " [ADMIN_QUE(C.mob)]"
		Lines += entry

	for(var/line in sortList(Lines))
		msg += "[line]\n"

	msg += "<b>Total Players: [length(Lines)]</b>"
	msg = "<span class='filter_notice'>[jointext(msg, "<br>")]</span>"
	to_chat(src,msg)

/client/verb/staffwho()
	/* Bastion of Endeavor Translation
	set category = "Admin"
	set name = "Staffwho"
	*/
	set category = "Администрация"
	set name = "Кто администрирует"
	// End of Bastion of Endeavor Translation

	var/msg = ""
	var/modmsg = ""
	var/devmsg = ""
	var/eventMmsg = ""
	var/num_mods_online = 0
	var/num_admins_online = 0
	var/num_devs_online = 0
	var/num_event_managers_online = 0
	for(var/client/C in GLOB.admins) // VOREStation Edit - GLOB
		var/temp = ""
		var/category = R_ADMIN
		// VOREStation Edit - Apply stealthmin protection to all levels
		if(C.holder.fakekey && !check_rights_for(src, R_ADMIN|R_MOD))	// Only admins and mods can see stealthmins
			continue
		// VOREStation Edit End
		if(check_rights(R_BAN, FALSE, C)) // admins //VOREStation Edit
			num_admins_online++
		else if(check_rights(R_ADMIN, FALSE, C) && !check_rights(R_SERVER, FALSE, C)) // mods //VOREStation Edit: Game masters
			category = R_MOD
			num_mods_online++
		else if(check_rights(R_SERVER, FALSE, C)) // developers
			category = R_SERVER
			num_devs_online++
		else if(check_rights(R_STEALTH, FALSE, C)) // event managers //VOREStation Edit: Retired Staff
			category = R_EVENT
			num_event_managers_online++

		/* Bastion of Endeavor Translation
		temp += "\t[C] is a [C.holder.rank]"
		*/
		temp += "\t[C] — [C.holder.rank]"
		// End of Bastion of Endeavor Translation
		if(holder)
			if(C.holder.fakekey)
				/* Bastion of Endeavor Translation
				temp += " <i>(as [C.holder.fakekey])</i>"
				*/
				temp += " <i>(as [C.holder.fakekey])</i>"
				// End of Bastion of Endeavor Translation

			/* Bastion of Endeavor Translation
			if(isobserver(C.mob))
				temp += " - Observing"
			else if(istype(C.mob,/mob/new_player))
				temp += " - Lobby"
			else
				temp += " - Playing"
			*/
			if(isobserver(C.mob))
				temp += " - Наблюдает"
			else if(istype(C.mob,/mob/new_player))
				temp += " - В лобби"
			else
				temp += " - В игре"
			// End of Bastion of Endeavor Translation

			if(C.is_afk())
				var/seconds = C.last_activity_seconds()
				/* Bastion of Endeavor Translation
				temp += " (AFK - [round(seconds / 60)] minutes, [seconds % 60] seconds)"
				*/
				temp += " (АФК - [count_ru(round(seconds / 60), "минут;у;ы;")], [count_ru(round(seconds % 60), "секунд;у;ы;")])"
				// End of Bastion of Endeavor Translation
		temp += "\n"
		switch(category)
			if(R_ADMIN)
				msg += temp
			if(R_MOD)
				modmsg += temp
			if(R_SERVER)
				devmsg += temp
			if(R_EVENT)
				eventMmsg += temp

	/* Bastion of Endeavor Translation
	msg = "<b>Current Admins ([num_admins_online]):</b>\n" + msg
	*/
	msg = "<b>Администраторы в сети ([num_admins_online]):</b>\n" + msg
	// End of Bastion of Endeavor Translation

	if(config.show_mods)
		/* Bastion of Endeavor Translation
		msg += "\n<b> Current Game Masters ([num_mods_online]):</b>\n" + modmsg
		*/
		msg += "\n<b> Игровые мастера ([num_mods_online]):</b>\n" + modmsg
		// End of Bastion of Endeavor Translation

	if(config.show_devs)
		/* Bastion of Endeavor Translation
		msg += "\n<b> Current Developers ([num_devs_online]):</b>\n" + devmsg
		*/
		msg += "\n<b> Разработчики ([num_devs_online]):</b>\n" + devmsg
		// End of Bastion of Endeavor Translation

	if(config.show_event_managers)
		/* Bastion of Endeavor Translation
		msg += "\n<b> Current Miscellaneous ([num_event_managers_online]):</b>\n" + eventMmsg
		*/
		msg += "\n<b> Прочий персонал ([num_event_managers_online]):</b>\n" + eventMmsg
		// End of Bastion of Endeavor Translation

	var/num_mentors_online = 0
	var/mmsg = ""

	for(var/client/C in GLOB.mentors)
		num_mentors_online++
		/* Bastion of Endeavor Translation
		mmsg += "\t[C] is a Mentor"
		*/
		mmsg += "\t[C] — Ментор"
		// End of Bastion of Endeavor Translation
		if(holder)
			/* Bastion of Endeavor Translation
			if(isobserver(C.mob))
				mmsg += " - Observing"
			else if(istype(C.mob,/mob/new_player))
				mmsg += " - Lobby"
			else
				mmsg += " - Playing"
			*/
			if(isobserver(C.mob))
				mmsg += " - Наблюдает"
			else if(istype(C.mob,/mob/new_player))
				mmsg += " - В лобби"
			else
				mmsg += " - В игре"
			// End of Bastion of Endeavor Translation

			if(C.is_afk())
				var/seconds = C.last_activity_seconds()
				/* Bastion of Endeavor Translation
				mmsg += " (AFK - [round(seconds / 60)] minutes, [seconds % 60] seconds)"
				*/
				mmsg += " (АФК - [count_ru(round(seconds / 60), "минут;у;ы")], [count_ru(round(seconds % 60), "секунд;у;ы")])"
				// End of Bastion of Endeavor Translation
		mmsg += "\n"

	if(config.show_mentors)
		/* Bastion of Endeavor Translation
		msg += "\n<b> Current Mentors ([num_mentors_online]):</b>\n" + mmsg
		*/
		msg += "\n<b> Менторы в сети ([num_mentors_online]):</b>\n" + mmsg
		// End of Bastion of Endeavor Translation

	/* Bastion of Endeavor Translation
	msg += "\n<span class='info'>Adminhelps are also sent to Discord. If no admins are available in game try anyway and an admin on Discord may see it and respond.</span>"
	*/
	msg += "\n<span class='info'>Запросы в Помощь администратора дублируются в Discord. Если в сети нет администраторов, Вы можете все равно оставить запрос, и кто-то из администраторов может увидеть его в Discord и ответить.</span>"
	// End of Bastion of Endeavor Translation

	to_chat(src,"<span class='filter_notice'>[jointext(msg, "<br>")]</span>")
