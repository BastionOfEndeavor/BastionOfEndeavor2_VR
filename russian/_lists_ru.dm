// these are meant to be used instead of the non-_ru lists via get_key_by_value[index]
// the purpose is to utilise the values of the lists without actually translating them

var/global/list/selectable_speech_bubbles_ru = list(
	"По умолчанию" = "default",
	"Обычное" = "normal",
	"Слизень" = "slime",
	"Коммуникатор" = "comm",
	"Механизм" = "machine",
	"Синтет" = "synthetic",
	"Синтет (злой)" = "synthetic_evil",
	"Кибер" = "cyber",
	"Призрак" = "ghost",
	"Слизень (зелёный)" = "slime_green",
	"Чёрное" = "dark",
	"Растение" = "plant",
	"Клоун" = "clown",
	"Лисичка" = "fox",
	"Мышка" = "maus",
	"Сердечко" = "heart",
	"Мессенджер" = "textbox",
	"Одержимое" = "posessed",
	"Квадрат" = "square"
)

var/list/possible_voice_types_ru = list(
	"Бип-буп" = "beep-boop",
	"Голос 1" = "goon speak 1",
	"Голос 2" = "goon speak 2",
	"Голос 3" = "goon speak 3",
	"Голос 4" = "goon speak 4",
	"Хлюп-хлюп" = "goon speak blub",
	"Робот" = "goon speak bottalk",
	"Бульк-бульк" = "goon speak buwoo",
	"Корова" = "goon speak cow",
	"Ящер" = "goon speak lizard",
	"Мопс" = "goon speak pug",
	"Мопсик" = "goon speak pugg",
	"Насекомое" = "goon speak roach",
	"Скелет" = "goon speak skelly"
)

var/global/list/all_tooltip_styles_ru = list(
	"Полночь" = "Midnight",
	"Всполох" = "Plasmafire",
	"Ретро" = "Retro",
	"Слаймкор" = "Slimecore",
	"Оперативник" = "Operative",
	"Часы" = "Clockwork"
	)

var/global/list/all_genders_define_list_ru = list(
	"Мужской пол " = MALE,
	"Женский пол" = FEMALE,
	"Без пола" = NEUTER,
	"Множественное число" = PLURAL
)