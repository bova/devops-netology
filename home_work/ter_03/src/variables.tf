###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

## VPovetkin

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
    "storage" = {
      "cores" = 2
      "memory" = 2
      "core_fraction" = 5
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

## For_Each vars
variable "db_list" {
  default = [{vm_name="main", cpu=2, ram=4, disk=10}, {vm_name="replica", cpu=2, ram=4, disk=10}]
}