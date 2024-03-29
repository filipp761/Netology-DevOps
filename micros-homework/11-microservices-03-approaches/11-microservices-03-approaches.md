# Домашнее задание к занятию "11.03 Микросервисы: подходы"

## Задача 1: Обеспечить разработку

<details>
<summary>Задание</summary>
  
Предложите решение для обеспечения процесса разработки: хранение исходного кода, непрерывная интеграция и непрерывная поставка. 
Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.

Решение должно соответствовать следующим требованиям:
- облачная система;
- система контроля версий Git;
- репозиторий на каждый сервис;
- запуск сборки по событию из системы контроля версий;
- запуск сборки по кнопке с указанием параметров;
- возможность привязать настройки к каждой сборке;
- возможность создания шаблонов для различных конфигураций сборок;
- возможность безопасного хранения секретных данных (пароли, ключи доступа);
- несколько конфигураций для сборки из одного репозитория;
- кастомные шаги при сборке;
- собственные докер-образы для сборки проектов;
- возможность развернуть агентов сборки на собственных серверах;
- возможность параллельного запуска нескольких сборок;
- возможность параллельного запуска тестов.
</details>

____

### Ответ:
Если мы говорим про необходимость облачность системы, то лучшим вариантом является `Kubernetes`, если есть средства то можно использовать `OpenShift` от Red Hat. Для остальных требований подойдет `GitLab`. Связка `Kubernetes` + `GitLab` решает много вопросов на этапе разработки. А для хранения секретов я бы предложил использовать Vault.


## Задача 2: Логи

<details>
<summary>Задание</summary>
Предложите решение для обеспечения сбора и анализа логов сервисов в микросервисной архитектуре.
Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.

Решение должно соответствовать следующим требованиям:
- сбор логов в центральное хранилище со всех хостов, обслуживающих систему;
- минимальные требования к приложениям, сбор логов из stdout;
- гарантированная доставка логов до центрального хранилища;
- обеспечение поиска и фильтрации по записям логов;
- обеспечение пользовательского интерфейса с возможностью предоставления доступа разработчикам для поиска по записям логов;
- возможность дать ссылку на сохранённый поиск по записям логов.  
</details>

### Ответ:
Лучшим решением для сбора и хранения логов является стек ELK. На данный момент самое распространенное решение, простое в настройке, легко масштабируемое, удобное в использование (имеется ввиду Kibana), имеет возможность обвесить Kibana всевозможными расширениями функционала, единственный минус как по мне, это очень большая дороговизна по ресурсам, кластер Elasticsearch будет просить от нас много. Для более простых систем будет неплохим вариантои будет являться связка `Vector` + `Clickhouse`.

## Задача 3: Мониторинг
<details>
<summary>Задание</summary>  
Предложите решение для обеспечения сбора и анализа состояния хостов и сервисов в микросервисной архитектуре.
Решение может состоять из одного или нескольких программных продуктов и должно описывать способы и принципы их взаимодействия.

Решение должно соответствовать следующим требованиям:
- сбор метрик со всех хостов, обслуживающих систему;
- сбор метрик состояния ресурсов хостов: CPU, RAM, HDD, Network;
- сбор метрик потребляемых ресурсов для каждого сервиса: CPU, RAM, HDD, Network;
- сбор метрик, специфичных для каждого сервиса;
- пользовательский интерфейс с возможностью делать запросы и агрегировать информацию;
- пользовательский интерфейс с возможностью настраивать различные панели для отслеживания состояния системы.
</details>

### Ответ:

Для сбора и визуализации метрик лучшим вариантом будет `Prometheus`. Примущества в том что Prometeus более гибко настраивается, сам собирает метрики ровно столько сколько "считает нужным", хранит данные в TSDB, его можно легко маштабировать. Для визуализации метрик использовать - средство визуализация Grafana обладает мощным визуализационным функционалом, позволяте гибко настривать графики и алерты.
