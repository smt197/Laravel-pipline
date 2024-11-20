# Utiliser une image de base PHP officielle
FROM php:8.1-fpm

# Installer les extensions PHP requises pour Laravel
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    curl

# Installer Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Créer un répertoire de travail pour l'application Laravel
WORKDIR /var/www

# Copier le contenu du projet Laravel dans l'image Docker
COPY . .

# Installer les dépendances Laravel
RUN composer install --no-dev --optimize-autoloader

# Copier les permissions correctes pour les fichiers
RUN chown -R www-data:www-data /var/www

# Exposer le port 8000 pour le serveur PHP intégré de Laravel
EXPOSE 8000

# Commande pour démarrer Laravel
CMD php artisan serve --host=0.0.0.0 --port=8000
