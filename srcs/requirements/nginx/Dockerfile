FROM debian:buster

RUN apt update -y && apt upgrade -y; \
    apt install nginx -y; \
    apt install openssl -y;
    # openssl req -> openssl certificate request
    # -x509 -> self-signed certificate
    # -nodes -> don't want to include a private key in the certificate itself 
    #    (the private key will be generated separately).
    # -out -> output file for the generated certificate
    # -keyout -> specifies the output file for the generated private key
    # -subj -> defines the subject information that will be embedded in the certificate
RUN mkdir -p /etc/nginx/ssl \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=CA/ST=QC/L=Quebec/O=42/OU=42/CN=login.42.fr/UID=login" 
# create folder for config file

RUN mkdir -p /var/run/nginx \
    chown 755 /var/www/html \
    chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 9000

CMD ["-g", "daemon off;"]
ENTRYPOINT ["nginx"]

# FROM alpine:3.19

# RUN apk update && \
#     apk upgrade && \
#     apk add --no-cache nginx openssl

# # RUN addgroup -S www-data && adduser -S www-data -G www-data

# RUN mkdir -p /etc/nginx/ssl && \
#     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
#     -keyout /etc/nginx/ssl/inception.key \
#     -subj "/C=CA/ST=QC/L=Quebec/O=42/OU=42/CN=login.42.fr/UID=login" 

# # create folder for config file
# RUN mkdir -p /var/run/nginx && \
#     mkdir -p /var/www/html 
#     # chown -R www-data:www-data /var/www/html

# COPY conf/nginx.conf /etc/nginx/nginx.conf

# EXPOSE 9000

# CMD ["-g", "daemon off;"]
# ENTRYPOINT [ "nginx" ]
