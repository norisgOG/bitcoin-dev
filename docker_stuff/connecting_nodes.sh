#!/bin/bash


$(docker exec node_1 bash -c "bitcoin-cli -datadir=/bitcoind-regtest addnode 10.7.0.2 onetry")
$(docker exec node_2 bash -c "bitcoin-cli -datadir=/bitcoind-regtest addnode 10.7.0.2 onetry")
echo $(docker exec node_1 bash -c "bitcoin-cli -datadir=/bitcoind-regtest getpeerinfo")
echo $(docker exec node_2 bash -c "bitcoin-cli -datadir=/bitcoind-regtest getpeerinfo")

