FROM alpine:latest

RUN apk update && apk upgrade  

RUN apk add nginx

# RUN if [ ! -f /etc/ngnix/ngnix.conf ]; then \
#     apk add ngnix; \
# fi

# COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 4242

ENV NGINX_DAEMON off

CMD ["nginx", "-g", "daemon $NGINX_DAEMON;"]
