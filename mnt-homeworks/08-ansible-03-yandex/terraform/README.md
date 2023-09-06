# Домашнее задание к занятию  3 «Использование Ansible»

### Подготовка к выполнению

1. Подготовьте в Yandex Cloud три хоста: для `clickhouse`, для `vector` и для `lighthouse`.
2. Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse).

<details>
<summary>Задание</summary>
## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.
2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.
3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.
4. Подготовьте свой inventory-файл `prod.yml`.
5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.
6. Попробуйте запустить playbook на этом окружении с флагом `--check`.
7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.
8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.
9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.
10. Готовый playbook выложите в свой репозиторий, поставьте тег `08-ansible-03-yandex` на фиксирующий коммит, в ответ предоставьте ссылку на него.
</details>


### Инфраструктура:

* Инфраструктура разворачивается с помощью `Terraform` (разворачиваются 3 ВМ). Проект terraform: [terrafrom](/assets/08-ansible-03-yandex/terraform/) 
* Файл inventory генерируется автоматически, с помощью файла [hosts.tftpl](hosts.tftpl)
* После выполнения команды `terraform apply` будет создано 3 ВМ и выведены их hostname и IP-адрес
1. vector-01
2. clickhouse-01
3. lighthouse-01

### Playbook
Playbook производит настройку трех ВМ:  
- `vector-01` - для сбора логов на сервере и передачу на сервер Сlickhouse
- `clickhouse-01` - для разворачивания БД ClickHouse и хранения логов
- `lighthouse-01` - для отображения логов из ClickHouse

### Variables
Значения переменных устанавливаются в файлах `vars.yml` в соответствующих директориях в `group_vars`  
Требуется задать следующие параметры:
- `clickhouse_version`, `vector_version` - версии устанавливаемых приложений;
- `clickhouse_database_name` - имя базы данных в `clickhouse`;
- `clickhouse_create_table_name` - имя таблицы в `clickhouse`;
- `vector_config` - содержимое конфигурационного файла для приложения `vector`;
- `lighthouse_home_dir` - домашняя директория `lighthouse` 
- `nginx_config_dir` - директория расположения конфига `nginx`
---

### Tags

`ping` - Проверяет доступность серверов  
`clickhouse` - производит полную конфигурацию сервера `clickhouse-01`;  
`vector` - производит полную конфигурацию сервера `vector-01`;  
`vector_config` - производит изменение в конфиге приложения `vector`;  
`lighthouse` - производит полную конфигурацию сервера `lighthouse-01`
