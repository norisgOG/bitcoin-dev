#!/bin/bash
set -Eeuo pipefail

echo Starting bitcoind...
bitcoind -datadir=/bitcoind-testnet  #-addnode=172.18.0.3  #-daemon
until bitcoin-cli -datadir=/bitcoind-regtest getblockchaininfo  > /dev/null 2>&1
do
	sleep 1
done
echo bitcoind started
# Executing CMD
echo "$@"
exec "$@"
