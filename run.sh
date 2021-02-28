# build from dockerfile
docker build -t ContainerName .
docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -u qtuser \
    --network=host --privileged ContainerName