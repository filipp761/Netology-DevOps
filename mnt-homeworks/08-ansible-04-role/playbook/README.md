# Домашнее задание к занятию 4 «Работа с roles»

#### Доп. материалы
- Репозиторий LightHouse находится [по ссылке](https://github.com/VKCOM/lighthouse)
- [LightHouse](https://youtu.be/ymlrNlaHzIY?t=929)

<details>
<summary>Требования</summary>

1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.11.0"
       name: clickhouse 
   ```

2. При помощи `ansible-galaxy` скачайте себе эту роль.
3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 
5. Перенести нужные шаблоны конфигов в `templates`.
6. Опишите в `README.md` обе роли и их параметры. Пример качественной документации ansible role [по ссылке](https://github.com/cloudalchemy/ansible-prometheus).
7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.
</details>


### Инфраструктура:

* Инфраструктура разворачивается с помощью `Terraform` (разворачиваются 3 ВМ). Проект terraform: [terraform](https://github.com/filipp761/Netology-DevOps/tree/main/mnt-homeworks/08-ansible-03-yandex/terraform) 
* Файл inventory генерируется автоматически, с помощью файла [hosts.tftpl](hosts.tftpl)
* После выполнения команды `terraform apply` будет создано 3 ВМ и выведены их hostname и IP-адрес
1. vector
2. clickhouse
3. lighthouse

### Playbook
Playbook производит настройку трех ВМ:  
- `vector-01` - для сбора логов на сервере и передачу на сервер Сlickhouse
- `clickhouse-01` - для разворачивания БД ClickHouse и хранения логов
- `lighthouse-01` - для отображения логов из ClickHouse

[site.yml](https://github.com/filipp761/Netology-DevOps/blob/main/mnt-homeworks/08-ansible-04-role/playbook/terrafrom/ansible/site.yml)

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
`clickhouse` - производит полную конфигурацию сервера `clickhouse-01`;  
`vector` - производит полную конфигурацию сервера `vector-01`;  
`vector_config` - производит изменение в конфиге приложения `vector`;  
`lighthouse` - производит полную конфигурацию сервера `lighthouse-01`

### Requirements
------------
- [clickhouse](https://github.com/filipp761/Clickhouse-role.git) - роль для установки приложения `clickhouse`  
- [vector-role](https://github.com/filipp761/Vector-role.git) - роль для установки приложения `vector`  
- [lighthouse-role](https://github.com/filipp761/Lighthouse-role.git) - роль для установки приложения `lighthouse`

Установка зависимостей:  
`ansible-galaxy install -r requirements.yml -p roles`
