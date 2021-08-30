#!/bin/sh

# this script has only to be run once to clone the repositoriy and install the required tools.

# get the latest source code
git clone https://github.com/DMDcoin/openethereum-3.x.git

# install required dependencies
sudo apt-get install build-essential cmake -y

# install rustup so we can build rust software
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# makes rustup availaible
source $HOME/.cargo/env

# choose the currect rust version.
rustup default 1.52.1-x86_64-unknown-linux-gnu

# switch into the directory we have pulled
cd openethereum-3.x

# build the client.
cargo build --release

# finally copy the build result to 
cp openethereum-3.x/target/release/openethereum ./dmdv4-testnet/openethereum
