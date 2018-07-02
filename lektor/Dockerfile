FROM svlentink/texlive-full
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

ARG DEBIAN_FRONTEND=noninteractive
RUN \ # Install Debian packages
  apt --yes update \
  && apt install --yes \
    imagemagick \
    libffi-dev \
    libssl-dev \
    python3 \
    python3-dev \
    python3-pip \
  && apt clean
RUN \ # Install pdfautonup
  pip3 install pdfautonup
RUN \ # Install Lektor
  curl -sf https://www.getlektor.com/install.sh | sh
RUN \ # Check that everything is installed
  lektor --version
