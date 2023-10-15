#!/usr/bin/env bash

# Install Softwares
printf "\n\nInstalling Required Dev Softwares\n"
. ./scripts/install_softwares.sh

# Clone Git Repositories
printf "\n\nCloning Git Repositories!\n"
. ./scripts/clone_repos.sh
