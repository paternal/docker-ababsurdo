FROM svlentink/texlive-full
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive

# Install Debian packages
RUN \
  apt --yes update \
  && apt install --yes \
    imagemagick \
    libffi-dev \
    libssl-dev \
    python3 \
    python3-dev \
    python3-pip \
  && apt clean

# Install python packages
RUN \
  pip3 install \
    pdfautonup \
    lektor

# Check that everything is installed
RUN \
  echo \
  && lektor --version \
  && python3 --version
