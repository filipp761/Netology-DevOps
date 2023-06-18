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

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu release name"
}

variable "vm_name_instance" {
  type        = map(string)
  description = "instance name"
  default = {
        project = "netology",
        dev = "develop",
        platf = "platform"
        }
}

variable  "vm_resource" {
    type = map(map(string))
    description = "vm_instance"
    default = {
        "db"  = {core = 2, memory=2, core_fraction=20},
        "web" = {core = 2, memory=2, core_fraction=20}
    }
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "..."
  description = "ssh-keygen -t ed25519"
}
