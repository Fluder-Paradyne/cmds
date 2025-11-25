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
