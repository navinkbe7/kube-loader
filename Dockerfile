
FROM golang:1.12-alpine

WORKDIR /

USER root

ADD scape-goat_unix /scape-goat/

WORKDIR /scape-goat/

COPY scripts/ /scape-goat/scripts/

CMD  ["./scape-goat_unix"]