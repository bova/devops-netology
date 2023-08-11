locals {
  ssh_username = "ubuntu"
ssh_root_key = file("/root/.ssh/id_ed25519.pub")
}
