# TODO Make it depends on:
# FROM svlentink/texlive-full
FROM paternal/cours

ARG DEBIAN_FRONTEND=noninteractive
RUN \
  apt-get --yes update \
  && apt-get install --yes \
    ca-certificates \
    ikiwiki \
    imagemagick \
    libsort-naturally-perl \
    libstring-formatter-perl \
    libyaml-perl \
    poppler-utils \
  && apt-get clean
