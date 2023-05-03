#!/bin/bash

apt update

apt install --yes git
apt install --yes cmake 
apt install --yes make
apt install --yes gcc
apt install --yes libtool
apt install --yes clang-format
apt install --yes cmake-curses-gui
apt install --yes lcov
apt install --yes doxygen

cd /home

git clone https://github.com/uber/h3.git
cd h3
git checkout v$(<VERSION)

mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build .

rm -rf /home/output
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
