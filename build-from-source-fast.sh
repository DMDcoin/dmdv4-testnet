#!/bin/bash

# same as build-from-soure.sh but uses all cores and more memory.

export DMD_NODE_BUILD_FLAGS="--all --release"
export DMD_NODE_BUILD_PROFILE="release"

./build-from-source-base.sh