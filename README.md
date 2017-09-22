# Outrigger Keel

> Foundational image on which to base cross-functional command-line containers.

[![GitHub tag](https://img.shields.io/github/tag/phase2/docker-keel.svg)](https://github.com/phase2/docker-keel)[![Docker Stars](https://img.shields.io/docker/stars/outrigger/keel.svg)](https://hub.docker.com/r/outrigger/keel)[![Docker Pulls](https://img.shields.io/docker/pulls/outrigger/keel.svg)](https://hub.docker.com/r/outrigger/keel)[![](https://images.microbadger.com/badges/image/outrigger/keel:dev.svg)](https://microbadger.com/images/outrigger/keel:dev "Get your own image badge on microbadger.com")

This image provides the many development tools necessary to build and operate
applications the Outrigger way, bundled with solid selection of system packages
a wide array of tools useful for development and troubleshooting via the
command-line interface.

Containers based on outrigger/keel are not lean. Instead, they allow workflows
more akin to remote server access. Sometimes you need to use more than one tool
at a time, and the usual Docker approaches requires complex container juggling.

For more documentation on how Outrigger images are constructed and how to work
with them, please [see the documentation](http://docs.outrigger.sh).

## Features

For details of specific packages, libraries, and utilities, please see the
[Dockerfile](https://github.com/phase2/docker-keel/blob/master/Dockerfile).

### BASH History Persistence

If you would like your bash history preserved, provide a volume mount to a persistent
data location at /root/bash and initialization scripts will ensure your .bash\_history
file is written there. For example `/data/PROJECT/ENV/bash:/root/bash`

## Environment Variables

Outrigger images use Environment Variables and [confd](https://github.com/kelseyhightower/confd)
to templatize a number of Docker environment configurations. These templates are
processed on startup with environment variables passed in via the docker run
command-line or via your `docker-compose.yml` manifest file.

This image does not currently provide any configuration toggles, but Keel-based
images can use the confd plumbing.

## Labels

This image has a broad range of useful [Docker Labels](https://docs.docker.com/engine/userguide/labels-custom-metadata/),
including a range of useful labels from [Label Schema](http://label-schema.org/rc1/).

To review these labels locally, you can use docker inspect.

The list of all labels:

```
docker image inspect outrigger/keel:latest --format="{{ .Config.Labels }}"
```

The list of all labels as JSON:

```
docker image inspect outrigger/keel:latest --format="{{ json .Config.Labels }}"
```

Simple labels (without special characters):

```
docker image inspect outrigger/keel:latest --format="{{ index .Config.Labels.maintainer }}"
```

Complex labels, such as label-schema:

```
docker image inspect outrigger/keel:latest --format="{{ index .Config.Labels \"org.label-schema.docker.cmd.help\" }}"
```

## Maintainers

[![Phase2 Logo](https://s3.amazonaws.com/phase2.public/logos/phase2-logo.png)](https://www.phase2technology.com)
