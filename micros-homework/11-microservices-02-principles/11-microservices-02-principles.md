# Домашнее задание к занятию "11.02 Микросервисы: принципы"

Вы работаете в крупной компании, которая строит систему на основе микросервисной архитектуры.
Вам как DevOps-специалисту необходимо выдвинуть предложение по организации инфраструктуры для разработки и эксплуатации.

## Задача 1: API Gateway 

<details>
<summary>Задание</summary>

Предложите решение для обеспечения реализации API Gateway. Составьте сравнительную таблицу возможностей различных программных решений. На основе таблицы сделайте выбор решения.

Решение должно соответствовать следующим требованиям:
- маршрутизация запросов к нужному сервису на основе конфигурации,
- возможность проверки аутентификационной информации в запросах,
- обеспечение терминации HTTPS.
</details>

### Сравнительная таблица возможностей различных API Gateway

| API geteway | Обеспечение терминации HTTPS | Возможность проверки аутентификационной информации в запросах | Маршрутизация запросов к нужному сервису на основе конфигурации | Итеграция с облаком |
| ------------- |:-------------|:-----|:---|:---|
| Amazon API Gateway |+|+|AWS Lambda|AWS|
| Microsoft Azure API Management |+|+|AWS Lambda|AWS|
| IBM API Connect |+|+|AWS Lambda|AWS|
| Apigee Edge Microgateway |+|+|AWS Lambda|AWS|
| MuleSoft Anypoint Platform |+|+|AWS Lambda|AWS|
| Tyk |+|+|AWS Lambda|AWS|
| Express Gateway |+|+|AWS Lambda|AWS|
| KrakenD |+|+|AWS Lambda|AWS|
| Netflix Zuul |+|+|AWS Lambda|AWS|
| Oracle |+|+|AWS Lambda|AWS|
| NGINX Plus |+|+|AWS Lambda|AWS|
| Spring Cloud Gateway |+|+|AWS Lambda|AWS|
| WSO2 API Manager |+|+|AWS Lambda|AWS|
| Red Hat 3scale APIcast API Gateway |+|+|AWS Lambda|AWS|
| Gravitee |+|+|AWS Lambda|AWS|
| Kong Enterprise Edition |+|+|AWS Lambda|AWS|

## Задача 2: Брокер сообщений

<details>
<summary>Задание</summary>

Составьте таблицу возможностей различных брокеров сообщений. На основе таблицы сделайте обоснованный выбор решения.

Решение должно соответствовать следующим требованиям:
- поддержка кластеризации для обеспечения надёжности,
- хранение сообщений на диске в процессе доставки,
- высокая скорость работы,
- поддержка различных форматов сообщений,
- разделение прав доступа к различным потокам сообщений,
- простота эксплуатации.
</details>

| Брокер сообщений | Поддержка кластеризации | Хранение сообщений на диске | Высокая скорость работы | Поддержка различных форматов сообщений | Разделение прав доступа | Простота эксплуатации |
| --- | --- | --- | --- | --- | --- | --- |
| Apache Kafka | + | + | + | + | + | +- |
| RabbitMQ | + | + | + | STOMP, AMQP, MQTT | + | + |
| Redis | + | +- | + | + | + | + |
| ActiveMQ | + | + | + | OpenWire, STOMP, AMQP, MQTT, JMS | + | + |

**Выводы**:  
`Apache Kafka` - является наиболее популярным продуктом с большим сообществом и высокой призводительностью. `Redis` - имеет наибольшую популярность как база данных для хранения `горячих` данных (InMemory database). `RabbitMQ` - простой в использовании, но имеет меньшую гибкость в использовании чем `Apache Kafka`

## Задача 3: API Gateway * (необязательная)

<details>
<summary>Задание</summary>

### Есть три сервиса:

**minio**
- хранит загруженные файлы в бакете images,
- S3 протокол,

**uploader**
- принимает файл, если картинка сжимает и загружает его в minio,
- POST /v1/upload,

**security**
- регистрация пользователя POST /v1/user,
- получение информации о пользователе GET /v1/user,
- логин пользователя POST /v1/token,
- проверка токена GET /v1/token/validation.

### Необходимо воспользоваться любым балансировщиком и сделать API Gateway:

**POST /v1/register**
1. Анонимный доступ.
2. Запрос направляется в сервис security POST /v1/user.

**POST /v1/token**
1. Анонимный доступ.
2. Запрос направляется в сервис security POST /v1/token.

**GET /v1/user**
1. Проверка токена. Токен ожидается в заголовке Authorization. Токен проверяется через вызов сервиса security GET /v1/token/validation/.
2. Запрос направляется в сервис security GET /v1/user.

**POST /v1/upload**
1. Проверка токена. Токен ожидается в заголовке Authorization. Токен проверяется через вызов сервиса security GET /v1/token/validation/.
2. Запрос направляется в сервис uploader POST /v1/upload.

**GET /v1/user/{image}**
1. Проверка токена. Токен ожидается в заголовке Authorization. Токен проверяется через вызов сервиса security GET /v1/token/validation/.
2. Запрос направляется в сервис minio GET /images/{image}.

### Ожидаемый результат

Результатом выполнения задачи должен быть docker compose файл, запустив который можно локально выполнить следующие команды с успешным результатом.
Предполагается, что для реализации API Gateway будет написан конфиг для NGinx или другого балансировщика нагрузки, который будет запущен как сервис через docker-compose и будет обеспечивать балансировку и проверку аутентификации входящих запросов.
Авторизация
curl -X POST -H 'Content-Type: application/json' -d '{"login":"bob", "password":"qwe123"}' http://localhost/token

**Загрузка файла**

curl -X POST -H 'Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJib2IifQ.hiMVLmssoTsy1MqbmIoviDeFPvo-nCd92d4UFiN2O2I' -H 'Content-Type: octet/stream' --data-binary @yourfilename.jpg http://localhost/upload

**Получение файла**
curl -X GET http://localhost/images/4e6df220-295e-4231-82bc-45e4b1484430.jpg

---

#### [Дополнительные материалы: как запускать, как тестировать, как проверить](https://github.com/netology-code/devkub-homeworks/tree/main/11-microservices-02-principles)

</details>
