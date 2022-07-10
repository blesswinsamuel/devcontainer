# FROM ubuntu:jammy

# RUN apt-get update && \
#   apt-get install -y sudo git curl python3-dev python3-pip fish nodejs && \
#   rm -rf /var/lib/apt/lists/*

# RUN pip install pipx ansible

# RUN curl -sS https://starship.rs/install.sh | sh

# RUN useradd -m bless && adduser bless sudo
# USER bless

# # RUN echo $HOME
# WORKDIR /home/bless

# COPY entrypoint.sh .

# ENTRYPOINT ["./entrypoint.sh"]


FROM alpine

RUN apk add --no-cache \
  sudo git make musl-dev go \
  bash fish starship \
  curl wget openssh \
  python3 py3-pip nodejs-current npm go

# RUN apk add --no-cache docker
RUN apk add --no-cache kubectl --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN corepack enable

RUN pip install --no-cache-dir --ignore-installed pipx ansible poetry

# https://wiki.alpinelinux.org/wiki/Setting_up_a_new_user
RUN adduser -s /usr/bin/fish -D bless bless && \
  echo "bless ALL=(ALL) ALL" > /etc/sudoers.d/bless && chmod 0440 /etc/sudoers.d/bless && \
  echo 'bless:password' | chpasswd

USER bless

# RUN echo $HOME
WORKDIR /home/bless

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
