# Définition du chemin vers le fichier docker-compose.yml
COMPOSE_FILE = ./srcs/docker-compose.yml

# Définir des cibles pour les commandes docker-compose
.PHONY: build up down logs restart stop

# Construire les images Docker
build:
	docker-compose -f $(COMPOSE_FILE) build

# Lancer les conteneurs en mode détaché
up:
	docker-compose -f $(COMPOSE_FILE) up -d

# Arrêter et supprimer les conteneurs et les réseaux
down:
	docker-compose -f $(COMPOSE_FILE) down

# Afficher les logs des conteneurs
logs:
	docker-compose -f $(COMPOSE_FILE) logs -f

# Redémarrer les conteneurs
restart:
	docker-compose -f $(COMPOSE_FILE) restart

# Arrêter les conteneurs
stop:
	docker-compose -f $(COMPOSE_FILE) stop
