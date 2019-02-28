# Instalacion rapida 

Lo primero va a ser encender la pi, sacar la ip, conectar con el putty y luego descargar el archivo con wget. Despues de eso se convierte en ejecutable con el
comando chmod 755 setup.sh y tras esto ejecutarlo de forma sh setup.sh. En medio de la instalacion saltara un cuadro de escritura, copiar y pegar lo siguiente:

[Unit] <br/> Description=Home Assistant <br/> After=network-online.target <br/> <br/> [Service] <br/> Type=simple <br/> User=%i <br/> ExecStart=/srv/homeassistant/bin/hass -c "/home/homeassistant/.homeassistant" <br/> <br/> [Install] <br/> WantedBy=multi-user.target
 
Tras acabar la instalacion poner en el navegados IPPI:8123 e iniciar sesion en Home Assistant
