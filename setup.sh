#!/bin/sh
cd 
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install nano
sudo apt-get install npm
sudo apt-get install python3
sudo apt-get install python3-venv
sudo apt-get install python3-pip
sudo apt-get install build-essential libssl-dev libffi-dev python-dev
sudo useradd -rm homeassistant
cd /srv
sudo mkdir homeassistant
sudo chown homeassistant:homeassistant homeassistant
sudo su -s /bin/bash homeassistant
