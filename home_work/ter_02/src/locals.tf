locals {
  vm_web_name = "${var.project}-${var.env}-${var.vm_prefix}-web"
  vm_db_name = "${var.project}-${var.env}-${var.vm_prefix}-db"
  ssh_keys = "ubuntu:${var.vms_ssh_root_key}"
}