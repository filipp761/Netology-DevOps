module "vpc_dev" {
  source       = "./vpc"
  vpc_name     = "develop"
  default_zone = "ru-central1-a"
  default_cidr = ["10.0.1.0/24"]
}
