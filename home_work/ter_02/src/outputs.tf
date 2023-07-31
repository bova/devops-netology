output "external_ips" {
  value = {
  (yandex_compute_instance.platform.name) = yandex_compute_instance.platform.network_interface[0].ip_address
    (yandex_compute_instance.platform_db.name) = yandex_compute_instance.platform_db.network_interface[0].ip_address
  }
}