FROM debian:11.9

RUN apt-get -y update && apt install -y curl php7.4 php7.4-fpm php7.4-mysql adminer

RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/index.php 
# RUN id -u www-data &>/dev/null || useradd -m www-data && \
# 	groupadd www-data && \
# 	usermod -a -G www-data www-data

COPY ./conf/www.conf /etc/php/7.4/php-fpm.d/www.conf
RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir /run/php

EXPOSE 9000
STOPSIGNAL SIGQUIT

CMD ["php-fpm7.4", "--nodaemonize"]
