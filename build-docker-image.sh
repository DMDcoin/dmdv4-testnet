#!/bin/bash

TITLE="Build script for dmd4 validator node running in docker container"
DESCR="Gets last git commit hash from current dir, prints some info\n about last commit and build parameters, then runs docker image build\n from current dir assuming that there is a Dockerfile.\n Built image is named as 'local/<current git repo name>', and tagged same as commit hash,\n and as default tag 'latest'.\n You could set additional docker tag for image as script parameter (optional)\n\n You SHOULD have docker engine installed on your host!\n Refer to http://www.docker.com\n\nLater you could run validator node in docker container using something like\n 'docker run -d local/<docker-image>:<image-tag>'"
USAGE="Usage: $( basename ${0} ) [ <docker image tag> ] | [ -h ]"

if [ "${1}" == "-h" ]
    then 
        echo -e "\n${TITLE}\n\n${DESCR}\n\n${USAGE}\n"
        exit 0; 
fi

start_time=`date +%s`

echo
echo "==============================================================================="
echo -e "${TITLE}\n\n${DESCR}\n\n${USAGE}"
echo
echo
echo "[ Repo status: ] --------------------------------------------------------------"
echo
git show -s --abbrev-commit
echo

PROJECT_NAME=$( basename $( pwd ))
GIT_COMMIT=$( git show -s --abbrev=8 --format=format:%h )
BUILD_IMAGE_TAG=${1}

echo "[ Build params: ] -------------------------------------------------------------"
echo
echo -e "PROJECT_NAME: ${PROJECT_NAME}"
echo -e "GIT_COMMIT: ${GIT_COMMIT}"
echo -e "BUILD_IMAGE_TAG: ${BUILD_IMAGE_TAG}"
echo
echo "[ Building docker image: ] ----------------------------------------------------"
echo

# echo docker build \
docker build \
    --label "git-commit.${PROJECT_NAME}=${GIT_COMMIT}" \
    -t local/${PROJECT_NAME}:${GIT_COMMIT} \
    $( [ -n "${BUILD_IMAGE_TAG}" ] && echo -n "-t local/${PROJECT_NAME}:${BUILD_IMAGE_TAG}" ) \
    -t local/${PROJECT_NAME}:latest \
    .

echo
echo "==============================================================================="

end_time=`date +%s`
build_time=$((end_time-start_time))

echo "Build time: ${build_time} s"
echo