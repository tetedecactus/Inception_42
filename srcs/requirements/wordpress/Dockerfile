FROM alpine:3.19

RUN apk update && apk upgrade

RUN apk add --no-cache wget \
    php \
    php-fpm \
    php-mysqli \
    mariadb-client

RUN adduser -S www-data -G www-data

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN mkdir -p /var/www/html/
RUN mv wordpress /var/www/html/
RUN chown -R www-data:www-data /var/www/html/wordpress

EXPOSE 80

CMD ["php-fpm", "-F"]
