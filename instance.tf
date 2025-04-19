resource "linode_instance" "postgres_vm" {
  label = "terraform-postgres-vm"
  region = var.region
  type = var.instance_type
  image = "linode/ubuntu20.04"
  root_pass = var.root_password

  authorized_keys = [
    trimspace(file("~/.ssh/id_rsa.pub"))
  ]
}
