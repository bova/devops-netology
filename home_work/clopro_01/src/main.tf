## Network
resource "yandex_vpc_network" "VPC_NETWORK_1" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public" {
  name           = "public"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.VPC_NETWORK_1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_vpc_subnet" "private" {
  name           = "private"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.VPC_NETWORK_1.id
  v4_cidr_blocks = ["192.168.20.0/24"]
  route_table_id = yandex_vpc_route_table.rt-1.id
}

# Routing

#resource "yandex_vpc_gateway" "egress-gateway" {
#name = "egress-gateway"
  #shared_egress_gateway {}
#}

#resource "yandex_vpc_gateway" "gw1" {
#    name = "gw1"
#}

resource "yandex_vpc_route_table" "rt-1" {
  network_id = "${yandex_vpc_network.VPC_NETWORK_1.id}"
  

  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address = "192.168.10.254"        
  }
}

## NAT Instance

data "yandex_compute_image" "ubuntu" {    
  family = var.vm_image_family
}

resource "yandex_compute_instance" "platform" {
  name        = "nat-instance"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd86aq92pnsig1u550jm"
    }
  }
  scheduling_policy {
    preemptible = true
  }
  
  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
    ip_address = "192.168.10.254"
  }
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

## Instance PUB

resource "yandex_compute_instance" "pub-instance" {
  name        = "pub-instance"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
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
    subnet_id = yandex_vpc_subnet.public.id    
    nat = "true"
  }
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

## Instance PRiv

resource "yandex_compute_instance" "priv-instance" {
  name        = "priv-instance"
  platform_id = "standard-v1"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
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
    subnet_id = yandex_vpc_subnet.private.id    
  }
  
  metadata = {
    serial-port-enable = 1
    ssh-keys           = "vpovetkin:${var.vms_ssh_root_key}"
  }
}