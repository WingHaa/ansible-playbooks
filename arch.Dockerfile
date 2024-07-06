FROM archlinux AS base
WORKDIR /usr/local/bin
RUN pacman -Syu --noconfirm \
    base-devel \
    ansible \
    python \
    python-pip \
    sudo \
    make \
    && pacman -Scc --noconfirm

RUN groupadd --gid 1000 winghaa \
    && useradd --uid 1000 --gid 1000 --shell /bin/bash --create-home winghaa

RUN echo "winghaa ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER winghaa
WORKDIR /home/winghaa

FROM base AS wing
ARG TAGS
USER winghaa
WORKDIR /home/winghaa

COPY . .
