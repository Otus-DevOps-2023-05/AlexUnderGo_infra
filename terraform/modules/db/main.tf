resource "yandex_compute_instance" "db" {
#  provider = yandex

  name = "reddit-db"
  labels = {
    tags = "reddit-db"
  }

  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
#Connect to VM
connection {
     type  = "ssh"
     host  = self.network_interface[0].nat_ip_address
     user  = "ubuntu"
     agent = true
     # путь до приватного ключа (Не используется. Подключаюсь через agent ssh)
     #  private_key = var.private_key
   }
#Change mongod conf for use external IP
   provisioner "remote-exec" {
     inline = [
       "sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/' /etc/mongod.conf",
       "sudo systemctl restart mongod",
     ]
   }

}
