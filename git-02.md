# Домашнее задание к занятию «Основы Git»

### Цель задания

В результате выполнения задания вы:

* научитесь работать с Git, как с распределённой системой контроля версий; 
* сможете создавать и настраивать репозиторий для работы в GitHub, GitLab и Bitbucket; 
* попрактикуетесь работать с тегами;
* поработаете с Git при помощи визуального редактора.

### Чеклист готовности к домашнему заданию

1. Установлена консольная утилита для работы с Git.
2. Есть возможность зарегистрироваться на GitHub, GitLab.
3. Регистрация на Bitbucket не является обязательной. 


### Инструкция к заданию

1. В личном кабинете отправьте на проверку ссылки на ваши репозитории.
2. Любые вопросы по решению задач задавайте в чате учебной группы.

------

## Задание 1. Знакомимся с GitLab и Bitbucket 

Из-за сложности доступа к Bitbucket в работе достаточно использовать два репозитория: GitHub и GitLab.

Иногда при работе с Git-репозиториями надо настроить свой локальный репозиторий так, чтобы можно было 
отправлять и принимать изменения из нескольких удалённых репозиториев. 

Это может понадобиться при работе над проектом с открытым исходным кодом, если автор проекта не даёт права на запись в основной репозиторий.

Также некоторые распределённые команды используют такой принцип работы, когда каждый разработчик имеет свой репозиторий, а в основной репозиторий пушатся только конечные результаты 
работы над задачами. 

### GitLab

Создадим аккаунт в GitLab, если у вас его ещё нет:

1. GitLab. Для [регистрации](https://gitlab.com/users/sign_up)  можно использовать аккаунт Google, GitHub и другие. 
2. После регистрации или авторизации в GitLab создайте новый проект, нажав на ссылку `Create a projet`. 
Желательно назвать также, как и в GitHub — `devops-netology` и `visibility level`, выбрать `Public`.
3. Галочку `Initialize repository with a README` лучше не ставить, чтобы не пришлось разрешать конфликты.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_Create_Project_GitLab.png)

4. Если вы зарегистрировались при помощи аккаунта в другой системе и не указали пароль, то увидите сообщение:
`You won't be able to pull or push project code via HTTPS until you set a password on your account`. 
Тогда перейдите [по ссылке](https://gitlab.com/profile/password/edit) из этого сообщения и задайте пароль. 
Если вы уже умеете пользоваться SSH-ключами, то воспользуйтесь этой возможностью (подробнее про SSH мы поговорим в следующем учебном блоке).
5. Перейдите на страницу созданного вами репозитория, URL будет примерно такой:
https://gitlab.com/YOUR_LOGIN/devops-netology. Изучите предлагаемые варианты для начала работы в репозитории в секции
`Command line instructions`. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_Command_line_instructions.png)

6. Запомните вывод команды `git remote -v`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_git_remote.png)

7. Из-за того, что это будет наш дополнительный репозиторий, ни один вариант из перечисленных в инструкции (на странице 
вновь созданного репозитория) нам не подходит. Поэтому добавляем этот репозиторий, как дополнительный `remote`, к созданному
репозиторию в рамках предыдущего домашнего задания:
`git remote add gitlab https://gitlab.com/YOUR_LOGIN/devops-netology.git`.

```script bash
 git remote add gitlab git@gitlab.com:filipp761/devops-netology.git
```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_remote_add.png)

8. Отправьте изменения в новый удалённый репозиторий `git push -u gitlab main`.

```script bash
 git push -u gitlab main
```

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_push_gitlab.png)
 
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_gitlab.png)

9. Обратите внимание, как изменился результат работы команды `git remote -v`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_remote_add.png)

#### Как изменить видимость репозитория в  GitLab — сделать его публичным 

* На верхней панели выберите «Меню» -> «Проекты» и найдите свой проект.
* На левой боковой панели выберите «Настройки» -> «Основные».
* Разверните раздел «Видимость» -> «Функции проекта» -> «Разрешения».
* Измените видимость проекта на Public.
* Нажмите «Сохранить изменения».

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_visibility_project.png)

### Bitbucket* (задание со звёздочкой) 

Это самостоятельное задание, его выполнение необязательно.
____

Теперь необходимо проделать всё то же самое с [Bitbucket](https://bitbucket.org/). 

1. Обратите внимание, что репозиторий должен быть публичным — отключите галочку `private repository` при создании репозитория.
2. На вопрос `Include a README?` отвечайте отказом. 
3. В отличии от GitHub и GitLab в Bitbucket репозиторий должен принадлежать проекту, поэтому во время создания репозитория 
надо создать и проект, который можно назвать, например, `netology`.
4. Аналогично GitLab на странице вновь созданного проекта выберите `https`, чтобы получить ссылку, и добавьте этот репозиторий, как 
`git remote add bitbucket ...`.
5. Обратите внимание, как изменился результат работы команды `git remote -v`.

Если всё проделано правильно, то результат команды `git remote -v` должен быть следующий:

```bash
$ git remote -v
bitbucket https://andreyborue@bitbucket.org/andreyborue/devops-netology.git (fetch)
bitbucket https://andreyborue@bitbucket.org/andreyborue/devops-netology.git (push)
gitlab	  https://gitlab.com/andrey.borue/devops-netology.git (fetch)
gitlab	  https://gitlab.com/andrey.borue/devops-netology.git (push)
origin	  https://github.com/andrey-borue/devops-netology.git (fetch)
origin	  https://github.com/andrey-borue/devops-netology.git (push)
```

Дополнительно можете добавить удалённые репозитории по `ssh`, тогда результат будет примерно такой:

```bash
git remote -v
bitbucket	git@bitbucket.org:andreyborue/devops-netology.git (fetch)
bitbucket	git@bitbucket.org:andreyborue/devops-netology.git (push)
bitbucket-https	https://andreyborue@bitbucket.org/andreyborue/devops-netology.git (fetch)
bitbucket-https	https://andreyborue@bitbucket.org/andreyborue/devops-netology.git (push)
gitlab	git@gitlab.com:andrey.borue/devops-netology.git (fetch)
gitlab	git@gitlab.com:andrey.borue/devops-netology.git (push)
gitlab-https	https://gitlab.com/andrey.borue/devops-netology.git (fetch)
gitlab-https	https://gitlab.com/andrey.borue/devops-netology.git (push)
origin	git@github.com:andrey-borue/devops-netology.git (fetch)
origin	git@github.com:andrey-borue/devops-netology.git (push)
origin-https	https://github.com/andrey-borue/devops-netology.git (fetch)
origin-https	https://github.com/andrey-borue/devops-netology.git (push)
```

Выполните push локальной ветки `main` в новые репозитории. 

Подсказка: `git push -u gitlab main`. На этом этапе история коммитов во всех трёх репозиториях должна совпадать. 

## Задание 2. Теги

Представьте ситуацию, когда в коде была обнаружена ошибка — надо вернуться на предыдущую версию кода,
исправить её и выложить исправленный код в продакшн. Мы никуда не будем выкладывать код, но пометим некоторые коммиты тегами и создадим от них ветки. 

1. Создайте легковестный тег `v0.0` на HEAD-коммите и запуште его во все три добавленных на предыдущем этапе `upstream`.

```script bash
git tag -a v0.0 -m 'tag v0.0'
```

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_tags_v0.png)
 
2. Аналогично создайте аннотированный тег `v0.1`.

```script bash
git tag v0.1'
```

Просмотр наличия созданных тегов

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_tag.png)
 
 С помощью команды git show вы можете посмотреть данные тега вместе с коммитом:
 
 ```script bash
 git show v0.0
 git show v0.1
 ```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_tag_show.png)

3. Перейдите на страницу просмотра тегов в GitHab (и в других репозиториях) и посмотрите, чем отличаются созданные теги. 
    * в GitHub — https://github.com/filipp761/devops-netology/tags;
    * в GitLab — https://gitlab.com/filipp761/devops-netology;
    * в Bitbucket — список тегов расположен в выпадающем меню веток на отдельной вкладке. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_tag.png)

## Задание 3. Ветки 

Давайте посмотрим, как будет выглядеть история коммитов при создании веток. 

1. Переключитесь обратно на ветку `main`, которая должна быть связана с веткой `main` репозитория на `github`.
2. Посмотрите лог коммитов и найдите хеш коммита с названием `Prepare to delete and move`, который был создан в пределах предыдущего домашнего задания. 
3. Выполните `git checkout` по хешу найденного коммита. 

Т.к на этом коммите у меня создан tag, можно перейти по нему

```script bash
git checkout v0.0
```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_checkout3.png)

4. Создайте новую ветку `fix`, базируясь на этом коммите 

```script bash
git checkout -b fix
```

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_checkout2.png)

5. Отправьте новую ветку в репозиторий на GitHub `git push -u origin fix`.

6. Посмотрите, как визуально выглядит ваша схема коммитов: https://github.com/filipp761/devops-netology/network. 

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_fix.png)
 
7. Теперь измените содержание файла `README.md`, добавив новую строчку.

8. Отправьте изменения в репозиторий и посмотрите, как изменится схема на странице https://github.com/filipp761/devops-netology/network 
и как изменится вывод команды `git log`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_github_fix.png)
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_gitlub_fix.png)
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_gitlog.png)

## Задание 4. Упрощаем себе жизнь

Попробуем поработь с Git при помощи визуального редактора. 

1. В используемой IDE PyCharm откройте визуальный редактор работы с Git, находящийся в меню View -> Tool Windows -> Git.
2. Измените какой-нибудь файл, и он сразу появится на вкладке `Local Changes`, отсюда можно выполнить коммит, нажав на кнопку внизу этого диалога. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/pycharm_add file.png)

3. Элементы управления для работы с Git будут выглядеть примерно так:   

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_PyCharm.png)

4. Попробуйте выполнить пару коммитов, используя IDE. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git02_PyCharm_Push.png)


[По ссылке](https://www.jetbrains.com/help/pycharm/commit-and-push-changes.html) можно найти справочную информацию по визуальному интерфейсу. 

Если вверху экрана выбрать свою операционную систему, можно посмотреть горячие клавиши для работы с Git. 
Подробней о визуальном интерфейсе мы расскажем на одной из следующих лекций.

*В качестве результата работы по всем заданиям приложите ссылки на ваши репозитории в GitHub, GitLab и Bitbucket*.  

https://gitlab.com/filipp761/devops-netology

https://github.com/filipp761/devops-netology
 
----

### Правила приёма домашнего задания

В личном кабинете отправлены ссылки на ваши репозитории.


### Критерии оценки

Зачёт:

* выполнены все задания;
* ответы даны в развёрнутой форме;
* приложены соответствующие скриншоты и файлы проекта;
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку:

* задание выполнено частично или не выполнено вообще;
* в логике выполнения заданий есть противоречия и существенные недостатки.  
 
Обязательными являются задачи без звёздочки. Их выполнение необходимо для получения зачёта и диплома о профессиональной переподготовке.

Задачи со звёздочкой (*) являются дополнительными или задачами повышенной сложности. Они необязательные, но их выполнение поможет лучше разобраться в теме.
