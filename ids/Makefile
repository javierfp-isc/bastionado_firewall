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

#Requisitos
vagrantup: composeup	
	cd /tmp && vagrant up
composeup:	
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml up -d

vagrantdelete: composedelete vagrantsust
	cd /tmp && vagrant destroy -f
composedelete: composedown
	docker rmi -f ${PROJECT}_rde

composedown:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml rm -f

vagrantstart: composestart vagrantsust
	cd /tmp && vagrant up
composestart:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml start	

vagrantstop: composestop vagrantsust
	cd /tmp && vagrant halt
composestop:
	docker-compose -p ${PROJECT} -f compose/docker-compose.yml stop


