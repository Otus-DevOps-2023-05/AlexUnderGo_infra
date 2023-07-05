#!/bin/bash

#С какого образа создавать виртуальную машину(Не обязательный параметр)
image_id="fd891msjtpc79uv0asfo"

#Создание виртуальной машины на Yandex-Cloud
yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-id="$image_id" \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --ssh-key /home/alex/.ssh/id_rsa_yandex.pub
