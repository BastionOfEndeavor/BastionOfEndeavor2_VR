/client/verb/ignore(key_to_ignore as text)
	/* Bastion of Endeavor Translation
	set name = "Ignore"
	set category = "OOC"
	set desc = "Makes OOC and Deadchat messages from a specific player not appear to you."
	*/
	set name = "Заблокировать"
	set category = "OOC"
	set desc = "Скрывать все сообщения в OOC-чате и чате мёртвых от определённого игрока."
	// End of Bastion of Endeavor Translation

	if(!key_to_ignore)
		return
	key_to_ignore = ckey(sanitize(key_to_ignore))
	if(prefs && prefs.ignored_players)
		if(key_to_ignore in prefs.ignored_players)
			/* Bastion of Endeavor Translation
			to_chat(usr, "<span class='warning'>[key_to_ignore] is already being ignored.</span>")
			*/
			to_chat(usr, "<span class='warning'>Вы уже заблокировали [key_to_ignore].</span>")
			// End of Bastion of Endeavor Translation
			return
		if(key_to_ignore == usr.ckey)
			/* Bastion of Endeavor Translation
			to_chat(usr, "<span class='notice'>You can't ignore yourself.</span>")
			*/
			to_chat(usr, "<span class='notice'>Вы не можете заблокировать себя.</span>")
			// End of Bastion of Endeavor Translation
			return

		prefs.ignored_players |= key_to_ignore
		SScharacter_setup.queue_preferences_save(prefs)
		/* Bastion of Endeavor Translation
		to_chat(usr, "<span class='notice'>Now ignoring <b>[key_to_ignore]</b>.</span>")
		*/
		to_chat(usr, "<span class='notice'>Сообщения <b>[key_to_ignore]</b> в OOC-чате и чате мёртвых теперь будут скрыты.</span>")
		// End of Bastion of Endeavor Translation

/client/verb/unignore(key_to_unignore as text)
	/* Bastion of Endeavor Translation
	set name = "Unignore"
	set category = "OOC"
	set desc = "Reverts your ignoring of a specific player."
	*/
	set name = "Разблокировать"
	set category = "OOC"
	set desc = "Перестать скрывать сообщения заблокированного Вами игрока."
	// End of Bastion of Endeavor Translation

	if(!key_to_unignore)
		return
	key_to_unignore = ckey(sanitize(key_to_unignore))
	if(prefs && prefs.ignored_players)
		if(!(key_to_unignore in prefs.ignored_players))
			/* Bastion of Endeavor Translation
			to_chat(usr, "<span class='warning'>[key_to_unignore] isn't being ignored.</span>")
			*/
			to_chat(usr, "<span class='warning'>[key_to_unignore] не заблокирован Вами.</span>")
			// End of Bastion of Endeavor Translation
			return
		prefs.ignored_players -= key_to_unignore
		SScharacter_setup.queue_preferences_save(prefs)
		/* Bastion of Endeavor Translation
		to_chat(usr, "<span class='notice'>Reverted ignore on <b>[key_to_unignore]</b>.</span>")
		*/
		to_chat(usr, "<span class='notice'>Сообщения <b>[key_to_unignore]</b> в OOC-чате и чате мёртвых теперь снова будут показываться.</span>")
		// End of Bastion of Endeavor Translation

/mob/proc/is_key_ignored(var/key_to_check)
	if(client)
		return client.is_key_ignored(key_to_check)
	return 0

/client/proc/is_key_ignored(var/key_to_check)
	key_to_check = ckey(key_to_check)
	if(key_to_check in prefs.ignored_players)
		if(GLOB.directory[key_to_check] in GLOB.admins) // This is here so this is only evaluated if someone is actually being blocked.
			return 0
		return 1
	return 0