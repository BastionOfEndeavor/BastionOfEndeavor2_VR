var/global/list/seen_citizenships = list()
var/global/list/seen_systems = list()
var/global/list/seen_factions = list()
var/global/list/seen_antag_factions = list()
var/global/list/seen_religions = list()

//Commenting this out for now until I work the lists it into the event generator/journalist/chaplain.
/proc/UpdateFactionList(mob/living/carbon/human/M)
	/*if(M && M.client && M.client.prefs)
		seen_citizenships |= M.client.prefs.citizenship
		seen_systems      |= M.client.prefs.home_system
		seen_factions     |= M.client.prefs.faction
		seen_religions    |= M.client.prefs.religion*/
	return

// VOREStation Edits Start
var/global/list/citizenship_choices = list(
	/* Bastion of Endeavor Translation
	"Greater Human Diaspora",
	"Commonwealth of Sol-Procyon",
	"Skrell Consensus",
	"Moghes Hegemony",
	"Tajaran Diaspora",
	"Unitary Alliance of Salthan Fyrds",
	"Elysian Colonies",
	"Third Ares Confederation",
	"Teshari Expeditionary Fleet",
	"Altevian Hegemony",
	"Kitsuhana Heavy Industries",
	"Kosaky Fleets"
	*/
	"Великая человеческая диаспора",
	"Содружество Сол-Процион",
	"Скрелльский консенсус",
	"Могская гегемония",
	"Таджарская диаспора",
	"Унитарный альянс сальтанских фирдов",
	"Колонии Элизия",
	"Конфедерация Арес",
	"Экспедиционный флот тешари",
	"Альтевийская гегемония",
	"Китсухана",
	"Косакийский флот"
	// End of Bastion of Endeavor Translation
	)

var/global/list/home_system_choices = list(
	/* Bastion of Endeavor Translation
	"Virgo-Erigone",
	"Sol",
	"Earth, Sol",
	"Luna, Sol",
	"Mars, Sol",
	"Venus, Sol",
	"Titan, Sol",
	"Toledo, New Ohio",
	"The Pact, Myria",
	"Kitsuhana Prime",
	"Kishar, Alpha Centauri",
	"Anshar, Alpha Centauri",
	"Heaven Complex, Alpha Centauri",
	"Procyon",
	"Altair",
	"Kara, Vir",
	"Sif, Vir",
	"Brinkburn, Nyx",
	"Binma, Tau Ceti",
	"Qerr'balak, Qerr'valis",
	"Epsilon Ursae Minoris",
	"Meralar, Rarkajar",
	"Tal, Vilous",
	"Menhir, Alat-Hahr",
	"Altam, Vazzend",
	"Uh'Zata, Kelezakata",
	"Moghes, Uuoea-Esa",
	"Xohok, Uuoea-Esa",
	"Varilak, Antares",
	"Sanctorum, Sanctum",
	"Infernum, Sanctum",
	"Abundance in All Things Serene, Beta-Carnelium Ventrum",
	"Jorhul, Barkalis",
	"Shelf Flotilla",
	"Ue-Orsi Flotilla"
	*/
	"Вирго-Эригона",
	"Кара, Вирго-Эригона",
	"Сиф, Вирго-Эригона",
	"Сол",
	"Земля, Сол",
	"Луна, Сол",
	"Марс, Сол",
	"Венера, Сол",
	"Титан, Сол",
	"Толедо, Нью-Огайо",
	"Пакт, Мирия",
	"Китсухана Прайм",
	"Кишар, Альфа-Центавра",
	"Аншар, Альфа-Центавра",
	"Небесный комплекс, Альфа-Центавра",
	"Процион",
	"Альтаир",
	"Бринкбёрн, Никс",
	"Бинма, Тау Кита",
	"Кверр'балак, Кверр'валис",
	"Эпсилон Малой Медведицы",
	"Мералар, Раркаджар",
	"Тал, Вилос",
	"Менхир, Алат-Хаар",
	"Альтам, Ваззенд",
	"Ух'зата, Келезаката",
	"Мог, Уоя-Иса",
	"Ксохок, Уоя-Иса",
	"Варилак, Антарес",
	"Санкторум, Санктум",
	"Инфернум, Санктум",
	"Изобилие Во Всём Умиротворённом, Бета-Корнелиум Вентрум",
	"Джоршул, Баркалис",
	"Флотилия Шельфа",
	"Флотилия Уй-Орси"
	// End of Bastion of Endeavor Translation
	)

var/global/list/faction_choices = list(
	/* Bastion of Endeavor Translation
	"NanoTrasen Incorporated",
	"Hephaestus Industries",
	"Vey-Medical",
	"Zeng-Hu Pharmaceuticals",
	"Ward-Takahashi GMC",
	"Bishop Cybernetics",
	"Morpheus Cyberkinetics",
	"Xion Manufacturing Group",
	"Free Trade Union",
	"Major Bill's Transportation",
	"Ironcrest Transport Group",
	"Grayson Manufactories Ltd.",
	"Aether Atmospherics",
	"Focal Point Energistics",
	"StarFlight Inc.",
	"Oculum Broadcasting Network",
	"Periphery Post",
	"Free Anur Tribune",
	"Centauri Provisions",
	"Einstein Engines",
	"Wulf Aeronautics",
	"Gilthari Exports",
	"Coyote Salvage Corp.",
	"Chimera Genetics Corp.",
	"Kitsuhana Heavy Industries",
	"Independent Pilots Association",
	"Local System Defense Force",
	"United Solar Defense Force",
	"Proxima Centauri Risk Control",
	"HIVE Security",
	"Stealth Assault Enterprises"
	*/
	"НаноТрейсен",
	"Гефест",
	"Вей-Мед",
	"Дзен-Ху",
	"Уорд-Такахаси",
	"Бишоп",
	"Морфей",
	"Зион",
	"Союз независимой торговли",
	"Майор Билл",
	"Айронкрест",
	"Грейсон",
	"Эфир",
	"Точка Фокуса",
	"СтарФлайт",
	"Телерадиовещательная сеть Окулюм",
	"Почта Периферии",
	"Свободная трибуна Анур",
	"Провизия Центавра",
	"Эйнштейн",
	"Вульф",
	"Гилтари",
	"Койот",
	"Химера",
	"Китсухана",
	"Ассоциация независимых пилотов",
	"Силы обороны локальной системы",
	"Единые солнечные силы обороны",
	"Контроль рисков Проксима-Центавра",
	// "Служба безопасности ХАИВ", // even upstream doesnt know what this is so why bother
	"Стелс Нападение и Извлечение" // this makes no sense but i'm out of ideas, for future reference this is the SAARE mercs lorewise
	// End of Bastion of Endeavor Translation
	)
// VOREStation Edits Stop

var/global/list/antag_faction_choices = list()	//Should be populated after brainstorming. Leaving as blank in case brainstorming does not occur.

var/global/list/antag_visiblity_choices = list(
	/* Bastion of Endeavor Translation
	"Hidden",
	"Shared",
	"Known"
	*/
	"Скрыта",
	"Видна союзникам",
	"Известна"
	// End of Bastion of Endeavor Translation
	)

var/global/list/religion_choices = list(
	/* Bastion of Endeavor Translation
	"Unitarianism",
	"Neopaganism",
	"Islam",
	"Christianity",
	"Judaism",
	"Hinduism",
	"Buddhism",
	"Pleromanism",
	"Spectralism",
	"Phact Shintoism",
	"Kishari Faith",
	"Hauler Faith",
	"Nock",
	"Singulitarian Worship",
	"Xilar Qall",
	"Tajr-kii Rarkajar",
	"Agnosticism",
	"Deism",
	"Neo-Moreauism",
	"Orthodox Moreauism"
	*/
	"Унитаризм",
	"Неоязычество",
	"Ислам",
	"Христианство",
	"Иудаизм",
	"Индуизм",
	"Буддизм",
	"Плеромаизм",
	"Спектрализм",
	"Факт-синтоизм",
	"Национальная религия Кишара",
	"Верование дальнобойщиков",
	"Нок",
	"Сингулярианство",
	"Ксилар Квалл",
	"Таджр-кий Раркаджар",
	"Агностицизм",
	"Деизм",
	"Новый мороизм",
	"Традиционный мороизм"
	// End of Bastion of Endeavor Translation
	)