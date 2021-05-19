# dmdv4-testnet
Testnet setup guide for running a DMD Diamond v4 Blockchain Node.
This guide has been developed for ubuntu 18 and ubuntu 20 systems.
We suggest Ubuntu 20.04 LTS.

## copy required files to your node server

Copy the file from this repository on your node software.
A convenient way to do that, is using git to download and keeping your tools up to date.

```bash
# install git
apt install git -y
# clone repository for the dmdv4 testnet
git clone https://github.com/DMDcoin/dmdv4-testnet.git
# switch into the new directory
cd dmdv4-testnet
```

## Quick Guide - Full Node

Running a validator Node without participating as validator is relativly easy.

run 
```bash
# downloads binaries and mark them executable.
./download-binaries.sh
# starts openethereum, using a full node configuration.
./openethereum -c=fullnode.toml
```


## Quick Guide - Validator Node

This section of the guide is currently for invited closed alpha users only.

Running a validator node is a bit more complex,
since it requires a dedicated unlocked account
to allow the hbbft engine to sign your block contributions.


```bash
# create a mining key for your new node.
./dmd create_miner
```

copy your public key for later usage
copy your address to the clipboard

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
such as Metamask or the Brave Browser.

At the time of writing, there are known issues with metamask in combination with DMDv4 Blockchain.
Currently we suggest to use the Brave Browser that ships with a wallet included.


You need to add the DMD Network:

```
Network Name:      DMDv4 Alpha2
RPC URL:       http://93.104.209.46:8540
Chain ID:          777004
Symbol:            tDMD
Block Explorer URL: http://explorer.uniq.diamonds/
```

If you want to use your own server as RPC Endpoint instead, you can also spin up your own RPC Server with `./openethereum -c=rpcnode.toml`

Now your wallet should be connected to the network,
so let us know what is your address - so we can fund you for the next step.

## staking on your node

Once your node is running and you have 10000 tDMD,
you can visit http://staking.uniq.diamonds/

Now you need your public key from the setup step again.
If you don't have it anymore, and you used the dmd tool, your public key is written to `./public_key.txt`

Your public key is also outputed when you start your node
Public node URL: 
```
devp2p2 INFO network  Public node URL: enode://123abc..567def@127.0.0.1:30301
```

The hex numeric section in the middle of your enode is your public key.
Enter this public key without leading 0x in the input field `public key` in the staking UI.
If everything is alright, the tool will calculate a 'mining key'.
This 'mining key' must be the same that you had configured in the 'validator_node.toml'.

For `staking amount (DMD)` choose a value between 10000 and 50000.

When you click the `Add Pool` button, your wallet should ask for confirmation.

After confirmation, your Pool should become available.

## Running your node in a tmux or screen session

To achieve that your node remains available you should run it in a screen, a tmux session, or as a systemd service, or a similar solution.

screen is installed by default on most systems.

Just do 
```bash
screen
# (you will be forwarded to a new terminal session)
# now, start your node here
./openethereum -c=validator_node.toml
# now you can press (CTRL+a), d to detach from your session again.
# OR just close the terminal program you are using.
```

check if it works, by reattaching to your screen session
```bash
screen -r
```


