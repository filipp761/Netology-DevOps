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
  description = "VPC network&subnet name"
}

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyzpatNNBesAMeBL4Xaq40nvZvxSMNJqI5CxBunR+7fjm+0FgK1DuEvc5UL0F9YDK8dKvtIT9sWb5wYBimRoWytuDqwrym9TrEUV6kYF42wHSiHB2Mk14dNG5EGRgo4I7otUPHYf4X+g3iBFSePCRqhNXaFabFZfmlFhLJ/UOmyh+XJofcpssYHQbJWHuhyP2eIU1tqBre6D77mGoW6un/QNuiru+yrS0eN3YUZOfcbCo6Q9ell50WJtxEtvy77OvN1lKZpzSDYoKft1AY//Bf/YB+GyL2gaQ1VNzELELYPiWdN2gf8iqEtgkZa0oYdDRMI3Vov0zTDSvuWb9NHh3SCW+fftGdHt3Dyibnk5xTpntwVQu2Of+WjIydjQtveaRQgvHYj8pDzsAPPHoW8FX1iBGLzkUKdE0NcKXJ8GcR9P31sKKJ196F+QyCeclK3HbD7gI8f4ODBwwA3AuQJqW5w1YcNmYqqjbfzjFVP//OZfhgC2tUInFxBdHy1xXT4tE= philipp@philipp-VirtualBox"
}
