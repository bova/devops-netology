resource "yandex_compute_disk" "net_disk" {
  count = 3
  name = "disk-${count.index+1}"
  type = "network-hdd"
  size = 1
}

resource "yandex_compute_instance" "storage" {
  name = "storage"
  platform_id = var.vm_resources.all.instance_platform
  resources {
    cores  = var.vm_resources.storage.cores
    memory = var.vm_resources.storage.memory
    core_fraction = var.vm_resources.storage.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = 10
    }
  }
  dynamic "secondary_disk" {
    ##for_each = { for disk in yandex_compute_disk.net_disk: disk.id => disk}
    for_each = yandex_compute_disk.net_disk
    content {
      disk_id = secondary_disk.value.id
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