#Использовать "../internal"

#Область ОписаниеПеременных

Перем Библиотека;     // Подключаемая библиотека
Перем ТипПодключения; // Тип подключения библиотеки

#КонецОбласти

// Конструктор
//
// Параметры:
//   ПодключаемаяБиблиотека - Строка - Имя или путь подключаемой библиотеки
//
Процедура ПриСозданииОбъекта(ПодключаемаяБиблиотека)
	
	Библиотека = ПодключаемаяБиблиотека;

	ТипПодключения = ТипыПодключенияБибилотек.ПоИмени;

КонецПроцедуры

#Область ПрограммныйИнтерфейс

// Устанавливает тип подключения библиотеки
//
// Параметры:
//   УстанавлеваемыйТипПодключения - ТипыПодключенияБибилотек - Устанавливаемый тип подключения библиотеки
//
//  Возвращаемое значение:
//   Импорт - Ссылка на текущий инстанс Импорт
//
Функция ТипПодключения(УстанавлеваемыйТипПодключения) Экспорт
	
	ТипПодключения = УстанавлеваемыйТипПодключения;

	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Строковое представление импорта
//
//  Возвращаемое значение:
//   Строка - Строковое представление импорта
//
Функция Описание() Экспорт
	
	Возврат СтрШаблон(
		"#Использовать %1",
		?(
			ТипПодключения = ТипыПодключенияБибилотек.ПоИмени,
			Библиотека,
			ПараметрыМенеджер.ОписаниеЗначения(Библиотека)
		)
	);

КонецФункции

#КонецОбласти
