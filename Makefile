buildtag = pandoc:$(shell git rev-list --count HEAD)-$(shell git rev-parse --short HEAD)

PREFIX=$(HOME)/bin

build:
	docker build -t $(buildtag) .

clean:
	$(RM) bin/pandoc
	docker rm -f $(buildtag)

install: bin/pandoc
	cp $^ $(PREFIX)

test:
	docker run $(buildtag) --help

bin/pandoc: build
	touch $@
	chmod +x $@
	echo '#!/bin/bash' > $@
	echo 'docker run' -v "\$$PWD:/pandoc" -i $(buildtag) "\$$@" >> $@

.PHONY: build clean test
