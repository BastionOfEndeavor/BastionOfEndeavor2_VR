
/client/verb/ooc(msg as text)
	/* Bastion of Endeavor Translation
	set name = "OOC"
	set category = "OOC"
	*/
	set name = "Чат OOC"
	set category = "OOC"
	set desc = "Отправить сообщение в неролевой чат OOC, видимое всем игрокам."
	// End of Bastion of Endeavor Translation

	if(say_disabled)	//This is here to try to identify lag problems
		/* Bastion of Endeavor Translation
		to_chat(usr, "<span class='warning'>Speech is currently admin-disabled.</span>")
		*/
		to_chat(usr, "<span class='warning'>Речь на данный момент отключена администраторами.</span>")
		// End of Bastion of Endeavor Translation
		return

	if(!mob)	return
	if(IsGuestKey(key))
		/* Bastion of Endeavor Translation
		to_chat(src, "Guests may not use OOC.")
		*/
		to_chat(src, "Гостям запрещено использовать чат OOC.")
		// End of Bastion of Endeavor Translation
		return

	msg = sanitize(msg)
	if(!msg)	return

	if(!is_preference_enabled(/datum/client_preference/show_ooc))
		/* Bastion of Endeavor Translation
		to_chat(src, "<span class='warning'>You have OOC muted.</span>")
		*/
		to_chat(src, "<span class='warning'>У Вас на данный момент отключён чат OOC.</span>")
		// End of Bastion of Endeavor Translation
		return

	if(!holder)
		/* Bastion of Endeavor Translation
		if(!config.ooc_allowed)
			to_chat(src, "<span class='danger'>OOC is globally muted.</span>")
			return
		if(!config.dooc_allowed && (mob.stat == DEAD))
			to_chat(usr, "<span class='danger'>OOC for dead mobs has been turned off.</span>")
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, "<span class='danger'>You cannot use OOC (muted).</span>")
			return
		if(findtext(msg, "byond://") && !config.allow_byond_links)
			to_chat(src, "<B>Advertising other servers is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise in OOC: [msg]")
			return
		if(findtext(msg, "discord.gg") && !config.allow_discord_links)
			to_chat(src, "<B>Advertising discords is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise a discord server in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise a discord server in OOC: [msg]")
			return
		if((findtext(msg, "http://") || findtext(msg, "https://")) && !config.allow_url_links)
			to_chat(src, "<B>Posting external links is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to post a link in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to post a link in OOC: [msg]")
			return
		*/
		if(!config.ooc_allowed)
			to_chat(src, "<span class='danger'>Чат OOC отключён администраторами.</span>")
			return
		if(!config.dooc_allowed && (mob.stat == DEAD))
			to_chat(usr, "<span class='danger'>Чат OOC отключён для мёртвых мобов.</span>")
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, "<span class='danger'>Вам запрещено использовать чат OOC.</span>")
			return
		if(findtext_char(msg, "byond://") && !config.allow_byond_links)
			to_chat(src, "<B>Рекламировать другие сервера запрещено.</B>")
			log_admin("[key_name(src)] попытался прорекламировать в OOC: [msg]")
			message_admins("[key_name_admin(src)] попытался прорекламировать в OOC: [msg]")
			return
		if(findtext_char(msg, "discord.gg") && !config.allow_discord_links)
			to_chat(src, "<B>Рекламировать сервера Discord запрещено.</B>")
			log_admin("[key_name(src)] попытался прорекламировать в OOC: [msg]")
			message_admins("[key_name_admin(src)] попытался прорекламировать в OOC: [msg]")
			return
		if((findtext_char(msg, "http://") || findtext_char(msg, "https://")) && !config.allow_url_links)
			to_chat(src, "<B>Отправлять внешние ссылки запрещено.</B>")
			log_admin("[key_name(src)] попытался отправить ссылку в OOC: [msg]")
			message_admins("[key_name_admin(src)] попытался отправить ссылку в OOC: [msg]")
			return
		// End of Bastion of Endeavor Translation

	log_ooc(msg, src)

	if(msg)
		handle_spam_prevention(MUTE_OOC)

	var/ooc_style = "everyone"
	if(holder && !holder.fakekey)
		ooc_style = "elevated"
		//VOREStation Block Edit Start
		if(holder.rights & R_EVENT) //Retired Admins
			ooc_style = "event_manager"
		if(holder.rights & R_ADMIN && !(holder.rights & R_BAN)) //Game Masters
			ooc_style = "moderator"
		if(holder.rights & R_SERVER && !(holder.rights & R_BAN)) //Developers
			ooc_style = "developer"
		if(holder.rights & R_ADMIN && holder.rights & R_BAN) //Admins
			ooc_style = "admin"
		//VOREStation Block Edit End

	for(var/client/target in GLOB.clients)
		if(target.is_preference_enabled(/datum/client_preference/show_ooc))
			if(target.is_key_ignored(key)) // If we're ignored by this person, then do nothing.
				continue
			var/display_name = src.key
			if(holder)
				if(holder.fakekey)
					if(target.holder)
						display_name = "[holder.fakekey]/([src.key])"
					else
						display_name = holder.fakekey
			if(holder && !holder.fakekey && (holder.rights & R_ADMIN|R_FUN|R_EVENT) && config.allow_admin_ooccolor && (src.prefs.ooccolor != initial(src.prefs.ooccolor))) // keeping this for the badmins
				/* Bastion of Endeavor Translation
				to_chat(target, "<font color='[src.prefs.ooccolor]'><span class='ooc'>" + create_text_tag("ooc", "OOC:", target) + " <EM>[display_name]:</EM> <span class='message'>[msg]</span></span></font>")
				*/
				to_chat(target, "<font color='[src.prefs.ooccolor]'><span class='ooc'>" + create_text_tag("ooc", "Чат OOC:", target) + " <EM>[display_name]:</EM> <span class='message'>[msg]</span></span></font>")
				// End of Bastion of Endeavor Translation
			else
				/* Bastion of Endeavor Translation
				to_chat(target, "<span class='ooc'><span class='[ooc_style]'>" + create_text_tag("ooc", "OOC:", target) + " <EM>[display_name]:</EM> <span class='message'>[msg]</span></span></span>")
				*/
				to_chat(target, "<span class='ooc'><span class='[ooc_style]'>" + create_text_tag("ooc", "Чат OOC:", target) + " <EM>[display_name]:</EM> <span class='message'>[msg]</span></span></span>")
				// End of Bastion of Endeavor Translation

/client/verb/looc(msg as text)
	/* Bastion of Endeavor Translation
	set name = "LOOC"
	set desc = "Local OOC, seen only by those in view."
	set category = "OOC"
	*/
	set name = "Чат LOOC"
	set desc = "Отправить сообщение в неролевой чат OOC, видимое только для игроков на Вашем экране."
	set category = "OOC"
	// End of Bastion of Endeavor Translation

	if(say_disabled)	//This is here to try to identify lag problems
		/* Bastion of Endeavor Translation
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		*/
		to_chat(usr, "<span class='danger'>Речь на данный момент отключена администраторами.</span>")
		// End of Bastion of Endeavor Translation
		return

	if(!mob)
		return

	if(IsGuestKey(key))
		to_chat(src, "Guests may not use OOC.")
		return

	msg = sanitize(msg)
	if(!msg)
		return

	if(!is_preference_enabled(/datum/client_preference/show_looc))
		/* Bastion of Endeavor Translation: for some reason it uses a different span, dunno why
		to_chat(src, "<span class='danger'>You have LOOC muted.</span>")
		*/
		to_chat(src, "<span class='warning'>У Вас на данный момент отключён чат LOOC.</span>")
		// End of Bastion of Endeavor Translation
		return

	if(!holder)
		/* Bastion of Endeavor Translation
		if(!config.looc_allowed)
			to_chat(src, "<span class='danger'>LOOC is globally muted.</span>")
			return
		if(!config.dooc_allowed && (mob.stat == DEAD))
			to_chat(usr, "<span class='danger'>OOC for dead mobs has been turned off.</span>")
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, "<span class='danger'>You cannot use OOC (muted).</span>")
			return
		if(findtext(msg, "byond://") && !config.allow_byond_links)
			to_chat(src, "<B>Advertising other servers is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise in OOC: [msg]")
			return
		if(findtext(msg, "discord.gg") && !config.allow_discord_links)
			to_chat(src, "<B>Advertising discords is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to advertise a discord server in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to advertise a discord server in OOC: [msg]")
			return
		if((findtext(msg, "http://") || findtext(msg, "https://")) && !config.allow_url_links)
			to_chat(src, "<B>Posting external links is not allowed.</B>")
			log_admin("[key_name(src)] has attempted to post a link in OOC: [msg]")
			message_admins("[key_name_admin(src)] has attempted to post a link in OOC: [msg]")
			return
		*/
		if(!config.looc_allowed)
			to_chat(src, "<span class='danger'>Чат LOOC отключён администраторами.</span>")
			return
		if(!config.dooc_allowed && (mob.stat == DEAD))
			to_chat(usr, "<span class='danger'>Чат LOOC отключён для мёртвых мобов.</span>")
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, "<span class='danger'>Вам запрещено использовать чаты OOC.</span>")
			return
		if(findtext_char(msg, "byond://") && !config.allow_byond_links)
			to_chat(src, "<B>Рекламировать другие сервера запрещено.</B>")
			log_admin("[key_name(src)] попытался прорекламировать в OOC: [msg]")
			message_admins("[key_name_admin(src)] попытался прорекламировать в OOC: [msg]")
			return
		if(findtext_char(msg, "discord.gg") && !config.allow_discord_links)
			to_chat(src, "<B>Рекламировать сервера Discord запрещено.</B>")
			log_admin("[key_name(src)] попытался прорекламировать в OOC: [msg]")
			message_admins("[key_name_admin(src)] попытался прорекламировать в OOC: [msg]")
			return
		if((findtext_char(msg, "http://") || findtext_char(msg, "https://")) && !config.allow_url_links)
			to_chat(src, "<B>Отправлять внешние ссылки запрещено.</B>")
			log_admin("[key_name(src)] попытался отправить ссылку в OOC: [msg]")
			message_admins("[key_name_admin(src)] попытался отправить ссылку в OOC: [msg]")
			return
		// End of Bastion of Endeavor Translation

	log_looc(msg,src)

	if(msg)
		handle_spam_prevention(MUTE_OOC)

	var/mob/source = mob.get_looc_source()
	var/turf/T = get_turf(source)
	if(!T) return
	var/list/in_range = get_mobs_and_objs_in_view_fast(T,world.view,0)
	var/list/m_viewers = in_range["mobs"]

	var/list/receivers = list() //Clients, not mobs.
	var/list/r_receivers = list()

	var/display_name = key
	if(holder && holder.fakekey)
		display_name = holder.fakekey
	if(mob.stat != DEAD)
		display_name = mob.name
	//VOREStation Add - Resleeving shenanigan prevention
	if(ishuman(mob))
		var/mob/living/carbon/human/H = mob
		if(H.original_player && H.original_player != H.ckey) //In a body not their own
			/* Bastion of Endeavor Translation: unsure about this
			display_name = "[H.mind.name] (as [H.name])"
			*/
			display_name = "[H.mind.name] (будучи [icase_ru(H)])"
			// End of Bastion of Endeavor Translation
	//VOREStation Add End

	// Everyone in normal viewing range of the LOOC
	for(var/mob/viewer in m_viewers)
		if(viewer.client && viewer.client.is_preference_enabled(/datum/client_preference/show_looc))
			receivers |= viewer.client
		else if(istype(viewer,/mob/observer/eye)) // For AI eyes and the like
			var/mob/observer/eye/E = viewer
			if(E.owner && E.owner.client)
				receivers |= E.owner.client

	// Admins with RLOOC displayed who weren't already in
	for(var/client/admin in GLOB.admins)
		if(!(admin in receivers) && admin.is_preference_enabled(/datum/client_preference/holder/show_rlooc))
			r_receivers |= admin

	// Send a message
	for(var/client/target in receivers)
		var/admin_stuff = ""

		if(target in GLOB.admins)
			admin_stuff += "/([key])"

		/* Bastion of Endeavor Translation
		to_chat(target, "<span class='ooc looc'>" + create_text_tag("looc", "LOOC:", target) + " <EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span>")
		*/
		to_chat(target, "<span class='ooc looc'>" + create_text_tag("looc", "Чат LOOC:", target) + " <EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span>")
		// End of Bastion of Endeavor Translation

	for(var/client/target in r_receivers)
		var/admin_stuff = "/([key])([admin_jump_link(mob, target.holder)])"

		/* Bastion of Endeavor Translation
		to_chat(target, "<span class='ooc looc'>" + create_text_tag("looc", "LOOC:", target) + " <span class='prefix'>(R)</span><EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span>")
		*/
		to_chat(target, "<span class='ooc looc'>" + create_text_tag("looc", "Чат LOOC:", target) + " <span class='prefix'>(R)</span><EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span>")
		// End of Bastion of Endeavor Translation

/mob/proc/get_looc_source()
	return src

/mob/living/silicon/ai/get_looc_source()
	if(eyeobj)
		return eyeobj
	return src
