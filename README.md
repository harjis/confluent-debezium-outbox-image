This project is build based on rmoff blog post: https://rmoff.net/2018/12/15/docker-tips-and-tricks-with-kafka-connect-ksqldb-and-kafka/

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

3. Start consuming a topic
```shell
./kafka-k8s-scripts/print_posts_topic_from_beginning.sh
```

4. Insert new data in db in other shell
```shell
./db-k8s-scripts/insert_post.sh
```

5. Consumer should receive the new item in first shell

6. Close skaffold and uninstall kafka
```shell
./kafka-k8s-scripts/uninstall.sh
./kafka-k8s-scripts/clear-kafka-data.sh
```