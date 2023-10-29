#!/bin/sh

while [ 1 ]; do
 echo "starting openethereum..."
 ./diamond-node -c=validator_node.toml --shutdown-on-missing-block-import=1800
 echo "restarting openethereum after 60s sleep..."
 sleep 60s
done
