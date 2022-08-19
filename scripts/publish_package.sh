#!/bin/bash

IS_PUBLISH=$1
PACKAGE_LOCATION=$2

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"
git pull
git checkout main

TAG="$(git describe --tags --abbrev=0)"

cd $PACKAGE_LOCATION

npm version "$TAG" -m "Release version: %s"

# npm version command does not commit in directory where there is no .git file
if [ "$PACKAGE_LOCATION" != './' ]
then
  git add .
  git commit -m "Release version: $TAG"
fi

git push

if [ "$IS_PUBLISH" = "true" ]
then
  npm publish
fi