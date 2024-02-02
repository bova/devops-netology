# Домашнее задание к занятию «Микросервисы: подходы»

## Задача 1: Обеспечить разработку

Предложите решение для обеспечения процесса разработки: хранение исходного кода, непрерывная интеграция и непрерывная поставка. Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.


**Решение:** 

Gitlab

**Обоснование:**

* запуск сборки по событию из системы контроля версий; - **GitLab CI/CD**
* собственные докер-образы для сборки проектов; - **GitLab container registry**
* возможность развернуть агентов сборки на собственных серверах; - **GitLab Runner**


## Задача 2: Логи

Предложите решение для обеспечения сбора и анализа логов сервисов в микросервисной архитектуре. Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.

**Решение:**

ELK

**Обоснование:**

* сбор логов в центральное хранилище со всех хостов, обслуживающих систему; - **Elasticsearch**
* минимальные требования к приложениям, сбор логов из stdout; - **Filebeat**
* гарантированная доставка логов до центрального хранилища; 
* обеспечение поиска и фильтрации по записям логов; - **Kibana**
* обеспечение пользовательского интерфейса с возможностью предоставления доступа разработчикам для поиска по записям логов; - **Kibana**
* возможность дать ссылку на сохранённый поиск по записям логов. - **Kibana**


## Задача 3: Мониторинг

Предложите решение для обеспечения сбора и анализа состояния хостов и сервисов в микросервисной архитектуре. Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.

Решение должно соответствовать следующим требованиям:

**Решение:** 

Prometheus + Grafana

**Обоснование:**

* сбор метрик со всех хостов, обслуживающих систему; - **kube-state-metrics**
* сбор метрик состояния ресурсов хостов: CPU, RAM, HDD, Network; - **kube-state-metrics**
* сбор метрик потребляемых ресурсов для каждого сервиса: CPU, RAM, HDD, Network; - **Autodiscover**
* сбор метрик, специфичных для каждого сервиса; - **node exporters**
* пользовательский интерфейс с возможностью делать запросы и агрегировать информацию; - **Grafana**
* пользовательский интерфейс с возможностью настраивать различные панели для отслеживания состояния системы. - **Grafana**