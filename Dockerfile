FROM golang:1.5

MAINTAINER Katsuma Ito <katsumai@gmail.com>

RUN apt-get update -q \
&& apt-get install -y --force-yes --no-install-recommends \
  rlwrap \
\
&& curl https://deb.nodesource.com/node_5.x/pool/main/n/nodejs/nodejs_5.3.0-1nodesource1~jessie1_amd64.deb > node.deb \
&& dpkg -i node.deb && rm node.deb \
&& npm install -g node-gyp \
&& npm cache clear \
\
&& apt-get clean -y \
&& rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/* /var/cache/apt/*
