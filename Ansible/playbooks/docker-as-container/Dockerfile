FROM ubuntu:22.04

ENV container=docker
ENV pip_packages "ansible"
ENV ANSIBLE_HOST_KEY_CHECKING "False"

# Update System
RUN apt -y update && apt -y upgrade

# Install requirements.
RUN apt -y install python3 python3-pip openssh-client

# Upgrade Pip
RUN pip3 install --upgrade pip

# Install Ansible via Pip.
RUN pip3 install $pip_packages

CMD ["/bin/bash"]pwd
