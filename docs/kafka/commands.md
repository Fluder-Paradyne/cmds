
### command to delete a group of topics

```shell
TOPICS=$(/opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --list | grep outreach)

echo "$TOPICS"

echo "$TOPICS" | while read topic; do
    /opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic "$topic"
    echo "Deleted topic: $topic"
done
```

### describe consumer group
```shell
/opt/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --group connect-postgres-sink-v1
```

### delete consumer group ( have to stop all consumer group before this can run)
```shell
/opt/kafka/bin/kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --delete \
  --group connect-postgres-sink-v1
```