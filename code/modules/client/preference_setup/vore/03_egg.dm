// Define a place to save appearance in character setup
// VOREStation Add Start: Doing this here bc AUTOHISS_FULL is more readable than #
#define AUTOHISS_OFF 0
#define AUTOHISS_BASIC 1
#define AUTOHISS_FULL 2
// VOREStation Add End

/datum/preferences
	/* Bastion of Endeavor Translation
	var/vore_egg_type = "Egg" //The egg type they have.
	var/autohiss = "Full"			// VOREStation Add: Whether we have Autohiss on. I'm hijacking the egg panel bc this one has a shitton of unused space.
	*/
	var/vore_egg_type = "Яйцо"
	var/autohiss = "Полное"
	// End of Bastion of Endeavor Translation

// Definition of the stuff for the egg type.
/datum/category_item/player_setup_item/vore/egg
	name = "Egg appearance."
	sort_order = 3

/datum/category_item/player_setup_item/vore/egg/load_character(var/savefile/S)
	S["vore_egg_type"]		>> pref.vore_egg_type
	S["autohiss"]			>> pref.autohiss // VOREStation Add

/datum/category_item/player_setup_item/vore/egg/save_character(var/savefile/S)
	S["vore_egg_type"]		<< pref.vore_egg_type
	S["autohiss"]			<< pref.autohiss // VOREStation Add

/datum/category_item/player_setup_item/vore/egg/sanitize_character()
	pref.vore_egg_type	 = sanitize_inlist(pref.vore_egg_type, global_vore_egg_types, initial(pref.vore_egg_type))

/datum/category_item/player_setup_item/vore/egg/copy_to_mob(var/mob/living/carbon/human/character)
	character.vore_egg_type	= pref.vore_egg_type
	// VOREStation Add
	if(pref.client) // Safety, just in case so we don't runtime.
		if(!pref.autohiss)
			pref.client.autohiss_mode = AUTOHISS_FULL
		else
			switch(pref.autohiss)
				/* Bastion of Endeavor Translation
				if("Full")
					pref.client.autohiss_mode = AUTOHISS_FULL
				if("Basic")
					pref.client.autohiss_mode = AUTOHISS_BASIC
				if("Off")
					pref.client.autohiss_mode = AUTOHISS_OFF
				*/
				if("Полное")
					pref.client.autohiss_mode = AUTOHISS_FULL
				if("Простое")
					pref.client.autohiss_mode = AUTOHISS_BASIC
				if("Отключено")
					pref.client.autohiss_mode = AUTOHISS_OFF
				// End of Bastion of Endeavor Translation
	// VOREStation Add

/datum/category_item/player_setup_item/vore/egg/content(var/mob/user)
	/* Bastion of Endeavor Translation
	. += "<br>"
	. += " Egg Type: <a href='?src=\ref[src];vore_egg_type=1'>[pref.vore_egg_type]</a><br>"
	. += "<b>Autohiss Default Setting:</b> <a href='?src=\ref[src];autohiss=1'>[pref.autohiss]</a><br>" // VOREStation Add
	*/
	. += "Вид яйца: <a href='?src=\ref[src];vore_egg_type=1'>[pref.vore_egg_type]</a><br>"
	. += "Режим авто-шипения по умолчанию:<a href='?src=\ref[src];autohiss=1'>[pref.autohiss]</a><br>" // VOREStation Add
	// End of Bastion of Endeavor Translation

/datum/category_item/player_setup_item/vore/egg/OnTopic(var/href, var/list/href_list, var/mob/user)
	if(!CanUseTopic(user))
		return TOPIC_NOACTION

	else if(href_list["vore_egg_type"])
		var/list/vore_egg_types = global_vore_egg_types
		/* Bastion of Endeavor Translation
		var/selection = tgui_input_list(user, "Choose your character's egg type:", "Character Preference", vore_egg_types, pref.vore_egg_type)
		*/
		var/selection = tgui_input_list(user, "Выберите вид яйца, откладываемого Вашим персонажем (если применимо):", "Вид яйца", vore_egg_types, pref.vore_egg_type)
		// End of Bastion of Endeavor Translation
		if(selection)
			pref.vore_egg_type = selection
			return TOPIC_REFRESH
	// VOREStation Add Start
	else if(href_list["autohiss"])
		/* Bastion of Endeavor Translation
		var/list/autohiss_selection = list("Full", "Basic", "Off")
		var/selection = tgui_input_list(user, "Choose your default autohiss setting:", "Character Preference", autohiss_selection, pref.autohiss)
		*/
		var/list/autohiss_selection = list("Полное", "Простое", "Отключено")
		var/selection = tgui_input_list(user, "Выберите режим авто-шипения для Вашего персонажа:", "Авто-шипение", autohiss_selection, pref.autohiss)
		// End of Bastion of Endeavor Translation
		if(selection)
			pref.autohiss = selection
		else if(!selection)
			/* Bastion of Endeavor Translation
			pref.autohiss = "Full"
			*/
			pref.autohiss = "Полное"
			// End of Bastion of Endeavor Translation
		return TOPIC_REFRESH
	// VOREStation Add End
	else
		return

// VOREStation Add Start: Doing this here bc AUTOHISS_FULL is more readable than #
#undef AUTOHISS_OFF
#undef AUTOHISS_BASIC
#undef AUTOHISS_FULL
// VOREStation Add End
