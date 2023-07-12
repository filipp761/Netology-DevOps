output  "webserver" {
  value = [for i in  yandex_compute_instance.platform: 
  "name = ${i.name}, id = ${i.id},  fqdn = ${i.fqdn}" ]
}

output "databases" {
  value = [
    for i in  yandex_compute_instance.databases: 
   "name = ${i.name}, id = ${i.id}, fqdn = ${i.fqdn}"
  ]
}

output "storage" {
  value = [
    for i in  yandex_compute_instance.storage.*: 
   "name = ${i.name}, id = ${i.id}, fqdn = ${i.fqdn}"
  ]
}
