FROM alpine:3.4
MAINTAINER Azuki <support@azukiapp.com>

# install default packages
RUN packages=' \
    git \
  ' \
  set -x \
  && apk --update add $packages \
  && rm -rf /var/cache/apk/*

CMD ["sh"]
