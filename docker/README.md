# System Shock shockolate based port for portmaster enabled arm64 devices

Original System Shock port for arm64 devices based on [shockolate](https://github.com/Interrupt/systemshock).

## Compilation

### Automatic
There is a `build.sh` script in this directory that you can use to automate
the process below:

```
. build.sh
```

### Interactive
If you wish to do it manually:
Build and run the docker image:

```
docker build . --platform linux/arm64 -t systemshock
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
docker run --platform=linux/arm64 --name systemshock systemshock /bin/bash -c 'cmake . && make -j4'
```

If all went well we should have the systemshock binary, let's take it out of
the container:

```
docker cp `docker ps -q -l`:/root/systemshock/systemshock ../sshock/systemshock.aarch64
```
At this point the executable should be in place.
