#!/bin/bash -x
# https://stackoverflow.com/questions/50755859/pull-and-push-image-to-another-project-using-gcloud-container-builder works as owner
_BRANCH_SHORT=$1

source /workspace/devops_env
dockerfile="/workspace/$DEVOPS_ENV_BUILD_TYPE/run/Dockerfile"
if test -f "/workspace/src/devops/run/Dockerfile"; then
  dockerfile="/workspace/src/devops/run/Dockerfile"
fi


fullImageName="gcr.io/ace-element-332607/$DEVOPS_ENV_IMAGE_NAME/$_BRANCH_SHORT"

echo "Creating and pushing docker image $fullImageName"
docker build -t "$fullImageName" -f $dockerfile /workspace/src
docker push "$fullImageName"

DEVOPS_ENV_IMAGE_TO_DEPLOY=$fullImageName
if [ "$_BRANCH_SHORT" == "main" ]; then
  taggedImage="$fullImageName:$DEVOPS_ENV_SRC_VERSION"
  docker tag "$fullImageName" "$taggedImage"
  docker push "$fullImageName"
  DEVOPS_ENV_IMAGE_TO_DEPLOY=$taggedImage
fi


export DEVOPS_ENV_IMAGE_TO_DEPLOY
env | grep "^DEVOPS_ENV_" >> /workspace/devops_env
env | grep "^DEVOPS_ENV_"
