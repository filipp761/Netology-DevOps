# Домашнее задание к занятию «Конфигурация приложений»

### Цель задания

В тестовой среде Kubernetes необходимо создать конфигурацию и продемонстрировать работу приложения.

------

### Чеклист готовности к домашнему заданию

1. Установленное K8s-решение (например, MicroK8s).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым GitHub-репозиторием.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/configuration/secret/) Secret.
2. [Описание](https://kubernetes.io/docs/concepts/configuration/configmap/) ConfigMap.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.
   * Создал [Deployment](./src/app_deployment.yaml)
2. Решить возникшую проблему с помощью ConfigMap.
   * Создал [ConfigMap](./src/configMap.yaml)
3. Продемонстрировать, что pod стартовал и оба конейнера работают.

![](img/kubectl_get_pod.png)

4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.
   * Создал [Service](./src/app_service.yaml)

![](img/configmap_curl.png)

------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.
   * Создал [Deployment](./src/nginx_deployment.yaml)
3. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.
   * Создал [ConfigMap](./src/configMap.yaml)
5. Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.
   * Создал сертификат `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=local.com"`
   * Создал [Secret](./src/secret.yaml)
7. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстировать доступ к приложению по HTTPS.
   * Создал [Ingress](./src/ingress_nginx.yaml)

![](img/secrets.png)
![](img/ingress.png)

------

### Правила приёма работы

1. Домашняя работа оформляется в своём GitHub-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода необходимых команд `kubectl`, а также скриншоты результатов.
3. Репозиторий должен содержать тексты манифестов или ссылки на них в файле README.md.

------
