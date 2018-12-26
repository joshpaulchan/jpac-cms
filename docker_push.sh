#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

REPOSITORY_NAME="joshpaulchan/cms"
TAG="latest"
if [ $TRAVIS_PULL_REQUEST ] then
    $TAG=$TRAVIS_PULL_REQUEST_BRANCH
else
    $TAG=$TRAVIS_BRANCH
fi
# expansion maps '/' in branch names to '-'
docker build --rm -t $REPOSITORY_NAME:$($TAG | tr '/' '-') .
docker push $REPOSITORY_NAME