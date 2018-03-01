# Author: Aysad Kozanoglu
# Docker fabrication for  nginx with multiple php
# php versions 7.1 & 5.6
# expose ports 8881 8891
# Only for development - to use in Prod let make nginx trough some little configs more secure and faster
# look in my gist or github/aysadkozanoglu/mytools or aysad.pe.hu/note  



FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive

# install NGINX
RUN apt-get update && \
	apt-get install -y nginx --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*
	

# set repository
RUN apt-get update && \
	apt-get install -y apt-transport-https ca-certificates curl gnupg --no-install-recommends && \
	rm -rf /var/lib/apt/*
RUN curl https://packages.sury.org/php/apt.gpg | apt-key add -
RUN echo 'deb https://packages.sury.org/php/ jessie main' > /etc/apt/sources.list.d/deb.sury.org.list


# install PHP 7.1
RUN apt-get update && \
	apt-get install -y php7.1 php7.1-cli php7.1-fpm --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*


# install PHP 5.6
RUN apt-get update && \
	apt-get install -y php5.6-cli php5.6-fpm --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*


# verify versions
RUN php7.1 -v
RUN php5.6 -v
RUN php -v


# clear active virtual hosts
RUN rm -f /etc/nginx/sites-enabled/*


# prepare PHP 7.1 virtual host
RUN mkdir /var/www/site-with-php7.1
COPY index.php /var/www/site-with-php7.1/index.php
COPY site-with-php7.1.vhost /etc/nginx/sites-available/site-with-php7.1


# prepare PHP 5.6 virtual host
RUN mkdir /var/www/site-with-php5.6
COPY index.php /var/www/site-with-php5.6/index.php
COPY site-with-php5.6.vhost /etc/nginx/sites-available/site-with-php5.6


# enable the virtual hosts
RUN ln -s ../sites-available/site-with-php5.6 /etc/nginx/sites-enabled
RUN ln -s ../sites-available/site-with-php7.1 /etc/nginx/sites-enabled


# (Docker-specific) install supervisor so we can run everything together
RUN apt-get update && \
	apt-get install -y supervisor --no-install-recommends && \
	rm -rf /var/lib/apt/lists/*
COPY supervisor.conf /etc/supervisor/supervisord.conf
RUN mkdir -p /run/php

EXPOSE 8881 8891
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
