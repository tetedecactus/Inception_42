FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt install nginx -y

RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

# openssl req -> openssl certificate request
# -x509 -> self-signed certificate
# -nodes -> don't want to include a private key in the certificate itself 
#    (the private key will be generated separately).
# -out -> output file for the generated certificate
# -keyout -> specifies the output file for the generated private key
# -subj -> defines the subject information that will be embedded in the certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=CA/ST=QC/L=Quebec/O=42/OU=42/CN=login.42.fr/UID=olabrecq" 

# create folder for config file
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chown 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]
