paternal/ababsurdo
==================

![Docker Stars](https://img.shields.io/docker/stars/paternal/ababsurdo.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/paternal/ababsurdo.svg)

A docker image with the necessary tools to build [my website](https://ababsurdo.fr) ([source](https://framagit.org/lpaternault/ababsurdo)). I would be surprised if this image was useful to anyone but me, but who knows?

## Available tools

*Note: This list may not be up-to-date. The [Dockerfile](https://hub.docker.com/r/paternal/ababsurdo/~/dockerfile/) will give you a more precise list.*

- It is based on a [debian stable](https://www.debian.org/releases/stable/).
- The following tools are available:
  - [LaTeX](https://packages.debian.org/stable/texlive-full) (and a lot of LaTeX packages and fonts);
  - [lektor](https://getlektor.com)
  - [CA certificates](https://packages.debian.org/stretch/ca-certificates);
  - some PDF/image manipulation programs ([poppler-utils](https://packages.debian.org/stretch/poppler-utils), [imagemagick](https://packages.debian.org/stretch/imagemagick), [pdf2svg](https://packages.debian.org/stretch/pdf2svg), etc.).

## Usage

    sudo docker pull paternal/ababsurdo
    sudo docker run -i -t paternal/ababsurdo /bin/bash

