source "/workspace/src/devops/config" #creates var $build_type and var image_name
_BRANCH_SHORT=$1

export DEVOPS_ENV_NAMESPACE=$_BRANCH_SHORT
export DEVOPS_ENV_BUILD_TYPE=$build_type
export DEVOPS_ENV_IMAGE_NAME=$image_name

source /workspace/version.sh
cd /workspace/src
export DEVOPS_ENV_SRC_VERSION=$(getVersion)
export DEVOPS_ENV_SRC_NEXT_VERSION=$(getNextVersion)

env | grep "^DEVOPS_ENV_" >> /workspace/devops_env
env | grep "^DEVOPS_ENV_"