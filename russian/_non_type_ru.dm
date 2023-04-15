// this is a worse version of verb_ru, pre_word is unchanged and goes first, morphables are sliced just like usual verb_ru words are, followed by the non-obj word
// i know this is some horrible snowflake code but sacrifices need to be made unless we decide to just redo upstream's code for them
/proc/non_type_verb_ru(var/pre_word, var/morphable_1, var/noun, var/morphable_2, var/after_word)
	var/debug = "[pre_word] + [morphable_1] + [noun] + [morphable_2] + [after_word]"
	var/list/split_morphable_1 = splittext_char(morphable_1, ";")
	var/list/split_morphable_2 = splittext_char(morphable_2, ";")
	var/index = non_types_with_genders_ru.Find(noun)

	if(!noun)
		log_grammar_ru("non_type_verb_ru() не получил исходное слово! [debug]")
		return
	if(split_morphable_1.len != 0 && split_morphable_1.len != 5)
		log_grammar_ru("Изменяемое слово спереди non_type_verb_ru() не соответствует шаблону! [debug]")
		return
	if(split_morphable_2.len != 0 && split_morphable_2.len != 5)
		log_grammar_ru("Изменяемое слово в конце non_type_verb_ru() не соответствует шаблону! [debug]")
		return
	if(!index)
		log_grammar_ru("non_type_verb_ru() не нашел исходное слово в списке! [debug]")
		return

	var/indexed_gender = non_types_with_genders_ru[noun]
	var/msg = pre_word

	if(morphable_1)
		msg += split_morphable_1[1]
		msg += split_morphable_1[indexed_gender+1]
	msg +=  noun
	if(morphable_2)
		msg += split_morphable_2[1]
		msg += split_morphable_2[indexed_gender+1]
	msg += after_word
	
	return msg

// i hate having to do this
// 1 is male, 2 is female, 3 is neuter and 4 is plural
var/global/list/non_types_with_genders_ru = list(
	"торс" = 1,
	"пах" = 1,
	"голова" = 2,
	"левая рука" = 2,
	"правая рука" = 2,
	"левая нога" = 2,
	"правая нога" = 2,
	"левая ступня" = 2,
	"правая ступня" = 2,
	"левая ладонь" = 2,
	"правая ладонь" = 2,
	"сердце" = 3,
	"глаза" = 4,
	"гортань" = 2,
	"мозг" = 1,
	"лёгкие" = 4,
	"печень" = 2,
	"почки" = 4,
	"селезёнка" = 2,
	"желудок" = 1,
	"кишечник" = 1
)