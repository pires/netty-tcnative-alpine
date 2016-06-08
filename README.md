# netty-tcnative-alpine

Docker container used to build [`netty-tcnative`](https://github.com/netty/netty-tcnative) binaries for Alpine Linux.

## Pre-requisites

* Docker

## Bootstrap builder

```
NETTY_TCNATIVE_TAG=netty-tcnative-1.1.33.Fork17 docker build -t pires/netty-tcnative-alpine .
```

## Build binaries

```
mkdir binaries
docker run -v `pwd`/binaries pires/netty-tcnative-alpine
```

Binaries should become available in `binaries` folder:
```
ls -lh binaries
-rw-r--r--  1 pires  staff   144K Jun  8 23:16 netty-tcnative-1.1.33.Fork17-linux-x86_64.jar
-rw-r--r--  1 pires  staff    94K Jun  8 23:16 netty-tcnative-1.1.33.Fork17-sources.jar
-rw-r--r--  1 pires  staff    69K Jun  8 23:16 netty-tcnative-1.1.33.Fork17.jar
-rw-r--r--  1 pires  staff   981K Jun  8 23:23 netty-tcnative-boringssl-static-1.1.33.Fork17-linux-x86_64.jar
-rw-r--r--  1 pires  staff    94K Jun  8 23:23 netty-tcnative-boringssl-static-1.1.33.Fork17-sources.jar
-rw-r--r--  1 pires  staff    71K Jun  8 23:23 netty-tcnative-boringssl-static-1.1.33.Fork17.jar
-rw-r--r--  1 pires  staff   1.4M Jun  8 23:20 netty-tcnative-openssl-static-1.1.33.Fork17-linux-x86_64.jar
-rw-r--r--  1 pires  staff    94K Jun  8 23:20 netty-tcnative-openssl-static-1.1.33.Fork17-sources.jar
-rw-r--r--  1 pires  staff    70K Jun  8 23:20 netty-tcnative-openssl-static-1.1.33.Fork17.jar
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
