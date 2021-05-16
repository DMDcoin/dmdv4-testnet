# dmdv4-testnet
testnet setup for a DMD Diamond v4


## add network to Wallet

You need to have a wallet that supports the DMD Diamond v4 Network,
such as Metamask. 

At the time of writing, there are known issues with metamask in combination with DMDv4 Blockchain.

Network Name: DMDv4 Alpha
New RPC URL: http://93.104.209.46:8540
Chain ID: 777003
Symbole: tDMD
Block Explorer URL: http://explorer.uniq.diamonds/




## Quick Guide - Full Node

run 
```
./download-binaries.sh
./openethereum -c=fullnode.toml
```

## Quick Guide - Validator Node


```
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

 Testnet port: 46664


## Run a Node

A node is specified by 2 definition files:
- chainspec.json: chain specification 
- node.toml: Node configuration file


This repository contains the latest chainspec.json
and a set of different node configuration files.


`./openethereum -c=node.toml`

this will pull up


There are several ways on how to create a keystore file:
https://www.myetherwallet.com/create-wallet



