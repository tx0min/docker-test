FROM library/debian:10
LABEL MAINTAINER="tmedrano@tarragona.cat"

WORKDIR /var/www/html

RUN apt update && \
    apt-get -y install inetutils.ping \
    libapache2-mod-php \
    php-mysql \
    php-gd \
    wget  \
    curl  \
    && rm /var/www/html/index.html \
    && curl -s https://wordpress.org/latest.tar.gz | tar -xz --strip-components=1  \
    && ln -sf /dev/stdout /var/log/apache2/access.log \
    && ln -sf /dev/sterr /var/log/apache2/error.log \
    && echo "ServerName MyWordpress" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD [ "/usr/sbin/apache2ctl", "-D" , "FOREGROUND" ]