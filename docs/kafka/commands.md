
### command to delete a group of topics

```shell
TOPICS=$(/opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --list | grep outreach)

echo "$TOPICS"

echo "$TOPICS" | while read topic; do
    /opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic "$topic"
    echo "Deleted topic: $topic"
done
```