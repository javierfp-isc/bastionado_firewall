#!/bin/bash

#Borramos la configuración previa de la red de docker
ip addr flush eth0 && ip addr flush eth1

#Recargamos la configuración de red utilizando el paquete ifupdown
service networking restart

#Si existe el archivo /etc/routes lo ejecuta
[ -f /etc/routes ] && sh /etc/routes

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

