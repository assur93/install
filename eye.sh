#!/bin/sh
cd 
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ffmpeg
sudo apt-get install libmariadb3
sudo apt-get install libpq5
sudo apt-get install libmicrohttpd12
wget https://github.com/Motion-Project/motion/releases/download/release-4.2.2/pi_buster_motion_4.2.2-1_armhf.deb
sudo dpkg -i pi_buster_motion_4.2.2-1_armhf.deb
sudo apt-get install python-pip
sudo apt-get install python-dev libssl-dev
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install libjpeg-dev
sudo apt-get install libz-dev
sudo pip install motioneye #lo hace
sudo mkdir -p /etc/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
sudo mkdir -p /var/lib/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service
sudo systemctl daemon-reload
sudo systemctl enable motioneye
sudo systemctl start motioneye
cd
vcngencmd get_camera
