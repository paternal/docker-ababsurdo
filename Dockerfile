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

# Install pixelart and graph35 (will be useless, since pixelart and graph35 are included in texlive-full in debian sid)
RUN cd /tmp \
  && wget http://mirrors.ctan.org/graphics/pixelart.zip \
  && unzip pixelart.zip \
  && cd pixelart \
  && latex pixelart.ins \
  && mv pixelart.sty /usr/share/texlive/texmf-dist/tex/latex/
RUN cd /tmp \
  && wget http://mirrors.ctan.org/graphics/graph35.zip \
  && unzip graph35.zip \
  && cd graph35 \
  && latex graph35.ins \
  && mv graph35.sty /usr/share/texlive/texmf-dist/tex/latex/

# Install my custom LaTeX classes
RUN git clone https://framagit.org/lpaternault/pablo.git /usr/share/pablo
RUN mv /usr/share/pablo/*sty /usr/share/texlive/texmf-dist/tex/latex/
RUN texhash

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
