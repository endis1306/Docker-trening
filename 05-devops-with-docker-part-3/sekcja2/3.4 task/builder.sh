#!/bin/sh
set -e

if [ $# -ne 2 ]; then
  echo "Usage: builder <github_repo> <dockerhub_repo>"
  exit 1
fi

GITHUB_REPO=$1
DOCKER_REPO=$2

echo "Logging into Docker Hub..."
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin

echo "Cloning repository..."
git clone https://github.com/$GITHUB_REPO app
cd app

echo "Building image..."
docker build -t $DOCKER_REPO .

echo "Pushing image..."
docker push $DOCKER_REPO

echo "Done"
