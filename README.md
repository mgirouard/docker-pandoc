# docker-pandoc

This is a POC. Manage your expectations.

    docker build -t pandoc .
    docker run  -v "${PWD}:/pandoc" pandoc *.md

