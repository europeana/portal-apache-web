# Europeana web & API Apache config

For latest version of how to setup an Apache module at Anynines see
https://www.assembla.com/spaces/europeana/wiki/Anynines_Apache_environ

This is just a short summary written 2014-01-30

## .bp-config/httpd/extra

In this dir you store your Apache configs. The build pack defaults to the Apache config found in
https://github.com/cloudfoundry/php-buildpack/tree/master/defaults/config/httpd/2.4.x/extra

For example, to override httpd-default.conf you would create a file .bp-config/httpd/extra/httpd-default.conf

If you want to include an additional file, perhaps in .bp-config/httpd/extra/httpd-default.conf, include it with
`Include conf/extra/europeana.conf` and store it localy in .bp-config/httpd/extra

## htdocs

This is your webroot, files in this location will be served by this Apache.
