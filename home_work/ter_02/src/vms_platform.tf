###vm vars
variable "project" {
  type = string
  default = "netology"
}

variable "env" {
  type = string
  default = "develop"
}

variable "vm_prefix" {
  type = string
  default = "platform"
}

variable "vm_image_family" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_resources" {
  default = {
    "all" = {
      "instance_platform" = "standard-v1"
    }
    "web" = {
      "cores" = 2
      "memory" = 1
      "core_fraction" = 5
    }
    "db" = {
      "cores" = 2
      "memory" = 2
      "core_fraction" = 20
    }
  }
}

variable "vm_metadata" {
 default = {
   "serial_port_enable" = 1
   "user_name" = "ubuntu"
   "ssh_root_key"           = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPuvNrGnTW6RQfprRUDtvAStmDAwwu4al/7VpnMpZCko root@v-povetkin-hp"
 }
}