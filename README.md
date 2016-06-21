[azukiapp/alpine](http://images.azk.io/#/alpine)
==================

A super small Docker image based on [Alpine Linux][alpine].

[![Circle CI][circleci-badge]][circleci]
[![][imagelayers-badge]][imagelayers]

Alpine versions (tags)
---

<versions>
- [`latest`, `3.4`](https://github.com/azukiapp/docker-alpine/blob/v3.4/3.4/Dockerfile)
- [`3.3`](https://github.com/azukiapp/docker-alpine/blob/v3.3/3.3/Dockerfile)
- [`3.2`](https://github.com/azukiapp/docker-alpine/blob/v3.2/3.2/Dockerfile)
</versions>

### Usage with `azk`

Example of using that image with [azk][azk]:

```javascript
/**
 * Documentation: http://docs.azk.io/Azkfile.js
 */

// Adds the systems that shape your system
systems({
  "my-app": {
    // More info about alpine image: http://images.azk.io/#/alpine?from=images-azkfile-alpine
    image: {"docker": "azukiapp/alpine:3.4"},
    // Steps to execute before running instances
    provision: [
      // "./script.sh",
    ],
    mounts: {
      '/azk/#{manifest.dir}': path("."),
    },
    workdir: "/azk/#{manifest.dir}",
    // command: "# command to run app. i.g.: `./start.sh`",
    wait: false,
  },
});
```

## Extend image with `Dockerfile`

Install [`postgresql-client`][postgresql-client]:

```dockerfile
# Dockerfile
FROM azukiapp/alpine:3.4

RUN  apk add --update postgresql-client \
  && rm -rf /var/cache/apk/* /var/tmp/*

CMD ["psql"]
```

To more packages, access [alpine packages][alpine-packages]

## License

Azuki Dockerfiles distributed under the [Apache License][license].

[azk]: http://azk.io
[postgresql-client]: https://pkgs.alpinelinux.org/package/main/x86_64/postgresql-client
[alpine-packages]: http://pkgs.alpinelinux.org/
[alpine]: http://alpinelinux.org/

[issues]: https://github.com/azukiapp/docker-alpine/issues

[circleci]: https://circleci.com/gh/azukiapp/docker-alpine
[circleci-badge]: https://circleci.com/gh/azukiapp/docker-alpine.svg?style=svg

[imagelayers]: https://imagelayers.io/?images=azukiapp/alpine:latest,azukiapp/alpine:3.4,azukiapp/alpine:3.3,azukiapp/alpine:3.2
[imagelayers-badge]: https://imagelayers.io/badge/azukiapp/alpine:latest.svg

[license]: ./LICENSE
