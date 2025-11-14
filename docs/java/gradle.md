### Run gradle commands using docker
```shell
docker run --rm -v "$(pwd)":/home/gradle/project -w /home/gradle/project public.ecr.aws/docker/library/gradle:jdk17-jammy gradle dependencyUpdates
```

### Completely build trino
```shell
./mvnw clean install -DskipTests -Dair.check.skip-all=true
```

### build trino docker image
#### have to do this after the above cmd
```shell
./core/docker/build.sh -a arm64
```