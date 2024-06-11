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
  default     = "VPC_NETWORK_2"
  description = "VPC network & subnet name"
}

variable "vm_image_family" {
    type = string
    default = "ubuntu-2004-lts"  
}

variable "nat_vm_image_id" {
    type = string
    default = "fd86aq92pnsig1u550jm"  
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPuvNrGnTW6RQfprRUDtvAStmDAwwu4al/7VpnMpZCko root@v-povetkin-hp"
  description = "ssh-keygen -t ed25519"
}

