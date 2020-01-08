FROM debian:buster
MAINTAINER juligonz@student.42.fr

RUN apt-get update -qy \
&& apt-get upgrade -qy \
&& apt-get install -qy nginx default-mysql-server php7.3-fpm php7.3-mysql wget

COPY ./srcs/* srcs_docker/

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["srcs_docker/docker-entrypoint.sh"]