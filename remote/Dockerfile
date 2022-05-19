FROM debian:bullseye-20220509

RUN apt-get update && \
    apt-get --no-install-recommends -y install \
      sudo \
      zsh \
      git \
      curl \
      vim \
      procps \
      man \
      make build-essential libssl-dev zlib1g-dev libbz2-dev \
      libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
      xz-utils tk-dev libffi-dev liblzma-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get --no-install-recommends -y install \
      net-tools \
      systemctl \
      openssh-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    service ssh start

# sshd
RUN mkdir /var/run/sshd; \
    sed -i 's/^#\(PermitRootLogin\) .*/\1 yes/' /etc/ssh/sshd_config; \
    sed -i 's/^\(UsePAM yes\)/# \1/' /etc/ssh/sshd_config; \
    apt clean;

# entrypoint
RUN { \
    echo '#!/bin/bash -eu'; \
    echo 'ssh-keygen -A'; \
    echo 'exec "$@"'; \
    } > /usr/local/bin/entry_point.sh; \
    chmod +x /usr/local/bin/entry_point.sh;

ENV ROOT_PASSWORD=root

RUN echo "root:${ROOT_PASSWORD}" | chpasswd

EXPOSE 22

# pyenv dependencies
#RUN apt-get --no-install-recommends -y install make build-essential libssl-dev zlib1g-dev libbz2-dev \
#libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
#xz-utils tk-dev libffi-dev liblzma-dev

#ENTRYPOINT ["tail", "-f","/dev/null"]
ENTRYPOINT ["entry_point.sh"]
CMD    ["/usr/sbin/sshd", "-D", "-e"]
