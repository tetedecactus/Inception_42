#!/bin/bash

set -e  # Exit the script on any error

# Start MariaDB service
service mysql start

mysql & 

# Create database (use environment variable)
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create user (use environment variables)
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant all privileges to the user for the database (use environment variables)
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"

# Flush privileges
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

echo "Database '${SQL_DATABASE}' created with user '${SQL_USER}' and password '${SQL_PASSWORD}'"

bash