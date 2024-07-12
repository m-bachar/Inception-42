# Use the Debian oldstable base image
FROM debian:oldstable

# Set the working directory for subsequent commands
WORKDIR /var/www/html

# Remove all files and directories in the current working directory
RUN rm -rf *

# Update and upgrade packages in the base image
RUN apt update -y && apt upgrade -y

# Install required packages: curl, PHP, PHP-FPM, PHP MySQL extension
RUN apt install curl php php-fpm php-mysql -y

# Download and install WP-CLI (WordPress Command Line Interface)
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy custom PHP-FPM pool configuration file to the container
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Create directories for PHP-FPM socket and adjust ownership
RUN mkdir -p /run/php /var/run/php && \
    chown www-data:www-data /run/php /var/run/php

# Copy a script named script.sh to /usr directory in the container
COPY ./tools/script.sh /usr/script.sh

# Make script.sh executable
RUN chmod +x /usr/script.sh

# Define the command to run when the container starts
CMD [ "/usr/script.sh" ]
