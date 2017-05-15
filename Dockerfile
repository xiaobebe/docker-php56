FROM daocloud.io/php:5.6-apache

MAINTAINER xiaobe <wyy.xb@qq.com>

# APT 自动安装 PHP 相关的依赖包,如需其他依赖包在此添加
RUN apt-get update \

    # 官方 PHP 镜像内置命令，安装 PHP 依赖
    && docker-php-ext-install \
        mysql \
        pdo_mysql \

    # 安装memcache扩展
    && apt-get install -y php5-memcache vim \
    && ln -s /usr/lib/php5/20131226/memcache.so /usr/local/lib/php/extensions/no-debug-non-zts-20131226/ \
    && docker-php-ext-enable memcache \


    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \

    && usermod -u 1000 www-data

COPY ./display.ini /usr/local/etc/php/conf.d/
