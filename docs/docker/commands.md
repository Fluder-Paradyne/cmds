```shell
docker rmi -f $(docker images -aq)
```

### Go inside a container
```shell
docker run -rm -it docker-image sh
```
