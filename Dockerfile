FROM ubuntu:18.04
MAINTAINER Alex Shvid <alex@shvid.com>

RUN apt-get update \
  && apt-get install -y locales curl python3-pip \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
  && python3 --version \
  && pip3 --version

ENV LANG en_US.utf8
