#!/bin/bash
set -Eeuo pipefail


echo "================================================"
#Create a Bitcointwallet

bitcoin-cli -datadir=/bitcoind-regtest createwallet test
main_address=$(bitcoin-cli -datadir=/bitcoind-regtest -rpcwallet=test getnewaddress)

echo "Mining 101 blocks to unlock some bitcoin"
bitcoin-cli -datadir=/bitcoind-regtest generatetoaddress 101 $main_address

echo "================================================"  

echo "Mining 1 block every 100 seconds"
while sleep 100; do \
	bitcoin-cli -datadir=/bitcoind-regtest  generatetoaddress 1 $main_address;\
	echo "Balance:" `bitcoin-cli -datadir=/bitcoind-regtest  getbalance`; \
done

# If loop is interrupted, stop bitcoind
bitcoin-cli -datadir=/bitcoind stop
