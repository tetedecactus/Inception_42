FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

# Uncomment these lines to use environment variables from .env
ENV SQL_DATABASE  $SQL_DATABASE
ENV SQL_USER      $SQL_USER
ENV SQL_PASSWORD  $SQL_PASSWORD

RUN apt-get install mariadb-server -y

LABEL version="1.0"
LABEL description="MariaDB Server"

# Return 1 if health check is bad 0 if good
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

# Expose the default port of MariaDB
EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.cnf.d/50-server.cnf

# CMD needs to be replaced with a command that uses environment variables if applicable 
CMD ["mysqld"]

# Start MySQL with environment variables (if used)
RUN service mysql start

RUN mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" && \
    mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" && \
    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'localhost';"

#https://mariadb.com/kb/en/creating-a-custom-container-image/
#https://mariadb.com/kb/en/configuring-mariadb-with-option-files/
#https://docs.docker.com/compose/environment-variables/env-file/