###
# Build: docker build -t hireright-chatter .
# Run:   docker run -v $PWD/dist:/build/dist hireright-chatter . 
#
###

FROM    ubuntu:14.04
MAINTAINER dnephin@gmail.com

ENV     DEBIAN_FRONTEND noninteractive

RUN     apt-get update && apt-get install -y git npm nodejs openjdk-7-jre
RUN     ln -s /usr/bin/nodejs /usr/local/bin/node

WORKDIR /build
ADD     package.json    /build/package.json
RUN     npm install
ADD     .   /build
CMD     ./node_modules/gulp/bin/gulp.js serve
