# netty-tcnative-alpine

Docker container used to build [`netty-tcnative`](https://github.com/netty/netty-tcnative) binaries for Alpine Linux.

## Pre-requisites

* Docker

## Bootstrap builder

```
$ docker build --build-arg NETTY_TCNATIVE_TAG=netty-tcnative-parent-2.0.6.Final -t pires/netty-tcnative-alpine:2.0.6.Final .
```

## Build binaries

```
$ mkdir binaries
$ docker run -v `pwd`/binaries:/output pires/netty-tcnative-alpine:2.0.6.Final
```

Binaries should become available in `binaries` folder:
```
$ ls -lh binaries
```

## Use binaries

One needs an `alpine` container, obviouslly and `libuuid` dependency, otherwise even `boringssl-static` won't work.

```
FROM alpine:3.5

RUN apk add --update libuuid
```

## Acknowledgements

* Work inspired by [@dimitarg](https://github.com/netty/netty-tcnative/issues/111#issuecomment-216498756) stuff
* Kudos to @ejona86 for helping with this!
