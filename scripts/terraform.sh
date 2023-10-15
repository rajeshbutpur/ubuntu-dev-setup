#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Terraform
###############################################################################
# URL: https://www.terraform.io/
###############################################################################

NAME="Terraform Install"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
    && sudo apt-get update && sudo apt install -y terraform \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
