# dmdv4-testnet
testnet setup for a DMD Diamond v4


## add network to Wallet

You need to have a web3 wallet that supports the DMD Diamond v4 Network,
such as Metamask. 

At the time of writing, there are known issues with metamask in combination with DMDv4 Blockchain.
Currently we suggest to use the Brave Browser that ships with a wallet included.


You need to add the DMD Network:

```
Network Name:      DMDv4 Alpha
New RPC URL:       http://93.104.209.46:8540
Chain ID:          777003
Symbol:            tDMD
Block Explorer URL: http://explorer.uniq.diamonds/
```


## Quick Guide - Full Node

run 
```
./download-binaries.sh
./openethereum -c=fullnode.toml
```

## Quick Guide - Validator Node


```
# install the tools we need
apt install git -y
# clone the repository
git clone https://github.com/DMDcoin/dmdv4-testnet.git
# switch into the new directory
cd dmdv4-testnet
# create a mining key for your new node.
./dmd create_miner
```

copy your public key for later usage
copy your address (for example clipboard)

open the example config in your favorite text editor like
```
nano validator-example.toml
```

replace `put your address here` with your address that got just generated.

Start your Node
```
./openethereum -c=validator_node.toml
```

You should verify the log output if the enode id contains the public key you have created with the dmd tool.
Verify that the node is able to sync to the latest state of the blockchain.

## Ports

Planned for the next Testnet: 46664




