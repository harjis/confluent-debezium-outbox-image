#!/bin/bash
set -e

/etc/confluent/docker/run &
echo "Waiting for Kafka Connect to start listening on $CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT⏳"
while [ $(curl -s -o /dev/null -w %{http_code} http://$CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT/connectors) -eq 000 ]; do
  echo -e $(date) " Kafka Connect listener HTTP state: " $(curl -s -o /dev/null -w %{http_code} http://$CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT/connectors) " (waiting for 200)"
  sleep 5
done
# Sometimes creating the connector still fails even if it seems that REST endpoint is up.
# Let's wait some more...
# A better solution would have been to retry create_connector.sh but with a quick try curl retries did not work
echo "Sleep 10 seconds to make sure REST really is up"
sleep 10
echo -e "\n--\n+> Creating Kafka Connect Debezium Outbox sink"
./create_connector.sh
sleep infinity
