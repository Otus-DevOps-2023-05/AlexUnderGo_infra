resource "yandex_compute_instance" "app" {

  name = "reddit-app"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = true
    # путь до приватного ключа (Не используется. Подключаюсь через agent ssh)
    #  private_key = var.private_key
  }

  provisioner "remote-exec" {
    inline = [
#     "echo \"export DATABASE_URL=${var.db_url}\" >> /home/ubuntu/.bashrc",
      "sudo systemctl set-environment DATABASE_URL=${var.db_url}",
      #     "source /home/ubuntu/.bashrc"
    ]
  }

  provisioner "file" {
    source      = "${path.module}/files/puma.service"
    destination = "/tmp/puma.service"
  }
  provisioner "remote-exec" {
    script = "${path.module}/files/deploy.sh"
  }

}
