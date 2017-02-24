# TODO Make it depends on:
# FROM svlentink/texlive-full

FROM paternal/cours

RUN \
  apt-get --yes update \
  && apt-get install --yes \
    ca-certificates \
    ikiwiki \
    libsort-naturally-perl \
    libstring-formatter-perl \
    libyaml-perl \
  && apt-get clean
