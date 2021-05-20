FROM confluentinc/cp-kafka-connect-base:6.1.1

RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:latest

COPY create_connector.sh ./create_connector.sh
COPY entrypoint.sh ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
