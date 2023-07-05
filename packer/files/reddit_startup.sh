#!/bin/bash
#Создаем юнит
cat > /etc/systemd/system/puma.service << EOF
[Unit]
Description=Puma server
After=network-online.target

[Service]
User=ubuntu
ExecStart=/usr/local/bin/pumactl start --pidfile /var/run/puma.pid
Restart=always
Environment=PATH=/usr/bin:/usr/local/bin
WorkingDirectory=/home/ubuntu/reddit

[Install]
WantedBy=multi-user.target
EOF
#Запускаем сервис
sudo systemctl daemon-reload
sudo systemctl enable puma
sudo systemctl start puma
