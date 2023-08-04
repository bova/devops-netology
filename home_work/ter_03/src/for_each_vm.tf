resource "yandex_compute_instance" "db" {
  depends_on = [yandex_compute_instance.web]
  for_each = {for vm in var.db_list: vm.vm_name => vm}
  name = each.value.vm_name
  platform_id = var.vm_resources.all.instance_platform
  resources {
    cores  = each.value.cpu
    memory = each.value.ram
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat = true
  }
  metadata = {
    serial-port-enable = var.vm_metadata.serial_port_enable
    ssh-keys = "${var.vm_metadata.user_name}:${local.ssh_root_key}"
  }
}