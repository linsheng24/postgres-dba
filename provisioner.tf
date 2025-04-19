resource "null_resource" "install_postgres" {
  depends_on = [
    linode_instance.postgres_vm
  ]
  triggers = {
    always_run = timestamp()
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y software-properties-common",
      "sudo add-apt-repository -y ppa:deadsnakes/ppa",
      "sudo apt update -y",
      "sudo apt install -y postgresql-12",
      "sudo systemctl stop postgresql",
      "sudo ln -s /usr/lib/postgresql/12/bin/* /usr/sbin/",
      "sudo apt install -y python3.10 python3.10-venv python3.10-distutils",
      "curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10",
      "sudo pip install setuptools==70",
      "sudo pip install patroni",
    ]

    connection {
      type        = "ssh"
      user        = "root"
      private_key = file("~/.ssh/id_rsa")
      host        = linode_instance.postgres_vm.ip_address
      timeout     = "2m"
    }
  }
}

output "ssh_command" {
  value = "ssh root@${linode_instance.postgres_vm.ip_address}"
}