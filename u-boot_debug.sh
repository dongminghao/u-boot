#!/bin/sh
# need type "cd u-boot" and "load u-boot" then taype "n"
export PATH=$PATH:/opt/arm-armv4t-linux-gnueabi/bin
cgdb -d arm-linux-gdb -x ./gdbinit u-boot-2010.03-tekkaman/u-boot
