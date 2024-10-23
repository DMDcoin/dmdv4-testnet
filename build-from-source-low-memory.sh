#!/bin/bash

# this build flag has a lower memory footprint than the default mode.
# and maybe even results in a faster executing node software.

export DMD_NODE_BUILD_FLAGS="--all -j 1 --release"
export DMD_NODE_BUILD_PROFILE="release"

./_build-from-source-base.sh