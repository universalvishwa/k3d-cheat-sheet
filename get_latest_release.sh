#!/usr/bin/env bash

# -------------------------------------------------------------------------------------
# Title                 :       Determine latest k3s/k3d versions
# Author                :       Vishwa Seneviratne
# Github                :       github/universalvishwa
# Date                  :       03-16-2021
# Version               :       v1.0
# Description           :       Lookup latest build of Lightweight Kubernetes (k3s) distributions
# Reference             :       https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c
# Command               :       curl --silent "https://github.com/k3s-io/k3s/releases" | grep '+k3s1'| sed -E 's/.*"([^"]+)".*/\1/' | grep -E -m 1 '^v.+k3s1$'
#
# Usage                 :       ./get_latest_release.sh
# -------------------------------------------------------------------------------------


VERSION=1.0

# Variables
K3S_RELEASE_URL="https://github.com/k3s-io/k3s/releases"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'


# Get latest k3 version
get_latest_release() {
  K3S_LATEST_VERSION=$(curl --silent "https://github.com/k3s-io/k3s/releases" | grep '+k3s1' | sed -E 's/.*"([^"]+)".*/\1/' | grep -E -m 1 '^v.+k3s1$')
  echo -e "Latest k3s version: ${BLUE}$K3S_LATEST_VERSION${NC}"
}

# Set k3d docker image name
set_k3d_version() {
  K3D_VERSION=`echo $1 | tr + -`
  echo -e "Latest k3d version: ${GREEN}$K3D_VERSION${NC}"
}

# Main function
main() {
    get_latest_release
    set_k3d_version $K3S_LATEST_VERSION
}
 
main "$@"