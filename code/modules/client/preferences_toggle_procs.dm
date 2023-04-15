//Toggles for preferences, normal clients
/client/verb/toggle_ghost_ears()
	/* Bastion of Endeavor Translation
	set name = "Toggle Ghost Ears"
	set category = "Preferences"
	set desc = "Toggles between seeing all mob speech and only nearby mob speech as an observer."
	*/
	set name = "Призрачный слух"
	set category = "Предпочтения"
	set desc = "Позволяет слышать в режиме призрака речь всех мобов или только тех, кто на Вашем экране."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/ghost_ears

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear all mob speech as a ghost.")
	*/
	to_chat(src,"Вы теперь будете слышать речь [ (is_preference_enabled(pref_path)) ? "всех мобов" : "только мобов на Вашем экране"], будучи призраком.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TGEars") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ghost_vision()
	/* Bastion of Endeavor Translation
	set name = "Toggle Ghost Sight"
	set category = "Preferences"
	set desc = "Toggles between seeing all mob emotes and only nearby mob emotes as an observer."
	*/
	set name = "Призрачное зрение"
	set category = "Предпочтения"
	set desc = "Позволяет слышать в режиме призрака эмоуты всех мобов или только тех, кто на Вашем экране."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/ghost_sight

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] see all emotes as a ghost.")
	*/
	to_chat(src,"Вы теперь будете видеть эмоуты [ (is_preference_enabled(pref_path)) ? "всех мобов" : "только мобов на Вашем экране"], будучи призраком.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TGVision") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ghost_radio()
	/* Bastion of Endeavor Translation
	set name = "Toggle Ghost Radio"
	set category = "Preferences"
	set desc = "Toggles between seeing all radio chat and only nearby radio chatter as an observer."
	*/
	set name = "Призрачная рация"
	set category = "Предпочтения"
	set desc = "Позволяет слышать в режиме призрака всю речь по рации или только ту, что на Вашем экране."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/ghost_radio

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear all radios as a ghost.")
	*/
	to_chat(src,"Вы теперь будете слышать рацию [ (is_preference_enabled(pref_path)) ? "со всех каналов" : "только в пределах Вашего экрана"], будучи призраком.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TGRadio") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_deadchat()
	/* Bastion of Endeavor Translation
	set name = "Toggle Deadchat"
	set category = "Preferences"
	set desc = "Toggles visibility of dead chat."
	*/
	set name = "Отображение чата мёртвых"
	set category = "Предпочтения"
	set desc = "Переключает отображение чата мёртвых."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/show_dsay

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear dead chat as a ghost.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете видеть чат мёртвых, будучи призраком.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TDeadChat") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ooc()
	/* Bastion of Endeavor Translation
	set name = "Toggle OOC"
	set category = "Preferences"
	set desc = "Toggles visibility of global out of character chat."
	*/
	set name = "Отображение чата OOC"
	set category = "Предпочтения"
	set desc = "Переключает отображение глобального чата OOC."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/show_ooc

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(/datum/client_preference/show_ooc)) ? "now" : "no longer"] hear global out of character chat.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете видеть глобальный чат OOC.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TOOC") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_looc()
	/* Bastion of Endeavor Translation
	set name = "Toggle LOOC"
	set category = "Preferences"
	set desc = "Toggles visibility of local out of character chat."
	*/
	set name = "Отображение чата LOOC"
	set category = "Предпочтения"
	set desc = "Переключает отбражение локального чата LOOC."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/show_looc

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear local out of character chat.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете видеть локальный чат LOOC.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TLOOC") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_precision_placement()
	/* Bastion of Endeavor Translation
	set name = "Toggle Precision Placement"
	set category = "Preferences"
	set desc = "Toggles whether objects placed on table will be on cursor position or centered."
	*/
	set name = "Точное размещение"
	set category = "Предпочтения"
	set desc = "Переключает размещение Вами предметов на столе под курсором или точно в центр."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/precision_placement

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] place items where your cursor is on the table.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь будете размещать предметы на столах точно под свой курсор" : "теперь будете размещать предметы на столах ровно по центру"].")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TPIP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_typing()
	/* Bastion of Endeavor Translation
	set name = "Toggle Typing Indicator"
	set category = "Preferences"
	set desc = "Toggles you having the speech bubble typing indicator."
	*/
	set name = "Индикатор набора текста"
	set category = "Предпочтения"
	set desc = "Переключает отображение Вашего облачка речи при наборе текста."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/show_typing_indicator

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] have the speech indicator.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете отображать свой индикатор набора текста.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TTIND") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ahelp_sound()
	/* Bastion of Endeavor Translation
	set name = "Toggle Admin Help Sound"
	set category = "Preferences"
	set desc = "Toggles the ability to hear a noise broadcasted when you get an admin message."
	*/
	set name = "Звук Помощи администратора"
	set category = "Предпочтения"
	set desc = "Переключает звуковое оповещение при получении сообщения в Помощи администратора."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/holder/play_adminhelp_ping

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] receive noise from admin messages.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуковое оповещение при сообщениях в Помощи администратора.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAHelp") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_lobby_music()
	/* Bastion of Endeavor Translation
	set name = "Toggle Lobby Music"
	set category = "Preferences"
	set desc = "Toggles the ability to hear the music in the lobby."
	*/
	set name = "Музыка в лобби"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение музыки в лобби."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/play_lobby_music

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear music in the lobby.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать музыку в лобби.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TLobMusic") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_admin_midis()
	/* Bastion of Endeavor Translation
	set name = "Toggle Admin Music"
	set category = "Preferences"
	set desc = "Toggles the ability to hear music played by admins."
	*/
	set name = "Музыка от администраторов"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение музыки, включенной администраторами."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/play_admin_midis

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear music from admins.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуковые файлы, включённые администраторами.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAMidis") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_ambience()
	/* Bastion of Endeavor Translation
	set name = "Toggle Ambience"
	set category = "Preferences"
	set desc = "Toggles the ability to hear local ambience."
	*/
	set name = "Звуки окружения"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков окружения."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/play_ambiance

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear ambient noise.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуки окружения.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAmbience") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_weather_sounds()
	/* Bastion of Endeavor Translation
	set name = "Toggle Weather Sounds"
	set category = "Preferences"
	set desc = "Toggles the ability to hear weather sounds while on a planet."
	*/
	set name = "Звуки погоды"
	set category = "Предпочтения"
	set desc = "Переключает звуки погоды на поверхности планет."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/weather_sounds

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear weather sounds.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуки погоды.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TWeatherSounds") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_supermatter_hum()
	/* Bastion of Endeavor Translation
	set name = "Toggle SM Hum" // Avoiding using the full 'Supermatter' name to not conflict with the Setup-Supermatter adminverb.
	set category = "Preferences"
	set desc = "Toggles the ability to hear supermatter hums."
	*/
	set name = "Гул суперматерии"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение гула кристалла суперматерии."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/supermatter_hum

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear a hum from the supermatter.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать гул кристалла суперматерии.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TSupermatterHum") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_jukebox()
	/* Bastion of Endeavor Translation
	set name = "Toggle Jukebox"
	set category = "Preferences"
	set desc = "Toggles the ability to hear jukebox music."
	*/
	set name = "Звуки музыкального автомата"
	set category = "Предпочтения"
	set desc = "Включает или отключает звуки музыкального автомата."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/play_jukebox

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear jukebox music.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать музыкальные автоматы.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TJukebox") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_be_special(role in be_special_flags)
	/* Bastion of Endeavor Translation
	set name = "Toggle Special Role Candidacy"
	set category = "Preferences"
	set desc = "Toggles which special roles you would like to be a candidate for, during events."
	*/
	set name = "Кандидатура на особые роли"
	set category = "Предпочтения"
	set desc = "Позволяет выбрать, на какие особые роли выставить Вашу кандидатуру во время эвентов."
	// End of Bastion of Endeavor Translation

	var/role_flag = be_special_flags[role]
	if(!role_flag)	return

	prefs.be_special ^= role_flag
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will [(prefs.be_special & role_flag) ? "now" : "no longer"] be considered for [role] events (where possible).")
	*/
	to_chat(src,"Вы [(prefs.be_special & role_flag) ? "теперь" : "больше не"] будете учтены при подборе игроков на роль '[role]'.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TBeSpecial") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_air_pump_hum()
	/* Bastion of Endeavor Translation
	set name = "Toggle Air Vent Noise"
	set category = "Preferences"
	set desc = "Toggles the ability to hear air vent humming."
	*/
	set name = "Звуки вентиляции"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков вентиляции."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/air_pump_noise

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear air vents hum, start, and stop.")
	*/
	to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете слышать звуки вентиляции.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAirPumpNoise")

/client/verb/toggle_old_door_sounds()
	/* Bastion of Endeavor Translation
	set name = "Toggle Old Door Sounds"
	set category = "Preferences"
	set desc = "Toggles door sounds between old and new."
	*/
	set name = "Звуки шлюзов"
	set category = "Предпочтения"
	set desc = "Переключает звуки шлюзов между новыми и старыми."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/old_door_sounds

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear the legacy door sounds.")
	*/
	to_chat(src, "Вы теперь будете слышать [ (is_preference_enabled(pref_path)) ? "старые" : "новые"] звуки шлюзов.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TOldDoorSounds")

/client/verb/toggle_department_door_sounds()
	/* Bastion of Endeavor Translation
	set name = "Toggle Department Door Sounds"
	set category = "Preferences"
	set desc = "Toggles hearing of department-specific door sounds."
	*/
	set name = "Звуки шлюзов отделов"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков шлюзов в зависимости от отдела."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/department_door_sounds

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear per-department door sounds.")
	*/
	to_chat(src, "Вы теперь будете слышать [ (is_preference_enabled(pref_path)) ? "одинаковые звуки шлюзов вне" : "разные звуки шлюзов"] зависимости от отдела, в котором они расположены.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TDepartmentDoorSounds")

/client/verb/toggle_pickup_sounds()
	/* Bastion of Endeavor Translation
	set name = "Toggle Picked Up Item Sounds"
	set category = "Preferences"
	set desc = "Toggles the ability to hear sounds when items are picked up."
	*/
	set name = "Звуки при взятии предметов"
	set category = "Предпочтения"
	set desc = "Переключает звуки при взятии предмета в руку."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/pickup_sounds

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear sounds when items are picked up.")
	*/
	to_chat(src, "Предметы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будут издавать звуки при взятии в руку.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TPickupSounds")

/client/verb/toggle_drop_sounds()
	/* Bastion of Endeavor Translation
	set name = "Toggle Dropped Item Sounds"
	set category = "Preferences"
	set desc = "Toggles the ability to hear sounds when items are dropped or thrown."
	*/
	set name = "Звуки при броске предметов"
	set category = "Предпочтения"
	set desc = "Переключает звуки при метании и опускании предмета."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/drop_sounds

	toggle_preference(pref_path)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear sounds when items are dropped or thrown.")
	*/
	to_chat(src, "Предметы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будут издавать звуки при опускании или метании.")
	// End of Bastion of Endeavor Translation

	SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb", "TDropSounds")

/client/verb/toggle_safe_firing()
	/* Bastion of Endeavor Translation
	set name = "Toggle Gun Firing Intent Requirement"
	set category = "Preferences"
	set desc = "Toggles between safe and dangerous firing. Safe requires a non-help intent to fire, dangerous can be fired on help intent."
	*/
	set name = "Режим огнестрельного оружия"
	set category = "Предпочтения"
	set desc = "Переключает возможность оружия стрелять при намерении Помочь."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/safefiring
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will now use [(is_preference_enabled(/datum/client_preference/safefiring)) ? "safe" : "dangerous"] firearms firing.")
	*/
	to_chat(src,"Огнестрельное оружие [(is_preference_enabled(/datum/client_preference/safefiring)) ? "больше не будет стрелять" : "теперь будет стрелять даже"] при намерении Помочь.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TFiringMode") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/* Bastion of Endeavor Translation
/client/verb/toggle_mob_tooltips()
	set name = "Toggle Mob Tooltips"
	set category = "Preferences"
	set desc = "Toggles displaying name/species over mobs when they are moused over."
*/
/client/verb/toggle_mob_tooltips()
	set name = "Всплывающие подсказки мобов"
	set category = "Предпочтения"
	set desc = "Переключает отображение имени и расы мобов при наведении на них курсором."
// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/mob_tooltips
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will now [(is_preference_enabled(/datum/client_preference/mob_tooltips)) ? "see" : "not see"] mob tooltips.")
	*/
	to_chat(src,"Вы [(is_preference_enabled(/datum/client_preference/mob_tooltips)) ? "теперь" : "больше не"] будете видеть всплывающие подсказки при наведении курсора на мобов.")

	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TMobTooltips") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_inv_tooltips()
	/* Bastion of Endeavor Translation
	set name = "Toggle Item Tooltips"
	set category = "Preferences"
	set desc = "Toggles displaying name/desc over items when they are moused over (only applies in inventory)."
	*/
	set name = "Всплывающие подсказки в инвентаре"
	set category = "Предпочтения"
	set desc = "Переключает отображение имени и описания предметов в инвентаре при наведении на них курсором."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/inv_tooltips
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src,"You will now [(is_preference_enabled(/datum/client_preference/inv_tooltips)) ? "see" : "not see"] inventory tooltips.")
	*/
	to_chat(src,"Вы [(is_preference_enabled(/datum/client_preference/inv_tooltips)) ? "теперь" : "больше не"] будете видеть всплывающие подсказки при наведении курсора на предметы в инвентаре.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TInvTooltips") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_hear_instruments()
	/* Bastion of Endeavor Translation
	set name = "Toggle Hear/Ignore Instruments"
	set category = "Preferences"
	set desc = "Toggles the ability to hear instruments playing."
	*/
	set name = "Звуки музыкальных инструментов"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков музыкальных инструментов."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/instrument_toggle
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will now [(is_preference_enabled(/datum/client_preference/instrument_toggle)) ? "hear" : "not hear"] instruments being played.")
	*/
	to_chat(src, "Вы [(is_preference_enabled(/datum/client_preference/instrument_toggle)) ? "теперь" : "больше не"] будете слышать музыкальные инструменты.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","THInstm") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/verb/toggle_vchat()
	/* Bastion of Endeavor Translation
	set name = "Toggle VChat"
	set category = "Preferences"
	set desc = "Toggles VChat. Reloading VChat and/or reconnecting required to affect changes."
	*/
	set name = "VChat"
	set category = "Предпочтения"
	set desc = "Включает или выключает VChat. Для применения настройки требуется перезагрузить VChat или переподключиться."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/vchat_enable
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You have toggled VChat [is_preference_enabled(pref_path) ? "on" : "off"]. \
		You will have to reload VChat and/or reconnect to the server for these changes to take place. \
		VChat message persistence is not guaranteed if you change this again before the start of the next round.")
	*/
	to_chat(src, "Вы [is_preference_enabled(pref_path) ? "включили" : "отключили"] VChat. \
		Чтобы применить настройку, Вам необходимо использовать глагол Перезагрузить VChat или переподключиться к серверу. \
		Настройка может не сохраниться на следующую смену, если Вы измените её ещё раз до конца текущей.")
	// End of Bastion of Endeavor Translation

/client/verb/toggle_status_indicators()
	/* Bastion of Endeavor Translation
	set name = "Toggle Status Indicators"
	set category = "Preferences"
	set desc = "Toggles seeing status indicators over peoples' heads."
	*/
	set name = "Индикаторы состояния"
	set category = "Предпочтения"
	set desc = "Переключает отображение индикаторов состояния над головами мобов."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/status_indicators
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will now [(is_preference_enabled(/datum/client_preference/status_indicators)) ? "see" : "not see"] status indicators.")
	*/
	to_chat(src, "Вы [(is_preference_enabled(/datum/client_preference/status_indicators)) ? "теперь" : "больше не"] будете видеть индикаторы состояния над головами мобов.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TStatusIndicators")


/client/verb/toggle_radio_sounds()
	/* Bastion of Endeavor Translation
	set name = "Toggle Radio Sounds"
	set category = "Preferences"
	set desc = "Toggle hearing a sound when somebody speaks over your headset."
	*/
	set name = "Звуки рации"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков при речи в каналах рации."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/radio_sounds
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will now [(is_preference_enabled(/datum/client_preference/radio_sounds)) ? "hear" : "not hear"] radio sounds.")
	*/
	to_chat(src, "Вы [(is_preference_enabled(/datum/client_preference/radio_sounds)) ? "теперь" : "больше не"] будете слышать звуки рации.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TRadioSounds")

/client/verb/toggle_say_sounds()
	/* Bastion of Endeavor Translation
	set name = "Sound-Toggle-Say"
	set category = "Preferences"
	set desc = "Toggle hearing a sound when somebody speaks using say."
	*/
	set name = "Голоса при речи"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков голоса при речи."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/say_sounds
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will now [(is_preference_enabled(/datum/client_preference/say_sounds)) ? "hear" : "not hear"] say sounds.")
	*/
	to_chat(src, "Вы [(is_preference_enabled(/datum/client_preference/say_sounds)) ? "теперь" : "больше не"] будете слышать звуки голоса при речи.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TSaySounds")

/client/verb/toggle_emote_sounds()
	/* Bastion of Endeavor Translation
	set name = "Sound-Toggle-Me"
	set category = "Preferences"
	set desc = "Toggle hearing a sound when somebody speaks using me ."
	*/
	set name = "Голоса при эмоутах"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков голоса при эмоутах."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/emote_sounds
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will now [(is_preference_enabled(/datum/client_preference/emote_sounds)) ? "hear" : "not hear"] me sounds.")
	*/
	to_chat(src, "Вы [(is_preference_enabled(/datum/client_preference/emote_sounds)) ? "теперь" : "больше не"] будете слышать звуки голоса при эмоутах.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TMeSounds")

/client/verb/toggle_whisper_sounds()
	/* Bastion of Endeavor Translation
	set name = "Sound-Toggle-Whisper"
	set category = "Preferences"
	set desc = "Toggle hearing a sound when somebody speaks using whisper."
	*/
	set name = "Голоса при шёпоте"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков голоса при шёпоте."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/whisper_sounds
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will now [(is_preference_enabled(/datum/client_preference/whisper_sounds)) ? "hear" : "not hear"] whisper sounds.")
	*/
	to_chat(src, "Вы [(is_preference_enabled(/datum/client_preference/whisper_sounds)) ? "теперь" : "больше не"] будете слышать звуки голоса при шёпоте.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TWhisperSounds")

/client/verb/toggle_subtle_sounds()
	/* Bastion of Endeavor Translation
	set name = "Sound-Toggle-Subtle"
	set category = "Preferences"
	set desc = "Toggle hearing a sound when somebody uses subtle."
	*/
	set name = "Голоса при скрытых эмоутах"
	set category = "Предпочтения"
	set desc = "Переключает воспроизведение звуков голоса при скрытых эмоутах."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/subtle_sounds
	toggle_preference(pref_path)
	SScharacter_setup.queue_preferences_save(prefs)

	/* Bastion of Endeavor Translation
	to_chat(src, "You will now [(is_preference_enabled(/datum/client_preference/subtle_sounds)) ? "hear" : "not hear"] subtle sounds.")
	*/
	to_chat(src, "Вы [(is_preference_enabled(/datum/client_preference/subtle_sounds)) ? "теперь" : "больше не"] будете слышать звуки голоса при скрытых эмоутах.")
	// End of Bastion of Endeavor Translation

	feedback_add_details("admin_verb","TSubtleSounds")

// Not attached to a pref datum because those are strict binary toggles
/client/verb/toggle_examine_mode()
	/* Bastion of Endeavor Translation
	set name = "Toggle Examine Mode"
	set category = "Preferences"
	set desc = "Toggle the additional behaviour of examining things."
	*/
	set name = "Режим осмотра"
	set category = "Предпочтения"
	set desc = "Переключить режим глагола Осмотреть."
	// End of Bastion of Endeavor Translation

	prefs.examine_text_mode++
	prefs.examine_text_mode %= EXAMINE_MODE_MAX // This cycles through them because if you're already specifically being routed to the examine panel, you probably don't need to have the extra text printed to chat
	switch(prefs.examine_text_mode)				// ... And I only wanted to add one verb
		/* Bastion of Endeavor Translation
		if(EXAMINE_MODE_DEFAULT)
			to_chat(src, "<span class='filter_system'>Examining things will only output the base examine text, and you will not be redirected to the examine panel automatically.</span>")

		if(EXAMINE_MODE_INCLUDE_USAGE)
			to_chat(src, "<span class='filter_system'>Examining things will also print any extra usage information normally included in the examine panel to the chat.</span>")

		if(EXAMINE_MODE_SWITCH_TO_PANEL)
			to_chat(src, "<span class='filter_system'>Examining things will direct you to the examine panel, where you can view extended information about the thing.</span>")
		*/
		if(EXAMINE_MODE_DEFAULT)
			to_chat(src, "<span class='filter_system'>Теперь при осмотре в чате будет отображаться только основное название и описание вместо панели Осмотра.</span>")

		if(EXAMINE_MODE_INCLUDE_USAGE)
			to_chat(src, "<span class='filter_system'>Теперь при осмотре в чате будет отображаться дополнительная информация с панели Осмотра.</span>")

		if(EXAMINE_MODE_SWITCH_TO_PANEL)
			to_chat(src, "<span class='filter_system'>Теперь при осмотре будет открываться панель Осмотра, предоставляющая дополнительную информацию.</span>")
		// End of Bastion of Endeavor Translation

/client/verb/toggle_multilingual_mode()
	/* Bastion of Endeavor Translation
	set name = "Toggle Multilingual Mode"
	set category = "Preferences"
	set desc = "Toggle the behaviour of multilingual speech parsing."
	*/
	set name = "Режим многоязычия"
	set category = "Предпочтения"
	set desc = "Переключает режим обработки речи на нескольких языках сразу."
	// End of Bastion of Endeavor Translation

	prefs.multilingual_mode++
	prefs.multilingual_mode %= MULTILINGUAL_MODE_MAX // Cycles through the various options
	switch(prefs.multilingual_mode)
		/* Bastion of Endeavor Translation
		if(MULTILINGUAL_DEFAULT)
			to_chat(src, "<span class='filter_system'>Multilingual parsing will only check for the delimiter-key combination (,0galcom-2tradeband).</span>")
		if(MULTILINGUAL_SPACE)
			to_chat(src, "<span class='filter_system'>Multilingual parsing will enforce a space after the delimiter-key combination (,0 galcom -2still galcom). The extra space will be consumed by the pattern-matching.</span>")
		if(MULTILINGUAL_DOUBLE_DELIMITER)
			to_chat(src, "<span class='filter_system'>Multilingual parsing will enforce the a language delimiter after the delimiter-key combination (,0,galcom -2 still galcom). The extra delimiter will be consumed by the pattern-matching.</span>")
		if(MULTILINGUAL_OFF)
			to_chat(src, "<span class='filter_system'>Multilingual parsing is now disabled. Entire messages will be in the language specified at the start of the message.</span>")
		*/
		if(MULTILINGUAL_DEFAULT)
			to_chat(src, "<span class='filter_system'>При обработке языков теперь требуется только комбинация разделителя-клавиши (,0Общегалактический-2Торговый диалект).</span>")
		if(MULTILINGUAL_SPACE)
			to_chat(src, "<span class='filter_system'>При обработке языков теперь требуется пробел после комбинации разделителя-клавиши (,0 Общегалактический -2Всё ещё общегалактический). Этот пробел будет удалён из самого сообщения.</span>")
		if(MULTILINGUAL_DOUBLE_DELIMITER)
			to_chat(src, "<span class='filter_system'>При обработке языков теперь требуется дополнительный разделитель после комбинации разделителя-клавиши (,0,Общегалактический -2 Всё ещё общегалактический). Этот разделитель будет удалён из самого сообщения.</span>")
		if(MULTILINGUAL_OFF)
			to_chat(src, "<span class='filter_system'>Многоязычие теперь отключено. Теперь все сообщения будут полностью на языке, указанном в самом начале сообщения.</span>")
		// End of Bastion of Endeavor Translation


//Toggles for Staff
//Developers

/client/proc/toggle_debug_logs()
	/* Bastion of Endeavor Translation
	set name = "Toggle Debug Logs"
	set category = "Preferences"
	set desc = "Toggles seeing debug logs."
	*/
	set name = "Лог дебаггинга"
	set category = "Предпочтения"
	set desc = "Переключает отображение в чате сообщений лога дебаггинга."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/debug/show_debug_logs

	if(check_rights(R_ADMIN|R_DEBUG))
		toggle_preference(pref_path)
		/* Bastion of Endeavor Translation
		to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] receive debug logs.")
		*/
		to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не будете"] видеть сообщения лога дебаггинга в чате.")
		// End of Bastion of Endeavor Translation
		SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TADebugLogs") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

//Mods
/client/proc/toggle_attack_logs()
	/* Bastion of Endeavor Translation
	set name = "Toggle Attack Logs"
	set category = "Preferences"
	set desc = "Toggles seeing attack logs."
	*/
	set name = "Лог атак"
	set category = "Предпочтения"
	set desc = "Переключает отображение в чате сообщений лога атак."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/mod/show_attack_logs

	if(check_rights(R_ADMIN|R_MOD))
		toggle_preference(pref_path)
		/* Bastion of Endeavor Translation
		to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] receive attack logs.")
		*/
		to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не будете"] видеть сообщения лога атак.")
		// End of Bastion of Endeavor Translation
		SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAAttackLogs") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

//General
/client/proc/toggle_admin_global_looc()
	/* Bastion of Endeavor Translation
	set name = "Toggle Admin Global LOOC Visibility"
	set category = "Preferences"
	set desc = "Toggles seeing LOOC messages outside your actual LOOC range."
	*/
	set name = "Глобальный LOOC"
	set category = "Предпочтения"
	set desc = "Переключает способность видеть сообщения LOOC с любой точки карты."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/holder/show_rlooc

	if(holder)
		toggle_preference(pref_path)
		/* Bastion of Endeavor Translation
		to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear global LOOC.")
		*/
		to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не будете"] видеть сообщения LOOC с любой точки карты.")
		// End of Bastion of Endeavor Translation
		SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TAGlobalLOOC") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/toggle_admin_deadchat()
	/* Bastion of Endeavor Translation
	set name = "Toggle Admin Living Deadchat"
	set category = "Preferences"
	set desc = "Toggles seeing deadchat while not observing."
	*/
	set name = "Отображение чата мёртвых в игре"
	set category = "Предпочтения"
	set desc = "Переключает способность видеть чат мёртвых вне режима призрака."
	// End of Bastion of Endeavor Translation

	var/pref_path = /datum/client_preference/holder/show_staff_dsay

	if(holder)
		toggle_preference(pref_path)
		/* Bastion of Endeavor Translation
		to_chat(src,"You will [ (is_preference_enabled(pref_path)) ? "now" : "no longer"] hear deadchat while not observing.")
		*/
		to_chat(src,"Вы [ (is_preference_enabled(pref_path)) ? "теперь" : "больше не"] будете видеть чат мёртвых вне режима призрака.")
		// End of Bastion of Endeavor Translation
		SScharacter_setup.queue_preferences_save(prefs)

	feedback_add_details("admin_verb","TADeadchat") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
