#!/usr/bin/env bash

# gcc -Wall -std=c99 -I/usr/include/libusb-1.0 -I.. -o usbhidtool ../main.c hid.c -lusb-1.0 -lrt -lpthread
# cp usbhidtool ../../bin/linux/usbhidtool
# rm -f usbhidtool

cmake . -DCMAKE_TOOLCHAIN_FILE=Toolchain-rpi.cmake && make && cp usbhidtool ../../bin/arm/usbhidtool
rm -f usbhidtool
rm -rf CMakeFiles
rm -f CMakeCache.txt
rm -f cmake_install.cmake
rm -f Makefile

