FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

# Uncomment these lines to use environment variables from .env
ENV SQL_DATABASE="inception"
ENV SQL_USER="olabrecq"
ENV SQL_PASSWORD="kirikou"
ENV SQL_ROOT_PASSWORD="jeanclaude"

RUN apt-get install mariadb-server -y

LABEL version="1.0"
LABEL description="MariaDB Server"

# Return 1 if health check is bad 0 if good
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

# Copie du fichier de configuration personnalisé
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copie du script pour initialiser la base de données
COPY init_db.sh /app/init_db.sh

# Changement des permissions et exécution du script
RUN chmod +x /app/init_db.sh

# Commande pour démarrer MariaDB
# CMD ["mysql"]

# Exécution du script d'initialisation après le démarrage de MariaDB
ENTRYPOINT [ "/app/init_db.sh" ]

CMD [ "mysql" ]
# Expose the default port of MariaDB
# EXPOSE 3306

# COPY conf/50-server.cnf /etc/mysql/mariadb.cnf.d/50-server.cnf

# CMD needs to be replaced with a command that uses environment variables if applicable 
# CMD ["mysqld"]

# Script pour créer la base de données et l'utilisateur après le démarrage de MySQL
# COPY init_db.sh /app/init_db.sh
# RUN chmod +x /app/init_db.sh
# 
# Start MySQL with environment variables (if used)
# RUN service mysql start # Supprimé

# Commenté pour exécuter les commandes après le démarrage de MySQL
# RUN mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" && \
#     mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" && \
#     mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'localhost';"

# Exécute le script pour créer la base de données et l'utilisateur après le démarrage de MySQL
# CMD ["/app/init_db.sh"]

# Liens utiles pour la configuration et la personnalisation de l'image MariaDB
# https://mariadb.com/kb/en/creating-a-custom-container-image/
# https://mariadb.com/kb/en/configuring-mariadb-with-option-files/
# https://docs.docker.com/compose/environment-variables/env-file/


# [client-server]
# !includedir /etc/mysql/conf.d/
# !includedir /etc/mysql/mariadb.conf.d/