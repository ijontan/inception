FROM debian:11.9

RUN apt-get -y update && apt-get install -y apt-transport-https

RUN apt install -y nginx
EXPOSE 443/tcp
EXPOSE 443/udp

COPY ./conf/nginx.conf /etc/nginx/conf.d


