```shell
cd flink-cdc/flink-cdc-common && mvn clean install -DskipTests -Drevision=3.5.0 -Dspotless.check.skip=true -Dcheckstyle.skip=true -Drat.skip=true 2>&1 | tail -3
```

```shell
cd flink-cdc/flink-cdc-runtime && mvn clean install -DskipTests -Drevision=3.5.0 -Dspotless.check.skip=true -Dcheckstyle.skip=true -Drat.skip=true 2>&1 | tail -3
```

```shell
cd flink-cdc/flink-cdc-cli && mvn clean install -DskipTests -Drevision=3.5.0 -Dspotless.check.skip=true -Dcheckstyle.skip=true -Drat.skip=true 2>&1 | tail -3
```

```shell
./bin/flink-cdc.sh psql_to_star.yaml --flink-home ~/IdeaProjects/flink-1.20.3
```

```shell
mvn clean install -DskipTests -Drat.skip=true -pl flink-cdc-connect/flink-cdc-source-connectors/flink-connector-debezium,flink-cdc-connect/flink-cdc-pipeline-connectors/flink-cdc-pipeline-connector-postgres -am
```


build for 3.5.0
```shell
mvn clean install -DskipTests -Drat.skip=true -Drevision=3.5.0 -pl flink-cdc-connect/flink-cdc-source-connectors/flink-connector-debezium,flink-cdc-connect/flink-cdc-pipeline-connectors/flink-cdc-pipeline-connector-postgres -am
```

### Run PostgreSQL schema inference tests
```shell
mvn test -Dtest=PostgresSchemaDataTypeInferenceTest \
  -pl flink-cdc-connect/flink-cdc-pipeline-connectors/flink-cdc-pipeline-connector-postgres
```


### Run Debezium deserialization tests
```shell
mvn test -Dtest=DebeziumEventDeserializationSchemaTest \
  -pl flink-cdc-connect/flink-cdc-source-connectors/flink-connector-debezium
```

### Build connector
```shell
mvn clean package -pl flink-cdc-connect/flink-cdc-pipeline-connectors/flink-cdc-pipeline-connector-postgres -am -DskipTests
```
