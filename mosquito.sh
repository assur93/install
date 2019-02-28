#!/bin/sh
cd
mkdir mosquitto
cd mosquitto
wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
sudo apt-get update
sudo apt-get install mosquitto
sudo apt-get install mosquitto-clients
cd /etc/mosquitto
sudo mosquitto_passwd -c passwds insega
sudo systemctl enable mosquitto.service
sudo systemctl start mosquitto.service
