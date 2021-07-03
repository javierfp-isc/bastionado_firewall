PROJECT="perimetral"

#Targets principales
#install: vagrantup
install: composeup

down: composedown

#delete: vagrantdelete
delete: composedelete

#start: vagrantstart
start: composestart

#stop: vagrantstop
stop: composestop

sh:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml exec ${service} bash

info:
	docker inspect ${PROJECT}_${service}_1

ls:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml ps

#Requisitos
vagrantup: composeup	
	cd /tmp && vagrant up
composeup:	
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d

vagrantdelete: composedelete vagrantsust
	cd /tmp && vagrant destroy -f
composedelete:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down --rmi all -v

composedown:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml down

vagrantstart: composestart vagrantsust
	cd /tmp && vagrant up
composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start	

vagrantstop: composestop vagrantsust
	cd /tmp && vagrant halt
composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop


