FROM node:10
MAINTAINER Henrik Steen <henrist@henrist.net>

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY src/package.json /usr/src/app/
RUN npm install

COPY src /usr/src/app

COPY container/build.sh /build.sh
CMD ["/build.sh"]
