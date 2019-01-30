#!/bin/sh
# Copyright (c) 2010-2019 Nur1Labs.Ltd
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

#this for autoinstall
sudo apt install -y build-essential libtool autotools-dev automake pkg-config libssl-dev bsdmainutils libboost-all-dev libminiupnpc-dev libzmq3-dev git wget libevent-pthreads-2.0-5
git clone https://github.com/libevent/libevent.git
cd libevent
./autogen.sh && ./configure && sudo make && sudo make install && cd ..

#db
wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
tar -xzvf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix/
../dist/configure --enable-cxx --disable-shared --with-pic
sudo make install && cd ../..

#tar
wget 'http://nur1labs.net/lf/shi_ubu.tar.gz'
tar -xzvf shi_ubu.tar.gz
cd shi_ubu && ./shiawased -daemon
