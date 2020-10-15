FROM library/debian:10
LABEL MAINTAINER="tmedrano@tarragona.cat"

RUN    apt update && \
       apt install -y libapache2-mod-php php-mysql php-gd curl

WORKDIR /var/www/html

RUN    rm *.html && \
       curl -s https://wordpress.org/latest.tar.gz | tar zx --strip-components=1

EXPOSE 80

CMD [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]