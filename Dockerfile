FROM debian:bullseye

RUN apt update && apt install software-properties-common wget jq git gnupg unzip gnupg1 gnupg2 openssh-server python python3-apt curl ca-certificates perl iproute2 vim -y

RUN sed -ri 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
RUN sed -ri 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/^UsePAM yes/UsePAM no/' /etc/ssh/sshd_config

RUN passwd -d root

RUN mkdir /run/sshd

EXPOSE 22