ARG VERSION=0.4.7-7

FROM amd64/ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN echo "tzdata tzdata/Areas select Europe" > debconf-set-selections
RUN echo "tzdata tzdata/Zones/Europe select London" > debconf-set-selections

RUN apt-get update -y --fix-missing && apt-get upgrade -y && apt-get install -y tzdata apt-utils \
&& apt-get install -y texlive-full dvipng imagemagick git python3 python3-dev python3-pip \
pdf2svg libyaml-dev libappindicator1 fonts-liberation libasound2 libgconf-2-4 libnspr4 libxss1 \
libnss3 xdg-utils poppler-utils

# Set the locale
RUN apt-get install -y locales
RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

RUN python3 -m pip install pyppeteer
RUN pyppeteer-install

ARG VERSION
RUN python3 -m pip install git+https://github.com/coursebuilder-ncl/makecourse.git
