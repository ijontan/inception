FROM debian:11.9

RUN apt-get -y update && apt-get install -y apt-transport-https
RUN apt-get -y upgrade

RUN apt-get -y install g++ make git

WORKDIR /var/www/html/
RUN git clone https://github.com/ijontan/webserv.git

WORKDIR /var/www/html/webserv
RUN make

CMD [ "./webserv", "./config_files/default.conf"]

