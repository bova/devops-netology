/*
output "all_vms" {
  value = {
    for k, inst in merge(yandex_compute_instance.web,yandex_compute_instance.db) : k => {
      id                = inst.id
      availability_zone = inst.availability_zone
      private_ip        = inst.private_ip
    }
  }
 }
*/