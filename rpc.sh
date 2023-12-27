#!/bin/sh

while [ 1 ]; do
 echo "starting openethereum..."
 ./diamond-node -c=rpcnode.toml
 echo "restarting openethereum after 60s sleep..."
 sleep 60s
done
