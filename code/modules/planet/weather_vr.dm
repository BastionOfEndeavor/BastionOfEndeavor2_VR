/datum/weather_holder
	var/firework_override = FALSE

/datum/weather_holder/update_icon_effects()
	..()
	if(current_weather.icon)
		visuals.icon = current_weather.icon