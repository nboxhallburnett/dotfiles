#!/usr/bin/env bash

# Define the array of packages to install globally
PACKAGES=(
	"acs@1.2.0"
	"appcelerator"
	"eslint"
	"gulp"
	"mocha"
	"mongo-express"
	"npm-check-updates"
)

LIST=$(IFS=' ' ; echo "${PACKAGES[*]}");
DESCRIPTION=$(IFS=',' ; echo "${PACKAGES[*]}");

echo "Globally installing: $DESCRIPTION"

npm install -g $LIST

echo "Done"
