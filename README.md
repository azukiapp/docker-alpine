[azukiapp/alpine](http://images.azk.io/#/alpine)
==================

A super small Docker image based on [Alpine Linux][alpine].

[![Circle CI](https://circleci.com/gh/azukiapp/docker-alpine.svg?style=svg)][circle-ci]
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/azukiapp/alpine/latest.svg?style=plastic)](https://imagelayers.io/?images=azukiapp/alpine:latest)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/azukiapp/alpine/latest.svg?style=plastic)](https://imagelayers.io/?images=azukiapp/alpine:latest)

Alpine versions (tags)
---

<versions>
- [`latest`, `3.2.3`, `3.2`, `3`](https://github.com/azukiapp/docker-alpine/blob/master/3.2/Dockerfile)
</versions>

Image content:

  - bash
  - vim
  - git
  - tar
  - curl
  - wget

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
    image: {"docker": "azukiapp/alpine"},
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
FROM azukiapp/alpine:3.2

RUN  apk add --update postgresql-client \
  && rm -rf /var/cache/apk/* /var/tmp/* \

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
[circle-ci]: https://circleci.com/gh/azukiapp/docker-alpine
[license]: ./LICENSE
