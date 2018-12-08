FROM mhart/alpine-node:latest
LABEL maintainer="Dan Jellesma"

ARG VCS_REF
ARG BUILD_DATE

RUN npm i http-server -g

RUN mkdir /public
WORKDIR /public
COPY ./test.html .

EXPOSE 8080
CMD ["http-server"]
