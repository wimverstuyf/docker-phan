FROM php:7.3

WORKDIR /tmp

# Install phpunit, composer and php extensions
COPY bootstrap.sh /bootstrap.sh
RUN chmod +x /bootstrap.sh
RUN /bootstrap.sh

# Install ast extension
COPY ast_install.sh /ast_install.sh
RUN chmod +x /ast_install.sh
RUN /ast_install.sh
