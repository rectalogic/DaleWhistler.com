#!/usr/bin/env bash

docker buildx build -t jekyll --load "${BASH_SOURCE%/*}"
MOUNT="$(cd "${BASH_SOURCE%/*}/.."; pwd)"
exec docker run --rm \
    --volume="$MOUNT:/srv/jekyll:Z" \
    --publish 127.0.0.1:4000:4000 \
    jekyll \
    jekyll serve
