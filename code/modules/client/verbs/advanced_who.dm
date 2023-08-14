
/client/verb/who_advanced()
	/* Bastion of Endeavor Translation
	set name = "Advanced Who"
	*/
	set name = "Список игроков"
	set desc = "Показать, кто сейчас в лобби или в игре"
	// End of Bastion of Endeavor Translation
	set category = "OOC"

	/* Bastion of Endeavor Translation
	var/msg = "<b>Current Players:</b>\n"
	*/
	var/msg = "<b>Игроки на сервере:</b>\n"
	// End of Bastion of Endeavor Translation

	var/list/Lines = list()

	if(holder)
		for(var/client/C in GLOB.clients)
			var/entry = "<tr><td>[C.key]"
			if(C.holder && C.holder.fakekey)
				/* Bastion of Endeavor Translation
				entry += " <i>(as [C.holder.fakekey])</i>"
				*/
				entry += " <i>(как [C.holder.fakekey])</i>"
				// End of Bastion of Endeavor Translation

			entry += "</td><td>"

			if(C.mob.real_name)
				switch(C.mob.stat)
					if(UNCONSCIOUS)
						/* Bastion of Endeavor Translation
						entry += "<span class='darkgray'><b>Unconscious</b></span>" // these are literally all spans so I can apply .inverted to them because black on dark grey isn't legible
						*/
						entry += "<span class='darkgray'><b>Без сознания</b></span>"
						// End of Bastion of Endeavor Translation

					if(DEAD)
						if(isobserver(C.mob))
							var/mob/observer/dead/O = C.mob
							/* Bastion of Endeavor Translation
							if(O.started_as_observer)
								entry += "<span class='gray'>Observing</span>"
							else
								entry += "<span class='black'><b>Died</b></span>"
							*/
							if(O.started_as_observer)
								entry += "<span class='gray'>Наблюдает</span>"
							else
								entry += "<span class='black'><b>[verb_ru(C.mob, ";Мёртв;Мертва;Мертво;Мертвы;", index_v = "real_name")]</b></span>"
							// End of Bastion of Endeavor Translation

					else
						/* Bastion of Endeavor Translation
						entry += "<span class='green'>Playing</span>"
						*/
						entry += "<span class='green'>В игре</span>"
						// End of Bastion of Endeavor Translation

				/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: This is VERY VERY daring and I might wanna come back to make sure real_names are working with cases
				entry += " as [C.mob.real_name]"
				*/
				entry += " за [acase_ru(C.mob, secondary = "real_name")]"
				// End of Bastion of Endeavor Translation

			else if(isnewplayer(C.mob))
				/* Bastion of Endeavor Translation
				entry += "<span class='blue'><b>In lobby</b></span>"
				*/
				entry += "<span class='blue'><b>В лобби</b></span>"
				// End of Bastion of Endeavor Translation

			entry += "</td><td>"

			var/age
			if(isnum(C.player_age))
				age = C.player_age
			else
				age = 0

			if(age <= 1)
				age = "<span class='red'><b>[age]</b></span>"
			else if(age < 10)
				age = "<span class='orange'><b>[age]</b></span>"

			/* Bastion of Endeavor Translation
			entry += "Age: [age]"
			*/
			entry += "Возраст аккаунта: [age]"
			// End of Bastion of Endeavor Translation
			entry += "</td><td>"

			if(is_special_character(C.mob))
				if(C.mob?.mind?.special_role)
					entry += "<b><span class='red'>[C.mob.mind.special_role]</span></b>"
				else
					/* Bastion of Endeavor Translation
					entry += "<b><span class='red'>Antagonist</span></b>"
					*/
					entry += "<b><span class='red'>Антагонист</span></b>"
					// End of Bastion of Endeavor Translation

			entry += "</td><td>"

			if(C.is_afk())
				var/seconds = C.last_activity_seconds()
				/* Bastion of Endeavor Translation
				entry += " (AFK - "
				entry += "[round(seconds / 60)] minutes, "
				entry += "[seconds % 60] seconds)"
				*/
				entry += " (АФК - "
				entry += "[count_ru(round(seconds / 60), "минут;у;ы;")], "
				entry += "[count_ru(seconds % 60, "секунд;у;ы;")])"
				// End of Bastion of Endeavor Translation

			entry += "</td><td>"
			entry += " (<A HREF='?_src_=holder;[HrefToken()];adminmoreinfo=\ref[C.mob]'>?</A>)"
			entry += "</td></tr>"

			Lines += entry
	else
		for(var/client/C in GLOB.clients)
			var/entry = "\t"
			if(C.holder && C.holder.fakekey)
				entry += "[C.holder.fakekey]"
			else
				entry += "[C.key]"
			var/mob/observer/dead/O = C.mob
			/* Bastion of Endeavor Translation
			if(isobserver(O))
				entry += " - <span class='gray'>Observing</span><br>"
			else if(istype(O,/mob/new_player))
				entry += " - <span class='blue'>In Lobby</span><br>"
			else
				entry += " - <span class='green'>Playing</span><br>"
			*/
			if(isobserver(O))
				entry += " - <span class='gray'>Наблюдает</span><br>"
			else if(istype(O,/mob/new_player))
				entry += " - <span class='blue'>В лобби</span><br>"
			else
				entry += " - <span class='green'>В игре</span><br>"
			// End of Bastion of Endeavor Translation

			Lines += entry

	msg += "<table>"
	for(var/line in sortList(Lines))
		msg += "[line]"
	msg += "</table>"
	/* Bastion of Endeavor Translation
	msg += "<b>Total Players: [length(Lines)]</b>"
	*/
	msg += "<b>Всего игроков: [length(Lines)]</b>"
	// End of Bastion of Endeavor Translation
	msg = "<span class='filter_notice'>" + msg + "</span>"
	to_chat(src, msg)
