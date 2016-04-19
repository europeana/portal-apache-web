# Europeana web & API Apache config

The buildpack defaults to the Apache configuration found in
https://github.com/cloudfoundry/php-buildpack/tree/v3.2.2/defaults/config/httpd/2.4.x/extra,
but can be overwritten by replacing the files in .bp-config/httpd/extra.

For example, to override httpd-default.conf you would create a file
.bp-config/httpd/extra/httpd-default.conf

If you want to include an additional file, perhaps in
.bp-config/httpd/extra/httpd-default.conf, include it with `Include
conf/extra/europeana.conf` and store it in .bp-config/httpd/extra

PHP buildpack configuration documentation: https://docs.cloudfoundry.org/buildpacks/php/gsg-php-config.html

## htdocs

This is your webroot, files in this location will be served by this Apache.

## manifest.yml

This is the Cloud Foundry manifest to deploy Apache. No app name is set, so
it must be specified when deploying:

```
cf push APP_NAME -f manifest.yml
```

## Allow/disallow robots

To disallow robots to crawl the hosted properties, set the environment
variable `DISALLOW_ROBOTS=1`.
