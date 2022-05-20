#!/bin/sh

while [ 1 ]; do
 echo "starting openethereum..."
 ./openethereum -c=validator_node.toml
 echo "restarting openethereum after 60s sleep..."
 sleep 60s
done
