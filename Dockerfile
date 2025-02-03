FROM php:8.2-apache
# 安装依赖和扩展
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# 复制代码并安装依赖
COPY . /var/www/html
RUN composer install --no-dev
# 暴露端口
EXPOSE 80
