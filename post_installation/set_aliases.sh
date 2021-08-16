#!bin/bash

ALIASES=(
  "dcup='docker-compose up -d'"
  "dcdown='docker-compose down'"
  "dcrefresh='dcdown && dcup'"
  "dstop='docker ps -q | xargs docker stop'"
  "dinit='sudo systemctl start docker && dstop && dcup'"
  "adog='git log --all --decorate --oneline --graph'"
  "update='sudo dnf upgrade -y && sudo dnf autoremove && flatpak update -y'"
)

for alias in "${ALIASES[@]}"; do
  echo "alias $alias" >> ~/.bashrc
done

source ~/.bashrc
