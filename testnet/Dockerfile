FROM ubuntu:20.04 AS bitcoind-base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -yqq \
	curl gosu jq bash-completion


RUN apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 -y
RUN apt-get install libdb-dev libdb++-dev -y
RUN apt-get install libevent-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libboost-thread-dev -y
RUN apt install libsqlite3-dev libminiupnpc-dev libzmq3-dev -y


WORKDIR /src/bitcoin
COPY ./bitcoin .
RUN ./autogen.sh
RUN ./configure --with-incompatible-bdb
RUN make -j8
RUN make install

# copy bitcoin.conf
RUN mkdir -p /bitcoind-testnet
WORKDIR /bitcoind-testnet
ADD bitcoin.conf  /bitcoind-testnet
RUN ln -s /bitcoind-testnet  /root/.
ADD bashrc /root/.bashrc

ADD bitcoind-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/bitcoind-entrypoint.sh
ADD mine.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mine.sh
# bitcoind testnet  RPC
EXPOSE 18333/tcp
EXPOSE 18332/tcp

#Keep Container running for Regtest Modes

ENTRYPOINT ["/usr/local/bin/bitcoind-entrypoint.sh"]

# Mine new block every 10 seconds
#CMD ["/usr/local/bin/mine.sh"]
