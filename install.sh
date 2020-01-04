#!/bin/bash

## uncomment for debugging
#set -x

## simple check for root permissions
if [ "$EUID" -ne 0 ]
  then echo -e "\e[41mRun script as root\e[0m"
  exit 1;
fi

## configs
version="0.18.1"
arch="amd64"
install_dir="${BIN_DIR:-/usr/local/bin}"
download_dir=$(dirname $(realpath $0))

## setting up temp downlad and installation directory /tmp/node_exporter
echo -e "\e[5mDownloading and installing..."

cd /tmp 
mkdir -p /tmp/node_exporter

wget https://github.com/prometheus/node_exporter/releases/download/v$version/node_exporter-$version.linux-$arch.tar.gz -O node_exporter.tar.gz 

echo -e "\e[5mExtracting... \e[25m"
tar xfz /tmp/node_exporter.tar.gz -C /tmp/node_exporter ||  {  echo -e "\e[41mExtracting node_exporter.tar.gz failed! Exiting.\e[0m"; exit 1; }

cp "/tmp/node_exporter/node_exporter-$version.linux-$arch/node_exporter" "$install_dir"

chown root:root "$install_dir/node_exporter"

cp $download_dir/node_exporter.service /etc/systemd/system/node_exporter.service


systemctl enable node_exporter.service
systemctl start node_exporter.service

echo -e " \e[25mInstallation \e[32msuccessful\e[0m"
