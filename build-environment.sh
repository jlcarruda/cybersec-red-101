#!/bin/sh

docker network create vulnerable \
  --attachable \
  --subnet 10.0.0.0/24

docker pull parrotsec/security:latest
docker pull tleemcjr/metasploitable2

## Run vulnerable target
docker run -d \
    --network vulnerable \
    --ip="10.0.0.3" \
    --name metasploitable \
    --hostname metasploitable2 \
    tleemcjr/metasploitable2 \
    sh -c "/bin/services.sh"

## Run attacker container
docker run \
    --name parrot \
    -it \
    --hostname parrot \
    --network vulnerable \
    --ip="10.0.0.2" \
    --env DISPLAY=$DISPLAY \
    -v /dev/shm:/dev/shm \
    --mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix \
    parrotsec/security:latest \
    /bin/bash
  
