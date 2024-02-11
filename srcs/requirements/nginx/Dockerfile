FROM alpine:latest
RUN apk update && \
    apk upgrade && \
    apk add nginx

# COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 4242
CMD ["nginx", "-g", "daemon off;"]
