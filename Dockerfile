FROM ubuntu:18.04
MAINTAINER Alex Shvid <alex@shvid.com>

RUN apt-get update \
  && apt-get install -y locales curl  \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN apt-get -y install software-properties-common curl && add-apt-repository ppa:deadsnakes/ppa -y && apt-get update && apt-get -y install python3.7-dev

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 1

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py --force-reinstall && rm get-pip.py

RUN pip install --upgrade pip setuptools wheel
