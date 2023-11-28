# Домашнее задание к занятию «Базовые объекты K8S»

## Цель задания

В тестовой среде для работы с Kubernetes, установленной в предыдущем ДЗ, необходимо развернуть Pod с приложением и подключиться к нему со своего локального компьютера. 

------

## Чеклист готовности к домашнему заданию

1. Установленное k8s-решение (например, MicroK8S).
2. Установленный локальный kubectl.
3. Редактор YAML-файлов с подключенным Git-репозиторием.

------

## Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Описание [Pod](https://kubernetes.io/docs/concepts/workloads/pods/) и примеры манифестов.
2. Описание [Service](https://kubernetes.io/docs/concepts/services-networking/service/).

------

## Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
   * Создал манифест [pod.yaml](hello-world.yaml) и применил
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).
   * Подключился локально к Pod

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/kuber-homeworks/1.2/img/hello_world.png)

------

## Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
   * [pod.yaml](netology-web.yaml)
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
   * [svc.yaml](netology-svc.yaml)
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).
   * Подключился локально к Service

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/kuber-homeworks/1.2/img/svc_port_forward.png)

**Cкриншот вывода команды `kubectl get pods`**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/kuber-homeworks/1.2/img/get_pod.png)

## Правила приёма работы

1. Домашняя работа оформляется в своем Git-репозитории в файле README.md. Выполненное домашнее задание пришлите ссылкой на .md-файл в вашем репозитории.
2. Файл README.md должен содержать скриншоты вывода команд `kubectl get pods`, а также скриншот результата подключения.
3. Репозиторий должен содержать файлы манифестов и ссылки на них в файле README.md.
