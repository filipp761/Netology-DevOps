# Домашнее задание к занятию «Запуск приложений в K8S»

## Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Deployment с приложением, состоящим из нескольких контейнеров, и масштабировать его.

------

## Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключённым git-репозиторием.

------

## Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) Deployment и примеры манифестов.
2. [Описание](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) Init-контейнеров.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

## Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
   * Создал [Deployment](./scr/deployment.yaml)

![](img/kubectl_deployment_pod.png)

* **Возникшая ошибка**

![](img/error.png)

2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования.

![](img/kubectl_deployment_pod_2.png)

4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
   * Создал [Service](./scr/service.yaml)

![](img/service.png)

5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

   * Создал [Multitool](./scr/multitool.yaml)

![](img/curl.png)

------

## Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
   * Создал [Deployment](./scr/init.yaml)
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.

![](img/init_deployment.png)

3. Создать и запустить Service. Убедиться, что Init запустился.
   * Создал [Service](./src/service.yaml)

![](img/start_service.png)
  
4. Продемонстрировать состояние пода до и после запуска сервиса.

   * до
  
![](img/before_starting_the_service.png)

   * после
  
![](img/after_starting_the_service.png) 
