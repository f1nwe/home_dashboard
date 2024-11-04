#!/bin/sh

# compose file default to docker-compose.yml can be injected as argument

COMPOSE_FILE=$1

if [ -z "$COMPOSE_FILE" ]; then
  COMPOSE_FILE=docker-compose.yml
fi

echo 'Stoping containers ...'
docker-compose down --remove-orphans

echo "Start building with $COMPOSE_FILE"

USER_ID=$(id -g)
USER_GID=$(id -u)

echo "Building with UID=$USER_ID, USER_GID=$USER_GID"

docker-compose -f $COMPOSE_FILE build \
    --build-arg APP_UID=$USER_ID \
    --build-arg APP_GID=$USER_GID \

docker-compose run --rm app bundle install

echo 'Build finished'
