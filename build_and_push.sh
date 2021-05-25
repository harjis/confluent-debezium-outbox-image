#!/bin/bash
set -e

if [ -z "$VERSION" ]
then
      echo "\$VERSION is empty"
      exit 1
fi

docker build \
-t d0rka/confluent-debezium-outbox-image:latest \
-t d0rka/confluent-debezium-outbox-image:$VERSION \
-f ./kafka-connect/Dockerfile ./kafka-connect

docker push d0rka/confluent-debezium-outbox-image:latest
docker push d0rka/confluent-debezium-outbox-image:$VERSION
