#!/bin/bash

echo "=== Cryptoluck Update ==="

echo "=== IMPORTANT NOTICE ==="
echo "Before proceeding, make sure to STOP the old Cryptoluck daemon if it is currently running."
echo "You can use the following command to stop the daemon:"
echo "    cld stop"
echo "========================="

echo "Setting up directory structure..."
mkdir -p $HOME/src
cd $HOME/src

echo "Downloading CL source..."
git clone https://github.com/DCZLLC/CLv2.git CLv2.0.0
cd CLv2.0.0

echo "Downloading and building Berkeley DB 4.8..."
contrib/install_db4.sh $HOME/src

echo "Setting Berkeley DB environment variables..."
export BDB_PREFIX="$HOME/src/db4"

echo "Configuring CL build..."
./autogen.sh
./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" --prefix=/usr/local

echo "Building CL..."
make 

echo "Starting Cryptoluck daemon..."
cd src
./cld &

echo "CryptoLuck v2.0.0 is running."

