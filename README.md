# Europeana web & API Apache config

For latest version of how to setup an Apache module at Anynines see
https://www.assembla.com/spaces/europeana/wiki/Anynines_Apache_environ.
(This is just a short summary written 2014-01-30.)

## .bp-config/httpd/extra

In this dir you store your Apache configs. The buildpack defaults to the Apache
config found in
https://github.com/cloudfoundry/php-buildpack/tree/v3.2.2/defaults/config/httpd/2.4.x/extra

For example, to override httpd-default.conf you would create a file
.bp-config/httpd/extra/httpd-default.conf

If you want to include an additional file, perhaps in
.bp-config/httpd/extra/httpd-default.conf, include it with `Include
conf/extra/europeana.conf` and store it in .bp-config/httpd/extra

### httpd-default.conf

This is a host-specific config file for Apache. It depends on the existence of
the environment variables `PORTAL_HOST`, `API_HOST`, `BOTTER_HOST` and
`STYLEGUIDE_HOST`. These are the hostnames of the portal, API, botter, and
styleguide, e.g.

```
PORTAL_HOST=p.blue.portal.europeana.eu
API_HOST=a.blue.portal.europeana.eu
BOTTER_HOST=b.blue.portal.europeana.eu
STYLEGUIDE_HOST=styleguide.europeana.eu
```

PHP buildpack configuration documentation: https://docs.cloudfoundry.org/buildpacks/php/gsg-php-config.html

## htdocs

This is your webroot, files in this location will be served by this Apache.

## manifest.yml

This is the Cloud Foundry manifest to deploy Apache. No app name is set, so
it must be specified when deploying:

```
cf push APP_NAME -f manifest.yml
```
