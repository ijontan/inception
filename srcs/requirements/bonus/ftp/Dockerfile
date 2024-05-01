FROM debian:11.9

RUN apt -y update && apt install -y vsftpd
COPY ./conf/vsftpd.conf /
COPY ./tools/setup.sh /
RUN chmod 777 /setup.sh
CMD [ "/setup.sh" ]
