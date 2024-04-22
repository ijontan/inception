FROM debian:11.9

RUN apt-get -y update && apt-get install -y apt-transport-https

RUN apt install -y nginx systemctl

COPY ./conf/nginx.conf /etc/nginx/conf.d

WORKDIR /etc/ssl/private
RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 \
  -nodes -keyout itan.42.fr.key -out itan.42.fr.crt -subj "/CN=itan.42.fr" \
  -addext "subjectAltName=DNS:itan.42.fr,DNS:*.itan.42.fr,IP:10.0.0.1"

WORKDIR /
CMD [ "systemctl", "start", "nginx" ]

