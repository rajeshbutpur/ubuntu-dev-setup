#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# Authy 2FA
###############################################################################
# URL: https://authy.com/
###############################################################################

NAME="Authy 2FA"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    sudo snap install authy \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
