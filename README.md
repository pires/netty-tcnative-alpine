# netty-tcnative-alpine

Docker container used to build [`netty-tcnative`](https://github.com/netty/netty-tcnative) binaries for Alpine Linux.

## Pre-requisites

* Docker

## Bootstrap builder

```
docker build --build-arg NETTY_TCNATIVE_TAG=netty-tcnative-1.1.33.Fork20 -t pires/netty-tcnative-alpine .
```

## Build binaries

```
mkdir binaries
docker run -v `pwd`/binaries:/output pires/netty-tcnative-alpine
```

Binaries should become available in `binaries` folder:
```
ls -lh binaries
-rw-r--r--  1 pires  staff   147K Aug 25 10:48 netty-tcnative-1.1.33.Fork20-linux-x86_64.jar
-rw-r--r--  1 pires  staff    96K Aug 25 10:48 netty-tcnative-1.1.33.Fork20-sources.jar
-rw-r--r--  1 pires  staff    70K Aug 25 10:48 netty-tcnative-1.1.33.Fork20.jar
-rw-r--r--  1 pires  staff   981K Aug 25 10:54 netty-tcnative-boringssl-static-1.1.33.Fork20-linux-x86_64.jar
-rw-r--r--  1 pires  staff    97K Aug 25 10:54 netty-tcnative-boringssl-static-1.1.33.Fork20-sources.jar
-rw-r--r--  1 pires  staff    72K Aug 25 10:54 netty-tcnative-boringssl-static-1.1.33.Fork20.jar
-rw-r--r--  1 pires  staff   1.4M Aug 25 10:51 netty-tcnative-openssl-static-1.1.33.Fork20-linux-x86_64.jar
-rw-r--r--  1 pires  staff    96K Aug 25 10:51 netty-tcnative-openssl-static-1.1.33.Fork20-sources.jar
-rw-r--r--  1 pires  staff    71K Aug 25 10:51 netty-tcnative-openssl-static-1.1.33.Fork20.jar
```

## Use binaries

One needs an `alpine` container, obviouslly and `libuuid` dependency, otherwise even `boringssl-static` won't work.

```
FROM alpine:3.4

RUN apk add --update libduuid
```

## Acknowledgements

* Work inspired by [@dimitarg](https://github.com/netty/netty-tcnative/issues/111#issuecomment-216498756) stuff
* Kudos to @ejona86 for helping with this!
