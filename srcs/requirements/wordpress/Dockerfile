FROM alpine:3.16

ARG PHP_VERSION=8 \
    DB_NAME \
    DB_USER \
    DB_PASS \
    DOMAIN_NAME \
    TITLE \
    MAIL \
    WP_USER \
    WP_PASS \
    WP_MAIL

RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-phar \
    wget \
    unzip ; \
    rm -f /var/cache/apk/*

COPY ./requirements/wordpress/config/www.conf /etc/php8/php-fpm.d/

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . &&\
    rm -rf wordpress latest.zip;

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY ./requirements/wordpress/tools/config-create.sh .


RUN sh config-create.sh && rm config-create.sh && \
    chmod -R 0777 wp-content/
    # sh start.sh

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8", "-F"]