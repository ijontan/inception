#!/bin/bash

install_wp-cli () {
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
	chmod +x wp-cli.phar 

	mv wp-cli.phar /usr/local/bin/wp
}

setup_wordpress () {
	wp core download --allow-root

	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php


	wp core install --url=$DOMAIN/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER \
		--admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL \
		--skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
}

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	cd /var/www/html
	rm -rf *
	# install_wp-cli
	setup_wordpress
fi

exec "$@"
