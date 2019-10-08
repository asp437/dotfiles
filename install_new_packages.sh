#!/bin/bash

./list_packages_to_install.sh > packages_to_install.list
sudo pacman -S - < packages_to_install.list
rm -f packages_to_install.list
