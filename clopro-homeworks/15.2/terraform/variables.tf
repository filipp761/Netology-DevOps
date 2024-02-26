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

variable "vpc_name" {
  type        = string
  default     = "network1"
  description = "VPC network&subnet name"
}

variable "cidr_subnet_public" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "lamp-instance-image-id" {
  default = "fd827b91d99psvq5fjit"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCWfdyRrURnDkQTKNib5vpWZiPRHZGLOrYcrJvzAATIw8GsvKMv9WyWHslOtRNLayA+5DZOD9wjvf0QV7pPrOHQnzDKfMMxzFj8ZnCkaGUMKB5jK9SfHoAaLoZijpVV/nT0lHsuvcbuy4DFnlXpUe1MN9F4MHbc8g/84IoQk2NBeOU3geehMN1E1GKTJfenK+9Ulnb9zTh80KU6GyKYCvvdL9gjuBXMLJwBPpf/y4Oeh8OKRh4OySSZN2qoMzrRLDSOvHtHOZZa67yluWBO0cpz/IVp8IPEW5jqq3wwxYw6oUj4RpGXYtKuJCkkVqnUsLCATIwI18Gl3j/5NdEi7WxaqHJuQDj2OZfkDHeVT8QMUk5bB3fcBLB3BLomSJwnvbyWkuAtqGxU+HurCDk8MWCkG6YbeQhCAdYPmiyUO4nWVNfvtXjl4+rcDgW+V+/9FflVuTXn5PtLRkQuErDh246bmpqfQvilEODScgxWtqPEMo7WHTWPr+t4DE/kvFAi+r8= philipp@philipp-VirtualBox"
}