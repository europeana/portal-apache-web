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

## Virtual hosts

Use environment variables to set the hostnames for each virtual host supported
by this Apache:

* `WWW_HOST`: www.europeana.eu
* `WWI_HOST`: www.europeana1914-1918.eu
* `WWI_EMBED_HOST`: embed.europeana1914-1918.eu
* `ANNOTATIONS_HOST`: annotations.europeana.eu
* `DATA_HOST`: data.europana.eu
* `ENTITIES_HOST`: entity.europeana.eu
* `OLD_EXHIBITIONS_HOST`: exhibitions.europeana.eu

The above are the expected production values for these hosts, which still need
to be set in environment variables, but you may wish to set them to other values
in test / staging environments.

## www.europeana.eu reverse proxy

The www.europeana.eu virtual host reverse proxies a number of URL path patterns
to other hosts, determined by the environment variables:

* `API_HOST`: Europeana REST API
* `EXHIBITIONS_HOST`: Europeana Virtual Exhibitions
* `PORTAL_HOST`: Europeana Portal / Collections

## Docker

A Dockerfile is included, optimised for small image size, for publication to a
Docker repository and use in production environments.

### Configure version

```shell
export VERSION=20190625
```

### Build

```shell
docker build -t europeana/portal-apache:${VERSION} .
```

### Run

```shell
docker run \
       -p 8080:80 \
       --env-file=.env \
       europeana/portal-apache:${VERSION}
```

### Publish
```shell
docker push europeana/portal-apache:${VERSION}
```

## License

Licensed under the EUPL v1.2.

For full details, see [LICENSE.md](LICENSE.md).
