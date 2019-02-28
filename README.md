# Instalacion rapida 

## Instalacion Home Assistant

Lo primero va a ser encender la pi, sacar la ip, conectar con el putty y luego descargar el archivo con <i> wget </i> . Despues de eso se convierte en ejecutable con el
comando <i> chmod 755 setup.sh </i> y tras esto ejecutarlo de forma sh setup.sh. Cuando acabe la instalacion es necesario teclear de forma manual los siguientes comandos:

cd /srv/homeassistant <br/> python3 -m venv . <br/> source bin/activate <br/> pip3 install homeassistant <br/> Hass <br/> <br/> Tras acabar la instalacion poner en el navegados <b> IPRaspberry:8123 </b> e iniciar sesion en Home Assistant. Suele tardar en cargar en torno a 5 - 10 min. Una vez iniciada sesion, teclear ctrl + C y despues: <br/> <br/> exit <br/> cd <br/> <br/> De esta forma salimos del entorno. Una vez salimos hacemos ejecutable el archivo <b> setup2.sh </b> y ejecutarlo. En medio de la instalacion saltara un cuadro de escritura, copiar y pegar lo siguiente:

[Unit] <br/> Description=Home Assistant <br/> After=network-online.target <br/> <br/> [Service] <br/> Type=simple <br/> User=%i <br/> ExecStart=/srv/homeassistant/bin/hass -c "/home/homeassistant/.homeassistant" <br/> <br/> [Install] <br/> WantedBy=multi-user.target
 
De esta forma ya tenemos <b> Home Assistant </b> funcionando y de forma que se inicie al arrancar la Raspberry.

## Instalacion Mosquitto

Para la instalacion de <b> Mosquitto </b> tan solo es necesario descargar con <i> wget </i> el archivo <b> mosquito.sh </b> , convertirlo a ejecutable con <i> chmod 755 </i> y ejecutarlo. Casi al final de la instalacion nos pedira la contraseña para nuestro server mosquitto, tras introducirla la instalacion finalizara y ya estara instalado <b> Mosquitto </b> . ( El usuario por defecto es <i> insega </i> )

Por ultimo, para activar el Mosquitto en Home Ass es necesario entrar en el archivo de configuracion:

sudo –u homeassistant –H –s <br/> cd /home/homeassistant/.homeassistant <br/> nano configurations.yaml <br/> <br/>
abrira un archivo en el cual se debe escribir: <br/> <br/> mqtt: <br/> &nbsp;&nbsp; broker: IPRaspberry <br/> &nbsp;&nbsp; port: 1883 <br/> &nbsp;&nbsp; username: insega <br/> &nbsp;&nbsp; password: insega


## Instalacion Zigbee2MQTT

