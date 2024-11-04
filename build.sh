#!/bin/sh

echo 'Stoping containers ...'
docker-compose down --remove-orphans

echo 'Start building ...'

USER_ID=$(id -g)
USER_GID=$(id -u)

echo "Building with UID=$USER_ID, USER_GID=$USER_GID"

docker-compose  build \
  --build-arg APP_UID=$USER_ID \
  --build-arg APP_GID=$USER_GID

docker-compose run --rm app bundle install

echo 'Build finished'
