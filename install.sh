#!/bin/bash
function ask_yes_or_no() {
    read -p "$1 ([o]ui ou [n]on): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes|o|oui) echo "oui" ;;
        *)     echo "non" ;;
    esac
}

echo "Installation de Portainer/Traefik"
echo "Pour que cet installateur fonctionne, vous devez au préalable"
echo "installer Hypriot sur votre Raspberry-pi (de préférence 3 ou +)."
echo "Vous devez également être propriétaire d'un nom de domaine et"
echo "avoir créer un compte chez Cloudflare et y avez transféré vos"
echo "services de serveur DNS (gratuit) pour ce nom de domaine."
echo ""
if [[ "non" == $(ask_yes_or_no "Avez-vous un nom de domaine et le compte Cloudflare associé?") ]]
then
    echo "Obtenez un nom de domaine et un compte cloudflare et relancer ce script."
    exit 0
fi

read -p "Nom d'hôte pour rejoindre Portainer: " INPUT_PORTAINER_HOSTNAME
read -p "Nom d'hôte pour rejoindre Traefik: " INPUT_TRAEFIK_HOSTNAME
read -p "Adresse courriel de récupération pour Lets'Encrypt: " INPUT_LETSENCRYPT_EMAIL
read -p "Adresse courriel de votre compte Cloudflare: " INPUT_CLOUDFLARE_EMAIL
read -p "Clé d'API Global pour votre compte Cloudflare: " INPUT_CLOUDFLARE_APIKEY
read -p "Nom de domaine pour Docker: " INPUT_DOCKER_DOMAIN

docker swarm init
docker network create -d overlay proxied_network

PORTAINER_HOSTNAME=$INPUT_PORTAINER_HOSTNAME \
TRAEFIK_HOSTNAME=$INPUT_TRAEFIK_HOSTNAME \
LETSENCRYPT_EMAIL=$INPUT_LETSENCRYPT_EMAIL \
CLOUDFLARE_EMAIL=$INPUT_CLOUDFLARE_EMAIL \
CLOUDFLARE_APIKEY=$INPUT_CLOUDFLARE_APIKEY \
DOCKER_DOMAIN=$INPUT_DOCKER_DOMAIN \
docker stack deploy -c docker-compose.yml maestro
