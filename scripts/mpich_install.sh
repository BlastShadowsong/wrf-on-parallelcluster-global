#!/bin/sh
#MPICH

#install
source ~/.bashrc
cd /fsx
wget http://www.mpich.org/static/downloads/3.3.1/mpich-3.3.1.tar.gz
tar xzvf mpich-3.3.1.tar.gz
cd mpich-3.3.1
./configure --prefix=/fsx/mpich
make
make install

#setenv
echo "export PATH=/fsx/mpich/bin:$PATH" >> ~/.bashrc
