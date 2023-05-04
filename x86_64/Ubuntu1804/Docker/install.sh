#!/bin/bash

apt-get update

DEBIAN_FRONTEND=noninteractive apt-get install --yes tzdata

apt-get install --yes wget
apt-get install --yes build-essential 
apt-get install --yes libssl-dev
apt-get install --yes curl
apt-get install --yes nano
apt-get install --yes git
apt-get install --yes libtool
apt-get install --yes clang-format
apt-get install --yes cmake-curses-gui
apt-get install --yes lcov
apt-get install --yes doxygen

cd /tmp
wget https://github.com/Kitware/CMake/releases/download/v3.20.0/cmake-3.20.0.tar.gz
tar -zxvf cmake-3.20.0.tar.gz
cd cmake-3.20.0
./bootstrap
make
make install

cd /home

git clone https://github.com/uber/h3.git
cd h3
git checkout v$(<VERSION)

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .

rm -rf /home/output/*
cp /home/h3/build/bin/cellToBoundary /home/output
cp /home/h3/build/bin/cellToBoundaryHier /home/output
cp /home/h3/build/bin/cellToLatLng /home/output
cp /home/h3/build/bin/cellToLatLngHier /home/output
cp /home/h3/build/bin/cellToLocalIj /home/output
cp /home/h3/build/bin/generateBaseCellNeighbors /home/output
cp /home/h3/build/bin/generateFaceCenterPoint /home/output
cp /home/h3/build/bin/generatePentagonDirectionFaces /home/output
cp /home/h3/build/bin/gridDisk /home/output
cp /home/h3/build/bin/gridDiskUnsafe /home/output
cp /home/h3/build/bin/h3 /home/output
cp /home/h3/build/bin/h3ToComponents /home/output
cp /home/h3/build/bin/h3ToHier /home/output
cp /home/h3/build/bin/latLngToCell /home/output
cp /home/h3/build/bin/localIjToCell /home/output
cp /home/h3/build/bin/mkRandGeo /home/output
cp /home/h3/build/bin/mkRandGeoBoundary /home/output
