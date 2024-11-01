#!/bin/sh

echo 'Start building ...'

USER_ID=$(id -g)
USER_GID=$(id -u)

echo "Building with UID=$USER_ID, USER_GID=$USER_GID"

docker-compose  build \
  --no-cache \
  --build-arg APP_UID=$USER_ID \
  --build-arg APP_GID=$USER_GID

docker-compose run --rm app bundle install

echo 'Build finished'
