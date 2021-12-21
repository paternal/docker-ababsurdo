FROM texlive/texlive
LABEL maintainer "Louis Paternault <spalax@gresille.org>"

# Install Debian packages
ARG DEBIAN_FRONTEND=noninteractive
RUN \
  apt --yes update \
  && apt install --yes --no-install-recommends \
    bzip2 \
    git \
    graphviz \
    imagemagick \
    libreoffice \
    locales \
    poppler-utils \
    python3-pip \
    xz-utils \
  && apt clean

# Allow Imagemagick to convert PDF to PNG
RUN sed -i \
    's/policy *domain="coder" *rights="none" *pattern="PDF"/policy domain="coder" rights="read|write" pattern="PDF"/' \
    /etc/ImageMagick-6/policy.xml

# Install python packages
RUN python3 -m pip install \
    lektor \
    pdfautonup

# Install my custom LaTeX classes
RUN git clone https://framagit.org/lpaternault/pablo.git /usr/share/pablo/texmf-dist/tex/latex/pablo
RUN tlmgr conf auxtrees add /usr/share/pablo/texmf-dist

# Set the locale
RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LC_ALL fr_FR.UTF-8
RUN dpkg-reconfigure locales

# Several workarounds to: https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1170
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN ln -sf bash /bin/sh
RUN ln -sf bash /bin/dash

# Check that everything is installed
RUN \
  echo \
  && lektor --version \
  && python3 --version
