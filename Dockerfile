FROM ubuntu:20.04

LABEL version="1.0"
LABEL maintainer="Sirat Baweja"

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