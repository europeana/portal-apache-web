FROM httpd:2.4-alpine

RUN rm conf/extra/*.conf

COPY . .
