FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y wget

RUN apt-get install -y php\
    php-fpm\
    php-mysql\
    mariadb-client

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mv wordpress /var/www/html/
RUN chown -R www-data:www-data /var/www/html/wordpress
    