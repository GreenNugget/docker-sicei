FROM php:7.4.10

# Dependencias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Instalación de composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Extensiones de PHP
RUN docker-php-ext-install pdo_mysql mbstring

WORKDIR /app
COPY . /app

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN  /usr/bin/composer install

CMD php artisan serve --host=0.0.0.0 --port=8080
EXPOSE 8080