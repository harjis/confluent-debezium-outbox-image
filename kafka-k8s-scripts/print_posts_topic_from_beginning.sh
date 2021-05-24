#!/bin/bash

kubectl exec -it my-kafka-cp-zookeeper-0 --container cp-zookeeper-server \
-- kafka-console-consumer --bootstrap-server my-kafka-cp-kafka-headless:9092 \
--topic Post.events --from-beginning
