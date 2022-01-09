#!/bin/bash

#Si existe el archivo /etc/routes lo ejecuta
[ -f /etc/routes ] && sh /etc/routes

#Establece el servidor DNS al pfsense
echo "nameserver 192.168.22.100" > /etc/resolv.conf

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

