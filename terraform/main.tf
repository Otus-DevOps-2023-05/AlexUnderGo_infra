terraform {
  required_version = ">= 0.13.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.94.0"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "app" {
  count = var.reddit-base_count
  name  = "reddit-base-${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.image_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }
  connection {
    type  = "ssh"
    host  = self.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = true
    # путь до приватного ключа (Не используется. Подключаюсь через agent ssh)
    #  private_key = var.private_key
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

#resource "yandex_lb_target_group" "terra" {
#  count = var.reddit-base_count
#  name = "reddit-base-${count.index}"

#  name      = "terra"
#  region_id = "ru-central1"

#  target {
#    subnet_id = var.subnet_id
#    address   = "${yandex_compute_instance.app[count.index].network_interface.0.ip_address}"
#  }
#}
