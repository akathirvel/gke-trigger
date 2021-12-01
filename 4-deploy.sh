#!/bin/bash -x
_ACTIVE_PROFILE=$1
source /workspace/devops_env
export CLOUDSDK_COMPUTE_REGION=$2
export CLOUDSDK_CONTAINER_CLUSTER=$3

gcloud container clusters get-credentials --region "$CLOUDSDK_COMPUTE_REGION" "$CLOUDSDK_CONTAINER_CLUSTER"

export VERIFY_CHECKSUM=false
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

releaseName="$DEVOPS_ENV_IMAGE_NAME"

echo "apiVersion: v1
kind: Namespace
metadata:
  name: $DEVOPS_ENV_NAMESPACE" | kubectl apply -f -

helm upgrade --install --debug "$releaseName" /workspace/charts/angles-devops-chart \
  -f /workspace/charts/devops-chart/values.yaml \
  -f /workspace/src/devops/deploy/values.yaml \
  --set image.fullName="$DEVOPS_ENV_IMAGE_TO_DEPLOY" \
  --set activeProfile="$_ACTIVE_PROFILE" \
  --namespace "$DEVOPS_ENV_NAMESPACE"
