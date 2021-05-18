# dmdv4-testnet
Testnet setup guide for a DMD Diamond v4


## copy required file to your node server

A convenient way to do that, is using git to download and keep your tools up to date.

```bash
# install git
apt install git -y
# clone repository for the dmdv4 testnet
git clone https://github.com/DMDcoin/dmdv4-testnet.git
# switch into the new directory
cd dmdv4-testnet
```

## Quick Guide - Full Node

run 
```bash
# downloads binaries and mark them executable.
./download-binaries.sh
# starts openethereum, using a full node configuration.
./openethereum -c=fullnode.toml
```



## Quick Guide - Validator Node

Running a validator node is a bit more complex,
since it requires a dedicated unlocked account
to allow the hbbft engine to sign your block contributions.


```bash
# create a mining key for your new node.
./dmd create_miner
```

copy your public key for later usage
copy your address (for example clipboard)

open the example config in your favorite text editor like
```bash
# copy the template we prepared.
cp validator-template.toml validator_node.toml
# edit the config file.
nano validator_node.toml
```

replace `put your address here` with your address that got just generated.

```bash
# starts your Node using the new config file.
./openethereum -c=validator_node.toml
```

You should verify the log output if the enode id contains the public key you have created with the dmd tool.
Verify that the node is able to sync to the latest state of the blockchain.

Node that the hbbft consensus algorithm is not prone to forks,
either it creates blocks, or it get's stuck.

If your node ends up importing individual blocks every now and then,
that is a good sign that it is in sync.

```
INFO import  Imported #1040 0xabfe…f189 (0 txs, 0.00 Mgas, 29 ms, 0.56 KiB)
```

Another source what is the latest block can be found here: http://explorer.uniq.diamonds

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

## Ports

Planned for the next Testnet: 46664




