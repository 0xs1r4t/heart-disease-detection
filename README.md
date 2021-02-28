# Heart Disease Detection

## Table of Contents

1. [Pre-Requisites](https://github.com/sBx99/heart-disease#pre-requisites)
2. [Running the Application](https://github.com/sBx99/heart-disease#running-the-application)
    1. [Running via Docker](https://github.com/sBx99/heart-disease#running-via-docker)
        - [x] [Dockerfile](https://github.com/sBx99/heart-disease#dockerfile)
    2. [Running without Docker](https://github.com/sBx99/heart-disease#running-without-docker)

## Pre-Requisites

Clone this repository or download all these files in a single directory (folder).

```bash
git clone https://github.com/sBx99/heart-disease.git
cd heart-disease # all files are under this folder
```

You don't need to do this. You may also use the [official container image from Docker Hub](siratb/python-gui-browser:latest) by following the steps below.

## Running the application

### Running via Docker

If you have `docker` on PC, you can run this pretty easily.

You could pull the official image from [Docker Hub](https://hub.docker.com/repository/docker/siratb/python-gui-browser) and run it:

```bash
docker pull siratb/python-gui-browser:latest
docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -u qtuser \
    --network=host --privileged siratb/python-gui-browser:latest
```

Run the code below if you've cloned the repo.

```bash
# see run.sh

# change 'ContainerName' to a container name of your choice
docker build -t ContainerName .
docker run --rm -it \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    -u qtuser \
    --network=host --privileged ContainerName
```

#### Dockerfile

Feel free to modify the following dockerfile according to your needs.

[Docker Hub](https://hub.docker.com/repository/docker/siratb/python-gui-browser)

```Dockerfile
FROM ubuntu:20.04

LABEL version="1.0"
LABEL maintainer="Sirat Baweja sirat.b99@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

WORKDIR /app

# Add user
RUN adduser --quiet --disabled-password qtuser && usermod -a -G audio qtuser

# This fix: libGL error: No matching fbConfigs or visuals found
ENV LIBGL_ALWAYS_INDIRECT=1

# Install Python 3, PyQt5 and browser utils
RUN apt-get update && \
    apt-get install -y python3-pip python3-pyqt5 xorg xauth openbox firefox

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "main.py"]
```

### Running without Docker

1. Make sure you have PyQT5 installed on your system. You can check out how to do so on any distro over [here](https://pythonbasics.org/install-pyqt/).

2. Run the following in an interactive terminal (which runs bash and python) to install the dependencies and run the program.

    ```bash
    # create a virtual environment
    # OPTIONAL
    python -m venv my_env
    source my_env/bin/active

    # install all dependencies
    pip install -r --no-cache-dir requirements.txt

    # run the program
    python main.py
    ```
