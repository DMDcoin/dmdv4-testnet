#!/bin/sh

# restores from backup and starts the chain based on the state from the backup

rm -r ./data/cache
rm -r ./data/chains

cp -r data-backup/* data

./start.sh