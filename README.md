# Instalacion rapida 

Lo primero va a ser encender la pi, sacar la ip, conectar con el putty y luego descargar el archivo con <i> wget </i> . Despues de eso se convierte en ejecutable con el
comando chmod 755 setup.sh y tras esto ejecutarlo de forma sh setup.sh. Cuando acabe la instalacion es necesario teclear de forma manual los siguientes comandos:

cd /srv/homeassistant <br/> python3 -m venv . <br/> source bin/activate <br/> pip3 install homeassistant <br/> Hass <br/> <br/> Tras acabar la instalacion poner en el navegados <b> IPRaspberry:8123 </b> e iniciar sesion en Home Assistant. Suele tardar en cargar en torno a 5 - 10 min. Una vez iniciada sesion, teclear ctrl + C y despues: <br/> <br/> exit <br/> cd <br/> <br/> De esta forma salimos del entorno. Una vez salimos hacemos ejecutable el archivo setup2.sh y ejecutarlo. En medio de la instalacion saltara un cuadro de escritura, copiar y pegar lo siguiente:

[Unit] <br/> Description=Home Assistant <br/> After=network-online.target <br/> <br/> [Service] <br/> Type=simple <br/> User=%i <br/> ExecStart=/srv/homeassistant/bin/hass -c "/home/homeassistant/.homeassistant" <br/> <br/> [Install] <br/> WantedBy=multi-user.target
 
De esta forma ya tenemos <b> Home Assistant funcionando </b> y de forma que se inicie al arrancar la Raspberry.
