### Run gradle commands using docker
```shell
docker run --rm -v "$(pwd)":/home/gradle/project -w /home/gradle/project public.ecr.aws/docker/library/gradle:jdk17-jammy gradle dependencyUpdates
```
