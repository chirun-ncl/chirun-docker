FROM amd64/ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN echo "tzdata tzdata/Areas select Europe" > debconf-set-selections
RUN echo "tzdata tzdata/Zones/Europe select London" > debconf-set-selections

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y tzdata 
RUN apt-get install -y texlive-full pandoc
RUN apt-get install -y dvipng imagemagick git python3 python3-dev python3-pip pdf2svg npm
RUN apt-get install -y libappindicator1 fonts-liberation libasound2 libgconf-2-4 libnspr4 libxss1 libnss3 xdg-utils

RUN npm install -g decktape
RUN python3 -m pip install appdirs==1.4.3 arrow==0.10.0 beautifulsoup4==4.8.0 bs4==0.0.1 funcsigs==1.0.2 Jinja2==2.9.6 jinja2-time==0.2.0 Markdown==3.1.1 MarkupSafe==1.0 markdown-figure==0.0.1 mdx-outline==1.3.0 mock==2.0.0 olefile==0.44 packaging==16.8 pbr==2.0.0 Pillow==4.2.1 py==1.4.33 Pygments==2.4.2 pymdown-extensions==6.0 pyoembed==0.1.2 pyparsing==2.2.0 pyppeteer==0.0.25 pytest==3.0.7 python-dateutil==2.6.0 PyYAML==3.12 six==1.10.0 Unidecode==1.0.22

RUN pyppeteer-install
