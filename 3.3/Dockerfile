FROM alpine:3.3
MAINTAINER Azuki <support@azukiapp.com>

# Additional repositories
RUN repositories="\
  http://dl-4.alpinelinux.org/alpine/v3.3/main/\
  @community http://dl-4.alpinelinux.org/alpine/v3.3/community" \
  && echo -e $repositories | sed -e 's/\/\s/\/\n/g' > /etc/apk/repositories

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
