FROM httpd:2.4-alpine

RUN rm conf/extra/*.conf

COPY . .

ENTRYPOINT ["/usr/local/apache2/docker-entrypoint.sh"]
CMD ["httpd-foreground"]
