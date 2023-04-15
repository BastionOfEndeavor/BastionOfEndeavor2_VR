/datum/preferences
	var/show_in_directory = 1	//Show in Character Directory
	/* Bastion of Endeavor Translation
	var/directory_tag = "Unset" //Sorting tag to use in character directory
	var/directory_erptag = "Unset"	//ditto, but for non-vore scenes
	*/
	var/directory_tag = "Не указано" //Sorting tag to use in character directory
	var/directory_erptag = "Не указано"	//ditto, but for non-vore scenes
	// End of Bastion of Endeavor Translation
	var/directory_ad = ""		//Advertisement stuff to show in character directory.
	var/sensorpref = 5			//Set character's suit sensor level
	var/capture_crystal = 1	//Whether or not someone is able to be caught with capture crystals
	var/auto_backup_implant = FALSE //Whether someone starts with a backup implant or not.

	var/job_talon_high = 0
	var/job_talon_med = 0
	var/job_talon_low = 0

//Why weren't these in game toggles already?
/client/verb/toggle_eating_noises()
	/* Bastion of Endeavor Translation
	set name = "Toggle Eating Noises"
	set category = "Preferences"
	set desc = "Toggles hearing Vore Eating noises."
	*/
	set name = "Звуки поедания"
	set category = "Предпочтения"
	set desc = "Включить или выключить звуки поедания при Vore."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/eating_noises

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear eating related vore noises.")
	*/
	to_chat(src, "Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуки поедания при Vore.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TEatNoise") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/client/verb/toggle_digestion_noises()
	/* Bastion of Endeavor Translation
	set name = "Toggle Digestion Noises"
	set category = "Preferences"
	set desc = "Toggles hearing Vore Digestion noises."
	*/
	set name = "Звуки переваривания"
	set category = "Предпочтения"
	set desc = "Включить или выключить звуки переваривания при Vore."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/digestion_noises

	toggle_preference(pref_path)

/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear digestion related vore noises.")
*/
	to_chat(src, "Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуки переваривания при Vore.")
// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TDigestNoise") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_belch_noises()
	/* Bastion of Endeavor Translation
	set name = "Toggle Audible Belching"
	set category = "Preferences"
	set desc = "Toggles hearing audible belches."
	*/
	set name = "Звуки отрыжек"
	set category = "Предпочтения"
	set desc = "Включить или выключить звуки отрыжек после Vore."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/belch_noises

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear belching.")
	*/
	to_chat(src, "Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуки отрыжек после Vore.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TBelchNoise")

/client/verb/toggle_emote_noises()
	/* Bastion of Endeavor Translation
	set name = "Toggle Emote Noises"
	set category = "Preferences"
	set desc = "Toggles hearing emote noises."
	*/
	set name = "Звуковые эмоуты"
	set category = "Предпочтения"
	set desc = "Включить или заглушить звуковые эмоуты."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/emote_noises

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear emote-related noises.")
	*/
	to_chat(src, "Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуки от эмоутов со звуковыми эффектами.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TEmoteNoise") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ghost_quiets()
	/* Bastion of Endeavor Translation
	set name = "Toggle Ghost Privacy"
	set category = "Preferences"
	set desc = "Toggles ghosts being able to see your subtles/whispers."
	*/
	set name = "Секретность от призраков"
	set category = "Предпочтения"
	set desc = "Переключить скрытность Ваших шёпотов и скрытых эмоутов от призраков."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/whisubtle_vis

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "Ghosts will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear subtles/whispers made by you.")
	*/
	to_chat(src, "Ваши скрытые действия и шёпот [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будут видны призракам.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TWhisubtleVis") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_capture_crystal()
	/* Bastion of Endeavor Translation
	set name = "Toggle Catchable"
	set category = "Preferences"
	set desc = "Toggles being catchable with capture crystals."
	*/
	set name = "Отлавливаемость кристаллами"
	set category = "Предпочтения"
	set desc = "Разрешить или запретить заключение Вашего персонажа в кристаллы."
	// End of Bastion of Endeavor Translation

	var/mob/living/L = mob

	if(prefs.capture_crystal)
		/* Bastion of Endeavor Translation
		to_chat(src, "You are no longer catchable.")
		*/
		to_chat(src, "Вас теперь нельзя заключить в кристалл.")
		// End of Bastion of Endeavor Translation
		prefs.capture_crystal = 0
	else
		/* Bastion of Endeavor Translation
		to_chat(src, "You are now catchable.")
		*/
		to_chat(src, "Вас теперь можно заключить в кристалл.")
		// End of Bastion of Endeavor Translation
		prefs.capture_crystal = 1
	if(L && istype(L))
		L.capture_crystal = prefs.capture_crystal
	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TCaptureCrystal") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_mentorhelp_ping()
	/* Bastion of Endeavor Translation
	set name = "Toggle Mentorhelp Ping"
	set category = "Preferences"
	set desc = "Toggles the mentorhelp ping"
	*/
	set name = "Звук Помощи ментора"
	set category = "Предпочтения"
	set desc = "Включить или выключить звуковое оповещение при получении сообщения в Помощи ментора."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/play_mentorhelp_ping

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "Mentorhelp pings are now [ is_preference_enabled(pref_path) ? "enabled" : "disabled"]")
	*/
	to_chat(src, "Вы [ is_preference_enabled(pref_path) ? "теперь" : "больше не"] будете слышать звуковое оповещение при сообщениях в Помощи ментора.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TSoundMentorhelps")

/client/verb/toggle_player_tips()
	/* Bastion of Endeavor Translation
	set name = "Toggle Receiving Player Tips"
	set category = "Preferences"
	set desc = "When toggled on, you receive tips periodically on roleplay and gameplay."
	*/
	set name = "Периодические подсказки"
	set category = "Предпочтения"
	set desc = "Если эта настройка включена, Вы будете получать периодические советы об отыгрыше и игровых механиках."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/player_tips

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You are [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] periodically receiving advice on gameplay and roleplay.")
	*/
	to_chat(src, "Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше"] не будете получать периодические советы об отыгрыше и игровых механиках.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TReceivePlayerTips")

/client/verb/toggle_pain_frequency()
	/* Bastion of Endeavor Translation
	set name = "Toggle Pain Frequency"
	set category = "Preferences"
	set desc = "When toggled on, increases the cooldown of pain messages sent to chat for minor injuries"
	*/
	set name = "Таймер болевых сообщений"
	set category = "Предпочтения"
	set desc = "Если эта настройка включена, болевые сообщения в чате будут отображаться реже."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/pain_frequency

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "The cooldown between pain messages for minor (under 20/5 injury. Multi-limb injuries are still faster) is now [ (is_preference_enabled(pref_path)) ? "extended" : "default"].")
	*/
	to_chat(src, "Таймер болевых сообщений теперь [ (is_preference_enabled(pref_path)) ? "длиннее" : "в нормальном режиме"] (не действует при ранении нескольких конечностей).")
	// End of Bastion of Endeavor Translation
