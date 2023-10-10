#!/usr/bin/env bash

set -e

MARKER=$(basename "${BASH_SOURCE%.*}")

###############################################################################
# SDKMAN
###############################################################################
# URL: https://sdkman.io/
###############################################################################

NAME="SDKMAN"

###############################################################################

print_banner "$NAME"

if [ ! -f "$MARKER_DIRECTORY"/"$MARKER" ]; then
    curl -s "https://get.sdkman.io" | bash \
    && source "$HOME/.sdkman/bin/sdkman-init.sh" \
    && sdk version \
    && sudo apt-get update \
    && finish_install "$MARKER"
else
    already_installed "$MARKER"
fi
