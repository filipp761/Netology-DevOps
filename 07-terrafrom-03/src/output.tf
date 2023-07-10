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

/*
output  "webserver" {
    value = ({
        for webserver in yandex_compute_instance.platform:
        webserver.name => [webserver.name,webserver.id,webserver.fqdn]
    })
}
*/
