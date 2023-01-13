#!/bin/bash

# This script runs routine disk cleaning measures for an Arch Linux installation


# Clean logs (automatically done on reboot but handy if long uptime)
sudo logrotate /etc/logrotate.conf

# Clear Pacman cache ...
sudo pacman -Sc --noconfirm
