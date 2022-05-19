#!/bin/sh

while [ 1 ]; do
 ./openethereum -c=validator_node.toml
 echo "restarting openethereum after 10s sleep..."
 sleep 60s
done