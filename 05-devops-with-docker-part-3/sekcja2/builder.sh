#!/bin/bash


set -e

GITHUB_REPO=$1
DOCKERHUB_REPO=$2

if [ -z "$GITHUB_REPO" ] || [ -z "$DOCKERHUB_REPO" ]; then
  echo "Usage: ./builder.sh <github_repo> <dockerhub_repo>"
  echo "Example: ./builder.sh mluukkai/express_app mluukkai/testing"
  exit 1
fi

REPO_NAME=$(basename "$GITHUB_REPO")

echo "Cloning repository..."
echo "Cloning https://github.com/$GITHUB_REPO.git"
git clone https://github.com/$GITHUB_REPO.git

cd $REPO_NAME

echo "Building Docker image..."
docker build -t $DOCKERHUB_REPO .

echo "Pushing image to Docker Hub..."
docker push $DOCKERHUB_REPO

echo "Done!"
