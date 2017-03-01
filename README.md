# netty-tcnative-alpine

Docker container used to build [`netty-tcnative`](https://github.com/netty/netty-tcnative) binaries for Alpine Linux.

## Pre-requisites

* Docker

## Bootstrap builder

```
$ docker build --build-arg NETTY_TCNATIVE_TAG=netty-tcnative-parent-2.0.0.Beta6 -t pires/netty-tcnative-alpine:2.0.0.Beta6 .
```

## Build binaries

```
$ mkdir binaries
$ docker run -v `pwd`/binaries:/output pires/netty-tcnative-alpine:2.0.0.Beta6
```

Binaries should become available in `binaries` folder:
```
$ ls -lh binaries
total 4504
-rw-r--r--  1 pires  staff    53K Mar  1 10:06 netty-tcnative-2.0.0.Beta6-linux-x86_64.jar
-rw-r--r--  1 pires  staff    20K Mar  1 10:06 netty-tcnative-2.0.0.Beta6-sources.jar
-rw-r--r--  1 pires  staff    17K Mar  1 10:06 netty-tcnative-2.0.0.Beta6.jar
-rw-r--r--  1 pires  staff   775K Mar  1 10:12 netty-tcnative-boringssl-static-2.0.0.Beta6-linux-x86_64.jar
-rw-r--r--  1 pires  staff    20K Mar  1 10:12 netty-tcnative-boringssl-static-2.0.0.Beta6-sources.jar
-rw-r--r--  1 pires  staff    19K Mar  1 10:12 netty-tcnative-boringssl-static-2.0.0.Beta6.jar
-rw-r--r--  1 pires  staff   1.3M Mar  1 10:10 netty-tcnative-openssl-static-2.0.0.Beta6-linux-x86_64.jar
-rw-r--r--  1 pires  staff    20K Mar  1 10:10 netty-tcnative-openssl-static-2.0.0.Beta6-sources.jar
-rw-r--r--  1 pires  staff    18K Mar  1 10:10 netty-tcnative-openssl-static-2.0.0.Beta6.jar
```

## Use binaries

One needs an `alpine` container, obviouslly and `libuuid` dependency, otherwise even `boringssl-static` won't work.

```
FROM alpine:3.5

RUN apk add --update libduuid
```

## Acknowledgements

* Work inspired by [@dimitarg](https://github.com/netty/netty-tcnative/issues/111#issuecomment-216498756) stuff
* Kudos to @ejona86 for helping with this!
