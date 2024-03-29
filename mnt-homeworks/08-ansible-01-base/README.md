# Домашнее задание к занятию 1 «Введение в Ansible»

## Подготовка к выполнению

1. Установите Ansible версии 2.10 или выше.
2. Создайте свой публичный репозиторий на GitHub с произвольным именем.
3. Скачайте [Playbook](./playbook/) из репозитория с домашним заданием и перенесите его в свой репозиторий.

## Основная часть

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.
3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.
4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.
5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.
6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.
7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.
9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.
10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.
11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.
12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.

## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.
2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.
3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.
4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).
5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
6. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.

----
### Ответ
* **Установка Ansible**
```bash
#Add Ansible repository
sudo apt-add-repository ppa:ansible/ansible

#Run the update command
sudo apt-get update

#Install Ansible package
sudo apt-get install ansible

#Check Ansible Version
ansible -version
```
* **1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/01.png)

* **2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на all default fact.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/02.png)
  
* **3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.**
```
docker pull ubuntu
docker pull centos
```
По-умолчанию в них нет python, поэтому его необходимо установить.

**Для Centos7**

При установке пакетов для Centos7 выдало данную ошибку
```
[root@mail ~]# yum update
CentOS Linux 8 - AppStream   116  B/s |  38  B     00:00
Ошибка: Не удалось загрузить метаданные для репозитория «appstream»: Cannot prepare internal mirrorlist: No URLs in mirrorlist
```

Чтоб решить проблему с скачиванием нужных пакетов из официальных репозиториев, 
нужно перенаправить свои репозитории /etc/yum.repos.d/ на http://vault.centos.org вместо http://mirror.centos.org. 
Делается это следующим образом:
```
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
```
Далее пакеты устанавливаются в обычном порядке.

**Для Ubuntu**

Установить Python для Ubuntu гораздо проще
```
sudo apt install python3.9
```
* **4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/04.png)

* **5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.**

* **6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/06.png)

* **7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.**
```
ansible-vault encrypt deb/examp.yml
ansible-vault encrypt em/examp.yml
```
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/vault_deb.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/vault_el.png)

* **8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/08.png)
  
* **9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.**
 ansible-doc -t connection -l
 <br>Подойдет плагин <b>local</b>
* **10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.**

* **11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/11.png)

https://github.com/filipp761/Netology-DevOps/tree/main/mnt-homeworks/08-ansible-01-base

## Необязательная часть

* **1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.**
```
ansible-vault decrypt group_vars/deb/examp.yml
ansible-vault decrypt group_vars/el/examp.yml 
```
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/dop_01.png)

* **2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.**
```
 ansible-vault encrypt_string 'PaSSw0rd'
```
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/encrypt_string.png)

* **3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/dop_03.png)

* **4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/08-ansible-01-base/img/dop_05.png)


