FROM debian:11.9

RUN apt-get -y update && apt-get install -y apt-transport-https
RUN apt-get -y upgrade

# RUN apt -y install software-properties-common

# RUN curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup && bash mariadb_repo_setup --mariadb-server-version=10.6

# RUN apt-get -y update
RUN apt-get -y install mariadb-server-10.5

RUN apt-get -y install gettext

EXPOSE 3306

RUN mkdir /run/mysqld
RUN chown -R mysql:root /run/mysqld

# HEALTHCHECK --start-period=5m \
#   CMD mariadb -e 'SELECT @@datadir;' || exit 1

RUN mkdir /run/tools
COPY ./tools /run/tools
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 755 /run/tools/init.sh && ls -la run/tools

CMD ["/run/tools/init.sh"]

