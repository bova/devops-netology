data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}
resource "yandex_compute_instance" "web" {
  count = 2
  name = "web-${count.index+1}"
  platform_id = var.vm_resources.all.instance_platform
  resources {
    cores  = var.vm_resources.web.cores
    memory = var.vm_resources.web.memory
    core_fraction = var.vm_resources.web.core_fraction
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
    nat = true
  }
  metadata = {
    serial-port-enable = var.vm_metadata.serial_port_enable
    ssh-keys = "${var.vm_metadata.user_name}:${local.ssh_root_key}"
  }
}