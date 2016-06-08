#!/bin/sh

git clone https://github.com/netty/netty-tcnative
cd netty-tcnative
git checkout tags/$NETTY_TCNATIVE_TAG
mvn clean package

mv openssl-dynamic/target/*.jar /output/
mv openssl-static/target/*.jar /output/
mv boringssl-static/target/*.jar /output/
