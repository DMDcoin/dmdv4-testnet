#!/bin/bash

# switch into the directory we have pulled
cd diamond-node-git

git pull

source $HOME/.cargo/env

# choose the currect rust version.
rustup default 1.75

export RUSTFLAGS='-C target-cpu=native'

# build the client.
cargo build $DMD_NODE_BUILD_FLAGS

# finally copy the build result to 
cp target/$DMD_NODE_BUILD_PROFILE/diamond-node ../diamond-node
cp target/$DMD_NODE_BUILD_PROFILE/dmd ../dmd
