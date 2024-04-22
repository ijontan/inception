FROM debian:11.9

RUN apt-get -y update && apt-get install -y apt-transport-https
RUN apt-get -y upgrade

RUN apt-get -y install php7.4-fpm php7.4-mysql wget

WORKDIR /var/www/html
RUN wget -c http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz

RUN groupadd wordpress_user
RUN useradd -g wordpress_user wordpress_user
