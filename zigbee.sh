cd
ls /dev/ttyACM0
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs git make g++ gcc
node --version
npm --version
sudo git clone https://github.com/Koenkk/zigbee2mqtt.git /opt/zigbee2mqtt
sudo chown -R pi:pi /opt/zigbee2mqtt
cd /opt/zigbee2mqtt
npm install
nano /opt/zigbee2mqtt/data/configuration.yaml
sudo nano /etc/systemd/system/zigbee2mqtt.service
sudo systemctl enable zigbee2mqtt
sudo systemctl start zigbee2mqtt
