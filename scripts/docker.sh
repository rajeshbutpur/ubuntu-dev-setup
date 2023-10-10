#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Docker CE
###############################################################################
# URL: https://docs.docker.com/install/linux/docker-ce/ubuntu/
###############################################################################

NAME="Docker"

###############################################################################

# DOCKER_COMPOSE_VERSION
[ -z "${DOCKER_COMPOSE_VERSION}" ] && DOCKER_COMPOSE_VERSION="v2.21.0"

###############################################################################

print_banner "$NAME" "DOCKER_COMPOSE_VERSION=$DOCKER_COMPOSE_VERSION"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    # sudo apt-get remove -y docker docker-engine docker.io \
    sudo apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        software-properties-common \
        gnupg \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && sudo chmod a+r /etc/apt/keyrings/docker.gpg \
    && echo \
         "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
         "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
         sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && sudo apt-get update \
    && sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    && sudo usermod -aG docker "$(id -u -n)" \
    && sudo curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/"docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && sudo chmod +x /usr/local/bin/docker-compose \
    && finish_install "$MARKER" "DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}"
else
    already_installed "$MARKER"
fi
