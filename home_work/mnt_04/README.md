# Руководство по установке Clickhouse, Vector & Lighthouse

Данный playbook выполняет следующие действия

0. Загрузка необходимых дистрибутивов (Clickhouse, Vector & Lighthouse)
1. Установка Clickhouse сервера
2. Создание базы данных Clickhouse
3. Установка Vector
4. Демонстрационная настройка Vector
5. Установка Nginx
6. Настройка Nginx на исходный код Lighthouse

## Запуск playbook-а

* Проверка

> ansible-playbook -i inventory/prod.yml site.yml --check

* Запуск

> ansible-playbook -i inventory/prod.yml site.yml --diff

## Используемые переменные

Файл переменных для группы хостов Clickhouse: [clickhouse/vars.yml](./group_vars/clickhouse/vars.yml) 
Файл переменных для группы хостов Vector: [vector/vars.yml](./group_vars/vector/vars.yml) 

### Переменные

* vector_version: "0.32.1"
* clickhouse_version: "22.3.3.44"