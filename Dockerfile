FROM rmkn/php
MAINTAINER rmkn

RUN yum -y install unzip perl perl-DBI perl-Image-Size perl-CGI perl-DBD-SQLite postfix

RUN curl -o /tmp/mtos.zip -SL http://www.movabletype.jp/downloads/stable/MTOS-5.2.13.zip \
        && unzip /tmp/mtos.zip -d /usr/local/

RUN mkdir /usr/local/MTOS-5.2.13/db
RUN chmod 777 /var/www/html /usr/local/MTOS-5.2.13 /usr/local/MTOS-5.2.13/db /usr/local/MTOS-5.2.13/mt-static/support

COPY vhosts.conf /etc/httpd/conf.d/vhosts.conf
