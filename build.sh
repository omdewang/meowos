#!/bin/bash

cd drivers

make all

cd ..

cd kernel

make kernel
make kernel_join

cd ..

make build_boot
make build_img

make start