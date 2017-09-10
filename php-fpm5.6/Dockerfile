FROM php:5.6-fpm
RUN apt-get update && apt-get install -y libpng-dev vim supervisor

RUN	docker-php-ext-install mysqli mysql pdo_mysql gd pcntl memcached \

	&& pecl install redis \
    && docker-php-ext-enable redis \

    # 安装memcache扩展
    && apt-get install -y php5-memcache vim \
    && ln -s /usr/lib/php5/20131226/memcache.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/ \
    && docker-php-ext-enable memcache \

    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

COPY ./display.ini /usr/local/etc/php/conf.d/

