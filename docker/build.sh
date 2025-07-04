# spin up qemu for cross compilation
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes && \

# build the image
docker build . --platform linux/arm64 -t systemshock && \

# configure and build the binary
docker run --platform=linux/arm64 --name systemshock systemshock /bin/bash -c 'cmake . && make -j4' && \

# copy the binary out of the container
docker cp `docker ps -q -l`:/root/systemshock/systemshock ../sshock/sshock.aarch64 && \

# package into sshock.zip
pushd ..
zip sshock.zip -r * -x docker/ docker/* sshock/res/data/*
popd
mv ../sshock.zip ./

echo "sshock.zip is ready to be installed."
