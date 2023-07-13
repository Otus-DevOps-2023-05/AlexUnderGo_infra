#!/bin/bash
#sleep 1m
#apt update && apt upgrade && apt install -y ruby-full ruby-bundler build-essential
#while `sudo fuser -v /var/lib/dpkg/lock-frontend >/dev/null 2>&1`; [ $? -eq 0 ]; do sleep 2; done
sleep 2m
apt update && apt upgrade
apt install -y ruby-full ruby-bundler build-essential
#ruby -v
#bundler -v
