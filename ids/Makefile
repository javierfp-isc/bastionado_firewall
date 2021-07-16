PROJECT="perimetral"
SERVICES=rdi rde

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

restart: stop start

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
composedelete: composedown
	for s in ${SERVICES};do docker rmi -f ${PROJECT}_$$s;done

composedown:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml rm -f

vagrantstart: composestart
	cd /tmp && vagrant up
composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start	

vagrantstop: composestop
	cd /tmp && vagrant halt
composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop


