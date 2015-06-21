FROM gliderlabs/alpine:3.2
MAINTAINER Azuki <support@azukiapp.com>

# install default packages
RUN packages=' \
    bash \
    vim \
    git \
    ca-certificates \
  ' \
  set -x \
  && apk --update add $packages
