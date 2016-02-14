FROM php:5.6-apache
MAINTAINER David Keller <dnkeller@oakland.edu>
RUN docker-php-ext-install mysqli
COPY config/php.ini /usr/local/etc/php/
COPY src/ /var/www/html/
