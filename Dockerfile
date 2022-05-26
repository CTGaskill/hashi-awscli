FROM alpine:latest
RUN  apk add --no-cache curl jq python3 py3-pip wget zip unzip gpg vault libcap nano
################################
# Install awscli
################################

RUN pip3 install awscli
# add aws cli location to path
RUN export PATH=~/Library/Python/3.9/bin:$PATH

RUN aws --version
################################
# Install Terraform
################################

# Download terraform for linux
RUN wget https://releases.hashicorp.com/terraform/1.2.0/terraform_1.2.0_linux_amd64.zip

# Unzip
RUN unzip terraform_1.2.0_linux_amd64.zip

# Move to local bin
RUN mv terraform /usr/local/bin/
# Check that it's installed
RUN terraform --version 

# add aws cli location to path
ENV PATH=~/.local/bin/sh:$PATH

################################
# Install Vault
################################
RUN setcap cap_ipc_lock= /usr/sbin/vault