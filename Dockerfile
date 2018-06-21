FROM golang:1.10.3-stretch

MAINTAINER Katsuma Ito <katsumai@gmail.com>

RUN set -ex \
&& curl -sL https://deb.nodesource.com/setup_8.x | bash - \
&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
&& apt-get update -q \
&& apt-get install -y --force-yes --no-install-recommends \
  pkg-config \
  libxml2-dev \
  rlwrap \
\
&& apt-get install -y nodejs yarn \
&& npm install -g node-gyp \
&& npm cache --force clear \
\
&& apt-get clean -y \
&& rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* /var/cache/apt/*
