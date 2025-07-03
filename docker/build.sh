# build script to automate this process
docker build . --platform linux/arm64 -t systemshock && \
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes && \
docker run --platform=linux/arm64 --name systemshock systemshock /bin/bash -c 'cmake . && make -j4' && \
docker cp `docker ps -q -l`:/root/systemshock/systemshock ../sshock/systemshock.aarch64 && \
echo "systemshock.aarch64 built and placed on ../sshock"
