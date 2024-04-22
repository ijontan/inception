FROM debian:11.9

RUN apt-get -y update && apt-get install -y apt-transport-https
RUN apt-get -y upgrade

RUN apt-get -y install php7.4-fpm php7.4-mysql wget systemctl

WORKDIR /var/www/html
RUN wget -c http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz

RUN mv wordpress/* . && rm -rf wordpress latest.tar.gz

RUN groupadd wordpress_user
RUN useradd -g wordpress_user wordpress_user

COPY ./conf/wordpress_pool.conf /etc/php/7.4/fpm/pool.d

RUN mkdir -p /run/php/

RUN ls -la

CMD [ "systemctl", "start", "php7.4-fpm" ]
