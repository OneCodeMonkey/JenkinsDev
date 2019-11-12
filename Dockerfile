FROM php:7.3-apache
MAINTAINER docker201904171 "1460018362@qq.com"
ENV REFRESHED_AT 2019-11-11
RUN apt-get update
RUN apt-get install -y git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/b        in --filename=composer
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y cron icu-devtools libfreetype6-dev libicu-dev libjpeg62-turbo-dev libpng-dev libsasl        2-dev libssl-dev libwebp-dev libxpm-dev libzip-dev nodejs unzip zlib1g-dev
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && yes '' | pecl install redis \
        && docker-php-ext-configure gd --with-freetype-dir --with-gd --with-jpeg-d        ir --with-png-dir --with-webp-dir --with-xpm-dir --with-zlib-dir \
            && docker-php-ext-install gd intl pdo_mysql zip \
                && docker-php-ext-enable opcache redis
                RUN apt-get clean \
                    && apt-get autoclean \
                        && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*