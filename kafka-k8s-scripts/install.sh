#!/bin/bash

helm install my-kafka confluentinc/cp-helm-charts -f k8s-kafka/values.yaml
