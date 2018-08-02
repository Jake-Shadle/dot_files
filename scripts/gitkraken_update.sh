#!/bin/sh

tar_name=gitkraken-amd64.tar.gz

cd /opt

echo "Downloading update..."
sudo curl -s -O -L https://release.gitkraken.com/linux/$tar_name

echo "Killing running instances..."
killall -s 9 gitkraken

echo "Extracting..."
sudo tar -xvzf $tar_name 

echo "Removing archive..."
sudo rm -f $tar_name

cd -
