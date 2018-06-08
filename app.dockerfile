FROM debian-dev

# Install Nginx
RUN apt-get update -y && \
    apt-get install -y nginx=1.6.2* && \
    apt-get install -y nginx-common=1.6.2* && \
    apt-get install -y nginx-full=1.6.2*

RUN cd /etc/nginx && \
    sed -i 's/www-data/user/g' nginx.conf

# Install php-fpm
RUN apt-get update -y && \
    apt-get install -y && \
    apt-get install -y php5-fpm=5.6* && \
    apt-get install -y php5-mysql && \
    apt-get install -y php-gettext && \
    apt-get install -y php-pear && \
    apt-get install -y php-tcpdf && \
    apt-get install -y php5-apcu && \
    apt-get install -y php5-cli && \
    apt-get install -y php5-common && \
    apt-get install -y php5-curl && \
    apt-get install -y php5-dev && \
    apt-get install -y php5-gd && \
    apt-get install -y php5-intl && \
    apt-get install -y php5-json && \
    apt-get install -y php5-mcrypt && \
    apt-get install -y php5-readline && \
    apt-get install -y php5-redis && \
    apt-get install -y mysql-client

#Install & config xdebug
RUN apt-get install -y php5-xdebug && \
    echo "xdebug.max_nesting_level=5000" >> /etc/php5/mods-available/xdebug.ini

# Composer
COPY ./install-composer.sh /install-composer.sh
RUN chmod +x /install-composer.sh
RUN /install-composer.sh

# Copy configuration
COPY ./run.sh /run.sh
RUN chmod +x /run.sh

VOLUME [ "/etc/nginx/sites-enabled" ]

EXPOSE 80 443
