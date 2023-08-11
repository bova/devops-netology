module "vpc_dev" {
  source = "./vpc"
  vpc_name = "develop"
  token = var.token
  folder_id = var.folder_id
  cloud_id = var.cloud_id
  zone = var.default_zone
  cidr = var.default_cidr
}

# VPovetkin

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=1.0.0"
  env_name        = "develop"
  network_id      = module.vpc_dev.network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ module.vpc_dev.subnet_id ]
  instance_name   = "web"
  instance_count  = 1
  image_family    = "ubuntu-2004-lts"
  public_ip       = false
  security_group_ids = ["enp2r5l69ma92cn8dt5u"]

  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
  vars = {
    username = local.ssh_username
    ssh_public_key = local.ssh_root_key
  }
}