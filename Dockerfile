FROM debian:unstable

ADD docker.gpg /
RUN apt update && \
  apt install -y python-virtualenv python-pip \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common && \
  apt-key add /docker.gpg && \
  add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/debian \
     stretch \
     stable" && \
  apt update && apt install -y docker-ce-cli && \
  apt clean && \
  rm -Rf /var/lib/apt/lists/*
