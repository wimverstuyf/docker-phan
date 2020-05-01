#!/bin/bash

set -xe

git clone https://github.com/nikic/php-ast.git
cd php-ast
phpize
./configure
make install
echo 'extension=ast.so' > /usr/local/etc/php/php.ini
cd ..
rm -rf php-ast
