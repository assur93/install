## Documentación instalación Shelly

1.	Instalar la app de Shelly
2.	Entrar en la app y darle a añadir dispositivo
1.	Pedira la wifi y la contraseña
3.	Agregar el dispositivo encontrado y nombrarlo
4.	Conectarlo a la Cloud
5.	Actualizar el firmware en “firmware update”
6.	Mirar la IP en “settings – Device information”
7.	Activar el modo restore last state y que el modo del switch sea tipo edge
8.	Poner la IP en el navegador del móvil u ordena, abrirá la pagina del shelly
9.	Habilitar el servicio MQTT en: “ Interface and security – Advanced – Developers settings”
1.	Rellenar con el usuario y contraseña del server MQTT ( user: insega, pass: insega o la que te pasé) asi como la IP de la raspi. Guardar 
10.	Ir al configuration.yaml
11.	Escribir el siguiente code:

Shelly 2.5 :
```bash
-   platform: mqtt
     name: "nombre"
     state_topic: "shellies/shellyswitch25-BA8CE8/relay/0"
     command_topic: "shellies/shellyswitch25-BA8CE8/relay/0/command"
     qos: 1
     payload_on: "on"
     payload_off: "off"
     retain: true
     
Shelly 1:
  - platform: mqtt
    name: "nombre"
    state_topic: "shellies/shelly1-BA6AC1/relay/0"
    command_topic: "shellies/shelly1-BA6AC1/relay/0/command"
    qos: 1
    payload_on: "on"
    payload_off: "off"
    retain: false
    ``` 
    
shellyswitch25-xxxxx => Esto se ve en la página donde configuras el mosquito, es el Will Topic, depende de cada shelly.
“nombre” => Este es el nombre que le das al shelly y que luego usas para llamarlo, puedes poner cualquiera, pero no puede llevar mayúsculas ni caracteres raros, solo letras y guiones bajos.
Aquí se muestra una captura de cómo quedaría la habilitación del MQTT.
