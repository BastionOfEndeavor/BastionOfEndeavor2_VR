/datum/category_item/player_setup_item/general/background
	name = "Background"
	sort_order = 5

/datum/category_item/player_setup_item/general/background/load_character(var/savefile/S)
	S["med_record"]				>> pref.med_record
	S["sec_record"]				>> pref.sec_record
	S["gen_record"]				>> pref.gen_record
	S["home_system"]			>> pref.home_system
	S["birthplace"]				>> pref.birthplace
	S["citizenship"]			>> pref.citizenship
	S["faction"]				>> pref.faction
	S["religion"]				>> pref.religion
	S["economic_status"]		>> pref.economic_status

/datum/category_item/player_setup_item/general/background/save_character(var/savefile/S)
	S["med_record"]				<< pref.med_record
	S["sec_record"]				<< pref.sec_record
	S["gen_record"]				<< pref.gen_record
	S["home_system"]			<< pref.home_system
	S["birthplace"]				<< pref.birthplace
	S["citizenship"]			<< pref.citizenship
	S["faction"]				<< pref.faction
	S["religion"]				<< pref.religion
	S["economic_status"]		<< pref.economic_status

/datum/category_item/player_setup_item/general/background/sanitize_character()
	/* Bastion of Endeavor Translation
	if(!pref.home_system) pref.home_system = "Unset"
	if(!pref.birthplace)  pref.birthplace =  "Unset"
	if(!pref.citizenship) pref.citizenship = "None"
	if(!pref.faction)     pref.faction =     "None"
	if(!pref.religion)    pref.religion =    "None"
	*/
	if(!pref.home_system) pref.home_system = "Не указано"
	if(!pref.birthplace)  pref.birthplace =  "Не указано"
	if(!pref.citizenship) pref.citizenship = "Нет"
	if(!pref.faction)     pref.faction =     "Нет"
	if(!pref.religion)    pref.religion =    "Нет"
	// End of Bastion of Endeavor Translation

	pref.economic_status = sanitize_inlist(pref.economic_status, ECONOMIC_CLASS, initial(pref.economic_status))

// Moved from /datum/preferences/proc/copy_to()
/datum/category_item/player_setup_item/general/background/copy_to_mob(var/mob/living/carbon/human/character)
	character.med_record		= pref.med_record
	character.sec_record		= pref.sec_record
	character.gen_record		= pref.gen_record
	character.home_system		= pref.home_system
	character.birthplace		= pref.birthplace
	character.citizenship		= pref.citizenship
	character.personal_faction	= pref.faction
	character.religion			= pref.religion

/datum/category_item/player_setup_item/general/background/content(var/mob/user)
	/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: Job bans
	. += "<b>Background Information</b><br>"
	. += "Economic Status: <a href='?src=\ref[src];econ_status=1'>[pref.economic_status]</a><br/>"
	. += "Home: <a href='?src=\ref[src];home_system=1'>[pref.home_system]</a><br/>"
	. += "Birthplace: <a href='?src=\ref[src];birthplace=1'>[pref.birthplace]</a><br/>"
	. += "Citizenship: <a href='?src=\ref[src];citizenship=1'>[pref.citizenship]</a><br/>"
	. += "Faction: <a href='?src=\ref[src];faction=1'>[pref.faction]</a><br/>"
	. += "Religion: <a href='?src=\ref[src];religion=1'>[pref.religion]</a><br/>"

	. += "<br/><b>Records</b>:<br/>"
	if(jobban_isbanned(user, "Records"))
		. += "<span class='danger'>You are banned from using character records.</span><br>"
	else
		. += "Medical Records:<br>"
		. += "<a href='?src=\ref[src];set_medical_records=1'>[TextPreview(pref.med_record,40)]</a><br><br>"
		. += "Employment Records:<br>"
		. += "<a href='?src=\ref[src];set_general_records=1'>[TextPreview(pref.gen_record,40)]</a><br><br>"
		. += "Security Records:<br>"
		. += "<a href='?src=\ref[src];set_security_records=1'>[TextPreview(pref.sec_record,40)]</a><br>"
	*/
	. += "<b>Происхождение персонажа</b><br>"
	. += "Финансовое положение: <a href='?src=\ref[src];econ_status=1'>[pref.economic_status]</a><br/>"
	. += "Место жительства: <a href='?src=\ref[src];home_system=1'>[pref.home_system]</a><br/>"
	. += "Место рождения: <a href='?src=\ref[src];birthplace=1'>[pref.birthplace]</a><br/>"
	. += "Гражданство: <a href='?src=\ref[src];citizenship=1'>[pref.citizenship]</a><br/>"
	. += "Фракция: <a href='?src=\ref[src];faction=1'>[pref.faction]</a><br/>"
	. += "Вероисповедание: <a href='?src=\ref[src];religion=1'>[pref.religion]</a><br/>"

	. += "<br/><b>Записи</b>:<br/>"
	if(jobban_isbanned(user, "Records"))
		. += "<span class='danger'>Вам запрещено использовать записи персонажа.</span><br>"
	else
		. += "Медицинские записи:<br>"
		. += "<a href='?src=\ref[src];set_medical_records=1'>[TextPreview(pref.med_record,40)]</a><br><br>"
		. += "Записи о трудоустройстве:<br>"
		. += "<a href='?src=\ref[src];set_general_records=1'>[TextPreview(pref.gen_record,40)]</a><br><br>"
		. += "Записи службы безопасности:<br>"
		. += "<a href='?src=\ref[src];set_security_records=1'>[TextPreview(pref.sec_record,40)]</a><br>"
	// End of Bastion of Endeavor Translation

/datum/category_item/player_setup_item/general/background/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["econ_status"])
		/* Bastion of Endeavor Translation
		var/new_class = tgui_input_list(user, "Choose your economic status. This will affect the amount of money you will start with.", "Character Preference", ECONOMIC_CLASS, pref.economic_status)
		*/
		var/new_class = tgui_input_list(user, "Укажите финансовое положение персонажа. Это влияет на его начальное количество денег.", "Финансовое положение", ECONOMIC_CLASS, pref.economic_status)
		// End of Bastion of Endeavor Translation
		if(new_class && CanUseTopic(user))
			pref.economic_status = new_class
			return TOPIC_REFRESH

	else if(href_list["home_system"])
		/* Bastion of Endeavor Translation
		var/choice = tgui_input_list(user, "Please choose your home planet and/or system. This should be your current primary residence. Select \"Other\" to specify manually.", "Character Preference", home_system_choices + list("Unset","Other"), pref.home_system)
		*/
		var/choice = tgui_input_list(user, "Укажите планету и/или систему, где живёт Ваш персонаж на данный момент. Выберите \"Другое\", чтобы вписать вручную.", "Место жительства", home_system_choices + list("Не указано","Другое"), pref.home_system)
		// End of Bastion of Endeavor Translation
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		/* Bastion of Endeavor Translation
		if(choice == "Other")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Please enter a home system.", "Character Preference", null, MAX_NAME_LEN), MAX_NAME_LEN)
		*/
		if(choice == "Другое")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Укажите планету и/или систему, где живёт Ваш персонаж на данный момент.", "Место жительства", null, MAX_NAME_LEN), MAX_NAME_LEN)
		// End of Bastion of Endeavor Translation
			if(raw_choice && CanUseTopic(user))
				pref.home_system = raw_choice
		else
			pref.home_system = choice
		return TOPIC_REFRESH

	else if(href_list["birthplace"])
		/* Bastion of Endeavor Translation
		var/choice = tgui_input_list(user, "Please choose the planet and/or system or other appropriate location that you were born/created. Select \"Other\" to specify manually.", "Character Preference", home_system_choices + list("Unset","Other"), pref.birthplace)
		*/
		var/choice = tgui_input_list(user, "Укажите планету и/или систему, где был рождён или создан Ваш персонаж. Выберите \"Другое\", чтобы вписать вручную.", "Место рождения", home_system_choices + list("Не указано","Другое"), pref.birthplace)
		// End of Bastion of Endeavor Translation
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		/* Bastion of Endeavor Translation
		if(choice == "Other")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Please enter a birthplace.", "Character Preference", null, MAX_NAME_LEN), MAX_NAME_LEN)
		*/
		if(choice == "Другое")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Укажите планету и/или систему, где был рождён или создан Ваш персонаж.", "Место рождения", null, MAX_NAME_LEN), MAX_NAME_LEN)
		// End of Bastion of Endeavor Translation
			if(raw_choice && CanUseTopic(user))
				pref.birthplace = raw_choice
		else
			pref.birthplace = choice
		return TOPIC_REFRESH

	else if(href_list["citizenship"])
		/* Bastion of Endeavor Translation
		var/choice = tgui_input_list(user, "Please select the faction or political entity with which you currently hold citizenship. Select \"Other\" to specify manually.", "Character Preference", citizenship_choices + list("None","Other"), pref.citizenship)
		*/
		var/choice = tgui_input_list(user, "Укажите фракцию или политическое объединение, к которому принадлежит гражданство Вашего персонажа. Выберите \"Другое\", чтобы вписать вручную.", "Гражданство", citizenship_choices + list("Нет","Другое"), pref.citizenship)
		// End of Bastion of Endeavor Translation
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		/* Bastion of Endeavor Translation
		if(choice == "Other")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Please enter your current citizenship.", "Character Preference", null, MAX_NAME_LEN), MAX_NAME_LEN)
		*/
		if(choice == "Другое")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Укажите гражданство Вашего персонажа.", "Гражданство", null, MAX_NAME_LEN), MAX_NAME_LEN)
		// End of Bastion of Endeavor Translation
			if(raw_choice && CanUseTopic(user))
				pref.citizenship = raw_choice
		else
			pref.citizenship = choice
		return TOPIC_REFRESH

	else if(href_list["faction"])
		/* Bastion of Endeavor Translation
		var/choice = tgui_input_list(user, "Please choose the faction you primarily work for, if you are not under the direct employ of NanoTrasen. Select \"Other\" to specify manually.", "Character Preference", faction_choices + list("None","Other"), pref.faction)
		*/
		var/choice = tgui_input_list(user, "Укажите фракцию или компанию, на которую работает Ваш персонаж. Выберите \"Другое\", чтобы вписать вручную.", "Фракция", faction_choices + list("Нет","Другое"), pref.faction)
		// End of Bastion of Endeavor Translation
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		/* Bastion of Endeavor Translation
		if(choice == "Other")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Please enter a faction.", "Character Preference", null, MAX_NAME_LEN), MAX_NAME_LEN)
		*/
		if(choice == "Другое")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Укажите фракцию или компанию, на которую работает Ваш персонаж.", "Фракция", null, MAX_NAME_LEN), MAX_NAME_LEN)
		// End of Bastion of Endeavor Translation
			if(raw_choice)
				pref.faction = raw_choice
		else
			pref.faction = choice
		return TOPIC_REFRESH

	else if(href_list["religion"])
		/* Bastion of Endeavor Translation
		var/choice = tgui_input_list(user, "Please choose a religion. Select \"Other\" to specify manually.", "Character Preference", religion_choices + list("None","Other"), pref.religion)
		*/
		var/choice = tgui_input_list(user, "Укажите религию Вашего персонажа. Выберите \"Другое\", чтобы вписать вручную.", "Вероисповедание", religion_choices + list("Нет","Другое"), pref.religion)
		// End of Bastion of Endeavor Translation
		if(!choice || !CanUseTopic(user))
			return TOPIC_NOACTION
		/* Bastion of Endeavor Translation
		if(choice == "Other")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Please enter a religon.", "Character Preference", null, MAX_NAME_LEN), MAX_NAME_LEN)
		*/
		if(choice == "Другое")
			var/raw_choice = strip_html_simple(tgui_input_text(user, "Укажите религию Вашего персонажа.", "Вероисповедание", null, MAX_NAME_LEN), MAX_NAME_LEN)
		// End of Bastion of Endeavor Translation
			if(raw_choice)
				pref.religion = sanitize(raw_choice)
		else
			pref.religion = choice
		return TOPIC_REFRESH

	else if(href_list["set_medical_records"])
		/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: Job bans and such
		var/new_medical = strip_html_simple(tgui_input_text(user,"Enter medical information here.","Character Preference", html_decode(pref.med_record), MAX_RECORD_LENGTH, TRUE, prevent_enter = TRUE), MAX_RECORD_LENGTH)
		if(new_medical && !jobban_isbanned(user, "Records") && CanUseTopic(user))
		*/
		var/new_medical = strip_html_simple(tgui_input_text(user,"Введите медицинские записи о Вашем персонаже.","Медицинские записи", html_decode(pref.med_record), MAX_RECORD_LENGTH, TRUE, prevent_enter = TRUE), MAX_RECORD_LENGTH)
		if(new_medical && !jobban_isbanned(user, "Records") && CanUseTopic(user))
		// End of Bastion of Endeavor Translation
			pref.med_record = new_medical
		return TOPIC_REFRESH

	else if(href_list["set_general_records"])
		/* Bastion of Endeavor Translation
		var/new_general = strip_html_simple(tgui_input_text(user,"Enter employment information here.","Character Preference", html_decode(pref.gen_record), MAX_RECORD_LENGTH, TRUE, prevent_enter = TRUE), MAX_RECORD_LENGTH)
		if(new_general && !jobban_isbanned(user, "Records") && CanUseTopic(user))
		*/
		var/new_general = strip_html_simple(tgui_input_text(user,"Введите записи о трудоустройстве Вашего персонажа.","Записи о трудоустройстве", html_decode(pref.gen_record), MAX_RECORD_LENGTH, TRUE, prevent_enter = TRUE), MAX_RECORD_LENGTH)
		if(new_general && !jobban_isbanned(user, "Records") && CanUseTopic(user))
		// End of Bastion of Endeavor Translation
			pref.gen_record = new_general
		return TOPIC_REFRESH

	else if(href_list["set_security_records"])
		/* Bastion of Endeavor Translation
		var/sec_medical = strip_html_simple(tgui_input_text(user,"Enter security information here.","Character Preference", html_decode(pref.sec_record), MAX_RECORD_LENGTH, TRUE, prevent_enter = TRUE), MAX_RECORD_LENGTH)
		if(sec_medical && !jobban_isbanned(user, "Records") && CanUseTopic(user))
		*/
		var/sec_medical = strip_html_simple(tgui_input_text(user,"Введите записи службы безопасности о Вашем персонаже.","Записи службы безопасности", html_decode(pref.sec_record), MAX_RECORD_LENGTH, TRUE, prevent_enter = TRUE), MAX_RECORD_LENGTH)
		if(sec_medical && !jobban_isbanned(user, "Records") && CanUseTopic(user))
		// End of Bastion of Endeavor Translation
			pref.sec_record = sec_medical
		return TOPIC_REFRESH

	return ..()
