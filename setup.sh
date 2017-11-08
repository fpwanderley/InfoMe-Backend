#!/usr/bin/env bash

### Setup Script ###
# Execute it in order to have everything set up regarding to Docker:
# - Install the correct version of Docker (17.06) (https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).
# - Download/Build all needed Docker Images.
# Usage: source setup.sh

# Uninstall old versions
apt-get remove docker docker-engine docker.io

# Update apt-get
apt-get update
apt-get install -y\
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add official Docker GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add repository.
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker 17.06 CE.
apt-get update
apt-get install -y docker-ce

# Download Docker needed Images.
docker pull postgres

# Create custom Images.
source build_images.sh -i dev -v 1.0
source build_images.sh -i envs -v 1.0
