#!/bin/bash
set -e

docker build -t d0rka/confluent-debezium-outbox-image:latest \
-f ./kafka-connect/Dockerfile ./kafka-connect
docker push d0rka/confluent-debezium-outbox-image:latest
