#!/bin/bash

#Si existe el archivo /etc/routes lo ejecuta
[ -f /etc/routes ] && sh /etc/routes

#Establece los servidores DNS a 8.8.8.8 y 8.8.4.4
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

#Cargamos iptables almacenadas (deshabilitado)
#[ -f /etc/iptables/rules.v4 ] && iptables-restore < /etc/iptables/rules.v4

#Arrancamos snort si existe el servicio
if [ -f /etc/snort/snort.conf ]
then
        #snort -A console -i eth1 -u snort -g snort -c /etc/snort/snort.conf
        snort -D -i eth1 -I -u snort -g snort -K ascii -c /etc/snort/snort.conf &
	snort -D -i eth0  -I -u snort -g snort -K ascii -c /etc/snort/snort.conf &
fi


#Arrancamos suricata si existe el servicio
if [ -f /etc/suricata/suricata.yaml ]
then
	rm /var/run/suricata.pid
	/usr/bin/suricata -c /etc/suricata/suricata.yaml --pidfile /var/run/suricata.pid --pcap -D
	#/usr/bin/suricata -c /etc/suricata/suricata.yaml --pidfile /var/run/suricata.pid --af-packet -D
	#Para el modo de captura nfqueue es necesario meter reglas iptables
	#/usr/bin/suricata -c /etc/suricata/suricata.yaml --pidfile /var/run/suricata.pid -q 0 -D
fi

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"

