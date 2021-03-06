
# 30.05.2021: Stability fix

## update repository

Stop your Node (hint: `screen -r`) and pull the latest
files from this repository

```bash
# change to your node directory
cd dmdv4-testnet
# updates this repository
git pull
# download latest binaries.
./download-binaries.sh
```


# 27.05.2021: Stability fix and large network support

## update repository

Stop your Node (hint: `screen -r`) and pull the latest
files from this repository

```bash
# change to your node directory
cd dmdv4-testnet
# updates this repository
git pull
```

## increasing block gas limit

In order to support more validators in the networks we need to increase the blockgas limit,
so we can handle larger transactions.
This requires an additional entry in your `validator_node.toml` 

```bash
# use nano or the text editor of your choice to edit the validator_node.toml file.
nano validator_node.toml
```

add this line in the `mining` section:

```
gas_floor_target = "1000000000"
```

## update new binaries

The new logic for gas limits and the stability improvements.
```
./download-binaries.sh
```

## start you node again

```
./start.sh
```