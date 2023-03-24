GLOBAL_DATUM(character_directory, /datum/character_directory)

/client/verb/show_character_directory()
	/* Bastion of Endeavor Translation
	set name = "Character Directory"
	set category = "OOC"
	set desc = "Shows a listing of all active characters, along with their associated OOC notes, flavor text, and more."
	*/
	set name = "Список персонажей"
	set category = "OOC"
	set desc = "Показать список персонажей на станции вместе с их ООС-заметками, описаниями и т.д."
	// End of Bastion of Endeavor Translation

	// This is primarily to stop malicious users from trying to lag the server by spamming this verb
	if(!usr.checkMoveCooldown())
		/* Bastion of Endeavor Translation
		to_chat(usr, "<span class='warning'>Don't spam character directory refresh.</span>")
		*/
		to_chat(usr, "<span class='warning'>Не спамьте глаголом списка персонажей.</span>")
		// End of Bastion of Endeavor Translation
		return
	usr.setMoveCooldown(10)

	if(!GLOB.character_directory)
		GLOB.character_directory = new
	GLOB.character_directory.tgui_interact(mob)


// This is a global singleton. Keep in mind that all operations should occur on usr, not src.
/datum/character_directory
/datum/character_directory/tgui_state(mob/user)
	return GLOB.tgui_always_state

/datum/character_directory/tgui_interact(mob/user, datum/tgui/ui, datum/tgui/parent_ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		/* Bastion of Endeavor Translation
		ui = new(user, src, "CharacterDirectory", "Character Directory")
		*/
		ui = new(user, src, "CharacterDirectory", "Список персонажей")
		// End of Bastion of Endeavor Translation
		ui.open()

/datum/character_directory/tgui_data(mob/user, datum/tgui/ui, datum/tgui_state/state)
	var/list/data = ..()

	if (user?.mind)
		data["personalVisibility"] = user.mind.show_in_directory
		/* Bastion of Endeavor Translation
		data["personalTag"] = user.mind.directory_tag || "Unset"
		data["personalErpTag"] = user.mind.directory_erptag || "Unset"
		*/
		data["personalTag"] = user.mind.directory_tag || "Не указано"
		data["personalErpTag"] = user.mind.directory_erptag || "Не указано"
		// End of Bastion of Endeavor Translation
	else if (user?.client?.prefs)
		data["personalVisibility"] = user.client.prefs.show_in_directory
		/* Bastion of Endeavor Translation
		data["personalTag"] = user.client.prefs.directory_tag || "Unset"
		data["personalErpTag"] = user.client.prefs.directory_erptag || "Unset"
		*/
		data["personalTag"] = user.client.prefs.directory_tag || "Не указано"
		data["personalErpTag"] = user.client.prefs.directory_erptag || "Не указано"
		// End of Bastion of Endeavor Translation

	return data

/datum/character_directory/tgui_static_data(mob/user, datum/tgui/ui, datum/tgui_state/state)
	var/list/data = ..()

	var/list/directory_mobs = list()
	for(var/client/C in GLOB.clients)
		// Allow opt-out.
		if(C?.mob?.mind ? !C.mob.mind.show_in_directory : !C?.prefs?.show_in_directory)
			continue

		// These are the three vars we're trying to find
		// The approach differs based on the mob the client is controlling
		var/name = null
		var/species = null
		var/ooc_notes = null
		var/flavor_text = null
		var/tag
		var/erptag
		var/character_ad
		if (C.mob?.mind) //could use ternary for all three but this is more efficient
			/* Bastion of Endeavor Translation
			tag = C.mob.mind.directory_tag || "Unset"
			erptag = C.mob.mind.directory_erptag || "Unset"
			*/
			tag = C.mob.mind.directory_tag || "Не указано"
			erptag = C.mob.mind.directory_erptag || "Не указано"
			// End of Bastion of Endeavor Translation
			character_ad = C.mob.mind.directory_ad
		else
			/* Bastion of Endeavor Translation
			tag = C.prefs.directory_tag || "Unset"
			erptag = C.prefs.directory_erptag || "Unset"
			*/
			tag = C.prefs.directory_tag || "Не указано"
			erptag = C.prefs.directory_erptag || "Не указано"
			// End of Bastion of Endeavor Translation
			character_ad = C.prefs.directory_ad

		if(ishuman(C.mob))
			var/mob/living/carbon/human/H = C.mob
			if(data_core && data_core.general)
				if(!find_general_record("name", H.real_name))
					if(!find_record("name", H.real_name, data_core.hidden_general))
						continue
			name = H.real_name
			species = "[H.custom_species ? H.custom_species : H.species.name]"
			ooc_notes = H.ooc_notes
			flavor_text = H.flavor_texts["general"]

		if(isAI(C.mob))
			var/mob/living/silicon/ai/A = C.mob
			name = A.name
			/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: Will this break?
			species = "Artificial Intelligence"
			*/
			species = "Искусственный интеллект"
			// End of Bastion of Endeavor Translation
			ooc_notes = A.ooc_notes
			flavor_text = null // No flavor text for AIs :c

		if(isrobot(C.mob))
			var/mob/living/silicon/robot/R = C.mob
			if(R.scrambledcodes || (R.module && R.module.hide_on_manifest))
				continue
			name = R.name
			species = "[R.modtype] [R.braintype]"
			ooc_notes = R.ooc_notes
			flavor_text = R.flavor_text

		// It's okay if we fail to find OOC notes and flavor text
		// But if we can't find the name, they must be using a non-compatible mob type currently.
		if(!name)
			continue

		directory_mobs.Add(list(list(
			"name" = name,
			"species" = species,
			"ooc_notes" = ooc_notes,
			"tag" = tag,
			"erptag" = erptag,
			"character_ad" = character_ad,
			"flavor_text" = flavor_text,
		)))

	data["directory"] = directory_mobs

	return data


/datum/character_directory/tgui_act(action, list/params, datum/tgui/ui, datum/tgui_state/state)
	. = ..()
	if(.)
		return

	if(action == "refresh")
		// This is primarily to stop malicious users from trying to lag the server by spamming this verb
		if(!usr.checkMoveCooldown())
			/* Bastion of Endeavor Translation
			to_chat(usr, "<span class='warning'>Don't spam character directory refresh.</span>")
			*/
			to_chat(usr, "<span class='warning'>Не спамьте глаголом списка персонажей.</span>")
			// End of Bastion of Endeavor Translation
			return
		usr.setMoveCooldown(10)
		update_tgui_static_data(usr, ui)
		return TRUE
	else
		return check_for_mind_or_prefs(usr, action, params["overwrite_prefs"])

/datum/character_directory/proc/check_for_mind_or_prefs(mob/user, action, overwrite_prefs)
	if (!user.client)
		return
	var/can_set_prefs = overwrite_prefs && !!user.client.prefs
	var/can_set_mind = !!user.mind
	if (!can_set_prefs && !can_set_mind)
		if (!overwrite_prefs && !!user.client.prefs)
			/* Bastion of Endeavor Translation
			to_chat(user, "<span class='warning'>You cannot change these settings if you don't have a mind to save them to. Enable overwriting prefs and switch to a slot you're fine with overwriting.</span>")
			*/
			to_chat(user, "<span class='warning'>Вы не можете изменять эти настройки, не имея разума для их сохранения. Разрешите перезапись предпочтений и переключитесь на слот, в который Вы хотите сохранить изменения.</span>")
			// End of Bastion of Endeavor Translation
		return
	switch(action)
		if ("setTag")
			/* Bastion of Endeavor Translation
			var/list/new_tag = tgui_input_list(usr, "Pick a new Vore tag for the character directory", "Character Tag", GLOB.char_directory_tags)
			*/
			var/list/new_tag = tgui_input_list(usr, "Укажите свои предпочтения относительно сцен с Vore:", "Предпочтения Vore", GLOB.char_directory_tags)
			// End of Bastion of Endeavor Translation
			if(!new_tag)
				return
			return set_for_mind_or_prefs(user, action, new_tag, can_set_prefs, can_set_mind)
		if ("setErpTag")
			/* Bastion of Endeavor Translation
			var/list/new_erptag = tgui_input_list(usr, "Pick a new ERP tag for the character directory", "Character ERP Tag", GLOB.char_directory_erptags)
			*/
			var/list/new_erptag = tgui_input_list(usr, "Укажите свои предпочтения относительно сцен с ERP:", "Предпочтения ERP", GLOB.char_directory_erptags)
			// End of Bastion of Endeavor Translation
			if(!new_erptag)
				return
			return set_for_mind_or_prefs(user, action, new_erptag, can_set_prefs, can_set_mind)
		if ("setVisible")
			var/visible = TRUE
			if (can_set_mind)
				visible = user.mind.show_in_directory
			else if (can_set_prefs)
				visible = user.client.prefs.show_in_directory
			/* Bastion of Endeavor Translation
			to_chat(usr, "<span class='notice'>You are now [!visible ? "shown" : "not shown"] in the directory.</span>")
			*/
			to_chat(usr, "<span class='notice'>Ваш персонаж теперь [!visible ? "будет" : "не будет"] отображаться в списке.</span>")
			// End of Bastion of Endeavor Translation
			return set_for_mind_or_prefs(user, action, !visible, can_set_prefs, can_set_mind)
		if ("editAd")
			var/current_ad = (can_set_mind ? usr.mind.directory_ad : null) || (can_set_prefs ? usr.client.prefs.directory_ad : null)
			/* Bastion of Endeavor Translation
			var/new_ad = sanitize(tgui_input_text(usr, "Change your character ad", "Character Ad", current_ad, multiline = TRUE, prevent_enter = TRUE), extra = 0)
			*/
			var/new_ad = sanitize(tgui_input_text(usr, "Введите своё объявление для списка персонажей:", "Объявление в списке", current_ad, multiline = TRUE, prevent_enter = TRUE), extra = 0)
			// End of Bastion of Endeavor Translation
			if(isnull(new_ad))
				return
			return set_for_mind_or_prefs(user, action, new_ad, can_set_prefs, can_set_mind)

/datum/character_directory/proc/set_for_mind_or_prefs(mob/user, action, new_value, can_set_prefs, can_set_mind)
	can_set_prefs &&= !!user.client.prefs
	can_set_mind &&= !!user.mind
	if (!can_set_prefs && !can_set_mind)
		/* Bastion of Endeavor Translation
		to_chat(user, "<span class='warning'>You seem to have lost either your mind, or your current preferences, while changing the values.[action == "editAd" ? " Here is your ad that you wrote. [new_value]" : null]</span>")
		*/
		to_chat(user, "<span class='warning'>Ошибка: пока Вы изменяли предпочтения, затерялась запись о Ваших настройках или разума песонажа.[action == "editAd" ? " Вот, что Вы написали. [new_value]" : null]</span>")
		// End of Bastion of Endeavor Translation
		return
	switch(action)
		if ("setTag")
			if (can_set_prefs)
				user.client.prefs.directory_tag = new_value
			if (can_set_mind)
				user.mind.directory_tag = new_value
			return TRUE
		if ("setErpTag")
			if (can_set_prefs)
				user.client.prefs.directory_erptag = new_value
			if (can_set_mind)
				user.mind.directory_erptag = new_value
			return TRUE
		if ("setVisible")
			if (can_set_prefs)
				user.client.prefs.show_in_directory = new_value
			if (can_set_mind)
				user.mind.show_in_directory = new_value
			return TRUE
		if ("editAd")
			if (can_set_prefs)
				user.client.prefs.directory_ad = new_value
			if (can_set_mind)
				user.mind.directory_ad = new_value
			return TRUE
