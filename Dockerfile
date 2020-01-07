FROM debian:buster
MAINTAINER juligonz@student.42.fr

RUN apt-get update -qy \
&& apt-get upgrade -qy \
&& apt-get install -qy nginx default-mysql-server php7.3-fpm php7.3-mysql wget tar # tar ???

#COPY ./srcs/* /usr/local/nginx/html/
COPY ./srcs/* srcs_docker/

# WORKDIR /usr/local/nginx/html/

EXPOSE 80

ENTRYPOINT ["srcs_docker/docker-entrypoint.sh"]