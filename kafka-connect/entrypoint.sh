#!/bin/bash
set -e

/etc/confluent/docker/run &
echo "Waiting for Kafka Connect to start listening on $CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT⏳"
while [ $(curl -s -o /dev/null -w %{http_code} http://$CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT/connectors) -eq 000 ]; do
  echo -e $(date) " Kafka Connect listener HTTP state: " $(curl -s -o /dev/null -w %{http_code} http://$CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT/connectors) " (waiting for 200)"
  sleep 5
done
echo -e "\n--\n+> Creating Kafka Connect Debezium Outbox sink"
./create_connector.sh
sleep infinity
