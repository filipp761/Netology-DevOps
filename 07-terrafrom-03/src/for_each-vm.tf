data "yandex_compute_image" "ubuntu1" {
  family = "ubuntu-2004-lts"
}

resource "yandex_compute_instance" "databases" {
    for_each = { for key, value in var.virtual_instance_for_each : key => value }
    name = each.value["vm_name"]
    platform_id = each.value["platform_id"]
    depends_on = [ yandex_compute_instance.platform ]
    resources {
        cores = each.value["cores"]
        memory = each.value["ram"]
        core_fraction = each.value["core_fraction"]
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
    ssh-keys           = "ubuntu:${var.public_key}"
  }

}
