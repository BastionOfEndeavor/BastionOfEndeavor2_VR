// Assistant Roles
/datum/job/intern
	title = "Стажёр"
	faction = "Станция"
	supervisors = "Вы подчиняетесь сотрудникам отдела, за которым закреплены."
	alt_titles = list("Помощник инженера" = /datum/alt_title/intern_eng,
					  "Врач-интерн" = /datum/alt_title/intern_med,
					  "Интерн-лаборант" = /datum/alt_title/intern_sci,
					  "Кадет службы безопасности" = /datum/alt_title/intern_sec,
					  "Младший грузчик" = /datum/alt_title/intern_crg,
					  "Младший исследователь" = /datum/alt_title/intern_exp,
					  "Официант" = /datum/alt_title/server,
					  "Ассистент" = /datum/alt_title/assistant)
	job_description = "Стажёр делает то, что от него попросят, чаще всего в процессе обучения определённой работе. \
						Хоть стажёр и является частью персонала, он не обладает никакой реальной властью на станции."

/datum/alt_title/intern_eng
	title = "Помощник инженера"
	title_blurb = "Помощник инженера обязан выполнять поручения инженерного отдела. Он пока не является полноценным инженером, \
					но набирает знания, чтобы им стать. Помощник инженера не обладает никакой реальной властью на станции."

/datum/alt_title/intern_med
	title = "Врач-интерн"
	title_blurb = "Врач-интерн обязан выполнять поручения медицинского отдела. Он пока не является полноценным врачом, \
					но набирает знания, чтобы им стать. Врач-интерн не обладает никакой реальной властью на станции."

/datum/alt_title/intern_sci
	title = "Интерн-лаборант"
	title_blurb = "Интерн-лаборант обязан выполнять поручения научного отдела. Он пока не является полноценным учёным, \
					но набирает знания, чтобы им стать. Лаборант не обладает никакой реальной властью на станции."

/datum/alt_title/intern_sec
	title = "Кадет службы безопасности"
	title_blurb = "Кадет службы безопасности обязан выполнять поручения службы безопасности. Он пока не является полноценным офицером, \
					но набирает знания, чтобы им стать. Кадет службы безопасности не обладает никакой реальной властью на станции."

/datum/alt_title/intern_crg
	title = "Младший грузчик"
	title_blurb = "Младший грузчик обязан выполнять поручения грузового отдела. Он пока не является полноценным грузчиком, \
					но набирает знания, чтобы им стать. Младший грузчик не обладает никакой реальной властью на станции."

/datum/alt_title/intern_exp
	title = "Младший исследователь"
	title_blurb = "Младший исследователь обязан выполнять поручения службы безопасности. Он пока не является полноценным исследователем, \
					но набирает знания, чтобы им стать. Младший исследователь не обладает никакой реальной властью на станции."

/datum/alt_title/server
	title = "Официант"
	title_blurb = "Официант выполняет поручения на кухне и в баре, а также занимается доставкой еды. Официант не обладает никакой реальной властью на станции."

/datum/alt_title/assistant
	title = "Ассистент"
	title_blurb = "Ассистент выполняет различные поручения. Он не обладает никакой реальной властью на станции, но может оказать помощь там, где она нужна."

/datum/job/assistant
	title = "Посетитель"
	supervisors = "Вы ни перед кем не отвечаете, так как даже тут не работаете!"
	job_description = "Посетитель - всего лишь гость на станции. У него нет никакой реальной власти, но при этом нету и каких-либо обязанностей."
	alt_titles = list("Гость" = /datum/alt_title/guest, "Путешественник" = /datum/alt_title/traveler)
/datum/alt_title/guest
	title = "Гость"
/datum/alt_title/traveler
	title = "Путешественник"
