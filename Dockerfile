FROM uofa/apache2-php7

# Upgrade all currently installed packages and install web server packages.
RUN apt update \
&& apt-get -y install php-xdebug php7.0-cli git \
&& apt-get -y autoremove && apt-get -y autoclean && apt-get clean && rm -rf /var/lib/apt/lists /tmp/* /var/tmp/*

# Get robo
RUN wget -O /usr/local/bin/robo http://robo.li/robo.phar && chmod +x /usr/local/bin/robo

COPY ./files/xdebug.ini /etc/php/7.0/mods-available/xdebug.ini

# Configure apache modules, php modules, error logging.
RUN phpenmod -v ALL -s ALL xdebug
