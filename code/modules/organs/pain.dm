/mob/proc/flash_pain()
	flick("pain",pain)

/mob/var/list/pain_stored = list()
/mob/var/last_pain_message = ""
/mob/var/next_pain_time = 0

// message is the custom message to be displayed
// power decides how much painkillers will stop the message
// force means it ignores anti-spam timer
/mob/living/carbon/proc/custom_pain(message, power, force)
	if((!message || stat || !can_feel_pain() || chem_effects[CE_PAINKILLER] > power) && !synth_cosmetic_pain)
		return 0
	message = "<span class='danger'>[message]</span>"
	if(power >= 50)
		message = "<font size=3>[message]</font>"

	// Anti message spam checks
	if(force || (message != last_pain_message) || (world.time >= next_pain_time))
		last_pain_message = message
		to_chat(src,message)
	next_pain_time = world.time + (100-power)

/mob/living/carbon/human/proc/handle_pain()
	if(stat)
		return

	if(!can_feel_pain() && !synth_cosmetic_pain)
		return

	if(world.time < next_pain_time)
		return
	var/maxdam = 0
	var/obj/item/organ/external/damaged_organ = null
	for(var/obj/item/organ/external/E in organs)
		if(!E.organ_can_feel_pain() && !synth_cosmetic_pain) continue
		var/dam = E.get_damage()
		// make the choice of the organ depend on damage,
		// but also sometimes use one of the less damaged ones
		if(dam > maxdam && (maxdam == 0 || prob(70)) )
			damaged_organ = E
			maxdam = dam
			if(istype(src, /mob/living/carbon/human)) //VOREStation Edit Start
				var/mob/living/carbon/human/H = src
				maxdam *= H.species.trauma_mod //VOREStation edit end
	if(damaged_organ && chem_effects[CE_PAINKILLER] < maxdam)
		if(maxdam > 10 && paralysis)
			AdjustParalysis(-round(maxdam/10))
		if(maxdam > 50 && prob(maxdam / 5))
			drop_item()
		var/burning = damaged_organ.burn_dam > damaged_organ.brute_dam
		var/msg
		switch(maxdam)
			if(1 to 10)
				/* Bastion of Endeavor Translation
				msg =  "Your [damaged_organ.name] [burning ? "burns" : "hurts"]."
				*/
				msg =  "Вы чувствуете [burning ? "жжение" : "боль"] [prep_ru(damaged_organ, "в")] [concat_ru("сво;ём;ей;ём;их;", damaged_organ)]."
				// End of Bastion of Endeavor Translation
			if(11 to 90)
				flash_weak_pain()
				/* Bastion of Endeavor Translation
				msg = "<font size=2>Your [damaged_organ.name] [burning ? "burns" : "hurts"] badly!</font>"
				*/
				msg = "<font size=2>Вы чувствуете [burning ? "ужасное жжение" : "ужасную боль"] [prep_ru(damaged_organ, "в")] [concat_ru("сво;ём;ей;ём;их;", damaged_organ)]!</font>"
				// End of Bastion of Endeavor Translation
			if(91 to 10000)
				flash_pain()
				/* Bastion of Endeavor Translation
				msg = "<font size=3>OH GOD! Your [damaged_organ.name] is [burning ? "on fire" : "hurting terribly"]!</font>"
				*/
				msg = "<font size=3>О БОЖЕ! [concat_ru("Ваш;;а;е;и;", damaged_organ)] [burning ? "[verb_ru(damaged_organ, "гор;ит;ит;ит;ят;")]" : "[verb_ru(damaged_organ, "невыносимо бол;ит;ит;ит;ят;")]"]!</font>"
				// End of Bastion of Endeavor Translation
		custom_pain(msg, maxdam, prob(10))

	// Damage to internal organs hurts a lot.
	for(var/obj/item/organ/I in internal_organs)
		if((I.status & ORGAN_DEAD) || I.robotic >= ORGAN_ROBOT) continue
		if(I.damage > 2) if(prob(2))
			var/obj/item/organ/external/parent = get_organ(I.parent_organ)
			/* Bastion of Endeavor Translation
			src.custom_pain("You feel a sharp pain in your [parent.name]", 50)
			*/
			src.custom_pain("Вы чувствуете острую боль [prep_ru(damaged_organ, "в")] [concat_ru("сво;ём;ей;ём;их;", parent)]", 50)
			// End of Bastion of Endeavor Translation

	if(prob(2))
		switch(getToxLoss())
			if(1 to 10)
				/* Bastion of Endeavor Translation
				custom_pain("Your body stings slightly.", getToxLoss())
				*/
				custom_pain("Ваше тело слегка покалывает.", getToxLoss())
				// End of Bastion of Endeavor Translation
			if(11 to 30)
				/* Bastion of Endeavor Translation
				custom_pain("Your body hurts a little.", getToxLoss())
				*/
				custom_pain("Ваше тело слегка побаливает.", getToxLoss())
				// End of Bastion of Endeavor Translation
			if(31 to 60)
				/* Bastion of Endeavor Translation
				custom_pain("Your whole body hurts badly.", getToxLoss())
				*/
				custom_pain("Всё Ваше тело ужасно болит.", getToxLoss())
				// End of Bastion of Endeavor Translation
			if(61 to INFINITY)
				/* Bastion of Endeavor Translation
				custom_pain("Your body aches all over, it's driving you mad.", getToxLoss())
				*/
				custom_pain("Всё Ваше тело стонет, Вы сходите с ума от боли.", getToxLoss())
				// End of Bastion of Endeavor Translation