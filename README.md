# DMDv4 Testnet

**Testnet setup guide for running a DMD Diamond v4 Blockchain Node.**  
This guide is designed for **Ubuntu 18.04** and **Ubuntu 20.04** systems.  
We recommend using **Ubuntu 20.04 LTS** or **Ubuntu 22.04 LTS**.

Validator Node Spec recommendation:
4 core 8 gb ram 200gb ssd (growing with blockchain size)
for normal full node non validator operation far lower requirement cpu/ram wise possible 
but to compile the node still need like 4gb ram and ssd space requirements are the same

----------

## Step 1: Copy Required Files to Your Node Server

Download the necessary files from this repository onto your node server.  
We recommend using `git` for easy downloads and updates.

```bash
# Install git
apt install git -y

# Clone the repository for the DMDv4 testnet
git clone https://github.com/DMDcoin/dmdv4-testnet.git

# Switch into the new directory
cd dmdv4-testnet

```

----------

## Step 2: Build the Diamond Node

Building the Diamond Node involves two steps:

1.  Preparing your machine to build the software.
2.  Running the build process.

### Prepare the Build Environment

This setup is required only once:

```bash
./setup-build-from-source.sh

```

### Build the Node

This script fetches the latest source version and builds the binaries.  
Note: The process may take up to an hour depending on your machine's performance.

```bash
./build-from-source.sh

```

----------

## Quick Guide: Running a Full Node

To run a **validator node** without participating as a validator:

```bash
# Start the Diamond Node using the full node configuration
./diamond-node -c=fullnode.toml

```

----------

## Quick Guide: Running a Validator Node

**Note:** Validator node setup is currently for invited **closed alpha users** only.

Validator nodes require a dedicated unlocked account for the **hbbft engine** to sign block contributions.

### Generate a Mining Key

Run the following command to create a mining key:

```bash
./dmd create_miner

```

This creates two files for your mining key:

1.  `./data/keys/DPoSChain/dmd_miner_key.json` (keystore format)
2.  `./data/network/key` (private key format)

### Configure the Validator Node

1.  Copy the template configuration file:
    
    ```bash
    cp template-validator.toml validator_node.toml
    
    ```
    
2.  Edit the configuration file:
    
    ```bash
    nano validator_node.toml
    
    ```
    
3.  Replace both instances of `put your address here` with the address generated by the `dmd create_miner` command.
    
4.  Start the Validator Node:
    
    ```bash
    ./start.sh
    
    ```
    

----------

## Verify Node Synchronization

Check the logs to confirm that your node is syncing with the blockchain.  
The following log output indicates successful synchronization:

```
INFO import  Imported #1040 0xabfe…f189 (0 txs, 0.00 Mgas, 29 ms, 0.56 KiB)

```

For the latest block information, visit the [block explorer](https://beta-explorer.bit.diamonds/).

----------

## Adding the Network to a Web3 Wallet

Use a wallet like **MetaMask** or the **Brave Browser** to connect to the DMD Diamond v4 Network.

### Network Configuration:

-   **Network Name:** DMDv4 Beta1
-   **RPC URL:** [https://beta-rpc.bit.diamonds](https://beta-rpc.bit.diamonds/)
-   **Chain ID:** 27272
-   **Symbol:** tDMD
-   **Block Explorer URL:** [https://beta-explorer.bit.diamonds](https://beta-explorer.bit.diamonds/)

To use your own RPC endpoint, start your node with:

```bash
./diamond-node -c=rpcnode.toml

```

Replace the RPC URL with your server's IP address.

----------

## Staking on Your Node

To stake on your node:

1.  Ensure your node is running.
2.  Have atleast **10,000 tDMD** (testnet DMD) available.

### Retrieve Your Public Key

Your public key can be found in the following locations:

-   `./public_key.txt`
-   In the node startup log (under "Public node URL").

### Stake Using the Diamond-UI

Visit the [Diamond-UI](https://beta-ui.bit.diamonds/) and enter your public key.  
Follow the instructions to set up a pool with a staking amount between **10,000 and 50,000 tDMD**.

For more details: [Diamond-UI Guide](https://github.com/DMDcoin/whitepaper/wiki/H.-Diamond-UI#h23-create-a-pool)

If u own DMD Diamond v3 coins at snapshot u can claim them following the guide here 
https://beta-claiming.bit.diamonds/
a tiny amount of DMD for enabling to interact with claiming can be requested here 
temporary http://62.171.133.46:8082/ later https://beta-faucet.bit.diamonds/



----------


## Running Your Node Persistently

### Using [tmux](https://github.com/tmux/tmux/wiki)

1.  Install `tmux` if it is not already installed:
    
    ```bash
    sudo apt install tmux -y
    ```
    
2.  Start a new `tmux` session:
    
    ```bash
    tmux new -s diamond-node
    ```
    
3.  Start the node in the session:
    
    ```bash
    ./start.sh
    ```
    
4.  Detach from the session (leave it running):
    
    ```bash
    Ctrl+b, d
    ```
    
5.  To reattach to the session:
    
    ```bash
    tmux attach -t diamond-node
    ```
    

### Using [screen](https://help.ubuntu.com/community/Screen)

1.  Install `screen` if it is not already installed:
    
    ```bash
    sudo apt install screen -y
    ```
    
2.  Start a new `screen` session:
    
    ```bash
    screen -S diamond-node
    ```
    
3.  Run the node:
    
    ```bash
    ./start.sh
    ```
    
4.  Detach from the session:
    
    ```bash
    Ctrl+a, d
    ```
    
5.  To reattach to the session:
    
    ```bash
    screen -r diamond-node
    ```
    

### Using [pm2](https://pm2.io/docs/runtime/guide/installation/)

1.  Install `pm2` (for debian):
    
    ```bash
	apt update && apt install sudo curl && curl -sL https://raw.githubusercontent.com/Unitech/pm2/master/packager/setup.deb.sh | sudo -E bash -
    ```
    
2.  Start the node with `pm2`:
    
    ```bash
    pm2 start "./start.sh" --name diamond-node
    ```
    
3.  View logs:
    
    ```bash
    pm2 logs diamond-node
    ```
    
4.  Restart the node:
    
    ```bash
    pm2 restart diamond-node
    ```
    
5.  Stop the node:
    
    ```bash
    pm2 stop diamond-node
    ```
    
6.  List all running pm2 services:
    
    ```bash
    pm2 ls 
    ```
    
7.  Save the `pm2` configuration to start automatically on reboot:
    
    ```bash
    pm2 save
    pm2 startup
    ```
    Important: Then copy/paste the displayed command onto the terminal [details here](https://pm2.keymetrics.io/docs/usage/startup/).
    

----------
