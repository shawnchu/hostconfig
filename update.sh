#!/bin/zsh
# update and export current IP address.
#
# Usage: crontab -e
# # m h  dom mon dow   command
# 5 22   *   *   *    ~/hostconfig/update.sh
#
# Retrieve public IP from: https://github.com/shawnchu/hostconfig/blob/main/host.conf
cd ~/src/hostconfig || exit
published=$(cat host.conf)
my_ip=$(curl -4 ifconfig.me)

if [[ -n $my_ip && $my_ip != $published ]]; then
  echo "$my_ip" > host.conf
  git add .
  git ci
  git push
fi

