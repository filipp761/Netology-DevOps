# Домашнее задание к занятию 13 «Введение в мониторинг»

## Обязательные задания

1. Вас пригласили настроить мониторинг на проект. На онбординге вам рассказали, что проект представляет из себя платформу для вычислений с выдачей текстовых отчётов, которые сохраняются на диск. 
Взаимодействие с платформой осуществляется по протоколу http. Также вам отметили, что вычисления загружают ЦПУ. Какой минимальный набор метрик вы выведите в мониторинг и почему?

<details>
<summary>Ответ</summary>

  * Для CPU нужно определить:
    * Задержка: средняя или максимальная задержка в планировщике CPU
    * Трафик: загрузка процессора
    * Ошибки: ошибки конкретного процессора, неисправные процессоры
   
  * Для устройства хранения:
    * Задержка: среднее время ожидания для операций чтения и записи
    * Трафик: чтение и запись уровней ввода/вывода
    * Ошибки: ошибки файловой системы, ошибки диска в /sys/devices
   
  * Приложения, обслуживающие клиентов, отслеживают по таким сигналам:
    * Задержка: время выполнения запросов
    * Трафик: количество запросов в секунду
    * Ошибки: ошибки приложения, возникающие при обработке клиентских запросов или доступе к ресурсам
    * Насыщение: процент или количество ресурсов, используемых в настоящее время
   
  * Метрики RAM

</details>

#
2. Менеджер продукта, посмотрев на ваши метрики, сказал, что ему непонятно, что такое RAM/inodes/CPUla. Также он сказал, что хочет понимать, насколько мы выполняем свои обязанности перед клиентами и какое качество обслуживания. Что вы можете ему предложить?

<details>
<summary>Ответ</summary>
    
Чтобы точно понимать выполнение обязанностей перед клиентами, надо изначально договрится какие показатели важны для клиента, для этого необходимо использовать метрики SLA, SLO и SLI:
    
- SLI (Service Level Indicator) — метрики времени (задержка запроса, пропускная способность, число запросов в секунду или число сбоев на запрос). Они, как правило, агрегируются во времени, а затем преобразуются в среднее или процент по отношению к пороговому значению;

- SLO (Service Level Objective) — целевые показатели совокупного успеха SLI в течение определенного периода времени (месяц, квартал и т.д.), согласованные заинтересованными сторонами.
  
- SLA (соглашение об уровне обслуживания) — это соглашение между поставщиком и клиентом об измеримых показателях, таких как время безотказной работы, время реагирования, а также мерах ответственности.
</details>

#
3. Вашей DevOps-команде в этом году не выделили финансирование на построение системы сбора логов. Разработчики, в свою очередь, хотят видеть все ошибки, которые выдают их приложения. Какое решение вы можете предпринять в этой ситуации, чтобы разработчики получали ошибки приложения?

<details>
<summary>Ответ</summary>
 Самый просто вариант, это просто написать скрипт который будет собирать логи и ошибки и отпрвлять их на общий ресурс. Из бесплатных готовых платформ: Sentry — это платформа для отслеживания ошибок и мониторинга приложений. Данные, которые мы получаем в Sentry, содержат исчерпывающую информацию о контексте, в котором это произошло, что облегчает воспроизведение и поиск причины и значительно помогает в устранении ошибок.   
</details>

#
4. Вы, как опытный SRE, сделали мониторинг, куда вывели отображения выполнения SLA = 99% по http-кодам ответов. 
Этот параметр вычисляется по формуле: summ_2xx_requests/summ_all_requests. Он не поднимается выше 70%, но при этом в вашей системе нет кодов ответа 5xx и 4xx. Где у вас ошибка?

<details>
<summary>Ответ</summary>
Ошибка в формуле расчета доступности, необходимо учитывать не только ответы с кодом 2xx, но и 3xx. Правильная формула расчета досупности (summ_2xx_requests + summ_3xx_requests) / (summ_all_requests)
</details>

#
5. Опишите основные плюсы и минусы pull и push систем мониторинга.
<details>
<summary>Ответ</summary>
    
* Push-модель (от англ. push - толкать) основана на принципе, что данные отправляются из источника в систему мониторинга. То есть, система мониторинга постоянно получает данные от устройств или других источников.

* Pull-модель (от англ. pull - тянуть) предполагает, что система мониторинга сама запрашивает данные у источников. То есть, система мониторит только те устройства, которые были выбраны для мониторинга, и запрашивает у них данные только тогда, когда это необходимо.

* Таким образом, push-модель обычно используется для мониторинга больших систем, где количество устройств может быть слишком большим для ручного сбора данных. Pull-модель же позволяет более гибко настраивать мониторинг, выбирая только необходимые устройства и данные, что экономит ресурсы системы мониторинга и обеспечивает более точное и своевременное обнаружение проблем.

* Кроме того, push-модели могут быть более эффективными в случаях, когда необходимо быстро реагировать на изменения в системе, так как данные поступают в систему автоматически. Однако, pull-модели могут быть предпочтительнее в случаях, когда требуется более точное обнаружение проблем и более детальный анализ данных.

#### Push-модель  
Плюсы:
- упрощение репликации данных в разные системы мониторинга или их резервные копии
- более гибкая настройка отправки пакетов данных с метриками
- UDP — это менее затратный способ передачи данных, из-за чего может возрасти производительность сбора метрик

Минусы:
- UDP не гарантирует доставку данных
- Необходимость проверки подлинности данных

#### Pull-модель  
Плюсы:
- легче контролировать подлинность данных
- можно настроить единый proxy server до всех агентов с TLS
- упрощённая отладка получения данных с агентов

Минусы:
- Открытие порта для сбора метрик на каждом узле
- Ведение списка узлов для мониторинга
</details>

#
6. Какие из ниже перечисленных систем относятся к push модели, а какие к pull? А может есть гибридные?
    - `Prometheus` - основной pull (push с помощью)
    - `TICK`  - основной push
    - `Zabbix`  - push и pull
    - `VictoriaMetrics`  - push и pull
    - `Nagios`  - основной pull (push с помощью плагина) 
#
7. Склонируйте себе [репозиторий](https://github.com/influxdata/sandbox/tree/master) и запустите TICK-стэк, 
используя технологии docker и docker-compose.

В виде решения на это упражнение приведите скриншот веб-интерфейса ПО chronograf (`http://localhost:8888`). 

P.S.: если при запуске некоторые контейнеры будут падать с ошибкой - проставьте им режим `Z`, например
`./data:/var/lib:Z`
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-01-base/img/chronograf.png)

#
8. Перейдите в веб-интерфейс Chronograf (http://localhost:8888) и откройте вкладку Data explorer.
        
    - Нажмите на кнопку Add a query
    - Изучите вывод интерфейса и выберите БД telegraf.autogen
    - В `measurments` выберите cpu->host->telegraf-getting-started, а в `fields` выберите usage_system. Внизу появится график утилизации cpu.
    - Вверху вы можете увидеть запрос, аналогичный SQL-синтаксису. Поэкспериментируйте с запросом, попробуйте изменить группировку и интервал наблюдений.

Для выполнения задания приведите скриншот с отображением метрик утилизации cpu из веб-интерфейса.
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-01-base/img/telegraf_getting_started_1.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-01-base/img/telegraf_getting_started_2.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-01-base/img/telegraf_getting_started_3.png)
#
9. Изучите список [telegraf inputs](https://github.com/influxdata/telegraf/tree/master/plugins/inputs). 
Добавьте в конфигурацию telegraf следующий плагин - [docker](https://github.com/influxdata/telegraf/tree/master/plugins/inputs/docker):
```
[[inputs.docker]]
  endpoint = "unix:///var/run/docker.sock"
```

Дополнительно вам может потребоваться донастройка контейнера telegraf в `docker-compose.yml` дополнительного volume и 
режима privileged:
```
  telegraf:
    image: telegraf:1.4.0
    privileged: true
    volumes:
      - ./etc/telegraf.conf:/etc/telegraf/telegraf.conf:Z
      - /var/run/docker.sock:/var/run/docker.sock:Z
    links:
      - influxdb
    ports:
      - "8092:8092/udp"
      - "8094:8094"
      - "8125:8125/udp"
```

После настройке перезапустите telegraf, обновите веб интерфейс и приведите скриншотом список `measurments` в 
веб-интерфейсе базы telegraf.autogen . Там должны появиться метрики, связанные с docker.
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/10-monitoring-01-base/img/telegraf_plugin_docker.png)

<details>
<summary>Конечный docker-compose.yaml:</summary>

```sh
version: '3'
services:
  influxdb:
    # Full tag list: https://hub.docker.com/r/library/influxdb/tags/
    build:
      context: ./images/influxdb/
      dockerfile: ./${TYPE}/Dockerfile
      args:
        INFLUXDB_TAG: ${INFLUXDB_TAG}
    image: "influxdb"
    volumes:
      # Mount for influxdb data directory
      - ./influxdb/data:/var/lib/influxdb
      # Mount for influxdb configuration
      - ./influxdb/config/:/etc/influxdb/
    ports:
      # The API for InfluxDB is served on port 8086
      - "8086:8086"
      - "8082:8082"
      # UDP Port
      - "8089:8089/udp"

  telegraf:
    # Full tag list: https://hub.docker.com/r/library/telegraf/tags/
    build:
      context: ./images/telegraf/
      dockerfile: ./${TYPE}/Dockerfile
      args:
        TELEGRAF_TAG: ${TELEGRAF_TAG}
    image: "telegraf"
    privileged: true
    user: telegraf:1001
    environment:
      HOSTNAME: "telegraf-getting-started"
    # Telegraf requires network access to InfluxDB
    links:
      - influxdb
    volumes:
      # Mount for telegraf configuration
      - ./telegraf/:/etc/telegraf/:Z
      # Mount for Docker API access
      - /var/run/docker.sock:/var/run/docker.sock:Z
    depends_on:
      - influxdb
    ports:
      - "8092:8092/udp"
      - "8094:8094"
      - "8125:8125/udp"

  kapacitor:
  # Full tag list: https://hub.docker.com/r/library/kapacitor/tags/
    build:
      context: ./images/kapacitor/
      dockerfile: ./${TYPE}/Dockerfile
      args:
        KAPACITOR_TAG: ${KAPACITOR_TAG}
    image: "kapacitor"
    volumes:
      # Mount for kapacitor data directory
      - ./kapacitor/data/:/var/lib/kapacitor:Z
      # Mount for kapacitor configuration
      - ./kapacitor/config/:/etc/kapacitor/:Z
    # Kapacitor requires network access to Influxdb
    links:
      - influxdb
    ports:
      # The API for Kapacitor is served on port 9092
      - "9092:9092"

  chronograf:
    # Full tag list: https://hub.docker.com/r/library/chronograf/tags/
    build:
      context: ./images/chronograf
      dockerfile: ./${TYPE}/Dockerfile
      args:
        CHRONOGRAF_TAG: ${CHRONOGRAF_TAG}
    image: "chrono_config"
    environment:
      RESOURCES_PATH: "/usr/share/chronograf/resources"
    volumes:
      # Mount for chronograf database
      - ./chronograf/data/:/var/lib/chronograf/
    links:
      # Chronograf requires network access to InfluxDB and Kapacitor
      - influxdb
      - kapacitor
    ports:
      # The WebUI for Chronograf is served on port 8888
      - "8888:8888"
    depends_on:
      - kapacitor
      - influxdb
      - telegraf

  documentation:
    build:
      context: ./documentation
    ports:
      - "3010:3000"

```
</details>
