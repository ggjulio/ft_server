FROM debian:buster
MAINTAINER juligonz@student.42.fr

RUN apt-get update -qy \
&& apt-get update -qy \
&& apt-get install -qy nginx default-mysql-server php7.3-fpm php7.3-mysql \
&&

#COPY ./srcs/* /usr/local/nginx/html/

# WORKDIR /usr/local/nginx/html/

# RUN ls

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]

