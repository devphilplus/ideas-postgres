FROM postgres:alpine3.17
LABEL maintainer="Ferd Tomale<beowulf1416@gmail.com>"

ENV TZ=Etc/UTC \
    POSTGRES_USER=app_user \
    POSTGRES_PASSWORD=replace_me \
    POSTGRES_DB=app

EXPOSE 5432

RUN <<EOT
    mkdir -p /docker-entrypoint-initdb.d
    mkdir -p /docker-entrypoint-initdb.d/init
    mkdir -p /docker-entrypoint-initdb.d/schemas
EOT

COPY ./init /docker-entrypoint-initdb.d/init
COPY ./schemas /docker-entrypoint-initdb.d/schemas
COPY create.sql /docker-entrypoint-initdb.d/create.sql