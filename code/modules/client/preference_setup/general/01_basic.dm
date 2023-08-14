/datum/preferences
	var/biological_gender = MALE
	var/identifying_gender = MALE

/datum/preferences/proc/set_biological_gender(var/gender)
	biological_gender = gender
	identifying_gender = gender

/datum/category_item/player_setup_item/general/basic
	name = "Basic"
	sort_order = 1

/datum/category_item/player_setup_item/general/basic/load_character(var/savefile/S)
	S["real_name"]				>> pref.real_name
	S["nickname"]				>> pref.nickname
	S["name_is_always_random"]	>> pref.be_random_name
	S["gender"]					>> pref.biological_gender
	S["id_gender"]				>> pref.identifying_gender
	S["age"]					>> pref.age
	S["spawnpoint"]				>> pref.spawnpoint
	S["OOC_Notes"]				>> pref.metadata
	// Bastion of Endeavor Addition: Cases for names
	S["cases_ncase"]	    	>> pref.cases[NCASE]
	S["cases_gcase"]			>> pref.cases[GCASE]
	S["cases_dcase"]			>> pref.cases[DCASE]
	S["cases_acase"]			>> pref.cases[ACASE]
	S["cases_icase"]			>> pref.cases[ICASE]
	S["cases_pcase"]			>> pref.cases[PCASE]
	// End of Bastion of Endeavor Addition

/datum/category_item/player_setup_item/general/basic/save_character(var/savefile/S)
	S["real_name"]				<< pref.real_name
	S["nickname"]				<< pref.nickname
	S["name_is_always_random"]	<< pref.be_random_name
	S["gender"]					<< pref.biological_gender
	S["id_gender"]				<< pref.identifying_gender
	S["age"]					<< pref.age
	S["spawnpoint"]				<< pref.spawnpoint
	S["OOC_Notes"]				<< pref.metadata
	// Bastion of Endeavor Addition: Cases for names
	S["cases_ncase"]			<< pref.cases[NCASE]
	S["cases_gcase"]			<< pref.cases[GCASE]
	S["cases_dcase"]			<< pref.cases[DCASE]
	S["cases_acase"]			<< pref.cases[ACASE]
	S["cases_icase"]			<< pref.cases[ICASE]
	S["cases_pcase"]			<< pref.cases[PCASE]
	// End of Bastion of Endeavor Addition

/datum/category_item/player_setup_item/general/basic/sanitize_character()
	pref.age                = sanitize_integer(pref.age, get_min_age(), get_max_age(), initial(pref.age))
	pref.biological_gender  = sanitize_inlist(pref.biological_gender, get_genders(), pick(get_genders()))
	pref.identifying_gender = (pref.identifying_gender in all_genders_define_list) ? pref.identifying_gender : pref.biological_gender
	pref.real_name		= sanitize_name(pref.real_name, pref.species, is_FBP())
	if(!pref.real_name)
		pref.real_name      = random_name(pref.identifying_gender, pref.species)
	pref.nickname		= sanitize_name(pref.nickname)
	pref.spawnpoint         = sanitize_inlist(pref.spawnpoint, spawntypes, initial(pref.spawnpoint))
	pref.be_random_name     = sanitize_integer(pref.be_random_name, 0, 1, initial(pref.be_random_name))
	// Bastion of Endeavor Addition: Cases for names
	if(!pref.cases[NCASE]) pref.cases[NCASE] = pref.real_name
	if(!pref.cases[GCASE]) pref.cases[GCASE] = pref.real_name
	if(!pref.cases[DCASE]) pref.cases[DCASE] = pref.real_name
	if(!pref.cases[ACASE]) pref.cases[ACASE] = pref.real_name
	if(!pref.cases[ICASE]) pref.cases[ICASE] = pref.real_name
	if(!pref.cases[PCASE]) pref.cases[PCASE] = pref.real_name
	// End of Bastion of Endeavor Addition

// Moved from /datum/preferences/proc/copy_to()
/datum/category_item/player_setup_item/general/basic/copy_to_mob(var/mob/living/carbon/human/character)
	if(config.humans_need_surnames)
		var/firstspace = findtext(pref.real_name, " ")
		var/name_length = length(pref.real_name)
		if(!firstspace)	//we need a surname
			pref.real_name += " [pick(last_names)]"
		else if(firstspace == name_length)
			pref.real_name += "[pick(last_names)]"

	character.real_name = pref.real_name
	character.name = character.real_name
	if(character.dna)
		character.dna.real_name = character.real_name

	character.nickname = pref.nickname

	character.gender = pref.biological_gender
	character.identifying_gender = pref.identifying_gender
	character.age = pref.age
	// Bastion of Endeavor Addition: Bastion of Endeavor TODO: This will need some work after we get a proper case editor
	character.cases_ru["basic"] = list(RUGENDER = character.gender, NCASE = pref.cases[NCASE], GCASE = pref.cases[GCASE], DCASE = pref.cases[DCASE], ACASE = pref.cases[ACASE], ICASE = pref.cases[ICASE], PCASE = pref.cases[PCASE])
	character.cases_ru["real_name"] = list(RUGENDER = character.gender, NCASE = pref.cases[NCASE], GCASE = pref.cases[GCASE], DCASE = pref.cases[DCASE], ACASE = pref.cases[ACASE], ICASE = pref.cases[ICASE], PCASE = pref.cases[PCASE])
	// End of Bastion of Endeavor Addition

/datum/category_item/player_setup_item/general/basic/content()
	. = list()
	/* Bastion of Endeavor Translation: Added the cases setup
	. += "<b>Name:</b> "
	. += "<a href='?src=\ref[src];rename=1'><b>[pref.real_name]</b></a><br>"
	. += "<a href='?src=\ref[src];random_name=1'>Randomize Name</A><br>"
	. += "<a href='?src=\ref[src];always_random_name=1'>Always Random Name: [pref.be_random_name ? "Yes" : "No"]</a><br>"
	. += "<b>Nickname:</b> "
	. += "<a href='?src=\ref[src];nickname=1'><b>[pref.nickname]</b></a>"
	. += "<br>"
	. += "<b>Biological Sex:</b> <a href='?src=\ref[src];bio_gender=1'><b>[gender2text(pref.biological_gender)]</b></a><br>"
	. += "<b>Pronouns:</b> <a href='?src=\ref[src];id_gender=1'><b>[gender2text(pref.identifying_gender)]</b></a><br>"
	. += "<b>Age:</b> <a href='?src=\ref[src];age=1'>[pref.age]</a><br>"
	. += "<b>Spawn Point</b>: <a href='?src=\ref[src];spawnpoint=1'>[pref.spawnpoint]</a><br>"
	if(config.allow_Metadata)
		. += "<b>OOC Notes:</b> <a href='?src=\ref[src];metadata=1'> Edit </a><br>"
	*/
	. += "<b>Имя:</b> "
	. += "<a href='?src=\ref[src];rename=1'><b>[pref.real_name]</b></a><br>"
	. += "<a href='?src=\ref[src];random_name=1'>Сгенерировать имя</A><br>"
	. += "<a href='?src=\ref[src];cases_window=open'>Установить склонение имени</a><br/>"
	. += "<a href='?src=\ref[src];always_random_name=1'>Каждый раз случайное: [pref.be_random_name ? "Да" : "Нет"]</a><br>"
	. += "<b>Прозвище:</b> "
	. += "<a href='?src=\ref[src];nickname=1'><b>[pref.nickname]</b></a>"
	. += "<br>"
	. += "<b>Биологический пол:</b> <a href='?src=\ref[src];bio_gender=1'><b>[get_key_by_value(all_genders_define_list_ru, pref.biological_gender)]</b></a><br>"
	. += "<b>Пол местоимений:</b> <a href='?src=\ref[src];id_gender=1'><b>[get_key_by_value(all_genders_define_list_ru, pref.identifying_gender)]</b></a><br>"
	. += "<b>Возраст:</b> <a href='?src=\ref[src];age=1'>[pref.age]</a><br>"
	. += "<b>Точка прибытия</b>: <a href='?src=\ref[src];spawnpoint=1'>[pref.spawnpoint]</a><br>"
	if(config.allow_Metadata)
		. += "<b>Заметки OOC:</b> <a href='?src=\ref[src];metadata=1'>Редактировать</a><br>"
	// End of Bastion of Endeavor Translation
	. = jointext(.,null)

/datum/category_item/player_setup_item/general/basic/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["rename"])
		/* Bastion of Endeavor Translation
		var/raw_name = tgui_input_text(user, "Choose your character's name:", "Character Name")
		*/
		var/raw_name = tgui_input_text(user, "Введите имя Вашего персонажа:", "Имя персонажа")
		// End of Bastion of Endeavor Translation
		if (!isnull(raw_name) && CanUseTopic(user))
			var/new_name = sanitize_name(raw_name, pref.species, is_FBP())
			if(new_name)
				pref.real_name = new_name
				// Bastion of Endeavor Addition: Sort of an ugly temporary measure until we get a proper case editor
				pref.cases[NCASE] = pref.real_name
				pref.cases[GCASE] = pref.real_name
				pref.cases[DCASE] = pref.real_name
				pref.cases[ACASE] = pref.real_name
				pref.cases[ICASE] = pref.real_name
				pref.cases[PCASE] = pref.real_name
				// End of Bastion of Endeavor Addition
				return TOPIC_REFRESH
			else
				/* Bastion of Endeavor Translation
				to_chat(user, "<span class='warning'>Invalid name. Your name should be at least 2 and at most [MAX_NAME_LEN] characters long. It may only contain the characters A-Z, a-z, -, ' and .</span>")
				*/
				to_chat(user, "<span class='warning'>Недопустимое имя. В имени должно быть от 2 до [count_ru(MAX_NAME_LEN, "символ;а;ов;ов")]. Оно может содержать только буквы от А-Я, а-я, -, ', и .</span>")
				// End of Bastion of Endeavor Translation
				return TOPIC_NOACTION

	else if(href_list["random_name"])
		pref.real_name = random_name(pref.identifying_gender, pref.species)
		// Bastion of Endeavor Addition: Sort of an ugly temporary measure until we get a proper case editor
		pref.cases[NCASE] = pref.real_name
		pref.cases[GCASE] = pref.real_name
		pref.cases[DCASE] = pref.real_name
		pref.cases[ACASE] = pref.real_name
		pref.cases[ICASE] = pref.real_name
		pref.cases[PCASE] = pref.real_name
		// End of Bastion of Endeavor Addition
		return TOPIC_REFRESH

	// Bastion of Endeavor Addition: Cases for names
	else if(href_list["cases_window"])
		set_pref_cases_ru(user)
		return TOPIC_HANDLED

	else if (href_list["cases"])
		var/msg = sanitize(tgui_input_text(usr,"Установите склонение имени в этом падеже.","Склонение имени",html_decode(pref.cases[href_list["cases"]]), MAX_NAME_LEN))
		if(CanUseTopic(user))
			pref.cases[href_list["cases"]] = msg
		set_pref_cases_ru(user)
		return TOPIC_HANDLED
	// End of Bastion of Endeavor Addition

	else if(href_list["always_random_name"])
		pref.be_random_name = !pref.be_random_name
		return TOPIC_REFRESH

	else if(href_list["nickname"])
		/* Bastion of Endeavor Translation
		var/raw_nickname = tgui_input_text(user, "Choose your character's nickname:", "Character Nickname", pref.nickname)
		*/
		var/raw_nickname = tgui_input_text(user, "Укажите прозвище Вашего персонажа:", "Прозвище персонажа", pref.nickname)
		// End of Bastion of Endeavor Translation
		if (!isnull(raw_nickname) && CanUseTopic(user))
			var/new_nickname = sanitize_name(raw_nickname, pref.species, is_FBP())
			if(new_nickname)
				pref.nickname = new_nickname
				return TOPIC_REFRESH
			else
				/* Bastion of Endeavor Translation
				to_chat(user, "<span class='warning'>Invalid name. Your name should be at least 2 and at most [MAX_NAME_LEN] characters long. It may only contain the characters A-Z, a-z, -, ' and .</span>")
				*/
				to_chat(user, "<span class='warning'>Недопустимое имя. В имени должно быть от 2 до [MAX_NAME_LEN] символов. Оно может содержать только буквы от А-Я, а-я, -, ', и .</span>")
				// End of Bastion of Endeavor Translation
				return TOPIC_NOACTION

	else if(href_list["bio_gender"])
		/* Bastion of Endeavor Translation
		var/new_gender = tgui_input_list(user, "Choose your character's biological sex:", "Character Preference", get_genders(), pref.biological_gender)
		if(new_gender && CanUseTopic(user))
			pref.set_biological_gender(new_gender)
		*/
		var/new_gender = tgui_input_list(user, "Укажите биологический пол Вашего персонажа:", "Биологический пол", get_genders_ru(get_genders()), get_key_by_value(all_genders_define_list_ru, pref.biological_gender))
		if(new_gender && CanUseTopic(user))
			pref.set_biological_gender(all_genders_define_list_ru[new_gender])
		// End of Bastion of Endeavor Translation
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["id_gender"])
		/* Bastion of Endeavor Translation
		var/new_gender = tgui_input_list(user, "Choose your character's pronouns:", "Character Preference", all_genders_define_list, pref.identifying_gender)
		if(new_gender && CanUseTopic(user))
			pref.identifying_gender = new_gender
		*/
		var/new_gender = tgui_input_list(user, "Укажите предпочитаемые местоимения Вашего персонажа:", "Местоимения персонажа", all_genders_define_list_ru, get_key_by_value(all_genders_define_list_ru, pref.identifying_gender))
		if(new_gender && CanUseTopic(user))
			pref.identifying_gender = all_genders_define_list_ru[new_gender]
		// End of Bastion of Endeavor Translation
		return TOPIC_REFRESH

	else if(href_list["age"])
		var/min_age = get_min_age()
		var/max_age = get_max_age()
		/* Bastion of Endeavor Translation
		var/new_age = tgui_input_number(user, "Choose your character's age:\n([min_age]-[max_age])", "Character Preference", pref.age, max_age, min_age)
		*/
		var/new_age = tgui_input_number(user, "Укажите возраст персонажа: ([min_age]-[max_age])", "Возраст персонажа", pref.age, max_age, min_age)
		// End of Bastion of Endeavor Translation
		if(new_age && CanUseTopic(user))
			pref.age = max(min(round(text2num(new_age)), max_age), min_age)
			return TOPIC_REFRESH

	else if(href_list["spawnpoint"])
		var/list/spawnkeys = list()
		for(var/spawntype in spawntypes)
			spawnkeys += spawntype
		/* Bastion of Endeavor Translation
		var/choice = tgui_input_list(user, "Where would you like to spawn when late-joining?", "Late-Join Choice", spawnkeys)
		*/
		var/choice = tgui_input_list(user, "В какой точке Вы хотели бы появиться?", "Точка появления", spawnkeys)
		// End of Bastion of Endeavor Translation
		if(!choice || !spawntypes[choice] || !CanUseTopic(user))	return TOPIC_NOACTION
		pref.spawnpoint = choice
		return TOPIC_REFRESH

	else if(href_list["metadata"])
		/* Bastion of Endeavor Translation
		var/new_metadata = strip_html_simple(tgui_input_text(user, "Enter any information you'd like others to see, such as Roleplay-preferences:", "Game Preference" , html_decode(pref.metadata), multiline = TRUE, prevent_enter = TRUE)) //VOREStation Edit
		*/
		var/new_metadata = strip_html_simple(tgui_input_text(user, "Напишите здесь любую внеигровую информацию, которую хотите сообщить остальным, такую как Ваши предпочтения в отыгрыше сцен, ERP, Vore и пр.:", "Заметки OOC" , html_decode(pref.metadata), multiline = TRUE, prevent_enter = TRUE)) //VOREStation Edit
		// End of Bastion of Endeavor Translation
		if(new_metadata && CanUseTopic(user))
			pref.metadata = new_metadata
			return TOPIC_REFRESH

	return ..()

/datum/category_item/player_setup_item/general/basic/proc/get_genders()
	var/datum/species/S
	if(pref.species)
		S = GLOB.all_species[pref.species]
	else
		S = GLOB.all_species[SPECIES_HUMAN]
	var/list/possible_genders = S.genders
	if(!pref.organ_data || pref.organ_data[BP_TORSO] != "cyborg")
		return possible_genders
	possible_genders = possible_genders.Copy()
	possible_genders |= NEUTER
	return possible_genders

// Bastion of Endeavor Addition: Cases for names
/datum/category_item/player_setup_item/general/basic/proc/set_pref_cases_ru(mob/user)
	var/HTML = "<body>"
	HTML += "<tt><meta charset=\"utf-8\"><center>"
	HTML += "<b>Установите склонение имени персонажа</b> <hr />"
	HTML += "<br></center>"
	HTML += "<a href='?src=\ref[src];cases=ncase'>Именительный:</a> "
	HTML += TextPreview(pref.cases[NCASE])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];cases=gcase'>Родительный:</a> "
	HTML += TextPreview(pref.cases[GCASE])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];cases=dcase'>Дательный:</a> "
	HTML += TextPreview(pref.cases[DCASE])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];cases=acase'>Винительный:</a> "
	HTML += TextPreview(pref.cases[ACASE])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];cases=icase'>Творительный:</a> "
	HTML += TextPreview(pref.cases[ICASE])
	HTML += "<br>"
	HTML += "<a href='?src=\ref[src];cases=pcase'>Предложный:</a> "
	HTML += TextPreview(pref.cases[PCASE])
	HTML += "<br>"
	HTML += "<hr />"
	HTML += "<tt>"
	user << browse(HTML, "window=cases;size=430x300")
	return
// End of Bastion of Endeavor Addition