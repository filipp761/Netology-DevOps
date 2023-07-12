output  "webserver" {
  value = [for i in  yandex_compute_instance.platform: 
  "name = ${i.name},\nid = ${i.id},\nfqdn = ${i.fqdn}" ]
}

output "databases" {
  value = [
    for i in  yandex_compute_instance.databases: 
   "name = ${i.name},\nid = ${i.id},\nfqdn = ${i.fqdn}"
  ]
}

output "storage" {
  value = [
    for i in  yandex_compute_instance.storage.*: 
   "name = ${i.name},\nid = ${i.id},\nfqdn = ${i.fqdn}"
  ]
}
