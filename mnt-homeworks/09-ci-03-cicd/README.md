# Домашнее задание к занятию 9 «Процессы CI/CD»

## Подготовка к выполнению

1. Создайте два VM в Yandex Cloud с параметрами: 2CPU 4RAM Centos7 (остальное по минимальным требованиям).
2. Пропишите в [inventory](./infrastructure/inventory/cicd/hosts.yml) [playbook](./infrastructure/site.yml) созданные хосты.
3. Добавьте в [files](./infrastructure/files/) файл со своим публичным ключом (id_rsa.pub). Если ключ называется иначе — найдите таску в плейбуке, которая использует id_rsa.pub имя, и исправьте на своё.
4. Запустите playbook, ожидайте успешного завершения.
5. Проверьте готовность SonarQube через [браузер](http://localhost:9000).
6. Зайдите под admin\admin, поменяйте пароль на свой.
7.  Проверьте готовность Nexus через [бразуер](http://localhost:8081).
8. Подключитесь под admin\admin123, поменяйте пароль, сохраните анонимный доступ.

* **Успешное выполнение playbook**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/Playbook.png)

* **Проверка готовности SonarQube**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/SonarQube.png)

* **Проверка готовности Nexus**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/Nexus.png)

## Знакомоство с SonarQube

<details>
<summary>Требования</summary>
   
### Основная часть
1. Создайте новый проект, название произвольное.
2. Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.
3. Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
4. Проверьте `sonar-scanner --version`.
5. Запустите анализатор против кода из директории [example](./example) с дополнительным ключом `-Dsonar.coverage.exclusions=fail.py`.
6. Посмотрите результат в интерфейсе.
7. Исправьте ошибки, которые он выявил, включая warnings.
8. Запустите анализатор повторно — проверьте, что QG пройдены успешно.
9. Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.

</details>

* **Скачивание пакета sonar-scanner**

``sh
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip
`` 
* **Извлечение архива**

``sh
unzip sonar-scanner-cli-5.0.1.3006-linux.zip
`` 
* **Перемещение в рабочую директорию**

``sh
sudo mv sonar-scanner-5.0.1.3006-linux /usr/local/bin/
`` 
* **Переход в рабочую дерикторию и задаем PATH**

``sh
cd /usr/local/bin/sonar-scanner-5.0.1.3006-linux/bin/
export PATH=$(pwd):$PATH
`` 
* **Запуск анализатора кода**

``sh
sonar-scanner \
  -Dsonar.projectKey=netology \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://158.160.114.248:9000 \
  -Dsonar.login=441916b3dad16b3fdc654d739807cae3a577b5d1 \
  -Dsonar.coverage.exclusions=fail.py
``

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/SonarBug.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/SonarBugs.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/SonarSeccess.png)
## Знакомство с Nexus

<details>
<summary>Требования</summary>

### Основная часть

1. В репозиторий `maven-public` загрузите артефакт с GAV-параметрами:

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.
   
2. В него же загрузите такой же артефакт, но с version: 8_102.
3. Проверьте, что все файлы загрузились успешно.
4. В ответе пришлите файл `maven-metadata.xml` для этого артефекта.
</details>


Ссылка на файл [maven-metadata.xml](mvn/maven-metadata.xml)  


### Знакомство с Maven

<details>
<summary>Требования</summary>

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).
2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.
4. Проверьте `mvn --version`.
5. Заберите директорию [mvn](./mvn) с pom.

### Основная часть

1. Поменяйте в `pom.xml` блок с зависимостями под ваш артефакт из первого пункта задания для Nexus (java с версией 8_282).
2. Запустите команду `mvn package` в директории с `pom.xml`, ожидайте успешного окончания.
3. Проверьте директорию `~/.m2/repository/`, найдите ваш артефакт.
4. В ответе пришлите исправленный файл `pom.xml`.

</details>

* **Перед установкой Maven, необходимо проверить наличие Java JDK на вашей машине**

* **Скачиваем пакет Maven**

``sh
wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip
``
* **Извлекаем архив**

``sh
unzip https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.zip
``
* **Настриваем переменную PATH**

``sh
cd /home/philipp/apache-maven-3.9.5/bin
export PATH=$(pwd):$PATH
``
* **Проверяем версию Maven**

``
mvn --version
``
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/MavenVersion.png)

* **Запустите команду `mvn package`**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/MavenSeccess.png)

Ссылка на файл [pom.xml](mvn/pom.xml) 

### Единственное, почему то не получилось выполнить корректно команду mvn package, она выполнилась нормально только, если не указывать конкретный проект, а там выдает такую ошибку:

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/mnt-homeworks/09-ci-03-cicd/img/ERROR.png)
