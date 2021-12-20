# Europeana Portal Apache

Based on the official [httpd](https://hub.docker.com/_/httpd) Docker image.

## Allow/disallow robots

To disallow robots to crawl the hosted properties, set the environment
variable `DISALLOW_ROBOTS=1`.

## Virtual hosts

Use environment variables to set the hostnames for each virtual host supported
by this Apache:

* `ANNOTATIONS_HOST`: annotations.europeana.eu
* `DATA_HOST`: data.europana.eu
* `OLD_EXHIBITIONS_HOST`: exhibitions.europeana.eu
* `STYLEGUIDE_HOST`: style.europeana.eu
* `WWI_EMBED_HOST`: embed.europeana1914-1918.eu
* `WWI_HOST`: www.europeana1914-1918.eu
* `WWW_HOST`: www.europeana.eu

The above are the expected production values for these hosts, which still need
to be set in environment variables, but you may wish to set them to other values
in test / staging environments.

### www.europeana.eu

The www.europeana.eu virtual host reverse proxies a number of URL path patterns
to other hosts, determined by the environment variables:

* `API_HOST`: Record API
* `ANNOTATIONS_HOST`: Annotation API
* `ENTITIES_HOST`: Entity API
* `FULLTEXT_HOST`: Full text API
* `PORTAL_PROXY_URL`: Europeana Collections Portal (**full URL**)
* `THUMBNAIL_HOST`: Thumbnail API
* `SITEMAP_HOST`: Sitemap API

Static documents are served from [htdocs/www.europeana.eu](./htdocs/www.europeana.eu)

### data.europeana.eu

Linked data content negotiation.

Static documents are served from [htdocs/data.europeana.eu](./htdocs/data.europeana.eu)

### exhibitions.europeana.eu

Redirects for legacy Exhibitions site.

### style.europeana.eu

Reverse proxying to static Pattern Lab styleguide on S3.

### www.europeana1914-1918.eu

Redirects for legacy 1914-1918 site.

* `WWI_EMBED_HOST`: 1914-1918 app.

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
