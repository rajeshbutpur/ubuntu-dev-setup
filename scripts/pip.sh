#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# pip
###############################################################################
# URL: https://pypi.org/project/pip/
###############################################################################

NAME="pip Install"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo apt-get install -y python3-setuptools python3-dev python3-venv build-essential \
    && sudo apt-get install -y python3-pip \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
