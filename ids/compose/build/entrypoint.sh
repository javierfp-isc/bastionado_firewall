#!/bin/bash

#Si existe el archivo /etc/routes lo ejecuta
[ -f /etc/routes ] && sh /etc/routes

#Arrancamos snort
[ -f /etc/snort/snort.conf ] && snort -A console -i eth1 -u snort -g snort -c /etc/snort/snort.conf

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

