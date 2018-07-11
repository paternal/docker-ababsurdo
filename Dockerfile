FROM svlentink/texlive-full
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

# Install Debian packages
ARG DEBIAN_FRONTEND=noninteractive
RUN \
  apt --yes update \
  && apt install --yes \
    git \
    imagemagick \
    libffi-dev \
    libssl-dev \
    locales \
    python3 \
    python3-dev \
    python3-pip \
    wget \
  && apt clean

# Install python packages
RUN pip3 install \
    pdfautonup \
    lektor
# Wrong version of pyOpenSSL is installed
RUN pip3 uninstall --yes pyOpenSSL
RUN pip3 install pyOpenSSL

# Install my custom LaTeX classes
RUN git clone https://framagit.org/lpaternault/pablo.git /usr/share/pablo
ENV TEXINPUTS :/usr/share/pablo

# Install pixelart (will be useless, since pixelart is included in texlive-full in debian sid)
RUN \
  cd /tmp \
  && wget http://mirrors.ctan.org/graphics/pixelart.zip \
  && unzip pixelart.zip \
  && cd pixelart \
  && latex pixelart.ins \
  && cp pixelart.sty /usr/share/pablo


# Set the locale
RUN locale-gen \
    C.UTF-8 \
    fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# Check that everything is installed
RUN \
  echo \
  && lektor --version \
  && python3 --version
