FROM node:6

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY src/package.json /usr/src/app/
RUN npm install

COPY src /usr/src/app

COPY container/build.sh /build.sh
CMD ["/build.sh"]
