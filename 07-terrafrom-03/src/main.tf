resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl", 
    { 
      webservers = yandex_compute_instance.platform
      databases = yandex_compute_instance.databases
      storage = yandex_compute_instance.storage
     })

  filename = "${abspath(path.module)}/hosts.cfg"
}
