# Europeana Portal Apache

Based on the official [httpd](https://hub.docker.com/_/httpd) Docker image.


## Virtual hosts

Use environment variables to set the hostnames for each virtual host supported
by this Apache:

* `DATA_HOST`: data.europana.eu
* `OLD_EXHIBITIONS_HOST`: exhibitions.europeana.eu
* `STYLEGUIDE_HOST`: style.europeana.eu
* `WWW_HOST`: www.europeana.eu

The above are the expected production values for these hosts, which still need
to be set in environment variables, but you may wish to set them to other values
in test / staging environments.

### www.europeana.eu

The www.europeana.eu virtual host reverse proxies a number of URL path patterns
to other hosts, determined by the environment variables:

* `SITEMAP_HOST`: Sitemap API (**host only, for proxying**)

Static documents are served from [htdocs/www.europeana.eu](./htdocs/www.europeana.eu)

### data.europeana.eu

Linked data content negotiation.

Static documents are served from [htdocs/data.europeana.eu](./htdocs/data.europeana.eu)

### style.europeana.eu

Serving static style assets.

## Docker

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
       --name europeana-portal-apache \
       europeana/portal-apache:${VERSION}
```

### Publish
```shell
docker push europeana/portal-apache:${VERSION}
```

## License

Licensed under the EUPL v1.2.

For full details, see [LICENSE.md](LICENSE.md).
