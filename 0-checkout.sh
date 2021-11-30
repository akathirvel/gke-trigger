#!/bin/bash

_SRC_REPO_URL=$1
_BRANCH=$2
ssh_key=$3

echo "Creating floder....."$ssh_key
mkdir /root/.ssh

REPO_SECRETS=$(gcloud secrets versions access latest --secret="$ssh_key")

echo "DONE Creating floder....."
echo "$REPO_SECRETS" >> /root/.ssh/id_rsa

chmod 400 /root/.ssh/id_rsa
ssh-keyscan github.com > /root/.ssh/known_hosts

git clone -b $_BRANCH $_SRC_REPO_URL src
(cd src; git log -1)
