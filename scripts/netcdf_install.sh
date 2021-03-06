#!/bin/sh
#NetCDF

#setenv
cat >> ~/.bashrc << EOF
export CC=gcc
export CXX=g++
export FC=gfortran
export FCFLAGS=-m64
export F77=gfortran
export FFLAGS=-m64
EOF

#install
source ~/.bashrc
cd /fsx
wget http://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-4.1.3.tar.gz
tar xvf netcdf-4.1.3.tar.gz
cd netcdf-4.1.3
./configure --prefix=/fsx/netcdf --disable-netcdf-4 --disable-dap --disable-shared
make
make check 2>&1 | tee make.check.out
grep passed make.check.out
make install

#setenv
cat >> ~/.bashrc << EOF
export NETCDF=/fsx/netcdf
export PATH=$NETCDF/bin:$PATH
export WRFIO_NCD_LARGE_FILE_SUPPORT=1
EOF
