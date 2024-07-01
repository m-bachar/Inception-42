FROM debian:buster

RUN apt update && apt upgrade && apt install vim -y && apt install curl -y

RUN apt install nginx -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mbachar.crt -keyout /etc/nginx/ssl/mbachar.key -subj "/C=MA/ST=KH/L=Khouribga/O=42/OU=42/CN=mbachar.42.fr/UID=mbachar"

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY /tools/index.html /var/www/html/index.html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
