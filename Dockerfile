FROM mhart/alpine-node:latest
LABEL maintainer="Dan Jellesma"

ARG VCS_REF
ARG BUILD_DATE

RUN npm install -g npm@8.14.0 && npm i http-server

RUN mkdir /public
WORKDIR /public
COPY ./test.html .

EXPOSE 8080
CMD ["http-server"]
