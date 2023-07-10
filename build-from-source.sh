#!/bin/bash

# switch into the directory we have pulled

export DMD_NODE_BUILD_FLAGS="--all -j 1 --release"
export DMD_NODE_BUILD_PROFILE="/dmd="release"

./build-from-source-base.sh