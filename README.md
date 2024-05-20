# Traefik
C'est un rp et routeurs de trafic pour les containeurs qui permeyt la gestion et le traitement du trafic entrants sur les services conteneurisés.
## Installation de traefik 

[X] via les binaires en fonction l'architecture de l'os linux
[ ] via une image docker
[ ] via Helm pour les clusters kubernetes

- Traefik n'a pas de fichiers de configuration dédiés
- On peut l'installer soit en y rajoutant des fichiers de configuration soit en créant un service dans systemd
- Commande de lancement de traefik : 
> `traefik --accesslog=true --api=true --api.insecure=true --api.dasboard=true --api.debug=true --log.level=INFO` 

### 1- Entrypoints

### 2- Middelwares

#### Authentification 
#### Rate Limiting 
#### Redirection
#### CORS 

### 3- Providers
#### Docker
#### Files system
#### ETCD
#### Kubernetes

### 4- Features

