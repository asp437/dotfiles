#!/bin/bash

pacman -Qe | cut -f 1 -d ' ' > raw_all_explicit.list
cat arch/packages.list | grep -F -x -v -f raw_all_explicit.list
