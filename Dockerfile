
FROM golang:1.12-alpine

WORKDIR /

USER root

ADD scape-goat_unix /scape-goat/

WORKDIR /scape-goat/

CMD  ["./scape-goat_unix"]