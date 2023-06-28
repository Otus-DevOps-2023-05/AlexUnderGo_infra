cat <<EOF> install_ruby.sh
#!/bin/bash
#ssh -i ~/.ssh/id_rsa_yandex yc-user@51.250.82.124
sudo apt update && sudo apt upgrade
sudo apt install -y ruby-full ruby-bundler build-essential
#ruby -v
#bundler -v
EOF
