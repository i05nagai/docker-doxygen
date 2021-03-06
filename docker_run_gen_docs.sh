#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${0});pwd)
PATH_TO_REPOSITORY=${SCRIPT_DIR}/project
REPOSITORY_NAME=$(basename ${PATH_TO_REPOSITORY})
PATH_TO_REPOSITORY_IN_DOCKER=/tmp/${REPOSITORY_NAME}

docker run -it --rm \
  --volume ${PATH_TO_REPOSITORY}:${PATH_TO_REPOSITORY_IN_DOCKER} \
  doxygen:1.8.13 \
  /bin/ash -c "cd ${PATH_TO_REPOSITORY_IN_DOCKER}; doxygen ${PATH_TO_REPOSITORY_IN_DOCKER}/Doxyfile"
