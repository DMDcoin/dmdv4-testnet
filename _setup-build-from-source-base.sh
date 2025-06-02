#!/bin/bash

# this script has only to be run once to clone the repositoriy and install the required tools.

# get the latest source code
git clone $DMD_NODE_GIT_TARGET https://github.com/DMDcoin/diamond-node.git diamond-node-git

apt-get update

# install required dependencies
apt-get install build-essential cmake -y

# install rustup so we can build rust software
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# makes rustup availaible
source $HOME/.cargo/env

# choose the currect rust version.
rustup default 1.85

