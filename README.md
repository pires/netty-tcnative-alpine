# netty-tcnative-alpine

Docker container used to build [`netty-tcnative`](https://github.com/netty/netty-tcnative) binaries for Alpine Linux.

## ARCHIVED

According to @ejona86
```
This is just FYI, but I did some recent testing on Alpine and I discovered that netty-tcnative-boringssl-static works without issue on standard Alpine.

For openjdk:8-jre-alpine, I ran apk update && apk add libc6-compat while generating the docker image.

For alpine:latest, I ran apk update && apk add openjdk8-jre-base libc6-compat.

adoptopenjdk/openjdk8:alpine-slim and adoptopenjdk/openjdk11:alpine-slim worked out-of-the-box.
```

## Pre-requisites

* Docker

## Bootstrap builder

```
$ docker build --build-arg NETTY_TCNATIVE_TAG=netty-tcnative-parent-2.0.7.Final -t pires/netty-tcnative-alpine:2.0.7.Final .
```

## Build binaries

```
$ mkdir binaries
$ docker run -v `pwd`/binaries:/output pires/netty-tcnative-alpine:2.0.7.Final
```

Binaries should become available in `binaries` folder:
```
$ ls -lh binaries
```

## Use binaries

One needs an `alpine` container, obviouslly and `libuuid` dependency, otherwise even `boringssl-static` won't work.

```
FROM alpine:3.7

RUN apk add --update libuuid
```

## Acknowledgements

* Work inspired by [@dimitarg](https://github.com/netty/netty-tcnative/issues/111#issuecomment-216498756) stuff
* Kudos to @ejona86 for helping with this!
