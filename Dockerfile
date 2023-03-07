ARG VERSION=0.8.0

FROM ubuntu:jammy
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN echo "tzdata tzdata/Areas select Europe" > debconf-set-selections
RUN echo "tzdata tzdata/Zones/Europe select London" > debconf-set-selections

RUN apt-get update -y --fix-missing && apt-get upgrade -y && apt-get install -y tzdata apt-utils
RUN apt-get install -y python3-dev python3-pip
RUN apt-get install -y imagemagick git \
pdf2svg libyaml-dev fonts-liberation libasound2 libgconf-2-4 libnspr4 libxss1 \
libnss3 libnss3-dev xdg-utils poppler-utils pdftk-java
RUN apt-get install -y dvipng

# Dependencies for chromium
RUN apt-get install -y chromium-browser

# Set the locale
RUN apt-get install -y locales
RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

RUN python3 -m pip install pyppeteer PyPDF2 Markdown Pillow PyYAML \
bs4 beautifulsoup4 jupyter-client nbconvert notedown \
'Jinja2<=3.0.0' 'Pygments<=2.11'

ARG VERSION
ADD tex /usr/local/share/texmf/tex
RUN texhash
RUN python3 -m pip install git+https://github.com/chirun-ncl/chirun.git
RUN pyppeteer-install
