#!/bin/bash -xe
for f in deb-*.sh; do
    ./$f
done
chown $HOST_GID:$HOST_UID /build/*
