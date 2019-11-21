#!/usr/bin/env bash

REL_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)
cd "$REL_PATH"

# Define the array of packages to install globally
PACKAGES=($(cat ./.default-npm-packages))

LIST=$(IFS=' ' ; echo "${PACKAGES[*]}");
DESCRIPTION=$(IFS=', ' ; echo "${PACKAGES[*]}");

echo "Globally installing: $DESCRIPTION"

npm install -g $LIST

echo "Done"
