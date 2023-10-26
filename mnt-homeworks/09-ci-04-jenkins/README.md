# Домашнее задание к занятию 10 «Jenkins»

## Подготовка к выполнению

1. Создать два VM: для jenkins-master и jenkins-agent.
2. Установить Jenkins при помощи playbook.
3. Запустить и проверить работоспособность.
4. Сделать первоначальную настройку.

* **Установка Jenkins при помощи playbook**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/playbook.png)

* **Запуск Jenkins**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/Jenkins.png)

* **Настройка агента**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/Configure_agent.png)

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/Nods.png)

## Основная часть

<details>
<summary>Требования</summary>

1. Сделать Freestyle Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
2. Сделать Declarative Pipeline Job, который будет запускать `molecule test` из любого вашего репозитория с ролью.
3. Перенести Declarative Pipeline в репозиторий в файл `Jenkinsfile`.
4. Создать Multibranch Pipeline на запуск `Jenkinsfile` из репозитория.
5. Создать Scripted Pipeline, наполнить его скриптом из [pipeline](./pipeline).
6. Внести необходимые изменения, чтобы Pipeline запускал `ansible-playbook` без флагов `--check --diff`, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами `--check --diff`.
7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл `ScriptedJenkinsfile`.
8. Отправить ссылку на репозиторий с ролью и Declarative Pipeline и Scripted Pipeline.
</details>

* **All Jobs**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/AllJobs.png)

* **Freestyle Job**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/FreestyleJob.png)
* **DeclarativePipeline**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/DeclarativePipelineConfig.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/DeclarativePipeline_Stage_View.png)
* **Multibranch**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/MiltiBranch.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/MiltiBranch2.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/MiltiBranch3.png)
* **ScriptedPipeline**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/ScriptedJob.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/ScriptedJob2.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/ScriptedJob_Stage_View.png)

* **Материалы**

[vector-role](https://github.com/filipp761/vector-role-molecule.git)

[FreestyleJob](FreesyleJob)

[DeclarativeJenkinsfile](DeclarativeJenkinsfile)

[ScriptedJob](ScriptedJob)

### Возникшие ошибки и вопросы

* **При первоначальном подключении агента, пришлось в ручную одобрять выполение скрипта, так и должно быть**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/Error.png)

* **При смене IP-адреса у агента или подключении нового выдает ошибку запуска агента, я так понял это из-за файла knows_hosts, не очень понял как прописывать туда новые агенты**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-04-jenkins/img/Error2.png)

* **Также при выполнении задания ScriptedJob, при запуске playbook на установку java, выдавала ошибку при повышении прав, просило ввести пароль sudo, решил только путь добавления записи на агенте, чтобы не просил пароль**

* **Также не удалось подключиться к github через ssh, поэтому подключал через https, попытаюсь разобраться сам**
