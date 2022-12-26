#Использовать "../internal"

#Область ОписаниеПеременных

Перем Имя;                     // Имя поля
Перем Публичное;               // Поле экспортное
Перем ЗначениеПоУмолчанию;     // Значение поля по умолчанию
Перем ЕстьЗначениеПоУмолчанию; // Есть значение по умолчанию
Перем Аннотации;               // Аннотации поля

#КонецОбласти

// Конструктор
//
// Параметры:
//   ИмяПоля - Строка - Имя поля
//
Процедура ПриСозданииОбъекта(ИмяПоля)

	Имя = ИмяПоля;

	Публичное               = Ложь;
	ЕстьЗначениеПоУмолчанию = Ложь;
	Аннотации               = Новый Массив;

КонецПроцедуры

#Область ПрограммныйИнтерфейс

// Устанавливает Экспорт поля
//
//  Возвращаемое значение:
//   Поле - Ссылка на текущий инстанс Поле
//
Функция Публичное() Экспорт
	
	Публичное = Истина;

	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает значение по умолчанию для поля
//
// Параметры:
//   УстанавливаемоеЗначениеПоУмолчанию - Произвольный - Значение поля по умолчанию
//
//  Возвращаемое значение:
//   Поле - Ссылка на текущий инстанс Поле
//
Функция ЗначениеПоУмолчанию(УстанавливаемоеЗначениеПоУмолчанию) Экспорт
	
	ЕстьЗначениеПоУмолчанию = Истина;
	ЗначениеПоУмолчанию     = УстанавливаемоеЗначениеПоУмолчанию;

	Возврат ЭтотОбъект;

КонецФункции

// Добавляет аннотацию поля
//
// Параметры:
//   Аннотация - Аннотация - Добавляемая аннотация
//
//  Возвращаемое значение:
//   Поле - Ссылка на текущий инстанс Поле
//
Функция Аннотация(Аннотация) Экспорт
	
	Аннотации.Добавить(Аннотация);

	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Строковое представление поля
//
//  Возвращаемое значение:
//   Строка - Строковое представление поля
//
Функция Описание() Экспорт
	
	ОписаниеАннотаций = АннотацииМенеджер.ОписаниеАннотаций(Аннотации);

	Возврат СтрШаблон(
		"%1
		|Перем %2 %3;",
		ОписаниеАннотаций,
		Имя,
		?(Публичное, "Экспорт", "")
	);

КонецФункции

// Описание значения по умолчанию поля
//
//  Возвращаемое значение:
//   Структура - Описание значения по умолчанию поля:
//     * ИмяПоля - Строка - Имя поля
//     * ЕстьЗначениеПоУмолчанию - Булево - Значение по умолчанию задано
//     * ЗначениеПоУмолчанию - Произвольный - Значение по умолчанию
//
Функция ОписаниеЗначенияПоУмолчанию() Экспорт
	
	Возврат Новый Структура(
		"ИмяПоля, ЕстьЗначениеПоУмолчанию, ЗначениеПоУмолчанию",
		Имя,
		ЕстьЗначениеПоУмолчанию,
		ЗначениеПоУмолчанию 
	);

КонецФункции

#КонецОбласти
