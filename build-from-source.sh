#!/bin/bash

# switch into the directory we have pulled
cd diamond-node-git

git pull

source $HOME/.cargo/env

# choose the currect rust version.
rustup default 1.68.2-x86_64-unknown-linux-gnu

export RUSTFLAGS='-C target-cpu=native'

# build the client.
cargo build --release --all -j 1

# finally copy the build result to 
cp target/release/diamond-node ../diamond-node
cp target/release/dmd ../dmd
