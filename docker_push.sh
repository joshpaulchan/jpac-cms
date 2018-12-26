#!/bin/bash
# Must define the following variables in the environment:
# - DOCKER_USERNAME
# - DOCKER_PASSWORD
# - REPOSITORY_NAME (i.e. `joshpaulchan/cms`)
# - TRAVIS_PULL_REQUEST or TRAVIS_BRANCH

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
if [ $TRAVIS_PULL_REQUEST ]; then
    TAG="pr-$TRAVIS_PULL_REQUEST"
else
    TAG=$TRAVIS_BRANCH
fi
# expansion maps '/' in branch names to '-'
ESCAPED_TAG=$(tr '/' '-' <<< "$TAG")
echo "Tagging Docker build as: $REPOSITORY_NAME:$ESCAPED_TAG. "
docker build --rm -t $REPOSITORY_NAME:$ESCAPED_TAG .
docker push $REPOSITORY_NAME