#!/bin/sh
echo "update"
sudo apt-get update -y > /dev/null 2>&1
echo "upgrade"
sudo apt-get upgrade -y  > /dev/null 2>&1
echo "redis server installation"
sudo apt-get -y install -y redis-server > /dev/null 2>&1
echo "Server status"
sudo service redis-server status
echo "Server start"
sudo service redis-server restart
