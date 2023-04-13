# Домашнее задание к занятию «Ветвления в Git»

### Цель задания

В процессе работы над заданием вы потренеруетесь делать merge и rebase. В результате вы поймете разницу между ними и научитесь решать конфликты.   

Обычно при нормальном ходе разработки выполнять `rebase` достаточно просто. 
Это позволяет объединить множество промежуточных коммитов при решении задачи, чтобы не засорять историю. Поэтому многие команды и разработчики предпочитают такой способ.   


### Инструкция к заданию

1. В личном кабинете отправьте на проверку ссылку на network графика вашего репозитория.
2. Любые вопросы по решению задач задавайте в чате учебной группы.


### Дополнительные материалы для выполнения задания

1. Тренажёр [LearnGitBranching](https://learngitbranching.js.org/), где можно потренироваться в работе с деревом коммитов и ветвлений. 

------

## Задание «Ветвление, merge и rebase»  

**Шаг 1.** Предположим, что есть задача — написать скрипт, выводящий на экран параметры его запуска. 
Давайте посмотрим, как будет отличаться работа над этим скриптом с использованием ветвления, merge и rebase. 

Создайте в своём репозитории каталог `branching` и в нём два файла — `merge.sh` и `rebase.sh` — с 
содержимым:

```bash
#!/bin/bash
# display command line options

count=1
for param in "$*"; do
    echo "\$* Parameter #$count = $param"
    count=$(( $count + 1 ))
done
```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_add_file.png)

Этот скрипт отображает на экране все параметры одной строкой, а не разделяет их.

**Шаг 2.** Создадим коммит с описанием `prepare for merge and rebase` и отправим его в ветку main. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_prepare_for_merge_and_rebase.png)

#### Подготовка файла merge.sh 
 
**Шаг 1.** Создайте ветку `git-merge`. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_git_branch_git-merge.png)

**Шаг 2**. Замените в ней содержимое файла `merge.sh` на:

```bash
#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    count=$(( $count + 1 ))
done
```

**Шаг 3.** Создайте коммит `merge: @ instead *`, отправьте изменения в репозиторий.  

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_instead.png)
 
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_git_merge_GitHub.png)

**Шаг 4.** Разработчик подумал и решил внести ещё одно изменение в `merge.sh`:
 
```bash
#!/bin/bash
# display command line options

count=1
while [[ -n "$1" ]]; do
    echo "Parameter #$count = $1"
    count=$(( $count + 1 ))
    shift
done
```

Теперь скрипт будет отображать каждый переданный ему параметр отдельно. 

**Шаг 5.** Создайте коммит `merge: use shift` и отправьте изменения в репозиторий. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_merge_use_shift.png)

#### Изменим main  

**Шаг 1.** Вернитесь в ветку `main`. 

**Шаг 2.** Предположим, что пока мы работали над веткой `git-merge`, кто-то изменил `main`. Для этого
изменим содержимое файла `rebase.sh` на:

```bash
#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    count=$(( $count + 1 ))
done

echo "====="
```
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_main_update_rebase.png)

В этом случае скрипт тоже будет отображать каждый параметр в новой строке. 

**Шаг 3.** Отправляем изменённую ветку `main` в репозиторий.

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_Github_main.png)

#### Подготовка файла rebase.sh  

**Шаг 1.** Предположим, что теперь другой участник нашей команды не сделал `git pull` либо просто хотел ответвиться не от последнего коммита в `main`, а от коммита, когда мы только создали два файла
`merge.sh` и `rebase.sh` на первом шаге.  
Для этого при помощи команды `git log` найдём хеш коммита `prepare for merge and rebase` и выполним `git checkout` на него так:
`git checkout 8baf217e80ef17ff577883fda90f6487f67bbcea` (хеш будет другой).

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_git_checkout.png)

**Шаг 2.** Создадим ветку `git-rebase`, основываясь на текущем коммите. 

```bash
git checkout -b git-rebase
```

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_git_branch_git-rebase.png)

**Шаг 3.** И изменим содержимое файла `rebase.sh` на следующее, тоже починив скрипт, но немного в другом стиле:

```bash
#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "Parameter: $param"
    count=$(( $count + 1 ))
done

echo "====="
```

**Шаг 4.** Отправим эти изменения в ветку `git-rebase` с комментарием `git-rebase 1`.

**Шаг 5.** И сделаем ещё один коммит `git-rebase 2` с пушем, заменив `echo "Parameter: $param"` на `echo "Next parameter: $param"`.

#### Промежуточный итог  

Мы сэмулировали типичную ситуации в разработке кода, когда команда разработчиков работала над одним и тем же участком кода, и кто-то из разработчиков 
предпочитает делать `merge`, а кто-то — `rebase`. Конфликты с merge обычно решаются просто, 
а с rebase бывают сложности, поэтому давайте смержим все наработки в `main` и разрешим конфликты. 

Если всё было сделано правильно, то на странице `network` в GitHub, находящейся по адресу 
`https://github.com/filipp761/devops-netology/network`, будет примерно такая схема:
  
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_Prom_Itog.png)

#### Merge

Сливаем ветку `git-merge` в main и отправляем изменения в репозиторий, должно получиться без конфликтов:

```bash
root@git:/home/philipp/devops-netology# git merge git-merge
Merge made by the 'recursive' strategy.
 branching/merge.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
root@git:/home/philipp/devops-netology# git push
Перечисление объектов: 7, готово.
Подсчет объектов: 100% (7/7), готово.
При сжатии изменений используется до 3 потоков
Сжатие объектов: 100% (3/3), готово.
Запись объектов: 100% (3/3), 374 bytes | 374.00 KiB/s, готово.
Всего 3 (изменения 1), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To github.com:filipp761/devops-netology.git
   cfc5ebf..c354f00  main -> main
root@git:/home/philipp/devops-netology#
```  

В результате получаем такую схему:
 
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_merge_git_merge.png)

#### Rebase

**Шаг 1.** Перед мержем ветки `git-rebase` выполним её `rebase` на main. Да, мы специально создали ситуацию с конфликтами, чтобы потренироваться их решать. 

**Шаг 2.** Переключаемся на ветку `git-rebase` и выполняем `git rebase -i main`. 

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_rebase.png)

В открывшемся диалоге должно быть два выполненных коммита, давайте заодно объединим их в один, 
указав слева от нижнего `fixup`. 
В результате получаем:

```bash
root@git:/home/philipp/devops-netology# git rebase -i main
Автослияние branching/rebase.sh
КОНФЛИКТ (содержимое): Конфликт слияния в branching/rebase.sh
error: не удалось применить коммит d000208… git-rebase 1
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply d000208... git-rebase 1
root@git:/home/philipp/devops-netology#
``` 

Если посмотреть содержимое файла `rebase.sh`, то увидим метки, оставленные Git для решения конфликта:

```bash
cat rebase.sh
#!/bin/bash
# display command line options
count=1
for param in "$@"; do
<<<<<<< HEAD
    echo "\$@ Parameter #$count = $param"
=======
    echo "Parameter: $param"
>>>>>>> dc4688f... git 2.3 rebase @ instead *
    count=$(( $count + 1 ))
done
```

**Шаг 3.** Удалим метки, отдав предпочтение варианту:

```bash
echo "\$@ Parameter #$count = $param"
```

Получаем:

```bash
#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    count=$(( $count + 1 ))
done

echo "====="
```

**Шаг 4.** Сообщим Git, что конфликт решён `git add rebase.sh` и продолжим rebase `git rebase --continue`.

```bash
root@git:/home/philipp/devops-netology# git add branching/rebase.sh
root@git:/home/philipp/devops-netology# git rebase --continue
Автослияние branching/rebase.sh
КОНФЛИКТ (содержимое): Конфликт слияния в branching/rebase.sh
error: не удалось применить коммит 1d53d3b… git-rebase 2
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 1d53d3b... git-rebase 2
root@git:/home/philipp/devops-netology#
```

**Шаг 5.** Опять получим конфликт в файле `rebase.sh` при попытке применения нашего второго коммита. Давайте разрешим конфликт, оставив строчку `echo "Next parameter: $param"`.

```bash
#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "Next parameter: $param"
    count=$(( $count + 1 ))
done

echo "====="
```

**Шаг 6.** Далее опять сообщаем Git о том, что конфликт разрешён — `git add rebase.sh` — и продолжим rebase — `git rebase --continue`.

В результате будет открыт текстовый редактор, предлагающий написать комментарий к новому объединённому коммиту:

```
# Это объединение 2 коммитов.
# Это 1-е сообщение коммита:

Merge branch 'git-merge' into main

# Сообщение коммита номер #2 будет пропущено:

# git-rebase 2

# Пожалуйста, введите сообщение коммита для ваших изменений. Строки,
# начинающиеся с «#» будут проигнорированы, а пустое сообщение
# отменяет процесс коммита.
#
# Дата:      Thu Apr 13 13:41:34 2023 +0300
#
# интерактивное перемещение в процессе; над c354f00
# Последняя команда выполнена (2 команды выполнено):
#    pick d000208 git-rebase 1
#    fixup 1d53d3b git-rebase 2
# Команд больше не осталось.
# Вы сейчас перемещаете ветку «git-rebase» над «c354f00».
#
# Изменения, которые будут включены в коммит:
#       изменено:      branching/merge.sh
#       изменено:      branching/rebase.sh

```
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_messages.png)

Все строчки, начинающиеся на `#`, будут проигнорированны. 

После сохранения изменения Git сообщит:

```
Successfully rebased and updated refs/heads/git-rebase
```

**Шаг 7.** И попробуем выполнить `git push` либо `git push -u origin git-rebase`, чтобы точно указать, что и куда мы хотим запушить. 

Эта команда завершится с ошибкой:

```bash
git push
To github.com:andrey-borue/devops-netology.git
 ! [rejected]        git-rebase -> git-rebase (non-fast-forward)
error: failed to push some refs to 'git@github.com:andrey-borue/devops-netology.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_rebase_push_error.png)


Это произошло, потому что мы пытаемся перезаписать историю. 

**Шаг 8.** Чтобы Git позволил нам это сделать, добавим флаг `force`:

```bash
root@git:/home/philipp/devops-netology# git push -u origin git-rebase -f
Перечисление объектов: 10, готово.
Подсчет объектов: 100% (10/10), готово.
При сжатии изменений используется до 3 потоков
Сжатие объектов: 100% (4/4), готово.
Запись объектов: 100% (4/4), 430 bytes | 215.00 KiB/s, готово.
Всего 4 (изменения 2), повторно использовано 0 (изменения 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To github.com:filipp761/devops-netology.git
 + 1d53d3b...b597204 git-rebase -> git-rebase (forced update)
Ветка «git-rebase» отслеживает внешнюю ветку «git-rebase» из «origin».
```

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_rebase_push_seccesfull.png)

**Шаг 9**. Теперь можно смержить ветку `git-rebase` в main без конфликтов и без дополнительного мерж-комита простой перемоткой: 

```
$ git checkout main
Switched to branch 'main'
Your branch is up to date with 'origin/main'.

$ git merge git-rebase
Updating 6158b76..45893d1
Fast-forward
 branching/rebase.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
```

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git03_git_merge_rebase.png)

*В качестве результата работы по всем заданиям приложите ссылку на .md-файл в вашем репозитории.*
 
----

### Правила приёма домашнего задания

В личном кабинете отправлена ссылка на network графика вашего репозитория.

### Критерии оценки

Зачёт:

* выполнены все задания;
* ответы даны в развёрнутой форме;
* приложены соответствующие скриншоты и файлы проекта;
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку:

* задание выполнено частично или не выполнено вообще;
* в логике выполнения заданий есть противоречия и существенные недостатки.
