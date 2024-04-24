FROM debian:11.9

RUN apt-get -y update && apt-get install -y apt-transport-https
RUN apt-get -y upgrade

RUN apt-get -y install php7.4-fpm php7.4-mysql wget

WORKDIR /var/www/html

RUN groupadd wordpress_user
RUN useradd -g wordpress_user wordpress_user

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php/

RUN ls -la

COPY ./tools/init.sh /
RUN chmod 755 /init.sh
ENTRYPOINT [ "/init.sh" ]
RUN    ln -sf /dev/stdout /var/log/7.4-fpm.log
CMD [ "php-fpm7.4", "-F", "-R" ]
