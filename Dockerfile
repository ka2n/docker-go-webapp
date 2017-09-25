FROM golang:1.9.0

MAINTAINER Katsuma Ito <katsumai@gmail.com>

RUN apt-get update -q \
&& apt-get install -y --force-yes --no-install-recommends \
  pkg-config \
  libxml2-dev \
  rlwrap \
\
&& curl -sL https://deb.nodesource.com/setup_8.x | bash - \
&& apt-get install -y nodejs \
&& npm install -g node-gyp \
&& npm cache --force clear \
\
&& apt-get clean -y \
&& rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* /var/cache/apt/*
