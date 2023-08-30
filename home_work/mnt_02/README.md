# Руководство по установке Clickhouse и Vector

Данный playbook выполняет следующие действия

0. Загрузка необходимых дистрибутивов
1. Установка Clichouse сервера и ПО Vector
2. Создание базы данных Clickhouse
3. Установка Vector
4. Демонстрационная настройка Vector

## Запуск playbook-а

* Проверка

> ansible-playbook -i inventory/prod.yml site.yml --check

* Запуск

> ansible-playbook -i inventory/prod.yml site.yml --diff

## Используемые переменные

Файл переменных: [vars.yml](./group_vars/vars.yml) 

### Переменные

vector_version: "0.32.1"
clickhouse_version: "22.3.3.44"