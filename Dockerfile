
FROM golang:1.12-alpine

WORKDIR /

USER root

ADD scape_goat_unix /scape_goat/

WORKDIR /uls-forwarder/

CMD  ["./scape_goat_unix"]