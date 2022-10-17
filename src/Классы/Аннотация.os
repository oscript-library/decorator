#Использовать "../internal"

#Область ОписаниеПеременных

Перем Имя;                // Имя аннотации
Перем ПараметрыАннотации; // Параметры аннотации

#КонецОбласти

// Конструктор
//
// Параметры:
//   ИмяАннотации - Строка - Имя добавляемой аннотации
//
Процедура ПриСозданииОбъекта(ИмяАннотации)

	Имя = ИмяАннотации;

	ПараметрыАннотации = Новый Массив;

КонецПроцедуры

#Область ПрограммныйИнтерфейс

// Добавлет параметр аннотации, допускается указание одного безымянного параметра
//
// Параметры:
//   Значение - Строка, Число, Булево, Дата - Значение параметра
//   Имя      - Строка - Необязательный, имя параметра 
//
//  Возвращаемое значение:
//   Аннотация - Ссылка на текущий инстанс Аннотация
//
Функция Параметр(Значение, Имя = "") Экспорт
	
	// В случае если у аннотации один параметр, его имя можно опустить, проверим этот инвариант
	Если ПустаяСтрока(Имя) И ПараметрыАннотации.Количество() <> 0 Тогда
		ВызватьИсключение "Запрещено указывать параметр аннотации без имени если параметров больше одного";
	КонецЕсли; 

	ПараметрАннотации = Новый Структура(
		"Имя, Значение",
		Имя,
		Значение 
	);

	ПараметрыАннотации.Добавить(ПараметрАннотации);

	Возврат ЭтотОбъект;

КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Строковое представление аннотации
//
//  Возвращаемое значение:
//   Строка - Строковое представление аннотации
//
Функция Описание() Экспорт
	
	ОписаниеПараметров = Новый Массив();

	Для каждого ПараметрАннотации Из ПараметрыАннотации Цикл
		
		Значение = ПараметрыМенеджер.ОписаниеЗначения(ПараметрАннотации.Значение);

		ОписаниеПараметров.Добавить(?(
			ПустаяСтрока(ПараметрАннотации.Имя), 
			Значение,
			СтрШаблон("%1 = %2", ПараметрАннотации.Имя, Значение)
		));

	КонецЦикла;

	Если ОписаниеПараметров.Количество() = 0 Тогда

		Возврат СтрШаблон("&%1", Имя);

	Иначе

		Возврат СтрШаблон("&%1(%2)", Имя, СтрСоединить(ОписаниеПараметров, ", "));

	КонецЕсли;

КонецФункции

#КонецОбласти
