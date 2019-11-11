FROM debian:buster

RUN apt-get update -qy \
&& apt-get install -yq nginx default-mysql-server wordpress

COPY ./srcs/ /usr/local/nginx/html/

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]