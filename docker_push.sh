#!/bin/bash
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

REPOSITORY_NAME="joshpaulchan/cms"
TAG="latest"
if [ $TRAVIS_PULL_REQUEST ]; then
    TAG=$TRAVIS_PULL_REQUEST_BRANCH
else
    TAG=$TRAVIS_BRANCH
fi
# expansion maps '/' in branch names to '-'
ESCAPED_TAG=$(tr '/' '-' <<< "$TAG")
echo "Tagging Docker build as: $REPOSITORY_NAME:$ESCAPED_TAG. "
docker build --rm -t $REPOSITORY_NAME:$ESCAPED_TAG .
docker push $REPOSITORY_NAME