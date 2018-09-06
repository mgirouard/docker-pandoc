FROM alpine

RUN apk upgrade --update &&\
    apk add wget tar gzip bash

RUN wget https://github.com/jgm/pandoc/releases/download/2.2.3.2/pandoc-2.2.3.2-linux.tar.gz
RUN tar -xvzf pandoc-2.2.3.2-linux.tar.gz && \
    cp -a pandoc-2.2.3.2/bin/ /usr

WORKDIR /pandoc

ENTRYPOINT ["pandoc"]
