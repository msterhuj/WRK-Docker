FROM alpine
LABEL MAINTAINER="gabin.lanore@storais.org"

ENV PATH="/data:${PATH}"

RUN apk update && apk add git gcc make libc-dev perl linux-headers

WORKDIR /data
RUN git clone https://github.com/wg/wrk.git
WORKDIR /data/wrk
RUN make
WORKDIR /data
RUN mv /data/wrk/wrk /data/app && rm -rf /data/wrk/

RUN apk del git make
ENTRYPOINT [ "./app" ]