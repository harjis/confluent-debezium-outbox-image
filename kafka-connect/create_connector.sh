#!/bin/bash
set -e

echo "Posting to http://$CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT/connectors/"
curl -s \
     -X "POST" "http://$CONNECT_REST_ADVERTISED_HOST_NAME:$CONNECT_REST_PORT/connectors/" \
     -H "Content-Type: application/json" \
     -d '{
   "name": "source-post-service",
   "config": {
     "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
     "tasks.max": "1",
     "database.hostname": "'$DB_HOST'",
     "database.port": "'$DB_PORT'",
     "database.user": "'$DB_USERNAME'",
     "database.password": "'$DB_PASSWORD'",
     "database.dbname": "'$DB_NAME'",
     "database.server.name": "'$DB_SERVERNAME'",
     "table.whitelist": "public.outbox",
     "schema.whitelist": "public",
     "tombstones.on.delete": "false",
     "transforms": "outbox",
     "transforms.outbox.type": "io.debezium.transforms.outbox.EventRouter",
     "transforms.outbox.route.topic.replacement": "${routedByValue}.events",
     "transforms.outbox.table.fields.additional.placement": "type:header:eventType"
   }
 }'
