FROM debian:11.9


RUN apt-get -y update && apt install -y redis-server

RUN echo "maxmemory 256mb" >> /etc/redis/redis.conf \
 && echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf \
 && sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis/redis.conf

CMD ["redis-server",  "--protected-mode", "no"]
