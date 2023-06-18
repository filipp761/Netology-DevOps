variable "vm_db_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "ubuntu release name"
}

variable "vm_db_resource" {
  type        = map(number)
  description = "resource"
  default = {
        core = 2,
        memory = 2,
        core_fraction = 20
        }
}

data "yandex_compute_image" "ubuntu1" {
  family = var.vm_web_image
}

resource "yandex_compute_instance" "platform1" {
  name        = local.db_project
  platform_id = "standard-v3"
  resources {
    cores         = var.vm_db_resource.core
    memory        = var.vm_db_resource.memory
    core_fraction = var.vm_db_resource.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
