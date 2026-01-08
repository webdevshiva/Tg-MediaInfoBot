FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 LANGUAGE=en_US:en TZ=Asia/Kolkata

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
    software-properties-common \
    python3-pip \
    git \
    wget \
    ffmpeg \
    sox \
    libsox-fmt-mp3 \
    locales \
    libcurl4 \
    libtinyxml2-6a \
    libzen0v5 \
    mediainfo \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
RUN chmod +x start

CMD ["bash", "start"]
