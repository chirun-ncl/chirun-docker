FROM coursebuilder/chirun-base:dev
ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

ARG VERSION
RUN python3 -m pip install git+https://github.com/chirun-ncl/chirun.git@$VERSION
