#!/bin/bash

set -xe

# Install git (the php image doesn't have it) which is required by composer
apt-get update -yqq
apt-get install git wget libzip-dev libpng-dev libxml2-dev zip unzip -yqq
apt-get install -y gnumeric --no-install-recommends

# Install phpunit, the tool that we will use for testing
curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-8.phar
chmod +x /usr/local/bin/phpunit

# Install mysql driver
# Here you can install any other extension that you need
docker-php-ext-install pdo_mysql gd zip bcmath soap redis

# Install composer
wget https://composer.github.io/installer.sig -O - -q | tr -d '\n' > installer.sig
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === file_get_contents('installer.sig')) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php'); unlink('installer.sig');"
cp composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
