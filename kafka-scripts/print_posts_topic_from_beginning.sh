#!/bin/bash

docker-compose exec kafka kafka-console-consumer --bootstrap-server kafka:9092 --topic Post.events --from-beginning
