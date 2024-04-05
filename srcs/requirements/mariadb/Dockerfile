FROM alpine:latest

RUN apk update && apk upgrade  

RUN apk add mariadb

LABEL version="1.0"
LABEL description="MariaDB Server"

# Return 1 if health check is bad 0 if good
HEALTHCHECK --start-period=5m \
  CMD mariadb -e 'SELECT @@datadir;' || exit 1

#Expose le default port de MariaDB
EXPOSE 3306

CMD ["mariadb"]


#https://mariadb.com/kb/en/creating-a-custom-container-image/