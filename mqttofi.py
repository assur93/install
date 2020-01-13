import paho.mqtt.client as mqtt
import mysql.connector
from datetime import datetime
from datetime import date
import time

mydb = mysql.connector.connect(
  host="localhost",
  user="admin",
  passwd="insega1993",
  database="ofi"
)

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))
    client.subscribe("#")

# The callback for when a PUBLISH message is received from the server.
def on_message(client, userdata, msg):
	
	mycursor = mydb.cursor()
	if (str(msg.topic) == "pn532/tag"):
	
		print(str(msg.payload))
		
		if (str(msg.payload) == "7A-13-66-13"):
			nombre = "Juan Jose"
			apellido1 = "Alfonsin"
			apellido2 = "Perez"
			permiso = 0
			
		if (str(msg.payload) == "69-09-86-99"):
			nombre = "Damian"
			apellido1 = "Fernandez"
			apellido2 = "Gonzalez"
			permiso = 1
		
		tiempo = datetime.now().strftime("%H:%M:%S")
		fecha = datetime.now().strftime("%d/%m/%Y")
		
		sql = "INSERT INTO customers (tdate, ttime, name, subname1, subname2, permiso) VALUES (%s, %s, %s, %s, %s, %s)"
		val = (fecha, tiempo, nombre, apellido1, apellido2, permiso)
		mycursor.execute(sql, val)

		mydb.commit()
		
		time.sleep(5)	

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.connect("192.168.31.25", 1883, 60)

client.loop_forever()
