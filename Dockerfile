FROM richarvey/nginx-php-fpm

COPY index.php /var/www/index.php
COPY nginx.conf /etc/nginx/sites-enabled/default
RUN service nginx restart
