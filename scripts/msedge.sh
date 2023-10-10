#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Microsoft Edge
###############################################################################
# URL: https://www.microsoft.com/en-us/edge
###############################################################################

NAME="Microsoft Edge"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
    && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' \
    && sudo apt-get update \
    && sudo apt-get install -y microsoft-edge-stable \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
