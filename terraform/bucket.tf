#Создание бакета в Яндекс
terraform {
  required_version = ">= 0.13.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.35.0"
    }
  }
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "otus-bucket77"
    region   = "ru-central1"
    key      = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}
#Создание сервисного аккаунта для бакета
#resource "yandex_iam_service_account" "sa" {
#  name = "bucket-usr"
#}

# Назначение роли сервисному аккаунту
#resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
#  folder_id = var.folder_id
#  role      = "storage.editor"
#  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
#}

# Создание статического ключа доступа
#resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
#  service_account_id = "ajemb8vlrh354jgttdj7"
#  description        = "static access key for object storage"
#}

#Создание бакета с использованием ключа
#resource "yandex_storage_bucket" "otus-bucket77" {
#  access_key = "YCAJEuzaiGtOQqhmCFtn9qvJ_"
#  secret_key = "YCOk7MScJuPR8m8St2uErvVWxNsWlzmmR3RvnKL4"
#  bucket     = "otus-bucket77"
#  key        = "terraform.tfstate"
#  source     = "/home/alex/otus/AlexUnderGo_infra/terraform/"
#}
