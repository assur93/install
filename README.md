# Instalacion rapida 

## Configuracion teclado en Español

Para configurar el teclado en Español es necesario ejecutar los siguientes comandos:

Ejecuta el comando <i> sudo dpkg-reconfigure locales </i>. Aparecerá una lista de las codificaciones disponibles.
Busca español de España <b> (es_ES) </b>, preferiblemente con codificación <b> UTF-8 </b> y pulsa la barra espaciadora para seleccionarlo. Se recomienda no eliminar el inglés de Reino Unido, aunque es una opción personal. Pulsa intro para continuar.
Selecciona el idioma predeterminado de entre los que has marcado antes <b> (es_ES.UTF-8) </b> y pulsa intro. Se generarán los locales.

A continuación elegiremos la configuración del teclado.

Ejecuta <i> sudo dpkg-reconfigure keyboard-configuration </i>. Seleccionar <b> Generic 104-key PC </b>, pulsar intro para seleccionarlo. Una vez aparezca la siguiente ventana seleccionar <b> Other </b> y en la lista que se despliega seleccionar <b> Spanish </b>. Tras esto, seleccionar <b> The default for the keyboard layout </b> y por ultimo <b> No compose key </b>.

Ahora vamos a elegir la zona horaria:

Ejecuta <i> sudo dpkg-reconfigure tzdata </i>.
Selecciona <b> Europa </b> y después <b> Madrid </b> o la zona horaria en la que te encuentres.

Por ultimo solo queda reiniciar y ya estaria.
 

## Instalacion Home Assistant

Lo primero va a ser encender la pi, sacar la ip, conectar con el putty y luego descargar el archivo <b> setup.sh </b> con <i> wget </i> . Despues de eso se convierte en ejecutable con el
comando <i> chmod 755 setup.sh </i> y tras esto ejecutarlo de forma <i> sh setup.sh </i>. Cuando acabe la instalacion es necesario teclear de forma manual los siguientes comandos:

cd /srv/homeassistant <br/> python3 -m venv . <br/> source bin/activate <br/> python3 -m pip install wheel <br/> pip3 install homeassistant <br/> hass <br/> <br/> Tras acabar la instalacion poner en el navegados <b> IPRaspberry:8123 </b> e iniciar sesion en Home Assistant. Suele tardar en cargar en torno a 5 - 10 min. Una vez iniciada sesion, teclear <b> Ctrl + c </b> y despues: <br/> <br/> exit <br/> cd <br/> <br/> De esta forma salimos del entorno. Una vez salimos hacemos ejecutable el archivo <b> setup2.sh </b> y ejecutarlo. En medio de la instalacion saltara un cuadro de escritura, copiar y pegar lo siguiente:

[Unit] <br/> Description=Home Assistant <br/> After=network-online.target <br/> <br/> [Service] <br/> Type=simple <br/> User=%i <br/> ExecStart=/srv/homeassistant/bin/hass -c "/home/homeassistant/.homeassistant" <br/> <br/> [Install] <br/> WantedBy=multi-user.target
 
Una vez modificado, como siempre lo guardamos con <b> Ctrl + o </b> y salimos con <b> Ctrl + x </b> . De esta forma ya tenemos <b> Home Assistant </b> funcionando y de forma que se inicie al arrancar la Raspberry.

## Instalacion Mosquitto

Para la instalacion de <b> Mosquitto </b> tan solo es necesario descargar con <i> wget </i> el archivo <b> mosquito.sh </b> , convertirlo a ejecutable con <i> chmod 755 </i> y ejecutarlo. Casi al final de la instalacion nos pedira la contraseña para nuestro server mosquitto, tras introducirla la instalacion finalizara y ya estara instalado <b> Mosquitto </b> . ( El usuario por defecto es <i> insega </i> ).

Tras introducir la contraseña se abrira un cuadro de texto en el que hay que hacer el siguiente cambio: <br/> <br/> After=network-online.target &nbsp;&nbsp; <b> ==> </b> &nbsp;&nbsp; After=network-online.target mosquitto.service

Una vez modificado, como siempre lo guardamos con <b> Ctrl + o </b> y salimos con <b> Ctrl + c </b>.

Por ultimo, para activar el <b> Mosquitto </b> en <b> Homeassistant </b> es necesario entrar en el archivo de configuracion:

sudo –u homeassistant –H –s <br/> cd /home/homeassistant/.homeassistant <br/> nano configuration.yaml <br/> <br/>
Se abrira un archivo en el cual se debe escribir en cualquier linea: <br/> <br/> mqtt: <br/> &nbsp;&nbsp; broker: IPRaspberry <br/> &nbsp;&nbsp; port: 1883 <br/> &nbsp;&nbsp; username: insega <br/> &nbsp;&nbsp; password: <i> YourPassword </i> <br/> <br/> <b> Es importante respetar los espacios tal y como se muestra. </b> 


## Instalacion Zigbee2MQTT

Para la instalacion de <b> Zigbee2MQTT </b> tan solo es necesario descargar con <i> wget </i> el archivo <b> zigbee.sh </b> , convertirlo a ejecutable con <i> chmod 755 </i> y ejecutarlo. El proceso de instalacion comenzara hasta que a la mitad de la instalacion saltara un cuadro con el archivo de configuracion del <b> Zigbee2MQTT </b> . Este debe modificarse para que quede de la siguiente forma:

#&nbsp;Home Assistant integration (MQTT discovery) <br/> homeassistant: true <br/> #&nbsp;allow new devices to join <br/> permit_join: true <br/> #&nbsp;MQTT settings <br/> mqtt: <br/> &nbsp;&nbsp; #&nbsp;MQTT base topic for zigbee2mqtt MQTT messages <br/> &nbsp;&nbsp; base_topic: zigbee2mqtt <br/> &nbsp;&nbsp; #&nbsp;MQTT server URL <br/> &nbsp;&nbsp; server: 'mqtt://localhost' <br/> &nbsp;&nbsp; #&nbsp;MQTT server authentication, uncomment if required: <br/> &nbsp;&nbsp; user: insega <br/> &nbsp;&nbsp; password:&nbsp;<i> YourPassword </i> <br/> #&nbsp;Serial settings <br/> serial: <br/> &nbsp;&nbsp; #&nbsp;Location of CC2531 USB sniffer <br/> &nbsp;&nbsp; port: /dev/ttyACM0

Una vez modificado, como siempre lo guardamos con <b> Ctrl + o </b> y salimos con <b> Ctrl + c </b> . Automaticamente saltara otro cuadro de texto en el que es necesario copiar el siguente texto:

[Unit] <br/> Description=zigbee2mqtt <br/> After=network.target <br/> <br/> [Service] <br/> ExecStart=/usr/bin/npm start <br/> WorkingDirectory=/opt/zigbee2mqtt <br/> StandardOutput=inherit <br/> StandardError=inherit <br/> Restart=always <br/> User=pi <br/> <br/> [Install] <br/> WantedBy=multi-user.target

Una vez modificado, como siempre lo guardamos con <b> Ctrl + o </b> y salimos con <b> Ctrl + c </b> . Con esto acabara la instalacion de <b> Zigbee2MQTT </b> . Por ultimo para saber si la instalacion ha salido bien se puede usar el comando <i> sudo systemctl status zigbee2mqtt </i> , y si queremos ver la salida en tiempo real del <b> Mosquitto </b> junto con la del <b> Zigbee2MQTT </b> para agregar los dispositivos, usamos el comando <i> mosquitto_sub -v -h IPRaspberry -p 1883 -t '#' </i> .


## Instalacion MotionEye


Para la instalacion de <b> MotionEye </b> tan solo es necesario descargar con <i> wget </i> el archivo <b> eye.sh </b> , convertirlo a ejecutable con <i> chmod 755 </i> y ejecutarlo.

Una vez acabe la instalacion se puede acceder a <i> MotionEye </i> poniendo la IP <b> IPRaspberry:8765 </b>. Aparecera la pantalla inicial y para iniciar sesion ponemos en <i> Username: admin </i> y en <i> Password: </i> no ponemos nada.

Para añadir la camara directa de la Raspberry, seleccionamos la opcion <i> add camera... </i> y en <i> Camera Type: Local MMAL Camera </i>. Activamos las opciones avanzadas y modificamos los parametros necesarios. 

<b> Nota:</b> Para usar las notificaciones por <b> MQTT </b> es necesario tener instalado <b> mosquito.sh </b> y una vez instalado utilizamos la opcion <i> Run A Command </i> en la que debe escribirse el codigo: <i>  mosquitto_pub -h 192.168.31.xxx -u username -P password -t camaras/camara/movimiento -m "ON" </i>. 

## Instalacion OpenALPR en local

Instalar los prerrequisitos

<i> sudo apt-get install libopencv-dev libtesseract-dev git cmake build-essential libleptonica-dev <br/>
sudo apt-get install liblog4cplus-dev libcurl3-dev </i>

Si se utiliza daemon instalar beanstalkd

<i> sudo apt-get install beanstalkd </i>

Clonar el ultimo codigo de Git

<i> git clone https://github.com/openalpr/openalpr.git </i>

Establecer el directorio de compilacion

<i> cd openalpr/src <br/>
mkdir build <br/>
cd build </i>

Establecer el entorno de compilacion

<i> cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc .. <br/>
cmake -DWITH_TEST=FALSE -DWITH_BINDING_JAVA=FALSE --DWITH_BINDING_PYTHON=FALSE \
  --DWITH_BINDING_GO=FALSE -DWITH_DAEMON=FALSE -DCMAKE_INSTALL_PREFIX:PATH=/usr .. </i>

Compilar la libreria

<i> make </i>

Instalar los binarios en el sistema

<i> sudo make install </i>

Probar la libreria

<i> wget http://plates.openalpr.com/h786poj.jpg -O lp.jpg <br/>
alpr lp.jpg </i>
