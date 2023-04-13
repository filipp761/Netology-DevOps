# Домашнее задание к занятию «Инструменты Git»

### Цель задания

В результате выполнения задания вы:

* научитесь работать с утилитами Git;
* потренируетесь решать типовые задачи, возникающие при работе в команде. 

### Инструкция к заданию

1. Склонируйте [репозиторий](https://github.com/hashicorp/terraform) с исходным кодом Terraform.
2. Создайте файл для ответов на задания в своём репозитории, после выполнения прикрепите ссылку на .md-файл с ответами в личном кабинете.
3. Любые вопросы по решению задач задавайте в чате учебной группы.

------

## Задание

В клонированном репозитории:

1. Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`.

```script bash
git show aefea
```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git04_show_aefea.png)

2. Ответьте на вопросы.

2.1 Какому тегу соответствует коммит `85024d3`?

 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git04_85024d3.png)

2.2 Сколько родителей у коммита `b8d720`? Напишите их хеши.

Простой ```git log``` <hash>вызов для фиксации слияния показывает сокращенные хэши своих родителей:
  
```script bash
git log -1 b8d720
```

```git``` выводит родителей в соответствии с их количеством: первый (крайний слева) хеш - для первого родителя и так далее.

Если вам нужны только хеши, есть два эквивалентных варианта:
 
```script bash
git log --pretty=%P -n 1 b8d720
```
```script bash
git show -s --pretty=%P b8d720
```   
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git04_85024d3.png)
  
* Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами  v0.12.23 и v0.12.24.
  
 ```script bash
git log v0.12.23..v0.12.24 --pretty=oneline
```
  
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git04_2.3.png) 
  
* Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).
  
```script bash
git log -S func providerSource
```
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git04_providerSource.png) 
  
* Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.
  
```script bash
git log -globalPluginDirs --stat
```  
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git04_globalPluginDirs.png) 
  
* Кто автор функции `synchronizedWriters`? 
  
```script bash
git log -S synchronizedWriters --pretty=format:"%h %an"
``` 
 ![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/img/git04_providerSource.png) 
  
*В качестве решения ответьте на вопросы и опишите, как были получены эти ответы.*

---

### Правила приёма домашнего задания

В личном кабинете отправлена ссылка на .md-файл в вашем репозитории.

### Критерии оценки

Зачёт:

* выполнены все задания;
* ответы даны в развёрнутой форме;
* приложены соответствующие скриншоты и файлы проекта;
* в выполненных заданиях нет противоречий и нарушения логики.

На доработку:

* задание выполнено частично или не выполнено вообще;
* в логике выполнения заданий есть противоречия и существенные недостатки.
