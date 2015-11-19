#!/bin/bash

cd $HOME

LOCAL_DIR=$HOME/local
NODE_DIR=$HOME/node-latest-install

echo 'export PATH=$HOME/local/bin:$PATH' >> $HOME/.bashrc
. $HOME/.bashrc

mkdir $LOCAL_DIR
mkdir $NODE_DIR

# download a version of Node
cd $NODE_DIR
read -p "Which version of NodeJS? " V
if [ -z "$V" ]; then
  V="latest"
else
  V="v$V"
fi

ZIPPED_NODE_SRC=https://nodejs.org/dist/$V/node-$V.tar.gz
curl $ZIPPED_NODE_SRC | tar xz --strip-components=1

# point whatever your python version is, to python2
PYTHON2=/usr/bin/python2
if ! [ "$(readlink $LOCAL_DIR/bin/python)" = $PYTHON2 ]; then
  cd $LOCAL_DIR/bin
  ln -s $PYTHON2 ./python
fi

# build & install
cd $NODE_DIR
./configure --prefix=$LOCAL_DIR
make install # this will probably take more than 30 seconds...

curl -L https://npmjs.com/install.sh | sh

# clean up the symlink for python2
if [ "$(readlink $LOCAL_DIR/bin/python)" = $PYTHON2 ]; then
  cd $LOCAL_DIR/bin
  rm ./python
fi
