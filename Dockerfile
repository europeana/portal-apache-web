FROM httpd:2.4.39-alpine

COPY ./docker/httpd.conf ./conf/httpd.conf
COPY ./.bp-config/httpd/extra/httpd-blacklist.conf \
     ./.bp-config/httpd/extra/httpd-proxy.conf \
     ./conf/extra/
COPY ./.bp-config/httpd/vhosts/*.conf ./conf/vhosts/
COPY ./htdocs/ ./htdocs/

RUN sed -ir 's|${HOME}/#{WEBDIR}|/usr/local/apache2/htdocs|g' conf/vhosts/*.conf && \
    rm conf/vhosts/*.confr
