#!/bin/bash

# this build script creates a node software with advanced tracing features enabled.
# the result will have a much lower performance, but is required for developers to get more insights into the node software.

export DMD_NODE_BUILD_FLAGS="--all --profile perf --features deadlock_detection"
export DMD_NODE_BUILD_PROFILE="perf"

./_build-from-source-base.sh