#!/bin/sh

parrot=$(docker ps -a | grep parrot | awk '{print $1}')
ms=$(docker ps -a | grep metasploitable | awk '{print $1}')

docker container stop "$parrot"
docker container rm "$parrot"
docker container stop "$ms"
docker container rm "$ms"
docker network rm vulnerable
