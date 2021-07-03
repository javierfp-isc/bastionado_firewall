#!/bin/bash

#Si existe el archivo /etc/routes lo ejecuta
[ -f /etc/routes ] && sh /etc/routes

#Arrancamos squid
[ -f /etc/squid/squid.conf ] && /usr/sbin/squid -sYC

#Arrancamos nginx
[ -f /etc/nginx/nginx.conf ] && /usr/sbin/nginx -g 'daemon on; master_process on;'

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

