# see hooks/build and hooks/.config
ARG BASE_IMAGE_PREFIX
FROM ${BASE_IMAGE_PREFIX}alpine:3.9

# see hooks/post_checkout
ARG ARCH
COPY qemu-${ARCH}-static /usr/bin

LABEL maintainer "S. Saeed Hosseini<sayidhosseini@hotmail.com>"

ENV MONGO_INITDB_ROOT_USERNAME root
ENV MONGO_INITDB_ROOT_PASSWORD password

RUN apk add --no-cache mongodb

COPY entrypoint.sh /entrypoint.sh
COPY mongod.conf /etc/mongod.conf

VOLUME /data/db

EXPOSE 27017 28017

ENTRYPOINT ["/entrypoint.sh"]
CMD ["mongod", "--bind_ip_all"]
