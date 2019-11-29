#!/usr/bin/python

import requests
import paho.mqtt.publish as publish
import base64
import json

# Sample image file is available at http://plates.openalpr.com/ea7the.jpg
IMAGE_PATH = '/tmp/your.jpg'
SECRET_KEY = 'sk_779f3b5259c0893e57ceccc5'

with open(IMAGE_PATH, 'rb') as image_file:
    img_base64 = base64.b64encode(image_file.read())

url = 'https://api.openalpr.com/v2/recognize_bytes?recognize_vehicle=1&country=eu&secret_key=%s' % (SECRET_KEY)
r = requests.post(url, data = img_base64)

z = json.dumps(r.json(), indent = 4 )

data = json.loads(z)

for client in data['results']:
        s =client['plate']
        # print(s)
        
publish.single('matricula', (s), hostname='192.168.31.10')