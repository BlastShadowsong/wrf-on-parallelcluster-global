#!/bin/sh
#MPICH

#install
source ~/.bashrc
cd /fsx
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz
tar xzvf mpich-3.0.4.tar.gz
cd mpich-3.0.4
./configure --prefix=/fsx/mpich
make
make install

#setenv
echo "export PATH=/fsx/mpich/bin:$PATH" >> ~/.bashrc
