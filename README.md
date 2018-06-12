# easy-pi-hosting

## What is it

There is no pretention, this is just a way to stack a few wonder togethher.  Fisrt of all, Raspberry Pi dont need much presentation these days.  Second is Docker (and Swarm), so powerful and such a game changer, but not as easy as many expect.  So an other precious stone for our fondation will be Hypriot, a Linux disrtribution optimised for the Pi based on Raspbian with docker pre-install.  Portainer is our fourth gem and will give us an easy way to manage our Docker services.

All this will be useless without Load balancing and not complete without SSL certificat.  Those are provide by our next piece: Traefik (SSL by Lets Encrypt).  Our Traefik will be configure out of the box to use Cloudflare DNS for SSL certificats validations, so event if your internet provider is blocking port 80, you will be able to get an SSL certificate and enjoy a full https server at home.

So all I did is to make it easy to deploy all this together.

## Installation overview

  * Register a domain with an internet registrar
  * Transfer your DNS server to Cloudflare
  * Install Hypriot on your Raspberry Pi
  * Copy install.sh and docker-compose.yml on the Pi
  * Run install.sh and answer 6 questions
    * Portainer Hostname
    * Traefik Hostname
    * Portainer backend name (for Traefik)
    * Cloudflare Email
    * Cloudflare API Global Key
    * Lets Encrypt recovery email
  * Get a coffee and then enjoy the ride...
  
  ## Terminal installation part
  
  $ wget https://raw.githubusercontent.com/XtremXpert/easy-pi-hosting/master/install.sh
  $ wget https://raw.githubusercontent.com/XtremXpert/easy-pi-hosting/master/docker-compose.yml
  $ ./install.sh    
Installation de Portainer/Traefik
Pour que cet installateur fonctionne, vous devez au préalable
installer Hypriot sur votre Raspberry-pi (de préférence 3 ou +).
Vous devez également être propriétaire d'un nom de domaine et
avoir créer un compte chez Cloudflare et y avez transféré vos
services de serveur DNS (gratuit) pour ce nom de domaine.

Avez-vous un nom de domaine et le compte Cloudflare associé? ([o]ui ou [n]on): o
Nom d'hôte pour rejoindre Portainer: rpi01.test.biz 
Nom d'hôte pour rejoindre Traefik: traefik01.test.biz
Adresse courriel de récupération pour Lets'Encrypt: benoit@test.biz
Adresse courriel de votre compte Cloudflare: benoit@test.biz 
Clé d'API Global pour votre compte Cloudflare: ab8bc5a8383d0acc0b73c175cb041a8383a99
Nom de domaine pour Docker: test.biz
rvutx53six7xoh1rwb73w487l
Creating network maestro_agent_network
Creating service maestro_proxy
Creating service maestro_agent
Creating service maestro_portainer

