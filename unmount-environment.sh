#!/bin/bash

containers=("parrot" "metasploitable" "webgoat" "juiceshop")

function killContainer() {
  name=$1
  if [ -n "$(docker ps -a | grep "$name" | awk '{print $1}')" ]; then
    docker container stop "$name" > /dev/null 2>&1 
    docker container rm "$name" > /dev/null 2>&1 
    echo "${name} container removed"
  else
    echo "${name} container not found"
  fi

}

for name in "${containers[@]}"; do
  killContainer "$name"
done

if [ -n "$(docker network ls | grep vulnerable | awk '{print $2}')" ]; then
  docker network rm vulnerable > /dev/null 2>&1
  echo "'vulnerable' network removed"
else
  echo "No network found"
fi
