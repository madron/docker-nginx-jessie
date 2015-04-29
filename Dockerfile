FROM debian:jessie
MAINTAINER Massimiliano Ravelli, massimiliano.ravelli@gmail.com

# nginx user
RUN groupadd -g 999 nginx && useradd -u 999 -g 999 nginx

RUN apt-get update && \
    apt-get install -y nginx-full && \
    rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
