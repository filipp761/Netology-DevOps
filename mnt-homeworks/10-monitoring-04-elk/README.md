# Домашнее задание к занятию 15 «Система сбора логов Elastic Stack»

<details>
<summary>Дополнительные ссылки</summary>

При выполнении задания используйте дополнительные ресурсы:

- [поднимаем elk в docker](https://www.elastic.co/guide/en/elastic-stack-get-started/current/get-started-docker.html);
- [поднимаем elk в docker с filebeat и docker-логами](https://www.sarulabs.com/post/5/2019-08-12/sending-docker-logs-to-elasticsearch-and-kibana-with-filebeat.html);
- [конфигурируем logstash](https://www.elastic.co/guide/en/logstash/current/configuration.html);
- [плагины filter для logstash](https://www.elastic.co/guide/en/logstash/current/filter-plugins.html);
- [конфигурируем filebeat](https://www.elastic.co/guide/en/beats/libbeat/5.3/config-file-format.html);
- [привязываем индексы из elastic в kibana](https://www.elastic.co/guide/en/kibana/current/index-patterns.html);
- [как просматривать логи в kibana](https://www.elastic.co/guide/en/kibana/current/discover.html);
- [решение ошибки increase vm.max_map_count elasticsearch](https://stackoverflow.com/questions/42889241/how-to-increase-vm-max-map-count).

</details>

## Задание 1

Вам необходимо поднять в докере и связать между собой:

- elasticsearch (hot и warm ноды);
- logstash;
- kibana;
- filebeat.

Logstash следует сконфигурировать для приёма по tcp json-сообщений.
Filebeat следует сконфигурировать для отправки логов docker вашей системы в logstash.

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-04-elk/img/docker_compose.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-04-elk/img/Kibana.png)

## Задание 2

Перейдите в меню [создания index-patterns  в kibana](http://localhost:5601/app/management/kibana/indexPatterns/create) и создайте несколько index-patterns из имеющихся.

Перейдите в меню просмотра логов в kibana (Discover) и самостоятельно изучите, как отображаются логи и как производить поиск по логам.
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-04-elk/img/Kibana_Data_Views.png)

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-04-elk/img/index_paterns_1.png)

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-04-elk/img/index_paterns_2.png)
