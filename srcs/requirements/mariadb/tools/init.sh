#!/bin/bash
# https://github.com/MariaDB/mariadb-docker/blob/master/10.11/docker-entrypoint.sh

# todo ask how should I go about this
docker_temp_server_start() {
	mariadbd --skip-networking --default-time-zone=SYSTEM --wsrep_on=OFF \
		--expire-logs-days=0 \
		--loose-innodb_buffer_pool_load_at_startup=0 &
	declare -g MARIADB_PID
	MARIADB_PID=$!
}

docker_temp_server_stop() {
	kill "$MARIADB_PID"
	wait "$MARIADB_PID"
}

setup(){
	sleep 5
	envsubst < /run/tools/setup.sql > run.sql
	cat run.sql
	mariadb -e "SOURCE ./run.sql;"
	echo "done setup!"
}

main() {
	docker_temp_server_start
	setup 
	docker_temp_server_stop

	kill $(cat /var/run/mysqld/mysqld.pid)
	exec "mariadbd"
}

main
