#!/bin/bash

ONLY_VERSION=$1

git config --global user.email "appex.software.development@gmail.com"
git config --global user.name "appex-org"
git pull
git checkout main

TAG="$(git describe --tags --abbrev=0)"

cd $PACKAGE_LOCATION

npm version "$TAG" -m "Release version: %s"

git push

if [ "$ONLY_VERSION" = "false" ]
then
  npm publish
fi