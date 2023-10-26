#!/bin/bash

./ascii.sh

docker network create \
  --internal \
  --driver bridge \
  --subnet 172.168.0.0/16 \
  --gateway 172.168.0.1 \
  vulnerable 

##TODO: not working. /bin/services.sh failing for /dev/console is missing
## Run vulnerable target
# docker run -d \
#     --network vulnerable \
#     --ip="172.168.0.3" \
#     --name metasploitable \
#     --hostname metasploitable \
#     tleemcjr/metasploitable2:latest \
#     sh -c "/bin/services.sh"

## Run webgoat and webwolf services
docker run -d -p 8080:8080 -p 9090:9090 -p 80:8888 -e TZ=Europe/Amsterdam \
  --network vulnerable \
  --ip="172.168.0.5" \
  --name webgoat \
  --hostname webgoat \
  webgoat/goatandwolf:latest

## Run OWASP juiceshop
docker run -d \
  -p 3000:3000 \
  --network vulnerable \
  --ip="172.168.0.4" \
  --name juiceshop \
  --hostname juiceshop \
  bkimminich/juice-shop


## Run attacker container
docker run \
    --name parrot \
    -it \
    --hostname parrot \
    --network vulnerable \
    --ip="172.168.0.2" \
    --env DISPLAY=$DISPLAY \
    -v /dev/shm:/dev/shm \
    --mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix \
    parrotsec/security:latest \
    /bin/bash
  
