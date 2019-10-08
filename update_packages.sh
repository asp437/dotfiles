#!/bin/bash

pacman -Qm | cut -f 1 -d ' ' > arch/aur.list
pacman -Qe | cut -f 1 -d ' ' > raw_all_explicit.list
pacman -Q  | cut -f 1 -d ' ' > raw_all_packages.list

cat raw_all_packages.list | grep -F -x -v -f arch/aur.list | grep -F -x -v -f platform/current_platform/specific.list > arch/all_packages.list
cat raw_all_explicit.list | grep -F -x -v -f arch/aur.list | grep -F -x -v -f platform/current_platform/specific.list > arch/packages.list

rm -f raw_all_packages.list
rm -f raw_all_explicit.list
