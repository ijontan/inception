#!/bin/bash


if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	cd /var/www/html
	rm -rf *
	wget -nv -c http://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	mv wordpress/* . && rm -rf wordpress latest.tar.gz


	sed -i "s/username_here/$DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php
fi

exec "$@"
