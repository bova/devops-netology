# Домашнее задание к занятию 1. «Введение в виртуализацию. Типы и функции гипервизоров. Обзор рынка вендоров и областей применения»

## Задача 1

**Опишите кратко, в чём основное отличие полной (аппаратной) виртуализации, паравиртуализации и виртуализации на основе ОС.**

Аппаратная виртуализация полностью эмулирует окружение. Гостевая ОС выполняется без изменений и ничего не знает про виртуализацию

При паравиртуализации необходимо модифицировать гостевую ОС для выполнения в виртуальной среде. При выполении гостевая ОС знает что она в виртуальной среде, чем достигается большая производительность и эффективность виртуализации.

Виртуализация на основе ОС - контейнеризация. Выполнение ВМ в самом ядре гипервизора. 


## Задача 2

**Выберите один из вариантов использования организации физических серверов в зависимости от условий использования.**

Организация серверов:

* физические сервера,
* паравиртуализация,
* виртуализация уровня ОС.

**Условия использования:**

1. высоконагруженная база данных, чувствительная к отказу;

Физический сервер. Так как нужна максимальная производительность, а любая виртуализация имеем накладные расходы.

2. различные web-приложения;

Виртуализация уровня ОС. Для оптимального использования ресурсов.

3. Windows-системы для использования бухгалтерским отделом;

Паравиртуализация. Для оптимального использования ресурсов и удобства экслуатации

4. системы, выполняющие высокопроизводительные расчёты на GPU.

Физический сервер. Производительность


## Задача 3

**Выберите подходящую систему управления виртуализацией для предложенного сценария. Детально опишите ваш выбор.**

**Сценарии:**

1. 100 виртуальных машин на базе Linux и Windows, общие задачи, нет особых требований. Преимущественно Windows based-инфраструктура, требуется реализация программных балансировщиков нагрузки, репликации данных и автоматизированного механизма создания резервных копий.

VMWare. Исходя из требований необходим коммерческий продукт с продвинутыми функциями и поддержкой. VMWare - стандарт де-факто.

2. Требуется наиболее производительное бесплатное open source-решение для виртуализации небольшой (20-30 серверов) инфраструктуры на базе Linux и Windows виртуальных машин.

Xen. Поддерживает паравиртуализацию, что дает производительность. Стабильный продукт

3. Необходимо бесплатное, максимально совместимое и производительное решение для виртуализации Windows-инфраструктуры.

Microsoft Hyper-V. Бесплатное решение, максимально совместимое с ОС Windows. Простота использования, низкий порог вхождения

4. Необходимо рабочее окружение для тестирования программного продукта на нескольких дистрибутивах Linux.

KVM. Полная виртуализация позволит выполнять различные гостевые ОС.


## Задача 4

**Опишите возможные проблемы и недостатки гетерогенной среды виртуализации (использования нескольких систем управления виртуализацией одновременно) и что необходимо сделать для минимизации этих рисков и проблем. Если бы у вас был выбор, создавали бы вы гетерогенную среду или нет? Мотивируйте ваш ответ примерами.**

Недостатки гетерогенной системы

* Сложнее масштабировать
* Проблемы с переносом ВМ из одной системы в другую
* Необходимо наличие специалистов на каждую систему виртуализации
* Если коммерческие системы: расходы на тех.поддержку каждому вендору

Для преодоления этих проблем необходимо использовать надстройку, которая будет работать поверх гипервизоров. OpenStack
Я бы использовал гетерогенную виртуализацию. Платные гипервизоры для критичных систем. Бесплатные для тестовых сред. Также бесплатные гипервизоры хороши для "прокачивания" экспертизы.