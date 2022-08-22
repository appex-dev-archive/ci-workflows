#!/bin/bash

read -a params <<< "$1"
only_version="${params[0]}"

echo "Configuring git ..."
git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"
git pull
git checkout main

echo "Tagging package version ..."
tag="$(git describe --tags --abbrev=0)"
npm version "$tag" -m "Release version: %s"
git push

if [ "$only_version" = "false" ]
then
  echo "Publishing package ..."
  npm publish
fi