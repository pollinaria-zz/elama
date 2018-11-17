FROM nginx

RUN  apt update && apt install php-fpm -y

COPY index.php /var/www/index.php
COPY nginx.conf /etc/nginx/sites-enabled/default

CMD ["service", "php7.0-fpm", "start"]