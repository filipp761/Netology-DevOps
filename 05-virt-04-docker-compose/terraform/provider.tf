terraform {
  required_providers {
    yandex = {
      source = "registry.tfpla.net/yandex-cloud/yandex"
      version = "0.84.0"

    }
  }
}

provider "yandex" {
  token = "y0_AgAAAAAwSRMQAATuwQAAAADPR37P-eMYnBvUT4aYuCoxmXFSsqVJjMo"
  cloud_id  = "b1ghu94q4h4fj60hlsag"
  folder_id = "b1gs7qhv4u13mhqpm6oa"
}
