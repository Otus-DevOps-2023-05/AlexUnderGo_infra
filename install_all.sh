#!/bin/bash
useradd -m -s /bin/bash yc-user
mkdir /home/yc-user/.ssh
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCqa4/qGYW94xv1eFcY97pKKtE1PfH+WWPNAODBzWIlmZ/GNVJxPHAus6NfWnS68gn9OsmV4gtyPj4NPSjlkzSxADS6NHqGHBJVQpDRy11F94Mw07LYLDdtdE5mx947djuFt7TEN3O+aAAu5Tf0yqYf1a7v+QLuNlksDVH7tnbHozCTWn38VVvf799KfhZAsD+EYf0tG5vp7IWPPjwMHXjLcM0U8CYG5O4tes36gqg03OeL808cD9/s68v9UddTqrOrMaP6paFuMjMv2MwIlQdQKpq4kgs9u/85aRv4YDKLrf6c5BiHAJNdlX1giwfL9VhWAzHFf0CBrA5zNkc5ROgZjB50Yz5dK5tERt1P9zXfpiMeaM3JiOY5xd1T7ksRN/TswSLSGXL7d0IP8pxg7hHQPbXd1ZpJHNdRWQt7VGJ+Tq4n8pVlepStTBIs5HYNcLZ+Cj2pOdQgPT+FiDXI2bGi1e71s0K19H4lb5Bkk8j+KrjB2gOrA1hmfnEC93qWbzk= alex@Otus" >/home/yc-user/.ssh/authorized_keys
#ruby
sudo apt update && sudo apt upgrade
sudo apt install -y ruby-full ruby-bundler build-essential
#mongodb
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
#deploy
sudo apt install -y git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
sudo gem install bundler
puma -d
