paternal/ababsurdo
==================

A docker image with the necessary tools to build [my website](https://paternault.fr) ([source](https://framagit.org/lpaternault/ababsurdo)). I would be surprised if this image was useful to anyone but me, but who knows?

## Available tools

- It is based on a [debian stable](https://www.debian.org/releases/stable/).
- The following tools are available:
  - [LaTeX](https://packages.debian.org/stable/texlive-full) (and a lot of LaTeX packages and fonts);
  - [IkiWiki](https://packages.debian.org/stable/ikiwiki);
  - [CA certificates](https://packages.debian.org/stretch/ca-certificates).

## Usage

    sudo docker pull paternal/ababsurdo
    sudo docker run -i -t paternal/ababsurdo /bin/bash

