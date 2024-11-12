#!/bin/bash

#Si existe el archivo /etc/routes lo ejecuta
#[ -f /etc/routes ] && sh /etc/routes

#Establece los servidores DNS a 8.8.8.8 y 8.8.4.4
#echo "nameserver 8.8.8.8" > /etc/resolv.conf

#Cargamos iptables almacenadas
#[ -f /etc/iptables/rules.v4 ] && iptables-restore < /etc/iptables/rules.v4

[ -f /etc/ssh/sshd_config ] && service ssh start

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 100;done"

