#!/bin/bash

# Attendre que MySQL soit prêt
# until mysqladmin ping -h localhost --silent; do
#     echo 'En attente du démarrage de MySQL...'
#     sleep 1
# done

# Créer la base de données et l'utilisateur
# mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" && \
# mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" && \
# mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'localhost';"



set -e  # Exit the script on any error

# Start MariaDB service
service mysql start

# Create database (use environment variable)
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create user (use environment variables)
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant all privileges to the user for the database (use environment variables)
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"

# Flush privileges
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

echo "Database '${SQL_DATABASE}' created with user '${SQL_USER}' and password '${SQL_PASSWORD}'"
