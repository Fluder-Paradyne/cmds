### Run gradle commands using docker
```shell
docker run --rm -v "$(pwd)":/home/gradle/project -w /home/gradle/project public.ecr.aws/docker/library/gradle:jdk17-jammy gradle dependencyUpdates
```

### Completely build trino
```shell
./mvnw clean install -pl plugin/trino-hudi -am -Dmaven.test.skip=true -Dair.check.skip-all=true
```

### build trino docker image
```shell
./core/docker/build.sh -a arm64
```