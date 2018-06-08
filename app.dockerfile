FROM php:7.1-fpm-alpine

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin/ --filename=composer
WORKDIR /app
COPY . ./
RUN composer install --no-dev --no-interaction -o