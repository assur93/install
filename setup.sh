#!/bin/sh
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install nano
sudo apt-get install python3 python3-venv python3-pip
sudo apt-get install build-essential libssl-dev libffi-dev python-dev
sudo useradd -rm homeassistant
cd /srv
sudo mkdir homeassistant
sudo chown homeassistant:homeassistant homeassistant
sudo su -s /bin/bash homeassistant
cd /srv/homeassistant
python3 -m venv .
source bin/activate
pip3 install homeassistant
# Hass
# cd
# sudo nano -w /etc/systemd/system/homeassistant.service
# sudo systemctl daemon-reload
# sudo systemctl enable homeassistant
# sudo systemctl start homeassistant
