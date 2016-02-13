FROM alpine:3.3
MAINTAINER Azuki <support@azukiapp.com>

# install default packages
RUN packages=' \
    bash \
    vim \
    git \
    tar \
    curl \
    wget \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/*

CMD ["sh"]
