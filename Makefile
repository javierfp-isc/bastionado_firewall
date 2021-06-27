PROJECT="firewall"
NET="firewall_sat"

#Targets principales
#install: vagrantup
install: composeup

#uninstall: vagrantdown
uninstall: composedown

#start: vagrantstart
start: composestart

#stop: vagrantstop
stop: composestop

#Requisitos
vagrantup: composeup vagrantsust	
	cd /tmp && vagrant up

composeup:	
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d

vagrantdown: composedown vagrantsust
	cd /tmp && vagrant destroy -f

composedown:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down --rmi all

vagrantstart: composestart vagrantsust
	cd /tmp && vagrant up

composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start	

vagrantstop: composestop vagrantsust
	cd /tmp && vagrant halt

composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop

vagrantsust:
	#Sustituir variables en Vagrantfile
	sed "s/${NET}/br-$(shell docker network ls | grep ${NET} | cut -d' ' -f1)/" vagrant/Vagrantfile > /tmp/Vagrantfile


