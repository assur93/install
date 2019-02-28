
sudo nano -w /etc/systemd/system/homeassistant.service
sudo systemctl --system daemon-reload
sudo systemctl enable homeassistant
sudo systemctl start homeassistant
