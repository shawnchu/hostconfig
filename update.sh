#!/bin/zsh
# update and export current IP address.
cd ~/hostconfig || exit
published=$(cat host.conf)
my_ip=$(curl -4 ifconfig.me)

if [[ -n $my_ip && $my_ip != $published ]]; then
  echo "$my_ip" > host.conf
  git add .
  git ci
  git push
fi

