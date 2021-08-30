#!/bin/sh

# switch into the directory we have pulled
cd openethereum-3.x

git pull

source $HOME/.cargo/env

# choose the currect rust version.
rustup default 1.52.1-x86_64-unknown-linux-gnu

# build the client.
cargo build --release --all

# finally copy the build result to 
cp target/release/openethereum ../openethereum
cp target/release/dmd ../dmd
