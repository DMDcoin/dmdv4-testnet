#!/bin/sh

wget -O openethereum https://github.com/DMDcoin/openethereum-3.x/releases/download/v3.2.5-hbbft-alpha-2/openethereum_compatibility
mv openethereum_compatibility openethereum
wget -O dmd https://github.com/DMDcoin/openethereum-3.x/releases/download/v3.2.5-hbbft-alpha-2/dmd

chmod +x openethereum 
chmod +x dmd

