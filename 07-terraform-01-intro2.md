# Домашнее задание к занятию «Введение в Terraform»

### Цель задания

1. Установить и настроить Terrafrom.
2. Научиться использовать готовый код.

------

### Чеклист готовности к домашнему заданию

1. Скачайте и установите актуальную версию **terraform** >=1.4.X . Приложите скриншот вывода команды ```terraform --version```.
2. Скачайте на свой ПК данный git репозиторий. Исходный код для выполнения задания расположен в директории **01/src**.
3. Убедитесь, что в вашей ОС установлен docker.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. Установка и настройка Terraform  [ссылка](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#from-yc-mirror)
2. Зеркало документации Terraform  [ссылка](https://registry.tfpla.net/browse/providers) 
3. Установка docker [ссылка](https://docs.docker.com/engine/install/ubuntu/) 
------

### Задание 1

1. Перейдите в каталог [**src**](https://github.com/netology-code/ter-homeworks/tree/main/01/src). Скачайте все необходимые зависимости, использованные в проекте. 
2. Изучите файл **.gitignore**. В каком terraform файле согласно этому .gitignore допустимо сохранить личную, секретную информацию?
3. Выполните код проекта. Найдите  в State-файле секретное содержимое созданного ресурса **random_password**, пришлите в качестве ответа конкретный ключ и его значение.
4. Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла **main.tf**.
Выполните команду ```terraform validate```. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их.
5. Выполните код. В качестве ответа приложите вывод команды ```docker ps```
6. Замените имя docker-контейнера в блоке кода на ```hello_world```, выполните команду ```terraform apply -auto-approve```.
Объясните своими словами, в чем может быть опасность применения ключа  ```-auto-approve``` ? В качестве ответа дополнительно приложите вывод команды ```docker ps```
7. Уничтожьте созданные ресурсы с помощью **terraform**. Убедитесь, что все ресурсы удалены. Приложите содержимое файла **terraform.tfstate**. 
8. Объясните, почему при этом не был удален docker образ **nginx:latest** ? Ответ подкрепите выдержкой из документации провайдера.
------
### Ответ:
* **2. Файл .gitignore. Файл для хранения секретной информации - personal.auto.tfvars**
```
# Local .terraform directories and files
**/.terraform/*
.terraform*

# .tfstate files
*.tfstate
*.tfstate.*

# own secret vars store.
personal.auto.tfvars 
```
* **3. Выполните код проекта. Найдите  в State-файле секретное содержимое созданного ресурса ```random_password```, пришлите в качестве ответа конкретный ключ и его значение** 
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/07-terraform-01-intro2/terraform_init.png)
```
"result": "dmWjHCukOIeJoK2k"
```

* **4. Раскомментируйте блок кода, примерно расположенный на строчках 29-42 файла ```main.tf```. Выполните команду ```terraform validate```. Объясните в чем заключаются намеренно допущенные ошибки? Исправьте их.** 
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/07-terraform-01-intro2/terraform_validate.png)
```
resource "docker_image" {             
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "1nginx" {   
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string_fake.resuld}"

  ports {
    internal = 80
    external = 8000
  }
```
```resource "docker_image"``` - не указано имя блока

```resource "docker_container" "1nginx"``` - орфографическая ошибка, лишняя ```1```

```name  = "example_${random_password.random_string_fake.resuld}"```  - не верно указано имя 

* **Правильная конфигурация**
```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "hello_world" {
  image = docker_image.nginx.image_id
  name  = "hello_world"

  ports {
    internal = 80
    external = 8000
  }
}
```
* **5. Выполните код. В качестве ответа приложите вывод команды ```docker ps```**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/07-terraform-01-intro2/docker_ps.png)
* **6. Замените имя docker-контейнера в блоке кода на hello_world, выполните команду terraform apply -auto-approve. Объясните своими словами, в чем может быть опасность применения ключа -auto-approve ? В качестве ответа дополнительно приложите вывод команды docker ps**
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/07-terraform-01-intro2/terraform_hello_world.png)
```
terraform apply –auto-approve: создает или обновляет инфраструктуру; этап утверждения пользователем пропускается.
```
* **7. Уничтожьте созданные ресурсы с помощью ```terraform```. Убедитесь, что все ресурсы удалены. Приложите содержимое файла ```terraform.tfstate```.**

![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/07-terraform-01-intro2/terraform_tfstate.png)

* **8. Объясните, почему при этом не был удален docker образ ```nginx:latest``` ? Ответ подкрепите выдержкой из документации провайдера.**
Как я понял, образ docker не был удален, так как он не относится к инфраструктуре создаваемой terraform.

## Дополнительные задания (со звездочкой*)

**Настоятельно рекомендуем выполнять все задания под звёздочкой.**   Их выполнение поможет глубже разобраться в материале.   
Задания под звёздочкой дополнительные (необязательные к выполнению) и никак не повлияют на получение вами зачета по этому домашнему заданию. 

### Задание 2*

1. Изучите в документации provider [**Virtualbox**](https://registry.tfpla.net/providers/shekeriev/virtualbox/latest/docs/overview/index) от 
shekeriev.
2. Создайте с его помощью любую виртуальную машину. Чтобы не использовать VPN советуем выбрать любой образ с расположением в github из [**списка**](https://www.vagrantbox.es/)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/07-terraform-01-intro2/terraform_plan_VB.png)
![alt text](https://github.com/filipp761/Netology-sdb-homewoks/blob/main/07-terraform-01-intro2/VB.png)
В качестве ответа приложите plan для создаваемого ресурса и скриншот созданного в VB ресурса. 

------

