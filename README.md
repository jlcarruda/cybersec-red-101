# Cybersecurity: Local Lab
This repo's objective is to focus all configurations for creating a local cybersecurity lab on you local machine.

It focus on creating `Docker containers and network` to create an environment for testing.

## Requirements
- Docker

## Usage
### Build Environment
#### Linux
Just run the `build-environment.sh` and it should attach to the `parrot` attacker container, after deployed the `target` container

#### Other OS
The scripts are considering a Linux (or WSL) environment. 

For any other OS's user, the recommendation is to run each command on `build-environment.sh` (order matters) for creating the local environment.
### Cleanup on Linux
There's a helper script `unmount-environment.sh` for cleaning up only the containers and network that were used on the lab.

## Containers

We have three containers configured on this repo, plus a network for connection between them being isolated

- parrot: the attacker container. This is the main workspace we will use for targeting the other containers
- juiceshop: [OWASP Juiceshop](https://owasp.org/www-project-juice-shop) vulnerable web app
- webgoat: [OWASP Webgoat](https://owasp.org/www-project-webgoat) vulnerable web app 
