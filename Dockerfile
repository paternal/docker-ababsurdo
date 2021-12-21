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
RUN python3 -m pip install \
    lektor \
    pdfautonup \
    spix

# Install my custom LaTeX classes
RUN git config --global http.sslverify false # Can be removed when bumping to the next Debian version
RUN git clone https://framagit.org/lpaternault/pablo.git /usr/share/pablo/texmf-dist/tex/latex/pablo
RUN tlmgr conf auxtrees add /usr/share/pablo/texmf-dist

# Set the locale
RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LC_ALL fr_FR.UTF-8
RUN dpkg-reconfigure locales

# Check that everything is installed
RUN \
  echo \
  && lektor --version \
  && python3 --version
