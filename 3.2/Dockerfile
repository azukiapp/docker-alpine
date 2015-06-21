FROM alpine:3.2
MAINTAINER Azuki <support@azukiapp.com>

# install default packages
RUN packages=' \
    bash \
    vim \
    git \
  ' \
  set -x \
  && apk --update add $packages
