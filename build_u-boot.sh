#!/bin/sh
#export PATH=$PATH:/opt/arm-2009q1/bin
export PATH=$PATH:/opt/arm-armv4t-linux-gnueabi/bin
cd /media/dmh/e29a0880-5c9e-45b8-9341-50d94b43abcd/work/u-boot-2010.03-tekkaman
make clean
make distclean
#make ARCH=arm smdk2440_config
make ARCH=arm mini2440_config
#make menuconfig
#make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- -j2 
make ARCH=arm CROSS_COMPILE=arm-linux- -j2



