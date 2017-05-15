FROM hub.c.163.com/library/php:7.1.4-apache

MAINTAINER xiaobe <wyy.xb@qq.com>

ADD ./webhook.php /var/www/

RUN apt-get update \
    && apt-get install -y git sudo \

    && mkdir /var/www/GIT \
    && chown -R www-data /var/www/GIT  \
    && usermod -u 1000 www-data 

EXPOSE 80
