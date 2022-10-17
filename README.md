# decorator

Библиотека для создания оберток (декораторов) над классами.

Декоратор повторяет публичный интерфейс класса (экспортные методы и поля),
делегируя вызов вложенному реальному объекту.

Возможности:

* создание декоратора с идентичным интерфейсом;
* синхронизация значений полей декоратора и реального объекта;
* добавление методов, импортов, полей, шагов инициализации в runtime;
* добавление перехватчиков ("перед", "после") вызова метода;
* поддержка вложенных декораторов.

docs - todo;

## Пример использования

```bsl
#Использовать decorator

КакойТоКласс = Новый КакойТоКласс();
КакойТоКласс.Поле = 123;

ИмяМетода = "ДобавленнаяФункция";
ТекстМетода = "Возврат Поле + 1;";

Декоратор = Новый КонструкторДекоратора(КакойТоКласс)
    .ДобавитьИмпортПоИмени("fs")
    .ДобавитьПубличноеПоле("НовоеПоле", "ЗначениеПоУмолчанию")
    .ДобавитьМетод(ИмяМетода, ТекстМетода)
    .ДобавитьПередВызовомМетода("ДобавленнаяФункция", "Сообщить(""Привет, мир!"");")
    .Построить();

Ожидаем.Что(Декоратор.Поле).Равно(123);
Ожидаем.Что(Декоратор.РоднаяФункцияВозвращающаяИстина()).ЭтоИстина();
Ожидаем.Что(Декоратор.ДобавленнаяФункция()).Равно(124);
```

## Документация по методам

### КонструкторДекоратора

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   Объект - Произвольный - Инстанс объекта, над которым нужно создать декоратор.
//
Процедура ПриСозданииОбъекта(Объект) 
```

#### ДобавитьПриватноеПоле

```bsl
// Добавляет в декоратор новое приватное поле.
//
// Параметры:
//   ИмяПоля - Строка - Имя добавляемого поля
//   ЗначениеПоля - Произвольный - Значение, которым необходимо проинициализировать добавляемое поле.
//                                 Если не задано, поле не инициализируется и содержит Неопределено.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПриватноеПоле(ИмяПоля, ЗначениеПоля = Неопределено) 
```

#### ДобавитьПубличноеПоле

```bsl
// Добавляет в декоратор новое публичное (экспортное) поле.
//
// Параметры:
//   ИмяПоля - Строка - Имя добавляемого поля
//   ЗначениеПоля - Произвольный - Значение, которым необходимо проинициализировать добавляемое поле.
//                                 Если не задано, поле не инициализируется и содержит Неопределено.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПубличноеПоле(ИмяПоля, ЗначениеПоля = Неопределено) 
```

#### ДобавитьМетод

```bsl
// Добавляет в декоратор новый публичный (экспортный) метод.
//
// Параметры:
//   ИмяМетода - Строка - Имя добавляемого метода.
//   ТекстМетода - Строка - Текст добавляемого метода. Допустимо использование многострочной строки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьМетод(ИмяМетода, ТекстМетода) 
```

#### ДобавитьПередВызовомМетода

```bsl
// Добавляет в декоратор перехватчик, срабатывающий перед вызовом указанного метода.
//
// Параметры:
//   ИмяМетода - Строка - Имя перехватываемого метода.
//   ТекстПерехватчика - Текст - Текст добавляемого перехватчика. Допустимо использование многострочной строки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПередВызовомМетода(ИмяМетода, ТекстПерехватчика) 
```

#### ДобавитьПослеВызоваМетода

```bsl
// Добавляет в декоратор перехватчик, срабатывающий после вызова указанного метода.
//
// Параметры:
//   ИмяМетода - Строка - Имя перехватываемого метода.
//   ТекстПерехватчика - Текст - Текст добавляемого перехватчика. Допустимо использование многострочной строки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьПослеВызоваМетода(ИмяМетода, ТекстПерехватчика) 
```

#### ДобавитьИмпортПоИмени

```bsl
// Добавляет в декоратор импорт библиотеки (#Использовать) по имени библиотеки.
//
// Параметры:
//   ИмяБиблиотеки - Строка - Имя библиотеки.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьИмпортПоИмени(ИмяБиблиотеки) 
```

#### ДобавитьИмпортПоПути

```bsl
// Добавляет в декоратор импорт библиотеки (#Использовать) по пути к библиотеке.
//
// Параметры:
//   ПутьКБиблиотеке - Строка - Путь к библиотеке. Можно использовать как абсолютный, так и относительный путь.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьИмпортПоПути(ПутьКБиблиотеке) 
```

#### ДобавитьШагИнициализации

```bsl
// Добавляет в декоратор шаг инициализации в тело модуля.
//
// Параметры:
//   ТекстШага - Строка - Выполняемый код.
//
//  Возвращаемое значение:
//   КонструкторДекоратора - Ссылка на текущий инстанс КонструкторДекоратора
//
Функция ДобавитьШагИнициализации(ТекстШага) 
```

#### ТекстСценария

```bsl
// Получить сконструированный текст сценария будущего декоратора
//
//  Возвращаемое значение:
//   Строка - Текст сценария декоратора
//
Функция ТекстСценария() 
```

#### Построить

```bsl
// Сконструировать готовый декоратор по настройкам конструктора декоратора.
//
// Параметры:
//   ТекстСценария - Строка - Текст сценария декоратора. Если не задан, формируется автоматически.
//
//  Возвращаемое значение:
//   Произвольный - Декортатор над объектом, переданным в конструктор декоратора
//
Функция Построить(ТекстСценария = Неопределено) 
```

### Модуль ОбработкаДекоратора

#### ИсходныйТип

```bsl
// Получает тип объекта, вокруг которого построен декоратор (рекурсивно).
//
// Параметры:
//   Декоратор - Произвольный - Объект, у которого нужно найти исходный тип объекта
//
//  Возвращаемое значение:
//   Тип - Исходный тип объекта
//
Функция ИсходныйТип(Декоратор) 
```

#### СинхронизироватьПоля

```bsl
// Синхронизировать значения экспортных полей двух объектов.
//
// Параметры:
//   ИсходныйОбъект - Произвольный - Источник значений свойств
//   Потребитель - Произвольный - Получатель значений свойств
//
Процедура СинхронизироватьПоля(ИсходныйОбъект, Потребитель) 
```

### Модуль Константы_Декоратор

```bsl
// Имя поля, в котором хранится ссылка на исходный объект.
Перем Поле_ИнстансОбъекта Экспорт;
```

---

## Новая версия API


## Пример использования:

```bsl
#Использовать decorator

КакойТоКласс = Новый КакойТоКласс();
КакойТоКласс.Поле = 123;

Поле = Новый Поле("НовоеПоле")
	.Публичное()
	.ЗначениеПоУмолчанию("ЗначениеПоУмолчанию");

Метод = Новый Метод("ДобавленнаяФункция")
	.Публичный()
	.ТелоМетода("Возврат Поле + 1;");

Перехватчик = Новый Перехватчик("ДобавленнаяФункция")
	.ТипПерехватчика(ТипыПерехватчиковМетода.Перед)
	.Тело("Сообщить(""Привет, мир!"")");

Декоратор = Новый ПостроительДекоратора(КакойТоКласс)
    .Импорт(Новый Импорт("fs"))
    .Поле(Поле)
    .Метод(Метод)
    .Перехватчик(Перехватчик)
    .Построить();

Ожидаем.Что(Декоратор.Поле).Равно(123);
Ожидаем.Что(Декоратор.РоднаяФункцияВозвращающаяИстина()).ЭтоИстина();
Ожидаем.Что(Декоратор.ДобавленнаяФункция()).Равно(124);
```

## Документация по методам

### ПостроительДекоратора

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   Объект - Произвольный - Инстанс объекта, над которым нужно создать декоратор
//          - Тип          - Тип объекта, инстанс которого нужно создатьи задекорировать
//          - Неопределено - Декоратор создаётся с нуля
//
Процедура ПриСозданииОбъекта(Объект = Неопределено)
```

#### Поле

```bsl
// Добавляет в декоратор новое поле
//
// Параметры:
//   Поле - Поле - Добавляемое поле
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция Поле(Поле) Экспорт
```

#### Метод

```bsl
// Добавляет в декоратор новый метод.
//
// Параметры:
//   Метод - Метод - Добавляемый метод.
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция Метод(Метод) Экспорт
```

#### Перехватчик

```bsl
// Добавляет в декоратор перехватчик
//
// Параметры:
//   Перехватчик - Перехватчик - Добавляемый перехватчик
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция Перехватчик(Перехватчик) Экспорт
```

#### Импорт

```bsl
// Добавляет в декоратор импорт библиотеки (#Использовать).
//
// Параметры:
//   Импорт - Импорт - Импорт бибилотеки
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция Импорт(Импорт) Экспорт
```

#### ШагИнициализации

```bsl
// Добавляет в декоратор шаг инициализации в тело модуля.
//
// Параметры:
//   ШагИнициализации - ШагИнициализации - Выполняемый шаг инициализации
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ШагИнициализации(ШагИнициализации) Экспорт
```

#### ЗначениеПараметраКонструктораПоТипу

```bsl
// Добавляет значение параметра для инициалзации объекта, в случае создания декоратора из типа
//
// Параметры:
//   ЗначениеПараметра - Произвольный - Значение параметра конструктора по типу
//
//  Возвращаемое значение:
//   ПостроительДекоратора - Ссылка на текущий инстанс ПостроительДекоратора
//
Функция ЗначениеПараметраКонструктораПоТипу(ЗначениеПараметра) Экспорт
```

#### ТекстСценария
```bsl
// Получить сконструированный текст сценария будущего декоратора
//
//  Возвращаемое значение:
//   Строка - Текст сценария декоратора
//
Функция ТекстСценария() Экспорт
```

#### Построить

```bsl
// Сконструировать готовый декоратор по настройкам конструктора Декоратор.
//
// Параметры:
//   ТекстСценария - Строка - Текст сценария декоратора. Если не задан, формируется автоматически.
//
//  Возвращаемое значение:
//   Произвольный - Декоратор над объектом, переданным в конструктор Декоратор
//
Функция Построить(ТекстСценария = Неопределено) Экспорт
```

### Аннотация

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   ИмяАннотации - Строка - Имя добавляемой аннотации
//
Процедура ПриСозданииОбъекта(ИмяАннотации)
```

#### Параметр

```bsl
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
```

### Импорт

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   ПодключаемаяБиблиотека - Строка - Имя или путь подключаемой библиотеки
//
Процедура ПриСозданииОбъекта(ПодключаемаяБиблиотека)
```

#### ТипПодключения

```bsl
// Устанавливает тип подключения библиотеки
//
// Параметры:
//   УстанавлеваемыйТипПодключения - ТипыПодключенияБибилотек - Устанавливаемый тип подключения библиотеки
//
//  Возвращаемое значение:
//   Импорт - Ссылка на текущий инстанс Импорт
//
Функция ТипПодключения(УстанавлеваемыйТипПодключения) Экспорт
```

#### Метод

```bsl
// Конструктор
//
// Параметры:
//   ИмяМетода - Строка - Имя создаваемого метода
//
Процедура ПриСозданииОбъекта(ИмяМетода)
```

#### Аннотация

```bsl
// Добавляет аннотацию метода
//
// Параметры:
//   Аннотация - Аннотация - Добавляемая аннотация
//
//  Возвращаемое значение:
//   Метод - Ссылка на текущий инстанс Метод
//
Функция Аннотация(Аннотация) Экспорт
```
#### ТелоМетода

```bsl
// Устанавливает тело метода
//
// Параметры:
//   ТелоМетода - Строка - Устанавливаемое тело метода
//
//  Возвращаемое значение:
//   Метод - Ссылка на текущий инстанс Метод
//
Функция ТелоМетода(ТелоМетода) Экспорт
```

#### Параметр

```bsl
// Добавляет параметр метода
//
// Параметры:
//   Параметр - ПараметрМетода - Добавляемый параметр метода
//
//  Возвращаемое значение:
//   Метод - Ссылка на текущий инстанс Метод
//
Функция Параметр(Параметр) Экспорт
```

#### Публичный

```bsl
// Устанавливает экспорт метода
//
//  Возвращаемое значение:
//   Метод - Ссылка на текущий инстанс Метод
//
Функция Публичный() Экспорт
```

### ПараметрМетода

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   ИмяПараметра - Строка - Имя параметра метода
//
Процедура ПриСозданииОбъекта(ИмяПараметра)
```

#### ПоЗначению

```bsl
// Устанавливает Знач параметра
//
//  Возвращаемое значение:
//   ПараметрМетода - Ссылка на текущий инстанс ПараметрМетода
//
Функция ПоЗначению() Экспорт
```

#### ЗначениеПоУмолчанию

```bsl
// Устанавливает значение по умолчанию для параметра
//
// Параметры:
//   ЗначениеПоУмолчаниюПараметра - Строка, Число, Дата, Булево, Неопределено - Значение параметра по умолчанию
//
//  Возвращаемое значение:
//   ПараметрМетода - Ссылка на текущий инстанс ПараметрМетода
//
Функция ЗначениеПоУмолчанию(ЗначениеПоУмолчаниюПараметра) Экспорт
```
#### Аннотация

```bsl
// Добавляет аннотацию параметра
//
// Параметры:
//   Аннотация - Аннотация - Добавляемая аннотация
//
//  Возвращаемое значение:
//   ПараметрМетода - Ссылка на текущий инстанс ПараметрМетода
//
Функция Аннотация(Аннотация) Экспорт
```

### Перехватчик

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   ИмяПерехватываемогоМетода - Строка - Имя метода для которого предназначен перехватчик
//
Процедура ПриСозданииОбъекта(ИмяПерехватываемогоМетода)
```

#### Тело

```bsl
// Устанавливает тело перехватчика
//
// Параметры:
//   ТелоПерехватчика - Строка - Устанавливаемое тело перехватчика
//
//  Возвращаемое значение:
//   Перехватчик - Ссылка на текущий инстанс Перехватчик
//
Функция Тело(ТелоПерехватчика) Экспорт
```

#### ТипПерехватчика

```bsl
// Устанавливает тип перехватчика
//
// Параметры:
//   ТипПерехватчика - ТипыПерехватчиковМетода - Устанавливаемое тип перехватчика
//
//  Возвращаемое значение:
//   Перехватчик - Ссылка на текущий инстанс Перехватчик
//
Функция ТипПерехватчика(ТипПерехватчика) Экспорт
```

### Поле

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   ИмяПоля - Строка - Имя поля
//
Процедура ПриСозданииОбъекта(ИмяПоля)
```

#### Публичное

```bsl
// Устанавливает Экспорт поля
//
//  Возвращаемое значение:
//   Поле - Ссылка на текущий инстанс Поле
//
Функция Публичное() Экспорт
```

#### ЗначениеПоУмолчанию

```bsl
// Устанавливает значение по умолчанию для поля
//
// Параметры:
//   УстанавливаемоеЗначениеПоУмолчанию - Произвольный - Значение поля по умолчанию
//
//  Возвращаемое значение:
//   Поле - Ссылка на текущий инстанс Поле
//
Функция ЗначениеПоУмолчанию(УстанавливаемоеЗначениеПоУмолчанию) Экспорт
```

#### Аннотация

```bsl
// Добавляет аннотацию поля
//
// Параметры:
//   Аннотация - Аннотация - Добавляемая аннотация
//
//  Возвращаемое значение:
//   Поле - Ссылка на текущий инстанс Поле
//
Функция Аннотация(Аннотация) Экспорт
```

### ШагИнициализации

#### ПриСозданииОбъекта

```bsl
// Конструктор
//
// Параметры:
//   ТелоШага - Строка - тело шага инциализации
//
Процедура ПриСозданииОбъекта(ТелоШага)
```

### Перечисление ТипыПерехватчиковМетода

#### Перед
Перехватчик вызывается перед выполнением перехватываемого метода

#### После
Перехватчик вызывается после выполнения перехватываемого метода

### Перечисление ТипыПодключенияБибилотек

#### ПоИмени
Библиотека подключается по имени:
```bsl
#Использовать fs
```

#### ПоПути
Библиотека подключается по пути к библиотеке:
```bsl
#Использовать "./libs/myLib"
```
