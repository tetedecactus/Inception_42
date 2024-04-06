FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install mariadb-server -y

LABEL version="1.0"
LABEL description="MariaDB Server"

# Return 1 if health check is bad 0 if good
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

#Expose le default port de MariaDB
EXPOSE 3306

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["mariadb"]

RUN service mysql start;

# SQL_DATABASE dans mon .env -> send by docker-compose.yml
RUN mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# SQL_USER & SQL_PASSWD -> .env -> docker_compose.yml
RUN mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#Donne all privileges au USER
RUN mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

#https://mariadb.com/kb/en/creating-a-custom-container-image/