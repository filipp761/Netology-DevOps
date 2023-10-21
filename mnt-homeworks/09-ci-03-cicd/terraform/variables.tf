###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

## Создание ВМ с помощоью for_each
variable "virtual_instance_for_each" {
  description = ""
  type = list(object({
    vm_name = string ## Имя виртуальной машины
    platform_id = string
    cores = number ## Имя виртуальной машины
    ram = number
    core_fraction = number

  }))
  default = [ {
    vm_name = "sonarqube"
    platform_id = "standard-v3"
    cores = 2
    ram = 4
    core_fraction = 50
  },
  {
    vm_name = "nexus"
    platform_id = "standard-v3"
    cores = 2
    ram = 4
    core_fraction = 50
  }
   ]
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCWfdyRrURnDkQTKNib5vpWZiPRHZGLOrYcrJvzAATIw8GsvKMv9WyWHslOtRNLayA>
}
