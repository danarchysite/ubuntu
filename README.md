# dAnarchy Image

Custom ubuntu docker custom image

## Build the image

```
docker build -t danarchy/ubuntu:latest .
```

## Run a container

```
docker run -t -i -h image --name image --rm -e ENV_USER_UID=`id -u` danarchy/ubuntu:latest /bin/bash -l
```