#Использовать ".."
#Использовать "./fixtures"
#Использовать asserts

&Тест
Процедура ДекораторСоздаетсяПоОбъекту() Экспорт
	Декоратор = Новый ПостроительДекоратора(Новый МойКласс).Построить();

	Ожидаем.Что(ОбработкаДекоратора.ИсходныйТип(Декоратор)).Равно(Тип("МойКласс"));
КонецПроцедуры

&Тест
Процедура ДекораторСоздаетсяПоТипу() Экспорт
	Декоратор = Новый ПостроительДекоратора(Тип("МойКласс")).Построить();

	Ожидаем.Что(ОбработкаДекоратора.ИсходныйТип(Декоратор)).Равно(Тип("МойКласс"));
КонецПроцедуры

&Тест
Процедура ДекораторСоздаетсяПоТипуСПараметризованнымКонструктором() Экспорт

	ПроверяемыйТип = Тип("МойКлассСПараметризованнымКонструктором");

	Декоратор = Новый ПостроительДекоратора(ПроверяемыйТип)
		.ЗначениеПараметраКонструктораПоТипу(1)
		.Построить();

	Ожидаем.Что(ОбработкаДекоратора.ИсходныйТип(Декоратор)).Равно(ПроверяемыйТип);
	Ожидаем.Что(Декоратор.Парам1).Равно(1);
	Ожидаем.Что(Декоратор.Парам2).Равно(2);

	Декоратор = Новый ПостроительДекоратора(ПроверяемыйТип)
		.ЗначениеПараметраКонструктораПоТипу(1)
		.ЗначениеПараметраКонструктораПоТипу(3)
		.Построить();

	Ожидаем.Что(ОбработкаДекоратора.ИсходныйТип(Декоратор)).Равно(ПроверяемыйТип);
	Ожидаем.Что(Декоратор.Парам1).Равно(1);
	Ожидаем.Что(Декоратор.Парам2).Равно(3);

КонецПроцедуры

&Тест
Процедура ДекораторСоздаетсяБезИсходногоОбъекта() Экспорт
	Декоратор = Новый ПостроительДекоратора().Построить();

	Ожидаем.Что(ОбработкаДекоратора.ИсходныйТип(Декоратор)).Равно(Тип("Неопределено"));
КонецПроцедуры

&Тест
Процедура ФункцииОбъектаНаследуются() Экспорт
	Декоратор = Новый ПостроительДекоратора(Тип("МойКласс")).Построить();

	Ожидаем.Что(Декоратор.ТестоваяФункция()).Равно(1);
КонецПроцедуры

&Тест
Процедура ФункцииТипаНаследуются() Экспорт
	Декоратор = Новый ПостроительДекоратора(Новый МойКласс).Построить();

	Ожидаем.Что(Декоратор.ТестоваяФункция()).Равно(1);
КонецПроцедуры

&Тест
Процедура ПоляОбъектаНаследуются() Экспорт

	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	Декоратор = Новый ПостроительДекоратора(МойКласс).Построить();

	Ожидаем.Что(Декоратор.Поле).Равно(123);
КонецПроцедуры

&Тест
Процедура ПоляТипаНаследуются() Экспорт

	Декоратор = Новый ПостроительДекоратора(Тип("МойКласс")).Построить();

	Ожидаем.Что(Декоратор.Поле).ЭтоНеопределено();

КонецПроцедуры

&Тест
Процедура ПоляОбъектаСинхронизируютсяЯвно() Экспорт
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	Декоратор = Новый ПостроительДекоратора(МойКласс).Построить();
	
	Ожидаем.Что(Декоратор.Поле).Равно(МойКласс.Поле);
КонецПроцедуры

&Тест
Процедура ПоляОбъектаСинхронизируютсяОбратно() Экспорт
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	Декоратор = Новый ПостроительДекоратора(МойКласс).Построить();
	Декоратор.ИзменитьЗначениеПоля(100);

	Ожидаем.Что(Декоратор.Поле).Равно(100);
КонецПроцедуры

&Тест
Процедура ФункцияДобавляется() Экспорт
	
	МойКласс = Новый МойКласс;

	НовыйМетод = Новый Метод("ДобавленнаяФункция")
		.Публичный()
		.ТелоМетода("Возврат Истина;");

	Декоратор = Новый ПостроительДекоратора(МойКласс)
		.Метод(НовыйМетод)
		.Построить();

	Результат = Декоратор.ДобавленнаяФункция();

	Ожидаем.Что(Результат).ЭтоИстина();
КонецПроцедуры

&Тест
Процедура ФункцияСПараметрамиДобавляется() Экспорт
	
	МойКласс = Новый МойКласс;

	НовыйМетод = Новый Метод("ДобавленнаяФункция")
		.Публичный()
		.Параметр(Новый ПараметрМетода("Параметр1"))
		.Параметр(Новый ПараметрМетода("Параметр2").ЗначениеПоУмолчанию(2))
		.ТелоМетода("Возврат Новый Структура(""Параметр1, Параметр2"", Параметр1, Параметр2);");

	Декоратор = Новый ПостроительДекоратора(МойКласс)
		.Метод(НовыйМетод)
		.Построить();

	Результат = Декоратор.ДобавленнаяФункция(Истина);

	Ожидаем.Что(Результат.Свойство("Параметр1")).ЭтоИстина();
	Ожидаем.Что(Результат.Свойство("Параметр2")).ЭтоИстина();
	Ожидаем.Что(Результат.Параметр1).ЭтоИстина();
	Ожидаем.Что(Результат.Параметр2).Равно(2);

КонецПроцедуры

&Тест
Процедура ПерехватчикиДобавленныхФункцийРаботаютКорректно() Экспорт
	
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	ИмяМетода = "ЗначениеПоля";

	НовыйМетод = Новый Метод(ИмяМетода)
		.Публичный()
		.ТелоМетода("Поле = Поле + 1;");

	ПерехватчикПеред = Новый Перехватчик(ИмяМетода)
		.ТипПерехватчика(ТипыПерехватчиковМетода.Перед)
		.Тело(
			"КэшПоля = Поле;
			|СчетчикПерехватчикаПеред = СчетчикПерехватчикаПеред + 1;"
		);

	ПерехватчикПосле = Новый Перехватчик(ИмяМетода)
		.ТипПерехватчика(ТипыПерехватчиковМетода.После)
		.Тело(
			"КэшПоля = КэшПоля - 1;
			|СчетчикПерехватчикаПосле = СчетчикПерехватчикаПосле + 1;"
		);

	Декоратор = Новый ПостроительДекоратора(МойКласс)
		.Поле(Новый Поле("КэшПоля").Публичное())
		.Поле(Новый Поле("СчетчикПерехватчикаПеред").Публичное().ЗначениеПоУмолчанию(0))
		.Поле(Новый Поле("СчетчикПерехватчикаПосле").Публичное().ЗначениеПоУмолчанию(0))
		.Перехватчик(ПерехватчикПеред)
		.Метод(НовыйМетод)
		.Перехватчик(ПерехватчикПосле)
		.Построить();

	Декоратор.ЗначениеПоля();

	Ожидаем.Что(Декоратор.Поле).Равно(124);
	Ожидаем.Что(Декоратор.КэшПоля).Равно(122);
	Ожидаем.Что(Декоратор.СчетчикПерехватчикаПеред).Равно(1);
	Ожидаем.Что(Декоратор.СчетчикПерехватчикаПосле).Равно(1);

КонецПроцедуры

&Тест
Процедура ПерехватчикиДекораторруемыхФункцийРаботаютКорректно() Экспорт
	
	МойКласс = Новый МойКласс;
	МойКласс.Поле = 123;

	ПерехватчикПеред = Новый Перехватчик("ИзменитьЗначениеПоля")
		.ТипПерехватчика(ТипыПерехватчиковМетода.Перед)
		.Тело(
			"КэшПоля = Поле; 
			|СчетчикПерехватчикаПеред = СчетчикПерехватчикаПеред + 1;"
		);

	ПерехватчикПосле = Новый Перехватчик("ИзменитьЗначениеПоля")
		.ТипПерехватчика(ТипыПерехватчиковМетода.После)
		.Тело(
			"КэшПоля = КэшПоля - Поле;
			|СчетчикПерехватчикаПосле = СчетчикПерехватчикаПосле + 1;"
		);

	Декоратор = Новый ПостроительДекоратора(МойКласс)
		.Поле(Новый Поле("КэшПоля").Публичное())
		.Поле(Новый Поле("СчетчикПерехватчикаПеред").Публичное().ЗначениеПоУмолчанию(0))
		.Поле(Новый Поле("СчетчикПерехватчикаПосле").Публичное().ЗначениеПоУмолчанию(0))
		.Перехватчик(ПерехватчикПеред)
		.Перехватчик(ПерехватчикПосле)
		.Построить();

	Декоратор.ИзменитьЗначениеПоля(20);

	Ожидаем.Что(Декоратор.Поле).Равно(20);
	Ожидаем.Что(Декоратор.КэшПоля).Равно(103);
	Ожидаем.Что(Декоратор.СчетчикПерехватчикаПеред).Равно(1);
	Ожидаем.Что(Декоратор.СчетчикПерехватчикаПосле).Равно(1);

КонецПроцедуры

&Тест
Процедура ПриватноеПолеДобавляется() Экспорт

	Декоратор = Новый ПостроительДекоратора(Новый МойКласс)
		.Поле(
			Новый Поле("ПриватноеПоле1")
				.ЗначениеПоУмолчанию("ффф"))
		.Поле(
			Новый Поле("ПриватноеПоле2"))
		.Построить();

	Рефлектор = Новый Рефлектор();

	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Декоратор, "ПриватноеПоле1")).Равно("ффф");
	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Декоратор, "ПриватноеПоле2")).ЭтоНеопределено();

	ИсключениеВозникло = Ложь;
	Попытка
		А = Декоратор.ПриватноеПоле1;
	Исключение
		ИсключениеВозникло = Истина;
	КонецПопытки;

	Ожидаем.Что(ИсключениеВозникло, "Получилось обратиться к приватному полю").ЭтоИстина();
КонецПроцедуры

&Тест
Процедура ПубличноеПолеДобавляется() Экспорт

	Декоратор = Новый ПостроительДекоратора(Новый МойКласс)
		.Поле(
			Новый Поле("ПубличноеПоле1")
				.Публичное()
				.ЗначениеПоУмолчанию("ффф"))
		.Поле(
			Новый Поле("ПубличноеПоле2")
				.Публичное())
			.Построить();

	Рефлектор = Новый Рефлектор();

	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Декоратор, "ПубличноеПоле1")).Равно("ффф");
	Ожидаем.Что(Рефлектор.ПолучитьСвойство(Декоратор, "ПубличноеПоле2")).ЭтоНеопределено();

	ИсключениеВозникло = Ложь;
	Попытка
		А = Декоратор.ПубличноеПоле1;
	Исключение
		ИсключениеВозникло = Истина;
	КонецПопытки;

	Ожидаем.Что(ИсключениеВозникло, "Не получилось обратиться к публичному полю").ЭтоЛожь();
КонецПроцедуры

&Тест
Процедура АннотированноеПолеДобавляется() Экспорт

	Поле = Новый Поле("ПубличноеПоле")
		.Публичное()
		.Аннотация(Новый Аннотация("АннотацияБезПараметра"))
		.Аннотация(
			Новый Аннотация("АннотацияСПараметром")
				.Параметр("Значение"))
		.Аннотация(
			Новый Аннотация("АннотацияСИменованнымПараметром")
				.Параметр("Значение", "ИмяПараметра"));

	Декоратор = Новый ПостроительДекоратора()
		.Поле(Поле)
		.Построить();

	Рефлектор = Новый Рефлектор;

	ТаблицаСвойств = Рефлектор.ПолучитьТаблицуСвойств(Декоратор);

	Ожидаем.Что(ТаблицаСвойств.Количество()).Равно(1);
	Ожидаем.Что(ТаблицаСвойств[0].Имя).Равно("ПубличноеПоле");

	Ожидаем.Что(ТаблицаСвойств[0].Аннотации.Количество()).Равно(3);
	
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[0].Имя).Равно("АннотацияБезПараметра");
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[0].Параметры).Равно(Неопределено);

	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[1].Имя).Равно("АннотацияСПараметром");
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[1].Параметры.Количество()).Равно(1);
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[1].Параметры[0].Имя).Равно(Неопределено);
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[1].Параметры[0].Значение).Равно("Значение");

	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[2].Имя).Равно("АннотацияСИменованнымПараметром");
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[2].Параметры.Количество()).Равно(1);
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[2].Параметры[0].Имя).Равно("ИмяПараметра");
	Ожидаем.Что(ТаблицаСвойств[0].Аннотации[2].Параметры[0].Значение).Равно("Значение");

КонецПроцедуры

&Тест
Процедура АннотированныйМетодДобавляется() Экспорт
	
	Метод = Новый Метод("ПубличныйМетод")
		.Публичный()
		.Аннотация(Новый Аннотация("АннотацияБезПараметра"))
		.Аннотация(
			Новый Аннотация("АннотацияСПараметром")
				.Параметр("Значение"))
		.Аннотация(
			Новый Аннотация("АннотацияСИменованнымПараметром")
				.Параметр("Значение", "ИмяПараметра"));

	Декоратор = Новый ПостроительДекоратора()
		.Метод(Метод)
		.Построить();

	Рефлектор = Новый Рефлектор;

	ТаблицаМетодов = Рефлектор.ПолучитьТаблицуМетодов(Декоратор);

	Ожидаем.Что(ТаблицаМетодов[1].Имя).Равно("ПубличныйМетод");

	Ожидаем.Что(ТаблицаМетодов[1].Аннотации.Количество()).Равно(3);
	
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[0].Имя).Равно("АннотацияБезПараметра");
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[0].Параметры).ЭтоНеопределено();

	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[1].Имя).Равно("АннотацияСПараметром");
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[1].Параметры.Количество()).Равно(1);
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[1].Параметры[0].Имя).ЭтоНеопределено();
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[1].Параметры[0].Значение).Равно("Значение");

	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[2].Имя).Равно("АннотацияСИменованнымПараметром");
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[2].Параметры.Количество()).Равно(1);
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[2].Параметры[0].Имя).Равно("ИмяПараметра");
	Ожидаем.Что(ТаблицаМетодов[1].Аннотации[2].Параметры[0].Значение).Равно("Значение");

КонецПроцедуры

&Тест
Процедура ИмпортДобавляется() Экспорт

	ТекстСценарияДекоратора = Новый ПостроительДекоратора(Новый МойКласс)
		.Импорт(Новый Импорт("asserts"))
		.Импорт(Новый Импорт(".").ТипПодключения(ТипыПодключенияБибилотек.ПоПути))
		.ТекстСценария();

	Ожидаем.Что(ТекстСценарияДекоратора)
		.Содержит("#Использовать asserts")
		.Содержит("#Использовать "".""")
		;

КонецПроцедуры

&Тест
Процедура ПользовательскийШагДобавляется() Экспорт

	ТекстСценарияДекоратора = Новый ПостроительДекоратора(Новый МойКласс)
		.ШагИнициализации(Новый ШагИнициализации("А = 0;"))
		.ШагИнициализации(Новый ШагИнициализации("Сообщить(А);"))
		.ТекстСценария();

	Ожидаем.Что(ТекстСценарияДекоратора)
		.Содержит("А = 0;
				  |Сообщить(А);")
		;

КонецПроцедуры

&Тест
Процедура ИсходныйТипОпределяетсяРекурсивно() Экспорт

	Декоратор = Новый ПостроительДекоратора(Новый МойКласс()).Построить();
	ДекораторОтДекоратора = Новый ПостроительДекоратора(Декоратор).Построить();

	Ожидаем.Что(ОбработкаДекоратора.ИсходныйТип(ДекораторОтДекоратора)).Равно(Тип("МойКласс"));

КонецПроцедуры

&Тест
Процедура ПереопределениеТекстаСценария() Экспорт

	ПостроительДекоратора = Новый ПостроительДекоратора(Новый МойКласс())
		.Поле(Новый Поле("МоеПоле").Публичное());
	ТекстСценария = ПостроительДекоратора.ТекстСценария();
	ТекстСценария = ТекстСценария + Символы.ПС + "МоеПоле = 100;";

	Декоратор = ПостроительДекоратора.Построить(ТекстСценария);

	Ожидаем.Что(Декоратор.МоеПоле).Равно(100);

КонецПроцедуры

&Тест
Процедура ПереопределилсяВозвращаемыйЭтотОбъект() Экспорт

	Декоратор = Новый ПостроительДекоратора(Новый МойКласс).Построить();

	Ожидаем.Что(Декоратор.ВернутьЭтотОбъект()).Равно(Декоратор);

КонецПроцедуры

&Тест
Процедура НекорректныеПараметрыАннотации() Экспорт
	
	Аннотация = Новый Аннотация("Тест")
		.Параметр("Значение");

	Попытка
		Аннотация.Параметр("ЗначениеЛомающееАннотацию");
	Исключение
		ИсключениеВозникло = Истина;
	КонецПопытки;

	Ожидаем.Что(ИсключениеВозникло, "Получилось добавить не корректный парамтр аннотации").ЭтоИстина();	

КонецПроцедуры

&Тест
Процедура ЗначенияПараметровПоУмолчаниюСохраняется() Экспорт
	
	Декоратор = Новый ПостроительДекоратора(Новый МойКласс).Построить();

	Ожидаем.Что(Декоратор.ТестоваяФункцияСоЗначениемПараметраПоУмолчанию()).Равно(1);
	Ожидаем.Что(Декоратор.ТестоваяФункцияСоЗначениемПараметраПоУмолчанию(2)).Равно(2);

КонецПроцедуры
