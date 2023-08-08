resource "yandex_vpc_network" "vpc" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "vpc" {
  name           = var.vpc_name
  zone           = var.zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = var.cidr
}