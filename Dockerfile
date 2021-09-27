FROM php:8.0.9

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Composer, se hace la instalación apartir de una imagen en docker
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Instalar extensiones de PHP
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Se posiciona en la carpeta de publicación en apache y se mueve todo el contenido a la carpeta
WORKDIR /app
COPY . /app

# Se otorga el permiso para usar el comando
ENV COMPOSER_ALLOW_SUPERUSER 1

# Se instala las dependecias via composer
RUN  /usr/bin/composer install

CMD php artisan serve --host=0.0.0.0 --port=80
EXPOSE 80