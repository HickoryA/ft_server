

FROM debian:buster

RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install wget
RUN apt-get -y install openssl
RUN apt-get -y install php-fpm
RUN apt-get -y install php7.3 php-mysql  php-cli php-zip php-mbstring

COPY ./srcs ./root/


CMD bash root/initserver.sh

