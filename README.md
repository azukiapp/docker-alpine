[azukiapp/alpine](http://images.azk.io/#/alpine)
==================

[![Gitter](https://badges.gitter.im/Join Chat.svg)][gitter] [![CircleCI](https://img.shields.io/circleci/project/azukiapp/docker-alpine/master.svg)][circle-ci] [![Docker Pulls](https://img.shields.io/docker/pulls/azukiapp/alpine.svg)][azk-image]

A super small Docker image based on [Alpine Linux][alpine]. The image is only 5 MB and has access to a package repository that is much more complete than other BusyBox based images.

###### Versions:

<versions>
- [`latest`, `3.2.0`, `3.2`, `3`](https://github.com/azukiapp/docker-alpine/blob/master/3.2/Dockerfile)
</versions>

###### Image content:

  - Bash
  - Git
  - VIM
  - curl
  - wget

## Why?

Docker images today are big. Usually much larger than they need to be. There are a lot of ways to make them smaller. But the Docker populous still jumps to the `ubuntu` base image for most projects. The size savings over `ubuntu` and other bases are huge:

```
REPOSITORY          TAG           IMAGE ID          VIRTUAL SIZE
azukiapp/alpine   latest        157314031a17      5.03 MB
debian              latest        4d6ce913b130      84.98 MB
ubuntu              latest        b39b81afc8ca      188.3 MB
centos              latest        8efe422e6104      210 MB
```

There are images such as `progrium/busybox` which get us very close to a minimal container and package system. But these particular BusyBox builds piggyback on the OpenWRT package index which is often lacking and not tailored towards generic everyday applications. Alpine Linux has a much more complete and update to date [package index][alpine-packages]:

```console
$ docker run progrium/busybox opkg-install nodejs
Unknown package 'nodejs'.
Collected errors:
* opkg_install_cmd: Cannot install package nodejs.

$ docker run azukiapp/alpine apk --update add nodejs
fetch http://dl-4.alpinelinux.org/alpine/v3.2/main/x86_64/APKINDEX.tar.gz
(1/5) Installing c-ares (1.10.0-r1)
(2/5) Installing libgcc (4.8.3-r0)
(3/5) Installing libstdc++ (4.8.3-r0)
(4/5) Installing libuv (0.10.29-r0)
(5/5) Installing nodejs (0.10.33-r0)
Executing busybox-1.22.1-r14.trigger
OK: 21 MiB in 20 packages
```

This makes Alpine Linux a great image base for utilities and even production applications. [Read more about Alpine Linux here][alpine-about] and you can see how their mantra fits in right at home with Docker images.

### Usage with `azk`

Example of using that image with [azk](http://azk.io):

```javascript
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */
 
// Adds the systems that shape your system
systems({
  "my-app": {
    // Dependent systems
    depends: [], // postgres, mysql, mongodb ...
    // More images:  http://images.azk.io
    image: {"docker": "azukiapp/alpine"},
    // Steps to execute before running instances
    provision: [
      // "./script.sh",
    ],
    workdir: "/azk/#{manifest.dir}",
    command: "# command to run app. i.g.: `./start.sh`",
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
  },
});
```

## Usage with `docker`

Install [`mysql-client`][mysql-client]:

```
FROM azukiapp/alpine:3.2
RUN apk --update add mysql-client
ENTRYPOINT ["mysql"]
```

Only 3 seconds to build and results in a 16 MB image!

## Support

If you have questions or need assistance, we can talk for [Gitter][gitter], or [submit an issue][issues] reporting a problem.

## Inspiration

This project was inspired by [gliderlabs/docker-alpine][inspiration] providing smaller and easy to maintain images.

## License

Azuki Dockerfiles distributed under the [Apache License][license].

[inspiration]: https://github.com/gliderlabs/docker-alpine
[mysql-client]: http://pkgs.alpinelinux.org/package/main/x86/mysql-client
[alpine-packages]: http://pkgs.alpinelinux.org/
[alpine-about]: https://www.alpinelinux.org/about/
[alpine]: http://alpinelinux.org/

[azk-image]: http://images.azk.io/#/alpine
[issues]: https://github.com/azukiapp/docker-alpine/issues
[gitter]: https://gitter.im/azukiapp/azk?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[circle-ci]: https://circleci.com/gh/azukiapp/docker-alpine
[license]: ./LICENSE
