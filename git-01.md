# Домашнее задание к занятию «Системы контроля версий»

### Цель задания

В результате выполнения задания вы: 

* научитесь подготоваливать новый репозиторий к работе;
* сохранять, перемещать и удалять файлы в системе контроля версий.  


### Чеклист готовности к домашнему заданию

1. Установлена консольная утилита для работы с Git.


### Инструкция к заданию

1. Домашнее задание выполните в GitHub-репозитории. 
2. В личном кабинете отправьте на проверку ссылку на ваш репозиторий с домашним заданием.
3. Любые вопросы по решению задач задавайте в чате учебной группы.


### Дополнительные материалы для выполнения задания

1. [GitHub](https://github.com/).
2. [Инструкция по установке Git](https://git-scm.com/downloads).   
   
   
------

## Задание 1. Создать и настроить репозиторий для дальнейшей работы на курсе

В рамках курса вы будете писать скрипты и создавать конфигурации для различных систем, которые необходимо сохранять для будущего использования. 
Сначала надо создать и настроить локальный репозиторий, после чего добавить удалённый репозиторий на GitHub.

### Создание репозитория и первого коммита

1. Зарегистрируйте аккаунт на [https://github.com/](https://github.com/). Если предпочитаете другое хранилище для репозитория, можно использовать его.
2. Создайте публичный репозиторий, который будете использовать дальше на протяжении всего курса, желательное с названием `devops-netology`.
   Обязательно поставьте галочку `Initialize this repository with a README`.
   
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_Create_repo.png)   
   
3. Создайте [авторизационный токен](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) для клонирования репозитория.
4. Склонируйте репозиторий, используя протокол HTTPS (`git clone ...`).  

```script bash
git clone https://github.com/filipp761/devops-netology.git
```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_clone_repo.png) 

5. Перейдите в каталог с клоном репозитория (`cd devops-netology`).

```script bash
cd devops-netology/
```
6. Произведите первоначальную настройку Git, указав своё настоящее имя, чтобы нам было проще общаться, и email (`git config --global user.name` и `git config --global user.email johndoe@example.com`). 

```script bash
git config --global user.name Philipp Kopylov
```
```script bash
git config --global user.email filkopylov@gmail.com
```
7. Выполните команду `git status` и запомните результат.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_status_1.png) 

8. Отредактируйте файл `README.md` любым удобным способом, тем самым переведя файл в состояние `Modified`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_status_modifid.png) 

9. Ещё раз выполните `git status` и продолжайте проверять вывод этой команды после каждого следующего шага. 
10. Теперь посмотрите изменения в файле `README.md`, выполнив команды `git diff` и `git diff --staged`.

```script bash
git diff
```
```script bash
git diff --staged
```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_diff.png) 

11. Переведите файл в состояние `staged` (или, как говорят, просто добавьте файл в коммит) командой `git add README.md`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_add.png)

12. И ещё раз выполните команды `git diff` и `git diff --staged`. Поиграйте с изменениями и этими командами, чтобы чётко понять, что и когда они отображают. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_diff_--staged.png)

13. Теперь можно сделать коммит `git commit -m 'First commit'`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_first_commit.png)

14. И ещё раз посмотреть выводы команд `git status`, `git diff` и `git diff --staged`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_p14.png)

### Создание файлов `.gitignore` и второго коммита

1. Создайте файл `.gitignore` (обратите внимание на точку в начале файла), проверьте его статус сразу после создания. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_ingnore_status.png)

3. Добавьте файл `.gitignore` в следующий коммит (`git add...`).

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_add_gitignore.png)

5. На одном из следующих блоков вы будете изучать `Terraform`, давайте сразу создадим соотвествующий каталог `terraform` и внутри этого каталога — файл `.gitignore` по примеру: https://github.com/github/gitignore/blob/master/Terraform.gitignore.  
6. В файле `README.md` опишите своими словами, какие файлы будут проигнорированы в будущем благодаря добавленному `.gitignore`.
7. Закоммитьте все новые и изменённые файлы. Комментарий к коммиту должен быть `Added gitignore`.

### Эксперимент с удалением и перемещением файлов (третий и четвёртый коммит)

1. Создайте файлы `will_be_deleted.txt` (с текстом `will_be_deleted`) и `will_be_moved.txt` (с текстом `will_be_moved`) и закоммите их с комментарием `Prepare to delete and move`.
2. В случае необходимости обратитесь к [официальной документации](https://git-scm.com/book/ru/v2/Основы-Git-Запись-изменений-в-репозиторий) — здесь подробно описано, как выполнить следующие шаги. 
3. Удалите файл `will_be_deleted.txt` с диска и из репозитория. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_deleted.png)

5. Переименуйте (переместите) файл `will_be_moved.txt` на диске и в репозитории, чтобы он стал называться `has_been_moved.txt`.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_rename.png)

7. Закоммитьте результат работы с комментарием `Moved and deleted`.

### Проверка изменения

1. В результате предыдущих шагов в репозитории должно быть как минимум пять коммитов (если вы сделали ещё промежуточные — нет проблем):
    * `Initial Commit` — созданный GitHub при инициализации репозитория. 
    * `First commit` — созданный после изменения файла `README.md`.
    * `Added gitignore` — после добавления `.gitignore`.
    * `Prepare to delete and move` — после добавления двух временных файлов.
    * `Moved and deleted` — после удаления и перемещения временных файлов. 
2. Проверьте это, используя комманду `git log`. Подробно о формате вывода этой команды мы поговорим на следующем занятии, но посмотреть, что она отображает, можно уже сейчас.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_log.png)

### Отправка изменений в репозиторий

Выполните команду `git push`, если Git запросит логин и пароль — введите ваши логин и пароль от GitHub. 

В качестве результата отправьте ссылку на репозиторий. 

## Задание 2. Знакомство с документаций

Один из основных навыков хорошего специалиста — уметь самостоятельно находить ответы на возникшие вопросы.  
Чтобы начать знакомиться с документацией, выполните в консоли команды `git --help`, `git add --help` и изучите их вывод.  

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_help.png)
 
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git01_git_help_add.png)


----
