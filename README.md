# Cybersecurity: Local Lab
This repo's objective is to focus all configurations for creating a local cybersecurity lab on you local machine.

It focus on creating `Docker containers and network` to create an environment for testing.

## Requirements
- Docker

## Usage
The `attacker` container will fire up the targets. 
```
docker compose run attacker bash
```

## Containers

We have three containers configured on this repo, plus a network for connection between them being isolated

- `attacker`: the attacker container, based on ParrotOS Image. This is the main workspace we will use for targeting the other containers
- `juiceshop`: [OWASP Juiceshop](https://owasp.org/www-project-juice-shop) vulnerable web app
- `webgoat`: [OWASP Webgoat](https://owasp.org/www-project-webgoat) vulnerable web app 
