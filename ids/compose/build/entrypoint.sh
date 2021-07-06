#!/bin/bash

#Si existe el archivo /etc/routes lo ejecuta
[ -f /etc/routes ] && sh /etc/routes

#Arrancamos snort si existe el servicio
[ -f /etc/snort/snort.conf ] && snort -A console -i eth1 -u snort -g snort -c /etc/snort/snort.conf

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

