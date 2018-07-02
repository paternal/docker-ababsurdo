FROM svlentink/texlive-full
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

# Install Debian packages
ARG DEBIAN_FRONTEND=noninteractive
RUN \
  apt --yes update \
  && apt install --yes \
    imagemagick \
    libffi-dev \
    libssl-dev \
    locales \
    python3 \
    python3-dev \
    python3-pip \
  && apt clean

# Install python packages
RUN \
  pip3 install \
    pdfautonup \
    lektor

# Set the locale
RUN locale-gen C.UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Check that everything is installed
RUN \
  echo \
  && lektor --version \
  && python3 --version
