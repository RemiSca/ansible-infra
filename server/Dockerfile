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
      neofetch \
      openjdk-11-jdk \
      python3-pip \
      make build-essential libssl-dev zlib1g-dev libbz2-dev \
      libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
      xz-utils tk-dev libffi-dev liblzma-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get --no-install-recommends -y install \
      iputils-ping \
      sshpass \
      ssh && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# pyenv dependencies
#RUN apt-get --no-install-recommends -y install make build-essential libssl-dev zlib1g-dev libbz2-dev \
#libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
#xz-utils tk-dev libffi-dev liblzma-dev

RUN pip install ansible

RUN useradd user --shell /usr/bin/zsh --uid 501 && \
echo "remi ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user

VOLUME /home/user

USER user

WORKDIR /home/user

ENTRYPOINT ["tail", "-f","/dev/null"]

