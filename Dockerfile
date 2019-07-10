FROM svlentink/texlive-with-libraries
LABEL maintainer "Louis Paternault <spalax+docker@gresille.org>"

# Install Debian packages
ARG DEBIAN_FRONTEND=noninteractive
RUN \
  apt --yes update \
  && apt install --yes \
    git \
    graphviz \
    imagemagick \
    lektor \
    libffi-dev \
    libssl-dev \
    locales \
    pdf2svg \
    poppler-utils \
    python3 \
    python3-dev \
    python3-pip \
    wget \
  && apt clean

# Install python packages
RUN pip3 install \
    pdfautonup

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
