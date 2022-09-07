#!/bin/bash

set -e
APP_NAME=$1
APP_ENV=$2
NAMESPACE_K8S=$3

KUBECONFIG=/tmp/deploy/config

if [ -z $SEMAPHORE_GIT_PR_BRANCH ]; then
  IS_MASTER="true"
fi

if [[ $IS_MASTER == "true" ]]; then
  VERSION_MD=${SEMAPHORE_GIT_SHA:0:6}
else
  if [[ -z $SEMAPHORE_GIT_PR_BRANCH ]]; then
    VERSION_MD=${SEMAPHORE_GIT_BRANCH}-${SEMAPHORE_GIT_SHA:0:6}
  else
    VERSION_MD=${SEMAPHORE_GIT_PR_BRANCH}-${SEMAPHORE_GIT_PR_SHA:0:6}
  fi
fi

VERSION_MD=${APP_ENV}-${VERSION_MD}
echo "Version of the pipeline: ${VERSION_MD}"

mkdir -p /tmp/deploy
mkdir -p /tmp/deploy/aws
echo "AWS eks"
pip3 install awscli --upgrade --user
aws eks --region eu-north-1 update-kubeconfig --name ds-eks

echo "Docker login"
docker login -u $DOCKER_USERNAME -p $DOCKER_ACCESS_TOKEN

echo "Build local app"
mkdir -p tmp/
docker run --rm --name slate -v $(pwd)/tmp/build:/srv/slate/build -v $(pwd)/docs/source:/srv/slate/source slatedocs/slate build

echo "Login to ECR"
aws ecr --region eu-north-1 get-login-password | docker login --username AWS --password-stdin $ECR_LONG

echo "Build ARM image"
sudo apt-get install -y binfmt-support qemu-user-static
docker buildx create --platform linux/arm64 --bootstrap --use
docker buildx build --platform linux/arm64 --push -t ${ECR_LONG_DOCS}:${VERSION_MD} -f containers/${APP_NAME}/Dockerfile .

echo "Helm upgrade"
echo "name: "$APP_NAME >> .helm/$APP_NAME/Chart.yaml
helm upgrade $APP_NAME .helm/$APP_NAME/ --install --namespace $NAMESPACE_K8S -f .helm/$APP_NAME/$APP_ENV.yaml --set image.tag=$VERSION_MD
