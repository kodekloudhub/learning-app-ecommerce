# Stage 1: Build PHP application
FROM php:7.4-apache

# Set environment variables
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

# Install MySQL client
RUN apt-get update && apt-get install -y default-mysql-client

# Install mysqli and pdo_mysql extensions
RUN docker-php-ext-install mysqli pdo_mysql

# Copy your source code to /var/www/html
COPY . /var/www/html

# Configure Apache
COPY apache-config.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
