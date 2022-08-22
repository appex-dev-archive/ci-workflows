#!/bin/bash

read -a params <<< "$1"
only_version="${params[0]}"

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"
git pull
git checkout main

tag="$(git describe --tags --abbrev=0)"

npm version "$tag" -m "Release version: %s"

git push

if [ "$only_version" = "false" ]
then
  npm publish
fi