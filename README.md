# How to use

## k8s

1. Start database. This needs to be started before kafka is installed. Reason for this is
that a db source connector is installed automatically on container startup
and that will fail if the db is not available.
```shell
skaffold dev
```

2. Install kafka
```shell
./kafka-k8s-scripts/install.sh
```