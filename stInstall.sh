#!/bin/bash


if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


apt-get update
apt-get install -y stlink-tools openocd libncurses5
