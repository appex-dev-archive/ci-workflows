#!/bin/bash

ONLY_VERSION=$1

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"
git pull
git checkout main

TAG="$(git describe --tags --abbrev=0)"

npm version "$TAG" -m "Release version: %s"

git push

if [ "$ONLY_VERSION" = "false" ]
then
  npm publish
fi