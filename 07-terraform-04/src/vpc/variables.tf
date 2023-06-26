variable "vpc_name" {
  type        = string
  default     = ""
  description = "VPC network&subnet name"
}

variable "default_zone" {
  type        = string
  default     = ""
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = [""]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

